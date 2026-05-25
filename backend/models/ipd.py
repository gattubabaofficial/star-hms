from sqlalchemy import Column, Integer, String, Boolean, Double, SmallInteger, Date, ForeignKey
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
    IhdRByCode = Column(Integer, ForeignKey("RefByMast.RByCode"))
    IhdWrdCode = Column(Integer, ForeignKey("WardMast.WrdCode"))
    IhdBedCode = Column(Integer, ForeignKey("BedMast.BdmCode"))
    IhdFlrCode = Column(Integer, ForeignKey("FloorMast.FlrCode"))
    IhdAdvAmt = Column(Double, default=0.0)
    IhdDischDate = Column(Date)
    IhdDischTime = Column(Integer)
    IhdPDigCode = Column(Integer, ForeignKey("DiagMast.DigCode"))
    IhdFDigCode = Column(Integer, ForeignKey("DiagMast.DigCode"))
    IhdStatus = Column(String(20), default='Admitted')
    IhdRemark = Column(String(50))
    IhdVoidFlag = Column(Boolean, default=False)
    IhdRecState = Column(SmallInteger, nullable=False, default=1)
    IhdCmpCode = Column(SmallInteger, nullable=False, default=1)

class IBedState(Base):
    __tablename__ = "IBedState"
    IbbsCode = Column(Integer, primary_key=True, index=True)
    IbbsICode = Column(Integer, ForeignKey("IndrHdr.IhdCode"), nullable=False)
    IbbsIbsCode = Column(Integer, ForeignKey("BedMast.BdmCode"))
    IbbsFromDate = Column(Date)
    IbbsFromTime = Column(Integer)
    IbbsToDate = Column(Date)
    IbbsToTime = Column(Integer)
    IbbsUnit = Column(Double, default=1.0)
    IbbsIblICode = Column(Integer)
    IbbsIpgCode = Column(Integer)
    IbbsSno = Column(SmallInteger)
    IbbsTrnCode = Column(Integer)
    IbbsRemark = Column(String(50))
    IbbsRecState = Column(SmallInteger, nullable=False, default=1)

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

class IndrBlDctDtl(Base):
    __tablename__ = "IndrBlDctDtl"
    IddCode = Column(Integer, primary_key=True, index=True)
    IddIbhCode = Column(Integer, ForeignKey("IndrBlHdr.IbhCode"), nullable=False)
    IddDctCode = Column(Integer, ForeignKey("DoctMast.DctCode"))
    IddSharePer = Column(Double, default=0.0)
    IddShareAmt = Column(Double, default=0.0)
    IddRecState = Column(SmallInteger, nullable=False, default=1)

class IndrBlDpogDtl(Base):
    __tablename__ = "IndrBlDpogDtl"
    IpdCode = Column(Integer, primary_key=True, index=True)
    IpdIbhCode = Column(Integer, ForeignKey("IndrBlHdr.IbhCode"))
    IpdAmt = Column(Double, default=0.0)
    IpdDate = Column(Date)
    IpdRecState = Column(SmallInteger, nullable=False, default=1)

class IndrBlRfugDtl(Base):
    __tablename__ = "IndrBlRfugDtl"
    IrdCode = Column(Integer, primary_key=True, index=True)
    IrdIbhCode = Column(Integer, ForeignKey("IndrBlHdr.IbhCode"))
    IrdAmt = Column(Double, default=0.0)
    IrdDate = Column(Date)
    IrdRecState = Column(SmallInteger, nullable=False, default=1)

class IndrReg(Base):
    __tablename__ = "IndrReg"
    IrgCode = Column(Integer, primary_key=True, index=True)
    IrgIhdCode = Column(Integer, ForeignKey("IndrHdr.IhdCode"), nullable=False)
    IrgDate = Column(Date, nullable=False)
    IrgAmt = Column(Double, default=0.0)
    IrgType = Column(String(20))
    IrgRecState = Column(SmallInteger, nullable=False, default=1)

class IndrRgPymt(Base):
    __tablename__ = "IndrRgPymt"
    IrpCode = Column(Integer, primary_key=True, index=True)
    IrpIrgCode = Column(Integer, ForeignKey("IndrReg.IrgCode"))
    IrpDate = Column(Date, nullable=False)
    IrpAmt = Column(Double, default=0.0)
    IrpRecState = Column(SmallInteger, nullable=False, default=1)

class IndrRgRefd(Base):
    __tablename__ = "IndrRgRefd"
    IrrCode = Column(Integer, primary_key=True, index=True)
    IrrIrgCode = Column(Integer, ForeignKey("IndrReg.IrgCode"))
    IrrDate = Column(Date, nullable=False)
    IrrAmt = Column(Double, default=0.0)
    IrrRecState = Column(SmallInteger, nullable=False, default=1)
