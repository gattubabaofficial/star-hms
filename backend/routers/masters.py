from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.orm import Session
from typing import List, Optional
from backend.database import get_db
from backend.models import (
    PatientCategory, Patient, DoctorCategory, DoctorRole, Doctor,
    Floor, Ward, Bed, ServiceGroup, Service,
)
from backend.models.masters import (
    PayDeptMast, PayDesnMast, PayEmpMast,
    RefCatgMst, RefByMast, RefToMast,
    DiagMast, PatMast,
    PartyGrpMst, PartyMast,
    SubItmGrpMst, SubItmMast,
    StsnMast, AreaMast,
    PatCatgMst, DoctCatgMst, DoctRoleMst, DoctMast,
    FloorMast, WardMast, BedMast, ServGrpMst, ServMast,
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
    ServiceCreate, ServiceResponse,
    PayDeptCreate, PayDeptResponse,
    PayDesnCreate, PayDesnResponse,
    PayEmpCreate, PayEmpResponse,
    RefCatgCreate, RefCatgResponse,
    RefByCreate, RefByResponse,
    RefToCreate, RefToResponse,
    StationCreate, StationResponse,
    AreaCreate, AreaResponse,
    PartyGroupCreate, PartyGroupResponse,
    PartyCreate, PartyResponse,
    ProductGroupCreate, ProductGroupResponse,
    ProductCreate, ProductResponse,
    DiagCreate, DiagResponse,
)
from backend.core.dependencies import get_current_active_user

router = APIRouter()

