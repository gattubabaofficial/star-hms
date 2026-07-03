VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsComMastEntry"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Dim mCrashedEntry As Boolean
Dim m_dbAcDatabase As ADODB.Connection, m_dbStDatabase As ADODB.Connection
Dim mTableName As String, mCodeField As String, mNameField As String, mRecStateField As String, mTitleName As String
Public blnStationMast As Boolean, blnAreaMast As Boolean, blnVTypeMast As Boolean
Public mCode_lng As Long, mName_str As String, mRecState_int As Integer
Public mAraStnCode_lng As Long
Public mVtmAbvr_str As String, mVtmSysCode_int As Integer, mVtmPrefix_str As String, mVtmPostfix_str As String, mVtmItmNarr_str As String, mVtmComNarr_str As String, mVtmEditable_bln As Boolean, mVtmStartNo_lng As Long, mVtmResetNoBasis_int As Integer, mVtmIndex_int As Integer, mVtmShowInList_bln As Boolean
Dim mActiveMast As Integer, aMastTran() As Variant

Public Sub Init()
If blnStationMast = True Then
    mTableName = "StsnMast"
    mCodeField = "StnCode"
    mNameField = "StnName"
    mRecStateField = "StnRecState"
    mTitleName = "Station Master"
    
ElseIf blnAreaMast = True Then
    mTableName = "AreaMast"
    mCodeField = "AraCode"
    mNameField = "AraName"
    mRecStateField = "AraRecState"
    mTitleName = "Area Master"
    
ElseIf blnVTypeMast = True Then
    mTableName = "VTypMast"
    mCodeField = "VtmCode"
    mNameField = "VtmName"
    mRecStateField = "VtmRecState"
    mTitleName = "Voucher Type Master"
Else
    ErrorBox "clsComMastEntry_Init_#33_[Undefined Case]"
End If

End Sub

Public Property Set dbAcDatabase(ByRef db As ADODB.Connection)
Set m_dbAcDatabase = db

End Property

Public Property Set dbStDatabase(ByRef db As ADODB.Connection)
Set m_dbStDatabase = db

End Property

Private Sub Class_Initialize()
aMastTran = Array()
mActiveMast = UBound(aMastTran)

End Sub

Public Sub GetData(ByVal mCode As Long)
Dim tRecset As New ADODB.Recordset, acount As Integer

Me.Clear
With tRecset
'If InList(True, Array(blnStationMast, blnAreaMast, blnVTypeMast)) = True Then
    .Open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
'Else
'
'End If
If .EOF = False Then
    mCode_lng = .fields(mCodeField)
    If mNameField <> "" Then
        mName_str = .fields(mNameField)
    End If
    mRecState_int = .fields(mRecStateField)
    If blnStationMast = True Then
    
    ElseIf blnAreaMast = True Then
        mAraStnCode_lng = .fields("AraStnCode")
        
    ElseIf blnVTypeMast = True Then
        mVtmAbvr_str = .fields("VtmAbvr")
        mVtmSysCode_int = .fields("VtmSysCode")
        mVtmPrefix_str = .fields("VtmPrefix")
        mVtmPostfix_str = .fields("VtmPostfix")
        mVtmItmNarr_str = .fields("VtmItmNarr")
        mVtmComNarr_str = .fields("VtmComNarr")
        mVtmEditable_bln = .fields("VtmEditable")
        mVtmStartNo_lng = .fields("VtmStartNo")
        mVtmResetNoBasis_int = .fields("VtmResetNoBasis")
        mVtmIndex_int = .fields("VtmIndex")
        mVtmShowInList_bln = .fields("VtmShowInList")
        
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
If blnStationMast = True Then

ElseIf blnAreaMast = True Then
    mAraStnCode_lng = 0
    
ElseIf blnVTypeMast = True Then
    mVtmAbvr_str = ""
    mVtmSysCode_int = 0
    mVtmPrefix_str = ""
    mVtmPostfix_str = ""
    mVtmItmNarr_str = ""
    mVtmComNarr_str = ""
    mVtmEditable_bln = False
    mVtmStartNo_lng = 0
    mVtmResetNoBasis_int = 0
    mVtmIndex_int = 0
    mVtmShowInList_bln = False
    
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
        If InList(True, Array(blnStationMast, blnAreaMast, blnVTypeMast)) = True Then
            mCode = GetNextSeqno(m_dbAcDatabase, mTableName, mCodeField)
        Else
        End If
    End If
    If mCode < 1 Then
        ErrorBox mTitleName & " Entry Failed !!!"
        Exit Function
    End If
