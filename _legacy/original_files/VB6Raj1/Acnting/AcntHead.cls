VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsAccountHead"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Dim mCrashedEntry As Boolean
Dim m_dbAcDatabase As ADODB.Connection, m_dbGrpDatabase As ADODB.Connection
Public mAhCode_lng As Long, mAhName_str As String, mAhOpBal_dbl As Double, mAhCurBal_dbl As Double

Dim adtlOpnBal As OpnBal, adtlCurBal As CurBal
Dim mActiveAchd As Integer, aAchdTran() As Variant

Private Type OpnBal
JrnICode() As Variant
JrnAmt() As Variant
JrnRecState() As Variant
End Type

Private Type CurBal
JrnAmt() As Variant
End Type

Public Property Get LOpnBal() As Integer
LOpnBal = LBound(adtlOpnBal.JrnICode)
End Property

Public Property Get UOpnBal() As Integer
UOpnBal = UBound(adtlOpnBal.JrnICode)
End Property

Public Property Get OpnICode(ByVal mDim1 As Integer) As Variant
OpnICode = adtlOpnBal.JrnICode(mDim1)
End Property

Public Property Get OpnAmt(ByVal mDim1 As Integer) As Variant
OpnAmt = adtlOpnBal.JrnAmt(mDim1)
End Property

Public Property Get OpnRecState(ByVal mDim1 As Integer) As Variant
OpnRecState = adtlOpnBal.JrnRecState(mDim1)
End Property

Public Sub AddOpnBal(ByVal mJrnAmt As Double)
Dim acount As Integer, mJrnICode As Long
With adtlOpnBal
acount = UBound(.JrnICode) + 1

ReDim Preserve .JrnICode(acount)
ReDim Preserve .JrnAmt(acount)
ReDim Preserve .JrnRecState(acount)

mJrnICode = acount

.JrnICode(acount) = mJrnICode
.JrnAmt(acount) = mJrnAmt
.JrnRecState(acount) = cREC_ADDED
End With

End Sub

Public Sub EditOpnBal(ByVal mJrnICode As Long, ByVal mJrnAmt As Double)
Dim acount As Integer, mLCount As Integer, mUCount As Integer, mEntryFound As Boolean
With adtlOpnBal
mLCount = LBound(.JrnICode)
mUCount = UBound(.JrnICode)
mEntryFound = False
For acount = mLCount To mUCount
    If .JrnICode(acount) = mJrnICode Then
        mEntryFound = True
        Exit For
    End If
Next acount

If mEntryFound = False Then
    ErrorBox "clsAccountHead_EditOpnBal_235"
Else
    Rem .JrnICode(acount) = mJrnICode ' not required
    .JrnAmt(acount) = mJrnAmt
    .JrnRecState(acount) = ChkEditRecStatus(.JrnRecState(acount))
End If
End With

End Sub

Public Sub DeleteOpnBal(ByVal mJrnICode As Long)
Dim acount As Integer, mLCount As Integer, mUCount As Integer, mEntryFound As Boolean
With adtlOpnBal
mLCount = LBound(.JrnICode)
mUCount = UBound(.JrnICode)
mEntryFound = False
For acount = mLCount To mUCount
    If .JrnICode(acount) = mJrnICode Then
        mEntryFound = True
        Exit For
    End If
Next acount

If mEntryFound = False Then
    ErrorBox "clsAccountHead_DeleteOpnBal_265"
Else
    Rem .JrnICode(acount) = mJrnICode ' not required
    Rem .JrnAmt(acount) = mJrnAmt
    .JrnRecState(acount) = ChkDeleteRecStatus(.JrnRecState(acount))
End If
End With

End Sub

Public Property Get LCurBal() As Integer
LCurBal = LBound(adtlCurBal.JrnAmt)
End Property

Public Property Get UCurBal() As Integer
UCurBal = UBound(adtlCurBal.JrnAmt)
End Property

Public Property Get CurAmt(ByVal mDim1 As Integer) As Variant
CurAmt = adtlCurBal.JrnAmt(mDim1)
End Property

Public Property Set dbAcDatabase(ByRef db As ADODB.Connection)
Set m_dbAcDatabase = db

End Property

Public Property Set dbGrpDatabase(ByRef db As ADODB.Connection)
Set m_dbGrpDatabase = db
End Property

Private Sub Class_Initialize()
aAchdTran = Array()
mActiveAchd = UBound(aAchdTran)
Call ClearBalArray

End Sub

Public Sub GetData(ByVal mAhCode As Long)
Dim tRecset As New ADODB.Recordset, acount As Integer

Me.Clear
With tRecset
.open "Select * from AchdMast where AhCode=" & CStr(mAhCode) & "", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    mAhCode_lng = .fields("AhCode")
    mAhName_str = .fields("AhName")
Else
    If mAhCode > 0 Then
        ErrorBox "clsAccountHead_GetData(#150)_AchdMast_[Record Not Found]"
    End If
End If
End With
CloseTable tRecset

Rem opening balance
tRecset.open "Select * from Journal where JrnCode = " & CStr(cOPJRNCODE) & " and JrnAhCode = " & CStr(mAhCode) & " and JrnDate = #" & CStr(ToSysDate(sCmpBookStartDate - 1)) & "#", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
If tRecset.RecordCount > 0 Then
    Do While tRecset.EOF = False
        With adtlOpnBal
        acount = UBound(.JrnICode) + 1
        
        ReDim Preserve .JrnICode(acount)
        ReDim Preserve .JrnAmt(acount)
        ReDim Preserve .JrnRecState(acount)
        
        .JrnICode(acount) = tRecset.fields("JrnICode")
        .JrnAmt(acount) = tRecset.fields("JrnAmt")
        .JrnRecState(acount) = tRecset.fields("JrnRecState")
        End With
        
        tRecset.MoveNext
    Loop
Else
    If mAhCode > 0 Then
        ErrorBox "clsAccountHead_GetData(#150)_Journal_Opn_[Record Not Found]"
    End If
End If
CloseTable tRecset

Rem current balance
tRecset.open "Select sum(GasAmt) as GasAmt_sum from gAchdSum where GasAhCode=" & CStr(mAhCode) & " group by GasAhCode", m_dbGrpDatabase, adOpenKeyset, adLockOptimistic
If tRecset.RecordCount > 0 Then
    Do While tRecset.EOF = False
        With adtlCurBal
        acount = UBound(.JrnAmt) + 1
        
        ReDim Preserve .JrnAmt(acount)
        
        .JrnAmt(acount) = tRecset.fields("GasAmt_sum")
        End With
        
        tRecset.MoveNext
    Loop
End If
CloseTable tRecset

End Sub

Public Sub Clear()
mAhCode_lng = 0
mAhName_str = ""

Call ClearBalArray

End Sub

Private Sub ClearBalArray()
With adtlOpnBal
.JrnICode = Array()
.JrnAmt = Array()
.JrnRecState = Array()
End With

With adtlCurBal
.JrnAmt = Array()
End With

End Sub

Private Sub Class_Terminate()
If UBound(aAchdTran) >= LBound(aAchdTran) Then
    ErrorBox "Account Head Master Entry in Process !!!"
End If

End Sub

