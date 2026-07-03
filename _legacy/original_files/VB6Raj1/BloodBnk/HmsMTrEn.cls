VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsHmsMultiTranEntry"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Dim m_dbHmsDatabase As ADODB.Connection, m_dbAcDatabase As ADODB.Connection, m_dbComDatabase As ADODB.Connection
Dim mClassUIdCode As Long, mClassUIdFileName As String, mClassAcsPermFileName As String
Dim mTrnHdrTableName As String, mTrnDtlTableName As String, mTrnHdrCodeField As String, mTrnDtlCodeField As String, mTrnHdrDateField As String, mTrnDtlDateField As String, mTrnVtmField As String, mTrnPrefixField As String, mTrnVchNoField As String, mTrnPostfixField As String, mTrnICodeField As String, mTrnSnoField As String, mTrnHdrRecStateField As String, mTrnDtlRecStateField As String, mTrnHdrCmpCodeField As String, mTrnDtlCmpCodeField As String, mTitleName As String
Public blnOutdRcptTran As Boolean, blnOutdPymtTran As Boolean, blnOutdRefdTran As Boolean
Rem common class variables used in both header and detail
Public mTrnCode_lng As Long, mTrnVtmCode_lng As Long, mTrnPrefix_str As String, mTrnVchNo_lng As Long, mTrnPostfix_str As String, mTrnDate_dt As Date, mTrnCmpCode_int As Integer
Rem common class header variables
Public mTrnHdrRecState_int As Integer
Rem common class detail variables
Public mTrnICode_lng As Long, mTrnSno_int As Integer, mTrnDtlRecState_int As Integer
Rem outdoor receipt header variables
Public mOhrOpgCode_lng As Long, mOhrPttCode_lng As Long, mOhrTime_lng As Long, mOhrOldOhrCode_lng As Long, mOhrPttDiscPer_dbl As Long, mOhrAmtBefDisc_dbl As Double, mOhrDiscAmt_dbl As Double, mOhrAmtAftDisc_dbl As Double, mOhrAdvAmt_dbl As Double, mOhrRecdAmt_dbl As Double, mOhrDepoAmt_dbl As Double, mOhrRefuAmt_dbl As Double, mOhrBalAmt_dbl As Double, mOhrRemark_str As String
Rem outdoor receipt detail variables
Public mOrcSrvCode_dbl As Double, mOrcPttCode_lng As Long, mOrcUnit_dbl As Double, mOrcRate_dbl As Double, mOrcAmtBefDisc_dbl As Double, mOrcDiscPer_dbl As Double, mOrcDiscAmt_dbl As Double, mOrcAmtAftDisc_dbl As Double, mOrcAdvAmt_dbl As Double, mOrcRecdAmt_dbl As Double, mOrcDepoAmt_dbl As Double, mOrcRefuAmt_dbl As Double, mOrcBalAmt_dbl As Double, mOrcRemark_str As String
Rem outdoor payment receipt header variables
Public mOphOpgCode_lng As Long, mOphTime_lng As Long, mOphOldOphCode_lng As Long, mOphPttCode_lng As Long, mOphDepoAmt_dbl As Double, mOphRemark_str As String
Rem outdoor payment receipt detail variables
Public mOpyPttCode_lng As Long, mOpyOhrCode_lng As Long, mOpyDepoAmt_dbl As Double, mOpyRemark_str As String
Rem outdoor refund receipt header variables
Public mOfhOpgCode_lng As Long, mOfhTime_lng As Long, mOfhOldOfhCode_lng As Long, mOfhPttCode_lng As Long, mOfhRefuAmt_dbl As Double, mOfhRemark_str As String
Rem outdoor refund receipt detail variables
Public mOfdPttCode_lng As Long, mOfdOhrCode_lng As Long, mOfdRefuAmt_dbl As Double, mOfdRemark_str As String

Dim mActiveTran As Integer, aHmsTran() As Variant
Public clsPAT As clsHmsMasterEntry, clsSRV As clsHmsMasterEntry, clsDPT As clsHmsMasterEntry

Public Sub Init()
If blnOutdRcptTran = True Then
    mTrnHdrTableName = "OutdHdr": mTrnDtlTableName = "OutdRcpt"
    mTrnHdrCodeField = "OhrCode": mTrnDtlCodeField = "OrcCode"
    mTrnHdrDateField = "OhrDate": mTrnDtlDateField = "OrcDate"
    mTrnHdrRecStateField = "OhrRecState": mTrnDtlRecStateField = "OrcRecState"
    mTrnHdrCmpCodeField = "OhrCmpCode": mTrnDtlCmpCodeField = "OrcCmpCode"
    mTrnVtmField = "OhrVtmCode"
    mTrnPrefixField = "OhrPrefix"
    mTrnVchNoField = "OhrVchNo"
    mTrnPostfixField = "OhrPostfix"
    mTrnICodeField = "OrcICode"
    mTrnSnoField = "OrcSno"
    mTitleName = "Outdoor Receipt"
    
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
    
