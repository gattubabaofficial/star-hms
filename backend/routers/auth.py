from datetime import timedelta
from fastapi import APIRouter, Depends, HTTPException, status
from fastapi.security import OAuth2PasswordRequestForm
from sqlalchemy.orm import Session
from backend.database import get_db
from backend.core.security import verify_password, create_access_token, ACCESS_TOKEN_EXPIRE_MINUTES
from backend.models.auth import UserMast, UserRightMst, Company, UserRoleMst
from backend.schemas.auth import Token, UserProfile, UserRightSchema, CompanySchema, UserRoleCreate, UserRoleUpdate, UserRoleResponse
from backend.core.dependencies import get_current_active_user, get_db as dep_get_db

router = APIRouter()

@router.get("/companies", response_model=list[CompanySchema])
def get_companies(db: Session = Depends(dep_get_db)):
    companies = db.query(Company).filter(Company.CmpRecState == 1).all()
    return companies

@router.post("/login", response_model=Token)
def login_access_token(db: Session = Depends(dep_get_db), form_data: OAuth2PasswordRequestForm = Depends()):
    user = db.query(UserMast).filter(UserMast.UsrName == form_data.username).first()
    if not user or not verify_password(form_data.password, user.UsrPwd):
        raise HTTPException(status_code=400, detail="Incorrect username or password")
    if user.UsrRecState == 0:
        raise HTTPException(status_code=400, detail="Inactive user")

    access_token_expires = timedelta(minutes=ACCESS_TOKEN_EXPIRE_MINUTES)
    access_token = create_access_token(
        subject=user.UsrName, expires_delta=access_token_expires
    )
    return {"access_token": access_token, "token_type": "bearer"}

@router.get("/me", response_model=UserProfile)
def read_users_me(current_user: UserMast = Depends(get_current_active_user), db: Session = Depends(dep_get_db)):
    role_name = current_user.role.UrlName if current_user.role else ""
    
    rights_data = []
    
    # 1. Admin Bypass: If user is admin, they get full access to everything.
    if current_user.UsrName.lower() == "admin":
        default_modules = ["Dashboard", "OPD", "IPD", "Hospital Masters", "Reports", "Pharmacy", "Laboratory", "System"]
        for module in default_modules:
            rights_data.append(UserRightSchema(
                opt_name=module, can_add=True, can_edit=True, can_delete=True, can_view=True
            ))
    # 2. RBAC: Fetch rights from the User's Role
    elif current_user.role and current_user.role.rights:
        for r in current_user.role.rights:
            if r.UhtRecState == 1:
                rights_data.append(UserRightSchema(
                    opt_name=r.UhtSecuOptName,
                    can_add=r.UhtCanAdd,
                    can_edit=r.UhtCanEdit,
                    can_delete=r.UhtCanDelete,
                    can_view=r.UhtCanView
                ))
            
    return UserProfile(
        usr_code=current_user.UsrCode,
        username=current_user.UsrName,
        role=role_name,
        rights=rights_data
    )

# ---------------------------------------------------------
# User Role Master (SecuMast.frm equivalent)
# ---------------------------------------------------------

@router.get("/roles", response_model=list[UserRoleResponse])
def get_roles(db: Session = Depends(dep_get_db)):
    return db.query(UserRoleMst).filter(UserRoleMst.UrlRecState == 1).all()

@router.post("/roles", response_model=UserRoleResponse)
def create_role(role_in: UserRoleCreate, db: Session = Depends(dep_get_db)):
    new_role = UserRoleMst(
        UrlName=role_in.UrlName,
        UrlRecState=1
    )
    db.add(new_role)
    db.commit()
    db.refresh(new_role)

    if role_in.rights:
        for r in role_in.rights:
            right = UserRightMst(
                UhtUrlCode=new_role.UrlCode,
                UhtSecuOptName=r.get("UhtSecuOptName", ""),
                UhtCanView=r.get("UhtCanView", False),
                UhtCanAdd=r.get("UhtCanAdd", False),
                UhtCanEdit=r.get("UhtCanEdit", False),
                UhtCanDelete=r.get("UhtCanDelete", False)
            )
            db.add(right)
        db.commit()

    return new_role

@router.put("/roles/{role_id}", response_model=UserRoleResponse)
def update_role(role_id: int, role_in: UserRoleUpdate, db: Session = Depends(dep_get_db)):
    role = db.query(UserRoleMst).filter(UserRoleMst.UrlCode == role_id).first()
    if not role:
        raise HTTPException(status_code=404, detail="Role not found")
    
    role.UrlName = role_in.UrlName
    if role_in.UrlRecState is not None:
        role.UrlRecState = role_in.UrlRecState

    # If rights are provided, we can update them. For simplicity, delete old and insert new.
    if role_in.rights is not None:
        db.query(UserRightMst).filter(UserRightMst.UhtUrlCode == role_id).delete()
        for r in role_in.rights:
            right = UserRightMst(
                UhtUrlCode=role.UrlCode,
                UhtSecuOptName=r.get("UhtSecuOptName", ""),
                UhtCanView=r.get("UhtCanView", False),
                UhtCanAdd=r.get("UhtCanAdd", False),
                UhtCanEdit=r.get("UhtCanEdit", False),
                UhtCanDelete=r.get("UhtCanDelete", False)
            )
            db.add(right)
            
    db.commit()
    db.refresh(role)
    return role

@router.delete("/roles/{role_id}")
def delete_role(role_id: int, db: Session = Depends(dep_get_db)):
    role = db.query(UserRoleMst).filter(UserRoleMst.UrlCode == role_id).first()
    if not role:
        raise HTTPException(status_code=404, detail="Role not found")
    
    role.UrlRecState = 0
    db.commit()
    return {"message": "Role deleted successfully"}

# ---------------------------------------------------------
# User Master (UsrMast)
# ---------------------------------------------------------

from pydantic import BaseModel

class UserCreate(BaseModel):
    UsrName: str
    UsrUrlCode: int
    UsrPwd: str

class UserResponse(BaseModel):
    UsrCode: int
    UsrName: str
    UsrUrlCode: int

    class Config:
        from_attributes = True

@router.get("/users", response_model=list[UserResponse])
def get_users(db: Session = Depends(dep_get_db)):
    return db.query(UserMast).filter(UserMast.UsrRecState == 1).all()

from backend.core.security import get_password_hash

@router.post("/users", response_model=UserResponse)
def create_user(user_in: UserCreate, db: Session = Depends(dep_get_db)):
    # Check duplicate
    if db.query(UserMast).filter(UserMast.UsrName == user_in.UsrName).first():
        raise HTTPException(status_code=400, detail="Username already exists")
        
    new_user = UserMast(
        UsrName=user_in.UsrName,
        UsrUrlCode=user_in.UsrUrlCode,
        UsrPwd=get_password_hash(user_in.UsrPwd),
        UsrRecState=1
    )
    db.add(new_user)
    db.commit()
    db.refresh(new_user)
    return new_user
