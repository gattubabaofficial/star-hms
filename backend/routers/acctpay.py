"""Accounting + Payroll masters router (exact legacy Accounts.Mdb / Payroll.Mdb)."""
from fastapi import APIRouter
from backend.models.acctpay import (
    VTypMast, AcntGrpMst, AchdMast, BnkrMast, NatioStateMast,
    DeptMast, DesgMast, EmpMast, HoliMast,
)
from backend.routers._crud import make_master_router

router = APIRouter()

# (path, model, pk, rec_state, search_field)
_MASTERS = [
    ("voucher-types", VTypMast, "VtmCode", "VtmRecState", "VtmName"),
    ("account-groups", AcntGrpMst, "AcgCode", "AcgRecState", "AcgName"),
    ("account-heads", AchdMast, "AhCode", "AhRecState", "AhName"),
    ("bankers", BnkrMast, "BkrCode", "BkrRecState", "BkrName"),
    ("nation-states", NatioStateMast, "NstCode", "NstRecState", "NstName"),
    ("payroll-departments", DeptMast, "DptCode", "DptRecState", "DptName"),
    ("payroll-designations", DesgMast, "DsgCode", "DsgRecState", "DsgName"),
    ("employees", EmpMast, "EmpCode", "EmpRecState", "EmpName"),
    ("holidays", HoliMast, "HlmCode", "HlmRecState", "HlmName"),
]

for path, model, pk, rec_state, search in _MASTERS:
    rs = rec_state if hasattr(model, rec_state) else None
    router.include_router(
        make_master_router(model, pk, rs, search), prefix=f"/{path}"
    )
