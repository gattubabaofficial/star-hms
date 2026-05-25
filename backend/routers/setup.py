from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.orm import Session
from backend.database import get_db
from backend.models.auth import Company, UserMast, UserRoleMst, UserRightMst
from backend.schemas.setup import HospitalRegisterRequest, HospitalRegisterResponse
from backend.core.security import get_password_hash

router = APIRouter()

@router.post("/register-hospital", response_model=HospitalRegisterResponse)
def register_hospital(req: HospitalRegisterRequest, db: Session = Depends(get_db)):
    # 0. Ensure only one company can be registered
    if db.query(Company).first():
        raise HTTPException(status_code=400, detail="A hospital is already registered in the system.")

    # 1. Check if username already exists globally (optional, but good practice)
    existing_user = db.query(UserMast).filter(UserMast.UsrName == req.admin_username).first()
    if existing_user:
        raise HTTPException(status_code=400, detail="Username already exists")

    try:
        # 2. Create Company
        new_company = Company(
            CmpName=req.company_name,
            CmpRecState=1
        )
        db.add(new_company)
        db.flush() # get CmpCode

        # 3. Create Admin Role
        admin_role = UserRoleMst(
            UrlName="Administrator",
            UrlRecState=1
        )
        db.add(admin_role)
        db.flush() # get UrlCode

        # 4. Create Admin User
        admin_user = UserMast(
            UsrName=req.admin_username,
            UsrPwd=get_password_hash(req.admin_password),
            UsrUrlCode=admin_role.UrlCode,
            UsrRecState=1
        )
        db.add(admin_user)
        db.flush() # get UsrCode

        # 5. Grant all rights
        default_modules = ["Dashboard", "OPD", "IPD", "Masters", "Reports", "Pharmacy", "System"]
        for module in default_modules:
            right = UserRightMst(
                UhtUsrCode=admin_user.UsrCode,
                UhtUrlCode=admin_role.UrlCode,
                UhtSecuOptName=module,
                UhtCanAdd=True,
                UhtCanEdit=True,
                UhtCanDelete=True,
                UhtCanView=True,
                UhtRecState=1
            )
            db.add(right)

        db.commit()

        return HospitalRegisterResponse(
            success=True,
            message="Hospital registered successfully",
            company_id=new_company.CmpCode
        )
    except Exception as e:
        db.rollback()
        raise HTTPException(status_code=500, detail=str(e))
