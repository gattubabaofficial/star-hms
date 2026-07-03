VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsVgnMasterEntry"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False

Option Explicit

Dim m_dbVgnDatabase As ADODB.Connection, m_dbAcDatabase As ADODB.Connection, m_dbStDatabase As ADODB.Connection, m_dbComDatabase As ADODB.Connection
Dim mTableName As String, mCodeField As String, mNameField As String, mRecStateField As String, mTitleName As String
Dim mClassUIdCode As Long, mClassUIdFileName As String, mClassAcsPermFileName As String
Public blnPatCatgMast As Boolean, blnPatMast As Boolean, blnDoctCatgMast As Boolean, blnRefCatgMast As Boolean, blnDoctMast As Boolean, blnDoctRoleMast As Boolean, blnRefByMast As Boolean, blnRefToMast As Boolean, blnServGrpMast As Boolean, blnServMast As Boolean, blnDiagMast As Boolean, blnFloorMast As Boolean, blnWardMast As Boolean, blnBedMast As Boolean
Public blnMedPrtMast As Boolean, blnMedPrtGrpMast As Boolean, blnMedItmMast As Boolean, blnMedItmGrpMast As Boolean, blnMonthRepFmt1stMast As Boolean, blnMonthRepFmt2ndMast As Boolean

Public mCode_lng As Long, mName_str As String
Public mPcgInfAllowed_bln As Boolean, mPcgDefAllowed_bln As Boolean, mPcgDiscAllowed_bln As Boolean, mPcgDiscPer_dbl As Double, mPcgShowInList_bln As Boolean
Public mDctTitle_str As String, mDctSpeci_str As String, mDctDcgCode_lng As Long, mDctDrlCode_lng As Long, mDctAddr_str As String, mDctTelNo_str As String, mDctEmail_str As String, mDctAhCode_lng As Long, mDctShare_dbl As Double
Public mRBySpeci_str As String, mRByRfgCode_lng As Long, mRByAddr_str As String, mRByTelNo_str As String, mRByEmail_str As String, mRByAhCode_lng As Long, mRByShare_dbl As Double
Public mRToSpeci_str As String, mRToRfgCode_lng As Long, mRToAddr_str As String, mRToTelNo_str As String, mRToEmail_str As String, mRToAhCode_lng As Long, mRToShare_dbl As Double
Public mSgpIndex_int As Integer, mSgpInfAllowed_bln As Boolean, mSgpDefAllowed_bln As Boolean, mSgpDiscAllowed_bln As Boolean, mSgpDiscPer_dbl As Double, mSgpExpanded_bln As Boolean, mSgpEditable_bln As Boolean, mSgpShowInList_bln As Boolean
Public mSgpExtRateSys_bln As Boolean, mSgpDctwseRateSys_bln As Boolean, mSgpPcgwseRateSys_bln As Boolean, mSgpRBywseRateSys_bln As Boolean, mSgpRTowseRateSys_bln As Boolean, mSgpTimewseRateSys_bln As Boolean, mSgpExtDiscSys_bln As Boolean, mSgpDctwseDiscSys_bln As Boolean, mSgpPcgwseDiscSys_bln As Boolean, mSgpRBywseDiscSys_bln As Boolean, mSgpRTowseDiscSys_bln As Boolean, mSgpTimewseDiscSys_bln As Boolean, mSgpExtBargSys_bln As Boolean, mSgpDctwseBargSys_bln As Boolean, mSgpPcgwseBargSys_bln As Boolean, mSgpRBywseBargSys_bln As Boolean, mSgpRTowseBargSys_bln As Boolean, mSgpTimewseBargSys_bln As Boolean, mSgpExtShareSys_bln As Boolean, mSgpDctwseShareSys_bln As Boolean, mSgpPcgwseShareSys_bln As Boolean, mSgpRBywseShareSys_bln As Boolean, mSgpRTowseShareSys_bln As Boolean, mSgpTimewseShareSys_bln As Boolean
Public mSrvSgpCode_lng As Long, mSrvAhCode_lng As Long, mSrvIndex_int As Integer, mSrvRate_dbl As Double, mSrvOpdGenChg_dbl As Double, mSrvOpdEmgChg_dbl As Double, mSrvIpdGenChg_dbl As Double, mSrvIpdEmgChg_dbl As Double, mSrvLabGenChg_dbl As Double, mSrvLabEmgChg_dbl As Double, mSrvMultiDctIncl_bln As Boolean, mSrvAutoInsIpdBill_bln As Boolean, mSrvAutoCalcIpdBill_bln As Boolean, mSrvAutoInsOnceIpdBill_bln As Boolean, mSrvUnitEditable_bln As Boolean, mSrvRateEditable_bln As Boolean, mSrvAmtEditable_bln As Boolean, mSrvInfAllowed_bln As Boolean, mSrvDefAllowed_bln As Boolean, mSrvDiscAllowed_bln As Boolean, mSrvDiscPer_dbl As Double, mSrvShowInList_bln As Boolean
Public mSrvDctwseRateSys_bln As Boolean, mSrvPcgwseRateSys_bln As Boolean, mSrvRBywseRateSys_bln As Boolean, mSrvRTowseRateSys_bln As Boolean, mSrvTimewseRateSys_bln As Boolean, mSrvDctwseDiscSys_bln As Boolean, mSrvPcgwseDiscSys_bln As Boolean, mSrvRBywseDiscSys_bln As Boolean, mSrvRTowseDiscSys_bln As Boolean, mSrvTimewseDiscSys_bln As Boolean, mSrvDctwseBargSys_bln As Boolean, mSrvPcgwseBargSys_bln As Boolean, mSrvRBywseBargSys_bln As Boolean, mSrvRTowseBargSys_bln As Boolean, mSrvTimewseBargSys_bln As Boolean, mSrvDctwseShareSys_bln As Boolean, mSrvPcgwseShareSys_bln As Boolean, mSrvRBywseShareSys_bln As Boolean, mSrvRTowseShareSys_bln As Boolean, mSrvTimewseShareSys_bln As Boolean
Public mPttRegNo_lng As Long, mPttRegDate_dt As Date, mPttSex_str As String, mPttAgeAsOnDt_dt As Date, mPttDob_dt As Date, mPttAhCode_lng As Long, mPttPcgCode_lng As Long, mPttRefRela_str As String, mPttRefName_str As String, mPttAddr_str As String, mPttAraCode_lng As Long, mPttStnCode_lng As Long, mPttTelNo_str As String, mPttSMSNo_str As String, mPttEmail_str As String, mPttInfAllowed_bln As Boolean, mPttDefAllowed_bln As Boolean, mPttDiscAllowed_bln As Boolean, mPttDiscPer_dbl As Double, mPttShowInList_bln As Boolean, mPttRemark_str As String

Rem --------------------------------- store -------------------------------------------------
Public mMdiDesc_str As String, mMdiMigCode_lng As Long, mMdiPurchRate_dbl As Double, mMdiMRPRate_dbl As Double, mMdiSaleRate_dbl As Double, mMdiItmCode_lng As Long
Public mMigDesc_str As String
Public mMptTitle_str As String, mMptMpgCode_lng As Long, mMptAhCode_lng As Long, mMptAddr_str As String, mMptAraCode_lng As Long, mMptStnCode_lng As Long, mMptTelNo_str As String, mMptSMSNo_str As String, mMptEmail_str As String, mMptShowInList_bln As Boolean, mMptRemark_str As String
Public mMpgDesc_str As String
Public mMrf1Date_dt As Date, mMrf1FilePath_str As String
Public mMrf2Date_dt As Date, mMrf2FilePath_str As String

Dim mActiveMast As Integer, aMastTran() As Variant

Public Sub Init()
If blnPatCatgMast = True Then
    mTableName = "PatCatgMst"
    mCodeField = "PcgCode"
    mNameField = "PcgName"
    mRecStateField = "PcgRecState"
    mTitleName = "Patient Category Master"
    
ElseIf blnPatMast = True Then
    mTableName = "PatMast"
    mCodeField = "PttCode"
    mNameField = "PttName"
    mRecStateField = "PttRecState"
    mTitleName = "Patient Master"
    
ElseIf blnDoctCatgMast = True Then
    mTableName = "DoctCatgMst"
    mCodeField = "DcgCode"
    mNameField = "DcgName"
    mRecStateField = "DcgRecState"
    mTitleName = "Attendant Category Master"
    
