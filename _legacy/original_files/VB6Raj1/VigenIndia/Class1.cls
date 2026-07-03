VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Class1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Dim m_dbHmsDatabase As ADODB.Connection, m_dbAcDatabase As ADODB.Connection, m_dbComDatabase As ADODB.Connection
Dim mClassUIdCode As Long, mClassUIdFileName As String, mClassAcsPermFileName As String
Dim mTrnHdrTableName As String, mTrnDtlTableName As String, mTrnHdrCodeField As String, mTrnDtlCodeField As String, mTrnHdrDateField As String, mTrnDtlDateField As String, mTrnVtmField As String, mTrnPrefixField As String, mTrnVchNoField As String, mTrnPostfixField As String, mTrnICodeField As String, mTrnSnoField As String, mTrnHdrRecStateField As String, mTrnDtlRecStateField As String, mTrnHdrCmpCodeField As String, mTrnDtlCmpCodeField As String, mTitleName As String
Public blnIndrRcptTran As Boolean, blnIndrPymtTran As Boolean, blnIndrRefdTran As Boolean
Rem common class variables used in both header and detail
Public mTrnCode_lng As Long, mTrnVtmCode_lng As Long, mTrnPrefix_str As String, mTrnVchNo_lng As Long, mTrnPostfix_str As String, mTrnDate_dt As Date, mTrnCmpCode_int As Integer
Rem common class header variables
Public mTrnHdrRecState_int As Integer
Rem common class detail variables
Public mTrnICode_lng As Long, mTrnSno_int As Integer, mTrnDtlRecState_int As Integer
Rem Indoor receipt header variables
Public mIhrIpgCode_lng As Long, mIhrPttCode_lng As Long, mIhrTime_lng As Long, mIhrOldIhrCode_lng As Long, mIhrPttDiscPer_dbl As Long, mIhrAmtBefDisc_dbl As Double, mIhrDiscAmt_dbl As Double, mIhrAmtAftDisc_dbl As Double, mIhrAdvAmt_dbl As Double, mIhrRecdAmt_dbl As Double, mIhrDepoAmt_dbl As Double, mIhrRefuAmt_dbl As Double, mIhrBalAmt_dbl As Double, mIhrRemark_str As String
Rem Indoor receipt detail variables
Public mIrcSrvCode_dbl As Double, mIrcPttCode_lng As Long, mIrcUnit_dbl As Double, mIrcRate_dbl As Double, mIrcAmtBefDisc_dbl As Double, mIrcDiscPer_dbl As Double, mIrcDiscAmt_dbl As Double, mIrcAmtAftDisc_dbl As Double, mIrcAdvAmt_dbl As Double, mIrcRecdAmt_dbl As Double, mIrcDepoAmt_dbl As Double, mIrcRefuAmt_dbl As Double, mIrcBalAmt_dbl As Double, mIrcRemark_str As String
Rem Indoor payment receipt header variables
Public mIphIpgCode_lng As Long, mIphTime_lng As Long, mIphOldIphCode_lng As Long, mIphPttCode_lng As Long, mIphDepoAmt_dbl As Double, mIphRemark_str As String
Rem Indoor payment receipt detail variables
Public mIpyPttCode_lng As Long, mIpyIhrCode_lng As Long, mIpyDepoAmt_dbl As Double, mIpyRemark_str As String
Rem Indoor refund receipt header variables
Public mIfhIpgCode_lng As Long, mIfhTime_lng As Long, mIfhOldIfhCode_lng As Long, mIfhPttCode_lng As Long, mIfhRefuAmt_dbl As Double, mIfhRemark_str As String
Rem Indoor refund receipt detail variables
Public mIfdPttCode_lng As Long, mIfdIhrCode_lng As Long, mIfdRefuAmt_dbl As Double, mIfdRemark_str As String

Dim mActiveTran As Integer, aHmsTran() As Variant
Public clsPAT As clsHmsMasterEntry, clsSRV As clsHmsMasterEntry, clsDPT As clsHmsMasterEntry

Public Sub Init()
If blnIndrRcptTran = True Then
    mTrnHdrTableName = "IndrHdr": mTrnDtlTableName = "IndrRcpt"
    mTrnHdrCodeField = "IhrCode": mTrnDtlCodeField = "IrcCode"
    mTrnHdrDateField = "IhrDate": mTrnDtlDateField = "IrcDate"
    mTrnHdrRecStateField = "IhrRecState": mTrnDtlRecStateField = "IrcRecState"
    mTrnHdrCmpCodeField = "IhrCmpCode": mTrnDtlCmpCodeField = "IrcCmpCode"
    mTrnVtmField = "IhrVtmCode"
    mTrnPrefixField = "IhrPrefix"
    mTrnVchNoField = "IhrVchNo"
    mTrnPostfixField = "IhrPostfix"
    mTrnICodeField = "IrcICode"
    mTrnSnoField = "IrcSno"
    mTitleName = "Indoor Receipt"
    
    Set clsPAT = New clsHmsMasterEntry
    Set clsPAT.dbHmsDatabase = m_dbHmsDatabase
    Set clsPAT.dbAcDatabase = m_dbAcDatabase
    clsPAT.blnPatMast = True
    clsPAT.Init
    
    Set clsSRV = New clsHmsMasterEntry
    Set clsSRV.dbHmsDatabase = m_dbHmsDatabase
    Set clsSRV.dbAcDatabase = m_dbAcDatabase
    clsSRV.blnServMast = True
    clsSRV.Init
    
ElseIf blnIndrPymtTran = True Then
    mTrnHdrTableName = "IndrPymtHdr": mTrnDtlTableName = "IndrPymtDtl"
    mTrnHdrCodeField = "IphCode": mTrnDtlCodeField = "IpyCode"
    mTrnHdrDateField = "IphDate": mTrnDtlDateField = "IpyDate"
    mTrnHdrRecStateField = "IphRecState": mTrnDtlRecStateField = "IpyRecState"
    mTrnHdrCmpCodeField = "IphCmpCode": mTrnDtlCmpCodeField = "IpyCmpCode"
    mTrnVtmField = "IphVtmCode"
    mTrnPrefixField = "IphPrefix"
    mTrnVchNoField = "IphVchNo"
    mTrnPostfixField = "IphPostfix"
    mTrnICodeField = "IpyICode"
    mTrnSnoField = "IpySno"
    mTitleName = "Indoor Due Payment"
    
    Set clsPAT = New clsHmsMasterEntry
    Set clsPAT.dbHmsDatabase = m_dbHmsDatabase
    Set clsPAT.dbAcDatabase = m_dbAcDatabase
    clsPAT.blnPatMast = True
    clsPAT.Init
    
ElseIf blnIndrRefdTran = True Then
    mTrnHdrTableName = "IndrRefdHdr": mTrnDtlTableName = "IndrRefdDtl"
    mTrnHdrCodeField = "IfhCode": mTrnDtlCodeField = "IfdCode"
    mTrnHdrDateField = "IfhDate": mTrnDtlDateField = "IfdDate"
    mTrnHdrRecStateField = "IfhRecState": mTrnDtlRecStateField = "IfdRecState"
    mTrnHdrCmpCodeField = "IfhCmpCode": mTrnDtlCmpCodeField = "IfdCmpCode"
    mTrnVtmField = "IfhVtmCode"
    mTrnPrefixField = "IfhPrefix"
    mTrnVchNoField = "IfhVchNo"
    mTrnPostfixField = "IfhPostfix"
    mTrnICodeField = "IfdICode"
    mTrnSnoField = "IfdSno"
    mTitleName = "Indoor Refund"
    
    Set clsPAT = New clsHmsMasterEntry
    Set clsPAT.dbHmsDatabase = m_dbHmsDatabase
    Set clsPAT.dbAcDatabase = m_dbAcDatabase
    clsPAT.blnPatMast = True
    clsPAT.Init
    
Else
    ErrorBox "clsHmsMultiTranEntry_Init_#73_[Undefined Case]"
End If

End Sub

Public Property Set dbHmsDatabase(ByRef db As ADODB.Connection)
Set m_dbHmsDatabase = db

If clsDPT Is Nothing Then
    'Set clsDPT = New clsHmsMasterEntry
    'clsDPT.MastName = "DeptMast"
End If



'Set clsDPT.dbHmsDatabase = db

End Property

Public Property Set dbAcDatabase(ByRef db As ADODB.Connection)
Set m_dbAcDatabase = db

If clsDPT Is Nothing Then
    'Set clsDPT = New clsHmsMasterEntry
    'clsDPT.MastName = "DeptMast"
End If

'Set clsDPT.dbAcDatabase = db

End Property

