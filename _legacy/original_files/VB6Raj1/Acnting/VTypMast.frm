VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmVoucherType 
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
   ScaleHeight     =   9090
   ScaleWidth      =   13485
   ShowInTaskbar   =   0   'False
   Begin VB.TextBox txtVoid 
      CausesValidation=   0   'False
      Height          =   375
      Left            =   120
      TabIndex        =   14
      TabStop         =   0   'False
      Text            =   "Void"
      Top             =   8760
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
      TabIndex        =   21
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
      ItemData        =   "VTypMast.frx":0000
      Left            =   0
      List            =   "VTypMast.frx":000D
      Style           =   1  'Simple Combo
      TabIndex        =   18
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
      Height          =   7455
      Left            =   240
      TabIndex        =   17
      Top             =   1200
      Width           =   10095
      Begin VB.ComboBox cmbVtmResetNoBasis 
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
         Left            =   6240
         Style           =   2  'Dropdown List
         TabIndex        =   9
         Top             =   3120
         Width           =   2415
      End
      Begin VB.ComboBox cmbSysType 
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
         Left            =   2880
         Style           =   2  'Dropdown List
         TabIndex        =   3
         Top             =   1560
         Width           =   2535
      End
      Begin VB.CheckBox chkVtmShowInList 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Show in List:"
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
         Left            =   840
         TabIndex        =   12
         Top             =   4200
         Width           =   2175
      End
      Begin VB.TextBox mskVtmIndex 
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
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   2880
         TabIndex        =   11
         Tag             =   "AhCode"
         Text            =   "0"
         Top             =   3840
         Width           =   1215
      End
      Begin VB.TextBox txtVtmComNarr 
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
         Left            =   2880
         MaxLength       =   250
         TabIndex        =   7
         Top             =   2760
         Width           =   5775
      End
      Begin VB.TextBox txtVtmItmNarr 
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
         Left            =   2880
         MaxLength       =   250
         TabIndex        =   6
         Top             =   2400
         Width           =   5775
      End
      Begin VB.TextBox txtVtmPostfix 
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
         Left            =   6840
         MaxLength       =   10
         TabIndex        =   5
         Top             =   2040
         Width           =   1815
      End
      Begin VB.TextBox mskVtmStartNo 
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
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   2880
         TabIndex        =   8
         Tag             =   "AhCode"
         Text            =   "0"
         Top             =   3120
         Width           =   1215
      End
      Begin VB.TextBox txtVtmPrefix 
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
         Left            =   2880
         MaxLength       =   10
         TabIndex        =   4
         Top             =   2040
         Width           =   1815
      End
      Begin VB.TextBox txtVtmAbvr 
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
         Left            =   2880
         MaxLength       =   10
         TabIndex        =   2
         Top             =   1200
         Width           =   1815
      End
      Begin VB.CheckBox chkVtmEditable 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Editable (Vchr.No.):"
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
         Left            =   840
         TabIndex        =   10
         Top             =   3480
         Width           =   2295
      End
      Begin VB.CommandButton cmdSaveForm 
         Appearance      =   0  'Flat
         BackColor       =   &H80000009&
         Caption         =   "      &Save"
         Height          =   255
         Left            =   7680
         Style           =   1  'Graphical
         TabIndex        =   13
         Top             =   6840
         Width           =   375
      End
      Begin VB.TextBox txtVtmName 
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
         Left            =   2880
         MaxLength       =   50
         TabIndex        =   1
         Top             =   840
         Width           =   5775
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
         Left            =   2880
         TabIndex        =   0
         Tag             =   "AhCode"
         Text            =   "-1"
         Top             =   480
         Width           =   1455
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Reset Number Basis:"
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
         Index           =   8
         Left            =   4200
         TabIndex        =   35
         Top             =   3120
         Width           =   2055
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Main Type:"
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
         Index           =   7
         Left            =   840
         TabIndex        =   34
         Top             =   1560
         Width           =   1695
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Index:"
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
         Index           =   6
         Left            =   840
         TabIndex        =   33
         Top             =   3840
         Width           =   1215
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Starting No.:"
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
         Index           =   9
         Left            =   840
         TabIndex        =   32
         Top             =   3120
         Width           =   1215
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Common Narration:"
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
         Index           =   5
         Left            =   840
         TabIndex        =   31
         Top             =   2760
         Width           =   1935
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Item Narration:"
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
         Index           =   4
         Left            =   840
         TabIndex        =   30
         Top             =   2400
         Width           =   1695
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Prefix:"
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
         Index           =   3
         Left            =   840
         TabIndex        =   29
         Top             =   2040
         Width           =   1695
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Abbreviation:"
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
         Index           =   2
         Left            =   840
         TabIndex        =   28
         Top             =   1200
         Width           =   1695
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Postfix:"
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
         Left            =   5880
         TabIndex        =   27
         Top             =   2040
         Width           =   975
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Voucher Name:"
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
         Left            =   840
         TabIndex        =   20
         Top             =   840
         Width           =   1695
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
         Left            =   840
         TabIndex        =   19
         Top             =   480
         Width           =   855
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
      TabIndex        =   16
      Top             =   960
      Width           =   12855
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
         TabIndex        =   25
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
         TabIndex        =   23
         Top             =   360
         Width           =   4215
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd1 
         Height          =   4335
         Left            =   120
         TabIndex        =   24
         Top             =   720
         Width           =   12375
         _ExtentX        =   21828
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
         TabIndex        =   26
         Top             =   360
         Width           =   735
      End
   End
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Voucher Type Master"
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
Attribute VB_Name = "frmVoucherType"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim mFormLoaded As Boolean, mLastKeyPressed As Integer, mMaskKeyPressed As Integer
Dim mVtmCode As Long
Dim mRemoteAccess As Boolean, mEntrySaved As Boolean, mEntryAborted As Boolean
Dim dbAcDatabase As New ADODB.Connection, dbGrpDatabase As New ADODB.Connection, dbComDatabase As New ADODB.Connection
Dim datRecset As New ADODB.Recordset
Dim mVtmName_old As String, mVtmAbvr_old As String, mVtmIndex_old As Integer
Dim clsVTM As clsComMastEntry, mActiveControl As Object, clsListStru As clsSelectQueryStructure

