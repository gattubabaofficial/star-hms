from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from sqlalchemy import func
from typing import List

from backend.database import get_db
from backend.models.ipd import IndrHdr, IBedState, IndrBlHdr, IndrBill
from backend.schemas.ipd import (
    IndrHdrCreate, IndrHdrResponse,
    IndrBlHdrCreate, IndrBlHdrResponse
)

router = APIRouter()

# -----------------------------------------------------
# IPD Admissions
# -----------------------------------------------------
@router.get("/admissions", response_model=List[IndrHdrResponse])
def get_ipd_admissions(db: Session = Depends(get_db)):
    return db.query(IndrHdr).filter(IndrHdr.IhdRecState == 1).order_by(IndrHdr.IhdCode.desc()).limit(100).all()

@router.post("/admissions", response_model=IndrHdrResponse)
def create_ipd_admission(admin_in: IndrHdrCreate, db: Session = Depends(get_db)):
    # Auto-generate VchNo
    max_vch = db.query(func.max(IndrHdr.IhdVchNo)).scalar() or 0
    new_vch = max_vch + 1

    db_hdr = IndrHdr(
        **admin_in.model_dump(),
        IhdVchNo=new_vch
    )
    db.add(db_hdr)
    db.flush() # flush to get IhdCode

    # Create initial Bed State if Bed is selected
    if db_hdr.IhdBedCode:
        db_bed_state = IBedState(
            IbbsICode=db_hdr.IhdCode,
            IbbsIbsCode=db_hdr.IhdBedCode,
            IbbsFromDate=db_hdr.IhdDate
        )
        db.add(db_bed_state)

    db.commit()
    db.refresh(db_hdr)
    return db_hdr

# -----------------------------------------------------
# IPD Billing
# -----------------------------------------------------
@router.get("/bills", response_model=List[IndrBlHdrResponse])
def get_ipd_bills(db: Session = Depends(get_db)):
    return db.query(IndrBlHdr).filter(IndrBlHdr.IbhRecState == 1).order_by(IndrBlHdr.IbhCode.desc()).limit(100).all()

@router.post("/bills", response_model=IndrBlHdrResponse)
def create_ipd_bill(bill_in: IndrBlHdrCreate, db: Session = Depends(get_db)):
    # Auto-generate VchNo for the bill
    max_vch = db.query(func.max(IndrBlHdr.IbhVchNo)).scalar() or 0
    new_vch = max_vch + 1

    header_data = bill_in.model_dump(exclude={"details"})
    
    db_hdr = IndrBlHdr(
        **header_data,
        IbhVchNo=new_vch
    )
    db.add(db_hdr)
    db.flush()

    # Insert Details
    for idx, detail in enumerate(bill_in.details):
        db_dtl = IndrBill(
            **detail.model_dump(),
            IbdIbhCode=db_hdr.IbhCode,
            IbdSno=idx + 1
        )
        db.add(db_dtl)

    # Optional: Mark admission as Discharged
    admin = db.query(IndrHdr).filter(IndrHdr.IhdCode == db_hdr.IbhIhdCode).first()
    if admin:
        admin.IhdStatus = 'Discharged'
        admin.IhdDischDate = db_hdr.IbhDate

    db.commit()
    db.refresh(db_hdr)
    return db_hdr

# -----------------------------------------------------
# IPD Payments & Refunds
# -----------------------------------------------------
from backend.schemas.ipd import IpdPaymentRequest, IpdRefundRequest, IpdTransactionType
from backend.models.ipd import IndrRgPymt, IndrBlDpogDtl, IndrRgRefd, IndrBlRfugDtl

@router.post("/payments")
def create_ipd_payment(payment: IpdPaymentRequest, db: Session = Depends(get_db)):
    if payment.transaction_type == IpdTransactionType.REGISTRATION:
        db_payment = IndrRgPymt(IrpIhdCode=payment.ref_id, IrpAmt=payment.amount, IrpDate=payment.date)
        db.add(db_payment)
        # Update admission advance
        admin = db.query(IndrHdr).filter(IndrHdr.IhdCode == payment.ref_id).first()
        if admin:
            admin.IhdAdvAmt += payment.amount
            
    elif payment.transaction_type == IpdTransactionType.BILL:
        # Deposit against bill
        db_payment = IndrBlDpogDtl(IbpIbhCode=payment.ref_id, IbpAmt=payment.amount, IbpDate=payment.date)
        db.add(db_payment)
        # Update bill balance
        bill = db.query(IndrBlHdr).filter(IndrBlHdr.IbhCode == payment.ref_id).first()
        if bill:
            bill.IbhBalAmt -= payment.amount
            bill.IbhDepAmt += payment.amount
            
    else:
        raise HTTPException(status_code=400, detail="Invalid transaction type for IPD payment")
        
    db.commit()
    return {"message": "IPD Payment recorded successfully"}

