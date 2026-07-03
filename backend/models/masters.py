from sqlalchemy import DateTime
from sqlalchemy.sql import func
from sqlalchemy import Column, Integer, String, Boolean, Double, SmallInteger, Date, ForeignKey, Float
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
    PcgType = Column(String(50), nullable=True)


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
    AraStnCode = Column(Integer, ForeignKey("StsnMast.StnCode"))
    AraRecState = Column(SmallInteger, nullable=False, default=1)

class StsnMast(Base):
    __tablename__ = "StsnMast"
    StnCode = Column(Integer, primary_key=True, index=True)
    StnName = Column(String(50), nullable=False)
    StnShowInList = Column(Boolean, nullable=False, default=True)
    StnRecState = Column(SmallInteger, nullable=False, default=1)

class DiagMast(Base):
    __tablename__ = "DiagMast"
    DigCode = Column(Integer, primary_key=True, index=True)
    DigName = Column(String(100), nullable=False)
    DigRecState = Column(SmallInteger, nullable=False, default=1)

class DiagSrvMst(Base):
    __tablename__ = "DiagSrvMst"
    DsmCode = Column(Integer, primary_key=True, index=True)
    DsmDigCode = Column(Integer, ForeignKey("DiagMast.DigCode"), nullable=False)
    DsmSrvCode = Column(Integer, ForeignKey("ServMast.SrvCode"), nullable=False)
    DsmUnit = Column(Integer, nullable=False, default=1)
    DsmRate = Column(Float, nullable=False, default=0.0)
    
    diagnosis = relationship("DiagMast", backref="services")
    service = relationship("ServMast")

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
    WrdShowInList = Column(Boolean, nullable=False, default=True)
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
    SgpRBywseDiscSys = Column(Boolean, default=False)
    SgpRTowseDiscSys = Column(Boolean, default=False)
    SgpTimewseDiscSys = Column(Boolean, default=False)
    SgpExtBargSys = Column(Boolean, default=False)
    SgpDctwseBargSys = Column(Boolean, default=False)
    SgpPcgwseBargSys = Column(Boolean, default=False)
    SgpRBywseBargSys = Column(Boolean, default=False)
    SgpRTowseBargSys = Column(Boolean, default=False)
    SgpTimewseBargSys = Column(Boolean, default=False)
    SgpExtShareSys = Column(Boolean, default=False)
    SgpDctwseShareSys = Column(Boolean, default=False)
    SgpPcgwseShareSys = Column(Boolean, default=False)
    SgpRBywseShareSys = Column(Boolean, default=False)
    SgpRTowseShareSys = Column(Boolean, default=False)
    SgpTimewseShareSys = Column(Boolean, default=False)
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
    SrvDctwseRateSys = Column(Boolean, default=False)
    SrvPcgwseRateSys = Column(Boolean, default=False)
    SrvRBywseRateSys = Column(Boolean, default=False)
    SrvRTowseRateSys = Column(Boolean, default=False)
    SrvTimewseRateSys = Column(Boolean, default=False)
    SrvExtDiscSys = Column(Boolean, default=False)
    SrvDctwseDiscSys = Column(Boolean, default=False)
    SrvPcgwseDiscSys = Column(Boolean, default=False)
    SrvRBywseDiscSys = Column(Boolean, default=False)
    SrvRTowseDiscSys = Column(Boolean, default=False)
    SrvTimewseDiscSys = Column(Boolean, default=False)
    SrvExtBargSys = Column(Boolean, default=False)
    SrvDctwseBargSys = Column(Boolean, default=False)
    SrvPcgwseBargSys = Column(Boolean, default=False)
    SrvRBywseBargSys = Column(Boolean, default=False)
    SrvRTowseBargSys = Column(Boolean, default=False)
    SrvTimewseBargSys = Column(Boolean, default=False)
    SrvExtShareSys = Column(Boolean, default=False)
    SrvDctwseShareSys = Column(Boolean, default=False)
    SrvPcgwseShareSys = Column(Boolean, default=False)
    SrvRBywseShareSys = Column(Boolean, default=False)
    SrvRTowseShareSys = Column(Boolean, default=False)
    SrvTimewseShareSys = Column(Boolean, default=False)
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
    DctOpdChg = Column(Double, default=0.0)
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
    
    ward = relationship("WardMast")
    floor = relationship("FloorMast")

