VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmCreditLimitDtl 
   Appearance      =   0  'Flat
   BackColor       =   &H00FFFFFF&
   ClientHeight    =   11340
   ClientLeft      =   60
   ClientTop       =   60
   ClientWidth     =   15240
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
   ScaleHeight     =   11340
   ScaleWidth      =   15240
   ShowInTaskbar   =   0   'False
   Begin VB.TextBox txtVoid 
      CausesValidation=   0   'False
      Height          =   375
      Left            =   0
      TabIndex        =   17
      TabStop         =   0   'False
      Text            =   "Void"
      Top             =   11040
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
      TabIndex        =   22
      TabStop         =   0   'False
      Top             =   0
      UseMaskColor    =   -1  'True
      Width           =   255
   End
   Begin VB.CommandButton cmdFormEscape 
      Appearance      =   0  'Flat
      Cancel          =   -1  'True
      Caption         =   "X"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
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
      TabIndex        =   21
      TabStop         =   0   'False
      Top             =   0
      Width           =   255
   End
   Begin VB.ComboBox cmbFormEntryMode 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   315
      ItemData        =   "CrLmtDtl.frx":0000
      Left            =   0
      List            =   "CrLmtDtl.frx":000D
      Style           =   1  'Simple Combo
      TabIndex        =   20
      TabStop         =   0   'False
      Text            =   "cmbFormEntryMode"
      Top             =   480
      Visible         =   0   'False
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
      Height          =   10215
      Left            =   120
      TabIndex        =   19
      Top             =   840
      Width           =   14895
      Begin VB.TextBox txtSigName 
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
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Index           =   1
         Left            =   6000
         MaxLength       =   50
         TabIndex        =   9
         Text            =   "SigName"
         Top             =   2640
         Width           =   2415
      End
      Begin VB.TextBox txtPgmName 
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
         Index           =   1
         Left            =   600
         MaxLength       =   50
         TabIndex        =   7
         Text            =   "PgmName"
         Top             =   2640
         Width           =   2415
      End
      Begin VB.TextBox txtPrtName 
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
         Index           =   1
         Left            =   3000
         MaxLength       =   50
         TabIndex        =   8
         Text            =   "PrtName"
         Top             =   2640
         Width           =   3015
      End
      Begin VB.TextBox mskCldPerDaysLimit 
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
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   13560
         TabIndex        =   13
         Tag             =   "AhCode"
         Text            =   "PerDaysLimit"
         Top             =   2640
         Width           =   735
      End
      Begin VB.TextBox mskCldMaxCountLimit 
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
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   12840
         TabIndex        =   12
         Tag             =   "AhCode"
         Text            =   "MaxCountLimit"
         Top             =   2640
         Width           =   735
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
         Left            =   13440
         Style           =   1  'Graphical
         TabIndex        =   14
         Top             =   3000
         Width           =   735
      End
      Begin VB.TextBox mskCldSno 
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
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   120
         TabIndex        =   6
         Tag             =   "AhCode"
         Text            =   "1)"
         Top             =   2640
         Width           =   495
      End
      Begin VB.Frame frHeader 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   1335
         Left            =   120
         TabIndex        =   23
         Top             =   240
         Width           =   14655
         Begin VB.CommandButton cmdShow 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
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
            Left            =   13080
            Style           =   1  'Graphical
            TabIndex        =   4
            Top             =   600
            Width           =   735
         End
         Begin VB.TextBox txtSimName 
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
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Index           =   0
            Left            =   9840
            MaxLength       =   50
            TabIndex        =   3
            Text            =   "SimName"
            Top             =   600
            Width           =   3015
         End
         Begin VB.TextBox txtSigName 
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
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Index           =   0
            Left            =   6360
            MaxLength       =   50
            TabIndex        =   2
            Text            =   "SigName"
            Top             =   600
            Width           =   3375
         End
         Begin VB.TextBox txtPrtName 
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
            Index           =   0
            Left            =   3240
            MaxLength       =   50
            TabIndex        =   1
            Text            =   "PrtName"
            Top             =   600
            Width           =   3015
         End
         Begin VB.TextBox txtPgmName 
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
            Index           =   0
            Left            =   120
            MaxLength       =   50
            TabIndex        =   0
            Text            =   "PgmName"
            Top             =   600
            Width           =   3015
         End
         Begin VB.TextBox txtOpgRemark 
            Appearance      =   0  'Flat
            BorderStyle     =   0  'None
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
            Left            =   7320
            MaxLength       =   50
            TabIndex        =   16
            TabStop         =   0   'False
            Top             =   3720
            Width           =   4455
         End
         Begin VB.TextBox txtFDigName 
            Appearance      =   0  'Flat
            BorderStyle     =   0  'None
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
            Left            =   2040
            MaxLength       =   50
            TabIndex        =   15
            TabStop         =   0   'False
            Top             =   3720
            Width           =   3975
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Item Name:"
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
            Height          =   285
            Index           =   9
            Left            =   9840
            TabIndex        =   27
            Top             =   240
            Width           =   1935
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Item Group:"
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
            Height          =   285
            Index           =   8
            Left            =   6360
            TabIndex        =   26
            Top             =   240
            Width           =   1935
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Party Name:"
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
            Height          =   285
            Index           =   0
            Left            =   3240
            TabIndex        =   25
            Top             =   240
            Width           =   1935
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Party Group:"
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
            Height          =   285
            Index           =   1
            Left            =   120
            TabIndex        =   24
            Top             =   240
            Width           =   1935
         End
         Begin VB.Shape Shape1 
            BackColor       =   &H00FFFF80&
            BackStyle       =   1  'Opaque
            Height          =   1335
            Index           =   2
            Left            =   0
            Top             =   0
            Width           =   14655
         End
      End
      Begin VB.TextBox txtSimName 
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
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Index           =   1
         Left            =   8400
         MaxLength       =   50
         TabIndex        =   10
         Text            =   "SimName"
         Top             =   2640
         Width           =   3015
      End
      Begin VB.TextBox mskCldMaxAmtLimit 
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
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   11400
         TabIndex        =   11
         Text            =   "MaxAmtLimit"
         Top             =   2640
         Width           =   1455
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd2 
         Height          =   8415
         Left            =   120
         TabIndex        =   5
         Top             =   1560
         Width           =   14655
         _ExtentX        =   25850
         _ExtentY        =   14843
         _Version        =   393216
         RowHeightMin    =   285
         HighLight       =   2
         SelectionMode   =   1
         Appearance      =   0
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
   End
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Credit Limit Detail"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   14.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   495
      Left            =   0
      TabIndex        =   18
      Top             =   0
      Width           =   9015
   End