ElseIf mCode > 0 Then
    If InList(True, Array(blnStationMast, blnAreaMast, blnVTypeMast)) = True Then
        tRecset.Open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
    Else
    End If
    If tRecset.EOF = True Then
        ErrorBox mTitleName & " Entry not Found !!!"
        GoTo EndSub
    End If
    CloseTable tRecset
Else
    ErrorBox "Invalid " & mTitleName & " Entry !!!"
    Exit Function
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

Rem updating Master
With tRecset
If InList(True, Array(blnStationMast, blnAreaMast, blnVTypeMast)) = True Then
    .Open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
Else
End If
.ActiveConnection.BeginTrans
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
.ActiveConnection.CommitTrans
End With
CloseTable tRecset

UpdateMast = True
mCrashedEntry = False

Exit Function

errhand:
MsgBox Err.Description
If InList(tRecset.EditMode, Array(adEditAdd, adEditDelete, adEditInProgress)) = True Then
    tRecset.CancelUpdate
    tRecset.ActiveConnection.Cancel
End If

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
If mCrashedEntry = True Then
    ErrorBox "Cancel/Undo Strictly Prohibited for Crashed/Uncomplete Entries, User Must Save it !!!"
    GoTo EndSub
End If
'mCode = ActiveCode
On Error GoTo errhand

With tRecset
If InList(True, Array(blnStationMast, blnAreaMast, blnVTypeMast)) = True Then
    .Open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
    LogRS.Open "Select * from " & mTableName & "_Log where " & mCodeField & "=" & CStr(mCode) & "", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
Else
End If
.ActiveConnection.BeginTrans
If .RecordCount > 0 Then
    If LogRS.EOF = False Then
        ' any prior updations can be made here
        If mNameField <> "" Then
            .fields(mNameField) = LogRS.fields(mNameField)
        End If
        .fields(mRecStateField) = LogRS.fields(mRecStateField)
        If blnStationMast = True Then
        
        ElseIf blnAreaMast = True Then
            .fields("AraStnCode") = LogRS.fields("AraStnCode")
        
        ElseIf blnVTypeMast = True Then
            .fields("VtmAbvr") = LogRS.fields("VtmAbvr")
            .fields("VtmSysCode") = LogRS.fields("VtmSysCode")
            .fields("VtmPrefix") = LogRS.fields("VtmPrefix")
            .fields("VtmPostfix") = LogRS.fields("VtmPostfix")
            .fields("VtmItmNarr") = LogRS.fields("VtmItmNarr")
            .fields("VtmComNarr") = LogRS.fields("VtmComNarr")
            .fields("VtmEditable") = LogRS.fields("VtmEditable")
            .fields("VtmStartNo") = LogRS.fields("VtmStartNo")
            .fields("VtmResetNoBasis") = LogRS.fields("VtmResetNoBasis")
            .fields("VtmIndex") = LogRS.fields("VtmIndex")
            .fields("VtmShowInList") = LogRS.fields("VtmShowInList")
            
        End If
        .Update
    Else
        ' any prior updations can be made here
        .fields(mRecStateField) = ChkDeleteRecStatus(.fields(mRecStateField))
        .Update
        .Delete
    End If
End If
.ActiveConnection.CommitTrans
End With
CloseTable tRecset
CloseTable LogRS

CancelMast = True
GoTo EndSub

errhand:
MsgBox Err.Description
If InList(tRecset.EditMode, Array(adEditAdd, adEditDelete, adEditInProgress)) = True Then
    tRecset.CancelUpdate
    tRecset.ActiveConnection.Cancel
End If

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

With tRecset
If InList(True, Array(blnStationMast, blnAreaMast, blnVTypeMast)) = True Then
    .Open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
Else
End If
.ActiveConnection.BeginTrans
If .RecordCount > 0 Then
    .fields(mRecStateField) = ChkDeleteRecStatus(.fields(mRecStateField))
    .Update
Else
    ErrorBox "clsComMastEntry_DeleteMast_#254_[Not Found]"
End If
.ActiveConnection.CommitTrans
End With
CloseTable tRecset

DeleteMast = True
GoTo EndSub

errhand:
MsgBox Err.Description
If InList(tRecset.EditMode, Array(adEditAdd, adEditDelete, adEditInProgress)) = True Then
    tRecset.CancelUpdate
    tRecset.ActiveConnection.Cancel
