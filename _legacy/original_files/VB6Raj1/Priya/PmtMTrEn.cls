VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsPmtMultiTranEntry"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Dim m_dbPmtDatabase As ADODB.Connection, m_dbAcDatabase As ADODB.Connection, m_dbStDatabase As ADODB.Connection, m_dbGrpDatabase As ADODB.Connection, m_dbComDatabase As ADODB.Connection
Dim mClassUIdCode As Long, mClassUIdFileName As String, mClassAcsPermFileName As String
Dim mTrnHdrTableName As String, mTrnDtlTableName As String, mTrnHdrCodeField As String, mTrnDtlCodeField As String, mTrnHdrDateField As String, mTrnDtlDateField As String, mTrnVtmField As String, mTrnPrefixField As String, mTrnVchNoField As String, mTrnPostfixField As String, mTrnDtlICodeField As String, mTrnDtlSnoField As String, mTrnHdrRecStateField As String, mTrnDtlRecStateField As String, mTrnHdrCmpCodeField As String, mTrnDtlCmpCodeField As String, mTitleName As String
Public blnJobRcptTran As Boolean, blnJobIssueTran As Boolean, blnOutdPymtTran As Boolean, blnOutdRefdTran As Boolean
Rem common class variables used in both header and detail
Public mTrnCode_lng As Long, mTrnVtmCode_lng As Long, mTrnPrefix_str As String, mTrnVchNo_lng As Long, mTrnPostfix_str As String, mTrnDate_dt As Date, mTrnCmpCode_int As Integer
Rem common class header variables
Public mTrnHdrRecState_int As Integer
Rem common class detail variables
Public mTrnDtlICode_lng As Long, mTrnDtlSno_int As Integer, mTrnDtlRecState_int As Integer
Rem job receipt header variables
Public mJrhStkCode_lng As Long, mJrhTime_lng As Long, mJrhTime_str As String, mJrhTrnRefNo_str As String, mJrhTrnRefDt_dt As Date, mJrhPrtCode_lng As Long, mJrhQty_dbl As Double, mJrhAmount_dbl As Double, mJrhRemark_str As String
Rem job receipt detail variables
Public mJrcStkCode_lng As Long, mJrcStkICode_lng As Long, mJrcSimCode_lng As Long, mJrcItmCode_lng As Long, mJrcItrCode_lng As Long, mJrcSimRefNo_str As String, mJrcPrtCode_lng As Long, mJrcNarr_str As String, mJrcQty_dbl As Double, mJrcRate_dbl As Double, mJrcAmount_dbl As Double, mJrcRemark_str As String
Rem job issue header variables
Public mJihStkCode_lng As Long, mJihTime_lng As Long, mJihTime_str As String, mJihTrnRefNo_str As String, mJihTrnRefDt_dt As Date, mJihPrtCode_lng As Long, mJihQty_dbl As Double, mJihAmount_dbl As Double, mJihRemark_str As String
Rem job issue detail variables
Public mJisStkCode_lng As Long, mJisStkICode_lng As Long, mJisSimCode_lng As Long, mJisItmCode_lng As Long, mJisItrCode_lng As Long, mJisSimRefNo_str As String, mJisPrtCode_lng As Long, mJisJrcCode_lng As Long, mJisJrcICode_lng As Long, mJisNarr_str As String, mJisQty_dbl As Double, mJisRate_dbl As Double, mJisAmount_dbl As Double, mJisRemark_str As String

Rem outdoor payment receipt header variables
Public mOphOpgCode_lng As Long, mOphTime_lng As Long, mOphOldOphCode_lng As Long, mOphPttCode_lng As Long, mOphDepoAmt_dbl As Double, mOphRemark_str As String
Rem outdoor payment receipt detail variables
Public mOpyPttCode_lng As Long, mOpyOhrCode_lng As Long, mOpyDepoAmt_dbl As Double, mOpyRemark_str As String
Rem outdoor refund receipt header variables
Public mOfhOpgCode_lng As Long, mOfhTime_lng As Long, mOfhOldOfhCode_lng As Long, mOfhPttCode_lng As Long, mOfhRefuAmt_dbl As Double, mOfhRemark_str As String
Rem outdoor refund receipt detail variables
Public mOfdPttCode_lng As Long, mOfdOhrCode_lng As Long, mOfdRefuAmt_dbl As Double, mOfdRemark_str As String

Dim mActiveTran As Integer, aPmtTran() As Variant

Public Sub Init()
If blnJobRcptTran = True Then
    mTrnHdrTableName = "JobRcHdr": mTrnDtlTableName = "JobRcpt"
    mTrnHdrCodeField = "JrhCode": mTrnDtlCodeField = "JrcCode"
    mTrnHdrDateField = "JrhDate": mTrnDtlDateField = "JrcDate"
    mTrnHdrRecStateField = "JrhRecState": mTrnDtlRecStateField = "JrcRecState"
    mTrnHdrCmpCodeField = "JrhCmpCode": mTrnDtlCmpCodeField = "JrcCmpCode"
    mTrnVtmField = "JrhVtmCode"
    mTrnPrefixField = "JrhPrefix"
    mTrnVchNoField = "JrhVchNo"
    mTrnPostfixField = "JrhPostfix"
    mTrnDtlICodeField = "JrcICode"
    mTrnDtlSnoField = "JrcSno"
    mTitleName = "Job Receipt"
    
ElseIf blnJobIssueTran = True Then
    mTrnHdrTableName = "JobIsHdr": mTrnDtlTableName = "JobIssu"
    mTrnHdrCodeField = "JihCode": mTrnDtlCodeField = "JisCode"
    mTrnHdrDateField = "JihDate": mTrnDtlDateField = "JisDate"
    mTrnHdrRecStateField = "JihRecState": mTrnDtlRecStateField = "JisRecState"
    mTrnHdrCmpCodeField = "JihCmpCode": mTrnDtlCmpCodeField = "JisCmpCode"
    mTrnVtmField = "JihVtmCode"
    mTrnPrefixField = "JihPrefix"
    mTrnVchNoField = "JihVchNo"
    mTrnPostfixField = "JihPostfix"
    mTrnDtlICodeField = "JisICode"
    mTrnDtlSnoField = "JisSno"
    mTitleName = "Job Issue"
    
