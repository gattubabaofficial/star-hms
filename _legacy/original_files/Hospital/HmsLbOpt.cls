VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsHmsLabOptionsEntry"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False

Option Explicit

Dim m_dbHmsDatabase As ADODB.Connection, m_dbAcDatabase As ADODB.Connection, m_dbStDatabase As ADODB.Connection
Dim mTableName As String, mCodeField As String, mNameField As String, mRecStateField As String, mTitleName As String
Public blnPatMastOptMast As Boolean, blnLabRegOptMast As Boolean, blnLabRcptOptMast As Boolean, blnLabPymtOptMast As Boolean, blnLabRefdOptMast As Boolean, blnServRateSysOptMast As Boolean
Rem Patient Registration
Public mPttRegNoAutoNumber_bln As Boolean, mPttRegNoAddModeChange_bln As Boolean, mPttRegNoEditModeChange_bln As Boolean, mPttRegNoNotZero_bln As Boolean, mPttAraCodeDef_lng As Long, mPttStnCodeDef_lng As Long, mPttPcgCodeDef_lng As Long, mPttAhCodeDef_lng As Long
Public mPttAraCodeCfd_bln As Boolean, mPttStnCodeCfd_bln As Boolean, mPttPcgCodeCfd_bln As Boolean, mPttAhCodeCfd_bln As Boolean
Public mPttAraCodeOld_lng As Long, mPttStnCodeOld_lng As Long, mPttPcgCodeOld_lng As Long, mPttAhCodeOld_lng As Long
Rem Lab Registration
Public mLpgPttRegNoAutoNumber_bln As Boolean, mLpgPttRegNoAddModeChange_bln As Boolean, mLpgPttRegNoEditModeChange_bln As Boolean, mLpgPttRegNoNotZero_bln As Boolean, mLpgRegValidDays_int As Integer, mLpgAraCodeDef_lng As Long, mLpgStnCodeDef_lng As Long, mLpgPcgCodeDef_lng As Long, mLpgPttAhCodeDef_lng As Long, mLpgCDctCodeDef_lng As Long, mLpgRByCodeDef_lng As Long, mLpgFDigCodeDef_lng As Long
Public mLpgAraCodeCfd_bln As Boolean, mLpgStnCodeCfd_bln As Boolean, mLpgPcgCodeCfd_bln As Boolean, mLpgPttAhCodeCfd_bln As Boolean, mLpgCDctCodeCfd_bln As Boolean, mLpgRByCodeCfd_bln As Boolean, mLpgFDigCodeCfd_bln As Boolean
Public mLpgAraCodeOld_lng As Long, mLpgStnCodeOld_lng As Long, mLpgPcgCodeOld_lng As Long, mLpgPttAhCodeOld_lng As Long, mLpgCDctCodeOld_lng As Long, mLpgRByCodeOld_lng As Long, mLpgFDigCodeOld_lng As Long
Rem Lab Receipt
Public mLrcPttRegNoNotZero_bln As Boolean, mLrcVtmCodeDef_lng As Long
Public mLrcVtmCodeCfd_bln As Boolean
Public mLrcVtmCodeOld_lng As Long
Rem Lab payment receipt
Public mLpyPttRegNoNotZero_bln As Boolean, mLpyVtmCodeDef_lng As Long
Public mLpyVtmCodeCfd_bln As Boolean
Public mLpyVtmCodeOld_lng As Long
Rem Lab refund receipt
Public mLfdPttRegNoNotZero_bln As Boolean, mLfdVtmCodeDef_lng As Long
Public mLfdVtmCodeCfd_bln As Boolean
Public mLfdVtmCodeOld_lng As Long
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

ElseIf blnLabRegOptMast = True Then
    mTableName = ""
    mCodeField = ""
    mNameField = ""
    mRecStateField = ""
    mTitleName = "Lab Registration"

ElseIf blnLabRcptOptMast = True Then
    mTableName = ""
    mCodeField = ""
    mNameField = ""
    mRecStateField = ""
    mTitleName = "Lab Receipt"

ElseIf blnLabPymtOptMast = True Then
    mTableName = ""
    mCodeField = ""
    mNameField = ""
    mRecStateField = ""
    mTitleName = "Lab Payment"
    
