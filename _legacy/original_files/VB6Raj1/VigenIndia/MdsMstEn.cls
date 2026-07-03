VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsMdsMasterEntry"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False

Option Explicit

Dim m_dbMdsDatabase As ADODB.Connection, m_dbAcDatabase As ADODB.Connection, m_dbStDatabase As ADODB.Connection
Dim mTableName As String, mCodeField As String, mNameField As String, mRecStateField As String, mTitleName As String
Dim mClassUIdCode As Long, mClassUIdFileName As String, mClassAcsPermFileName As String
Public blnMedPrtMast As Boolean, blnMedPrtGrpMast As Boolean, blnMedItmMast As Boolean, blnMedItmGrpMast As Boolean, blnMonthRepFmt1stMast As Boolean
Public mCode_lng As Long, mName_str As String
Public mMdiDesc_str As String, mMdiMigCode_lng As Long, mMdiPurchRate_dbl As Double, mMdiMRPRate_dbl As Double, mMdiSaleRate_dbl As Double, mMdiItmCode_lng As Long
Public mMigDesc_str As String
Public mMptTitle_str As String, mMptMpgCode_lng As Long, mMptAhCode_lng As Long, mMptAddr_str As String, mMptAraCode_lng As Long, mMptStnCode_lng As Long, mMptTelNo_str As String, mMptSMSNo_str As String, mMptEmail_str As String, mMptShowInList_bln As Boolean, mMptRemark_str As String
Public mMpgDesc_str As String
Public mMrf1Date_dt As Date, mMrf1FilePath_str As String

Dim mActiveMast As Integer, aMastTran() As Variant

Public Sub Init()
    
If blnMedPrtMast = True Then
    mTableName = "MedPrtMast"
    mCodeField = "MptCode"
    mNameField = "MptName"
    mRecStateField = "MptRecState"
    mTitleName = "Party Master"
    
ElseIf blnMedPrtGrpMast = True Then
    mTableName = "MedPrtGrpMst"
    mCodeField = "MpgCode"
    mNameField = "MpgName"
    mRecStateField = "MpgRecState"
    mTitleName = "Party Group Master"
    
ElseIf blnMedItmMast = True Then
    mTableName = "MedItmMast"
    mCodeField = "MdiCode"
    mNameField = "MdiName"
    mRecStateField = "MdiRecState"
    mTitleName = "Item Master"
    
ElseIf blnMedItmGrpMast = True Then
    mTableName = "MedItmGrpMst"
    mCodeField = "MigCode"
    mNameField = "MigName"
    mRecStateField = "MigRecState"
    mTitleName = "Item Group Master"
    
ElseIf blnMonthRepFmt1stMast = True Then
    mTableName = "MonthRepFmt1st"
    mCodeField = "Mrf1Code"
    mNameField = "Mrf1Name"
    mRecStateField = "Mrf1RecState"
    mTitleName = "Monthly Report Format-1st"
    
Else
    ErrorBox "clsMdsMasterEntry_Init_#65_[Undefined Case]"
End If

End Sub

Public Property Set dbMdsDatabase(ByRef db As ADODB.Connection)
Set m_dbMdsDatabase = db

End Property

Public Property Set dbAcDatabase(ByRef db As ADODB.Connection)
Set m_dbAcDatabase = db

End Property

Public Property Set dbStDatabase(ByRef db As ADODB.Connection)
Set m_dbStDatabase = db

End Property

Private Sub Class_Initialize()
aMastTran = Array()
mActiveMast = UBound(aMastTran)

mClassUIdFileName = "clVgnMEn.UId"
mClassAcsPermFileName = "clVgnMEn.Acp"
mClassUIdCode = GetUIdCode("clsMdsMasterEntry_Initialize", mUIdFileName:=mClassUIdFileName, mAcsPermFileName:=mClassAcsPermFileName)
If mClassUIdCode = 0 Then
    ErrorBox cSYSBUSY_ACS_DENIED
End If

End Sub

Public Sub GetData(ByVal mCode As Long)
Dim tRecset As New ADODB.Recordset, acount As Integer