'ElseIf blnOutdPymtTran = True Then
'    mTrnHdrTableName = "OutdPymtHdr": mTrnDtlTableName = "OutdPymtDtl"
'    mTrnHdrCodeField = "OphCode": mTrnDtlCodeField = "OpyCode"
'    mTrnHdrDateField = "OphDate": mTrnDtlDateField = "OpyDate"
'    mTrnHdrRecStateField = "OphRecState": mTrnDtlRecStateField = "OpyRecState"
'    mTrnHdrCmpCodeField = "OphCmpCode": mTrnDtlCmpCodeField = "OpyCmpCode"
'    mTrnVtmField = "OphVtmCode"
'    mTrnPrefixField = "OphPrefix"
'    mTrnVchNoField = "OphVchNo"
'    mTrnPostfixField = "OphPostfix"
'    mTrnDtlICodeField = "OpyICode"
'    mTrnDtlSnoField = "OpySno"
'    mTitleName = "Outdoor Due Payment"
'
'ElseIf blnOutdRefdTran = True Then
'    mTrnHdrTableName = "OutdRefdHdr": mTrnDtlTableName = "OutdRefdDtl"
'    mTrnHdrCodeField = "OfhCode": mTrnDtlCodeField = "OfdCode"
'    mTrnHdrDateField = "OfhDate": mTrnDtlDateField = "OfdDate"
'    mTrnHdrRecStateField = "OfhRecState": mTrnDtlRecStateField = "OfdRecState"
'    mTrnHdrCmpCodeField = "OfhCmpCode": mTrnDtlCmpCodeField = "OfdCmpCode"
'    mTrnVtmField = "OfhVtmCode"
'    mTrnPrefixField = "OfhPrefix"
'    mTrnVchNoField = "OfhVchNo"
'    mTrnPostfixField = "OfhPostfix"
'    mTrnDtlICodeField = "OfdICode"
'    mTrnDtlSnoField = "OfdSno"
'    mTitleName = "Outdoor Refund"
'
Else
    ErrorBox "clsPmtMultiTranEntry_Init_#73_[Undefined Case]"
End If

End Sub

Public Property Set dbPmtDatabase(ByRef db As ADODB.Connection)
Set m_dbPmtDatabase = db

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
aPmtTran = Array()
mActiveTran = UBound(aPmtTran)

mClassUIdFileName = "clsPmtMultiTrn.UId"
mClassAcsPermFileName = "clsPmtMultiTrn.Acp"
mClassUIdCode = GetUIdCode("clsPmtMultiTranEntry_Initialize", mUIdFileName:=mClassUIdFileName, mAcsPermFileName:=mClassAcsPermFileName)
If mClassUIdCode = 0 Then
    ErrorBox cSYSBUSY_ACS_DENIED
End If

End Sub

Public Sub GetHdrData(ByVal mTrnCode As Long)
Dim tRecset As New ADODB.Recordset

Me.ClearHdr
With tRecset
.Open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbPmtDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    mTrnCode_lng = .fields(mTrnHdrCodeField)
    mTrnDate_dt = .fields(mTrnHdrDateField)
    mTrnVtmCode_lng = .fields(mTrnVtmField)
    mTrnPrefix_str = .fields(mTrnPrefixField)
    mTrnVchNo_lng = .fields(mTrnVchNoField)
    mTrnPostfix_str = .fields(mTrnPostfixField)
    mTrnHdrRecState_int = .fields(mTrnHdrRecStateField)
    mTrnCmpCode_int = .fields(mTrnHdrCmpCodeField)
    
    If blnJobRcptTran = True Then
        mJrhStkCode_lng = .fields("JrhStkCode")
        mJrhTime_lng = .fields("JrhTime")
        mJrhTime_str = MinToTime(.fields("JrhTime"))
        mJrhTrnRefNo_str = .fields("JrhTrnRefNo")
        mJrhTrnRefDt_dt = .fields("JrhTrnRefDt")
        mJrhPrtCode_lng = .fields("JrhPrtCode")
        mJrhQty_dbl = .fields("JrhQty")
        mJrhAmount_dbl = .fields("JrhAmount")
        mJrhRemark_str = .fields("JrhRemark")
        
    ElseIf blnJobIssueTran = True Then
        mJihStkCode_lng = .fields("JihStkCode")
        mJihTime_lng = .fields("JihTime")
        mJihTime_str = MinToTime(.fields("JihTime"))
        mJihTrnRefNo_str = .fields("JihTrnRefNo")
        mJihTrnRefDt_dt = .fields("JihTrnRefDt")
        mJihPrtCode_lng = .fields("JihPrtCode")
        mJihQty_dbl = .fields("JihQty")
        mJihAmount_dbl = .fields("JihAmount")
        mJihRemark_str = .fields("JihRemark")
        
    ElseIf blnOutdPymtTran = True Then
        mOphOpgCode_lng = .fields("OphOpgCode")
        mOphTime_lng = .fields("OphTime")
        mOphOldOphCode_lng = .fields("OphOldOphCode")
        mOphPttCode_lng = .fields("OphPttCode")
        mOphDepoAmt_dbl = .fields("OphDepoAmt")
        mOphRemark_str = .fields("OphRemark")
        
    ElseIf blnOutdRefdTran = True Then
        mOfhOpgCode_lng = .fields("OfhOpgCode")
        mOfhTime_lng = .fields("OfhTime")
        mOfhOldOfhCode_lng = .fields("OfhOldOfhCode")
        mOfhPttCode_lng = .fields("OfhPttCode")
        mOfhRefuAmt_dbl = .fields("OfhRefuAmt")
        mOfhRemark_str = .fields("OfhRemark")
        
    Else
        ErrorBox "clsPmtMultiTranEntry_GetHdrData_#133_[Undefined Case]"
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
    .Open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " and " & mTrnDtlICodeField & "=" & CStr(mTrnICode) & "", m_dbPmtDatabase, adOpenKeyset, adLockOptimistic
