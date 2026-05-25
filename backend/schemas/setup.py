from pydantic import BaseModel, Field

class HospitalRegisterRequest(BaseModel):
    company_name: str = Field(..., description="Name of the Hospital")
    admin_username: str = Field(..., description="Admin Username")
    admin_password: str = Field(..., description="Admin Password")

class HospitalRegisterResponse(BaseModel):
    success: bool
    message: str
    company_id: int
