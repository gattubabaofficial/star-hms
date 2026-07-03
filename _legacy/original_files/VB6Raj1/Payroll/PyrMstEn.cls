VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsPayrollMasterEntry"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Dim mCrashedEntry As Boolean
Dim m_dbPyrDatabase As ADODB.Connection, m_dbAcDatabase As ADODB.Connection
Dim mTableName As String, mCodeField As String, mNameField As String, mRecStateField As String, mTitleName As String
Public blnEmployeeMast As Boolean, blnDepartmentMast As Boolean, blnDesignationMast As Boolean, blnHolidayMast As Boolean, blnHolidayGrant As Boolean
Public mCode_lng As Long, mName_str As String, mRecState_int As Integer
Public mEmpAhCode_lng As Long, mEmpDptCode_lng As Long, mEmpDsgCode_lng As Long, mEmpJoinDate_dt As Date, mEmpBSalary_dbl As Double, mEmpHRAPer_dbl As Double, mEmpHRAAmt_dbl As Double, mEmpDAPer_dbl As Double, mEmpDAAmt_dbl As Double, mEmpSelfPFPer_dbl As Double, mEmpSelfPFAmt_dbl As Double, mEmpCoPFPer_dbl As Double, mEmpCoPFAmt_dbl As Double, mEmpSelfESICPer_dbl As Double, mEmpSelfESICAmt_dbl As Double, mEmpNSalary_dbl As Double, mEmpWrkTime_str As String, mEmpWrkTime_lng As Long, mEmpHalfDayTime_str As String, mEmpHalfDayTime_lng As Long, mEmpMinWrkTime_str As String, mEmpMinWrkTime_lng As Long, mEmpAddOT_bln As Boolean, mEmpCutUT_bln As Boolean, mEmpMnLeaves_dbl As Double, mEmpYrLeaves_dbl As Double, mEmpWeeklyOff_int As Integer, mEmpWeeklyOff_str As String, mEmpJobState_int As Integer, mEmpJobState_str As String, mEmpSftCode_int As Integer, mEmpSftCode_str As String
Public mAhCode_lng As Long, mAhName_str As String
Public mHlmDate_dt As Date, mHlmRemark_str As String
Public mHlgHlmCode_lng As Long, mHlgDate_dt As Date, mHlgEmpCode_lng As Long, mHlgDptCode_lng As Long, mHlgDsgCode_lng As Long, mHlgAlwState_int As Integer, mHlgRemark_str As String

Dim mActiveMast As Integer, aMastTran() As Variant

Public Sub Init()
If blnEmployeeMast = True Then
    mTableName = "EmpMast"
    mCodeField = "EmpCode"
    mNameField = "EmpName"
    mRecStateField = "EmpRecState"
    mTitleName = "Employee Master"
    
ElseIf blnDepartmentMast = True Then
    mTableName = "DeptMast"
    mCodeField = "DptCode"
    mNameField = "DptName"
    mRecStateField = "DptRecState"
    mTitleName = "Department Master"
    
ElseIf blnDesignationMast = True Then
    mTableName = "DesgMast"
    mCodeField = "DsgCode"
    mNameField = "DsgName"
    mRecStateField = "DsgRecState"
    mTitleName = "Designation Master"
    
ElseIf blnHolidayMast = True Then
    mTableName = "HoliMast"
    mCodeField = "HlmCode"
    mNameField = "HlmName"
    mRecStateField = "HlmRecState"
    mTitleName = "Holiday Master"
    
ElseIf blnHolidayGrant = True Then
    mTableName = "HoliGrant"
    mCodeField = "HlgCode"
    mNameField = ""
    mRecStateField = "HlgRecState"
    mTitleName = "Holiday Grant"
    
Else
    ErrorBox "clsPayrollMasterEntry_Init_#51_[Undefined Case]"
End If

End Sub

