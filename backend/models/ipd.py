from sqlalchemy import DateTime
from sqlalchemy.sql import func
from sqlalchemy import Column, Integer, String, Boolean, Double, SmallInteger, Date, ForeignKey, Text
from backend.database import Base

class IndrHdr(Base):
    __tablename__ = "IndrHdr"
    IhdCode = Column(Integer, primary_key=True, index=True)
    IhdVtmCode = Column(Integer)
    IhdPrefix = Column(String(10))
    IhdVchNo = Column(Integer, nullable=False)
    IhdDate = Column(Date, nullable=False)
    IhdTime = Column(Integer)
    IhdPttCode = Column(Integer, ForeignKey("PatMast.PttCode"), nullable=False)
    IhdCDctCode = Column(Integer, ForeignKey("DoctMast.DctCode"))
    IhdIpgCode = Column(Integer, ForeignKey("IndrReg.IpgCode"))
    IhdRByCode = Column(Integer, ForeignKey("RefByMast.RByCode"))
    IhdWrdCode = Column(Integer, ForeignKey("WardMast.WrdCode"))
    IhdBedCode = Column(Integer, ForeignKey("BedMast.BdmCode"))
    IhdFlrCode = Column(Integer, ForeignKey("FloorMast.FlrCode"))
    IhdAdvAmt = Column(Double, default=0.0)
    IhdDischDate = Column(Date)
    IhdDischTime = Column(Integer)
    IhdPDigCode = Column(Integer, ForeignKey("DiagMast.DigCode"))
    IhdFDigCode = Column(Integer, ForeignKey("DiagMast.DigCode"))
    IhdCmpCode = Column(Integer, ForeignKey("Company.CmpCode"))
    IhdStatus = Column(String(20), default='Admitted')
    IhdRemark = Column(String(50))
    IhdVoidFlag = Column(Boolean, default=False)
    IhdRecState = Column(SmallInteger, nullable=False, default=1)
    IhdCmpCode = Column(SmallInteger, nullable=False, default=1)

# Legacy: IBedState — Bed occupancy tracking
class IBedState(Base):
    __tablename__ = "IBedState"
    IbsCode = Column(Integer, primary_key=True, index=True, autoincrement=True)
    IbsSno = Column(SmallInteger)
    IbsVtmCode = Column(Integer)
    IbsPrefix = Column(String(10))
    IbsVchNo = Column(Integer)
    IbsPostfix = Column(String(10))
    IbsDate = Column(Date)
    IbsTime = Column(Integer)
    IbsIpgCode = Column(Integer, ForeignKey("IndrReg.IpgCode"))
    IbsBdmCode = Column(Integer, ForeignKey("BedMast.BdmCode"))
    IbsDischDate = Column(Date)
    IbsDischTime = Column(Integer)
    IbsPttCode = Column(Integer, ForeignKey("PatMast.PttCode"))
    IbsDischState = Column(SmallInteger)
    IbsLIbsCode = Column(Integer)
    IbsRemark = Column(String(50))
    IbsRecState = Column(SmallInteger, nullable=False, default=1)
    IbsCmpCode = Column(SmallInteger, nullable=False, default=1)

# Legacy: IndrBlHdr — IPD Bill Header
class IndrBlHdr(Base):
    __tablename__ = "IndrBlHdr"
    IbhCode = Column(Integer, primary_key=True, index=True)
    IbhVtmCode = Column(Integer)
    IbhPrefix = Column(String(10))
    IbhVchNo = Column(Integer, nullable=False)
    IbhDate = Column(Date, nullable=False)
    IbhIhdCode = Column(Integer, ForeignKey("IndrHdr.IhdCode"), nullable=False)
    IbhPttCode = Column(Integer, ForeignKey("PatMast.PttCode"), nullable=False)
    IbhBillType = Column(String(20))
    IbhDiscPer = Column(Double, default=0.0)
    IbhTotalAmt = Column(Double, default=0.0)
    IbhDepAmt = Column(Double, default=0.0)
    IbhRfugAmt = Column(Double, default=0.0)
    IbhBalAmt = Column(Double, default=0.0)
    IbhStatus = Column(String(20))
    IbhDischDate = Column(Date)
    IbhRemark = Column(String(50))
    IbhVoidFlag = Column(Boolean, default=False)
    IbhRecState = Column(SmallInteger, nullable=False, default=1)
    IbhCmpCode = Column(SmallInteger, nullable=False, default=1)