Public Property Let RemoteAccessCode(ByVal mAccessCode As Long)
mRemoteAccess = True
mVtmCode = mAccessCode
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

Public Property Get VtmName() As String
VtmName = txtVtmName.Text
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

Private Sub chkVtmEditable_GotFocus()
FlashActiveControl chkVtmEditable, True
End Sub

Private Sub chkVtmEditable_LostFocus()
FlashActiveControl chkVtmEditable, False
End Sub

Private Sub chkVtmShowInList_GotFocus()
FlashActiveControl chkVtmShowInList, True
End Sub

Private Sub chkVtmShowInList_LostFocus()
FlashActiveControl chkVtmShowInList, False
End Sub

Private Sub cmbSysType_GotFocus()
FlashActiveControl cmbSysType, True
End Sub

Private Sub cmbSysType_LostFocus()
FlashActiveControl cmbSysType, False
End Sub

Private Sub cmbSysType_Validate(Cancel As Boolean)
If cmbSysType.ListIndex < 1 Then
    ErrorBox "Invalid Selection !!!"
    cmbSysType.SetFocus
    Cancel = True
End If

End Sub

Private Sub cmbVtmResetNoBasis_GotFocus()
FlashActiveControl cmbVtmResetNoBasis, True
End Sub

Private Sub cmbVtmResetNoBasis_LostFocus()
FlashActiveControl cmbVtmResetNoBasis, False
End Sub

Private Sub cmbVtmResetNoBasis_Validate(Cancel As Boolean)
If cmbVtmResetNoBasis.ListIndex < 1 Then
    ErrorBox "Invalid Selection !!!"
    cmbVtmResetNoBasis.SetFocus
    Cancel = True
