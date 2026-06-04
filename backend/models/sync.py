from sqlalchemy import Column, Integer, String, DateTime, Text
from sqlalchemy.sql import func
from backend.database import Base

class SyncLog(Base):
    __tablename__ = "SyncLog"
    id = Column(Integer, primary_key=True, index=True)
    table_name = Column(String(60), nullable=False)
    record_id = Column(Integer, nullable=False)
    operation = Column(String(10), nullable=False) # INSERT/UPDATE/DELETE
    synced_at = Column(DateTime(timezone=True), server_default=func.now())
    source = Column(String(20), default='local') # 'local' or 'cloud'
    checksum = Column(String(64))

class SyncConfig(Base):
    __tablename__ = "SyncConfig"
    id = Column(Integer, primary_key=True, index=True)
    key = Column(String(60), unique=True, nullable=False)
    value = Column(Text)
    updated_at = Column(DateTime(timezone=True), server_default=func.now(), onupdate=func.now())



class SyncLog_Log(Base):
    __tablename__ = "SyncLog_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    id = Column(Integer)
    table_name = Column(String(60), nullable=False)
    record_id = Column(Integer, nullable=False)
    operation = Column(String(10), nullable=False) # INSERT/UPDATE/DELETE
    synced_at = Column(DateTime(timezone=True), server_default=func.now())
    source = Column(String(20), default='local') # 'local' or 'cloud'
    checksum = Column(String(64))



class SyncConfig_Log(Base):
    __tablename__ = "SyncConfig_Log"
    LogId = Column(Integer, primary_key=True, autoincrement=True)
    LogAction = Column(String(10), nullable=False)
    LogDate = Column(DateTime, default=func.now())
    id = Column(Integer)
    key = Column(String(60), nullable=False)
    value = Column(Text)
    updated_at = Column(DateTime(timezone=True), server_default=func.now(), onupdate=func.now())