# Legacy: IndrBill — IPD Bill Line Items (service details)
class IndrBill(Base):
    __tablename__ = "IndrBill"
    IbdCode = Column(Integer, primary_key=True, index=True)
    IbdIbhCode = Column(Integer, ForeignKey("IndrBlHdr.IbhCode"), nullable=False)
    IbdSrvCode = Column(Integer, ForeignKey("ServMast.SrvCode"))
    IbdSno = Column(SmallInteger)
    IbdUnit = Column(Double, default=1.0)
    IbdRate = Column(Double, default=0.0)
    IbdAmtBefDisc = Column(Double, default=0.0)
    IbdDiscPer = Column(Double, default=0.0)
    IbdDiscAmt = Column(Double, default=0.0)
    IbdAmtAftDisc = Column(Double, default=0.0)
    IbdRecState = Column(SmallInteger, nullable=False, default=1)

# Legacy: IndrBlDctDtl — IPD Bill Doctor Detail
class IndrBlDctDtl(Base):
    __tablename__ = "IndrBlDctDtl"
    IddCode = Column(Integer, primary_key=True, index=True)
    IddIbhCode = Column(Integer, ForeignKey("IndrBlHdr.IbhCode"), nullable=False)
    IddDctCode = Column(Integer, ForeignKey("DoctMast.DctCode"))
    IddSharePer = Column(Double, default=0.0)
    IddShareAmt = Column(Double, default=0.0)
    IddRecState = Column(SmallInteger, nullable=False, default=1)

# Legacy: IndrBlPymtHdr — IPD Bill Payment Header
class IndrBlPymtHdr(Base):
    __tablename__ = "IndrBlPymtHdr"
    IbphCode = Column(Integer, primary_key=True, index=True, autoincrement=True)
    IbphIpgCode = Column(Integer, ForeignKey("IndrReg.IpgCode"))
    IbphVtmCode = Column(Integer)
    IbphPrefix = Column(String(10))
    IbphVchNo = Column(Integer)
    IbphPostfix = Column(String(10))
    IbphDate = Column(Date)
    IbphTime = Column(Integer)
    IbphOldIbphCode = Column(Integer)
    IbphPttCode = Column(Integer, ForeignKey("PatMast.PttCode"))
    IbphDepoAmt = Column(Double, default=0.0)
    IbphRemark = Column(String(50))
    IbphRecState = Column(SmallInteger, nullable=False, default=1)
    IbphCmpCode = Column(SmallInteger, nullable=False, default=1)

# Legacy: IndrBlPymtDtl — IPD Bill Payment Detail (deposit against a specific bill)
class IndrBlDpogDtl(Base):
    __tablename__ = "IndrBlPymtDtl"
    IbpyICode = Column(Integer, primary_key=True, index=True, autoincrement=True)
    IbpyCode = Column(Integer)
    IbpySno = Column(SmallInteger)
    IbpyDate = Column(Date)
    IbpyPttCode = Column(Integer, ForeignKey("PatMast.PttCode"))
    IbpyIbhCode = Column(Integer, ForeignKey("IndrBlHdr.IbhCode"))
    IbpyDepoAmt = Column(Double, default=0.0)
    IbpyRemark = Column(String(50))
    IbpyRecState = Column(SmallInteger, nullable=False, default=1)
    IbpyCmpCode = Column(SmallInteger, nullable=False, default=1)

