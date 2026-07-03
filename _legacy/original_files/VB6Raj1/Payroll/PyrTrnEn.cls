VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsPayrollTranEntry"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Dim m_dbPyrDatabase As ADODB.Connection, m_dbAcDatabase As ADODB.Connection
Dim mTableName As String, mTrnCodeField As String, mTrnICodeField As String, mTrnSnoField As String, mTrnRecStateField As String, mTitleName As String
Public mEmpAttendance As Boolean
Public mTrnCode_lng As Long, mTrnICode_lng As Long, mTrnSno_int As Integer, mTrnRecState_int As Integer
Public mAtdDate_dt As Date, mAtdEmpCode_lng As Long, mAtdDptCode_lng As Long, mAtdDsgCode_lng As Long, mAtdSftCode_int As Integer, mAtdTime_lng As Long, mAtdTime_str As String, mAtdStatus_int As Integer, mAtdStatus_str As String, mAtdStartTime_lng As Long, mAtdEndTime_lng As Long, mAtdNarr_str As String
Dim mActiveTran As Integer, aPayrollTran() As Variant
Public clsEMP As clsPayrollMasterEntry, clsDSG As clsPayrollMasterEntry, clsDPT As clsPayrollMasterEntry

Public Property Let TranName(ByVal mTranName As String)
Select Case mTranName
Case "Attendance"
    mEmpAttendance = True
    mTableName = "Attendance"
    mTrnCodeField = "AtdCode"
    mTrnICodeField = "AtdICode"
    mTrnSnoField = "AtdSno"
    mTrnRecStateField = "AtdRecState"
    mTitleName = "Employee Attendance"
Case Else
    ErrorBox "clsPayrollTranEntry_TranName(#22)_[Undefined Transaction Name " & mTranName & "]"
End Select

End Property

Public Property Set dbPyrDatabase(ByRef db As ADODB.Connection)
Set m_dbPyrDatabase = db

If clsEMP Is Nothing Then
    Set clsEMP = New clsPayrollMasterEntry
    clsEMP.MastName = "EmpMast"
End If
If clsDSG Is Nothing Then
    Set clsDSG = New clsPayrollMasterEntry
    clsDSG.MastName = "DesgMast"
End If
If clsDPT Is Nothing Then
    Set clsDPT = New clsPayrollMasterEntry
    clsDPT.MastName = "DeptMast"
End If

Set clsEMP.dbPyrDatabase = db
Set clsDSG.dbPyrDatabase = db
Set clsDPT.dbPyrDatabase = db

End Property

Public Property Set dbAcDatabase(ByRef db As ADODB.Connection)
Set m_dbAcDatabase = db

If clsEMP Is Nothing Then
    Set clsEMP = New clsPayrollMasterEntry
    clsEMP.MastName = "EmpMast"
End If
If clsDSG Is Nothing Then
    Set clsDSG = New clsPayrollMasterEntry
    clsDSG.MastName = "DesgMast"
End If
If clsDPT Is Nothing Then
    Set clsDPT = New clsPayrollMasterEntry
    clsDPT.MastName = "DeptMast"
End If

Set clsEMP.dbAcDatabase = db
Set clsDSG.dbAcDatabase = db
Set clsDPT.dbAcDatabase = db

End Property

Private Sub Class_Initialize()
aPayrollTran = Array()
mActiveTran = UBound(aPayrollTran)

End Sub

Public Sub GetData(ByVal mTranCode As Long, ByVal mTranICode As Long, Optional ByVal mTranSno As Integer)
Dim TRNRecset As New ADODB.Recordset
Me.Clear

With TRNRecset
If mTranICode > 0 Then
    .Open "Select * from " & mTableName & " where " & mTrnCodeField & "=" & CStr(mTranCode) & " and " & mTrnICodeField & "=" & CStr(mTranICode) & "", m_dbPyrDatabase, adOpenKeyset, adLockOptimistic
Else
    .Open "Select * from " & mTableName & " where " & mTrnCodeField & "=" & CStr(mTranCode) & " and " & mTrnSnoField & "=" & CStr(mTranSno) & "", m_dbPyrDatabase, adOpenKeyset, adLockOptimistic
