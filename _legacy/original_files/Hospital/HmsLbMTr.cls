VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsHmsLabMultiTranEntry"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False

Option Explicit

Dim mCrashedEntry As Boolean
Dim m_dbHmsDatabase As ADODB.Connection, m_dbAcDatabase As ADODB.Connection, m_dbComDatabase As ADODB.Connection
Dim mClassUIdCode As Long, mClassUIdFileName As String, mClassAcsPermFileName As String, mClassDtlUIdFileName As String, mClassDtlAcsPermFileName As String
Dim mTrnHdrTableName As String, mTrnDtlTableName As String, mTrnHdrCodeField As String, mTrnDtlCodeField As String, mTrnHdrDateField As String, mTrnDtlDateField As String, mTrnVtmField As String, mTrnPrefixField As String, mTrnVchNoField As String, mTrnPostfixField As String, mTrnDtlICodeField As String, mTrnDtlSnoField As String, mTrnHdrRecStateField As String, mTrnDtlRecStateField As String, mTrnHdrCmpCodeField As String, mTrnDtlCmpCodeField As String, mTitleName As String
Dim mTrnSdcTableName As String, mTrnSdcCodeField As String, mTrnSdcSubCodeField As String, mTrnSdcICodeField As String, mTrnSdcSnoField As String, mTrnSdcDateField As String, mTrnSdcPttCodeField As String, mTrnSdcSrvCodeField As String, mTrnSdcDctCodeField As String, mTrnSdcDrlCodeField As String, mTrnSdcRemarkField As String, mTrnSdcRecStateField As String, mTrnSdcCmpCodeField As String
Public blnLabRcptTran As Boolean, blnLabPymtTran As Boolean, blnLabRefdTran As Boolean
Rem common class variables used in both header and detail
Public mTrnCode_lng As Long, mTrnVtmCode_lng As Long, mTrnPrefix_str As String, mTrnVchNo_lng As Long, mTrnPostfix_str As String, mTrnDate_dt As Date, mTrnCmpCode_int As Integer
Rem common class header variables
Public mTrnHdrRecState_int As Integer
Rem common class detail variables
Public mTrnDtlICode_lng As Long, mTrnDtlSno_int As Integer, mTrnDtlRecState_int As Integer
Rem service doctor detail variables
Public mSdcCode_lng As Long, mSdcSubCode_lng As Long, mSdcICode_lng As Long, mSdcSno_int As Integer, mSdcDate_dt As Date, mSdcPttCode_lng As Long, mSdcSrvCode_lng As Long, mSdcDctCode_lng As Long, mSdcDrlCode_lng As Long, mSdcRemark_str As String, mSdcRecState_int As Integer, mSdcCmpCode_int As Long
Rem lab receipt header variables
Public mLhrLpgCode_lng As Long, mLhrPttCode_lng As Long, mLhrCDctCode_lng As Long, mLhrRByCode_lng As Long, mLhrRToCode_lng As Long, mLhrPDigCode_lng As Long, mLhrFDigCode_lng As Long, mLhrTime_lng As Long, mLhrOldLhrCode_lng As Long, mLhrPttDiscPer_dbl As Long, mLhrAmtBefDisc_dbl As Double, mLhrDiscAmt_dbl As Double, mLhrAmtAftDisc_dbl As Double, mLhrAdvAmt_dbl As Double, mLhrRecdAmt_dbl As Double, mLhrDepoAmt_dbl As Double, mLhrRefuAmt_dbl As Double, mLhrBalAmt_dbl As Double, mLhrRemark_str As String
Rem lab receipt detail variables
Public mLrcSrvCode_lng As Long, mLrcPttCode_lng As Long, mLrcUnit_dbl As Double, mLrcRate_dbl As Double, mLrcAmtBefDisc_dbl As Double, mLrcDiscPer_dbl As Double, mLrcDiscAmt_dbl As Double, mLrcAmtAftDisc_dbl As Double, mLrcAdvAmt_dbl As Double, mLrcRecdAmt_dbl As Double, mLrcDepoAmt_dbl As Double, mLrcRefuAmt_dbl As Double, mLrcBalAmt_dbl As Double, mLrcRemark_str As String
Rem lab payment receipt header variables
Public mLphLpgCode_lng As Long, mLphLhrCode_lng As Long, mLphTime_lng As Long, mLphOldLphCode_lng As Long, mLphPttCode_lng As Long, mLphDepoAmt_dbl As Double, mLphRemark_str As String
Rem lab payment receipt detail variables
Public mLpyPttCode_lng As Long, mLpyLhrCode_lng As Long, mLpyDepoAmt_dbl As Double, mLpyRemark_str As String
Rem lab refund receipt header variables
Public mLfhLpgCode_lng As Long, mLfhLhrCode_lng As Long, mLfhTime_lng As Long, mLfhOldLfhCode_lng As Long, mLfhPttCode_lng As Long, mLfhRefuAmt_dbl As Double, mLfhRemark_str As String
Rem lab refund receipt detail variables
Public mLfdPttCode_lng As Long, mLfdLhrCode_lng As Long, mLfdRefuAmt_dbl As Double, mLfdRemark_str As String

Dim mActiveTran As Integer, aHmsTran() As Variant
Public clsPAT As clsHmsMasterEntry, clsSRV As clsHmsMasterEntry, clsDPT As clsHmsMasterEntry

Public Sub Init()
If blnLabRcptTran = True Then
    mTrnHdrTableName = "LabHdr": mTrnDtlTableName = "LabRcpt"
    mTrnHdrCodeField = "LhrCode": mTrnDtlCodeField = "LrcCode"
    mTrnHdrDateField = "LhrDate": mTrnDtlDateField = "LrcDate"
    mTrnHdrRecStateField = "LhrRecState": mTrnDtlRecStateField = "LrcRecState"
    mTrnHdrCmpCodeField = "LhrCmpCode": mTrnDtlCmpCodeField = "LrcCmpCode"
    mTrnVtmField = "LhrVtmCode"
    mTrnPrefixField = "LhrPrefix"
    mTrnVchNoField = "LhrVchNo"
    mTrnPostfixField = "LhrPostfix"
    mTrnDtlICodeField = "LrcICode"
    mTrnDtlSnoField = "LrcSno"
    mTitleName = "Lab Receipt"
    Rem service doctor detail
    mTrnSdcTableName = "LabRcDctDtl"
    mTrnSdcCodeField = "LrdCode"
    mTrnSdcSubCodeField = "LrdLrcCode"
    mTrnSdcICodeField = "LrdICode"
    mTrnSdcSnoField = "LrdSno"
    mTrnSdcDateField = "LrdDate"
    mTrnSdcPttCodeField = "LrdPttCode"
    mTrnSdcSrvCodeField = "LrdSrvCode"
    mTrnSdcDctCodeField = "LrdDctCode"
    mTrnSdcDrlCodeField = "LrdDrlCode"
    mTrnSdcRemarkField = "LrdRemark"
    mTrnSdcRecStateField = "LrdRecState"
    mTrnSdcCmpCodeField = "LrdCmpCode"
    ' -----------------
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
    
ElseIf blnLabPymtTran = True Then
    mTrnHdrTableName = "LabPymtHdr": mTrnDtlTableName = "LabPymtDtl"
    mTrnHdrCodeField = "LphCode": mTrnDtlCodeField = "LpyCode"
    mTrnHdrDateField = "LphDate": mTrnDtlDateField = "LpyDate"
    mTrnHdrRecStateField = "LphRecState": mTrnDtlRecStateField = "LpyRecState"
    mTrnHdrCmpCodeField = "LphCmpCode": mTrnDtlCmpCodeField = "LpyCmpCode"
    mTrnVtmField = "LphVtmCode"
    mTrnPrefixField = "LphPrefix"
    mTrnVchNoField = "LphVchNo"
    mTrnPostfixField = "LphPostfix"
    mTrnDtlICodeField = "LpyICode"
    mTrnDtlSnoField = "LpySno"
    mTitleName = "Lab Due Payment"
    
    Set clsPAT = New clsHmsMasterEntry
    Set clsPAT.dbHmsDatabase = m_dbHmsDatabase
    Set clsPAT.dbAcDatabase = m_dbAcDatabase
    clsPAT.blnPatMast = True
    clsPAT.Init
    
ElseIf blnLabRefdTran = True Then
    mTrnHdrTableName = "LabRefdHdr": mTrnDtlTableName = "LabRefdDtl"
    mTrnHdrCodeField = "LfhCode": mTrnDtlCodeField = "LfdCode"
    mTrnHdrDateField = "LfhDate": mTrnDtlDateField = "LfdDate"
    mTrnHdrRecStateField = "LfhRecState": mTrnDtlRecStateField = "LfdRecState"
    mTrnHdrCmpCodeField = "LfhCmpCode": mTrnDtlCmpCodeField = "LfdCmpCode"
    mTrnVtmField = "LfhVtmCode"
    mTrnPrefixField = "LfhPrefix"
    mTrnVchNoField = "LfhVchNo"
    mTrnPostfixField = "LfhPostfix"
    mTrnDtlICodeField = "LfdICode"
    mTrnDtlSnoField = "LfdSno"
    mTitleName = "Lab Refund"
    
    Set clsPAT = New clsHmsMasterEntry
    Set clsPAT.dbHmsDatabase = m_dbHmsDatabase
    Set clsPAT.dbAcDatabase = m_dbAcDatabase
    clsPAT.blnPatMast = True
    clsPAT.Init
    
    
Else
    ErrorBox "clsHmsLabMultiTranEntry_Init_#73_[Undefined Case]"
End If

End Sub

Public Property Set dbHmsDatabase(ByRef db As ADODB.Connection)
Set m_dbHmsDatabase = db


End Property

Public Property Set dbAcDatabase(ByRef db As ADODB.Connection)
Set m_dbAcDatabase = db


End Property

Public Property Set dbComDatabase(ByRef db As ADODB.Connection)
Set m_dbComDatabase = db

End Property

Private Sub Class_Initialize()
aHmsTran = Array()
mActiveTran = UBound(aHmsTran)

mClassUIdFileName = "clsHmsLabMultiTrn.UId"
mClassAcsPermFileName = "clsHmsLabMultiTrn.Acp"
mClassDtlUIdFileName = "clsHmsLabMultiTrnDtl.UId"
mClassDtlAcsPermFileName = "clsHmsLabMultiTrnDtl.Acp"

mClassUIdCode = GetUIdCode("clsHmsLabMultiTranEntry_Initialize", mUIdFileName:=mClassUIdFileName, mAcsPermFileName:=mClassAcsPermFileName)

End Sub

Public Sub GetHdrData(ByVal mTrnCode As Long)
Dim tRecset As New ADODB.Recordset

