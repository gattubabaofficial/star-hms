VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsComOptionsEntry"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Dim m_dbAcDatabase As ADODB.Connection, m_dbStDatabase As ADODB.Connection
Dim mTableName As String, mCodeField As String, mNameField As String, mRecStateField As String, mTitleName As String
Public blnLoginOptMast As Boolean, blnStationMast As Boolean, blnAreaMast As Boolean, blnVTypeMast As Boolean
Public mLoginName_str As String, mLoginPwd_str As String
Public mCode_lng As Long, mName_str As String, mRecState_int As Integer
Public mVtmAbvr_str As String, mVtmSysCode_int As Integer, mVtmPrefix_str As String, mVtmPostfix_str As String, mVtmItmNarr_str As String, mVtmComNarr_str As String, mVtmEditable_bln As Boolean, mVtmStartNo_lng As Long, mVtmResetNoBasis_int As Integer, mVtmIndex_int As Integer, mVtmShowInList_bln As Boolean
Dim mActiveMast As Integer, aMastTran() As Variant

Public Sub Init()
If blnLoginOptMast = True Then
    mTableName = ""
    mCodeField = ""
    mNameField = ""
    mRecStateField = ""
    mTitleName = "Login Options"
Else
    ErrorBox "clsComOptionsEntry_Init_#36_[Undefined Case]"
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

Public Sub GetData()
Dim mOptTitle As String, mOptValue As String
Dim tRecset As New ADODB.Recordset, acount As Integer, fhand As Integer

Me.Clear
If blnLoginOptMast = True Then
    
    If FileExist(AppOptFileFullPath) = True Then
        fhand = FreeFile
        Open AppOptFileFullPath For Input As #fhand
        Do While EOF(fhand) = False
            Input #fhand, mOptTitle, mOptValue
            mOptTitle = UCase(mOptTitle)
            Select Case mOptTitle
            Case "LOGINNAME"
                mLoginName_str = mOptValue
            Case "LOGINPWD"
                mLoginPwd_str = mOptValue
            End Select
        Loop
        Close #fhand
    End If
End If

''With tRecset
''If InList(True, Array(blnStationMast, blnAreaMast, blnVTypeMast)) = True Then
''    .Open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
''Else
''
''End If
''
''If .EOF = False Then
''    mCode_lng = .Fields(mCodeField)
''    If mNameField <> "" Then
''        mName_str = .Fields(mNameField)
''    End If
''    mRecState_int = .Fields(mRecStateField)
''    If blnStationMast = True Then
''
''    ElseIf blnAreaMast = True Then
''
''    ElseIf blnVTypeMast = True Then
''        mVtmAbvr_str = .Fields("VtmAbvr")
''        mVtmSysCode_int = .Fields("VtmSysCode")
''        mVtmPrefix_str = .Fields("VtmPrefix")
''        mVtmPostfix_str = .Fields("VtmPostfix")
''        mVtmItmNarr_str = .Fields("VtmItmNarr")
''        mVtmComNarr_str = .Fields("VtmComNarr")
''        mVtmEditable_bln = .Fields("VtmEditable")
''        mVtmStartNo_lng = .Fields("VtmStartNo")
''        mVtmResetNoBasis_int = .Fields("VtmResetNoBasis")
''        mVtmIndex_int = .Fields("VtmIndex")
''        mVtmShowInList_bln = .Fields("VtmShowInList")
''    End If
''End If
''End With
''CloseTable tRecset

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Sub

End Sub

Public Sub Clear()

If blnLoginOptMast = True Then
    mLoginName_str = ""
    mLoginPwd_str = ""

End If


'''mCode_lng = 0
'''mName_str = ""
'''mRecState_int = 0
'''If blnStationMast = True Then
'''
'''ElseIf blnAreaMast = True Then
'''
'''ElseIf blnVTypeMast = True Then
'''    mVtmAbvr_str = ""
'''    mVtmSysCode_int = 0
'''    mVtmPrefix_str = ""
'''    mVtmPostfix_str = ""
'''    mVtmItmNarr_str = ""
'''    mVtmComNarr_str = ""
'''    mVtmEditable_bln = False
'''    mVtmStartNo_lng = 0
'''    mVtmResetNoBasis_int = 0
'''    mVtmIndex_int = 0
'''    mVtmShowInList_bln = False
'''End If

End Sub

