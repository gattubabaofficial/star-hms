VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsNcbMasterEntry"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False

Option Explicit

Dim m_dbNcbDatabase As ADODB.Connection, m_dbAcDatabase As ADODB.Connection, m_dbStDatabase As ADODB.Connection
Dim mTableName As String, mCodeField As String, mNameField As String, mRecStateField As String, mTitleName As String
Dim mClassUIdCode As Long, mClassUIdFileName As String, mClassAcsPermFileName As String
Public blnPartyMast As Boolean, blnPartyGrpMast As Boolean, blnSubItmMast As Boolean, blnSubItmGrpMast As Boolean, blnStudCatgMast As Boolean, blnStudMast As Boolean, blnGodownMast As Boolean
Public blnBookGrpMast As Boolean, blnBookAthMast As Boolean, blnBookPubsMast As Boolean, blnBookEdtnMast As Boolean, blnBookMast As Boolean
Public mCode_lng As Long, mName_str As String
Public mSimDesc_str As String, mSimSigCode_lng As Long, mSimPurchRate_dbl As Double, mSimMRPRate_dbl As Double, mSimSaleRate_dbl As Double, mSimItmCode_lng As Long
Public mSigDesc_str As String
Public mPrtTitle_str As String, mPrtPgmCode_lng As Long, mPrtAhCode_lng As Long, mPrtAddr_str As String, mPrtAraCode_lng As Long, mPrtStnCode_lng As Long, mPrtTelNo_str As String, mPrtSMSNo_str As String, mPrtEmail_str As String, mPrtShowInList_bln As Boolean, mPrtRemark_str As String
Public mPgmDesc_str As String
Public mScgShowInList_bln As Boolean
Public mSdtRegNo_lng As Long, mSdtRegDate_dt As Date, mSdtSex_str As String, mSdtAgeAsOnDt_dt As Date, mSdtDob_dt As Date, mSdtAhCode_lng As Long, mSdtScgCode_lng As Long, mSdtRefRela_str As String, mSdtRefName_str As String, mSdtAddr_str As String, mSdtAraCode_lng As Long, mSdtStnCode_lng As Long, mSdtTelNo_str As String, mSdtSMSNo_str As String, mSdtEmail_str As String, mSdtShowInList_bln As Boolean, mSdtRemark_str As String
Public mGdmDesc_str As String
Public mBgpDesc_str As String
Public mBahDesc_str As String
Public mBpsDesc_str As String
Public mBdnDesc_str As String
Public mBkmDesc_str As String, mBkmBgpCode_lng As Long, mBkmBahCode_lng As Long, mBkmBpsCode_lng As Long, mBkmBdnCode_lng As Long, mBkmPurchRate_dbl As Double, mBkmMRPRate_dbl As Double, mBkmSimCode_lng As Long

Dim mActiveMast As Integer, aMastTran() As Variant

Public Sub Init()
    
If blnPartyMast = True Then
    mTableName = "PartyMast"
    mCodeField = "PrtCode"
    mNameField = "PrtName"
    mRecStateField = "PrtRecState"
    mTitleName = "Party Master"
    
ElseIf blnPartyGrpMast = True Then
    mTableName = "PartyGrpMst"
    mCodeField = "PgmCode"
    mNameField = "PgmName"
    mRecStateField = "PgmRecState"
    mTitleName = "Party Group Master"
    
ElseIf blnSubItmMast = True Then
    mTableName = "SubItmMast"
    mCodeField = "SimCode"
    mNameField = "SimName"
    mRecStateField = "SimRecState"
    mTitleName = "Item Master"
    
ElseIf blnSubItmGrpMast = True Then
    mTableName = "SubItmGrpMst"
    mCodeField = "SigCode"
    mNameField = "SigName"
    mRecStateField = "SigRecState"
    mTitleName = "Item Group Master"
    
ElseIf blnStudCatgMast = True Then
    mTableName = "StudCatgMst"
    mCodeField = "ScgCode"
    mNameField = "ScgName"
    mRecStateField = "ScgRecState"
    mTitleName = "Student Category Master"
    
ElseIf blnStudMast = True Then
    mTableName = "StudMast"
    mCodeField = "SdtCode"
    mNameField = "SdtName"
    mRecStateField = "SdtRecState"
    mTitleName = "Student Master"
    