ElseIf blnOutdPymtTran = True Then
    mTrnHdrTableName = "OutdPymtHdr": mTrnDtlTableName = "OutdPymtDtl"
    mTrnHdrCodeField = "OphCode": mTrnDtlCodeField = "OpyCode"
    mTrnHdrDateField = "OphDate": mTrnDtlDateField = "OpyDate"
    mTrnHdrRecStateField = "OphRecState": mTrnDtlRecStateField = "OpyRecState"
    mTrnHdrCmpCodeField = "OphCmpCode": mTrnDtlCmpCodeField = "OpyCmpCode"
    mTrnVtmField = "OphVtmCode"
    mTrnPrefixField = "OphPrefix"
    mTrnVchNoField = "OphVchNo"
    mTrnPostfixField = "OphPostfix"
    mTrnICodeField = "OpyICode"
    mTrnSnoField = "OpySno"
    mTitleName = "Outdoor Due Payment"
    
    Set clsPAT = New clsHmsMasterEntry
    Set clsPAT.dbHmsDatabase = m_dbHmsDatabase
    Set clsPAT.dbAcDatabase = m_dbAcDatabase
    clsPAT.blnPatMast = True
    clsPAT.Init
    
ElseIf blnOutdRefdTran = True Then
    mTrnHdrTableName = "OutdRefdHdr": mTrnDtlTableName = "OutdRefdDtl"
    mTrnHdrCodeField = "OfhCode": mTrnDtlCodeField = "OfdCode"
    mTrnHdrDateField = "OfhDate": mTrnDtlDateField = "OfdDate"
    mTrnHdrRecStateField = "OfhRecState": mTrnDtlRecStateField = "OfdRecState"
    mTrnHdrCmpCodeField = "OfhCmpCode": mTrnDtlCmpCodeField = "OfdCmpCode"
    mTrnVtmField = "OfhVtmCode"
    mTrnPrefixField = "OfhPrefix"
    mTrnVchNoField = "OfhVchNo"
    mTrnPostfixField = "OfhPostfix"
    mTrnICodeField = "OfdICode"
    mTrnSnoField = "OfdSno"
    mTitleName = "Outdoor Refund"
    
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
    
    If blnOutdRcptTran = True Then
        mOhrOpgCode_lng = .fields("OhrOpgCode")
        mOhrTime_lng = .fields("OhrTime")
        mOhrOldOhrCode_lng = .fields("OhrOldOhrCode")
        mOhrPttCode_lng = .fields("OhrPttCode")
        mOhrPttDiscPer_dbl = .fields("OhrPttDiscPer")
        mOhrAmtBefDisc_dbl = .fields("OhrAmtBefDisc")
        mOhrDiscAmt_dbl = .fields("OhrDiscAmt")
        mOhrAmtAftDisc_dbl = .fields("OhrAmtAftDisc")
        mOhrAdvAmt_dbl = .fields("OhrAdvAmt")
        mOhrRecdAmt_dbl = .fields("OhrRecdAmt")
        mOhrDepoAmt_dbl = .fields("OhrDepoAmt")
        mOhrRefuAmt_dbl = .fields("OhrRefuAmt")
        mOhrBalAmt_dbl = .fields("OhrBalAmt")
        mOhrRemark_str = .fields("OhrRemark")
        
        clsPAT.GetData .fields("OhrPttCode")
        
    ElseIf blnOutdPymtTran = True Then
        mOphOpgCode_lng = .fields("OphOpgCode")
        mOphTime_lng = .fields("OphTime")
        mOphOldOphCode_lng = .fields("OphOldOphCode")
        mOphPttCode_lng = .fields("OphPttCode")
        mOphDepoAmt_dbl = .fields("OphDepoAmt")
        mOphRemark_str = .fields("OphRemark")
        
        clsPAT.GetData .fields("OphPttCode")
    
    ElseIf blnOutdRefdTran = True Then
        mOfhOpgCode_lng = .fields("OfhOpgCode")
        mOfhTime_lng = .fields("OfhTime")
        mOfhOldOfhCode_lng = .fields("OfhOldOfhCode")
        mOfhPttCode_lng = .fields("OfhPttCode")
        mOfhRefuAmt_dbl = .fields("OfhRefuAmt")
        mOfhRemark_str = .fields("OfhRemark")
        
        clsPAT.GetData .fields("OfhPttCode")
        
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
    
    If blnOutdRcptTran = True Then
        mOrcPttCode_lng = .fields("OrcPttCode")
        mOrcSrvCode_dbl = .fields("OrcSrvCode")
        mOrcUnit_dbl = .fields("OrcUnit")
        mOrcRate_dbl = .fields("OrcRate")
        mOrcAmtBefDisc_dbl = .fields("OrcAmtBefDisc")
        mOrcDiscPer_dbl = .fields("OrcDiscPer")
        mOrcDiscAmt_dbl = .fields("OrcDiscAmt")
        mOrcAmtAftDisc_dbl = .fields("OrcAmtAftDisc")
        mOrcAdvAmt_dbl = .fields("OrcAdvAmt")
        mOrcRecdAmt_dbl = .fields("OrcRecdAmt")
        mOrcDepoAmt_dbl = .fields("OrcDepoAmt")
        mOrcRefuAmt_dbl = .fields("OrcRefuAmt")
        mOrcBalAmt_dbl = .fields("OrcBalAmt")
        mOrcRemark_str = .fields("OrcRemark")
        
        clsSRV.GetData .fields("OrcSrvCode")
    
    ElseIf blnOutdPymtTran = True Then
        mOpyPttCode_lng = .fields("OpyPttCode")
        mOpyOhrCode_lng = .fields("OpyOhrCode")
        mOpyDepoAmt_dbl = .fields("OpyDepoAmt")
        mOpyRemark_str = .fields("OpyRemark")
        
    ElseIf blnOutdRefdTran = True Then
        mOfdPttCode_lng = .fields("OfdPttCode")
        mOfdOhrCode_lng = .fields("OfdOhrCode")
        mOfdRefuAmt_dbl = .fields("OfdRefuAmt")
        mOfdRemark_str = .fields("OfdRemark")
        
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

