VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmDiagnosticMast 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   ClientHeight    =   9090
   ClientLeft      =   60
   ClientTop       =   60
   ClientWidth     =   13485
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
   LockControls    =   -1  'True
   ScaleHeight     =   9090
   ScaleWidth      =   13485
   ShowInTaskbar   =   0   'False
   Begin VB.TextBox txtVoid 
      CausesValidation=   0   'False
      Height          =   375
      Left            =   120
      TabIndex        =   9
      TabStop         =   0   'False
      Text            =   "Void"
      Top             =   8520
      Width           =   375
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
      TabIndex        =   15
      TabStop         =   0   'False
      Top             =   0
      UseMaskColor    =   -1  'True
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
      TabIndex        =   14
      TabStop         =   0   'False
      Top             =   0
      Width           =   255
   End
   Begin VB.ComboBox cmbFormEntryMode 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
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
      ItemData        =   "DiagMast.frx":0000
      Left            =   0
      List            =   "DiagMast.frx":000D
      Style           =   1  'Simple Combo
      TabIndex        =   13
      TabStop         =   0   'False
      Text            =   "cmbFormMode"
      Top             =   360
      Width           =   1455
   End
   Begin VB.Frame frFormDtl 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Detail"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   5955
      Left            =   240
      TabIndex        =   12
      Top             =   1080
      Width           =   10515
      Begin VB.TextBox txtSrvName 
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
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   1020
         MaxLength       =   50
         TabIndex        =   4
         Text            =   "SrvName"
         Top             =   2580
         Width           =   5175
      End
      Begin VB.TextBox mskDsmUnit 
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
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   6180
         TabIndex        =   5
         Tag             =   "AhCode"
         Text            =   "DsmUnit"
         Top             =   2580
         Width           =   1275
      End
      Begin VB.TextBox mskDsmSno 
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
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   540
         TabIndex        =   3
         Tag             =   "AhCode"
         Text            =   "1)"
         Top             =   2580
         Width           =   495
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
         Left            =   8880
         Style           =   1  'Graphical
         TabIndex        =   7
         Top             =   2580
         Width           =   795
      End
      Begin VB.TextBox mskDsmRate 
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
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   7440
         TabIndex        =   6
         Tag             =   "AhCode"
         Text            =   "DsmRate"
         Top             =   2580
         Width           =   1455
      End
      Begin VB.Frame frHeader 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   1755
         Left            =   540
         TabIndex        =   20
         Top             =   240
         Width           =   9375
         Begin VB.TextBox mskFormBoundField 
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
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   2160
            TabIndex        =   0
            Tag             =   "AhCode"
            Text            =   "-1"
            Top             =   480
            Width           =   1335
         End
         Begin VB.TextBox txtDigName 
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
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   2160
            MaxLength       =   50
            TabIndex        =   1
            Top             =   1080
            Width           =   5295
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Code:"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   255
            Index           =   0
            Left            =   360
            TabIndex        =   22
            Top             =   480
            Width           =   855
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Diagnosis Name:"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   255
            Index           =   0
            Left            =   360
            TabIndex        =   21
            Top             =   1080
            Width           =   1695
         End
      End
      Begin VB.CommandButton cmdSaveForm 
         Appearance      =   0  'Flat
         BackColor       =   &H80000009&
         Caption         =   "      &Save"
         Height          =   375
         Left            =   10140
         Style           =   1  'Graphical
         TabIndex        =   8
         Top             =   5580
         Width           =   375
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd2 
         Height          =   3435
         Left            =   540
         TabIndex        =   2
         Top             =   1980
         Width           =   9375
         _ExtentX        =   16536
         _ExtentY        =   6059
         _Version        =   393216
         RowHeightMin    =   285
         HighLight       =   2
         SelectionMode   =   1
         Appearance      =   0
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
   End
   Begin VB.Frame frFormSmry 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Summary"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   5535
      Left            =   240
      TabIndex        =   11
      Top             =   1320
      Width           =   8655
      Begin VB.TextBox txtList1Col 
         Appearance      =   0  'Flat
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Index           =   0
         Left            =   120
         MousePointer    =   1  'Arrow
         TabIndex        =   18
         TabStop         =   0   'False
         Top             =   1560
         Width           =   1335
      End
      Begin VB.TextBox txtSearch1Text 
         Appearance      =   0  'Flat
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   960
         TabIndex        =   16
         Top             =   360
         Width           =   4215
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd1 
         Height          =   4335
         Left            =   120
         TabIndex        =   17
         Top             =   720
         Width           =   6855
         _ExtentX        =   12091
         _ExtentY        =   7646
         _Version        =   393216
         RowHeightMin    =   315
         FocusRect       =   2
         HighLight       =   2
         SelectionMode   =   1
         Appearance      =   0
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Search:"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   1
         Left            =   120
         TabIndex        =   19
         Top             =   360
         Width           =   735
      End
   End
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Diagnostic Master"
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
Attribute VB_Name = "frmDiagnosticMast"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Dim mFormLoaded As Boolean, mLastKeyPressed As Integer, mMaskKeyPressed As Integer
Dim mDigCode As Long, dtlAddEditMode As Boolean, dtlAddMode As Boolean, dtlEditCanceled As Boolean
Dim mRemoteAccess As Boolean, mEntrySaved As Boolean, mEntryAborted As Boolean
Dim dbHmsDatabase As New ADODB.Connection
Dim datRecset As New ADODB.Recordset
Dim mDigName_old As String, mDsmSrvCode_old As Long
Dim clsDIG As clsHmsMasterEntry, mActiveControl As Object, clsListStru As clsSelectQueryStructure
Dim fcmbSrvName As clsHmsFlexSearch

