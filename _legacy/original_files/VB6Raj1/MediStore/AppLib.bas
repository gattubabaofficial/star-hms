Attribute VB_Name = "ApplicationLib"
Option Explicit

Public MyCompany As CompanyInfo

Public Type CompanyInfo
mCmpDrive As String
mCmpCode As Long
mCmpName As String
mCmpBooksDate As Date
mCmpFYStartDt As Date
mCmpFYEndDt As Date
mCmpAddress As String
mCmpCity As String
mCmpDistrict As String
mCmpState As String
mCmpReg1 As String
mCmpReg2 As String
mCmpReg3 As String
mCmpContPer As String
mCmpOPhone As String
mCmpRPhone As String
mCmpFax As String
mCmpEmail As String
mCmpWebsite As String
mCmpJurisdiction As String
mCmpSecPwd As String
mCmpRecState As String
Rem -------------------- user login detail
mUserAuthReqd As Boolean
mUserCode As Long
mUserName As String
mUserRoleCode As Long
mUserRoleName As String
mLoginDate As Date
mLoginTime As Long
mLogoutDate As Date
mLogoutTime As Long

End Type

Public Sub GetCompanyInfo(ByVal mCmpCode As Integer, Optional ByVal mClearPrev = True)
Dim cnn As New ADODB.Connection, tRecset As New ADODB.Recordset

If mClearPrev = True Then
    Call ClearCompanyInfo
End If
OpenCmpDataSource cnn

With tRecset
.Open "Select * from Company where CmpCode=" & CStr(mCmpCode) & "", cnn, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    MyCompany.mCmpDrive = JustFName(sCmpDataPath)
    MyCompany.mCmpCode = .fields("CmpCode")
    MyCompany.mCmpName = .fields("CmpName")
    MyCompany.mCmpBooksDate = .fields("CmpBooksDate")
    MyCompany.mCmpFYStartDt = .fields("CmpFYStartDt")
    MyCompany.mCmpFYEndDt = .fields("CmpFYEndDt")
    MyCompany.mCmpAddress = .fields("CmpAddress")
    MyCompany.mCmpCity = .fields("CmpCity")
    MyCompany.mCmpDistrict = .fields("CmpDistrict")
    MyCompany.mCmpState = .fields("CmpState")
    MyCompany.mCmpReg1 = .fields("CmpReg1")
    MyCompany.mCmpReg2 = .fields("CmpReg2")
    MyCompany.mCmpReg3 = .fields("CmpReg3")
    MyCompany.mCmpContPer = .fields("CmpContPer")
    MyCompany.mCmpOPhone = .fields("CmpOPhone")
    MyCompany.mCmpRPhone = .fields("CmpRPhone")
    MyCompany.mCmpFax = .fields("CmpFax")
    MyCompany.mCmpEmail = .fields("CmpEmail")
    MyCompany.mCmpWebsite = .fields("CmpWebsite")
    MyCompany.mCmpJurisdiction = .fields("CmpJurisdiction")
    MyCompany.mCmpSecPwd = .fields("CmpSecPwd")
    MyCompany.mCmpRecState = .fields("CmpRecState")
End If
End With
CloseTable tRecset
CloseDataSource cnn

End Sub

Public Sub ClearCompanyInfo()

With MyCompany
.mCmpDrive = ""
.mCmpCode = 0
.mCmpName = ""
.mCmpBooksDate = cUNKNOWNDATE
.mCmpFYStartDt = cUNKNOWNDATE
.mCmpFYEndDt = cUNKNOWNDATE
.mCmpAddress = ""
.mCmpCity = ""
.mCmpDistrict = ""
.mCmpState = ""
.mCmpReg1 = ""
.mCmpReg2 = ""
.mCmpReg3 = ""
.mCmpContPer = ""
.mCmpOPhone = ""
.mCmpRPhone = ""
.mCmpFax = ""
.mCmpEmail = ""
.mCmpWebsite = ""
.mCmpJurisdiction = ""
.mCmpSecPwd = ""
.mCmpRecState = 0
Rem ------------------------
.mUserAuthReqd = False
.mUserCode = 0
.mUserName = ""
.mUserRoleCode = 0
.mUserRoleName = ""
.mLoginDate = cUNKNOWNDATE
.mLoginTime = 0
.mLogoutDate = cUNKNOWNDATE
.mLogoutTime = 0

End With

End Sub

