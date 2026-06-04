from io import BytesIO
from fastapi import APIRouter, Depends, HTTPException
from fastapi.responses import StreamingResponse
from sqlalchemy.orm import Session

from backend.database import get_db
from backend.models.opd import OutdHdr, OutdBill
from backend.models.ipd import IndrBlHdr, IndrBill
from backend.models.lab import LabHdr, LabRcpt
from backend.models.masters import PatMast, ServMast, DoctMast

from reportlab.lib.pagesizes import A4
from reportlab.pdfgen import canvas

router = APIRouter()

def draw_header(c, title, doc_date, doc_no, patient_name):
    c.setFont("Helvetica-Bold", 16)
    c.drawString(50, 800, "Star HMS")
    c.setFont("Helvetica", 12)
    c.drawString(50, 780, title)
    
    c.setFont("Helvetica", 10)
    c.drawString(50, 750, f"No: {doc_no}")
    c.drawString(400, 750, f"Date: {doc_date}")
    c.drawString(50, 730, f"Patient: {patient_name}")
    
    c.line(50, 710, 550, 710)

def draw_table_header(c):
    c.setFont("Helvetica-Bold", 10)
    c.drawString(50, 690, "S.No")
    c.drawString(100, 690, "Service Description")
    c.drawString(350, 690, "Qty")
    c.drawString(400, 690, "Rate")
    c.drawString(480, 690, "Amount")
    c.line(50, 680, 550, 680)

@router.get("/opd/{header_code}/pdf")
def export_opd_bill(header_code: int, db: Session = Depends(get_db)):
    hdr = db.query(OutdHdr).filter(OutdHdr.OhdCode == header_code).first()
    if not hdr:
        raise HTTPException(status_code=404, detail="OPD Bill not found")
        
    pat = db.query(PatMast).filter(PatMast.PttCode == hdr.OhdPttCode).first()
    pat_name = pat.PttName if pat else "Unknown"
    
    details = db.query(OutdBill).filter(OutdBill.ObdOhdCode == header_code).all()
    
    buffer = BytesIO()
    c = canvas.Canvas(buffer, pagesize=A4)
    
    draw_header(c, "OPD BILL", hdr.OhdDate, hdr.OhdVchNo, pat_name)
    draw_table_header(c)
    
    y = 660
    c.setFont("Helvetica", 10)
    for idx, d in enumerate(details):
        srv = db.query(ServMast).filter(ServMast.SrvCode == d.ObdSrvCode).first()
        srv_name = srv.SrvName if srv else str(d.ObdSrvCode)
        
        c.drawString(50, y, str(idx + 1))
        c.drawString(100, y, srv_name[:40])
        c.drawString(350, y, str(d.ObdQty))
        c.drawString(400, y, f"{d.ObdRate:.2f}")
        c.drawString(480, y, f"{d.ObdAmtAftDisc:.2f}")
        
        y -= 20
        if y < 100:
            c.showPage()
            draw_table_header(c)
            y = 750
            
    c.line(50, y, 550, y)
    y -= 20
    c.setFont("Helvetica-Bold", 10)
    c.drawString(350, y, "Total Amount:")
    c.drawString(480, y, f"{hdr.OhdNetAmt:.2f}")
    
    c.save()
    buffer.seek(0)
    
    return StreamingResponse(
        buffer,
        media_type="application/pdf",
        headers={"Content-Disposition": f"attachment; filename=OPD_Bill_{header_code}.pdf"}
    )

