from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from sqlalchemy import func
from typing import List

from backend.database import get_db
from backend.models.opd import OutdReg, OutdHdr, OutdBill
from backend.schemas.opd import (
    OutdRegCreate, OutdRegResponse,
    OutdHdrCreate, OutdHdrResponse
)

router = APIRouter()

# -----------------------------------------------------
# OPD Registration
# -----------------------------------------------------
@router.get("/registrations", response_model=List[OutdRegResponse])
def get_opd_registrations(db: Session = Depends(get_db)):
    # In a real app, you would filter by today's date or add pagination.
    return db.query(OutdReg).filter(OutdReg.OpgRecState == 1).order_by(OutdReg.OpgCode.desc()).limit(100).all()

@router.post("/registrations", response_model=OutdRegResponse)
def create_opd_registration(reg_in: OutdRegCreate, db: Session = Depends(get_db)):
    # Auto-generate VchNo
    max_vch = db.query(func.max(OutdReg.OpgVchNo)).scalar() or 0
    new_vch = max_vch + 1

    db_reg = OutdReg(
        **reg_in.model_dump(),
        OpgVchNo=new_vch
    )
    db.add(db_reg)
    db.commit()
    db.refresh(db_reg)
    return db_reg

# -----------------------------------------------------
# OPD Billing
# -----------------------------------------------------
@router.get("/bills", response_model=List[OutdHdrResponse])
def get_opd_bills(db: Session = Depends(get_db)):
    return db.query(OutdHdr).filter(OutdHdr.OhdRecState == 1).order_by(OutdHdr.OhdCode.desc()).limit(100).all()

@router.post("/bills", response_model=OutdHdrResponse)
def create_opd_bill(bill_in: OutdHdrCreate, db: Session = Depends(get_db)):
    # Auto-generate VchNo for the bill
    max_vch = db.query(func.max(OutdHdr.OhdVchNo)).scalar() or 0
    new_vch = max_vch + 1

    header_data = bill_in.model_dump(exclude={"details"})
    
    db_hdr = OutdHdr(
        **header_data,
        OhdVchNo=new_vch
    )
    db.add(db_hdr)
    db.commit()
    db.refresh(db_hdr)

    # Insert Details
    for idx, detail in enumerate(bill_in.details):
        db_dtl = OutdBill(
            **detail.model_dump(),
            ObdOhdCode=db_hdr.OhdCode,
            ObdSno=idx + 1
        )
        db.add(db_dtl)

    db.commit()
    return db_hdr

# -----------------------------------------------------
# OPD Payments & Refunds
# -----------------------------------------------------
from backend.schemas.opd import OpdPaymentRequest, OpdRefundRequest, OpdTransactionType
from backend.models.opd import OutdRcpt, OutdPymtHdr, OutdBlPymtHdr, OutdRefdHdr, OutdBlRefdHdr, OutdRgRefd

@router.post("/payments")
def create_opd_payment(payment: OpdPaymentRequest, db: Session = Depends(get_db)):
    if payment.transaction_type == OpdTransactionType.RECEIPT:
        db_payment = OutdPymtHdr(OphOrcCode=payment.ref_id, OphAmt=payment.amount, OphDate=payment.date)
        db.add(db_payment)
        # Update receipt balance
        receipt = db.query(OutdRcpt).filter(OutdRcpt.OrcCode == payment.ref_id).first()
        if receipt:
            receipt.OrcBalAmt -= payment.amount
            receipt.OrcRecvdAmt += payment.amount
            
    elif payment.transaction_type == OpdTransactionType.BILL:
        db_payment = OutdBlPymtHdr(ObpOhdCode=payment.ref_id, ObpAmt=payment.amount, ObpDate=payment.date)
        db.add(db_payment)
        # Update bill balance
        bill = db.query(OutdHdr).filter(OutdHdr.OhdCode == payment.ref_id).first()
        if bill:
            bill.OhdBalAmt -= payment.amount
            bill.OhdDepAmt += payment.amount
            
    else:
        raise HTTPException(status_code=400, detail="Invalid transaction type for payment")
        
    db.commit()
    return {"message": "Payment recorded successfully"}

@router.post("/refunds")
def create_opd_refund(refund: OpdRefundRequest, db: Session = Depends(get_db)):
    if refund.transaction_type == OpdTransactionType.RECEIPT:
        db_refund = OutdRefdHdr(OrhOrcCode=refund.ref_id, OrhAmt=refund.amount, OrhDate=refund.date)
        db.add(db_refund)
        receipt = db.query(OutdRcpt).filter(OutdRcpt.OrcCode == refund.ref_id).first()
        if receipt:
            receipt.OrcBalAmt += refund.amount
            receipt.OrcRfugAmt += refund.amount
            
    elif refund.transaction_type == OpdTransactionType.BILL:
        db_refund = OutdBlRefdHdr(ObrOhdCode=refund.ref_id, ObrAmt=refund.amount, ObrDate=refund.date)
        db.add(db_refund)
        bill = db.query(OutdHdr).filter(OutdHdr.OhdCode == refund.ref_id).first()
        if bill:
            bill.OhdBalAmt += refund.amount
            bill.OhdRfugAmt += refund.amount
            
    elif refund.transaction_type == OpdTransactionType.REGISTRATION:
        db_refund = OutdRgRefd(OrrOpgCode=refund.ref_id, OrrAmt=refund.amount, OrrDate=refund.date)
        db.add(db_refund)
        reg = db.query(OutdReg).filter(OutdReg.OpgCode == refund.ref_id).first()
        if reg:
            reg.OpgRfugAmt += refund.amount
            
    else:
        raise HTTPException(status_code=400, detail="Invalid transaction type for refund")
        
    db.commit()
    return {"message": "Refund recorded successfully"}
