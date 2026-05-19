VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsHmsOpdOptionsEntry"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Dim m_dbHmsDatabase As ADODB.Connection, m_dbAcDatabase As ADODB.Connection, m_dbStDatabase As ADODB.Connection
Dim mTableName As String, mCodeField As String, mNameField As String, mRecStateField As String, mTitleName As String
Public blnPatMastOptMast As Boolean, blnOutdRegOptMast As Boolean, blnOutdRgRefdOptMast As Boolean, blnOutdRcptOptMast As Boolean, blnOutdPymtOptMast As Boolean, blnOutdRefdOptMast As Boolean, blnOutdBillOptMast As Boolean, blnOutdBlPymtOptMast As Boolean, blnOutdBlRefdOptMast As Boolean, blnServRateSysOptMast As Boolean
Rem Patient Registration
Public mPttRegNoAutoNumber_bln As Boolean, mPttRegNoAddModeChange_bln As Boolean, mPttRegNoEditModeChange_bln As Boolean, mPttRegNoNotZero_bln As Boolean, mPttAraCodeDef_lng As Long, mPttStnCodeDef_lng As Long, mPttPcgCodeDef_lng As Long, mPttAhCodeDef_lng As Long
Public mPttAraCodeCfd_bln As Boolean, mPttStnCodeCfd_bln As Boolean, mPttPcgCodeCfd_bln As Boolean, mPttAhCodeCfd_bln As Boolean
Public mPttAraCodeOld_lng As Long, mPttStnCodeOld_lng As Long, mPttPcgCodeOld_lng As Long, mPttAhCodeOld_lng As Long
Rem Outdoor Registration
Public mOpgPttRegNoAutoNumber_bln As Boolean, mOpgPttRegNoAddModeChange_bln As Boolean, mOpgPttRegNoEditModeChange_bln As Boolean, mOpgPttRegNoNotZero_bln As Boolean, mOpgRegValidDays_int As Integer, mOpgAraCodeDef_lng As Long, mOpgStnCodeDef_lng As Long, mOpgPcgCodeDef_lng As Long, mOpgPttAhCodeDef_lng As Long, mOpgVtmCodeDef_lng As Long, mOpgCDctCodeDef_lng As Long, mOpgRByCodeDef_lng As Long, mOpgFDigCodeDef_lng As Long, mOpgSrvCodeDef_lng As Long
Public mOpgAraCodeCfd_bln As Boolean, mOpgStnCodeCfd_bln As Boolean, mOpgPcgCodeCfd_bln As Boolean, mOpgPttAhCodeCfd_bln As Boolean, mOpgVtmCodeCfd_bln As Boolean, mOpgCDctCodeCfd_bln As Boolean, mOpgRByCodeCfd_bln As Boolean, mOpgFDigCodeCfd_bln As Boolean, mOpgSrvCodeCfd_bln As Boolean
Public mOpgAraCodeOld_lng As Long, mOpgStnCodeOld_lng As Long, mOpgPcgCodeOld_lng As Long, mOpgPttAhCodeOld_lng As Long, mOpgVtmCodeOld_lng As Long, mOpgCDctCodeOld_lng As Long, mOpgRByCodeOld_lng As Long, mOpgFDigCodeOld_lng As Long, mOpgSrvCodeOld_lng As Long
Rem Outdoor Reg.Refund receipt
Public mOgfPttRegNoNotZero_bln As Boolean, mOgfVtmCodeDef_lng As Long
Public mOgfVtmCodeCfd_bln As Boolean
Public mOgfVtmCodeOld_lng As Long
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
Rem Outdoor Bill
Public mOblPttRegNoNotZero_bln As Boolean, mOblVtmCodeDef_lng As Long
Public mOblVtmCodeCfd_bln As Boolean
Public mOblVtmCodeOld_lng As Long
Rem outdoor bill payment receipt
Public mObpyPttRegNoNotZero_bln As Boolean, mObpyVtmCodeDef_lng As Long
Public mObpyVtmCodeCfd_bln As Boolean
Public mObpyVtmCodeOld_lng As Long
Rem outdoor bill refund receipt
Public mObfdPttRegNoNotZero_bln As Boolean, mObfdVtmCodeDef_lng As Long
Public mObfdVtmCodeCfd_bln As Boolean
Public mObfdVtmCodeOld_lng As Long
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
    
