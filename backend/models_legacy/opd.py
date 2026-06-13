from sqlalchemy import DateTime
from sqlalchemy.sql import func
from sqlalchemy import Column, Integer, String, Boolean, Double, SmallInteger, Date, ForeignKey
from backend.database import Base

class OutdReg(Base):
    __tablename__ = "OutdReg"
    OpgCode = Column(Integer, primary_key=True, index=True)
    OpgVtmCode = Column(Integer)
    OpgPrefix = Column(String(10))
    OpgVchNo = Column(Integer, nullable=False)
    OpgPostfix = Column(String(10))
    OpgDate = Column(Date, nullable=False)
    OpgTime = Column(Integer)
    OpgOldOpgCode = Column(Integer)
    OpgCDctCode = Column(Integer, ForeignKey("DoctMast.DctCode"))
    OpgRByCode = Column(Integer, ForeignKey("RefByMast.RByCode"))
    OpgRToCode = Column(Integer, ForeignKey("RefToMast.RToCode"))
    OpgPttCode = Column(Integer, ForeignKey("PatMast.PttCode"), nullable=False)
    OpgPDigCode = Column(Integer, ForeignKey("DiagMast.DigCode"))
    OpgFDigCode = Column(Integer, ForeignKey("DiagMast.DigCode"))
    OpgSrvCode = Column(Integer, ForeignKey("ServMast.SrvCode"))
    OpgUnit = Column(Double, default=1.0)
    OpgRate = Column(Double, default=0.0)
    OpgAmtBefDisc = Column(Double, default=0.0)
    OpgDiscPer = Column(Double, default=0.0)
    OpgDiscAmt = Column(Double, default=0.0)
    OpgAmtAftDisc = Column(Double, default=0.0)
    OpgRfugAmt = Column(Double, default=0.0)
    OpgRemark = Column(String(50))
    OpgRecState = Column(SmallInteger, nullable=False, default=1)
    OpgCmpCode = Column(SmallInteger, nullable=False, default=1)

class OutdHdr(Base):
    __tablename__ = "OutdHdr"
    OhdCode = Column(Integer, primary_key=True, index=True)
    OhdVtmCode = Column(Integer)
    OhdPrefix = Column(String(10))
    OhdVchNo = Column(Integer, nullable=False)
    OhdDate = Column(Date, nullable=False)
    OhdTime = Column(Integer)
    OhdPttCode = Column(Integer, ForeignKey("PatMast.PttCode"), nullable=False)
    OhdCDctCode = Column(Integer, ForeignKey("DoctMast.DctCode"))
    OhdRByCode = Column(Integer, ForeignKey("RefByMast.RByCode"))
    OhdBillType = Column(String(20))
    OhdDiscPer = Column(Double, default=0.0)
    OhdDiscAmt = Column(Double, default=0.0)
    OhdTotalAmt = Column(Double, default=0.0)
    OhdDepAmt = Column(Double, default=0.0)
    OhdRfugAmt = Column(Double, default=0.0)
    OhdBalAmt = Column(Double, default=0.0)
    OhdRemark = Column(String(50))
    OhdVoidFlag = Column(Boolean, default=False)
    OhdRecState = Column(SmallInteger, nullable=False, default=1)
    OhdCmpCode = Column(SmallInteger, nullable=False, default=1)

class OutdBill(Base):
    __tablename__ = "OutdBill"
    ObdCode = Column(Integer, primary_key=True, index=True)
    ObdOhdCode = Column(Integer, ForeignKey("OutdHdr.OhdCode"), nullable=False)
    ObdSrvCode = Column(Integer, ForeignKey("ServMast.SrvCode"))
    ObdSno = Column(SmallInteger)
    ObdUnit = Column(Double, default=1.0)
    ObdRate = Column(Double, default=0.0)
    ObdAmtBefDisc = Column(Double, default=0.0)
    ObdDiscPer = Column(Double, default=0.0)
    ObdDiscAmt = Column(Double, default=0.0)
    ObdAmtAftDisc = Column(Double, default=0.0)
    ObdRecState = Column(SmallInteger, nullable=False, default=1)

