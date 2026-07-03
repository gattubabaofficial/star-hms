VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "tmpclsHmsServDoctEntry"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Dim m_dbHmsDatabase As ADODB.Connection, m_dbAcDatabase As ADODB.Connection
Dim mTableName As String, mCodeField As String, mSubCodeField As String, mICodeField As String, mSnoField As String, mDctCodeField As String, mDrlCodeField As String, mRemarkField As String, mRecStateField As String, mCmpCodeField As String
Dim mClassUIdCode As Long, mClassUIdFileName As String, mClassAcsPermFileName As String
Public blnOutdRcDctMast As Boolean, blnOutdBlDctMast As Boolean, blnIndrRcDctMast As Boolean, blnIndrBlDctMast As Boolean
Public mSdcCode_lng As Long, mSdcSubCode_lng As Long, mSdcICode_lng As Long, mSdcSno_int As Integer, mSdcDctCode_lng As Long, mSdcDrlCode_lng As Long, mSdcRemark_str As String, mSdcRecState_int As Integer

Dim aSdcCode() As Variant
Dim aSdcSubCode() As Variant
Dim aSdcICode() As Variant
Dim aSdcSno() As Variant
Dim aSdcDctCode() As Variant
Dim aSdcDrlCode() As Variant
Dim aSdcRemark() As Variant
Dim aSdcRecState() As Variant


Public mPcgInfAllowed_bln As Boolean, mPcgDefAllowed_bln As Boolean, mPcgDiscAllowed_bln As Boolean, mPcgDiscPer_dbl As Double, mPcgShowInList_bln As Boolean
Public mDctSpeci_str As String, mDctDcgCode_lng As Long, mDctAddr_str As String, mDctTelNo_str As String, mDctEmail_str As String, mDctAhCode_lng As Long, mDctShare_dbl As Double
Public mRBySpeci_str As String, mRByRfgCode_lng As Long, mRByAddr_str As String, mRByTelNo_str As String, mRByEmail_str As String, mRByAhCode_lng As Long, mRByShare_dbl As Double
Public mRToSpeci_str As String, mRToRfgCode_lng As Long, mRToAddr_str As String, mRToTelNo_str As String, mRToEmail_str As String, mRToAhCode_lng As Long, mRToShare_dbl As Double
Public mSgpIndex_int As Integer, mSgpExpanded_bln As Boolean, mSgpEditable_bln As Boolean, mSgpShowInList_bln As Boolean
Public mSgpExtRateSys_bln As Boolean, mSgpDctwseRateSys_bln As Boolean, mSgpPcgwseRateSys_bln As Boolean, mSgpRBywseRateSys_bln As Boolean, mSgpRTowseRateSys_bln As Boolean, mSgpTimewseRateSys_bln As Boolean, mSgpExtDiscSys_bln As Boolean, mSgpDctwseDiscSys_bln As Boolean, mSgpPcgwseDiscSys_bln As Boolean, mSgpRBywseDiscSys_bln As Boolean, mSgpRTowseDiscSys_bln As Boolean, mSgpTimewseDiscSys_bln As Boolean, mSgpExtBargSys_bln As Boolean, mSgpDctwseBargSys_bln As Boolean, mSgpPcgwseBargSys_bln As Boolean, mSgpRBywseBargSys_bln As Boolean, mSgpRTowseBargSys_bln As Boolean, mSgpTimewseBargSys_bln As Boolean, mSgpExtShareSys_bln As Boolean, mSgpDctwseShareSys_bln As Boolean, mSgpPcgwseShareSys_bln As Boolean, mSgpRBywseShareSys_bln As Boolean, mSgpRTowseShareSys_bln As Boolean, mSgpTimewseShareSys_bln As Boolean
Public mSrvSgpCode_lng As Long, mSrvAhCode_lng As Long, mSrvIndex_int As Integer, mSrvOpdGenChg_dbl As Double, mSrvOpdEmgChg_dbl As Double, mSrvIpdGenChg_dbl As Double, mSrvIpdEmgChg_dbl As Double, mSrvLabGenChg_dbl As Double, mSrvLabEmgChg_dbl As Double, mSrvMultiDctIncl_bln As Boolean, mSrvAutoInsIpdBill_bln As Boolean, mSrvAutoCalcIpdBill_bln As Boolean, mSrvUnitEditable_bln As Boolean, mSrvRateEditable_bln As Boolean, mSrvAmtEditable_bln As Boolean, mSrvInfAllowed_bln As Boolean, mSrvDefAllowed_bln As Boolean, mSrvDiscAllowed_bln As Boolean, mSrvDiscPer_dbl As Double, mSrvShowInList_bln As Boolean
Public mSrvDctwseRateSys_bln As Boolean, mSrvPcgwseRateSys_bln As Boolean, mSrvRBywseRateSys_bln As Boolean, mSrvRTowseRateSys_bln As Boolean, mSrvTimewseRateSys_bln As Boolean, mSrvDctwseDiscSys_bln As Boolean, mSrvPcgwseDiscSys_bln As Boolean, mSrvRBywseDiscSys_bln As Boolean, mSrvRTowseDiscSys_bln As Boolean, mSrvTimewseDiscSys_bln As Boolean, mSrvDctwseBargSys_bln As Boolean, mSrvPcgwseBargSys_bln As Boolean, mSrvRBywseBargSys_bln As Boolean, mSrvRTowseBargSys_bln As Boolean, mSrvTimewseBargSys_bln As Boolean, mSrvDctwseShareSys_bln As Boolean, mSrvPcgwseShareSys_bln As Boolean, mSrvRBywseShareSys_bln As Boolean, mSrvRTowseShareSys_bln As Boolean, mSrvTimewseShareSys_bln As Boolean
Public mPttRegNo_lng As Long, mPttRegDate_dt As Date, mPttSex_str As String, mPttAgeAsOnDt_dt As Date, mPttDob_dt As Date, mPttAhCode_lng As Long, mPttPcgCode_lng As Long, mPttRefRela_int As String, mPttRefRela_str As String, mPttRefName_str As String, mPttAddr_str As String, mPttAraCode_lng As Long, mPttStnCode_lng As Long, mPttTelNo_str As String, mPttSMSNo_str As String, mPttEmail_str As String, mPttInfAllowed_bln As Boolean, mPttDefAllowed_bln As Boolean, mPttDiscAllowed_bln As Boolean, mPttDiscPer_dbl As Double, mPttShowInList_bln As Boolean, mPttRemark_str As String
Public mFlrShowInList_bln As Boolean
Public mWrdShowInList_bln As Boolean
Public mBdmFlrCode_lng As Long, mBdmWrdCode_lng As Long, mBdmSrvCode_lng As Long, mBdmIndex_int As Integer, mBdmCharges_dbl As Double, mBdmDiscAllowed_bln As Boolean, mBdmDiscPer_sng As Single, mBdmChkOutTimeBasis_int As Integer, mBdmChkTime_lng As Long, mBdmFreeAllot_bln As Boolean, mBdmRemark_str As String, mBdmShowInList_bln As Boolean

Dim mActiveMast As Integer, aMastTran() As Variant

Public Sub Init()
If blnOutdRcDctMast = True Then
    mTableName = "OutdRcDctDtl"
    mCodeField = "OrdCode"
    mSubCodeField = "OrdOrcCode"
    mICodeField = "OrdICode"
    mSnoField = "OrdSno"
    mDctCodeField = "OrdDctCode"
    mDrlCodeField = "OrdDrlCode"
    mRemarkField = "OrdRemark"
    mRecStateField = "OrdRecState"
    mCmpCodeField = "OrdCmpCode"
    mTitleName = "Outdoor Receipt Doctor Detail"
    
ElseIf blnOutdBlDctMast = True Then
    mTableName = "OutdBlDctDtl"
    mCodeField = "ObdCode"
    mSubCodeField = "ObdOblCode"
    mICodeField = "ObdICode"
    mSnoField = "ObdSno"
    mDctCodeField = "ObdDctCode"
    mDrlCodeField = "ObdDrlCode"
    mRemarkField = "ObdRemark"
    mRecStateField = "ObdRecState"
    mCmpCodeField = "ObdCmpCode"
    mTitleName = "Outdoor Bill Doctor Detail"
    
ElseIf blnIndrRcDctMast = True Then
    mTableName = "IndrRcDctDtl"
    mCodeField = "IrdCode"
    mSubCodeField = "IrdIrcCode"
    mICodeField = "IrdICode"
    mSnoField = "IrdSno"
    mDctCodeField = "IrdDctCode"
    mDrlCodeField = "IrdDrlCode"
    mRemarkField = "IrdRemark"
    mRecStateField = "IrdRecState"
    mCmpCodeField = "IrdCmpCode"
    mTitleName = "Indoor Receipt Doctor Detail"
    
ElseIf blnIndrBlDctMast = True Then
    mTableName = "IndrBlDctDtl"
    mCodeField = "IbdCode"
    mSubCodeField = "IbdIblCode"
    mICodeField = "IbdICode"
    mSnoField = "IbdSno"
    mDctCodeField = "IbdDctCode"
    mDrlCodeField = "IbdDrlCode"
    mRemarkField = "IbdRemark"
    mRecStateField = "IbdRecState"
    mCmpCodeField = "IbdCmpCode"
    mTitleName = "Indoor Bill Doctor Detail"
    
Else
    ErrorBox "clsHmsServDoctEntry_Init_#65_[Undefined Case]"
End If

End Sub

Public Property Set dbHmsDatabase(ByRef db As ADODB.Connection)
Set m_dbHmsDatabase = db

End Property

Public Property Set dbAcDatabase(ByRef db As ADODB.Connection)
Set m_dbAcDatabase = db

End Property

Private Sub Class_Initialize()
aMastTran = Array()
mActiveMast = UBound(aMastTran)

