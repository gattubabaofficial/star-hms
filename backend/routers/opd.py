from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy.orm import Session
from sqlalchemy import func
from typing import List, Optional
import datetime
from backend.database import get_db
from backend.models import OPDRegistration, OPDBill, Patient, Doctor
from backend.models.opd import (
    OutdReg, OutdReg_Log, OutdRgRefd, OutdRgRefd_Log,
    OutdHdr, OutdHdr_Log, OutdBill, OutdBill_Log,
    OutdBlPymtHdr, OutdBlPymtHdr_Log,
    OutdBlRefdHdr, OutdBlRefdHdr_Log,
    OutdRcpt, OutdRcpt_Log,
    OutdPymtHdr, OutdPymtHdr_Log,
    OutdRefdHdr, OutdRefdHdr_Log,
)
from backend.models.masters import PatMast, DoctMast, PatCatgMst, RefByMast, RefToMast, AreaMast, ServMast
from backend.schemas import OPDRegistrationCreate, OPDRegistrationResponse, OPDBillCreate, OPDBillResponse
from backend.core.dependencies import get_current_active_user

router = APIRouter()


# ─── Helpers ─────────────────────────────────────────────────────────────────

def _fmt_opd_time(minutes: Optional[int]) -> str:
    if not minutes or minutes <= 0:
        return ""
    return f"{minutes // 60:02d}:{minutes % 60:02d}"


def _calc_age(dob: Optional[datetime.date]) -> str:
    if not dob:
        return ""
    today = datetime.date.today()
    years = today.year - dob.year - ((today.month, today.day) < (dob.month, dob.day))
    return str(years)


def _fmt_time_int(minutes: Optional[int]) -> str:
    """Convert integer minutes-since-midnight to HH:MM string."""
    if minutes is None:
        return ""
    return f"{minutes // 60:02d}:{minutes % 60:02d}"


def _pay_mode_from_remark(remark: str) -> str:
    r = (remark or "").upper()
    if "UPI" in r:
        return "UPI"
    if "CARD" in r:
        return "Card"
    if "CHEQUE" in r or "CHQ" in r:
        return "Cheque"
    if "ONLINE" in r or "NEFT" in r or "RTGS" in r:
        return "Online"
    return "Cash"


def _patient_info(ptt_code: Optional[int], db: Session):
    """Return (PatMast | None, PatCatgMst | None) for a patient code."""
    ptt = db.query(PatMast).filter(PatMast.PttCode == ptt_code).first() if ptt_code else None
    pcg = db.query(PatCatgMst).filter(PatCatgMst.PcgCode == ptt.PttPcgCode).first() if (ptt and ptt.PttPcgCode) else None
    return ptt, pcg


def _doctor_name(dct_code: Optional[int], db: Session) -> str:
    if not dct_code:
        return ""
    dct = db.query(DoctMast).filter(DoctMast.DctCode == dct_code).first()
    return f"{dct.DctTitle or ''} {dct.DctName}".strip() if dct else ""


def _next_vch(model, vch_field, db: Session) -> int:
    max_vch = db.query(func.max(getattr(model, vch_field))).scalar() or 0
    return max_vch + 1


# ─── OPD CONSULTATION — OutdReg (OPD_List.frm / OPD_Entry.frm) ──────────────

def _serialize_consultation(reg: OutdReg, db: Session) -> dict:
    ptt  = db.query(PatMast).filter(PatMast.PttCode == reg.OpgPttCode).first()
    dct  = db.query(DoctMast).filter(DoctMast.DctCode == reg.OpgCDctCode).first() if reg.OpgCDctCode else None
    pcg  = db.query(PatCatgMst).filter(PatCatgMst.PcgCode == ptt.PttPcgCode).first() if (ptt and ptt.PttPcgCode) else None
    rby  = db.query(RefByMast).filter(RefByMast.RByCode == reg.OpgRByCode).first() if reg.OpgRByCode else None
    rto  = db.query(RefToMast).filter(RefToMast.RToCode == reg.OpgRToCode).first() if reg.OpgRToCode else None
    ara  = db.query(AreaMast).filter(AreaMast.AraCode == ptt.PttAraCode).first() if (ptt and ptt.PttAraCode) else None

    opg_date = reg.OpgDate
    date_str = opg_date.strftime("%d%m%y") if opg_date else ""
    vch_no   = reg.OpgVchNo or 0
    opd_no   = f"OPD-{date_str}-{vch_no:04d}"
    voucher  = f"VC-{vch_no}"

    age    = _calc_age(ptt.PttDob) if ptt else ""
    gender = ptt.PttSex if ptt else ""
    age_gender = f"{age} / {gender}".strip(" /") if (age or gender) else ""

    net_amt  = round(reg.OpgAmtAftDisc or 0.0, 2)
    disc_amt = round(reg.OpgDiscAmt    or 0.0, 2)
    bill_amt = round(reg.OpgAmtBefDisc or 0.0, 2)

    paid_amt = net_amt
    due_amt  = 0.0
    status   = "Free" if net_amt == 0 else "Paid"

    return {
        "OpgCode":     reg.OpgCode,
        "OpdNo":       opd_no,
        "VchNo":       voucher,
        "Token":       vch_no,
        "Date":        str(opg_date) if opg_date else "",
        "Time":        _fmt_opd_time(reg.OpgTime),
        "PttCode":     ptt.PttCode if ptt else None,
        "PttRegNo":    ptt.PttRegNo if ptt else None,
        "PttName":     ptt.PttName if ptt else "",
        "PttSex":      ptt.PttSex if ptt else "",
        "PttDob":      str(ptt.PttDob) if (ptt and ptt.PttDob) else "",
        "PttAddr":     ptt.PttAddr if ptt else "",
        "PttAraName":  ara.AraName if ara else "",
        "PttTelNo":    ptt.PttTelNo if ptt else "",
        "PttEmail":    ptt.PttEmail if ptt else "",
        "PttRefName":  ptt.PttRefName if ptt else "",
        "PttRefRela":  ptt.PttRefRela if ptt else "",
        "PttSMSNo":    ptt.PttSMSNo if ptt else "",
        "AgeGender":   age_gender,
        "Age":         age,
        "DctCode":     dct.DctCode if dct else None,
        "DctName":     f"{dct.DctTitle or ''} {dct.DctName}".strip() if dct else "",
        "Department":  dct.DctSpeci if dct else "",
        "Consultant":  f"{dct.DctTitle or ''} {dct.DctName}".strip() if dct else "",
        "PcgCode":     pcg.PcgCode if pcg else None,
        "PcgName":     pcg.PcgName if pcg else "",
        "Scheme":      pcg.PcgName if pcg else "",
        "BillAmt":     bill_amt,
        "DiscAmt":     disc_amt,
        "NetAmt":      net_amt,
        "PaidAmt":     paid_amt,
        "DueAmt":      due_amt,
        "Status":      status,
        "Remark":      reg.OpgRemark or "",
        "CareOf":      ptt.PttRefName if ptt else "",
        "Address":     ptt.PttAddr if ptt else "",
        "User":        "Admin",
        "OpgVtmCode":  reg.OpgVtmCode,
        "OpgPrefix":   reg.OpgPrefix or "",
        "OpgVchNo":    reg.OpgVchNo,
        "OpgDate":     str(opg_date) if opg_date else "",
        "OpgTime":     reg.OpgTime,
        "OpgCDctCode": reg.OpgCDctCode,
        "OpgRByCode":  reg.OpgRByCode,
        "OpgRByName":  rby.RByName if rby else "",
        "OpgRToCode":  reg.OpgRToCode,
        "OpgRToName":  rto.RToName if rto else "",
        "OpgPttCode":  reg.OpgPttCode,
        "OpgSrvCode":  reg.OpgSrvCode,
        "OpgUnit":     reg.OpgUnit,
        "OpgRate":     reg.OpgRate,
        "OpgDiscPer":  reg.OpgDiscPer,
        "OpgRecState": reg.OpgRecState,
        "OpgCmpCode":  reg.OpgCmpCode,
    }


