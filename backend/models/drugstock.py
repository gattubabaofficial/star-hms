from sqlalchemy import (
    Column, Integer, SmallInteger, BigInteger, String, Text, Boolean,
    DateTime, Float, Numeric, LargeBinary,
)
from sqlalchemy.sql import func
from backend.database import Base

# Drug & Stock masters (DrugMast.Mdb / Stock.Mdb) - exact legacy structure


class MediMast(Base):
    __tablename__ = "MediMast"
    MpdCode = Column(Integer, primary_key=True, index=True)
    MpdName = Column(String(70))
    MpdDesc = Column(String(100))
    MpdRefNo = Column(String(10))
    MpdMcyCode = Column(Integer)
    MpdMgpCode = Column(Integer)
    MpdMpoCode = Column(Integer)
    MpdSrvCode = Column(Integer)
    MpdAhCode = Column(Integer)
    MpdPacking = Column(String(10))
    MpdLooseQty = Column(SmallInteger)
    MpdIndex = Column(SmallInteger)
    MpdShowInList = Column(Boolean)
    MpdRecState = Column(SmallInteger)


class MediGrpMst(Base):
    __tablename__ = "MediGrpMst"
    MgpCode = Column(Integer, primary_key=True, index=True)
    MgpName = Column(String(70))
    MgpDesc = Column(String(100))
    MgpIndex = Column(SmallInteger)
    MgpShowInList = Column(Boolean)
    MgpRecState = Column(SmallInteger)


class MediCpyMst(Base):
    __tablename__ = "MediCpyMst"
    McyCode = Column(Integer, primary_key=True, index=True)
    McyName = Column(String(70))
    McyDesc = Column(String(100))
    McyIndex = Column(SmallInteger)
    McyShowInList = Column(Boolean)
    McyRecState = Column(SmallInteger)


class MediCpoMst(Base):
    __tablename__ = "MediCpoMst"
    MpoCode = Column(Integer, primary_key=True, index=True)
    MpoName = Column(String(70))
    MpoDesc = Column(String(100))
    MpoScdH1 = Column(Boolean)
    MpoIndex = Column(SmallInteger)
    MpoShowInList = Column(Boolean)
    MpoRecState = Column(SmallInteger)


class ProdMast(Base):
    __tablename__ = "ProdMast"
    ItmCode = Column(Integer, primary_key=True, index=True)
    ItmName = Column(String(50))
    ItmDesc = Column(String(50))
    ItmDepends = Column(Integer)
    ItmRecState = Column(SmallInteger)


class ProdRef(Base):
    __tablename__ = "ProdRef"
    ItrRefCode = Column(Integer, primary_key=True, index=True)
    ItrItmCode = Column(Integer)
    ItrRef1Name = Column(String(25))
    ItrRef2Name = Column(String(25))
    ItrStkCode = Column(Integer)
    ItrStkICode = Column(Integer)
    ItrRate = Column(Float)
    ItrPRate = Column(Float)
    ItrMRP = Column(Float)
    ItrSRate = Column(Float)
    ItrCmpCode = Column(SmallInteger)
    ItrRecState = Column(SmallInteger)


class StockHdr(Base):
    __tablename__ = "StockHdr"
    ShrCode = Column(Integer, primary_key=True, index=True)
    ShrVtmCode = Column(Integer)
    ShrPrefix = Column(String(10))
    ShrVchNo = Column(Integer)
    ShrPostfix = Column(String(10))
    ShrDate = Column(DateTime)
    ShrQty = Column(Float)
    ShrValue = Column(Float)
    ShrNarr = Column(String(50))
    ShrAutoGen = Column(Boolean)
    ShrCmpCode = Column(SmallInteger)
    ShrRecState = Column(SmallInteger)


class StockJrn(Base):
    __tablename__ = "StockJrn"
    StkCode = Column(Integer)
    StkICode = Column(Integer, primary_key=True, index=True)
    StkSno = Column(SmallInteger)
    StkVtmCode = Column(Integer)
    StkPrefix = Column(String(10))
    StkVchNo = Column(Integer)
    StkPostfix = Column(String(10))
    StkDate = Column(DateTime)
    StkItmCode = Column(Integer)
    StkItmRefCode = Column(Integer)
    StkQty = Column(Float)
    StkRate = Column(Float)
    StkValue = Column(Float)
    StkNarr = Column(String(50))
    StkLItmCode = Column(Integer)
    StkAutoGen = Column(Boolean)
    StkCmpCode = Column(SmallInteger)
    StkRecState = Column(SmallInteger)


