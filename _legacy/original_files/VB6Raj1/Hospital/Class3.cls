VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Class1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False

Option Explicit

Dim m_dbHmsDatabase As ADODB.Connection, m_dbAcDatabase As ADODB.Connection, m_dbStDatabase As ADODB.Connection
Dim mTableName As String, mCodeField As String, mNameField As String, mRecStateField As String, mTitleName As String
Public blnPatMastOptMast As Boolean, blnIndrRegOptMast As Boolean, blnBedMastOptMast As Boolean, , blnIndrBillOptMast As Boolean, blnIndrBlPymtOptMast As Boolean, blnIndrBlRefdOptMast As Boolean, blnServRateSysOptMast As Boolean
Dim blnStationMast As Boolean, blnAreaMast As Boolean, blnVTypeMast As Boolean
Rem Patient Registration
Public mPttRegNoAutoNumber_bln As Boolean, mPttRegNoAddModeChange_bln As Boolean, mPttRegNoEditModeChange_bln As Boolean, mPttRegNoNotZero_bln As Boolean, mPttAraCodeDef_lng As Long, mPttStnCodeDef_lng As Long, mPttPcgCodeDef_lng As Long, mPttAhCodeDef_lng As Long
Public mPttAraCodeCfd_bln As Boolean, mPttStnCodeCfd_bln As Boolean, mPttPcgCodeCfd_bln As Boolean, mPttAhCodeCfd_bln As Boolean
Public mPttAraCodeOld_lng As Long, mPttStnCodeOld_lng As Long, mPttPcgCodeOld_lng As Long, mPttAhCodeOld_lng As Long
Rem Indoor Registration
Public mIpgPttRegNoAutoNumber_bln As Boolean, mIpgPttRegNoAddModeChange_bln As Boolean, mIpgPttRegNoEditModeChange_bln As Boolean, mIpgPttRegNoNotZero_bln As Boolean, mIpgAraCodeDef_lng As Long, mIpgStnCodeDef_lng As Long, mIpgPcgCodeDef_lng As Long, mIpgPttAhCodeDef_lng As Long, mIpgVtmCodeDef_lng As Long, mIpgCDctCodeDef_lng As Long, mIpgRByCodeDef_lng As Long, mIpgFDigCodeDef_lng As Long, mIpgBdmCodeDef_lng As Long
Public mIpgAraCodeCfd_bln As Boolean, mIpgStnCodeCfd_bln As Boolean, mIpgPcgCodeCfd_bln As Boolean, mIpgPttAhCodeCfd_bln As Boolean, mIpgVtmCodeCfd_bln As Boolean, mIpgCDctCodeCfd_bln As Boolean, mIpgRByCodeCfd_bln As Boolean, mIpgFDigCodeCfd_bln As Boolean, mIpgBdmCodeCfd_bln As Boolean
Public mIpgAraCodeOld_lng As Long, mIpgStnCodeOld_lng As Long, mIpgPcgCodeOld_lng As Long, mIpgPttAhCodeOld_lng As Long, mIpgVtmCodeOld_lng As Long, mIpgCDctCodeOld_lng As Long, mIpgRByCodeOld_lng As Long, mIpgFDigCodeOld_lng As Long, mIpgBdmCodeOld_lng As Long
Rem Bed Master
Public mBdmChkTimeDef_lng As Long, mBdmFlrCodeDef_lng As Long, mBdmWrdCodeDef_lng As Long
Public mBdmChkTimeCfd_bln As Boolean, mBdmFlrCodeCfd_bln As Boolean, mBdmWrdCodeCfd_bln As Boolean
Public mBdmChkTimeOld_lng As Long, mBdmFlrCodeOld_lng As Long, mBdmWrdCodeOld_lng As Long
Rem service charges/share system
Public mExtServRateSys_bln As Boolean, mDctwseServRateSys_bln As Boolean, mPcgwseServRateSys_bln As Boolean, mRBywseServRateSys_bln As Boolean, mRTowseServRateSys_bln As Boolean, mTimewseServRateSys_bln As Boolean
Public mExtServDiscSys_bln As Boolean, mDctwseServDiscSys_bln As Boolean, mPcgwseServDiscSys_bln As Boolean, mRBywseServDiscSys_bln As Boolean, mRTowseServDiscSys_bln As Boolean, mTimewseServDiscSys_bln As Boolean
Public mExtServBargSys_bln As Boolean, mDctwseServBargSys_bln As Boolean, mPcgwseServBargSys_bln As Boolean, mRBywseServBargSys_bln As Boolean, mRTowseServBargSys_bln As Boolean, mTimewseServBargSys_bln As Boolean
Public mExtServShareSys_bln As Boolean, mDctwseServShareSys_bln As Boolean, mPcgwseServShareSys_bln As Boolean, mRBywseServShareSys_bln As Boolean, mRTowseServShareSys_bln As Boolean, mTimewseServShareSys_bln As Boolean


