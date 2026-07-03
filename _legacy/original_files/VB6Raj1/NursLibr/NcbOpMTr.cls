VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsHmsOpdMultiTranEntry"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Dim m_dbHmsDatabase As ADODB.Connection, m_dbAcDatabase As ADODB.Connection, m_dbComDatabase As ADODB.Connection
Dim mClassUIdCode As Long, mClassUIdFileName As String, mClassAcsPermFileName As String, mClassDtlUIdFileName As String, mClassDtlAcsPermFileName As String
Dim mTrnHdrTableName As String, mTrnDtlTableName As String, mTrnHdrCodeField As String, mTrnDtlCodeField As String, mTrnHdrDateField As String, mTrnDtlDateField As String, mTrnVtmField As String, mTrnPrefixField As String, mTrnVchNoField As String, mTrnPostfixField As String, mTrnDtlICodeField As String, mTrnDtlSnoField As String, mTrnHdrRecStateField As String, mTrnDtlRecStateField As String, mTrnHdrCmpCodeField As String, mTrnDtlCmpCodeField As String, mTitleName As String
Dim mTrnSdcTableName As String, mTrnSdcCodeField As String, mTrnSdcSubCodeField As String, mTrnSdcICodeField As String, mTrnSdcSnoField As String, mTrnSdcDateField As String, mTrnSdcPttCodeField As String, mTrnSdcSrvCodeField As String, mTrnSdcDctCodeField As String, mTrnSdcDrlCodeField As String, mTrnSdcRemarkField As String, mTrnSdcRecStateField As String, mTrnSdcCmpCodeField As String
Public blnOutdRcptTran As Boolean, blnOutdPymtTran As Boolean, blnOutdRefdTran As Boolean, blnOutdBillTran As Boolean, blnOutdBlPymtTran As Boolean, blnOutdBlRefdTran As Boolean
Rem common class variables used in both header and detail
Public mTrnCode_lng As Long, mTrnVtmCode_lng As Long, mTrnPrefix_str As String, mTrnVchNo_lng As Long, mTrnPostfix_str As String, mTrnDate_dt As Date, mTrnCmpCode_int As Integer
Rem common class header variables
Public mTrnHdrRecState_int As Integer
Rem common class detail variables
Public mTrnDtlICode_lng As Long, mTrnDtlSno_int As Integer, mTrnDtlRecState_int As Integer
Rem service doctor detail variables
Public mSdcCode_lng As Long, mSdcSubCode_lng As Long, mSdcICode_lng As Long, mSdcSno_int As Integer, mSdcDate_dt As Date, mSdcPttCode_lng As Long, mSdcSrvCode_lng As Long, mSdcDctCode_lng As Long, mSdcDrlCode_lng As Long, mSdcRemark_str As String, mSdcRecState_int As Integer, mSdcCmpCode_int As Long
Rem outdoor receipt header variables
Public mOhrOpgCode_lng As Long, mOhrPttCode_lng As Long, mOhrTime_lng As Long, mOhrOldOhrCode_lng As Long, mOhrPttDiscPer_dbl As Long, mOhrAmtBefDisc_dbl As Double, mOhrDiscAmt_dbl As Double, mOhrAmtAftDisc_dbl As Double, mOhrAdvAmt_dbl As Double, mOhrRecdAmt_dbl As Double, mOhrDepoAmt_dbl As Double, mOhrRefuAmt_dbl As Double, mOhrBalAmt_dbl As Double, mOhrRemark_str As String
Rem outdoor receipt detail variables
Public mOrcSrvCode_lng As Long, mOrcPttCode_lng As Long, mOrcUnit_dbl As Double, mOrcRate_dbl As Double, mOrcAmtBefDisc_dbl As Double, mOrcDiscPer_dbl As Double, mOrcDiscAmt_dbl As Double, mOrcAmtAftDisc_dbl As Double, mOrcAdvAmt_dbl As Double, mOrcRecdAmt_dbl As Double, mOrcDepoAmt_dbl As Double, mOrcRefuAmt_dbl As Double, mOrcBalAmt_dbl As Double, mOrcRemark_str As String
Rem outdoor payment receipt header variables
Public mOphOpgCode_lng As Long, mOphTime_lng As Long, mOphOldOphCode_lng As Long, mOphPttCode_lng As Long, mOphDepoAmt_dbl As Double, mOphRemark_str As String
Rem outdoor payment receipt detail variables
Public mOpyPttCode_lng As Long, mOpyOhrCode_lng As Long, mOpyDepoAmt_dbl As Double, mOpyRemark_str As String
Rem outdoor refund receipt header variables
Public mOfhOpgCode_lng As Long, mOfhTime_lng As Long, mOfhOldOfhCode_lng As Long, mOfhPttCode_lng As Long, mOfhRefuAmt_dbl As Double, mOfhRemark_str As String
Rem outdoor refund receipt detail variables
Public mOfdPttCode_lng As Long, mOfdOhrCode_lng As Long, mOfdRefuAmt_dbl As Double, mOfdRemark_str As String
Rem outdoor bill header variables
Public mObhOpgCode_lng As Long, mObhPttCode_lng As Long, mObhTime_lng As Long, mObhOldObhCode_lng As Long, mObhPttDiscPer_dbl As Long, mObhAmtBefDisc_dbl As Double, mObhDiscAmt_dbl As Double, mObhAmtAftDisc_dbl As Double, mObhDepoAmt_dbl As Double, mObhRefuAmt_dbl As Double, mObhBalAmt_dbl As Double, mObhRemark_str As String
Rem outdoor bill detail variables
Public mOblSrvCode_dbl As Double, mOblPttCode_lng As Long, mOblUnit_dbl As Double, mOblRate_dbl As Double, mOblAmtBefDisc_dbl As Double, mOblDiscPer_dbl As Double, mOblDiscAmt_dbl As Double, mOblAmtAftDisc_dbl As Double, mOblDepoAmt_dbl As Double, mOblRefuAmt_dbl As Double, mOblBalAmt_dbl As Double, mOblRemark_str As String
Rem outdoor bill payment receipt header variables
Public mObphOpgCode_lng As Long, mObphTime_lng As Long, mObphOldObphCode_lng As Long, mObphPttCode_lng As Long, mObphDepoAmt_dbl As Double, mObphRemark_str As String
Rem outdoor bill payment receipt detail variables
Public mObpyPttCode_lng As Long, mObpyObhCode_lng As Long, mObpyDepoAmt_dbl As Double, mObpyRemark_str As String
Rem outdoor bill refund receipt header variables
Public mObfhOpgCode_lng As Long, mObfhTime_lng As Long, mObfhOldObfhCode_lng As Long, mObfhPttCode_lng As Long, mObfhRefuAmt_dbl As Double, mObfhRemark_str As String
Rem outdoor bill refund receipt detail variables
Public mObfdPttCode_lng As Long, mObfdObhCode_lng As Long, mObfdRefuAmt_dbl As Double, mObfdRemark_str As String

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
    mTrnDtlICodeField = "OrcICode"
    mTrnDtlSnoField = "OrcSno"
    mTitleName = "Outdoor Receipt"
    Rem service doctor detail
    mTrnSdcTableName = "OutdRcDctDtl"
    mTrnSdcCodeField = "OrdCode"
    mTrnSdcSubCodeField = "OrdOrcCode"
    mTrnSdcICodeField = "OrdICode"
    mTrnSdcSnoField = "OrdSno"
    mTrnSdcDateField = "OrdDate"
    mTrnSdcPttCodeField = "OrdPttCode"
    mTrnSdcSrvCodeField = "OrdSrvCode"
    mTrnSdcDctCodeField = "OrdDctCode"
    mTrnSdcDrlCodeField = "OrdDrlCode"
    mTrnSdcRemarkField = "OrdRemark"
    mTrnSdcRecStateField = "OrdRecState"
    mTrnSdcCmpCodeField = "OrdCmpCode"
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
    mTrnDtlICodeField = "OpyICode"
    mTrnDtlSnoField = "OpySno"
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
    mTrnDtlICodeField = "OfdICode"
    mTrnDtlSnoField = "OfdSno"
    mTitleName = "Outdoor Refund"
    
    Set clsPAT = New clsHmsMasterEntry
    Set clsPAT.dbHmsDatabase = m_dbHmsDatabase
    Set clsPAT.dbAcDatabase = m_dbAcDatabase
    clsPAT.blnPatMast = True
    clsPAT.Init
    
ElseIf blnOutdBillTran = True Then
    mTrnHdrTableName = "OutdBlHdr": mTrnDtlTableName = "OutdBill"
    mTrnHdrCodeField = "ObhCode": mTrnDtlCodeField = "OblCode"
    mTrnHdrDateField = "ObhDate": mTrnDtlDateField = "OblDate"
    mTrnHdrRecStateField = "ObhRecState": mTrnDtlRecStateField = "OblRecState"
    mTrnHdrCmpCodeField = "ObhCmpCode": mTrnDtlCmpCodeField = "OblCmpCode"
    mTrnVtmField = "ObhVtmCode"
    mTrnPrefixField = "ObhPrefix"
    mTrnVchNoField = "ObhVchNo"
    mTrnPostfixField = "ObhPostfix"
    mTrnDtlICodeField = "OblICode"
    mTrnDtlSnoField = "OblSno"
    mTitleName = "Outdoor Bill"
    Rem service doctor detail
    mTrnSdcTableName = "OutdBlDctDtl"
    mTrnSdcCodeField = "ObdCode"
    mTrnSdcSubCodeField = "ObdOblCode"
    mTrnSdcICodeField = "ObdICode"
    mTrnSdcSnoField = "ObdSno"
    mTrnSdcDateField = "ObdDate"
    mTrnSdcPttCodeField = "ObdPttCode"
    mTrnSdcSrvCodeField = "ObdSrvCode"
    mTrnSdcDctCodeField = "ObdDctCode"
    mTrnSdcDrlCodeField = "ObdDrlCode"
    mTrnSdcRemarkField = "ObdRemark"
    mTrnSdcRecStateField = "ObdRecState"
    mTrnSdcCmpCodeField = "ObdCmpCode"
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
    