If blnOutdRcptTran = True Then
    mOhrOpgCode_lng = 0
    mOhrTime_lng = 0
    mOhrOldOhrCode_lng = 0
    mOhrPttCode_lng = 0
    mOhrPttDiscPer_dbl = 0
    mOhrAmtBefDisc_dbl = 0
    mOhrDiscAmt_dbl = 0
    mOhrAmtAftDisc_dbl = 0
    mOhrAdvAmt_dbl = 0
    mOhrRecdAmt_dbl = 0
    mOhrDepoAmt_dbl = 0
    mOhrRefuAmt_dbl = 0
    mOhrBalAmt_dbl = 0
    mOhrRemark_str = ""
    
    clsPAT.Clear

ElseIf blnOutdPymtTran = True Then
    mOphOpgCode_lng = 0
    mOphTime_lng = 0
    mOphOldOphCode_lng = 0
    mOphPttCode_lng = 0
    mOphDepoAmt_dbl = 0
    mOphRemark_str = ""
    
    clsPAT.Clear

ElseIf blnOutdRefdTran = True Then
    mOfhOpgCode_lng = 0
    mOfhTime_lng = 0
    mOfhOldOfhCode_lng = 0
    mOfhPttCode_lng = 0
    mOfhRefuAmt_dbl = 0
    mOfhRemark_str = ""
    
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

If blnOutdRcptTran = True Then
    mOrcPttCode_lng = 0
    mOrcSrvCode_dbl = 0
    mOrcUnit_dbl = 0
    mOrcRate_dbl = 0
    mOrcAmtBefDisc_dbl = 0
    mOrcDiscPer_dbl = 0
    mOrcDiscAmt_dbl = 0
    mOrcAmtAftDisc_dbl = 0
    mOrcAdvAmt_dbl = 0
    mOrcRecdAmt_dbl = 0
    mOrcDepoAmt_dbl = 0
    mOrcRefuAmt_dbl = 0
    mOrcBalAmt_dbl = 0
    mOrcRemark_str = ""
    
    clsSRV.Clear

ElseIf blnOutdPymtTran = True Then
    mOpyPttCode_lng = 0
    mOpyOhrCode_lng = 0
    mOpyDepoAmt_dbl = 0
    mOpyRemark_str = ""

ElseIf blnOutdRefdTran = True Then
    mOfdPttCode_lng = 0
    mOfdOhrCode_lng = 0
    mOfdRefuAmt_dbl = 0
    mOfdRemark_str = ""
    
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
            If blnOutdRcptTran = True Then
                .fields("OhrBalAmt") = .fields("OhrAmtAftDisc") - (.fields("OhrAdvAmt") + .fields("OhrRecdAmt") + .fields("OhrDepoAmt"))
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
            If blnOutdRcptTran = True Then
                If .fields("OrcPttCode") <> mOhrPttCode_lng Then
                    .fields("OrcPttCode") = mOhrPttCode_lng
                End If
            ElseIf blnOutdPymtTran = True Then
                If .fields("OpyPttCode") <> mOphPttCode_lng Then
                    .fields("OpyPttCode") = mOphPttCode_lng
                End If
            
            ElseIf blnOutdRefdTran = True Then
                If .fields("OfdPttCode") <> mOfhPttCode_lng Then
                    .fields("OfdPttCode") = mOfhPttCode_lng
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
    If blnOutdRcptTran = True Then
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
mRecdAmtBal = .fields("OhrRecdAmt")
End With
CloseTable tRecset

