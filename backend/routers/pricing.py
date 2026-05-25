from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy.orm import Session
from typing import Optional
from backend.database import get_db
from backend.services.pricing import calculate_service_rate

router = APIRouter()

@router.get("/service/{srv_code}/rate")
def get_service_rate(
    srv_code: int,
    doctor_id: Optional[int] = Query(None, description="Doctor ID"),
    patient_category_id: Optional[int] = Query(None, description="Patient Category ID"),
    ref_by_id: Optional[int] = Query(None, description="Referred By ID"),
    ref_to_id: Optional[int] = Query(None, description="Referred To ID"),
    time: Optional[int] = Query(None, description="Transaction Time (e.g. 1430 for 2:30 PM)"),
    db: Session = Depends(get_db)
):
    """
    Computes the final rate and discount for a given service dynamically
    based on the hierarchical business rules.
    """
    try:
        result = calculate_service_rate(
            db=db,
            srv_code=srv_code,
            doctor_id=doctor_id,
            patient_category_id=patient_category_id,
            ref_by_id=ref_by_id,
            ref_to_id=ref_to_id,
            transaction_time=time
        )
        return result
    except ValueError as e:
        raise HTTPException(status_code=404, detail=str(e))
    except Exception as e:
        raise HTTPException(status_code=500, detail="An error occurred while calculating pricing")