@router.post("/refunds")
def create_ipd_refund(refund: IpdRefundRequest, db: Session = Depends(get_db)):
    if refund.transaction_type == IpdTransactionType.REGISTRATION:
        db_refund = IndrRgRefd(IrfIhdCode=refund.ref_id, IrfAmt=refund.amount, IrfDate=refund.date)
        db.add(db_refund)
        admin = db.query(IndrHdr).filter(IndrHdr.IhdCode == refund.ref_id).first()
        if admin:
            # Advance refunds reduce the total advance amount
            admin.IhdAdvAmt -= refund.amount
            
    elif refund.transaction_type == IpdTransactionType.BILL:
        db_refund = IndrBlRfugDtl(IbrIbhCode=refund.ref_id, IbrAmt=refund.amount, IbrDate=refund.date)
        db.add(db_refund)
        bill = db.query(IndrBlHdr).filter(IndrBlHdr.IbhCode == refund.ref_id).first()
        if bill:
            # Refunds increase the balance again
            bill.IbhBalAmt += refund.amount
            
    else:
        raise HTTPException(status_code=400, detail="Invalid transaction type for IPD refund")
        
    db.commit()
    return {"message": "IPD Refund recorded successfully"}

# -----------------------------------------------------
# Bed Status Visual Layout
# -----------------------------------------------------
from backend.models.masters import FloorMast, WardMast, BedMast, PatMast
from backend.schemas.ipd import BedStatusFloor, BedStatusWard, BedStatusBed

@router.get("/bed-status", response_model=List[BedStatusFloor])
def get_ipd_bed_status(db: Session = Depends(get_db)):
    # 1. Fetch active admitted patients
    admissions = db.query(IndrHdr).filter(
        IndrHdr.IhdRecState == 1,
        IndrHdr.IhdStatus == 'Admitted',
        IndrHdr.IhdBedCode != None
    ).all()
    
    occupied_beds = {adm.IhdBedCode: adm for adm in admissions}
    
    patient_ids = [adm.IhdPttCode for adm in admissions if adm.IhdPttCode]
    patients = db.query(PatMast.PttCode, PatMast.PttName).filter(PatMast.PttCode.in_(patient_ids)).all() if patient_ids else []
    patient_map = {p.PttCode: p.PttName for p in patients}

    # 2. Fetch all active floors, wards, and beds
    floors = db.query(FloorMast).filter(FloorMast.FlrRecState == 1).order_by(FloorMast.FlrCode).all()
    wards = db.query(WardMast).filter(WardMast.WrdRecState == 1).order_by(WardMast.WrdCode).all()
    beds = db.query(BedMast).filter(BedMast.BdmRecState == 1).order_by(BedMast.BdmIndex).all()

    # 3. Aggregate
    response = []
    for floor in floors:
        floor_wards = []
        for ward in wards:
            ward_beds = []
            for bed in beds:
                if bed.BdmFlrCode == floor.FlrCode and bed.BdmWrdCode == ward.WrdCode:
                    adm = occupied_beds.get(bed.BdmCode)
                    ward_beds.append(BedStatusBed(
                        BdmCode=bed.BdmCode,
                        BdmName=bed.BdmName,
                        BdmCharges=bed.BdmCharges,
                        is_occupied=bool(adm),
                        patient_id=adm.IhdPttCode if adm else None,
                        patient_name=patient_map.get(adm.IhdPttCode) if adm else None,
                        admission_id=adm.IhdCode if adm else None
                    ))
            if ward_beds:
                floor_wards.append(BedStatusWard(
                    WrdCode=ward.WrdCode,
                    WrdName=ward.WrdName,
                    beds=ward_beds
                ))
        if floor_wards:
            response.append(BedStatusFloor(
                FlrCode=floor.FlrCode,
                FlrName=floor.FlrName,
                wards=floor_wards
            ))

    return response