Private Sub Class_Terminate()
'If UBound(aMastTran) >= LBound(aMastTran) Then
'    ErrorBox mTitleName & " Entry in Process !!!"
'End If

End Sub

Rem mInhCode -> Inherited Code from any Other Table
'Public Function BeginMast(ByVal mCode As Long, Optional ByVal mInhCode) As Boolean
'Dim tRecset As New ADODB.Recordset
'BeginMast = False
'
'If mCode = 0 Then
'    If IsMissing(mInhCode) = False Then
'        mCode = mInhCode
'    Else
'        If InList(True, Array(blnStationMast, blnAreaMast, blnVTypeMast)) = True Then
'            mCode = GetNextSeqno(m_dbAcDatabase, mTableName, mCodeField)
'        Else
'        End If
'    End If
'    If mCode < 1 Then
'        ErrorBox mTitleName & " Entry Failed !!!"
'        Exit Function
'    End If
'ElseIf mCode > 0 Then
'    If InList(True, Array(blnStationMast, blnAreaMast, blnVTypeMast)) = True Then
'        tRecset.Open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
'    Else
'    End If
'    If tRecset.EOF = True Then
'        ErrorBox mTitleName & " Entry not Found !!!"
'        GoTo EndSub
'    End If
'    CloseTable tRecset
'Else
'    ErrorBox "Invalid " & mTitleName & " Entry !!!"
'    Exit Function
'End If
'mActiveMast = UBound(aMastTran) + 1
'ReDim Preserve aMastTran(mActiveMast)
'aMastTran(mActiveMast) = mCode
'Call Data_CreateLog(mCode)
'BeginMast = True
'
'EndSub:
'CloseTable tRecset, mCheckOpen:=True
'Exit Function
'
'End Function

'Public Function EndMast(ByVal mCode As Long) As Boolean
'Dim mCnt As Integer
'EndMast = False
'If Chk_ActiveMast() = False Or mCode <> ActiveCode Then
'    ErrorBox "No Active " & mTitleName & " Entry !!!"
'    Exit Function
'End If
'Call Data_RemoveLog(mCode)
'
'For mCnt = (mActiveMast + 1) To UBound(aMastTran)
'    If (mCnt - 1) >= LBound(aMastTran) Then
'        aMastTran(mCnt - 1) = aMastTran(mCnt)
'    End If
'Next mCnt
'If LBound(aMastTran) = UBound(aMastTran) Then
'    aMastTran = Array()
'Else
'    ReDim Preserve aMastTran(UBound(aMastTran) - 1)
'End If
'If mActiveMast > UBound(aMastTran) Then
'    mActiveMast = mActiveMast - 1
'End If
'
'EndMast = True
'End Function

'Public Property Get ActiveCode() As Long
'On Error GoTo errhand
'
'ActiveCode = aMastTran(mActiveMast)
'
'Exit Property
'
'errhand:
'ErrorBox Err.Description
'ActiveCode = -1
'Exit Property
'
'End Property

Rem update transactional sum up, physically deletes records marked for deletion or marks ok records for added or edited
'Public Function UpdateMast(ByVal mCode As Long) As Boolean
'Dim tRecset As New ADODB.Recordset
'UpdateMast = False
'
'On Error GoTo errhand
'
'Rem updating Master
'With tRecset
'If InList(True, Array(blnStationMast, blnAreaMast, blnVTypeMast)) = True Then
'    .Open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
'Else
'End If
'.ActiveConnection.BeginTrans
'If .RecordCount > 0 Then
'    If InList(.Fields(mRecStateField), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
'        .Fields(mRecStateField) = cREC_UNCHANGED
'        .Update
'    Else
'        .Fields(mRecStateField) = ChkDeleteRecStatus(.Fields(mRecStateField))
'        .Update
'        .Delete
'    End If
'End If
'.ActiveConnection.CommitTrans
'End With
'CloseTable tRecset
'
'UpdateMast = True
'Exit Function
'
'errhand:
'MsgBox Err.Description
'If InList(tRecset.EditMode, Array(adEditAdd, adEditDelete, adEditInProgress)) = True Then
'    tRecset.CancelUpdate
'    tRecset.ActiveConnection.Cancel
'End If
'
'EndSub:
'CloseTable tRecset, mCheckOpen:=True
'Exit Function
'
'End Function

