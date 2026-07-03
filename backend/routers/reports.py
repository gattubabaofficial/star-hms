from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from sqlalchemy import func
from typing import List, Optional
from datetime import date

from backend.database import get_db
from backend.models.opd import (
    OutdReg, OutdRcpt, OutdBlPymtHdr, OutdBill, OutdHdr,
    OutdPymtHdr, OutdRefdHdr, OutdRgRefd, OutdBlRefdHdr,
)
from backend.models.ipd import (
    IndrHdr, IndrRgPymt, IndrBlDpogDtl, IndrBill, IBedState, IndrBlHdr,
    IndrReg, IndrRgRefd, IndrBlPymtHdr, IndrBlRefdHdr,
)
from backend.models.pharmacy import OutdStk, IndrStk
from backend.models.lab import LabHdr, LabPymtHdr, LabRefdHdr
from backend.models.masters import (
    PatMast, WardMast, BedMast, FloorMast, ServMast, DoctMast, RefByMast,
    ServGrpMst, AreaMast, StsnMast, PatCatgMst,
)
from backend.schemas.reports import (
    OpdReportItem, IpdReportItem, PharmacyReportItem,
    CollectionReportItem, ServiceReportItem, BedOccupancyItem,
    CollectionTransaction, CollectionRow, CollectionSummary, CollectionResponse,
)

router = APIRouter()

@router.get("/opd", response_model=List[OpdReportItem])
def get_opd_report(start_date: date, end_date: date, db: Session = Depends(get_db)):
    # Group by Date, count patients, sum revenue
    results = db.query(
        OutdReg.OpgDate.label("Date"),
        func.count(OutdReg.OpgCode).label("TotalPatients"),
        func.sum(OutdReg.OpgAmtAftDisc).label("TotalRevenue")
    ).filter(
        OutdReg.OpgDate >= start_date,
        OutdReg.OpgDate <= end_date,
        OutdReg.OpgRecState == 1
    ).group_by(OutdReg.OpgDate).order_by(OutdReg.OpgDate.desc()).all()
    
    return [OpdReportItem(Date=r.Date, TotalPatients=r.TotalPatients, TotalRevenue=r.TotalRevenue or 0) for r in results]

@router.get("/ipd", response_model=List[IpdReportItem])
def get_ipd_report(start_date: date, end_date: date, db: Session = Depends(get_db)):
    results = db.query(IndrHdr).filter(
        IndrHdr.IhdDate >= start_date,
        IndrHdr.IhdDate <= end_date,
        IndrHdr.IhdRecState == 1
    ).order_by(IndrHdr.IhdDate.desc()).all()
    
    return results

@router.get("/pharmacy", response_model=List[PharmacyReportItem])
def get_pharmacy_report(start_date: date, end_date: date, db: Session = Depends(get_db)):
    # Group sales
    sales = db.query(
        OutdStk.OskDate.label("Date"),
        func.sum(OutdStk.OskNetAmt).label("TotalSales")
    ).filter(
        OutdStk.OskDate >= start_date,
        OutdStk.OskDate <= end_date,
        OutdStk.OskRecState == 1
    ).group_by(OutdStk.OskDate).all()

    # Group purchases
    purchases = db.query(
        IndrStk.IskDate.label("Date"),
        func.sum(IndrStk.IskNetAmt).label("TotalPurchases")
    ).filter(
        IndrStk.IskDate >= start_date,
        IndrStk.IskDate <= end_date,
        IndrStk.IskRecState == 1
    ).group_by(IndrStk.IskDate).all()

    # Merge by date
    report_dict = {}
    
    for s in sales:
        d = s.Date
        report_dict[d] = {"Date": d, "TotalSales": s.TotalSales or 0, "TotalPurchases": 0}
        
    for p in purchases:
        d = p.Date
        if d not in report_dict:
            report_dict[d] = {"Date": d, "TotalSales": 0, "TotalPurchases": p.TotalPurchases or 0}
        else:
            report_dict[d]["TotalPurchases"] = p.TotalPurchases or 0

    sorted_results = sorted(report_dict.values(), key=lambda x: x["Date"], reverse=True)
    return [PharmacyReportItem(**r) for r in sorted_results]