ElseIf blnGodownMast = True Then
    mTableName = "GodownMast"
    mCodeField = "GdmCode"
    mNameField = "GdmName"
    mRecStateField = "GdmRecState"
    mTitleName = "Godown Master"
    
ElseIf blnBookGrpMast = True Then
    mTableName = "BookGrpMst"
    mCodeField = "BgpCode"
    mNameField = "BgpName"
    mRecStateField = "BgpRecState"
    mTitleName = "Books Group Master"
    
ElseIf blnBookAthMast = True Then
    mTableName = "BookAthMast"
    mCodeField = "BahCode"
    mNameField = "BahName"
    mRecStateField = "BahRecState"
    mTitleName = "Author Master"
    
ElseIf blnBookPubsMast = True Then
    mTableName = "BookPubMast"
    mCodeField = "BpsCode"
    mNameField = "BpsName"
    mRecStateField = "BpsRecState"
    mTitleName = "Books Publication Master"
    
ElseIf blnBookEdtnMast = True Then
    mTableName = "BookEdtnMast"
    mCodeField = "BdnCode"
    mNameField = "BdnName"
    mRecStateField = "BdnRecState"
    mTitleName = "Books Edition Master"
    
ElseIf blnBookMast = True Then
    mTableName = "BookMast"
    mCodeField = "BkmCode"
    mNameField = "BkmName"
    mRecStateField = "BkmRecState"
    mTitleName = "Books Master"
    
    
    
Else
    ErrorBox "clsNcbMasterEntry_Init_#65_[Undefined Case]"
    
End If

End Sub

Public Property Set dbNcbDatabase(ByRef db As ADODB.Connection)
Set m_dbNcbDatabase = db

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

mClassUIdFileName = "clNcbMEn.UId"
mClassAcsPermFileName = "clNcbMEn.Acp"
mClassUIdCode = GetUIdCode("clsNcbMasterEntry_Initialize", mUIdFileName:=mClassUIdFileName, mAcsPermFileName:=mClassAcsPermFileName)
If mClassUIdCode = 0 Then
    ErrorBox cSYSBUSY_ACS_DENIED
End If

End Sub

Public Sub GetData(ByVal mCode As Long)
Dim tRecset As New ADODB.Recordset, acount As Integer

Me.Clear
With tRecset
.Open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbNcbDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    mCode_lng = .fields(mCodeField)
    If mNameField <> "" Then
        mName_str = .fields(mNameField)
    End If
    
    If blnPartyMast = True Then
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
        
    ElseIf blnPartyGrpMast = True Then
        mPgmDesc_str = .fields("PgmDesc")
        
    ElseIf blnSubItmMast = True Then
        mSimDesc_str = .fields("SimDesc")
        mSimSigCode_lng = .fields("SimSigCode")
        mSimPurchRate_dbl = .fields("SimPurchRate")
        mSimMRPRate_dbl = .fields("SimMRPRate")
        mSimSaleRate_dbl = .fields("SimSaleRate")
        mSimItmCode_lng = .fields("SimItmCode")
        
    ElseIf blnSubItmGrpMast = True Then
        mSigDesc_str = .fields("SigDesc")
        
    ElseIf blnStudCatgMast = True Then
        mScgShowInList_bln = .fields("ScgShowInList")
        
    ElseIf blnStudMast = True Then
        mSdtRegNo_lng = .fields("SdtRegNo")
        mSdtRegDate_dt = .fields("SdtRegDate")
        mSdtSex_str = .fields("SdtSex")
        mSdtAgeAsOnDt_dt = .fields("SdtAgeAsOnDt")
        mSdtDob_dt = .fields("SdtDob")
        mSdtAhCode_lng = .fields("SdtAhCode")
        mSdtScgCode_lng = .fields("SdtScgCode")
        mSdtRefRela_str = .fields("SdtRefRela")
        mSdtRefName_str = .fields("SdtRefName")
        mSdtAddr_str = .fields("SdtAddr")
        mSdtAraCode_lng = .fields("SdtAraCode")
        mSdtStnCode_lng = .fields("SdtStnCode")
        mSdtTelNo_str = .fields("SdtTelNo")
        mSdtSMSNo_str = .fields("SdtSMSNo")
        mSdtEmail_str = .fields("SdtEmail")
        mSdtShowInList_bln = .fields("SdtShowInList")
        mSdtRemark_str = .fields("SdtRemark")
        
    ElseIf blnGodownMast = True Then
        mGdmDesc_str = .fields("GdmDesc")
    
    ElseIf blnBookGrpMast = True Then
        mBgpDesc_str = .fields("BgpDesc")
    
    ElseIf blnBookAthMast = True Then
        mBahDesc_str = .fields("BahDesc")
    
    ElseIf blnBookPubsMast = True Then
        mBpsDesc_str = .fields("BpsDesc")
    
    ElseIf blnBookEdtnMast = True Then
        mBdnDesc_str = .fields("BdnDesc")
    
    ElseIf blnBookMast = True Then
        mBkmDesc_str = .fields("BkmDesc")
        mBkmBgpCode_lng = .fields("BkmBgpCode")
        mBkmBahCode_lng = .fields("BkmBahCode")
        mBkmBpsCode_lng = .fields("BkmBpsCode")
        mBkmBdnCode_lng = .fields("BkmBdnCode")
        mBkmPurchRate_dbl = .fields("BkmPurchRate")
        mBkmMRPRate_dbl = .fields("BkmMRPRate")
        mBkmSimCode_lng = .fields("BkmSimCode")
    
    Else
        ErrorBox "clsNcbMasterEntry_GetData_#195_[Undefined Case]"
    
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
If mNameField <> "" Then
    mName_str = ""
