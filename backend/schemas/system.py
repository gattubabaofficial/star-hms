from pydantic import BaseModel
from typing import Optional, List

class CompanyBase(BaseModel):
    CmpName: str
    CmpAddress: Optional[str] = None
    CmpCity: Optional[str] = None
    CmpState: Optional[str] = None
    CmpOPhone: Optional[str] = None
    CmpEmail: Optional[str] = None
    CmpWebsite: Optional[str] = None
    CmpReg1: Optional[str] = None

class CompanyCreate(CompanyBase):
    pass

class CompanyResponse(CompanyBase):
    CmpCode: int
    class Config: from_attributes = True

class RoleRightCreate(BaseModel):
    UhtSecuOptName: str
    UhtCanAdd: bool = False
    UhtCanEdit: bool = False
    UhtCanDelete: bool = False
    UhtCanView: bool = False

class UserRoleBase(BaseModel):
    UrlName: str

class UserRoleCreate(UserRoleBase):
    rights: List[RoleRightCreate] = []

class UserRoleResponse(UserRoleBase):
    UrlCode: int
    rights: List[RoleRightCreate] = []
    class Config: from_attributes = True

class UserBase(BaseModel):
    UsrName: str
    UsrUrlCode: int

class UserCreate(UserBase):
    UsrPwd: str

class UserResponse(UserBase):
    UsrCode: int
    class Config: from_attributes = True
