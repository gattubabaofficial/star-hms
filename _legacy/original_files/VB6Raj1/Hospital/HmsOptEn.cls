VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsHmsOptionsEntry"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Dim m_dbHmsDatabase As ADODB.Connection, m_dbAcDatabase As ADODB.Connection, m_dbStDatabase As ADODB.Connection
Dim mTableName As String, mCodeField As String, mNameField As String, mRecStateField As String, mTitleName As String
Public blnPatMastOptMast As Boolean, blnOutdRegOptMast As Boolean, blnIndrRegOptMast As Boolean, blnBedMastOptMast As Boolean, blnOutdRcptOptMast As Boolean, blnOutdPymtOptMast As Boolean, blnOutdRefdOptMast As Boolean, blnServRateSysOptMast As Boolean
Dim blnStationMast As Boolean, blnAreaMast As Boolean, blnVTypeMast As Boolean
Rem Patient Registration
Public mPttRegNoAutoNumber_bln As Boolean, mPttRegNoAddModeChange_bln As Boolean, mPttRegNoEditModeChange_bln As Boolean, mPttRegNoNotZero_bln As Boolean, mPttAraCodeDef_lng As Long, mPttStnCodeDef_lng As Long, mPttPcgCodeDef_lng As Long, mPttAhCodeDef_lng As Long
Public mPttAraCodeCfd_bln As Boolean, mPttStnCodeCfd_bln As Boolean, mPttPcgCodeCfd_bln As Boolean, mPttAhCodeCfd_bln As Boolean
Public mPttAraCodeOld_lng As Long, mPttStnCodeOld_lng As Long, mPttPcgCodeOld_lng As Long, mPttAhCodeOld_lng As Long
Rem Outdoor Registration
Public mOpgPttRegNoAutoNumber_bln As Boolean, mOpgPttRegNoAddModeChange_bln As Boolean, mOpgPttRegNoEditModeChange_bln As Boolean, mOpgPttRegNoNotZero_bln As Boolean, mOpgRegValidDays_int As Integer, mOpgAraCodeDef_lng As Long, mOpgStnCodeDef_lng As Long, mOpgPcgCodeDef_lng As Long, mOpgPttAhCodeDef_lng As Long, mOpgVtmCodeDef_lng As Long, mOpgCDctCodeDef_lng As Long, mOpgRByCodeDef_lng As Long, mOpgFDigCodeDef_lng As Long, mOpgSrvCodeDef_lng As Long
Public mOpgAraCodeCfd_bln As Boolean, mOpgStnCodeCfd_bln As Boolean, mOpgPcgCodeCfd_bln As Boolean, mOpgPttAhCodeCfd_bln As Boolean, mOpgVtmCodeCfd_bln As Boolean, mOpgCDctCodeCfd_bln As Boolean, mOpgRByCodeCfd_bln As Boolean, mOpgFDigCodeCfd_bln As Boolean, mOpgSrvCodeCfd_bln As Boolean
Public mOpgAraCodeOld_lng As Long, mOpgStnCodeOld_lng As Long, mOpgPcgCodeOld_lng As Long, mOpgPttAhCodeOld_lng As Long, mOpgVtmCodeOld_lng As Long, mOpgCDctCodeOld_lng As Long, mOpgRByCodeOld_lng As Long, mOpgFDigCodeOld_lng As Long, mOpgSrvCodeOld_lng As Long
Rem Indoor Registration
Public mIpgPttRegNoAutoNumber_bln As Boolean, mIpgPttRegNoAddModeChange_bln As Boolean, mIpgPttRegNoEditModeChange_bln As Boolean, mIpgPttRegNoNotZero_bln As Boolean, mIpgAraCodeDef_lng As Long, mIpgStnCodeDef_lng As Long, mIpgPcgCodeDef_lng As Long, mIpgPttAhCodeDef_lng As Long, mIpgVtmCodeDef_lng As Long, mIpgCDctCodeDef_lng As Long, mIpgRByCodeDef_lng As Long, mIpgFDigCodeDef_lng As Long, mIpgBdmCodeDef_lng As Long
Public mIpgAraCodeCfd_bln As Boolean, mIpgStnCodeCfd_bln As Boolean, mIpgPcgCodeCfd_bln As Boolean, mIpgPttAhCodeCfd_bln As Boolean, mIpgVtmCodeCfd_bln As Boolean, mIpgCDctCodeCfd_bln As Boolean, mIpgRByCodeCfd_bln As Boolean, mIpgFDigCodeCfd_bln As Boolean, mIpgBdmCodeCfd_bln As Boolean
Public mIpgAraCodeOld_lng As Long, mIpgStnCodeOld_lng As Long, mIpgPcgCodeOld_lng As Long, mIpgPttAhCodeOld_lng As Long, mIpgVtmCodeOld_lng As Long, mIpgCDctCodeOld_lng As Long, mIpgRByCodeOld_lng As Long, mIpgFDigCodeOld_lng As Long, mIpgBdmCodeOld_lng As Long
Rem Bed Master
Public mBdmChkTimeDef_lng As Long, mBdmFlrCodeDef_lng As Long, mBdmWrdCodeDef_lng As Long
Public mBdmChkTimeCfd_bln As Boolean, mBdmFlrCodeCfd_bln As Boolean, mBdmWrdCodeCfd_bln As Boolean
Public mBdmChkTimeOld_lng As Long, mBdmFlrCodeOld_lng As Long, mBdmWrdCodeOld_lng As Long
Rem Outdoor Receipt
Public mOrcPttRegNoNotZero_bln As Boolean, mOrcVtmCodeDef_lng As Long
Public mOrcVtmCodeCfd_bln As Boolean
Public mOrcVtmCodeOld_lng As Long
Rem outdoor payment receipt
Public mOpyPttRegNoNotZero_bln As Boolean, mOpyVtmCodeDef_lng As Long
Public mOpyVtmCodeCfd_bln As Boolean
Public mOpyVtmCodeOld_lng As Long
Rem outdoor refund receipt
Public mOfdPttRegNoNotZero_bln As Boolean, mOfdVtmCodeDef_lng As Long
Public mOfdVtmCodeCfd_bln As Boolean
Public mOfdVtmCodeOld_lng As Long
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
    