Public Property Set dbComDatabase(ByRef db As ADODB.Connection)
Set m_dbComDatabase = db

End Property

Private Sub Class_Initialize()
aHmsTran = Array()
mActiveTran = UBound(aHmsTran)

mClassUIdFileName = "clsHmsMultiTrn.UId"
mClassAcsPermFileName = "clsHmsMultiTrn.Acp"
mClassUIdCode = GetUIdCode("clsHmsMultiTranEntry_Initialize", mUIdFileName:=mClassUIdFileName, mAcsPermFileName:=mClassAcsPermFileName)

End Sub

Public Sub GetHdrData(ByVal mTrnCode As Long)
Dim tRecset As New ADODB.Recordset

Me.ClearHdr
With tRecset
.Open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    mTrnCode_lng = .fields(mTrnHdrCodeField)
    mTrnDate_dt = .fields(mTrnHdrDateField)
    mTrnVtmCode_lng = .fields(mTrnVtmField)
    mTrnPrefix_str = .fields(mTrnPrefixField)
    mTrnVchNo_lng = .fields(mTrnVchNoField)
    mTrnPostfix_str = .fields(mTrnPostfixField)
    mTrnHdrRecState_int = .fields(mTrnHdrRecStateField)
    mTrnCmpCode_int = .fields(mTrnHdrCmpCodeField)
    
    If blnIndrRcptTran = True Then
        mIhrIpgCode_lng = .fields("IhrIpgCode")
        mIhrTime_lng = .fields("IhrTime")
        mIhrOldIhrCode_lng = .fields("IhrOldIhrCode")
        mIhrPttCode_lng = .fields("IhrPttCode")
        mIhrPttDiscPer_dbl = .fields("IhrPttDiscPer")
        mIhrAmtBefDisc_dbl = .fields("IhrAmtBefDisc")
        mIhrDiscAmt_dbl = .fields("IhrDiscAmt")
        mIhrAmtAftDisc_dbl = .fields("IhrAmtAftDisc")
        mIhrAdvAmt_dbl = .fields("IhrAdvAmt")
        mIhrRecdAmt_dbl = .fields("IhrRecdAmt")
        mIhrDepoAmt_dbl = .fields("IhrDepoAmt")
        mIhrRefuAmt_dbl = .fields("IhrRefuAmt")
        mIhrBalAmt_dbl = .fields("IhrBalAmt")
        mIhrRemark_str = .fields("IhrRemark")
        
        clsPAT.GetData .fields("IhrPttCode")
        
    ElseIf blnIndrPymtTran = True Then
        mIphIpgCode_lng = .fields("IphIpgCode")
        mIphTime_lng = .fields("IphTime")
        mIphOldIphCode_lng = .fields("IphOldIphCode")
        mIphPttCode_lng = .fields("IphPttCode")
        mIphDepoAmt_dbl = .fields("IphDepoAmt")
        mIphRemark_str = .fields("IphRemark")
        
        clsPAT.GetData .fields("IphPttCode")
    
    ElseIf blnIndrRefdTran = True Then
        mIfhIpgCode_lng = .fields("IfhIpgCode")
        mIfhTime_lng = .fields("IfhTime")
        mIfhOldIfhCode_lng = .fields("IfhOldIfhCode")
        mIfhPttCode_lng = .fields("IfhPttCode")
        mIfhRefuAmt_dbl = .fields("IfhRefuAmt")
        mIfhRemark_str = .fields("IfhRemark")
        
        clsPAT.GetData .fields("IfhPttCode")
        
    Else
        ErrorBox "clsHmsMultiTranEntry_GetHdrData_#133_[Undefined Case]"
    End If


End If
End With
CloseTable tRecset

End Sub

Public Sub GetDtlData(ByVal mTrnCode As Long, ByVal mTrnICode As Long, Optional ByVal mTrnSno As Integer)
Dim tRecset As New ADODB.Recordset