# Legacy: IndrBlRefdHdr — IPD Bill Refund Header
class IndrBlRefdHdr(Base):
    __tablename__ = "IndrBlRefdHdr"
    IbfhCode = Column(Integer, primary_key=True, index=True, autoincrement=True)
    IbfhIpgCode = Column(Integer, ForeignKey("IndrReg.IpgCode"))
    IbfhVtmCode = Column(Integer)
    IbfhPrefix = Column(String(10))
    IbfhVchNo = Column(Integer)
    IbfhPostfix = Column(String(10))
    IbfhDate = Column(Date)
    IbfhTime = Column(Integer)
    IbfhOldIbfhCode = Column(Integer)
    IbfhPttCode = Column(Integer, ForeignKey("PatMast.PttCode"))
    IbfhRefuAmt = Column(Double, default=0.0)
    IbfhRemark = Column(String(50))
    IbfhRecState = Column(SmallInteger, nullable=False, default=1)
    IbfhCmpCode = Column(SmallInteger, nullable=False, default=1)

# Legacy: IndrBlRefdDtl — IPD Bill Refund Detail (refund against a specific bill)
class IndrBlRfugDtl(Base):
    __tablename__ = "IndrBlRefdDtl"
    IbfdICode = Column(Integer, primary_key=True, index=True, autoincrement=True)
    IbfdCode = Column(Integer)
    IbfdSno = Column(SmallInteger)
    IbfdDate = Column(Date)
    IbfdPttCode = Column(Integer, ForeignKey("PatMast.PttCode"))
    IbfdIbhCode = Column(Integer, ForeignKey("IndrBlHdr.IbhCode"))
    IbfdRefuAmt = Column(Double, default=0.0)
    IbfdRemark = Column(String(50))
    IbfdRecState = Column(SmallInteger, nullable=False, default=1)
    IbfdCmpCode = Column(SmallInteger, nullable=False, default=1)

# Legacy: IndrReg — IPD Registration (intermediate table linking admission to payments/refunds)
class IndrReg(Base):
    __tablename__ = "IndrReg"
    IpgCode = Column(Integer, primary_key=True, index=True, autoincrement=True)
    IpgVtmCode = Column(Integer)
    IpgPrefix = Column(String(10))
    IpgVchNo = Column(Integer)
    IpgPostfix = Column(String(10))
    IpgDate = Column(Date)
    IpgTime = Column(Integer)
    IpgOldIpgCode = Column(Integer)
    IpgCDctCode = Column(Integer, ForeignKey("DoctMast.DctCode"))
    IpgRByCode = Column(Integer)
    IpgRToCode = Column(Integer)
    IpgPttCode = Column(Integer, ForeignKey("PatMast.PttCode"))
    IpgPDigCode = Column(Integer, ForeignKey("DiagMast.DigCode"))
    IpgFDigCode = Column(Integer, ForeignKey("DiagMast.DigCode"))
    IpgBdmCode = Column(Integer, ForeignKey("BedMast.BdmCode"))
    IpgIbsCode = Column(Integer)
    IpgDischDate = Column(Date)
    IpgDischTime = Column(Integer)
    IpgAdvAmt = Column(Double, default=0.0)
    IpgRemark = Column(String(50))
    IpgRecState = Column(SmallInteger, nullable=False, default=1)
    IpgCmpCode = Column(SmallInteger, nullable=False, default=1)

# Legacy: IndrRgPymt — IPD Registration Payment (advance deposit)
class IndrRgPymt(Base):
    __tablename__ = "IndrRgPymt"
    IgtCode = Column(Integer, primary_key=True, index=True, autoincrement=True)
    IgtIpgCode = Column(Integer, ForeignKey("IndrReg.IpgCode"))
    IgtVtmCode = Column(Integer)
    IgtPrefix = Column(String(10))
    IgtVchNo = Column(Integer)
    IgtPostfix = Column(String(10))
    IgtDate = Column(Date)
    IgtTime = Column(Integer)
    IgtOldIgtCode = Column(Integer)
    IgtPttCode = Column(Integer, ForeignKey("PatMast.PttCode"))
    IgtDpogAmt = Column(Double, default=0.0)
    IgtAdjAmt = Column(Double, default=0.0)
    IgtBalAmt = Column(Double, default=0.0)
    IgtRemark = Column(String(50))
    IgtCmpCode = Column(SmallInteger, nullable=False, default=1)
    IgtRecState = Column(SmallInteger, nullable=False, default=1)

