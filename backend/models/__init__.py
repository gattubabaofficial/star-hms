from backend.database import Base

# Submodule model imports (for `from backend.models.xxx import ...` style)
from backend.models.auth import Company, UserRoleMst, UserMast, UserRightMst
from backend.models.masters import (
    PatCatgMst, DoctCatgMst, DoctRoleMst, RefCatgMst, AreaMast, StsnMast, DiagMast,
    FloorMast, WardMast, ServGrpMst, ServMast, ServRateMst, DoctMast, RefByMast, RefToMast, PatMast, BedMast,
    SubItmGrpMst, SubItmMast, PartyGrpMst, PartyMast,
    PayDeptMast, PayDesnMast, PayEmpMast,
)
from backend.models.opd import (
    OutdReg, OutdHdr, OutdBill, OutdBlDctDtl, OutdBlPymtHdr, OutdBlRefdHdr,
    OutdRcpt, OutdRcDctDtl, OutdPymtHdr, OutdRefdHdr, OutdRgRefd
)
from backend.models.ipd import (
    IndrHdr, IBedState, IndrBlHdr, IndrBill, IndrBlDctDtl,
    IndrBlPymtHdr, IndrBlDpogDtl, IndrBlRefdHdr, IndrBlRfugDtl,
    IndrReg, IndrRgPymt, IndrRgRefd, IndrBlIbsDtl, IndrBlIbsDtl_Log,
    IndrPymtHdr, IndrPymtHdr_Log, IndrPymtDtl, IndrPymtDtl_Log,
    IndrRefdHdr, IndrRefdHdr_Log, IndrRefdDtl, IndrRefdDtl_Log,
    IndrClinHis, IndrDischSum
)
from backend.models.lab import (
    LabHdr, LabRcpt, LabRcDctDtl, LabPymtHdr, LabRefdHdr
)
from backend.models.pharmacy import (
    IndrStk, IndrStkDtl, OutdStk, OutdStkDtl
)
from backend.models.sync import SyncLog, SyncConfig
from backend.models.accounts import (
    AcntGrpMst, AchdMast, BnkrMast, NatioStateMast, VTypMast, Journal, JrnHdr,
)
from backend.models.pathology import (
    TestDeptMast, TestGrpMast, TestMethodMast, TestSampTypMast, TestParaMast,
    TestFmtMast, TestFmtDtl, TestValCalcMast, TestValCalcDtl, TestParaSrvMst,
)
from backend.models.drugstock import (
    MediMast, MediGrpMst, MediCpyMst, MediCpoMst,
    ProdMast, ProdRef, StockHdr, StockJrn,
)
from backend.models.acctpay import (
    VTypMast, AcntGrpMst, AchdMast, BnkrMast, NatioStateMast,
    DeptMast, DesgMast, EmpMast, HoliMast,
)

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
    "IndrReg", "IndrRgPymt", "IndrRgRefd", "IndrBlIbsDtl", "IndrBlIbsDtl_Log",
    "IndrPymtHdr", "IndrPymtHdr_Log", "IndrPymtDtl", "IndrPymtDtl_Log",
    "IndrRefdHdr", "IndrRefdHdr_Log", "IndrRefdDtl", "IndrRefdDtl_Log",
    # Lab
    "LabHdr", "LabRcpt", "LabRcDctDtl", "LabPymtHdr", "LabRefdHdr",
    # Pharmacy
    "IndrStk", "IndrStkDtl", "OutdStk", "OutdStkDtl",
    # Sync
    "SyncLog", "SyncConfig",
    # Accounts
    "AcntGrpMst", "AchdMast", "BnkrMast", "NatioStateMast", "VTypMast", "Journal", "JrnHdr",
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

