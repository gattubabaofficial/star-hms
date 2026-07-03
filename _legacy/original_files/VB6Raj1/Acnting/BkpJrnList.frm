VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmJournal 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   ClientHeight    =   8520
   ClientLeft      =   60
   ClientTop       =   60
   ClientWidth     =   13650
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
   MDIChild        =   -1  'True
   ScaleHeight     =   8520
   ScaleWidth      =   13650
   WindowState     =   2  'Maximized
   Begin VB.Data datAhname 
      Caption         =   "Ahname"
      Connect         =   "Access"
      DatabaseName    =   ""
      DefaultCursorType=   0  'DefaultCursor
      DefaultType     =   2  'UseODBC
      Exclusive       =   0   'False
      Height          =   300
      Left            =   360
      Options         =   0
      ReadOnly        =   0   'False
      RecordsetType   =   1  'Dynaset
      RecordSource    =   ""
      Top             =   7920
      Width           =   2175
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
      TabIndex        =   24
      TabStop         =   0   'False
      Top             =   360
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
      TabIndex        =   23
      TabStop         =   0   'False
      Top             =   360
      UseMaskColor    =   -1  'True
      Width           =   255
   End
   Begin VB.Frame frAhNameList 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Select Account Name"
      ForeColor       =   &H80000008&
      Height          =   6615
      Left            =   9720
      TabIndex        =   17
      Top             =   1080
      Width           =   3735
      Begin VB.CheckBox chkRandomSearch 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Randam Search"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   120
         TabIndex        =   19
         Top             =   240
         Width           =   2775
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd3 
         Bindings        =   "BkpJrnList.frx":0000
         Height          =   5895
         Left            =   0
         TabIndex        =   18
         Top             =   720
         Width           =   3735
         _ExtentX        =   6588
         _ExtentY        =   10398
         _Version        =   393216
         FixedCols       =   0
         RowHeightMin    =   240
         Redraw          =   -1  'True
         ScrollBars      =   2
         SelectionMode   =   1
         AllowUserResizing=   3
         Appearance      =   0
      End
   End
   Begin VB.Frame frFormDtl 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Detail"
      ForeColor       =   &H80000008&
      Height          =   6615
      Left            =   120
      TabIndex        =   12
      Top             =   1080
      Width           =   9495
      Begin VB.ComboBox cmbAhName 
         Appearance      =   0  'Flat
         Height          =   315
         Left            =   1080
         TabIndex        =   25
         Text            =   "cmbAhName"
         Top             =   2760
         Width           =   4455
      End
      Begin VB.CommandButton cmdOK 
         Appearance      =   0  'Flat
         BackColor       =   &H008080FF&
         Caption         =   "&OK"
         Height          =   315
         Left            =   8640
         Style           =   1  'Graphical
         TabIndex        =   20
         Top             =   2760
         Width           =   735
      End
      Begin VB.TextBox txtJrnNarr_1 
         Appearance      =   0  'Flat
         BeginProperty DataFormat 
            Type            =   0
            Format          =   "0"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   0
         EndProperty
         Height          =   645
         Left            =   1080
         TabIndex        =   8
         Top             =   4440
         Width           =   4455
      End
      Begin VB.TextBox txtJrnNarr 
         Appearance      =   0  'Flat
         BeginProperty DataFormat 
            Type            =   0
            Format          =   "0"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   0
         EndProperty
         Height          =   645
         Left            =   1080
         TabIndex        =   7
         Top             =   3180
         Width           =   4455
      End
      Begin VB.TextBox mskCrAmt 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BeginProperty DataFormat 
            Type            =   0
            Format          =   "0.00"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   0
         EndProperty
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   7080
         TabIndex        =   6
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   2760
         Width           =   1575
      End
      Begin VB.TextBox mskDrAmt 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BeginProperty DataFormat 
            Type            =   0
            Format          =   "0.00"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   0
         EndProperty
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   5520
         TabIndex        =   5
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   2760
         Width           =   1575
      End
      Begin VB.TextBox txtDrCrFlag 
         Appearance      =   0  'Flat
         BeginProperty DataFormat 
            Type            =   0
            Format          =   "0"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   0
         EndProperty
         Height          =   315
         Left            =   720
         MaxLength       =   2
         TabIndex        =   4
         Top             =   2760
         Width           =   375
      End
      Begin VB.TextBox mskJrnSNo 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BeginProperty DataFormat 
            Type            =   1
            Format          =   "0"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   1
         EndProperty
         Enabled         =   0   'False
         Height          =   315
         Left            =   120
         TabIndex        =   3
         Tag             =   "AhCode"
         Text            =   "-1"
         Top             =   2760
         Width           =   615
      End
      Begin VB.TextBox dtpJrnDate 
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
         Left            =   2160
         TabIndex        =   1
         Tag             =   "AhCode"
         Text            =   "dd/mm/yyyy"
         Top             =   600
         Width           =   1335
      End
      Begin VB.CommandButton cmdSaveForm 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFF80&
         Caption         =   "&Save"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   7920
         Style           =   1  'Graphical
         TabIndex        =   9
         Top             =   5880
         Width           =   855
      End
      Begin VB.TextBox mskFormBoundField 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BeginProperty DataFormat 
            Type            =   1
            Format          =   "0"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   1
         EndProperty
         Enabled         =   0   'False
         Height          =   285
         Left            =   2160
         TabIndex        =   0
         Tag             =   "AhCode"
         Text            =   "-1"
         Top             =   240
         Width           =   1335
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd2 
         Height          =   2775
         Left            =   120
         TabIndex        =   2
         Top             =   1560
         Width           =   9135
         _ExtentX        =   16113
         _ExtentY        =   4895
         _Version        =   393216
         FixedCols       =   0
         HighLight       =   2
         SelectionMode   =   1
         AllowUserResizing=   3
         Appearance      =   0
      End
      Begin VB.Label lblCrAmtTot 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "0.00"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   7080
         TabIndex        =   22
         Top             =   4440
         Width           =   1575
      End
      Begin VB.Label lblDrAmtTot 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "0.00"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   5520
         TabIndex        =   21
         Top             =   4440
         Width           =   1575
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Date:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   1
         Left            =   840
         TabIndex        =   16
         Top             =   600
         Width           =   855
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Code:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   0
         Left            =   840
         TabIndex        =   15
         Top             =   240
         Width           =   855
      End
   End
   Begin VB.ComboBox cmbFormEntryMode 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   315
      ItemData        =   "BkpJrnList.frx":0014
      Left            =   0
      List            =   "BkpJrnList.frx":0021
      Style           =   1  'Simple Combo
      TabIndex        =   14
      TabStop         =   0   'False
      Text            =   "cmbFormMode"
      Top             =   360
      Width           =   1455
   End
   Begin VB.Frame frFormSmry 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Summary"
      ForeColor       =   &H80000008&
      Height          =   5175
      Left            =   120
      TabIndex        =   11
      Top             =   840
      Width           =   9495
      Begin MSFlexGridLib.MSFlexGrid Mfgrd1 
         Height          =   4575
         Left            =   120
         TabIndex        =   13
         Top             =   360
         Width           =   10215
         _ExtentX        =   18018
         _ExtentY        =   8070
         _Version        =   393216
         FixedCols       =   0
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
      Caption         =   "Journal Entry"
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
      TabIndex        =   10
      Top             =   0
      Width           =   9015
   End
