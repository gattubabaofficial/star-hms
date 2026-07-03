VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsMdsMultiTranEntry"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False

Option Explicit

Dim m_dbMdsDatabase As ADODB.Connection, m_dbBdkDatabase As ADODB.Connection, m_dbAcDatabase As ADODB.Connection, m_dbStDatabase As ADODB.Connection, m_dbGrpDatabase As ADODB.Connection, m_dbComDatabase As ADODB.Connection
Dim mClassUIdCode As Long, mClassUIdFileName As String, mClassAcsPermFileName As String
Dim mTrnHdrTableName As String, mTrnDtlTableName As String, mTrnHdrCodeField As String, mTrnDtlCodeField As String, mTrnHdrDateField As String, mTrnDtlDateField As String, mTrnVtmField As String, mTrnPrefixField As String, mTrnVchNoField As String, mTrnPostfixField As String, mTrnDtlICodeField As String, mTrnDtlSnoField As String, mTrnHdrRecStateField As String, mTrnDtlRecStateField As String, mTrnHdrCmpCodeField As String, mTrnDtlCmpCodeField As String, mTitleName As String
Public blnPurchTran As Boolean, blnSaleTran As Boolean
Rem common class variables used in both header and detail
Public mTrnCode_lng As Long, mTrnVtmCode_lng As Long, mTrnPrefix_str As String, mTrnVchNo_lng As Long, mTrnPostfix_str As String, mTrnDate_dt As Date, mTrnCmpCode_int As Integer
Rem common class header variables
Public mTrnHdrRecState_int As Integer
Rem common class detail variables
Public mTrnDtlICode_lng As Long, mTrnDtlSno_int As Integer, mTrnDtlRecState_int As Integer
Rem purchase header variables
Public mPuhStkCode_lng As Long, mPuhTime_lng As Long, mPuhTime_str As String, mPuhTrnRefNo_str As String, mPuhTrnRefDt_dt As Date, mPuhPrtCode_lng As Long, mPuhPttCode_lng As Long, mPuhQty_dbl As Double, mPuhAmount_dbl As Double, mPuhAmtBefDisc_dbl As Double, mPuhDiscPer_dbl As Double, mPuhDiscAmt_dbl As Double, mPuhAmtBefTax_dbl As Double, mPuhTaxPer_dbl As Double, mPuhTaxAmt_dbl As Double, mPuhOtherAmt_dbl As Double, mPuhROffAmt_dbl As Double, mPuhRemark_str As String
Rem purchase detail variables
Public mPurStkCode_lng As Long, mPurStkICode_lng As Long, mPurSimCode_lng As Long, mPurItmCode_lng As Long, mPurItrCode_lng As Long, mPurSimRefNo_str As String, mPurPrtCode_lng As Long, mPurPttCode_lng As Long, mPurNarr_str As String, mPurQty_dbl As Double, mPurRate_dbl As Double, mPurMRP_dbl As Double, mPurSRate_dbl As Double, mPurAmount_dbl As Double, mPurAmtBefDisc_dbl As Double, mPurDiscPer_dbl As Double, mPurDiscAmt_dbl As Double, mPurAmtBefTax_dbl As Double, mPurTaxPer_dbl As Double, mPurTaxAmt_dbl As Double, mPurRemark_str As String
Rem sale header variables
Public mSahStkCode_lng As Long, mSahTime_lng As Long, mSahTime_str As String, mSahTrnRefNo_str As String, mSahTrnRefDt_dt As Date, mSahPrtCode_lng As Long, mSahPttCode_lng As Long, mSahQty_dbl As Double, mSahAmount_dbl As Double, mSahAmtBefDisc_dbl As Double, mSahDiscPer_dbl As Double, mSahDiscAmt_dbl As Double, mSahAmtBefTax_dbl As Double, mSahTaxPer_dbl As Double, mSahTaxAmt_dbl As Double, mSahOtherAmt_dbl As Double, mSahROffAmt_dbl As Double, mSahRemark_str As String
Rem sale detail variables
Public mSalStkCode_lng As Long, mSalStkICode_lng As Long, mSalSimCode_lng As Long, mSalItmCode_lng As Long, mSalItrCode_lng As Long, mSalSimRefNo_str As String, mSalPrtCode_lng As Long, mSalPttCode_lng As Long, mSalPurCode_lng As Long, mSalPurICode_lng As Long, mSalNarr_str As String, mSalQty_dbl As Double, mSalRate_dbl As Double, mSalAmount_dbl As Double, mSalAmtBefDisc_dbl As Double, mSalDiscPer_dbl As Double, mSalDiscAmt_dbl As Double, mSalAmtBefTax_dbl As Double, mSalTaxPer_dbl As Double, mSalTaxAmt_dbl As Double, mSalRemark_str As String