End
Attribute VB_Name = "frmCreditLimitDtl"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Dim mFormLoaded As Boolean, mLastKeyPressed As Integer, mMaskKeyPressed As Integer
Dim mFormSysVchType As Integer, mFormVchTypeList As String, mPurCode As Long, mPurStkCode As Long, mQryPrtCode As Long, dtlAddEditMode As Boolean, dtlAddMode As Boolean, dtlEditCanceled As Boolean
Dim mRemoteAccess As Boolean, mEntrySaved As Boolean, mEntryAborted As Boolean
Dim dbCtnDatabase As New ADODB.Connection, dbComDatabase As New ADODB.Connection
Dim datRecset As New ADODB.Recordset
Dim mPurCode_old As Long, mPurStkCode_old As Long, mPurPrtCode_old As Long, mPurDate_old As Date, mPurVtmCode_old As Long, mPurVchNo_old As Long, mPurTime_old As Long
Dim mPurSimCode_old As Long, mPurItmCode_old As Long, mPurItrCode_old As Long, mPurSimRefNo_old As String, mPurAmtBefDisc_old As Double, mPurDiscPer_old As Double, mPurAmtBefTax_old As Double, mPurTaxPer_old As Double
Dim mPuhAmount_old As Double
Dim clsCLD As clsCtnMasterEntry
Dim mActiveControl As Object, clsListStru As clsSelectQueryStructure
Dim fcmbPgmName As clsCtnFlexSearch, fcmbPrtName As clsCtnFlexSearch, fcmbSigName As clsCtnFlexSearch, fcmbSimName As clsCtnFlexSearch

Rem credit limit column definitions
Const X2CLDICODE_COL = 0
Const X2CLDSNO_COL = 1
Const X2PGMNAME_COL = 2
Const X2PRTNAME_COL = 3
Const X2SIGNAME_COL = 4
Const X2SIMNAME_COL = 5
Const X2CLDMAXAMTLIMIT_COL = 6
Const X2CLDMAXCOUNTLIMIT_COL = 7
Const X2CLDPERDAYSLIMIT_COL = 8
Const X2CLDREMARK_COL = 9
Const X2CLDPGMCODE_COL = 10
Const X2CLDPRTCODE_COL = 11
Const X2CLDSIGCODE_COL = 12
Const X2CLDSIMCODE_COL = 13
Const X2CLDRECSTATE_COL = 14
Const MFGRD2_COLS = 15

Private Sub cmdFormEnter_Click()
mLastKeyPressed = 13
If TypeOf Screen.ActiveControl Is MSFlexGrid Then
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

If dtlAddEditMode = True Then
    dtlEditCanceled = True
    Call cmdOK_Click
Else
    If Me.ActiveControl.Name = Mfgrd2.Name Then
        txtPgmName(0).SetFocus
    Else
        txtVoid.SetFocus
        If CanExit() = True Then
            Unload Me
            Exit Sub
        Else
            txtPgmName(0).SetFocus
        End If
    End If
End If

