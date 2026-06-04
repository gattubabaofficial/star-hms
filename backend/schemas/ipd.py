from pydantic import BaseModel
from typing import Optional, List
from datetime import date, datetime

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
    IhdCmpCode: Optional[int] = None
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
# Bed State (IBedState) — Legacy field names
# -----------------------------------
class IBedStateBase(BaseModel):
    IbsBdmCode: Optional[int] = None  # BedMast.BdmCode
    IbsDate: Optional[date] = None  # From date
    IbsDischDate: Optional[date] = None  # To date (discharge)
    IbsRemark: Optional[str] = None
    IbsRecState: int = 1

class IBedStateCreate(IBedStateBase):
    pass

class IBedStateResponse(IBedStateBase):
    IbsCode: int
    IbsIpgCode: int
    
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
    IbhRfugAmt: float = 0.0
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
    patient_age: Optional[str] = None
    patient_sex: Optional[str] = None
    care_of: Optional[str] = None
    attending_doctor: Optional[str] = None
    expected_discharge_date: Optional[date] = None

class BedHistoryResponse(BaseModel):
    IbsCode: int
    admission_id: Optional[int] = None
    patient_name: Optional[str] = None
    start_date: Optional[date] = None
    end_date: Optional[date] = None
    status: str


class BedStatusWard(BaseModel):
    WrdCode: int
    WrdName: str
    beds: List[BedStatusBed]

class BedStatusFloor(BaseModel):
    FlrCode: int
    FlrName: str
    wards: List[BedStatusWard]


# -----------------------------------
# IPD Doctor Shares & Payments
# -----------------------------------
class IndrBlDctDtlBase(BaseModel):
    IddIbhCode: int
    IddDctCode: Optional[int] = None
    IddSharePer: float = 0.0
    IddShareAmt: float = 0.0
    IddRecState: int = 1

class IndrBlPymtHdrBase(BaseModel):
    IbphPttCode: Optional[int] = None
    IbphDepoAmt: float = 0.0
    IbphRemark: Optional[str] = None
    IbphRecState: int = 1

class IndrBlDpogDtlBase(BaseModel):
    IpdIbhCode: Optional[int] = None
    IpdAmt: float = 0.0
    IpdDate: Optional[date] = None
    IpdRecState: int = 1

class IndrBlRefdHdrBase(BaseModel):
    IbfhPttCode: Optional[int] = None
    IbfhRefuAmt: float = 0.0
    IbfhRemark: Optional[str] = None
    IbfhRecState: int = 1

class IndrBlRfugDtlBase(BaseModel):
    IrdIbhCode: Optional[int] = None
    IrdAmt: float = 0.0
    IrdDate: Optional[date] = None
    IrdRecState: int = 1

# -----------------------------------
# IPD Registration (Legacy Intermediate)
# -----------------------------------
class IndrRegBase(BaseModel):
    IrgIhdCode: int
    IrgDate: date
    IrgAmt: float = 0.0
    IrgType: Optional[str] = None
    IrgRecState: int = 1



# -----------------------------------
# IPD Actions (Phase 5)
# -----------------------------------
class BedTransferRequest(BaseModel):
    new_bed_code: int
    transfer_date: date

class IpdAdvanceRequest(BaseModel):
    ihd_code: int
    amount: float
    date: date
    type: Optional[str] = None

class IndrRegBase(BaseModel):
    IpgDate: date
    IpgPttCode: int
    IpgCDctCode: Optional[int] = None
    IpgAdvAmt: float = 0.0
    IpgRemark: Optional[str] = None
    IpgRecState: int = 1

class IndrRegCreate(IndrRegBase):
    pass

class IndrRegResponse(IndrRegBase):
    IpgCode: int
    IpgVchNo: int
    class Config:
        from_attributes = True

class IndrRgPymtBase(BaseModel):
    IgtIpgCode: Optional[int] = None
    IgtDate: date
    IgtDpogAmt: float = 0.0
    IgtRecState: int = 1

class IndrRgRefdBase(BaseModel):
    IgfIpgCode: Optional[int] = None
    IgfDate: date
    IgfRfugAmt: float = 0.0
    IgfRecState: int = 1

class RoomRentPreview(BaseModel):
    bed_code: int
    admission_date: datetime
    discharge_date: datetime
    total_days: int
    rate_per_day: float
    total_rent: float