ElseIf blnLabRefdOptMast = True Then
    mTableName = ""
    mCodeField = ""
    mNameField = ""
    mRecStateField = ""
    mTitleName = "Lab Refund"
    
ElseIf blnServRateSysOptMast = True Then
    mTableName = ""
    mCodeField = ""
    mNameField = ""
    mRecStateField = ""
    mTitleName = "Extended Service Charges/Share System"
    
Else
    ErrorBox "clsHmsLabOptionsEntry_Init_#52_[Undefined Case]"
End If

End Sub

Public Sub ResetInit()

blnPatMastOptMast = False
blnLabRegOptMast = False
blnLabRcptOptMast = False
blnLabPymtOptMast = False
blnLabRefdOptMast = False
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
            AlertBox "clsHmsLabOptionsEntry_GetPatMastOptData_#420_[Undefined Case_" & mOptTitle & "]"
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
            AlertBox "clsHmsLabOptionsEntry_GetPatMastOptData_#441_[Undefined Case_" & mOptTitle & "]"
        End Select
    Loop
    Close #fhand
End If

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Sub

End Sub

Public Sub GetLabRegOptData()
Dim mOptTitle As String, mOptValue As String
Dim tRecset As New ADODB.Recordset, acount As Integer, fhand As Integer

Me.Clear
If FileExist(LabRegOptFileFullPath) = True Then
    fhand = FreeFile
    Open LabRegOptFileFullPath For Input As #fhand
    Do While EOF(fhand) = False
        Input #fhand, mOptTitle, mOptValue
        mOptTitle = UCase(mOptTitle)
        Select Case mOptTitle
        Case UCase("LpgPttRegNoAutoNumber")
            mLpgPttRegNoAutoNumber_bln = mOptValue
        Case UCase("LpgPttRegNoAddModeChange")
            mLpgPttRegNoAddModeChange_bln = mOptValue
        Case UCase("LpgPttRegNoEditModeChange")
            mLpgPttRegNoEditModeChange_bln = mOptValue
        Case UCase("LpgPttRegNoNotZero")
            mLpgPttRegNoNotZero_bln = mOptValue
        Case UCase("LpgRegValidDays")
            mLpgRegValidDays_int = mOptValue
        Case UCase("LpgAraCodeDef")
            mLpgAraCodeDef_lng = mOptValue
        Case UCase("LpgStnCodeDef")
            mLpgStnCodeDef_lng = mOptValue
        Case UCase("LpgPcgCodeDef")
            mLpgPcgCodeDef_lng = mOptValue
        Case UCase("LpgPttAhCodeDef")
            mLpgPttAhCodeDef_lng = mOptValue
        Case UCase("LpgCDctCodeDef")
            mLpgCDctCodeDef_lng = mOptValue
        Case UCase("LpgRByCodeDef")
            mLpgRByCodeDef_lng = mOptValue
        Case UCase("LpgFDigCodeDef")
            mLpgFDigCodeDef_lng = mOptValue
        ' ------------------------
        Case UCase("LpgAraCodeCfd")
            mLpgAraCodeCfd_bln = mOptValue
        Case UCase("LpgStnCodeCfd")
            mLpgStnCodeCfd_bln = mOptValue
        Case UCase("LpgPcgCodeCfd")
            mLpgPcgCodeCfd_bln = mOptValue
        Case UCase("LpgPttAhCodeCfd")
            mLpgPttAhCodeCfd_bln = mOptValue
        Case UCase("LpgCDctCodeCfd")
            mLpgCDctCodeCfd_bln = mOptValue
        Case UCase("LpgRByCodeCfd")
            mLpgRByCodeCfd_bln = mOptValue
        Case UCase("LpgFDigCodeCfd")
            mLpgFDigCodeCfd_bln = mOptValue
        Case Else
            AlertBox "clsHmsLabOptionsEntry_GetLabRegOptData_#549_[Undefined Case_" & mOptTitle & "]"
        End Select
    Loop
    Close #fhand