Public Property Set dbPyrDatabase(ByRef db As ADODB.Connection)
Set m_dbPyrDatabase = db

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
.open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbPyrDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    mCode_lng = .fields(mCodeField)
    If mNameField <> "" Then
        mName_str = .fields(mNameField)
    End If
    mRecState_int = .fields(mRecStateField)
    If blnEmployeeMast = True Then
        mEmpAhCode_lng = .fields("EmpAhCode")
        mEmpDptCode_lng = .fields("EmpDptCode")
        mEmpDsgCode_lng = .fields("EmpDsgCode")
        mEmpJoinDate_dt = .fields("EmpJoinDate")
        mEmpBSalary_dbl = .fields("EmpBSalary")
        mEmpHRAPer_dbl = .fields("EmpHRAPer")
        mEmpHRAAmt_dbl = .fields("EmpHRAAmt")
        mEmpDAPer_dbl = .fields("EmpDAPer")
        mEmpDAAmt_dbl = .fields("EmpDAAmt")
        mEmpSelfPFPer_dbl = .fields("EmpSelfPFPer")
        mEmpSelfPFAmt_dbl = .fields("EmpSelfPFAmt")
        mEmpCoPFPer_dbl = .fields("EmpCoPFPer")
        mEmpCoPFAmt_dbl = .fields("EmpCoPFAmt")
        mEmpSelfESICPer_dbl = .fields("EmpSelfESICPer")
        mEmpSelfESICAmt_dbl = .fields("EmpSelfESICAmt")
        mEmpNSalary_dbl = .fields("EmpNSalary")
        mEmpWrkTime_lng = .fields("EmpWrkTime")
        mEmpWrkTime_str = MinToTime(.fields("EmpWrkTime"))
        mEmpHalfDayTime_lng = .fields("EmpHalfDayTime")
        mEmpHalfDayTime_str = MinToTime(.fields("EmpHalfDayTime"))
        mEmpMinWrkTime_lng = .fields("EmpMinWrkTime")
        mEmpMinWrkTime_str = MinToTime(.fields("EmpMinWrkTime"))
        mEmpAddOT_bln = (.fields("EmpAddOT") = -1)
        mEmpCutUT_bln = (.fields("EmpCutUT") = -1)
        mEmpMnLeaves_dbl = .fields("EmpMnLeaves")
        mEmpYrLeaves_dbl = .fields("EmpYrLeaves")
        mEmpWeeklyOff_int = .fields("EmpWeeklyOff")
        mEmpWeeklyOff_str = GetMidPosStr(cATNDWOFF_LIST, .fields("EmpWeeklyOff"), ",")
        mEmpJobState_int = .fields("EmpJobState")
        mEmpJobState_str = GetMidPosStr(cATNDJSTAT_LIST, .fields("EmpJobState"), ",")
        mEmpSftCode_int = .fields("EmpSftCode")
        mEmpSftCode_str = GetMidPosStr(cATNDSFT_LIST, .fields("EmpSftCode"), ",")
        
        t1Recset.open "Select * from AchdMast where AhCode=" & CStr(mEmpAhCode_lng) & "", m_dbAcDatabase, adOpenKeyset, adLockOptimistic
        If t1Recset.EOF = False Then
            mAhCode_lng = t1Recset.fields("AhCode")
            mAhName_str = t1Recset.fields("AhName")
        End If
        CloseTable t1Recset
    ElseIf blnDepartmentMast = True Then
    
    ElseIf blnDesignationMast = True Then
    
    ElseIf blnHolidayMast = True Then
        mHlmDate_dt = .fields("HlmDate")
        mHlmRemark_str = .fields("HlmRemark")
    ElseIf blnHolidayGrant = True Then
        mHlgHlmCode_lng = .fields("HlgHlmCode")
        mHlgDate_dt = .fields("HlgDate")
        mHlgEmpCode_lng = .fields("HlgEmpCode")
        mHlgDptCode_lng = .fields("HlgDptCode")
        mHlgDsgCode_lng = .fields("HlgDsgCode")
        mHlgAlwState_int = .fields("HlgAlwState")
        mHlgRemark_str = .fields("HlgRemark")
    
    End If
End If
End With
CloseTable tRecset

EndSub:
Set tRecset = Nothing
Set t1Recset = Nothing
Exit Sub

End Sub