ElseIf blnOutdRgRefdOptMast = True Then
    mTableName = ""
    mCodeField = ""
    mNameField = ""
    mRecStateField = ""
    mTitleName = "Outdoor Reg.Refund"
    
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
    
ElseIf blnOutdBillOptMast = True Then
    mTableName = ""
    mCodeField = ""
    mNameField = ""
    mRecStateField = ""
    mTitleName = "Outdoor Bill"
    
ElseIf blnOutdBlPymtOptMast = True Then
    mTableName = ""
    mCodeField = ""
    mNameField = ""
    mRecStateField = ""
    mTitleName = "Outdoor Bill Payment"
    
ElseIf blnOutdBlRefdOptMast = True Then
    mTableName = ""
    mCodeField = ""
    mNameField = ""
    mRecStateField = ""
    mTitleName = "Outdoor Bill Refund"

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
blnOutdRegOptMast = False
blnOutdRgRefdOptMast = False
blnOutdRcptOptMast = False
blnOutdPymtOptMast = False
blnOutdRefdOptMast = False
blnOutdBillOptMast = False
blnOutdBlPymtOptMast = False
blnOutdBlRefdOptMast = False
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
            AlertBox "clsHmsOpdOptionsEntry_GetOutdRegOptData_#549_[Undefined Case_" & mOptTitle & "]"
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
            AlertBox "clsHmsOpdOptionsEntry_GetOutdRegOptData_#580_[Undefined Case_" & mOptTitle & "]"
        End Select
    Loop
    Close #fhand
End If
    
EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Sub

End Sub

Public Sub GetOutdRgRefdOptData()
Dim mOptTitle As String, mOptValue As String
Dim tRecset As New ADODB.Recordset, acount As Integer, fhand As Integer

Me.Clear
If FileExist(OutdRgRefdOptFileFullPath) = True Then
    fhand = FreeFile
    Open OutdRgRefdOptFileFullPath For Input As #fhand
    Do While EOF(fhand) = False
        Input #fhand, mOptTitle, mOptValue
        mOptTitle = UCase(mOptTitle)
        Select Case mOptTitle
        Case UCase("OgfPttRegNoNotZero")
            mOgfPttRegNoNotZero_bln = mOptValue
        Case UCase("OgfVtmCodeDef")
            mOgfVtmCodeDef_lng = mOptValue
        ' ----------------
        Case UCase("OgfVtmCodeCfd")
            mOgfVtmCodeCfd_bln = mOptValue
        Case Else
            AlertBox "clsHmsOpdOptionsEntry_GetOutdRgRefdOptData_#516_[Undefined Case_" & mOptTitle & "]"
        End Select
    Loop
    Close #fhand
End If
If FileExist(OutdRgRefdOldFileFullPath) = True Then
    fhand = FreeFile
    Open OutdRgRefdOldFileFullPath For Input As #fhand
    Do While EOF(fhand) = False
        Input #fhand, mOptTitle, mOptValue
        mOptTitle = UCase(mOptTitle)
        Select Case mOptTitle
        Case UCase("OgfVtmCodeOld")
            mOgfVtmCodeOld_lng = mOptValue
        Case Else
            AlertBox "clsHmsOpdOptionsEntry_GetOutdRgRefdOptData_#531_[Undefined Case_" & mOptTitle & "]"
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
            AlertBox "clsHmsOpdOptionsEntry_GetOutdRcptOptData_#498_[Undefined Case_" & mOptTitle & "]"
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
            AlertBox "clsHmsOpdOptionsEntry_GetOutdRcptOptData_#529_[Undefined Case_" & mOptTitle & "]"
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
            AlertBox "clsHmsOpdOptionsEntry_GetOutdPymtOptData_#516_[Undefined Case_" & mOptTitle & "]"
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
            AlertBox "clsHmsOpdOptionsEntry_GetOutdPymtOptData_#531_[Undefined Case_" & mOptTitle & "]"
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
            AlertBox "clsHmsOpdOptionsEntry_GetOutdRefdOptData_#516_[Undefined Case_" & mOptTitle & "]"
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
            AlertBox "clsHmsOpdOptionsEntry_GetOutdRefdOptData_#531_[Undefined Case_" & mOptTitle & "]"
        End Select
    Loop
    Close #fhand
