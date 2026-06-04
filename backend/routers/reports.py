from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from sqlalchemy import func
from typing import List, Optional
from datetime import date

from backend.database import get_db
from backend.models.opd import OutdReg, OutdRcpt, OutdBlPymtHdr, OutdBill, OutdHdr
from backend.models.ipd import IndrHdr, IndrRgPymt, IndrBlDpogDtl, IndrBill, IBedState, IndrBlHdr
from backend.models.pharmacy import OutdStk, IndrStk
from backend.models.lab import LabPymtHdr
from backend.models.masters import PatMast, WardMast, BedMast, FloorMast, ServMast, DoctMast, RefByMast
from backend.schemas.reports import (
    OpdReportItem, IpdReportItem, PharmacyReportItem,
    CollectionReportItem, ServiceReportItem, BedOccupancyItem
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

from backend.models.ipd import IndrReg
from backend.models.lab import LabHdr
from backend.schemas.reports import CollectionTransaction

@router.get("/collection", response_model=List[CollectionTransaction])
def get_collection_report(start_date: date, end_date: date, db: Session = Depends(get_db)):
    transactions = []
    
    # 1. OPD Registration
    opd_rcpt = db.query(
        OutdRcpt.OrcDate.label("Date"), OutdRcpt.OrcVchNo.label("VchNo"), 
        PatMast.PttName.label("PatName"), DoctMast.DctName.label("DctName"), 
        OutdRcpt.OrcRecvdAmt.label("Amount")
    ).join(PatMast, PatMast.PttCode == OutdRcpt.OrcPttCode) \
    .outerjoin(DoctMast, DoctMast.DctCode == OutdRcpt.OrcCDctCode) \
    .filter(OutdRcpt.OrcDate >= start_date, OutdRcpt.OrcDate <= end_date, OutdRcpt.OrcRecState == 1).all()
    
    for r in opd_rcpt:
        transactions.append(CollectionTransaction(
            Date=r.Date, ReceiptNo=str(r.VchNo), PatientName=r.PatName, 
            DoctorName=r.DctName, Module="OPD Registration", Amount=float(r.Amount or 0)
        ))

    # 2. OPD Billing
    opd_bill = db.query(
        OutdBlPymtHdr.ObpDate.label("Date"), OutdHdr.OhdVchNo.label("VchNo"), 
        PatMast.PttName.label("PatName"), DoctMast.DctName.label("DctName"), 
        OutdBlPymtHdr.ObpAmt.label("Amount")
    ).join(OutdHdr, OutdHdr.OhdCode == OutdBlPymtHdr.ObpOhdCode) \
    .join(PatMast, PatMast.PttCode == OutdHdr.OhdPttCode) \
    .outerjoin(DoctMast, DoctMast.DctCode == OutdHdr.OhdCDctCode) \
    .filter(OutdBlPymtHdr.ObpDate >= start_date, OutdBlPymtHdr.ObpDate <= end_date, OutdBlPymtHdr.ObpRecState == 1).all()
    
    for r in opd_bill:
        transactions.append(CollectionTransaction(
            Date=r.Date, ReceiptNo=f"OPB-{r.VchNo}", PatientName=r.PatName, 
            DoctorName=r.DctName, Module="OPD Billing", Amount=float(r.Amount or 0)
        ))

    # 3. IPD Advance
    ipd_adv = db.query(
        IndrRgPymt.IgtDate.label("Date"), IndrRgPymt.IgtVchNo.label("VchNo"), 
        PatMast.PttName.label("PatName"), DoctMast.DctName.label("DctName"), 
        IndrRgPymt.IgtDpogAmt.label("Amount")
    ).join(PatMast, PatMast.PttCode == IndrRgPymt.IgtPttCode) \
    .outerjoin(IndrReg, IndrReg.IpgCode == IndrRgPymt.IgtIpgCode) \
    .outerjoin(DoctMast, DoctMast.DctCode == IndrReg.IpgCDctCode) \
    .filter(IndrRgPymt.IgtDate >= start_date, IndrRgPymt.IgtDate <= end_date, IndrRgPymt.IgtRecState == 1).all()

    for r in ipd_adv:
        transactions.append(CollectionTransaction(
            Date=r.Date, ReceiptNo=f"ADV-{r.VchNo}", PatientName=r.PatName, 
            DoctorName=r.DctName, Module="IPD Advance", Amount=float(r.Amount or 0)
        ))

    # 4. IPD Billing (Deposit against Bill)
    ipd_bill = db.query(
        IndrBlDpogDtl.IbpyDate.label("Date"), IndrBlHdr.IbhVchNo.label("VchNo"), 
        PatMast.PttName.label("PatName"), DoctMast.DctName.label("DctName"), 
        IndrBlDpogDtl.IbpyDepoAmt.label("Amount")
    ).join(IndrBlHdr, IndrBlHdr.IbhCode == IndrBlDpogDtl.IbpyIbhCode) \
    .join(PatMast, PatMast.PttCode == IndrBlDpogDtl.IbpyPttCode) \
    .outerjoin(IndrHdr, IndrHdr.IhdCode == IndrBlHdr.IbhIhdCode) \
    .outerjoin(DoctMast, DoctMast.DctCode == IndrHdr.IhdCDctCode) \
    .filter(IndrBlDpogDtl.IbpyDate >= start_date, IndrBlDpogDtl.IbpyDate <= end_date, IndrBlDpogDtl.IbpyRecState == 1).all()

    for r in ipd_bill:
        transactions.append(CollectionTransaction(
            Date=r.Date, ReceiptNo=f"IPB-{r.VchNo}", PatientName=r.PatName, 
            DoctorName=r.DctName, Module="IPD Billing", Amount=float(r.Amount or 0)
        ))

    # 5. Laboratory
    lab_pymt = db.query(
        LabPymtHdr.LphDate.label("Date"), LabHdr.LhdVchNo.label("VchNo"), 
        PatMast.PttName.label("PatName"), DoctMast.DctName.label("DctName"), 
        LabPymtHdr.LphAmt.label("Amount")
    ).join(LabHdr, LabHdr.LhdCode == LabPymtHdr.LphLhdCode) \
    .join(PatMast, PatMast.PttCode == LabHdr.LhdPttCode) \
    .outerjoin(DoctMast, DoctMast.DctCode == LabHdr.LhdCDctCode) \
    .filter(LabPymtHdr.LphDate >= start_date, LabPymtHdr.LphDate <= end_date, LabPymtHdr.LphRecState == 1).all()

    for r in lab_pymt:
        transactions.append(CollectionTransaction(
            Date=r.Date, ReceiptNo=f"LAB-{r.VchNo}", PatientName=r.PatName, 
            DoctorName=r.DctName, Module="Laboratory", Amount=float(r.Amount or 0)
        ))

    # Sort by Date descending
    transactions.sort(key=lambda x: x.Date, reverse=True)
    return transactions

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