End
Attribute VB_Name = "frmJournal"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim dbAcDatabase As New ADODB.Connection, JRNRecset As New ADODB.Recordset, JRNSmryRS As New ADODB.Recordset, lstAHRecset As New ADODB.Recordset, lstAHRecset1 As New ADODB.Recordset
Dim FormLoaded As Boolean, LastKeyPressed As Integer
Dim mJrnCode As Long, dtlAddEditMode As Boolean, dtlAddMode As Boolean, dtlEditCanceled As Boolean
Dim clsAH As New clsAccountHead, clsAhCombo As New clsComboBox1
Dim mDrCrAmtDiff As Double

' Summary column definitions
Const X1JRNCODE_COL = 0
Const X1JRNDATE_COL = 1
Const MFGRD1_COLS = 2
Const X1FORMBOUND_COL = 0

' Journal transaction detail grid Mfgrd2 column definitions
Const X2JRNICODE_COL = 0
Const X2JRNSNO_COL = 1
Const X2DRCRFLAG_COL = 2
Const X2AHNAME_COL = 3
Const X2DRAMT_COL = 4
Const X2CRAMT_COL = 5
Const X2JRNNARR_COL = 6
Const X2JRNAHCODE_COL = 7
Const MFGRD2_COLS = 8

' Account Head List column list definition
Const X3AHCODE_COL = 0
Const X3AHNAME_COL = 1
Const MFGRD3_COLS = 2

Public Property Get FormAddEditMode() As Integer
FormAddEditMode = cmbFormEntryMode.ListIndex
End Property

Public Property Let FormAddEditMode(ByVal New_FormEntryMode As Integer)
cmbFormEntryMode.ListIndex = New_FormEntryMode
End Property

Private Sub cmdFormEnter_Click()
LastKeyPressed = 13
If TypeOf Screen.ActiveControl Is MSFlexGrid Then
    If Screen.ActiveControl.Name = Mfgrd1.Name Then
        Call Mfgrd1_KeyPress(13)
    ElseIf Screen.ActiveControl.Name = Mfgrd2.Name Then
        Call Mfgrd2_KeyPress(13)
    ElseIf Screen.ActiveControl.Name = Mfgrd3.Name Then
    
    End If
Else
    SendKeys "{tab}"
End If

End Sub

Private Sub cmdFormEscape_Click()
LastKeyPressed = 27
If FormAddEditMode = 2 Then
    Unload Me
ElseIf dtlAddEditMode = True Then
    dtlEditCanceled = True
    Call cmdOK_Click
Else
    If ExitThisEntry() = True Then
        Call ShowEntryMode(False)
    End If
End If

End Sub

