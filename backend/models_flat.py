import datetime
from sqlalchemy import Column, Integer, String, Boolean, Double, SmallInteger, Date, DateTime, ForeignKey, Text
from sqlalchemy.orm import relationship
from backend.database import Base

class User(Base):
    __tablename__ = "users"
    
    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    username = Column(String(50), unique=True, index=True, nullable=False)
    email = Column(String(100), unique=True, index=True, nullable=False)
    hashed_password = Column(String(255), nullable=False)
    full_name = Column(String(100), nullable=True)
    role = Column(String(20), default="admin") # "admin" initially
    is_active = Column(Boolean, default=True)
    created_at = Column(DateTime, default=datetime.datetime.utcnow)

class PatientCategory(Base):
    __tablename__ = "patient_categories"
    
    pcg_code = Column(Integer, primary_key=True, index=True, autoincrement=True)
    pcg_name = Column(String(50), nullable=False)
    pcg_inf_allowed = Column(Boolean, default=True)
    pcg_def_allowed = Column(Boolean, default=True)
    pcg_disc_allowed = Column(Boolean, default=True)
    pcg_disc_per = Column(Double, default=0.0)
    pcg_show_in_list = Column(Boolean, default=True)
    pcg_rec_state = Column(SmallInteger, default=1) # 1 = Active, 0 = Inactive
    pcg_type = Column(String(50), nullable=True)

    patients = relationship("Patient", back_populates="category")

class Patient(Base):
    __tablename__ = "patients"
    
    ptt_code = Column(Integer, primary_key=True, index=True, autoincrement=True)
    ptt_name = Column(String(100), nullable=False)
    ptt_reg_no = Column(Integer, index=True, nullable=True)
    ptt_reg_date = Column(DateTime, default=datetime.datetime.utcnow)
    ptt_sex = Column(String(10), nullable=True)
    ptt_dob = Column(Date, nullable=True)
    ptt_address = Column(String(250), nullable=True)
    ptt_telephone = Column(String(50), nullable=True)
    ptt_sms_no = Column(String(50), nullable=True)
    ptt_email = Column(String(100), nullable=True)
    ptt_pcg_code = Column(Integer, ForeignKey("patient_categories.pcg_code"), nullable=True)
    ptt_remark = Column(String(250), nullable=True)
    ptt_rec_state = Column(SmallInteger, default=1)

    category = relationship("PatientCategory", back_populates="patients")
    opd_registrations = relationship("OPDRegistration", back_populates="patient")
    ipd_admissions = relationship("IPDAdmission", back_populates="patient")

class DoctorCategory(Base):
    __tablename__ = "doctor_categories"
    
    dcg_code = Column(Integer, primary_key=True, index=True, autoincrement=True)
    dcg_name = Column(String(50), nullable=False)
    dcg_rec_state = Column(SmallInteger, default=1)

    doctors = relationship("Doctor", back_populates="category")

class DoctorRole(Base):
    __tablename__ = "doctor_roles"
    
    drl_code = Column(Integer, primary_key=True, index=True, autoincrement=True)
    drl_name = Column(String(50), nullable=False)
    drl_rec_state = Column(SmallInteger, default=1)

    doctors = relationship("Doctor", back_populates="role")

class Doctor(Base):
    __tablename__ = "doctors"
    
    dct_code = Column(Integer, primary_key=True, index=True, autoincrement=True)
    dct_title = Column(String(10), nullable=True)
    dct_name = Column(String(100), nullable=False)
    dct_specialty = Column(String(100), nullable=True)
    dct_dcg_code = Column(Integer, ForeignKey("doctor_categories.dcg_code"), nullable=True)
    dct_drl_code = Column(Integer, ForeignKey("doctor_roles.drl_code"), nullable=True)
    dct_address = Column(String(250), nullable=True)
    dct_telephone = Column(String(50), nullable=True)
    dct_email = Column(String(100), nullable=True)
    dct_share_percent = Column(Double, default=0.0)
    dct_rec_state = Column(SmallInteger, default=1)

    category = relationship("DoctorCategory", back_populates="doctors")
    role = relationship("DoctorRole", back_populates="doctors")
    opd_registrations = relationship("OPDRegistration", back_populates="doctor")
    ipd_admissions = relationship("IPDAdmission", back_populates="doctor")