Rem
Public mCode_lng As Long, mName_str As String, mRecState_int As Integer
Public mVtmAbvr_str As String, mVtmSysCode_int As Integer, mVtmPrefix_str As String, mVtmPostfix_str As String, mVtmItmNarr_str As String, mVtmComNarr_str As String, mVtmEditable_bln As Boolean, mVtmStartNo_lng As Long, mVtmResetNoBasis_int As Integer, mVtmIndex_int As Integer, mVtmShowInList_bln As Boolean
Dim mActiveMast As Integer, aMastTran() As Variant

Public Sub Init()
Rem this options will be maintained at node level system not on server level system because
Rem one user will enter patient category as general where other may be entering student

If blnPatMastOptMast = True Then
    mTableName = ""
    mCodeField = ""
    mNameField = ""
    mRecStateField = ""
    mTitleName = "Patient Registration"
    
ElseIf blnIndrRegOptMast = True Then
    mTableName = ""
    mCodeField = ""
    mNameField = ""
    mRecStateField = ""
    mTitleName = "Indoor Registration"

ElseIf blnBedMastOptMast = True Then
    mTableName = ""
    mCodeField = ""
    mNameField = ""
    mRecStateField = ""
    mTitleName = "Bed Master"
    
    
ElseIf blnServRateSysOptMast = True Then
    mTableName = ""
    mCodeField = ""
    mNameField = ""
    mRecStateField = ""
    mTitleName = "Extended Service Charges/Share System"
    
Else
    ErrorBox "clsHmsOpdOptionsEntry_Init_#52_[Undefined Case]"
End If

End Sub

Public Sub ResetInit()

blnPatMastOptMast = False
blnIndrRegOptMast = False
blnBedMastOptMast = False
blnServRateSysOptMast = False

End Sub

Public Property Set dbAcDatabase(ByRef db As ADODB.Connection)
Set m_dbAcDatabase = db

End Property

Public Property Set dbStDatabase(ByRef db As ADODB.Connection)
Set m_dbStDatabase = db

End Property

Private Sub Class_Initialize()
aMastTran = Array()
mActiveMast = UBound(aMastTran)

End Sub

Public Sub GetPatMastOptData()
Dim mOptTitle As String, mOptValue As String
Dim tRecset As New ADODB.Recordset, acount As Integer, fhand As Integer

Me.Clear
If FileExist(PatMastOptFileFullPath) = True Then
    fhand = FreeFile
    Open PatMastOptFileFullPath For Input As #fhand
    Do While EOF(fhand) = False
        Input #fhand, mOptTitle, mOptValue
        mOptTitle = UCase(mOptTitle)
        Select Case mOptTitle
        Case UCase("PttRegNoAutoNumber")
            mPttRegNoAutoNumber_bln = mOptValue
        Case UCase("PttRegNoAddModeChange")
            mPttRegNoAddModeChange_bln = mOptValue
        Case UCase("PttRegNoEditModeChange")
            mPttRegNoEditModeChange_bln = mOptValue
        Case UCase("PttRegNoNotZero")
            mPttRegNoNotZero_bln = mOptValue
        Case UCase("PttAraCodeDef")
            mPttAraCodeDef_lng = mOptValue
        Case UCase("PttStnCodeDef")
            mPttStnCodeDef_lng = mOptValue
        Case UCase("PttPcgCodeDef")
            mPttPcgCodeDef_lng = mOptValue
        Case UCase("PttAhCodeDef")
            mPttAhCodeDef_lng = mOptValue
        ' ----------------
        Case UCase("PttAraCodeCfd")
            mPttAraCodeCfd_bln = mOptValue
        Case UCase("PttStnCodeCfd")
            mPttStnCodeCfd_bln = mOptValue
        Case UCase("PttPcgCodeCfd")
            mPttPcgCodeCfd_bln = mOptValue
        Case UCase("PttAhCodeCfd")
            mPttAhCodeCfd_bln = mOptValue
        Case Else
            AlertBox "clsHmsOpdOptionsEntry_GetPatMastOptData_#420_[Undefined Case_" & mOptTitle & "]"
        End Select
    Loop
    Close #fhand
End If
If FileExist(PatMastOldFileFullPath) = True Then
    fhand = FreeFile
    Open PatMastOldFileFullPath For Input As #fhand
    Do While EOF(fhand) = False
        Input #fhand, mOptTitle, mOptValue
        mOptTitle = UCase(mOptTitle)
        Select Case mOptTitle
        Case UCase("PttAraCodeOld")
            mPttAraCodeOld_lng = mOptValue
        Case UCase("PttStnCodeOld")
            mPttStnCodeOld_lng = mOptValue
        Case UCase("PttPcgCodeOld")
            mPttPcgCodeOld_lng = mOptValue
        Case UCase("PttAhCodeOld")
            mPttAhCodeOld_lng = mOptValue
        Case Else
            AlertBox "clsHmsOpdOptionsEntry_GetPatMastOptData_#441_[Undefined Case_" & mOptTitle & "]"
        End Select
    Loop
    Close #fhand
End If

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Sub

End Sub

Public Sub GetIndrRegOptData()
Dim mOptTitle As String, mOptValue As String
Dim tRecset As New ADODB.Recordset, acount As Integer, fhand As Integer

