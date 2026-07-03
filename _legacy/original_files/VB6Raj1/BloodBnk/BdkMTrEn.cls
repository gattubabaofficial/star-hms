VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsBdkMultiTranEntry"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False

Option Explicit

Dim m_dbBdkDatabase As ADODB.Connection, m_dbAcDatabase As ADODB.Connection, m_dbStDatabase As ADODB.Connection, m_dbGrpDatabase As ADODB.Connection, m_dbComDatabase As ADODB.Connection
Dim mClassUIdCode As Long, mClassUIdFileName As String, mClassAcsPermFileName As String, mClassDtlUIdFileName As String, mClassDtlAcsPermFileName As String
Dim mTrnHdrTableName As String, mTrnDtlTableName As String, mTrnHdrCodeField As String, mTrnDtlCodeField As String, mTrnHdrDateField As String, mTrnDtlDateField As String, mTrnVtmField As String, mTrnPrefixField As String, mTrnVchNoField As String, mTrnPostfixField As String, mTrnDtlICodeField As String, mTrnDtlSnoField As String, mTrnHdrRecStateField As String, mTrnDtlRecStateField As String, mTrnHdrCmpCodeField As String, mTrnDtlCmpCodeField As String, mTitleName As String
Dim mTrnSdcTableName As String, mTrnSdcCodeField As String, mTrnSdcSubCodeField As String, mTrnSdcICodeField As String, mTrnSdcSnoField As String, mTrnSdcDateField As String, mTrnSdcEttCodeField As String, mTrnSdcSrvCodeField As String, mTrnSdcDctCodeField As String, mTrnSdcDrlCodeField As String, mTrnSdcRemarkField As String, mTrnSdcRecStateField As String, mTrnSdcCmpCodeField As String
Public blnBloodInTran As Boolean, blnBloodOutTran As Boolean, blnBldIsuRcptTran As Boolean, blnBldIsuPymtTran As Boolean, blnBldIsuRefdTran As Boolean
Rem common class variables used in both header and detail
Public mTrnCode_lng As Long, mTrnVtmCode_lng As Long, mTrnPrefix_str As String, mTrnVchNo_lng As Long, mTrnPostfix_str As String, mTrnDate_dt As Date, mTrnCmpCode_int As Integer
Rem common class header variables
Public mTrnHdrRecState_int As Integer
Rem common class detail variables
Public mTrnDtlICode_lng As Long, mTrnDtlSno_int As Integer, mTrnDtlRecState_int As Integer
Rem blood-in header variables
Public mBihStkCode_lng As Long, mBihTime_lng As Long, mBihTime_str As String, mBihTrnRefNo_str As String, mBihTrnRefDt_dt As Date, mBihEttCode_lng As Long, mBihEfmCode_lng As Long, mBihPckQty_dbl As Double, mBihBldQty_dbl As Double, mBihRemark_str As String
Rem blood-in detail variables


Rem service doctor detail variables
Public mSdcCode_lng As Long, mSdcSubCode_lng As Long, mSdcICode_lng As Long, mSdcSno_int As Integer, mSdcDate_dt As Date, mSdcEttCode_lng As Long, mSdcSrvCode_lng As Long, mSdcDctCode_lng As Long, mSdcDrlCode_lng As Long, mSdcRemark_str As String, mSdcRecState_int As Integer, mSdcCmpCode_int As Long
Rem blood issue receipt header variables
Public mOhrOpgCode_lng As Long, mOhrEttCode_lng As Long, mOhrHpmCode_lng As Long, mOhrTime_lng As Long, mOhrHpmRefNo_str As String, mOhrHpmRefDt_dt As Date, mOhrOldOhrCode_lng As Long, mOhrEttDiscPer_dbl As Long, mOhrAmtBefDisc_dbl As Double, mOhrDiscAmt_dbl As Double, mOhrAmtAftDisc_dbl As Double, mOhrAdvAmt_dbl As Double, mOhrRecdAmt_dbl As Double, mOhrDepoAmt_dbl As Double, mOhrRefuAmt_dbl As Double, mOhrBalAmt_dbl As Double, mOhrRemark_str As String
Rem blood issue receipt detail variables
Public mOrcSrvCode_lng As Long, mOrcEttCode_lng As Long, mOrcHpmCode_lng As Long, mOrcUnit_dbl As Double, mOrcRate_dbl As Double, mOrcAmtBefDisc_dbl As Double, mOrcDiscPer_dbl As Double, mOrcDiscAmt_dbl As Double, mOrcAmtAftDisc_dbl As Double, mOrcAdvAmt_dbl As Double, mOrcRecdAmt_dbl As Double, mOrcDepoAmt_dbl As Double, mOrcRefuAmt_dbl As Double, mOrcBalAmt_dbl As Double, mOrcRemark_str As String
Rem blood issue payment receipt header variables
Public mOphOpgCode_lng As Long, mOphTime_lng As Long, mOphOldOphCode_lng As Long, mOphEttCode_lng As Long, mOphHpmCode_lng As Long, mOphDepoAmt_dbl As Double, mOphRemark_str As String
Rem blood issue payment receipt detail variables
Public mOpyEttCode_lng As Long, mOpyHpmCode_lng As Long, mOpyOhrCode_lng As Long, mOpyDepoAmt_dbl As Double, mOpyRemark_str As String
Rem blood issue refund receipt header variables
Public mOfhOpgCode_lng As Long, mOfhTime_lng As Long, mOfhOldOfhCode_lng As Long, mOfhEttCode_lng As Long, mOfhHpmCode_lng As Long, mOfhRefuAmt_dbl As Double, mOfhRemark_str As String
Rem blood issue refund receipt detail variables
Public mOfdEttCode_lng As Long, mOfdHpmCode_lng As Long, mOfdOhrCode_lng As Long, mOfdRefuAmt_dbl As Double, mOfdRemark_str As String
Rem ----------------------------- blood stock part -------------------------
Public mBinStkCode_lng As Long, mBinStkICode_lng As Long, mBinBldCode_lng As Long, mBinItmCode_lng As Long, mBinBdgCode_lng As Long, mBinBdcCode_lng As Long, mBinItrCode_lng As Long, mBinBldRefNo_str As String, mBinBldExpDt_dt As Date, mBinBldOkState_bln As Boolean, mBinEttCode_lng As Long, mBinEfmCode_lng As Long, mBinNarr_str As String, mBinBdpCode_lng As Long, mBinPckQty_dbl As Double, mBinBldQty_dbl As Double, mBinRemark_str As String
Rem blood-out header variables
Public mBohStkCode_lng As Long, mBohTime_lng As Long, mBohTime_str As String, mBohTrnRefNo_str As String, mBohTrnRefDt_dt As Date, mBohHpmRefNo_str As String, mBohHpmRefDt_dt As Date, mBohEttCode_lng As Long, mBohHpmCode_lng As Long, mBohPckQty_dbl As Double, mBohBldQty_dbl As Double, mBohRemark_str As String
Rem blood-out detail variables
Public mBouStkCode_lng As Long, mBouStkICode_lng As Long, mBouItmCode_lng As Long, mBouBldCode_lng As Long, mBouBdgCode_lng As Long, mBouBdcCode_lng As Long, mBouBdpCode_lng As Long, mBouItrCode_lng As Long, mBouBldRefNo_str As String, mBouEttCode_lng As Long, mBouHpmCode_lng As Long, mBouBinCode_lng As Long, mBouBinICode_lng As Long, mBouNarr_str As String, mBouPckQty_dbl As Double, mBouBldQty_dbl As Double, mBouRemark_str As String

Dim mActiveTran As Integer, aBdkTran() As Variant

Public Sub Init()
If blnBloodInTran = True Then
    mTrnHdrTableName = "BloodInHdr": mTrnDtlTableName = "BloodInDtl"
    mTrnHdrCodeField = "BihCode": mTrnDtlCodeField = "BinCode"
    mTrnHdrDateField = "BihDate": mTrnDtlDateField = "BinDate"
    mTrnHdrRecStateField = "BihRecState": mTrnDtlRecStateField = "BinRecState"
    mTrnHdrCmpCodeField = "BihCmpCode": mTrnDtlCmpCodeField = "BinCmpCode"
    mTrnVtmField = "BihVtmCode"
    mTrnPrefixField = "BihPrefix"
    mTrnVchNoField = "BihVchNo"
    mTrnPostfixField = "BihPostfix"
    mTrnDtlICodeField = "BinICode"
    mTrnDtlSnoField = "BinSno"
    mTitleName = "Blood In Entry"
    
ElseIf blnBloodOutTran = True Then
    mTrnHdrTableName = "BloodOutHdr": mTrnDtlTableName = "BloodOutDtl"
    mTrnHdrCodeField = "BohCode": mTrnDtlCodeField = "BouCode"
    mTrnHdrDateField = "BohDate": mTrnDtlDateField = "BouDate"
    mTrnHdrRecStateField = "BohRecState": mTrnDtlRecStateField = "BouRecState"
    mTrnHdrCmpCodeField = "BohCmpCode": mTrnDtlCmpCodeField = "BouCmpCode"
    mTrnVtmField = "BohVtmCode"
    mTrnPrefixField = "BohPrefix"
    mTrnVchNoField = "BohVchNo"
    mTrnPostfixField = "BohPostfix"
    mTrnDtlICodeField = "BouICode"
    mTrnDtlSnoField = "BouSno"
    mTitleName = "Blood Issue Entry"
    
ElseIf blnBldIsuRcptTran = True Then
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
    mTitleName = "Blood Issue Receipt"
    Rem service doctor detail
    mTrnSdcTableName = "OutdRcDctDtl"
    mTrnSdcCodeField = "OrdCode"
    mTrnSdcSubCodeField = "OrdOrcCode"
    mTrnSdcICodeField = "OrdICode"
    mTrnSdcSnoField = "OrdSno"
    mTrnSdcDateField = "OrdDate"
    mTrnSdcEttCodeField = "OrdEttCode"
    mTrnSdcSrvCodeField = "OrdSrvCode"
    mTrnSdcDctCodeField = "OrdDctCode"
    mTrnSdcDrlCodeField = "OrdDrlCode"
    mTrnSdcRemarkField = "OrdRemark"
    mTrnSdcRecStateField = "OrdRecState"
    mTrnSdcCmpCodeField = "OrdCmpCode"
    
