from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy.orm import Session, joinedload
from sqlalchemy import func
from typing import Dict, Any, List, Optional
from datetime import datetime, time
from ..database import get_db
from .. import models, auth
from .masters import serialize_model

router = APIRouter(prefix="/reporting", tags=["reporting"])

def get_day_bounds(d: datetime):
    # Returns start and end of day for the given datetime object
    start = datetime.combine(d.date(), time.min)
    end = datetime.combine(d.date(), time.max)
    return start, end

@router.get("/collection")
def get_collection_report(
    from_date: Optional[str] = Query(None, alias="from"),
    to_date: Optional[str] = Query(None, alias="to"),
    db: Session = Depends(get_db),
    current_user: dict = Depends(auth.get_current_user)
):
    try:
        if from_date:
            start = datetime.fromisoformat(from_date.replace("Z", "+00:00"))
        else:
            start = datetime.combine(datetime.utcnow().date(), time.min)
            
        if to_date:
            end = datetime.fromisoformat(to_date.replace("Z", "+00:00"))
        else:
            end = datetime.combine(datetime.utcnow().date(), time.max)
            
        # 1. OPD Collections
        opd = db.query(models.OutdHdr).filter(
            models.OutdHdr.OhdDate >= start,
            models.OutdHdr.OhdDate <= end,
            models.OutdHdr.OhdRecState == 1
        ).options(joinedload(models.OutdHdr.patient)).all()
        
        # 2. Lab Collections
        lab = db.query(models.LabHdr).filter(
            models.LabHdr.LhdDate >= start,
            models.LabHdr.LhdDate <= end,
            models.LabHdr.LhdRecState == 1
        ).options(joinedload(models.LabHdr.patient)).all()
        
        # 3. IPD Collections
        ipd = db.query(models.IndrBlHdr).filter(
            models.IndrBlHdr.IbhDate >= start,
            models.IndrBlHdr.IbhDate <= end,
            models.IndrBlHdr.IbhRecState == 1
        ).options(joinedload(models.IndrBlHdr.patient)).all()
        
        return {
            "opd": [serialize_model(x, ["patient"]) for x in opd],
            "lab": [serialize_model(x, ["patient"]) for x in lab],
            "ipd": [serialize_model(x, ["patient"]) for x in ipd]
        }
    except Exception as err:
        raise HTTPException(status_code=500, detail=str(err))

@router.get("/kpis")
def get_kpis(db: Session = Depends(get_db), current_user: dict = Depends(auth.get_current_user)):
    try:
        today = datetime.utcnow()
        start, end = get_day_bounds(today)
        
        # 1. OPD Revenue sum
        opd_sum = db.query(func.sum(models.OutdHdr.OhdTotalAmt)).filter(
            models.OutdHdr.OhdDate >= start,
            models.OutdHdr.OhdDate <= end,
            models.OutdHdr.OhdRecState == 1
        ).scalar() or 0.0
        
        # 2. Lab Revenue sum
        lab_sum = db.query(func.sum(models.LabHdr.LhdTotalAmt)).filter(
            models.LabHdr.LhdDate >= start,
            models.LabHdr.LhdDate <= end,
            models.LabHdr.LhdRecState == 1
        ).scalar() or 0.0
        
        # 3. IPD Revenue sum
        ipd_sum = db.query(func.sum(models.IndrBlHdr.IbhTotalAmt)).filter(
            models.IndrBlHdr.IbhDate >= start,
            models.IndrBlHdr.IbhDate <= end,
            models.IndrBlHdr.IbhRecState == 1
        ).scalar() or 0.0
        
        # 4. Inpatient Census (Currently Admitted)
        census = db.query(models.IndrHdr).filter(
            models.IndrHdr.IhdStatus == "Admitted",
            models.IndrHdr.IhdRecState == 1
        ).count()
        
        # 5. Admissions today
        admissions_today = db.query(models.IndrHdr).filter(
            models.IndrHdr.IhdDate >= start,
            models.IndrHdr.IhdDate <= end,
            models.IndrHdr.IhdRecState == 1
        ).count()
        
        total_revenue = opd_sum + lab_sum + ipd_sum
        
        return {
            "todayRevenue": total_revenue,
            "opdRevenue": opd_sum,
            "labRevenue": lab_sum,
            "ipdRevenue": ipd_sum,
            "activeCensus": census,
            "totalAdmissionsToday": admissions_today
        }
    except Exception as err:
        raise HTTPException(status_code=500, detail=str(err))