mClassUIdFileName = "clHmsSdc.UId"
mClassAcsPermFileName = "clHmsSdc.Acp"
mClassUIdCode = GetUIdCode("clsHmsServDoctEntry_Initialize", mUIdFileName:=mClassUIdFileName, mAcsPermFileName:=mClassAcsPermFileName)

End Sub

Public Sub GetData(ByVal mSdcICode As Long)
Dim aPos As Integer

Me.Clear

aPos = AScan(aSdcICode, mSdcICode)
If aPos >= LBound(aSdcICode) Then
    mSdcCode_lng = aSdcCode(aPos)
    mSdcSubCode_lng = aSdcSubCode(aPos)
    mSdcICode_lng = aSdcICode(aPos)
    mSdcSno_int = aSdcSno(aPos)
    mSdcDctCode_lng = aSdcDctCode(aPos)
    mSdcDrlCode_lng = aSdcDrlCode(aPos)
    mSdcRemark_str = aSdcRemark(aPos)
    mSdcRecState_int = aSdcRecState(aPos)
End If

'With tRecset
'.Open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
'If .EOF = False Then
'    mCode_lng = .fields(mCodeField)
'    If mNameField <> "" Then
'        mName_str = .fields(mNameField)
'    End If
'    If blnPatCatgMast = True Then
'        mPcgInfAllowed_bln = .fields("PcgInfAllowed")
'        mPcgDefAllowed_bln = .fields("PcgDefAllowed")
'        mPcgDiscAllowed_bln = .fields("PcgDiscAllowed")
'        mPcgDiscPer_dbl = .fields("PcgDiscPer")
'        mPcgShowInList_bln = .fields("PcgShowInList")
'
'    ElseIf blnPatMast = True Then
'        mPttRegNo_lng = .fields("PttRegNo")
'        mPttRegDate_dt = .fields("PttRegDate")
'        mPttSex_str = .fields("PttSex")
'        mPttAgeAsOnDt_dt = .fields("PttAgeAsOnDt")
'        mPttDob_dt = .fields("PttDob")
'        mPttAhCode_lng = .fields("PttAhCode")
'        mPttPcgCode_lng = .fields("PttPcgCode")
'        mPttRefRela_str = .fields("PttRefRela")
'        mPttRefName_str = .fields("PttRefName")
'        mPttAddr_str = .fields("PttAddr")
'        mPttAraCode_lng = .fields("PttAraCode")
'        mPttStnCode_lng = .fields("PttStnCode")
'        mPttTelNo_str = .fields("PttTelNo")
'        mPttSMSNo_str = .fields("PttSMSNo")
'        mPttEmail_str = .fields("PttEmail")
'        mPttInfAllowed_bln = .fields("PttInfAllowed")
'        mPttDefAllowed_bln = .fields("PttDefAllowed")
'        mPttDiscAllowed_bln = .fields("PttDiscAllowed")
'        mPttDiscPer_dbl = .fields("PttDiscPer")
'        mPttShowInList_bln = .fields("PttShowInList")
'        mPttRemark_str = .fields("PttRemark")
'
'    ElseIf blnDoctCatgMast = True Then
'
'    ElseIf blnRefCatgMast = True Then
'
'    ElseIf blnDoctMast = True Then
'        mDctSpeci_str = .fields("DctSpeci")
'        mDctDcgCode_lng = .fields("DctDcgCode")
'        mDctAddr_str = .fields("DctAddr")
'        mDctTelNo_str = .fields("DctTelNo")
'        mDctEmail_str = .fields("DctEmail")
'        mDctAhCode_lng = .fields("DctAhCode")
'        mDctShare_dbl = .fields("DctShare")
'
'    ElseIf blnDoctRoleMast = True Then
'
'    ElseIf blnRefByMast = True Then
'        mRBySpeci_str = .fields("RBySpeci")
'        mRByRfgCode_lng = .fields("RByRfgCode")
'        mRByAddr_str = .fields("RByAddr")
'        mRByTelNo_str = .fields("RByTelNo")
'        mRByEmail_str = .fields("RByEmail")
'        mRByAhCode_lng = .fields("RByAhCode")
'        mRByShare_dbl = .fields("RByShare")
'
'    ElseIf blnRefToMast = True Then
'        mRToSpeci_str = .fields("RToSpeci")
'        mRToRfgCode_lng = .fields("RToRfgCode")
'        mRToAddr_str = .fields("RToAddr")
'        mRToTelNo_str = .fields("RToTelNo")
'        mRToEmail_str = .fields("RToEmail")
'        mRToAhCode_lng = .fields("RToAhCode")
'        mRToShare_dbl = .fields("RToShare")
'
'    ElseIf blnServGrpMast = True Then
'        mSgpIndex_int = .fields("SgpIndex")
'        mSgpExpanded_bln = .fields("SgpExpanded")
'        mSgpEditable_bln = .fields("SgpEditable")
'        mSgpShowInList_bln = .fields("SgpShowInList")
'        mSgpExtRateSys_bln = .fields("SgpExtRateSys")
'        mSgpDctwseRateSys_bln = .fields("SgpDctwseRateSys")
'        mSgpPcgwseRateSys_bln = .fields("SgpPcgwseRateSys")
'        mSgpRBywseRateSys_bln = .fields("SgpRBywseRateSys")
'        mSgpRTowseRateSys_bln = .fields("SgpRTowseRateSys")
'        mSgpTimewseRateSys_bln = .fields("SgpTimewseRateSys")
'        mSgpExtDiscSys_bln = .fields("SgpExtDiscSys")
'        mSgpDctwseDiscSys_bln = .fields("SgpDctwseDiscSys")
'        mSgpPcgwseDiscSys_bln = .fields("SgpPcgwseDiscSys")
'        mSgpRBywseDiscSys_bln = .fields("SgpRBywseDiscSys")
'        mSgpRTowseDiscSys_bln = .fields("SgpRTowseDiscSys")
'        mSgpTimewseDiscSys_bln = .fields("SgpTimewseDiscSys")
'        mSgpExtBargSys_bln = .fields("SgpExtBargSys")
'        mSgpDctwseBargSys_bln = .fields("SgpDctwseBargSys")
'        mSgpPcgwseBargSys_bln = .fields("SgpPcgwseBargSys")
'        mSgpRBywseBargSys_bln = .fields("SgpRBywseBargSys")
'        mSgpRTowseBargSys_bln = .fields("SgpRTowseBargSys")
'        mSgpTimewseBargSys_bln = .fields("SgpTimewseBargSys")
'        mSgpExtShareSys_bln = .fields("SgpExtShareSys")
'        mSgpDctwseShareSys_bln = .fields("SgpDctwseShareSys")
'        mSgpPcgwseShareSys_bln = .fields("SgpPcgwseShareSys")
'        mSgpRBywseShareSys_bln = .fields("SgpRBywseShareSys")
'        mSgpRTowseShareSys_bln = .fields("SgpRTowseShareSys")
'        mSgpTimewseShareSys_bln = .fields("SgpTimewseShareSys")
'
'    ElseIf blnServMast = True Then
'        mSrvSgpCode_lng = .fields("SrvSgpCode")
'        mSrvAhCode_lng = .fields("SrvAhCode")
'        mSrvIndex_int = .fields("SrvIndex")
'        mSrvOpdGenChg_dbl = .fields("SrvOpdGenChg")
'        mSrvOpdEmgChg_dbl = .fields("SrvOpdEmgChg")
'        mSrvIpdGenChg_dbl = .fields("SrvIpdGenChg")
'        mSrvIpdEmgChg_dbl = .fields("SrvIpdEmgChg")
'        mSrvLabGenChg_dbl = .fields("SrvLabGenChg")
'        mSrvLabEmgChg_dbl = .fields("SrvLabEmgChg")
'        mSrvMultiDctIncl_bln = .fields("SrvMultiDctIncl")
'        mSrvAutoInsIpdBill_bln = .fields("SrvAutoInsIpdBill")
'        mSrvAutoCalcIpdBill_bln = .fields("SrvAutoCalcIpdBill")
'        mSrvUnitEditable_bln = .fields("SrvUnitEditable")
'        mSrvRateEditable_bln = .fields("SrvRateEditable")
'        mSrvAmtEditable_bln = .fields("SrvAmtEditable")
'        mSrvInfAllowed_bln = .fields("SrvInfAllowed")
'        mSrvDefAllowed_bln = .fields("SrvDefAllowed")
'        mSrvDiscAllowed_bln = .fields("SrvDiscAllowed")
'        mSrvDiscPer_dbl = .fields("SrvDiscPer")
'        mSrvShowInList_bln = .fields("SrvShowInList")
'        mSrvDctwseRateSys_bln = .fields("SrvDctwseRateSys")
'        mSrvPcgwseRateSys_bln = .fields("SrvPcgwseRateSys")
'        mSrvRBywseRateSys_bln = .fields("SrvRBywseRateSys")
'        mSrvRTowseRateSys_bln = .fields("SrvRTowseRateSys")
'        mSrvTimewseRateSys_bln = .fields("SrvTimewseRateSys")
'        mSrvDctwseDiscSys_bln = .fields("SrvDctwseDiscSys")
'        mSrvPcgwseDiscSys_bln = .fields("SrvPcgwseDiscSys")
'        mSrvRBywseDiscSys_bln = .fields("SrvRBywseDiscSys")
'        mSrvRTowseDiscSys_bln = .fields("SrvRTowseDiscSys")
'        mSrvTimewseDiscSys_bln = .fields("SrvTimewseDiscSys")
'        mSrvDctwseBargSys_bln = .fields("SrvDctwseBargSys")
'        mSrvPcgwseBargSys_bln = .fields("SrvPcgwseBargSys")
'        mSrvRBywseBargSys_bln = .fields("SrvRBywseBargSys")
'        mSrvRTowseBargSys_bln = .fields("SrvRTowseBargSys")
'        mSrvTimewseBargSys_bln = .fields("SrvTimewseBargSys")
'        mSrvDctwseShareSys_bln = .fields("SrvDctwseShareSys")
'        mSrvPcgwseShareSys_bln = .fields("SrvPcgwseShareSys")
'        mSrvRBywseShareSys_bln = .fields("SrvRBywseShareSys")
'        mSrvRTowseShareSys_bln = .fields("SrvRTowseShareSys")
'        mSrvTimewseShareSys_bln = .fields("SrvTimewseShareSys")
'
'    ElseIf blnDiagMast = True Then
'
'    ElseIf blnFloorMast = True Then
'        mFlrShowInList_bln = .fields("FlrShowInList")
'
'    ElseIf blnWardMast = True Then
'        mWrdShowInList_bln = .fields("WrdShowInList")
'
'    ElseIf blnBedMast = True Then
'        mBdmFlrCode_lng = .fields("BdmFlrCode")
'        mBdmWrdCode_lng = .fields("BdmWrdCode")
'        mBdmSrvCode_lng = .fields("BdmSrvCode")
'        mBdmIndex_int = .fields("BdmIndex")
'        mBdmCharges_dbl = .fields("BdmCharges")
'        mBdmDiscAllowed_bln = .fields("BdmDiscAllowed")
'        mBdmDiscPer_sng = .fields("BdmDiscPer")
'        mBdmChkOutTimeBasis_int = .fields("BdmChkOutTimeBasis")
'        mBdmChkTime_lng = .fields("BdmChkTime")
'        mBdmFreeAllot_bln = .fields("BdmFreeAllot")
'        mBdmRemark_str = .fields("BdmRemark")
'        mBdmShowInList_bln = .fields("BdmShowInList")
'
'    End If
'End If
'End With
'CloseTable tRecset