End Sub

Private Sub cmdOK_Click()
Dim tRecset As New ADODB.Recordset, srow As Integer, mCldICode As Long

srow = Mfgrd2.Row
mCldICode = Val(Mfgrd2.TextMatrix(srow, X2CLDICODE_COL))

If cmdOK.Caption = "&OK" And dtlEditCanceled = False Then
    Rem updating values in table
    With clsCLD
    If dtlAddMode = True Then
        .Clear
    Else
        .GetData mCldICode
    End If
    .mCldPgmCode_lng = Val(fcmbPgmName.BoundText)
    .mCldPrtCode_lng = Val(fcmbPrtName.BoundText)
    .mCldSigCode_lng = Val(fcmbSigName.BoundText)
    .mCldSimCode_lng = Val(fcmbSimName.BoundText)
    .mCldRemark_str = ""
    .mCldMaxAmtLimit_dbl = Val(UnMyNumFmt(mskCldMaxAmtLimit.Text))
    .mCldMaxCountLimit_int = Val(UnMyNumFmt(mskCldMaxCountLimit.Text))
    .mCldPerDaysLimit_int = Val(UnMyNumFmt(mskCldPerDaysLimit.Text))
    
    If dtlAddMode = True Then
        If .AddNew() = True Then
            mCldICode = .mCode_lng
        End If
    Else
        .Update mCldICode
    End If
    End With
    If mCldICode > 0 Then
        clsCLD.UpdateMast mCldICode
    Else
        clsCLD.CancelMast mCldICode
    End If
    clsCLD.EndMast mCldICode
    
    RefreshDatabase dbCtnDatabase
    With tRecset
    
    .Open "Select * from (((CrLimitDtl cld" _
        & " left join PartyGrpMst pgm on cld.CldPgmCode = pgm.PgmCode)" _
        & " left join PartyMast prt on cld.CldPrtCode = prt.PrtCode)" _
        & " left join SubItmGrpMst sig on cld.CldSigCode = sig.SigCode)" _
        & " left join SubItmMast sim on cld.CldSimCode = sim.SimCode" _
        & " where CldICode = " & CStr(mCldICode) _
        & " order by CldICode", dbCtnDatabase, adOpenKeyset, adLockOptimistic
    
    Mfgrd2.TextMatrix(srow, X2CLDICODE_COL) = .fields("CldICode")
    Mfgrd2.TextMatrix(srow, X2CLDSNO_COL) = ToMyNumFmt(srow, mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2PGMNAME_COL) = NoneZero1(.fields("PgmName"), "")
    Mfgrd2.TextMatrix(srow, X2PRTNAME_COL) = NoneZero1(.fields("PrtName"), "")
    Mfgrd2.TextMatrix(srow, X2SIGNAME_COL) = NoneZero1(.fields("SigName"), "")
    Mfgrd2.TextMatrix(srow, X2SIMNAME_COL) = NoneZero1(.fields("SimName"), "")
    Mfgrd2.TextMatrix(srow, X2CLDMAXAMTLIMIT_COL) = ToMyNumFmt(.fields("CldMaxAmtLimit"))
    Mfgrd2.TextMatrix(srow, X2CLDMAXCOUNTLIMIT_COL) = ToMyNumFmt(.fields("CldMaxCountLimit"), mDecimals:=-1)
    Mfgrd2.TextMatrix(srow, X2CLDPERDAYSLIMIT_COL) = ToMyNumFmt(.fields("CldPerDaysLimit"), mDecimals:=-1)
    Mfgrd2.TextMatrix(srow, X2CLDREMARK_COL) = .fields("CldRemark")
    Mfgrd2.TextMatrix(srow, X2CLDPGMCODE_COL) = .fields("CldPgmCode")
    Mfgrd2.TextMatrix(srow, X2CLDPRTCODE_COL) = .fields("CldPrtCode")
    Mfgrd2.TextMatrix(srow, X2CLDSIGCODE_COL) = .fields("CldSigCode")
    Mfgrd2.TextMatrix(srow, X2CLDSIMCODE_COL) = .fields("CldSimCode")
    Mfgrd2.TextMatrix(srow, X2CLDRECSTATE_COL) = .fields("CldRecState")
    
    End With
    CloseTable tRecset
    
    If dtlAddMode = True Then
        Mfgrd2.Rows = Mfgrd2.Rows + 1
    End If
    srow = srow + 1
    Mfgrd2.Row = srow
Else
    If dtlEditCanceled = False Then
        clsCLD.CancelMast mCldICode
    Else
        Rem clsCLD.CancelMast mCldICode     may create problem if stoped the time of mfgrd2_keypress event
    End If
    clsCLD.EndMast mCldICode
End If
dtlAddEditMode = False
dtlAddMode = False
dtlEditCanceled = False
VisibleControls False
Mfgrd2.SetFocus
CloseTable tRecset, mCheckOpen:=True
Rem need to be refreshed after VisibleControls
Call RefreshHdrList

