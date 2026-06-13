from sqlalchemy import Column, Integer, String, Boolean, Double, SmallInteger, Float
from backend.database import Base

class SysOpts(Base):
    __tablename__ = "SysOpts"
    
    # Primary Key - we'll likely just have 1 row for the global settings
    SysId = Column(Integer, primary_key=True, index=True, default=1)
    
    # ----------------------------------------------------
    # General Options (from HmsOpts.frm)
    # ----------------------------------------------------
    TimewseServShareSys = Column(Boolean, default=False)
    RTowseServShareSys = Column(Boolean, default=False)
    RBywseServShareSys = Column(Boolean, default=False)
    PcgwseServShareSys = Column(Boolean, default=False)
    DctwseServShareSys = Column(Boolean, default=False)
    ExtServShareSys = Column(Boolean, default=False)
    
    TimewseServBargSys = Column(Boolean, default=False)
    RTowseServBargSys = Column(Boolean, default=False)
    RBywseServBargSys = Column(Boolean, default=False)
    PcgwseServBargSys = Column(Boolean, default=False)
    DctwseServBargSys = Column(Boolean, default=False)
    ExtServBargSys = Column(Boolean, default=False)
    
    TimewseServDiscSys = Column(Boolean, default=False)
    RTowseServDiscSys = Column(Boolean, default=False)
    RBywseServDiscSys = Column(Boolean, default=False)
    PcgwseServDiscSys = Column(Boolean, default=False)
    DctwseServDiscSys = Column(Boolean, default=False)
    ExtServDiscSys = Column(Boolean, default=False)
    
    TimewseServRateSys = Column(Boolean, default=False)
    RTowseServRateSys = Column(Boolean, default=False)
    RBywseServRateSys = Column(Boolean, default=False)
    PcgwseServRateSys = Column(Boolean, default=False)
    DctwseServRateSys = Column(Boolean, default=False)
    ExtServRateSys = Column(Boolean, default=False)
    
    # ----------------------------------------------------
    # OPD Options (from HmsOpOpt.frm)
    # ----------------------------------------------------
    OpdDefaultTaxRate = Column(Float, default=0.0)
    OpdDefaultDiscount = Column(Float, default=0.0)
    OpdReceiptPrefix = Column(String(10), default="OPD-")
    OpdPrintReceiptOnSave = Column(Boolean, default=True)
    OpdAllowCredit = Column(Boolean, default=False)
    OpdDefaultDoctorCharges = Column(Float, default=0.0)
    
    # ----------------------------------------------------
    # IPD Options (from HmsIpOpt.frm)
    # ----------------------------------------------------
    IpdDefaultTaxRate = Column(Float, default=0.0)
    IpdReceiptPrefix = Column(String(10), default="IPD-")
    IpdPrintReceiptOnSave = Column(Boolean, default=True)
    IpdAutoCalculateBedCharges = Column(Boolean, default=True)
    IpdEnforceAdvancePayment = Column(Boolean, default=False)
    IpdMinAdvanceAmount = Column(Float, default=0.0)
    IpdDischargeTimeLimit = Column(Integer, default=12) # e.g. 12 PM
    
    # ----------------------------------------------------
    # Lab Options (from HmsLbOpt.frm)
    # ----------------------------------------------------
    LabDefaultTaxRate = Column(Float, default=0.0)
    LabReceiptPrefix = Column(String(10), default="LAB-")
    LabPrintReceiptOnSave = Column(Boolean, default=True)
    LabAutoApproveResults = Column(Boolean, default=False)
    LabAllowCredit = Column(Boolean, default=False)
    
class SysOpts_Log(Base):
    __tablename__ = "SysOpts_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    SysId = Column(Integer)
    # Only capturing ID and action for brevity in logs unless full history is required