Private Sub cmdOK_Click()
Dim srow As Integer, mJrnSno As Integer
srow = Mfgrd2.Row
mJrnSno = Val(Mfgrd2.TextMatrix(srow, X2JRNSNO_COL))
If cmdOK.Caption = "&OK" And dtlEditCanceled = False Then
    Mfgrd2.TextMatrix(srow, X2JRNSNO_COL) = Val(mskJrnSNo.Text)
    Mfgrd2.TextMatrix(srow, X2DRCRFLAG_COL) = txtDrCrFlag.Text
    'Mfgrd2.TextMatrix(srow, X2AHNAME_COL) = txtAhName.Text
    Mfgrd2.TextMatrix(srow, X2AHNAME_COL) = dcmbAhname.Text
    Mfgrd2.TextMatrix(srow, X2DRAMT_COL) = mskDrAmt.Text
    Mfgrd2.TextMatrix(srow, X2CRAMT_COL) = mskCrAmt.Text
    Mfgrd2.TextMatrix(srow, X2JRNNARR_COL) = txtJrnNarr.Text
    'Mfgrd2.TextMatrix(srow, X2JRNAHCODE_COL) = Val(txtAhName.Tag)
    Mfgrd2.TextMatrix(srow, X2JRNAHCODE_COL) = Val(dcmbAhname.BoundText)

    If dtlAddMode = True Then
        Mfgrd2.Rows = Mfgrd2.Rows + 1
    Else
    
    End If
    srow = srow + 1
    Mfgrd2.Row = srow
    
    Call CalcDrCrAmtTot
End If
dtlAddEditMode = False
dtlAddMode = False
dtlEditCanceled = False
Call VisibleControls(False)
Mfgrd2.SetFocus

End Sub

Private Sub cmdSaveForm_Click()
Dim srow As Integer, mJrnICode As Long
If FormAddEditMode = 0 Then
    mJrnCode = GetNextSeqno(dbAcDatabase, "Journal", "JrnCode")
    dbAcDatabase.BeginTrans
    With JRNRecset
    .AddNew
    Rem .Fields("JrnICode") = AutoNumber
    .Fields("JrnCode") = mJrnCode
    .Fields("JrnSno") = -1
    .Fields("JrnDate") = Ctod(dtpJrnDate.Text)
    .Fields("JrnAhcode") = 0
    .Fields("JrnAmt") = mDrCrAmtDiff
    .Fields("JrnNarr") = txtJrnNarr_1.Text
    .Update
    For srow = 1 To Mfgrd2.Rows - 2
        .AddNew
        Rem .Fields("JrnICode") = AutoNumber
        .Fields("JrnCode") = mJrnCode
        .Fields("JrnSno") = srow    ' Val(Mfgrd2.TextMatrix(srow, X2JRNSNO_COL))
        .Fields("JrnDate") = Ctod(dtpJrnDate.Text)
        .Fields("JrnAhcode") = Val(Mfgrd2.TextMatrix(srow, X2JRNAHCODE_COL))
        If UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2DRAMT_COL), True) <> 0 Then
            .Fields("JrnAmt") = UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2DRAMT_COL), True) * -1
        Else
            .Fields("JrnAmt") = UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2CRAMT_COL), True)
        End If
        .Fields("JrnNarr") = txtJrnNarr.Text
        .Update
    Next
    End With
    dbAcDatabase.CommitTrans
Else
    dbAcDatabase.BeginTrans
    With JRNRecset
    mJrnICode = Val(txtJrnNarr_1.Tag)
    If mJrnICode > 0 Then
        .Seek Array(mJrnICode)
    Else
        .AddNew
        Rem .Fields("JrnICode") = AutoNumber
        .Fields("JrnCode") = mJrnCode
    End If
    .Fields("JrnSno") = -1
    .Fields("JrnDate") = Ctod(dtpJrnDate.Text)
    .Fields("JrnAhcode") = 0
    .Fields("JrnAmt") = mDrCrAmtDiff
    .Fields("JrnNarr") = txtJrnNarr_1.Text
    .Update
    
    For srow = 1 To Mfgrd2.Rows - 2
        mJrnICode = Val(Mfgrd2.TextMatrix(srow, X2JRNICODE_COL))
        If mJrnICode > 0 Then
            .Seek Array(mJrnICode)
        Else
            .AddNew
            Rem .Fields("JrnICode") = AutoNumber
            .Fields("JrnCode") = mJrnCode
        End If
        .Fields("JrnSno") = srow        ' Val(Mfgrd2.TextMatrix(srow, X2JRNSNO_COL))
        .Fields("JrnDate") = Ctod(dtpJrnDate.Text)
        .Fields("JrnAhcode") = Val(Mfgrd2.TextMatrix(srow, X2JRNAHCODE_COL))
        If UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2DRAMT_COL), True) <> 0 Then
            .Fields("JrnAmt") = UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2DRAMT_COL), True) * -1
        Else
            .Fields("JrnAmt") = UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2CRAMT_COL), True)
        End If
        .Fields("JrnNarr") = txtJrnNarr.Text
        .Update
    Next
    End With
    dbAcDatabase.CommitTrans
End If
Call FillFormSmry
Call ShowEntryMode(False)

End Sub

Private Sub cmdSaveForm_GotFocus()
If VerifyFormData() = True Then
    If SaveThisEntry() = True Then
        Call cmdSaveForm_Click
    Else
        SendKeys "{tab}"
    End If
End If
End Sub

Private Sub dcmbAhname_Change()
Text1.Text = dcmbAhname.BoundText
End Sub

Private Sub dtpJrnDate_GotFocus()
Call SelectText(dtpJrnDate)
End Sub

Private Sub dtpJrnDate_Validate(Cancel As Boolean)
dtpJrnDate.Text = ToDate(dtpJrnDate.Text)

End Sub

Private Sub Form_Activate()
If FormLoaded = False Then
    Call FillFormSmry
    Call ShowEntryMode(False)
    'Call FillFlexList(Mfgrd3, dbAcDatabase, "Select Ahcode,Ahname from AchdMast order by Ahname")