ElseIf blnBldIsuPymtTran = True Then
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
    mTitleName = "Blood Issue Due Payment"
    
ElseIf blnBldIsuRefdTran = True Then
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
    mTitleName = "Blood Issue Refund"
    
Else
    ErrorBox "clsBdkMultiTranEntry_Init_#73_[Undefined Case]"
End If

End Sub

Public Property Set dbBdkDatabase(ByRef db As ADODB.Connection)
Set m_dbBdkDatabase = db

End Property

Public Property Set dbAcDatabase(ByRef db As ADODB.Connection)
Set m_dbAcDatabase = db

End Property

Public Property Set dbStDatabase(ByRef db As ADODB.Connection)
Set m_dbStDatabase = db

End Property

Public Property Set dbGrpDatabase(ByRef db As ADODB.Connection)
Set m_dbGrpDatabase = db

End Property

Public Property Set dbComDatabase(ByRef db As ADODB.Connection)
Set m_dbComDatabase = db

End Property

Private Sub Class_Initialize()
aBdkTran = Array()
mActiveTran = UBound(aBdkTran)

mClassUIdFileName = "clsBdkMultiTrn.UId"
mClassAcsPermFileName = "clsBdkMultiTrn.Acp"
mClassUIdCode = GetUIdCode("clsBdkMultiTranEntry_Initialize", mUIdFileName:=mClassUIdFileName, mAcsPermFileName:=mClassAcsPermFileName)
If mClassUIdCode = 0 Then
    ErrorBox cSYSBUSY_ACS_DENIED
End If

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
    
    If blnBloodInTran = True Then
        mBihStkCode_lng = .fields("BihStkCode")
        mBihTime_lng = .fields("BihTime")
        mBihTime_str = MinToTime(.fields("BihTime"))
        mBihTrnRefNo_str = .fields("BihTrnRefNo")
        mBihTrnRefDt_dt = .fields("BihTrnRefDt")
        mBihEttCode_lng = .fields("BihEttCode")
        mBihEfmCode_lng = .fields("BihEfmCode")
        mBihPckQty_dbl = .fields("BihPckQty")
        mBihBldQty_dbl = .fields("BihBldQty")
        mBihRemark_str = .fields("BihRemark")
        
    ElseIf blnBloodOutTran = True Then
        mBohStkCode_lng = .fields("BohStkCode")
        mBohTime_lng = .fields("BohTime")
        mBohTime_str = MinToTime(.fields("BohTime"))
        mBohTrnRefNo_str = .fields("BohTrnRefNo")
        mBohTrnRefDt_dt = .fields("BohTrnRefDt")
        mBohHpmRefNo_str = .fields("BohHpmRefNo")
        mBohHpmRefDt_dt = .fields("BohHpmRefDt")
        mBohEttCode_lng = .fields("BohEttCode")
        mBohHpmCode_lng = .fields("BohHpmCode")
        mBohPckQty_dbl = .fields("BohPckQty")
        mBohBldQty_dbl = .fields("BohBldQty")
        mBohRemark_str = .fields("BohRemark")
        
    ElseIf blnBldIsuRcptTran = True Then
        mOhrOpgCode_lng = .fields("OhrOpgCode")
        mOhrTime_lng = .fields("OhrTime")
        mOhrHpmRefNo_str = .fields("OhrHpmRefNo")
        mOhrHpmRefDt_dt = .fields("OhrHpmRefDt")
        mOhrOldOhrCode_lng = .fields("OhrOldOhrCode")
        mOhrEttCode_lng = .fields("OhrEttCode")
        mOhrHpmCode_lng = .fields("OhrHpmCode")
        mOhrEttDiscPer_dbl = .fields("OhrEttDiscPer")
        mOhrAmtBefDisc_dbl = .fields("OhrAmtBefDisc")
        mOhrDiscAmt_dbl = .fields("OhrDiscAmt")
        mOhrAmtAftDisc_dbl = .fields("OhrAmtAftDisc")
        mOhrAdvAmt_dbl = .fields("OhrAdvAmt")
        mOhrRecdAmt_dbl = .fields("OhrRecdAmt")
        mOhrDepoAmt_dbl = .fields("OhrDepoAmt")
        mOhrRefuAmt_dbl = .fields("OhrRefuAmt")
        mOhrBalAmt_dbl = .fields("OhrBalAmt")
        mOhrRemark_str = .fields("OhrRemark")
        
'        clsETT.GetData .fields("OhrEttCode")
        
    ElseIf blnBldIsuPymtTran = True Then
        mOphOpgCode_lng = .fields("OphOpgCode")
        mOphTime_lng = .fields("OphTime")
        mOphOldOphCode_lng = .fields("OphOldOphCode")
        mOphEttCode_lng = .fields("OphEttCode")
        mOphHpmCode_lng = .fields("OphHpmCode")
        mOphDepoAmt_dbl = .fields("OphDepoAmt")
        mOphRemark_str = .fields("OphRemark")
        
'        clsETT.GetData .fields("OphEttCode")
    
    ElseIf blnBldIsuRefdTran = True Then
        mOfhOpgCode_lng = .fields("OfhOpgCode")
        mOfhTime_lng = .fields("OfhTime")
        mOfhOldOfhCode_lng = .fields("OfhOldOfhCode")
        mOfhEttCode_lng = .fields("OfhEttCode")
        mOfhHpmCode_lng = .fields("OfhHpmCode")
        mOfhRefuAmt_dbl = .fields("OfhRefuAmt")
        mOfhRemark_str = .fields("OfhRemark")
        
'        clsETT.GetData .fields("OfhEttCode")
        
        
        
        
        
    Else
        ErrorBox "clsBdkMultiTranEntry_GetHdrData_#133_[Undefined Case]"
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
    AlertBox "Hello Administrator, Please Check it out !!!"
End If
If .RecordCount > 0 Then
    mTrnCode_lng = .fields(mTrnDtlCodeField)
    mTrnDtlICode_lng = .fields(mTrnDtlICodeField)
    mTrnDtlSno_int = .fields(mTrnDtlSnoField)
    mTrnDate_dt = .fields(mTrnDtlDateField)
    mTrnDtlRecState_int = .fields(mTrnDtlRecStateField)
    mTrnCmpCode_int = .fields(mTrnDtlCmpCodeField)
    
    If blnBloodInTran = True Then
        mBinStkCode_lng = .fields("BinStkCode")
        mBinStkICode_lng = .fields("BinStkICode")
        mBinEttCode_lng = .fields("BinEttCode")
        mBinEfmCode_lng = .fields("BinEfmCode")
        mBinBldCode_lng = .fields("BinBldCode")
        mBinItmCode_lng = .fields("BinItmCode")
        mBinBdgCode_lng = .fields("BinBdgCode")
        mBinBdcCode_lng = .fields("BinBdcCode")
        mBinItrCode_lng = .fields("BinItrCode")
        mBinBldRefNo_str = .fields("BinBldRefNo")
        mBinBldExpDt_dt = .fields("BinBldExpDt")
        mBinBldOkState_bln = .fields("BinBldOkState")
        mBinNarr_str = .fields("BinNarr")
        mBinBdpCode_lng = .fields("BinBdpCode")
        mBinPckQty_dbl = .fields("BinPckQty")
        mBinBldQty_dbl = .fields("BinBldQty")
        mBinRemark_str = .fields("BinRemark")
        
    ElseIf blnBloodOutTran = True Then
        mBouStkCode_lng = .fields("BouStkCode")
        mBouStkICode_lng = .fields("BouStkICode")
        mBouEttCode_lng = .fields("BouEttCode")
        mBouHpmCode_lng = .fields("BouHpmCode")
        mBouItmCode_lng = .fields("BouItmCode")
        mBouBldCode_lng = .fields("BouBldCode")
        mBouBdgCode_lng = .fields("BouBdgCode")
        mBouBdcCode_lng = .fields("BouBdcCode")
        mBouBdpCode_lng = .fields("BouBdpCode")
        mBouItrCode_lng = .fields("BouItrCode")
        mBouBldRefNo_str = .fields("BouBldRefNo")
        mBouBinCode_lng = .fields("BouBinCode")
        mBouBinICode_lng = .fields("BouBinICode")
        mBouNarr_str = .fields("BouNarr")
        mBouPckQty_dbl = .fields("BouPckQty")
        mBouBldQty_dbl = .fields("BouBldQty")
        mBouRemark_str = .fields("BouRemark")
        
    ElseIf blnBldIsuRcptTran = True Then
        mOrcEttCode_lng = .fields("OrcEttCode")
        mOrcHpmCode_lng = .fields("OrcHpmCode")
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
        
'        clsSRV.GetData .fields("OrcSrvCode")
    
    ElseIf blnBldIsuPymtTran = True Then
        mOpyEttCode_lng = .fields("OpyEttCode")
        mOpyHpmCode_lng = .fields("OpyHpmCode")
        mOpyOhrCode_lng = .fields("OpyOhrCode")
        mOpyDepoAmt_dbl = .fields("OpyDepoAmt")
        mOpyRemark_str = .fields("OpyRemark")
        
    ElseIf blnBldIsuRefdTran = True Then
        mOfdEttCode_lng = .fields("OfdEttCode")
        mOfdHpmCode_lng = .fields("OfdHpmCode")
        mOfdOhrCode_lng = .fields("OfdOhrCode")
        mOfdRefuAmt_dbl = .fields("OfdRefuAmt")
        mOfdRemark_str = .fields("OfdRemark")
        
        
        
        
        
        
        
        
    Else
        ErrorBox "clsBdkMultiTranEntry_GetDtlData_#173_[Undefined Case]"
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
    mSdcEttCode_lng = .fields(mTrnSdcEttCodeField)
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

If blnBloodInTran = True Then
    mBihStkCode_lng = 0
    mBihTime_lng = 0
    mBihTime_str = ""
    mBihTrnRefNo_str = ""
    mBihTrnRefDt_dt = cUNKNOWNDATE
    mBihEttCode_lng = 0
    mBihEfmCode_lng = 0
    mBihPckQty_dbl = 0
    mBihBldQty_dbl = 0
    mBihRemark_str = ""
    