End Sub

Private Sub cmdShow_Click()
Call ShowDtlData
Mfgrd2.SetFocus
End Sub

Private Sub cmdShow_GotFocus()
FlashActiveControl cmdShow, True
End Sub

Private Sub cmdShow_LostFocus()
FlashActiveControl cmdShow, False
End Sub

Private Sub Form_Activate()
If mFormLoaded = False Then
    If mRemoteAccess = True Then
'''        MoveRecToFirst datRecset
'''        ShowRecActiveFlexRow datRecset, Mfgrd1
'''        Mfgrd1.SetFocus
'''        If mPurCode = 0 Then
'''            Call Data_AddEvent
'''        Else
'''            Call Data_EditEvent
'''        End If
    Else
'''        MoveRecToFirst datRecset
'''        ShowRecActiveFlexRow datRecset, Mfgrd1
'''        Mfgrd1.SetFocus
        txtVoid.SetFocus
        Call RefreshHdrList
        txtPgmName(0).SetFocus
    End If
    
Else
    RefreshDatabase dbCtnDatabase
    
End If

mFormLoaded = True
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
mLastKeyPressed = KeyCode
mMaskKeyPressed = Shift
Select Case KeyCode
Case vbKeyPageDown
'''    If FormAddEditMode <> cFORM_SMRYMODE Then
'''        Call cmdSaveForm_GotFocus
'''    End If
End Select

End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
mLastKeyPressed = KeyAscii

End Sub

Public Sub Form_Load()
Dim colcnt As Integer

mFormLoaded = False
SetFormSize Me, frmMain
Call Form_Resize

Call SetVoidControl(txtVoid)

OpenCtnDataSource dbCtnDatabase
OpenComDataSource dbComDatabase

Set clsListStru = New clsSelectQueryStructure

Set clsCLD = New clsCtnMasterEntry
Set clsCLD.dbCtnDatabase = dbCtnDatabase
clsCLD.blnCrLimitDtlMast = True
clsCLD.Init

Set fcmbPgmName = New clsCtnFlexSearch
Set fcmbPgmName.dbCtnDatabase = dbCtnDatabase
Set fcmbPgmName.dbComDatabase = dbComDatabase
fcmbPgmName.blnPartyGrpMastList = True
fcmbPgmName.Init

Set fcmbPrtName = New clsCtnFlexSearch
Set fcmbPrtName.dbCtnDatabase = dbCtnDatabase
Set fcmbPrtName.dbComDatabase = dbComDatabase
fcmbPrtName.blnPartyMastList = True
fcmbPrtName.Init

Set fcmbSigName = New clsCtnFlexSearch
Set fcmbSigName.dbCtnDatabase = dbCtnDatabase
Set fcmbSigName.dbComDatabase = dbComDatabase
fcmbSigName.blnSubItmGrpMastList = True
fcmbSigName.Init

Set fcmbSimName = New clsCtnFlexSearch
Set fcmbSimName.dbCtnDatabase = dbCtnDatabase
Set fcmbSimName.dbComDatabase = dbComDatabase
fcmbSimName.blnSubItmMastList = True
fcmbSimName.Init

Mfgrd2.FixedRows = 1: Mfgrd2.FixedCols = 0: Mfgrd2.Rows = 2: Mfgrd2.Cols = MFGRD2_COLS: SetGridAutoHeight Mfgrd2

colcnt = X2CLDICODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2CLDICODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2CLDSNO_COL: Mfgrd2.ColWidth(colcnt) = mskCldSno.Width: Mfgrd2.TextMatrix(0, colcnt) = "Sno": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2PGMNAME_COL: Mfgrd2.ColWidth(colcnt) = txtPgmName(1).Width: Mfgrd2.TextMatrix(0, colcnt) = "Party Group Name": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2PRTNAME_COL: Mfgrd2.ColWidth(colcnt) = txtPrtName(1).Width: Mfgrd2.TextMatrix(0, colcnt) = "Party Name": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2SIGNAME_COL: Mfgrd2.ColWidth(colcnt) = txtSigName(1).Width: Mfgrd2.TextMatrix(0, colcnt) = "Item Group Name": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SIMNAME_COL: Mfgrd2.ColWidth(colcnt) = txtSimName(1).Width: Mfgrd2.TextMatrix(0, colcnt) = "Item Name": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2CLDMAXAMTLIMIT_COL: Mfgrd2.ColWidth(colcnt) = mskCldMaxAmtLimit.Width: Mfgrd2.TextMatrix(0, colcnt) = "Amount": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2CLDMAXCOUNTLIMIT_COL: Mfgrd2.ColWidth(colcnt) = mskCldMaxCountLimit.Width: Mfgrd2.TextMatrix(0, colcnt) = "Count": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2CLDPERDAYSLIMIT_COL: Mfgrd2.ColWidth(colcnt) = mskCldPerDaysLimit.Width: Mfgrd2.TextMatrix(0, colcnt) = "Days": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2CLDREMARK_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "Remark": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2CLDPGMCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2CLDPGMCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2CLDPRTCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2CLDPRTCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2CLDSIGCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2CLDSIGCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2CLDSIMCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2CLDSIMCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2CLDRECSTATE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2CLDRECSTATE_COL": Mfgrd2.ColAlignment(colcnt) = 7
' -----------------
colcnt = X2CLDSNO_COL: mskCldSno.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2PGMNAME_COL: txtPgmName(1).Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2PRTNAME_COL: txtPrtName(1).Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2SIGNAME_COL: txtSigName(1).Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2SIMNAME_COL: txtSimName(1).Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2CLDMAXAMTLIMIT_COL: mskCldMaxAmtLimit.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2CLDMAXCOUNTLIMIT_COL: mskCldMaxCountLimit.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2CLDPERDAYSLIMIT_COL: mskCldPerDaysLimit.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
cmdOK.Left = mskCldPerDaysLimit.Left + mskCldPerDaysLimit.Width - cmdOK.Width