End If
If .RecordCount > 0 Then
    mTrnCode_lng = .Fields(mTrnCodeField)
    mTrnICode_lng = .Fields(mTrnICodeField)
    mTrnSno_int = .Fields(mTrnSnoField)
    mTrnRecState_int = .Fields(mTrnRecStateField)
    If mEmpAttendance = True Then
        mAtdDate_dt = .Fields("AtdDate")
        mAtdEmpCode_lng = .Fields("AtdEmpCode")
        mAtdDsgCode_lng = .Fields("AtdDsgCode")
        mAtdDptCode_lng = .Fields("AtdDptCode")
        mAtdSftCode_int = .Fields("AtdSftCode")
        mAtdTime_lng = .Fields("AtdTime")
        mAtdTime_str = MinToTime(.Fields("AtdTime"))
        mAtdStatus_int = .Fields("AtdStatus")
        mAtdStatus_str = GetMidPosStr(cATNDSTAT_LIST, .Fields("AtdStatus"), ",")
        mAtdStartTime_lng = .Fields("AtdStartTime")
        mAtdEndTime_lng = .Fields("AtdEndTime")
        mAtdNarr_str = .Fields("AtdNarr")
    Else
    
    End If
End If
End With
CloseTable TRNRecset

If mTrnSno_int > 0 Then
    clsEMP.GetData mAtdEmpCode_lng
Else
    clsEMP.Clear
End If

End Sub

Public Sub Clear()

mTrnCode_lng = 0
mTrnICode_lng = 0
mTrnSno_int = 0
mTrnRecState_int = 0
If mEmpAttendance = True Then
    mAtdDate_dt = cUNKNOWNDATE
    mAtdEmpCode_lng = 0
    mAtdDsgCode_lng = 0
    mAtdDptCode_lng = 0
    mAtdSftCode_int = 0
    mAtdTime_lng = 0
    mAtdTime_str = "00:00"
    mAtdStatus_int = 0
    mAtdStatus_str = ""
    mAtdStartTime_lng = 0
    mAtdEndTime_lng = 0
    mAtdNarr_str = ""
Else

End If


End Sub

Private Sub Class_Terminate()
If UBound(aPayrollTran) > LBound(aPayrollTran) Then
    ErrorBox mTitleName & " Entry in Process !!!"
End If

Set clsEMP = Nothing
Set clsDSG = Nothing
Set clsDPT = Nothing

End Sub

Public Function BeginTran(ByVal mTranCode As Long) As Boolean
Dim TRNRecset As New ADODB.Recordset
BeginTran = False

If mTranCode = 0 Then
    mTranCode = GetNextSeqno(m_dbPyrDatabase, mTableName, mTrnCodeField)
    If mTranCode < 1 Then
        ErrorBox "clsPayrollTranEntry_BeginTran(#164)_[New " & mTitleName & " Entry Failed]"
        GoTo EndSub
    End If
ElseIf mTranCode > 0 Then
    TRNRecset.Open "Select * from " & mTableName & " where " & mTrnCodeField & "=" & CStr(mTranCode) & "", m_dbPyrDatabase, adOpenKeyset, adLockOptimistic
    If TRNRecset.RecordCount > 0 Then
        TRNRecset.Close
    Else
        TRNRecset.Close
        ErrorBox "clsPayrollTranEntry_BeginTran(#173)_" & mTableName & "_[Record Not Found]"
        GoTo EndSub
    End If
Else
    ErrorBox "clsPayrollTranEntry_BeginTran(#177)_[Invalid " & mTitleName & " Entry]"
    GoTo EndSub
End If
mActiveTran = UBound(aPayrollTran) + 1
ReDim Preserve aPayrollTran(mActiveTran)
aPayrollTran(mActiveTran) = mTranCode

Call Data_CreateLog(mTranCode)

BeginTran = True

EndSub:
Set TRNRecset = Nothing
Exit Function

End Function

Public Function EndTran(ByVal mTranCode As Long) As Boolean
Dim mCnt As Integer
EndTran = False
If Chk_ActiveTran() = False Or mTranCode <> ActiveTrnCode Then
    ErrorBox "clsPayrollTranEntry_EndTran(#198)_[No Active " & mTitleName & " Entry]"
    Exit Function
End If
Call Data_RemoveLog(mTranCode)

For mCnt = (mActiveTran + 1) To UBound(aPayrollTran)
    If (mCnt - 1) >= LBound(aPayrollTran) Then
        aPayrollTran(mCnt - 1) = aPayrollTran(mCnt)
    End If
Next mCnt
If LBound(aPayrollTran) = UBound(aPayrollTran) Then
    aPayrollTran = Array()
Else
    ReDim Preserve aPayrollTran(UBound(aPayrollTran) - 1)