End If

End Sub

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
        txtVtmName.SetFocus
    End If

End If

End Sub

Private Sub cmdSaveForm_Click()
Call Data_SaveEvent

Call SmryList
txtSearch1Text_InterActiveChange txtVtmName.Text

''datRecset.Find "VtmName='" & txtVtmName.Text & "'", Start:=1
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
        txtVtmName.SetFocus
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
        If mVtmCode = 0 Then
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
    If FormAddEditMode <> cFORM_SMRYMODE Then
        Call cmdSaveForm_GotFocus
    End If
End Select

End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
mLastKeyPressed = KeyAscii

End Sub

Private Sub Form_Load()
Dim colcnt As Integer, mTypeCount As Integer, mTypeHigh As Integer
mFormLoaded = False
mEntrySaved = False: mEntryAborted = False
SetFormSize Me, frmMain
Call Form_Resize

Call SetVoidControl(txtVoid)
txtSearch1Text.Enabled = False

OpenAcDataSource dbAcDatabase
OpenGrpDataSource dbGrpDatabase
OpenComDataSource dbComDatabase

Set clsVTM = New clsComMastEntry
Set clsVTM.dbAcDatabase = dbAcDatabase
clsVTM.blnVTypeMast = True
clsVTM.Init

Set clsListStru = New clsSelectQueryStructure

mTypeHigh = clsVType.UFields
cmbSysType.Clear
For mTypeCount = 0 To mTypeHigh
    cmbSysType.AddItem clsVType.Type_Name(mTypeCount) & Space(50) & Format(clsVType.Type_No(mTypeCount), "00000")
Next mTypeCount

cmbVtmResetNoBasis.Clear
cmbVtmResetNoBasis.AddItem "N/A" & Space(50) & Format(cVTYPE_RESETNO_NA, "00000")
cmbVtmResetNoBasis.AddItem "Yearly" & Space(50) & Format(cVTYPE_RESETNO_YEARLY, "00000")
cmbVtmResetNoBasis.AddItem "Monthly" & Space(50) & Format(cVTYPE_RESETNO_MONTHLY, "00000")
cmbVtmResetNoBasis.AddItem "Daily" & Space(50) & Format(cVTYPE_RESETNO_DAILY, "00000")
cmbVtmResetNoBasis.AddItem "Never" & Space(50) & Format(cVTYPE_RESETNO_NEVER, "00000")

If mRemoteAccess = True Then
    datRecset.open "Select * from VTypMast where VtmCode=" & CStr(mVtmCode) & " order by VtmName", dbAcDatabase, adOpenKeyset, adLockOptimistic
Else
    datRecset.open "Select * from VTypMast order by VtmName", dbAcDatabase, adOpenKeyset, adLockOptimistic
End If
Call SmryList

Call ShowEntryMode(False)

End Sub

Private Sub Form_Resize()
lblFormHeading.Width = Me.Width
cmdFormEscape.Left = Me.Width - (cmdFormEscape.Width * 2)
cmdFormEnter.Left = Me.Width + cmdFormEscape.Width
frFormSmry.Left = (Me.Width - frFormSmry.Width) / 2: frFormSmry.Top = cmbFormEntryMode.Top + (cmbFormEntryMode.Height * 2)
frFormDtl.Left = (Me.Width - frFormDtl.Width) / 2: frFormDtl.Top = frFormSmry.Top

End Sub

Private Sub Form_Unload(Cancel As Integer)
Set clsVTM = Nothing
Set clsListStru = Nothing

CloseTable datRecset
CloseDataSource dbAcDatabase
CloseDataSource dbGrpDatabase
CloseDataSource dbComDatabase
End Sub

Private Sub ShowEntryMode(ByVal EntryMode As Boolean)
If Me.Visible = True Then
    txtVoid.SetFocus
