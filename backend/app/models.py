from sqlalchemy import Column, Integer, String, Boolean, Float, DateTime, ForeignKey
from sqlalchemy.orm import relationship
from .database import Base

class Company(Base):
    __tablename__ = "Company"
    CmpCode = Column(Integer, primary_key=True, autoincrement=True)
    CmpName = Column(String, nullable=False)
    CmpAddress = Column(String)
    CmpCity = Column(String)
    CmpDistrict = Column(String)
    CmpState = Column(String)
    CmpReg1 = Column(String)
    CmpReg2 = Column(String)
    CmpReg3 = Column(String)
    CmpContPer = Column(String)
    CmpOPhone = Column(String)
    CmpRPhone = Column(String)
    CmpFax = Column(String)
    CmpEmail = Column(String)
    CmpWebsite = Column(String)
    CmpJurisdiction = Column(String)
    CmpBooksDate = Column(DateTime)
    CmpFYStartDt = Column(DateTime)
    CmpFYEndDt = Column(DateTime)
    CmpSecPwd = Column(String)
    CmpRecState = Column(Integer, default=1)

class UserRoleMst(Base):
    __tablename__ = "UserRoleMst"
    UrlCode = Column(Integer, primary_key=True, autoincrement=True)
    UrlName = Column(String, nullable=False)
    UrlRecState = Column(Integer, default=1)

    users = relationship("UserMast", back_populates="role")
    rights = relationship("UserRightMst", back_populates="role")

class UserMast(Base):
    __tablename__ = "UserMast"
    UsrCode = Column(Integer, primary_key=True, autoincrement=True)
    UsrName = Column(String, nullable=False)
    UsrUrlCode = Column(Integer, ForeignKey("UserRoleMst.UrlCode"))
    UsrPwd = Column(String, nullable=False)
    UsrRecState = Column(Integer, default=1)

    role = relationship("UserRoleMst", back_populates="users")
    rights = relationship("UserRightMst", back_populates="user")

class UserRightMst(Base):
    __tablename__ = "UserRightMst"
    UhtCode = Column(Integer, primary_key=True, autoincrement=True)
    UhtUsrCode = Column(Integer, ForeignKey("UserMast.UsrCode"))
    UhtUrlCode = Column(Integer, ForeignKey("UserRoleMst.UrlCode"))
    UhtSecuOptName = Column(String, nullable=False)
    UhtCanAdd = Column(Boolean, default=False)
    UhtCanEdit = Column(Boolean, default=False)
    UhtCanDelete = Column(Boolean, default=False)
    UhtCanView = Column(Boolean, default=False)
    UhtRemark = Column(String)
    UhtRecState = Column(Integer, default=1)

    user = relationship("UserMast", back_populates="rights")
    role = relationship("UserRoleMst", back_populates="rights")

class PatCatgMst(Base):
    __tablename__ = "PatCatgMst"
    PcgCode = Column(Integer, primary_key=True, autoincrement=True)
    PcgName = Column(String, nullable=False)
    PcgInfAllowed = Column(Boolean, default=False)
    PcgDefAllowed = Column(Boolean, default=False)
    PcgDiscAllowed = Column(Boolean, default=False)
    PcgDiscPer = Column(Float, default=0.0)
    PcgShowInList = Column(Boolean, default=True)
    PcgRecState = Column(Integer, default=1)

    patients = relationship("PatMast", back_populates="category")

class DoctCatgMst(Base):
    __tablename__ = "DoctCatgMst"
    DcgCode = Column(Integer, primary_key=True, autoincrement=True)
    DcgName = Column(String, nullable=False)
    DcgRecState = Column(Integer, default=1)

    doctors = relationship("DoctMast", back_populates="category")

class DoctRoleMst(Base):
    __tablename__ = "DoctRoleMst"
    DrlCode = Column(Integer, primary_key=True, autoincrement=True)
    DrlName = Column(String, nullable=False)
    DrlRecState = Column(Integer, default=1)

    doctors = relationship("DoctMast", back_populates="role")

class RefCatgMst(Base):
    __tablename__ = "RefCatgMst"
    RfgCode = Column(Integer, primary_key=True, autoincrement=True)
    RfgName = Column(String, nullable=False)
    RfgRecState = Column(Integer, default=1)

    ref_bys = relationship("RefByMast", back_populates="category")
    ref_tos = relationship("RefToMast", back_populates="category")

