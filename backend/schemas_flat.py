from pydantic import BaseModel
from typing import Optional, List
from datetime import date, datetime

# User Schemas
class UserBase(BaseModel):
    username: str
    email: str
    full_name: Optional[str] = None
    role: Optional[str] = "admin"

class UserCreate(UserBase):
    password: str

class UserLogin(BaseModel):
    username: str
    password: str

class UserResponse(UserBase):
    id: int
    is_active: bool
    created_at: datetime

    class Config:
        from_attributes = True

class Token(BaseModel):
    access_token: str
    token_type: str

class TokenData(BaseModel):
    username: Optional[str] = None

# Patient Category Schemas
class PatientCategoryBase(BaseModel):
    pcg_name: str
    pcg_inf_allowed: Optional[bool] = True
    pcg_def_allowed: Optional[bool] = True
    pcg_disc_allowed: Optional[bool] = True
    pcg_disc_per: Optional[float] = 0.0
    pcg_show_in_list: Optional[bool] = True
    pcg_rec_state: Optional[int] = 1

class PatientCategoryCreate(PatientCategoryBase):
    pass

class PatientCategoryResponse(PatientCategoryBase):
    pcg_code: int

    class Config:
        from_attributes = True

# Patient Schemas
class PatientBase(BaseModel):
    ptt_name: str
    ptt_reg_no: Optional[int] = None
    ptt_sex: Optional[str] = None
    ptt_dob: Optional[date] = None
    ptt_address: Optional[str] = None
    ptt_telephone: Optional[str] = None
    ptt_sms_no: Optional[str] = None
    ptt_email: Optional[str] = None
    ptt_pcg_code: Optional[int] = None
    ptt_remark: Optional[str] = None
    ptt_rec_state: Optional[int] = 1

class PatientCreate(PatientBase):
    pass

class PatientResponse(PatientBase):
    ptt_code: int
    ptt_reg_date: datetime
    category: Optional[PatientCategoryResponse] = None

    class Config:
        from_attributes = True

# Doctor Category Schemas
class DoctorCategoryBase(BaseModel):
    dcg_name: str
    dcg_rec_state: Optional[int] = 1

class DoctorCategoryCreate(DoctorCategoryBase):
    pass

class DoctorCategoryResponse(DoctorCategoryBase):
    dcg_code: int

    class Config:
        from_attributes = True

# Doctor Role Schemas
class DoctorRoleBase(BaseModel):
    drl_name: str
    drl_rec_state: Optional[int] = 1

class DoctorRoleCreate(DoctorRoleBase):
    pass

class DoctorRoleResponse(DoctorRoleBase):
    drl_code: int

    class Config:
        from_attributes = True

# Doctor Schemas
class DoctorBase(BaseModel):
    dct_title: Optional[str] = None
    dct_name: str
    dct_specialty: Optional[str] = None
    dct_dcg_code: Optional[int] = None
    dct_drl_code: Optional[int] = None
    dct_address: Optional[str] = None
    dct_telephone: Optional[str] = None
    dct_email: Optional[str] = None
    dct_share_percent: Optional[float] = 0.0
    dct_rec_state: Optional[int] = 1

class DoctorCreate(DoctorBase):
    pass

class DoctorResponse(DoctorBase):
    dct_code: int
    category: Optional[DoctorCategoryResponse] = None
    role: Optional[DoctorRoleResponse] = None

    class Config:
        from_attributes = True

# Floor Schemas
class FloorBase(BaseModel):
    flr_name: str
    flr_rec_state: Optional[int] = 1

class FloorCreate(FloorBase):
    pass

class FloorResponse(FloorBase):
    flr_code: int

    class Config:
        from_attributes = True

# Ward Schemas
class WardBase(BaseModel):
    wrd_name: str
    wrd_flr_code: int
    wrd_rec_state: Optional[int] = 1

class WardCreate(WardBase):
    pass