ElseIf blnOutdRegOptMast = True Then
    mTableName = ""
    mCodeField = ""
    mNameField = ""
    mRecStateField = ""
    mTitleName = "Outdoor Registration"
    
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
    
ElseIf blnOutdRcptOptMast = True Then
    mTableName = ""
    mCodeField = ""
    mNameField = ""
    mRecStateField = ""
    mTitleName = "Outdoor Receipt"
    
ElseIf blnOutdPymtOptMast = True Then
    mTableName = ""
    mCodeField = ""
    mNameField = ""
    mRecStateField = ""
    mTitleName = "Outdoor Payment"
    
ElseIf blnOutdRefdOptMast = True Then
    mTableName = ""
    mCodeField = ""
    mNameField = ""
    mRecStateField = ""
    mTitleName = "Outdoor Refund"
    
ElseIf blnServRateSysOptMast = True Then
    mTableName = ""
    mCodeField = ""
    mNameField = ""
    mRecStateField = ""
    mTitleName = "Extended Service Charges/Share System"
    
Else
    ErrorBox "clsHmsOptionsEntry_Init_#52_[Undefined Case]"
End If

End Sub

Public Sub ResetInit()

blnPatMastOptMast = False
blnOutdRegOptMast = False
blnIndrRegOptMast = False
blnBedMastOptMast = False
blnOutdRcptOptMast = False
blnOutdPymtOptMast = False
blnOutdRefdOptMast = False
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
            AlertBox "clsHmsOptionsEntry_GetPatMastOptData_#420_[Undefined Case_" & mOptTitle & "]"
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
            AlertBox "clsHmsOptionsEntry_GetPatMastOptData_#441_[Undefined Case_" & mOptTitle & "]"
        End Select
    Loop
    Close #fhand
End If

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Sub

End Sub

Public Sub GetOutdRegOptData()
Dim mOptTitle As String, mOptValue As String
Dim tRecset As New ADODB.Recordset, acount As Integer, fhand As Integer

