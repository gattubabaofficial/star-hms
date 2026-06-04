from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from sqlalchemy import func
from typing import List

from backend.database import get_db
from backend.models.ipd import IndrHdr, IBedState, IndrBlHdr, IndrBill, IndrBlDctDtl
from backend.models.masters import DoctMast
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
            IbsIpgCode=db_hdr.IhdCode,
            IbsBdmCode=db_hdr.IhdBedCode,
            IbsDate=db_hdr.IhdDate,
            IbsPttCode=db_hdr.IhdPttCode,
            IbsRecState=1
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
            **detail.model_dump(exclude={"IbdSno"}),
            IbdIbhCode=db_hdr.IbhCode,
            IbdSno=idx + 1
        )
        db.add(db_dtl)

    # Optional: Mark admission as Discharged
    admin = db.query(IndrHdr).filter(IndrHdr.IhdCode == db_hdr.IbhIhdCode).first()
    if admin:
        admin.IhdStatus = 'Discharged'
        admin.IhdDischDate = db_hdr.IbhDate

        # Automatically inject Room Rent if bed is assigned
        if admin.IhdBedCode:
            from backend.services.ipd_billing import calculate_ipd_room_rent
            from backend.models.masters import BedMast
            from datetime import datetime
            
            # calculate room rent
            rent_data = calculate_ipd_room_rent(
                db=db,
                bed_code=admin.IhdBedCode,
                admission_date=datetime.combine(admin.IhdDate, datetime.min.time()),
                discharge_date=datetime.combine(db_hdr.IbhDate, datetime.min.time()) if db_hdr.IbhDate else datetime.now(),
                ihd_code=admin.IhdCode
            )
            
            # Find the service code for the bed
            bed_obj = db.query(BedMast).filter(BedMast.BdmCode == admin.IhdBedCode).first()
            srv_code = bed_obj.BdmSrvCode if bed_obj and bed_obj.BdmSrvCode else None
            
            # Only add if rent > 0
            if rent_data["total_rent"] > 0:
                rent_dtl = IndrBill(
                    IbdIbhCode=db_hdr.IbhCode,
                    IbdSno=len(bill_in.details) + 1,
                    IbdDate=db_hdr.IbhDate,
                    IbdIpgCode=admin.IhdCode,
                    IbdPttCode=admin.IhdPttCode,
                    IbdSrvCode=srv_code,
                    IbdUnit=rent_data["total_days"],
                    IbdRate=rent_data["rate_per_day"],
                    IbdAmtBefDisc=rent_data["total_rent"],
                    IbdDiscPer=0,
                    IbdDiscAmt=0,
                    IbdAmtAftDisc=rent_data["total_rent"],
                    IbdRecState=1,
                    IbdCmpCode=1
                )
                db.add(rent_dtl)
                db_hdr.IbhTotalAmt += rent_data["total_rent"]
                db_hdr.IbhNetAmt += rent_data["total_rent"]
                db_hdr.IbhBalAmt += rent_data["total_rent"]

        # Automatically insert doctor share record if doctor is specified on the admission
        if admin.IhdCDctCode:
            dct = db.query(DoctMast).filter(DoctMast.DctCode == admin.IhdCDctCode).first()
            dct_share = dct.DctShare if dct else 0.0
            db_dct_dtl = IndrBlDctDtl(
                IddIbhCode=db_hdr.IbhCode,
                IddDctCode=admin.IhdCDctCode,
                IddSharePer=dct_share,
                IddShareAmt=(db_hdr.IbhNetAmt * dct_share) / 100.0,
                IddRecState=1
            )
            db.add(db_dct_dtl)

        # Deposit Adjustments: Apply previously collected advances against the final bill
        if admin.IhdAdvAmt and admin.IhdAdvAmt > 0:
            from backend.models.ipd import IndrBlDpogDtl
            adj_amt = admin.IhdAdvAmt
            
            # Make sure we don't refund if advance > bill amount (refund is handled separately, just apply up to bill total)
            if adj_amt > db_hdr.IbhBalAmt:
                adj_amt = db_hdr.IbhBalAmt
                
            if adj_amt > 0:
                db_dpog = IndrBlDpogDtl(
                    IpdIbhCode=db_hdr.IbhCode,
                    IpdAmt=adj_amt,
                    IpdDate=db_hdr.IbhDate,
                    IpdRecState=1
                )
                db.add(db_dpog)
                
                # Adjust final bill totals
                db_hdr.IbhDepAmt += adj_amt
                db_hdr.IbhBalAmt -= adj_amt

    db.commit()
    db.refresh(db_hdr)
    return db_hdr

