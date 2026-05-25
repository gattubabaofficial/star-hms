from sqlalchemy import Column, Integer, String, Boolean, Double, SmallInteger, Date, ForeignKey
from sqlalchemy.orm import relationship
from backend.database import Base

class PatCatgMst(Base):
    __tablename__ = "PatCatgMst"
    
    PcgCode = Column(Integer, primary_key=True, index=True)
    PcgName = Column(String(50), nullable=False)
    PcgInfAllowed = Column(Boolean, nullable=False, default=False)
    PcgDefAllowed = Column(Boolean, nullable=False, default=False)
    PcgDiscAllowed = Column(Boolean, nullable=False, default=False)
    PcgDiscPer = Column(Double, nullable=False, default=0.0)
    PcgShowInList = Column(Boolean, nullable=False, default=True)
    PcgRecState = Column(SmallInteger, nullable=False, default=1)

class DoctCatgMst(Base):
    __tablename__ = "DoctCatgMst"
    DcgCode = Column(Integer, primary_key=True, index=True)
    DcgName = Column(String(50), nullable=False)
    DcgRecState = Column(SmallInteger, nullable=False, default=1)

class DoctRoleMst(Base):
    __tablename__ = "DoctRoleMst"
    DrlCode = Column(Integer, primary_key=True, index=True)
    DrlName = Column(String(50), nullable=False)
    DrlRecState = Column(SmallInteger, nullable=False, default=1)

class RefCatgMst(Base):
    __tablename__ = "RefCatgMst"
    RfgCode = Column(Integer, primary_key=True, index=True)
    RfgName = Column(String(50), nullable=False)
    RfgRecState = Column(SmallInteger, nullable=False, default=1)

class AreaMast(Base):
    __tablename__ = "AreaMast"
    AraCode = Column(Integer, primary_key=True, index=True)
    AraName = Column(String(50), nullable=False)
    AraRecState = Column(SmallInteger, nullable=False, default=1)

class StsnMast(Base):
    __tablename__ = "StsnMast"
    StnCode = Column(Integer, primary_key=True, index=True)
    StnName = Column(String(50), nullable=False)
    StnRecState = Column(SmallInteger, nullable=False, default=1)

class DiagMast(Base):
    __tablename__ = "DiagMast"
    DigCode = Column(Integer, primary_key=True, index=True)
    DigName = Column(String(100), nullable=False)
    DigRecState = Column(SmallInteger, nullable=False, default=1)

class FloorMast(Base):
    __tablename__ = "FloorMast"
    FlrCode = Column(Integer, primary_key=True, index=True)
    FlrName = Column(String(50), nullable=False)
    FlrShowInList = Column(Boolean, nullable=False, default=True)
    FlrRecState = Column(SmallInteger, nullable=False, default=1)

class WardMast(Base):
    __tablename__ = "WardMast"
    WrdCode = Column(Integer, primary_key=True, index=True)
    WrdName = Column(String(50), nullable=False)
    WrdRecState = Column(SmallInteger, nullable=False, default=1)

class ServGrpMst(Base):
    __tablename__ = "ServGrpMst"
    SgpCode = Column(Integer, primary_key=True, index=True)
    SgpName = Column(String(50), nullable=False)
    SgpIndex = Column(SmallInteger, default=0)
    SgpExpanded = Column(Boolean, default=False)
    SgpEditable = Column(Boolean, default=False)
    SgpInfAllowed = Column(Boolean, default=False)
    SgpDefAllowed = Column(Boolean, default=False)
    SgpDiscAllowed = Column(Boolean, default=False)
    SgpDiscPer = Column(Double, default=0.0)
    SgpExtRateSys = Column(Boolean, default=False)
    SgpDctwseRateSys = Column(Boolean, default=False)
    SgpPcgwseRateSys = Column(Boolean, default=False)
    SgpRBywseRateSys = Column(Boolean, default=False)
    SgpRTowseRateSys = Column(Boolean, default=False)
    SgpTimewseRateSys = Column(Boolean, default=False)
    SgpExtDiscSys = Column(Boolean, default=False)
    SgpDctwseDiscSys = Column(Boolean, default=False)
    SgpPcgwseDiscSys = Column(Boolean, default=False)
    SgpExtBargSys = Column(Boolean, default=False)
    SgpExtShareSys = Column(Boolean, default=False)
    SgpDctwseShareSys = Column(Boolean, default=False)
    SgpShowInList = Column(Boolean, default=True)
    SgpRecState = Column(SmallInteger, nullable=False, default=1)

class ServMast(Base):
    __tablename__ = "ServMast"
    SrvCode = Column(Integer, primary_key=True, index=True)
    SrvName = Column(String(100), nullable=False)
    SrvSgpCode = Column(Integer, ForeignKey("ServGrpMst.SgpCode"))
    SrvAhCode = Column(Integer)
    SrvCharges = Column(Double, default=0.0)
    SrvDiscPer = Column(Double, default=0.0)
    SrvIndex = Column(SmallInteger, default=0)
    SrvRateEditable = Column(Boolean, default=False)
    SrvAmtEditable = Column(Boolean, default=False)
    SrvUnitEditable = Column(Boolean, default=False)
    SrvMultiDct = Column(Boolean, default=False)
    SrvShowInList = Column(Boolean, default=True)
    SrvAutoInsIndr = Column(Boolean, default=False)
    SrvAutoInsOnceIndr = Column(Boolean, default=False)
    SrvAutoCalcIndr = Column(Boolean, default=False)
    SrvInfAllowed = Column(Boolean, default=False)
    SrvDefAllowed = Column(Boolean, default=False)
    SrvDiscAllowed = Column(Boolean, default=False)
    SrvExtRateSys = Column(Boolean, default=False)
    SrvExtDiscSys = Column(Boolean, default=False)
    SrvExtShareSys = Column(Boolean, default=False)
    SrvExtBargSys = Column(Boolean, default=False)
    SrvRecState = Column(SmallInteger, nullable=False, default=1)

