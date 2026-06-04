from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from backend.database import get_db
from backend.models.system import SysOpts
from backend.schemas.system import SysOptsSchema

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