End If
frFormSmry.Visible = Not EntryMode: frFormSmry.Enabled = Not EntryMode
frFormDtl.Visible = EntryMode: frFormDtl.Enabled = EntryMode
cmdSaveForm.Enabled = EntryMode
If EntryMode = False Then
    FormAddEditMode = cFORM_SMRYMODE
End If

End Sub

Private Function Data_Verify() As Boolean
Dim tRecset As New ADODB.Recordset

Data_Verify = False
If Val(mskFormBoundField.Text) < 1 Then
    ErrorBox "Invalid Key Value !!!"
    txtVtmName.SetFocus
    GoTo EndSub
End If
If Trim(txtVtmName.Text) = "" Then
    ErrorBox "Invalid Input !!!"
    txtVtmName.SetFocus
    GoTo EndSub
End If
If txtVtmName.Text <> mVtmName_old Then
    If ChkIsDuplicate(dbAcDatabase, "VTypMast", "VtmName", txtVtmName.Text, "VtmCode", Val(mskFormBoundField.Text)) = True Then
        ErrorBox "Duplicate Input !!!"
        txtVtmName.SetFocus
        GoTo EndSub
    End If
End If
If Trim(txtVtmAbvr.Text) = "" Then
    ErrorBox "Invalid Input !!!"
    txtVtmAbvr.SetFocus
    GoTo EndSub
Else
    If txtVtmAbvr.Text <> mVtmAbvr_old Then
        If ChkIsDuplicate(dbAcDatabase, "VTypMast", "VtmAbvr", txtVtmAbvr.Text, "VtmCode", Val(mskFormBoundField.Text)) = True Then
            ErrorBox "Duplicate Input !!!"
            txtVtmAbvr.SetFocus
            GoTo EndSub
        End If
    End If
End If
If cmbSysType.ListIndex < 1 Then
    ErrorBox "Invalid Selection !!!"
    cmbSysType.SetFocus
    GoTo EndSub
End If
If cmbVtmResetNoBasis.ListIndex < 1 Then
    ErrorBox "Invalid Selection !!!"
    cmbVtmResetNoBasis.SetFocus
    GoTo EndSub
End If
If Val(mskVtmIndex.Text) < 0 Then
    ErrorBox "Invalid Index !!!"
    mskVtmIndex.SetFocus
    GoTo EndSub
Else
    With tRecset
    .open "Select VtmCode from VTypMast order by VtmCode", dbAcDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount < Val(mskVtmIndex.Text) Or Val(mskVtmIndex.Text) = 0 Then
        mskVtmIndex.Text = CStr(.RecordCount + IIf(FormAddEditMode = cFORM_ADDMODE, 1, 0))
    End If
    End With
    CloseTable tRecset
End If
If Val(UnMyNumFmt(mskVtmStartNo.Text)) < 1 Then
    ErrorBox "Invalid Starting No. !!!"
    mskVtmStartNo.SetFocus
    GoTo EndSub
End If

Data_Verify = True

EndSub:
CloseTable tRecset, mCheckOpen:=True
Exit Function

End Function

Private Sub mskVtmStartNo_GotFocus()
FlashActiveControl mskVtmStartNo, True
End Sub

Private Sub mskVtmStartNo_LostFocus()
FlashActiveControl mskVtmStartNo, False
End Sub

Private Sub mskVtmStartNo_Validate(Cancel As Boolean)
mskVtmStartNo.Text = ToMyNumFmt(mskVtmStartNo.Text, mDecimals:=0, mUseAbs:=True, mGroupedDigit:=False)
If Val(UnMyNumFmt(mskVtmStartNo.Text)) < 1 Then
    ErrorBox "Invalid Starting No. !!!"
    mskVtmStartNo.SetFocus
    Cancel = True
End If

End Sub

Private Sub mskVtmIndex_GotFocus()
FlashActiveControl mskVtmIndex, True
End Sub

Private Sub mskVtmIndex_LostFocus()
FlashActiveControl mskVtmIndex, False
End Sub

