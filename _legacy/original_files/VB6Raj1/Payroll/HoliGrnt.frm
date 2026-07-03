VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmHolidayGrant 
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
   Begin VB.Frame frHeader 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   1455
      Left            =   120
      TabIndex        =   20
      Top             =   840
      Width           =   13815
      Begin VB.ComboBox cmbSortingOrder 
         Appearance      =   0  'Flat
         Height          =   315
         Left            =   6720
         Style           =   2  'Dropdown List
         TabIndex        =   5
         Top             =   960
         Width           =   1575
      End
      Begin VB.TextBox dtpHlgDate2 
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
      Begin VB.TextBox dtpHlgDate1 
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
         TabIndex        =   26
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
         TabIndex        =   25
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
         TabIndex        =   24
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
         TabIndex        =   23
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
         TabIndex        =   22
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
         TabIndex        =   21
         Top             =   240
         Width           =   1575
      End
   End
   Begin VB.TextBox txtVoid 
      CausesValidation=   0   'False
      Height          =   375
      Left            =   120
      TabIndex        =   14
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
      TabIndex        =   19
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
      TabIndex        =   18
      TabStop         =   0   'False
      Top             =   0
      UseMaskColor    =   -1  'True
      Width           =   255
   End
   Begin VB.ComboBox cmbFormEntryMode 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   315
      ItemData        =   "HoliGrnt.frx":0000
      Left            =   0
      List            =   "HoliGrnt.frx":000D
      Style           =   1  'Simple Combo
      TabIndex        =   17
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
      TabIndex        =   16
      Top             =   2280
      Width           =   13815
      Begin VB.TextBox txtHlmName 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   1320
         TabIndex        =   27
         Top             =   1200
         Width           =   2175
      End
      Begin VB.ComboBox cmbAllowState 
         Appearance      =   0  'Flat
         Height          =   315
         Left            =   10440
         Style           =   2  'Dropdown List
         TabIndex        =   12
         Top             =   1200
         Width           =   1575
      End
      Begin VB.TextBox dtpHlgDate 
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
         Left            =   12000
         Style           =   1  'Graphical
         TabIndex        =   13
         Top             =   1200
         Width           =   735
      End
      Begin VB.TextBox txtDptName 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   8640
         TabIndex        =   11
         Top             =   1200
         Width           =   1815
      End
      Begin VB.TextBox txtDsgName 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   6480
         TabIndex        =   10
         Top             =   1200
         Width           =   2175
      End
      Begin VB.TextBox txtEmpName 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   3480
         TabIndex        =   9
         Top             =   1200
         Width           =   3015
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd2 
         Height          =   5775
         Left            =   120
         TabIndex        =   7
         Top             =   240
         Width           =   13215
         _ExtentX        =   23310
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
      Caption         =   "Holiday Grant to Employees/Groups"
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
      TabIndex        =   15
      Top             =   0
      Width           =   9015
   End
End
Attribute VB_Name = "frmHolidayGrant"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim dbAcDatabase As New ADODB.Connection, dbPyrDatabase As New ADODB.Connection, dbComDatabase As New ADODB.Connection
Dim mFormLoaded As Boolean, mLastKeyPressed As Integer
Dim mRemoteAccess As Boolean, mEntrySaved As Boolean, mEntryAborted As Boolean
Dim dtlAddEditMode As Boolean, dtlAddMode As Boolean, dtlEditCanceled As Boolean
Dim clsHLG As clsPayrollMasterEntry, clsHLM As clsPayrollMasterEntry, clsEMP As clsPayrollMasterEntry, clsDSG As clsPayrollMasterEntry, clsDPT As clsPayrollMasterEntry, mActiveControl As Object
Dim fcmbEmpName As frmFlexSearchList, fcmbDsgName As frmFlexSearchList, fcmbDptName As frmFlexSearchList
Dim mHlgDate_old As Date, mHlgEmpCode_old As Long, mHlgDsgCode_old As Long, mHlgDptCode_old As Long
Dim mHlgDate1_changed As Boolean