Rem service unit/rate columns
Const X2DSMICODE_COL = 0
Const X2DSMSNO_COL = 1
Const X2SRVNAME_COL = 2
Const X2DSMUNIT_COL = 3
Const X2DSMRATE_COL = 4
Const X2DSMSRVCODE_COL = 5
Const X2DSMRECSTATE_COL = 6
Const MFGRD2_COLS = 7

Public Property Let RemoteAccessCode(ByVal mAccessCode As Long)
mRemoteAccess = True
mDigCode = mAccessCode
End Property

Public Property Get EntryBoundCode() As Long
EntryBoundCode = Val(mskFormBoundField.Text)
End Property

Public Property Get EntrySaved() As Boolean
EntrySaved = mEntrySaved
End Property

Public Property Get EntryAborted() As Boolean
EntryAborted = mEntryAborted
End Property

Public Property Get DigName() As String
DigName = txtDigName.Text
End Property

Public Property Get FormAddEditMode() As Integer
FormAddEditMode = cmbFormEntryMode.ListIndex
End Property

Public Property Let FormAddEditMode(ByVal New_FormEntryMode As Integer)
cmbFormEntryMode.ListIndex = New_FormEntryMode
ChkEntryModeSign cmbFormEntryMode

End Property

Public Property Get SecuMenuName() As String
SecuMenuName = Me.Name
End Property

Private Sub cmdFormEnter_Click()
mLastKeyPressed = 13
If FormAddEditMode = cFORM_SMRYMODE Then
    With datRecset
    If .EOF = False And .BOF = False Then
        Call Data_EditEvent
    Else
        Call Data_AddEvent
    End If
    End With
ElseIf TypeOf Screen.ActiveControl Is MSFlexGrid Then
    If Screen.ActiveControl.Name = Mfgrd2.Name Then
        Mfgrd2_KeyPress vbKeyReturn
    End If
Else
    SendKeys "{tab}"
End If

End Sub

Private Sub cmdFormEscape_Click()
Dim srow As Long, mRecAbsPos As Long
mLastKeyPressed = 27
If FormAddEditMode = cFORM_SMRYMODE Then
    If Len(txtSearch1Text.Text) > 0 Then
        txtSearch1Text.Text = ""
        Call txtSearch1Text_InterActiveChange
    Else
        Unload Me
    End If
ElseIf dtlAddEditMode = True Then
    dtlEditCanceled = True
    Call cmdOK_Click
Else
    txtVoid.SetFocus
    If CanReject() = True Then
        mEntryAborted = True
        mRecAbsPos = datRecset.AbsolutePosition
        Call Data_CancelEvent
        Call SmryList
        If datRecset.RecordCount > mRecAbsPos And mRecAbsPos > 0 Then
            datRecset.Move mRecAbsPos - 1, Start:=1
        Else
            MoveRecToLast datRecset
        End If
        ShowRecActiveFlexRow datRecset, Mfgrd1
        
        Call ShowEntryMode(False)
        If mRemoteAccess = True Then
            Me.Hide
            ''Unload Me
            Exit Sub
        Else
            Mfgrd1.SetFocus
        End If
    Else
        txtDigName.SetFocus
    End If
End If

End Sub

Private Sub cmdOK_Click()
Dim tRecset As ADODB.Recordset, srow As Integer, mDsmICode As Long

srow = Mfgrd2.Row
mDsmICode = Val(Mfgrd2.TextMatrix(srow, X2DSMICODE_COL))

Call ValidDtl
If cmdOK.Caption = "&OK" And dtlEditCanceled = False Then
    Mfgrd2.TextMatrix(srow, X2DSMICODE_COL) = mDsmICode
    Mfgrd2.TextMatrix(srow, X2DSMSNO_COL) = mskDsmSno.Text
    Mfgrd2.TextMatrix(srow, X2SRVNAME_COL) = fcmbSrvName.Text
    Mfgrd2.TextMatrix(srow, X2DSMUNIT_COL) = mskDsmUnit.Text
    Mfgrd2.TextMatrix(srow, X2DSMRATE_COL) = mskDsmRate.Text
    Mfgrd2.TextMatrix(srow, X2DSMSRVCODE_COL) = Val(fcmbSrvName.BoundText)
    Mfgrd2.TextMatrix(srow, X2DSMRECSTATE_COL) = ChkEditRecStatus(Val(Mfgrd2.TextMatrix(srow, X2DSMRECSTATE_COL)))
    
    If dtlAddMode = True Then
        Mfgrd2.Rows = Mfgrd2.Rows + 1
    End If
    srow = srow + 1
    Mfgrd2.Row = srow