class BedSrvMst(Base):
    __tablename__ = "BedSrvMst"
    BsmICode = Column(Integer, primary_key=True, autoincrement=True)
    BsmCode = Column(Integer, ForeignKey("BedMast.BdmCode"), nullable=False)
    BsmSno = Column(SmallInteger, nullable=False)
    BsmSrvCode = Column(Integer, ForeignKey("ServMast.SrvCode"), nullable=False)
    BsmUnit = Column(Double, nullable=False, default=1.0)
    BsmRate = Column(Double, nullable=False, default=0.0)
    BsmRecState = Column(SmallInteger, nullable=False, default=1)
    
    bed = relationship("BedMast")
    service = relationship("ServMast")

class PartyGrpMst(Base):
    __tablename__ = "PartyGrpMst"
    PgmCode = Column(Integer, primary_key=True, autoincrement=True)
    PgmName = Column(String(50), nullable=False)
    PgmDesc = Column(String(50))
    PgmRecState = Column(SmallInteger, nullable=False, default=1)

class PartyMast(Base):
    __tablename__ = "PartyMast"
    PrtCode = Column(Integer, primary_key=True, autoincrement=True)
    PrtTitle = Column(String(10))
    PrtName = Column(String(50), nullable=False)
    PrtPgmCode = Column(Integer, ForeignKey("PartyGrpMst.PgmCode"), nullable=False)
    PrtAhCode = Column(Integer)
    PrtAddr = Column(String(250))
    PrtAraCode = Column(Integer, ForeignKey("AreaMast.AraCode"))
    PrtStnCode = Column(Integer, ForeignKey("StsnMast.StnCode"))
    PrtTelNo = Column(String(50))
    PrtSMSNo = Column(String(50))
    PrtEmail = Column(String(50))
    PrtShowInList = Column(Boolean, default=True)
    PrtRemark = Column(String(50))
    PrtRecState = Column(SmallInteger, nullable=False, default=1)
    
    group = relationship("PartyGrpMst")

class SubItmGrpMst(Base):
    __tablename__ = "SubItmGrpMst"
    SigCode = Column(Integer, primary_key=True, autoincrement=True)
    SigName = Column(String(50), nullable=False)
    SigDesc = Column(String(50))
    SigRecState = Column(SmallInteger, nullable=False, default=1)

class SubItmMast(Base):
    __tablename__ = "SubItmMast"
    SimCode = Column(Integer, primary_key=True, autoincrement=True)
    SimName = Column(String(50), nullable=False)
    SimDesc = Column(String(50))
    SimSigCode = Column(Integer, ForeignKey("SubItmGrpMst.SigCode"), nullable=False)
    SimPurchRate = Column(Double, nullable=False, default=0.0)
    SimMRPRate = Column(Double, nullable=False, default=0.0)
    SimSaleRate = Column(Double, nullable=False, default=0.0)
    SimItmCode = Column(Integer, default=0)
    SimRecState = Column(SmallInteger, nullable=False, default=1)
    
    group = relationship("SubItmGrpMst")



class PatCatgMst_Log(Base):
    __tablename__ = "PatCatgMst_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    
    PcgCode = Column(Integer)
    PcgName = Column(String(50), nullable=False)
    PcgInfAllowed = Column(Boolean, nullable=False, default=False)
    PcgDefAllowed = Column(Boolean, nullable=False, default=False)
    PcgDiscAllowed = Column(Boolean, nullable=False, default=False)
    PcgDiscPer = Column(Double, nullable=False, default=0.0)
    PcgShowInList = Column(Boolean, nullable=False, default=True)
    PcgRecState = Column(SmallInteger, nullable=False, default=1)
    PcgType = Column(String(50), nullable=True)




class DoctCatgMst_Log(Base):
    __tablename__ = "DoctCatgMst_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    DcgCode = Column(Integer)
    DcgName = Column(String(50), nullable=False)
    DcgRecState = Column(SmallInteger, nullable=False, default=1)



class DoctRoleMst_Log(Base):
    __tablename__ = "DoctRoleMst_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    DrlCode = Column(Integer)
    DrlName = Column(String(50), nullable=False)
    DrlRecState = Column(SmallInteger, nullable=False, default=1)