Private Sub mskVtmIndex_Validate(Cancel As Boolean)
Dim tRecset As New ADODB.Recordset

mskVtmIndex.Text = ToMyNumFmt(mskVtmIndex.Text, mDecimals:=0, mUseAbs:=True, mGroupedDigit:=False)
If Val(mskVtmIndex.Text) < 0 Then
    ErrorBox "Invalid Index !!!"
    mskVtmIndex.SetFocus
    Cancel = True
Else
    With tRecset
    .open "Select VtmCode from VTypMast order by VtmCode", dbAcDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount < Val(mskVtmIndex.Text) Or Val(mskVtmIndex.Text) = 0 Then
        mskVtmIndex.Text = CStr(.RecordCount + IIf(FormAddEditMode = cFORM_ADDMODE, 1, 0))
    End If
    End With
    CloseTable tRecset
End If

CloseTable tRecset, mCheckOpen:=True

End Sub

Private Sub txtVtmAbvr_GotFocus()
FlashActiveControl txtVtmAbvr, True
End Sub

Private Sub txtVtmAbvr_LostFocus()
FlashActiveControl txtVtmAbvr, False
End Sub

Private Sub txtVtmAbvr_Validate(Cancel As Boolean)
txtVtmAbvr.Text = ToMyWord(txtVtmAbvr.Text)
If Trim(txtVtmAbvr.Text) = "" Then
    ErrorBox "Invalid Input !!!"
    Cancel = True
    txtVtmAbvr.SetFocus
Else
    If txtVtmAbvr.Text <> mVtmAbvr_old Then
        If ChkIsDuplicate(dbAcDatabase, "VTypMast", "VtmAbvr", txtVtmAbvr.Text, "VtmCode", Val(mskFormBoundField.Text)) = True Then
            ErrorBox "Duplicate Input !!!"
            Cancel = True
            txtVtmAbvr.SetFocus
        End If
    End If
End If

End Sub

Private Sub txtVtmComNarr_GotFocus()
FlashActiveControl txtVtmComNarr, True
End Sub

Private Sub txtVtmComNarr_LostFocus()
FlashActiveControl txtVtmComNarr, False
End Sub

Private Sub txtVtmItmNarr_GotFocus()
FlashActiveControl txtVtmItmNarr, True
End Sub

Private Sub txtVtmItmNarr_LostFocus()
FlashActiveControl txtVtmItmNarr, False
End Sub

Private Sub txtVtmPostfix_GotFocus()
FlashActiveControl txtVtmPostfix, True
End Sub

Private Sub txtVtmPostfix_LostFocus()
FlashActiveControl txtVtmPostfix, False
End Sub

Private Sub txtVtmPrefix_GotFocus()
FlashActiveControl txtVtmPrefix, True
End Sub

Private Sub txtVtmPrefix_LostFocus()
FlashActiveControl txtVtmPrefix, False
End Sub

Private Sub txtVtmName_GotFocus()
FlashActiveControl txtVtmName, True
End Sub

Private Sub txtVtmName_LostFocus()
FlashActiveControl txtVtmName, False
End Sub

Private Sub txtVtmName_Validate(Cancel As Boolean)
txtVtmName.Text = ToMyWord(txtVtmName.Text)
If Trim(txtVtmName.Text) = "" Then
    ErrorBox "Invalid Input !!!"
    Cancel = True
    txtVtmName.SetFocus
Else
    If txtVtmName.Text <> mVtmName_old Then
        If ChkIsDuplicate(dbAcDatabase, "VTypMast", "VtmName", txtVtmName.Text, "VtmCode", Val(mskFormBoundField.Text)) = True Then
            ErrorBox "Duplicate Input !!!"
            Cancel = True
            txtVtmName.SetFocus
        End If
    End If
End If

End Sub

Private Sub Data_AddEvent()

If CanUserAddOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If clsVTM.BeginMast(0) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_ADDMODE
    