Dim mActiveTran As Integer, aMdsTran() As Variant

Public Sub Init()
If blnPurchTran = True Then
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
    
ElseIf blnSaleTran = True Then
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
    
Else
    ErrorBox "clsMdsMultiTranEntry_Init_#73_[Undefined Case]"
End If

End Sub

Public Property Set dbBdkDatabase(ByRef db As ADODB.Connection)
Set m_dbBdkDatabase = db

End Property

Public Property Set dbMdsDatabase(ByRef db As ADODB.Connection)
Set m_dbMdsDatabase = db

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
aMdsTran = Array()
mActiveTran = UBound(aMdsTran)

mClassUIdFileName = "clsMdsMultiTrn.UId"
mClassAcsPermFileName = "clsMdsMultiTrn.Acp"
mClassUIdCode = GetUIdCode("clsMdsMultiTranEntry_Initialize", mUIdFileName:=mClassUIdFileName, mAcsPermFileName:=mClassAcsPermFileName)
If mClassUIdCode = 0 Then
    ErrorBox cSYSBUSY_ACS_DENIED
End If

End Sub

Public Sub GetHdrData(ByVal mTrnCode As Long)
Dim tRecset As New ADODB.Recordset

Me.ClearHdr
With tRecset
.open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbMdsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    mTrnCode_lng = .fields(mTrnHdrCodeField)
    mTrnDate_dt = .fields(mTrnHdrDateField)
    mTrnVtmCode_lng = .fields(mTrnVtmField)
    mTrnPrefix_str = .fields(mTrnPrefixField)
    mTrnVchNo_lng = .fields(mTrnVchNoField)
    mTrnPostfix_str = .fields(mTrnPostfixField)
    mTrnHdrRecState_int = .fields(mTrnHdrRecStateField)
    mTrnCmpCode_int = .fields(mTrnHdrCmpCodeField)
    
    If blnPurchTran = True Then
        mPuhStkCode_lng = .fields("PuhStkCode")
        mPuhTime_lng = .fields("PuhTime")
        mPuhTime_str = MinToTime(.fields("PuhTime"))
        mPuhTrnRefNo_str = .fields("PuhTrnRefNo")
        mPuhTrnRefDt_dt = .fields("PuhTrnRefDt")
        mPuhPrtCode_lng = .fields("PuhPrtCode")
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
        
    ElseIf blnSaleTran = True Then
        mSahStkCode_lng = .fields("SahStkCode")
        mSahTime_lng = .fields("SahTime")
        mSahTime_str = MinToTime(.fields("SahTime"))
        mSahTrnRefNo_str = .fields("SahTrnRefNo")
        mSahTrnRefDt_dt = .fields("SahTrnRefDt")
        mSahPrtCode_lng = .fields("SahPrtCode")
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
        mSahRemark_str = .fields("SahRemark")
        
    Else
        ErrorBox "clsMdsMultiTranEntry_GetHdrData_#133_[Undefined Case]"
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
    .open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " and " & mTrnDtlICodeField & "=" & CStr(mTrnICode) & "", m_dbMdsDatabase, adOpenKeyset, adLockOptimistic
Else
    .open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " and " & mTrnDtlSnoField & "=" & CStr(mTrnSno) & "", m_dbMdsDatabase, adOpenKeyset, adLockOptimistic
    AlertBox "Hello Administrator, Please Check it out !!!"
