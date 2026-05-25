from pydantic import BaseModel
from typing import Optional, List
from datetime import date

# -----------------------------------
# Inpatient Admission (IndrHdr)
# -----------------------------------
class IndrHdrBase(BaseModel):
    IhdDate: date
    IhdPttCode: int
    IhdCDctCode: Optional[int] = None
    IhdRByCode: Optional[int] = None
    IhdWrdCode: Optional[int] = None
    IhdBedCode: Optional[int] = None
    IhdFlrCode: Optional[int] = None
    IhdAdvAmt: float = 0.0
    IhdPDigCode: Optional[int] = None
    IhdStatus: str = 'Admitted'
    IhdRemark: Optional[str] = None
    IhdRecState: int = 1

class IndrHdrCreate(IndrHdrBase):
    pass

class IndrHdrUpdate(IndrHdrBase):
    pass

class IndrHdrResponse(IndrHdrBase):
    IhdCode: int
    IhdVchNo: int
    
    class Config:
        from_attributes = True

# -----------------------------------
# Bed State (IBedState)
# -----------------------------------
class IBedStateBase(BaseModel):
    IbbsIbsCode: Optional[int] = None # BedMast.BdmCode
    IbbsFromDate: Optional[date] = None
    IbbsToDate: Optional[date] = None
    IbbsRemark: Optional[str] = None
    IbbsRecState: int = 1

class IBedStateCreate(IBedStateBase):
    pass

class IBedStateResponse(IBedStateBase):
    IbbsCode: int
    IbbsICode: int
    
    class Config:
        from_attributes = True

# -----------------------------------
# Inpatient Billing (IndrBlHdr & IndrBill)
# -----------------------------------
class IndrBillBase(BaseModel):
    IbdSrvCode: Optional[int] = None
    IbdSno: Optional[int] = None
    IbdUnit: float = 1.0
    IbdRate: float = 0.0
    IbdAmtBefDisc: float = 0.0
    IbdDiscPer: float = 0.0
    IbdDiscAmt: float = 0.0
    IbdAmtAftDisc: float = 0.0

class IndrBillCreate(IndrBillBase):
    pass

class IndrBillResponse(IndrBillBase):
    IbdCode: int
    IbdIbhCode: int
    
    class Config:
        from_attributes = True

class IndrBlHdrBase(BaseModel):
    IbhDate: date
    IbhIhdCode: int
    IbhPttCode: int
    IbhBillType: Optional[str] = None
    IbhTotalAmt: float = 0.0
    IbhDiscPer: float = 0.0
    IbhDepAmt: float = 0.0
    IbhBalAmt: float = 0.0
    IbhStatus: Optional[str] = None
    IbhRemark: Optional[str] = None

class IndrBlHdrCreate(IndrBlHdrBase):
    details: List[IndrBillCreate]

class IndrBlHdrResponse(IndrBlHdrBase):
    IbhCode: int
    IbhVchNo: int
    
    class Config:
        from_attributes = True

# -----------------------------------
# Unified Payment / Refund Requests
# -----------------------------------
from enum import Enum

class IpdTransactionType(str, Enum):
    REGISTRATION = 'registration'
    BILL = 'bill'

class IpdPaymentRequest(BaseModel):
    transaction_type: IpdTransactionType
    ref_id: int
    amount: float
    date: date

class IpdRefundRequest(BaseModel):
    transaction_type: IpdTransactionType
    ref_id: int
    amount: float
    date: date

# -----------------------------------
# Bed Status Aggregation
# -----------------------------------
class BedStatusBed(BaseModel):
    BdmCode: int
    BdmName: str
    BdmCharges: float
    is_occupied: bool
    patient_id: Optional[int] = None
    patient_name: Optional[str] = None
    admission_id: Optional[int] = None

class BedStatusWard(BaseModel):
    WrdCode: int
    WrdName: str
    beds: List[BedStatusBed]

class BedStatusFloor(BaseModel):
    FlrCode: int
    FlrName: str
    wards: List[BedStatusWard]