End If
dtlAddEditMode = False
dtlAddMode = False
dtlEditCanceled = False
VisibleControls False
Mfgrd2.SetFocus
If Not tRecset Is Nothing Then
    CloseTable tRecset, mCheckOpen:=True
End If

End Sub

Private Sub cmdSaveForm_Click()
Call Data_SaveEvent

Call SmryList
txtSearch1Text_InterActiveChange txtDigName.Text

''datRecset.Find "DigName='" & txtDigName.Text & "'", Start:=1
''ShowRecActiveFlexRow datRecset, Mfgrd1

Call ShowEntryMode(False)
Mfgrd1.SetFocus

End Sub

Private Sub cmdSaveForm_GotFocus()
txtVoid.SetFocus
cmdSaveForm.Enabled = False
If Data_Verify() = True Then
    If CanAccept() = True Then
        Call cmdSaveForm_Click
        If mRemoteAccess = True Then
            Me.Hide
            Exit Sub
        End If
    Else
        txtDigName.SetFocus
    End If
End If
cmdSaveForm.Enabled = True

End Sub

Private Sub Form_Activate()
If mFormLoaded = False Then
    If mRemoteAccess = True Then
        MoveRecToFirst datRecset
        ShowRecActiveFlexRow datRecset, Mfgrd1
        Mfgrd1.SetFocus
        If mDigCode = 0 Then
            Call Data_AddEvent
        Else
            Call Data_EditEvent
        End If
    Else
        MoveRecToFirst datRecset
        ShowRecActiveFlexRow datRecset, Mfgrd1
        Mfgrd1.SetFocus
    End If
Else
    
End If

mFormLoaded = True
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
mLastKeyPressed = KeyCode
mMaskKeyPressed = Shift
Select Case KeyCode
Case vbKeyPageDown
    If FormAddEditMode <> cFORM_SMRYMODE And dtlAddEditMode = False Then
        Call cmdSaveForm_GotFocus
    End If
End Select

End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
mLastKeyPressed = KeyAscii

End Sub

Private Sub Form_Load()
Dim colcnt As Integer
mFormLoaded = False
mEntrySaved = False: mEntryAborted = False
SetFormSize Me, frmMain
Call Form_Resize

Call SetVoidControl(txtVoid)
txtSearch1Text.Enabled = False

OpenHmsDataSource dbHmsDatabase

Set clsDIG = New clsHmsMasterEntry
Set clsDIG.dbHmsDatabase = dbHmsDatabase
clsDIG.blnDiagMast = True
clsDIG.Init

Set fcmbSrvName = New clsHmsFlexSearch
Set fcmbSrvName.dbHmsDatabase = dbHmsDatabase
fcmbSrvName.blnServMastList = True
fcmbSrvName.Init

Set clsListStru = New clsSelectQueryStructure

If mRemoteAccess = True Then
    datRecset.open "Select * from DiagMast where DigCode = " & CStr(mDigCode) & " order by DigName", dbHmsDatabase, adOpenKeyset, adLockOptimistic
Else
    datRecset.open "Select * from DiagMast order by DigName", dbHmsDatabase, adOpenKeyset, adLockOptimistic
End If
Call SmryList

Mfgrd2.FixedRows = 1: Mfgrd2.FixedCols = 0: Mfgrd2.Rows = 2: Mfgrd2.Cols = MFGRD2_COLS: SetGridAutoHeight Mfgrd2

colcnt = X2DSMICODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2DSMICODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2DSMSNO_COL: Mfgrd2.ColWidth(colcnt) = mskDsmSno.Width: Mfgrd2.TextMatrix(0, colcnt) = "Sno": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SRVNAME_COL: Mfgrd2.ColWidth(colcnt) = txtSrvName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Service Name": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2DSMUNIT_COL: Mfgrd2.ColWidth(colcnt) = mskDsmUnit.Width: Mfgrd2.TextMatrix(0, colcnt) = "Unit": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2DSMRATE_COL: Mfgrd2.ColWidth(colcnt) = mskDsmRate.Width: Mfgrd2.TextMatrix(0, colcnt) = "Rate": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2DSMSRVCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2DSMSRVCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2DSMRECSTATE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2DSMRECSTATE_COL": Mfgrd2.ColAlignment(colcnt) = 7
' -----------------
colcnt = X2DSMSNO_COL: mskDsmSno.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2SRVNAME_COL: txtSrvName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2DSMUNIT_COL: mskDsmUnit.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2DSMRATE_COL: mskDsmRate.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
cmdOK.Left = mskDsmRate.Left + mskDsmRate.Width