End If
If .RecordCount > 0 Then
    mTrnCode_lng = .fields(mTrnDtlCodeField)
    mTrnDtlICode_lng = .fields(mTrnDtlICodeField)
    mTrnDtlSno_int = .fields(mTrnDtlSnoField)
    mTrnDate_dt = .fields(mTrnDtlDateField)
    mTrnDtlRecState_int = .fields(mTrnDtlRecStateField)
    mTrnCmpCode_int = .fields(mTrnDtlCmpCodeField)
    
    If blnPurchTran = True Then
        mPurStkCode_lng = .fields("PurStkCode")
        mPurStkICode_lng = .fields("PurStkICode")
        mPurPrtCode_lng = .fields("PurPrtCode")
        mPurPttCode_lng = .fields("PurPttCode")
        mPurSimCode_lng = .fields("PurSimCode")
        mPurItmCode_lng = .fields("PurItmCode")
        mPurItrCode_lng = .fields("PurItrCode")
        mPurSimRefNo_str = .fields("PurSimRefNo")
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
        
    ElseIf blnSaleTran = True Then
        mSalStkCode_lng = .fields("SalStkCode")
        mSalStkICode_lng = .fields("SalStkICode")
        mSalPrtCode_lng = .fields("SalPrtCode")
        mSalPttCode_lng = .fields("SalPttCode")
        mSalSimCode_lng = .fields("SalSimCode")
        mSalItmCode_lng = .fields("SalItmCode")
        mSalItrCode_lng = .fields("SalItrCode")
        mSalSimRefNo_str = .fields("SalSimRefNo")
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
        mSalRemark_str = .fields("SalRemark")
        
    Else
        ErrorBox "clsMdsMultiTranEntry_GetDtlData_#173_[Undefined Case]"
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

If blnPurchTran = True Then
    mPuhStkCode_lng = 0
    mPuhTime_lng = 0
    mPuhTime_str = ""
    mPuhTrnRefNo_str = ""
    mPuhTrnRefDt_dt = cUNKNOWNDATE
    mPuhPrtCode_lng = 0
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
    
ElseIf blnSaleTran = True Then
    mSahStkCode_lng = 0
    mSahTime_lng = 0
    mSahTime_str = ""
    mSahTrnRefNo_str = ""
    mSahTrnRefDt_dt = cUNKNOWNDATE
    mSahPrtCode_lng = 0
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
    mSahRemark_str = ""
    
Else
    ErrorBox "clsMdsMultiTranEntry_ClearHdr_#212_[Undefined Case]"
End If

End Sub

Public Sub ClearDtl()

mTrnCode_lng = 0
mTrnDtlICode_lng = 0
mTrnDtlSno_int = 0
mTrnDate_dt = cUNKNOWNDATE
mTrnDtlRecState_int = 0
mTrnCmpCode_int = 0

If blnPurchTran = True Then
    mPurStkCode_lng = 0
    mPurStkICode_lng = 0
    mPurPrtCode_lng = 0
    mPurPttCode_lng = 0
    mPurSimCode_lng = 0
    mPurItmCode_lng = 0
    mPurItrCode_lng = 0
    mPurSimRefNo_str = ""
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
    
ElseIf blnSaleTran = True Then
    mSalStkCode_lng = 0
    mSalStkICode_lng = 0
    mSalPrtCode_lng = 0
    mSalPttCode_lng = 0
    mSalSimCode_lng = 0
    mSalItmCode_lng = 0
    mSalItrCode_lng = 0
    mSalSimRefNo_str = ""
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
    mSalRemark_str = ""
    
Else
    ErrorBox "clsMdsMultiTranEntry_ClearDtl_#244_[Undefined Case]"
End If

End Sub

Private Sub Class_Terminate()
If UBound(aMdsTran) > LBound(aMdsTran) Then
    ErrorBox mTitleName & " Entry in Process !!!"
End If

End Sub