Public Sub Clear()
mCode_lng = 0
mName_str = ""
mRecState_int = 0
If blnEmployeeMast = True Then
    mEmpAhCode_lng = 0
    mEmpDptCode_lng = 0
    mEmpDsgCode_lng = 0
    mEmpJoinDate_dt = cUNKNOWNDATE
    mEmpBSalary_dbl = 0
    mEmpHRAPer_dbl = 0
    mEmpHRAAmt_dbl = 0
    mEmpDAPer_dbl = 0
    mEmpDAAmt_dbl = 0
    mEmpSelfPFPer_dbl = 0
    mEmpSelfPFAmt_dbl = 0
    mEmpCoPFPer_dbl = 0
    mEmpCoPFAmt_dbl = 0
    mEmpSelfESICPer_dbl = 0
    mEmpSelfESICAmt_dbl = 0
    mEmpNSalary_dbl = 0
    mEmpWrkTime_lng = 0
    mEmpWrkTime_str = MinToTime(0)
    mEmpHalfDayTime_lng = 0
    mEmpHalfDayTime_str = MinToTime(0)
    mEmpMinWrkTime_lng = 0
    mEmpMinWrkTime_str = MinToTime(0)
    mEmpAddOT_bln = False
    mEmpCutUT_bln = False
    mEmpMnLeaves_dbl = 0
    mEmpYrLeaves_dbl = 0
    mEmpWeeklyOff_int = 0
    mEmpWeeklyOff_str = ""
    mEmpJobState_int = 0
    mEmpJobState_str = ""
    mEmpSftCode_int = 0
    mEmpSftCode_str = ""
    
    mAhCode_lng = 0
    mAhName_str = ""
ElseIf blnDepartmentMast = True Then

ElseIf blnDesignationMast = True Then

ElseIf blnHolidayMast = True Then
    mHlmDate_dt = cUNKNOWNDATE
    mHlmRemark_str = ""
ElseIf blnHolidayGrant = True Then
    mHlgHlmCode_lng = 0
    mHlgDate_dt = cUNKNOWNDATE
    mHlgEmpCode_lng = 0
    mHlgDptCode_lng = 0
    mHlgDsgCode_lng = 0
    mHlgAlwState_int = 0
    mHlgRemark_str = ""

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
        mCode = GetNextSeqno(m_dbPyrDatabase, mTableName, mCodeField)
    End If
    If mCode < 1 Then
        ErrorBox mTitleName & " Entry Failed !!!"
        Exit Function
    End If
ElseIf mCode > 0 Then
    tRecset.open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbPyrDatabase, adOpenKeyset, adLockOptimistic
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
Set tRecset = Nothing
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

m_dbPyrDatabase.BeginTrans
Rem updating Master
With tRecset
.open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbPyrDatabase, adOpenKeyset, adLockOptimistic
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
m_dbPyrDatabase.CommitTrans
CloseTable tRecset

UpdateMast = True
mCrashedEntry = False

Exit Function
errhand:
MsgBox Err.Description
m_dbPyrDatabase.Cancel
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

