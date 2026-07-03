VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsHmsSnglTranEntry"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False

Option Explicit

Dim m_dbBdkDatabase As ADODB.Connection, m_dbAcDatabase As ADODB.Connection
Dim mTableName As String, mCodeField As String, mVchNoField As String, mVtmCodeField As String, mVchDateField As String, mCmpCodeField As String, mRecStateField As String, mTitleName As String
Dim mClassUIdCode As Long, mClassUIdFileName As String, mClassAcsPermFileName As String
Public blnOutdRegTran As Boolean, blnIndrRegTran As Boolean, blnIndrBedStatus As Boolean, blnIndrRgPymtTran As Boolean, blnIndrRgRefdTran As Boolean, blnDoctCatgMast As Boolean, blnDoctMast As Boolean, blnServGrpMast As Boolean, blnServMast As Boolean, blnDiagMast As Boolean, blnPatMast As Boolean
Public mCode_lng As Long, mVchNo_lng As Long, mVtmCode_lng As Long, mVchDate_dt As Date, mCmpCode_int As Integer, mRecState_int As Integer
Public mOpgPrefix_str As String, mOpgPostfix_str As String, mOpgTime_lng As Long, mOpgTime_str As String, mOpgOldOpgCode_lng As Long, mOpgCDctCode_lng As Long, mOpgRByCode_lng As Long, mOpgRToCode_lng As Long, mOpgPttCode_lng As Long, mOpgPDigCode_lng As Long, mOpgFDigCode_lng As Long, mOpgSrvCode_lng As Long, mOpgUnit_lng As Long, mOpgRate_dbl As Double, mOpgAmtBefDisc_dbl As Double, mOpgDiscPer_dbl As Double, mOpgDiscAmt_dbl As Double, mOpgAmtAftDisc_dbl As Double, mOpgRemark_str As String
Public mIpgPrefix_str As String, mIpgPostfix_str As String, mIpgTime_lng As Long, mIpgTime_str As String, mIpgOldIpgCode_lng As Long, mIpgCDctCode_lng As Long, mIpgRByCode_lng As Long, mIpgRToCode_lng As Long, mIpgPttCode_lng As Long, mIpgPDigCode_lng As Long, mIpgFDigCode_lng As Long, mIpgBdmCode_lng As Long, mIpgIbsCode_lng As Long, mIpgAdvAmt_dbl As Double, mIpgRemark_str As String, mIpgDischDate_dt As Date, mIpgDischTime_lng As Long
Public mIbsSno_int As Integer, mIbsPrefix_str As String, mIbsPostfix_str As String, mIbsTime_lng As Long, mIbsTime_str As String, mIbsIpgCode_lng As Long, mIbsBdmCode_lng As Long, mIbsDischDate_dt As Date, mIbsDischTime_lng As Long, mIbsDischTime_str As String, mIbsPttCode_lng As Long, mIbsDischState_int As Integer, mIbsDischState_str As String, mIbsLIbsCode_lng As Long, mIbsRemark_str As String
Public mIgtIpgCode_lng As Long, mIgtPrefix_str As String, mIgtPostfix_str As String, mIgtTime_lng As Long, mIgtTime_str As String, mIgtOldIgtCode_lng As Long, mIgtPttCode_lng As Long, mIgtDpogAmt_dbl As Double, mIgtAdjAmt_dbl As Double, mIgtBalAmt_dbl As Double, mIgtRemark_str As String
Public mIgfIpgCode_lng As Long, mIgfPrefix_str As String, mIgfPostfix_str As String, mIgfTime_lng As Long, mIgfTime_str As String, mIgfOldIgfCode_lng As Long, mIgfPttCode_lng As Long, mIgfRfugAmt_dbl As Double, mIgfAdjAmt_dbl As Double, mIgfBalAmt_dbl As Double, mIgfRemark_str As String
Dim mActiveTran As Integer, aTranList() As Variant

Public Sub Init()
If blnOutdRegTran = True Then
    mTableName = "OutdReg"
    mCodeField = "OpgCode"
    mVchNoField = "OpgVchNo"
    mVtmCodeField = "OpgVtmCode"
    mVchDateField = "OpgDate"
    mCmpCodeField = "OpgCmpCode"
    mRecStateField = "OpgRecState"
    mTitleName = "Outdoor Registration"

ElseIf blnIndrRegTran = True Then
    mTableName = "IndrReg"
    mCodeField = "IpgCode"
    mVchNoField = "IpgVchNo"
    mVtmCodeField = "IpgVtmCode"
    mVchDateField = "IpgDate"
    mCmpCodeField = "IpgCmpCode"
    mRecStateField = "IpgRecState"
    mTitleName = "Indoor Registration"
    
ElseIf blnIndrBedStatus = True Then
    mTableName = "IBedState"
    mCodeField = "IbsCode"
    mVchNoField = "IbsVchNo"
    mVtmCodeField = "IbsVtmCode"
    mVchDateField = "IbsDate"
    mCmpCodeField = "IbsCmpCode"
    mRecStateField = "IbsRecState"
    mTitleName = "Indoor Bed Status"
    
ElseIf blnIndrRgPymtTran = True Then
    mTableName = "IndrRgPymt"
    mCodeField = "IgtCode"
    mVchNoField = "IgtVchNo"
    mVtmCodeField = "IgtVtmCode"
    mVchDateField = "IgtDate"
    mCmpCodeField = "IgtCmpCode"
    mRecStateField = "IgtRecState"
    mTitleName = "Indoor On A/c.Payment"
    
ElseIf blnIndrRgRefdTran = True Then
    mTableName = "IndrRgRefd"
    mCodeField = "IgfCode"
    mVchNoField = "IgfVchNo"
    mVtmCodeField = "IgfVtmCode"
    mVchDateField = "IgfDate"
    mCmpCodeField = "IgfCmpCode"
    mRecStateField = "IgfRecState"
    mTitleName = "Indoor On A/c.Refund"
    
''ElseIf blnDoctCatgMast = True Then
''    mTableName = "DoctCatgMst"
''    mCodeField = "DcgCode"
''    mVchNoField = "DcgName"
''    mRecStateField = "DcgRecState"
''    mTitleName = "Doctor Category Master"
''
''ElseIf blnDoctMast = True Then
''    mTableName = "DoctMast"
''    mCodeField = "DctCode"
''    mVchNoField = "DctName"
''    mRecStateField = "DctRecState"
''    mTitleName = "Doctor Master"
''
''ElseIf blnServGrpMast = True Then
''    mTableName = "ServGrpMst"
''    mCodeField = "SgpCode"
''    mVchNoField = "SgpName"
''    mRecStateField = "SgpRecState"
''    mTitleName = "Service Group Master"
''
''ElseIf blnServMast = True Then
''    mTableName = "ServMast"
''    mCodeField = "SrvCode"
''    mVchNoField = "SrvName"
''    mRecStateField = "SrvRecState"
''    mTitleName = "Service Master"
''
''ElseIf blnDiagMast = True Then
''    mTableName = "DiagMast"
''    mCodeField = "DigCode"
''    mVchNoField = "DigName"
''    mRecStateField = "DigRecState"
''    mTitleName = "Diagnostic Master"
''
''ElseIf blnPatMast = True Then
''    mTableName = "PatMast"
''    mCodeField = "PttCode"
''    mVchNoField = "PttName"
''    mRecStateField = "PttRecState"
''    mTitleName = "Patient Master"
    
Else
    ErrorBox "clsHmsSnglTranEntry_Init_#68_[Undefined Case]"
End If

End Sub