VisibleControls False

End Sub

Private Sub Form_Resize()
lblFormHeading.Width = Me.Width
cmdFormEscape.Left = Me.Width - (cmdFormEscape.Width * 2)
cmdFormEnter.Left = Me.Width + cmdFormEscape.Width
frFormDtl.Left = (Me.Width - frFormDtl.Width) / 2: frFormDtl.Top = cmbFormEntryMode.Top + cmbFormEntryMode.Height + 10

End Sub

Private Sub Form_Unload(Cancel As Integer)
Set clsCLD = Nothing
Set fcmbPgmName = Nothing
Set fcmbPrtName = Nothing
Set fcmbSigName = Nothing
Set fcmbSimName = Nothing
Set clsListStru = Nothing

CloseDataSource dbCtnDatabase
CloseDataSource dbComDatabase
mFormSysVchType = 0
End Sub

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
Dim srow As Integer, mCldICode As Long, mDeleteit As Boolean

srow = Mfgrd2.Row
mCldICode = Val(Mfgrd2.TextMatrix(srow, X2CLDICODE_COL))

If MyDeleteKey(Shift, KeyCode, mCheckCtrlMask:=False) = True And mCldICode > 0 Then
    txtVoid.SetFocus
    If clsCLD.CanDeleteMast(mCldICode) = True Then
        If clsCLD.BeginMast(mCldICode) = True Then
            clsCLD.DeleteMast mCldICode
            clsCLD.UpdateMast mCldICode
            clsCLD.EndMast mCldICode
            
            Rem ShowDtlData mPurCode
            RemoveFlexRow Mfgrd2, srow
        End If
        Mfgrd2.Row = srow
        Mfgrd2.SetFocus
        Call Mfgrd2_RowColChange
    Else
        Mfgrd2.SetFocus
    End If
End If

End Sub

Private Sub Mfgrd2_KeyPress(KeyAscii As Integer)
Dim srow As Integer

If KeyAscii = vbKeyReturn Then
    srow = Mfgrd2.Row
    
    dtlAddEditMode = True
    dtlAddMode = IsFlexNewRow(Mfgrd2, srow)
    VisibleControls True, Mfgrd2.Top + Mfgrd2.RowPos(Mfgrd2.Row)
    If dtlAddMode = True Then
        If clsCLD.BeginMast(0) = False Then
            GoTo StopEdit
            Exit Sub
        End If
        mskCldSno.Text = ToMyNumFmt(FlexNextSeqno(Mfgrd2, X2CLDSNO_COL), mDecimals:=0)
    Else
        If clsCLD.BeginMast(Val(Mfgrd2.TextMatrix(srow, X2CLDICODE_COL))) = False Then
            GoTo StopEdit
            Exit Sub
        End If
        mskCldSno.Text = Mfgrd2.TextMatrix(srow, X2CLDSNO_COL)
        fcmbPgmName.BoundText = Mfgrd2.TextMatrix(srow, X2CLDPGMCODE_COL): txtPgmName(1).Text = fcmbPgmName.Text
        fcmbPrtName.BoundText = Mfgrd2.TextMatrix(srow, X2CLDPRTCODE_COL): txtPrtName(1).Text = fcmbPrtName.Text
        fcmbSigName.BoundText = Mfgrd2.TextMatrix(srow, X2CLDSIGCODE_COL): txtSigName(1).Text = fcmbSigName.Text
        fcmbSimName.BoundText = Mfgrd2.TextMatrix(srow, X2CLDSIMCODE_COL): txtSimName(1).Text = fcmbSimName.Text
        mskCldMaxAmtLimit.Text = Mfgrd2.TextMatrix(srow, X2CLDMAXAMTLIMIT_COL)
        mskCldMaxCountLimit.Text = Mfgrd2.TextMatrix(srow, X2CLDMAXCOUNTLIMIT_COL)
        mskCldPerDaysLimit.Text = Mfgrd2.TextMatrix(srow, X2CLDPERDAYSLIMIT_COL)
        
    End If
    txtPgmName(1).SetFocus
    Call ValidDtl
    