# =====================================================================
# Central Collection Desk  (faithful port of VB6 frmCollectionViewRep)
# ---------------------------------------------------------------------
# The VB6 "Collection Report" UNION-ALL's every money voucher across
# OPD / IPD / Lab over a date range, then joins patient + masters.
# Refunds are stored negative so the grid nets to the true collection.
# Each source below maps a VB6 voucher type to the new flat schema.
# =====================================================================

# source code -> (Module label, Voucher label)
COLLECTION_SOURCES = {
    "opd_reg":       ("Outdoor", "Outdoor Registration"),
    "opd_reg_refd":  ("Outdoor", "Outdoor Reg.Refund"),
    "opd_rcpt":      ("Outdoor", "Outdoor Receipts"),
    "opd_pymt":      ("Outdoor", "Outdoor Rcpt Payment"),
    "opd_refd":      ("Outdoor", "Outdoor Rcpt Refund"),
    "opd_bill_pymt": ("Outdoor", "Outdoor Bill Payment"),
    "opd_bill_refd": ("Outdoor", "Outdoor Bill Refund"),
    "ipd_adv":       ("Indoor",  "Indoor Admit.Advance"),
    "ipd_rg_pymt":   ("Indoor",  "Indoor On A/c.Payment"),
    "ipd_rg_refd":   ("Indoor",  "Indoor On A/c.Refund"),
    "ipd_bill_pymt": ("Indoor",  "Indoor Bill Payment"),
    "ipd_bill_refd": ("Indoor",  "Indoor Bill Refund"),
    "lab_rcpt":      ("Lab",     "Lab Receipts"),
    "lab_pymt":      ("Lab",     "Lab Rcpt Payment"),
    "lab_refd":      ("Lab",     "Lab Rcpt Refund"),
}