Me.Clear
If FileExist(IndrRegOptFileFullPath) = True Then
    fhand = FreeFile
    Open IndrRegOptFileFullPath For Input As #fhand
    Do While EOF(fhand) = False
        Input #fhand, mOptTitle, mOptValue
        mOptTitle = UCase(mOptTitle)
        Select Case mOptTitle
        Case UCase("IpgPttRegNoAutoNumber")
            mIpgPttRegNoAutoNumber_bln = mOptValue
        Case UCase("IpgPttRegNoAddModeChange")
            mIpgPttRegNoAddModeChange_bln = mOptValue
        Case UCase("IpgPttRegNoEditModeChange")
            mIpgPttRegNoEditModeChange_bln = mOptValue
        Case UCase("IpgPttRegNoNotZero")
            mIpgPttRegNoNotZero_bln = mOptValue
        Case UCase("IpgAraCodeDef")
            mIpgAraCodeDef_lng = mOptValue
        Case UCase("IpgStnCodeDef")
            mIpgStnCodeDef_lng = mOptValue
        Case UCase("IpgPcgCodeDef")
            mIpgPcgCodeDef_lng = mOptValue
        Case UCase("IpgPttAhCodeDef")
            mIpgPttAhCodeDef_lng = mOptValue
        Case UCase("IpgVtmCodeDef")
            mIpgVtmCodeDef_lng = mOptValue
        Case UCase("IpgCDctCodeDef")
            mIpgCDctCodeDef_lng = mOptValue
        Case UCase("IpgRByCodeDef")
            mIpgRByCodeDef_lng = mOptValue
        Case UCase("IpgFDigCodeDef")
            mIpgFDigCodeDef_lng = mOptValue
        Case UCase("IpgBdmCodeDef")
            mIpgBdmCodeDef_lng = mOptValue
        ' ----------------
        Case UCase("IpgAraCodeCfd")
            mIpgAraCodeCfd_bln = mOptValue
        Case UCase("IpgStnCodeCfd")
            mIpgStnCodeCfd_bln = mOptValue
        Case UCase("IpgPcgCodeCfd")
            mIpgPcgCodeCfd_bln = mOptValue
        Case UCase("IpgPttAhCodeCfd")
            mIpgPttAhCodeCfd_bln = mOptValue
        Case UCase("IpgVtmCodeCfd")
            mIpgVtmCodeCfd_bln = mOptValue
        Case UCase("IpgCDctCodeCfd")
            mIpgCDctCodeCfd_bln = mOptValue
        Case UCase("IpgRByCodeCfd")
            mIpgRByCodeCfd_bln = mOptValue
        Case UCase("IpgFDigCodeCfd")
            mIpgFDigCodeCfd_bln = mOptValue
        Case UCase("IpgBdmCodeCfd")
            mIpgBdmCodeCfd_bln = mOptValue
        Case Else
            AlertBox "clsHmsOpdOptionsEntry_GetIndrRegOptData_#687_[Undefined Case_" & mOptTitle & "]"
        End Select
    Loop
    Close #fhand
End If
If FileExist(IndrRegOldFileFullPath) = True Then
    fhand = FreeFile
    Open IndrRegOldFileFullPath For Input As #fhand
    Do While EOF(fhand) = False
        Input #fhand, mOptTitle, mOptValue
        mOptTitle = UCase(mOptTitle)
        Select Case mOptTitle
        Case UCase("IpgAraCodeOld")
            mIpgAraCodeOld_lng = mOptValue
        Case UCase("IpgStnCodeOld")
            mIpgStnCodeOld_lng = mOptValue
        Case UCase("IpgPcgCodeOld")
            mIpgPcgCodeOld_lng = mOptValue
        Case UCase("IpgPttAhCodeOld")
            mIpgPttAhCodeOld_lng = mOptValue
        Case UCase("IpgVtmCodeOld")
            mIpgVtmCodeOld_lng = mOptValue
        Case UCase("IpgCDctCodeOld")
            mIpgCDctCodeOld_lng = mOptValue
        Case UCase("IpgRByCodeOld")
            mIpgRByCodeOld_lng = mOptValue
        Case UCase("IpgFDigCodeOld")
            mIpgFDigCodeOld_lng = mOptValue
        Case UCase("IpgBdmCodeOld")
            mIpgBdmCodeOld_lng = mOptValue
        Case Else
            AlertBox "clsHmsOpdOptionsEntry_GetIndrRegOptData_#718_[Undefined Case_" & mOptTitle & "]"
        End Select
    Loop
    Close #fhand
End If

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Sub

End Sub

Public Sub GetBedMastOptData()
Dim mOptTitle As String, mOptValue As String
Dim tRecset As New ADODB.Recordset, acount As Integer, fhand As Integer