m_dbPyrDatabase.BeginTrans
With tRecset
.open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbPyrDatabase, adOpenKeyset, adLockOptimistic
LogRS.open "Select * from " & mTableName & "_Log where " & mCodeField & "=" & CStr(mCode) & "", m_dbPyrDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    If LogRS.EOF = False Then
        ' any prior updations can be made here
        If mNameField <> "" Then
            .fields(mNameField) = LogRS.fields(mNameField)
        End If
        .fields(mRecStateField) = LogRS.fields(mRecStateField)
        If blnEmployeeMast = True Then
            .fields("EmpAhCode") = LogRS.fields("EmpAhCode")
            .fields("EmpDptCode") = LogRS.fields("EmpDptCode")
            .fields("EmpDsgCode") = LogRS.fields("EmpDsgCode")
            .fields("EmpJoinDate") = LogRS.fields("EmpJoinDate")
            .fields("EmpBSalary") = LogRS.fields("EmpBSalary")
            .fields("EmpHRAPer") = LogRS.fields("EmpHRAPer")
            .fields("EmpHRAAmt") = LogRS.fields("EmpHRAAmt")
            .fields("EmpDAPer") = LogRS.fields("EmpDAPer")
            .fields("EmpDAAmt") = LogRS.fields("EmpDAAmt")
            .fields("EmpSelfPFPer") = LogRS.fields("EmpSelfPFPer")
            .fields("EmpSelfPFAmt") = LogRS.fields("EmpSelfPFAmt")
            .fields("EmpCoPFPer") = LogRS.fields("EmpCoPFPer")
            .fields("EmpCoPFAmt") = LogRS.fields("EmpCoPFAmt")
            .fields("EmpSelfESICPer") = LogRS.fields("EmpSelfESICPer")
            .fields("EmpSelfESICAmt") = LogRS.fields("EmpSelfESICAmt")
            .fields("EmpNSalary") = LogRS.fields("EmpNSalary")
            .fields("EmpWrkTime") = LogRS.fields("EmpWrkTime")
            .fields("EmpHalfDayTime") = LogRS.fields("EmpHalfDayTime")
            .fields("EmpMinWrkTime") = LogRS.fields("EmpMinWrkTime")
            .fields("EmpAddOT") = LogRS.fields("EmpAddOT")
            .fields("EmpCutUT") = LogRS.fields("EmpCutUT")
            .fields("EmpMnLeaves") = LogRS.fields("EmpMnLeaves")
            .fields("EmpYrLeaves") = LogRS.fields("EmpYrLeaves")
            .fields("EmpWeeklyOff") = LogRS.fields("EmpWeeklyOff")
            .fields("EmpJobState") = LogRS.fields("EmpJobState")
            .fields("EmpSftCode") = LogRS.fields("EmpSftCode")
        
        ElseIf blnDepartmentMast = True Then
        
        ElseIf blnDesignationMast = True Then
        
        ElseIf blnHolidayMast = True Then
            .fields("HlmDate") = LogRS.fields("HlmDate")
            .fields("HlmRemark") = LogRS.fields("HlmRemark")
            
        ElseIf blnHolidayGrant = True Then
            .fields("HlgHlmCode") = LogRS.fields("HlgHlmCode")
            .fields("HlgDate") = LogRS.fields("HlgDate")
            .fields("HlgEmpCode") = LogRS.fields("HlgEmpCode")
            .fields("HlgDptCode") = LogRS.fields("HlgDptCode")
            .fields("HlgDsgCode") = LogRS.fields("HlgDsgCode")
            .fields("HlgAlwState") = LogRS.fields("HlgAlwState")
            .fields("HlgRemark") = LogRS.fields("HlgRemark")
        
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
m_dbPyrDatabase.CommitTrans
CloseTable tRecset
CloseTable LogRS

CancelMast = True
GoTo EndSub
Exit Function

errhand:
MsgBox Err.Description
m_dbPyrDatabase.Cancel

EndSub:
Set tRecset = Nothing
Set LogRS = Nothing
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

m_dbPyrDatabase.BeginTrans
With tRecset
.open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbPyrDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    .fields(mRecStateField) = ChkDeleteRecStatus(.fields(mRecStateField))
    .Update
Else
    ErrorBox "clsPayrollMasterEntry_DeleteMast_254"
End If
End With
m_dbPyrDatabase.CommitTrans
CloseTable tRecset

DeleteMast = True
GoTo EndSub
Exit Function

errhand:
MsgBox Err.Description
m_dbPyrDatabase.Cancel

EndSub:
Set tRecset = Nothing
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
.open "Select * from " & mTableName & "_Log where " & mCodeField & "=" & CStr(mCode) & "", m_dbPyrDatabase, adOpenKeyset, adLockOptimistic
If .EOF = True Then
    m_dbPyrDatabase.BeginTrans
    m_dbPyrDatabase.Execute "Insert into " & mTableName & "_Log" & " Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & ""
    m_dbPyrDatabase.CommitTrans
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

m_dbPyrDatabase.BeginTrans
m_dbPyrDatabase.Execute "Delete from " & mTableName & "_Log" & " where " & mCodeField & "=" & CStr(mCode)
m_dbPyrDatabase.CommitTrans

Data_RemoveLog = True

End Function

Public Sub AddNew(Optional ByVal mInhCode)
Dim tRecset As New ADODB.Recordset, mCanAddNew As Boolean, mLCount As Integer, mUCount As Integer, acount As Integer
mCanAddNew = True

Rem If blnEmployeeMast = False And IsMissing(mInhCode) = False Then
Rem     ErrorBox "clsPayrollMasterEntry_AddNew#605_Unexpected"
Rem     mCanAddNew = False
Rem End If
If IsMissing(mInhCode) = False Then
    ErrorBox "clsPayrollMasterEntry_AddNew#605_Unexpected"
    mCanAddNew = False
