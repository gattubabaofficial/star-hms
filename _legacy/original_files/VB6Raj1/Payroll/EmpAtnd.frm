VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmEmpAttendance 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   ClientHeight    =   9315
   ClientLeft      =   60
   ClientTop       =   60
   ClientWidth     =   14340
   ControlBox      =   0   'False
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   ScaleHeight     =   9315
   ScaleWidth      =   14340
   ShowInTaskbar   =   0   'False
   Begin VB.Frame frHeader 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   1455
      Left            =   120
      TabIndex        =   23
      Top             =   840
      Width           =   13815
      Begin VB.ComboBox cmbSortingOrder 
         Appearance      =   0  'Flat
         Height          =   315
         Left            =   6720
         Style           =   2  'Dropdown List
         TabIndex        =   5
         Top             =   960
         Width           =   2175
      End
      Begin VB.TextBox dtpAtdDate2 
         Appearance      =   0  'Flat
         BeginProperty DataFormat 
            Type            =   1
            Format          =   "dd/MM/yyyy"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   3
         EndProperty
         Height          =   285
         Left            =   4080
         TabIndex        =   1
         Tag             =   "AhCode"
         Text            =   "dd/mm/yyyy"
         Top             =   240
         Width           =   1215
      End
      Begin VB.CommandButton cmdShowDtlData 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         Caption         =   "&Show"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   9360
         Style           =   1  'Graphical
         TabIndex        =   6
         Top             =   960
         Width           =   735
      End
      Begin VB.TextBox txtEmpName1 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   1800
         TabIndex        =   4
         Top             =   960
         Width           =   3495
      End
      Begin VB.TextBox txtDsgName1 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   1800
         TabIndex        =   2
         Top             =   600
         Width           =   3495
      End
      Begin VB.TextBox txtDptName1 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   6720
         TabIndex        =   3
         Top             =   600
         Width           =   3375
      End
      Begin VB.TextBox dtpAtdDate1 
         Appearance      =   0  'Flat
         BeginProperty DataFormat 
            Type            =   1
            Format          =   "dd/MM/yyyy"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   3
         EndProperty
         Height          =   285
         Left            =   1800
         TabIndex        =   0
         Tag             =   "AhCode"
         Text            =   "dd/mm/yyyy"
         Top             =   240
         Width           =   1215
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Sorting Order:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   4
         Left            =   5400
         TabIndex        =   29
         Top             =   960
         Width           =   1335
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "To Date:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   19
         Left            =   3240
         TabIndex        =   28
         Top             =   240
         Width           =   855
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Designation:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   3
         Left            =   240
         TabIndex        =   27
         Top             =   600
         Width           =   1575
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Employee Name:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   2
         Left            =   240
         TabIndex        =   26
         Top             =   960
         Width           =   1575
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Department:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   0
         Left            =   5400
         TabIndex        =   25
         Top             =   600
         Width           =   1095
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "From Date:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   1
         Left            =   240
         TabIndex        =   24
         Top             =   240
         Width           =   1575
      End
   End
   Begin VB.TextBox txtVoid 
      CausesValidation=   0   'False
      Height          =   375
      Left            =   120
      TabIndex        =   17
      TabStop         =   0   'False
      Text            =   "Void"
      Top             =   8760
      Width           =   255
   End
   Begin VB.CommandButton cmdFormEscape 
      Appearance      =   0  'Flat
      BackColor       =   &H008080FF&
      Cancel          =   -1  'True
      Caption         =   "X"
      BeginProperty Font 
         Name            =   "Arial Black"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   8040
      MaskColor       =   &H000000FF&
      Style           =   1  'Graphical
      TabIndex        =   22
      TabStop         =   0   'False
      Top             =   0
      Width           =   255
   End
   Begin VB.CommandButton cmdFormEnter 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      Default         =   -1  'True
      BeginProperty Font 
         Name            =   "Arial Black"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   8760
      MaskColor       =   &H000000FF&
      TabIndex        =   21
      TabStop         =   0   'False
      Top             =   0
      UseMaskColor    =   -1  'True
      Width           =   255
   End
   Begin VB.ComboBox cmbFormEntryMode 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   315
      ItemData        =   "EmpAtnd.frx":0000
      Left            =   0
      List            =   "EmpAtnd.frx":000D
      Style           =   1  'Simple Combo
      TabIndex        =   20
      TabStop         =   0   'False
      Text            =   "cmbFormMode"
      Top             =   360
      Width           =   1455
   End
   Begin VB.Frame frFormDtl 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   6255
      Left            =   120
      TabIndex        =   19
      Top             =   2280
      Width           =   13815
      Begin VB.CommandButton cmdOK 
         Appearance      =   0  'Flat
         BackColor       =   &H008080FF&
         Caption         =   "&OK"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   13080
         Style           =   1  'Graphical
         TabIndex        =   16
         Top             =   1200
         Width           =   735
      End
      Begin VB.TextBox txtSaveStatus 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   12720
         TabIndex        =   30
         Top             =   1200
         Width           =   300
      End
      Begin VB.TextBox txtWDayName 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   1320
         TabIndex        =   9
         Top             =   1200
         Width           =   735
      End
      Begin VB.ComboBox cmbStatusName 
         Appearance      =   0  'Flat
         Height          =   315
         Left            =   11160
         Style           =   2  'Dropdown List
         TabIndex        =   15
         Top             =   1200
         Width           =   1575
      End
      Begin VB.TextBox dtpAtdDate 
         Appearance      =   0  'Flat
         BeginProperty DataFormat 
            Type            =   1
            Format          =   "dd/MM/yyyy"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   3
         EndProperty
         Height          =   285
         Left            =   120
         TabIndex        =   8
         Tag             =   "AhCode"
         Text            =   "dd/mm/yyyy"
         Top             =   1200
         Width           =   1215
      End
      Begin VB.ComboBox cmbSftName 
         Appearance      =   0  'Flat
         Height          =   315
         Left            =   9480
         Style           =   2  'Dropdown List
         TabIndex        =   13
         Top             =   1200
         Width           =   975
      End
      Begin VB.TextBox txtDptName 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   7560
         TabIndex        =   12
         Top             =   1200
         Width           =   1935
      End
      Begin VB.TextBox txtDsgName 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   5280
         TabIndex        =   11
         Top             =   1200
         Width           =   2295
      End
      Begin VB.TextBox txtEmpName 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   2040
         TabIndex        =   10
         Top             =   1200
         Width           =   3255
      End
      Begin VB.TextBox txtTimeStr 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   10440
         TabIndex        =   14
         Text            =   "00:00"
         Top             =   1200
         Width           =   735
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd2 
         Height          =   5775
         Left            =   120
         TabIndex        =   7
         Top             =   240
         Width           =   13455
         _ExtentX        =   23733
         _ExtentY        =   10186
         _Version        =   393216
         FixedCols       =   0
         RowHeightMin    =   285
         FocusRect       =   2
         HighLight       =   2
         SelectionMode   =   1
         AllowUserResizing=   3
         Appearance      =   0
      End
   End
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Employee Attendance"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   375
      Left            =   0
      TabIndex        =   18
      Top             =   0
      Width           =   9015
   End
End
Attribute VB_Name = "frmEmpAttendance"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim dbAcDatabase As New ADODB.Connection, dbPyrDatabase As New ADODB.Connection, dbComDatabase As New ADODB.Connection
Dim mFormLoaded As Boolean, mLastKeyPressed As Integer
Dim mRemoteAccess As Boolean, mEntrySaved As Boolean, mEntryAborted As Boolean
Dim dtlAddEditMode As Boolean, dtlAddMode As Boolean, dtlEditCanceled As Boolean
Dim clsATD As clsPayrollTranEntry, clsEMP As clsPayrollMasterEntry, clsDSG As clsPayrollMasterEntry, clsDPT As clsPayrollMasterEntry, mActiveControl As Object
Dim fcmbEmpName As frmFlexSearchList, fcmbDsgName As frmFlexSearchList, fcmbDptName As frmFlexSearchList
Dim mAtdDate_old As Date, mAtdEmpCode_old As Long, mAtdDsgCode_old As Long, mAtdDptCode_old As Long, mAtdTime_old As Long
Dim mAtdDate1_changed As Date

