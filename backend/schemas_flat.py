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
    pcg_type: Optional[str] = None

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
    flr_show_in_list: Optional[bool] = True

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
    wrd_show_in_list: Optional[bool] = True

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
    bdm_flr_code: Optional[int] = None
    bdm_srv_code: Optional[int] = None
    bdm_index: Optional[int] = 0
    bdm_charges: Optional[float] = 0.0
    bdm_disc_allowed: Optional[bool] = False
    bdm_disc_per: Optional[float] = 0.0
    bdm_chk_out_time_basis: Optional[str] = None
    bdm_chk_time: Optional[str] = None
    bdm_free_allot: Optional[bool] = False
    bdm_remark: Optional[str] = None
    bdm_show_in_list: Optional[bool] = True

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
    sgp_index: Optional[int] = 0
    sgp_expanded: Optional[bool] = False
    sgp_editable: Optional[bool] = False
    sgp_inf_allowed: Optional[bool] = False
    sgp_def_allowed: Optional[bool] = False
    sgp_disc_allowed: Optional[bool] = False
    sgp_disc_per: Optional[float] = 0.0
    sgp_show_in_list: Optional[bool] = True

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
    srv_index: Optional[int] = 0
    srv_rate_editable: Optional[bool] = False
    srv_amt_editable: Optional[bool] = False
    srv_unit_editable: Optional[bool] = False
    srv_multi_dct: Optional[bool] = False
    srv_show_in_list: Optional[bool] = True
    srv_auto_ins_indr: Optional[bool] = False
    srv_auto_ins_once_indr: Optional[bool] = False
    srv_auto_calc_indr: Optional[bool] = False
    srv_inf_allowed: Optional[bool] = False
    srv_def_allowed: Optional[bool] = False
    srv_disc_allowed: Optional[bool] = False
    srv_disc_per: Optional[float] = 0.0

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

# ── Payroll Schemas ────────────────────────────────────────────────────────────

class PayDeptBase(BaseModel):
    pdp_name: str
    pdp_desc: Optional[str] = None
    pdp_rec_state: Optional[int] = 1

class PayDeptCreate(PayDeptBase):
    pass

class PayDeptResponse(PayDeptBase):
    pdp_code: int

    class Config:
        from_attributes = True


class PayDesnBase(BaseModel):
    pdn_name: str
    pdn_desc: Optional[str] = None
    pdn_rec_state: Optional[int] = 1

class PayDesnCreate(PayDesnBase):
    pass

class PayDesnResponse(PayDesnBase):
    pdn_code: int

    class Config:
        from_attributes = True


class PayEmpBase(BaseModel):
    pem_title: Optional[str] = None
    pem_name: str
    pem_dept_code: Optional[int] = None
    pem_desn_code: Optional[int] = None
    pem_gender: Optional[str] = None
    pem_dob: Optional[date] = None
    pem_doj: Optional[date] = None
    pem_phone: Optional[str] = None
    pem_email: Optional[str] = None
    pem_address: Optional[str] = None
    pem_basic_salary: Optional[float] = 0.0
    pem_rec_state: Optional[int] = 1

class PayEmpCreate(PayEmpBase):
    pass

class PayEmpResponse(PayEmpBase):
    pem_code: int
    department: Optional[PayDeptResponse] = None
    designation: Optional[PayDesnResponse] = None

    class Config:
        from_attributes = True


# ── Referred Category Schemas ───────────────────────────────────────────────────
class RefCatgBase(BaseModel):
    rfg_name: str
    rfg_rec_state: Optional[int] = 1

class RefCatgCreate(RefCatgBase):
    pass

class RefCatgResponse(RefCatgBase):
    rfg_code: int
    class Config:
        from_attributes = True

# ── Referred By Master Schemas ──────────────────────────────────────────────────
class RefByBase(BaseModel):
    rby_name: str
    rby_speci: Optional[str] = None
    rby_rfg_code: Optional[int] = None
    rby_addr: Optional[str] = None
    rby_tel_no: Optional[str] = None
    rby_email: Optional[str] = None
    rby_share: Optional[float] = 0.0
    rby_rec_state: Optional[int] = 1