Me.Clear
If FileExist(OutdRegOptFileFullPath) = True Then
    fhand = FreeFile
    Open OutdRegOptFileFullPath For Input As #fhand
    Do While EOF(fhand) = False
        Input #fhand, mOptTitle, mOptValue
        mOptTitle = UCase(mOptTitle)
        Select Case mOptTitle
        Case UCase("OpgPttRegNoAutoNumber")
            mOpgPttRegNoAutoNumber_bln = mOptValue
        Case UCase("OpgPttRegNoAddModeChange")
            mOpgPttRegNoAddModeChange_bln = mOptValue
        Case UCase("OpgPttRegNoEditModeChange")
            mOpgPttRegNoEditModeChange_bln = mOptValue
        Case UCase("OpgPttRegNoNotZero")
            mOpgPttRegNoNotZero_bln = mOptValue
        Case UCase("OpgRegValidDays")
            mOpgRegValidDays_int = mOptValue
        Case UCase("OpgAraCodeDef")
            mOpgAraCodeDef_lng = mOptValue
        Case UCase("OpgStnCodeDef")
            mOpgStnCodeDef_lng = mOptValue
        Case UCase("OpgPcgCodeDef")
            mOpgPcgCodeDef_lng = mOptValue
        Case UCase("OpgPttAhCodeDef")
            mOpgPttAhCodeDef_lng = mOptValue
        Case UCase("OpgVtmCodeDef")
            mOpgVtmCodeDef_lng = mOptValue
        Case UCase("OpgCDctCodeDef")
            mOpgCDctCodeDef_lng = mOptValue
        Case UCase("OpgRByCodeDef")
            mOpgRByCodeDef_lng = mOptValue
        Case UCase("OpgFDigCodeDef")
            mOpgFDigCodeDef_lng = mOptValue
        Case UCase("OpgSrvCodeDef")
            mOpgSrvCodeDef_lng = mOptValue
        ' ----------------
        Case UCase("OpgAraCodeCfd")
            mOpgAraCodeCfd_bln = mOptValue
        Case UCase("OpgStnCodeCfd")
            mOpgStnCodeCfd_bln = mOptValue
        Case UCase("OpgPcgCodeCfd")
            mOpgPcgCodeCfd_bln = mOptValue
        Case UCase("OpgPttAhCodeCfd")
            mOpgPttAhCodeCfd_bln = mOptValue
        Case UCase("OpgVtmCodeCfd")
            mOpgVtmCodeCfd_bln = mOptValue
        Case UCase("OpgCDctCodeCfd")
            mOpgCDctCodeCfd_bln = mOptValue
        Case UCase("OpgRByCodeCfd")
            mOpgRByCodeCfd_bln = mOptValue
        Case UCase("OpgFDigCodeCfd")
            mOpgFDigCodeCfd_bln = mOptValue
        Case UCase("OpgSrvCodeCfd")
            mOpgSrvCodeCfd_bln = mOptValue
        Case Else
            AlertBox "clsHmsOptionsEntry_GetOutdRegOptData_#549_[Undefined Case_" & mOptTitle & "]"
        End Select
    Loop
    Close #fhand
End If
If FileExist(OutdRegOldFileFullPath) = True Then
    fhand = FreeFile
    Open OutdRegOldFileFullPath For Input As #fhand
    Do While EOF(fhand) = False
        Input #fhand, mOptTitle, mOptValue
        mOptTitle = UCase(mOptTitle)
        Select Case mOptTitle
        Case UCase("OpgAraCodeOld")
            mOpgAraCodeOld_lng = mOptValue
        Case UCase("OpgStnCodeOld")
            mOpgStnCodeOld_lng = mOptValue
        Case UCase("OpgPcgCodeOld")
            mOpgPcgCodeOld_lng = mOptValue
        Case UCase("OpgPttAhCodeOld")
            mOpgPttAhCodeOld_lng = mOptValue
        Case UCase("OpgVtmCodeOld")
            mOpgVtmCodeOld_lng = mOptValue
        Case UCase("OpgCDctCodeOld")
            mOpgCDctCodeOld_lng = mOptValue
        Case UCase("OpgRByCodeOld")
            mOpgRByCodeOld_lng = mOptValue
        Case UCase("OpgFDigCodeOld")
            mOpgFDigCodeOld_lng = mOptValue
        Case UCase("OpgSrvCodeOld")
            mOpgSrvCodeOld_lng = mOptValue
        Case Else
            AlertBox "clsHmsOptionsEntry_GetOutdRegOptData_#580_[Undefined Case_" & mOptTitle & "]"
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
            AlertBox "clsHmsOptionsEntry_GetIndrRegOptData_#687_[Undefined Case_" & mOptTitle & "]"
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
            AlertBox "clsHmsOptionsEntry_GetIndrRegOptData_#718_[Undefined Case_" & mOptTitle & "]"
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
            AlertBox "clsHmsOptionsEntry_GetBedMastOptData_#709_[Undefined Case_" & mOptTitle & "]"
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
            AlertBox "clsHmsOptionsEntry_GetBedMastOptData_#730_[Undefined Case_" & mOptTitle & "]"
        End Select
    Loop
    Close #fhand