Rem checks entries with log table, if log exist restores log records else delete records (assuming new records added), balance updation part not done here because master entries does not have effect while in process
'Public Function CancelMast(ByVal mCode As Long) As Boolean
'Dim tRecset As New ADODB.Recordset, LogRS As New ADODB.Recordset
'Dim mRecEdited As Boolean, mRecDeleted As Boolean
'
'CancelMast = False
'If Chk_ActiveMast() = False Or mCode <> ActiveCode Then
'    ErrorBox "No Active " & mTitleName & " Entry to Cancel !!!"
'    GoTo EndSub
'End If
''mCode = ActiveCode
'On Error GoTo errhand
'
'With tRecset
'If InList(True, Array(blnStationMast, blnAreaMast, blnVTypeMast)) = True Then
'    .Open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
'    LogRS.Open "Select * from " & mTableName & "_Log where " & mCodeField & "=" & CStr(mCode) & "", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
'Else
'End If
'.ActiveConnection.BeginTrans
'If .RecordCount > 0 Then
'    If LogRS.EOF = False Then
'        ' any prior updations can be made here
'        If mNameField <> "" Then
'            .Fields(mNameField) = LogRS.Fields(mNameField)
'        End If
'        .Fields(mRecStateField) = LogRS.Fields(mRecStateField)
'        If blnStationMast = True Then
'
'        ElseIf blnAreaMast = True Then
'
'        ElseIf blnVTypeMast = True Then
'            .Fields("VtmAbvr") = LogRS.Fields("VtmAbvr")
'            .Fields("VtmSysCode") = LogRS.Fields("VtmSysCode")
'            .Fields("VtmPrefix") = LogRS.Fields("VtmPrefix")
'            .Fields("VtmPostfix") = LogRS.Fields("VtmPostfix")
'            .Fields("VtmItmNarr") = LogRS.Fields("VtmItmNarr")
'            .Fields("VtmComNarr") = LogRS.Fields("VtmComNarr")
'            .Fields("VtmEditable") = LogRS.Fields("VtmEditable")
'            .Fields("VtmStartNo") = LogRS.Fields("VtmStartNo")
'            .Fields("VtmResetNoBasis") = LogRS.Fields("VtmResetNoBasis")
'            .Fields("VtmIndex") = LogRS.Fields("VtmIndex")
'            .Fields("VtmShowInList") = LogRS.Fields("VtmShowInList")
'        End If
'        .Update
'    Else
'        ' any prior updations can be made here
'        .Fields(mRecStateField) = ChkDeleteRecStatus(.Fields(mRecStateField))
'        .Update
'        .Delete
'    End If
'End If
'.ActiveConnection.CommitTrans
'End With
'CloseTable tRecset
'CloseTable LogRS
'
'CancelMast = True
'GoTo EndSub
'
'errhand:
'MsgBox Err.Description
'If InList(tRecset.EditMode, Array(adEditAdd, adEditDelete, adEditInProgress)) = True Then
'    tRecset.CancelUpdate
'    tRecset.ActiveConnection.Cancel
'End If
'
'EndSub:
'CloseTable tRecset, mCheckOpen:=True
'CloseTable LogRS, mCheckOpen:=True
'Exit Function
'
'End Function

Rem marking records for deletion
'Public Function DeleteMast(ByVal mCode As Long) As Boolean
'Dim tRecset As New ADODB.Recordset
'DeleteMast = False
'If Chk_ActiveMast() = False Or mCode <> ActiveCode Then
'    ErrorBox "No Active " & mTitleName & " Entry to Delete !!!"
'    GoTo EndSub
'End If
'On Error GoTo errhand
'
'With tRecset
'If InList(True, Array(blnStationMast, blnAreaMast, blnVTypeMast)) = True Then
'    .Open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
'Else
'End If
'.ActiveConnection.BeginTrans
'If .RecordCount > 0 Then
'    .Fields(mRecStateField) = ChkDeleteRecStatus(.Fields(mRecStateField))
'    .Update
'Else
'    ErrorBox "clsComMastEntry_DeleteMast_254"
'End If
'.ActiveConnection.CommitTrans
'End With
'CloseTable tRecset
'
'DeleteMast = True
'GoTo EndSub
'
'errhand:
'MsgBox Err.Description
'If InList(tRecset.EditMode, Array(adEditAdd, adEditDelete, adEditInProgress)) = True Then
'    tRecset.CancelUpdate
'    tRecset.ActiveConnection.Cancel
'End If
'
'EndSub:
'CloseTable tRecset, mCheckOpen:=True
'Exit Function
'
'End Function

