from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from sqlalchemy import func
from typing import List

from backend.database import get_db
from backend.models.pharmacy import (
    IndrStk, IndrStkDtl, OutdStk, OutdStkDtl
)
from backend.models.masters import SubItmGrpMst, SubItmMast, PartyGrpMst, PartyMast
from backend.schemas.pharmacy import (
    IndrStkCreate, IndrStkResponse,
    OutdStkCreate, OutdStkResponse,
    StockItem
)
from backend.schemas.masters import (
    SubItmGrpMstCreate, SubItmGrpMstResponse,
    SubItmMastCreate, SubItmMastResponse,
    PartyGrpMstCreate, PartyGrpMstResponse,
    PartyMastCreate, PartyMastResponse
)

router = APIRouter()

# -----------------------------------------------------
# Item Groups (SubItmGrpMst)
# -----------------------------------------------------
@router.get("/item-groups", response_model=List[SubItmGrpMstResponse])
def get_item_groups(db: Session = Depends(get_db)):
    return db.query(SubItmGrpMst).filter(SubItmGrpMst.SigRecState == 1).order_by(SubItmGrpMst.SigName).all()

@router.post("/item-groups", response_model=SubItmGrpMstResponse)
def create_item_group(group_in: SubItmGrpMstCreate, db: Session = Depends(get_db)):
    db_group = SubItmGrpMst(**group_in.model_dump())
    db.add(db_group)
    db.commit()
    db.refresh(db_group)
    return db_group

# -----------------------------------------------------
# Items / Medicines (SubItmMast)
# -----------------------------------------------------
@router.get("/items", response_model=List[SubItmMastResponse])
def get_items(db: Session = Depends(get_db)):
    return db.query(SubItmMast).filter(SubItmMast.SimRecState == 1).order_by(SubItmMast.SimName).all()

@router.post("/items", response_model=SubItmMastResponse)
def create_item(item_in: SubItmMastCreate, db: Session = Depends(get_db)):
    db_item = SubItmMast(**item_in.model_dump())
    db.add(db_item)
    db.commit()
    db.refresh(db_item)
    return db_item

# -----------------------------------------------------
# Vendor Groups (PartyGrpMst)
# -----------------------------------------------------
@router.get("/party-groups", response_model=List[PartyGrpMstResponse])
def get_party_groups(db: Session = Depends(get_db)):
    return db.query(PartyGrpMst).filter(PartyGrpMst.PgpRecState == 1).order_by(PartyGrpMst.PgpName).all()

@router.post("/party-groups", response_model=PartyGrpMstResponse)
def create_party_group(group_in: PartyGrpMstCreate, db: Session = Depends(get_db)):
    db_group = PartyGrpMst(**group_in.model_dump())
    db.add(db_group)
    db.commit()
    db.refresh(db_group)
    return db_group

# -----------------------------------------------------
# Vendors / Parties (PartyMast)
# -----------------------------------------------------
@router.get("/parties", response_model=List[PartyMastResponse])
def get_parties(db: Session = Depends(get_db)):
    return db.query(PartyMast).filter(PartyMast.PtyRecState == 1).order_by(PartyMast.PtyName).all()

@router.post("/parties", response_model=PartyMastResponse)
def create_party(party_in: PartyMastCreate, db: Session = Depends(get_db)):
    db_party = PartyMast(**party_in.model_dump())
    db.add(db_party)
    db.commit()
    db.refresh(db_party)
    return db_party

# -----------------------------------------------------
# Stock Inward (Purchases)
# -----------------------------------------------------
@router.get("/purchases", response_model=List[IndrStkResponse])
def get_purchases(db: Session = Depends(get_db)):
    return db.query(IndrStk).filter(IndrStk.IskRecState == 1).order_by(IndrStk.IskCode.desc()).limit(100).all()

@router.post("/purchases", response_model=IndrStkResponse)
def create_purchase(purchase_in: IndrStkCreate, db: Session = Depends(get_db)):
    # Mathematical Validation
    calculated_total = sum(d.IsdQty * d.IsdRate for d in purchase_in.details)
    calculated_disc = sum(d.IsdDiscAmt for d in purchase_in.details)
    calculated_tax = sum(d.IsdTaxAmt for d in purchase_in.details)
    calculated_net = calculated_total - calculated_disc + calculated_tax + purchase_in.IskOtherChg - purchase_in.IskRoundOff
    
    # We allow a very small float drift, e.g., 0.1 for currency rounding issues
    if abs(calculated_net - purchase_in.IskNetAmt) > 0.1:
        raise HTTPException(status_code=400, detail=f"Net Amount mismatch. Expected approx {calculated_net}, got {purchase_in.IskNetAmt}")

    max_vch = db.query(func.max(IndrStk.IskVchNo)).scalar() or 0
    new_vch = max_vch + 1

    header_data = purchase_in.model_dump(exclude={"details"})
    db_hdr = IndrStk(**header_data, IskVchNo=new_vch)
    db.add(db_hdr)
    db.flush()

    for idx, detail in enumerate(purchase_in.details):
        db_dtl = IndrStkDtl(
            **detail.model_dump(),
            IsdIskCode=db_hdr.IskCode,
            IsdSno=idx + 1
        )
        db.add(db_dtl)

    db.commit()
    db.refresh(db_hdr)
    return db_hdr