class DoctMast(Base):
    __tablename__ = "DoctMast"
    DctCode = Column(Integer, primary_key=True, autoincrement=True)
    DctTitle = Column(String)
    DctName = Column(String, nullable=False)
    DctSpeci = Column(String)
    DctDcgCode = Column(Integer, ForeignKey("DoctCatgMst.DcgCode"))
    DctDrlCode = Column(Integer, ForeignKey("DoctRoleMst.DrlCode"))
    DctAddr = Column(String)
    DctTelNo = Column(String)
    DctEmail = Column(String)
    DctAhCode = Column(Integer)
    DctShare = Column(Float, default=0.0)
    DctRecState = Column(Integer, default=1)

    category = relationship("DoctCatgMst", back_populates="doctors")
    role = relationship("DoctRoleMst", back_populates="doctors")

class RefByMast(Base):
    __tablename__ = "RefByMast"
    RByCode = Column(Integer, primary_key=True, autoincrement=True)
    RByName = Column(String, nullable=False)
    RBySpeci = Column(String)
    RByRfgCode = Column(Integer, ForeignKey("RefCatgMst.RfgCode"))
    RByAddr = Column(String)
    RByTelNo = Column(String)
    RByEmail = Column(String)
    RByAhCode = Column(Integer)
    RByShare = Column(Float, default=0.0)
    RByRecState = Column(Integer, default=1)

    category = relationship("RefCatgMst", back_populates="ref_bys")

class RefToMast(Base):
    __tablename__ = "RefToMast"
    RToCode = Column(Integer, primary_key=True, autoincrement=True)
    RToName = Column(String, nullable=False)
    RToSpeci = Column(String)
    RToRfgCode = Column(Integer, ForeignKey("RefCatgMst.RfgCode"))
    RToAddr = Column(String)
    RToTelNo = Column(String)
    RToEmail = Column(String)
    RToAhCode = Column(Integer)
    RToShare = Column(Float, default=0.0)
    RToRecState = Column(Integer, default=1)

    category = relationship("RefCatgMst", back_populates="ref_tos")

class AreaMast(Base):
    __tablename__ = "AreaMast"
    AraCode = Column(Integer, primary_key=True, autoincrement=True)
    AraName = Column(String, nullable=False)
    AraRecState = Column(Integer, default=1)

    patients = relationship("PatMast", back_populates="area")
    parties = relationship("PartyMast", back_populates="area")

class StsnMast(Base):
    __tablename__ = "StsnMast"
    StnCode = Column(Integer, primary_key=True, autoincrement=True)
    StnName = Column(String, nullable=False)
    StnRecState = Column(Integer, default=1)

    patients = relationship("PatMast", back_populates="station")

class DiagMast(Base):
    __tablename__ = "DiagMast"
    DigCode = Column(Integer, primary_key=True, autoincrement=True)
    DigName = Column(String, nullable=False)
    DigRecState = Column(Integer, default=1)

class FloorMast(Base):
    __tablename__ = "FloorMast"
    FlrCode = Column(Integer, primary_key=True, autoincrement=True)
    FlrName = Column(String, nullable=False)
    FlrShowInList = Column(Boolean, default=True)
    FlrRecState = Column(Integer, default=1)

    beds = relationship("BedMast", back_populates="floor")

class WardMast(Base):
    __tablename__ = "WardMast"
    WrdCode = Column(Integer, primary_key=True, autoincrement=True)
    WrdName = Column(String, nullable=False)
    WrdRecState = Column(Integer, default=1)

    beds = relationship("BedMast", back_populates="ward")

class ServGrpMst(Base):
    __tablename__ = "ServGrpMst"
    SgpCode = Column(Integer, primary_key=True, autoincrement=True)
    SgpName = Column(String, nullable=False)
    SgpIndex = Column(Integer, default=0)
    SgpExpanded = Column(Boolean, default=False)
    SgpEditable = Column(Boolean, default=False)
    SgpInfAllowed = Column(Boolean, default=False)
    SgpDefAllowed = Column(Boolean, default=False)
    SgpDiscAllowed = Column(Boolean, default=False)
    SgpDiscPer = Column(Float, default=0.0)
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
    SgpRecState = Column(Integer, default=1)

    services = relationship("ServMast", back_populates="group")

class ServMast(Base):
    __tablename__ = "ServMast"
    SrvCode = Column(Integer, primary_key=True, autoincrement=True)
    SrvName = Column(String, nullable=False)
    SrvSgpCode = Column(Integer, ForeignKey("ServGrpMst.SgpCode"))
    SrvAhCode = Column(Integer)
    SrvCharges = Column(Float, default=0.0)
    SrvDiscPer = Column(Float, default=0.0)
    SrvIndex = Column(Integer, default=0)
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
    SrvRecState = Column(Integer, default=1)

    group = relationship("ServGrpMst", back_populates="services")
    rates = relationship("ServRateMst", back_populates="service")
    beds = relationship("BedMast", back_populates="service")