End If

If blnPartyMast = True Then
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

ElseIf blnPartyGrpMast = True Then
    mPgmDesc_str = ""

ElseIf blnSubItmMast = True Then
    mSimDesc_str = ""
    mSimSigCode_lng = 0
    mSimPurchRate_dbl = 0
    mSimMRPRate_dbl = 0
    mSimSaleRate_dbl = 0
    mSimItmCode_lng = 0
    
ElseIf blnSubItmGrpMast = True Then
    mSigDesc_str = ""
    
ElseIf blnStudCatgMast = True Then
    mScgShowInList_bln = False

ElseIf blnStudMast = True Then
    mSdtRegNo_lng = 0
    mSdtRegDate_dt = cUNKNOWNDATE
    mSdtSex_str = ""
    mSdtAgeAsOnDt_dt = cUNKNOWNDATE
    mSdtDob_dt = cUNKNOWNDATE
    mSdtAhCode_lng = 0
    mSdtScgCode_lng = 0
    mSdtRefRela_str = ""
    mSdtRefName_str = ""
    mSdtAddr_str = ""
    mSdtAraCode_lng = 0
    mSdtStnCode_lng = 0
    mSdtTelNo_str = ""
    mSdtSMSNo_str = ""
    mSdtEmail_str = ""
    mSdtShowInList_bln = False
    mSdtRemark_str = ""
    
ElseIf blnGodownMast = True Then
    mGdmDesc_str = ""

ElseIf blnBookGrpMast = True Then
    mBgpDesc_str = ""

ElseIf blnBookAthMast = True Then
    mBahDesc_str = ""

ElseIf blnBookPubsMast = True Then
    mBpsDesc_str = ""

ElseIf blnBookEdtnMast = True Then
    mBdnDesc_str = ""

ElseIf blnBookMast = True Then
    mBkmDesc_str = ""
    mBkmBgpCode_lng = 0
    mBkmBahCode_lng = 0
    mBkmBpsCode_lng = 0
    mBkmBdnCode_lng = 0
    mBkmPurchRate_dbl = 0
    mBkmMRPRate_dbl = 0
    mBkmSimCode_lng = 0

Else
    ErrorBox "clsNcbMasterEntry_Clear_#284_[Undefined Case]"
    
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
    mCode = GetUIdCode("clsNcbMasterEntry_BeginMast", mUIdFileName:=mClassUIdFileName, mAcsPermFileName:=mClassAcsPermFileName) * -1        ' GetNextSeqno(m_dbNcbDatabase, mTableName, mCodeField)
    If mCode = 0 Then
        ErrorBox mTitleName & " Entry Failed !!!"
        GoTo EndSub
    End If