' StockJrn transaction detail grid Mfgrd2 column definitions
Const X2ATDICODE_COL = 0
Const X2ATDDATE_COL = 1
Const X2WDAYNAME_COL = 2
Const X2EMPNAME_COL = 3
Const X2DSGNAME_COL = 4
Const X2DPTNAME_COL = 5
Const X2SFTNAME_COL = 6
Const X2TIMESTR_COL = 7
Const X2STATUSNAME_COL = 8
Const X2SAVESTATUS_COL = 9
Const X2ATDCODE_COL = 10
Const X2ATDSNO_COL = 11
Const X2ATDEMPCODE_COL = 12
Const X2ATDDSGCODE_COL = 13
Const X2ATDDPTCODE_COL = 14
Const X2ATDSFTCODE_COL = 15
Const X2ATDTIME_COL = 16
Const X2ATDSTATUS_COL = 17
Const X2ATDRECSTATE_COL = 18
Const MFGRD2_COLS = 19

Rem sorting order declartions
Const cLIST_DATEWISE = 0
Const cLIST_EMPWISE = 1

Private Property Get FormAddEditMode() As Integer
FormAddEditMode = cmbFormEntryMode.ListIndex
End Property

Private Property Let FormAddEditMode(ByVal New_FormEntryMode As Integer)
cmbFormEntryMode.ListIndex = New_FormEntryMode
End Property

Private Sub cmbSftName_Validate(Cancel As Boolean)
If cmbSftName.ListIndex = -1 Then
    ErrorBox "Invalid Shift !!!"
    Cancel = True
    cmbSftName.SetFocus
End If
Call ValidDtl

End Sub

Private Sub cmbSortingOrder_GotFocus()
FlashActiveControl cmbSortingOrder, True
End Sub

Private Sub cmbSortingOrder_LostFocus()
FlashActiveControl cmbSortingOrder, False
End Sub

Private Sub cmbStatusName_Validate(Cancel As Boolean)
If cmbStatusName.ListIndex = -1 Then
    ErrorBox "Invalid Attendance Status !!!"
    Cancel = True
    cmbStatusName.SetFocus
End If
Call ValidDtl

End Sub

Private Sub cmdFormEnter_Click()
mLastKeyPressed = 13
If TypeOf Screen.ActiveControl Is MSFlexGrid Then
    If Screen.ActiveControl.Name = Mfgrd2.Name Then
        Call Mfgrd2_KeyPress(13)
    End If
Else
    SendKeys "{tab}"
End If

End Sub

Private Sub cmdFormEscape_Click()
Dim mRecAbsPos As Long
mLastKeyPressed = 27
If dtlAddEditMode = True Then
    dtlEditCanceled = True
    Call cmdOK_Click
ElseIf Screen.ActiveControl.Name = Mfgrd2.Name Then
    dtpAtdDate1.SetFocus
Else
    Unload Me
End If

End Sub

Private Sub cmdOK_Click()
Dim ATDRecset As New ADODB.Recordset, ATD_LogRS As New ADODB.Recordset
Dim srow As Long, mAtdCode As Long, mAtdICode As Long, mAtdSno As Long

srow = Mfgrd2.Row
mAtdCode = clsATD.ActiveTrnCode
If dtlAddMode = True Then
    Rem
Else
    mAtdICode = Val(Mfgrd2.TextMatrix(srow, X2ATDICODE_COL))
End If
If dtlEditCanceled = False Then
    Call ValidDtl
End If
If cmdOK.Caption = "&OK" And dtlEditCanceled = False Then
    Rem addnew/update -------------------------
    If dtlAddMode = True Then
        clsATD.Clear
    Else
        clsATD.GetData mAtdCode, mAtdICode
    End If
    clsATD.mAtdDate_dt = Ctod(dtpAtdDate.Text)
    clsATD.mAtdEmpCode_lng = Val(fcmbEmpName.BoundText)
    clsATD.mAtdDsgCode_lng = Val(fcmbDsgName.BoundText)
    clsATD.mAtdDptCode_lng = Val(fcmbDptName.BoundText)
    clsATD.mAtdSftCode_int = cmbSftName.ListIndex + 1
    clsATD.mAtdTime_lng = TimeToMin(txtTimeStr.Text)
    clsATD.mAtdStatus_int = Val(Right(cmbStatusName.List(cmbStatusName.ListIndex), 1))
    clsATD.mAtdStartTime_lng = 0
    clsATD.mAtdEndTime_lng = 0
    clsATD.mAtdNarr_str = ""
    
    If dtlAddMode = True Then
        clsATD.AddNew mAtdCode
        mAtdICode = clsATD.mTrnICode_lng
    Else
        clsATD.Update mAtdCode, mAtdICode
    End If
    
    clsATD.CommitTran mAtdCode
    
    clsATD.EndTran mAtdCode
    
    Rem show record in flexgrid
    With ATDRecset
    .Open "Select * from Attendance where AtdCode=" & CStr(mAtdCode) & " and AtdICode=" & CStr(mAtdICode) & "", dbPyrDatabase, adOpenKeyset, adLockOptimistic
    
    clsEMP.GetData .Fields("AtdEmpCode")
    clsDSG.GetData .Fields("AtdDsgCode")
    clsDPT.GetData .Fields("AtdDptCode")
    
    Mfgrd2.TextMatrix(srow, X2ATDICODE_COL) = .Fields("AtdICode")
    Mfgrd2.TextMatrix(srow, X2ATDDATE_COL) = Dtoc(.Fields("AtdDate"))
    Mfgrd2.TextMatrix(srow, X2WDAYNAME_COL) = WeekdayName(Weekday(.Fields("AtdDate")))
    Mfgrd2.TextMatrix(srow, X2EMPNAME_COL) = clsEMP.mAhName_str
    Mfgrd2.TextMatrix(srow, X2DSGNAME_COL) = clsDSG.mName_str
    Mfgrd2.TextMatrix(srow, X2DPTNAME_COL) = clsDPT.mName_str
    Mfgrd2.TextMatrix(srow, X2SFTNAME_COL) = GetMidPosStr(cATNDSFT_LIST, .Fields("AtdSftCode"), ",")
    Mfgrd2.TextMatrix(srow, X2TIMESTR_COL) = MinToTime(.Fields("AtdTime"))
    Mfgrd2.TextMatrix(srow, X2STATUSNAME_COL) = GetMidPosStr(cATNDSTAT_LIST, .Fields("AtdStatus"), ",")
    Mfgrd2.TextMatrix(srow, X2SAVESTATUS_COL) = "*"
    Mfgrd2.TextMatrix(srow, X2ATDCODE_COL) = .Fields("AtdCode")
    Mfgrd2.TextMatrix(srow, X2ATDSNO_COL) = .Fields("AtdSno")
    Mfgrd2.TextMatrix(srow, X2ATDEMPCODE_COL) = .Fields("AtdEmpCode")
    Mfgrd2.TextMatrix(srow, X2ATDDSGCODE_COL) = .Fields("AtdDsgCode")
    Mfgrd2.TextMatrix(srow, X2ATDDPTCODE_COL) = .Fields("AtdDptCode")
    Mfgrd2.TextMatrix(srow, X2ATDSFTCODE_COL) = .Fields("AtdSftCode")
    Mfgrd2.TextMatrix(srow, X2ATDTIME_COL) = .Fields("AtdTime")
    Mfgrd2.TextMatrix(srow, X2ATDSTATUS_COL) = .Fields("AtdStatus")
    Mfgrd2.TextMatrix(srow, X2ATDRECSTATE_COL) = .Fields("AtdRecState")
    
    ShowFlexRowColor ATDRecset, Mfgrd2, srow
    
    End With
    CloseTable ATDRecset
    
    If srow = FlexNewRow(Mfgrd2) Then
        Mfgrd2.Rows = Mfgrd2.Rows + 1
    End If
    srow = srow + 1
    Mfgrd2.Row = srow
Else
    Rem cance event -----------------------------------
    clsATD.CancelTran mAtdCode
    clsATD.EndTran mAtdCode
    
End If
dtlAddEditMode = False
dtlAddMode = False
dtlEditCanceled = False
VisibleControls False
Mfgrd2.SetFocus
GoTo EndSub
Exit Sub

EndSub:
Set ATDRecset = Nothing
Set ATD_LogRS = Nothing

End Sub