End If
If FileExist(LabRegOldFileFullPath) = True Then
    fhand = FreeFile
    Open LabRegOldFileFullPath For Input As #fhand
    Do While EOF(fhand) = False
        Input #fhand, mOptTitle, mOptValue
        mOptTitle = UCase(mOptTitle)
        Select Case mOptTitle
        Case UCase("LpgAraCodeOld")
            mLpgAraCodeOld_lng = mOptValue
        Case UCase("LpgStnCodeOld")
            mLpgStnCodeOld_lng = mOptValue
        Case UCase("LpgPcgCodeOld")
            mLpgPcgCodeOld_lng = mOptValue
        Case UCase("LpgPttAhCodeOld")
            mLpgPttAhCodeOld_lng = mOptValue
        Case UCase("LpgCDctCodeOld")
            mLpgCDctCodeOld_lng = mOptValue
        Case UCase("LpgRByCodeOld")
            mLpgRByCodeOld_lng = mOptValue
        Case UCase("LpgFDigCodeOld")
            mLpgFDigCodeOld_lng = mOptValue
        Case Else
            AlertBox "clsHmsLabOptionsEntry_GetLabRegOptData_#580_[Undefined Case_" & mOptTitle & "]"
        End Select
    Loop
    Close #fhand
End If
    
EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Sub

End Sub

Public Sub GetLabRcptOptData()
Dim mOptTitle As String, mOptValue As String
Dim tRecset As New ADODB.Recordset, acount As Integer, fhand As Integer

Me.Clear
If FileExist(LabRcptOptFileFullPath) = True Then
    fhand = FreeFile
    Open LabRcptOptFileFullPath For Input As #fhand
    Do While EOF(fhand) = False
        Input #fhand, mOptTitle, mOptValue
        mOptTitle = UCase(mOptTitle)
        Select Case mOptTitle
        Case UCase("LrcPttRegNoNotZero")
            mLrcPttRegNoNotZero_bln = mOptValue
        Case UCase("LrcVtmCodeDef")
            mLrcVtmCodeDef_lng = mOptValue
        ' --------------------
        Case UCase("LrcVtmCodeCfd")
            mLrcVtmCodeCfd_bln = mOptValue
        Case Else
            AlertBox "clsHmsLabOptionsEntry_GetLabRcptOptData_#160_[Undefined Case_" & mOptTitle & "]"
        End Select
    Loop
    Close #fhand
End If
If FileExist(LabRcptOldFileFullPath) = True Then
    fhand = FreeFile
    Open LabRcptOldFileFullPath For Input As #fhand
    Do While EOF(fhand) = False
        Input #fhand, mOptTitle, mOptValue
        mOptTitle = UCase(mOptTitle)
        Select Case mOptTitle
        Case UCase("LrcVtmCodeOld")
            mLrcVtmCodeOld_lng = mOptValue
        Case Else
            AlertBox "clsHmsLabOptionsEntry_GetLabRcptOptData_#194_[Undefined Case_" & mOptTitle & "]"
        End Select
    Loop
    Close #fhand
End If
    
EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Sub

End Sub

Public Sub GetLabPymtOptData()
Dim mOptTitle As String, mOptValue As String
Dim tRecset As New ADODB.Recordset, acount As Integer, fhand As Integer

Me.Clear
If FileExist(LabPymtOptFileFullPath) = True Then
    fhand = FreeFile
    Open LabPymtOptFileFullPath For Input As #fhand
    Do While EOF(fhand) = False
        Input #fhand, mOptTitle, mOptValue
        mOptTitle = UCase(mOptTitle)
        Select Case mOptTitle
        Case UCase("LpyPttRegNoNotZero")
            mLpyPttRegNoNotZero_bln = mOptValue
        Case UCase("LpyVtmCodeDef")
            mLpyVtmCodeDef_lng = mOptValue
        ' ----------------
        Case UCase("LpyVtmCodeCfd")
            mLpyVtmCodeCfd_bln = mOptValue
        Case Else
            AlertBox "clsHmsLabOptionsEntry_GetLabPymtOptData_#516_[Undefined Case_" & mOptTitle & "]"
        End Select
    Loop
    Close #fhand