End If

If mNameField <> "" Then
    tRecset.open "Select " & mNameField & " from " & mTableName & " where " & mNameField & "='" & mName_str & "'", m_dbPyrDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.EOF = False Then
        mCanAddNew = False
        ErrorBox "Duplicate Name !!!"
    End If
    CloseTable tRecset
End If
If blnHolidayGrant = True Then
    tRecset.open "Select * from HoliGrant where HlgDate=#" & CStr(ToSysDate(mHlgDate_dt)) & "#" & IIf(mHlgEmpCode_lng > 0, " and HlgEmpCode=" & CStr(mHlgEmpCode_lng), "") & IIf(mHlgDptCode_lng > 0, " and HlgDptCode=" & CStr(mHlgDptCode_lng), "") & IIf(mHlgDsgCode_lng > 0, " and HlgDsgCode=" & CStr(mHlgDsgCode_lng), "") & " and HlgCode<>" & CStr(0) & "", m_dbPyrDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.EOF = False Then
        mCanAddNew = False
        ErrorBox "Duplicate Entry !!!"
    End If
    CloseTable tRecset
End If

On Error GoTo errhand
mCode_lng = 0
If mCanAddNew = True Then
    m_dbPyrDatabase.BeginTrans
    With tRecset
    .open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(-0.1) & "", m_dbPyrDatabase, adOpenKeyset, adLockOptimistic
    
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
    If blnEmployeeMast = True Then
        .fields("EmpAhCode") = mEmpAhCode_lng
        .fields("EmpDptCode") = mEmpDptCode_lng
        .fields("EmpDsgCode") = mEmpDsgCode_lng
        .fields("EmpJoinDate") = mEmpJoinDate_dt
        .fields("EmpBSalary") = mEmpBSalary_dbl
        .fields("EmpHRAPer") = mEmpHRAPer_dbl
        .fields("EmpHRAAmt") = mEmpHRAAmt_dbl
        .fields("EmpDAPer") = mEmpDAPer_dbl
        .fields("EmpDAAmt") = mEmpDAAmt_dbl
        .fields("EmpSelfPFPer") = mEmpSelfPFPer_dbl
        .fields("EmpSelfPFAmt") = mEmpSelfPFAmt_dbl
        .fields("EmpCoPFPer") = mEmpCoPFPer_dbl
        .fields("EmpCoPFAmt") = mEmpCoPFAmt_dbl
        .fields("EmpSelfESICPer") = mEmpSelfESICPer_dbl
        .fields("EmpSelfESICAmt") = mEmpSelfESICAmt_dbl
        .fields("EmpNSalary") = mEmpNSalary_dbl
        .fields("EmpWrkTime") = mEmpWrkTime_lng
        .fields("EmpHalfDayTime") = mEmpHalfDayTime_lng
        .fields("EmpMinWrkTime") = mEmpMinWrkTime_lng
        .fields("EmpAddOT") = IIf(mEmpAddOT_bln = True, -1, 0)
        .fields("EmpCutUT") = IIf(mEmpCutUT_bln = True, -1, 0)
        .fields("EmpMnLeaves") = mEmpMnLeaves_dbl
        .fields("EmpYrLeaves") = mEmpYrLeaves_dbl
        .fields("EmpWeeklyOff") = mEmpWeeklyOff_int
        .fields("EmpJobState") = mEmpJobState_int
        .fields("EmpSftCode") = mEmpSftCode_int
        
    ElseIf blnDepartmentMast = True Then
    
    ElseIf blnDesignationMast = True Then
    
    ElseIf blnHolidayMast = True Then
        .fields("HlmDate") = mHlmDate_dt
        .fields("HlmRemark") = mHlmRemark_str
        
    ElseIf blnHolidayGrant = True Then
        .fields("HlgHlmCode") = mHlgHlmCode_lng
        .fields("HlgDate") = mHlgDate_dt
        .fields("HlgEmpCode") = mHlgEmpCode_lng
        .fields("HlgDptCode") = mHlgDptCode_lng
        .fields("HlgDsgCode") = mHlgDsgCode_lng
        .fields("HlgAlwState") = mHlgAlwState_int
        .fields("HlgRemark") = mHlgRemark_str
        
    End If
    
    .Update
    mCode_lng = .fields(mCodeField)
    aMastTran(mActiveMast) = mCode_lng
    End With
    m_dbPyrDatabase.CommitTrans
    CloseTable tRecset
    
