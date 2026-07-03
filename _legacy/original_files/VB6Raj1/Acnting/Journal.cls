VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsJournal"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Dim mCrashedEntry As Boolean
Dim m_dbAcDatabase As ADODB.Connection, m_dbGrpDatabase As ADODB.Connection
Dim mClassUIdCode As Long, mClassUIdFileName As String, mClassAcsPermFileName As String
Public mJrnCode_lng As Long, mJrnVtmCode_lng As Long, mJrnPrefix_str As String, mJrnVchNo_lng As Long, mJrnPostfix_str As String, mJrnDate_dt As Date, mJrnCmpCode_int As Integer, mJrnAutoGen_bln As Boolean
Public mHdrAhCode_lng As Long, mHdrAmt_dbl As Double, mHdrNarr_str As String, mHdrRecState_int As Integer
Public mJrnICode_lng As Long, mJrnSno_int As Integer, mJrnAhCode_lng As Long, mJrnAmt_dbl As Double, mJrnNarr_str As String, mJrnLAhCode_lng As Long, mJrnRecState_int As Integer
Public clsAH As clsAccountHead
Dim mActiveJournal As Integer, aJournalTran() As Variant

Public Property Set dbAcDatabase(ByRef db As ADODB.Connection)
Set m_dbAcDatabase = db

Set clsAH.dbAcDatabase = db

End Property

Public Property Set dbGrpDatabase(ByRef db As ADODB.Connection)
Set m_dbGrpDatabase = db
Set clsAH.dbGrpDatabase = db

End Property

Private Sub Class_Initialize()
Set clsAH = New clsAccountHead

aJournalTran = Array()
mActiveJournal = UBound(aJournalTran)

mClassUIdFileName = "clsJrn.UId"
mClassAcsPermFileName = "clsJrn.Acp"
mClassUIdCode = GetUIdCode("clsJournal_Initialize", mUIdFileName:=mClassUIdFileName, mAcsPermFileName:=mClassAcsPermFileName)
If mClassUIdCode = 0 Then
    ErrorBox cSYSBUSY_ACS_DENIED
End If

End Sub

Public Sub GetHdrData(ByVal mJrnCode As Long)
Dim tRecset As New ADODB.Recordset

Me.ClearHdr
With tRecset
.open "Select * from JrnHdr where JhrCode=" & CStr(mJrnCode) & "", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    mJrnCode_lng = .fields("JhrCode")
    mJrnVtmCode_lng = .fields("JhrVtmCode")
    mJrnPrefix_str = .fields("JhrPrefix")
    mJrnVchNo_lng = .fields("JhrVchNo")
    mJrnPostfix_str = .fields("JhrPostfix")
    mJrnDate_dt = .fields("JhrDate")
    mHdrAhCode_lng = .fields("JhrAhCode")
    mHdrAmt_dbl = .fields("JhrAmt")
    mHdrNarr_str = .fields("JhrNarr")
    mJrnCmpCode_int = .fields("JhrCmpCode")
    mJrnAutoGen_bln = .fields("JhrAutoGen")
    mHdrRecState_int = .fields("JhrRecState")
End If
End With
CloseTable tRecset

Rem clsAH.GetData mJrnAhCode_lng

End Sub

Public Sub GetDtlData(ByVal mJrnCode As Long, mJrnICode As Long)
Dim tRecset As New ADODB.Recordset

Me.ClearDtl
With tRecset
.open "Select * from Journal where JrnCode=" & CStr(mJrnCode) & " and JrnICode=" & CStr(mJrnICode) & "", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    mJrnCode_lng = .fields("JrnCode")
    mJrnICode_lng = .fields("JrnICode")
    mJrnSno_int = .fields("JrnSno")
    mJrnVtmCode_lng = .fields("JrnVtmCode")
    mJrnPrefix_str = .fields("JrnPrefix")
    mJrnVchNo_lng = .fields("JrnVchNo")
    mJrnPostfix_str = .fields("JrnPostfix")
    mJrnDate_dt = .fields("JrnDate")
    mJrnAhCode_lng = .fields("JrnAhCode")
    mJrnAmt_dbl = .fields("JrnAmt")
    mJrnNarr_str = .fields("JrnNarr")
    mJrnLAhCode_lng = .fields("JrnLAhCode")
    mJrnCmpCode_int = .fields("JrnCmpCode")
    mJrnAutoGen_bln = .fields("JrnAutoGen")
    mJrnRecState_int = .fields("JrnRecState")
    
