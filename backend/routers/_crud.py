"""Reusable CRUD router factory for legacy master tables.

Every legacy master follows the same shape: an autonumber PK (`XxxCode`),
a soft-delete state column (`XxxRecState`, 0 = deleted), and a name column.
This factory produces list / get / create / update / soft-delete endpoints
that accept and return plain dicts, so we don't hand-write pydantic schemas
for dozens of near-identical masters while still preserving exact columns.
"""
from typing import Optional, List
from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from sqlalchemy import inspect as sa_inspect
from backend.database import get_db


def _to_dict(obj) -> dict:
    return {c.key: getattr(obj, c.key) for c in sa_inspect(obj).mapper.column_attrs}


def _writable_cols(model, pk: str) -> set:
    return {c.key for c in sa_inspect(model).mapper.column_attrs if c.key != pk}


def make_master_router(
    model,
    pk: str,
    rec_state: Optional[str] = None,
    search_field: Optional[str] = None,
) -> APIRouter:
    """Build a CRUD router for one master model.

    model       -- SQLAlchemy model class
    pk          -- primary-key column name (e.g. "TdpCode")
    rec_state   -- soft-delete column (e.g. "TdpRecState"); None disables it
    search_field-- optional column used by ?q= filter (e.g. "TdpName")
    """
    router = APIRouter()
    cols = _writable_cols(model, pk)

    @router.get("", response_model=List[dict])
    def list_items(q: Optional[str] = None, db: Session = Depends(get_db)):
        query = db.query(model)
        if rec_state and hasattr(model, rec_state):
            query = query.filter(getattr(model, rec_state) != 0)
        if q and search_field and hasattr(model, search_field):
            query = query.filter(getattr(model, search_field).ilike(f"%{q}%"))
        return [_to_dict(o) for o in query.all()]

    @router.get("/{code}", response_model=dict)
    def get_item(code: int, db: Session = Depends(get_db)):
        obj = db.query(model).filter(getattr(model, pk) == code).first()
        if not obj:
            raise HTTPException(404, "Not found")
        return _to_dict(obj)

    @router.post("", response_model=dict)
    def create_item(data: dict, db: Session = Depends(get_db)):
        payload = {k: v for k, v in data.items() if k in cols}
        if rec_state and rec_state not in payload:
            payload[rec_state] = 1
        obj = model(**payload)
        db.add(obj)
        db.commit()
        db.refresh(obj)
        return _to_dict(obj)

    @router.put("/{code}", response_model=dict)
    def update_item(code: int, data: dict, db: Session = Depends(get_db)):
        obj = db.query(model).filter(getattr(model, pk) == code).first()
        if not obj:
            raise HTTPException(404, "Not found")
        for k, v in data.items():
            if k in cols:
                setattr(obj, k, v)
        db.commit()
        db.refresh(obj)
        return _to_dict(obj)

    @router.delete("/{code}")
    def delete_item(code: int, db: Session = Depends(get_db)):
        obj = db.query(model).filter(getattr(model, pk) == code).first()
        if not obj:
            raise HTTPException(404, "Not found")
        if rec_state and hasattr(model, rec_state):
            setattr(obj, rec_state, 0)
        else:
            db.delete(obj)
        db.commit()
        return {"ok": True}

    return router