Else
    .Open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " and " & mTrnDtlSnoField & "=" & CStr(mTrnSno) & "", m_dbPmtDatabase, adOpenKeyset, adLockOptimistic
    AlertBox "Hello Administrator, Please Check it out !!!"
End If
If .RecordCount > 0 Then
    mTrnCode_lng = .fields(mTrnDtlCodeField)
    mTrnDtlICode_lng = .fields(mTrnDtlICodeField)
    mTrnDtlSno_int = .fields(mTrnDtlSnoField)
    mTrnDate_dt = .fields(mTrnDtlDateField)
    mTrnDtlRecState_int = .fields(mTrnDtlRecStateField)
    mTrnCmpCode_int = .fields(mTrnDtlCmpCodeField)
    
    If blnJobRcptTran = True Then
        mJrcStkCode_lng = .fields("JrcStkCode")
        mJrcStkICode_lng = .fields("JrcStkICode")
        mJrcPrtCode_lng = .fields("JrcPrtCode")
        mJrcSimCode_lng = .fields("JrcSimCode")
        mJrcItmCode_lng = .fields("JrcItmCode")
        mJrcItrCode_lng = .fields("JrcItrCode")
        mJrcSimRefNo_str = .fields("JrcSimRefNo")
        mJrcNarr_str = .fields("JrcNarr")
        mJrcQty_dbl = .fields("JrcQty")
        mJrcRate_dbl = .fields("JrcRate")
        mJrcAmount_dbl = .fields("JrcAmount")
        mJrcRemark_str = .fields("JrcRemark")
        
    ElseIf blnJobIssueTran = True Then
        mJisStkCode_lng = .fields("JisStkCode")
        mJisStkICode_lng = .fields("JisStkICode")
        mJisPrtCode_lng = .fields("JisPrtCode")
        mJisSimCode_lng = .fields("JisSimCode")
        mJisItmCode_lng = .fields("JisItmCode")
        mJisItrCode_lng = .fields("JisItrCode")
        mJisSimRefNo_str = .fields("JisSimRefNo")
        mJisJrcCode_lng = .fields("JisJrcCode")
        mJisJrcICode_lng = .fields("JisJrcICode")
        mJisNarr_str = .fields("JisNarr")
        mJisQty_dbl = .fields("JisQty")
        mJisRate_dbl = .fields("JisRate")
        mJisAmount_dbl = .fields("JisAmount")
        mJisRemark_str = .fields("JisRemark")
        
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
        ErrorBox "clsPmtMultiTranEntry_GetDtlData_#173_[Undefined Case]"
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

If blnJobRcptTran = True Then
    mJrhStkCode_lng = 0
    mJrhTime_lng = 0
    mJrhTime_str = ""
    mJrhTrnRefNo_str = ""
    mJrhTrnRefDt_dt = cUNKNOWNDATE
    mJrhPrtCode_lng = 0
    mJrhQty_dbl = 0
    mJrhAmount_dbl = 0
    mJrhRemark_str = ""
    
ElseIf blnJobIssueTran = True Then
    mJihStkCode_lng = 0
    mJihTime_lng = 0
    mJihTime_str = ""
    mJihTrnRefNo_str = ""
    mJihTrnRefDt_dt = cUNKNOWNDATE
    mJihPrtCode_lng = 0
    mJihQty_dbl = 0
    mJihAmount_dbl = 0
    mJihRemark_str = ""
    
ElseIf blnOutdPymtTran = True Then
    mOphOpgCode_lng = 0
    mOphTime_lng = 0
    mOphOldOphCode_lng = 0
    mOphPttCode_lng = 0
    mOphDepoAmt_dbl = 0
    mOphRemark_str = ""
    
ElseIf blnOutdRefdTran = True Then
    mOfhOpgCode_lng = 0
    mOfhTime_lng = 0
    mOfhOldOfhCode_lng = 0
    mOfhPttCode_lng = 0
    mOfhRefuAmt_dbl = 0
    mOfhRemark_str = ""
    
Else
    ErrorBox "clsPmtMultiTranEntry_ClearHdr_#212_[Undefined Case]"
End If

End Sub

Public Sub ClearDtl()

mTrnCode_lng = 0
mTrnDtlICode_lng = 0
mTrnDtlSno_int = 0
mTrnDate_dt = cUNKNOWNDATE
mTrnDtlRecState_int = 0
mTrnCmpCode_int = 0

If blnJobRcptTran = True Then
    mJrcStkCode_lng = 0
    mJrcStkICode_lng = 0
    mJrcPrtCode_lng = 0
    mJrcSimCode_lng = 0
    mJrcItmCode_lng = 0
    mJrcItrCode_lng = 0
    mJrcSimRefNo_str = ""
    mJrcNarr_str = ""
    mJrcQty_dbl = 0
    mJrcRate_dbl = 0
    mJrcAmount_dbl = 0
    mJrcRemark_str = ""
    
ElseIf blnJobIssueTran = True Then
    mJisStkCode_lng = 0
    mJisStkICode_lng = 0
    mJisPrtCode_lng = 0
    mJisSimCode_lng = 0
    mJisItmCode_lng = 0
    mJisItrCode_lng = 0
    mJisSimRefNo_str = ""
    mJisJrcCode_lng = 0
    mJisJrcICode_lng = 0
    mJisNarr_str = ""
    mJisQty_dbl = 0
    mJisRate_dbl = 0
    mJisAmount_dbl = 0
    mJisRemark_str = ""
    
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
    ErrorBox "clsPmtMultiTranEntry_ClearDtl_#244_[Undefined Case]"
End If

End Sub

Private Sub Class_Terminate()
If UBound(aPmtTran) > LBound(aPmtTran) Then
    ErrorBox mTitleName & " Entry in Process !!!"
End If

End Sub