Public Property Set dbBdkDatabase(ByRef db As ADODB.Connection)
Set m_dbBdkDatabase = db

End Property

Public Property Set dbAcDatabase(ByRef db As ADODB.Connection)
Set m_dbAcDatabase = db

End Property

Private Sub Class_Initialize()
aTranList = Array()
mActiveTran = UBound(aTranList)

mClassUIdFileName = "HmsSTrEn.UId"
mClassAcsPermFileName = "HmsSTrEn.Acp"
mClassUIdCode = GetUIdCode("clsHmsSnglTranEntry_Initialize", mUIdFileName:=mClassUIdFileName, mAcsPermFileName:=mClassAcsPermFileName)

End Sub

Public Sub GetData(ByVal mCode As Long)
Dim tRecset As New ADODB.Recordset, acount As Integer

Me.Clear
With tRecset
.open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    mCode_lng = .fields(mCodeField)
    mVchNo_lng = .fields(mVchNoField)
    mVtmCode_lng = .fields(mVtmCodeField)
    mVchDate_dt = .fields(mVchDateField)
    mCmpCode_int = .fields(mCmpCodeField)
    mRecState_int = .fields(mRecStateField)
    
    If blnOutdRegTran = True Then
        mOpgPrefix_str = .fields("OpgPrefix")
        mOpgPostfix_str = .fields("OpgPostfix")
        mOpgTime_lng = .fields("OpgTime")
        mOpgTime_str = MinToTime(.fields("OpgTime"))
        mOpgOldOpgCode_lng = .fields("OpgOldOpgCode")
        mOpgCDctCode_lng = .fields("OpgCDctCode")
        mOpgRByCode_lng = .fields("OpgRByCode")
        mOpgRToCode_lng = .fields("OpgRToCode")
        mOpgPttCode_lng = .fields("OpgPttCode")
        mOpgPDigCode_lng = .fields("OpgPDigCode")
        mOpgFDigCode_lng = .fields("OpgFDigCode")
        mOpgSrvCode_lng = .fields("OpgSrvCode")
        mOpgUnit_lng = .fields("OpgUnit")
        mOpgRate_dbl = .fields("OpgRate")
        mOpgAmtBefDisc_dbl = .fields("OpgAmtBefDisc")
        mOpgDiscPer_dbl = .fields("OpgDiscPer")
        mOpgDiscAmt_dbl = .fields("OpgDiscAmt")
        mOpgAmtAftDisc_dbl = .fields("OpgAmtAftDisc")
        mOpgRemark_str = .fields("OpgRemark")
        
    ElseIf blnIndrRegTran = True Then
        mIpgPrefix_str = .fields("IpgPrefix")
        mIpgPostfix_str = .fields("IpgPostfix")
        mIpgTime_lng = .fields("IpgTime")
        mIpgTime_str = MinToTime(.fields("IpgTime"))
        mIpgOldIpgCode_lng = .fields("IpgOldIpgCode")
        mIpgCDctCode_lng = .fields("IpgCDctCode")
        mIpgRByCode_lng = .fields("IpgRByCode")
        mIpgRToCode_lng = .fields("IpgRToCode")
        mIpgPttCode_lng = .fields("IpgPttCode")
        mIpgPDigCode_lng = .fields("IpgPDigCode")
        mIpgFDigCode_lng = .fields("IpgFDigCode")
        mIpgBdmCode_lng = .fields("IpgBdmCode")
        mIpgIbsCode_lng = .fields("IpgIbsCode")
        mIpgAdvAmt_dbl = .fields("IpgAdvAmt")
        mIpgRemark_str = .fields("IpgRemark")
        mIpgDischDate_dt = .fields("IpgDischDate")
        mIpgDischTime_lng = .fields("IpgDischTime")
        
    ElseIf blnIndrBedStatus = True Then
        mIbsSno_int = .fields("IbsSno")
        mIbsPrefix_str = .fields("IbsPrefix")
        mIbsPostfix_str = .fields("IbsPostfix")
        mIbsTime_lng = .fields("IbsTime")
        mIbsTime_str = MinToTime(.fields("IbsTime"))
        mIbsIpgCode_lng = .fields("IbsIpgCode")
        mIbsBdmCode_lng = .fields("IbsBdmCode")
        mIbsDischDate_dt = .fields("IbsDischDate")
        mIbsDischTime_lng = .fields("IbsDischTime")
        mIbsDischTime_str = MinToTime(.fields("IbsDischTime"))
        mIbsPttCode_lng = .fields("IbsPttCode")
        mIbsDischState_int = .fields("IbsDischState")
        mIbsDischState_str = GetMidPosStr(cIPD_DISCHARGE_STATE, .fields("IbsDischState"), ",")
        mIbsLIbsCode_lng = .fields("IbsLIbsCode")
        mIbsRemark_str = .fields("IbsRemark")
        
    ElseIf blnIndrRgPymtTran = True Then
        mIgtIpgCode_lng = .fields("IgtIpgCode")
        mIgtPrefix_str = .fields("IgtPrefix")
        mIgtPostfix_str = .fields("IgtPostfix")
        mIgtTime_lng = .fields("IgtTime")
        mIgtTime_str = MinToTime(.fields("IgtTime"))
        mIgtOldIgtCode_lng = .fields("IgtOldIgtCode")
        mIgtPttCode_lng = .fields("IgtPttCode")
        mIgtDpogAmt_dbl = .fields("IgtDpogAmt")
        mIgtAdjAmt_dbl = .fields("IgtAdjAmt")
        mIgtBalAmt_dbl = .fields("IgtBalAmt")
        mIgtRemark_str = .fields("IgtRemark")
        
    ElseIf blnIndrRgRefdTran = True Then
        mIgfIpgCode_lng = .fields("IgfIpgCode")
        mIgfPrefix_str = .fields("IgfPrefix")
        mIgfPostfix_str = .fields("IgfPostfix")
        mIgfTime_lng = .fields("IgfTime")
        mIgfTime_str = MinToTime(.fields("IgfTime"))
        mIgfOldIgfCode_lng = .fields("IgfOldIgfCode")
        mIgfPttCode_lng = .fields("IgfPttCode")
        mIgfRfugAmt_dbl = .fields("IgfRfugAmt")
        mIgfAdjAmt_dbl = .fields("IgfAdjAmt")
        mIgfBalAmt_dbl = .fields("IgfBalAmt")
        mIgfRemark_str = .fields("IgfRemark")
        
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
mVchNo_lng = 0
mVtmCode_lng = 0
mVchDate_dt = cUNKNOWNDATE
mCmpCode_int = 0
mRecState_int = 0

If blnOutdRegTran = True Then
    mOpgPrefix_str = ""
    mOpgPostfix_str = ""
    mOpgTime_lng = 0
    mOpgTime_str = MinToTime(0)
    mOpgOldOpgCode_lng = 0
    mOpgCDctCode_lng = 0
    mOpgRByCode_lng = 0
    mOpgRToCode_lng = 0
    mOpgPttCode_lng = 0
    mOpgPDigCode_lng = 0
    mOpgFDigCode_lng = 0
    mOpgSrvCode_lng = 0
    mOpgUnit_lng = 0
    mOpgRate_dbl = 0
    mOpgAmtBefDisc_dbl = 0
    mOpgDiscPer_dbl = 0
    mOpgDiscAmt_dbl = 0
    mOpgAmtAftDisc_dbl = 0
    mOpgRemark_str = ""
    