ElseIf blnRefCatgMast = True Then
    mTableName = "RefCatgMst"
    mCodeField = "RfgCode"
    mNameField = "RfgName"
    mRecStateField = "RfgRecState"
    mTitleName = "Referred Category Master"
    
ElseIf blnDoctMast = True Then
    mTableName = "DoctMast"
    mCodeField = "DctCode"
    mNameField = "DctName"
    mRecStateField = "DctRecState"
    mTitleName = "Attendant Master"
    
ElseIf blnDoctRoleMast = True Then
    mTableName = "DoctRoleMst"
    mCodeField = "DrlCode"
    mNameField = "DrlName"
    mRecStateField = "DrlRecState"
    mTitleName = "Attendant Role Master"
    
ElseIf blnRefByMast = True Then
    mTableName = "RefByMast"
    mCodeField = "RByCode"
    mNameField = "RByName"
    mRecStateField = "RByRecState"
    mTitleName = "Referred By Master"
    
ElseIf blnRefToMast = True Then
    mTableName = "RefToMast"
    mCodeField = "RToCode"
    mNameField = "RToName"
    mRecStateField = "RToRecState"
    mTitleName = "Referred To Master"
    
ElseIf blnServGrpMast = True Then
    mTableName = "ServGrpMst"
    mCodeField = "SgpCode"
    mNameField = "SgpName"
    mRecStateField = "SgpRecState"
    mTitleName = "Service Group Master"
    
ElseIf blnServMast = True Then
    mTableName = "ServMast"
    mCodeField = "SrvCode"
    mNameField = "SrvName"
    mRecStateField = "SrvRecState"
    mTitleName = "Service Master"
    
ElseIf blnDiagMast = True Then
    mTableName = "DiagMast"
    mCodeField = "DigCode"
    mNameField = "DigName"
    mRecStateField = "DigRecState"
    mTitleName = "Diagnostic Master"
    
Rem ----------------------- store ---------------------------------------------------
ElseIf blnMedPrtMast = True Then
    mTableName = "MedPrtMast"
    mCodeField = "MptCode"
    mNameField = "MptName"
    mRecStateField = "MptRecState"
    mTitleName = "Party Master"
    
ElseIf blnMedPrtGrpMast = True Then
    mTableName = "MedPrtGrpMst"
    mCodeField = "MpgCode"
    mNameField = "MpgName"
    mRecStateField = "MpgRecState"
    mTitleName = "Party Group Master"
    
ElseIf blnMedItmMast = True Then
    mTableName = "MedItmMast"
    mCodeField = "MdiCode"
    mNameField = "MdiName"
    mRecStateField = "MdiRecState"
    mTitleName = "Item Master"
    
ElseIf blnMedItmGrpMast = True Then
    mTableName = "MedItmGrpMst"
    mCodeField = "MigCode"
    mNameField = "MigName"
    mRecStateField = "MigRecState"
    mTitleName = "Item Group Master"
    
ElseIf blnMonthRepFmt1stMast = True Then
    mTableName = "MonthRepFmt1st"
    mCodeField = "Mrf1Code"
    mNameField = "Mrf1Name"
    mRecStateField = "Mrf1RecState"
    mTitleName = "Monthly Report Format-1st"
    
ElseIf blnMonthRepFmt2ndMast = True Then
    mTableName = "MonthRepFmt2nd"
    mCodeField = "Mrf2Code"
    mNameField = "Mrf2Name"
    mRecStateField = "Mrf2RecState"
    mTitleName = "Monthly Report Format-2nd"
   
    
   
Else
    ErrorBox "clsVgnMasterEntry_Init_#65_[Undefined Case]"
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

Public Property Set dbComDatabase(ByRef db As ADODB.Connection)
Set m_dbComDatabase = db

End Property

Private Sub Class_Initialize()
aMastTran = Array()
mActiveMast = UBound(aMastTran)

mClassUIdFileName = "clVgnMEn.UId"
mClassAcsPermFileName = "clVgnMEn.Acp"
mClassUIdCode = GetUIdCode("clsVgnMasterEntry_Initialize", mUIdFileName:=mClassUIdFileName, mAcsPermFileName:=mClassAcsPermFileName)
If mClassUIdCode = 0 Then
    ErrorBox cSYSBUSY_ACS_DENIED
End If

End Sub

Public Sub GetData(ByVal mCode As Long)
Dim tRecset As New ADODB.Recordset, acount As Integer