class ServRateMst(Base):
    __tablename__ = "ServRateMst"
    SrmCode = Column(Integer, primary_key=True, autoincrement=True)
    SrmSrvCode = Column(Integer, ForeignKey("ServMast.SrvCode"))
    SrmRateType = Column(String, nullable=False)
    SrmRefCode = Column(Integer)
    SrmEffDate = Column(DateTime)
    SrmStartTime = Column(Integer)
    SrmEndTime = Column(Integer)
    SrmRate = Column(Float, default=0.0)
    SrmShare = Column(Float, default=0.0)
    SrmDiscPer = Column(Float, default=0.0)
    SrmBargPer = Column(Float, default=0.0)
    SrmRecState = Column(Integer, default=1)

    service = relationship("ServMast", back_populates="rates")

class PatMast(Base):
    __tablename__ = "PatMast"
    PttCode = Column(Integer, primary_key=True, autoincrement=True)
    PttName = Column(String, nullable=False)
    PttRegNo = Column(Integer)
    PttRegDate = Column(DateTime)
    PttAhCode = Column(Integer)
    PttPcgCode = Column(Integer, ForeignKey("PatCatgMst.PcgCode"))
    PttSex = Column(String)
    PttAgeAsOnDt = Column(DateTime)
    PttDob = Column(DateTime)
    PttRefRela = Column(String)
    PttRefName = Column(String)
    PttAddr = Column(String)
    PttAraCode = Column(Integer, ForeignKey("AreaMast.AraCode"))
    PttStnCode = Column(Integer, ForeignKey("StsnMast.StnCode"))
    PttTelNo = Column(String)
    PttSMSNo = Column(String)
    PttEmail = Column(String)
    PttInfAllowed = Column(Boolean, default=False)
    PttDefAllowed = Column(Boolean, default=False)
    PttDiscAllowed = Column(Boolean, default=False)
    PttDiscPer = Column(Float, default=0.0)
    PttShowInList = Column(Boolean, default=True)
    PttRemark = Column(String)
    PttRecState = Column(Integer, default=1)

    category = relationship("PatCatgMst", back_populates="patients")
    area = relationship("AreaMast", back_populates="patients")
    station = relationship("StsnMast", back_populates="patients")

class BedMast(Base):
    __tablename__ = "BedMast"
    BdmCode = Column(Integer, primary_key=True, autoincrement=True)
    BdmName = Column(String, nullable=False)
    BdmWrdCode = Column(Integer, ForeignKey("WardMast.WrdCode"))
    BdmFlrCode = Column(Integer, ForeignKey("FloorMast.FlrCode"))
    BdmCharges = Column(Float, default=0.0)
    BdmDiscPer = Column(Float, default=0.0)
    BdmDiscAllowed = Column(Boolean, default=False)
    BdmSrvCode = Column(Integer, ForeignKey("ServMast.SrvCode"))
    BdmFreeAllot = Column(Boolean, default=False)
    BdmChkTime = Column(Integer)
    BdmChkOutTimeBasis = Column(String)
    BdmIndex = Column(Integer, default=0)
    BdmShowInList = Column(Boolean, default=True)
    BdmRemark = Column(String)
    BdmRecState = Column(Integer, default=1)

    ward = relationship("WardMast", back_populates="beds")
    floor = relationship("FloorMast", back_populates="beds")
    service = relationship("ServMast", back_populates="beds")

class OutdReg(Base):
    __tablename__ = "OutdReg"
    OpgCode = Column(Integer, primary_key=True, autoincrement=True)
    OpgVtmCode = Column(Integer)
    OpgPrefix = Column(String)
    OpgVchNo = Column(Integer, nullable=False)
    OpgPostfix = Column(String)
    OpgDate = Column(DateTime, nullable=False)
    OpgTime = Column(Integer)
    OpgOldOpgCode = Column(Integer)
    OpgCDctCode = Column(Integer, ForeignKey("DoctMast.DctCode"))
    OpgRByCode = Column(Integer, ForeignKey("RefByMast.RByCode"))
    OpgRToCode = Column(Integer, ForeignKey("RefToMast.RToCode"))
    OpgPttCode = Column(Integer, ForeignKey("PatMast.PttCode"), nullable=False)
    OpgPDigCode = Column(Integer, ForeignKey("DiagMast.DigCode"))
    OpgFDigCode = Column(Integer, ForeignKey("DiagMast.DigCode"))
    OpgSrvCode = Column(Integer, ForeignKey("ServMast.SrvCode"))
    OpgUnit = Column(Float, default=1.0)
    OpgRate = Column(Float, default=0.0)
    OpgAmtBefDisc = Column(Float, default=0.0)
    OpgDiscPer = Column(Float, default=0.0)
    OpgDiscAmt = Column(Float, default=0.0)
    OpgAmtAftDisc = Column(Float, default=0.0)
    OpgRfugAmt = Column(Float, default=0.0)
    OpgRemark = Column(String)
    OpgRecState = Column(Integer, default=1)
    OpgCmpCode = Column(Integer, default=1)

    patient = relationship("PatMast")
    doctor = relationship("DoctMast")
    referred_by = relationship("RefByMast")
    service = relationship("ServMast")

