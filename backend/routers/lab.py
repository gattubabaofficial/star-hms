from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from sqlalchemy import func
from typing import List

from backend.database import get_db
from backend.models.lab import LabHdr, LabRcpt
from backend.schemas.lab import LabHdrCreate, LabHdrResponse

router = APIRouter()

@router.get("/registrations", response_model=List[LabHdrResponse])
def get_lab_registrations(db: Session = Depends(get_db)):
    return db.query(LabHdr).filter(LabHdr.LhdRecState == 1).order_by(LabHdr.LhdCode.desc()).limit(100).all()

@router.post("/registrations", response_model=LabHdrResponse)
def create_lab_registration(reg_in: LabHdrCreate, db: Session = Depends(get_db)):
    max_vch = db.query(func.max(LabHdr.LhdVchNo)).scalar() or 0
    new_vch = max_vch + 1

    header_data = reg_in.model_dump(exclude={"details"})
    db_hdr = LabHdr(**header_data, LhdVchNo=new_vch)
    db.add(db_hdr)
    db.flush()

    for idx, detail in enumerate(reg_in.details):
        db_dtl = LabRcpt(
            **detail.model_dump(),
            LrdLhdCode=db_hdr.LhdCode,
            LrdSno=idx + 1
        )
        db.add(db_dtl)

    db.commit()
    db.refresh(db_hdr)
    return db_hdr

# -----------------------------------------------------
# Lab Payments & Refunds
# -----------------------------------------------------
from backend.schemas.lab import LabPaymentRequest, LabRefundRequest, LabTransactionType
from backend.models.lab import LabPymtHdr, LabRefdHdr

@router.post("/payments")
def create_lab_payment(payment: LabPaymentRequest, db: Session = Depends(get_db)):
    if payment.transaction_type == LabTransactionType.RECEIPT:
        db_payment = LabPymtHdr(LphLhdCode=payment.ref_id, LphAmt=payment.amount, LphDate=payment.date)
        db.add(db_payment)
        # Update lab header balance
        lab_hdr = db.query(LabHdr).filter(LabHdr.LhdCode == payment.ref_id).first()
        if lab_hdr:
            lab_hdr.LhdBalAmt -= payment.amount
            lab_hdr.LhdRecvdAmt += payment.amount
            
    else:
        raise HTTPException(status_code=400, detail="Invalid transaction type for Lab payment")
        
    db.commit()
    return {"message": "Lab Payment recorded successfully"}

@router.post("/refunds")
def create_lab_refund(refund: LabRefundRequest, db: Session = Depends(get_db)):
    if refund.transaction_type == LabTransactionType.RECEIPT:
        db_refund = LabRefdHdr(LrhLhdCode=refund.ref_id, LrhAmt=refund.amount, LrhDate=refund.date)
        db.add(db_refund)
        lab_hdr = db.query(LabHdr).filter(LabHdr.LhdCode == refund.ref_id).first()
        if lab_hdr:
            lab_hdr.LhdBalAmt += refund.amount
            lab_hdr.LhdRfugAmt += refund.amount
            
    else:
        raise HTTPException(status_code=400, detail="Invalid transaction type for Lab refund")
        
    db.commit()
    return {"message": "Lab Refund recorded successfully"}