Public Function BeginTran(ByVal mTrnCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset

BeginTran = False

If mTrnCode = 0 Then
    mTrnCode = GetUIdCode("clsPmtMultiTranEntry_BeginTran", mUIdFileName:=mClassUIdFileName, mAcsPermFileName:=mClassAcsPermFileName) * -1
    If mTrnCode = 0 Then
        ErrorBox "clsPmtMultiTranEntry_BeginTran_#266_[Invalid " & mTitleName & " Code]"
        GoTo EndSub
    End If
ElseIf mTrnCode > 0 Then
    tRecset.Open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbPmtDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.RecordCount = 0 Then
        ErrorBox "clsPmtMultiTranEntry_BeginTran_#272_[Entry not Found]"
        GoTo EndSub
    End If
    CloseTable tRecset
Else
    ErrorBox "clsPmtMultiTranEntry_BeginTran_#277_[Invalid " & mTitleName & " Entry Code Request]"
    GoTo EndSub
End If
mActiveTran = UBound(aPmtTran) + 1
ReDim Preserve aPmtTran(mActiveTran)
aPmtTran(mActiveTran) = mTrnCode

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
    ErrorBox "clsPmtMultiTranEntry_EndTran_#294_[InActive Transaction Entry]"
    Exit Function
End If
Call Data_RemoveLog(mTrnCode)

For mCnt = (mActiveTran + 1) To UBound(aPmtTran)
    If (mCnt - 1) >= LBound(aPmtTran) Then
        aPmtTran(mCnt - 1) = aPmtTran(mCnt)
    End If
Next mCnt
If LBound(aPmtTran) = UBound(aPmtTran) Then
    aPmtTran = Array()
Else
    ReDim Preserve aPmtTran(UBound(aPmtTran) - 1)
End If
If mActiveTran > UBound(aPmtTran) Then
    mActiveTran = mActiveTran - 1
End If

EndTran = True
End Function

Public Property Get ActiveTrnCode() As Long
On Error GoTo errhand

ActiveTrnCode = aPmtTran(mActiveTran)

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
m_dbPmtDatabase.BeginTrans
With tRecset
.Open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbPmtDatabase, adOpenKeyset, adLockOptimistic
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
m_dbPmtDatabase.CommitTrans
CloseTable tRecset

Rem detail section
m_dbPmtDatabase.BeginTrans
With tRecset
If mTrnCode = mTmpTrnCode Then
    .Open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnDtlICodeField & "", m_dbPmtDatabase, adOpenKeyset, adLockOptimistic
Else
    .Open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTmpTrnCode) & " order by " & mTrnDtlICodeField & "", m_dbPmtDatabase, adOpenKeyset, adLockOptimistic