@router.get("/collection", response_model=CollectionResponse)
def get_collection_report(
    start_date: date,
    end_date: date,
    include: Optional[str] = None,   # comma list of source codes; default = all
    ptt_code: Optional[int] = None,  # filter: patient
    dct_code: Optional[int] = None,  # filter: consulting doctor
    srv_code: Optional[int] = None,  # filter: service
    sgp_code: Optional[int] = None,  # filter: service group
    db: Session = Depends(get_db),
):
    # which voucher types to include (VB6 "Filter By" checkboxes)
    if include:
        wanted = {c.strip() for c in include.split(",") if c.strip() in COLLECTION_SOURCES}
    else:
        wanted = set(COLLECTION_SOURCES.keys())

    # When a service / service-group filter is active, only the OPD
    # Registration carries a service link – every other voucher type is
    # excluded (mirrors the VB6 "and 0 = 1" behaviour).
    service_filter = srv_code is not None or sgp_code is not None

    # ---- preload master lookups once (cheap, avoids N joins) ----------
    patients = {
        p.PttCode: p for p in db.query(
            PatMast.PttCode, PatMast.PttName, PatMast.PttRegNo, PatMast.PttRefName,
            PatMast.PttAddr, PatMast.PttAraCode, PatMast.PttStnCode, PatMast.PttPcgCode,
        ).all()
    }
    doctors = {d.DctCode: ((d.DctTitle or "") + " " + (d.DctName or "")).strip()
               for d in db.query(DoctMast.DctCode, DoctMast.DctTitle, DoctMast.DctName).all()}
    areas = {a.AraCode: a.AraName for a in db.query(AreaMast.AraCode, AreaMast.AraName).all()}
    stations = {s.StnCode: s.StnName for s in db.query(StsnMast.StnCode, StsnMast.StnName).all()}
    categories = {c.PcgCode: c.PcgName for c in db.query(PatCatgMst.PcgCode, PatCatgMst.PcgName).all()}
    sgroups = {g.SgpCode: g.SgpName for g in db.query(ServGrpMst.SgpCode, ServGrpMst.SgpName).all()}
    services = {s.SrvCode: (s.SrvName, s.SrvSgpCode)
                for s in db.query(ServMast.SrvCode, ServMast.SrvName, ServMast.SrvSgpCode).all()}
    # consulting doctor per IPD registration (for IPD payment/refund vouchers)
    indr_reg_dct = {r.IpgCode: r.IpgCDctCode
                    for r in db.query(IndrReg.IpgCode, IndrReg.IpgCDctCode).all()}

    rows: list[CollectionRow] = []

    def add(code, trn_date, vch_no, ptt, dct, amount, disc=0.0, trn_time=None, srv=None):
        module, voucher = COLLECTION_SOURCES[code]
        p = patients.get(ptt)
        srv_name, sgp_name = "", ""
        if srv is not None and srv in services:
            srv_name, sgp = services[srv]
            sgp_name = sgroups.get(sgp, "")
        rows.append(CollectionRow(
            TrnType=code, Module=module, Voucher=voucher,
            VchNo=str(vch_no or ""), TrnDate=trn_date, TrnTime=trn_time,
            PttCode=ptt,
            PttName=(p.PttName if p else "") or "",
            PttRegNo=(p.PttRegNo if p else None),
            PttRefName=(p.PttRefName if p else "") or "",
            PttAddr=(p.PttAddr if p else "") or "",
            AreaName=(areas.get(p.PttAraCode, "") if p else ""),
            StationName=(stations.get(p.PttStnCode, "") if p else ""),
            CategoryName=(categories.get(p.PttPcgCode, "") if p else ""),
            DoctorName=(doctors.get(dct, "") if dct else ""),
            ServiceName=srv_name, ServiceGroupName=sgp_name,
            ReceivedAmount=float(amount or 0), DiscountAmount=float(disc or 0),
        ))

    # ---------------- OUTDOOR ----------------------------------------
    if "opd_reg" in wanted:
        q = db.query(OutdReg).filter(
            OutdReg.OpgDate >= start_date, OutdReg.OpgDate <= end_date,
            OutdReg.OpgRecState == 1)
        if ptt_code: q = q.filter(OutdReg.OpgPttCode == ptt_code)
        if dct_code: q = q.filter(OutdReg.OpgCDctCode == dct_code)
        if srv_code: q = q.filter(OutdReg.OpgSrvCode == srv_code)
        for r in q.all():
            if sgp_code:
                sv = services.get(r.OpgSrvCode)
                if not sv or sv[1] != sgp_code:
                    continue
            add("opd_reg", r.OpgDate, r.OpgVchNo, r.OpgPttCode, r.OpgCDctCode,
                r.OpgAmtAftDisc, r.OpgDiscAmt, r.OpgTime, r.OpgSrvCode)

    if "opd_reg_refd" in wanted and not service_filter:
        q = db.query(OutdRgRefd, OutdReg).join(OutdReg, OutdReg.OpgCode == OutdRgRefd.OrrOpgCode).filter(
            OutdRgRefd.OrrDate >= start_date, OutdRgRefd.OrrDate <= end_date,
            OutdRgRefd.OrrRecState == 1)
        if ptt_code: q = q.filter(OutdReg.OpgPttCode == ptt_code)
        if dct_code: q = q.filter(OutdReg.OpgCDctCode == dct_code)
        for rf, rg in q.all():
            add("opd_reg_refd", rf.OrrDate, rg.OpgVchNo, rg.OpgPttCode, rg.OpgCDctCode,
                -(rf.OrrAmt or 0))

    if "opd_rcpt" in wanted and not service_filter:
        q = db.query(OutdRcpt).filter(
            OutdRcpt.OrcDate >= start_date, OutdRcpt.OrcDate <= end_date,
            OutdRcpt.OrcRecState == 1)
        if ptt_code: q = q.filter(OutdRcpt.OrcPttCode == ptt_code)
        if dct_code: q = q.filter(OutdRcpt.OrcCDctCode == dct_code)
        for r in q.all():
            add("opd_rcpt", r.OrcDate, r.OrcVchNo, r.OrcPttCode, r.OrcCDctCode,
                r.OrcRecvdAmt, 0.0, r.OrcTime)

    if "opd_pymt" in wanted and not service_filter:
        q = db.query(OutdPymtHdr, OutdRcpt).join(OutdRcpt, OutdRcpt.OrcCode == OutdPymtHdr.OphOrcCode).filter(
            OutdPymtHdr.OphDate >= start_date, OutdPymtHdr.OphDate <= end_date,
            OutdPymtHdr.OphRecState == 1)
        if ptt_code: q = q.filter(OutdRcpt.OrcPttCode == ptt_code)
        if dct_code: q = q.filter(OutdRcpt.OrcCDctCode == dct_code)
        for pm, rc in q.all():
            add("opd_pymt", pm.OphDate, rc.OrcVchNo, rc.OrcPttCode, rc.OrcCDctCode, pm.OphAmt)

    if "opd_refd" in wanted and not service_filter:
        q = db.query(OutdRefdHdr, OutdRcpt).join(OutdRcpt, OutdRcpt.OrcCode == OutdRefdHdr.OrhOrcCode).filter(
            OutdRefdHdr.OrhDate >= start_date, OutdRefdHdr.OrhDate <= end_date,
            OutdRefdHdr.OrhRecState == 1)
        if ptt_code: q = q.filter(OutdRcpt.OrcPttCode == ptt_code)
        if dct_code: q = q.filter(OutdRcpt.OrcCDctCode == dct_code)
        for rf, rc in q.all():
            add("opd_refd", rf.OrhDate, rc.OrcVchNo, rc.OrcPttCode, rc.OrcCDctCode, -(rf.OrhAmt or 0))

    if "opd_bill_pymt" in wanted and not service_filter:
        q = db.query(OutdBlPymtHdr, OutdHdr).join(OutdHdr, OutdHdr.OhdCode == OutdBlPymtHdr.ObpOhdCode).filter(
            OutdBlPymtHdr.ObpDate >= start_date, OutdBlPymtHdr.ObpDate <= end_date,
            OutdBlPymtHdr.ObpRecState == 1)
        if ptt_code: q = q.filter(OutdHdr.OhdPttCode == ptt_code)
        if dct_code: q = q.filter(OutdHdr.OhdCDctCode == dct_code)
        for pm, hd in q.all():
            add("opd_bill_pymt", pm.ObpDate, hd.OhdVchNo, hd.OhdPttCode, hd.OhdCDctCode, pm.ObpAmt)

    if "opd_bill_refd" in wanted and not service_filter:
        q = db.query(OutdBlRefdHdr, OutdHdr).join(OutdHdr, OutdHdr.OhdCode == OutdBlRefdHdr.ObrOhdCode).filter(
            OutdBlRefdHdr.ObrDate >= start_date, OutdBlRefdHdr.ObrDate <= end_date,
            OutdBlRefdHdr.ObrRecState == 1)
        if ptt_code: q = q.filter(OutdHdr.OhdPttCode == ptt_code)
        if dct_code: q = q.filter(OutdHdr.OhdCDctCode == dct_code)
        for rf, hd in q.all():
            add("opd_bill_refd", rf.ObrDate, hd.OhdVchNo, hd.OhdPttCode, hd.OhdCDctCode, -(rf.ObrAmt or 0))

    # ---------------- INDOOR -----------------------------------------
    if "ipd_adv" in wanted and not service_filter:
        q = db.query(IndrReg).filter(
            IndrReg.IpgDate >= start_date, IndrReg.IpgDate <= end_date,
            IndrReg.IpgRecState == 1, IndrReg.IpgAdvAmt > 0)
        if ptt_code: q = q.filter(IndrReg.IpgPttCode == ptt_code)
        if dct_code: q = q.filter(IndrReg.IpgCDctCode == dct_code)
        for r in q.all():
            add("ipd_adv", r.IpgDate, r.IpgVchNo, r.IpgPttCode, r.IpgCDctCode, r.IpgAdvAmt, 0.0, r.IpgTime)

    if "ipd_rg_pymt" in wanted and not service_filter:
        q = db.query(IndrRgPymt).filter(
            IndrRgPymt.IgtDate >= start_date, IndrRgPymt.IgtDate <= end_date,
            IndrRgPymt.IgtRecState == 1)
        if ptt_code: q = q.filter(IndrRgPymt.IgtPttCode == ptt_code)
        for r in q.all():
            dct = indr_reg_dct.get(r.IgtIpgCode)
            if dct_code and dct != dct_code: continue
            add("ipd_rg_pymt", r.IgtDate, r.IgtVchNo, r.IgtPttCode, dct, r.IgtDpogAmt, 0.0, r.IgtTime)

    if "ipd_rg_refd" in wanted and not service_filter:
        q = db.query(IndrRgRefd).filter(
            IndrRgRefd.IgfDate >= start_date, IndrRgRefd.IgfDate <= end_date,
            IndrRgRefd.IgfRecState == 1)
        if ptt_code: q = q.filter(IndrRgRefd.IgfPttCode == ptt_code)
        for r in q.all():
            dct = indr_reg_dct.get(r.IgfIpgCode)
            if dct_code and dct != dct_code: continue
            add("ipd_rg_refd", r.IgfDate, r.IgfVchNo, r.IgfPttCode, dct, -(r.IgfRfugAmt or 0), 0.0, r.IgfTime)

    if "ipd_bill_pymt" in wanted and not service_filter:
        q = db.query(IndrBlPymtHdr).filter(
            IndrBlPymtHdr.IbphDate >= start_date, IndrBlPymtHdr.IbphDate <= end_date,
            IndrBlPymtHdr.IbphRecState == 1)
        if ptt_code: q = q.filter(IndrBlPymtHdr.IbphPttCode == ptt_code)
        for r in q.all():
            dct = indr_reg_dct.get(r.IbphIpgCode)
            if dct_code and dct != dct_code: continue
            add("ipd_bill_pymt", r.IbphDate, r.IbphVchNo, r.IbphPttCode, dct, r.IbphDepoAmt, 0.0, r.IbphTime)

    if "ipd_bill_refd" in wanted and not service_filter:
        q = db.query(IndrBlRefdHdr).filter(
            IndrBlRefdHdr.IbfhDate >= start_date, IndrBlRefdHdr.IbfhDate <= end_date,
            IndrBlRefdHdr.IbfhRecState == 1)
        if ptt_code: q = q.filter(IndrBlRefdHdr.IbfhPttCode == ptt_code)
        for r in q.all():
            dct = indr_reg_dct.get(r.IbfhIpgCode)
            if dct_code and dct != dct_code: continue
            add("ipd_bill_refd", r.IbfhDate, r.IbfhVchNo, r.IbfhPttCode, dct, -(r.IbfhRefuAmt or 0), 0.0, r.IbfhTime)

    # ---------------- LAB --------------------------------------------
    if "lab_rcpt" in wanted and not service_filter:
        q = db.query(LabHdr).filter(
            LabHdr.LhdDate >= start_date, LabHdr.LhdDate <= end_date,
            LabHdr.LhdRecState == 1)
        if ptt_code: q = q.filter(LabHdr.LhdPttCode == ptt_code)
        if dct_code: q = q.filter(LabHdr.LhdCDctCode == dct_code)
        for r in q.all():
            add("lab_rcpt", r.LhdDate, r.LhdVchNo, r.LhdPttCode, r.LhdCDctCode, r.LhdRecvdAmt, 0.0, r.LhdTime)

    if "lab_pymt" in wanted and not service_filter:
        q = db.query(LabPymtHdr, LabHdr).join(LabHdr, LabHdr.LhdCode == LabPymtHdr.LphLhdCode).filter(
            LabPymtHdr.LphDate >= start_date, LabPymtHdr.LphDate <= end_date,
            LabPymtHdr.LphRecState == 1)
        if ptt_code: q = q.filter(LabHdr.LhdPttCode == ptt_code)
        if dct_code: q = q.filter(LabHdr.LhdCDctCode == dct_code)
        for pm, hd in q.all():
            add("lab_pymt", pm.LphDate, hd.LhdVchNo, hd.LhdPttCode, hd.LhdCDctCode, pm.LphAmt)

    if "lab_refd" in wanted and not service_filter:
        q = db.query(LabRefdHdr, LabHdr).join(LabHdr, LabHdr.LhdCode == LabRefdHdr.LrhLhdCode).filter(
            LabRefdHdr.LrhDate >= start_date, LabRefdHdr.LrhDate <= end_date,
            LabRefdHdr.LrhRecState == 1)
        if ptt_code: q = q.filter(LabHdr.LhdPttCode == ptt_code)
        if dct_code: q = q.filter(LabHdr.LhdCDctCode == dct_code)
        for rf, hd in q.all():
            add("lab_refd", rf.LrhDate, hd.LhdVchNo, hd.LhdPttCode, hd.LhdCDctCode, -(rf.LrhAmt or 0))

    # ---- sort (date, voucher) + build summary -----------------------
    rows.sort(key=lambda x: (x.TrnDate, x.Voucher, x.VchNo))

    summary = CollectionSummary(
        Count=len(rows),
        ReceivedTotal=round(sum(r.ReceivedAmount for r in rows), 2),
        DiscountTotal=round(sum(r.DiscountAmount for r in rows), 2),
        OutdoorTotal=round(sum(r.ReceivedAmount for r in rows if r.Module == "Outdoor"), 2),
        IndoorTotal=round(sum(r.ReceivedAmount for r in rows if r.Module == "Indoor"), 2),
        LabTotal=round(sum(r.ReceivedAmount for r in rows if r.Module == "Lab"), 2),
    )
    return CollectionResponse(Rows=rows, Summary=summary)