' StockJrn transaction detail grid Mfgrd2 column definitions
Const X2HLGCODE_COL = 0
Const X2HLGDATE_COL = 1
Const X2HLMNAME_COL = 2
Const X2EMPNAME_COL = 3
Const X2DSGNAME_COL = 4
Const X2DPTNAME_COL = 5
Const X2ALLOWSTATE_COL = 6
Const X2HLGHLMCODE_COL = 7
Const X2HLGEMPCODE_COL = 8
Const X2HLGDSGCODE_COL = 9
Const X2HLGDPTCODE_COL = 10
Const X2HLGALWSTATE_COL = 11
Const X2HLGRECSTATE_COL = 12
Const MFGRD2_COLS = 13

Rem sorting order declartions
Const cLIST_DATEWISE = 0
Const cLIST_EMPWISE = 1

Private Property Get FormAddEditMode() As Integer
FormAddEditMode = cmbFormEntryMode.ListIndex
End Property

Private Property Let FormAddEditMode(ByVal New_FormEntryMode As Integer)
cmbFormEntryMode.ListIndex = New_FormEntryMode
End Property

Private Sub cmbSortingOrder_GotFocus()
FlashActiveControl cmbSortingOrder, True
End Sub

Private Sub cmbSortingOrder_LostFocus()
FlashActiveControl cmbSortingOrder, False
End Sub

Private Sub cmbAllowState_Validate(Cancel As Boolean)
If cmbAllowState.ListIndex = -1 Then
    ErrorBox "Invalid Grant Status !!!"
    Cancel = True
    cmbAllowState.SetFocus
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
    dtpHlgDate1.SetFocus
Else
    Unload Me
End If

End Sub

Private Sub cmdOK_Click()
Dim HLGRecset As New ADODB.Recordset, HLG_LogRS As New ADODB.Recordset
Dim srow As Long, mHlgCode As Long

srow = Mfgrd2.Row
mHlgCode = clsHLG.ActiveCode
If dtlAddMode = True Then
    Rem
Else
    mHlgCode = Val(Mfgrd2.TextMatrix(srow, X2HLGCODE_COL))
End If
If dtlEditCanceled = False Then
    Call ValidDtl
End If
If cmdOK.Caption = "&OK" And dtlEditCanceled = False Then
    Rem addnew/update -------------------------
    If dtlAddMode = True Then
        clsHLG.Clear
    Else
        clsHLG.GetData mHlgCode
    End If
    
    clsHLG.mHlgHlmCode_lng = clsHLM.GetHlmCodeByDate(Ctod(dtpHlgDate.Text))
    clsHLG.mHlgDate_dt = Ctod(dtpHlgDate.Text)
    clsHLG.mHlgEmpCode_lng = Val(fcmbEmpName.BoundText)
    clsHLG.mHlgDsgCode_lng = Val(fcmbDsgName.BoundText)
    clsHLG.mHlgDptCode_lng = Val(fcmbDptName.BoundText)
    clsHLG.mHlgAlwState_int = Val(Right(cmbAllowState.List(cmbAllowState.ListIndex), 1))
    clsHLG.mHlgRemark_str = ""
    
    If dtlAddMode = True Then
        clsHLG.AddNew
        mHlgCode = clsHLG.mCode_lng
    Else
        clsHLG.Update mHlgCode
    End If
    
    clsHLG.UpdateMast mHlgCode
    
    clsHLG.EndMast mHlgCode
    
    Rem show record in flexgrid
    With HLGRecset
    .Open "Select * from HoliGrant where HlgCode=" & CStr(mHlgCode) & "", dbPyrDatabase, adOpenKeyset, adLockOptimistic
    
    clsHLM.GetData .Fields("HlgHlmCode")
    clsEMP.GetData .Fields("HlgEmpCode")
    clsDSG.GetData .Fields("HlgDsgCode")
    clsDPT.GetData .Fields("HlgDptCode")
    
    Mfgrd2.TextMatrix(srow, X2HLGCODE_COL) = .Fields("HlgCode")
    Mfgrd2.TextMatrix(srow, X2HLGDATE_COL) = Dtoc(.Fields("HlgDate"))
    Mfgrd2.TextMatrix(srow, X2HLMNAME_COL) = clsHLM.mName_str
    Mfgrd2.TextMatrix(srow, X2EMPNAME_COL) = clsEMP.mAhName_str
    Mfgrd2.TextMatrix(srow, X2DSGNAME_COL) = clsDSG.mName_str
    Mfgrd2.TextMatrix(srow, X2DPTNAME_COL) = clsDPT.mName_str
    Mfgrd2.TextMatrix(srow, X2ALLOWSTATE_COL) = GetMidPosStr(cATNDHSTAT_LIST, .Fields("HlgAlwState"), ",")
    Mfgrd2.TextMatrix(srow, X2HLGHLMCODE_COL) = .Fields("HlgHlmCode")
    Mfgrd2.TextMatrix(srow, X2HLGEMPCODE_COL) = .Fields("HlgEmpCode")
    Mfgrd2.TextMatrix(srow, X2HLGDSGCODE_COL) = .Fields("HlgDsgCode")
    Mfgrd2.TextMatrix(srow, X2HLGDPTCODE_COL) = .Fields("HlgDptCode")
    Mfgrd2.TextMatrix(srow, X2HLGALWSTATE_COL) = .Fields("HlgAlwState")
    Mfgrd2.TextMatrix(srow, X2HLGRECSTATE_COL) = .Fields("HlgRecState")
    
    End With
    CloseTable HLGRecset
    
    If dtlAddMode = True Then
        Mfgrd2.Rows = Mfgrd2.Rows + 1
    End If
    srow = srow + 1
    Mfgrd2.Row = srow