Me.Clear
If FileExist(BedMastOptFileFullPath) = True Then
    fhand = FreeFile
    Open BedMastOptFileFullPath For Input As #fhand
    Do While EOF(fhand) = False
        Input #fhand, mOptTitle, mOptValue
        mOptTitle = UCase(mOptTitle)
        Select Case mOptTitle
        Case UCase("BdmChkTimeDef")
            mBdmChkTimeDef_lng = mOptValue
        Case UCase("BdmFlrCodeDef")
            mBdmFlrCodeDef_lng = mOptValue
        Case UCase("BdmWrdCodeDef")
            mBdmWrdCodeDef_lng = mOptValue
        ' ----------------
        Case UCase("BdmChkTimeCfd")
            mBdmChkTimeCfd_bln = mOptValue
        Case UCase("BdmFlrCodeCfd")
            mBdmFlrCodeCfd_bln = mOptValue
        Case UCase("BdmWrdCodeCfd")
            mBdmWrdCodeCfd_bln = mOptValue
        Case Else
            AlertBox "clsHmsOpdOptionsEntry_GetBedMastOptData_#709_[Undefined Case_" & mOptTitle & "]"
        End Select
    Loop
    Close #fhand
End If
If FileExist(BedMastOldFileFullPath) = True Then
    fhand = FreeFile
    Open BedMastOldFileFullPath For Input As #fhand
    Do While EOF(fhand) = False
        Input #fhand, mOptTitle, mOptValue
        mOptTitle = UCase(mOptTitle)
        Select Case mOptTitle
        Case UCase("BdmChkTimeOld")
            mBdmChkTimeOld_lng = mOptValue
        Case UCase("BdmFlrCodeOld")
            mBdmFlrCodeOld_lng = mOptValue
        Case UCase("BdmWrdCodeOld")
            mBdmWrdCodeOld_lng = mOptValue
        Case Else
            AlertBox "clsHmsOpdOptionsEntry_GetBedMastOptData_#730_[Undefined Case_" & mOptTitle & "]"
        End Select
    Loop
    Close #fhand
End If

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Sub

End Sub


Public Sub GetServRateSysOptData()
Dim mOptTitle As String, mOptValue As String
Dim tRecset As New ADODB.Recordset, acount As Integer, fhand As Integer

Me.Clear
If FileExist(ExtServRateOptFileFullPath) = True Then
    fhand = FreeFile
    Open ExtServRateOptFileFullPath For Input As #fhand
    Do While EOF(fhand) = False
        Input #fhand, mOptTitle, mOptValue
        mOptTitle = UCase(mOptTitle)
        Select Case mOptTitle
        Case UCase("ExtServRateSys")
            mExtServRateSys_bln = mOptValue
        Case UCase("DctwseServRateSys")
            mDctwseServRateSys_bln = mOptValue
        Case UCase("PcgwseServRateSys")
            mPcgwseServRateSys_bln = mOptValue
        Case UCase("RBywseServRateSys")
            mRBywseServRateSys_bln = mOptValue
        Case UCase("RTowseServRateSys")
            mRTowseServRateSys_bln = mOptValue
        Case UCase("TimewseServRateSys")
            mTimewseServRateSys_bln = mOptValue
        ' ---------------------------------
        Case UCase("ExtServDiscSys")
            mExtServDiscSys_bln = mOptValue
        Case UCase("DctwseServDiscSys")
            mDctwseServDiscSys_bln = mOptValue
        Case UCase("PcgwseServDiscSys")
            mPcgwseServDiscSys_bln = mOptValue
        Case UCase("RBywseServDiscSys")
            mRBywseServDiscSys_bln = mOptValue
        Case UCase("RTowseServDiscSys")
            mRTowseServDiscSys_bln = mOptValue
        Case UCase("TimewseServDiscSys")
            mTimewseServDiscSys_bln = mOptValue
        ' --------------------------------------
        Case UCase("ExtServBargSys")
            mExtServBargSys_bln = mOptValue
        Case UCase("DctwseServBargSys")
            mDctwseServBargSys_bln = mOptValue
        Case UCase("PcgwseServBargSys")
            mPcgwseServBargSys_bln = mOptValue
        Case UCase("RBywseServBargSys")
            mRBywseServBargSys_bln = mOptValue
        Case UCase("RTowseServBargSys")
            mRTowseServBargSys_bln = mOptValue
        Case UCase("TimewseServBargSys")
            mTimewseServBargSys_bln = mOptValue
        ' -------------------------------------------
        Case UCase("ExtServShareSys")
            mExtServShareSys_bln = mOptValue
        Case UCase("DctwseServShareSys")
            mDctwseServShareSys_bln = mOptValue
        Case UCase("PcgwseServShareSys")
            mPcgwseServShareSys_bln = mOptValue
        Case UCase("RBywseServShareSys")
            mRBywseServShareSys_bln = mOptValue
        Case UCase("RTowseServShareSys")
            mRTowseServShareSys_bln = mOptValue
        Case UCase("TimewseServShareSys")
            mTimewseServShareSys_bln = mOptValue
        Case Else
            AlertBox "clsHmsOpdOptionsEntry_GetExtServRateOptData_#677_[Undefined Case_" & mOptTitle & "]"
        End Select
    Loop
    Close #fhand
End If
    
EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Sub

End Sub