Private Sub cmdShowDtlData_Click()
Dim tRecset As New ADODB.Recordset, srow As Long, scol As Integer, cnt As Integer, mAtdDate As Date, mAtdEmpCode As Long
Dim mAtdDate1 As Date, mAtdDate2 As Date
srow = 1

fcmbEmpName.Text = txtEmpName1.Text: txtEmpName1.Text = fcmbEmpName.Text
fcmbDsgName.Text = txtDsgName1.Text: txtDsgName1.Text = fcmbDsgName.Text
fcmbDptName.Text = txtDptName1.Text: txtDptName1.Text = fcmbDptName.Text

mAtdDate1 = Ctod(dtpAtdDate1.Text)
mAtdDate2 = Ctod(dtpAtdDate2.Text)

Screen.MousePointer = vbHourglass
tRecset.Open "Select Attendance.*,AchdMast.AhName from Attendance" _
    & " left join AchdMast on Attendance.AtdEmpCode=AchdMast.AhCode" _
    & " where AtdDate between #" & CStr(ToSysDate(mAtdDate1)) & "# and #" & CStr(ToSysDate(mAtdDate2)) & "#" _
    & IIf(Val(fcmbEmpName.BoundText) > 0, " and AtdEmpCode=" & CStr(Val(fcmbEmpName.BoundText)), "") _
    & IIf(Val(fcmbDsgName.BoundText) > 0, " and AtdDsgCode=" & CStr(Val(fcmbDsgName.BoundText)), "") _
    & IIf(Val(fcmbDptName.BoundText) > 0, " and AtdDptCode=" & CStr(Val(fcmbDptName.BoundText)), "") _
    & " order by " & IIf(cmbSortingOrder.ListIndex = cLIST_EMPWISE, "AchdMast.AhName,AtdDate", "AtdDate,AchdMast.AhName") & ",AtdICode" _
    , dbComDatabase, adOpenKeyset, adLockOptimistic
With tRecset
If .RecordCount > 0 Then
    Do While .EOF = False
        clsEMP.GetData .Fields("AtdEmpCode")
        clsDSG.GetData .Fields("AtdDsgCode")
        clsDPT.GetData .Fields("AtdDptCode")
        
        Mfgrd2.TextMatrix(srow, X2ATDICODE_COL) = .Fields("AtdICode")
        Mfgrd2.TextMatrix(srow, X2ATDDATE_COL) = Dtoc(.Fields("AtdDate"))
        Mfgrd2.TextMatrix(srow, X2WDAYNAME_COL) = WeekdayName(Weekday(.Fields("AtdDate")))
        Mfgrd2.TextMatrix(srow, X2EMPNAME_COL) = clsEMP.mAhName_str
        Mfgrd2.TextMatrix(srow, X2DSGNAME_COL) = clsDSG.mName_str
        Mfgrd2.TextMatrix(srow, X2DPTNAME_COL) = clsDPT.mName_str
        Mfgrd2.TextMatrix(srow, X2SFTNAME_COL) = GetMidPosStr(cATNDSFT_LIST, .Fields("AtdSftCode"), ",")
        Mfgrd2.TextMatrix(srow, X2TIMESTR_COL) = MinToTime(.Fields("AtdTime"))
        Mfgrd2.TextMatrix(srow, X2STATUSNAME_COL) = GetMidPosStr(cATNDSTAT_LIST, .Fields("AtdStatus"), ",")
        Mfgrd2.TextMatrix(srow, X2SAVESTATUS_COL) = "*"
        Mfgrd2.TextMatrix(srow, X2ATDCODE_COL) = .Fields("AtdCode")
        Mfgrd2.TextMatrix(srow, X2ATDSNO_COL) = .Fields("AtdSno")
        Mfgrd2.TextMatrix(srow, X2ATDEMPCODE_COL) = .Fields("AtdEmpCode")
        Mfgrd2.TextMatrix(srow, X2ATDDSGCODE_COL) = .Fields("AtdDsgCode")
        Mfgrd2.TextMatrix(srow, X2ATDDPTCODE_COL) = .Fields("AtdDptCode")
        Mfgrd2.TextMatrix(srow, X2ATDSFTCODE_COL) = .Fields("AtdSftCode")
        Mfgrd2.TextMatrix(srow, X2ATDTIME_COL) = .Fields("AtdTime")
        Mfgrd2.TextMatrix(srow, X2ATDSTATUS_COL) = .Fields("AtdStatus")
        Mfgrd2.TextMatrix(srow, X2ATDRECSTATE_COL) = .Fields("AtdRecState")
        
        ShowFlexRowColor tRecset, Mfgrd2, srow
        
        srow = srow + 1
        If Mfgrd2.Rows < srow + 1 Then
            Mfgrd2.Rows = Mfgrd2.Rows + 1
        End If
        
        .MoveNext
    Loop
    CloseTable tRecset