Me.Clear
With tRecset
.open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbMdsDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    mCode_lng = .fields(mCodeField)
    mName_str = .fields(mNameField)
    
    If blnMedPrtMast = True Then
        mMptTitle_str = .fields("MptTitle")
        mMptMpgCode_lng = .fields("MptMpgCode")
        mMptAhCode_lng = .fields("MptAhCode")
        mMptAddr_str = .fields("MptAddr")
        mMptAraCode_lng = .fields("MptAraCode")
        mMptStnCode_lng = .fields("MptStnCode")
        mMptTelNo_str = .fields("MptTelNo")
        mMptSMSNo_str = .fields("MptSMSNo")
        mMptEmail_str = .fields("MptEmail")
        mMptShowInList_bln = .fields("MptShowInList")
        mMptRemark_str = .fields("MptRemark")
        
    ElseIf blnMedPrtGrpMast = True Then
        mMpgDesc_str = .fields("MpgDesc")
        
    ElseIf blnMedItmMast = True Then
        mMdiDesc_str = .fields("MdiDesc")
        mMdiMigCode_lng = .fields("MdiMigCode")
        mMdiPurchRate_dbl = .fields("MdiPurchRate")
        mMdiMRPRate_dbl = .fields("MdiMRPRate")
        mMdiSaleRate_dbl = .fields("MdiSaleRate")
        mMdiItmCode_lng = .fields("MdiItmCode")
        
    ElseIf blnMedItmGrpMast = True Then
        mMigDesc_str = .fields("MigDesc")
        
    ElseIf blnMonthRepFmt1stMast = True Then
        mMrf1Date_dt = .fields("Mrf1Date")
        mMrf1FilePath_str = .fields("Mrf1FilePath")
        
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

If blnMedPrtMast = True Then
    mMptTitle_str = ""
    mMptMpgCode_lng = 0
    mMptAhCode_lng = 0
    mMptAddr_str = ""
    mMptAraCode_lng = 0
    mMptStnCode_lng = 0
    mMptTelNo_str = ""
    mMptSMSNo_str = ""
    mMptEmail_str = ""
    mMptShowInList_bln = False
    mMptRemark_str = ""

ElseIf blnMedPrtGrpMast = True Then
    mMpgDesc_str = ""

ElseIf blnMedItmMast = True Then
    mMdiDesc_str = ""
    mMdiMigCode_lng = 0
    mMdiPurchRate_dbl = 0
    mMdiMRPRate_dbl = 0
    mMdiSaleRate_dbl = 0
    mMdiItmCode_lng = 0
    
ElseIf blnMedItmGrpMast = True Then
    mMigDesc_str = ""
    
ElseIf blnMonthRepFmt1stMast = True Then
    mMrf1Date_dt = cUNKNOWNDATE
    mMrf1FilePath_str = ""
    
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
    mCode = GetUIdCode("clsMdsMasterEntry_BeginMast", mUIdFileName:=mClassUIdFileName, mAcsPermFileName:=mClassAcsPermFileName) * -1        ' GetNextSeqno(m_dbMdsDatabase, mTableName, mCodeField)
    If mCode = 0 Then
        ErrorBox mTitleName & " Entry Failed !!!"
        GoTo EndSub
    End If
ElseIf mCode > 0 Then
    tRecset.open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbMdsDatabase, adOpenKeyset, adLockOptimistic
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
UpdateMast = False

On Error GoTo errhand

m_dbMdsDatabase.BeginTrans
Rem updating Master
With tRecset
.open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbMdsDatabase, adOpenKeyset, adLockOptimistic
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
m_dbMdsDatabase.CommitTrans

UpdateMast = True
GoTo EndSub

errhand:
MsgBox Err.Description
m_dbMdsDatabase.Cancel

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