Public Function BeginTran(ByVal mTrnCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset

BeginTran = False

If mTrnCode = 0 Then
    mTrnCode = GetUIdCode("clsMdsMultiTranEntry_BeginTran", mUIdFileName:=mClassUIdFileName, mAcsPermFileName:=mClassAcsPermFileName) * -1
    If mTrnCode = 0 Then
        ErrorBox "clsMdsMultiTranEntry_BeginTran_#266_[Invalid " & mTitleName & " Code]"
        GoTo EndSub
    End If
ElseIf mTrnCode > 0 Then
    tRecset.open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbMdsDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.RecordCount = 0 Then
        ErrorBox "clsMdsMultiTranEntry_BeginTran_#272_[Entry not Found]"
        GoTo EndSub
    End If
    CloseTable tRecset
Else
    ErrorBox "clsMdsMultiTranEntry_BeginTran_#277_[Invalid " & mTitleName & " Entry Code Request]"
    GoTo EndSub
End If
mActiveTran = UBound(aMdsTran) + 1
ReDim Preserve aMdsTran(mActiveTran)
aMdsTran(mActiveTran) = mTrnCode

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
    ErrorBox "clsMdsMultiTranEntry_EndTran_#294_[InActive Transaction Entry]"
    Exit Function
End If
Call Data_RemoveLog(mTrnCode)

For mCnt = (mActiveTran + 1) To UBound(aMdsTran)
    If (mCnt - 1) >= LBound(aMdsTran) Then
        aMdsTran(mCnt - 1) = aMdsTran(mCnt)
    End If
Next mCnt
If LBound(aMdsTran) = UBound(aMdsTran) Then
    aMdsTran = Array()
Else
    ReDim Preserve aMdsTran(UBound(aMdsTran) - 1)
End If
If mActiveTran > UBound(aMdsTran) Then
    mActiveTran = mActiveTran - 1
End If

EndTran = True
End Function

Public Property Get ActiveTrnCode() As Long
On Error GoTo errhand

ActiveTrnCode = aMdsTran(mActiveTran)

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
m_dbMdsDatabase.BeginTrans
With tRecset
.open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbMdsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Do While .EOF = False
        If InList(.fields(mTrnHdrRecStateField), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
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
m_dbMdsDatabase.CommitTrans
CloseTable tRecset

Rem detail section
m_dbMdsDatabase.BeginTrans
With tRecset
If mTrnCode = mTmpTrnCode Then
    .open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnDtlICodeField & "", m_dbMdsDatabase, adOpenKeyset, adLockOptimistic
Else
    .open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTmpTrnCode) & " order by " & mTrnDtlICodeField & "", m_dbMdsDatabase, adOpenKeyset, adLockOptimistic
End If
If .RecordCount > 0 Then
    mTrnSno = 1
    Do While .EOF = False
        If InList(.fields(mTrnDtlRecStateField), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
            If blnPurchTran = True Then
                If .fields("PurPrtCode") <> mPuhPrtCode_lng Then
                    .fields("PurPrtCode") = mPuhPrtCode_lng
                End If
                If .fields("PurPttCode") <> mPuhPttCode_lng Then
                    .fields("PurPttCode") = mPuhPttCode_lng
                End If
                If .fields("PurStkCode") <> mPuhStkCode_lng Then
                    .fields("PurStkCode") = mPuhStkCode_lng
                End If
            
            ElseIf blnSaleTran = True Then
                If .fields("SalPrtCode") <> mSahPrtCode_lng Then
                    .fields("SalPrtCode") = mSahPrtCode_lng
                End If
                If .fields("SalPttCode") <> mSahPttCode_lng Then
                    .fields("SalPttCode") = mSahPttCode_lng
                End If
                If .fields("SalStkCode") <> mSahStkCode_lng Then
                    .fields("SalStkCode") = mSahStkCode_lng
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
End If
End With
m_dbMdsDatabase.CommitTrans
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

Public Function CancelTran(ByVal mTrnCode As Long) As Boolean
Dim t1Recset As New ADODB.Recordset, t2Recset As New ADODB.Recordset
Dim mRecAdded As Boolean, mRecEdited As Boolean, mRecDeleted As Boolean, mRecCanceled As Boolean

CancelTran = False
If Chk_ActiveTran() = False Or mTrnCode <> ActiveTrnCode Then
    ErrorBox "clsMdsMultiTranEntry_CancelTran_#419_[InActive Transaction Entry]"
    GoTo EndSub
End If
mTrnCode = ActiveTrnCode
On Error GoTo errhand

Rem header section
m_dbMdsDatabase.BeginTrans
With t1Recset
.open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbMdsDatabase, adOpenKeyset, adLockOptimistic
t2Recset.open "Select * from " & mTrnHdrTableName & "_Log where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbMdsDatabase, adOpenKeyset, adLockOptimistic
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
            
            If blnPurchTran = True Then
                .fields("PuhStkCode") = t2Recset.fields("PuhStkCode")
                .fields("PuhTime") = t2Recset.fields("PuhTime")
                .fields("PuhTrnRefNo") = t2Recset.fields("PuhTrnRefNo")
                .fields("PuhTrnRefDt") = t2Recset.fields("PuhTrnRefDt")
                .fields("PuhPrtCode") = t2Recset.fields("PuhPrtCode")
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
                
            ElseIf blnSaleTran = True Then
                .fields("SahStkCode") = t2Recset.fields("SahStkCode")
                .fields("SahTime") = t2Recset.fields("SahTime")
                .fields("SahTrnRefNo") = t2Recset.fields("SahTrnRefNo")
                .fields("SahTrnRefDt") = t2Recset.fields("SahTrnRefDt")
                .fields("SahPrtCode") = t2Recset.fields("SahPrtCode")
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
                .fields("SahRemark") = t2Recset.fields("SahRemark")
                
            Else
                ErrorBox "clsMdsMultiTranEntry_CancelTran_#459_[Undefined Case]"
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
m_dbMdsDatabase.CommitTrans
CloseTable t1Recset
CloseTable t2Recset

Rem detail section
m_dbMdsDatabase.BeginTrans
With t1Recset
Rem important - revert the changes in revert order of updation
.open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnDtlICodeField & " desc", m_dbMdsDatabase, adOpenKeyset, adLockOptimistic
t2Recset.open "Select * from " & mTrnDtlTableName & "_Log where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnDtlICodeField & "", m_dbMdsDatabase, adOpenKeyset, adLockOptimistic
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
            
            If blnPurchTran = True Then
                .fields("PurStkCode") = t2Recset.fields("PurStkCode")
                .fields("PurStkICode") = t2Recset.fields("PurStkICode")
                .fields("PurPrtCode") = t2Recset.fields("PurPrtCode")
                .fields("PurPttCode") = t2Recset.fields("PurPttCode")
                .fields("PurSimCode") = t2Recset.fields("PurSimCode")
                .fields("PurItmCode") = t2Recset.fields("PurItmCode")
                .fields("PurItrCode") = t2Recset.fields("PurItrCode")
                .fields("PurSimRefNo") = t2Recset.fields("PurSimRefNo")
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
                
            ElseIf blnSaleTran = True Then
                .fields("SalStkCode") = t2Recset.fields("SalStkCode")
                .fields("SalStkICode") = t2Recset.fields("SalStkICode")
                .fields("SalPrtCode") = t2Recset.fields("SalPrtCode")
                .fields("SalPttCode") = t2Recset.fields("SalPttCode")
                .fields("SalSimCode") = t2Recset.fields("SalSimCode")
                .fields("SalItmCode") = t2Recset.fields("SalItmCode")
                .fields("SalItrCode") = t2Recset.fields("SalItrCode")
                .fields("SalSimRefNo") = t2Recset.fields("SalSimRefNo")
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
                .fields("SalRemark") = t2Recset.fields("SalRemark")
                
            Else
                ErrorBox "clsMdsMultiTranEntry_CancelTran_#506_[Undefined Case]"
            End If
            .Update
        
        Else
            mRecAdded = False
            mRecCanceled = False
            If .fields(mTrnDtlRecStateField) = cREC_ADDED = True Then
                mRecAdded = True
            ElseIf .fields(mTrnDtlRecStateField) = cREC_CANCELED = True Then
                mRecCanceled = True
            End If
        
            .fields(mTrnDtlRecStateField) = ChkDeleteRecStatus(.fields(mTrnDtlRecStateField))
            .Update
            .Delete
            
        End If
    
        .MoveNext
    Loop
End If
End With
m_dbMdsDatabase.CommitTrans
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
    ErrorBox "clsMdsMultiTranEntry_DeleteTran_#551_[InActive Transaction Entry]"
    GoTo EndSub
End If
On Error GoTo errhand

Rem header section
m_dbMdsDatabase.BeginTrans
With tRecset
.open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbMdsDatabase, adOpenKeyset, adLockOptimistic
Do While .EOF = False
    .fields(mTrnHdrRecStateField) = ChkDeleteRecStatus(.fields(mTrnHdrRecStateField))
    .Update
    '' .Delete deleted in update transaction
    .MoveNext
Loop
End With
m_dbMdsDatabase.CommitTrans
CloseTable tRecset

Rem detail section
m_dbMdsDatabase.BeginTrans
With tRecset
.open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnDtlICodeField & "", m_dbMdsDatabase, adOpenKeyset, adLockOptimistic
Do While .EOF = False
    .fields(mTrnDtlRecStateField) = ChkDeleteRecStatus(.fields(mTrnDtlRecStateField))
    .Update
    '' .Delete deleted in update transaction
    
    .MoveNext
Loop
End With
m_dbMdsDatabase.CommitTrans
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
    ErrorBox "clsMdsMultiTranEntry_SelectTran_#412_[Invalid " & mTitleName & " Entry]"
    Exit Function
End If
mEntryFound = False
For mActiveTran = LBound(aMdsTran) To UBound(aMdsTran)
    If aMdsTran(mActiveTran) = mTrnCode Then
        mEntryFound = True
        Exit For
    End If
Next mActiveTran
If mEntryFound = False Then
    mActiveTran = UBound(aMdsTran) + 1
End If

SelectTran = True
End Function

Public Function NextTran() As Boolean
NextTran = False
If EOTran = True Then
    ErrorBox "clsMdsMultiTranEntry_NextTran_#432_[End of " & mTitleName & " Entry]"
    Exit Function
End If
mActiveTran = mActiveTran + 1

NextTran = True
End Function

Public Function PreviousTran()
PreviousTran = False
If BOTrn = True Then
    ErrorBox "clsMdsMultiTranEntry_PreviousTran_#443_[Begining of " & mTitleName & " Entry]"
    Exit Function
End If
mActiveTran = mActiveTran - 1

PreviousTran = True
End Function

Public Function FirstTran() As Boolean
FirstTran = False
If CountTran = 0 Then
    ErrorBox "clsMdsMultiTranEntry_FirstTran_#454_[No " & mTitleName & " Entry]"
    Exit Function
End If
mActiveTran = LBound(aMdsTran)

FirstTran = True

End Function

Public Function LastTran() As Boolean
LastTran = False
If CountTran = 0 Then
    ErrorBox "clsMdsMultiTranEntry_LastTran_#466_[No " & mTitleName & " Entry]"
    Exit Function
End If
mActiveTran = UBound(aMdsTran)

LastTran = True

End Function

Public Property Get CountTran() As Integer
If UBound(aMdsTran) = -1 Then
    CountTran = 0
Else
    CountTran = UBound(aMdsTran) - LBound(aMdsTran) + 1
End If

End Property

Public Property Get EOTran() As Boolean
EOTran = (mActiveTran > UBound(aMdsTran) Or UBound(aMdsTran) = -1)
End Property

Public Property Get BOTrn() As Boolean
BOTrn = (mActiveTran < LBound(aMdsTran) Or UBound(aMdsTran) = -1)
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
    ErrorBox "clsMdsMultiTranEntry_AddNewHdr_#736_[InActive " & mTitleName & " Entry]"
    GoTo EndSub
End If

On Error GoTo errhand
mTrnCode_lng = 0

m_dbMdsDatabase.BeginTrans
With tRecset
.open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=-0.1", m_dbMdsDatabase, adOpenKeyset, adLockOptimistic

.AddNew

Rem .Fields(mTrnHdrCodeField) = AutoNumber
.fields(mTrnHdrDateField) = mTrnDate_dt
.fields(mTrnVtmField) = mTrnVtmCode_lng
.fields(mTrnPrefixField) = mTrnPrefix_str
.fields(mTrnVchNoField) = mTrnVchNo_lng
.fields(mTrnPostfixField) = mTrnPostfix_str
.fields(mTrnHdrCmpCodeField) = mTrnCmpCode_int
.fields(mTrnHdrRecStateField) = ChkEditRecStatus(.fields(mTrnHdrRecStateField))

If blnPurchTran = True Then
    .fields("PuhStkCode") = mPuhStkCode_lng
    .fields("PuhTime") = mPuhTime_lng
    .fields("PuhTrnRefNo") = mPuhTrnRefNo_str
    .fields("PuhTrnRefDt") = mPuhTrnRefDt_dt
    .fields("PuhPrtCode") = mPuhPrtCode_lng
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
    
ElseIf blnSaleTran = True Then
    .fields("SahStkCode") = mSahStkCode_lng
    .fields("SahTime") = mSahTime_lng
    .fields("SahTrnRefNo") = mSahTrnRefNo_str
    .fields("SahTrnRefDt") = mSahTrnRefDt_dt
    .fields("SahPrtCode") = mSahPrtCode_lng
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
    .fields("SahRemark") = mSahRemark_str
    
Else
    ErrorBox "clsMdsMultiTranEntry_AddNewHdr_#776_[Undefined Case]"
End If
.Update

mTrnCode_lng = .fields(mTrnHdrCodeField)
End With
m_dbMdsDatabase.CommitTrans
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
    ErrorBox "clsMdsMultiTranEntry_AddNewDtl_#810_[InActive " & mTitleName & " Entry]"
    GoTo EndSub
End If

On Error GoTo errhand
mTrnDtlICode_lng = 0

m_dbMdsDatabase.BeginTrans
With tRecset
.open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=-0.1", m_dbMdsDatabase, adOpenKeyset, adLockOptimistic

.AddNew

Rem mTrnDtlICode_lng = AutoNumber
.fields(mTrnDtlCodeField) = mTrnCode
.fields(mTrnDtlSnoField) = mTrnDtlSno_int
.fields(mTrnDtlDateField) = mTrnDate_dt
.fields(mTrnDtlCmpCodeField) = mTrnCmpCode_int
.fields(mTrnDtlRecStateField) = ChkEditRecStatus(.fields(mTrnDtlRecStateField))

If blnPurchTran = True Then
    .fields("PurStkCode") = mPurStkCode_lng
    .fields("PurStkICode") = mPurStkICode_lng
    .fields("PurPrtCode") = mPurPrtCode_lng
    .fields("PurPttCode") = mPurPttCode_lng
    .fields("PurSimCode") = mPurSimCode_lng
    .fields("PurItmCode") = mPurItmCode_lng
    .fields("PurItrCode") = mPurItrCode_lng
    .fields("PurSimRefNo") = mPurSimRefNo_str
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
    
ElseIf blnSaleTran = True Then
    .fields("SalStkCode") = mSalStkCode_lng
    .fields("SalStkICode") = mSalStkICode_lng
    .fields("SalPrtCode") = mSalPrtCode_lng
    .fields("SalPttCode") = mSalPttCode_lng
    .fields("SalSimCode") = mSalSimCode_lng
    .fields("SalItmCode") = mSalItmCode_lng
    .fields("SalItrCode") = mSalItrCode_lng
    .fields("SalSimRefNo") = mSalSimRefNo_str
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
    .fields("SalRemark") = mSalRemark_str
    
Else
    ErrorBox "clsMdsMultiTranEntry_AddNewDtl_#844_[Undefined Case]"
End If
.Update

mTrnDtlICode_lng = .fields(mTrnDtlICodeField)
End With
m_dbMdsDatabase.CommitTrans
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
    ErrorBox "clsMdsMultiTranEntry_UpdateDtl_#874_[InActive " & mTitleName & " Entry]"
    GoTo EndSub
End If

On Error GoTo errhand

m_dbMdsDatabase.BeginTrans
With tRecset
.open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbMdsDatabase, adOpenKeyset, adLockOptimistic

Rem .Fields(mTrnHdrCodeField) = AutoNumber
.fields(mTrnHdrDateField) = mTrnDate_dt
.fields(mTrnVtmField) = mTrnVtmCode_lng
.fields(mTrnPrefixField) = mTrnPrefix_str
.fields(mTrnVchNoField) = mTrnVchNo_lng
.fields(mTrnPostfixField) = mTrnPostfix_str
.fields(mTrnHdrCmpCodeField) = mTrnCmpCode_int
.fields(mTrnHdrRecStateField) = ChkEditRecStatus(.fields(mTrnHdrRecStateField))

If blnPurchTran = True Then
    .fields("PuhStkCode") = mPuhStkCode_lng
    .fields("PuhTime") = mPuhTime_lng
    .fields("PuhTrnRefNo") = mPuhTrnRefNo_str
    .fields("PuhTrnRefDt") = mPuhTrnRefDt_dt
    .fields("PuhPrtCode") = mPuhPrtCode_lng
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
    
ElseIf blnSaleTran = True Then
    .fields("SahStkCode") = mSahStkCode_lng
    .fields("SahTime") = mSahTime_lng
    .fields("SahTrnRefNo") = mSahTrnRefNo_str
    .fields("SahTrnRefDt") = mSahTrnRefDt_dt
    .fields("SahPrtCode") = mSahPrtCode_lng
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
    .fields("SahRemark") = mSahRemark_str
    
Else
    ErrorBox "clsMdsMultiTranEntry_UpdateHdr_#911_[Undefined Case]"
End If
.Update
End With
m_dbMdsDatabase.CommitTrans
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

UpdateDtl = False
If Chk_ActiveTran() = False Or mTrnCode <> ActiveTrnCode Then
    ErrorBox "clsMdsMultiTranEntry_UpdateDtl_#936_[InActive " & mTitleName & " Entry]"
    GoTo EndSub
End If

On Error GoTo errhand

m_dbMdsDatabase.BeginTrans
With tRecset
.open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " and " & mTrnDtlICodeField & "=" & CStr(mTrnICode) & "", m_dbMdsDatabase, adOpenKeyset, adLockOptimistic

Rem mTrnDtlICode_lng = AutoNumber
.fields(mTrnDtlCodeField) = mTrnCode_lng
.fields(mTrnDtlSnoField) = mTrnDtlSno_int
.fields(mTrnDtlDateField) = mTrnDate_dt
.fields(mTrnDtlCmpCodeField) = mTrnCmpCode_int
.fields(mTrnDtlRecStateField) = ChkEditRecStatus(.fields(mTrnDtlRecStateField))

If blnPurchTran = True Then
    .fields("PurStkCode") = mPurStkCode_lng
    .fields("PurStkICode") = mPurStkICode_lng
    .fields("PurPrtCode") = mPurPrtCode_lng
    .fields("PurPttCode") = mPurPttCode_lng
    .fields("PurSimCode") = mPurSimCode_lng
    .fields("PurItmCode") = mPurItmCode_lng
    .fields("PurItrCode") = mPurItrCode_lng
    .fields("PurSimRefNo") = mPurSimRefNo_str
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
    
ElseIf blnSaleTran = True Then
    .fields("SalStkCode") = mSalStkCode_lng
    .fields("SalStkICode") = mSalStkICode_lng
    .fields("SalPrtCode") = mSalPrtCode_lng
    .fields("SalPttCode") = mSalPttCode_lng
    .fields("SalSimCode") = mSalSimCode_lng
    .fields("SalItmCode") = mSalItmCode_lng
    .fields("SalItrCode") = mSalItrCode_lng
    .fields("SalSimRefNo") = mSalSimRefNo_str
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
    .fields("SalRemark") = mSalRemark_str
    
Else
    ErrorBox "clsMdsMultiTranEntry_UpdateDtl_#966_[Undefined Case]"
End If
.Update

End With
m_dbMdsDatabase.CommitTrans
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
    ErrorBox "clsMdsMultiTranEntry_DeleteDtl_#995_[InActive " & mTitleName & " Entry]"
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
    
    m_dbMdsDatabase.BeginTrans
    With tRecset
    .open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " and " & mTrnDtlICodeField & "=" & CStr(mTrnICode) & "", m_dbMdsDatabase, adOpenKeyset, adLockOptimistic
    
    .fields(mTrnDtlRecStateField) = ChkDeleteRecStatus(.fields(mTrnDtlRecStateField))
    .Update
    End With
    m_dbMdsDatabase.CommitTrans
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

Private Function Data_CreateLog(ByVal mTrnCode As Long) As Boolean
Dim t1Recset As New ADODB.Recordset, t2Recset As New ADODB.Recordset

Data_CreateLog = False
If Chk_ActiveTran() = False Or mTrnCode <> ActiveTrnCode Then
    ErrorBox "clsMdsMultiTranEntry_Data_CreateLog_#406_[InActive " & mTitleName & " Entry]"
    GoTo EndSub
End If

t1Recset.open "Select * from " & mTrnDtlTableName & "_Log where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnDtlICodeField & "", m_dbMdsDatabase, adOpenKeyset, adLockOptimistic
t2Recset.open "Select * from " & mTrnHdrTableName & "_Log where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbMdsDatabase, adOpenKeyset, adLockOptimistic
If t1Recset.RecordCount = 0 And t2Recset.RecordCount = 0 Then
    m_dbMdsDatabase.BeginTrans
    m_dbMdsDatabase.Execute "Insert into " & mTrnDtlTableName & "_Log Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " and " & mTrnDtlRecStateField & "=" & CStr(cREC_UNCHANGED) & ""
    m_dbMdsDatabase.Execute "Insert into " & mTrnHdrTableName & "_Log Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & " and " & mTrnHdrRecStateField & "=" & CStr(cREC_UNCHANGED) & ""
    m_dbMdsDatabase.CommitTrans
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
    ErrorBox "clsMdsMultiTranEntry_Data_RemoveLog_#1041_[InActive " & mTitleName & " Entry]"
    Exit Function
End If

m_dbMdsDatabase.BeginTrans
m_dbMdsDatabase.Execute "Delete from " & mTrnDtlTableName & "_Log where " & mTrnDtlCodeField & "=" & CStr(mTrnCode)
m_dbMdsDatabase.Execute "Delete from " & mTrnHdrTableName & "_Log where " & mTrnHdrCodeField & "=" & CStr(mTrnCode)
m_dbMdsDatabase.CommitTrans

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
If blnPurchTran = True Then
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
    
ElseIf blnSaleTran = True Then
    
End If


EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Function


End Function