class RefCatgMst_Log(Base):
    __tablename__ = "RefCatgMst_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    RfgCode = Column(Integer)
    RfgName = Column(String(50), nullable=False)
    RfgRecState = Column(SmallInteger, nullable=False, default=1)



class AreaMast_Log(Base):
    __tablename__ = "AreaMast_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    AraCode = Column(Integer)
    AraName = Column(String(50), nullable=False)
    AraStnCode = Column(Integer)
    AraRecState = Column(SmallInteger, nullable=False, default=1)



class StsnMast_Log(Base):
    __tablename__ = "StsnMast_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    StnCode = Column(Integer)
    StnName = Column(String(50), nullable=False)
    StnShowInList = Column(Boolean, nullable=False, default=True)
    StnRecState = Column(SmallInteger, nullable=False, default=1)



class DiagMast_Log(Base):
    __tablename__ = "DiagMast_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    DigCode = Column(Integer)
    DigName = Column(String(100), nullable=False)
    DigRecState = Column(SmallInteger, nullable=False, default=1)



class DiagSrvMst_Log(Base):
    __tablename__ = "DiagSrvMst_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    DsmCode = Column(Integer)
    DsmDigCode = Column(Integer, nullable=False)
    DsmSrvCode = Column(Integer, nullable=False)
    DsmUnit = Column(Integer, nullable=False, default=1)
    DsmRate = Column(Float, nullable=False, default=0.0)
    



class FloorMast_Log(Base):
    __tablename__ = "FloorMast_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    FlrCode = Column(Integer)
    FlrName = Column(String(50), nullable=False)
    FlrShowInList = Column(Boolean, nullable=False, default=True)
    FlrRecState = Column(SmallInteger, nullable=False, default=1)



class WardMast_Log(Base):
    __tablename__ = "WardMast_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    WrdCode = Column(Integer)
    WrdName = Column(String(50), nullable=False)
    WrdShowInList = Column(Boolean, nullable=False, default=True)
    WrdRecState = Column(SmallInteger, nullable=False, default=1)



class ServGrpMst_Log(Base):
    __tablename__ = "ServGrpMst_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    SgpCode = Column(Integer)
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
    SgpRBywseDiscSys = Column(Boolean, default=False)
    SgpRTowseDiscSys = Column(Boolean, default=False)
    SgpTimewseDiscSys = Column(Boolean, default=False)
    SgpExtBargSys = Column(Boolean, default=False)
    SgpDctwseBargSys = Column(Boolean, default=False)
    SgpPcgwseBargSys = Column(Boolean, default=False)
    SgpRBywseBargSys = Column(Boolean, default=False)
    SgpRTowseBargSys = Column(Boolean, default=False)
    SgpTimewseBargSys = Column(Boolean, default=False)
    SgpExtShareSys = Column(Boolean, default=False)
    SgpDctwseShareSys = Column(Boolean, default=False)
    SgpPcgwseShareSys = Column(Boolean, default=False)
    SgpRBywseShareSys = Column(Boolean, default=False)
    SgpRTowseShareSys = Column(Boolean, default=False)
    SgpTimewseShareSys = Column(Boolean, default=False)
    SgpShowInList = Column(Boolean, default=True)
    SgpRecState = Column(SmallInteger, nullable=False, default=1)



class ServMast_Log(Base):
    __tablename__ = "ServMast_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    SrvCode = Column(Integer)
    SrvName = Column(String(100), nullable=False)
    SrvSgpCode = Column(Integer)
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
    SrvDctwseRateSys = Column(Boolean, default=False)
    SrvPcgwseRateSys = Column(Boolean, default=False)
    SrvRBywseRateSys = Column(Boolean, default=False)
    SrvRTowseRateSys = Column(Boolean, default=False)
    SrvTimewseRateSys = Column(Boolean, default=False)
    SrvExtDiscSys = Column(Boolean, default=False)
    SrvDctwseDiscSys = Column(Boolean, default=False)
    SrvPcgwseDiscSys = Column(Boolean, default=False)
    SrvRBywseDiscSys = Column(Boolean, default=False)
    SrvRTowseDiscSys = Column(Boolean, default=False)
    SrvTimewseDiscSys = Column(Boolean, default=False)
    SrvExtBargSys = Column(Boolean, default=False)
    SrvDctwseBargSys = Column(Boolean, default=False)
    SrvPcgwseBargSys = Column(Boolean, default=False)
    SrvRBywseBargSys = Column(Boolean, default=False)
    SrvRTowseBargSys = Column(Boolean, default=False)
    SrvTimewseBargSys = Column(Boolean, default=False)
    SrvExtShareSys = Column(Boolean, default=False)
    SrvDctwseShareSys = Column(Boolean, default=False)
    SrvPcgwseShareSys = Column(Boolean, default=False)
    SrvRBywseShareSys = Column(Boolean, default=False)
    SrvRTowseShareSys = Column(Boolean, default=False)
    SrvTimewseShareSys = Column(Boolean, default=False)
    SrvRecState = Column(SmallInteger, nullable=False, default=1)