End If

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Sub

End Sub

Public Sub GetOutdRcptOptData()
Dim mOptTitle As String, mOptValue As String
Dim tRecset As New ADODB.Recordset, acount As Integer, fhand As Integer

Me.Clear
If FileExist(OutdRcptOptFileFullPath) = True Then
    fhand = FreeFile
    Open OutdRcptOptFileFullPath For Input As #fhand
    Do While EOF(fhand) = False
        Input #fhand, mOptTitle, mOptValue
        mOptTitle = UCase(mOptTitle)
        Select Case mOptTitle
        Case UCase("OrcPttRegNoNotZero")
            mOrcPttRegNoNotZero_bln = mOptValue
        Case UCase("OrcVtmCodeDef")
            mOrcVtmCodeDef_lng = mOptValue
        ' ----------------
        Case UCase("OrcVtmCodeCfd")
            mOrcVtmCodeCfd_bln = mOptValue
        Case Else
            AlertBox "clsHmsOptionsEntry_GetOutdRcptOptData_#498_[Undefined Case_" & mOptTitle & "]"
        End Select
    Loop
    Close #fhand
End If
If FileExist(OutdRcptOldFileFullPath) = True Then
    fhand = FreeFile
    Open OutdRcptOldFileFullPath For Input As #fhand
    Do While EOF(fhand) = False
        Input #fhand, mOptTitle, mOptValue
        mOptTitle = UCase(mOptTitle)
        Select Case mOptTitle
        Case UCase("OrcVtmCodeOld")
            mOrcVtmCodeOld_lng = mOptValue
        Case Else
            AlertBox "clsHmsOptionsEntry_GetOutdRcptOptData_#529_[Undefined Case_" & mOptTitle & "]"
        End Select
    Loop
    Close #fhand
End If
    
EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Sub

End Sub

Public Sub GetOutdPymtOptData()
Dim mOptTitle As String, mOptValue As String
Dim tRecset As New ADODB.Recordset, acount As Integer, fhand As Integer

Me.Clear
If FileExist(OutdPymtOptFileFullPath) = True Then
    fhand = FreeFile
    Open OutdPymtOptFileFullPath For Input As #fhand
    Do While EOF(fhand) = False
        Input #fhand, mOptTitle, mOptValue
        mOptTitle = UCase(mOptTitle)
        Select Case mOptTitle
        Case UCase("OpyPttRegNoNotZero")
            mOpyPttRegNoNotZero_bln = mOptValue
        Case UCase("OpyVtmCodeDef")
            mOpyVtmCodeDef_lng = mOptValue
        ' ----------------
        Case UCase("OpyVtmCodeCfd")
            mOpyVtmCodeCfd_bln = mOptValue
        Case Else
            AlertBox "clsHmsOptionsEntry_GetOutdPymtOptData_#516_[Undefined Case_" & mOptTitle & "]"
        End Select
    Loop
    Close #fhand
End If
If FileExist(OutdPymtOldFileFullPath) = True Then
    fhand = FreeFile
    Open OutdPymtOldFileFullPath For Input As #fhand
    Do While EOF(fhand) = False
        Input #fhand, mOptTitle, mOptValue
        mOptTitle = UCase(mOptTitle)
        Select Case mOptTitle
        Case UCase("OpyVtmCodeOld")
            mOpyVtmCodeOld_lng = mOptValue
        Case Else
            AlertBox "clsHmsOptionsEntry_GetOutdPymtOptData_#531_[Undefined Case_" & mOptTitle & "]"
        End Select
    Loop
    Close #fhand
End If
    
EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Sub

End Sub

Public Sub GetOutdRefdOptData()
Dim mOptTitle As String, mOptValue As String
Dim tRecset As New ADODB.Recordset, acount As Integer, fhand As Integer