End If
    
EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Sub

End Sub

Public Sub GetOutdBillOptData()
Dim mOptTitle As String, mOptValue As String
Dim tRecset As New ADODB.Recordset, acount As Integer, fhand As Integer

Me.Clear
If FileExist(OutdBillOptFileFullPath) = True Then
    fhand = FreeFile
    Open OutdBillOptFileFullPath For Input As #fhand
    Do While EOF(fhand) = False
        Input #fhand, mOptTitle, mOptValue
        mOptTitle = UCase(mOptTitle)
        Select Case mOptTitle
        Case UCase("OblPttRegNoNotZero")
            mOblPttRegNoNotZero_bln = mOptValue
        Case UCase("OblVtmCodeDef")
            mOblVtmCodeDef_lng = mOptValue
        ' ----------------
        Case UCase("OblVtmCodeCfd")
            mOblVtmCodeCfd_bln = mOptValue
        Case Else
            AlertBox "clsHmsOpdOptionsEntry_GetOutdBillOptData_#498_[Undefined Case_" & mOptTitle & "]"
        End Select
    Loop
    Close #fhand
End If
If FileExist(OutdBillOldFileFullPath) = True Then
    fhand = FreeFile
    Open OutdBillOldFileFullPath For Input As #fhand
    Do While EOF(fhand) = False
        Input #fhand, mOptTitle, mOptValue
        mOptTitle = UCase(mOptTitle)
        Select Case mOptTitle
        Case UCase("OblVtmCodeOld")
            mOblVtmCodeOld_lng = mOptValue
        Case Else
            AlertBox "clsHmsOpdOptionsEntry_GetOutdBillOptData_#529_[Undefined Case_" & mOptTitle & "]"
        End Select
    Loop
    Close #fhand
End If
    
EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Sub

End Sub

Public Sub GetOutdBlPymtOptData()
Dim mOptTitle As String, mOptValue As String
Dim tRecset As New ADODB.Recordset, acount As Integer, fhand As Integer

Me.Clear
If FileExist(OutdBlPymtOptFileFullPath) = True Then
    fhand = FreeFile
    Open OutdBlPymtOptFileFullPath For Input As #fhand
    Do While EOF(fhand) = False
        Input #fhand, mOptTitle, mOptValue
        mOptTitle = UCase(mOptTitle)
        Select Case mOptTitle
        Case UCase("ObpyPttRegNoNotZero")
            mObpyPttRegNoNotZero_bln = mOptValue
        Case UCase("ObpyVtmCodeDef")
            mObpyVtmCodeDef_lng = mOptValue
        ' ----------------
        Case UCase("ObpyVtmCodeCfd")
            mObpyVtmCodeCfd_bln = mOptValue
        Case Else
            AlertBox "clsHmsOpdOptionsEntry_GetOutdBlPymtOptData_#516_[Undefined Case_" & mOptTitle & "]"
        End Select
    Loop
    Close #fhand
End If
If FileExist(OutdBlPymtOldFileFullPath) = True Then
    fhand = FreeFile
    Open OutdBlPymtOldFileFullPath For Input As #fhand
    Do While EOF(fhand) = False
        Input #fhand, mOptTitle, mOptValue
        mOptTitle = UCase(mOptTitle)
        Select Case mOptTitle
        Case UCase("ObpyVtmCodeOld")
            mObpyVtmCodeOld_lng = mOptValue
        Case Else
            AlertBox "clsHmsOpdOptionsEntry_GetOutdBlPymtOptData_#531_[Undefined Case_" & mOptTitle & "]"
        End Select
    Loop
    Close #fhand
End If
    
EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Sub

End Sub

Public Sub GetOutdBlRefdOptData()
Dim mOptTitle As String, mOptValue As String
Dim tRecset As New ADODB.Recordset, acount As Integer, fhand As Integer

