VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsVgnMultiTranEntry"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False

Option Explicit

Dim m_dbVgnDatabase As ADODB.Connection, m_dbAcDatabase As ADODB.Connection, m_dbStDatabase As ADODB.Connection, m_dbGrpDatabase As ADODB.Connection, m_dbComDatabase As ADODB.Connection
Dim mClassUIdCode As Long, mClassUIdFileName As String, mClassAcsPermFileName As String
Dim mTrnHdrTableName As String, mTrnDtlTableName As String, mTrnHdrCodeField As String, mTrnDtlCodeField As String, mTrnHdrDateField As String, mTrnDtlDateField As String, mTrnVtmField As String, mTrnPrefixField As String, mTrnVchNoField As String, mTrnPostfixField As String, mTrnDtlICodeField As String, mTrnDtlSnoField As String, mTrnHdrRecStateField As String, mTrnDtlRecStateField As String, mTrnHdrCmpCodeField As String, mTrnDtlCmpCodeField As String, mTitleName As String
Public blnMedPurchTran As Boolean, blnMedSaleTran As Boolean, blnMedSalePymtTran As Boolean, blnMedSaleRefdTran As Boolean
Rem common class variables used in both header and detail
Public mTrnCode_lng As Long, mTrnVtmCode_lng As Long, mTrnPrefix_str As String, mTrnVchNo_lng As Long, mTrnPostfix_str As String, mTrnDate_dt As Date, mTrnCmpCode_int As Integer
Rem common class header variables
Public mTrnHdrRecState_int As Integer
Rem common class detail variables
Public mTrnDtlICode_lng As Long, mTrnDtlSno_int As Integer, mTrnDtlRecState_int As Integer
Rem purchase header variables
Public mPuhStkCode_lng As Long, mPuhTime_lng As Long, mPuhTime_str As String, mPuhTrnRefNo_str As String, mPuhTrnRefDt_dt As Date, mPuhMptCode_lng As Long, mPuhPttCode_lng As Long, mPuhQty_dbl As Double, mPuhAmount_dbl As Double, mPuhAmtBefDisc_dbl As Double, mPuhDiscPer_dbl As Double, mPuhDiscAmt_dbl As Double, mPuhAmtBefTax_dbl As Double, mPuhTaxPer_dbl As Double, mPuhTaxAmt_dbl As Double, mPuhOtherAmt_dbl As Double, mPuhROffAmt_dbl As Double, mPuhRemark_str As String
Rem purchase detail variables
Public mPurStkCode_lng As Long, mPurStkICode_lng As Long, mPurMdiCode_lng As Long, mPurItmCode_lng As Long, mPurItrCode_lng As Long, mPurMdiRefNo_str As String, mPurMptCode_lng As Long, mPurPttCode_lng As Long, mPurNarr_str As String, mPurQty_dbl As Double, mPurRate_dbl As Double, mPurMRP_dbl As Double, mPurSRate_dbl As Double, mPurAmount_dbl As Double, mPurAmtBefDisc_dbl As Double, mPurDiscPer_dbl As Double, mPurDiscAmt_dbl As Double, mPurAmtBefTax_dbl As Double, mPurTaxPer_dbl As Double, mPurTaxAmt_dbl As Double, mPurRemark_str As String
Rem sale header variables
Public mSahStkCode_lng As Long, mSahTime_lng As Long, mSahTime_str As String, mSahTrnRefNo_str As String, mSahTrnRefDt_dt As Date, mSahMptCode_lng As Long, mSahPttCode_lng As Long, mSahQty_dbl As Double, mSahAmount_dbl As Double, mSahAmtBefDisc_dbl As Double, mSahDiscPer_dbl As Double, mSahDiscAmt_dbl As Double, mSahAmtBefTax_dbl As Double, mSahTaxPer_dbl As Double, mSahTaxAmt_dbl As Double, mSahOtherAmt_dbl As Double, mSahROffAmt_dbl As Double, mSahAdvAmt_dbl As Double, mSahRecdAmt_dbl As Double, mSahDepoAmt_dbl As Double, mSahRefuAmt_dbl As Double, mSahBalAmt_dbl As Double, mSahRemark_str As String
Rem sale detail variables
Public mSalStkCode_lng As Long, mSalStkICode_lng As Long, mSalMdiCode_lng As Long, mSalItmCode_lng As Long, mSalItrCode_lng As Long, mSalMdiRefNo_str As String, mSalMptCode_lng As Long, mSalPttCode_lng As Long, mSalPurCode_lng As Long, mSalPurICode_lng As Long, mSalNarr_str As String, mSalQty_dbl As Double, mSalRate_dbl As Double, mSalAmount_dbl As Double, mSalAmtBefDisc_dbl As Double, mSalDiscPer_dbl As Double, mSalDiscAmt_dbl As Double, mSalAmtBefTax_dbl As Double, mSalTaxPer_dbl As Double, mSalTaxAmt_dbl As Double, mSalAdvAmt_dbl As Double, mSalRecdAmt_dbl As Double, mSalDepoAmt_dbl As Double, mSalRefuAmt_dbl As Double, mSalBalAmt_dbl As Double, mSalRemark_str As String

Rem medical sale payment header variables
Public mSphTime_lng As Long, mSphPttCode_lng As Long, mSphDepoAmt_dbl As Double, mSphRemark_str As String
Rem medical sale payment detail variables
Public mSpyPttCode_lng As Long, mSpySahCode_lng As Long, mSpyDepoAmt_dbl As Double, mSpyRemark_str As String
Rem medical sale refund header variables
Public mSfhTime_lng As Long, mSfhPttCode_lng As Long, mSfhRefuAmt_dbl As Double, mSfhRemark_str As String
Rem medical sale refund detail variables
Public mSfdPttCode_lng As Long, mSfdSahCode_lng As Long, mSfdRefuAmt_dbl As Double, mSfdRemark_str As String

Dim mActiveTran As Integer, aVgnTran() As Variant

Public Sub Init()
If blnMedPurchTran = True Then
    mTrnHdrTableName = "MedPurchHdr": mTrnDtlTableName = "MedPurchDtl"
    mTrnHdrCodeField = "PuhCode": mTrnDtlCodeField = "PurCode"
    mTrnHdrDateField = "PuhDate": mTrnDtlDateField = "PurDate"
    mTrnHdrRecStateField = "PuhRecState": mTrnDtlRecStateField = "PurRecState"
    mTrnHdrCmpCodeField = "PuhCmpCode": mTrnDtlCmpCodeField = "PurCmpCode"
    mTrnVtmField = "PuhVtmCode"
    mTrnPrefixField = "PuhPrefix"
    mTrnVchNoField = "PuhVchNo"
    mTrnPostfixField = "PuhPostfix"
    mTrnDtlICodeField = "PurICode"
    mTrnDtlSnoField = "PurSno"
    mTitleName = "Purchase Entry"
    
ElseIf blnMedSaleTran = True Then
    mTrnHdrTableName = "MedSaleHdr": mTrnDtlTableName = "MedSaleDtl"
    mTrnHdrCodeField = "SahCode": mTrnDtlCodeField = "SalCode"
    mTrnHdrDateField = "SahDate": mTrnDtlDateField = "SalDate"
    mTrnHdrRecStateField = "SahRecState": mTrnDtlRecStateField = "SalRecState"
    mTrnHdrCmpCodeField = "SahCmpCode": mTrnDtlCmpCodeField = "SalCmpCode"
    mTrnVtmField = "SahVtmCode"
    mTrnPrefixField = "SahPrefix"
    mTrnVchNoField = "SahVchNo"
    mTrnPostfixField = "SahPostfix"
    mTrnDtlICodeField = "SalICode"
    mTrnDtlSnoField = "SalSno"
    mTitleName = "Sales Entry"
    
    
    
    
    
ElseIf blnMedSalePymtTran = True Then
    mTrnHdrTableName = "MedSalePymtHdr": mTrnDtlTableName = "MedSalePymtDtl"
    mTrnHdrCodeField = "SphCode": mTrnDtlCodeField = "SpyCode"
    mTrnHdrDateField = "SphDate": mTrnDtlDateField = "SpyDate"
    mTrnHdrRecStateField = "SphRecState": mTrnDtlRecStateField = "SpyRecState"
    mTrnHdrCmpCodeField = "SphCmpCode": mTrnDtlCmpCodeField = "SpyCmpCode"
    mTrnVtmField = "SphVtmCode"
    mTrnPrefixField = "SphPrefix"
    mTrnVchNoField = "SphVchNo"
    mTrnPostfixField = "SphPostfix"
    mTrnDtlICodeField = "SpyICode"
    mTrnDtlSnoField = "SpySno"
    mTitleName = "Sale Bill Payment"
    
ElseIf blnMedSaleRefdTran = True Then
    mTrnHdrTableName = "MedSaleRefdHdr": mTrnDtlTableName = "MedSaleRefdDtl"
    mTrnHdrCodeField = "SfhCode": mTrnDtlCodeField = "SfdCode"
    mTrnHdrDateField = "SfhDate": mTrnDtlDateField = "SfdDate"
    mTrnHdrRecStateField = "SfhRecState": mTrnDtlRecStateField = "SfdRecState"
    mTrnHdrCmpCodeField = "SfhCmpCode": mTrnDtlCmpCodeField = "SfdCmpCode"
    mTrnVtmField = "SfhVtmCode"
    mTrnPrefixField = "SfhPrefix"
    mTrnVchNoField = "SfhVchNo"
    mTrnPostfixField = "SfhPostfix"
    mTrnDtlICodeField = "SfdICode"
    mTrnDtlSnoField = "SfdSno"
    mTitleName = "Sale Bill Refund"
    
Else
    ErrorBox "clsVgnMultiTranEntry_Init_#73_[Undefined Case]"
End If

End Sub

Public Property Set dbVgnDatabase(ByRef db As ADODB.Connection)
Set m_dbVgnDatabase = db

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
aVgnTran = Array()
mActiveTran = UBound(aVgnTran)

mClassUIdFileName = "clsVgnMultiTrn.UId"
mClassAcsPermFileName = "clsVgnMultiTrn.Acp"
mClassUIdCode = GetUIdCode("clsVgnMultiTranEntry_Initialize", mUIdFileName:=mClassUIdFileName, mAcsPermFileName:=mClassAcsPermFileName)
If mClassUIdCode = 0 Then
    ErrorBox cSYSBUSY_ACS_DENIED