ElseIf blnIndrRegTran = True Then
    mIpgPrefix_str = ""
    mIpgPostfix_str = ""
    mIpgTime_lng = 0
    mIpgTime_str = MinToTime(0)
    mIpgOldIpgCode_lng = 0
    mIpgCDctCode_lng = 0
    mIpgRByCode_lng = 0
    mIpgRToCode_lng = 0
    mIpgPttCode_lng = 0
    mIpgPDigCode_lng = 0
    mIpgFDigCode_lng = 0
    mIpgBdmCode_lng = 0
    mIpgIbsCode_lng = 0
    mIpgAdvAmt_dbl = 0
    mIpgRemark_str = ""
    mIpgDischDate_dt = cUNKNOWNDATE
    mIpgDischTime_lng = 0
    
ElseIf blnIndrBedStatus = True Then
    mIbsSno_int = 0
    mIbsPrefix_str = ""
    mIbsPostfix_str = ""
    mIbsTime_lng = 0
    mIbsTime_str = ""
    mIbsIpgCode_lng = 0
    mIbsBdmCode_lng = 0
    mIbsDischDate_dt = cUNKNOWNDATE
    mIbsDischTime_lng = 0
    mIbsDischTime_str = ""
    mIbsPttCode_lng = 0
    mIbsDischState_int = 0
    mIbsDischState_str = ""
    mIbsLIbsCode_lng = 0
    mIbsRemark_str = ""
    
ElseIf blnIndrRgPymtTran = True Then
    mIgtIpgCode_lng = 0
    mIgtPrefix_str = ""
    mIgtPostfix_str = ""
    mIgtTime_lng = 0
    mIgtTime_str = ""
    mIgtOldIgtCode_lng = 0
    mIgtPttCode_lng = 0
    mIgtDpogAmt_dbl = 0
    mIgtAdjAmt_dbl = 0
    mIgtBalAmt_dbl = 0
    mIgtRemark_str = ""
    
ElseIf blnIndrRgRefdTran = True Then
    mIgfIpgCode_lng = 0
    mIgfPrefix_str = ""
    mIgfPostfix_str = ""
    mIgfTime_lng = 0
    mIgfTime_str = ""
    mIgfOldIgfCode_lng = 0
    mIgfPttCode_lng = 0
    mIgfRfugAmt_dbl = 0
    mIgfAdjAmt_dbl = 0
    mIgfBalAmt_dbl = 0
    mIgfRemark_str = ""

    
End If

End Sub

Private Sub Class_Terminate()
If UBound(aTranList) >= LBound(aTranList) Then
    ErrorBox mTitleName & " Entry in Process !!!"
End If

End Sub

Rem mInhCode -> Inherited Code from any Other Table
Public Function BeginTran(ByVal mCode As Long, Optional ByVal mInhCode) As Boolean
Dim tRecset As New ADODB.Recordset
BeginTran = False

If mCode = 0 Then
    If IsMissing(mInhCode) = False Then
        mCode = mInhCode
    Else
        mCode = GetUIdCode("clsHmsSnglTranEntry_BeginTran", mUIdFileName:=mClassUIdFileName, mAcsPermFileName:=mClassAcsPermFileName) * -1       '  GetNextSeqno(m_dbBdkDatabase, mTableName, mCodeField)
    End If
    If mCode = 0 Then
        ErrorBox mTitleName & " Entry Failed !!!"
        GoTo EndSub
    End If
ElseIf mCode > 0 Then
    tRecset.open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.EOF = True Then
        ErrorBox mTitleName & " Entry not Found !!!"
        GoTo EndSub
    End If
    CloseTable tRecset
Else
    ErrorBox "Invalid " & mTitleName & " Entry !!!"
    GoTo EndSub
End If
mActiveTran = UBound(aTranList) + 1
ReDim Preserve aTranList(mActiveTran)
aTranList(mActiveTran) = mCode

Call Data_CreateLog(mCode)

BeginTran = True

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Function

End Function

Public Function EndTran(ByVal mCode As Long) As Boolean
Dim mCnt As Integer
EndTran = False
If Chk_ActiveTran() = False Or IIf(ActiveCode > 0, mCode <> ActiveCode, False) Then
    ErrorBox "No Active " & mTitleName & " Entry !!!"
    Exit Function
End If
Call Data_RemoveLog(mCode)

For mCnt = (mActiveTran + 1) To UBound(aTranList)
    If (mCnt - 1) >= LBound(aTranList) Then
        aTranList(mCnt - 1) = aTranList(mCnt)
    End If
Next mCnt
If LBound(aTranList) = UBound(aTranList) Then
    aTranList = Array()
Else
    ReDim Preserve aTranList(UBound(aTranList) - 1)
End If
If mActiveTran > UBound(aTranList) Then
    mActiveTran = mActiveTran - 1
End If

EndTran = True
End Function

Public Property Get ActiveCode() As Long
On Error GoTo errhand

ActiveCode = aTranList(mActiveTran)

Exit Property

errhand:
ErrorBox Err.Description
ActiveCode = -1
Exit Property

End Property

