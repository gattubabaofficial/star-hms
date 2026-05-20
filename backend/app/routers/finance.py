from fastapi import APIRouter, Depends, HTTPException, Body
from sqlalchemy.orm import Session
from typing import Dict, Any
from datetime import datetime
from ..database import get_db
from .. import models, auth
from .masters import serialize_model, sync_pg_sequence

router = APIRouter(prefix="/finance", tags=["finance"])

@router.get("/{mode}/{bill_id}")
def get_finance_history(mode: str, bill_id: int, db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    if mode not in ["opd", "ipd", "lab"]:
        raise HTTPException(status_code=400, detail="Invalid mode")
        
    payments = []
    refunds = []
    
    if mode == "opd":
        pay_records = db.query(models.OutdBlPymtHdr).filter(
            models.OutdBlPymtHdr.ObpOhdCode == bill_id,
            models.OutdBlPymtHdr.ObpRecState == 1
        ).all()
        ref_records = db.query(models.OutdBlRefdHdr).filter(
            models.OutdBlRefdHdr.ObrOhdCode == bill_id,
            models.OutdBlRefdHdr.ObrRecState == 1
        ).all()
        payments = [serialize_model(p) for p in pay_records]
        refunds = [serialize_model(r) for r in ref_records]
        
    elif mode == "ipd":
        pay_records = db.query(models.IndrBlDpogDtl).filter(
            models.IndrBlDpogDtl.IpdIbhCode == bill_id,
            models.IndrBlDpogDtl.IpdRecState == 1
        ).all()
        ref_records = db.query(models.IndrBlRfugDtl).filter(
            models.IndrBlRfugDtl.IrdIbhCode == bill_id,
            models.IndrBlRfugDtl.IrdRecState == 1
        ).all()
        payments = [serialize_model(p) for p in pay_records]
        refunds = [serialize_model(r) for r in ref_records]
        
    elif mode == "lab":
        pay_records = db.query(models.LabPymtHdr).filter(
            models.LabPymtHdr.LphLhdCode == bill_id,
            models.LabPymtHdr.LphRecState == 1
        ).all()
        ref_records = db.query(models.LabRefdHdr).filter(
            models.LabRefdHdr.LrhLhdCode == bill_id,
            models.LabRefdHdr.LrhRecState == 1
        ).all()
        payments = [serialize_model(p) for p in pay_records]
        refunds = [serialize_model(r) for r in ref_records]
        
    return {"payments": payments, "refunds": refunds}

@router.post("/{mode}/payment", status_code=201)
def record_payment(mode: str, body: Dict[str, Any] = Body(...), db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    if mode not in ["opd", "ipd", "lab"]:
        raise HTTPException(status_code=400, detail="Invalid mode")
        
    # Standardize input fields
    bill_id = None
    amount = 0.0
    date_str = None
    rec_state = 1
    custom_id = None
    
    if mode == "opd":
        bill_id = body.get("billId") or body.get("ObpOhdCode")
        amount = body.get("amount") if body.get("amount") is not None else body.get("ObpAmt", 0.0)
        date_str = body.get("date") or body.get("ObpDate")
        rec_state = body.get("ObpRecState", 1)
        custom_id = body.get("ObpCode")
        
    elif mode == "ipd":
        bill_id = body.get("billId") or body.get("IpdIbhCode")
        amount = body.get("amount") if body.get("amount") is not None else body.get("IpdAmt", 0.0)
        date_str = body.get("date") or body.get("IpdDate")
        rec_state = body.get("IpdRecState", 1)
        custom_id = body.get("IpdCode")
        
    elif mode == "lab":
        bill_id = body.get("billId") or body.get("LphLhdCode")
        amount = body.get("amount") if body.get("amount") is not None else body.get("LphAmt", 0.0)
        date_str = body.get("date") or body.get("LphDate")
        rec_state = body.get("LphRecState", 1)
        custom_id = body.get("LphCode")
        
    if bill_id is None:
        raise HTTPException(status_code=400, detail="Missing bill identifier")
        
    # Parse date
    pay_date = datetime.utcnow()
    if date_str:
        try:
            if isinstance(date_str, str):
                pay_date = datetime.fromisoformat(date_str.replace("Z", "+00:00"))
            elif isinstance(date_str, datetime):
                pay_date = date_str
        except ValueError:
            pass
            
    try:
        if mode == "opd":
            header = db.query(models.OutdHdr).filter(models.OutdHdr.OhdCode == bill_id).first()
            if not header:
                raise HTTPException(status_code=404, detail="OPD bill header not found")
                
            # If custom_id is provided, check if it already exists (upsert)
            pay_record = None
            if custom_id is not None:
                pay_record = db.query(models.OutdBlPymtHdr).filter(models.OutdBlPymtHdr.ObpCode == custom_id).first()
                
            if pay_record:
                # Update existing payment record (e.g. sync correction)
                diff = amount - (pay_record.ObpAmt or 0.0)
                pay_record.ObpAmt = amount
                pay_record.ObpDate = pay_date
                pay_record.ObpRecState = rec_state
                
                header.OhdDepAmt = (header.OhdDepAmt or 0.0) + diff
                header.OhdBalAmt = (header.OhdBalAmt or 0.0) - diff
            else:
                # Create payment record
                pay_record = models.OutdBlPymtHdr(
                    ObpOhdCode=bill_id,
                    ObpDate=pay_date,
                    ObpAmt=amount,
                    ObpRecState=rec_state
                )
                if custom_id is not None:
                    pay_record.ObpCode = custom_id
                    
                db.add(pay_record)
                
                # Update header deposits and balance
                header.OhdDepAmt = (header.OhdDepAmt or 0.0) + amount
                header.OhdBalAmt = (header.OhdBalAmt or 0.0) - amount
                
            db.commit()
            if custom_id is not None:
                sync_pg_sequence(db, "OutdBlPymtHdr", "ObpCode")
                
        elif mode == "ipd":
            header = db.query(models.IndrBlHdr).filter(models.IndrBlHdr.IbhCode == bill_id).first()
            if not header:
                raise HTTPException(status_code=404, detail="IPD bill header not found")
                
            pay_record = None
            if custom_id is not None:
                pay_record = db.query(models.IndrBlDpogDtl).filter(models.IndrBlDpogDtl.IpdCode == custom_id).first()
                
            if pay_record:
                diff = amount - (pay_record.IpdAmt or 0.0)
                pay_record.IpdAmt = amount
                pay_record.IpdDate = pay_date
                pay_record.IpdRecState = rec_state
                
                header.IbhDepAmt = (header.IbhDepAmt or 0.0) + diff
                header.IbhBalAmt = (header.IbhBalAmt or 0.0) - diff
            else:
                pay_record = models.IndrBlDpogDtl(
                    IpdIbhCode=bill_id,
                    IpdDate=pay_date,
                    IpdAmt=amount,
                    IpdRecState=rec_state
                )
                if custom_id is not None:
                    pay_record.IpdCode = custom_id
                    
                db.add(pay_record)
                
                # Update header deposits and balance
                header.IbhDepAmt = (header.IbhDepAmt or 0.0) + amount
                header.IbhBalAmt = (header.IbhBalAmt or 0.0) - amount
                
            db.commit()
            if custom_id is not None:
                sync_pg_sequence(db, "IndrBlDpogDtl", "IpdCode")
                
        elif mode == "lab":
            header = db.query(models.LabHdr).filter(models.LabHdr.LhdCode == bill_id).first()
            if not header:
                raise HTTPException(status_code=404, detail="Lab bill header not found")
                
            pay_record = None
            if custom_id is not None:
                pay_record = db.query(models.LabPymtHdr).filter(models.LabPymtHdr.LphCode == custom_id).first()
                
            if pay_record:
                diff = amount - (pay_record.LphAmt or 0.0)
                pay_record.LphAmt = amount
                pay_record.LphDate = pay_date
                pay_record.LphRecState = rec_state
                
                header.LhdRecvdAmt = (header.LhdRecvdAmt or 0.0) + diff
                header.LhdBalAmt = (header.LhdBalAmt or 0.0) - diff
            else:
                pay_record = models.LabPymtHdr(
                    LphLhdCode=bill_id,
                    LphDate=pay_date,
                    LphAmt=amount,
                    LphRecState=rec_state
                )
                if custom_id is not None:
                    pay_record.LphCode = custom_id
                    
                db.add(pay_record)
                
                # Update header received and balance
                header.LhdRecvdAmt = (header.LhdRecvdAmt or 0.0) + amount
                header.LhdBalAmt = (header.LhdBalAmt or 0.0) - amount
                
            db.commit()
            if custom_id is not None:
                sync_pg_sequence(db, "LabPymtHdr", "LphCode")
                
        return {"message": "Payment recorded successfully"}
    except Exception as err:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(err))

@router.post("/{mode}/refund", status_code=201)
def record_refund(mode: str, body: Dict[str, Any] = Body(...), db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    if mode not in ["opd", "ipd", "lab"]:
        raise HTTPException(status_code=400, detail="Invalid mode")
        
    bill_id = body.get("billId")
    amount = body.get("amount", 0.0)
    date_str = body.get("date")
    
    if not bill_id:
        raise HTTPException(status_code=400, detail="Missing bill identifier")
        
    ref_date = datetime.utcnow()
    if date_str:
        try:
            ref_date = datetime.fromisoformat(date_str.replace("Z", "+00:00"))
        except ValueError:
            pass
            
    try:
        if mode == "opd":
            header = db.query(models.OutdHdr).filter(models.OutdHdr.OhdCode == bill_id).first()
            if not header:
                raise HTTPException(status_code=404, detail="OPD bill header not found")
                
            ref_record = models.OutdBlRefdHdr(
                ObrOhdCode=bill_id,
                ObrDate=ref_date,
                ObrAmt=amount,
                ObrRecState=1
            )
            db.add(ref_record)
            
            # Update header refund and balance
            header.OhdRfugAmt = (header.OhdRfugAmt or 0.0) + amount
            header.OhdBalAmt = (header.OhdBalAmt or 0.0) + amount
            
        elif mode == "ipd":
            header = db.query(models.IndrBlHdr).filter(models.IndrBlHdr.IbhCode == bill_id).first()
            if not header:
                raise HTTPException(status_code=404, detail="IPD bill header not found")
                
            ref_record = models.IndrBlRfugDtl(
                IrdIbhCode=bill_id,
                IrdDate=ref_date,
                IrdAmt=amount,
                IrdRecState=1
            )
            db.add(ref_record)
            
            # Update header refund and balance
            header.IbhRfugAmt = (header.IbhRfugAmt or 0.0) + amount
            header.IbhBalAmt = (header.IbhBalAmt or 0.0) + amount
            
        elif mode == "lab":
            header = db.query(models.LabHdr).filter(models.LabHdr.LhdCode == bill_id).first()
            if not header:
                raise HTTPException(status_code=404, detail="Lab bill header not found")
                
            ref_record = models.LabRefdHdr(
                LrhLhdCode=bill_id,
                LrhDate=ref_date,
                LrhAmt=amount,
                LrhRecState=1
            )
            db.add(ref_record)
            
            # Update header refund and balance
            header.LhdRfugAmt = (header.LhdRfugAmt or 0.0) + amount
            header.LhdBalAmt = (header.LhdBalAmt or 0.0) + amount
            
        db.commit()
        return {"message": "Refund recorded successfully"}
    except Exception as err:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(err))