End If

GoTo EndSub
Exit Sub

errhand:
MsgBox Err.Description
m_dbPyrDatabase.Cancel

EndSub:
Set tRecset = Nothing
Exit Sub

End Sub

Public Sub Update(ByVal mCode As Long)
Dim tRecset As New ADODB.Recordset, mCanUpdate As Boolean, mLCount As Integer, mUCount As Integer, acount As Integer
mCanUpdate = True

If mNameField <> "" Then
    tRecset.open "Select " & mNameField & " from " & mTableName & " where " & mNameField & "='" & mName_str & "' and " & mCodeField & "<>" & CStr(mCode) & "", m_dbPyrDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.EOF = False Then
        mCanUpdate = False
        ErrorBox "Duplicate Name !!!"
    End If
    CloseTable tRecset
End If
If blnHolidayGrant = True Then
    tRecset.open "Select * from HoliGrant where HlgDate=#" & CStr(ToSysDate(mHlgDate_dt)) & "#" & IIf(mHlgEmpCode_lng > 0, " and HlgEmpCode=" & CStr(mHlgEmpCode_lng), "") & IIf(mHlgDptCode_lng > 0, " and HlgDptCode=" & CStr(mHlgDptCode_lng), "") & IIf(mHlgDsgCode_lng > 0, " and HlgDsgCode=" & CStr(mHlgDsgCode_lng), "") & " and HlgCode<>" & CStr(mCode) & "", m_dbPyrDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.EOF = False Then
        mCanUpdate = False
        ErrorBox "Duplicate Entry !!!"
    End If
    CloseTable tRecset
End If

On Error GoTo errhand
mCode_lng = 0
If mCanUpdate = True Then
    m_dbPyrDatabase.BeginTrans
    With tRecset
    .open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbPyrDatabase, adOpenKeyset, adLockOptimistic
    
    If mNameField <> "" Then
        .fields(mNameField) = mName_str
    End If
    .fields(mRecStateField) = ChkEditRecStatus(.fields(mRecStateField))
    If blnEmployeeMast = True Then
        .fields("EmpAhCode") = mEmpAhCode_lng
        .fields("EmpDptCode") = mEmpDptCode_lng
        .fields("EmpDsgCode") = mEmpDsgCode_lng
        .fields("EmpJoinDate") = mEmpJoinDate_dt
        .fields("EmpBSalary") = mEmpBSalary_dbl
        .fields("EmpHRAPer") = mEmpHRAPer_dbl
        .fields("EmpHRAAmt") = mEmpHRAAmt_dbl
        .fields("EmpDAPer") = mEmpDAPer_dbl
        .fields("EmpDAAmt") = mEmpDAAmt_dbl
        .fields("EmpSelfPFPer") = mEmpSelfPFPer_dbl
        .fields("EmpSelfPFAmt") = mEmpSelfPFAmt_dbl
        .fields("EmpCoPFPer") = mEmpCoPFPer_dbl
        .fields("EmpCoPFAmt") = mEmpCoPFAmt_dbl
        .fields("EmpSelfESICPer") = mEmpSelfESICPer_dbl
        .fields("EmpSelfESICAmt") = mEmpSelfESICAmt_dbl
        .fields("EmpNSalary") = mEmpNSalary_dbl
        .fields("EmpWrkTime") = mEmpWrkTime_lng
        .fields("EmpHalfDayTime") = mEmpHalfDayTime_lng
        .fields("EmpMinWrkTime") = mEmpMinWrkTime_lng
        .fields("EmpAddOT") = IIf(mEmpAddOT_bln = True, -1, 0)
        .fields("EmpCutUT") = IIf(mEmpCutUT_bln = True, -1, 0)
        .fields("EmpMnLeaves") = mEmpMnLeaves_dbl
        .fields("EmpYrLeaves") = mEmpYrLeaves_dbl
        .fields("EmpWeeklyOff") = mEmpWeeklyOff_int
        .fields("EmpJobState") = mEmpJobState_int
        .fields("EmpSftCode") = mEmpSftCode_int
        
    ElseIf blnDepartmentMast = True Then
    
    ElseIf blnDesignationMast = True Then
    
    ElseIf blnHolidayMast = True Then
        .fields("HlmDate") = mHlmDate_dt
        .fields("HlmRemark") = mHlmRemark_str
    
    ElseIf blnHolidayGrant = True Then
        .fields("HlgHlmCode") = mHlgHlmCode_lng
        .fields("HlgDate") = mHlgDate_dt
        .fields("HlgEmpCode") = mHlgEmpCode_lng
        .fields("HlgDptCode") = mHlgDptCode_lng
        .fields("HlgDsgCode") = mHlgDsgCode_lng
        .fields("HlgAlwState") = mHlgAlwState_int
        .fields("HlgRemark") = mHlgRemark_str
        
    End If
    
    .Update
    mCode_lng = .fields(mCodeField)
    End With
    m_dbPyrDatabase.CommitTrans
    CloseTable tRecset
    
