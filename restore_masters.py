import re

# 1. Remove them from pharmacy.py
with open('backend/models/pharmacy.py', 'r', encoding='utf-8') as f:
    content = f.read()

classes = ['SubItmGrpMst', 'SubItmMast', 'PartyGrpMst', 'PartyMast']
for cls in classes:
    pattern = r'class\s+' + cls + r'\(Base\):.*?(?=class\s+[A-Za-z0-9_]+\(Base\):|\Z)'
    content = re.sub(pattern, '', content, flags=re.DOTALL)

with open('backend/models/pharmacy.py', 'w', encoding='utf-8') as f:
    f.write(content)

# 2. Add them to masters.py
robust_models = """

class PartyGrpMst(Base):
    __tablename__ = "PartyGrpMst"
    PgmCode = Column(Integer, primary_key=True, autoincrement=True)
    PgmName = Column(String(50), nullable=False)
    PgmDesc = Column(String(50))
    PgmRecState = Column(SmallInteger, nullable=False, default=1)

class PartyMast(Base):
    __tablename__ = "PartyMast"
    PrtCode = Column(Integer, primary_key=True, autoincrement=True)
    PrtTitle = Column(String(10))
    PrtName = Column(String(50), nullable=False)
    PrtPgmCode = Column(Integer, ForeignKey("PartyGrpMst.PgmCode"), nullable=False)
    PrtAhCode = Column(Integer)
    PrtAddr = Column(String(250))
    PrtAraCode = Column(Integer, ForeignKey("AreaMast.AraCode"))
    PrtStnCode = Column(Integer, ForeignKey("StsnMast.StnCode"))
    PrtTelNo = Column(String(50))
    PrtSMSNo = Column(String(50))
    PrtEmail = Column(String(50))
    PrtShowInList = Column(Boolean, default=True)
    PrtRemark = Column(String(50))
    PrtRecState = Column(SmallInteger, nullable=False, default=1)
    
    group = relationship("PartyGrpMst")

class SubItmGrpMst(Base):
    __tablename__ = "SubItmGrpMst"
    SigCode = Column(Integer, primary_key=True, autoincrement=True)
    SigName = Column(String(50), nullable=False)
    SigDesc = Column(String(50))
    SigRecState = Column(SmallInteger, nullable=False, default=1)

class SubItmMast(Base):
    __tablename__ = "SubItmMast"
    SimCode = Column(Integer, primary_key=True, autoincrement=True)
    SimName = Column(String(50), nullable=False)
    SimDesc = Column(String(50))
    SimSigCode = Column(Integer, ForeignKey("SubItmGrpMst.SigCode"), nullable=False)
    SimPurchRate = Column(Double, nullable=False, default=0.0)
    SimMRPRate = Column(Double, nullable=False, default=0.0)
    SimSaleRate = Column(Double, nullable=False, default=0.0)
    SimItmCode = Column(Integer, default=0)
    SimRecState = Column(SmallInteger, nullable=False, default=1)
    
    group = relationship("SubItmGrpMst")
"""

with open('backend/models/masters.py', 'a', encoding='utf-8') as f:
    f.write(robust_models)

# 3. Add robust schemas to schemas/masters.py
robust_schemas = """
class PartyGrpMstBase(BaseModel):
    PgmName: str
    PgmDesc: Optional[str] = None
    PgmRecState: int = 1

class PartyGrpMstCreate(PartyGrpMstBase): pass
class PartyGrpMstUpdate(PartyGrpMstBase): pass
class PartyGrpMstResponse(PartyGrpMstBase):
    PgmCode: int
    class Config: from_attributes = True

class PartyMastBase(BaseModel):
    PrtTitle: Optional[str] = None
    PrtName: str
    PrtPgmCode: int
    PrtAhCode: Optional[int] = None
    PrtAddr: Optional[str] = None
    PrtAraCode: Optional[int] = None
    PrtStnCode: Optional[int] = None
    PrtTelNo: Optional[str] = None
    PrtSMSNo: Optional[str] = None
    PrtEmail: Optional[str] = None
    PrtShowInList: bool = True
    PrtRemark: Optional[str] = None
    PrtRecState: int = 1

class PartyMastCreate(PartyMastBase): pass
class PartyMastUpdate(PartyMastBase): pass
class PartyMastResponse(PartyMastBase):
    PrtCode: int
    class Config: from_attributes = True

class SubItmGrpMstBase(BaseModel):
    SigName: str
    SigDesc: Optional[str] = None
    SigRecState: int = 1

class SubItmGrpMstCreate(SubItmGrpMstBase): pass
class SubItmGrpMstUpdate(SubItmGrpMstBase): pass
class SubItmGrpMstResponse(SubItmGrpMstBase):
    SigCode: int
    class Config: from_attributes = True

class SubItmMastBase(BaseModel):
    SimName: str
    SimDesc: Optional[str] = None
    SimSigCode: int
    SimPurchRate: float = 0.0
    SimMRPRate: float = 0.0
    SimSaleRate: float = 0.0
    SimItmCode: int = 0
    SimRecState: int = 1

class SubItmMastCreate(SubItmMastBase): pass
class SubItmMastUpdate(SubItmMastBase): pass
class SubItmMastResponse(SubItmMastBase):
    SimCode: int
    class Config: from_attributes = True
"""

with open('backend/schemas/masters.py', 'a', encoding='utf-8') as f:
    f.write(robust_schemas)

# 4. Remove schemas from schemas/pharmacy.py
with open('backend/schemas/pharmacy.py', 'r', encoding='utf-8') as f:
    content = f.read()

for cls in classes:
    pattern = r'class\s+' + cls + r'.*?(?=class\s+[A-Za-z0-9_]+|\Z)'
    content = re.sub(pattern, '', content, flags=re.DOTALL)

with open('backend/schemas/pharmacy.py', 'w', encoding='utf-8') as f:
    f.write(content)