Public Function GetPatMastOptBoundCode(ByVal mOptTitle As String) As Long
Dim mRtnval As Long
mRtnval = 0

mOptTitle = UCase(mOptTitle)
Select Case mOptTitle
Case UCase("PttAraCode")
    mRtnval = IIf(mPttAraCodeCfd_bln = True, mPttAraCodeOld_lng, mPttAraCodeDef_lng)
Case UCase("PttStnCode")
    mRtnval = IIf(mPttStnCodeCfd_bln = True, mPttStnCodeOld_lng, mPttStnCodeDef_lng)
Case UCase("PttPcgCode")
    mRtnval = IIf(mPttPcgCodeCfd_bln = True, mPttPcgCodeOld_lng, mPttPcgCodeDef_lng)
Case UCase("PttAhCode")
    mRtnval = IIf(mPttAhCodeCfd_bln = True, mPttAhCodeOld_lng, mPttAhCodeDef_lng)
Case Else
    AlertBox "clsHmsOpdOptionsEntry_GetPatMastOptBoundCode_#888_[Undefined Case_" & mOptTitle & "]"
End Select

GetPatMastOptBoundCode = mRtnval

End Function

Public Function GetIndrRegOptBoundCode(ByVal mOptTitle As String) As Long
Dim mRtnval As Long
mRtnval = 0

mOptTitle = UCase(mOptTitle)
Select Case mOptTitle
Case UCase("IpgAraCode")
    mRtnval = IIf(mIpgAraCodeCfd_bln = True, mIpgAraCodeOld_lng, mIpgAraCodeDef_lng)
Case UCase("IpgStnCode")
    mRtnval = IIf(mIpgStnCodeCfd_bln = True, mIpgStnCodeOld_lng, mIpgStnCodeDef_lng)
Case UCase("IpgPcgCode")
    mRtnval = IIf(mIpgPcgCodeCfd_bln = True, mIpgPcgCodeOld_lng, mIpgPcgCodeDef_lng)
Case UCase("IpgPttAhCode")
    mRtnval = IIf(mIpgPttAhCodeCfd_bln = True, mIpgPttAhCodeOld_lng, mIpgPttAhCodeDef_lng)
Case UCase("IpgVtmCode")
    mRtnval = IIf(mIpgVtmCodeCfd_bln = True, mIpgVtmCodeOld_lng, mIpgVtmCodeDef_lng)
Case UCase("IpgCDctCode")
    mRtnval = IIf(mIpgCDctCodeCfd_bln = True, mIpgCDctCodeOld_lng, mIpgCDctCodeDef_lng)
Case UCase("IpgRByCode")
    mRtnval = IIf(mIpgRByCodeCfd_bln = True, mIpgRByCodeOld_lng, mIpgRByCodeDef_lng)
Case UCase("IpgFDigCode")
    mRtnval = IIf(mIpgFDigCodeCfd_bln = True, mIpgFDigCodeOld_lng, mIpgFDigCodeDef_lng)
Case UCase("IpgBdmCode")
    mRtnval = IIf(mIpgBdmCodeCfd_bln = True, mIpgBdmCodeOld_lng, mIpgBdmCodeDef_lng)
Case Else
    ErrorBox "clsHmsOpdOptionsEntry_GetIndrRegOptBoundCode_#1037_[Undefined Case_" & mOptTitle & "]"
End Select

GetIndrRegOptBoundCode = mRtnval

End Function

Public Function GetBedMastOptBoundCode(ByVal mOptTitle As String) As Long
Dim mRtnval As Long
mRtnval = 0

mOptTitle = UCase(mOptTitle)
Select Case mOptTitle
Case UCase("BdmChkTime")
    mRtnval = IIf(mBdmChkTimeCfd_bln = True, mBdmChkTimeOld_lng, mBdmChkTimeDef_lng)
Case UCase("BdmFlrCode")
    mRtnval = IIf(mBdmFlrCodeCfd_bln = True, mBdmFlrCodeOld_lng, mBdmFlrCodeDef_lng)
Case UCase("BdmWrdCode")
    mRtnval = IIf(mBdmWrdCodeCfd_bln = True, mBdmWrdCodeOld_lng, mBdmWrdCodeDef_lng)
Case Else
    AlertBox "clsHmsOpdOptionsEntry_GetBedMastOptBoundCode_#1033_[Undefined Case_" & mOptTitle & "]"
End Select

GetBedMastOptBoundCode = mRtnval

End Function


Public Sub Clear()

If blnPatMastOptMast = True Then
    mPttRegNoAutoNumber_bln = False
    mPttRegNoAddModeChange_bln = False
    mPttRegNoEditModeChange_bln = False
    mPttRegNoNotZero_bln = False
    mPttAraCodeDef_lng = 0
    mPttStnCodeDef_lng = 0
    mPttPcgCodeDef_lng = 0
    mPttAhCodeDef_lng = 0
    ' ---------------
    mPttAraCodeCfd_bln = False
    mPttStnCodeCfd_bln = False
    mPttPcgCodeCfd_bln = False
    mPttAhCodeCfd_bln = False
    ' ------------------------
    mPttAraCodeOld_lng = 0
    mPttStnCodeOld_lng = 0
    mPttPcgCodeOld_lng = 0
    mPttAhCodeOld_lng = 0