End If

GoTo EndSub
Exit Sub

errhand:
MsgBox Err.Description
m_dbPyrDatabase.Cancel

EndSub:
Set tRecset = Nothing
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
If mNameField <> "" Then
    With tRecset
    .open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbPyrDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount > 0 Then
        mRtnval = .fields(mNameField)
    End If
    End With
    CloseTable tRecset
Else

End If
GetName = mRtnval

End Function

Rem returns code of holiday master based on holiday date
Public Function GetHlmCodeByDate(ByVal mHlmDate As Date) As Long
Dim mRtnval As Long, tRecset As New ADODB.Recordset

With tRecset
.open "Select * from HoliMast where HlmDate=#" & CStr(ToSysDate(mHlmDate)) & "#", m_dbPyrDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    mRtnval = .fields("HlmCode")
End If
End With
CloseTable tRecset

GetHlmCodeByDate = mRtnval

End Function

Rem returns name of holiday master based on holiday date
Public Function GetHlmNameByDate(ByVal mHlmDate As Date) As String
Dim mRtnval As String, tRecset As New ADODB.Recordset

With tRecset
.open "Select * from HoliMast where HlmDate=#" & CStr(ToSysDate(mHlmDate)) & "#", m_dbPyrDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    mRtnval = .fields("HlmName")
End If
End With
CloseTable tRecset

GetHlmNameByDate = mRtnval

End Function

Public Function ChkEntryExist(ByVal mCode As Long, Optional ByVal mExcludeOpn As Boolean = False) As Boolean
Dim tRecset As New ADODB.Recordset, mRtnval As Boolean

If blnEmployeeMast = True Then
    With tRecset
    .open "Select * from Attendance where AtdEmpCode=" & CStr(mCode) & "", m_dbPyrDatabase, adOpenKeyset, adLockReadOnly
    mRtnval = (.RecordCount > 0)
    End With
    CloseTable tRecset
    
ElseIf blnDepartmentMast = True Then
    With tRecset
    .open "Select * from Attendance where AtdDptCode=" & CStr(mCode) & "", m_dbPyrDatabase, adOpenKeyset, adLockReadOnly
    mRtnval = (.RecordCount > 0)
    End With
    CloseTable tRecset
    
    If mRtnval = False Then
        With tRecset
        .open "Select * from EmpMast where EmpDptCode=" & CStr(mCode) & "", m_dbPyrDatabase, adOpenKeyset, adLockReadOnly
        mRtnval = (.RecordCount > 0)
        End With
        CloseTable tRecset
    End If
    
ElseIf blnDesignationMast = True Then
    With tRecset
    .open "Select * from Attendance where AtdDsgCode=" & CStr(mCode) & "", m_dbPyrDatabase, adOpenKeyset, adLockReadOnly
    mRtnval = (.RecordCount > 0)
    End With
    CloseTable tRecset
    
    If mRtnval = False Then
        With tRecset
        .open "Select * from EmpMast where EmpDsgCode=" & CStr(mCode) & "", m_dbPyrDatabase, adOpenKeyset, adLockReadOnly
        mRtnval = (.RecordCount > 0)
        End With
        CloseTable tRecset
    End If

ElseIf blnHolidayMast = True Then
    ErrorBox "Pending !!!"
ElseIf blnHolidayGrant = True Then
    ErrorBox "Pending !!!"

End If

ChkEntryExist = mRtnval

End Function