# -----------------------------------------------------
# Stock Outward (Sales)
# -----------------------------------------------------
@router.get("/sales", response_model=List[OutdStkResponse])
def get_sales(db: Session = Depends(get_db)):
    return db.query(OutdStk).filter(OutdStk.OskRecState == 1).order_by(OutdStk.OskCode.desc()).limit(100).all()

@router.post("/sales", response_model=OutdStkResponse)
def create_sale(sale_in: OutdStkCreate, db: Session = Depends(get_db)):
    # 1. Mathematical Validation
    calculated_total = sum(d.OsdQty * d.OsdRate for d in sale_in.details)
    calculated_disc = sum(d.OsdDiscAmt for d in sale_in.details)
    calculated_tax = sum(d.OsdTaxAmt for d in sale_in.details)
    calculated_net = calculated_total - calculated_disc + calculated_tax + sale_in.OskOtherChg - sale_in.OskRoundOff
    
    if abs(calculated_net - sale_in.OskNetAmt) > 0.1:
        raise HTTPException(status_code=400, detail=f"Net Amount mismatch. Expected approx {calculated_net}, got {sale_in.OskNetAmt}")

    # 2. Stock Validation (Cannot dispense more than available)
    for detail in sale_in.details:
        if detail.OsdSimCode:
            in_qty = db.query(func.sum(IndrStkDtl.IsdQty)).filter(
                IndrStkDtl.IsdSimCode == detail.OsdSimCode, 
                IndrStkDtl.IsdRecState == 1
            ).scalar() or 0.0
            
            out_qty = db.query(func.sum(OutdStkDtl.OsdQty)).filter(
                OutdStkDtl.OsdSimCode == detail.OsdSimCode,
                OutdStkDtl.OsdRecState == 1
            ).scalar() or 0.0
            
            current_stock = in_qty - out_qty
            if detail.OsdQty > current_stock:
                item = db.query(SubItmMast).filter(SubItmMast.SimCode == detail.OsdSimCode).first()
                item_name = item.SimName if item else detail.OsdSimCode
                raise HTTPException(status_code=400, detail=f"Insufficient stock for {item_name}. Available: {current_stock}, Requested: {detail.OsdQty}")

    max_vch = db.query(func.max(OutdStk.OskVchNo)).scalar() or 0
    new_vch = max_vch + 1

    header_data = sale_in.model_dump(exclude={"details"})
    db_hdr = OutdStk(**header_data, OskVchNo=new_vch)
    db.add(db_hdr)
    db.flush()

    for idx, detail in enumerate(sale_in.details):
        db_dtl = OutdStkDtl(
            **detail.model_dump(),
            OsdOskCode=db_hdr.OskCode,
            OsdSno=idx + 1
        )
        db.add(db_dtl)

    db.commit()
    db.refresh(db_hdr)
    return db_hdr

# -----------------------------------------------------
# Stock Register
# -----------------------------------------------------
@router.get("/stock", response_model=List[StockItem])
def get_stock(db: Session = Depends(get_db)):
    inwards = db.query(
        IndrStkDtl.IsdSimCode.label("SimCode"),
        func.sum(IndrStkDtl.IsdQty).label("total_in")
    ).filter(IndrStkDtl.IsdRecState == 1).group_by(IndrStkDtl.IsdSimCode).subquery()

    outwards = db.query(
        OutdStkDtl.OsdSimCode.label("SimCode"),
        func.sum(OutdStkDtl.OsdQty).label("total_out")
    ).filter(OutdStkDtl.OsdRecState == 1).group_by(OutdStkDtl.OsdSimCode).subquery()

    from backend.models.pharmacy import SubItmGrpMst
    stock_data = db.query(
        SubItmMast.SimCode,
        SubItmMast.SimName,
        SubItmGrpMst.SigName,
        func.coalesce(inwards.c.total_in, 0).label("inward_qty"),
        func.coalesce(outwards.c.total_out, 0).label("outward_qty")
    ).outerjoin(SubItmGrpMst, SubItmGrpMst.SigCode == SubItmMast.SimSigCode)\
     .outerjoin(inwards, inwards.c.SimCode == SubItmMast.SimCode)\
     .outerjoin(outwards, outwards.c.SimCode == SubItmMast.SimCode)\
     .filter(SubItmMast.SimRecState == 1).all()

    stock_list = []
    for row in stock_data:
        stock_list.append(StockItem(
            SimCode=row.SimCode,
            ItemName=row.SimName,
            GroupName=row.SigName or "Uncategorized",
            InwardQty=row.inward_qty,
            OutwardQty=row.outward_qty,
            CurrentStock=row.inward_qty - row.outward_qty
        ))

    return stock_list
