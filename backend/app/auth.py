import bcrypt
import jwt
from datetime import datetime, timedelta
from fastapi import Depends, HTTPException, Security, Header
from fastapi.security import HTTPBearer, HTTPAuthorizationCredentials
from sqlalchemy.orm import Session, joinedload
from typing import Optional
from .config import settings
from .database import get_db
from . import models

security = HTTPBearer(auto_error=False)

def hash_password(password: str) -> str:
    pwd_bytes = password.encode('utf-8')
    salt = bcrypt.gensalt(10)
    hashed = bcrypt.hashpw(pwd_bytes, salt)
    return hashed.decode('utf-8')

def compare_password(password: str, hashed: str) -> bool:
    try:
        return bcrypt.checkpw(password.encode('utf-8'), hashed.encode('utf-8'))
    except Exception:
        return False

def sign_token(payload: dict) -> str:
    expires_in_str = settings.JWT_EXPIRES_IN
    hours = 24
    if expires_in_str.endswith("h"):
        hours = int(expires_in_str[:-1])
    elif expires_in_str.endswith("d"):
        hours = int(expires_in_str[:-1]) * 24
    
    exp = datetime.utcnow() + timedelta(hours=hours)
    full_payload = {**payload, "exp": exp}
    return jwt.encode(full_payload, settings.JWT_SECRET, algorithm="HS256")

def verify_token(token: str) -> dict:
    try:
        return jwt.decode(token, settings.JWT_SECRET, algorithms=["HS256"])
    except jwt.ExpiredSignatureError:
        raise HTTPException(status_code=401, detail="Not authorized, token expired")
    except jwt.PyJWTError:
        raise HTTPException(status_code=401, detail="Not authorized, token failed")

def get_current_user(
    credentials: Optional[HTTPAuthorizationCredentials] = Security(security),
    x_api_key: Optional[str] = Header(None, alias="x-api-key"),
    db: Session = Depends(get_db)
):
    # 1. API key authentication check
    if x_api_key and x_api_key == settings.SYNC_API_KEY:
        return {
            "user": None,
            "companyCode": 1,
            "is_sync_agent": True
        }

    # 2. Token authentication check
    if not credentials:
        raise HTTPException(status_code=401, detail="Not authorized, token missing")
        
    token = credentials.credentials
    payload = verify_token(token)
    usr_code = payload.get("UsrCode")
    
    user = db.query(models.UserMast).options(
        joinedload(models.UserMast.role).joinedload(models.UserRoleMst.rights)
    ).filter(models.UserMast.UsrCode == usr_code).first()
    
    if not user:
        raise HTTPException(status_code=401, detail="Not authorized, user not found")
        
    return {
        "user": user,
        "companyCode": payload.get("CmpCode")
    }

def has_right(user: models.UserMast, option_name: str, permission: str) -> bool:
    if not user or not user.role:
        return False
        
    # Search in role rights
    right = next((r for r in user.role.rights if r.UhtSecuOptName == option_name), None)
    if not right:
        return False
        
    field_map = {
        "Add": "UhtCanAdd",
        "Edit": "UhtCanEdit",
        "Delete": "UhtCanDelete",
        "View": "UhtCanView"
    }
    
    attr = field_map.get(permission)
    if not attr:
        return False
        
    return getattr(right, attr, False) is True