End If

End Sub

Public Sub GetHdrData(ByVal mTrnCode As Long)
Dim tRecset As New ADODB.Recordset

Me.ClearHdr
With tRecset
.open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbVgnDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    mTrnCode_lng = .fields(mTrnHdrCodeField)
    mTrnDate_dt = .fields(mTrnHdrDateField)
    mTrnVtmCode_lng = .fields(mTrnVtmField)
    mTrnPrefix_str = .fields(mTrnPrefixField)
    mTrnVchNo_lng = .fields(mTrnVchNoField)
    mTrnPostfix_str = .fields(mTrnPostfixField)
    mTrnHdrRecState_int = .fields(mTrnHdrRecStateField)
    mTrnCmpCode_int = .fields(mTrnHdrCmpCodeField)
    
    If blnMedPurchTran = True Then
        mPuhStkCode_lng = .fields("PuhStkCode")
        mPuhTime_lng = .fields("PuhTime")
        mPuhTime_str = MinToTime(.fields("PuhTime"))
        mPuhTrnRefNo_str = .fields("PuhTrnRefNo")
        mPuhTrnRefDt_dt = .fields("PuhTrnRefDt")
        mPuhMptCode_lng = .fields("PuhMptCode")
        mPuhPttCode_lng = .fields("PuhPttCode")
        mPuhQty_dbl = .fields("PuhQty")
        mPuhAmount_dbl = .fields("PuhAmount")
        mPuhAmtBefDisc_dbl = .fields("PuhAmtBefDisc")
        mPuhDiscPer_dbl = .fields("PuhDiscPer")
        mPuhDiscAmt_dbl = .fields("PuhDiscAmt")
        mPuhAmtBefTax_dbl = .fields("PuhAmtBefTax")
        mPuhTaxPer_dbl = .fields("PuhTaxPer")
        mPuhTaxAmt_dbl = .fields("PuhTaxAmt")
        mPuhOtherAmt_dbl = .fields("PuhOtherAmt")
        mPuhROffAmt_dbl = .fields("PuhROffAmt")
        mPuhRemark_str = .fields("PuhRemark")
        
    ElseIf blnMedSaleTran = True Then
        mSahStkCode_lng = .fields("SahStkCode")
        mSahTime_lng = .fields("SahTime")
        mSahTime_str = MinToTime(.fields("SahTime"))
        mSahTrnRefNo_str = .fields("SahTrnRefNo")
        mSahTrnRefDt_dt = .fields("SahTrnRefDt")
        mSahMptCode_lng = .fields("SahMptCode")
        mSahPttCode_lng = .fields("SahPttCode")
        mSahQty_dbl = .fields("SahQty")
        mSahAmount_dbl = .fields("SahAmount")
        mSahAmtBefDisc_dbl = .fields("SahAmtBefDisc")
        mSahDiscPer_dbl = .fields("SahDiscPer")
        mSahDiscAmt_dbl = .fields("SahDiscAmt")
        mSahAmtBefTax_dbl = .fields("SahAmtBefTax")
        mSahTaxPer_dbl = .fields("SahTaxPer")
        mSahTaxAmt_dbl = .fields("SahTaxAmt")
        mSahOtherAmt_dbl = .fields("SahOtherAmt")
        mSahROffAmt_dbl = .fields("SahROffAmt")
        
        mSahAdvAmt_dbl = .fields("SahAdvAmt")
        mSahRecdAmt_dbl = .fields("SahRecdAmt")
        mSahDepoAmt_dbl = .fields("SahDepoAmt")
        mSahRefuAmt_dbl = .fields("SahRefuAmt")
        mSahBalAmt_dbl = .fields("SahBalAmt")
        
        mSahRemark_str = .fields("SahRemark")
        
        
        
        
    ElseIf blnMedSalePymtTran = True Then
        mSphTime_lng = .fields("SphTime")
        mSphPttCode_lng = .fields("SphPttCode")
        mSphDepoAmt_dbl = .fields("SphDepoAmt")
        mSphRemark_str = .fields("SphRemark")
        
    ElseIf blnMedSaleRefdTran = True Then
        mSfhTime_lng = .fields("SfhTime")
        mSfhPttCode_lng = .fields("SfhPttCode")
        mSfhRefuAmt_dbl = .fields("SfhRefuAmt")
        mSfhRemark_str = .fields("SfhRemark")
        
    Else
        ErrorBox "clsVgnMultiTranEntry_GetHdrData_#133_[Undefined Case]"
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
    .open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " and " & mTrnDtlICodeField & "=" & CStr(mTrnICode) & "", m_dbVgnDatabase, adOpenKeyset, adLockOptimistic
Else
    .open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " and " & mTrnDtlSnoField & "=" & CStr(mTrnSno) & "", m_dbVgnDatabase, adOpenKeyset, adLockOptimistic
    AlertBox "Hello Administrator, Please Check it out !!!"
End If
If .RecordCount > 0 Then
    mTrnCode_lng = .fields(mTrnDtlCodeField)
    mTrnDtlICode_lng = .fields(mTrnDtlICodeField)
    mTrnDtlSno_int = .fields(mTrnDtlSnoField)
    mTrnDate_dt = .fields(mTrnDtlDateField)
    mTrnDtlRecState_int = .fields(mTrnDtlRecStateField)
    mTrnCmpCode_int = .fields(mTrnDtlCmpCodeField)
    
    If blnMedPurchTran = True Then
        mPurStkCode_lng = .fields("PurStkCode")
        mPurStkICode_lng = .fields("PurStkICode")
        mPurMptCode_lng = .fields("PurMptCode")
        mPurPttCode_lng = .fields("PurPttCode")
        mPurMdiCode_lng = .fields("PurMdiCode")
        mPurItmCode_lng = .fields("PurItmCode")
        mPurItrCode_lng = .fields("PurItrCode")
        mPurMdiRefNo_str = .fields("PurMdiRefNo")
        mPurNarr_str = .fields("PurNarr")
        mPurQty_dbl = .fields("PurQty")
        mPurRate_dbl = .fields("PurRate")
        mPurMRP_dbl = .fields("PurMRP")
        mPurSRate_dbl = .fields("PurSRate")
        mPurAmount_dbl = .fields("PurAmount")
        mPurAmtBefDisc_dbl = .fields("PurAmtBefDisc")
        mPurDiscPer_dbl = .fields("PurDiscPer")
        mPurDiscAmt_dbl = .fields("PurDiscAmt")
        mPurAmtBefTax_dbl = .fields("PurAmtBefTax")
        mPurTaxPer_dbl = .fields("PurTaxPer")
        mPurTaxAmt_dbl = .fields("PurTaxAmt")
        mPurRemark_str = .fields("PurRemark")
        
    ElseIf blnMedSaleTran = True Then
        mSalStkCode_lng = .fields("SalStkCode")
        mSalStkICode_lng = .fields("SalStkICode")
        mSalMptCode_lng = .fields("SalMptCode")
        mSalPttCode_lng = .fields("SalPttCode")
        mSalMdiCode_lng = .fields("SalMdiCode")
        mSalItmCode_lng = .fields("SalItmCode")
        mSalItrCode_lng = .fields("SalItrCode")
        mSalMdiRefNo_str = .fields("SalMdiRefNo")
        mSalPurCode_lng = .fields("SalPurCode")
        mSalPurICode_lng = .fields("SalPurICode")
        mSalNarr_str = .fields("SalNarr")
        mSalQty_dbl = .fields("SalQty")
        mSalRate_dbl = .fields("SalRate")
        mSalAmount_dbl = .fields("SalAmount")
        mSalAmtBefDisc_dbl = .fields("SalAmtBefDisc")
        mSalDiscPer_dbl = .fields("SalDiscPer")
        mSalDiscAmt_dbl = .fields("SalDiscAmt")
        mSalAmtBefTax_dbl = .fields("SalAmtBefTax")
        mSalTaxPer_dbl = .fields("SalTaxPer")
        mSalTaxAmt_dbl = .fields("SalTaxAmt")
        
        mSalAdvAmt_dbl = .fields("SalAdvAmt")
        mSalRecdAmt_dbl = .fields("SalRecdAmt")
        mSalDepoAmt_dbl = .fields("SalDepoAmt")
        mSalRefuAmt_dbl = .fields("SalRefuAmt")
        mSalBalAmt_dbl = .fields("SalBalAmt")
        
        mSalRemark_str = .fields("SalRemark")
        
        
        
    ElseIf blnMedSalePymtTran = True Then
        mSpyPttCode_lng = .fields("SpyPttCode")
        mSpySahCode_lng = .fields("SpySahCode")
        mSpyDepoAmt_dbl = .fields("SpyDepoAmt")
        mSpyRemark_str = .fields("SpyRemark")
        
    ElseIf blnMedSaleRefdTran = True Then
        mSfdPttCode_lng = .fields("SfdPttCode")
        mSfdSahCode_lng = .fields("SfdSahCode")
        mSfdRefuAmt_dbl = .fields("SfdRefuAmt")
        mSfdRemark_str = .fields("SfdRemark")
        
        
        
    Else
        ErrorBox "clsVgnMultiTranEntry_GetDtlData_#173_[Undefined Case]"
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

If blnMedPurchTran = True Then
    mPuhStkCode_lng = 0
    mPuhTime_lng = 0
    mPuhTime_str = ""
    mPuhTrnRefNo_str = ""
    mPuhTrnRefDt_dt = cUNKNOWNDATE
    mPuhMptCode_lng = 0
    mPuhPttCode_lng = 0
    mPuhQty_dbl = 0
    mPuhAmount_dbl = 0
    mPuhAmtBefDisc_dbl = 0
    mPuhDiscPer_dbl = 0
    mPuhDiscAmt_dbl = 0
    mPuhAmtBefTax_dbl = 0
    mPuhTaxPer_dbl = 0
    mPuhTaxAmt_dbl = 0
    mPuhOtherAmt_dbl = 0
    mPuhROffAmt_dbl = 0
    mPuhRemark_str = ""
    
