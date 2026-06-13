from backend.database import Base

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

__all__ = [
    "Base",
    "Company", "UserRoleMst", "UserMast", "UserRightMst",
    "PatCatgMst", "DoctCatgMst", "DoctRoleMst", "RefCatgMst", "AreaMast", "StsnMast", "DiagMast",
    "FloorMast", "WardMast", "ServGrpMst", "ServMast", "ServRateMst", "DoctMast", "RefByMast", "RefToMast", "PatMast", "BedMast",
    "OutdReg", "OutdHdr", "OutdBill", "OutdBlDctDtl", "OutdBlPymtHdr", "OutdBlRefdHdr",
    "OutdRcpt", "OutdRcDctDtl", "OutdPymtHdr", "OutdRefdHdr", "OutdRgRefd",
    "IndrHdr", "IBedState", "IndrBlHdr", "IndrBill", "IndrBlDctDtl",
    "IndrBlPymtHdr", "IndrBlDpogDtl", "IndrBlRefdHdr", "IndrBlRfugDtl",
    "IndrReg", "IndrRgPymt", "IndrRgRefd",
    "LabHdr", "LabRcpt", "LabRcDctDtl", "LabPymtHdr", "LabRefdHdr",
    "SubItmGrpMst", "SubItmMast", "PartyGrpMst", "PartyMast",
    "IndrStk", "IndrStkDtl", "OutdStk", "OutdStkDtl",
    "SyncLog", "SyncConfig"
]
