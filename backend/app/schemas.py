from pydantic import BaseModel
from typing import Optional, List, Dict, Any

class LoginRequest(BaseModel):
    username: str
    password: str
    companyCode: str

class UserResponse(BaseModel):
    username: str
    code: int
    role: Optional[int] = None

class CompanyResponse(BaseModel):
    code: int
    name: str

class LoginResponse(BaseModel):
    token: str
    user: UserResponse
    company: CompanyResponse

class GenericRightUpdate(BaseModel):
    UhtCanAdd: bool
    UhtCanEdit: bool
    UhtCanDelete: bool
    UhtCanView: bool

class GenericRightsBatch(BaseModel):
    rights: List[Dict[str, Any]]