ElseIf blnBloodOutTran = True Then
    mBohStkCode_lng = 0
    mBohTime_lng = 0
    mBohTime_str = ""
    mBohTrnRefNo_str = ""
    mBohTrnRefDt_dt = cUNKNOWNDATE
    mBohHpmRefNo_str = ""
    mBohHpmRefDt_dt = cUNKNOWNDATE
    mBohEttCode_lng = 0
    mBohHpmCode_lng = 0
    mBohPckQty_dbl = 0
    mBohBldQty_dbl = 0
    mBohRemark_str = ""
    
ElseIf blnBldIsuRcptTran = True Then
    mOhrOpgCode_lng = 0
    mOhrTime_lng = 0
    mOhrHpmRefNo_str = ""
    mOhrHpmRefDt_dt = cUNKNOWNDATE
    mOhrOldOhrCode_lng = 0
    mOhrEttCode_lng = 0
    mOhrHpmCode_lng = 0
    mOhrEttDiscPer_dbl = 0
    mOhrAmtBefDisc_dbl = 0
    mOhrDiscAmt_dbl = 0
    mOhrAmtAftDisc_dbl = 0
    mOhrAdvAmt_dbl = 0
    mOhrRecdAmt_dbl = 0
    mOhrDepoAmt_dbl = 0
    mOhrRefuAmt_dbl = 0
    mOhrBalAmt_dbl = 0
    mOhrRemark_str = ""
    
'    clsETT.Clear

ElseIf blnBldIsuPymtTran = True Then
    mOphOpgCode_lng = 0
    mOphTime_lng = 0
    mOphOldOphCode_lng = 0
    mOphEttCode_lng = 0
    mOphHpmCode_lng = 0
    mOphDepoAmt_dbl = 0
    mOphRemark_str = ""
    
'    clsETT.Clear

ElseIf blnBldIsuRefdTran = True Then
    mOfhOpgCode_lng = 0
    mOfhTime_lng = 0
    mOfhOldOfhCode_lng = 0
    mOfhEttCode_lng = 0
    mOfhHpmCode_lng = 0
    mOfhRefuAmt_dbl = 0
    mOfhRemark_str = ""
    
'    clsETT.Clear
    
    
    
    
    
    
    
    
Else
    ErrorBox "clsBdkMultiTranEntry_ClearHdr_#212_[Undefined Case]"
End If

End Sub

Public Sub ClearDtl()

mTrnCode_lng = 0
mTrnDtlICode_lng = 0
mTrnDtlSno_int = 0
mTrnDate_dt = cUNKNOWNDATE
mTrnDtlRecState_int = 0
mTrnCmpCode_int = 0

If blnBloodInTran = True Then
    mBinStkCode_lng = 0
    mBinStkICode_lng = 0
    mBinEttCode_lng = 0
    mBinEfmCode_lng = 0
    mBinBldCode_lng = 0
    mBinItmCode_lng = 0
    mBinBdgCode_lng = 0
    mBinBdcCode_lng = 0
    mBinItrCode_lng = 0
    mBinBldRefNo_str = ""
    mBinBldExpDt_dt = cUNKNOWNDATE
    mBinBldOkState_bln = False
    mBinNarr_str = ""
    mBinBdpCode_lng = 0
    mBinPckQty_dbl = 0
    mBinBldQty_dbl = 0
    mBinRemark_str = ""
    
ElseIf blnBloodOutTran = True Then
    mBouStkCode_lng = 0
    mBouStkICode_lng = 0
    mBouEttCode_lng = 0
    mBouHpmCode_lng = 0
    mBouItmCode_lng = 0
    mBouBldCode_lng = 0
    mBouBdgCode_lng = 0
    mBouBdcCode_lng = 0
    mBouBdpCode_lng = 0
    mBouItrCode_lng = 0
    mBouBldRefNo_str = ""
    mBouBinCode_lng = 0
    mBouBinICode_lng = 0
    mBouNarr_str = ""
    mBouPckQty_dbl = 0
    mBouBldQty_dbl = 0
    mBouRemark_str = ""
    
ElseIf blnBldIsuRcptTran = True Then
    mOrcEttCode_lng = 0
    mOrcHpmCode_lng = 0
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
    
'    clsSRV.Clear

ElseIf blnBldIsuPymtTran = True Then
    mOpyEttCode_lng = 0
    mOpyHpmCode_lng = 0
    mOpyOhrCode_lng = 0
    mOpyDepoAmt_dbl = 0
    mOpyRemark_str = ""

ElseIf blnBldIsuRefdTran = True Then
    mOfdEttCode_lng = 0
    mOfdHpmCode_lng = 0
    mOfdOhrCode_lng = 0
    mOfdRefuAmt_dbl = 0
    mOfdRemark_str = ""
    
    
    
    
    
    
    
    
Else
    ErrorBox "clsBdkMultiTranEntry_ClearDtl_#244_[Undefined Case]"
End If

End Sub

Public Sub ClearSdc()
mSdcCode_lng = 0
mSdcSubCode_lng = 0
mSdcICode_lng = 0
mSdcSno_int = 0
mSdcDate_dt = cUNKNOWNDATE
mSdcSrvCode_lng = 0
mSdcEttCode_lng = 0
mSdcDctCode_lng = 0
mSdcDrlCode_lng = 0
mSdcRemark_str = ""
mSdcRecState_int = 0
mSdcCmpCode_int = 0

End Sub

Private Sub Class_Terminate()
If UBound(aBdkTran) > LBound(aBdkTran) Then
    ErrorBox mTitleName & " Entry in Process !!!"
End If

End Sub