Else
    JRNRecset.Requery
    JRNSmryRS.Requery
End If

FormLoaded = True
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
LastKeyPressed = KeyCode
'MsgBox CStr(LastKeyPressed) & "form_keydown"
Select Case KeyCode
Case 13:
'    If Not TypeOf Screen.ActiveControl Is MSFlexGrid Then
'        If Screen.ActiveControl.Name <> txtAhName.Name Then
'            SendKeys "{tab}"
'        End If
'    End If
Case 27:
'    If FormAddEditMode = 2 Then
'        Unload Me
'    ElseIf dtlAddEditMode = True Then
'        dtlEditCanceled = True
'        Call cmdOK_Click
'    Else
'        If ExitThisEntry() = True Then
'            Call ShowEntryMode(False)
'        End If
'    End If
End Select

End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
LastKeyPressed = KeyAscii
'MsgBox CStr(LastKeyPressed) & "form_keypress"

End Sub

Private Sub Form_Load()
Dim colcnt As Integer
FormLoaded = False

OpenDataSource dbAcDatabase

Set clsAH.dbAcDatabase = dbAcDatabase

JRNRecset.Open "Journal", dbAcDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
JRNRecset.Index = "JrnCodeSNo"

JRNSmryRS.Open "Select * from Journal order by JrnDate,JRNSno", dbAcDatabase, adOpenKeyset, adLockOptimistic

lstAHRecset.Open "Select AhCode,AhName from AchdMast order by Ahname", dbAcDatabase, adOpenKeyset, adLockReadOnly
lstAHRecset1.Open "Select AhCode from AchdMast order by Ahcode", dbAcDatabase, adOpenKeyset, adLockReadOnly
'Set clsAhCombo.rs = lstAHRecset
'Set clsAhCombo.Combo1 = dcmbAhName
'clsAhCombo.mBoundFieldName = "Ahcode"
'clsAhCombo.mListFieldName = "Ahname"
'clsAhCombo.Rebind
Set datAhname.Database = dbAcDatabase
Set datAhname.RecordSource = "Select AhCode,AhName from AchdMast order by Ahname"
'adoAhname.Refresh
'dcmbAhname.DataField = "AhCode"
dcmbAhname.ListField = "AhName"
dcmbAhname.BoundColumn = "AhCode"
'Set dcmbAhname.DataSource = lstAHRecset
'Set dcmbAhname.RowSource = adoAhname.Recordset
'dcmbAhname.ReFill
'dcmbAhname.Refresh

Mfgrd1.Rows = 2: Mfgrd1.Cols = MFGRD1_COLS
colcnt = X1JRNCODE_COL: Mfgrd1.ColWidth(colcnt) = 1000: Mfgrd1.TextMatrix(0, colcnt) = "Code": Mfgrd1.ColAlignment(colcnt) = 8
colcnt = X1JRNDATE_COL: Mfgrd1.ColWidth(colcnt) = 1000: Mfgrd1.TextMatrix(0, colcnt) = "Date": Mfgrd1.ColAlignment(colcnt) = 2

Mfgrd2.Rows = 2: Mfgrd2.Cols = MFGRD2_COLS
colcnt = X2JRNICODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2JRNICODE_COL": Mfgrd2.ColAlignment(colcnt) = 8
colcnt = X2JRNSNO_COL: Mfgrd2.ColWidth(colcnt) = mskJrnSNo.Width: Mfgrd2.TextMatrix(0, colcnt) = "SNo": Mfgrd2.ColAlignment(colcnt) = 8
colcnt = X2DRCRFLAG_COL: Mfgrd2.ColWidth(colcnt) = txtDrCrFlag.Width: Mfgrd2.TextMatrix(0, colcnt) = "Dr/Cr": Mfgrd2.ColAlignment(colcnt) = 2
colcnt = X2AHNAME_COL: Mfgrd2.ColWidth(colcnt) = dcmbAhname.Width: Mfgrd2.TextMatrix(0, colcnt) = "Account Head": Mfgrd2.ColAlignment(colcnt) = 2
colcnt = X2DRAMT_COL: Mfgrd2.ColWidth(colcnt) = mskDrAmt.Width: Mfgrd2.TextMatrix(0, colcnt) = "Dr.Amt": Mfgrd2.ColAlignment(colcnt) = 8
colcnt = X2CRAMT_COL: Mfgrd2.ColWidth(colcnt) = mskCrAmt.Width: Mfgrd2.TextMatrix(0, colcnt) = "Cr.Amt": Mfgrd2.ColAlignment(colcnt) = 8
colcnt = X2JRNNARR_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2JRNNARR_COL": Mfgrd2.ColAlignment(colcnt) = 2
colcnt = X2JRNAHCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2JRNAHCODE_COL": Mfgrd2.ColAlignment(colcnt) = 2

colcnt = X2JRNSNO_COL: mskJrnSNo.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2DRCRFLAG_COL: txtDrCrFlag.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2AHNAME_COL: dcmbAhname.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2DRAMT_COL: mskDrAmt.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2CRAMT_COL: mskCrAmt.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
txtJrnNarr.Left = dcmbAhname.Left
cmdOK.Left = mskCrAmt.Left + mskCrAmt.Width + 5

