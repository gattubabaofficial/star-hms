VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsCmpMasterEntry"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Dim m_dbCmpDatabase As ADODB.Connection, m_dbAcDatabase As ADODB.Connection
Dim mTableName As String, mCodeField As String, mNameField As String, mRecStateField As String, mTitleName As String
Dim mClassUIdCode As Long, mClassUIdFileName As String, mClassAcsPermFileName As String
Public blnUserRoleMast As Boolean, blnUserMast As Boolean, blnUserRightMast As Boolean
Public mCode_lng As Long, mName_str As String, mRecState_int As Integer
Public mUrlPwd_str As String
Public mUsrPwd_str As String, mUsrUrlCode_lng As Long
Public mUhtUrlCode_lng As Long, mUhtUsrCode_lng As Long, mUhtSecuOptName_str As String, mUhtSecuOptTitle_str As String, mUhtCanAdd_bln As Boolean, mUhtCanEdit_bln As Boolean, mUhtCanDelete_bln As Boolean, mUhtCanView_bln As Boolean, mUhtRemark_str As String

Dim mActiveMast As Integer, aMastTran() As Variant

Public Sub Init()
If blnUserRoleMast = True Then
    mTableName = "UserRoleMst"
    mCodeField = "UrlCode"
    mNameField = "UrlName"
    mRecStateField = "UrlRecState"
    mTitleName = "User Role Master"
    
ElseIf blnUserMast = True Then
    mTableName = "UserMast"
    mCodeField = "UsrCode"
    mNameField = "UsrName"
    mRecStateField = "UsrRecState"
    mTitleName = "User Master"
    
ElseIf blnUserRightMast = True Then
    mTableName = "UserRightMst"
    mCodeField = "UhtCode"
    mNameField = ""
    mRecStateField = "UhtRecState"
    mTitleName = "User Right Master"
    
Else
    ErrorBox "clsCmpMasterEntry_#32_[Undefined Case]"
End If

End Sub

Public Property Set dbCmpDatabase(ByRef db As ADODB.Connection)
Set m_dbCmpDatabase = db

End Property

Public Property Set dbAcDatabase(ByRef db As ADODB.Connection)
Set m_dbAcDatabase = db

End Property

Private Sub Class_Initialize()
aMastTran = Array()
mActiveMast = UBound(aMastTran)

mClassUIdFileName = "clCmpMEn.UId"
mClassAcsPermFileName = "clCmpMEn.Acp"
mClassUIdCode = GetUIdCode("clsCmpMasterEntry_Initialize", mUIdFileName:=mClassUIdFileName, mAcsPermFileName:=mClassAcsPermFileName)

End Sub

Public Sub GetData(ByVal mCode As Long)
Dim tRecset As New ADODB.Recordset, acount As Integer

Me.Clear
With tRecset
.Open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbCmpDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    mCode_lng = .fields(mCodeField)
    If mNameField <> "" Then
        mName_str = .fields(mNameField)
    End If
    mRecState_int = .fields(mRecStateField)
    If blnUserRoleMast = True Then
        mUrlPwd_str = .fields("UrlPwd")
        
    ElseIf blnUserMast = True Then
        mUsrPwd_str = .fields("UsrPwd")
        mUsrUrlCode_lng = .fields("UsrUrlCode")
        
    ElseIf blnUserRightMast = True Then
        mUhtUrlCode_lng = .fields("UhtUrlCode")
        mUhtUsrCode_lng = .fields("UhtUsrCode")
        mUhtSecuOptName_str = .fields("UhtSecuOptName")
        mUhtSecuOptTitle_str = .fields("UhtSecuOptTitle")
        mUhtCanAdd_bln = .fields("UhtCanAdd")
        mUhtCanEdit_bln = .fields("UhtCanEdit")
        mUhtCanDelete_bln = .fields("UhtCanDelete")
        mUhtCanView_bln = .fields("UhtCanView")
        mUhtRemark_str = .fields("UhtRemark")
        
    End If
End If
End With
CloseTable tRecset

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Sub

End Sub

Public Sub Clear()
mCode_lng = 0
mName_str = ""
mRecState_int = 0
If blnUserRoleMast = True Then
    mUrlPwd_str = ""
    
ElseIf blnUserMast = True Then
    mUsrPwd_str = ""
    mUsrUrlCode_lng = 0
    
