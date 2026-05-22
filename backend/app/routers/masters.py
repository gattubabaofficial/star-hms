from fastapi import APIRouter, Depends, HTTPException, Body
from sqlalchemy.orm import Session, joinedload
from typing import Dict, Any, List
from ..database import get_db
from .. import models, auth

router = APIRouter(prefix="/masters", tags=["masters"])

MASTER_CONFIG: Dict[str, Dict[str, Any]] = {
    "patient-category": {"model": models.PatCatgMst, "id_field": "PcgCode", "state_field": "PcgRecState"},
    "doctor-category": {"model": models.DoctCatgMst, "id_field": "DcgCode", "state_field": "DcgRecState"},
    "doctor-master": {"model": models.DoctMast, "id_field": "DctCode", "state_field": "DctRecState", "relations": ["category", "role"]},
    "referral-master": {"model": models.RefByMast, "id_field": "RByCode", "state_field": "RByRecState", "relations": ["category"]},
    "doctor-role": {"model": models.DoctRoleMst, "id_field": "DrlCode", "state_field": "DrlRecState"},
    "referral-category": {"model": models.RefCatgMst, "id_field": "RfgCode", "state_field": "RfgRecState"},
    "user-roles": {"model": models.UserRoleMst, "id_field": "UrlCode", "state_field": "UrlRecState"},
    "patients": {"model": models.PatMast, "id_field": "PttCode", "state_field": "PttRecState"},
    "area-master": {"model": models.AreaMast, "id_field": "AraCode", "state_field": "AraRecState"},
    "station-master": {"model": models.StsnMast, "id_field": "StnCode", "state_field": "StnRecState"},
    "ward-master": {"model": models.WardMast, "id_field": "WrdCode", "state_field": "WrdRecState"},
    "floor-master": {"model": models.FloorMast, "id_field": "FlrCode", "state_field": "FlrRecState"},
    "bed-master": {"model": models.BedMast, "id_field": "BdmCode", "state_field": "BdmRecState", "relations": ["ward", "floor", "service"]},
    "diag-master": {"model": models.DiagMast, "id_field": "DigCode", "state_field": "DigRecState"},
}

def serialize_model(instance: Any, relations: List[str] = None) -> Dict[str, Any]:
    """Helper to convert SQLAlchemy model instance to dict with support for specified relations"""
    data = {c.name: getattr(instance, c.name) for c in instance.__table__.columns}
    
    # Format datetime columns nicely for JSON serialization if needed
    for k, v in data.items():
        if hasattr(v, "isoformat"):
            data[k] = v.isoformat()
            
    if relations:
        for r in relations:
            rel_obj = getattr(instance, r, None)
            if rel_obj:
                if isinstance(rel_obj, list):
                    data[r] = [serialize_model(i) for i in rel_obj]
                else:
                    data[r] = serialize_model(rel_obj)
            else:
                data[r] = None
    return data

def parse_body_dates(model: Any, body: Dict[str, Any]):
    from datetime import datetime
    from sqlalchemy import Date, DateTime
    for column in model.__table__.columns:
        if isinstance(column.type, (Date, DateTime)):
            val = body.get(column.name)
            if isinstance(val, str) and val:
                try:
                    dt = datetime.fromisoformat(val.replace("Z", "+00:00"))
                    body[column.name] = dt.date() if isinstance(column.type, Date) else dt
                except ValueError:
                    body[column.name] = None

def sync_pg_sequence(db: Session, table_name: str, id_field: str):
    try:
        from sqlalchemy import text
        db.execute(text(f"SELECT setval(pg_get_serial_sequence('\"{table_name}\"', '{id_field}'), COALESCE((SELECT MAX(\"{id_field}\") FROM \"{table_name}\"), 1))"))
        db.commit()
    except Exception:
        db.rollback()