class ServRateMst(Base):
    __tablename__ = "ServRateMst"
    SrmCode = Column(Integer, primary_key=True, index=True)
    SrmSrvCode = Column(Integer, ForeignKey("ServMast.SrvCode"))
    SrmRateType = Column(String(20), nullable=False)
    SrmRefCode = Column(Integer)
    SrmEffDate = Column(Date)
    SrmStartTime = Column(Integer)
    SrmEndTime = Column(Integer)
    SrmRate = Column(Double, default=0.0)
    SrmShare = Column(Double, default=0.0)
    SrmDiscPer = Column(Double, default=0.0)
    SrmBargPer = Column(Double, default=0.0)
    SrmRecState = Column(SmallInteger, nullable=False, default=1)

class DoctMast(Base):
    __tablename__ = "DoctMast"
    DctCode = Column(Integer, primary_key=True, index=True)
    DctTitle = Column(String(5))
    DctName = Column(String(50), nullable=False)
    DctSpeci = Column(String(50))
    DctDcgCode = Column(Integer, ForeignKey("DoctCatgMst.DcgCode"))
    DctDrlCode = Column(Integer, ForeignKey("DoctRoleMst.DrlCode"))
    DctAddr = Column(String(250))
    DctTelNo = Column(String(50))
    DctEmail = Column(String(50))
    DctAhCode = Column(Integer)
    DctShare = Column(Double, default=0.0)
    DctRecState = Column(SmallInteger, nullable=False, default=1)

class RefByMast(Base):
    __tablename__ = "RefByMast"
    RByCode = Column(Integer, primary_key=True, index=True)
    RByName = Column(String(50), nullable=False)
    RBySpeci = Column(String(50))
    RByRfgCode = Column(Integer, ForeignKey("RefCatgMst.RfgCode"))
    RByAddr = Column(String(250))
    RByTelNo = Column(String(50))
    RByEmail = Column(String(50))
    RByAhCode = Column(Integer)
    RByShare = Column(Double, default=0.0)
    RByRecState = Column(SmallInteger, nullable=False, default=1)

class RefToMast(Base):
    __tablename__ = "RefToMast"
    RToCode = Column(Integer, primary_key=True, index=True)
    RToName = Column(String(50), nullable=False)
    RToSpeci = Column(String(50))
    RToRfgCode = Column(Integer, ForeignKey("RefCatgMst.RfgCode"))
    RToAddr = Column(String(250))
    RToTelNo = Column(String(50))
    RToEmail = Column(String(50))
    RToAhCode = Column(Integer)
    RToShare = Column(Double, default=0.0)
    RToRecState = Column(SmallInteger, nullable=False, default=1)

class PatMast(Base):
    __tablename__ = "PatMast"
    PttCode = Column(Integer, primary_key=True, index=True)
    PttName = Column(String(60), nullable=False)
    PttRegNo = Column(Integer)
    PttRegDate = Column(Date)
    PttAhCode = Column(Integer)
    PttPcgCode = Column(Integer, ForeignKey("PatCatgMst.PcgCode"))
    PttSex = Column(String(10))
    PttAgeAsOnDt = Column(Date)
    PttDob = Column(Date)
    PttRefRela = Column(String(5))
    PttRefName = Column(String(60))
    PttAddr = Column(String(250))
    PttAraCode = Column(Integer, ForeignKey("AreaMast.AraCode"))
    PttStnCode = Column(Integer, ForeignKey("StsnMast.StnCode"))
    PttTelNo = Column(String(50))
    PttSMSNo = Column(String(50))
    PttEmail = Column(String(50))
    PttInfAllowed = Column(Boolean, default=False)
    PttDefAllowed = Column(Boolean, default=False)
    PttDiscAllowed = Column(Boolean, default=False)
    PttDiscPer = Column(Double, default=0.0)
    PttShowInList = Column(Boolean, default=True)
    PttRemark = Column(String(50))
    PttRecState = Column(SmallInteger, nullable=False, default=1)

class BedMast(Base):
    __tablename__ = "BedMast"
    BdmCode = Column(Integer, primary_key=True, index=True)
    BdmName = Column(String(50), nullable=False)
    BdmWrdCode = Column(Integer, ForeignKey("WardMast.WrdCode"))
    BdmFlrCode = Column(Integer, ForeignKey("FloorMast.FlrCode"))
    BdmCharges = Column(Double, default=0.0)
    BdmDiscPer = Column(Double, default=0.0)
    BdmDiscAllowed = Column(Boolean, default=False)
    BdmSrvCode = Column(Integer, ForeignKey("ServMast.SrvCode"))
    BdmFreeAllot = Column(Boolean, default=False)
    BdmChkTime = Column(Integer)
    BdmChkOutTimeBasis = Column(String(20))
    BdmIndex = Column(SmallInteger, default=0)
    BdmShowInList = Column(Boolean, default=True)
    BdmRemark = Column(String(50))
    BdmRecState = Column(SmallInteger, nullable=False, default=1)