With tRecset
.Open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnICodeField & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    m_dbHmsDatabase.BeginTrans
    Do While .EOF = False
        If InList(.fields("OrcRecState"), Array(cREC_UNCHANGED)) = True Then
            mReqdRecdAmt = .fields("OrcAmtAftDisc") - (.fields("OrcAdvAmt") + .fields("OrcDepoAmt"))
            If mRecdAmtBal > 0 Then
                If Not mRecdAmtBal >= mReqdRecdAmt Then
                    mReqdRecdAmt = mRecdAmtBal
                End If
                .fields("OrcRecdAmt") = mReqdRecdAmt
                .fields("OrcBalAmt") = .fields("OrcAmtAftDisc") - (.fields("OrcAdvAmt") + .fields("OrcDepoAmt")) - mReqdRecdAmt
                .Update
                
                mRecdAmtBal = mRecdAmtBal - mReqdRecdAmt
            Else
                .fields("OrcRecdAmt") = 0
                .fields("OrcBalAmt") = .fields("OrcAmtAftDisc") - (.fields("OrcAdvAmt") + .fields("OrcDepoAmt"))
                .Update
            End If
        Else
            If InList(.fields("OrcRecState"), Array(cREC_CANCELED, cREC_DELETED)) = False Then
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
Dim mOpyOhrCode As Long, mOpyDepoAmt As Double
Dim mOfdOhrCode As Long, mOfdRefuAmt As Double
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
            
            If blnOutdRcptTran = True Then
                .fields("OhrOpgCode") = t2Recset.fields("OhrOpgCode")
                .fields("OhrTime") = t2Recset.fields("OhrTime")
                .fields("OhrOldOhrCode") = t2Recset.fields("OhrOldOhrCode")
                .fields("OhrPttCode") = t2Recset.fields("OhrPttCode")
                .fields("OhrPttDiscPer") = t2Recset.fields("OhrPttDiscPer")
                .fields("OhrAmtBefDisc") = t2Recset.fields("OhrAmtBefDisc")
                .fields("OhrDiscAmt") = t2Recset.fields("OhrDiscAmt")
                .fields("OhrAmtAftDisc") = t2Recset.fields("OhrAmtAftDisc")
                .fields("OhrAdvAmt") = t2Recset.fields("OhrAdvAmt")
                .fields("OhrRecdAmt") = t2Recset.fields("OhrRecdAmt")
                .fields("OhrDepoAmt") = t2Recset.fields("OhrDepoAmt")
                .fields("OhrRefuAmt") = t2Recset.fields("OhrRefuAmt")
                .fields("OhrBalAmt") = t2Recset.fields("OhrBalAmt")
                .fields("OhrRemark") = t2Recset.fields("OhrRemark")
            
            ElseIf blnOutdPymtTran = True Then
                .fields("OphOpgCode") = t2Recset.fields("OphOpgCode")
                .fields("OphTime") = t2Recset.fields("OphTime")
                .fields("OphOldOphCode") = t2Recset.fields("OphOldOphCode")
                .fields("OphPttCode") = t2Recset.fields("OphPttCode")
                .fields("OphDepoAmt") = t2Recset.fields("OphDepoAmt")
                .fields("OphRemark") = t2Recset.fields("OphRemark")
                
            ElseIf blnOutdRefdTran = True Then
                .fields("OfhOpgCode") = t2Recset.fields("OfhOpgCode")
                .fields("OfhTime") = t2Recset.fields("OfhTime")
                .fields("OfhOldOfhCode") = t2Recset.fields("OfhOldOfhCode")
                .fields("OfhPttCode") = t2Recset.fields("OfhPttCode")
                .fields("OfhRefuAmt") = t2Recset.fields("OfhRefuAmt")
                .fields("OfhRemark") = t2Recset.fields("OfhRemark")
                
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
            
            If blnOutdRcptTran = True Then
                .fields("OrcPttCode") = t2Recset.fields("OrcPttCode")
                .fields("OrcSrvCode") = t2Recset.fields("OrcSrvCode")
                .fields("OrcUnit") = t2Recset.fields("OrcUnit")
                .fields("OrcRate") = t2Recset.fields("OrcRate")
                .fields("OrcAmtBefDisc") = t2Recset.fields("OrcAmtBefDisc")
                .fields("OrcDiscPer") = t2Recset.fields("OrcDiscPer")
                .fields("OrcDiscAmt") = t2Recset.fields("OrcDiscAmt")
                .fields("OrcAmtAftDisc") = t2Recset.fields("OrcAmtAftDisc")
                .fields("OrcAdvAmt") = t2Recset.fields("OrcAdvAmt")
                .fields("OrcRecdAmt") = t2Recset.fields("OrcRecdAmt")
                .fields("OrcDepoAmt") = t2Recset.fields("OrcDepoAmt")
                .fields("OrcRefuAmt") = t2Recset.fields("OrcRefuAmt")
                .fields("OrcBalAmt") = t2Recset.fields("OrcBalAmt")
                .fields("OrcRemark") = t2Recset.fields("OrcRemark")
            
            ElseIf blnOutdPymtTran = True Then
                mOpyOhrCode = .fields("OpyOhrCode")
                mOpyDepoAmt = .fields("OpyDepoAmt")
                
                .fields("OpyPttCode") = t2Recset.fields("OpyPttCode")
                .fields("OpyOhrCode") = t2Recset.fields("OpyOhrCode")
                .fields("OpyDepoAmt") = t2Recset.fields("OpyDepoAmt")
                .fields("OpyRemark") = t2Recset.fields("OpyRemark")
                
            ElseIf blnOutdRefdTran = True Then
                mOfdOhrCode = .fields("OfdOhrCode")
                mOfdRefuAmt = .fields("OfdRefuAmt")
                
                .fields("OfdPttCode") = t2Recset.fields("OfdPttCode")
                .fields("OfdOhrCode") = t2Recset.fields("OfdOhrCode")
                .fields("OfdRefuAmt") = t2Recset.fields("OfdRefuAmt")
                .fields("OfdRemark") = t2Recset.fields("OfdRemark")
                
            Else
                ErrorBox "clsHmsMultiTranEntry_CancelTran_#506_[Undefined Case]"
            End If
            .Update
            
            If blnOutdPymtTran = True Then
                If mRecEdited = True Then
                    If mOpyOhrCode <> .fields("OpyOhrCode") Then
                        DisperseDepoAmt mOpyOhrCode, (mOpyDepoAmt * -1)                     ' removing deposit amount from old receipt
                        DisperseDepoAmt .fields("OpyOhrCode"), .fields("OpyDepoAmt")        ' adding deposit amount to new receipt
                    ElseIf mOpyDepoAmt <> .fields("OpyDepoAmt") Then
                        mOpyDepoAmt = .fields("OpyDepoAmt") - mOpyDepoAmt
                        DisperseDepoAmt mOpyOhrCode, mOpyDepoAmt
                    End If
                ElseIf mRecDeleted = True Then
                    DisperseDepoAmt .fields("OpyOhrCode"), .fields("OpyDepoAmt")        ' adding deposit amount to restored receipt
                End If
            
            ElseIf blnOutdRefdTran = True Then
                If mRecEdited = True Then
                    If mOfdOhrCode <> .fields("OfdOhrCode") Then
                        DisperseRefuAmt mOfdOhrCode, (mOfdRefuAmt * -1)                     ' removing refund amount from old receipt
                        DisperseRefuAmt .fields("OfdOhrCode"), .fields("OfdRefuAmt")        ' adding refund amount to new receipt
                    ElseIf mOfdRefuAmt <> .fields("OfdRefuAmt") Then
                        mOfdRefuAmt = .fields("OfdRefuAmt") - mOfdRefuAmt
                        DisperseRefuAmt mOfdOhrCode, mOfdRefuAmt
                    End If
                ElseIf mRecDeleted = True Then
                    DisperseRefuAmt .fields("OfdOhrCode"), .fields("OfdRefuAmt")        ' adding refund amount to restored receipt
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
        
            If blnOutdPymtTran = True Then
                mOpyOhrCode = .fields("OpyOhrCode")
                mOpyDepoAmt = .fields("OpyDepoAmt")
                
            ElseIf blnOutdRefdTran = True Then
                mOfdOhrCode = .fields("OfdOhrCode")
                mOfdRefuAmt = .fields("OfdRefuAmt")
                
            End If
            
            .fields(mTrnDtlRecStateField) = ChkDeleteRecStatus(.fields(mTrnDtlRecStateField))
            .Update
            .Delete
            
            If mRecAdded = True Then
                If blnOutdPymtTran = True Then
                    DisperseDepoAmt mOpyOhrCode, (mOpyDepoAmt * -1)
                ElseIf blnOutdRefdTran = True Then
                    DisperseRefuAmt mOfdOhrCode, (mOfdRefuAmt * -1)
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
    
    If blnOutdPymtTran = True Then
        DisperseDepoAmt .fields("OpyOhrCode"), (.fields("OpyDepoAmt") * -1)
    ElseIf blnOutdRefdTran = True Then
        DisperseRefuAmt .fields("OfdOhrCode"), (.fields("OfdRefuAmt") * -1)
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