Me.Clear
If FileExist(OutdBlRefdOptFileFullPath) = True Then
    fhand = FreeFile
    Open OutdBlRefdOptFileFullPath For Input As #fhand
    Do While EOF(fhand) = False
        Input #fhand, mOptTitle, mOptValue
        mOptTitle = UCase(mOptTitle)
        Select Case mOptTitle
        Case UCase("ObfdPttRegNoNotZero")
            mObfdPttRegNoNotZero_bln = mOptValue
        Case UCase("ObfdVtmCodeDef")
            mObfdVtmCodeDef_lng = mOptValue
        ' ----------------
        Case UCase("ObfdVtmCodeCfd")
            mObfdVtmCodeCfd_bln = mOptValue
        Case Else
            AlertBox "clsHmsOpdOptionsEntry_GetOutdBlRefdOptData_#516_[Undefined Case_" & mOptTitle & "]"
        End Select
    Loop
    Close #fhand
End If
If FileExist(OutdBlRefdOldFileFullPath) = True Then
    fhand = FreeFile
    Open OutdBlRefdOldFileFullPath For Input As #fhand
    Do While EOF(fhand) = False
        Input #fhand, mOptTitle, mOptValue
        mOptTitle = UCase(mOptTitle)
        Select Case mOptTitle
        Case UCase("ObfdVtmCodeOld")
            mObfdVtmCodeOld_lng = mOptValue
        Case Else
            AlertBox "clsHmsOpdOptionsEntry_GetOutdBlRefdOptData_#531_[Undefined Case_" & mOptTitle & "]"
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
    AlertBox "clsHmsOpdOptionsEntry_GetOutdRegOptBoundCode_#961_[Undefined Case_" & mOptTitle & "]"
End Select
    
GetOutdRegOptBoundCode = mRtnval

End Function

Public Function GetOutdRgRefdOptBoundCode(ByVal mOptTitle As String) As Long
Dim mRtnval As Long
mRtnval = 0

mOptTitle = UCase(mOptTitle)
Select Case mOptTitle
Case UCase("OgfVtmCode")
    mRtnval = IIf(mOgfVtmCodeCfd_bln = True, mOgfVtmCodeOld_lng, mOgfVtmCodeDef_lng)
Case Else
    AlertBox "clsHmsOpdOptionsEntry_GetOutdRgRefdOptBoundCode_#776_[Undefined Case_" & mOptTitle & "]"
End Select
    
GetOutdRgRefdOptBoundCode = mRtnval

End Function

Public Function GetOutdRcptOptBoundCode(ByVal mOptTitle As String) As Long
Dim mRtnval As Long
mRtnval = 0

mOptTitle = UCase(mOptTitle)
Select Case mOptTitle
Case UCase("OrcVtmCode")
    mRtnval = IIf(mOrcVtmCodeCfd_bln = True, mOrcVtmCodeOld_lng, mOrcVtmCodeDef_lng)
Case Else
    AlertBox "clsHmsOpdOptionsEntry_GetOutdRcptOptBoundCode_#961_[Undefined Case_" & mOptTitle & "]"
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
    AlertBox "clsHmsOpdOptionsEntry_GetOutdPymtOptBoundCode_#776_[Undefined Case_" & mOptTitle & "]"
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
    AlertBox "clsHmsOpdOptionsEntry_GetOutdRefdOptBoundCode_#776_[Undefined Case_" & mOptTitle & "]"
End Select
    
GetOutdRefdOptBoundCode = mRtnval

End Function

Public Function GetOutdBillOptBoundCode(ByVal mOptTitle As String) As Long
Dim mRtnval As Long
mRtnval = 0

mOptTitle = UCase(mOptTitle)
Select Case mOptTitle
Case UCase("OblVtmCode")
    mRtnval = IIf(mOblVtmCodeCfd_bln = True, mOblVtmCodeOld_lng, mOblVtmCodeDef_lng)
Case Else
    AlertBox "clsHmsOpdOptionsEntry_GetOutdBillOptBoundCode_#961_[Undefined Case_" & mOptTitle & "]"
