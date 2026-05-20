from fastapi import APIRouter, Depends, HTTPException, Body
from sqlalchemy.orm import Session, joinedload
from sqlalchemy import func
from typing import Dict, Any, List, Optional
from datetime import datetime
from ..database import get_db
from .. import models, auth
from .masters import serialize_model

router = APIRouter(prefix="/lab", tags=["lab"])

@router.get("/billing")
def get_lab_billing(db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    records = db.query(models.LabHdr).filter(
        models.LabHdr.LhdRecState == 1
    ).options(
        joinedload(models.LabHdr.patient),
        joinedload(models.LabHdr.doctor),
        joinedload(models.LabHdr.bills).joinedload(models.LabRcpt.service),
        joinedload(models.LabHdr.payments)
    ).order_by(models.LabHdr.LhdDate.desc()).limit(100).all()
    
    # Format to match Nest.js nested object keys exactly
    results = []
    for r in records:
        d = serialize_model(r, ["patient", "doctor", "payments"])
        d["LabRcpt"] = [serialize_model(b, ["service"]) for b in r.bills]
        # Rename payments key to match Next.js LabPymtHdr schema expectations
        d["LabPymtHdr"] = d.pop("payments")
        results.append(d)
        
    return results

@router.post("/billing", status_code=201)
def create_lab_billing(body: Dict[str, Any] = Body(...), db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    body.pop("LhdCode", None)
    
    details = body.pop("LabRcpt", [])
    payments = body.pop("LabPymtHdr", [])
    doctor_shares = body.pop("LabRcDctDtl", [])
    
    try:
        # Determine Voucher No
        if not body.get("LhdVchNo"):
            max_vch = db.query(func.max(models.LabHdr.LhdVchNo)).scalar() or 0
            body["LhdVchNo"] = max_vch + 1
            
        # Parse date
        if body.get("LhdDate"):
            body["LhdDate"] = datetime.fromisoformat(body["LhdDate"].replace("Z", "+00:00"))
        else:
            body["LhdDate"] = datetime.utcnow()
            
        header = models.LabHdr(**body)
        db.add(header)
        db.flush() # Get header.LhdCode
        
        # Create billing details
        for idx, d in enumerate(details):
            bill_detail = models.LabRcpt(
                LrdLhdCode=header.LhdCode,
                LrdSrvCode=d.get("LrdSrvCode"),
                LrdSno=idx + 1,
                LrdUnit=d.get("LrdUnit", 1.0),
                LrdRate=d.get("LrdRate", 0.0),
                LrdAmtBefDisc=d.get("LrdAmtBefDisc", 0.0),
                LrdDiscPer=d.get("LrdDiscPer", 0.0),
                LrdDiscAmt=d.get("LrdDiscAmt", 0.0),
                LrdAmtAftDisc=d.get("LrdAmtAftDisc", 0.0),
                LrdRecState=1
            )
            db.add(bill_detail)
            
        # Create doctor shares
        for ds in doctor_shares:
            share = models.LabRcDctDtl(
                LddLhdCode=header.LhdCode,
                LddDctCode=ds.get("LddDctCode"),
                LddSharePer=ds.get("LddSharePer", 0.0),
                LddRecState=1
            )
            db.add(share)
            
        # Create payments
        for p in payments:
            pay_date = datetime.utcnow()
            if p.get("LphDate"):
                pay_date = datetime.fromisoformat(p["LphDate"].replace("Z", "+00:00"))
            payment = models.LabPymtHdr(
                LphLhdCode=header.LhdCode,
                LphDate=pay_date,
                LphAmt=p.get("LphAmt", 0.0),
                LphRecState=1
            )
            db.add(payment)
            
        db.commit()
        db.refresh(header)
        
        # Serialize response including details/payments
        res = serialize_model(header)
        db_bills = db.query(models.LabRcpt).filter(models.LabRcpt.LrdLhdCode == header.LhdCode).all()
        db_pymts = db.query(models.LabPymtHdr).filter(models.LabPymtHdr.LphLhdCode == header.LhdCode).all()
        
        res["LabRcpt"] = [serialize_model(b) for b in db_bills]
        res["LabPymtHdr"] = [serialize_model(p) for p in db_pymts]
        return res
        
    except Exception as err:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(err))

@router.delete("/billing/{id}")
def delete_lab_billing(id: int, db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    header = db.query(models.LabHdr).filter(models.LabHdr.LhdCode == id).first()
    if not header:
        raise HTTPException(status_code=404, detail="Lab bill header not found")
        
    try:
        header.LhdRecState = 0
        db.commit()
        return {"message": "Deleted successfully"}
    except Exception as err:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(err))