Me.Clear
If FileExist(OutdRefdOptFileFullPath) = True Then
    fhand = FreeFile
    Open OutdRefdOptFileFullPath For Input As #fhand
    Do While EOF(fhand) = False
        Input #fhand, mOptTitle, mOptValue
        mOptTitle = UCase(mOptTitle)
        Select Case mOptTitle
        Case UCase("OfdPttRegNoNotZero")
            mOfdPttRegNoNotZero_bln = mOptValue
        Case UCase("OfdVtmCodeDef")
            mOfdVtmCodeDef_lng = mOptValue
        ' ----------------
        Case UCase("OfdVtmCodeCfd")
            mOfdVtmCodeCfd_bln = mOptValue
        Case Else
            AlertBox "clsHmsOptionsEntry_GetOutdRefdOptData_#516_[Undefined Case_" & mOptTitle & "]"
        End Select
    Loop
    Close #fhand
End If
If FileExist(OutdRefdOldFileFullPath) = True Then
    fhand = FreeFile
    Open OutdRefdOldFileFullPath For Input As #fhand
    Do While EOF(fhand) = False
        Input #fhand, mOptTitle, mOptValue
        mOptTitle = UCase(mOptTitle)
        Select Case mOptTitle
        Case UCase("OfdVtmCodeOld")
            mOfdVtmCodeOld_lng = mOptValue
        Case Else
            AlertBox "clsHmsOptionsEntry_GetOutdRefdOptData_#531_[Undefined Case_" & mOptTitle & "]"
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
            AlertBox "clsHmsOptionsEntry_GetExtServRateOptData_#677_[Undefined Case_" & mOptTitle & "]"
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
    AlertBox "clsHmsOptionsEntry_GetPatMastOptBoundCode_#888_[Undefined Case_" & mOptTitle & "]"
End Select

GetPatMastOptBoundCode = mRtnval

End Function

Public Function GetOutdRegOptBoundCode(ByVal mOptTitle As String) As Long
Dim mRtnval As Long
mRtnval = 0

mOptTitle = UCase(mOptTitle)
Select Case mOptTitle
Case UCase("OpgAraCode")
    mRtnval = IIf(mOpgAraCodeCfd_bln = True, mOpgAraCodeOld_lng, mOpgAraCodeDef_lng)
Case UCase("OpgStnCode")
    mRtnval = IIf(mOpgStnCodeCfd_bln = True, mOpgStnCodeOld_lng, mOpgStnCodeDef_lng)
Case UCase("OpgPcgCode")
    mRtnval = IIf(mOpgPcgCodeCfd_bln = True, mOpgPcgCodeOld_lng, mOpgPcgCodeDef_lng)
Case UCase("OpgPttAhCode")
    mRtnval = IIf(mOpgPttAhCodeCfd_bln = True, mOpgPttAhCodeOld_lng, mOpgPttAhCodeDef_lng)
Case UCase("OpgVtmCode")
    mRtnval = IIf(mOpgVtmCodeCfd_bln = True, mOpgVtmCodeOld_lng, mOpgVtmCodeDef_lng)
Case UCase("OpgCDctCode")
    mRtnval = IIf(mOpgCDctCodeCfd_bln = True, mOpgCDctCodeOld_lng, mOpgCDctCodeDef_lng)
Case UCase("OpgRByCode")
    mRtnval = IIf(mOpgRByCodeCfd_bln = True, mOpgRByCodeOld_lng, mOpgRByCodeDef_lng)
Case UCase("OpgFDigCode")
    mRtnval = IIf(mOpgFDigCodeCfd_bln = True, mOpgFDigCodeOld_lng, mOpgFDigCodeDef_lng)
Case UCase("OpgSrvCode")
    mRtnval = IIf(mOpgSrvCodeCfd_bln = True, mOpgSrvCodeOld_lng, mOpgSrvCodeDef_lng)
Case Else
    AlertBox "clsHmsOptionsEntry_GetOutdRegOptBoundCode_#961_[Undefined Case_" & mOptTitle & "]"
End Select
    
GetOutdRegOptBoundCode = mRtnval

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
    ErrorBox "clsHmsOptionsEntry_GetIndrRegOptBoundCode_#1037_[Undefined Case_" & mOptTitle & "]"
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
    AlertBox "clsHmsOptionsEntry_GetBedMastOptBoundCode_#1033_[Undefined Case_" & mOptTitle & "]"
End Select

GetBedMastOptBoundCode = mRtnval

End Function

