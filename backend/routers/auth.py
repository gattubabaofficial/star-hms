from datetime import timedelta
from fastapi import APIRouter, Depends, HTTPException, status
from fastapi.security import OAuth2PasswordRequestForm
from sqlalchemy.orm import Session
from backend.database import get_db
from backend.core.security import verify_password, create_access_token, ACCESS_TOKEN_EXPIRE_MINUTES
from backend.models.auth import UserMast, UserRightMst, Company
from backend.schemas.auth import Token, UserProfile, UserRightSchema, CompanySchema
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