End If
End With
CloseTable tRecset

clsAH.GetData mJrnAhCode_lng

End Sub

Public Sub ClearHdr()

mJrnCode_lng = 0
mJrnVtmCode_lng = 0
mJrnPrefix_str = ""
mJrnVchNo_lng = 0
mJrnPostfix_str = ""
mJrnDate_dt = Date
mHdrAhCode_lng = 0
mHdrAmt_dbl = 0
mHdrNarr_str = ""
mJrnCmpCode_int = 0
mJrnAutoGen_bln = False
mHdrRecState_int = 0

End Sub

Public Sub ClearDtl()

mJrnCode_lng = 0
mJrnICode_lng = 0
mJrnSno_int = 0
mJrnVtmCode_lng = 0
mJrnPrefix_str = ""
mJrnVchNo_lng = 0
mJrnPostfix_str = ""
mJrnDate_dt = Date
mJrnAhCode_lng = 0
mJrnAmt_dbl = 0
mJrnNarr_str = ""
mJrnLAhCode_lng = 0
mJrnCmpCode_int = 0
mJrnAutoGen_bln = False
mJrnRecState_int = 0

clsAH.Clear

End Sub

Private Sub Class_Terminate()
If UBound(aJournalTran) > LBound(aJournalTran) Then
    ErrorBox "Journal Entry in Process !!!"
End If

Set clsAH = Nothing
End Sub