End Select
    
GetOutdBillOptBoundCode = mRtnval

End Function

Public Function GetOutdBlPymtOptBoundCode(ByVal mOptTitle As String) As Long
Dim mRtnval As Long
mRtnval = 0

mOptTitle = UCase(mOptTitle)
Select Case mOptTitle
Case UCase("ObpyVtmCode")
    mRtnval = IIf(mObpyVtmCodeCfd_bln = True, mObpyVtmCodeOld_lng, mObpyVtmCodeDef_lng)
Case Else
    AlertBox "clsHmsOpdOptionsEntry_GetOutdBlPymtOptBoundCode_#776_[Undefined Case_" & mOptTitle & "]"
End Select
    
GetOutdBlPymtOptBoundCode = mRtnval

End Function

Public Function GetOutdBlRefdOptBoundCode(ByVal mOptTitle As String) As Long
Dim mRtnval As Long
mRtnval = 0

mOptTitle = UCase(mOptTitle)
Select Case mOptTitle
Case UCase("ObfdVtmCode")
    mRtnval = IIf(mObfdVtmCodeCfd_bln = True, mObfdVtmCodeOld_lng, mObfdVtmCodeDef_lng)
Case Else
    AlertBox "clsHmsOpdOptionsEntry_GetOutdBlRefdOptBoundCode_#776_[Undefined Case_" & mOptTitle & "]"
End Select
    
GetOutdBlRefdOptBoundCode = mRtnval

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

ElseIf blnOutdRgRefdOptMast = True Then
    mOgfPttRegNoNotZero_bln = False
    mOgfVtmCodeDef_lng = 0
    ' ---------------
    mOgfVtmCodeCfd_bln = False
    ' ------------------------
    mOgfVtmCodeOld_lng = 0
    
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
    
ElseIf blnOutdBillOptMast = True Then
    mOblPttRegNoNotZero_bln = False
    mOblVtmCodeDef_lng = 0
    ' ---------------
    mOblVtmCodeCfd_bln = False
    ' ------------------------
    mOblVtmCodeOld_lng = 0

ElseIf blnOutdBlPymtOptMast = True Then
    mObpyPttRegNoNotZero_bln = False
    mObpyVtmCodeDef_lng = 0
    ' ---------------
    mObpyVtmCodeCfd_bln = False
    ' ------------------------
    mObpyVtmCodeOld_lng = 0
    
ElseIf blnOutdBlRefdOptMast = True Then
    mObfdPttRegNoNotZero_bln = False
    mObfdVtmCodeDef_lng = 0
    ' ---------------
    mObfdVtmCodeCfd_bln = False
    ' ------------------------
    mObfdVtmCodeOld_lng = 0

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

Public Function UpdateOutdRgRefdOpt() As Boolean
Dim fhand As Integer
Dim mOptTitle As String, mOptValue As String

UpdateOutdRgRefdOpt = False
On Error GoTo errhand

fhand = FreeFile
Open OutdRgRefdOptFileFullPath For Output As #fhand

Write #fhand, UCase("OgfPttRegNoNotZero"), mOgfPttRegNoNotZero_bln
Write #fhand, UCase("OgfVtmCodeDef"), mOgfVtmCodeDef_lng
' ----------------
Write #fhand, UCase("OgfVtmCodeCfd"), mOgfVtmCodeCfd_bln
' -----------------------------------------
Close #fhand

UpdateOutdRgRefdOpt = True
GoTo EndSub

errhand:
MsgBox Err.Description

EndSub:
Exit Function

End Function

Public Function UpdateOutdRgRefdOld() As Boolean
Dim fhand As Integer
Dim mOptTitle As String, mOptValue As String

UpdateOutdRgRefdOld = False
On Error GoTo errhand

fhand = FreeFile
Open OutdRgRefdOldFileFullPath For Output As #fhand

Write #fhand, UCase("OgfVtmCodeOld"), mOgfVtmCodeOld_lng
' -----------------------------------------
Close #fhand
' -----------------------------------------
UpdateOutdRgRefdOld = True
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

Public Function UpdateOutdBillOpt() As Boolean
Dim fhand As Integer
Dim mOptTitle As String, mOptValue As String