# -----------------------------------------------------
# IPD Payments & Refunds
# Uses legacy-matching field names from models/ipd.py:
#   IndrRgPymt: IgtCode, IgtIpgCode, IgtDpogAmt, IgtDate, IgtPttCode
#   IndrBlDpogDtl: IbpyICode, IbpyIbhCode, IbpyDepoAmt, IbpyDate
#   IndrRgRefd: IgfCode, IgfIpgCode, IgfRfugAmt, IgfDate, IgfPttCode
#   IndrBlRfugDtl: IbfdICode, IbfdIbhCode, IbfdRefuAmt, IbfdDate
# -----------------------------------------------------
from backend.schemas.ipd import IpdPaymentRequest, IpdRefundRequest, IpdTransactionType
from backend.models.ipd import IndrRgPymt, IndrBlDpogDtl, IndrRgRefd, IndrBlRfugDtl

@router.post("/payments")
def create_ipd_payment(payment: IpdPaymentRequest, db: Session = Depends(get_db)):
    if payment.transaction_type == IpdTransactionType.REGISTRATION:
        admin = db.query(IndrHdr).filter(IndrHdr.IhdVchNo == payment.ref_id).first()
        if not admin:
            raise HTTPException(status_code=404, detail="Admission not found")
        db_payment = IndrRgPymt(IgtIpgCode=admin.IhdCode, IgtDpogAmt=payment.amount, IgtDate=payment.date)
        db.add(db_payment)
        admin.IhdAdvAmt += payment.amount
            
    elif payment.transaction_type == IpdTransactionType.BILL:
        bill = db.query(IndrBlHdr).filter(IndrBlHdr.IbhVchNo == payment.ref_id).first()
        if not bill:
            raise HTTPException(status_code=404, detail="Bill not found")
        db_payment = IndrBlDpogDtl(IbpyIbhCode=bill.IbhCode, IbpyDepoAmt=payment.amount, IbpyDate=payment.date)
        db.add(db_payment)
        bill.IbhBalAmt -= payment.amount
        bill.IbhDepAmt += payment.amount
            
    else:
        raise HTTPException(status_code=400, detail="Invalid transaction type for IPD payment")
        
    db.commit()
    return {"message": "IPD Payment recorded successfully", "vchNo": payment.ref_id}

@router.post("/refunds")
def create_ipd_refund(refund: IpdRefundRequest, db: Session = Depends(get_db)):
    if refund.transaction_type == IpdTransactionType.REGISTRATION:
        admin = db.query(IndrHdr).filter(IndrHdr.IhdVchNo == refund.ref_id).first()
        if not admin:
            raise HTTPException(status_code=404, detail="Admission not found")
        db_refund = IndrRgRefd(IgfIpgCode=admin.IhdCode, IgfRfugAmt=refund.amount, IgfDate=refund.date)
        db.add(db_refund)
        admin.IhdAdvAmt -= refund.amount
            
    elif refund.transaction_type == IpdTransactionType.BILL:
        bill = db.query(IndrBlHdr).filter(IndrBlHdr.IbhVchNo == refund.ref_id).first()
        if not bill:
            raise HTTPException(status_code=404, detail="Bill not found")
        db_refund = IndrBlRfugDtl(IbfdIbhCode=bill.IbhCode, IbfdRefuAmt=refund.amount, IbfdDate=refund.date)
        db.add(db_refund)
        bill.IbhBalAmt += refund.amount
        bill.IbhRfugAmt += refund.amount
            
    else:
        raise HTTPException(status_code=400, detail="Invalid transaction type for IPD refund")
        
    db.commit()
    return {"message": "IPD Refund recorded successfully", "vchNo": refund.ref_id}