End If
Exit Sub

StopEdit:
dtlEditCanceled = True
Call cmdOK_Click
Exit Sub

End Sub

Private Sub Mfgrd2_RowColChange()
ShowActiveFlexRow Mfgrd2
End Sub

Private Sub mskCldMaxAmtLimit_GotFocus()
FlashActiveControl mskCldMaxAmtLimit, True
End Sub

Private Sub mskCldMaxAmtLimit_LostFocus()
FlashActiveControl mskCldMaxAmtLimit, False
End Sub

Private Sub mskCldMaxAmtLimit_Validate(Cancel As Boolean)
mskCldMaxAmtLimit.Text = ToMyNumFmt(mskCldMaxAmtLimit.Text, mUseAbs:=True)
Call ValidDtl

End Sub

Private Sub txtSigName_Change(Index As Integer)
If fcmbSigName.CallFromText_Change = False Then
    fcmbSigName.CallFromText_Change = True
    If InterActiveChange(txtSigName(Index)) = True Then
        fcmbSigName.UserText = Array(txtSigName(Index).Text, txtSigName(Index).SelStart)
        fcmbSigName.Show
        txtSigName(Index).Text = fcmbSigName.Text
        If fcmbSigName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbSigName.CallFromText_Change = False
End If

End Sub

Private Sub txtSigName_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtSigName_Change(Index)
End If

End Sub

Private Sub txtSimName_Change(Index As Integer)
If fcmbSimName.CallFromText_Change = False Then
    fcmbSimName.CallFromText_Change = True
    If InterActiveChange(txtSimName(Index)) = True Then
        fcmbSimName.UserText = Array(txtSimName(Index).Text, txtSimName(Index).SelStart)
        fcmbSimName.Show
        txtSimName(Index).Text = fcmbSimName.Text
        If fcmbSimName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbSimName.CallFromText_Change = False
End If

End Sub

Private Sub txtSimName_GotFocus(Index As Integer)
FlashActiveControl txtSimName(Index), True
End Sub

Private Sub txtSimName_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtSimName_Change(Index)
End If

End Sub

Private Sub txtSimName_LostFocus(Index As Integer)
FlashActiveControl txtSimName(Index), False
End Sub

Private Sub txtSimName_Validate(Index As Integer, Cancel As Boolean)
If Index = 1 Then
    Call ValidDtl
End If

End Sub

Private Sub txtSigName_GotFocus(Index As Integer)
FlashActiveControl txtSigName(Index), True
End Sub

Private Sub txtSigName_LostFocus(Index As Integer)
FlashActiveControl txtSigName(Index), False
End Sub

Private Sub txtSigName_Validate(Index As Integer, Cancel As Boolean)
If Index = 1 Then
    Call ValidDtl
End If

End Sub

Private Sub mskCldMaxCountLimit_GotFocus()
FlashActiveControl mskCldMaxCountLimit, True
End Sub

Private Sub mskCldMaxCountLimit_LostFocus()
FlashActiveControl mskCldMaxCountLimit, False
End Sub

Private Sub mskCldMaxCountLimit_Validate(Cancel As Boolean)
mskCldMaxCountLimit.Text = ToMyNumFmt(mskCldMaxCountLimit.Text, mDecimals:=0, mUseAbs:=True)
Call ValidDtl

End Sub

Private Sub mskCldPerDaysLimit_GotFocus()
FlashActiveControl mskCldPerDaysLimit, True
End Sub

Private Sub mskCldPerDaysLimit_LostFocus()
FlashActiveControl mskCldPerDaysLimit, False
End Sub

Private Sub mskCldPerDaysLimit_Validate(Cancel As Boolean)
mskCldPerDaysLimit.Text = ToMyNumFmt(mskCldPerDaysLimit.Text, mDecimals:=0, mUseAbs:=True)
Call ValidDtl

End Sub

Private Sub txtPrtName_GotFocus(Index As Integer)
FlashActiveControl txtPrtName(Index), True
End Sub

Private Sub txtPrtName_LostFocus(Index As Integer)
FlashActiveControl txtPrtName(Index), False
End Sub

Private Sub txtPrtName_Validate(Index As Integer, Cancel As Boolean)
If Index = 1 Then
    Call ValidDtl
End If

End Sub