# Legacy: IndrRgRefd — IPD Registration Refund
class IndrRgRefd(Base):
    __tablename__ = "IndrRgRefd"
    IgfCode = Column(Integer, primary_key=True, index=True, autoincrement=True)
    IgfIpgCode = Column(Integer, ForeignKey("IndrReg.IpgCode"))
    IgfVtmCode = Column(Integer)
    IgfPrefix = Column(String(10))
    IgfVchNo = Column(Integer)
    IgfPostfix = Column(String(10))
    IgfDate = Column(Date)
    IgfTime = Column(Integer)
    IgfOldIgfCode = Column(Integer)
    IgfPttCode = Column(Integer, ForeignKey("PatMast.PttCode"))
    IgfRfugAmt = Column(Double, default=0.0)
    IgfAdjAmt = Column(Double, default=0.0)
    IgfBalAmt = Column(Double, default=0.0)
    IgfRemark = Column(String(50))
    IgfRecState = Column(SmallInteger, nullable=False, default=1)
    IgfCmpCode = Column(SmallInteger, nullable=False, default=1)



class IndrHdr_Log(Base):
    __tablename__ = "IndrHdr_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    IhdCode = Column(Integer)
    IhdVtmCode = Column(Integer)
    IhdPrefix = Column(String(10))
    IhdVchNo = Column(Integer, nullable=False)
    IhdDate = Column(Date, nullable=False)
    IhdTime = Column(Integer)
    IhdPttCode = Column(Integer, nullable=False)
    IhdCDctCode = Column(Integer)
    IhdRByCode = Column(Integer)
    IhdWrdCode = Column(Integer)
    IhdBedCode = Column(Integer)
    IhdFlrCode = Column(Integer)
    IhdAdvAmt = Column(Double, default=0.0)
    IhdDischDate = Column(Date)
    IhdDischTime = Column(Integer)
    IhdPDigCode = Column(Integer)
    IhdFDigCode = Column(Integer)
    IhdCmpCode = Column(Integer)
    IhdStatus = Column(String(20), default='Admitted')
    IhdRemark = Column(String(50))
    IhdVoidFlag = Column(Boolean, default=False)
    IhdRecState = Column(SmallInteger, nullable=False, default=1)
    IhdCmpCode = Column(SmallInteger, nullable=False, default=1)



class IBedState_Log(Base):
    __tablename__ = "IBedState_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    IbsCode = Column(Integer, autoincrement=True)
    IbsSno = Column(SmallInteger)
    IbsVtmCode = Column(Integer)
    IbsPrefix = Column(String(10))
    IbsVchNo = Column(Integer)
    IbsPostfix = Column(String(10))
    IbsDate = Column(Date)
    IbsTime = Column(Integer)
    IbsIpgCode = Column(Integer)
    IbsBdmCode = Column(Integer)
    IbsDischDate = Column(Date)
    IbsDischTime = Column(Integer)
    IbsPttCode = Column(Integer)
    IbsDischState = Column(SmallInteger)
    IbsLIbsCode = Column(Integer)
    IbsRemark = Column(String(50))
    IbsRecState = Column(SmallInteger, nullable=False, default=1)
    IbsCmpCode = Column(SmallInteger, nullable=False, default=1)



class IndrBlHdr_Log(Base):
    __tablename__ = "IndrBlHdr_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    IbhCode = Column(Integer)
    IbhVtmCode = Column(Integer)
    IbhPrefix = Column(String(10))
    IbhVchNo = Column(Integer, nullable=False)
    IbhDate = Column(Date, nullable=False)
    IbhIhdCode = Column(Integer, nullable=False)
    IbhPttCode = Column(Integer, nullable=False)
    IbhBillType = Column(String(20))
    IbhDiscPer = Column(Double, default=0.0)
    IbhTotalAmt = Column(Double, default=0.0)
    IbhDepAmt = Column(Double, default=0.0)
    IbhRfugAmt = Column(Double, default=0.0)
    IbhBalAmt = Column(Double, default=0.0)
    IbhStatus = Column(String(20))
    IbhDischDate = Column(Date)
    IbhRemark = Column(String(50))
    IbhVoidFlag = Column(Boolean, default=False)
    IbhRecState = Column(SmallInteger, nullable=False, default=1)
    IbhCmpCode = Column(SmallInteger, nullable=False, default=1)



