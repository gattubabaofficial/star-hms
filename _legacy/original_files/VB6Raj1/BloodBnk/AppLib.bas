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

Public Sub GetCompanyInfo(ByVal mCmpCode As Integer, Optional ByVal mClearPrev = True)
Dim cnn As New ADODB.Connection, tRecset As New ADODB.Recordset

If mClearPrev = True Then
    Call ClearCompanyInfo
End If
OpenCmpDataSource cnn

With tRecset
.open "Select * from Company where CmpCode=" & CStr(mCmpCode) & "", cnn, adOpenKeyset, adLockOptimistic
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

Public Function GetUserOptRightStr(ByVal mUsrCode As Long, ByVal mMenuOptName As String) As String
Dim tRecset As New ADODB.Recordset, cnn As New ADODB.Connection, mRtnval As String

OpenCmpDataSource cnn
With tRecset
.open "Select * from UserRightMst" _
    & " where UhtUsrCode = " & CStr(mUsrCode) _
    & " and UhtSecuOptName IN ('" & cUHT_SECUOPTNAME_ANY & "','" & mMenuOptName & "')" _
    , cnn, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    mRtnval = "CanAdd=" & CStr(.fields("UhtCanAdd")) _
        & ";" & "CanEdit=" & CStr(.fields("UhtCanEdit")) _
        & ";" & "CanDelete=" & CStr(.fields("UhtCanDelete")) _
        & ";" & "CanView=" & CStr(.fields("UhtCanView"))
    .Close
Else
    .Close
    .open "Select * from UserRightMst" _
        & " where UhtUrlCode = (Select UsrUrlCode from UserMast where UsrCode = " & CStr(mUsrCode) & ")" _
        & " and UhtSecuOptName IN ('" & cUHT_SECUOPTNAME_ANY & "','" & mMenuOptName & "')" _
        , cnn, adOpenKeyset, adLockOptimistic
    If .EOF = False Then
        mRtnval = "CanAdd=" & CStr(.fields("UhtCanAdd")) _
            & ";" & "CanEdit=" & CStr(.fields("UhtCanEdit")) _
            & ";" & "CanDelete=" & CStr(.fields("UhtCanDelete")) _
            & ";" & "CanView=" & CStr(.fields("UhtCanView"))
    Else
        mRtnval = "CanAdd=0" _
            & ";" & "CanEdit=0" _
            & ";" & "CanDelete=0" _
            & ";" & "CanView=0"
    End If
    .Close
End If
End With
CloseTable tRecset, mCheckOpen:=True
CloseDataSource cnn

GetUserOptRightStr = mRtnval

End Function

Public Sub AssignUserOptRightValue(ByVal mUsrCode As Long, ByVal mMenuOptName As String, Optional ByRef mCanAddOpt, Optional ByRef mCanEditOpt, Optional ByRef mCanDeleteOpt, Optional mCanViewOpt)
Dim mUsrRightStr As String, aUsrRightStr As Variant, pos As Integer
Dim aRightName As Variant, mRightName As String, mRightValue As Boolean

mUsrRightStr = GetUserOptRightStr(mUsrCode, mMenuOptName)
aUsrRightStr = Split(mUsrRightStr, ";")

For pos = LBound(aUsrRightStr) To UBound(aUsrRightStr)
    aRightName = Split(aUsrRightStr(pos), "=")
    mRightName = CStr(aRightName(LBound(aRightName)))
    mRightValue = CBool(aRightName(UBound(aRightName)))
    If mRightName = "CanAdd" Then
        mCanAddOpt = mRightValue
    ElseIf mRightName = "CanEdit" Then
        mCanEditOpt = mRightValue
    ElseIf mRightName = "CanDelete" Then
        mCanDeleteOpt = mRightValue
    ElseIf mRightName = "CanView" Then
        mCanViewOpt = mRightValue
    Else
        ErrorBox "BdkLibrary_AssignUserOptRightValue_#1349_[Undefined Case]"
    End If
Next pos

End Sub

Public Function CanUserViewOpt(ByVal mUsrCode As Long, ByVal mMenuOptName As String, Optional ByVal mRtnDefault As Boolean = False) As Boolean
Dim mRtnval As Boolean, mUsrRightStr As String, aUsrRightStr As Variant, pos As Integer
Dim aRightName As Variant, mRightName As String, mRightValue As Boolean

If MyCompany.mUserAuthReqd = False Then
    CanUserViewOpt = True
    Exit Function
End If

mRtnval = mRtnDefault
mUsrRightStr = GetUserOptRightStr(mUsrCode, mMenuOptName)
aUsrRightStr = Split(mUsrRightStr, ";")