End If
If FileExist(LabPymtOldFileFullPath) = True Then
    fhand = FreeFile
    Open LabPymtOldFileFullPath For Input As #fhand
    Do While EOF(fhand) = False
        Input #fhand, mOptTitle, mOptValue
        mOptTitle = UCase(mOptTitle)
        Select Case mOptTitle
        Case UCase("LpyVtmCodeOld")
            mLpyVtmCodeOld_lng = mOptValue
        Case Else
            AlertBox "clsHmsLabOptionsEntry_GetLabPymtOptData_#531_[Undefined Case_" & mOptTitle & "]"
        End Select
    Loop
    Close #fhand
End If
    
EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Sub

End Sub

Public Sub GetLabRefdOptData()
Dim mOptTitle As String, mOptValue As String
Dim tRecset As New ADODB.Recordset, acount As Integer, fhand As Integer

Me.Clear
If FileExist(LabRefdOptFileFullPath) = True Then
    fhand = FreeFile
    Open LabRefdOptFileFullPath For Input As #fhand
    Do While EOF(fhand) = False
        Input #fhand, mOptTitle, mOptValue
        mOptTitle = UCase(mOptTitle)
        Select Case mOptTitle
        Case UCase("LfdPttRegNoNotZero")
            mLfdPttRegNoNotZero_bln = mOptValue
        Case UCase("LfdVtmCodeDef")
            mLfdVtmCodeDef_lng = mOptValue
        ' ----------------
        Case UCase("LfdVtmCodeCfd")
            mLfdVtmCodeCfd_bln = mOptValue
        Case Else
            AlertBox "clsHmsLabOptionsEntry_GetLabRefdOptData_#516_[Undefined Case_" & mOptTitle & "]"
        End Select
    Loop
    Close #fhand
End If
If FileExist(LabRefdOldFileFullPath) = True Then
    fhand = FreeFile
    Open LabRefdOldFileFullPath For Input As #fhand
    Do While EOF(fhand) = False
        Input #fhand, mOptTitle, mOptValue
        mOptTitle = UCase(mOptTitle)
        Select Case mOptTitle
        Case UCase("LfdVtmCodeOld")
            mLfdVtmCodeOld_lng = mOptValue
        Case Else
            AlertBox "clsHmsLabOptionsEntry_GetLabRefdOptData_#531_[Undefined Case_" & mOptTitle & "]"
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
            AlertBox "clsHmsLabOptionsEntry_GetExtServRateOptData_#677_[Undefined Case_" & mOptTitle & "]"
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
    AlertBox "clsHmsLabOptionsEntry_GetPatMastOptBoundCode_#888_[Undefined Case_" & mOptTitle & "]"
End Select

GetPatMastOptBoundCode = mRtnval

End Function

Public Function GetLabRegOptBoundCode(ByVal mOptTitle As String) As Long
Dim mRtnval As Long
mRtnval = 0

mOptTitle = UCase(mOptTitle)
Select Case mOptTitle
Case UCase("LpgAraCode")
    mRtnval = IIf(mLpgAraCodeCfd_bln = True, mLpgAraCodeOld_lng, mLpgAraCodeDef_lng)
Case UCase("LpgStnCode")
    mRtnval = IIf(mLpgStnCodeCfd_bln = True, mLpgStnCodeOld_lng, mLpgStnCodeDef_lng)
Case UCase("LpgPcgCode")
    mRtnval = IIf(mLpgPcgCodeCfd_bln = True, mLpgPcgCodeOld_lng, mLpgPcgCodeDef_lng)
Case UCase("LpgPttAhCode")
    mRtnval = IIf(mLpgPttAhCodeCfd_bln = True, mLpgPttAhCodeOld_lng, mLpgPttAhCodeDef_lng)
Case UCase("LpgCDctCode")
    mRtnval = IIf(mLpgCDctCodeCfd_bln = True, mLpgCDctCodeOld_lng, mLpgCDctCodeDef_lng)
Case UCase("LpgRByCode")
    mRtnval = IIf(mLpgRByCodeCfd_bln = True, mLpgRByCodeOld_lng, mLpgRByCodeDef_lng)
Case UCase("LpgFDigCode")
    mRtnval = IIf(mLpgFDigCodeCfd_bln = True, mLpgFDigCodeOld_lng, mLpgFDigCodeDef_lng)