class IndrBill_Log(Base):
    __tablename__ = "IndrBill_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    IbdCode = Column(Integer)
    IbdIbhCode = Column(Integer, nullable=False)
    IbdSrvCode = Column(Integer)
    IbdSno = Column(SmallInteger)
    IbdUnit = Column(Double, default=1.0)
    IbdRate = Column(Double, default=0.0)
    IbdAmtBefDisc = Column(Double, default=0.0)
    IbdDiscPer = Column(Double, default=0.0)
    IbdDiscAmt = Column(Double, default=0.0)
    IbdAmtAftDisc = Column(Double, default=0.0)
    IbdRecState = Column(SmallInteger, nullable=False, default=1)



class IndrBlDctDtl_Log(Base):
    __tablename__ = "IndrBlDctDtl_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    IddCode = Column(Integer)
    IddIbhCode = Column(Integer, nullable=False)
    IddDctCode = Column(Integer)
    IddSharePer = Column(Double, default=0.0)
    IddShareAmt = Column(Double, default=0.0)
    IddRecState = Column(SmallInteger, nullable=False, default=1)



class IndrBlPymtHdr_Log(Base):
    __tablename__ = "IndrBlPymtHdr_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    IbphCode = Column(Integer, autoincrement=True)
    IbphIpgCode = Column(Integer)
    IbphVtmCode = Column(Integer)
    IbphPrefix = Column(String(10))
    IbphVchNo = Column(Integer)
    IbphPostfix = Column(String(10))
    IbphDate = Column(Date)
    IbphTime = Column(Integer)
    IbphOldIbphCode = Column(Integer)
    IbphPttCode = Column(Integer)
    IbphDepoAmt = Column(Double, default=0.0)
    IbphRemark = Column(String(50))
    IbphRecState = Column(SmallInteger, nullable=False, default=1)
    IbphCmpCode = Column(SmallInteger, nullable=False, default=1)



class IndrBlDpogDtl_Log(Base):
    __tablename__ = "IndrBlPymtDtl_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    IbpyICode = Column(Integer, autoincrement=True)
    IbpyCode = Column(Integer)
    IbpySno = Column(SmallInteger)
    IbpyDate = Column(Date)
    IbpyPttCode = Column(Integer)
    IbpyIbhCode = Column(Integer)
    IbpyDepoAmt = Column(Double, default=0.0)
    IbpyRemark = Column(String(50))
    IbpyRecState = Column(SmallInteger, nullable=False, default=1)
    IbpyCmpCode = Column(SmallInteger, nullable=False, default=1)



class IndrBlRefdHdr_Log(Base):
    __tablename__ = "IndrBlRefdHdr_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    IbfhCode = Column(Integer, autoincrement=True)
    IbfhIpgCode = Column(Integer)
    IbfhVtmCode = Column(Integer)
    IbfhPrefix = Column(String(10))
    IbfhVchNo = Column(Integer)
    IbfhPostfix = Column(String(10))
    IbfhDate = Column(Date)
    IbfhTime = Column(Integer)
    IbfhOldIbfhCode = Column(Integer)
    IbfhPttCode = Column(Integer)
    IbfhRefuAmt = Column(Double, default=0.0)
    IbfhRemark = Column(String(50))
    IbfhRecState = Column(SmallInteger, nullable=False, default=1)
    IbfhCmpCode = Column(SmallInteger, nullable=False, default=1)



class IndrBlRfugDtl_Log(Base):
    __tablename__ = "IndrBlRefdDtl_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    IbfdICode = Column(Integer, autoincrement=True)
    IbfdCode = Column(Integer)
    IbfdSno = Column(SmallInteger)
    IbfdDate = Column(Date)
    IbfdPttCode = Column(Integer)
    IbfdIbhCode = Column(Integer)
    IbfdRefuAmt = Column(Double, default=0.0)
    IbfdRemark = Column(String(50))
    IbfdRecState = Column(SmallInteger, nullable=False, default=1)
    IbfdCmpCode = Column(SmallInteger, nullable=False, default=1)