class OutdHdr(Base):
    __tablename__ = "OutdHdr"
    OhdCode = Column(Integer, primary_key=True, autoincrement=True)
    OhdVtmCode = Column(Integer)
    OhdPrefix = Column(String)
    OhdVchNo = Column(Integer, nullable=False)
    OhdDate = Column(DateTime, nullable=False)
    OhdTime = Column(Integer)
    OhdPttCode = Column(Integer, ForeignKey("PatMast.PttCode"), nullable=False)
    OhdCDctCode = Column(Integer, ForeignKey("DoctMast.DctCode"))
    OhdRByCode = Column(Integer, ForeignKey("RefByMast.RByCode"))
    OhdBillType = Column(String)
    OhdDiscPer = Column(Float, default=0.0)
    OhdDiscAmt = Column(Float, default=0.0)
    OhdTotalAmt = Column(Float, default=0.0)
    OhdDepAmt = Column(Float, default=0.0)
    OhdRfugAmt = Column(Float, default=0.0)
    OhdBalAmt = Column(Float, default=0.0)
    OhdRemark = Column(String)
    OhdVoidFlag = Column(Boolean, default=False)
    OhdRecState = Column(Integer, default=1)
    OhdCmpCode = Column(Integer, default=1)

    patient = relationship("PatMast")
    doctor = relationship("DoctMast")
    referred_by = relationship("RefByMast")
    bills = relationship("OutdBill", back_populates="header")
    payments = relationship("OutdBlPymtHdr", back_populates="header")
    refunds = relationship("OutdBlRefdHdr", back_populates="header")

class OutdBill(Base):
    __tablename__ = "OutdBill"
    ObdCode = Column(Integer, primary_key=True, autoincrement=True)
    ObdOhdCode = Column(Integer, ForeignKey("OutdHdr.OhdCode"), nullable=False)
    ObdSrvCode = Column(Integer, ForeignKey("ServMast.SrvCode"))
    ObdSno = Column(Integer)
    ObdUnit = Column(Float, default=1.0)
    ObdRate = Column(Float, default=0.0)
    ObdAmtBefDisc = Column(Float, default=0.0)
    ObdDiscPer = Column(Float, default=0.0)
    ObdDiscAmt = Column(Float, default=0.0)
    ObdAmtAftDisc = Column(Float, default=0.0)
    ObdRecState = Column(Integer, default=1)

    header = relationship("OutdHdr", back_populates="bills")
    service = relationship("ServMast")

class OutdBlDctDtl(Base):
    __tablename__ = "OutdBlDctDtl"
    OddCode = Column(Integer, primary_key=True, autoincrement=True)
    OddOhdCode = Column(Integer, ForeignKey("OutdHdr.OhdCode"), nullable=False)
    OddDctCode = Column(Integer, ForeignKey("DoctMast.DctCode"))
    OddSharePer = Column(Float, default=0.0)
    OddShareAmt = Column(Float, default=0.0)
    OddRecState = Column(Integer, default=1)

class OutdBlPymtHdr(Base):
    __tablename__ = "OutdBlPymtHdr"
    ObpCode = Column(Integer, primary_key=True, autoincrement=True)
    ObpOhdCode = Column(Integer, ForeignKey("OutdHdr.OhdCode"))
    ObpDate = Column(DateTime, nullable=False)
    ObpAmt = Column(Float, default=0.0)
    ObpRecState = Column(Integer, default=1)

    header = relationship("OutdHdr", back_populates="payments")

class OutdBlRefdHdr(Base):
    __tablename__ = "OutdBlRefdHdr"
    ObrCode = Column(Integer, primary_key=True, autoincrement=True)
    ObrOhdCode = Column(Integer, ForeignKey("OutdHdr.OhdCode"))
    ObrDate = Column(DateTime, nullable=False)
    ObrAmt = Column(Float, default=0.0)
    ObrRecState = Column(Integer, default=1)

    header = relationship("OutdHdr", back_populates="refunds")