# -----------------------------------------------------
# Bed Status Visual Layout
# -----------------------------------------------------
from backend.models.masters import FloorMast, WardMast, BedMast, PatMast, DoctMast
from backend.schemas.ipd import BedStatusFloor, BedStatusWard, BedStatusBed, BedHistoryResponse
from datetime import datetime, date

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
    doctor_ids = [adm.IhdCDctCode for adm in admissions if adm.IhdCDctCode]
    
    patients = db.query(PatMast).filter(PatMast.PttCode.in_(patient_ids)).all() if patient_ids else []
    doctors = db.query(DoctMast).filter(DoctMast.DctCode.in_(doctor_ids)).all() if doctor_ids else []
    
    patient_map = {p.PttCode: p for p in patients}
    doctor_map = {d.DctCode: d.DctName for d in doctors}

    def calculate_age(dob: date):
        if not dob: return None
        today = date.today()
        return today.year - dob.year - ((today.month, today.day) < (dob.month, dob.day))

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
                    pat = patient_map.get(adm.IhdPttCode) if adm else None
                    
                    ward_beds.append(BedStatusBed(
                        BdmCode=bed.BdmCode,
                        BdmName=bed.BdmName,
                        BdmCharges=bed.BdmCharges,
                        is_occupied=bool(adm),
                        patient_id=adm.IhdPttCode if adm else None,
                        patient_name=pat.PttName if pat else None,
                        admission_id=adm.IhdCode if adm else None,
                        patient_age=str(calculate_age(pat.PttDob)) + 'y' if pat and pat.PttDob else None,
                        patient_sex=pat.PttSex if pat else None,
                        care_of=pat.PttRefName if pat else None,
                        attending_doctor=doctor_map.get(adm.IhdCDctCode) if adm else None,
                        expected_discharge_date=adm.IhdDischDate if adm else None
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

@router.get("/beds/{bed_code}/history", response_model=List[BedHistoryResponse])
def get_ipd_bed_history(bed_code: int, db: Session = Depends(get_db)):
    from backend.models.ipd import IBedState
    history = db.query(IBedState).filter(
        IBedState.IbsBdmCode == bed_code,
        IBedState.IbsRecState == 1
    ).order_by(IBedState.IbsCode.desc()).limit(50).all()
    
    patient_ids = [h.IbsPttCode for h in history if h.IbsPttCode]
    patients = db.query(PatMast.PttCode, PatMast.PttName).filter(PatMast.PttCode.in_(patient_ids)).all() if patient_ids else []
    patient_map = {p.PttCode: p.PttName for p in patients}
    
    response = []
    for h in history:
        status = 'Occupied'
        if h.IbsDischState == 1:
            status = 'Shifted/Discharged'
            
        response.append(BedHistoryResponse(
            IbsCode=h.IbsCode,
            admission_id=h.IbsIpgCode,
            patient_name=patient_map.get(h.IbsPttCode, 'Unknown'),
            start_date=h.IbsDate,
            end_date=h.IbsDischDate,
            status=status
        ))
        
    return response

# -----------------------------------------------------
# IPD Room Rent Preview
# -----------------------------------------------------
from datetime import datetime
from backend.services.ipd_billing import calculate_ipd_room_rent
from backend.schemas.ipd import RoomRentPreview

@router.get("/room-rent-preview", response_model=RoomRentPreview)
def preview_ipd_room_rent(
    bed_code: int,
    admission_date: datetime,
    discharge_date: datetime = None,
    db: Session = Depends(get_db)
):
    try:
        result = calculate_ipd_room_rent(
            db=db,
            bed_code=bed_code,
            admission_date=admission_date,
            discharge_date=discharge_date
        )
        return result
    except ValueError as e:
        raise HTTPException(status_code=404, detail=str(e))
    except Exception as e:
        raise HTTPException(status_code=500, detail="An error occurred while calculating room rent")

# -----------------------------------------------------
# Phase 5: IPD Bed Transfers & Advances
# -----------------------------------------------------
from backend.schemas.ipd import BedTransferRequest, IpdAdvanceRequest
from backend.models.ipd import IBedState, IndrReg, IndrRgPymt
from backend.models.masters import BedMast
from datetime import datetime

@router.post("/admissions/{ihd_code}/transfer")
def transfer_patient_bed(ihd_code: int, transfer: BedTransferRequest, db: Session = Depends(get_db)):
    admin = db.query(IndrHdr).filter(IndrHdr.IhdCode == ihd_code).first()
    if not admin:
        raise HTTPException(status_code=404, detail="Admission not found")

    # Close current bed state
    current_state = db.query(IBedState).filter(
        IBedState.IbsIpgCode == ihd_code,
        IBedState.IbsDischState.is_(None)
    ).first()

    if current_state:
        current_state.IbsDischDate = transfer.transfer_date
        current_state.IbsDischTime = int(datetime.now().strftime('%H%M'))
        current_state.IbsDischState = 1

    # Fetch new bed info
    new_bed = db.query(BedMast).filter(BedMast.BdmCode == transfer.new_bed_code).first()
    if not new_bed:
        raise HTTPException(status_code=404, detail="New bed not found")

    # Create new bed state
    new_state = IBedState(
        IbsIpgCode=ihd_code,
        IbsBdmCode=transfer.new_bed_code,
        IbsDate=transfer.transfer_date,
        IbsTime=int(datetime.now().strftime('%H%M')),
        IbsPttCode=admin.IhdPttCode,
        IbsRecState=1
    )
    db.add(new_state)

    # Update Admission Header
    admin.IhdBedCode = transfer.new_bed_code
    admin.IhdWrdCode = new_bed.BdmWrdCode
    admin.IhdFlrCode = new_bed.BdmFlrCode

    db.commit()
    return {"message": "Patient transferred successfully", "new_bed_code": transfer.new_bed_code}


@router.post("/advances")
def create_ipd_advance(advance: IpdAdvanceRequest, db: Session = Depends(get_db)):
    admin = db.query(IndrHdr).filter(IndrHdr.IhdCode == advance.ihd_code).first()
    if not admin:
        raise HTTPException(status_code=404, detail="Admission not found")

    # Create IndrReg Header (Advance Receipt)
    max_vch = db.query(func.max(IndrReg.IpgVchNo)).scalar() or 0
    new_vch = max_vch + 1

    reg = IndrReg(
        IpgVchNo=new_vch,
        IpgDate=advance.date,
        IpgPttCode=admin.IhdPttCode,
        IpgCDctCode=admin.IhdCDctCode,
        IpgAdvAmt=advance.amount,
        IpgRecState=1
    )
    db.add(reg)
    db.flush()

    # Create IndrRgPymt (Payment Log)
    max_pymt_vch = db.query(func.max(IndrRgPymt.IgtVchNo)).scalar() or 0
    pymt_vch = max_pymt_vch + 1

    pymt = IndrRgPymt(
        IgtIpgCode=reg.IpgCode,
        IgtVchNo=pymt_vch,
        IgtDate=advance.date,
        IgtDpogAmt=advance.amount,
        IgtRecState=1
    )
    db.add(pymt)

    # Roll up the advance into Admission Header
    admin.IhdAdvAmt += advance.amount

    db.commit()
    return {"message": "Advance processed successfully", "vchNo": new_vch}