Me.Clear
With tRecset
.open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbVgnDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    mCode_lng = .fields(mCodeField)
    If mNameField <> "" Then
        mName_str = .fields(mNameField)
    End If
    If blnPatCatgMast = True Then
        mPcgInfAllowed_bln = .fields("PcgInfAllowed")
        mPcgDefAllowed_bln = .fields("PcgDefAllowed")
        mPcgDiscAllowed_bln = .fields("PcgDiscAllowed")
        mPcgDiscPer_dbl = .fields("PcgDiscPer")
        mPcgShowInList_bln = .fields("PcgShowInList")
        
    ElseIf blnPatMast = True Then
        mPttRegNo_lng = .fields("PttRegNo")
        mPttRegDate_dt = .fields("PttRegDate")
        mPttSex_str = .fields("PttSex")
        mPttAgeAsOnDt_dt = .fields("PttAgeAsOnDt")
        mPttDob_dt = .fields("PttDob")
        mPttAhCode_lng = .fields("PttAhCode")
        mPttPcgCode_lng = .fields("PttPcgCode")
        mPttRefRela_str = .fields("PttRefRela")
        mPttRefName_str = .fields("PttRefName")
        mPttAddr_str = .fields("PttAddr")
        mPttAraCode_lng = .fields("PttAraCode")
        mPttStnCode_lng = .fields("PttStnCode")
        mPttTelNo_str = .fields("PttTelNo")
        mPttSMSNo_str = .fields("PttSMSNo")
        mPttEmail_str = .fields("PttEmail")
        mPttInfAllowed_bln = .fields("PttInfAllowed")
        mPttDefAllowed_bln = .fields("PttDefAllowed")
        mPttDiscAllowed_bln = .fields("PttDiscAllowed")
        mPttDiscPer_dbl = .fields("PttDiscPer")
        mPttShowInList_bln = .fields("PttShowInList")
        mPttRemark_str = .fields("PttRemark")
        
    ElseIf blnDoctCatgMast = True Then
    
    ElseIf blnRefCatgMast = True Then
    
    ElseIf blnDoctMast = True Then
        mDctTitle_str = .fields("DctTitle")
        mDctSpeci_str = .fields("DctSpeci")
        mDctDcgCode_lng = .fields("DctDcgCode")
        mDctDrlCode_lng = .fields("DctDrlCode")
        mDctAddr_str = .fields("DctAddr")
        mDctTelNo_str = .fields("DctTelNo")
        mDctEmail_str = .fields("DctEmail")
        mDctAhCode_lng = .fields("DctAhCode")
        mDctShare_dbl = .fields("DctShare")
        
    ElseIf blnDoctRoleMast = True Then
        
    ElseIf blnRefByMast = True Then
        mRBySpeci_str = .fields("RBySpeci")
        mRByRfgCode_lng = .fields("RByRfgCode")
        mRByAddr_str = .fields("RByAddr")
        mRByTelNo_str = .fields("RByTelNo")
        mRByEmail_str = .fields("RByEmail")
        mRByAhCode_lng = .fields("RByAhCode")
        mRByShare_dbl = .fields("RByShare")
        
    ElseIf blnRefToMast = True Then
        mRToSpeci_str = .fields("RToSpeci")
        mRToRfgCode_lng = .fields("RToRfgCode")
        mRToAddr_str = .fields("RToAddr")
        mRToTelNo_str = .fields("RToTelNo")
        mRToEmail_str = .fields("RToEmail")
        mRToAhCode_lng = .fields("RToAhCode")
        mRToShare_dbl = .fields("RToShare")
        
    ElseIf blnServGrpMast = True Then
        mSgpIndex_int = .fields("SgpIndex")
        mSgpInfAllowed_bln = .fields("SgpInfAllowed")
        mSgpDefAllowed_bln = .fields("SgpDefAllowed")
        mSgpDiscAllowed_bln = .fields("SgpDiscAllowed")
        mSgpDiscPer_dbl = .fields("SgpDiscPer")
        mSgpExpanded_bln = .fields("SgpExpanded")
        mSgpEditable_bln = .fields("SgpEditable")
        mSgpShowInList_bln = .fields("SgpShowInList")
        mSgpExtRateSys_bln = .fields("SgpExtRateSys")
        mSgpDctwseRateSys_bln = .fields("SgpDctwseRateSys")
        mSgpPcgwseRateSys_bln = .fields("SgpPcgwseRateSys")
        mSgpRBywseRateSys_bln = .fields("SgpRBywseRateSys")
        mSgpRTowseRateSys_bln = .fields("SgpRTowseRateSys")
        mSgpTimewseRateSys_bln = .fields("SgpTimewseRateSys")
        mSgpExtDiscSys_bln = .fields("SgpExtDiscSys")
        mSgpDctwseDiscSys_bln = .fields("SgpDctwseDiscSys")
        mSgpPcgwseDiscSys_bln = .fields("SgpPcgwseDiscSys")
        mSgpRBywseDiscSys_bln = .fields("SgpRBywseDiscSys")
        mSgpRTowseDiscSys_bln = .fields("SgpRTowseDiscSys")
        mSgpTimewseDiscSys_bln = .fields("SgpTimewseDiscSys")
        mSgpExtBargSys_bln = .fields("SgpExtBargSys")
        mSgpDctwseBargSys_bln = .fields("SgpDctwseBargSys")
        mSgpPcgwseBargSys_bln = .fields("SgpPcgwseBargSys")
        mSgpRBywseBargSys_bln = .fields("SgpRBywseBargSys")
        mSgpRTowseBargSys_bln = .fields("SgpRTowseBargSys")
        mSgpTimewseBargSys_bln = .fields("SgpTimewseBargSys")
        mSgpExtShareSys_bln = .fields("SgpExtShareSys")
        mSgpDctwseShareSys_bln = .fields("SgpDctwseShareSys")
        mSgpPcgwseShareSys_bln = .fields("SgpPcgwseShareSys")
        mSgpRBywseShareSys_bln = .fields("SgpRBywseShareSys")
        mSgpRTowseShareSys_bln = .fields("SgpRTowseShareSys")
        mSgpTimewseShareSys_bln = .fields("SgpTimewseShareSys")
        
    ElseIf blnServMast = True Then
        mSrvSgpCode_lng = .fields("SrvSgpCode")
        mSrvAhCode_lng = .fields("SrvAhCode")
        mSrvIndex_int = .fields("SrvIndex")
        mSrvRate_dbl = .fields("SrvRate")
        mSrvOpdGenChg_dbl = .fields("SrvOpdGenChg")
        mSrvOpdEmgChg_dbl = .fields("SrvOpdEmgChg")
        mSrvIpdGenChg_dbl = .fields("SrvIpdGenChg")
        mSrvIpdEmgChg_dbl = .fields("SrvIpdEmgChg")
        mSrvLabGenChg_dbl = .fields("SrvLabGenChg")
        mSrvLabEmgChg_dbl = .fields("SrvLabEmgChg")
        mSrvMultiDctIncl_bln = .fields("SrvMultiDctIncl")
        mSrvAutoInsIpdBill_bln = .fields("SrvAutoInsIpdBill")
        mSrvAutoCalcIpdBill_bln = .fields("SrvAutoCalcIpdBill")
        mSrvAutoInsOnceIpdBill_bln = .fields("SrvAutoInsOnceIpdBill")
        mSrvUnitEditable_bln = .fields("SrvUnitEditable")
        mSrvRateEditable_bln = .fields("SrvRateEditable")
        mSrvAmtEditable_bln = .fields("SrvAmtEditable")
        mSrvInfAllowed_bln = .fields("SrvInfAllowed")
        mSrvDefAllowed_bln = .fields("SrvDefAllowed")
        mSrvDiscAllowed_bln = .fields("SrvDiscAllowed")
        mSrvDiscPer_dbl = .fields("SrvDiscPer")
        mSrvShowInList_bln = .fields("SrvShowInList")
        mSrvDctwseRateSys_bln = .fields("SrvDctwseRateSys")
        mSrvPcgwseRateSys_bln = .fields("SrvPcgwseRateSys")
        mSrvRBywseRateSys_bln = .fields("SrvRBywseRateSys")
        mSrvRTowseRateSys_bln = .fields("SrvRTowseRateSys")
        mSrvTimewseRateSys_bln = .fields("SrvTimewseRateSys")
        mSrvDctwseDiscSys_bln = .fields("SrvDctwseDiscSys")
        mSrvPcgwseDiscSys_bln = .fields("SrvPcgwseDiscSys")
        mSrvRBywseDiscSys_bln = .fields("SrvRBywseDiscSys")
        mSrvRTowseDiscSys_bln = .fields("SrvRTowseDiscSys")
        mSrvTimewseDiscSys_bln = .fields("SrvTimewseDiscSys")
        mSrvDctwseBargSys_bln = .fields("SrvDctwseBargSys")
        mSrvPcgwseBargSys_bln = .fields("SrvPcgwseBargSys")
        mSrvRBywseBargSys_bln = .fields("SrvRBywseBargSys")
        mSrvRTowseBargSys_bln = .fields("SrvRTowseBargSys")
        mSrvTimewseBargSys_bln = .fields("SrvTimewseBargSys")
        mSrvDctwseShareSys_bln = .fields("SrvDctwseShareSys")
        mSrvPcgwseShareSys_bln = .fields("SrvPcgwseShareSys")
        mSrvRBywseShareSys_bln = .fields("SrvRBywseShareSys")
        mSrvRTowseShareSys_bln = .fields("SrvRTowseShareSys")
        mSrvTimewseShareSys_bln = .fields("SrvTimewseShareSys")
    
    ElseIf blnDiagMast = True Then
        Rem nothing
        
    ElseIf blnMedPrtMast = True Then
        mMptTitle_str = .fields("MptTitle")
        mMptMpgCode_lng = .fields("MptMpgCode")
        mMptAhCode_lng = .fields("MptAhCode")
        mMptAddr_str = .fields("MptAddr")
        mMptAraCode_lng = .fields("MptAraCode")
        mMptStnCode_lng = .fields("MptStnCode")
        mMptTelNo_str = .fields("MptTelNo")
        mMptSMSNo_str = .fields("MptSMSNo")
        mMptEmail_str = .fields("MptEmail")
        mMptShowInList_bln = .fields("MptShowInList")
        mMptRemark_str = .fields("MptRemark")
        
    ElseIf blnMedPrtGrpMast = True Then
        mMpgDesc_str = .fields("MpgDesc")
        
    ElseIf blnMedItmMast = True Then
        mMdiDesc_str = .fields("MdiDesc")
        mMdiMigCode_lng = .fields("MdiMigCode")
        mMdiPurchRate_dbl = .fields("MdiPurchRate")
        mMdiMRPRate_dbl = .fields("MdiMRPRate")
        mMdiSaleRate_dbl = .fields("MdiSaleRate")
        mMdiItmCode_lng = .fields("MdiItmCode")
        
    ElseIf blnMedItmGrpMast = True Then
        mMigDesc_str = .fields("MigDesc")
        
    ElseIf blnMonthRepFmt1stMast = True Then
        mMrf1Date_dt = .fields("Mrf1Date")
        mMrf1FilePath_str = .fields("Mrf1FilePath")
        
    ElseIf blnMonthRepFmt2ndMast = True Then
        mMrf2Date_dt = .fields("Mrf2Date")
        mMrf2FilePath_str = .fields("Mrf2FilePath")
        
    End If
End If
End With
CloseTable tRecset

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Sub

End Sub

Public Sub Clear()
mCode_lng = 0
mName_str = ""
If blnPatCatgMast = True Then
    mPcgInfAllowed_bln = False
    mPcgDefAllowed_bln = False
    mPcgDiscAllowed_bln = False
    mPcgDiscPer_dbl = 0
    mPcgShowInList_bln = False

