from fastapi import APIRouter, Depends, HTTPException, Query
from fastapi.responses import StreamingResponse
from sqlalchemy.orm import Session
from sqlalchemy import text
from typing import List, Optional
import datetime
import io
import csv

from backend.database import get_db
from backend.models import IPDAdmission, IPDBill, Patient, Doctor, Bed
from backend.models.ipd import (
    IndrReg, IBedState, IndrRgPymt, IndrRgRefd, IndrBlHdr, IndrBlPymtHdr, IndrBlRefdHdr, IndrBill, IndrHdr, IndrBlIbsDtl, IndrBlIbsDtl_Log,
    IndrRgPymt_Log, IndrRgRefd_Log, IndrBlPymtHdr_Log, IndrBlRefdHdr_Log,
    IndrPymtHdr, IndrPymtDtl, IndrRefdHdr, IndrRefdDtl,
    IndrPymtHdr_Log, IndrPymtDtl_Log, IndrRefdHdr_Log, IndrRefdDtl_Log,
    IndrClinHis, IndrDischSum
)
from backend.models.masters import BedMast, PatMast, DoctMast, AreaMast, StsnMast, PatCatgMst, FloorMast, WardMast, RefByMast, ServGrpMst, ServMast, BedSrvMst
from backend.schemas import IPDAdmissionCreate, IPDAdmissionResponse, IPDBillCreate, IPDBillResponse
from backend.core.dependencies import get_current_active_user

router = APIRouter()

# ─────────────────────────────────────────────────────────────────────────────
# IpdBedSt.frm — BED STATUS QUERY SCREEN (exact VB6 SQL reproduction)
# ─────────────────────────────────────────────────────────────────────────────

# IBS_STATE_OCCUPIED constant from VB6 source
_IBS_OCCUPIED = 1


def _fmt_time(minutes: Optional[int]) -> str:
    """Convert stored integer minutes to HH:MM string."""
    if minutes is None or minutes <= 0:
        return ""
    return f"{minutes // 60:02d}:{minutes % 60:02d}"


@router.get("/bed-status")
def get_bed_status(
    pat_name:      Optional[str] = Query(None, description="Patient Name LIKE filter"),
    uhid:          Optional[str] = Query(None, description="UHID / Reg No exact match"),
    care_of:       Optional[str] = Query(None, description="Care Of LIKE filter"),
    area:          Optional[str] = Query(None, description="Area LIKE filter"),
    station:       Optional[str] = Query(None, description="Station LIKE filter"),
    ipd_no:        Optional[str] = Query(None, description="IPD No exact match"),
    bed_no:        Optional[str] = Query(None, description="Bed No LIKE filter"),
    floor:         Optional[str] = Query(None, description="Floor LIKE filter"),
    ward:          Optional[str] = Query(None, description="Ward LIKE filter"),
    admitted_only: bool = Query(False, description="Show only occupied beds"),
    db: Session = Depends(get_db),
):
    """
    Reproduce IpdBedSt.frm main query.

    Original VB6 SQL:
        SELECT * FROM ((BedMast
          INNER JOIN FloorMast ON BedMast.BdmFlrCode = FloorMast.FlrCode)
          INNER JOIN WardMast  ON BedMast.BdmWrdCode  = WardMast.WrdCode)
          LEFT JOIN (
            SELECT * FROM (SELECT * FROM IBedState WHERE IbsDischState = 1) AS IBedState
              INNER JOIN ((IndrReg
                INNER JOIN ((PatMast INNER JOIN AreaMast ...) INNER JOIN StsnMast ...) ...)
                INNER JOIN VTypMast ...)
              ON IBedState.IbsIpgCode = IndrReg.IpgCode
          ) AS IBedState ON BedMast.BdmCode = IBedState.IbsBdmCode
        WHERE BedMast.BdmShowInList = True
          [AND filters]
        ORDER BY BdmName
    """
    # Build dynamic WHERE clauses (mirrors VB6 IIf filter logic)
    where_parts = ["COALESCE(bm.\"BdmShowInList\", TRUE) = TRUE"]
    params: dict = {}

    if pat_name:
        where_parts.append("pm.\"PttName\" ILIKE :pat_name")
        params["pat_name"] = f"%{pat_name}%"
    if uhid:
        try:
            where_parts.append("pm.\"PttRegNo\" = :uhid")
            params["uhid"] = int(uhid)
        except ValueError:
            pass
    if care_of:
        where_parts.append("pm.\"PttRefName\" ILIKE :care_of")
        params["care_of"] = f"%{care_of}%"
    if area:
        where_parts.append("am.\"AraName\" ILIKE :area")
        params["area"] = f"%{area}%"
    if station:
        where_parts.append("sm.\"StnName\" ILIKE :station")
        params["station"] = f"%{station}%"
    if ipd_no:
        try:
            where_parts.append("ir.\"IpgVchNo\" = :ipd_no")
            params["ipd_no"] = int(ipd_no)
        except ValueError:
            pass
    if bed_no:
        where_parts.append("bm.\"BdmName\" ILIKE :bed_no")
        params["bed_no"] = f"%{bed_no}%"
    if floor:
        where_parts.append("fm.\"FlrName\" ILIKE :floor")
        params["floor"] = f"%{floor}%"
    if ward:
        where_parts.append("wm.\"WrdName\" ILIKE :ward")
        params["ward"] = f"%{ward}%"
    if admitted_only:
        where_parts.append("ir.\"IpgCode\" IS NOT NULL")

    where_sql = " AND ".join(where_parts)

    sql = f"""
        SELECT
            bm.bdm_code        AS "BdmCode",
            bm.bdm_name        AS "BdmName",
            f.flr_code         AS "FlrCode",
            f.flr_name         AS "FlrName",
            w.wrd_code         AS "WrdCode",
            w.wrd_name         AS "WrdName",
            ibs."IbsCode",
            ibs."IbsDischState",
            ibs."IbsDischDate",
            ibs."IbsDischTime",
            ir."IpgCode",
            ir."IpgVchNo",
            ir."IpgDate",
            ir."IpgTime",
            ir."IpgAdvAmt",
            ir."IpgRByCode",
            pm."PttCode",
            pm."PttName",
            pm."PttRegNo",
            pm."PttRefName",
            pm."PttAddr",
            pm."PttTelNo",
            am."AraName",
            sm."StnName"
        FROM beds bm
        LEFT JOIN wards  w ON bm.bdm_wrd_code = w.wrd_code
        LEFT JOIN floors f ON COALESCE(bm.bdm_flr_code, w.wrd_flr_code) = f.flr_code
        LEFT JOIN (
            SELECT ibs_inner.*
            FROM "IBedState" ibs_inner
            WHERE ibs_inner."IbsDischState" = {_IBS_OCCUPIED}
        ) ibs ON bm.bdm_code = ibs."IbsBdmCode"
        LEFT JOIN "IndrReg" ir ON ibs."IbsIpgCode" = ir."IpgCode"
            AND ir."IpgRecState" = 1
        LEFT JOIN "PatMast" pm ON ir."IpgPttCode" = pm."PttCode"
        LEFT JOIN "AreaMast" am ON pm."PttAraCode" = am."AraCode"
        LEFT JOIN "StsnMast" sm ON pm."PttStnCode" = sm."StnCode"
        WHERE COALESCE(bm.bdm_show_in_list, TRUE) = TRUE
          AND COALESCE(bm.bdm_rec_state, 1) != 0
        {("AND pm.\"PttName\" ILIKE :pat_name" if pat_name else "")}
        {("AND pm.\"PttRegNo\" = :uhid" if uhid else "")}
        {("AND pm.\"PttRefName\" ILIKE :care_of" if care_of else "")}
        {("AND am.\"AraName\" ILIKE :area" if area else "")}
        {("AND sm.\"StnName\" ILIKE :station" if station else "")}
        {("AND ir.\"IpgVchNo\" = :ipd_no" if ipd_no else "")}
        {("AND bm.bdm_name ILIKE :bed_no" if bed_no else "")}
        {("AND f.flr_name ILIKE :floor" if floor else "")}
        {("AND w.wrd_name ILIKE :ward" if ward else "")}
        {("AND ir.\"IpgCode\" IS NOT NULL" if admitted_only else "")}
        ORDER BY bm.bdm_name
    """

    rows = db.execute(text(sql), params).fetchall()

    result = []
    for r in rows:
        # Referral: look up doctor name from IpgRByCode
        ref_name = ""
        if r.IpgRByCode:
            try:
                rby = db.query(RefByMast).filter(RefByMast.RByCode == r.IpgRByCode).first()
                if rby:
                    ref_name = rby.RByName or ""
            except Exception:
                pass

        result.append({
            # Grid columns matching exactly IpdBedSt.frm columns
            "BdmCode":      r.BdmCode,
            "BdmName":      r.BdmName,       # Bed No
            "FlrCode":      r.FlrCode,
            "FlrName":      r.FlrName,
            "WrdCode":      r.WrdCode,
            "WrdName":      r.WrdName,        # Ward Name
            "IbsCode":      r.IbsCode,
            "IbsDischState":r.IbsDischState,
            # Admission data (None if bed is vacant)
            "IpgCode":      r.IpgCode,        # Used for row click / double click
            "IpgVchNo":     r.IpgVchNo,       # IPD No
            "IpgDate":      str(r.IpgDate) if r.IpgDate else None,     # DOA
            "IpgTime":      _fmt_time(r.IpgTime),                        # TOA
            "IpgAdvAmt":    r.IpgAdvAmt or 0.0,
            # Patient data (None if bed is vacant)
            "PttCode":      r.PttCode,
            "PttName":      r.PttName or "",  # Patient Name
            "PttRegNo":     r.PttRegNo,       # UHID
            "PttRefName":   r.PttRefName or "",  # Care Of
            "PttAddr":      r.PttAddr or "",  # Address
            "PttTelNo":     r.PttTelNo or "", # Contact No
            "AraName":      r.AraName or "",  # Area
            "StnName":      r.StnName or "",  # Station
            "Referral":     ref_name,         # Referral (RefByMast name)
            "IsOccupied":   r.IpgCode is not None,
        })

    return result


@router.get("/bed-status/{ipg_code}/detail")
def get_bed_status_detail(ipg_code: int, db: Session = Depends(get_db)):
    """
    Reproduce FillSmryList2() from IpdBedSt.frm.

    Returns:
    - header: Patient + Admission + Bed + Ward + Floor labels
    - transactions: UNION of all linked financial records (advances, receipts,
      payments, refunds, bills, bill payments, bill refunds, on-a/c payments,
      on-a/c refunds) ordered by date then voucher type
    """
    # ── Header query (mirrors FillSmryList2 main SELECT) ──────────────────────
    hdr_sql = """
        SELECT
            ir."IpgCode",
            ir."IpgVchNo",
            ir."IpgDate",
            ir."IpgTime",
            ir."IpgAdvAmt",
            ir."IpgDischDate",
            ir."IpgDischTime",
            pm."PttCode",
            pm."PttName",
            pm."PttRegNo",
            pm."PttRefName",
            pm."PttAddr",
            pm."PttTelNo",
            am."AraName",
            sm."StnName",
            bm.bdm_name       AS "BdmName",
            f.flr_name        AS "FlrName",
            w.wrd_name        AS "WrdName",
            ibs."IbsCode",
            ibs."IbsDischState",
            ibs."IbsDischDate"  AS IbsDischDate,
            ibs."IbsDischTime"  AS IbsDischTime
        FROM "IndrReg" ir
        INNER JOIN "PatMast" pm ON ir."IpgPttCode" = pm."PttCode"
        LEFT JOIN "AreaMast" am ON pm."PttAraCode" = am."AraCode"
        LEFT JOIN "StsnMast" sm ON pm."PttStnCode" = sm."StnCode"
        LEFT JOIN (
            SELECT * FROM "IBedState"
            WHERE "IbsIpgCode" = :ipg_code
            ORDER BY "IbsCode" DESC
            LIMIT 1
        ) ibs ON ir."IpgCode" = ibs."IbsIpgCode"
        LEFT JOIN beds    bm ON ibs."IbsBdmCode" = bm.bdm_code
        LEFT JOIN wards   w  ON bm.bdm_wrd_code  = w.wrd_code
        LEFT JOIN floors  f  ON COALESCE(bm.bdm_flr_code, w.wrd_flr_code) = f.flr_code
        WHERE ir."IpgCode" = :ipg_code
    """

    hdr_rows = db.execute(text(hdr_sql), {"ipg_code": ipg_code}).fetchall()
    if not hdr_rows:
        raise HTTPException(status_code=404, detail="Admission not found")

    h = hdr_rows[0]
    is_occupied = (h.IbsDischState == _IBS_OCCUPIED) if h.IbsCode else True

    header = {
        "IpgCode":       h.IpgCode,
        "IpgVchNo":      h.IpgVchNo,
        "IpgDate":       str(h.IpgDate) if h.IpgDate else "",
        "IpgTime":       _fmt_time(h.IpgTime),
        "IpgAdvAmt":     h.IpgAdvAmt or 0.0,
        "IpgDischDate":  str(h.IpgDischDate) if h.IpgDischDate else "",
        "IpgDischTime":  _fmt_time(h.IpgDischTime),
        "PttCode":       h.PttCode,
        "PttName":       h.PttName or "",
        "PttRegNo":      h.PttRegNo,
        "PttRefName":    h.PttRefName or "",
        "PttAddr":       h.PttAddr or "",
        "PttTelNo":      h.PttTelNo or "",
        "AraName":       h.AraName or "",
        "StnName":       h.StnName or "",
        "BdmName":       h.BdmName or "",
        "FlrName":       h.FlrName or "",
        "WrdName":       h.WrdName or "",
        "IbsCode":       h.IbsCode,
        "IbsDischDate":  str(h.IbsDischDate) if (h.IbsDischDate and not is_occupied) else "",
        "IbsDischTime":  _fmt_time(h.IbsDischTime) if (h.IbsDischTime and not is_occupied) else "",
        "IsOccupied":    is_occupied,
    }

    # ── Transactions UNION query (mirrors FillSmryList2 mQryStr build) ────────
    # Each branch: TrnCode, TrnDate, TrnVtmCode, TrnVchNo, TrnAmtAftDisc,
    #              TrnDiscAmt, TrnDrAmt, TrnCrAmt, TrnLabel
    trn_sql = f"""
        SELECT * FROM (

            -- 1. Advance from admission registration (IndrReg)
            SELECT
                ir."IpgCode"    AS TrnCode,
                ir."IpgDate"    AS TrnDate,
                ir."IpgVtmCode" AS TrnVtmCode,
                ir."IpgVchNo"   AS TrnVchNo,
                ir."IpgAdvAmt"  AS TrnAmtAftDisc,
                0               AS TrnDiscAmt,
                0               AS TrnDrAmt,
                ir."IpgAdvAmt"  AS TrnCrAmt,
                'Advance'       AS TrnLabel
            FROM "IndrReg" ir
            WHERE ir."IpgCode" = {ipg_code}
              AND ir."IpgAdvAmt" > 0

            UNION ALL

            -- 2. On-a/c deposit (IndrRgPymt)
            SELECT
                p."IgtCode",
                p."IgtDate",
                p."IgtVtmCode",
                p."IgtVchNo",
                p."IgtDpogAmt",
                0,
                0,
                p."IgtDpogAmt",
                'Deposit'
            FROM "IndrRgPymt" p
            WHERE p."IgtIpgCode" = {ipg_code}
              AND p."IgtRecState" = 1

            UNION ALL

            -- 3. On-a/c refund (IndrRgRefd)
            SELECT
                r."IgfCode",
                r."IgfDate",
                r."IgfVtmCode",
                r."IgfVchNo",
                r."IgfRfugAmt" * -1,
                0,
                r."IgfRfugAmt",
                0,
                'Deposit Refund'
            FROM "IndrRgRefd" r
            WHERE r."IgfIpgCode" = {ipg_code}
              AND r."IgfRecState" = 1

            UNION ALL

            -- 4. IPD Bill (IndrBlHdr — bill amount as debit)
            SELECT
                bh."IbhCode",
                bh."IbhDate",
                bh."IbhVtmCode",
                bh."IbhVchNo",
                bh."IbhTotalAmt",
                0,
                bh."IbhTotalAmt",
                0,
                'Bill'
            FROM "IndrBlHdr" bh
            WHERE bh."IbhIhdCode" = {ipg_code}
              AND bh."IbhRecState" = 1

            UNION ALL

            -- 5. IPD Bill Payment (IndrBlPymtHdr)
            SELECT
                bp."IbphCode",
                bp."IbphDate",
                bp."IbphVtmCode",
                bp."IbphVchNo",
                bp."IbphDepoAmt",
                0,
                0,
                bp."IbphDepoAmt",
                'Bill Payment'
            FROM "IndrBlPymtHdr" bp
            WHERE bp."IbphIpgCode" = {ipg_code}
              AND bp."IbphRecState" = 1

            UNION ALL

            -- 6. IPD Bill Refund (IndrBlRefdHdr)
            SELECT
                bf."IbfhCode",
                bf."IbfhDate",
                bf."IbfhVtmCode",
                bf."IbfhVchNo",
                bf."IbfhRefuAmt" * -1,
                0,
                bf."IbfhRefuAmt",
                0,
                'Bill Refund'
            FROM "IndrBlRefdHdr" bf
            WHERE bf."IbfhIpgCode" = {ipg_code}
              AND bf."IbfhRecState" = 1

        ) AS t
        ORDER BY TrnDate, TrnVtmCode, TrnCode
    """

    trn_rows = db.execute(text(trn_sql)).fetchall()

    transactions = []
    running_bal = 0.0
    for t in trn_rows:
        running_bal += (t.TrnDrAmt or 0.0) - (t.TrnCrAmt or 0.0)
        transactions.append({
            "TrnCode":      t.TrnCode,
            "TrnLabel":     t.TrnLabel,
            "TrnVchNo":     t.TrnVchNo,
            "TrnDate":      str(t.TrnDate) if t.TrnDate else "",
            "TrnAmtAftDisc":round(t.TrnAmtAftDisc or 0.0, 2),
            "TrnDrAmt":     round(t.TrnDrAmt or 0.0, 2),
            "TrnCrAmt":     round(t.TrnCrAmt or 0.0, 2),
            "TrnDiscAmt":   round(t.TrnDiscAmt or 0.0, 2),
            "TrnRunBal":    round(running_bal, 2),
        })

    return {"header": header, "transactions": transactions}