Public Function GetOutdRcptOptBoundCode(ByVal mOptTitle As String) As Long
Dim mRtnval As Long
mRtnval = 0

mOptTitle = UCase(mOptTitle)
Select Case mOptTitle
Case UCase("OrcVtmCode")
    mRtnval = IIf(mOrcVtmCodeCfd_bln = True, mOrcVtmCodeOld_lng, mOrcVtmCodeDef_lng)
Case Else
    AlertBox "clsHmsOptionsEntry_GetOutdRcptOptBoundCode_#961_[Undefined Case_" & mOptTitle & "]"
End Select
    
GetOutdRcptOptBoundCode = mRtnval

End Function

Public Function GetOutdPymtOptBoundCode(ByVal mOptTitle As String) As Long
Dim mRtnval As Long
mRtnval = 0

mOptTitle = UCase(mOptTitle)
Select Case mOptTitle
Case UCase("OpyVtmCode")
    mRtnval = IIf(mOpyVtmCodeCfd_bln = True, mOpyVtmCodeOld_lng, mOpyVtmCodeDef_lng)
Case Else
    AlertBox "clsHmsOptionsEntry_GetOutdPymtOptBoundCode_#776_[Undefined Case_" & mOptTitle & "]"
End Select
    
GetOutdPymtOptBoundCode = mRtnval

End Function

Public Function GetOutdRefdOptBoundCode(ByVal mOptTitle As String) As Long
Dim mRtnval As Long
mRtnval = 0

mOptTitle = UCase(mOptTitle)
Select Case mOptTitle
Case UCase("OfdVtmCode")
    mRtnval = IIf(mOfdVtmCodeCfd_bln = True, mOfdVtmCodeOld_lng, mOfdVtmCodeDef_lng)
Case Else
    AlertBox "clsHmsOptionsEntry_GetOutdRefdOptBoundCode_#776_[Undefined Case_" & mOptTitle & "]"
End Select
    
GetOutdRefdOptBoundCode = mRtnval

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

ElseIf blnOutdRegOptMast = True Then
    mOpgPttRegNoAutoNumber_bln = False
    mOpgPttRegNoAddModeChange_bln = False
    mOpgPttRegNoEditModeChange_bln = False
    mOpgPttRegNoNotZero_bln = False
    mOpgRegValidDays_int = 0
    mOpgAraCodeDef_lng = 0
    mOpgStnCodeDef_lng = 0
    mOpgPcgCodeDef_lng = 0
    mOpgPttAhCodeDef_lng = 0
    mOpgVtmCodeDef_lng = 0
    mOpgCDctCodeDef_lng = 0
    mOpgRByCodeDef_lng = 0
    mOpgFDigCodeDef_lng = 0
    mOpgSrvCodeDef_lng = 0
    ' ---------------
    mOpgAraCodeCfd_bln = False
    mOpgStnCodeCfd_bln = False
    mOpgPcgCodeCfd_bln = False
    mOpgPttAhCodeCfd_bln = False
    mOpgVtmCodeCfd_bln = False
    mOpgCDctCodeCfd_bln = False
    mOpgRByCodeCfd_bln = False
    mOpgFDigCodeCfd_bln = False
    mOpgSrvCodeCfd_bln = False
    ' ------------------------
    mOpgAraCodeOld_lng = 0
    mOpgStnCodeOld_lng = 0
    mOpgPcgCodeOld_lng = 0
    mOpgPttAhCodeOld_lng = 0
    mOpgVtmCodeOld_lng = 0
    mOpgCDctCodeOld_lng = 0
    mOpgRByCodeOld_lng = 0
    mOpgFDigCodeOld_lng = 0
    mOpgSrvCodeOld_lng = 0

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
    
ElseIf blnOutdRcptOptMast = True Then
    mOrcPttRegNoNotZero_bln = False
    mOrcVtmCodeDef_lng = 0
    ' ---------------
    mOrcVtmCodeCfd_bln = False
    ' ------------------------
    mOrcVtmCodeOld_lng = 0

ElseIf blnOutdPymtOptMast = True Then
    mOpyPttRegNoNotZero_bln = False
    mOpyVtmCodeDef_lng = 0
    ' ---------------
    mOpyVtmCodeCfd_bln = False
    ' ------------------------
    mOpyVtmCodeOld_lng = 0
    