ElseIf blnIndrRegOptMast = True Then
    mIpgPttRegNoAutoNumber_bln = False
    mIpgPttRegNoAddModeChange_bln = False
    mIpgPttRegNoEditModeChange_bln = False
    mIpgPttRegNoNotZero_bln = False
    mIpgAraCodeDef_lng = 0
    mIpgStnCodeDef_lng = 0
    mIpgPcgCodeDef_lng = 0
    mIpgPttAhCodeDef_lng = 0
    mIpgVtmCodeDef_lng = 0
    mIpgCDctCodeDef_lng = 0
    mIpgRByCodeDef_lng = 0
    mIpgFDigCodeDef_lng = 0
    mIpgBdmCodeDef_lng = 0
    ' ---------------
    mIpgAraCodeCfd_bln = False
    mIpgStnCodeCfd_bln = False
    mIpgPcgCodeCfd_bln = False
    mIpgPttAhCodeCfd_bln = False
    mIpgVtmCodeCfd_bln = False
    mIpgCDctCodeCfd_bln = False
    mIpgRByCodeCfd_bln = False
    mIpgFDigCodeCfd_bln = False
    mIpgBdmCodeCfd_bln = False
    ' ------------------------
    mIpgAraCodeOld_lng = 0
    mIpgStnCodeOld_lng = 0
    mIpgPcgCodeOld_lng = 0
    mIpgPttAhCodeOld_lng = 0
    mIpgVtmCodeOld_lng = 0
    mIpgCDctCodeOld_lng = 0
    mIpgRByCodeOld_lng = 0
    mIpgFDigCodeOld_lng = 0
    mIpgBdmCodeOld_lng = 0

ElseIf blnBedMastOptMast = True Then
    mBdmChkTimeDef_lng = 0
    mBdmFlrCodeDef_lng = 0
    mBdmWrdCodeDef_lng = 0
    ' ---------------
    mBdmChkTimeCfd_bln = False
    mBdmFlrCodeCfd_bln = False
    mBdmWrdCodeCfd_bln = False
    ' ------------------------
    mBdmChkTimeOld_lng = 0
    mBdmFlrCodeOld_lng = 0
    mBdmWrdCodeOld_lng = 0
    
    
ElseIf blnServRateSysOptMast = True Then
    mExtServRateSys_bln = False
    mDctwseServRateSys_bln = False
    mPcgwseServRateSys_bln = False
    mRBywseServRateSys_bln = False
    mRTowseServRateSys_bln = False
    mTimewseServRateSys_bln = False
    ' -----------------------------------
    mExtServDiscSys_bln = False
    mDctwseServDiscSys_bln = False
    mPcgwseServDiscSys_bln = False
    mRBywseServDiscSys_bln = False
    mRTowseServDiscSys_bln = False
    mTimewseServDiscSys_bln = False
    ' -----------------------------------
    mExtServBargSys_bln = False
    mDctwseServBargSys_bln = False
    mPcgwseServBargSys_bln = False
    mRBywseServBargSys_bln = False
    mRTowseServBargSys_bln = False
    mTimewseServBargSys_bln = False
    ' -----------------------------------
    mExtServShareSys_bln = False
    mDctwseServShareSys_bln = False
    mPcgwseServShareSys_bln = False
    mRBywseServShareSys_bln = False
    mRTowseServShareSys_bln = False
    mTimewseServShareSys_bln = False
    ' -----------------------------------
    
Else
    ErrorBox "clsHmsOpdOptionsEntry_Clear_#906_[Undefined Case]"

End If

End Sub

Private Sub Class_Terminate()
'If UBound(aMastTran) >= LBound(aMastTran) Then
'    ErrorBox mTitleName & " Entry in Process !!!"
'End If

End Sub

Public Function UpdatePatMastOpt() As Boolean
Dim fhand As Integer
Dim mOptTitle As String, mOptValue As String

UpdatePatMastOpt = False
On Error GoTo errhand

fhand = FreeFile
Open PatMastOptFileFullPath For Output As #fhand

Write #fhand, UCase("PttRegNoAutoNumber"), mPttRegNoAutoNumber_bln
Write #fhand, UCase("PttRegNoAddModeChange"), mPttRegNoAddModeChange_bln
Write #fhand, UCase("PttRegNoEditModeChange"), mPttRegNoEditModeChange_bln
Write #fhand, UCase("PttRegNoNotZero"), mPttRegNoNotZero_bln
Write #fhand, UCase("PttAraCodeDef"), mPttAraCodeDef_lng
Write #fhand, UCase("PttStnCodeDef"), mPttStnCodeDef_lng
Write #fhand, UCase("PttPcgCodeDef"), mPttPcgCodeDef_lng
Write #fhand, UCase("PttAhCodeDef"), mPttAhCodeDef_lng
' ----------------
Write #fhand, UCase("PttAraCodeCfd"), mPttAraCodeCfd_bln
Write #fhand, UCase("PttStnCodeCfd"), mPttStnCodeCfd_bln
Write #fhand, UCase("PttPcgCodeCfd"), mPttPcgCodeCfd_bln
Write #fhand, UCase("PttAhCodeCfd"), mPttAhCodeCfd_bln
' -----------------------------------------
Close #fhand