ShowEntryMode False
VisibleControls False

End Sub

Private Sub Form_Resize()
lblFormHeading.Width = Me.Width
cmdFormEscape.Left = Me.Width - (cmdFormEscape.Width * 2)
cmdFormEnter.Left = Me.Width + cmdFormEscape.Width
frFormSmry.Left = (Me.Width - frFormSmry.Width) / 2: frFormSmry.Top = cmbFormEntryMode.Top + (cmbFormEntryMode.Height * 2)
frFormDtl.Left = (Me.Width - frFormDtl.Width) / 2: frFormDtl.Top = frFormSmry.Top

End Sub

Private Sub Form_Unload(Cancel As Integer)
Set clsDIG = Nothing
Set fcmbSrvName = Nothing
Set clsListStru = Nothing

CloseTable datRecset
CloseDataSource dbHmsDatabase
End Sub

Private Sub ShowEntryMode(ByVal EntryMode As Boolean)
If Me.Visible = True Then
    txtVoid.SetFocus
End If
frFormSmry.Visible = Not EntryMode: frFormSmry.Enabled = Not EntryMode
frFormDtl.Visible = EntryMode: frFormDtl.Enabled = EntryMode
frHeader.Visible = EntryMode: frHeader.Enabled = EntryMode
cmdSaveForm.Enabled = EntryMode
If EntryMode = False Then
    FormAddEditMode = cFORM_SMRYMODE
End If

End Sub

Private Sub VisibleControls(ByVal mShowItem As Boolean, Optional ByVal mRowPos)
If Me.Visible = True Then
    txtVoid.SetFocus
End If
If IsMissing(mRowPos) = False Then
    mskDsmSno.Top = mRowPos
    txtSrvName.Top = mRowPos
    mskDsmUnit.Top = mRowPos
    mskDsmRate.Top = mRowPos
    cmdOK.Top = mRowPos
End If

mskDsmSno.Text = 0
txtSrvName.Text = "": fcmbSrvName.BoundText = ""
mskDsmUnit.Text = ToMyNumFmt(0, mDecimals:=0)
mskDsmRate.Text = ToMyNumFmt(0)

Call ValidDtl

mskDsmSno.Visible = mShowItem
txtSrvName.Visible = mShowItem
mskDsmUnit.Visible = mShowItem
mskDsmRate.Visible = mShowItem
cmdOK.Visible = mShowItem

frHeader.Enabled = (mShowItem = False)
Mfgrd2.Enabled = (mShowItem = False)
cmdSaveForm.Enabled = (mShowItem = False)

End Sub

Private Sub ValidDtl()
Dim mDataOk As Boolean, srow As Integer

srow = Mfgrd2.Row
mDataOk = (Val(UnMyNumFmt(mskDsmSno.Text)) > 0 And Val(fcmbSrvName.BoundText) > 0 And Val(UnMyNumFmt(mskDsmUnit.Text)) >= 0 And Val(UnMyNumFmt(mskDsmRate.Text)) >= 0)
If mDataOk = True And Screen.ActiveControl.Name = cmdOK.Name Then
    mDataOk = (ChkNotDuplServ() = True)
End If

cmdOK.Caption = IIf(mDataOk = True, "&OK", "&Cancel")
cmdOK.BackColor = IIf(mDataOk = True, &H80FF80, &H8080FF)
End Sub

Private Function ChkNotDuplServ() As Boolean
Dim mRtnval As Boolean, srow As Integer

mRtnval = True
For srow = 1 To Mfgrd2.Rows - 1
    If srow <> Mfgrd2.Row Then
        If Val(Mfgrd2.TextMatrix(srow, X2DSMSRVCODE_COL)) = Val(fcmbSrvName.BoundText) Then
            ErrorBox "Duplicate Service Exist on Sno." & Mfgrd2.TextMatrix(srow, X2DSMSNO_COL)
            mRtnval = False
            Exit For
        End If
    End If
Next srow
ChkNotDuplServ = mRtnval

End Function

Private Function Data_Verify() As Boolean
Data_Verify = False

If Val(mskFormBoundField.Text) < 1 And FormAddEditMode = cFORM_EDITMODE Then
    ErrorBox "Invalid Key Value !!!"
    txtDigName.SetFocus
    Exit Function
End If
If Trim(txtDigName.Text) = "" Then
    ErrorBox "Invalid Operator Name !!!"
    txtDigName.SetFocus
    Exit Function
End If
If txtDigName.Text <> mDigName_old Then
    If ChkIsDuplicate(dbHmsDatabase, "DiagMast", "DigName", txtDigName.Text, "DigCode", Val(mskFormBoundField.Text)) = True Then
        ErrorBox "Duplicate Input !!!"
        txtDigName.SetFocus
        Exit Function
    End If
End If

Data_Verify = True
End Function

Private Sub Mfgrd2_DblClick()
Mfgrd2_KeyPress vbKeyReturn
End Sub