Else
    .Close
    If cmbSortingOrder.ListIndex = cLIST_DATEWISE Then
        For mAtdDate = mAtdDate1 To mAtdDate2
            .Open "Select * from EmpMast left join AchdMast on EmpMast.EmpCode=AchdMast.AhCode" _
                & " where EmpJoinDate<=#" & CStr(ToSysDate(mAtdDate)) & "# and EmpJobState=" & CStr(cATNDJSTAT_CONTINUED) _
                & IIf(Val(fcmbEmpName.BoundText) > 0, " and EmpCode=" & CStr(Val(fcmbEmpName.BoundText)), "") _
                & IIf(Val(fcmbDsgName.BoundText) > 0, " and EmpDsgCode=" & CStr(Val(fcmbDsgName.BoundText)), "") _
                & IIf(Val(fcmbDptName.BoundText) > 0, " and EmpDptCode=" & CStr(Val(fcmbDptName.BoundText)), "") _
                & " order by AhName", dbComDatabase, adOpenKeyset, adLockOptimistic
            Do While .EOF = False
                clsEMP.GetData .Fields("EmpCode")
                clsDSG.GetData .Fields("EmpDsgCode")
                clsDPT.GetData .Fields("EmpDptCode")
                
                Mfgrd2.TextMatrix(srow, X2ATDICODE_COL) = ""
                Mfgrd2.TextMatrix(srow, X2ATDDATE_COL) = Dtoc(mAtdDate)
                Mfgrd2.TextMatrix(srow, X2WDAYNAME_COL) = WeekdayName(Weekday(mAtdDate))
                Mfgrd2.TextMatrix(srow, X2EMPNAME_COL) = clsEMP.mAhName_str
                Mfgrd2.TextMatrix(srow, X2DSGNAME_COL) = clsDSG.mName_str
                Mfgrd2.TextMatrix(srow, X2DPTNAME_COL) = clsDPT.mName_str
                Mfgrd2.TextMatrix(srow, X2SFTNAME_COL) = GetMidPosStr(cATNDSFT_LIST, cATNDSFT_DAY, ",")
                Mfgrd2.TextMatrix(srow, X2TIMESTR_COL) = MinToTime(0)
                Mfgrd2.TextMatrix(srow, X2STATUSNAME_COL) = GetMidPosStr(cATNDSTAT_LIST, cATNDSTAT_ABSENT, ",")
                Mfgrd2.TextMatrix(srow, X2SAVESTATUS_COL) = ""
                Mfgrd2.TextMatrix(srow, X2ATDCODE_COL) = ""
                Mfgrd2.TextMatrix(srow, X2ATDSNO_COL) = ""
                Mfgrd2.TextMatrix(srow, X2ATDEMPCODE_COL) = .Fields("EmpCode")
                Mfgrd2.TextMatrix(srow, X2ATDDSGCODE_COL) = .Fields("EmpDsgCode")
                Mfgrd2.TextMatrix(srow, X2ATDDPTCODE_COL) = .Fields("EmpDptCode")
                Mfgrd2.TextMatrix(srow, X2ATDSFTCODE_COL) = cATNDSFT_DAY
                Mfgrd2.TextMatrix(srow, X2ATDTIME_COL) = ""
                Mfgrd2.TextMatrix(srow, X2ATDSTATUS_COL) = cATNDSTAT_ABSENT
                Mfgrd2.TextMatrix(srow, X2ATDRECSTATE_COL) = cREC_NEW
                
                ShowFlexRowColor Mfgrd2, Mfgrd2, srow
                
                srow = srow + 1
                If Mfgrd2.Rows < srow + 1 Then
                    Mfgrd2.Rows = Mfgrd2.Rows + 1
                End If
                .MoveNext
            Loop
            .Close
        Next mAtdDate
        
    ElseIf cmbSortingOrder.ListIndex = cLIST_EMPWISE Then
        .Open "Select * from EmpMast left join AchdMast on EmpMast.EmpCode=AchdMast.AhCode" _
            & " where EmpJobState=" & CStr(cATNDJSTAT_CONTINUED) _
            & IIf(Val(fcmbEmpName.BoundText) > 0, " and EmpCode=" & CStr(Val(fcmbEmpName.BoundText)), "") _
            & IIf(Val(fcmbDsgName.BoundText) > 0, " and EmpDsgCode=" & CStr(Val(fcmbDsgName.BoundText)), "") _
            & IIf(Val(fcmbDptName.BoundText) > 0, " and EmpDptCode=" & CStr(Val(fcmbDptName.BoundText)), "") _
            & " order by AhName", dbComDatabase, adOpenKeyset, adLockOptimistic
        Do While .EOF = False
            For mAtdDate = mAtdDate1 To mAtdDate2
                If .Fields("EmpJoinDate") <= mAtdDate Then
                    clsEMP.GetData .Fields("EmpCode")
                    clsDSG.GetData .Fields("EmpDsgCode")
                    clsDPT.GetData .Fields("EmpDptCode")
                    
                    Mfgrd2.TextMatrix(srow, X2ATDICODE_COL) = ""
                    Mfgrd2.TextMatrix(srow, X2ATDDATE_COL) = Dtoc(mAtdDate)
                    Mfgrd2.TextMatrix(srow, X2WDAYNAME_COL) = WeekdayName(Weekday(mAtdDate))
                    Mfgrd2.TextMatrix(srow, X2EMPNAME_COL) = clsEMP.mAhName_str
                    Mfgrd2.TextMatrix(srow, X2DSGNAME_COL) = clsDSG.mName_str
                    Mfgrd2.TextMatrix(srow, X2DPTNAME_COL) = clsDPT.mName_str
                    Mfgrd2.TextMatrix(srow, X2SFTNAME_COL) = GetMidPosStr(cATNDSFT_LIST, cATNDSFT_DAY, ",")
                    Mfgrd2.TextMatrix(srow, X2TIMESTR_COL) = MinToTime(0)
                    Mfgrd2.TextMatrix(srow, X2STATUSNAME_COL) = GetMidPosStr(cATNDSTAT_LIST, cATNDSTAT_ABSENT, ",")
                    Mfgrd2.TextMatrix(srow, X2SAVESTATUS_COL) = ""
                    Mfgrd2.TextMatrix(srow, X2ATDCODE_COL) = ""
                    Mfgrd2.TextMatrix(srow, X2ATDSNO_COL) = ""
                    Mfgrd2.TextMatrix(srow, X2ATDEMPCODE_COL) = .Fields("EmpCode")
                    Mfgrd2.TextMatrix(srow, X2ATDDSGCODE_COL) = .Fields("EmpDsgCode")
                    Mfgrd2.TextMatrix(srow, X2ATDDPTCODE_COL) = .Fields("EmpDptCode")
                    Mfgrd2.TextMatrix(srow, X2ATDSFTCODE_COL) = cATNDSFT_DAY
                    Mfgrd2.TextMatrix(srow, X2ATDTIME_COL) = ""
                    Mfgrd2.TextMatrix(srow, X2ATDSTATUS_COL) = cATNDSTAT_ABSENT
                    Mfgrd2.TextMatrix(srow, X2ATDRECSTATE_COL) = cREC_NEW
                    
                    ShowFlexRowColor Mfgrd2, Mfgrd2, srow
                    
                    srow = srow + 1
                    If Mfgrd2.Rows < srow + 1 Then
                        Mfgrd2.Rows = Mfgrd2.Rows + 1
                    End If
                End If
            Next mAtdDate
            
            .MoveNext
        Loop
    End If
    Set tRecset = Nothing
End If
End With
Screen.MousePointer = vbDefault

ClearFlexRow Mfgrd2, srow
Mfgrd2.Rows = srow + 1
ShowFlexRowColor Mfgrd2, Mfgrd2, srow   ' flexnewrow to be uncoloured in case generating small list from large list
Mfgrd2.Row = Mfgrd2.FixedRows

Mfgrd2.SetFocus

End Sub

Private Sub dtpAtdDate_GotFocus()
FlashActiveControl dtpAtdDate, True
End Sub

Private Sub dtpAtdDate_LostFocus()
FlashActiveControl dtpAtdDate, False
End Sub

Private Sub dtpAtdDate_Validate(Cancel As Boolean)
dtpAtdDate.Text = ToMyDate(dtpAtdDate.Text)
If IsFinYrDate(Ctod(dtpAtdDate.Text)) = False Then
    ErrorBox "Invalid Date !!!"
    dtpAtdDate.SetFocus
    FlashActiveControl dtpAtdDate, True
    Cancel = True
End If
Call ValidDtl

End Sub

Private Sub dtpAtdDate1_Change()
mAtdDate1_changed = True
End Sub

Private Sub dtpAtdDate1_GotFocus()
FlashActiveControl dtpAtdDate1, True
mAtdDate1_changed = False
End Sub

Private Sub dtpAtdDate1_LostFocus()
FlashActiveControl dtpAtdDate1, False

End Sub

Private Sub dtpAtdDate1_Validate(Cancel As Boolean)
dtpAtdDate1.Text = ToMyDate(dtpAtdDate1.Text)
If IsFinYrDate(Ctod(dtpAtdDate1.Text)) = False Then
    ErrorBox "Invalid Date !!!"
    dtpAtdDate1.SetFocus
    FlashActiveControl dtpAtdDate1, True
    Cancel = True
Else
    If mAtdDate1_changed = True Then
        dtpAtdDate2.Text = dtpAtdDate1.Text
    End If
End If

End Sub

Private Sub dtpAtdDate2_GotFocus()
FlashActiveControl dtpAtdDate2, True
End Sub

Private Sub dtpAtdDate2_LostFocus()
FlashActiveControl dtpAtdDate2, False
End Sub

Private Sub dtpAtdDate2_Validate(Cancel As Boolean)
dtpAtdDate2.Text = ToMyDate(dtpAtdDate2.Text)
If IsFinYrDate(Ctod(dtpAtdDate2.Text)) = False Then
    ErrorBox "Invalid Date !!!"
    dtpAtdDate2.SetFocus
    FlashActiveControl dtpAtdDate2, True
    Cancel = True
Else
    If Ctod(dtpAtdDate1.Text) > Ctod(dtpAtdDate2.Text) Then
        dtpAtdDate1.Text = dtpAtdDate2.Text
    End If
End If

End Sub

Private Sub Form_Activate()
If mFormLoaded = False Then
    SetFormSize Me, frmMain
    dtpAtdDate1.Text = Dtoc(DefaultEntryDate)
    dtpAtdDate2.Text = Dtoc(DefaultEntryDate)
    dtpAtdDate1.SetFocus
Else

End If

mFormLoaded = True
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
mLastKeyPressed = KeyCode
Select Case KeyCode
Case 13:
Case 27:
End Select

End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
mLastKeyPressed = KeyAscii

End Sub

Private Sub Form_Load()
Dim colcnt As Integer
mFormLoaded = False
mEntrySaved = False: mEntryAborted = False
Call Form_Resize

Call SetVoidControl(txtVoid)
cmbStatusName.Enabled = False
txtWDayName.Enabled = False

OpenAcDataSource dbAcDatabase
OpenPyrDataSource dbPyrDatabase
OpenComDataSource dbComDatabase

cmbSortingOrder.Clear
cmbSortingOrder.AddItem "Date wise"
cmbSortingOrder.AddItem "Employee wise"
cmbSortingOrder.ListIndex = 0

cmbSftName.Clear
cmbSftName.AddItem "Day" & Space(50) & "_" & CStr(cATNDSFT_DAY)
cmbSftName.AddItem "Night" & Space(50) & "_" & CStr(cATNDSFT_NIGHT)

