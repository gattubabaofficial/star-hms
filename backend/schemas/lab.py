from pydantic import BaseModel
from typing import Optional, List
from datetime import date

class LabRcptBase(BaseModel):
    LrdSrvCode: Optional[int] = None
    LrdUnit: float = 1.0
    LrdRate: float = 0.0
    LrdAmtBefDisc: float = 0.0
    LrdDiscPer: float = 0.0
    LrdDiscAmt: float = 0.0
    LrdAmtAftDisc: float = 0.0

class LabRcptCreate(LabRcptBase):
    pass

class LabRcptResponse(LabRcptBase):
    LrdCode: int
    LrdLhdCode: int
    class Config: from_attributes = True

class LabHdrBase(BaseModel):
    LhdDate: date
    LhdPttCode: int
    LhdCDctCode: Optional[int] = None
    LhdRByCode: Optional[int] = None
    LhdDiscPer: float = 0.0
    LhdTotalAmt: float = 0.0
    LhdRecvdAmt: float = 0.0
    LhdRfugAmt: float = 0.0
    LhdBalAmt: float = 0.0
    LhdAdvAmt: float = 0.0
    LhdRemark: Optional[str] = None

class LabHdrCreate(LabHdrBase):
    details: List[LabRcptCreate]

class LabHdrResponse(LabHdrBase):
    LhdCode: int
    LhdVchNo: int
    class Config: from_attributes = True

# -----------------------------------
# Unified Payment / Refund Requests
# -----------------------------------
from enum import Enum

class LabTransactionType(str, Enum):
    RECEIPT = 'receipt'

class LabPaymentRequest(BaseModel):
    transaction_type: LabTransactionType
    ref_id: int
    amount: float
    date: date

class LabRefundRequest(BaseModel):
    transaction_type: LabTransactionType
    ref_id: int
    amount: float
    date: date