For pos = LBound(aUsrRightStr) To UBound(aUsrRightStr)
    aRightName = Split(aUsrRightStr(pos), "=")
    mRightName = CStr(aRightName(LBound(aRightName)))
    mRightValue = CBool(aRightName(UBound(aRightName)))
    If mRightName = "CanView" Then
        mRtnval = mRightValue
        Exit For
    End If
Next pos
CanUserViewOpt = mRtnval

End Function

Public Function CanUserAddOpt(ByVal mUsrCode As Long, ByVal mMenuOptName As String, Optional ByVal mRtnDefault As Boolean = False) As Boolean
Dim mRtnval As Boolean, mUsrRightStr As String, aUsrRightStr As Variant, pos As Integer
Dim aRightName As Variant, mRightName As String, mRightValue As Boolean

If MyCompany.mUserAuthReqd = False Then
    CanUserAddOpt = True
    Exit Function
End If

mRtnval = mRtnDefault
mUsrRightStr = GetUserOptRightStr(mUsrCode, mMenuOptName)
aUsrRightStr = Split(mUsrRightStr, ";")

For pos = LBound(aUsrRightStr) To UBound(aUsrRightStr)
    aRightName = Split(aUsrRightStr(pos), "=")
    mRightName = CStr(aRightName(LBound(aRightName)))
    mRightValue = CBool(aRightName(UBound(aRightName)))
    If mRightName = "CanAdd" Then
        mRtnval = mRightValue
        Exit For
    End If
Next pos
CanUserAddOpt = mRtnval

End Function

Public Function CanUserEditOpt(ByVal mUsrCode As Long, ByVal mMenuOptName As String, Optional ByVal mRtnDefault As Boolean = False) As Boolean
Dim mRtnval As Boolean, mUsrRightStr As String, aUsrRightStr As Variant, pos As Integer
Dim aRightName As Variant, mRightName As String, mRightValue As Boolean

If MyCompany.mUserAuthReqd = False Then
    CanUserEditOpt = True
    Exit Function
End If

mRtnval = mRtnDefault
mUsrRightStr = GetUserOptRightStr(mUsrCode, mMenuOptName)
aUsrRightStr = Split(mUsrRightStr, ";")

For pos = LBound(aUsrRightStr) To UBound(aUsrRightStr)
    aRightName = Split(aUsrRightStr(pos), "=")
    mRightName = CStr(aRightName(LBound(aRightName)))
    mRightValue = CBool(aRightName(UBound(aRightName)))
    If mRightName = "CanEdit" Then
        mRtnval = mRightValue
        Exit For
    End If
Next pos
CanUserEditOpt = mRtnval

End Function

Public Function CanUserDeleteOpt(ByVal mUsrCode As Long, ByVal mMenuOptName As String, Optional ByVal mRtnDefault As Boolean = False) As Boolean
Dim mRtnval As Boolean, mUsrRightStr As String, aUsrRightStr As Variant, pos As Integer
Dim aRightName As Variant, mRightName As String, mRightValue As Boolean

If MyCompany.mUserAuthReqd = False Then
    CanUserDeleteOpt = True
    Exit Function
End If

mRtnval = mRtnDefault
mUsrRightStr = GetUserOptRightStr(mUsrCode, mMenuOptName)
aUsrRightStr = Split(mUsrRightStr, ";")

For pos = LBound(aUsrRightStr) To UBound(aUsrRightStr)
    aRightName = Split(aUsrRightStr(pos), "=")
    mRightName = CStr(aRightName(LBound(aRightName)))
    mRightValue = CBool(aRightName(UBound(aRightName)))
    If mRightName = "CanDelete" Then
        mRtnval = mRightValue
        Exit For
    End If
Next pos
CanUserDeleteOpt = mRtnval

End Function

Public Sub ShowStatusBarText(ByRef sbar1 As StatusBar)
If MyCompany.mCmpCode > 0 Then
    sbar1.Panels.Item(1) = MyCompany.mCmpName
    sbar1.Panels.Item(2) = Format(MyCompany.mCmpFYStartDt, "YYYY") & "-" & Format(MyCompany.mCmpFYEndDt, "YYYY")
    sbar1.Panels.Item(3) = MyCompany.mUserName
    sbar1.Panels.Item(4) = MyCompany.mUserRoleName
    sbar1.Panels.Item(5) = Dtoc(sDefaultDate)
    sbar1.Panels.Item(6) = Dtoc(Date)
    
Else
    sbar1.Panels.Item(1) = ""
    sbar1.Panels.Item(2) = ""
    sbar1.Panels.Item(3) = ""
    sbar1.Panels.Item(4) = ""
    sbar1.Panels.Item(5) = ""
    sbar1.Panels.Item(6) = Dtoc(Date)
    
End If

End Sub