If blnOutdRcptTran = True Then
    .fields("OhrOpgCode") = mOhrOpgCode_lng
    .fields("OhrTime") = mOhrTime_lng
    .fields("OhrOldOhrCode") = mOhrOldOhrCode_lng
    .fields("OhrPttCode") = mOhrPttCode_lng
    .fields("OhrPttDiscPer") = mOhrPttDiscPer_dbl
    .fields("OhrAmtBefDisc") = mOhrAmtBefDisc_dbl
    .fields("OhrDiscAmt") = mOhrDiscAmt_dbl
    .fields("OhrAmtAftDisc") = mOhrAmtAftDisc_dbl
    .fields("OhrAdvAmt") = mOhrAdvAmt_dbl
    .fields("OhrRecdAmt") = mOhrRecdAmt_dbl
    .fields("OhrDepoAmt") = mOhrDepoAmt_dbl
    .fields("OhrRefuAmt") = mOhrRefuAmt_dbl
    .fields("OhrBalAmt") = mOhrBalAmt_dbl
    .fields("OhrRemark") = mOhrRemark_str

ElseIf blnOutdPymtTran = True Then
    .fields("OphOpgCode") = mOphOpgCode_lng
    .fields("OphTime") = mOphTime_lng
    .fields("OphOldOphCode") = mOphOldOphCode_lng
    .fields("OphPttCode") = mOphPttCode_lng
    .fields("OphDepoAmt") = mOphDepoAmt_dbl
    .fields("OphRemark") = mOphRemark_str
    
ElseIf blnOutdRefdTran = True Then
    .fields("OfhOpgCode") = mOfhOpgCode_lng
    .fields("OfhTime") = mOfhTime_lng
    .fields("OfhOldOfhCode") = mOfhOldOfhCode_lng
    .fields("OfhPttCode") = mOfhPttCode_lng
    .fields("OfhRefuAmt") = mOfhRefuAmt_dbl
    .fields("OfhRemark") = mOfhRemark_str

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