Me.ClearHdr
With tRecset
.open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    mTrnCode_lng = .fields(mTrnHdrCodeField)
    mTrnDate_dt = .fields(mTrnHdrDateField)
    mTrnVtmCode_lng = .fields(mTrnVtmField)
    mTrnPrefix_str = .fields(mTrnPrefixField)
    mTrnVchNo_lng = .fields(mTrnVchNoField)
    mTrnPostfix_str = .fields(mTrnPostfixField)
    mTrnHdrRecState_int = .fields(mTrnHdrRecStateField)
    mTrnCmpCode_int = .fields(mTrnHdrCmpCodeField)
    
    If blnLabRcptTran = True Then
        mLhrLpgCode_lng = .fields("LhrLpgCode")
        mLhrTime_lng = .fields("LhrTime")
        mLhrOldLhrCode_lng = .fields("LhrOldLhrCode")
        mLhrPttCode_lng = .fields("LhrPttCode")
        mLhrCDctCode_lng = .fields("LhrCDctCode")
        mLhrRByCode_lng = .fields("LhrRByCode")
        mLhrRToCode_lng = .fields("LhrRToCode")
        mLhrPDigCode_lng = .fields("LhrPDigCode")
        mLhrFDigCode_lng = .fields("LhrFDigCode")
        mLhrPttDiscPer_dbl = .fields("LhrPttDiscPer")
        mLhrAmtBefDisc_dbl = .fields("LhrAmtBefDisc")
        mLhrDiscAmt_dbl = .fields("LhrDiscAmt")
        mLhrAmtAftDisc_dbl = .fields("LhrAmtAftDisc")
        mLhrAdvAmt_dbl = .fields("LhrAdvAmt")
        mLhrRecdAmt_dbl = .fields("LhrRecdAmt")
        mLhrDepoAmt_dbl = .fields("LhrDepoAmt")
        mLhrRefuAmt_dbl = .fields("LhrRefuAmt")
        mLhrBalAmt_dbl = .fields("LhrBalAmt")
        mLhrRemark_str = .fields("LhrRemark")
        
        clsPAT.GetData .fields("LhrPttCode")
        
    ElseIf blnLabPymtTran = True Then
        mLphLpgCode_lng = .fields("LphLpgCode")
        mLphLhrCode_lng = .fields("LphLhrCode")
        mLphTime_lng = .fields("LphTime")
        mLphOldLphCode_lng = .fields("LphOldLphCode")
        mLphPttCode_lng = .fields("LphPttCode")
        mLphDepoAmt_dbl = .fields("LphDepoAmt")
        mLphRemark_str = .fields("LphRemark")
        
        clsPAT.GetData .fields("LphPttCode")
    
    ElseIf blnLabRefdTran = True Then
        mLfhLpgCode_lng = .fields("LfhLpgCode")
        mLfhLhrCode_lng = .fields("LfhLhrCode")
        mLfhTime_lng = .fields("LfhTime")
        mLfhOldLfhCode_lng = .fields("LfhOldLfhCode")
        mLfhPttCode_lng = .fields("LfhPttCode")
        mLfhRefuAmt_dbl = .fields("LfhRefuAmt")
        mLfhRemark_str = .fields("LfhRemark")
        
        clsPAT.GetData .fields("LfhPttCode")
        
        
    Else
        ErrorBox "clsHmsLabMultiTranEntry_GetHdrData_#133_[Undefined Case]"
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
    .open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " and " & mTrnDtlICodeField & "=" & CStr(mTrnICode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
Else
    .open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " and " & mTrnDtlSnoField & "=" & CStr(mTrnSno) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
End If
If .EOF = False Then
    mTrnCode_lng = .fields(mTrnDtlCodeField)
    mTrnDtlICode_lng = .fields(mTrnDtlICodeField)
    mTrnDtlSno_int = .fields(mTrnDtlSnoField)
    mTrnDate_dt = .fields(mTrnDtlDateField)
    mTrnDtlRecState_int = .fields(mTrnDtlRecStateField)
    mTrnCmpCode_int = .fields(mTrnDtlCmpCodeField)
    
    If blnLabRcptTran = True Then
        mLrcPttCode_lng = .fields("LrcPttCode")
        mLrcSrvCode_lng = .fields("LrcSrvCode")
        mLrcUnit_dbl = .fields("LrcUnit")
        mLrcRate_dbl = .fields("LrcRate")
        mLrcAmtBefDisc_dbl = .fields("LrcAmtBefDisc")
        mLrcDiscPer_dbl = .fields("LrcDiscPer")
        mLrcDiscAmt_dbl = .fields("LrcDiscAmt")
        mLrcAmtAftDisc_dbl = .fields("LrcAmtAftDisc")
        mLrcAdvAmt_dbl = .fields("LrcAdvAmt")
        mLrcRecdAmt_dbl = .fields("LrcRecdAmt")
        mLrcDepoAmt_dbl = .fields("LrcDepoAmt")
        mLrcRefuAmt_dbl = .fields("LrcRefuAmt")
        mLrcBalAmt_dbl = .fields("LrcBalAmt")
        mLrcRemark_str = .fields("LrcRemark")
        
        clsSRV.GetData .fields("LrcSrvCode")
    
    ElseIf blnLabPymtTran = True Then
        mLpyPttCode_lng = .fields("LpyPttCode")
        mLpyLhrCode_lng = .fields("LpyLhrCode")
        mLpyDepoAmt_dbl = .fields("LpyDepoAmt")
        mLpyRemark_str = .fields("LpyRemark")
        
    ElseIf blnLabRefdTran = True Then
        mLfdPttCode_lng = .fields("LfdPttCode")
        mLfdLhrCode_lng = .fields("LfdLhrCode")
        mLfdRefuAmt_dbl = .fields("LfdRefuAmt")
        mLfdRemark_str = .fields("LfdRemark")
        
        
    Else
        ErrorBox "clsHmsLabMultiTranEntry_GetDtlData_#173_[Undefined Case]"
    End If
End If
End With
CloseTable tRecset

End Sub

Public Sub GetSdcData(ByVal mSdcCode As Long, ByVal mSdcSubCode As Long, ByVal mSdcICode As Long)
Dim tRecset As New ADODB.Recordset, acount As Integer

Me.ClearSdc
With tRecset
.open "Select * from " & mTrnSdcTableName & " where " & mTrnSdcCodeField & "=" & CStr(mSdcCode) & " and " & mTrnSdcSubCodeField & "=" & CStr(mSdcSubCode) & " and " & mTrnSdcICodeField & "=" & CStr(mSdcICode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    mSdcCode_lng = .fields(mTrnSdcCodeField)
    mSdcSubCode_lng = .fields(mTrnSdcSubCodeField)
    mSdcICode_lng = .fields(mTrnSdcICodeField)
    mSdcSno_int = .fields(mTrnSdcSnoField)
    mSdcDate_dt = .fields(mTrnSdcDateField)
    mSdcSrvCode_lng = .fields(mTrnSdcSrvCodeField)
    mSdcPttCode_lng = .fields(mTrnSdcPttCodeField)
    mSdcDctCode_lng = .fields(mTrnSdcDctCodeField)
    mSdcDrlCode_lng = .fields(mTrnSdcDrlCodeField)
    mSdcRemark_str = .fields(mTrnSdcRemarkField)
    mSdcRecState_int = .fields(mTrnSdcRecStateField)
    mSdcCmpCode_int = .fields(mTrnSdcCmpCodeField)
    
End If
End With
CloseTable tRecset

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Sub

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

If blnLabRcptTran = True Then
    mLhrLpgCode_lng = 0
    mLhrTime_lng = 0
    mLhrOldLhrCode_lng = 0
    mLhrPttCode_lng = 0
    mLhrCDctCode_lng = 0
    mLhrRByCode_lng = 0
    mLhrRToCode_lng = 0
    mLhrPDigCode_lng = 0
    mLhrFDigCode_lng = 0
    mLhrPttDiscPer_dbl = 0
    mLhrAmtBefDisc_dbl = 0
    mLhrDiscAmt_dbl = 0
    mLhrAmtAftDisc_dbl = 0
    mLhrAdvAmt_dbl = 0
    mLhrRecdAmt_dbl = 0
    mLhrDepoAmt_dbl = 0
    mLhrRefuAmt_dbl = 0
    mLhrBalAmt_dbl = 0
    mLhrRemark_str = ""
    
    clsPAT.Clear

ElseIf blnLabPymtTran = True Then
    mLphLpgCode_lng = 0
    mLphLhrCode_lng = 0
    mLphTime_lng = 0
    mLphOldLphCode_lng = 0
    mLphPttCode_lng = 0
    mLphDepoAmt_dbl = 0
    mLphRemark_str = ""
    
    clsPAT.Clear

ElseIf blnLabRefdTran = True Then
    mLfhLpgCode_lng = 0
    mLfhLhrCode_lng = 0
    mLfhTime_lng = 0
    mLfhOldLfhCode_lng = 0
    mLfhPttCode_lng = 0
    mLfhRefuAmt_dbl = 0
    mLfhRemark_str = ""
    
    clsPAT.Clear


Else
    ErrorBox "clsHmsLabMultiTranEntry_ClearHdr_#212_[Undefined Case]"
End If

End Sub

Public Sub ClearDtl()

mTrnCode_lng = 0
mTrnDtlICode_lng = 0
mTrnDtlSno_int = 0
mTrnDate_dt = cUNKNOWNDATE
mTrnDtlRecState_int = 0
mTrnCmpCode_int = 0

If blnLabRcptTran = True Then
    mLrcPttCode_lng = 0
    mLrcSrvCode_lng = 0
    mLrcUnit_dbl = 0
    mLrcRate_dbl = 0
    mLrcAmtBefDisc_dbl = 0
    mLrcDiscPer_dbl = 0
    mLrcDiscAmt_dbl = 0
    mLrcAmtAftDisc_dbl = 0
    mLrcAdvAmt_dbl = 0
    mLrcRecdAmt_dbl = 0
    mLrcDepoAmt_dbl = 0
    mLrcRefuAmt_dbl = 0
    mLrcBalAmt_dbl = 0
    mLrcRemark_str = ""
    
    clsSRV.Clear

ElseIf blnLabPymtTran = True Then
    mLpyPttCode_lng = 0
    mLpyLhrCode_lng = 0
    mLpyDepoAmt_dbl = 0
    mLpyRemark_str = ""

ElseIf blnLabRefdTran = True Then
    mLfdPttCode_lng = 0
    mLfdLhrCode_lng = 0
    mLfdRefuAmt_dbl = 0
    mLfdRemark_str = ""
    
    
Else
    ErrorBox "clsHmsLabMultiTranEntry_ClearDtl_#244_[Undefined Case]"
End If

End Sub

Public Sub ClearSdc()
mSdcCode_lng = 0
mSdcSubCode_lng = 0
mSdcICode_lng = 0
mSdcSno_int = 0
mSdcDate_dt = cUNKNOWNDATE
mSdcSrvCode_lng = 0
mSdcPttCode_lng = 0
mSdcDctCode_lng = 0
mSdcDrlCode_lng = 0
mSdcRemark_str = ""
mSdcRecState_int = 0
mSdcCmpCode_int = 0

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
    mTrnCode = GetUIdCode("clsHmsLabMultiTranEntry_BeginTran", mUIdFileName:=mClassUIdFileName, mAcsPermFileName:=mClassAcsPermFileName) * -1   '   GetNextSeqno(m_dbAcDatabase, "mTrnHdrTableName", "mTrnHdrCodeField")
    If mTrnCode = 0 Then
        ErrorBox "clsHmsLabMultiTranEntry_BeginTran_#266_[Invalid " & mTitleName & " Code]"
        GoTo EndSub
    End If
ElseIf mTrnCode > 0 Then
    tRecset.open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.RecordCount = 0 Then
        ErrorBox "clsHmsLabMultiTranEntry_BeginTran_#272_[Entry not Found]"
        GoTo EndSub
    End If
    CloseTable tRecset
Else
    ErrorBox "clsHmsLabMultiTranEntry_BeginTran_#277_[Invalid " & mTitleName & " Entry Code Request]"
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

Public Function GetDtlTranUnqCode() As Long
Dim mRtnval As Long

mRtnval = GetUIdCode("clsHmsLabMultiTranDtlEntry_BeginTran", mUIdFileName:=mClassDtlUIdFileName, mAcsPermFileName:=mClassDtlAcsPermFileName) * -1

GetDtlTranUnqCode = mRtnval

End Function

Public Function EndTran(ByVal mTrnCode As Long) As Boolean
Dim mCnt As Integer
EndTran = False
If Chk_ActiveTran() = False Or IIf(ActiveTrnCode > 0, mTrnCode <> ActiveTrnCode, False) Then
    ErrorBox "clsHmsLabMultiTranEntry_EndTran_#294_[InActive Transaction Entry]"
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
Dim tRecset As New ADODB.Recordset, mTmpTrnCode As Long, mTrnSno As Integer, mSdcSubCode As Long

UpdateTran = False
mTmpTrnCode = ActiveTrnCode

On Error GoTo errhand

Rem header section
m_dbHmsDatabase.BeginTrans
With tRecset
.open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    Rem Do While .EOF = False
        If InList(.fields(mTrnHdrRecStateField), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
            If blnLabRcptTran = True Then
                .fields("LhrBalAmt") = .fields("LhrAmtAftDisc") - (.fields("LhrAdvAmt") + .fields("LhrRecdAmt") + .fields("LhrDepoAmt"))
            End If
            
            .fields(mTrnHdrRecStateField) = cREC_UNCHANGED
            .Update
        Else
            .fields(mTrnHdrRecStateField) = ChkDeleteRecStatus(.fields(mTrnHdrRecStateField))
            .Update
            .Delete
        End If
        
    Rem     .MoveNext
    Rem Loop
End If
End With
m_dbHmsDatabase.CommitTrans
CloseTable tRecset

Rem detail section
m_dbHmsDatabase.BeginTrans
With tRecset
If mTrnCode = mTmpTrnCode Then
    .open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnDtlICodeField & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
Else
    .open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTmpTrnCode) & " order by " & mTrnDtlICodeField & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
End If
If .EOF = False Then
    mTrnSno = 1
    Do While .EOF = False
        If InList(.fields(mTrnDtlRecStateField), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
            If blnLabRcptTran = True Then
                If .fields("LrcPttCode") <> mLhrPttCode_lng Then
                    .fields("LrcPttCode") = mLhrPttCode_lng
                End If
            
            ElseIf blnLabPymtTran = True Then
                If .fields("LpyPttCode") <> mLphPttCode_lng Then
                    .fields("LpyPttCode") = mLphPttCode_lng
                End If
            
            ElseIf blnLabRefdTran = True Then
                If .fields("LfdPttCode") <> mLfhPttCode_lng Then
                    .fields("LfdPttCode") = mLfhPttCode_lng
                End If
            
            End If
            If mTrnCode <> mTmpTrnCode Then
                .fields(mTrnDtlCodeField) = mTrnCode
            End If
            .fields(mTrnDtlSnoField) = mTrnSno
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
    If blnLabRcptTran = True Then
        DispersePropRcptRecdAmt mTrnCode
    End If
End If
End With
CloseTable tRecset
m_dbHmsDatabase.CommitTrans

Rem service doctor detail updations
If blnLabRcptTran = True Then
    Rem order by SubCode+ICode so as to reset sno for each service
    m_dbHmsDatabase.BeginTrans
    With tRecset
    If mTrnCode = mTmpTrnCode Then
        .open "Select * from " & mTrnSdcTableName & " where " & mTrnSdcCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnSdcSubCodeField & "," & mTrnSdcICodeField & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
    Else
        .open "Select * from " & mTrnSdcTableName & " where " & mTrnSdcCodeField & "=" & CStr(mTmpTrnCode) & " order by " & mTrnSdcSubCodeField & "," & mTrnSdcICodeField & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
    End If
    If .EOF = False Then
        mTrnSno = 1
        mSdcSubCode = -1
        Do While .EOF = False
            If InList(.fields(mTrnSdcRecStateField), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
                If mSdcSubCode <> .fields(mTrnSdcSubCodeField) Then
                    mSdcSubCode = .fields(mTrnSdcSubCodeField)
                    mTrnSno = 1
                End If
                If .fields(mTrnSdcDateField) <> mTrnDate_dt Then
                    .fields(mTrnSdcDateField) = mTrnDate_dt
                End If
                If blnLabRcptTran = True Then
                    If .fields(mTrnSdcPttCodeField) <> mLhrPttCode_lng Then
                        .fields(mTrnSdcPttCodeField) = mLhrPttCode_lng
                    End If
                End If
                If mTrnCode <> mTmpTrnCode Then
                    .fields(mTrnSdcCodeField) = mTrnCode
                End If
                .fields(mTrnSdcSnoField) = mTrnSno
                .fields(mTrnSdcRecStateField) = cREC_UNCHANGED
                .Update
                mTrnSno = mTrnSno + 1
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
    m_dbHmsDatabase.CommitTrans
End If

UpdateTran = True
mCrashedEntry = False
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

Private Sub DispersePropRcptRecdAmt(ByVal mTrnCode As Long)
Dim tRecset As New ADODB.Recordset, mRecdAmtBal As Double, mRecdAmtTot As Double, mPropRecdAmt As Double, mAmtAftDiscTot As Double

With tRecset
.open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
mRecdAmtBal = .fields("LhrRecdAmt")
mRecdAmtTot = .fields("LhrRecdAmt")
mAmtAftDiscTot = .fields("LhrAmtAftDisc")
End With
CloseTable tRecset

With tRecset
.open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnDtlICodeField & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    m_dbHmsDatabase.BeginTrans
    Do While .EOF = False
        If InList(.fields("LrcRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
            mPropRecdAmt = Round(MyDivide(CDec(mRecdAmtTot) * CDec(.fields("LrcAmtAftDisc")), CDec(mAmtAftDiscTot)), 2)
            
            .fields("LrcRecdAmt") = CDec(mPropRecdAmt)
            .fields("LrcBalAmt") = CDec(.fields("LrcAmtAftDisc")) - (CDec(.fields("LrcAdvAmt")) + CDec(.fields("LrcDepoAmt")) + CDec(.fields("LrcRecdAmt")))
            .Update
                
            mRecdAmtBal = mRecdAmtBal - mPropRecdAmt
        Else
            If InList(.fields("LrcRecState"), Array(cREC_CANCELED, cREC_DELETED)) = False Then
                ErrorBox "clsHmsLabMultiTranEntry_DispersePropRcptRecdAmt_#2316_[Invalid Record Status]"
            End If
        End If
        .MoveNext
    Loop
    If Round(mRecdAmtBal, 2) <> 0 And mRecdAmtBal <> mRecdAmtTot Then
        Rem .MovePrevious
        .Close
        .open "Select top 1 * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnDtlICodeField & " desc", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
        
        mPropRecdAmt = Round(mRecdAmtBal, 2) + .fields("LrcRecdAmt")
        .fields("LrcRecdAmt") = CDec(mPropRecdAmt)
        .fields("LrcBalAmt") = CDec(.fields("LrcAmtAftDisc")) - (CDec(.fields("LrcAdvAmt")) + CDec(.fields("LrcDepoAmt")) + CDec(.fields("LrcRecdAmt")))
        .Update
    End If
    m_dbHmsDatabase.CommitTrans
Else
    If mRecdAmtBal <> 0 Then
        ErrorBox "clsHmsLabMultiTranEntry_DispersePropRcptRecdAmt_#3002_[Unexpected]"
    End If
End If
End With
CloseTable tRecset

End Sub

Public Function CancelTran(ByVal mTrnCode As Long) As Boolean
Dim t1Recset As New ADODB.Recordset, t2Recset As New ADODB.Recordset
Dim mLpyLhrCode As Long, mLpyDepoAmt As Double
Dim mLfdLhrCode As Long, mLfdRefuAmt As Double
Dim mObpyObhCode As Long, mObpyDepoAmt As Double
Dim mObfdObhCode As Long, mObfdRefuAmt As Double
Dim mRecAdded As Boolean, mRecEdited As Boolean, mRecDeleted As Boolean, mRecCanceled As Boolean

CancelTran = False
If Chk_ActiveTran() = False Or mTrnCode <> ActiveTrnCode Then
    ErrorBox "clsHmsLabMultiTranEntry_CancelTran_#419_[InActive Transaction Entry]"
    GoTo EndSub
End If
If mCrashedEntry = True Then
    ErrorBox "Cancel/Undo Strictly Prohibited for Crashed/Uncomplete Entries, User Must Save it !!!"
    GoTo EndSub
End If
mTrnCode = ActiveTrnCode
On Error GoTo errhand

Rem header section
m_dbHmsDatabase.BeginTrans
With t1Recset
.open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
t2Recset.open "Select * from " & mTrnHdrTableName & "_Log where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    Rem Do While .EOF = False
        t2Recset.Find mTrnHdrCodeField & "=" & CStr(.fields(mTrnHdrCodeField)), Start:=1
        If t2Recset.EOF = False Then
            .fields(mTrnHdrDateField) = t2Recset.fields(mTrnHdrDateField)
            .fields(mTrnVtmField) = t2Recset.fields(mTrnVtmField)
            .fields(mTrnPrefixField) = t2Recset.fields(mTrnPrefixField)
            .fields(mTrnVchNoField) = t2Recset.fields(mTrnVchNoField)
            .fields(mTrnPostfixField) = t2Recset.fields(mTrnPostfixField)
            .fields(mTrnHdrRecStateField) = t2Recset.fields(mTrnHdrRecStateField)
            .fields(mTrnHdrCmpCodeField) = t2Recset.fields(mTrnHdrCmpCodeField)
            
            If blnLabRcptTran = True Then
                .fields("LhrLpgCode") = t2Recset.fields("LhrLpgCode")
                .fields("LhrTime") = t2Recset.fields("LhrTime")
                .fields("LhrOldLhrCode") = t2Recset.fields("LhrOldLhrCode")
                .fields("LhrPttCode") = t2Recset.fields("LhrPttCode")
                .fields("LhrCDctCode") = t2Recset.fields("LhrCDctCode")
                .fields("LhrRByCode") = t2Recset.fields("LhrRByCode")
                .fields("LhrRToCode") = t2Recset.fields("LhrRToCode")
                .fields("LhrPDigCode") = t2Recset.fields("LhrPDigCode")
                .fields("LhrFDigCode") = t2Recset.fields("LhrFDigCode")
                .fields("LhrPttDiscPer") = t2Recset.fields("LhrPttDiscPer")
                .fields("LhrAmtBefDisc") = t2Recset.fields("LhrAmtBefDisc")
                .fields("LhrDiscAmt") = t2Recset.fields("LhrDiscAmt")
                .fields("LhrAmtAftDisc") = t2Recset.fields("LhrAmtAftDisc")
                .fields("LhrAdvAmt") = t2Recset.fields("LhrAdvAmt")
                .fields("LhrRecdAmt") = t2Recset.fields("LhrRecdAmt")
                .fields("LhrDepoAmt") = t2Recset.fields("LhrDepoAmt")
                .fields("LhrRefuAmt") = t2Recset.fields("LhrRefuAmt")
                .fields("LhrBalAmt") = t2Recset.fields("LhrBalAmt")
                .fields("LhrRemark") = t2Recset.fields("LhrRemark")
            
            ElseIf blnLabPymtTran = True Then
                .fields("LphLpgCode") = t2Recset.fields("LphLpgCode")
                .fields("LphLhrCode") = t2Recset.fields("LphLhrCode")
                .fields("LphTime") = t2Recset.fields("LphTime")
                .fields("LphOldLphCode") = t2Recset.fields("LphOldLphCode")
                .fields("LphPttCode") = t2Recset.fields("LphPttCode")
                .fields("LphDepoAmt") = t2Recset.fields("LphDepoAmt")
                .fields("LphRemark") = t2Recset.fields("LphRemark")
                
            ElseIf blnLabRefdTran = True Then
                .fields("LfhLpgCode") = t2Recset.fields("LfhLpgCode")
                .fields("LfhLhrCode") = t2Recset.fields("LfhLhrCode")
                .fields("LfhTime") = t2Recset.fields("LfhTime")
                .fields("LfhOldLfhCode") = t2Recset.fields("LfhOldLfhCode")
                .fields("LfhPttCode") = t2Recset.fields("LfhPttCode")
                .fields("LfhRefuAmt") = t2Recset.fields("LfhRefuAmt")
                .fields("LfhRemark") = t2Recset.fields("LfhRemark")
            
            
            Else
                ErrorBox "clsHmsLabMultiTranEntry_CancelTran_#459_[Undefined Case]"
            End If
            .Update
        Else
            ' any prior updations can be made here
            .fields(mTrnDtlRecStateField) = ChkDeleteRecStatus(.fields(mTrnDtlRecStateField))
            .Update
            .Delete
        End If
    
    Rem     .MoveNext
    Rem Loop
End If
End With
m_dbHmsDatabase.CommitTrans
CloseTable t1Recset
CloseTable t2Recset

Rem detail section
m_dbHmsDatabase.BeginTrans
With t1Recset
Rem important - revert the changes in revert order of updation
.open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnDtlICodeField & " desc", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
t2Recset.open "Select * from " & mTrnDtlTableName & "_Log where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnDtlICodeField & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    Do While .EOF = False
        t2Recset.Find mTrnDtlICodeField & "=" & CStr(.fields(mTrnDtlICodeField)), Start:=1
        If t2Recset.EOF = False Then
            mRecEdited = False
            mRecDeleted = False
            If .fields(mTrnDtlRecStateField) = cREC_EDITED = True Then
                mRecEdited = True
            ElseIf .fields(mTrnDtlRecStateField) = cREC_DELETED = True Then
                mRecDeleted = True
            End If
            
            .fields(mTrnDtlSnoField) = t2Recset.fields(mTrnDtlSnoField)
            .fields(mTrnDtlDateField) = t2Recset.fields(mTrnDtlDateField)
            .fields(mTrnDtlRecStateField) = t2Recset.fields(mTrnDtlRecStateField)
            .fields(mTrnDtlCmpCodeField) = t2Recset.fields(mTrnDtlCmpCodeField)
            
            If blnLabRcptTran = True Then
                .fields("LrcPttCode") = t2Recset.fields("LrcPttCode")
                .fields("LrcSrvCode") = t2Recset.fields("LrcSrvCode")
                .fields("LrcUnit") = t2Recset.fields("LrcUnit")
                .fields("LrcRate") = t2Recset.fields("LrcRate")
                .fields("LrcAmtBefDisc") = t2Recset.fields("LrcAmtBefDisc")
                .fields("LrcDiscPer") = t2Recset.fields("LrcDiscPer")
                .fields("LrcDiscAmt") = t2Recset.fields("LrcDiscAmt")
                .fields("LrcAmtAftDisc") = t2Recset.fields("LrcAmtAftDisc")
                .fields("LrcAdvAmt") = t2Recset.fields("LrcAdvAmt")
                .fields("LrcRecdAmt") = t2Recset.fields("LrcRecdAmt")
                .fields("LrcDepoAmt") = t2Recset.fields("LrcDepoAmt")
                .fields("LrcRefuAmt") = t2Recset.fields("LrcRefuAmt")
                .fields("LrcBalAmt") = t2Recset.fields("LrcBalAmt")
                .fields("LrcRemark") = t2Recset.fields("LrcRemark")
            
            ElseIf blnLabPymtTran = True Then
                mLpyLhrCode = .fields("LpyLhrCode")
                mLpyDepoAmt = .fields("LpyDepoAmt")
                
                .fields("LpyPttCode") = t2Recset.fields("LpyPttCode")
                .fields("LpyLhrCode") = t2Recset.fields("LpyLhrCode")
                .fields("LpyDepoAmt") = t2Recset.fields("LpyDepoAmt")
                .fields("LpyRemark") = t2Recset.fields("LpyRemark")
                
            ElseIf blnLabRefdTran = True Then
                mLfdLhrCode = .fields("LfdLhrCode")
                mLfdRefuAmt = .fields("LfdRefuAmt")
                
                .fields("LfdPttCode") = t2Recset.fields("LfdPttCode")
                .fields("LfdLhrCode") = t2Recset.fields("LfdLhrCode")
                .fields("LfdRefuAmt") = t2Recset.fields("LfdRefuAmt")
                .fields("LfdRemark") = t2Recset.fields("LfdRemark")
                
                
            Else
                ErrorBox "clsHmsLabMultiTranEntry_CancelTran_#506_[Undefined Case]"
            End If
            .Update
            
            If blnLabPymtTran = True Then
                If mRecEdited = True Then
                    If mLpyLhrCode <> .fields("LpyLhrCode") Then
                        DispersePropRcptDepoAmt mLpyLhrCode, (mLpyDepoAmt * -1)                     ' removing deposit amount from old receipt
                        DispersePropRcptDepoAmt .fields("LpyLhrCode"), .fields("LpyDepoAmt")        ' adding deposit amount to new receipt
                    ElseIf mLpyDepoAmt <> .fields("LpyDepoAmt") Then
                        mLpyDepoAmt = .fields("LpyDepoAmt") - mLpyDepoAmt
                        DispersePropRcptDepoAmt mLpyLhrCode, mLpyDepoAmt
                    End If
                ElseIf mRecDeleted = True Then
                    DispersePropRcptDepoAmt .fields("LpyLhrCode"), .fields("LpyDepoAmt")        ' adding deposit amount to restored receipt
                End If
            
            ElseIf blnLabRefdTran = True Then
                If mRecEdited = True Then
                    If mLfdLhrCode <> .fields("LfdLhrCode") Then
                        DispersePropRcptRefuAmt mLfdLhrCode, (mLfdRefuAmt * -1)                     ' removing refund amount from old receipt
                        DispersePropRcptRefuAmt .fields("LfdLhrCode"), .fields("LfdRefuAmt")        ' adding refund amount to new receipt
                    ElseIf mLfdRefuAmt <> .fields("LfdRefuAmt") Then
                        mLfdRefuAmt = .fields("LfdRefuAmt") - mLfdRefuAmt
                        DispersePropRcptRefuAmt mLfdLhrCode, mLfdRefuAmt
                    End If
                ElseIf mRecDeleted = True Then
                    DispersePropRcptRefuAmt .fields("LfdLhrCode"), .fields("LfdRefuAmt")        ' adding refund amount to restored receipt
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
        
            If blnLabPymtTran = True Then
                mLpyLhrCode = .fields("LpyLhrCode")
                mLpyDepoAmt = .fields("LpyDepoAmt")
                
            ElseIf blnLabRefdTran = True Then
                mLfdLhrCode = .fields("LfdLhrCode")
                mLfdRefuAmt = .fields("LfdRefuAmt")
                
            
            End If
            
            .fields(mTrnDtlRecStateField) = ChkDeleteRecStatus(.fields(mTrnDtlRecStateField))
            .Update
            .Delete
            
            If mRecAdded = True Then
                If blnLabPymtTran = True Then
                    DispersePropRcptDepoAmt mLpyLhrCode, (mLpyDepoAmt * -1)
                ElseIf blnLabRefdTran = True Then
                    DispersePropRcptRefuAmt mLfdLhrCode, (mLfdRefuAmt * -1)
                End If
            End If
        End If
    
        .MoveNext
    Loop
End If
End With
CloseTable t1Recset
CloseTable t2Recset
m_dbHmsDatabase.CommitTrans

Rem service doctor detail section
If blnLabRcptTran = True Then
    m_dbHmsDatabase.BeginTrans
    With t1Recset
    .open "Select * from " & mTrnSdcTableName & " where " & mTrnSdcCodeField & "=" & CStr(mTrnCode), m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
    t2Recset.open "Select * from " & mTrnSdcTableName & "_Log where " & mTrnSdcCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnSdcICodeField & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
    If .EOF = False Then
        Do While .EOF = False
            t2Recset.Find mTrnSdcICodeField & "=" & CStr(.fields(mTrnSdcICodeField)), Start:=1
            If t2Recset.EOF = False Then
                .fields(mTrnSdcCodeField) = t2Recset.fields(mTrnSdcCodeField)
                .fields(mTrnSdcSubCodeField) = t2Recset.fields(mTrnSdcSubCodeField)
                Rem .fields(mTrnSdcICodeField) = t2Recset.fields(mTrnSdcICodeField)
                .fields(mTrnSdcSnoField) = t2Recset.fields(mTrnSdcSnoField)
                .fields(mTrnSdcDateField) = t2Recset.fields(mTrnSdcDateField)
                .fields(mTrnSdcSrvCodeField) = t2Recset.fields(mTrnSdcSrvCodeField)
                .fields(mTrnSdcPttCodeField) = t2Recset.fields(mTrnSdcPttCodeField)
                .fields(mTrnSdcDctCodeField) = t2Recset.fields(mTrnSdcDctCodeField)
                .fields(mTrnSdcDrlCodeField) = t2Recset.fields(mTrnSdcDrlCodeField)
                .fields(mTrnSdcRemarkField) = t2Recset.fields(mTrnSdcRemarkField)
                .fields(mTrnSdcRecStateField) = t2Recset.fields(mTrnSdcRecStateField)
                .fields(mTrnSdcCmpCodeField) = t2Recset.fields(mTrnSdcCmpCodeField)
                
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
    CloseTable t1Recset
    CloseTable t2Recset
    m_dbHmsDatabase.CommitTrans
End If

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

Rem checks entries with log table, if log exist restores log records else delete records (assuming new records added), balance updation part not done here because master entries does not have effect while in process
Public Function CancelSdcTran(ByVal mSdcCode As Long, ByVal mSdcSubCode As Long) As Boolean
Dim t1Recset As New ADODB.Recordset, t2Recset As New ADODB.Recordset
Dim mRecEdited As Boolean, mRecDeleted As Boolean

CancelSdcTran = False
If Chk_ActiveTran() = False Or mSdcCode <> ActiveTrnCode Then
    ErrorBox "No Active " & mTitleName & " Entry to Cancel !!!"
    GoTo EndSub
End If
If mCrashedEntry = True Then
    ErrorBox "Cancel/Undo Strictly Prohibited for Crashed/Uncomplete Entries, User Must Save it !!!"
    GoTo EndSub
End If
On Error GoTo errhand

m_dbHmsDatabase.BeginTrans
With t1Recset
.open "Select * from " & mTrnSdcTableName & " where " & mTrnSdcCodeField & "=" & CStr(mSdcCode) & " and " & mTrnSdcSubCodeField & "=" & CStr(mSdcSubCode), m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
t2Recset.open "Select * from " & mTrnSdcTableName & "_Log where " & mTrnSdcCodeField & "=" & CStr(mSdcCode) & " and " & mTrnSdcSubCodeField & "=" & CStr(mSdcSubCode) & " order by " & mTrnSdcICodeField & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    Do While .EOF = False
        t2Recset.Find mTrnSdcICodeField & "=" & CStr(.fields(mTrnSdcICodeField)), Start:=1
        If t2Recset.EOF = False Then
            .fields(mTrnSdcCodeField) = t2Recset.fields(mTrnSdcCodeField)
            .fields(mTrnSdcSubCodeField) = t2Recset.fields(mTrnSdcSubCodeField)
            Rem .fields(mTrnSdcICodeField) = t2Recset.fields(mTrnSdcICodeField)
            .fields(mTrnSdcSnoField) = t2Recset.fields(mTrnSdcSnoField)
            .fields(mTrnSdcDateField) = t2Recset.fields(mTrnSdcDateField)
            .fields(mTrnSdcSrvCodeField) = t2Recset.fields(mTrnSdcSrvCodeField)
            .fields(mTrnSdcPttCodeField) = t2Recset.fields(mTrnSdcPttCodeField)
            .fields(mTrnSdcDctCodeField) = t2Recset.fields(mTrnSdcDctCodeField)
            .fields(mTrnSdcDrlCodeField) = t2Recset.fields(mTrnSdcDrlCodeField)
            .fields(mTrnSdcRemarkField) = t2Recset.fields(mTrnSdcRemarkField)
            .fields(mTrnSdcRecStateField) = t2Recset.fields(mTrnSdcRecStateField)
            .fields(mTrnSdcCmpCodeField) = t2Recset.fields(mTrnSdcCmpCodeField)
            
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
CloseTable t1Recset
CloseTable t2Recset
m_dbHmsDatabase.CommitTrans

CancelSdcTran = True
GoTo EndSub

errhand:
MsgBox Err.Description
m_dbHmsDatabase.Cancel

EndSub:
CloseTable t1Recset, mCheckOpen:=True
CloseTable t2Recset, mCheckOpen:=True
Exit Function

End Function

Public Function DeleteTran(ByVal mTrnCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset

DeleteTran = False
If Chk_ActiveTran() = False Or mTrnCode <> ActiveTrnCode Then
    ErrorBox "clsHmsLabMultiTranEntry_DeleteTran_#551_[InActive Transaction Entry]"
    GoTo EndSub
End If
On Error GoTo errhand

Rem header section
m_dbHmsDatabase.BeginTrans
With tRecset
.open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
Rem Do While .EOF = False
    .fields(mTrnHdrRecStateField) = ChkDeleteRecStatus(.fields(mTrnHdrRecStateField))
    .Update
    '' .Delete deleted in update transaction
Rem     .MoveNext
Rem Loop
End With
m_dbHmsDatabase.CommitTrans
CloseTable tRecset

Rem detail section
m_dbHmsDatabase.BeginTrans
With tRecset
.open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnDtlICodeField & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
Do While .EOF = False
    .fields(mTrnDtlRecStateField) = ChkDeleteRecStatus(.fields(mTrnDtlRecStateField))
    .Update
    '' .Delete deleted in update transaction
    
    If blnLabPymtTran = True Then
        DispersePropRcptDepoAmt .fields("LpyLhrCode"), (.fields("LpyDepoAmt") * -1)
    ElseIf blnLabRefdTran = True Then
        DispersePropRcptRefuAmt .fields("LfdLhrCode"), (.fields("LfdRefuAmt") * -1)
    End If
    
    .MoveNext
Loop
End With
CloseTable tRecset
m_dbHmsDatabase.CommitTrans

Rem service doctor detail deletion marking
If blnLabRcptTran = True Then
    m_dbHmsDatabase.BeginTrans
    With tRecset
    .open "Select * from " & mTrnSdcTableName & " where " & mTrnSdcCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnSdcICodeField & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
    Do While .EOF = False
        .fields(mTrnSdcRecStateField) = ChkDeleteRecStatus(.fields(mTrnSdcRecStateField))
        .Update
        
        .MoveNext
    Loop
    End With
    CloseTable tRecset
    m_dbHmsDatabase.CommitTrans
End If

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
    ErrorBox "clsHmsLabMultiTranEntry_SelectTran_#412_[Invalid " & mTitleName & " Entry]"
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
    ErrorBox "clsHmsLabMultiTranEntry_NextTran_#432_[End of " & mTitleName & " Entry]"
    Exit Function
End If
mActiveTran = mActiveTran + 1

NextTran = True
End Function

Public Function PreviousTran()
PreviousTran = False
If BOTrn = True Then
    ErrorBox "clsHmsLabMultiTranEntry_PreviousTran_#443_[Begining of " & mTitleName & " Entry]"
    Exit Function
End If
mActiveTran = mActiveTran - 1

PreviousTran = True
End Function

Public Function FirstTran() As Boolean
FirstTran = False
If CountTran = 0 Then
    ErrorBox "clsHmsLabMultiTranEntry_FirstTran_#454_[No " & mTitleName & " Entry]"
    Exit Function
End If
mActiveTran = LBound(aHmsTran)

FirstTran = True

End Function

Public Function LastTran() As Boolean
LastTran = False
If CountTran = 0 Then
    ErrorBox "clsHmsLabMultiTranEntry_LastTran_#466_[No " & mTitleName & " Entry]"
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
    ErrorBox "clsHmsLabMultiTranEntry_AddNewHdr_#736_[InActive " & mTitleName & " Entry]"
    GoTo EndSub
End If

On Error GoTo errhand
mTrnCode_lng = 0

m_dbHmsDatabase.BeginTrans
With tRecset
.open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=-0.1", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic

.AddNew

Rem .Fields(mTrnHdrCodeField) = AutoNumber
.fields(mTrnHdrDateField) = mTrnDate_dt
.fields(mTrnVtmField) = mTrnVtmCode_lng
.fields(mTrnPrefixField) = mTrnPrefix_str
.fields(mTrnVchNoField) = mTrnVchNo_lng
.fields(mTrnPostfixField) = mTrnPostfix_str
.fields(mTrnHdrCmpCodeField) = mTrnCmpCode_int
.fields(mTrnHdrRecStateField) = ChkEditRecStatus(.fields(mTrnHdrRecStateField))

If blnLabRcptTran = True Then
    .fields("LhrLpgCode") = mLhrLpgCode_lng
    .fields("LhrTime") = mLhrTime_lng
    .fields("LhrOldLhrCode") = mLhrOldLhrCode_lng
    .fields("LhrPttCode") = mLhrPttCode_lng
    .fields("LhrCDctCode") = mLhrCDctCode_lng
    .fields("LhrRByCode") = mLhrRByCode_lng
    .fields("LhrRToCode") = mLhrRToCode_lng
    .fields("LhrPDigCode") = mLhrPDigCode_lng
    .fields("LhrFDigCode") = mLhrFDigCode_lng
    .fields("LhrPttDiscPer") = mLhrPttDiscPer_dbl
    .fields("LhrAmtBefDisc") = mLhrAmtBefDisc_dbl
    .fields("LhrDiscAmt") = mLhrDiscAmt_dbl
    .fields("LhrAmtAftDisc") = mLhrAmtAftDisc_dbl
    .fields("LhrAdvAmt") = mLhrAdvAmt_dbl
    .fields("LhrRecdAmt") = mLhrRecdAmt_dbl
    .fields("LhrDepoAmt") = mLhrDepoAmt_dbl
    .fields("LhrRefuAmt") = mLhrRefuAmt_dbl
    .fields("LhrBalAmt") = mLhrBalAmt_dbl
    .fields("LhrRemark") = mLhrRemark_str

ElseIf blnLabPymtTran = True Then
    .fields("LphLpgCode") = mLphLpgCode_lng
    .fields("LphLhrCode") = mLphLhrCode_lng
    .fields("LphTime") = mLphTime_lng
    .fields("LphOldLphCode") = mLphOldLphCode_lng
    .fields("LphPttCode") = mLphPttCode_lng
    .fields("LphDepoAmt") = mLphDepoAmt_dbl
    .fields("LphRemark") = mLphRemark_str
    
ElseIf blnLabRefdTran = True Then
    .fields("LfhLpgCode") = mLfhLpgCode_lng
    .fields("LfhLhrCode") = mLfhLhrCode_lng
    .fields("LfhTime") = mLfhTime_lng
    .fields("LfhOldLfhCode") = mLfhOldLfhCode_lng
    .fields("LfhPttCode") = mLfhPttCode_lng
    .fields("LfhRefuAmt") = mLfhRefuAmt_dbl
    .fields("LfhRemark") = mLfhRemark_str


Else
    ErrorBox "clsHmsLabMultiTranEntry_AddNewHdr_#776_[Undefined Case]"
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
Dim tRecset As New ADODB.Recordset, mTmpDtlICode As Long

AddNewDtl = False
If Chk_ActiveTran() = False Or mTrnCode <> ActiveTrnCode Then
    ErrorBox "clsHmsLabMultiTranEntry_AddNewDtl_#810_[InActive " & mTitleName & " Entry]"
    GoTo EndSub
End If

On Error GoTo errhand
mTmpDtlICode = mTrnDtlICode_lng
mTrnDtlICode_lng = 0

m_dbHmsDatabase.BeginTrans
With tRecset
.open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=-0.1", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic

.AddNew

Rem mTrnDtlICode_lng = AutoNumber
.fields(mTrnDtlCodeField) = mTrnCode
.fields(mTrnDtlSnoField) = mTrnDtlSno_int
.fields(mTrnDtlDateField) = mTrnDate_dt
.fields(mTrnDtlCmpCodeField) = mTrnCmpCode_int
.fields(mTrnDtlRecStateField) = ChkEditRecStatus(.fields(mTrnDtlRecStateField))

If blnLabRcptTran = True Then
    .fields("LrcPttCode") = mLrcPttCode_lng
    .fields("LrcSrvCode") = mLrcSrvCode_lng
    .fields("LrcUnit") = mLrcUnit_dbl
    .fields("LrcRate") = mLrcRate_dbl
    .fields("LrcAmtBefDisc") = mLrcAmtBefDisc_dbl
    .fields("LrcDiscPer") = mLrcDiscPer_dbl
    .fields("LrcDiscAmt") = mLrcDiscAmt_dbl
    .fields("LrcAmtAftDisc") = mLrcAmtAftDisc_dbl
    .fields("LrcAdvAmt") = mLrcAdvAmt_dbl
    .fields("LrcRecdAmt") = mLrcRecdAmt_dbl
    .fields("LrcDepoAmt") = mLrcDepoAmt_dbl
    .fields("LrcRefuAmt") = mLrcRefuAmt_dbl
    .fields("LrcBalAmt") = mLrcBalAmt_dbl
    .fields("LrcRemark") = mLrcRemark_str
    
ElseIf blnLabPymtTran = True Then
    .fields("LpyPttCode") = mLpyPttCode_lng
    .fields("LpyLhrCode") = mLpyLhrCode_lng
    .fields("LpyDepoAmt") = mLpyDepoAmt_dbl
    .fields("LpyRemark") = mLpyRemark_str
    
    DispersePropRcptDepoAmt mLpyLhrCode_lng, mLpyDepoAmt_dbl
    
ElseIf blnLabRefdTran = True Then
    .fields("LfdPttCode") = mLfdPttCode_lng
    .fields("LfdLhrCode") = mLfdLhrCode_lng
    .fields("LfdRefuAmt") = mLfdRefuAmt_dbl
    .fields("LfdRemark") = mLfdRemark_str
    
    DispersePropRcptRefuAmt mLfdLhrCode_lng, mLfdRefuAmt_dbl
    
    
Else
    ErrorBox "clsHmsLabMultiTranEntry_AddNewDtl_#844_[Undefined Case]"
End If
.Update

mTrnDtlICode_lng = .fields(mTrnDtlICodeField)
End With
CloseTable tRecset
m_dbHmsDatabase.CommitTrans

Rem service doctor detail link code updation if any
If blnLabRcptTran = True Then
    m_dbHmsDatabase.BeginTrans
    With tRecset
    .open "Select * from " & mTrnSdcTableName & " where " & mTrnSdcCodeField & "=" & CStr(mTrnCode) & " and " & mTrnSdcSubCodeField & "=" & CStr(mTmpDtlICode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
    If .EOF = False Then
        Do While .EOF = False
            .fields(mTrnSdcSubCodeField) = mTrnDtlICode_lng
            .Update
            
            .MoveNext
        Loop
    End If
    End With
    CloseTable tRecset
    m_dbHmsDatabase.CommitTrans
End If

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

Public Sub AddNewSdc(ByVal mSdcCode As Long, ByVal mSdcSubCode As Long)
Dim tRecset As New ADODB.Recordset, mCanAddNew As Boolean, mLCount As Integer, mUCount As Integer, acount As Integer
mCanAddNew = True

On Error GoTo errhand
mSdcICode_lng = 0
If mCanAddNew = True Then
    m_dbHmsDatabase.BeginTrans
    With tRecset
    .open "Select * from " & mTrnSdcTableName & " where " & mTrnSdcICodeField & "=" & CStr(-0.1) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
    
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

Public Function UpdateHdr(ByVal mTrnCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset, mBillDepoAmt_old As Double, mBillRefuAmt_old As Double, mBillAmtAftDisc_old As Double

UpdateHdr = False
If Chk_ActiveTran() = False Or mTrnCode <> ActiveTrnCode Then
    ErrorBox "clsHmsLabMultiTranEntry_UpdateDtl_#874_[InActive " & mTitleName & " Entry]"
    GoTo EndSub
End If

On Error GoTo errhand

m_dbHmsDatabase.BeginTrans
With tRecset
.open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic

Rem .Fields(mTrnHdrCodeField) = AutoNumber
.fields(mTrnHdrDateField) = mTrnDate_dt
.fields(mTrnVtmField) = mTrnVtmCode_lng
.fields(mTrnPrefixField) = mTrnPrefix_str
.fields(mTrnVchNoField) = mTrnVchNo_lng
.fields(mTrnPostfixField) = mTrnPostfix_str
Rem .fields(mTrnHdrCmpCodeField) = mTrnCmpCode_int
.fields(mTrnHdrRecStateField) = ChkEditRecStatus(.fields(mTrnHdrRecStateField))

If blnLabRcptTran = True Then
    mBillAmtAftDisc_old = mLhrAmtAftDisc_dbl
    mBillDepoAmt_old = mLhrDepoAmt_dbl
    mBillRefuAmt_old = mLhrRefuAmt_dbl

    .fields("LhrLpgCode") = mLhrLpgCode_lng
    .fields("LhrTime") = mLhrTime_lng
    .fields("LhrOldLhrCode") = mLhrOldLhrCode_lng
    .fields("LhrPttCode") = mLhrPttCode_lng
    .fields("LhrCDctCode") = mLhrCDctCode_lng
    .fields("LhrRByCode") = mLhrRByCode_lng
    .fields("LhrRToCode") = mLhrRToCode_lng
    .fields("LhrPDigCode") = mLhrPDigCode_lng
    .fields("LhrFDigCode") = mLhrFDigCode_lng
    .fields("LhrPttDiscPer") = mLhrPttDiscPer_dbl
    .fields("LhrAmtBefDisc") = mLhrAmtBefDisc_dbl
    .fields("LhrDiscAmt") = mLhrDiscAmt_dbl
    .fields("LhrAmtAftDisc") = mLhrAmtAftDisc_dbl
    .fields("LhrAdvAmt") = mLhrAdvAmt_dbl
    .fields("LhrRecdAmt") = mLhrRecdAmt_dbl
    .fields("LhrDepoAmt") = mLhrDepoAmt_dbl
    .fields("LhrRefuAmt") = mLhrRefuAmt_dbl
    .fields("LhrBalAmt") = mLhrBalAmt_dbl
    .fields("LhrRemark") = mLhrRemark_str
    
ElseIf blnLabPymtTran = True Then
    .fields("LphLpgCode") = mLphLpgCode_lng
    .fields("LphLhrCode") = mLphLhrCode_lng
    .fields("LphTime") = mLphTime_lng
    .fields("LphOldLphCode") = mLphOldLphCode_lng
    .fields("LphPttCode") = mLphPttCode_lng
    .fields("LphDepoAmt") = mLphDepoAmt_dbl
    .fields("LphRemark") = mLphRemark_str
    
ElseIf blnLabRefdTran = True Then
    .fields("LfhLpgCode") = mLfhLpgCode_lng
    .fields("LfhLhrCode") = mLfhLhrCode_lng
    .fields("LfhTime") = mLfhTime_lng
    .fields("LfhOldLfhCode") = mLfhOldLfhCode_lng
    .fields("LfhPttCode") = mLfhPttCode_lng
    .fields("LfhRefuAmt") = mLfhRefuAmt_dbl
    .fields("LfhRemark") = mLfhRemark_str
    
    
Else
    ErrorBox "clsHmsLabMultiTranEntry_UpdateHdr_#911_[Undefined Case]"
End If
.Update
End With
m_dbHmsDatabase.CommitTrans
CloseTable tRecset

If blnLabRcptTran = True Then
    Rem If mLhrDepoAmt_dbl <> mBillDepoAmt_old Then
        DispersePropRcptDepoAmt mTrnCode, (mBillDepoAmt_old * -1)                       ' removing deposit amount from old receipt
        m_dbHmsDatabase.Execute ("Update LabRcpt set LrcDepoAmt = 0 where LrcCode = " & CStr(mTrnCode) & " and LrcDepoAmt <> 0")
        DispersePropRcptDepoAmt mTrnCode, mLhrDepoAmt_dbl                               ' adding deposit amount to new receipt
    Rem End If
    Rem If mLhrRefuAmt_dbl <> mBillRefuAmt_old Then
        DispersePropRcptRefuAmt mTrnCode, (mBillRefuAmt_old * -1)                       ' removing refund amount from old receipt
        m_dbHmsDatabase.Execute ("Update LabRcpt set LrcRefuAmt = 0 where LrcCode = " & CStr(mTrnCode) & " and LrcRefuAmt <> 0")
        DispersePropRcptRefuAmt mTrnCode, mLhrRefuAmt_dbl                               ' adding refund amount to new receipt
    Rem End If
    
End If

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
Dim mLpyLhrCode As Long, mLpyDepoAmt As Double
Dim mLfdLhrCode As Long, mLfdRefuAmt As Double
Dim mObpyObhCode As Long, mObpyDepoAmt As Double
Dim mObfdObhCode As Long, mObfdRefuAmt As Double

UpdateDtl = False
If Chk_ActiveTran() = False Or mTrnCode <> ActiveTrnCode Then
    ErrorBox "clsHmsLabMultiTranEntry_UpdateDtl_#936_[InActive " & mTitleName & " Entry]"
    GoTo EndSub
End If

On Error GoTo errhand

m_dbHmsDatabase.BeginTrans
With tRecset
.open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " and " & mTrnDtlICodeField & "=" & CStr(mTrnICode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic

Rem mTrnDtlICode_lng = AutoNumber
.fields(mTrnDtlCodeField) = mTrnCode_lng
.fields(mTrnDtlSnoField) = mTrnDtlSno_int
.fields(mTrnDtlDateField) = mTrnDate_dt
Rem .fields(mTrnDtlCmpCodeField) = mTrnCmpCode_int
.fields(mTrnDtlRecStateField) = ChkEditRecStatus(.fields(mTrnDtlRecStateField))

If blnLabRcptTran = True Then
    .fields("LrcPttCode") = mLrcPttCode_lng
    .fields("LrcSrvCode") = mLrcSrvCode_lng
    .fields("LrcUnit") = mLrcUnit_dbl
    .fields("LrcRate") = mLrcRate_dbl
    .fields("LrcAmtBefDisc") = mLrcAmtBefDisc_dbl
    .fields("LrcDiscPer") = mLrcDiscPer_dbl
    .fields("LrcDiscAmt") = mLrcDiscAmt_dbl
    .fields("LrcAmtAftDisc") = mLrcAmtAftDisc_dbl
    .fields("LrcAdvAmt") = mLrcAdvAmt_dbl
    .fields("LrcRecdAmt") = mLrcRecdAmt_dbl
    .fields("LrcDepoAmt") = mLrcDepoAmt_dbl
    .fields("LrcRefuAmt") = mLrcRefuAmt_dbl
    .fields("LrcBalAmt") = mLrcBalAmt_dbl
    .fields("LrcRemark") = mLrcRemark_str
    
ElseIf blnLabPymtTran = True Then
    mLpyLhrCode = .fields("LpyLhrCode")
    mLpyDepoAmt = .fields("LpyDepoAmt")
    
    .fields("LpyPttCode") = mLpyPttCode_lng
    .fields("LpyLhrCode") = mLpyLhrCode_lng
    .fields("LpyDepoAmt") = mLpyDepoAmt_dbl
    .fields("LpyRemark") = mLpyRemark_str
    
ElseIf blnLabRefdTran = True Then
    mLfdLhrCode = .fields("LfdLhrCode")
    mLfdRefuAmt = .fields("LfdRefuAmt")
    
    .fields("LfdPttCode") = mLfdPttCode_lng
    .fields("LfdLhrCode") = mLfdLhrCode_lng
    .fields("LfdRefuAmt") = mLfdRefuAmt_dbl
    .fields("LfdRemark") = mLfdRemark_str
    
    
Else
    ErrorBox "clsHmsLabMultiTranEntry_UpdateDtl_#966_[Undefined Case]"
End If
.Update

If blnLabPymtTran = True Then
    If mLpyLhrCode <> .fields("LpyLhrCode") Then
        DispersePropRcptDepoAmt mLpyLhrCode, (mLpyDepoAmt * -1)                 ' removing deposit amount for old receipt
        DispersePropRcptDepoAmt .fields("LpyLhrCode"), .fields("LpyDepoAmt")    ' adding deposit amount to new receipt
    ElseIf mLpyDepoAmt <> .fields("LpyDepoAmt") Then
        mLpyDepoAmt = .fields("LpyDepoAmt") - mLpyDepoAmt
        DispersePropRcptDepoAmt mLpyLhrCode, mLpyDepoAmt
    End If
    
ElseIf blnLabRefdTran = True Then
    If mLfdLhrCode <> .fields("LfdLhrCode") Then
        DispersePropRcptRefuAmt mLfdLhrCode, (mLfdRefuAmt * -1)                 ' removing refund amount for old receipt
        DispersePropRcptRefuAmt .fields("LfdLhrCode"), .fields("LfdRefuAmt")    ' adding refund amount to new receipt
    ElseIf mLfdRefuAmt <> .fields("LfdRefuAmt") Then
        mLfdRefuAmt = .fields("LfdRefuAmt") - mLfdRefuAmt
        DispersePropRcptRefuAmt mLfdLhrCode, mLfdRefuAmt
    End If


End If
End With
CloseTable tRecset
m_dbHmsDatabase.CommitTrans

Rem service doctor detail service change updation if any
If blnLabRcptTran = True Then
    m_dbHmsDatabase.BeginTrans
    With tRecset
    .open "Select * from " & mTrnSdcTableName & " where " & mTrnSdcCodeField & "=" & CStr(mTrnCode) & " and " & mTrnSdcSubCodeField & "=" & CStr(mTrnICode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
    If .EOF = False Then
        Do While .EOF = False
            If .fields(mTrnSdcSrvCodeField) <> mSdcSrvCode_lng Then
                .fields(mTrnSdcSrvCodeField) = mSdcSrvCode_lng
                
                .Update
            End If
            .MoveNext
        Loop
    End If
    End With
    CloseTable tRecset
    m_dbHmsDatabase.CommitTrans
End If

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

Public Sub UpdateSdc(ByVal mSdcCode As Long, mSdcSubCode As Long, ByVal mSdcICode As Long)
Dim tRecset As New ADODB.Recordset, mCanUpdate As Boolean, mLCount As Integer, mUCount As Integer, acount As Integer
mCanUpdate = True

On Error GoTo errhand
mSdcICode_lng = 0
If mCanUpdate = True Then
    m_dbHmsDatabase.BeginTrans
    With tRecset
    .open "Select * from " & mTrnSdcTableName & " where " & mTrnSdcCodeField & "=" & CStr(mSdcCode) & " and " & mTrnSdcSubCodeField & "=" & CStr(mSdcSubCode) & " and " & mTrnSdcICodeField & "=" & CStr(mSdcICode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
    
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
    Rem .fields(mTrnSdcCmpCodeField) = mSdcCmpCode_int
    
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

Public Function DeleteDtl(ByVal mTrnCode As Long, ByVal mTrnICode As Long, Optional mConfirm As Boolean) As Boolean
Dim tRecset As New ADODB.Recordset, mDeleteit As Boolean

DeleteDtl = False
If Chk_ActiveTran() = False Or mTrnCode <> ActiveTrnCode Then
    ErrorBox "clsHmsLabMultiTranEntry_DeleteDtl_#995_[InActive " & mTitleName & " Entry]"
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
    .open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " and " & mTrnDtlICodeField & "=" & CStr(mTrnICode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
    
    .fields(mTrnDtlRecStateField) = ChkDeleteRecStatus(.fields(mTrnDtlRecStateField))
    .Update
    End With
    If blnLabPymtTran = True Then
        DispersePropRcptDepoAmt tRecset.fields("LpyLhrCode"), (tRecset.fields("LpyDepoAmt") * -1)
    ElseIf blnLabRefdTran = True Then
        DispersePropRcptRefuAmt tRecset.fields("LfdLhrCode"), (tRecset.fields("LfdRefuAmt") * -1)
    End If
    CloseTable tRecset
    m_dbHmsDatabase.CommitTrans
    
    Rem service doctor detail deletion
    If blnLabRcptTran = True Then
        m_dbHmsDatabase.BeginTrans
        With tRecset
        .open "Select * from " & mTrnSdcTableName & " where " & mTrnSdcCodeField & "=" & CStr(mTrnCode) & " and " & mTrnSdcSubCodeField & "=" & CStr(mTrnICode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
        If .EOF = False Then
            Do While .EOF = False
                .fields(mTrnSdcRecStateField) = ChkDeleteRecStatus(.fields(mTrnSdcRecStateField))
                .Update
                
                .MoveNext
            Loop
        End If
        End With
        CloseTable tRecset
        m_dbHmsDatabase.CommitTrans
    End If
    
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

Public Function DeleteSdc(ByVal mSdcCode As Long, ByVal mSdcSubCode As Long, ByVal mSdcICode As Long, Optional mConfirm As Boolean) As Boolean
Dim tRecset As New ADODB.Recordset, mDeleteit As Boolean

DeleteSdc = False
If Chk_ActiveTran() = False Or mSdcCode <> ActiveTrnCode Then
    ErrorBox "clsHmsLabMultiTranEntry_DeleteSdc_#2312_[InActive " & mTitleName & " Entry]"
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
    .open "Select * from " & mTrnSdcTableName & " where " & mTrnSdcCodeField & "=" & CStr(mSdcCode) & " and " & mTrnSdcSubCodeField & "=" & mSdcSubCode & " and " & mTrnSdcICodeField & "=" & CStr(mSdcICode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
    
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

Private Sub DispersePropRcptDepoAmt(ByVal mLpyLhrCode As Long, ByVal mLpyDepoAmt_diff As Double)
Dim tRecset As New ADODB.Recordset, mLpyDepoAmtTot As Double, mPropDepoAmt As Variant, mAmtAftDiscTot As Double, mLpyDepoAmtBal As Double, mLpyDepoAmtAdjusted As Double

On Error GoTo errhand

mLpyDepoAmtTot = mLpyDepoAmt_diff
mLpyDepoAmtBal = mLpyDepoAmt_diff
mLpyDepoAmtAdjusted = 0
mAmtAftDiscTot = 0
mLpyDepoAmtAdjusted = 0

With tRecset
.open "Select * from LabHdr where LhrCode = " & CStr(mLpyLhrCode), m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
mAmtAftDiscTot = .fields("LhrAmtAftDisc")
End With
CloseTable tRecset

With tRecset
.open "Select * from LabRcpt where LrcCode = " & CStr(mLpyLhrCode) & " order by LrcSno", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then        ''' And mLpyDepoAmtTot <> 0 10-04-2015
    m_dbHmsDatabase.BeginTrans
    Do While .EOF = False
        If InList(.fields("LrcRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
            mPropDepoAmt = CDec(Round(MyDivide(CDec(mLpyDepoAmtTot) * CDec(.fields("LrcAmtAftDisc")), CDec(mAmtAftDiscTot)), 2))
            
            .fields("LrcDepoAmt") = CDec(.fields("LrcDepoAmt")) + CDec(mPropDepoAmt)
            .fields("LrcBalAmt") = CDec(.fields("LrcAmtAftDisc")) - (CDec(.fields("LrcAdvAmt")) + CDec(.fields("LrcDepoAmt")) + CDec(.fields("LrcRecdAmt")))    ''' + .fields("LrcRefuAmt")
            .Update
            
            mLpyDepoAmtBal = mLpyDepoAmtBal - mPropDepoAmt
            mLpyDepoAmtAdjusted = mLpyDepoAmtAdjusted + mPropDepoAmt
        Else
            If InList(.fields("LrcRecState"), Array(cREC_CANCELED, cREC_DELETED)) = False Then
                ErrorBox "clsHmsLabMultiTranEntry_DispersePropRcptDepoAmt_#1540_[Invalid Record Status]"
            End If
        End If
        
        .MoveNext
    Loop
    If mLpyDepoAmtBal <> 0 And mLpyDepoAmtBal <> mLpyDepoAmtTot Then
        Rem .MovePrevious   10-04-2015
        .Close
        .open "Select top 1 * from LabRcpt where LrcCode = " & CStr(mLpyLhrCode) & " order by LrcSno desc", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
        
        mPropDepoAmt = mLpyDepoAmtBal
        .fields("LrcDepoAmt") = CDec(.fields("LrcDepoAmt")) + CDec(mPropDepoAmt)
        .fields("LrcBalAmt") = CDec(.fields("LrcAmtAftDisc")) - (CDec(.fields("LrcAdvAmt")) + CDec(.fields("LrcDepoAmt")) + CDec(.fields("LrcRecdAmt")))    ''' + .fields("LrcRefuAmt")
        .Update
        
        mLpyDepoAmtBal = mLpyDepoAmtBal - mPropDepoAmt
        mLpyDepoAmtAdjusted = mLpyDepoAmtAdjusted + mPropDepoAmt
    End If
    m_dbHmsDatabase.CommitTrans
End If
End With
CloseTable tRecset

m_dbHmsDatabase.BeginTrans
With tRecset
.open "Select * from LabHdr where LhrCode = " & CStr(mLpyLhrCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
.fields("LhrDepoAmt") = CDec(.fields("LhrDepoAmt")) + CDec(mLpyDepoAmtAdjusted)
.fields("LhrBalAmt") = CDec(.fields("LhrAmtAftDisc")) - (CDec(.fields("LhrAdvAmt")) + CDec(.fields("LhrRecdAmt")) + CDec(.fields("LhrDepoAmt")))
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

Private Sub DispersePropRcptRefuAmt(ByVal mLfdLhrCode As Long, ByVal mLfdRefuAmt_diff As Double)
Dim tRecset As New ADODB.Recordset, mLfdRefuAmtTot As Double, mPropRefuAmt As Variant, mLfdRefuAmtBal As Double, mLfdAmtAftDiscTot As Double, mLfdRefuAmtAdjusted As Double

On Error GoTo errhand

mLfdRefuAmtBal = mLfdRefuAmt_diff
mLfdRefuAmtTot = mLfdRefuAmt_diff
mLfdRefuAmtAdjusted = 0
mLfdAmtAftDiscTot = 0

With tRecset
.open "Select * from LabHdr where LhrCode = " & CStr(mLfdLhrCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
mLfdAmtAftDiscTot = .fields("LhrAmtAftDisc")
End With
CloseTable tRecset

With tRecset
.open "Select * from LabRcpt where LrcCode=" & CStr(mLfdLhrCode) & " order by LrcSno", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then        ''' And mLfdRefuAmtTot <> 0
    m_dbHmsDatabase.BeginTrans
    Do While .EOF = False
        mPropRefuAmt = Round(MyDivide(CDec(mLfdRefuAmtTot) * CDec(.fields("LrcAmtAftDisc")), CDec(mLfdAmtAftDiscTot)), 2)
        
        .fields("LrcRefuAmt") = CDec(.fields("LrcRefuAmt")) + CDec(mPropRefuAmt)
        .fields("LrcBalAmt") = CDec(.fields("LrcAmtAftDisc")) - (CDec(.fields("LrcAdvAmt")) + CDec(.fields("LrcDepoAmt")) + CDec(.fields("LrcRecdAmt")))
        .Update
        
        mLfdRefuAmtBal = mLfdRefuAmtBal - mPropRefuAmt
        mLfdRefuAmtAdjusted = mLfdRefuAmtAdjusted + mPropRefuAmt
        
        .MoveNext
    Loop
    If mLfdRefuAmtBal <> 0 And mLfdRefuAmtBal <> mLfdRefuAmtTot Then
        Rem .MovePrevious
        .Close
        .open "Select top 1 * from LabRcpt where LrcCode = " & CStr(mLfdLhrCode) & " order by LrcSno desc", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
        
        mPropRefuAmt = mLfdRefuAmtBal
        
        .fields("LrcRefuAmt") = CDec(.fields("LrcRefuAmt")) + CDec(mPropRefuAmt)
        .fields("LrcBalAmt") = CDec(.fields("LrcAmtAftDisc")) - (CDec(.fields("LrcAdvAmt")) + CDec(.fields("LrcDepoAmt")) + CDec(.fields("LrcRecdAmt")))
        .Update
        
        mLfdRefuAmtBal = mLfdRefuAmtBal - mPropRefuAmt
        mLfdRefuAmtAdjusted = mLfdRefuAmtAdjusted + mPropRefuAmt
    End If
    m_dbHmsDatabase.CommitTrans
End If
End With
CloseTable tRecset

m_dbHmsDatabase.BeginTrans
With tRecset
.open "Select * from LabHdr where LhrCode=" & CStr(mLfdLhrCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
.fields("LhrRefuAmt") = CDec(.fields("LhrRefuAmt")) + CDec(mLfdRefuAmtAdjusted)
.fields("LhrBalAmt") = CDec(.fields("LhrAmtAftDisc")) - (CDec(.fields("LhrAdvAmt")) + CDec(.fields("LhrRecdAmt")) + CDec(.fields("LhrDepoAmt")))
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
Dim t1Recset As New ADODB.Recordset, t2Recset As New ADODB.Recordset, t3Recset As New ADODB.Recordset

Data_CreateLog = False
If Chk_ActiveTran() = False Or mTrnCode <> ActiveTrnCode Then
    ErrorBox "clsHmsLabMultiTranEntry_Data_CreateLog_#406_[InActive " & mTitleName & " Entry]"
    GoTo EndSub
End If
mCrashedEntry = False

t1Recset.open "Select * from " & mTrnDtlTableName & "_Log where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnDtlICodeField & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
t2Recset.open "Select * from " & mTrnHdrTableName & "_Log where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
If blnLabRcptTran = True Then
    t3Recset.open "Select * from " & mTrnSdcTableName & "_Log where " & mTrnSdcCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnSdcICodeField & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
End If
If t1Recset.RecordCount = 0 Then
    m_dbHmsDatabase.BeginTrans
    m_dbHmsDatabase.Execute "Insert into " & mTrnDtlTableName & "_Log Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " and " & mTrnDtlRecStateField & "=" & CStr(cREC_UNCHANGED) & ""
    m_dbHmsDatabase.CommitTrans
Else
    AlertBox "clsHmsLabMultiTranEntry_Data_CreateLog_#2976_[Unsaved " & mTitleName & " Entry]"
    mCrashedEntry = True
End If

If t2Recset.RecordCount = 0 Then
    m_dbHmsDatabase.BeginTrans
    m_dbHmsDatabase.Execute "Insert into " & mTrnHdrTableName & "_Log Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & " and " & mTrnHdrRecStateField & "=" & CStr(cREC_UNCHANGED) & ""
    m_dbHmsDatabase.CommitTrans
Else
    AlertBox "clsHmsLabMultiTranEntry_Data_CreateLog_#2984_[Unsaved " & mTitleName & " Entry]"
    mCrashedEntry = True
End If

If blnLabRcptTran = True Then
    If t3Recset.RecordCount = 0 Then
        m_dbHmsDatabase.BeginTrans
        m_dbHmsDatabase.Execute "Insert into " & mTrnSdcTableName & "_Log Select * from " & mTrnSdcTableName & " where " & mTrnSdcCodeField & "=" & CStr(mTrnCode) & " and " & mTrnSdcRecStateField & "=" & CStr(cREC_UNCHANGED) & ""
        m_dbHmsDatabase.CommitTrans
    Else
        AlertBox "clsHmsLabMultiTranEntry_Data_CreateLog_#2993_[Unsaved " & mTitleName & " Entry]"
        mCrashedEntry = True
    End If
End If

CloseTable t1Recset
CloseTable t2Recset
CloseTable t3Recset, mCheckOpen:=True

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
CloseTable t3Recset, mCheckOpen:=True
Exit Function

End Function

Private Function Data_RemoveLog(ByVal mTrnCode As Long) As Boolean
Data_RemoveLog = False
If Chk_ActiveTran() = False Then
    ErrorBox "clsHmsLabMultiTranEntry_Data_RemoveLog_#1041_[InActive " & mTitleName & " Entry]"
    Exit Function
End If
If mCrashedEntry = True Then
    ErrorBox "Remove Entry Log Aborted for Crashed/Uncomplete Entries, User Must Save Entry !!!"
    Exit Function
End If

m_dbHmsDatabase.BeginTrans
m_dbHmsDatabase.Execute "Delete from " & mTrnDtlTableName & "_Log where " & mTrnDtlCodeField & "=" & CStr(mTrnCode)
m_dbHmsDatabase.Execute "Delete from " & mTrnHdrTableName & "_Log where " & mTrnHdrCodeField & "=" & CStr(mTrnCode)
If blnLabRcptTran = True Then
    m_dbHmsDatabase.Execute "Delete from " & mTrnSdcTableName & "_Log where " & mTrnSdcCodeField & "=" & CStr(mTrnCode)
End If
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
If blnLabRcptTran = True Then
    With tRecset
    .open "Select * from LabPymtDtl dtl inner join LabPymtHdr hdr on dtl.LpyCode = hdr.LphCode where LpyLhrCode = " & CStr(mTrnCode) & " order by LpyDate desc,LphVchNo desc", m_dbHmsDatabase, adOpenKeyset, adLockReadOnly
    If .EOF = False Then
        AlertBox "Lab Payment No." & CStr(.fields("LphVchNo")) & " Dated " & Dtoc(.fields("LphDate")) & " !!!"
        ChkEntryExist = True
    End If
    End With
    CloseTable tRecset
    
    If ChkEntryExist = False Then
        With tRecset
        .open "Select * from LabRefdDtl dtl inner join LabRefdHdr hdr on dtl.LfdCode = hdr.LfhCode where LfdLhrCode = " & CStr(mTrnCode) & " order by LfdDate desc,LfhVchNo desc", m_dbHmsDatabase, adOpenKeyset, adLockReadOnly
        If .EOF = False Then
            AlertBox "Lab Refund No." & CStr(.fields("LfhVchNo")) & " Dated " & Dtoc(.fields("LfhDate")) & " !!!"
            ChkEntryExist = True
        End If
        End With
        CloseTable tRecset
    End If

ElseIf blnLabPymtTran = True Then
    Dim mLpyDepoAmt As Double, mLpyLhrCode As Long
    With tRecset
    .open "Select LpyLhrCode,sum(LpyDepoAmt) as LpyDepoAmt_sum from LabPymtDtl dtl inner join LabPymtHdr hdr on dtl.LpyCode=hdr.LphCode where LpyCode=" & CStr(mTrnCode) & " group by LpyLhrCode", m_dbHmsDatabase, adOpenKeyset, adLockReadOnly
    If .EOF = False Then
        Do While .EOF = False And ChkEntryExist = False
            mLpyLhrCode = .fields("LpyLhrCode")
            mLpyDepoAmt = .fields("LpyDepoAmt_sum")
            
            With t1Recset
            .open "Select * from LabHdr hdr inner join VTypMast vtm on hdr.LhrVtmCode = vtm.VtmCode where LhrCode=" & CStr(mLpyLhrCode) & "", m_dbComDatabase, adOpenKeyset, adLockReadOnly
            If .EOF = False Then
                If .fields("LhrRefuAmt") > (.fields("LhrAdvAmt") + .fields("LhrRecdAmt") + .fields("LhrDepoAmt") - mLpyDepoAmt) Then
                    ErrorBox "Excess Amount Refunded for Receipt No." & .fields("VtmName") & "-" & CStr(.fields("LhrVchNo")) & " Dated " & Dtoc(.fields("LhrDate")) & " !!!"
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
    
ElseIf blnLabRefdTran = True Then
    Rem does not affect transaction for any negative balance
    

Else
    ErrorBox "Checking Under Process !!!"

End If

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Function


End Function

