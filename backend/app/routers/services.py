from fastapi import APIRouter, Depends, HTTPException, Query, Body
from sqlalchemy.orm import Session, joinedload
from typing import Dict, Any, List, Optional
from ..database import get_db
from .. import models, auth
from .masters import serialize_model

router = APIRouter(prefix="/services", tags=["services"])

@router.get("/groups")
def get_service_groups(db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    records = db.query(models.ServGrpMst).filter(models.ServGrpMst.SgpRecState == 1).all()
    return [serialize_model(r) for r in records]

@router.post("/groups", status_code=201)
def create_service_group(body: Dict[str, Any] = Body(...), db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    body.pop("SgpCode", None)
    try:
        group = models.ServGrpMst(**body)
        db.add(group)
        db.commit()
        db.refresh(group)
        return serialize_model(group)
    except Exception as err:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(err))

@router.put("/groups/{id}")
def update_service_group(id: int, body: Dict[str, Any] = Body(...), db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    body.pop("SgpCode", None)
    group = db.query(models.ServGrpMst).filter(models.ServGrpMst.SgpCode == id).first()
    if not group:
        raise HTTPException(status_code=404, detail="Service group not found")
    try:
        for k, v in body.items():
            if hasattr(group, k):
                setattr(group, k, v)
        db.commit()
        db.refresh(group)
        return serialize_model(group)
    except Exception as err:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(err))

@router.delete("/groups/{id}")
def delete_service_group(id: int, db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    group = db.query(models.ServGrpMst).filter(models.ServGrpMst.SgpCode == id).first()
    if not group:
        raise HTTPException(status_code=404, detail="Service group not found")
    try:
        group.SgpRecState = 0
        db.commit()
        return {"message": "Deleted successfully"}
    except Exception as err:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(err))

@router.get("/master")
def get_service_master(q: Optional[str] = Query(None), db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    query = db.query(models.ServMast).filter(models.ServMast.SrvRecState == 1)
    if q:
        query = query.filter(models.ServMast.SrvName.ilike(f"%{q}%"))
    records = query.options(joinedload(models.ServMast.group)).all()
    return [serialize_model(r, ["group"]) for r in records]

@router.post("/master", status_code=201)
def create_service(body: Dict[str, Any] = Body(...), db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    body.pop("SrvCode", None)
    try:
        srv = models.ServMast(**body)
        db.add(srv)
        db.commit()
        db.refresh(srv)
        return serialize_model(srv)
    except Exception as err:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(err))

@router.put("/master/{id}")
def update_service(id: int, body: Dict[str, Any] = Body(...), db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    body.pop("SrvCode", None)
    srv = db.query(models.ServMast).filter(models.ServMast.SrvCode == id).first()
    if not srv:
        raise HTTPException(status_code=404, detail="Service not found")
    try:
        for k, v in body.items():
            if hasattr(srv, k):
                setattr(srv, k, v)
        db.commit()
        db.refresh(srv)
        return serialize_model(srv)
    except Exception as err:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(err))

@router.delete("/master/{id}")
def delete_service(id: int, db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    srv = db.query(models.ServMast).filter(models.ServMast.SrvCode == id).first()
    if not srv:
        raise HTTPException(status_code=404, detail="Service not found")
    try:
        srv.SrvRecState = 0
        db.commit()
        return {"message": "Deleted successfully"}
    except Exception as err:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(err))
