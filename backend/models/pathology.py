from sqlalchemy import (
    Column, Integer, SmallInteger, BigInteger, String, Text, Boolean,
    DateTime, Float, Numeric, LargeBinary,
)
from sqlalchemy.sql import func
from backend.database import Base

# Pathology / Lab masters (DiagMast.Mdb) - exact legacy structure


class TestDeptMast(Base):
    __tablename__ = "TestDeptMast"
    TdpCode = Column(Integer, primary_key=True, index=True)
    TdpName = Column(String(50))
    TdpPrintName = Column(String(250))
    TdpHdrNote = Column(String(250))
    TdpDtlNote = Column(String(250))
    TdpFtrNote = Column(String(250))
    TdpIndex = Column(SmallInteger)
    TdpShowInList = Column(Boolean)
    TdpRecState = Column(SmallInteger)


class TestGrpMast(Base):
    __tablename__ = "TestGrpMast"
    TgpCode = Column(Integer, primary_key=True, index=True)
    TgpName = Column(String(50))
    TgpPrintName = Column(String(250))
    TgpHdrNote = Column(String(250))
    TgpDtlNote = Column(String(250))
    TgpFtrNote = Column(String(250))
    TgpShowInList = Column(Boolean)
    TgpRecState = Column(SmallInteger)
    TgpIndex = Column(SmallInteger)


class TestMethodMast(Base):
    __tablename__ = "TestMethodMast"
    TmhCode = Column(Integer, primary_key=True, index=True)
    TmhName = Column(String(50))
    TmhShowInList = Column(Boolean)
    TmhRecState = Column(SmallInteger)
    TmhIndex = Column(SmallInteger)


class TestSampTypMast(Base):
    __tablename__ = "TestSampTypMast"
    TspCode = Column(Integer, primary_key=True, index=True)
    TspName = Column(String(50))
    TspIndex = Column(SmallInteger)
    TspShowInList = Column(Boolean)
    TspRecState = Column(SmallInteger)


class TestParaMast(Base):
    __tablename__ = "TestParaMast"
    TprCode = Column(Integer, primary_key=True, index=True)
    TprName = Column(String(50))
    TprPrintName = Column(String(250))
    TprTmhCode = Column(Integer)
    TprTgpCode = Column(Integer)
    TprTdpCode = Column(Integer)
    TprSrvCode = Column(Integer)
    TprRng1 = Column(Float)
    TprRng2 = Column(Float)
    TprRngUnit = Column(String(150))
    TprListValue = Column(String(250))
    TprRemark = Column(String(250))
    TprRngLowFontStyle = Column(String(25))
    TprRngHighFontStyle = Column(String(25))
    TprRngLowFontName = Column(String(50))
    TprRngHighFontName = Column(String(50))
    TprRngLowFontSize = Column(SmallInteger)
    TprRngHighFontSize = Column(SmallInteger)
    TprHdrNote = Column(String(250))
    TprDtlNote = Column(String(250))
    TprFtrNote = Column(String(250))
    TprIndex = Column(SmallInteger)
    TprShowInList = Column(Boolean)
    TprRecState = Column(SmallInteger)
    TprTspCode = Column(Integer)
    TprVtmCode = Column(Integer)
    TprTvcCode = Column(Integer)
    TprValueQExpr1 = Column(String(250))
    TprChkAutoValue = Column(Boolean)


class TestFmtMast(Base):
    __tablename__ = "TestFmtMast"
    TfmCode = Column(Integer, primary_key=True, index=True)
    TfmName = Column(String(50))
    TfmPrintName = Column(String(250))
    TfmHdrNote = Column(String(250))
    TfmDtlNote = Column(String(250))
    TfmFtrNote = Column(String(250))
    TfmRemark = Column(String(50))
    TfmIndex = Column(SmallInteger)
    TfmShowInList = Column(Boolean)
    TfmRecState = Column(SmallInteger)
    TfmTspCode = Column(Integer)
    TfmVtmCode = Column(Integer)
    TfmRepStyle = Column(String(25))
    TfmPrntDest = Column(SmallInteger)
    TfmFmtFileDesc = Column(String(250))
    TfmAutoGen = Column(Boolean)
    TfmDocFileDesc = Column(String(250))
    TfmNewPage = Column(Boolean)
    TfmMergeRepo = Column(Boolean)


