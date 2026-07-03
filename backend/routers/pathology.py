"""Pathology / Lab masters router (exact legacy DiagMast.Mdb structure).

Mounts one CRUD sub-router per test-master table.
"""
from fastapi import APIRouter
from backend.models.pathology import (
    TestDeptMast, TestGrpMast, TestMethodMast, TestSampTypMast, TestParaMast,
    TestFmtMast, TestFmtDtl, TestValCalcMast, TestValCalcDtl, TestParaSrvMst,
)
from backend.routers._crud import make_master_router

router = APIRouter()

# (path, model, pk, rec_state, search_field)
_MASTERS = [
    ("test-departments", TestDeptMast, "TdpCode", "TdpRecState", "TdpName"),
    ("test-groups", TestGrpMast, "TgpCode", "TgpRecState", "TgpName"),
    ("test-methods", TestMethodMast, "TmhCode", "TmhRecState", "TmhName"),
    ("test-sample-types", TestSampTypMast, "TspCode", "TspRecState", "TspName"),
    ("test-parameters", TestParaMast, "TprCode", "TprRecState", "TprName"),
    ("test-formats", TestFmtMast, "TfmCode", "TfmRecState", "TfmName"),
    ("test-format-details", TestFmtDtl, "TfdICode", "TfdRecState", None),
    ("test-value-calcs", TestValCalcMast, "TvcCode", "TvcRecState", "TvcName"),
    ("test-value-calc-details", TestValCalcDtl, "TcdICode", "TcdRecState", None),
    ("test-parameter-services", TestParaSrvMst, "TrsICode", "TrsRecState", None),
]

for path, model, pk, rec_state, search in _MASTERS:
    rs = rec_state if hasattr(model, rec_state) else None
    router.include_router(
        make_master_router(model, pk, rs, search), prefix=f"/{path}"
    )
