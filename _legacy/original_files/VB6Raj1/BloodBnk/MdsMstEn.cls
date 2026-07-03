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
Public blnPartyMast1 As Boolean, blnPartyGrpMast1 As Boolean, blnSubItmMast1 As Boolean, blnSubItmGrpMast1 As Boolean
Public mCode_lng As Long, mName_str As String
Public mSimDesc_str As String, mSimSigCode_lng As Long, mSimPurchRate_dbl As Double, mSimMRPRate_dbl As Double, mSimSaleRate_dbl As Double, mSimItmCode_lng As Long
Public mSigDesc_str As String
Public mPrtTitle_str As String, mPrtPgmCode_lng As Long, mPrtAhCode_lng As Long, mPrtAddr_str As String, mPrtAraCode_lng As Long, mPrtStnCode_lng As Long, mPrtTelNo_str As String, mPrtSMSNo_str As String, mPrtEmail_str As String, mPrtShowInList_bln As Boolean, mPrtRemark_str As String
Public mPgmDesc_str As String

Dim mActiveMast As Integer, aMastTran() As Variant

Public Sub Init()
    
If blnPartyMast1 = True Then
    mTableName = "PartyMast"
    mCodeField = "PrtCode"
    mNameField = "PrtName"
    mRecStateField = "PrtRecState"
    mTitleName = "Party Master"
    
ElseIf blnPartyGrpMast1 = True Then
    mTableName = "PartyGrpMst"
    mCodeField = "PgmCode"
    mNameField = "PgmName"
    mRecStateField = "PgmRecState"
    mTitleName = "Party Group Master"
    
ElseIf blnSubItmMast1 = True Then
    mTableName = "SubItmMast"
    mCodeField = "SimCode"
    mNameField = "SimName"
    mRecStateField = "SimRecState"
    mTitleName = "Item Master"
    
ElseIf blnSubItmGrpMast1 = True Then
    mTableName = "SubItmGrpMst"
    mCodeField = "SigCode"
    mNameField = "SigName"
    mRecStateField = "SigRecState"
    mTitleName = "Item Group Master"
    
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

mClassUIdFileName = "clHmsMEn.UId"
mClassAcsPermFileName = "clHmsMEn.Acp"
mClassUIdCode = GetUIdCode("clsMdsMasterEntry_Initialize", mUIdFileName:=mClassUIdFileName, mAcsPermFileName:=mClassAcsPermFileName)
If mClassUIdCode = 0 Then
    ErrorBox cSYSBUSY_ACS_DENIED
End If

End Sub

Public Sub GetData(ByVal mCode As Long)
Dim tRecset As New ADODB.Recordset, acount As Integer

Me.Clear
With tRecset
.Open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbMdsDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    mCode_lng = .fields(mCodeField)
    mName_str = .fields(mNameField)
    
    If blnPartyMast1 = True Then
        mPrtTitle_str = .fields("PrtTitle")
        mPrtPgmCode_lng = .fields("PrtPgmCode")
        mPrtAhCode_lng = .fields("PrtAhCode")
        mPrtAddr_str = .fields("PrtAddr")
        mPrtAraCode_lng = .fields("PrtAraCode")
        mPrtStnCode_lng = .fields("PrtStnCode")
        mPrtTelNo_str = .fields("PrtTelNo")
        mPrtSMSNo_str = .fields("PrtSMSNo")
        mPrtEmail_str = .fields("PrtEmail")
        mPrtShowInList_bln = .fields("PrtShowInList")
        mPrtRemark_str = .fields("PrtRemark")
        
    ElseIf blnPartyGrpMast1 = True Then
        mPgmDesc_str = .fields("PgmDesc")
        
    ElseIf blnSubItmMast1 = True Then
        mSimDesc_str = .fields("SimDesc")
        mSimSigCode_lng = .fields("SimSigCode")
        mSimPurchRate_dbl = .fields("SimPurchRate")
        mSimMRPRate_dbl = .fields("SimMRPRate")
        mSimSaleRate_dbl = .fields("SimSaleRate")
        mSimItmCode_lng = .fields("SimItmCode")
        
    ElseIf blnSubItmGrpMast1 = True Then
        mSigDesc_str = .fields("SigDesc")
        
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

If blnPartyMast1 = True Then
    mPrtTitle_str = ""
    mPrtPgmCode_lng = 0
    mPrtAhCode_lng = 0
    mPrtAddr_str = ""
    mPrtAraCode_lng = 0
    mPrtStnCode_lng = 0
    mPrtTelNo_str = ""
    mPrtSMSNo_str = ""
    mPrtEmail_str = ""
    mPrtShowInList_bln = False
    mPrtRemark_str = ""