@router.get("/ipd/{header_code}/pdf")
def export_ipd_bill(header_code: int, db: Session = Depends(get_db)):
    hdr = db.query(IndrBlHdr).filter(IndrBlHdr.IbhCode == header_code).first()
    if not hdr:
        raise HTTPException(status_code=404, detail="IPD Bill not found")
        
    pat = db.query(PatMast).filter(PatMast.PttCode == hdr.IbhPttCode).first()
    pat_name = pat.PttName if pat else "Unknown"
    
    details = db.query(IndrBill).filter(IndrBill.IbdIbhCode == header_code).all()
    
    buffer = BytesIO()
    c = canvas.Canvas(buffer, pagesize=A4)
    
    draw_header(c, "IPD DISCHARGE BILL", hdr.IbhDate, hdr.IbhVchNo, pat_name)
    draw_table_header(c)
    
    y = 660
    c.setFont("Helvetica", 10)
    for idx, d in enumerate(details):
        srv = db.query(ServMast).filter(ServMast.SrvCode == d.IbdSrvCode).first()
        srv_name = srv.SrvName if srv else str(d.IbdSrvCode)
        
        c.drawString(50, y, str(idx + 1))
        c.drawString(100, y, srv_name[:40])
        c.drawString(350, y, str(d.IbdQty))
        c.drawString(400, y, f"{d.IbdRate:.2f}")
        c.drawString(480, y, f"{d.IbdAmtAftDisc:.2f}")
        
        y -= 20
        if y < 100:
            c.showPage()
            draw_table_header(c)
            y = 750
            
    c.line(50, y, 550, y)
    y -= 20
    c.setFont("Helvetica-Bold", 10)
    c.drawString(350, y, "Total Amount:")
    c.drawString(480, y, f"{hdr.IbhNetAmt:.2f}")
    y -= 15
    c.drawString(350, y, "Advance Paid:")
    c.drawString(480, y, f"{hdr.IbhDepAmt:.2f}")
    y -= 15
    c.drawString(350, y, "Balance Due:")
    c.drawString(480, y, f"{hdr.IbhBalAmt:.2f}")
    
    c.save()
    buffer.seek(0)
    
    return StreamingResponse(
        buffer,
        media_type="application/pdf",
        headers={"Content-Disposition": f"attachment; filename=IPD_Bill_{header_code}.pdf"}
    )

@router.get("/lab/{header_code}/pdf")
def export_lab_bill(header_code: int, db: Session = Depends(get_db)):
    hdr = db.query(LabHdr).filter(LabHdr.LhdCode == header_code).first()
    if not hdr:
        raise HTTPException(status_code=404, detail="Lab Bill not found")
        
    pat = db.query(PatMast).filter(PatMast.PttCode == hdr.LhdPttCode).first()
    pat_name = pat.PttName if pat else "Unknown"
    
    details = db.query(LabRcpt).filter(LabRcpt.LrdLhdCode == header_code).all()
    
    buffer = BytesIO()
    c = canvas.Canvas(buffer, pagesize=A4)
    
    draw_header(c, "LABORATORY BILL", hdr.LhdDate, hdr.LhdVchNo, pat_name)
    draw_table_header(c)
    
    y = 660
    c.setFont("Helvetica", 10)
    for idx, d in enumerate(details):
        srv = db.query(ServMast).filter(ServMast.SrvCode == d.LrdSrvCode).first()
        srv_name = srv.SrvName if srv else str(d.LrdSrvCode)
        
        c.drawString(50, y, str(idx + 1))
        c.drawString(100, y, srv_name[:40])
        c.drawString(350, y, str(d.LrdQty))
        c.drawString(400, y, f"{d.LrdRate:.2f}")
        c.drawString(480, y, f"{d.LrdAmtAftDisc:.2f}")
        
        y -= 20
        if y < 100:
            c.showPage()
            draw_table_header(c)
            y = 750
            
    c.line(50, y, 550, y)
    y -= 20
    c.setFont("Helvetica-Bold", 10)
    c.drawString(350, y, "Total Amount:")
    c.drawString(480, y, f"{hdr.LhdNetAmt:.2f}")
    
    c.save()
    buffer.seek(0)
    
    return StreamingResponse(
        buffer,
        media_type="application/pdf",
        headers={"Content-Disposition": f"attachment; filename=Lab_Bill_{header_code}.pdf"}
    )