# ─────────────────────────────────────────────────────────────────────────────
# LEGACY / FLAT IPD ADMISSION ENDPOINTS (kept for backward compat)
# ─────────────────────────────────────────────────────────────────────────────

@router.post("/admissions", response_model=IPDAdmissionResponse)
def create_ipd_admission(schema: IPDAdmissionCreate, db: Session = Depends(get_db), current_user = Depends(get_current_active_user)):
    ptt = db.query(Patient).filter(Patient.ptt_code == schema.ipd_ptt_code, Patient.ptt_rec_state == 1).first()
    if not ptt:
        raise HTTPException(status_code=404, detail="Patient not found")
    dct = db.query(Doctor).filter(Doctor.dct_code == schema.ipd_dct_code, Doctor.dct_rec_state == 1).first()
    if not dct:
        raise HTTPException(status_code=404, detail="Doctor not found")
    bed = db.query(Bed).filter(Bed.bdm_code == schema.ipd_bdm_code, Bed.bdm_rec_state == 1).first()
    if not bed:
        raise HTTPException(status_code=404, detail="Bed not found")
    if bed.is_occupied:
        raise HTTPException(status_code=400, detail="Selected bed is already occupied")

    db_adm = IPDAdmission(**schema.model_dump())
    bed.is_occupied = True
    db.add(db_adm)
    db.commit()
    db.refresh(db_adm)
    return db_adm

@router.get("/admissions", response_model=List[IPDAdmissionResponse])
def get_ipd_admissions(db: Session = Depends(get_db)):
    return db.query(IPDAdmission).filter(IPDAdmission.ipd_rec_state == 1).order_by(IPDAdmission.ipd_admission_date.desc()).all()

@router.post("/discharge/{ipd_code}", response_model=IPDAdmissionResponse)
def discharge_patient(ipd_code: int, db: Session = Depends(get_db), current_user = Depends(get_current_active_user)):
    adm = db.query(IPDAdmission).filter(IPDAdmission.ipd_code == ipd_code, IPDAdmission.ipd_rec_state == 1).first()
    if not adm:
        raise HTTPException(status_code=404, detail="IPD Admission log not found")
    if adm.ipd_status == "discharged":
        raise HTTPException(status_code=400, detail="Patient is already discharged")
    adm.ipd_status = "discharged"
    adm.ipd_discharge_date = datetime.datetime.utcnow()
    bed = db.query(Bed).filter(Bed.bdm_code == adm.ipd_bdm_code).first()
    if bed:
        bed.is_occupied = False
    db.commit()
    db.refresh(adm)
    return adm

@router.post("/bills", response_model=IPDBillResponse)
def create_ipd_bill(schema: IPDBillCreate, db: Session = Depends(get_db), current_user = Depends(get_current_active_user)):
    adm = db.query(IPDAdmission).filter(IPDAdmission.ipd_code == schema.ipd_code).first()
    if not adm:
        raise HTTPException(status_code=404, detail="IPD Admission log not found")
    today_str = datetime.date.today().strftime("%Y%m%d")
    bill_count = db.query(IPDBill).filter(IPDBill.bill_no.like(f"IPD-{today_str}-%")).count()
    bill_no = f"IPD-{today_str}-{(bill_count + 1):04d}"
    db_bill = IPDBill(
        bill_no=bill_no, ipd_code=schema.ipd_code,
        room_charges=schema.room_charges, service_charges=schema.service_charges,
        total_amount=schema.total_amount, discount_amount=schema.discount_amount,
        net_amount=schema.net_amount, paid_amount=schema.paid_amount, status=schema.status
    )
    db.add(db_bill)
    db.commit()
    db.refresh(db_bill)
    return db_bill

@router.get("/bills/{bill_id}", response_model=IPDBillResponse)
def get_ipd_bill(bill_id: int, db: Session = Depends(get_db)):
    bill = db.query(IPDBill).filter(IPDBill.bill_id == bill_id).first()
    if not bill:
        raise HTTPException(status_code=404, detail="Bill not found")
    return bill

# ─────────────────────────────────────────────────────────────────────────────
# IndrHdr-STYLE ADMISSION REGISTRATION (IndrReg table — IhrCode schema)
# ─────────────────────────────────────────────────────────────────────────────

def _serialize_reg(reg: IndrReg, db: Session) -> dict:
    """Serialize an IndrReg row to a JSON-safe dict with joined names."""
    ptt = db.query(PatMast).filter(PatMast.PttCode == reg.IpgPttCode).first()
    dct = db.query(DoctMast).filter(DoctMast.DctCode == reg.IpgCDctCode).first()
    bed = db.query(BedMast).filter(BedMast.BdmCode == reg.IpgBdmCode).first()
    ara = db.query(AreaMast).filter(AreaMast.AraCode == ptt.PttAraCode).first() if (ptt and ptt.PttAraCode) else None
    stn = db.query(StsnMast).filter(StsnMast.StnCode == ptt.PttStnCode).first() if (ptt and ptt.PttStnCode) else None
    pcg = db.query(PatCatgMst).filter(PatCatgMst.PcgCode == ptt.PttPcgCode).first() if (ptt and ptt.PttPcgCode) else None

    # Calculate occupied days
    if reg.IpgDischDate and reg.IpgDate:
        days = (reg.IpgDischDate - reg.IpgDate).days
    elif reg.IpgDate:
        days = (datetime.date.today() - reg.IpgDate).days
    else:
        days = 0
    days = max(0, days)

    # Format times
    def fmt_time(m: Optional[int]) -> str:
        if m is None or m <= 0:
            return ""
        return f"{m // 60:02d}:{m % 60:02d}"

    return {
        "IhrCode":        reg.IpgCode,
        "IhrIpgCode":     reg.IpgCode,
        "IhrVtmCode":     reg.IpgVtmCode,
        "VtmName":        "IPD Admission" if reg.IpgVtmCode == 1 else "IPD Admission",
        "IhrPrefix":      reg.IpgPrefix,
        "IhrVchNo":       reg.IpgVchNo,
        "IhrPostfix":     reg.IpgPostfix,
        "IhrDate":        str(reg.IpgDate) if reg.IpgDate else None,
        "IhrTime":        reg.IpgTime,
        "IhrTimeStr":     fmt_time(reg.IpgTime),
        "IhrOldIhrCode":  reg.IpgOldIpgCode,
        "IhrPttCode":     reg.IpgPttCode,
        "PttName":        ptt.PttName if ptt else "",
        "PttRegNo":       ptt.PttRegNo if ptt else 0,
        "DctName":        f"{dct.DctTitle or ''} {dct.DctName}".strip() if dct else "",
        "BedName":        bed.BdmName if bed else "",
        "IhrPttDiscPer":  0.0,
        "IhrAmtBefDisc":  0.0,
        "IhrDiscAmt":     0.0,
        "IhrAmtAftDisc":  0.0,
        "IhrAdvAmt":      reg.IpgAdvAmt or 0.0,
        "IhrRecdAmt":     0.0,
        "IhrDepoAmt":     0.0,
        "IhrRefuAmt":     0.0,
        "IhrBalAmt":      0.0,
        "IhrRemark":      reg.IpgRemark,
        "IhrRecState":    reg.IpgRecState,
        "IhrCmpCode":     reg.IpgCmpCode,
        "IhrStatus":      "Discharged" if reg.IpgDischDate else "Admitted",
        "IpgDischDate":   str(reg.IpgDischDate) if reg.IpgDischDate else None,
        "IpgDischTime":   reg.IpgDischTime,
        "IhrDischTimeStr": fmt_time(reg.IpgDischTime),
        "IpgDischMode":   "Normal" if reg.IpgDischDate else "",
        "OccupDays":      days,
        "IhrClaimId":     "",
        "Scheme":         pcg.PcgName if pcg else "",
        "IhrAdmitFee":    reg.IpgAdvAmt or 0.0,
        "PttRefName":     ptt.PttRefName if ptt else "",
        "PttAddr":        ptt.PttAddr if ptt else "",
        "PttTelNo":       ptt.PttTelNo if ptt else "",
        "AraName":        ara.AraName if ara else "",
        "StnName":        stn.StnName if stn else "",
        "User1":          "Admin",
        "User2":          "",
        "PCount":         0,
        "IpgBdmCode":     reg.IpgBdmCode,
        "IpgCDctCode":    reg.IpgCDctCode,
        "IpgPDigCode":    reg.IpgPDigCode,
        "IpgFDigCode":    reg.IpgFDigCode,
    }


@router.get("/registrations")
def list_registrations(
    search: Optional[str] = Query(None),
    status: Optional[str] = Query(None),
    start_date: Optional[str] = Query(None),
    end_date: Optional[str] = Query(None),
    db: Session = Depends(get_db)
):
    """List all IPD registrations with optional search/status/date filter."""
    q = db.query(IndrReg).filter(IndrReg.IpgRecState == 1)
    if status == "admitted":
        q = q.filter(IndrReg.IpgDischDate == None)
    elif status == "discharged":
        q = q.filter(IndrReg.IpgDischDate != None)
    
    if start_date:
        try:
            sd = datetime.date.fromisoformat(start_date)
            q = q.filter(IndrReg.IpgDate >= sd)
        except ValueError:
            pass
    if end_date:
        try:
            ed = datetime.date.fromisoformat(end_date)
            q = q.filter(IndrReg.IpgDate <= ed)
        except ValueError:
            pass

    rows = q.order_by(IndrReg.IpgDate.desc()).all()

    result = []
    for reg in rows:
        d = _serialize_reg(reg, db)
        if search:
            s = search.lower()
            if not (s in (d["PttName"] or "").lower()
                    or s in str(d.get("PttRegNo", ""))
                    or s in str(d.get("IhrVchNo", ""))):
                continue
        result.append(d)
    return result


@router.get("/registrations/{ihr_code}")
def get_registration(ihr_code: int, db: Session = Depends(get_db)):
    reg = db.query(IndrReg).filter(IndrReg.IpgCode == ihr_code, IndrReg.IpgRecState == 1).first()
    if not reg:
        raise HTTPException(status_code=404, detail="Registration not found")
    return _serialize_reg(reg, db)


@router.post("/registrations")
def create_registration(data: dict, db: Session = Depends(get_db), current_user = Depends(get_current_active_user)):
    """Create a new IPD admission registration (IndrReg row)."""
    # Validate patient
    ptt = db.query(PatMast).filter(PatMast.PttCode == data.get("IhrPttCode")).first()
    if not ptt:
        raise HTTPException(status_code=404, detail="Patient not found")

    # Auto-number VchNo
    last = db.query(IndrReg).order_by(IndrReg.IpgVchNo.desc()).first()
    next_vch = (last.IpgVchNo + 1) if last and last.IpgVchNo else 1

    ipg_date = data.get("IhrDate")
    if isinstance(ipg_date, str):
        try:
            ipg_date = datetime.date.fromisoformat(ipg_date)
        except ValueError:
            ipg_date = datetime.date.today()
    elif not ipg_date:
        ipg_date = datetime.date.today()

    reg = IndrReg(
        IpgVtmCode    = data.get("IhrVtmCode", 1),
        IpgPrefix     = data.get("IhrPrefix", ""),
        IpgVchNo      = data.get("IhrVchNo") or next_vch,
        IpgPostfix    = data.get("IhrPostfix", ""),
        IpgDate       = ipg_date,
        IpgTime       = data.get("IhrTime", 0),
        IpgOldIpgCode = data.get("IhrOldIhrCode", 0),
        IpgPttCode    = data.get("IhrPttCode"),
        IpgCDctCode   = data.get("IpgCDctCode"),
        IpgBdmCode    = data.get("IpgBdmCode"),
        IpgPDigCode   = data.get("IpgPDigCode"),
        IpgFDigCode   = data.get("IpgFDigCode"),
        IpgAdvAmt     = data.get("IhrAdvAmt", 0.0),
        IpgRemark     = data.get("IhrRemark", ""),
        IpgRecState   = 1,
        IpgCmpCode    = data.get("IhrCmpCode", 1),
    )
    db.add(reg)

    # Mark bed occupied
    if reg.IpgBdmCode:
        bed = db.query(BedMast).filter(BedMast.BdmCode == reg.IpgBdmCode).first()
        if bed:
            bed.BdmStatus = "Occupied"

    db.commit()
    db.refresh(reg)

    # Automatically create the corresponding IndrHdr stay record to enable patient lookups
    wrd_code = None
    flr_code = None
    if reg.IpgBdmCode:
        bed = db.query(BedMast).filter(BedMast.BdmCode == reg.IpgBdmCode).first()
        if bed:
            wrd_code = bed.BdmWrdCode
            flr_code = bed.BdmFlrCode

    ihd = IndrHdr(
        IhdCode       = reg.IpgCode,
        IhdVtmCode    = reg.IpgVtmCode,
        IhdPrefix     = reg.IpgPrefix,
        IhdVchNo      = reg.IpgVchNo,
        IhdDate       = reg.IpgDate,
        IhdTime       = reg.IpgTime,
        IhdPttCode    = reg.IpgPttCode,
        IhdCDctCode   = reg.IpgCDctCode,
        IhdWrdCode    = wrd_code,
        IhdBedCode    = reg.IpgBdmCode,
        IhdFlrCode    = flr_code,
        IhdAdvAmt     = float(reg.IpgAdvAmt or 0.0),
        IhdStatus     = "Admitted",
        IhdRemark     = reg.IpgRemark or "",
        IhdRecState   = 1,
        IhdCmpCode    = reg.IpgCmpCode,
        IhdIpgCode    = reg.IpgCode
    )
    db.add(ihd)
    db.commit()

    # Save to IndrRgPymt if advance amount is > 0
    if reg.IpgAdvAmt and reg.IpgAdvAmt > 0:
        pymt = IndrRgPymt(
            IgtIpgCode    = reg.IpgCode,
            IgtVtmCode    = reg.IpgVtmCode,
            IgtPrefix     = reg.IpgPrefix,
            IgtVchNo      = reg.IpgVchNo,
            IgtPostfix    = reg.IpgPostfix,
            IgtDate       = reg.IpgDate,
            IgtTime       = reg.IpgTime,
            IgtOldIgtCode = 0,
            IgtPttCode    = reg.IpgPttCode,
            IgtDpogAmt    = reg.IpgAdvAmt,
            IgtAdjAmt     = 0.0,
            IgtBalAmt     = reg.IpgAdvAmt,
            IgtRemark     = "Advance received at Admission",
            IgtCmpCode    = reg.IpgCmpCode,
            IgtRecState   = 1,
        )
        db.add(pymt)
        db.commit()

    return _serialize_reg(reg, db)