# ---- Audit log tables ----


class MediMast_Log(Base):
    __tablename__ = "MediMast_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    MpdCode = Column(Integer)
    MpdName = Column(String(70))
    MpdDesc = Column(String(100))
    MpdRefNo = Column(String(10))
    MpdMcyCode = Column(Integer)
    MpdMgpCode = Column(Integer)
    MpdMpoCode = Column(Integer)
    MpdSrvCode = Column(Integer)
    MpdAhCode = Column(Integer)
    MpdPacking = Column(String(10))
    MpdLooseQty = Column(SmallInteger)
    MpdIndex = Column(SmallInteger)
    MpdShowInList = Column(Boolean)
    MpdRecState = Column(SmallInteger)


class MediGrpMst_Log(Base):
    __tablename__ = "MediGrpMst_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    MgpCode = Column(Integer)
    MgpName = Column(String(70))
    MgpDesc = Column(String(100))
    MgpIndex = Column(SmallInteger)
    MgpShowInList = Column(Boolean)
    MgpRecState = Column(SmallInteger)


class MediCpyMst_Log(Base):
    __tablename__ = "MediCpyMst_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    McyCode = Column(Integer)
    McyName = Column(String(70))
    McyDesc = Column(String(100))
    McyIndex = Column(SmallInteger)
    McyShowInList = Column(Boolean)
    McyRecState = Column(SmallInteger)


class MediCpoMst_Log(Base):
    __tablename__ = "MediCpoMst_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    MpoCode = Column(Integer)
    MpoName = Column(String(70))
    MpoDesc = Column(String(100))
    MpoScdH1 = Column(Boolean)
    MpoIndex = Column(SmallInteger)
    MpoShowInList = Column(Boolean)
    MpoRecState = Column(SmallInteger)


class ProdMast_Log(Base):
    __tablename__ = "ProdMast_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    ItmCode = Column(Integer)
    ItmName = Column(String(50))
    ItmDesc = Column(String(50))
    ItmDepends = Column(Integer)
    ItmRecState = Column(SmallInteger)


class ProdRef_Log(Base):
    __tablename__ = "ProdRef_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    ItrRefCode = Column(Integer)
    ItrItmCode = Column(Integer)
    ItrRef1Name = Column(String(25))
    ItrRef2Name = Column(String(25))
    ItrStkCode = Column(Integer)
    ItrStkICode = Column(Integer)
    ItrRate = Column(Float)
    ItrPRate = Column(Float)
    ItrMRP = Column(Float)
    ItrSRate = Column(Float)
    ItrCmpCode = Column(SmallInteger)
    ItrRecState = Column(SmallInteger)


class StockHdr_Log(Base):
    __tablename__ = "StockHdr_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    ShrCode = Column(Integer)
    ShrVtmCode = Column(Integer)
    ShrPrefix = Column(String(10))
    ShrVchNo = Column(Integer)
    ShrPostfix = Column(String(10))
    ShrDate = Column(DateTime)
    ShrQty = Column(Float)
    ShrValue = Column(Float)
    ShrNarr = Column(String(50))
    ShrAutoGen = Column(Boolean)
    ShrCmpCode = Column(SmallInteger)
    ShrRecState = Column(SmallInteger)


class StockJrn_Log(Base):
    __tablename__ = "StockJrn_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    StkCode = Column(Integer)
    StkICode = Column(Integer)
    StkSno = Column(SmallInteger)
    StkVtmCode = Column(Integer)
    StkPrefix = Column(String(10))
    StkVchNo = Column(Integer)
    StkPostfix = Column(String(10))
    StkDate = Column(DateTime)
    StkItmCode = Column(Integer)
    StkItmRefCode = Column(Integer)
    StkQty = Column(Float)
    StkRate = Column(Float)
    StkValue = Column(Float)
    StkNarr = Column(String(50))
    StkLItmCode = Column(Integer)
    StkAutoGen = Column(Boolean)
    StkCmpCode = Column(SmallInteger)
    StkRecState = Column(SmallInteger)
