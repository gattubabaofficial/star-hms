from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.orm import Session
from typing import List, Optional
from backend.database import get_db
from backend.models import (
    PatientCategory, Patient, DoctorCategory, DoctorRole, Doctor,
    Floor, Ward, Bed, ServiceGroup, Service
)
from backend.schemas import (
    PatientCategoryCreate, PatientCategoryResponse,
    PatientCreate, PatientResponse,
    DoctorCategoryCreate, DoctorCategoryResponse,
    DoctorRoleCreate, DoctorRoleResponse,
    DoctorCreate, DoctorResponse,
    FloorCreate, FloorResponse,
    WardCreate, WardResponse,
    BedCreate, BedResponse,
    ServiceGroupCreate, ServiceGroupResponse,
    ServiceCreate, ServiceResponse
)
from backend.core.dependencies import get_current_active_user

router = APIRouter()

# Patient Categories
@router.post("/patient-categories", response_model=PatientCategoryResponse)
def create_patient_category(schema: PatientCategoryCreate, db: Session = Depends(get_db), current_user = Depends(get_current_active_user)):
    db_cat = PatientCategory(**schema.model_dump())
    db.add(db_cat)
    db.commit()
    db.refresh(db_cat)
    return db_cat

@router.get("/patient-categories", response_model=List[PatientCategoryResponse])
def get_patient_categories(db: Session = Depends(get_db)):
    return db.query(PatientCategory).filter(PatientCategory.pcg_rec_state != 0).all()

# Patients
@router.post("/patients", response_model=PatientResponse)
def create_patient(schema: PatientCreate, db: Session = Depends(get_db), current_user = Depends(get_current_active_user)):
    # Calculate reg number if not provided
    if not schema.ptt_reg_no:
        max_reg = db.query(Patient.ptt_reg_no).order_by(Patient.ptt_reg_no.desc()).first()
        schema.ptt_reg_no = (max_reg[0] + 1) if max_reg and max_reg[0] else 10001
        
    db_patient = Patient(**schema.model_dump())
    db.add(db_patient)
    db.commit()
    db.refresh(db_patient)
    return db_patient

@router.get("/patients", response_model=List[PatientResponse])
def get_patients(db: Session = Depends(get_db)):
    return db.query(Patient).filter(Patient.ptt_rec_state != 0).all()

@router.get("/patients/{ptt_code}", response_model=PatientResponse)
def get_patient(ptt_code: int, db: Session = Depends(get_db)):
    patient = db.query(Patient).filter(Patient.ptt_code == ptt_code, Patient.ptt_rec_state != 0).first()
    if not patient:
        raise HTTPException(status_code=404, detail="Patient not found")
    return patient

# Doctor Categories
@router.post("/doctor-categories", response_model=DoctorCategoryResponse)
def create_doctor_category(schema: DoctorCategoryCreate, db: Session = Depends(get_db), current_user = Depends(get_current_active_user)):
    db_cat = DoctorCategory(**schema.model_dump())
    db.add(db_cat)
    db.commit()
    db.refresh(db_cat)
    return db_cat

@router.get("/doctor-categories", response_model=List[DoctorCategoryResponse])
def get_doctor_categories(db: Session = Depends(get_db)):
    return db.query(DoctorCategory).filter(DoctorCategory.dcg_rec_state != 0).all()

# Doctor Roles
@router.post("/doctor-roles", response_model=DoctorRoleResponse)
def create_doctor_role(schema: DoctorRoleCreate, db: Session = Depends(get_db), current_user = Depends(get_current_active_user)):
    db_role = DoctorRole(**schema.model_dump())
    db.add(db_role)
    db.commit()
    db.refresh(db_role)
    return db_role

@router.get("/doctor-roles", response_model=List[DoctorRoleResponse])
def get_doctor_roles(db: Session = Depends(get_db)):
    return db.query(DoctorRole).filter(DoctorRole.drl_rec_state != 0).all()

# Doctors
@router.post("/doctors", response_model=DoctorResponse)
def create_doctor(schema: DoctorCreate, db: Session = Depends(get_db), current_user = Depends(get_current_active_user)):
    db_dct = Doctor(**schema.model_dump())
    db.add(db_dct)
    db.commit()
    db.refresh(db_dct)
    return db_dct

@router.get("/doctors", response_model=List[DoctorResponse])
def get_doctors(db: Session = Depends(get_db)):
    return db.query(Doctor).filter(Doctor.dct_rec_state != 0).all()

# Floors
@router.post("/floors", response_model=FloorResponse)
def create_floor(schema: FloorCreate, db: Session = Depends(get_db), current_user = Depends(get_current_active_user)):
    db_flr = Floor(**schema.model_dump())
    db.add(db_flr)
    db.commit()
    db.refresh(db_flr)
    return db_flr

@router.get("/floors", response_model=List[FloorResponse])
def get_floors(db: Session = Depends(get_db)):
    return db.query(Floor).filter(Floor.flr_rec_state != 0).all()

# Wards
@router.post("/wards", response_model=WardResponse)
def create_ward(schema: WardCreate, db: Session = Depends(get_db), current_user = Depends(get_current_active_user)):
    db_wrd = Ward(**schema.model_dump())
    db.add(db_wrd)
    db.commit()
    db.refresh(db_wrd)
    return db_wrd

@router.get("/wards", response_model=List[WardResponse])
def get_wards(db: Session = Depends(get_db)):
    return db.query(Ward).filter(Ward.wrd_rec_state != 0).all()

# Beds
@router.post("/beds", response_model=BedResponse)
def create_bed(schema: BedCreate, db: Session = Depends(get_db), current_user = Depends(get_current_active_user)):
    db_bed = Bed(**schema.model_dump())
    db.add(db_bed)
    db.commit()
    db.refresh(db_bed)
    return db_bed

@router.get("/beds", response_model=List[BedResponse])
def get_beds(db: Session = Depends(get_db), is_occupied: Optional[bool] = None):
    query = db.query(Bed).filter(Bed.bdm_rec_state != 0)
    if is_occupied is not None:
        query = query.filter(Bed.is_occupied == is_occupied)
    return query.all()

# Service Groups
@router.post("/service-groups", response_model=ServiceGroupResponse)
def create_service_group(schema: ServiceGroupCreate, db: Session = Depends(get_db), current_user = Depends(get_current_active_user)):
    db_grp = ServiceGroup(**schema.model_dump())
    db.add(db_grp)
    db.commit()
    db.refresh(db_grp)
    return db_grp

@router.get("/service-groups", response_model=List[ServiceGroupResponse])
def get_service_groups(db: Session = Depends(get_db)):
    return db.query(ServiceGroup).filter(ServiceGroup.sgp_rec_state != 0).all()

# Services
@router.post("/services", response_model=ServiceResponse)
def create_service(schema: ServiceCreate, db: Session = Depends(get_db), current_user = Depends(get_current_active_user)):
    db_srv = Service(**schema.model_dump())
    db.add(db_srv)
    db.commit()
    db.refresh(db_srv)
    return db_srv

@router.get("/services", response_model=List[ServiceResponse])
def get_services(db: Session = Depends(get_db)):
    return db.query(Service).filter(Service.srv_rec_state != 0).all()