Private Sub txtPrtName_Change(Index As Integer)
If fcmbPrtName.CallFromText_Change = False Then
    fcmbPrtName.CallFromText_Change = True
    If InterActiveChange(txtPrtName(Index)) = True Then
        fcmbPrtName.UserText = Array(txtPrtName(Index).Text, txtPrtName(Index).SelStart)
        fcmbPrtName.Show
        txtPrtName(Index).Text = fcmbPrtName.Text
        If fcmbPrtName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbPrtName.CallFromText_Change = False
End If

End Sub

Private Sub txtPrtName_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtPrtName_Change(Index)
End If

End Sub

Private Sub RefreshHdrList()
fcmbPgmName.Text = txtPgmName(0).Text: txtPgmName(0).Text = fcmbPgmName.Text
fcmbPrtName.Text = txtPrtName(0).Text: txtPrtName(0).Text = fcmbPrtName.Text
fcmbSigName.Text = txtSigName(0).Text: txtSigName(0).Text = fcmbSigName.Text
fcmbSimName.Text = txtSimName(0).Text: txtSimName(0).Text = fcmbSimName.Text

End Sub

Private Sub ShowDtlData()
Dim srow As Integer, tRecset As New ADODB.Recordset, mColCnt As Integer
Dim mPgmCode As Long, mPrtCode As Long, mSigCode As Long, mSimCode As Long

srow = 1
Mfgrd2.Rows = 2

Call RefreshHdrList
mPgmCode = Val(fcmbPgmName.BoundText)
mPrtCode = Val(fcmbPrtName.BoundText)
mSigCode = Val(fcmbSigName.BoundText)
mSimCode = Val(fcmbSimName.BoundText)