class OutdRcpt(Base):
    __tablename__ = "OutdRcpt"
    OrcCode = Column(Integer, primary_key=True, autoincrement=True)
    OrcVtmCode = Column(Integer)
    OrcPrefix = Column(String)
    OrcVchNo = Column(Integer, nullable=False)
    OrcDate = Column(DateTime, nullable=False)
    OrcTime = Column(Integer)
    OrcPttCode = Column(Integer, ForeignKey("PatMast.PttCode"), nullable=False)
    OrcCDctCode = Column(Integer, ForeignKey("DoctMast.DctCode"))
    OrcRByCode = Column(Integer, ForeignKey("RefByMast.RByCode"))
    OrcReceiptType = Column(String)
    OrcDiscPer = Column(Float, default=0.0)
    OrcTotalAmt = Column(Float, default=0.0)
    OrcRecvdAmt = Column(Float, default=0.0)
    OrcRfugAmt = Column(Float, default=0.0)
    OrcBalAmt = Column(Float, default=0.0)
    OrcAdvAmt = Column(Float, default=0.0)
    OrcRemark = Column(String)
    OrcVoidFlag = Column(Boolean, default=False)
    OrcRecState = Column(Integer, default=1)
    OrcCmpCode = Column(Integer, default=1)

    patient = relationship("PatMast")
    doctor = relationship("DoctMast")
    referred_by = relationship("RefByMast")
    payments = relationship("OutdPymtHdr", back_populates="receipt")
    refunds = relationship("OutdRefdHdr", back_populates="receipt")

class OutdPymtHdr(Base):
    __tablename__ = "OutdPymtHdr"
    OphCode = Column(Integer, primary_key=True, autoincrement=True)
    OphOrcCode = Column(Integer, ForeignKey("OutdRcpt.OrcCode"))
    OphDate = Column(DateTime, nullable=False)
    OphAmt = Column(Float, default=0.0)
    OphRecState = Column(Integer, default=1)

    receipt = relationship("OutdRcpt", back_populates="payments")

class OutdRefdHdr(Base):
    __tablename__ = "OutdRefdHdr"
    OrhCode = Column(Integer, primary_key=True, autoincrement=True)
    OrhOrcCode = Column(Integer, ForeignKey("OutdRcpt.OrcCode"))
    OrhDate = Column(DateTime, nullable=False)
    OrhAmt = Column(Float, default=0.0)
    OrhRecState = Column(Integer, default=1)

    receipt = relationship("OutdRcpt", back_populates="refunds")

class OutdRgRefd(Base):
    __tablename__ = "OutdRgRefd"
    OrrCode = Column(Integer, primary_key=True, autoincrement=True)
    OrrOpgCode = Column(Integer, ForeignKey("OutdReg.OpgCode"))
    OrrDate = Column(DateTime, nullable=False)
    OrrAmt = Column(Float, default=0.0)
    OrrRecState = Column(Integer, default=1)

class IndrHdr(Base):
    __tablename__ = "IndrHdr"
    IhdCode = Column(Integer, primary_key=True, autoincrement=True)
    IhdVtmCode = Column(Integer)
    IhdPrefix = Column(String)
    IhdVchNo = Column(Integer, nullable=False)
    IhdDate = Column(DateTime, nullable=False)
    IhdTime = Column(Integer)
    IhdPttCode = Column(Integer, ForeignKey("PatMast.PttCode"), nullable=False)
    IhdCDctCode = Column(Integer, ForeignKey("DoctMast.DctCode"))
    IhdRByCode = Column(Integer, ForeignKey("RefByMast.RByCode"))
    IhdWrdCode = Column(Integer, ForeignKey("WardMast.WrdCode"))
    IhdBedCode = Column(Integer, ForeignKey("BedMast.BdmCode"))
    IhdFlrCode = Column(Integer, ForeignKey("FloorMast.FlrCode"))
    IhdAdvAmt = Column(Float, default=0.0)
    IhdDischDate = Column(DateTime)
    IhdDischTime = Column(Integer)
    IhdPDigCode = Column(Integer, ForeignKey("DiagMast.DigCode"))
    IhdFDigCode = Column(Integer, ForeignKey("DiagMast.DigCode"))
    IhdStatus = Column(String, default="Admitted")
    IhdRemark = Column(String)
    IhdVoidFlag = Column(Boolean, default=False)
    IhdRecState = Column(Integer, default=1)
    IhdCmpCode = Column(Integer, default=1)

    patient = relationship("PatMast")
    doctor = relationship("DoctMast")
    referred_by = relationship("RefByMast")
    ward = relationship("WardMast")
    bed = relationship("BedMast")
    floor = relationship("FloorMast")
    registrations = relationship("IndrReg", back_populates="header")

