from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from sqlalchemy import text
from typing import List
import json
from backend.database import get_db
from backend.models.sync import SyncLog, SyncConfig
from backend.schemas.sync import SyncPushRequest, SyncLogResponse, SyncConfigResponse

router = APIRouter()

@router.post("/push")
def push_sync_records(request: SyncPushRequest, db: Session = Depends(get_db)):
    """
    Receives deltas from the local MS Access sync agent and upserts them into PostgreSQL.
    """
    table_name = request.table_name
    
    # Very basic validation of table_name to prevent SQL injection
    if not table_name.isalnum():
        raise HTTPException(status_code=400, detail="Invalid table name")

    success_count = 0
    error_count = 0
    errors = []

    for record in request.records:
        try:
            # 1. UPSERT the actual data
            if record.operation in ['INSERT', 'UPDATE']:
                # Build columns and values
                columns = list(record.data.keys())
                
                # We need to construct a dynamic INSERT ON CONFLICT DO UPDATE
                # For PostgreSQL, we need to know the primary key. We will assume the primary key 
                # is the first column matching *Code pattern (e.g. PcgCode, DctCode).
                # To keep it generic, we simply rely on the SQLAlchemy metadata or do raw SQL.
                # Here we do a raw SQL implementation for simplicity.
                
                pk_col = next((col for col in columns if "Code" in col), None)
                if not pk_col:
                    pk_col = "id" # fallback

                col_names = ', '.join([f'"{c}"' for c in columns])
                placeholders = ', '.join([f':{c}' for c in columns])
                update_set = ', '.join([f'"{c}" = EXCLUDED."{c}"' for c in columns if c != pk_col])

                if update_set:
                    sql = f'''
                        INSERT INTO "{table_name}" ({col_names})
                        VALUES ({placeholders})
                        ON CONFLICT ("{pk_col}")
                        DO UPDATE SET {update_set}
                    '''
                else:
                    # Table with only a PK (unlikely)
                    sql = f'''
                        INSERT INTO "{table_name}" ({col_names})
                        VALUES ({placeholders})
                        ON CONFLICT ("{pk_col}") DO NOTHING
                    '''
                    
                db.execute(text(sql), record.data)
                
            elif record.operation == 'DELETE':
                pk_col = list(record.data.keys())[0] # assume first key is PK
                pk_val = record.data[pk_col]
                # Soft delete
                rec_state_col = pk_col.replace('Code', 'RecState')
                sql = f'UPDATE "{table_name}" SET "{rec_state_col}" = 0 WHERE "{pk_col}" = :pk'
                db.execute(text(sql), {'pk': pk_val})

            # 2. Log to SyncLog
            log_entry = SyncLog(
                table_name=table_name,
                record_id=record.record_id,
                operation=record.operation,
                source='local',
                checksum=None # Can add hash of data here if needed
            )
            db.add(log_entry)
            
            success_count += 1
            
        except Exception as e:
            error_count += 1
            errors.append({"record_id": record.record_id, "error": str(e)})
            db.rollback() # Rollback current record but continue processing others

    # 3. Update SyncConfig last_sync_time
    try:
        config = db.query(SyncConfig).filter(SyncConfig.key == "last_sync_time").first()
        if not config:
            config = SyncConfig(key="last_sync_time", value="updated")
            db.add(config)
        else:
            config.value = "updated" # Updated_at auto updates
    except Exception:
        pass

    db.commit()

    return {
        "status": "completed",
        "table": table_name,
        "processed": len(request.records),
        "success": success_count,
        "failed": error_count,
        "errors": errors
    }

@router.get("/logs", response_model=List[SyncLogResponse])
def get_sync_logs(limit: int = 100, db: Session = Depends(get_db)):
    return db.query(SyncLog).order_by(SyncLog.synced_at.desc()).limit(limit).all()

@router.get("/config", response_model=List[SyncConfigResponse])
def get_sync_config(db: Session = Depends(get_db)):
    return db.query(SyncConfig).all()