class Floor(Base):
    __tablename__ = "floors"
    
    flr_code = Column(Integer, primary_key=True, index=True, autoincrement=True)
    flr_name = Column(String(50), nullable=False)
    flr_rec_state = Column(SmallInteger, default=1)
    flr_show_in_list = Column(Boolean, default=True)

    wards = relationship("Ward", back_populates="floor")

class Ward(Base):
    __tablename__ = "wards"
    
    wrd_code = Column(Integer, primary_key=True, index=True, autoincrement=True)
    wrd_name = Column(String(50), nullable=False)
    wrd_flr_code = Column(Integer, ForeignKey("floors.flr_code"), nullable=True)
    wrd_rec_state = Column(SmallInteger, default=1)
    wrd_show_in_list = Column(Boolean, default=True)

    floor = relationship("Floor", back_populates="wards")
    beds = relationship("Bed", back_populates="ward")

class Bed(Base):
    __tablename__ = "beds"
    
    bdm_code = Column(Integer, primary_key=True, index=True, autoincrement=True)
    bdm_name = Column(String(50), nullable=False)
    bdm_wrd_code = Column(Integer, ForeignKey("wards.wrd_code"), nullable=False)
    bdm_rec_state = Column(SmallInteger, default=1)
    is_occupied = Column(Boolean, default=False)
    bdm_flr_code = Column(Integer, ForeignKey("floors.flr_code"), nullable=True)
    bdm_srv_code = Column(Integer, ForeignKey("services.srv_code"), nullable=True)
    bdm_index = Column(SmallInteger, default=0)
    bdm_charges = Column(Double, default=0.0)
    bdm_disc_allowed = Column(Boolean, default=False)
    bdm_disc_per = Column(Double, default=0.0)
    bdm_chk_out_time_basis = Column(String(100), nullable=True)
    bdm_chk_time = Column(String(50), nullable=True)
    bdm_free_allot = Column(Boolean, default=False)
    bdm_remark = Column(String(250), nullable=True)
    bdm_show_in_list = Column(Boolean, default=True)

    ward = relationship("Ward", back_populates="beds")
    ipd_admissions = relationship("IPDAdmission", back_populates="bed")

class ServiceGroup(Base):
    __tablename__ = "service_groups"
    
    sgp_code = Column(Integer, primary_key=True, index=True, autoincrement=True)
    sgp_name = Column(String(50), nullable=False)
    sgp_rec_state = Column(SmallInteger, default=1)
    sgp_index = Column(SmallInteger, default=0)
    sgp_expanded = Column(Boolean, default=False)
    sgp_editable = Column(Boolean, default=False)
    sgp_inf_allowed = Column(Boolean, default=False)
    sgp_def_allowed = Column(Boolean, default=False)
    sgp_disc_allowed = Column(Boolean, default=False)
    sgp_disc_per = Column(Double, default=0.0)
    sgp_show_in_list = Column(Boolean, default=True)

    services = relationship("Service", back_populates="group")

class Service(Base):
    __tablename__ = "services"
    
    srv_code = Column(Integer, primary_key=True, index=True, autoincrement=True)
    srv_name = Column(String(100), nullable=False)
    srv_sgp_code = Column(Integer, ForeignKey("service_groups.sgp_code"), nullable=True)
    srv_rate = Column(Double, default=0.0)
    srv_rec_state = Column(SmallInteger, default=1)
    srv_index = Column(SmallInteger, default=0)
    srv_rate_editable = Column(Boolean, default=False)
    srv_amt_editable = Column(Boolean, default=False)
    srv_unit_editable = Column(Boolean, default=False)
    srv_multi_dct = Column(Boolean, default=False)
    srv_show_in_list = Column(Boolean, default=True)
    srv_auto_ins_indr = Column(Boolean, default=False)
    srv_auto_ins_once_indr = Column(Boolean, default=False)
    srv_auto_calc_indr = Column(Boolean, default=False)
    srv_inf_allowed = Column(Boolean, default=False)
    srv_def_allowed = Column(Boolean, default=False)
    srv_disc_allowed = Column(Boolean, default=False)
    srv_disc_per = Column(Double, default=0.0)

    group = relationship("ServiceGroup", back_populates="services")

