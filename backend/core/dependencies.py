from fastapi import Depends, HTTPException, status
from fastapi.security import OAuth2PasswordBearer
from jose import jwt, JWTError
from sqlalchemy.orm import Session
from backend.database import SessionLocal
from backend.core.security import SECRET_KEY, ALGORITHM
from backend.schemas.auth import TokenData
from backend.models.auth import UserMast

oauth2_scheme = OAuth2PasswordBearer(tokenUrl="api/auth/login")

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

def get_current_user(db: Session = Depends(get_db), token: str = Depends(oauth2_scheme)) -> UserMast:
    credentials_exception = HTTPException(
        status_code=status.HTTP_401_UNAUTHORIZED,
        detail="Could not validate credentials",
        headers={"WWW-Authenticate": "Bearer"},
    )
    try:
        payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
        username: str = payload.get("sub")
        if username is None:
            raise credentials_exception
        token_data = TokenData(username=username)
    except JWTError:
        raise credentials_exception
        
    user = db.query(UserMast).filter(UserMast.UsrName == token_data.username).first()
    if user is None:
        raise credentials_exception
    return user

def get_current_active_user(current_user: UserMast = Depends(get_current_user)) -> UserMast:
    if current_user.UsrRecState == 0:
        raise HTTPException(status_code=400, detail="Inactive user")
    return current_user