m_dbMdsDatabase.BeginTrans
With tRecset
.open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbMdsDatabase, adOpenKeyset, adLockOptimistic
LogRS.open "Select * from " & mTableName & "_Log where " & mCodeField & "=" & CStr(mCode) & "", m_dbMdsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    If LogRS.EOF = False Then
        ' any prior updations can be made here
        .fields(mNameField) = LogRS.fields(mNameField)
        .fields(mRecStateField) = LogRS.fields(mRecStateField)
        
        If blnMedPrtMast = True Then
            .fields("MptTitle") = LogRS.fields("MptTitle")
            .fields("MptMpgCode") = LogRS.fields("MptMpgCode")
            .fields("MptAhCode") = LogRS.fields("MptAhCode")
            .fields("MptAddr") = LogRS.fields("MptAddr")
            .fields("MptAraCode") = LogRS.fields("MptAraCode")
            .fields("MptStnCode") = LogRS.fields("MptStnCode")
            .fields("MptTelNo") = LogRS.fields("MptTelNo")
            .fields("MptSMSNo") = LogRS.fields("MptSMSNo")
            .fields("MptEmail") = LogRS.fields("MptEmail")
            .fields("MptShowInList") = LogRS.fields("MptShowInList")
            .fields("MptRemark") = LogRS.fields("MptRemark")
            
        ElseIf blnMedPrtGrpMast = True Then
            .fields("MpgDesc") = LogRS.fields("MpgDesc")
            
        ElseIf blnMedItmMast = True Then
            .fields("MdiDesc") = LogRS.fields("MdiDesc")
            .fields("MdiMigCode") = LogRS.fields("MdiMigCode")
            .fields("MdiPurchRate") = LogRS.fields("MdiPurchRate")
            .fields("MdiMRPRate") = LogRS.fields("MdiMRPRate")
            .fields("MdiSaleRate") = LogRS.fields("MdiSaleRate")
            .fields("MdiItmCode") = LogRS.fields("MdiItmCode")
            
        ElseIf blnMedItmGrpMast = True Then
            .fields("MigDesc") = LogRS.fields("MigDesc")
            
        ElseIf blnMonthRepFmt1stMast = True Then
            .fields("Mrf1Date") = LogRS.fields("Mrf1Date")
            .fields("Mrf1FilePath") = LogRS.fields("Mrf1FilePath")
            
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
CloseTable tRecset
CloseTable LogRS
m_dbMdsDatabase.CommitTrans

CancelMast = True
GoTo EndSub

errhand:
MsgBox Err.Description
m_dbMdsDatabase.Cancel

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

m_dbMdsDatabase.BeginTrans
With tRecset
.open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbMdsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    .fields(mRecStateField) = ChkDeleteRecStatus(.fields(mRecStateField))
    .Update
Else
    ErrorBox "clsMdsMasterEntry_DeleteMast_254"
End If
End With
CloseTable tRecset
m_dbMdsDatabase.CommitTrans

DeleteMast = True
GoTo EndSub

errhand:
MsgBox Err.Description
m_dbMdsDatabase.Cancel

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
.open "Select * from " & mTableName & "_Log where " & mCodeField & "=" & CStr(mCode) & "", m_dbMdsDatabase, adOpenKeyset, adLockOptimistic
If .EOF = True Then
    m_dbMdsDatabase.BeginTrans
    m_dbMdsDatabase.Execute "Insert into " & mTableName & "_Log" & " Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & ""
    m_dbMdsDatabase.CommitTrans
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

m_dbMdsDatabase.BeginTrans
m_dbMdsDatabase.Execute "Delete from " & mTableName & "_Log" & " where " & mCodeField & "=" & CStr(mCode)
m_dbMdsDatabase.CommitTrans

Data_RemoveLog = True

End Function

Public Function AddNew() As Boolean
Dim tRecset As New ADODB.Recordset, mCanAddNew As Boolean, mLCount As Integer, mUCount As Integer, acount As Integer

AddNew = False
mCanAddNew = True

tRecset.open "Select " & mNameField & " from " & mTableName & " where " & mNameField & "='" & mName_str & "'", m_dbMdsDatabase, adOpenKeyset, adLockOptimistic
If tRecset.EOF = False Then
    mCanAddNew = False
    ErrorBox "Duplicate Name !!!"
End If
CloseTable tRecset

