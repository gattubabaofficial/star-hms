from pydantic import BaseModel
from typing import Optional

class CompanyFullSchema(BaseModel):
    CmpName: Optional[str] = ""
    CmpAddress: Optional[str] = ""
    CmpCity: Optional[str] = ""
    CmpState: Optional[str] = ""
    CmpOPhone: Optional[str] = ""
    CmpEmail: Optional[str] = ""
    CmpWebsite: Optional[str] = ""
    CmpReg1: Optional[str] = ""

    class Config:
        from_attributes = True

class SysOptsSchema(BaseModel):
    SysId: int = 1
    
    TimewseServShareSys: bool = False
    RTowseServShareSys: bool = False
    RBywseServShareSys: bool = False
    PcgwseServShareSys: bool = False
    DctwseServShareSys: bool = False
    ExtServShareSys: bool = False
    
    TimewseServBargSys: bool = False
    RTowseServBargSys: bool = False
    RBywseServBargSys: bool = False
    PcgwseServBargSys: bool = False
    DctwseServBargSys: bool = False
    ExtServBargSys: bool = False
    
    TimewseServDiscSys: bool = False
    RTowseServDiscSys: bool = False
    RBywseServDiscSys: bool = False
    PcgwseServDiscSys: bool = False
    DctwseServDiscSys: bool = False
    ExtServDiscSys: bool = False
    
    TimewseServRateSys: bool = False
    RTowseServRateSys: bool = False
    RBywseServRateSys: bool = False
    PcgwseServRateSys: bool = False
    DctwseServRateSys: bool = False
    ExtServRateSys: bool = False
    
    OpdDefaultTaxRate: float = 0.0
    OpdDefaultDiscount: float = 0.0
    OpdReceiptPrefix: str = "OPD-"
    OpdPrintReceiptOnSave: bool = True
    OpdAllowCredit: bool = False
    OpdDefaultDoctorCharges: float = 0.0
    
    IpdDefaultTaxRate: float = 0.0
    IpdReceiptPrefix: str = "IPD-"
    IpdPrintReceiptOnSave: bool = True
    IpdAutoCalculateBedCharges: bool = True
    IpdEnforceAdvancePayment: bool = False
    IpdMinAdvanceAmount: float = 0.0
    IpdDischargeTimeLimit: int = 12
    
    LabDefaultTaxRate: float = 0.0
    LabReceiptPrefix: str = "LAB-"
    LabPrintReceiptOnSave: bool = True
    LabAutoApproveResults: bool = False
    LabAllowCredit: bool = False

    class Config:
        from_attributes = True
