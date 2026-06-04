from fastapi import APIRouter, Depends
from fastapi.responses import JSONResponse
from sqlalchemy.orm import Session
from sqlalchemy import text
from backend.database import get_db, engine, Base
from backend.models.system import SysOpts
from backend.schemas.system import SysOptsSchema
from datetime import datetime, date
import json

router = APIRouter()

@router.get("/config", response_model=SysOptsSchema)
def get_system_config(db: Session = Depends(get_db)):
    config = db.query(SysOpts).filter(SysOpts.SysId == 1).first()
    if not config:
        # Create default if not exists
        config = SysOpts(SysId=1)
        db.add(config)
        db.commit()
        db.refresh(config)
    return config

@router.put("/config", response_model=SysOptsSchema)
def update_system_config(config_in: SysOptsSchema, db: Session = Depends(get_db)):
    config = db.query(SysOpts).filter(SysOpts.SysId == 1).first()
    if not config:
        config = SysOpts(SysId=1)
        db.add(config)
    
    # Update all fields from schema
    for key, value in config_in.model_dump().items():
        if key != 'SysId' and hasattr(config, key):
            setattr(config, key, value)
            
    db.commit()
    db.refresh(config)
    return config

# Helper for datetime/date serialization
def _json_serial(obj):
    if isinstance(obj, (datetime, date)):
        return obj.isoformat()
    raise TypeError("Type %s not serializable" % type(obj))

@router.get("/backup")
def take_database_backup(db: Session = Depends(get_db)):
    # Reflect all tables and dump their data
    backup_data = {}
    
    # Base.metadata.sorted_tables gives us tables in dependency order
    for table in Base.metadata.sorted_tables:
        table_name = table.name
        
        # We execute a direct select to get all rows
        result = db.execute(text(f'SELECT * FROM "{table_name}"')).mappings().all()
        
        # Convert each row (mapping) to a dict
        backup_data[table_name] = [dict(row) for row in result]
        
    # We return it directly, but since we have datetime objects, we should 
    # encode it manually to handle dates properly and return a Response.
    json_str = json.dumps(backup_data, default=_json_serial)
    
    filename = f"star-hms-backup-{datetime.now().strftime('%Y%m%d%H%M')}.json"
    
    return JSONResponse(
        content=json.loads(json_str), 
        headers={"Content-Disposition": f'attachment; filename="{filename}"'}
    )