Public Function BeginTran(ByVal mTrnCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset

BeginTran = False

If mTrnCode = 0 Then
    mTrnCode = GetUIdCode("clsBdkMultiTranEntry_BeginTran", mUIdFileName:=mClassUIdFileName, mAcsPermFileName:=mClassAcsPermFileName) * -1
    If mTrnCode = 0 Then
        ErrorBox "clsBdkMultiTranEntry_BeginTran_#266_[Invalid " & mTitleName & " Code]"
        GoTo EndSub
    End If
ElseIf mTrnCode > 0 Then
    tRecset.open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.RecordCount = 0 Then
        ErrorBox "clsBdkMultiTranEntry_BeginTran_#272_[Entry not Found]"
        GoTo EndSub
    End If
    CloseTable tRecset
Else
    ErrorBox "clsBdkMultiTranEntry_BeginTran_#277_[Invalid " & mTitleName & " Entry Code Request]"
    GoTo EndSub
End If
mActiveTran = UBound(aBdkTran) + 1
ReDim Preserve aBdkTran(mActiveTran)
aBdkTran(mActiveTran) = mTrnCode

Call Data_CreateLog(mTrnCode)
BeginTran = True

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Function

End Function

Public Function GetDtlTranUnqCode() As Long
Dim mRtnval As Long

mRtnval = GetUIdCode("clsBdkMultiTranDtlEntry_BeginTran", mUIdFileName:=mClassDtlUIdFileName, mAcsPermFileName:=mClassDtlAcsPermFileName) * -1

GetDtlTranUnqCode = mRtnval

End Function

Public Function EndTran(ByVal mTrnCode As Long) As Boolean
Dim mCnt As Integer

EndTran = False
If Chk_ActiveTran() = False Or IIf(ActiveTrnCode > 0, mTrnCode <> ActiveTrnCode, False) Then
    ErrorBox "clsBdkMultiTranEntry_EndTran_#294_[InActive Transaction Entry]"
    Exit Function
End If
Call Data_RemoveLog(mTrnCode)

For mCnt = (mActiveTran + 1) To UBound(aBdkTran)
    If (mCnt - 1) >= LBound(aBdkTran) Then
        aBdkTran(mCnt - 1) = aBdkTran(mCnt)
    End If
Next mCnt
If LBound(aBdkTran) = UBound(aBdkTran) Then
    aBdkTran = Array()
Else
    ReDim Preserve aBdkTran(UBound(aBdkTran) - 1)
End If
If mActiveTran > UBound(aBdkTran) Then
    mActiveTran = mActiveTran - 1
End If

EndTran = True
End Function

Public Property Get ActiveTrnCode() As Long
On Error GoTo errhand

ActiveTrnCode = aBdkTran(mActiveTran)

Exit Property

errhand:
ErrorBox Err.Description
ActiveTrnCode = -1
Exit Property

End Property

Public Function UpdateTran(ByVal mTrnCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset, mTmpTrnCode As Long, mTrnSno As Integer
Dim mSdcSubCode As Long

UpdateTran = False
mTmpTrnCode = ActiveTrnCode

On Error GoTo errhand

Rem header section
m_dbBdkDatabase.BeginTrans
With tRecset
.open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Do While .EOF = False
        If InList(.fields(mTrnHdrRecStateField), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
            If blnBldIsuRcptTran = True Then
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
m_dbBdkDatabase.CommitTrans
CloseTable tRecset

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
            If blnBloodInTran = True Then
                If .fields("BinEttCode") <> mBihEttCode_lng Then
                    .fields("BinEttCode") = mBihEttCode_lng
                End If
                If .fields("BinEfmCode") <> mBihEfmCode_lng Then
                    .fields("BinEfmCode") = mBihEfmCode_lng
                End If
                If .fields("BinStkCode") <> mBihStkCode_lng Then
                    .fields("BinStkCode") = mBihStkCode_lng
                End If
                
            ElseIf blnBloodOutTran = True Then
                If .fields("BouEttCode") <> mBohEttCode_lng Then
                    .fields("BouEttCode") = mBohEttCode_lng
                End If
                If .fields("BouHpmCode") <> mBohHpmCode_lng Then
                    .fields("BouHpmCode") = mBohHpmCode_lng
                End If
                If .fields("BouStkCode") <> mBohStkCode_lng Then
                    .fields("BouStkCode") = mBohStkCode_lng
                End If
                
            ElseIf blnBldIsuRcptTran = True Then
                If .fields("OrcEttCode") <> mOhrEttCode_lng Then
                    .fields("OrcEttCode") = mOhrEttCode_lng
                End If
                If .fields("OrcHpmCode") <> mOhrHpmCode_lng Then
                    .fields("OrcHpmCode") = mOhrHpmCode_lng
                End If
            
            ElseIf blnBldIsuPymtTran = True Then
                If .fields("OpyEttCode") <> mOphEttCode_lng Then
                    .fields("OpyEttCode") = mOphEttCode_lng
                End If
                If .fields("OpyHpmCode") <> mOphHpmCode_lng Then
                    .fields("OpyHpmCode") = mOphHpmCode_lng
                End If
            
            ElseIf blnBldIsuRefdTran = True Then
                If .fields("OfdEttCode") <> mOfhEttCode_lng Then
                    .fields("OfdEttCode") = mOfhEttCode_lng
                End If
                If .fields("OfdHpmCode") <> mOfhHpmCode_lng Then
                    .fields("OfdHpmCode") = mOfhHpmCode_lng
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
    If blnBldIsuRcptTran = True Then
        DispersePropRcptRecdAmt mTrnCode
    End If
    
End If
End With
m_dbBdkDatabase.CommitTrans
CloseTable tRecset

Rem service doctor detail updations
If blnBldIsuRcptTran = True Then
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
                If blnBldIsuRcptTran = True Then
                    If .fields(mTrnSdcEttCodeField) <> mOhrEttCode_lng Then
                        .fields(mTrnSdcEttCodeField) = mOhrEttCode_lng
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

Private Sub DispersePropRcptRecdAmt(ByVal mTrnCode As Long)
Dim tRecset As New ADODB.Recordset, mRecdAmtBal As Double, mRecdAmtTot As Double, mPropRecdAmt As Double, mAmtAftDiscTot As Double

With tRecset
.open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
mRecdAmtBal = .fields("OhrRecdAmt")
mRecdAmtTot = .fields("OhrRecdAmt")
mAmtAftDiscTot = .fields("OhrAmtAftDisc")
End With
CloseTable tRecset

With tRecset
.open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnDtlICodeField & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    m_dbBdkDatabase.BeginTrans
    Do While .EOF = False
        If InList(.fields("OrcRecState"), Array(cREC_UNCHANGED)) = True Then
            mPropRecdAmt = Round(mRecdAmtTot * .fields("OrcAmtAftDisc") / mAmtAftDiscTot, 2)
            
            .fields("OrcRecdAmt") = mPropRecdAmt
            .fields("OrcBalAmt") = .fields("OrcAmtAftDisc") - (.fields("OrcAdvAmt") + .fields("OrcDepoAmt")) - mPropRecdAmt
            .Update
                
            mRecdAmtBal = mRecdAmtBal - mPropRecdAmt
        Else
            If InList(.fields("OrcRecState"), Array(cREC_CANCELED, cREC_DELETED)) = False Then
                ErrorBox "clsBdkMultiTranEntry_DispersePropRcptRecdAmt_#2316_[Invalid Record Status]"
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
    m_dbBdkDatabase.CommitTrans
Else
    If mRecdAmtBal <> 0 Then
        ErrorBox "clsBdkMultiTranEntry_DispersePropRcptRecdAmt_#3002_[Unexpected]"
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
    ErrorBox "clsBdkMultiTranEntry_CancelTran_#419_[InActive Transaction Entry]"
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
            
            If blnBloodInTran = True Then
                .fields("BihStkCode") = t2Recset.fields("BihStkCode")
                .fields("BihTime") = t2Recset.fields("BihTime")
                .fields("BihTrnRefNo") = t2Recset.fields("BihTrnRefNo")
                .fields("BihTrnRefDt") = t2Recset.fields("BihTrnRefDt")
                .fields("BihEttCode") = t2Recset.fields("BihEttCode")
                .fields("BihEfmCode") = t2Recset.fields("BihEfmCode")
                .fields("BihPckQty") = t2Recset.fields("BihPckQty")
                .fields("BihBldQty") = t2Recset.fields("BihBldQty")
                .fields("BihRemark") = t2Recset.fields("BihRemark")
                
            ElseIf blnBloodOutTran = True Then
                .fields("BohStkCode") = t2Recset.fields("BohStkCode")
                .fields("BohTime") = t2Recset.fields("BohTime")
                .fields("BohTrnRefNo") = t2Recset.fields("BohTrnRefNo")
                .fields("BohTrnRefDt") = t2Recset.fields("BohTrnRefDt")
                .fields("BohHpmRefNo") = t2Recset.fields("BohHpmRefNo")
                .fields("BohHpmRefDt") = t2Recset.fields("BohHpmRefDt")
                .fields("BohEttCode") = t2Recset.fields("BohEttCode")
                .fields("BohHpmCode") = t2Recset.fields("BohHpmCode")
                .fields("BohPckQty") = t2Recset.fields("BohPckQty")
                .fields("BohBldQty") = t2Recset.fields("BohBldQty")
                .fields("BohRemark") = t2Recset.fields("BohRemark")
                
            ElseIf blnBldIsuRcptTran = True Then
                .fields("OhrOpgCode") = t2Recset.fields("OhrOpgCode")
                .fields("OhrTime") = t2Recset.fields("OhrTime")
                .fields("OhrHpmRefNo") = t2Recset.fields("OhrHpmRefNo")
                .fields("OhrHpmRefDt") = t2Recset.fields("OhrHpmRefDt")
                .fields("OhrOldOhrCode") = t2Recset.fields("OhrOldOhrCode")
                .fields("OhrEttCode") = t2Recset.fields("OhrEttCode")
                .fields("OhrHpmCode") = t2Recset.fields("OhrHpmCode")
                .fields("OhrEttDiscPer") = t2Recset.fields("OhrEttDiscPer")
                .fields("OhrAmtBefDisc") = t2Recset.fields("OhrAmtBefDisc")
                .fields("OhrDiscAmt") = t2Recset.fields("OhrDiscAmt")
                .fields("OhrAmtAftDisc") = t2Recset.fields("OhrAmtAftDisc")
                .fields("OhrAdvAmt") = t2Recset.fields("OhrAdvAmt")
                .fields("OhrRecdAmt") = t2Recset.fields("OhrRecdAmt")
                .fields("OhrDepoAmt") = t2Recset.fields("OhrDepoAmt")
                .fields("OhrRefuAmt") = t2Recset.fields("OhrRefuAmt")
                .fields("OhrBalAmt") = t2Recset.fields("OhrBalAmt")
                .fields("OhrRemark") = t2Recset.fields("OhrRemark")
            
            ElseIf blnBldIsuPymtTran = True Then
                .fields("OphOpgCode") = t2Recset.fields("OphOpgCode")
                .fields("OphTime") = t2Recset.fields("OphTime")
                .fields("OphOldOphCode") = t2Recset.fields("OphOldOphCode")
                .fields("OphEttCode") = t2Recset.fields("OphEttCode")
                .fields("OphHpmCode") = t2Recset.fields("OphHpmCode")
                .fields("OphDepoAmt") = t2Recset.fields("OphDepoAmt")
                .fields("OphRemark") = t2Recset.fields("OphRemark")
                
            ElseIf blnBldIsuRefdTran = True Then
                .fields("OfhOpgCode") = t2Recset.fields("OfhOpgCode")
                .fields("OfhTime") = t2Recset.fields("OfhTime")
                .fields("OfhOldOfhCode") = t2Recset.fields("OfhOldOfhCode")
                .fields("OfhEttCode") = t2Recset.fields("OfhEttCode")
                .fields("OfhHpmCode") = t2Recset.fields("OfhHpmCode")
                .fields("OfhRefuAmt") = t2Recset.fields("OfhRefuAmt")
                .fields("OfhRemark") = t2Recset.fields("OfhRemark")
                
                
                
                
                
            Else
                ErrorBox "clsBdkMultiTranEntry_CancelTran_#459_[Undefined Case]"
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
m_dbBdkDatabase.CommitTrans
CloseTable t1Recset
CloseTable t2Recset

Rem detail section
If mTrnDtlTableName <> "" Then
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
                
                If blnBloodInTran = True Then
                    .fields("BinStkCode") = t2Recset.fields("BinStkCode")
                    .fields("BinStkICode") = t2Recset.fields("BinStkICode")
                    .fields("BinEttCode") = t2Recset.fields("BinEttCode")
                    .fields("BinEfmCode") = t2Recset.fields("BinEfmCode")
                    .fields("BinBldCode") = t2Recset.fields("BinBldCode")
                    .fields("BinItmCode") = t2Recset.fields("BinItmCode")
                    .fields("BinBdgCode") = t2Recset.fields("BinBdgCode")
                    .fields("BinBdcCode") = t2Recset.fields("BinBdcCode")
                    .fields("BinItrCode") = t2Recset.fields("BinItrCode")
                    .fields("BinBldRefNo") = t2Recset.fields("BinBldRefNo")
                    .fields("BinBldExpDt") = t2Recset.fields("BinBldExpDt")
                    .fields("BinBldOkState") = t2Recset.fields("BinBldOkState")
                    .fields("BinNarr") = t2Recset.fields("BinNarr")
                    .fields("BinBdpCode") = t2Recset.fields("BinBdpCode")
                    .fields("BinPckQty") = t2Recset.fields("BinPckQty")
                    .fields("BinBldQty") = t2Recset.fields("BinBldQty")
                    .fields("BinRemark") = t2Recset.fields("BinRemark")
                    
                ElseIf blnBloodOutTran = True Then
                    .fields("BouStkCode") = t2Recset.fields("BouStkCode")
                    .fields("BouStkICode") = t2Recset.fields("BouStkICode")
                    .fields("BouEttCode") = t2Recset.fields("BouEttCode")
                    .fields("BouHpmCode") = t2Recset.fields("BouHpmCode")
                    .fields("BouItmCode") = t2Recset.fields("BouItmCode")
                    .fields("BouBldCode") = t2Recset.fields("BouBldCode")
                    .fields("BouBdgCode") = t2Recset.fields("BouBdgCode")
                    .fields("BouBdcCode") = t2Recset.fields("BouBdcCode")
                    .fields("BouBdpCode") = t2Recset.fields("BouBdpCode")
                    .fields("BouItrCode") = t2Recset.fields("BouItrCode")
                    .fields("BouBldRefNo") = t2Recset.fields("BouBldRefNo")
                    .fields("BouBinCode") = t2Recset.fields("BouBinCode")
                    .fields("BouBinICode") = t2Recset.fields("BouBinICode")
                    .fields("BouNarr") = t2Recset.fields("BouNarr")
                    .fields("BouPckQty") = t2Recset.fields("BouPckQty")
                    .fields("BouBldQty") = t2Recset.fields("BouBldQty")
                    .fields("BouRemark") = t2Recset.fields("BouRemark")
                    
                ElseIf blnBldIsuRcptTran = True Then
                    .fields("OrcEttCode") = t2Recset.fields("OrcEttCode")
                    .fields("OrcHpmCode") = t2Recset.fields("OrcHpmCode")
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
                
                ElseIf blnBldIsuPymtTran = True Then
                    mOpyOhrCode = .fields("OpyOhrCode")
                    mOpyDepoAmt = .fields("OpyDepoAmt")
                    
                    .fields("OpyEttCode") = t2Recset.fields("OpyEttCode")
                    .fields("OpyHpmCode") = t2Recset.fields("OpyHpmCode")
                    .fields("OpyOhrCode") = t2Recset.fields("OpyOhrCode")
                    .fields("OpyDepoAmt") = t2Recset.fields("OpyDepoAmt")
                    .fields("OpyRemark") = t2Recset.fields("OpyRemark")
                    
                ElseIf blnBldIsuRefdTran = True Then
                    mOfdOhrCode = .fields("OfdOhrCode")
                    mOfdRefuAmt = .fields("OfdRefuAmt")
                    
                    .fields("OfdEttCode") = t2Recset.fields("OfdEttCode")
                    .fields("OfdHpmCode") = t2Recset.fields("OfdHpmCode")
                    .fields("OfdOhrCode") = t2Recset.fields("OfdOhrCode")
                    .fields("OfdRefuAmt") = t2Recset.fields("OfdRefuAmt")
                    .fields("OfdRemark") = t2Recset.fields("OfdRemark")
                    
                    
                    
                    
                    
                    
                    
                    
                Else
                    ErrorBox "clsBdkMultiTranEntry_CancelTran_#506_[Undefined Case]"
                End If
                .Update
            
                If blnBldIsuPymtTran = True Then
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
                
                ElseIf blnBldIsuRefdTran = True Then
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
                End If
                
            Else
                mRecAdded = False
                mRecCanceled = False
                If .fields(mTrnDtlRecStateField) = cREC_ADDED = True Then
                    mRecAdded = True
                ElseIf .fields(mTrnDtlRecStateField) = cREC_CANCELED = True Then
                    mRecCanceled = True
                End If
            
                If blnBldIsuPymtTran = True Then
                    mOpyOhrCode = .fields("OpyOhrCode")
                    mOpyDepoAmt = .fields("OpyDepoAmt")
                    
                ElseIf blnBldIsuRefdTran = True Then
                    mOfdOhrCode = .fields("OfdOhrCode")
                    mOfdRefuAmt = .fields("OfdRefuAmt")
                End If
            
            
                .fields(mTrnDtlRecStateField) = ChkDeleteRecStatus(.fields(mTrnDtlRecStateField))
                .Update
                .Delete
                
                
                If mRecAdded = True Then
                    If blnBldIsuPymtTran = True Then
                        DispersePropRcptDepoAmt mOpyOhrCode, (mOpyDepoAmt * -1)
                    ElseIf blnBldIsuRefdTran = True Then
                        DispersePropRcptRefuAmt mOfdOhrCode, (mOfdRefuAmt * -1)
                    End If
                End If
            End If
        
            .MoveNext
        Loop
    End If
    End With
    m_dbBdkDatabase.CommitTrans
    CloseTable t1Recset
    CloseTable t2Recset
End If


Rem service doctor detail section
If blnBldIsuRcptTran = True Then
    m_dbBdkDatabase.BeginTrans
    With t1Recset
    .open "Select * from " & mTrnSdcTableName & " where " & mTrnSdcCodeField & "=" & CStr(mTrnCode), m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
    t2Recset.open "Select * from " & mTrnSdcTableName & "_Log where " & mTrnSdcCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnSdcICodeField & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
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
                .fields(mTrnSdcEttCodeField) = t2Recset.fields(mTrnSdcEttCodeField)
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
            .fields(mTrnSdcEttCodeField) = t2Recset.fields(mTrnSdcEttCodeField)
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

Public Function DeleteTran(ByVal mTrnCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset

DeleteTran = False
If Chk_ActiveTran() = False Or mTrnCode <> ActiveTrnCode Then
    ErrorBox "clsBdkMultiTranEntry_DeleteTran_#551_[InActive Transaction Entry]"
    GoTo EndSub
End If
On Error GoTo errhand

Rem header section
m_dbBdkDatabase.BeginTrans
With tRecset
.open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
Do While .EOF = False
    .fields(mTrnHdrRecStateField) = ChkDeleteRecStatus(.fields(mTrnHdrRecStateField))
    .Update
    '' .Delete deleted in update transaction
    .MoveNext
Loop
End With
m_dbBdkDatabase.CommitTrans
CloseTable tRecset

Rem detail section
m_dbBdkDatabase.BeginTrans
With tRecset
.open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnDtlICodeField & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
Do While .EOF = False
    .fields(mTrnDtlRecStateField) = ChkDeleteRecStatus(.fields(mTrnDtlRecStateField))
    .Update
    '' .Delete deleted in update transaction
    If blnBldIsuPymtTran = True Then
        DispersePropRcptDepoAmt .fields("OpyOhrCode"), (.fields("OpyDepoAmt") * -1)
    ElseIf blnBldIsuRefdTran = True Then
        DispersePropRcptRefuAmt .fields("OfdOhrCode"), (.fields("OfdRefuAmt") * -1)
    End If
    
    .MoveNext
Loop
End With
m_dbBdkDatabase.CommitTrans
CloseTable tRecset

Rem service doctor detail deletion marking
If blnBldIsuRcptTran = True Then
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
If mTrnCode = 0 Then
    ErrorBox "clsBdkMultiTranEntry_SelectTran_#412_[Invalid " & mTitleName & " Entry]"
    Exit Function
End If
mEntryFound = False
For mActiveTran = LBound(aBdkTran) To UBound(aBdkTran)
    If aBdkTran(mActiveTran) = mTrnCode Then
        mEntryFound = True
        Exit For
    End If
Next mActiveTran
If mEntryFound = False Then
    mActiveTran = UBound(aBdkTran) + 1
End If

SelectTran = True
End Function

Public Function NextTran() As Boolean
NextTran = False
If EOTran = True Then
    ErrorBox "clsBdkMultiTranEntry_NextTran_#432_[End of " & mTitleName & " Entry]"
    Exit Function
End If
mActiveTran = mActiveTran + 1

NextTran = True
End Function

Public Function PreviousTran()
PreviousTran = False
If BOTrn = True Then
    ErrorBox "clsBdkMultiTranEntry_PreviousTran_#443_[Begining of " & mTitleName & " Entry]"
    Exit Function
End If
mActiveTran = mActiveTran - 1

PreviousTran = True
End Function

Public Function FirstTran() As Boolean
FirstTran = False
If CountTran = 0 Then
    ErrorBox "clsBdkMultiTranEntry_FirstTran_#454_[No " & mTitleName & " Entry]"
    Exit Function
End If
mActiveTran = LBound(aBdkTran)

FirstTran = True

End Function

Public Function LastTran() As Boolean
LastTran = False
If CountTran = 0 Then
    ErrorBox "clsBdkMultiTranEntry_LastTran_#466_[No " & mTitleName & " Entry]"
    Exit Function
End If
mActiveTran = UBound(aBdkTran)

LastTran = True

End Function

Public Property Get CountTran() As Integer
If UBound(aBdkTran) = -1 Then
    CountTran = 0
Else
    CountTran = UBound(aBdkTran) - LBound(aBdkTran) + 1
End If

End Property

Public Property Get EOTran() As Boolean
EOTran = (mActiveTran > UBound(aBdkTran) Or UBound(aBdkTran) = -1)
End Property

Public Property Get BOTrn() As Boolean
BOTrn = (mActiveTran < LBound(aBdkTran) Or UBound(aBdkTran) = -1)
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
    ErrorBox "clsBdkMultiTranEntry_AddNewHdr_#736_[InActive " & mTitleName & " Entry]"
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

If blnBloodInTran = True Then
    .fields("BihStkCode") = mBihStkCode_lng
    .fields("BihTime") = mBihTime_lng
    .fields("BihTrnRefNo") = mBihTrnRefNo_str
    .fields("BihTrnRefDt") = mBihTrnRefDt_dt
    .fields("BihEttCode") = mBihEttCode_lng
    .fields("BihEfmCode") = mBihEfmCode_lng
    .fields("BihPckQty") = mBihPckQty_dbl
    .fields("BihBldQty") = mBihBldQty_dbl
    .fields("BihRemark") = mBihRemark_str
    
ElseIf blnBloodOutTran = True Then
    .fields("BohStkCode") = mBohStkCode_lng
    .fields("BohTime") = mBohTime_lng
    .fields("BohTrnRefNo") = mBohTrnRefNo_str
    .fields("BohTrnRefDt") = mBohTrnRefDt_dt
    .fields("BohHpmRefNo") = mBohHpmRefNo_str
    .fields("BohHpmRefDt") = mBohHpmRefDt_dt
    .fields("BohEttCode") = mBohEttCode_lng
    .fields("BohHpmCode") = mBohHpmCode_lng
    .fields("BohPckQty") = mBohPckQty_dbl
    .fields("BohBldQty") = mBohBldQty_dbl
    .fields("BohRemark") = mBohRemark_str
    
ElseIf blnBldIsuRcptTran = True Then
    .fields("OhrOpgCode") = mOhrOpgCode_lng
    .fields("OhrTime") = mOhrTime_lng
    .fields("OhrHpmRefNo") = mOhrHpmRefNo_str
    .fields("OhrHpmRefDt") = mOhrHpmRefDt_dt
    .fields("OhrOldOhrCode") = mOhrOldOhrCode_lng
    .fields("OhrEttCode") = mOhrEttCode_lng
    .fields("OhrHpmCode") = mOhrHpmCode_lng
    .fields("OhrEttDiscPer") = mOhrEttDiscPer_dbl
    .fields("OhrAmtBefDisc") = mOhrAmtBefDisc_dbl
    .fields("OhrDiscAmt") = mOhrDiscAmt_dbl
    .fields("OhrAmtAftDisc") = mOhrAmtAftDisc_dbl
    .fields("OhrAdvAmt") = mOhrAdvAmt_dbl
    .fields("OhrRecdAmt") = mOhrRecdAmt_dbl
    .fields("OhrDepoAmt") = mOhrDepoAmt_dbl
    .fields("OhrRefuAmt") = mOhrRefuAmt_dbl
    .fields("OhrBalAmt") = mOhrBalAmt_dbl
    .fields("OhrRemark") = mOhrRemark_str

ElseIf blnBldIsuPymtTran = True Then
    .fields("OphOpgCode") = mOphOpgCode_lng
    .fields("OphTime") = mOphTime_lng
    .fields("OphOldOphCode") = mOphOldOphCode_lng
    .fields("OphEttCode") = mOphEttCode_lng
    .fields("OphHpmCode") = mOphHpmCode_lng
    .fields("OphDepoAmt") = mOphDepoAmt_dbl
    .fields("OphRemark") = mOphRemark_str
    
ElseIf blnBldIsuRefdTran = True Then
    .fields("OfhOpgCode") = mOfhOpgCode_lng
    .fields("OfhTime") = mOfhTime_lng
    .fields("OfhOldOfhCode") = mOfhOldOfhCode_lng
    .fields("OfhEttCode") = mOfhEttCode_lng
    .fields("OfhHpmCode") = mOfhHpmCode_lng
    .fields("OfhRefuAmt") = mOfhRefuAmt_dbl
    .fields("OfhRemark") = mOfhRemark_str
    
    
    
    
    
    
    
    
Else
    ErrorBox "clsBdkMultiTranEntry_AddNewHdr_#776_[Undefined Case]"
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
Dim tRecset As New ADODB.Recordset
Dim mTmpDtlICode As Long

AddNewDtl = False
If Chk_ActiveTran() = False Or mTrnCode <> ActiveTrnCode Then
    ErrorBox "clsBdkMultiTranEntry_AddNewDtl_#810_[InActive " & mTitleName & " Entry]"
    GoTo EndSub
End If

On Error GoTo errhand
mTrnDtlICode_lng = 0

m_dbBdkDatabase.BeginTrans
With tRecset
.open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=-0.1", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
.AddNew

Rem mTrnDtlICode_lng = AutoNumber
.fields(mTrnDtlCodeField) = mTrnCode
.fields(mTrnDtlSnoField) = mTrnDtlSno_int
.fields(mTrnDtlDateField) = mTrnDate_dt
.fields(mTrnDtlCmpCodeField) = mTrnCmpCode_int
.fields(mTrnDtlRecStateField) = ChkEditRecStatus(.fields(mTrnDtlRecStateField))

If blnBloodInTran = True Then
    .fields("BinStkCode") = mBinStkCode_lng
    .fields("BinStkICode") = mBinStkICode_lng
    .fields("BinEttCode") = mBinEttCode_lng
    .fields("BinEfmCode") = mBinEfmCode_lng
    .fields("BinBldCode") = mBinBldCode_lng
    .fields("BinItmCode") = mBinItmCode_lng
    .fields("BinBdgCode") = mBinBdgCode_lng
    .fields("BinBdcCode") = mBinBdcCode_lng
    .fields("BinItrCode") = mBinItrCode_lng
    .fields("BinBldRefNo") = mBinBldRefNo_str
    .fields("BinBldExpDt") = mBinBldExpDt_dt
    .fields("BinBldOkState") = mBinBldOkState_bln
    .fields("BinNarr") = mBinNarr_str
    .fields("BinBdpCode") = mBinBdpCode_lng
    .fields("BinPckQty") = mBinPckQty_dbl
    .fields("BinBldQty") = mBinBldQty_dbl
    .fields("BinRemark") = mBinRemark_str
    
ElseIf blnBloodOutTran = True Then
    .fields("BouStkCode") = mBouStkCode_lng
    .fields("BouStkICode") = mBouStkICode_lng
    .fields("BouEttCode") = mBouEttCode_lng
    .fields("BouHpmCode") = mBouHpmCode_lng
    .fields("BouItmCode") = mBouItmCode_lng
    .fields("BouBldCode") = mBouBldCode_lng
    .fields("BouBdgCode") = mBouBdgCode_lng
    .fields("BouBdcCode") = mBouBdcCode_lng
    .fields("BouBdpCode") = mBouBdpCode_lng
    .fields("BouItrCode") = mBouItrCode_lng
    .fields("BouBldRefNo") = mBouBldRefNo_str
    .fields("BouBinCode") = mBouBinCode_lng
    .fields("BouBinICode") = mBouBinICode_lng
    .fields("BouNarr") = mBouNarr_str
    .fields("BouPckQty") = mBouPckQty_dbl
    .fields("BouBldQty") = mBouBldQty_dbl
    .fields("BouRemark") = mBouRemark_str
    
ElseIf blnBldIsuRcptTran = True Then
    .fields("OrcEttCode") = mOrcEttCode_lng
    .fields("OrcHpmCode") = mOrcHpmCode_lng
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
    
ElseIf blnBldIsuPymtTran = True Then
    .fields("OpyEttCode") = mOpyEttCode_lng
    .fields("OpyHpmCode") = mOpyHpmCode_lng
    .fields("OpyOhrCode") = mOpyOhrCode_lng
    .fields("OpyDepoAmt") = mOpyDepoAmt_dbl
    .fields("OpyRemark") = mOpyRemark_str
    
    DispersePropRcptDepoAmt mOpyOhrCode_lng, mOpyDepoAmt_dbl
    
ElseIf blnBldIsuRefdTran = True Then
    .fields("OfdEttCode") = mOfdEttCode_lng
    .fields("OfdHpmCode") = mOfdHpmCode_lng
    .fields("OfdOhrCode") = mOfdOhrCode_lng
    .fields("OfdRefuAmt") = mOfdRefuAmt_dbl
    .fields("OfdRemark") = mOfdRemark_str
    
    DispersePropRcptRefuAmt mOfdOhrCode_lng, mOfdRefuAmt_dbl
    
    
    
    
    
    
    
    
Else
    ErrorBox "clsBdkMultiTranEntry_AddNewDtl_#844_[Undefined Case]"
End If
.Update

mTrnDtlICode_lng = .fields(mTrnDtlICodeField)
End With
m_dbBdkDatabase.CommitTrans
CloseTable tRecset



Rem service doctor detail link code updation if any
If blnBldIsuRcptTran = True Then
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
    .fields(mTrnSdcEttCodeField) = mSdcEttCode_lng
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



Public Function UpdateHdr(ByVal mTrnCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset

UpdateHdr = False
If Chk_ActiveTran() = False Or mTrnCode <> ActiveTrnCode Then
    ErrorBox "clsBdkMultiTranEntry_UpdateDtl_#874_[InActive " & mTitleName & " Entry]"
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
.fields(mTrnHdrCmpCodeField) = mTrnCmpCode_int
.fields(mTrnHdrRecStateField) = ChkEditRecStatus(.fields(mTrnHdrRecStateField))

If blnBloodInTran = True Then
    .fields("BihStkCode") = mBihStkCode_lng
    .fields("BihTime") = mBihTime_lng
    .fields("BihTrnRefNo") = mBihTrnRefNo_str
    .fields("BihTrnRefDt") = mBihTrnRefDt_dt
    .fields("BihEttCode") = mBihEttCode_lng
    .fields("BihEfmCode") = mBihEfmCode_lng
    .fields("BihPckQty") = mBihPckQty_dbl
    .fields("BihBldQty") = mBihBldQty_dbl
    .fields("BihRemark") = mBihRemark_str
    
ElseIf blnBloodOutTran = True Then
    .fields("BohStkCode") = mBohStkCode_lng
    .fields("BohTime") = mBohTime_lng
    .fields("BohTrnRefNo") = mBohTrnRefNo_str
    .fields("BohTrnRefDt") = mBohTrnRefDt_dt
    .fields("BohHpmRefNo") = mBohHpmRefNo_str
    .fields("BohHpmRefDt") = mBohHpmRefDt_dt
    .fields("BohEttCode") = mBohEttCode_lng
    .fields("BohHpmCode") = mBohHpmCode_lng
    .fields("BohPckQty") = mBohPckQty_dbl
    .fields("BohBldQty") = mBohBldQty_dbl
    .fields("BohRemark") = mBohRemark_str
    
ElseIf blnBldIsuRcptTran = True Then
    .fields("OhrOpgCode") = mOhrOpgCode_lng
    .fields("OhrTime") = mOhrTime_lng
    .fields("OhrHpmRefNo") = mOhrHpmRefNo_str
    .fields("OhrHpmRefDt") = mOhrHpmRefDt_dt
    .fields("OhrOldOhrCode") = mOhrOldOhrCode_lng
    .fields("OhrEttCode") = mOhrEttCode_lng
    .fields("OhrHpmCode") = mOhrHpmCode_lng
    .fields("OhrEttDiscPer") = mOhrEttDiscPer_dbl
    .fields("OhrAmtBefDisc") = mOhrAmtBefDisc_dbl
    .fields("OhrDiscAmt") = mOhrDiscAmt_dbl
    .fields("OhrAmtAftDisc") = mOhrAmtAftDisc_dbl
    .fields("OhrAdvAmt") = mOhrAdvAmt_dbl
    .fields("OhrRecdAmt") = mOhrRecdAmt_dbl
    .fields("OhrDepoAmt") = mOhrDepoAmt_dbl
    .fields("OhrRefuAmt") = mOhrRefuAmt_dbl
    .fields("OhrBalAmt") = mOhrBalAmt_dbl
    .fields("OhrRemark") = mOhrRemark_str
    
ElseIf blnBldIsuPymtTran = True Then
    .fields("OphOpgCode") = mOphOpgCode_lng
    .fields("OphTime") = mOphTime_lng
    .fields("OphOldOphCode") = mOphOldOphCode_lng
    .fields("OphEttCode") = mOphEttCode_lng
    .fields("OphHpmCode") = mOphHpmCode_lng
    .fields("OphDepoAmt") = mOphDepoAmt_dbl
    .fields("OphRemark") = mOphRemark_str
    
ElseIf blnBldIsuRefdTran = True Then
    .fields("OfhOpgCode") = mOfhOpgCode_lng
    .fields("OfhTime") = mOfhTime_lng
    .fields("OfhOldOfhCode") = mOfhOldOfhCode_lng
    .fields("OfhEttCode") = mOfhEttCode_lng
    .fields("OfhHpmCode") = mOfhHpmCode_lng
    .fields("OfhRefuAmt") = mOfhRefuAmt_dbl
    .fields("OfhRemark") = mOfhRemark_str
    
    
    
    
    
Else
    ErrorBox "clsBdkMultiTranEntry_UpdateHdr_#911_[Undefined Case]"
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
Dim mOpyOhrCode As Long, mOpyDepoAmt As Double
Dim mOfdOhrCode As Long, mOfdRefuAmt As Double

UpdateDtl = False
If Chk_ActiveTran() = False Or mTrnCode <> ActiveTrnCode Then
    ErrorBox "clsBdkMultiTranEntry_UpdateDtl_#936_[InActive " & mTitleName & " Entry]"
    GoTo EndSub
End If

On Error GoTo errhand

m_dbBdkDatabase.BeginTrans
With tRecset
.open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " and " & mTrnDtlICodeField & "=" & CStr(mTrnICode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic

Rem mTrnDtlICode_lng = AutoNumber
.fields(mTrnDtlCodeField) = mTrnCode_lng
.fields(mTrnDtlSnoField) = mTrnDtlSno_int
.fields(mTrnDtlDateField) = mTrnDate_dt
.fields(mTrnDtlCmpCodeField) = mTrnCmpCode_int
.fields(mTrnDtlRecStateField) = ChkEditRecStatus(.fields(mTrnDtlRecStateField))

If blnBloodInTran = True Then
    .fields("BinStkCode") = mBinStkCode_lng
    .fields("BinStkICode") = mBinStkICode_lng
    .fields("BinEttCode") = mBinEttCode_lng
    .fields("BinEfmCode") = mBinEfmCode_lng
    .fields("BinBldCode") = mBinBldCode_lng
    .fields("BinItmCode") = mBinItmCode_lng
    .fields("BinBdgCode") = mBinBdgCode_lng
    .fields("BinBdcCode") = mBinBdcCode_lng
    .fields("BinItrCode") = mBinItrCode_lng
    .fields("BinBldRefNo") = mBinBldRefNo_str
    .fields("BinBldExpDt") = mBinBldExpDt_dt
    .fields("BinBldOkState") = mBinBldOkState_bln
    .fields("BinNarr") = mBinNarr_str
    .fields("BinBdpCode") = mBinBdpCode_lng
    .fields("BinPckQty") = mBinPckQty_dbl
    .fields("BinBldQty") = mBinBldQty_dbl
    .fields("BinRemark") = mBinRemark_str
    
ElseIf blnBloodOutTran = True Then
    .fields("BouStkCode") = mBouStkCode_lng
    .fields("BouStkICode") = mBouStkICode_lng
    .fields("BouEttCode") = mBouEttCode_lng
    .fields("BouHpmCode") = mBouHpmCode_lng
    .fields("BouItmCode") = mBouItmCode_lng
    .fields("BouBldCode") = mBouBldCode_lng
    .fields("BouBdgCode") = mBouBdgCode_lng
    .fields("BouBdcCode") = mBouBdcCode_lng
    .fields("BouBdpCode") = mBouBdpCode_lng
    .fields("BouItrCode") = mBouItrCode_lng
    .fields("BouBldRefNo") = mBouBldRefNo_str
    .fields("BouBinCode") = mBouBinCode_lng
    .fields("BouBinICode") = mBouBinICode_lng
    .fields("BouNarr") = mBouNarr_str
    .fields("BouPckQty") = mBouPckQty_dbl
    .fields("BouBldQty") = mBouBldQty_dbl
    .fields("BouRemark") = mBouRemark_str
    
ElseIf blnBldIsuRcptTran = True Then
    .fields("OrcEttCode") = mOrcEttCode_lng
    .fields("OrcHpmCode") = mOrcHpmCode_lng
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
    
ElseIf blnBldIsuPymtTran = True Then
    mOpyOhrCode = .fields("OpyOhrCode")
    mOpyDepoAmt = .fields("OpyDepoAmt")
    
    .fields("OpyEttCode") = mOpyEttCode_lng
    .fields("OpyHpmCode") = mOpyHpmCode_lng
    .fields("OpyOhrCode") = mOpyOhrCode_lng
    .fields("OpyDepoAmt") = mOpyDepoAmt_dbl
    .fields("OpyRemark") = mOpyRemark_str
    
ElseIf blnBldIsuRefdTran = True Then
    mOfdOhrCode = .fields("OfdOhrCode")
    mOfdRefuAmt = .fields("OfdRefuAmt")
    
    .fields("OfdEttCode") = mOfdEttCode_lng
    .fields("OfdHpmCode") = mOfdHpmCode_lng
    .fields("OfdOhrCode") = mOfdOhrCode_lng
    .fields("OfdRefuAmt") = mOfdRefuAmt_dbl
    .fields("OfdRemark") = mOfdRemark_str
    
    
  
    
    
    
    
    
    
    
Else
    ErrorBox "clsBdkMultiTranEntry_UpdateDtl_#966_[Undefined Case]"
End If
.Update


If blnBldIsuPymtTran = True Then
    If mOpyOhrCode <> .fields("OpyOhrCode") Then
        DispersePropRcptDepoAmt mOpyOhrCode, (mOpyDepoAmt * -1)                 ' removing deposit amount for old receipt
        DispersePropRcptDepoAmt .fields("OpyOhrCode"), .fields("OpyDepoAmt")    ' adding deposit amount to new receipt
    ElseIf mOpyDepoAmt <> .fields("OpyDepoAmt") Then
        mOpyDepoAmt = .fields("OpyDepoAmt") - mOpyDepoAmt
        DispersePropRcptDepoAmt mOpyOhrCode, mOpyDepoAmt
    End If
    
ElseIf blnBldIsuRefdTran = True Then
    If mOfdOhrCode <> .fields("OfdOhrCode") Then
        DispersePropRcptRefuAmt mOfdOhrCode, (mOfdRefuAmt * -1)                 ' removing refund amount for old receipt
        DispersePropRcptRefuAmt .fields("OfdOhrCode"), .fields("OfdRefuAmt")    ' adding refund amount to new receipt
    ElseIf mOfdRefuAmt <> .fields("OfdRefuAmt") Then
        mOfdRefuAmt = .fields("OfdRefuAmt") - mOfdRefuAmt
        DispersePropRcptRefuAmt mOfdOhrCode, mOfdRefuAmt
    End If
    
End If


End With
m_dbBdkDatabase.CommitTrans
CloseTable tRecset


Rem service doctor detail service change updation if any
If blnBldIsuRcptTran = True Then
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
    .fields(mTrnSdcEttCodeField) = mSdcDctCode_lng
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


Public Function DeleteDtl(ByVal mTrnCode As Long, ByVal mTrnICode As Long, Optional mConfirm As Boolean) As Boolean
Dim tRecset As New ADODB.Recordset, mDeleteit As Boolean

DeleteDtl = False
If Chk_ActiveTran() = False Or mTrnCode <> ActiveTrnCode Then
    ErrorBox "clsBdkMultiTranEntry_DeleteDtl_#995_[InActive " & mTitleName & " Entry]"
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
    
    If blnBldIsuPymtTran = True Then
        DispersePropRcptDepoAmt tRecset.fields("OpyOhrCode"), (tRecset.fields("OpyDepoAmt") * -1)
    ElseIf blnBldIsuRefdTran = True Then
        DispersePropRcptRefuAmt tRecset.fields("OfdOhrCode"), (tRecset.fields("OfdRefuAmt") * -1)
    End If
    
    m_dbBdkDatabase.CommitTrans
    CloseTable tRecset
    
    
    Rem service doctor detail deletion
    If blnBldIsuRcptTran = True Then
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
    ErrorBox "clsBdkMultiTranEntry_DeleteSdc_#2312_[InActive " & mTitleName & " Entry]"
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




Private Sub DispersePropRcptDepoAmt(ByVal mOpyOhrCode As Long, ByVal mOpyDepoAmt_diff As Double)
Dim tRecset As New ADODB.Recordset, mOpyDepoAmtTot As Double, mPropDepoAmt As Variant, mAmtAftDiscTot As Double, mOpyDepoAmtBal As Double, mOpyDepoAmtAdjusted As Double

On Error GoTo errhand

mOpyDepoAmtTot = mOpyDepoAmt_diff
mOpyDepoAmtBal = mOpyDepoAmt_diff
mOpyDepoAmtAdjusted = 0
mAmtAftDiscTot = 0
mOpyDepoAmtAdjusted = 0

With tRecset
.open "Select * from OutdHdr where OhrCode=" & CStr(mOpyOhrCode), m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
mAmtAftDiscTot = .fields("OhrAmtAftDisc")
End With
CloseTable tRecset

With tRecset
.open "Select * from OutdRcpt where OrcCode=" & CStr(mOpyOhrCode) & " order by OrcSno", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 And mOpyDepoAmtTot <> 0 Then
    m_dbBdkDatabase.BeginTrans
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
                ErrorBox "clsBdkMultiTranEntry_DispersePropRcptDepoAmt_#1540_[Invalid Record Status]"
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
    m_dbBdkDatabase.CommitTrans
End If
End With
CloseTable tRecset

m_dbBdkDatabase.BeginTrans
With tRecset
.open "Select * from OutdHdr where OhrCode=" & CStr(mOpyOhrCode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
.fields("OhrDepoAmt") = .fields("OhrDepoAmt") + mOpyDepoAmtAdjusted
.fields("OhrBalAmt") = .fields("OhrAmtAftDisc") - (.fields("OhrAdvAmt") + .fields("OhrRecdAmt") + .fields("OhrDepoAmt"))
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





Private Sub DispersePropRcptRefuAmt(ByVal mOfdOhrCode As Long, ByVal mOfdRefuAmt_diff As Double)
Dim tRecset As New ADODB.Recordset, mOfdRefuAmtTot As Double, mPropRefuAmt As Variant, mOfdRefuAmtBal As Double, mOfdAmtAftDiscTot As Double, mOfdRefuAmtAdjusted As Double

On Error GoTo errhand

mOfdRefuAmtBal = mOfdRefuAmt_diff
mOfdRefuAmtTot = mOfdRefuAmt_diff
mOfdRefuAmtAdjusted = 0
mOfdAmtAftDiscTot = 0

With tRecset
.open "Select * from OutdHdr where OhrCode=" & CStr(mOfdOhrCode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
mOfdAmtAftDiscTot = .fields("OhrAmtAftDisc")
End With
CloseTable tRecset

With tRecset
.open "Select * from OutdRcpt where OrcCode=" & CStr(mOfdOhrCode) & " order by OrcSno", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 And mOfdRefuAmtTot <> 0 Then
    m_dbBdkDatabase.BeginTrans
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
    m_dbBdkDatabase.CommitTrans
End If
End With
CloseTable tRecset

m_dbBdkDatabase.BeginTrans
With tRecset
.open "Select * from OutdHdr where OhrCode=" & CStr(mOfdOhrCode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
.fields("OhrRefuAmt") = .fields("OhrRefuAmt") + mOfdRefuAmtAdjusted
.fields("OhrBalAmt") = .fields("OhrAmtAftDisc") - (.fields("OhrAdvAmt") + .fields("OhrRecdAmt") + .fields("OhrDepoAmt"))
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
Dim t1Recset As New ADODB.Recordset, t2Recset As New ADODB.Recordset, t3Recset As New ADODB.Recordset

Data_CreateLog = False
If Chk_ActiveTran() = False Or mTrnCode <> ActiveTrnCode Then
    ErrorBox "clsBdkMultiTranEntry_Data_CreateLog_#406_[InActive " & mTitleName & " Entry]"
    GoTo EndSub
End If

If mTrnDtlTableName <> "" Then
    t1Recset.open "Select * from " & mTrnDtlTableName & "_Log where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnDtlICodeField & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
End If
t2Recset.open "Select * from " & mTrnHdrTableName & "_Log where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
If blnBldIsuRcptTran = True Then
    t3Recset.open "Select * from " & mTrnSdcTableName & "_Log where " & mTrnSdcCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnSdcICodeField & "", m_dbBdkDatabase, adOpenKeyset, adLockOptimistic
End If

If mTrnDtlTableName <> "" Then
    If t1Recset.RecordCount = 0 Then
        m_dbBdkDatabase.BeginTrans
        m_dbBdkDatabase.Execute "Insert into " & mTrnDtlTableName & "_Log Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " and " & mTrnDtlRecStateField & "=" & CStr(cREC_UNCHANGED) & ""
        m_dbBdkDatabase.CommitTrans
    Else
        AlertBox "clsBdkMultiTranEntry_Data_CreateLog_#2923_[Unsaved " & mTitleName & " Entry]"
    End If
End If
If t2Recset.RecordCount = 0 Then
    m_dbBdkDatabase.BeginTrans
    m_dbBdkDatabase.Execute "Insert into " & mTrnHdrTableName & "_Log Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & " and " & mTrnHdrRecStateField & "=" & CStr(cREC_UNCHANGED) & ""
    m_dbBdkDatabase.CommitTrans
Else
    AlertBox "clsBdkMultiTranEntry_Data_CreateLog_#2931_[Unsaved " & mTitleName & " Entry]"
End If

If blnBldIsuRcptTran = True Then
    If t3Recset.RecordCount = 0 Then
        m_dbBdkDatabase.BeginTrans
        m_dbBdkDatabase.Execute "Insert into " & mTrnSdcTableName & "_Log Select * from " & mTrnSdcTableName & " where " & mTrnSdcCodeField & "=" & CStr(mTrnCode) & " and " & mTrnSdcRecStateField & "=" & CStr(cREC_UNCHANGED) & ""
        m_dbBdkDatabase.CommitTrans
    Else
        AlertBox "clsBdkMultiTranEntry_Data_CreateLog_#2993_[Unsaved " & mTitleName & " Entry]"
    End If
End If
If mTrnDtlTableName <> "" Then
    CloseTable t1Recset
End If
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
    ErrorBox "clsBdkMultiTranEntry_Data_RemoveLog_#1041_[InActive " & mTitleName & " Entry]"
    Exit Function
End If

m_dbBdkDatabase.BeginTrans
If mTrnDtlTableName <> "" Then
    m_dbBdkDatabase.Execute "Delete from " & mTrnDtlTableName & "_Log where " & mTrnDtlCodeField & "=" & CStr(mTrnCode)
End If
m_dbBdkDatabase.Execute "Delete from " & mTrnHdrTableName & "_Log where " & mTrnHdrCodeField & "=" & CStr(mTrnCode)
If blnBldIsuRcptTran = True Then
    m_dbBdkDatabase.Execute "Delete from " & mTrnSdcTableName & "_Log where " & mTrnSdcCodeField & "=" & CStr(mTrnCode)
End If
m_dbBdkDatabase.CommitTrans

Data_RemoveLog = True

End Function

Public Function CanDeleteDtl(ByVal mTrnCode As Long, ByVal mTrnICode As Long, Optional ByVal mSkipConfirm As Boolean) As Boolean
Dim mDeleteit As Boolean

mDeleteit = True

If ChkEntryExist(mTrnCode, mTrnICode) = True Then
    ErrorBox "Entry Exist !!!"
    mDeleteit = False
End If
If mDeleteit = True And mSkipConfirm = False Then
    mDeleteit = CanDelete()
End If

CanDeleteDtl = mDeleteit

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

Public Function ChkEntryExist(ByVal mTrnCode As Long, Optional ByVal mTrnICode) As Boolean
Dim tRecset As New ADODB.Recordset, t1Recset As New ADODB.Recordset

ChkEntryExist = False
If blnBloodInTran = True Then
    With tRecset
    .open "Select top 1 * from (((BloodInDtl" _
        & " inner join BloodInHdr on BloodInDtl.BinCode = BloodInHdr.BihCode)" _
        & " inner join BloodOutDtl on BloodInDtl.BinICode = BloodOutDtl.BouBinICode)" _
        & " left Join BloodOutHdr on BloodOutDtl.BouCode = BloodOutHdr.BohCode)" _
        & " left Join VTypMast on BloodOutHdr.BohVtmCode = VTypMast.VtmCode" _
        & " where BinCode = " & CStr(mTrnCode) _
        & IIf(IsMissing(mTrnICode) = False, " and BinICode=" & CStr(mTrnICode), "") _
        & " order by BinDate desc,BinCode" _
        , m_dbComDatabase, adOpenKeyset, adLockOptimistic
    If .EOF = False Then
        If IsNull(.fields("BohCode")) = False Then
            AlertBox "Blood Issue Entry Exist !!!" _
                & vbCrLf & .fields("VtmName") & " No." & CStr(.fields("BohVchNo")) & " Dated " & Dtoc(.fields("BohDate")) & ""
        Else
            AlertBox "Blood Issue Entry Under Process !!!" _
                & vbCrLf & " Dated " & Dtoc(.fields("BinDate")) & ""
        End If
        ChkEntryExist = True
    End If
    End With
    CloseTable tRecset
    
ElseIf blnBloodOutTran = True Then
    Rem nothing

ElseIf blnBldIsuRcptTran = True Then
    With tRecset
    .open "Select * from OutdPymtDtl dtl inner join OutdPymtHdr hdr on dtl.OpyCode=hdr.OphCode where OpyOhrCode=" & CStr(mTrnCode) & " order by OpyDate desc,OphVchNo desc", m_dbBdkDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        AlertBox "Blood Issue Receipt No." & CStr(.fields("OphVchNo")) & " Dated " & Dtoc(.fields("OphDate")) & " !!!"
        ChkEntryExist = True
    End If
    End With
    CloseTable tRecset
    
    If ChkEntryExist = False Then
        With tRecset
        .open "Select * from OutdRefdDtl dtl inner join OutdRefdHdr hdr on dtl.OfdCode=hdr.OfhCode where OfdOhrCode=" & CStr(mTrnCode) & " order by OfdDate desc,OfhVchNo desc", m_dbBdkDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            AlertBox "Blood Issue Receipt No." & CStr(.fields("OfhVchNo")) & " Dated " & Dtoc(.fields("OfhDate")) & " !!!"
            ChkEntryExist = True
        End If
        End With
        CloseTable tRecset
    End If

ElseIf blnBldIsuPymtTran = True Then
    Dim mOpyDepoAmt As Double, mOpyOhrCode As Long
    With tRecset
    .open "Select OpyOhrCode,sum(OpyDepoAmt) as OpyDepoAmt_sum from OutdPymtDtl dtl inner join OutdPymtHdr hdr on dtl.OpyCode=hdr.OphCode where OpyCode=" & CStr(mTrnCode) & " group by OpyOhrCode", m_dbBdkDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        Do While .EOF = False And ChkEntryExist = False
            mOpyOhrCode = .fields("OpyOhrCode")
            mOpyDepoAmt = .fields("OpyDepoAmt_sum")
            
            With t1Recset
            .open "Select * from OutdHdr hdr inner join VTypMast vtm on hdr.OhrVtmCode=vtm.VtmCode where OhrCode=" & CStr(mOpyOhrCode) & "", m_dbComDatabase, adOpenKeyset, adLockReadOnly
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
    
ElseIf blnBldIsuRefdTran = True Then
    Rem does not affect transaction for any negative balance
    
    
    
End If


EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Function


End Function