class IndrReg(Base):
    __tablename__ = "IndrReg"
    IrgCode = Column(Integer, primary_key=True, autoincrement=True)
    IrgIhdCode = Column(Integer, ForeignKey("IndrHdr.IhdCode"), nullable=False)
    IrgDate = Column(DateTime, nullable=False)
    IrgAmt = Column(Float, default=0.0)
    IrgType = Column(String)
    IrgRecState = Column(Integer, default=1)

    header = relationship("IndrHdr", back_populates="registrations")
    payments = relationship("IndrRgPymt", back_populates="registration")
    refunds = relationship("IndrRgRefd", back_populates="registration")

class IndrRgPymt(Base):
    __tablename__ = "IndrRgPymt"
    IrpCode = Column(Integer, primary_key=True, autoincrement=True)
    IrpIrgCode = Column(Integer, ForeignKey("IndrReg.IrgCode"))
    IrpDate = Column(DateTime, nullable=False)
    IrpAmt = Column(Float, default=0.0)
    IrpRecState = Column(Integer, default=1)

    registration = relationship("IndrReg", back_populates="payments")

class IndrRgRefd(Base):
    __tablename__ = "IndrRgRefd"
    IrrCode = Column(Integer, primary_key=True, autoincrement=True)
    IrrIrgCode = Column(Integer, ForeignKey("IndrReg.IrgCode"))
    IrrDate = Column(DateTime, nullable=False)
    IrrAmt = Column(Float, default=0.0)
    IrrRecState = Column(Integer, default=1)

    registration = relationship("IndrReg", back_populates="refunds")

class IndrBlHdr(Base):
    __tablename__ = "IndrBlHdr"
    IbhCode = Column(Integer, primary_key=True, autoincrement=True)
    IbhVtmCode = Column(Integer)
    IbhPrefix = Column(String)
    IbhVchNo = Column(Integer, nullable=False)
    IbhDate = Column(DateTime, nullable=False)
    IbhIhdCode = Column(Integer, ForeignKey("IndrHdr.IhdCode"), nullable=False)
    IbhPttCode = Column(Integer, ForeignKey("PatMast.PttCode"), nullable=False)
    IbhBillType = Column(String)
    IbhDiscPer = Column(Float, default=0.0)
    IbhTotalAmt = Column(Float, default=0.0)
    IbhDepAmt = Column(Float, default=0.0)
    IbhRfugAmt = Column(Float, default=0.0)
    IbhBalAmt = Column(Float, default=0.0)
    IbhStatus = Column(String)
    IbhDischDate = Column(DateTime)
    IbhRemark = Column(String)
    IbhVoidFlag = Column(Boolean, default=False)
    IbhRecState = Column(Integer, default=1)
    IbhCmpCode = Column(Integer, default=1)

    patient = relationship("PatMast")
    ipd_header = relationship("IndrHdr")
    bills = relationship("IndrBill", back_populates="header")
    payments = relationship("IndrBlDpogDtl", back_populates="header")
    refunds = relationship("IndrBlRfugDtl", back_populates="header")

class IndrBill(Base):
    __tablename__ = "IndrBill"
    IbdCode = Column(Integer, primary_key=True, autoincrement=True)
    IbdIbhCode = Column(Integer, ForeignKey("IndrBlHdr.IbhCode"), nullable=False)
    IbdSrvCode = Column(Integer, ForeignKey("ServMast.SrvCode"))
    IbdSno = Column(Integer)
    IbdUnit = Column(Float, default=1.0)
    IbdRate = Column(Float, default=0.0)
    IbdAmtBefDisc = Column(Float, default=0.0)
    IbdDiscPer = Column(Float, default=0.0)
    IbdDiscAmt = Column(Float, default=0.0)
    IbdAmtAftDisc = Column(Float, default=0.0)
    IbdRecState = Column(Integer, default=1)

    header = relationship("IndrBlHdr", back_populates="bills")
    service = relationship("ServMast")

class IndrBlDctDtl(Base):
    __tablename__ = "IndrBlDctDtl"
    IddCode = Column(Integer, primary_key=True, autoincrement=True)
    IddIbhCode = Column(Integer, ForeignKey("IndrBlHdr.IbhCode"), nullable=False)
    IddDctCode = Column(Integer, ForeignKey("DoctMast.DctCode"))
    IddSharePer = Column(Float, default=0.0)
    IddShareAmt = Column(Float, default=0.0)
    IddRecState = Column(Integer, default=1)

