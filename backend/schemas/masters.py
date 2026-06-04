from pydantic import BaseModel
from typing import Optional
from datetime import date

class AreaMastBase(BaseModel):
    AraName: str
    AraStnCode: Optional[int] = None
    AraRecState: int = 1

class AreaMastCreate(AreaMastBase):
    pass

class AreaMastUpdate(AreaMastBase):
    pass

class AreaMastResponse(AreaMastBase):
    AraCode: int
    class Config:
        from_attributes = True

# DoctCatgMst
class DoctCatgMstBase(BaseModel):
    DcgName: str
    DcgRecState: int = 1

class DoctCatgMstCreate(DoctCatgMstBase): pass
class DoctCatgMstUpdate(DoctCatgMstBase): pass
class DoctCatgMstResponse(DoctCatgMstBase):
    DcgCode: int
    class Config: from_attributes = True

# DoctRoleMst
class DoctRoleMstBase(BaseModel):
    DrlName: str
    DrlRecState: int = 1

class DoctRoleMstCreate(DoctRoleMstBase): pass
class DoctRoleMstUpdate(DoctRoleMstBase): pass
class DoctRoleMstResponse(DoctRoleMstBase):
    DrlCode: int
    class Config: from_attributes = True

# DoctMast
class DoctMastBase(BaseModel):
    DctTitle: Optional[str] = None
    DctName: str
    DctSpeci: Optional[str] = None
    DctDcgCode: Optional[int] = None
    DctDrlCode: Optional[int] = None
    DctAddr: Optional[str] = None
    DctTelNo: Optional[str] = None
    DctEmail: Optional[str] = None
    DctAhCode: Optional[int] = None
    DctOpdChg: float = 0.0
    DctShare: float = 0.0
    DctRecState: int = 1

class DoctMastCreate(DoctMastBase): pass
class DoctMastUpdate(DoctMastBase): pass
class DoctMastResponse(DoctMastBase):
    DctCode: int
    class Config: from_attributes = True

# RefCatgMst
class RefCatgMstBase(BaseModel):
    RfgName: str
    RfgRecState: int = 1

class RefCatgMstCreate(RefCatgMstBase): pass
class RefCatgMstUpdate(RefCatgMstBase): pass
class RefCatgMstResponse(RefCatgMstBase):
    RfgCode: int
    class Config: from_attributes = True

# RefByMast
class RefByMastBase(BaseModel):
    RByName: str
    RBySpeci: Optional[str] = None
    RByRfgCode: Optional[int] = None
    RByAddr: Optional[str] = None
    RByTelNo: Optional[str] = None
    RByEmail: Optional[str] = None
    RByAhCode: Optional[int] = None
    RByShare: float = 0.0
    RByRecState: int = 1

class RefByMastCreate(RefByMastBase): pass
class RefByMastUpdate(RefByMastBase): pass
class RefByMastResponse(RefByMastBase):
    RByCode: int
    class Config: from_attributes = True

# RefToMast
class RefToMastBase(BaseModel):
    RToName: str
    RToSpeci: Optional[str] = None
    RToRfgCode: Optional[int] = None
    RToAddr: Optional[str] = None
    RToTelNo: Optional[str] = None
    RToEmail: Optional[str] = None
    RToAhCode: Optional[int] = None
    RToShare: float = 0.0
    RToRecState: int = 1

class RefToMastCreate(RefToMastBase): pass
class RefToMastUpdate(RefToMastBase): pass
class RefToMastResponse(RefToMastBase):
    RToCode: int
    class Config: from_attributes = True

# PatCatgMst
class PatCatgMstBase(BaseModel):
    PcgName: str
    PcgInfAllowed: bool = False
    PcgDefAllowed: bool = False
    PcgDiscAllowed: bool = False
    PcgDiscPer: float = 0.0
    PcgShowInList: bool = True
    PcgRecState: int = 1

class PatCatgMstCreate(PatCatgMstBase): pass
class PatCatgMstUpdate(PatCatgMstBase): pass
class PatCatgMstResponse(PatCatgMstBase):
    PcgCode: int
    class Config: from_attributes = True