If blnOutdRcptTran = True Then
    .fields("OrcPttCode") = mOrcPttCode_lng
    .fields("OrcSrvCode") = mOrcSrvCode_dbl
    .fields("OrcUnit") = mOrcUnit_dbl
    .fields("OrcRate") = mOrcRate_dbl
    .fields("OrcAmtBefDisc") = mOrcAmtBefDisc_dbl
    .fields("OrcDiscPer") = mOrcDiscPer_dbl
    .fields("OrcDiscAmt") = mOrcDiscAmt_dbl
    .fields("OrcAmtAftDisc") = mOrcAmtAftDisc_dbl
    .fields("OrcAdvAmt") = mOrcAdvAmt_dbl
    .fields("OrcRecdAmt") = mOrcRecdAmt_dbl
    .fields("OrcDepoAmt") = mOrcDepoAmt_dbl
    .fields("OrcRefuAmt") = mOrcRefuAmt_dbl
    .fields("OrcBalAmt") = mOrcBalAmt_dbl
    .fields("OrcRemark") = mOrcRemark_str
    
ElseIf blnOutdPymtTran = True Then
    .fields("OpyPttCode") = mOpyPttCode_lng
    .fields("OpyOhrCode") = mOpyOhrCode_lng
    .fields("OpyDepoAmt") = mOpyDepoAmt_dbl
    .fields("OpyRemark") = mOpyRemark_str
    
    DisperseDepoAmt mOpyOhrCode_lng, mOpyDepoAmt_dbl
    
ElseIf blnOutdRefdTran = True Then
    .fields("OfdPttCode") = mOfdPttCode_lng
    .fields("OfdOhrCode") = mOfdOhrCode_lng
    .fields("OfdRefuAmt") = mOfdRefuAmt_dbl
    .fields("OfdRemark") = mOfdRemark_str
    
    DisperseRefuAmt mOfdOhrCode_lng, mOfdRefuAmt_dbl
    
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

If blnOutdRcptTran = True Then
    .fields("OhrOpgCode") = mOhrOpgCode_lng
    .fields("OhrTime") = mOhrTime_lng
    .fields("OhrOldOhrCode") = mOhrOldOhrCode_lng
    .fields("OhrPttCode") = mOhrPttCode_lng
    .fields("OhrPttDiscPer") = mOhrPttDiscPer_dbl
    .fields("OhrAmtBefDisc") = mOhrAmtBefDisc_dbl
    .fields("OhrDiscAmt") = mOhrDiscAmt_dbl
    .fields("OhrAmtAftDisc") = mOhrAmtAftDisc_dbl
    .fields("OhrAdvAmt") = mOhrAdvAmt_dbl
    .fields("OhrRecdAmt") = mOhrRecdAmt_dbl
    .fields("OhrDepoAmt") = mOhrDepoAmt_dbl
    .fields("OhrRefuAmt") = mOhrRefuAmt_dbl
    .fields("OhrBalAmt") = mOhrBalAmt_dbl
    .fields("OhrRemark") = mOhrRemark_str
    
ElseIf blnOutdPymtTran = True Then
    .fields("OphOpgCode") = mOphOpgCode_lng
    .fields("OphTime") = mOphTime_lng
    .fields("OphOldOphCode") = mOphOldOphCode_lng
    .fields("OphPttCode") = mOphPttCode_lng
    .fields("OphDepoAmt") = mOphDepoAmt_dbl
    .fields("OphRemark") = mOphRemark_str
    
ElseIf blnOutdRefdTran = True Then
    .fields("OfhOpgCode") = mOfhOpgCode_lng
    .fields("OfhTime") = mOfhTime_lng
    .fields("OfhOldOfhCode") = mOfhOldOfhCode_lng
    .fields("OfhPttCode") = mOfhPttCode_lng
    .fields("OfhRefuAmt") = mOfhRefuAmt_dbl
    .fields("OfhRemark") = mOfhRemark_str
    
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
Dim mOpyOhrCode As Long, mOpyDepoAmt As Double
Dim mOfdOhrCode As Long, mOfdRefuAmt As Double

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

If blnOutdRcptTran = True Then
    .fields("OrcPttCode") = mOrcPttCode_lng
    .fields("OrcSrvCode") = mOrcSrvCode_dbl
    .fields("OrcUnit") = mOrcUnit_dbl
    .fields("OrcRate") = mOrcRate_dbl
    .fields("OrcAmtBefDisc") = mOrcAmtBefDisc_dbl
    .fields("OrcDiscPer") = mOrcDiscPer_dbl
    .fields("OrcDiscAmt") = mOrcDiscAmt_dbl
    .fields("OrcAmtAftDisc") = mOrcAmtAftDisc_dbl
    .fields("OrcAdvAmt") = mOrcAdvAmt_dbl
    .fields("OrcRecdAmt") = mOrcRecdAmt_dbl
    .fields("OrcDepoAmt") = mOrcDepoAmt_dbl
    .fields("OrcRefuAmt") = mOrcRefuAmt_dbl
    .fields("OrcBalAmt") = mOrcBalAmt_dbl
    .fields("OrcRemark") = mOrcRemark_str
    
ElseIf blnOutdPymtTran = True Then
    mOpyOhrCode = .fields("OpyOhrCode")
    mOpyDepoAmt = .fields("OpyDepoAmt")
    
    .fields("OpyPttCode") = mOpyPttCode_lng
    .fields("OpyOhrCode") = mOpyOhrCode_lng
    .fields("OpyDepoAmt") = mOpyDepoAmt_dbl
    .fields("OpyRemark") = mOpyRemark_str
    