'Public Function SelectMast(ByVal mCode As Long) As Boolean
'Dim mEntryFound As Boolean
'SelectMast = False
'If mCode < 1 Then
'    ErrorBox "Invalid " & mTitleName & " Entry !!!"
'    Exit Function
'End If
'mEntryFound = False
'For mActiveMast = LBound(aMastTran) To UBound(aMastTran)
'    If aMastTran(mActiveMast) = mCode Then
'        mEntryFound = True
'        Exit For
'    End If
'Next mActiveMast
'If mEntryFound = False Then
'    mActiveMast = UBound(aMastTran) + 1
'End If
'
'SelectMast = True
'End Function
'
'Public Function NextMast() As Boolean
'NextMast = False
'If EOMast = True Then
'    ErrorBox "End of " & mTitleName & " Entry !!!"
'    Exit Function
'End If
'mActiveMast = mActiveMast + 1
'
'NextMast = True
'End Function
'
'Public Function PreviousMast()
'PreviousMast = False
'If BOMast = True Then
'    ErrorBox "Begining of " & mTitleName & " Entry !!!"
'    Exit Function
'End If
'mActiveMast = mActiveMast - 1
'
'PreviousMast = True
'End Function
'
'Public Function FirstMast() As Boolean
'FirstMast = False
'If CountMast = 0 Then
'    ErrorBox "No " & mTitleName & " Entry !!!"
'    Exit Function
'End If
'mActiveMast = LBound(aMastTran)
'
'FirstMast = True
'
'End Function
'
'Public Function LastMast() As Boolean
'LastMast = False
'If CountMast = 0 Then
'    ErrorBox "No " & mTitleName & " Entry !!!"
'    Exit Function
'End If
'mActiveMast = UBound(aMastTran)
'
'LastMast = True
'
'End Function
'
'Public Property Get CountMast() As Integer
'If UBound(aMastTran) = -1 Then
'    CountMast = 0
'Else
'    CountMast = UBound(aMastTran) - LBound(aMastTran) + 1
'End If
'
'End Property
'
'Public Property Get EOMast() As Boolean
'EOMast = (mActiveMast > UBound(aMastTran) Or UBound(aMastTran) = -1)
'
'End Property
'
'Public Property Get BOMast() As Boolean
'BOMast = (mActiveMast < LBound(aMastTran) Or UBound(aMastTran) = -1)
'
'End Property
'
'Public Function Chk_ActiveMast() As Boolean
'If BOMast = False And EOMast = False Then
'    Chk_ActiveMast = True
'Else
'    Chk_ActiveMast = False
'End If
'
'End Function
'
'Private Function Data_CreateLog(ByVal mCode As Long) As Boolean
'Dim LogRS As New ADODB.Recordset
'Data_CreateLog = False
'
'If Chk_ActiveMast() = False Or mCode <> ActiveCode Then
'    ErrorBox "No Active " & mTitleName & " Entry to Create Log !!!"
'    GoTo EndSub
'End If
'
'With LogRS
'If InList(True, Array(blnStationMast, blnAreaMast, blnVTypeMast)) = True Then
'    .Open "Select * from " & mTableName & "_Log where " & mCodeField & "=" & CStr(mCode) & "", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
'Else
'End If
'If .EOF = True Then
'    .ActiveConnection.BeginTrans
'    .ActiveConnection.Execute "Insert into " & mTableName & "_Log" & " Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & ""
'    .ActiveConnection.CommitTrans
'Else
'    AlertBox "Unsaved " & mTitleName & " Entry !!!"
'End If
'End With
'CloseTable LogRS
'
'Data_CreateLog = True
'
'EndSub:
'Set LogRS = Nothing
'Exit Function
'
'End Function
'
'Private Function Data_RemoveLog(ByVal mCode As Long) As Boolean
'Data_RemoveLog = False
'If Chk_ActiveMast() = False Or mCode <> ActiveCode Then
'    ErrorBox "No Active " & mTitleName & " Entry to Remove Log !!!"
'    Exit Function
'End If
'If InList(True, Array(blnStationMast, blnAreaMast, blnVTypeMast)) = True Then
'    m_dbAcDatabase.BeginTrans
'    m_dbAcDatabase.Execute "Delete from " & mTableName & "_Log" & " where " & mCodeField & "=" & CStr(mCode)
'    m_dbAcDatabase.CommitTrans
'Else
'End If
'
'Data_RemoveLog = True
'
'End Function