class OutdBlDctDtl(Base):
    __tablename__ = "OutdBlDctDtl"
    OddCode = Column(Integer, primary_key=True, index=True)
    OddOhdCode = Column(Integer, ForeignKey("OutdHdr.OhdCode"), nullable=False)
    OddDctCode = Column(Integer, ForeignKey("DoctMast.DctCode"))
    OddSharePer = Column(Double, default=0.0)
    OddShareAmt = Column(Double, default=0.0)
    OddRecState = Column(SmallInteger, nullable=False, default=1)

class OutdBlPymtHdr(Base):
    __tablename__ = "OutdBlPymtHdr"
    ObpCode = Column(Integer, primary_key=True, index=True)
    ObpOhdCode = Column(Integer, ForeignKey("OutdHdr.OhdCode"))
    ObpDate = Column(Date, nullable=False)
    ObpAmt = Column(Double, default=0.0)
    ObpRecState = Column(SmallInteger, nullable=False, default=1)

class OutdBlRefdHdr(Base):
    __tablename__ = "OutdBlRefdHdr"
    ObrCode = Column(Integer, primary_key=True, index=True)
    ObrOhdCode = Column(Integer, ForeignKey("OutdHdr.OhdCode"))
    ObrDate = Column(Date, nullable=False)
    ObrAmt = Column(Double, default=0.0)
    ObrRecState = Column(SmallInteger, nullable=False, default=1)

class OutdRcpt(Base):
    __tablename__ = "OutdRcpt"
    OrcCode = Column(Integer, primary_key=True, index=True)
    OrcVtmCode = Column(Integer)
    OrcPrefix = Column(String(10))
    OrcVchNo = Column(Integer, nullable=False)
    OrcDate = Column(Date, nullable=False)
    OrcTime = Column(Integer)
    OrcPttCode = Column(Integer, ForeignKey("PatMast.PttCode"), nullable=False)
    OrcCDctCode = Column(Integer, ForeignKey("DoctMast.DctCode"))
    OrcRByCode = Column(Integer, ForeignKey("RefByMast.RByCode"))
    OrcReceiptType = Column(String(20))
    OrcDiscPer = Column(Double, default=0.0)
    OrcTotalAmt = Column(Double, default=0.0)
    OrcRecvdAmt = Column(Double, default=0.0)
    OrcRfugAmt = Column(Double, default=0.0)
    OrcBalAmt = Column(Double, default=0.0)
    OrcAdvAmt = Column(Double, default=0.0)
    OrcRemark = Column(String(50))
    OrcVoidFlag = Column(Boolean, default=False)
    OrcRecState = Column(SmallInteger, nullable=False, default=1)
    OrcCmpCode = Column(SmallInteger, nullable=False, default=1)

class OutdRcDctDtl(Base):
    __tablename__ = "OutdRcDctDtl"
    OrdCode = Column(Integer, primary_key=True, index=True)
    OrdOrcCode = Column(Integer, ForeignKey("OutdRcpt.OrcCode"), nullable=False)
    OrdDctCode = Column(Integer, ForeignKey("DoctMast.DctCode"))
    OrdSharePer = Column(Double, default=0.0)
    OrdRecState = Column(SmallInteger, nullable=False, default=1)

class OutdPymtHdr(Base):
    __tablename__ = "OutdPymtHdr"
    OphCode = Column(Integer, primary_key=True, index=True)
    OphOrcCode = Column(Integer, ForeignKey("OutdRcpt.OrcCode"))
    OphDate = Column(Date, nullable=False)
    OphAmt = Column(Double, default=0.0)
    OphRecState = Column(SmallInteger, nullable=False, default=1)