ElseIf blnMedSaleTran = True Then
    mSahStkCode_lng = 0
    mSahTime_lng = 0
    mSahTime_str = ""
    mSahTrnRefNo_str = ""
    mSahTrnRefDt_dt = cUNKNOWNDATE
    mSahMptCode_lng = 0
    mSahPttCode_lng = 0
    mSahQty_dbl = 0
    mSahAmount_dbl = 0
    mSahAmtBefDisc_dbl = 0
    mSahDiscPer_dbl = 0
    mSahDiscAmt_dbl = 0
    mSahAmtBefTax_dbl = 0
    mSahTaxPer_dbl = 0
    mSahTaxAmt_dbl = 0
    mSahOtherAmt_dbl = 0
    mSahROffAmt_dbl = 0
    
    mSahAdvAmt_dbl = 0
    mSahRecdAmt_dbl = 0
    mSahDepoAmt_dbl = 0
    mSahRefuAmt_dbl = 0
    mSahBalAmt_dbl = 0
    
    mSahRemark_str = ""
    
    
ElseIf blnMedSalePymtTran = True Then
    mSphTime_lng = 0
    mSphPttCode_lng = 0
    mSphDepoAmt_dbl = 0
    mSphRemark_str = ""
    
ElseIf blnMedSaleRefdTran = True Then
    mSfhTime_lng = 0
    mSfhPttCode_lng = 0
    mSfhRefuAmt_dbl = 0
    mSfhRemark_str = ""
    
Else
    ErrorBox "clsVgnMultiTranEntry_ClearHdr_#212_[Undefined Case]"
End If

End Sub

Public Sub ClearDtl()

mTrnCode_lng = 0
mTrnDtlICode_lng = 0
mTrnDtlSno_int = 0
mTrnDate_dt = cUNKNOWNDATE
mTrnDtlRecState_int = 0
mTrnCmpCode_int = 0

If blnMedPurchTran = True Then
    mPurStkCode_lng = 0
    mPurStkICode_lng = 0
    mPurMptCode_lng = 0
    mPurPttCode_lng = 0
    mPurMdiCode_lng = 0
    mPurItmCode_lng = 0
    mPurItrCode_lng = 0
    mPurMdiRefNo_str = ""
    mPurNarr_str = ""
    mPurQty_dbl = 0
    mPurRate_dbl = 0
    mPurMRP_dbl = 0
    mPurSRate_dbl = 0
    mPurAmount_dbl = 0
    mPurAmtBefDisc_dbl = 0
    mPurDiscPer_dbl = 0
    mPurDiscAmt_dbl = 0
    mPurAmtBefTax_dbl = 0
    mPurTaxPer_dbl = 0
    mPurTaxAmt_dbl = 0
    mPurRemark_str = ""
    
ElseIf blnMedSaleTran = True Then
    mSalStkCode_lng = 0
    mSalStkICode_lng = 0
    mSalMptCode_lng = 0
    mSalPttCode_lng = 0
    mSalMdiCode_lng = 0
    mSalItmCode_lng = 0
    mSalItrCode_lng = 0
    mSalMdiRefNo_str = ""
    mSalPurCode_lng = 0
    mSalPurICode_lng = 0
    mSalNarr_str = ""
    mSalQty_dbl = 0
    mSalRate_dbl = 0
    mSalAmount_dbl = 0
    mSalAmtBefDisc_dbl = 0
    mSalDiscPer_dbl = 0
    mSalDiscAmt_dbl = 0
    mSalAmtBefTax_dbl = 0
    mSalTaxPer_dbl = 0
    mSalTaxAmt_dbl = 0
    
    mSalAdvAmt_dbl = 0
    mSalRecdAmt_dbl = 0
    mSalDepoAmt_dbl = 0
    mSalRefuAmt_dbl = 0
    mSalBalAmt_dbl = 0
    
    mSalRemark_str = ""
    
    
ElseIf blnMedSalePymtTran = True Then
    mSpyPttCode_lng = 0
    mSpySahCode_lng = 0
    mSpyDepoAmt_dbl = 0
    mSpyRemark_str = ""

ElseIf blnMedSaleRefdTran = True Then
    mSfdPttCode_lng = 0
    mSfdSahCode_lng = 0
    mSfdRefuAmt_dbl = 0
    mSfdRemark_str = ""
    
    
    
Else
    ErrorBox "clsVgnMultiTranEntry_ClearDtl_#244_[Undefined Case]"
End If

End Sub

Private Sub Class_Terminate()
If UBound(aVgnTran) > LBound(aVgnTran) Then
    ErrorBox mTitleName & " Entry in Process !!!"
End If

End Sub