'Public Sub AddNew(Optional ByVal mInhCode)
'Dim tRecset As New ADODB.Recordset, mCanAddNew As Boolean, mLCount As Integer, mUCount As Integer, acount As Integer
'mCanAddNew = True
'
'If mNameField <> "" Then
'    If InList(True, Array(blnStationMast, blnAreaMast, blnVTypeMast)) = True Then
'        tRecset.Open "Select " & mNameField & " from " & mTableName & " where " & mNameField & "='" & mName_str & "'", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
'    Else
'    End If
'    If tRecset.EOF = False Then
'        mCanAddNew = False
'        ErrorBox "Duplicate Name !!!"
'    End If
'    CloseTable tRecset
'End If
'
'On Error GoTo errhand
'mCode_lng = 0
'If mCanAddNew = True Then
'    With tRecset
'    If InList(True, Array(blnStationMast, blnAreaMast, blnVTypeMast)) = True Then
'        .Open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(-0.1) & "", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
'    Else
'    End If
'    .ActiveConnection.BeginTrans
'
'    .AddNew
'    If IsMissing(mInhCode) = False Then
'        .Fields(mCodeField) = mInhCode
'    Else
'        Rem .Fields(mCodeField) = mCode_lng
'    End If
'    If mNameField <> "" Then
'        .Fields(mNameField) = mName_str
'    End If
'    .Fields(mRecStateField) = ChkEditRecStatus(.Fields(mRecStateField))
'    If blnStationMast = True Then
'
'    ElseIf blnAreaMast = True Then
'
'    ElseIf blnVTypeMast = True Then
'        .Fields("VtmAbvr") = mVtmAbvr_str
'        .Fields("VtmSysCode") = mVtmSysCode_int
'        .Fields("VtmPrefix") = mVtmPrefix_str
'        .Fields("VtmPostfix") = mVtmPostfix_str
'        .Fields("VtmItmNarr") = mVtmItmNarr_str
'        .Fields("VtmComNarr") = mVtmComNarr_str
'        .Fields("VtmEditable") = mVtmEditable_bln
'        .Fields("VtmStartNo") = mVtmStartNo_lng
'        .Fields("VtmResetNoBasis") = mVtmResetNoBasis_int
'        .Fields("VtmIndex") = mVtmIndex_int
'        .Fields("VtmShowInList") = mVtmShowInList_bln
'    End If
'
'    .Update
'    mCode_lng = .Fields(mCodeField)
'    aMastTran(mActiveMast) = mCode_lng
'    .ActiveConnection.CommitTrans
'    End With
'    CloseTable tRecset
'
'End If
'GoTo EndSub
'
'errhand:
'MsgBox Err.Description
'If InList(tRecset.EditMode, Array(adEditAdd, adEditDelete, adEditInProgress)) = True Then
'    tRecset.CancelUpdate
'    tRecset.ActiveConnection.Cancel
'End If
'
'EndSub:
'CloseTable tRecset, mCheckOpen:=True
'Exit Sub
'
'End Sub

Public Sub Update(ByVal mCode As Long)
'Dim tRecset As New ADODB.Recordset, mCanUpdate As Boolean, mLCount As Integer, mUCount As Integer, acount As Integer
'mCanUpdate = True

