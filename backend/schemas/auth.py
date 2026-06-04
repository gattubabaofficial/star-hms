from pydantic import BaseModel
from typing import List, Optional

class Token(BaseModel):
    access_token: str
    token_type: str

class TokenData(BaseModel):
    username: Optional[str] = None

class CompanySchema(BaseModel):
    CmpCode: int
    CmpName: str
    
    class Config:
        from_attributes = True

class UserRightSchema(BaseModel):
    opt_name: str
    can_add: bool
    can_edit: bool
    can_delete: bool
    can_view: bool

    class Config:
        from_attributes = True

class UserProfile(BaseModel):
    usr_code: int
    username: str
    role: str
    rights: List[UserRightSchema]

    class Config:
        from_attributes = True

class UserRoleCreate(BaseModel):
    UrlName: str
    rights: Optional[List[dict]] = None

class UserRoleUpdate(BaseModel):
    UrlName: str
    UrlRecState: Optional[int] = 1
    rights: Optional[List[dict]] = None

class UserRoleResponse(BaseModel):
    UrlCode: int
    UrlName: str
    UrlRecState: int

    class Config:
        from_attributes = True