@router.get("/services", response_model=List[ServiceReportItem])
def get_service_report(start_date: date, end_date: date, db: Session = Depends(get_db)):
    opd_services = db.query(
        ServMast.SrvName,
        func.count(OutdBill.ObdCode).label("Quantity"),
        func.sum(OutdBill.ObdAmtAftDisc).label("TotalRevenue")
    ).join(OutdHdr, OutdHdr.OhdCode == OutdBill.ObdOhdCode).join(ServMast, ServMast.SrvCode == OutdBill.ObdSrvCode).filter(
        OutdHdr.OhdDate >= start_date,
        OutdHdr.OhdDate <= end_date,
        OutdBill.ObdRecState == 1
    ).group_by(ServMast.SrvName).all()

    ipd_services = db.query(
        ServMast.SrvName,
        func.count(IndrBill.IbdCode).label("Quantity"),
        func.sum(IndrBill.IbdAmtAftDisc).label("TotalRevenue")
    ).join(IndrBlHdr, IndrBlHdr.IbhCode == IndrBill.IbdIbhCode).join(ServMast, ServMast.SrvCode == IndrBill.IbdSrvCode).filter(
        IndrBlHdr.IbhDate >= start_date,
        IndrBlHdr.IbhDate <= end_date,
        IndrBill.IbdRecState == 1
    ).group_by(ServMast.SrvName).all()

    services_dict = {}
    for row in opd_services:
        services_dict[row.SrvName] = {"ServiceName": row.SrvName, "Module": "OPD", "Quantity": row.Quantity, "TotalRevenue": row.TotalRevenue}
    for row in ipd_services:
        if row.SrvName in services_dict:
            services_dict[row.SrvName]["Quantity"] += row.Quantity
            services_dict[row.SrvName]["TotalRevenue"] += row.TotalRevenue
            services_dict[row.SrvName]["Module"] = "OPD & IPD"
        else:
            services_dict[row.SrvName] = {"ServiceName": row.SrvName, "Module": "IPD", "Quantity": row.Quantity, "TotalRevenue": row.TotalRevenue}

    return [ServiceReportItem(**s) for s in services_dict.values()]