Else
    Rem cance event -----------------------------------
    clsHLG.CancelMast mHlgCode
    clsHLG.EndMast mHlgCode
    
End If
dtlAddEditMode = False
dtlAddMode = False
dtlEditCanceled = False
VisibleControls False
Mfgrd2.SetFocus
GoTo EndSub
Exit Sub

EndSub:
Set HLGRecset = Nothing
Set HLG_LogRS = Nothing

End Sub

Private Sub cmdShowDtlData_Click()
Dim tRecset As New ADODB.Recordset, srow As Long, cnt As Integer, mHlgDate As Date, mHlgEmpCode As Long, mHlgDptCode As Long, mHlgDsgCode As Long
Dim mHlgDate1 As Date, mHlgDate2 As Date
srow = 1

fcmbEmpName.Text = txtEmpName1.Text: txtEmpName1.Text = fcmbEmpName.Text
fcmbDsgName.Text = txtDsgName1.Text: txtDsgName1.Text = fcmbDsgName.Text
fcmbDptName.Text = txtDptName1.Text: txtDptName1.Text = fcmbDptName.Text

mHlgDate1 = Ctod(dtpHlgDate1.Text)
mHlgDate2 = Ctod(dtpHlgDate2.Text)
mHlgEmpCode = Val(fcmbEmpName.BoundText)
mHlgDptCode = Val(fcmbDptName.BoundText)
mHlgDsgCode = Val(fcmbDsgName.BoundText)

tRecset.Open "Select HoliGrant.*,AchdMast.AhName from HoliGrant" _
    & " left join AchdMast on HoliGrant.HlgEmpCode=AchdMast.AhCode" _
    & " where HlgDate between #" & CStr(ToSysDate(mHlgDate1)) & "# and #" & CStr(ToSysDate(mHlgDate2)) & "#" _
    & IIf(mHlgEmpCode > 0, " and HlgEmpCode=" & CStr(mHlgEmpCode), "") _
    & IIf(mHlgDsgCode > 0, " and HlgDsgCode=" & CStr(mHlgDsgCode), "") _
    & IIf(mHlgDptCode > 0, " and HlgDptCode=" & CStr(mHlgDptCode), "") _
    & " order by " & IIf(cmbSortingOrder.ListIndex = cLIST_EMPWISE, "AchdMast.AhName,HlgDate", "HlgDate,AchdMast.AhName") & ",HlgCode" _
    , dbComDatabase, adOpenKeyset, adLockOptimistic