Private Sub Mfgrd2_GotFocus()
Mfgrd2.Col = FlexLeftVisibleCol(Mfgrd2)
Mfgrd2.LeftCol = FlexLeftVisibleCol(Mfgrd2)
If Mfgrd2.SelectionMode = flexSelectionByRow Then
    Mfgrd2.ColSel = 0: Mfgrd2.ColSel = Mfgrd2.Cols - 1
End If

Rem Call Mfgrd2_RowColChange
End Sub

Private Sub Mfgrd2_KeyDown(KeyCode As Integer, Shift As Integer)
Dim srow As Integer, mDsmICode As Long, mDeleteit As Boolean

srow = Mfgrd2.Row
mDsmICode = Val(Mfgrd2.TextMatrix(srow, X2DSMICODE_COL))

If MyDeleteKey(Shift, KeyCode, mCheckCtrlMask:=False) = True And srow < FlexNewRow(Mfgrd2) Then
    txtVoid.SetFocus
    mDeleteit = True
    If mDeleteit = True Then
        mDeleteit = CanDelete()
    End If
    If mDeleteit = True Then
        RemoveFlexRow Mfgrd2, srow
        
        Mfgrd2.Row = srow
        Mfgrd2.SetFocus
        Call Mfgrd2_RowColChange
    End If
End If

End Sub

Private Sub Mfgrd2_KeyPress(KeyAscii As Integer)
Dim srow As Integer, ary1 As Variant

If KeyAscii = vbKeyReturn Then
    srow = Mfgrd2.Row
    
    dtlAddEditMode = True
    dtlAddMode = IsFlexNewRow(Mfgrd2, srow)
    VisibleControls True, Mfgrd2.Top + Mfgrd2.RowPos(Mfgrd2.Row)
    
    If dtlAddMode = True Then
        mskDsmSno.Text = ToMyNumFmt(FlexNextSeqno(Mfgrd2, X2DSMSNO_COL), mDecimals:=0)
        mskDsmUnit.Text = ToMyNumFmt(1, mDecimals:=0)
    Else
        mskDsmSno.Text = Mfgrd2.TextMatrix(srow, X2DSMSNO_COL)
        fcmbSrvName.BoundText = Mfgrd2.TextMatrix(srow, X2DSMSRVCODE_COL): txtSrvName.Text = fcmbSrvName.Text
        mskDsmUnit.Text = Mfgrd2.TextMatrix(srow, X2DSMUNIT_COL)
        mskDsmRate.Text = Mfgrd2.TextMatrix(srow, X2DSMRATE_COL)
    End If
    Call ValidDtl
    txtSrvName.SetFocus
    
    mDsmSrvCode_old = Val(fcmbSrvName.BoundText)
End If

End Sub

Private Sub Mfgrd2_RowColChange()
ShowActiveFlexRow Mfgrd2
End Sub

Private Sub mskDsmRate_GotFocus()
FlashActiveControl mskDsmRate, True
End Sub

Private Sub mskDsmRate_LostFocus()
FlashActiveControl mskDsmRate, False
End Sub

Private Sub mskDsmRate_Validate(Cancel As Boolean)
mskDsmRate.Text = ToMyNumFmt(mskDsmRate.Text, mUseAbs:=True)
If Val(UnMyNumFmt(mskDsmRate.Text)) <= 0 Then
    ErrorBox "Invalid Input !!!"
    mskDsmRate.SetFocus
    Cancel = True
End If
Call ValidDtl

End Sub

Private Sub mskDsmSno_GotFocus()
FlashActiveControl mskDsmSno, True
End Sub

Private Sub mskDsmSno_LostFocus()
FlashActiveControl mskDsmSno, False
End Sub

Private Sub mskDsmUnit_GotFocus()
FlashActiveControl mskDsmUnit, True
End Sub

Private Sub mskDsmUnit_LostFocus()
FlashActiveControl mskDsmUnit, False
End Sub

Private Sub mskDsmUnit_Validate(Cancel As Boolean)
mskDsmUnit.Text = ToMyNumFmt(mskDsmUnit.Text, mDecimals:=0, mUseAbs:=True)
If Val(UnMyNumFmt(mskDsmUnit.Text)) <= 0 Then
    ErrorBox "Invalid Input !!!"
    mskDsmUnit.SetFocus
    Cancel = True
End If
Call ValidDtl

End Sub

Private Sub txtDigName_GotFocus()
FlashActiveControl txtDigName, True
End Sub

Private Sub txtDigName_LostFocus()
FlashActiveControl txtDigName, False
End Sub

Private Sub txtDigName_Validate(Cancel As Boolean)
txtDigName.Text = ToMyWord(txtDigName.Text)
If Trim(txtDigName.Text) = "" Then
    ErrorBox "Invalid Input !!!"
    Cancel = True
    txtDigName.SetFocus