@router.put("/registrations/{ihr_code}")
def update_registration(ihr_code: int, data: dict, db: Session = Depends(get_db), current_user = Depends(get_current_active_user)):
    """Edit an existing IPD admission registration."""
    reg = db.query(IndrReg).filter(IndrReg.IpgCode == ihr_code, IndrReg.IpgRecState == 1).first()
    if not reg:
        raise HTTPException(status_code=404, detail="Registration not found")

    old_bed = reg.IpgBdmCode

    ipg_date = data.get("IhrDate", reg.IpgDate)
    if isinstance(ipg_date, str):
        try:
            ipg_date = datetime.date.fromisoformat(ipg_date)
        except ValueError:
            pass

    reg.IpgVtmCode    = data.get("IhrVtmCode", reg.IpgVtmCode)
    reg.IpgPrefix     = data.get("IhrPrefix", reg.IpgPrefix)
    reg.IpgVchNo      = data.get("IhrVchNo", reg.IpgVchNo)
    reg.IpgPostfix    = data.get("IhrPostfix", reg.IpgPostfix)
    reg.IpgDate       = ipg_date
    reg.IpgTime       = data.get("IhrTime", reg.IpgTime)
    reg.IpgOldIpgCode = data.get("IhrOldIhrCode", reg.IpgOldIpgCode)
    reg.IpgPttCode    = data.get("IhrPttCode", reg.IpgPttCode)
    reg.IpgCDctCode   = data.get("IpgCDctCode", reg.IpgCDctCode)
    reg.IpgBdmCode    = data.get("IpgBdmCode", reg.IpgBdmCode)
    reg.IpgPDigCode   = data.get("IpgPDigCode", reg.IpgPDigCode)
    reg.IpgFDigCode   = data.get("IpgFDigCode", reg.IpgFDigCode)
    reg.IpgAdvAmt     = data.get("IhrAdvAmt", reg.IpgAdvAmt)
    reg.IpgRemark     = data.get("IhrRemark", reg.IpgRemark)

    # Handle bed change
    if old_bed and old_bed != reg.IpgBdmCode:
        old_b = db.query(BedMast).filter(BedMast.BdmCode == old_bed).first()
        if old_b:
            old_b.BdmStatus = "Available"
            
    if reg.IpgBdmCode:
        new_b = db.query(BedMast).filter(BedMast.BdmCode == reg.IpgBdmCode).first()
        if new_b:
            new_b.BdmStatus = "Occupied"

    db.commit()

    # Synchronize IndrHdr updates
    ihd = db.query(IndrHdr).filter(IndrHdr.IhdCode == reg.IpgCode).first()
    if ihd:
        wrd_code = None
        flr_code = None
        if reg.IpgBdmCode:
            bed = db.query(BedMast).filter(BedMast.BdmCode == reg.IpgBdmCode).first()
            if bed:
                wrd_code = bed.BdmWrdCode
                flr_code = bed.BdmFlrCode

        ihd.IhdVtmCode    = reg.IpgVtmCode
        ihd.IhdPrefix     = reg.IpgPrefix
        ihd.IhdVchNo      = reg.IpgVchNo
        ihd.IhdDate       = reg.IpgDate
        ihd.IhdTime       = reg.IpgTime
        ihd.IhdPttCode    = reg.IpgPttCode
        ihd.IhdCDctCode   = reg.IpgCDctCode
        ihd.IhdWrdCode    = wrd_code
        ihd.IhdBedCode    = reg.IpgBdmCode
        ihd.IhdFlrCode    = flr_code
        ihd.IhdAdvAmt     = float(reg.IpgAdvAmt or 0.0)
        ihd.IhdRemark     = reg.IpgRemark or ""
        db.commit()
    if reg.IpgBdmCode:
        new_b = db.query(BedMast).filter(BedMast.BdmCode == reg.IpgBdmCode).first()
        if new_b:
            new_b.BdmStatus = "Occupied"

    db.commit()
    db.refresh(reg)

    # Sync advance payment record
    pymt = db.query(IndrRgPymt).filter(IndrRgPymt.IgtIpgCode == reg.IpgCode, IndrRgPymt.IgtRecState == 1).first()
    if reg.IpgAdvAmt and reg.IpgAdvAmt > 0:
        if not pymt:
            pymt = IndrRgPymt(IgtIpgCode=reg.IpgCode)
            db.add(pymt)
        pymt.IgtVtmCode  = reg.IpgVtmCode
        pymt.IgtPrefix   = reg.IpgPrefix
        pymt.IgtVchNo    = reg.IpgVchNo
        pymt.IgtPostfix  = reg.IpgPostfix
        pymt.IgtDate     = reg.IpgDate
        pymt.IgtTime     = reg.IpgTime
        pymt.IgtPttCode  = reg.IpgPttCode
        pymt.IgtDpogAmt  = reg.IpgAdvAmt
        pymt.IgtBalAmt   = reg.IpgAdvAmt
        pymt.IgtRemark   = "Advance updated"
        pymt.IgtCmpCode  = reg.IpgCmpCode
        pymt.IgtRecState = 1
    else:
        if pymt:
            pymt.IgtRecState = 0
    
    db.commit()
    db.refresh(reg)
    return _serialize_reg(reg, db)


@router.delete("/registrations/{ihr_code}")
def delete_registration(ihr_code: int, db: Session = Depends(get_db), current_user = Depends(get_current_active_user)):
    """Soft-delete an IPD registration (set RecState=0)."""
    reg = db.query(IndrReg).filter(IndrReg.IpgCode == ihr_code, IndrReg.IpgRecState == 1).first()
    if not reg:
        raise HTTPException(status_code=404, detail="Registration not found")
    reg.IpgRecState = 0
    # Free bed
    if reg.IpgBdmCode and not reg.IpgDischDate:
        bed = db.query(BedMast).filter(BedMast.BdmCode == reg.IpgBdmCode).first()
        if bed:
            bed.BdmStatus = "Available"
            
    # Soft-delete linked advance payments
    db.query(IndrRgPymt).filter(IndrRgPymt.IgtIpgCode == ihr_code).update({"IgtRecState": 0})
    db.commit()
    return {"detail": "Registration deleted", "IhrCode": ihr_code}


@router.post("/registrations/{ihr_code}/discharge")
def discharge_registration(ihr_code: int, data: dict = {}, db: Session = Depends(get_db), current_user = Depends(get_current_active_user)):
    """Discharge a patient — set DischDate, free the bed."""
    reg = db.query(IndrReg).filter(IndrReg.IpgCode == ihr_code, IndrReg.IpgRecState == 1).first()
    if not reg:
        raise HTTPException(status_code=404, detail="Registration not found")
    if reg.IpgDischDate:
        raise HTTPException(status_code=400, detail="Patient already discharged")
    reg.IpgDischDate = data.get("disch_date") or datetime.date.today()
    reg.IpgDischTime = data.get("disch_time", 0)
    if reg.IpgBdmCode:
        bed = db.query(BedMast).filter(BedMast.BdmCode == reg.IpgBdmCode).first()
        if bed:
            bed.BdmStatus = "Available"
    db.commit()
    db.refresh(reg)
    return _serialize_reg(reg, db)


@router.post("/registrations/{ihr_code}/bedshift")
def bed_shift(ihr_code: int, data: dict, db: Session = Depends(get_db), current_user = Depends(get_current_active_user)):
    """Shift a patient from one bed to another."""
    reg = db.query(IndrReg).filter(IndrReg.IpgCode == ihr_code, IndrReg.IpgRecState == 1).first()
    if not reg:
        raise HTTPException(status_code=404, detail="Registration not found")

    new_bed_code = data.get("new_bed_code")
    if not new_bed_code:
        raise HTTPException(status_code=400, detail="new_bed_code is required")

    new_bed = db.query(BedMast).filter(BedMast.BdmCode == new_bed_code).first()
    if not new_bed:
        raise HTTPException(status_code=404, detail="New bed not found")
    if getattr(new_bed, "BdmStatus", None) == "Occupied":
        raise HTTPException(status_code=400, detail="New bed is already occupied")

    # Log bed shift in IBedState
    ibs = IBedState(
        IbsIpgCode    = reg.IpgCode,
        IbsDate       = datetime.date.today(),
        IbsBdmCode    = new_bed_code,
        IbsPttCode    = reg.IpgPttCode,
        IbsLIbsCode   = reg.IpgIbsCode or 0,
        IbsRemark     = data.get("remark", "Bed Shift"),
        IbsRecState   = 1,
        IbsCmpCode    = reg.IpgCmpCode,
    )
    db.add(ibs)

    # Free old bed
    if reg.IpgBdmCode:
        old_bed = db.query(BedMast).filter(BedMast.BdmCode == reg.IpgBdmCode).first()
        if old_bed:
            old_bed.BdmStatus = "Available"

    # Occupy new bed
    new_bed.BdmStatus = "Occupied"
    reg.IpgBdmCode = new_bed_code

    db.commit()
    db.flush()
    db.refresh(ibs)
    reg.IpgIbsCode = ibs.IbsCode
    db.commit()
    db.refresh(reg)
    return _serialize_reg(reg, db)


@router.get("/registrations/{ihr_code}/linked-trans")
def linked_transactions(ihr_code: int, db: Session = Depends(get_db)):
    """Return all linked transactions for an admission (advances, refunds, bills)."""
    reg = db.query(IndrReg).filter(IndrReg.IpgCode == ihr_code).first()
    if not reg:
        raise HTTPException(status_code=404, detail="Registration not found")

    advances = db.query(IndrRgPymt).filter(IndrRgPymt.IgtIpgCode == ihr_code, IndrRgPymt.IgtRecState == 1).all()
    refunds  = db.query(IndrRgRefd).filter(IndrRgRefd.IgfIpgCode == ihr_code, IndrRgRefd.IgfRecState == 1).all()
    bills    = db.query(IndrBlHdr).filter(IndrBlHdr.IbhIhdCode == ihr_code, IndrBlHdr.IbhRecState == 1).all()
    bed_logs = db.query(IBedState).filter(IBedState.IbsIpgCode == ihr_code, IBedState.IbsRecState == 1).order_by(IBedState.IbsDate).all()

    return {
        "IhrCode": ihr_code,
        "advances": [{"code": a.IgtCode, "date": str(a.IgtDate), "vch_no": a.IgtVchNo, "amount": a.IgtDpogAmt, "remark": a.IgtRemark} for a in advances],
        "refunds":  [{"code": r.IgfCode, "date": str(r.IgfDate), "vch_no": r.IgfVchNo, "amount": r.IgfRfugAmt, "remark": r.IgfRemark} for r in refunds],
        "bills":    [{"code": b.IbhCode, "date": str(b.IbhDate), "vch_no": b.IbhVchNo, "type": b.IbhBillType, "total": b.IbhTotalAmt, "balance": b.IbhBalAmt, "status": b.IbhStatus} for b in bills],
        "bed_logs": [{"code": s.IbsCode, "date": str(s.IbsDate), "bed_code": s.IbsBdmCode, "remark": s.IbsRemark} for s in bed_logs],
    }


