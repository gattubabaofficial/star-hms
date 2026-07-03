VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsHmsIpdMultiTranEntry"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False

Option Explicit

Dim m_dbBdkDatabase As ADODB.Connection, m_dbAcDatabase As ADODB.Connection, m_dbComDatabase As ADODB.Connection
Dim mClassUIdCode As Long, mClassUIdFileName As String, mClassAcsPermFileName As String, mClassDtlUIdFileName As String, mClassDtlAcsPermFileName As String
Dim mTrnHdrTableName As String, mTrnDtlTableName As String, mTrnHdrCodeField As String, mTrnDtlCodeField As String, mTrnHdrDateField As String, mTrnDtlDateField As String, mTrnVtmField As String, mTrnPrefixField As String, mTrnVchNoField As String, mTrnPostfixField As String, mTrnDtlICodeField As String, mTrnDtlSnoField As String, mTrnHdrRecStateField As String, mTrnDtlRecStateField As String, mTrnHdrCmpCodeField As String, mTrnDtlCmpCodeField As String, mTitleName As String
Dim mTrnSdcTableName As String, mTrnSdcCodeField As String, mTrnSdcSubCodeField As String, mTrnSdcICodeField As String, mTrnSdcSnoField As String, mTrnSdcDateField As String, mTrnSdcPttCodeField As String, mTrnSdcSrvCodeField As String, mTrnSdcDctCodeField As String, mTrnSdcDrlCodeField As String, mTrnSdcRemarkField As String, mTrnSdcRecStateField As String, mTrnSdcCmpCodeField As String
Public blnIndrRcptTran As Boolean, blnIndrPymtTran As Boolean, blnIndrRefdTran As Boolean, blnIndrBillTran As Boolean, blnIndrBlPymtTran As Boolean, blnIndrBlRefdTran As Boolean
Rem common class variables used in both header and detail
Public mTrnCode_lng As Long, mTrnVtmCode_lng As Long, mTrnPrefix_str As String, mTrnVchNo_lng As Long, mTrnPostfix_str As String, mTrnDate_dt As Date, mTrnCmpCode_int As Integer
Rem common class header variables
Public mTrnHdrRecState_int As Integer
Rem common class detail variables
Public mTrnDtlICode_lng As Long, mTrnDtlSno_int As Integer, mTrnDtlRecState_int As Integer
Rem service doctor detail variables
Public mSdcCode_lng As Long, mSdcSubCode_lng As Long, mSdcICode_lng As Long, mSdcSno_int As Integer, mSdcDate_dt As Date, mSdcPttCode_lng As Long, mSdcSrvCode_lng As Long, mSdcDctCode_lng As Long, mSdcDrlCode_lng As Long, mSdcRemark_str As String, mSdcRecState_int As Integer, mSdcCmpCode_int As Long
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
Rem Indoor bill header variables
Public mIbhIpgCode_lng As Long, mIbhPttCode_lng As Long, mIbhTime_lng As Long, mIbhOldIbhCode_lng As Long, mIbhPttDiscPer_dbl As Long, mIbhAmtBefDisc_dbl As Double, mIbhDiscAmt_dbl As Double, mIbhAmtAftDisc_dbl As Double, mIbhAdvAmt_dbl As Double, mIbhDpogAmt_dbl As Double, mIbhDepoAmt_dbl As Double, mIbhRfugAmt_dbl As Double, mIbhRefuAmt_dbl As Double, mIbhBalAmt_dbl As Double, mIbhRemark_str As String
Rem Indoor bill detail variables
Public mIblSrvCode_dbl As Double, mIblIpgCode_lng As Long, mIblPttCode_lng As Long, mIblUnit_dbl As Double, mIblRate_dbl As Double, mIblAmtBefDisc_dbl As Double, mIblDiscPer_dbl As Double, mIblDiscAmt_dbl As Double, mIblAmtAftDisc_dbl As Double, mIblAdvAmt_dbl As Double, mIblDpogAmt_dbl As Double, mIblDepoAmt_dbl As Double, mIblRfugAmt_dbl As Double, mIblRefuAmt_dbl As Double, mIblBalAmt_dbl As Double, mIblRemark_str As String
Rem indoor bill bed status variables
Public mIbbsICode_lng As Long, mIbbsIbsCode_lng As Long, mIbbsIpgCode_lng As Long, mIbbsSno_int As Integer, mIbbsFromDate_dt As Date, mIbbsFromTime_lng As Long, mIbbsToDate_dt As Date, mIbbsToTime_lng As Long, mIbbsUnit_int As Integer, mIbbsRemark_str As String, mIbbsCmpCode_int As Integer, mIbbsRecState_int As Integer
Rem indoor ipd on a/c payment adjustment
Public mIbgdCode_lng As Long, mIbgdICode_lng As Long, mIbgdSno_int As Integer, mIbgdIgtCode_lng As Long, mIbgdDpogAmt_dbl As Double, mIbgdRemark_str As String, mIbgdCmpCode_int As Integer, mIbgdRecState_int As Integer
Rem indoor ipd on a/c refund adjustment
Public mIbgfCode_lng As Long, mIbgfICode_lng As Long, mIbgfSno_int As Integer, mIbgfIgfCode_lng As Long, mIbgfRfugAmt_dbl As Double, mIbgfRemark_str As String, mIbgfCmpCode_int As Integer, mIbgfRecState_int As Integer
Rem Indoor bill payment receipt header variables
Public mIbphIpgCode_lng As Long, mIbphTime_lng As Long, mIbphOldIbphCode_lng As Long, mIbphPttCode_lng As Long, mIbphDepoAmt_dbl As Double, mIbphRemark_str As String
Rem Indoor bill payment receipt detail variables
Public mIbpyPttCode_lng As Long, mIbpyIbhCode_lng As Long, mIbpyDepoAmt_dbl As Double, mIbpyRemark_str As String
Rem Indoor bill refund receipt header variables
Public mIbfhIpgCode_lng As Long, mIbfhTime_lng As Long, mIbfhOldIbfhCode_lng As Long, mIbfhPttCode_lng As Long, mIbfhRefuAmt_dbl As Double, mIbfhRemark_str As String
Rem Indoor bill refund receipt detail variables
Public mIbfdPttCode_lng As Long, mIbfdIbhCode_lng As Long, mIbfdRefuAmt_dbl As Double, mIbfdRemark_str As String

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
    mTrnDtlICodeField = "IrcICode"
    mTrnDtlSnoField = "IrcSno"
    mTitleName = "Indoor Receipt"
    Rem service doctor detail
    mTrnSdcTableName = "IndrRcDctDtl"
    mTrnSdcCodeField = "IrdCode"
    mTrnSdcSubCodeField = "IrdIrcCode"
    mTrnSdcICodeField = "IrdICode"
    mTrnSdcSnoField = "IrdSno"
    mTrnSdcDateField = "IrdDate"
    mTrnSdcPttCodeField = "IrdPttCode"
    mTrnSdcSrvCodeField = "IrdSrvCode"
    mTrnSdcDctCodeField = "IrdDctCode"
    mTrnSdcDrlCodeField = "IrdDrlCode"
    mTrnSdcRemarkField = "IrdRemark"
    mTrnSdcRecStateField = "IrdRecState"
    mTrnSdcCmpCodeField = "IrdCmpCode"
    ' -----------------
    
    Set clsPAT = New clsHmsMasterEntry
    Set clsPAT.dbBdkDatabase = m_dbBdkDatabase
    Set clsPAT.dbAcDatabase = m_dbAcDatabase
    clsPAT.blnPatMast = True
    clsPAT.Init
    
    Set clsSRV = New clsHmsMasterEntry
    Set clsSRV.dbBdkDatabase = m_dbBdkDatabase
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
    mTrnDtlICodeField = "IpyICode"
    mTrnDtlSnoField = "IpySno"
    mTitleName = "Indoor Due Payment"
    
    Set clsPAT = New clsHmsMasterEntry
    Set clsPAT.dbBdkDatabase = m_dbBdkDatabase
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
    mTrnDtlICodeField = "IfdICode"
    mTrnDtlSnoField = "IfdSno"
    mTitleName = "Indoor Refund"
    
    Set clsPAT = New clsHmsMasterEntry
    Set clsPAT.dbBdkDatabase = m_dbBdkDatabase
    Set clsPAT.dbAcDatabase = m_dbAcDatabase
    clsPAT.blnPatMast = True
    clsPAT.Init
    
ElseIf blnIndrBillTran = True Then
    mTrnHdrTableName = "IndrBlHdr": mTrnDtlTableName = "IndrBill"
    mTrnHdrCodeField = "IbhCode": mTrnDtlCodeField = "IblCode"
    mTrnHdrDateField = "IbhDate": mTrnDtlDateField = "IblDate"
    mTrnHdrRecStateField = "IbhRecState": mTrnDtlRecStateField = "IblRecState"
    mTrnHdrCmpCodeField = "IbhCmpCode": mTrnDtlCmpCodeField = "IblCmpCode"
    mTrnVtmField = "IbhVtmCode"
    mTrnPrefixField = "IbhPrefix"
    mTrnVchNoField = "IbhVchNo"
    mTrnPostfixField = "IbhPostfix"
    mTrnDtlICodeField = "IblICode"
    mTrnDtlSnoField = "IblSno"
    mTitleName = "Indoor Bill"
    Rem service doctor detail
    mTrnSdcTableName = "IndrBlDctDtl"
    mTrnSdcCodeField = "IbdCode"
    mTrnSdcSubCodeField = "IbdIblCode"
    mTrnSdcICodeField = "IbdICode"
    mTrnSdcSnoField = "IbdSno"
    mTrnSdcDateField = "IbdDate"
    mTrnSdcPttCodeField = "IbdPttCode"
    mTrnSdcSrvCodeField = "IbdSrvCode"
    mTrnSdcDctCodeField = "IbdDctCode"
    mTrnSdcDrlCodeField = "IbdDrlCode"
    mTrnSdcRemarkField = "IbdRemark"
    mTrnSdcRecStateField = "IbdRecState"
    mTrnSdcCmpCodeField = "IbdCmpCode"
    ' -----------------
    
    Set clsPAT = New clsHmsMasterEntry
    Set clsPAT.dbBdkDatabase = m_dbBdkDatabase
    Set clsPAT.dbAcDatabase = m_dbAcDatabase
    clsPAT.blnPatMast = True
    clsPAT.Init
    
    Set clsSRV = New clsHmsMasterEntry
    Set clsSRV.dbBdkDatabase = m_dbBdkDatabase
    Set clsSRV.dbAcDatabase = m_dbAcDatabase
    clsSRV.blnServMast = True
    clsSRV.Init
    
ElseIf blnIndrBlPymtTran = True Then
    mTrnHdrTableName = "IndrBlPymtHdr": mTrnDtlTableName = "IndrBlPymtDtl"
    mTrnHdrCodeField = "IbphCode": mTrnDtlCodeField = "IbpyCode"
    mTrnHdrDateField = "IbphDate": mTrnDtlDateField = "IbpyDate"
    mTrnHdrRecStateField = "IbphRecState": mTrnDtlRecStateField = "IbpyRecState"
    mTrnHdrCmpCodeField = "IbphCmpCode": mTrnDtlCmpCodeField = "IbpyCmpCode"
    mTrnVtmField = "IbphVtmCode"
    mTrnPrefixField = "IbphPrefix"
    mTrnVchNoField = "IbphVchNo"
    mTrnPostfixField = "IbphPostfix"
    mTrnDtlICodeField = "IbpyICode"
    mTrnDtlSnoField = "IbpySno"
    mTitleName = "Indoor Bill Payment"
    
    Set clsPAT = New clsHmsMasterEntry
    Set clsPAT.dbBdkDatabase = m_dbBdkDatabase
    Set clsPAT.dbAcDatabase = m_dbAcDatabase
    clsPAT.blnPatMast = True
    clsPAT.Init
    
ElseIf blnIndrBlRefdTran = True Then
    mTrnHdrTableName = "IndrBlRefdHdr": mTrnDtlTableName = "IndrBlRefdDtl"
    mTrnHdrCodeField = "IbfhCode": mTrnDtlCodeField = "IbfdCode"
    mTrnHdrDateField = "IbfhDate": mTrnDtlDateField = "IbfdDate"
    mTrnHdrRecStateField = "IbfhRecState": mTrnDtlRecStateField = "IbfdRecState"
    mTrnHdrCmpCodeField = "IbfhCmpCode": mTrnDtlCmpCodeField = "IbfdCmpCode"
    mTrnVtmField = "IbfhVtmCode"
    mTrnPrefixField = "IbfhPrefix"
    mTrnVchNoField = "IbfhVchNo"
    mTrnPostfixField = "IbfhPostfix"
    mTrnDtlICodeField = "IbfdICode"
    mTrnDtlSnoField = "IbfdSno"
    mTitleName = "Indoor Refund"
    
    Set clsPAT = New clsHmsMasterEntry
    Set clsPAT.dbBdkDatabase = m_dbBdkDatabase
    Set clsPAT.dbAcDatabase = m_dbAcDatabase
    clsPAT.blnPatMast = True
    clsPAT.Init
    
Else
    ErrorBox "clsHmsIpdMultiTranEntry_Init_#73_[Undefined Case]"
End If

End Sub

Public Property Set dbBdkDatabase(ByRef db As ADODB.Connection)
Set m_dbBdkDatabase = db


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

mClassUIdFileName = "clsHmsIpdMultiTrn.UId"
mClassAcsPermFileName = "clsHmsIpdMultiTrn.Acp"
mClassDtlUIdFileName = "clsHmsIpdMultiTrnDtl.UId"
mClassDtlAcsPermFileName = "clsHmsIpdMultiTrnDtl.Acp"

mClassUIdCode = GetUIdCode("clsHmsIpdMultiTranEntry_Initialize", mUIdFileName:=mClassUIdFileName, mAcsPermFileName:=mClassAcsPermFileName)

End Sub

Public Sub GetHdrData(ByVal mTrnCode As Long)
Dim tRecset As New ADODB.Recordset