class ServRateMst_Log(Base):
    __tablename__ = "ServRateMst_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    SrmCode = Column(Integer)
    SrmSrvCode = Column(Integer)
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



class DoctMast_Log(Base):
    __tablename__ = "DoctMast_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    DctCode = Column(Integer)
    DctTitle = Column(String(5))
    DctName = Column(String(50), nullable=False)
    DctSpeci = Column(String(50))
    DctDcgCode = Column(Integer)
    DctDrlCode = Column(Integer)
    DctAddr = Column(String(250))
    DctTelNo = Column(String(50))
    DctEmail = Column(String(50))
    DctAhCode = Column(Integer)
    DctOpdChg = Column(Double, default=0.0)
    DctShare = Column(Double, default=0.0)
    DctRecState = Column(SmallInteger, nullable=False, default=1)



class RefByMast_Log(Base):
    __tablename__ = "RefByMast_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    RByCode = Column(Integer)
    RByName = Column(String(50), nullable=False)
    RBySpeci = Column(String(50))
    RByRfgCode = Column(Integer)
    RByAddr = Column(String(250))
    RByTelNo = Column(String(50))
    RByEmail = Column(String(50))
    RByAhCode = Column(Integer)
    RByShare = Column(Double, default=0.0)
    RByRecState = Column(SmallInteger, nullable=False, default=1)



class RefToMast_Log(Base):
    __tablename__ = "RefToMast_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    RToCode = Column(Integer)
    RToName = Column(String(50), nullable=False)
    RToSpeci = Column(String(50))
    RToRfgCode = Column(Integer)
    RToAddr = Column(String(250))
    RToTelNo = Column(String(50))
    RToEmail = Column(String(50))
    RToAhCode = Column(Integer)
    RToShare = Column(Double, default=0.0)
    RToRecState = Column(SmallInteger, nullable=False, default=1)



class PatMast_Log(Base):
    __tablename__ = "PatMast_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    PttCode = Column(Integer)
    PttName = Column(String(60), nullable=False)
    PttRegNo = Column(Integer)
    PttRegDate = Column(Date)
    PttAhCode = Column(Integer)
    PttPcgCode = Column(Integer)
    PttSex = Column(String(10))
    PttAgeAsOnDt = Column(Date)
    PttDob = Column(Date)
    PttRefRela = Column(String(5))
    PttRefName = Column(String(60))
    PttAddr = Column(String(250))
    PttAraCode = Column(Integer)
    PttStnCode = Column(Integer)
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



class BedMast_Log(Base):
    __tablename__ = "BedMast_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    BdmCode = Column(Integer)
    BdmName = Column(String(50), nullable=False)
    BdmWrdCode = Column(Integer)
    BdmFlrCode = Column(Integer)
    BdmCharges = Column(Double, default=0.0)
    BdmDiscPer = Column(Double, default=0.0)
    BdmDiscAllowed = Column(Boolean, default=False)
    BdmSrvCode = Column(Integer)
    BdmFreeAllot = Column(Boolean, default=False)
    BdmChkTime = Column(Integer)
    BdmChkOutTimeBasis = Column(String(20))
    BdmIndex = Column(SmallInteger, default=0)
    BdmShowInList = Column(Boolean, default=True)
    BdmRemark = Column(String(50))
    BdmRecState = Column(SmallInteger, nullable=False, default=1)
    