With tRecset
If .RecordCount > 0 Then
    Do While .EOF = False
        clsHLM.GetData .Fields("HlgHlmCode")
        clsEMP.GetData .Fields("HlgEmpCode")
        clsDSG.GetData .Fields("HlgDsgCode")
        clsDPT.GetData .Fields("HlgDptCode")
        
        Mfgrd2.TextMatrix(srow, X2HLGCODE_COL) = .Fields("HlgCode")
        Mfgrd2.TextMatrix(srow, X2HLGDATE_COL) = Dtoc(.Fields("HlgDate"))
        Mfgrd2.TextMatrix(srow, X2HLMNAME_COL) = clsHLM.mName_str
        Mfgrd2.TextMatrix(srow, X2EMPNAME_COL) = clsEMP.mAhName_str
        Mfgrd2.TextMatrix(srow, X2DSGNAME_COL) = clsDSG.mName_str
        Mfgrd2.TextMatrix(srow, X2DPTNAME_COL) = clsDPT.mName_str
        Mfgrd2.TextMatrix(srow, X2ALLOWSTATE_COL) = GetMidPosStr(cATNDHSTAT_LIST, .Fields("HlgAlwState"), ",")
        Mfgrd2.TextMatrix(srow, X2HLGHLMCODE_COL) = .Fields("HlgHlmCode")
        Mfgrd2.TextMatrix(srow, X2HLGEMPCODE_COL) = .Fields("HlgEmpCode")
        Mfgrd2.TextMatrix(srow, X2HLGDSGCODE_COL) = .Fields("HlgDsgCode")
        Mfgrd2.TextMatrix(srow, X2HLGDPTCODE_COL) = .Fields("HlgDptCode")
        Mfgrd2.TextMatrix(srow, X2HLGALWSTATE_COL) = .Fields("HlgAlwState")
        Mfgrd2.TextMatrix(srow, X2HLGRECSTATE_COL) = .Fields("HlgRecState")
        
        srow = srow + 1
        If Mfgrd2.Rows < srow + 1 Then
            Mfgrd2.Rows = Mfgrd2.Rows + 1
        End If
        
        .MoveNext
    Loop
End If
End With
CloseTable tRecset

ClearFlexRow Mfgrd2, srow
Mfgrd2.Rows = srow + 1
Mfgrd2.SetFocus

End Sub

Private Sub dtpHlgDate_GotFocus()
FlashActiveControl dtpHlgDate, True
End Sub

Private Sub dtpHlgDate_LostFocus()
FlashActiveControl dtpHlgDate, False
End Sub

Private Sub dtpHlgDate_Validate(Cancel As Boolean)
Dim mHlgDate As Date

dtpHlgDate.Text = ToMyDate(dtpHlgDate.Text)
mHlgDate = Ctod(dtpHlgDate.Text)
If IsFinYrDate(mHlgDate) = False Then
    ErrorBox cINVALID_FINYRDATE & " !!!"
    dtpHlgDate.SetFocus
    FlashActiveControl dtpHlgDate, True
    Cancel = True
ElseIf ChkHlmDateExist() = False Then
    dtpHlgDate.SetFocus
    Cancel = True
Else
    txtHlmName.Text = clsHLM.GetHlmNameByDate(mHlgDate)
End If
Call ValidDtl

End Sub

Private Sub dtpHlgDate1_Change()
mHlgDate1_changed = True
End Sub

Private Sub dtpHlgDate1_GotFocus()
FlashActiveControl dtpHlgDate1, True
mHlgDate1_changed = False
End Sub

Private Sub dtpHlgDate1_LostFocus()
FlashActiveControl dtpHlgDate1, False

End Sub

Private Sub dtpHlgDate1_Validate(Cancel As Boolean)
dtpHlgDate1.Text = ToMyDate(dtpHlgDate1.Text)
If IsFinYrDate(Ctod(dtpHlgDate1.Text)) = False Then
    ErrorBox cINVALID_FINYRDATE & " !!!"
    dtpHlgDate1.SetFocus
    FlashActiveControl dtpHlgDate1, True
    Cancel = True
Else
    If mHlgDate1_changed = True Then
        dtpHlgDate2.Text = dtpHlgDate1.Text
    End If
End If

End Sub

Private Sub dtpHlgDate2_GotFocus()
FlashActiveControl dtpHlgDate2, True
End Sub

Private Sub dtpHlgDate2_LostFocus()
FlashActiveControl dtpHlgDate2, False
End Sub

Private Sub dtpHlgDate2_Validate(Cancel As Boolean)
dtpHlgDate2.Text = ToMyDate(dtpHlgDate2.Text)
If IsFinYrDate(Ctod(dtpHlgDate2.Text)) = False Then
    ErrorBox cINVALID_FINYRDATE & " !!!"
    dtpHlgDate2.SetFocus
    FlashActiveControl dtpHlgDate2, True
    Cancel = True
Else
    If Ctod(dtpHlgDate1.Text) > Ctod(dtpHlgDate2.Text) Then
        dtpHlgDate1.Text = dtpHlgDate2.Text
    End If
