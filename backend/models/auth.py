from sqlalchemy import Column, Integer, String, SmallInteger, Date, Boolean, ForeignKey
from sqlalchemy.orm import relationship
from backend.database import Base

class Company(Base):
    __tablename__ = "Company"
    
    CmpCode = Column(Integer, primary_key=True, index=True)
    CmpName = Column(String(60), nullable=False)
    CmpAddress = Column(String(250))
    CmpCity = Column(String(50))
    CmpDistrict = Column(String(50))
    CmpState = Column(String(50))
    CmpReg1 = Column(String(20))
    CmpReg2 = Column(String(20))
    CmpReg3 = Column(String(20))
    CmpContPer = Column(String(50))
    CmpOPhone = Column(String(30))
    CmpRPhone = Column(String(30))
    CmpFax = Column(String(30))
    CmpEmail = Column(String(60))
    CmpWebsite = Column(String(100))
    CmpJurisdiction = Column(String(50))
    CmpBooksDate = Column(Date)
    CmpFYStartDt = Column(Date)
    CmpFYEndDt = Column(Date)
    CmpSecPwd = Column(String(60))
    CmpRecState = Column(SmallInteger, nullable=False, default=1)

class UserRoleMst(Base):
    __tablename__ = "UserRoleMst"
    
    UrlCode = Column(Integer, primary_key=True, index=True)
    UrlName = Column(String(50), nullable=False)
    UrlRecState = Column(SmallInteger, nullable=False, default=1)
    
    users = relationship("UserMast", back_populates="role")
    rights = relationship("UserRightMst", back_populates="role")

class UserMast(Base):
    __tablename__ = "UserMast"
    
    UsrCode = Column(Integer, primary_key=True, index=True)
    UsrName = Column(String(50), nullable=False)
    UsrUrlCode = Column(Integer, ForeignKey("UserRoleMst.UrlCode"))
    UsrPwd = Column(String(120), nullable=False)
    UsrRecState = Column(SmallInteger, nullable=False, default=1)
    
    role = relationship("UserRoleMst", back_populates="users")
    rights = relationship("UserRightMst", back_populates="user")

class UserRightMst(Base):
    __tablename__ = "UserRightMst"
    
    UhtCode = Column(Integer, primary_key=True, index=True)
    UhtUsrCode = Column(Integer, ForeignKey("UserMast.UsrCode"))
    UhtUrlCode = Column(Integer, ForeignKey("UserRoleMst.UrlCode"))
    UhtSecuOptName = Column(String(80), nullable=False)
    UhtCanAdd = Column(Boolean, nullable=False, default=False)
    UhtCanEdit = Column(Boolean, nullable=False, default=False)
    UhtCanDelete = Column(Boolean, nullable=False, default=False)
    UhtCanView = Column(Boolean, nullable=False, default=False)
    UhtRemark = Column(String(100))
    UhtRecState = Column(SmallInteger, nullable=False, default=1)
    
    user = relationship("UserMast", back_populates="rights")
    role = relationship("UserRoleMst", back_populates="rights")