Case Else
    AlertBox "clsHmsLabOptionsEntry_GetLabRegOptBoundCode_#961_[Undefined Case_" & mOptTitle & "]"
End Select
    
GetLabRegOptBoundCode = mRtnval

End Function

Public Function GetLabRcptOptBoundCode(ByVal mOptTitle As String) As Long
Dim mRtnval As Long
mRtnval = 0

mOptTitle = UCase(mOptTitle)
Select Case mOptTitle
Case UCase("LrcVtmCode")
    mRtnval = IIf(mLrcVtmCodeCfd_bln = True, mLrcVtmCodeOld_lng, mLrcVtmCodeDef_lng)
Case Else
    AlertBox "clsHmsLabOptionsEntry_GetLabRcptOptBoundCode_#468_[Undefined Case_" & mOptTitle & "]"
End Select

GetLabRcptOptBoundCode = mRtnval

End Function

Public Function GetLabPymtOptBoundCode(ByVal mOptTitle As String) As Long
Dim mRtnval As Long
mRtnval = 0

mOptTitle = UCase(mOptTitle)
Select Case mOptTitle
Case UCase("LpyVtmCode")
    mRtnval = IIf(mLpyVtmCodeCfd_bln = True, mLpyVtmCodeOld_lng, mLpyVtmCodeDef_lng)
Case Else
    AlertBox "clsHmsLabOptionsEntry_GetLabPymtOptBoundCode_#776_[Undefined Case_" & mOptTitle & "]"
End Select
    
GetLabPymtOptBoundCode = mRtnval

End Function

Public Function GetLabRefdOptBoundCode(ByVal mOptTitle As String) As Long
Dim mRtnval As Long
mRtnval = 0

mOptTitle = UCase(mOptTitle)
Select Case mOptTitle
Case UCase("LfdVtmCode")
    mRtnval = IIf(mLfdVtmCodeCfd_bln = True, mLfdVtmCodeOld_lng, mLfdVtmCodeDef_lng)
Case Else
    AlertBox "clsHmsLabOptionsEntry_GetLabRefdOptBoundCode_#776_[Undefined Case_" & mOptTitle & "]"
End Select
    
GetLabRefdOptBoundCode = mRtnval

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

ElseIf blnLabRegOptMast = True Then
    mLpgPttRegNoAutoNumber_bln = False
    mLpgPttRegNoAddModeChange_bln = False
    mLpgPttRegNoEditModeChange_bln = False
    mLpgPttRegNoNotZero_bln = False
    mLpgRegValidDays_int = 0
    mLpgAraCodeDef_lng = 0
    mLpgStnCodeDef_lng = 0
    mLpgPcgCodeDef_lng = 0
    mLpgPttAhCodeDef_lng = 0
    mLpgCDctCodeDef_lng = 0
    mLpgRByCodeDef_lng = 0
    mLpgFDigCodeDef_lng = 0
    ' ---------------
    mLpgAraCodeCfd_bln = False
    mLpgStnCodeCfd_bln = False
    mLpgPcgCodeCfd_bln = False
    mLpgPttAhCodeCfd_bln = False
    mLpgCDctCodeCfd_bln = False
    mLpgRByCodeCfd_bln = False
    mLpgFDigCodeCfd_bln = False
    ' ------------------------
    mLpgAraCodeOld_lng = 0
    mLpgStnCodeOld_lng = 0
    mLpgPcgCodeOld_lng = 0
    mLpgPttAhCodeOld_lng = 0
    mLpgCDctCodeOld_lng = 0
    mLpgRByCodeOld_lng = 0
    mLpgFDigCodeOld_lng = 0

ElseIf blnLabRcptOptMast = True Then
    mLrcPttRegNoNotZero_bln = False
    mLrcVtmCodeDef_lng = 0
    ' ---------------
    mLrcVtmCodeCfd_bln = False
    ' ------------------------
    mLrcVtmCodeOld_lng = 0