Else
    If txtDigName.Text <> mDigName_old Then
        If ChkIsDuplicate(dbHmsDatabase, "DiagMast", "DigName", txtDigName.Text, "DigCode", Val(mskFormBoundField.Text)) = True Then
            ErrorBox "Duplicate Input !!!"
            Cancel = True
            txtDigName.SetFocus
        End If
    End If
End If

End Sub

Private Sub Data_AddEvent()

If CanUserAddOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If clsDIG.BeginMast(0) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_ADDMODE
    
clsDIG.Clear
mDigCode = clsDIG.ActiveCode
mskFormBoundField.Text = mDigCode
txtDigName.Text = ""

ShowDtlData mDigCode

mDigName_old = txtDigName.Text

Call ShowEntryMode(True)
txtDigName.SetFocus

End Sub

Private Sub Data_EditEvent()
Dim mLCount As Integer, mUCount As Integer, mCount As Integer

If CanUserEditOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If clsDIG.BeginMast(datRecset.fields("DigCode")) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_EDITMODE
With datRecset
mDigCode = .fields("DigCode")
clsDIG.GetData mDigCode
mskFormBoundField.Text = CStr(.fields("DigCode"))
txtDigName.Text = .fields("DigName")
End With

ShowDtlData mDigCode

mDigName_old = txtDigName.Text
    
Call ShowEntryMode(True)
txtDigName.SetFocus

End Sub

Private Sub ShowDtlData(ByVal mDsmCode As Long)
Dim srow As Integer, tRecset As ADODB.Recordset, mColCnt As Integer

srow = 1
Mfgrd2.Rows = 2

Set tRecset = dbHmsDatabase.Execute("Select * from DiagSrvMst dsm inner join ServMast srv on dsm.DsmSrvCode = srv.SrvCode where DsmCode = " & CStr(mDsmCode) & " order by DsmSno")
With tRecset
If .EOF = False Then
    Do While .EOF = False
        If InList(.fields("DsmRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
            Mfgrd2.TextMatrix(srow, X2DSMICODE_COL) = .fields("DsmICode")
            Mfgrd2.TextMatrix(srow, X2DSMSNO_COL) = ToMyNumFmt(.fields("DsmSno"), mDecimals:=-1)
            Mfgrd2.TextMatrix(srow, X2SRVNAME_COL) = .fields("SrvName")
            Mfgrd2.TextMatrix(srow, X2DSMUNIT_COL) = ToMyNumFmt(.fields("DsmUnit"), mDecimals:=-1)
            Mfgrd2.TextMatrix(srow, X2DSMRATE_COL) = ToMyNumFmt(.fields("DsmRate"))
            Mfgrd2.TextMatrix(srow, X2DSMSRVCODE_COL) = .fields("DsmSrvCode")
            Mfgrd2.TextMatrix(srow, X2DSMRECSTATE_COL) = .fields("DsmRecState")
            
            Mfgrd2.Rows = Mfgrd2.Rows + 1
            srow = srow + 1
        Else
            If InList(.fields("DsmRecState"), Array(cREC_CANCELED, cREC_DELETED)) = False Then
                ErrorBox Me.Name & "_ShowDtlData_#1061_[Invalid Record Status]"
            End If
        End If
    
        .MoveNext
    Loop
    If srow = 1 Then
        For mColCnt = 0 To Mfgrd2.Cols - 1
            Mfgrd2.TextMatrix(srow, mColCnt) = ""
        Next
    End If
Else
    For mColCnt = 0 To Mfgrd2.Cols - 1
        Mfgrd2.TextMatrix(srow, mColCnt) = ""
    Next
End If
End With
CloseTable tRecset

Rem Call CalcFtrTotal

End Sub

Private Sub Data_SaveEvent()
Dim tRecset As New ADODB.Recordset, srow As Integer, mDsmICode As Long

With clsDIG
If FormAddEditMode = cFORM_ADDMODE Then
    .Clear
Else
    .GetData mDigCode
End If

.mName_str = txtDigName.Text
If FormAddEditMode = cFORM_ADDMODE Then
    .AddNew
    mskFormBoundField.Text = .mCode_lng
Else
    .Update mDigCode
End If
If .mCode_lng > 0 Then   ' updated successfully
    .UpdateMast .mCode_lng
    .EndMast .mCode_lng
    
    Rem updating Service information
    If FormAddEditMode = cFORM_ADDMODE Then
        mDigCode = .mCode_lng
    End If
    dbHmsDatabase.BeginTrans
    dbHmsDatabase.Execute "Update DiagSrvMst set DsmRecState = " & cREC_DELETED & " where DsmCode = " & CStr(mDigCode)
    
    For srow = 1 To Mfgrd2.Rows - 2
        mDsmICode = Val(Mfgrd2.TextMatrix(srow, X2DSMICODE_COL))
        With tRecset
        .open "Select * from DiagSrvMst where DsmICode = " & CStr(mDsmICode) & "", dbHmsDatabase, adOpenKeyset, adLockOptimistic
        If mDsmICode < 1 Then
            .AddNew
            
            Rem .Fields("DsmICode") = AutoNumber
            .fields("DsmCode") = mDigCode
        End If
        .fields("DsmSno") = srow    ' resetting sno as well (if any row deleted)
        
        .fields("DsmSrvCode") = Val(Mfgrd2.TextMatrix(srow, X2DSMSRVCODE_COL))
        .fields("DsmUnit") = UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2DSMUNIT_COL))
        .fields("DsmRate") = UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2DSMRATE_COL))
        .fields("DsmRecState") = cREC_UNCHANGED
        .Update
        End With
        CloseTable tRecset
    Next srow
    dbHmsDatabase.Execute "Delete from DiagSrvMst where DsmCode = " & CStr(mDigCode) & " and DsmRecState = " & cREC_DELETED & ""
    dbHmsDatabase.CommitTrans
    
    mEntrySaved = True