On Error GoTo errhand
mCode_lng = 0
If mCanAddNew = True Then
    m_dbMdsDatabase.BeginTrans
    With tRecset
    .open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(-0.1) & "", m_dbMdsDatabase, adOpenKeyset, adLockOptimistic
    
    .AddNew
    Rem .Fields(mCodeField) = mCode_lng AutoNumber
    .fields(mNameField) = mName_str
    .fields(mRecStateField) = cREC_ADDED
    
    If blnMedPrtMast = True Then
        .fields("MptTitle") = mMptTitle_str
        .fields("MptMpgCode") = mMptMpgCode_lng
        .fields("MptAhCode") = mMptAhCode_lng
        .fields("MptAddr") = mMptAddr_str
        .fields("MptAraCode") = mMptAraCode_lng
        .fields("MptStnCode") = mMptStnCode_lng
        .fields("MptTelNo") = mMptTelNo_str
        .fields("MptSMSNo") = mMptSMSNo_str
        .fields("MptEmail") = mMptEmail_str
        .fields("MptShowInList") = mMptShowInList_bln
        .fields("MptRemark") = mMptRemark_str
    
    ElseIf blnMedPrtGrpMast = True Then
        .fields("MpgDesc") = mMpgDesc_str
    
    ElseIf blnMedItmMast = True Then
        .fields("MdiDesc") = mMdiDesc_str
        .fields("MdiMigCode") = mMdiMigCode_lng
        .fields("MdiPurchRate") = mMdiPurchRate_dbl
        .fields("MdiMRPRate") = mMdiMRPRate_dbl
        .fields("MdiSaleRate") = mMdiSaleRate_dbl
        .fields("MdiItmCode") = mMdiItmCode_lng
        
    ElseIf blnMedItmGrpMast = True Then
        .fields("MigDesc") = mMigDesc_str
        
    ElseIf blnMonthRepFmt1stMast = True Then
        .fields("Mrf1Date") = mMrf1Date_dt
        .fields("Mrf1FilePath") = mMrf1FilePath_str
        
    End If
    .Update
    mCode_lng = .fields(mCodeField)
    aMastTran(mActiveMast) = mCode_lng
    End With
    CloseTable tRecset
    
    m_dbMdsDatabase.CommitTrans
End If
AddNew = True
GoTo EndSub

errhand:
MsgBox Err.Description
m_dbMdsDatabase.Cancel

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Function

End Function