End If
If .RecordCount > 0 Then
    mTrnSno = 1
    Do While .EOF = False
        If InList(.fields(mTrnDtlRecStateField), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
            If blnJobRcptTran = True Then
                If .fields("JrcPrtCode") <> mJrhPrtCode_lng Then
                    .fields("JrcPrtCode") = mJrhPrtCode_lng
                End If
                If .fields("JrcStkCode") <> mJrhStkCode_lng Then
                    .fields("JrcStkCode") = mJrhStkCode_lng
                End If
            
            ElseIf blnJobIssueTran = True Then
                If .fields("JisPrtCode") <> mJihPrtCode_lng Then
                    .fields("JisPrtCode") = mJihPrtCode_lng
                End If
                If .fields("JisStkCode") <> mJihStkCode_lng Then
                    .fields("JisStkCode") = mJihStkCode_lng
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
m_dbPmtDatabase.CommitTrans
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
Dim mOpyOhrCode As Long, mOpyDepoAmt As Double
Dim mOfdOhrCode As Long, mOfdRefuAmt As Double
Dim mRecAdded As Boolean, mRecEdited As Boolean, mRecDeleted As Boolean, mRecCanceled As Boolean

CancelTran = False
If Chk_ActiveTran() = False Or mTrnCode <> ActiveTrnCode Then
    ErrorBox "clsPmtMultiTranEntry_CancelTran_#419_[InActive Transaction Entry]"
    GoTo EndSub
End If
mTrnCode = ActiveTrnCode
On Error GoTo errhand

Rem header section
m_dbPmtDatabase.BeginTrans
With t1Recset
.Open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbPmtDatabase, adOpenKeyset, adLockOptimistic
t2Recset.Open "Select * from " & mTrnHdrTableName & "_Log where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbPmtDatabase, adOpenKeyset, adLockOptimistic
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
            
            If blnJobRcptTran = True Then
                .fields("JrhStkCode") = t2Recset.fields("JrhStkCode")
                .fields("JrhTime") = t2Recset.fields("JrhTime")
                .fields("JrhTrnRefNo") = t2Recset.fields("JrhTrnRefNo")
                .fields("JrhTrnRefDt") = t2Recset.fields("JrhTrnRefDt")
                .fields("JrhPrtCode") = t2Recset.fields("JrhPrtCode")
                .fields("JrhQty") = t2Recset.fields("JrhQty")
                .fields("JrhAmount") = t2Recset.fields("JrhAmount")
                .fields("JrhRemark") = t2Recset.fields("JrhRemark")
                
            ElseIf blnJobIssueTran = True Then
                .fields("JihStkCode") = t2Recset.fields("JihStkCode")
                .fields("JihTime") = t2Recset.fields("JihTime")
                .fields("JihTrnRefNo") = t2Recset.fields("JihTrnRefNo")
                .fields("JihTrnRefDt") = t2Recset.fields("JihTrnRefDt")
                .fields("JihPrtCode") = t2Recset.fields("JihPrtCode")
                .fields("JihQty") = t2Recset.fields("JihQty")
                .fields("JihAmount") = t2Recset.fields("JihAmount")
                .fields("JihRemark") = t2Recset.fields("JihRemark")
                
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
                ErrorBox "clsPmtMultiTranEntry_CancelTran_#459_[Undefined Case]"
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
m_dbPmtDatabase.CommitTrans
CloseTable t1Recset
CloseTable t2Recset

Rem detail section
m_dbPmtDatabase.BeginTrans
With t1Recset
Rem important - revert the changes in revert order of updation
.Open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnDtlICodeField & " desc", m_dbPmtDatabase, adOpenKeyset, adLockOptimistic
t2Recset.Open "Select * from " & mTrnDtlTableName & "_Log where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnDtlICodeField & "", m_dbPmtDatabase, adOpenKeyset, adLockOptimistic
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
            
            If blnJobRcptTran = True Then
                .fields("JrcStkCode") = t2Recset.fields("JrcStkCode")
                .fields("JrcStkICode") = t2Recset.fields("JrcStkICode")
                .fields("JrcPrtCode") = t2Recset.fields("JrcPrtCode")
                .fields("JrcSimCode") = t2Recset.fields("JrcSimCode")
                .fields("JrcItmCode") = t2Recset.fields("JrcItmCode")
                .fields("JrcItrCode") = t2Recset.fields("JrcItrCode")
                .fields("JrcSimRefNo") = t2Recset.fields("JrcSimRefNo")
                .fields("JrcNarr") = t2Recset.fields("JrcNarr")
                .fields("JrcQty") = t2Recset.fields("JrcQty")
                .fields("JrcRate") = t2Recset.fields("JrcRate")
                .fields("JrcAmount") = t2Recset.fields("JrcAmount")
                .fields("JrcRemark") = t2Recset.fields("JrcRemark")
                
            ElseIf blnJobIssueTran = True Then
                .fields("JisStkCode") = t2Recset.fields("JisStkCode")
                .fields("JisStkICode") = t2Recset.fields("JisStkICode")
                .fields("JisPrtCode") = t2Recset.fields("JisPrtCode")
                .fields("JisSimCode") = t2Recset.fields("JisSimCode")
                .fields("JisItmCode") = t2Recset.fields("JisItmCode")
                .fields("JisItrCode") = t2Recset.fields("JisItrCode")
                .fields("JisSimRefNo") = t2Recset.fields("JisSimRefNo")
                .fields("JisJrcCode") = t2Recset.fields("JisJrcCode")
                .fields("JisJrcICode") = t2Recset.fields("JisJrcICode")
                .fields("JisNarr") = t2Recset.fields("JisNarr")
                .fields("JisQty") = t2Recset.fields("JisQty")
                .fields("JisRate") = t2Recset.fields("JisRate")
                .fields("JisAmount") = t2Recset.fields("JisAmount")
                .fields("JisRemark") = t2Recset.fields("JisRemark")
                
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
                ErrorBox "clsPmtMultiTranEntry_CancelTran_#506_[Undefined Case]"
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
m_dbPmtDatabase.CommitTrans
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
    ErrorBox "clsPmtMultiTranEntry_DeleteTran_#551_[InActive Transaction Entry]"
    GoTo EndSub
End If
On Error GoTo errhand

Rem header section
m_dbPmtDatabase.BeginTrans
With tRecset
.Open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbPmtDatabase, adOpenKeyset, adLockOptimistic
Do While .EOF = False
    .fields(mTrnHdrRecStateField) = ChkDeleteRecStatus(.fields(mTrnHdrRecStateField))
    .Update
    '' .Delete deleted in update transaction
    .MoveNext
Loop
End With
m_dbPmtDatabase.CommitTrans
CloseTable tRecset

Rem detail section
m_dbPmtDatabase.BeginTrans
With tRecset
.Open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnDtlICodeField & "", m_dbPmtDatabase, adOpenKeyset, adLockOptimistic
Do While .EOF = False
    .fields(mTrnDtlRecStateField) = ChkDeleteRecStatus(.fields(mTrnDtlRecStateField))
    .Update
    '' .Delete deleted in update transaction
    
    .MoveNext
Loop
End With
m_dbPmtDatabase.CommitTrans
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
    ErrorBox "clsPmtMultiTranEntry_SelectTran_#412_[Invalid " & mTitleName & " Entry]"
    Exit Function
End If
mEntryFound = False
For mActiveTran = LBound(aPmtTran) To UBound(aPmtTran)
    If aPmtTran(mActiveTran) = mTrnCode Then
        mEntryFound = True
        Exit For
    End If
Next mActiveTran
If mEntryFound = False Then
    mActiveTran = UBound(aPmtTran) + 1
End If

SelectTran = True
End Function

Public Function NextTran() As Boolean
NextTran = False
If EOTran = True Then
    ErrorBox "clsPmtMultiTranEntry_NextTran_#432_[End of " & mTitleName & " Entry]"
    Exit Function
End If
mActiveTran = mActiveTran + 1

NextTran = True
End Function

Public Function PreviousTran()
PreviousTran = False
If BOTrn = True Then
    ErrorBox "clsPmtMultiTranEntry_PreviousTran_#443_[Begining of " & mTitleName & " Entry]"
    Exit Function
End If
mActiveTran = mActiveTran - 1

PreviousTran = True
End Function

Public Function FirstTran() As Boolean
FirstTran = False
If CountTran = 0 Then
    ErrorBox "clsPmtMultiTranEntry_FirstTran_#454_[No " & mTitleName & " Entry]"
    Exit Function
End If
mActiveTran = LBound(aPmtTran)

FirstTran = True

End Function

Public Function LastTran() As Boolean
LastTran = False
If CountTran = 0 Then
    ErrorBox "clsPmtMultiTranEntry_LastTran_#466_[No " & mTitleName & " Entry]"
    Exit Function
End If
mActiveTran = UBound(aPmtTran)

LastTran = True

End Function

Public Property Get CountTran() As Integer
If UBound(aPmtTran) = -1 Then
    CountTran = 0
Else
    CountTran = UBound(aPmtTran) - LBound(aPmtTran) + 1
End If

End Property

Public Property Get EOTran() As Boolean
EOTran = (mActiveTran > UBound(aPmtTran) Or UBound(aPmtTran) = -1)
End Property

Public Property Get BOTrn() As Boolean
BOTrn = (mActiveTran < LBound(aPmtTran) Or UBound(aPmtTran) = -1)
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
    ErrorBox "clsPmtMultiTranEntry_AddNewHdr_#736_[InActive " & mTitleName & " Entry]"
    GoTo EndSub
End If

On Error GoTo errhand
mTrnCode_lng = 0

m_dbPmtDatabase.BeginTrans
With tRecset
.Open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=-0.1", m_dbPmtDatabase, adOpenKeyset, adLockOptimistic

.AddNew

Rem .Fields(mTrnHdrCodeField) = AutoNumber
.fields(mTrnHdrDateField) = mTrnDate_dt
.fields(mTrnVtmField) = mTrnVtmCode_lng
.fields(mTrnPrefixField) = mTrnPrefix_str
.fields(mTrnVchNoField) = mTrnVchNo_lng
.fields(mTrnPostfixField) = mTrnPostfix_str
.fields(mTrnHdrCmpCodeField) = mTrnCmpCode_int
.fields(mTrnHdrRecStateField) = ChkEditRecStatus(.fields(mTrnHdrRecStateField))

If blnJobRcptTran = True Then
    .fields("JrhStkCode") = mJrhStkCode_lng
    .fields("JrhTime") = mJrhTime_lng
    .fields("JrhTrnRefNo") = mJrhTrnRefNo_str
    .fields("JrhTrnRefDt") = mJrhTrnRefDt_dt
    .fields("JrhPrtCode") = mJrhPrtCode_lng
    .fields("JrhQty") = mJrhQty_dbl
    .fields("JrhAmount") = mJrhAmount_dbl
    .fields("JrhRemark") = mJrhRemark_str
    
ElseIf blnJobIssueTran = True Then
    .fields("JihStkCode") = mJihStkCode_lng
    .fields("JihTime") = mJihTime_lng
    .fields("JihTrnRefNo") = mJihTrnRefNo_str
    .fields("JihTrnRefDt") = mJihTrnRefDt_dt
    .fields("JihPrtCode") = mJihPrtCode_lng
    .fields("JihQty") = mJihQty_dbl
    .fields("JihAmount") = mJihAmount_dbl
    .fields("JihRemark") = mJihRemark_str
    
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
    ErrorBox "clsPmtMultiTranEntry_AddNewHdr_#776_[Undefined Case]"
End If
.Update

mTrnCode_lng = .fields(mTrnHdrCodeField)
End With
m_dbPmtDatabase.CommitTrans
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
    ErrorBox "clsPmtMultiTranEntry_AddNewDtl_#810_[InActive " & mTitleName & " Entry]"
    GoTo EndSub
End If

On Error GoTo errhand
mTrnDtlICode_lng = 0

m_dbPmtDatabase.BeginTrans
With tRecset
.Open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=-0.1", m_dbPmtDatabase, adOpenKeyset, adLockOptimistic

.AddNew

Rem mTrnDtlICode_lng = AutoNumber
.fields(mTrnDtlCodeField) = mTrnCode
.fields(mTrnDtlSnoField) = mTrnDtlSno_int
.fields(mTrnDtlDateField) = mTrnDate_dt
.fields(mTrnDtlCmpCodeField) = mTrnCmpCode_int
.fields(mTrnDtlRecStateField) = ChkEditRecStatus(.fields(mTrnDtlRecStateField))

If blnJobRcptTran = True Then
    .fields("JrcStkCode") = mJrcStkCode_lng
    .fields("JrcStkICode") = mJrcStkICode_lng
    .fields("JrcPrtCode") = mJrcPrtCode_lng
    .fields("JrcSimCode") = mJrcSimCode_lng
    .fields("JrcItmCode") = mJrcItmCode_lng
    .fields("JrcItrCode") = mJrcItrCode_lng
    .fields("JrcSimRefNo") = mJrcSimRefNo_str
    .fields("JrcNarr") = mJrcNarr_str
    .fields("JrcQty") = mJrcQty_dbl
    .fields("JrcRate") = mJrcRate_dbl
    .fields("JrcAmount") = mJrcAmount_dbl
    .fields("JrcRemark") = mJrcRemark_str
    
ElseIf blnJobIssueTran = True Then
    .fields("JisStkCode") = mJisStkCode_lng
    .fields("JisStkICode") = mJisStkICode_lng
    .fields("JisPrtCode") = mJisPrtCode_lng
    .fields("JisSimCode") = mJisSimCode_lng
    .fields("JisItmCode") = mJisItmCode_lng
    .fields("JisItrCode") = mJisItrCode_lng
    .fields("JisSimRefNo") = mJisSimRefNo_str
    .fields("JisJrcCode") = mJisJrcCode_lng
    .fields("JisJrcICode") = mJisJrcICode_lng
    .fields("JisNarr") = mJisNarr_str
    .fields("JisQty") = mJisQty_dbl
    .fields("JisRate") = mJisRate_dbl
    .fields("JisAmount") = mJisAmount_dbl
    .fields("JisRemark") = mJisRemark_str
    
ElseIf blnOutdPymtTran = True Then
    .fields("OpyPttCode") = mOpyPttCode_lng
    .fields("OpyOhrCode") = mOpyOhrCode_lng
    .fields("OpyDepoAmt") = mOpyDepoAmt_dbl
    .fields("OpyRemark") = mOpyRemark_str
    
ElseIf blnOutdRefdTran = True Then
    .fields("OfdPttCode") = mOfdPttCode_lng
    .fields("OfdOhrCode") = mOfdOhrCode_lng
    .fields("OfdRefuAmt") = mOfdRefuAmt_dbl
    .fields("OfdRemark") = mOfdRemark_str
    
Else
    ErrorBox "clsPmtMultiTranEntry_AddNewDtl_#844_[Undefined Case]"
End If
.Update

mTrnDtlICode_lng = .fields(mTrnDtlICodeField)
End With
m_dbPmtDatabase.CommitTrans
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
    ErrorBox "clsPmtMultiTranEntry_UpdateDtl_#874_[InActive " & mTitleName & " Entry]"
    GoTo EndSub
End If

On Error GoTo errhand

m_dbPmtDatabase.BeginTrans
With tRecset
.Open "Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbPmtDatabase, adOpenKeyset, adLockOptimistic

Rem .Fields(mTrnHdrCodeField) = AutoNumber
.fields(mTrnHdrDateField) = mTrnDate_dt
.fields(mTrnVtmField) = mTrnVtmCode_lng
.fields(mTrnPrefixField) = mTrnPrefix_str
.fields(mTrnVchNoField) = mTrnVchNo_lng
.fields(mTrnPostfixField) = mTrnPostfix_str
.fields(mTrnHdrCmpCodeField) = mTrnCmpCode_int
.fields(mTrnHdrRecStateField) = ChkEditRecStatus(.fields(mTrnHdrRecStateField))

If blnJobRcptTran = True Then
    .fields("JrhStkCode") = mJrhStkCode_lng
    .fields("JrhTime") = mJrhTime_lng
    .fields("JrhTrnRefNo") = mJrhTrnRefNo_str
    .fields("JrhTrnRefDt") = mJrhTrnRefDt_dt
    .fields("JrhPrtCode") = mJrhPrtCode_lng
    .fields("JrhQty") = mJrhQty_dbl
    .fields("JrhAmount") = mJrhAmount_dbl
    .fields("JrhRemark") = mJrhRemark_str
    
ElseIf blnJobIssueTran = True Then
    .fields("JihStkCode") = mJihStkCode_lng
    .fields("JihTime") = mJihTime_lng
    .fields("JihTrnRefNo") = mJihTrnRefNo_str
    .fields("JihTrnRefDt") = mJihTrnRefDt_dt
    .fields("JihPrtCode") = mJihPrtCode_lng
    .fields("JihQty") = mJihQty_dbl
    .fields("JihAmount") = mJihAmount_dbl
    .fields("JihRemark") = mJihRemark_str
    
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
    ErrorBox "clsPmtMultiTranEntry_UpdateHdr_#911_[Undefined Case]"
End If
.Update
End With
m_dbPmtDatabase.CommitTrans
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
    ErrorBox "clsPmtMultiTranEntry_UpdateDtl_#936_[InActive " & mTitleName & " Entry]"
    GoTo EndSub
End If

On Error GoTo errhand

m_dbPmtDatabase.BeginTrans
With tRecset
.Open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " and " & mTrnDtlICodeField & "=" & CStr(mTrnICode) & "", m_dbPmtDatabase, adOpenKeyset, adLockOptimistic

Rem mTrnDtlICode_lng = AutoNumber
.fields(mTrnDtlCodeField) = mTrnCode_lng
.fields(mTrnDtlSnoField) = mTrnDtlSno_int
.fields(mTrnDtlDateField) = mTrnDate_dt
.fields(mTrnDtlCmpCodeField) = mTrnCmpCode_int
.fields(mTrnDtlRecStateField) = ChkEditRecStatus(.fields(mTrnDtlRecStateField))

If blnJobRcptTran = True Then
    .fields("JrcStkCode") = mJrcStkCode_lng
    .fields("JrcStkICode") = mJrcStkICode_lng
    .fields("JrcPrtCode") = mJrcPrtCode_lng
    .fields("JrcSimCode") = mJrcSimCode_lng
    .fields("JrcItmCode") = mJrcItmCode_lng
    .fields("JrcItrCode") = mJrcItrCode_lng
    .fields("JrcSimRefNo") = mJrcSimRefNo_str
    .fields("JrcNarr") = mJrcNarr_str
    .fields("JrcQty") = mJrcQty_dbl
    .fields("JrcRate") = mJrcRate_dbl
    .fields("JrcAmount") = mJrcAmount_dbl
    .fields("JrcRemark") = mJrcRemark_str
    
ElseIf blnJobIssueTran = True Then
    .fields("JisStkCode") = mJisStkCode_lng
    .fields("JisStkICode") = mJisStkICode_lng
    .fields("JisPrtCode") = mJisPrtCode_lng
    .fields("JisSimCode") = mJisSimCode_lng
    .fields("JisItmCode") = mJisItmCode_lng
    .fields("JisItrCode") = mJisItrCode_lng
    .fields("JisSimRefNo") = mJisSimRefNo_str
    .fields("JisJrcCode") = mJisJrcCode_lng
    .fields("JisJrcICode") = mJisJrcICode_lng
    .fields("JisNarr") = mJisNarr_str
    .fields("JisQty") = mJisQty_dbl
    .fields("JisRate") = mJisRate_dbl
    .fields("JisAmount") = mJisAmount_dbl
    .fields("JisRemark") = mJisRemark_str
    
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
    ErrorBox "clsPmtMultiTranEntry_UpdateDtl_#966_[Undefined Case]"
End If
.Update

End With
m_dbPmtDatabase.CommitTrans
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
    ErrorBox "clsPmtMultiTranEntry_DeleteDtl_#995_[InActive " & mTitleName & " Entry]"
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
    
    m_dbPmtDatabase.BeginTrans
    With tRecset
    .Open "Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " and " & mTrnDtlICodeField & "=" & CStr(mTrnICode) & "", m_dbPmtDatabase, adOpenKeyset, adLockOptimistic
    
    .fields(mTrnDtlRecStateField) = ChkDeleteRecStatus(.fields(mTrnDtlRecStateField))
    .Update
    End With
    m_dbPmtDatabase.CommitTrans
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
    ErrorBox "clsPmtMultiTranEntry_Data_CreateLog_#406_[InActive " & mTitleName & " Entry]"
    GoTo EndSub
End If

t1Recset.Open "Select * from " & mTrnDtlTableName & "_Log where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " order by " & mTrnDtlICodeField & "", m_dbPmtDatabase, adOpenKeyset, adLockOptimistic
t2Recset.Open "Select * from " & mTrnHdrTableName & "_Log where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & "", m_dbPmtDatabase, adOpenKeyset, adLockOptimistic
If t1Recset.RecordCount = 0 And t2Recset.RecordCount = 0 Then
    m_dbPmtDatabase.BeginTrans
    m_dbPmtDatabase.Execute "Insert into " & mTrnDtlTableName & "_Log Select * from " & mTrnDtlTableName & " where " & mTrnDtlCodeField & "=" & CStr(mTrnCode) & " and " & mTrnDtlRecStateField & "=" & CStr(cREC_UNCHANGED) & ""
    m_dbPmtDatabase.Execute "Insert into " & mTrnHdrTableName & "_Log Select * from " & mTrnHdrTableName & " where " & mTrnHdrCodeField & "=" & CStr(mTrnCode) & " and " & mTrnHdrRecStateField & "=" & CStr(cREC_UNCHANGED) & ""
    m_dbPmtDatabase.CommitTrans
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
    ErrorBox "clsPmtMultiTranEntry_Data_RemoveLog_#1041_[InActive " & mTitleName & " Entry]"
    Exit Function
End If

m_dbPmtDatabase.BeginTrans
m_dbPmtDatabase.Execute "Delete from " & mTrnDtlTableName & "_Log where " & mTrnDtlCodeField & "=" & CStr(mTrnCode)
m_dbPmtDatabase.Execute "Delete from " & mTrnHdrTableName & "_Log where " & mTrnHdrCodeField & "=" & CStr(mTrnCode)
m_dbPmtDatabase.CommitTrans

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
If blnJobRcptTran = True Then
    With tRecset
    .Open "Select top 1 * from (((JobRcpt" _
        & " inner join JobRcHdr on JobRcpt.JrcCode=JobRcHdr.JrhCode)" _
        & " inner join JobIssu on JobRcpt.JrcICode=JobIssu.JisJrcICode)" _
        & " left Join JobIsHdr on JobIssu.JisCode=JobIsHdr.JihCode)" _
        & " left Join VTypMast on JobIsHdr.JihVtmCode=VTypMast.VtmCode" _
        & " where JrcCode=" & CStr(mTrnCode) _
        & IIf(IsMissing(mTrnICode) = False, " and JrcICode=" & CStr(mTrnICode), "") _
        & " order by JrcDate desc,JrcCode" _
        , m_dbComDatabase, adOpenKeyset, adLockOptimistic
    If .EOF = False Then
        If IsNull(.fields("JihCode")) = False Then
            AlertBox "Job Issue Entry Exist !!!" _
                & vbCrLf & .fields("VtmName") & " No." & CStr(.fields("JihVchNo")) & " Dated " & Dtoc(.fields("JihDate")) & ""
        Else
            AlertBox "Job Issue Entry Under Process !!!" _
                & vbCrLf & " Dated " & Dtoc(.fields("JrcDate")) & ""
        End If
        ChkEntryExist = True
    End If
    End With
    CloseTable tRecset
    
'    With tRecset
'    .Open "Select * from OutdPymtDtl dtl inner join OutdPymtHdr hdr on dtl.OpyCode=hdr.OphCode where OpyOhrCode=" & CStr(mTrnCode) & " order by OpyDate desc,OphVchNo desc", m_dbPmtDatabase, adOpenKeyset, adLockReadOnly
'    If .RecordCount > 0 Then
'        AlertBox "Outdoor Receipt No." & CStr(.fields("OphVchNo")) & " Dated " & Dtoc(.fields("OphDate")) & " !!!"
'        ChkEntryExist = True
'    End If
'    End With
'    CloseTable tRecset
'
'    If ChkEntryExist = False Then
'        With tRecset
'        .Open "Select * from OutdRefdDtl dtl inner join OutdRefdHdr hdr on dtl.OfdCode=hdr.OfhCode where OfdOhrCode=" & CStr(mTrnCode) & " order by OfdDate desc,OfhVchNo desc", m_dbPmtDatabase, adOpenKeyset, adLockReadOnly
'        If .RecordCount > 0 Then
'            AlertBox "Outdoor Receipt No." & CStr(.fields("OfhVchNo")) & " Dated " & Dtoc(.fields("OfhDate")) & " !!!"
'            ChkEntryExist = True
'        End If
'        End With
'        CloseTable tRecset
'    End If
ElseIf blnJobIssueTran = True Then

ElseIf blnOutdPymtTran = True Then
'    Dim mOpyDepoAmt As Double, mOpyOhrCode As Long
'    With tRecset
'    .Open "Select * from OutdPymtDtl dtl inner join OutdPymtHdr hdr on dtl.OpyCode=hdr.OphCode where OpyCode=" & CStr(mTrnCode) & " order by OpyICode", m_dbPmtDatabase, adOpenKeyset, adLockReadOnly
'    If .RecordCount > 0 Then
'        Do While .EOF = False And ChkEntryExist = False
'            mOpyOhrCode = .fields("OpyOhrCode")
'            mOpyDepoAmt = .fields("OpyDepoAmt")
'
'            With t1Recset
'            .Open "Select * from OutdHdr hdr inner join VTypMast vtm on hdr.OhrVtmCode=vtm.VtmCode where OhrCode=" & CStr(mOpyOhrCode) & "", m_dbComDatabase, adOpenKeyset, adLockReadOnly
'            If .RecordCount > 0 Then
'                If .fields("OhrRefuAmt") > (.fields("OhrAdvAmt") + .fields("OhrRecdAmt") + .fields("OhrDepoAmt") - mOpyDepoAmt) Then
'                    ErrorBox "Excess Amount Refunded for Receipt No." & .fields("VtmName") & "-" & CStr(.fields("OhrVchNo")) & " Dated " & Dtoc(.fields("OhrDate")) & " !!!"
'                    ChkEntryExist = True
'                End If
'            End If
'            End With
'            CloseTable t1Recset
'
'            .MoveNext
'        Loop
'    End If
'    End With
'    CloseTable tRecset
    
ElseIf blnOutdRefdTran = True Then
    Rem does not affect transaction for any negative balance
    
End If


EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Function


End Function

