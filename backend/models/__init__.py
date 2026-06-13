from backend.database import Base

# Submodule model imports (for `from backend.models.xxx import ...` style)
from backend.models.auth import Company, UserRoleMst, UserMast, UserRightMst
from backend.models.masters import (
    PatCatgMst, DoctCatgMst, DoctRoleMst, RefCatgMst, AreaMast, StsnMast, DiagMast,
    FloorMast, WardMast, ServGrpMst, ServMast, ServRateMst, DoctMast, RefByMast, RefToMast, PatMast, BedMast,
    SubItmGrpMst, SubItmMast, PartyGrpMst, PartyMast
)
from backend.models.opd import (
    OutdReg, OutdHdr, OutdBill, OutdBlDctDtl, OutdBlPymtHdr, OutdBlRefdHdr,
    OutdRcpt, OutdRcDctDtl, OutdPymtHdr, OutdRefdHdr, OutdRgRefd
)
from backend.models.ipd import (
    IndrHdr, IBedState, IndrBlHdr, IndrBill, IndrBlDctDtl,
    IndrBlPymtHdr, IndrBlDpogDtl, IndrBlRefdHdr, IndrBlRfugDtl,
    IndrReg, IndrRgPymt, IndrRgRefd
)
from backend.models.lab import (
    LabHdr, LabRcpt, LabRcDctDtl, LabPymtHdr, LabRefdHdr
)
from backend.models.pharmacy import (
    IndrStk, IndrStkDtl, OutdStk, OutdStkDtl
)
from backend.models.sync import SyncLog, SyncConfig

# Legacy flat-model imports for backward compatibility
# (routers that do `from backend.models import User, Patient, ...`)
from backend.models_flat import (
    User,
    PatientCategory, Patient,
    DoctorCategory, DoctorRole, Doctor,
    Floor, Ward, Bed,
    ServiceGroup, Service,
    OPDRegistration, OPDBill,
    IPDAdmission, IPDBill,
    AuditLog,
)

__all__ = [
    "Base",
    # Auth / Company
    "Company", "UserRoleMst", "UserMast", "UserRightMst",
    # Masters (legacy submodule)
    "PatCatgMst", "DoctCatgMst", "DoctRoleMst", "RefCatgMst", "AreaMast", "StsnMast", "DiagMast",
    "FloorMast", "WardMast", "ServGrpMst", "ServMast", "ServRateMst", "DoctMast", "RefByMast", "RefToMast", "PatMast", "BedMast",
    "SubItmGrpMst", "SubItmMast", "PartyGrpMst", "PartyMast",
    # OPD
    "OutdReg", "OutdHdr", "OutdBill", "OutdBlDctDtl", "OutdBlPymtHdr", "OutdBlRefdHdr",
    "OutdRcpt", "OutdRcDctDtl", "OutdPymtHdr", "OutdRefdHdr", "OutdRgRefd",
    # IPD
    "IndrHdr", "IBedState", "IndrBlHdr", "IndrBill", "IndrBlDctDtl",
    "IndrBlPymtHdr", "IndrBlDpogDtl", "IndrBlRefdHdr", "IndrBlRfugDtl",
    "IndrReg", "IndrRgPymt", "IndrRgRefd",
    # Lab
    "LabHdr", "LabRcpt", "LabRcDctDtl", "LabPymtHdr", "LabRefdHdr",
    # Pharmacy
    "IndrStk", "IndrStkDtl", "OutdStk", "OutdStkDtl",
    # Sync
    "SyncLog", "SyncConfig",
    # Legacy flat models
    "User",
    "PatientCategory", "Patient",
    "DoctorCategory", "DoctorRole", "Doctor",
    "Floor", "Ward", "Bed",
    "ServiceGroup", "Service",
    "OPDRegistration", "OPDBill",
    "IPDAdmission", "IPDBill",
    "AuditLog",
]

