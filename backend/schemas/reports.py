from pydantic import BaseModel
from datetime import date
from typing import Optional, List

class OpdReportItem(BaseModel):
    Date: date
    TotalPatients: int
    TotalRevenue: float
    
    class Config: from_attributes = True

class IpdReportItem(BaseModel):
    IhdCode: int
    IhdVchNo: int
    IhdDate: date
    IhdPttCode: int
    IhdStatus: str
    IhdDischDate: Optional[date] = None
    IhdAdvAmt: float
    
    class Config: from_attributes = True

class PharmacyReportItem(BaseModel):
    Date: date
    TotalSales: float
    TotalPurchases: float
    
    class Config: from_attributes = True

class CollectionReportItem(BaseModel):
    Date: date
    Module: str
    TotalAmount: float
    TransactionCount: int

class CollectionTransaction(BaseModel):
    Date: date
    ReceiptNo: str
    PatientName: str
    DoctorName: Optional[str] = None
    Module: str
    Amount: float

# ---------------------------------------------------------------------------
# Central Collection Desk (faithful port of VB6 frmCollectionViewRep / CollView)
# Each row is one normalized money voucher (receipt / advance / payment / refund)
# Refunds are stored as negative ReceivedAmount so they net against collection.
# ---------------------------------------------------------------------------
class CollectionRow(BaseModel):
    TrnType: str            # source code e.g. "opd_reg"
    Module: str             # "Outdoor" | "Indoor" | "Lab"
    Voucher: str            # human label e.g. "Outdoor Registration"
    VchNo: str
    TrnDate: date
    TrnTime: Optional[int] = None
    PttCode: Optional[int] = None
    PttName: str = ""
    PttRegNo: Optional[int] = None
    PttRefName: str = ""
    PttAddr: str = ""
    AreaName: str = ""
    StationName: str = ""
    CategoryName: str = ""
    DoctorName: str = ""
    ServiceName: str = ""
    ServiceGroupName: str = ""
    ReceivedAmount: float = 0.0
    DiscountAmount: float = 0.0

class CollectionSummary(BaseModel):
    Count: int = 0
    ReceivedTotal: float = 0.0
    DiscountTotal: float = 0.0
    OutdoorTotal: float = 0.0
    IndoorTotal: float = 0.0
    LabTotal: float = 0.0

class CollectionResponse(BaseModel):
    Rows: List[CollectionRow]
    Summary: CollectionSummary

class ServiceReportItem(BaseModel):
    ServiceName: str
    Module: str
    Quantity: int
    TotalRevenue: float

class BedOccupancyItem(BaseModel):
    IhdCode: int
    IhdVchNo: int
    PatientName: str
    Age: str
    Gender: str
    Mobile: str
    AdmissionDate: date
    WardName: str
    BedName: str
    FloorName: str