Mfgrd3.Rows = (Int(Mfgrd3.Height / Mfgrd3.RowHeightMin)): Mfgrd3.FixedRows = 2: Mfgrd3.Cols = MFGRD3_COLS: Mfgrd3.Height = Mfgrd3.RowHeightMin * Int(Mfgrd3.Height / Mfgrd3.RowHeightMin)
colcnt = X3AHCODE_COL: Mfgrd3.ColWidth(colcnt) = 0: Mfgrd3.TextMatrix(0, colcnt) = "X3AHCODE_COL": Mfgrd3.ColAlignment(colcnt) = 8: Mfgrd3.TextMatrix(1, colcnt) = "-1"
colcnt = X3AHNAME_COL: Mfgrd3.ColWidth(colcnt) = 2000: Mfgrd3.TextMatrix(0, colcnt) = "Account Head Name": Mfgrd3.ColAlignment(colcnt) = 2: Mfgrd3.TextMatrix(1, colcnt) = "<<End of List>>"

Rem Set clsAhList = New clsFlexRecsetSearch
Rem Set clsAhList.rs = lstAHRecset
Rem Set clsAhList.Mfgrd = Mfgrd3
Rem Set clsAhList.txtText1 = txtAhName
Rem Set clsAhList.frFrame1 = frAhNameList
Rem Call clsAhList.Store_BoundField("AhCode")
Rem Call clsAhList.Store_SearchField("AhName")
Rem Call clsAhList.Init_FlexRecset(False)

frFormSmry.Visible = True
frFormDtl.Visible = False
frAhNameList.Visible = False

Call VisibleControls(False)

End Sub

Private Sub FillFormSmry()
Dim srow As Long, colcnt As Integer
srow = 1
Mfgrd1.Rows = 2

With JRNSmryRS
.Requery
If .RecordCount > 0 Then
    .MoveFirst
    Do While .EOF = False
        Mfgrd1.TextMatrix(srow, X1JRNCODE_COL) = CStr(.Fields("JrnCode"))
        Mfgrd1.TextMatrix(srow, X1JRNDATE_COL) = .Fields("JrnDate")
        
        srow = srow + 1
        Mfgrd1.Rows = Mfgrd1.Rows + 1
    
        .MoveNext
    Loop
Else
    For colcnt = 0 To Mfgrd1.Cols - 1
        Mfgrd1.TextMatrix(srow, colcnt) = ""
    Next
End If
End With

End Sub

Private Sub Form_Resize()
lblFormHeading.Width = Me.Width

End Sub

Private Sub Form_Unload(Cancel As Integer)
CloseTable JRNRecset
CloseTable JRNSmryRS
Set clsAH = Nothing
CloseDataSource dbAcDatabase
End Sub

Private Sub Mfgrd1_DblClick()
Call Mfgrd1_KeyPress(13)
End Sub

Private Sub Mfgrd1_KeyPress(KeyAscii As Integer)
Dim srow As Integer
srow = Mfgrd1.Row
If KeyAscii = 13 Then
    mJrnCode = Val(Mfgrd1.TextMatrix(srow, X1FORMBOUND_COL))
    If mJrnCode > 0 Then
        FormAddEditMode = 1
    Else
        FormAddEditMode = 0
    End If
    Call ShowEntryMode(True)
    If FormAddEditMode = 0 Then
        mskFormBoundField.Text = GetNextSeqno(dbAcDatabase, "Journal", "JrnCode")
        dtpJrnDate.Text = Dtoc(DefaultDate)
        txtJrnNarr_1.Text = ""
        txtJrnNarr_1.Tag = 0
        
        Call ShowDtlData(Val(mskFormBoundField.Text))
    Else
        JRNRecset.Seek Array(mJrnCode)
        
        mskFormBoundField.Text = CStr(JRNRecset.Fields("JrnCode"))
        dtpJrnDate.Text = JRNRecset.Fields("JrnDate")
        txtJrnNarr_1.Text = ""
        txtJrnNarr_1.Tag = 0
        
        Call ShowDtlData(Val(mskFormBoundField.Text))
    End If
End If


End Sub

Private Sub ShowEntryMode(ByVal EntryMode As Boolean)
frFormSmry.Visible = Not EntryMode
frFormDtl.Visible = EntryMode
If EntryMode = False Then
    FormAddEditMode = 2
    Mfgrd1.SetFocus
Else
    dtpJrnDate.SetFocus
End If
frAhNameList.Visible = False
End Sub

Private Function VerifyFormData() As Boolean
VerifyFormData = False
If Val(mskFormBoundField.Text) < 1 Then
    MsgBox "Invalid Internal Entry No. !!!"
    dtpJrnDate.SetFocus
    Exit Function
End If
If dtpJrnDate.Text = "" Then
    MsgBox "Invalid Entry Date !!!"
    dtpJrnDate.SetFocus
    Exit Function
End If
If mDrCrAmtDiff <> 0 Then
    MsgBox "Debit & Credit Amount Misbalanced  !!!"
    Mfgrd2.Row = Mfgrd2.Rows - 1
    Mfgrd2.SetFocus
    Exit Function
End If

VerifyFormData = True
End Function

Private Sub ShowDtlData(ByVal mFormBoundCode As Long)
Dim srow As Integer, mDrAmtTot As Double, mCrAmtTot As Double
Mfgrd2.Rows = 2
mDrAmtTot = 0
mCrAmtTot = 0