# PatMast
from datetime import date
class PatMastBase(BaseModel):
    PttName: str
    PttRegNo: Optional[int] = None
    PttRegDate: Optional[date] = None
    PttAhCode: Optional[int] = None
    PttPcgCode: Optional[int] = None
    PttSex: Optional[str] = None
    PttAgeAsOnDt: Optional[date] = None
    PttDob: Optional[date] = None
    PttRefRela: Optional[str] = None
    PttRefName: Optional[str] = None
    PttAddr: Optional[str] = None
    PttAraCode: Optional[int] = None
    PttStnCode: Optional[int] = None
    PttTelNo: Optional[str] = None
    PttSMSNo: Optional[str] = None
    PttEmail: Optional[str] = None
    PttInfAllowed: bool = False
    PttDefAllowed: bool = False
    PttDiscAllowed: bool = False
    PttDiscPer: float = 0.0
    PttShowInList: bool = True
    PttRemark: Optional[str] = None
    PttRecState: int = 1

class PatMastCreate(PatMastBase): pass
class PatMastUpdate(PatMastBase): pass
class PatMastResponse(PatMastBase):
    PttCode: int
    class Config: from_attributes = True

# StsnMast
class StsnMastBase(BaseModel):
    StnName: str
    StnShowInList: bool = True
    StnRecState: int = 1

class StsnMastCreate(StsnMastBase): pass
class StsnMastUpdate(StsnMastBase): pass
class StsnMastResponse(StsnMastBase):
    StnCode: int
    class Config: from_attributes = True

# FloorMast
class FloorMastBase(BaseModel):
    FlrName: str
    FlrShowInList: bool = True
    FlrRecState: int = 1

class FloorMastCreate(FloorMastBase): pass
class FloorMastUpdate(FloorMastBase): pass
class FloorMastResponse(FloorMastBase):
    FlrCode: int
    class Config: from_attributes = True

# WardMast
class WardMastBase(BaseModel):
    WrdName: str
    WrdShowInList: bool = True
    WrdRecState: int = 1

class WardMastCreate(WardMastBase): pass
class WardMastUpdate(WardMastBase): pass
class WardMastResponse(WardMastBase):
    WrdCode: int
    class Config: from_attributes = True

# BedMast
class BedMastBase(BaseModel):
    BdmName: str
    BdmWrdCode: Optional[int] = None
    BdmFlrCode: Optional[int] = None
    BdmCharges: float = 0.0
    BdmDiscPer: float = 0.0
    BdmDiscAllowed: bool = False
    BdmSrvCode: Optional[int] = None
    BdmFreeAllot: bool = False
    BdmChkTime: Optional[int] = None
    BdmChkOutTimeBasis: Optional[str] = None
    BdmIndex: int = 0
    BdmShowInList: bool = True
    BdmRemark: Optional[str] = None
    BdmRecState: int = 1

class BedMastCreate(BedMastBase): pass
class BedMastUpdate(BedMastBase): pass
class BedMastResponse(BedMastBase):
    BdmCode: int
    class Config: from_attributes = True

# Room Layout Bulk Create
class RoomLayoutCreate(BaseModel):
    floor_name: str
    ward_name: str
    num_beds: int

# DiagMast
class DiagMastBase(BaseModel):
    DigName: str
    DigRecState: int = 1

class DiagMastCreate(DiagMastBase): pass
class DiagMastUpdate(DiagMastBase): pass
class DiagMastResponse(DiagMastBase):
    DigCode: int
    class Config: from_attributes = True

# DiagSrvMst
class DiagSrvMstBase(BaseModel):
    DsmDigCode: int
    DsmSrvCode: int
    DsmUnit: int = 1
    DsmRate: float = 0.0

class DiagSrvMstCreate(DiagSrvMstBase): pass
class DiagSrvMstUpdate(DiagSrvMstBase): pass
class DiagSrvMstResponse(DiagSrvMstBase):
    DsmCode: int
    class Config: from_attributes = True

# ServGrpMst
class ServGrpMstBase(BaseModel):
    SgpName: str
    SgpIndex: int = 0
    SgpExpanded: bool = False
    SgpEditable: bool = False
    SgpInfAllowed: bool = False
    SgpDefAllowed: bool = False
    SgpDiscAllowed: bool = False
    SgpDiscPer: float = 0.0
    SgpExtRateSys: bool = False
    SgpDctwseRateSys: bool = False
    SgpPcgwseRateSys: bool = False
    SgpRBywseRateSys: bool = False
    SgpRTowseRateSys: bool = False
    SgpTimewseRateSys: bool = False
    SgpExtDiscSys: bool = False
    SgpDctwseDiscSys: bool = False
    SgpPcgwseDiscSys: bool = False
    SgpExtBargSys: bool = False
    SgpExtShareSys: bool = False
    SgpDctwseShareSys: bool = False
    SgpShowInList: bool = True
    SgpRecState: int = 1