cmbStatusName.Clear
cmbStatusName.AddItem "Absent" & Space(50) & "_" & CStr(cATNDSTAT_ABSENT)
cmbStatusName.AddItem "Present" & Space(50) & "_" & CStr(cATNDSTAT_PRESENT)
cmbStatusName.AddItem "Weekly Off" & Space(50) & "_" & CStr(cATNDSTAT_WEEKLYOFF)
cmbStatusName.AddItem "Holiday" & Space(50) & "_" & CStr(cATNDSTAT_HOLIDAY)
cmbStatusName.AddItem "Leave" & Space(50) & "_" & CStr(cATNDSTAT_LEAVE)
cmbStatusName.AddItem "Half Day" & Space(50) & "_" & CStr(cATNDSTAT_HALFDAY)

Set clsATD = New clsPayrollTranEntry
Set clsATD.dbPyrDatabase = dbPyrDatabase
Set clsATD.dbAcDatabase = dbAcDatabase
clsATD.TranName = "Attendance"

Set clsEMP = New clsPayrollMasterEntry
Set clsEMP.dbPyrDatabase = dbPyrDatabase
Set clsEMP.dbAcDatabase = dbAcDatabase
clsEMP.blnEmployeeMast = True
clsEMP.Init

Set clsDSG = New clsPayrollMasterEntry
Set clsDSG.dbPyrDatabase = dbPyrDatabase
clsDSG.blnDesignationMast = True
clsDSG.Init

Set clsDPT = New clsPayrollMasterEntry
Set clsDPT.dbPyrDatabase = dbPyrDatabase
clsDPT.blnDepartmentMast = True
clsDPT.Init

Set fcmbEmpName = New frmFlexSearchList
Set fcmbEmpName.dbAcDatabase = dbAcDatabase
Set fcmbEmpName.dbComDatabase = dbComDatabase
Set fcmbEmpName.frmAccessMaster = New frmEmployeeMast
fcmbEmpName.EmpMastList = True
Load fcmbEmpName

Set fcmbDsgName = New frmFlexSearchList
Set fcmbDsgName.dbPyrDatabase = dbPyrDatabase
Set fcmbDsgName.frmAccessMaster = New frmDesignationMast
fcmbDsgName.mDesgMastList = True
Load fcmbDsgName

Set fcmbDptName = New frmFlexSearchList
Set fcmbDptName.dbPyrDatabase = dbPyrDatabase
Set fcmbDptName.frmAccessMaster = New frmDepartmentMast
fcmbDptName.mDeptMastList = True
Load fcmbDptName

Rem column definitions
Mfgrd2.Rows = 2: Mfgrd2.FixedRows = 1: Mfgrd2.Cols = MFGRD2_COLS: Mfgrd2.FixedCols = 0: Mfgrd2.Height = (Mfgrd2.RowHeightMin * Int(Mfgrd2.Height / Mfgrd2.RowHeightMin))
colcnt = X2ATDICODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2ATDICODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2ATDDATE_COL: Mfgrd2.ColWidth(colcnt) = dtpAtdDate.Width: Mfgrd2.TextMatrix(0, colcnt) = "Date": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2WDAYNAME_COL: Mfgrd2.ColWidth(colcnt) = txtWDayName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Day": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2EMPNAME_COL: Mfgrd2.ColWidth(colcnt) = txtEmpName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Employee Name": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2DSGNAME_COL: Mfgrd2.ColWidth(colcnt) = txtDsgName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Designation": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2DPTNAME_COL: Mfgrd2.ColWidth(colcnt) = txtDptName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Department": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2SFTNAME_COL: Mfgrd2.ColWidth(colcnt) = cmbSftName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Shift": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2TIMESTR_COL: Mfgrd2.ColWidth(colcnt) = txtTimeStr.Width: Mfgrd2.TextMatrix(0, colcnt) = "Time": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2STATUSNAME_COL: Mfgrd2.ColWidth(colcnt) = cmbStatusName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Status": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2SAVESTATUS_COL: Mfgrd2.ColWidth(colcnt) = txtSaveStatus.Width: Mfgrd2.TextMatrix(0, colcnt) = "*": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2ATDCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2ATDCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2ATDSNO_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2ATDSNO_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2ATDEMPCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2ATDEMPCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2ATDDSGCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2ATDDSGCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2ATDDPTCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2ATDDPTCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2ATDSFTCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2ATDSFTCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2ATDTIME_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2ATDTIME_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2ATDSTATUS_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2ATDSTATUS_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2ATDRECSTATE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2ATDRECSTATE_COL": Mfgrd2.ColAlignment(colcnt) = 1

Rem control left positions
colcnt = X2ATDDATE_COL: dtpAtdDate.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2WDAYNAME_COL: txtWDayName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2EMPNAME_COL: txtEmpName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2DSGNAME_COL: txtDsgName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2DPTNAME_COL: txtDptName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2SFTNAME_COL: cmbSftName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2TIMESTR_COL: txtTimeStr.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2STATUSNAME_COL: cmbStatusName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2SAVESTATUS_COL: txtSaveStatus.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
cmdOK.Left = cmbStatusName.Left + cmbStatusName.Width

VisibleControls False

End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
mLastKeyPressed = 0
End Sub

Private Sub Form_Resize()
lblFormHeading.Width = Me.Width
cmdFormEscape.Left = Me.Width - (cmdFormEscape.Width * 2)
cmdFormEnter.Left = Me.Width + cmdFormEscape.Width

End Sub

Private Sub Form_Unload(Cancel As Integer)
Set clsATD = Nothing
Set clsEMP = Nothing
Set clsDSG = Nothing
Set clsDPT = Nothing
Unload fcmbEmpName
Unload fcmbDsgName
Unload fcmbDptName
Set fcmbEmpName = Nothing
Set fcmbDsgName = Nothing
Set fcmbDptName = Nothing

CloseDataSource dbAcDatabase
CloseDataSource dbPyrDatabase
CloseDataSource dbComDatabase

End Sub

Private Sub Mfgrd2_DblClick()
Call Mfgrd2_KeyPress(13)
End Sub

Private Sub Mfgrd2_GotFocus()
Mfgrd2.Col = FlexLeftVisibleCol(Mfgrd2)
Mfgrd2.LeftCol = Mfgrd2.Col
If Mfgrd2.SelectionMode = flexSelectionByRow Then
    Mfgrd2.ColSel = 0: Mfgrd2.ColSel = Mfgrd2.Cols - 1
End If
ShowActiveFlexRow Mfgrd2
'Call Mfgrd2_RowColChange

End Sub

Private Sub Mfgrd2_KeyDown(KeyCode As Integer, Shift As Integer)
If Shift = 0 Then
    If InList(KeyCode, Array(vbKeyDelete, vbKeySubtract)) Then
        Call Data_DeleteEvent
    End If
End If

End Sub

Private Sub Data_DeleteEvent()
Dim srow As Long, mDeleteit As Boolean, mAtdCode As Long
srow = Mfgrd2.Row
mAtdCode = Val(Mfgrd2.TextMatrix(srow, X2ATDCODE_COL))

If Mfgrd2.Row = FlexNewRow(Mfgrd2) Or mAtdCode = 0 Then
    GoTo EndSub
End If

mDeleteit = True

If mDeleteit = True Then
    mDeleteit = CanDelete()
End If
If mDeleteit = True Then
    If clsATD.BeginTran(mAtdCode) = True Then
        clsATD.DeleteTran mAtdCode
        clsATD.CommitTran mAtdCode
        clsATD.EndTran mAtdCode
        
        RemoveFlexRow Mfgrd2, srow
        ShowFlexRowColor Mfgrd2, Mfgrd2, srow
        Call RefreshFlexRowColor
    End If
    Mfgrd2.Row = srow
    Mfgrd2.SetFocus
Else
    Mfgrd2.SetFocus
End If

EndSub:
Exit Sub

End Sub

Rem fill all flex rows due to reset in rows specially after row deletion
Private Sub RefreshFlexRowColor()
Dim srow As Long
For srow = Mfgrd2.FixedRows To Mfgrd2.Rows - 1
    ShowFlexRowColor Mfgrd2, Mfgrd2, srow
Next srow

End Sub

Private Sub Mfgrd2_KeyPress(KeyAscii As Integer)
Dim srow As Long, mAtdCode As Long

