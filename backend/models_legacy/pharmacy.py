from sqlalchemy import DateTime
from sqlalchemy.sql import func
from sqlalchemy import Column, Integer, String, Boolean, Double, SmallInteger, Date, ForeignKey
from backend.database import Base

class IndrStk(Base):
    __tablename__ = "IndrStk"
    IskCode = Column(Integer, primary_key=True, index=True)
    IskVtmCode = Column(Integer)
    IskVchNo = Column(Integer, nullable=False)
    IskDate = Column(Date, nullable=False)
    IskPtyCode = Column(Integer, ForeignKey("PartyMast.PrtCode"))
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
    IsdBatchNo = Column(String(50))
    IsdExpiryDate = Column(Date)
    IsdMRP = Column(Double, default=0.0)
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
    OskPtyCode = Column(Integer, ForeignKey("PartyMast.PrtCode"))
    OskPatCode = Column(Integer, ForeignKey("PatMast.PttCode"))
    OskDocCode = Column(Integer, ForeignKey("DoctMast.DctCode"))
    OskCustomerName = Column(String(100))
    OskCustomerPhone = Column(String(20))
    OskRefNo = Column(String(30))
    OskPaymentMode = Column(String(20), default='Cash')
    OskPaidAmt = Column(Double, default=0.0)
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
    OsdBatchNo = Column(String(50))
    OsdQty = Column(Double, default=0.0)
    OsdRate = Column(Double, default=0.0)
    OsdDiscPer = Column(Double, default=0.0)
    OsdDiscAmt = Column(Double, default=0.0)
    OsdTaxPer = Column(Double, default=0.0)
    OsdTaxAmt = Column(Double, default=0.0)
    OsdAmt = Column(Double, default=0.0)
    OsdRecState = Column(SmallInteger, nullable=False, default=1)



class IndrStk_Log(Base):
    __tablename__ = "IndrStk_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    IskCode = Column(Integer)
    IskVtmCode = Column(Integer)
    IskVchNo = Column(Integer, nullable=False)
    IskDate = Column(Date, nullable=False)
    IskPtyCode = Column(Integer)
    IskRefNo = Column(String(30))
    IskRefDate = Column(Date)
    IskNetAmt = Column(Double, default=0.0)
    IskOtherChg = Column(Double, default=0.0)
    IskRoundOff = Column(Double, default=0.0)
    IskTax = Column(Double, default=0.0)
    IskRemark = Column(String(50))
    IskRecState = Column(SmallInteger, nullable=False, default=1)



class IndrStkDtl_Log(Base):
    __tablename__ = "IndrStkDtl_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    IsdCode = Column(Integer)
    IsdIskCode = Column(Integer, nullable=False)
    IsdSimCode = Column(Integer)
    IsdSno = Column(SmallInteger)
    IsdBatchNo = Column(String(50))
    IsdExpiryDate = Column(Date)
    IsdMRP = Column(Double, default=0.0)
    IsdQty = Column(Double, default=0.0)
    IsdRate = Column(Double, default=0.0)
    IsdDiscPer = Column(Double, default=0.0)
    IsdDiscAmt = Column(Double, default=0.0)
    IsdTaxPer = Column(Double, default=0.0)
    IsdTaxAmt = Column(Double, default=0.0)
    IsdAmt = Column(Double, default=0.0)
    IsdRecState = Column(SmallInteger, nullable=False, default=1)



class OutdStk_Log(Base):
    __tablename__ = "OutdStk_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    OskCode = Column(Integer)
    OskVtmCode = Column(Integer)
    OskVchNo = Column(Integer, nullable=False)
    OskDate = Column(Date, nullable=False)
    OskPtyCode = Column(Integer)
    OskPatCode = Column(Integer)
    OskDocCode = Column(Integer)
    OskCustomerName = Column(String(100))
    OskCustomerPhone = Column(String(20))
    OskRefNo = Column(String(30))
    OskPaymentMode = Column(String(20), default='Cash')
    OskPaidAmt = Column(Double, default=0.0)
    OskNetAmt = Column(Double, default=0.0)
    OskOtherChg = Column(Double, default=0.0)
    OskRoundOff = Column(Double, default=0.0)
    OskTax = Column(Double, default=0.0)
    OskRemark = Column(String(50))
    OskRecState = Column(SmallInteger, nullable=False, default=1)



class OutdStkDtl_Log(Base):
    __tablename__ = "OutdStkDtl_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    OsdCode = Column(Integer)
    OsdOskCode = Column(Integer, nullable=False)
    OsdSimCode = Column(Integer)
    OsdSno = Column(SmallInteger)
    OsdBatchNo = Column(String(50))
    OsdQty = Column(Double, default=0.0)
    OsdRate = Column(Double, default=0.0)
    OsdDiscPer = Column(Double, default=0.0)
    OsdDiscAmt = Column(Double, default=0.0)
    OsdTaxPer = Column(Double, default=0.0)
    OsdTaxAmt = Column(Double, default=0.0)
    OsdAmt = Column(Double, default=0.0)
    OsdRecState = Column(SmallInteger, nullable=False, default=1)