End If

End Sub

Private Sub Form_Activate()
If mFormLoaded = False Then
    SetFormSize Me, frmMain
    dtpHlgDate1.Text = Dtoc(DefaultEntryDate)
    dtpHlgDate2.Text = Dtoc(DefaultEntryDate)
    dtpHlgDate1.SetFocus
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
txtHlmName.Enabled = False

OpenAcDataSource dbAcDatabase
OpenPyrDataSource dbPyrDatabase
OpenComDataSource dbComDatabase

cmbSortingOrder.Clear
cmbSortingOrder.AddItem "Date wise"
cmbSortingOrder.AddItem "Employee wise"
cmbSortingOrder.ListIndex = 0

cmbAllowState.Clear
cmbAllowState.AddItem "Allowed" & Space(50) & "_" & CStr(cATNDHSTAT_ALLOWED)
cmbAllowState.AddItem "Disallowed" & Space(50) & "_" & CStr(cATNDHSTAT_DISALLOWED)

Set clsHLG = New clsPayrollMasterEntry
Set clsHLG.dbPyrDatabase = dbPyrDatabase
clsHLG.MastName = "HoliGrant"

Set clsHLM = New clsPayrollMasterEntry
Set clsHLM.dbPyrDatabase = dbPyrDatabase
clsHLM.MastName = "HoliMast"

Set clsEMP = New clsPayrollMasterEntry
Set clsEMP.dbPyrDatabase = dbPyrDatabase
Set clsEMP.dbAcDatabase = dbAcDatabase
clsEMP.MastName = "EmpMast"

Set clsDSG = New clsPayrollMasterEntry
Set clsDSG.dbPyrDatabase = dbPyrDatabase
clsDSG.MastName = "DesgMast"

Set clsDPT = New clsPayrollMasterEntry
Set clsDPT.dbPyrDatabase = dbPyrDatabase
clsDPT.MastName = "DeptMast"

Set fcmbEmpName = New frmFlexSearchList
Set fcmbEmpName.dbAcDatabase = dbAcDatabase
Set fcmbEmpName.dbComDatabase = dbComDatabase
Set fcmbEmpName.frmAccessMaster = New frmEmployeeMast
fcmbEmpName.mEmpMastList = True
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
Mfgrd2.Rows = 2: Mfgrd2.FixedRows = 1: Mfgrd2.Cols = MFGRD2_COLS: Mfgrd2.FixedCols = 0
colcnt = X2HLGCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2HLGCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2HLGDATE_COL: Mfgrd2.ColWidth(colcnt) = dtpHlgDate.Width: Mfgrd2.TextMatrix(0, colcnt) = "Date": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2HLMNAME_COL: Mfgrd2.ColWidth(colcnt) = txtHlmName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Holiday Name": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2EMPNAME_COL: Mfgrd2.ColWidth(colcnt) = txtEmpName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Employee Name": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2DSGNAME_COL: Mfgrd2.ColWidth(colcnt) = txtDsgName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Designation": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2DPTNAME_COL: Mfgrd2.ColWidth(colcnt) = txtDptName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Department": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2ALLOWSTATE_COL: Mfgrd2.ColWidth(colcnt) = cmbAllowState.Width: Mfgrd2.TextMatrix(0, colcnt) = "Status": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2HLGHLMCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2HLGHLMCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2HLGEMPCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2HLGEMPCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2HLGDSGCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2HLGDSGCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2HLGDPTCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2HLGDPTCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2HLGALWSTATE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2HLGALWSTATE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2HLGRECSTATE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2HLGRECSTATE_COL": Mfgrd2.ColAlignment(colcnt) = 1

Rem control left positions
colcnt = X2HLGDATE_COL: dtpHlgDate.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2HLMNAME_COL: txtHlmName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2EMPNAME_COL: txtEmpName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2DSGNAME_COL: txtDsgName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2DPTNAME_COL: txtDptName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2ALLOWSTATE_COL: cmbAllowState.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
cmdOK.Left = cmbAllowState.Left + cmbAllowState.Width

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
Set clsHLG = Nothing
Set clsHLM = Nothing
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
Call Mfgrd2_RowColChange

End Sub

