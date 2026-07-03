"""Drug & Stock masters router (exact legacy DrugMast.Mdb / Stock.Mdb).

Mounts one CRUD sub-router per master table.
"""
from fastapi import APIRouter
from backend.models.drugstock import (
    MediMast, MediGrpMst, MediCpyMst, MediCpoMst,
    ProdMast, ProdRef, StockHdr, StockJrn,
)
from backend.routers._crud import make_master_router

router = APIRouter()

# (path, model, pk, rec_state, search_field)
_MASTERS = [
    ("medicines", MediMast, "MpdCode", "MpdRecState", "MpdName"),
    ("medicine-groups", MediGrpMst, "MgpCode", "MgpRecState", "MgpName"),
    ("medicine-companies", MediCpyMst, "McyCode", "McyRecState", "McyName"),
    ("medicine-compositions", MediCpoMst, "MpoCode", "MpoRecState", "MpoName"),
    ("products", ProdMast, "ItmCode", "ItmRecState", "ItmName"),
    ("product-refs", ProdRef, "ItrRefCode", "ItrRecState", "ItrRef1Name"),
    ("stock-headers", StockHdr, "ShrCode", "ShrRecState", None),
    ("stock-journal", StockJrn, "StkICode", "StkRecState", None),
]

for path, model, pk, rec_state, search in _MASTERS:
    rs = rec_state if hasattr(model, rec_state) else None
    router.include_router(
        make_master_router(model, pk, rs, search), prefix=f"/{path}"
    )