def calculate_age(dob: date) -> str:
    if not dob:
        return ""
    today = date.today()
    return str(today.year - dob.year - ((today.month, today.day) < (dob.month, dob.day)))

@router.get("/bed-occupancy", response_model=List[BedOccupancyItem])
def get_bed_occupancy_report(db: Session = Depends(get_db)):
    occupancy = db.query(
        IndrHdr.IhdCode,
        IndrHdr.IhdVchNo,
        IndrHdr.IhdDate.label("AdmissionDate"),
        PatMast.PttName.label("PatientName"),
        PatMast.PttDob.label("Dob"),
        PatMast.PttSex.label("Gender"),
        PatMast.PttTelNo.label("Mobile"),
        BedMast.BdmName.label("BedName"),
        WardMast.WrdName.label("WardName"),
        FloorMast.FlrName.label("FloorName")
    ).select_from(IBedState).join(
        IndrHdr, IndrHdr.IhdCode == IBedState.IbsIpgCode
    ).join(
        PatMast, PatMast.PttCode == IndrHdr.IhdPttCode
    ).join(
        BedMast, BedMast.BdmCode == IBedState.IbsBdmCode
    ).join(
        WardMast, WardMast.WrdCode == BedMast.BdmWrdCode
    ).join(
        FloorMast, FloorMast.FlrCode == BedMast.BdmFlrCode
    ).filter(
        IBedState.IbsRecState == 1,
        IndrHdr.IhdStatus == 'Admitted'
    ).all()

    return [
        BedOccupancyItem(
            IhdCode=row.IhdCode,
            IhdVchNo=row.IhdVchNo,
            PatientName=row.PatientName,
            Age=calculate_age(row.Dob),
            Gender=row.Gender or '',
            Mobile=row.Mobile or '',
            AdmissionDate=row.AdmissionDate,
            WardName=row.WardName,
            BedName=row.BedName,
            FloorName=row.FloorName
        ) for row in occupancy
    ]