Private Sub Mfgrd2_KeyDown(KeyCode As Integer, Shift As Integer)
If Shift = 0 Then
    If InList(KeyCode, Array(vbKeyDelete, vbKeySubtract)) Then
        Call Data_DeleteEvent
    End If
End If

End Sub

Private Sub Data_DeleteEvent()
Dim srow As Long, mDeleteit As Boolean, mHlgCode As Long
If Mfgrd2.Row = FlexNewRow(Mfgrd2) Then
    GoTo EndSub
End If
srow = Mfgrd2.Row
mHlgCode = Val(Mfgrd2.TextMatrix(srow, X2HLGCODE_COL))

mDeleteit = True

If mDeleteit = True Then
    mDeleteit = CanDelete()
End If
If mDeleteit = True Then
    If clsHLG.BeginMast(mHlgCode) = True Then
        clsHLG.DeleteMast mHlgCode
        clsHLG.UpdateMast mHlgCode
        clsHLG.EndMast mHlgCode
        
        RemoveFlexRow Mfgrd2, srow
        Mfgrd2.Row = srow
    End If
    ShowActiveFlexRow Mfgrd2
    Mfgrd2.SetFocus
Else
    Mfgrd2.SetFocus
End If

EndSub:
Exit Sub

End Sub

Private Sub Mfgrd2_KeyPress(KeyAscii As Integer)
Dim srow As Long, mHlgCode As Long

If KeyAscii = vbKeyReturn Then
    srow = Mfgrd2.Row
    mHlgCode = Val(Mfgrd2.TextMatrix(srow, X2HLGCODE_COL))
    
    dtlAddEditMode = True
    dtlAddMode = (IsFlexNewRow(Mfgrd2, srow) = True)
    VisibleControls True, Mfgrd2.Top + Mfgrd2.RowPos(srow)
    If dtlAddMode = True Then
        If clsHLG.BeginMast(0) = False Then
            GoTo EndSub
        End If
        mHlgCode = clsHLG.ActiveCode
        
        Call ChkDefaultValues
        FormAddEditMode = cFORM_ADDMODE
    Else
        If clsHLG.BeginMast(mHlgCode) = False Then
            GoTo EndSub
        End If
        
        dtpHlgDate.Text = Mfgrd2.TextMatrix(srow, X2HLGDATE_COL)
        txtHlmName.Text = Mfgrd2.TextMatrix(srow, X2HLMNAME_COL)
        fcmbEmpName.BoundText = Mfgrd2.TextMatrix(srow, X2HLGEMPCODE_COL): txtEmpName.Text = fcmbEmpName.Text
        fcmbDsgName.BoundText = Mfgrd2.TextMatrix(srow, X2HLGDSGCODE_COL): txtDsgName.Text = fcmbDsgName.Text
        fcmbDptName.BoundText = Mfgrd2.TextMatrix(srow, X2HLGDPTCODE_COL): txtDptName.Text = fcmbDptName.Text
        cmbAllowState.ListIndex = Val(Mfgrd2.TextMatrix(srow, X2HLGALWSTATE_COL)) - 1
        
        FormAddEditMode = cFORM_EDITMODE
    End If
    Mfgrd2.Col = FlexLeftVisibleCol(Mfgrd2)
    Mfgrd2.LeftCol = Mfgrd2.Col
    
    mHlgDate_old = Ctod(dtpHlgDate.Text)
    mHlgEmpCode_old = Val(fcmbEmpName.BoundText)
    mHlgDsgCode_old = Val(fcmbDsgName.BoundText)
    mHlgDptCode_old = Val(fcmbDptName.BoundText)
    
    dtpHlgDate.SetFocus
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
    dtpHlgDate.Top = mRowPos
    txtHlmName.Top = mRowPos
    txtEmpName.Top = mRowPos
    txtDsgName.Top = mRowPos
    txtDptName.Top = mRowPos
    cmbAllowState.Top = mRowPos
    cmdOK.Top = mRowPos
End If

dtpHlgDate.Text = Dtoc(cUNKNOWNDATE)
txtHlmName.Text = ""
txtEmpName.Text = "": fcmbEmpName.BoundText = ""
txtDsgName.Text = "": fcmbDsgName.BoundText = ""
txtDptName.Text = "": fcmbDptName.BoundText = ""
cmbAllowState.ListIndex = -1

Call ValidDtl