With tRecset
.Open "Select * from (((CrLimitDtl cld" _
    & " left join PartyGrpMst pgm on cld.CldPgmCode = pgm.PgmCode)" _
    & " left join PartyMast prt on cld.CldPrtCode = prt.PrtCode)" _
    & " left join SubItmGrpMst sig on cld.CldSigCode = sig.SigCode)" _
    & " left join SubItmMast sim on cld.CldSimCode = sim.SimCode" _
    & " where 0 = 0 " _
    & IIf(mPgmCode > 0, " and CldPgmCode = " & CStr(mPgmCode), "") _
    & IIf(mPrtCode > 0, " and CldPrtCode = " & CStr(mPrtCode), "") _
    & IIf(mSigCode > 0, " and CldSigCode = " & CStr(mSigCode), "") _
    & IIf(mSimCode > 0, " and CldSimCode = " & CStr(mSimCode), "") _
    & " order by CldICode", dbCtnDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Do While .EOF = False
        If InList(.fields("CldRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
            Mfgrd2.TextMatrix(srow, X2CLDICODE_COL) = .fields("CldICode")
            Mfgrd2.TextMatrix(srow, X2CLDSNO_COL) = ToMyNumFmt(srow, mDecimals:=0)
            Mfgrd2.TextMatrix(srow, X2PGMNAME_COL) = NoneZero1(.fields("PgmName"), "")
            Mfgrd2.TextMatrix(srow, X2PRTNAME_COL) = NoneZero1(.fields("PrtName"), "")
            Mfgrd2.TextMatrix(srow, X2SIGNAME_COL) = NoneZero1(.fields("SigName"), "")
            Mfgrd2.TextMatrix(srow, X2SIMNAME_COL) = NoneZero1(.fields("SimName"), "")
            Mfgrd2.TextMatrix(srow, X2CLDMAXAMTLIMIT_COL) = ToMyNumFmt(.fields("CldMaxAmtLimit"))
            Mfgrd2.TextMatrix(srow, X2CLDMAXCOUNTLIMIT_COL) = ToMyNumFmt(.fields("CldMaxCountLimit"), mDecimals:=-1)
            Mfgrd2.TextMatrix(srow, X2CLDPERDAYSLIMIT_COL) = ToMyNumFmt(.fields("CldPerDaysLimit"), mDecimals:=-1)
            Mfgrd2.TextMatrix(srow, X2CLDREMARK_COL) = .fields("CldRemark")
            Mfgrd2.TextMatrix(srow, X2CLDPGMCODE_COL) = .fields("CldPgmCode")
            Mfgrd2.TextMatrix(srow, X2CLDPRTCODE_COL) = .fields("CldPrtCode")
            Mfgrd2.TextMatrix(srow, X2CLDSIGCODE_COL) = .fields("CldSigCode")
            Mfgrd2.TextMatrix(srow, X2CLDSIMCODE_COL) = .fields("CldSimCode")
            Mfgrd2.TextMatrix(srow, X2CLDRECSTATE_COL) = .fields("CldRecState")
            
            Mfgrd2.Rows = Mfgrd2.Rows + 1
            srow = srow + 1
        Else
            If InList(.fields("CldRecState"), Array(cREC_CANCELED, cREC_DELETED)) = False Then
                ErrorBox Me.Name & "_ShowDtlData_#2316_[Invalid Record Status]"
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

Private Sub txtPgmName_Change(Index As Integer)
If fcmbPgmName.CallFromText_Change = False Then
    fcmbPgmName.CallFromText_Change = True
    If InterActiveChange(txtPgmName(Index)) = True Then
        fcmbPgmName.UserText = Array(txtPgmName(Index).Text, txtPgmName(Index).SelStart)
        fcmbPgmName.Show
        txtPgmName(Index).Text = fcmbPgmName.Text
        If fcmbPgmName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbPgmName.CallFromText_Change = False
End If

End Sub

Private Sub txtPgmName_GotFocus(Index As Integer)
FlashActiveControl txtPgmName(Index), True
End Sub

Private Sub txtPgmName_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtPgmName_Change(Index)
End If

End Sub

Private Sub txtPgmName_LostFocus(Index As Integer)
FlashActiveControl txtPgmName(Index), False
End Sub

Private Sub txtPgmName_Validate(Index As Integer, Cancel As Boolean)
If Index = 1 Then
    Call ValidDtl
End If

End Sub

Private Sub VisibleControls(ByVal mShowItem As Boolean, Optional ByVal mRowPos)
Rem Important - dtlAddEditMode & dtlAddMode must be initialised prior to this
If Me.Visible = True Then
    txtVoid.SetFocus
End If
If IsMissing(mRowPos) = False Then
    mskCldSno.Top = mRowPos
    txtPgmName(1).Top = mRowPos
    txtPrtName(1).Top = mRowPos
    txtSigName(1).Top = mRowPos
    txtSimName(1).Top = mRowPos
    mskCldMaxAmtLimit.Top = mRowPos
    mskCldMaxCountLimit.Top = mRowPos
    mskCldPerDaysLimit.Top = mRowPos
    cmdOK.Top = mRowPos + mskCldPerDaysLimit.Height
End If

mskCldSno.Text = 0
txtPgmName(1).Text = "": fcmbPgmName.BoundText = ""
txtPrtName(1).Text = "": fcmbPrtName.BoundText = ""
txtSigName(1).Text = "": fcmbSigName.BoundText = ""
txtSimName(1).Text = "": fcmbSimName.BoundText = ""
mskCldMaxAmtLimit.Text = ToMyNumFmt(0)
mskCldMaxCountLimit.Text = ToMyNumFmt(0, mDecimals:=0)
mskCldPerDaysLimit.Text = ToMyNumFmt(0, mDecimals:=0)

Call ValidDtl

mskCldSno.Visible = mShowItem
txtPgmName(1).Visible = mShowItem
txtPrtName(1).Visible = mShowItem
txtSigName(1).Visible = mShowItem
txtSimName(1).Visible = mShowItem
mskCldMaxAmtLimit.Visible = mShowItem
mskCldMaxCountLimit.Visible = mShowItem
mskCldPerDaysLimit.Visible = mShowItem
cmdOK.Visible = mShowItem

frHeader.Enabled = (mShowItem = False)
Mfgrd2.Enabled = (mShowItem = False)

End Sub

Private Sub ValidDtl()
Dim mDataOk As Boolean, srow As Integer

srow = Mfgrd2.Row
mDataOk = (Val(UnMyNumFmt(mskCldSno.Text)) > 0 And (Val(fcmbPgmName.BoundText) > 0 Or Val(fcmbPrtName.BoundText) > 0 Or Val(fcmbSigName.BoundText) > 0 Or Val(fcmbSimName.BoundText) > 0))
If mDataOk = True Then
    mDataOk = (ChkIsDuplCreditLimit() = False)
End If
cmdOK.Caption = IIf(mDataOk = True, "&OK", "&Cancel")
cmdOK.BackColor = IIf(mDataOk = True, &H80FF80, &H8080FF)
End Sub

Private Function ChkIsDuplCreditLimit() As Boolean
Dim tRecset As New ADODB.Recordset

ChkIsDuplCreditLimit = False
With tRecset
.Open "Select * from CrLimitDtl where CldPgmCode = " & CStr(Val(fcmbPgmName.BoundText)) & " and CldPrtCode = " & CStr(Val(fcmbPrtName.BoundText)) & " and CldSigCode = " & CStr(Val(fcmbSigName.BoundText)) & " and CldSimCode = " & CStr(Val(fcmbSimName.BoundText)) & " and CldICode <> " & Val(Mfgrd2.TextMatrix(Mfgrd2.Row, X2CLDICODE_COL)) & " order by CldICode", dbCtnDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    If Me.ActiveControl.Name = cmdOK.Name Then
        ErrorBox "Duplicate Entry !!!"
    End If
    ChkIsDuplCreditLimit = True
End If
End With
CloseTable tRecset

End Function



Rem ---------------------------------------------- end of form -------------------------------------------------