ElseIf blnOutdRefdTran = True Then
    mOfdOhrCode = .fields("OfdOhrCode")
    mOfdRefuAmt = .fields("OfdRefuAmt")
    
    .fields("OfdPttCode") = mOfdPttCode_lng
    .fields("OfdOhrCode") = mOfdOhrCode_lng
    .fields("OfdRefuAmt") = mOfdRefuAmt_dbl
    .fields("OfdRemark") = mOfdRemark_str
    
Else
    ErrorBox "clsHmsMultiTranEntry_UpdateDtl_#966_[Undefined Case]"
End If
.Update

If blnOutdPymtTran = True Then
    If mOpyOhrCode <> .fields("OpyOhrCode") Then
        DisperseDepoAmt mOpyOhrCode, (mOpyDepoAmt * -1)                 ' removing deposit amount for old receipt
        DisperseDepoAmt .fields("OpyOhrCode"), .fields("OpyDepoAmt")    ' adding deposit amount to new receipt
    ElseIf mOpyDepoAmt <> .fields("OpyDepoAmt") Then
        mOpyDepoAmt = .fields("OpyDepoAmt") - mOpyDepoAmt
        DisperseDepoAmt mOpyOhrCode, mOpyDepoAmt
    End If
    
ElseIf blnOutdRefdTran = True Then
    If mOfdOhrCode <> .fields("OfdOhrCode") Then
        DisperseRefuAmt mOfdOhrCode, (mOfdRefuAmt * -1)                 ' removing refund amount for old receipt
        DisperseRefuAmt .fields("OfdOhrCode"), .fields("OfdRefuAmt")    ' adding refund amount to new receipt
    ElseIf mOfdRefuAmt <> .fields("OfdRefuAmt") Then
        mOfdRefuAmt = .fields("OfdRefuAmt") - mOfdRefuAmt
        DisperseRefuAmt mOfdOhrCode, mOfdRefuAmt
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
    If blnOutdPymtTran = True Then
        DisperseDepoAmt tRecset.fields("OpyOhrCode"), (tRecset.fields("OpyDepoAmt") * -1)
    ElseIf blnOutdRefdTran = True Then
        DisperseRefuAmt tRecset.fields("OfdOhrCode"), (tRecset.fields("OfdRefuAmt") * -1)
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

Private Sub DisperseDepoAmt(ByVal mOpyOhrCode As Long, ByVal mOpyDepoAmt_diff As Double)
Dim tRecset As New ADODB.Recordset, mOpyDepoAmtTot As Double, mReqdDepoAmt As Double

On Error GoTo errhand

m_dbHmsDatabase.BeginTrans
mOpyDepoAmtTot = 0
With tRecset
.Open "Select * from OutdRcpt where OrcCode=" & CStr(mOpyOhrCode) & " order by OrcSno" & IIf(mOpyDepoAmt_diff < 0, " desc", ""), m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 And mOpyDepoAmt_diff <> 0 Then
    Do While .EOF = False
        If mOpyDepoAmt_diff > 0 Then
            mReqdDepoAmt = .fields("OrcAmtAftDisc") - (.fields("OrcAdvAmt") + .fields("OrcRecdAmt") + .fields("OrcDepoAmt") + .fields("OrcRefuAmt"))
            If mReqdDepoAmt > 0 Then
                If Not mOpyDepoAmt_diff >= mReqdDepoAmt Then
                    mReqdDepoAmt = mOpyDepoAmt_diff
                End If
                .fields("OrcDepoAmt") = .fields("OrcDepoAmt") + mReqdDepoAmt
                .fields("OrcBalAmt") = .fields("OrcBalAmt") - mReqdDepoAmt
                .Update
                
                mOpyDepoAmt_diff = mOpyDepoAmt_diff - mReqdDepoAmt
            End If
        ElseIf mOpyDepoAmt_diff < 0 Then
            mReqdDepoAmt = .fields("OrcDepoAmt")
            If mReqdDepoAmt > 0 Then
                If Not Abs(mOpyDepoAmt_diff) >= mReqdDepoAmt Then
                    mReqdDepoAmt = Abs(mOpyDepoAmt_diff)
                End If
                .fields("OrcDepoAmt") = .fields("OrcDepoAmt") - mReqdDepoAmt
                .fields("OrcBalAmt") = .fields("OrcBalAmt") + mReqdDepoAmt
                .Update
                
                mOpyDepoAmt_diff = mOpyDepoAmt_diff + mReqdDepoAmt
            End If
        ElseIf mOpyDepoAmt_diff = 0 Then
            Exit Do
        End If
        mOpyDepoAmtTot = mOpyDepoAmtTot + .fields("OrcDepoAmt")
        
        .MoveNext
    Loop
End If
End With
m_dbHmsDatabase.CommitTrans
CloseTable tRecset