class ServGrpMstCreate(ServGrpMstBase): pass
class ServGrpMstUpdate(ServGrpMstBase): pass
class ServGrpMstResponse(ServGrpMstBase):
    SgpCode: int
    class Config: from_attributes = True

# ServMast
class ServMastBase(BaseModel):
    SrvName: str
    SrvSgpCode: Optional[int] = None
    SrvAhCode: Optional[int] = None
    SrvCharges: float = 0.0
    SrvDiscPer: float = 0.0
    SrvIndex: int = 0
    SrvRateEditable: bool = False
    SrvAmtEditable: bool = False
    SrvUnitEditable: bool = False
    SrvMultiDct: bool = False
    SrvShowInList: bool = True
    SrvAutoInsIndr: bool = False
    SrvAutoInsOnceIndr: bool = False
    SrvAutoCalcIndr: bool = False
    SrvInfAllowed: bool = False
    SrvDefAllowed: bool = False
    SrvDiscAllowed: bool = False
    SrvExtRateSys: bool = False
    SrvExtDiscSys: bool = False
    SrvExtShareSys: bool = False
    SrvExtBargSys: bool = False
    SrvRecState: int = 1

class ServMastCreate(ServMastBase): pass
class ServMastUpdate(ServMastBase): pass
class ServMastResponse(ServMastBase):
    SrvCode: int
    class Config: from_attributes = True

class ServRateMstBase(BaseModel):
    SrmSrvCode: int
    SrmRateType: str
    SrmRefCode: Optional[int] = None
    SrmEffDate: Optional[date] = None
    SrmStartTime: Optional[int] = None
    SrmEndTime: Optional[int] = None
    SrmRate: float = 0.0
    SrmShare: float = 0.0
    SrmDiscPer: float = 0.0
    SrmBargPer: float = 0.0
    SrmRecState: int = 1

class ServRateMstCreate(ServRateMstBase): pass
class ServRateMstUpdate(ServRateMstBase): pass
class ServRateMstResponse(ServRateMstBase):
    SrmCode: int
    class Config: from_attributes = True

# BedSrvMst
class BedSrvMstBase(BaseModel):
    BsmCode: int
    BsmSno: int
    BsmSrvCode: int
    BsmUnit: float = 1.0
    BsmRate: float = 0.0
    BsmRecState: int = 1

class BedSrvMstCreate(BedSrvMstBase): pass
class BedSrvMstUpdate(BedSrvMstBase): pass
class BedSrvMstResponse(BedSrvMstBase):
    BsmICode: int
    class Config: from_attributes = True


class PartyGrpMstBase(BaseModel):
    PgmName: str
    PgmDesc: Optional[str] = None
    PgmRecState: int = 1

class PartyGrpMstCreate(PartyGrpMstBase): pass
class PartyGrpMstUpdate(PartyGrpMstBase): pass
class PartyGrpMstResponse(PartyGrpMstBase):
    PgmCode: int
    class Config: from_attributes = True

class PartyMastBase(BaseModel):
    PrtTitle: Optional[str] = None
    PrtName: str
    PrtPgmCode: int
    PrtAhCode: Optional[int] = None
    PrtAddr: Optional[str] = None
    PrtAraCode: Optional[int] = None
    PrtStnCode: Optional[int] = None
    PrtTelNo: Optional[str] = None
    PrtSMSNo: Optional[str] = None
    PrtEmail: Optional[str] = None
    PrtShowInList: bool = True
    PrtRemark: Optional[str] = None
    PrtRecState: int = 1

class PartyMastCreate(PartyMastBase): pass
class PartyMastUpdate(PartyMastBase): pass
class PartyMastResponse(PartyMastBase):
    PrtCode: int
    class Config: from_attributes = True

class SubItmGrpMstBase(BaseModel):
    SigName: str
    SigDesc: Optional[str] = None
    SigRecState: int = 1

class SubItmGrpMstCreate(SubItmGrpMstBase): pass
class SubItmGrpMstUpdate(SubItmGrpMstBase): pass
class SubItmGrpMstResponse(SubItmGrpMstBase):
    SigCode: int
    class Config: from_attributes = True

class SubItmMastBase(BaseModel):
    SimName: str
    SimDesc: Optional[str] = None
    SimSigCode: int
    SimPurchRate: float = 0.0
    SimMRPRate: float = 0.0
    SimSaleRate: float = 0.0
    SimItmCode: int = 0
    SimRecState: int = 1

class SubItmMastCreate(SubItmMastBase): pass
class SubItmMastUpdate(SubItmMastBase): pass
class SubItmMastResponse(SubItmMastBase):
    SimCode: int
    class Config: from_attributes = True
