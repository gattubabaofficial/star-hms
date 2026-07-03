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


class UserMastCreate(BaseModel):
    UsrName: str
    UsrPwd: str
    UsrUrlCode: int
    UsrRecState: Optional[int] = 1


class UserMastUpdate(BaseModel):
    UsrName: str
    UsrPwd: Optional[str] = None
    UsrUrlCode: int
    UsrRecState: Optional[int] = 1


class UserMastResponse(BaseModel):
    UsrCode: int
    UsrName: str
    UsrUrlCode: int
    UsrRecState: int
    role_name: Optional[str] = None

    class Config:
        from_attributes = True


class ChangePasswordRequest(BaseModel):
    UsrCode: int
    current_password: str
    new_password: str


class UserRightCreate(BaseModel):
    UhtUsrCode: Optional[int] = None
    UhtUrlCode: Optional[int] = None
    UhtSecuOptName: str
    UhtCanAdd: bool = False
    UhtCanEdit: bool = False
    UhtCanDelete: bool = False
    UhtCanView: bool = False
    UhtRemark: Optional[str] = None
    UhtRecState: Optional[int] = 1


class UserRightUpdate(BaseModel):
    UhtUsrCode: Optional[int] = None
    UhtUrlCode: Optional[int] = None
    UhtSecuOptName: str
    UhtCanAdd: bool = False
    UhtCanEdit: bool = False
    UhtCanDelete: bool = False
    UhtCanView: bool = False
    UhtRemark: Optional[str] = None
    UhtRecState: Optional[int] = 1


class UserRightResponse(BaseModel):
    UhtCode: int
    UhtUsrCode: Optional[int] = None
    UhtUrlCode: Optional[int] = None
    UhtSecuOptName: str
    UhtCanAdd: bool
    UhtCanEdit: bool
    UhtCanDelete: bool
    UhtCanView: bool
    UhtRemark: Optional[str] = None
    UhtRecState: int
    user_name: Optional[str] = None
    role_name: Optional[str] = None

    class Config:
        from_attributes = True

