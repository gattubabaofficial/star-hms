from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.orm import Session
from typing import List
import datetime
from backend.database import get_db
from backend.models import OPDRegistration, OPDBill, Patient, Doctor
from backend.schemas import OPDRegistrationCreate, OPDRegistrationResponse, OPDBillCreate, OPDBillResponse
from backend.core.dependencies import get_current_active_user

router = APIRouter()

@router.post("/registrations", response_model=OPDRegistrationResponse)
def create_opd_registration(schema: OPDRegistrationCreate, db: Session = Depends(get_db), current_user = Depends(get_current_active_user)):
    # Verify patient & doctor exist
    ptt = db.query(Patient).filter(Patient.ptt_code == schema.opg_ptt_code, Patient.ptt_rec_state == 1).first()
    if not ptt:
        raise HTTPException(status_code=404, detail="Patient not found")
    dct = db.query(Doctor).filter(Doctor.dct_code == schema.opg_dct_code, Doctor.dct_rec_state == 1).first()
    if not dct:
        raise HTTPException(status_code=404, detail="Doctor not found")

    db_reg = OPDRegistration(**schema.model_dump())
    db.add(db_reg)
    db.commit()
    db.refresh(db_reg)
    return db_reg

@router.get("/registrations", response_model=List[OPDRegistrationResponse])
def get_opd_registrations(db: Session = Depends(get_db)):
    return db.query(OPDRegistration).filter(OPDRegistration.opg_rec_state == 1).order_by(OPDRegistration.opg_visit_date.desc()).all()

@router.post("/bills", response_model=OPDBillResponse)
def create_opd_bill(schema: OPDBillCreate, db: Session = Depends(get_db), current_user = Depends(get_current_active_user)):
    # Verify registration exists
    reg = db.query(OPDRegistration).filter(OPDRegistration.opg_code == schema.opg_code).first()
    if not reg:
        raise HTTPException(status_code=404, detail="OPD Registration not found")

    # Generate unique bill number
    today_str = datetime.date.today().strftime("%Y%m%d")
    bill_count = db.query(OPDBill).filter(OPDBill.bill_no.like(f"OPD-{today_str}-%")).count()
    bill_no = f"OPD-{today_str}-{(bill_count + 1):04d}"

    db_bill = OPDBill(
        bill_no=bill_no,
        opg_code=schema.opg_code,
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

@router.get("/bills/{bill_id}", response_model=OPDBillResponse)
def get_opd_bill(bill_id: int, db: Session = Depends(get_db)):
    bill = db.query(OPDBill).filter(OPDBill.bill_id == bill_id).first()
    if not bill:
        raise HTTPException(status_code=404, detail="Bill not found")
    return bill