Public Function BeginTran(ByVal mTrnCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset

BeginTran = False

If mTrnCode = 0 Then
    mTrnCode = GetUIdCode("clsVgnMultiTranEntry_BeginTran", mUIdFileName:=mClassUIdFileName, mAcsPermFileName:=mClassAcsPermFileName) * -1
    If mTrnCode = 0 Then
        ErrorBox "clsVgnMultiTranEntry_BeginTran_#266_[Invalid " & mTitleName & " Code]"
        GoTo EndSub
    End If
ElseIf mTrnCode > 0 Then
    tRecset.open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbVgnDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.RecordCount = 0 Then
        ErrorBox "clsVgnMultiTranEntry_BeginTran_#272_[Entry not Found]"
        GoTo EndSub
    End If
    CloseTable tRecset
Else
    ErrorBox "clsVgnMultiTranEntry_BeginTran_#277_[Invalid " & mTitleName & " Entry Code Request]"
    GoTo EndSub
End If
mActiveTran = UBound(aVgnTran) + 1
ReDim Preserve aVgnTran(mActiveTran)
aVgnTran(mActiveTran) = mTrnCode

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
    ErrorBox "clsVgnMultiTranEntry_EndTran_#294_[InActive Transaction Entry]"
    Exit Function
End If
Call Data_RemoveLog(mTrnCode)

For mCnt = (mActiveTran + 1) To UBound(aVgnTran)
    If (mCnt - 1) >= LBound(aVgnTran) Then
        aVgnTran(mCnt - 1) = aVgnTran(mCnt)
    End If
Next mCnt
If LBound(aVgnTran) = UBound(aVgnTran) Then
    aVgnTran = Array()
Else
    ReDim Preserve aVgnTran(UBound(aVgnTran) - 1)
End If
If mActiveTran > UBound(aVgnTran) Then
    mActiveTran = mActiveTran - 1
End If

EndTran = True
End Function

Public Property Get ActiveTrnCode() As Long
On Error GoTo errhand

ActiveTrnCode = aVgnTran(mActiveTran)

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
m_dbVgnDatabase.BeginTrans
With tRecset
.open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbVgnDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Do While .EOF = False
        If InList(.fields(mTrnHdrRecStateField), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
            If blnMedSaleTran = True Then
                .fields("SahBalAmt") = .fields("SahAmount") - (.fields("SahAdvAmt") + .fields("SahRecdAmt") + .fields("SahDepoAmt"))
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
m_dbVgnDatabase.CommitTrans
CloseTable tRecset

Rem detail section
m_dbVgnDatabase.BeginTrans
With tRecset
If mTrnCode = mTmpTrnCode Then
    .open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnDtlICodeField & "", m_dbVgnDatabase, adOpenKeyset, adLockOptimistic
Else
    .open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTmpTrnCode) & " order by " & mTrnDtlICodeField & "", m_dbVgnDatabase, adOpenKeyset, adLockOptimistic
End If
If .RecordCount > 0 Then
    mTrnSno = 1
    Do While .EOF = False
        If InList(.fields(mTrnDtlRecStateField), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
            If blnMedPurchTran = True Then
                If .fields("PurMptCode") <> mPuhMptCode_lng Then
                    .fields("PurMptCode") = mPuhMptCode_lng
                End If
                If .fields("PurPttCode") <> mPuhPttCode_lng Then
                    .fields("PurPttCode") = mPuhPttCode_lng
                End If
                If .fields("PurStkCode") <> mPuhStkCode_lng Then
                    .fields("PurStkCode") = mPuhStkCode_lng
                End If
            
            ElseIf blnMedSaleTran = True Then
                If .fields("SalMptCode") <> mSahMptCode_lng Then
                    .fields("SalMptCode") = mSahMptCode_lng
                End If
                If .fields("SalPttCode") <> mSahPttCode_lng Then
                    .fields("SalPttCode") = mSahPttCode_lng
                End If
                If .fields("SalStkCode") <> mSahStkCode_lng Then
                    .fields("SalStkCode") = mSahStkCode_lng
                End If
                
                
            ElseIf blnMedSalePymtTran = True Then
                If .fields("SpyPttCode") <> mSphPttCode_lng Then
                    .fields("SpyPttCode") = mSphPttCode_lng
                End If
            
            ElseIf blnMedSaleRefdTran = True Then
                If .fields("SfdPttCode") <> mSfhPttCode_lng Then
                    .fields("SfdPttCode") = mSfhPttCode_lng
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
    If blnMedSaleTran = True Then
        DispersePropRcptRecdAmt mTrnCode
    End If
End If
End With
m_dbVgnDatabase.CommitTrans
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

Private Sub DispersePropRcptRecdAmt(ByVal mTrnCode As Long)
Dim tRecset As New ADODB.Recordset, mRecdAmtBal As Double, mRecdAmtTot As Double, mPropRecdAmt As Double, mNetAmtTot As Double

With tRecset
.open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbVgnDatabase, adOpenKeyset, adLockOptimistic
mRecdAmtBal = .fields("SahRecdAmt")
mRecdAmtTot = .fields("SahRecdAmt")
mNetAmtTot = .fields("SahAmount")
End With
CloseTable tRecset

With tRecset
.open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnDtlICodeField & "", m_dbVgnDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    m_dbVgnDatabase.BeginTrans
    Do While .EOF = False
        If InList(.fields("SalRecState"), Array(cREC_UNCHANGED)) = True Then
            mPropRecdAmt = Round(mRecdAmtTot * .fields("SalAmount") / mNetAmtTot, 2)
            
            .fields("SalRecdAmt") = mPropRecdAmt
            .fields("SalBalAmt") = .fields("SalAmount") - (.fields("SalAdvAmt") + .fields("SalDepoAmt")) - mPropRecdAmt
            .Update
                
            mRecdAmtBal = mRecdAmtBal - mPropRecdAmt
        Else
            If InList(.fields("SalRecState"), Array(cREC_CANCELED, cREC_DELETED)) = False Then
                ErrorBox "clsVgnMultiTranEntry_DispersePropRcptRecdAmt_#2316_[Invalid Record Status]"
            End If
        End If
        .MoveNext
    Loop
    If Round(mRecdAmtBal, 2) <> 0 And mRecdAmtBal <> mRecdAmtTot Then
        .MovePrevious
        
        mPropRecdAmt = Round(mRecdAmtBal, 2) + .fields("SalRecdAmt")
        .fields("SalRecdAmt") = mPropRecdAmt
        .fields("SalBalAmt") = .fields("SalAmount") - (.fields("SalAdvAmt") + .fields("SalDepoAmt")) - mPropRecdAmt
        .Update
    End If
    m_dbVgnDatabase.CommitTrans
Else
    If mRecdAmtBal <> 0 Then
        ErrorBox "clsVgnMultiTranEntry_DispersePropRcptRecdAmt_#3002_[Unexpected]"
    End If
End If
End With
CloseTable tRecset

End Sub

Public Function CancelTran(ByVal mTrnCode As Long) As Boolean
Dim t1Recset As New ADODB.Recordset, t2Recset As New ADODB.Recordset
Dim mRecAdded As Boolean, mRecEdited As Boolean, mRecDeleted As Boolean, mRecCanceled As Boolean
Dim mSpySahCode As Long, mSpyDepoAmt As Double
Dim mSfdSahCode As Long, mSfdRefuAmt As Double

CancelTran = False
If Chk_ActiveTran() = False Or mTrnCode <> ActiveTrnCode Then
    ErrorBox "clsVgnMultiTranEntry_CancelTran_#419_[InActive Transaction Entry]"
    GoTo EndSub
End If
mTrnCode = ActiveTrnCode
On Error GoTo errhand

Rem header section
m_dbVgnDatabase.BeginTrans
With t1Recset
.open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbVgnDatabase, adOpenKeyset, adLockOptimistic
t2Recset.open "Select * from " & mTrnHdrTableName & "_Log where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbVgnDatabase, adOpenKeyset, adLockOptimistic
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
            
            If blnMedPurchTran = True Then
                .fields("PuhStkCode") = t2Recset.fields("PuhStkCode")
                .fields("PuhTime") = t2Recset.fields("PuhTime")
                .fields("PuhTrnRefNo") = t2Recset.fields("PuhTrnRefNo")
                .fields("PuhTrnRefDt") = t2Recset.fields("PuhTrnRefDt")
                .fields("PuhMptCode") = t2Recset.fields("PuhMptCode")
                .fields("PuhPttCode") = t2Recset.fields("PuhPttCode")
                .fields("PuhQty") = t2Recset.fields("PuhQty")
                .fields("PuhAmount") = t2Recset.fields("PuhAmount")
                .fields("PuhAmtBefDisc") = t2Recset.fields("PuhAmtBefDisc")
                .fields("PuhDiscPer") = t2Recset.fields("PuhDiscPer")
                .fields("PuhDiscAmt") = t2Recset.fields("PuhDiscAmt")
                .fields("PuhAmtBefTax") = t2Recset.fields("PuhAmtBefTax")
                .fields("PuhTaxPer") = t2Recset.fields("PuhTaxPer")
                .fields("PuhTaxAmt") = t2Recset.fields("PuhTaxAmt")
                .fields("PuhOtherAmt") = t2Recset.fields("PuhOtherAmt")
                .fields("PuhROffAmt") = t2Recset.fields("PuhROffAmt")
                .fields("PuhRemark") = t2Recset.fields("PuhRemark")
                
            ElseIf blnMedSaleTran = True Then
                .fields("SahStkCode") = t2Recset.fields("SahStkCode")
                .fields("SahTime") = t2Recset.fields("SahTime")
                .fields("SahTrnRefNo") = t2Recset.fields("SahTrnRefNo")
                .fields("SahTrnRefDt") = t2Recset.fields("SahTrnRefDt")
                .fields("SahMptCode") = t2Recset.fields("SahMptCode")
                .fields("SahPttCode") = t2Recset.fields("SahPttCode")
                .fields("SahQty") = t2Recset.fields("SahQty")
                .fields("SahAmount") = t2Recset.fields("SahAmount")
                .fields("SahAmtBefDisc") = t2Recset.fields("SahAmtBefDisc")
                .fields("SahDiscPer") = t2Recset.fields("SahDiscPer")
                .fields("SahDiscAmt") = t2Recset.fields("SahDiscAmt")
                .fields("SahAmtBefTax") = t2Recset.fields("SahAmtBefTax")
                .fields("SahTaxPer") = t2Recset.fields("SahTaxPer")
                .fields("SahTaxAmt") = t2Recset.fields("SahTaxAmt")
                .fields("SahOtherAmt") = t2Recset.fields("SahOtherAmt")
                .fields("SahROffAmt") = t2Recset.fields("SahROffAmt")
                
                .fields("SahAdvAmt") = t2Recset.fields("SahAdvAmt")
                .fields("SahRecdAmt") = t2Recset.fields("SahRecdAmt")
                .fields("SahDepoAmt") = t2Recset.fields("SahDepoAmt")
                .fields("SahRefuAmt") = t2Recset.fields("SahRefuAmt")
                .fields("SahBalAmt") = t2Recset.fields("SahBalAmt")
                
                
                .fields("SahRemark") = t2Recset.fields("SahRemark")
                
                
            ElseIf blnMedSalePymtTran = True Then
                .fields("SphTime") = t2Recset.fields("SphTime")
                .fields("SphPttCode") = t2Recset.fields("SphPttCode")
                .fields("SphDepoAmt") = t2Recset.fields("SphDepoAmt")
                .fields("SphRemark") = t2Recset.fields("SphRemark")
                
            ElseIf blnMedSaleRefdTran = True Then
                .fields("SfhTime") = t2Recset.fields("SfhTime")
                .fields("SfhPttCode") = t2Recset.fields("SfhPttCode")
                .fields("SfhRefuAmt") = t2Recset.fields("SfhRefuAmt")
                .fields("SfhRemark") = t2Recset.fields("SfhRemark")
                
                
                
            Else
                ErrorBox "clsVgnMultiTranEntry_CancelTran_#459_[Undefined Case]"
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
m_dbVgnDatabase.CommitTrans
CloseTable t1Recset
CloseTable t2Recset

Rem detail section
m_dbVgnDatabase.BeginTrans
With t1Recset
Rem important - revert the changes in revert order of updation
.open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnDtlICodeField & " desc", m_dbVgnDatabase, adOpenKeyset, adLockOptimistic
t2Recset.open "Select * from " & mTrnDtlTableName & "_Log where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnDtlICodeField & "", m_dbVgnDatabase, adOpenKeyset, adLockOptimistic
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
            
            If blnMedPurchTran = True Then
                .fields("PurStkCode") = t2Recset.fields("PurStkCode")
                .fields("PurStkICode") = t2Recset.fields("PurStkICode")
                .fields("PurMptCode") = t2Recset.fields("PurMptCode")
                .fields("PurPttCode") = t2Recset.fields("PurPttCode")
                .fields("PurMdiCode") = t2Recset.fields("PurMdiCode")
                .fields("PurItmCode") = t2Recset.fields("PurItmCode")
                .fields("PurItrCode") = t2Recset.fields("PurItrCode")
                .fields("PurMdiRefNo") = t2Recset.fields("PurMdiRefNo")
                .fields("PurNarr") = t2Recset.fields("PurNarr")
                .fields("PurQty") = t2Recset.fields("PurQty")
                .fields("PurRate") = t2Recset.fields("PurRate")
                .fields("PurMRP") = t2Recset.fields("PurMRP")
                .fields("PurSRate") = t2Recset.fields("PurSRate")
                .fields("PurAmount") = t2Recset.fields("PurAmount")
                .fields("PurAmtBefDisc") = t2Recset.fields("PurAmtBefDisc")
                .fields("PurDiscPer") = t2Recset.fields("PurDiscPer")
                .fields("PurDiscAmt") = t2Recset.fields("PurDiscAmt")
                .fields("PurAmtBefTax") = t2Recset.fields("PurAmtBefTax")
                .fields("PurTaxPer") = t2Recset.fields("PurTaxPer")
                .fields("PurTaxAmt") = t2Recset.fields("PurTaxAmt")
                .fields("PurRemark") = t2Recset.fields("PurRemark")
                
            ElseIf blnMedSaleTran = True Then
                .fields("SalStkCode") = t2Recset.fields("SalStkCode")
                .fields("SalStkICode") = t2Recset.fields("SalStkICode")
                .fields("SalMptCode") = t2Recset.fields("SalMptCode")
                .fields("SalPttCode") = t2Recset.fields("SalPttCode")
                .fields("SalMdiCode") = t2Recset.fields("SalMdiCode")
                .fields("SalItmCode") = t2Recset.fields("SalItmCode")
                .fields("SalItrCode") = t2Recset.fields("SalItrCode")
                .fields("SalMdiRefNo") = t2Recset.fields("SalMdiRefNo")
                .fields("SalPurCode") = t2Recset.fields("SalPurCode")
                .fields("SalPurICode") = t2Recset.fields("SalPurICode")
                .fields("SalNarr") = t2Recset.fields("SalNarr")
                .fields("SalQty") = t2Recset.fields("SalQty")
                .fields("SalRate") = t2Recset.fields("SalRate")
                .fields("SalAmount") = t2Recset.fields("SalAmount")
                .fields("SalAmtBefDisc") = t2Recset.fields("SalAmtBefDisc")
                .fields("SalDiscPer") = t2Recset.fields("SalDiscPer")
                .fields("SalDiscAmt") = t2Recset.fields("SalDiscAmt")
                .fields("SalAmtBefTax") = t2Recset.fields("SalAmtBefTax")
                .fields("SalTaxPer") = t2Recset.fields("SalTaxPer")
                .fields("SalTaxAmt") = t2Recset.fields("SalTaxAmt")
                
                .fields("SalAdvAmt") = t2Recset.fields("SalAdvAmt")
                .fields("SalRecdAmt") = t2Recset.fields("SalRecdAmt")
                .fields("SalDepoAmt") = t2Recset.fields("SalDepoAmt")
                .fields("SalRefuAmt") = t2Recset.fields("SalRefuAmt")
                .fields("SalBalAmt") = t2Recset.fields("SalBalAmt")
                
                .fields("SalRemark") = t2Recset.fields("SalRemark")
                
                
                
            ElseIf blnMedSalePymtTran = True Then
                
                mSpySahCode = .fields("SpySahCode")
                mSpyDepoAmt = .fields("SpyDepoAmt")
                
                .fields("SpyPttCode") = t2Recset.fields("SpyPttCode")
                .fields("SpySahCode") = t2Recset.fields("SpySahCode")
                .fields("SpyDepoAmt") = t2Recset.fields("SpyDepoAmt")
                .fields("SpyRemark") = t2Recset.fields("SpyRemark")
                
            ElseIf blnMedSaleRefdTran = True Then
                mSfdSahCode = .fields("SfdSahCode")
                mSfdRefuAmt = .fields("SfdRefuAmt")
                
                .fields("SfdPttCode") = t2Recset.fields("SfdPttCode")
                .fields("SfdSahCode") = t2Recset.fields("SfdSahCode")
                .fields("SfdRefuAmt") = t2Recset.fields("SfdRefuAmt")
                .fields("SfdRemark") = t2Recset.fields("SfdRemark")
                
            Else
                ErrorBox "clsVgnMultiTranEntry_CancelTran_#506_[Undefined Case]"
            End If
            .Update
            
            If blnMedSalePymtTran = True Then
                If mRecEdited = True Then
                    If mSpySahCode <> .fields("SpySahCode") Then
                        DispersePropRcptDepoAmt mSpySahCode, (mSpyDepoAmt * -1)                     ' removing deposit amount from old receipt
                        DispersePropRcptDepoAmt .fields("SpySahCode"), .fields("SpyDepoAmt")        ' adding deposit amount to new receipt
                    ElseIf mSpyDepoAmt <> .fields("SpyDepoAmt") Then
                        mSpyDepoAmt = .fields("SpyDepoAmt") - mSpyDepoAmt
                        DispersePropRcptDepoAmt mSpySahCode, mSpyDepoAmt
                    End If
                ElseIf mRecDeleted = True Then
                    DispersePropRcptDepoAmt .fields("SpySahCode"), .fields("SpyDepoAmt")        ' adding deposit amount to restored receipt
                End If
            
            ElseIf blnMedSaleRefdTran = True Then
                If mRecEdited = True Then
                    If mSfdSahCode <> .fields("SfdSahCode") Then
                        DispersePropRcptRefuAmt mSfdSahCode, (mSfdRefuAmt * -1)                     ' removing refund amount from old receipt
                        DispersePropRcptRefuAmt .fields("SfdSahCode"), .fields("SfdRefuAmt")        ' adding refund amount to new receipt
                    ElseIf mSfdRefuAmt <> .fields("SfdRefuAmt") Then
                        mSfdRefuAmt = .fields("SfdRefuAmt") - mSfdRefuAmt
                        DispersePropRcptRefuAmt mSfdSahCode, mSfdRefuAmt
                    End If
                ElseIf mRecDeleted = True Then
                    DispersePropRcptRefuAmt .fields("SfdSahCode"), .fields("SfdRefuAmt")        ' adding refund amount to restored receipt
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
            
            If blnMedSalePymtTran = True Then
                mSpySahCode = .fields("SpySahCode")
                mSpyDepoAmt = .fields("SpyDepoAmt")
                
            ElseIf blnMedSaleRefdTran = True Then
                mSfdSahCode = .fields("SfdSahCode")
                mSfdRefuAmt = .fields("SfdRefuAmt")
                
            End If
        
            .fields(mTrnDtlRecStateField) = ChkDeleteRecStatus(.fields(mTrnDtlRecStateField))
            .Update
            .Delete
            
            If mRecAdded = True Then
                If blnMedSalePymtTran = True Then
                    DispersePropRcptDepoAmt mSpySahCode, (mSpyDepoAmt * -1)
                ElseIf blnMedSaleRefdTran = True Then
                    DispersePropRcptRefuAmt mSfdSahCode, (mSfdRefuAmt * -1)
                End If
            End If
            
        End If
    
        .MoveNext
    Loop
End If
End With
m_dbVgnDatabase.CommitTrans
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
    ErrorBox "clsVgnMultiTranEntry_DeleteTran_#551_[InActive Transaction Entry]"
    GoTo EndSub
End If
On Error GoTo errhand

Rem header section
m_dbVgnDatabase.BeginTrans
With tRecset
.open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbVgnDatabase, adOpenKeyset, adLockOptimistic
Do While .EOF = False
    .fields(mTrnHdrRecStateField) = ChkDeleteRecStatus(.fields(mTrnHdrRecStateField))
    .Update
    '' .Delete deleted in update transaction
    .MoveNext
Loop
End With
m_dbVgnDatabase.CommitTrans
CloseTable tRecset

Rem detail section
m_dbVgnDatabase.BeginTrans
With tRecset
.open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnDtlICodeField & "", m_dbVgnDatabase, adOpenKeyset, adLockOptimistic
Do While .EOF = False
    .fields(mTrnDtlRecStateField) = ChkDeleteRecStatus(.fields(mTrnDtlRecStateField))
    .Update
    '' .Delete deleted in update transaction
    
    If blnMedSalePymtTran = True Then
        DispersePropRcptDepoAmt .fields("SpySahCode"), (.fields("SpyDepoAmt") * -1)
    ElseIf blnMedSaleRefdTran = True Then
        DispersePropRcptRefuAmt .fields("SfdSahCode"), (.fields("SfdRefuAmt") * -1)
    End If
    
    .MoveNext
Loop
End With
m_dbVgnDatabase.CommitTrans
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
If mTrnCode = 0 Then
    ErrorBox "clsVgnMultiTranEntry_SelectTran_#412_[Invalid " & mTitleName & " Entry]"
    Exit Function
End If
mEntryFound = False
For mActiveTran = LBound(aVgnTran) To UBound(aVgnTran)
    If aVgnTran(mActiveTran) = mTrnCode Then
        mEntryFound = True
        Exit For
    End If
Next mActiveTran
If mEntryFound = False Then
    mActiveTran = UBound(aVgnTran) + 1
End If

SelectTran = True
End Function

Public Function NextTran() As Boolean
NextTran = False
If EOTran = True Then
    ErrorBox "clsVgnMultiTranEntry_NextTran_#432_[End of " & mTitleName & " Entry]"
    Exit Function
End If
mActiveTran = mActiveTran + 1

NextTran = True
End Function

Public Function PreviousTran()
PreviousTran = False
If BOTrn = True Then
    ErrorBox "clsVgnMultiTranEntry_PreviousTran_#443_[Begining of " & mTitleName & " Entry]"
    Exit Function
End If
mActiveTran = mActiveTran - 1

PreviousTran = True
End Function

Public Function FirstTran() As Boolean
FirstTran = False
If CountTran = 0 Then
    ErrorBox "clsVgnMultiTranEntry_FirstTran_#454_[No " & mTitleName & " Entry]"
    Exit Function
End If
mActiveTran = LBound(aVgnTran)

FirstTran = True

End Function

Public Function LastTran() As Boolean
LastTran = False
If CountTran = 0 Then
    ErrorBox "clsVgnMultiTranEntry_LastTran_#466_[No " & mTitleName & " Entry]"
    Exit Function
End If
mActiveTran = UBound(aVgnTran)

LastTran = True

End Function

Public Property Get CountTran() As Integer
If UBound(aVgnTran) = -1 Then
    CountTran = 0
Else
    CountTran = UBound(aVgnTran) - LBound(aVgnTran) + 1
End If

End Property

Public Property Get EOTran() As Boolean
EOTran = (mActiveTran > UBound(aVgnTran) Or UBound(aVgnTran) = -1)
End Property

Public Property Get BOTrn() As Boolean
BOTrn = (mActiveTran < LBound(aVgnTran) Or UBound(aVgnTran) = -1)
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
    ErrorBox "clsVgnMultiTranEntry_AddNewHdr_#736_[InActive " & mTitleName & " Entry]"
    GoTo EndSub
End If

On Error GoTo errhand
mTrnCode_lng = 0

m_dbVgnDatabase.BeginTrans
With tRecset
.open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=-0.1", m_dbVgnDatabase, adOpenKeyset, adLockOptimistic

.AddNew

Rem .Fields(mTrnHdrCodeField) = AutoNumber
.fields(mTrnHdrDateField) = mTrnDate_dt
.fields(mTrnVtmField) = mTrnVtmCode_lng
.fields(mTrnPrefixField) = mTrnPrefix_str
.fields(mTrnVchNoField) = mTrnVchNo_lng
.fields(mTrnPostfixField) = mTrnPostfix_str
.fields(mTrnHdrCmpCodeField) = mTrnCmpCode_int
.fields(mTrnHdrRecStateField) = ChkEditRecStatus(.fields(mTrnHdrRecStateField))

If blnMedPurchTran = True Then
    .fields("PuhStkCode") = mPuhStkCode_lng
    .fields("PuhTime") = mPuhTime_lng
    .fields("PuhTrnRefNo") = mPuhTrnRefNo_str
    .fields("PuhTrnRefDt") = mPuhTrnRefDt_dt
    .fields("PuhMptCode") = mPuhMptCode_lng
    .fields("PuhPttCode") = mPuhPttCode_lng
    .fields("PuhQty") = mPuhQty_dbl
    .fields("PuhAmount") = mPuhAmount_dbl
    .fields("PuhAmtBefDisc") = mPuhAmtBefDisc_dbl
    .fields("PuhDiscPer") = mPuhDiscPer_dbl
    .fields("PuhDiscAmt") = mPuhDiscAmt_dbl
    .fields("PuhAmtBefTax") = mPuhAmtBefTax_dbl
    .fields("PuhTaxPer") = mPuhTaxPer_dbl
    .fields("PuhTaxAmt") = mPuhTaxAmt_dbl
    .fields("PuhOtherAmt") = mPuhOtherAmt_dbl
    .fields("PuhROffAmt") = mPuhROffAmt_dbl
    .fields("PuhRemark") = mPuhRemark_str
    
ElseIf blnMedSaleTran = True Then
    .fields("SahStkCode") = mSahStkCode_lng
    .fields("SahTime") = mSahTime_lng
    .fields("SahTrnRefNo") = mSahTrnRefNo_str
    .fields("SahTrnRefDt") = mSahTrnRefDt_dt
    .fields("SahMptCode") = mSahMptCode_lng
    .fields("SahPttCode") = mSahPttCode_lng
    .fields("SahQty") = mSahQty_dbl
    .fields("SahAmount") = mSahAmount_dbl
    .fields("SahAmtBefDisc") = mSahAmtBefDisc_dbl
    .fields("SahDiscPer") = mSahDiscPer_dbl
    .fields("SahDiscAmt") = mSahDiscAmt_dbl
    .fields("SahAmtBefTax") = mSahAmtBefTax_dbl
    .fields("SahTaxPer") = mSahTaxPer_dbl
    .fields("SahTaxAmt") = mSahTaxAmt_dbl
    .fields("SahOtherAmt") = mSahOtherAmt_dbl
    .fields("SahROffAmt") = mSahROffAmt_dbl
    
    .fields("SahAdvAmt") = mSahAdvAmt_dbl
    .fields("SahRecdAmt") = mSahRecdAmt_dbl
    .fields("SahDepoAmt") = mSahDepoAmt_dbl
    .fields("SahRefuAmt") = mSahRefuAmt_dbl
    .fields("SahBalAmt") = mSahBalAmt_dbl
    
    
    .fields("SahRemark") = mSahRemark_str
    
ElseIf blnMedSalePymtTran = True Then
    .fields("SphTime") = mSphTime_lng
    .fields("SphPttCode") = mSphPttCode_lng
    .fields("SphDepoAmt") = mSphDepoAmt_dbl
    .fields("SphRemark") = mSphRemark_str
    
ElseIf blnMedSaleRefdTran = True Then
    .fields("SfhTime") = mSfhTime_lng
    .fields("SfhPttCode") = mSfhPttCode_lng
    .fields("SfhRefuAmt") = mSfhRefuAmt_dbl
    .fields("SfhRemark") = mSfhRemark_str
    
    
    
Else
    ErrorBox "clsVgnMultiTranEntry_AddNewHdr_#776_[Undefined Case]"
End If
.Update

mTrnCode_lng = .fields(mTrnHdrCodeField)
End With
m_dbVgnDatabase.CommitTrans
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
    ErrorBox "clsVgnMultiTranEntry_AddNewDtl_#810_[InActive " & mTitleName & " Entry]"
    GoTo EndSub
End If

On Error GoTo errhand
mTrnDtlICode_lng = 0

m_dbVgnDatabase.BeginTrans
With tRecset
.open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=-0.1", m_dbVgnDatabase, adOpenKeyset, adLockOptimistic

.AddNew

Rem mTrnDtlICode_lng = AutoNumber
.fields(mTrnDtlCodeField) = mTrnCode
.fields(mTrnDtlSnoField) = mTrnDtlSno_int
.fields(mTrnDtlDateField) = mTrnDate_dt
.fields(mTrnDtlCmpCodeField) = mTrnCmpCode_int
.fields(mTrnDtlRecStateField) = ChkEditRecStatus(.fields(mTrnDtlRecStateField))

If blnMedPurchTran = True Then
    .fields("PurStkCode") = mPurStkCode_lng
    .fields("PurStkICode") = mPurStkICode_lng
    .fields("PurMptCode") = mPurMptCode_lng
    .fields("PurPttCode") = mPurPttCode_lng
    .fields("PurMdiCode") = mPurMdiCode_lng
    .fields("PurItmCode") = mPurItmCode_lng
    .fields("PurItrCode") = mPurItrCode_lng
    .fields("PurMdiRefNo") = mPurMdiRefNo_str
    .fields("PurNarr") = mPurNarr_str
    .fields("PurQty") = mPurQty_dbl
    .fields("PurRate") = mPurRate_dbl
    .fields("PurMRP") = mPurMRP_dbl
    .fields("PurSRate") = mPurSRate_dbl
    .fields("PurAmount") = mPurAmount_dbl
    .fields("PurAmtBefDisc") = mPurAmtBefDisc_dbl
    .fields("PurDiscPer") = mPurDiscPer_dbl
    .fields("PurDiscAmt") = mPurDiscAmt_dbl
    .fields("PurAmtBefTax") = mPurAmtBefTax_dbl
    .fields("PurTaxPer") = mPurTaxPer_dbl
    .fields("PurTaxAmt") = mPurTaxAmt_dbl
    .fields("PurRemark") = mPurRemark_str
    
ElseIf blnMedSaleTran = True Then
    .fields("SalStkCode") = mSalStkCode_lng
    .fields("SalStkICode") = mSalStkICode_lng
    .fields("SalMptCode") = mSalMptCode_lng
    .fields("SalPttCode") = mSalPttCode_lng
    .fields("SalMdiCode") = mSalMdiCode_lng
    .fields("SalItmCode") = mSalItmCode_lng
    .fields("SalItrCode") = mSalItrCode_lng
    .fields("SalMdiRefNo") = mSalMdiRefNo_str
    .fields("SalPurCode") = mSalPurCode_lng
    .fields("SalPurICode") = mSalPurICode_lng
    .fields("SalNarr") = mSalNarr_str
    .fields("SalQty") = mSalQty_dbl
    .fields("SalRate") = mSalRate_dbl
    .fields("SalAmount") = mSalAmount_dbl
    .fields("SalAmtBefDisc") = mSalAmtBefDisc_dbl
    .fields("SalDiscPer") = mSalDiscPer_dbl
    .fields("SalDiscAmt") = mSalDiscAmt_dbl
    .fields("SalAmtBefTax") = mSalAmtBefTax_dbl
    .fields("SalTaxPer") = mSalTaxPer_dbl
    .fields("SalTaxAmt") = mSalTaxAmt_dbl
    
    .fields("SalAdvAmt") = mSalAdvAmt_dbl
    .fields("SalRecdAmt") = mSalRecdAmt_dbl
    .fields("SalDepoAmt") = mSalDepoAmt_dbl
    .fields("SalRefuAmt") = mSalRefuAmt_dbl
    .fields("SalBalAmt") = mSalBalAmt_dbl
    
    .fields("SalRemark") = mSalRemark_str
    
    
ElseIf blnMedSalePymtTran = True Then
    .fields("SpyPttCode") = mSpyPttCode_lng
    .fields("SpySahCode") = mSpySahCode_lng
    .fields("SpyDepoAmt") = mSpyDepoAmt_dbl
    .fields("SpyRemark") = mSpyRemark_str
    
    DispersePropRcptDepoAmt mSpySahCode_lng, mSpyDepoAmt_dbl
    
ElseIf blnMedSaleRefdTran = True Then
    .fields("SfdPttCode") = mSfdPttCode_lng
    .fields("SfdSahCode") = mSfdSahCode_lng
    .fields("SfdRefuAmt") = mSfdRefuAmt_dbl
    .fields("SfdRemark") = mSfdRemark_str
    
    DispersePropRcptRefuAmt mSfdSahCode_lng, mSfdRefuAmt_dbl
    
    
Else
    ErrorBox "clsVgnMultiTranEntry_AddNewDtl_#844_[Undefined Case]"
End If
.Update

mTrnDtlICode_lng = .fields(mTrnDtlICodeField)
End With
m_dbVgnDatabase.CommitTrans
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
    ErrorBox "clsVgnMultiTranEntry_UpdateDtl_#874_[InActive " & mTitleName & " Entry]"
    GoTo EndSub
End If

On Error GoTo errhand

m_dbVgnDatabase.BeginTrans
With tRecset
.open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbVgnDatabase, adOpenKeyset, adLockOptimistic

Rem .Fields(mTrnHdrCodeField) = AutoNumber
.fields(mTrnHdrDateField) = mTrnDate_dt
.fields(mTrnVtmField) = mTrnVtmCode_lng
.fields(mTrnPrefixField) = mTrnPrefix_str
.fields(mTrnVchNoField) = mTrnVchNo_lng
.fields(mTrnPostfixField) = mTrnPostfix_str
.fields(mTrnHdrCmpCodeField) = mTrnCmpCode_int
.fields(mTrnHdrRecStateField) = ChkEditRecStatus(.fields(mTrnHdrRecStateField))

If blnMedPurchTran = True Then
    .fields("PuhStkCode") = mPuhStkCode_lng
    .fields("PuhTime") = mPuhTime_lng
    .fields("PuhTrnRefNo") = mPuhTrnRefNo_str
    .fields("PuhTrnRefDt") = mPuhTrnRefDt_dt
    .fields("PuhMptCode") = mPuhMptCode_lng
    .fields("PuhPttCode") = mPuhPttCode_lng
    .fields("PuhQty") = mPuhQty_dbl
    .fields("PuhAmount") = mPuhAmount_dbl
    .fields("PuhAmtBefDisc") = mPuhAmtBefDisc_dbl
    .fields("PuhDiscPer") = mPuhDiscPer_dbl
    .fields("PuhDiscAmt") = mPuhDiscAmt_dbl
    .fields("PuhAmtBefTax") = mPuhAmtBefTax_dbl
    .fields("PuhTaxPer") = mPuhTaxPer_dbl
    .fields("PuhTaxAmt") = mPuhTaxAmt_dbl
    .fields("PuhOtherAmt") = mPuhOtherAmt_dbl
    .fields("PuhROffAmt") = mPuhROffAmt_dbl
    .fields("PuhRemark") = mPuhRemark_str
    
ElseIf blnMedSaleTran = True Then
    .fields("SahStkCode") = mSahStkCode_lng
    .fields("SahTime") = mSahTime_lng
    .fields("SahTrnRefNo") = mSahTrnRefNo_str
    .fields("SahTrnRefDt") = mSahTrnRefDt_dt
    .fields("SahMptCode") = mSahMptCode_lng
    .fields("SahPttCode") = mSahPttCode_lng
    .fields("SahQty") = mSahQty_dbl
    .fields("SahAmount") = mSahAmount_dbl
    .fields("SahAmtBefDisc") = mSahAmtBefDisc_dbl
    .fields("SahDiscPer") = mSahDiscPer_dbl
    .fields("SahDiscAmt") = mSahDiscAmt_dbl
    .fields("SahAmtBefTax") = mSahAmtBefTax_dbl
    .fields("SahTaxPer") = mSahTaxPer_dbl
    .fields("SahTaxAmt") = mSahTaxAmt_dbl
    .fields("SahOtherAmt") = mSahOtherAmt_dbl
    .fields("SahROffAmt") = mSahROffAmt_dbl
    
    .fields("SahAdvAmt") = mSahAdvAmt_dbl
    .fields("SahRecdAmt") = mSahRecdAmt_dbl
    .fields("SahDepoAmt") = mSahDepoAmt_dbl
    .fields("SahRefuAmt") = mSahRefuAmt_dbl
    .fields("SahBalAmt") = mSahBalAmt_dbl
    
    .fields("SahRemark") = mSahRemark_str
    
    
    
ElseIf blnMedSalePymtTran = True Then
    .fields("SphTime") = mSphTime_lng
    .fields("SphPttCode") = mSphPttCode_lng
    .fields("SphDepoAmt") = mSphDepoAmt_dbl
    .fields("SphRemark") = mSphRemark_str
    
ElseIf blnMedSaleRefdTran = True Then
    .fields("SfhTime") = mSfhTime_lng
    .fields("SfhPttCode") = mSfhPttCode_lng
    .fields("SfhRefuAmt") = mSfhRefuAmt_dbl
    .fields("SfhRemark") = mSfhRemark_str
    
    
    
Else
    ErrorBox "clsVgnMultiTranEntry_UpdateHdr_#911_[Undefined Case]"
End If
.Update
End With
m_dbVgnDatabase.CommitTrans
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
Dim mSpySahCode As Long, mSpyDepoAmt As Double
Dim mSfdSahCode As Long, mSfdRefuAmt As Double

UpdateDtl = False
If Chk_ActiveTran() = False Or mTrnCode <> ActiveTrnCode Then
    ErrorBox "clsVgnMultiTranEntry_UpdateDtl_#936_[InActive " & mTitleName & " Entry]"
    GoTo EndSub
End If

On Error GoTo errhand

m_dbVgnDatabase.BeginTrans
With tRecset
.open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " and " & mTrnDtlICodeField & "=" & CStr(mTrnICode) & "", m_dbVgnDatabase, adOpenKeyset, adLockOptimistic

Rem mTrnDtlICode_lng = AutoNumber
.fields(mTrnDtlCodeField) = mTrnCode_lng
.fields(mTrnDtlSnoField) = mTrnDtlSno_int
.fields(mTrnDtlDateField) = mTrnDate_dt
.fields(mTrnDtlCmpCodeField) = mTrnCmpCode_int
.fields(mTrnDtlRecStateField) = ChkEditRecStatus(.fields(mTrnDtlRecStateField))

If blnMedPurchTran = True Then
    .fields("PurStkCode") = mPurStkCode_lng
    .fields("PurStkICode") = mPurStkICode_lng
    .fields("PurMptCode") = mPurMptCode_lng
    .fields("PurPttCode") = mPurPttCode_lng
    .fields("PurMdiCode") = mPurMdiCode_lng
    .fields("PurItmCode") = mPurItmCode_lng
    .fields("PurItrCode") = mPurItrCode_lng
    .fields("PurMdiRefNo") = mPurMdiRefNo_str
    .fields("PurNarr") = mPurNarr_str
    .fields("PurQty") = mPurQty_dbl
    .fields("PurRate") = mPurRate_dbl
    .fields("PurMRP") = mPurMRP_dbl
    .fields("PurSRate") = mPurSRate_dbl
    .fields("PurAmount") = mPurAmount_dbl
    .fields("PurAmtBefDisc") = mPurAmtBefDisc_dbl
    .fields("PurDiscPer") = mPurDiscPer_dbl
    .fields("PurDiscAmt") = mPurDiscAmt_dbl
    .fields("PurAmtBefTax") = mPurAmtBefTax_dbl
    .fields("PurTaxPer") = mPurTaxPer_dbl
    .fields("PurTaxAmt") = mPurTaxAmt_dbl
    .fields("PurRemark") = mPurRemark_str
    
ElseIf blnMedSaleTran = True Then
    .fields("SalStkCode") = mSalStkCode_lng
    .fields("SalStkICode") = mSalStkICode_lng
    .fields("SalMptCode") = mSalMptCode_lng
    .fields("SalPttCode") = mSalPttCode_lng
    .fields("SalMdiCode") = mSalMdiCode_lng
    .fields("SalItmCode") = mSalItmCode_lng
    .fields("SalItrCode") = mSalItrCode_lng
    .fields("SalMdiRefNo") = mSalMdiRefNo_str
    .fields("SalPurCode") = mSalPurCode_lng
    .fields("SalPurICode") = mSalPurICode_lng
    .fields("SalNarr") = mSalNarr_str
    .fields("SalQty") = mSalQty_dbl
    .fields("SalRate") = mSalRate_dbl
    .fields("SalAmount") = mSalAmount_dbl
    .fields("SalAmtBefDisc") = mSalAmtBefDisc_dbl
    .fields("SalDiscPer") = mSalDiscPer_dbl
    .fields("SalDiscAmt") = mSalDiscAmt_dbl
    .fields("SalAmtBefTax") = mSalAmtBefTax_dbl
    .fields("SalTaxPer") = mSalTaxPer_dbl
    .fields("SalTaxAmt") = mSalTaxAmt_dbl
    
    .fields("SalAdvAmt") = mSalAdvAmt_dbl
    .fields("SalRecdAmt") = mSalRecdAmt_dbl
    .fields("SalDepoAmt") = mSalDepoAmt_dbl
    .fields("SalRefuAmt") = mSalRefuAmt_dbl
    .fields("SalBalAmt") = mSalBalAmt_dbl
    
    .fields("SalRemark") = mSalRemark_str
    
    
    
ElseIf blnMedSalePymtTran = True Then
    mSpySahCode = .fields("SpySahCode")
    mSpyDepoAmt = .fields("SpyDepoAmt")
    
    .fields("SpyPttCode") = mSpyPttCode_lng
    .fields("SpySahCode") = mSpySahCode_lng
    .fields("SpyDepoAmt") = mSpyDepoAmt_dbl
    .fields("SpyRemark") = mSpyRemark_str
    
ElseIf blnMedSaleRefdTran = True Then
    mSfdSahCode = .fields("SfdSahCode")
    mSfdRefuAmt = .fields("SfdRefuAmt")
    
    .fields("SfdPttCode") = mSfdPttCode_lng
    .fields("SfdSahCode") = mSfdSahCode_lng
    .fields("SfdRefuAmt") = mSfdRefuAmt_dbl
    .fields("SfdRemark") = mSfdRemark_str
    
    
    
    
    
Else
    ErrorBox "clsVgnMultiTranEntry_UpdateDtl_#966_[Undefined Case]"
End If
.Update

If blnMedSalePymtTran = True Then
    If mSpySahCode <> .fields("SpySahCode") Then
        DispersePropRcptDepoAmt mSpySahCode, (mSpyDepoAmt * -1)                 ' removing deposit amount for old receipt
        DispersePropRcptDepoAmt .fields("SpySahCode"), .fields("SpyDepoAmt")    ' adding deposit amount to new receipt
    ElseIf mSpyDepoAmt <> .fields("SpyDepoAmt") Then
        mSpyDepoAmt = .fields("SpyDepoAmt") - mSpyDepoAmt
        DispersePropRcptDepoAmt mSpySahCode, mSpyDepoAmt
    End If
    
ElseIf blnMedSaleRefdTran = True Then
    If mSfdSahCode <> .fields("SfdSahCode") Then
        DispersePropRcptRefuAmt mSfdSahCode, (mSfdRefuAmt * -1)                 ' removing refund amount for old receipt
        DispersePropRcptRefuAmt .fields("SfdSahCode"), .fields("SfdRefuAmt")    ' adding refund amount to new receipt
    ElseIf mSfdRefuAmt <> .fields("SfdRefuAmt") Then
        mSfdRefuAmt = .fields("SfdRefuAmt") - mSfdRefuAmt
        DispersePropRcptRefuAmt mSfdSahCode, mSfdRefuAmt
    End If
End If


End With
m_dbVgnDatabase.CommitTrans
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
    ErrorBox "clsVgnMultiTranEntry_DeleteDtl_#995_[InActive " & mTitleName & " Entry]"
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
    
    m_dbVgnDatabase.BeginTrans
    With tRecset
    .open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " and " & mTrnDtlICodeField & "=" & CStr(mTrnICode) & "", m_dbVgnDatabase, adOpenKeyset, adLockOptimistic
    
    .fields(mTrnDtlRecStateField) = ChkDeleteRecStatus(.fields(mTrnDtlRecStateField))
    .Update
    End With
    If blnMedSalePymtTran = True Then
        DispersePropRcptDepoAmt tRecset.fields("SpySahCode"), (tRecset.fields("SpyDepoAmt") * -1)
    ElseIf blnMedSaleRefdTran = True Then
        DispersePropRcptRefuAmt tRecset.fields("SfdSahCode"), (tRecset.fields("SfdRefuAmt") * -1)
    End If
    
    
    m_dbVgnDatabase.CommitTrans
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

Private Sub DispersePropRcptDepoAmt(ByVal mSpySahCode As Long, ByVal mSpyDepoAmt_diff As Double)
Dim tRecset As New ADODB.Recordset, mSpyDepoAmtTot As Double, mPropDepoAmt As Variant, mNetAmtTot As Double, mSpyDepoAmtBal As Double, mSpyDepoAmtAdjusted As Double

On Error GoTo errhand

mSpyDepoAmtTot = mSpyDepoAmt_diff
mSpyDepoAmtBal = mSpyDepoAmt_diff
mSpyDepoAmtAdjusted = 0
mNetAmtTot = 0
mSpyDepoAmtAdjusted = 0

With tRecset
.open "Select * from MedSaleHdr where SahCode=" & CStr(mSpySahCode), m_dbVgnDatabase, adOpenKeyset, adLockOptimistic
mNetAmtTot = .fields("SahAmount")
End With
CloseTable tRecset

With tRecset
.open "Select * from MedSaleDtl where SalCode=" & CStr(mSpySahCode) & " order by SalSno", m_dbVgnDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 And mSpyDepoAmtTot <> 0 Then
    m_dbVgnDatabase.BeginTrans
    Do While .EOF = False
        If InList(.fields("SalRecState"), Array(cREC_UNCHANGED)) = True Then
            mPropDepoAmt = Round(CDec(mSpyDepoAmtTot) * CDec(.fields("SalAmount")) / CDec(mNetAmtTot), 2)
            
            .fields("SalDepoAmt") = .fields("SalDepoAmt") + mPropDepoAmt
            .fields("SalBalAmt") = .fields("SalBalAmt") - mPropDepoAmt
            .Update
            
            mSpyDepoAmtBal = mSpyDepoAmtBal - mPropDepoAmt
            mSpyDepoAmtAdjusted = mSpyDepoAmtAdjusted + mPropDepoAmt
        Else
            If InList(.fields("SalRecState"), Array(cREC_CANCELED, cREC_DELETED)) = False Then
                ErrorBox "clsVgnMultiTranEntry_DispersePropRcptDepoAmt_#1540_[Invalid Record Status]"
            End If
        End If
        
        .MoveNext
    Loop
    If mSpyDepoAmtBal <> 0 And mSpyDepoAmtBal <> mSpyDepoAmtTot Then
        .MovePrevious
        
        mPropDepoAmt = mSpyDepoAmtBal
        .fields("SalDepoAmt") = .fields("SalDepoAmt") + mPropDepoAmt
        .fields("SalBalAmt") = .fields("SalBalAmt") - mPropDepoAmt
        .Update
                
        mSpyDepoAmtBal = mSpyDepoAmtBal - mPropDepoAmt
        mSpyDepoAmtAdjusted = mSpyDepoAmtAdjusted + mPropDepoAmt
    End If
    m_dbVgnDatabase.CommitTrans
End If
End With
CloseTable tRecset

m_dbVgnDatabase.BeginTrans
With tRecset
.open "Select * from MedSaleHdr where SahCode=" & CStr(mSpySahCode) & "", m_dbVgnDatabase, adOpenKeyset, adLockOptimistic
.fields("SahDepoAmt") = .fields("SahDepoAmt") + mSpyDepoAmtAdjusted
.fields("SahBalAmt") = .fields("SahAmount") - (.fields("SahAdvAmt") + .fields("SahRecdAmt") + .fields("SahDepoAmt"))
.Update
End With
m_dbVgnDatabase.CommitTrans
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

Private Sub DispersePropRcptRefuAmt(ByVal mSfdSahCode As Long, ByVal mSfdRefuAmt_diff As Double)
Dim tRecset As New ADODB.Recordset, mSfdRefuAmtTot As Double, mPropRefuAmt As Variant, mSfdRefuAmtBal As Double, mSfdAmtAftDiscTot As Double, mSfdRefuAmtAdjusted As Double

On Error GoTo errhand

mSfdRefuAmtBal = mSfdRefuAmt_diff
mSfdRefuAmtTot = mSfdRefuAmt_diff
mSfdRefuAmtAdjusted = 0
mSfdAmtAftDiscTot = 0

With tRecset
.open "Select * from MedSaleHdr where SahCode = " & CStr(mSfdSahCode) & "", m_dbVgnDatabase, adOpenKeyset, adLockOptimistic
mSfdAmtAftDiscTot = .fields("SahAmount")
End With
CloseTable tRecset

With tRecset
.open "Select * from MedSaleDtl where SalCode=" & CStr(mSfdSahCode) & " order by SalSno", m_dbVgnDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 And mSfdRefuAmtTot <> 0 Then
    m_dbVgnDatabase.BeginTrans
    Do While .EOF = False
        mPropRefuAmt = Round(CDec(mSfdRefuAmtTot) * CDec(.fields("SalAmount")) / CDec(mSfdAmtAftDiscTot), 2)
        
        .fields("SalRefuAmt") = .fields("SalRefuAmt") + mPropRefuAmt
        Rem .fields("SalBalAmt") = .fields("SalBalAmt") - mPropRefuAmt
        .Update
        
        mSfdRefuAmtBal = mSfdRefuAmtBal - mPropRefuAmt
        mSfdRefuAmtAdjusted = mSfdRefuAmtAdjusted + mPropRefuAmt
        
        .MoveNext
    Loop
    If mSfdRefuAmtBal <> 0 And mSfdRefuAmtBal <> mSfdRefuAmtTot Then
        .MovePrevious
        
        mPropRefuAmt = mSfdRefuAmtBal
        
        .fields("SalRefuAmt") = .fields("SalRefuAmt") + mPropRefuAmt
        Rem .fields("SalBalAmt") = .fields("SalBalAmt") - mPropRefuAmt
        .Update
        
        mSfdRefuAmtBal = mSfdRefuAmtBal - mPropRefuAmt
        mSfdRefuAmtAdjusted = mSfdRefuAmtAdjusted + mPropRefuAmt
    End If
    m_dbVgnDatabase.CommitTrans
End If
End With
CloseTable tRecset

m_dbVgnDatabase.BeginTrans
With tRecset
.open "Select * from MedSaleHdr where SahCode=" & CStr(mSfdSahCode) & "", m_dbVgnDatabase, adOpenKeyset, adLockOptimistic
.fields("SahRefuAmt") = .fields("SahRefuAmt") + mSfdRefuAmtAdjusted
.fields("SahBalAmt") = .fields("SahAmount") - (.fields("SahAdvAmt") + .fields("SahRecdAmt") + .fields("SahDepoAmt"))
.Update
End With
m_dbVgnDatabase.CommitTrans
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
    ErrorBox "clsVgnMultiTranEntry_Data_CreateLog_#406_[InActive " & mTitleName & " Entry]"
    GoTo EndSub
End If

t1Recset.open "Select * from " & mTrnDtlTableName & "_Log where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnDtlICodeField & "", m_dbVgnDatabase, adOpenKeyset, adLockOptimistic
t2Recset.open "Select * from " & mTrnHdrTableName & "_Log where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbVgnDatabase, adOpenKeyset, adLockOptimistic
If t1Recset.RecordCount = 0 And t2Recset.RecordCount = 0 Then
    m_dbVgnDatabase.BeginTrans
    m_dbVgnDatabase.Execute "Insert into " & mTrnDtlTableName & "_Log Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " and " & mTrnDtlRecStateField & "=" & CStr(cREC_UNCHANGED) & ""
    m_dbVgnDatabase.Execute "Insert into " & mTrnHdrTableName & "_Log Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & " and " & mTrnHdrRecStateField & "=" & CStr(cREC_UNCHANGED) & ""
    m_dbVgnDatabase.CommitTrans
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
    ErrorBox "clsVgnMultiTranEntry_Data_RemoveLog_#1041_[InActive " & mTitleName & " Entry]"
    Exit Function
End If

m_dbVgnDatabase.BeginTrans
m_dbVgnDatabase.Execute "Delete from " & mTrnDtlTableName & "_Log where " & mTrnDtlCodeField & "=" & CStr(mTrnCode)
m_dbVgnDatabase.Execute "Delete from " & mTrnHdrTableName & "_Log where " & mTrnHdrCodeField & "=" & CStr(mTrnCode)
m_dbVgnDatabase.CommitTrans

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
If blnMedPurchTran = True Then
    With tRecset
    .open "Select top 1 * from (((MedPurchDtl" _
        & " inner join MedPurchHdr on MedPurchDtl.PurCode = MedPurchHdr.PuhCode)" _
        & " inner join MedSaleDtl on MedPurchDtl.PurICode = MedSaleDtl.SalPurICode)" _
        & " left Join MedSaleHdr on MedSaleDtl.SalCode = MedSaleHdr.SahCode)" _
        & " left Join VTypMast on MedSaleHdr.SahVtmCode = VTypMast.VtmCode" _
        & " where PurCode = " & CStr(mTrnCode) _
        & IIf(IsMissing(mTrnICode) = False, " and PurICode=" & CStr(mTrnICode), "") _
        & " order by PurDate desc,PurCode" _
        , m_dbComDatabase, adOpenKeyset, adLockOptimistic
    If .EOF = False Then
        If IsNull(.fields("SahCode")) = False Then
            AlertBox "Sales/Purchase Return Entry Exist !!!" _
                & vbCrLf & .fields("VtmName") & " No." & CStr(.fields("SahVchNo")) & " Dated " & Dtoc(.fields("SahDate")) & ""
        Else
            AlertBox "Sales/Purchase Return Entry Under Process !!!" _
                & vbCrLf & " Dated " & Dtoc(.fields("PurDate")) & ""
        End If
        ChkEntryExist = True
    End If
    End With
    CloseTable tRecset
    
ElseIf blnMedSaleTran = True Then
    
    With tRecset
    .open "Select * from MedSalePymtDtl dtl inner join MedSalePymtHdr hdr on dtl.SpyCode=hdr.SphCode where SpySahCode=" & CStr(mTrnCode) & " order by SpyDate desc,SphVchNo desc", m_dbVgnDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        AlertBox "Sale Bill Payment No." & CStr(.fields("SphVchNo")) & " Dated " & Dtoc(.fields("SphDate")) & " !!!"
        ChkEntryExist = True
    End If
    End With
    CloseTable tRecset
    
    If ChkEntryExist = False Then
        With tRecset
        .open "Select * from MedSaleRefdDtl dtl inner join MedSaleRefdHdr hdr on dtl.SfdCode = hdr.SfhCode where SfdSahCode=" & CStr(mTrnCode) & " order by SfdDate desc,SfhVchNo desc", m_dbVgnDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            AlertBox "Sale Bill Refund No." & CStr(.fields("SfhVchNo")) & " Dated " & Dtoc(.fields("SfhDate")) & " !!!"
            ChkEntryExist = True
        End If
        End With
        CloseTable tRecset
    End If
    
    
ElseIf blnMedSalePymtTran = True Then
    Dim mSpyDepoAmt As Double, mSpySahCode As Long
    With tRecset
    .open "Select SpySahCode,sum(SpyDepoAmt) as SpyDepoAmt_sum from MedSalePymtDtl dtl inner join MedSalePymtHdr hdr on dtl.SpyCode=hdr.SphCode where SpyCode=" & CStr(mTrnCode) & " group by SpySahCode", m_dbVgnDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        Do While .EOF = False And ChkEntryExist = False
            mSpySahCode = .fields("SpySahCode")
            mSpyDepoAmt = .fields("SpyDepoAmt_sum")
            
            With t1Recset
            .open "Select * from MedSaleHdr hdr inner join VTypMast vtm on hdr.SahVtmCode = vtm.VtmCode where SahCode=" & CStr(mSpySahCode) & "", m_dbComDatabase, adOpenKeyset, adLockReadOnly
            If .RecordCount > 0 Then
                If .fields("SahRefuAmt") > (.fields("SahAdvAmt") + .fields("SahRecdAmt") + .fields("SahDepoAmt") - mSpyDepoAmt) Then
                    ErrorBox "Excess Amount Refunded for Receipt No." & .fields("VtmName") & "-" & CStr(.fields("SahVchNo")) & " Dated " & Dtoc(.fields("SahDate")) & " !!!"
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
    
ElseIf blnMedSaleRefdTran = True Then
    Rem does not affect transaction for any negative balance
    
    
    
End If


EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Function


End Function