With JRNRecset
.Seek Array(mFormBoundCode)
If .EOF = False Then
    Do While .Fields("JrnCode") = mFormBoundCode
        If .Fields("JrnSno") = -1 Then
            txtJrnNarr_1.Text = .Fields("JrnNarr")
            txtJrnNarr_1.Tag = .Fields("JrnICode")
        Else
            clsAH.GetCode .Fields("JrnAhCode")
            
            Mfgrd2.TextMatrix(srow, X2JRNICODE_COL) = .Fields("JrnICode")
            Mfgrd2.TextMatrix(srow, X2JRNSNO_COL) = .Fields("JrnSno")
            Mfgrd2.TextMatrix(srow, X2DRCRFLAG_COL) = SenseDrCrFlag(.Fields("JrnAmt"))
            Mfgrd2.TextMatrix(srow, X2AHNAME_COL) = clsAH.mAhName_str
            Mfgrd2.TextMatrix(srow, X2DRAMT_COL) = ToMyNumFmt(SenseDrAmt(.Fields("JrnAmt")))
            Mfgrd2.TextMatrix(srow, X2CRAMT_COL) = ToMyNumFmt(SenseCrAmt(.Fields("JrnAmt")))
            Mfgrd2.TextMatrix(srow, X2JRNNARR_COL) = .Fields("JrnNarr")
            
            mDrAmtTot = mDrAmtTot + UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2DRAMT_COL), True)
            mCrAmtTot = mCrAmtTot + UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2CRAMT_COL), True)
            
            Mfgrd2.Rows = Mfgrd2.Rows + 1
            srow = srow + 1
        End If
    
        .MoveNext
        If .EOF = True Then
            Exit Do
        End If
    Loop
Else
    Dim colcnt As Integer
    For colcnt = 0 To Mfgrd2.Cols - 1
        Mfgrd2.TextMatrix(srow, colcnt) = ""
    Next
End If
End With

lblDrAmtTot.Caption = ToMyNumFmt(mDrAmtTot)
lblCrAmtTot.Caption = ToMyNumFmt(mCrAmtTot)
mDrCrAmtDiff = mDrAmtTot - mCrAmtTot

End Sub

Private Sub Mfgrd2_DblClick()
Call Mfgrd2_KeyPress(13)
End Sub

Private Sub Mfgrd2_KeyPress(KeyAscii As Integer)
Dim srow As Integer, mJrnSno As Integer

If KeyAscii = 13 Then
    srow = Mfgrd2.Row
    mJrnSno = Val(Mfgrd2.TextMatrix(srow, X2JRNSNO_COL))
    
    dtlAddEditMode = True
    dtlAddMode = (mJrnSno = 0)
    Call VisibleControls(True, Mfgrd2.Top + Mfgrd2.RowPos(Mfgrd2.Row))
    If dtlAddMode = True Then
        mskJrnSNo.Text = FlexNextSeqno(Mfgrd2, X2JRNSNO_COL)
        txtDrCrFlag.Text = IIf(mDrCrAmtDiff > 0, "Cr", "Dr")
        dcmbAhname.BoundText = 0
        mskDrAmt.Text = ToMyNumFmt(SenseDrAmt(mDrCrAmtDiff))
        mskCrAmt.Text = ToMyNumFmt(SenseCrAmt(mDrCrAmtDiff))
        txtJrnNarr.Text = ""
    Else
        mskJrnSNo.Text = Val(Mfgrd2.TextMatrix(srow, X2JRNSNO_COL))
        txtDrCrFlag.Text = Mfgrd2.TextMatrix(srow, X2DRCRFLAG_COL)
        dcmbAhname.BoundText = Val(Mfgrd2.TextMatrix(srow, X2JRNAHCODE_COL))
        mskDrAmt.Text = Mfgrd2.TextMatrix(srow, X2DRAMT_COL)
        mskCrAmt.Text = Mfgrd2.TextMatrix(srow, X2CRAMT_COL)
        txtJrnNarr.Text = Mfgrd2.TextMatrix(srow, X2JRNNARR_COL)
    End If
    txtDrCrFlag.SetFocus
    Call ValidDtl

End If


End Sub

Private Sub VisibleControls(ByVal mShowItem As Boolean, Optional ByVal mRowPos)
Rem Important - dtlAddEditMode & dtlAddMode must be initialised prior to this
If IsMissing(mRowPos) = False Then
    mskJrnSNo.Top = mRowPos
    txtDrCrFlag.Top = mRowPos
    dcmbAhname.Top = mRowPos
    mskDrAmt.Top = mRowPos
    mskCrAmt.Top = mRowPos
    txtJrnNarr.Top = mRowPos + dcmbAhname.Height + 5
    cmdOK.Top = mRowPos
End If

mskJrnSNo.Text = 0
txtDrCrFlag.Text = ""
dcmbAhname.BoundText = 0
mskDrAmt.Text = 0
mskCrAmt.Text = 0
txtJrnNarr.Text = ""
Call ValidDtl

mskJrnSNo.Visible = mShowItem
txtDrCrFlag.Visible = mShowItem
dcmbAhname.Visible = mShowItem
mskDrAmt.Visible = mShowItem
mskCrAmt.Visible = mShowItem
txtJrnNarr.Visible = mShowItem
cmdOK.Visible = mShowItem