class IndrReg_Log(Base):
    __tablename__ = "IndrReg_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    IpgCode = Column(Integer, autoincrement=True)
    IpgVtmCode = Column(Integer)
    IpgPrefix = Column(String(10))
    IpgVchNo = Column(Integer)
    IpgPostfix = Column(String(10))
    IpgDate = Column(Date)
    IpgTime = Column(Integer)
    IpgOldIpgCode = Column(Integer)
    IpgCDctCode = Column(Integer)
    IpgRByCode = Column(Integer)
    IpgRToCode = Column(Integer)
    IpgPttCode = Column(Integer)
    IpgPDigCode = Column(Integer)
    IpgFDigCode = Column(Integer)
    IpgBdmCode = Column(Integer)
    IpgIbsCode = Column(Integer)
    IpgDischDate = Column(Date)
    IpgDischTime = Column(Integer)
    IpgAdvAmt = Column(Double, default=0.0)
    IpgRemark = Column(String(50))
    IpgRecState = Column(SmallInteger, nullable=False, default=1)
    IpgCmpCode = Column(SmallInteger, nullable=False, default=1)



class IndrRgPymt_Log(Base):
    __tablename__ = "IndrRgPymt_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    IgtCode = Column(Integer, autoincrement=True)
    IgtIpgCode = Column(Integer)
    IgtVtmCode = Column(Integer)
    IgtPrefix = Column(String(10))
    IgtVchNo = Column(Integer)
    IgtPostfix = Column(String(10))
    IgtDate = Column(Date)
    IgtTime = Column(Integer)
    IgtOldIgtCode = Column(Integer)
    IgtPttCode = Column(Integer)
    IgtDpogAmt = Column(Double, default=0.0)
    IgtAdjAmt = Column(Double, default=0.0)
    IgtBalAmt = Column(Double, default=0.0)
    IgtRemark = Column(String(50))
    IgtCmpCode = Column(SmallInteger, nullable=False, default=1)
    IgtRecState = Column(SmallInteger, nullable=False, default=1)



class IndrRgRefd_Log(Base):
    __tablename__ = "IndrRgRefd_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    IgfCode = Column(Integer, autoincrement=True)
    IgfIpgCode = Column(Integer)
    IgfVtmCode = Column(Integer)
    IgfPrefix = Column(String(10))
    IgfVchNo = Column(Integer)
    IgfPostfix = Column(String(10))
    IgfDate = Column(Date)
    IgfTime = Column(Integer)
    IgfOldIgfCode = Column(Integer)
    IgfPttCode = Column(Integer)
    IgfRfugAmt = Column(Double, default=0.0)
    IgfAdjAmt = Column(Double, default=0.0)
    IgfBalAmt = Column(Double, default=0.0)
    IgfRemark = Column(String(50))
    IgfRecState = Column(SmallInteger, nullable=False, default=1)
    IgfCmpCode = Column(SmallInteger, nullable=False, default=1)



class IndrBlIbsDtl(Base):
    __tablename__ = "IndrBlIbsDtl"
    IbbsICode = Column(Integer, primary_key=True, index=True, autoincrement=True)
    IbbsCode = Column(Integer, ForeignKey("IndrBlHdr.IbhCode"), nullable=False)
    IbbsIblICode = Column(Integer, ForeignKey("IndrBill.IbdCode"), nullable=False)
    IbbsIpgCode = Column(Integer, ForeignKey("IndrReg.IpgCode"), nullable=False)
    IbbsIbsCode = Column(Integer, ForeignKey("IBedState.IbsCode"), nullable=False)
    IbbsSno = Column(SmallInteger)
    IbbsFromDate = Column(Date, nullable=False)
    IbbsFromTime = Column(Integer, nullable=False)
    IbbsToDate = Column(Date, nullable=False)
    IbbsToTime = Column(Integer, nullable=False)
    IbbsUnit = Column(SmallInteger, nullable=False)
    IbbsRemark = Column(String(100))
    IbbsRecState = Column(SmallInteger, nullable=False, default=1)
    IbbsCmpCode = Column(SmallInteger, nullable=False, default=1)