# -----------------------------------------------------
# Doctor Analysis Report
# – OPD visits, IPD admissions, and revenue share per doctor
# -----------------------------------------------------
@router.get("/doctor-analysis")
def get_doctor_analysis(start_date: date, end_date: date, db: Session = Depends(get_db)):
    # OPD patients seen by each doctor
    opd_counts = db.query(
        OutdReg.OpgCDctCode.label("DctCode"),
        func.count(OutdReg.OpgCode).label("OpdPatients"),
        func.sum(OutdReg.OpgAmtAftDisc).label("OpdRevenue")
    ).filter(
        OutdReg.OpgDate >= start_date,
        OutdReg.OpgDate <= end_date,
        OutdReg.OpgRecState == 1,
        OutdReg.OpgCDctCode != None
    ).group_by(OutdReg.OpgCDctCode).all()

    # IPD admissions under each doctor
    ipd_counts = db.query(
        IndrHdr.IhdCDctCode.label("DctCode"),
        func.count(IndrHdr.IhdCode).label("IpdAdmissions"),
        func.sum(IndrHdr.IhdAdvAmt).label("IpdAdvance")
    ).filter(
        IndrHdr.IhdDate >= start_date,
        IndrHdr.IhdDate <= end_date,
        IndrHdr.IhdRecState == 1,
        IndrHdr.IhdCDctCode != None
    ).group_by(IndrHdr.IhdCDctCode).all()

    # Fetch all doctors
    doctors = db.query(DoctMast).filter(DoctMast.DctRecState == 1).all()
    dct_map = {d.DctCode: d for d in doctors}

    # Build combined result
    result_dict: dict = {}
    for row in opd_counts:
        dc = row.DctCode
        if dc not in result_dict:
            result_dict[dc] = {"DctCode": dc, "OpdPatients": 0, "OpdRevenue": 0.0, "IpdAdmissions": 0, "IpdAdvance": 0.0}
        result_dict[dc]["OpdPatients"] = row.OpdPatients
        result_dict[dc]["OpdRevenue"] = float(row.OpdRevenue or 0)
    for row in ipd_counts:
        dc = row.DctCode
        if dc not in result_dict:
            result_dict[dc] = {"DctCode": dc, "OpdPatients": 0, "OpdRevenue": 0.0, "IpdAdmissions": 0, "IpdAdvance": 0.0}
        result_dict[dc]["IpdAdmissions"] = row.IpdAdmissions
        result_dict[dc]["IpdAdvance"] = float(row.IpdAdvance or 0)

    output = []
    for dc, stats in result_dict.items():
        doc = dct_map.get(dc)
        output.append({
            "DctCode": dc,
            "DoctorName": (doc.DctTitle + " " + doc.DctName) if doc else f"Dr. #{dc}",
            "Specialty": doc.DctSpeci if doc else "",
            "OpdPatients": stats["OpdPatients"],
            "OpdRevenue": stats["OpdRevenue"],
            "IpdAdmissions": stats["IpdAdmissions"],
            "IpdAdvance": stats["IpdAdvance"],
            "TotalPatients": stats["OpdPatients"] + stats["IpdAdmissions"],
            "SharePercent": doc.DctShare if doc else 0.0
        })
    output.sort(key=lambda x: x["TotalPatients"], reverse=True)
    return output


