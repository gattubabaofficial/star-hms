from pydantic import BaseModel
from typing import Optional

# 1. TestMethodMast (Lab Test Method)
class TestMethodBase(BaseModel):
    TmhName: str
    TmhShowInList: bool = True
    TmhRecState: int = 1
    TmhIndex: int = 0

class TestMethodCreate(TestMethodBase):
    pass

class TestMethodUpdate(TestMethodBase):
    pass

class TestMethodResponse(TestMethodBase):
    TmhCode: int
    class Config:
        from_attributes = True


# 2. TestSampTypMast (Lab Test Sample Type)
class TestSampTypBase(BaseModel):
    TspName: str
    TspIndex: int = 0
    TspShowInList: bool = True
    TspRecState: int = 1

class TestSampTypCreate(TestSampTypBase):
    pass

class TestSampTypUpdate(TestSampTypBase):
    pass

class TestSampTypResponse(TestSampTypBase):
    TspCode: int
    class Config:
        from_attributes = True


# 3. TestGrpMast (Lab Test Group)
class TestGrpBase(BaseModel):
    TgpName: str
    TgpPrintName: Optional[str] = None
    TgpHdrNote: Optional[str] = None
    TgpDtlNote: Optional[str] = None
    TgpFtrNote: Optional[str] = None
    TgpShowInList: bool = True
    TgpRecState: int = 1
    TgpIndex: int = 0

class TestGrpCreate(TestGrpBase):
    pass

class TestGrpUpdate(TestGrpBase):
    pass

class TestGrpResponse(TestGrpBase):
    TgpCode: int
    class Config:
        from_attributes = True


# 4. TestDeptMast (Lab Test Department)
class TestDeptBase(BaseModel):
    TdpName: str
    TdpPrintName: Optional[str] = None
    TdpHdrNote: Optional[str] = None
    TdpDtlNote: Optional[str] = None
    TdpFtrNote: Optional[str] = None
    TdpIndex: int = 0
    TdpShowInList: bool = True
    TdpRecState: int = 1

class TestDeptCreate(TestDeptBase):
    pass

class TestDeptUpdate(TestDeptBase):
    pass

class TestDeptResponse(TestDeptBase):
    TdpCode: int
    class Config:
        from_attributes = True


# 5. TestParaMast (Lab Test Parameters)
class TestParaBase(BaseModel):
    TprName: str
    TprPrintName: Optional[str] = None
    TprTmhCode: Optional[int] = None
    TprTgpCode: Optional[int] = None
    TprTdpCode: Optional[int] = None
    TprSrvCode: Optional[int] = None
    TprRng1: Optional[float] = None
    TprRng2: Optional[float] = None
    TprRngUnit: Optional[str] = None
    TprListValue: Optional[str] = None
    TprRemark: Optional[str] = None
    TprHdrNote: Optional[str] = None
    TprDtlNote: Optional[str] = None
    TprFtrNote: Optional[str] = None
    TprIndex: int = 0
    TprShowInList: bool = True
    TprRecState: int = 1
    TprTspCode: Optional[int] = None
    TprVtmCode: Optional[int] = None
    TprTvcCode: Optional[int] = None
    TprValueQExpr1: Optional[str] = None
    TprChkAutoValue: Optional[bool] = None

class TestParaCreate(TestParaBase):
    pass

class TestParaUpdate(TestParaBase):
    pass

class TestParaResponse(TestParaBase):
    TprCode: int
    class Config:
        from_attributes = True


# 6. TestFmtMast (Test Report Formats)
class TestFmtBase(BaseModel):
    TfmName: str
    TfmPrintName: Optional[str] = None
    TfmHdrNote: Optional[str] = None
    TfmDtlNote: Optional[str] = None
    TfmFtrNote: Optional[str] = None
    TfmRemark: Optional[str] = None
    TfmIndex: int = 0
    TfmShowInList: bool = True
    TfmRecState: int = 1
    TfmTspCode: Optional[int] = None
    TfmVtmCode: Optional[int] = None
    TfmRepStyle: str = "Pathology"
    TfmPrntDest: Optional[int] = None
    TfmFmtFileDesc: Optional[str] = None
    TfmAutoGen: Optional[bool] = None
    TfmDocFileDesc: Optional[str] = None
    TfmNewPage: Optional[bool] = None
    TfmMergeRepo: Optional[bool] = None

class TestFmtCreate(TestFmtBase):
    pass

class TestFmtUpdate(TestFmtBase):
    pass

class TestFmtResponse(TestFmtBase):
    TfmCode: int
    class Config:
        from_attributes = True


# 7. TestValCalcMast (Test Auto Calculation Methods)
class TestValCalcBase(BaseModel):
    TvcName: str
    TvcTprCode: Optional[int] = None
    TvcRemark: Optional[str] = None
    TvcShowInList: bool = True
    TvcRecState: int = 1

class TestValCalcCreate(TestValCalcBase):
    pass

class TestValCalcUpdate(TestValCalcBase):
    pass

class TestValCalcResponse(TestValCalcBase):
    TvcCode: int
    class Config:
        from_attributes = True
