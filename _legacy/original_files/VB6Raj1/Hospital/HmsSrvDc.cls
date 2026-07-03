VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsHmsServDoctEntry"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False

Option Explicit

Dim m_dbHmsDatabase As ADODB.Connection, m_dbAcDatabase As ADODB.Connection
Dim mTitleName As String, mTrnSdcTableName As String, mTrnSdcCodeField As String, mTrnSdcSubCodeField As String, mTrnSdcICodeField As String, mTrnSdcSnoField As String, mTrnSdcDateField As String, mTrnSdcSrvCodeField As String, mTrnSdcPttCodeField As String, mTrnSdcDctCodeField As String, mTrnSdcDrlCodeField As String, mTrnSdcRemarkField As String, mTrnSdcRecStateField As String, mTrnSdcCmpCodeField As String
Dim mClassUIdCode As Long, mClassUIdFileName As String, mClassAcsPermFileName As String
Public blnOutdRcDctTran As Boolean, blnOutdBlDctTran As Boolean, blnIndrRcDctTran As Boolean, blnIndrBlDctTran As Boolean
Rem SDC implies Service Doctor
Public mSdcCode_lng As Long, mSdcSubCode_lng As Long, mSdcICode_lng As Long, mSdcSno_int As Integer, mSdcDate_dt As Long, mSdcSrvCode_lng As Long, mSdcPttCode_lng As Long, mSdcDctCode_lng As Long, mSdcDrlCode_lng As Long, mSdcRemark_str As String, mSdcRecState_int As Integer, mSdcCmpCode_int As Integer

Dim mActiveMast As Integer, aMastTran() As Variant

Public Sub Init()
If blnOutdRcDctTran = True Then
    mTrnSdcTableName = "OutdRcDctDtl"
    mTrnSdcCodeField = "OrdCode"
    mTrnSdcSubCodeField = "OrdOrcCode"
    mTrnSdcICodeField = "OrdICode"
    mTrnSdcSnoField = "OrdSno"
    mTrnSdcDateField = "OrdDate"
    mTrnSdcSrvCodeField = "OrdSrvCode"
    mTrnSdcPttCodeField = "OrdPttCode"
    mTrnSdcDctCodeField = "OrdDctCode"
    mTrnSdcDrlCodeField = "OrdDrlCode"
    mTrnSdcRemarkField = "OrdRemark"
    mTrnSdcRecStateField = "OrdRecState"
    mTrnSdcCmpCodeField = "OrdCmpCode"
    mTitleName = "Outdoor Receipt Doctor Detail"
    
ElseIf blnOutdBlDctTran = True Then
    mTrnSdcTableName = "OutdBlDctDtl"
    mTrnSdcCodeField = "ObdCode"
    mTrnSdcSubCodeField = "ObdOblCode"
    mTrnSdcICodeField = "ObdICode"
    mTrnSdcSnoField = "ObdSno"
    mTrnSdcDateField = "ObdDate"
    mTrnSdcSrvCodeField = "ObdSrvCode"
    mTrnSdcPttCodeField = "ObdPttCode"
    mTrnSdcDctCodeField = "ObdDctCode"
    mTrnSdcDrlCodeField = "ObdDrlCode"
    mTrnSdcRemarkField = "ObdRemark"
    mTrnSdcRecStateField = "ObdRecState"
    mTrnSdcCmpCodeField = "ObdCmpCode"
    mTitleName = "Outdoor Bill Doctor Detail"
    
ElseIf blnIndrRcDctTran = True Then
    mTrnSdcTableName = "IndrRcDctDtl"
    mTrnSdcCodeField = "IrdCode"
    mTrnSdcSubCodeField = "IrdIrcCode"
    mTrnSdcICodeField = "IrdICode"
    mTrnSdcSnoField = "IrdSno"
    mTrnSdcDateField = "IrdDate"
    mTrnSdcSrvCodeField = "IrdSrvCode"
    mTrnSdcPttCodeField = "IrdPttCode"
    mTrnSdcDctCodeField = "IrdDctCode"
    mTrnSdcDrlCodeField = "IrdDrlCode"
    mTrnSdcRemarkField = "IrdRemark"
    mTrnSdcRecStateField = "IrdRecState"
    mTrnSdcCmpCodeField = "IrdCmpCode"
    mTitleName = "Indoor Receipt Doctor Detail"
    
