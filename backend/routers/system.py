from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from sqlalchemy import func
import datetime
from backend.database import get_db, Base, engine
from backend.models import Patient, Doctor, Bed, OPDRegistration, IPDAdmission, OPDBill, IPDBill
from backend.schemas import DashboardStats
from backend.core.dependencies import get_current_active_user

router = APIRouter()

@router.get("/dashboard-stats", response_model=DashboardStats)
def get_dashboard_stats(db: Session = Depends(get_db)):
    total_patients = db.query(Patient).filter(Patient.ptt_rec_state != 0).count()
    total_doctors = db.query(Doctor).filter(Doctor.dct_rec_state != 0).count()
    total_beds = db.query(Bed).filter(Bed.bdm_rec_state != 0).count()
    occupied_beds = db.query(Bed).filter(Bed.bdm_rec_state != 0, Bed.is_occupied == True).count()
    
    today_start = datetime.datetime.combine(datetime.date.today(), datetime.time.min)
    today_end = datetime.datetime.combine(datetime.date.today(), datetime.time.max)
    
    opd_today = db.query(OPDRegistration).filter(
        OPDRegistration.opg_rec_state != 0,
        OPDRegistration.opg_visit_date >= today_start,
        OPDRegistration.opg_visit_date <= today_end
    ).count()
    
    ipd_today = db.query(IPDAdmission).filter(
        IPDAdmission.ipd_rec_state != 0,
        IPDAdmission.ipd_admission_date >= today_start,
        IPDAdmission.ipd_admission_date <= today_end
    ).count()
    
    # Calculate revenue today
    opd_rev = db.query(func.sum(OPDBill.paid_amount)).filter(
        OPDBill.created_at >= today_start,
        OPDBill.created_at <= today_end
    ).scalar() or 0.0
    
    ipd_rev = db.query(func.sum(IPDBill.paid_amount)).filter(
        IPDBill.created_at >= today_start,
        IPDBill.created_at <= today_end
    ).scalar() or 0.0
    
    # Also count admissions initial deposit paid today
    dep_rev = db.query(func.sum(IPDAdmission.ipd_deposit)).filter(
        IPDAdmission.ipd_admission_date >= today_start,
        IPDAdmission.ipd_admission_date <= today_end
    ).scalar() or 0.0
    
    total_revenue_today = float(opd_rev + ipd_rev + dep_rev)
    
    return DashboardStats(
        total_patients=total_patients,
        total_doctors=total_doctors,
        total_beds=total_beds,
        occupied_beds=occupied_beds,
        opd_today_count=opd_today,
        ipd_today_count=ipd_today,
        total_revenue_today=total_revenue_today
    )

@router.post("/reset-db")
def reset_database(db: Session = Depends(get_db), current_user = Depends(get_current_active_user)):
    # Drop all tables and recreate them to start completely fresh
    # Warning: Admin credentials will need to be setup again by calling /setup-admin
    Base.metadata.drop_all(bind=engine)
    Base.metadata.create_all(bind=engine)
    return {"message": "Database has been reset successfully. Please run /setup-admin to re-create the admin account."}