ElseIf blnUserRightMast = True Then
    mUhtUrlCode_lng = 0
    mUhtUsrCode_lng = 0
    mUhtSecuOptName_str = ""
    mUhtSecuOptTitle_str = ""
    mUhtCanAdd_bln = False
    mUhtCanEdit_bln = False
    mUhtCanDelete_bln = False
    mUhtCanView_bln = False
    mUhtRemark_str = ""

End If

End Sub

Private Sub Class_Terminate()
If UBound(aMastTran) >= LBound(aMastTran) Then
    ErrorBox mTitleName & " Entry in Process !!!"
End If

End Sub

Public Function BeginMast(ByVal mCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset
BeginMast = False

If mCode = 0 Then
    mCode = GetUIdCode("clsCmpMasterEntry_BeginMast", mUIdFileName:=mClassUIdFileName, mAcsPermFileName:=mClassAcsPermFileName) * -1
    If mCode = 0 Then
        ErrorBox mTitleName & " Entry Failed !!!"
        GoTo EndSub
    End If
ElseIf mCode > 0 Then
    tRecset.Open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbCmpDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.EOF = True Then
        ErrorBox mTitleName & " Entry not Found !!!"
        GoTo EndSub
    End If
    CloseTable tRecset
Else
    ErrorBox "Invalid " & mTitleName & " Entry !!!"
    GoTo EndSub
End If
mActiveMast = UBound(aMastTran) + 1
ReDim Preserve aMastTran(mActiveMast)
aMastTran(mActiveMast) = mCode

Call Data_CreateLog(mCode)

BeginMast = True

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Function

End Function

Public Function EndMast(ByVal mCode As Long) As Boolean
Dim mCnt As Integer

EndMast = False
If Chk_ActiveMast() = False Or IIf(ActiveCode > 0, mCode <> ActiveCode, False) Then
    ErrorBox "No Active " & mTitleName & " Entry !!!"
    Exit Function
End If
Call Data_RemoveLog(mCode)

For mCnt = (mActiveMast + 1) To UBound(aMastTran)
    If (mCnt - 1) >= LBound(aMastTran) Then
        aMastTran(mCnt - 1) = aMastTran(mCnt)
    End If
Next mCnt
If LBound(aMastTran) = UBound(aMastTran) Then
    aMastTran = Array()
Else
    ReDim Preserve aMastTran(UBound(aMastTran) - 1)
End If
If mActiveMast > UBound(aMastTran) Then
    mActiveMast = mActiveMast - 1
End If

EndMast = True
End Function

Public Property Get ActiveCode() As Long
On Error GoTo errhand

ActiveCode = aMastTran(mActiveMast)

Exit Property

errhand:
ErrorBox Err.Description
ActiveCode = -1
Exit Property

End Property

Rem update transactional sum up, physically deletes records marked for deletion or marks ok records for added or edited
Public Function UpdateMast(ByVal mCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset

On Error GoTo errhand

UpdateMast = False
m_dbCmpDatabase.BeginTrans
Rem updating Master
With tRecset
.Open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbCmpDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    If InList(.fields(mRecStateField), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
        .fields(mRecStateField) = cREC_UNCHANGED
        .Update
    Else
        .fields(mRecStateField) = ChkDeleteRecStatus(.fields(mRecStateField))
        .Update
        .Delete
    End If
End If
End With
CloseTable tRecset
m_dbCmpDatabase.CommitTrans

UpdateMast = True
GoTo EndSub

errhand:
MsgBox Err.Description
m_dbCmpDatabase.Cancel

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Function

End Function

Rem checks entries with log table, if log exist restores log records else delete records (assuming new records added), balance updation part not done here because master entries does not have effect while in process
Public Function CancelMast(ByVal mCode As Long) As Boolean
Dim t1Recset As New ADODB.Recordset, t2Recset As New ADODB.Recordset
Dim mRecEdited As Boolean, mRecDeleted As Boolean

CancelMast = False
If Chk_ActiveMast() = False Or mCode <> ActiveCode Then
    ErrorBox "No Active " & mTitleName & " Entry to Cancel !!!"
    GoTo EndSub
End If
'mCode = ActiveCode
On Error GoTo errhand

m_dbCmpDatabase.BeginTrans
With t1Recset
.Open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbCmpDatabase, adOpenKeyset, adLockOptimistic
t2Recset.Open "Select * from " & mTableName & "_Log where " & mCodeField & "=" & CStr(mCode) & "", m_dbCmpDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    If t2Recset.EOF = False Then
        ' any prior updations can be made here
        If mNameField <> "" Then
            .fields(mNameField) = t2Recset.fields(mNameField)
        End If
        .fields(mRecStateField) = t2Recset.fields(mRecStateField)
        If blnUserRoleMast = True Then
            .fields("UrlPwd") = t2Recset.fields("UrlPwd")
        
        ElseIf blnUserMast = True Then
            .fields("UsrPwd") = t2Recset.fields("UsrPwd")
            .fields("UsrUrlCode") = t2Recset.fields("UsrUrlCode")
            
        ElseIf blnUserRightMast = True Then
            .fields("UhtUrlCode") = t2Recset.fields("UhtUrlCode")
            .fields("UhtUsrCode") = t2Recset.fields("UhtUsrCode")
            .fields("UhtSecuOptName") = t2Recset.fields("UhtSecuOptName")
            .fields("UhtSecuOptTitle") = t2Recset.fields("UhtSecuOptTitle")
            .fields("UhtCanAdd") = t2Recset.fields("UhtCanAdd")
            .fields("UhtCanEdit") = t2Recset.fields("UhtCanEdit")
            .fields("UhtCanDelete") = t2Recset.fields("UhtCanDelete")
            .fields("UhtCanView") = t2Recset.fields("UhtCanView")
            .fields("UhtRemark") = t2Recset.fields("UhtRemark")
            
        End If
        .Update
    Else
        ' any prior updations can be made here
        .fields(mRecStateField) = ChkDeleteRecStatus(.fields(mRecStateField))
        .Update
        .Delete
    End If
End If
End With
CloseTable t1Recset
CloseTable t2Recset
m_dbCmpDatabase.CommitTrans

CancelMast = True
GoTo EndSub

errhand:
MsgBox Err.Description
m_dbCmpDatabase.Cancel

EndSub:
CloseTable t1Recset, mCheckOpen:=True
CloseTable t2Recset, mCheckOpen:=True
Exit Function

End Function

Rem marking records for deletion
Public Function DeleteMast(ByVal mCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset

DeleteMast = False
If Chk_ActiveMast() = False Or mCode <> ActiveCode Then
    ErrorBox "No Active " & mTitleName & " Entry to Delete !!!"
    GoTo EndSub
End If
On Error GoTo errhand

m_dbCmpDatabase.BeginTrans
With tRecset
.Open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbCmpDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    .fields(mRecStateField) = ChkDeleteRecStatus(.fields(mRecStateField))
    .Update
Else
    ErrorBox "clsCmpMasterEntry_DeleteMast_254"
End If
End With
CloseTable tRecset
m_dbCmpDatabase.CommitTrans

DeleteMast = True
GoTo EndSub

errhand:
MsgBox Err.Description
m_dbCmpDatabase.Cancel

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Function

End Function

Public Function SelectMast(ByVal mCode As Long) As Boolean
Dim mEntryFound As Boolean

SelectMast = False
If mCode < 1 Then
    ErrorBox "Invalid " & mTitleName & " Entry !!!"
    Exit Function
End If
mEntryFound = False
For mActiveMast = LBound(aMastTran) To UBound(aMastTran)
    If aMastTran(mActiveMast) = mCode Then
        mEntryFound = True
        Exit For
    End If
Next mActiveMast
If mEntryFound = False Then
    mActiveMast = UBound(aMastTran) + 1
End If

SelectMast = True
End Function

Public Function NextMast() As Boolean
NextMast = False
If EOMast = True Then
    ErrorBox "End of " & mTitleName & " Entry !!!"
    Exit Function
End If
mActiveMast = mActiveMast + 1

NextMast = True
End Function

Public Function PreviousMast()
PreviousMast = False
If BOMast = True Then
    ErrorBox "Begining of " & mTitleName & " Entry !!!"
    Exit Function
End If
mActiveMast = mActiveMast - 1

PreviousMast = True
End Function

Public Function FirstMast() As Boolean
FirstMast = False
If CountMast = 0 Then
    ErrorBox "No " & mTitleName & " Entry !!!"
    Exit Function
End If
mActiveMast = LBound(aMastTran)

FirstMast = True

End Function

Public Function LastMast() As Boolean
LastMast = False
If CountMast = 0 Then
    ErrorBox "No " & mTitleName & " Entry !!!"
    Exit Function
End If
mActiveMast = UBound(aMastTran)

LastMast = True

End Function

Public Property Get CountMast() As Integer
If UBound(aMastTran) = -1 Then
    CountMast = 0
Else
    CountMast = UBound(aMastTran) - LBound(aMastTran) + 1
End If

End Property

Public Property Get EOMast() As Boolean
EOMast = (mActiveMast > UBound(aMastTran) Or UBound(aMastTran) = -1)

End Property

Public Property Get BOMast() As Boolean
BOMast = (mActiveMast < LBound(aMastTran) Or UBound(aMastTran) = -1)

End Property

Public Function Chk_ActiveMast() As Boolean
If BOMast = False And EOMast = False Then
    Chk_ActiveMast = True
Else
    Chk_ActiveMast = False
End If

End Function

Private Function Data_CreateLog(ByVal mCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset

Data_CreateLog = False
If Chk_ActiveMast() = False Or mCode <> ActiveCode Then
    ErrorBox "No Active " & mTitleName & " Entry to Create Log !!!"
    GoTo EndSub
End If

With tRecset
.Open "Select * from " & mTableName & "_Log where " & mCodeField & "=" & CStr(mCode) & "", m_dbCmpDatabase, adOpenKeyset, adLockOptimistic
If .EOF = True Then
    m_dbCmpDatabase.BeginTrans
    m_dbCmpDatabase.Execute "Insert into " & mTableName & "_Log" & " Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & ""
    m_dbCmpDatabase.CommitTrans
Else
    AlertBox "Unsaved " & mTitleName & " Entry !!!"
End If
End With
CloseTable tRecset
Data_CreateLog = True

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Function

End Function

Private Function Data_RemoveLog(ByVal mCode As Long) As Boolean
Data_RemoveLog = False
If Chk_ActiveMast() = False Or mCode <> ActiveCode Then
    ErrorBox "No Active " & mTitleName & " Entry to Remove Log !!!"
    Exit Function
End If

m_dbCmpDatabase.BeginTrans
m_dbCmpDatabase.Execute "Delete from " & mTableName & "_Log" & " where " & mCodeField & "=" & CStr(mCode)
m_dbCmpDatabase.CommitTrans

Data_RemoveLog = True

End Function

Public Function AddNew() As Boolean
Dim tRecset As New ADODB.Recordset, mCanAddNew As Boolean, mLCount As Integer, mUCount As Integer, acount As Integer

mCanAddNew = True
AddNew = False
If mNameField <> "" Then
    tRecset.Open "Select " & mNameField & " from " & mTableName & " where " & mNameField & "='" & mName_str & "'", m_dbCmpDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.EOF = False Then
        mCanAddNew = False
        ErrorBox "Duplicate Name !!!"
    End If
    CloseTable tRecset
End If

On Error GoTo errhand
mCode_lng = 0
If mCanAddNew = True Then
    m_dbCmpDatabase.BeginTrans
    With tRecset
    .Open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(-0.1) & "", m_dbCmpDatabase, adOpenKeyset, adLockOptimistic
    
    .AddNew
    Rem .Fields(mCodeField) = mCode_lng AutoNumber
    If mNameField <> "" Then
        .fields(mNameField) = mName_str
    End If
    .fields(mRecStateField) = cREC_ADDED
    If blnUserRoleMast = True Then
        .fields("UrlPwd") = mUrlPwd_str
        
    ElseIf blnUserMast = True Then
        .fields("UsrPwd") = mUsrPwd_str
        .fields("UsrUrlCode") = mUsrUrlCode_lng
        
    ElseIf blnUserRightMast = True Then
        .fields("UhtUrlCode") = mUhtUrlCode_lng
        .fields("UhtUsrCode") = mUhtUsrCode_lng
        .fields("UhtSecuOptName") = mUhtSecuOptName_str
        .fields("UhtSecuOptTitle") = mUhtSecuOptTitle_str
        .fields("UhtCanAdd") = mUhtCanAdd_bln
        .fields("UhtCanEdit") = mUhtCanEdit_bln
        .fields("UhtCanDelete") = mUhtCanDelete_bln
        .fields("UhtCanView") = mUhtCanView_bln
        .fields("UhtRemark") = mUhtRemark_str
        
    End If
    .Update
    mCode_lng = .fields(mCodeField)
    aMastTran(mActiveMast) = mCode_lng
    End With
    CloseTable tRecset
    
    m_dbCmpDatabase.CommitTrans
End If
AddNew = True
GoTo EndSub

errhand:
MsgBox Err.Description
m_dbCmpDatabase.Cancel

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Function

End Function

Public Function Update(ByVal mCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset, mCanUpdate As Boolean, mLCount As Integer, mUCount As Integer, acount As Integer

Update = False
mCanUpdate = True
If mNameField <> "" Then
    tRecset.Open "Select " & mNameField & " from " & mTableName & " where " & mNameField & "='" & mName_str & "' and " & mCodeField & "<>" & CStr(mCode) & "", m_dbCmpDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.EOF = False Then
        mCanUpdate = False
        ErrorBox "Duplicate Name !!!"
    End If
    CloseTable tRecset
End If

On Error GoTo errhand
mCode_lng = 0
If mCanUpdate = True Then
    m_dbCmpDatabase.BeginTrans
    With tRecset
    .Open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbCmpDatabase, adOpenKeyset, adLockOptimistic
    
    If mNameField <> "" Then
        .fields(mNameField) = mName_str
    End If
    .fields(mRecStateField) = ChkEditRecStatus(.fields(mRecStateField))
    If blnUserRoleMast = True Then
        .fields("UrlPwd") = mUrlPwd_str
        
    ElseIf blnUserMast = True Then
        .fields("UsrPwd") = mUsrPwd_str
        .fields("UsrUrlCode") = mUsrUrlCode_lng
        
    ElseIf blnUserRightMast = True Then
        .fields("UhtUrlCode") = mUhtUrlCode_lng
        .fields("UhtUsrCode") = mUhtUsrCode_lng
        .fields("UhtSecuOptName") = mUhtSecuOptName_str
        .fields("UhtSecuOptTitle") = mUhtSecuOptTitle_str
        .fields("UhtCanAdd") = mUhtCanAdd_bln
        .fields("UhtCanEdit") = mUhtCanEdit_bln
        .fields("UhtCanDelete") = mUhtCanDelete_bln
        .fields("UhtCanView") = mUhtCanView_bln
        .fields("UhtRemark") = mUhtRemark_str
    
    End If
    
    .Update
    mCode_lng = .fields(mCodeField)
    End With
    CloseTable tRecset
    
    m_dbCmpDatabase.CommitTrans
End If
Update = True
GoTo EndSub

errhand:
MsgBox Err.Description
m_dbCmpDatabase.Cancel

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Function

End Function

Public Function CanDeleteMast(ByVal mCode As Long, Optional ByVal mSkipConfirm As Boolean) As Boolean
Dim mDeleteit As Boolean

mDeleteit = True

If ChkEntryExist(mCode) = True Then
    ErrorBox "Entry Exist !!!"
    mDeleteit = False
End If
If mDeleteit = True And mSkipConfirm = False Then
    mDeleteit = CanDelete()
End If

CanDeleteMast = mDeleteit

End Function

Rem returns item name for either item code or item reference
Public Function GetName(ByVal mCode As Long) As String
Dim tRecset As New ADODB.Recordset, mRtnval As String

mRtnval = ""
With tRecset
.Open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbCmpDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    mRtnval = .fields(mNameField)
End If
End With
CloseTable tRecset
GetName = mRtnval

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Function

End Function

Public Function ChkEntryExist(ByVal mCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset

With tRecset
'.Open "Select * from Journal where JrnAhCode=" & CStr(mCode) & IIf(mExcludeOpn = True, " and JrnCode<>" & CStr(cOPJRNCODE), "") & "", m_dbCmpDatabase, adOpenKeyset, adLockReadOnly
'ChkEntryExist = (.RecordCount > 0)
End With
'CloseTable tRecset
MsgBox "Pending !!!"
ChkEntryExist = True

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Function

End Function