ElseIf blnPartyGrpMast1 = True Then
    mPgmDesc_str = ""

ElseIf blnSubItmMast1 = True Then
    mSimDesc_str = ""
    mSimSigCode_lng = 0
    mSimPurchRate_dbl = 0
    mSimMRPRate_dbl = 0
    mSimSaleRate_dbl = 0
    mSimItmCode_lng = 0
    
ElseIf blnSubItmGrpMast1 = True Then
    mSigDesc_str = ""
    
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
    tRecset.Open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbMdsDatabase, adOpenKeyset, adLockOptimistic
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
.Open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbMdsDatabase, adOpenKeyset, adLockOptimistic
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
.Open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbMdsDatabase, adOpenKeyset, adLockOptimistic
LogRS.Open "Select * from " & mTableName & "_Log where " & mCodeField & "=" & CStr(mCode) & "", m_dbMdsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    If LogRS.EOF = False Then
        ' any prior updations can be made here
        .fields(mNameField) = LogRS.fields(mNameField)
        .fields(mRecStateField) = LogRS.fields(mRecStateField)
        
        If blnPartyMast1 = True Then
            .fields("PrtTitle") = LogRS.fields("PrtTitle")
            .fields("PrtPgmCode") = LogRS.fields("PrtPgmCode")
            .fields("PrtAhCode") = LogRS.fields("PrtAhCode")
            .fields("PrtAddr") = LogRS.fields("PrtAddr")
            .fields("PrtAraCode") = LogRS.fields("PrtAraCode")
            .fields("PrtStnCode") = LogRS.fields("PrtStnCode")
            .fields("PrtTelNo") = LogRS.fields("PrtTelNo")
            .fields("PrtSMSNo") = LogRS.fields("PrtSMSNo")
            .fields("PrtEmail") = LogRS.fields("PrtEmail")
            .fields("PrtShowInList") = LogRS.fields("PrtShowInList")
            .fields("PrtRemark") = LogRS.fields("PrtRemark")
            
        ElseIf blnPartyGrpMast1 = True Then
            .fields("PgmDesc") = LogRS.fields("PgmDesc")
            
        ElseIf blnSubItmMast1 = True Then
            .fields("SimDesc") = LogRS.fields("SimDesc")
            .fields("SimSigCode") = LogRS.fields("SimSigCode")
            .fields("SimPurchRate") = LogRS.fields("SimPurchRate")
            .fields("SimMRPRate") = LogRS.fields("SimMRPRate")
            .fields("SimSaleRate") = LogRS.fields("SimSaleRate")
            .fields("SimItmCode") = LogRS.fields("SimItmCode")
            
        ElseIf blnSubItmGrpMast1 = True Then
            .fields("SigDesc") = LogRS.fields("SigDesc")
            
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
.Open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbMdsDatabase, adOpenKeyset, adLockOptimistic
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
.Open "Select * from " & mTableName & "_Log where " & mCodeField & "=" & CStr(mCode) & "", m_dbMdsDatabase, adOpenKeyset, adLockOptimistic
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

tRecset.Open "Select " & mNameField & " from " & mTableName & " where " & mNameField & "='" & mName_str & "'", m_dbMdsDatabase, adOpenKeyset, adLockOptimistic
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
    .Open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(-0.1) & "", m_dbMdsDatabase, adOpenKeyset, adLockOptimistic
    
    .AddNew
    Rem .Fields(mCodeField) = mCode_lng AutoNumber
    .fields(mNameField) = mName_str
    .fields(mRecStateField) = cREC_ADDED
    
    If blnPartyMast1 = True Then
        .fields("PrtTitle") = mPrtTitle_str
        .fields("PrtPgmCode") = mPrtPgmCode_lng
        .fields("PrtAhCode") = mPrtAhCode_lng
        .fields("PrtAddr") = mPrtAddr_str
        .fields("PrtAraCode") = mPrtAraCode_lng
        .fields("PrtStnCode") = mPrtStnCode_lng
        .fields("PrtTelNo") = mPrtTelNo_str
        .fields("PrtSMSNo") = mPrtSMSNo_str
        .fields("PrtEmail") = mPrtEmail_str
        .fields("PrtShowInList") = mPrtShowInList_bln
        .fields("PrtRemark") = mPrtRemark_str
    
    ElseIf blnPartyGrpMast1 = True Then
        .fields("PgmDesc") = mPgmDesc_str
    
    ElseIf blnSubItmMast1 = True Then
        .fields("SimDesc") = mSimDesc_str
        .fields("SimSigCode") = mSimSigCode_lng
        .fields("SimPurchRate") = mSimPurchRate_dbl
        .fields("SimMRPRate") = mSimMRPRate_dbl
        .fields("SimSaleRate") = mSimSaleRate_dbl
        .fields("SimItmCode") = mSimItmCode_lng
        
    ElseIf blnSubItmGrpMast1 = True Then
        .fields("SigDesc") = mSigDesc_str
        
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