ElseIf blnIndrBlDctTran = True Then
    mTrnSdcTableName = "IndrBlDctDtl"
    mTrnSdcCodeField = "IbdCode"
    mTrnSdcSubCodeField = "IbdIblCode"
    mTrnSdcICodeField = "IbdICode"
    mTrnSdcSnoField = "IbdSno"
    mTrnSdcDateField = "IbdDate"
    mTrnSdcSrvCodeField = "IbdSrvCode"
    mTrnSdcPttCodeField = "IbdPttCode"
    mTrnSdcDctCodeField = "IbdDctCode"
    mTrnSdcDrlCodeField = "IbdDrlCode"
    mTrnSdcRemarkField = "IbdRemark"
    mTrnSdcRecStateField = "IbdRecState"
    mTrnSdcCmpCodeField = "IbdCmpCode"
    mTitleName = "Indoor Bill Doctor Detail"
    
Else
    ErrorBox "clsHmsServDoctEntry_Init_#65_[Undefined Case]"
End If

End Sub

Public Property Set dbHmsDatabase(ByRef db As ADODB.Connection)
Set m_dbHmsDatabase = db

End Property

Public Property Set dbAcDatabase(ByRef db As ADODB.Connection)
Set m_dbAcDatabase = db

End Property

Private Sub Class_Initialize()
aMastTran = Array()
mActiveMast = UBound(aMastTran)

mClassUIdFileName = "clHmsSdc.UId"
mClassAcsPermFileName = "clHmsSdc.Acp"
mClassUIdCode = GetUIdCode("clsHmsServDoctEntry_Initialize", mUIdFileName:=mClassUIdFileName, mAcsPermFileName:=mClassAcsPermFileName)

End Sub


Private Sub Class_Terminate()
If UBound(aMastTran) >= LBound(aMastTran) Then
    ErrorBox mTitleName & " Entry in Process !!!"
End If

End Sub

