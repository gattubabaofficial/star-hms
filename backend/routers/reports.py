from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from sqlalchemy import func
from typing import List
from datetime import date

from backend.database import get_db
from backend.models.opd import OutdReg, OutdRcpt, OutdBlPymtHdr, OutdBill, OutdHdr
from backend.models.ipd import IndrHdr, IndrRgPymt, IndrBlDpogDtl, IndrBill, IBedState, IndrBlHdr
from backend.models.pharmacy import OutdStk, IndrStk
from backend.models.lab import LabPymtHdr
from backend.models.masters import PatMast, WardMast, BedMast, FloorMast, ServMast
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

@router.get("/collection", response_model=List[CollectionReportItem])
def get_collection_report(start_date: date, end_date: date, db: Session = Depends(get_db)):
    collections = []
    
    opd_reg = db.query(func.count(OutdRcpt.OrcCode).label("count"), func.sum(OutdRcpt.OrcRecvdAmt).label("total")).filter(
        OutdRcpt.OrcDate >= start_date, OutdRcpt.OrcDate <= end_date, OutdRcpt.OrcRecState == 1
    ).first()
    if opd_reg and opd_reg.count:
        collections.append(CollectionReportItem(Date=start_date, Module="OPD Registration", TotalAmount=opd_reg.total or 0, TransactionCount=opd_reg.count))

    opd_bill = db.query(func.count(OutdBlPymtHdr.ObpCode).label("count"), func.sum(OutdBlPymtHdr.ObpAmt).label("total")).filter(
        OutdBlPymtHdr.ObpDate >= start_date, OutdBlPymtHdr.ObpDate <= end_date, OutdBlPymtHdr.ObpRecState == 1
    ).first()
    if opd_bill and opd_bill.count:
        collections.append(CollectionReportItem(Date=start_date, Module="OPD Billing", TotalAmount=opd_bill.total or 0, TransactionCount=opd_bill.count))
        
    ipd_adv = db.query(func.count(IndrRgPymt.IrpCode).label("count"), func.sum(IndrRgPymt.IrpAmt).label("total")).filter(
        IndrRgPymt.IrpDate >= start_date, IndrRgPymt.IrpDate <= end_date, IndrRgPymt.IrpRecState == 1
    ).first()
    if ipd_adv and ipd_adv.count:
        collections.append(CollectionReportItem(Date=start_date, Module="IPD Advance", TotalAmount=ipd_adv.total or 0, TransactionCount=ipd_adv.count))

    ipd_bill = db.query(func.count(IndrBlDpogDtl.IpdCode).label("count"), func.sum(IndrBlDpogDtl.IpdAmt).label("total")).filter(
        IndrBlDpogDtl.IpdDate >= start_date, IndrBlDpogDtl.IpdDate <= end_date, IndrBlDpogDtl.IpdRecState == 1
    ).first()
    if ipd_bill and ipd_bill.count:
        collections.append(CollectionReportItem(Date=start_date, Module="IPD Billing", TotalAmount=ipd_bill.total or 0, TransactionCount=ipd_bill.count))

    lab_pymt = db.query(func.count(LabPymtHdr.LphCode).label("count"), func.sum(LabPymtHdr.LphAmt).label("total")).filter(
        LabPymtHdr.LphDate >= start_date, LabPymtHdr.LphDate <= end_date, LabPymtHdr.LphRecState == 1
    ).first()
    if lab_pymt and lab_pymt.count:
        collections.append(CollectionReportItem(Date=start_date, Module="Laboratory", TotalAmount=lab_pymt.total or 0, TransactionCount=lab_pymt.count))

    return collections

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
        IndrHdr, IndrHdr.IhdCode == IBedState.IbbsICode
    ).join(
        PatMast, PatMast.PttCode == IndrHdr.IhdPttCode
    ).join(
        BedMast, BedMast.BdmCode == IBedState.IbbsIbsCode
    ).join(
        WardMast, WardMast.WrdCode == BedMast.BdmWrdCode
    ).join(
        FloorMast, FloorMast.FlrCode == BedMast.BdmFlrCode
    ).filter(
        IBedState.IbbsRecState == 1,
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
