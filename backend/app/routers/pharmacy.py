from fastapi import APIRouter, Depends, HTTPException, Body
from sqlalchemy.orm import Session, joinedload
from sqlalchemy import func
from typing import Dict, Any, List, Optional
from datetime import datetime
from ..database import get_db
from .. import models, auth
from .masters import serialize_model

router = APIRouter(prefix="/pharmacy", tags=["pharmacy"])

# --- Items ---
@router.get("/items")
def get_pharmacy_items(db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    records = db.query(models.SubItmMast).filter(models.SubItmMast.SimRecState == 1).options(
        joinedload(models.SubItmMast.group)
    ).all()
    return [serialize_model(r, ["group"]) for r in records]

@router.post("/items", status_code=201)
def create_pharmacy_item(body: Dict[str, Any] = Body(...), db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    body.pop("SimCode", None)
    try:
        item = models.SubItmMast(**body)
        db.add(item)
        db.commit()
        db.refresh(item)
        return serialize_model(item)
    except Exception as err:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(err))

@router.get("/item-groups")
def get_item_groups(db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    records = db.query(models.SubItmGrpMst).filter(models.SubItmGrpMst.SigRecState == 1).all()
    return [serialize_model(r) for r in records]

@router.put("/items/{id}")
def update_pharmacy_item(id: int, body: Dict[str, Any] = Body(...), db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    body.pop("SimCode", None)
    item = db.query(models.SubItmMast).filter(models.SubItmMast.SimCode == id).first()
    if not item:
        raise HTTPException(status_code=404, detail="Item not found")
    try:
        for k, v in body.items():
            if hasattr(item, k):
                setattr(item, k, v)
        db.commit()
        db.refresh(item)
        return serialize_model(item)
    except Exception as err:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(err))

@router.delete("/items/{id}")
def delete_pharmacy_item(id: int, db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    item = db.query(models.SubItmMast).filter(models.SubItmMast.SimCode == id).first()
    if not item:
        raise HTTPException(status_code=404, detail="Item not found")
    try:
        item.SimRecState = 0
        db.commit()
        return {"message": "Item deleted successfully"}
    except Exception as err:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(err))

# --- Parties ---
@router.get("/parties")
def get_pharmacy_parties(db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    records = db.query(models.PartyMast).filter(models.PartyMast.PryRecState == 1).options(
        joinedload(models.PartyMast.group)
    ).all()
    return [serialize_model(r, ["group"]) for r in records]

@router.post("/parties", status_code=201)
def create_pharmacy_party(body: Dict[str, Any] = Body(...), db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    body.pop("PryCode", None)
    try:
        party = models.PartyMast(**body)
        db.add(party)
        db.commit()
        db.refresh(party)
        return serialize_model(party)
    except Exception as err:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(err))

@router.get("/party-groups")
def get_party_groups(db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    records = db.query(models.PartyGrpMst).filter(models.PartyGrpMst.PgpRecState == 1).all()
    return [serialize_model(r) for r in records]

@router.put("/parties/{id}")
def update_pharmacy_party(id: int, body: Dict[str, Any] = Body(...), db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    body.pop("PryCode", None)
    party = db.query(models.PartyMast).filter(models.PartyMast.PryCode == id).first()
    if not party:
        raise HTTPException(status_code=404, detail="Party not found")
    try:
        for k, v in body.items():
            if hasattr(party, k):
                setattr(party, k, v)
        db.commit()
        db.refresh(party)
        return serialize_model(party)
    except Exception as err:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(err))

@router.delete("/parties/{id}")
def delete_pharmacy_party(id: int, db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    party = db.query(models.PartyMast).filter(models.PartyMast.PryCode == id).first()
    if not party:
        raise HTTPException(status_code=404, detail="Party not found")
    try:
        party.PryRecState = 0
        db.commit()
        return {"message": "Party deleted successfully"}
    except Exception as err:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(err))

# --- Sales ---
@router.post("/sales", status_code=201)
def create_pharmacy_sale(body: Dict[str, Any] = Body(...), db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    body.pop("SahCode", None)
    details = body.pop("Details", [])
    
    try:
        # Determine Voucher No
        if not body.get("SahVchNo"):
            max_vch = db.query(func.max(models.MedSaleHdr.SahVchNo)).scalar() or 0
            body["SahVchNo"] = max_vch + 1
            
        # Date
        if body.get("SahDate"):
            body["SahDate"] = datetime.fromisoformat(body["SahDate"].replace("Z", "+00:00"))
        else:
            body["SahDate"] = datetime.utcnow()
            
        header = models.MedSaleHdr(**body)
        db.add(header)
        db.flush() # Get header.SahCode
        
        # Save details
        for idx, d in enumerate(details):
            detail = models.MedSaleDtl(
                SalCode=header.SahCode,
                SalSimCode=d.get("SalSimCode"),
                SalSno=idx + 1,
                SalQty=d.get("SalQty", 1.0),
                SalRate=d.get("SalRate", 0.0),
                SalAmount=d.get("SalAmount", 0.0),
                SalRecState=1
            )
            db.add(detail)
            
        db.commit()
        db.refresh(header)
        
        # Serialize response including details
        res = serialize_model(header)
        db_details = db.query(models.MedSaleDtl).filter(models.MedSaleDtl.SalCode == header.SahCode).all()
        res["Details"] = [serialize_model(det) for det in db_details]
        return res
        
    except Exception as err:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(err))

# --- Purchases ---
@router.post("/purchases", status_code=201)
def create_pharmacy_purchase(body: Dict[str, Any] = Body(...), db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    body.pop("PuhCode", None)
    details = body.pop("Details", [])
    
    try:
        # Determine Voucher No
        if not body.get("PuhVchNo"):
            max_vch = db.query(func.max(models.MedPurchHdr.PuhVchNo)).scalar() or 0
            body["PuhVchNo"] = max_vch + 1
            
        # Date
        if body.get("PuhDate"):
            body["PuhDate"] = datetime.fromisoformat(body["PuhDate"].replace("Z", "+00:00"))
        else:
            body["PuhDate"] = datetime.utcnow()
            
        header = models.MedPurchHdr(**body)
        db.add(header)
        db.flush() # Get header.PuhCode
        
        # Save details
        for idx, d in enumerate(details):
            detail = models.MedPurchDtl(
                PurCode=header.PuhCode,
                PurSimCode=d.get("PurSimCode"),
                PurSno=idx + 1,
                PurQty=d.get("PurQty", 1.0),
                PurRate=d.get("PurRate", 0.0),
                PurAmount=d.get("PurAmount", 0.0),
                PurRecState=1
            )
            db.add(detail)
            
        db.commit()
        db.refresh(header)
        
        # Serialize response including details
        res = serialize_model(header)
        db_details = db.query(models.MedPurchDtl).filter(models.MedPurchDtl.PurCode == header.PuhCode).all()
        res["Details"] = [serialize_model(det) for det in db_details]
        return res
        
    except Exception as err:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(err))
