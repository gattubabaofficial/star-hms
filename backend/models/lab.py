from sqlalchemy import Column, Integer, String, Boolean, Double, SmallInteger, Date, ForeignKey
from backend.database import Base

class LabHdr(Base):
    __tablename__ = "LabHdr"
    LhdCode = Column(Integer, primary_key=True, index=True)
    LhdVtmCode = Column(Integer)
    LhdPrefix = Column(String(10))
    LhdVchNo = Column(Integer, nullable=False)
    LhdDate = Column(Date, nullable=False)
    LhdTime = Column(Integer)
    LhdPttCode = Column(Integer, ForeignKey("PatMast.PttCode"), nullable=False)
    LhdCDctCode = Column(Integer, ForeignKey("DoctMast.DctCode"))
    LhdRByCode = Column(Integer, ForeignKey("RefByMast.RByCode"))
    LhdReceiptType = Column(String(20))
    LhdDiscPer = Column(Double, default=0.0)
    LhdTotalAmt = Column(Double, default=0.0)
    LhdRecvdAmt = Column(Double, default=0.0)
    LhdRfugAmt = Column(Double, default=0.0)
    LhdBalAmt = Column(Double, default=0.0)
    LhdAdvAmt = Column(Double, default=0.0)
    LhdRemark = Column(String(50))
    LhdVoidFlag = Column(Boolean, default=False)
    LhdRecState = Column(SmallInteger, nullable=False, default=1)
    LhdCmpCode = Column(SmallInteger, nullable=False, default=1)

class LabRcpt(Base):
    __tablename__ = "LabRcpt"
    LrdCode = Column(Integer, primary_key=True, index=True)
    LrdLhdCode = Column(Integer, ForeignKey("LabHdr.LhdCode"), nullable=False)
    LrdSrvCode = Column(Integer, ForeignKey("ServMast.SrvCode"))
    LrdSno = Column(SmallInteger)
    LrdUnit = Column(Double, default=1.0)
    LrdRate = Column(Double, default=0.0)
    LrdAmtBefDisc = Column(Double, default=0.0)
    LrdDiscPer = Column(Double, default=0.0)
    LrdDiscAmt = Column(Double, default=0.0)
    LrdAmtAftDisc = Column(Double, default=0.0)
    LrdRecState = Column(SmallInteger, nullable=False, default=1)

class LabRcDctDtl(Base):
    __tablename__ = "LabRcDctDtl"
    LddCode = Column(Integer, primary_key=True, index=True)
    LddLhdCode = Column(Integer, ForeignKey("LabHdr.LhdCode"), nullable=False)
    LddDctCode = Column(Integer, ForeignKey("DoctMast.DctCode"))
    LddSharePer = Column(Double, default=0.0)
    LddRecState = Column(SmallInteger, nullable=False, default=1)

class LabPymtHdr(Base):
    __tablename__ = "LabPymtHdr"
    LphCode = Column(Integer, primary_key=True, index=True)
    LphLhdCode = Column(Integer, ForeignKey("LabHdr.LhdCode"))
    LphDate = Column(Date, nullable=False)
    LphAmt = Column(Double, default=0.0)
    LphRecState = Column(SmallInteger, nullable=False, default=1)

class LabRefdHdr(Base):
    __tablename__ = "LabRefdHdr"
    LrhCode = Column(Integer, primary_key=True, index=True)
    LrhLhdCode = Column(Integer, ForeignKey("LabHdr.LhdCode"))
    LrhDate = Column(Date, nullable=False)
    LrhAmt = Column(Double, default=0.0)
    LrhRecState = Column(SmallInteger, nullable=False, default=1)