Public Function BeginTran(ByVal mSdcCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset
BeginTran = False

If mSdcCode <= 0 Then
    If mSdcCode = 0 Then
        ErrorBox mTitleName & " Entry Failed !!!"
        GoTo EndSub
    End If
ElseIf mSdcCode > 0 Then
    tRecset.Open "Select * from " & mTrnSdcTableName & " where " & mTrnSdcCodeField & "=" & CStr(mSdcCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
    Rem entries may or may not exist
    Rem If tRecset.EOF = True Then
    Rem     ErrorBox mTitleName & " Entry not Found !!!"
    Rem     GoTo EndSub
    Rem End If
    CloseTable tRecset
Else
    ErrorBox "Invalid " & mTitleName & " Entry !!!"
    GoTo EndSub
End If
mActiveMast = UBound(aMastTran) + 1
ReDim Preserve aMastTran(mActiveMast)
aMastTran(mActiveMast) = mSdcCode

Call Data_CreateLog(mSdcCode)

BeginTran = True

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Function

End Function

Public Function EndTran(ByVal mSdcCode As Long) As Boolean
Dim mCnt As Integer
EndTran = False
If Chk_ActiveTran() = False Or IIf(ActiveTrnCode > 0, mSdcCode <> ActiveTrnCode, False) Then
    ErrorBox "No Active " & mTitleName & " Entry !!!"
    Exit Function
End If
Call Data_RemoveLog(mSdcCode)

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

EndTran = True
End Function

Public Property Get ActiveTrnCode() As Long
On Error GoTo errhand

ActiveTrnCode = aMastTran(mActiveMast)

Exit Property

errhand:
ErrorBox Err.Description
ActiveTrnCode = -1
Exit Property

End Property

Rem update transactional sum up, physically deletes records marked for deletion or marks ok records for added or edited
Public Function UpdateTran(ByVal mSdcCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset
UpdateTran = False

On Error GoTo errhand

m_dbHmsDatabase.BeginTrans
Rem updating Master
With tRecset
.Open "Select * from " & mTrnSdcTableName & " where  " & mTrnSdcCodeField & "=" & CStr(mSdcCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Do While .EOF = False
        If InList(.fields(mTrnSdcRecStateField), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
            Rem important: below duplicate fields are required to be passed for any change in updation
            If .fields(mTrnSdcDateField) <> mSdcDate_dt Then
                .fields(mTrnSdcDateField) = mSdcDate_dt
            End If
            If .fields(mTrnSdcPttCodeField) <> mSdcPttCode_lng Then
                .fields(mTrnSdcPttCodeField) = mSdcPttCode_lng
            End If
            .fields(mTrnSdcRecStateField) = cREC_UNCHANGED
            .Update
        Else
            .fields(mTrnSdcRecStateField) = ChkDeleteRecStatus(.fields(mTrnSdcRecStateField))
            .Update
            .Delete
        End If
        .MoveNext
    Loop
    'm_dbHmsDatabase.Execute "Update OutdRcDctDtl set OrdDate=(Select OrcDate from OutdRcpt where OrcCode=" & cstr()   )"
    
End If
End With
CloseTable tRecset
m_dbHmsDatabase.CommitTrans

UpdateTran = True
GoTo EndSub

errhand:
MsgBox Err.Description
m_dbHmsDatabase.Cancel

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Function

End Function

Rem checks entries with log table, if log exist restores log records else delete records (assuming new records added), balance updation part not done here because master entries does not have effect while in process
Public Function CancelTran(ByVal mSdcCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset, LogRS As New ADODB.Recordset
Dim mRecEdited As Boolean, mRecDeleted As Boolean

CancelTran = False
If Chk_ActiveTran() = False Or mSdcCode <> ActiveTrnCode Then
    ErrorBox "No Active " & mTitleName & " Entry to Cancel !!!"
    GoTo EndSub
End If
On Error GoTo errhand

m_dbHmsDatabase.BeginTrans
With tRecset
.Open "Select * from " & mTrnSdcTableName & " where " & mTrnSdcCodeField & "=" & CStr(mSdcCode), m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
LogRS.Open "Select * from " & mTrnSdcTableName & "_Log where " & mTrnSdcCodeField & "=" & CStr(mSdcCode) & " order by " & mTrnSdcICodeField & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Do While .EOF = False
        LogRS.Find mTrnSdcICodeField & "=" & CStr(.fields(mTrnSdcICodeField)), Start:=1
        If LogRS.EOF = False Then
            .fields(mTrnSdcCodeField) = LogRS.fields(mTrnSdcCodeField)
            .fields(mTrnSdcSubCodeField) = LogRS.fields(mTrnSdcSubCodeField)
            Rem .fields(mTrnSdcICodeField) = LogRS.fields(mTrnSdcICodeField)
            .fields(mTrnSdcSnoField) = LogRS.fields(mTrnSdcSnoField)
            .fields(mTrnSdcDateField) = LogRS.fields(mTrnSdcDateField)
            .fields(mTrnSdcSrvCodeField) = LogRS.fields(mTrnSdcSrvCodeField)
            .fields(mTrnSdcPttCodeField) = LogRS.fields(mTrnSdcPttCodeField)
            .fields(mTrnSdcDctCodeField) = LogRS.fields(mTrnSdcDctCodeField)
            .fields(mTrnSdcDrlCodeField) = LogRS.fields(mTrnSdcDrlCodeField)
            .fields(mTrnSdcRemarkField) = LogRS.fields(mTrnSdcRemarkField)
            .fields(mTrnSdcRecStateField) = LogRS.fields(mTrnSdcRecStateField)
            .fields(mTrnSdcCmpCodeField) = LogRS.fields(mTrnSdcCmpCodeField)
            
            .Update
        Else
            .fields(mTrnSdcRecStateField) = ChkDeleteRecStatus(.fields(mTrnSdcRecStateField))
            .Update
            .Delete
        End If
        .MoveNext
    Loop
End If
End With
CloseTable tRecset
CloseTable LogRS
m_dbHmsDatabase.CommitTrans

CancelTran = True
GoTo EndSub

errhand:
MsgBox Err.Description
m_dbHmsDatabase.Cancel

EndSub:
CloseTable tRecset, mCheckOpen:=True
CloseTable LogRS, mCheckOpen:=True
Exit Function

End Function

Rem checks entries with log table, if log exist restores log records else delete records (assuming new records added), balance updation part not done here because master entries does not have effect while in process
Public Function CancelSubTran(ByVal mSdcCode As Long, ByVal mSdcSubCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset, LogRS As New ADODB.Recordset
Dim mRecEdited As Boolean, mRecDeleted As Boolean

CancelSubTran = False
If Chk_ActiveTran() = False Or mSdcCode <> ActiveTrnCode Then
    ErrorBox "No Active " & mTitleName & " Entry to Cancel !!!"
    GoTo EndSub
End If
On Error GoTo errhand

m_dbHmsDatabase.BeginTrans
With tRecset
.Open "Select * from " & mTrnSdcTableName & " where " & mTrnSdcCodeField & "=" & CStr(mSdcCode) & " and " & mTrnSdcSubCodeField & "=" & CStr(mSdcSubCode), m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
LogRS.Open "Select * from " & mTrnSdcTableName & "_Log where " & mTrnSdcCodeField & "=" & CStr(mSdcCode) & " and " & mTrnSdcSubCodeField & "=" & CStr(mSdcSubCode) & " order by " & mTrnSdcICodeField & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Do While .EOF = False
        LogRS.Find mTrnSdcICodeField & "=" & CStr(.fields(mTrnSdcICodeField)), Start:=1
        If LogRS.EOF = False Then
            .fields(mTrnSdcCodeField) = LogRS.fields(mTrnSdcCodeField)
            .fields(mTrnSdcSubCodeField) = LogRS.fields(mTrnSdcSubCodeField)
            Rem .fields(mTrnSdcICodeField) = LogRS.fields(mTrnSdcICodeField)
            .fields(mTrnSdcSnoField) = LogRS.fields(mTrnSdcSnoField)
            .fields(mTrnSdcDateField) = LogRS.fields(mTrnSdcDateField)
            .fields(mTrnSdcSrvCodeField) = LogRS.fields(mTrnSdcSrvCodeField)
            .fields(mTrnSdcPttCodeField) = LogRS.fields(mTrnSdcPttCodeField)
            .fields(mTrnSdcDctCodeField) = LogRS.fields(mTrnSdcDctCodeField)
            .fields(mTrnSdcDrlCodeField) = LogRS.fields(mTrnSdcDrlCodeField)
            .fields(mTrnSdcRemarkField) = LogRS.fields(mTrnSdcRemarkField)
            .fields(mTrnSdcRecStateField) = LogRS.fields(mTrnSdcRecStateField)
            .fields(mTrnSdcCmpCodeField) = LogRS.fields(mTrnSdcCmpCodeField)
            
            .Update
        Else
            .fields(mTrnSdcRecStateField) = ChkDeleteRecStatus(.fields(mTrnSdcRecStateField))
            .Update
            .Delete
        End If
        .MoveNext
    Loop
End If
End With
CloseTable tRecset
CloseTable LogRS
m_dbHmsDatabase.CommitTrans

CancelSubTran = True
GoTo EndSub

errhand:
MsgBox Err.Description
m_dbHmsDatabase.Cancel

EndSub:
CloseTable tRecset, mCheckOpen:=True
CloseTable LogRS, mCheckOpen:=True
Exit Function

End Function

Rem marking records for deletion
Public Function DeleteTran(ByVal mSdcCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset
DeleteTran = False
If Chk_ActiveTran() = False Or mSdcCode <> ActiveTrnCode Then
    ErrorBox "No Active " & mTitleName & " Entry to Delete !!!"
    GoTo EndSub
End If
On Error GoTo errhand

m_dbHmsDatabase.BeginTrans
With tRecset
.Open "Select * from " & mTrnSdcTableName & " where " & mTrnSdcCodeField & "=" & CStr(mSdcCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Do While .EOF = False
        .fields(mTrnSdcRecStateField) = ChkDeleteRecStatus(.fields(mTrnSdcRecStateField))
        .Update
        
        .MoveNext
    Loop
Else
    ErrorBox "clsHmsServDoctEntry_DeleteTran_254"
End If
End With
CloseTable tRecset
m_dbHmsDatabase.CommitTrans

DeleteTran = True
GoTo EndSub

errhand:
MsgBox Err.Description
m_dbHmsDatabase.Cancel

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Function

End Function

Public Function SelectMast(ByVal mSdcCode As Long) As Boolean
Dim mEntryFound As Boolean
SelectMast = False
If mSdcCode < 1 Then
    ErrorBox "Invalid " & mTitleName & " Entry !!!"
    Exit Function
End If
mEntryFound = False
For mActiveMast = LBound(aMastTran) To UBound(aMastTran)
    If aMastTran(mActiveMast) = mSdcCode Then
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

Public Function Chk_ActiveTran() As Boolean
If BOMast = False And EOMast = False Then
    Chk_ActiveTran = True
Else
    Chk_ActiveTran = False
End If

End Function

Private Function Data_CreateLog(ByVal mSdcCode As Long) As Boolean
Dim LogRS As New ADODB.Recordset

Data_CreateLog = False
If Chk_ActiveTran() = False Or mSdcCode <> ActiveTrnCode Then
    ErrorBox "No Active " & mTitleName & " Entry to Create Log !!!"
    GoTo EndSub
End If

With LogRS
.Open "Select * from " & mTrnSdcTableName & "_Log where " & mTrnSdcCodeField & "=" & CStr(mSdcCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .EOF = True Then
    m_dbHmsDatabase.BeginTrans
    m_dbHmsDatabase.Execute "Insert into " & mTrnSdcTableName & "_Log" & " Select * from " & mTrnSdcTableName & " where " & mTrnSdcCodeField & "=" & CStr(mSdcCode) & ""
    m_dbHmsDatabase.CommitTrans
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

Private Function Data_RemoveLog(ByVal mSdcCode As Long) As Boolean
Data_RemoveLog = False
If Chk_ActiveTran() = False Then        ''' Or mSdcCode <> ActiveTrnCode
    ErrorBox "No Active " & mTitleName & " Entry to Remove Log !!!"
    Exit Function
End If

m_dbHmsDatabase.BeginTrans
m_dbHmsDatabase.Execute "Delete from " & mTrnSdcTableName & "_Log" & " where " & mTrnSdcCodeField & "=" & CStr(mSdcCode)
m_dbHmsDatabase.CommitTrans

Data_RemoveLog = True

End Function

Public Sub AddNewSdc(ByVal mSdcCode As Long, ByVal mSdcSubCode As Long)
Dim tRecset As New ADODB.Recordset, mCanAddNew As Boolean, mLCount As Integer, mUCount As Integer, acount As Integer
mCanAddNew = True

On Error GoTo errhand
mSdcICode_lng = 0
If mCanAddNew = True Then
    m_dbHmsDatabase.BeginTrans
    With tRecset
    .Open "Select * from " & mTrnSdcTableName & " where " & mTrnSdcICodeField & "=" & CStr(-0.1) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
    
    .AddNew
    
    .fields(mTrnSdcCodeField) = mSdcCode
    .fields(mTrnSdcSubCodeField) = mSdcSubCode
    Rem .fields(mTrnSdcICodeField) = mSdcICode_lng AutoNumber
    .fields(mTrnSdcSnoField) = mSdcSno_int
    .fields(mTrnSdcDateField) = mSdcDate_dt
    .fields(mTrnSdcSrvCodeField) = mSdcSrvCode_lng
    .fields(mTrnSdcPttCodeField) = mSdcPttCode_lng
    .fields(mTrnSdcDctCodeField) = mSdcDctCode_lng
    .fields(mTrnSdcDrlCodeField) = mSdcDrlCode_lng
    .fields(mTrnSdcRemarkField) = mSdcRemark_str
    .fields(mTrnSdcRecStateField) = cREC_ADDED
    .fields(mTrnSdcCmpCodeField) = mSdcCmpCode_int
    
    .Update
    mSdcICode_lng = .fields(mTrnSdcICodeField)
    Rem aMastTran(mActiveMast) = mSdcICode_lng
    End With
    CloseTable tRecset
    
    m_dbHmsDatabase.CommitTrans
End If
GoTo EndSub

errhand:
MsgBox Err.Description
m_dbHmsDatabase.Cancel

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Sub

End Sub

Public Sub UpdateSdc(ByVal mSdcCode As Long, mSdcSubCode As Long, ByVal mSdcICode As Long)
Dim tRecset As New ADODB.Recordset, mCanUpdate As Boolean, mLCount As Integer, mUCount As Integer, acount As Integer
mCanUpdate = True

On Error GoTo errhand
mSdcICode_lng = 0
If mCanUpdate = True Then
    m_dbHmsDatabase.BeginTrans
    With tRecset
    .Open "Select * from " & mTrnSdcTableName & " where " & mTrnSdcCodeField & "=" & CStr(mSdcCode) & " and " & mTrnSdcSubCodeField & "=" & CStr(mSdcSubCode) & " and " & mTrnSdcICodeField & "=" & CStr(mSdcICode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
    
    Rem .fields(mTrnSdcCodeField) = mSdcCode_lng
    Rem .fields(mTrnSdcSubCodeField) = mSdcSubCode_lng
    Rem .fields(mTrnSdcICodeField) = mSdcICode_lng AutoNumber
    .fields(mTrnSdcSnoField) = mSdcSno_int
    .fields(mTrnSdcDateField) = mSdcDate_dt
    .fields(mTrnSdcSrvCodeField) = mSdcSrvCode_lng
    .fields(mTrnSdcPttCodeField) = mSdcDctCode_lng
    .fields(mTrnSdcDctCodeField) = mSdcDctCode_lng
    .fields(mTrnSdcDrlCodeField) = mSdcDrlCode_lng
    .fields(mTrnSdcRemarkField) = mSdcRemark_str
    .fields(mTrnSdcRecStateField) = ChkEditRecStatus(.fields(mTrnSdcRecStateField))
    .fields(mTrnSdcCmpCodeField) = mSdcCmpCode_int
    
    .Update
    mSdcICode_lng = .fields(mTrnSdcICodeField)
    End With
    CloseTable tRecset
    
    m_dbHmsDatabase.CommitTrans
End If
GoTo EndSub

errhand:
MsgBox Err.Description
m_dbHmsDatabase.Cancel

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Sub

End Sub

Public Function DeleteSdc(ByVal mSdcCode As Long, ByVal mSdcSubCode As Long, ByVal mSdcICode As Long, Optional mConfirm As Boolean) As Boolean
Dim tRecset As New ADODB.Recordset, mDeleteit As Boolean

DeleteSdc = False
If Chk_ActiveTran() = False Or mSdcCode <> ActiveTrnCode Then
    ErrorBox "clsHmsServDoctEntry_DeleteSdc_#575_[InActive " & mTitleName & " Entry]"
    GoTo EndSub
End If

DeleteSdc = True

mDeleteit = True
If mDeleteit = True Then
    If mConfirm = True Then
        mDeleteit = CanDelete()
    End If
End If
If mDeleteit = True Then
    On Error GoTo errhand
    
    m_dbHmsDatabase.BeginTrans
    With tRecset
    .Open "Select * from " & mTrnSdcTableName & " where " & mTrnSdcCodeField & "=" & CStr(mSdcCode) & " and " & mTrnSdcSubCodeField & "=" & mSdcSubCode & " and " & mTrnSdcICodeField & "=" & CStr(mSdcICode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
    
    .fields(mTrnSdcRecStateField) = ChkDeleteRecStatus(.fields(mTrnSdcRecStateField))
    .Update
    End With
    CloseTable tRecset
    m_dbHmsDatabase.CommitTrans
End If

DeleteSdc = True
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

Public Function DeleteSubTran(ByVal mSdcCode As Long, ByVal mSdcSubCode As Long, Optional mConfirm As Boolean) As Boolean
Dim tRecset As New ADODB.Recordset, mDeleteit As Boolean

DeleteSubTran = False
If Chk_ActiveTran() = False Or mSdcCode <> ActiveTrnCode Then
    ErrorBox "clsHmsServDoctEntry_Delete_#713_[InActive " & mTitleName & " Entry]"
    GoTo EndSub
End If

DeleteSubTran = True

mDeleteit = True
If mDeleteit = True Then
    If mConfirm = True Then
        mDeleteit = CanDelete()
    End If
End If
If mDeleteit = True Then
    On Error GoTo errhand
    
    m_dbHmsDatabase.BeginTrans
    With tRecset
    .Open "Select * from " & mTrnSdcTableName & " where " & mTrnSdcCodeField & "=" & CStr(mSdcCode) & " and " & mTrnSdcSubCodeField & "=" & CStr(mSdcSubCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
    Do While .EOF = False
        .fields(mTrnSdcRecStateField) = ChkDeleteRecStatus(.fields(mTrnSdcRecStateField))
        .Update
        
        .MoveNext
    Loop
    End With
    CloseTable tRecset
    m_dbHmsDatabase.CommitTrans
End If

DeleteSubTran = True
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

Public Function CanDeleteMast(ByVal mSdcCode As Long, Optional ByVal mSkipConfirm As Boolean) As Boolean
Dim mDeleteit As Boolean

mDeleteit = True

If ChkEntryExist(mSdcCode) = True Then
    ErrorBox "Entry Exist !!!"
    mDeleteit = False
End If
If mDeleteit = True And mSkipConfirm = False Then
    mDeleteit = CanDelete()
End If

CanDeleteMast = mDeleteit

End Function

Public Function ChkEntryExist(ByVal mSdcCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset

MsgBox "ChkEntryExist Pending !!!"

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Function

End Function

