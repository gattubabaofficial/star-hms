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
Public blnSecurityMast As Boolean, blnUserMast As Boolean, blnVendorMast As Boolean
Public mCode_lng As Long, mName_str As String
Public mUsrSecCode_lng As Long
Public mAhCode_lng As Long, mAhName_str As String

Dim mActiveMast As Integer, aMastTran() As Variant

Public Sub Init()
If blnSecurityMast = True Then
    mTableName = "SecuMast"
    mCodeField = "SecCode"
    mNameField = "SecName"
    mRecStateField = "SecRecState"
    mTitleName = "Security Master"
ElseIf blnUserMast = True Then
    mTableName = "UserMast"
    mCodeField = "UsrCode"
    mNameField = "UsrName"
    mRecStateField = "UsrRecState"
    mTitleName = "User Master"
ElseIf blnVendorMast = True Then
    mTableName = "VendMast"
    mCodeField = "VndCode"
    mNameField = ""
    mRecStateField = "VndRecState"
    mTitleName = "Vendor Master"
Else
    ErrorBox "clsComMasterEntry_#32_[Undefined Case]"
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

End Sub

Public Sub GetData(ByVal mCode As Long)
Dim tRecset As New ADODB.Recordset, t1Recset As New ADODB.Recordset, acount As Integer

Me.Clear
With tRecset
.Open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbCmpDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    mCode_lng = .Fields(mCodeField)
    If mNameField <> "" Then
        mName_str = .Fields(mNameField)
    End If
    If blnSecurityMast = True Then
    
    ElseIf blnUserMast = True Then
        mUsrSecCode_lng = .Fields("UsrSecCode")
    ElseIf blnVendorMast = True Then
        t1Recset.Open "Select * from AchdMast where AhCode=" & CStr(mCode) & "", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
        If t1Recset.EOF = False Then
            mAhCode_lng = t1Recset.Fields("AhCode")
            mAhName_str = t1Recset.Fields("AhName")
        End If
        CloseTable t1Recset
    End If
End If
End With
CloseTable tRecset

EndSub:
CloseTable tRecset, mCheckOpen:=True
CloseTable t1Recset, mCheckOpen:=True
Exit Sub

End Sub

Public Sub Clear()
mCode_lng = 0
mName_str = ""
If blnSecurityMast = True Then

ElseIf blnUserMast = True Then
    mUsrSecCode_lng = 0
ElseIf blnVendorMast = True Then
    mAhCode_lng = 0
    mAhName_str = ""
End If

End Sub

Private Sub Class_Terminate()
If UBound(aMastTran) >= LBound(aMastTran) Then
    ErrorBox mTitleName & " Entry in Process !!!"
End If

End Sub

Rem mInhCode -> Inherited Code from any Other Table
Public Function BeginMast(ByVal mCode As Long, Optional ByVal mInhCode) As Boolean
Dim tRecset As New ADODB.Recordset
BeginMast = False

If mCode = 0 Then
    If IsMissing(mInhCode) = False Then
        mCode = mInhCode
    Else
        mCode = GetNextSeqno(m_dbCmpDatabase, mTableName, mCodeField)
    End If
    If mCode < 1 Then
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
If Chk_ActiveMast() = False Or mCode <> ActiveCode Then
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
UpdateMast = False

On Error GoTo errhand