class TestFmtDtl(Base):
    __tablename__ = "TestFmtDtl"
    TfdCode = Column(Integer)
    TfdICode = Column(Integer, primary_key=True, index=True)
    TfdSno = Column(SmallInteger)
    TfdTprCode = Column(Integer)
    TfdRemark = Column(String(250))
    TfdRecState = Column(SmallInteger)
    TfdDefValue = Column(String(250))
    TfdHdrNote = Column(String(250))
    TfdFtrNote = Column(String(250))
    TfdPrintRec = Column(Boolean)
    TfdDefNote1 = Column(String(250))
    TfdDefNote2 = Column(String(250))
    TfdDefNote3 = Column(String(250))
    TfdTgpCode = Column(Integer)
    TfdTdpCode = Column(Integer)


class TestValCalcMast(Base):
    __tablename__ = "TestValCalcMast"
    TvcCode = Column(Integer, primary_key=True, index=True)
    TvcName = Column(String(50))
    TvcTprCode = Column(Integer)
    TvcRemark = Column(String(250))
    TvcShowInList = Column(Boolean)
    TvcRecState = Column(SmallInteger)


class TestValCalcDtl(Base):
    __tablename__ = "TestValCalcDtl"
    TcdCode = Column(Integer)
    TcdICode = Column(Integer, primary_key=True, index=True)
    TcdSno = Column(SmallInteger)
    TcdTprCode = Column(Integer)
    TcdPrefix = Column(String(10))
    TcdPostfix = Column(String(10))
    TcdRecState = Column(SmallInteger)


class TestParaSrvMst(Base):
    __tablename__ = "TestParaSrvMst"
    TrsCode = Column(Integer)
    TrsICode = Column(Integer, primary_key=True, index=True)
    TrsSno = Column(SmallInteger)
    TrsSrvCode = Column(Integer)
    TrsRecState = Column(SmallInteger)


# ---- Audit log tables ----


class TestDeptMast_Log(Base):
    __tablename__ = "TestDeptMast_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    TdpCode = Column(Integer)
    TdpName = Column(String(50))
    TdpPrintName = Column(String(250))
    TdpHdrNote = Column(String(250))
    TdpDtlNote = Column(String(250))
    TdpFtrNote = Column(String(250))
    TdpIndex = Column(SmallInteger)
    TdpShowInList = Column(Boolean)
    TdpRecState = Column(SmallInteger)


class TestGrpMast_Log(Base):
    __tablename__ = "TestGrpMast_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    TgpCode = Column(Integer)
    TgpName = Column(String(50))
    TgpPrintName = Column(String(250))
    TgpHdrNote = Column(String(250))
    TgpDtlNote = Column(String(250))
    TgpFtrNote = Column(String(250))
    TgpShowInList = Column(Boolean)
    TgpRecState = Column(SmallInteger)
    TgpIndex = Column(SmallInteger)


class TestMethodMast_Log(Base):
    __tablename__ = "TestMethodMast_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    TmhCode = Column(Integer)
    TmhName = Column(String(50))
    TmhShowInList = Column(Boolean)
    TmhRecState = Column(SmallInteger)
    TmhIndex = Column(SmallInteger)


class TestSampTypMast_Log(Base):
    __tablename__ = "TestSampTypMast_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    TspCode = Column(Integer)
    TspName = Column(String(50))
    TspIndex = Column(SmallInteger)
    TspShowInList = Column(Boolean)
    TspRecState = Column(SmallInteger)