Public Function Update(ByVal mCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset, mCanUpdate As Boolean, mLCount As Integer, mUCount As Integer, acount As Integer

Update = False
mCanUpdate = True

tRecset.open "Select " & mNameField & " from " & mTableName & " where " & mNameField & "='" & mName_str & "' and " & mCodeField & "<>" & CStr(mCode) & "", m_dbMdsDatabase, adOpenKeyset, adLockOptimistic
If tRecset.EOF = False Then
    mCanUpdate = False
    ErrorBox "Duplicate Name !!!"
End If
CloseTable tRecset

On Error GoTo errhand
mCode_lng = 0
If mCanUpdate = True Then
    m_dbMdsDatabase.BeginTrans
    With tRecset
    .open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbMdsDatabase, adOpenKeyset, adLockOptimistic
    
    .fields(mNameField) = mName_str
    .fields(mRecStateField) = ChkEditRecStatus(.fields(mRecStateField))
    
    If blnMedPrtMast = True Then
        .fields("MptTitle") = mMptTitle_str
        .fields("MptMpgCode") = mMptMpgCode_lng
        .fields("MptAhCode") = mMptAhCode_lng
        .fields("MptAddr") = mMptAddr_str
        .fields("MptAraCode") = mMptAraCode_lng
        .fields("MptStnCode") = mMptStnCode_lng
        .fields("MptTelNo") = mMptTelNo_str
        .fields("MptSMSNo") = mMptSMSNo_str
        .fields("MptEmail") = mMptEmail_str
        .fields("MptShowInList") = mMptShowInList_bln
        .fields("MptRemark") = mMptRemark_str
        
    ElseIf blnMedPrtGrpMast = True Then
        .fields("MpgDesc") = mMpgDesc_str
        
    ElseIf blnMedItmMast = True Then
        .fields("MdiDesc") = mMdiDesc_str
        .fields("MdiMigCode") = mMdiMigCode_lng
        .fields("MdiPurchRate") = mMdiPurchRate_dbl
        .fields("MdiMRPRate") = mMdiMRPRate_dbl
        .fields("MdiSaleRate") = mMdiSaleRate_dbl
        .fields("MdiItmCode") = mMdiItmCode_lng
        
    ElseIf blnMedItmGrpMast = True Then
        .fields("MigDesc") = mMigDesc_str
        
    ElseIf blnMonthRepFmt1stMast = True Then
        .fields("Mrf1Date") = mMrf1Date_dt
        .fields("Mrf1FilePath") = mMrf1FilePath_str
        
    End If
    .Update
    mCode_lng = .fields(mCodeField)
    End With
    CloseTable tRecset
    
    m_dbMdsDatabase.CommitTrans
End If
Update = True
GoTo EndSub

errhand:
MsgBox Err.Description
m_dbMdsDatabase.Cancel

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
.open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbMdsDatabase, adOpenKeyset, adLockOptimistic
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

If blnMedPrtMast = True Then
    With tRecset
    .open "Select * from MedPurchHdr where PuhMptCode = " & CStr(mCode) & "", m_dbMdsDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        ChkEntryExist = True
        ErrorBox "Used in Purchase/Sales Return " & CStr(.fields("PuhVchNo")) & " dated " & Dtoc(.fields("PuhDate"))
    End If
    End With
    CloseTable tRecset
    If ChkEntryExist = False Then
        With tRecset
        .open "Select * from MedSaleHdr where SahMptCode = " & CStr(mCode) & "", m_dbMdsDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            ChkEntryExist = True
            ErrorBox "Used in Sales/Purchase Return " & CStr(.fields("SahVchNo")) & " dated " & Dtoc(.fields("SahDate"))
        End If
        End With
        CloseTable tRecset
    End If

ElseIf blnMedPrtGrpMast = True Then
    With tRecset
    .open "Select * from MedPrtMast where MptMpgCode = " & CStr(mCode) & "", m_dbMdsDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        ChkEntryExist = True
        ErrorBox "Used in Party Master " & CStr(.fields("MptName"))
    End If
    End With
    CloseTable tRecset

ElseIf blnMedItmMast = True Then
    With tRecset
    .open "Select * from MedPurchDtl dtl" _
        & " left join MedPurchHdr hdr on dtl.PurCode = hdr.PuhCode" _
        & " where PurMdiCode = " & CStr(mCode) & "" _
        , m_dbMdsDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        ChkEntryExist = True
        If IsNull(.fields("PuhCode")) = False Then
            ErrorBox "Used in Purchase/Sales Return " & CStr(.fields("PuhVchNo")) & " dated " & Dtoc(.fields("PuhDate"))
        Else
            ErrorBox "Entry Under Process in Purchase/Sales Return dated " & Dtoc(.fields("PurDate"))
        End If
    End If
    End With
    CloseTable tRecset
    If ChkEntryExist = False Then
        With tRecset
        .open "Select * from MedSaleDtl dtl" _
            & " left join MedSaleHdr hdr on dtl.SalCode = hdr.SahCode" _
            & " where SalMdiCode = " & CStr(mCode) & "" _
            , m_dbMdsDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            ChkEntryExist = True
            If IsNull(.fields("SahCode")) = False Then
                ErrorBox "Used in Sales/Purchase Return " & CStr(.fields("SahVchNo")) & " dated " & Dtoc(.fields("SahDate"))
            Else
                ErrorBox "Entry Under Process in Sales/Purchase Return dated " & Dtoc(.fields("SalDate"))
            End If
        End If
        End With
        CloseTable tRecset
    End If
    
ElseIf blnMedItmGrpMast = True Then
    With tRecset
    .open "Select * from MedItmMast where MdiMigCode = " & CStr(mCode) & "", m_dbMdsDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        ChkEntryExist = True
        ErrorBox "Used in Item Master " & CStr(.fields("MdiName"))
    End If
    End With
    CloseTable tRecset

ElseIf blnMonthRepFmt1stMast = True Then




Else
    ErrorBox "clsMdsMasterEntry_ChkEntryExist_#1001_[Undefined Case]"
End If

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Function

End Function


