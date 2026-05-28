from fastapi import APIRouter, Depends
from fastapi.responses import JSONResponse
from sqlalchemy.orm import Session
from typing import List
from datetime import datetime
import json

from backend.database import get_db
from backend.models.auth import Company, UserRoleMst, UserMast
from backend.schemas.system import (
    CompanyCreate, CompanyResponse,
    UserRoleCreate, UserRoleResponse,
    UserCreate, UserResponse
)
from backend.models.opd import OutdReg
from backend.models.ipd import IndrHdr
from backend.models.lab import LabHdr
from backend.models.pharmacy import OutdStk

router = APIRouter()

# -----------------------------------------------------
# Hospital Profile (Company)
# -----------------------------------------------------
@router.get("/company", response_model=CompanyResponse)
def get_company(db: Session = Depends(get_db)):
    company = db.query(Company).first()
    if not company:
        # Return default empty company if not exists
        return Company(CmpCode=0, CmpName="STAR HOSPITAL")
    return company

@router.post("/company", response_model=CompanyResponse)
def update_company(company_in: CompanyCreate, db: Session = Depends(get_db)):
    company = db.query(Company).first()
    if not company:
        company = Company(**company_in.model_dump())
        db.add(company)
    else:
        for key, value in company_in.model_dump().items():
            setattr(company, key, value)
    db.commit()
    db.refresh(company)
    return company

# -----------------------------------------------------
# User Roles
# -----------------------------------------------------
@router.get("/roles", response_model=List[UserRoleResponse])
def get_roles(db: Session = Depends(get_db)):
    return db.query(UserRoleMst).filter(UserRoleMst.UrlRecState == 1).order_by(UserRoleMst.UrlName).all()

@router.post("/roles", response_model=UserRoleResponse)
def create_role(role_in: UserRoleCreate, db: Session = Depends(get_db)):
    from backend.models.auth import UserRightMst
    # 1. Create Role
    db_role = UserRoleMst(UrlName=role_in.UrlName, UrlRecState=1)
    db.add(db_role)
    db.flush() # get UrlCode
    
    # 2. Add Rights
    for right in role_in.rights:
        db_right = UserRightMst(
            UhtUrlCode=db_role.UrlCode,
            UhtSecuOptName=right.UhtSecuOptName,
            UhtCanAdd=right.UhtCanAdd,
            UhtCanEdit=right.UhtCanEdit,
            UhtCanDelete=right.UhtCanDelete,
            UhtCanView=right.UhtCanView,
            UhtRecState=1
        )
        db.add(db_right)
        
    db.commit()
    db.refresh(db_role)
    return db_role

@router.delete("/roles/{role_id}")
def delete_role(role_id: int, db: Session = Depends(get_db)):
    db_role = db.query(UserRoleMst).filter(UserRoleMst.UrlCode == role_id).first()
    if db_role:
        db_role.UrlRecState = 0
        db.commit()
    return {"message": "Role deleted"}

# -----------------------------------------------------
# Users
# -----------------------------------------------------
@router.get("/users", response_model=List[UserResponse])
def get_users(db: Session = Depends(get_db)):
    return db.query(UserMast).filter(UserMast.UsrRecState == 1).order_by(UserMast.UsrName).all()

@router.post("/users", response_model=UserResponse)
def create_user(user_in: UserCreate, db: Session = Depends(get_db)):
    # Note: In a real app, hash the password here (e.g., pwd_context.hash(user_in.UsrPwd))
    db_user = UserMast(**user_in.model_dump())
    db.add(db_user)
    db.commit()
    db.refresh(db_user)
    return db_user

# -----------------------------------------------------
# Backup Utility
# -----------------------------------------------------
@router.get("/backup")
def get_backup(db: Session = Depends(get_db)):
    from backend.database import Base
    dump = {}
    
    for table_name, table in Base.metadata.tables.items():
        records = db.execute(table.select()).mappings().all()
        table_data = []
        for r in records:
            row_dict = dict(r)
            for k, v in row_dict.items():
                if hasattr(v, 'isoformat'):
                    row_dict[k] = v.isoformat()
            table_data.append(row_dict)
        dump[table_name] = table_data
        
    return JSONResponse(
        content=dump,
        headers={
            "Content-Disposition": f"attachment; filename=star-hms-backup-{datetime.now().strftime('%Y%m%d%H%M%S')}.json"
        }
    )

# -----------------------------------------------------
# Dashboard Stats
# -----------------------------------------------------
@router.get("/dashboard-stats")
def get_dashboard_stats(db: Session = Depends(get_db)):
    today = datetime.now().date()
    
    opd_today = db.query(OutdReg).filter(OutdReg.OpgDate == today, OutdReg.OpgRecState == 1).count()
    ipd_today = db.query(IndrHdr).filter(IndrHdr.IhdDate == today, IndrHdr.IhdRecState == 1).count()
    lab_today = db.query(LabHdr).filter(LabHdr.LhdDate == today, LabHdr.LhdRecState == 1).count()
    
    from sqlalchemy import func
    pharmacy_sales = db.query(func.sum(OutdStk.OskNetAmt)).filter(OutdStk.OskDate == today, OutdStk.OskRecState == 1).scalar()
    
    return {
        "opdPatients": opd_today,
        "ipdAdmissions": ipd_today,
        "labReports": lab_today,
        "pharmacySales": pharmacy_sales or 0
    }