dtpHlgDate.Visible = mShowItem
txtHlmName.Visible = mShowItem
txtEmpName.Visible = mShowItem
txtDsgName.Visible = mShowItem
txtDptName.Visible = mShowItem
cmbAllowState.Visible = mShowItem
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
mDataOk = (IsFinYrDate(Ctod(dtpHlgDate.Text)) = True And cmbAllowState.ListIndex > -1)
If InterActiveChange(cmdOK) = True Then
    If mDataOk = True Then
        mDataOk = (ChkHlmDateExist() = True)
    End If
    If mDataOk = True Then
        mDataOk = (ChkDuplicateGrantFound() = False)
    End If
End If

cmdOK.Caption = IIf(mDataOk = True, "&OK", "&Cancel")
cmdOK.BackColor = IIf(mDataOk = True, &H80FF80, &H8080FF)
End Sub

Private Sub Mfgrd2_RowColChange()
Dim srow As Long
srow = Mfgrd2.Row

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
    dtpHlgDate.Text = Mfgrd2.TextMatrix(srow, X2HLGDATE_COL)
    fcmbEmpName.BoundText = Mfgrd2.TextMatrix(srow, X2HLGEMPCODE_COL): txtEmpName.Text = fcmbEmpName.Text
    fcmbDsgName.BoundText = Mfgrd2.TextMatrix(srow, X2HLGDSGCODE_COL): txtDsgName.Text = fcmbDsgName.Text
    fcmbDptName.BoundText = Mfgrd2.TextMatrix(srow, X2HLGDPTCODE_COL): txtDptName.Text = fcmbDptName.Text
    cmbAllowState.ListIndex = Val(Mfgrd2.TextMatrix(srow, X2HLGALWSTATE_COL)) - 1
Else
    dtpHlgDate.Text = dtpHlgDate1.Text
    fcmbEmpName.Text = txtEmpName1.Text: txtEmpName.Text = fcmbEmpName.Text
    fcmbDsgName.Text = txtDsgName1.Text: txtDsgName.Text = fcmbDsgName.Text
    fcmbDptName.Text = txtDptName1.Text: txtDptName.Text = fcmbDptName.Text
    cmbAllowState.ListIndex = 0
End If

End Sub

Private Function ChkDuplicateGrantFound() As Boolean
Dim tRecset As New ADODB.Recordset, mRtnval As Boolean, srow As Long, mHlgCode As Long, mHlgEmpCode As Long, mHlgDptCode As Long, mHlgDsgCode As Long
mRtnval = False
srow = Mfgrd2.Row
mHlgCode = Val(Mfgrd2.TextMatrix(srow, X2HLGCODE_COL))
mHlgEmpCode = Val(fcmbEmpName.BoundText)
mHlgDptCode = Val(fcmbDptName.BoundText)
mHlgDsgCode = Val(fcmbDsgName.BoundText)

With tRecset
.Open "Select * from HoliGrant where HlgDate=#" & CStr(ToSysDate(Ctod(dtpHlgDate.Text))) & "#" & IIf(mHlgEmpCode > 0, " and HlgEmpCode=" & CStr(mHlgEmpCode), "") & IIf(mHlgDptCode > 0, " and HlgDptCode=" & CStr(mHlgDptCode), "") & IIf(mHlgDsgCode > 0, " and HlgDsgCode=" & CStr(mHlgDsgCode), "") & " and HlgCode<>" & CStr(mHlgCode) & "", dbPyrDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    ErrorBox "Duplicate Holiday Grant !!!"
    mRtnval = True
Else
    mRtnval = False
End If
End With
CloseTable tRecset

ChkDuplicateGrantFound = mRtnval

End Function

Private Function ChkHlmDateExist() As Boolean
Dim tRecset As New ADODB.Recordset, mRtnval As Boolean
mRtnval = False

With tRecset
.Open "Select * from HoliMast where HlmDate=#" & CStr(ToSysDate(Ctod(dtpHlgDate.Text))) & "#", dbPyrDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    mRtnval = True
Else
    mRtnval = False
    ErrorBox "Holiday Date does not Exist !!!"
End If
End With
CloseTable tRecset

ChkHlmDateExist = mRtnval

End Function

Private Sub txtHlmName_GotFocus()
FlashActiveControl txtHlmName, True
End Sub

Private Sub txtHlmName_LostFocus()
FlashActiveControl txtHlmName, False
End Sub