ElseIf mCode > 0 Then
    tRecset.Open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbNcbDatabase, adOpenKeyset, adLockOptimistic
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

m_dbNcbDatabase.BeginTrans
Rem updating Master
With tRecset
.Open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbNcbDatabase, adOpenKeyset, adLockOptimistic
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
m_dbNcbDatabase.CommitTrans

UpdateMast = True
GoTo EndSub

errhand:
MsgBox Err.Description
m_dbNcbDatabase.Cancel

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Function

End Function

Rem checks entries with log table, if log exist restores log records else delete records (assuming new records added), balance updation part not done here because master entries does not have effect while in process
Public Function CancelMast(ByVal mCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset, LogRS As New ADODB.Recordset
Dim mRecEdited As Boolean, mRecDeleted As Boolean

CancelMast = False
If Chk_ActiveMast() = False Or IIf(ActiveCode > 0, mCode <> ActiveCode, False) Then
    ErrorBox "No Active " & mTitleName & " Entry to Cancel !!!"
    GoTo EndSub
End If
'mCode = ActiveCode
On Error GoTo errhand

m_dbNcbDatabase.BeginTrans
With tRecset
.Open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbNcbDatabase, adOpenKeyset, adLockOptimistic
LogRS.Open "Select * from " & mTableName & "_Log where " & mCodeField & "=" & CStr(mCode) & "", m_dbNcbDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    If LogRS.EOF = False Then
        ' any prior updations can be made here
        If mNameField <> "" Then
            .fields(mNameField) = LogRS.fields(mNameField)
        End If
        .fields(mRecStateField) = LogRS.fields(mRecStateField)
        
        If blnPartyMast = True Then
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
            
        ElseIf blnPartyGrpMast = True Then
            .fields("PgmDesc") = LogRS.fields("PgmDesc")
            
        ElseIf blnSubItmMast = True Then
            .fields("SimDesc") = LogRS.fields("SimDesc")
            .fields("SimSigCode") = LogRS.fields("SimSigCode")
            .fields("SimPurchRate") = LogRS.fields("SimPurchRate")
            .fields("SimMRPRate") = LogRS.fields("SimMRPRate")
            .fields("SimSaleRate") = LogRS.fields("SimSaleRate")
            .fields("SimItmCode") = LogRS.fields("SimItmCode")
            
        ElseIf blnSubItmGrpMast = True Then
            .fields("SigDesc") = LogRS.fields("SigDesc")
            
        ElseIf blnStudCatgMast = True Then
            .fields("ScgShowInList") = LogRS.fields("ScgShowInList")
            
        ElseIf blnStudMast = True Then
            .fields("SdtRegNo") = LogRS.fields("SdtRegNo")
            .fields("SdtRegDate") = LogRS.fields("SdtRegDate")
            .fields("SdtSex") = LogRS.fields("SdtSex")
            .fields("SdtAgeAsOnDt") = LogRS.fields("SdtAgeAsOnDt")
            .fields("SdtDob") = LogRS.fields("SdtDob")
            .fields("SdtAhCode") = LogRS.fields("SdtAhCode")
            .fields("SdtScgCode") = LogRS.fields("SdtScgCode")
            .fields("SdtRefRela") = LogRS.fields("SdtRefRela")
            .fields("SdtRefName") = LogRS.fields("SdtRefName")
            .fields("SdtAddr") = LogRS.fields("SdtAddr")
            .fields("SdtAraCode") = LogRS.fields("SdtAraCode")
            .fields("SdtStnCode") = LogRS.fields("SdtStnCode")
            .fields("SdtTelNo") = LogRS.fields("SdtTelNo")
            .fields("SdtSMSNo") = LogRS.fields("SdtSMSNo")
            .fields("SdtEmail") = LogRS.fields("SdtEmail")
            .fields("SdtShowInList") = LogRS.fields("SdtShowInList")
            .fields("SdtRemark") = LogRS.fields("SdtRemark")
        
        ElseIf blnGodownMast = True Then
            .fields("GdmDesc") = LogRS.fields("GdmDesc")
            
        ElseIf blnBookGrpMast = True Then
            .fields("BgpDesc") = LogRS.fields("BgpDesc")
            
        ElseIf blnBookAthMast = True Then
            .fields("BahDesc") = LogRS.fields("BahDesc")
            
        ElseIf blnBookPubsMast = True Then
            .fields("BpsDesc") = LogRS.fields("BpsDesc")
            
        ElseIf blnBookEdtnMast = True Then
            .fields("BdnDesc") = LogRS.fields("BdnDesc")
            
        ElseIf blnBookMast = True Then
            .fields("BkmDesc") = LogRS.fields("BkmDesc")
            .fields("BkmBgpCode") = LogRS.fields("BkmBgpCode")
            .fields("BkmBahCode") = LogRS.fields("BkmBahCode")
            .fields("BkmBpsCode") = LogRS.fields("BkmBpsCode")
            .fields("BkmBdnCode") = LogRS.fields("BkmBdnCode")
            .fields("BkmPurchRate") = LogRS.fields("BkmPurchRate")
            .fields("BkmMRPRate") = LogRS.fields("BkmMRPRate")
            .fields("BkmSimCode") = LogRS.fields("BkmSimCode")
        
        Else
            ErrorBox "clsNcbMasterEntry_CancelMast_#506_[Undefined Case]"
            
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
m_dbNcbDatabase.CommitTrans

CancelMast = True
GoTo EndSub

errhand:
MsgBox Err.Description
m_dbNcbDatabase.Cancel

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

m_dbNcbDatabase.BeginTrans
With tRecset
.Open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbNcbDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    .fields(mRecStateField) = ChkDeleteRecStatus(.fields(mRecStateField))
    .Update
Else
    ErrorBox "clsNcbMasterEntry_DeleteMast_254"
End If
End With
CloseTable tRecset
m_dbNcbDatabase.CommitTrans

DeleteMast = True
GoTo EndSub

errhand:
MsgBox Err.Description
m_dbNcbDatabase.Cancel

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
.Open "Select * from " & mTableName & "_Log where " & mCodeField & "=" & CStr(mCode) & "", m_dbNcbDatabase, adOpenKeyset, adLockOptimistic
If .EOF = True Then
    m_dbNcbDatabase.BeginTrans
    m_dbNcbDatabase.Execute "Insert into " & mTableName & "_Log" & " Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & ""
    m_dbNcbDatabase.CommitTrans
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
If Chk_ActiveMast() = False Or IIf(ActiveCode > 0, mCode <> ActiveCode, False) Then
    ErrorBox "No Active " & mTitleName & " Entry to Remove Log !!!"
    Exit Function
End If

m_dbNcbDatabase.BeginTrans
m_dbNcbDatabase.Execute "Delete from " & mTableName & "_Log" & " where " & mCodeField & "=" & CStr(mCode)
m_dbNcbDatabase.CommitTrans

Data_RemoveLog = True

End Function

Public Function AddNew() As Boolean
Dim tRecset As New ADODB.Recordset, mCanAddNew As Boolean, mLCount As Integer, mUCount As Integer, acount As Integer

AddNew = False
mCanAddNew = True

If mNameField <> "" Then
    tRecset.Open "Select " & mNameField & " from " & mTableName & " where " & mNameField & "='" & mName_str & "'", m_dbNcbDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.EOF = False Then
        mCanAddNew = False
        ErrorBox "Duplicate Name !!!"
    End If
    CloseTable tRecset
End If

On Error GoTo errhand
mCode_lng = 0
If mCanAddNew = True Then
    m_dbNcbDatabase.BeginTrans
    With tRecset
    .Open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(-0.1) & "", m_dbNcbDatabase, adOpenKeyset, adLockOptimistic
    
    .AddNew
    Rem .Fields(mCodeField) = mCode_lng AutoNumber
    If mNameField <> "" Then
        .fields(mNameField) = mName_str
    End If
    .fields(mRecStateField) = cREC_ADDED
    
    If blnPartyMast = True Then
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
    
    ElseIf blnPartyGrpMast = True Then
        .fields("PgmDesc") = mPgmDesc_str
    
    ElseIf blnSubItmMast = True Then
        .fields("SimDesc") = mSimDesc_str
        .fields("SimSigCode") = mSimSigCode_lng
        .fields("SimPurchRate") = mSimPurchRate_dbl
        .fields("SimMRPRate") = mSimMRPRate_dbl
        .fields("SimSaleRate") = mSimSaleRate_dbl
        .fields("SimItmCode") = mSimItmCode_lng
        
    ElseIf blnSubItmGrpMast = True Then
        .fields("SigDesc") = mSigDesc_str
    
    ElseIf blnStudCatgMast = True Then
        .fields("ScgShowInList") = mScgShowInList_bln
    
    ElseIf blnStudMast = True Then
        .fields("SdtRegNo") = mSdtRegNo_lng
        .fields("SdtRegDate") = mSdtRegDate_dt
        .fields("SdtSex") = mSdtSex_str
        .fields("SdtAgeAsOnDt") = mSdtAgeAsOnDt_dt
        .fields("SdtDob") = mSdtDob_dt
        .fields("SdtAhCode") = mSdtAhCode_lng
        .fields("SdtScgCode") = mSdtScgCode_lng
        .fields("SdtRefRela") = mSdtRefRela_str
        .fields("SdtRefName") = mSdtRefName_str
        .fields("SdtAddr") = mSdtAddr_str
        .fields("SdtAraCode") = mSdtAraCode_lng
        .fields("SdtStnCode") = mSdtStnCode_lng
        .fields("SdtTelNo") = mSdtTelNo_str
        .fields("SdtSMSNo") = mSdtSMSNo_str
        .fields("SdtEmail") = mSdtEmail_str
        .fields("SdtShowInList") = mSdtShowInList_bln
        .fields("SdtRemark") = mSdtRemark_str
        
    ElseIf blnGodownMast = True Then
        .fields("GdmDesc") = mGdmDesc_str
        
    ElseIf blnBookGrpMast = True Then
        .fields("BgpDesc") = mBgpDesc_str
        
    ElseIf blnBookAthMast = True Then
        .fields("BahDesc") = mBahDesc_str
    
    ElseIf blnBookPubsMast = True Then
        .fields("BpsDesc") = mBpsDesc_str
        
    ElseIf blnBookEdtnMast = True Then
        .fields("BdnDesc") = mBdnDesc_str
        
    ElseIf blnBookMast = True Then
        .fields("BkmDesc") = mBkmDesc_str
        .fields("BkmBgpCode") = mBkmBgpCode_lng
        .fields("BkmBahCode") = mBkmBahCode_lng
        .fields("BkmBpsCode") = mBkmBpsCode_lng
        .fields("BkmBdnCode") = mBkmBdnCode_lng
        .fields("BkmPurchRate") = mBkmPurchRate_dbl
        .fields("BkmMRPRate") = mBkmMRPRate_dbl
        .fields("BkmSimCode") = mBkmSimCode_lng
    
    Else
        ErrorBox "clsNcbMasterEntry_AddNew_#807_[Undefined Case]"
        
        
    End If
    .Update
    mCode_lng = .fields(mCodeField)
    aMastTran(mActiveMast) = mCode_lng
    End With
    CloseTable tRecset
    
    m_dbNcbDatabase.CommitTrans
End If
AddNew = True
GoTo EndSub

errhand:
MsgBox Err.Description
m_dbNcbDatabase.Cancel

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Function

End Function

Public Function Update(ByVal mCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset, mCanUpdate As Boolean, mLCount As Integer, mUCount As Integer, acount As Integer

Update = False
mCanUpdate = True

If mNameField <> "" Then
    tRecset.Open "Select " & mNameField & " from " & mTableName & " where " & mNameField & "='" & mName_str & "' and " & mCodeField & "<>" & CStr(mCode) & "", m_dbNcbDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.EOF = False Then
        mCanUpdate = False
        ErrorBox "Duplicate Name !!!"
    End If
    CloseTable tRecset
End If

On Error GoTo errhand
mCode_lng = 0
If mCanUpdate = True Then
    m_dbNcbDatabase.BeginTrans
    With tRecset
    .Open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbNcbDatabase, adOpenKeyset, adLockOptimistic
    
    If mNameField <> "" Then
        .fields(mNameField) = mName_str
    End If
    .fields(mRecStateField) = ChkEditRecStatus(.fields(mRecStateField))
    
    If blnPartyMast = True Then
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
        
    ElseIf blnPartyGrpMast = True Then
        .fields("PgmDesc") = mPgmDesc_str
        
    ElseIf blnSubItmMast = True Then
        .fields("SimDesc") = mSimDesc_str
        .fields("SimSigCode") = mSimSigCode_lng
        .fields("SimPurchRate") = mSimPurchRate_dbl
        .fields("SimMRPRate") = mSimMRPRate_dbl
        .fields("SimSaleRate") = mSimSaleRate_dbl
        .fields("SimItmCode") = mSimItmCode_lng
        
    ElseIf blnSubItmGrpMast = True Then
        .fields("SigDesc") = mSigDesc_str
        
    ElseIf blnStudCatgMast = True Then
        .fields("ScgShowInList") = mScgShowInList_bln
    
    ElseIf blnStudMast = True Then
        .fields("SdtRegNo") = mSdtRegNo_lng
        .fields("SdtRegDate") = mSdtRegDate_dt
        .fields("SdtSex") = mSdtSex_str
        .fields("SdtAgeAsOnDt") = mSdtAgeAsOnDt_dt
        .fields("SdtDob") = mSdtDob_dt
        .fields("SdtAhCode") = mSdtAhCode_lng
        .fields("SdtScgCode") = mSdtScgCode_lng
        .fields("SdtRefRela") = mSdtRefRela_str
        .fields("SdtRefName") = mSdtRefName_str
        .fields("SdtAddr") = mSdtAddr_str
        .fields("SdtAraCode") = mSdtAraCode_lng
        .fields("SdtStnCode") = mSdtStnCode_lng
        .fields("SdtTelNo") = mSdtTelNo_str
        .fields("SdtSMSNo") = mSdtSMSNo_str
        .fields("SdtEmail") = mSdtEmail_str
        .fields("SdtShowInList") = mSdtShowInList_bln
        .fields("SdtRemark") = mSdtRemark_str
        
    ElseIf blnGodownMast = True Then
        .fields("GdmDesc") = mGdmDesc_str
        
    ElseIf blnBookGrpMast = True Then
        .fields("BgpDesc") = mBgpDesc_str
        
    ElseIf blnBookAthMast = True Then
        .fields("BahDesc") = mBahDesc_str
    
    ElseIf blnBookPubsMast = True Then
        .fields("BpsDesc") = mBpsDesc_str
        
    ElseIf blnBookEdtnMast = True Then
        .fields("BdnDesc") = mBdnDesc_str
        
    ElseIf blnBookMast = True Then
        .fields("BkmDesc") = mBkmDesc_str
        .fields("BkmBgpCode") = mBkmBgpCode_lng
        .fields("BkmBahCode") = mBkmBahCode_lng
        .fields("BkmBpsCode") = mBkmBpsCode_lng
        .fields("BkmBdnCode") = mBkmBdnCode_lng
        .fields("BkmPurchRate") = mBkmPurchRate_dbl
        .fields("BkmMRPRate") = mBkmMRPRate_dbl
        .fields("BkmSimCode") = mBkmSimCode_lng
        
    Else
        ErrorBox "clsNcbMasterEntry_Update_#930_[Undefined Case]"
        
    End If
    .Update
    mCode_lng = .fields(mCodeField)
    End With
    CloseTable tRecset
    
    m_dbNcbDatabase.CommitTrans
End If
Update = True
GoTo EndSub

errhand:
MsgBox Err.Description
m_dbNcbDatabase.Cancel

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
.Open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbNcbDatabase, adOpenKeyset, adLockOptimistic
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

If blnPartyMast = True Then
    With tRecset
    .Open "Select * from PurchHdr where PuhPrtCode = " & CStr(mCode) & "", m_dbNcbDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        ChkEntryExist = True
        ErrorBox "Used in Purchase/Sales Return " & CStr(.fields("PuhVchNo")) & " dated " & Dtoc(.fields("PuhDate"))
    End If
    End With
    CloseTable tRecset
    If ChkEntryExist = False Then
        With tRecset
        .Open "Select * from SaleHdr where SahPrtCode = " & CStr(mCode) & "", m_dbNcbDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            ChkEntryExist = True
            ErrorBox "Used in Sales/Purchase Return " & CStr(.fields("SahVchNo")) & " dated " & Dtoc(.fields("SahDate"))
        End If
        End With
        CloseTable tRecset
    End If

ElseIf blnPartyGrpMast = True Then
    With tRecset
    .Open "Select * from PartyMast where PrtPgmCode = " & CStr(mCode) & "", m_dbNcbDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        ChkEntryExist = True
        ErrorBox "Used in Party Master " & CStr(.fields("PrtName"))
    End If
    End With
    CloseTable tRecset

ElseIf blnSubItmMast = True Then
    With tRecset
    .Open "Select * from PurchDtl dtl" _
        & " left join PurchHdr hdr on dtl.PurCode = hdr.PuhCode" _
        & " where PurSimCode = " & CStr(mCode) & "" _
        , m_dbNcbDatabase, adOpenKeyset, adLockReadOnly
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
            , m_dbNcbDatabase, adOpenKeyset, adLockReadOnly
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
    
ElseIf blnSubItmGrpMast = True Then
    With tRecset
    .Open "Select * from SubItmMast where SimSigCode = " & CStr(mCode) & "", m_dbNcbDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        ChkEntryExist = True
        ErrorBox "Used in Item Master " & CStr(.fields("SimName"))
    End If
    End With
    CloseTable tRecset
    
ElseIf blnStudCatgMast = True Then
    With tRecset
    .Open "Select * from StudMast where SdtScgCode=" & CStr(mCode) & "", m_dbNcbDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        ChkEntryExist = True
        ErrorBox "Used in Patient Master " & .fields("SdtName")
    End If
    End With
    CloseTable tRecset
    
ElseIf blnStudMast = True Then
    With tRecset
    .Open "Select * from OutdReg where OpgSdtCode=" & CStr(mCode) & "", m_dbNcbDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        ChkEntryExist = True
        ErrorBox "Used in Outdoor Registration " & CStr(.fields("OpgVchNo")) & " dated " & Dtoc(.fields("OpgDate"))
    End If
    End With
    CloseTable tRecset
    
ElseIf blnGodownMast = True Then
'    With tRecset
'    .Open "Select * from PartyMast where PrtPgmCode = " & CStr(mCode) & "", m_dbNcbDatabase, adOpenKeyset, adLockReadOnly
'    If .RecordCount > 0 Then
        ChkEntryExist = True
'        ErrorBox "Used in Party Master " & CStr(.fields("PrtName"))
'    End If
'    End With
'    CloseTable tRecset
    
ElseIf blnBookGrpMast = True Then
    With tRecset
    .Open "Select * from BookMast where BkmBgpCode = " & CStr(mCode) & "", m_dbNcbDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        ChkEntryExist = True
        ErrorBox "Used in Books Master " & CStr(.fields("BkmName"))
    End If
    End With
    CloseTable tRecset
    
ElseIf blnBookAthMast = True Then
    With tRecset
    .Open "Select * from BookMast where BkmBahCode = " & CStr(mCode) & "", m_dbNcbDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        ChkEntryExist = True
        ErrorBox "Used in Books Master " & CStr(.fields("BkmName"))
    End If
    End With
    CloseTable tRecset
    
ElseIf blnBookPubsMast = True Then
    With tRecset
    .Open "Select * from BookMast where BkmBpsCode = " & CStr(mCode) & "", m_dbNcbDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        ChkEntryExist = True
        ErrorBox "Used in Books Master " & CStr(.fields("BkmName"))
    End If
    End With
    CloseTable tRecset
    
ElseIf blnBookEdtnMast = True Then
    With tRecset
    .Open "Select * from BookMast where BkmBdnCode = " & CStr(mCode) & "", m_dbNcbDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        ChkEntryExist = True
        ErrorBox "Used in Books Master " & CStr(.fields("BkmName"))
    End If
    End With
    CloseTable tRecset
    
ElseIf blnBookMast = True Then
'    With tRecset
'    .Open "Select * from PartyMast where PrtPgmCode = " & CStr(mCode) & "", m_dbNcbDatabase, adOpenKeyset, adLockReadOnly
'    If .RecordCount > 0 Then
        ChkEntryExist = True
'        ErrorBox "Used in Party Master " & CStr(.fields("PrtName"))
'    End If
'    End With
'    CloseTable tRecset
    
    
Else
    ErrorBox "clsNcbMasterEntry_ChkEntryExist_#1001_[Undefined Case]"
End If

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Function

End Function