class IndrBlIbsDtl_Log(Base):
    __tablename__ = "IndrBlIbsDtl_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    IbbsICode = Column(Integer)
    IbbsCode = Column(Integer)
    IbbsIblICode = Column(Integer)
    IbbsIpgCode = Column(Integer)
    IbbsIbsCode = Column(Integer)
    IbbsSno = Column(SmallInteger)
    IbbsFromDate = Column(Date)
    IbbsFromTime = Column(Integer)
    IbbsToDate = Column(Date)
    IbbsToTime = Column(Integer)
    IbbsUnit = Column(SmallInteger)
    IbbsRemark = Column(String(100))
    IbbsRecState = Column(SmallInteger)
    IbbsCmpCode = Column(SmallInteger)


class IndrPymtHdr(Base):
    __tablename__ = "IndrPymtHdr"
    IphCode = Column(Integer, primary_key=True, index=True, autoincrement=True)
    IphIpgCode = Column(Integer, ForeignKey("IndrReg.IpgCode"), nullable=False)
    IphVtmCode = Column(Integer, nullable=False)
    IphPrefix = Column(String(5))
    IphVchNo = Column(Integer, nullable=False)
    IphPostfix = Column(String(5))
    IphDate = Column(Date, nullable=False)
    IphTime = Column(Integer, nullable=False)
    IphPttCode = Column(Integer, ForeignKey("PatMast.PttCode"), nullable=False)
    IphDepoAmt = Column(Double, default=0.0)
    IphRemark = Column(String(100))
    IphRecState = Column(SmallInteger, nullable=False, default=1)
    IphCmpCode = Column(SmallInteger, nullable=False, default=1)


class IndrPymtHdr_Log(Base):
    __tablename__ = "IndrPymtHdr_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    IphCode = Column(Integer)
    IphIpgCode = Column(Integer)
    IphVtmCode = Column(Integer)
    IphPrefix = Column(String(5))
    IphVchNo = Column(Integer)
    IphPostfix = Column(String(5))
    IphDate = Column(Date)
    IphTime = Column(Integer)
    IphPttCode = Column(Integer)
    IphDepoAmt = Column(Double)
    IphRemark = Column(String(100))
    IphRecState = Column(SmallInteger)
    IphCmpCode = Column(SmallInteger)


class IndrPymtDtl(Base):
    __tablename__ = "IndrPymtDtl"
    IpyICode = Column(Integer, primary_key=True, index=True, autoincrement=True)
    IpyCode = Column(Integer, ForeignKey("IndrPymtHdr.IphCode"), nullable=False)
    IpySno = Column(SmallInteger, nullable=False)
    IpyIrcCode = Column(Integer, ForeignKey("IndrHdr.IhdCode"), nullable=False)
    IpyDpogAmt = Column(Double, default=0.0)
    IpyAdjAmt = Column(Double, default=0.0)
    IpyBalAmt = Column(Double, default=0.0)
    IpyRemark = Column(String(100))
    IpyRecState = Column(SmallInteger, nullable=False, default=1)
    IpyCmpCode = Column(SmallInteger, nullable=False, default=1)


class IndrPymtDtl_Log(Base):
    __tablename__ = "IndrPymtDtl_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    IpyICode = Column(Integer)
    IpyCode = Column(Integer)
    IpySno = Column(SmallInteger)
    IpyIrcCode = Column(Integer)
    IpyDpogAmt = Column(Double)
    IpyAdjAmt = Column(Double)
    IpyBalAmt = Column(Double)
    IpyRemark = Column(String(100))
    IpyRecState = Column(SmallInteger)
    IpyCmpCode = Column(SmallInteger)


class IndrRefdHdr(Base):
    __tablename__ = "IndrRefdHdr"
    IfhCode = Column(Integer, primary_key=True, index=True, autoincrement=True)
    IfhIpgCode = Column(Integer, ForeignKey("IndrReg.IpgCode"), nullable=False)
    IfhVtmCode = Column(Integer, nullable=False)
    IfhPrefix = Column(String(5))
    IfhVchNo = Column(Integer, nullable=False)
    IfhPostfix = Column(String(5))
    IfhDate = Column(Date, nullable=False)
    IfhTime = Column(Integer, nullable=False)
    IfhPttCode = Column(Integer, ForeignKey("PatMast.PttCode"), nullable=False)
    IfhRefuAmt = Column(Double, default=0.0)
    IfhRemark = Column(String(100))
    IfhRecState = Column(SmallInteger, nullable=False, default=1)
    IfhCmpCode = Column(SmallInteger, nullable=False, default=1)