# -----------------------------------------------------
# Referral Analysis Report  
# – How many patients each RefBy doctor referred in
# -----------------------------------------------------
@router.get("/referral-analysis")
def get_referral_analysis(start_date: date, end_date: date, db: Session = Depends(get_db)):
    # OPD referrals
    opd_refs = db.query(
        OutdReg.OpgRByCode.label("RByCode"),
        func.count(OutdReg.OpgCode).label("OpdReferrals"),
        func.sum(OutdReg.OpgAmtAftDisc).label("OpdRevenue")
    ).filter(
        OutdReg.OpgDate >= start_date,
        OutdReg.OpgDate <= end_date,
        OutdReg.OpgRecState == 1,
        OutdReg.OpgRByCode != None
    ).group_by(OutdReg.OpgRByCode).all()

    # IPD referrals
    ipd_refs = db.query(
        IndrHdr.IhdRByCode.label("RByCode"),
        func.count(IndrHdr.IhdCode).label("IpdReferrals")
    ).filter(
        IndrHdr.IhdDate >= start_date,
        IndrHdr.IhdDate <= end_date,
        IndrHdr.IhdRecState == 1,
        IndrHdr.IhdRByCode != None
    ).group_by(IndrHdr.IhdRByCode).all()

    # Fetch all RefBy doctors
    ref_bys = db.query(RefByMast).filter(RefByMast.RByRecState == 1).all()
    rb_map = {r.RByCode: r for r in ref_bys}

    result_dict: dict = {}
    for row in opd_refs:
        rb = row.RByCode
        if rb not in result_dict:
            result_dict[rb] = {"RByCode": rb, "OpdReferrals": 0, "OpdRevenue": 0.0, "IpdReferrals": 0}
        result_dict[rb]["OpdReferrals"] = row.OpdReferrals
        result_dict[rb]["OpdRevenue"] = float(row.OpdRevenue or 0)
    for row in ipd_refs:
        rb = row.RByCode
        if rb not in result_dict:
            result_dict[rb] = {"RByCode": rb, "OpdReferrals": 0, "OpdRevenue": 0.0, "IpdReferrals": 0}
        result_dict[rb]["IpdReferrals"] = row.IpdReferrals

    output = []
    for rb, stats in result_dict.items():
        doc = rb_map.get(rb)
        output.append({
            "RByCode": rb,
            "ReferredByName": doc.RByName if doc else f"Ref #{rb}",
            "Specialty": doc.RBySpeci if doc else "",
            "OpdReferrals": stats["OpdReferrals"],
            "IpdReferrals": stats["IpdReferrals"],
            "TotalReferrals": stats["OpdReferrals"] + stats["IpdReferrals"],
            "OpdRevenue": stats["OpdRevenue"],
            "SharePercent": doc.RByShare if doc else 0.0
        })
    output.sort(key=lambda x: x["TotalReferrals"], reverse=True)
    return output