dtpJrnDate.Enabled = (dtlAddEditMode = False)
Mfgrd2.Enabled = (dtlAddEditMode = False)
cmdSaveForm.Enabled = (dtlAddEditMode = False)
txtJrnNarr_1.Enabled = (dtlAddEditMode = False)

End Sub

Private Sub dtlCauseValidation(ByVal mValidate As Boolean)

mskJrnSNo.CausesValidation = mValidate
txtDrCrFlag.CausesValidation = mValidate
dcmbAhname.CausesValidation = mValidate
mskDrAmt.CausesValidation = mValidate
mskCrAmt.CausesValidation = mValidate
txtJrnNarr.CausesValidation = mValidate
cmdOK.CausesValidation = mValidate

End Sub

Private Sub ValidDtl()
Dim mDataOk As Boolean
mDataOk = (Val(mskJrnSNo.Text) > 0 And (txtDrCrFlag.Text = "Dr" Or txtDrCrFlag.Text = "Cr") And Val(dcmbAhname.BoundText) > 0)
cmdOK.Caption = IIf(mDataOk = True, "&OK", "&Cancel")
cmdOK.BackColor = IIf(mDataOk = True, &H80FF80, &H8080FF)
End Sub

Private Sub CalcDrCrAmtTot()
Dim mDrAmtTot As Double, mCrAmtTot As Double
mDrAmtTot = FlexColSum(Mfgrd2, X2DRAMT_COL)
mCrAmtTot = FlexColSum(Mfgrd2, X2CRAMT_COL)

lblDrAmtTot.Caption = ToMyNumFmt(mDrAmtTot)
lblCrAmtTot.Caption = ToMyNumFmt(mCrAmtTot)
mDrCrAmtDiff = (mDrAmtTot - mCrAmtTot)

End Sub

''Private Sub Mfgrd3_RowColChange()
''Call clsAhList.Mfgrd_RowColChange
'''If Mfgrd3.Row < Mfgrd3.FixedRows Then
'''    If Mfgrd3.BackColorSel <> vbRed Then Mfgrd3.BackColorSel = vbRed
'''Else
'''    If Mfgrd3.BackColorSel <> vbHighlight Then Mfgrd3.BackColorSel = vbHighlight
'''End If
'''Mfgrd3.ColSel = 0: Mfgrd3.ColSel = Mfgrd3.Cols - 1
'''If Mfgrd3.RowIsVisible(Mfgrd3.Row) = False Then
'''    If Mfgrd3.Row > Mfgrd3.TopRow Then
'''        Mfgrd3.TopRow = Mfgrd3.TopRow + (Mfgrd3.Row - (Mfgrd3.TopRow + (Mfgrd3.Height / Mfgrd3.RowHeight(0)) - Mfgrd3.FixedRows - 1))
'''    Else
'''        Mfgrd3.TopRow = Mfgrd3.TopRow - (Mfgrd3.TopRow - Mfgrd3.Row)
'''    End If
'''Else
'''    If Mfgrd3.Row < Mfgrd3.FixedRows Then
'''        Mfgrd3.TopRow = Mfgrd3.FixedRows
'''    End If
'''End If
''End Sub

Private Sub mskCrAmt_GotFocus()
Call SelectText(mskCrAmt)
End Sub

Private Sub mskCrAmt_LostFocus()
If LastKeyPressed = 13 Then
    If UnMyNumFmt(mskCrAmt.Text, True) = 0 And UnMyNumFmt(mskDrAmt.Text, True) = 0 Then
        mskDrAmt.SetFocus
    End If
End If

End Sub

Private Sub mskCrAmt_Validate(Cancel As Boolean)
mskCrAmt.Text = ToMyNumFmt(mskCrAmt.Text, , True)

Call ValidDtl
End Sub

Private Sub mskDrAmt_GotFocus()
Call SelectText(mskDrAmt)
End Sub

Private Sub mskDrAmt_LostFocus()
If LastKeyPressed = 13 Then
    If UnMyNumFmt(mskDrAmt.Text, True) <> 0 Then
        mskCrAmt.Text = "0.00"
        txtJrnNarr.SetFocus
    End If
End If
 

End Sub

Private Sub mskDrAmt_Validate(Cancel As Boolean)
mskDrAmt.Text = ToMyNumFmt(mskDrAmt.Text, , True)

Call ValidDtl
End Sub

''Private Sub txtAhName_Change()
''Call clsAhList.txtText1_Change
'''Mfgrd3.Redraw = False
''''Call SearchFlex(Mfgrd3, X3AHNAME_COL, txtAhName.Text)
'''Call SearchRecsetFlex(lstAHRecset, X3AHNAME_COL, Mfgrd3, txtAhName.Text)
'''Call Mfgrd3_RowColChange
'''Mfgrd3.Refresh
'''Mfgrd3.Redraw = True
''End Sub

''Private Sub txtAhName_GotFocus()
''Call SelectText(txtAhName)
''End Sub

''Private Sub txtAhName_KeyDown(KeyCode As Integer, Shift As Integer)
''If frFrame1.Visible = False Then
''    Call clsAhList.Init_FlexRecset
''End If
''
''Call clsAhList.txtText1_KeyDown(KeyCode, Shift)
'''If KeyCode = vbKeyUp Or KeyCode = vbKeyDown Or KeyCode = vbKeyHome Or KeyCode = vbKeyEnd Then
'''    Call txtAhName_KeyPress(KeyCode)
'''End If
''End Sub