Else
    Call Data_CancelEvent
    ErrorBox "Entry Cancelled !!!"
End If
End With

If Not tRecset Is Nothing Then
    CloseTable tRecset, mCheckOpen:=True
End If

End Sub

Private Sub Data_DeleteEvent()
Dim mDeleteit As Boolean, mRecAbsPos As Long

If CanUserDeleteOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If (datRecset.EOF Or datRecset.BOF) = True Then
    Exit Sub
End If

mDigCode = datRecset.fields("DigCode")
mRecAbsPos = datRecset.AbsolutePosition

If clsDIG.CanDeleteMast(mDigCode) = True Then
    txtVoid.SetFocus
    If clsDIG.BeginMast(mDigCode) = True Then
        clsDIG.DeleteMast mDigCode
        clsDIG.UpdateMast mDigCode
        clsDIG.EndMast mDigCode
        
        dbHmsDatabase.BeginTrans
        dbHmsDatabase.Execute "Delete from DiagSrvMst where DsmCode = " & CStr(mDigCode) & ""
        dbHmsDatabase.CommitTrans
        
        Call SmryList
        If datRecset.RecordCount > mRecAbsPos And mRecAbsPos > 0 Then
            datRecset.Move mRecAbsPos - 1, 1
        Else
            MoveRecToLast datRecset
        End If
    End If
    ShowRecActiveFlexRow datRecset, Mfgrd1
    Mfgrd1.SetFocus
Else
    Mfgrd1.SetFocus
End If

End Sub

Private Sub Data_CancelEvent()
clsDIG.CancelMast mDigCode
clsDIG.EndMast mDigCode
mEntryAborted = True

End Sub

Private Sub SmryList()
Dim gcolcount As Integer, acount As Integer, mLow As Integer, mHigh As Integer, mPos As Integer, srow As Long, mColCount As Integer

clsListStru.Clear

Rem column definitions
clsListStru.AddFields mExpr:="DigCode", mAttrib:=cFAT_SYSTEM
clsListStru.AddFields mExpr:="DigName", mTitle:="Diagnosis Name", mAlign:=1, mWidth:=4000, mShowItem:=True

RefreshDatabase dbHmsDatabase
datRecset.Requery

Mfgrd1.Height = Int(Mfgrd1.Height / Mfgrd1.RowHeightMin) * Mfgrd1.RowHeightMin
Mfgrd1.Cols = clsListStru.UFields + 1
gcolcount = 0
mLow = clsListStru.LFields
mHigh = clsListStru.UFields
For acount = mLow To mHigh
    With Mfgrd1
    .ColAlignment(gcolcount) = clsListStru.Field_Align(acount)
    If clsListStru.Field_Show(acount) = True Then
        .ColWidth(gcolcount) = clsListStru.Field_Width(acount)
    Else
        .ColWidth(gcolcount) = 0
    End If
    .TextMatrix(0, gcolcount) = clsListStru.Field_Title(acount)
    End With
    
    gcolcount = gcolcount + 1
Next acount
If FlexColsWidth(Mfgrd1) > Mfgrd1.Width Then
    Mfgrd1.SelectionMode = flexSelectionFree
Else
    Mfgrd1.SelectionMode = flexSelectionByRow
End If

srow = 1
MoveRecToFirst datRecset
With datRecset
If .RecordCount > 0 Then
    Do While .EOF = False
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("DigCode")) = .fields("DigCode")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("DigName")) = .fields("DigName")
        
        srow = srow + 1
        If Mfgrd1.Rows < srow + 1 Then
            Mfgrd1.Rows = Mfgrd1.Rows + 1
        End If
        
        .MoveNext
    Loop
End If
End With
For mColCount = 0 To Mfgrd1.Cols - 1
    Mfgrd1.TextMatrix(srow, mColCount) = ""
Next mColCount
Mfgrd1.Rows = srow + 1

SetFlexColCursor txtList1Col, Mfgrd1

End Sub

Private Function GetActiveControl() As Boolean
Dim mCnt As Integer

