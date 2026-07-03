from sqlalchemy import Column, Integer, String, Boolean, SmallInteger, Double, DateTime, ForeignKey
from sqlalchemy.orm import relationship
from backend.database import Base


class AcntGrpMst(Base):
    __tablename__ = "AcntGrpMst"
    AcgCode = Column(Integer, primary_key=True, index=True)
    AcgName = Column(String(60), nullable=False)
    AcgAbvr = Column(String(10))
    AcgSysCode = Column(SmallInteger)
    AcgBaseCode = Column(SmallInteger)
    AcgIndex = Column(SmallInteger)
    AcgDepends = Column(Integer, ForeignKey("AcntGrpMst.AcgCode"), nullable=True)
    AcgRecState = Column(SmallInteger, nullable=False, default=1)

    parent = relationship("AcntGrpMst", remote_side=[AcgCode], backref="children")


class AchdMast(Base):
    __tablename__ = "AchdMast"
    AhCode = Column(Integer, primary_key=True, index=True)
    AhName = Column(String(60), nullable=False)
    AhDepends = Column(Integer, ForeignKey("AchdMast.AhCode"), nullable=True)
    AhRecState = Column(SmallInteger, nullable=False, default=1)
    AhAcgCode = Column(Integer, ForeignKey("AcntGrpMst.AcgCode"), nullable=True)

    parent = relationship("AchdMast", remote_side=[AhCode], backref="children")
    group = relationship("AcntGrpMst")


class BnkrMast(Base):
    __tablename__ = "BnkrMast"
    BkrCode = Column(Integer, primary_key=True, index=True)
    BkrName = Column(String(50), nullable=False)
    BkrDesc = Column(String(50), nullable=False)
    BkrRecState = Column(SmallInteger, nullable=False, default=1)


class NatioStateMast(Base):
    __tablename__ = "NatioStateMast"
    NstCode = Column(Integer, primary_key=True, index=True)
    NstName = Column(String(50))
    NstRefCode = Column(String(2))
    NstRecState = Column(SmallInteger, nullable=False, default=1)


class VTypMast(Base):
    __tablename__ = "VTypMast"
    VtmCode = Column(Integer, primary_key=True, index=True)
    VtmName = Column(String(50))
    VtmAbvr = Column(String(10))
    VtmSysCode = Column(SmallInteger)
    VtmEditable = Column(Boolean, nullable=False, default=True)
    VtmPrefix = Column(String(10))
    VtmPostfix = Column(String(10))
    VtmItmNarr = Column(String(250))
    VtmComNarr = Column(String(250))
    VtmStartNo = Column(Integer)
    VtmResetNoBasis = Column(SmallInteger)
    VtmIndex = Column(SmallInteger)
    VtmShowInList = Column(Boolean, nullable=False, default=True)
    VtmRecState = Column(SmallInteger, nullable=False, default=1)
    VtmPrntName = Column(String(50))
    VtmPrntCopies = Column(SmallInteger)
    VtmPymtMode = Column(String(15))
    VtmPrntFmtSpeci = Column(String(100))
    VtmStkMode = Column(SmallInteger)
    VtmSendSmsNos = Column(String(50))
    VtmAddNewSMS = Column(Boolean, nullable=False, default=False)
    VtmEditSMS = Column(Boolean, nullable=False, default=False)
    VtmDeleSMS = Column(Boolean, nullable=False, default=False)
    VtmNoDues = Column(Boolean, nullable=False, default=False)


class Journal(Base):
    __tablename__ = "Journal"
    JrnCode = Column(Integer, primary_key=True, index=True)
    JrnICode = Column(Integer, nullable=False, default=0)
    JrnSno = Column(SmallInteger)
    JrnVtmCode = Column(Integer, ForeignKey("VTypMast.VtmCode"))
    JrnPrefix = Column(String(10))
    JrnVchNo = Column(Integer)
    JrnPostfix = Column(String(10))
    JrnDate = Column(DateTime)
    JrnAhCode = Column(Integer, ForeignKey("AchdMast.AhCode"))       # Debit head
    JrnAmt = Column(Double)
    JrnNarr = Column(String(250))
    JrnLAhCode = Column(Integer, ForeignKey("AchdMast.AhCode"))      # Credit head
    JrnCmpCode = Column(Integer, ForeignKey("Company.CmpCode"))
    JrnAutoGen = Column(Boolean, nullable=False, default=False)
    JrnRecState = Column(SmallInteger, nullable=False, default=1)

    voucher_type = relationship("VTypMast")
    debit_head = relationship("AchdMast", foreign_keys=[JrnAhCode])
    credit_head = relationship("AchdMast", foreign_keys=[JrnLAhCode])
    company = relationship("Company")


class JrnHdr(Base):
    """Schema-parity only: source mdb has 0 rows and no companion detail table."""
    __tablename__ = "JrnHdr"
    JhrCode = Column(Integer, primary_key=True, index=True)
    JhrVtmCode = Column(Integer, ForeignKey("VTypMast.VtmCode"))
    JhrPrefix = Column(String(10))
    JhrVchNo = Column(Integer)
    JhrPostfix = Column(String(10))
    JhrDate = Column(DateTime)
    JhrAhCode = Column(Integer, ForeignKey("AchdMast.AhCode"))
    JhrAmt = Column(Double)
    JhrNarr = Column(String(250))
    JhrCmpCode = Column(Integer, ForeignKey("Company.CmpCode"))
    JhrAutoGen = Column(Boolean, nullable=False, default=False)
    JhrRecState = Column(SmallInteger, nullable=False, default=1)