@router.get("/registrations/{ihr_code}/discharge-history")
def get_discharge_history(ihr_code: int, db: Session = Depends(get_db)):
    reg = db.query(IndrReg).filter(IndrReg.IpgCode == ihr_code, IndrReg.IpgRecState == 1).first()
    if not reg:
        raise HTTPException(status_code=404, detail="Inpatient registration not found")
        
    ptt = db.query(PatMast).filter(PatMast.PttCode == reg.IpgPttCode).first()
    pcg = db.query(PatCatgMst).filter(PatCatgMst.PcgCode == ptt.PttPcgCode).first() if (ptt and ptt.PttPcgCode) else None
    dct = db.query(DoctMast).filter(DoctMast.DctCode == reg.IpgCDctCode).first() if reg.IpgCDctCode else None
    
    # 1. Fetch Bed History logs
    ibs_list = db.query(IBedState).filter(IBedState.IbsIpgCode == ihr_code, IBedState.IbsRecState == 1).order_by(IBedState.IbsCode).all()
    bed_history = []
    
    for idx, ibs in enumerate(ibs_list, 1):
        bed = db.query(BedMast).filter(BedMast.BdmCode == ibs.IbsBdmCode).first()
        wrd = db.query(WardMast).filter(WardMast.WrdCode == bed.BdmWrdCode).first() if (bed and bed.BdmWrdCode) else None
        
        # Next Bed resolution (if any)
        next_bed_name = ""
        if ibs.IbsLIbsCode:
            next_ibs = db.query(IBedState).filter(IBedState.IbsCode == ibs.IbsLIbsCode).first()
            if next_ibs:
                nb = db.query(BedMast).filter(BedMast.BdmCode == next_ibs.IbsBdmCode).first()
                if nb:
                    next_bed_name = nb.BdmName or ""
                    
        disch_status = "Occupied" if ibs.IbsDischState == 1 else "Shifted" if ibs.IbsDischState == 2 else "Discharged"
        
        # format minutes to HH:MM
        def format_min(m):
            if not m: return "00:00"
            hr = m // 60
            mn = m % 60
            return f"{hr:02d}:{mn:02d}"
            
        bed_history.append({
            "Sno":          idx,
            "BedName":      bed.BdmName if bed else "",
            "WardName":     wrd.WrdName if wrd else "",
            "FromDate":     str(ibs.IbsDate) if ibs.IbsDate else "",
            "FromTime":     format_min(ibs.IbsTime),
            "ToDate":       str(ibs.IbsDischDate) if ibs.IbsDischDate else "",
            "ToTime":       format_min(ibs.IbsDischTime) if ibs.IbsDischTime else "",
            "DischStatus":  disch_status,
            "NextBed":      next_bed_name,
            "Remark":       ibs.IbsRemark or ""
        })

    # 2. Build Transaction history ledger
    ledger_entries = []
    
    # 2.1 Indoor Reg Advance
    if reg.IpgAdvAmt:
        ledger_entries.append({
            "Date":         reg.IpgDate,
            "SysCode":      1,
            "Voucher":      "Admission Advance",
            "VchNo":        reg.IpgVchNo,
            "Code":         reg.IpgCode,
            "DrAmt":        0.0,
            "CrAmt":        float(reg.IpgAdvAmt),
            "AmtAftDisc":   float(reg.IpgAdvAmt),
            "DiscAmt":      0.0
        })
        
    # 2.2 Indoor Receipts (Diagnostics/Procedures charges)
    receipt_headers = db.query(IndrBlHdr).filter(
        IndrBlHdr.IbhIhdCode == ihr_code,
        IndrBlHdr.IbhBillType == "Indoor Charges",
        IndrBlHdr.IbhRecState == 1
    ).all()
    for rc in receipt_headers:
        ledger_entries.append({
            "Date":         rc.IbhDate,
            "SysCode":      2,
            "Voucher":      "Indoor Receipt",
            "VchNo":        rc.IbhVchNo,
            "Code":         rc.IbhCode,
            "DrAmt":        float(rc.IbhTotalAmt or 0.0),
            "CrAmt":        0.0,
            "AmtAftDisc":   float(rc.IbhTotalAmt or 0.0),
            "DiscAmt":      float((rc.IbhTotalAmt or 0.0) * (rc.IbhDiscPer or 0.0) / 100.0)
        })
        
    # 2.3 Indoor Payments (Receipt Due collections)
    pymts = db.query(IndrPymtHdr).filter(IndrPymtHdr.IphIpgCode == ihr_code, IndrPymtHdr.IphRecState == 1).all()
    for p in pymts:
        ledger_entries.append({
            "Date":         p.IphDate,
            "SysCode":      3,
            "Voucher":      "Receipt Payment",
            "VchNo":        p.IphVchNo,
            "Code":         p.IphCode,
            "DrAmt":        0.0,
            "CrAmt":        float(p.IphDepoAmt or 0.0),
            "AmtAftDisc":   float(p.IphDepoAmt or 0.0),
            "DiscAmt":      0.0
        })
        
    # 2.4 Indoor Refunds (Receipt Refund)
    rfds = db.query(IndrRefdHdr).filter(IndrRefdHdr.IfhIpgCode == ihr_code, IndrRefdHdr.IfhRecState == 1).all()
    for r in rfds:
        ledger_entries.append({
            "Date":         r.IfhDate,
            "SysCode":      4,
            "Voucher":      "Receipt Refund",
            "VchNo":        r.IfhVchNo,
            "Code":         r.IfhCode,
            "DrAmt":        float(r.IfhRefuAmt or 0.0),
            "CrAmt":        0.0,
            "AmtAftDisc":   -float(r.IfhRefuAmt or 0.0),
            "DiscAmt":      0.0
        })
        
    # 2.5 Indoor Bills (Indoor Daily Stays Charges or Final Bills)
    bills = db.query(IndrBlHdr).filter(
        IndrBlHdr.IbhIhdCode == ihr_code,
        IndrBlHdr.IbhBillType != "Indoor Charges",
        IndrBlHdr.IbhRecState == 1
    ).all()
    for b in bills:
        ledger_entries.append({
            "Date":         b.IbhDate,
            "SysCode":      5,
            "Voucher":      b.IbhBillType or "Indoor Bill",
            "VchNo":        b.IbhVchNo,
            "Code":         b.IbhCode,
            "DrAmt":        float(b.IbhTotalAmt or 0.0),
            "CrAmt":        0.0,
            "AmtAftDisc":   float(b.IbhTotalAmt or 0.0),
            "DiscAmt":      float((b.IbhTotalAmt or 0.0) * (b.IbhDiscPer or 0.0) / 100.0)
        })
        
    # 2.6 Indoor Bill Payments (Post-Bill settlement)
    bill_pymts = db.query(IndrBlPymtHdr).filter(IndrBlPymtHdr.IbphIpgCode == ihr_code, IndrBlPymtHdr.IbphRecState == 1).all()
    for bp in bill_pymts:
        ledger_entries.append({
            "Date":         bp.IbphDate,
            "SysCode":      6,
            "Voucher":      "Settlement Payment",
            "VchNo":        bp.IbphVchNo,
            "Code":         bp.IbphCode,
            "DrAmt":        0.0,
            "CrAmt":        float(bp.IbphDepoAmt or 0.0),
            "AmtAftDisc":   float(bp.IbphDepoAmt or 0.0),
            "DiscAmt":      0.0
        })
        
    # 2.7 Indoor Bill Refunds (Post-Bill refund)
    bill_rfds = db.query(IndrBlRefdHdr).filter(IndrBlRefdHdr.IbfhIpgCode == ihr_code, IndrBlRefdHdr.IbfhRecState == 1).all()
    for br in bill_rfds:
        ledger_entries.append({
            "Date":         br.IbfhDate,
            "SysCode":      7,
            "Voucher":      "Settlement Refund",
            "VchNo":        br.IbfhVchNo,
            "Code":         br.IbfhCode,
            "DrAmt":        float(br.IbfhRefuAmt or 0.0),
            "CrAmt":        0.0,
            "AmtAftDisc":   -float(br.IbfhRefuAmt or 0.0),
            "DiscAmt":      0.0
        })
        
    # 2.8 On A/C Pre-Deposits
    adv_pymts = db.query(IndrRgPymt).filter(IndrRgPymt.IgtIpgCode == ihr_code, IndrRgPymt.IgtRecState == 1).all()
    for ap in adv_pymts:
        ledger_entries.append({
            "Date":         ap.IgtDate,
            "SysCode":      8,
            "Voucher":      "On Account Deposit",
            "VchNo":        ap.IgtVchNo,
            "Code":         ap.IgtCode,
            "DrAmt":        0.0,
            "CrAmt":        float(ap.IgtDpogAmt or 0.0),
            "AmtAftDisc":   float(ap.IgtDpogAmt or 0.0),
            "DiscAmt":      0.0
        })
        
    # 2.9 On A/C Refunds
    adv_rfds = db.query(IndrRgRefd).filter(IndrRgRefd.IgfIpgCode == ihr_code, IndrRgRefd.IgfRecState == 1).all()
    for ar in adv_rfds:
        ledger_entries.append({
            "Date":         ar.IgfDate,
            "SysCode":      9,
            "Voucher":      "On Account Refund",
            "VchNo":        ar.IgfVchNo,
            "Code":         ar.IgfCode,
            "DrAmt":        float(ar.IgfRfugAmt or 0.0),
            "CrAmt":        0.0,
            "AmtAftDisc":   -float(ar.IgfRfugAmt or 0.0),
            "DiscAmt":      0.0
        })

    # Sort entries by Date, then SysCode
    ledger_entries.sort(key=lambda x: (x["Date"], x["SysCode"], x["Code"]))
    
    # Calculate running balance
    run_bal = 0.0
    trn_history = []
    for entry in ledger_entries:
        run_bal += entry["DrAmt"] - entry["CrAmt"]
        trn_history.append({
            "Date":         str(entry["Date"]),
            "Voucher":      entry["Voucher"],
            "VchNo":        entry["VchNo"],
            "DrAmt":        entry["DrAmt"],
            "CrAmt":        entry["CrAmt"],
            "BalAmt":       run_bal,
            "AmtAftDisc":   entry["AmtAftDisc"],
            "DiscAmt":      entry["DiscAmt"],
            "RefdDisc":     0.0,
            "CutOffAmt":    0.0,
            "WOffAmt":      0.0
        })

    # Determine status details
    current_bed = ""
    current_ward = ""
    current_floor = ""
    if reg.IpgBdmCode:
        curr_bed = db.query(BedMast).filter(BedMast.BdmCode == reg.IpgBdmCode).first()
        if curr_bed:
            current_bed = curr_bed.BdmName or ""
            curr_wrd = db.query(WardMast).filter(WardMast.WrdCode == curr_bed.BdmWrdCode).first()
            current_ward = curr_wrd.WrdName if curr_wrd else ""
            curr_flr = db.query(FloorMast).filter(FloorMast.FlrCode == curr_bed.BdmFlrCode).first()
            current_floor = curr_flr.FlrName if curr_flr else ""

    def format_min(m):
        if not m: return "00:00"
        hr = m // 60
        mn = m % 60
        return f"{hr:02d}:{mn:02d}"

    age_str = ""
    if ptt and ptt.PttDob:
        today = datetime.date.today()
        birth = ptt.PttDob
        age_years = today.year - birth.year - ((today.month, today.day) < (birth.month, birth.day))
        age_str = f"{age_years} Y"

    return {
        "Code":             reg.IpgCode,
        "IpdNo":            reg.IpgVchNo,
        "PatientName":      ptt.PttName if ptt else "",
        "AgeSex":           f"{ptt.PttSex or ''} / {age_str}".strip(" /") if ptt else "",
        "CareOf":           ptt.PttRefName if ptt else "",
        "Address":          ptt.PttAddr if ptt else "",
        "Area":             "", 
        "Station":          "", 
        "DOA":              str(reg.IpgDate),
        "TOA":              format_min(reg.IpgTime),
        "UHID":             ptt.PttRegNo if ptt else None,
        "BedNo":            current_bed,
        "Ward":             current_ward,
        "Floor":            current_floor,
        "DOD":              str(reg.IpgDischDate) if reg.IpgDischDate else "",
        "TOD":              format_min(reg.IpgDischTime) if reg.IpgDischTime else "",
        "bed_history":      bed_history,
        "trn_history":      trn_history
    }


@router.get("/registrations/export/csv")
def export_registrations_csv(
    status: Optional[str] = Query(None),
    db: Session = Depends(get_db)
):
    """Export all IPD registrations to a CSV file download."""
    q = db.query(IndrReg).filter(IndrReg.IpgRecState == 1)
    if status == "admitted":
        q = q.filter(IndrReg.IpgDischDate == None)
    elif status == "discharged":
        q = q.filter(IndrReg.IpgDischDate != None)
    rows = q.order_by(IndrReg.IpgDate.desc()).all()

    output = io.StringIO()
    writer = csv.writer(output)
    writer.writerow([
        "IhrCode", "VchNo", "AdmissionDate", "PatientName", "PatientRegNo",
        "DoctorName", "BedCode", "AdvanceAmount", "Remark",
        "Status", "DischargeDate", "CmpCode"
    ])
    for reg in rows:
        ptt = db.query(PatMast).filter(PatMast.PttCode == reg.IpgPttCode).first()
        dct = db.query(DoctMast).filter(DoctMast.DctCode == reg.IpgCDctCode).first()
        writer.writerow([
            reg.IpgCode,
            reg.IpgVchNo,
            reg.IpgDate,
            ptt.PttName if ptt else "",
            ptt.PttRegNo if ptt else "",
            f"{dct.DctTitle or ''} {dct.DctName}".strip() if dct else "",
            reg.IpgBdmCode or "",
            reg.IpgAdvAmt or 0.0,
            reg.IpgRemark or "",
            "Discharged" if reg.IpgDischDate else "Admitted",
            reg.IpgDischDate or "",
            reg.IpgCmpCode,
        ])

    output.seek(0)
    filename = f"ipd_admissions_{datetime.date.today().strftime('%Y%m%d')}.csv"
    return StreamingResponse(
        io.BytesIO(output.getvalue().encode("utf-8-sig")),
        media_type="text/csv",
        headers={"Content-Disposition": f"attachment; filename={filename}"}
    )


# ─────────────────────────────────────────────────────────────────────────────
# INDOOR CHARGES — IndrBlHdr / IndrBill  (Tasks 1–7)
# ─────────────────────────────────────────────────────────────────────────────

def _fmt_time_minutes(minutes: Optional[int]) -> str:
    if minutes is None or minutes <= 0:
        return ""
    return f"{minutes // 60:02d}:{minutes % 60:02d}"


def _serialize_charge_header(ibh: IndrBlHdr, db: Session) -> dict:
    """Serialize one IndrBlHdr row with all joined names for the summary grid."""
    # Admission header (IndrHdr) — contains IPD No (IhdVchNo) and doctor
    ihd = db.query(IndrHdr).filter(IndrHdr.IhdCode == ibh.IbhIhdCode).first()
    ptt = db.query(PatMast).filter(PatMast.PttCode == ibh.IbhPttCode).first()
    dct = None
    if ihd and ihd.IhdCDctCode:
        dct = db.query(DoctMast).filter(DoctMast.DctCode == ihd.IhdCDctCode).first()

    # Line items — aggregate amounts and pick first charge group
    lines = (
        db.query(IndrBill)
        .filter(IndrBill.IbdIbhCode == ibh.IbhCode, IndrBill.IbdRecState == 1)
        .all()
    )
    gross_amt   = sum(l.IbdAmtBefDisc or 0.0 for l in lines)
    disc_amt    = sum(l.IbdDiscAmt    or 0.0 for l in lines)
    net_amt     = sum(l.IbdAmtAftDisc or 0.0 for l in lines)

    # Charge group name from first line item
    charge_group = ""
    if lines:
        srv = db.query(ServMast).filter(ServMast.SrvCode == lines[0].IbdSrvCode).first()
        if srv and srv.SrvSgpCode:
            sgp = db.query(ServGrpMst).filter(ServGrpMst.SgpCode == srv.SrvSgpCode).first()
            if sgp:
                charge_group = sgp.SgpName

    now = datetime.date.today()
    return {
        "IbhCode":      ibh.IbhCode,
        "ChargeNo":     ibh.IbhVchNo,
        "Date":         str(ibh.IbhDate) if ibh.IbhDate else "",
        "Time":         _fmt_time_minutes(ibh.IbhDiscPer if False else None),  # IbhTime not on model; use 0
        "Voucher":      f"{ibh.IbhPrefix or ''}{ibh.IbhVchNo or ''}",
        "IpdNo":        ihd.IhdVchNo if ihd else None,
        "IhdCode":      ibh.IbhIhdCode,
        "PttName":      ptt.PttName if ptt else "",
        "PttRegNo":     ptt.PttRegNo if ptt else None,
        "DctName":      f"{dct.DctTitle or ''} {dct.DctName}".strip() if dct else "",
        "ChargeGroup":  charge_group,
        "GrossAmt":     round(gross_amt, 2),
        "DiscAmt":      round(disc_amt, 2),
        "NetAmt":       round(net_amt, 2),
        "Status":       ibh.IbhStatus or "Open",
        "BillType":     ibh.IbhBillType or "",
        "Remark":       ibh.IbhRemark or "",
        "IbhRecState":  ibh.IbhRecState,
    }