Public Function BeginJournal(ByVal mJrnCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset

BeginJournal = False

If mJrnCode = 0 Then
    mJrnCode = GetUIdCode("clsJournal_BeginJournal", mUIdFileName:=mClassUIdFileName, mAcsPermFileName:=mClassAcsPermFileName) * -1   '   GetNextSeqno(m_dbAcDatabase, "JrnHdr", "JhrCode")
    If mJrnCode = 0 Then
        ErrorBox "clsJournal_BeginJournal_#82_[Invalid Entry Code]"
        GoTo EndSub
    End If
ElseIf mJrnCode > 0 Then
    tRecset.open "Select * from JrnHdr where JhrCode=" & CStr(mJrnCode) & "", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.RecordCount = 0 Then
        ErrorBox "clsJournal_BeginJournal_#88_[Entry not Found]"
        GoTo EndSub
    End If
    CloseTable tRecset
Else
    ErrorBox "clsJournal_BeginJournal_#93_[Invalid Entry Code Request]"
    GoTo EndSub
End If
mActiveJournal = UBound(aJournalTran) + 1
ReDim Preserve aJournalTran(mActiveJournal)
aJournalTran(mActiveJournal) = mJrnCode

Call Data_CreateLog(mJrnCode)
BeginJournal = True

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Function

End Function

Public Function EndJournal(ByVal mJrnCode As Long) As Boolean
Dim mCnt As Integer
EndJournal = False
If Chk_ActiveJournal() = False Or IIf(ActiveJrnCode > 0, mJrnCode <> ActiveJrnCode, False) Then
    ErrorBox "clsJournal_EndJournal_#114_[InActive Journal Entry]"
    Exit Function
End If
Call Data_RemoveLog(mJrnCode)

For mCnt = (mActiveJournal + 1) To UBound(aJournalTran)
    If (mCnt - 1) >= LBound(aJournalTran) Then
        aJournalTran(mCnt - 1) = aJournalTran(mCnt)
    End If
Next mCnt
If LBound(aJournalTran) = UBound(aJournalTran) Then
    aJournalTran = Array()
Else
    ReDim Preserve aJournalTran(UBound(aJournalTran) - 1)
End If
If mActiveJournal > UBound(aJournalTran) Then
    mActiveJournal = mActiveJournal - 1
End If

EndJournal = True
End Function

Public Property Get ActiveJrnCode() As Long
On Error GoTo errhand

ActiveJrnCode = aJournalTran(mActiveJournal)

Exit Property

errhand:
ErrorBox Err.Description
ActiveJrnCode = -1
Exit Property

End Property

Public Function UpdateJournal(ByVal mJrnCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset, mTmpJrnCode As Long, mJrnSno As Integer

UpdateJournal = False
mTmpJrnCode = ActiveJrnCode

On Error GoTo errhand

Rem header section
m_dbAcDatabase.BeginTrans
With tRecset
.open "Select * from JrnHdr where JhrCode=" & CStr(mJrnCode) & "", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    If InList(.fields("JhrRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
        .fields("JhrRecState") = cREC_UNCHANGED
        .Update
    Else
        .fields("JhrRecState") = ChkDeleteRecStatus(.fields("JhrRecState"))
        .Update
        .Delete
    End If
End If
End With
m_dbAcDatabase.CommitTrans
CloseTable tRecset

Rem detail section
m_dbAcDatabase.BeginTrans
With tRecset
If mJrnCode = mTmpJrnCode Then
    .open "Select * from Journal where JrnCode=" & CStr(mJrnCode) & " order by JrnICode", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
Else
    .open "Select * from Journal where JrnCode=" & CStr(mTmpJrnCode) & " order by JrnICode", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
End If
If .RecordCount > 0 Then
    mJrnSno = 1
    Do While .EOF = False
        If InList(.fields("JrnRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
            If mJrnCode <> mTmpJrnCode Then
                .fields("JrnCode") = mJrnCode
            End If
            .fields("JrnSno") = mJrnSno
            .fields("JrnVtmCode") = mJrnVtmCode_lng
            .fields("JrnPrefix") = mJrnPrefix_str
            .fields("JrnVchNo") = mJrnVchNo_lng
            .fields("JrnPostfix") = mJrnPostfix_str
            .fields("JrnDate") = mJrnDate_dt
            .fields("JrnRecState") = cREC_UNCHANGED
            .Update
            mJrnSno = mJrnSno + 1
        Else
            .fields("JrnRecState") = ChkDeleteRecStatus(.fields("JrnRecState"))
            .Update
            .Delete
        End If
        
        .MoveNext
    Loop
End If
End With
m_dbAcDatabase.CommitTrans
CloseTable tRecset

UpdateJournal = True
mCrashedEntry = False
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

Public Function CancelJournal(ByVal mJrnCode As Long) As Boolean
Dim t1Recset As New ADODB.Recordset, t2Recset As New ADODB.Recordset
Dim pJrnAmt As Double, mRecEdited As Boolean, mRecDeleted As Boolean

CancelJournal = False
If Chk_ActiveJournal() = False Or mJrnCode <> ActiveJrnCode Then
    ErrorBox "clsJournal_CancelJounral_#200_[InActive Journal Entry]"
    GoTo EndSub
End If
If mCrashedEntry = True Then
    ErrorBox "Cancel/Undo Strictly Prohibited for Crashed/Uncomplete Entries, User Must Save it !!!"
    GoTo EndSub
End If
mJrnCode = ActiveJrnCode
On Error GoTo errhand

Rem header section
m_dbAcDatabase.BeginTrans
With t1Recset
.open "Select * from JrnHdr where JhrCode=" & CStr(mJrnCode) & "", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
t2Recset.open "Select * from JrnHdr_Log where JhrCode=" & CStr(mJrnCode) & "", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    If t2Recset.EOF = False Then
        ' any prior updations can be made here
        .fields("JhrVtmCode") = t2Recset.fields("JhrVtmCode")
        .fields("JhrPrefix") = t2Recset.fields("JhrPrefix")
        .fields("JhrVchNo") = t2Recset.fields("JhrVchNo")
        .fields("JhrPostfix") = t2Recset.fields("JhrPostfix")
        .fields("JhrDate") = t2Recset.fields("JhrDate")
        .fields("JhrAhcode") = t2Recset.fields("JhrAhcode")
        .fields("JhrAmt") = t2Recset.fields("JhrAmt")
        .fields("JhrNarr") = t2Recset.fields("JhrNarr")
        .fields("JhrAutoGen") = t2Recset.fields("JhrAutoGen")
        .fields("JhrCmpCode") = t2Recset.fields("JhrCmpCode")
        .fields("JhrRecState") = t2Recset.fields("JhrRecState")
        .Update
    Else
        ' any prior updations can be made here
        .fields("JhrRecState") = ChkDeleteRecStatus(.fields("JhrRecState"))
        .Update
        .Delete
    End If
End If
End With
m_dbAcDatabase.CommitTrans
CloseTable t1Recset
CloseTable t2Recset

Rem detail section
m_dbAcDatabase.BeginTrans
With t1Recset
.open "Select * from Journal where JrnCode=" & CStr(mJrnCode) & " order by JrnICode", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
t2Recset.open "Select * from Journal_Log where JrnCode=" & CStr(mJrnCode) & " order by JrnICode", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Do While .EOF = False
        pJrnAmt = 0
        t2Recset.Find "JrnICode=" & CStr(.fields("JrnICode")), Start:=1
        If t2Recset.EOF = False Then
            mRecEdited = False
            mRecDeleted = False
            If .fields("JrnRecState") = cREC_EDITED = True Then
                clsAH.UpdateGrpAmtSum .fields("JrnAhcode"), .fields("JrnAmt"), 0, False, .fields("JrnDate")
                mRecEdited = True
            ElseIf .fields("JrnRecState") = cREC_DELETED = True Then
                mRecDeleted = True
            End If
            
            ' any prior updations can be made here
            .fields("JrnSno") = t2Recset.fields("JrnSno")
            .fields("JrnVtmCode") = t2Recset.fields("JrnVtmCode")
            .fields("JrnPrefix") = t2Recset.fields("JrnPrefix")
            .fields("JrnVchNo") = t2Recset.fields("JrnVchNo")
            .fields("JrnPostfix") = t2Recset.fields("JrnPostfix")
            .fields("JrnDate") = t2Recset.fields("JrnDate")
            .fields("JrnAhcode") = t2Recset.fields("JrnAhcode")
            .fields("JrnAmt") = t2Recset.fields("JrnAmt")
            .fields("JrnNarr") = t2Recset.fields("JrnNarr")
            .fields("JrnLAhCode") = t2Recset.fields("JrnLAhCode")
            .fields("JrnAutoGen") = t2Recset.fields("JrnAutoGen")
            .fields("JrnCmpCode") = t2Recset.fields("JrnCmpCode")
            .fields("JrnRecState") = t2Recset.fields("JrnRecState")
            .Update
            If mRecEdited = True Or mRecDeleted = True Then
                clsAH.UpdateGrpAmtSum .fields("JrnAhcode"), .fields("JrnAmt"), 0, True, .fields("JrnDate")
            End If
        Else
            clsAH.UpdateGrpAmtSum .fields("JrnAhcode"), .fields("JrnAmt"), 0, False, .fields("JrnDate")
            ' any prior updations can be made here
            .fields("JrnRecState") = ChkDeleteRecStatus(.fields("JrnRecState"))
            .Update
            .Delete
        End If
    
        .MoveNext
    Loop
End If
End With
m_dbAcDatabase.CommitTrans
CloseTable t1Recset
CloseTable t2Recset

CancelJournal = True
GoTo EndSub

errhand:
MsgBox Err.Description
If InList(t1Recset.EditMode, Array(adEditAdd, adEditDelete, adEditInProgress)) = True Then
    t1Recset.CancelUpdate
    t1Recset.ActiveConnection.Cancel
End If

EndSub:
CloseTable t1Recset, mCheckOpen:=True
CloseTable t2Recset, mCheckOpen:=True
Exit Function

End Function

Public Function DeleteJournal(ByVal mJrnCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset

DeleteJournal = False
If Chk_ActiveJournal() = False Or mJrnCode <> ActiveJrnCode Then
    ErrorBox "clsJournal_DeleteJournal_#273_[InActive Journal Entry]"
    GoTo EndSub
End If
On Error GoTo errhand

Rem header section
m_dbAcDatabase.BeginTrans
With tRecset
.open "Select * from JrnHdr where JhrCode=" & CStr(mJrnCode) & "", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
Do While .EOF = False
    .fields("JhrRecState") = ChkDeleteRecStatus(.fields("JhrRecState"))
    .Update
    '' .Delete deleted in update journal
    .MoveNext
Loop
End With
m_dbAcDatabase.CommitTrans
CloseTable tRecset

Rem detail section
m_dbAcDatabase.BeginTrans
With tRecset
.open "Select * from Journal where JrnCode=" & CStr(mJrnCode) & " order by JrnICode", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
Do While .EOF = False
    clsAH.UpdateGrpAmtSum .fields("JrnAhCode"), .fields("JrnAmt"), 0, False, .fields("JrnDate")
    
    .fields("JrnRecState") = ChkDeleteRecStatus(.fields("JrnRecState"))
    .Update
    '' .Delete deleted in update journal
    .MoveNext
Loop
End With
m_dbAcDatabase.CommitTrans
CloseTable tRecset

DeleteJournal = True

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

Public Function SelectJournal(ByVal mJrnCode As Long) As Boolean
Dim mEntryFound As Boolean
SelectJournal = False
If mJrnCode < 1 Then
    ErrorBox "clsJournal_SelectJournal_#314_[Invalid Journal Entry]"
    Exit Function
End If
mEntryFound = False
For mActiveJournal = LBound(aJournalTran) To UBound(aJournalTran)
    If aJournalTran(mActiveJournal) = mJrnCode Then
        mEntryFound = True
        Exit For
    End If
Next mActiveJournal
If mEntryFound = False Then
    mActiveJournal = UBound(aJournalTran) + 1
End If

SelectJournal = True
End Function

Public Function NextJournal() As Boolean
NextJournal = False
If EOJrn = True Then
    ErrorBox "clsJounral_NextJounral_#334_[End of Journal Entry]"
    Exit Function
End If
mActiveJournal = mActiveJournal + 1

NextJournal = True
End Function

Public Function PreviousJournal()
PreviousJournal = False
If BOJrn = True Then
    ErrorBox "clsJournal_PreviousJournal_#345_[Begining of Journal Entry]"
    Exit Function
End If
mActiveJournal = mActiveJournal - 1

PreviousJournal = True
End Function

Public Function FirstJournal() As Boolean
FirstJournal = False
If CountJournal = 0 Then
    ErrorBox "clsJournal_FirstJournal_#356_[No Journal Entry]"
    Exit Function
End If
mActiveJournal = LBound(aJournalTran)

FirstJournal = True

End Function

Public Function LastJournal() As Boolean
LastJournal = False
If CountJournal = 0 Then
    ErrorBox "clsJournal_LastJournal_#368_[No Journal Entry]"
    Exit Function
End If
mActiveJournal = UBound(aJournalTran)

LastJournal = True

End Function

Public Property Get CountJournal() As Integer
If UBound(aJournalTran) = -1 Then
    CountJournal = 0
Else
    CountJournal = UBound(aJournalTran) - LBound(aJournalTran) + 1
End If

End Property

Public Property Get EOJrn() As Boolean
EOJrn = (mActiveJournal > UBound(aJournalTran) Or UBound(aJournalTran) = -1)
End Property

Public Property Get BOJrn() As Boolean
BOJrn = (mActiveJournal < LBound(aJournalTran) Or UBound(aJournalTran) = -1)
End Property

Public Function Chk_ActiveJournal() As Boolean
If BOJrn = False And EOJrn = False Then
    Chk_ActiveJournal = True
Else
    Chk_ActiveJournal = False
End If

End Function

Private Function Data_CreateLog(ByVal mJrnCode As Long) As Boolean
Dim t1Recset As New ADODB.Recordset, t2Recset As New ADODB.Recordset

Data_CreateLog = False
If Chk_ActiveJournal() = False Or mJrnCode <> ActiveJrnCode Then
    ErrorBox "clsJournal_Data_CreateLog_#406_[InActive Journal Entry]"
    GoTo EndSub
End If
mCrashedEntry = False

t1Recset.open "Select * from Journal_Log where JrnCode=" & CStr(mJrnCode) & " order by JrnICode", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
t2Recset.open "Select * from JrnHdr_Log where JhrCode=" & CStr(mJrnCode) & "", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
If t1Recset.RecordCount = 0 And t2Recset.RecordCount = 0 Then
    Rem dbAcDatabase.Execute "Insert into Journal_Log Select * from Journal where JrnCode=" & CStr(mJrnCode) & " and JrnRecState=" & CStr(cREC_UNCHANGED) & ""
    m_dbAcDatabase.BeginTrans
    m_dbAcDatabase.Execute "Insert into Journal_Log Select * from Journal where JrnCode=" & CStr(mJrnCode) & " and JrnRecState=" & CStr(cREC_UNCHANGED) & ""
    m_dbAcDatabase.Execute "Insert into JrnHdr_Log Select * from JrnHdr where JhrCode=" & CStr(mJrnCode) & " and JhrRecState=" & CStr(cREC_UNCHANGED) & ""
    m_dbAcDatabase.CommitTrans
Else
    AlertBox "clsJounral_Data_CreateLog_#419_[Unsaved Journal Entry]"
    mCrashedEntry = True
End If
CloseTable t1Recset
CloseTable t2Recset

Data_CreateLog = True
GoTo EndSub

errhand:
MsgBox Err.Description
If InList(t1Recset.EditMode, Array(adEditAdd, adEditDelete, adEditInProgress)) = True Then
    t1Recset.CancelUpdate
    t1Recset.ActiveConnection.Cancel
End If

EndSub:
CloseTable t1Recset, mCheckOpen:=True
CloseTable t2Recset, mCheckOpen:=True
Exit Function

End Function

Public Function AddNewHdr() As Boolean
Dim tRecset As New ADODB.Recordset

AddNewHdr = False
If Chk_ActiveJournal() = False Then
    ErrorBox "clsJournal_AddNewHdr_#524_[InActive Journal Entry]"
    GoTo EndSub
End If

On Error GoTo errhand
mJrnCode_lng = 0

m_dbAcDatabase.BeginTrans
With tRecset
.open "Select * from JrnHdr where JhrCode=-0.1", m_dbAcDatabase, adOpenKeyset, adLockOptimistic

.AddNew
Rem .Fields("JhrCode") = AutoNumber
.fields("JhrVtmCode") = mJrnVtmCode_lng
.fields("JhrPrefix") = mJrnPrefix_str
.fields("JhrVchNo") = mJrnVchNo_lng
.fields("JhrPostfix") = mJrnPostfix_str
.fields("JhrDate") = mJrnDate_dt
.fields("JhrAhcode") = mHdrAhCode_lng
.fields("JhrAmt") = mHdrAmt_dbl
.fields("JhrNarr") = mHdrNarr_str
.fields("JhrCmpCode") = mJrnCmpCode_int
.fields("JhrAutoGen") = mJrnAutoGen_bln
.fields("JhrRecState") = ChkEditRecStatus(.fields("JhrRecState"))
.Update
mJrnCode_lng = .fields("JhrCode")
End With
m_dbAcDatabase.CommitTrans
CloseTable tRecset

AddNewHdr = True
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

Public Function AddNewDtl(ByVal mJrnCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset

AddNewDtl = False
If Chk_ActiveJournal() = False Or mJrnCode <> ActiveJrnCode Then
    ErrorBox "clsJournal_AddNewDtl_#443_[InActive Journal Entry]"
    GoTo EndSub
End If

On Error GoTo errhand
mJrnICode_lng = 0

m_dbAcDatabase.BeginTrans
With tRecset
.open "Select * from Journal where JrnCode=-0.1", m_dbAcDatabase, adOpenKeyset, adLockOptimistic

.AddNew
Rem .Fields("JrnICode") = AutoNumber
.fields("JrnCode") = mJrnCode
.fields("JrnSno") = mJrnSno_int
.fields("JrnVtmCode") = mJrnVtmCode_lng
.fields("JrnPrefix") = mJrnPrefix_str
.fields("JrnVchNo") = mJrnVchNo_lng
.fields("JrnPostfix") = mJrnPostfix_str
.fields("JrnDate") = mJrnDate_dt
.fields("JrnAhcode") = mJrnAhCode_lng
.fields("JrnAmt") = mJrnAmt_dbl
.fields("JrnNarr") = mJrnNarr_str
.fields("JrnLAhCode") = mJrnLAhCode_lng
.fields("JrnAutoGen") = mJrnAutoGen_bln
.fields("JrnCmpCode") = mJrnCmpCode_int
.fields("JrnRecState") = ChkEditRecStatus(.fields("JrnRecState"))
.Update
mJrnICode_lng = .fields("JrnICode")
End With
m_dbAcDatabase.CommitTrans
CloseTable tRecset

clsAH.UpdateGrpAmtSum mJrnAhCode_lng, mJrnAmt_dbl, 0, True, mJrnDate_dt

AddNewDtl = True
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

Public Function UpdateHdr(ByVal mJrnCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset

UpdateHdr = False
If Chk_ActiveJournal() = False Or mJrnCode <> ActiveJrnCode Then
    ErrorBox "clsJournal_UpdateDtl_#495_[InActive Journal Entry]"
    GoTo EndSub
End If

On Error GoTo errhand

m_dbAcDatabase.BeginTrans
With tRecset
.open "Select * from JrnHdr where JhrCode=" & CStr(mJrnCode) & "", m_dbAcDatabase, adOpenKeyset, adLockOptimistic

.fields("JhrVtmCode") = mJrnVtmCode_lng
.fields("JhrPrefix") = mJrnPrefix_str
.fields("JhrVchNo") = mJrnVchNo_lng
.fields("JhrPostfix") = mJrnPostfix_str
.fields("JhrDate") = mJrnDate_dt
.fields("JhrAhcode") = mHdrAhCode_lng
.fields("JhrAmt") = mHdrAmt_dbl
.fields("JhrNarr") = mHdrNarr_str
.fields("JhrCmpCode") = mJrnCmpCode_int
.fields("JhrAutoGen") = mJrnAutoGen_bln
.fields("JhrRecState") = ChkEditRecStatus(.fields("JhrRecState"))
.Update
End With
m_dbAcDatabase.CommitTrans
CloseTable tRecset

UpdateHdr = True
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

Public Function UpdateDtl(ByVal mJrnCode As Long, ByVal mJrnICode As Long) As Boolean
Dim tRecset As New ADODB.Recordset
Dim pJrnAmt As Double, pJrnAhCode As Long, pJrnDate As Date

UpdateDtl = False
If Chk_ActiveJournal() = False Or mJrnCode <> ActiveJrnCode Then
    ErrorBox "clsJournal_UpdateDtl_#495_[InActive Journal Entry]"
    GoTo EndSub
End If
pJrnAmt = 0
pJrnAhCode = 0

On Error GoTo errhand

m_dbAcDatabase.BeginTrans
With tRecset
.open "Select * from Journal where JrnCode=" & CStr(mJrnCode) & " and JrnICode=" & CStr(mJrnICode) & "", m_dbAcDatabase, adOpenKeyset, adLockOptimistic

pJrnAmt = .fields("JrnAmt")
pJrnAhCode = .fields("JrnAhCode")
pJrnDate = .fields("JrnDate")

.fields("JrnSno") = mJrnSno_int
.fields("JrnVtmCode") = mJrnVtmCode_lng
.fields("JrnPrefix") = mJrnPrefix_str
.fields("JrnVchNo") = mJrnVchNo_lng
.fields("JrnPostfix") = mJrnPostfix_str
.fields("JrnDate") = mJrnDate_dt
.fields("JrnAhcode") = mJrnAhCode_lng
.fields("JrnAmt") = mJrnAmt_dbl
.fields("JrnNarr") = mJrnNarr_str
.fields("JrnLAhCode") = mJrnLAhCode_lng
.fields("JrnCmpCode") = mJrnCmpCode_int
.fields("JrnAutoGen") = mJrnAutoGen_bln
.fields("JrnRecState") = ChkEditRecStatus(.fields("JrnRecState"))
.Update
End With
m_dbAcDatabase.CommitTrans
CloseTable tRecset

clsAH.UpdateGrpAmtSum pJrnAhCode, pJrnAmt, 0, False, pJrnDate
clsAH.UpdateGrpAmtSum mJrnAhCode_lng, mJrnAmt_dbl, 0, True, mJrnDate_dt

UpdateDtl = True
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

Public Function DeleteDtl(ByVal mJrnCode As Long, ByVal mJrnICode As Long, Optional mConfirm As Boolean) As Boolean
Dim tRecset As New ADODB.Recordset, mDeleteit As Boolean
DeleteDtl = False
If Chk_ActiveJournal() = False Or mJrnCode <> ActiveJrnCode Then
    ErrorBox "clsJournal_DeleteDtl_#545_[InActive Journal Entry]"
    GoTo EndSub
End If

DeleteDtl = True

mDeleteit = True
If mDeleteit = True Then
    If mConfirm = True Then
        mDeleteit = CanDelete()
    End If
End If
If mDeleteit = True Then
    On Error GoTo errhand
    
    m_dbAcDatabase.BeginTrans
    With tRecset
    .open "Select * from Journal where JrnCode=" & CStr(mJrnCode) & " and JrnICode=" & CStr(mJrnICode) & "", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
    
    clsAH.UpdateGrpAmtSum .fields("JrnAhCode"), .fields("JrnAmt"), 0, False, .fields("JrnDate")
    
    .fields("JrnRecState") = ChkDeleteRecStatus(.fields("JrnRecState"))
    .Update
    End With
    CloseTable tRecset
    m_dbAcDatabase.CommitTrans
End If

DeleteDtl = True
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

Private Function Data_RemoveLog(ByVal mJrnCode As Long) As Boolean

Data_RemoveLog = False
If Chk_ActiveJournal() = False Then
    ErrorBox "clsJournal_Data_RemoveLog_#591_[InActive Journal Entry]"
    Exit Function
End If
If mCrashedEntry = True Then
    ErrorBox "Remove Entry Log Aborted for Crashed/Uncomplete Entries, User Must Save Entry !!!"
    Exit Function
End If

m_dbAcDatabase.BeginTrans
m_dbAcDatabase.Execute "Delete from Journal_Log where JrnCode=" & CStr(mJrnCode)
m_dbAcDatabase.Execute "Delete from JrnHdr_Log where JhrCode=" & CStr(mJrnCode)
m_dbAcDatabase.CommitTrans

Data_RemoveLog = True

End Function