m_dbCmpDatabase.BeginTrans
Rem updating Master
With tRecset
.Open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbCmpDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    If InList(.Fields(mRecStateField), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
        .Fields(mRecStateField) = cREC_UNCHANGED
        .Update
    Else
        .Fields(mRecStateField) = ChkDeleteRecStatus(.Fields(mRecStateField))
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
Dim tRecset As New ADODB.Recordset, LogRS As New ADODB.Recordset
Dim mRecEdited As Boolean, mRecDeleted As Boolean

CancelMast = False
If Chk_ActiveMast() = False Or mCode <> ActiveCode Then
    ErrorBox "No Active " & mTitleName & " Entry to Cancel !!!"
    GoTo EndSub
End If
'mCode = ActiveCode
On Error GoTo errhand

m_dbCmpDatabase.BeginTrans
With tRecset
.Open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbCmpDatabase, adOpenKeyset, adLockOptimistic
LogRS.Open "Select * from " & mTableName & "_Log where " & mCodeField & "=" & CStr(mCode) & "", m_dbCmpDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    If LogRS.EOF = False Then
        ' any prior updations can be made here
        If mNameField <> "" Then
            .Fields(mNameField) = LogRS.Fields(mNameField)
        End If
        .Fields(mRecStateField) = LogRS.Fields(mRecStateField)
        If blnSecurityMast = True Then
        
        ElseIf blnUserMast = True Then
            .Fields("UsrSecCode") = LogRS.Fields("UsrSecCode")
        ElseIf blnVendorMast = True Then
        
        End If
        .Update
    Else
        ' any prior updations can be made here
        .Fields(mRecStateField) = ChkDeleteRecStatus(.Fields(mRecStateField))
        .Update
        .Delete
    End If
End If
End With
CloseTable tRecset
CloseTable LogRS
m_dbCmpDatabase.CommitTrans

CancelMast = True
GoTo EndSub

errhand:
MsgBox Err.Description
m_dbCmpDatabase.Cancel

EndSub:
CloseTable tRecset, mCheckOpen:=True
CloseTable LogRS, mCheckOpen:=True
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
    .Fields(mRecStateField) = ChkDeleteRecStatus(.Fields(mRecStateField))
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
Dim LogRS As New ADODB.Recordset

Data_CreateLog = False
If Chk_ActiveMast() = False Or mCode <> ActiveCode Then
    ErrorBox "No Active " & mTitleName & " Entry to Create Log !!!"
    GoTo EndSub
End If

With LogRS
.Open "Select * from " & mTableName & "_Log where " & mCodeField & "=" & CStr(mCode) & "", m_dbCmpDatabase, adOpenKeyset, adLockOptimistic
If .EOF = True Then
    m_dbCmpDatabase.BeginTrans
    m_dbCmpDatabase.Execute "Insert into " & mTableName & "_Log" & " Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & ""
    m_dbCmpDatabase.CommitTrans
Else
    AlertBox "Unsaved " & mTitleName & " Entry !!!"
End If
End With
CloseTable LogRS
Data_CreateLog = True

EndSub:
CloseTable LogRS, mCheckOpen:=True
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

Public Sub AddNew(Optional ByVal mInhCode)
Dim tRecset As New ADODB.Recordset, mCanAddNew As Boolean, mLCount As Integer, mUCount As Integer, acount As Integer
mCanAddNew = True

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
    If IsMissing(mInhCode) = False Then
        .Fields(mCodeField) = mInhCode
    Else
        Rem .Fields(mCodeField) = mCode_lng AutoNumber
    End If
    If mNameField <> "" Then
        .Fields(mNameField) = mName_str
    End If
    .Fields(mRecStateField) = cREC_ADDED
    If blnSecurityMast = True Then
    
    ElseIf blnUserMast = True Then
        .Fields("UsrSecCode") = mUsrSecCode_lng
    ElseIf blnVendorMast = True Then
    
    End If
    
    .Update
    mCode_lng = .Fields(mCodeField)
    aMastTran(mActiveMast) = mCode_lng
    End With
    CloseTable tRecset
    
    m_dbCmpDatabase.CommitTrans
End If
GoTo EndSub

errhand:
MsgBox Err.Description
m_dbCmpDatabase.Cancel

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Sub

End Sub

Public Sub Update(ByVal mCode As Long)
Dim tRecset As New ADODB.Recordset, mCanUpdate As Boolean, mLCount As Integer, mUCount As Integer, acount As Integer
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
        .Fields(mNameField) = mName_str
    End If
    .Fields(mRecStateField) = ChkEditRecStatus(.Fields(mRecStateField))
    If blnSecurityMast = True Then
    
    ElseIf blnUserMast = True Then
        .Fields("UsrSecCode") = mUsrSecCode_lng
    ElseIf blnVendorMast = True Then
    
    End If
    
    .Update
    mCode_lng = .Fields(mCodeField)
    End With
    CloseTable tRecset
    
    m_dbCmpDatabase.CommitTrans
End If
GoTo EndSub

errhand:
MsgBox Err.Description
m_dbCmpDatabase.Cancel

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Sub

End Sub

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
If blnVendorMast = True Then
    With tRecset
    .Open "Select * from AchdMast where AhCode=" & CStr(mCode) & "", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount > 0 Then
        mRtnval = .Fields("AhName")
    End If
    End With
    CloseTable tRecset
Else
    With tRecset
    .Open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbCmpDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount > 0 Then
        mRtnval = .Fields(mNameField)
    End If
    End With
    CloseTable tRecset
End If
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

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Function

End Function