m_dbHmsDatabase.BeginTrans
With tRecset
.Open "Select * from OutdHdr where OhrCode=" & CStr(mOpyOhrCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
.fields("OhrDepoAmt") = mOpyDepoAmtTot
.fields("OhrBalAmt") = .fields("OhrAmtAftDisc") - (.fields("OhrAdvAmt") + .fields("OhrRecdAmt") + .fields("OhrDepoAmt"))
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

Private Sub DisperseRefuAmt(ByVal mOfdOhrCode As Long, ByVal mOfdRefuAmt_diff As Double)
Dim tRecset As New ADODB.Recordset, mOfdRefuAmtTot As Double, mReqdRefuAmt As Double

On Error GoTo errhand

m_dbHmsDatabase.BeginTrans
mOfdRefuAmtTot = 0
With tRecset
.Open "Select * from OutdRcpt where OrcCode=" & CStr(mOfdOhrCode) & " order by OrcSno" & IIf(mOfdRefuAmt_diff < 0, " desc", ""), m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 And mOfdRefuAmt_diff <> 0 Then
    Do While .EOF = False
        If mOfdRefuAmt_diff > 0 Then
            mReqdRefuAmt = (.fields("OrcAdvAmt") + .fields("OrcRecdAmt") + .fields("OrcDepoAmt")) - .fields("OrcRefuAmt")
            If mReqdRefuAmt > 0 Then
                If Not mOfdRefuAmt_diff >= mReqdRefuAmt Then
                    mReqdRefuAmt = mOfdRefuAmt_diff
                End If
                .fields("OrcRefuAmt") = .fields("OrcRefuAmt") + mReqdRefuAmt
                .fields("OrcBalAmt") = .fields("OrcBalAmt") + mReqdRefuAmt
                .Update
                
                mOfdRefuAmt_diff = mOfdRefuAmt_diff - mReqdRefuAmt
            End If
        ElseIf mOfdRefuAmt_diff < 0 Then
            mReqdRefuAmt = .fields("OrcRefuAmt")
            If mReqdRefuAmt > 0 Then
                If Not Abs(mOfdRefuAmt_diff) >= mReqdRefuAmt Then
                    mReqdRefuAmt = Abs(mOfdRefuAmt_diff)
                End If
                .fields("OrcRefuAmt") = .fields("OrcRefuAmt") - mReqdRefuAmt
                .fields("OrcBalAmt") = .fields("OrcBalAmt") - mReqdRefuAmt
                .Update
                
                mOfdRefuAmt_diff = mOfdRefuAmt_diff + mReqdRefuAmt
            End If
        ElseIf mOfdRefuAmt_diff = 0 Then
            Exit Do
        End If
        mOfdRefuAmtTot = mOfdRefuAmtTot + .fields("OrcRefuAmt")
        
        .MoveNext
    Loop
End If
End With
m_dbHmsDatabase.CommitTrans
CloseTable tRecset

m_dbHmsDatabase.BeginTrans
With tRecset
.Open "Select * from OutdHdr where OhrCode=" & CStr(mOfdOhrCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
.fields("OhrRefuAmt") = mOfdRefuAmtTot
.fields("OhrBalAmt") = .fields("OhrAmtAftDisc") - (.fields("OhrAdvAmt") + .fields("OhrRecdAmt") + .fields("OhrDepoAmt"))
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
If blnOutdRcptTran = True Then
    With tRecset
    .Open "Select * from OutdPymtDtl dtl inner join OutdPymtHdr hdr on dtl.OpyCode=hdr.OphCode where OpyOhrCode=" & CStr(mTrnCode) & " order by OpyDate desc,OphVchNo desc", m_dbHmsDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        AlertBox "Outdoor Receipt No." & CStr(.fields("OphVchNo")) & " Dated " & Dtoc(.fields("OphDate")) & " !!!"
        ChkEntryExist = True
    End If
    End With
    CloseTable tRecset
    
    If ChkEntryExist = False Then
        With tRecset
        .Open "Select * from OutdRefdDtl dtl inner join OutdRefdHdr hdr on dtl.OfdCode=hdr.OfhCode where OfdOhrCode=" & CStr(mTrnCode) & " order by OfdDate desc,OfhVchNo desc", m_dbHmsDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            AlertBox "Outdoor Receipt No." & CStr(.fields("OfhVchNo")) & " Dated " & Dtoc(.fields("OfhDate")) & " !!!"
            ChkEntryExist = True
        End If
        End With
        CloseTable tRecset
    End If
ElseIf blnOutdPymtTran = True Then
    Dim mOpyDepoAmt As Double, mOpyOhrCode As Long
    With tRecset
    .Open "Select * from OutdPymtDtl dtl inner join OutdPymtHdr hdr on dtl.OpyCode=hdr.OphCode where OpyCode=" & CStr(mTrnCode) & " order by OpyICode", m_dbHmsDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        Do While .EOF = False And ChkEntryExist = False
            mOpyOhrCode = .fields("OpyOhrCode")
            mOpyDepoAmt = .fields("OpyDepoAmt")
            
            With t1Recset
            .Open "Select * from OutdHdr hdr inner join VTypMast vtm on hdr.OhrVtmCode=vtm.VtmCode where OhrCode=" & CStr(mOpyOhrCode) & "", m_dbComDatabase, adOpenKeyset, adLockReadOnly
            If .RecordCount > 0 Then
                If .fields("OhrRefuAmt") > (.fields("OhrAdvAmt") + .fields("OhrRecdAmt") + .fields("OhrDepoAmt") - mOpyDepoAmt) Then
                    ErrorBox "Excess Amount Refunded for Receipt No." & .fields("VtmName") & "-" & CStr(.fields("OhrVchNo")) & " Dated " & Dtoc(.fields("OhrDate")) & " !!!"
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
    
ElseIf blnOutdRefdTran = True Then
    Rem does not affect transaction for any negative balance
    
End If


EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Function


End Function