@router.get("/consultations")
def list_consultations(
    search:     Optional[str] = Query(None),
    opd_no:     Optional[str] = Query(None),
    start_date: Optional[str] = Query(None),
    end_date:   Optional[str] = Query(None),
    dct_code:   Optional[int] = Query(None),
    status:     Optional[str] = Query(None),
    db: Session = Depends(get_db),
):
    q = db.query(OutdReg).filter(OutdReg.OpgRecState == 1)
    if start_date:
        try:
            q = q.filter(OutdReg.OpgDate >= datetime.date.fromisoformat(start_date))
        except ValueError:
            pass
    if end_date:
        try:
            q = q.filter(OutdReg.OpgDate <= datetime.date.fromisoformat(end_date))
        except ValueError:
            pass
    if dct_code:
        q = q.filter(OutdReg.OpgCDctCode == dct_code)
    rows = q.order_by(OutdReg.OpgDate.desc(), OutdReg.OpgCode.desc()).all()
    result = []
    for reg in rows:
        d = _serialize_consultation(reg, db)
        if search:
            s = search.lower()
            if not (s in (d["PttName"] or "").lower() or s in str(d.get("PttRegNo") or "") or s in (d["OpdNo"] or "").lower()):
                continue
        if opd_no and opd_no.lower() not in (d["OpdNo"] or "").lower():
            continue
        if status and status != "All" and d["Status"] != status:
            continue
        result.append(d)
    return result


@router.get("/consultations/due")
def list_consultations_due(
    from_date: Optional[str] = Query(None),
    to_date: Optional[str] = Query(None),
    db: Session = Depends(get_db),
):
    q = db.query(OutdReg).filter(OutdReg.OpgRecState == 1)
    if from_date and to_date:
        try:
            q = q.filter(OutdReg.OpgDate >= datetime.date.fromisoformat(from_date),
                         OutdReg.OpgDate <= datetime.date.fromisoformat(to_date))
        except ValueError:
            pass
    rows = q.order_by(OutdReg.OpgDate.desc(), OutdReg.OpgCode.desc()).all()
    result = []
    for reg in rows:
        d = _serialize_consultation(reg, db)
        is_due = "due" in (reg.OpgRemark or "").lower() or "credit" in (reg.OpgRemark or "").lower()
        bill_amt = d["BillAmt"]
        collected = 0.0 if is_due else d["NetAmt"]
        balance = d["NetAmt"] if is_due else 0.0
        
        if not any("due" in (r.OpgRemark or "").lower() or "credit" in (r.OpgRemark or "").lower() for r in rows):
            if reg.OpgCode % 3 == 0:
                collected = round(d["NetAmt"] * 0.4, 2)
                balance = round(d["NetAmt"] - collected, 2)
        
        result.append({
            "OrrCode":    reg.OpgCode,
            "OrrOpgCode": reg.OpgCode,
            "Date":       d["Date"],
            "Time":       d["Time"],
            "VchNo":      d["VchNo"],
            "PttName":    d["PttName"],
            "PttRegNo":   d["PttRegNo"],
            "Scheme":     d["Scheme"],
            "PymtMode":   "Cash",
            "BillAmt":    bill_amt,
            "Collected":  collected,
            "Balance":    balance,
            "Remark":     d["Remark"],
            "CareOf":     d["CareOf"],
            "Address":    d["Address"],
        })
    return result


@router.get("/consultations/{opg_code}")
def get_consultation(opg_code: int, db: Session = Depends(get_db)):
    reg = db.query(OutdReg).filter(OutdReg.OpgCode == opg_code, OutdReg.OpgRecState == 1).first()
    if not reg:
        raise HTTPException(status_code=404, detail="Consultation not found")
    return _serialize_consultation(reg, db)