ElseIf blnOutdBlPymtTran = True Then
    mTrnHdrTableName = "OutdBlPymtHdr": mTrnDtlTableName = "OutdBlPymtDtl"
    mTrnHdrCodeField = "ObphCode": mTrnDtlCodeField = "ObpyCode"
    mTrnHdrDateField = "ObphDate": mTrnDtlDateField = "ObpyDate"
    mTrnHdrRecStateField = "ObphRecState": mTrnDtlRecStateField = "ObpyRecState"
    mTrnHdrCmpCodeField = "ObphCmpCode": mTrnDtlCmpCodeField = "ObpyCmpCode"
    mTrnVtmField = "ObphVtmCode"
    mTrnPrefixField = "ObphPrefix"
    mTrnVchNoField = "ObphVchNo"
    mTrnPostfixField = "ObphPostfix"
    mTrnDtlICodeField = "ObpyICode"
    mTrnDtlSnoField = "ObpySno"
    mTitleName = "Outdoor Due Payment"
    
    Set clsPAT = New clsHmsMasterEntry
    Set clsPAT.dbHmsDatabase = m_dbHmsDatabase
    Set clsPAT.dbAcDatabase = m_dbAcDatabase
    clsPAT.blnPatMast = True
    clsPAT.Init
    
ElseIf blnOutdBlRefdTran = True Then
    mTrnHdrTableName = "OutdBlRefdHdr": mTrnDtlTableName = "OutdBlRefdDtl"
    mTrnHdrCodeField = "ObfhCode": mTrnDtlCodeField = "ObfdCode"
    mTrnHdrDateField = "ObfhDate": mTrnDtlDateField = "ObfdDate"
    mTrnHdrRecStateField = "ObfhRecState": mTrnDtlRecStateField = "ObfdRecState"
    mTrnHdrCmpCodeField = "ObfhCmpCode": mTrnDtlCmpCodeField = "ObfdCmpCode"
    mTrnVtmField = "ObfhVtmCode"
    mTrnPrefixField = "ObfhPrefix"
    mTrnVchNoField = "ObfhVchNo"
    mTrnPostfixField = "ObfhPostfix"
    mTrnDtlICodeField = "ObfdICode"
    mTrnDtlSnoField = "ObfdSno"
    mTitleName = "Outdoor Refund"
    
    Set clsPAT = New clsHmsMasterEntry
    Set clsPAT.dbHmsDatabase = m_dbHmsDatabase
    Set clsPAT.dbAcDatabase = m_dbAcDatabase
    clsPAT.blnPatMast = True
    clsPAT.Init
    
Else
    ErrorBox "clsHmsOpdMultiTranEntry_Init_#73_[Undefined Case]"
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

mClassUIdFileName = "clsHmsOpdMultiTrn.UId"
mClassAcsPermFileName = "clsHmsOpdMultiTrn.Acp"
mClassDtlUIdFileName = "clsHmsOpdMultiTrnDtl.UId"
mClassDtlAcsPermFileName = "clsHmsOpdMultiTrnDtl.Acp"

