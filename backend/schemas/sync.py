from pydantic import BaseModel
from typing import List, Dict, Any, Optional
from datetime import datetime

class SyncRecord(BaseModel):
    record_id: int
    operation: str # 'INSERT', 'UPDATE', 'DELETE'
    data: Dict[str, Any]

class SyncPushRequest(BaseModel):
    table_name: str
    records: List[SyncRecord]

class SyncLogResponse(BaseModel):
    id: int
    table_name: str
    record_id: int
    operation: str
    synced_at: datetime
    source: str

    class Config:
        from_attributes = True

class SyncConfigResponse(BaseModel):
    key: str
    value: str
    updated_at: datetime

    class Config:
        from_attributes = True