On Error GoTo errhand
GetActiveControl = False
If Screen.ActiveForm.Name = Me.Name Then
    If Screen.ActiveControl.Visible = True And Screen.ActiveControl.Enabled = True Then
        Set mActiveControl = Screen.ActiveControl
        GetActiveControl = True
    End If
End If

errhand:
mCnt = mCnt + 1
If mCnt > 2 Then
    Exit Function
End If

End Function

Private Function SetActiveControl() As Boolean
Dim mCnt As Integer

On Error GoTo errhand
SetActiveControl = False
If Screen.ActiveForm.Name = Me.Name And IsEmpty(mActiveControl) = False Then
    If mActiveControl.Visible = True And mActiveControl.Enabled = True Then
        mActiveControl.SetFocus
        SetActiveControl = True
    End If
End If

errhand:
mCnt = mCnt + 1
If mCnt > 2 Then
    Exit Function
End If

End Function

Private Sub Mfgrd1_DblClick()
Call cmdFormEnter_Click

End Sub

Private Sub Mfgrd1_GotFocus()
Mfgrd1.Col = FlexLeftVisibleCol(Mfgrd1)
Mfgrd1.LeftCol = FlexLeftVisibleCol(Mfgrd1)
If Mfgrd1.SelectionMode = flexSelectionByRow Then
    Mfgrd1.ColSel = 0: Mfgrd1.ColSel = Mfgrd1.Cols - 1
End If
Call Mfgrd1_RowColChange
txtSearch1Text.Text = ""

End Sub

Private Sub Mfgrd1_KeyDown(KeyCode As Integer, Shift As Integer)
If MyAddNewKey(Shift, KeyCode) = True Then
    Call Data_AddEvent
ElseIf MyDeleteKey(Shift, KeyCode) = True Then
    If Mfgrd1.Row < Mfgrd1.Rows - 1 Then
        Call Data_DeleteEvent
    End If
ElseIf Shift = vbCtrlMask And KeyCode = vbKeySpace Then
    Call cmdFormEnter_Click
End If

End Sub

Private Sub Mfgrd1_KeyPress(KeyAscii As Integer)
mLastKeyPressed = KeyAscii
If mMaskKeyPressed = 0 Or mMaskKeyPressed = vbShiftMask Then
    txtSearch1Text.Text = JoinKeyAscii(txtSearch1Text.Text, KeyAscii)
    Call txtSearch1Text_InterActiveChange
End If

End Sub

Private Sub Mfgrd1_RowColChange()
If datRecset.RecordCount > 0 Then
    If datRecset.AbsolutePosition <> Mfgrd1.Row - Mfgrd1.FixedRows + 1 Then
        datRecset.MoveFirst
        datRecset.Move Mfgrd1.Row - Mfgrd1.FixedRows, 1     ' Mfgrd1.Row is already less by one
    End If
End If
ShowFlexColCursor txtList1Col, Mfgrd1, datRecset

End Sub

Private Sub Mfgrd1_Scroll()
ShowFlexColCursor txtList1Col, Mfgrd1, datRecset

End Sub

Private Sub txtSrvName_Change()
If fcmbSrvName.CallFromText_Change = False Then
    fcmbSrvName.CallFromText_Change = True
    If InterActiveChange(txtSrvName) = True Then
        fcmbSrvName.UserText = Array(txtSrvName.Text, txtSrvName.SelStart)
        fcmbSrvName.Show
        txtSrvName.Text = fcmbSrvName.Text
        If fcmbSrvName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbSrvName.CallFromText_Change = False
End If

End Sub

Private Sub txtSrvName_GotFocus()
FlashActiveControl txtSrvName, True
End Sub

Private Sub txtSrvName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtSrvName_Change
End If

End Sub

Private Sub txtSrvName_LostFocus()
FlashActiveControl txtSrvName, False
End Sub

Private Sub txtSrvName_Validate(Cancel As Boolean)
If Trim(txtSrvName.Text) = "" Or Val(fcmbSrvName.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    txtSrvName.SetFocus
    Cancel = True
ElseIf ChkNotDuplServ() = False Then
    txtSrvName.SetFocus
    Cancel = True
End If
Call ValidDtl

End Sub

Private Sub txtList1Col_DblClick(Index As Integer)
Call Mfgrd1_DblClick
End Sub

Private Sub txtList1Col_GotFocus(Index As Integer)
Mfgrd1.SetFocus
End Sub

Private Sub txtSearch1Text_InterActiveChange(Optional ByVal mText)
mText = IIf(IsMissing(mText) = True, txtSearch1Text.Text, mText)
SearchFlex Mfgrd1, clsListStru.GetItemIndex("DigName"), mText
ShowActiveFlexRow Mfgrd1

End Sub

Private Sub txtSearch1Text_GotFocus()
FlashActiveControl txtSearch1Text, True
End Sub

Private Sub txtSearch1Text_LostFocus()
FlashActiveControl txtSearch1Text, False
End Sub


Rem -------------------------------------- end of form --------------------------------------------------