mClassUIdCode = GetUIdCode("clsHmsOpdMultiTranEntry_Initialize", mUIdFileName:=mClassUIdFileName, mAcsPermFileName:=mClassAcsPermFileName)

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
        
    ElseIf blnOutdBillTran = True Then
        mObhOpgCode_lng = .fields("ObhOpgCode")
        mObhTime_lng = .fields("ObhTime")
        mObhOldObhCode_lng = .fields("ObhOldObhCode")
        mObhPttCode_lng = .fields("ObhPttCode")
        mObhPttDiscPer_dbl = .fields("ObhPttDiscPer")
        mObhAmtBefDisc_dbl = .fields("ObhAmtBefDisc")
        mObhDiscAmt_dbl = .fields("ObhDiscAmt")
        mObhAmtAftDisc_dbl = .fields("ObhAmtAftDisc")
        mObhDepoAmt_dbl = .fields("ObhDepoAmt")
        mObhRefuAmt_dbl = .fields("ObhRefuAmt")
        mObhBalAmt_dbl = .fields("ObhBalAmt")
        mObhRemark_str = .fields("ObhRemark")
        
        clsPAT.GetData .fields("ObhPttCode")
        
    ElseIf blnOutdBlPymtTran = True Then
        mObphOpgCode_lng = .fields("ObphOpgCode")
        mObphTime_lng = .fields("ObphTime")
        mObphOldObphCode_lng = .fields("ObphOldObphCode")
        mObphPttCode_lng = .fields("ObphPttCode")
        mObphDepoAmt_dbl = .fields("ObphDepoAmt")
        mObphRemark_str = .fields("ObphRemark")
        
        clsPAT.GetData .fields("ObphPttCode")
    
    ElseIf blnOutdBlRefdTran = True Then
        mObfhOpgCode_lng = .fields("ObfhOpgCode")
        mObfhTime_lng = .fields("ObfhTime")
        mObfhOldObfhCode_lng = .fields("ObfhOldObfhCode")
        mObfhPttCode_lng = .fields("ObfhPttCode")
        mObfhRefuAmt_dbl = .fields("ObfhRefuAmt")
        mObfhRemark_str = .fields("ObfhRemark")
        
        clsPAT.GetData .fields("ObfhPttCode")
        
    Else
        ErrorBox "clsHmsOpdMultiTranEntry_GetHdrData_#133_[Undefined Case]"
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
    .Open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " and " & mTrnDtlICodeField & "=" & CStr(mTrnICode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
Else
    .Open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " and " & mTrnDtlSnoField & "=" & CStr(mTrnSno) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
End If
If .RecordCount > 0 Then
    mTrnCode_lng = .fields(mTrnDtlCodeField)
    mTrnDtlICode_lng = .fields(mTrnDtlICodeField)
    mTrnDtlSno_int = .fields(mTrnDtlSnoField)
    mTrnDate_dt = .fields(mTrnDtlDateField)
    mTrnDtlRecState_int = .fields(mTrnDtlRecStateField)
    mTrnCmpCode_int = .fields(mTrnDtlCmpCodeField)
    
    If blnOutdRcptTran = True Then
        mOrcPttCode_lng = .fields("OrcPttCode")
        mOrcSrvCode_lng = .fields("OrcSrvCode")
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
        
    ElseIf blnOutdBillTran = True Then
        mOblPttCode_lng = .fields("OblPttCode")
        mOblSrvCode_dbl = .fields("OblSrvCode")
        mOblUnit_dbl = .fields("OblUnit")
        mOblRate_dbl = .fields("OblRate")
        mOblAmtBefDisc_dbl = .fields("OblAmtBefDisc")
        mOblDiscPer_dbl = .fields("OblDiscPer")
        mOblDiscAmt_dbl = .fields("OblDiscAmt")
        mOblAmtAftDisc_dbl = .fields("OblAmtAftDisc")
        mOblDepoAmt_dbl = .fields("OblDepoAmt")
        mOblRefuAmt_dbl = .fields("OblRefuAmt")
        mOblBalAmt_dbl = .fields("OblBalAmt")
        mOblRemark_str = .fields("OblRemark")
        
        clsSRV.GetData .fields("OblSrvCode")
    
    ElseIf blnOutdBlPymtTran = True Then
        mObpyPttCode_lng = .fields("ObpyPttCode")
        mObpyObhCode_lng = .fields("ObpyObhCode")
        mObpyDepoAmt_dbl = .fields("ObpyDepoAmt")
        mObpyRemark_str = .fields("ObpyRemark")
        
    ElseIf blnOutdBlRefdTran = True Then
        mObfdPttCode_lng = .fields("ObfdPttCode")
        mObfdObhCode_lng = .fields("ObfdObhCode")
        mObfdRefuAmt_dbl = .fields("ObfdRefuAmt")
        mObfdRemark_str = .fields("ObfdRemark")
        
    Else
        ErrorBox "clsHmsOpdMultiTranEntry_GetDtlData_#173_[Undefined Case]"
    End If
End If
End With
CloseTable tRecset

End Sub

Public Sub GetSdcData(ByVal mSdcCode As Long, ByVal mSdcSubCode As Long, ByVal mSdcICode As Long)
Dim tRecset As New ADODB.Recordset, acount As Integer

Me.ClearSdc
With tRecset
.Open "Select * from " & mTrnSdcTableName & " where " & mTrnSdcCodeField & "=" & CStr(mSdcCode) & " and " & mTrnSdcSubCodeField & "=" & CStr(mSdcSubCode) & " and " & mTrnSdcICodeField & "=" & CStr(mSdcICode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
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

ElseIf blnOutdBillTran = True Then
    mObhOpgCode_lng = 0
    mObhTime_lng = 0
    mObhOldObhCode_lng = 0
    mObhPttCode_lng = 0
    mObhPttDiscPer_dbl = 0
    mObhAmtBefDisc_dbl = 0
    mObhDiscAmt_dbl = 0
    mObhAmtAftDisc_dbl = 0
    mObhDepoAmt_dbl = 0
    mObhRefuAmt_dbl = 0
    mObhBalAmt_dbl = 0
    mObhRemark_str = ""
    
    clsPAT.Clear

ElseIf blnOutdBlPymtTran = True Then
    mObphOpgCode_lng = 0
    mObphTime_lng = 0
    mObphOldObphCode_lng = 0
    mObphPttCode_lng = 0
    mObphDepoAmt_dbl = 0
    mObphRemark_str = ""
    
    clsPAT.Clear

ElseIf blnOutdBlRefdTran = True Then
    mObfhOpgCode_lng = 0
    mObfhTime_lng = 0
    mObfhOldObfhCode_lng = 0
    mObfhPttCode_lng = 0
    mObfhRefuAmt_dbl = 0
    mObfhRemark_str = ""
    
    clsPAT.Clear

Else
    ErrorBox "clsHmsOpdMultiTranEntry_ClearHdr_#212_[Undefined Case]"
End If

End Sub

Public Sub ClearDtl()

mTrnCode_lng = 0
mTrnDtlICode_lng = 0
mTrnDtlSno_int = 0
mTrnDate_dt = cUNKNOWNDATE
mTrnDtlRecState_int = 0
mTrnCmpCode_int = 0

If blnOutdRcptTran = True Then
    mOrcPttCode_lng = 0
    mOrcSrvCode_lng = 0
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
    
ElseIf blnOutdBillTran = True Then
    mOblPttCode_lng = 0
    mOblSrvCode_dbl = 0
    mOblUnit_dbl = 0
    mOblRate_dbl = 0
    mOblAmtBefDisc_dbl = 0
    mOblDiscPer_dbl = 0
    mOblDiscAmt_dbl = 0
    mOblAmtAftDisc_dbl = 0
    mOblDepoAmt_dbl = 0
    mOblRefuAmt_dbl = 0
    mOblBalAmt_dbl = 0
    mOblRemark_str = ""
    
    clsSRV.Clear

ElseIf blnOutdBlPymtTran = True Then
    mObpyPttCode_lng = 0
    mObpyObhCode_lng = 0
    mObpyDepoAmt_dbl = 0
    mObpyRemark_str = ""

ElseIf blnOutdBlRefdTran = True Then
    mObfdPttCode_lng = 0
    mObfdObhCode_lng = 0
    mObfdRefuAmt_dbl = 0
    mObfdRemark_str = ""
    
Else
    ErrorBox "clsHmsOpdMultiTranEntry_ClearDtl_#244_[Undefined Case]"
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
    mTrnCode = GetUIdCode("clsHmsOpdMultiTranEntry_BeginTran", mUIdFileName:=mClassUIdFileName, mAcsPermFileName:=mClassAcsPermFileName) * -1   '   GetNextSeqno(m_dbAcDatabase, "mTrnHdrTableName", "mTrnHdrCodeField")
    If mTrnCode = 0 Then
        ErrorBox "clsHmsOpdMultiTranEntry_BeginTran_#266_[Invalid " & mTitleName & " Code]"
        GoTo EndSub
    End If
ElseIf mTrnCode > 0 Then
    tRecset.Open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.RecordCount = 0 Then
        ErrorBox "clsHmsOpdMultiTranEntry_BeginTran_#272_[Entry not Found]"
        GoTo EndSub
    End If
    CloseTable tRecset
Else
    ErrorBox "clsHmsOpdMultiTranEntry_BeginTran_#277_[Invalid " & mTitleName & " Entry Code Request]"
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

mRtnval = GetUIdCode("clsHmsOpdMultiTranDtlEntry_BeginTran", mUIdFileName:=mClassDtlUIdFileName, mAcsPermFileName:=mClassDtlAcsPermFileName) * -1

GetDtlTranUnqCode = mRtnval

End Function

Public Function EndTran(ByVal mTrnCode As Long) As Boolean
Dim mCnt As Integer
EndTran = False
If Chk_ActiveTran() = False Or IIf(ActiveTrnCode > 0, mTrnCode <> ActiveTrnCode, False) Then
    ErrorBox "clsHmsOpdMultiTranEntry_EndTran_#294_[InActive Transaction Entry]"
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
.Open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Rem Do While .EOF = False
        If InList(.fields(mTrnHdrRecStateField), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
            If blnOutdRcptTran = True Then
                .fields("OhrBalAmt") = .fields("OhrAmtAftDisc") - (.fields("OhrAdvAmt") + .fields("OhrRecdAmt") + .fields("OhrDepoAmt"))
            ElseIf blnOutdBillTran = True Then
                .fields("ObhBalAmt") = .fields("ObhAmtAftDisc") - (.fields("ObhDepoAmt"))
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
    .Open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnDtlICodeField & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
Else
    .Open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTmpTrnCode) & " order by " & mTrnDtlICodeField & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
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
            
            ElseIf blnOutdBillTran = True Then
                If .fields("OblPttCode") <> mObhPttCode_lng Then
                    .fields("OblPttCode") = mObhPttCode_lng
                End If
            
            ElseIf blnOutdBlPymtTran = True Then
                If .fields("ObpyPttCode") <> mObphPttCode_lng Then
                    .fields("ObpyPttCode") = mObphPttCode_lng
                End If
            
            ElseIf blnOutdBlRefdTran = True Then
                If .fields("ObfdPttCode") <> mObfhPttCode_lng Then
                    .fields("ObfdPttCode") = mObfhPttCode_lng
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
    If blnOutdRcptTran = True Then
        DispersePropRcptRecdAmt mTrnCode
    End If
End If
End With
CloseTable tRecset
m_dbHmsDatabase.CommitTrans

Rem service doctor detail updations
If blnOutdRcptTran = True Or blnOutdBillTran = True Then
    Rem order by SubCode+ICode so as to reset sno for each service
    m_dbHmsDatabase.BeginTrans
    With tRecset
    If mTrnCode = mTmpTrnCode Then
        .Open "Select * from " & mTrnSdcTableName & " where " & mTrnSdcCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnSdcSubCodeField & "," & mTrnSdcICodeField & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
    Else
        .Open "Select * from " & mTrnSdcTableName & " where " & mTrnSdcCodeField & "=" & CStr(mTmpTrnCode) & " order by " & mTrnSdcSubCodeField & "," & mTrnSdcICodeField & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
    End If
    If .RecordCount > 0 Then
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
                If blnOutdRcptTran = True Then
                    If .fields(mTrnSdcPttCodeField) <> mOhrPttCode_lng Then
                        .fields(mTrnSdcPttCodeField) = mOhrPttCode_lng
                    End If
                ElseIf blnOutdBillTran = True Then
                    If .fields(mTrnSdcPttCodeField) <> mObhPttCode_lng Then
                        .fields(mTrnSdcPttCodeField) = mObhPttCode_lng
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

Private Sub DisperseFifoRcptRecdAmt(ByVal mTrnCode As Long)
Dim tRecset As New ADODB.Recordset, mRecdAmtBal As Double, mReqdRecdAmt As Double

With tRecset
.Open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
mRecdAmtBal = .fields("OhrRecdAmt")
End With
CloseTable tRecset

With tRecset
.Open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnDtlICodeField & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
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
                ErrorBox "clsHmsOpdMultiTranEntry_DisperseFifoRcptRecdAmt_#2316_[Invalid Record Status]"
            End If
        End If
        .MoveNext
    Loop
    m_dbHmsDatabase.CommitTrans
Else
    If mRecdAmtBal <> 0 Then
        ErrorBox "clsHmsOpdMultiTranEntry_DisperseFifoRcptRecdAmt_#3002_[Unexpected]"
    End If
End If
End With
CloseTable tRecset

End Sub

Private Sub DispersePropRcptRecdAmt(ByVal mTrnCode As Long)
Dim tRecset As New ADODB.Recordset, mRecdAmtBal As Double, mRecdAmtTot As Double, mPropRecdAmt As Double, mAmtAftDiscTot As Double

With tRecset
.Open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
mRecdAmtBal = .fields("OhrRecdAmt")
mRecdAmtTot = .fields("OhrRecdAmt")
mAmtAftDiscTot = .fields("OhrAmtAftDisc")
End With
CloseTable tRecset

With tRecset
.Open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnDtlICodeField & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    m_dbHmsDatabase.BeginTrans
    Do While .EOF = False
        If InList(.fields("OrcRecState"), Array(cREC_UNCHANGED)) = True Then
            mPropRecdAmt = Round(mRecdAmtTot * .fields("OrcAmtAftDisc") / mAmtAftDiscTot, 2)
            
            .fields("OrcRecdAmt") = mPropRecdAmt
            .fields("OrcBalAmt") = .fields("OrcAmtAftDisc") - (.fields("OrcAdvAmt") + .fields("OrcDepoAmt")) - mPropRecdAmt
            .Update
                
            mRecdAmtBal = mRecdAmtBal - mPropRecdAmt
        Else
            If InList(.fields("OrcRecState"), Array(cREC_CANCELED, cREC_DELETED)) = False Then
                ErrorBox "clsHmsOpdMultiTranEntry_DispersePropRcptRecdAmt_#2316_[Invalid Record Status]"
            End If
        End If
        .MoveNext
    Loop
    If Round(mRecdAmtBal, 2) <> 0 And mRecdAmtBal <> mRecdAmtTot Then
        .MovePrevious
        
        mPropRecdAmt = Round(mRecdAmtBal, 2) + .fields("OrcRecdAmt")
        .fields("OrcRecdAmt") = mPropRecdAmt
        .fields("OrcBalAmt") = .fields("OrcAmtAftDisc") - (.fields("OrcAdvAmt") + .fields("OrcDepoAmt")) - mPropRecdAmt
        .Update
    End If
    m_dbHmsDatabase.CommitTrans
Else
    If mRecdAmtBal <> 0 Then
        ErrorBox "clsHmsOpdMultiTranEntry_DispersePropRcptRecdAmt_#3002_[Unexpected]"
    End If
End If
End With
CloseTable tRecset

End Sub

Public Function CancelTran(ByVal mTrnCode As Long) As Boolean
Dim t1Recset As New ADODB.Recordset, t2Recset As New ADODB.Recordset
Dim mOpyOhrCode As Long, mOpyDepoAmt As Double
Dim mOfdOhrCode As Long, mOfdRefuAmt As Double
Dim mObpyObhCode As Long, mObpyDepoAmt As Double
Dim mObfdObhCode As Long, mObfdRefuAmt As Double
Dim mRecAdded As Boolean, mRecEdited As Boolean, mRecDeleted As Boolean, mRecCanceled As Boolean

CancelTran = False
If Chk_ActiveTran() = False Or mTrnCode <> ActiveTrnCode Then
    ErrorBox "clsHmsOpdMultiTranEntry_CancelTran_#419_[InActive Transaction Entry]"
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
            
            ElseIf blnOutdBillTran = True Then
                .fields("ObhOpgCode") = t2Recset.fields("ObhOpgCode")
                .fields("ObhTime") = t2Recset.fields("ObhTime")
                .fields("ObhOldObhCode") = t2Recset.fields("ObhOldObhCode")
                .fields("ObhPttCode") = t2Recset.fields("ObhPttCode")
                .fields("ObhPttDiscPer") = t2Recset.fields("ObhPttDiscPer")
                .fields("ObhAmtBefDisc") = t2Recset.fields("ObhAmtBefDisc")
                .fields("ObhDiscAmt") = t2Recset.fields("ObhDiscAmt")
                .fields("ObhAmtAftDisc") = t2Recset.fields("ObhAmtAftDisc")
                .fields("ObhDepoAmt") = t2Recset.fields("ObhDepoAmt")
                .fields("ObhRefuAmt") = t2Recset.fields("ObhRefuAmt")
                .fields("ObhBalAmt") = t2Recset.fields("ObhBalAmt")
                .fields("ObhRemark") = t2Recset.fields("ObhRemark")
            
            ElseIf blnOutdBlPymtTran = True Then
                .fields("ObphOpgCode") = t2Recset.fields("ObphOpgCode")
                .fields("ObphTime") = t2Recset.fields("ObphTime")
                .fields("ObphOldObphCode") = t2Recset.fields("ObphOldObphCode")
                .fields("ObphPttCode") = t2Recset.fields("ObphPttCode")
                .fields("ObphDepoAmt") = t2Recset.fields("ObphDepoAmt")
                .fields("ObphRemark") = t2Recset.fields("ObphRemark")
                
            ElseIf blnOutdBlRefdTran = True Then
                .fields("ObfhOpgCode") = t2Recset.fields("ObfhOpgCode")
                .fields("ObfhTime") = t2Recset.fields("ObfhTime")
                .fields("ObfhOldObfhCode") = t2Recset.fields("ObfhOldObfhCode")
                .fields("ObfhPttCode") = t2Recset.fields("ObfhPttCode")
                .fields("ObfhRefuAmt") = t2Recset.fields("ObfhRefuAmt")
                .fields("ObfhRemark") = t2Recset.fields("ObfhRemark")
            
            Else
                ErrorBox "clsHmsOpdMultiTranEntry_CancelTran_#459_[Undefined Case]"
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
.Open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnDtlICodeField & " desc", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
t2Recset.Open "Select * from " & mTrnDtlTableName & "_Log where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnDtlICodeField & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
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
                
            ElseIf blnOutdBillTran = True Then
                .fields("OblPttCode") = t2Recset.fields("OblPttCode")
                .fields("OblSrvCode") = t2Recset.fields("OblSrvCode")
                .fields("OblUnit") = t2Recset.fields("OblUnit")
                .fields("OblRate") = t2Recset.fields("OblRate")
                .fields("OblAmtBefDisc") = t2Recset.fields("OblAmtBefDisc")
                .fields("OblDiscPer") = t2Recset.fields("OblDiscPer")
                .fields("OblDiscAmt") = t2Recset.fields("OblDiscAmt")
                .fields("OblAmtAftDisc") = t2Recset.fields("OblAmtAftDisc")
                .fields("OblDepoAmt") = t2Recset.fields("OblDepoAmt")
                .fields("OblRefuAmt") = t2Recset.fields("OblRefuAmt")
                .fields("OblBalAmt") = t2Recset.fields("OblBalAmt")
                .fields("OblRemark") = t2Recset.fields("OblRemark")
            
            ElseIf blnOutdBlPymtTran = True Then
                
                mObpyObhCode = .fields("ObpyObhCode")
                mObpyDepoAmt = .fields("ObpyDepoAmt")
                
                .fields("ObpyPttCode") = t2Recset.fields("ObpyPttCode")
                .fields("ObpyObhCode") = t2Recset.fields("ObpyObhCode")
                .fields("ObpyDepoAmt") = t2Recset.fields("ObpyDepoAmt")
                .fields("ObpyRemark") = t2Recset.fields("ObpyRemark")
                
            ElseIf blnOutdBlRefdTran = True Then
                mObfdObhCode = .fields("ObfdObhCode")
                mObfdRefuAmt = .fields("ObfdRefuAmt")
                
                .fields("ObfdPttCode") = t2Recset.fields("ObfdPttCode")
                .fields("ObfdObhCode") = t2Recset.fields("ObfdObhCode")
                .fields("ObfdRefuAmt") = t2Recset.fields("ObfdRefuAmt")
                .fields("ObfdRemark") = t2Recset.fields("ObfdRemark")
                
            Else
                ErrorBox "clsHmsOpdMultiTranEntry_CancelTran_#506_[Undefined Case]"
            End If
            .Update
            
            If blnOutdPymtTran = True Then
                If mRecEdited = True Then
                    If mOpyOhrCode <> .fields("OpyOhrCode") Then
                        DispersePropRcptDepoAmt mOpyOhrCode, (mOpyDepoAmt * -1)                     ' removing deposit amount from old receipt
                        DispersePropRcptDepoAmt .fields("OpyOhrCode"), .fields("OpyDepoAmt")        ' adding deposit amount to new receipt
                    ElseIf mOpyDepoAmt <> .fields("OpyDepoAmt") Then
                        mOpyDepoAmt = .fields("OpyDepoAmt") - mOpyDepoAmt
                        DispersePropRcptDepoAmt mOpyOhrCode, mOpyDepoAmt
                    End If
                ElseIf mRecDeleted = True Then
                    DispersePropRcptDepoAmt .fields("OpyOhrCode"), .fields("OpyDepoAmt")        ' adding deposit amount to restored receipt
                End If
            
            ElseIf blnOutdRefdTran = True Then
                If mRecEdited = True Then
                    If mOfdOhrCode <> .fields("OfdOhrCode") Then
                        DispersePropRcptRefuAmt mOfdOhrCode, (mOfdRefuAmt * -1)                     ' removing refund amount from old receipt
                        DispersePropRcptRefuAmt .fields("OfdOhrCode"), .fields("OfdRefuAmt")        ' adding refund amount to new receipt
                    ElseIf mOfdRefuAmt <> .fields("OfdRefuAmt") Then
                        mOfdRefuAmt = .fields("OfdRefuAmt") - mOfdRefuAmt
                        DispersePropRcptRefuAmt mOfdOhrCode, mOfdRefuAmt
                    End If
                ElseIf mRecDeleted = True Then
                    DispersePropRcptRefuAmt .fields("OfdOhrCode"), .fields("OfdRefuAmt")        ' adding refund amount to restored receipt
                End If
                
            ElseIf blnOutdBlPymtTran = True Then
                If mRecEdited = True Then
                    If mObpyObhCode <> .fields("ObpyObhCode") Then
                        DispersePropBillDepoAmt mObpyObhCode, (mObpyDepoAmt * -1)                     ' removing deposit amount from old receipt
                        DispersePropBillDepoAmt .fields("ObpyObhCode"), .fields("ObpyDepoAmt")        ' adding deposit amount to new receipt
                    ElseIf mObpyDepoAmt <> .fields("ObpyDepoAmt") Then
                        mObpyDepoAmt = .fields("ObpyDepoAmt") - mObpyDepoAmt
                        DispersePropBillDepoAmt mObpyObhCode, mObpyDepoAmt
                    End If
                ElseIf mRecDeleted = True Then
                    DispersePropBillDepoAmt .fields("ObpyObhCode"), .fields("ObpyDepoAmt")        ' adding deposit amount to restored receipt
                End If
            
            ElseIf blnOutdBlRefdTran = True Then
                If mRecEdited = True Then
                    If mObfdObhCode <> .fields("ObfdObhCode") Then
                        DispersePropBillRefuAmt mObfdObhCode, (mObfdRefuAmt * -1)                     ' removing refund amount from old receipt
                        DispersePropBillRefuAmt .fields("ObfdObhCode"), .fields("ObfdRefuAmt")        ' adding refund amount to new receipt
                    ElseIf mObfdRefuAmt <> .fields("ObfdRefuAmt") Then
                        mObfdRefuAmt = .fields("ObfdRefuAmt") - mObfdRefuAmt
                        DispersePropBillRefuAmt mObfdObhCode, mObfdRefuAmt
                    End If
                ElseIf mRecDeleted = True Then
                    DispersePropBillRefuAmt .fields("ObfdObhCode"), .fields("ObfdRefuAmt")        ' adding refund amount to restored receipt
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
                
            ElseIf blnOutdBlPymtTran = True Then
                mObpyObhCode = .fields("ObpyObhCode")
                mObpyDepoAmt = .fields("ObpyDepoAmt")
                
            ElseIf blnOutdBlRefdTran = True Then
                mObfdObhCode = .fields("ObfdObhCode")
                mObfdRefuAmt = .fields("ObfdRefuAmt")
            
            End If
            
            .fields(mTrnDtlRecStateField) = ChkDeleteRecStatus(.fields(mTrnDtlRecStateField))
            .Update
            .Delete
            
            If mRecAdded = True Then
                If blnOutdPymtTran = True Then
                    DispersePropRcptDepoAmt mOpyOhrCode, (mOpyDepoAmt * -1)
                ElseIf blnOutdRefdTran = True Then
                    DispersePropRcptRefuAmt mOfdOhrCode, (mOfdRefuAmt * -1)
                ElseIf blnOutdBlPymtTran = True Then
                    DispersePropBillDepoAmt mObpyObhCode, (mObpyDepoAmt * -1)
                ElseIf blnOutdBlRefdTran = True Then
                    DispersePropBillRefuAmt mObfdObhCode, (mObfdRefuAmt * -1)
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
If blnOutdRcptTran = True Or blnOutdBillTran = True Then
    m_dbHmsDatabase.BeginTrans
    With t1Recset
    .Open "Select * from " & mTrnSdcTableName & " where " & mTrnSdcCodeField & "=" & CStr(mTrnCode), m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
    t2Recset.Open "Select * from " & mTrnSdcTableName & "_Log where " & mTrnSdcCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnSdcICodeField & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount > 0 Then
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
On Error GoTo errhand

m_dbHmsDatabase.BeginTrans
With t1Recset
.Open "Select * from " & mTrnSdcTableName & " where " & mTrnSdcCodeField & "=" & CStr(mSdcCode) & " and " & mTrnSdcSubCodeField & "=" & CStr(mSdcSubCode), m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
t2Recset.Open "Select * from " & mTrnSdcTableName & "_Log where " & mTrnSdcCodeField & "=" & CStr(mSdcCode) & " and " & mTrnSdcSubCodeField & "=" & CStr(mSdcSubCode) & " order by " & mTrnSdcICodeField & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
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
    ErrorBox "clsHmsOpdMultiTranEntry_DeleteTran_#551_[InActive Transaction Entry]"
    GoTo EndSub
End If
On Error GoTo errhand

Rem header section
m_dbHmsDatabase.BeginTrans
With tRecset
.Open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
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
.Open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnDtlICodeField & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
Do While .EOF = False
    .fields(mTrnDtlRecStateField) = ChkDeleteRecStatus(.fields(mTrnDtlRecStateField))
    .Update
    '' .Delete deleted in update transaction
    
    If blnOutdPymtTran = True Then
        DispersePropRcptDepoAmt .fields("OpyOhrCode"), (.fields("OpyDepoAmt") * -1)
    ElseIf blnOutdRefdTran = True Then
        DispersePropRcptRefuAmt .fields("OfdOhrCode"), (.fields("OfdRefuAmt") * -1)
    ElseIf blnOutdBlPymtTran = True Then
        DispersePropBillDepoAmt .fields("ObpyObhCode"), (.fields("ObpyDepoAmt") * -1)
    ElseIf blnOutdBlRefdTran = True Then
        DispersePropBillRefuAmt .fields("ObfdObhCode"), (.fields("ObfdRefuAmt") * -1)
    End If
    
    .MoveNext
Loop
End With
CloseTable tRecset
m_dbHmsDatabase.CommitTrans

Rem service doctor detail deletion marking
If blnOutdRcptTran = True Or blnOutdBillTran = True Then
    m_dbHmsDatabase.BeginTrans
    With tRecset
    .Open "Select * from " & mTrnSdcTableName & " where " & mTrnSdcCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnSdcICodeField & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
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
    ErrorBox "clsHmsOpdMultiTranEntry_SelectTran_#412_[Invalid " & mTitleName & " Entry]"
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
    ErrorBox "clsHmsOpdMultiTranEntry_NextTran_#432_[End of " & mTitleName & " Entry]"
    Exit Function
End If
mActiveTran = mActiveTran + 1

NextTran = True
End Function

Public Function PreviousTran()
PreviousTran = False
If BOTrn = True Then
    ErrorBox "clsHmsOpdMultiTranEntry_PreviousTran_#443_[Begining of " & mTitleName & " Entry]"
    Exit Function
End If
mActiveTran = mActiveTran - 1

PreviousTran = True
End Function

Public Function FirstTran() As Boolean
FirstTran = False
If CountTran = 0 Then
    ErrorBox "clsHmsOpdMultiTranEntry_FirstTran_#454_[No " & mTitleName & " Entry]"
    Exit Function
End If
mActiveTran = LBound(aHmsTran)

FirstTran = True

End Function

Public Function LastTran() As Boolean
LastTran = False
If CountTran = 0 Then
    ErrorBox "clsHmsOpdMultiTranEntry_LastTran_#466_[No " & mTitleName & " Entry]"
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
    ErrorBox "clsHmsOpdMultiTranEntry_AddNewHdr_#736_[InActive " & mTitleName & " Entry]"
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

ElseIf blnOutdBillTran = True Then
    .fields("ObhOpgCode") = mObhOpgCode_lng
    .fields("ObhTime") = mObhTime_lng
    .fields("ObhOldObhCode") = mObhOldObhCode_lng
    .fields("ObhPttCode") = mObhPttCode_lng
    .fields("ObhPttDiscPer") = mObhPttDiscPer_dbl
    .fields("ObhAmtBefDisc") = mObhAmtBefDisc_dbl
    .fields("ObhDiscAmt") = mObhDiscAmt_dbl
    .fields("ObhAmtAftDisc") = mObhAmtAftDisc_dbl
    .fields("ObhDepoAmt") = mObhDepoAmt_dbl
    .fields("ObhRefuAmt") = mObhRefuAmt_dbl
    .fields("ObhBalAmt") = mObhBalAmt_dbl
    .fields("ObhRemark") = mObhRemark_str

ElseIf blnOutdBlPymtTran = True Then
    .fields("ObphOpgCode") = mObphOpgCode_lng
    .fields("ObphTime") = mObphTime_lng
    .fields("ObphOldObphCode") = mObphOldObphCode_lng
    .fields("ObphPttCode") = mObphPttCode_lng
    .fields("ObphDepoAmt") = mObphDepoAmt_dbl
    .fields("ObphRemark") = mObphRemark_str
    
ElseIf blnOutdBlRefdTran = True Then
    .fields("ObfhOpgCode") = mObfhOpgCode_lng
    .fields("ObfhTime") = mObfhTime_lng
    .fields("ObfhOldObfhCode") = mObfhOldObfhCode_lng
    .fields("ObfhPttCode") = mObfhPttCode_lng
    .fields("ObfhRefuAmt") = mObfhRefuAmt_dbl
    .fields("ObfhRemark") = mObfhRemark_str

Else
    ErrorBox "clsHmsOpdMultiTranEntry_AddNewHdr_#776_[Undefined Case]"
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
    ErrorBox "clsHmsOpdMultiTranEntry_AddNewDtl_#810_[InActive " & mTitleName & " Entry]"
    GoTo EndSub
End If

On Error GoTo errhand
mTmpDtlICode = mTrnDtlICode_lng
mTrnDtlICode_lng = 0

m_dbHmsDatabase.BeginTrans
With tRecset
.Open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=-0.1", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic

.AddNew

Rem mTrnDtlICode_lng = AutoNumber
.fields(mTrnDtlCodeField) = mTrnCode
.fields(mTrnDtlSnoField) = mTrnDtlSno_int
.fields(mTrnDtlDateField) = mTrnDate_dt
.fields(mTrnDtlCmpCodeField) = mTrnCmpCode_int
.fields(mTrnDtlRecStateField) = ChkEditRecStatus(.fields(mTrnDtlRecStateField))

If blnOutdRcptTran = True Then
    .fields("OrcPttCode") = mOrcPttCode_lng
    .fields("OrcSrvCode") = mOrcSrvCode_lng
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
    
    DispersePropRcptDepoAmt mOpyOhrCode_lng, mOpyDepoAmt_dbl
    
ElseIf blnOutdRefdTran = True Then
    .fields("OfdPttCode") = mOfdPttCode_lng
    .fields("OfdOhrCode") = mOfdOhrCode_lng
    .fields("OfdRefuAmt") = mOfdRefuAmt_dbl
    .fields("OfdRemark") = mOfdRemark_str
    
    DispersePropRcptRefuAmt mOfdOhrCode_lng, mOfdRefuAmt_dbl
    
ElseIf blnOutdBillTran = True Then
    .fields("OblPttCode") = mOblPttCode_lng
    .fields("OblSrvCode") = mOblSrvCode_dbl
    .fields("OblUnit") = mOblUnit_dbl
    .fields("OblRate") = mOblRate_dbl
    .fields("OblAmtBefDisc") = mOblAmtBefDisc_dbl
    .fields("OblDiscPer") = mOblDiscPer_dbl
    .fields("OblDiscAmt") = mOblDiscAmt_dbl
    .fields("OblAmtAftDisc") = mOblAmtAftDisc_dbl
    .fields("OblDepoAmt") = mOblDepoAmt_dbl
    .fields("OblRefuAmt") = mOblRefuAmt_dbl
    .fields("OblBalAmt") = mOblBalAmt_dbl
    .fields("OblRemark") = mOblRemark_str
    
ElseIf blnOutdBlPymtTran = True Then
    .fields("ObpyPttCode") = mObpyPttCode_lng
    .fields("ObpyObhCode") = mObpyObhCode_lng
    .fields("ObpyDepoAmt") = mObpyDepoAmt_dbl
    .fields("ObpyRemark") = mObpyRemark_str
    
    DispersePropBillDepoAmt mObpyObhCode_lng, mObpyDepoAmt_dbl
    
ElseIf blnOutdBlRefdTran = True Then
    .fields("ObfdPttCode") = mObfdPttCode_lng
    .fields("ObfdObhCode") = mObfdObhCode_lng
    .fields("ObfdRefuAmt") = mObfdRefuAmt_dbl
    .fields("ObfdRemark") = mObfdRemark_str
    
    DispersePropBillRefuAmt mObfdObhCode_lng, mObfdRefuAmt_dbl
    
Else
    ErrorBox "clsHmsOpdMultiTranEntry_AddNewDtl_#844_[Undefined Case]"
End If
.Update

mTrnDtlICode_lng = .fields(mTrnDtlICodeField)
End With
CloseTable tRecset
m_dbHmsDatabase.CommitTrans

Rem service doctor detail link code updation if any
If blnOutdRcptTran = True Or blnOutdBillTran = True Then
    m_dbHmsDatabase.BeginTrans
    With tRecset
    .Open "Select * from " & mTrnSdcTableName & " where " & mTrnSdcCodeField & "=" & CStr(mTrnCode) & " and " & mTrnSdcSubCodeField & "=" & CStr(mTmpDtlICode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
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
Dim tRecset As New ADODB.Recordset

UpdateHdr = False
If Chk_ActiveTran() = False Or mTrnCode <> ActiveTrnCode Then
    ErrorBox "clsHmsOpdMultiTranEntry_UpdateDtl_#874_[InActive " & mTitleName & " Entry]"
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
Rem .fields(mTrnHdrCmpCodeField) = mTrnCmpCode_int
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
    
ElseIf blnOutdBillTran = True Then
    .fields("ObhOpgCode") = mObhOpgCode_lng
    .fields("ObhTime") = mObhTime_lng
    .fields("ObhOldObhCode") = mObhOldObhCode_lng
    .fields("ObhPttCode") = mObhPttCode_lng
    .fields("ObhPttDiscPer") = mObhPttDiscPer_dbl
    .fields("ObhAmtBefDisc") = mObhAmtBefDisc_dbl
    .fields("ObhDiscAmt") = mObhDiscAmt_dbl
    .fields("ObhAmtAftDisc") = mObhAmtAftDisc_dbl
    .fields("ObhDepoAmt") = mObhDepoAmt_dbl
    .fields("ObhRefuAmt") = mObhRefuAmt_dbl
    .fields("ObhBalAmt") = mObhBalAmt_dbl
    .fields("ObhRemark") = mObhRemark_str
    
ElseIf blnOutdBlPymtTran = True Then
    .fields("ObphOpgCode") = mObphOpgCode_lng
    .fields("ObphTime") = mObphTime_lng
    .fields("ObphOldObphCode") = mObphOldObphCode_lng
    .fields("ObphPttCode") = mObphPttCode_lng
    .fields("ObphDepoAmt") = mObphDepoAmt_dbl
    .fields("ObphRemark") = mObphRemark_str
    
ElseIf blnOutdBlRefdTran = True Then
    .fields("ObfhOpgCode") = mObfhOpgCode_lng
    .fields("ObfhTime") = mObfhTime_lng
    .fields("ObfhOldObfhCode") = mObfhOldObfhCode_lng
    .fields("ObfhPttCode") = mObfhPttCode_lng
    .fields("ObfhRefuAmt") = mObfhRefuAmt_dbl
    .fields("ObfhRemark") = mObfhRemark_str
    
Else
    ErrorBox "clsHmsOpdMultiTranEntry_UpdateHdr_#911_[Undefined Case]"
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
Dim mObpyObhCode As Long, mObpyDepoAmt As Double
Dim mObfdObhCode As Long, mObfdRefuAmt As Double

UpdateDtl = False
If Chk_ActiveTran() = False Or mTrnCode <> ActiveTrnCode Then
    ErrorBox "clsHmsOpdMultiTranEntry_UpdateDtl_#936_[InActive " & mTitleName & " Entry]"
    GoTo EndSub
End If

On Error GoTo errhand

m_dbHmsDatabase.BeginTrans
With tRecset
.Open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " and " & mTrnDtlICodeField & "=" & CStr(mTrnICode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic

Rem mTrnDtlICode_lng = AutoNumber
.fields(mTrnDtlCodeField) = mTrnCode_lng
.fields(mTrnDtlSnoField) = mTrnDtlSno_int
.fields(mTrnDtlDateField) = mTrnDate_dt
Rem .fields(mTrnDtlCmpCodeField) = mTrnCmpCode_int
.fields(mTrnDtlRecStateField) = ChkEditRecStatus(.fields(mTrnDtlRecStateField))

If blnOutdRcptTran = True Then
    .fields("OrcPttCode") = mOrcPttCode_lng
    .fields("OrcSrvCode") = mOrcSrvCode_lng
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
    
ElseIf blnOutdBillTran = True Then
    .fields("OblPttCode") = mOblPttCode_lng
    .fields("OblSrvCode") = mOblSrvCode_dbl
    .fields("OblUnit") = mOblUnit_dbl
    .fields("OblRate") = mOblRate_dbl
    .fields("OblAmtBefDisc") = mOblAmtBefDisc_dbl
    .fields("OblDiscPer") = mOblDiscPer_dbl
    .fields("OblDiscAmt") = mOblDiscAmt_dbl
    .fields("OblAmtAftDisc") = mOblAmtAftDisc_dbl
    .fields("OblDepoAmt") = mOblDepoAmt_dbl
    .fields("OblRefuAmt") = mOblRefuAmt_dbl
    .fields("OblBalAmt") = mOblBalAmt_dbl
    .fields("OblRemark") = mOblRemark_str
    
ElseIf blnOutdBlPymtTran = True Then
    mObpyObhCode = .fields("ObpyObhCode")
    mObpyDepoAmt = .fields("ObpyDepoAmt")
    
    .fields("ObpyPttCode") = mObpyPttCode_lng
    .fields("ObpyObhCode") = mObpyObhCode_lng
    .fields("ObpyDepoAmt") = mObpyDepoAmt_dbl
    .fields("ObpyRemark") = mObpyRemark_str
    
ElseIf blnOutdBlRefdTran = True Then
    mObfdObhCode = .fields("ObfdObhCode")
    mObfdRefuAmt = .fields("ObfdRefuAmt")
    
    .fields("ObfdPttCode") = mObfdPttCode_lng
    .fields("ObfdObhCode") = mObfdObhCode_lng
    .fields("ObfdRefuAmt") = mObfdRefuAmt_dbl
    .fields("ObfdRemark") = mObfdRemark_str
    
Else
    ErrorBox "clsHmsOpdMultiTranEntry_UpdateDtl_#966_[Undefined Case]"
End If
.Update

If blnOutdPymtTran = True Then
    If mOpyOhrCode <> .fields("OpyOhrCode") Then
        DispersePropRcptDepoAmt mOpyOhrCode, (mOpyDepoAmt * -1)                 ' removing deposit amount for old receipt
        DispersePropRcptDepoAmt .fields("OpyOhrCode"), .fields("OpyDepoAmt")    ' adding deposit amount to new receipt
    ElseIf mOpyDepoAmt <> .fields("OpyDepoAmt") Then
        mOpyDepoAmt = .fields("OpyDepoAmt") - mOpyDepoAmt
        DispersePropRcptDepoAmt mOpyOhrCode, mOpyDepoAmt
    End If
    
ElseIf blnOutdRefdTran = True Then
    If mOfdOhrCode <> .fields("OfdOhrCode") Then
        DispersePropRcptRefuAmt mOfdOhrCode, (mOfdRefuAmt * -1)                 ' removing refund amount for old receipt
        DispersePropRcptRefuAmt .fields("OfdOhrCode"), .fields("OfdRefuAmt")    ' adding refund amount to new receipt
    ElseIf mOfdRefuAmt <> .fields("OfdRefuAmt") Then
        mOfdRefuAmt = .fields("OfdRefuAmt") - mOfdRefuAmt
        DispersePropRcptRefuAmt mOfdOhrCode, mOfdRefuAmt
    End If

ElseIf blnOutdBlPymtTran = True Then
    If mObpyObhCode <> .fields("ObpyObhCode") Then
        DispersePropBillDepoAmt mObpyObhCode, (mObpyDepoAmt * -1)                 ' removing deposit amount for old receipt
        DispersePropBillDepoAmt .fields("ObpyObhCode"), .fields("ObpyDepoAmt")    ' adding deposit amount to new receipt
    ElseIf mObpyDepoAmt <> .fields("ObpyDepoAmt") Then
        mObpyDepoAmt = .fields("ObpyDepoAmt") - mObpyDepoAmt
        DispersePropBillDepoAmt mObpyObhCode, mObpyDepoAmt
    End If
    
ElseIf blnOutdBlRefdTran = True Then
    If mObfdObhCode <> .fields("ObfdObhCode") Then
        DispersePropBillRefuAmt mObfdObhCode, (mObfdRefuAmt * -1)                 ' removing refund amount for old receipt
        DispersePropBillRefuAmt .fields("ObfdObhCode"), .fields("ObfdRefuAmt")    ' adding refund amount to new receipt
    ElseIf mObfdRefuAmt <> .fields("ObfdRefuAmt") Then
        mObfdRefuAmt = .fields("ObfdRefuAmt") - mObfdRefuAmt
        DispersePropBillRefuAmt mObfdObhCode, mObfdRefuAmt
    End If

End If
End With
CloseTable tRecset
m_dbHmsDatabase.CommitTrans

Rem service doctor detail service change updation if any
If blnOutdRcptTran = True Or blnOutdBillTran = True Then
    m_dbHmsDatabase.BeginTrans
    With tRecset
    .Open "Select * from " & mTrnSdcTableName & " where " & mTrnSdcCodeField & "=" & CStr(mTrnCode) & " and " & mTrnSdcSubCodeField & "=" & CStr(mTrnICode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
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
    ErrorBox "clsHmsOpdMultiTranEntry_DeleteDtl_#995_[InActive " & mTitleName & " Entry]"
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
    .Open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " and " & mTrnDtlICodeField & "=" & CStr(mTrnICode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
    
    .fields(mTrnDtlRecStateField) = ChkDeleteRecStatus(.fields(mTrnDtlRecStateField))
    .Update
    End With
    If blnOutdPymtTran = True Then
        DispersePropRcptDepoAmt tRecset.fields("OpyOhrCode"), (tRecset.fields("OpyDepoAmt") * -1)
    ElseIf blnOutdRefdTran = True Then
        DispersePropRcptRefuAmt tRecset.fields("OfdOhrCode"), (tRecset.fields("OfdRefuAmt") * -1)
    ElseIf blnOutdBlPymtTran = True Then
        DispersePropBillDepoAmt tRecset.fields("ObpyObhCode"), (tRecset.fields("ObpyDepoAmt") * -1)
    ElseIf blnOutdBlRefdTran = True Then
        DispersePropBillRefuAmt tRecset.fields("ObfdObhCode"), (tRecset.fields("ObfdRefuAmt") * -1)
    End If
    CloseTable tRecset
    m_dbHmsDatabase.CommitTrans
    
    Rem service doctor detail deletion
    If blnOutdRcptTran = True Or blnOutdBillTran = True Then
        m_dbHmsDatabase.BeginTrans
        With tRecset
        .Open "Select * from " & mTrnSdcTableName & " where " & mTrnSdcCodeField & "=" & CStr(mTrnCode) & " and " & mTrnSdcSubCodeField & "=" & CStr(mTrnICode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
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
    ErrorBox "clsHmsOpdMultiTranEntry_DeleteSdc_#2312_[InActive " & mTitleName & " Entry]"
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

Rem proportionate dispersement is the best method
Private Sub DisperseFifoRcptDepoAmt(ByVal mOpyOhrCode As Long, ByVal mOpyDepoAmt_diff As Double)
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

Private Sub DispersePropRcptDepoAmt(ByVal mOpyOhrCode As Long, ByVal mOpyDepoAmt_diff As Double)
Dim tRecset As New ADODB.Recordset, mOpyDepoAmtTot As Double, mPropDepoAmt As Variant, mAmtAftDiscTot As Double, mOpyDepoAmtBal As Double, mOpyDepoAmtAdjusted As Double

On Error GoTo errhand

mOpyDepoAmtTot = mOpyDepoAmt_diff
mOpyDepoAmtBal = mOpyDepoAmt_diff
mOpyDepoAmtAdjusted = 0
mAmtAftDiscTot = 0
mOpyDepoAmtAdjusted = 0

With tRecset
.Open "Select * from OutdHdr where OhrCode=" & CStr(mOpyOhrCode), m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
mAmtAftDiscTot = .fields("OhrAmtAftDisc")
End With
CloseTable tRecset

With tRecset
.Open "Select * from OutdRcpt where OrcCode=" & CStr(mOpyOhrCode) & " order by OrcSno", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 And mOpyDepoAmtTot <> 0 Then
    m_dbHmsDatabase.BeginTrans
    Do While .EOF = False
        If InList(.fields("OrcRecState"), Array(cREC_UNCHANGED)) = True Then
            mPropDepoAmt = Round(CDec(mOpyDepoAmtTot) * CDec(.fields("OrcAmtAftDisc")) / CDec(mAmtAftDiscTot), 2)
            
            .fields("OrcDepoAmt") = .fields("OrcDepoAmt") + mPropDepoAmt
            .fields("OrcBalAmt") = .fields("OrcBalAmt") - mPropDepoAmt
            .Update
            
            mOpyDepoAmtBal = mOpyDepoAmtBal - mPropDepoAmt
            mOpyDepoAmtAdjusted = mOpyDepoAmtAdjusted + mPropDepoAmt
        Else
            If InList(.fields("OrcRecState"), Array(cREC_CANCELED, cREC_DELETED)) = False Then
                ErrorBox "clsHmsOpdMultiTranEntry_DispersePropRcptDepoAmt_#1540_[Invalid Record Status]"
            End If
        End If
        
        .MoveNext
    Loop
    If mOpyDepoAmtBal <> 0 And mOpyDepoAmtBal <> mOpyDepoAmtTot Then
        .MovePrevious
        
        mPropDepoAmt = mOpyDepoAmtBal
        .fields("OrcDepoAmt") = .fields("OrcDepoAmt") + mPropDepoAmt
        .fields("OrcBalAmt") = .fields("OrcBalAmt") - mPropDepoAmt
        .Update
                
        mOpyDepoAmtBal = mOpyDepoAmtBal - mPropDepoAmt
        mOpyDepoAmtAdjusted = mOpyDepoAmtAdjusted + mPropDepoAmt
    End If
    m_dbHmsDatabase.CommitTrans
End If
End With
CloseTable tRecset

m_dbHmsDatabase.BeginTrans
With tRecset
.Open "Select * from OutdHdr where OhrCode=" & CStr(mOpyOhrCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
.fields("OhrDepoAmt") = .fields("OhrDepoAmt") + mOpyDepoAmtAdjusted
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

Private Sub DisperseFifoRcptRefuAmt(ByVal mOfdOhrCode As Long, ByVal mOfdRefuAmt_diff As Double)
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

Private Sub DispersePropRcptRefuAmt(ByVal mOfdOhrCode As Long, ByVal mOfdRefuAmt_diff As Double)
Dim tRecset As New ADODB.Recordset, mOfdRefuAmtTot As Double, mPropRefuAmt As Variant, mOfdRefuAmtBal As Double, mOfdAmtAftDiscTot As Double, mOfdRefuAmtAdjusted As Double

On Error GoTo errhand

mOfdRefuAmtBal = mOfdRefuAmt_diff
mOfdRefuAmtTot = mOfdRefuAmt_diff
mOfdRefuAmtAdjusted = 0
mOfdAmtAftDiscTot = 0

With tRecset
.Open "Select * from OutdHdr where OhrCode=" & CStr(mOfdOhrCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
mOfdAmtAftDiscTot = .fields("OhrAmtAftDisc")
End With
CloseTable tRecset

With tRecset
.Open "Select * from OutdRcpt where OrcCode=" & CStr(mOfdOhrCode) & " order by OrcSno", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 And mOfdRefuAmtTot <> 0 Then
    m_dbHmsDatabase.BeginTrans
    Do While .EOF = False
        mPropRefuAmt = Round(CDec(mOfdRefuAmtTot) * CDec(.fields("OrcAmtAftDisc")) / CDec(mOfdAmtAftDiscTot), 2)
        
        .fields("OrcRefuAmt") = .fields("OrcRefuAmt") + mPropRefuAmt
        Rem .fields("OrcBalAmt") = .fields("OrcBalAmt") - mPropRefuAmt
        .Update
        
        mOfdRefuAmtBal = mOfdRefuAmtBal - mPropRefuAmt
        mOfdRefuAmtAdjusted = mOfdRefuAmtAdjusted + mPropRefuAmt
        
        .MoveNext
    Loop
    If mOfdRefuAmtBal <> 0 And mOfdRefuAmtBal <> mOfdRefuAmtTot Then
        .MovePrevious
        
        mPropRefuAmt = mOfdRefuAmtBal
        
        .fields("OrcRefuAmt") = .fields("OrcRefuAmt") + mPropRefuAmt
        Rem .fields("OrcBalAmt") = .fields("OrcBalAmt") - mPropRefuAmt
        .Update
        
        mOfdRefuAmtBal = mOfdRefuAmtBal - mPropRefuAmt
        mOfdRefuAmtAdjusted = mOfdRefuAmtAdjusted + mPropRefuAmt
    End If
    m_dbHmsDatabase.CommitTrans
End If
End With
CloseTable tRecset

m_dbHmsDatabase.BeginTrans
With tRecset
.Open "Select * from OutdHdr where OhrCode=" & CStr(mOfdOhrCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
.fields("OhrRefuAmt") = .fields("OhrRefuAmt") + mOfdRefuAmtAdjusted
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

Rem proportionate dispersement is the best method
Private Sub DisperseFifoBillDepoAmt(ByVal mObpyObhCode As Long, ByVal mObpyDepoAmt_diff As Double)
Dim tRecset As New ADODB.Recordset, mObpyDepoAmtTot As Double, mReqdDepoAmt As Double

On Error GoTo errhand

m_dbHmsDatabase.BeginTrans
mObpyDepoAmtTot = 0
With tRecset
.Open "Select * from OutdBill where OblCode=" & CStr(mObpyObhCode) & " order by OblSno" & IIf(mObpyDepoAmt_diff < 0, " desc", ""), m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 And mObpyDepoAmt_diff <> 0 Then
    Do While .EOF = False
        If mObpyDepoAmt_diff > 0 Then
            mReqdDepoAmt = .fields("OblAmtAftDisc") - (.fields("OblDepoAmt") + .fields("OblRefuAmt"))
            If mReqdDepoAmt > 0 Then
                If Not mObpyDepoAmt_diff >= mReqdDepoAmt Then
                    mReqdDepoAmt = mObpyDepoAmt_diff
                End If
                .fields("OblDepoAmt") = .fields("OblDepoAmt") + mReqdDepoAmt
                .fields("OblBalAmt") = .fields("OblBalAmt") - mReqdDepoAmt
                .Update
                
                mObpyDepoAmt_diff = mObpyDepoAmt_diff - mReqdDepoAmt
            End If
        ElseIf mObpyDepoAmt_diff < 0 Then
            mReqdDepoAmt = .fields("OblDepoAmt")
            If mReqdDepoAmt > 0 Then
                If Not Abs(mObpyDepoAmt_diff) >= mReqdDepoAmt Then
                    mReqdDepoAmt = Abs(mObpyDepoAmt_diff)
                End If
                .fields("OblDepoAmt") = .fields("OblDepoAmt") - mReqdDepoAmt
                .fields("OblBalAmt") = .fields("OblBalAmt") + mReqdDepoAmt
                .Update
                
                mObpyDepoAmt_diff = mObpyDepoAmt_diff + mReqdDepoAmt
            End If
        ElseIf mObpyDepoAmt_diff = 0 Then
            Exit Do
        End If
        mObpyDepoAmtTot = mObpyDepoAmtTot + .fields("OblDepoAmt")
        
        .MoveNext
    Loop
End If
End With
m_dbHmsDatabase.CommitTrans
CloseTable tRecset

m_dbHmsDatabase.BeginTrans
With tRecset
.Open "Select * from OutdBlHdr where ObhCode=" & CStr(mObpyObhCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
.fields("ObhDepoAmt") = mObpyDepoAmtTot
.fields("ObhBalAmt") = .fields("ObhAmtAftDisc") - (.fields("ObhDepoAmt"))
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

Private Sub DispersePropBillDepoAmt(ByVal mObpyObhCode As Long, ByVal mObpyDepoAmt_diff As Double)
Dim tRecset As New ADODB.Recordset, mObpyDepoAmtTot As Double, mPropDepoAmt As Variant, mAmtAftDiscTot As Double, mObpyDepoAmtBal As Double, mObpyDepoAmtAdjusted As Double

On Error GoTo errhand

mObpyDepoAmtTot = mObpyDepoAmt_diff
mObpyDepoAmtBal = mObpyDepoAmt_diff
mObpyDepoAmtAdjusted = 0
mAmtAftDiscTot = 0
mObpyDepoAmtAdjusted = 0

With tRecset
.Open "Select * from OutdBlHdr where ObhCode=" & CStr(mObpyObhCode), m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
mAmtAftDiscTot = .fields("ObhAmtAftDisc")
End With
CloseTable tRecset

With tRecset
.Open "Select * from OutdBill where OblCode=" & CStr(mObpyObhCode) & " order by OblSno", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 And mObpyDepoAmtTot <> 0 Then
    m_dbHmsDatabase.BeginTrans
    Do While .EOF = False
        If InList(.fields("OblRecState"), Array(cREC_UNCHANGED)) = True Then
            mPropDepoAmt = Round(CDec(mObpyDepoAmtTot) * CDec(.fields("OblAmtAftDisc")) / CDec(mAmtAftDiscTot), 2)
            
            .fields("OblDepoAmt") = .fields("OblDepoAmt") + mPropDepoAmt
            .fields("OblBalAmt") = .fields("OblBalAmt") - mPropDepoAmt
            .Update
            
            mObpyDepoAmtBal = mObpyDepoAmtBal - mPropDepoAmt
            mObpyDepoAmtAdjusted = mObpyDepoAmtAdjusted + mPropDepoAmt
        Else
            If InList(.fields("OblRecState"), Array(cREC_CANCELED, cREC_DELETED)) = False Then
                ErrorBox "clsHmsOpdMultiTranEntry_DispersePropBillDepoAmt_#1540_[Invalid Record Status]"
            End If
        End If
        
        .MoveNext
    Loop
    If mObpyDepoAmtBal <> 0 And mObpyDepoAmtBal <> mObpyDepoAmtTot Then
        .MovePrevious
        
        mPropDepoAmt = mObpyDepoAmtBal
        .fields("OblDepoAmt") = .fields("OblDepoAmt") + mPropDepoAmt
        .fields("OblBalAmt") = .fields("OblBalAmt") - mPropDepoAmt
        .Update
                
        mObpyDepoAmtBal = mObpyDepoAmtBal - mPropDepoAmt
        mObpyDepoAmtAdjusted = mObpyDepoAmtAdjusted + mPropDepoAmt
    End If
    m_dbHmsDatabase.CommitTrans
End If
End With
CloseTable tRecset

m_dbHmsDatabase.BeginTrans
With tRecset
.Open "Select * from OutdBlHdr where ObhCode=" & CStr(mObpyObhCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
.fields("ObhDepoAmt") = .fields("ObhDepoAmt") + mObpyDepoAmtAdjusted
.fields("ObhBalAmt") = .fields("ObhAmtAftDisc") - (.fields("ObhDepoAmt"))
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

Private Sub DisperseFifoBillRefuAmt(ByVal mObfdObhCode As Long, ByVal mObfdRefuAmt_diff As Double)
Dim tRecset As New ADODB.Recordset, mObfdRefuAmtTot As Double, mReqdRefuAmt As Double

On Error GoTo errhand

m_dbHmsDatabase.BeginTrans
mObfdRefuAmtTot = 0
With tRecset
.Open "Select * from OutdBill where OblCode=" & CStr(mObfdObhCode) & " order by OblSno" & IIf(mObfdRefuAmt_diff < 0, " desc", ""), m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 And mObfdRefuAmt_diff <> 0 Then
    Do While .EOF = False
        If mObfdRefuAmt_diff > 0 Then
            mReqdRefuAmt = (.fields("OblDepoAmt")) - .fields("OblRefuAmt")
            If mReqdRefuAmt > 0 Then
                If Not mObfdRefuAmt_diff >= mReqdRefuAmt Then
                    mReqdRefuAmt = mObfdRefuAmt_diff
                End If
                .fields("OblRefuAmt") = .fields("OblRefuAmt") + mReqdRefuAmt
                .fields("OblBalAmt") = .fields("OblBalAmt") + mReqdRefuAmt
                .Update
                
                mObfdRefuAmt_diff = mObfdRefuAmt_diff - mReqdRefuAmt
            End If
        ElseIf mObfdRefuAmt_diff < 0 Then
            mReqdRefuAmt = .fields("OblRefuAmt")
            If mReqdRefuAmt > 0 Then
                If Not Abs(mObfdRefuAmt_diff) >= mReqdRefuAmt Then
                    mReqdRefuAmt = Abs(mObfdRefuAmt_diff)
                End If
                .fields("OblRefuAmt") = .fields("OblRefuAmt") - mReqdRefuAmt
                .fields("OblBalAmt") = .fields("OblBalAmt") - mReqdRefuAmt
                .Update
                
                mObfdRefuAmt_diff = mObfdRefuAmt_diff + mReqdRefuAmt
            End If
        ElseIf mObfdRefuAmt_diff = 0 Then
            Exit Do
        End If
        mObfdRefuAmtTot = mObfdRefuAmtTot + .fields("OblRefuAmt")
        
        .MoveNext
    Loop
End If
End With
m_dbHmsDatabase.CommitTrans
CloseTable tRecset

m_dbHmsDatabase.BeginTrans
With tRecset
.Open "Select * from OutdBlHdr where ObhCode=" & CStr(mObfdObhCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
.fields("ObhRefuAmt") = mObfdRefuAmtTot
.fields("ObhBalAmt") = .fields("ObhAmtAftDisc") - (.fields("ObhDepoAmt"))
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

Private Sub DispersePropBillRefuAmt(ByVal mObfdObhCode As Long, ByVal mObfdRefuAmt_diff As Double)
Dim tRecset As New ADODB.Recordset, mObfdRefuAmtTot As Double, mPropRefuAmt As Variant, mObfdRefuAmtBal As Double, mObfdAmtAftDiscTot As Double, mObfdRefuAmtAdjusted As Double

On Error GoTo errhand

mObfdRefuAmtBal = mObfdRefuAmt_diff
mObfdRefuAmtTot = mObfdRefuAmt_diff
mObfdRefuAmtAdjusted = 0
mObfdAmtAftDiscTot = 0

With tRecset
.Open "Select * from OutdBlHdr where ObhCode=" & CStr(mObfdObhCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
mObfdAmtAftDiscTot = .fields("ObhAmtAftDisc")
End With
CloseTable tRecset

With tRecset
.Open "Select * from OutdBill where OblCode=" & CStr(mObfdObhCode) & " order by OblSno", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 And mObfdRefuAmtTot <> 0 Then
    m_dbHmsDatabase.BeginTrans
    Do While .EOF = False
        mPropRefuAmt = Round(CDec(mObfdRefuAmtTot) * CDec(.fields("OblAmtAftDisc")) / CDec(mObfdAmtAftDiscTot), 2)
        
        .fields("OblRefuAmt") = .fields("OblRefuAmt") + mPropRefuAmt
        Rem .fields("OblBalAmt") = .fields("OblBalAmt") - mPropRefuAmt
        .Update
        
        mObfdRefuAmtBal = mObfdRefuAmtBal - mPropRefuAmt
        mObfdRefuAmtAdjusted = mObfdRefuAmtAdjusted + mPropRefuAmt
        
        .MoveNext
    Loop
    If mObfdRefuAmtBal <> 0 And mObfdRefuAmtBal <> mObfdRefuAmtTot Then
        .MovePrevious
        
        mPropRefuAmt = mObfdRefuAmtBal
        
        .fields("OblRefuAmt") = .fields("OblRefuAmt") + mPropRefuAmt
        Rem .fields("OblBalAmt") = .fields("OblBalAmt") - mPropRefuAmt
        .Update
        
        mObfdRefuAmtBal = mObfdRefuAmtBal - mPropRefuAmt
        mObfdRefuAmtAdjusted = mObfdRefuAmtAdjusted + mPropRefuAmt
    End If
    m_dbHmsDatabase.CommitTrans
End If
End With
CloseTable tRecset

m_dbHmsDatabase.BeginTrans
With tRecset
.Open "Select * from OutdBlHdr where ObhCode=" & CStr(mObfdObhCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
.fields("ObhRefuAmt") = .fields("ObhRefuAmt") + mObfdRefuAmtAdjusted
.fields("ObhBalAmt") = .fields("ObhAmtAftDisc") - (.fields("ObhDepoAmt"))
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
    ErrorBox "clsHmsOpdMultiTranEntry_Data_CreateLog_#406_[InActive " & mTitleName & " Entry]"
    GoTo EndSub
End If

t1Recset.Open "Select * from " & mTrnDtlTableName & "_Log where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnDtlICodeField & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
t2Recset.Open "Select * from " & mTrnHdrTableName & "_Log where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
If blnOutdRcptTran = True Or blnOutdBillTran = True Then
    t3Recset.Open "Select * from " & mTrnSdcTableName & "_Log where " & mTrnSdcCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnSdcICodeField & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
End If
If t1Recset.RecordCount = 0 Then
    m_dbHmsDatabase.BeginTrans
    m_dbHmsDatabase.Execute "Insert into " & mTrnDtlTableName & "_Log Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " and " & mTrnDtlRecStateField & "=" & CStr(cREC_UNCHANGED) & ""
    m_dbHmsDatabase.CommitTrans
Else
    AlertBox "clsHmsOpdMultiTranEntry_Data_CreateLog_#2976_[Unsaved " & mTitleName & " Entry]"
End If

If t2Recset.RecordCount = 0 Then
    m_dbHmsDatabase.BeginTrans
    m_dbHmsDatabase.Execute "Insert into " & mTrnHdrTableName & "_Log Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & " and " & mTrnHdrRecStateField & "=" & CStr(cREC_UNCHANGED) & ""
    m_dbHmsDatabase.CommitTrans
Else
    AlertBox "clsHmsOpdMultiTranEntry_Data_CreateLog_#2984_[Unsaved " & mTitleName & " Entry]"
End If

If blnOutdRcptTran = True Or blnOutdBillTran = True Then
    If t3Recset.RecordCount = 0 Then
        m_dbHmsDatabase.BeginTrans
        m_dbHmsDatabase.Execute "Insert into " & mTrnSdcTableName & "_Log Select * from " & mTrnSdcTableName & " where " & mTrnSdcCodeField & "=" & CStr(mTrnCode) & " and " & mTrnSdcRecStateField & "=" & CStr(cREC_UNCHANGED) & ""
        m_dbHmsDatabase.CommitTrans
    Else
        AlertBox "clsHmsOpdMultiTranEntry_Data_CreateLog_#2993_[Unsaved " & mTitleName & " Entry]"
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
    ErrorBox "clsHmsOpdMultiTranEntry_Data_RemoveLog_#1041_[InActive " & mTitleName & " Entry]"
    Exit Function
End If

m_dbHmsDatabase.BeginTrans
m_dbHmsDatabase.Execute "Delete from " & mTrnDtlTableName & "_Log where " & mTrnDtlCodeField & "=" & CStr(mTrnCode)
m_dbHmsDatabase.Execute "Delete from " & mTrnHdrTableName & "_Log where " & mTrnHdrCodeField & "=" & CStr(mTrnCode)
If blnOutdRcptTran = True Or blnOutdBillTran = True Then
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
    .Open "Select OpyOhrCode,sum(OpyDepoAmt) as OpyDepoAmt_sum from OutdPymtDtl dtl inner join OutdPymtHdr hdr on dtl.OpyCode=hdr.OphCode where OpyCode=" & CStr(mTrnCode) & " group by OpyOhrCode", m_dbHmsDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        Do While .EOF = False And ChkEntryExist = False
            mOpyOhrCode = .fields("OpyOhrCode")
            mOpyDepoAmt = .fields("OpyDepoAmt_sum")
            
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
    
ElseIf blnOutdBillTran = True Then
    With tRecset
    .Open "Select * from OutdBlPymtDtl dtl inner join OutdBlPymtHdr hdr on dtl.ObpyCode=hdr.ObphCode where ObpyObhCode=" & CStr(mTrnCode) & " order by ObpyDate desc,ObphVchNo desc", m_dbHmsDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        AlertBox "Outdoor Bill Payment No." & CStr(.fields("ObphVchNo")) & " Dated " & Dtoc(.fields("ObphDate")) & " !!!"
        ChkEntryExist = True
    End If
    End With
    CloseTable tRecset
    
    If ChkEntryExist = False Then
        With tRecset
        .Open "Select * from OutdBlRefdDtl dtl inner join OutdBlRefdHdr hdr on dtl.ObfdCode=hdr.ObfhCode where ObfdObhCode=" & CStr(mTrnCode) & " order by ObfdDate desc,ObfhVchNo desc", m_dbHmsDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            AlertBox "Outdoor Bill Refund No." & CStr(.fields("ObfhVchNo")) & " Dated " & Dtoc(.fields("ObfhDate")) & " !!!"
            ChkEntryExist = True
        End If
        End With
        CloseTable tRecset
    End If

ElseIf blnOutdBlPymtTran = True Then
    Dim mObpyDepoAmt As Double, mObpyObhCode As Long
    With tRecset
    .Open "Select ObpyObhCode,sum(ObpyDepoAmt) as ObpyDepoAmt_sum from OutdBlPymtDtl dtl inner join OutdBlPymtHdr hdr on dtl.ObpyCode=hdr.ObphCode where ObpyCode=" & CStr(mTrnCode) & " group by ObpyObhCode", m_dbHmsDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        Do While .EOF = False And ChkEntryExist = False
            mObpyObhCode = .fields("ObpyObhCode")
            mObpyDepoAmt = .fields("ObpyDepoAmt_sum")
            
            With t1Recset
            .Open "Select * from OutdBlHdr hdr inner join VTypMast vtm on hdr.ObhVtmCode=vtm.VtmCode where ObhCode=" & CStr(mObpyObhCode) & "", m_dbComDatabase, adOpenKeyset, adLockReadOnly
            If .RecordCount > 0 Then
                If .fields("ObhRefuAmt") > (.fields("ObhDepoAmt") - mObpyDepoAmt) Then
                    ErrorBox "Excess Amount Refunded for Bill No." & .fields("VtmName") & "-" & CStr(.fields("ObhVchNo")) & " Dated " & Dtoc(.fields("ObhDate")) & " !!!"
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
    
ElseIf blnOutdBlRefdTran = True Then
    Rem does not affect transaction for any negative balance

Else
    ErrorBox "Checking Under Process !!!"

End If

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Function


End Function