class IndrBlDpogDtl(Base):
    __tablename__ = "IndrBlDpogDtl"
    IpdCode = Column(Integer, primary_key=True, autoincrement=True)
    IpdIbhCode = Column(Integer, ForeignKey("IndrBlHdr.IbhCode"))
    IpdAmt = Column(Float, default=0.0)
    IpdDate = Column(DateTime)
    IpdRecState = Column(Integer, default=1)

    header = relationship("IndrBlHdr", back_populates="payments")

class IndrBlRfugDtl(Base):
    __tablename__ = "IndrBlRfugDtl"
    IrdCode = Column(Integer, primary_key=True, autoincrement=True)
    IrdIbhCode = Column(Integer, ForeignKey("IndrBlHdr.IbhCode"))
    IrdAmt = Column(Float, default=0.0)
    IrdDate = Column(DateTime)
    IrdRecState = Column(Integer, default=1)

    header = relationship("IndrBlHdr", back_populates="refunds")

class LabHdr(Base):
    __tablename__ = "LabHdr"
    LhdCode = Column(Integer, primary_key=True, autoincrement=True)
    LhdVtmCode = Column(Integer)
    LhdPrefix = Column(String)
    LhdVchNo = Column(Integer, nullable=False)
    LhdDate = Column(DateTime, nullable=False)
    LhdTime = Column(Integer)
    LhdPttCode = Column(Integer, ForeignKey("PatMast.PttCode"), nullable=False)
    LhdCDctCode = Column(Integer, ForeignKey("DoctMast.DctCode"))
    LhdRByCode = Column(Integer, ForeignKey("RefByMast.RByCode"))
    LhdReceiptType = Column(String)
    LhdDiscPer = Column(Float, default=0.0)
    LhdTotalAmt = Column(Float, default=0.0)
    LhdRecvdAmt = Column(Float, default=0.0)
    LhdRfugAmt = Column(Float, default=0.0)
    LhdBalAmt = Column(Float, default=0.0)
    LhdAdvAmt = Column(Float, default=0.0)
    LhdRemark = Column(String)
    LhdVoidFlag = Column(Boolean, default=False)
    LhdRecState = Column(Integer, default=1)
    LhdCmpCode = Column(Integer, default=1)

    patient = relationship("PatMast")
    doctor = relationship("DoctMast")
    referred_by = relationship("RefByMast")
    bills = relationship("LabRcpt", back_populates="header")
    payments = relationship("LabPymtHdr", back_populates="header")
    refunds = relationship("LabRefdHdr", back_populates="header")

class LabRcpt(Base):
    __tablename__ = "LabRcpt"
    LrdCode = Column(Integer, primary_key=True, autoincrement=True)
    LrdLhdCode = Column(Integer, ForeignKey("LabHdr.LhdCode"), nullable=False)
    LrdSrvCode = Column(Integer, ForeignKey("ServMast.SrvCode"))
    LrdSno = Column(Integer)
    LrdUnit = Column(Float, default=1.0)
    LrdRate = Column(Float, default=0.0)
    LrdAmtBefDisc = Column(Float, default=0.0)
    LrdDiscPer = Column(Float, default=0.0)
    LrdDiscAmt = Column(Float, default=0.0)
    LrdAmtAftDisc = Column(Float, default=0.0)
    LrdRecState = Column(Integer, default=1)

    header = relationship("LabHdr", back_populates="bills")
    service = relationship("ServMast")

class LabRcDctDtl(Base):
    __tablename__ = "LabRcDctDtl"
    LddCode = Column(Integer, primary_key=True, autoincrement=True)
    LddLhdCode = Column(Integer, ForeignKey("LabHdr.LhdCode"), nullable=False)
    LddDctCode = Column(Integer, ForeignKey("DoctMast.DctCode"))
    LddSharePer = Column(Float, default=0.0)
    LddRecState = Column(Integer, default=1)

class LabPymtHdr(Base):
    __tablename__ = "LabPymtHdr"
    LphCode = Column(Integer, primary_key=True, autoincrement=True)
    LphLhdCode = Column(Integer, ForeignKey("LabHdr.LhdCode"))
    LphDate = Column(DateTime, nullable=False)
    LphAmt = Column(Float, default=0.0)
    LphRecState = Column(Integer, default=1)

    header = relationship("LabHdr", back_populates="payments")

class LabRefdHdr(Base):
    __tablename__ = "LabRefdHdr"
    LrhCode = Column(Integer, primary_key=True, autoincrement=True)
    LrhLhdCode = Column(Integer, ForeignKey("LabHdr.LhdCode"))
    LrhDate = Column(DateTime, nullable=False)
    LrhAmt = Column(Float, default=0.0)
    LrhRecState = Column(Integer, default=1)

    header = relationship("LabHdr", back_populates="refunds")