EndSub:
Exit Sub

End Sub

Public Sub Clear()
mSdcCode_lng = 0
mSdcSubCode_lng = 0
mSdcICode_lng = 0
mSdcSno_int = 0
mSdcDctCode_lng = 0
mSdcDrlCode_lng = 0
mSdcRemark_str = ""
mSdcRecState_int = 0

End Sub

Private Sub Class_Terminate()
If UBound(aMastTran) >= LBound(aMastTran) Then
    ErrorBox mTitleName & " Entry in Process !!!"
End If

End Sub

Public Function BeginMast(ByVal mSdcCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset
BeginMast = False

aSdcCode = Array()
aSdcSubCode = Array()
aSdcICode = Array()
aSdcSno = Array()
aSdcDctCode = Array()
aSdcDrlCode = Array()
aSdcRemark = Array()
aSdcRecState = Array()

If mSdcCode = 0 Then
    If mSdcCode = 0 Then
        ErrorBox mTitleName & " Entry Failed !!!"
        GoTo EndSub
    End If
ElseIf mSdcCode > 0 Then
    tRecset.Open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mSdcCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.EOF = True Then
        ErrorBox mTitleName & " Entry not Found !!!"
        GoTo EndSub
    Else
        Do While .EOF = False
            AddToArray aSdcCode, .fields(mCodeField)
            AddToArray aSdcSubCode, .fields(mSubCodeField)
            AddToArray aSdcICode, .fields(mICodeField)
            AddToArray aSdcSno, .fields(mSnoField)
            AddToArray aSdcDctCode, .fields(mDctCodeField)
            AddToArray aSdcDrlCode, .fields(mDrlCodeField)
            AddToArray aSdcRemark, .fields(mRemarkField)
            AddToArray aSdcRecState, .fields(mRecStateField)
            
            .MoveNext
        Loop
    End If
    CloseTable tRecset
Else
    ErrorBox "Invalid " & mTitleName & " Entry !!!"
    GoTo EndSub
End If
mActiveMast = UBound(aMastTran) + 1
ReDim Preserve aMastTran(mActiveMast)
aMastTran(mActiveMast) = mSdcCode

Call Data_CreateLog(mSdcCode)

BeginMast = True

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Function

End Function

Public Function EndMast(ByVal mSdcCode As Long) As Boolean
Dim mCnt As Integer
EndMast = False
If Chk_ActiveMast() = False Or IIf(ActiveCode > 0, mSdcCode <> ActiveCode, False) Then
    ErrorBox "No Active " & mTitleName & " Entry !!!"
    Exit Function
End If
Call Data_RemoveLog(mSdcCode)

For mCnt = (mActiveMast + 1) To UBound(aMastTran)
    If (mCnt - 1) >= LBound(aMastTran) Then
        aMastTran(mCnt - 1) = aMastTran(mCnt)
    End If
Next mCnt
If LBound(aMastTran) = UBound(aMastTran) Then
    aMastTran = Array()
Else
    ReDim Preserve aMastTran(UBound(aMastTran) - 1)
End If
If mActiveMast > UBound(aMastTran) Then
    mActiveMast = mActiveMast - 1
End If

EndMast = True
End Function

Public Property Get ActiveCode() As Long
On Error GoTo errhand

ActiveCode = aMastTran(mActiveMast)

Exit Property

errhand:
ErrorBox Err.Description
ActiveCode = -1
Exit Property

End Property

Rem update transactional sum up, physically deletes records marked for deletion or marks ok records for added or edited
Public Function UpdateMast(ByVal mCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset
UpdateMast = False

On Error GoTo errhand

m_dbHmsDatabase.BeginTrans
Rem updating Master
With tRecset
.Open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
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
m_dbHmsDatabase.CommitTrans

UpdateMast = True
GoTo EndSub

errhand:
MsgBox Err.Description
m_dbHmsDatabase.Cancel

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Function

End Function

Rem checks entries with log table, if log exist restores log records else delete records (assuming new records added), balance updation part not done here because master entries does not have effect while in process
Public Function CancelMast(ByVal mCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset, LogRS As New ADODB.Recordset
Dim mRecEdited As Boolean, mRecDeleted As Boolean

CancelMast = False
If Chk_ActiveMast() = False Or mCode <> ActiveCode Then
    ErrorBox "No Active " & mTitleName & " Entry to Cancel !!!"
    GoTo EndSub
End If
'mCode = ActiveCode
On Error GoTo errhand

m_dbHmsDatabase.BeginTrans
With tRecset
.Open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
LogRS.Open "Select * from " & mTableName & "_Log where " & mCodeField & "=" & CStr(mCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    If LogRS.EOF = False Then
        ' any prior updations can be made here
        If mNameField <> "" Then
            .fields(mNameField) = LogRS.fields(mNameField)
        End If
        .fields(mRecStateField) = LogRS.fields(mRecStateField)
        
        If blnPatCatgMast = True Then
            .fields("PcgInfAllowed") = LogRS.fields("PcgInfAllowed")
            .fields("PcgDefAllowed") = LogRS.fields("PcgDefAllowed")
            .fields("PcgDiscAllowed") = LogRS.fields("PcgDiscAllowed")
            .fields("PcgDiscPer") = LogRS.fields("PcgDiscPer")
            .fields("PcgShowInList") = LogRS.fields("PcgShowInList")
            
        ElseIf blnPatMast = True Then
            .fields("PttRegNo") = LogRS.fields("PttRegNo")
            .fields("PttRegDate") = LogRS.fields("PttRegDate")
            .fields("PttSex") = LogRS.fields("PttSex")
            .fields("PttAgeAsOnDt") = LogRS.fields("PttAgeAsOnDt")
            .fields("PttDob") = LogRS.fields("PttDob")
            .fields("PttAhCode") = LogRS.fields("PttAhCode")
            .fields("PttPcgCode") = LogRS.fields("PttPcgCode")
            .fields("PttRefName") = LogRS.fields("PttRefName")
            .fields("PttAddr") = LogRS.fields("PttAddr")
            .fields("PttAraCode") = LogRS.fields("PttAraCode")
            .fields("PttStnCode") = LogRS.fields("PttStnCode")
            .fields("PttTelNo") = LogRS.fields("PttTelNo")
            .fields("PttSMSNo") = LogRS.fields("PttSMSNo")
            .fields("PttEmail") = LogRS.fields("PttEmail")
            .fields("PttInfAllowed") = LogRS.fields("PttInfAllowed")
            .fields("PttDefAllowed") = LogRS.fields("PttDefAllowed")
            .fields("PttDiscAllowed") = LogRS.fields("PttDiscAllowed")
            .fields("PttDiscPer") = LogRS.fields("PttDiscPer")
            .fields("PttShowInList") = LogRS.fields("PttShowInList")
            .fields("PttRemark") = LogRS.fields("PttRemark")
            
        ElseIf blnDoctCatgMast = True Then
        
        ElseIf blnRefCatgMast = True Then
        
        ElseIf blnDoctMast = True Then
            .fields("DctSpeci") = LogRS.fields("DctSpeci")
            .fields("DctDcgCode") = LogRS.fields("DctDcgCode")
            .fields("DctAddr") = LogRS.fields("DctAddr")
            .fields("DctTelNo") = LogRS.fields("DctTelNo")
            .fields("DctEmail") = LogRS.fields("DctEmail")
            .fields("DctAhCode") = LogRS.fields("DctAhCode")
            .fields("DctShare") = LogRS.fields("DctShare")
            
        ElseIf blnDoctRoleMast = True Then
            
        ElseIf blnRefByMast = True Then
            .fields("RBySpeci") = LogRS.fields("RBySpeci")
            .fields("RByRfgCode") = LogRS.fields("RByRfgCode")
            .fields("RByAddr") = LogRS.fields("RByAddr")
            .fields("RByTelNo") = LogRS.fields("RByTelNo")
            .fields("RByEmail") = LogRS.fields("RByEmail")
            .fields("RByAhCode") = LogRS.fields("RByAhCode")
            .fields("RByShare") = LogRS.fields("RByShare")
            
        ElseIf blnRefToMast = True Then
            .fields("RToSpeci") = LogRS.fields("RToSpeci")
            .fields("RToRfgCode") = LogRS.fields("RToRfgCode")
            .fields("RToAddr") = LogRS.fields("RToAddr")
            .fields("RToTelNo") = LogRS.fields("RToTelNo")
            .fields("RToEmail") = LogRS.fields("RToEmail")
            .fields("RToAhCode") = LogRS.fields("RToAhCode")
            .fields("RToShare") = LogRS.fields("RToShare")
            
        ElseIf blnServGrpMast = True Then
            .fields("SgpIndex") = LogRS.fields("SgpIndex")
            .fields("SgpExpanded") = LogRS.fields("SgpExpanded")
            .fields("SgpEditable") = LogRS.fields("SgpEditable")
            .fields("SgpShowInList") = LogRS.fields("SgpShowInList")
            .fields("SgpExtRateSys") = LogRS.fields("SgpExtRateSys")
            .fields("SgpDctwseRateSys") = LogRS.fields("SgpDctwseRateSys")
            .fields("SgpPcgwseRateSys") = LogRS.fields("SgpPcgwseRateSys")
            .fields("SgpRBywseRateSys") = LogRS.fields("SgpRBywseRateSys")
            .fields("SgpRTowseRateSys") = LogRS.fields("SgpRTowseRateSys")
            .fields("SgpTimewseRateSys") = LogRS.fields("SgpTimewseRateSys")
            .fields("SgpExtDiscSys") = LogRS.fields("SgpExtDiscSys")
            .fields("SgpDctwseDiscSys") = LogRS.fields("SgpDctwseDiscSys")
            .fields("SgpPcgwseDiscSys") = LogRS.fields("SgpPcgwseDiscSys")
            .fields("SgpRBywseDiscSys") = LogRS.fields("SgpRBywseDiscSys")
            .fields("SgpRTowseDiscSys") = LogRS.fields("SgpRTowseDiscSys")
            .fields("SgpTimewseDiscSys") = LogRS.fields("SgpTimewseDiscSys")
            .fields("SgpExtBargSys") = LogRS.fields("SgpExtBargSys")
            .fields("SgpDctwseBargSys") = LogRS.fields("SgpDctwseBargSys")
            .fields("SgpPcgwseBargSys") = LogRS.fields("SgpPcgwseBargSys")
            .fields("SgpRBywseBargSys") = LogRS.fields("SgpRBywseBargSys")
            .fields("SgpRTowseBargSys") = LogRS.fields("SgpRTowseBargSys")
            .fields("SgpTimewseBargSys") = LogRS.fields("SgpTimewseBargSys")
            .fields("SgpExtShareSys") = LogRS.fields("SgpExtShareSys")
            .fields("SgpDctwseShareSys") = LogRS.fields("SgpDctwseShareSys")
            .fields("SgpPcgwseShareSys") = LogRS.fields("SgpPcgwseShareSys")
            .fields("SgpRBywseShareSys") = LogRS.fields("SgpRBywseShareSys")
            .fields("SgpRTowseShareSys") = LogRS.fields("SgpRTowseShareSys")
            .fields("SgpTimewseShareSys") = LogRS.fields("SgpTimewseShareSys")
            
        ElseIf blnServMast = True Then
            .fields("SrvSgpCode") = LogRS.fields("SrvSgpCode")
            .fields("SrvAhCode") = LogRS.fields("SrvAhCode")
            .fields("SrvIndex") = LogRS.fields("SrvIndex")
            .fields("SrvOpdGenChg") = LogRS.fields("SrvOpdGenChg")
            .fields("SrvOpdEmgChg") = LogRS.fields("SrvOpdEmgChg")
            .fields("SrvIpdGenChg") = LogRS.fields("SrvIpdGenChg")
            .fields("SrvIpdEmgChg") = LogRS.fields("SrvIpdEmgChg")
            .fields("SrvLabGenChg") = LogRS.fields("SrvLabGenChg")
            .fields("SrvLabEmgChg") = LogRS.fields("SrvLabEmgChg")
            .fields("SrvMultiDctIncl") = LogRS.fields("SrvMultiDctIncl")
            .fields("SrvAutoInsIpdBill") = LogRS.fields("SrvAutoInsIpdBill")
            .fields("SrvAutoCalcIpdBill") = LogRS.fields("SrvAutoCalcIpdBill")
            .fields("SrvUnitEditable") = LogRS.fields("SrvUnitEditable")
            .fields("SrvRateEditable") = LogRS.fields("SrvRateEditable")
            .fields("SrvAmtEditable") = LogRS.fields("SrvAmtEditable")
            .fields("SrvInfAllowed") = LogRS.fields("SrvInfAllowed")
            .fields("SrvDefAllowed") = LogRS.fields("SrvDefAllowed")
            .fields("SrvDiscAllowed") = LogRS.fields("SrvDiscAllowed")
            .fields("SrvDiscPer") = LogRS.fields("SrvDiscPer")
            .fields("SrvShowInList") = LogRS.fields("SrvShowInList")
            .fields("SrvDctwseRateSys") = LogRS.fields("SrvDctwseRateSys")
            .fields("SrvPcgwseRateSys") = LogRS.fields("SrvPcgwseRateSys")
            .fields("SrvRBywseRateSys") = LogRS.fields("SrvRBywseRateSys")
            .fields("SrvRTowseRateSys") = LogRS.fields("SrvRTowseRateSys")
            .fields("SrvTimewseRateSys") = LogRS.fields("SrvTimewseRateSys")
            .fields("SrvDctwseDiscSys") = LogRS.fields("SrvDctwseDiscSys")
            .fields("SrvPcgwseDiscSys") = LogRS.fields("SrvPcgwseDiscSys")
            .fields("SrvRBywseDiscSys") = LogRS.fields("SrvRBywseDiscSys")
            .fields("SrvRTowseDiscSys") = LogRS.fields("SrvRTowseDiscSys")
            .fields("SrvTimewseDiscSys") = LogRS.fields("SrvTimewseDiscSys")
            .fields("SrvDctwseBargSys") = LogRS.fields("SrvDctwseBargSys")
            .fields("SrvPcgwseBargSys") = LogRS.fields("SrvPcgwseBargSys")
            .fields("SrvRBywseBargSys") = LogRS.fields("SrvRBywseBargSys")
            .fields("SrvRTowseBargSys") = LogRS.fields("SrvRTowseBargSys")
            .fields("SrvTimewseBargSys") = LogRS.fields("SrvTimewseBargSys")
            .fields("SrvDctwseShareSys") = LogRS.fields("SrvDctwseShareSys")
            .fields("SrvPcgwseShareSys") = LogRS.fields("SrvPcgwseShareSys")
            .fields("SrvRBywseShareSys") = LogRS.fields("SrvRBywseShareSys")
            .fields("SrvRTowseShareSys") = LogRS.fields("SrvRTowseShareSys")
            .fields("SrvTimewseShareSys") = LogRS.fields("SrvTimewseShareSys")
        
        ElseIf blnDiagMast = True Then
            
        ElseIf blnFloorMast = True Then
            .fields("FlrShowInList") = LogRS.fields("FlrShowInList")
        
        ElseIf blnWardMast = True Then
            .fields("WrdShowInList") = LogRS.fields("WrdShowInList")
        
        ElseIf blnBedMast = True Then
            .fields("BdmFlrCode") = LogRS.fields("BdmFlrCode")
            .fields("BdmWrdCode") = LogRS.fields("BdmWrdCode")
            .fields("BdmSrvCode") = LogRS.fields("BdmSrvCode")
            .fields("BdmIndex") = LogRS.fields("BdmIndex")
            .fields("BdmCharges") = LogRS.fields("BdmCharges")
            .fields("BdmDiscAllowed") = LogRS.fields("BdmDiscAllowed")
            .fields("BdmDiscPer") = LogRS.fields("BdmDiscPer")
            .fields("BdmChkOutTimeBasis") = LogRS.fields("BdmChkOutTimeBasis")
            .fields("BdmChkTime") = LogRS.fields("BdmChkTime")
            .fields("BdmFreeAllot") = LogRS.fields("BdmFreeAllot")
            .fields("BdmRemark") = LogRS.fields("BdmRemark")
            .fields("BdmShowInList") = LogRS.fields("BdmShowInList")
            
        End If
        .Update
    Else
        ' any prior updations can be made here
        .fields(mRecStateField) = ChkDeleteRecStatus(.fields(mRecStateField))
        .Update
        .Delete
    End If
End If
End With
CloseTable tRecset
CloseTable LogRS
m_dbHmsDatabase.CommitTrans

CancelMast = True
GoTo EndSub

errhand:
MsgBox Err.Description
m_dbHmsDatabase.Cancel

EndSub:
CloseTable tRecset, mCheckOpen:=True
CloseTable LogRS, mCheckOpen:=True
Exit Function

End Function

Rem marking records for deletion
Public Function DeleteMast(ByVal mCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset
DeleteMast = False
If Chk_ActiveMast() = False Or mCode <> ActiveCode Then
    ErrorBox "No Active " & mTitleName & " Entry to Delete !!!"
    GoTo EndSub
End If
On Error GoTo errhand

m_dbHmsDatabase.BeginTrans
With tRecset
.Open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    .fields(mRecStateField) = ChkDeleteRecStatus(.fields(mRecStateField))
    .Update
Else
    ErrorBox "clsHmsServDoctEntry_DeleteMast_254"
End If
End With
CloseTable tRecset
m_dbHmsDatabase.CommitTrans

DeleteMast = True
GoTo EndSub

errhand:
MsgBox Err.Description
m_dbHmsDatabase.Cancel

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Function

End Function

Public Function SelectMast(ByVal mSdcCode As Long) As Boolean
Dim mEntryFound As Boolean
SelectMast = False
If mSdcCode < 1 Then
    ErrorBox "Invalid " & mTitleName & " Entry !!!"
    Exit Function
End If
mEntryFound = False
For mActiveMast = LBound(aMastTran) To UBound(aMastTran)
    If aMastTran(mActiveMast) = mSdcCode Then
        mEntryFound = True
        Exit For
    End If
Next mActiveMast
If mEntryFound = False Then
    mActiveMast = UBound(aMastTran) + 1
End If

SelectMast = True
End Function

Public Function NextMast() As Boolean
NextMast = False
If EOMast = True Then
    ErrorBox "End of " & mTitleName & " Entry !!!"
    Exit Function
End If
mActiveMast = mActiveMast + 1

NextMast = True
End Function

Public Function PreviousMast()
PreviousMast = False
If BOMast = True Then
    ErrorBox "Begining of " & mTitleName & " Entry !!!"
    Exit Function
End If
mActiveMast = mActiveMast - 1

PreviousMast = True
End Function

Public Function FirstMast() As Boolean
FirstMast = False
If CountMast = 0 Then
    ErrorBox "No " & mTitleName & " Entry !!!"
    Exit Function
End If
mActiveMast = LBound(aMastTran)

FirstMast = True

End Function

Public Function LastMast() As Boolean
LastMast = False
If CountMast = 0 Then
    ErrorBox "No " & mTitleName & " Entry !!!"
    Exit Function
End If
mActiveMast = UBound(aMastTran)

LastMast = True

End Function

Public Property Get CountMast() As Integer
If UBound(aMastTran) = -1 Then
    CountMast = 0
Else
    CountMast = UBound(aMastTran) - LBound(aMastTran) + 1
End If

End Property

Public Property Get EOMast() As Boolean
EOMast = (mActiveMast > UBound(aMastTran) Or UBound(aMastTran) = -1)

End Property

Public Property Get BOMast() As Boolean
BOMast = (mActiveMast < LBound(aMastTran) Or UBound(aMastTran) = -1)

End Property

Public Function Chk_ActiveMast() As Boolean
If BOMast = False And EOMast = False Then
    Chk_ActiveMast = True
Else
    Chk_ActiveMast = False
End If

End Function

Private Function Data_CreateLog(ByVal mSdcCode As Long) As Boolean
Dim LogRS As New ADODB.Recordset

Data_CreateLog = False
If Chk_ActiveMast() = False Or mSdcCode <> ActiveCode Then
    ErrorBox "No Active " & mTitleName & " Entry to Create Log !!!"
    GoTo EndSub
End If

With LogRS
.Open "Select * from " & mTableName & "_Log where " & mCodeField & "=" & CStr(mSdcCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .EOF = True Then
    m_dbHmsDatabase.BeginTrans
    m_dbHmsDatabase.Execute "Insert into " & mTableName & "_Log" & " Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mSdcCode) & ""
    m_dbHmsDatabase.CommitTrans
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

Private Function Data_RemoveLog(ByVal mSdcCode As Long) As Boolean
Data_RemoveLog = False
If Chk_ActiveMast() = False Or mSdcCode <> ActiveCode Then
    ErrorBox "No Active " & mTitleName & " Entry to Remove Log !!!"
    Exit Function
End If

m_dbHmsDatabase.BeginTrans
m_dbHmsDatabase.Execute "Delete from " & mTableName & "_Log" & " where " & mCodeField & "=" & CStr(mSdcCode)
m_dbHmsDatabase.CommitTrans

Data_RemoveLog = True

End Function

Public Sub AddNew()
Dim tRecset As New ADODB.Recordset, mCanAddNew As Boolean, mLCount As Integer, mUCount As Integer, acount As Integer
mCanAddNew = True

On Error GoTo errhand
mCode_lng = 0



If mCanAddNew = True Then

    AddToArray aSdcCode, mSdcCode_lng
    AddToArray aSdcSubCode, mSdcSubCode_lng
    AddToArray aSdcICode, mSdcICode_lng
    AddToArray aSdcSno, mSdcSno_int
    AddToArray aSdcDctCode, mSdcDctCode_lng
    AddToArray aSdcDrlCode, mSdcDrlCode_lng
    AddToArray aSdcRemark, mSdcRemark_str
    AddToArray aSdcRecState, mSdcRecState_int



    m_dbHmsDatabase.BeginTrans
    With tRecset
    .Open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(-0.1) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
    
    .AddNew
    If IsMissing(mInhCode) = False Then
        .fields(mCodeField) = mInhCode
    Else
        Rem .Fields(mCodeField) = mCode_lng AutoNumber
    End If
    
    .fields(mRecStateField) = cREC_ADDED
    
    If blnPatCatgMast = True Then
        .fields("PcgInfAllowed") = mPcgInfAllowed_bln
        .fields("PcgDefAllowed") = mPcgDefAllowed_bln
        .fields("PcgDiscAllowed") = mPcgDiscAllowed_bln
        .fields("PcgDiscPer") = mPcgDiscPer_dbl
        .fields("PcgShowInList") = mPcgShowInList_bln
    
    ElseIf blnPatMast = True Then
        .fields("PttRegNo") = mPttRegNo_lng
        .fields("PttRegDate") = mPttRegDate_dt
        .fields("PttSex") = mPttSex_str
        .fields("PttAgeAsOnDt") = mPttAgeAsOnDt_dt
        .fields("PttDob") = mPttDob_dt
        .fields("PttAhCode") = mPttAhCode_lng
        .fields("PttPcgCode") = mPttPcgCode_lng
        .fields("PttRefRela") = mPttRefRela_str
        .fields("PttRefName") = mPttRefName_str
        .fields("PttAddr") = mPttAddr_str
        .fields("PttAraCode") = mPttAraCode_lng
        .fields("PttStnCode") = mPttStnCode_lng
        .fields("PttTelNo") = mPttTelNo_str
        .fields("PttSMSNo") = mPttSMSNo_str
        .fields("PttEmail") = mPttEmail_str
        .fields("PttInfAllowed") = mPttInfAllowed_bln
        .fields("PttDefAllowed") = mPttDefAllowed_bln
        .fields("PttDiscAllowed") = mPttDiscAllowed_bln
        .fields("PttDiscPer") = mPttDiscPer_dbl
        .fields("PttShowInList") = mPttShowInList_bln
        .fields("PttRemark") = mPttRemark_str
    
    ElseIf blnDoctCatgMast = True Then
    
    ElseIf blnRefCatgMast = True Then
    
    ElseIf blnDoctMast = True Then
        .fields("DctSpeci") = mDctSpeci_str
        .fields("DctDcgCode") = mDctDcgCode_lng
        .fields("DctAddr") = mDctAddr_str
        .fields("DctTelNo") = mDctTelNo_str
        .fields("DctEmail") = mDctEmail_str
        .fields("DctAhCode") = mDctAhCode_lng
        .fields("DctShare") = mDctShare_dbl
        
    ElseIf blnDoctRoleMast = True Then
        
    ElseIf blnRefByMast = True Then
        .fields("RBySpeci") = mRBySpeci_str
        .fields("RByRfgCode") = mRByRfgCode_lng
        .fields("RByAddr") = mRByAddr_str
        .fields("RByTelNo") = mRByTelNo_str
        .fields("RByEmail") = mRByEmail_str
        .fields("RByAhCode") = mRByAhCode_lng
        .fields("RByShare") = mRByShare_dbl
        
    ElseIf blnRefToMast = True Then
        .fields("RToSpeci") = mRToSpeci_str
        .fields("RToRfgCode") = mRToRfgCode_lng
        .fields("RToAddr") = mRToAddr_str
        .fields("RToTelNo") = mRToTelNo_str
        .fields("RToEmail") = mRToEmail_str
        .fields("RToAhCode") = mRToAhCode_lng
        .fields("RToShare") = mRToShare_dbl
        
    ElseIf blnServGrpMast = True Then
        .fields("SgpIndex") = mSgpIndex_int
        .fields("SgpExpanded") = mSgpExpanded_bln
        .fields("SgpEditable") = mSgpEditable_bln
        .fields("SgpShowInList") = mSgpShowInList_bln
        .fields("SgpExtRateSys") = mSgpExtRateSys_bln
        .fields("SgpDctwseRateSys") = mSgpDctwseRateSys_bln
        .fields("SgpPcgwseRateSys") = mSgpPcgwseRateSys_bln
        .fields("SgpRBywseRateSys") = mSgpRBywseRateSys_bln
        .fields("SgpRTowseRateSys") = mSgpRTowseRateSys_bln
        .fields("SgpTimewseRateSys") = mSgpTimewseRateSys_bln
        .fields("SgpExtDiscSys") = mSgpExtDiscSys_bln
        .fields("SgpDctwseDiscSys") = mSgpDctwseDiscSys_bln
        .fields("SgpPcgwseDiscSys") = mSgpPcgwseDiscSys_bln
        .fields("SgpRBywseDiscSys") = mSgpRBywseDiscSys_bln
        .fields("SgpRTowseDiscSys") = mSgpRTowseDiscSys_bln
        .fields("SgpTimewseDiscSys") = mSgpTimewseDiscSys_bln
        .fields("SgpExtBargSys") = mSgpExtBargSys_bln
        .fields("SgpDctwseBargSys") = mSgpDctwseBargSys_bln
        .fields("SgpPcgwseBargSys") = mSgpPcgwseBargSys_bln
        .fields("SgpRBywseBargSys") = mSgpRBywseBargSys_bln
        .fields("SgpRTowseBargSys") = mSgpRTowseBargSys_bln
        .fields("SgpTimewseBargSys") = mSgpTimewseBargSys_bln
        .fields("SgpExtShareSys") = mSgpExtShareSys_bln
        .fields("SgpDctwseShareSys") = mSgpDctwseShareSys_bln
        .fields("SgpPcgwseShareSys") = mSgpPcgwseShareSys_bln
        .fields("SgpRBywseShareSys") = mSgpRBywseShareSys_bln
        .fields("SgpRTowseShareSys") = mSgpRTowseShareSys_bln
        .fields("SgpTimewseShareSys") = mSgpTimewseShareSys_bln
        
    ElseIf blnServMast = True Then
        .fields("SrvSgpCode") = mSrvSgpCode_lng
        .fields("SrvAhCode") = mSrvAhCode_lng
        .fields("SrvIndex") = mSrvIndex_int
        .fields("SrvOpdGenChg") = mSrvOpdGenChg_dbl
        .fields("SrvOpdEmgChg") = mSrvOpdEmgChg_dbl
        .fields("SrvIpdGenChg") = mSrvIpdGenChg_dbl
        .fields("SrvIpdEmgChg") = mSrvIpdEmgChg_dbl
        .fields("SrvLabGenChg") = mSrvLabGenChg_dbl
        .fields("SrvLabEmgChg") = mSrvLabEmgChg_dbl
        .fields("SrvMultiDctIncl") = mSrvMultiDctIncl_bln
        .fields("SrvAutoInsIpdBill") = mSrvAutoInsIpdBill_bln
        .fields("SrvAutoCalcIpdBill") = mSrvAutoCalcIpdBill_bln
        .fields("SrvUnitEditable") = mSrvUnitEditable_bln
        .fields("SrvRateEditable") = mSrvRateEditable_bln
        .fields("SrvAmtEditable") = mSrvAmtEditable_bln
        .fields("SrvInfAllowed") = mSrvInfAllowed_bln
        .fields("SrvDefAllowed") = mSrvDefAllowed_bln
        .fields("SrvDiscAllowed") = mSrvDiscAllowed_bln
        .fields("SrvDiscPer") = mSrvDiscPer_dbl
        .fields("SrvShowInList") = mSrvShowInList_bln
        .fields("SrvDctwseRateSys") = mSrvDctwseRateSys_bln
        .fields("SrvPcgwseRateSys") = mSrvPcgwseRateSys_bln
        .fields("SrvRBywseRateSys") = mSrvRBywseRateSys_bln
        .fields("SrvRTowseRateSys") = mSrvRTowseRateSys_bln
        .fields("SrvTimewseRateSys") = mSrvTimewseRateSys_bln
        .fields("SrvDctwseDiscSys") = mSrvDctwseDiscSys_bln
        .fields("SrvPcgwseDiscSys") = mSrvPcgwseDiscSys_bln
        .fields("SrvRBywseDiscSys") = mSrvRBywseDiscSys_bln
        .fields("SrvRTowseDiscSys") = mSrvRTowseDiscSys_bln
        .fields("SrvTimewseDiscSys") = mSrvTimewseDiscSys_bln
        .fields("SrvDctwseBargSys") = mSrvDctwseBargSys_bln
        .fields("SrvPcgwseBargSys") = mSrvPcgwseBargSys_bln
        .fields("SrvRBywseBargSys") = mSrvRBywseBargSys_bln
        .fields("SrvRTowseBargSys") = mSrvRTowseBargSys_bln
        .fields("SrvTimewseBargSys") = mSrvTimewseBargSys_bln
        .fields("SrvDctwseShareSys") = mSrvDctwseShareSys_bln
        .fields("SrvPcgwseShareSys") = mSrvPcgwseShareSys_bln
        .fields("SrvRBywseShareSys") = mSrvRBywseShareSys_bln
        .fields("SrvRTowseShareSys") = mSrvRTowseShareSys_bln
        .fields("SrvTimewseShareSys") = mSrvTimewseShareSys_bln
    
    ElseIf blnDiagMast = True Then
    
    ElseIf blnFloorMast = True Then
        .fields("FlrShowInList") = mFlrShowInList_bln
    
    ElseIf blnWardMast = True Then
        .fields("WrdShowInList") = mWrdShowInList_bln
    
    ElseIf blnBedMast = True Then
        .fields("BdmFlrCode") = mBdmFlrCode_lng
        .fields("BdmWrdCode") = mBdmWrdCode_lng
        .fields("BdmSrvCode") = mBdmSrvCode_lng
        .fields("BdmIndex") = mBdmIndex_int
        .fields("BdmCharges") = mBdmCharges_dbl
        .fields("BdmDiscAllowed") = mBdmDiscAllowed_bln
        .fields("BdmDiscPer") = mBdmDiscPer_sng
        .fields("BdmChkOutTimeBasis") = mBdmChkOutTimeBasis_int
        .fields("BdmChkTime") = mBdmChkTime_lng
        .fields("BdmFreeAllot") = mBdmFreeAllot_bln
        .fields("BdmRemark") = mBdmRemark_str
        .fields("BdmShowInList") = mBdmShowInList_bln
        
    End If
    .Update
    mCode_lng = .fields(mCodeField)
    aMastTran(mActiveMast) = mCode_lng
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

Public Sub Update(ByVal mCode As Long)
Dim tRecset As New ADODB.Recordset, mCanUpdate As Boolean, mLCount As Integer, mUCount As Integer, acount As Integer
mCanUpdate = True

If mNameField <> "" And blnPatMast = False Then   ' patient duplicate checking is to be avoided
    tRecset.Open "Select " & mNameField & " from " & mTableName & " where " & mNameField & "='" & mName_str & "' and " & mCodeField & "<>" & CStr(mCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.EOF = False Then
        mCanUpdate = False
        ErrorBox "Duplicate Name !!!"
    End If
    CloseTable tRecset
End If

On Error GoTo errhand
mCode_lng = 0
If mCanUpdate = True Then
    m_dbHmsDatabase.BeginTrans
    With tRecset
    .Open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
    
    If mNameField <> "" Then
        .fields(mNameField) = mName_str
    End If
    .fields(mRecStateField) = ChkEditRecStatus(.fields(mRecStateField))
    
    If blnPatCatgMast = True Then
        .fields("PcgInfAllowed") = mPcgInfAllowed_bln
        .fields("PcgDefAllowed") = mPcgDefAllowed_bln
        .fields("PcgDiscAllowed") = mPcgDiscAllowed_bln
        .fields("PcgDiscPer") = mPcgDiscPer_dbl
        .fields("PcgShowInList") = mPcgShowInList_bln
    
    ElseIf blnPatMast = True Then
        .fields("PttRegNo") = mPttRegNo_lng
        .fields("PttRegDate") = mPttRegDate_dt
        .fields("PttSex") = mPttSex_str
        .fields("PttAgeAsOnDt") = mPttAgeAsOnDt_dt
        .fields("PttDob") = mPttDob_dt
        .fields("PttAhCode") = mPttAhCode_lng
        .fields("PttPcgCode") = mPttPcgCode_lng
        .fields("PttRefRela") = mPttRefRela_str
        .fields("PttRefName") = mPttRefName_str
        .fields("PttAddr") = mPttAddr_str
        .fields("PttAraCode") = mPttAraCode_lng
        .fields("PttStnCode") = mPttStnCode_lng
        .fields("PttTelNo") = mPttTelNo_str
        .fields("PttSMSNo") = mPttSMSNo_str
        .fields("PttEmail") = mPttEmail_str
        .fields("PttInfAllowed") = mPttInfAllowed_bln
        .fields("PttDefAllowed") = mPttDefAllowed_bln
        .fields("PttDiscAllowed") = mPttDiscAllowed_bln
        .fields("PttDiscPer") = mPttDiscPer_dbl
        .fields("PttShowInList") = mPttShowInList_bln
        .fields("PttRemark") = mPttRemark_str
        
    ElseIf blnDoctCatgMast = True Then
    
    ElseIf blnRefCatgMast = True Then
    
    ElseIf blnDoctMast = True Then
        .fields("DctSpeci") = mDctSpeci_str
        .fields("DctDcgCode") = mDctDcgCode_lng
        .fields("DctAddr") = mDctAddr_str
        .fields("DctTelNo") = mDctTelNo_str
        .fields("DctEmail") = mDctEmail_str
        .fields("DctAhCode") = mDctAhCode_lng
        .fields("DctShare") = mDctShare_dbl
        
    ElseIf blnDoctRoleMast = True Then
        
    ElseIf blnRefByMast = True Then
        .fields("RBySpeci") = mRBySpeci_str
        .fields("RByRfgCode") = mRByRfgCode_lng
        .fields("RByAddr") = mRByAddr_str
        .fields("RByTelNo") = mRByTelNo_str
        .fields("RByEmail") = mRByEmail_str
        .fields("RByAhCode") = mRByAhCode_lng
        .fields("RByShare") = mRByShare_dbl
        
    ElseIf blnRefToMast = True Then
        .fields("RToSpeci") = mRToSpeci_str
        .fields("RToRfgCode") = mRToRfgCode_lng
        .fields("RToAddr") = mRToAddr_str
        .fields("RToTelNo") = mRToTelNo_str
        .fields("RToEmail") = mRToEmail_str
        .fields("RToAhCode") = mRToAhCode_lng
        .fields("RToShare") = mRToShare_dbl
        
    ElseIf blnServGrpMast = True Then
        .fields("SgpIndex") = mSgpIndex_int
        .fields("SgpExpanded") = mSgpExpanded_bln
        .fields("SgpEditable") = mSgpEditable_bln
        .fields("SgpShowInList") = mSgpShowInList_bln
        .fields("SgpExtRateSys") = mSgpExtRateSys_bln
        .fields("SgpDctwseRateSys") = mSgpDctwseRateSys_bln
        .fields("SgpPcgwseRateSys") = mSgpPcgwseRateSys_bln
        .fields("SgpRBywseRateSys") = mSgpRBywseRateSys_bln
        .fields("SgpRTowseRateSys") = mSgpRTowseRateSys_bln
        .fields("SgpTimewseRateSys") = mSgpTimewseRateSys_bln
        .fields("SgpExtDiscSys") = mSgpExtDiscSys_bln
        .fields("SgpDctwseDiscSys") = mSgpDctwseDiscSys_bln
        .fields("SgpPcgwseDiscSys") = mSgpPcgwseDiscSys_bln
        .fields("SgpRBywseDiscSys") = mSgpRBywseDiscSys_bln
        .fields("SgpRTowseDiscSys") = mSgpRTowseDiscSys_bln
        .fields("SgpTimewseDiscSys") = mSgpTimewseDiscSys_bln
        .fields("SgpExtBargSys") = mSgpExtBargSys_bln
        .fields("SgpDctwseBargSys") = mSgpDctwseBargSys_bln
        .fields("SgpPcgwseBargSys") = mSgpPcgwseBargSys_bln
        .fields("SgpRBywseBargSys") = mSgpRBywseBargSys_bln
        .fields("SgpRTowseBargSys") = mSgpRTowseBargSys_bln
        .fields("SgpTimewseBargSys") = mSgpTimewseBargSys_bln
        .fields("SgpExtShareSys") = mSgpExtShareSys_bln
        .fields("SgpDctwseShareSys") = mSgpDctwseShareSys_bln
        .fields("SgpPcgwseShareSys") = mSgpPcgwseShareSys_bln
        .fields("SgpRBywseShareSys") = mSgpRBywseShareSys_bln
        .fields("SgpRTowseShareSys") = mSgpRTowseShareSys_bln
        .fields("SgpTimewseShareSys") = mSgpTimewseShareSys_bln
        
    ElseIf blnServMast = True Then
        .fields("SrvSgpCode") = mSrvSgpCode_lng
        .fields("SrvAhCode") = mSrvAhCode_lng
        .fields("SrvIndex") = mSrvIndex_int
        .fields("SrvOpdGenChg") = mSrvOpdGenChg_dbl
        .fields("SrvOpdEmgChg") = mSrvOpdEmgChg_dbl
        .fields("SrvIpdGenChg") = mSrvIpdGenChg_dbl
        .fields("SrvIpdEmgChg") = mSrvIpdEmgChg_dbl
        .fields("SrvLabGenChg") = mSrvLabGenChg_dbl
        .fields("SrvLabEmgChg") = mSrvLabEmgChg_dbl
        .fields("SrvMultiDctIncl") = mSrvMultiDctIncl_bln
        .fields("SrvAutoInsIpdBill") = mSrvAutoInsIpdBill_bln
        .fields("SrvAutoCalcIpdBill") = mSrvAutoCalcIpdBill_bln
        .fields("SrvUnitEditable") = mSrvUnitEditable_bln
        .fields("SrvRateEditable") = mSrvRateEditable_bln
        .fields("SrvAmtEditable") = mSrvAmtEditable_bln
        .fields("SrvInfAllowed") = mSrvInfAllowed_bln
        .fields("SrvDefAllowed") = mSrvDefAllowed_bln
        .fields("SrvDiscAllowed") = mSrvDiscAllowed_bln
        .fields("SrvDiscPer") = mSrvDiscPer_dbl
        .fields("SrvShowInList") = mSrvShowInList_bln
        .fields("SrvDctwseRateSys") = mSrvDctwseRateSys_bln
        .fields("SrvPcgwseRateSys") = mSrvPcgwseRateSys_bln
        .fields("SrvRBywseRateSys") = mSrvRBywseRateSys_bln
        .fields("SrvRTowseRateSys") = mSrvRTowseRateSys_bln
        .fields("SrvTimewseRateSys") = mSrvTimewseRateSys_bln
        .fields("SrvDctwseDiscSys") = mSrvDctwseDiscSys_bln
        .fields("SrvPcgwseDiscSys") = mSrvPcgwseDiscSys_bln
        .fields("SrvRBywseDiscSys") = mSrvRBywseDiscSys_bln
        .fields("SrvRTowseDiscSys") = mSrvRTowseDiscSys_bln
        .fields("SrvTimewseDiscSys") = mSrvTimewseDiscSys_bln
        .fields("SrvDctwseBargSys") = mSrvDctwseBargSys_bln
        .fields("SrvPcgwseBargSys") = mSrvPcgwseBargSys_bln
        .fields("SrvRBywseBargSys") = mSrvRBywseBargSys_bln
        .fields("SrvRTowseBargSys") = mSrvRTowseBargSys_bln
        .fields("SrvTimewseBargSys") = mSrvTimewseBargSys_bln
        .fields("SrvDctwseShareSys") = mSrvDctwseShareSys_bln
        .fields("SrvPcgwseShareSys") = mSrvPcgwseShareSys_bln
        .fields("SrvRBywseShareSys") = mSrvRBywseShareSys_bln
        .fields("SrvRTowseShareSys") = mSrvRTowseShareSys_bln
        .fields("SrvTimewseShareSys") = mSrvTimewseShareSys_bln
        
    ElseIf blnDiagMast = True Then
        
    ElseIf blnFloorMast = True Then
        .fields("FlrShowInList") = mFlrShowInList_bln
    
    ElseIf blnWardMast = True Then
        .fields("WrdShowInList") = mWrdShowInList_bln
    
    ElseIf blnBedMast = True Then
        .fields("BdmFlrCode") = mBdmFlrCode_lng
        .fields("BdmWrdCode") = mBdmWrdCode_lng
        .fields("BdmSrvCode") = mBdmSrvCode_lng
        .fields("BdmIndex") = mBdmIndex_int
        .fields("BdmCharges") = mBdmCharges_dbl
        .fields("BdmDiscAllowed") = mBdmDiscAllowed_bln
        .fields("BdmDiscPer") = mBdmDiscPer_sng
        .fields("BdmChkOutTimeBasis") = mBdmChkOutTimeBasis_int
        .fields("BdmChkTime") = mBdmChkTime_lng
        .fields("BdmFreeAllot") = mBdmFreeAllot_bln
        .fields("BdmRemark") = mBdmRemark_str
        .fields("BdmShowInList") = mBdmShowInList_bln
        
    End If
    .Update
    mCode_lng = .fields(mCodeField)
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

Public Function CanDeleteMast(ByVal mCode As Long, Optional ByVal mSkipConfirm As Boolean) As Boolean
Dim mDeleteit As Boolean

mDeleteit = True

If ChkEntryExist(mCode) = True Then
    ErrorBox "Entry Exist !!!"
    mDeleteit = False
End If
If mDeleteit = True And mSkipConfirm = False Then
    mDeleteit = CanDelete()
End If

CanDeleteMast = mDeleteit

End Function

Rem returns item name for either item code or item reference
Public Function GetName(ByVal mCode As Long) As String
Dim tRecset As New ADODB.Recordset, mRtnval As String

mRtnval = ""
If mNameField <> "" Then
    With tRecset
    .Open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount > 0 Then
        mRtnval = .fields(mNameField)
    End If
    End With
    CloseTable tRecset
Else

End If
GetName = mRtnval

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Function

End Function

Public Function ChkEntryExist(ByVal mCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset

If blnPatCatgMast = True Then
    With tRecset
    .Open "Select * from PatMast where PttPcgCode=" & CStr(mCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        ChkEntryExist = True
        ErrorBox "Used in Patient Master " & .fields("PttName")
    End If
    End With
    CloseTable tRecset
    
ElseIf blnPatMast = True Then
    With tRecset
    .Open "Select * from OutdReg where OpgPttCode=" & CStr(mCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        ChkEntryExist = True
        ErrorBox "Used in Outdoor Registration " & CStr(.fields("OpgVchNo")) & " dated " & Dtoc(.fields("OpgDate"))
    End If
    End With
    CloseTable tRecset

ElseIf blnDoctCatgMast = True Then
    With tRecset
    .Open "Select * from DoctMast where DctDcgCode=" & CStr(mCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        ChkEntryExist = True
        ErrorBox "Used in Doctor Master " & .fields("DctName")
    End If
    End With
    CloseTable tRecset
    
ElseIf blnRefCatgMast = True Then
    With tRecset
    .Open "Select * from RefByMast where RByRfgCode=" & CStr(mCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        ChkEntryExist = True
        ErrorBox "Used in Referred By Master " & .fields("RByName")
    End If
    End With
    CloseTable tRecset
    If ChkEntryExist = False Then
        With tRecset
        .Open "Select * from RefToMast where RToRfgCode=" & CStr(mCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            ChkEntryExist = True
            ErrorBox "Used in Referred To Master " & .fields("RToName")
        End If
        End With
        CloseTable tRecset
    End If
    
ElseIf blnDoctMast = True Then
    With tRecset
    .Open "Select * from OutdReg where OpgCDctCode=" & CStr(mCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        ChkEntryExist = True
        ErrorBox "Used in Outdoor Registration " & CStr(.fields("OpgVchNo")) & " dated " & Dtoc(.fields("OpgDate"))
    End If
    End With
    CloseTable tRecset
    If ChkEntryExist = False Then
        With tRecset
        .Open "Select * from IndrReg where IpgCDctCode=" & CStr(mCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            ChkEntryExist = True
            ErrorBox "Used in Indoor Registration " & CStr(.fields("IpgVchNo")) & " dated " & Dtoc(.fields("IpgDate"))
        End If
        End With
        CloseTable tRecset
    End If
    If ChkEntryExist = False Then
        With tRecset
        .Open "Select * from (OutdRcDctDtl as ord inner join OutdRcpt as orc on ord.OrdOrcCode=orc.OrcICode) inner join OutdHdr as ohr on orc.OrcCode=ohr.OhrCode where OrdDctCode=" & CStr(mCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            ChkEntryExist = True
            ErrorBox "Used in Outdoor Receipt Service Doctors " & CStr(.fields("OhrVchNo")) & " dated " & Dtoc(.fields("OhrDate"))
        End If
        End With
        CloseTable tRecset
    End If
    If ChkEntryExist = False Then
        With tRecset
        .Open "Select * from (OutdBlDctDtl as obd inner join OutdBill as obl on obd.ObdOblCode=obl.OblICode) inner join OutdBlHdr as obh on obl.OblCode=obh.ObhCode where ObdDctCode=" & CStr(mCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            ChkEntryExist = True
            ErrorBox "Used in Outdoor Bill Service Doctors " & CStr(.fields("ObhVchNo")) & " dated " & Dtoc(.fields("ObhDate"))
        End If
        End With
        CloseTable tRecset
    End If
    If ChkEntryExist = False Then
        With tRecset
        .Open "Select * from (IndrRcDctDtl as ird inner join IndrRcpt as irc on ird.IrdIrcCode=irc.IrcICode) inner join IndrHdr as ihr on irc.IrcCode=ihr.IhrCode where IrdDctCode=" & CStr(mCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            ChkEntryExist = True
            ErrorBox "Used in Indoor Receipt Service Doctors " & CStr(.fields("IhrVchNo")) & " dated " & Dtoc(.fields("IhrDate"))
        End If
        End With
        CloseTable tRecset
    End If
    If ChkEntryExist = False Then
        With tRecset
        .Open "Select * from (IndrBlDctDtl as ibd inner join IndrBill as ibl on ibd.IbdIblCode=ibl.IblICode) inner join IndrBlHdr as ibh on ibl.IblCode=ibh.IbhCode where IbdDctCode=" & CStr(mCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            ChkEntryExist = True
            ErrorBox "Used in Indoor Bill Service Doctors " & CStr(.fields("IbhVchNo")) & " dated " & Dtoc(.fields("IbhDate"))
        End If
        End With
        CloseTable tRecset
    End If
    
ElseIf blnDoctRoleMast = True Then
    With tRecset
    .Open "Select * from (OutdRcDctDtl as ord inner join OutdRcpt as orc on ord.OrdOrcCode=orc.OrcICode) inner join OutdHdr as ohr on orc.OrcCode=ohr.OhrCode where OrdDrlCode=" & CStr(mCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        ChkEntryExist = True
        ErrorBox "Used in Outdoor Receipt Service Doctors " & CStr(.fields("OhrVchNo")) & " dated " & Dtoc(.fields("OhrDate"))
    End If
    End With
    CloseTable tRecset
    If ChkEntryExist = False Then
        With tRecset
        .Open "Select * from (OutdBlDctDtl as obd inner join OutdBill as obl on obd.ObdOblCode=obl.OblICode) inner join OutdBlHdr as obh on obl.OblCode=obh.ObhCode where ObdDrlCode=" & CStr(mCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            ChkEntryExist = True
            ErrorBox "Used in Outdoor Bill Service Doctors " & CStr(.fields("ObhVchNo")) & " dated " & Dtoc(.fields("ObhDate"))
        End If
        End With
        CloseTable tRecset
    End If
    If ChkEntryExist = False Then
        With tRecset
        .Open "Select * from (IndrRcDctDtl as ird inner join IndrRcpt as irc on ird.IrdIrcCode=irc.IrcICode) inner join IndrHdr as ihr on irc.IrcCode=ihr.IhrCode where IrdDrlCode=" & CStr(mCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            ChkEntryExist = True
            ErrorBox "Used in Indoor Receipt Service Doctors " & CStr(.fields("IhrVchNo")) & " dated " & Dtoc(.fields("IhrDate"))
        End If
        End With
        CloseTable tRecset
    End If
    If ChkEntryExist = False Then
        With tRecset
        .Open "Select * from (IndrBlDctDtl as ibd inner join IndrBill as ibl on ibd.IbdIblCode=ibl.IblICode) inner join IndrBlHdr as ibh on ibl.IblCode=ibh.IbhCode where IbdDrlCode=" & CStr(mCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            ChkEntryExist = True
            ErrorBox "Used in Indoor Bill Service Doctors " & CStr(.fields("IbhVchNo")) & " dated " & Dtoc(.fields("IbhDate"))
        End If
        End With
        CloseTable tRecset
    End If
    
ElseIf blnRefByMast = True Or blnRefToMast = True Then
    With tRecset
    .Open "Select * from OutdReg where OpgRByCode=" & CStr(mCode) & " or OpgRToCode=" & CStr(mCode) & " order by OpgDate Desc,OpgVchNo Desc", m_dbHmsDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        ChkEntryExist = True
        ErrorBox "Used in Outdoor Registration " & CStr(.fields("OpgVchNo")) & " dated " & Dtoc(.fields("OpgDate"))
    End If
    End With
    CloseTable tRecset
    If ChkEntryExist = False Then
        With tRecset
        .Open "Select * from IndrReg where IpgRByCode=" & CStr(mCode) & " or IpgRToCode=" & CStr(mCode) & " order by IpgDate Desc,IpgVchNo Desc", m_dbHmsDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            ChkEntryExist = True
            ErrorBox "Used in Indoor Registration " & CStr(.fields("IpgVchNo")) & " dated " & Dtoc(.fields("IpgDate"))
        End If
        End With
        CloseTable tRecset
    End If
    
ElseIf blnServGrpMast = True Then
    With tRecset
    .Open "Select * from ServMast where SrvSgpCode=" & CStr(mCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        ChkEntryExist = True
        ErrorBox "Used in Service Master " & .fields("SrvName")
    End If
    End With
    CloseTable tRecset
    
ElseIf blnServMast = True Then
    With tRecset
    .Open "Select * from OutdReg where OpgSrvCode=" & CStr(mCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        ChkEntryExist = True
        ErrorBox "Used in Outdoor Registration " & CStr(.fields("OpgVchNo")) & " dated " & Dtoc(.fields("OpgDate"))
    End If
    End With
    CloseTable tRecset
    If ChkEntryExist = False Then
        With tRecset
        .Open "Select top 1 * from OutdRcpt as dtl inner join OutdHdr as hdr on dtl.OrcCode=hdr.OhrCode where OrcSrvCode=" & CStr(mCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            ChkEntryExist = True
            ErrorBox "Used in Outdoor Receipt " & CStr(.fields("OhrVchNo")) & " dated " & Dtoc(.fields("OhrDate"))
        End If
        End With
        CloseTable tRecset
    End If
    If ChkEntryExist = False Then
        With tRecset
        .Open "Select top 1 * from OutdBill as dtl inner join OutdBlHdr as hdr on dtl.OblCode=hdr.ObhCode where OblSrvCode=" & CStr(mCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            ChkEntryExist = True
            ErrorBox "Used in Outdoor Bill " & CStr(.fields("ObhVchNo")) & " dated " & Dtoc(.fields("ObhDate"))
        End If
        End With
        CloseTable tRecset
    End If
    If ChkEntryExist = False Then
        With tRecset
        .Open "Select top 1 * from IndrRcpt as dtl inner join IndrHdr as hdr on dtl.IrcCode=hdr.IhrCode where IrcSrvCode=" & CStr(mCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            ChkEntryExist = True
            ErrorBox "Used in Indoor Receipt " & CStr(.fields("IhrVchNo")) & " dated " & Dtoc(.fields("IhrDate"))
        End If
        End With
        CloseTable tRecset
    End If
    If ChkEntryExist = False Then
        With tRecset
        .Open "Select top 1 * from IndrBill as dtl inner join IndrBlHdr as hdr on dtl.IblCode=hdr.IbhCode where IblSrvCode=" & CStr(mCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            ChkEntryExist = True
            ErrorBox "Used in Indoor Bill " & CStr(.fields("IbhVchNo")) & " dated " & Dtoc(.fields("IbhDate"))
        End If
        End With
        CloseTable tRecset
    End If
    
ElseIf blnDiagMast = True Then
    With tRecset
    .Open "Select * from OutdReg where OpgFDigCode=" & CStr(mCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        ChkEntryExist = True
        ErrorBox "Used in Outdoor Registration " & CStr(.fields("OpgVchNo")) & " dated " & Dtoc(.fields("OpgDate"))
    End If
    End With
    CloseTable tRecset
    If ChkEntryExist = False Then
        With tRecset
        .Open "Select * from IndrReg where IpgFDigCode=" & CStr(mCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            ChkEntryExist = True
            ErrorBox "Used in Indoor Registration " & CStr(.fields("IpgVchNo")) & " dated " & Dtoc(.fields("IpgDate"))
        End If
        End With
        CloseTable tRecset
    End If
    
ElseIf blnFloorMast = True Then
    With tRecset
    .Open "Select * from BedMast where BdmFlrCode=" & CStr(mCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        ChkEntryExist = True
        ErrorBox "Used in Bed Master " & .fields("BdmName")
    End If
    End With
    CloseTable tRecset
    
ElseIf blnWardMast = True Then
    With tRecset
    .Open "Select * from BedMast where BdmWrdCode=" & CStr(mCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        ChkEntryExist = True
        ErrorBox "Used in Bed Master " & .fields("BdmName")
    End If
    End With
    CloseTable tRecset

ElseIf blnBedMast = True Then
    With tRecset
    .Open "Select * from IndrReg where IpgBdmCode=" & CStr(mCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        ChkEntryExist = True
        ErrorBox "Used in Indoor Registration " & CStr(.fields("IpgVchNo")) & " dated " & Dtoc(.fields("IpgDate"))
    End If
    End With
    CloseTable tRecset
    If ChkEntryExist = False Then
        With tRecset
        .Open "Select * from IBedState t1 inner join IndrReg t2 on t1.IbsIpgCode=t2.IpgCode where IbsBdmCode=" & CStr(mCode) & "", m_dbHmsDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            ChkEntryExist = True
            ErrorBox "Used in Indoor Bed Shifting(Status) Indoor Reg.No." & CStr(.fields("IpgVchNo")) & " dated " & Dtoc(.fields("IpgDate"))
        End If
        End With
        CloseTable tRecset
    End If
    
Else
    ErrorBox "clsHmsServDoctEntry_ChkEntryExist_#1001_[Undefined Case]"
End If

'MsgBox "ChkEntryExist Pending !!!"

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Function

End Function