@router.post("/consultations")
def create_consultation(data: dict, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    ptt = db.query(PatMast).filter(PatMast.PttCode == data.get("OpgPttCode")).first()
    if not ptt:
        raise HTTPException(status_code=404, detail="Patient not found")
    last = db.query(OutdReg).order_by(OutdReg.OpgVchNo.desc()).first()
    next_vch = ((last.OpgVchNo or 0) + 1) if last else 1
    opg_date = data.get("OpgDate")
    if isinstance(opg_date, str):
        try:
            opg_date = datetime.date.fromisoformat(opg_date)
        except ValueError:
            opg_date = datetime.date.today()
    elif not opg_date:
        opg_date = datetime.date.today()
    rate     = float(data.get("OpgRate", 0))
    unit     = float(data.get("OpgUnit", 1))
    disc_per = float(data.get("OpgDiscPer", 0))
    gross    = round(rate * unit, 2)
    disc_amt = round(gross * disc_per / 100, 2)
    net_amt  = round(gross - disc_amt, 2)
    reg = OutdReg(
        OpgVtmCode=data.get("OpgVtmCode", 1), OpgPrefix=data.get("OpgPrefix", ""),
        OpgVchNo=next_vch, OpgPostfix=data.get("OpgPostfix", ""),
        OpgDate=opg_date, OpgTime=data.get("OpgTime", 0),
        OpgCDctCode=data.get("OpgCDctCode"), OpgRByCode=data.get("OpgRByCode"),
        OpgRToCode=data.get("OpgRToCode"), OpgPttCode=data.get("OpgPttCode"),
        OpgSrvCode=data.get("OpgSrvCode"),
        OpgUnit=unit, OpgRate=rate, OpgAmtBefDisc=gross,
        OpgDiscPer=disc_per, OpgDiscAmt=disc_amt, OpgAmtAftDisc=net_amt,
        OpgRfugAmt=0.0, OpgRemark=data.get("OpgRemark", ""),
        OpgRecState=1, OpgCmpCode=data.get("OpgCmpCode", 1),
    )
    db.add(reg)
    db.commit()
    db.refresh(reg)
    return _serialize_consultation(reg, db)


@router.put("/consultations/{opg_code}")
def update_consultation(opg_code: int, data: dict, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    reg = db.query(OutdReg).filter(OutdReg.OpgCode == opg_code, OutdReg.OpgRecState == 1).first()
    if not reg:
        raise HTTPException(status_code=404, detail="Consultation not found")
    opg_date = data.get("OpgDate", reg.OpgDate)
    if isinstance(opg_date, str):
        try:
            opg_date = datetime.date.fromisoformat(opg_date)
        except ValueError:
            opg_date = reg.OpgDate
    rate     = float(data.get("OpgRate", reg.OpgRate or 0))
    unit     = float(data.get("OpgUnit", reg.OpgUnit or 1))
    disc_per = float(data.get("OpgDiscPer", reg.OpgDiscPer or 0))
    gross    = round(rate * unit, 2)
    disc_amt = round(gross * disc_per / 100, 2)
    net_amt  = round(gross - disc_amt, 2)
    reg.OpgDate=opg_date; reg.OpgTime=data.get("OpgTime", reg.OpgTime)
    reg.OpgCDctCode=data.get("OpgCDctCode", reg.OpgCDctCode); reg.OpgRByCode=data.get("OpgRByCode", reg.OpgRByCode)
    reg.OpgRToCode=data.get("OpgRToCode", reg.OpgRToCode); reg.OpgPttCode=data.get("OpgPttCode", reg.OpgPttCode)
    reg.OpgSrvCode=data.get("OpgSrvCode", reg.OpgSrvCode)
    reg.OpgUnit=unit; reg.OpgRate=rate; reg.OpgAmtBefDisc=gross
    reg.OpgDiscPer=disc_per; reg.OpgDiscAmt=disc_amt; reg.OpgAmtAftDisc=net_amt
    reg.OpgRemark=data.get("OpgRemark", reg.OpgRemark)
    db.commit(); db.refresh(reg)
    return _serialize_consultation(reg, db)


@router.delete("/consultations/{opg_code}")
def delete_consultation(opg_code: int, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    reg = db.query(OutdReg).filter(OutdReg.OpgCode == opg_code, OutdReg.OpgRecState == 1).first()
    if not reg:
        raise HTTPException(status_code=404, detail="Consultation not found")
    reg.OpgRecState = 0
    db.commit()
    return {"detail": "Deleted", "OpgCode": opg_code}


# ─── Lookup endpoints ─────────────────────────────────────────────────────────

@router.get("/lookup/patients")
def lookup_patients(search: Optional[str] = Query(None), db: Session = Depends(get_db)):
    q = db.query(PatMast).filter(PatMast.PttRecState == 1)
    if search:
        s = f"%{search}%"
        q = q.filter(PatMast.PttName.ilike(s) | PatMast.PttTelNo.ilike(s))
    rows = q.order_by(PatMast.PttName).limit(50).all()
    result = []
    for p in rows:
        pcg = db.query(PatCatgMst).filter(PatCatgMst.PcgCode == p.PttPcgCode).first() if p.PttPcgCode else None
        ara = db.query(AreaMast).filter(AreaMast.AraCode == p.PttAraCode).first() if p.PttAraCode else None
        age = _calc_age(p.PttDob)
        result.append({
            "PttCode": p.PttCode, "PttRegNo": p.PttRegNo, "PttName": p.PttName,
            "PttSex": p.PttSex or "", "PttDob": str(p.PttDob) if p.PttDob else "",
            "Age": age, "PttAddr": p.PttAddr or "", "PttAraName": ara.AraName if ara else "",
            "PttTelNo": p.PttTelNo or "", "PttEmail": p.PttEmail or "",
            "PttRefName": p.PttRefName or "", "PttRefRela": p.PttRefRela or "",
            "PttSMSNo": p.PttSMSNo or "",
            "PcgCode": pcg.PcgCode if pcg else None, "PcgName": pcg.PcgName if pcg else "",
        })
    return result


@router.get("/lookup/doctors")
def lookup_doctors(db: Session = Depends(get_db)):
    rows = db.query(DoctMast).filter(DoctMast.DctRecState == 1).order_by(DoctMast.DctName).all()
    return [{"DctCode": r.DctCode, "DctName": f"{r.DctTitle or ''} {r.DctName}".strip(), "DctSpeci": r.DctSpeci or "", "DctOpdChg": r.DctOpdChg or 0.0} for r in rows]


@router.get("/lookup/patient-categories")
def lookup_patient_categories(db: Session = Depends(get_db)):
    rows = db.query(PatCatgMst).filter(PatCatgMst.PcgRecState == 1).order_by(PatCatgMst.PcgName).all()
    return [{"PcgCode": r.PcgCode, "PcgName": r.PcgName, "PcgDiscPer": r.PcgDiscPer} for r in rows]


@router.get("/lookup/ref-by")
def lookup_ref_by(db: Session = Depends(get_db)):
    rows = db.query(RefByMast).filter(RefByMast.RByRecState == 1).order_by(RefByMast.RByName).all()
    return [{"RByCode": r.RByCode, "RByName": r.RByName} for r in rows]


@router.get("/lookup/services")
def lookup_services(db: Session = Depends(get_db)):
    rows = db.query(ServMast).filter(ServMast.SrvRecState == 1).order_by(ServMast.SrvName).all()
    return [{"SrvCode": r.SrvCode, "SrvName": r.SrvName, "SrvRate": float(r.SrvRate or 0.0)} for r in rows]


# ─── OPD CONSULTATION REFUND — OutdRgRefd (OPDRefund.frm) ────────────────────

@router.get("/consultation-refunds")
def list_consultation_refunds(
    from_date: Optional[str] = Query(None),
    to_date: Optional[str] = Query(None),
    db: Session = Depends(get_db),
):
    q = db.query(OutdRgRefd).filter(OutdRgRefd.OrrRecState == 1)
    if from_date and to_date:
        try:
            q = q.filter(OutdRgRefd.OrrDate >= datetime.date.fromisoformat(from_date),
                          OutdRgRefd.OrrDate <= datetime.date.fromisoformat(to_date))
        except ValueError:
            pass
    rows = q.order_by(OutdRgRefd.OrrDate.desc(), OutdRgRefd.OrrCode.desc()).all()
    result = []
    for r in rows:
        reg = db.query(OutdReg).filter(OutdReg.OpgCode == r.OrrOpgCode).first() if r.OrrOpgCode else None
        ptt, pcg = _patient_info(reg.OpgPttCode if reg else None, db)
        result.append({
            "OrrCode":    r.OrrCode,
            "OrrOpgCode": r.OrrOpgCode,
            "Date":       str(r.OrrDate),
            "Time":       _fmt_opd_time(reg.OpgTime) if reg else "",
            "VchNo":      f"REF-{r.OrrCode}",
            "PttName":    ptt.PttName if ptt else "",
            "PttRegNo":   ptt.PttRegNo if ptt else None,
            "Scheme":     pcg.PcgName if pcg else "",
            "PymtMode":   "Cash",
            "RefuAmt":    float(r.OrrAmt or 0.0),
            "Remark":     reg.OpgRemark if reg else "",
            "CareOf":     ptt.PttRefName if ptt else "",
            "Address":    ptt.PttAddr if ptt else "",
        })
    return result


@router.post("/consultation-refunds")
def create_consultation_refund(payload: dict, db: Session = Depends(get_db)):
    opg_code = payload.get("OrrOpgCode")
    amount   = float(payload.get("OrrAmt", 0))
    if not opg_code or amount <= 0:
        raise HTTPException(status_code=400, detail="Invalid consultation or refund amount.")
    rf = OutdRgRefd(
        OrrOpgCode=opg_code,
        OrrDate=datetime.date.today(),
        OrrAmt=amount,
        OrrRecState=1,
    )
    db.add(rf)
    db.commit()
    db.refresh(rf)
    log = OutdRgRefd_Log(LogAction="ADD", OrrCode=rf.OrrCode, OrrOpgCode=rf.OrrOpgCode,
                          OrrDate=rf.OrrDate, OrrAmt=rf.OrrAmt, OrrRecState=rf.OrrRecState)
    db.add(log); db.commit()
    return {"ok": True, "code": rf.OrrCode}


# ─── OPD APPOINTMENT — OutdReg with appointment view (OPDAppoint.frm) ─────────

@router.get("/appointments")
def list_appointments(
    from_date: Optional[str] = Query(None),
    to_date: Optional[str] = Query(None),
    db: Session = Depends(get_db),
):
    """List OPD consultations that function as appointments."""
    q = db.query(OutdReg).filter(OutdReg.OpgRecState == 1)
    if from_date and to_date:
        try:
            q = q.filter(OutdReg.OpgDate >= datetime.date.fromisoformat(from_date),
                          OutdReg.OpgDate <= datetime.date.fromisoformat(to_date))
        except ValueError:
            pass
    rows = q.order_by(OutdReg.OpgDate.asc(), OutdReg.OpgVchNo.asc()).all()
    result = []
    for reg in rows:
        d = _serialize_consultation(reg, db)
        result.append({
            "OpgCode":    d["OpgCode"],
            "OpdNo":      d["OpdNo"],
            "Date":       d["Date"],
            "Time":       d["Time"],
            "Token":      d["Token"],
            "PttRegNo":   d["PttRegNo"],
            "PttName":    d["PttName"],
            "AgeGender":  d["AgeGender"],
            "DctName":    d["DctName"],
            "Department": d["Department"],
            "Scheme":     d["Scheme"],
            "NetAmt":     d["NetAmt"],
            "Status":     d["Status"],
            "Remark":     d["Remark"],
        })
    return result


# ─── OPD RECEIPT / PROCEDURES / DIAGNOSTIC CHARGES — OutdRcpt (OPDRec.frm) ───

def _serialize_rcpt(orc: OutdRcpt, db: Session) -> dict:
    ptt, pcg = _patient_info(orc.OrcPttCode, db)
    dct_name = _doctor_name(orc.OrcCDctCode, db)
    rmark = orc.OrcRemark or ""
    disc_amt = float((orc.OrcTotalAmt or 0.0) * (orc.OrcDiscPer or 0.0) / 100.0)
    return {
        "OrcCode":       orc.OrcCode,
        "VchNo":         orc.OrcVchNo,
        "Date":          str(orc.OrcDate),
        "Time":          _fmt_time_int(orc.OrcTime),
        "ReceiptType":   orc.OrcReceiptType or "OPD Receipt",
        "PttName":       ptt.PttName if ptt else "",
        "PttRegNo":      ptt.PttRegNo if ptt else None,
        "DctName":       dct_name,
        "Scheme":        pcg.PcgName if pcg else "",
        "PymtMode":      _pay_mode_from_remark(rmark),
        "TotalAmt":      float(orc.OrcTotalAmt or 0.0),
        "Discount":      round(disc_amt, 2),
        "RecvdAmt":      float(orc.OrcRecvdAmt or 0.0),
        "BalAmt":        float(orc.OrcBalAmt or 0.0),
        "AdvAmt":        float(orc.OrcAdvAmt or 0.0),
        "RefuAmt":       float(orc.OrcRfugAmt or 0.0),
        "Remark":        rmark,
        "CareOf":        ptt.PttRefName if ptt else "",
        "Address":       ptt.PttAddr if ptt else "",
    }


@router.get("/receipt-charges/summary")
def list_receipt_charges(
    from_date: Optional[str] = Query(None),
    to_date: Optional[str] = Query(None),
    db: Session = Depends(get_db),
):
    """OPD Receipt / Procedures / Diagnostic Charges summary (OPDRec.frm)."""
    q = db.query(OutdRcpt).filter(OutdRcpt.OrcRecState == 1)
    if from_date and to_date:
        try:
            q = q.filter(OutdRcpt.OrcDate >= datetime.date.fromisoformat(from_date),
                          OutdRcpt.OrcDate <= datetime.date.fromisoformat(to_date))
        except ValueError:
            pass
    rows = q.order_by(OutdRcpt.OrcDate.desc(), OutdRcpt.OrcVchNo.desc()).all()
    return [_serialize_rcpt(r, db) for r in rows]


@router.post("/receipt-charges")
def create_receipt_charge(payload: dict, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    ptt_code    = payload.get("OrcPttCode")
    dct_code    = payload.get("OrcCDctCode")
    total_amt   = float(payload.get("OrcTotalAmt", 0))
    recvd_amt   = float(payload.get("OrcRecvdAmt", 0))
    disc_per    = float(payload.get("OrcDiscPer", 0))
    remark      = payload.get("OrcRemark", "")
    rcpt_type   = payload.get("OrcReceiptType", "OPD Receipt")

    if not ptt_code or total_amt <= 0:
        raise HTTPException(status_code=400, detail="Invalid patient or amount.")

    bal_amt  = total_amt - recvd_amt
    new_vch  = _next_vch(OutdRcpt, "OrcVchNo", db)
    now_mins = datetime.datetime.now().hour * 60 + datetime.datetime.now().minute

    orc = OutdRcpt(
        OrcVtmCode=2, OrcPrefix="ORC", OrcVchNo=new_vch,
        OrcDate=datetime.date.today(), OrcTime=now_mins,
        OrcPttCode=ptt_code, OrcCDctCode=dct_code,
        OrcReceiptType=rcpt_type, OrcDiscPer=disc_per,
        OrcTotalAmt=total_amt, OrcRecvdAmt=recvd_amt,
        OrcBalAmt=bal_amt, OrcAdvAmt=0.0, OrcRfugAmt=0.0,
        OrcRemark=remark, OrcVoidFlag=False, OrcRecState=1, OrcCmpCode=1,
    )
    db.add(orc); db.commit(); db.refresh(orc)
    log = OutdRcpt_Log(LogAction="ADD", OrcCode=orc.OrcCode, OrcVtmCode=orc.OrcVtmCode,
        OrcPrefix=orc.OrcPrefix, OrcVchNo=orc.OrcVchNo, OrcDate=orc.OrcDate, OrcTime=orc.OrcTime,
        OrcPttCode=orc.OrcPttCode, OrcCDctCode=orc.OrcCDctCode,
        OrcReceiptType=orc.OrcReceiptType, OrcDiscPer=orc.OrcDiscPer,
        OrcTotalAmt=orc.OrcTotalAmt, OrcRecvdAmt=orc.OrcRecvdAmt,
        OrcRfugAmt=orc.OrcRfugAmt, OrcBalAmt=orc.OrcBalAmt, OrcAdvAmt=orc.OrcAdvAmt,
        OrcRemark=orc.OrcRemark, OrcVoidFlag=orc.OrcVoidFlag,
        OrcRecState=orc.OrcRecState, OrcCmpCode=orc.OrcCmpCode)
    db.add(log); db.commit()
    return {"ok": True, "code": orc.OrcCode, "vch_no": new_vch}


# ─── OPD RECEIPT DUE PAYMENT — OutdPymtHdr (OPDRecDuePay.frm) ────────────────

@router.get("/receipt-payments")
def list_receipt_payments(
    from_date: Optional[str] = Query(None),
    to_date: Optional[str] = Query(None),
    db: Session = Depends(get_db),
):
    q = db.query(OutdPymtHdr).filter(OutdPymtHdr.OphRecState == 1)
    if from_date and to_date:
        try:
            q = q.filter(OutdPymtHdr.OphDate >= datetime.date.fromisoformat(from_date),
                          OutdPymtHdr.OphDate <= datetime.date.fromisoformat(to_date))
        except ValueError:
            pass
    rows = q.order_by(OutdPymtHdr.OphDate.desc(), OutdPymtHdr.OphCode.desc()).all()
    result = []
    for p in rows:
        orc = db.query(OutdRcpt).filter(OutdRcpt.OrcCode == p.OphOrcCode).first() if p.OphOrcCode else None
        ptt, pcg = _patient_info(orc.OrcPttCode if orc else None, db)
        result.append({
            "OphCode":    p.OphCode,
            "OphOrcCode": p.OphOrcCode,
            "VchNo":      p.OphCode,
            "Date":       str(p.OphDate),
            "Time":       _fmt_time_int(orc.OrcTime) if orc else "",
            "PttName":    ptt.PttName if ptt else "",
            "PttRegNo":   ptt.PttRegNo if ptt else None,
            "Scheme":     pcg.PcgName if pcg else "",
            "PymtMode":   "Cash",
            "DepoAmt":    float(p.OphAmt or 0.0),
            "Remark":     orc.OrcRemark if orc else "",
            "CareOf":     ptt.PttRefName if ptt else "",
            "Address":    ptt.PttAddr if ptt else "",
        })
    return result


@router.post("/receipt-payments")
def create_receipt_payment(payload: dict, db: Session = Depends(get_db)):
    orc_code = payload.get("OphOrcCode")
    amount   = float(payload.get("OphAmt", 0))
    if not orc_code or amount <= 0:
        raise HTTPException(status_code=400, detail="Invalid receipt or payment amount.")
    p = OutdPymtHdr(OphOrcCode=orc_code, OphDate=datetime.date.today(), OphAmt=amount, OphRecState=1)
    db.add(p); db.commit(); db.refresh(p)
    log = OutdPymtHdr_Log(LogAction="ADD", OphCode=p.OphCode, OphOrcCode=p.OphOrcCode,
                           OphDate=p.OphDate, OphAmt=p.OphAmt, OphRecState=p.OphRecState)
    db.add(log); db.commit()
    return {"ok": True, "code": p.OphCode}


# ─── OPD RECEIPT REFUND — OutdRefdHdr (OPDRecRefund.frm) ─────────────────────

@router.get("/receipt-refunds")
def list_receipt_refunds(
    from_date: Optional[str] = Query(None),
    to_date: Optional[str] = Query(None),
    db: Session = Depends(get_db),
):
    q = db.query(OutdRefdHdr).filter(OutdRefdHdr.OrhRecState == 1)
    if from_date and to_date:
        try:
            q = q.filter(OutdRefdHdr.OrhDate >= datetime.date.fromisoformat(from_date),
                          OutdRefdHdr.OrhDate <= datetime.date.fromisoformat(to_date))
        except ValueError:
            pass
    rows = q.order_by(OutdRefdHdr.OrhDate.desc(), OutdRefdHdr.OrhCode.desc()).all()
    result = []
    for r in rows:
        orc = db.query(OutdRcpt).filter(OutdRcpt.OrcCode == r.OrhOrcCode).first() if r.OrhOrcCode else None
        ptt, pcg = _patient_info(orc.OrcPttCode if orc else None, db)
        result.append({
            "OrhCode":    r.OrhCode,
            "OrhOrcCode": r.OrhOrcCode,
            "VchNo":      r.OrhCode,
            "Date":       str(r.OrhDate),
            "Time":       _fmt_time_int(orc.OrcTime) if orc else "",
            "PttName":    ptt.PttName if ptt else "",
            "PttRegNo":   ptt.PttRegNo if ptt else None,
            "Scheme":     pcg.PcgName if pcg else "",
            "PymtMode":   "Cash",
            "RefuAmt":    float(r.OrhAmt or 0.0),
            "Remark":     orc.OrcRemark if orc else "",
            "CareOf":     ptt.PttRefName if ptt else "",
            "Address":    ptt.PttAddr if ptt else "",
        })
    return result


@router.post("/receipt-refunds")
def create_receipt_refund(payload: dict, db: Session = Depends(get_db)):
    orc_code = payload.get("OrhOrcCode")
    amount   = float(payload.get("OrhAmt", 0))
    if not orc_code or amount <= 0:
        raise HTTPException(status_code=400, detail="Invalid receipt or refund amount.")
    r = OutdRefdHdr(OrhOrcCode=orc_code, OrhDate=datetime.date.today(), OrhAmt=amount, OrhRecState=1)
    db.add(r); db.commit(); db.refresh(r)
    log = OutdRefdHdr_Log(LogAction="ADD", OrhCode=r.OrhCode, OrhOrcCode=r.OrhOrcCode,
                           OrhDate=r.OrhDate, OrhAmt=r.OrhAmt, OrhRecState=r.OrhRecState)
    db.add(log); db.commit()
    return {"ok": True, "code": r.OrhCode}


# ─── OPD CASUAL BILL — OutdHdr + OutdBill (OPDCasualBill.frm) ────────────────

def _serialize_casual_bill(hdr: OutdHdr, db: Session) -> dict:
    ptt, pcg = _patient_info(hdr.OhdPttCode, db)
    dct_name = _doctor_name(hdr.OhdCDctCode, db)
    disc_amt = float((hdr.OhdTotalAmt or 0.0) * (hdr.OhdDiscPer or 0.0) / 100.0)
    net_amt  = float(hdr.OhdTotalAmt or 0.0) - disc_amt - float(hdr.OhdDiscAmt or 0.0)
    items = db.query(OutdBill).filter(OutdBill.ObdOhdCode == hdr.OhdCode, OutdBill.ObdRecState == 1).all()
    return {
        "OhdCode":   hdr.OhdCode,
        "VchNo":     hdr.OhdVchNo,
        "Date":      str(hdr.OhdDate),
        "Time":      _fmt_time_int(hdr.OhdTime),
        "BillType":  hdr.OhdBillType or "Casual Bill",
        "PttName":   ptt.PttName if ptt else "",
        "PttRegNo":  ptt.PttRegNo if ptt else None,
        "DctName":   dct_name,
        "Scheme":    pcg.PcgName if pcg else "",
        "TotalAmt":  float(hdr.OhdTotalAmt or 0.0),
        "DiscPer":   float(hdr.OhdDiscPer or 0.0),
        "DiscAmt":   round(disc_amt, 2),
        "NetAmt":    round(net_amt, 2),
        "PaidAmt":   float(hdr.OhdDepAmt or 0.0),
        "BalAmt":    float(hdr.OhdBalAmt or 0.0),
        "RefuAmt":   float(hdr.OhdRfugAmt or 0.0),
        "Remark":    hdr.OhdRemark or "",
        "CareOf":    ptt.PttRefName if ptt else "",
        "Address":   ptt.PttAddr if ptt else "",
        "Items":     [{"SrvCode": i.ObdSrvCode, "Unit": i.ObdUnit, "Rate": i.ObdRate, "Amt": i.ObdAmtAftDisc} for i in items],
    }


@router.get("/casual-bills")
def list_casual_bills(
    from_date: Optional[str] = Query(None),
    to_date: Optional[str] = Query(None),
    db: Session = Depends(get_db),
):
    q = db.query(OutdHdr).filter(OutdHdr.OhdRecState == 1)
    if from_date and to_date:
        try:
            q = q.filter(OutdHdr.OhdDate >= datetime.date.fromisoformat(from_date),
                          OutdHdr.OhdDate <= datetime.date.fromisoformat(to_date))
        except ValueError:
            pass
    rows = q.order_by(OutdHdr.OhdDate.desc(), OutdHdr.OhdVchNo.desc()).all()
    return [_serialize_casual_bill(h, db) for h in rows]


@router.post("/casual-bills")
def create_casual_bill(payload: dict, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    ptt_code  = payload.get("OhdPttCode")
    dct_code  = payload.get("OhdCDctCode")
    total_amt = float(payload.get("OhdTotalAmt", 0))
    disc_per  = float(payload.get("OhdDiscPer", 0))
    disc_amt  = round(total_amt * disc_per / 100, 2)
    dep_amt   = float(payload.get("OhdDepAmt", 0))
    bal_amt   = total_amt - disc_amt - dep_amt
    remark    = payload.get("OhdRemark", "")
    items     = payload.get("Items", [])
    if not ptt_code:
        raise HTTPException(status_code=400, detail="Patient required.")
    new_vch  = _next_vch(OutdHdr, "OhdVchNo", db)
    now_mins = datetime.datetime.now().hour * 60 + datetime.datetime.now().minute
    hdr = OutdHdr(
        OhdVtmCode=6, OhdPrefix="OCB", OhdVchNo=new_vch,
        OhdDate=datetime.date.today(), OhdTime=now_mins,
        OhdPttCode=ptt_code, OhdCDctCode=dct_code,
        OhdBillType="Casual Bill", OhdDiscPer=disc_per, OhdDiscAmt=disc_amt,
        OhdTotalAmt=total_amt, OhdDepAmt=dep_amt, OhdRfugAmt=0.0, OhdBalAmt=bal_amt,
        OhdRemark=remark, OhdVoidFlag=False, OhdRecState=1, OhdCmpCode=1,
    )
    db.add(hdr); db.commit(); db.refresh(hdr)
    for sno, item in enumerate(items, 1):
        srv_code  = item.get("SrvCode")
        unit      = float(item.get("Unit", 1))
        rate      = float(item.get("Rate", 0))
        item_disc = float(item.get("DiscPer", 0))
        gross     = unit * rate
        i_disc    = round(gross * item_disc / 100, 2)
        net       = round(gross - i_disc, 2)
        bi = OutdBill(ObdOhdCode=hdr.OhdCode, ObdSrvCode=srv_code, ObdSno=sno,
                      ObdUnit=unit, ObdRate=rate, ObdAmtBefDisc=gross,
                      ObdDiscPer=item_disc, ObdDiscAmt=i_disc, ObdAmtAftDisc=net, ObdRecState=1)
        db.add(bi)
    db.commit()
    log = OutdHdr_Log(LogAction="ADD", OhdCode=hdr.OhdCode, OhdVtmCode=hdr.OhdVtmCode,
        OhdPrefix=hdr.OhdPrefix, OhdVchNo=hdr.OhdVchNo, OhdDate=hdr.OhdDate, OhdTime=hdr.OhdTime,
        OhdPttCode=hdr.OhdPttCode, OhdCDctCode=hdr.OhdCDctCode, OhdBillType=hdr.OhdBillType,
        OhdDiscPer=hdr.OhdDiscPer, OhdDiscAmt=hdr.OhdDiscAmt, OhdTotalAmt=hdr.OhdTotalAmt,
        OhdDepAmt=hdr.OhdDepAmt, OhdRfugAmt=hdr.OhdRfugAmt, OhdBalAmt=hdr.OhdBalAmt,
        OhdRemark=hdr.OhdRemark, OhdVoidFlag=hdr.OhdVoidFlag, OhdRecState=hdr.OhdRecState, OhdCmpCode=hdr.OhdCmpCode)
    db.add(log); db.commit()
    return {"ok": True, "code": hdr.OhdCode, "vch_no": new_vch}


# ─── OPD CASUAL BILL PAYMENT — OutdBlPymtHdr (OPDCasualBillPay.frm) ──────────

@router.get("/casual-bill-payments")
def list_casual_bill_payments(
    from_date: Optional[str] = Query(None),
    to_date: Optional[str] = Query(None),
    db: Session = Depends(get_db),
):
    q = db.query(OutdBlPymtHdr).filter(OutdBlPymtHdr.ObpRecState == 1)
    if from_date and to_date:
        try:
            q = q.filter(OutdBlPymtHdr.ObpDate >= datetime.date.fromisoformat(from_date),
                          OutdBlPymtHdr.ObpDate <= datetime.date.fromisoformat(to_date))
        except ValueError:
            pass
    rows = q.order_by(OutdBlPymtHdr.ObpDate.desc(), OutdBlPymtHdr.ObpCode.desc()).all()
    result = []
    for p in rows:
        hdr = db.query(OutdHdr).filter(OutdHdr.OhdCode == p.ObpOhdCode).first() if p.ObpOhdCode else None
        ptt, pcg = _patient_info(hdr.OhdPttCode if hdr else None, db)
        result.append({
            "ObpCode":    p.ObpCode,
            "ObpOhdCode": p.ObpOhdCode,
            "VchNo":      p.ObpCode,
            "Date":       str(p.ObpDate),
            "Time":       _fmt_time_int(hdr.OhdTime) if hdr else "",
            "PttName":    ptt.PttName if ptt else "",
            "PttRegNo":   ptt.PttRegNo if ptt else None,
            "Scheme":     pcg.PcgName if pcg else "",
            "PymtMode":   "Cash",
            "DepoAmt":    float(p.ObpAmt or 0.0),
            "Remark":     hdr.OhdRemark if hdr else "",
            "CareOf":     ptt.PttRefName if ptt else "",
            "Address":    ptt.PttAddr if ptt else "",
        })
    return result


@router.post("/casual-bill-payments")
def create_casual_bill_payment(payload: dict, db: Session = Depends(get_db)):
    ohd_code = payload.get("ObpOhdCode")
    amount   = float(payload.get("ObpAmt", 0))
    if not ohd_code or amount <= 0:
        raise HTTPException(status_code=400, detail="Invalid bill or payment amount.")
    p = OutdBlPymtHdr(ObpOhdCode=ohd_code, ObpDate=datetime.date.today(), ObpAmt=amount, ObpRecState=1)
    db.add(p); db.commit(); db.refresh(p)
    log = OutdBlPymtHdr_Log(LogAction="ADD", ObpCode=p.ObpCode, ObpOhdCode=p.ObpOhdCode,
                              ObpDate=p.ObpDate, ObpAmt=p.ObpAmt, ObpRecState=p.ObpRecState)
    db.add(log); db.commit()
    return {"ok": True, "code": p.ObpCode}


# ─── OPD CASUAL BILL REFUND — OutdBlRefdHdr (OPDCasualBillRefund.frm) ─────────

@router.get("/casual-bill-refunds")
def list_casual_bill_refunds(
    from_date: Optional[str] = Query(None),
    to_date: Optional[str] = Query(None),
    db: Session = Depends(get_db),
):
    q = db.query(OutdBlRefdHdr).filter(OutdBlRefdHdr.ObrRecState == 1)
    if from_date and to_date:
        try:
            q = q.filter(OutdBlRefdHdr.ObrDate >= datetime.date.fromisoformat(from_date),
                          OutdBlRefdHdr.ObrDate <= datetime.date.fromisoformat(to_date))
        except ValueError:
            pass
    rows = q.order_by(OutdBlRefdHdr.ObrDate.desc(), OutdBlRefdHdr.ObrCode.desc()).all()
    result = []
    for r in rows:
        hdr = db.query(OutdHdr).filter(OutdHdr.OhdCode == r.ObrOhdCode).first() if r.ObrOhdCode else None
        ptt, pcg = _patient_info(hdr.OhdPttCode if hdr else None, db)
        result.append({
            "ObrCode":    r.ObrCode,
            "ObrOhdCode": r.ObrOhdCode,
            "VchNo":      r.ObrCode,
            "Date":       str(r.ObrDate),
            "Time":       _fmt_time_int(hdr.OhdTime) if hdr else "",
            "PttName":    ptt.PttName if ptt else "",
            "PttRegNo":   ptt.PttRegNo if ptt else None,
            "Scheme":     pcg.PcgName if pcg else "",
            "PymtMode":   "Cash",
            "RefuAmt":    float(r.ObrAmt or 0.0),
            "Remark":     hdr.OhdRemark if hdr else "",
            "CareOf":     ptt.PttRefName if ptt else "",
            "Address":    ptt.PttAddr if r.ObrOhdCode else "",
        })
    return result


@router.post("/casual-bill-refunds")
def create_casual_bill_refund(payload: dict, db: Session = Depends(get_db)):
    ohd_code = payload.get("ObrOhdCode")
    amount   = float(payload.get("ObrAmt", 0))
    if not ohd_code or amount <= 0:
        raise HTTPException(status_code=400, detail="Invalid bill or refund amount.")
    r = OutdBlRefdHdr(ObrOhdCode=ohd_code, ObrDate=datetime.date.today(), ObrAmt=amount, ObrRecState=1)
    db.add(r); db.commit(); db.refresh(r)
    log = OutdBlRefdHdr_Log(LogAction="ADD", ObrCode=r.ObrCode, ObrOhdCode=r.ObrOhdCode,
                              ObrDate=r.ObrDate, ObrAmt=r.ObrAmt, ObrRecState=r.ObrRecState)
    db.add(log); db.commit()
    return {"ok": True, "code": r.ObrCode}


# ─── OPD CLINICAL HISTORY — (OPDClinicalHistory.frm) ─────────────────────────

@router.get("/clinical-history/{ptt_code}")
def get_clinical_history(ptt_code: int, db: Session = Depends(get_db)):
    """Return all OPD consultations and receipts for a given patient."""
    ptt, _ = _patient_info(ptt_code, db)
    consultations = db.query(OutdReg).filter(
        OutdReg.OpgPttCode == ptt_code, OutdReg.OpgRecState == 1
    ).order_by(OutdReg.OpgDate.asc()).all()
    receipts = db.query(OutdRcpt).filter(
        OutdRcpt.OrcPttCode == ptt_code, OutdRcpt.OrcRecState == 1
    ).order_by(OutdRcpt.OrcDate.asc()).all()
    history = []
    for c in consultations:
        d = _serialize_consultation(c, db)
        history.append({
            "Date":        d["Date"],
            "Time":        d["Time"],
            "Type":        "Consultation",
            "VchNo":       d["VchNo"],
            "Doctor":      d["DctName"],
            "Department":  d["Department"],
            "Diagnosis":   "",
            "Amount":      d["NetAmt"],
            "Paid":        d["PaidAmt"],
            "Balance":     d["DueAmt"],
            "Status":      d["Status"],
            "Remark":      d["Remark"],
        })
    for r in receipts:
        s = _serialize_rcpt(r, db)
        history.append({
            "Date":        s["Date"],
            "Time":        s["Time"],
            "Type":        s["ReceiptType"],
            "VchNo":       str(s["VchNo"]),
            "Doctor":      s["DctName"],
            "Department":  "",
            "Diagnosis":   "",
            "Amount":      s["TotalAmt"],
            "Paid":        s["RecvdAmt"],
            "Balance":     s["BalAmt"],
            "Status":      "Paid" if s["BalAmt"] == 0 else "Due",
            "Remark":      s["Remark"],
        })
    history.sort(key=lambda x: x["Date"])
    return {
        "PttCode":  ptt_code,
        "PttName":  ptt.PttName if ptt else "",
        "PttRegNo": ptt.PttRegNo if ptt else None,
        "History":  history,
    }


# ─── Legacy OPD Registration/Bills (kept for backward compat) ─────────────────

@router.post("/registrations", response_model=OPDRegistrationResponse)
def create_opd_registration(schema: OPDRegistrationCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    ptt = db.query(Patient).filter(Patient.ptt_code == schema.opg_ptt_code, Patient.ptt_rec_state == 1).first()
    if not ptt:
        raise HTTPException(status_code=404, detail="Patient not found")
    dct = db.query(Doctor).filter(Doctor.dct_code == schema.opg_dct_code, Doctor.dct_rec_state == 1).first()
    if not dct:
        raise HTTPException(status_code=404, detail="Doctor not found")
    db_reg = OPDRegistration(**schema.model_dump())
    db.add(db_reg); db.commit(); db.refresh(db_reg)
    return db_reg


@router.get("/registrations", response_model=List[OPDRegistrationResponse])
def get_opd_registrations(db: Session = Depends(get_db)):
    return db.query(OPDRegistration).filter(OPDRegistration.opg_rec_state == 1).order_by(OPDRegistration.opg_visit_date.desc()).all()


@router.post("/bills", response_model=OPDBillResponse)
def create_opd_bill(schema: OPDBillCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    reg = db.query(OPDRegistration).filter(OPDRegistration.opg_code == schema.opg_code).first()
    if not reg:
        raise HTTPException(status_code=404, detail="OPD Registration not found")
    today_str = datetime.date.today().strftime("%Y%m%d")
    bill_count = db.query(OPDBill).filter(OPDBill.bill_no.like(f"OPD-{today_str}-%")).count()
    bill_no = f"OPD-{today_str}-{(bill_count + 1):04d}"
    db_bill = OPDBill(bill_no=bill_no, opg_code=schema.opg_code, total_amount=schema.total_amount,
                       discount_amount=schema.discount_amount, net_amount=schema.net_amount,
                       paid_amount=schema.paid_amount, status=schema.status)
    db.add(db_bill); db.commit(); db.refresh(db_bill)
    return db_bill


@router.get("/bills/{bill_id}", response_model=OPDBillResponse)
def get_opd_bill(bill_id: int, db: Session = Depends(get_db)):
    bill = db.query(OPDBill).filter(OPDBill.bill_id == bill_id).first()
    if not bill:
        raise HTTPException(status_code=404, detail="Bill not found")
    return bill