class SubItmGrpMst(Base):
    __tablename__ = "SubItmGrpMst"
    SigCode = Column(Integer, primary_key=True, autoincrement=True)
    SigName = Column(String, nullable=False)
    SigRecState = Column(Integer, default=1)

    items = relationship("SubItmMast", back_populates="group")

class SubItmMast(Base):
    __tablename__ = "SubItmMast"
    SimCode = Column(Integer, primary_key=True, autoincrement=True)
    SimName = Column(String, nullable=False)
    SimSigCode = Column(Integer, ForeignKey("SubItmGrpMst.SigCode"))
    SimRecState = Column(Integer, default=1)

    group = relationship("SubItmGrpMst", back_populates="items")

class PartyGrpMst(Base):
    __tablename__ = "PartyGrpMst"
    PgpCode = Column(Integer, primary_key=True, autoincrement=True)
    PgpName = Column(String, nullable=False)
    PgpRecState = Column(Integer, default=1)

    parties = relationship("PartyMast", back_populates="group")

class PartyMast(Base):
    __tablename__ = "PartyMast"
    PryCode = Column(Integer, primary_key=True, autoincrement=True)
    PryName = Column(String, nullable=False)
    PryPgpCode = Column(Integer, ForeignKey("PartyGrpMst.PgpCode"))
    PryAraCode = Column(Integer, ForeignKey("AreaMast.AraCode"))
    PryAddr = Column(String)
    PryTelNo = Column(String)
    PryEmail = Column(String)
    PryRecState = Column(Integer, default=1)

    group = relationship("PartyGrpMst", back_populates="parties")
    area = relationship("AreaMast", back_populates="parties")

class MedSaleHdr(Base):
    __tablename__ = "MedSaleHdr"
    SahCode = Column(Integer, primary_key=True, autoincrement=True)
    SahVtmCode = Column(Integer)
    SahPrefix = Column(String)
    SahVchNo = Column(Integer, nullable=False)
    SahDate = Column(DateTime, nullable=False)
    SahTime = Column(Integer)
    SahPttCode = Column(Integer, ForeignKey("PatMast.PttCode"))
    SahTotalAmt = Column(Float, default=0.0)
    SahRecState = Column(Integer, default=1)
    SahCmpCode = Column(Integer, default=1)

    patient = relationship("PatMast")
    details = relationship("MedSaleDtl", back_populates="header")

class MedSaleDtl(Base):
    __tablename__ = "MedSaleDtl"
    SalICode = Column(Integer, primary_key=True, autoincrement=True)
    SalCode = Column(Integer, ForeignKey("MedSaleHdr.SahCode"), nullable=False)
    SalSno = Column(Integer)
    SalSimCode = Column(Integer, ForeignKey("SubItmMast.SimCode"))
    SalQty = Column(Float, default=1.0)
    SalRate = Column(Float, default=0.0)
    SalAmount = Column(Float, default=0.0)
    SalRecState = Column(Integer, default=1)

    header = relationship("MedSaleHdr", back_populates="details")
    item = relationship("SubItmMast")

class MedPurchHdr(Base):
    __tablename__ = "MedPurchHdr"
    PuhCode = Column(Integer, primary_key=True, autoincrement=True)
    PuhVtmCode = Column(Integer)
    PuhPrefix = Column(String)
    PuhVchNo = Column(Integer, nullable=False)
    PuhDate = Column(DateTime, nullable=False)
    PuhTime = Column(Integer)
    PuhPrtCode = Column(Integer, ForeignKey("PartyMast.PryCode"))
    PuhTotalAmt = Column(Float, default=0.0)
    PuhRecState = Column(Integer, default=1)
    PuhCmpCode = Column(Integer, default=1)

    party = relationship("PartyMast")
    details = relationship("MedPurchDtl", back_populates="header")

class MedPurchDtl(Base):
    __tablename__ = "MedPurchDtl"
    PurICode = Column(Integer, primary_key=True, autoincrement=True)
    PurCode = Column(Integer, ForeignKey("MedPurchHdr.PuhCode"), nullable=False)
    PurSno = Column(Integer)
    PurSimCode = Column(Integer, ForeignKey("SubItmMast.SimCode"))
    PurQty = Column(Float, default=1.0)
    PurRate = Column(Float, default=0.0)
    PurAmount = Column(Float, default=0.0)
    PurRecState = Column(Integer, default=1)

    header = relationship("MedPurchHdr", back_populates="details")
    item = relationship("SubItmMast")
