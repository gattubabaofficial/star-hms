from pydantic import BaseModel
from datetime import date
from typing import Optional

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
