from pydantic import BaseModel
from typing import Optional, List
from datetime import date

# -----------------------------------
# Masters (Items & Parties)
# -----------------------------------
class SubItmMastBase(BaseModel):
    SimName: str
    SimSigCode: Optional[int] = None
    SimRecState: int = 1

class SubItmMastCreate(SubItmMastBase):
    pass

class SubItmMastResponse(SubItmMastBase):
    SimCode: int
    class Config: from_attributes = True

class PartyMastBase(BaseModel):
    PtyName: str
    PtyAddr: Optional[str] = None
    PtyAraCode: Optional[int] = None
    PtyTelNo: Optional[str] = None
    PtySMSNo: Optional[str] = None
    PtyPgpCode: Optional[int] = None
    PtyRecState: int = 1

class PartyMastCreate(PartyMastBase):
    pass

class PartyMastResponse(PartyMastBase):
    PtyCode: int
    class Config: from_attributes = True

# -----------------------------------
# Stock Inward (Purchases)
# -----------------------------------
class IndrStkDtlBase(BaseModel):
    IsdSimCode: Optional[int] = None
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
    OskRefNo: Optional[str] = None
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
    InwardQty: float
    OutwardQty: float
    CurrentStock: float

