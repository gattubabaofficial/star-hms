from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from sqlalchemy import func
from typing import List

from backend.database import get_db
from backend.models.opd import OutdReg, OutdHdr, OutdBill, OutdBlDctDtl, OutdRcpt, OutdRcDctDtl
from backend.models.masters import DoctMast
from backend.schemas.opd import (
    OutdRegCreate, OutdRegResponse,
    OutdHdrCreate, OutdHdrResponse,
    OutdRcptCreate, OutdRcptResponse
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
            **detail.model_dump(exclude={"ObdSno"}),
            ObdOhdCode=db_hdr.OhdCode,
            ObdSno=idx + 1
        )
        db.add(db_dtl)

    # Automatically insert doctor share record if doctor is specified
    if db_hdr.OhdCDctCode:
        dct = db.query(DoctMast).filter(DoctMast.DctCode == db_hdr.OhdCDctCode).first()
        dct_share = dct.DctShare if dct else 0.0
        net_amt = db_hdr.OhdTotalAmt - db_hdr.OhdDiscAmt
        db_dct_dtl = OutdBlDctDtl(
            OddOhdCode=db_hdr.OhdCode,
            OddDctCode=db_hdr.OhdCDctCode,
            OddSharePer=dct_share,
            OddShareAmt=(net_amt * dct_share) / 100.0,
            OddRecState=1
        )
        db.add(db_dct_dtl)

    db.commit()
    return db_hdr

# -----------------------------------------------------
# OPD Receipts
# -----------------------------------------------------
@router.get("/receipts", response_model=List[OutdRcptResponse])
def get_opd_receipts(db: Session = Depends(get_db)):
    return db.query(OutdRcpt).filter(OutdRcpt.OrcRecState == 1).order_by(OutdRcpt.OrcCode.desc()).limit(100).all()

@router.post("/receipts", response_model=OutdRcptResponse)
def create_opd_receipt(receipt_in: OutdRcptCreate, db: Session = Depends(get_db)):
    max_vch = db.query(func.max(OutdRcpt.OrcVchNo)).scalar() or 0
    new_vch = max_vch + 1

    db_rcpt = OutdRcpt(
        **receipt_in.model_dump(),
        OrcVchNo=new_vch
    )
    db.add(db_rcpt)
    db.commit()
    db.refresh(db_rcpt)

    # Doctor Share
    if db_rcpt.OrcCDctCode:
        dct = db.query(DoctMast).filter(DoctMast.DctCode == db_rcpt.OrcCDctCode).first()
        dct_share = dct.DctShare if dct else 0.0
        db_dct_dtl = OutdRcDctDtl(
            OrdOrcCode=db_rcpt.OrcCode,
            OrdDctCode=db_rcpt.OrcCDctCode,
            OrdSharePer=dct_share,
            OrdRecState=1
        )
        db.add(db_dct_dtl)
        db.commit()

    return db_rcpt

# -----------------------------------------------------
# OPD Payments & Refunds
# -----------------------------------------------------
from backend.schemas.opd import OpdPaymentRequest, OpdRefundRequest, OpdTransactionType
from backend.models.opd import OutdRcpt, OutdPymtHdr, OutdBlPymtHdr, OutdRefdHdr, OutdBlRefdHdr, OutdRgRefd

@router.post("/payments")
def create_opd_payment(payment: OpdPaymentRequest, db: Session = Depends(get_db)):
    if payment.transaction_type == OpdTransactionType.RECEIPT:
        receipt = db.query(OutdRcpt).filter(OutdRcpt.OrcVchNo == payment.ref_id).first()
        if not receipt:
            raise HTTPException(status_code=404, detail="Receipt not found")
        if receipt.OrcBalAmt < payment.amount:
            raise HTTPException(status_code=400, detail="Payment amount exceeds receipt balance")
        db_payment = OutdPymtHdr(OphOrcCode=receipt.OrcCode, OphAmt=payment.amount, OphDate=payment.date)
        db.add(db_payment)
        receipt.OrcBalAmt -= payment.amount
        receipt.OrcRecvdAmt += payment.amount
            
    elif payment.transaction_type == OpdTransactionType.BILL:
        bill = db.query(OutdHdr).filter(OutdHdr.OhdVchNo == payment.ref_id).first()
        if not bill:
            raise HTTPException(status_code=404, detail="Bill not found")
        if bill.OhdBalAmt < payment.amount:
            raise HTTPException(status_code=400, detail="Payment amount exceeds bill balance")
        db_payment = OutdBlPymtHdr(ObpOhdCode=bill.OhdCode, ObpAmt=payment.amount, ObpDate=payment.date)
        db.add(db_payment)
        bill.OhdBalAmt -= payment.amount
        bill.OhdDepAmt += payment.amount
            
    else:
        raise HTTPException(status_code=400, detail="Invalid transaction type for payment")
        
    db.commit()
    return {"message": "Payment recorded successfully", "vchNo": payment.ref_id}

@router.post("/refunds")
def create_opd_refund(refund: OpdRefundRequest, db: Session = Depends(get_db)):
    if refund.transaction_type == OpdTransactionType.RECEIPT:
        receipt = db.query(OutdRcpt).filter(OutdRcpt.OrcVchNo == refund.ref_id).first()
        if not receipt:
            raise HTTPException(status_code=404, detail="Receipt not found")
        if refund.amount > (receipt.OrcRecvdAmt - receipt.OrcRfugAmt):
            raise HTTPException(status_code=400, detail="Refund amount exceeds total paid amount")
        db_refund = OutdRefdHdr(OrhOrcCode=receipt.OrcCode, OrhAmt=refund.amount, OrhDate=refund.date)
        db.add(db_refund)
        receipt.OrcBalAmt += refund.amount
        receipt.OrcRfugAmt += refund.amount
            
    elif refund.transaction_type == OpdTransactionType.BILL:
        bill = db.query(OutdHdr).filter(OutdHdr.OhdVchNo == refund.ref_id).first()
        if not bill:
            raise HTTPException(status_code=404, detail="Bill not found")
        if refund.amount > (bill.OhdDepAmt - bill.OhdRfugAmt):
            raise HTTPException(status_code=400, detail="Refund amount exceeds total paid amount")
        db_refund = OutdBlRefdHdr(ObrOhdCode=bill.OhdCode, ObrAmt=refund.amount, ObrDate=refund.date)
        db.add(db_refund)
        bill.OhdBalAmt += refund.amount
        bill.OhdRfugAmt += refund.amount
            
    elif refund.transaction_type == OpdTransactionType.REGISTRATION:
        reg = db.query(OutdReg).filter(OutdReg.OpgVchNo == refund.ref_id).first()
        if not reg:
            raise HTTPException(status_code=404, detail="Registration not found")
        if refund.amount > (reg.OpgAmtAftDisc - reg.OpgRfugAmt):
            raise HTTPException(status_code=400, detail="Refund amount exceeds total paid amount")
        db_refund = OutdRgRefd(OrrOpgCode=reg.OpgCode, OrrAmt=refund.amount, OrrDate=refund.date)
        db.add(db_refund)
        reg.OpgRfugAmt += refund.amount
            
    else:
        raise HTTPException(status_code=400, detail="Invalid transaction type for refund")
        
    db.commit()
    return {"message": "Refund recorded successfully", "vchNo": refund.ref_id}