If KeyAscii = vbKeyReturn Then
    srow = Mfgrd2.Row
    mAtdCode = Val(Mfgrd2.TextMatrix(srow, X2ATDCODE_COL))
    
    dtlAddEditMode = True
    dtlAddMode = (mAtdCode = 0)
    VisibleControls True, Mfgrd2.Top + Mfgrd2.RowPos(srow)
    If dtlAddMode = True Then
        If clsATD.BeginTran(0) = False Then
            GoTo EndSub
        End If
        mAtdCode = clsATD.ActiveTrnCode
        
        If IsFlexNewRow(Mfgrd2, srow) = True Then
            Call ChkDefaultValues
        Else
            dtpAtdDate.Text = Mfgrd2.TextMatrix(srow, X2ATDDATE_COL)
            txtWDayName.Text = Mfgrd2.TextMatrix(srow, X2WDAYNAME_COL)
            fcmbEmpName.BoundText = Mfgrd2.TextMatrix(srow, X2ATDEMPCODE_COL): txtEmpName.Text = fcmbEmpName.Text
            fcmbDsgName.BoundText = Mfgrd2.TextMatrix(srow, X2ATDDSGCODE_COL): txtDsgName.Text = fcmbDsgName.Text
            fcmbDptName.BoundText = Mfgrd2.TextMatrix(srow, X2ATDDPTCODE_COL): txtDptName.Text = fcmbDptName.Text
            cmbSftName.ListIndex = Val(Mfgrd2.TextMatrix(srow, X2ATDSFTCODE_COL)) - 1
            txtTimeStr.Text = Mfgrd2.TextMatrix(srow, X2TIMESTR_COL)
            cmbStatusName.ListIndex = Val(Mfgrd2.TextMatrix(srow, X2ATDSTATUS_COL)) - 1
            txtSaveStatus.Text = Mfgrd2.TextMatrix(srow, X2SAVESTATUS_COL)
        End If
        FormAddEditMode = cFORM_ADDMODE
    Else
        If clsATD.BeginTran(mAtdCode) = False Then
            GoTo EndSub
        End If
        
        dtpAtdDate.Text = Mfgrd2.TextMatrix(srow, X2ATDDATE_COL)
        txtWDayName.Text = Mfgrd2.TextMatrix(srow, X2WDAYNAME_COL)
        fcmbEmpName.BoundText = Mfgrd2.TextMatrix(srow, X2ATDEMPCODE_COL): txtEmpName.Text = fcmbEmpName.Text
        fcmbDsgName.BoundText = Mfgrd2.TextMatrix(srow, X2ATDDSGCODE_COL): txtDsgName.Text = fcmbDsgName.Text
        fcmbDptName.BoundText = Mfgrd2.TextMatrix(srow, X2ATDDPTCODE_COL): txtDptName.Text = fcmbDptName.Text
        cmbSftName.ListIndex = Val(Mfgrd2.TextMatrix(srow, X2ATDSFTCODE_COL)) - 1
        txtTimeStr.Text = Mfgrd2.TextMatrix(srow, X2TIMESTR_COL)
        cmbStatusName.ListIndex = Val(Mfgrd2.TextMatrix(srow, X2ATDSTATUS_COL)) - 1
        txtSaveStatus.Text = Mfgrd2.TextMatrix(srow, X2SAVESTATUS_COL)
        
        FormAddEditMode = cFORM_EDITMODE
    End If
    Mfgrd2.Col = FlexLeftVisibleCol(Mfgrd2)
    Mfgrd2.LeftCol = Mfgrd2.Col
    
    mAtdDate_old = Ctod(dtpAtdDate.Text)
    mAtdEmpCode_old = Val(fcmbEmpName.BoundText)
    mAtdDsgCode_old = Val(fcmbDsgName.BoundText)
    mAtdDptCode_old = Val(fcmbDptName.BoundText)
    mAtdTime_old = TimeToMin(txtTimeStr.Text)
    
    dtpAtdDate.SetFocus
    Call ValidDtl
End If
Exit Sub

EndSub:
VisibleControls False
dtlAddMode = False
dtlAddEditMode = False
FormAddEditMode = cFORM_SMRYMODE
Exit Sub

End Sub

Private Sub VisibleControls(ByVal mShowItem As Boolean, Optional ByVal mRowPos)
If Me.Visible = True Then
    txtVoid.SetFocus
End If
If IsMissing(mRowPos) = False Then
    dtpAtdDate.Top = mRowPos
    txtWDayName.Top = mRowPos
    txtEmpName.Top = mRowPos
    txtDsgName.Top = mRowPos
    txtDptName.Top = mRowPos
    cmbSftName.Top = mRowPos
    txtTimeStr.Top = mRowPos
    cmbStatusName.Top = mRowPos
    txtSaveStatus.Top = mRowPos
    cmdOK.Top = mRowPos
End If

dtpAtdDate.Text = Dtoc(DefaultEntryDate)
txtWDayName.Text = ""
txtEmpName.Text = "": fcmbEmpName.BoundText = ""
txtDsgName.Text = "": fcmbDsgName.BoundText = ""
txtDptName.Text = "": fcmbDptName.BoundText = ""
cmbSftName.ListIndex = -1
txtTimeStr.Text = MinToTime(0)
cmbStatusName.ListIndex = -1
txtSaveStatus.Text = ""

Call ValidDtl

dtpAtdDate.Visible = mShowItem
txtWDayName.Visible = mShowItem
txtEmpName.Visible = mShowItem
txtDsgName.Visible = mShowItem
txtDptName.Visible = mShowItem
cmbSftName.Visible = mShowItem
txtTimeStr.Visible = mShowItem
cmbStatusName.Visible = mShowItem
txtSaveStatus.Visible = mShowItem
cmdOK.Visible = mShowItem

Rem list of header and grid controls are common so resetting it to header values after addition/editing ends
If mShowItem = False Then
    fcmbEmpName.Text = txtEmpName1.Text: txtEmpName1.Text = fcmbEmpName.Text
    fcmbDsgName.Text = txtDsgName1.Text: txtDsgName1.Text = fcmbDsgName.Text
    fcmbDptName.Text = txtDptName1.Text: txtDptName1.Text = fcmbDptName.Text
End If

frHeader.Enabled = (mShowItem = False)
Mfgrd2.Enabled = (mShowItem = False)
If mShowItem = False Then
    FormAddEditMode = cFORM_SMRYMODE
End If

End Sub

Private Sub ValidDtl()
Dim mDataOk As Boolean
mDataOk = (IsFinYrDate(Ctod(dtpAtdDate.Text)) = True And Val(fcmbEmpName.BoundText) > 0 And Val(fcmbDsgName.BoundText) > 0 And Val(fcmbDptName.BoundText) > 0 And cmbSftName.ListIndex > -1 And cmbStatusName.ListIndex > -1)
If InterActiveChange(cmdOK) = True Then
    If mDataOk = True Then
        mDataOk = (ChkDuplicateAtndFound() = False)
    End If
    If mDataOk = True Then
        mDataOk = (ChkJoinDateOk() = True)
    End If
End If
If mDataOk = True Then
    Call ChkAtdState
End If

cmdOK.Caption = IIf(mDataOk = True, "&OK", "&Cancel")
cmdOK.BackColor = IIf(mDataOk = True, &H80FF80, &H8080FF)
End Sub

Private Sub txtDsgName_Change()
If fcmbDsgName.CallFromText_Change = False Then
    fcmbDsgName.CallFromText_Change = True
    If InterActiveChange(txtDsgName) = True And dtlAddEditMode = True Then
        fcmbDsgName.UserText = Array(txtDsgName.Text, txtDsgName.SelStart)
        fcmbDsgName.Show 1
        txtDsgName.Text = fcmbDsgName.Text
    End If
    fcmbDsgName.CallFromText_Change = False
End If

End Sub

Private Sub txtDsgName_GotFocus()
FlashActiveControl txtDsgName, True
End Sub

Private Sub txtDsgName_LostFocus()
FlashActiveControl txtDsgName, False
End Sub

Private Sub txtDsgName_Validate(Cancel As Boolean)
If Val(fcmbDsgName.BoundText) <= 0 Then
    ErrorBox "Invalid Designation Selection !!!"
    txtDsgName.SetFocus
    Cancel = True
End If
Call ValidDtl

End Sub