'If mNameField <> "" Then
'    If InList(True, Array(blnStationMast, blnAreaMast, blnVTypeMast)) = True Then
'        tRecset.Open "Select " & mNameField & " from " & mTableName & " where " & mNameField & "='" & mName_str & "' and " & mCodeField & "<>" & CStr(mCode) & "", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
'    Else
'    End If
'    If tRecset.EOF = False Then
'        mCanUpdate = False
'        ErrorBox "Duplicate Name !!!"
'    End If
'    CloseTable tRecset
'End If
'
'On Error GoTo errhand
'mCode_lng = 0
'If mCanUpdate = True Then
'    With tRecset
'    If InList(True, Array(blnStationMast, blnAreaMast, blnVTypeMast)) = True Then
'        .Open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
'    Else
'    End If
'    .ActiveConnection.BeginTrans
'
'    If mNameField <> "" Then
'        .Fields(mNameField) = mName_str
'    End If
'    .Fields(mRecStateField) = ChkEditRecStatus(.Fields(mRecStateField))
'    If blnStationMast = True Then
'
'    ElseIf blnAreaMast = True Then
'
'    ElseIf blnVTypeMast = True Then
'        .Fields("VtmAbvr") = mVtmAbvr_str
'        .Fields("VtmSysCode") = mVtmSysCode_int
'        .Fields("VtmPrefix") = mVtmPrefix_str
'        .Fields("VtmPostfix") = mVtmPostfix_str
'        .Fields("VtmItmNarr") = mVtmItmNarr_str
'        .Fields("VtmComNarr") = mVtmComNarr_str
'        .Fields("VtmEditable") = mVtmEditable_bln
'        .Fields("VtmStartNo") = mVtmStartNo_lng
'        .Fields("VtmResetNoBasis") = mVtmResetNoBasis_int
'        .Fields("VtmIndex") = mVtmIndex_int
'        .Fields("VtmShowInList") = mVtmShowInList_bln
'    End If
'
'    .Update
'    mCode_lng = .Fields(mCodeField)
'    .ActiveConnection.CommitTrans
'    End With
'    CloseTable tRecset
'
'End If
GoTo EndSub

errhand:
MsgBox Err.Description

EndSub:
Exit Sub

End Sub

Public Function UpdateLoginOpt() As Boolean
Dim fhand As Integer
Dim mOptTitle As String, mOptValue As String

UpdateLoginOpt = False
On Error GoTo errhand

fhand = FreeFile
Open AppOptFileFullPath For Output As #fhand

mOptTitle = "LoginName": mOptValue = mLoginName_str
Write #fhand, mOptTitle, mOptValue

mOptTitle = "LoginPwd": mOptValue = mLoginPwd_str
Write #fhand, mOptTitle, mOptValue

Close #fhand

UpdateLoginOpt = True
GoTo EndSub

errhand:
MsgBox Err.Description

EndSub:
Exit Function

End Function

'Public Function CanDeleteMast(ByVal mCode As Long, Optional ByVal mSkipConfirm As Boolean) As Boolean
'Dim mDeleteit As Boolean
'
'mDeleteit = True
'
'If ChkEntryExist(mCode, mExcludeOpn:=True) = True Then
'    ErrorBox "Entry Exist !!!"
'    mDeleteit = False
'End If
'If mDeleteit = True And mSkipConfirm = False Then
'    mDeleteit = CanDelete()
'End If
'
'CanDeleteMast = mDeleteit
'
'End Function

Rem returns item name for either item code or item reference
'Public Function GetName(ByVal mCode As Long) As String
'Dim tRecset As New ADODB.Recordset, mRtnval As String
'
'mRtnval = ""
'With tRecset
'If InList(True, Array(blnStationMast, blnAreaMast, blnVTypeMast)) = True Then
'    .Open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
'Else
'End If
'If .RecordCount > 0 Then
'    mRtnval = .Fields(mNameField)
'End If
'End With
'CloseTable tRecset
'
'GetName = mRtnval
'
'End Function

'Public Function ChkEntryExist(ByVal mCode As Long, Optional ByVal mExcludeOpn As Boolean = False) As Boolean
'Dim tRecset As New ADODB.Recordset, mRtnval As Boolean
'
'If blnStationMast = True Then
'    MsgBox "ChkEntryExist Pending !!!"
'ElseIf blnAreaMast = True Then
'    MsgBox "ChkEntryExist Pending !!!"
''''    With tRecset
''''    .Open "Select * from Attendance where AtdDsgCode=" & CStr(mCode) & "", m_dbAcDatabase, adOpenKeyset, adLockReadOnly
''''    mRtnval = (.RecordCount > 0)
''''    End With
''''    CloseTable tRecset
''''
''''    If mRtnval = False Then
''''        With tRecset
''''        .Open "Select * from EmpMast where EmpDsgCode=" & CStr(mCode) & "", m_dbAcDatabase, adOpenKeyset, adLockReadOnly
''''        mRtnval = (.RecordCount > 0)
''''        End With
''''        CloseTable tRecset
''''    End If
'ElseIf blnVTypeMast = True Then
'    MsgBox "ChkEntryExist Pending !!!"
'End If
'
'ChkEntryExist = mRtnval
'
'EndSub:
'CloseTable tRecset, mCheckOpen:=True
'Exit Function
'
'End Function