@router.get("/charges")
def list_charges(
    start_date: Optional[str] = Query(None),
    end_date:   Optional[str] = Query(None),
    search:     Optional[str] = Query(None),
    db: Session = Depends(get_db),
):
    """List all Indoor Charge headers (IndrBlHdr) with patient + amount summary."""
    q = db.query(IndrBlHdr).filter(IndrBlHdr.IbhRecState == 1)

    if start_date:
        try:
            sd = datetime.date.fromisoformat(start_date)
            q = q.filter(IndrBlHdr.IbhDate >= sd)
        except ValueError:
            pass
    if end_date:
        try:
            ed = datetime.date.fromisoformat(end_date)
            q = q.filter(IndrBlHdr.IbhDate <= ed)
        except ValueError:
            pass

    rows = q.order_by(IndrBlHdr.IbhDate.desc(), IndrBlHdr.IbhCode.desc()).all()

    result = []
    for ibh in rows:
        d = _serialize_charge_header(ibh, db)
        if search:
            s = search.lower()
            if not (
                s in (d["PttName"] or "").lower()
                or s in str(d.get("PttRegNo", ""))
                or s in str(d.get("ChargeNo", ""))
                or s in str(d.get("IpdNo", ""))
                or s in (d.get("DctName") or "").lower()
            ):
                continue
        result.append(d)
    return result


@router.get("/charges/{ibh_code}")
def get_charge(ibh_code: int, db: Session = Depends(get_db)):
    """Return one charge header + its line items."""
    ibh = db.query(IndrBlHdr).filter(
        IndrBlHdr.IbhCode == ibh_code, IndrBlHdr.IbhRecState == 1
    ).first()
    if not ibh:
        raise HTTPException(status_code=404, detail="Charge not found")

    hdr = _serialize_charge_header(ibh, db)
    lines_raw = (
        db.query(IndrBill)
        .filter(IndrBill.IbdIbhCode == ibh_code, IndrBill.IbdRecState == 1)
        .order_by(IndrBill.IbdSno)
        .all()
    )
    lines = []
    for ln in lines_raw:
        srv = db.query(ServMast).filter(ServMast.SrvCode == ln.IbdSrvCode).first() if ln.IbdSrvCode else None
        sgp = None
        if srv and srv.SrvSgpCode:
            sgp = db.query(ServGrpMst).filter(ServGrpMst.SgpCode == srv.SrvSgpCode).first()
        
        stay = db.query(IndrBlIbsDtl).filter(
            IndrBlIbsDtl.IbbsIblICode == ln.IbdCode,
            IndrBlIbsDtl.IbbsRecState == 1
        ).first()

        lines.append({
            "IbdCode":       ln.IbdCode,
            "IbdSno":        ln.IbdSno,
            "SrvCode":       ln.IbdSrvCode,
            "SrvName":       srv.SrvName if srv else "",
            "SgpCode":       srv.SrvSgpCode if srv else None,
            "SgpName":       sgp.SgpName if sgp else "",
            "Qty":           ln.IbdUnit or 1.0,
            "Rate":          ln.IbdRate or 0.0,
            "DiscPer":       ln.IbdDiscPer or 0.0,
            "DiscAmt":       ln.IbdDiscAmt or 0.0,
            "GrossAmt":      ln.IbdAmtBefDisc or 0.0,
            "NetAmt":        ln.IbdAmtAftDisc or 0.0,
            "Remark":        stay.IbbsRemark if stay else "",
            "IbsCode":       stay.IbbsIbsCode if stay else None,
            "IbbsFromDate":  str(stay.IbbsFromDate) if stay else "",
            "IbbsFromTime":  stay.IbbsFromTime if stay else 0,
            "IbbsToDate":    str(stay.IbbsToDate) if stay else "",
            "IbbsToTime":    stay.IbbsToTime if stay else 0,
        })
    return {"header": hdr, "lines": lines}


@router.get("/charges/patient-info/{ihd_code}")
def get_charge_patient_info(ihd_code: int, db: Session = Depends(get_db)):
    """Return patient + admission info for the charge entry form (Task 4)."""
    ihd = db.query(IndrHdr).filter(IndrHdr.IhdCode == ihd_code).first()
    if not ihd:
        raise HTTPException(status_code=404, detail="Admission not found")

    ptt = db.query(PatMast).filter(PatMast.PttCode == ihd.IhdPttCode).first()
    dct = db.query(DoctMast).filter(DoctMast.DctCode == ihd.IhdCDctCode).first() if ihd.IhdCDctCode else None
    bed = db.query(BedMast).filter(BedMast.BdmCode == ihd.IhdBedCode).first() if ihd.IhdBedCode else None
    wrd = db.query(WardMast).filter(WardMast.WrdCode == ihd.IhdWrdCode).first() if ihd.IhdWrdCode else None
    pcg = db.query(PatCatgMst).filter(PatCatgMst.PcgCode == ptt.PttPcgCode).first() if (ptt and ptt.PttPcgCode) else None

    # Compute age
    age_str = ""
    if ptt and ptt.PttDob:
        today = datetime.date.today()
        years = today.year - ptt.PttDob.year - (
            (today.month, today.day) < (ptt.PttDob.month, ptt.PttDob.day)
        )
        age_str = f"{years} Yrs"

    return {
        "IhdCode":    ihd.IhdCode,
        "IhdVchNo":   ihd.IhdVchNo,
        "PttCode":    ptt.PttCode if ptt else None,
        "PttName":    ptt.PttName if ptt else "",
        "PttRegNo":   ptt.PttRegNo if ptt else None,
        "PttSex":     ptt.PttSex if ptt else "",
        "PttDob":     str(ptt.PttDob) if (ptt and ptt.PttDob) else "",
        "Age":        age_str,
        "DctCode":    dct.DctCode if dct else None,
        "DctName":    f"{dct.DctTitle or ''} {dct.DctName}".strip() if dct else "",
        "BedName":    bed.BdmName if bed else "",
        "WrdName":    wrd.WrdName if wrd else "",
        "PcgCode":    pcg.PcgCode if pcg else None,
        "PcgName":    pcg.PcgName if pcg else "",
        "Scheme":     pcg.PcgType if pcg else "",
    }