class OPDRegistration(Base):
    __tablename__ = "opd_registrations"
    
    opg_code = Column(Integer, primary_key=True, index=True, autoincrement=True)
    opg_ptt_code = Column(Integer, ForeignKey("patients.ptt_code"), nullable=False)
    opg_dct_code = Column(Integer, ForeignKey("doctors.dct_code"), nullable=False)
    opg_visit_date = Column(DateTime, default=datetime.datetime.utcnow)
    opg_fee = Column(Double, default=0.0)
    opg_rec_state = Column(SmallInteger, default=1)

    patient = relationship("Patient", back_populates="opd_registrations")
    doctor = relationship("Doctor", back_populates="opd_registrations")
    bills = relationship("OPDBill", back_populates="opd_registration")

class OPDBill(Base):
    __tablename__ = "opd_bills"
    
    bill_id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    bill_no = Column(String(50), unique=True, index=True, nullable=False)
    opg_code = Column(Integer, ForeignKey("opd_registrations.opg_code"), nullable=False)
    total_amount = Column(Double, default=0.0)
    discount_amount = Column(Double, default=0.0)
    net_amount = Column(Double, default=0.0)
    paid_amount = Column(Double, default=0.0)
    status = Column(String(20), default="unpaid") # "paid", "unpaid", "partial"
    created_at = Column(DateTime, default=datetime.datetime.utcnow)

    opd_registration = relationship("OPDRegistration", back_populates="bills")

class IPDAdmission(Base):
    __tablename__ = "ipd_admissions"
    
    ipd_code = Column(Integer, primary_key=True, index=True, autoincrement=True)
    ipd_ptt_code = Column(Integer, ForeignKey("patients.ptt_code"), nullable=False)
    ipd_dct_code = Column(Integer, ForeignKey("doctors.dct_code"), nullable=False)
    ipd_bdm_code = Column(Integer, ForeignKey("beds.bdm_code"), nullable=False)
    ipd_admission_date = Column(DateTime, default=datetime.datetime.utcnow)
    ipd_discharge_date = Column(DateTime, nullable=True)
    ipd_deposit = Column(Double, default=0.0)
    ipd_status = Column(String(20), default="admitted") # "admitted", "discharged"
    ipd_rec_state = Column(SmallInteger, default=1)

    patient = relationship("Patient", back_populates="ipd_admissions")
    doctor = relationship("Doctor", back_populates="ipd_admissions")
    bed = relationship("Bed", back_populates="ipd_admissions")
    bills = relationship("IPDBill", back_populates="ipd_admission")

class IPDBill(Base):
    __tablename__ = "ipd_bills"
    
    bill_id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    bill_no = Column(String(50), unique=True, index=True, nullable=False)
    ipd_code = Column(Integer, ForeignKey("ipd_admissions.ipd_code"), nullable=False)
    room_charges = Column(Double, default=0.0)
    service_charges = Column(Double, default=0.0)
    total_amount = Column(Double, default=0.0)
    discount_amount = Column(Double, default=0.0)
    net_amount = Column(Double, default=0.0)
    paid_amount = Column(Double, default=0.0)
    status = Column(String(20), default="unpaid") # "paid", "unpaid", "partial"
    created_at = Column(DateTime, default=datetime.datetime.utcnow)

    ipd_admission = relationship("IPDAdmission", back_populates="bills")

class AuditLog(Base):
    __tablename__ = "audit_logs"
    
    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    table_name = Column(String(50), nullable=False)
    record_id = Column(Integer, nullable=False)
    action = Column(String(20), nullable=False) # "INSERT", "UPDATE", "DELETE"
    old_values = Column(Text, nullable=True)
    new_values = Column(Text, nullable=True)
    timestamp = Column(DateTime, default=datetime.datetime.utcnow)
    user_id = Column(Integer, nullable=True)