Me.ClearDtl
With tRecset
If mTrnICode > 0 Then
    .Open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " and " & mTrnICodeField & "=" & CStr(mTrnICode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
Else
    .Open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " and " & mTrnSnoField & "=" & CStr(mTrnSno) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
End If
If .RecordCount > 0 Then
    mTrnCode_lng = .fields(mTrnDtlCodeField)
    mTrnICode_lng = .fields(mTrnICodeField)
    mTrnSno_int = .fields(mTrnSnoField)
    mTrnDate_dt = .fields(mTrnDtlDateField)
    mTrnDtlRecState_int = .fields(mTrnDtlRecStateField)
    mTrnCmpCode_int = .fields(mTrnDtlCmpCodeField)
    
    If blnIndrRcptTran = True Then
        mIrcPttCode_lng = .fields("IrcPttCode")
        mIrcSrvCode_dbl = .fields("IrcSrvCode")
        mIrcUnit_dbl = .fields("IrcUnit")
        mIrcRate_dbl = .fields("IrcRate")
        mIrcAmtBefDisc_dbl = .fields("IrcAmtBefDisc")
        mIrcDiscPer_dbl = .fields("IrcDiscPer")
        mIrcDiscAmt_dbl = .fields("IrcDiscAmt")
        mIrcAmtAftDisc_dbl = .fields("IrcAmtAftDisc")
        mIrcAdvAmt_dbl = .fields("IrcAdvAmt")
        mIrcRecdAmt_dbl = .fields("IrcRecdAmt")
        mIrcDepoAmt_dbl = .fields("IrcDepoAmt")
        mIrcRefuAmt_dbl = .fields("IrcRefuAmt")
        mIrcBalAmt_dbl = .fields("IrcBalAmt")
        mIrcRemark_str = .fields("IrcRemark")
        
        clsSRV.GetData .fields("IrcSrvCode")
    
    ElseIf blnIndrPymtTran = True Then
        mIpyPttCode_lng = .fields("IpyPttCode")
        mIpyIhrCode_lng = .fields("IpyIhrCode")
        mIpyDepoAmt_dbl = .fields("IpyDepoAmt")
        mIpyRemark_str = .fields("IpyRemark")
        
    ElseIf blnIndrRefdTran = True Then
        mIfdPttCode_lng = .fields("IfdPttCode")
        mIfdIhrCode_lng = .fields("IfdIhrCode")
        mIfdRefuAmt_dbl = .fields("IfdRefuAmt")
        mIfdRemark_str = .fields("IfdRemark")
        
    Else
        ErrorBox "clsHmsMultiTranEntry_GetDtlData_#173_[Undefined Case]"
    End If
End If
End With
CloseTable tRecset

End Sub

Public Sub ClearHdr()

mTrnCode_lng = 0
mTrnDate_dt = cUNKNOWNDATE
mTrnVtmCode_lng = 0
mTrnPrefix_str = ""
mTrnVchNo_lng = 0
mTrnPostfix_str = ""
mTrnHdrRecState_int = 0
mTrnCmpCode_int = 0

If blnIndrRcptTran = True Then
    mIhrIpgCode_lng = 0
    mIhrTime_lng = 0
    mIhrOldIhrCode_lng = 0
    mIhrPttCode_lng = 0
    mIhrPttDiscPer_dbl = 0
    mIhrAmtBefDisc_dbl = 0
    mIhrDiscAmt_dbl = 0
    mIhrAmtAftDisc_dbl = 0
    mIhrAdvAmt_dbl = 0
    mIhrRecdAmt_dbl = 0
    mIhrDepoAmt_dbl = 0
    mIhrRefuAmt_dbl = 0
    mIhrBalAmt_dbl = 0
    mIhrRemark_str = ""
    
    clsPAT.Clear

ElseIf blnIndrPymtTran = True Then
    mIphIpgCode_lng = 0
    mIphTime_lng = 0
    mIphOldIphCode_lng = 0
    mIphPttCode_lng = 0
    mIphDepoAmt_dbl = 0
    mIphRemark_str = ""
    
    clsPAT.Clear

ElseIf blnIndrRefdTran = True Then
    mIfhIpgCode_lng = 0
    mIfhTime_lng = 0
    mIfhOldIfhCode_lng = 0
    mIfhPttCode_lng = 0
    mIfhRefuAmt_dbl = 0
    mIfhRemark_str = ""
    
    clsPAT.Clear

Else
    ErrorBox "clsHmsMultiTranEntry_ClearHdr_#212_[Undefined Case]"
End If

End Sub

Public Sub ClearDtl()

mTrnCode_lng = 0
mTrnICode_lng = 0
mTrnSno_int = 0
mTrnDate_dt = cUNKNOWNDATE
mTrnDtlRecState_int = 0
mTrnCmpCode_int = 0

If blnIndrRcptTran = True Then
    mIrcPttCode_lng = 0
    mIrcSrvCode_dbl = 0
    mIrcUnit_dbl = 0
    mIrcRate_dbl = 0
    mIrcAmtBefDisc_dbl = 0
    mIrcDiscPer_dbl = 0
    mIrcDiscAmt_dbl = 0
    mIrcAmtAftDisc_dbl = 0
    mIrcAdvAmt_dbl = 0
    mIrcRecdAmt_dbl = 0
    mIrcDepoAmt_dbl = 0
    mIrcRefuAmt_dbl = 0
    mIrcBalAmt_dbl = 0
    mIrcRemark_str = ""
    
    clsSRV.Clear

ElseIf blnIndrPymtTran = True Then
    mIpyPttCode_lng = 0
    mIpyIhrCode_lng = 0
    mIpyDepoAmt_dbl = 0
    mIpyRemark_str = ""

ElseIf blnIndrRefdTran = True Then
    mIfdPttCode_lng = 0
    mIfdIhrCode_lng = 0
    mIfdRefuAmt_dbl = 0
    mIfdRemark_str = ""
    
Else
    ErrorBox "clsHmsMultiTranEntry_ClearDtl_#244_[Undefined Case]"
End If

End Sub

Private Sub Class_Terminate()
If UBound(aHmsTran) > LBound(aHmsTran) Then
    ErrorBox mTitleName & " Entry in Process !!!"
End If

Set clsPAT = Nothing
Set clsSRV = Nothing
Set clsDPT = Nothing

End Sub

Public Function BeginTran(ByVal mTrnCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset

BeginTran = False

If mTrnCode = 0 Then
    mTrnCode = GetUIdCode("clsHmsMultiTranEntry_BeginTran", mUIdFileName:=mClassUIdFileName, mAcsPermFileName:=mClassAcsPermFileName) * -1   '   GetNextSeqno(m_dbAcDatabase, "mTrnHdrTableName", "mTrnHdrCodeField")
    If mTrnCode = 0 Then
        ErrorBox "clsHmsMultiTranEntry_BeginTran_#266_[Invalid " & mTitleName & " Code]"
        GoTo EndSub
    End If
ElseIf mTrnCode > 0 Then
    tRecset.Open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.RecordCount = 0 Then
        ErrorBox "clsHmsMultiTranEntry_BeginTran_#272_[Entry not Found]"
        GoTo EndSub
    End If
    CloseTable tRecset
Else
    ErrorBox "clsHmsMultiTranEntry_BeginTran_#277_[Invalid " & mTitleName & " Entry Code Request]"
    GoTo EndSub
End If
mActiveTran = UBound(aHmsTran) + 1
ReDim Preserve aHmsTran(mActiveTran)
aHmsTran(mActiveTran) = mTrnCode

Call Data_CreateLog(mTrnCode)
BeginTran = True

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Function

End Function

Public Function EndTran(ByVal mTrnCode As Long) As Boolean
Dim mCnt As Integer
EndTran = False
If Chk_ActiveTran() = False Or IIf(ActiveTrnCode > 0, mTrnCode <> ActiveTrnCode, False) Then
    ErrorBox "clsHmsMultiTranEntry_EndTran_#294_[InActive Transaction Entry]"
    Exit Function
End If
Call Data_RemoveLog(mTrnCode)

For mCnt = (mActiveTran + 1) To UBound(aHmsTran)
    If (mCnt - 1) >= LBound(aHmsTran) Then
        aHmsTran(mCnt - 1) = aHmsTran(mCnt)
    End If
Next mCnt
If LBound(aHmsTran) = UBound(aHmsTran) Then
    aHmsTran = Array()
Else
    ReDim Preserve aHmsTran(UBound(aHmsTran) - 1)
End If
If mActiveTran > UBound(aHmsTran) Then
    mActiveTran = mActiveTran - 1
End If

EndTran = True
End Function

Public Property Get ActiveTrnCode() As Long
On Error GoTo errhand

ActiveTrnCode = aHmsTran(mActiveTran)

Exit Property

errhand:
ErrorBox Err.Description
ActiveTrnCode = -1
Exit Property

End Property

Public Function UpdateTran(ByVal mTrnCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset, mTmpTrnCode As Long, mTrnSno As Integer

UpdateTran = False
mTmpTrnCode = ActiveTrnCode

On Error GoTo errhand

Rem header section
m_dbHmsDatabase.BeginTrans
With tRecset
.Open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Do While .EOF = False
        If InList(.fields(mTrnHdrRecStateField), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
            If blnIndrRcptTran = True Then
                .fields("IhrBalAmt") = .fields("IhrAmtAftDisc") - (.fields("IhrAdvAmt") + .fields("IhrRecdAmt") + .fields("IhrDepoAmt"))
            End If
        
            .fields(mTrnHdrRecStateField) = cREC_UNCHANGED
            .Update
        Else
            .fields(mTrnHdrRecStateField) = ChkDeleteRecStatus(.fields(mTrnHdrRecStateField))
            .Update
            .Delete
        End If
        
        .MoveNext
    Loop
End If
End With
m_dbHmsDatabase.CommitTrans
CloseTable tRecset

Rem detail section
m_dbHmsDatabase.BeginTrans
With tRecset
If mTrnCode = mTmpTrnCode Then
    .Open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnICodeField & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
Else
    .Open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTmpTrnCode) & " order by " & mTrnICodeField & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
End If
If .RecordCount > 0 Then
    mTrnSno = 1
    Do While .EOF = False
        If InList(.fields(mTrnDtlRecStateField), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
            If blnIndrRcptTran = True Then
                If .fields("IrcPttCode") <> mIhrPttCode_lng Then
                    .fields("IrcPttCode") = mIhrPttCode_lng
                End If
            ElseIf blnIndrPymtTran = True Then
                If .fields("IpyPttCode") <> mIphPttCode_lng Then
                    .fields("IpyPttCode") = mIphPttCode_lng
                End If
            
            ElseIf blnIndrRefdTran = True Then
                If .fields("IfdPttCode") <> mIfhPttCode_lng Then
                    .fields("IfdPttCode") = mIfhPttCode_lng
                End If
            
            End If
            If mTrnCode <> mTmpTrnCode Then
                .fields(mTrnDtlCodeField) = mTrnCode
            End If
            .fields(mTrnSnoField) = mTrnSno
            .fields(mTrnDtlDateField) = mTrnDate_dt
            .fields(mTrnDtlRecStateField) = cREC_UNCHANGED
            .Update
            mTrnSno = mTrnSno + 1
        Else
            .fields(mTrnDtlRecStateField) = ChkDeleteRecStatus(.fields(mTrnDtlRecStateField))
            .Update
            .Delete
        End If
        
        .MoveNext
    Loop
    If blnIndrRcptTran = True Then
        DisperseRecdAmt mTrnCode
    End If
End If
End With
m_dbHmsDatabase.CommitTrans
CloseTable tRecset

UpdateTran = True
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

Private Sub DisperseRecdAmt(ByVal mTrnCode As Long)
Dim tRecset As New ADODB.Recordset, mRecdAmtBal As Double, mReqdRecdAmt As Double

With tRecset
.Open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
mRecdAmtBal = .fields("IhrRecdAmt")
End With
CloseTable tRecset

With tRecset
.Open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnICodeField & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    m_dbHmsDatabase.BeginTrans
    Do While .EOF = False
        If InList(.fields("IrcRecState"), Array(cREC_UNCHANGED)) = True Then
            mReqdRecdAmt = .fields("IrcAmtAftDisc") - (.fields("IrcAdvAmt") + .fields("IrcDepoAmt"))
            If mRecdAmtBal > 0 Then
                If Not mRecdAmtBal >= mReqdRecdAmt Then
                    mReqdRecdAmt = mRecdAmtBal
                End If
                .fields("IrcRecdAmt") = mReqdRecdAmt
                .fields("IrcBalAmt") = .fields("IrcAmtAftDisc") - (.fields("IrcAdvAmt") + .fields("IrcDepoAmt")) - mReqdRecdAmt
                .Update
                
                mRecdAmtBal = mRecdAmtBal - mReqdRecdAmt
            Else
                .fields("IrcRecdAmt") = 0
                .fields("IrcBalAmt") = .fields("IrcAmtAftDisc") - (.fields("IrcAdvAmt") + .fields("IrcDepoAmt"))
                .Update
            End If
        Else
            If InList(.fields("IrcRecState"), Array(cREC_CANCELED, cREC_DELETED)) = False Then
                ErrorBox "clsHmsMultiTranEntry_DisperseRecdAmt_#2316_[Invalid Record Status]"
            End If
        End If
        .MoveNext
    Loop
    m_dbHmsDatabase.CommitTrans
Else
    If mRecdAmtBal <> 0 Then
        ErrorBox "clsHmsMultiTranEntry_DisperseRecdAmt_#3002_[Unexpected]"
    End If
End If
End With
CloseTable tRecset

End Sub

Public Function CancelTran(ByVal mTrnCode As Long) As Boolean
Dim t1Recset As New ADODB.Recordset, t2Recset As New ADODB.Recordset
Dim mIpyIhrCode As Long, mIpyDepoAmt As Double
Dim mIfdIhrCode As Long, mIfdRefuAmt As Double
Dim mRecAdded As Boolean, mRecEdited As Boolean, mRecDeleted As Boolean, mRecCanceled As Boolean

CancelTran = False
If Chk_ActiveTran() = False Or mTrnCode <> ActiveTrnCode Then
    ErrorBox "clsHmsMultiTranEntry_CancelTran_#419_[InActive Transaction Entry]"
    GoTo EndSub
End If
mTrnCode = ActiveTrnCode
On Error GoTo errhand

Rem header section
m_dbHmsDatabase.BeginTrans
With t1Recset
.Open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
t2Recset.Open "Select * from " & mTrnHdrTableName & "_Log where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Do While .EOF = False
        t2Recset.Find mTrnHdrCodeField & "=" & CStr(.fields(mTrnHdrCodeField)), Start:=1
        If t2Recset.EOF = False Then
            .fields(mTrnHdrDateField) = t2Recset.fields(mTrnHdrDateField)
            .fields(mTrnVtmField) = t2Recset.fields(mTrnVtmField)
            .fields(mTrnPrefixField) = t2Recset.fields(mTrnPrefixField)
            .fields(mTrnVchNoField) = t2Recset.fields(mTrnVchNoField)
            .fields(mTrnPostfixField) = t2Recset.fields(mTrnPostfixField)
            .fields(mTrnHdrRecStateField) = t2Recset.fields(mTrnHdrRecStateField)
            .fields(mTrnHdrCmpCodeField) = t2Recset.fields(mTrnHdrCmpCodeField)
            
            If blnIndrRcptTran = True Then
                .fields("IhrIpgCode") = t2Recset.fields("IhrIpgCode")
                .fields("IhrTime") = t2Recset.fields("IhrTime")
                .fields("IhrOldIhrCode") = t2Recset.fields("IhrOldIhrCode")
                .fields("IhrPttCode") = t2Recset.fields("IhrPttCode")
                .fields("IhrPttDiscPer") = t2Recset.fields("IhrPttDiscPer")
                .fields("IhrAmtBefDisc") = t2Recset.fields("IhrAmtBefDisc")
                .fields("IhrDiscAmt") = t2Recset.fields("IhrDiscAmt")
                .fields("IhrAmtAftDisc") = t2Recset.fields("IhrAmtAftDisc")
                .fields("IhrAdvAmt") = t2Recset.fields("IhrAdvAmt")
                .fields("IhrRecdAmt") = t2Recset.fields("IhrRecdAmt")
                .fields("IhrDepoAmt") = t2Recset.fields("IhrDepoAmt")
                .fields("IhrRefuAmt") = t2Recset.fields("IhrRefuAmt")
                .fields("IhrBalAmt") = t2Recset.fields("IhrBalAmt")
                .fields("IhrRemark") = t2Recset.fields("IhrRemark")
            
            ElseIf blnIndrPymtTran = True Then
                .fields("IphIpgCode") = t2Recset.fields("IphIpgCode")
                .fields("IphTime") = t2Recset.fields("IphTime")
                .fields("IphOldIphCode") = t2Recset.fields("IphOldIphCode")
                .fields("IphPttCode") = t2Recset.fields("IphPttCode")
                .fields("IphDepoAmt") = t2Recset.fields("IphDepoAmt")
                .fields("IphRemark") = t2Recset.fields("IphRemark")
                
            ElseIf blnIndrRefdTran = True Then
                .fields("IfhIpgCode") = t2Recset.fields("IfhIpgCode")
                .fields("IfhTime") = t2Recset.fields("IfhTime")
                .fields("IfhOldIfhCode") = t2Recset.fields("IfhOldIfhCode")
                .fields("IfhPttCode") = t2Recset.fields("IfhPttCode")
                .fields("IfhRefuAmt") = t2Recset.fields("IfhRefuAmt")
                .fields("IfhRemark") = t2Recset.fields("IfhRemark")
                
            Else
                ErrorBox "clsHmsMultiTranEntry_CancelTran_#459_[Undefined Case]"
            End If
            .Update
        Else
            ' any prior updations can be made here
            .fields(mTrnDtlRecStateField) = ChkDeleteRecStatus(.fields(mTrnDtlRecStateField))
            .Update
            .Delete
        End If
    
        .MoveNext
    Loop
End If
End With
m_dbHmsDatabase.CommitTrans
CloseTable t1Recset
CloseTable t2Recset

Rem detail section
m_dbHmsDatabase.BeginTrans
With t1Recset
Rem important - revert the changes in revert order of updation
.Open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnICodeField & " desc", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
t2Recset.Open "Select * from " & mTrnDtlTableName & "_Log where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnICodeField & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Do While .EOF = False
        t2Recset.Find mTrnICodeField & "=" & CStr(.fields(mTrnICodeField)), Start:=1
        If t2Recset.EOF = False Then
            mRecEdited = False
            mRecDeleted = False
            If .fields(mTrnDtlRecStateField) = cREC_EDITED = True Then
                mRecEdited = True
            ElseIf .fields(mTrnDtlRecStateField) = cREC_DELETED = True Then
                mRecDeleted = True
            End If
            
            .fields(mTrnSnoField) = t2Recset.fields(mTrnSnoField)
            .fields(mTrnDtlDateField) = t2Recset.fields(mTrnDtlDateField)
            .fields(mTrnDtlRecStateField) = t2Recset.fields(mTrnDtlRecStateField)
            .fields(mTrnDtlCmpCodeField) = t2Recset.fields(mTrnDtlCmpCodeField)
            
            If blnIndrRcptTran = True Then
                .fields("IrcPttCode") = t2Recset.fields("IrcPttCode")
                .fields("IrcSrvCode") = t2Recset.fields("IrcSrvCode")
                .fields("IrcUnit") = t2Recset.fields("IrcUnit")
                .fields("IrcRate") = t2Recset.fields("IrcRate")
                .fields("IrcAmtBefDisc") = t2Recset.fields("IrcAmtBefDisc")
                .fields("IrcDiscPer") = t2Recset.fields("IrcDiscPer")
                .fields("IrcDiscAmt") = t2Recset.fields("IrcDiscAmt")
                .fields("IrcAmtAftDisc") = t2Recset.fields("IrcAmtAftDisc")
                .fields("IrcAdvAmt") = t2Recset.fields("IrcAdvAmt")
                .fields("IrcRecdAmt") = t2Recset.fields("IrcRecdAmt")
                .fields("IrcDepoAmt") = t2Recset.fields("IrcDepoAmt")
                .fields("IrcRefuAmt") = t2Recset.fields("IrcRefuAmt")
                .fields("IrcBalAmt") = t2Recset.fields("IrcBalAmt")
                .fields("IrcRemark") = t2Recset.fields("IrcRemark")
            
            ElseIf blnIndrPymtTran = True Then
                mIpyIhrCode = .fields("IpyIhrCode")
                mIpyDepoAmt = .fields("IpyDepoAmt")
                
                .fields("IpyPttCode") = t2Recset.fields("IpyPttCode")
                .fields("IpyIhrCode") = t2Recset.fields("IpyIhrCode")
                .fields("IpyDepoAmt") = t2Recset.fields("IpyDepoAmt")
                .fields("IpyRemark") = t2Recset.fields("IpyRemark")
                
            ElseIf blnIndrRefdTran = True Then
                mIfdIhrCode = .fields("IfdIhrCode")
                mIfdRefuAmt = .fields("IfdRefuAmt")
                
                .fields("IfdPttCode") = t2Recset.fields("IfdPttCode")
                .fields("IfdIhrCode") = t2Recset.fields("IfdIhrCode")
                .fields("IfdRefuAmt") = t2Recset.fields("IfdRefuAmt")
                .fields("IfdRemark") = t2Recset.fields("IfdRemark")
                
            Else
                ErrorBox "clsHmsMultiTranEntry_CancelTran_#506_[Undefined Case]"
            End If
            .Update
            
            If blnIndrPymtTran = True Then
                If mRecEdited = True Then
                    If mIpyIhrCode <> .fields("IpyIhrCode") Then
                        DisperseDepoAmt mIpyIhrCode, (mIpyDepoAmt * -1)                     ' removing deposit amount from old receipt
                        DisperseDepoAmt .fields("IpyIhrCode"), .fields("IpyDepoAmt")        ' adding deposit amount to new receipt
                    ElseIf mIpyDepoAmt <> .fields("IpyDepoAmt") Then
                        mIpyDepoAmt = .fields("IpyDepoAmt") - mIpyDepoAmt
                        DisperseDepoAmt mIpyIhrCode, mIpyDepoAmt
                    End If
                ElseIf mRecDeleted = True Then
                    DisperseDepoAmt .fields("IpyIhrCode"), .fields("IpyDepoAmt")        ' adding deposit amount to restored receipt
                End If
            
            ElseIf blnIndrRefdTran = True Then
                If mRecEdited = True Then
                    If mIfdIhrCode <> .fields("IfdIhrCode") Then
                        DisperseRefuAmt mIfdIhrCode, (mIfdRefuAmt * -1)                     ' removing refund amount from old receipt
                        DisperseRefuAmt .fields("IfdIhrCode"), .fields("IfdRefuAmt")        ' adding refund amount to new receipt
                    ElseIf mIfdRefuAmt <> .fields("IfdRefuAmt") Then
                        mIfdRefuAmt = .fields("IfdRefuAmt") - mIfdRefuAmt
                        DisperseRefuAmt mIfdIhrCode, mIfdRefuAmt
                    End If
                ElseIf mRecDeleted = True Then
                    DisperseRefuAmt .fields("IfdIhrCode"), .fields("IfdRefuAmt")        ' adding refund amount to restored receipt
                End If
            End If
        Else
            mRecAdded = False
            mRecCanceled = False
            If .fields(mTrnDtlRecStateField) = cREC_ADDED = True Then
                mRecAdded = True
            ElseIf .fields(mTrnDtlRecStateField) = cREC_CANCELED = True Then
                mRecCanceled = True
            End If
        
            If blnIndrPymtTran = True Then
                mIpyIhrCode = .fields("IpyIhrCode")
                mIpyDepoAmt = .fields("IpyDepoAmt")
                
            ElseIf blnIndrRefdTran = True Then
                mIfdIhrCode = .fields("IfdIhrCode")
                mIfdRefuAmt = .fields("IfdRefuAmt")
                
            End If
            
            .fields(mTrnDtlRecStateField) = ChkDeleteRecStatus(.fields(mTrnDtlRecStateField))
            .Update
            .Delete
            
            If mRecAdded = True Then
                If blnIndrPymtTran = True Then
                    DisperseDepoAmt mIpyIhrCode, (mIpyDepoAmt * -1)
                ElseIf blnIndrRefdTran = True Then
                    DisperseRefuAmt mIfdIhrCode, (mIfdRefuAmt * -1)
                End If
            End If
        End If
    
        .MoveNext
    Loop
End If
End With
m_dbHmsDatabase.CommitTrans
CloseTable t1Recset
CloseTable t2Recset

CancelTran = True
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

Public Function DeleteTran(ByVal mTrnCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset

DeleteTran = False
If Chk_ActiveTran() = False Or mTrnCode <> ActiveTrnCode Then
    ErrorBox "clsHmsMultiTranEntry_DeleteTran_#551_[InActive Transaction Entry]"
    GoTo EndSub
End If
On Error GoTo errhand

Rem header section
m_dbHmsDatabase.BeginTrans
With tRecset
.Open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
Do While .EOF = False
    .fields(mTrnHdrRecStateField) = ChkDeleteRecStatus(.fields(mTrnHdrRecStateField))
    .Update
    '' .Delete deleted in update transaction
    .MoveNext
Loop
End With
m_dbHmsDatabase.CommitTrans
CloseTable tRecset

Rem detail section
m_dbHmsDatabase.BeginTrans
With tRecset
.Open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnICodeField & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
Do While .EOF = False
    .fields(mTrnDtlRecStateField) = ChkDeleteRecStatus(.fields(mTrnDtlRecStateField))
    .Update
    '' .Delete deleted in update transaction
    
    If blnIndrPymtTran = True Then
        DisperseDepoAmt .fields("IpyIhrCode"), (.fields("IpyDepoAmt") * -1)
    ElseIf blnIndrRefdTran = True Then
        DisperseRefuAmt .fields("IfdIhrCode"), (.fields("IfdRefuAmt") * -1)
    End If
    
    .MoveNext
Loop
End With
m_dbHmsDatabase.CommitTrans
CloseTable tRecset

DeleteTran = True

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

Public Function SelectTran(ByVal mTrnCode As Long) As Boolean
Dim mEntryFound As Boolean
SelectTran = False
If mTrnCode < 1 Then
    ErrorBox "clsHmsMultiTranEntry_SelectTran_#412_[Invalid " & mTitleName & " Entry]"
    Exit Function
End If
mEntryFound = False
For mActiveTran = LBound(aHmsTran) To UBound(aHmsTran)
    If aHmsTran(mActiveTran) = mTrnCode Then
        mEntryFound = True
        Exit For
    End If
Next mActiveTran
If mEntryFound = False Then
    mActiveTran = UBound(aHmsTran) + 1
End If

SelectTran = True
End Function

Public Function NextTran() As Boolean
NextTran = False
If EOTran = True Then
    ErrorBox "clsHmsMultiTranEntry_NextTran_#432_[End of " & mTitleName & " Entry]"
    Exit Function
End If
mActiveTran = mActiveTran + 1

NextTran = True
End Function

Public Function PreviousTran()
PreviousTran = False
If BOTrn = True Then
    ErrorBox "clsHmsMultiTranEntry_PreviousTran_#443_[Begining of " & mTitleName & " Entry]"
    Exit Function
End If
mActiveTran = mActiveTran - 1

PreviousTran = True
End Function

Public Function FirstTran() As Boolean
FirstTran = False
If CountTran = 0 Then
    ErrorBox "clsHmsMultiTranEntry_FirstTran_#454_[No " & mTitleName & " Entry]"
    Exit Function
End If
mActiveTran = LBound(aHmsTran)

FirstTran = True

End Function

Public Function LastTran() As Boolean
LastTran = False
If CountTran = 0 Then
    ErrorBox "clsHmsMultiTranEntry_LastTran_#466_[No " & mTitleName & " Entry]"
    Exit Function
End If
mActiveTran = UBound(aHmsTran)

LastTran = True

End Function

Public Property Get CountTran() As Integer
If UBound(aHmsTran) = -1 Then
    CountTran = 0
Else
    CountTran = UBound(aHmsTran) - LBound(aHmsTran) + 1
End If

End Property

Public Property Get EOTran() As Boolean
EOTran = (mActiveTran > UBound(aHmsTran) Or UBound(aHmsTran) = -1)
End Property

Public Property Get BOTrn() As Boolean
BOTrn = (mActiveTran < LBound(aHmsTran) Or UBound(aHmsTran) = -1)
End Property

Public Function Chk_ActiveTran() As Boolean
If BOTrn = False And EOTran = False Then
    Chk_ActiveTran = True
Else
    Chk_ActiveTran = False
End If

End Function

Public Function AddNewHdr() As Boolean
Dim tRecset As New ADODB.Recordset

AddNewHdr = False
If Chk_ActiveTran() = False Then
    ErrorBox "clsHmsMultiTranEntry_AddNewHdr_#736_[InActive " & mTitleName & " Entry]"
    GoTo EndSub
End If

On Error GoTo errhand
mTrnCode_lng = 0

m_dbHmsDatabase.BeginTrans
With tRecset
.Open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=-0.1", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic

.AddNew

Rem .Fields(mTrnHdrCodeField) = AutoNumber
.fields(mTrnHdrDateField) = mTrnDate_dt
.fields(mTrnVtmField) = mTrnVtmCode_lng
.fields(mTrnPrefixField) = mTrnPrefix_str
.fields(mTrnVchNoField) = mTrnVchNo_lng
.fields(mTrnPostfixField) = mTrnPostfix_str
.fields(mTrnHdrCmpCodeField) = mTrnCmpCode_int
.fields(mTrnHdrRecStateField) = ChkEditRecStatus(.fields(mTrnHdrRecStateField))

If blnIndrRcptTran = True Then
    .fields("IhrIpgCode") = mIhrIpgCode_lng
    .fields("IhrTime") = mIhrTime_lng
    .fields("IhrOldIhrCode") = mIhrOldIhrCode_lng
    .fields("IhrPttCode") = mIhrPttCode_lng
    .fields("IhrPttDiscPer") = mIhrPttDiscPer_dbl
    .fields("IhrAmtBefDisc") = mIhrAmtBefDisc_dbl
    .fields("IhrDiscAmt") = mIhrDiscAmt_dbl
    .fields("IhrAmtAftDisc") = mIhrAmtAftDisc_dbl
    .fields("IhrAdvAmt") = mIhrAdvAmt_dbl
    .fields("IhrRecdAmt") = mIhrRecdAmt_dbl
    .fields("IhrDepoAmt") = mIhrDepoAmt_dbl
    .fields("IhrRefuAmt") = mIhrRefuAmt_dbl
    .fields("IhrBalAmt") = mIhrBalAmt_dbl
    .fields("IhrRemark") = mIhrRemark_str

ElseIf blnIndrPymtTran = True Then
    .fields("IphIpgCode") = mIphIpgCode_lng
    .fields("IphTime") = mIphTime_lng
    .fields("IphOldIphCode") = mIphOldIphCode_lng
    .fields("IphPttCode") = mIphPttCode_lng
    .fields("IphDepoAmt") = mIphDepoAmt_dbl
    .fields("IphRemark") = mIphRemark_str
    
ElseIf blnIndrRefdTran = True Then
    .fields("IfhIpgCode") = mIfhIpgCode_lng
    .fields("IfhTime") = mIfhTime_lng
    .fields("IfhOldIfhCode") = mIfhOldIfhCode_lng
    .fields("IfhPttCode") = mIfhPttCode_lng
    .fields("IfhRefuAmt") = mIfhRefuAmt_dbl
    .fields("IfhRemark") = mIfhRemark_str

Else
    ErrorBox "clsHmsMultiTranEntry_AddNewHdr_#776_[Undefined Case]"
End If
.Update

mTrnCode_lng = .fields(mTrnHdrCodeField)
End With
m_dbHmsDatabase.CommitTrans
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

Public Function AddNewDtl(ByVal mTrnCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset

AddNewDtl = False
If Chk_ActiveTran() = False Or mTrnCode <> ActiveTrnCode Then
    ErrorBox "clsHmsMultiTranEntry_AddNewDtl_#810_[InActive " & mTitleName & " Entry]"
    GoTo EndSub
End If

On Error GoTo errhand
mTrnICode_lng = 0

m_dbHmsDatabase.BeginTrans
With tRecset
.Open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=-0.1", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic

.AddNew

Rem mTrnICode_lng = AutoNumber
.fields(mTrnDtlCodeField) = mTrnCode
.fields(mTrnSnoField) = mTrnSno_int
.fields(mTrnDtlDateField) = mTrnDate_dt
.fields(mTrnDtlCmpCodeField) = mTrnCmpCode_int
.fields(mTrnDtlRecStateField) = ChkEditRecStatus(.fields(mTrnDtlRecStateField))

If blnIndrRcptTran = True Then
    .fields("IrcPttCode") = mIrcPttCode_lng
    .fields("IrcSrvCode") = mIrcSrvCode_dbl
    .fields("IrcUnit") = mIrcUnit_dbl
    .fields("IrcRate") = mIrcRate_dbl
    .fields("IrcAmtBefDisc") = mIrcAmtBefDisc_dbl
    .fields("IrcDiscPer") = mIrcDiscPer_dbl
    .fields("IrcDiscAmt") = mIrcDiscAmt_dbl
    .fields("IrcAmtAftDisc") = mIrcAmtAftDisc_dbl
    .fields("IrcAdvAmt") = mIrcAdvAmt_dbl
    .fields("IrcRecdAmt") = mIrcRecdAmt_dbl
    .fields("IrcDepoAmt") = mIrcDepoAmt_dbl
    .fields("IrcRefuAmt") = mIrcRefuAmt_dbl
    .fields("IrcBalAmt") = mIrcBalAmt_dbl
    .fields("IrcRemark") = mIrcRemark_str
    
ElseIf blnIndrPymtTran = True Then
    .fields("IpyPttCode") = mIpyPttCode_lng
    .fields("IpyIhrCode") = mIpyIhrCode_lng
    .fields("IpyDepoAmt") = mIpyDepoAmt_dbl
    .fields("IpyRemark") = mIpyRemark_str
    
    DisperseDepoAmt mIpyIhrCode_lng, mIpyDepoAmt_dbl
    
ElseIf blnIndrRefdTran = True Then
    .fields("IfdPttCode") = mIfdPttCode_lng
    .fields("IfdIhrCode") = mIfdIhrCode_lng
    .fields("IfdRefuAmt") = mIfdRefuAmt_dbl
    .fields("IfdRemark") = mIfdRemark_str
    
    DisperseRefuAmt mIfdIhrCode_lng, mIfdRefuAmt_dbl
    
Else
    ErrorBox "clsHmsMultiTranEntry_AddNewDtl_#844_[Undefined Case]"
End If
.Update

mTrnICode_lng = .fields(mTrnICodeField)
End With
m_dbHmsDatabase.CommitTrans
CloseTable tRecset

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

Public Function UpdateHdr(ByVal mTrnCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset

UpdateHdr = False
If Chk_ActiveTran() = False Or mTrnCode <> ActiveTrnCode Then
    ErrorBox "clsHmsMultiTranEntry_UpdateDtl_#874_[InActive " & mTitleName & " Entry]"
    GoTo EndSub
End If

On Error GoTo errhand

m_dbHmsDatabase.BeginTrans
With tRecset
.Open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic

Rem .Fields(mTrnHdrCodeField) = AutoNumber
.fields(mTrnHdrDateField) = mTrnDate_dt
.fields(mTrnVtmField) = mTrnVtmCode_lng
.fields(mTrnPrefixField) = mTrnPrefix_str
.fields(mTrnVchNoField) = mTrnVchNo_lng
.fields(mTrnPostfixField) = mTrnPostfix_str
.fields(mTrnHdrCmpCodeField) = mTrnCmpCode_int
.fields(mTrnHdrRecStateField) = ChkEditRecStatus(.fields(mTrnHdrRecStateField))

If blnIndrRcptTran = True Then
    .fields("IhrIpgCode") = mIhrIpgCode_lng
    .fields("IhrTime") = mIhrTime_lng
    .fields("IhrOldIhrCode") = mIhrOldIhrCode_lng
    .fields("IhrPttCode") = mIhrPttCode_lng
    .fields("IhrPttDiscPer") = mIhrPttDiscPer_dbl
    .fields("IhrAmtBefDisc") = mIhrAmtBefDisc_dbl
    .fields("IhrDiscAmt") = mIhrDiscAmt_dbl
    .fields("IhrAmtAftDisc") = mIhrAmtAftDisc_dbl
    .fields("IhrAdvAmt") = mIhrAdvAmt_dbl
    .fields("IhrRecdAmt") = mIhrRecdAmt_dbl
    .fields("IhrDepoAmt") = mIhrDepoAmt_dbl
    .fields("IhrRefuAmt") = mIhrRefuAmt_dbl
    .fields("IhrBalAmt") = mIhrBalAmt_dbl
    .fields("IhrRemark") = mIhrRemark_str
    
ElseIf blnIndrPymtTran = True Then
    .fields("IphIpgCode") = mIphIpgCode_lng
    .fields("IphTime") = mIphTime_lng
    .fields("IphOldIphCode") = mIphOldIphCode_lng
    .fields("IphPttCode") = mIphPttCode_lng
    .fields("IphDepoAmt") = mIphDepoAmt_dbl
    .fields("IphRemark") = mIphRemark_str
    
ElseIf blnIndrRefdTran = True Then
    .fields("IfhIpgCode") = mIfhIpgCode_lng
    .fields("IfhTime") = mIfhTime_lng
    .fields("IfhOldIfhCode") = mIfhOldIfhCode_lng
    .fields("IfhPttCode") = mIfhPttCode_lng
    .fields("IfhRefuAmt") = mIfhRefuAmt_dbl
    .fields("IfhRemark") = mIfhRemark_str
    
Else
    ErrorBox "clsHmsMultiTranEntry_UpdateHdr_#911_[Undefined Case]"
End If
.Update
End With
m_dbHmsDatabase.CommitTrans
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

Public Function UpdateDtl(ByVal mTrnCode As Long, ByVal mTrnICode As Long) As Boolean
Dim tRecset As New ADODB.Recordset
Dim mIpyIhrCode As Long, mIpyDepoAmt As Double
Dim mIfdIhrCode As Long, mIfdRefuAmt As Double

UpdateDtl = False
If Chk_ActiveTran() = False Or mTrnCode <> ActiveTrnCode Then
    ErrorBox "clsHmsMultiTranEntry_UpdateDtl_#936_[InActive " & mTitleName & " Entry]"
    GoTo EndSub
End If

On Error GoTo errhand

m_dbHmsDatabase.BeginTrans
With tRecset
.Open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " and " & mTrnICodeField & "=" & CStr(mTrnICode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic

Rem mTrnICode_lng = AutoNumber
.fields(mTrnDtlCodeField) = mTrnCode_lng
.fields(mTrnSnoField) = mTrnSno_int
.fields(mTrnDtlDateField) = mTrnDate_dt
.fields(mTrnDtlCmpCodeField) = mTrnCmpCode_int
.fields(mTrnDtlRecStateField) = ChkEditRecStatus(.fields(mTrnDtlRecStateField))

If blnIndrRcptTran = True Then
    .fields("IrcPttCode") = mIrcPttCode_lng
    .fields("IrcSrvCode") = mIrcSrvCode_dbl
    .fields("IrcUnit") = mIrcUnit_dbl
    .fields("IrcRate") = mIrcRate_dbl
    .fields("IrcAmtBefDisc") = mIrcAmtBefDisc_dbl
    .fields("IrcDiscPer") = mIrcDiscPer_dbl
    .fields("IrcDiscAmt") = mIrcDiscAmt_dbl
    .fields("IrcAmtAftDisc") = mIrcAmtAftDisc_dbl
    .fields("IrcAdvAmt") = mIrcAdvAmt_dbl
    .fields("IrcRecdAmt") = mIrcRecdAmt_dbl
    .fields("IrcDepoAmt") = mIrcDepoAmt_dbl
    .fields("IrcRefuAmt") = mIrcRefuAmt_dbl
    .fields("IrcBalAmt") = mIrcBalAmt_dbl
    .fields("IrcRemark") = mIrcRemark_str
    
ElseIf blnIndrPymtTran = True Then
    mIpyIhrCode = .fields("IpyIhrCode")
    mIpyDepoAmt = .fields("IpyDepoAmt")
    
    .fields("IpyPttCode") = mIpyPttCode_lng
    .fields("IpyIhrCode") = mIpyIhrCode_lng
    .fields("IpyDepoAmt") = mIpyDepoAmt_dbl
    .fields("IpyRemark") = mIpyRemark_str
    
ElseIf blnIndrRefdTran = True Then
    mIfdIhrCode = .fields("IfdIhrCode")
    mIfdRefuAmt = .fields("IfdRefuAmt")
    
    .fields("IfdPttCode") = mIfdPttCode_lng
    .fields("IfdIhrCode") = mIfdIhrCode_lng
    .fields("IfdRefuAmt") = mIfdRefuAmt_dbl
    .fields("IfdRemark") = mIfdRemark_str
    
Else
    ErrorBox "clsHmsMultiTranEntry_UpdateDtl_#966_[Undefined Case]"
End If
.Update

If blnIndrPymtTran = True Then
    If mIpyIhrCode <> .fields("IpyIhrCode") Then
        DisperseDepoAmt mIpyIhrCode, (mIpyDepoAmt * -1)                 ' removing deposit amount for old receipt
        DisperseDepoAmt .fields("IpyIhrCode"), .fields("IpyDepoAmt")    ' adding deposit amount to new receipt
    ElseIf mIpyDepoAmt <> .fields("IpyDepoAmt") Then
        mIpyDepoAmt = .fields("IpyDepoAmt") - mIpyDepoAmt
        DisperseDepoAmt mIpyIhrCode, mIpyDepoAmt
    End If
    
ElseIf blnIndrRefdTran = True Then
    If mIfdIhrCode <> .fields("IfdIhrCode") Then
        DisperseRefuAmt mIfdIhrCode, (mIfdRefuAmt * -1)                 ' removing refund amount for old receipt
        DisperseRefuAmt .fields("IfdIhrCode"), .fields("IfdRefuAmt")    ' adding refund amount to new receipt
    ElseIf mIfdRefuAmt <> .fields("IfdRefuAmt") Then
        mIfdRefuAmt = .fields("IfdRefuAmt") - mIfdRefuAmt
        DisperseRefuAmt mIfdIhrCode, mIfdRefuAmt
    End If
    
End If

End With
m_dbHmsDatabase.CommitTrans
CloseTable tRecset

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

Public Function DeleteDtl(ByVal mTrnCode As Long, ByVal mTrnICode As Long, Optional mConfirm As Boolean) As Boolean
Dim tRecset As New ADODB.Recordset, mDeleteit As Boolean

DeleteDtl = False
If Chk_ActiveTran() = False Or mTrnCode <> ActiveTrnCode Then
    ErrorBox "clsHmsMultiTranEntry_DeleteDtl_#995_[InActive " & mTitleName & " Entry]"
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
    
    m_dbHmsDatabase.BeginTrans
    With tRecset
    .Open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " and " & mTrnICodeField & "=" & CStr(mTrnICode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
    
    .fields(mTrnDtlRecStateField) = ChkDeleteRecStatus(.fields(mTrnDtlRecStateField))
    .Update
    End With
    If blnIndrPymtTran = True Then
        DisperseDepoAmt tRecset.fields("IpyIhrCode"), (tRecset.fields("IpyDepoAmt") * -1)
    ElseIf blnIndrRefdTran = True Then
        DisperseRefuAmt tRecset.fields("IfdIhrCode"), (tRecset.fields("IfdRefuAmt") * -1)
    End If
    m_dbHmsDatabase.CommitTrans
    CloseTable tRecset
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

Private Sub DisperseDepoAmt(ByVal mIpyIhrCode As Long, ByVal mIpyDepoAmt_diff As Double)
Dim tRecset As New ADODB.Recordset, mIpyDepoAmtTot As Double, mReqdDepoAmt As Double

On Error GoTo errhand

m_dbHmsDatabase.BeginTrans
mIpyDepoAmtTot = 0
With tRecset
.Open "Select * from IndrRcpt where IrcCode=" & CStr(mIpyIhrCode) & " order by IrcSno" & IIf(mIpyDepoAmt_diff < 0, " desc", ""), m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 And mIpyDepoAmt_diff <> 0 Then
    Do While .EOF = False
        If mIpyDepoAmt_diff > 0 Then
            mReqdDepoAmt = .fields("IrcAmtAftDisc") - (.fields("IrcAdvAmt") + .fields("IrcRecdAmt") + .fields("IrcDepoAmt") + .fields("IrcRefuAmt"))
            If mReqdDepoAmt > 0 Then
                If Not mIpyDepoAmt_diff >= mReqdDepoAmt Then
                    mReqdDepoAmt = mIpyDepoAmt_diff
                End If
                .fields("IrcDepoAmt") = .fields("IrcDepoAmt") + mReqdDepoAmt
                .fields("IrcBalAmt") = .fields("IrcBalAmt") - mReqdDepoAmt
                .Update
                
                mIpyDepoAmt_diff = mIpyDepoAmt_diff - mReqdDepoAmt
            End If
        ElseIf mIpyDepoAmt_diff < 0 Then
            mReqdDepoAmt = .fields("IrcDepoAmt")
            If mReqdDepoAmt > 0 Then
                If Not Abs(mIpyDepoAmt_diff) >= mReqdDepoAmt Then
                    mReqdDepoAmt = Abs(mIpyDepoAmt_diff)
                End If
                .fields("IrcDepoAmt") = .fields("IrcDepoAmt") - mReqdDepoAmt
                .fields("IrcBalAmt") = .fields("IrcBalAmt") + mReqdDepoAmt
                .Update
                
                mIpyDepoAmt_diff = mIpyDepoAmt_diff + mReqdDepoAmt
            End If
        ElseIf mIpyDepoAmt_diff = 0 Then
            Exit Do
        End If
        mIpyDepoAmtTot = mIpyDepoAmtTot + .fields("IrcDepoAmt")
        
        .MoveNext
    Loop
End If
End With
m_dbHmsDatabase.CommitTrans
CloseTable tRecset

m_dbHmsDatabase.BeginTrans
With tRecset
.Open "Select * from IndrHdr where IhrCode=" & CStr(mIpyIhrCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
.fields("IhrDepoAmt") = mIpyDepoAmtTot
.fields("IhrBalAmt") = .fields("IhrAmtAftDisc") - (.fields("IhrAdvAmt") + .fields("IhrRecdAmt") + .fields("IhrDepoAmt"))
.Update
End With
m_dbHmsDatabase.CommitTrans
CloseTable tRecset

GoTo EndSub

errhand:
MsgBox Err.Description
If InList(tRecset.EditMode, Array(adEditAdd, adEditDelete, adEditInProgress)) = True Then
    tRecset.CancelUpdate
    tRecset.ActiveConnection.Cancel
End If

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Sub

End Sub

Private Sub DisperseRefuAmt(ByVal mIfdIhrCode As Long, ByVal mIfdRefuAmt_diff As Double)
Dim tRecset As New ADODB.Recordset, mIfdRefuAmtTot As Double, mReqdRefuAmt As Double

On Error GoTo errhand

m_dbHmsDatabase.BeginTrans
mIfdRefuAmtTot = 0
With tRecset
.Open "Select * from IndrRcpt where IrcCode=" & CStr(mIfdIhrCode) & " order by IrcSno" & IIf(mIfdRefuAmt_diff < 0, " desc", ""), m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 And mIfdRefuAmt_diff <> 0 Then
    Do While .EOF = False
        If mIfdRefuAmt_diff > 0 Then
            mReqdRefuAmt = (.fields("IrcAdvAmt") + .fields("IrcRecdAmt") + .fields("IrcDepoAmt")) - .fields("IrcRefuAmt")
            If mReqdRefuAmt > 0 Then
                If Not mIfdRefuAmt_diff >= mReqdRefuAmt Then
                    mReqdRefuAmt = mIfdRefuAmt_diff
                End If
                .fields("IrcRefuAmt") = .fields("IrcRefuAmt") + mReqdRefuAmt
                .fields("IrcBalAmt") = .fields("IrcBalAmt") + mReqdRefuAmt
                .Update
                
                mIfdRefuAmt_diff = mIfdRefuAmt_diff - mReqdRefuAmt
            End If
        ElseIf mIfdRefuAmt_diff < 0 Then
            mReqdRefuAmt = .fields("IrcRefuAmt")
            If mReqdRefuAmt > 0 Then
                If Not Abs(mIfdRefuAmt_diff) >= mReqdRefuAmt Then
                    mReqdRefuAmt = Abs(mIfdRefuAmt_diff)
                End If
                .fields("IrcRefuAmt") = .fields("IrcRefuAmt") - mReqdRefuAmt
                .fields("IrcBalAmt") = .fields("IrcBalAmt") - mReqdRefuAmt
                .Update
                
                mIfdRefuAmt_diff = mIfdRefuAmt_diff + mReqdRefuAmt
            End If
        ElseIf mIfdRefuAmt_diff = 0 Then
            Exit Do
        End If
        mIfdRefuAmtTot = mIfdRefuAmtTot + .fields("IrcRefuAmt")
        
        .MoveNext
    Loop
End If
End With
m_dbHmsDatabase.CommitTrans
CloseTable tRecset

m_dbHmsDatabase.BeginTrans
With tRecset
.Open "Select * from IndrHdr where IhrCode=" & CStr(mIfdIhrCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
.fields("IhrRefuAmt") = mIfdRefuAmtTot
.fields("IhrBalAmt") = .fields("IhrAmtAftDisc") - (.fields("IhrAdvAmt") + .fields("IhrRecdAmt") + .fields("IhrDepoAmt"))
.Update
End With
m_dbHmsDatabase.CommitTrans
CloseTable tRecset

GoTo EndSub

errhand:
MsgBox Err.Description
If InList(tRecset.EditMode, Array(adEditAdd, adEditDelete, adEditInProgress)) = True Then
    tRecset.CancelUpdate
    tRecset.ActiveConnection.Cancel
End If

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Sub

End Sub

Private Function Data_CreateLog(ByVal mTrnCode As Long) As Boolean
Dim t1Recset As New ADODB.Recordset, t2Recset As New ADODB.Recordset

Data_CreateLog = False
If Chk_ActiveTran() = False Or mTrnCode <> ActiveTrnCode Then
    ErrorBox "clsHmsMultiTranEntry_Data_CreateLog_#406_[InActive " & mTitleName & " Entry]"
    GoTo EndSub
End If

t1Recset.Open "Select * from " & mTrnDtlTableName & "_Log where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnICodeField & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
t2Recset.Open "Select * from " & mTrnHdrTableName & "_Log where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
If t1Recset.RecordCount = 0 And t2Recset.RecordCount = 0 Then
    m_dbHmsDatabase.BeginTrans
    m_dbHmsDatabase.Execute "Insert into " & mTrnDtlTableName & "_Log Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " and " & mTrnDtlRecStateField & "=" & CStr(cREC_UNCHANGED) & ""
    m_dbHmsDatabase.Execute "Insert into " & mTrnHdrTableName & "_Log Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & " and " & mTrnHdrRecStateField & "=" & CStr(cREC_UNCHANGED) & ""
    m_dbHmsDatabase.CommitTrans
Else
    AlertBox "clsJounral_Data_CreateLog_#419_[Unsaved " & mTitleName & " Entry]"
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

Private Function Data_RemoveLog(ByVal mTrnCode As Long) As Boolean
Data_RemoveLog = False
If Chk_ActiveTran() = False Then
    ErrorBox "clsHmsMultiTranEntry_Data_RemoveLog_#1041_[InActive " & mTitleName & " Entry]"
    Exit Function
End If

m_dbHmsDatabase.BeginTrans
m_dbHmsDatabase.Execute "Delete from " & mTrnDtlTableName & "_Log where " & mTrnDtlCodeField & "=" & CStr(mTrnCode)
m_dbHmsDatabase.Execute "Delete from " & mTrnHdrTableName & "_Log where " & mTrnHdrCodeField & "=" & CStr(mTrnCode)
m_dbHmsDatabase.CommitTrans

Data_RemoveLog = True

End Function

Public Function CanDeleteTran(ByVal mTrnCode As Long, Optional ByVal mSkipConfirm As Boolean) As Boolean
Dim mDeleteit As Boolean

mDeleteit = True

If ChkEntryExist(mTrnCode) = True Then
    ErrorBox "Entry Exist !!!"
    mDeleteit = False
End If
If mDeleteit = True And mSkipConfirm = False Then
    mDeleteit = CanDelete()
End If

CanDeleteTran = mDeleteit

End Function

Public Function ChkEntryExist(ByVal mTrnCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset, t1Recset As New ADODB.Recordset

ChkEntryExist = False
If blnIndrRcptTran = True Then
    With tRecset
    .Open "Select * from IndrPymtDtl dtl inner join IndrPymtHdr hdr on dtl.IpyCode=hdr.IphCode where IpyIhrCode=" & CStr(mTrnCode) & " order by IpyDate desc,IphVchNo desc", m_dbHmsDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        AlertBox "Indoor Receipt No." & CStr(.fields("IphVchNo")) & " Dated " & Dtoc(.fields("IphDate")) & " !!!"
        ChkEntryExist = True
    End If
    End With
    CloseTable tRecset
    
    If ChkEntryExist = False Then
        With tRecset
        .Open "Select * from IndrRefdDtl dtl inner join IndrRefdHdr hdr on dtl.IfdCode=hdr.IfhCode where IfdIhrCode=" & CStr(mTrnCode) & " order by IfdDate desc,IfhVchNo desc", m_dbHmsDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            AlertBox "Indoor Receipt No." & CStr(.fields("IfhVchNo")) & " Dated " & Dtoc(.fields("IfhDate")) & " !!!"
            ChkEntryExist = True
        End If
        End With
        CloseTable tRecset
    End If
ElseIf blnIndrPymtTran = True Then
    Dim mIpyDepoAmt As Double, mIpyIhrCode As Long
    With tRecset
    .Open "Select * from IndrPymtDtl dtl inner join IndrPymtHdr hdr on dtl.IpyCode=hdr.IphCode where IpyCode=" & CStr(mTrnCode) & " order by IpyICode", m_dbHmsDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        Do While .EOF = False And ChkEntryExist = False
            mIpyIhrCode = .fields("IpyIhrCode")
            mIpyDepoAmt = .fields("IpyDepoAmt")
            
            With t1Recset
            .Open "Select * from IndrHdr hdr inner join VTypMast vtm on hdr.IhrVtmCode=vtm.VtmCode where IhrCode=" & CStr(mIpyIhrCode) & "", m_dbComDatabase, adOpenKeyset, adLockReadOnly
            If .RecordCount > 0 Then
                If .fields("IhrRefuAmt") > (.fields("IhrAdvAmt") + .fields("IhrRecdAmt") + .fields("IhrDepoAmt") - mIpyDepoAmt) Then
                    ErrorBox "Excess Amount Refunded for Receipt No." & .fields("VtmName") & "-" & CStr(.fields("IhrVchNo")) & " Dated " & Dtoc(.fields("IhrDate")) & " !!!"
                    ChkEntryExist = True
                End If
            End If
            End With
            CloseTable t1Recset
            
            .MoveNext
        Loop
    End If
    End With
    CloseTable tRecset
    
ElseIf blnIndrRefdTran = True Then
    Rem does not affect transaction for any negative balance
    
End If


EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Function


End Function