ElseIf blnPatMast = True Then
    mPttRegNo_lng = 0
    mPttRegDate_dt = cUNKNOWNDATE
    mPttSex_str = ""
    mPttAgeAsOnDt_dt = cUNKNOWNDATE
    mPttDob_dt = cUNKNOWNDATE
    mPttAhCode_lng = 0
    mPttPcgCode_lng = 0
    mPttRefRela_str = ""
    mPttRefName_str = ""
    mPttAddr_str = ""
    mPttAraCode_lng = 0
    mPttStnCode_lng = 0
    mPttTelNo_str = ""
    mPttSMSNo_str = ""
    mPttEmail_str = ""
    mPttInfAllowed_bln = False
    mPttDefAllowed_bln = False
    mPttDiscAllowed_bln = False
    mPttDiscPer_dbl = 0
    mPttShowInList_bln = False
    mPttRemark_str = ""

ElseIf blnDoctCatgMast = True Then

ElseIf blnRefCatgMast = True Then

ElseIf blnDoctMast = True Then
    mDctTitle_str = ""
    mDctSpeci_str = ""
    mDctDcgCode_lng = 0
    mDctDrlCode_lng = 0
    mDctAddr_str = ""
    mDctTelNo_str = ""
    mDctEmail_str = ""
    mDctAhCode_lng = 0
    mDctShare_dbl = 0
    
ElseIf blnDoctRoleMast = True Then
    
ElseIf blnRefByMast = True Then
    mRBySpeci_str = ""
    mRByRfgCode_lng = 0
    mRByAddr_str = ""
    mRByTelNo_str = ""
    mRByEmail_str = ""
    mRByAhCode_lng = 0
    mRByShare_dbl = 0
    
ElseIf blnRefToMast = True Then
    mRToSpeci_str = ""
    mRToRfgCode_lng = 0
    mRToAddr_str = ""
    mRToTelNo_str = ""
    mRToEmail_str = ""
    mRToAhCode_lng = 0
    mRToShare_dbl = 0
    
ElseIf blnServGrpMast = True Then
    mSgpIndex_int = 0
    mSgpInfAllowed_bln = False
    mSgpDefAllowed_bln = False
    mSgpDiscAllowed_bln = False
    mSgpDiscPer_dbl = 0
    mSgpExpanded_bln = False
    mSgpEditable_bln = False
    mSgpShowInList_bln = False
    mSgpExtRateSys_bln = 0
    mSgpDctwseRateSys_bln = 0
    mSgpPcgwseRateSys_bln = 0
    mSgpRBywseRateSys_bln = 0
    mSgpRTowseRateSys_bln = 0
    mSgpTimewseRateSys_bln = 0
    mSgpExtDiscSys_bln = 0
    mSgpDctwseDiscSys_bln = 0
    mSgpPcgwseDiscSys_bln = 0
    mSgpRBywseDiscSys_bln = 0
    mSgpRTowseDiscSys_bln = 0
    mSgpTimewseDiscSys_bln = 0
    mSgpExtBargSys_bln = 0
    mSgpDctwseBargSys_bln = 0
    mSgpPcgwseBargSys_bln = 0
    mSgpRBywseBargSys_bln = 0
    mSgpRTowseBargSys_bln = 0
    mSgpTimewseBargSys_bln = 0
    mSgpExtShareSys_bln = 0
    mSgpDctwseShareSys_bln = 0
    mSgpPcgwseShareSys_bln = 0
    mSgpRBywseShareSys_bln = 0
    mSgpRTowseShareSys_bln = 0
    mSgpTimewseShareSys_bln = 0
    
ElseIf blnServMast = True Then
    mSrvSgpCode_lng = 0
    mSrvAhCode_lng = 0
    mSrvIndex_int = 0
    mSrvRate_dbl = 0
    mSrvOpdGenChg_dbl = 0
    mSrvOpdEmgChg_dbl = 0
    mSrvIpdGenChg_dbl = 0
    mSrvIpdEmgChg_dbl = 0
    mSrvLabGenChg_dbl = 0
    mSrvLabEmgChg_dbl = 0
    mSrvMultiDctIncl_bln = False
    mSrvAutoInsIpdBill_bln = False
    mSrvAutoCalcIpdBill_bln = False
    mSrvAutoInsOnceIpdBill_bln = False
    mSrvUnitEditable_bln = False
    mSrvRateEditable_bln = False
    mSrvAmtEditable_bln = False
    mSrvInfAllowed_bln = False
    mSrvDefAllowed_bln = False
    mSrvDiscAllowed_bln = False
    mSrvDiscPer_dbl = 0
    mSrvShowInList_bln = False
    mSrvDctwseRateSys_bln = 0
    mSrvPcgwseRateSys_bln = 0
    mSrvRBywseRateSys_bln = 0
    mSrvRTowseRateSys_bln = 0
    mSrvTimewseRateSys_bln = 0
    mSrvDctwseDiscSys_bln = 0
    mSrvPcgwseDiscSys_bln = 0
    mSrvRBywseDiscSys_bln = 0
    mSrvRTowseDiscSys_bln = 0
    mSrvTimewseDiscSys_bln = 0
    mSrvDctwseBargSys_bln = 0
    mSrvPcgwseBargSys_bln = 0
    mSrvRBywseBargSys_bln = 0
    mSrvRTowseBargSys_bln = 0
    mSrvTimewseBargSys_bln = 0
    mSrvDctwseShareSys_bln = 0
    mSrvPcgwseShareSys_bln = 0
    mSrvRBywseShareSys_bln = 0
    mSrvRTowseShareSys_bln = 0
    mSrvTimewseShareSys_bln = 0

ElseIf blnDiagMast = True Then
    Rem nothing
    
ElseIf blnMedPrtMast = True Then
    mMptTitle_str = ""
    mMptMpgCode_lng = 0
    mMptAhCode_lng = 0
    mMptAddr_str = ""
    mMptAraCode_lng = 0
    mMptStnCode_lng = 0
    mMptTelNo_str = ""
    mMptSMSNo_str = ""
    mMptEmail_str = ""
    mMptShowInList_bln = False
    mMptRemark_str = ""

ElseIf blnMedPrtGrpMast = True Then
    mMpgDesc_str = ""

ElseIf blnMedItmMast = True Then
    mMdiDesc_str = ""
    mMdiMigCode_lng = 0
    mMdiPurchRate_dbl = 0
    mMdiMRPRate_dbl = 0
    mMdiSaleRate_dbl = 0
    mMdiItmCode_lng = 0
    
ElseIf blnMedItmGrpMast = True Then
    mMigDesc_str = ""
    
ElseIf blnMonthRepFmt1stMast = True Then
    mMrf1Date_dt = cUNKNOWNDATE
    mMrf1FilePath_str = ""
    
ElseIf blnMonthRepFmt2ndMast = True Then
    mMrf2Date_dt = cUNKNOWNDATE
    mMrf2FilePath_str = ""
    
End If

End Sub

Private Sub Class_Terminate()
If UBound(aMastTran) >= LBound(aMastTran) Then
    ErrorBox mTitleName & " Entry in Process !!!"
End If

End Sub