# ─────────────────────────────────────────────────────────────────────────────
# Patient Categories
# ─────────────────────────────────────────────────────────────────────────────
@router.post("/patient-categories", response_model=PatientCategoryResponse)
def create_patient_category(schema: PatientCategoryCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = PatientCategory(**schema.model_dump())
    db.add(obj); db.commit(); db.refresh(obj)
    legacy = PatCatgMst(
        PcgCode=obj.pcg_code,
        PcgName=obj.pcg_name,
        PcgInfAllowed=obj.pcg_inf_allowed,
        PcgDefAllowed=obj.pcg_def_allowed,
        PcgDiscAllowed=obj.pcg_disc_allowed,
        PcgDiscPer=obj.pcg_disc_per,
        PcgShowInList=obj.pcg_show_in_list,
        PcgRecState=obj.pcg_rec_state or 1,
        PcgType=obj.pcg_type
    )
    db.add(legacy); db.commit(); db.refresh(legacy)
    return obj

@router.get("/patient-categories", response_model=List[PatientCategoryResponse])
def get_patient_categories(db: Session = Depends(get_db)):
    return db.query(PatientCategory).filter(PatientCategory.pcg_rec_state != 0).all()

@router.put("/patient-categories/{code}", response_model=PatientCategoryResponse)
def update_patient_category(code: int, schema: PatientCategoryCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = db.query(PatientCategory).filter(PatientCategory.pcg_code == code).first()
    if not obj: raise HTTPException(404, "Not found")
    for k, v in schema.model_dump().items(): setattr(obj, k, v)
    legacy = db.query(PatCatgMst).filter(PatCatgMst.PcgCode == code).first()
    if not legacy:
        legacy = PatCatgMst(PcgCode=code)
        db.add(legacy)
    legacy.PcgName = obj.pcg_name
    legacy.PcgInfAllowed = obj.pcg_inf_allowed
    legacy.PcgDefAllowed = obj.pcg_def_allowed
    legacy.PcgDiscAllowed = obj.pcg_disc_allowed
    legacy.PcgDiscPer = obj.pcg_disc_per
    legacy.PcgShowInList = obj.pcg_show_in_list
    legacy.PcgRecState = obj.pcg_rec_state or 1
    legacy.PcgType = obj.pcg_type
    db.commit(); db.refresh(obj)
    return obj

@router.delete("/patient-categories/{code}")
def delete_patient_category(code: int, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = db.query(PatientCategory).filter(PatientCategory.pcg_code == code).first()
    if not obj: raise HTTPException(404, "Not found")
    obj.pcg_rec_state = 0
    legacy = db.query(PatCatgMst).filter(PatCatgMst.PcgCode == code).first()
    if legacy:
        legacy.PcgRecState = 0
    db.commit()
    return {"ok": True}

# ─────────────────────────────────────────────────────────────────────────────
# Patients (Dual write & read for patients and PatMast)
# ─────────────────────────────────────────────────────────────────────────────
import datetime

@router.post("/patients")
def create_patient(data: dict, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    reg_no = data.get("ptt_reg_no")
    if not reg_no:
        max_reg = db.query(Patient.ptt_reg_no).order_by(Patient.ptt_reg_no.desc()).first()
        reg_no = (max_reg[0] + 1) if max_reg and max_reg[0] else 10001
    
    dob = None
    if data.get("ptt_dob"):
        try:
            dob = datetime.date.fromisoformat(data["ptt_dob"])
        except ValueError:
            pass

    # Save basic fields in patients table
    patient = Patient(
        ptt_name=data.get("ptt_name") or "",
        ptt_reg_no=reg_no,
        ptt_sex=data.get("ptt_sex"),
        ptt_dob=dob,
        ptt_address=data.get("ptt_address"),
        ptt_telephone=data.get("ptt_telephone"),
        ptt_sms_no=data.get("ptt_sms_no"),
        ptt_email=data.get("ptt_email"),
        ptt_pcg_code=data.get("ptt_pcg_code"),
        ptt_remark=data.get("ptt_remark"),
        ptt_rec_state=data.get("ptt_rec_state", 1),
    )
    db.add(patient)
    db.commit()
    db.refresh(patient)

    # Save all fields including legacy in PatMast table
    pat_mast = PatMast(
        PttCode=patient.ptt_code,
        PttName=patient.ptt_name,
        PttRegNo=patient.ptt_reg_no,
        PttRegDate=datetime.date.today(),
        PttSex=patient.ptt_sex,
        PttDob=patient.ptt_dob,
        PttAddr=patient.ptt_address,
        PttTelNo=patient.ptt_telephone,
        PttSMSNo=patient.ptt_sms_no,
        PttEmail=patient.ptt_email,
        PttPcgCode=patient.ptt_pcg_code,
        PttRemark=patient.ptt_remark,
        PttRecState=patient.ptt_rec_state or 1,
        PttRefRela=data.get("ptt_ref_rela"),
        PttRefName=data.get("ptt_ref_name"),
        PttAraCode=data.get("ptt_ara_code"),
        PttStnCode=data.get("ptt_stn_code"),
    )
    db.add(pat_mast)
    db.commit()
    db.refresh(pat_mast)

    return {
        "ptt_code": patient.ptt_code,
        "ptt_name": patient.ptt_name,
        "ptt_reg_no": patient.ptt_reg_no,
        "ptt_reg_date": str(patient.ptt_reg_date) if patient.ptt_reg_date else None,
        "ptt_sex": patient.ptt_sex,
        "ptt_dob": str(patient.ptt_dob) if patient.ptt_dob else None,
        "ptt_address": patient.ptt_address,
        "ptt_telephone": patient.ptt_telephone,
        "ptt_sms_no": patient.ptt_sms_no,
        "ptt_email": patient.ptt_email,
        "ptt_pcg_code": patient.ptt_pcg_code,
        "ptt_remark": patient.ptt_remark,
        "ptt_ref_rela": pat_mast.PttRefRela,
        "ptt_ref_name": pat_mast.PttRefName,
        "ptt_ara_code": pat_mast.PttAraCode,
        "ptt_stn_code": pat_mast.PttStnCode,
    }

@router.get("/patients", response_model=List[PatientResponse])
def get_patients(db: Session = Depends(get_db)):
    return db.query(Patient).filter(Patient.ptt_rec_state != 0).all()

@router.get("/patients/{ptt_code}")
def get_patient(ptt_code: int, db: Session = Depends(get_db)):
    obj = db.query(Patient).filter(Patient.ptt_code == ptt_code, Patient.ptt_rec_state != 0).first()
    if not obj:
        # Check if exists in PatMast to sync back
        pm = db.query(PatMast).filter(PatMast.PttCode == ptt_code).first()
        if not pm:
            raise HTTPException(404, "Patient not found")
        # Sync back to Patient
        obj = Patient(
            ptt_code=pm.PttCode,
            ptt_name=pm.PttName or "",
            ptt_reg_no=pm.PttRegNo,
            ptt_sex=pm.PttSex,
            ptt_dob=pm.PttDob,
            ptt_address=pm.PttAddr,
            ptt_telephone=pm.PttTelNo,
            ptt_sms_no=pm.PttSMSNo,
            ptt_email=pm.PttEmail,
            ptt_pcg_code=pm.PttPcgCode,
            ptt_remark=pm.PttRemark,
        )
        db.add(obj)
        db.commit()
        db.refresh(obj)
    
    # Ensure it exists in PatMast
    pm = db.query(PatMast).filter(PatMast.PttCode == ptt_code).first()
    if not pm:
        pm = PatMast(
            PttCode=ptt_code,
            PttName=obj.ptt_name,
            PttRegNo=obj.ptt_reg_no,
            PttRegDate=datetime.date.today(),
            PttSex=obj.ptt_sex,
            PttDob=obj.ptt_dob,
            PttAddr=obj.ptt_address,
            PttTelNo=obj.ptt_telephone,
            PttSMSNo=obj.ptt_sms_no,
            PttEmail=obj.ptt_email,
            PttPcgCode=obj.ptt_pcg_code,
            PttRemark=obj.ptt_remark,
        )
        db.add(pm)
        db.commit()
        db.refresh(pm)

    return {
        "ptt_code": obj.ptt_code,
        "ptt_name": obj.ptt_name,
        "ptt_reg_no": obj.ptt_reg_no,
        "ptt_reg_date": str(obj.ptt_reg_date) if obj.ptt_reg_date else None,
        "ptt_sex": obj.ptt_sex,
        "ptt_dob": str(obj.ptt_dob) if obj.ptt_dob else None,
        "ptt_address": obj.ptt_address,
        "ptt_telephone": obj.ptt_telephone,
        "ptt_sms_no": obj.ptt_sms_no,
        "ptt_email": obj.ptt_email,
        "ptt_pcg_code": obj.ptt_pcg_code,
        "ptt_remark": obj.ptt_remark,
        "ptt_ref_rela": pm.PttRefRela,
        "ptt_ref_name": pm.PttRefName,
        "ptt_ara_code": pm.PttAraCode,
        "ptt_stn_code": pm.PttStnCode,
    }

@router.put("/patients/{code}")
def update_patient(code: int, data: dict, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    patient = db.query(Patient).filter(Patient.ptt_code == code).first()
    if not patient: raise HTTPException(404, "Patient not found")

    patient.ptt_name = data.get("ptt_name") if "ptt_name" in data else patient.ptt_name
    patient.ptt_reg_no = data.get("ptt_reg_no") if "ptt_reg_no" in data else patient.ptt_reg_no
    patient.ptt_sex = data.get("ptt_sex") if "ptt_sex" in data else patient.ptt_sex
    if "ptt_dob" in data:
        dob = None
        if data["ptt_dob"]:
            try:
                dob = datetime.date.fromisoformat(data["ptt_dob"])
            except ValueError:
                pass
        patient.ptt_dob = dob
    patient.ptt_address = data.get("ptt_address") if "ptt_address" in data else patient.ptt_address
    patient.ptt_telephone = data.get("ptt_telephone") if "ptt_telephone" in data else patient.ptt_telephone
    patient.ptt_sms_no = data.get("ptt_sms_no") if "ptt_sms_no" in data else patient.ptt_sms_no
    patient.ptt_email = data.get("ptt_email") if "ptt_email" in data else patient.ptt_email
    patient.ptt_pcg_code = data.get("ptt_pcg_code") if "ptt_pcg_code" in data else patient.ptt_pcg_code
    patient.ptt_remark = data.get("ptt_remark") if "ptt_remark" in data else patient.ptt_remark
    if "ptt_rec_state" in data:
        patient.ptt_rec_state = data["ptt_rec_state"]

    pat_mast = db.query(PatMast).filter(PatMast.PttCode == code).first()
    if not pat_mast:
        pat_mast = PatMast(PttCode=code)
        db.add(pat_mast)

    pat_mast.PttName = patient.ptt_name
    pat_mast.PttRegNo = patient.ptt_reg_no
    pat_mast.PttSex = patient.ptt_sex
    pat_mast.PttDob = patient.ptt_dob
    pat_mast.PttAddr = patient.ptt_address
    pat_mast.PttTelNo = patient.ptt_telephone
    pat_mast.PttSMSNo = patient.ptt_sms_no
    pat_mast.PttEmail = patient.ptt_email
    pat_mast.PttPcgCode = patient.ptt_pcg_code
    pat_mast.PttRemark = patient.ptt_remark
    pat_mast.PttRecState = patient.ptt_rec_state or 1
    
    if "ptt_ref_rela" in data: pat_mast.PttRefRela = data["ptt_ref_rela"]
    if "ptt_ref_name" in data: pat_mast.PttRefName = data["ptt_ref_name"]
    if "ptt_ara_code" in data: pat_mast.PttAraCode = data["ptt_ara_code"]
    if "ptt_stn_code" in data: pat_mast.PttStnCode = data["ptt_stn_code"]

    db.commit()
    db.refresh(patient)
    db.refresh(pat_mast)

    return {
        "ptt_code": patient.ptt_code,
        "ptt_name": patient.ptt_name,
        "ptt_reg_no": patient.ptt_reg_no,
        "ptt_reg_date": str(patient.ptt_reg_date) if patient.ptt_reg_date else None,
        "ptt_sex": patient.ptt_sex,
        "ptt_dob": str(patient.ptt_dob) if patient.ptt_dob else None,
        "ptt_address": patient.ptt_address,
        "ptt_telephone": patient.ptt_telephone,
        "ptt_sms_no": patient.ptt_sms_no,
        "ptt_email": patient.ptt_email,
        "ptt_pcg_code": patient.ptt_pcg_code,
        "ptt_remark": patient.ptt_remark,
        "ptt_ref_rela": pat_mast.PttRefRela,
        "ptt_ref_name": pat_mast.PttRefName,
        "ptt_ara_code": pat_mast.PttAraCode,
        "ptt_stn_code": pat_mast.PttStnCode,
    }

# ─────────────────────────────────────────────────────────────────────────────
# Doctor Categories
# ─────────────────────────────────────────────────────────────────────────────
@router.post("/doctor-categories", response_model=DoctorCategoryResponse)
def create_doctor_category(schema: DoctorCategoryCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = DoctorCategory(**schema.model_dump())
    db.add(obj); db.commit(); db.refresh(obj)
    legacy = DoctCatgMst(
        DcgCode=obj.dcg_code,
        DcgName=obj.dcg_name,
        DcgRecState=obj.dcg_rec_state or 1
    )
    db.add(legacy); db.commit(); db.refresh(legacy)
    return obj

@router.get("/doctor-categories", response_model=List[DoctorCategoryResponse])
def get_doctor_categories(db: Session = Depends(get_db)):
    return db.query(DoctorCategory).filter(DoctorCategory.dcg_rec_state != 0).all()

@router.put("/doctor-categories/{code}", response_model=DoctorCategoryResponse)
def update_doctor_category(code: int, schema: DoctorCategoryCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = db.query(DoctorCategory).filter(DoctorCategory.dcg_code == code).first()
    if not obj: raise HTTPException(404, "Not found")
    for k, v in schema.model_dump().items(): setattr(obj, k, v)
    legacy = db.query(DoctCatgMst).filter(DoctCatgMst.DcgCode == code).first()
    if not legacy:
        legacy = DoctCatgMst(DcgCode=code)
        db.add(legacy)
    legacy.DcgName = obj.dcg_name
    legacy.DcgRecState = obj.dcg_rec_state or 1
    db.commit(); db.refresh(obj)
    return obj

@router.delete("/doctor-categories/{code}")
def delete_doctor_category(code: int, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = db.query(DoctorCategory).filter(DoctorCategory.dcg_code == code).first()
    if not obj: raise HTTPException(404, "Not found")
    obj.dcg_rec_state = 0
    legacy = db.query(DoctCatgMst).filter(DoctCatgMst.DcgCode == code).first()
    if legacy:
        legacy.DcgRecState = 0
    db.commit()
    return {"ok": True}

# ─────────────────────────────────────────────────────────────────────────────
# Doctor Roles
# ─────────────────────────────────────────────────────────────────────────────
@router.post("/doctor-roles", response_model=DoctorRoleResponse)
def create_doctor_role(schema: DoctorRoleCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = DoctorRole(**schema.model_dump())
    db.add(obj); db.commit(); db.refresh(obj)
    legacy = DoctRoleMst(
        DrlCode=obj.drl_code,
        DrlName=obj.drl_name,
        DrlRecState=obj.drl_rec_state or 1
    )
    db.add(legacy); db.commit(); db.refresh(legacy)
    return obj

@router.get("/doctor-roles", response_model=List[DoctorRoleResponse])
def get_doctor_roles(db: Session = Depends(get_db)):
    return db.query(DoctorRole).filter(DoctorRole.drl_rec_state != 0).all()

@router.put("/doctor-roles/{code}", response_model=DoctorRoleResponse)
def update_doctor_role(code: int, schema: DoctorRoleCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = db.query(DoctorRole).filter(DoctorRole.drl_code == code).first()
    if not obj: raise HTTPException(404, "Not found")
    for k, v in schema.model_dump().items(): setattr(obj, k, v)
    legacy = db.query(DoctRoleMst).filter(DoctRoleMst.DrlCode == code).first()
    if not legacy:
        legacy = DoctRoleMst(DrlCode=code)
        db.add(legacy)
    legacy.DrlName = obj.drl_name
    legacy.DrlRecState = obj.drl_rec_state or 1
    db.commit(); db.refresh(obj)
    return obj

@router.delete("/doctor-roles/{code}")
def delete_doctor_role(code: int, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = db.query(DoctorRole).filter(DoctorRole.drl_code == code).first()
    if not obj: raise HTTPException(404, "Not found")
    obj.drl_rec_state = 0
    legacy = db.query(DoctRoleMst).filter(DoctRoleMst.DrlCode == code).first()
    if legacy:
        legacy.DrlRecState = 0
    db.commit()
    return {"ok": True}

# ─────────────────────────────────────────────────────────────────────────────
# Doctors
# ─────────────────────────────────────────────────────────────────────────────
@router.post("/doctors", response_model=DoctorResponse)
def create_doctor(schema: DoctorCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = Doctor(**schema.model_dump())
    db.add(obj); db.commit(); db.refresh(obj)
    legacy = DoctMast(
        DctCode=obj.dct_code,
        DctTitle=obj.dct_title,
        DctName=obj.dct_name,
        DctSpeci=obj.dct_specialty,
        DctDcgCode=obj.dct_dcg_code,
        DctDrlCode=obj.dct_drl_code,
        DctAddr=obj.dct_address,
        DctTelNo=obj.dct_telephone,
        DctEmail=obj.dct_email,
        DctShare=obj.dct_share_percent or 0.0,
        DctRecState=obj.dct_rec_state or 1
    )
    db.add(legacy); db.commit(); db.refresh(legacy)
    return obj

@router.get("/doctors", response_model=List[DoctorResponse])
def get_doctors(db: Session = Depends(get_db)):
    return db.query(Doctor).filter(Doctor.dct_rec_state != 0).all()

@router.put("/doctors/{code}", response_model=DoctorResponse)
def update_doctor(code: int, schema: DoctorCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = db.query(Doctor).filter(Doctor.dct_code == code).first()
    if not obj: raise HTTPException(404, "Not found")
    for k, v in schema.model_dump().items(): setattr(obj, k, v)
    legacy = db.query(DoctMast).filter(DoctMast.DctCode == code).first()
    if not legacy:
        legacy = DoctMast(DctCode=code)
        db.add(legacy)
    legacy.DctTitle = obj.dct_title
    legacy.DctName = obj.dct_name
    legacy.DctSpeci = obj.dct_specialty
    legacy.DctDcgCode = obj.dct_dcg_code
    legacy.DctDrlCode = obj.dct_drl_code
    legacy.DctAddr = obj.dct_address
    legacy.DctTelNo = obj.dct_telephone
    legacy.DctEmail = obj.dct_email
    legacy.DctShare = obj.dct_share_percent or 0.0
    legacy.DctRecState = obj.dct_rec_state or 1
    db.commit(); db.refresh(obj)
    return obj

@router.delete("/doctors/{code}")
def delete_doctor(code: int, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = db.query(Doctor).filter(Doctor.dct_code == code).first()
    if not obj: raise HTTPException(404, "Not found")
    obj.dct_rec_state = 0
    legacy = db.query(DoctMast).filter(DoctMast.DctCode == code).first()
    if legacy:
        legacy.DctRecState = 0
    db.commit()
    return {"ok": True}

# ─────────────────────────────────────────────────────────────────────────────
# Referred Category
# ─────────────────────────────────────────────────────────────────────────────
def _rfg_out(o): return {"rfg_code": o.RfgCode, "rfg_name": o.RfgName, "rfg_rec_state": o.RfgRecState}

@router.post("/referred-categories", response_model=RefCatgResponse)
def create_ref_catg(schema: RefCatgCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = RefCatgMst(RfgName=schema.rfg_name, RfgRecState=schema.rfg_rec_state or 1)
    db.add(obj); db.commit(); db.refresh(obj)
    return _rfg_out(obj)

@router.get("/referred-categories", response_model=List[RefCatgResponse])
def get_ref_catgs(db: Session = Depends(get_db)):
    return [_rfg_out(o) for o in db.query(RefCatgMst).filter(RefCatgMst.RfgRecState != 0).all()]

@router.put("/referred-categories/{code}", response_model=RefCatgResponse)
def update_ref_catg(code: int, schema: RefCatgCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = db.query(RefCatgMst).filter(RefCatgMst.RfgCode == code).first()
    if not obj: raise HTTPException(404, "Not found")
    obj.RfgName = schema.rfg_name; obj.RfgRecState = schema.rfg_rec_state or 1
    db.commit(); db.refresh(obj)
    return _rfg_out(obj)

@router.delete("/referred-categories/{code}")
def delete_ref_catg(code: int, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = db.query(RefCatgMst).filter(RefCatgMst.RfgCode == code).first()
    if not obj: raise HTTPException(404, "Not found")
    obj.RfgRecState = 0; db.commit()
    return {"ok": True}

# ─────────────────────────────────────────────────────────────────────────────
# Referred By Master
# ─────────────────────────────────────────────────────────────────────────────
def _rby_out(o, catg=None):
    return {"rby_code": o.RByCode, "rby_name": o.RByName, "rby_speci": o.RBySpeci, "rby_rfg_code": o.RByRfgCode,
            "rby_addr": o.RByAddr, "rby_tel_no": o.RByTelNo, "rby_email": o.RByEmail,
            "rby_share": o.RByShare, "rby_rec_state": o.RByRecState,
            "category": _rfg_out(catg) if catg else None}

@router.post("/referred-by", response_model=RefByResponse)
def create_ref_by(schema: RefByCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = RefByMast(RByName=schema.rby_name, RBySpeci=schema.rby_speci, RByRfgCode=schema.rby_rfg_code,
                    RByAddr=schema.rby_addr, RByTelNo=schema.rby_tel_no, RByEmail=schema.rby_email,
                    RByShare=schema.rby_share or 0.0, RByRecState=schema.rby_rec_state or 1)
    db.add(obj); db.commit(); db.refresh(obj)
    catg = db.query(RefCatgMst).filter(RefCatgMst.RfgCode == obj.RByRfgCode).first() if obj.RByRfgCode else None
    return _rby_out(obj, catg)

@router.get("/referred-by", response_model=List[RefByResponse])
def get_ref_by(db: Session = Depends(get_db)):
    rows = db.query(RefByMast).filter(RefByMast.RByRecState != 0).all()
    result = []
    for o in rows:
        catg = db.query(RefCatgMst).filter(RefCatgMst.RfgCode == o.RByRfgCode).first() if o.RByRfgCode else None
        result.append(_rby_out(o, catg))
    return result

@router.put("/referred-by/{code}", response_model=RefByResponse)
def update_ref_by(code: int, schema: RefByCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = db.query(RefByMast).filter(RefByMast.RByCode == code).first()
    if not obj: raise HTTPException(404, "Not found")
    obj.RByName=schema.rby_name; obj.RBySpeci=schema.rby_speci; obj.RByRfgCode=schema.rby_rfg_code
    obj.RByAddr=schema.rby_addr; obj.RByTelNo=schema.rby_tel_no; obj.RByEmail=schema.rby_email
    obj.RByShare=schema.rby_share or 0.0; obj.RByRecState=schema.rby_rec_state or 1
    db.commit(); db.refresh(obj)
    catg = db.query(RefCatgMst).filter(RefCatgMst.RfgCode == obj.RByRfgCode).first() if obj.RByRfgCode else None
    return _rby_out(obj, catg)

@router.delete("/referred-by/{code}")
def delete_ref_by(code: int, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = db.query(RefByMast).filter(RefByMast.RByCode == code).first()
    if not obj: raise HTTPException(404, "Not found")
    obj.RByRecState = 0; db.commit()
    return {"ok": True}

# ─────────────────────────────────────────────────────────────────────────────
# Referred To Master
# ─────────────────────────────────────────────────────────────────────────────
def _rto_out(o, catg=None):
    return {"rto_code": o.RToCode, "rto_name": o.RToName, "rto_speci": o.RToSpeci, "rto_rfg_code": o.RToRfgCode,
            "rto_addr": o.RToAddr, "rto_tel_no": o.RToTelNo, "rto_email": o.RToEmail,
            "rto_share": o.RToShare, "rto_rec_state": o.RToRecState,
            "category": _rfg_out(catg) if catg else None}

@router.post("/referred-to", response_model=RefToResponse)
def create_ref_to(schema: RefToCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = RefToMast(RToName=schema.rto_name, RToSpeci=schema.rto_speci, RToRfgCode=schema.rto_rfg_code,
                    RToAddr=schema.rto_addr, RToTelNo=schema.rto_tel_no, RToEmail=schema.rto_email,
                    RToShare=schema.rto_share or 0.0, RToRecState=schema.rto_rec_state or 1)
    db.add(obj); db.commit(); db.refresh(obj)
    catg = db.query(RefCatgMst).filter(RefCatgMst.RfgCode == obj.RToRfgCode).first() if obj.RToRfgCode else None
    return _rto_out(obj, catg)

@router.get("/referred-to", response_model=List[RefToResponse])
def get_ref_to(db: Session = Depends(get_db)):
    rows = db.query(RefToMast).filter(RefToMast.RToRecState != 0).all()
    result = []
    for o in rows:
        catg = db.query(RefCatgMst).filter(RefCatgMst.RfgCode == o.RToRfgCode).first() if o.RToRfgCode else None
        result.append(_rto_out(o, catg))
    return result

@router.put("/referred-to/{code}", response_model=RefToResponse)
def update_ref_to(code: int, schema: RefToCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = db.query(RefToMast).filter(RefToMast.RToCode == code).first()
    if not obj: raise HTTPException(404, "Not found")
    obj.RToName=schema.rto_name; obj.RToSpeci=schema.rto_speci; obj.RToRfgCode=schema.rto_rfg_code
    obj.RToAddr=schema.rto_addr; obj.RToTelNo=schema.rto_tel_no; obj.RToEmail=schema.rto_email
    obj.RToShare=schema.rto_share or 0.0; obj.RToRecState=schema.rto_rec_state or 1
    db.commit(); db.refresh(obj)
    catg = db.query(RefCatgMst).filter(RefCatgMst.RfgCode == obj.RToRfgCode).first() if obj.RToRfgCode else None
    return _rto_out(obj, catg)

@router.delete("/referred-to/{code}")
def delete_ref_to(code: int, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = db.query(RefToMast).filter(RefToMast.RToCode == code).first()
    if not obj: raise HTTPException(404, "Not found")
    obj.RToRecState = 0; db.commit()
    return {"ok": True}

# ─────────────────────────────────────────────────────────────────────────────
# Floors
# ─────────────────────────────────────────────────────────────────────────────
@router.post("/floors", response_model=FloorResponse)
def create_floor(schema: FloorCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = Floor(**schema.model_dump())
    db.add(obj); db.commit(); db.refresh(obj)
    legacy = FloorMast(
        FlrCode=obj.flr_code,
        FlrName=obj.flr_name,
        FlrShowInList=obj.flr_show_in_list,
        FlrRecState=obj.flr_rec_state or 1
    )
    db.add(legacy); db.commit(); db.refresh(legacy)
    return obj

@router.get("/floors", response_model=List[FloorResponse])
def get_floors(db: Session = Depends(get_db)):
    return db.query(Floor).filter(Floor.flr_rec_state != 0).all()

@router.put("/floors/{code}", response_model=FloorResponse)
def update_floor(code: int, schema: FloorCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = db.query(Floor).filter(Floor.flr_code == code).first()
    if not obj: raise HTTPException(404, "Not found")
    for k, v in schema.model_dump().items(): setattr(obj, k, v)
    legacy = db.query(FloorMast).filter(FloorMast.FlrCode == code).first()
    if not legacy:
        legacy = FloorMast(FlrCode=code)
        db.add(legacy)
    legacy.FlrName = obj.flr_name
    legacy.FlrShowInList = obj.flr_show_in_list
    legacy.FlrRecState = obj.flr_rec_state or 1
    db.commit(); db.refresh(obj)
    return obj

@router.delete("/floors/{code}")
def delete_floor(code: int, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = db.query(Floor).filter(Floor.flr_code == code).first()
    if not obj: raise HTTPException(404, "Not found")
    obj.flr_rec_state = 0
    legacy = db.query(FloorMast).filter(FloorMast.FlrCode == code).first()
    if legacy:
        legacy.FlrRecState = 0
    db.commit()
    return {"ok": True}

# ─────────────────────────────────────────────────────────────────────────────
# Wards
# ─────────────────────────────────────────────────────────────────────────────
@router.post("/wards", response_model=WardResponse)
def create_ward(schema: WardCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = Ward(**schema.model_dump())
    db.add(obj); db.commit(); db.refresh(obj)
    legacy = WardMast(
        WrdCode=obj.wrd_code,
        WrdName=obj.wrd_name,
        WrdFlrCode=obj.wrd_flr_code,
        WrdShowInList=obj.wrd_show_in_list,
        WrdRecState=obj.wrd_rec_state or 1
    )
    db.add(legacy); db.commit(); db.refresh(legacy)
    return obj

@router.get("/wards", response_model=List[WardResponse])
def get_wards(db: Session = Depends(get_db)):
    return db.query(Ward).filter(Ward.wrd_rec_state != 0).all()

@router.put("/wards/{code}", response_model=WardResponse)
def update_ward(code: int, schema: WardCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = db.query(Ward).filter(Ward.wrd_code == code).first()
    if not obj: raise HTTPException(404, "Not found")
    for k, v in schema.model_dump().items(): setattr(obj, k, v)
    legacy = db.query(WardMast).filter(WardMast.WrdCode == code).first()
    if not legacy:
        legacy = WardMast(WrdCode=code)
        db.add(legacy)
    legacy.WrdName = obj.wrd_name
    legacy.WrdFlrCode = obj.wrd_flr_code
    legacy.WrdShowInList = obj.wrd_show_in_list
    legacy.WrdRecState = obj.wrd_rec_state or 1
    db.commit(); db.refresh(obj)
    return obj

@router.delete("/wards/{code}")
def delete_ward(code: int, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = db.query(Ward).filter(Ward.wrd_code == code).first()
    if not obj: raise HTTPException(404, "Not found")
    obj.wrd_rec_state = 0
    legacy = db.query(WardMast).filter(WardMast.WrdCode == code).first()
    if legacy:
        legacy.WrdRecState = 0
    db.commit()
    return {"ok": True}

# ─────────────────────────────────────────────────────────────────────────────
# Beds
# ─────────────────────────────────────────────────────────────────────────────
@router.post("/beds", response_model=BedResponse)
def create_bed(schema: BedCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = Bed(**schema.model_dump())
    db.add(obj); db.commit(); db.refresh(obj)
    legacy = BedMast(
        BdmCode=obj.bdm_code,
        BdmName=obj.bdm_name,
        BdmWrdCode=obj.bdm_wrd_code,
        BdmFlrCode=obj.bdm_flr_code,
        BdmSrvCode=obj.bdm_srv_code,
        BdmIndex=obj.bdm_index,
        BdmCharges=obj.bdm_charges,
        BdmDiscAllowed=obj.bdm_disc_allowed,
        BdmDiscPer=obj.bdm_disc_per,
        BdmChkOutTimeBasis=obj.bdm_chk_out_time_basis,
        BdmChkTime=obj.bdm_chk_time,
        BdmFreeAllot=obj.bdm_free_allot,
        BdmRemark=obj.bdm_remark,
        BdmShowInList=obj.bdm_show_in_list,
        BdmRecState=obj.bdm_rec_state or 1
    )
    db.add(legacy); db.commit(); db.refresh(legacy)
    return obj

@router.get("/beds", response_model=List[BedResponse])
def get_beds(db: Session = Depends(get_db), is_occupied: Optional[bool] = None):
    q = db.query(Bed).filter(Bed.bdm_rec_state != 0)
    if is_occupied is not None: q = q.filter(Bed.is_occupied == is_occupied)
    return q.all()

@router.put("/beds/{code}", response_model=BedResponse)
def update_bed(code: int, schema: BedCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = db.query(Bed).filter(Bed.bdm_code == code).first()
    if not obj: raise HTTPException(404, "Not found")
    for k, v in schema.model_dump().items(): setattr(obj, k, v)
    legacy = db.query(BedMast).filter(BedMast.BdmCode == code).first()
    if not legacy:
        legacy = BedMast(BdmCode=code)
        db.add(legacy)
    legacy.BdmName = obj.bdm_name
    legacy.BdmWrdCode = obj.bdm_wrd_code
    legacy.BdmFlrCode = obj.bdm_flr_code
    legacy.BdmSrvCode = obj.bdm_srv_code
    legacy.BdmIndex = obj.bdm_index
    legacy.BdmCharges = obj.bdm_charges
    legacy.BdmDiscAllowed = obj.bdm_disc_allowed
    legacy.BdmDiscPer = obj.bdm_disc_per
    legacy.BdmChkOutTimeBasis = obj.bdm_chk_out_time_basis
    legacy.BdmChkTime = obj.bdm_chk_time
    legacy.BdmFreeAllot = obj.bdm_free_allot
    legacy.BdmRemark = obj.bdm_remark
    legacy.BdmShowInList = obj.bdm_show_in_list
    legacy.BdmRecState = obj.bdm_rec_state or 1
    db.commit(); db.refresh(obj)
    return obj

@router.delete("/beds/{code}")
def delete_bed(code: int, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = db.query(Bed).filter(Bed.bdm_code == code).first()
    if not obj: raise HTTPException(404, "Not found")
    obj.bdm_rec_state = 0
    legacy = db.query(BedMast).filter(BedMast.BdmCode == code).first()
    if legacy:
        legacy.BdmRecState = 0
    db.commit()
    return {"ok": True}

# ─────────────────────────────────────────────────────────────────────────────
# Service Groups
# ─────────────────────────────────────────────────────────────────────────────
@router.post("/service-groups", response_model=ServiceGroupResponse)
def create_service_group(schema: ServiceGroupCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = ServiceGroup(**schema.model_dump())
    db.add(obj); db.commit(); db.refresh(obj)
    legacy = ServGrpMst(
        SgpCode=obj.sgp_code,
        SgpName=obj.sgp_name,
        SgpIndex=obj.sgp_index,
        SgpExpanded=obj.sgp_expanded,
        SgpEditable=obj.sgp_editable,
        SgpInfAllowed=obj.sgp_inf_allowed,
        SgpDefAllowed=obj.sgp_def_allowed,
        SgpDiscAllowed=obj.sgp_disc_allowed,
        SgpDiscPer=obj.sgp_disc_per,
        SgpShowInList=obj.sgp_show_in_list,
        SgpRecState=obj.sgp_rec_state or 1
    )
    db.add(legacy); db.commit(); db.refresh(legacy)
    return obj

@router.get("/service-groups", response_model=List[ServiceGroupResponse])
def get_service_groups(db: Session = Depends(get_db)):
    return db.query(ServiceGroup).filter(ServiceGroup.sgp_rec_state != 0).all()

@router.put("/service-groups/{code}", response_model=ServiceGroupResponse)
def update_service_group(code: int, schema: ServiceGroupCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = db.query(ServiceGroup).filter(ServiceGroup.sgp_code == code).first()
    if not obj: raise HTTPException(404, "Not found")
    for k, v in schema.model_dump().items(): setattr(obj, k, v)
    legacy = db.query(ServGrpMst).filter(ServGrpMst.SgpCode == code).first()
    if not legacy:
        legacy = ServGrpMst(SgpCode=code)
        db.add(legacy)
    legacy.SgpName = obj.sgp_name
    legacy.SgpIndex = obj.sgp_index
    legacy.SgpExpanded = obj.sgp_expanded
    legacy.SgpEditable = obj.sgp_editable
    legacy.SgpInfAllowed = obj.sgp_inf_allowed
    legacy.SgpDefAllowed = obj.sgp_def_allowed
    legacy.SgpDiscAllowed = obj.sgp_disc_allowed
    legacy.SgpDiscPer = obj.sgp_disc_per
    legacy.SgpShowInList = obj.sgp_show_in_list
    legacy.SgpRecState = obj.sgp_rec_state or 1
    db.commit(); db.refresh(obj)
    return obj

@router.delete("/service-groups/{code}")
def delete_service_group(code: int, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = db.query(ServiceGroup).filter(ServiceGroup.sgp_code == code).first()
    if not obj: raise HTTPException(404, "Not found")
    obj.sgp_rec_state = 0
    legacy = db.query(ServGrpMst).filter(ServGrpMst.SgpCode == code).first()
    if legacy:
        legacy.SgpRecState = 0
    db.commit()
    return {"ok": True}

# ─────────────────────────────────────────────────────────────────────────────
# Services
# ─────────────────────────────────────────────────────────────────────────────
@router.post("/services", response_model=ServiceResponse)
def create_service(schema: ServiceCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = Service(**schema.model_dump())
    db.add(obj); db.commit(); db.refresh(obj)
    legacy = ServMast(
        SrvCode=obj.srv_code,
        SrvName=obj.srv_name,
        SrvSgpCode=obj.srv_sgp_code,
        SrvCharges=obj.srv_rate,
        SrvRecState=obj.srv_rec_state or 1
    )
    db.add(legacy); db.commit(); db.refresh(legacy)
    return obj

@router.get("/services", response_model=List[ServiceResponse])
def get_services(db: Session = Depends(get_db)):
    return db.query(Service).filter(Service.srv_rec_state != 0).all()

@router.put("/services/{code}", response_model=ServiceResponse)
def update_service(code: int, schema: ServiceCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = db.query(Service).filter(Service.srv_code == code).first()
    if not obj: raise HTTPException(404, "Not found")
    for k, v in schema.model_dump().items(): setattr(obj, k, v)
    legacy = db.query(ServMast).filter(ServMast.SrvCode == code).first()
    if not legacy:
        legacy = ServMast(SrvCode=code)
        db.add(legacy)
    legacy.SrvName = obj.srv_name
    legacy.SrvSgpCode = obj.srv_sgp_code
    legacy.SrvCharges = obj.srv_rate
    legacy.SrvRecState = obj.srv_rec_state or 1
    db.commit(); db.refresh(obj)
    return obj

@router.delete("/services/{code}")
def delete_service(code: int, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = db.query(Service).filter(Service.srv_code == code).first()
    if not obj: raise HTTPException(404, "Not found")
    obj.srv_rec_state = 0
    legacy = db.query(ServMast).filter(ServMast.SrvCode == code).first()
    if legacy:
        legacy.SrvRecState = 0
    db.commit()
    return {"ok": True}

# ─────────────────────────────────────────────────────────────────────────────
# Station Master
# ─────────────────────────────────────────────────────────────────────────────
def _stn_out(o): return {"stn_code": o.StnCode, "stn_name": o.StnName, "stn_show_in_list": o.StnShowInList, "stn_rec_state": o.StnRecState}

@router.post("/stations", response_model=StationResponse)
def create_station(schema: StationCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = StsnMast(StnName=schema.stn_name, StnShowInList=schema.stn_show_in_list, StnRecState=schema.stn_rec_state or 1)
    db.add(obj); db.commit(); db.refresh(obj)
    return _stn_out(obj)

@router.get("/stations", response_model=List[StationResponse])
def get_stations(db: Session = Depends(get_db)):
    return [_stn_out(o) for o in db.query(StsnMast).filter(StsnMast.StnRecState != 0).all()]

@router.put("/stations/{code}", response_model=StationResponse)
def update_station(code: int, schema: StationCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = db.query(StsnMast).filter(StsnMast.StnCode == code).first()
    if not obj: raise HTTPException(404, "Not found")
    obj.StnName=schema.stn_name; obj.StnShowInList=schema.stn_show_in_list; obj.StnRecState=schema.stn_rec_state or 1
    db.commit(); db.refresh(obj); return _stn_out(obj)

@router.delete("/stations/{code}")
def delete_station(code: int, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = db.query(StsnMast).filter(StsnMast.StnCode == code).first()
    if not obj: raise HTTPException(404, "Not found")
    obj.StnRecState = 0; db.commit(); return {"ok": True}

# ─────────────────────────────────────────────────────────────────────────────
# Area Master
# ─────────────────────────────────────────────────────────────────────────────
def _ara_out(o, stn=None): return {"ara_code": o.AraCode, "ara_name": o.AraName, "ara_stn_code": o.AraStnCode, "ara_rec_state": o.AraRecState, "station": _stn_out(stn) if stn else None}

@router.post("/areas", response_model=AreaResponse)
def create_area(schema: AreaCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = AreaMast(AraName=schema.ara_name, AraStnCode=schema.ara_stn_code, AraRecState=schema.ara_rec_state or 1)
    db.add(obj); db.commit(); db.refresh(obj)
    stn = db.query(StsnMast).filter(StsnMast.StnCode == obj.AraStnCode).first() if obj.AraStnCode else None
    return _ara_out(obj, stn)

@router.get("/areas", response_model=List[AreaResponse])
def get_areas(db: Session = Depends(get_db)):
    rows = db.query(AreaMast).filter(AreaMast.AraRecState != 0).all()
    result = []
    for o in rows:
        stn = db.query(StsnMast).filter(StsnMast.StnCode == o.AraStnCode).first() if o.AraStnCode else None
        result.append(_ara_out(o, stn))
    return result

@router.put("/areas/{code}", response_model=AreaResponse)
def update_area(code: int, schema: AreaCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = db.query(AreaMast).filter(AreaMast.AraCode == code).first()
    if not obj: raise HTTPException(404, "Not found")
    obj.AraName=schema.ara_name; obj.AraStnCode=schema.ara_stn_code; obj.AraRecState=schema.ara_rec_state or 1
    db.commit(); db.refresh(obj)
    stn = db.query(StsnMast).filter(StsnMast.StnCode == obj.AraStnCode).first() if obj.AraStnCode else None
    return _ara_out(obj, stn)

@router.delete("/areas/{code}")
def delete_area(code: int, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = db.query(AreaMast).filter(AreaMast.AraCode == code).first()
    if not obj: raise HTTPException(404, "Not found")
    obj.AraRecState = 0; db.commit(); return {"ok": True}

# ─────────────────────────────────────────────────────────────────────────────
# Party Group Master
# ─────────────────────────────────────────────────────────────────────────────
def _pgm_out(o): return {"pgm_code": o.PgmCode, "pgm_name": o.PgmName, "pgm_desc": o.PgmDesc, "pgm_rec_state": o.PgmRecState}

@router.post("/party-groups", response_model=PartyGroupResponse)
def create_party_group(schema: PartyGroupCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = PartyGrpMst(PgmName=schema.pgm_name, PgmDesc=schema.pgm_desc, PgmRecState=schema.pgm_rec_state or 1)
    db.add(obj); db.commit(); db.refresh(obj); return _pgm_out(obj)

@router.get("/party-groups", response_model=List[PartyGroupResponse])
def get_party_groups(db: Session = Depends(get_db)):
    return [_pgm_out(o) for o in db.query(PartyGrpMst).filter(PartyGrpMst.PgmRecState != 0).all()]

@router.put("/party-groups/{code}", response_model=PartyGroupResponse)
def update_party_group(code: int, schema: PartyGroupCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = db.query(PartyGrpMst).filter(PartyGrpMst.PgmCode == code).first()
    if not obj: raise HTTPException(404, "Not found")
    obj.PgmName=schema.pgm_name; obj.PgmDesc=schema.pgm_desc; obj.PgmRecState=schema.pgm_rec_state or 1
    db.commit(); db.refresh(obj); return _pgm_out(obj)

@router.delete("/party-groups/{code}")
def delete_party_group(code: int, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = db.query(PartyGrpMst).filter(PartyGrpMst.PgmCode == code).first()
    if not obj: raise HTTPException(404, "Not found")
    obj.PgmRecState = 0; db.commit(); return {"ok": True}

# ─────────────────────────────────────────────────────────────────────────────
# Party (Supplier) Master
# ─────────────────────────────────────────────────────────────────────────────
def _prt_out(o, grp=None):
    return {"prt_code": o.PrtCode, "prt_title": o.PrtTitle, "prt_name": o.PrtName, "prt_pgm_code": o.PrtPgmCode,
            "prt_addr": o.PrtAddr, "prt_tel_no": o.PrtTelNo, "prt_sms_no": o.PrtSMSNo, "prt_email": o.PrtEmail,
            "prt_show_in_list": o.PrtShowInList, "prt_remark": o.PrtRemark, "prt_rec_state": o.PrtRecState,
            "group": _pgm_out(grp) if grp else None}

@router.post("/parties", response_model=PartyResponse)
def create_party(schema: PartyCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = PartyMast(PrtTitle=schema.prt_title, PrtName=schema.prt_name, PrtPgmCode=schema.prt_pgm_code,
                    PrtAddr=schema.prt_addr, PrtTelNo=schema.prt_tel_no, PrtSMSNo=schema.prt_sms_no,
                    PrtEmail=schema.prt_email, PrtShowInList=schema.prt_show_in_list,
                    PrtRemark=schema.prt_remark, PrtRecState=schema.prt_rec_state or 1)
    db.add(obj); db.commit(); db.refresh(obj)
    grp = db.query(PartyGrpMst).filter(PartyGrpMst.PgmCode == obj.PrtPgmCode).first()
    return _prt_out(obj, grp)

@router.get("/parties", response_model=List[PartyResponse])
def get_parties(db: Session = Depends(get_db)):
    rows = db.query(PartyMast).filter(PartyMast.PrtRecState != 0).all()
    result = []
    for o in rows:
        grp = db.query(PartyGrpMst).filter(PartyGrpMst.PgmCode == o.PrtPgmCode).first()
        result.append(_prt_out(o, grp))
    return result

@router.put("/parties/{code}", response_model=PartyResponse)
def update_party(code: int, schema: PartyCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = db.query(PartyMast).filter(PartyMast.PrtCode == code).first()
    if not obj: raise HTTPException(404, "Not found")
    obj.PrtTitle=schema.prt_title; obj.PrtName=schema.prt_name; obj.PrtPgmCode=schema.prt_pgm_code
    obj.PrtAddr=schema.prt_addr; obj.PrtTelNo=schema.prt_tel_no; obj.PrtSMSNo=schema.prt_sms_no
    obj.PrtEmail=schema.prt_email; obj.PrtShowInList=schema.prt_show_in_list
    obj.PrtRemark=schema.prt_remark; obj.PrtRecState=schema.prt_rec_state or 1
    db.commit(); db.refresh(obj)
    grp = db.query(PartyGrpMst).filter(PartyGrpMst.PgmCode == obj.PrtPgmCode).first()
    return _prt_out(obj, grp)

@router.delete("/parties/{code}")
def delete_party(code: int, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = db.query(PartyMast).filter(PartyMast.PrtCode == code).first()
    if not obj: raise HTTPException(404, "Not found")
    obj.PrtRecState = 0; db.commit(); return {"ok": True}

# ─────────────────────────────────────────────────────────────────────────────
# Product Group Master (SubItmGrpMst)
# ─────────────────────────────────────────────────────────────────────────────
def _sig_out(o): return {"sig_code": o.SigCode, "sig_name": o.SigName, "sig_desc": o.SigDesc, "sig_rec_state": o.SigRecState}

@router.post("/product-groups", response_model=ProductGroupResponse)
def create_product_group(schema: ProductGroupCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = SubItmGrpMst(SigName=schema.sig_name, SigDesc=schema.sig_desc, SigRecState=schema.sig_rec_state or 1)
    db.add(obj); db.commit(); db.refresh(obj); return _sig_out(obj)

@router.get("/product-groups", response_model=List[ProductGroupResponse])
def get_product_groups(db: Session = Depends(get_db)):
    return [_sig_out(o) for o in db.query(SubItmGrpMst).filter(SubItmGrpMst.SigRecState != 0).all()]

@router.put("/product-groups/{code}", response_model=ProductGroupResponse)
def update_product_group(code: int, schema: ProductGroupCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = db.query(SubItmGrpMst).filter(SubItmGrpMst.SigCode == code).first()
    if not obj: raise HTTPException(404, "Not found")
    obj.SigName=schema.sig_name; obj.SigDesc=schema.sig_desc; obj.SigRecState=schema.sig_rec_state or 1
    db.commit(); db.refresh(obj); return _sig_out(obj)

@router.delete("/product-groups/{code}")
def delete_product_group(code: int, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = db.query(SubItmGrpMst).filter(SubItmGrpMst.SigCode == code).first()
    if not obj: raise HTTPException(404, "Not found")
    obj.SigRecState = 0; db.commit(); return {"ok": True}

# ─────────────────────────────────────────────────────────────────────────────
# Product Master (SubItmMast)
# ─────────────────────────────────────────────────────────────────────────────
def _sim_out(o, grp=None):
    return {"sim_code": o.SimCode, "sim_name": o.SimName, "sim_desc": o.SimDesc, "sim_sig_code": o.SimSigCode,
            "sim_purch_rate": o.SimPurchRate, "sim_mrp_rate": o.SimMRPRate, "sim_sale_rate": o.SimSaleRate,
            "sim_rec_state": o.SimRecState, "group": _sig_out(grp) if grp else None}

@router.post("/products", response_model=ProductResponse)
def create_product(schema: ProductCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = SubItmMast(SimName=schema.sim_name, SimDesc=schema.sim_desc, SimSigCode=schema.sim_sig_code,
                     SimPurchRate=schema.sim_purch_rate or 0.0, SimMRPRate=schema.sim_mrp_rate or 0.0,
                     SimSaleRate=schema.sim_sale_rate or 0.0, SimRecState=schema.sim_rec_state or 1)
    db.add(obj); db.commit(); db.refresh(obj)
    grp = db.query(SubItmGrpMst).filter(SubItmGrpMst.SigCode == obj.SimSigCode).first()
    return _sim_out(obj, grp)

@router.get("/products", response_model=List[ProductResponse])
def get_products(db: Session = Depends(get_db)):
    rows = db.query(SubItmMast).filter(SubItmMast.SimRecState != 0).all()
    result = []
    for o in rows:
        grp = db.query(SubItmGrpMst).filter(SubItmGrpMst.SigCode == o.SimSigCode).first()
        result.append(_sim_out(o, grp))
    return result

@router.put("/products/{code}", response_model=ProductResponse)
def update_product(code: int, schema: ProductCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = db.query(SubItmMast).filter(SubItmMast.SimCode == code).first()
    if not obj: raise HTTPException(404, "Not found")
    obj.SimName=schema.sim_name; obj.SimDesc=schema.sim_desc; obj.SimSigCode=schema.sim_sig_code
    obj.SimPurchRate=schema.sim_purch_rate or 0.0; obj.SimMRPRate=schema.sim_mrp_rate or 0.0
    obj.SimSaleRate=schema.sim_sale_rate or 0.0; obj.SimRecState=schema.sim_rec_state or 1
    db.commit(); db.refresh(obj)
    grp = db.query(SubItmGrpMst).filter(SubItmGrpMst.SigCode == obj.SimSigCode).first()
    return _sim_out(obj, grp)

@router.delete("/products/{code}")
def delete_product(code: int, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = db.query(SubItmMast).filter(SubItmMast.SimCode == code).first()
    if not obj: raise HTTPException(404, "Not found")
    obj.SimRecState = 0; db.commit(); return {"ok": True}

# ─────────────────────────────────────────────────────────────────────────────
# Payroll: Department Master
# ─────────────────────────────────────────────────────────────────────────────
def _dept_to_response(obj): return {"pdp_code": obj.PdpCode, "pdp_name": obj.PdpName, "pdp_desc": obj.PdpDesc, "pdp_rec_state": obj.PdpRecState}

@router.post("/payroll/departments", response_model=PayDeptResponse)
def create_department(schema: PayDeptCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = PayDeptMast(PdpName=schema.pdp_name, PdpDesc=schema.pdp_desc, PdpRecState=schema.pdp_rec_state or 1)
    db.add(obj); db.commit(); db.refresh(obj); return _dept_to_response(obj)

@router.get("/payroll/departments", response_model=List[PayDeptResponse])
def get_departments(db: Session = Depends(get_db)):
    return [_dept_to_response(r) for r in db.query(PayDeptMast).filter(PayDeptMast.PdpRecState != 0).all()]

@router.put("/payroll/departments/{code}", response_model=PayDeptResponse)
def update_department(code: int, schema: PayDeptCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = db.query(PayDeptMast).filter(PayDeptMast.PdpCode == code).first()
    if not obj: raise HTTPException(404, "Not found")
    obj.PdpName=schema.pdp_name; obj.PdpDesc=schema.pdp_desc; obj.PdpRecState=schema.pdp_rec_state or 1
    db.commit(); db.refresh(obj); return _dept_to_response(obj)

@router.delete("/payroll/departments/{code}")
def delete_department(code: int, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = db.query(PayDeptMast).filter(PayDeptMast.PdpCode == code).first()
    if not obj: raise HTTPException(404, "Not found")
    obj.PdpRecState = 0; db.commit(); return {"ok": True}

# ─────────────────────────────────────────────────────────────────────────────
# Payroll: Designation Master
# ─────────────────────────────────────────────────────────────────────────────
def _desn_to_response(obj): return {"pdn_code": obj.PdnCode, "pdn_name": obj.PdnName, "pdn_desc": obj.PdnDesc, "pdn_rec_state": obj.PdnRecState}

@router.post("/payroll/designations", response_model=PayDesnResponse)
def create_designation(schema: PayDesnCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = PayDesnMast(PdnName=schema.pdn_name, PdnDesc=schema.pdn_desc, PdnRecState=schema.pdn_rec_state or 1)
    db.add(obj); db.commit(); db.refresh(obj); return _desn_to_response(obj)

@router.get("/payroll/designations", response_model=List[PayDesnResponse])
def get_designations(db: Session = Depends(get_db)):
    return [_desn_to_response(r) for r in db.query(PayDesnMast).filter(PayDesnMast.PdnRecState != 0).all()]

@router.put("/payroll/designations/{code}", response_model=PayDesnResponse)
def update_designation(code: int, schema: PayDesnCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = db.query(PayDesnMast).filter(PayDesnMast.PdnCode == code).first()
    if not obj: raise HTTPException(404, "Not found")
    obj.PdnName=schema.pdn_name; obj.PdnDesc=schema.pdn_desc; obj.PdnRecState=schema.pdn_rec_state or 1
    db.commit(); db.refresh(obj); return _desn_to_response(obj)

@router.delete("/payroll/designations/{code}")
def delete_designation(code: int, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = db.query(PayDesnMast).filter(PayDesnMast.PdnCode == code).first()
    if not obj: raise HTTPException(404, "Not found")
    obj.PdnRecState = 0; db.commit(); return {"ok": True}

# ─────────────────────────────────────────────────────────────────────────────
# Payroll: Employee Master
# ─────────────────────────────────────────────────────────────────────────────
def _emp_to_response(obj, db):
    dept = db.query(PayDeptMast).filter(PayDeptMast.PdpCode == obj.PemDeptCode).first() if obj.PemDeptCode else None
    desn = db.query(PayDesnMast).filter(PayDesnMast.PdnCode == obj.PemDesnCode).first() if obj.PemDesnCode else None
    return {"pem_code": obj.PemCode, "pem_title": obj.PemTitle, "pem_name": obj.PemName,
            "pem_dept_code": obj.PemDeptCode, "pem_desn_code": obj.PemDesnCode,
            "pem_gender": obj.PemGender, "pem_dob": obj.PemDOB, "pem_doj": obj.PemDOJ,
            "pem_phone": obj.PemPhone, "pem_email": obj.PemEmail, "pem_address": obj.PemAddress,
            "pem_basic_salary": obj.PemBasicSalary, "pem_rec_state": obj.PemRecState,
            "department": _dept_to_response(dept) if dept else None,
            "designation": _desn_to_response(desn) if desn else None}

@router.post("/payroll/employees", response_model=PayEmpResponse)
def create_employee(schema: PayEmpCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = PayEmpMast(PemTitle=schema.pem_title, PemName=schema.pem_name, PemDeptCode=schema.pem_dept_code,
                     PemDesnCode=schema.pem_desn_code, PemGender=schema.pem_gender, PemDOB=schema.pem_dob,
                     PemDOJ=schema.pem_doj, PemPhone=schema.pem_phone, PemEmail=schema.pem_email,
                     PemAddress=schema.pem_address, PemBasicSalary=schema.pem_basic_salary or 0.0,
                     PemRecState=schema.pem_rec_state or 1)
    db.add(obj); db.commit(); db.refresh(obj)
    return _emp_to_response(obj, db)

@router.get("/payroll/employees", response_model=List[PayEmpResponse])
def get_employees(db: Session = Depends(get_db)):
    return [_emp_to_response(r, db) for r in db.query(PayEmpMast).filter(PayEmpMast.PemRecState != 0).all()]

@router.put("/payroll/employees/{code}", response_model=PayEmpResponse)
def update_employee(code: int, schema: PayEmpCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = db.query(PayEmpMast).filter(PayEmpMast.PemCode == code).first()
    if not obj: raise HTTPException(404, "Not found")
    obj.PemTitle=schema.pem_title; obj.PemName=schema.pem_name; obj.PemDeptCode=schema.pem_dept_code
    obj.PemDesnCode=schema.pem_desn_code; obj.PemGender=schema.pem_gender; obj.PemDOB=schema.pem_dob
    obj.PemDOJ=schema.pem_doj; obj.PemPhone=schema.pem_phone; obj.PemEmail=schema.pem_email
    obj.PemAddress=schema.pem_address; obj.PemBasicSalary=schema.pem_basic_salary or 0.0
    obj.PemRecState=schema.pem_rec_state or 1
    db.commit(); db.refresh(obj)
    return _emp_to_response(obj, db)

@router.delete("/payroll/employees/{code}")
def delete_employee(code: int, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = db.query(PayEmpMast).filter(PayEmpMast.PemCode == code).first()
    if not obj: raise HTTPException(404, "Not found")
    obj.PemRecState = 0; db.commit(); return {"ok": True}

# ─────────────────────────────────────────────────────────────────────────────
# Diagnosis Master
# ─────────────────────────────────────────────────────────────────────────────
def _dig_out(o): return {"dig_code": o.DigCode, "dig_name": o.DigName, "dig_rec_state": o.DigRecState}

@router.post("/diagnoses", response_model=DiagResponse)
def create_diagnosis(schema: DiagCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = DiagMast(DigName=schema.dig_name, DigRecState=schema.dig_rec_state or 1)
    db.add(obj); db.commit(); db.refresh(obj)
    return _dig_out(obj)

@router.get("/diagnoses", response_model=List[DiagResponse])
def get_diagnoses(db: Session = Depends(get_db)):
    return [_dig_out(o) for o in db.query(DiagMast).filter(DiagMast.DigRecState != 0).all()]

@router.put("/diagnoses/{code}", response_model=DiagResponse)
def update_diagnosis(code: int, schema: DiagCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = db.query(DiagMast).filter(DiagMast.DigCode == code).first()
    if not obj: raise HTTPException(404, "Not found")
    obj.DigName=schema.dig_name; obj.DigRecState=schema.dig_rec_state or 1
    db.commit(); db.refresh(obj)
    return _dig_out(obj)

@router.delete("/diagnoses/{code}")
def delete_diagnosis(code: int, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = db.query(DiagMast).filter(DiagMast.DigCode == code).first()
    if not obj: raise HTTPException(404, "Not found")
    obj.DigRecState = 0; db.commit()
    return {"ok": True}


# ─────────────────────────────────────────────────────────────────────────────
# Security Masters (UserRoleMst, UserMast, UserRightMst)
# ─────────────────────────────────────────────────────────────────────────────
from backend.models.auth import UserRoleMst, UserMast, UserRightMst
from backend.schemas.auth import (
    UserRoleCreate, UserRoleUpdate, UserRoleResponse,
    UserMastCreate, UserMastUpdate, UserMastResponse,
    UserRightCreate, UserRightUpdate, UserRightResponse,
    ChangePasswordRequest
)
from backend.core.security import get_password_hash, verify_password

@router.post("/user-roles", response_model=UserRoleResponse)
def create_user_role(schema: UserRoleCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    role = UserRoleMst(UrlName=schema.UrlName, UrlRecState=1)
    db.add(role)
    db.commit()
    db.refresh(role)
    return role

@router.get("/user-roles", response_model=List[UserRoleResponse])
def get_user_roles(db: Session = Depends(get_db)):
    return db.query(UserRoleMst).filter(UserRoleMst.UrlRecState != 0).all()

@router.put("/user-roles/{code}", response_model=UserRoleResponse)
def update_user_role(code: int, schema: UserRoleUpdate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    role = db.query(UserRoleMst).filter(UserRoleMst.UrlCode == code).first()
    if not role:
        raise HTTPException(404, "Role not found")
    role.UrlName = schema.UrlName
    if schema.UrlRecState is not None:
        role.UrlRecState = schema.UrlRecState
    db.commit()
    db.refresh(role)
    return role

@router.delete("/user-roles/{code}")
def delete_user_role(code: int, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    role = db.query(UserRoleMst).filter(UserRoleMst.UrlCode == code).first()
    if not role:
        raise HTTPException(404, "Role not found")
    role.UrlRecState = 0
    db.commit()
    return {"ok": True}


@router.post("/users", response_model=UserMastResponse)
def create_user_mast(schema: UserMastCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    existing = db.query(UserMast).filter(UserMast.UsrName == schema.UsrName).first()
    if existing:
        raise HTTPException(400, "Username already exists")
    
    hashed_pwd = get_password_hash(schema.UsrPwd)
    user = UserMast(
        UsrName=schema.UsrName,
        UsrPwd=hashed_pwd,
        UsrUrlCode=schema.UsrUrlCode,
        UsrRecState=schema.UsrRecState or 1
    )
    db.add(user)
    db.commit()
    db.refresh(user)
    
    role = db.query(UserRoleMst).filter(UserRoleMst.UrlCode == user.UsrUrlCode).first()
    res = UserMastResponse.model_validate(user)
    res.role_name = role.UrlName if role else None
    return res

@router.get("/users", response_model=List[UserMastResponse])
def get_users_mast(db: Session = Depends(get_db)):
    users = db.query(UserMast).filter(UserMast.UsrRecState != 0).all()
    results = []
    for u in users:
        role = db.query(UserRoleMst).filter(UserRoleMst.UrlCode == u.UsrUrlCode).first()
        res = UserMastResponse.model_validate(u)
        res.role_name = role.UrlName if role else None
        results.append(res)
    return results

@router.put("/users/{code}", response_model=UserMastResponse)
def update_user_mast(code: int, schema: UserMastUpdate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    user = db.query(UserMast).filter(UserMast.UsrCode == code).first()
    if not user:
        raise HTTPException(404, "User not found")
    
    user.UsrName = schema.UsrName
    user.UsrUrlCode = schema.UsrUrlCode
    if schema.UsrRecState is not None:
        user.UsrRecState = schema.UsrRecState
    
    if schema.UsrPwd:
        user.UsrPwd = get_password_hash(schema.UsrPwd)
        
    db.commit()
    db.refresh(user)
    
    role = db.query(UserRoleMst).filter(UserRoleMst.UrlCode == user.UsrUrlCode).first()
    res = UserMastResponse.model_validate(user)
    res.role_name = role.UrlName if role else None
    return res

@router.delete("/users/{code}")
def delete_user_mast(code: int, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    user = db.query(UserMast).filter(UserMast.UsrCode == code).first()
    if not user:
        raise HTTPException(404, "User not found")
    user.UsrRecState = 0
    db.commit()
    return {"ok": True}

@router.post("/users/change-password")
def change_user_password(schema: ChangePasswordRequest, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    user = db.query(UserMast).filter(UserMast.UsrCode == schema.UsrCode).first()
    if not user:
        raise HTTPException(404, "User not found")
    
    if not verify_password(schema.current_password, user.UsrPwd):
        raise HTTPException(400, "Incorrect current password")
        
    user.UsrPwd = get_password_hash(schema.new_password)
    db.commit()
    return {"success": True, "message": "Password changed successfully"}


@router.post("/user-rights", response_model=UserRightResponse)
def create_user_right(schema: UserRightCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    query = db.query(UserRightMst).filter(UserRightMst.UhtSecuOptName == schema.UhtSecuOptName)
    if schema.UhtUsrCode:
        query = query.filter(UserRightMst.UhtUsrCode == schema.UhtUsrCode)
    if schema.UhtUrlCode:
        query = query.filter(UserRightMst.UhtUrlCode == schema.UhtUrlCode)
        
    existing = query.first()
    if existing:
         raise HTTPException(400, "User right for this security option already exists")
         
    right = UserRightMst(
        UhtUsrCode=schema.UhtUsrCode,
        UhtUrlCode=schema.UhtUrlCode,
        UhtSecuOptName=schema.UhtSecuOptName,
        UhtCanAdd=schema.UhtCanAdd,
        UhtCanEdit=schema.UhtCanEdit,
        UhtCanDelete=schema.UhtCanDelete,
        UhtCanView=schema.UhtCanView,
        UhtRemark=schema.UhtRemark,
        UhtRecState=schema.UhtRecState or 1
    )
    db.add(right)
    db.commit()
    db.refresh(right)
    
    usr = db.query(UserMast).filter(UserMast.UsrCode == right.UhtUsrCode).first() if right.UhtUsrCode else None
    role = db.query(UserRoleMst).filter(UserRoleMst.UrlCode == right.UhtUrlCode).first() if right.UhtUrlCode else None
    
    res = UserRightResponse.model_validate(right)
    res.user_name = usr.UsrName if usr else None
    res.role_name = role.UrlName if role else None
    return res

@router.get("/user-rights", response_model=List[UserRightResponse])
def get_user_rights(db: Session = Depends(get_db)):
    rights = db.query(UserRightMst).filter(UserRightMst.UhtRecState != 0).all()
    results = []
    for r in rights:
        usr = db.query(UserMast).filter(UserMast.UsrCode == r.UhtUsrCode).first() if r.UhtUsrCode else None
        role = db.query(UserRoleMst).filter(UserRoleMst.UrlCode == r.UhtUrlCode).first() if r.UhtUrlCode else None
        
        res = UserRightResponse.model_validate(r)
        res.user_name = usr.UsrName if usr else None
        res.role_name = role.UrlName if role else None
        results.append(res)
    return results

@router.put("/user-rights/{code}", response_model=UserRightResponse)
def update_user_right(code: int, schema: UserRightUpdate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    right = db.query(UserRightMst).filter(UserRightMst.UhtCode == code).first()
    if not right:
        raise HTTPException(404, "User right not found")
        
    right.UhtUsrCode = schema.UhtUsrCode
    right.UhtUrlCode = schema.UhtUrlCode
    right.UhtSecuOptName = schema.UhtSecuOptName
    right.UhtCanAdd = schema.UhtCanAdd
    right.UhtCanEdit = schema.UhtCanEdit
    right.UhtCanDelete = schema.UhtCanDelete
    right.UhtCanView = schema.UhtCanView
    right.UhtRemark = schema.UhtRemark
    if schema.UhtRecState is not None:
        right.UhtRecState = schema.UhtRecState
        
    db.commit()
    db.refresh(right)
    
    usr = db.query(UserMast).filter(UserMast.UsrCode == right.UhtUsrCode).first() if right.UhtUsrCode else None
    role = db.query(UserRoleMst).filter(UserRoleMst.UrlCode == right.UhtUrlCode).first() if right.UhtUrlCode else None
    
    res = UserRightResponse.model_validate(right)
    res.user_name = usr.UsrName if usr else None
    res.role_name = role.UrlName if role else None
    return res

@router.delete("/user-rights/{code}")
def delete_user_right(code: int, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    right = db.query(UserRightMst).filter(UserRightMst.UhtCode == code).first()
    if not right:
        raise HTTPException(404, "User right not found")
    right.UhtRecState = 0
    db.commit()
    return {"ok": True}