clsVTM.Clear
mVtmCode = clsVTM.ActiveCode
mskFormBoundField.Text = mVtmCode
txtVtmName.Text = ""
txtVtmAbvr.Text = ""
cmbSysType.ListIndex = 0
cmbVtmResetNoBasis.ListIndex = cVTYPE_RESETNO_YEARLY
txtVtmPrefix.Text = ""
txtVtmPostfix.Text = ""
txtVtmItmNarr.Text = ""
txtVtmComNarr.Text = ""
chkVtmEditable.Value = vbChecked
mskVtmStartNo.Text = 1
mskVtmIndex.Text = 0
chkVtmShowInList.Value = vbChecked

mVtmName_old = txtVtmName.Text
mVtmAbvr_old = txtVtmAbvr.Text
mVtmIndex_old = Val(mskVtmIndex.Text)

Call ShowEntryMode(True)
txtVtmName.SetFocus

End Sub

Private Sub Data_EditEvent()
Dim mLCount As Integer, mUCount As Integer, mCount As Integer

If CanUserEditOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If clsVTM.BeginMast(datRecset.fields("VtmCode")) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_EDITMODE
With datRecset
mVtmCode = .fields("VtmCode")
clsVTM.GetData mVtmCode
mskFormBoundField.Text = CStr(.fields("VtmCode"))
txtVtmName.Text = .fields("VtmName")
txtVtmAbvr.Text = .fields("VtmAbvr")
cmbSysType.ListIndex = clsVType.GetItemIndexByNo(.fields("VtmSysCode"))
cmbVtmResetNoBasis.ListIndex = .fields("VtmResetNoBasis")
txtVtmPrefix.Text = .fields("VtmPrefix")
txtVtmPostfix.Text = .fields("VtmPostfix")
txtVtmItmNarr.Text = .fields("VtmItmNarr")
txtVtmComNarr.Text = .fields("VtmComNarr")
chkVtmEditable.Value = IIf(.fields("VtmEditable") = True, vbChecked, vbUnchecked)
mskVtmStartNo.Text = .fields("VtmStartNo")  ' format conversion not reqd
mskVtmIndex.Text = .fields("VtmIndex")
chkVtmShowInList.Value = IIf(.fields("VtmShowInList") = True, vbChecked, vbUnchecked)
End With

mVtmName_old = txtVtmName.Text
mVtmAbvr_old = txtVtmAbvr.Text
mVtmIndex_old = Val(mskVtmIndex.Text)

Call ShowEntryMode(True)
txtVtmName.SetFocus

End Sub

Private Sub Data_SaveEvent()
Dim tRecset As New ADODB.Recordset

With clsVTM
If FormAddEditMode = cFORM_ADDMODE Then
    .Clear
Else
    .GetData mVtmCode
End If
.mName_str = txtVtmName.Text
.mVtmAbvr_str = txtVtmAbvr.Text
.mVtmSysCode_int = Val(Right(cmbSysType.List(cmbSysType.ListIndex), 5))
.mVtmResetNoBasis_int = cmbVtmResetNoBasis.ListIndex
.mVtmPrefix_str = txtVtmPrefix.Text
.mVtmPostfix_str = txtVtmPostfix.Text
.mVtmItmNarr_str = txtVtmItmNarr.Text
.mVtmComNarr_str = txtVtmComNarr.Text
.mVtmEditable_bln = (chkVtmEditable.Value = vbChecked)
.mVtmStartNo_lng = Val(UnMyNumFmt(mskVtmStartNo.Text))
.mVtmIndex_int = Val(UnMyNumFmt(mskVtmIndex.Text))
.mVtmShowInList_bln = (chkVtmShowInList.Value = vbChecked)

If FormAddEditMode = cFORM_ADDMODE Then
    .AddNew
    mskFormBoundField.Text = .mCode_lng
Else
    .Update mVtmCode