Public Function BeginMast(ByVal mCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset
BeginMast = False

If mCode = 0 Then
    mCode = GetUIdCode("clsVgnMasterEntry_BeginMast", mUIdFileName:=mClassUIdFileName, mAcsPermFileName:=mClassAcsPermFileName) * -1        ' GetNextSeqno(m_dbVgnDatabase, mTableName, mCodeField)
    If mCode = 0 Then
        ErrorBox mTitleName & " Entry Failed !!!"
        GoTo EndSub
    End If
ElseIf mCode > 0 Then
    tRecset.open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbVgnDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.EOF = True Then
        ErrorBox mTitleName & " Entry not Found !!!"
        GoTo EndSub
    End If
    CloseTable tRecset
Else
    ErrorBox "Invalid " & mTitleName & " Entry !!!"
    GoTo EndSub
End If
mActiveMast = UBound(aMastTran) + 1
ReDim Preserve aMastTran(mActiveMast)
aMastTran(mActiveMast) = mCode

Call Data_CreateLog(mCode)

BeginMast = True

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Function

End Function

Public Function EndMast(ByVal mCode As Long) As Boolean
Dim mCnt As Integer

EndMast = False
If Chk_ActiveMast() = False Or IIf(ActiveCode > 0, mCode <> ActiveCode, False) Then
    ErrorBox "No Active " & mTitleName & " Entry !!!"
    Exit Function
End If
Call Data_RemoveLog(mCode)

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

m_dbVgnDatabase.BeginTrans
Rem updating Master
With tRecset
.open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbVgnDatabase, adOpenKeyset, adLockOptimistic
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
m_dbVgnDatabase.CommitTrans

UpdateMast = True
GoTo EndSub

errhand:
MsgBox Err.Description
m_dbVgnDatabase.Cancel

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

m_dbVgnDatabase.BeginTrans
With tRecset
.open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbVgnDatabase, adOpenKeyset, adLockOptimistic
LogRS.open "Select * from " & mTableName & "_Log where " & mCodeField & "=" & CStr(mCode) & "", m_dbVgnDatabase, adOpenKeyset, adLockOptimistic
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
            .fields("PttRefRela") = LogRS.fields("PttRefRela")
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
            .fields("DctTitle") = LogRS.fields("DctTitle")
            .fields("DctSpeci") = LogRS.fields("DctSpeci")
            .fields("DctDcgCode") = LogRS.fields("DctDcgCode")
            .fields("DctDrlCode") = LogRS.fields("DctDrlCode")
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
            .fields("SgpInfAllowed") = LogRS.fields("SgpInfAllowed")
            .fields("SgpDefAllowed") = LogRS.fields("SgpDefAllowed")
            .fields("SgpDiscAllowed") = LogRS.fields("SgpDiscAllowed")
            .fields("SgpDiscPer") = LogRS.fields("SgpDiscPer")
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
            .fields("SrvRate") = LogRS.fields("SrvRate")
            .fields("SrvOpdGenChg") = LogRS.fields("SrvOpdGenChg")
            .fields("SrvOpdEmgChg") = LogRS.fields("SrvOpdEmgChg")
            .fields("SrvIpdGenChg") = LogRS.fields("SrvIpdGenChg")
            .fields("SrvIpdEmgChg") = LogRS.fields("SrvIpdEmgChg")
            .fields("SrvLabGenChg") = LogRS.fields("SrvLabGenChg")
            .fields("SrvLabEmgChg") = LogRS.fields("SrvLabEmgChg")
            .fields("SrvMultiDctIncl") = LogRS.fields("SrvMultiDctIncl")
            .fields("SrvAutoInsIpdBill") = LogRS.fields("SrvAutoInsIpdBill")
            .fields("SrvAutoCalcIpdBill") = LogRS.fields("SrvAutoCalcIpdBill")
            .fields("SrvAutoInsOnceIpdBill") = LogRS.fields("SrvAutoInsOnceIpdBill")
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
            
        ElseIf blnMedPrtMast = True Then
            .fields("MptTitle") = LogRS.fields("MptTitle")
            .fields("MptMpgCode") = LogRS.fields("MptMpgCode")
            .fields("MptAhCode") = LogRS.fields("MptAhCode")
            .fields("MptAddr") = LogRS.fields("MptAddr")
            .fields("MptAraCode") = LogRS.fields("MptAraCode")
            .fields("MptStnCode") = LogRS.fields("MptStnCode")
            .fields("MptTelNo") = LogRS.fields("MptTelNo")
            .fields("MptSMSNo") = LogRS.fields("MptSMSNo")
            .fields("MptEmail") = LogRS.fields("MptEmail")
            .fields("MptShowInList") = LogRS.fields("MptShowInList")
            .fields("MptRemark") = LogRS.fields("MptRemark")
            
        ElseIf blnMedPrtGrpMast = True Then
            .fields("MpgDesc") = LogRS.fields("MpgDesc")
            
        ElseIf blnMedItmMast = True Then
            .fields("MdiDesc") = LogRS.fields("MdiDesc")
            .fields("MdiMigCode") = LogRS.fields("MdiMigCode")
            .fields("MdiPurchRate") = LogRS.fields("MdiPurchRate")
            .fields("MdiMRPRate") = LogRS.fields("MdiMRPRate")
            .fields("MdiSaleRate") = LogRS.fields("MdiSaleRate")
            .fields("MdiItmCode") = LogRS.fields("MdiItmCode")
            
        ElseIf blnMedItmGrpMast = True Then
            .fields("MigDesc") = LogRS.fields("MigDesc")
            
        ElseIf blnMonthRepFmt1stMast = True Then
            .fields("Mrf1Date") = LogRS.fields("Mrf1Date")
            .fields("Mrf1FilePath") = LogRS.fields("Mrf1FilePath")
            
        ElseIf blnMonthRepFmt2ndMast = True Then
            .fields("Mrf2Date") = LogRS.fields("Mrf2Date")
            .fields("Mrf2FilePath") = LogRS.fields("Mrf2FilePath")
            
            
            
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
m_dbVgnDatabase.CommitTrans

CancelMast = True
GoTo EndSub

errhand:
MsgBox Err.Description
m_dbVgnDatabase.Cancel

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

m_dbVgnDatabase.BeginTrans
With tRecset
.open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbVgnDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    .fields(mRecStateField) = ChkDeleteRecStatus(.fields(mRecStateField))
    .Update
Else
    ErrorBox "clsVgnMasterEntry_DeleteMast_254"
End If
End With
CloseTable tRecset
m_dbVgnDatabase.CommitTrans

DeleteMast = True
GoTo EndSub

errhand:
MsgBox Err.Description
m_dbVgnDatabase.Cancel

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Function

End Function

Public Function SelectMast(ByVal mCode As Long) As Boolean
Dim mEntryFound As Boolean
SelectMast = False
If mCode < 1 Then
    ErrorBox "Invalid " & mTitleName & " Entry !!!"
    Exit Function
End If
mEntryFound = False
For mActiveMast = LBound(aMastTran) To UBound(aMastTran)
    If aMastTran(mActiveMast) = mCode Then
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

Private Function Data_CreateLog(ByVal mCode As Long) As Boolean
Dim LogRS As New ADODB.Recordset

Data_CreateLog = False
If Chk_ActiveMast() = False Or mCode <> ActiveCode Then
    ErrorBox "No Active " & mTitleName & " Entry to Create Log !!!"
    GoTo EndSub
End If

With LogRS
.open "Select * from " & mTableName & "_Log where " & mCodeField & "=" & CStr(mCode) & "", m_dbVgnDatabase, adOpenKeyset, adLockOptimistic
If .EOF = True Then
    m_dbVgnDatabase.BeginTrans
    m_dbVgnDatabase.Execute "Insert into " & mTableName & "_Log" & " Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & ""
    m_dbVgnDatabase.CommitTrans
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

Private Function Data_RemoveLog(ByVal mCode As Long) As Boolean
Data_RemoveLog = False
If Chk_ActiveMast() = False Or mCode <> ActiveCode Then
    ErrorBox "No Active " & mTitleName & " Entry to Remove Log !!!"
    Exit Function
End If

m_dbVgnDatabase.BeginTrans
m_dbVgnDatabase.Execute "Delete from " & mTableName & "_Log" & " where " & mCodeField & "=" & CStr(mCode)
m_dbVgnDatabase.CommitTrans

Data_RemoveLog = True

End Function

Public Function AddNew(Optional ByVal mInhCode) As Boolean
Dim tRecset As New ADODB.Recordset, mCanAddNew As Boolean, mLCount As Integer, mUCount As Integer, acount As Integer

AddNew = False
mCanAddNew = True
If mNameField <> "" And blnPatMast = False Then   ' patient duplicacy checking is to be avoided
    tRecset.open "Select " & mNameField & " from " & mTableName & " where " & mNameField & "='" & mName_str & "'", m_dbVgnDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.EOF = False Then
        mCanAddNew = False
        ErrorBox "Duplicate Name !!!"
    End If
    CloseTable tRecset
End If

On Error GoTo errhand
mCode_lng = 0
If mCanAddNew = True Then
    m_dbVgnDatabase.BeginTrans
    With tRecset
    .open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(-0.1) & "", m_dbVgnDatabase, adOpenKeyset, adLockOptimistic
    
    .AddNew
    If IsMissing(mInhCode) = False Then
        .fields(mCodeField) = mInhCode
    Else
        Rem .Fields(mCodeField) = mCode_lng AutoNumber
    End If
    If mNameField <> "" Then
        .fields(mNameField) = mName_str
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
        .fields("DctTitle") = mDctTitle_str
        .fields("DctSpeci") = mDctSpeci_str
        .fields("DctDcgCode") = mDctDcgCode_lng
        .fields("DctDrlCode") = mDctDrlCode_lng
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
        .fields("SgpInfAllowed") = mSgpInfAllowed_bln
        .fields("SgpDefAllowed") = mSgpDefAllowed_bln
        .fields("SgpDiscAllowed") = mSgpDiscAllowed_bln
        .fields("SgpDiscPer") = mSgpDiscPer_dbl
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
        .fields("SrvRate") = mSrvRate_dbl
        .fields("SrvOpdGenChg") = mSrvOpdGenChg_dbl
        .fields("SrvOpdEmgChg") = mSrvOpdEmgChg_dbl
        .fields("SrvIpdGenChg") = mSrvIpdGenChg_dbl
        .fields("SrvIpdEmgChg") = mSrvIpdEmgChg_dbl
        .fields("SrvLabGenChg") = mSrvLabGenChg_dbl
        .fields("SrvLabEmgChg") = mSrvLabEmgChg_dbl
        .fields("SrvMultiDctIncl") = mSrvMultiDctIncl_bln
        .fields("SrvAutoInsIpdBill") = mSrvAutoInsIpdBill_bln
        .fields("SrvAutoCalcIpdBill") = mSrvAutoCalcIpdBill_bln
        .fields("SrvAutoInsOnceIpdBill") = mSrvAutoInsOnceIpdBill_bln
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
    
    ElseIf blnMedPrtMast = True Then
        .fields("MptTitle") = mMptTitle_str
        .fields("MptMpgCode") = mMptMpgCode_lng
        .fields("MptAhCode") = mMptAhCode_lng
        .fields("MptAddr") = mMptAddr_str
        .fields("MptAraCode") = mMptAraCode_lng
        .fields("MptStnCode") = mMptStnCode_lng
        .fields("MptTelNo") = mMptTelNo_str
        .fields("MptSMSNo") = mMptSMSNo_str
        .fields("MptEmail") = mMptEmail_str
        .fields("MptShowInList") = mMptShowInList_bln
        .fields("MptRemark") = mMptRemark_str
    
    ElseIf blnMedPrtGrpMast = True Then
        .fields("MpgDesc") = mMpgDesc_str
    
    ElseIf blnMedItmMast = True Then
        .fields("MdiDesc") = mMdiDesc_str
        .fields("MdiMigCode") = mMdiMigCode_lng
        .fields("MdiPurchRate") = mMdiPurchRate_dbl
        .fields("MdiMRPRate") = mMdiMRPRate_dbl
        .fields("MdiSaleRate") = mMdiSaleRate_dbl
        .fields("MdiItmCode") = mMdiItmCode_lng
        
    ElseIf blnMedItmGrpMast = True Then
        .fields("MigDesc") = mMigDesc_str
        
    ElseIf blnMonthRepFmt1stMast = True Then
        .fields("Mrf1Date") = mMrf1Date_dt
        .fields("Mrf1FilePath") = mMrf1FilePath_str
        
    ElseIf blnMonthRepFmt2ndMast = True Then
        .fields("Mrf2Date") = mMrf2Date_dt
        .fields("Mrf2FilePath") = mMrf2FilePath_str
        
        
        
    End If
    .Update
    mCode_lng = .fields(mCodeField)
    aMastTran(mActiveMast) = mCode_lng
    End With
    CloseTable tRecset
    
    m_dbVgnDatabase.CommitTrans
End If
AddNew = True
GoTo EndSub

errhand:
MsgBox Err.Description
m_dbVgnDatabase.Cancel

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Function

End Function

Public Function Update(ByVal mCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset, mCanUpdate As Boolean, mLCount As Integer, mUCount As Integer, acount As Integer

Update = False
mCanUpdate = True
If mNameField <> "" And blnPatMast = False Then   ' patient duplicate checking is to be avoided
    tRecset.open "Select " & mNameField & " from " & mTableName & " where " & mNameField & "='" & mName_str & "' and " & mCodeField & "<>" & CStr(mCode) & "", m_dbVgnDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.EOF = False Then
        mCanUpdate = False
        ErrorBox "Duplicate Name !!!"
    End If
    CloseTable tRecset
End If

On Error GoTo errhand
mCode_lng = 0
If mCanUpdate = True Then
    m_dbVgnDatabase.BeginTrans
    With tRecset
    .open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbVgnDatabase, adOpenKeyset, adLockOptimistic
    
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
        .fields("DctTitle") = mDctTitle_str
        .fields("DctSpeci") = mDctSpeci_str
        .fields("DctDcgCode") = mDctDcgCode_lng
        .fields("DctDrlCode") = mDctDrlCode_lng
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
        .fields("SgpInfAllowed") = mSgpInfAllowed_bln
        .fields("SgpDefAllowed") = mSgpDefAllowed_bln
        .fields("SgpDiscAllowed") = mSgpDiscAllowed_bln
        .fields("SgpDiscPer") = mSgpDiscPer_dbl
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
        .fields("SrvRate") = mSrvRate_dbl
        .fields("SrvOpdGenChg") = mSrvOpdGenChg_dbl
        .fields("SrvOpdEmgChg") = mSrvOpdEmgChg_dbl
        .fields("SrvIpdGenChg") = mSrvIpdGenChg_dbl
        .fields("SrvIpdEmgChg") = mSrvIpdEmgChg_dbl
        .fields("SrvLabGenChg") = mSrvLabGenChg_dbl
        .fields("SrvLabEmgChg") = mSrvLabEmgChg_dbl
        .fields("SrvMultiDctIncl") = mSrvMultiDctIncl_bln
        .fields("SrvAutoInsIpdBill") = mSrvAutoInsIpdBill_bln
        .fields("SrvAutoCalcIpdBill") = mSrvAutoCalcIpdBill_bln
        .fields("SrvAutoInsOnceIpdBill") = mSrvAutoInsOnceIpdBill_bln
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
        
    ElseIf blnMedPrtMast = True Then
        .fields("MptTitle") = mMptTitle_str
        .fields("MptMpgCode") = mMptMpgCode_lng
        .fields("MptAhCode") = mMptAhCode_lng
        .fields("MptAddr") = mMptAddr_str
        .fields("MptAraCode") = mMptAraCode_lng
        .fields("MptStnCode") = mMptStnCode_lng
        .fields("MptTelNo") = mMptTelNo_str
        .fields("MptSMSNo") = mMptSMSNo_str
        .fields("MptEmail") = mMptEmail_str
        .fields("MptShowInList") = mMptShowInList_bln
        .fields("MptRemark") = mMptRemark_str
        
    ElseIf blnMedPrtGrpMast = True Then
        .fields("MpgDesc") = mMpgDesc_str
        
    ElseIf blnMedItmMast = True Then
        .fields("MdiDesc") = mMdiDesc_str
        .fields("MdiMigCode") = mMdiMigCode_lng
        .fields("MdiPurchRate") = mMdiPurchRate_dbl
        .fields("MdiMRPRate") = mMdiMRPRate_dbl
        .fields("MdiSaleRate") = mMdiSaleRate_dbl
        .fields("MdiItmCode") = mMdiItmCode_lng
        
    ElseIf blnMedItmGrpMast = True Then
        .fields("MigDesc") = mMigDesc_str
        
    ElseIf blnMonthRepFmt1stMast = True Then
        .fields("Mrf1Date") = mMrf1Date_dt
        .fields("Mrf1FilePath") = mMrf1FilePath_str
        
    ElseIf blnMonthRepFmt2ndMast = True Then
        .fields("Mrf2Date") = mMrf2Date_dt
        .fields("Mrf2FilePath") = mMrf2FilePath_str
        
        
        
    End If
    .Update
    mCode_lng = .fields(mCodeField)
    End With
    CloseTable tRecset
    
    m_dbVgnDatabase.CommitTrans
End If
Update = True
GoTo EndSub

errhand:
MsgBox Err.Description
m_dbVgnDatabase.Cancel

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Function

End Function

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
    .open "Select * from " & mTableName & " where " & mCodeField & "=" & CStr(mCode) & "", m_dbVgnDatabase, adOpenKeyset, adLockOptimistic
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
    .open "Select * from PatMast where PttPcgCode=" & CStr(mCode) & "", m_dbVgnDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        ChkEntryExist = True
        ErrorBox "Used in Patient Master " & .fields("PttName")
    End If
    End With
    CloseTable tRecset
    
ElseIf blnPatMast = True Then
    With tRecset
    .open "Select * from OutdReg where OpgPttCode = " & CStr(mCode) & "", m_dbVgnDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        ChkEntryExist = True
        ErrorBox "Used in Outdoor Registration " & CStr(.fields("OpgVchNo")) & " dated " & Dtoc(.fields("OpgDate"))
    End If
    End With
    CloseTable tRecset
    
    If ChkEntryExist = False Then
        With tRecset
        .open "Select * from MedSaleHdr left join VTypMast on MedSaleHdr.SahVtmCode = VTypMast.VtmCode where SahPttCode = " & CStr(mCode) & "", m_dbComDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            ChkEntryExist = True
            If IsNull(.fields("VtmCode")) = False Then
                ErrorBox "Used in " & .fields("VtmName") & " " & CStr(.fields("SahVchNo")) & " dated " & Dtoc(.fields("SahDate"))
            Else
                ErrorBox "Used in Store Sales " & CStr(.fields("SahVchNo")) & " dated " & Dtoc(.fields("SahDate"))
            End If
        End If
        End With
        CloseTable tRecset
    End If
    If ChkEntryExist = False Then
        With tRecset
        .open "Select * from MedPurchHdr left join VTypMast on MedPurchHdr.PuhVtmCode = VTypMast.VtmCode where PuhPttCode = " & CStr(mCode) & "", m_dbComDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            ChkEntryExist = True
            If IsNull(.fields("VtmCode")) = False Then
                ErrorBox "Used in " & .fields("VtmName") & " " & CStr(.fields("PuhVchNo")) & " dated " & Dtoc(.fields("PuhDate"))
            Else
                ErrorBox "Used in Store Sales " & CStr(.fields("PuhVchNo")) & " dated " & Dtoc(.fields("PuhDate"))
            End If
        End If
        End With
        CloseTable tRecset
    End If
    
ElseIf blnDoctCatgMast = True Then
    With tRecset
    .open "Select * from DoctMast where DctDcgCode=" & CStr(mCode) & "", m_dbVgnDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        ChkEntryExist = True
        ErrorBox "Used in Attendant Master " & .fields("DctName")
    End If
    End With
    CloseTable tRecset
    
ElseIf blnRefCatgMast = True Then
    With tRecset
    .open "Select * from RefByMast where RByRfgCode=" & CStr(mCode) & "", m_dbVgnDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        ChkEntryExist = True
        ErrorBox "Used in Referred By Master " & .fields("RByName")
    End If
    End With
    CloseTable tRecset
    If ChkEntryExist = False Then
        With tRecset
        .open "Select * from RefToMast where RToRfgCode=" & CStr(mCode) & "", m_dbVgnDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            ChkEntryExist = True
            ErrorBox "Used in Referred To Master " & .fields("RToName")
        End If
        End With
        CloseTable tRecset
    End If
    
ElseIf blnDoctMast = True Then
    With tRecset
    .open "Select * from OutdReg where OpgCDctCode=" & CStr(mCode) & "", m_dbVgnDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        ChkEntryExist = True
        ErrorBox "Used in Outdoor Registration " & CStr(.fields("OpgVchNo")) & " dated " & Dtoc(.fields("OpgDate"))
    End If
    End With
    CloseTable tRecset
    If ChkEntryExist = False Then
        With tRecset
        .open "Select * from IndrReg where IpgCDctCode=" & CStr(mCode) & "", m_dbVgnDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            ChkEntryExist = True
            ErrorBox "Used in Indoor Registration " & CStr(.fields("IpgVchNo")) & " dated " & Dtoc(.fields("IpgDate"))
        End If
        End With
        CloseTable tRecset
    End If
    If ChkEntryExist = False Then
        With tRecset
        .open "Select * from (OutdRcDctDtl as ord inner join OutdRcpt as orc on ord.OrdOrcCode=orc.OrcICode) inner join OutdHdr as ohr on orc.OrcCode=ohr.OhrCode where OrdDctCode=" & CStr(mCode) & "", m_dbVgnDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            ChkEntryExist = True
            ErrorBox "Used in Outdoor Receipt Service Attendants " & CStr(.fields("OhrVchNo")) & " dated " & Dtoc(.fields("OhrDate"))
        End If
        End With
        CloseTable tRecset
    End If
    If ChkEntryExist = False Then
        With tRecset
        .open "Select * from (OutdBlDctDtl as obd inner join OutdBill as obl on obd.ObdOblCode=obl.OblICode) inner join OutdBlHdr as obh on obl.OblCode=obh.ObhCode where ObdDctCode=" & CStr(mCode) & "", m_dbVgnDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            ChkEntryExist = True
            ErrorBox "Used in Outdoor Bill Service Attendants " & CStr(.fields("ObhVchNo")) & " dated " & Dtoc(.fields("ObhDate"))
        End If
        End With
        CloseTable tRecset
    End If
    If ChkEntryExist = False Then
        With tRecset
        .open "Select * from (IndrRcDctDtl as ird inner join IndrRcpt as irc on ird.IrdIrcCode=irc.IrcICode) inner join IndrHdr as ihr on irc.IrcCode=ihr.IhrCode where IrdDctCode=" & CStr(mCode) & "", m_dbVgnDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            ChkEntryExist = True
            ErrorBox "Used in Indoor Receipt Service Attendants " & CStr(.fields("IhrVchNo")) & " dated " & Dtoc(.fields("IhrDate"))
        End If
        End With
        CloseTable tRecset
    End If
    If ChkEntryExist = False Then
        With tRecset
        .open "Select * from (IndrBlDctDtl as ibd inner join IndrBill as ibl on ibd.IbdIblCode=ibl.IblICode) inner join IndrBlHdr as ibh on ibl.IblCode=ibh.IbhCode where IbdDctCode=" & CStr(mCode) & "", m_dbVgnDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            ChkEntryExist = True
            ErrorBox "Used in Indoor Bill Service Attendants " & CStr(.fields("IbhVchNo")) & " dated " & Dtoc(.fields("IbhDate"))
        End If
        End With
        CloseTable tRecset
    End If
    
ElseIf blnDoctRoleMast = True Then
    With tRecset
    .open "Select * from DoctMast where DctDrlCode = " & CStr(mCode) & "", m_dbVgnDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        ChkEntryExist = True
        ErrorBox "Used in Attendant Master " & CStr(.fields("DctName"))
    End If
    End With
    CloseTable tRecset
    If ChkEntryExist = False Then
        With tRecset
        .open "Select * from (OutdRcDctDtl as ord inner join OutdRcpt as orc on ord.OrdOrcCode=orc.OrcICode) inner join OutdHdr as ohr on orc.OrcCode=ohr.OhrCode where OrdDrlCode=" & CStr(mCode) & "", m_dbVgnDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            ChkEntryExist = True
            ErrorBox "Used in Outdoor Receipt Service Attendants " & CStr(.fields("OhrVchNo")) & " dated " & Dtoc(.fields("OhrDate"))
        End If
        End With
        CloseTable tRecset
    End If
    If ChkEntryExist = False Then
        With tRecset
        .open "Select * from (OutdBlDctDtl as obd inner join OutdBill as obl on obd.ObdOblCode=obl.OblICode) inner join OutdBlHdr as obh on obl.OblCode=obh.ObhCode where ObdDrlCode=" & CStr(mCode) & "", m_dbVgnDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            ChkEntryExist = True
            ErrorBox "Used in Outdoor Bill Service Attendants " & CStr(.fields("ObhVchNo")) & " dated " & Dtoc(.fields("ObhDate"))
        End If
        End With
        CloseTable tRecset
    End If
    If ChkEntryExist = False Then
        With tRecset
        .open "Select * from (IndrRcDctDtl as ird inner join IndrRcpt as irc on ird.IrdIrcCode=irc.IrcICode) inner join IndrHdr as ihr on irc.IrcCode=ihr.IhrCode where IrdDrlCode=" & CStr(mCode) & "", m_dbVgnDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            ChkEntryExist = True
            ErrorBox "Used in Indoor Receipt Service Attendants " & CStr(.fields("IhrVchNo")) & " dated " & Dtoc(.fields("IhrDate"))
        End If
        End With
        CloseTable tRecset
    End If
    If ChkEntryExist = False Then
        With tRecset
        .open "Select * from (IndrBlDctDtl as ibd inner join IndrBill as ibl on ibd.IbdIblCode=ibl.IblICode) inner join IndrBlHdr as ibh on ibl.IblCode=ibh.IbhCode where IbdDrlCode=" & CStr(mCode) & "", m_dbVgnDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            ChkEntryExist = True
            ErrorBox "Used in Indoor Bill Service Attendants " & CStr(.fields("IbhVchNo")) & " dated " & Dtoc(.fields("IbhDate"))
        End If
        End With
        CloseTable tRecset
    End If
    
ElseIf blnRefByMast = True Or blnRefToMast = True Then
    With tRecset
    .open "Select * from OutdReg where OpgRByCode=" & CStr(mCode) & " or OpgRToCode=" & CStr(mCode) & " order by OpgDate Desc,OpgVchNo Desc", m_dbVgnDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        ChkEntryExist = True
        ErrorBox "Used in Outdoor Registration " & CStr(.fields("OpgVchNo")) & " dated " & Dtoc(.fields("OpgDate"))
    End If
    End With
    CloseTable tRecset
    If ChkEntryExist = False Then
        With tRecset
        .open "Select * from IndrReg where IpgRByCode=" & CStr(mCode) & " or IpgRToCode=" & CStr(mCode) & " order by IpgDate Desc,IpgVchNo Desc", m_dbVgnDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            ChkEntryExist = True
            ErrorBox "Used in Indoor Registration " & CStr(.fields("IpgVchNo")) & " dated " & Dtoc(.fields("IpgDate"))
        End If
        End With
        CloseTable tRecset
    End If
    
ElseIf blnServGrpMast = True Then
    With tRecset
    .open "Select * from ServMast where SrvSgpCode=" & CStr(mCode) & "", m_dbVgnDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        ChkEntryExist = True
        ErrorBox "Used in Service Master " & .fields("SrvName")
    End If
    End With
    CloseTable tRecset
    
ElseIf blnServMast = True Then
    With tRecset
    .open "Select * from OutdReg where OpgSrvCode=" & CStr(mCode) & "", m_dbVgnDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        ChkEntryExist = True
        ErrorBox "Used in Outdoor Registration " & CStr(.fields("OpgVchNo")) & " dated " & Dtoc(.fields("OpgDate"))
    End If
    End With
    CloseTable tRecset
    If ChkEntryExist = False Then
        With tRecset
        .open "Select top 1 * from OutdRcpt as dtl inner join OutdHdr as hdr on dtl.OrcCode=hdr.OhrCode where OrcSrvCode=" & CStr(mCode) & "", m_dbVgnDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            ChkEntryExist = True
            ErrorBox "Used in Outdoor Receipt " & CStr(.fields("OhrVchNo")) & " dated " & Dtoc(.fields("OhrDate"))
        End If
        End With
        CloseTable tRecset
    End If
    If ChkEntryExist = False Then
        With tRecset
        .open "Select top 1 * from OutdBill as dtl inner join OutdBlHdr as hdr on dtl.OblCode=hdr.ObhCode where OblSrvCode=" & CStr(mCode) & "", m_dbVgnDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            ChkEntryExist = True
            ErrorBox "Used in Outdoor Bill " & CStr(.fields("ObhVchNo")) & " dated " & Dtoc(.fields("ObhDate"))
        End If
        End With
        CloseTable tRecset
    End If
    If ChkEntryExist = False Then
        With tRecset
        .open "Select top 1 * from IndrRcpt as dtl inner join IndrHdr as hdr on dtl.IrcCode=hdr.IhrCode where IrcSrvCode=" & CStr(mCode) & "", m_dbVgnDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            ChkEntryExist = True
            ErrorBox "Used in Indoor Receipt " & CStr(.fields("IhrVchNo")) & " dated " & Dtoc(.fields("IhrDate"))
        End If
        End With
        CloseTable tRecset
    End If
    If ChkEntryExist = False Then
        With tRecset
        .open "Select top 1 * from IndrBill as dtl inner join IndrBlHdr as hdr on dtl.IblCode=hdr.IbhCode where IblSrvCode=" & CStr(mCode) & "", m_dbVgnDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            ChkEntryExist = True
            ErrorBox "Used in Indoor Bill " & CStr(.fields("IbhVchNo")) & " dated " & Dtoc(.fields("IbhDate"))
        End If
        End With
        CloseTable tRecset
    End If
    
ElseIf blnDiagMast = True Then
    With tRecset
    .open "Select * from OutdReg where OpgFDigCode=" & CStr(mCode) & "", m_dbVgnDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        ChkEntryExist = True
        ErrorBox "Used in Outdoor Registration " & CStr(.fields("OpgVchNo")) & " dated " & Dtoc(.fields("OpgDate"))
    End If
    End With
    CloseTable tRecset
    If ChkEntryExist = False Then
        With tRecset
        .open "Select * from IndrReg where IpgFDigCode=" & CStr(mCode) & "", m_dbVgnDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            ChkEntryExist = True
            ErrorBox "Used in Indoor Registration " & CStr(.fields("IpgVchNo")) & " dated " & Dtoc(.fields("IpgDate"))
        End If
        End With
        CloseTable tRecset
    End If
    
ElseIf blnMedPrtMast = True Then
    With tRecset
    .open "Select * from MedPurchHdr where PuhMptCode = " & CStr(mCode) & "", m_dbVgnDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        ChkEntryExist = True
        ErrorBox "Used in Purchase/Sales Return " & CStr(.fields("PuhVchNo")) & " dated " & Dtoc(.fields("PuhDate"))
    End If
    End With
    CloseTable tRecset
    If ChkEntryExist = False Then
        With tRecset
        .open "Select * from MedSaleHdr where SahMptCode = " & CStr(mCode) & "", m_dbVgnDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            ChkEntryExist = True
            ErrorBox "Used in Sales/Purchase Return " & CStr(.fields("SahVchNo")) & " dated " & Dtoc(.fields("SahDate"))
        End If
        End With
        CloseTable tRecset
    End If

ElseIf blnMedPrtGrpMast = True Then
    With tRecset
    .open "Select * from MedPrtMast where MptMpgCode = " & CStr(mCode) & "", m_dbVgnDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        ChkEntryExist = True
        ErrorBox "Used in Party Master " & CStr(.fields("MptName"))
    End If
    End With
    CloseTable tRecset

ElseIf blnMedItmMast = True Then
    With tRecset
    .open "Select * from MedPurchDtl dtl" _
        & " left join MedPurchHdr hdr on dtl.PurCode = hdr.PuhCode" _
        & " where PurMdiCode = " & CStr(mCode) & "" _
        , m_dbVgnDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        ChkEntryExist = True
        If IsNull(.fields("PuhCode")) = False Then
            ErrorBox "Used in Purchase/Sales Return " & CStr(.fields("PuhVchNo")) & " dated " & Dtoc(.fields("PuhDate"))
        Else
            ErrorBox "Entry Under Process in Purchase/Sales Return dated " & Dtoc(.fields("PurDate"))
        End If
    End If
    End With
    CloseTable tRecset
    If ChkEntryExist = False Then
        With tRecset
        .open "Select * from MedSaleDtl dtl" _
            & " left join MedSaleHdr hdr on dtl.SalCode = hdr.SahCode" _
            & " where SalMdiCode = " & CStr(mCode) & "" _
            , m_dbVgnDatabase, adOpenKeyset, adLockReadOnly
        If .RecordCount > 0 Then
            ChkEntryExist = True
            If IsNull(.fields("SahCode")) = False Then
                ErrorBox "Used in Sales/Purchase Return " & CStr(.fields("SahVchNo")) & " dated " & Dtoc(.fields("SahDate"))
            Else
                ErrorBox "Entry Under Process in Sales/Purchase Return dated " & Dtoc(.fields("SalDate"))
            End If
        End If
        End With
        CloseTable tRecset
    End If
    
ElseIf blnMedItmGrpMast = True Then
    With tRecset
    .open "Select * from MedItmMast where MdiMigCode = " & CStr(mCode) & "", m_dbVgnDatabase, adOpenKeyset, adLockReadOnly
    If .RecordCount > 0 Then
        ChkEntryExist = True
        ErrorBox "Used in Item Master " & CStr(.fields("MdiName"))
    End If
    End With
    CloseTable tRecset

ElseIf blnMonthRepFmt1stMast = True Then
    Rem no such checking

ElseIf blnMonthRepFmt2ndMast = True Then
    Rem no such checking
    
Else
    ErrorBox "clsVgnMasterEntry_ChkEntryExist_#1001_[Undefined Case]"
End If

'MsgBox "ChkEntryExist Pending !!!"

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Function

End Function



Rem *************************************** end of class ************************************