End If

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
mCrashedEntry = False

With LogRS
If InList(True, Array(blnStationMast, blnAreaMast, blnVTypeMast)) = True Then
    .Open "Select * from " & mTableName & "_Log where " & mCodeField & "=" & CStr(mCode) & "", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
Else
End If
If .EOF = True Then
    .ActiveConnection.BeginTrans
    .ActiveConnection.Execute "Insert into " & mTableName & "_Log" & " Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & ""
    .ActiveConnection.CommitTrans
Else
    AlertBox "Unsaved " & mTitleName & " Entry !!!"
    mCrashedEntry = True
End If
End With
CloseTable LogRS

Data_CreateLog = True

EndSub:
Set LogRS = Nothing
Exit Function

End Function

Private Function Data_RemoveLog(ByVal mCode As Long) As Boolean
Data_RemoveLog = False
If Chk_ActiveMast() = False Or mCode <> ActiveCode Then
    ErrorBox "No Active " & mTitleName & " Entry to Remove Log !!!"
    Exit Function
End If
If mCrashedEntry = True Then
    ErrorBox "Remove Entry Log Aborted for Crashed/Uncomplete Entries, User Must Save Entry !!!"
    Exit Function
End If

If InList(True, Array(blnStationMast, blnAreaMast, blnVTypeMast)) = True Then
    m_dbAcDatabase.BeginTrans
    m_dbAcDatabase.Execute "Delete from " & mTableName & "_Log" & " where " & mCodeField & "=" & CStr(mCode)
    m_dbAcDatabase.CommitTrans
Else
End If

Data_RemoveLog = True

End Function

Public Sub AddNew(Optional ByVal mInhCode)
Dim tRecset As New ADODB.Recordset, mCanAddNew As Boolean, mLCount As Integer, mUCount As Integer, acount As Integer
mCanAddNew = True

If mNameField <> "" Then
    If InList(True, Array(blnStationMast, blnAreaMast, blnVTypeMast)) = True Then
        tRecset.Open "Select " & mNameField & " from " & mTableName & " where " & mNameField & "='" & mName_str & "'", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
    Else
    End If
    If tRecset.EOF = False Then
        mCanAddNew = False
        ErrorBox "Duplicate Name !!!"
    End If
    CloseTable tRecset
End If

On Error GoTo errhand
mCode_lng = 0
If mCanAddNew = True Then
    With tRecset
    If InList(True, Array(blnStationMast, blnAreaMast, blnVTypeMast)) = True Then
        .Open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(-0.1) & "", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
    Else
    End If
    .ActiveConnection.BeginTrans
    
    .AddNew
    If IsMissing(mInhCode) = False Then
        .fields(mCodeField) = mInhCode
    Else
        Rem .Fields(mCodeField) = mCode_lng
    End If
    If mNameField <> "" Then
        .fields(mNameField) = mName_str
    End If
    .fields(mRecStateField) = ChkEditRecStatus(.fields(mRecStateField))
    
    If blnStationMast = True Then
    
    ElseIf blnAreaMast = True Then
        .fields("AraStnCode") = mAraStnCode_lng
    
    ElseIf blnVTypeMast = True Then
        .fields("VtmAbvr") = mVtmAbvr_str
        .fields("VtmSysCode") = mVtmSysCode_int
        .fields("VtmPrefix") = mVtmPrefix_str
        .fields("VtmPostfix") = mVtmPostfix_str
        .fields("VtmItmNarr") = mVtmItmNarr_str
        .fields("VtmComNarr") = mVtmComNarr_str
        .fields("VtmEditable") = mVtmEditable_bln
        .fields("VtmStartNo") = mVtmStartNo_lng
        .fields("VtmResetNoBasis") = mVtmResetNoBasis_int
        .fields("VtmIndex") = mVtmIndex_int
        .fields("VtmShowInList") = mVtmShowInList_bln
        
    End If
    
    .Update
    mCode_lng = .fields(mCodeField)
    aMastTran(mActiveMast) = mCode_lng
    .ActiveConnection.CommitTrans
    End With
    CloseTable tRecset
    
End If
GoTo EndSub

errhand:
MsgBox Err.Description
If InList(tRecset.EditMode, Array(adEditAdd, adEditDelete, adEditInProgress)) = True Then
    tRecset.CancelUpdate
    tRecset.ActiveConnection.Cancel