End If
If .mCode_lng > 0 Then   ' updated successfully
    .UpdateMast .mCode_lng
    .EndMast .mCode_lng
    mEntrySaved = True
    
    Rem re-ordering index order if index order changed
    RefreshDatabase dbAcDatabase
    dbAcDatabase.BeginTrans
    tRecset.open "Select * from VTypMast where VtmCode<>" & CStr(.mCode_lng) & " and VtmIndex=" & .mVtmIndex_int & "", dbAcDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.RecordCount > 0 Then
        If FormAddEditMode = cFORM_ADDMODE Then
            tRecset.fields("VtmIndex") = tRecset.RecordCount
        Else
            tRecset.fields("VtmIndex") = mVtmIndex_old
        End If
        tRecset.Update
    End If
    dbAcDatabase.CommitTrans
    CloseTable tRecset
Else
    Call Data_CancelEvent
    ErrorBox "Entry Cancelled !!!"
End If

End With

CloseTable tRecset, mCheckOpen:=True
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

mVtmCode = datRecset.fields("VtmCode")
mRecAbsPos = datRecset.AbsolutePosition

If clsVTM.CanDeleteMast(mVtmCode) = True Then
    txtVoid.SetFocus
    If clsVTM.BeginMast(mVtmCode) = True Then
        clsVTM.GetData mVtmCode
        
        clsVTM.DeleteMast mVtmCode
        clsVTM.UpdateMast mVtmCode
        clsVTM.EndMast mVtmCode
        
        dbAcDatabase.BeginTrans
        dbAcDatabase.Execute "Update VTypMast set VtmIndex=VtmIndex-1 where VtmIndex>=" & CStr(clsVTM.mVtmIndex_int) & " and VtmCode<>" & CStr(mVtmCode) & ""
        dbAcDatabase.CommitTrans
        
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
clsVTM.CancelMast mVtmCode
clsVTM.EndMast mVtmCode
mEntryAborted = True

End Sub

Private Sub SmryList()
Dim gcolcount As Integer, acount As Integer, mLow As Integer, mHigh As Integer, mPos As Integer, srow As Long, mColCount As Integer

clsListStru.Clear

Rem column definitions
clsListStru.AddFields mExpr:="VtmCode", mAttrib:=cFAT_SYSTEM
clsListStru.AddFields mExpr:="VtmName", mTitle:="Voucher Name", mAlign:=1, mWidth:=4000, mShowItem:=True
clsListStru.AddFields mExpr:="VtmSysType", mTitle:="Main Type", mAlign:=1, mWidth:=2500, mShowItem:=True
clsListStru.AddFields mExpr:="VtmIndex", mTitle:="Index", mAlign:=7, mWidth:=1000, mShowItem:=True
clsListStru.AddFields mExpr:="VtmShowInList", mTitle:="Show List", mAlign:=1, mWidth:=1000, mShowItem:=True

RefreshDatabase dbAcDatabase
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
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("VtmCode")) = .fields("VtmCode")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("VtmName")) = .fields("VtmName")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("VtmSysType")) = clsVType.GetItemNameByNo(.fields("VtmSysCode"))
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("VtmIndex")) = .fields("VtmIndex")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("VtmShowInList")) = IIf(.fields("VtmShowInList") = True, "Yes", "No")
        
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

Private Sub txtList1Col_DblClick(Index As Integer)
Call Mfgrd1_DblClick
End Sub

Private Sub txtList1Col_GotFocus(Index As Integer)
Mfgrd1.SetFocus
End Sub

Private Sub txtSearch1Text_InterActiveChange(Optional ByVal mText)
mText = IIf(IsMissing(mText) = True, txtSearch1Text.Text, mText)
SearchFlex Mfgrd1, clsListStru.GetItemIndex("VtmName"), mText
ShowActiveFlexRow Mfgrd1

End Sub

Private Sub txtSearch1Text_GotFocus()
FlashActiveControl txtSearch1Text, True
End Sub

Private Sub txtSearch1Text_LostFocus()
FlashActiveControl txtSearch1Text, False
End Sub

