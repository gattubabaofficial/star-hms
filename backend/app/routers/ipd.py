from fastapi import APIRouter, Depends, HTTPException, Body
from sqlalchemy.orm import Session, joinedload
from sqlalchemy import func
from typing import Dict, Any, List, Optional
from datetime import datetime
from ..database import get_db
from .. import models, auth
from .masters import serialize_model

router = APIRouter(prefix="/ipd", tags=["ipd"])
billing_router = APIRouter(prefix="/ipd-billing", tags=["ipd-billing"])

# --- Floors ---
@router.get("/floors")
def get_floors(db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    records = db.query(models.FloorMast).filter(models.FloorMast.FlrRecState == 1).all()
    return [serialize_model(r) for r in records]

@router.post("/floors", status_code=201)
def create_floor(body: Dict[str, Any] = Body(...), db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    body.pop("FlrCode", None)
    try:
        floor = models.FloorMast(**body)
        db.add(floor)
        db.commit()
        db.refresh(floor)
        return serialize_model(floor)
    except Exception as err:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(err))

# --- Wards ---
@router.get("/wards")
def get_wards(db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    records = db.query(models.WardMast).filter(models.WardMast.WrdRecState == 1).all()
    return [serialize_model(r) for r in records]

@router.post("/wards", status_code=201)
def create_ward(body: Dict[str, Any] = Body(...), db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    body.pop("WrdCode", None)
    try:
        ward = models.WardMast(**body)
        db.add(ward)
        db.commit()
        db.refresh(ward)
        return serialize_model(ward)
    except Exception as err:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(err))

# --- Beds ---
@router.get("/beds")
def get_beds(db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    records = db.query(models.BedMast).filter(models.BedMast.BdmRecState == 1).options(
        joinedload(models.BedMast.ward),
        joinedload(models.BedMast.floor),
        joinedload(models.BedMast.service)
    ).all()
    
    # Custom join to fetch active admissions for beds to match the include structure
    results = []
    for r in records:
        d = serialize_model(r, ["ward", "floor", "service"])
        
        # Look for active admission
        active_adm = db.query(models.IndrHdr).filter(
            models.IndrHdr.IhdBedCode == r.BdmCode,
            models.IndrHdr.IhdStatus == "Admitted",
            models.IndrHdr.IhdRecState == 1
        ).options(joinedload(models.IndrHdr.patient)).first()
        
        d["IndrHdr"] = [serialize_model(active_adm, ["patient"])] if active_adm else []
        results.append(d)
        
    return results

@router.post("/beds", status_code=201)
def create_bed(body: Dict[str, Any] = Body(...), db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    body.pop("BdmCode", None)
    try:
        bed = models.BedMast(**body)
        db.add(bed)
        db.commit()
        db.refresh(bed)
        return serialize_model(bed)
    except Exception as err:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(err))

# --- Admissions ---
@router.get("/admission")
def get_admissions(db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    records = db.query(models.IndrHdr).filter(
        models.IndrHdr.IhdRecState == 1,
        models.IndrHdr.IhdStatus == "Admitted"
    ).options(
        joinedload(models.IndrHdr.patient),
        joinedload(models.IndrHdr.doctor),
        joinedload(models.IndrHdr.referred_by),
        joinedload(models.IndrHdr.ward),
        joinedload(models.IndrHdr.bed),
        joinedload(models.IndrHdr.floor)
    ).all()
    
    return [serialize_model(r, ["patient", "doctor", "referred_by", "ward", "bed", "floor"]) for r in records]

@router.post("/admission", status_code=201)
def create_admission(body: Dict[str, Any] = Body(...), db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    body.pop("IhdCode", None)
    
    try:
        # Determine Voucher No
        if not body.get("IhdVchNo"):
            max_vch = db.query(func.max(models.IndrHdr.IhdVchNo)).scalar() or 0
            body["IhdVchNo"] = max_vch + 1
            
        # Dates
        if body.get("IhdDate"):
            body["IhdDate"] = datetime.fromisoformat(body["IhdDate"].replace("Z", "+00:00"))
        else:
            body["IhdDate"] = datetime.utcnow()
            
        body["IhdStatus"] = "Admitted"
        
        admission = models.IndrHdr(**body)
        db.add(admission)
        db.flush() # Get admission.IhdCode
        
        # Create an associated IndrReg registration receipt
        reg = models.IndrReg(
            IrgIhdCode=admission.IhdCode,
            IrgDate=admission.IhdDate,
            IrgAmt=admission.IhdAdvAmt or 0.0,
            IrgType="Admission",
            IrgRecState=1
        )
        db.add(reg)
        db.commit()
        db.refresh(admission)
        return serialize_model(admission)
        
    except Exception as err:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(err))

@router.put("/admission/{id}/discharge")
def discharge_patient(id: int, body: Dict[str, Any] = Body(...), db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    admission = db.query(models.IndrHdr).filter(models.IndrHdr.IhdCode == id).first()
    if not admission:
        raise HTTPException(status_code=404, detail="Admission not found")
        
    try:
        admission.IhdStatus = "Discharged"
        admission.IhdDischDate = datetime.utcnow()
        # Set discharge time in minutes (or keep raw timestamp/number)
        now = datetime.utcnow()
        admission.IhdDischTime = now.hour * 60 + now.minute
        db.commit()
        return serialize_model(admission)
    except Exception as err:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(err))

# --- IPD Billing ---
@billing_router.get("/preview/{adm_id}")
def preview_accrued_charges(adm_id: int, db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    admission = db.query(models.IndrHdr).filter(models.IndrHdr.IhdCode == adm_id).first()
    if not admission:
        raise HTTPException(status_code=404, detail="Admission not found")
        
    days = (datetime.utcnow() - admission.IhdDate).days
    if days < 1:
        days = 1
        
    bed = db.query(models.BedMast).filter(models.BedMast.BdmCode == admission.IhdBedCode).options(
        joinedload(models.BedMast.ward),
        joinedload(models.BedMast.service)
    ).first()
    
    accrued = []
    if bed:
        srv_code = bed.BdmSrvCode or 99999
        srv_name = f"Bed Boarding: {bed.BdmName}"
        if bed.ward:
            srv_name += f" ({bed.ward.WrdName})"
        rate = bed.BdmCharges or 0.0
        accrued.append({
            "SrvCode": srv_code,
            "SrvName": srv_name,
            "Unit": days,
            "Rate": rate,
            "Amount": days * rate
        })
        
    return {"accruedServices": accrued}

@billing_router.get("/billing")
def get_ipd_bills(db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    records = db.query(models.IndrBlHdr).filter(
        models.IndrBlHdr.IbhRecState == 1
    ).options(
        joinedload(models.IndrBlHdr.patient),
        joinedload(models.IndrBlHdr.ipd_header),
        joinedload(models.IndrBlHdr.bills).joinedload(models.IndrBill.service),
        joinedload(models.IndrBlHdr.payments)
    ).order_by(models.IndrBlHdr.IbhDate.desc()).limit(100).all()
    
    results = []
    for r in records:
        d = serialize_model(r, ["patient", "ipd_header", "payments"])
        d["IndrBill"] = [serialize_model(b, ["service"]) for b in r.bills]
        # Rename payments key to match Next.js IndrBlDpogDtl schema expectations
        d["IndrBlDpogDtl"] = d.pop("payments")
        results.append(d)
    return results

@billing_router.post("/billing", status_code=201)
def create_ipd_bill(body: Dict[str, Any] = Body(...), db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    body.pop("IbhCode", None)
    details = body.pop("IndrBill", [])
    
    try:
        # Determine Voucher No
        if not body.get("IbhVchNo"):
            max_vch = db.query(func.max(models.IndrBlHdr.IbhVchNo)).scalar() or 0
            body["IbhVchNo"] = max_vch + 1
            
        # Date
        if body.get("IbhDate"):
            body["IbhDate"] = datetime.fromisoformat(body["IbhDate"].replace("Z", "+00:00"))
        else:
            body["IbhDate"] = datetime.utcnow()
            
        bill_hdr = models.IndrBlHdr(**body)
        db.add(bill_hdr)
        db.flush() # Get bill_hdr.IbhCode
        
        # Save details
        for idx, d in enumerate(details):
            bill_detail = models.IndrBill(
                IbdIbhCode=bill_hdr.IbhCode,
                IbdSrvCode=d.get("IbdSrvCode"),
                IbdSno=idx + 1,
                IbdUnit=d.get("IbdUnit", 1.0),
                IbdRate=d.get("IbdRate", 0.0),
                IbdAmtBefDisc=d.get("IbdAmtBefDisc", 0.0),
                IbdDiscPer=0.0,
                IbdDiscAmt=0.0,
                IbdAmtAftDisc=d.get("IbdAmtAftDisc", 0.0),
                IbdRecState=1
            )
            db.add(bill_detail)
            
        # If Final discharge, update admission status
        if bill_hdr.IbhBillType == "Final":
            admission = db.query(models.IndrHdr).filter(models.IndrHdr.IhdCode == bill_hdr.IbhIhdCode).first()
            if admission:
                admission.IhdStatus = "Discharged"
                admission.IhdDischDate = bill_hdr.IbhDate
                now = datetime.utcnow()
                admission.IhdDischTime = now.hour * 60 + now.minute
                
        db.commit()
        db.refresh(bill_hdr)
        return serialize_model(bill_hdr)
        
    except Exception as err:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(err))