class RefByCreate(RefByBase):
    pass

class RefByResponse(RefByBase):
    rby_code: int
    category: Optional[RefCatgResponse] = None
    class Config:
        from_attributes = True

# ── Referred To Master Schemas ──────────────────────────────────────────────────
class RefToBase(BaseModel):
    rto_name: str
    rto_speci: Optional[str] = None
    rto_rfg_code: Optional[int] = None
    rto_addr: Optional[str] = None
    rto_tel_no: Optional[str] = None
    rto_email: Optional[str] = None
    rto_share: Optional[float] = 0.0
    rto_rec_state: Optional[int] = 1

class RefToCreate(RefToBase):
    pass

class RefToResponse(RefToBase):
    rto_code: int
    category: Optional[RefCatgResponse] = None
    class Config:
        from_attributes = True

# ── Station Master Schemas ──────────────────────────────────────────────────────
class StationBase(BaseModel):
    stn_name: str
    stn_show_in_list: Optional[bool] = True
    stn_rec_state: Optional[int] = 1

class StationCreate(StationBase):
    pass

class StationResponse(StationBase):
    stn_code: int
    class Config:
        from_attributes = True

# ── Area Master Schemas ─────────────────────────────────────────────────────────
class AreaBase(BaseModel):
    ara_name: str
    ara_stn_code: Optional[int] = None
    ara_rec_state: Optional[int] = 1

class AreaCreate(AreaBase):
    pass

class AreaResponse(AreaBase):
    ara_code: int
    station: Optional[StationResponse] = None
    class Config:
        from_attributes = True

# ── Party Group Master Schemas ──────────────────────────────────────────────────
class PartyGroupBase(BaseModel):
    pgm_name: str
    pgm_desc: Optional[str] = None
    pgm_rec_state: Optional[int] = 1

class PartyGroupCreate(PartyGroupBase):
    pass

class PartyGroupResponse(PartyGroupBase):
    pgm_code: int
    class Config:
        from_attributes = True

# ── Party (Supplier) Master Schemas ────────────────────────────────────────────
class PartyBase(BaseModel):
    prt_title: Optional[str] = None
    prt_name: str
    prt_pgm_code: int
    prt_addr: Optional[str] = None
    prt_tel_no: Optional[str] = None
    prt_sms_no: Optional[str] = None
    prt_email: Optional[str] = None
    prt_show_in_list: Optional[bool] = True
    prt_remark: Optional[str] = None
    prt_rec_state: Optional[int] = 1

class PartyCreate(PartyBase):
    pass

class PartyResponse(PartyBase):
    prt_code: int
    group: Optional[PartyGroupResponse] = None
    class Config:
        from_attributes = True

# ── Sub-Item (Product) Group Master Schemas ─────────────────────────────────────
class ProductGroupBase(BaseModel):
    sig_name: str
    sig_desc: Optional[str] = None
    sig_rec_state: Optional[int] = 1

class ProductGroupCreate(ProductGroupBase):
    pass

class ProductGroupResponse(ProductGroupBase):
    sig_code: int
    class Config:
        from_attributes = True

# ── Sub-Item (Product) Master Schemas ───────────────────────────────────────────
class ProductBase(BaseModel):
    sim_name: str
    sim_desc: Optional[str] = None
    sim_sig_code: int
    sim_purch_rate: Optional[float] = 0.0
    sim_mrp_rate: Optional[float] = 0.0
    sim_sale_rate: Optional[float] = 0.0
    sim_rec_state: Optional[int] = 1

class ProductCreate(ProductBase):
    pass

class ProductResponse(ProductBase):
    sim_code: int
    group: Optional[ProductGroupResponse] = None
    class Config:
        from_attributes = True

# ── Diagnosis Master Schemas ────────────────────────────────────────────────────
class DiagBase(BaseModel):
    dig_name: str
    dig_rec_state: Optional[int] = 1

class DiagCreate(DiagBase):
    pass

class DiagResponse(DiagBase):
    dig_code: int
    class Config:
        from_attributes = True