Private Sub txtDsgName1_Change()
If fcmbDsgName.CallFromText_Change = False Then
    fcmbDsgName.CallFromText_Change = True
    If InterActiveChange(txtDsgName1) = True Then
        fcmbDsgName.UserText = Array(txtDsgName1.Text, txtDsgName1.SelStart)
        fcmbDsgName.Show 1
        txtDsgName1.Text = fcmbDsgName.Text
    End If
    fcmbDsgName.CallFromText_Change = False
End If

End Sub

Private Sub txtDsgName1_GotFocus()
FlashActiveControl txtDsgName1, True

End Sub

Private Sub txtDsgName1_LostFocus()
FlashActiveControl txtDsgName1, False

End Sub

Private Sub txtDptName_Change()
If fcmbDptName.CallFromText_Change = False Then
    fcmbDptName.CallFromText_Change = True
    If InterActiveChange(txtDptName) = True Then
        fcmbDptName.UserText = Array(txtDptName.Text, txtDptName.SelStart)
        fcmbDptName.Show 1
        txtDptName.Text = fcmbDptName.Text
    End If
    fcmbDptName.CallFromText_Change = False
End If

End Sub

Private Sub txtDptName_GotFocus()
FlashActiveControl txtDptName, True
End Sub

Private Sub txtDptName_LostFocus()
FlashActiveControl txtDptName, False
End Sub

Private Sub txtDptName_Validate(Cancel As Boolean)
If Val(fcmbDptName.BoundText) <= 0 Then
    ErrorBox "Invalid Department Selection !!!"
    txtDptName.SetFocus
    Cancel = True
End If
Call ValidDtl

End Sub

Private Sub txtDptName1_Change()
If fcmbDptName.CallFromText_Change = False Then
    fcmbDptName.CallFromText_Change = True
    If InterActiveChange(txtDptName1) = True Then
        fcmbDptName.UserText = Array(txtDptName1.Text, txtDptName1.SelStart)
        fcmbDptName.Show 1
        txtDptName1.Text = fcmbDptName.Text
    End If
    fcmbDptName.CallFromText_Change = False
End If

End Sub

Private Sub txtDptName1_GotFocus()
FlashActiveControl txtDptName1, True
End Sub

Private Sub txtDptName1_LostFocus()
FlashActiveControl txtDptName1, False
End Sub

Private Sub txtEmpName_Change()
If fcmbEmpName.CallFromText_Change = False Then
    fcmbEmpName.CallFromText_Change = True
    If InterActiveChange(txtEmpName) = True Then
        fcmbEmpName.UserText = Array(txtEmpName.Text, txtEmpName.SelStart)
        fcmbEmpName.Show 1
        txtEmpName.Text = fcmbEmpName.Text
    End If
    fcmbEmpName.CallFromText_Change = False
End If

End Sub

Private Sub txtEmpName_GotFocus()
FlashActiveControl txtEmpName, True
End Sub

Private Sub txtEmpName_LostFocus()
FlashActiveControl txtEmpName, False

End Sub

Private Sub txtEmpName_Validate(Cancel As Boolean)
Dim mEmpCode As Long, mDptCode As Long, mDsgCode As Long, mDate As Date

mEmpCode = Val(fcmbEmpName.BoundText)
mDate = Ctod(dtpAtdDate.Text)

If mEmpCode <= 0 Then
    ErrorBox "Invalid Employee Selection !!!"
    txtEmpName.SetFocus
    Cancel = True
Else
    If dtlAddMode = True Or mAtdEmpCode_old <> mEmpCode Then
        clsEMP.GetData mEmpCode
        
        fcmbDptName.BoundText = CStr(clsEMP.mEmpDptCode_lng): txtDptName.Text = fcmbDptName.Text
        fcmbDsgName.BoundText = CStr(clsEMP.mEmpDsgCode_lng): txtDsgName.Text = fcmbDsgName.Text
        
        mDptCode = Val(fcmbDptName.BoundText)
        mDsgCode = Val(fcmbDsgName.BoundText)
        
        If IsHoliday(mDate, mEmpCode, mDptCode, mDsgCode) = False And IsWeeklyOff(mDate, mEmpCode) = False Then
            txtTimeStr.Text = clsEMP.mEmpWrkTime_str
        End If
        cmbSftName.ListIndex = clsEMP.mEmpSftCode_int - 1
        'Call ChkAtdState   called in validdtl also
    End If
End If
Call ValidDtl

End Sub

Private Sub txtEmpName1_Change()
If fcmbEmpName.CallFromText_Change = False Then
    fcmbEmpName.CallFromText_Change = True
    If InterActiveChange(txtEmpName1) = True Then
        fcmbEmpName.UserText = Array(txtEmpName1.Text, txtEmpName1.SelStart)
        fcmbEmpName.Show 1
        txtEmpName1.Text = fcmbEmpName.Text
    End If
    fcmbEmpName.CallFromText_Change = False
End If

End Sub

Private Sub txtEmpName1_GotFocus()
FlashActiveControl txtEmpName1, True
End Sub

Private Sub txtEmpName1_LostFocus()
FlashActiveControl txtEmpName1, False
End Sub

Private Sub ChkDefaultValues()
Dim srow As Long
srow = Mfgrd2.Row - 1
If srow > FlexHeadingRow(Mfgrd2) Then
    dtpAtdDate.Text = Mfgrd2.TextMatrix(srow, X2ATDDATE_COL)
    txtWDayName.Text = Mfgrd2.TextMatrix(srow, X2WDAYNAME_COL)
    fcmbEmpName.BoundText = Mfgrd2.TextMatrix(srow, X2ATDEMPCODE_COL): txtEmpName.Text = fcmbEmpName.Text
    fcmbDsgName.BoundText = Mfgrd2.TextMatrix(srow, X2ATDDSGCODE_COL): txtDsgName.Text = fcmbDsgName.Text
    fcmbDptName.BoundText = Mfgrd2.TextMatrix(srow, X2ATDDPTCODE_COL): txtDptName.Text = fcmbDptName.Text
    cmbSftName.ListIndex = Val(Mfgrd2.TextMatrix(srow, X2ATDSFTCODE_COL)) - 1
    txtTimeStr.Text = Mfgrd2.TextMatrix(srow, X2TIMESTR_COL)
    cmbStatusName.ListIndex = Val(Mfgrd2.TextMatrix(srow, X2ATDSTATUS_COL)) - 1
    txtSaveStatus.Text = ""
Else
    dtpAtdDate.Text = dtpAtdDate1.Text
    txtWDayName.Text = WeekdayName(Weekday(Ctod(dtpAtdDate1.Text)))
    fcmbEmpName.Text = txtEmpName1.Text: txtEmpName.Text = fcmbEmpName.Text
    fcmbDsgName.Text = txtDsgName1.Text: txtDsgName.Text = fcmbDsgName.Text
    fcmbDptName.Text = txtDptName1.Text: txtDptName.Text = fcmbDptName.Text
    cmbSftName.ListIndex = 0
    txtTimeStr.Text = MinToTime(0)
    cmbStatusName.ListIndex = 0
    txtSaveStatus.Text = ""
End If

End Sub

Private Sub txtTimeStr_GotFocus()
FlashActiveControl txtTimeStr, True
End Sub

Private Sub txtTimeStr_LostFocus()
FlashActiveControl txtTimeStr, False
End Sub

Private Sub txtTimeStr_Validate(Cancel As Boolean)
txtTimeStr.Text = MinToTime(TimeToMin(txtTimeStr.Text))
If TimeToMin(txtTimeStr.Text) < 0 Then
    ErrorBox "Invalid Working Time !!!"
    txtTimeStr.SetFocus
    Cancel = True
End If
Call ValidDtl

End Sub

Private Function ChkDuplicateAtndFound() As Boolean
Dim tRecset As New ADODB.Recordset, mRtnval As Boolean, srow As Long, mAtdICode As Long
mRtnval = False
srow = Mfgrd2.Row
mAtdICode = Val(Mfgrd2.TextMatrix(srow, X2ATDICODE_COL))

With tRecset
.Open "Select * from Attendance where AtdEmpCode=" & CStr(Val(fcmbEmpName.BoundText)) & " and AtdDate=#" & CStr(ToSysDate(Ctod(dtpAtdDate.Text))) & "# and AtdICode<>" & CStr(mAtdICode) & "", dbPyrDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    AlertBox "Duplicate Entry !!!"
    mRtnval = True