class TestParaMast_Log(Base):
    __tablename__ = "TestParaMast_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    TprCode = Column(Integer)
    TprName = Column(String(50))
    TprPrintName = Column(String(250))
    TprTmhCode = Column(Integer)
    TprTgpCode = Column(Integer)
    TprTdpCode = Column(Integer)
    TprSrvCode = Column(Integer)
    TprRng1 = Column(Float)
    TprRng2 = Column(Float)
    TprRngUnit = Column(String(150))
    TprListValue = Column(String(250))
    TprRemark = Column(String(250))
    TprRngLowFontStyle = Column(String(25))
    TprRngHighFontStyle = Column(String(25))
    TprRngLowFontName = Column(String(50))
    TprRngHighFontName = Column(String(50))
    TprRngLowFontSize = Column(SmallInteger)
    TprRngHighFontSize = Column(SmallInteger)
    TprHdrNote = Column(String(250))
    TprDtlNote = Column(String(250))
    TprFtrNote = Column(String(250))
    TprIndex = Column(SmallInteger)
    TprShowInList = Column(Boolean)
    TprRecState = Column(SmallInteger)
    TprTspCode = Column(Integer)
    TprVtmCode = Column(Integer)
    TprTvcCode = Column(Integer)
    TprValueQExpr1 = Column(String(250))
    TprChkAutoValue = Column(Boolean)


class TestFmtMast_Log(Base):
    __tablename__ = "TestFmtMast_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    TfmCode = Column(Integer)
    TfmName = Column(String(50))
    TfmPrintName = Column(String(250))
    TfmHdrNote = Column(String(250))
    TfmDtlNote = Column(String(250))
    TfmFtrNote = Column(String(250))
    TfmRemark = Column(String(50))
    TfmIndex = Column(SmallInteger)
    TfmShowInList = Column(Boolean)
    TfmRecState = Column(SmallInteger)
    TfmTspCode = Column(Integer)
    TfmVtmCode = Column(Integer)
    TfmRepStyle = Column(String(25))
    TfmPrntDest = Column(SmallInteger)
    TfmFmtFileDesc = Column(String(250))
    TfmAutoGen = Column(Boolean)
    TfmDocFileDesc = Column(String(250))
    TfmNewPage = Column(Boolean)
    TfmMergeRepo = Column(Boolean)


class TestFmtDtl_Log(Base):
    __tablename__ = "TestFmtDtl_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    TfdCode = Column(Integer)
    TfdICode = Column(Integer)
    TfdSno = Column(SmallInteger)
    TfdTprCode = Column(Integer)
    TfdRemark = Column(String(250))
    TfdRecState = Column(SmallInteger)
    TfdDefValue = Column(String(250))
    TfdHdrNote = Column(String(250))
    TfdFtrNote = Column(String(250))
    TfdPrintRec = Column(Boolean)
    TfdDefNote1 = Column(String(250))
    TfdDefNote2 = Column(String(250))
    TfdDefNote3 = Column(String(250))
    TfdTgpCode = Column(Integer)
    TfdTdpCode = Column(Integer)


class TestValCalcMast_Log(Base):
    __tablename__ = "TestValCalcMast_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    TvcCode = Column(Integer)
    TvcName = Column(String(50))
    TvcTprCode = Column(Integer)
    TvcRemark = Column(String(250))
    TvcShowInList = Column(Boolean)
    TvcRecState = Column(SmallInteger)


class TestValCalcDtl_Log(Base):
    __tablename__ = "TestValCalcDtl_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    TcdCode = Column(Integer)
    TcdICode = Column(Integer)
    TcdSno = Column(SmallInteger)
    TcdTprCode = Column(Integer)
    TcdPrefix = Column(String(10))
    TcdPostfix = Column(String(10))
    TcdRecState = Column(SmallInteger)


class TestParaSrvMst_Log(Base):
    __tablename__ = "TestParaSrvMst_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    TrsCode = Column(Integer)
    TrsICode = Column(Integer)
    TrsSno = Column(SmallInteger)
    TrsSrvCode = Column(Integer)
    TrsRecState = Column(SmallInteger)
