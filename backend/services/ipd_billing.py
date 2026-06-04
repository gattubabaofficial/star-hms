import math
from datetime import datetime, time
from sqlalchemy.orm import Session
from backend.models.masters import BedMast, WardMast

from backend.models.ipd import IBedState

def calculate_ipd_room_rent(
    db: Session,
    bed_code: int = None,
    admission_date: datetime = None,
    discharge_date: datetime = None,
    ihd_code: int = None
) -> dict:
    """
    Calculates IPD room rent based on Fixed Checkout Time (12:00 PM).
    If ihd_code is provided, iterates over historical IBedState to compute multi-bed charges.
    """
    if not discharge_date:
        discharge_date = datetime.now()
        
    checkout_time = time(12, 0)
    total_rent = 0.0
    total_days_all = 0
    final_bed_code = bed_code
    
    if ihd_code:
        bed_states = db.query(IBedState).filter(IBedState.IbsIpgCode == ihd_code).order_by(IBedState.IbsDate.asc()).all()
        if bed_states:
            for idx, state in enumerate(bed_states):
                bed = db.query(BedMast).filter(BedMast.BdmCode == state.IbsBdmCode).first()
                rate = bed.BdmCharges if bed and hasattr(bed, 'BdmCharges') and bed.BdmCharges else 0.0
                
                # State start
                st_date = datetime.combine(state.IbsDate, datetime.min.time()) if state.IbsDate else admission_date
                
                # State end
                en_date = discharge_date
                if state.IbsDischDate:
                    en_date = datetime.combine(state.IbsDischDate, datetime.min.time())
                
                days = (en_date.date() - st_date.date()).days
                
                # If this is the final state (or only state) and discharged after checkout time
                is_final_state = (idx == len(bed_states) - 1)
                
                if is_final_state:
                    if days == 0:
                        days = 1
                    else:
                        if en_date.time() > checkout_time:
                            days += 1
                else:
                    if days == 0:
                        days = 1 # min 1 day per ward shift
                
                total_days_all += days
                total_rent += (days * rate)
            
            final_bed_code = bed_states[-1].IbsBdmCode
            return {
                "bed_code": final_bed_code,
                "admission_date": admission_date,
                "discharge_date": discharge_date,
                "total_days": total_days_all,
                "rate_per_day": 0.0, # mixed rates
                "total_rent": total_rent
            }

    # Fallback for preview without ihd_code
    bed = db.query(BedMast).filter(BedMast.BdmCode == bed_code).first()
    if not bed:
        raise ValueError("Invalid Bed Code")
        
    total_days = (discharge_date.date() - admission_date.date()).days
    if total_days == 0:
        total_days = 1
    else:
        if discharge_date.time() > checkout_time:
            total_days += 1

    rate = bed.BdmCharges if hasattr(bed, 'BdmCharges') and bed.BdmCharges else 0.0
    total_rent = rate * total_days

    return {
        "bed_code": bed_code,
        "admission_date": admission_date,
        "discharge_date": discharge_date,
        "total_days": total_days,
        "rate_per_day": rate,
        "total_rent": total_rent
    }
