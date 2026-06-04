from sqlalchemy.orm import Session
from backend.models.masters import ServMast, ServGrpMst, ServRateMst, PatCatgMst
from typing import Optional

def calculate_service_rate(
    db: Session,
    srv_code: int,
    doctor_id: Optional[int] = None,
    patient_category_id: Optional[int] = None,
    ref_by_id: Optional[int] = None,
    ref_to_id: Optional[int] = None,
    transaction_time: Optional[int] = None, # Time represented as an integer (e.g., HHMM)
) -> dict:
    
    # Fetch base service
    service = db.query(ServMast).filter(ServMast.SrvCode == srv_code, ServMast.SrvRecState == 1).first()
    if not service:
        raise ValueError(f"Service with code {srv_code} not found")
        
    group = db.query(ServGrpMst).filter(ServGrpMst.SgpCode == service.SrvSgpCode).first()

    # Base rate fallback
    base_rate = service.SrvCharges or 0.0
    resolved_rate = base_rate
    
    # Priority order for rates from ServRateMst: TimeWise, DoctWise, PatCatg, RefBy, RefTo
    # We will fetch all applicable custom rates and pick the highest priority one.
    custom_rates = db.query(ServRateMst).filter(
        ServRateMst.SrmSrvCode == srv_code,
        ServRateMst.SrmRecState == 1
    ).all()

    found_custom_rate = False
    resolved_discount = 0.0

    # 1. TimeWise (Highest Priority)
    if not found_custom_rate and transaction_time is not None:
        for cr in custom_rates:
            if cr.SrmRateType == 'TimeWise' and cr.SrmStartTime is not None and cr.SrmEndTime is not None:
                if cr.SrmStartTime <= transaction_time <= cr.SrmEndTime:
                    resolved_rate = cr.SrmRate
                    resolved_discount = cr.SrmDiscPer
                    found_custom_rate = True
                    break

    # 2. DoctWise
    if not found_custom_rate and doctor_id is not None:
        for cr in custom_rates:
            if cr.SrmRateType == 'DoctWise' and cr.SrmRefCode == doctor_id:
                resolved_rate = cr.SrmRate
                resolved_discount = cr.SrmDiscPer
                found_custom_rate = True
                break

    # 3. PatCatg
    if not found_custom_rate and patient_category_id is not None:
        for cr in custom_rates:
            if cr.SrmRateType == 'PatCatg' and cr.SrmRefCode == patient_category_id:
                resolved_rate = cr.SrmRate
                resolved_discount = cr.SrmDiscPer
                found_custom_rate = True
                break

    # 4. RefBy
    if not found_custom_rate and ref_by_id is not None:
        for cr in custom_rates:
            if cr.SrmRateType == 'RefBy' and cr.SrmRefCode == ref_by_id:
                resolved_rate = cr.SrmRate
                resolved_discount = cr.SrmDiscPer
                found_custom_rate = True
                break

    # 5. RefTo
    if not found_custom_rate and ref_to_id is not None:
        for cr in custom_rates:
            if cr.SrmRateType == 'RefTo' and cr.SrmRefCode == ref_to_id:
                resolved_rate = cr.SrmRate
                resolved_discount = cr.SrmDiscPer
                found_custom_rate = True
                break

    # ----------------------------------------------------
    # Discount Resolution (if no custom discount was found)
    # ----------------------------------------------------
    if not found_custom_rate:
        # Check standard discount hierarchy if custom rate wasn't applied
        if service.SrvDiscAllowed:
            # 1. Patient Category Discount
            if patient_category_id:
                pat_catg = db.query(PatCatgMst).filter(PatCatgMst.PcgCode == patient_category_id).first()
                if pat_catg and pat_catg.PcgDiscAllowed:
                    resolved_discount = pat_catg.PcgDiscPer
            
            # 2. Service Group Discount (If PatCatg didn't give discount)
            if resolved_discount == 0.0 and group and group.SgpDiscAllowed:
                resolved_discount = group.SgpDiscPer
                
            # 3. Service Level Default Discount
            if resolved_discount == 0.0:
                resolved_discount = service.SrvDiscPer

    # Final Calculation
    discount_amount = (resolved_rate * resolved_discount) / 100
    final_amount = resolved_rate - discount_amount

    # Doctor Share Calculation (Net Amount based)
    dct_share_amt = 0.0
    hosp_share_amt = final_amount
    
    if doctor_id:
        from backend.models.masters import DoctMast
        doctor = db.query(DoctMast).filter(DoctMast.DctCode == doctor_id).first()
        if doctor and doctor.DctShare:
            dct_share_amt = (final_amount * doctor.DctShare) / 100.0
            hosp_share_amt = final_amount - dct_share_amt

    return {
        "srv_code": srv_code,
        "base_rate": base_rate,
        "resolved_rate": resolved_rate,
        "resolved_discount_per": resolved_discount,
        "discount_amount": discount_amount,
        "final_amount": final_amount,
        "doctor_share_amt": dct_share_amt,
        "hospital_share_amt": hosp_share_amt,
        "applied_custom_rule": found_custom_rate
    }