tRecset.Open "Select " & mNameField & " from " & mTableName & " where " & mNameField & "='" & mName_str & "' and " & mCodeField & "<>" & CStr(mCode) & "", m_dbMdsDatabase, adOpenKeyset, adLockOptimistic
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
    .Open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbMdsDatabase, adOpenKeyset, adLockOptimistic
    
    .fields(mNameField) = mName_str
    .fields(mRecStateField) = ChkEditRecStatus(.fields(mRecStateField))
    
    If blnPartyMast1 = True Then
        .fields("PrtTitle") = mPrtTitle_str
        .fields("PrtPgmCode") = mPrtPgmCode_lng
        .fields("PrtAhCode") = mPrtAhCode_lng
        .fields("PrtAddr") = mPrtAddr_str
        .fields("PrtAraCode") = mPrtAraCode_lng
        .fields("PrtStnCode") = mPrtStnCode_lng
        .fields("PrtTelNo") = mPrtTelNo_str
        .fields("PrtSMSNo") = mPrtSMSNo_str
        .fields("PrtEmail") = mPrtEmail_str
        .fields("PrtShowInList") = mPrtShowInList_bln
        .fields("PrtRemark") = mPrtRemark_str
        
    ElseIf blnPartyGrpMast1 = True Then
        .fields("PgmDesc") = mPgmDesc_str
        
    ElseIf blnSubItmMast1 = True Then
        .fields("SimDesc") = mSimDesc_str
        .fields("SimSigCode") = mSimSigCode_lng
        .fields("SimPurchRate") = mSimPurchRate_dbl
        .fields("SimMRPRate") = mSimMRPRate_dbl
        .fields("SimSaleRate") = mSimSaleRate_dbl
        .fields("SimItmCode") = mSimItmCode_lng
        
    ElseIf blnSubItmGrpMast1 = True Then
        .fields("SigDesc") = mSigDesc_str
        
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
.Open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbMdsDatabase, adOpenKeyset, adLockOptimistic
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

If blnPartyMast1 = True Then
    With tRecset
    .Open "Select * from PurchHdr where PuhPrtCode = " & CStr(mCode) & "", m_dbMdsDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        ChkEntryExist = True
        ErrorBox "Used in Purchase/Sales Return " & CStr(.fields("PuhVchNo")) & " dated " & Dtoc(.fields("PuhDate"))
    End If
    End With
    CloseTable tRecset
    If ChkEntryExist = False Then
        With tRecset
        .Open "Select * from SaleHdr where SahPrtCode = " & CStr(mCode) & "", m_dbMdsDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            ChkEntryExist = True
            ErrorBox "Used in Sales/Purchase Return " & CStr(.fields("SahVchNo")) & " dated " & Dtoc(.fields("SahDate"))
        End If
        End With
        CloseTable tRecset
    End If

ElseIf blnPartyGrpMast1 = True Then
    With tRecset
    .Open "Select * from PartyMast where PrtPgmCode = " & CStr(mCode) & "", m_dbMdsDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        ChkEntryExist = True
        ErrorBox "Used in Party Master " & CStr(.fields("PrtName"))
    End If
    End With
    CloseTable tRecset

ElseIf blnSubItmMast1 = True Then
    With tRecset
    .Open "Select * from PurchDtl dtl" _
        & " left join PurchHdr hdr on dtl.PurCode = hdr.PuhCode" _
        & " where PurSimCode = " & CStr(mCode) & "" _
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
        .Open "Select * from SaleDtl dtl" _
            & " left join SaleHdr hdr on dtl.SalCode = hdr.SahCode" _
            & " where SalSimCode = " & CStr(mCode) & "" _
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
    
ElseIf blnSubItmGrpMast1 = True Then
    With tRecset
    .Open "Select * from SubItmMast where SimSigCode = " & CStr(mCode) & "", m_dbMdsDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        ChkEntryExist = True
        ErrorBox "Used in Item Master " & CStr(.fields("SimName"))
    End If
    End With
    CloseTable tRecset
    
Else
    ErrorBox "clsMdsMasterEntry_ChkEntryExist_#1001_[Undefined Case]"
End If

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Function

End Function