UpdateOutdBillOpt = False
On Error GoTo errhand

fhand = FreeFile
Open OutdBillOptFileFullPath For Output As #fhand

Write #fhand, UCase("OblPttRegNoNotZero"), mOblPttRegNoNotZero_bln
Write #fhand, UCase("OblVtmCodeDef"), mOblVtmCodeDef_lng
' ----------------
Write #fhand, UCase("OblVtmCodeCfd"), mOblVtmCodeCfd_bln
' -----------------------------------------
Close #fhand

UpdateOutdBillOpt = True
GoTo EndSub

errhand:
MsgBox Err.Description

EndSub:
Exit Function

End Function

Public Function UpdateOutdBillOld() As Boolean
Dim fhand As Integer
Dim mOptTitle As String, mOptValue As String

UpdateOutdBillOld = False
On Error GoTo errhand

fhand = FreeFile
Open OutdBillOldFileFullPath For Output As #fhand

Write #fhand, UCase("OblVtmCodeOld"), mOblVtmCodeOld_lng
' -----------------------------------------
Close #fhand
' -----------------------------------------
UpdateOutdBillOld = True
GoTo EndSub

errhand:
MsgBox Err.Description

EndSub:
Exit Function

End Function

Public Function UpdateOutdBlPymtOpt() As Boolean
Dim fhand As Integer
Dim mOptTitle As String, mOptValue As String

UpdateOutdBlPymtOpt = False
On Error GoTo errhand

fhand = FreeFile
Open OutdBlPymtOptFileFullPath For Output As #fhand

Write #fhand, UCase("ObpyPttRegNoNotZero"), mObpyPttRegNoNotZero_bln
Write #fhand, UCase("ObpyVtmCodeDef"), mObpyVtmCodeDef_lng
' ----------------
Write #fhand, UCase("ObpyVtmCodeCfd"), mObpyVtmCodeCfd_bln
' -----------------------------------------
Close #fhand

UpdateOutdBlPymtOpt = True
GoTo EndSub

errhand:
MsgBox Err.Description

EndSub:
Exit Function

End Function

Public Function UpdateOutdBlPymtOld() As Boolean
Dim fhand As Integer
Dim mOptTitle As String, mOptValue As String

UpdateOutdBlPymtOld = False
On Error GoTo errhand

fhand = FreeFile
Open OutdBlPymtOldFileFullPath For Output As #fhand

Write #fhand, UCase("ObpyVtmCodeOld"), mObpyVtmCodeOld_lng
' -----------------------------------------
Close #fhand
' -----------------------------------------
UpdateOutdBlPymtOld = True
GoTo EndSub

errhand:
MsgBox Err.Description

EndSub:
Exit Function

End Function

Public Function UpdateOutdBlRefdOpt() As Boolean
Dim fhand As Integer
Dim mOptTitle As String, mOptValue As String

UpdateOutdBlRefdOpt = False
On Error GoTo errhand

fhand = FreeFile
Open OutdBlRefdOptFileFullPath For Output As #fhand

Write #fhand, UCase("ObfdPttRegNoNotZero"), mObfdPttRegNoNotZero_bln
Write #fhand, UCase("ObfdVtmCodeDef"), mObfdVtmCodeDef_lng
' ----------------
Write #fhand, UCase("ObfdVtmCodeCfd"), mObfdVtmCodeCfd_bln
' -----------------------------------------
Close #fhand

UpdateOutdBlRefdOpt = True
GoTo EndSub

errhand:
MsgBox Err.Description

EndSub:
Exit Function

End Function

Public Function UpdateOutdBlRefdOld() As Boolean
Dim fhand As Integer
Dim mOptTitle As String, mOptValue As String

UpdateOutdBlRefdOld = False
On Error GoTo errhand

fhand = FreeFile
Open OutdBlRefdOldFileFullPath For Output As #fhand

Write #fhand, UCase("ObfdVtmCodeOld"), mObfdVtmCodeOld_lng
' -----------------------------------------
Close #fhand
' -----------------------------------------
UpdateOutdBlRefdOld = True
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

