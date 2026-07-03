from sqlalchemy import (
    Column, Integer, SmallInteger, BigInteger, String, Text, Boolean,
    DateTime, Float, Numeric, LargeBinary,
)
from sqlalchemy.sql import func
from backend.database import Base

# Accounting masters (Accounts.Mdb) + Payroll masters (Payroll.Mdb) - exact legacy structure


from backend.models.accounts import VTypMast, AcntGrpMst, AchdMast, BnkrMast, NatioStateMast


class DeptMast(Base):
    __tablename__ = "DeptMast"
    DptCode = Column(Integer, primary_key=True, index=True)
    DptName = Column(String(50))
    DptRecState = Column(SmallInteger)


class DesgMast(Base):
    __tablename__ = "DesgMast"
    DsgCode = Column(Integer, primary_key=True, index=True)
    DsgName = Column(String(50))
    DsgRecState = Column(SmallInteger)


class EmpMast(Base):
    __tablename__ = "EmpMast"
    EmpCode = Column(Integer, primary_key=True, index=True)
    EmpName = Column(String(50))
    EmpAhCode = Column(Integer)
    EmpDptCode = Column(Integer)
    EmpDsgCode = Column(Integer)
    EmpJoinDate = Column(DateTime)
    EmpBSalary = Column(Float)
    EmpSelfPFPer = Column(Float)
    EmpSelfPFAmt = Column(Float)
    EmpSelfESICPer = Column(Float)
    EmpSelfESICAmt = Column(Float)
    EmpCoPFPer = Column(Float)
    EmpCoPFAmt = Column(Float)
    EmpHRAPer = Column(Float)
    EmpHRAAmt = Column(Float)
    EmpDAPer = Column(Float)
    EmpDAAmt = Column(Float)
    EmpNSalary = Column(Float)
    EmpWrkTime = Column(Integer)
    EmpHalfDayTime = Column(Integer)
    EmpMinWrkTime = Column(Integer)
    EmpAddOT = Column(Boolean)
    EmpCutUT = Column(Boolean)
    EmpMnLeaves = Column(Float)
    EmpYrLeaves = Column(Float)
    EmpWeeklyOff = Column(SmallInteger)
    EmpJobState = Column(SmallInteger)
    EmpSftCode = Column(SmallInteger)
    EmpRecState = Column(SmallInteger)


class HoliMast(Base):
    __tablename__ = "HoliMast"
    HlmCode = Column(Integer, primary_key=True, index=True)
    HlmDate = Column(DateTime)
    HlmName = Column(String(50))
    HlmRemark = Column(String(50))
    HlmRecState = Column(SmallInteger)


# ---- Audit log tables ----


class VTypMast_Log(Base):
    __tablename__ = "VTypMast_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    VtmCode = Column(Integer)
    VtmName = Column(String(50))
    VtmAbvr = Column(String(10))
    VtmSysCode = Column(SmallInteger)
    VtmEditable = Column(Boolean)
    VtmPrefix = Column(String(10))
    VtmPostfix = Column(String(10))
    VtmItmNarr = Column(String(250))
    VtmComNarr = Column(String(250))
    VtmStartNo = Column(Integer)
    VtmResetNoBasis = Column(SmallInteger)
    VtmIndex = Column(SmallInteger)
    VtmShowInList = Column(Boolean)
    VtmRecState = Column(SmallInteger)
    VtmPrntName = Column(String(50))
    VtmPrntCopies = Column(SmallInteger)
    VtmPymtMode = Column(String(15))
    VtmPrntFmtSpeci = Column(String(100))
    VtmStkMode = Column(SmallInteger)
    VtmSendSmsNos = Column(String(50))
    VtmAddNewSMS = Column(Boolean)
    VtmEditSMS = Column(Boolean)
    VtmDeleSMS = Column(Boolean)


class AcntGrpMst_Log(Base):
    __tablename__ = "AcntGrpMst_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    AcgCode = Column(Integer)
    AcgName = Column(String(60))
    AcgAbvr = Column(String(10))
    AcgSysCode = Column(SmallInteger)
    AcgBaseCode = Column(SmallInteger)
    AcgIndex = Column(SmallInteger)
    AcgDepends = Column(Integer)
    AcgRecState = Column(SmallInteger)


class AchdMast_Log(Base):
    __tablename__ = "AchdMast_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    AhCode = Column(Integer)
    AhName = Column(String(60))
    AhAcgCode = Column(Integer)
    AhDepends = Column(Integer)
    AhRecState = Column(SmallInteger)


class BnkrMast_Log(Base):
    __tablename__ = "BnkrMast_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    BkrCode = Column(Integer)
    BkrName = Column(String(50))
    BkrDesc = Column(String(50))
    BkrRecState = Column(SmallInteger)


class NatioStateMast_Log(Base):
    __tablename__ = "NatioStateMast_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    NstCode = Column(Integer)
    NstName = Column(String(50))
    NstRefCode = Column(String(2))
    NstRecState = Column(SmallInteger)


class DeptMast_Log(Base):
    __tablename__ = "DeptMast_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    DptCode = Column(Integer)
    DptName = Column(String(50))
    DptRecState = Column(SmallInteger)


class DesgMast_Log(Base):
    __tablename__ = "DesgMast_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    DsgCode = Column(Integer)
    DsgName = Column(String(50))
    DsgRecState = Column(SmallInteger)


class EmpMast_Log(Base):
    __tablename__ = "EmpMast_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    EmpCode = Column(Integer)
    EmpName = Column(String(50))
    EmpAhCode = Column(Integer)
    EmpDptCode = Column(Integer)
    EmpDsgCode = Column(Integer)
    EmpJoinDate = Column(DateTime)
    EmpBSalary = Column(Float)
    EmpSelfPFPer = Column(Float)
    EmpSelfPFAmt = Column(Float)
    EmpSelfESICPer = Column(Float)
    EmpSelfESICAmt = Column(Float)
    EmpCoPFPer = Column(Float)
    EmpCoPFAmt = Column(Float)
    EmpHRAPer = Column(Float)
    EmpHRAAmt = Column(Float)
    EmpDAPer = Column(Float)
    EmpDAAmt = Column(Float)
    EmpNSalary = Column(Float)
    EmpWrkTime = Column(Integer)
    EmpHalfDayTime = Column(Integer)
    EmpMinWrkTime = Column(Integer)
    EmpAddOT = Column(Boolean)
    EmpCutUT = Column(Boolean)
    EmpMnLeaves = Column(Float)
    EmpYrLeaves = Column(Float)
    EmpWeeklyOff = Column(SmallInteger)
    EmpJobState = Column(SmallInteger)
    EmpSftCode = Column(SmallInteger)
    EmpRecState = Column(SmallInteger)


class HoliMast_Log(Base):
    __tablename__ = "HoliMast_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    HlmCode = Column(Integer)
    HlmDate = Column(DateTime)
    HlmName = Column(String(50))
    HlmRemark = Column(String(50))
    HlmRecState = Column(SmallInteger)
