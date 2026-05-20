from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from ..database import get_db
from .. import models, schemas, auth

router = APIRouter(prefix="/auth", tags=["auth"])

@router.get("/companies")
def get_companies(db: Session = Depends(get_db)):
    companies = db.query(models.Company).filter(models.Company.CmpRecState == 1).all()
    # Return as list of simple dicts matching Next.js response keys
    return [{"CmpCode": c.CmpCode, "CmpName": c.CmpName} for c in companies]

@router.post("/login", response_model=schemas.LoginResponse)
def login(payload: schemas.LoginRequest, db: Session = Depends(get_db)):
    username = payload.username
    password = payload.password
    company_code = payload.companyCode

    # Attempt to look up by UsrCode (Int)
    usr_code_int = 0
    try:
        usr_code_int = int(username)
    except ValueError:
        pass
        
    user = None
    if usr_code_int > 0:
        user = db.query(models.UserMast).filter(models.UserMast.UsrCode == usr_code_int).first()
        
    # Fallback to UsrName query
    if not user:
        user = db.query(models.UserMast).filter(models.UserMast.UsrName == username).first()

    if not user or not auth.compare_password(password, user.UsrPwd):
        raise HTTPException(status_code=401, detail="Invalid credentials")

    # Verify company code selection
    cmp_code_int = 0
    try:
        cmp_code_int = int(company_code)
    except ValueError:
        raise HTTPException(status_code=400, detail="Invalid company code format")
        
    company = db.query(models.Company).filter(models.Company.CmpCode == cmp_code_int).first()
    if not company:
        raise HTTPException(status_code=401, detail="Invalid or inactive company selection")

    # Sign JWT
    token = auth.sign_token({
        "UsrCode": user.UsrCode,
        "UrlCode": user.UsrUrlCode,
        "CmpCode": company.CmpCode
    })

    return {
        "token": token,
        "user": {
            "username": user.UsrName,
            "code": user.UsrCode,
            "role": user.UsrUrlCode
        },
        "company": {
            "code": company.CmpCode,
            "name": company.CmpName
        }
    }

@router.get("/me")
def get_me(current_data: dict = Depends(auth.get_current_user)):
    # Match the getAuthUser return structure exactly
    user = current_data["user"]
    
    # Format rights nicely for frontend
    role_dict = None
    if user.role:
        rights_list = []
        for r in user.role.rights:
            rights_list.append({
                "UhtCode": r.UhtCode,
                "UhtSecuOptName": r.UhtSecuOptName,
                "UhtCanAdd": r.UhtCanAdd,
                "UhtCanEdit": r.UhtCanEdit,
                "UhtCanDelete": r.UhtCanDelete,
                "UhtCanView": r.UhtCanView,
            })
        role_dict = {
            "UrlCode": user.role.UrlCode,
            "UrlName": user.role.UrlName,
            "UserRightMst": rights_list
        }
        
    return {
        "user": {
            "UsrCode": user.UsrCode,
            "UsrName": user.UsrName,
            "UsrUrlCode": user.UsrUrlCode,
            "Role": role_dict
        },
        "companyCode": current_data["companyCode"]
    }
