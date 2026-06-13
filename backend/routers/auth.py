from datetime import timedelta
from fastapi import APIRouter, Depends, HTTPException, status
from fastapi.security import OAuth2PasswordRequestForm
from sqlalchemy.orm import Session
from backend.database import get_db
from backend.core.security import verify_password, create_access_token, ACCESS_TOKEN_EXPIRE_MINUTES, get_password_hash
from backend.models import User
from backend.schemas import Token, UserResponse, UserCreate
from backend.core.dependencies import get_current_active_user, get_db as dep_get_db

router = APIRouter()

@router.post("/login", response_model=Token)
def login_access_token(db: Session = Depends(dep_get_db), form_data: OAuth2PasswordRequestForm = Depends()):
    user = db.query(User).filter(User.username == form_data.username).first()
    if not user or not verify_password(form_data.password, user.hashed_password):
        raise HTTPException(status_code=400, detail="Incorrect username or password")
    if not user.is_active:
        raise HTTPException(status_code=400, detail="Inactive user")

    access_token_expires = timedelta(minutes=ACCESS_TOKEN_EXPIRE_MINUTES)
    access_token = create_access_token(
        subject=user.username, expires_delta=access_token_expires
    )
    return {"access_token": access_token, "token_type": "bearer"}

@router.get("/me", response_model=UserResponse)
def read_users_me(current_user: User = Depends(get_current_active_user)):
    return current_user

@router.post("/setup-admin", response_model=UserResponse)
def setup_admin(db: Session = Depends(dep_get_db)):
    # Check if admin already exists
    admin = db.query(User).filter(User.username == "admin").first()
    if admin:
        return admin
        
    # Create default admin
    new_admin = User(
        username="admin",
        email="admin@hms.com",
        hashed_password=get_password_hash("admin123"),
        full_name="System Administrator",
        role="admin",
        is_active=True
    )
    db.add(new_admin)
    db.commit()
    db.refresh(new_admin)
    return new_admin