class BedSrvMst_Log(Base):
    __tablename__ = "BedSrvMst_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    BsmICode = Column(Integer, autoincrement=True)
    BsmCode = Column(Integer, nullable=False)
    BsmSno = Column(SmallInteger, nullable=False)
    BsmSrvCode = Column(Integer, nullable=False)
    BsmUnit = Column(Double, nullable=False, default=1.0)
    BsmRate = Column(Double, nullable=False, default=0.0)
    BsmRecState = Column(SmallInteger, nullable=False, default=1)
    



class PartyGrpMst_Log(Base):
    __tablename__ = "PartyGrpMst_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    PgmCode = Column(Integer, autoincrement=True)
    PgmName = Column(String(50), nullable=False)
    PgmDesc = Column(String(50))
    PgmRecState = Column(SmallInteger, nullable=False, default=1)



class PartyMast_Log(Base):
    __tablename__ = "PartyMast_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    PrtCode = Column(Integer, autoincrement=True)
    PrtTitle = Column(String(10))
    PrtName = Column(String(50), nullable=False)
    PrtPgmCode = Column(Integer, nullable=False)
    PrtAhCode = Column(Integer)
    PrtAddr = Column(String(250))
    PrtAraCode = Column(Integer)
    PrtStnCode = Column(Integer)
    PrtTelNo = Column(String(50))
    PrtSMSNo = Column(String(50))
    PrtEmail = Column(String(50))
    PrtShowInList = Column(Boolean, default=True)
    PrtRemark = Column(String(50))
    PrtRecState = Column(SmallInteger, nullable=False, default=1)
    



class SubItmGrpMst_Log(Base):
    __tablename__ = "SubItmGrpMst_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    SigCode = Column(Integer, autoincrement=True)
    SigName = Column(String(50), nullable=False)
    SigDesc = Column(String(50))
    SigRecState = Column(SmallInteger, nullable=False, default=1)



class SubItmMast_Log(Base):
    __tablename__ = "SubItmMast_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    SimCode = Column(Integer, autoincrement=True)
    SimName = Column(String(50), nullable=False)
    SimDesc = Column(String(50))
    SimSigCode = Column(Integer, nullable=False)
    SimPurchRate = Column(Double, nullable=False, default=0.0)
    SimMRPRate = Column(Double, nullable=False, default=0.0)
    SimSaleRate = Column(Double, nullable=False, default=0.0)
    SimItmCode = Column(Integer, default=0)
    SimRecState = Column(SmallInteger, nullable=False, default=1)


# ── Payroll Masters ────────────────────────────────────────────────────────────

class PayDeptMast(Base):
    """Payroll – Department Master"""
    __tablename__ = "PayDeptMast"
    PdpCode = Column(Integer, primary_key=True, autoincrement=True, index=True)
    PdpName = Column(String(100), nullable=False)
    PdpDesc = Column(String(250))
    PdpRecState = Column(SmallInteger, nullable=False, default=1)

    employees = relationship("PayEmpMast", back_populates="department")


class PayDesnMast(Base):
    """Payroll – Designation Master"""
    __tablename__ = "PayDesnMast"
    PdnCode = Column(Integer, primary_key=True, autoincrement=True, index=True)
    PdnName = Column(String(100), nullable=False)
    PdnDesc = Column(String(250))
    PdnRecState = Column(SmallInteger, nullable=False, default=1)

    employees = relationship("PayEmpMast", back_populates="designation")


class PayEmpMast(Base):
    """Payroll – Employee Master"""
    __tablename__ = "PayEmpMast"
    PemCode    = Column(Integer, primary_key=True, autoincrement=True, index=True)
    PemTitle   = Column(String(10))
    PemName    = Column(String(100), nullable=False)
    PemDeptCode = Column(Integer, ForeignKey("PayDeptMast.PdpCode"))
    PemDesnCode = Column(Integer, ForeignKey("PayDesnMast.PdnCode"))
    PemGender  = Column(String(10))
    PemDOB     = Column(Date)
    PemDOJ     = Column(Date)
    PemPhone   = Column(String(50))
    PemEmail   = Column(String(100))
    PemAddress = Column(String(250))
    PemBasicSalary = Column(Double, default=0.0)
    PemRecState = Column(SmallInteger, nullable=False, default=1)

    department  = relationship("PayDeptMast", back_populates="employees")
    designation = relationship("PayDesnMast", back_populates="employees")
    