End If
If mActiveTran > UBound(aPayrollTran) Then
    mActiveTran = mActiveTran - 1
End If

EndTran = True
End Function

Public Property Get ActiveTrnCode() As Long
On Error GoTo errhand

ActiveTrnCode = aPayrollTran(mActiveTran)

Exit Property

errhand:
ErrorBox Err.Description
ActiveTrnCode = -1
Exit Property

End Property

Public Function CommitTran(ByVal mTranCode As Long) As Boolean
Dim TRNRecset As New ADODB.Recordset, tRecset As New ADODB.Recordset
Dim mDeletedRec As Boolean, mEditedRec As Boolean, mUnknownRec As Boolean
CommitTran = False

On Error GoTo errhand

m_dbPyrDatabase.BeginTrans
TRNRecset.Open "Select * from " & mTableName & " where " & mTrnCodeField & "=" & CStr(mTranCode) & " order by " & mTrnICodeField & "", m_dbPyrDatabase, adOpenKeyset, adLockOptimistic
With TRNRecset
If .RecordCount > 0 Then
    .MoveFirst
    Do While .EOF = False
        mDeletedRec = False: mEditedRec = False: mUnknownRec = False
        
        Select Case .Fields(mTrnRecStateField)
        Case cREC_ADDED, cREC_EDITED
            mEditedRec = True
        Case cREC_DELETED
            mDeletedRec = True
        Case cREC_CANCELED
            Rem no action
        Case cREC_UNCHANGED
            Rem no action
        Case Else
            ErrorBox "clsPayrollTranEntry_CommitTran(#197)_[Undefined Case]"
            mUnknownRec = True
        End Select
        
        If InList(.Fields(mTrnRecStateField), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
            .Fields(mTrnRecStateField) = cREC_UNCHANGED
            If mEmpAttendance = True Then
                .Fields("AtdDate") = mAtdDate_dt
            End If
            .Update
        Else
            .Fields(mTrnRecStateField) = ChkDeleteRecStatus(.Fields(mTrnRecStateField))
            .Update
            .Delete
        End If
        .MoveNext
    Loop
End If
End With
m_dbPyrDatabase.CommitTrans
CloseTable TRNRecset

CommitTran = True
GoTo EndSub
Exit Function

errhand:
MsgBox Err.Description
m_dbPyrDatabase.Cancel

EndSub:
Set TRNRecset = Nothing
Set tRecset = Nothing

Exit Function

End Function

Public Function CancelTran(ByVal mTranCode As Long) As Boolean
Dim TRNRecset As New ADODB.Recordset, TRN_LogRS As New ADODB.Recordset, tRecset As New ADODB.Recordset
Dim mRecEdited As Boolean, mRecDeleted As Boolean

CancelTran = False
If Chk_ActiveTran() = False Or mTranCode <> ActiveTrnCode Then
    ErrorBox "clsParyrollTranEntry_CancelTran(#303)_[No Active " & mTitleName & " Entry to Cancel]"
    GoTo EndSub
End If
mTranCode = ActiveTrnCode
On Error GoTo errhand

m_dbPyrDatabase.BeginTrans
With TRNRecset
.Open "Select * from " & mTableName & " where " & mTrnCodeField & "=" & CStr(mTranCode) & " order by " & mTrnICodeField & "", m_dbPyrDatabase, adOpenKeyset, adLockOptimistic
TRN_LogRS.Open "Select * from " & mTableName & "_Log where " & mTrnCodeField & "=" & CStr(mTranCode) & " order by " & mTrnICodeField & "", m_dbPyrDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    .MoveFirst
    Do While .EOF = False
        Rem stock updation is not required because balance is updated on CommitTran and not on individual item save, hence no need to revert is back
        TRN_LogRS.Find mTrnICodeField & "=" & CStr(.Fields(mTrnICodeField)), Start:=1
        If TRN_LogRS.EOF = False Then
            ' any prior updations can be made here
            .Fields(mTrnSnoField) = TRN_LogRS.Fields(mTrnSnoField)
            .Fields(mTrnRecStateField) = TRN_LogRS.Fields(mTrnRecStateField)
            If mEmpAttendance = True Then
                .Fields("AtdDate") = TRN_LogRS.Fields("AtdDate")
                .Fields("AtdEmpCode") = TRN_LogRS.Fields("AtdEmpCode")
                .Fields("AtdDsgCode") = TRN_LogRS.Fields("AtdDsgCode")
                .Fields("AtdDptCode") = TRN_LogRS.Fields("AtdDptCode")
                .Fields("AtdSftCode") = TRN_LogRS.Fields("AtdSftCode")
                .Fields("AtdTime") = TRN_LogRS.Fields("AtdTime")
                .Fields("AtdStatus") = TRN_LogRS.Fields("AtdStatus")
                .Fields("AtdStartTime") = TRN_LogRS.Fields("AtdStartTime")
                .Fields("AtdEndTime") = TRN_LogRS.Fields("AtdEndTime")
                .Fields("AtdNarr") = TRN_LogRS.Fields("AtdNarr")
            End If
            .Update
        Else
            ' any prior updations can be made here
            .Fields(mTrnRecStateField) = ChkDeleteRecStatus(.Fields(mTrnRecStateField))
            .Update
            .Delete
        End If
        
        .MoveNext
    Loop
End If
End With
m_dbPyrDatabase.CommitTrans
CloseTable TRNRecset
CloseTable TRN_LogRS

CancelTran = True
GoTo EndSub

Exit Function

errhand:
MsgBox Err.Description
m_dbPyrDatabase.Cancel

EndSub:
Set TRNRecset = Nothing
Set TRN_LogRS = Nothing
Set tRecset = Nothing

Exit Function

End Function

Public Function DeleteTran(ByVal mTranCode As Long) As Boolean
Dim TRNRecset As New ADODB.Recordset, tRecset As New ADODB.Recordset
DeleteTran = False
If Chk_ActiveTran() = False Or mTranCode <> ActiveTrnCode Then
    ErrorBox "clsPayrollTranEntry_DeleteTran(#372)_No Active" & mTitleName & " Entry to Delete]"
    GoTo EndSub
End If
On Error GoTo errhand

m_dbPyrDatabase.BeginTrans
With TRNRecset
.Open "Select * from " & mTableName & " where " & mTrnCodeField & "=" & CStr(mTranCode) & " order by " & mTrnICodeField & "", m_dbPyrDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Do While .EOF = False
        .Fields(mTrnRecStateField) = ChkDeleteRecStatus(.Fields(mTrnRecStateField))
        .Update
        Rem marked for deletion only, physically deleted in CommitTran
        .MoveNext
    Loop
End If
End With
m_dbPyrDatabase.CommitTrans
CloseTable TRNRecset

DeleteTran = True
GoTo EndSub

Exit Function

errhand:
MsgBox Err.Description
m_dbPyrDatabase.Cancel

EndSub:
Set TRNRecset = Nothing
Set tRecset = Nothing
Exit Function

End Function

Public Function SelectTran(ByVal mTranCode As Long) As Boolean
Dim mEntryFound As Boolean
SelectTran = False
If mTranCode < 1 Then
    ErrorBox "clsPayrollTranEntry_SelectTran(#412)_[Invalid " & mTitleName & " Entry]"
    Exit Function
End If
mEntryFound = False
For mActiveTran = LBound(aPayrollTran) To UBound(aPayrollTran)
    If aPayrollTran(mActiveTran) = mTranCode Then
        mEntryFound = True
        Exit For
    End If
Next mActiveTran
If mEntryFound = False Then
    mActiveTran = UBound(aPayrollTran) + 1
End If

SelectTran = True
End Function

Public Function NextTran() As Boolean
NextTran = False
If EOTran = True Then
    ErrorBox "clsPayrollTranEntry_NextTran(#432)_[End of " & mTitleName & " Entry]"
    Exit Function
End If
mActiveTran = mActiveTran + 1

NextTran = True
End Function

Public Function PreviousTran()
PreviousTran = False
If BOTrn = True Then
    ErrorBox "clsPayrollTranEntry_PreviousTran(#443)_[Begining of " & mTitleName & " Entry]"
    Exit Function
End If
mActiveTran = mActiveTran - 1

PreviousTran = True
End Function

Public Function FirstTran() As Boolean
FirstTran = False
If CountTran = 0 Then
    ErrorBox "clsPayrollTranEntry_FirstTran(#454)_[No " & mTitleName & " Entry]"
    Exit Function
End If
mActiveTran = LBound(aPayrollTran)

FirstTran = True

End Function

Public Function LastTran() As Boolean
LastTran = False
If CountTran = 0 Then
    ErrorBox "clsPayrollTranEntry_LastTran(#466)_[No " & mTitleName & " Entry]"
    Exit Function
End If
mActiveTran = UBound(aPayrollTran)

LastTran = True

End Function

Public Property Get CountTran() As Integer
If UBound(aPayrollTran) = -1 Then
    CountTran = 0
Else
    CountTran = UBound(aPayrollTran) - LBound(aPayrollTran) + 1
End If

End Property

Public Property Get EOTran() As Boolean
EOTran = (mActiveTran > UBound(aPayrollTran) Or UBound(aPayrollTran) = -1)
End Property

Public Property Get BOTrn() As Boolean
BOTrn = (mActiveTran < LBound(aPayrollTran) Or UBound(aPayrollTran) = -1)
End Property

Public Function Chk_ActiveTran() As Boolean
If BOTrn = False And EOTran = False Then
    Chk_ActiveTran = True
Else
    Chk_ActiveTran = False
End If

End Function

Private Function Data_CreateLog(ByVal mTranCode As Long) As Boolean
Dim TRN_LogRS As New ADODB.Recordset
Data_CreateLog = False
If Chk_ActiveTran() = False Or mTranCode <> ActiveTrnCode Then
    ErrorBox "clsPayrollTranEntry_Data_CreateLog(#505)_[No Active " & mTitleName & " Entry to Create Log]"
    GoTo EndSub
End If

With TRN_LogRS
.Open "Select * from " & mTableName & "_Log where " & mTrnCodeField & "=" & CStr(mTranCode) & "", m_dbPyrDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount = 0 Then
    .Close
    Rem only ok records will be taken in log, because not ok records are created out of crashed entries which must be cleared when entry rejected
    m_dbPyrDatabase.BeginTrans
    m_dbPyrDatabase.Execute "Insert into " & mTableName & "_Log Select * from " & mTableName & " where " & mTrnCodeField & "=" & CStr(mTranCode) & " and " & mTrnRecStateField & "=" & CStr(cREC_UNCHANGED) & ""
    m_dbPyrDatabase.CommitTrans
Else
    .Close
    AlertBox "Unsaved " & mTitleName & " Entry !!!"
End If
End With

Data_CreateLog = True
GoTo EndSub
Exit Function

EndSub:
Set TRN_LogRS = Nothing
Exit Function

End Function

Public Function AddNew(ByVal mTranCode As Long) As Boolean
Dim TRNRecset As New ADODB.Recordset, tRecset As New ADODB.Recordset
AddNew = False
If Chk_ActiveTran() = False Or mTranCode <> ActiveTrnCode Then
    ErrorBox "clsPayrollTranEntry_AddNew(@537)_[No Active " & mTitleName & " Entry to Add]"
    GoTo EndSub
End If

On Error GoTo errhand
mTrnICode_lng = 0

If mTrnSno_int = 0 Then     ' zero value standard means that new sno has to be find
    mTrnSno_int = GetNextSeqno(m_dbPyrDatabase, mTableName, mTrnSnoField, mTrnCodeField & "=" & CStr(mTranCode) & " and " & mTrnSnoField & ">0")
End If

m_dbPyrDatabase.BeginTrans
TRNRecset.Open "Select * from " & mTableName & " where " & mTrnCodeField & "=" & CStr(mTranCode) & " order by " & mTrnICodeField & "", m_dbPyrDatabase, adOpenKeyset, adLockOptimistic
With TRNRecset
.AddNew
Rem .Fields(mTrnICodeField) = AutoNumber
.Fields(mTrnCodeField) = mTranCode
.Fields(mTrnSnoField) = mTrnSno_int
.Fields(mTrnRecStateField) = ChkEditRecStatus(.Fields(mTrnRecStateField))
If mEmpAttendance = True Then
    .Fields("AtdDate") = mAtdDate_dt
    .Fields("AtdEmpCode") = mAtdEmpCode_lng
    .Fields("AtdDsgCode") = mAtdDsgCode_lng
    .Fields("AtdDptCode") = mAtdDptCode_lng
    .Fields("AtdSftCode") = mAtdSftCode_int
    .Fields("AtdTime") = mAtdTime_lng
    .Fields("AtdStatus") = mAtdStatus_int
    .Fields("AtdStartTime") = mAtdStartTime_lng
    .Fields("AtdEndTime") = mAtdEndTime_lng
    .Fields("AtdNarr") = mAtdNarr_str
End If
.Update
mTrnICode_lng = .Fields(mTrnICodeField)
End With
m_dbPyrDatabase.CommitTrans
CloseTable TRNRecset


Rem balance stock updated in CommitTran

AddNew = True
GoTo EndSub

Exit Function

errhand:
MsgBox Err.Description
m_dbPyrDatabase.Cancel

EndSub:
Set TRNRecset = Nothing
Set tRecset = Nothing
Exit Function

End Function

Public Function Update(ByVal mTranCode As Long, ByVal mTranICode As Long) As Boolean
Dim TRNRecset As New ADODB.Recordset, tRecset As New ADODB.Recordset

Update = False
If Chk_ActiveTran() = False Or mTranCode <> ActiveTrnCode Then
    ErrorBox "clsPayrollTranEntry_Update(#598)_[No Active " & mTitleName & " Entry to Update]"
    GoTo EndSub
End If

On Error GoTo errhand

m_dbPyrDatabase.BeginTrans
With TRNRecset
.Open "Select * from " & mTableName & " where " & mTrnCodeField & "=" & CStr(mTranCode) & " and " & mTrnICodeField & "=" & CStr(mTranICode) & "", m_dbPyrDatabase, adOpenKeyset, adLockOptimistic

.Fields(mTrnSnoField) = mTrnSno_int
.Fields(mTrnRecStateField) = ChkEditRecStatus(.Fields(mTrnRecStateField))
If mEmpAttendance = True Then
    .Fields("AtdDate") = mAtdDate_dt
    .Fields("AtdEmpCode") = mAtdEmpCode_lng
    .Fields("AtdDsgCode") = mAtdDsgCode_lng
    .Fields("AtdDptCode") = mAtdDptCode_lng
    .Fields("AtdSftCode") = mAtdSftCode_int
    .Fields("AtdTime") = mAtdTime_lng
    .Fields("AtdStatus") = mAtdStatus_int
    .Fields("AtdStartTime") = mAtdStartTime_lng
    .Fields("AtdEndTime") = mAtdEndTime_lng
    .Fields("AtdNarr") = mAtdNarr_str
End If
.Update
End With
m_dbPyrDatabase.CommitTrans
CloseTable TRNRecset

Rem balance stock changed in CommitTran

Update = True
GoTo EndSub

Exit Function

errhand:
MsgBox Err.Description
m_dbPyrDatabase.Cancel

EndSub:
Set TRNRecset = Nothing
Set tRecset = Nothing

Exit Function

End Function

Public Function Delete(ByVal mTranCode As Long, ByVal mTranICode As Long, Optional mConfirm As Boolean) As Boolean
Dim TRNRecset As New ADODB.Recordset, tRecset As New ADODB.Recordset
Dim mDeleteit As Boolean
Delete = False
If Chk_ActiveTran() = False Or mTranCode <> ActiveTrnCode Then
    ErrorBox "clsPayrollTranEntry_Delete(#651)_[No Active " & mTitleName & " Entry to Delete]"
    GoTo EndSub
End If

mDeleteit = True

If mDeleteit = True Then
    If mConfirm = True Then
        mDeleteit = CanDelete()
    End If
End If
If mDeleteit = True Then
    On Error GoTo errhand
    
    m_dbPyrDatabase.BeginTrans
    TRNRecset.Open "Select * from " & mTableName & " where " & mTrnCodeField & "=" & CStr(mTranCode) & " and " & mTrnICodeField & "=" & CStr(mTranICode) & "", m_dbPyrDatabase, adOpenKeyset, adLockOptimistic
    With TRNRecset
    .Fields(mTrnRecStateField) = ChkDeleteRecStatus(.Fields(mTrnRecStateField))
    .Update
    End With
    m_dbPyrDatabase.CommitTrans
    CloseTable TRNRecset
    Rem stock removed from CommitTran
    
End If

Delete = True
GoTo EndSub

Exit Function

errhand:
MsgBox Err.Description
m_dbPyrDatabase.Cancel

EndSub:
Set TRNRecset = Nothing
Set tRecset = Nothing

Exit Function

End Function

Private Function Data_RemoveLog(ByVal mTranCode As Long) As Boolean
Data_RemoveLog = False
If Chk_ActiveTran() = False Or mTranCode <> ActiveTrnCode Then
    ErrorBox "clsPayrollTranEntry_Data_RemoveLog(#697)_[No Active " & mTitleName & " Entry to Remove Log]"
    Exit Function
End If
m_dbPyrDatabase.BeginTrans
m_dbPyrDatabase.Execute "Delete from " & mTableName & "_Log where " & mTrnCodeField & "=" & CStr(mTranCode)
m_dbPyrDatabase.CommitTrans

Data_RemoveLog = True
End Function