@router.get("/user-rights/{role_code}")
def get_user_rights(role_code: int, db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    rights = db.query(models.UserRightMst).filter(
        models.UserRightMst.UhtUrlCode == role_code,
        models.UserRightMst.UhtRecState == 1
    ).all()
    
    return [serialize_model(r) for r in rights]

@router.post("/user-rights/{role_code}")
def update_user_rights(role_code: int, payload: Dict[str, Any] = Body(...), db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    permissions = payload.get("permissions", [])
    
    try:
        # Delete existing permissions for this role
        db.query(models.UserRightMst).filter(models.UserRightMst.UhtUrlCode == role_code).delete()
        
        # Bulk create new permissions
        for p in permissions:
            new_right = models.UserRightMst(
                UhtUrlCode=role_code,
                UhtSecuOptName=p.get("UhtSecuOptName"),
                UhtCanAdd=p.get("UhtCanAdd", False),
                UhtCanEdit=p.get("UhtCanEdit", False),
                UhtCanDelete=p.get("UhtCanDelete", False),
                UhtCanView=p.get("UhtCanView", False),
                UhtRecState=1
            )
            db.add(new_right)
            
        db.commit()
        return {"message": "Permissions updated"}
    except Exception as err:
        db.rollback()
        raise HTTPException(status_code=500, detail="Failed to update rights: " + str(err))

@router.get("/{type_name}")
def get_master_records(type_name: str, db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    config = MASTER_CONFIG.get(type_name)
    if not config:
        raise HTTPException(status_code=404, detail="Invalid master type")
        
    model = config["model"]
    state_field = getattr(model, config["state_field"])
    
    query = db.query(model).filter(state_field == 1)
    
    # Eager load relations if specified
    relations = config.get("relations", [])
    for r in relations:
        query = query.options(joinedload(getattr(model, r)))
        
    records = query.all()
    return [serialize_model(r, relations) for r in records]

@router.post("/{type_name}", status_code=201)
def create_master_record(type_name: str, body: Dict[str, Any] = Body(...), db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    config = MASTER_CONFIG.get(type_name)
    if not config:
        raise HTTPException(status_code=404, detail="Invalid master type")
        
    model = config["model"]
    id_field = config["id_field"]
    
    # Check if this is an upsert (ID provided)
    id_val = body.get(id_field)
    
    # Parse dates automatically
    parse_body_dates(model, body)
    
    if id_val is not None:
        # Perform upsert
        try:
            record = db.query(model).filter(getattr(model, id_field) == id_val).first()
            if record:
                for k, v in body.items():
                    if k != id_field and hasattr(record, k):
                        setattr(record, k, v)
                db.commit()
                db.refresh(record)
                return serialize_model(record)
            else:
                new_record = model(**body)
                db.add(new_record)
                db.commit()
                db.refresh(new_record)
                sync_pg_sequence(db, model.__tablename__, id_field)
                return serialize_model(new_record)
        except Exception as err:
            db.rollback()
            raise HTTPException(status_code=400, detail=str(err))
    else:
        # Standard insert
        body.pop(id_field, None)
        try:
            new_record = model(**body)
            db.add(new_record)
            db.commit()
            db.refresh(new_record)
            return serialize_model(new_record)
        except Exception as err:
            db.rollback()
            raise HTTPException(status_code=400, detail=str(err))

@router.put("/{type_name}/{record_id}")
def update_master_record(type_name: str, record_id: int, body: Dict[str, Any] = Body(...), db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    config = MASTER_CONFIG.get(type_name)
    if not config:
        raise HTTPException(status_code=404, detail="Invalid master type")
        
    model = config["model"]
    id_field = config["id_field"]
    id_column = getattr(model, id_field)
    
    # Pop out id field from body to prevent modification
    body.pop(id_field, None)
    
    # Parse dates automatically
    parse_body_dates(model, body)
    
    record = db.query(model).filter(id_column == record_id).first()
    if not record:
        raise HTTPException(status_code=404, detail="Record not found")
        
    try:
        for key, value in body.items():
            if hasattr(record, key):
                setattr(record, key, value)
        db.commit()
        db.refresh(record)
        return serialize_model(record)
    except Exception as err:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(err))

@router.delete("/{type_name}/{record_id}")
def delete_master_record(type_name: str, record_id: int, db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    config = MASTER_CONFIG.get(type_name)
    if not config:
        raise HTTPException(status_code=404, detail="Invalid master type")
        
    model = config["model"]
    id_column = getattr(model, config["id_field"])
    state_field_name = config["state_field"]
    
    record = db.query(model).filter(id_column == record_id).first()
    if not record:
        raise HTTPException(status_code=404, detail="Record not found")
        
    try:
        setattr(record, state_field_name, 0)
        db.commit()
        return {"message": "Deleted successfully"}
    except Exception as err:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(err))
