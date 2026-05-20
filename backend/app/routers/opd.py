from fastapi import APIRouter, Depends, HTTPException, Query, Body
from sqlalchemy.orm import Session, joinedload
from sqlalchemy import func
from typing import Dict, Any, List, Optional
from datetime import datetime
from ..database import get_db
from .. import models, auth
from .masters import serialize_model

router = APIRouter(prefix="/opd", tags=["opd"])

@router.get("/area-master")
def get_areas(db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    records = db.query(models.AreaMast).filter(models.AreaMast.AraRecState == 1).all()
    return [serialize_model(r) for r in records]

@router.get("/station-master")
def get_stations(db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    records = db.query(models.StsnMast).filter(models.StsnMast.StnRecState == 1).all()
    return [serialize_model(r) for r in records]

@router.get("/patient-master")
def get_patients(q: Optional[str] = Query(None), db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    query = db.query(models.PatMast).filter(models.PatMast.PttRecState == 1)
    
    if q:
        query = query.filter(models.PatMast.PttName.ilike(f"%{q}%"))
        
    records = query.options(
        joinedload(models.PatMast.category),
        joinedload(models.PatMast.area),
        joinedload(models.PatMast.station)
    ).all()
    
    return [serialize_model(r, ["category", "area", "station"]) for r in records]

@router.post("/patient-master", status_code=201)
def create_patient(body: Dict[str, Any] = Body(...), db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    body.pop("PttCode", None)
    
    # Parse dates
    for date_field in ["PttDob", "PttAgeAsOnDt"]:
        if body.get(date_field):
            try:
                body[date_field] = datetime.fromisoformat(body[date_field].replace("Z", "+00:00"))
            except ValueError:
                body[date_field] = None
                
    if not body.get("PttRegDate"):
        body["PttRegDate"] = datetime.utcnow()
    else:
        try:
            body["PttRegDate"] = datetime.fromisoformat(body["PttRegDate"].replace("Z", "+00:00"))
        except ValueError:
            body["PttRegDate"] = datetime.utcnow()

    try:
        patient = models.PatMast(**body)
        db.add(patient)
        db.commit()
        db.refresh(patient)
        return serialize_model(patient)
    except Exception as err:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(err))

@router.put("/patient-master/{id}")
def update_patient(id: int, body: Dict[str, Any] = Body(...), db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    body.pop("PttCode", None)
    
    patient = db.query(models.PatMast).filter(models.PatMast.PttCode == id).first()
    if not patient:
        raise HTTPException(status_code=404, detail="Patient not found")
        
    for date_field in ["PttDob", "PttAgeAsOnDt"]:
        if date_field in body and body[date_field]:
            try:
                body[date_field] = datetime.fromisoformat(body[date_field].replace("Z", "+00:00"))
            except ValueError:
                body[date_field] = None
                
    try:
        for k, v in body.items():
            if hasattr(patient, k):
                setattr(patient, k, v)
        db.commit()
        db.refresh(patient)
        return serialize_model(patient)
    except Exception as err:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(err))

@router.delete("/patient-master/{id}")
def delete_patient(id: int, db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    patient = db.query(models.PatMast).filter(models.PatMast.PttCode == id).first()
    if not patient:
        raise HTTPException(status_code=404, detail="Patient not found")
        
    try:
        patient.PttRecState = 0
        db.commit()
        return {"message": "Deleted logically"}
    except Exception as err:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(err))

@router.get("/registration")
def get_registrations(q: Optional[str] = Query(None), db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    query = db.query(models.OutdReg).filter(models.OutdReg.OpgRecState == 1)
    
    if q:
        query = query.join(models.PatMast).filter(models.PatMast.PttName.ilike(f"%{q}%"))
        
    records = query.options(
        joinedload(models.OutdReg.patient),
        joinedload(models.OutdReg.doctor),
        joinedload(models.OutdReg.referred_by),
        joinedload(models.OutdReg.service)
    ).all()
    
    return [serialize_model(r, ["patient", "doctor", "referred_by", "service"]) for r in records]

@router.post("/registration", status_code=201)
def create_registration(body: Dict[str, Any] = Body(...), db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    body.pop("OpgCode", None)
    
    try:
        if not body.get("OpgDate"):
            body["OpgDate"] = datetime.utcnow()
        else:
            body["OpgDate"] = datetime.fromisoformat(body["OpgDate"].replace("Z", "+00:00"))
            
        if not body.get("OpgVchNo"):
            max_vch = db.query(func.max(models.OutdReg.OpgVchNo)).scalar() or 0
            body["OpgVchNo"] = max_vch + 1
            
        reg = models.OutdReg(**body)
        db.add(reg)
        db.commit()
        db.refresh(reg)
        return serialize_model(reg)
    except Exception as err:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(err))

@router.put("/registration/{id}")
def update_registration(id: int, body: Dict[str, Any] = Body(...), db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    body.pop("OpgCode", None)
    
    reg = db.query(models.OutdReg).filter(models.OutdReg.OpgCode == id).first()
    if not reg:
        raise HTTPException(status_code=404, detail="Registration record not found")
        
    if body.get("OpgDate"):
        body["OpgDate"] = datetime.fromisoformat(body["OpgDate"].replace("Z", "+00:00"))
        
    try:
        for k, v in body.items():
            if hasattr(reg, k):
                setattr(reg, k, v)
        db.commit()
        db.refresh(reg)
        return serialize_model(reg)
    except Exception as err:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(err))

@router.delete("/registration/{id}")
def delete_registration(id: int, db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    reg = db.query(models.OutdReg).filter(models.OutdReg.OpgCode == id).first()
    if not reg:
        raise HTTPException(status_code=404, detail="Registration record not found")
        
    try:
        reg.OpgRecState = 0
        db.commit()
        return {"message": "Deleted logically"}
    except Exception as err:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(err))

@router.get("/billing")
def get_billing(db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    # Retrieve last 100 active billing headers
    records = db.query(models.OutdHdr).filter(
        models.OutdHdr.OhdRecState == 1
    ).options(
        joinedload(models.OutdHdr.patient),
        joinedload(models.OutdHdr.doctor),
        joinedload(models.OutdHdr.bills).joinedload(models.OutdBill.service),
        joinedload(models.OutdHdr.payments)
    ).order_by(models.OutdHdr.OhdDate.desc()).limit(100).all()
    
    # Custom serialization to match Nest.js nested object keys exactly
    results = []
    for r in records:
        d = serialize_model(r, ["patient", "doctor", "payments"])
        d["OutdBill"] = [serialize_model(b, ["service"]) for b in r.bills]
        # Rename payments key to match Next.js OutdBlPymtHdr schema expectations
        d["OutdBlPymtHdr"] = d.pop("payments")
        results.append(d)
        
    return results

@router.post("/billing", status_code=201)
def create_billing(body: Dict[str, Any] = Body(...), db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    body.pop("OhdCode", None)
    
    details = body.pop("OutdBill", [])
    payments = body.pop("OutdBlPymtHdr", [])
    doctor_shares = body.pop("OutdBlDctDtl", [])
    
    try:
        # Determine Voucher No
        if not body.get("OhdVchNo"):
            max_vch = db.query(func.max(models.OutdHdr.OhdVchNo)).scalar() or 0
            body["OhdVchNo"] = max_vch + 1
            
        # Parse date
        if body.get("OhdDate"):
            body["OhdDate"] = datetime.fromisoformat(body["OhdDate"].replace("Z", "+00:00"))
        else:
            body["OhdDate"] = datetime.utcnow()
            
        header = models.OutdHdr(**body)
        db.add(header)
        db.flush() # Flush to get header.OhdCode
        
        # Create billing details
        for d in details:
            bill_detail = models.OutdBill(
                ObdOhdCode=header.OhdCode,
                ObdSrvCode=d.get("ObdSrvCode"),
                ObdUnit=d.get("ObdUnit", 1.0),
                ObdRate=d.get("ObdRate", 0.0),
                ObdAmtBefDisc=d.get("ObdAmtBefDisc", 0.0),
                ObdDiscPer=d.get("ObdDiscPer", 0.0),
                ObdDiscAmt=d.get("ObdDiscAmt", 0.0),
                ObdAmtAftDisc=d.get("ObdAmtAftDisc", 0.0),
                ObdRecState=1
            )
            db.add(bill_detail)
            
        # Create doctor shares
        for ds in doctor_shares:
            share = models.OutdBlDctDtl(
                OddOhdCode=header.OhdCode,
                OddDctCode=ds.get("OddDctCode"),
                OddSharePer=ds.get("OddSharePer", 0.0),
                OddShareAmt=ds.get("OddShareAmt", 0.0),
                OddRecState=1
            )
            db.add(share)
            
        # Create payments
        for p in payments:
            pay_date = datetime.utcnow()
            if p.get("ObpDate"):
                pay_date = datetime.fromisoformat(p["ObpDate"].replace("Z", "+00:00"))
            payment = models.OutdBlPymtHdr(
                ObpOhdCode=header.OhdCode,
                ObpDate=pay_date,
                ObpAmt=p.get("ObpAmt", 0.0),
                ObpRecState=1
            )
            db.add(payment)
            
        db.commit()
        db.refresh(header)
        
        # Serialize response including details/payments
        res = serialize_model(header)
        # Fetch newly created bills/payments to serialize
        db_bills = db.query(models.OutdBill).filter(models.OutdBill.ObdOhdCode == header.OhdCode).all()
        db_pymts = db.query(models.OutdBlPymtHdr).filter(models.OutdBlPymtHdr.ObpOhdCode == header.OhdCode).all()
        
        res["OutdBill"] = [serialize_model(b) for b in db_bills]
        res["OutdBlPymtHdr"] = [serialize_model(p) for p in db_pymts]
        return res
        
    except Exception as err:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(err))

@router.delete("/billing/{id}")
def delete_billing(id: int, db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    header = db.query(models.OutdHdr).filter(models.OutdHdr.OhdCode == id).first()
    if not header:
        raise HTTPException(status_code=404, detail="Bill header not found")
        
    try:
        header.OhdRecState = 0
        db.commit()
        return {"message": "Bill voided successfully"}
    except Exception as err:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(err))