Rem update transactional sum up, physically deletes records marked for deletion or marks ok records for added or edited
Public Function UpdateTran(ByVal mCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset
UpdateTran = False

On Error GoTo errhand

m_dbBdkDatabase.BeginTrans
Rem updating Master
With tRecset
.open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
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
m_dbBdkDatabase.CommitTrans

UpdateTran = True
GoTo EndSub

errhand:
MsgBox Err.Description
m_dbBdkDatabase.Cancel

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Function

End Function

Rem checks entries with log table, if log exist restores log records else delete records (assuming new records added), balance updation part not done here because master entries does not have effect while in process
Public Function CancelTran(ByVal mCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset, LogRS As New ADODB.Recordset
Dim mRecEdited As Boolean, mRecDeleted As Boolean

CancelTran = False
If Chk_ActiveTran() = False Or mCode <> ActiveCode Then
    ErrorBox "No Active " & mTitleName & " Entry to Cancel !!!"
    GoTo EndSub
End If
'mCode = ActiveCode
On Error GoTo errhand

m_dbBdkDatabase.BeginTrans
With tRecset
.open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
LogRS.open "Select * from " & mTableName & "_Log where " & mCodeField & "=" & CStr(mCode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    If LogRS.EOF = False Then
        ' any prior updations can be made here
        .fields(mVchNoField) = LogRS.fields(mVchNoField)
        .fields(mVtmCodeField) = LogRS.fields(mVtmCodeField)
        .fields(mVchDateField) = LogRS.fields(mVchDateField)
        .fields(mCmpCodeField) = LogRS.fields(mCmpCodeField)
        .fields(mRecStateField) = LogRS.fields(mRecStateField)
        
        If blnOutdRegTran = True Then
            .fields("OpgPrefix") = LogRS.fields("OpgPrefix")
            .fields("OpgPostfix") = LogRS.fields("OpgPostfix")
            .fields("OpgTime") = LogRS.fields("OpgTime")
            .fields("OpgOldOpgCode") = LogRS.fields("OpgOldOpgCode")
            .fields("OpgCDctCode") = LogRS.fields("OpgCDctCode")
            .fields("OpgRByCode") = LogRS.fields("OpgRByCode")
            .fields("OpgRToCode") = LogRS.fields("OpgRToCode")
            .fields("OpgPttCode") = LogRS.fields("OpgPttCode")
            .fields("OpgPDigCode") = LogRS.fields("OpgPDigCode")
            .fields("OpgFDigCode") = LogRS.fields("OpgFDigCode")
            .fields("OpgSrvCode") = LogRS.fields("OpgSrvCode")
            .fields("OpgUnit") = LogRS.fields("OpgUnit")
            .fields("OpgRate") = LogRS.fields("OpgRate")
            .fields("OpgAmtBefDisc") = LogRS.fields("OpgAmtBefDisc")
            .fields("OpgDiscPer") = LogRS.fields("OpgDiscPer")
            .fields("OpgDiscAmt") = LogRS.fields("OpgDiscAmt")
            .fields("OpgAmtAftDisc") = LogRS.fields("OpgAmtAftDisc")
            .fields("OpgRemark") = LogRS.fields("OpgRemark")
            
        ElseIf blnIndrRegTran = True Then
            .fields("IpgPrefix") = LogRS.fields("IpgPrefix")
            .fields("IpgPostfix") = LogRS.fields("IpgPostfix")
            .fields("IpgTime") = LogRS.fields("IpgTime")
            .fields("IpgOldIpgCode") = LogRS.fields("IpgOldIpgCode")
            .fields("IpgCDctCode") = LogRS.fields("IpgCDctCode")
            .fields("IpgRByCode") = LogRS.fields("IpgRByCode")
            .fields("IpgRToCode") = LogRS.fields("IpgRToCode")
            .fields("IpgPttCode") = LogRS.fields("IpgPttCode")
            .fields("IpgPDigCode") = LogRS.fields("IpgPDigCode")
            .fields("IpgFDigCode") = LogRS.fields("IpgFDigCode")
            .fields("IpgBdmCode") = LogRS.fields("IpgBdmCode")
            .fields("IpgIbsCode") = LogRS.fields("IpgIbsCode")
            .fields("IpgAdvAmt") = LogRS.fields("IpgAdvAmt")
            .fields("IpgRemark") = LogRS.fields("IpgRemark")
            .fields("IpgDischDate") = LogRS.fields("IpgDischDate")
            .fields("IpgDischTime") = LogRS.fields("IpgDischTime")
    
        ElseIf blnIndrBedStatus = True Then
            .fields("IbsSno") = LogRS.fields("IbsSno")
            .fields("IbsPrefix") = LogRS.fields("IbsPrefix")
            .fields("IbsPostfix") = LogRS.fields("IbsPostfix")
            .fields("IbsTime") = LogRS.fields("IbsTime")
            .fields("IbsIpgCode") = LogRS.fields("IbsIpgCode")
            .fields("IbsBdmCode") = LogRS.fields("IbsBdmCode")
            .fields("IbsDischDate") = LogRS.fields("IbsDischDate")
            .fields("IbsDischTime") = LogRS.fields("IbsDischTime")
            .fields("IbsPttCode") = LogRS.fields("IbsPttCode")
            .fields("IbsDischState") = LogRS.fields("IbsDischState")
            .fields("IbsLIbsCode") = LogRS.fields("IbsLIbsCode")
            .fields("IbsRemark") = LogRS.fields("IbsRemark")
            
            If .fields("IbsLIbsCode") <> 0 Then
                m_dbBdkDatabase.Execute "Update IBedState set IbsDischDate=#" & CStr(.fields(mVchDateField)) & "#,IbsDischTime=" & CStr(.fields("IbsTime")) & ",IbsDischState=" & CStr(cIBS_STATE_SHIFTED) & " where IbsCode=" & CStr(.fields("IbsLIbsCode"))
            End If
            
        ElseIf blnIndrRgPymtTran = True Then
            .fields("IgtIpgCode") = LogRS.fields("IgtIpgCode")
            .fields("IgtPrefix") = LogRS.fields("IgtPrefix")
            .fields("IgtPostfix") = LogRS.fields("IgtPostfix")
            .fields("IgtTime") = LogRS.fields("IgtTime")
            .fields("IgtTime") = LogRS.fields("IgtTime")
            .fields("IgtOldIgtCode") = LogRS.fields("IgtOldIgtCode")
            .fields("IgtPttCode") = LogRS.fields("IgtPttCode")
            .fields("IgtDpogAmt") = LogRS.fields("IgtDpogAmt")
            .fields("IgtAdjAmt") = LogRS.fields("IgtAdjAmt")
            .fields("IgtBalAmt") = LogRS.fields("IgtBalAmt")
            .fields("IgtRemark") = LogRS.fields("IgtRemark")
            
        ElseIf blnIndrRgRefdTran = True Then
            .fields("IgfIpgCode") = .fields("IgfIpgCode")
            .fields("IgfPrefix") = .fields("IgfPrefix")
            .fields("IgfPostfix") = .fields("IgfPostfix")
            .fields("IgfTime") = .fields("IgfTime")
            .fields("IgfTime") = .fields("IgfTime")
            .fields("IgfOldIgfCode") = .fields("IgfOldIgfCode")
            .fields("IgfPttCode") = .fields("IgfPttCode")
            .fields("IgfRfugAmt") = .fields("IgfRfugAmt")
            .fields("IgfAdjAmt") = .fields("IgfAdjAmt")
            .fields("IgfBalAmt") = .fields("IgfBalAmt")
            .fields("IgfRemark") = .fields("IgfRemark")
            
            
        End If
        .Update
    Else
        If blnIndrBedStatus = True Then
            If .fields("IbsLIbsCode") <> 0 Then
                m_dbBdkDatabase.Execute "Update IBedState set IbsDischDate=#" & CStr(cUNKNOWNDATE) & "#,IbsDischTime=" & CStr(0) & ",IbsDischState=" & CStr(cIBS_STATE_OCCUPIED) & " where IbsCode=" & CStr(.fields("IbsLIbsCode"))
            End If
        End If
        
        ' any prior updations can be made here
        .fields(mRecStateField) = ChkDeleteRecStatus(.fields(mRecStateField))
        .Update
        .Delete
    End If
End If
End With
CloseTable tRecset
CloseTable LogRS
m_dbBdkDatabase.CommitTrans

CancelTran = True
GoTo EndSub

errhand:
MsgBox Err.Description
m_dbBdkDatabase.Cancel

EndSub:
CloseTable tRecset, mCheckOpen:=True
CloseTable LogRS, mCheckOpen:=True
Exit Function

End Function

Rem marking records for deletion
Public Function DeleteTran(ByVal mCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset
DeleteTran = False
If Chk_ActiveTran() = False Or mCode <> ActiveCode Then
    ErrorBox "No Active " & mTitleName & " Entry to Delete !!!"
    GoTo EndSub
End If
On Error GoTo errhand

m_dbBdkDatabase.BeginTrans
With tRecset
.open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    If blnIndrBedStatus = True Then
        If .fields("IbsLIbsCode") <> 0 Then
            m_dbBdkDatabase.Execute "Update IBedState set IbsDischDate=#" & CStr(cUNKNOWNDATE) & "#,IbsDischTime=" & CStr(0) & ",IbsDischState=" & CStr(cIBS_STATE_OCCUPIED) & " where IbsCode=" & CStr(.fields("IbsLIbsCode"))
        End If
    End If
    .fields(mRecStateField) = ChkDeleteRecStatus(.fields(mRecStateField))
    .Update
    
Else
    ErrorBox "clsHmsSnglTranEntry_DeleteTran_254"
End If
End With
CloseTable tRecset
m_dbBdkDatabase.CommitTrans

DeleteTran = True
GoTo EndSub

errhand:
MsgBox Err.Description
m_dbBdkDatabase.Cancel

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Function

End Function

Public Function SelectTran(ByVal mCode As Long) As Boolean
Dim mEntryFound As Boolean
SelectTran = False
If mCode < 1 Then
    ErrorBox "Invalid " & mTitleName & " Entry !!!"
    Exit Function
End If
mEntryFound = False
For mActiveTran = LBound(aTranList) To UBound(aTranList)
    If aTranList(mActiveTran) = mCode Then
        mEntryFound = True
        Exit For
    End If
Next mActiveTran
If mEntryFound = False Then
    mActiveTran = UBound(aTranList) + 1
End If

SelectTran = True
End Function

Public Function NextTran() As Boolean
NextTran = False
If EOTran = True Then
    ErrorBox "End of " & mTitleName & " Entry !!!"
    Exit Function
End If
mActiveTran = mActiveTran + 1

NextTran = True
End Function

Public Function PreviousTran()
PreviousTran = False
If BOTran = True Then
    ErrorBox "Begining of " & mTitleName & " Entry !!!"
    Exit Function
End If
mActiveTran = mActiveTran - 1

PreviousTran = True
End Function

Public Function FirstTran() As Boolean
FirstTran = False
If CountTran = 0 Then
    ErrorBox "No " & mTitleName & " Entry !!!"
    Exit Function
End If
mActiveTran = LBound(aTranList)

FirstTran = True

End Function

Public Function LastTran() As Boolean
LastTran = False
If CountTran = 0 Then
    ErrorBox "No " & mTitleName & " Entry !!!"
    Exit Function
End If
mActiveTran = UBound(aTranList)

LastTran = True

End Function

Public Property Get CountTran() As Integer
If UBound(aTranList) = -1 Then
    CountTran = 0
Else
    CountTran = UBound(aTranList) - LBound(aTranList) + 1
End If

End Property

Public Property Get EOTran() As Boolean
EOTran = (mActiveTran > UBound(aTranList) Or UBound(aTranList) = -1)

End Property

Public Property Get BOTran() As Boolean
BOTran = (mActiveTran < LBound(aTranList) Or UBound(aTranList) = -1)

End Property

Public Function Chk_ActiveTran() As Boolean
If BOTran = False And EOTran = False Then
    Chk_ActiveTran = True
Else
    Chk_ActiveTran = False
End If

End Function

Private Function Data_CreateLog(ByVal mCode As Long) As Boolean
Dim LogRS As New ADODB.Recordset

Data_CreateLog = False
If Chk_ActiveTran() = False Or mCode <> ActiveCode Then
    ErrorBox "No Active " & mTitleName & " Entry to Create Log !!!"
    GoTo EndSub
End If

With LogRS
.open "Select * from " & mTableName & "_Log where " & mCodeField & "=" & CStr(mCode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
If .EOF = True Then
    m_dbBdkDatabase.BeginTrans
    m_dbBdkDatabase.Execute "Insert into " & mTableName & "_Log" & " Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & ""
    m_dbBdkDatabase.CommitTrans
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
If Chk_ActiveTran() = False Or mCode <> ActiveCode Then
    ErrorBox "No Active " & mTitleName & " Entry to Remove Log !!!"
    Exit Function
End If

m_dbBdkDatabase.BeginTrans
m_dbBdkDatabase.Execute "Delete from " & mTableName & "_Log" & " where " & mCodeField & "=" & CStr(mCode)
m_dbBdkDatabase.CommitTrans

Data_RemoveLog = True

End Function

Public Function AddNew(Optional ByVal mInhCode) As Boolean
Dim tRecset As New ADODB.Recordset, mCanAddNew As Boolean, mLCount As Integer, mUCount As Integer, acount As Integer

AddNew = False
mCanAddNew = True
If blnIndrBedStatus = False Then    ' not required in IBedState
    If ChkIsDuplVTypeNo(m_dbBdkDatabase, m_dbAcDatabase, mTableName:=mTableName, mChkFieldName:=mVchNoField, mChkFieldValue:=mVchNo_lng, mKeyFieldName:=mCodeField, mKeyFieldValue:=mCode_lng, mVtmFieldName:=mVtmCodeField, mVtmFieldValue:=mVtmCode_lng, mFinYrFieldName:=mCmpCodeField, mFinYrFieldValue:=mCmpCode_int, mDateFieldName:=mVchDateField, mDateFieldValue:=mVchDate_dt) = True Then
        mCanAddNew = False
        ErrorBox "Duplicate Voucher No. !!!"
    End If
End If
Rem apply above duplicate voucher no. checking in all transactional updates (in multitran also)

On Error GoTo errhand
mCode_lng = 0
If mCanAddNew = True Then
    m_dbBdkDatabase.BeginTrans
    With tRecset
    .open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(-0.1) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
    
    .AddNew
    If IsMissing(mInhCode) = False Then
        .fields(mCodeField) = mInhCode
    Else
        Rem .Fields(mCodeField) = mCode_lng AutoNumber
    End If
    .fields(mVchNoField) = mVchNo_lng
    .fields(mVtmCodeField) = mVtmCode_lng
    .fields(mVchDateField) = mVchDate_dt
    .fields(mCmpCodeField) = mCmpCode_int
    .fields(mRecStateField) = cREC_ADDED
    
    If blnOutdRegTran = True Then
        .fields("OpgPrefix") = mOpgPrefix_str
        .fields("OpgPostfix") = mOpgPostfix_str
        .fields("OpgTime") = mOpgTime_lng
        .fields("OpgOldOpgCode") = mOpgOldOpgCode_lng
        .fields("OpgCDctCode") = mOpgCDctCode_lng
        .fields("OpgRByCode") = mOpgRByCode_lng
        .fields("OpgRToCode") = mOpgRToCode_lng
        .fields("OpgPttCode") = mOpgPttCode_lng
        .fields("OpgPDigCode") = mOpgPDigCode_lng
        .fields("OpgFDigCode") = mOpgFDigCode_lng
        .fields("OpgSrvCode") = mOpgSrvCode_lng
        .fields("OpgUnit") = mOpgUnit_lng
        .fields("OpgRate") = mOpgRate_dbl
        .fields("OpgAmtBefDisc") = mOpgAmtBefDisc_dbl
        .fields("OpgDiscPer") = mOpgDiscPer_dbl
        .fields("OpgDiscAmt") = mOpgDiscAmt_dbl
        .fields("OpgAmtAftDisc") = mOpgAmtAftDisc_dbl
        .fields("OpgRemark") = mOpgRemark_str
    
    ElseIf blnIndrRegTran = True Then
        .fields("IpgPrefix") = mIpgPrefix_str
        .fields("IpgPostfix") = mIpgPostfix_str
        .fields("IpgTime") = mIpgTime_lng
        .fields("IpgOldIpgCode") = mIpgOldIpgCode_lng
        .fields("IpgCDctCode") = mIpgCDctCode_lng
        .fields("IpgRByCode") = mIpgRByCode_lng
        .fields("IpgRToCode") = mIpgRToCode_lng
        .fields("IpgPttCode") = mIpgPttCode_lng
        .fields("IpgPDigCode") = mIpgPDigCode_lng
        .fields("IpgFDigCode") = mIpgFDigCode_lng
        .fields("IpgBdmCode") = mIpgBdmCode_lng
        .fields("IpgIbsCode") = mIpgIbsCode_lng
        .fields("IpgAdvAmt") = mIpgAdvAmt_dbl
        .fields("IpgRemark") = mIpgRemark_str
        .fields("IpgDischDate") = mIpgDischDate_dt
        .fields("IpgDischTime") = mIpgDischTime_lng
    
    ElseIf blnIndrBedStatus = True Then
        .fields("IbsSno") = mIbsSno_int
        .fields("IbsPrefix") = mIbsPrefix_str
        .fields("IbsPostfix") = mIbsPostfix_str
        .fields("IbsTime") = mIbsTime_lng
        .fields("IbsIpgCode") = mIbsIpgCode_lng
        .fields("IbsBdmCode") = mIbsBdmCode_lng
        .fields("IbsDischDate") = mIbsDischDate_dt
        .fields("IbsDischTime") = mIbsDischTime_lng
        .fields("IbsPttCode") = mIbsPttCode_lng
        .fields("IbsDischState") = mIbsDischState_int
        .fields("IbsLIbsCode") = mIbsLIbsCode_lng
        .fields("IbsRemark") = mIbsRemark_str
    
    ElseIf blnIndrRgPymtTran = True Then
        .fields("IgtIpgCode") = mIgtIpgCode_lng
        .fields("IgtPrefix") = mIgtPrefix_str
        .fields("IgtPostfix") = mIgtPostfix_str
        .fields("IgtTime") = mIgtTime_lng
        .fields("IgtOldIgtCode") = mIgtOldIgtCode_lng
        .fields("IgtPttCode") = mIgtPttCode_lng
        .fields("IgtDpogAmt") = mIgtDpogAmt_dbl
        .fields("IgtAdjAmt") = mIgtAdjAmt_dbl
        .fields("IgtBalAmt") = mIgtBalAmt_dbl
        .fields("IgtRemark") = mIgtRemark_str
    
    ElseIf blnIndrRgRefdTran = True Then
        .fields("IgfIpgCode") = mIgfIpgCode_lng
        .fields("IgfPrefix") = mIgfPrefix_str
        .fields("IgfPostfix") = mIgfPostfix_str
        .fields("IgfTime") = mIgfTime_lng
        .fields("IgfOldIgfCode") = mIgfOldIgfCode_lng
        .fields("IgfPttCode") = mIgfPttCode_lng
        .fields("IgfRfugAmt") = mIgfRfugAmt_dbl
        .fields("IgfAdjAmt") = mIgfAdjAmt_dbl
        .fields("IgfBalAmt") = mIgfBalAmt_dbl
        .fields("IgfRemark") = mIgfRemark_str
    
    End If
    .Update
    mCode_lng = .fields(mCodeField)
    aTranList(mActiveTran) = mCode_lng
    End With
    CloseTable tRecset
    
    m_dbBdkDatabase.CommitTrans
    
    If blnIndrBedStatus = True Then
        If mIbsLIbsCode_lng <> 0 Then
            m_dbBdkDatabase.Execute "Update IBedState set IbsDischDate=#" & CStr(mVchDate_dt) & "#,IbsDischTime=" & CStr(mIbsTime_lng) & ",IbsDischState=" & CStr(cIBS_STATE_SHIFTED) & " where IbsCode=" & CStr(mIbsLIbsCode_lng)
        End If
    End If
End If
AddNew = True
GoTo EndSub

errhand:
MsgBox Err.Description
m_dbBdkDatabase.Cancel

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Function

End Function

Public Sub Update(ByVal mCode As Long)
Dim tRecset As New ADODB.Recordset, mCanUpdate As Boolean, mLCount As Integer, mUCount As Integer, acount As Integer
mCanUpdate = True

If blnIndrBedStatus = False Then    ' not required in IBedState
    If ChkIsDuplVTypeNo(m_dbBdkDatabase, m_dbAcDatabase, mTableName:=mTableName, mChkFieldName:=mVchNoField, mChkFieldValue:=mVchNo_lng, mKeyFieldName:=mCodeField, mKeyFieldValue:=mCode_lng, mVtmFieldName:=mVtmCodeField, mVtmFieldValue:=mVtmCode_lng, mFinYrFieldName:=mCmpCodeField, mFinYrFieldValue:=mCmpCode_int, mDateFieldName:=mVchDateField, mDateFieldValue:=mVchDate_dt) = True Then
        mCanUpdate = False
        ErrorBox "Duplicate Voucher No. !!!"
    End If
End If

On Error GoTo errhand
mCode_lng = 0
If mCanUpdate = True Then
    m_dbBdkDatabase.BeginTrans
    With tRecset
    .open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
    
    .fields(mVchNoField) = mVchNo_lng
    .fields(mVtmCodeField) = mVtmCode_lng
    .fields(mVchDateField) = mVchDate_dt
    Rem .Fields(mCmpCodeField) = mCmpCode_int    will be alloted only in AddNew
    .fields(mRecStateField) = ChkEditRecStatus(.fields(mRecStateField))
    
    If blnOutdRegTran = True Then
        .fields("OpgPrefix") = mOpgPrefix_str
        .fields("OpgPostfix") = mOpgPostfix_str
        .fields("OpgTime") = mOpgTime_lng
        .fields("OpgOldOpgCode") = mOpgOldOpgCode_lng
        .fields("OpgCDctCode") = mOpgCDctCode_lng
        .fields("OpgRByCode") = mOpgRByCode_lng
        .fields("OpgRToCode") = mOpgRToCode_lng
        .fields("OpgPttCode") = mOpgPttCode_lng
        .fields("OpgPDigCode") = mOpgPDigCode_lng
        .fields("OpgFDigCode") = mOpgFDigCode_lng
        .fields("OpgSrvCode") = mOpgSrvCode_lng
        .fields("OpgUnit") = mOpgUnit_lng
        .fields("OpgRate") = mOpgRate_dbl
        .fields("OpgAmtBefDisc") = mOpgAmtBefDisc_dbl
        .fields("OpgDiscPer") = mOpgDiscPer_dbl
        .fields("OpgDiscAmt") = mOpgDiscAmt_dbl
        .fields("OpgAmtAftDisc") = mOpgAmtAftDisc_dbl
        .fields("OpgRemark") = mOpgRemark_str
        
    ElseIf blnIndrRegTran = True Then
        .fields("IpgPrefix") = mIpgPrefix_str
        .fields("IpgPostfix") = mIpgPostfix_str
        .fields("IpgTime") = mIpgTime_lng
        .fields("IpgOldIpgCode") = mIpgOldIpgCode_lng
        .fields("IpgCDctCode") = mIpgCDctCode_lng
        .fields("IpgRByCode") = mIpgRByCode_lng
        .fields("IpgRToCode") = mIpgRToCode_lng
        .fields("IpgPttCode") = mIpgPttCode_lng
        .fields("IpgPDigCode") = mIpgPDigCode_lng
        .fields("IpgFDigCode") = mIpgFDigCode_lng
        .fields("IpgBdmCode") = mIpgBdmCode_lng
        .fields("IpgIbsCode") = mIpgIbsCode_lng
        .fields("IpgAdvAmt") = mIpgAdvAmt_dbl
        .fields("IpgRemark") = mIpgRemark_str
        .fields("IpgDischDate") = mIpgDischDate_dt
        .fields("IpgDischTime") = mIpgDischTime_lng
        
    ElseIf blnIndrBedStatus = True Then
        .fields("IbsSno") = mIbsSno_int
        .fields("IbsPrefix") = mIbsPrefix_str
        .fields("IbsPostfix") = mIbsPostfix_str
        .fields("IbsTime") = mIbsTime_lng
        .fields("IbsIpgCode") = mIbsIpgCode_lng
        .fields("IbsBdmCode") = mIbsBdmCode_lng
        .fields("IbsDischDate") = mIbsDischDate_dt
        .fields("IbsDischTime") = mIbsDischTime_lng
        .fields("IbsPttCode") = mIbsPttCode_lng
        .fields("IbsDischState") = mIbsDischState_int
        .fields("IbsLIbsCode") = mIbsLIbsCode_lng
        .fields("IbsRemark") = mIbsRemark_str
        
    ElseIf blnIndrRgPymtTran = True Then
        .fields("IgtIpgCode") = mIgtIpgCode_lng
        .fields("IgtPrefix") = mIgtPrefix_str
        .fields("IgtPostfix") = mIgtPostfix_str
        .fields("IgtTime") = mIgtTime_lng
        .fields("IgtOldIgtCode") = mIgtOldIgtCode_lng
        .fields("IgtPttCode") = mIgtPttCode_lng
        .fields("IgtDpogAmt") = mIgtDpogAmt_dbl
        .fields("IgtAdjAmt") = mIgtAdjAmt_dbl
        .fields("IgtBalAmt") = mIgtBalAmt_dbl
        .fields("IgtRemark") = mIgtRemark_str
    
    ElseIf blnIndrRgRefdTran = True Then
        .fields("IgfIpgCode") = mIgfIpgCode_lng
        .fields("IgfPrefix") = mIgfPrefix_str
        .fields("IgfPostfix") = mIgfPostfix_str
        .fields("IgfTime") = mIgfTime_lng
        .fields("IgfOldIgfCode") = mIgfOldIgfCode_lng
        .fields("IgfPttCode") = mIgfPttCode_lng
        .fields("IgfRfugAmt") = mIgfRfugAmt_dbl
        .fields("IgfAdjAmt") = mIgfAdjAmt_dbl
        .fields("IgfBalAmt") = mIgfBalAmt_dbl
        .fields("IgfRemark") = mIgfRemark_str
        
        
    End If
    .Update
    mCode_lng = .fields(mCodeField)
    End With
    CloseTable tRecset
    
    m_dbBdkDatabase.CommitTrans
    
    If blnIndrBedStatus = True Then
        If mIbsLIbsCode_lng <> 0 Then
            m_dbBdkDatabase.Execute "Update IBedState set IbsDischDate=#" & CStr(mVchDate_dt) & "#,IbsDischTime=" & CStr(mIbsTime_lng) & ",IbsDischState=" & CStr(cIBS_STATE_SHIFTED) & " where IbsCode=" & CStr(mIbsLIbsCode_lng)
        End If
    End If
    
End If
GoTo EndSub

errhand:
MsgBox Err.Description
m_dbBdkDatabase.Cancel

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Sub

End Sub

Public Function CanDeleteTran(ByVal mCode As Long, Optional ByVal mSkipConfirm As Boolean) As Boolean
Dim mDeleteit As Boolean

mDeleteit = True

If ChkEntryExist(mCode) = True Then
    AlertBox "Entry Exist !!!"
    mDeleteit = False
End If
If mDeleteit = True And mSkipConfirm = False Then
    mDeleteit = CanDelete()
End If

CanDeleteTran = mDeleteit

End Function

Public Function ChkEntryExist(ByVal mCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset

ChkEntryExist = False
If blnOutdRegTran = True Then
    If ChkEntryExist = False Then
        With tRecset
        .open "Select * from OutdHdr where OhrOpgCode=" & CStr(mCode) & " order by OhrDate desc,OhrVchNo desc", m_dbBdkDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            AlertBox "Outdoor Receipt No." & CStr(.fields("OhrVchNo")) & " Dated " & Dtoc(.fields("OhrDate")) & " !!!"
            ChkEntryExist = True
        End If
        End With
        CloseTable tRecset
    End If
    If ChkEntryExist = False Then
        With tRecset
        .open "Select * from OutdPymtHdr where OphOpgCode=" & CStr(mCode) & " order by OphDate desc,OphVchNo desc", m_dbBdkDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            AlertBox "Outdoor Payment No." & CStr(.fields("OphVchNo")) & " Dated " & Dtoc(.fields("OphDate")) & " !!!"
            ChkEntryExist = True
        End If
        End With
        CloseTable tRecset
    End If
    If ChkEntryExist = False Then
        With tRecset
        .open "Select * from OutdRefdHdr where OfhOpgCode=" & CStr(mCode) & " order by OfhDate desc,OfhVchNo desc", m_dbBdkDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            AlertBox "Outdoor Payment No." & CStr(.fields("OfhVchNo")) & " Dated " & Dtoc(.fields("OfhDate")) & " !!!"
            ChkEntryExist = True
        End If
        End With
        CloseTable tRecset
    End If
    If ChkEntryExist = False Then
        With tRecset
        .open "Select * from OutdBlHdr where ObhOpgCode=" & CStr(mCode) & " order by ObhDate desc,ObhVchNo desc", m_dbBdkDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            AlertBox "Outdoor Payment No." & CStr(.fields("ObhVchNo")) & " Dated " & Dtoc(.fields("ObhDate")) & " !!!"
            ChkEntryExist = True
        End If
        End With
        CloseTable tRecset
    End If
    If ChkEntryExist = False Then
        With tRecset
        .open "Select * from OutdBlPymtHdr where ObphOpgCode=" & CStr(mCode) & " order by ObphDate desc,ObphVchNo desc", m_dbBdkDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            AlertBox "Outdoor Payment No." & CStr(.fields("ObphVchNo")) & " Dated " & Dtoc(.fields("ObphDate")) & " !!!"
            ChkEntryExist = True
        End If
        End With
        CloseTable tRecset
    End If
    If ChkEntryExist = False Then
        With tRecset
        .open "Select * from OutdBlRefdHdr where ObfhOpgCode=" & CStr(mCode) & " order by ObfhDate desc,ObfhVchNo desc", m_dbBdkDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            AlertBox "Outdoor Payment No." & CStr(.fields("ObfhVchNo")) & " Dated " & Dtoc(.fields("ObfhDate")) & " !!!"
            ChkEntryExist = True
        End If
        End With
        CloseTable tRecset
    End If
    
ElseIf blnIndrRegTran = True Then
    If ChkEntryExist = False Then
        With tRecset
        .open "Select * from IndrHdr where IhrIpgCode=" & CStr(mCode) & " order by IhrDate desc,IhrVchNo desc", m_dbBdkDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            AlertBox "Indroor Receipt No." & CStr(.fields("IhrVchNo")) & " Dated " & Dtoc(.fields("IhrDate")) & " !!!"
            ChkEntryExist = True
        End If
        End With
        CloseTable tRecset
    End If
    If ChkEntryExist = False Then
        With tRecset
        .open "Select * from IndrPymtHdr where IphIpgCode=" & CStr(mCode) & " order by IphDate desc,IphVchNo desc", m_dbBdkDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            AlertBox "Indoor Payment No." & CStr(.fields("IphVchNo")) & " Dated " & Dtoc(.fields("IphDate")) & " !!!"
            ChkEntryExist = True
        End If
        End With
        CloseTable tRecset
    End If
    If ChkEntryExist = False Then
        With tRecset
        .open "Select * from IndrRefdHdr where IfhIpgCode=" & CStr(mCode) & " order by IfhDate desc,IfhVchNo desc", m_dbBdkDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            AlertBox "Indoor Payment No." & CStr(.fields("IfhVchNo")) & " Dated " & Dtoc(.fields("IfhDate")) & " !!!"
            ChkEntryExist = True
        End If
        End With
        CloseTable tRecset
    End If
    If ChkEntryExist = False Then
        With tRecset
        .open "Select * from IndrBlHdr where IbhIpgCode=" & CStr(mCode) & " order by IbhDate desc,IbhVchNo desc", m_dbBdkDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            AlertBox "Indoor Payment No." & CStr(.fields("IbhVchNo")) & " Dated " & Dtoc(.fields("IbhDate")) & " !!!"
            ChkEntryExist = True
        End If
        End With
        CloseTable tRecset
    End If
    If ChkEntryExist = False Then
        With tRecset
        .open "Select * from IndrBlPymtHdr where IbphIpgCode=" & CStr(mCode) & " order by IbphDate desc,IbphVchNo desc", m_dbBdkDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            AlertBox "Indoor Payment No." & CStr(.fields("IbphVchNo")) & " Dated " & Dtoc(.fields("IbphDate")) & " !!!"
            ChkEntryExist = True
        End If
        End With
        CloseTable tRecset
    End If
    If ChkEntryExist = False Then
        With tRecset
        .open "Select * from IndrBlRefdHdr where IbfhIpgCode=" & CStr(mCode) & " order by IbfhDate desc,IbfhVchNo desc", m_dbBdkDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            AlertBox "Indoor Payment No." & CStr(.fields("IbfhVchNo")) & " Dated " & Dtoc(.fields("IbfhDate")) & " !!!"
            ChkEntryExist = True
        End If
        End With
        CloseTable tRecset
    End If
    If ChkEntryExist = False Then
        With tRecset
        .open "Select * from IndrRgPymt where IgtIpgCode=" & CStr(mCode) & " order by IgtDate desc,IgtVchNo desc", m_dbBdkDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            AlertBox "Indoor Payment No." & CStr(.fields("IgtVchNo")) & " Dated " & Dtoc(.fields("IgtDate")) & " !!!"
            ChkEntryExist = True
        End If
        End With
        CloseTable tRecset
    End If
    If ChkEntryExist = False Then
        With tRecset
        .open "Select * from IndrRgRefd where IgfIpgCode=" & CStr(mCode) & " order by IgfDate desc,IgfVchNo desc", m_dbBdkDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            AlertBox "Indoor Payment No." & CStr(.fields("IgfVchNo")) & " Dated " & Dtoc(.fields("IgfDate")) & " !!!"
            ChkEntryExist = True
        End If
        End With
        CloseTable tRecset
    End If
    
ElseIf blnIndrBedStatus = True Then
    If ChkEntryExist = False Then
        With tRecset
        .open "Select count(*) as MyCount from IBedState where IbsIpgCode=(Select IbsIpgCode from IBedState where IbsCode=" & CStr(mCode) & "" & ") and IbsDischState<>" & CStr(cIBS_STATE_OCCUPIED) & " and IbsDischState<>" & CStr(cIBS_STATE_SHIFTED) & "", m_dbBdkDatabase, adOpenKeyset, adLockReadOnly
        If .fields("MyCount") > 0 Then
            AlertBox "Patient Already Discharged/Left !!!"
            ChkEntryExist = True
        End If
        End With
        CloseTable tRecset
    End If
    If ChkEntryExist = False Then
        With tRecset
        .open "Select count(*) as MyCount from IBedState where IbsIpgCode=(Select IbsIpgCode from IBedState where IbsCode=" & CStr(mCode) & "" & ") and IbsCode>" & CStr(mCode) & "", m_dbBdkDatabase, adOpenKeyset, adLockReadOnly
        If .fields("MyCount") > 0 Then
            AlertBox "Patient Already Shifted !!!"
            ChkEntryExist = True
        End If
        End With
        CloseTable tRecset
    End If
    If ChkEntryExist = False Then
        With tRecset
        .open "Select count(*) as MyCount from IBedState where IbsCode=" & CStr(mCode) & " and IbsLIbsCode=0", m_dbBdkDatabase, adOpenKeyset, adLockReadOnly
        If .fields("MyCount") > 0 Then
            AlertBox "Autogenerated Indoor Admission Entry !!!"
            ChkEntryExist = True
        End If
        End With
        CloseTable tRecset
    End If
    If ChkEntryExist = False Then
        With tRecset
        .open "Select count(*) as MyCount from IBedState" _
            & " inner join IndrReg on IBedState.IbsCode=IndrReg.IpgIbsCode and IBedState.IbsIpgCode=IndrReg.IpgCode" _
            & " where IbsCode=" & CStr(mCode) _
            & " and IbsIpgCode=(Select IbsIpgCode from IBedState where IbsCode=" & CStr(mCode) & "" & ")" _
            , m_dbBdkDatabase, adOpenKeyset, adLockReadOnly
        If .fields("MyCount") > 0 Then
            AlertBox "Autogenerated Indoor Admission Entry !!!"
            ChkEntryExist = True
        End If
        End With
        CloseTable tRecset
    End If
    If ChkEntryExist = False Then
        With tRecset
        .open "Select * from ((IndrBlIbsDtl" _
            & " inner join IBedState on IndrBlIbsDtl.IbbsIbsCode = IBedState.IbsCode)" _
            & " inner join IndrBill on IndrBlIbsDtl.IbbsCode = IndrBill.IblCode and IndrBlIbsDtl.IbbsIblICode = IndrBill.IblICode)" _
            & " left join IndrBlHdr on IndrBill.IblCode = IndrBlHdr.IbhCode" _
            & " where IbbsIpgCode=(Select IbbsIpgCode from IndrBlIbsDtl where IbbsIbsCode=" & CStr(mCode) & "" & ")" _
            & " order by IblDate Desc" & "", m_dbBdkDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            If IsNull(.fields("IbhCode")) = False Then
                AlertBox "Indoor Bill No." & CStr(.fields("IbhVchNo")) & " Dated " & Dtoc(.fields("IbhDate")) & " Already Generated !!!"
            Else
                AlertBox "Indoor Bill Dated " & Dtoc(.fields("IblDate")) & " Under Process !!!"
            End If
            ChkEntryExist = True
        End If
        End With
        CloseTable tRecset
    End If
    
ElseIf blnIndrRgPymtTran = True Then
    With tRecset
    .open "Select * from IndrBlDpogDtl" _
        & " left join IndrBlHdr on IndrBlDpogDtl.IbgdCode=IndrBlHdr.IbhCode" _
        & " where IbgdIgtCode=" & CStr(mCode) _
        & " order by IbhDate desc,IbhVchNo desc", m_dbBdkDatabase, adOpenKeyset, adLockReadOnly
    If .EOF = False Then
        If IsNull(.fields("IbhCode")) = False Then
            AlertBox "Indoor Bill No." & CStr(.fields("IbhVchNo")) & " Dated " & Dtoc(.fields("IbhDate")) & " !!!"
            ChkEntryExist = True
        Else
            AlertBox "Indoor Bill Entry in Process " & " !!!"
            ChkEntryExist = True
        End If
    End If
    End With
    CloseTable tRecset
    
ElseIf blnIndrRgRefdTran = True Then
    With tRecset
    .open "Select * from IndrBlRfugDtl" _
        & " left join IndrBlHdr on IndrBlRfugDtl.IbgfCode=IndrBlHdr.IbhCode" _
        & " where IbgfIgfCode=" & CStr(mCode) _
        & " order by IbhDate desc,IbhVchNo desc", m_dbBdkDatabase, adOpenKeyset, adLockReadOnly
    If .EOF = False Then
        If IsNull(.fields("IbhCode")) = False Then
            AlertBox "Indoor Bill No." & CStr(.fields("IbhVchNo")) & " Dated " & Dtoc(.fields("IbhDate")) & " !!!"
            ChkEntryExist = True
        Else
            AlertBox "Indoor Bill Entry in Process / Unknown Bill Entry" & " !!!"
            ChkEntryExist = True
        End If
    End If
    End With
    CloseTable tRecset
    
Else

    MsgBox "ChkEntryExist Pending !!!"
    
End If


EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Function

End Function

Rem *************************************** end of class **************************************************