class IndrRefdHdr_Log(Base):
    __tablename__ = "IndrRefdHdr_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    IfhCode = Column(Integer)
    IfhIpgCode = Column(Integer)
    IfhVtmCode = Column(Integer)
    IfhPrefix = Column(String(5))
    IfhVchNo = Column(Integer)
    IfhPostfix = Column(String(5))
    IfhDate = Column(Date)
    IfhTime = Column(Integer)
    IfhPttCode = Column(Integer)
    IfhRefuAmt = Column(Double)
    IfhRemark = Column(String(100))
    IfhRecState = Column(SmallInteger)
    IfhCmpCode = Column(SmallInteger)


class IndrRefdDtl(Base):
    __tablename__ = "IndrRefdDtl"
    IfdICode = Column(Integer, primary_key=True, index=True, autoincrement=True)
    IfdCode = Column(Integer, ForeignKey("IndrRefdHdr.IfhCode"), nullable=False)
    IfdSno = Column(SmallInteger, nullable=False)
    IfdIrcCode = Column(Integer, ForeignKey("IndrHdr.IhdCode"), nullable=False)
    IfdDpogAmt = Column(Double, default=0.0)
    IfdAdjAmt = Column(Double, default=0.0)
    IfdBalAmt = Column(Double, default=0.0)
    IfdRemark = Column(String(100))
    IfdRecState = Column(SmallInteger, nullable=False, default=1)
    IfdCmpCode = Column(SmallInteger, nullable=False, default=1)


class IndrRefdDtl_Log(Base):
    __tablename__ = "IndrRefdDtl_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    IfdICode = Column(Integer)
    IfdCode = Column(Integer)
    IfdSno = Column(SmallInteger)
    IfdIrcCode = Column(Integer)
    IfdDpogAmt = Column(Double)
    IfdAdjAmt = Column(Double)
    IfdBalAmt = Column(Double)
    IfdRemark = Column(String(100))
    IfdRecState = Column(SmallInteger)
    IfdCmpCode = Column(SmallInteger)


class IndrClinHis(Base):
    __tablename__ = "IndrClinHis"
    IchCode = Column(Integer, primary_key=True, index=True, autoincrement=True)
    IchIpgCode = Column(Integer, ForeignKey("IndrReg.IpgCode"), nullable=False)
    IchDate = Column(Date, nullable=False)
    IchTime = Column(Integer, nullable=False, default=0)
    IchComplaints = Column(Text)
    IchHistory = Column(Text)
    IchAllergies = Column(Text)
    IchTemp = Column(Double, default=98.6)
    IchPulse = Column(Integer, default=72)
    IchBP = Column(String(20))
    IchSPO2 = Column(Integer, default=98)
    IchSystemic = Column(Text)
    IchDiagnosis = Column(Text)
    IchRecState = Column(SmallInteger, nullable=False, default=1)
    IchCmpCode = Column(SmallInteger, nullable=False, default=1)


class IndrDischSum(Base):
    __tablename__ = "IndrDischSum"
    IdsCode = Column(Integer, primary_key=True, index=True, autoincrement=True)
    IdsIpgCode = Column(Integer, ForeignKey("IndrReg.IpgCode"), nullable=False)
    IdsDate = Column(Date, nullable=False)
    IdsTime = Column(Integer, nullable=False, default=0)
    IdsComplaints = Column(Text)
    IdsFindings = Column(Text)
    IdsCourse = Column(Text)
    IdsCondition = Column(Text)
    IdsAdvice = Column(Text)
    IdsPrescription = Column(Text) # JSON string of medications list
    IdsFollowUpDate = Column(Date)
    IdsRecState = Column(SmallInteger, nullable=False, default=1)
    IdsCmpCode = Column(SmallInteger, nullable=False, default=1)