UpdatePatMastOpt = True
GoTo EndSub

errhand:
MsgBox Err.Description

EndSub:
Exit Function

End Function

Public Function UpdatePatMastOld() As Boolean
Dim fhand As Integer
Dim mOptTitle As String, mOptValue As String

UpdatePatMastOld = False
On Error GoTo errhand

fhand = FreeFile
Open PatMastOldFileFullPath For Output As #fhand

Write #fhand, UCase("PttAraCodeOld"), mPttAraCodeOld_lng
Write #fhand, UCase("PttStnCodeOld"), mPttStnCodeOld_lng
Write #fhand, UCase("PttPcgCodeOld"), mPttPcgCodeOld_lng
Write #fhand, UCase("PttAhCodeOld"), mPttAhCodeOld_lng
' -----------------------------------------
Close #fhand
' -----------------------------------------
UpdatePatMastOld = True
GoTo EndSub

errhand:
MsgBox Err.Description

EndSub:
Exit Function

End Function

Public Function UpdateIndrRegOpt() As Boolean
Dim fhand As Integer
Dim mOptTitle As String, mOptValue As String

UpdateIndrRegOpt = False
On Error GoTo errhand

fhand = FreeFile
Open IndrRegOptFileFullPath For Output As #fhand

Write #fhand, UCase("IpgPttRegNoAutoNumber"), mIpgPttRegNoAutoNumber_bln
Write #fhand, UCase("IpgPttRegNoAddModeChange"), mIpgPttRegNoAddModeChange_bln
Write #fhand, UCase("IpgPttRegNoEditModeChange"), mIpgPttRegNoEditModeChange_bln
Write #fhand, UCase("IpgPttRegNoNotZero"), mIpgPttRegNoNotZero_bln
Write #fhand, UCase("IpgAraCodeDef"), mIpgAraCodeDef_lng
Write #fhand, UCase("IpgStnCodeDef"), mIpgStnCodeDef_lng
Write #fhand, UCase("IpgPcgCodeDef"), mIpgPcgCodeDef_lng
Write #fhand, UCase("IpgPttAhCodeDef"), mIpgPttAhCodeDef_lng
Write #fhand, UCase("IpgVtmCodeDef"), mIpgVtmCodeDef_lng
Write #fhand, UCase("IpgCDctCodeDef"), mIpgCDctCodeDef_lng
Write #fhand, UCase("IpgRByCodeDef"), mIpgRByCodeDef_lng
Write #fhand, UCase("IpgFDigCodeDef"), mIpgFDigCodeDef_lng
Write #fhand, UCase("IpgBdmCodeDef"), mIpgBdmCodeDef_lng
' ----------------
Write #fhand, UCase("IpgAraCodeCfd"), mIpgAraCodeCfd_bln
Write #fhand, UCase("IpgStnCodeCfd"), mIpgStnCodeCfd_bln
Write #fhand, UCase("IpgPcgCodeCfd"), mIpgPcgCodeCfd_bln
Write #fhand, UCase("IpgPttAhCodeCfd"), mIpgPttAhCodeCfd_bln
Write #fhand, UCase("IpgVtmCodeCfd"), mIpgVtmCodeCfd_bln
Write #fhand, UCase("IpgCDctCodeCfd"), mIpgCDctCodeCfd_bln
Write #fhand, UCase("IpgRByCodeCfd"), mIpgRByCodeCfd_bln
Write #fhand, UCase("IpgFDigCodeCfd"), mIpgFDigCodeCfd_bln
Write #fhand, UCase("IpgBdmCodeCfd"), mIpgBdmCodeCfd_bln
' -----------------------------------------
Close #fhand

UpdateIndrRegOpt = True
GoTo EndSub

errhand:
MsgBox Err.Description

EndSub:
Exit Function

End Function

Public Function UpdateIndrRegOld() As Boolean
Dim fhand As Integer
Dim mOptTitle As String, mOptValue As String

UpdateIndrRegOld = False
On Error GoTo errhand

fhand = FreeFile
Open IndrRegOldFileFullPath For Output As #fhand

Write #fhand, UCase("IpgAraCodeOld"), mIpgAraCodeOld_lng
Write #fhand, UCase("IpgStnCodeOld"), mIpgStnCodeOld_lng
Write #fhand, UCase("IpgPcgCodeOld"), mIpgPcgCodeOld_lng
Write #fhand, UCase("IpgPttAhCodeOld"), mIpgPttAhCodeOld_lng
Write #fhand, UCase("IpgVtmCodeOld"), mIpgVtmCodeOld_lng
Write #fhand, UCase("IpgCDctCodeOld"), mIpgCDctCodeOld_lng
Write #fhand, UCase("IpgRByCodeOld"), mIpgRByCodeOld_lng
Write #fhand, UCase("IpgFDigCodeOld"), mIpgFDigCodeOld_lng
Write #fhand, UCase("IpgBdmCodeOld"), mIpgBdmCodeOld_lng
' -----------------------------------------
Close #fhand
' -----------------------------------------
UpdateIndrRegOld = True
GoTo EndSub