Else
    mRtnval = False
End If
End With
CloseTable tRecset

ChkDuplicateAtndFound = mRtnval

End Function

Private Function ChkJoinDateOk() As Boolean
Dim tRecset As New ADODB.Recordset, mRtnval As Boolean
mRtnval = False

With tRecset
.Open "Select * from EmpMast where EmpCode=" & CStr(Val(fcmbEmpName.BoundText)), dbPyrDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    If .Fields("EmpJoinDate") > Ctod(dtpAtdDate.Text) Then
        AlertBox "Employee Joined on " & Dtoc(.Fields("EmpJoinDate")) & " !!!"
        mRtnval = False
    Else
        mRtnval = True
    End If
End If
End With
CloseTable tRecset

ChkJoinDateOk = mRtnval

End Function

Private Sub ChkAtdState()
Dim mDate As Date, mEmpCode As Long, mDptCode As Long, mDsgCode As Long, mWorkedTime As Long

mEmpCode = Val(fcmbEmpName.BoundText)
mDptCode = Val(fcmbDptName.BoundText)
mDsgCode = Val(fcmbDsgName.BoundText)
mDate = Ctod(dtpAtdDate.Text)
mWorkedTime = TimeToMin(txtTimeStr.Text)

clsEMP.GetData mEmpCode

If IsHoliday(mDate, mEmpCode, mDptCode, mDsgCode) = True Then
    cmbStatusName.ListIndex = cATNDSTAT_HOLIDAY - 1
ElseIf IsWeeklyOff(mDate, mEmpCode) Then
    cmbStatusName.ListIndex = cATNDSTAT_WEEKLYOFF - 1
ElseIf IsLeaveAllowed(mDate, mEmpCode) = True And mWorkedTime < clsEMP.mEmpMinWrkTime_lng Then
    cmbStatusName.ListIndex = cATNDSTAT_LEAVE - 1
ElseIf mWorkedTime > clsEMP.mEmpHalfDayTime_lng And mWorkedTime >= clsEMP.mEmpMinWrkTime_lng Then
    cmbStatusName.ListIndex = cATNDSTAT_PRESENT - 1
ElseIf Between(mWorkedTime, clsEMP.mEmpMinWrkTime_lng, clsEMP.mEmpHalfDayTime_lng) = True Then
    cmbStatusName.ListIndex = cATNDSTAT_HALFDAY - 1
Else
    cmbStatusName.ListIndex = cATNDSTAT_ABSENT - 1
End If

End Sub

Private Function IsHoliday(ByVal mDate As Date, ByVal mEmpCode As Long, ByVal mDptCode As Long, ByVal mDsgCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset, mRtnval As Boolean

mRtnval = False
With tRecset
.Open "Select * from HoliGrant where HlgDate=#" & CStr(ToSysDate(mDate)) & "#", dbPyrDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    mRtnval = True
    Do While .EOF = False
''        If mRtnval = True Then
''            If .Fields("HlgEmpCode") = mEmpCode And (.Fields("HlgDptCode") = mDptCode Or .Fields("HlgDptCode") = 0) And (.Fields("HlgDsgCode") = mDsgCode Or .Fields("HlgDsgCode") = 0) And .Fields("HlgAlwState") = cATNDHSTAT_DISALLOWED Then
''                mRtnval = False
''            End If
''        End If
''        If mRtnval = True Then
''            If .Fields("HlgDptCode") = mDptCode And (.Fields("HlgDsgCode") = mDsgCode Or .Fields("HlgDsgCode") = 0) And .Fields("HlgAlwState") = cATNDHSTAT_DISALLOWED Then
''                mRtnval = False
''            End If
''        End If
''        If mRtnval = True Then
''            If .Fields("HlgDsgCode") = mDsgCode And .Fields("HlgAlwState") = cATNDHSTAT_DISALLOWED Then
''                mRtnval = False
''            End If
''        End If
        If mRtnval = True Then
            If (.Fields("HlgEmpCode") = mEmpCode Or .Fields("HlgEmpCode") = 0) And (.Fields("HlgDptCode") = mDptCode Or .Fields("HlgDptCode") = 0) And (.Fields("HlgDsgCode") = mDsgCode Or .Fields("HlgDsgCode") = 0) And .Fields("HlgAlwState") = cATNDHSTAT_DISALLOWED Then
                mRtnval = False
            End If
        End If
        If mRtnval = False Then
            Exit Do
        End If
        
        .MoveNext
    Loop
Else
    mRtnval = False
End If
End With
CloseTable tRecset
IsHoliday = mRtnval

End Function

Private Function IsLeaveAllowed(ByVal mDate As Date, ByVal mEmpCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset, mRtnval As Boolean, mAtdICode As Long, srow As Long, mMnLeaveTaken As Double, mEmpMnLeaves As Double

srow = Mfgrd2.Row
mAtdICode = Val(Mfgrd2.TextMatrix(srow, X2ATDICODE_COL))

With tRecset
.Open "Select * from Attendance where AtdDate between #" & CStr(ToSysDate(MonthStartDate(mDate))) & "# and #" & CStr(ToSysDate(MonthEndDate(mDate))) & "# and AtdEmpCode=" & CStr(mEmpCode) & " and AtdStatus=" & CStr(cATNDSTAT_LEAVE) & " and AtdICode<>" & CStr(mAtdICode) & "", dbPyrDatabase, adOpenKeyset, adLockOptimistic
mMnLeaveTaken = .RecordCount + 1
End With
CloseTable tRecset

With tRecset
.Open "Select * from EmpMast where EmpCode=" & CStr(mEmpCode) & "", dbPyrDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    mEmpMnLeaves = .Fields("EmpMnLeaves")
End If
End With
CloseTable tRecset

If mMnLeaveTaken > mEmpMnLeaves Then
    mRtnval = False
Else
    mRtnval = True
End If

IsLeaveAllowed = mRtnval

End Function

Private Function IsWeeklyOff(ByVal mDate As Date, ByVal mEmpCode As Long) As Boolean
Dim tRecset As New ADODB.Recordset, mRtnval As Boolean, mWeeklyOff As Integer

With tRecset
.Open "Select * from EmpMast where EmpCode=" & CStr(mEmpCode) & "", dbPyrDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    mWeeklyOff = .Fields("EmpWeeklyOff")
End If
End With
CloseTable tRecset

mRtnval = (Weekday(mDate) = mWeeklyOff)

IsWeeklyOff = mRtnval

End Function

Private Sub ShowFlexRowColor(ByRef mDataObj As Object, ByRef Mfgrd1 As MSFlexGrid, ByVal srow As Long)

If TypeOf mDataObj Is ADODB.Recordset Then
    Select Case mDataObj.Fields("AtdStatus")
    Case cATNDSTAT_ABSENT
        FillFlexRowColor Mfgrd2, srow, cREDLIGHT
    Case cATNDSTAT_PRESENT, cATNDSTAT_HALFDAY
        FillFlexRowColor Mfgrd2, srow, cGREENLIGHT
    Case cATNDSTAT_HOLIDAY, cATNDSTAT_LEAVE, cATNDSTAT_WEEKLYOFF
        FillFlexRowColor Mfgrd2, srow, cBROWNLIGHT
    Case Else
        FillFlexRowColor Mfgrd2, srow, Mfgrd2.BackColor
    End Select
ElseIf TypeOf mDataObj Is MSFlexGrid Then
    Select Case Val(mDataObj.TextMatrix(srow, X2ATDSTATUS_COL))
    Case cATNDSTAT_ABSENT
        FillFlexRowColor Mfgrd2, srow, cREDLIGHT
    Case cATNDSTAT_PRESENT, cATNDSTAT_HALFDAY
        FillFlexRowColor Mfgrd2, srow, cGREENLIGHT
    Case cATNDSTAT_HOLIDAY, cATNDSTAT_LEAVE, cATNDSTAT_WEEKLYOFF
        FillFlexRowColor Mfgrd2, srow, cBROWNLIGHT
    Case Else
        FillFlexRowColor Mfgrd2, srow, Mfgrd2.BackColor
    End Select
Else
    ErrorBox Me.Name & "_ShowFlexRowColor#1193_[Undefined Case]"
End If

End Sub