Public Function BeginAchd(ByVal mAhCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset

BeginAchd = False
If mAhCode = 0 Then
    mAhCode = GetNextSeqno(m_dbAcDatabase, "AchdMast", "AhCode")
    If mAhCode < 1 Then
        ErrorBox "clsAccountHead_BeginAchd(#226)_AchdMast_[Invalid Code Generation]"
        GoTo EndSub
    End If
ElseIf mAhCode > 0 Then
    tRecset.open "Select * from AchdMast where AhCode=" & CStr(mAhCode) & "", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.EOF = True Then
        ErrorBox "clsAccountHead_BeginAchd(#232)_AchdMast_[Record Not Found]"
        GoTo EndSub
    End If
    CloseTable tRecset
Else
    ErrorBox "clsAccountHead_BeginAchd(#236)_[Undefined Case]"
    GoTo EndSub
End If
mActiveAchd = UBound(aAchdTran) + 1
ReDim Preserve aAchdTran(mActiveAchd)
aAchdTran(mActiveAchd) = mAhCode

Call Data_CreateLog(mAhCode)
BeginAchd = True

EndSub:
Set tRecset = Nothing
Exit Function

End Function

Public Function EndAchd(ByVal mAhCode As Long) As Boolean
Dim mCnt As Integer

EndAchd = False
If Chk_ActiveAchd() = False Or IIf(mAhCode > 0, mAhCode <> ActiveAhCode, False) Then
    ErrorBox "No Active Account Head Master Entry !!!"
    GoTo EndSub
End If
Call Data_RemoveLog(mAhCode)

For mCnt = (mActiveAchd + 1) To UBound(aAchdTran)
    If (mCnt - 1) >= LBound(aAchdTran) Then
        aAchdTran(mCnt - 1) = aAchdTran(mCnt)
    End If
Next mCnt
If LBound(aAchdTran) = UBound(aAchdTran) Then
    aAchdTran = Array()
Else
    ReDim Preserve aAchdTran(UBound(aAchdTran) - 1)
End If
If mActiveAchd > UBound(aAchdTran) Then
    mActiveAchd = mActiveAchd - 1
End If

EndAchd = True

EndSub:
Exit Function

End Function

Public Property Get ActiveAhCode() As Long
On Error GoTo errhand

ActiveAhCode = aAchdTran(mActiveAchd)

Exit Property

errhand:
ErrorBox Err.Description
ActiveAhCode = -1
Exit Property

End Property

Rem update transactional sum up, physically deletes records marked for deletion or marks ok records for added or edited
Public Function UpdateAchd(ByVal mAhCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset, OpnJrn_LogRS As New ADODB.Recordset

UpdateAchd = False

On Error GoTo errhand

m_dbAcDatabase.BeginTrans
Rem updating AchdMast
With tRecset
.open "Select * from AchdMast where AhCode=" & CStr(mAhCode) & "", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    If InList(.fields("AhRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
        .fields("AhRecState") = cREC_UNCHANGED
        .Update
    Else
        .fields("AhRecState") = ChkDeleteRecStatus(.fields("AhRecState"))
        .Update
        .Delete
    End If
End If
End With
m_dbAcDatabase.CommitTrans
CloseTable tRecset

Rem Journal - opening balance
m_dbAcDatabase.BeginTrans
With tRecset
.open "Select * from Journal where JrnCode=" & CStr(cOPJRNCODE) & " and JrnAhCode=" & CStr(mAhCode) & " and JrnRecState<>" & CStr(cREC_UNCHANGED) & " order by JrnICode", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
OpnJrn_LogRS.open "Select * from Journal_Log where JrnCode=" & CStr(cOPJRNCODE) & " and JrnAhCode=" & CStr(mAhCode) & " and JrnRecState=" & CStr(cREC_UNCHANGED) & " order by JrnICode", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Do While .EOF = False
        OpnJrn_LogRS.Find "JrnICode=" & CStr(.fields("JrnICode")), Start:=1
        If .fields("JrnRecState") = cREC_EDITED Or .fields("JrnRecState") = cREC_DELETED Then
            If OpnJrn_LogRS.EOF = False Then
                UpdateGrpAmtSum OpnJrn_LogRS.fields("JrnAhCode"), OpnJrn_LogRS.fields("JrnAmt"), 0, cREMOVEBAL, OpnJrn_LogRS.fields("JrnDate")
            Else
                ErrorBox "clsAccountHead_UpdateAchd_626"
            End If
        End If
        If .fields("JrnRecState") = cREC_ADDED Or .fields("JrnRecState") = cREC_EDITED Then
            UpdateGrpAmtSum .fields("JrnAhCode"), .fields("JrnAmt"), 0, cADDBAL, .fields("JrnDate")
        End If
        
        If InList(.fields("JrnRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
            .fields("JrnRecState") = cREC_UNCHANGED
            .Update
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
CloseTable OpnJrn_LogRS

Rem gAchdSum -  amount day sum
m_dbGrpDatabase.BeginTrans
With tRecset
.open "Select * from gAchdSum where GasAhCode=" & CStr(mAhCode) & " and GasDate=#" & CStr(ToSysDate(sCmpBookStartDate - 1)) & "# and GasRecState<>" & CStr(cREC_UNCHANGED) & " order by GasICode", m_dbGrpDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Do While .EOF = False
        If InList(.fields("GasRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
            .fields("GasRecState") = cREC_UNCHANGED
            .Update
        Else
            .fields("GasRecState") = ChkDeleteRecStatus(.fields("GasRecState"))
            .Update
            .Delete
        End If
        .MoveNext
    Loop
End If
End With
m_dbGrpDatabase.CommitTrans
CloseTable tRecset

UpdateAchd = True
mCrashedEntry = False
GoTo EndSub

errhand:
MsgBox Err.Description
m_dbAcDatabase.Cancel

EndSub:
Set tRecset = Nothing
Exit Function

End Function

Rem checks entries with log table, if log exist restores log records else delete records (assuming new records added), balance updation part not done here because master entries does not have effect while in process
Public Function CancelAchd(ByVal mAhCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset, Ah_LogRS As New ADODB.Recordset, OpnJrn_LogRS As New ADODB.Recordset
Dim pJrnAmt As Double, mRecEdited As Boolean, mRecDeleted As Boolean

CancelAchd = False
If Chk_ActiveAchd() = False Or mAhCode <> ActiveAhCode Then
    ErrorBox "No Active Account Head Master Entry to Cancel !!!"
    GoTo EndSub
End If
If mCrashedEntry = True Then
    ErrorBox "Cancel/Undo Strictly Prohibited for Crashed/Uncomplete Entries, User Must Save it !!!"
    GoTo EndSub
End If
'mAhCode = ActiveAhCode
On Error GoTo errhand

m_dbAcDatabase.BeginTrans
With tRecset
.open "Select * from AchdMast where AhCode=" & CStr(mAhCode) & "", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
Ah_LogRS.open "Select * from AchdMast_Log where AhCode=" & CStr(mAhCode) & " and AhRecState=" & CStr(cREC_UNCHANGED), m_dbAcDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    If Ah_LogRS.EOF = False Then
        ' any prior updations can be made here
        .fields("AhName") = Ah_LogRS.fields("AhName")
        .fields("AhRecState") = Ah_LogRS.fields("AhRecState")
        .Update
    Else
        ' any prior updations can be made here
        .fields("AhRecState") = ChkDeleteRecStatus(.fields("AhRecState"))
        .Update
        .Delete
    End If
End If
End With
CloseTable tRecset
CloseTable Ah_LogRS

With tRecset
.open "Select * from Journal where JrnCode=" & CStr(cOPJRNCODE) & " and JrnAhCode=" & CStr(mAhCode) & " order by JrnICode", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
OpnJrn_LogRS.open "Select * from Journal_Log where JrnCode=" & CStr(cOPJRNCODE) & " and JrnAhCode=" & CStr(mAhCode) & " and JrnRecState=" & CStr(cREC_UNCHANGED) & " order by JrnICode", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Do While .EOF = False
        OpnJrn_LogRS.Find "JrnICode=" & CStr(.fields("JrnICode")), Start:=1
        If OpnJrn_LogRS.EOF = False Then
            ' any prior updations can be made here
            .fields("JrnSno") = OpnJrn_LogRS.fields("JrnSno")
            .fields("JrnVtmCode") = OpnJrn_LogRS.fields("JrnVtmCode")
            .fields("JrnPrefix") = OpnJrn_LogRS.fields("JrnPrefix")
            .fields("JrnVchNo") = OpnJrn_LogRS.fields("JrnVchNo")
            .fields("JrnPostfix") = OpnJrn_LogRS.fields("JrnPostfix")
            .fields("JrnDate") = OpnJrn_LogRS.fields("JrnDate")
            .fields("JrnAhCode") = OpnJrn_LogRS.fields("JrnAhCode")
            .fields("JrnAmt") = OpnJrn_LogRS.fields("JrnAmt")
            .fields("JrnNarr") = OpnJrn_LogRS.fields("JrnNarr")
            .fields("JrnLAhCode") = OpnJrn_LogRS.fields("JrnLAhCode")
            .fields("JrnCmpCode") = OpnJrn_LogRS.fields("JrnCmpCode")
            .fields("JrnAutoGen") = OpnJrn_LogRS.fields("JrnAutoGen")
            .fields("JrnRecState") = OpnJrn_LogRS.fields("JrnRecState")
            .Update
        Else
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
CloseTable tRecset
CloseTable OpnJrn_LogRS

CancelAchd = True
GoTo EndSub

errhand:
MsgBox Err.Description
m_dbAcDatabase.Cancel

EndSub:
Set tRecset = Nothing
Set OpnJrn_LogRS = Nothing
Exit Function

End Function

Rem marking records for deletion
Public Function DeleteAchd(ByVal mAhCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset
DeleteAchd = False
If Chk_ActiveAchd() = False Or mAhCode <> ActiveAhCode Then
    ErrorBox "No Active Account Head Master Entry to Delete !!!"
    GoTo EndSub
End If
On Error GoTo errhand

m_dbAcDatabase.BeginTrans
With tRecset
.open "Select * from AchdMast where AhCode=" & CStr(mAhCode) & "", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    .fields("AhRecState") = ChkDeleteRecStatus(.fields("AhRecState"))
    .Update
Else
    ErrorBox "clsAccountHead_DeleteAchd_824"
End If
End With
CloseTable tRecset

With tRecset
.open "Select * from Journal where JrnCode=" & CStr(cOPJRNCODE) & " and JrnAhCode=" & CStr(mAhCode) & " order by JrnICode", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Do While .EOF = False
        .fields("JrnRecState") = ChkDeleteRecStatus(.fields("JrnRecState"))
        .Update
        
        .MoveNext
    Loop
Else
    ErrorBox "clsAccountHead_DeleteAchd_849"
End If
End With
m_dbAcDatabase.CommitTrans
CloseTable tRecset

DeleteAchd = True
GoTo EndSub

errhand:
MsgBox Err.Description
m_dbAcDatabase.Cancel

EndSub:
Set tRecset = Nothing
Exit Function

End Function

Public Function SelectAchd(ByVal mAhCode As Long) As Boolean
Dim mEntryFound As Boolean
SelectAchd = False
If mAhCode < 1 Then
    ErrorBox "Invalid Account Head Master Entry !!!"
    GoTo EndSub
End If
mEntryFound = False
For mActiveAchd = LBound(aAchdTran) To UBound(aAchdTran)
    If aAchdTran(mActiveAchd) = mAhCode Then
        mEntryFound = True
        Exit For
    End If
Next mActiveAchd
If mEntryFound = False Then
    mActiveAchd = UBound(aAchdTran) + 1
End If

SelectAchd = True

EndSub:
Exit Function

End Function

Public Function NextAchd() As Boolean
NextAchd = False
If EOAh = True Then
    ErrorBox "End of Account Head Master Entry !!!"
    GoTo EndSub
End If
mActiveAchd = mActiveAchd + 1

NextAchd = True

EndSub:
Exit Function

End Function

Public Function PreviousAchd()
PreviousAchd = False
If BOAh = True Then
    ErrorBox "Begining of Account Head Entry !!!"
    GoTo EndSub
End If
mActiveAchd = mActiveAchd - 1

PreviousAchd = True

EndSub:
Exit Function

End Function

Public Function FirstAchd() As Boolean
FirstAchd = False
If CountAchd = 0 Then
    ErrorBox "No Account Head Entry !!!"
    GoTo EndSub
End If
mActiveAchd = LBound(aAchdTran)

FirstAchd = True

EndSub:
Exit Function

End Function

Public Function LastAchd() As Boolean
LastAchd = False
If CountAchd = 0 Then
    ErrorBox "No Account Head Entry !!!"
    GoTo EndSub
End If
mActiveAchd = UBound(aAchdTran)

LastAchd = True

EndSub:
Exit Function

End Function

Public Property Get CountAchd() As Integer
If UBound(aAchdTran) = -1 Then
    CountAchd = 0
Else
    CountAchd = UBound(aAchdTran) - LBound(aAchdTran) + 1
End If

End Property

Public Property Get EOAh() As Boolean
EOAh = (mActiveAchd > UBound(aAchdTran) Or UBound(aAchdTran) = -1)
End Property

Public Property Get BOAh() As Boolean
BOAh = (mActiveAchd < LBound(aAchdTran) Or UBound(aAchdTran) = -1)
End Property

Public Function Chk_ActiveAchd() As Boolean
If BOAh = False And EOAh = False Then
    Chk_ActiveAchd = True
Else
    Chk_ActiveAchd = False
End If

End Function

Private Function Data_CreateLog(ByVal mAhCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset

Data_CreateLog = False
If Chk_ActiveAchd() = False Or mAhCode <> ActiveAhCode Then
    ErrorBox "No Active Account Head Entry to Create Log !!!"
    GoTo EndSub
End If
mCrashedEntry = False

With tRecset
.open "Select * from AchdMast_Log where AhCode=" & CStr(mAhCode) & "", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
If .EOF = True Then
    m_dbAcDatabase.BeginTrans
    m_dbAcDatabase.Execute "Insert into AchdMast_Log Select * from AchdMast where AhCode=" & CStr(mAhCode) & " and AhRecState=" & CStr(cREC_UNCHANGED)
    m_dbAcDatabase.CommitTrans
Else
    AlertBox "Unsaved Account Head Master Entry !!!"
    mCrashedEntry = True
End If
End With
CloseTable tRecset

With tRecset
.open "Select * from Journal_Log where JrnCode=" & CStr(cOPJRNCODE) & " and JrnAhCode=" & CStr(mAhCode), m_dbAcDatabase, adOpenKeyset, adLockOptimistic
If .EOF = True Then
    m_dbAcDatabase.BeginTrans
    m_dbAcDatabase.Execute "Insert into Journal_Log Select * from Journal where JrnCode=" & CStr(cOPJRNCODE) & " and JrnAhCode=" & CStr(mAhCode) & " and JrnRecState=" & CStr(cREC_UNCHANGED)
    m_dbAcDatabase.CommitTrans
Else
    AlertBox "Unsaved Account Head Master(Opn.Balance) Entry !!!"
    mCrashedEntry = True
End If
End With
CloseTable tRecset
Data_CreateLog = True

EndSub:
Set tRecset = Nothing
Exit Function

End Function

Private Function Data_RemoveLog(ByVal mAhCode As Long) As Boolean

Data_RemoveLog = False
If Chk_ActiveAchd() = False Then
    ErrorBox "No Active Account Head Master Entry to Remove Log !!!"
    GoTo EndSub
End If
If mCrashedEntry = True Then
    ErrorBox "Remove Entry Log Aborted for Crashed/Uncomplete Entries, User Must Save Entry !!!"
    GoTo EndSub
End If

m_dbAcDatabase.BeginTrans
m_dbAcDatabase.Execute "Delete from AchdMast_Log where AhCode=" & CStr(mAhCode)
m_dbAcDatabase.Execute "Delete from Journal_Log where JrnCode=" & CStr(cOPJRNCODE) & " and JrnAhCode=" & CStr(mAhCode) & ""
m_dbAcDatabase.CommitTrans

Data_RemoveLog = True

EndSub:
Exit Function

End Function

Public Function AddNew() As Boolean
Dim tRecset As New ADODB.Recordset, mCanAddNew As Boolean, mLCount As Integer, mUCount As Integer, acount As Integer, mJrnSno As Integer

AddNew = False
mCanAddNew = True

tRecset.open "Select Ahname from AchdMast where AhName='" & mAhName_str & "'", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
If tRecset.EOF = False Then
    mCanAddNew = False
    ErrorBox "Duplicate Name !!!"
End If
CloseTable tRecset

On Error GoTo errhand
mAhCode_lng = 0
If mCanAddNew = True Then
    m_dbAcDatabase.BeginTrans
    With tRecset
    .open "Select * from AchdMast where AhCode=" & CStr(-0.1) & "", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
    .AddNew
    Rem .Fields("AhCode") = mAhCode_lng
    .fields("AhName") = mAhName_str
    .fields("AhRecState") = cREC_ADDED
    .Update
    mAhCode_lng = .fields("AhCode")
    aAchdTran(mActiveAchd) = mAhCode_lng
    End With
    CloseTable tRecset
    
    If mAhCode_lng > 0 Then    ' when successfull
        Rem updating opening Account Head
        tRecset.open "Select * from Journal where JrnCode=" & CStr(cOPJRNCODE) & " and JrnAhCode=" & CStr(mAhCode_lng) & " order by JrnICode", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            ErrorBox "clsAccountHead_AddNew(#682)_Journal_Opn_[Entry Already Exist]"
        End If
        
        With adtlOpnBal
        mLCount = LBound(.JrnICode)
        mUCount = UBound(.JrnICode)
        For acount = mLCount To mUCount
            If .JrnRecState(acount) = cREC_ADDED Then     ' newly added. we will find added record only in addnew
                mJrnSno = GetNextSeqno(m_dbAcDatabase, "Journal", "JrnSno", "JrnCode=" & CStr(cOPJRNCODE) & "")
                
                tRecset.AddNew
                Rem tRecset.Fields("JrnICode") = AutoNumber
                tRecset.fields("JrnCode") = cOPJRNCODE
                tRecset.fields("JrnSno") = mJrnSno
                tRecset.fields("JrnVtmCode") = 0
                tRecset.fields("JrnPrefix") = ""
                tRecset.fields("JrnVchNo") = 0
                tRecset.fields("JrnPostfix") = 0
                tRecset.fields("JrnDate") = (sCmpBookStartDate - 1)
                tRecset.fields("JrnAhCode") = mAhCode_lng
                tRecset.fields("JrnAmt") = .JrnAmt(acount)
                tRecset.fields("JrnNarr") = "OPN"
                tRecset.fields("JrnLAhCode") = 0
                tRecset.fields("JrnCmpCode") = 0
                tRecset.fields("JrnAutoGen") = False
                tRecset.fields("JrnRecState") = cREC_ADDED
                tRecset.Update
                
            ElseIf .JrnRecState(acount) = cREC_EDITED Then      ' edit mode
                ErrorBox "clsAccountHead_AddNew_1100"
            ElseIf .JrnRecState(acount) = cREC_DELETED Then      ' existing rec deleted
                ErrorBox "clsAccountHead_AddNew_1102"
            ElseIf .JrnRecState(acount) = cREC_CANCELED Then      ' newly added rec deleted
                Rem may occur
            ElseIf .JrnRecState(acount) = cREC_UNCHANGED Then      ' existing rec unchanged
                ErrorBox "clsAccountHead_AddNew_1106"
            Else  ' error/mistake
                ErrorBox "clsAccountHead_AddNew_1108"
            End If
        Next acount
        End With
        CloseTable tRecset
    End If
    m_dbAcDatabase.CommitTrans
End If
AddNew = True
GoTo EndSub

errhand:
MsgBox Err.Description
m_dbAcDatabase.Cancel

EndSub:
Set tRecset = Nothing
Exit Function

End Function

Public Sub Update(ByVal mAhCode As Long, Optional mUpdOpnBalOnly As Boolean = False)
Dim tRecset As New ADODB.Recordset, mCanUpdate As Boolean, mLCount As Integer, mUCount As Integer, acount As Integer, mJrnSno As Integer
mCanUpdate = True

tRecset.open "Select Ahname from AchdMast where Ahname='" & mAhName_str & "' and Ahcode<>" & CStr(mAhCode) & "", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
If tRecset.EOF = False Then
    If mUpdOpnBalOnly = False Then
        mCanUpdate = False
        ErrorBox "Duplicate Name !!!"
    End If
End If
CloseTable tRecset

On Error GoTo errhand
mAhCode_lng = 0
If mCanUpdate = True Then
    m_dbAcDatabase.BeginTrans
    With tRecset
    .open "Select * from AchdMast where AhCode=" & CStr(mAhCode) & "", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
    If mUpdOpnBalOnly = False Then
        .fields("AhName") = mAhName_str
        .fields("AhRecState") = ChkEditRecStatus(.fields("AhRecState"))
        .Update
    End If
    mAhCode_lng = .fields("AhCode")
    End With
    CloseTable tRecset
    
    If mAhCode_lng > 0 Then    ' when successfull
        Rem updating opening Account Head
        tRecset.open "Select * from Journal where JrnCode=" & CStr(cOPJRNCODE) & " and JrnAhCode=" & CStr(mAhCode) & " order by JrnICode", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount = 0 Then
            ErrorBox "clsAccountHead_Update(#760)_Journal_Opn_[Record Not Found]"
        End If
        
        With adtlOpnBal
        mLCount = LBound(.JrnICode)
        mUCount = UBound(.JrnICode)
        For acount = mLCount To mUCount
            If .JrnRecState(acount) = cREC_ADDED Then     ' newly added. we will find added record only in addnew
                mJrnSno = GetNextSeqno(m_dbAcDatabase, "Journal", "JrnSno", "JrnCode=" & CStr(cOPJRNCODE) & "")
                
                tRecset.AddNew
                Rem tRecset.Fields("JrnICode") = AutoNumber
                tRecset.fields("JrnCode") = cOPJRNCODE
                tRecset.fields("JrnSno") = mJrnSno
                tRecset.fields("JrnVtmCode") = 0
                tRecset.fields("JrnPrefix") = ""
                tRecset.fields("JrnVchNo") = 0
                tRecset.fields("JrnPostfix") = ""
                tRecset.fields("JrnDate") = (sCmpBookStartDate - 1)
                tRecset.fields("JrnAhCode") = mAhCode
                tRecset.fields("JrnAmt") = .JrnAmt(acount)
                tRecset.fields("JrnLAhCode") = 0
                tRecset.fields("JrnCmpCode") = 0
                tRecset.fields("JrnAutoGen") = False
                tRecset.fields("JrnRecState") = cREC_ADDED
                tRecset.Update
                
            ElseIf .JrnRecState(acount) = cREC_EDITED Then      ' edit mode
                MoveRecToFirst tRecset
                tRecset.Find "JrnICode=" & CStr(.JrnICode(acount)), Start:=1
                If tRecset.EOF = False Then
                    Rem tRecset.Fields("JrnICode") = AutoNumber
                    Rem tRecset.Fields("JrnCode") = cOPJRNCODE
                    Rem tRecset.Fields("JrnSno") = mJrnSno
                    Rem tRecset.Fields("JrnDate") = (sCmpBookStartDate - 1)
                    Rem tRecset.Fields("JrnAhCode") = mAhCode
                    tRecset.fields("JrnAmt") = .JrnAmt(acount)
                    tRecset.fields("JrnRecState") = ChkEditRecStatus(tRecset.fields("JrnRecState"))
                    tRecset.Update
                Else
                    ErrorBox "clsAccountHead_Update_1288"
                End If
            ElseIf .JrnRecState(acount) = cREC_DELETED Or .JrnRecState(acount) = cREC_CANCELED Then      ' existing rec deleted or new rec canceled
                MoveRecToFirst tRecset
                tRecset.Find "JrnICode=" & CStr(.JrnICode(acount)), Start:=1
                If tRecset.EOF = False Then
                    tRecset.fields("JrnRecState") = ChkDeleteRecStatus(tRecset.fields("JrnRecState"))
                    tRecset.Update
                Else
                    If .JrnRecState(acount) = cREC_DELETED Then
                        ErrorBox "clsAccountHead_Update_1298"
                    End If
                End If
            ElseIf .JrnRecState(acount) = cREC_UNCHANGED Then      ' existing rec unchanged
                MoveRecToFirst tRecset
                tRecset.Find "JrnICode=" & CStr(.JrnICode(acount)), Start:=1
                If tRecset.EOF = False Then
                    Rem nochange required
                Else
                    ErrorBox "clsAccountHead_Update_1289"
                End If
            Else  ' error/mistake
                ErrorBox "clsAccountHead_Update_1304"
            End If
        Next acount
        End With
        CloseTable tRecset
    End If
    m_dbAcDatabase.CommitTrans
End If
GoTo EndSub

errhand:
MsgBox Err.Description
m_dbAcDatabase.Cancel

EndSub:
Set tRecset = Nothing
Exit Sub

End Sub

Public Function CanDeleteAchd(ByVal mAhCode As Long) As Boolean
Dim mDeleteit As Boolean

mDeleteit = True

If ChkEntryExist(mAhCode, mExcludeOpn:=True) = True Then
    ErrorBox "Entry Exist !!!"
    mDeleteit = False
ElseIf ChkDependencyExist(mAhCode) = True Then
    ErrorBox "Dependency Exist !!!"
    mDeleteit = False
End If
If mDeleteit = True Then
    mDeleteit = CanDelete()
End If

CanDeleteAchd = mDeleteit

End Function

'Rem procedure to be exclusively called from this class strictly
'Private Sub UpdateActiveAhOpBal(ByVal mAhOpBal As Double)
'Dim pAhOpBal As Double, pAhCurBal As Double
'
'm_dbAcDatabase.BeginTrans
'With AhRecset
'pAhOpBal = .Fields("AhOpBal")
'pAhCurBal = .Fields("AhCurBal")
'
'.Fields("AhOpBal") = mAhOpBal
'.Fields("AhCurBal") = pAhCurBal - pAhOpBal + mAhOpBal
'.Fields("AhOpBal_iaf") = ToMyAcFmt(mAhOpBal)
'.Fields("AhCurBal_iaf") = ToMyAcFmt(pAhCurBal - pAhOpBal + mAhOpBal)
'.Update
'End With
'm_dbAcDatabase.CommitTrans
'
'UpdateGrpAchdBal AhRecset.Fields("AhCode"), mAhOpBal
'
'End Sub

'Rem updating opening balance to day wise balance table
'Public Sub UpdateGrpAchdBal(ByVal mAhCode As Long, ByVal mOpBal As Double)
'Dim mOldOpBal As Double, mDate As Date
'mOldOpBal = 0
'mDate = sCmpBookStartDate - 1
'
'm_dbGrpDatabase.BeginTrans
'With gAchdSumRS
'.Open "Select * from gAchdBal where abalAhcode=" & CStr(mAhCode) & " and abalDate=#" & CStr(ToSysDate(mDate)) & "#", m_dbGrpDatabase, adOpenKeyset, adLockOptimistic
'If .RecordCount > 0 Then
'    mOldOpBal = .Fields("abalAmt")
'    .Fields("abalAmt") = mOpBal
'    .Fields("abalRecState") = cREC_EDITED
'Else
'    .AddNew
'    .Fields("abalDate") = CStr(mDate)
'    .Fields("abalAhcode") = mAhCode
'    .Fields("abalAmt") = mOpBal
'    .Fields("abalRecState") = cREC_ADDED
'End If
'.Update
'End With
'm_dbGrpDatabase.CommitTrans
'CloseTable gAchdSumRS
'
'Rem update balance on following dates
'm_dbGrpDatabase.BeginTrans
'm_dbGrpDatabase.Execute "Update gAchdBal set abalAmt=abalAmt+" & CStr(mOpBal - mOldOpBal) & " where abalAhcode=" & CStr(mAhCode) & " and abalDate>#" & CStr(ToSysDate(mDate)) & "#"
'm_dbGrpDatabase.CommitTrans
'End Sub

Rem updates transacted qty to group item summation
Public Sub UpdateGrpAmtSum(ByVal mAhCode As Long, ByVal mTargetAmt As Double, ByVal mOldAmt As Double, ByVal mAddBal As Boolean, ByVal mDate As Date)
Dim tRecset As New ADODB.Recordset, gAchdSumRS As New ADODB.Recordset
Dim mCanUpdate As Boolean

mCanUpdate = True

On Error GoTo errhand
If mCanUpdate = True Then
    m_dbGrpDatabase.BeginTrans
    With gAchdSumRS
    .open "Select * from gAchdSum where GasAhCode=" & CStr(mAhCode) & " and GasDate=#" & CStr(ToSysDate(mDate)) & "#", m_dbGrpDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount > 0 Then
        If mAddBal = True Then
            .fields("GasAmt") = .fields("GasAmt") + mTargetAmt - mOldAmt
        Else
            .fields("GasAmt") = .fields("GasAmt") - mTargetAmt
        End If
        .fields("GasRecState") = ChkEditRecStatus(.fields("GasRecState"))
        .Update
    Else
        If mAddBal = True Then
            .AddNew
            .fields("GasDate") = mDate
            .fields("GasAhCode") = mAhCode
            .fields("GasAmt") = mTargetAmt
            .fields("GasRecState") = cREC_ADDED
            .Update
        Else
            ErrorBox "clsAccountHead_UpdateGrpAmtSum_933"
        End If
    End If
    End With
    m_dbGrpDatabase.CommitTrans
    CloseTable gAchdSumRS
    
End If
GoTo EndSub

errhand:
MsgBox Err.Description
m_dbAcDatabase.Cancel

EndSub:
Set tRecset = Nothing
Set gAchdSumRS = Nothing
Exit Sub

End Sub

''Rem returns closing balance as on date for specified account head
''Public Function GetAhBalAsOnDate(ByVal mAhCode As Long, ByVal mDate As Date, Optional ByVal mDrCrFlag As String) As Double
''Dim mRtnval As Double, tRecset As New ADODB.RecordSet
''
''mRtnval = 0
''With tRecset
''If mDrCrFlag = cDR_FLAG Then
''    .Open "Select sum(GasAmt) as GasAmt_sum from gAchdSum where GasAhCode=" & CStr(mAhCode) & " and GasDate<=#" & CStr(ToSysDate(mDate)) & "# and GasAmt<0" & " group by GasAhCode", m_dbGrpDatabase, adOpenKeyset, adLockOptimistic
''ElseIf mDrCrFlag = cCR_FLAG Then
''    .Open "Select sum(GasAmt) as GasAmt_sum from gAchdSum where GasAhCode=" & CStr(mAhCode) & " and GasDate<=#" & CStr(ToSysDate(mDate)) & "# and GasAmt>0" & " group by GasAhCode", m_dbGrpDatabase, adOpenKeyset, adLockOptimistic
''Else
''    .Open "Select sum(GasAmt) as GasAmt_sum from gAchdSum where GasAhCode=" & CStr(mAhCode) & " and GasDate<=#" & CStr(ToSysDate(mDate)) & "#" & " group by GasAhCode", m_dbGrpDatabase, adOpenKeyset, adLockOptimistic
''End If
''If .RecordCount > 0 Then
''    mRtnval = .Fields("GasAmt_sum")
''End If
''End With
''CloseTable tRecset
''
''GetAhBalAsOnDate = mRtnval
''
''End Function

''Rem returns closing balance as on date for all account head
''Public Function GetAllAhBalAsOnDate(ByVal mDate As Date, Optional ByVal mDrCrFlag As String) As Double
''Dim mRtnval As Double, tRecset As New ADODB.RecordSet
''
''mRtnval = 0
''With tRecset
''If mDrCrFlag = cDR_FLAG Then
''    .Open "Select sum(GasAmt) as GasAmt_sum from gAchdSum where GasDate<=#" & CStr(ToSysDate(mDate)) & "# and GasAmt<0", m_dbGrpDatabase, adOpenKeyset, adLockOptimistic
''ElseIf mDrCrFlag = cCR_FLAG Then
''    .Open "Select sum(GasAmt) as GasAmt_sum from gAchdSum where GasDate<=#" & CStr(ToSysDate(mDate)) & "# and GasAmt>0", m_dbGrpDatabase, adOpenKeyset, adLockOptimistic
''Else
''    .Open "Select sum(GasAmt) as GasAmt_sum from gAchdSum where GasDate<=#" & CStr(ToSysDate(mDate)) & "#", m_dbGrpDatabase, adOpenKeyset, adLockOptimistic
''End If
''If .RecordCount > 0 Then
''    mRtnval = .Fields("GasAmt_sum")
''End If
''End With
''CloseTable tRecset
''
''GetAllAhBalAsOnDate = mRtnval
''
''End Function



Rem returns item name for either item code or item reference
Public Function GetAhName(ByVal mAhCode As Long) As String
Dim tRecset As New ADODB.Recordset, mRtnval As String

mRtnval = ""
With tRecset
.open "Select * from AchdMast where AhCode=" & CStr(mAhCode) & "", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    mRtnval = .fields("AhName")
End If
End With
CloseTable tRecset
GetAhName = mRtnval

End Function

''Public Function Delete(ByVal mAhCode As Long) As Boolean
''Dim mDeleteit As Boolean
''
''mDeleteit = True
''If ChkEntryExist(mAhCode) = True Then
''    ErrorBox "Entry Exist !!!"
''    mDeleteit = False
''End If
''If mDeleteit = True Then
''    mDeleteit = CanDelete()
''End If
''If mDeleteit = True Then
''    m_dbAcDatabase.BeginTrans
''    m_dbAcDatabase.Execute "Delete from AchdMast where Ahcode=" & CStr(mAhCode) & ""
''    m_dbAcDatabase.CommitTrans
''
''    m_dbGrpDatabase.BeginTrans
''    m_dbGrpDatabase.Execute "Delete from gAchdBal where abalAhCode=" & CStr(mAhCode) & ""
''    m_dbGrpDatabase.CommitTrans
''End If
''Delete = mDeleteit
''
''End Function

Public Function ChkEntryExist(ByVal mAhCode As Long, Optional ByVal mExcludeOpn As Boolean = False) As Boolean
Dim tRecset As New ADODB.Recordset

With tRecset
.open "Select * from Journal where JrnAhCode = " & CStr(mAhCode) & IIf(mExcludeOpn = True, " and JrnCode <> " & CStr(cOPJRNCODE), "") & "", m_dbAcDatabase, adOpenKeyset, adLockReadOnly
ChkEntryExist = (.RecordCount > 0)
End With
CloseTable tRecset

End Function

Public Function ChkDependencyExist(ByVal mAhCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset

With tRecset
.open "Select * from AchdMast where AhCode = " & CStr(mAhCode) & " and AhDepends = 0" & "", m_dbAcDatabase, adOpenKeyset, adLockReadOnly
ChkDependencyExist = (.RecordCount = 0)
End With
CloseTable tRecset

End Function



''Public Sub UpdateCurBal(ByVal mAhCode As Long, ByVal mTargetBal As Double, ByVal mOldBal As Double, ByVal mAddBal As Boolean, ByVal mDate As Date)
''Dim mCanUpdate As Boolean, pAhCurBal As Double
''mCanUpdate = True
''
''Call Me.Clear
''
''On Error GoTo errhand
''If mCanUpdate = True Then
''    m_dbAcDatabase.BeginTrans
''    With AhRecset
''    .Seek Array(mAhCode)
''
''    pAhCurBal = .Fields("AhCurBal")
''    If mAddBal = True Then
''        .Fields("AhCurBal") = pAhCurBal + mTargetBal - mOldBal
''        .Fields("AhCurBal_iaf") = ToMyAcFmt(pAhCurBal + mTargetBal - mOldBal)
''    Else
''        .Fields("AhCurBal") = pAhCurBal - mTargetBal
''        .Fields("AhCurBal_iaf") = ToMyAcFmt(pAhCurBal - mTargetBal)
''    End If
''    .Update
''    mAhCode_lng = .Fields("AhCode")
''    End With
''    m_dbAcDatabase.CommitTrans
''
''    Me.GetData mAhCode_lng
''
''    Rem Updating daywise running balance
''    m_dbGrpDatabase.BeginTrans
''    With gAchdSumRS
''    .Open "Select * from gAchdBal where abalAhcode=" & CStr(mAhCode) & " and abalDate=#" & CStr(ToSysDate(mDate)) & "#", m_dbGrpDatabase, adOpenKeyset, adLockOptimistic
''    If .RecordCount > 0 Then
''        If mAddBal = True Then
''            .Fields("abalAmt") = .Fields("abalAmt") + mTargetBal - mOldBal
''        Else
''            .Fields("abalAmt") = .Fields("abalAmt") - mTargetBal
''        End If
''        .Fields("abalRecState") = cREC_EDITED
''        .Update
''    Else
''        pAhCurBal = GetAhBalAsOnDate(mAhCode, mDate - 1)
''        If mAddBal = True Then
''            .AddNew
''            .Fields("abalDate") = mDate
''            .Fields("abalAhcode") = mAhCode
''            .Fields("abalAmt") = pAhCurBal + mTargetBal
''            .Fields("abalRecState") = cREC_ADDED
''            .Update
''        Else
''            ErrorBox "Missing day balance of " & mAhName_str & " dated " & Dtoc(mDate) & " !!!"
''        End If
''    End If
''    End With
''    m_dbGrpDatabase.CommitTrans
''    CloseTable gAchdSumRS
''
''    Rem update consecutive/following balances
''    m_dbGrpDatabase.BeginTrans
''    m_dbGrpDatabase.Execute "Update gAchdBal set abalAmt=abalAmt+" & CStr(mTargetBal - mOldBal) & " where abalAhcode=" & CStr(mAhCode) & " and abalDate>#" & CStr(ToSysDate(mDate)) & "#"
''    m_dbGrpDatabase.CommitTrans
''End If
''
''Exit Sub
''
''errhand:
''MsgBox Err.Description
''m_dbAcDatabase.Cancel
''Exit Sub
''
''End Sub

''Public Function GetAhBalAsOnDate(ByVal mAhCode As Long, ByVal mDate As Date) As Double
''Dim mRtnval As Double, mAhName As String, tRecset As New ADODB.RecordSet
''
''mRtnval = 0
''With tRecset
''.Open "Select abalAmt from gAchdBal where abalAhcode=" & CStr(mAhCode) & " and abalDate<=#" & CStr(ToSysDate(mDate)) & "#", m_dbGrpDatabase, adOpenKeyset, adLockOptimistic
''If .RecordCount > 0 Then
''    .MoveLast
''    mRtnval = .Fields("abalAmt")
''Else
''    AhRecset.Seek Array(mAhCode)
''    If AhRecset.EOF = False Then
''        mAhName = AhRecset.Fields("AhName")
''    Else
''        mAhName = CStr(mAhCode)
''    End If
''    ErrorBox "Missing day balance of " & mAhName & " dated " & Dtoc(mDate) & " !!!"
''End If
''End With
''CloseTable tRecset
''
''GetAhBalAsOnDate = mRtnval
''
''End Function

''Public Function GetMultiAhBalAsOnDate(ByVal mAhCode As String, ByVal mDate As Date, Optional mDrCrFlag As String) As Double
''Dim mRtnval As Double
''
''mRtnval = 0
''With gAchdSumRS
''Select Case mDrCrFlag
''Case cDR_FLAG:
''    Rem may have no records
''    .Open "Select abalDate,sum(abalAmt) as abalAmt_sum from gAchdBal where abalAhcode in (" & CStr(mAhCode) & ") and abalDate<=#" & CStr(ToSysDate(mDate)) & "# and abalAmt<0 group by abalDate order by abalDate", m_dbGrpDatabase, adOpenKeyset, adLockOptimistic
''Case cCR_FLAG:
''    Rem may have no records
''    .Open "Select abalDate,sum(abalAmt) as abalAmt_sum from gAchdBal where abalAhcode in (" & CStr(mAhCode) & ") and abalDate<=#" & CStr(ToSysDate(mDate)) & "# and abalAmt>0 group by abalDate order by abalDate", m_dbGrpDatabase, adOpenKeyset, adLockOptimistic
''Case Else
''    Rem atleast one record expected
''    .Open "Select abalDate,sum(abalAmt) as abalAmt_sum from gAchdBal where abalAhcode in (" & CStr(mAhCode) & ") and abalDate<=#" & CStr(ToSysDate(mDate)) & "# group by abalDate order by abalDate", m_dbGrpDatabase, adOpenKeyset, adLockOptimistic
''End Select
''If .RecordCount > 0 Then
''    .MoveLast
''    mRtnval = Nz(.Fields("abalAmt_sum"), 0)
''Else
''    If mDrCrFlag <> cDR_FLAG And mDrCrFlag <> cCR_FLAG Then
''        ErrorBox "Missing day balance of Multiple Accounts dated " & Dtoc(mDate) & " !!!"
''    End If
''End If
''End With
''CloseTable gAchdSumRS
''
''GetMultiAhBalAsOnDate = mRtnval
''
''End Function

''Public Function GetAllBalAsOnDate(ByVal mDate As Date, Optional mDrCrFlag As String) As Double
''Dim mRtnval As Double
''
''mRtnval = 0
''With gAchdSumRS
''Select Case mDrCrFlag
''Case cDR_FLAG:
''    .Open "Select abalDate,sum(abalAmt) as abalAmt_sum from gAchdBal where abalDate<=#" & CStr(ToSysDate(mDate)) & "# and abalAmt<0 group by abalDate order by abalDate", m_dbGrpDatabase, adOpenKeyset, adLockOptimistic
''    Rem may have no records
''Case cCR_FLAG:
''    .Open "Select abalDate,sum(abalAmt) as abalAmt_sum from gAchdBal where abalDate<=#" & CStr(ToSysDate(mDate)) & "# and abalAmt>0 group by abalDate order by abalDate", m_dbGrpDatabase, adOpenKeyset, adLockOptimistic
''    Rem may have no records
''Case Else
''    .Open "Select abalDate,sum(abalAmt) as abalAmt_sum from gAchdBal where abalDate<=#" & CStr(ToSysDate(mDate)) & "# group by abalDate order by abalDate", m_dbGrpDatabase, adOpenKeyset, adLockOptimistic
''    Rem atleast one record expected
''End Select
''If .RecordCount > 0 Then
''    .MoveLast
''    mRtnval = .Fields("abalAmt_sum")
''Else
''    If mDrCrFlag <> cDR_FLAG And mDrCrFlag <> cCR_FLAG Then
''        ErrorBox "Missing day balance of All Accounts dated " & Dtoc(mDate) & " !!!"
''    End If
''End If
''End With
''CloseTable gAchdSumRS
''
''GetAllBalAsOnDate = mRtnval
''
''End Function

''Public Sub ResetAllMastCurBal()
''m_dbAcDatabase.BeginTrans
''m_dbAcDatabase.Execute "Update AchdMast set AhCurBal=0,AhCurBal_iaf='" & cNODRCR_FLAG & "'"
''m_dbAcDatabase.CommitTrans
''AhRecset.Requery
''
''End Sub

Public Sub ResetAllAhGrpAmtSum()
m_dbGrpDatabase.BeginTrans
m_dbGrpDatabase.Execute "Update gAchdSum set GasAmt=0,GasRecState=" & CStr(cREC_NEW) & ""
m_dbGrpDatabase.CommitTrans

End Sub

Public Sub RepostAllAhGrpAmtSum()
Dim tRecset As New ADODB.Recordset, gAchdSumRS As New ADODB.Recordset
Dim mDate As Date, mAhCode As Long, mTargetAmt As Double

gAchdSumRS.open "gAchdSum", m_dbGrpDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
gAchdSumRS.Index = "GasDateAhCode"

tRecset.open "Select JrnDate,JrnAhCode,sum(JrnAmt) as JrnAmt_sum from Journal group by JrnDate,JrnAhCode order by JrnDate,JrnAhCode", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
If tRecset.RecordCount > 0 Then
On Error GoTo errhand
m_dbGrpDatabase.BeginTrans
Do While tRecset.EOF = False
    mDate = tRecset.fields("JrnDate")
    mAhCode = tRecset.fields("JrnAhCode")
    mTargetAmt = tRecset.fields("JrnAmt_sum")
    
    gAchdSumRS.Seek Array(mDate, mAhCode)
    If gAchdSumRS.EOF = False Then
        gAchdSumRS.fields("GasAmt") = mTargetAmt
        gAchdSumRS.fields("GasRecState") = ChkEditRecStatus(gAchdSumRS.fields("GasRecState"))
        gAchdSumRS.Update
    Else
        gAchdSumRS.AddNew
        gAchdSumRS.fields("GasDate") = mDate
        gAchdSumRS.fields("GasAhCode") = mAhCode
        gAchdSumRS.fields("GasAmt") = mTargetAmt
        gAchdSumRS.fields("GasRecState") = cREC_ADDED
        gAchdSumRS.Update
    End If
    
    tRecset.MoveNext
Loop
m_dbGrpDatabase.CommitTrans
End If
CloseTable gAchdSumRS
CloseTable tRecset
GoTo EndSub

errhand:
MsgBox Err.Description
m_dbGrpDatabase.RollbackTrans

EndSub:
Set tRecset = Nothing
Set gAchdSumRS = Nothing
Exit Sub

End Sub

Public Sub RemoveUnusedAllAhGrpAmtSum()
m_dbGrpDatabase.BeginTrans
m_dbGrpDatabase.Execute "Delete from gAchdSum where GasRecState=" & CStr(cREC_NEW) & ""
m_dbGrpDatabase.CommitTrans

End Sub

Rem returns opening balance in array or string for specified account head
Public Function GetAhOpnBal(ByVal mAhCode As Long, Optional ByVal mDrCrSeperated As Boolean = False) As Variant
Dim aRtnval(0 To 1) As Variant, tRecset As New ADODB.Recordset

aRtnval(0) = 0 ' combined/dr balance
aRtnval(1) = 0 ' cr balance

With tRecset
If mDrCrSeperated = True Then
    .open "Select sum(iif(JrnAmt<0,JrnAmt,0)) as DrJrnAmt_sum, sum(iif(JrnAmt>0,JrnAmt,0)) as CrJrnAmt_sum from Journal where JrnCode=" & CStr(cOPJRNCODE) & " and JrnAhCode=" & CStr(mAhCode) & " and JrnDate=#" & CStr(ToSysDate(sCmpBookStartDate - 1)) & "#", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.RecordCount > 0 Then
        aRtnval(0) = .fields("DrJrnAmt_sum")
        aRtnval(1) = .fields("CrJrnAmt_sum")
    End If
Else
    .open "Select sum(JrnAmt) as JrnAmt_sum from Journal group by JrnCode,JrnAhCode,JrnDate having JrnCode=" & CStr(cOPJRNCODE) & " and JrnAhCode=" & CStr(mAhCode) & " and JrnDate=#" & CStr(ToSysDate(sCmpBookStartDate - 1)) & "#", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.RecordCount > 0 Then
        aRtnval(0) = .fields("JrnAmt_sum")
    End If
End If
End With
CloseTable tRecset

GetAhOpnBal = aRtnval

End Function

Rem returns opening balance in array or string for all account head
Public Function GetAllAhOpnBal(Optional ByVal mDrCrSeperated As Boolean = False) As Variant
Dim aRtnval(0 To 1) As Variant, tRecset As New ADODB.Recordset

aRtnval(0) = 0 ' combined/dr balance
aRtnval(1) = 0 ' cr balance

With tRecset
If mDrCrSeperated = True Then
    .open "Select sum(iif(JrnAmt<0,JrnAmt,0)) as DrJrnAmt_sum, sum(iif(JrnAmt>0,JrnAmt,0)) as CrJrnAmt_sum from Journal where JrnCode=" & CStr(cOPJRNCODE) & " and JrnDate=#" & CStr(ToSysDate(sCmpBookStartDate - 1)) & "#" & " group by JrnCode", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.RecordCount > 0 Then
        aRtnval(0) = .fields("DrJrnAmt_sum")
        aRtnval(1) = .fields("CrJrnAmt_sum")
    End If
Else
    .open "Select sum(JrnAmt) as JrnAmt_sum from Journal where JrnCode=" & CStr(cOPJRNCODE) & " and JrnDate=#" & CStr(ToSysDate(sCmpBookStartDate - 1)) & "#" & " group by JrnCode", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.RecordCount > 0 Then
        aRtnval(0) = .fields("JrnAmt_sum")
    End If
End If
End With
CloseTable tRecset

GetAllAhOpnBal = aRtnval

End Function

Rem returns current amount as on date in array or string for specified account head
Public Function GetAhCurBal(ByVal mAhCode As Long, ByVal mDate As Date, Optional ByVal mDrCrSeperated As Boolean = False) As Variant
Dim aRtnval(0 To 1) As Variant, tRecset As New ADODB.Recordset

aRtnval(0) = 0 ' combined/dr balance
aRtnval(1) = 0 ' credit balance

With tRecset
If mDrCrSeperated = True Then
    .open "Select sum(iif(GasAmt<0,GasAmt,0)) as DrGasAmt_sum, sum(iif(GasAmt>0,GasAmt,0)) as CrGasAmt_sum from gAchdSum where GasAhCode=" & CStr(mAhCode) & " and GasDate<=#" & CStr(ToSysDate(mDate)) & "#", m_dbGrpDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.RecordCount > 0 Then
        Rem debit balance
        aRtnval(0) = .fields("DrGasAmt_sum")
        
        Rem credit balance
        aRtnval(1) = .fields("CrGasAmt_sum")
    End If
Else
    .open "Select sum(GasAmt) as GasAmt_sum from gAchdSum where GasAhCode=" & CStr(mAhCode) & " and GasDate<=#" & CStr(ToSysDate(mDate)) & "#", m_dbGrpDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.RecordCount > 0 Then
        aRtnval(0) = .fields("GasAmt_sum")
    End If
End If
End With
CloseTable tRecset

GetAhCurBal = aRtnval

End Function

Rem returns current balance as on date in array or string for all account head
Public Function GetAllAhCurBal(ByVal mDate As Date, Optional ByVal mDrCrSeperated As Boolean = False) As Variant
Dim aRtnval(0 To 1) As Variant, tRecset As New ADODB.Recordset

aRtnval(0) = 0 ' combined/dr balance
aRtnval(1) = 0 ' credit balance

With tRecset
.open "Select GasDate from gAchdSum where GasDate<=#" & CStr(ToSysDate(mDate)) & "#", m_dbGrpDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    .Close
    If mDrCrSeperated = True Then
        .open "Select sum(iif(GasAmt<0,GasAmt,0)) as DrGasAmt_sum, sum(iif(GasAmt>0,GasAmt,0)) as CrGasAmt_sum from gAchdSum where GasDate<=#" & CStr(ToSysDate(mDate)) & "#", m_dbGrpDatabase, adOpenKeyset, adLockOptimistic
        If .RecordCount > 0 Then
            Rem debit balance
            aRtnval(0) = .fields("DrGasAmt_sum")
            
            Rem credit balance
            aRtnval(1) = .fields("CrGasAmt_sum")
        End If
    Else
        .open "Select sum(GasAmt) as GasAmt_sum from gAchdSum where GasDate<=#" & CStr(ToSysDate(mDate)) & "#", m_dbGrpDatabase, adOpenKeyset, adLockOptimistic
        If .RecordCount > 0 Then
            aRtnval(0) = .fields("GasAmt_sum")
        End If
    End If
End If
End With
CloseTable tRecset

GetAllAhCurBal = aRtnval

End Function

Public Sub UpdateDependency(ByVal mAhCode As Long, ByVal mAddCount As Boolean)
Dim tRecset As New ADODB.Recordset

m_dbAcDatabase.BeginTrans
With tRecset
.open "Select * from AchdMast where AhCode=" & CStr(mAhCode) & "", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    .fields("AhDepends") = .fields("AhDepends") + IIf(mAddCount = True, 1, -1)
    .Update
Else
    ErrorBox "clsAccountHead_UpdateDependency_1444_[Record Not Found]"
End If
End With
m_dbAcDatabase.CommitTrans
CloseTable tRecset

End Sub