errhand:
MsgBox Err.Description

EndSub:
Exit Function

End Function

Public Function UpdateBedMastOpt() As Boolean
Dim fhand As Integer
Dim mOptTitle As String, mOptValue As String

UpdateBedMastOpt = False
On Error GoTo errhand

fhand = FreeFile
Open BedMastOptFileFullPath For Output As #fhand

Write #fhand, UCase("BdmChkTimeDef"), mBdmChkTimeDef_lng
Write #fhand, UCase("BdmFlrCodeDef"), mBdmFlrCodeDef_lng
Write #fhand, UCase("BdmWrdCodeDef"), mBdmWrdCodeDef_lng
' ----------------
Write #fhand, UCase("BdmChkTimeCfd"), mBdmChkTimeCfd_bln
Write #fhand, UCase("BdmFlrCodeCfd"), mBdmFlrCodeCfd_bln
Write #fhand, UCase("BdmWrdCodeCfd"), mBdmWrdCodeCfd_bln
' -----------------------------------------
Close #fhand

UpdateBedMastOpt = True
GoTo EndSub

errhand:
MsgBox Err.Description

EndSub:
Exit Function

End Function

Public Function UpdateBedMastOld() As Boolean
Dim fhand As Integer
Dim mOptTitle As String, mOptValue As String

UpdateBedMastOld = False
On Error GoTo errhand

fhand = FreeFile
Open BedMastOldFileFullPath For Output As #fhand

Write #fhand, UCase("BdmChkTimeOld"), mBdmChkTimeOld_lng
Write #fhand, UCase("BdmFlrCodeOld"), mBdmFlrCodeOld_lng
Write #fhand, UCase("BdmWrdCodeOld"), mBdmWrdCodeOld_lng
' -----------------------------------------
Close #fhand
' -----------------------------------------
UpdateBedMastOld = True
GoTo EndSub

errhand:
MsgBox Err.Description

EndSub:
Exit Function

End Function


Public Function UpdateExtServRateOpt() As Boolean
Dim fhand As Integer
Dim mOptTitle As String, mOptValue As String

UpdateExtServRateOpt = False
On Error GoTo errhand

fhand = FreeFile
Open ExtServRateOptFileFullPath For Output As #fhand

Write #fhand, UCase("ExtServRateSys"), mExtServRateSys_bln
Write #fhand, UCase("DctwseServRateSys"), mDctwseServRateSys_bln
Write #fhand, UCase("PcgwseServRateSys"), mPcgwseServRateSys_bln
Write #fhand, UCase("RBywseServRateSys"), mRBywseServRateSys_bln
Write #fhand, UCase("RTowseServRateSys"), mRTowseServRateSys_bln
Write #fhand, UCase("TimewseServRateSys"), mTimewseServRateSys_bln
' --------------------------------------------------------
Write #fhand, UCase("ExtServDiscSys"), mExtServDiscSys_bln
Write #fhand, UCase("DctwseServDiscSys"), mDctwseServDiscSys_bln
Write #fhand, UCase("PcgwseServDiscSys"), mPcgwseServDiscSys_bln
Write #fhand, UCase("RBywseServDiscSys"), mRBywseServDiscSys_bln
Write #fhand, UCase("RTowseServDiscSys"), mRTowseServDiscSys_bln
Write #fhand, UCase("TimewseServDiscSys"), mTimewseServDiscSys_bln
' --------------------------------------------------------
Write #fhand, UCase("ExtServBargSys"), mExtServBargSys_bln
Write #fhand, UCase("DctwseServBargSys"), mDctwseServBargSys_bln
Write #fhand, UCase("PcgwseServBargSys"), mPcgwseServBargSys_bln
Write #fhand, UCase("RBywseServBargSys"), mRBywseServBargSys_bln
Write #fhand, UCase("RTowseServBargSys"), mRTowseServBargSys_bln
Write #fhand, UCase("TimewseServBargSys"), mTimewseServBargSys_bln
' --------------------------------------------------------
Write #fhand, UCase("ExtServShareSys"), mExtServShareSys_bln
Write #fhand, UCase("DctwseServShareSys"), mDctwseServShareSys_bln
Write #fhand, UCase("PcgwseServShareSys"), mPcgwseServShareSys_bln
Write #fhand, UCase("RBywseServShareSys"), mRBywseServShareSys_bln
Write #fhand, UCase("RTowseServShareSys"), mRTowseServShareSys_bln
Write #fhand, UCase("TimewseServShareSys"), mTimewseServShareSys_bln
' --------------------------------------------------------
Close #fhand

UpdateExtServRateOpt = True
GoTo EndSub

errhand:
MsgBox Err.Description

EndSub:
Exit Function

End Function


