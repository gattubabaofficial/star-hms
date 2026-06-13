from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.orm import Session
from typing import List
import datetime
from backend.database import get_db
from backend.models import IPDAdmission, IPDBill, Patient, Doctor, Bed
from backend.schemas import IPDAdmissionCreate, IPDAdmissionResponse, IPDBillCreate, IPDBillResponse
from backend.core.dependencies import get_current_active_user

router = APIRouter()

@router.post("/admissions", response_model=IPDAdmissionResponse)
def create_ipd_admission(schema: IPDAdmissionCreate, db: Session = Depends(get_db), current_user = Depends(get_current_active_user)):
    # Verify patient & doctor & bed
    ptt = db.query(Patient).filter(Patient.ptt_code == schema.ipd_ptt_code, Patient.ptt_rec_state == 1).first()
    if not ptt:
        raise HTTPException(status_code=404, detail="Patient not found")
    dct = db.query(Doctor).filter(Doctor.dct_code == schema.ipd_dct_code, Doctor.dct_rec_state == 1).first()
    if not dct:
        raise HTTPException(status_code=404, detail="Doctor not found")
    bed = db.query(Bed).filter(Bed.bdm_code == schema.ipd_bdm_code, Bed.bdm_rec_state == 1).first()
    if not bed:
        raise HTTPException(status_code=404, detail="Bed not found")
    if bed.is_occupied:
        raise HTTPException(status_code=400, detail="Selected bed is already occupied")

    db_adm = IPDAdmission(**schema.model_dump())
    # Mark bed as occupied
    bed.is_occupied = True
    
    db.add(db_adm)
    db.commit()
    db.refresh(db_adm)
    return db_adm

@router.get("/admissions", response_model=List[IPDAdmissionResponse])
def get_ipd_admissions(db: Session = Depends(get_db)):
    return db.query(IPDAdmission).filter(IPDAdmission.ipd_rec_state == 1).order_by(IPDAdmission.ipd_admission_date.desc()).all()

@router.post("/discharge/{ipd_code}", response_model=IPDAdmissionResponse)
def discharge_patient(ipd_code: int, db: Session = Depends(get_db), current_user = Depends(get_current_active_user)):
    adm = db.query(IPDAdmission).filter(IPDAdmission.ipd_code == ipd_code, IPDAdmission.ipd_rec_state == 1).first()
    if not adm:
        raise HTTPException(status_code=404, detail="IPD Admission log not found")
    if adm.ipd_status == "discharged":
        raise HTTPException(status_code=400, detail="Patient is already discharged")

    # Set status and discharge date
    adm.ipd_status = "discharged"
    adm.ipd_discharge_date = datetime.datetime.utcnow()
    
    # Free the bed
    bed = db.query(Bed).filter(Bed.bdm_code == adm.ipd_bdm_code).first()
    if bed:
        bed.is_occupied = False

    db.commit()
    db.refresh(adm)
    return adm

@router.post("/bills", response_model=IPDBillResponse)
def create_ipd_bill(schema: IPDBillCreate, db: Session = Depends(get_db), current_user = Depends(get_current_active_user)):
    # Verify admission log
    adm = db.query(IPDAdmission).filter(IPDAdmission.ipd_code == schema.ipd_code).first()
    if not adm:
        raise HTTPException(status_code=404, detail="IPD Admission log not found")

    # Generate unique bill number
    today_str = datetime.date.today().strftime("%Y%m%d")
    bill_count = db.query(IPDBill).filter(IPDBill.bill_no.like(f"IPD-{today_str}-%")).count()
    bill_no = f"IPD-{today_str}-{(bill_count + 1):04d}"

    db_bill = IPDBill(
        bill_no=bill_no,
        ipd_code=schema.ipd_code,
        room_charges=schema.room_charges,
        service_charges=schema.service_charges,
        total_amount=schema.total_amount,
        discount_amount=schema.discount_amount,
        net_amount=schema.net_amount,
        paid_amount=schema.paid_amount,
        status=schema.status
    )
    db.add(db_bill)
    db.commit()
    db.refresh(db_bill)
    return db_bill

@router.get("/bills/{bill_id}", response_model=IPDBillResponse)
def get_ipd_bill(bill_id: int, db: Session = Depends(get_db)):
    bill = db.query(IPDBill).filter(IPDBill.bill_id == bill_id).first()
    if not bill:
        raise HTTPException(status_code=404, detail="Bill not found")
    return bill