''Private Sub txtAhName_KeyPress(KeyAscii As Integer)
''Call clsAhList.txtText1_KeyPress(KeyAscii)
'''Mfgrd3.Redraw = False
'''If frAhNameList.Visible = False Then
'''    frAhNameList.Visible = True
'''Else
'''    If KeyAscii = vbKeyUp Then
'''        If Mfgrd3.Row > Mfgrd3.FixedRows Then
'''            'Mfgrd3.Row = Mfgrd3.Row - 1
'''            txtAhName.Text = Mfgrd3.TextMatrix(Mfgrd3.Row - 1, X3AHNAME_COL)
'''        Else
'''            If lstAHRecset.BOF = False And lstAHRecset.RecordCount > 0 Then
'''                lstAHRecset.MovePrevious
'''                If lstAHRecset.BOF = True Then lstAHRecset.MoveFirst
'''                If lstAHRecset.BOF = False Then
'''                    txtAhName.Text = lstAHRecset.Fields(X3AHNAME_COL)
'''                End If
'''            End If
'''        End If
'''        KeyAscii = 0
'''    ElseIf KeyAscii = vbKeyDown Then
'''        If Mfgrd3.Row < Mfgrd3.Rows - 2 Then
'''            'Mfgrd3.Row = Mfgrd3.Row + 1
'''            txtAhName.Text = Mfgrd3.TextMatrix(Mfgrd3.Row + 1, X3AHNAME_COL)
'''        Else
'''            If lstAHRecset.EOF = False And lstAHRecset.RecordCount > 0 Then
'''                lstAHRecset.MoveNext
'''                If lstAHRecset.EOF = True Then lstAHRecset.MoveLast
'''                If lstAHRecset.EOF = False Then
'''                    txtAhName.Text = lstAHRecset.Fields(X3AHNAME_COL)
'''                End If
'''            End If
'''        End If
'''        KeyAscii = 0
'''    ElseIf KeyAscii = vbKeyHome Then
'''        If lstAHRecset.RecordCount > 0 Then
'''            lstAHRecset.MoveFirst
'''            txtAhName.Text = lstAHRecset.Fields(X3AHNAME_COL)
'''        End If
'''        'Mfgrd3.Row = Mfgrd3.FixedRows
'''        KeyAscii = 0
'''        Call Mfgrd3_RowColChange
'''    ElseIf KeyAscii = vbKeyEnd Then
'''        If lstAHRecset.RecordCount > 0 Then
'''            lstAHRecset.MoveLast
'''            txtAhName.Text = lstAHRecset.Fields(X3AHNAME_COL)
'''        End If
'''        'Mfgrd3.Row = Mfgrd3.Rows - 1
'''        KeyAscii = 0
'''        Call Mfgrd3_RowColChange
'''    End If
'''End If
'''Mfgrd3.Refresh
'''Mfgrd3.Redraw = True
''
''End Sub

'Private Sub txtAhName_KeyDown(KeyCode As Integer, Shift As Integer)
'MsgBox CStr(LastKeyPressed) & "txtahname_keydown"
'If KeyCode = 13 Then Call txtAhName_Validate(False)
'End Sub

Private Sub txtAhName_LostFocus()
If LastKeyPressed = 13 Then
    If txtDrCrFlag.Text = "Dr" Then
        mskDrAmt.SetFocus
    ElseIf txtDrCrFlag.Text = "Cr" Then
        mskCrAmt.SetFocus
    End If
End If

End Sub

Private Sub dcmbAhName_Validate(Cancel As Boolean)
MsgBox dcmbAhname.BoundText
If Val(dcmbAhname.BoundText) < 1 Then
    Call AlertBox("Invalid Account Head Name !!!")
    dcmbAhname.SetFocus
    Cancel = True
Else
    'MsgBox CStr(LastKeyPressed) & "txtahname_validate"
    If LastKeyPressed = 13 Then
        If txtDrCrFlag.Text = "Dr" Then
            mskDrAmt.SetFocus
        ElseIf txtDrCrFlag.Text = "Cr" Then
            mskCrAmt.SetFocus
        End If
    End If
End If
Call ValidDtl
End Sub

Private Sub txtDrCrFlag_Change()
If dtlAddEditMode = True Then
    txtDrCrFlag.Text = ToDrCrFlag(txtDrCrFlag.Text)
    Call SelectText(txtDrCrFlag)
End If
End Sub

Private Sub txtDrCrFlag_GotFocus()
Call SelectText(txtDrCrFlag)
End Sub

Private Sub txtDrCrFlag_Validate(Cancel As Boolean)
txtDrCrFlag.Text = ToDrCrFlag(txtDrCrFlag.Text)
If txtDrCrFlag.Text = "Dr" And UnMyNumFmt(mskCrAmt.Text, True) <> 0 Then
    mskDrAmt.Text = mskCrAmt.Text
    mskCrAmt.Text = "0.00"
ElseIf txtDrCrFlag.Text = "Cr" And UnMyNumFmt(mskDrAmt.Text, True) <> 0 Then
    mskCrAmt.Text = mskDrAmt.Text
    mskDrAmt.Text = "0.00"
End If

Call ValidDtl
End Sub

Private Sub txtJrnNarr_GotFocus()
Call SelectText(txtJrnNarr)
End Sub