End If

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Sub

End Sub

Public Sub Update(ByVal mCode As Long)
Dim tRecset As New ADODB.Recordset, mCanUpdate As Boolean, mLCount As Integer, mUCount As Integer, acount As Integer
mCanUpdate = True

If mNameField <> "" Then
    If InList(True, Array(blnStationMast, blnAreaMast, blnVTypeMast)) = True Then
        tRecset.Open "Select " & mNameField & " from " & mTableName & " where " & mNameField & "='" & mName_str & "' and " & mCodeField & "<>" & CStr(mCode) & "", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
    Else
    End If
    If tRecset.EOF = False Then
        mCanUpdate = False
        ErrorBox "Duplicate Name !!!"
    End If
    CloseTable tRecset
End If

On Error GoTo errhand
mCode_lng = 0
If mCanUpdate = True Then
    With tRecset
    If InList(True, Array(blnStationMast, blnAreaMast, blnVTypeMast)) = True Then
        .Open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
    Else
    End If
    .ActiveConnection.BeginTrans
    
    If mNameField <> "" Then
        .fields(mNameField) = mName_str
    End If
    .fields(mRecStateField) = ChkEditRecStatus(.fields(mRecStateField))
    
    If blnStationMast = True Then
    
    ElseIf blnAreaMast = True Then
        .fields("AraStnCode") = mAraStnCode_lng
    
    ElseIf blnVTypeMast = True Then
        .fields("VtmAbvr") = mVtmAbvr_str
        .fields("VtmSysCode") = mVtmSysCode_int
        .fields("VtmPrefix") = mVtmPrefix_str
        .fields("VtmPostfix") = mVtmPostfix_str
        .fields("VtmItmNarr") = mVtmItmNarr_str
        .fields("VtmComNarr") = mVtmComNarr_str
        .fields("VtmEditable") = mVtmEditable_bln
        .fields("VtmStartNo") = mVtmStartNo_lng
        .fields("VtmResetNoBasis") = mVtmResetNoBasis_int
        .fields("VtmIndex") = mVtmIndex_int
        .fields("VtmShowInList") = mVtmShowInList_bln
        
    End If
    
    .Update
    mCode_lng = .fields(mCodeField)
    .ActiveConnection.CommitTrans
    End With
    CloseTable tRecset
    
End If
GoTo EndSub

errhand:
MsgBox Err.Description
If InList(tRecset.EditMode, Array(adEditAdd, adEditDelete, adEditInProgress)) = True Then
    tRecset.CancelUpdate
    tRecset.ActiveConnection.Cancel
End If

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Sub

End Sub

Public Function CanDeleteMast(ByVal mCode As Long, Optional ByVal mSkipConfirm As Boolean) As Boolean
Dim mDeleteit As Boolean

mDeleteit = True

If ChkEntryExist(mCode, mExcludeOpn:=True) = True Then
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
If InList(True, Array(blnStationMast, blnAreaMast, blnVTypeMast)) = True Then
    .Open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
Else
End If
If .RecordCount > 0 Then
    mRtnval = .fields(mNameField)
End If
End With
CloseTable tRecset

GetName = mRtnval

End Function

Public Function ChkEntryExist(ByVal mCode As Long, Optional ByVal mExcludeOpn As Boolean = False) As Boolean
Dim tRecset As New ADODB.Recordset, mRtnval As Boolean

If blnStationMast = True Then
    MsgBox "ChkEntryExist Pending !!!"
    mRtnval = True
ElseIf blnAreaMast = True Then
    MsgBox "ChkEntryExist Pending !!!"
    mRtnval = True
'''    With tRecset
'''    .Open "Select * from Attendance where AtdDsgCode=" & CStr(mCode) & "", m_dbAcDatabase, adOpenKeyset, adLockReadOnly
'''    mRtnval = (.RecordCount > 0)
'''    End With
'''    CloseTable tRecset
'''
'''    If mRtnval = False Then
'''        With tRecset
'''        .Open "Select * from EmpMast where EmpDsgCode=" & CStr(mCode) & "", m_dbAcDatabase, adOpenKeyset, adLockReadOnly
'''        mRtnval = (.RecordCount > 0)
'''        End With
'''        CloseTable tRecset
'''    End If
ElseIf blnVTypeMast = True Then
    MsgBox "ChkEntryExist Pending !!!"
    mRtnval = True
End If

ChkEntryExist = mRtnval

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Function

End Function