class OutdRefdHdr(Base):
    __tablename__ = "OutdRefdHdr"
    OrhCode = Column(Integer, primary_key=True, index=True)
    OrhOrcCode = Column(Integer, ForeignKey("OutdRcpt.OrcCode"))
    OrhDate = Column(Date, nullable=False)
    OrhAmt = Column(Double, default=0.0)
    OrhRecState = Column(SmallInteger, nullable=False, default=1)

class OutdRgRefd(Base):
    __tablename__ = "OutdRgRefd"
    OrrCode = Column(Integer, primary_key=True, index=True)
    OrrOpgCode = Column(Integer, ForeignKey("OutdReg.OpgCode"))
    OrrDate = Column(Date, nullable=False)
    OrrAmt = Column(Double, default=0.0)
    OrrRecState = Column(SmallInteger, nullable=False, default=1)



class OutdReg_Log(Base):
    __tablename__ = "OutdReg_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    OpgCode = Column(Integer)
    OpgVtmCode = Column(Integer)
    OpgPrefix = Column(String(10))
    OpgVchNo = Column(Integer, nullable=False)
    OpgPostfix = Column(String(10))
    OpgDate = Column(Date, nullable=False)
    OpgTime = Column(Integer)
    OpgOldOpgCode = Column(Integer)
    OpgCDctCode = Column(Integer)
    OpgRByCode = Column(Integer)
    OpgRToCode = Column(Integer)
    OpgPttCode = Column(Integer, nullable=False)
    OpgPDigCode = Column(Integer)
    OpgFDigCode = Column(Integer)
    OpgSrvCode = Column(Integer)
    OpgUnit = Column(Double, default=1.0)
    OpgRate = Column(Double, default=0.0)
    OpgAmtBefDisc = Column(Double, default=0.0)
    OpgDiscPer = Column(Double, default=0.0)
    OpgDiscAmt = Column(Double, default=0.0)
    OpgAmtAftDisc = Column(Double, default=0.0)
    OpgRfugAmt = Column(Double, default=0.0)
    OpgRemark = Column(String(50))
    OpgRecState = Column(SmallInteger, nullable=False, default=1)
    OpgCmpCode = Column(SmallInteger, nullable=False, default=1)



class OutdHdr_Log(Base):
    __tablename__ = "OutdHdr_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    OhdCode = Column(Integer)
    OhdVtmCode = Column(Integer)
    OhdPrefix = Column(String(10))
    OhdVchNo = Column(Integer, nullable=False)
    OhdDate = Column(Date, nullable=False)
    OhdTime = Column(Integer)
    OhdPttCode = Column(Integer, nullable=False)
    OhdCDctCode = Column(Integer)
    OhdRByCode = Column(Integer)
    OhdBillType = Column(String(20))
    OhdDiscPer = Column(Double, default=0.0)
    OhdDiscAmt = Column(Double, default=0.0)
    OhdTotalAmt = Column(Double, default=0.0)
    OhdDepAmt = Column(Double, default=0.0)
    OhdRfugAmt = Column(Double, default=0.0)
    OhdBalAmt = Column(Double, default=0.0)
    OhdRemark = Column(String(50))
    OhdVoidFlag = Column(Boolean, default=False)
    OhdRecState = Column(SmallInteger, nullable=False, default=1)
    OhdCmpCode = Column(SmallInteger, nullable=False, default=1)



class OutdBill_Log(Base):
    __tablename__ = "OutdBill_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    ObdCode = Column(Integer)
    ObdOhdCode = Column(Integer, nullable=False)
    ObdSrvCode = Column(Integer)
    ObdSno = Column(SmallInteger)
    ObdUnit = Column(Double, default=1.0)
    ObdRate = Column(Double, default=0.0)
    ObdAmtBefDisc = Column(Double, default=0.0)
    ObdDiscPer = Column(Double, default=0.0)
    ObdDiscAmt = Column(Double, default=0.0)
    ObdAmtAftDisc = Column(Double, default=0.0)
    ObdRecState = Column(SmallInteger, nullable=False, default=1)