ElseIf blnLabPymtOptMast = True Then
    mLpyPttRegNoNotZero_bln = False
    mLpyVtmCodeDef_lng = 0
    ' ---------------
    mLpyVtmCodeCfd_bln = False
    ' ------------------------
    mLpyVtmCodeOld_lng = 0
    
ElseIf blnLabRefdOptMast = True Then
    mLfdPttRegNoNotZero_bln = False
    mLfdVtmCodeDef_lng = 0
    ' ---------------
    mLfdVtmCodeCfd_bln = False
    ' ------------------------
    mLfdVtmCodeOld_lng = 0
    
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
    ErrorBox "clsHmsLabOptionsEntry_Clear_#906_[Undefined Case]"

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

Public Function UpdateLabRegOpt() As Boolean
Dim fhand As Integer
Dim mOptTitle As String, mOptValue As String

UpdateLabRegOpt = False
On Error GoTo errhand

fhand = FreeFile
Open LabRegOptFileFullPath For Output As #fhand

Write #fhand, UCase("LpgPttRegNoAutoNumber"), mLpgPttRegNoAutoNumber_bln
Write #fhand, UCase("LpgPttRegNoAddModeChange"), mLpgPttRegNoAddModeChange_bln
Write #fhand, UCase("LpgPttRegNoEditModeChange"), mLpgPttRegNoEditModeChange_bln
Write #fhand, UCase("LpgPttRegNoNotZero"), mLpgPttRegNoNotZero_bln
Write #fhand, UCase("LpgRegValidDays"), mLpgRegValidDays_int
Write #fhand, UCase("LpgAraCodeDef"), mLpgAraCodeDef_lng
Write #fhand, UCase("LpgStnCodeDef"), mLpgStnCodeDef_lng
Write #fhand, UCase("LpgPcgCodeDef"), mLpgPcgCodeDef_lng
Write #fhand, UCase("LpgPttAhCodeDef"), mLpgPttAhCodeDef_lng
Write #fhand, UCase("LpgCDctCodeDef"), mLpgCDctCodeDef_lng
Write #fhand, UCase("LpgRByCodeDef"), mLpgRByCodeDef_lng
Write #fhand, UCase("LpgFDigCodeDef"), mLpgFDigCodeDef_lng
' -----------------------------------------
Write #fhand, UCase("LpgAraCodeCfd"), mLpgAraCodeCfd_bln
Write #fhand, UCase("LpgStnCodeCfd"), mLpgStnCodeCfd_bln
Write #fhand, UCase("LpgPcgCodeCfd"), mLpgPcgCodeCfd_bln
Write #fhand, UCase("LpgPttAhCodeCfd"), mLpgPttAhCodeCfd_bln
Write #fhand, UCase("LpgCDctCodeCfd"), mLpgCDctCodeCfd_bln
Write #fhand, UCase("LpgRByCodeCfd"), mLpgRByCodeCfd_bln
Write #fhand, UCase("LpgFDigCodeCfd"), mLpgFDigCodeCfd_bln
' -----------------------------------------
Close #fhand

UpdateLabRegOpt = True
GoTo EndSub

errhand:
MsgBox Err.Description

EndSub:
Exit Function

End Function

Public Function UpdateLabRegOld() As Boolean
Dim fhand As Integer
Dim mOptTitle As String, mOptValue As String

UpdateLabRegOld = False
On Error GoTo errhand

fhand = FreeFile
Open LabRegOldFileFullPath For Output As #fhand

Write #fhand, UCase("LpgAraCodeOld"), mLpgAraCodeOld_lng
Write #fhand, UCase("LpgStnCodeOld"), mLpgStnCodeOld_lng
Write #fhand, UCase("LpgPcgCodeOld"), mLpgPcgCodeOld_lng
Write #fhand, UCase("LpgPttAhCodeOld"), mLpgPttAhCodeOld_lng
Write #fhand, UCase("LpgCDctCodeOld"), mLpgCDctCodeOld_lng
Write #fhand, UCase("LpgRByCodeOld"), mLpgRByCodeOld_lng
Write #fhand, UCase("LpgFDigCodeOld"), mLpgFDigCodeOld_lng
' -----------------------------------------
Close #fhand
' -----------------------------------------
UpdateLabRegOld = True
GoTo EndSub