class WardResponse(WardBase):
    wrd_code: int
    floor: Optional[FloorResponse] = None

    class Config:
        from_attributes = True

# Bed Schemas
class BedBase(BaseModel):
    bdm_name: str
    bdm_wrd_code: int
    bdm_rec_state: Optional[int] = 1
    is_occupied: Optional[bool] = False

class BedCreate(BedBase):
    pass

class BedResponse(BedBase):
    bdm_code: int
    ward: Optional[WardResponse] = None

    class Config:
        from_attributes = True

# Service Group Schemas
class ServiceGroupBase(BaseModel):
    sgp_name: str
    sgp_rec_state: Optional[int] = 1

class ServiceGroupCreate(ServiceGroupBase):
    pass

class ServiceGroupResponse(ServiceGroupBase):
    sgp_code: int

    class Config:
        from_attributes = True

# Service Schemas
class ServiceBase(BaseModel):
    srv_name: str
    srv_sgp_code: Optional[int] = None
    srv_rate: Optional[float] = 0.0
    srv_rec_state: Optional[int] = 1

class ServiceCreate(ServiceBase):
    pass

class ServiceResponse(ServiceBase):
    srv_code: int
    group: Optional[ServiceGroupResponse] = None

    class Config:
        from_attributes = True

# OPD Registration Schemas
class OPDRegistrationBase(BaseModel):
    opg_ptt_code: int
    opg_dct_code: int
    opg_fee: Optional[float] = 0.0
    opg_rec_state: Optional[int] = 1

class OPDRegistrationCreate(OPDRegistrationBase):
    pass

class OPDBillResponse(BaseModel):
    bill_id: int
    bill_no: str
    total_amount: float
    discount_amount: float
    net_amount: float
    paid_amount: float
    status: str
    created_at: datetime

    class Config:
        from_attributes = True

class OPDRegistrationResponse(OPDRegistrationBase):
    opg_code: int
    opg_visit_date: datetime
    patient: Optional[PatientResponse] = None
    doctor: Optional[DoctorResponse] = None
    bills: List[OPDBillResponse] = []

    class Config:
        from_attributes = True

# OPD Bill Creation
class OPDBillCreate(BaseModel):
    opg_code: int
    total_amount: float
    discount_amount: Optional[float] = 0.0
    net_amount: float
    paid_amount: float
    status: str

# IPD Admission Schemas
class IPDAdmissionBase(BaseModel):
    ipd_ptt_code: int
    ipd_dct_code: int
    ipd_bdm_code: int
    ipd_deposit: Optional[float] = 0.0
    ipd_status: Optional[str] = "admitted"
    ipd_rec_state: Optional[int] = 1

class IPDAdmissionCreate(IPDAdmissionBase):
    pass

class IPDBillResponse(BaseModel):
    bill_id: int
    bill_no: str
    room_charges: float
    service_charges: float
    total_amount: float
    discount_amount: float
    net_amount: float
    paid_amount: float
    status: str
    created_at: datetime

    class Config:
        from_attributes = True

class IPDAdmissionResponse(IPDAdmissionBase):
    ipd_code: int
    ipd_admission_date: datetime
    ipd_discharge_date: Optional[datetime] = None
    patient: Optional[PatientResponse] = None
    doctor: Optional[DoctorResponse] = None
    bed: Optional[BedResponse] = None
    bills: List[IPDBillResponse] = []

    class Config:
        from_attributes = True

# IPD Bill Creation
class IPDBillCreate(BaseModel):
    ipd_code: int
    room_charges: float
    service_charges: float
    total_amount: float
    discount_amount: Optional[float] = 0.0
    net_amount: float
    paid_amount: float
    status: str

# Dashboard Analytics Schema
class DashboardStats(BaseModel):
    total_patients: int
    total_doctors: int
    total_beds: int
    occupied_beds: int
    opd_today_count: int
    ipd_today_count: int
    total_revenue_today: float