ElseIf blnOutdRefdOptMast = True Then
    mOfdPttRegNoNotZero_bln = False
    mOfdVtmCodeDef_lng = 0
    ' ---------------
    mOfdVtmCodeCfd_bln = False
    ' ------------------------
    mOfdVtmCodeOld_lng = 0
    
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
    ErrorBox "clsHmsOptionsEntry_Clear_#906_[Undefined Case]"

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

Public Function UpdateOutdRegOpt() As Boolean
Dim fhand As Integer
Dim mOptTitle As String, mOptValue As String

UpdateOutdRegOpt = False
On Error GoTo errhand

fhand = FreeFile
Open OutdRegOptFileFullPath For Output As #fhand

Write #fhand, UCase("OpgPttRegNoAutoNumber"), mOpgPttRegNoAutoNumber_bln
Write #fhand, UCase("OpgPttRegNoAddModeChange"), mOpgPttRegNoAddModeChange_bln
Write #fhand, UCase("OpgPttRegNoEditModeChange"), mOpgPttRegNoEditModeChange_bln
Write #fhand, UCase("OpgPttRegNoNotZero"), mOpgPttRegNoNotZero_bln
Write #fhand, UCase("OpgRegValidDays"), mOpgRegValidDays_int
Write #fhand, UCase("OpgAraCodeDef"), mOpgAraCodeDef_lng
Write #fhand, UCase("OpgStnCodeDef"), mOpgStnCodeDef_lng
Write #fhand, UCase("OpgPcgCodeDef"), mOpgPcgCodeDef_lng
Write #fhand, UCase("OpgPttAhCodeDef"), mOpgPttAhCodeDef_lng
Write #fhand, UCase("OpgVtmCodeDef"), mOpgVtmCodeDef_lng
Write #fhand, UCase("OpgCDctCodeDef"), mOpgCDctCodeDef_lng
Write #fhand, UCase("OpgRByCodeDef"), mOpgRByCodeDef_lng
Write #fhand, UCase("OpgFDigCodeDef"), mOpgFDigCodeDef_lng
Write #fhand, UCase("OpgSrvCodeDef"), mOpgSrvCodeDef_lng
' ----------------
Write #fhand, UCase("OpgAraCodeCfd"), mOpgAraCodeCfd_bln
Write #fhand, UCase("OpgStnCodeCfd"), mOpgStnCodeCfd_bln
Write #fhand, UCase("OpgPcgCodeCfd"), mOpgPcgCodeCfd_bln
Write #fhand, UCase("OpgPttAhCodeCfd"), mOpgPttAhCodeCfd_bln
Write #fhand, UCase("OpgVtmCodeCfd"), mOpgVtmCodeCfd_bln
Write #fhand, UCase("OpgCDctCodeCfd"), mOpgCDctCodeCfd_bln
Write #fhand, UCase("OpgRByCodeCfd"), mOpgRByCodeCfd_bln
Write #fhand, UCase("OpgFDigCodeCfd"), mOpgFDigCodeCfd_bln
Write #fhand, UCase("OpgSrvCodeCfd"), mOpgSrvCodeCfd_bln
' -----------------------------------------
Close #fhand

UpdateOutdRegOpt = True
GoTo EndSub

errhand:
MsgBox Err.Description

EndSub:
Exit Function

End Function

Public Function UpdateOutdRegOld() As Boolean
Dim fhand As Integer
Dim mOptTitle As String, mOptValue As String

UpdateOutdRegOld = False
On Error GoTo errhand

fhand = FreeFile
Open OutdRegOldFileFullPath For Output As #fhand

Write #fhand, UCase("OpgAraCodeOld"), mOpgAraCodeOld_lng
Write #fhand, UCase("OpgStnCodeOld"), mOpgStnCodeOld_lng
Write #fhand, UCase("OpgPcgCodeOld"), mOpgPcgCodeOld_lng
Write #fhand, UCase("OpgPttAhCodeOld"), mOpgPttAhCodeOld_lng
Write #fhand, UCase("OpgVtmCodeOld"), mOpgVtmCodeOld_lng
Write #fhand, UCase("OpgCDctCodeOld"), mOpgCDctCodeOld_lng
Write #fhand, UCase("OpgRByCodeOld"), mOpgRByCodeOld_lng
Write #fhand, UCase("OpgFDigCodeOld"), mOpgFDigCodeOld_lng
Write #fhand, UCase("OpgSrvCodeOld"), mOpgSrvCodeOld_lng
' -----------------------------------------
Close #fhand
' -----------------------------------------
UpdateOutdRegOld = True
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

