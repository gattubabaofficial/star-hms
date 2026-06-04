from pydantic import BaseModel
from typing import Optional, List
from datetime import date

# -----------------------------------
# Masters (Items & Parties)
# -----------------------------------
class Config: from_attributes = True

class Config: from_attributes = True

# -----------------------------------
# Stock Inward (Purchases)
# -----------------------------------
class IndrStkDtlBase(BaseModel):
    IsdSimCode: Optional[int] = None
    IsdBatchNo: Optional[str] = None
    IsdExpiryDate: Optional[date] = None
    IsdMRP: float = 0.0
    IsdQty: float = 0.0
    IsdRate: float = 0.0
    IsdDiscPer: float = 0.0
    IsdDiscAmt: float = 0.0
    IsdTaxPer: float = 0.0
    IsdTaxAmt: float = 0.0
    IsdAmt: float = 0.0

class IndrStkDtlCreate(IndrStkDtlBase):
    pass

class IndrStkDtlResponse(IndrStkDtlBase):
    IsdCode: int
    IsdIskCode: int
    class Config: from_attributes = True

class IndrStkBase(BaseModel):
    IskDate: date
    IskPtyCode: Optional[int] = None
    IskRefNo: Optional[str] = None
    IskNetAmt: float = 0.0
    IskOtherChg: float = 0.0
    IskRoundOff: float = 0.0
    IskTax: float = 0.0
    IskRemark: Optional[str] = None

class IndrStkCreate(IndrStkBase):
    details: List[IndrStkDtlCreate]

class IndrStkResponse(IndrStkBase):
    IskCode: int
    IskVchNo: int
    class Config: from_attributes = True

# -----------------------------------
# Stock Outward (Sales)
# -----------------------------------
class OutdStkDtlBase(BaseModel):
    OsdSimCode: Optional[int] = None
    OsdBatchNo: Optional[str] = None
    OsdQty: float = 0.0
    OsdRate: float = 0.0
    OsdDiscPer: float = 0.0
    OsdDiscAmt: float = 0.0
    OsdTaxPer: float = 0.0
    OsdTaxAmt: float = 0.0
    OsdAmt: float = 0.0

class OutdStkDtlCreate(OutdStkDtlBase):
    pass

class OutdStkDtlResponse(OutdStkDtlBase):
    OsdCode: int
    OsdOskCode: int
    class Config: from_attributes = True

class OutdStkBase(BaseModel):
    OskDate: date
    OskPtyCode: Optional[int] = None
    OskPatCode: Optional[int] = None
    OskDocCode: Optional[int] = None
    OskCustomerName: Optional[str] = None
    OskCustomerPhone: Optional[str] = None
    OskRefNo: Optional[str] = None
    OskPaymentMode: str = 'Cash'
    OskPaidAmt: float = 0.0
    OskNetAmt: float = 0.0
    OskOtherChg: float = 0.0
    OskRoundOff: float = 0.0
    OskTax: float = 0.0
    OskRemark: Optional[str] = None

class OutdStkCreate(OutdStkBase):
    details: List[OutdStkDtlCreate]

class OutdStkResponse(OutdStkBase):
    OskCode: int
    OskVchNo: int
    class Config: from_attributes = True

# -----------------------------------
# Stock
# -----------------------------------
class StockItem(BaseModel):
    SimCode: int
    ItemName: str
    GroupName: str
    BatchNo: Optional[str] = None
    ExpiryDate: Optional[date] = None
    MRP: float = 0.0
    InwardQty: float
    OutwardQty: float
    CurrentStock: float



# -----------------------------------
# Pharmacy Masters Extensions
# -----------------------------------
class Config:
        from_attributes = True

class Config:
        from_attributes = True