Me.ClearHdr
With tRecset
.open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
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
        
    ElseIf blnIndrBillTran = True Then
        mIbhIpgCode_lng = .fields("IbhIpgCode")
        mIbhTime_lng = .fields("IbhTime")
        mIbhOldIbhCode_lng = .fields("IbhOldIbhCode")
        mIbhPttCode_lng = .fields("IbhPttCode")
        mIbhPttDiscPer_dbl = .fields("IbhPttDiscPer")
        mIbhAmtBefDisc_dbl = .fields("IbhAmtBefDisc")
        mIbhDiscAmt_dbl = .fields("IbhDiscAmt")
        mIbhAmtAftDisc_dbl = .fields("IbhAmtAftDisc")
        mIbhAdvAmt_dbl = .fields("IbhAdvAmt")
        mIbhDpogAmt_dbl = .fields("IbhDpogAmt")
        mIbhDepoAmt_dbl = .fields("IbhDepoAmt")
        mIbhRfugAmt_dbl = .fields("IbhRfugAmt")
        mIbhRefuAmt_dbl = .fields("IbhRefuAmt")
        mIbhBalAmt_dbl = .fields("IbhBalAmt")
        mIbhRemark_str = .fields("IbhRemark")
        
        clsPAT.GetData .fields("IbhPttCode")
        
    ElseIf blnIndrBlPymtTran = True Then
        mIbphIpgCode_lng = .fields("IbphIpgCode")
        mIbphTime_lng = .fields("IbphTime")
        mIbphOldIbphCode_lng = .fields("IbphOldIbphCode")
        mIbphPttCode_lng = .fields("IbphPttCode")
        mIbphDepoAmt_dbl = .fields("IbphDepoAmt")
        mIbphRemark_str = .fields("IbphRemark")
        
        clsPAT.GetData .fields("IbphPttCode")
    
    ElseIf blnIndrBlRefdTran = True Then
        mIbfhIpgCode_lng = .fields("IbfhIpgCode")
        mIbfhTime_lng = .fields("IbfhTime")
        mIbfhOldIbfhCode_lng = .fields("IbfhOldIbfhCode")
        mIbfhPttCode_lng = .fields("IbfhPttCode")
        mIbfhRefuAmt_dbl = .fields("IbfhRefuAmt")
        mIbfhRemark_str = .fields("IbfhRemark")
        
        clsPAT.GetData .fields("IbfhPttCode")
        
    Else
        ErrorBox "clsHmsIpdMultiTranEntry_GetHdrData_#133_[Undefined Case]"
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
    .open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " and " & mTrnDtlICodeField & "=" & CStr(mTrnICode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
Else
    .open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " and " & mTrnDtlSnoField & "=" & CStr(mTrnSno) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
End If
If .RecordCount > 0 Then
    mTrnCode_lng = .fields(mTrnDtlCodeField)
    mTrnDtlICode_lng = .fields(mTrnDtlICodeField)
    mTrnDtlSno_int = .fields(mTrnDtlSnoField)
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
        
    ElseIf blnIndrBillTran = True Then
        mIblIpgCode_lng = .fields("IblIpgCode")
        mIblPttCode_lng = .fields("IblPttCode")
        mIblSrvCode_dbl = .fields("IblSrvCode")
        mIblUnit_dbl = .fields("IblUnit")
        mIblRate_dbl = .fields("IblRate")
        mIblAmtBefDisc_dbl = .fields("IblAmtBefDisc")
        mIblDiscPer_dbl = .fields("IblDiscPer")
        mIblDiscAmt_dbl = .fields("IblDiscAmt")
        mIblAmtAftDisc_dbl = .fields("IblAmtAftDisc")
        mIblAdvAmt_dbl = .fields("IblAdvAmt")
        mIblDpogAmt_dbl = .fields("IblDpogAmt")
        mIblDepoAmt_dbl = .fields("IblDepoAmt")
        mIblRfugAmt_dbl = .fields("IblRfugAmt")
        mIblRefuAmt_dbl = .fields("IblRefuAmt")
        mIblBalAmt_dbl = .fields("IblBalAmt")
        mIblRemark_str = .fields("IblRemark")
        
        GetIbbsData mTrnCode, mTrnICode
        clsSRV.GetData .fields("IblSrvCode")
    
    ElseIf blnIndrBlPymtTran = True Then
        mIbpyPttCode_lng = .fields("IbpyPttCode")
        mIbpyIbhCode_lng = .fields("IbpyIbhCode")
        mIbpyDepoAmt_dbl = .fields("IbpyDepoAmt")
        mIbpyRemark_str = .fields("IbpyRemark")
        
    ElseIf blnIndrBlRefdTran = True Then
        mIbfdPttCode_lng = .fields("IbfdPttCode")
        mIbfdIbhCode_lng = .fields("IbfdIbhCode")
        mIbfdRefuAmt_dbl = .fields("IbfdRefuAmt")
        mIbfdRemark_str = .fields("IbfdRemark")
        
    Else
        ErrorBox "clsHmsIpdMultiTranEntry_GetDtlData_#173_[Undefined Case]"
    End If
End If
End With
CloseTable tRecset

End Sub

Public Sub GetSdcData(ByVal mSdcCode As Long, ByVal mSdcSubCode As Long, ByVal mSdcICode As Long)
Dim tRecset As New ADODB.Recordset, acount As Integer

Me.ClearSdc
With tRecset
.open "Select * from " & mTrnSdcTableName & " where " & mTrnSdcCodeField & "=" & CStr(mSdcCode) & " and " & mTrnSdcSubCodeField & "=" & CStr(mSdcSubCode) & " and " & mTrnSdcICodeField & "=" & CStr(mSdcICode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
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

Public Sub GetIbbsData(ByVal mTrnCode As Long, ByVal mTrnICode As Long)
Dim tRecset As New ADODB.Recordset, acount As Integer

Me.ClearIbbs
With tRecset
.open "Select * from IndrBlIbsDtl where IbbsCode=" & CStr(mTrnCode) & " and IbbsIblICode=" & CStr(mTrnICode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    mIbbsICode_lng = .fields("IbbsICode")
    mIbbsIbsCode_lng = .fields("IbbsIbsCode")
    mIbbsIpgCode_lng = .fields("IbbsIpgCode")
    mIbbsSno_int = .fields("IbbsSno")
    mIbbsFromDate_dt = .fields("IbbsFromDate")
    mIbbsFromTime_lng = .fields("IbbsFromTime")
    mIbbsToDate_dt = .fields("IbbsToDate")
    mIbbsToTime_lng = .fields("IbbsToTime")
    mIbbsUnit_int = .fields("IbbsUnit")
    mIbbsRemark_str = .fields("IbbsRemark")
    mIbbsCmpCode_int = .fields("IbbsCmpCode")
    mIbbsRecState_int = .fields("IbbsRecState")
End If
End With
CloseTable tRecset

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Sub

End Sub

Public Sub GetDpogData(ByVal mTrnCode As Long, ByVal mTrnICode As Long)
Dim tRecset As New ADODB.Recordset, acount As Integer

Me.ClearDpog
With tRecset
.open "Select * from IndrBlDpogDtl where IbgdCode=" & CStr(mTrnCode) & " and IbgdICode=" & CStr(mTrnICode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    mIbgdCode_lng = .fields("IbgdCode")
    mIbgdICode_lng = .fields("IbgdICode")
    mIbgdSno_int = .fields("IbgdSno")
    mIbgdIgtCode_lng = .fields("IbgdIgtCode")
    mIbgdDpogAmt_dbl = .fields("IbgdDpogAmt")
    mIbgdRemark_str = .fields("IbgdRemark")
    mIbgdCmpCode_int = .fields("IbgdCmpCode")
    mIbgdRecState_int = .fields("IbgdRecState")
End If
End With
CloseTable tRecset

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Sub

End Sub

Public Sub GetRfugData(ByVal mTrnCode As Long, ByVal mTrnICode As Long)
Dim tRecset As New ADODB.Recordset, acount As Integer

Me.ClearRfug
With tRecset
.open "Select * from IndrBlRfugDtl where IbgfCode=" & CStr(mTrnCode) & " and IbgfICode=" & CStr(mTrnICode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    mIbgfCode_lng = .fields("IbgfCode")
    mIbgfICode_lng = .fields("IbgfICode")
    mIbgfSno_int = .fields("IbgfSno")
    mIbgfIgfCode_lng = .fields("IbgfIgfCode")
    mIbgfRfugAmt_dbl = .fields("IbgfRfugAmt")
    mIbgfRemark_str = .fields("IbgfRemark")
    mIbgfCmpCode_int = .fields("IbgfCmpCode")
    mIbgfRecState_int = .fields("IbgfRecState")
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

ElseIf blnIndrBillTran = True Then
    mIbhIpgCode_lng = 0
    mIbhTime_lng = 0
    mIbhOldIbhCode_lng = 0
    mIbhPttCode_lng = 0
    mIbhPttDiscPer_dbl = 0
    mIbhAmtBefDisc_dbl = 0
    mIbhDiscAmt_dbl = 0
    mIbhAmtAftDisc_dbl = 0
    mIbhAdvAmt_dbl = 0
    mIbhDpogAmt_dbl = 0
    mIbhDepoAmt_dbl = 0
    mIbhRfugAmt_dbl = 0
    mIbhRefuAmt_dbl = 0
    mIbhBalAmt_dbl = 0
    mIbhRemark_str = ""
    
    clsPAT.Clear

ElseIf blnIndrBlPymtTran = True Then
    mIbphIpgCode_lng = 0
    mIbphTime_lng = 0
    mIbphOldIbphCode_lng = 0
    mIbphPttCode_lng = 0
    mIbphDepoAmt_dbl = 0
    mIbphRemark_str = ""
    
    clsPAT.Clear

ElseIf blnIndrBlRefdTran = True Then
    mIbfhIpgCode_lng = 0
    mIbfhTime_lng = 0
    mIbfhOldIbfhCode_lng = 0
    mIbfhPttCode_lng = 0
    mIbfhRefuAmt_dbl = 0
    mIbfhRemark_str = ""
    
    clsPAT.Clear

Else
    ErrorBox "clsHmsIpdMultiTranEntry_ClearHdr_#212_[Undefined Case]"
End If

End Sub

Public Sub ClearDtl()

mTrnCode_lng = 0
mTrnDtlICode_lng = 0
mTrnDtlSno_int = 0
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
    
ElseIf blnIndrBillTran = True Then
    mIblIpgCode_lng = 0
    mIblPttCode_lng = 0
    mIblSrvCode_dbl = 0
    mIblUnit_dbl = 0
    mIblRate_dbl = 0
    mIblAmtBefDisc_dbl = 0
    mIblDiscPer_dbl = 0
    mIblDiscAmt_dbl = 0
    mIblAmtAftDisc_dbl = 0
    mIblAdvAmt_dbl = 0
    mIblDpogAmt_dbl = 0
    mIblDepoAmt_dbl = 0
    mIblRfugAmt_dbl = 0
    mIblRefuAmt_dbl = 0
    mIblBalAmt_dbl = 0
    mIblRemark_str = ""
    
    Call ClearIbbs
    clsSRV.Clear

ElseIf blnIndrBlPymtTran = True Then
    mIbpyPttCode_lng = 0
    mIbpyIbhCode_lng = 0
    mIbpyDepoAmt_dbl = 0
    mIbpyRemark_str = ""

ElseIf blnIndrBlRefdTran = True Then
    mIbfdPttCode_lng = 0
    mIbfdIbhCode_lng = 0
    mIbfdRefuAmt_dbl = 0
    mIbfdRemark_str = ""
    
Else
    ErrorBox "clsHmsIpdMultiTranEntry_ClearDtl_#244_[Undefined Case]"
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

Public Sub ClearIbbs()
mIbbsICode_lng = 0
mIbbsIbsCode_lng = 0
mIbbsIpgCode_lng = 0
mIbbsSno_int = 0
mIbbsFromDate_dt = cUNKNOWNDATE
mIbbsFromTime_lng = 0
mIbbsToDate_dt = cUNKNOWNDATE
mIbbsToTime_lng = 0
mIbbsUnit_int = 0
mIbbsRemark_str = ""
mIbbsCmpCode_int = 0
mIbbsRecState_int = 0

End Sub

Public Sub ClearDpog()
mIbgdCode_lng = 0
mIbgdICode_lng = 0
mIbgdSno_int = 0
mIbgdIgtCode_lng = 0
mIbgdDpogAmt_dbl = 0
mIbgdRemark_str = ""
mIbgdCmpCode_int = 0
mIbgdRecState_int = 0

End Sub

Public Sub ClearRfug()
mIbgfCode_lng = 0
mIbgfICode_lng = 0
mIbgfSno_int = 0
mIbgfIgfCode_lng = 0
mIbgfRfugAmt_dbl = 0
mIbgfRemark_str = ""
mIbgfCmpCode_int = 0
mIbgfRecState_int = 0

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
    mTrnCode = GetUIdCode("clsHmsIpdMultiTranEntry_BeginTran", mUIdFileName:=mClassUIdFileName, mAcsPermFileName:=mClassAcsPermFileName) * -1   '   GetNextSeqno(m_dbAcDatabase, "mTrnHdrTableName", "mTrnHdrCodeField")
    If mTrnCode = 0 Then
        ErrorBox "clsHmsIpdMultiTranEntry_BeginTran_#266_[Invalid " & mTitleName & " Code]"
        GoTo EndSub
    End If
ElseIf mTrnCode > 0 Then
    tRecset.open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.RecordCount = 0 Then
        ErrorBox "clsHmsIpdMultiTranEntry_BeginTran_#272_[Entry not Found]"
        GoTo EndSub
    End If
    CloseTable tRecset
Else
    ErrorBox "clsHmsIpdMultiTranEntry_BeginTran_#277_[Invalid " & mTitleName & " Entry Code Request]"
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

mRtnval = GetUIdCode("clsHmsIpdMultiTranDtlEntry_BeginTran", mUIdFileName:=mClassDtlUIdFileName, mAcsPermFileName:=mClassDtlAcsPermFileName) * -1

GetDtlTranUnqCode = mRtnval

End Function

Public Function EndTran(ByVal mTrnCode As Long) As Boolean
Dim mCnt As Integer
EndTran = False
If Chk_ActiveTran() = False Or IIf(ActiveTrnCode > 0, mTrnCode <> ActiveTrnCode, False) Then
    ErrorBox "clsHmsIpdMultiTranEntry_EndTran_#294_[InActive Transaction Entry]"
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
m_dbBdkDatabase.BeginTrans
With tRecset
.open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Rem Do While .EOF = False
        If InList(.fields(mTrnHdrRecStateField), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
            If blnIndrRcptTran = True Then
                .fields("IhrBalAmt") = .fields("IhrAmtAftDisc") - (.fields("IhrAdvAmt") + .fields("IhrRecdAmt") + .fields("IhrDepoAmt"))
            ElseIf blnIndrBillTran = True Then
                .fields("IbhBalAmt") = .fields("IbhAmtAftDisc") - (.fields("IbhAdvAmt") + .fields("IbhDpogAmt") + .fields("IbhDepoAmt")) + .fields("IbhRfugAmt") + .fields("IbhRefuAmt")
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
CloseTable tRecset
m_dbBdkDatabase.CommitTrans

Rem detail section
m_dbBdkDatabase.BeginTrans
With tRecset
If mTrnCode = mTmpTrnCode Then
    .open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnDtlICodeField & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
Else
    .open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTmpTrnCode) & " order by " & mTrnDtlICodeField & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
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
            
            ElseIf blnIndrBillTran = True Then
                If .fields("IblIpgCode") <> mIbhIpgCode_lng Then
                    .fields("IblIpgCode") = mIbhIpgCode_lng
                End If
                If .fields("IblPttCode") <> mIbhPttCode_lng Then
                    .fields("IblPttCode") = mIbhPttCode_lng
                End If
            ElseIf blnIndrBlPymtTran = True Then
                If .fields("IbpyPttCode") <> mIbphPttCode_lng Then
                    .fields("IbpyPttCode") = mIbphPttCode_lng
                End If
            
            ElseIf blnIndrBlRefdTran = True Then
                If .fields("IbfdPttCode") <> mIbfhPttCode_lng Then
                    .fields("IbfdPttCode") = mIbfhPttCode_lng
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
    If blnIndrRcptTran = True Then
        DispersePropRcptRecdAmt mTrnCode
    ElseIf blnIndrBillTran = True Then
        DispersePropBillAdvAmt mTrnCode
        DispersePropBillDpogAmt mTrnCode
        DispersePropBillRfugAmt mTrnCode
    End If
End If
End With
CloseTable tRecset
m_dbBdkDatabase.CommitTrans

Rem service doctor detail updations
If blnIndrRcptTran = True Or blnIndrBillTran = True Then
    Rem order by SubCode+ICode so as to reset sno for each service
    m_dbBdkDatabase.BeginTrans
    With tRecset
    If mTrnCode = mTmpTrnCode Then
        .open "Select * from " & mTrnSdcTableName & " where " & mTrnSdcCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnSdcSubCodeField & "," & mTrnSdcICodeField & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
    Else
        .open "Select * from " & mTrnSdcTableName & " where " & mTrnSdcCodeField & "=" & CStr(mTmpTrnCode) & " order by " & mTrnSdcSubCodeField & "," & mTrnSdcICodeField & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
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
                If blnIndrRcptTran = True Then
                    If .fields(mTrnSdcPttCodeField) <> mIhrPttCode_lng Then
                        .fields(mTrnSdcPttCodeField) = mIhrPttCode_lng
                    End If
                ElseIf blnIndrBillTran = True Then
                    If .fields(mTrnSdcPttCodeField) <> mIbhPttCode_lng Then
                        .fields(mTrnSdcPttCodeField) = mIbhPttCode_lng
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
    m_dbBdkDatabase.CommitTrans
End If

Rem indoor bill bed state detail
If blnIndrBillTran = True Then
    m_dbBdkDatabase.BeginTrans
    With tRecset
    Rem Important mTrnCode Vs mTmpTrnCode
    .open "Select * from IndrBlIbsDtl where IbbsCode=" & CStr(mTmpTrnCode) & " order by IbbsICode", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
    If .EOF = False Then
        mTrnSno = 1
        Do While .EOF = False
            If InList(.fields("IbbsRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
                If mTrnCode <> mTmpTrnCode Then
                    .fields("IbbsCode") = mTrnCode
                End If
                .fields("IbbsSno") = mTrnSno
                .fields("IbbsRecState") = cREC_UNCHANGED
                .Update
                mTrnSno = mTrnSno + 1
            Else
                .fields("IbbsRecState") = ChkDeleteRecStatus(.fields("IbbsRecState"))
                .Update
                .Delete
                
            End If
            
            .MoveNext
        Loop
    End If
    End With
    CloseTable tRecset
    m_dbBdkDatabase.CommitTrans
End If

Rem indoor bill on a/c payment adjustment
If blnIndrBillTran = True Then
    m_dbBdkDatabase.BeginTrans
    With tRecset
    If mTrnCode = mTmpTrnCode Then
        .open "Select * from IndrBlDpogDtl where IbgdCode=" & CStr(mTrnCode) & " order by IbgdICode" & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
    Else
        .open "Select * from IndrBlDpogDtl where IbgdCode=" & CStr(mTmpTrnCode) & " order by IbgdICode" & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
    End If
    If .RecordCount > 0 Then
        mTrnSno = 1
        Do While .EOF = False
            If InList(.fields("IbgdRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
                If mTrnCode <> mTmpTrnCode Then
                    .fields("IbgdCode") = mTrnCode
                End If
                .fields("IbgdSno") = mTrnSno
                .fields("IbgdRecState") = cREC_UNCHANGED
                .Update
                mTrnSno = mTrnSno + 1
            Else
                .fields("IbgdRecState") = ChkDeleteRecStatus(.fields("IbgdRecState"))
                .Update
                .Delete
            End If
            
            .MoveNext
        Loop
    End If
    End With
    CloseTable tRecset
    m_dbBdkDatabase.CommitTrans
End If

Rem indoor bill on a/c refund adjustment
If blnIndrBillTran = True Then
    m_dbBdkDatabase.BeginTrans
    With tRecset
    If mTrnCode = mTmpTrnCode Then
        .open "Select * from IndrBlRfugDtl where IbgfCode=" & CStr(mTrnCode) & " order by IbgfICode" & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
    Else
        .open "Select * from IndrBlRfugDtl where IbgfCode=" & CStr(mTmpTrnCode) & " order by IbgfICode" & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
    End If
    If .RecordCount > 0 Then
        mTrnSno = 1
        Do While .EOF = False
            If InList(.fields("IbgfRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
                If mTrnCode <> mTmpTrnCode Then
                    .fields("IbgfCode") = mTrnCode
                End If
                .fields("IbgfSno") = mTrnSno
                .fields("IbgfRecState") = cREC_UNCHANGED
                .Update
                mTrnSno = mTrnSno + 1
            Else
                .fields("IbgfRecState") = ChkDeleteRecStatus(.fields("IbgfRecState"))
                .Update
                .Delete
            End If
            
            .MoveNext
        Loop
    End If
    End With
    CloseTable tRecset
    m_dbBdkDatabase.CommitTrans
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
.open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
mRecdAmtBal = .fields("IhrRecdAmt")
End With
CloseTable tRecset

With tRecset
.open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnDtlICodeField & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    m_dbBdkDatabase.BeginTrans
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
                ErrorBox "clsHmsIpdMultiTranEntry_DisperseRecdAmt_#2316_[Invalid Record Status]"
            End If
        End If
        .MoveNext
    Loop
    m_dbBdkDatabase.CommitTrans
Else
    If mRecdAmtBal <> 0 Then
        ErrorBox "clsHmsIpdMultiTranEntry_DisperseFifoRcptRecdAmt_#3002_[Unexpected]"
    End If
End If
End With
CloseTable tRecset

End Sub

Private Sub DispersePropRcptRecdAmt(ByVal mTrnCode As Long)
Dim tRecset As New ADODB.Recordset, mRecdAmtBal As Double, mRecdAmtTot As Double, mPropRecdAmt As Variant, mAmtAftDiscTot As Double

With tRecset
.open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
mRecdAmtBal = .fields("IhrRecdAmt")
mRecdAmtTot = .fields("IhrRecdAmt")
mAmtAftDiscTot = .fields("IhrAmtAftDisc")
End With
CloseTable tRecset

With tRecset
.open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnDtlICodeField & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    m_dbBdkDatabase.BeginTrans
    Do While .EOF = False
        If InList(.fields("IrcRecState"), Array(cREC_UNCHANGED)) = True Then
            mPropRecdAmt = Round(CDec(mRecdAmtTot) * CDec(.fields("IrcAmtAftDisc")) / CDec(mAmtAftDiscTot), 2)
            
            .fields("IrcRecdAmt") = mPropRecdAmt
            .fields("IrcBalAmt") = .fields("IrcAmtAftDisc") - (.fields("IrcAdvAmt") + .fields("IrcDepoAmt")) - mPropRecdAmt
            .Update
                
            mRecdAmtBal = mRecdAmtBal - mPropRecdAmt
        Else
            If InList(.fields("IrcRecState"), Array(cREC_CANCELED, cREC_DELETED)) = False Then
                ErrorBox "clsHmsIpdMultiTranEntry_DispersePropRcptRecdAmt_#2316_[Invalid Record Status]"
            End If
        End If
        .MoveNext
    Loop
    If mRecdAmtBal <> 0 And mRecdAmtBal <> mRecdAmtTot Then
        .MovePrevious
        
        mPropRecdAmt = mRecdAmtBal + .fields("IrcRecdAmt")
        .fields("IrcRecdAmt") = mPropRecdAmt
        .fields("IrcBalAmt") = .fields("IrcAmtAftDisc") - (.fields("IrcAdvAmt") + .fields("IrcDepoAmt")) - mPropRecdAmt
        .Update
    End If
    m_dbBdkDatabase.CommitTrans
Else
    If mRecdAmtBal <> 0 Then
        ErrorBox "clsHmsIpdMultiTranEntry_DispersePropRcptRecdAmt_#3002_[Unexpected]"
    End If
End If
End With
CloseTable tRecset

End Sub

Private Sub DispersePropBillAdvAmt(ByVal mTrnCode As Long)
Dim tRecset As New ADODB.Recordset, mAdvAmtBal As Double, mAdvAmtTot As Double, mPropAdvAmt As Variant, mAmtAftDiscTot As Double

With tRecset
.open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
mAdvAmtBal = .fields("IbhAdvAmt")
mAdvAmtTot = .fields("IbhAdvAmt")
mAmtAftDiscTot = .fields("IbhAmtAftDisc")
End With
CloseTable tRecset

With tRecset
.open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnDtlICodeField & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    m_dbBdkDatabase.BeginTrans
    Do While .EOF = False
        If InList(.fields("IblRecState"), Array(cREC_UNCHANGED)) = True Then
            mPropAdvAmt = Round(CDec(mAdvAmtTot) * CDec(.fields("IblAmtAftDisc")) / CDec(mAmtAftDiscTot), 2)
            
            .fields("IblAdvAmt") = mPropAdvAmt
            '''.fields("IblBalAmt") = .fields("IblAmtAftDisc") - (.fields("IblAdvAmt") + .fields("IblDpogAmt") + .fields("IblDepoAmt")) - mPropAdvAmt + .fields("IblRfugAmt") + .fields("IblRefuAmt")
            .fields("IblBalAmt") = .fields("IblAmtAftDisc") - (mPropAdvAmt + .fields("IblDpogAmt") + .fields("IblDepoAmt")) + .fields("IblRfugAmt") + .fields("IblRefuAmt")
            .Update
                
            mAdvAmtBal = mAdvAmtBal - mPropAdvAmt
        Else
            If InList(.fields("IblRecState"), Array(cREC_CANCELED, cREC_DELETED)) = False Then
                ErrorBox "clsHmsIpdMultiTranEntry_DispersePropBillAdvAmt_#903_[Invalid Record Status]"
            End If
        End If
        .MoveNext
    Loop
    If mAdvAmtBal <> 0 And mAdvAmtBal <> mAdvAmtTot Then
        .MovePrevious
        
        mPropAdvAmt = mAdvAmtBal + .fields("IblAdvAmt")
        .fields("IblAdvAmt") = mPropAdvAmt
        '''.fields("IblBalAmt") = .fields("IblAmtAftDisc") - (.fields("IblAdvAmt") + .fields("IblDpogAmt") + .fields("IblDepoAmt")) - mPropAdvAmt + .fields("IblRfugAmt") + .fields("IblRefuAmt")
        .fields("IblBalAmt") = .fields("IblAmtAftDisc") - (mPropAdvAmt + .fields("IblDpogAmt") + .fields("IblDepoAmt")) + .fields("IblRfugAmt") + .fields("IblRefuAmt")
        .Update
    End If
    m_dbBdkDatabase.CommitTrans
Else
    If mAdvAmtBal <> 0 Then
        ErrorBox "clsHmsIpdMultiTranEntry_DispersePropBillAdvAmt_#919_[Unexpected]"
    End If
End If
End With
CloseTable tRecset

End Sub

Private Sub DispersePropBillDpogAmt(ByVal mTrnCode As Long)
Dim tRecset As New ADODB.Recordset, mDpogAmtBal As Double, mDpogAmtTot As Double, mPropDpogAmt As Variant, mAmtAftDiscTot As Double

With tRecset
.open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
mDpogAmtBal = .fields("IbhDpogAmt")
mDpogAmtTot = .fields("IbhDpogAmt")
mAmtAftDiscTot = .fields("IbhAmtAftDisc")
End With
CloseTable tRecset

With tRecset
.open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnDtlICodeField & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    m_dbBdkDatabase.BeginTrans
    Do While .EOF = False
        If InList(.fields("IblRecState"), Array(cREC_UNCHANGED)) = True Then
            mPropDpogAmt = Round(CDec(mDpogAmtTot) * CDec(.fields("IblAmtAftDisc")) / CDec(mAmtAftDiscTot), 2)
            
            .fields("IblDpogAmt") = mPropDpogAmt
            .fields("IblBalAmt") = .fields("IblAmtAftDisc") - (.fields("IblAdvAmt") + mPropDpogAmt + .fields("IblDepoAmt")) + .fields("IblRfugAmt") + .fields("IblRefuAmt")
            .Update
                
            mDpogAmtBal = mDpogAmtBal - mPropDpogAmt
        Else
            If InList(.fields("IblRecState"), Array(cREC_CANCELED, cREC_DELETED)) = False Then
                ErrorBox "clsHmsIpdMultiTranEntry_DispersePropBillDpogAmt_#1097_[Invalid Record Status]"
            End If
        End If
        .MoveNext
    Loop
    If mDpogAmtBal <> 0 And mDpogAmtBal <> mDpogAmtTot Then
        .MovePrevious
        
        mPropDpogAmt = mDpogAmtBal + .fields("IblDpogAmt")
        .fields("IblDpogAmt") = mPropDpogAmt
        .fields("IblBalAmt") = .fields("IblAmtAftDisc") - (.fields("IblAdvAmt") + mPropDpogAmt + .fields("IblDepoAmt")) + .fields("IblRfugAmt") + .fields("IblRefuAmt")
        .Update
    End If
    m_dbBdkDatabase.CommitTrans
Else
    If mDpogAmtBal <> 0 Then
        ErrorBox "clsHmsIpdMultiTranEntry_DispersePropBillDpogAmt_#1114_[Unexpected]"
    End If
End If
End With
CloseTable tRecset

End Sub

Private Sub DispersePropBillRfugAmt(ByVal mTrnCode As Long)
Dim tRecset As New ADODB.Recordset, mRfugAmtBal As Double, mRfugAmtTot As Double, mPropRfugAmt As Variant, mAmtAftDiscTot As Double

With tRecset
.open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
mRfugAmtBal = .fields("IbhRfugAmt")
mRfugAmtTot = .fields("IbhRfugAmt")
mAmtAftDiscTot = .fields("IbhAmtAftDisc")
End With
CloseTable tRecset

With tRecset
.open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnDtlICodeField & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    m_dbBdkDatabase.BeginTrans
    Do While .EOF = False
        If InList(.fields("IblRecState"), Array(cREC_UNCHANGED)) = True Then
            mPropRfugAmt = Round(CDec(mRfugAmtTot) * CDec(.fields("IblAmtAftDisc")) / CDec(mAmtAftDiscTot), 2)
            
            .fields("IblRfugAmt") = mPropRfugAmt
            .fields("IblBalAmt") = .fields("IblAmtAftDisc") - (.fields("IblAdvAmt") + .fields("IblDpogAmt") + .fields("IblDepoAmt")) + mPropRfugAmt + .fields("IblRefuAmt")
            .Update
                
            mRfugAmtBal = mRfugAmtBal - mPropRfugAmt
        Else
            If InList(.fields("IblRecState"), Array(cREC_CANCELED, cREC_DELETED)) = False Then
                ErrorBox "clsHmsIpdMultiTranEntry_DispersePropBillRfugAmt_#1154_[Invalid Record Status]"
            End If
        End If
        .MoveNext
    Loop
    If mRfugAmtBal <> 0 And mRfugAmtBal <> mRfugAmtTot Then
        .MovePrevious
        
        mPropRfugAmt = mRfugAmtBal + .fields("IblRfugAmt")
        .fields("IblRfugAmt") = mPropRfugAmt
        .fields("IblBalAmt") = .fields("IblAmtAftDisc") - (.fields("IblAdvAmt") + .fields("IblDpogAmt") + .fields("IblDepoAmt")) + mPropRfugAmt + .fields("IblRefuAmt")
        .Update
    End If
    m_dbBdkDatabase.CommitTrans
Else
    If mRfugAmtBal <> 0 Then
        ErrorBox "clsHmsIpdMultiTranEntry_DispersePropBillRfugAmt_#1171_[Unexpected]"
    End If
End If
End With
CloseTable tRecset

End Sub

Public Function CancelTran(ByVal mTrnCode As Long) As Boolean
Dim t1Recset As New ADODB.Recordset, t2Recset As New ADODB.Recordset
Dim mIpyIhrCode As Long, mIpyDepoAmt As Double
Dim mIfdIhrCode As Long, mIfdRefuAmt As Double
Dim mIbpyIbhCode As Long, mIbpyDepoAmt As Double, mIbpyDpogAmt As Double
Dim mIbfdIbhCode As Long, mIbfdRefuAmt As Double
Dim mIbgdIgtCode As Long, mIbgdDpogAmt As Double
Dim mIbgfIgfCode As Long, mIbgfRfugAmt As Double
Dim mRecAdded As Boolean, mRecEdited As Boolean, mRecDeleted As Boolean, mRecCanceled As Boolean

CancelTran = False
If Chk_ActiveTran() = False Or mTrnCode <> ActiveTrnCode Then
    ErrorBox "clsHmsIpdMultiTranEntry_CancelTran_#419_[InActive Transaction Entry]"
    GoTo EndSub
End If
mTrnCode = ActiveTrnCode
On Error GoTo errhand

Rem header section
m_dbBdkDatabase.BeginTrans
With t1Recset
.open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
t2Recset.open "Select * from " & mTrnHdrTableName & "_Log where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
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
                
            ElseIf blnIndrBillTran = True Then
                .fields("IbhIpgCode") = t2Recset.fields("IbhIpgCode")
                .fields("IbhTime") = t2Recset.fields("IbhTime")
                .fields("IbhOldIbhCode") = t2Recset.fields("IbhOldIbhCode")
                .fields("IbhPttCode") = t2Recset.fields("IbhPttCode")
                .fields("IbhPttDiscPer") = t2Recset.fields("IbhPttDiscPer")
                .fields("IbhAmtBefDisc") = t2Recset.fields("IbhAmtBefDisc")
                .fields("IbhDiscAmt") = t2Recset.fields("IbhDiscAmt")
                .fields("IbhAmtAftDisc") = t2Recset.fields("IbhAmtAftDisc")
                .fields("IbhAdvAmt") = t2Recset.fields("IbhAdvAmt")
                .fields("IbhDpogAmt") = t2Recset.fields("IbhDpogAmt")
                .fields("IbhDepoAmt") = t2Recset.fields("IbhDepoAmt")
                .fields("IbhRfugAmt") = t2Recset.fields("IbhRfugAmt")
                .fields("IbhRefuAmt") = t2Recset.fields("IbhRefuAmt")
                .fields("IbhBalAmt") = t2Recset.fields("IbhBalAmt")
                .fields("IbhRemark") = t2Recset.fields("IbhRemark")
            
            ElseIf blnIndrBlPymtTran = True Then
                .fields("IbphIpgCode") = t2Recset.fields("IbphIpgCode")
                .fields("IbphTime") = t2Recset.fields("IbphTime")
                .fields("IbphOldIbphCode") = t2Recset.fields("IbphOldIbphCode")
                .fields("IbphPttCode") = t2Recset.fields("IbphPttCode")
                .fields("IbphDepoAmt") = t2Recset.fields("IbphDepoAmt")
                .fields("IbphRemark") = t2Recset.fields("IbphRemark")
                
            ElseIf blnIndrBlRefdTran = True Then
                .fields("IbfhIpgCode") = t2Recset.fields("IbfhIpgCode")
                .fields("IbfhTime") = t2Recset.fields("IbfhTime")
                .fields("IbfhOldIbfhCode") = t2Recset.fields("IbfhOldIbfhCode")
                .fields("IbfhPttCode") = t2Recset.fields("IbfhPttCode")
                .fields("IbfhRefuAmt") = t2Recset.fields("IbfhRefuAmt")
                .fields("IbfhRemark") = t2Recset.fields("IbfhRemark")
                
            Else
                ErrorBox "clsHmsIpdMultiTranEntry_CancelTran_#459_[Undefined Case]"
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
m_dbBdkDatabase.CommitTrans
CloseTable t1Recset
CloseTable t2Recset

Rem detail section
m_dbBdkDatabase.BeginTrans
With t1Recset
Rem important - revert the changes in revert order of updation
.open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnDtlICodeField & " desc", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
t2Recset.open "Select * from " & mTrnDtlTableName & "_Log where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnDtlICodeField & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
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
                
            ElseIf blnIndrBillTran = True Then
                .fields("IblIpgCode") = t2Recset.fields("IblIpgCode")
                .fields("IblPttCode") = t2Recset.fields("IblPttCode")
                .fields("IblSrvCode") = t2Recset.fields("IblSrvCode")
                .fields("IblUnit") = t2Recset.fields("IblUnit")
                .fields("IblRate") = t2Recset.fields("IblRate")
                .fields("IblAmtBefDisc") = t2Recset.fields("IblAmtBefDisc")
                .fields("IblDiscPer") = t2Recset.fields("IblDiscPer")
                .fields("IblDiscAmt") = t2Recset.fields("IblDiscAmt")
                .fields("IblAmtAftDisc") = t2Recset.fields("IblAmtAftDisc")
                .fields("IblAdvAmt") = t2Recset.fields("IblAdvAmt")
                .fields("IblDpogAmt") = t2Recset.fields("IblDpogAmt")
                .fields("IblDepoAmt") = t2Recset.fields("IblDepoAmt")
                .fields("IblRfugAmt") = t2Recset.fields("IblRfugAmt")
                .fields("IblRefuAmt") = t2Recset.fields("IblRefuAmt")
                .fields("IblBalAmt") = t2Recset.fields("IblBalAmt")
                .fields("IblRemark") = t2Recset.fields("IblRemark")
            
            ElseIf blnIndrBlPymtTran = True Then
                mIbpyIbhCode = .fields("IbpyIbhCode")
                mIbpyDepoAmt = .fields("IbpyDepoAmt")
                
                .fields("IbpyPttCode") = t2Recset.fields("IbpyPttCode")
                .fields("IbpyIbhCode") = t2Recset.fields("IbpyIbhCode")
                .fields("IbpyDepoAmt") = t2Recset.fields("IbpyDepoAmt")
                .fields("IbpyRemark") = t2Recset.fields("IbpyRemark")
                
            ElseIf blnIndrBlRefdTran = True Then
                mIbfdIbhCode = .fields("IbfdIbhCode")
                mIbfdRefuAmt = .fields("IbfdRefuAmt")
                
                .fields("IbfdPttCode") = t2Recset.fields("IbfdPttCode")
                .fields("IbfdIbhCode") = t2Recset.fields("IbfdIbhCode")
                .fields("IbfdRefuAmt") = t2Recset.fields("IbfdRefuAmt")
                .fields("IbfdRemark") = t2Recset.fields("IbfdRemark")
                
            Else
                ErrorBox "clsHmsIpdMultiTranEntry_CancelTran_#506_[Undefined Case]"
            End If
            .Update
            
            If blnIndrPymtTran = True Then
                If mRecEdited = True Then
                    If mIpyIhrCode <> .fields("IpyIhrCode") Then
                        DispersePropRcptDepoAmt mIpyIhrCode, (mIpyDepoAmt * -1)                     ' removing deposit amount from old receipt
                        DispersePropRcptDepoAmt .fields("IpyIhrCode"), .fields("IpyDepoAmt")        ' adding deposit amount to new receipt
                    ElseIf mIpyDepoAmt <> .fields("IpyDepoAmt") Then
                        mIpyDepoAmt = .fields("IpyDepoAmt") - mIpyDepoAmt
                        DispersePropRcptDepoAmt mIpyIhrCode, mIpyDepoAmt
                    End If
                ElseIf mRecDeleted = True Then
                    DispersePropRcptDepoAmt .fields("IpyIhrCode"), .fields("IpyDepoAmt")            ' adding deposit amount to restored receipt
                End If
            
            ElseIf blnIndrRefdTran = True Then
                If mRecEdited = True Then
                    If mIfdIhrCode <> .fields("IfdIhrCode") Then
                        DispersePropRcptRefuAmt mIfdIhrCode, (mIfdRefuAmt * -1)                     ' removing refund amount from old receipt
                        DispersePropRcptRefuAmt .fields("IfdIhrCode"), .fields("IfdRefuAmt")        ' adding refund amount to new receipt
                    ElseIf mIfdRefuAmt <> .fields("IfdRefuAmt") Then
                        mIfdRefuAmt = .fields("IfdRefuAmt") - mIfdRefuAmt
                        DispersePropRcptRefuAmt mIfdIhrCode, mIfdRefuAmt
                    End If
                ElseIf mRecDeleted = True Then
                    DispersePropRcptRefuAmt .fields("IfdIhrCode"), .fields("IfdRefuAmt")        ' adding refund amount to restored receipt
                End If
            
            ElseIf blnIndrBlPymtTran = True Then
                If mRecEdited = True Then
                    If mIbpyIbhCode <> .fields("IbpyIbhCode") Then
                        DispersePropBillDepoAmt mIbpyIbhCode, (mIbpyDepoAmt * -1)                     ' removing deposit amount from old receipt
                        DispersePropBillDepoAmt .fields("IbpyIbhCode"), .fields("IbpyDepoAmt")        ' adding deposit amount to new receipt
                    ElseIf mIbpyDepoAmt <> .fields("IbpyDepoAmt") Then
                        mIbpyDepoAmt = .fields("IbpyDepoAmt") - mIbpyDepoAmt
                        DispersePropBillDepoAmt mIbpyIbhCode, mIbpyDepoAmt
                    End If
                ElseIf mRecDeleted = True Then
                    DispersePropBillDepoAmt .fields("IbpyIbhCode"), .fields("IbpyDepoAmt")        ' adding deposit amount to restored receipt
                End If
            
            ElseIf blnIndrBlRefdTran = True Then
                If mRecEdited = True Then
                    If mIbfdIbhCode <> .fields("IbfdIbhCode") Then
                        DispersePropBillRefuAmt mIbfdIbhCode, (mIbfdRefuAmt * -1)                     ' removing refund amount from old receipt
                        DispersePropBillRefuAmt .fields("IbfdIbhCode"), .fields("IbfdRefuAmt")        ' adding refund amount to new receipt
                    ElseIf mIbfdRefuAmt <> .fields("IbfdRefuAmt") Then
                        mIbfdRefuAmt = .fields("IbfdRefuAmt") - mIbfdRefuAmt
                        DispersePropBillRefuAmt mIbfdIbhCode, mIbfdRefuAmt
                    End If
                ElseIf mRecDeleted = True Then
                    DispersePropBillRefuAmt .fields("IbfdIbhCode"), .fields("IbfdRefuAmt")        ' adding refund amount to restored receipt
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
                
            ElseIf blnIndrBlPymtTran = True Then
                mIbpyIbhCode = .fields("IbpyIbhCode")
                mIbpyDepoAmt = .fields("IbpyDepoAmt")
                
            ElseIf blnIndrBlRefdTran = True Then
                mIbfdIbhCode = .fields("IbfdIbhCode")
                mIbfdRefuAmt = .fields("IbfdRefuAmt")
                
            End If
            ' --------------------------------
            .fields(mTrnDtlRecStateField) = ChkDeleteRecStatus(.fields(mTrnDtlRecStateField))
            .Update
            .Delete
            ' --------------------------------
            If mRecAdded = True Then
                If blnIndrPymtTran = True Then
                    DispersePropRcptDepoAmt mIpyIhrCode, (mIpyDepoAmt * -1)
                ElseIf blnIndrRefdTran = True Then
                    DispersePropRcptRefuAmt mIfdIhrCode, (mIfdRefuAmt * -1)
                ElseIf blnIndrBlPymtTran = True Then
                    DispersePropBillDepoAmt mIbpyIbhCode, (mIbpyDepoAmt * -1)
                ElseIf blnIndrBlRefdTran = True Then
                    DispersePropBillRefuAmt mIbfdIbhCode, (mIbfdRefuAmt * -1)
                End If
            End If
        End If
    
        .MoveNext
    Loop
End If
End With
CloseTable t1Recset
CloseTable t2Recset
m_dbBdkDatabase.CommitTrans

Rem service doctor detail section
If blnIndrRcptTran = True Or blnIndrBillTran = True Then
    m_dbBdkDatabase.BeginTrans
    With t1Recset
    .open "Select * from " & mTrnSdcTableName & " where " & mTrnSdcCodeField & "=" & CStr(mTrnCode), m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
    t2Recset.open "Select * from " & mTrnSdcTableName & "_Log where " & mTrnSdcCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnSdcICodeField & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount > 0 Then
        Do While .EOF = False
            t2Recset.Find mTrnSdcICodeField & "=" & CStr(.fields(mTrnSdcICodeField)), Start:=1
            If t2Recset.EOF = False Then
                Rem .fields(mTrnSdcCodeField) = t2Recset.fields(mTrnSdcCodeField)
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
    m_dbBdkDatabase.CommitTrans
End If

Rem indoor bill bed status detail
If blnIndrBillTran = True Then
    m_dbBdkDatabase.BeginTrans
    With t1Recset
    Rem important - revert the changes in revert order of updation
    .open "Select * from IndrBlIbsDtl where IbbsCode=" & CStr(mTrnCode) & " order by IbbsICode" & " desc", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
    t2Recset.open "Select * from IndrBlIbsDtl_Log where IbbsCode=" & CStr(mTrnCode) & " order by IbbsICode", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
    If .EOF = False Then
        Do While .EOF = False
            t2Recset.Find "IbbsICode=" & CStr(.fields("IbbsICode")), Start:=1
            If t2Recset.EOF = False Then
                mRecEdited = False
                mRecDeleted = False
                If .fields("IbbsRecState") = cREC_EDITED = True Then
                    mRecEdited = True
                ElseIf .fields("IbbsRecState") = cREC_DELETED = True Then
                    mRecDeleted = True
                End If
                
                Rem .fields("IbbsICode") = t2Recset.fields("IbbsICode")
                .fields("IbbsIbsCode") = t2Recset.fields("IbbsIbsCode")
                .fields("IbbsIpgCode") = t2Recset.fields("IbbsIpgCode")
                .fields("IbbsSno") = t2Recset.fields("IbbsSno")
                .fields("IbbsFromDate") = t2Recset.fields("IbbsFromDate")
                .fields("IbbsFromTime") = t2Recset.fields("IbbsFromTime")
                .fields("IbbsToDate") = t2Recset.fields("IbbsToDate")
                .fields("IbbsToTime") = t2Recset.fields("IbbsToTime")
                .fields("IbbsUnit") = t2Recset.fields("IbbsUnit")
                .fields("IbbsRemark") = t2Recset.fields("IbbsRemark")
                .fields("IbbsCmpCode") = t2Recset.fields("IbbsCmpCode")
                .fields("IbbsRecState") = t2Recset.fields("IbbsRecState")
                .Update
                
            Else
                .fields("IbbsRecState") = ChkDeleteRecStatus(.fields("IbbsRecState"))
                .Update
                .Delete
                
            End If
        
            .MoveNext
        Loop
    End If
    End With
    CloseTable t1Recset
    CloseTable t2Recset
    m_dbBdkDatabase.CommitTrans
End If

Rem indoor bill on a/c payment adjustment
If blnIndrBillTran = True Then
    m_dbBdkDatabase.BeginTrans
    With t1Recset
    .open "Select * from IndrBlDpogDtl where IbgdCode=" & CStr(mTrnCode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
    t2Recset.open "Select * from IndrBlDpogDtl_Log where IbgdCode=" & CStr(mTrnCode) & " order by IbgdICode" & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount > 0 Then
        Do While .EOF = False
            t2Recset.Find "IbgdICode=" & CStr(.fields("IbgdICode")), Start:=1
            If t2Recset.EOF = False Then
                mRecEdited = False
                mRecDeleted = False
                If .fields("IbgdRecState") = cREC_EDITED = True Then
                    mRecEdited = True
                ElseIf .fields("IbgdRecState") = cREC_DELETED = True Then
                    mRecDeleted = True
                End If
                mIbgdIgtCode = .fields("IbgdIgtCode")
                mIbgdDpogAmt = .fields("IbgdDpogAmt")
                
                Rem .fields("IbgdCode") = t2Recset.fields("IbgdCode")
                Rem .fields("IbgdICode") = t2Recset.fields("IbgdICode")
                .fields("IbgdSno") = t2Recset.fields("IbgdSno")
                .fields("IbgdIgtCode") = t2Recset.fields("IbgdIgtCode")
                .fields("IbgdDpogAmt") = t2Recset.fields("IbgdDpogAmt")
                .fields("IbgdRemark") = t2Recset.fields("IbgdRemark")
                .fields("IbgdCmpCode") = t2Recset.fields("IbgdCmpCode")
                .fields("IbgdRecState") = t2Recset.fields("IbgdRecState")
                
                .Update
                
                If mRecEdited = True Then
                    If mIbgdIgtCode <> .fields("IbgdIgtCode") Then
                        m_dbBdkDatabase.Execute "Update IndrRgPymt set IgtAdjAmt=IgtAdjAmt-" & CStr(mIbgdDpogAmt) & ",IgtBalAmt=IgtBalAmt+" & CStr(mIbgdDpogAmt) & " where IgtCode=" & CStr(mIbgdIgtCode) & ""                                      ''' removing adjusted amount for old receipt
                        m_dbBdkDatabase.Execute "Update IndrRgPymt set IgtAdjAmt=IgtAdjAmt+" & CStr(.fields("IbgdDpogAmt")) & ",IgtBalAmt=IgtBalAmt-" & CStr(.fields("IbgdDpogAmt")) & " where IgtCode=" & CStr(.fields("IbgdIgtCode")) & ""        ''' adding adjusted amount to new receipt
                    ElseIf mIbgdDpogAmt <> .fields("IbgdDpogAmt") Then
                        mIbgdDpogAmt = .fields("IbgdDpogAmt") - mIbgdDpogAmt
                        m_dbBdkDatabase.Execute "Update IndrRgPymt set IgtAdjAmt=IgtAdjAmt+" & CStr(mIbgdDpogAmt) & ",IgtBalAmt=IgtBalAmt-" & CStr(mIbgdDpogAmt) & " where IgtCode=" & CStr(mIbgdIgtCode) & ""                                      ''' adding/removing difference adjusted amount for same receipt
                    End If
                ElseIf mRecDeleted = True Then
                    m_dbBdkDatabase.Execute "Update IndrRgPymt set IgtAdjAmt=IgtAdjAmt+" & CStr(.fields("IbgdDpogAmt")) & ",IgtBalAmt=IgtBalAmt-" & CStr(.fields("IbgdDpogAmt")) & " where IgtCode=" & CStr(.fields("IbgdIgtCode")) & ""            ''' adding adjusted amount to new receipt
                End If
                
            Else
                mRecAdded = False
                mRecCanceled = False
                If .fields("IbgdRecState") = cREC_ADDED = True Then
                    mRecAdded = True
                ElseIf .fields("IbgdRecState") = cREC_CANCELED = True Then
                    mRecCanceled = True
                End If
                mIbgdIgtCode = .fields("IbgdIgtCode")
                mIbgdDpogAmt = .fields("IbgdDpogAmt")
                ' --------------------------------
                .fields("IbgdRecState") = ChkDeleteRecStatus(.fields("IbgdRecState"))
                .Update
                .Delete
                ' ---------------------------------
                If mRecAdded = True Then
                    m_dbBdkDatabase.Execute "Update IndrRgPymt set IgtAdjAmt=IgtAdjAmt-" & CStr(mIbgdDpogAmt) & ",IgtBalAmt=IgtBalAmt+" & CStr(mIbgdDpogAmt) & " where IgtCode=" & CStr(mIbgdIgtCode) & ""                                      ''' removing adjusted amount for old receipt
                End If
                
            End If
            .MoveNext
        Loop
    End If
    End With
    CloseTable t1Recset
    CloseTable t2Recset
    m_dbBdkDatabase.CommitTrans
End If

Rem indoor bill on a/c refund adjustment
If blnIndrBillTran = True Then
    m_dbBdkDatabase.BeginTrans
    With t1Recset
    .open "Select * from IndrBlRfugDtl where IbgfCode=" & CStr(mTrnCode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
    t2Recset.open "Select * from IndrBlRfugDtl_Log where IbgfCode=" & CStr(mTrnCode) & " order by IbgfICode" & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount > 0 Then
        Do While .EOF = False
            t2Recset.Find "IbgfICode=" & CStr(.fields("IbgfICode")), Start:=1
            If t2Recset.EOF = False Then
                mRecEdited = False
                mRecDeleted = False
                If .fields("IbgfRecState") = cREC_EDITED = True Then
                    mRecEdited = True
                ElseIf .fields("IbgfRecState") = cREC_DELETED = True Then
                    mRecDeleted = True
                End If
                mIbgfIgfCode = .fields("IbgfIgfCode")
                mIbgfRfugAmt = .fields("IbgfRfugAmt")
                
                Rem .fields("IbgfCode") = t2Recset.fields("IbgfCode")
                Rem .fields("IbgfICode") = t2Recset.fields("IbgfICode")
                .fields("IbgfSno") = t2Recset.fields("IbgfSno")
                .fields("IbgfIgfCode") = t2Recset.fields("IbgfIgfCode")
                .fields("IbgfRfugAmt") = t2Recset.fields("IbgfRfugAmt")
                .fields("IbgfRemark") = t2Recset.fields("IbgfRemark")
                .fields("IbgfCmpCode") = t2Recset.fields("IbgfCmpCode")
                .fields("IbgfRecState") = t2Recset.fields("IbgfRecState")
                
                .Update
                
                If mRecEdited = True Then
                    If mIbgfIgfCode <> .fields("IbgfIgfCode") Then
                        m_dbBdkDatabase.Execute "Update IndrRgRefd set IgfAdjAmt=IgfAdjAmt-" & CStr(mIbgfRfugAmt) & ",IgfBalAmt=IgfBalAmt+" & CStr(mIbgfRfugAmt) & " where IgfCode=" & CStr(mIbgfIgfCode) & ""                                      ''' removing adjusted amount for old receipt
                        m_dbBdkDatabase.Execute "Update IndrRgRefd set IgfAdjAmt=IgfAdjAmt+" & CStr(.fields("IbgfRfugAmt")) & ",IgfBalAmt=IgfBalAmt-" & CStr(.fields("IbgfRfugAmt")) & " where IgfCode=" & CStr(.fields("IbgfIgfCode")) & ""        ''' adding adjusted amount to new receipt
                    ElseIf mIbgfRfugAmt <> .fields("IbgfRfugAmt") Then
                        mIbgfRfugAmt = .fields("IbgfRfugAmt") - mIbgfRfugAmt
                        m_dbBdkDatabase.Execute "Update IndrRgRefd set IgfAdjAmt=IgfAdjAmt+" & CStr(mIbgfRfugAmt) & ",IgfBalAmt=IgfBalAmt-" & CStr(mIbgfRfugAmt) & " where IgfCode=" & CStr(mIbgfIgfCode) & ""                                      ''' adding/removing difference adjusted amount for same receipt
                    End If
                ElseIf mRecDeleted = True Then
                    m_dbBdkDatabase.Execute "Update IndrRgRefd set IgfAdjAmt=IgfAdjAmt+" & CStr(.fields("IbgfRfugAmt")) & ",IgfBalAmt=IgfBalAmt-" & CStr(.fields("IbgfRfugAmt")) & " where IgfCode=" & CStr(.fields("IbgfIgfCode")) & ""            ''' adding adjusted amount to new receipt
                End If
                
            Else
                mRecAdded = False
                mRecCanceled = False
                If .fields("IbgfRecState") = cREC_ADDED = True Then
                    mRecAdded = True
                ElseIf .fields("IbgfRecState") = cREC_CANCELED = True Then
                    mRecCanceled = True
                End If
                mIbgfIgfCode = .fields("IbgfIgfCode")
                mIbgfRfugAmt = .fields("IbgfRfugAmt")
                ' --------------------------------
                .fields("IbgfRecState") = ChkDeleteRecStatus(.fields("IbgfRecState"))
                .Update
                .Delete
                ' ---------------------------------
                If mRecAdded = True Then
                    m_dbBdkDatabase.Execute "Update IndrRgRefd set IgfAdjAmt=IgfAdjAmt-" & CStr(mIbgfRfugAmt) & ",IgfBalAmt=IgfBalAmt+" & CStr(mIbgfRfugAmt) & " where IgfCode=" & CStr(mIbgfIgfCode) & ""                                      ''' removing adjusted amount for old receipt
                End If
                
            End If
            .MoveNext
        Loop
    End If
    End With
    CloseTable t1Recset
    CloseTable t2Recset
    m_dbBdkDatabase.CommitTrans
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

m_dbBdkDatabase.BeginTrans
With t1Recset
.open "Select * from " & mTrnSdcTableName & " where " & mTrnSdcCodeField & "=" & CStr(mSdcCode) & " and " & mTrnSdcSubCodeField & "=" & CStr(mSdcSubCode), m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
t2Recset.open "Select * from " & mTrnSdcTableName & "_Log where " & mTrnSdcCodeField & "=" & CStr(mSdcCode) & " and " & mTrnSdcSubCodeField & "=" & CStr(mSdcSubCode) & " order by " & mTrnSdcICodeField & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
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
m_dbBdkDatabase.CommitTrans

CancelSdcTran = True
GoTo EndSub

errhand:
MsgBox Err.Description
m_dbBdkDatabase.Cancel

EndSub:
CloseTable t1Recset, mCheckOpen:=True
CloseTable t2Recset, mCheckOpen:=True
Exit Function

End Function

Rem so far not used anywhere, not need at all !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
Rem checks entries with log table, if log exist restores log records else delete records (assuming new records added), balance updation part not done here because master entries does not have effect while in process
Public Function CancelDpogTran(ByVal mTrnCode As Long) As Boolean
Dim t1Recset As New ADODB.Recordset, t2Recset As New ADODB.Recordset
Dim mIbgdIgtCode As Long, mIbgdDpogAmt As Double
Dim mRecAdded As Boolean, mRecEdited As Boolean, mRecDeleted As Boolean, mRecCanceled As Boolean

CancelDpogTran = False
If Chk_ActiveTran() = False Or mTrnCode <> ActiveTrnCode Then
    ErrorBox "No Active " & mTitleName & " Entry to Cancel !!!"
    GoTo EndSub
End If
On Error GoTo errhand

m_dbBdkDatabase.BeginTrans
With t1Recset
.open "Select * from IndrBlDpogDtl where IbgdCode=" & CStr(mTrnCode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
t2Recset.open "Select * from IndrBlDpogDtl_Log where IbgdCode=" & CStr(mTrnCode) & " order by IbgdICode", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Do While .EOF = False
        t2Recset.Find "IbgdICode" & "=" & CStr(.fields("IbgdICode")), Start:=1
        If t2Recset.EOF = False Then
            mRecEdited = False
            mRecDeleted = False
            If .fields("IbgdRecState") = cREC_EDITED = True Then
                mRecEdited = True
            ElseIf .fields("IbgdRecState") = cREC_DELETED = True Then
                mRecDeleted = True
            End If
            mIbgdIgtCode = .fields("IbgdIgtCode")
            mIbgdDpogAmt = .fields("IbgdDpogAmt")
            
            Rem .fields("IbgdCode") = t2Recset.fields("IbgdCode")
            Rem .fields("IbgdICode") = t2Recset.fields("IbgdICode")
            .fields("IbgdSno") = t2Recset.fields("IbgdSno")
            .fields("IbgdIgtCode") = t2Recset.fields("IbgdIgtCode")
            .fields("IbgdDpogAmt") = t2Recset.fields("IbgdDpogAmt")
            .fields("IbgdRemark") = t2Recset.fields("IbgdRemark")
            .fields("IbgdCmpCode") = t2Recset.fields("IbgdCmpCode")
            .fields("IbgdRecState") = t2Recset.fields("IbgdRecState")
            
            .Update
            
            If mRecEdited = True Then
                If mIbgdIgtCode <> .fields("IbgdIgtCode") Then
                    m_dbBdkDatabase.Execute "Update IndrRgPymt set IgtAdjAmt=IgtAdjAmt-" & CStr(mIbgdDpogAmt) & ",IgtBalAmt=IgtBalAmt+" & CStr(mIbgdDpogAmt) & " where IgtCode=" & CStr(mIbgdIgtCode) & ""                                      ''' removing adjusted amount for old receipt
                    m_dbBdkDatabase.Execute "Update IndrRgPymt set IgtAdjAmt=IgtAdjAmt+" & CStr(.fields("IbgdDpogAmt")) & ",IgtBalAmt=IgtBalAmt-" & CStr(.fields("IbgdDpogAmt")) & " where IgtCode=" & CStr(.fields("IbgdIgtCode")) & ""        ''' adding adjusted amount to new receipt
                ElseIf mIbgdDpogAmt <> .fields("IbgdDpogAmt") Then
                    mIbgdDpogAmt = .fields("IbgdDpogAmt") - mIbgdDpogAmt
                    m_dbBdkDatabase.Execute "Update IndrRgPymt set IgtAdjAmt=IgtAdjAmt+" & CStr(mIbgdDpogAmt) & ",IgtBalAmt=IgtBalAmt-" & CStr(mIbgdDpogAmt) & " where IgtCode=" & CStr(mIbgdIgtCode) & ""                                      ''' adding/removing difference adjusted amount for same receipt
                End If
            ElseIf mRecDeleted = True Then
                m_dbBdkDatabase.Execute "Update IndrRgPymt set IgtAdjAmt=IgtAdjAmt+" & CStr(.fields("IbgdDpogAmt")) & ",IgtBalAmt=IgtBalAmt-" & CStr(.fields("IbgdDpogAmt")) & " where IgtCode=" & CStr(.fields("IbgdIgtCode")) & ""            ''' adding adjusted amount to new receipt
            End If
            
        Else
            mRecAdded = False
            mRecCanceled = False
            If .fields("IbgdRecState") = cREC_ADDED = True Then
                mRecAdded = True
            ElseIf .fields("IbgdRecState") = cREC_CANCELED = True Then
                mRecCanceled = True
            End If
            mIbgdIgtCode = .fields("IbgdIgtCode")
            mIbgdDpogAmt = .fields("IbgdDpogAmt")
            ' --------------------------------
            .fields("IbgdRecState") = ChkDeleteRecStatus(.fields("IbgdRecState"))
            .Update
            .Delete
            ' ---------------------------------
            If mRecAdded = True Then
                m_dbBdkDatabase.Execute "Update IndrRgPymt set IgtAdjAmt=IgtAdjAmt-" & CStr(mIbgdDpogAmt) & ",IgtBalAmt=IgtBalAmt+" & CStr(mIbgdDpogAmt) & " where IgtCode=" & CStr(mIbgdIgtCode) & ""                                      ''' removing adjusted amount for old receipt
            End If
            
        End If
        .MoveNext
    Loop
End If
End With
CloseTable t1Recset
CloseTable t2Recset
m_dbBdkDatabase.CommitTrans

CancelDpogTran = True
GoTo EndSub

errhand:
MsgBox Err.Description
m_dbBdkDatabase.Cancel

EndSub:
CloseTable t1Recset, mCheckOpen:=True
CloseTable t2Recset, mCheckOpen:=True
Exit Function

End Function

Rem so far not used anywhere, not need at all !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
Rem checks entries with log table, if log exist restores log records else delete records (assuming new records added), balance updation part not done here because master entries does not have effect while in process
Public Function CancelRfugTran(ByVal mTrnCode As Long) As Boolean
Dim t1Recset As New ADODB.Recordset, t2Recset As New ADODB.Recordset
Dim mIbgfIgfCode As Long, mIbgfRfugAmt As Double
Dim mRecAdded As Boolean, mRecEdited As Boolean, mRecDeleted As Boolean, mRecCanceled As Boolean

CancelRfugTran = False
If Chk_ActiveTran() = False Or mTrnCode <> ActiveTrnCode Then
    ErrorBox "No Active " & mTitleName & " Entry to Cancel !!!"
    GoTo EndSub
End If
On Error GoTo errhand

m_dbBdkDatabase.BeginTrans
With t1Recset
.open "Select * from IndrBlRfugDtl where IbgfCode=" & CStr(mTrnCode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
t2Recset.open "Select * from IndrBlRfugDtl_Log where IbgfCode=" & CStr(mTrnCode) & " order by IbgfICode", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Do While .EOF = False
        t2Recset.Find "IbgfICode" & "=" & CStr(.fields("IbgfICode")), Start:=1
        If t2Recset.EOF = False Then
            mRecEdited = False
            mRecDeleted = False
            If .fields("IbgfRecState") = cREC_EDITED = True Then
                mRecEdited = True
            ElseIf .fields("IbgfRecState") = cREC_DELETED = True Then
                mRecDeleted = True
            End If
            mIbgfIgfCode = .fields("IbgfIgfCode")
            mIbgfRfugAmt = .fields("IbgfRfugAmt")
            
            Rem .fields("IbgfCode") = t2Recset.fields("IbgfCode")
            Rem .fields("IbgfICode") = t2Recset.fields("IbgfICode")
            .fields("IbgfSno") = t2Recset.fields("IbgfSno")
            .fields("IbgfIgfCode") = t2Recset.fields("IbgfIgfCode")
            .fields("IbgfRfugAmt") = t2Recset.fields("IbgfRfugAmt")
            .fields("IbgfRemark") = t2Recset.fields("IbgfRemark")
            .fields("IbgfCmpCode") = t2Recset.fields("IbgfCmpCode")
            .fields("IbgfRecState") = t2Recset.fields("IbgfRecState")
            
            .Update
            
            If mRecEdited = True Then
                If mIbgfIgfCode <> .fields("IbgfIgfCode") Then
                    m_dbBdkDatabase.Execute "Update IndrRgRefd set IgfAdjAmt=IgfAdjAmt-" & CStr(mIbgfRfugAmt) & ",IgfBalAmt=IgfBalAmt+" & CStr(mIbgfRfugAmt) & " where IgfCode=" & CStr(mIbgfIgfCode) & ""                                      ''' removing adjusted amount for old receipt
                    m_dbBdkDatabase.Execute "Update IndrRgRefd set IgfAdjAmt=IgfAdjAmt+" & CStr(.fields("IbgfRfugAmt")) & ",IgfBalAmt=IgfBalAmt-" & CStr(.fields("IbgfRfugAmt")) & " where IgfCode=" & CStr(.fields("IbgfIgfCode")) & ""        ''' adding adjusted amount to new receipt
                ElseIf mIbgfRfugAmt <> .fields("IbgfRfugAmt") Then
                    mIbgfRfugAmt = .fields("IbgfRfugAmt") - mIbgfRfugAmt
                    m_dbBdkDatabase.Execute "Update IndrRgRefd set IgfAdjAmt=IgfAdjAmt+" & CStr(mIbgfRfugAmt) & ",IgfBalAmt=IgfBalAmt-" & CStr(mIbgfRfugAmt) & " where IgfCode=" & CStr(mIbgfIgfCode) & ""                                      ''' adding/removing difference adjusted amount for same receipt
                End If
            ElseIf mRecDeleted = True Then
                m_dbBdkDatabase.Execute "Update IndrRgRefd set IgfAdjAmt=IgfAdjAmt+" & CStr(.fields("IbgfRfugAmt")) & ",IgfBalAmt=IgfBalAmt-" & CStr(.fields("IbgfRfugAmt")) & " where IgfCode=" & CStr(.fields("IbgfIgfCode")) & ""            ''' adding adjusted amount to new receipt
            End If
            
        Else
            mRecAdded = False
            mRecCanceled = False
            If .fields("IbgfRecState") = cREC_ADDED = True Then
                mRecAdded = True
            ElseIf .fields("IbgfRecState") = cREC_CANCELED = True Then
                mRecCanceled = True
            End If
            mIbgfIgfCode = .fields("IbgfIgfCode")
            mIbgfRfugAmt = .fields("IbgfRfugAmt")
            ' --------------------------------
            .fields("IbgfRecState") = ChkDeleteRecStatus(.fields("IbgfRecState"))
            .Update
            .Delete
            ' ---------------------------------
            If mRecAdded = True Then
                m_dbBdkDatabase.Execute "Update IndrRgRefd set IgfAdjAmt=IgfAdjAmt-" & CStr(mIbgfRfugAmt) & ",IgfBalAmt=IgfBalAmt+" & CStr(mIbgfRfugAmt) & " where IgfCode=" & CStr(mIbgfIgfCode) & ""                                      ''' removing adjusted amount for old receipt
            End If
            
        End If
        .MoveNext
    Loop
End If
End With
CloseTable t1Recset
CloseTable t2Recset
m_dbBdkDatabase.CommitTrans

CancelRfugTran = True
GoTo EndSub

errhand:
MsgBox Err.Description
m_dbBdkDatabase.Cancel

EndSub:
CloseTable t1Recset, mCheckOpen:=True
CloseTable t2Recset, mCheckOpen:=True
Exit Function

End Function

Public Function DeleteTran(ByVal mTrnCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset

DeleteTran = False
If Chk_ActiveTran() = False Or mTrnCode <> ActiveTrnCode Then
    ErrorBox "clsHmsIpdMultiTranEntry_DeleteTran_#551_[InActive Transaction Entry]"
    GoTo EndSub
End If
On Error GoTo errhand

Rem header section
m_dbBdkDatabase.BeginTrans
With tRecset
.open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
.fields(mTrnHdrRecStateField) = ChkDeleteRecStatus(.fields(mTrnHdrRecStateField))
.Update
'' .Delete deleted in update transaction

End With
CloseTable tRecset
m_dbBdkDatabase.CommitTrans

Rem detail section
m_dbBdkDatabase.BeginTrans
With tRecset
.open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnDtlICodeField & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
Do While .EOF = False
    .fields(mTrnDtlRecStateField) = ChkDeleteRecStatus(.fields(mTrnDtlRecStateField))
    .Update
    '' .Delete deleted in update transaction
    
    If blnIndrPymtTran = True Then
        DispersePropRcptDepoAmt .fields("IpyIhrCode"), (.fields("IpyDepoAmt") * -1)
    ElseIf blnIndrRefdTran = True Then
        DispersePropRcptRefuAmt .fields("IfdIhrCode"), (.fields("IfdRefuAmt") * -1)
    ElseIf blnIndrBlPymtTran = True Then
        DispersePropBillDepoAmt .fields("IbpyIbhCode"), (.fields("IbpyDepoAmt") * -1)
    ElseIf blnIndrBlRefdTran = True Then
        DispersePropBillRefuAmt .fields("IbfdIbhCode"), (.fields("IbfdRefuAmt") * -1)
    End If
    
    .MoveNext
Loop
End With
CloseTable tRecset
m_dbBdkDatabase.CommitTrans

Rem service doctor detail deletion marking
If blnIndrRcptTran = True Or blnIndrBillTran = True Then
    m_dbBdkDatabase.BeginTrans
    With tRecset
    .open "Select * from " & mTrnSdcTableName & " where " & mTrnSdcCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnSdcICodeField & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
    Do While .EOF = False
        .fields(mTrnSdcRecStateField) = ChkDeleteRecStatus(.fields(mTrnSdcRecStateField))
        .Update
        
        .MoveNext
    Loop
    End With
    CloseTable tRecset
    m_dbBdkDatabase.CommitTrans
End If

Rem indoor bill bed status detail
m_dbBdkDatabase.BeginTrans
With tRecset
.open "Select * from IndrBlIbsDtl where IbbsCode=" & CStr(mTrnCode) & " order by IbbsICode", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
Do While .EOF = False
    .fields("IbbsRecState") = ChkDeleteRecStatus(.fields("IbbsRecState"))
    .Update
    
    .MoveNext
Loop
End With
CloseTable tRecset
m_dbBdkDatabase.CommitTrans

Rem indoor bill on a/c payment adjustment detail deletion marking
If blnIndrBillTran = True Then
    m_dbBdkDatabase.BeginTrans
    With tRecset
    .open "Select * from IndrBlDpogDtl where IbgdCode=" & CStr(mTrnCode) & " order by IbgdICode" & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
    Do While .EOF = False
        .fields("IbgdRecState") = ChkDeleteRecStatus(.fields("IbgdRecState"))
        .Update
        ' ----------------------
        m_dbBdkDatabase.Execute "Update IndrRgPymt set IgtAdjAmt=IgtAdjAmt-" & CStr(.fields("IbgdDpogAmt")) & ",IgtBalAmt=IgtBalAmt+" & CStr(.fields("IbgdDpogAmt")) & " where IgtCode=" & CStr(.fields("IbgdIgtCode")) & ""                                      ''' removing adjusted amount for old receipt
        ' ----------------------
        .MoveNext
    Loop
    End With
    CloseTable tRecset
    m_dbBdkDatabase.CommitTrans
End If

Rem indoor bill on a/c refund adjustment detail deletion marking
If blnIndrBillTran = True Then
    m_dbBdkDatabase.BeginTrans
    With tRecset
    .open "Select * from IndrBlRfugDtl where IbgfCode=" & CStr(mTrnCode) & " order by IbgfICode" & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
    Do While .EOF = False
        .fields("IbgfRecState") = ChkDeleteRecStatus(.fields("IbgfRecState"))
        .Update
        ' ----------------------
        m_dbBdkDatabase.Execute "Update IndrRgRefd set IgfAdjAmt=IgfAdjAmt-" & CStr(.fields("IbgfRfugAmt")) & ",IgfBalAmt=IgfBalAmt+" & CStr(.fields("IbgfRfugAmt")) & " where IgfCode=" & CStr(.fields("IbgfIgfCode")) & ""                                      ''' removing adjusted amount for old receipt
        ' ----------------------
        .MoveNext
    Loop
    End With
    CloseTable tRecset
    m_dbBdkDatabase.CommitTrans
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
    ErrorBox "clsHmsIpdMultiTranEntry_SelectTran_#412_[Invalid " & mTitleName & " Entry]"
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
    ErrorBox "clsHmsIpdMultiTranEntry_NextTran_#432_[End of " & mTitleName & " Entry]"
    Exit Function
End If
mActiveTran = mActiveTran + 1

NextTran = True
End Function

Public Function PreviousTran()
PreviousTran = False
If BOTrn = True Then
    ErrorBox "clsHmsIpdMultiTranEntry_PreviousTran_#443_[Begining of " & mTitleName & " Entry]"
    Exit Function
End If
mActiveTran = mActiveTran - 1

PreviousTran = True
End Function

Public Function FirstTran() As Boolean
FirstTran = False
If CountTran = 0 Then
    ErrorBox "clsHmsIpdMultiTranEntry_FirstTran_#454_[No " & mTitleName & " Entry]"
    Exit Function
End If
mActiveTran = LBound(aHmsTran)

FirstTran = True

End Function

Public Function LastTran() As Boolean
LastTran = False
If CountTran = 0 Then
    ErrorBox "clsHmsIpdMultiTranEntry_LastTran_#466_[No " & mTitleName & " Entry]"
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
    ErrorBox "clsHmsIpdMultiTranEntry_AddNewHdr_#736_[InActive " & mTitleName & " Entry]"
    GoTo EndSub
End If

On Error GoTo errhand
mTrnCode_lng = 0

m_dbBdkDatabase.BeginTrans
With tRecset
.open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=-0.1", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic

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

ElseIf blnIndrBillTran = True Then
    .fields("IbhIpgCode") = mIbhIpgCode_lng
    .fields("IbhTime") = mIbhTime_lng
    .fields("IbhOldIbhCode") = mIbhOldIbhCode_lng
    .fields("IbhPttCode") = mIbhPttCode_lng
    .fields("IbhPttDiscPer") = mIbhPttDiscPer_dbl
    .fields("IbhAmtBefDisc") = mIbhAmtBefDisc_dbl
    .fields("IbhDiscAmt") = mIbhDiscAmt_dbl
    .fields("IbhAmtAftDisc") = mIbhAmtAftDisc_dbl
    .fields("IbhAdvAmt") = mIbhAdvAmt_dbl
    .fields("IbhDpogAmt") = mIbhDpogAmt_dbl
    .fields("IbhDepoAmt") = mIbhDepoAmt_dbl
    .fields("IbhRfugAmt") = mIbhRfugAmt_dbl
    .fields("IbhRefuAmt") = mIbhRefuAmt_dbl
    .fields("IbhBalAmt") = mIbhBalAmt_dbl
    .fields("IbhRemark") = mIbhRemark_str

ElseIf blnIndrBlPymtTran = True Then
    .fields("IbphIpgCode") = mIbphIpgCode_lng
    .fields("IbphTime") = mIbphTime_lng
    .fields("IbphOldIbphCode") = mIbphOldIbphCode_lng
    .fields("IbphPttCode") = mIbphPttCode_lng
    .fields("IbphDepoAmt") = mIbphDepoAmt_dbl
    .fields("IbphRemark") = mIbphRemark_str
    
ElseIf blnIndrBlRefdTran = True Then
    .fields("IbfhIpgCode") = mIbfhIpgCode_lng
    .fields("IbfhTime") = mIbfhTime_lng
    .fields("IbfhOldIbfhCode") = mIbfhOldIbfhCode_lng
    .fields("IbfhPttCode") = mIbfhPttCode_lng
    .fields("IbfhRefuAmt") = mIbfhRefuAmt_dbl
    .fields("IbfhRemark") = mIbfhRemark_str

Else
    ErrorBox "clsHmsIpdMultiTranEntry_AddNewHdr_#776_[Undefined Case]"
End If
.Update

mTrnCode_lng = .fields(mTrnHdrCodeField)
End With
m_dbBdkDatabase.CommitTrans
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
    ErrorBox "clsHmsIpdMultiTranEntry_AddNewDtl_#810_[InActive " & mTitleName & " Entry]"
    GoTo EndSub
End If

On Error GoTo errhand
mTmpDtlICode = mTrnDtlICode_lng
mTrnDtlICode_lng = 0

m_dbBdkDatabase.BeginTrans
With tRecset
.open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=-0.1", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
.AddNew

Rem .fields(mTrnDtlICodeField) = AutoNumber
.fields(mTrnDtlCodeField) = mTrnCode
.fields(mTrnDtlSnoField) = mTrnDtlSno_int
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
    
    DispersePropRcptDepoAmt mIpyIhrCode_lng, mIpyDepoAmt_dbl
    
ElseIf blnIndrRefdTran = True Then
    .fields("IfdPttCode") = mIfdPttCode_lng
    .fields("IfdIhrCode") = mIfdIhrCode_lng
    .fields("IfdRefuAmt") = mIfdRefuAmt_dbl
    .fields("IfdRemark") = mIfdRemark_str
    
    DispersePropRcptRefuAmt mIfdIhrCode_lng, mIfdRefuAmt_dbl
    
ElseIf blnIndrBillTran = True Then
    .fields("IblIpgCode") = mIblIpgCode_lng
    .fields("IblPttCode") = mIblPttCode_lng
    .fields("IblSrvCode") = mIblSrvCode_dbl
    .fields("IblUnit") = mIblUnit_dbl
    .fields("IblRate") = mIblRate_dbl
    .fields("IblAmtBefDisc") = mIblAmtBefDisc_dbl
    .fields("IblDiscPer") = mIblDiscPer_dbl
    .fields("IblDiscAmt") = mIblDiscAmt_dbl
    .fields("IblAmtAftDisc") = mIblAmtAftDisc_dbl
    .fields("IblAdvAmt") = mIblAdvAmt_dbl
    .fields("IblDpogAmt") = mIblDpogAmt_dbl
    .fields("IblDepoAmt") = mIblDepoAmt_dbl
    .fields("IblRfugAmt") = mIblRfugAmt_dbl
    .fields("IblRefuAmt") = mIblRefuAmt_dbl
    .fields("IblBalAmt") = mIblBalAmt_dbl
    .fields("IblRemark") = mIblRemark_str
    
ElseIf blnIndrBlPymtTran = True Then
    .fields("IbpyPttCode") = mIbpyPttCode_lng
    .fields("IbpyIbhCode") = mIbpyIbhCode_lng
    .fields("IbpyDepoAmt") = mIbpyDepoAmt_dbl
    .fields("IbpyRemark") = mIbpyRemark_str
    
    DispersePropBillDepoAmt mIbpyIbhCode_lng, mIbpyDepoAmt_dbl
    
ElseIf blnIndrBlRefdTran = True Then
    .fields("IbfdPttCode") = mIbfdPttCode_lng
    .fields("IbfdIbhCode") = mIbfdIbhCode_lng
    .fields("IbfdRefuAmt") = mIbfdRefuAmt_dbl
    .fields("IbfdRemark") = mIbfdRemark_str
    
    DispersePropBillRefuAmt mIbfdIbhCode_lng, mIbfdRefuAmt_dbl
    
Else
    ErrorBox "clsHmsIpdMultiTranEntry_AddNewDtl_#844_[Undefined Case]"
End If
.Update

mTrnDtlICode_lng = .fields(mTrnDtlICodeField)
End With
CloseTable tRecset
m_dbBdkDatabase.CommitTrans

Rem service doctor detail link code updation if any
If blnIndrRcptTran = True Or blnIndrBillTran = True Then
    m_dbBdkDatabase.BeginTrans
    With tRecset
    .open "Select * from " & mTrnSdcTableName & " where " & mTrnSdcCodeField & "=" & CStr(mTrnCode) & " and " & mTrnSdcSubCodeField & "=" & CStr(mTmpDtlICode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
    If .EOF = False Then
        Do While .EOF = False
            .fields(mTrnSdcSubCodeField) = mTrnDtlICode_lng
            .Update
            
            .MoveNext
        Loop
    End If
    End With
    CloseTable tRecset
    m_dbBdkDatabase.CommitTrans
End If

If blnIndrBillTran = True Then
    If mIbbsIbsCode_lng > 0 Then
        AddNewIbbs mTrnCode, mTrnDtlICode_lng
    End If
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
    m_dbBdkDatabase.BeginTrans
    With tRecset
    .open "Select * from " & mTrnSdcTableName & " where " & mTrnSdcICodeField & "=" & CStr(-0.1) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
    
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
    
    m_dbBdkDatabase.CommitTrans
End If
GoTo EndSub

errhand:
MsgBox Err.Description
m_dbBdkDatabase.Cancel

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Sub

End Sub

Public Function AddNewIbbs(ByVal mTrnCode As Long, ByVal mTrnICode As Long) As Boolean  ''' IblCode, IblICode
Dim tRecset As New ADODB.Recordset

AddNewIbbs = False
If Chk_ActiveTran() = False Or mTrnCode <> ActiveTrnCode Then
    ErrorBox "clsHmsIpdMultiTranEntry_AddNewIbbs_#810_[InActive " & mTitleName & " Entry]"
    GoTo EndSub
End If

On Error GoTo errhand
mIbbsICode_lng = 0

m_dbBdkDatabase.BeginTrans
With tRecset
.open "Select * from IndrBlIbsDtl where IbbsCode=-0.1", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
.AddNew

Rem .fields("IbbsICode") = AutoNumber
.fields("IbbsCode") = mTrnCode
.fields("IbbsIblICode") = mTrnICode
.fields("IbbsIbsCode") = mIbbsIbsCode_lng
.fields("IbbsIpgCode") = mIbbsIpgCode_lng
.fields("IbbsSno") = mIbbsSno_int
.fields("IbbsFromDate") = mIbbsFromDate_dt
.fields("IbbsFromTime") = mIbbsFromTime_lng
.fields("IbbsToDate") = mIbbsToDate_dt
.fields("IbbsToTime") = mIbbsToTime_lng
.fields("IbbsUnit") = mIbbsUnit_int
.fields("IbbsRemark") = mIbbsRemark_str
.fields("IbbsCmpCode") = mIbbsCmpCode_int
.fields("IbbsRecState") = cREC_ADDED
.Update

mIbbsICode_lng = .fields("IbbsICode")
End With
CloseTable tRecset
m_dbBdkDatabase.CommitTrans

AddNewIbbs = True
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

Public Function AddNewDpog(ByVal mTrnCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset, mCanAddNew As Boolean, mLCount As Integer, mUCount As Integer, acount As Integer

On Error GoTo errhand
mCanAddNew = True
AddNewDpog = False
mIbgdICode_lng = 0
If mCanAddNew = True Then
    m_dbBdkDatabase.BeginTrans
    With tRecset
    .open "Select * from IndrBlDpogDtl where IbgdCode=-0.1", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
    .AddNew
    
    .fields("IbgdCode") = mTrnCode
    Rem .fields("IbgdICode") = mIbgdICode_Lng AutoNumber
    .fields("IbgdSno") = mIbgdSno_int
    .fields("IbgdIgtCode") = mIbgdIgtCode_lng
    .fields("IbgdDpogAmt") = mIbgdDpogAmt_dbl
    .fields("IbgdRemark") = mIbgdRemark_str
    .fields("IbgdCmpCode") = mIbgdCmpCode_int
    .fields("IbgdRecState") = cREC_ADDED
    
    .Update
    mIbgdICode_lng = .fields("IbgdICode")
    End With
    CloseTable tRecset
    ' ----------------------
    m_dbBdkDatabase.Execute "Update IndrRgPymt set IgtAdjAmt=IgtAdjAmt+" & CStr(mIbgdDpogAmt_dbl) & ",IgtBalAmt=IgtBalAmt-" & CStr(mIbgdDpogAmt_dbl) & " where IgtCode=" & CStr(mIbgdIgtCode_lng) & ""
    ' ----------------------
    m_dbBdkDatabase.CommitTrans
    
End If
AddNewDpog = True
GoTo EndSub

errhand:
MsgBox Err.Description
m_dbBdkDatabase.Cancel

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Function

End Function

Public Function AddNewRfug(ByVal mTrnCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset, mCanAddNew As Boolean, mLCount As Integer, mUCount As Integer, acount As Integer

On Error GoTo errhand
mCanAddNew = True
AddNewRfug = False
mIbgfICode_lng = 0
If mCanAddNew = True Then
    m_dbBdkDatabase.BeginTrans
    With tRecset
    .open "Select * from IndrBlRfugDtl where IbgfCode=-0.1", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
    .AddNew
    
    .fields("IbgfCode") = mTrnCode
    Rem .fields("IbgfICode") = mIbgfICode_Lng AutoNumber
    .fields("IbgfSno") = mIbgfSno_int
    .fields("IbgfIgfCode") = mIbgfIgfCode_lng
    .fields("IbgfRfugAmt") = mIbgfRfugAmt_dbl
    .fields("IbgfRemark") = mIbgfRemark_str
    .fields("IbgfCmpCode") = mIbgfCmpCode_int
    .fields("IbgfRecState") = cREC_ADDED
    
    .Update
    mIbgfICode_lng = .fields("IbgfICode")
    End With
    CloseTable tRecset
    ' ----------------------
    m_dbBdkDatabase.Execute "Update IndrRgRefd set IgfAdjAmt=IgfAdjAmt+" & CStr(mIbgfRfugAmt_dbl) & ",IgfBalAmt=IgfBalAmt-" & CStr(mIbgfRfugAmt_dbl) & " where IgfCode=" & CStr(mIbgfIgfCode_lng) & ""
    ' ----------------------
    m_dbBdkDatabase.CommitTrans
    
End If
AddNewRfug = True
GoTo EndSub

errhand:
MsgBox Err.Description
m_dbBdkDatabase.Cancel

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Function

End Function

Public Function UpdateHdr(ByVal mTrnCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset

UpdateHdr = False
If Chk_ActiveTran() = False Or mTrnCode <> ActiveTrnCode Then
    ErrorBox "clsHmsIpdMultiTranEntry_UpdateDtl_#874_[InActive " & mTitleName & " Entry]"
    GoTo EndSub
End If

On Error GoTo errhand

m_dbBdkDatabase.BeginTrans
With tRecset
.open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic

Rem .Fields(mTrnHdrCodeField) = AutoNumber
.fields(mTrnHdrDateField) = mTrnDate_dt
.fields(mTrnVtmField) = mTrnVtmCode_lng
.fields(mTrnPrefixField) = mTrnPrefix_str
.fields(mTrnVchNoField) = mTrnVchNo_lng
.fields(mTrnPostfixField) = mTrnPostfix_str
Rem .fields(mTrnHdrCmpCodeField) = mTrnCmpCode_int
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
    
ElseIf blnIndrBillTran = True Then
    .fields("IbhIpgCode") = mIbhIpgCode_lng
    .fields("IbhTime") = mIbhTime_lng
    .fields("IbhOldIbhCode") = mIbhOldIbhCode_lng
    .fields("IbhPttCode") = mIbhPttCode_lng
    .fields("IbhPttDiscPer") = mIbhPttDiscPer_dbl
    .fields("IbhAmtBefDisc") = mIbhAmtBefDisc_dbl
    .fields("IbhDiscAmt") = mIbhDiscAmt_dbl
    .fields("IbhAmtAftDisc") = mIbhAmtAftDisc_dbl
    .fields("IbhAdvAmt") = mIbhAdvAmt_dbl
    .fields("IbhDpogAmt") = mIbhDpogAmt_dbl
    .fields("IbhDepoAmt") = mIbhDepoAmt_dbl
    .fields("IbhRfugAmt") = mIbhRfugAmt_dbl
    .fields("IbhRefuAmt") = mIbhRefuAmt_dbl
    .fields("IbhBalAmt") = mIbhBalAmt_dbl
    .fields("IbhRemark") = mIbhRemark_str
    
ElseIf blnIndrBlPymtTran = True Then
    .fields("IbphIpgCode") = mIbphIpgCode_lng
    .fields("IbphTime") = mIbphTime_lng
    .fields("IbphOldIbphCode") = mIbphOldIbphCode_lng
    .fields("IbphPttCode") = mIbphPttCode_lng
    .fields("IbphDepoAmt") = mIbphDepoAmt_dbl
    .fields("IbphRemark") = mIbphRemark_str
    
ElseIf blnIndrBlRefdTran = True Then
    .fields("IbfhIpgCode") = mIbfhIpgCode_lng
    .fields("IbfhTime") = mIbfhTime_lng
    .fields("IbfhOldIbfhCode") = mIbfhOldIbfhCode_lng
    .fields("IbfhPttCode") = mIbfhPttCode_lng
    .fields("IbfhRefuAmt") = mIbfhRefuAmt_dbl
    .fields("IbfhRemark") = mIbfhRemark_str
    
Else
    ErrorBox "clsHmsIpdMultiTranEntry_UpdateHdr_#911_[Undefined Case]"
End If
.Update
End With
m_dbBdkDatabase.CommitTrans
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
Dim mIbpyIbhCode As Long, mIbpyDepoAmt As Double
Dim mIbfdIbhCode As Long, mIbfdRefuAmt As Double

UpdateDtl = False
If Chk_ActiveTran() = False Or mTrnCode <> ActiveTrnCode Then
    ErrorBox "clsHmsIpdMultiTranEntry_UpdateDtl_#936_[InActive " & mTitleName & " Entry]"
    GoTo EndSub
End If

On Error GoTo errhand

m_dbBdkDatabase.BeginTrans
With tRecset
.open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " and " & mTrnDtlICodeField & "=" & CStr(mTrnICode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic

Rem .fields(mTrnDtlICodeField) = AutoNumber
Rem .fields(mTrnDtlCodeField) = mTrnCode_lng
.fields(mTrnDtlSnoField) = mTrnDtlSno_int
.fields(mTrnDtlDateField) = mTrnDate_dt
Rem .fields(mTrnDtlCmpCodeField) = mTrnCmpCode_int
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
    
ElseIf blnIndrBillTran = True Then
    .fields("IblIpgCode") = mIblIpgCode_lng
    .fields("IblPttCode") = mIblPttCode_lng
    .fields("IblSrvCode") = mIblSrvCode_dbl
    .fields("IblUnit") = mIblUnit_dbl
    .fields("IblRate") = mIblRate_dbl
    .fields("IblAmtBefDisc") = mIblAmtBefDisc_dbl
    .fields("IblDiscPer") = mIblDiscPer_dbl
    .fields("IblDiscAmt") = mIblDiscAmt_dbl
    .fields("IblAmtAftDisc") = mIblAmtAftDisc_dbl
    .fields("IblAdvAmt") = mIblAdvAmt_dbl
    .fields("IblDpogAmt") = mIblDpogAmt_dbl
    .fields("IblDepoAmt") = mIblDepoAmt_dbl
    .fields("IblRfugAmt") = mIblRfugAmt_dbl
    .fields("IblRefuAmt") = mIblRefuAmt_dbl
    .fields("IblBalAmt") = mIblBalAmt_dbl
    .fields("IblRemark") = mIblRemark_str
    
ElseIf blnIndrBlPymtTran = True Then
    mIbpyIbhCode = .fields("IbpyIbhCode")
    mIbpyDepoAmt = .fields("IbpyDepoAmt")
    
    .fields("IbpyPttCode") = mIbpyPttCode_lng
    .fields("IbpyIbhCode") = mIbpyIbhCode_lng
    .fields("IbpyDepoAmt") = mIbpyDepoAmt_dbl
    .fields("IbpyRemark") = mIbpyRemark_str
    
ElseIf blnIndrBlRefdTran = True Then
    mIbfdIbhCode = .fields("IbfdIbhCode")
    mIbfdRefuAmt = .fields("IbfdRefuAmt")
    
    .fields("IbfdPttCode") = mIbfdPttCode_lng
    .fields("IbfdIbhCode") = mIbfdIbhCode_lng
    .fields("IbfdRefuAmt") = mIbfdRefuAmt_dbl
    .fields("IbfdRemark") = mIbfdRemark_str
    
Else
    ErrorBox "clsHmsIpdMultiTranEntry_UpdateDtl_#966_[Undefined Case]"
End If
.Update

If blnIndrPymtTran = True Then
    If mIpyIhrCode <> .fields("IpyIhrCode") Then
        DispersePropRcptDepoAmt mIpyIhrCode, (mIpyDepoAmt * -1)                 ' removing deposit amount for old receipt
        DispersePropRcptDepoAmt .fields("IpyIhrCode"), .fields("IpyDepoAmt")    ' adding deposit amount to new receipt
    ElseIf mIpyDepoAmt <> .fields("IpyDepoAmt") Then
        mIpyDepoAmt = .fields("IpyDepoAmt") - mIpyDepoAmt
        DispersePropRcptDepoAmt mIpyIhrCode, mIpyDepoAmt
    End If
    
ElseIf blnIndrRefdTran = True Then
    If mIfdIhrCode <> .fields("IfdIhrCode") Then
        DispersePropRcptRefuAmt mIfdIhrCode, (mIfdRefuAmt * -1)                 ' removing refund amount for old receipt
        DispersePropRcptRefuAmt .fields("IfdIhrCode"), .fields("IfdRefuAmt")    ' adding refund amount to new receipt
    ElseIf mIfdRefuAmt <> .fields("IfdRefuAmt") Then
        mIfdRefuAmt = .fields("IfdRefuAmt") - mIfdRefuAmt
        DispersePropRcptRefuAmt mIfdIhrCode, mIfdRefuAmt
    End If
    
ElseIf blnIndrBlPymtTran = True Then
    If mIbpyIbhCode <> .fields("IbpyIbhCode") Then
        DispersePropBillDepoAmt mIbpyIbhCode, (mIbpyDepoAmt * -1)                 ' removing deposit amount for old receipt
        DispersePropBillDepoAmt .fields("IbpyIbhCode"), .fields("IbpyDepoAmt")    ' adding deposit amount to new receipt
    ElseIf mIbpyDepoAmt <> .fields("IbpyDepoAmt") Then
        mIbpyDepoAmt = .fields("IbpyDepoAmt") - mIbpyDepoAmt
        DispersePropBillDepoAmt mIbpyIbhCode, mIbpyDepoAmt
    End If
    
ElseIf blnIndrBlRefdTran = True Then
    If mIbfdIbhCode <> .fields("IbfdIbhCode") Then
        DispersePropBillRefuAmt mIbfdIbhCode, (mIbfdRefuAmt * -1)                 ' removing refund amount for old receipt
        DispersePropBillRefuAmt .fields("IbfdIbhCode"), .fields("IbfdRefuAmt")    ' adding refund amount to new receipt
    ElseIf mIbfdRefuAmt <> .fields("IbfdRefuAmt") Then
        mIbfdRefuAmt = .fields("IbfdRefuAmt") - mIbfdRefuAmt
        DispersePropBillRefuAmt mIbfdIbhCode, mIbfdRefuAmt
    End If
    
End If

End With
CloseTable tRecset
m_dbBdkDatabase.CommitTrans

Rem service doctor detail service change updation if any
If blnIndrRcptTran = True Or blnIndrBillTran = True Then
    m_dbBdkDatabase.BeginTrans
    With tRecset
    .open "Select * from " & mTrnSdcTableName & " where " & mTrnSdcCodeField & "=" & CStr(mTrnCode) & " and " & mTrnSdcSubCodeField & "=" & CStr(mTrnICode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
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
    m_dbBdkDatabase.CommitTrans
End If

If blnIndrBillTran = True Then
    If mIbbsICode_lng > 0 Then
        If mIbbsIbsCode_lng > 0 Then
            UpdateIbbs mTrnCode, mTrnICode, mIbbsICode_lng
        Else
            DeleteIbbs mTrnCode, mTrnICode, mIbbsICode_lng
        End If
    End If
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
    m_dbBdkDatabase.BeginTrans
    With tRecset
    .open "Select * from " & mTrnSdcTableName & " where " & mTrnSdcCodeField & "=" & CStr(mSdcCode) & " and " & mTrnSdcSubCodeField & "=" & CStr(mSdcSubCode) & " and " & mTrnSdcICodeField & "=" & CStr(mSdcICode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
    
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
    
    m_dbBdkDatabase.CommitTrans
End If
GoTo EndSub

errhand:
MsgBox Err.Description
m_dbBdkDatabase.Cancel

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Sub

End Sub

Public Function UpdateIbbs(ByVal mTrnCode As Long, ByVal mTrnICode As Long, ByVal mIbbsICode As Long) As Boolean      ''' IblCode, IblICode, IbbsICode
Dim tRecset As New ADODB.Recordset

UpdateIbbs = False
If Chk_ActiveTran() = False Or mTrnCode <> ActiveTrnCode Then
    ErrorBox "clsHmsIpdMultiTranEntry_UpdateIbbs_#936_[InActive " & mTitleName & " Entry]"
    GoTo EndSub
End If

On Error GoTo errhand

m_dbBdkDatabase.BeginTrans
With tRecset
.open "Select * from IndrBlIbsDtl where IbbsCode=" & CStr(mTrnCode) & " and IbbsIblICode=" & CStr(mTrnICode) & " and IbbsICode=" & CStr(mIbbsICode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic

Rem .fields("IbbsICode") = AutoNumber
Rem .fields("IbbsCode") = mTrnCode
Rem .fields("IbbsIblICode") = mTrnICode
.fields("IbbsIbsCode") = mIbbsIbsCode_lng
.fields("IbbsIpgCode") = mIbbsIpgCode_lng
.fields("IbbsSno") = mIbbsSno_int
.fields("IbbsFromDate") = mIbbsFromDate_dt
.fields("IbbsFromTime") = mIbbsFromTime_lng
.fields("IbbsToDate") = mIbbsToDate_dt
.fields("IbbsToTime") = mIbbsToTime_lng
.fields("IbbsUnit") = mIbbsUnit_int
.fields("IbbsRemark") = mIbbsRemark_str
Rem .fields("IbbsCmpCode") = mIbbsCmpCode_int
.fields("IbbsRecState") = ChkEditRecStatus(.fields("IbbsRecState"))
.Update
End With
CloseTable tRecset
m_dbBdkDatabase.CommitTrans

UpdateIbbs = True
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

Public Sub UpdateDpog(ByVal mTrnCode As Long, ByVal mTrnICode As Long)
Dim tRecset As New ADODB.Recordset, mCanUpdate As Boolean, mLCount As Integer, mUCount As Integer, acount As Integer
Dim mIbgdIgtCode As Long, mIbgdDpogAmt As Double

On Error GoTo errhand
mCanUpdate = True
mIbgdICode_lng = 0
If mCanUpdate = True Then
    m_dbBdkDatabase.BeginTrans
    With tRecset
    .open "Select * from IndrBlDpogDtl where IbgdCode=" & CStr(mTrnCode) & " and IbgdICode=" & CStr(mTrnICode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
    
    mIbgdIgtCode = .fields("IbgdIgtCode")
    mIbgdDpogAmt = .fields("IbgdDpogAmt")
    
    Rem .fields("IbgdCode") = mTrnCode_lng
    Rem .fields("IbgdICode") = mIbgdICode_lng AutoNumber
    .fields("IbgdSno") = mIbgdSno_int
    .fields("IbgdIgtCode") = mIbgdIgtCode_lng
    .fields("IbgdDpogAmt") = mIbgdDpogAmt_dbl
    .fields("IbgdRemark") = mIbgdRemark_str
    Rem .fields("IbgdCmpCode") = mIbgdCmpCode_int
    .fields("IbgdRecState") = ChkEditRecStatus(.fields("IbgdRecState"))
    
    .Update
    mIbgdICode_lng = .fields("IbgdICode")
    End With
    CloseTable tRecset
    ' ----------------------------------------------------
    If mIbgdIgtCode <> mIbgdIgtCode_lng Then
        m_dbBdkDatabase.Execute "Update IndrRgPymt set IgtAdjAmt=IgtAdjAmt-" & CStr(mIbgdDpogAmt) & ",IgtBalAmt=IgtBalAmt+" & CStr(mIbgdDpogAmt) & " where IgtCode=" & CStr(mIbgdIgtCode) & ""                  ''' removing adjusted amount for old receipt
        m_dbBdkDatabase.Execute "Update IndrRgPymt set IgtAdjAmt=IgtAdjAmt+" & CStr(mIbgdDpogAmt_dbl) & ",IgtBalAmt=IgtBalAmt-" & CStr(mIbgdDpogAmt_dbl) & " where IgtCode=" & CStr(mIbgdIgtCode_lng) & ""      ''' adding adjusted amount to new receipt
    ElseIf mIbgdDpogAmt <> mIbgdDpogAmt_dbl Then
        mIbgdDpogAmt = mIbgdDpogAmt_dbl - mIbgdDpogAmt
        m_dbBdkDatabase.Execute "Update IndrRgPymt set IgtAdjAmt=IgtAdjAmt+" & CStr(mIbgdDpogAmt) & ",IgtBalAmt=IgtBalAmt-" & CStr(mIbgdDpogAmt) & " where IgtCode=" & CStr(mIbgdIgtCode) & ""                  ''' adding/removing difference adjusted amount for same receipt
    End If
    ' ----------------------------------------------------
    m_dbBdkDatabase.CommitTrans
    
End If
GoTo EndSub

errhand:
MsgBox Err.Description
m_dbBdkDatabase.Cancel

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Sub

End Sub

Public Sub UpdateRfug(ByVal mTrnCode As Long, ByVal mTrnICode As Long)
Dim tRecset As New ADODB.Recordset, mCanUpdate As Boolean, mLCount As Integer, mUCount As Integer, acount As Integer
Dim mIbgfIgfCode As Long, mIbgfRfugAmt As Double

On Error GoTo errhand
mCanUpdate = True
mIbgfICode_lng = 0
If mCanUpdate = True Then
    m_dbBdkDatabase.BeginTrans
    With tRecset
    .open "Select * from IndrBlRfugDtl where IbgfCode=" & CStr(mTrnCode) & " and IbgfICode=" & CStr(mTrnICode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
    
    mIbgfIgfCode = .fields("IbgfIgfCode")
    mIbgfRfugAmt = .fields("IbgfRfugAmt")
    
    Rem .fields("IbgfCode") = mTrnCode_lng
    Rem .fields("IbgfICode") = mIbgfICode_lng AutoNumber
    .fields("IbgfSno") = mIbgfSno_int
    .fields("IbgfIgfCode") = mIbgfIgfCode_lng
    .fields("IbgfRfugAmt") = mIbgfRfugAmt_dbl
    .fields("IbgfRemark") = mIbgfRemark_str
    Rem .fields("IbgfCmpCode") = mIbgfCmpCode_int
    .fields("IbgfRecState") = ChkEditRecStatus(.fields("IbgfRecState"))
    
    .Update
    mIbgfICode_lng = .fields("IbgfICode")
    End With
    CloseTable tRecset
    ' ----------------------------------------------------
    If mIbgfIgfCode <> mIbgfIgfCode_lng Then
        m_dbBdkDatabase.Execute "Update IndrRgRefd set IgfAdjAmt=IgfAdjAmt-" & CStr(mIbgfRfugAmt) & ",IgfBalAmt=IgfBalAmt+" & CStr(mIbgfRfugAmt) & " where IgfCode=" & CStr(mIbgfIgfCode) & ""                  ''' removing adjusted amount for old receipt
        m_dbBdkDatabase.Execute "Update IndrRgRefd set IgfAdjAmt=IgfAdjAmt+" & CStr(mIbgfRfugAmt_dbl) & ",IgfBalAmt=IgfBalAmt-" & CStr(mIbgfRfugAmt_dbl) & " where IgfCode=" & CStr(mIbgfIgfCode_lng) & ""      ''' adding adjusted amount to new receipt
    ElseIf mIbgfRfugAmt <> mIbgfRfugAmt_dbl Then
        mIbgfRfugAmt = mIbgfRfugAmt_dbl - mIbgfRfugAmt
        m_dbBdkDatabase.Execute "Update IndrRgRefd set IgfAdjAmt=IgfAdjAmt+" & CStr(mIbgfRfugAmt) & ",IgfBalAmt=IgfBalAmt-" & CStr(mIbgfRfugAmt) & " where IgfCode=" & CStr(mIbgfIgfCode) & ""                  ''' adding/removing difference adjusted amount for same receipt
    End If
    ' ----------------------------------------------------
    m_dbBdkDatabase.CommitTrans
    
End If
GoTo EndSub

errhand:
MsgBox Err.Description
m_dbBdkDatabase.Cancel

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Sub

End Sub

Public Function DeleteDtl(ByVal mTrnCode As Long, ByVal mTrnICode As Long, Optional mConfirm As Boolean) As Boolean
Dim tRecset As New ADODB.Recordset, mDeleteit As Boolean

DeleteDtl = False
If Chk_ActiveTran() = False Or mTrnCode <> ActiveTrnCode Then
    ErrorBox "clsHmsIpdMultiTranEntry_DeleteDtl_#995_[InActive " & mTitleName & " Entry]"
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
    
    m_dbBdkDatabase.BeginTrans
    With tRecset
    .open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " and " & mTrnDtlICodeField & "=" & CStr(mTrnICode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
    
    .fields(mTrnDtlRecStateField) = ChkDeleteRecStatus(.fields(mTrnDtlRecStateField))
    .Update
    End With
    If blnIndrPymtTran = True Then
        DispersePropRcptDepoAmt tRecset.fields("IpyIhrCode"), (tRecset.fields("IpyDepoAmt") * -1)
    ElseIf blnIndrRefdTran = True Then
        DispersePropRcptRefuAmt tRecset.fields("IfdIhrCode"), (tRecset.fields("IfdRefuAmt") * -1)
    ElseIf blnIndrBlPymtTran = True Then
        DispersePropBillDepoAmt tRecset.fields("IbpyIbhCode"), (tRecset.fields("IbpyDepoAmt") * -1)
    ElseIf blnIndrBlRefdTran = True Then
        DispersePropBillRefuAmt tRecset.fields("IbfdIbhCode"), (tRecset.fields("IbfdRefuAmt") * -1)
    End If
    CloseTable tRecset
    m_dbBdkDatabase.CommitTrans
    
    Rem service doctor detail deletion
    If blnIndrRcptTran = True Or blnIndrBillTran = True Then
        m_dbBdkDatabase.BeginTrans
        With tRecset
        .open "Select * from " & mTrnSdcTableName & " where " & mTrnSdcCodeField & "=" & CStr(mTrnCode) & " and " & mTrnSdcSubCodeField & "=" & CStr(mTrnICode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
        If .EOF = False Then
            Do While .EOF = False
                .fields(mTrnSdcRecStateField) = ChkDeleteRecStatus(.fields(mTrnSdcRecStateField))
                .Update
                
                .MoveNext
            Loop
        End If
        End With
        CloseTable tRecset
        m_dbBdkDatabase.CommitTrans
    End If
    
    If blnIndrBillTran = True Then
        Rem important - take care to assign value to mIbbsICode_lng while calling DeleteDtl; Exceptional case not able to handle
        DeleteIbbs mTrnCode, mTrnICode, mIbbsICode_lng
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
    ErrorBox "clsHmsIpdMultiTranEntry_DeleteSdc_#2312_[InActive " & mTitleName & " Entry]"
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
    
    m_dbBdkDatabase.BeginTrans
    With tRecset
    .open "Select * from " & mTrnSdcTableName & " where " & mTrnSdcCodeField & "=" & CStr(mSdcCode) & " and " & mTrnSdcSubCodeField & "=" & mSdcSubCode & " and " & mTrnSdcICodeField & "=" & CStr(mSdcICode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
    
    .fields(mTrnSdcRecStateField) = ChkDeleteRecStatus(.fields(mTrnSdcRecStateField))
    .Update
    End With
    CloseTable tRecset
    m_dbBdkDatabase.CommitTrans
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

Public Function DeleteIbbs(ByVal mTrnCode As Long, ByVal mTrnICode As Long, ByVal mIbbsICode As Long, Optional mConfirm As Boolean) As Boolean      '' IblCode, IblICode, IbbsICode,
Dim tRecset As New ADODB.Recordset, mDeleteit As Boolean

DeleteIbbs = False
If Chk_ActiveTran() = False Or mTrnCode <> ActiveTrnCode Then
    ErrorBox "clsHmsIpdMultiTranEntry_DeleteIbbs_#995_[InActive " & mTitleName & " Entry]"
    GoTo EndSub
End If

DeleteIbbs = True

mDeleteit = True
If mDeleteit = True Then
    If mConfirm = True Then
        mDeleteit = CanDelete()
    End If
End If
If mDeleteit = True Then
    On Error GoTo errhand
    
    m_dbBdkDatabase.BeginTrans
    With tRecset
    .open "Select * from IndrBlIbsDtl where IbbsCode=" & CStr(mTrnCode) & " and IbbsIblICode=" & CStr(mTrnICode) & " and IbbsICode=" & CStr(mIbbsICode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
    If .EOF = False Then    ' entry will exist only for bed service and not for all services in indoor bill
        .fields("IbbsRecState") = ChkDeleteRecStatus(.fields("IbbsRecState"))
        .Update
    End If
    End With
    CloseTable tRecset
    m_dbBdkDatabase.CommitTrans

End If

DeleteIbbs = True
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

Public Function DeleteDpog(ByVal mTrnCode As Long, ByVal mTrnICode As Long, Optional mConfirm As Boolean) As Boolean
Dim tRecset As New ADODB.Recordset, mDeleteit As Boolean

DeleteDpog = False
If Chk_ActiveTran() = False Or mTrnCode <> ActiveTrnCode Then
    ErrorBox "clsHmsIpdMultiTranEntry_DeleteDpog_#2794_[InActive " & mTitleName & " Entry]"
    GoTo EndSub
End If

DeleteDpog = True

mDeleteit = True
If mDeleteit = True Then
    If mConfirm = True Then
        mDeleteit = CanDelete()
    End If
End If
If mDeleteit = True Then
    On Error GoTo errhand
    
    m_dbBdkDatabase.BeginTrans
    With tRecset
    .open "Select * from IndrBlDpogDtl where IbgdCode=" & CStr(mTrnCode) & " and IbgdICode=" & CStr(mTrnICode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
    
    .fields("IbgdRecState") = ChkDeleteRecStatus(.fields("IbgdRecState"))
    .Update
    
    ' ----------------------
    m_dbBdkDatabase.Execute "Update IndrRgPymt set IgtAdjAmt=IgtAdjAmt-" & CStr(.fields("IbgdDpogAmt")) & ",IgtBalAmt=IgtBalAmt+" & CStr(.fields("IbgdDpogAmt")) & " where IgtCode=" & CStr(.fields("IbgdIgtCode")) & ""                                      ''' removing adjusted amount for old receipt
    ' ----------------------
    End With
    CloseTable tRecset
    m_dbBdkDatabase.CommitTrans
End If

DeleteDpog = True
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

Public Function DeleteRfug(ByVal mTrnCode As Long, ByVal mTrnICode As Long, Optional mConfirm As Boolean) As Boolean
Dim tRecset As New ADODB.Recordset, mDeleteit As Boolean

DeleteRfug = False
If Chk_ActiveTran() = False Or mTrnCode <> ActiveTrnCode Then
    ErrorBox "clsHmsIpdMultiTranEntry_DeleteRfug_#2794_[InActive " & mTitleName & " Entry]"
    GoTo EndSub
End If

DeleteRfug = True

mDeleteit = True
If mDeleteit = True Then
    If mConfirm = True Then
        mDeleteit = CanDelete()
    End If
End If
If mDeleteit = True Then
    On Error GoTo errhand
    
    m_dbBdkDatabase.BeginTrans
    With tRecset
    .open "Select * from IndrBlRfugDtl where IbgfCode=" & CStr(mTrnCode) & " and IbgfICode=" & CStr(mTrnICode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
    
    .fields("IbgfRecState") = ChkDeleteRecStatus(.fields("IbgfRecState"))
    .Update
    
    ' ----------------------
    m_dbBdkDatabase.Execute "Update IndrRgRefd set IgfAdjAmt=IgfAdjAmt-" & CStr(.fields("IbgfRfugAmt")) & ",IgfBalAmt=IgfBalAmt+" & CStr(.fields("IbgfRfugAmt")) & " where IgfCode=" & CStr(.fields("IbgfIgfCode")) & ""                                      ''' removing adjusted amount for old receipt
    ' ----------------------
    End With
    CloseTable tRecset
    m_dbBdkDatabase.CommitTrans
End If

DeleteRfug = True
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

Private Sub DisperseFifoRcptDepoAmt(ByVal mIpyIhrCode As Long, ByVal mIpyDepoAmt_diff As Double)
Dim tRecset As New ADODB.Recordset, mIpyDepoAmtTot As Double, mReqdDepoAmt As Double

On Error GoTo errhand

mIpyDepoAmtTot = 0
With tRecset
.open "Select * from IndrRcpt where IrcCode=" & CStr(mIpyIhrCode) & " order by IrcSno" & IIf(mIpyDepoAmt_diff < 0, " desc", ""), m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 And mIpyDepoAmt_diff <> 0 Then
    m_dbBdkDatabase.BeginTrans
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
    m_dbBdkDatabase.CommitTrans
End If
End With
CloseTable tRecset

m_dbBdkDatabase.BeginTrans
With tRecset
.open "Select * from IndrHdr where IhrCode=" & CStr(mIpyIhrCode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
.fields("IhrDepoAmt") = mIpyDepoAmtTot
.fields("IhrBalAmt") = .fields("IhrAmtAftDisc") - (.fields("IhrAdvAmt") + .fields("IhrRecdAmt") + .fields("IhrDepoAmt"))
.Update
End With
m_dbBdkDatabase.CommitTrans
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

Private Sub DispersePropRcptDepoAmt(ByVal mIpyIhrCode As Long, ByVal mIpyDepoAmt_diff As Double)
Dim tRecset As New ADODB.Recordset, mIpyDepoAmtTot As Double, mPropDepoAmt As Variant, mAmtAftDiscTot As Double, mIpyDepoAmtBal As Double, mIpyDepoAmtAdjusted As Double

On Error GoTo errhand

mIpyDepoAmtTot = mIpyDepoAmt_diff
mIpyDepoAmtBal = mIpyDepoAmt_diff
mIpyDepoAmtAdjusted = 0
mAmtAftDiscTot = 0
mIpyDepoAmtAdjusted = 0

With tRecset
.open "Select * from IndrHdr where IhrCode=" & CStr(mIpyIhrCode), m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
mAmtAftDiscTot = .fields("IhrAmtAftDisc")
End With
CloseTable tRecset

With tRecset
.open "Select * from IndrRcpt where IrcCode=" & CStr(mIpyIhrCode) & " order by IrcSno", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 And mIpyDepoAmtTot <> 0 Then
    m_dbBdkDatabase.BeginTrans
    Do While .EOF = False
        If InList(.fields("IrcRecState"), Array(cREC_UNCHANGED)) = True Then
            mPropDepoAmt = Round(CDec(mIpyDepoAmtTot) * CDec(.fields("IrcAmtAftDisc")) / CDec(mAmtAftDiscTot), 2)
            
            .fields("IrcDepoAmt") = .fields("IrcDepoAmt") + mPropDepoAmt
            .fields("IrcBalAmt") = .fields("IrcBalAmt") - mPropDepoAmt
            .Update
            
            mIpyDepoAmtBal = mIpyDepoAmtBal - mPropDepoAmt
            mIpyDepoAmtAdjusted = mIpyDepoAmtAdjusted + mPropDepoAmt
        Else
            If InList(.fields("IrcRecState"), Array(cREC_CANCELED, cREC_DELETED)) = False Then
                ErrorBox "clsHmsIpdMultiTranEntry_DispersePropRcptDepoAmt_#1540_[Invalid Record Status]"
            End If
        End If
        
        .MoveNext
    Loop
    If mIpyDepoAmtBal <> 0 And mIpyDepoAmtBal <> mIpyDepoAmtTot Then
        .MovePrevious
        
        mPropDepoAmt = mIpyDepoAmtBal
        .fields("IrcDepoAmt") = .fields("IrcDepoAmt") + mPropDepoAmt
        .fields("IrcBalAmt") = .fields("IrcBalAmt") - mPropDepoAmt
        .Update
        
        mIpyDepoAmtBal = mIpyDepoAmtBal - mPropDepoAmt
        mIpyDepoAmtAdjusted = mIpyDepoAmtAdjusted + mPropDepoAmt
    End If
    m_dbBdkDatabase.CommitTrans
End If
End With
CloseTable tRecset

m_dbBdkDatabase.BeginTrans
With tRecset
.open "Select * from IndrHdr where IhrCode=" & CStr(mIpyIhrCode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
.fields("IhrDepoAmt") = .fields("IhrDepoAmt") + mIpyDepoAmtAdjusted
.fields("IhrBalAmt") = .fields("IhrAmtAftDisc") - (.fields("IhrAdvAmt") + .fields("IhrRecdAmt") + .fields("IhrDepoAmt"))
.Update
End With
m_dbBdkDatabase.CommitTrans
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

Private Sub DisperseFifoRcptRefuAmt(ByVal mIfdIhrCode As Long, ByVal mIfdRefuAmt_diff As Double)
Dim tRecset As New ADODB.Recordset, mIfdRefuAmtTot As Double, mReqdRefuAmt As Double

On Error GoTo errhand

mIfdRefuAmtTot = 0
With tRecset
.open "Select * from IndrRcpt where IrcCode=" & CStr(mIfdIhrCode) & " order by IrcSno" & IIf(mIfdRefuAmt_diff < 0, " desc", ""), m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 And mIfdRefuAmt_diff <> 0 Then
    m_dbBdkDatabase.BeginTrans
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
    m_dbBdkDatabase.CommitTrans
End If
End With
CloseTable tRecset

m_dbBdkDatabase.BeginTrans
With tRecset
.open "Select * from IndrHdr where IhrCode=" & CStr(mIfdIhrCode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
.fields("IhrRefuAmt") = mIfdRefuAmtTot
.fields("IhrBalAmt") = .fields("IhrAmtAftDisc") - (.fields("IhrAdvAmt") + .fields("IhrRecdAmt") + .fields("IhrDepoAmt"))
.Update
End With
m_dbBdkDatabase.CommitTrans
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

Private Sub DispersePropRcptRefuAmt(ByVal mIfdIhrCode As Long, ByVal mIfdRefuAmt_diff As Double)
Dim tRecset As New ADODB.Recordset, mIfdRefuAmtTot As Double, mPropRefuAmt As Variant, mIfdRefuAmtBal As Double, mIfdAmtAftDiscTot As Double, mIfdRefuAmtAdjusted As Double

On Error GoTo errhand

mIfdRefuAmtBal = mIfdRefuAmt_diff
mIfdRefuAmtTot = mIfdRefuAmt_diff
mIfdRefuAmtAdjusted = 0
mIfdAmtAftDiscTot = 0

With tRecset
.open "Select * from IndrHdr where IhrCode=" & CStr(mIfdIhrCode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
mIfdAmtAftDiscTot = .fields("IhrAmtAftDisc")
End With
CloseTable tRecset

With tRecset
.open "Select * from IndrRcpt where IrcCode=" & CStr(mIfdIhrCode) & " order by IrcSno", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 And mIfdRefuAmtTot <> 0 Then
    m_dbBdkDatabase.BeginTrans
    Do While .EOF = False
        mPropRefuAmt = Round(CDec(mIfdRefuAmtTot) * CDec(.fields("IrcAmtAftDisc")) / CDec(mIfdAmtAftDiscTot), 2)
        
        .fields("IrcRefuAmt") = .fields("IrcRefuAmt") + mPropRefuAmt
        Rem .fields("IrcBalAmt") = .fields("IrcBalAmt") - mPropRefuAmt
        .Update
        
        mIfdRefuAmtBal = mIfdRefuAmtBal - mPropRefuAmt
        mIfdRefuAmtAdjusted = mIfdRefuAmtAdjusted + mPropRefuAmt
        
        .MoveNext
    Loop
    If mIfdRefuAmtBal <> 0 And mIfdRefuAmtBal <> mIfdRefuAmtTot Then
        .MovePrevious
        
        mPropRefuAmt = mIfdRefuAmtBal
        
        .fields("IrcRefuAmt") = .fields("IrcRefuAmt") + mPropRefuAmt
        Rem .fields("IrcBalAmt") = .fields("IrcBalAmt") - mPropRefuAmt
        .Update
        
        mIfdRefuAmtBal = mIfdRefuAmtBal - mPropRefuAmt
        mIfdRefuAmtAdjusted = mIfdRefuAmtAdjusted + mPropRefuAmt
    End If
    m_dbBdkDatabase.CommitTrans
End If
End With
CloseTable tRecset

m_dbBdkDatabase.BeginTrans
With tRecset
.open "Select * from IndrHdr where IhrCode=" & CStr(mIfdIhrCode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
.fields("IhrRefuAmt") = .fields("IhrRefuAmt") + mIfdRefuAmtAdjusted
.fields("IhrBalAmt") = .fields("IhrAmtAftDisc") - (.fields("IhrAdvAmt") + .fields("IhrRecdAmt") + .fields("IhrDepoAmt"))
.Update
End With
m_dbBdkDatabase.CommitTrans
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

Private Sub DisperseFifoBillDepoAmt(ByVal mIbpyIbhCode As Long, ByVal mIbpyDepoAmt_diff As Double)
Dim tRecset As New ADODB.Recordset, mIbpyDepoAmtTot As Double, mReqdDepoAmt As Double

On Error GoTo errhand

mIbpyDepoAmtTot = 0
With tRecset
.open "Select * from IndrBill where IblCode=" & CStr(mIbpyIbhCode) & " order by IblSno" & IIf(mIbpyDepoAmt_diff < 0, " desc", ""), m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 And mIbpyDepoAmt_diff <> 0 Then
    m_dbBdkDatabase.BeginTrans
    Do While .EOF = False
        If mIbpyDepoAmt_diff > 0 Then
            mReqdDepoAmt = .fields("IblAmtAftDisc") - (.fields("IblAdvAmt") + .fields("IblDpogAmt") + .fields("IblDepoAmt") + .fields("IblRfugAmt") + .fields("IblRefuAmt"))
            If mReqdDepoAmt > 0 Then
                If Not mIbpyDepoAmt_diff >= mReqdDepoAmt Then
                    mReqdDepoAmt = mIbpyDepoAmt_diff
                End If
                .fields("IblDepoAmt") = .fields("IblDepoAmt") + mReqdDepoAmt
                .fields("IblBalAmt") = .fields("IblBalAmt") - mReqdDepoAmt
                .Update
                
                mIbpyDepoAmt_diff = mIbpyDepoAmt_diff - mReqdDepoAmt
            End If
        ElseIf mIbpyDepoAmt_diff < 0 Then
            mReqdDepoAmt = .fields("IblDepoAmt")
            If mReqdDepoAmt > 0 Then
                If Not Abs(mIbpyDepoAmt_diff) >= mReqdDepoAmt Then
                    mReqdDepoAmt = Abs(mIbpyDepoAmt_diff)
                End If
                .fields("IblDepoAmt") = .fields("IblDepoAmt") - mReqdDepoAmt
                .fields("IblBalAmt") = .fields("IblBalAmt") + mReqdDepoAmt
                .Update
                
                mIbpyDepoAmt_diff = mIbpyDepoAmt_diff + mReqdDepoAmt
            End If
        ElseIf mIbpyDepoAmt_diff = 0 Then
            Exit Do
        End If
        mIbpyDepoAmtTot = mIbpyDepoAmtTot + .fields("IblDepoAmt")
        
        .MoveNext
    Loop
    m_dbBdkDatabase.CommitTrans
End If
End With
CloseTable tRecset

m_dbBdkDatabase.BeginTrans
With tRecset
.open "Select * from IndrBlHdr where IbhCode=" & CStr(mIbpyIbhCode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
.fields("IbhDepoAmt") = mIbpyDepoAmtTot
.fields("IbhBalAmt") = .fields("IbhAmtAftDisc") - (.fields("IbhAdvAmt") + .fields("IbhDpogAmt") + .fields("IbhDepoAmt")) + .fields("IbhRfugAmt") + .fields("IbhRefuAmt")
.Update
End With
m_dbBdkDatabase.CommitTrans
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

Rem in case bill to bill adjustment not be applied so far
Private Sub DispersePropBillDpogAmtXXX(ByVal mIbhCode As Long, ByVal mIgtDpogAmt_diff As Double)
Dim tRecset As New ADODB.Recordset, mIgtDpogAmtTot As Double, mPropDpogAmt As Variant, mAmtAftDiscTot As Double, mIgtDpogAmtBal As Double, mIgtDpogAmtAdjusted As Double

On Error GoTo errhand

mIgtDpogAmtTot = mIgtDpogAmt_diff
mIgtDpogAmtBal = mIgtDpogAmt_diff
mIgtDpogAmtAdjusted = 0
mAmtAftDiscTot = 0
mIgtDpogAmtAdjusted = 0

With tRecset
.open "Select * from IndrBlHdr where IbhCode=" & CStr(mIbhCode), m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
mAmtAftDiscTot = .fields("IbhAmtAftDisc")
End With
CloseTable tRecset

With tRecset
.open "Select * from IndrBill where IblCode=" & CStr(mIbhCode) & " order by IblSno", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 And mIgtDpogAmtTot <> 0 Then
    m_dbBdkDatabase.BeginTrans
    Do While .EOF = False
        If InList(.fields("IblRecState"), Array(cREC_UNCHANGED)) = True Then
            mPropDpogAmt = Round(CDec(mIgtDpogAmtTot) * CDec(.fields("IblAmtAftDisc")) / CDec(mAmtAftDiscTot), 2)
            
            .fields("IblDpogAmt") = .fields("IblDpogAmt") + mPropDpogAmt
            .fields("IblBalAmt") = .fields("IblBalAmt") - mPropDpogAmt
            .Update
            
            mIgtDpogAmtBal = mIgtDpogAmtBal - mPropDpogAmt
            mIgtDpogAmtAdjusted = mIgtDpogAmtAdjusted + mPropDpogAmt
        Else
            If InList(.fields("IblRecState"), Array(cREC_CANCELED, cREC_DELETED)) = False Then
                ErrorBox "clsHmsIpdMultiTranEntry_DispersePropBillDpogAmt_#2835_[Invalid Record Status]"
            End If
        End If
        
        .MoveNext
    Loop
    If mIgtDpogAmtBal <> 0 And mIgtDpogAmtBal <> mIgtDpogAmtTot Then
        .MovePrevious
        
        mPropDpogAmt = mIgtDpogAmtBal
        .fields("IblDpogAmt") = .fields("IblDpogAmt") + mPropDpogAmt
        .fields("IblBalAmt") = .fields("IblBalAmt") - mPropDpogAmt
        .Update
        
        mIgtDpogAmtBal = mIgtDpogAmtBal - mPropDpogAmt
        mIgtDpogAmtAdjusted = mIgtDpogAmtAdjusted + mPropDpogAmt
    End If
    m_dbBdkDatabase.CommitTrans
End If
End With
CloseTable tRecset

m_dbBdkDatabase.BeginTrans
With tRecset
.open "Select * from IndrBlHdr where IbhCode=" & CStr(mIbhCode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
.fields("IbhDpogAmt") = .fields("IbhDpogAmt") + mIgtDpogAmtAdjusted
.fields("IbhBalAmt") = .fields("IbhAmtAftDisc") - (.fields("IbhAdvAmt") + .fields("IbhDpogAmt") + .fields("IbhDepoAmt")) + .fields("IbhRfugAmt") + .fields("IbhRefuAmt")
.Update
End With
m_dbBdkDatabase.CommitTrans
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

Private Sub DispersePropBillDepoAmt(ByVal mIbpyIbhCode As Long, ByVal mIbpyDepoAmt_diff As Double)
Dim tRecset As New ADODB.Recordset, mIbpyDepoAmtTot As Double, mPropDepoAmt As Variant, mAmtAftDiscTot As Double, mIbpyDepoAmtBal As Double, mIbpyDepoAmtAdjusted As Double

On Error GoTo errhand

mIbpyDepoAmtTot = mIbpyDepoAmt_diff
mIbpyDepoAmtBal = mIbpyDepoAmt_diff
mIbpyDepoAmtAdjusted = 0
mAmtAftDiscTot = 0
mIbpyDepoAmtAdjusted = 0

With tRecset
.open "Select * from IndrBlHdr where IbhCode=" & CStr(mIbpyIbhCode), m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
mAmtAftDiscTot = .fields("IbhAmtAftDisc")
End With
CloseTable tRecset

With tRecset
.open "Select * from IndrBill where IblCode=" & CStr(mIbpyIbhCode) & " order by IblSno", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False And mIbpyDepoAmtTot <> 0 Then
    m_dbBdkDatabase.BeginTrans
    Do While .EOF = False
        If InList(.fields("IblRecState"), Array(cREC_UNCHANGED)) = True Then
            mPropDepoAmt = Round(CDec(mIbpyDepoAmtTot) * CDec(.fields("IblAmtAftDisc")) / CDec(mAmtAftDiscTot), 2)
            
            .fields("IblDepoAmt") = .fields("IblDepoAmt") + mPropDepoAmt
            .fields("IblBalAmt") = .fields("IblBalAmt") - mPropDepoAmt
            .Update
            
            mIbpyDepoAmtBal = mIbpyDepoAmtBal - mPropDepoAmt
            mIbpyDepoAmtAdjusted = mIbpyDepoAmtAdjusted + mPropDepoAmt
        Else
            If InList(.fields("IblRecState"), Array(cREC_CANCELED, cREC_DELETED)) = False Then
                ErrorBox "clsHmsIpdMultiTranEntry_DispersePropBillDepoAmt_#1540_[Invalid Record Status]"
            End If
        End If
        
        .MoveNext
    Loop
    If mIbpyDepoAmtBal <> 0 And mIbpyDepoAmtBal <> mIbpyDepoAmtTot Then
        .MovePrevious
        
        mPropDepoAmt = mIbpyDepoAmtBal
        .fields("IblDepoAmt") = .fields("IblDepoAmt") + mPropDepoAmt
        .fields("IblBalAmt") = .fields("IblBalAmt") - mPropDepoAmt
        .Update
        
        mIbpyDepoAmtBal = mIbpyDepoAmtBal - mPropDepoAmt
        mIbpyDepoAmtAdjusted = mIbpyDepoAmtAdjusted + mPropDepoAmt
    End If
    m_dbBdkDatabase.CommitTrans
End If
End With
CloseTable tRecset

m_dbBdkDatabase.BeginTrans
With tRecset
.open "Select * from IndrBlHdr where IbhCode=" & CStr(mIbpyIbhCode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
.fields("IbhDepoAmt") = .fields("IbhDepoAmt") + mIbpyDepoAmtAdjusted
.fields("IbhBalAmt") = .fields("IbhAmtAftDisc") - (.fields("IbhAdvAmt") + .fields("IbhDpogAmt") + .fields("IbhDepoAmt")) + .fields("IbhRfugAmt") + .fields("IbhRefuAmt")
.Update
End With
m_dbBdkDatabase.CommitTrans
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

Private Sub DisperseFifoBillRefuAmt(ByVal mIbfdIbhCode As Long, ByVal mIbfdRefuAmt_diff As Double)
Dim tRecset As New ADODB.Recordset, mIbfdRefuAmtTot As Double, mReqdRefuAmt As Double

On Error GoTo errhand

mIbfdRefuAmtTot = 0
With tRecset
.open "Select * from IndrBill where IblCode=" & CStr(mIbfdIbhCode) & " order by IblSno" & IIf(mIbfdRefuAmt_diff < 0, " desc", ""), m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 And mIbfdRefuAmt_diff <> 0 Then
    m_dbBdkDatabase.BeginTrans
    Do While .EOF = False
        If mIbfdRefuAmt_diff > 0 Then
            mReqdRefuAmt = (.fields("IblAdvAmt") + .fields("IblDpogAmt") + .fields("IblDepoAmt")) - .fields("IblRfugAmt") - .fields("IblRefuAmt")
            If mReqdRefuAmt > 0 Then
                If Not mIbfdRefuAmt_diff >= mReqdRefuAmt Then
                    mReqdRefuAmt = mIbfdRefuAmt_diff
                End If
                .fields("IblRefuAmt") = .fields("IblRefuAmt") + mReqdRefuAmt
                .fields("IblBalAmt") = .fields("IblBalAmt") + mReqdRefuAmt
                .Update
                
                mIbfdRefuAmt_diff = mIbfdRefuAmt_diff - mReqdRefuAmt
            End If
        ElseIf mIbfdRefuAmt_diff < 0 Then
            mReqdRefuAmt = .fields("IblRefuAmt")
            If mReqdRefuAmt > 0 Then
                If Not Abs(mIbfdRefuAmt_diff) >= mReqdRefuAmt Then
                    mReqdRefuAmt = Abs(mIbfdRefuAmt_diff)
                End If
                .fields("IblRefuAmt") = .fields("IblRefuAmt") - mReqdRefuAmt
                .fields("IblBalAmt") = .fields("IblBalAmt") - mReqdRefuAmt
                .Update
                
                mIbfdRefuAmt_diff = mIbfdRefuAmt_diff + mReqdRefuAmt
            End If
        ElseIf mIbfdRefuAmt_diff = 0 Then
            Exit Do
        End If
        mIbfdRefuAmtTot = mIbfdRefuAmtTot + .fields("IblRefuAmt")
        
        .MoveNext
    Loop
    m_dbBdkDatabase.CommitTrans
End If
End With
CloseTable tRecset

m_dbBdkDatabase.BeginTrans
With tRecset
.open "Select * from IndrBlHdr where IbhCode=" & CStr(mIbfdIbhCode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
.fields("IbhRefuAmt") = mIbfdRefuAmtTot
.fields("IbhBalAmt") = .fields("IbhAmtAftDisc") - (.fields("IbhAdvAmt") + .fields("IbhDpogAmt") + .fields("IbhDepoAmt")) + .fields("IbhRfugAmt") + .fields("IbhRefuAmt")
.Update
End With
m_dbBdkDatabase.CommitTrans
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

Rem in case of bill to bill adjustment not to be applied so far
Private Sub DispersePropBillRfugAmtXXX(ByVal mIbhCode As Long, ByVal mIgfRfugAmt_diff As Double)
Dim tRecset As New ADODB.Recordset, mIgfRfugAmtTot As Double, mPropRfugAmt As Variant, mIgfRfugAmtBal As Double, mIgfAmtAftDiscTot As Double, mIgfRfugAmtAdjusted As Double

On Error GoTo errhand

mIgfRfugAmtBal = mIgfRfugAmt_diff
mIgfRfugAmtTot = mIgfRfugAmt_diff
mIgfRfugAmtAdjusted = 0
mIgfAmtAftDiscTot = 0

With tRecset
.open "Select * from IndrBlHdr where IbhCode=" & CStr(mIbhCode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
mIgfAmtAftDiscTot = .fields("IbhAmtAftDisc")
End With
CloseTable tRecset

With tRecset
.open "Select * from IndrBill where IblCode=" & CStr(mIbhCode) & " order by IblSno", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False And mIgfRfugAmtTot <> 0 Then
    m_dbBdkDatabase.BeginTrans
    Do While .EOF = False
        If InList(.fields("IblRecState"), Array(cREC_UNCHANGED)) = True Then
            mPropRfugAmt = Round(CDec(mIgfRfugAmtTot) * CDec(.fields("IblAmtAftDisc")) / CDec(mIgfAmtAftDiscTot), 2)
            
            .fields("IblRfugAmt") = .fields("IblRfugAmt") + mPropRfugAmt
            .fields("IblBalAmt") = .fields("IblBalAmt") - mPropRfugAmt
            .Update
            
            mIgfRfugAmtBal = mIgfRfugAmtBal - mPropRfugAmt
            mIgfRfugAmtAdjusted = mIgfRfugAmtAdjusted + mPropRfugAmt
        Else
            If InList(.fields("IblRecState"), Array(cREC_CANCELED, cREC_DELETED)) = False Then
                ErrorBox "clsHmsIpdMultiTranEntry_DispersePropBillRfugAmt_#3064_[Invalid Record Status]"
            End If
        End If
        
        .MoveNext
    Loop
    If mIgfRfugAmtBal <> 0 And mIgfRfugAmtBal <> mIgfRfugAmtTot Then
        .MovePrevious
        
        mPropRfugAmt = mIgfRfugAmtBal
        
        .fields("IblRfugAmt") = .fields("IblRfugAmt") + mPropRfugAmt
        .fields("IblBalAmt") = .fields("IblBalAmt") - mPropRfugAmt
        .Update
        
        mIgfRfugAmtBal = mIgfRfugAmtBal - mPropRfugAmt
        mIgfRfugAmtAdjusted = mIgfRfugAmtAdjusted + mPropRfugAmt
    End If
    m_dbBdkDatabase.CommitTrans
End If
End With
CloseTable tRecset

m_dbBdkDatabase.BeginTrans
With tRecset
.open "Select * from IndrBlHdr where IbhCode=" & CStr(mIbhCode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
.fields("IbhRfugAmt") = .fields("IbhRfugAmt") + mIgfRfugAmtAdjusted
.fields("IbhBalAmt") = .fields("IbhAmtAftDisc") - (.fields("IbhAdvAmt") + .fields("IbhDpogAmt") + .fields("IbhDepoAmt")) + .fields("IbhRfugAmt") + .fields("IbhRefuAmt")
.Update
End With
m_dbBdkDatabase.CommitTrans
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

Private Sub DispersePropBillRefuAmt(ByVal mIbfdIbhCode As Long, ByVal mIbfdRefuAmt_diff As Double)
Dim tRecset As New ADODB.Recordset, mIbfdRefuAmtTot As Double, mPropRefuAmt As Variant, mIbfdRefuAmtBal As Double, mIbfdAmtAftDiscTot As Double, mIbfdRefuAmtAdjusted As Double

On Error GoTo errhand

mIbfdRefuAmtBal = mIbfdRefuAmt_diff
mIbfdRefuAmtTot = mIbfdRefuAmt_diff
mIbfdRefuAmtAdjusted = 0
mIbfdAmtAftDiscTot = 0

With tRecset
.open "Select * from IndrBlHdr where IbhCode=" & CStr(mIbfdIbhCode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
mIbfdAmtAftDiscTot = .fields("IbhAmtAftDisc")
End With
CloseTable tRecset

With tRecset
.open "Select * from IndrBill where IblCode=" & CStr(mIbfdIbhCode) & " order by IblSno", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False And mIbfdRefuAmtTot <> 0 Then
    m_dbBdkDatabase.BeginTrans
    Do While .EOF = False
        If InList(.fields("IblRecState"), Array(cREC_UNCHANGED)) = True Then
            mPropRefuAmt = Round(CDec(mIbfdRefuAmtTot) * CDec(.fields("IblAmtAftDisc")) / CDec(mIbfdAmtAftDiscTot), 2)
            
            .fields("IblRefuAmt") = .fields("IblRefuAmt") + mPropRefuAmt
            .fields("IblBalAmt") = .fields("IblBalAmt") - mPropRefuAmt
            .Update
            
            mIbfdRefuAmtBal = mIbfdRefuAmtBal - mPropRefuAmt
            mIbfdRefuAmtAdjusted = mIbfdRefuAmtAdjusted + mPropRefuAmt
        Else
            If InList(.fields("IblRecState"), Array(cREC_CANCELED, cREC_DELETED)) = False Then
                ErrorBox "clsHmsIpdMultiTranEntry_DispersePropBillRefuAmt_#3138_[Invalid Record Status]"
            End If
        End If
        
        .MoveNext
    Loop
    If mIbfdRefuAmtBal <> 0 And mIbfdRefuAmtBal <> mIbfdRefuAmtTot Then
        .MovePrevious
        
        mPropRefuAmt = mIbfdRefuAmtBal
        
        .fields("IblRefuAmt") = .fields("IblRefuAmt") + mPropRefuAmt
        .fields("IblBalAmt") = .fields("IblBalAmt") - mPropRefuAmt
        .Update
        
        mIbfdRefuAmtBal = mIbfdRefuAmtBal - mPropRefuAmt
        mIbfdRefuAmtAdjusted = mIbfdRefuAmtAdjusted + mPropRefuAmt
    End If
    m_dbBdkDatabase.CommitTrans
End If
End With
CloseTable tRecset

m_dbBdkDatabase.BeginTrans
With tRecset
.open "Select * from IndrBlHdr where IbhCode=" & CStr(mIbfdIbhCode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
.fields("IbhRefuAmt") = .fields("IbhRefuAmt") + mIbfdRefuAmtAdjusted
.fields("IbhBalAmt") = .fields("IbhAmtAftDisc") - (.fields("IbhAdvAmt") + .fields("IbhDpogAmt") + .fields("IbhDepoAmt")) + .fields("IbhRfugAmt") + .fields("IbhRefuAmt")
.Update
End With
m_dbBdkDatabase.CommitTrans
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
Dim t1Recset As New ADODB.Recordset, t2Recset As New ADODB.Recordset, t3Recset As New ADODB.Recordset, t4Recset As New ADODB.Recordset, t5Recset As New ADODB.Recordset, t6Recset As New ADODB.Recordset

Data_CreateLog = False
If Chk_ActiveTran() = False Or mTrnCode <> ActiveTrnCode Then
    ErrorBox "clsHmsIpdMultiTranEntry_Data_CreateLog_#3008_[InActive " & mTitleName & " Entry]"
    GoTo EndSub
End If

t1Recset.open "Select * from " & mTrnDtlTableName & "_Log where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnDtlICodeField & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
t2Recset.open "Select * from " & mTrnHdrTableName & "_Log where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
If blnIndrRcptTran = True Or blnIndrBillTran = True Then
    t3Recset.open "Select * from " & mTrnSdcTableName & "_Log where " & mTrnSdcCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnSdcICodeField & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
End If
If blnIndrBillTran = True Then
    t4Recset.open "Select * from IndrBlDpogDtl_Log where IbgdCode=" & CStr(mTrnCode) & " order by IbgdICode" & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
    t5Recset.open "Select * from IndrBlRfugDtl_Log where IbgfCode=" & CStr(mTrnCode) & " order by IbgfICode" & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
    t6Recset.open "Select * from IndrBlIbsDtl_Log where IbbsCode=" & CStr(mTrnCode) & " order by IbbsICode" & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
End If

If t1Recset.RecordCount = 0 Then
    m_dbBdkDatabase.BeginTrans
    m_dbBdkDatabase.Execute "Insert into " & mTrnDtlTableName & "_Log Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " and " & mTrnDtlRecStateField & "=" & CStr(cREC_UNCHANGED) & ""
    m_dbBdkDatabase.CommitTrans
Else
    AlertBox "clsHmsIpdMultiTranEntry_Data_CreateLog_#3022_[Unsaved " & mTitleName & " Entry]"
End If

If t2Recset.RecordCount = 0 Then
    m_dbBdkDatabase.BeginTrans
    m_dbBdkDatabase.Execute "Insert into " & mTrnHdrTableName & "_Log Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & " and " & mTrnHdrRecStateField & "=" & CStr(cREC_UNCHANGED) & ""
    m_dbBdkDatabase.CommitTrans
Else
    AlertBox "clsHmsIpdMultiTranEntry_Data_CreateLog_#3030_[Unsaved " & mTitleName & " Entry]"
End If

If blnIndrRcptTran = True Or blnIndrBillTran = True Then
    If t3Recset.RecordCount = 0 Then
        m_dbBdkDatabase.BeginTrans
        m_dbBdkDatabase.Execute "Insert into " & mTrnSdcTableName & "_Log Select * from " & mTrnSdcTableName & " where " & mTrnSdcCodeField & "=" & CStr(mTrnCode) & " and " & mTrnSdcRecStateField & "=" & CStr(cREC_UNCHANGED) & ""
        m_dbBdkDatabase.CommitTrans
    Else
        AlertBox "clsHmsIpdMultiTranEntry_Data_CreateLog_#3039_[Unsaved " & mTitleName & " Entry]"
    End If
End If

If blnIndrBillTran = True Then
    If t4Recset.RecordCount = 0 Then
        m_dbBdkDatabase.BeginTrans
        m_dbBdkDatabase.Execute "Insert into IndrBlDpogDtl_Log Select * from IndrBlDpogDtl where IbgdCode=" & CStr(mTrnCode) & " and IbgdRecState=" & CStr(cREC_UNCHANGED) & ""
        m_dbBdkDatabase.CommitTrans
    Else
        AlertBox "clsHmsIpdMultiTranEntry_Data_CreateLog_#3650_[Unsaved " & mTitleName & " Entry]"
    End If
    If t5Recset.RecordCount = 0 Then
        m_dbBdkDatabase.BeginTrans
        m_dbBdkDatabase.Execute "Insert into IndrBlRfugDtl_Log Select * from IndrBlRfugDtl where IbgfCode=" & CStr(mTrnCode) & " and IbgfRecState=" & CStr(cREC_UNCHANGED) & ""
        m_dbBdkDatabase.CommitTrans
    Else
        AlertBox "clsHmsIpdMultiTranEntry_Data_CreateLog_#3650_[Unsaved " & mTitleName & " Entry]"
    End If
    If t6Recset.RecordCount = 0 Then
        m_dbBdkDatabase.BeginTrans
        m_dbBdkDatabase.Execute "Insert into IndrBlIbsDtl_Log Select * from IndrBlIbsDtl where IbbsCode=" & CStr(mTrnCode) & " and IbbsRecState=" & CStr(cREC_UNCHANGED) & ""
        m_dbBdkDatabase.CommitTrans
    Else
        AlertBox "clsHmsIpdMultiTranEntry_Data_CreateLog_#4476_[Unsaved " & mTitleName & " Entry]"
    End If
End If

CloseTable t1Recset
CloseTable t2Recset
CloseTable t3Recset, mCheckOpen:=True
CloseTable t4Recset, mCheckOpen:=True
CloseTable t5Recset, mCheckOpen:=True
CloseTable t6Recset, mCheckOpen:=True

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
CloseTable t4Recset, mCheckOpen:=True
CloseTable t5Recset, mCheckOpen:=True
CloseTable t6Recset, mCheckOpen:=True
Exit Function

End Function

Private Function Data_RemoveLog(ByVal mTrnCode As Long) As Boolean
Data_RemoveLog = False
If Chk_ActiveTran() = False Then
    ErrorBox "clsHmsIpdMultiTranEntry_Data_RemoveLog_#3068_[InActive " & mTitleName & " Entry]"
    Exit Function
End If

m_dbBdkDatabase.BeginTrans
m_dbBdkDatabase.Execute "Delete from " & mTrnDtlTableName & "_Log where " & mTrnDtlCodeField & "=" & CStr(mTrnCode)
m_dbBdkDatabase.Execute "Delete from " & mTrnHdrTableName & "_Log where " & mTrnHdrCodeField & "=" & CStr(mTrnCode)
If blnIndrRcptTran = True Or blnIndrBillTran = True Then
    m_dbBdkDatabase.Execute "Delete from " & mTrnSdcTableName & "_Log where " & mTrnSdcCodeField & "=" & CStr(mTrnCode)
End If
If blnIndrBillTran = True Then
    m_dbBdkDatabase.Execute "Delete from IndrBlDpogDtl_Log where IbgdCode=" & CStr(mTrnCode)
    m_dbBdkDatabase.Execute "Delete from IndrBlRfugDtl_Log where IbgfCode=" & CStr(mTrnCode)
    m_dbBdkDatabase.Execute "Delete from IndrBlIbsDtl_Log where IbbsCode=" & CStr(mTrnCode)
End If

m_dbBdkDatabase.CommitTrans

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
Dim tRecset As New ADODB.Recordset, t1Recset As New ADODB.Recordset, mIpdDischState As Integer

ChkEntryExist = False
If blnIndrRcptTran = True Then
    With tRecset
    .open "Select * from IndrPymtDtl dtl inner join IndrPymtHdr hdr on dtl.IpyCode=hdr.IphCode where IpyIhrCode=" & CStr(mTrnCode) & " order by IpyDate desc,IphVchNo desc", m_dbBdkDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        AlertBox "Indoor Receipt No." & CStr(.fields("IphVchNo")) & " Dated " & Dtoc(.fields("IphDate")) & " !!!"
        ChkEntryExist = True
    End If
    End With
    CloseTable tRecset
    
    If ChkEntryExist = False Then
        With tRecset
        .open "Select * from IndrRefdDtl dtl inner join IndrRefdHdr hdr on dtl.IfdCode=hdr.IfhCode where IfdIhrCode=" & CStr(mTrnCode) & " order by IfdDate desc,IfhVchNo desc", m_dbBdkDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            AlertBox "Indoor Receipt No." & CStr(.fields("IfhVchNo")) & " Dated " & Dtoc(.fields("IfhDate")) & " !!!"
            ChkEntryExist = True
        End If
        End With
        CloseTable tRecset
    End If
    
    If ChkEntryExist = False Then
        With tRecset
        .open "Select top 1 * from IBedState where IbsIpgCode=(Select IhrIpgCode from IndrHdr where IhrCode=" & CStr(mTrnCode) & ") order by IbsCode desc", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
        If .EOF = False Then
            mIpdDischState = .fields("IbsDischState")
        Else
            mIpdDischState = cIBS_STATE_UNKNOWN
        End If
        End With
        CloseTable tRecset
        If mIpdDischState <> cIBS_STATE_OCCUPIED Then
            AlertBox "Patient Discharged / Any Discharge State !!!"
            ChkEntryExist = True
        End If
    End If
    
ElseIf blnIndrPymtTran = True Then
    Dim mIpyDepoAmt As Double, mIpyIhrCode As Long
    With tRecset
    .open "Select IpyIhrCode,sum(IpyDepoAmt) as IpyDepoAmt_sum from IndrPymtDtl dtl inner join IndrPymtHdr hdr on dtl.IpyCode=hdr.IphCode where IpyCode=" & CStr(mTrnCode) & " group by IpyIhrCode", m_dbBdkDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        Do While .EOF = False And ChkEntryExist = False
            mIpyIhrCode = .fields("IpyIhrCode")
            mIpyDepoAmt = .fields("IpyDepoAmt_sum")
            
            With t1Recset
            .open "Select * from IndrHdr hdr inner join VTypMast vtm on hdr.IhrVtmCode=vtm.VtmCode where IhrCode=" & CStr(mIpyIhrCode) & "", m_dbComDatabase, adOpenKeyset, adLockReadOnly
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
    
    If ChkEntryExist = False Then
        With tRecset
        .open "Select top 1 * from IBedState where IbsIpgCode=(Select IphIpgCode from IndrPymtHdr where IphCode=" & CStr(mTrnCode) & ") order by IbsCode desc", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
        If .EOF = False Then
            mIpdDischState = .fields("IbsDischState")
        Else
            mIpdDischState = cIBS_STATE_UNKNOWN
        End If
        End With
        CloseTable tRecset
        If mIpdDischState <> cIBS_STATE_OCCUPIED Then
            AlertBox "Patient Discharged / Any Discharge State !!!"
            ChkEntryExist = True
        End If
    End If
    
ElseIf blnIndrRefdTran = True Then
    If ChkEntryExist = False Then
        With tRecset
        .open "Select top 1 * from IBedState where IbsIpgCode=(Select IfhIpgCode from IndrRefdHdr where IfhCode=" & CStr(mTrnCode) & ") order by IbsCode desc", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
        If .EOF = False Then
            mIpdDischState = .fields("IbsDischState")
        Else
            mIpdDischState = cIBS_STATE_UNKNOWN
        End If
        End With
        CloseTable tRecset
        If mIpdDischState <> cIBS_STATE_OCCUPIED Then
            AlertBox "Patient Discharged / Any Discharge State !!!"
            ChkEntryExist = True
        End If
    End If
    
ElseIf blnIndrBillTran = True Then
    With tRecset
    .open "Select * from IndrBlPymtDtl dtl inner join IndrBlPymtHdr hdr on dtl.IbpyCode=hdr.IbphCode where IbpyIbhCode=" & CStr(mTrnCode) & " order by IbpyDate desc,IbphVchNo desc", m_dbBdkDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        AlertBox "Indoor Bill Payment No." & CStr(.fields("IbphVchNo")) & " Dated " & Dtoc(.fields("IbphDate")) & " !!!"
        ChkEntryExist = True
    End If
    End With
    CloseTable tRecset
    
    If ChkEntryExist = False Then
        With tRecset
        .open "Select * from IndrBlRefdDtl dtl inner join IndrBlRefdHdr hdr on dtl.IbfdCode=hdr.IbfhCode where IbfdIbhCode=" & CStr(mTrnCode) & " order by IbfdDate desc,IbfhVchNo desc", m_dbBdkDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            AlertBox "Indoor Bill Refund No." & CStr(.fields("IbfhVchNo")) & " Dated " & Dtoc(.fields("IbfhDate")) & " !!!"
            ChkEntryExist = True
        End If
        End With
        CloseTable tRecset
    End If
    
    If ChkEntryExist = False Then
        With tRecset
        .open "Select top 1 * from IBedState where IbsIpgCode=(Select IbhIpgCode from IndrBlHdr where IbhCode=" & CStr(mTrnCode) & ") order by IbsCode desc", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
        If .EOF = False Then
            mIpdDischState = .fields("IbsDischState")
        Else
            mIpdDischState = cIBS_STATE_UNKNOWN
        End If
        End With
        CloseTable tRecset
        If mIpdDischState <> cIBS_STATE_OCCUPIED Then
            AlertBox "Patient Discharged / Any Discharge State !!!"
            ChkEntryExist = True
        End If
    End If
    
ElseIf blnIndrBlPymtTran = True Then
    Dim mIbpyDepoAmt As Double, mIbpyIbhCode As Long
    With tRecset
    .open "Select IbpyIbhCode,sum(IbpyDepoAmt) as IbpyDepoAmt_sum from IndrBlPymtDtl dtl inner join IndrBlPymtHdr hdr on dtl.IbpyCode=hdr.IbphCode where IbpyCode=" & CStr(mTrnCode) & " group by IbpyIbhCode", m_dbBdkDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        Do While .EOF = False And ChkEntryExist = False
            mIbpyIbhCode = .fields("IbpyIbhCode")
            mIbpyDepoAmt = .fields("IbpyDepoAmt_sum")
            
            With t1Recset
            .open "Select * from IndrBlHdr hdr inner join VTypMast vtm on hdr.IbhVtmCode=vtm.VtmCode where IbhCode=" & CStr(mIbpyIbhCode) & "", m_dbComDatabase, adOpenKeyset, adLockReadOnly
            If .RecordCount > 0 Then
                If (.fields("IbhRfugAmt") + .fields("IbhRefuAmt")) > (.fields("IbhAdvAmt") + .fields("IbhDpogAmt") + .fields("IbhDepoAmt") - mIbpyDepoAmt) Then
                    ErrorBox "Excess Amount Refunded for Bill No." & .fields("VtmName") & "-" & CStr(.fields("IbhVchNo")) & " Dated " & Dtoc(.fields("IbhDate")) & " !!!"
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
    
    If ChkEntryExist = False Then
        With tRecset
        .open "Select top 1 * from IBedState where IbsIpgCode=(Select IbphIpgCode from IndrBlPymtHdr where IbphCode=" & CStr(mTrnCode) & ") order by IbsCode desc", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
        If .EOF = False Then
            mIpdDischState = .fields("IbsDischState")
        Else
            mIpdDischState = cIBS_STATE_UNKNOWN
        End If
        End With
        CloseTable tRecset
        If mIpdDischState <> cIBS_STATE_OCCUPIED Then
            AlertBox "Patient Discharged / Any Discharge State !!!"
            ChkEntryExist = True
        End If
    End If
    
ElseIf blnIndrBlRefdTran = True Then
    If ChkEntryExist = False Then
        With tRecset
        .open "Select top 1 * from IBedState where IbsIpgCode=(Select IbfhIpgCode from IndrBlRefdHdr where IbfhCode=" & CStr(mTrnCode) & ") order by IbsCode desc", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
        If .EOF = False Then
            mIpdDischState = .fields("IbsDischState")
        Else
            mIpdDischState = cIBS_STATE_UNKNOWN
        End If
        End With
        CloseTable tRecset
        If mIpdDischState <> cIBS_STATE_OCCUPIED Then
            AlertBox "Patient Discharged / Any Discharge State !!!"
            ChkEntryExist = True
        End If
    End If

End If

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Function


End Function


Rem ********************************************** end of class ********************************************