errhand:
MsgBox Err.Description

EndSub:
Exit Function

End Function

Public Function UpdateLabRcptOpt() As Boolean
Dim fhand As Integer
Dim mOptTitle As String, mOptValue As String

UpdateLabRcptOpt = False
On Error GoTo errhand

fhand = FreeFile
Open LabRcptOptFileFullPath For Output As #fhand

Write #fhand, UCase("LrcPttRegNoNotZero"), mLrcPttRegNoNotZero_bln
Write #fhand, UCase("LrcVtmCodeDef"), mLrcVtmCodeDef_lng
' -----------------------------------------
Write #fhand, UCase("LrcVtmCodeCfd"), mLrcVtmCodeCfd_bln
' -----------------------------------------
Close #fhand

UpdateLabRcptOpt = True
GoTo EndSub

errhand:
MsgBox Err.Description

EndSub:
Exit Function

End Function

Public Function UpdateLabRcptOld() As Boolean
Dim fhand As Integer
Dim mOptTitle As String, mOptValue As String

UpdateLabRcptOld = False
On Error GoTo errhand

fhand = FreeFile
Open LabRcptOldFileFullPath For Output As #fhand

Write #fhand, UCase("LrcVtmCodeOld"), mLrcVtmCodeOld_lng
' -----------------------------------------
Close #fhand
' -----------------------------------------
UpdateLabRcptOld = True
GoTo EndSub

errhand:
MsgBox Err.Description

EndSub:
Exit Function

End Function

Public Function UpdateLabPymtOpt() As Boolean
Dim fhand As Integer
Dim mOptTitle As String, mOptValue As String

UpdateLabPymtOpt = False
On Error GoTo errhand

fhand = FreeFile
Open LabPymtOptFileFullPath For Output As #fhand

Write #fhand, UCase("LpyPttRegNoNotZero"), mLpyPttRegNoNotZero_bln
Write #fhand, UCase("LpyVtmCodeDef"), mLpyVtmCodeDef_lng
' ----------------
Write #fhand, UCase("LpyVtmCodeCfd"), mLpyVtmCodeCfd_bln
' -----------------------------------------
Close #fhand

UpdateLabPymtOpt = True
GoTo EndSub

errhand:
MsgBox Err.Description

EndSub:
Exit Function

End Function

Public Function UpdateLabPymtOld() As Boolean
Dim fhand As Integer
Dim mOptTitle As String, mOptValue As String

UpdateLabPymtOld = False
On Error GoTo errhand

fhand = FreeFile
Open LabPymtOldFileFullPath For Output As #fhand

Write #fhand, UCase("LpyVtmCodeOld"), mLpyVtmCodeOld_lng
' -----------------------------------------
Close #fhand
' -----------------------------------------
UpdateLabPymtOld = True
GoTo EndSub

errhand:
MsgBox Err.Description

EndSub:
Exit Function

End Function

Public Function UpdateLabRefdOpt() As Boolean
Dim fhand As Integer
Dim mOptTitle As String, mOptValue As String

UpdateLabRefdOpt = False
On Error GoTo errhand

fhand = FreeFile
Open LabRefdOptFileFullPath For Output As #fhand

Write #fhand, UCase("LfdPttRegNoNotZero"), mLfdPttRegNoNotZero_bln
Write #fhand, UCase("LfdVtmCodeDef"), mLfdVtmCodeDef_lng
' ----------------
Write #fhand, UCase("LfdVtmCodeCfd"), mLfdVtmCodeCfd_bln
' -----------------------------------------
Close #fhand

UpdateLabRefdOpt = True
GoTo EndSub

errhand:
MsgBox Err.Description

EndSub:
Exit Function

End Function

Public Function UpdateLabRefdOld() As Boolean
Dim fhand As Integer
Dim mOptTitle As String, mOptValue As String

UpdateLabRefdOld = False
On Error GoTo errhand

fhand = FreeFile
Open LabRefdOldFileFullPath For Output As #fhand

Write #fhand, UCase("LfdVtmCodeOld"), mLfdVtmCodeOld_lng
' -----------------------------------------
Close #fhand
' -----------------------------------------
UpdateLabRefdOld = True
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

