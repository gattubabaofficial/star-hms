# Re-export all schemas from the flat schemas.py for backward compatibility.
# Routers that do `from backend.schemas import Token, UserResponse, ...`
# will continue to work because schemas/ is now a package.
from backend.schemas_flat import (
    UserBase, UserCreate, UserLogin, UserResponse,
    Token, TokenData,
    PatientCategoryBase, PatientCategoryCreate, PatientCategoryResponse,
    PatientBase, PatientCreate, PatientResponse,
    DoctorCategoryBase, DoctorCategoryCreate, DoctorCategoryResponse,
    DoctorRoleBase, DoctorRoleCreate, DoctorRoleResponse,
    DoctorBase, DoctorCreate, DoctorResponse,
    FloorBase, FloorCreate, FloorResponse,
    WardBase, WardCreate, WardResponse,
    BedBase, BedCreate, BedResponse,
    ServiceGroupBase, ServiceGroupCreate, ServiceGroupResponse,
    ServiceBase, ServiceCreate, ServiceResponse,
    OPDRegistrationBase, OPDRegistrationCreate, OPDRegistrationResponse,
    OPDBillCreate, OPDBillResponse,
    IPDAdmissionBase, IPDAdmissionCreate, IPDAdmissionResponse,
    IPDBillCreate, IPDBillResponse,
    DashboardStats,
)

__all__ = [
    "UserBase", "UserCreate", "UserLogin", "UserResponse",
    "Token", "TokenData",
    "PatientCategoryBase", "PatientCategoryCreate", "PatientCategoryResponse",
    "PatientBase", "PatientCreate", "PatientResponse",
    "DoctorCategoryBase", "DoctorCategoryCreate", "DoctorCategoryResponse",
    "DoctorRoleBase", "DoctorRoleCreate", "DoctorRoleResponse",
    "DoctorBase", "DoctorCreate", "DoctorResponse",
    "FloorBase", "FloorCreate", "FloorResponse",
    "WardBase", "WardCreate", "WardResponse",
    "BedBase", "BedCreate", "BedResponse",
    "ServiceGroupBase", "ServiceGroupCreate", "ServiceGroupResponse",
    "ServiceBase", "ServiceCreate", "ServiceResponse",
    "OPDRegistrationBase", "OPDRegistrationCreate", "OPDRegistrationResponse",
    "OPDBillCreate", "OPDBillResponse",
    "IPDAdmissionBase", "IPDAdmissionCreate", "IPDAdmissionResponse",
    "IPDBillCreate", "IPDBillResponse",
    "DashboardStats",
]