@router.post("/charges")
def create_charge(data: dict, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    """
    Create one IndrBlHdr + N IndrBill rows.
    """
    # Resolve admission
    ihd_code = data.get("IbhIhdCode")
    if not ihd_code:
        raise HTTPException(status_code=400, detail="IbhIhdCode is required")
    ihd = db.query(IndrHdr).filter(IndrHdr.IhdCode == ihd_code).first()
    if not ihd:
        raise HTTPException(status_code=404, detail="Admission (IndrHdr) not found")

    ptt_code = data.get("IbhPttCode") or ihd.IhdPttCode

    # Auto-increment VchNo for IndrBlHdr
    last = db.query(IndrBlHdr).order_by(IndrBlHdr.IbhVchNo.desc()).first()
    next_vch = (last.IbhVchNo + 1) if (last and last.IbhVchNo) else 1

    charge_date = data.get("IbhDate")
    if isinstance(charge_date, str):
        try:
            charge_date = datetime.date.fromisoformat(charge_date)
        except ValueError:
            charge_date = datetime.date.today()
    else:
        charge_date = datetime.date.today()

    lines_data = data.get("lines", [])

    # Compute totals from lines
    total_gross = 0.0
    total_disc  = 0.0
    total_net   = 0.0
    for ln in lines_data:
        qty  = float(ln.get("Qty", 1))
        rate = float(ln.get("Rate", 0))
        disc_per = float(ln.get("DiscPer", 0))
        gross = qty * rate
        disc  = round(gross * disc_per / 100, 4)
        net   = round(gross - disc, 4)
        total_gross += gross
        total_disc  += disc
        total_net   += net

    # Support final billing adjust calculations
    bill_type = data.get("IbhBillType", "Indoor Charges")
    dep_amt   = float(data.get("IbhDepAmt", 0.0))
    rfug_amt  = float(data.get("IbhRfugAmt", 0.0))
    bal_amt   = float(data.get("IbhBalAmt", total_net - dep_amt + rfug_amt))

    ibh = IndrBlHdr(
        IbhVtmCode  = data.get("IbhVtmCode", 1),
        IbhPrefix   = data.get("IbhPrefix", ""),
        IbhVchNo    = next_vch,
        IbhDate     = charge_date,
        IbhIhdCode  = ihd_code,
        IbhPttCode  = ptt_code,
        IbhBillType = bill_type,
        IbhDiscPer  = data.get("IbhDiscPer", 0.0),
        IbhTotalAmt = round(total_gross, 2),
        IbhDepAmt   = round(dep_amt, 2),
        IbhRfugAmt  = round(rfug_amt, 2),
        IbhBalAmt   = round(bal_amt, 2),
        IbhStatus   = data.get("IbhStatus", "Open"),
        IbhRemark   = data.get("IbhRemark", ""),
        IbhVoidFlag = False,
        IbhRecState = 1,
        IbhCmpCode  = data.get("IbhCmpCode", 1),
    )
    db.add(ibh)
    db.flush()  # get IbhCode

    # Insert line items
    for sno, ln in enumerate(lines_data, start=1):
        qty      = float(ln.get("Qty", 1))
        rate     = float(ln.get("Rate", 0))
        disc_per = float(ln.get("DiscPer", 0))
        gross    = round(qty * rate, 4)
        disc     = round(gross * disc_per / 100, 4)
        net      = round(gross - disc, 4)

        ibd = IndrBill(
            IbdIbhCode     = ibh.IbhCode,
            IbdSrvCode     = ln.get("SrvCode"),
            IbdSno         = sno,
            IbdUnit        = qty,
            IbdRate        = rate,
            IbdAmtBefDisc  = gross,
            IbdDiscPer     = disc_per,
            IbdDiscAmt     = disc,
            IbdAmtAftDisc  = net,
            IbdRecState    = 1,
        )
        db.add(ibd)
        db.flush()  # get IbdCode

        # If it has bed stay segment details, log it in IndrBlIbsDtl
        ibs_code = ln.get("IbsCode")
        if ibs_code:
            try:
                ibbs = IndrBlIbsDtl(
                    IbbsCode     = ibh.IbhCode,
                    IbbsIblICode = ibd.IbdCode,
                    IbbsIpgCode  = ihd_code,
                    IbbsIbsCode  = int(ibs_code),
                    IbbsSno      = sno,
                    IbbsFromDate = datetime.date.fromisoformat(ln.get("IbbsFromDate")),
                    IbbsFromTime = int(ln.get("IbbsFromTime", 0)),
                    IbbsToDate   = datetime.date.fromisoformat(ln.get("IbbsToDate")),
                    IbbsToTime   = int(ln.get("IbbsToTime", 0)),
                    IbbsUnit     = int(qty),
                    IbbsRemark   = ln.get("Remark", ""),
                    IbbsRecState = 1,
                    IbbsCmpCode  = ibh.IbhCmpCode,
                )
                db.add(ibbs)
            except Exception:
                pass

    # Discharge patient logic
    if data.get("discharge_patient"):
        disch_date_str = data.get("discharge_date")
        disch_time_str = data.get("discharge_time", "12:00")
        
        def time_to_min(t_str: str) -> int:
            try:
                parts = t_str.split(":")
                return int(parts[0]) * 60 + int(parts[1])
            except Exception:
                return 720
        
        disch_date = datetime.date.fromisoformat(disch_date_str) if disch_date_str else datetime.date.today()
        disch_time = time_to_min(disch_time_str)

        # 1. Update IndrReg
        reg = db.query(IndrReg).filter(IndrReg.IpgCode == ihd_code).first()
        if reg:
            reg.IpgDischDate = disch_date
            reg.IpgDischTime = disch_time
            if reg.IpgBdmCode:
                bed = db.query(BedMast).filter(BedMast.BdmCode == reg.IpgBdmCode).first()
                if bed:
                    bed.BdmStatus = "Available"
        
        # 2. Update IndrHdr
        ihd.IhdDischDate = disch_date
        ihd.IhdDischTime = disch_time
        ihd.IhdStatus = "Discharged"
        if ihd.IhdBedCode:
            bed = db.query(BedMast).filter(BedMast.BdmCode == ihd.IhdBedCode).first()
            if bed:
                bed.BdmStatus = "Available"

        # 3. Update IBedState
        last_ibs = db.query(IBedState).filter(
            IBedState.IbsIpgCode == ihd_code,
            IBedState.IbsRecState == 1
        ).order_by(IBedState.IbsCode.desc()).first()
        if last_ibs:
            last_ibs.IbsDischDate = disch_date
            last_ibs.IbsDischTime = disch_time
            last_ibs.IbsDischState = 3  # Discharged

    db.commit()
    db.refresh(ibh)
    return _serialize_charge_header(ibh, db)


@router.put("/charges/{ibh_code}")
def update_charge(ibh_code: int, data: dict, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    """Update charge header and replace all its line items."""
    ibh = db.query(IndrBlHdr).filter(IndrBlHdr.IbhCode == ibh_code, IndrBlHdr.IbhRecState == 1).first()
    if not ibh:
        raise HTTPException(status_code=404, detail="Charge not found")

    charge_date = data.get("IbhDate", ibh.IbhDate)
    if isinstance(charge_date, str):
        try:
            charge_date = datetime.date.fromisoformat(charge_date)
        except ValueError:
            charge_date = ibh.IbhDate

    lines_data = data.get("lines", [])

    # Soft-delete old lines and stay links
    db.query(IndrBill).filter(IndrBill.IbdIbhCode == ibh_code).update({"IbdRecState": 0})
    db.query(IndrBlIbsDtl).filter(IndrBlIbsDtl.IbbsCode == ibh_code).update({"IbbsRecState": 0})

    # Recompute totals
    total_gross = total_disc = total_net = 0.0
    for sno, ln in enumerate(lines_data, start=1):
        qty      = float(ln.get("Qty", 1))
        rate     = float(ln.get("Rate", 0))
        disc_per = float(ln.get("DiscPer", 0))
        gross    = round(qty * rate, 4)
        disc     = round(gross * disc_per / 100, 4)
        net      = round(gross - disc, 4)
        total_gross += gross
        total_disc  += disc
        total_net   += net

        ibd = IndrBill(
            IbdIbhCode     = ibh_code,
            IbdSrvCode     = ln.get("SrvCode"),
            IbdSno         = sno,
            IbdUnit        = qty,
            IbdRate        = rate,
            IbdAmtBefDisc  = gross,
            IbdDiscPer     = disc_per,
            IbdDiscAmt     = disc,
            IbdAmtAftDisc  = net,
            IbdRecState    = 1,
        )
        db.add(ibd)
        db.flush()

        # If it has bed stay segment details, log it in IndrBlIbsDtl
        ibs_code = ln.get("IbsCode")
        if ibs_code:
            try:
                ibbs = IndrBlIbsDtl(
                    IbbsCode     = ibh_code,
                    IbbsIblICode = ibd.IbdCode,
                    IbbsIpgCode  = ibh.IbhIhdCode,
                    IbbsIbsCode  = int(ibs_code),
                    IbbsSno      = sno,
                    IbbsFromDate = datetime.date.fromisoformat(ln.get("IbbsFromDate")),
                    IbbsFromTime = int(ln.get("IbbsFromTime", 0)),
                    IbbsToDate   = datetime.date.fromisoformat(ln.get("IbbsToDate")),
                    IbbsToTime   = int(ln.get("IbbsToTime", 0)),
                    IbbsUnit     = int(qty),
                    IbbsRemark   = ln.get("Remark", ""),
                    IbbsRecState = 1,
                    IbbsCmpCode  = ibh.IbhCmpCode,
                )
                db.add(ibbs)
            except Exception:
                pass

    dep_amt = float(data.get("IbhDepAmt", ibh.IbhDepAmt or 0.0))
    rfug_amt = float(data.get("IbhRfugAmt", ibh.IbhRfugAmt or 0.0))
    bal_amt = float(data.get("IbhBalAmt", total_net - dep_amt + rfug_amt))

    ibh.IbhDate     = charge_date
    ibh.IbhBillType = data.get("IbhBillType", ibh.IbhBillType)
    ibh.IbhDiscPer  = data.get("IbhDiscPer", ibh.IbhDiscPer)
    ibh.IbhTotalAmt = round(total_gross, 2)
    ibh.IbhDepAmt   = round(dep_amt, 2)
    ibh.IbhRfugAmt  = round(rfug_amt, 2)
    ibh.IbhBalAmt   = round(bal_amt, 2)
    ibh.IbhRemark   = data.get("IbhRemark", ibh.IbhRemark)
    ibh.IbhStatus   = data.get("IbhStatus", ibh.IbhStatus)

    # Discharge patient logic (if toggle is updated on edit)
    if data.get("discharge_patient"):
        disch_date_str = data.get("discharge_date")
        disch_time_str = data.get("discharge_time", "12:00")
        
        def time_to_min(t_str: str) -> int:
            try:
                parts = t_str.split(":")
                return int(parts[0]) * 60 + int(parts[1])
            except Exception:
                return 720
        
        disch_date = datetime.date.fromisoformat(disch_date_str) if disch_date_str else datetime.date.today()
        disch_time = time_to_min(disch_time_str)

        # 1. Update IndrReg
        reg = db.query(IndrReg).filter(IndrReg.IpgCode == ibh.IbhIhdCode).first()
        if reg:
            reg.IpgDischDate = disch_date
            reg.IpgDischTime = disch_time
            if reg.IpgBdmCode:
                bed = db.query(BedMast).filter(BedMast.BdmCode == reg.IpgBdmCode).first()
                if bed:
                    bed.BdmStatus = "Available"
        
        # 2. Update IndrHdr
        ihd = db.query(IndrHdr).filter(IndrHdr.IhdCode == ibh.IbhIhdCode).first()
        if ihd:
            ihd.IhdDischDate = disch_date
            ihd.IhdDischTime = disch_time
            ihd.IhdStatus = "Discharged"
            if ihd.IhdBedCode:
                bed = db.query(BedMast).filter(BedMast.BdmCode == ihd.IhdBedCode).first()
                if bed:
                    bed.BdmStatus = "Available"

        # 3. Update IBedState
        last_ibs = db.query(IBedState).filter(
            IBedState.IbsIpgCode == ibh.IbhIhdCode,
            IBedState.IbsRecState == 1
        ).order_by(IBedState.IbsCode.desc()).first()
        if last_ibs:
            last_ibs.IbsDischDate = disch_date
            last_ibs.IbsDischTime = disch_time
            last_ibs.IbsDischState = 3

    db.commit()
    db.refresh(ibh)
    return _serialize_charge_header(ibh, db)


@router.delete("/charges/{ibh_code}")
def delete_charge(ibh_code: int, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    """Soft-delete a charge header and its line items."""
    ibh = db.query(IndrBlHdr).filter(IndrBlHdr.IbhCode == ibh_code, IndrBlHdr.IbhRecState == 1).first()
    if not ibh:
        raise HTTPException(status_code=404, detail="Charge not found")
    ibh.IbhRecState = 0
    db.query(IndrBill).filter(IndrBill.IbdIbhCode == ibh_code).update({"IbdRecState": 0})
    db.commit()
    return {"detail": "Charge deleted", "IbhCode": ibh_code}


# ─────────────────────────────────────────────────────────────────────────────
# Supporting dropdown lookups for the charge entry form
# ─────────────────────────────────────────────────────────────────────────────

@router.get("/charge-groups")
def list_charge_groups(db: Session = Depends(get_db)):
    """Return all active service groups (= charge groups) for dropdown."""
    rows = (
        db.query(ServGrpMst)
        .filter(ServGrpMst.SgpRecState == 1, ServGrpMst.SgpShowInList == True)
        .order_by(ServGrpMst.SgpIndex, ServGrpMst.SgpName)
        .all()
    )
    return [{"SgpCode": r.SgpCode, "SgpName": r.SgpName} for r in rows]


@router.get("/charges/summary")
def get_charges_summary(
    from_date: str = Query(..., description="From date YYYY-MM-DD"),
    to_date: str = Query(..., description="To date YYYY-MM-DD"),
    db: Session = Depends(get_db)
):
    try:
        f_dt = datetime.date.fromisoformat(from_date)
        t_dt = datetime.date.fromisoformat(to_date)
    except ValueError:
        raise HTTPException(status_code=400, detail="Invalid date format. Use YYYY-MM-DD.")

    headers = db.query(IndrBlHdr).filter(
        IndrBlHdr.IbhRecState == 1,
        IndrBlHdr.IbhBillType == "Indoor Charges",
        IndrBlHdr.IbhDate >= f_dt,
        IndrBlHdr.IbhDate <= t_dt
    ).order_by(IndrBlHdr.IbhDate.desc(), IndrBlHdr.IbhVchNo.desc()).all()

    result = []
    for h in headers:
        ptt = db.query(PatMast).filter(PatMast.PttCode == h.IbhPttCode).first()
        pcg = db.query(PatCatgMst).filter(PatCatgMst.PcgCode == ptt.PttPcgCode).first() if (ptt and ptt.PttPcgCode) else None
        
        # Payment mode parsing
        pay_mode = "Cash"
        remark = h.IbhRemark or ""
        if "UPI" in remark:
            pay_mode = "UPI"
        elif "Card" in remark:
            pay_mode = "Card"
            
        discount_amt = float((h.IbhTotalAmt or 0.0) * (h.IbhDiscPer or 0.0) / 100.0)
        result.append({
            "IbhCode":      h.IbhCode,
            "Date":         str(h.IbhDate),
            "Voucher":      "Indoor Receipt",
            "VchNo":        h.IbhVchNo,
            "PatientName":  ptt.PttName if ptt else "",
            "UHID":         ptt.PttRegNo if ptt else None,
            "Scheme":       pcg.PcgName if pcg else "",
            "PymtMode":     pay_mode,
            "Charges":      float(h.IbhTotalAmt or 0.0),
            "DueAmt":       float(h.IbhBalAmt or 0.0),
            "AdvAmt":       0.0,
            "RecdAmt":      float(h.IbhDepAmt or 0.0),
            "DepoAmt":      float(h.IbhDepAmt or 0.0),
            "RefuAmt":      float(h.IbhRfugAmt or 0.0),
            "Discount":     discount_amt,
            "CareOf":       ptt.PttRefName if ptt else "",
            "Address":      ptt.PttAddr if ptt else "",
        })
    return result


@router.get("/charge-items")
def list_charge_items(
    sgp_code: Optional[int] = Query(None, description="Filter by service group"),
    db: Session = Depends(get_db),
):
    """Return active service items (= charge items) for dropdown, optionally filtered by group."""
    q = db.query(ServMast).filter(ServMast.SrvRecState == 1, ServMast.SrvShowInList == True)
    if sgp_code:
        q = q.filter(ServMast.SrvSgpCode == sgp_code)
    rows = q.order_by(ServMast.SrvIndex, ServMast.SrvName).all()
    return [
        {
            "SrvCode":    r.SrvCode,
            "SrvName":    r.SrvName,
            "SgpCode":    r.SrvSgpCode,
            "SrvCharges": r.SrvCharges or 0.0,
            "SrvDiscPer": r.SrvDiscPer or 0.0,
        }
        for r in rows
    ]


@router.get("/admissions/active")
def list_active_admissions(
    search: Optional[str] = Query(None),
    db: Session = Depends(get_db),
):
    """Return admitted patients (IndrHdr where IhdStatus=Admitted) for the charge form IPD-No lookup."""
    rows = db.query(IndrHdr).filter(
        IndrHdr.IhdRecState == 1,
        IndrHdr.IhdStatus == "Admitted",
    ).order_by(IndrHdr.IhdDate.desc()).all()

    result = []
    for ihd in rows:
        ptt = db.query(PatMast).filter(PatMast.PttCode == ihd.IhdPttCode).first()
        if search:
            s = search.lower()
            if not (
                s in (ptt.PttName if ptt else "").lower()
                or s in str(ptt.PttRegNo if ptt else "")
                or s in str(ihd.IhdVchNo or "")
            ):
                continue
        result.append({
            "IhdCode":  ihd.IhdCode,
            "IhdVchNo": ihd.IhdVchNo,
            "PttCode":  ptt.PttCode if ptt else None,
            "PttName":  ptt.PttName if ptt else "",
            "PttRegNo": ptt.PttRegNo if ptt else None,
        })
    return result


@router.post("/billing/{ipg_code}/calculate-bed-charges")
def calculate_bed_charges(
    ipg_code: int,
    data: dict,
    db: Session = Depends(get_db),
    current_user = Depends(get_current_active_user)
):
    """
    Calculate and return list of bed stay charges for an admission based on IBedState segments.
    """
    # 1. Resolve admission
    reg = db.query(IndrReg).filter(IndrReg.IpgCode == ipg_code, IndrReg.IpgRecState == 1).first()
    if not reg:
        raise HTTPException(status_code=404, detail="IPD Admission registration not found")

    # 2. Get billing date/time
    bill_date_str = data.get("bill_date")
    bill_time_str = data.get("bill_time", "12:00")
    try:
        bill_date = datetime.date.fromisoformat(bill_date_str) if bill_date_str else datetime.date.today()
    except ValueError:
        bill_date = datetime.date.today()
    
    # helper to convert HH:MM string to minutes
    def time_to_min(t_str: str) -> int:
        try:
            parts = t_str.split(":")
            return int(parts[0]) * 60 + int(parts[1])
        except Exception:
            return 720
    
    bill_time = time_to_min(bill_time_str)

    # 3. Retrieve all active IBedState segments
    ibs_entries = db.query(IBedState).filter(
        IBedState.IbsIpgCode == ipg_code,
        IBedState.IbsRecState == 1
    ).order_by(IBedState.IbsCode.asc()).all()

    if not ibs_entries:
        raise HTTPException(status_code=400, detail="No bed status allocation history found for this admission")

    calculated_charges = []

    for i, ibs in enumerate(ibs_entries):
        # Resolve bed details
        bdm = db.query(BedMast).filter(BedMast.BdmCode == ibs.IbsBdmCode).first()
        if not bdm:
            continue

        # Start Date/Time of stay segment
        from_date = ibs.IbsDate
        from_time = ibs.IbsTime or 0

        # End Date/Time of stay segment
        # If discharged/shifted, use the state end fields.
        # If currently occupied (1) and it's the last segment, use final billing date/time.
        # Otherwise, if occupied but not last segment, use the start of the next segment.
        if ibs.IbsDischState in [2, 3]:  # Shifted or Discharged
            to_date = ibs.IbsDischDate or bill_date
            to_time = ibs.IbsDischTime or 0
        else:
            if i == len(ibs_entries) - 1:
                to_date = bill_date
                to_time = bill_time
            else:
                next_ibs = ibs_entries[i + 1]
                to_date = next_ibs.IbsDate
                to_time = next_ibs.IbsTime or 0

        # Calculate unit count (days)
        is_fixed = bdm.BdmChkOutTimeBasis and "fixed" in bdm.BdmChkOutTimeBasis.lower()
        days_diff = (to_date - from_date).days

        if is_fixed:
            chk_time = bdm.BdmChkTime or 720  # default to 12:00 PM (720 min)
            to_offset = 1 if to_time > chk_time else 0
            from_offset = 1 if from_time > chk_time else 0
            if i == 0:  # First stay segment of this admission
                units = days_diff + to_offset
            else:
                units = days_diff + to_offset - from_offset
        else:  # Admission Time basis
            adm_time = reg.IpgTime or 0
            to_offset = 1 if to_time > adm_time else 0
            from_offset = 1 if from_time > adm_time else 0
            if i == 0:
                units = days_diff + to_offset
            else:
                units = days_diff + to_offset - from_offset

        # Fallback limits
        if units < 1:
            units = 1 if i == 0 else 0

        if units == 0:
            continue

        # Get service links for the bed
        links = db.query(BedSrvMst).filter(
            BedSrvMst.BsmCode == bdm.BdmCode,
            BedSrvMst.BsmRecState == 1
        ).all()

        from_date_str = from_date.strftime("%d/%m/%Y")
        to_date_str = to_date.strftime("%d/%m/%Y")
        
        status_label = "Occupied" if ibs.IbsDischState == 1 else "Shifted" if ibs.IbsDischState == 2 else "Discharged"
        remark = f"{bdm.BdmName} From {from_date_str} to {to_date_str} ({status_label})"

        if links:
            for link in links:
                srv = db.query(ServMast).filter(ServMast.SrvCode == link.BsmSrvCode).first()
                if not srv:
                    continue
                qty = units * (link.BsmUnit or 1.0)
                rate = link.BsmRate or srv.SrvCharges or 0.0
                gross = qty * rate
                calculated_charges.append({
                    "IbsCode":      ibs.IbsCode,
                    "SrvCode":      srv.SrvCode,
                    "SrvName":      srv.SrvName,
                    "Qty":          qty,
                    "Rate":         rate,
                    "DiscPer":      0.0,
                    "DiscAmt":      0.0,
                    "Amount":       gross,
                    "Remark":       remark,
                    "IbbsFromDate": str(from_date),
                    "IbbsFromTime": from_time,
                    "IbbsToDate":   str(to_date),
                    "IbbsToTime":   to_time,
                })
        else:
            # direct service linked on BedMast
            srv_code = bdm.BdmSrvCode
            if srv_code:
                srv = db.query(ServMast).filter(ServMast.SrvCode == srv_code).first()
                if srv:
                    qty = float(units)
                    rate = bdm.BdmCharges or srv.SrvCharges or 0.0
                    gross = qty * rate
                    calculated_charges.append({
                        "IbsCode":      ibs.IbsCode,
                        "SrvCode":      srv.SrvCode,
                        "SrvName":      srv.SrvName,
                        "Qty":          qty,
                        "Rate":         rate,
                        "DiscPer":      0.0,
                        "DiscAmt":      0.0,
                        "Amount":       gross,
                        "Remark":       remark,
                        "IbbsFromDate": str(from_date),
                        "IbbsFromTime": from_time,
                        "IbbsToDate":   str(to_date),
                        "IbbsToTime":   to_time,
                    })

    return calculated_charges


# --- IPD Ledger Advances, Deposits, Payments & Refunds API Routes ---

@router.get("/deposits")
def list_deposits(
    from_date: Optional[str] = Query(None),
    to_date: Optional[str] = Query(None),
    db: Session = Depends(get_db)
):
    """List all active IPD pre-admission or admission deposits."""
    q = db.query(IndrRgPymt).filter(IndrRgPymt.IgtRecState == 1)
    if from_date and to_date:
        try:
            f_dt = datetime.date.fromisoformat(from_date)
            t_dt = datetime.date.fromisoformat(to_date)
            q = q.filter(IndrRgPymt.IgtDate >= f_dt, IndrRgPymt.IgtDate <= t_dt)
        except ValueError:
            pass

    pymts = q.order_by(IndrRgPymt.IgtDate.desc(), IndrRgPymt.IgtVchNo.desc()).all()
    results = []
    for p in pymts:
        ptt = db.query(PatMast).filter(PatMast.PttCode == p.IgtPttCode).first()
        pcg = db.query(PatCatgMst).filter(PatCatgMst.PcgCode == ptt.PttPcgCode).first() if (ptt and ptt.PttPcgCode) else None
        
        # Payment mode parsing
        pay_mode = "Cash"
        remark = p.IgtRemark or ""
        if "UPI" in remark:
            pay_mode = "UPI"
        elif "Card" in remark:
            pay_mode = "Card"

        results.append({
            "IgtCode":    p.IgtCode,
            "IgtIpgCode": p.IgtIpgCode,
            "VchNo":      p.IgtVchNo,
            "Date":       str(p.IgtDate),
            "Time":       p.IgtTime,
            "PttName":    ptt.PttName if ptt else "Unknown",
            "PttRegNo":   ptt.PttRegNo if ptt else None,
            "DpogAmt":    p.IgtDpogAmt or 0.0,
            "AdjAmt":     p.IgtAdjAmt or 0.0,
            "BalAmt":     p.IgtBalAmt or 0.0,
            "Remark":     p.IgtRemark,
            "Scheme":     pcg.PcgName if pcg else "",
            "PymtMode":   pay_mode,
            "CareOf":     ptt.PttRefName if ptt else "",
            "Address":    ptt.PttAddr if ptt else "",
        })
    return results

@router.post("/deposits")
def create_deposit(payload: dict, db: Session = Depends(get_db)):
    """Post a new IPD advance/pre-deposit record."""
    ipg_code = payload.get("IgtIpgCode")
    ptt_code = payload.get("IgtPttCode")
    dpog_amt = float(payload.get("IgtDpogAmt", 0))
    adj_amt  = float(payload.get("IgtAdjAmt", 0))
    remark   = payload.get("IgtRemark", "")
    
    if not ipg_code or not ptt_code or dpog_amt <= 0:
        raise HTTPException(status_code=400, detail="Invalid admission, patient code or deposit amount.")

    max_vch = db.query(func.max(IndrRgPymt.IgtVchNo)).scalar() or 0
    new_vch = max_vch + 1

    pymt = IndrRgPymt(
        IgtIpgCode=ipg_code,
        IgtPttCode=ptt_code,
        IgtVtmCode=1, # Default Voucher Type Code
        IgtPrefix="DEP",
        IgtVchNo=new_vch,
        IgtDate=datetime.date.today(),
        IgtTime=int(datetime.datetime.now().hour * 60 + datetime.datetime.now().minute),
        IgtDpogAmt=dpog_amt,
        IgtAdjAmt=adj_amt,
        IgtBalAmt=dpog_amt - adj_amt,
        IgtRemark=remark,
        IgtRecState=1,
        IgtCmpCode=1
    )
    db.add(pymt)
    db.commit()
    db.refresh(pymt)

    # Save Log
    log = IndrRgPymt_Log(
        LogAction="ADD",
        IgtCode=pymt.IgtCode,
        IgtIpgCode=pymt.IgtIpgCode,
        IgtPttCode=pymt.IgtPttCode,
        IgtVtmCode=pymt.IgtVtmCode,
        IgtPrefix=pymt.IgtPrefix,
        IgtVchNo=pymt.IgtVchNo,
        IgtDate=pymt.IgtDate,
        IgtTime=pymt.IgtTime,
        IgtDpogAmt=pymt.IgtDpogAmt,
        IgtAdjAmt=pymt.IgtAdjAmt,
        IgtBalAmt=pymt.IgtBalAmt,
        IgtRemark=pymt.IgtRemark,
        IgtRecState=pymt.IgtRecState,
        IgtCmpCode=pymt.IgtCmpCode
    )
    db.add(log)
    db.commit()
    return {"ok": True, "vch_no": new_vch, "code": pymt.IgtCode}


@router.get("/refunds")
def list_refunds(
    from_date: Optional[str] = Query(None),
    to_date: Optional[str] = Query(None),
    db: Session = Depends(get_db)
):
    """List all active IPD on-account refunds."""
    q = db.query(IndrRgRefd).filter(IndrRgRefd.IgfRecState == 1)
    if from_date and to_date:
        try:
            f_dt = datetime.date.fromisoformat(from_date)
            t_dt = datetime.date.fromisoformat(to_date)
            q = q.filter(IndrRgRefd.IgfDate >= f_dt, IndrRgRefd.IgfDate <= t_dt)
        except ValueError:
            pass

    rfds = q.order_by(IndrRgRefd.IgfDate.desc(), IndrRgRefd.IgfVchNo.desc()).all()
    results = []
    for r in rfds:
        ptt = db.query(PatMast).filter(PatMast.PttCode == r.IgfPttCode).first()
        pcg = db.query(PatCatgMst).filter(PatCatgMst.PcgCode == ptt.PttPcgCode).first() if (ptt and ptt.PttPcgCode) else None
        
        # Payment mode parsing
        pay_mode = "Cash"
        remark = r.IgfRemark or ""
        if "UPI" in remark:
            pay_mode = "UPI"
        elif "Card" in remark:
            pay_mode = "Card"

        results.append({
            "IgfCode":    r.IgfCode,
            "IgfIpgCode": r.IgfIpgCode,
            "VchNo":      r.IgfVchNo,
            "Date":       str(r.IgfDate),
            "PttName":    ptt.PttName if ptt else "Unknown",
            "PttRegNo":   ptt.PttRegNo if ptt else None,
            "RfugAmt":    r.IgfRfugAmt or 0.0,
            "Remark":     r.IgfRemark,
            "Scheme":     pcg.PcgName if pcg else "",
            "PymtMode":   pay_mode,
            "CareOf":     ptt.PttRefName if ptt else "",
            "Address":    ptt.PttAddr if ptt else "",
        })
    return results

@router.post("/refunds")
def create_refund(payload: dict, db: Session = Depends(get_db)):
    """Post a new IPD on-account refund record."""
    ipg_code = payload.get("IgfIpgCode")
    ptt_code = payload.get("IgfPttCode")
    rfug_amt = float(payload.get("IgfRfugAmt", 0))
    remark   = payload.get("IgfRemark", "")

    if not ipg_code or not ptt_code or rfug_amt <= 0:
        raise HTTPException(status_code=400, detail="Invalid admission, patient or refund amount.")

    max_vch = db.query(func.max(IndrRgRefd.IgfVchNo)).scalar() or 0
    new_vch = max_vch + 1

    rfd = IndrRgRefd(
        IgfIpgCode=ipg_code,
        IgfPttCode=ptt_code,
        IgfVtmCode=2,
        IgfPrefix="RFD",
        IgfVchNo=new_vch,
        IgfDate=datetime.date.today(),
        IgfTime=int(datetime.datetime.now().hour * 60 + datetime.datetime.now().minute),
        IgfRfugAmt=rfug_amt,
        IgfAdjAmt=0.0,
        IgfBalAmt=rfug_amt,
        IgfRemark=remark,
        IgfRecState=1,
        IgfCmpCode=1
    )
    db.add(rfd)
    db.commit()
    db.refresh(rfd)

    # Log
    log = IndrRgRefd_Log(
        LogAction="ADD",
        IgfCode=rfd.IgfCode,
        IgfIpgCode=rfd.IgfIpgCode,
        IgfPttCode=rfd.IgfPttCode,
        IgfVtmCode=rfd.IgfVtmCode,
        IgfPrefix=rfd.IgfPrefix,
        IgfVchNo=rfd.IgfVchNo,
        IgfDate=rfd.IgfDate,
        IgfTime=rfd.IgfTime,
        IgfRfugAmt=rfd.IgfRfugAmt,
        IgfAdjAmt=rfd.IgfAdjAmt,
        IgfBalAmt=rfd.IgfBalAmt,
        IgfRemark=rfd.IgfRemark,
        IgfRecState=rfd.IgfRecState,
        IgfCmpCode=rfd.IgfCmpCode
    )
    db.add(log)
    db.commit()
    return {"ok": True, "vch_no": new_vch, "code": rfd.IgfCode}


@router.get("/bill-payments")
def list_bill_payments(
    from_date: Optional[str] = Query(None),
    to_date: Optional[str] = Query(None),
    db: Session = Depends(get_db)
):
    """List final stays settlements payments."""
    q = db.query(IndrBlPymtHdr).filter(IndrBlPymtHdr.IbphRecState == 1)
    if from_date and to_date:
        try:
            f_dt = datetime.date.fromisoformat(from_date)
            t_dt = datetime.date.fromisoformat(to_date)
            q = q.filter(IndrBlPymtHdr.IbphDate >= f_dt, IndrBlPymtHdr.IbphDate <= t_dt)
        except ValueError:
            pass

    payments = q.order_by(IndrBlPymtHdr.IbphDate.desc(), IndrBlPymtHdr.IbphVchNo.desc()).all()
    results = []
    for p in payments:
        ptt = db.query(PatMast).filter(PatMast.PttCode == p.IbphPttCode).first()
        pcg = db.query(PatCatgMst).filter(PatCatgMst.PcgCode == ptt.PttPcgCode).first() if (ptt and ptt.PttPcgCode) else None
        
        # Payment mode parsing
        pay_mode = "Cash"
        remark = p.IbphRemark if hasattr(p, "IbphRemark") else ""
        if "UPI" in str(remark):
            pay_mode = "UPI"
        elif "Card" in str(remark):
            pay_mode = "Card"

        results.append({
            "IbphCode":    p.IbphCode,
            "IbphIpgCode": p.IbphIpgCode,
            "VchNo":      p.IbphVchNo,
            "Date":       str(p.IbphDate),
            "Time":       f"{(p.IbphTime or 0) // 60:02d}:{(p.IbphTime or 0) % 60:02d}",
            "PttName":    ptt.PttName if ptt else "Unknown",
            "PttRegNo":   ptt.PttRegNo if ptt else None,
            "DepoAmt":    float(p.IbphDepoAmt or 0.0),
            "Scheme":     pcg.PcgName if pcg else "",
            "PymtMode":   pay_mode,
            "Remark":     str(remark),
            "CareOf":     ptt.PttRefName if ptt else "",
            "Address":    ptt.PttAddr if ptt else "",
        })
    return results

@router.post("/bill-payments")
def create_bill_payment(payload: dict, db: Session = Depends(get_db)):
    """Post a final stays settlement payment voucher."""
    ipg_code = payload.get("IbpyIpgCode")
    ptt_code = payload.get("IbpyPttCode")
    amount   = float(payload.get("IbpyDepoAmt", 0))
    bill_code = payload.get("IbhCode") # Target bill code

    if not ipg_code or not ptt_code or amount <= 0:
        raise HTTPException(status_code=400, detail="Invalid admission, patient or payment amount.")

    max_vch = db.query(func.max(IndrBlPymtHdr.IbphVchNo)).scalar() or 0
    new_vch = max_vch + 1

    py = IndrBlPymtHdr(
        IbphIpgCode=ipg_code,
        IbphPttCode=ptt_code,
        IbphVtmCode=3,
        IbphPrefix="BPY",
        IbphVchNo=new_vch,
        IbphDate=datetime.date.today(),
        IbphTime=int(datetime.datetime.now().hour * 60 + datetime.datetime.now().minute),
        IbphDepoAmt=amount,
        IbphRecState=1,
        IbphCmpCode=1
    )
    db.add(py)
    db.commit()
    db.refresh(py)

    # Log
    log = IndrBlPymtHdr_Log(
        LogAction="ADD",
        IbphCode=py.IbphCode,
        IbphIpgCode=py.IbphIpgCode,
        IbphPttCode=py.IbphPttCode,
        IbphVtmCode=py.IbphVtmCode,
        IbphPrefix=py.IbphPrefix,
        IbphVchNo=py.IbphVchNo,
        IbphDate=py.IbphDate,
        IbphTime=py.IbphTime,
        IbphDepoAmt=py.IbphDepoAmt,
        IbphRecState=py.IbphRecState,
        IbphCmpCode=py.IbphCmpCode
    )
    db.add(log)
    db.commit()

    return {"ok": True, "vch_no": new_vch, "code": py.IbphCode}


@router.get("/bill-refunds")
def list_bill_refunds(
    from_date: Optional[str] = Query(None),
    to_date: Optional[str] = Query(None),
    db: Session = Depends(get_db)
):
    """List final stays bill refunds."""
    q = db.query(IndrBlRefdHdr).filter(IndrBlRefdHdr.IbfhRecState == 1)
    if from_date and to_date:
        try:
            f_dt = datetime.date.fromisoformat(from_date)
            t_dt = datetime.date.fromisoformat(to_date)
            q = q.filter(IndrBlRefdHdr.IbfhDate >= f_dt, IndrBlRefdHdr.IbfhDate <= t_dt)
        except ValueError:
            pass

    rfds = q.order_by(IndrBlRefdHdr.IbfhDate.desc(), IndrBlRefdHdr.IbfhVchNo.desc()).all()
    results = []
    for r in rfds:
        ptt = db.query(PatMast).filter(PatMast.PttCode == r.IbfhPttCode).first()
        pcg = db.query(PatCatgMst).filter(PatCatgMst.PcgCode == ptt.PttPcgCode).first() if (ptt and ptt.PttPcgCode) else None
        
        # Payment mode parsing
        pay_mode = "Cash"
        remark = r.IbfhRemark if hasattr(r, "IbfhRemark") else ""
        if "UPI" in str(remark):
            pay_mode = "UPI"
        elif "Card" in str(remark):
            pay_mode = "Card"

        results.append({
            "IbfhCode":    r.IbfhCode,
            "IbfhIpgCode": r.IbfhIpgCode,
            "VchNo":      r.IbfhVchNo,
            "Date":       str(r.IbfhDate),
            "Time":       f"{(r.IbfhTime or 0) // 60:02d}:{(r.IbfhTime or 0) % 60:02d}",
            "PttName":    ptt.PttName if ptt else "Unknown",
            "PttRegNo":   ptt.PttRegNo if ptt else None,
            "RefuAmt":    float(r.IbfhRefuAmt or 0.0),
            "Scheme":     pcg.PcgName if pcg else "",
            "PymtMode":   pay_mode,
            "Remark":     str(remark),
            "CareOf":     ptt.PttRefName if ptt else "",
            "Address":    ptt.PttAddr if ptt else "",
        })
    return results

@router.post("/bill-refunds")
def create_bill_refund(payload: dict, db: Session = Depends(get_db)):
    """Post a final stays bill refund voucher."""
    ipg_code = payload.get("IbfhIpgCode")
    ptt_code = payload.get("IbfhPttCode")
    amount   = float(payload.get("IbfhRefuAmt", 0))

    if not ipg_code or not ptt_code or amount <= 0:
        raise HTTPException(status_code=400, detail="Invalid admission, patient or refund amount.")

    max_vch = db.query(func.max(IndrBlRefdHdr.IbfhVchNo)).scalar() or 0
    new_vch = max_vch + 1

    rf = IndrBlRefdHdr(
        IbfhIpgCode=ipg_code,
        IbfhPttCode=ptt_code,
        IbfhVtmCode=4,
        IbfhPrefix="BRF",
        IbfhVchNo=new_vch,
        IbfhDate=datetime.date.today(),
        IbfhTime=int(datetime.datetime.now().hour * 60 + datetime.datetime.now().minute),
        IbfhRefuAmt=amount,
        IbfhRecState=1,
        IbfhCmpCode=1
    )
    db.add(rf)
    db.commit()
    db.refresh(rf)

    # Log
    log = IndrBlRefdHdr_Log(
        LogAction="ADD",
        IbfhCode=rf.IbfhCode,
        IbfhIpgCode=rf.IbfhIpgCode,
        IbfhPttCode=rf.IbfhPttCode,
        IbfhVtmCode=rf.IbfhVtmCode,
        IbfhPrefix=rf.IbfhPrefix,
        IbfhVchNo=rf.IbfhVchNo,
        IbfhDate=rf.IbfhDate,
        IbfhTime=rf.IbfhTime,
        IbfhRefuAmt=rf.IbfhRefuAmt,
        IbfhRecState=rf.IbfhRecState,
        IbfhCmpCode=rf.IbfhCmpCode
    )
    db.add(log)
    db.commit()

    return {"ok": True, "vch_no": new_vch, "code": rf.IbfhCode}


@router.get("/receipt-payments")
def list_receipt_payments(
    from_date: Optional[str] = Query(None),
    to_date: Optional[str] = Query(None),
    db: Session = Depends(get_db)
):
    """List receipts due payments."""
    q = db.query(IndrPymtHdr).filter(IndrPymtHdr.IphRecState == 1)
    if from_date and to_date:
        try:
            f_dt = datetime.date.fromisoformat(from_date)
            t_dt = datetime.date.fromisoformat(to_date)
            q = q.filter(IndrPymtHdr.IphDate >= f_dt, IndrPymtHdr.IphDate <= t_dt)
        except ValueError:
            pass

    pymts = q.order_by(IndrPymtHdr.IphDate.desc(), IndrPymtHdr.IphVchNo.desc()).all()
    results = []
    for p in pymts:
        ptt = db.query(PatMast).filter(PatMast.PttCode == p.IphPttCode).first()
        pcg = db.query(PatCatgMst).filter(PatCatgMst.PcgCode == ptt.PttPcgCode).first() if (ptt and ptt.PttPcgCode) else None
        
        # Payment mode parsing
        pay_mode = "Cash"
        remark = p.IphRemark if hasattr(p, "IphRemark") else ""
        if "UPI" in str(remark):
            pay_mode = "UPI"
        elif "Card" in str(remark):
            pay_mode = "Card"

        results.append({
            "IphCode":    p.IphCode,
            "IphIpgCode": p.IphIpgCode,
            "VchNo":      p.IphVchNo,
            "Date":       str(p.IphDate),
            "Time":       f"{(p.IphTime or 0) // 60:02d}:{(p.IphTime or 0) % 60:02d}",
            "PttName":    ptt.PttName if ptt else "Unknown",
            "PttRegNo":   ptt.PttRegNo if ptt else None,
            "DepoAmt":    float(p.IphDepoAmt or 0.0),
            "Scheme":     pcg.PcgName if pcg else "",
            "PymtMode":   pay_mode,
            "Remark":     p.IphRemark or "",
            "CareOf":     ptt.PttRefName if ptt else "",
            "Address":    ptt.PttAddr if ptt else "",
        })
    return results

@router.post("/receipt-payments")
def create_receipt_payment(payload: dict, db: Session = Depends(get_db)):
    """Post a receipt payment voucher."""
    ipg_code = payload.get("IphIpgCode")
    ptt_code = payload.get("IphPttCode")
    amount   = float(payload.get("IphDepoAmt", 0))

    if not ipg_code or not ptt_code or amount <= 0:
        raise HTTPException(status_code=400, detail="Invalid admission, patient or payment amount.")

    max_vch = db.query(func.max(IndrPymtHdr.IphVchNo)).scalar() or 0
    new_vch = max_vch + 1

    py = IndrPymtHdr(
        IphIpgCode=ipg_code,
        IphPttCode=ptt_code,
        IphVtmCode=5,
        IphPrefix="RPY",
        IphVchNo=new_vch,
        IphDate=datetime.date.today(),
        IphTime=int(datetime.datetime.now().hour * 60 + datetime.datetime.now().minute),
        IphDepoAmt=amount,
        IphRecState=1,
        IphCmpCode=1
    )
    db.add(py)
    db.commit()
    db.refresh(py)

    log = IndrPymtHdr_Log(
        LogAction="ADD",
        IphCode=py.IphCode,
        IphIpgCode=py.IphIpgCode,
        IphVtmCode=py.IphVtmCode,
        IphPrefix=py.IphPrefix,
        IphVchNo=py.IphVchNo,
        IphDate=py.IphDate,
        IphTime=py.IphTime,
        IphPttCode=py.IphPttCode,
        IphDepoAmt=py.IphDepoAmt,
        IphRecState=py.IphRecState,
        IphCmpCode=py.IphCmpCode
    )
    db.add(log)
    db.commit()

    return {"ok": True, "vch_no": new_vch, "code": py.IphCode}


@router.get("/receipt-refunds")
def list_receipt_refunds(
    from_date: Optional[str] = Query(None),
    to_date: Optional[str] = Query(None),
    db: Session = Depends(get_db)
):
    """List receipts refunds."""
    q = db.query(IndrRefdHdr).filter(IndrRefdHdr.IfhRecState == 1)
    if from_date and to_date:
        try:
            f_dt = datetime.date.fromisoformat(from_date)
            t_dt = datetime.date.fromisoformat(to_date)
            q = q.filter(IndrRefdHdr.IfhDate >= f_dt, IndrRefdHdr.IfhDate <= t_dt)
        except ValueError:
            pass

    rfds = q.order_by(IndrRefdHdr.IfhDate.desc(), IndrRefdHdr.IfhVchNo.desc()).all()
    results = []
    for r in rfds:
        ptt = db.query(PatMast).filter(PatMast.PttCode == r.IfhPttCode).first()
        pcg = db.query(PatCatgMst).filter(PatCatgMst.PcgCode == ptt.PttPcgCode).first() if (ptt and ptt.PttPcgCode) else None
        
        # Payment mode parsing
        pay_mode = "Cash"
        remark = r.IfhRemark if hasattr(r, "IfhRemark") else ""
        if "UPI" in str(remark):
            pay_mode = "UPI"
        elif "Card" in str(remark):
            pay_mode = "Card"

        results.append({
            "IfhCode":    r.IfhCode,
            "IfhIpgCode": r.IfhIpgCode,
            "VchNo":      r.IfhVchNo,
            "Date":       str(r.IfhDate),
            "PttName":    ptt.PttName if ptt else "Unknown",
            "PttRegNo":   ptt.PttRegNo if ptt else None,
            "RefuAmt":    r.IfhRefuAmt or 0.0,
            "Scheme":     pcg.PcgName if pcg else "",
            "PymtMode":   pay_mode,
            "CareOf":     ptt.PttRefName if ptt else "",
            "Address":    ptt.PttAddr if ptt else "",
        })
    return results

@router.post("/receipt-refunds")
def create_receipt_refund(payload: dict, db: Session = Depends(get_db)):
    """Post a receipt refund voucher."""
    ipg_code = payload.get("IfhIpgCode")
    ptt_code = payload.get("IfhPttCode")
    amount   = float(payload.get("IfhRefuAmt", 0))

    if not ipg_code or not ptt_code or amount <= 0:
        raise HTTPException(status_code=400, detail="Invalid admission, patient or refund amount.")

    max_vch = db.query(func.max(IndrRefdHdr.IfhVchNo)).scalar() or 0
    new_vch = max_vch + 1

    rf = IndrRefdHdr(
        IfhIpgCode=ipg_code,
        IfhPttCode=ptt_code,
        IfhVtmCode=6,
        IfhPrefix="RRF",
        IfhVchNo=new_vch,
        IfhDate=datetime.date.today(),
        IfhTime=int(datetime.datetime.now().hour * 60 + datetime.datetime.now().minute),
        IfhRefuAmt=amount,
        IfhRecState=1,
        IfhCmpCode=1
    )
    db.add(rf)
    db.commit()
    db.refresh(rf)

    log = IndrRefdHdr_Log(
        LogAction="ADD",
        IfhCode=rf.IfhCode,
        IfhIpgCode=rf.IfhIpgCode,
        IfhVtmCode=rf.IfhVtmCode,
        IfhPrefix=rf.IfhPrefix,
        IfhVchNo=rf.IfhVchNo,
        IfhDate=rf.IfhDate,
        IfhTime=rf.IfhTime,
        IfhPttCode=rf.IfhPttCode,
        IfhRefuAmt=rf.IfhRefuAmt,
        IfhRecState=rf.IfhRecState,
        IfhCmpCode=rf.IfhCmpCode
    )
    db.add(log)
    db.commit()

    return {"ok": True, "vch_no": new_vch, "code": rf.IfhCode}


# --- Clinical History API Routes ---

@router.get("/clinical-history/{ihr_code}")
def get_clinical_history(ihr_code: int, db: Session = Depends(get_db)):
    """Fetch the clinical history case sheet record for an admission stay."""
    hist = db.query(IndrClinHis).filter(
        IndrClinHis.IchIpgCode == ihr_code,
        IndrClinHis.IchRecState == 1
    ).order_by(IndrClinHis.IchCode.desc()).first()
    
    if not hist:
        return {
            "IchCode": 0,
            "IchIpgCode": ihr_code,
            "IchDate": str(datetime.date.today()),
            "IchTime": "12:00",
            "IchComplaints": "",
            "IchHistory": "",
            "IchAllergies": "",
            "IchTemp": 98.6,
            "IchPulse": 72,
            "IchBP": "",
            "IchSPO2": 98,
            "IchSystemic": "",
            "IchDiagnosis": ""
        }
        
    def _fmt_time(m: int) -> str:
        return f"{m // 60:02d}:{m % 60:02d}"
        
    return {
        "IchCode":       hist.IchCode,
        "IchIpgCode":    hist.IchIpgCode,
        "IchDate":       str(hist.IchDate),
        "IchTime":       _fmt_time(hist.IchTime),
        "IchComplaints": hist.IchComplaints or "",
        "IchHistory":    hist.IchHistory or "",
        "IchAllergies":   hist.IchAllergies or "",
        "IchTemp":       hist.IchTemp or 98.6,
        "IchPulse":      hist.IchPulse or 72,
        "IchBP":         hist.IchBP or "",
        "IchSPO2":       hist.IchSPO2 or 98,
        "IchSystemic":   hist.IchSystemic or "",
        "IchDiagnosis":  hist.IchDiagnosis or ""
    }


@router.post("/clinical-history")
def save_clinical_history(payload: dict, db: Session = Depends(get_db)):
    """Save/update a clinical history case sheet record."""
    ihr_code = payload.get("IchIpgCode")
    if not ihr_code:
        raise HTTPException(status_code=400, detail="Invalid admission stay code.")
        
    time_str = payload.get("IchTime", "12:00")
    try:
        hr, mn = map(int, time_str.split(":"))
        time_mins = hr * 60 + mn
    except Exception:
        time_mins = 720

    date_val = payload.get("IchDate")
    if isinstance(date_val, str):
        try:
            date_val = datetime.date.fromisoformat(date_val)
        except ValueError:
            date_val = datetime.date.today()
    else:
        date_val = datetime.date.today()

    hist = db.query(IndrClinHis).filter(
        IndrClinHis.IchIpgCode == ihr_code,
        IndrClinHis.IchRecState == 1
    ).first()
    
    if not hist:
        hist = IndrClinHis(IchIpgCode=ihr_code)
        db.add(hist)
        
    hist.IchDate       = date_val
    hist.IchTime       = time_mins
    hist.IchComplaints = payload.get("IchComplaints", "")
    hist.IchHistory    = payload.get("IchHistory", "")
    hist.IchAllergies   = payload.get("IchAllergies", "")
    hist.IchTemp       = float(payload.get("IchTemp", 98.6))
    hist.IchPulse      = int(payload.get("IchPulse", 72))
    hist.IchBP         = payload.get("IchBP", "")
    hist.IchSPO2       = int(payload.get("IchSPO2", 98))
    hist.IchSystemic   = payload.get("IchSystemic", "")
    hist.IchDiagnosis  = payload.get("IchDiagnosis", "")
    
    db.commit()
    db.refresh(hist)
    return {"ok": True, "code": hist.IchCode}


# --- Discharge Summary API Routes ---

@router.get("/discharge-summary/{ihr_code}")
def get_discharge_summary(ihr_code: int, db: Session = Depends(get_db)):
    """Fetch the discharge summary record for an admission stay."""
    summary = db.query(IndrDischSum).filter(
        IndrDischSum.IdsIpgCode == ihr_code,
        IndrDischSum.IdsRecState == 1
    ).order_by(IndrDischSum.IdsCode.desc()).first()
    
    if not summary:
        return {
            "IdsCode": 0,
            "IdsIpgCode": ihr_code,
            "IdsDate": str(datetime.date.today()),
            "IdsTime": "12:00",
            "IdsComplaints": "",
            "IdsFindings": "",
            "IdsCourse": "",
            "IdsCondition": "",
            "IdsAdvice": "",
            "IdsPrescription": "[]",
            "IdsFollowUpDate": None
        }
        
    def _fmt_time(m: int) -> str:
        return f"{m // 60:02d}:{m % 60:02d}"
        
    return {
        "IdsCode":         summary.IdsCode,
        "IdsIpgCode":      summary.IdsIpgCode,
        "IdsDate":         str(summary.IdsDate),
        "IdsTime":         _fmt_time(summary.IdsTime),
        "IdsComplaints":   summary.IdsComplaints or "",
        "IdsFindings":     summary.IdsFindings or "",
        "IdsCourse":       summary.IdsCourse or "",
        "IdsCondition":    summary.IdsCondition or "",
        "IdsAdvice":       summary.IdsAdvice or "",
        "IdsPrescription": summary.IdsPrescription or "[]",
        "IdsFollowUpDate": str(summary.IdsFollowUpDate) if summary.IdsFollowUpDate else None
    }


@router.post("/discharge-summary")
def save_discharge_summary(payload: dict, db: Session = Depends(get_db)):
    """Save/update a discharge summary record."""
    ihr_code = payload.get("IdsIpgCode")
    if not ihr_code:
        raise HTTPException(status_code=400, detail="Invalid admission stay code.")
        
    time_str = payload.get("IdsTime", "12:00")
    try:
        hr, mn = map(int, time_str.split(":"))
        time_mins = hr * 60 + mn
    except Exception:
        time_mins = 720

    date_val = payload.get("IdsDate")
    if isinstance(date_val, str):
        try:
            date_val = datetime.date.fromisoformat(date_val)
        except ValueError:
            date_val = datetime.date.today()
    else:
        date_val = datetime.date.today()

    fup_date = payload.get("IdsFollowUpDate")
    if fup_date:
        try:
            fup_date = datetime.date.fromisoformat(fup_date)
        except ValueError:
            fup_date = None
    else:
        fup_date = None

    summary = db.query(IndrDischSum).filter(
        IndrDischSum.IdsIpgCode == ihr_code,
        IndrDischSum.IdsRecState == 1
    ).first()
    
    if not summary:
        summary = IndrDischSum(IdsIpgCode=ihr_code)
        db.add(summary)
        
    summary.IdsDate         = date_val
    summary.IdsTime         = time_mins
    summary.IdsComplaints   = payload.get("IdsComplaints", "")
    summary.IdsFindings     = payload.get("IdsFindings", "")
    summary.IdsCourse       = payload.get("IdsCourse", "")
    summary.IdsCondition    = payload.get("IdsCondition", "")
    summary.IdsAdvice       = payload.get("IdsAdvice", "")
    summary.IdsPrescription = payload.get("IdsPrescription", "[]")
    summary.IdsFollowUpDate = fup_date
    
    db.commit()
    db.refresh(summary)
    return {"ok": True, "code": summary.IdsCode}