class OutdBlDctDtl_Log(Base):
    __tablename__ = "OutdBlDctDtl_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    OddCode = Column(Integer)
    OddOhdCode = Column(Integer, nullable=False)
    OddDctCode = Column(Integer)
    OddSharePer = Column(Double, default=0.0)
    OddShareAmt = Column(Double, default=0.0)
    OddRecState = Column(SmallInteger, nullable=False, default=1)



class OutdBlPymtHdr_Log(Base):
    __tablename__ = "OutdBlPymtHdr_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    ObpCode = Column(Integer)
    ObpOhdCode = Column(Integer)
    ObpDate = Column(Date, nullable=False)
    ObpAmt = Column(Double, default=0.0)
    ObpRecState = Column(SmallInteger, nullable=False, default=1)



class OutdBlRefdHdr_Log(Base):
    __tablename__ = "OutdBlRefdHdr_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    ObrCode = Column(Integer)
    ObrOhdCode = Column(Integer)
    ObrDate = Column(Date, nullable=False)
    ObrAmt = Column(Double, default=0.0)
    ObrRecState = Column(SmallInteger, nullable=False, default=1)



class OutdRcpt_Log(Base):
    __tablename__ = "OutdRcpt_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    OrcCode = Column(Integer)
    OrcVtmCode = Column(Integer)
    OrcPrefix = Column(String(10))
    OrcVchNo = Column(Integer, nullable=False)
    OrcDate = Column(Date, nullable=False)
    OrcTime = Column(Integer)
    OrcPttCode = Column(Integer, nullable=False)
    OrcCDctCode = Column(Integer)
    OrcRByCode = Column(Integer)
    OrcReceiptType = Column(String(20))
    OrcDiscPer = Column(Double, default=0.0)
    OrcTotalAmt = Column(Double, default=0.0)
    OrcRecvdAmt = Column(Double, default=0.0)
    OrcRfugAmt = Column(Double, default=0.0)
    OrcBalAmt = Column(Double, default=0.0)
    OrcAdvAmt = Column(Double, default=0.0)
    OrcRemark = Column(String(50))
    OrcVoidFlag = Column(Boolean, default=False)
    OrcRecState = Column(SmallInteger, nullable=False, default=1)
    OrcCmpCode = Column(SmallInteger, nullable=False, default=1)



class OutdRcDctDtl_Log(Base):
    __tablename__ = "OutdRcDctDtl_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    OrdCode = Column(Integer)
    OrdOrcCode = Column(Integer, nullable=False)
    OrdDctCode = Column(Integer)
    OrdSharePer = Column(Double, default=0.0)
    OrdRecState = Column(SmallInteger, nullable=False, default=1)



class OutdPymtHdr_Log(Base):
    __tablename__ = "OutdPymtHdr_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    OphCode = Column(Integer)
    OphOrcCode = Column(Integer)
    OphDate = Column(Date, nullable=False)
    OphAmt = Column(Double, default=0.0)
    OphRecState = Column(SmallInteger, nullable=False, default=1)



class OutdRefdHdr_Log(Base):
    __tablename__ = "OutdRefdHdr_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    OrhCode = Column(Integer)
    OrhOrcCode = Column(Integer)
    OrhDate = Column(Date, nullable=False)
    OrhAmt = Column(Double, default=0.0)
    OrhRecState = Column(SmallInteger, nullable=False, default=1)



class OutdRgRefd_Log(Base):
    __tablename__ = "OutdRgRefd_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    OrrCode = Column(Integer)
    OrrOpgCode = Column(Integer)
    OrrDate = Column(Date, nullable=False)
    OrrAmt = Column(Double, default=0.0)
    OrrRecState = Column(SmallInteger, nullable=False, default=1)

