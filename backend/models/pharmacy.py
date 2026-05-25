from sqlalchemy import Column, Integer, String, Boolean, Double, SmallInteger, Date, ForeignKey
from backend.database import Base

class SubItmGrpMst(Base):
    __tablename__ = "SubItmGrpMst"
    SigCode = Column(Integer, primary_key=True, index=True)
    SigName = Column(String(50), nullable=False)
    SigRecState = Column(SmallInteger, nullable=False, default=1)

class SubItmMast(Base):
    __tablename__ = "SubItmMast"
    SimCode = Column(Integer, primary_key=True, index=True)
    SimName = Column(String(100), nullable=False)
    SimSigCode = Column(Integer, ForeignKey("SubItmGrpMst.SigCode"))
    SimRecState = Column(SmallInteger, nullable=False, default=1)

class PartyGrpMst(Base):
    __tablename__ = "PartyGrpMst"
    PgpCode = Column(Integer, primary_key=True, index=True)
    PgpName = Column(String(50), nullable=False)
    PgpRecState = Column(SmallInteger, nullable=False, default=1)

class PartyMast(Base):
    __tablename__ = "PartyMast"
    PtyCode = Column(Integer, primary_key=True, index=True)
    PtyName = Column(String(100), nullable=False)
    PtyAddr = Column(String(250))
    PtyAraCode = Column(Integer, ForeignKey("AreaMast.AraCode"))
    PtyTelNo = Column(String(50))
    PtySMSNo = Column(String(50))
    PtyPgpCode = Column(Integer, ForeignKey("PartyGrpMst.PgpCode"))
    PtyRecState = Column(SmallInteger, nullable=False, default=1)

class IndrStk(Base):
    __tablename__ = "IndrStk"
    IskCode = Column(Integer, primary_key=True, index=True)
    IskVtmCode = Column(Integer)
    IskVchNo = Column(Integer, nullable=False)
    IskDate = Column(Date, nullable=False)
    IskPtyCode = Column(Integer, ForeignKey("PartyMast.PtyCode"))
    IskRefNo = Column(String(30))
    IskRefDate = Column(Date)
    IskNetAmt = Column(Double, default=0.0)
    IskOtherChg = Column(Double, default=0.0)
    IskRoundOff = Column(Double, default=0.0)
    IskTax = Column(Double, default=0.0)
    IskRemark = Column(String(50))
    IskRecState = Column(SmallInteger, nullable=False, default=1)

class IndrStkDtl(Base):
    __tablename__ = "IndrStkDtl"
    IsdCode = Column(Integer, primary_key=True, index=True)
    IsdIskCode = Column(Integer, ForeignKey("IndrStk.IskCode"), nullable=False)
    IsdSimCode = Column(Integer, ForeignKey("SubItmMast.SimCode"))
    IsdSno = Column(SmallInteger)
    IsdQty = Column(Double, default=0.0)
    IsdRate = Column(Double, default=0.0)
    IsdDiscPer = Column(Double, default=0.0)
    IsdDiscAmt = Column(Double, default=0.0)
    IsdTaxPer = Column(Double, default=0.0)
    IsdTaxAmt = Column(Double, default=0.0)
    IsdAmt = Column(Double, default=0.0)
    IsdRecState = Column(SmallInteger, nullable=False, default=1)

class OutdStk(Base):
    __tablename__ = "OutdStk"
    OskCode = Column(Integer, primary_key=True, index=True)
    OskVtmCode = Column(Integer)
    OskVchNo = Column(Integer, nullable=False)
    OskDate = Column(Date, nullable=False)
    OskPtyCode = Column(Integer, ForeignKey("PartyMast.PtyCode"))
    OskRefNo = Column(String(30))
    OskNetAmt = Column(Double, default=0.0)
    OskOtherChg = Column(Double, default=0.0)
    OskRoundOff = Column(Double, default=0.0)
    OskTax = Column(Double, default=0.0)
    OskRemark = Column(String(50))
    OskRecState = Column(SmallInteger, nullable=False, default=1)

class OutdStkDtl(Base):
    __tablename__ = "OutdStkDtl"
    OsdCode = Column(Integer, primary_key=True, index=True)
    OsdOskCode = Column(Integer, ForeignKey("OutdStk.OskCode"), nullable=False)
    OsdSimCode = Column(Integer, ForeignKey("SubItmMast.SimCode"))
    OsdSno = Column(SmallInteger)
    OsdQty = Column(Double, default=0.0)
    OsdRate = Column(Double, default=0.0)
    OsdDiscPer = Column(Double, default=0.0)
    OsdDiscAmt = Column(Double, default=0.0)
    OsdTaxPer = Column(Double, default=0.0)
    OsdTaxAmt = Column(Double, default=0.0)
    OsdAmt = Column(Double, default=0.0)
    OsdRecState = Column(SmallInteger, nullable=False, default=1)