Public Function UpdateOutdRcptOpt() As Boolean
Dim fhand As Integer
Dim mOptTitle As String, mOptValue As String

UpdateOutdRcptOpt = False
On Error GoTo errhand

fhand = FreeFile
Open OutdRcptOptFileFullPath For Output As #fhand

Write #fhand, UCase("OrcPttRegNoNotZero"), mOrcPttRegNoNotZero_bln
Write #fhand, UCase("OrcVtmCodeDef"), mOrcVtmCodeDef_lng
' ----------------
Write #fhand, UCase("OrcVtmCodeCfd"), mOrcVtmCodeCfd_bln
' -----------------------------------------
Close #fhand

UpdateOutdRcptOpt = True
GoTo EndSub

errhand:
MsgBox Err.Description

EndSub:
Exit Function

End Function

Public Function UpdateOutdRcptOld() As Boolean
Dim fhand As Integer
Dim mOptTitle As String, mOptValue As String

UpdateOutdRcptOld = False
On Error GoTo errhand

fhand = FreeFile
Open OutdRcptOldFileFullPath For Output As #fhand

Write #fhand, UCase("OrcVtmCodeOld"), mOrcVtmCodeOld_lng
' -----------------------------------------
Close #fhand
' -----------------------------------------
UpdateOutdRcptOld = True
GoTo EndSub

errhand:
MsgBox Err.Description

EndSub:
Exit Function

End Function

Public Function UpdateOutdPymtOpt() As Boolean
Dim fhand As Integer
Dim mOptTitle As String, mOptValue As String

UpdateOutdPymtOpt = False
On Error GoTo errhand

fhand = FreeFile
Open OutdPymtOptFileFullPath For Output As #fhand

Write #fhand, UCase("OpyPttRegNoNotZero"), mOpyPttRegNoNotZero_bln
Write #fhand, UCase("OpyVtmCodeDef"), mOpyVtmCodeDef_lng
' ----------------
Write #fhand, UCase("OpyVtmCodeCfd"), mOpyVtmCodeCfd_bln
' -----------------------------------------
Close #fhand

UpdateOutdPymtOpt = True
GoTo EndSub

errhand:
MsgBox Err.Description

EndSub:
Exit Function

End Function

Public Function UpdateOutdPymtOld() As Boolean
Dim fhand As Integer
Dim mOptTitle As String, mOptValue As String

UpdateOutdPymtOld = False
On Error GoTo errhand

fhand = FreeFile
Open OutdPymtOldFileFullPath For Output As #fhand

Write #fhand, UCase("OpyVtmCodeOld"), mOpyVtmCodeOld_lng
' -----------------------------------------
Close #fhand
' -----------------------------------------
UpdateOutdPymtOld = True
GoTo EndSub

errhand:
MsgBox Err.Description

EndSub:
Exit Function

End Function

Public Function UpdateOutdRefdOpt() As Boolean
Dim fhand As Integer
Dim mOptTitle As String, mOptValue As String

UpdateOutdRefdOpt = False
On Error GoTo errhand

fhand = FreeFile
Open OutdRefdOptFileFullPath For Output As #fhand

Write #fhand, UCase("OfdPttRegNoNotZero"), mOfdPttRegNoNotZero_bln
Write #fhand, UCase("OfdVtmCodeDef"), mOfdVtmCodeDef_lng
' ----------------
Write #fhand, UCase("OfdVtmCodeCfd"), mOfdVtmCodeCfd_bln
' -----------------------------------------
Close #fhand

UpdateOutdRefdOpt = True
GoTo EndSub

errhand:
MsgBox Err.Description

EndSub:
Exit Function

End Function

Public Function UpdateOutdRefdOld() As Boolean
Dim fhand As Integer
Dim mOptTitle As String, mOptValue As String

UpdateOutdRefdOld = False
On Error GoTo errhand

fhand = FreeFile
Open OutdRefdOldFileFullPath For Output As #fhand

Write #fhand, UCase("OfdVtmCodeOld"), mOfdVtmCodeOld_lng
' -----------------------------------------
Close #fhand
' -----------------------------------------
UpdateOutdRefdOld = True
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

