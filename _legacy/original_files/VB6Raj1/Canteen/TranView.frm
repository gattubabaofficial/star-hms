VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmTranViewRep 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   ClientHeight    =   10830
   ClientLeft      =   60
   ClientTop       =   60
   ClientWidth     =   14520
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
   ScaleHeight     =   10830
   ScaleWidth      =   14520
   ShowInTaskbar   =   0   'False
   Begin VB.ComboBox cmbPatEntryMode 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   315
      ItemData        =   "TranView.frx":0000
      Left            =   1560
      List            =   "TranView.frx":000D
      Style           =   1  'Simple Combo
      TabIndex        =   4
      TabStop         =   0   'False
      Text            =   "cmbPatEntryMode"
      Top             =   480
      Width           =   1455
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
      TabIndex        =   6
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
      TabIndex        =   5
      TabStop         =   0   'False
      Top             =   0
      Width           =   255
   End
   Begin VB.ComboBox cmbFormEntryMode 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   315
      ItemData        =   "TranView.frx":0034
      Left            =   0
      List            =   "TranView.frx":0041
      Style           =   1  'Simple Combo
      TabIndex        =   3
      TabStop         =   0   'False
      Text            =   "cmbFormEntryMode"
      Top             =   480
      Width           =   1455
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
      Height          =   9855
      Left            =   120
      TabIndex        =   2
      Top             =   840
      Width           =   14295
      Begin VB.CommandButton cmdPrintToExcel 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFF80&
         Caption         =   "Print to Excel"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   12360
         TabIndex        =   37
         Top             =   8760
         Width           =   1575
      End
      Begin VB.Frame frConfigure 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   6375
         Left            =   2760
         TabIndex        =   31
         Top             =   120
         Width           =   7935
         Begin VB.TextBox txtQrySimName 
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
            Left            =   1680
            TabIndex        =   13
            Top             =   1320
            Width           =   4455
         End
         Begin VB.Frame frFilterOpt 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Filter By"
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
            Height          =   3495
            Left            =   3960
            TabIndex        =   21
            Top             =   1680
            Width           =   3735
            Begin VB.CheckBox chkFByStockOut 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Outgoing Stock (All)"
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
               Left            =   120
               TabIndex        =   26
               Top             =   1800
               Value           =   1  'Checked
               Width           =   3495
            End
            Begin VB.CheckBox chkFByStockIn 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Incoming Stock (All)"
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
               Left            =   120
               TabIndex        =   22
               Top             =   240
               Value           =   1  'Checked
               Width           =   3495
            End
            Begin VB.CheckBox chkFByRetnOutw 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Purchase Return"
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
               Left            =   480
               TabIndex        =   28
               Top             =   2520
               Value           =   1  'Checked
               Width           =   3015
            End
            Begin VB.CheckBox chkFBySale 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Sales Voucher"
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
               Left            =   480
               TabIndex        =   27
               Top             =   2160
               Value           =   1  'Checked
               Width           =   3015
            End
            Begin VB.CheckBox chkFByRetnInw 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Sales Return"
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
               Left            =   480
               TabIndex        =   25
               Top             =   1320
               Value           =   1  'Checked
               Width           =   3015
            End
            Begin VB.CheckBox chkFByPurch 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Purchase Voucher"
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
               Left            =   480
               TabIndex        =   24
               Top             =   960
               Value           =   1  'Checked
               Width           =   3015
            End
            Begin VB.CheckBox chkFByOpnStock 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Opening Stock"
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
               ForeColor       =   &H80000008&
               Height          =   285
               Left            =   480
               TabIndex        =   23
               Top             =   600
               Value           =   1  'Checked
               Width           =   3015
            End
         End
         Begin VB.CommandButton cmdConfigure 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFF80&
            Caption         =   "&OK"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   3480
            TabIndex        =   29
            Top             =   5520
            Width           =   855
         End
         Begin VB.Frame frGroupOpt 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Grouped"
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
            Height          =   3495
            Left            =   120
            TabIndex        =   14
            Top             =   1680
            Width           =   3735
            Begin VB.OptionButton optExpanded 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Expanded"
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
               Left            =   240
               TabIndex        =   15
               Top             =   360
               Width           =   2535
            End
            Begin VB.OptionButton optItemWise 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Item-wise"
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
               Left            =   240
               TabIndex        =   20
               Top             =   2760
               Width           =   2535
            End
            Begin VB.OptionButton optDetailed 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Detailed"
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
               Left            =   240
               TabIndex        =   16
               Top             =   840
               Value           =   -1  'True
               Width           =   2535
            End
            Begin VB.OptionButton optMonthwise 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Month-wise"
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
               Left            =   240
               TabIndex        =   17
               Top             =   1320
               Width           =   2535
            End
            Begin VB.OptionButton optDatewise 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Date-wise"
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
               Left            =   240
               TabIndex        =   18
               Top             =   1800
               Width           =   2535
            End
            Begin VB.OptionButton optPartyNamewise 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Party Name wise"
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
               Left            =   240
               TabIndex        =   19
               Top             =   2280
               Width           =   2535
            End
         End
         Begin VB.TextBox dtpToDate 
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
            Left            =   4440
            TabIndex        =   11
            Tag             =   "AhCode"
            Text            =   "dd/mm/yyyy"
            Top             =   600
            Width           =   1575
         End
         Begin VB.TextBox dtpFromDate 
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
            Left            =   1680
            TabIndex        =   10
            Tag             =   "AhCode"
            Text            =   "dd/mm/yyyy"
            Top             =   600
            Width           =   1575
         End
         Begin VB.TextBox txtQryPrtName 
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
            Left            =   1680
            TabIndex        =   12
            Top             =   960
            Width           =   4455
         End
         Begin VB.Label Label1 
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
            Height          =   255
            Index           =   6
            Left            =   120
            TabIndex        =   36
            Top             =   1320
            Width           =   1575
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "To Date:"
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
            Left            =   3480
            TabIndex        =   35
            Top             =   600
            Width           =   855
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "From Date:"
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
            Left            =   120
            TabIndex        =   34
            Top             =   600
            Width           =   1575
         End
         Begin VB.Label Label2 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Configure"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   375
            Index           =   3
            Left            =   0
            TabIndex        =   33
            Top             =   0
            Width           =   7935
         End
         Begin VB.Label Label1 
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
            Height          =   255
            Index           =   1
            Left            =   120
            TabIndex        =   32
            Top             =   960
            Width           =   1575
         End
      End
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
         TabIndex        =   9
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
         TabIndex        =   7
         Top             =   360
         Width           =   4215
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd1 
         Height          =   7935
         Left            =   120
         TabIndex        =   8
         Top             =   720
         Width           =   14055
         _ExtentX        =   24791
         _ExtentY        =   13996
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
      Begin VB.Label lblIndrSeleCriteria 
         Caption         =   "Indoor Selection Criteria"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   570
         Left            =   120
         TabIndex        =   39
         Top             =   9120
         Width           =   12135
      End
      Begin VB.Label lblOutdSeleCriteria 
         Caption         =   "Outdoor Selection Criteria"
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
         Left            =   120
         TabIndex        =   38
         Top             =   8760
         Width           =   12135
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
         Index           =   4
         Left            =   120
         TabIndex        =   30
         Top             =   360
         Width           =   735
      End
   End
   Begin VB.TextBox txtVoid 
      CausesValidation=   0   'False
      Height          =   375
      Left            =   120
      TabIndex        =   0
      TabStop         =   0   'False
      Text            =   "Void"
      Top             =   10560
      Width           =   375
   End
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Stock Transaction Register"
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
      TabIndex        =   1
      Top             =   0
      Width           =   9015
   End
End
Attribute VB_Name = "frmTranViewRep"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Dim mFormLoaded As Boolean, mLastKeyPressed As Integer, mMaskKeyPressed As Integer
Dim mPurCode As Long, mPrtCode As Long, mQryPrtCode As Long, mQrySimCode As Long, mOpgOldPurCode As Long
Dim mRemoteAccess As Boolean, mEntryAccessed As Boolean, mLastRowAccessed As Long, mEntrySaved As Boolean, mEntryAborted As Boolean
Dim dbAcDatabase As New ADODB.Connection, dbGtdDatabase As New ADODB.Connection, dbGrpDatabase As New ADODB.Connection, dbComDatabase As New ADODB.Connection
Dim datRecset As New ADODB.Recordset
Dim mPurCode_old As Long, mPrtCode_old As Long, mPurDate_old As Date, mOpgTime_old As Date, mOpgVtmCode_old As Long, mOpgVchNo_old As Long, mPrtName_old As String, mPttPcgCode_old As Long, mPttAhCode_old As Long, mPttAgeChanged As Boolean, mPrtAraCode_old As Long, mOpgCDctCode_old As Long, mOpgRByCode_old As Long, mOpgRToCode_old As Long
Dim mPurSimCode_old As Long
Dim clsJRN As clsJournal, clsAH As clsAccountHead, clsARA As clsComMastEntry, clsSTN As clsComMastEntry, clsVTM As clsComMastEntry
Dim mActiveControl As Object, clsListStru As clsSelectQueryStructure
Dim fcmbAraName As clsComFlexSearch, fcmbStnName As clsComFlexSearch, fcmbVtmName As clsComFlexSearch
Dim fcmbPrtName As clsGtdFlexSearch, fcmbSimName As clsGtdFlexSearch
Dim frmTrn As Form

Private Type SmryPara
mIndex() As Variant
mFromDate() As Variant
mToDate() As Variant
mPrtCode() As Variant
mSimCode() As Variant
mExpanded() As Variant
mDetailed() As Variant
mMonthwise() As Variant
mDatewise() As Variant
mPatNameWise() As Variant
mItemwise() As Variant

End Type

Dim SmryParaLayer As SmryPara

Private Sub ClearSmryParaLayer()

With SmryParaLayer
.mIndex = Array()
.mFromDate = Array()
.mToDate = Array()
.mPrtCode = Array()
.mSimCode = Array()
.mExpanded = Array()
.mDetailed = Array()
.mMonthwise = Array()
.mDatewise = Array()
.mPatNameWise = Array()
.mItemwise = Array()
End With

End Sub

Private Sub ClearRecentSmryParaLayer()
Dim mIndex As Integer

With SmryParaLayer
mIndex = UBound(.mIndex)
If mIndex > LBound(.mIndex) Then
    mIndex = mIndex - 1
    ReDim Preserve .mIndex(mIndex)
    ReDim Preserve .mFromDate(mIndex)
    ReDim Preserve .mToDate(mIndex)
    ReDim Preserve .mPrtCode(mIndex)
    ReDim Preserve .mSimCode(mIndex)
    ReDim Preserve .mExpanded(mIndex)
    ReDim Preserve .mDetailed(mIndex)
    ReDim Preserve .mMonthwise(mIndex)
    ReDim Preserve .mDatewise(mIndex)
    ReDim Preserve .mPatNameWise(mIndex)
    ReDim Preserve .mItemwise(mIndex)
Else
    Call ClearSmryParaLayer
End If
End With

End Sub

Private Sub AddSmryParaLayer(Optional ByVal mClear As Boolean = False)
Dim mIndex As Integer

If mClear = True Then
    Call ClearSmryParaLayer
End If
With SmryParaLayer
mIndex = UBound(.mIndex) + 1
ReDim Preserve .mIndex(mIndex)
ReDim Preserve .mFromDate(mIndex)
ReDim Preserve .mToDate(mIndex)
ReDim Preserve .mPrtCode(mIndex)
ReDim Preserve .mSimCode(mIndex)
ReDim Preserve .mExpanded(mIndex)
ReDim Preserve .mDetailed(mIndex)
ReDim Preserve .mMonthwise(mIndex)
ReDim Preserve .mDatewise(mIndex)
ReDim Preserve .mPatNameWise(mIndex)
ReDim Preserve .mItemwise(mIndex)
' -----------------------
.mIndex(mIndex) = mIndex
.mFromDate(mIndex) = Ctod(dtpFromDate.Text)
.mToDate(mIndex) = Ctod(dtpToDate.Text)
    fcmbPrtName.BoundText = CStr(mQryPrtCode)
    fcmbSimName.BoundText = CStr(mQrySimCode)
.mPrtCode(mIndex) = Val(fcmbPrtName.BoundText)
.mSimCode(mIndex) = Val(fcmbSimName.BoundText)
.mExpanded(mIndex) = optExpanded.Value
.mDetailed(mIndex) = optDetailed.Value
.mMonthwise(mIndex) = optMonthwise.Value
.mDatewise(mIndex) = optDatewise.Value
.mPatNameWise(mIndex) = optPartyNamewise.Value
.mItemwise(mIndex) = optItemWise.Value

End With

End Sub

Private Sub RestoreDefaultSmryPara()

dtpFromDate.Text = Dtoc(sFinYrStartDate)
dtpToDate.Text = Dtoc(sFinYrEndDate)
mQryPrtCode = 0
mQrySimCode = 0
txtQryPrtName.Text = "": fcmbPrtName.BoundText = ""
txtQrySimName.Text = "": fcmbSimName.BoundText = ""
optExpanded.Value = False
optDetailed.Value = False
optMonthwise.Value = True
optDatewise.Value = False
optPartyNamewise.Value = False
optItemWise.Value = False
' ----------
AddSmryParaLayer mClear:=True

End Sub

Private Sub RestoreRecentSmryPara()
Dim mIndex As Integer

With SmryParaLayer
mIndex = UBound(.mIndex)
dtpFromDate.Text = Dtoc(.mFromDate(mIndex))
dtpToDate.Text = Dtoc(.mToDate(mIndex))
    mQryPrtCode = .mPrtCode(mIndex)
    mQrySimCode = .mSimCode(mIndex)
    fcmbPrtName.BoundText = CStr(mQryPrtCode): txtQryPrtName.Text = fcmbPrtName.Text
    fcmbSimName.BoundText = CStr(mQrySimCode): txtQrySimName.Text = fcmbSimName.Text
optExpanded.Value = .mExpanded(mIndex)
optDetailed.Value = .mDetailed(mIndex)
optMonthwise.Value = .mMonthwise(mIndex)
optDatewise.Value = .mDatewise(mIndex)
optPartyNamewise.Value = .mPatNameWise(mIndex)
optItemWise.Value = .mItemwise(mIndex)
End With

End Sub

Private Sub RestoreBackSmryPara()

Call ClearRecentSmryParaLayer

With SmryParaLayer
If UBound(.mIndex) >= LBound(.mIndex) Then
    Call RestoreRecentSmryPara
Else
    Call RestoreDefaultSmryPara
End If
End With

End Sub

'Public Property Let RemoteAccessCode(ByVal mAccessCode As Long)
'mRemoteAccess = True
'mPurCode = mAccessCode
'End Property
'
'Public Property Get EntryBoundCode() As Long
'EntryBoundCode = Val(mskFormBoundField.Text)
'End Property
'
'Public Property Get EntrySaved() As Boolean
'EntrySaved = mEntrySaved
'End Property
'
'Public Property Get EntryAborted() As Boolean
'EntryAborted = mEntryAborted
'End Property
'
'Public Property Get PrtName() As String
'PrtName = txtPrtName.Text
'End Property

Public Property Get FormAddEditMode() As Integer
FormAddEditMode = cmbFormEntryMode.ListIndex
End Property

Public Property Let FormAddEditMode(ByVal New_FormEntryMode As Integer)
cmbFormEntryMode.ListIndex = New_FormEntryMode
End Property

Private Sub chkFByStockOut_Click()
Dim mNewValue As Integer

mNewValue = chkFByStockOut.Value
If mNewValue = 0 Or mNewValue = 1 Then
    chkFBySale.Value = mNewValue
    chkFByRetnOutw.Value = mNewValue
End If

If mNewValue = 0 Then
    chkFByStockOut.Caption = "Outgoing Stock (None)"
ElseIf mNewValue = 1 Then
    chkFByStockOut.Caption = "Outgoing Stock (All)"
ElseIf mNewValue = 2 Then
    chkFByStockOut.Caption = "Outgoing Stock (Partial)"
End If
Call ChkStockOutSeleCriteria

End Sub

Private Sub chkFByStockOut_GotFocus()
FlashActiveControl chkFByStockOut, True
End Sub

Private Sub chkFByStockOut_LostFocus()
FlashActiveControl chkFByStockOut, False
End Sub

Private Sub chkFByRetnOutw_Click()
Call ChkStockOutItemCheck
Call ChkStockOutSeleCriteria
End Sub

Private Sub chkFByRetnOutw_GotFocus()
FlashActiveControl chkFByRetnOutw, True
End Sub

Private Sub chkFByRetnOutw_LostFocus()
FlashActiveControl chkFByRetnOutw, False
End Sub

Private Sub chkFBySale_Click()
Call ChkStockOutItemCheck
Call ChkStockOutSeleCriteria
End Sub

Private Sub chkFBySale_GotFocus()
FlashActiveControl chkFBySale, True
End Sub

Private Sub chkFBySale_LostFocus()
FlashActiveControl chkFBySale, False
End Sub

Private Sub chkFByStockIn_Click()
Dim mNewValue As Integer

mNewValue = chkFByStockIn.Value
If mNewValue = 0 Or mNewValue = 1 Then
    chkFByOpnStock.Value = mNewValue
    chkFByPurch.Value = mNewValue
    chkFByRetnInw.Value = mNewValue
End If
If mNewValue = 0 Then
    chkFByStockIn.Caption = "Incoming Stock (None)"
ElseIf mNewValue = 1 Then
    chkFByStockIn.Caption = "Incoming Stock (All)"
ElseIf mNewValue = 2 Then
    chkFByStockIn.Caption = "Incoming Stock (Partial)"
End If
Call ChkStockInSeleCriteria

End Sub

Private Sub chkFByStockIn_GotFocus()
FlashActiveControl chkFByStockIn, True
End Sub

Private Sub chkFByStockIn_LostFocus()
FlashActiveControl chkFByStockIn, False
End Sub

Private Sub chkFByRetnInw_Click()
Call ChkStockInItemCheck
Call ChkStockInSeleCriteria
End Sub

Private Sub chkFByRetnInw_GotFocus()
FlashActiveControl chkFByRetnInw, True
End Sub

Private Sub chkFByRetnInw_LostFocus()
FlashActiveControl chkFByRetnInw, False
End Sub

Private Sub chkFByPurch_Click()
Call ChkStockInItemCheck
Call ChkStockInSeleCriteria
End Sub

Private Sub chkFByPurch_GotFocus()
FlashActiveControl chkFByPurch, True
End Sub

Private Sub chkFByPurch_LostFocus()
FlashActiveControl chkFByPurch, False
End Sub

Private Sub chkFByOpnStock_Click()
Call ChkStockInItemCheck
Call ChkStockInSeleCriteria
End Sub

Private Sub chkFByOpnStock_GotFocus()
FlashActiveControl chkFByOpnStock, True
End Sub

Private Sub chkFByOpnStock_LostFocus()
FlashActiveControl chkFByOpnStock, False
End Sub

Private Sub ChkStockInItemCheck()

If chkFByOpnStock.Value = 1 And chkFByPurch.Value = 1 And chkFByRetnInw.Value = 1 Then
    chkFByStockIn.Value = 1
ElseIf chkFByOpnStock.Value = 1 Or chkFByPurch.Value = 1 Or chkFByRetnInw.Value = 1 Then
    chkFByStockIn.Value = 2
Else
    chkFByStockIn.Value = 0
End If

End Sub

Private Sub ChkStockOutItemCheck()

If chkFBySale.Value = 1 And chkFByRetnOutw.Value = 1 Then
    chkFByStockOut.Value = 1
ElseIf chkFBySale.Value = 1 Or chkFByRetnOutw.Value = 1 Then
    chkFByStockOut.Value = 2
Else
    chkFByStockOut.Value = 0
End If

End Sub

Private Sub ChkStockInSeleCriteria()

If chkFByOpnStock.Value = 1 And chkFByPurch.Value = 1 And chkFByRetnInw.Value = 1 Then
    lblOutdSeleCriteria.Caption = chkFByStockIn.Caption
ElseIf chkFByOpnStock.Value = 1 Or chkFByPurch.Value = 1 Or chkFByRetnInw.Value = 1 Then
    With lblOutdSeleCriteria
    .Caption = ""
    If chkFByOpnStock.Value = 1 Then
        .Caption = .Caption & chkFByOpnStock.Caption & ", "
    End If
    If chkFByPurch.Value = 1 Then
        .Caption = .Caption & chkFByPurch.Caption & ", "
    End If
    If chkFByRetnInw.Value = 1 Then
        .Caption = .Caption & chkFByRetnInw.Caption & ", "
    End If
    If Right(.Caption, 2) = ", " Then
        .Caption = Left(.Caption, Len(.Caption) - 2)
    End If
    End With
    
Else
    lblOutdSeleCriteria.Caption = chkFByStockIn.Caption
End If

End Sub

Private Sub ChkStockOutSeleCriteria()

If chkFBySale.Value = 1 And chkFByRetnOutw.Value = 1 Then
    lblIndrSeleCriteria.Caption = chkFByStockOut.Caption
ElseIf chkFBySale.Value = 1 Or chkFByRetnOutw.Value = 1 Then
    With lblIndrSeleCriteria
    .Caption = ""
    If chkFBySale.Value = 1 Then
        .Caption = .Caption & chkFBySale.Caption & ", "
    End If
    If chkFByRetnOutw.Value = 1 Then
        .Caption = .Caption & chkFByRetnOutw.Caption & ", "
    End If
    If Right(.Caption, 2) = ", " Then
        .Caption = Left(.Caption, Len(.Caption) - 2)
    End If
    End With
Else
    lblIndrSeleCriteria.Caption = chkFByStockOut.Caption
End If

End Sub

'Public Property Get PatAddEditMode() As Integer
'PatAddEditMode = cmbPatEntryMode.ListIndex
'End Property
'
'Public Property Let PatAddEditMode(ByVal New_PatEntryMode As Integer)
'cmbPatEntryMode.ListIndex = New_PatEntryMode
'End Property
'
'Private Sub chkPttDefAllowed_GotFocus()
'FlashActiveControl chkPttDefAllowed, True
'End Sub
'
'Private Sub chkPttDefAllowed_LostFocus()
'FlashActiveControl chkPttDefAllowed, False
'End Sub
'
'Private Sub chkPttDiscAllowed_GotFocus()
'FlashActiveControl chkPttDiscAllowed, True
'End Sub
'
'Private Sub chkPttDiscAllowed_LostFocus()
'FlashActiveControl chkPttDiscAllowed, False
'End Sub
'
'Private Sub chkPttInfAllowed_GotFocus()
'FlashActiveControl chkPttInfAllowed, True
'End Sub
'
'Private Sub chkPttInfAllowed_LostFocus()
'FlashActiveControl chkPttInfAllowed, False
'End Sub
'
'Private Sub chkPttShowInList_GotFocus()
'FlashActiveControl chkPttShowInList, True
'End Sub
'
'Private Sub chkPttShowInList_LostFocus()
'FlashActiveControl chkPttShowInList, False
'End Sub
'
'Private Sub cmbPttRefRela_GotFocus()
'FlashActiveControl cmbPttRefRela, True
'End Sub
'
'Private Sub cmbPttRefRela_LostFocus()
'FlashActiveControl cmbPttRefRela, False
'End Sub
'
'Private Sub cmbPttRefRela_Validate(Cancel As Boolean)
'If cmbPttRefRela.ListIndex = -1 Then
'    ErrorBox "Invalid Selection !!!"
'    cmbPttRefRela.SetFocus
'    Cancel = True
'End If
'
'End Sub
'
'Private Sub cmbPttSex_GotFocus()
'FlashActiveControl cmbPttSex, True
'End Sub
'
'Private Sub cmbPttSex_LostFocus()
'FlashActiveControl cmbPttSex, False
'End Sub
'
'Private Sub cmbPttSex_Validate(Cancel As Boolean)
'If cmbPttSex.ListIndex = -1 Then
'    ErrorBox "Invalid Selection !!!"
'    cmbPttSex.SetFocus
'    Cancel = True
'End If
'
'End Sub

Private Sub cmdConfigure_Click()
If Between(Ctod(dtpFromDate.Text), sFinYrStartDate, sFinYrEndDate) = False Then
    ErrorBox "Invalid Date Range !!!"
    dtpFromDate.SetFocus
    Exit Sub
End If
If Between(Ctod(dtpToDate.Text), sFinYrStartDate, sFinYrEndDate) = False Then
    ErrorBox "Invalid Date Range !!!"
    dtpToDate.SetFocus
    Exit Sub
End If
Call AddSmryParaLayer

Call SmryList
MoveRecToLast datRecset
ShowRecActiveFlexRow datRecset, Mfgrd1
txtVoid.SetFocus
Mfgrd1.Enabled = True
frConfigure.Visible = False
Mfgrd1.SetFocus

End Sub

Private Sub cmdFormEnter_Click()
mLastKeyPressed = 13
If TypeOf Screen.ActiveControl Is MSFlexGrid Then
    If Screen.ActiveControl.Name = Mfgrd1.Name Then
        With datRecset
        If .EOF = False And .BOF = False Then
            If optDetailed.Value = True Or optExpanded.Value = True Then
                Mfgrd1_KeyDown vbKeySpace, Shift:=vbCtrlMask
            Else
                fcmbPrtName.BoundText = CStr(mQryPrtCode)
                fcmbSimName.BoundText = CStr(mQrySimCode)
                
                txtVoid.SetFocus
                If optMonthwise.Value = True Then
                    dtpFromDate.Text = Dtoc(MonthStartDate(DateSerial(Val(Left(.fields("TrnYrMonth"), 4)), Val(Right(.fields("TrnYrMonth"), 2)), 1)))
                    dtpToDate.Text = Dtoc(MonthEndDate(DateSerial(Val(Left(.fields("TrnYrMonth"), 4)), Val(Right(.fields("TrnYrMonth"), 2)), 1)))
                    optMonthwise.Value = False
                    optDatewise.Value = True
                    
                ElseIf optDatewise.Value = True Then
                    dtpFromDate.Text = Dtoc(.fields("TrnDate"))
                    dtpToDate.Text = Dtoc(.fields("TrnDate"))
                    optDatewise.Value = False
                    optDetailed.Value = True
                    
                ElseIf optPartyNamewise.Value = True Then
                    mQryPrtCode = .fields("TrnPrtCode")
                    fcmbPrtName.BoundText = CStr(mQryPrtCode)
                    txtQryPrtName.Text = fcmbPrtName.Text
                    optPartyNamewise.Value = False
                    optDatewise.Value = True
                    
                ElseIf optItemWise.Value = True Then
                    mQrySimCode = .fields("TrnSimCode")
                    fcmbSimName.BoundText = CStr(mQrySimCode)
                    txtQrySimName.Text = fcmbSimName.Text
                    optItemWise.Value = False
                    optDatewise.Value = True
                    
                End If
                Call AddSmryParaLayer
                
                Call SmryList
                MoveRecToLast datRecset
                ShowRecActiveFlexRow datRecset, Mfgrd1
                Mfgrd1.SetFocus
            End If
        Else
            Call Data_AddEvent
        End If
        End With
    End If
ElseIf FormAddEditMode = cFORM_SMRYMODE And frConfigure.Visible = False Then
Else
    SendKeys "{tab}"
End If

End Sub

Private Sub cmdFormEscape_Click()
Dim srow As Long, mRecAbsPos As Long
mLastKeyPressed = 27

If frConfigure.Visible = True Then
    txtVoid.SetFocus
    Mfgrd1.Enabled = True
    frConfigure.Visible = False
    Mfgrd1.SetFocus
    Call RestoreRecentSmryPara
ElseIf FormAddEditMode = cFORM_SMRYMODE Then
    If Len(txtSearch1Text.Text) > 0 Then
        txtSearch1Text.Text = ""
        Call txtSearch1Text_InterActiveChange
    Else
        If UBound(SmryParaLayer.mIndex) > LBound(SmryParaLayer.mIndex) Then
            txtVoid.SetFocus
            Call RestoreBackSmryPara
            Call SmryList
            MoveRecToLast datRecset
            ShowRecActiveFlexRow datRecset, Mfgrd1
            Mfgrd1.SetFocus
        Else
            Unload Me
        End If
    End If
'Else
'    txtVoid.SetFocus
'    If CanReject() = True Then
'        mEntryAborted = True
'        mRecAbsPos = datRecset.AbsolutePosition
'        Call Data_CancelEvent
'        Call SmryList
'        If datRecset.RecordCount > mRecAbsPos And mRecAbsPos > 0 Then
'            datRecset.Move mRecAbsPos - 1, 1
'        Else
'            MoveRecToLast datRecset
'        End If
'        ShowRecActiveFlexRow datRecset, Mfgrd1
'
'        Call ShowEntryMode(False)
'        If mRemoteAccess = True Then
'            Me.Hide
'            ''Unload Me
'            Exit Sub
'        Else
'            Mfgrd1.SetFocus
'        End If
'    Else
'        'txtPrtName.SetFocus
'    End If
End If

End Sub

'Private Sub cmdSaveForm_Click()
'txtVoid.SetFocus
'Call Data_SaveEvent
'Call SmryList
'
'If optDetailed.Value = True Then
'    txtSearch1Text_InterActiveChange Format(Ctod(dtpPurDate.Text), "yyyymmdd") + Format(mPurCode, "0000000")
'ElseIf optMonthwise.Value = True Then
'    txtSearch1Text_InterActiveChange Format(Ctod(dtpPurDate.Text), "yyyy") & "/" & Format(Ctod(dtpPurDate.Text), "mm")
'ElseIf optDatewise.Value = True Then
'    txtSearch1Text_InterActiveChange Format(Ctod(dtpPurDate.Text), "yyyymmdd")
'ElseIf optPartyNamewise.Value = True Then
'    txtSearch1Text_InterActiveChange txtPrtName.Text
'ElseIf optPatientRegNoWise.Value = True Then
'    txtSearch1Text_InterActiveChange mskPttRegNo.Text
'ElseIf optItemWise.Value = True Then
'    txtSearch1Text_InterActiveChange txtSimName.Text
'End If
'
'Call ShowEntryMode(False)
'Mfgrd1.SetFocus
'
'End Sub

'Private Sub cmdSaveForm_GotFocus()
'Dim mOpgAcsPermNo As Integer, mPatAcsPermNo As Integer, mRetryCount As Integer
'
'txtVoid.SetFocus
'cmdSaveForm.Enabled = False
'If Data_Verify() = True Then
'    If CanAccept() = True Then
'        If (GetAccessPerm(mOpgAcsPermNo, mRetryCount, mFormOpgAcsPermFileName) = True And mRetryCount = 0) _
'         And (GetAccessPerm(mPatAcsPermNo, mRetryCount, mFormPatAcsPermFileName) = True And mRetryCount = 0) Then
'            If Data_NetwAuth() = True Then
'                Call cmdSaveForm_Click
'                Close #mOpgAcsPermNo
'                Close #mPatAcsPermNo
'                If mRemoteAccess = True Then
'                    ''Unload Me
'                    Me.Hide
'                    Exit Sub
'                End If
'            Else
'                Close #mOpgAcsPermNo
'                Close #mPatAcsPermNo
'            End If
'        Else
'            Close #mOpgAcsPermNo
'            Close #mPatAcsPermNo
'            AlertBox "System Busy, Try Again !!!"
'
'            txtPrtName.SetFocus
'        End If
'    Else
'        txtPrtName.SetFocus
'    End If
'End If
'cmdSaveForm.Enabled = True
'End Sub

Private Sub cmdPrintToExcel_Click()
Dim clsExcel As New clsExcelApp, mXlsRepPath As String
Dim srow As Long, scol As Integer

Me.MousePointer = vbHourglass
mXlsRepPath = App.Path & "\CollRep.xls"
clsExcel.InitExcelApp
clsExcel.NewExcelWorkBook mXlsRepPath
clsExcel.OpenExcelWorkBook mXlsRepPath

clsExcel.SelectCell 1, 1
For scol = 0 To Mfgrd1.Cols - 1
    If Mfgrd1.ColWidth(scol) > 0 Then
        clsExcel.ActiveColFormat ColWidth:=Mfgrd1.ColWidth(scol) / 100
        If InList(Mfgrd1.ColAlignment(scol), Array(flexAlignLeftTop, flexAlignLeftBottom, 1)) = True Then
            clsExcel.ActiveColFormat HorizontalAlignment:=xlLeft
        ElseIf InList(Mfgrd1.ColAlignment(scol), Array(flexAlignRightTop, flexAlignRightBottom, 7)) = True Then
            clsExcel.ActiveColFormat HorizontalAlignment:=xlRight
        ElseIf InList(Mfgrd1.ColAlignment(scol), Array(flexAlignCenterTop, flexAlignCenterBottom, flexAlignCenterCenter)) = True Then
            clsExcel.ActiveColFormat HorizontalAlignment:=xlCenter
        End If
        
        clsExcel.SelectNextColIndex
    End If
Next scol

clsExcel.SelectCell 1, 1
clsExcel.WriteValue "'" & MyCompany.mCmpName
clsExcel.ActiveCellFormat FontBold:=True, FontSize:=12
clsExcel.SelectNextRecordIndex
clsExcel.WriteValue "'" & "Collection Report From " & dtpFromDate.Text & " To " & dtpToDate.Text
clsExcel.ActiveCellFormat FontBold:=True
clsExcel.SelectNextRecordIndex
clsExcel.WriteValue "'" & "for " & lblOutdSeleCriteria.Caption & " & " & lblIndrSeleCriteria.Caption
clsExcel.ActiveCellFormat FontBold:=True
clsExcel.SelectNextRecordIndex

For srow = 0 To Mfgrd1.Rows - 2
    For scol = 0 To Mfgrd1.Cols - 1
        If Mfgrd1.ColWidth(scol) > 0 Then
            clsExcel.WriteValue "'" & Mfgrd1.TextMatrix(srow, scol)
            If (srow <= Mfgrd1.FixedRows - 1) Or (scol <= Mfgrd1.FixedCols - 1) Or (srow = Mfgrd1.Rows - 2) Then
                clsExcel.ActiveCellFormat FontBold:=True
            End If
            clsExcel.ActiveCellFormat DrawBox:=True
            
            clsExcel.SelectNextColIndex
        End If
    Next scol
    clsExcel.SelectNextRecordIndex
Next srow

clsExcel.CloseExcelWorkBook
clsExcel.CloseExcelApp
Me.MousePointer = vbNormal
AlertBox "Done !!!"
Set clsExcel = Nothing


End Sub

Private Sub dtpFromDate_GotFocus()
FlashActiveControl dtpFromDate, True
End Sub

Private Sub dtpFromDate_LostFocus()
FlashActiveControl dtpFromDate, False
End Sub

Private Sub dtpFromDate_Validate(Cancel As Boolean)
dtpFromDate.Text = ToMyDate(dtpFromDate.Text)
If Between(Ctod(dtpFromDate.Text), sFinYrStartDate, sFinYrEndDate) = False Then
    ErrorBox "Invalid Date Range !!!"
    'dtpFromDate.SetFocus
    'Cancel = True
End If

End Sub

'Private Sub dtpPurDate_GotFocus()
'FlashActiveControl dtpPurDate, True
'End Sub
'
'Private Sub dtpPurDate_LostFocus()
'FlashActiveControl dtpPurDate, False
'End Sub
'
'Private Sub dtpPurDate_Validate(Cancel As Boolean)
'dtpPurDate.Text = ToMyDate(dtpPurDate.Text)
'If IsFinYrDate(Ctod(dtpPurDate.Text)) = False Then
'    ErrorBox "Invalid Input !!!"
'    dtpPurDate.SetFocus
'    Cancel = True
'Else
'    Call ChkServRate
'    Call CalcOpgChg
'End If
'
'End Sub
'
'Private Sub dtpPttAgeAsOnDt_Change()
'mPttAgeChanged = True
'End Sub
'
'Private Sub dtpPttAgeAsOnDt_GotFocus()
'FlashActiveControl dtpPttAgeAsOnDt, True
'mPttAgeChanged = False
'End Sub
'
'Private Sub dtpPttAgeAsOnDt_LostFocus()
'FlashActiveControl dtpPttAgeAsOnDt, False
'End Sub
'
'Private Sub dtpPttAgeAsOnDt_Validate(Cancel As Boolean)
'dtpPttAgeAsOnDt.Text = ToMyDate(dtpPttAgeAsOnDt.Text)
'If IsDate(dtpPttAgeAsOnDt.Text) = False Then
'    ErrorBox "Invalid Input !!!"
'    dtpPttAgeAsOnDt.SetFocus
'    Cancel = True
'Else
'    If mPttAgeChanged = True Then
'        Call ShowPttDob
'    End If
'End If
'
'End Sub
'
'Private Sub dtpPttDob_Change()
'mPttAgeChanged = True
'End Sub
'
'Private Sub dtpPttDob_GotFocus()
'FlashActiveControl dtpPttDob, True
'mPttAgeChanged = False
'End Sub
'
'Private Sub dtpPttDob_LostFocus()
'FlashActiveControl dtpPttDob, False
'End Sub
'
'Private Sub dtpPttDob_Validate(Cancel As Boolean)
'Dim mYears As Long, mMonths As Long, mDays As Long
'
'dtpPttDob.Text = ToMyDate(dtpPttDob.Text)
'If IsDate(dtpPttDob.Text) = False Then
'    ErrorBox "Invalid Input !!!"
'    dtpPttDob.SetFocus
'    Cancel = True
'Else
'    If mPttAgeChanged = True Then
'        Call ShowPatAge
'    End If
'End If
'
'End Sub
'
'Private Sub dtpPttRegDate_Change()
'mPttAgeChanged = True
'End Sub
'
'Private Sub dtpPttRegDate_GotFocus()
'mPttAgeChanged = False
'FlashActiveControl dtpPttRegDate, True
'End Sub
'
'Private Sub dtpPttRegDate_LostFocus()
'FlashActiveControl dtpPttRegDate, False
'End Sub
'
'Private Sub dtpPttRegDate_Validate(Cancel As Boolean)
'dtpPttRegDate.Text = ToMyDate(dtpPttRegDate.Text)
'If IsDate(dtpPttRegDate.Text) = False Then
'    ErrorBox "Invalid Input !!!"
'    dtpPttRegDate.SetFocus
'    Cancel = True
'Else
'    If mPttAgeChanged = True Then
'        dtpPttAgeAsOnDt.Text = dtpPttRegDate.Text
'        Call ShowPttDob
'    End If
'End If
'
'End Sub

Private Sub dtpToDate_GotFocus()
FlashActiveControl dtpToDate, True
End Sub

Private Sub dtpToDate_LostFocus()
FlashActiveControl dtpToDate, False
End Sub

Private Sub dtpToDate_Validate(Cancel As Boolean)
dtpToDate.Text = ToMyDate(dtpToDate.Text)
If Between(Ctod(dtpToDate.Text), sFinYrStartDate, sFinYrEndDate) = False Then
    ErrorBox "Invalid Date Range !!!"
    'dtpToDate.SetFocus
    'Cancel = True
End If

End Sub

Private Sub Form_Activate()
Dim srow As Long, mTrnCode As Long

If mFormLoaded = False Then
'    If mRemoteAccess = True Then
'        If mPurCode = 0 Then
'            Call Data_AddEvent
'        Else
'            Call Data_EditEvent
'        End If
'    Else
        MoveRecToFirst datRecset
        ShowRecActiveFlexRow datRecset, Mfgrd1
        Mfgrd1.SetFocus
'    End If

ElseIf mEntryAccessed = True Then
    srow = Mfgrd1.Row
    mTrnCode = Val(Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCode")))
    If mTrnCode > 0 Then
        Call SmryList
        If datRecset.RecordCount > 0 Then
            Call Chk_EntryAccessed
        End If
        Mfgrd1.SetFocus
    End If

Else
    RefreshDatabase dbGtdDatabase
    RefreshDatabase dbAcDatabase
    RefreshDatabase dbGrpDatabase
    RefreshDatabase dbComDatabase
    
End If

mFormLoaded = True
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
mLastKeyPressed = KeyCode
mMaskKeyPressed = Shift
Select Case KeyCode
Case vbKeyPageDown
    If FormAddEditMode = cFORM_SMRYMODE And frConfigure.Visible = True Then
        Call cmdConfigure_Click
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
chkFByStockIn.Value = 1
chkFByStockOut.Value = 1
Call chkFByStockIn_Click
Call chkFByStockOut_Click

Call SetVoidControl(txtVoid)
txtSearch1Text.Enabled = False
frConfigure.Visible = False
'txtOpgPrefix.Enabled = False

OpenAcDataSource dbAcDatabase
OpenGtdDataSource dbGtdDatabase
OpenGrpDataSource dbGrpDatabase
OpenComDataSource dbComDatabase

'cmbPttSex.Clear
'cmbPttSex.AddItem "Male"
'cmbPttSex.AddItem "Female"
'cmbPttSex.AddItem "None"
'
'cmbPttRefRela.Clear
'cmbPttRefRela.AddItem "C/o"
'cmbPttRefRela.AddItem "S/o"
'cmbPttRefRela.AddItem "D/o"
'cmbPttRefRela.AddItem "W/o"
'cmbPttRefRela.AddItem "F/o"
'cmbPttRefRela.AddItem "M/o"

Set clsListStru = New clsSelectQueryStructure

Set clsAH = New clsAccountHead
Set clsAH.dbAcDatabase = dbAcDatabase
Set clsAH.dbGrpDatabase = dbGrpDatabase

Set clsARA = New clsComMastEntry
Set clsARA.dbAcDatabase = dbAcDatabase
clsARA.blnAreaMast = True
clsARA.Init

Set clsSTN = New clsComMastEntry
Set clsSTN.dbAcDatabase = dbAcDatabase
clsSTN.blnStationMast = True
clsSTN.Init

Set clsVTM = New clsComMastEntry
Set clsVTM.dbAcDatabase = dbAcDatabase
clsVTM.blnVTypeMast = True
clsVTM.Init

Set fcmbAraName = New clsComFlexSearch
Set fcmbAraName.dbAcDatabase = dbAcDatabase
fcmbAraName.blnAreaMastList = True
fcmbAraName.Init

Set fcmbStnName = New clsComFlexSearch
Set fcmbStnName.dbAcDatabase = dbAcDatabase
fcmbStnName.blnStationMastList = True
fcmbStnName.Init

Set fcmbVtmName = New clsComFlexSearch
Set fcmbVtmName.dbAcDatabase = dbAcDatabase
fcmbVtmName.blnVTypeMastList = True
Rem fcmbVtmName.mListSqlExpr = "Select * from VTypMast where VtmSysCode=" & CStr(cHMS_VTYPE_OUTDOOR_REG) & " order by VtmName"
fcmbVtmName.Init

Set fcmbSimName = New clsGtdFlexSearch
Set fcmbSimName.dbGtdDatabase = dbGtdDatabase
Set fcmbSimName.dbComDatabase = dbComDatabase
fcmbSimName.blnSubItmMastList = True
fcmbSimName.Init

Set fcmbPrtName = New clsGtdFlexSearch
Set fcmbPrtName.dbGtdDatabase = dbGtdDatabase
Set fcmbPrtName.dbComDatabase = dbComDatabase
fcmbPrtName.blnPartyMastList = True
fcmbPrtName.Init

Call RestoreDefaultSmryPara
If mRemoteAccess = True Then
    optDetailed.Value = True
    AddSmryParaLayer mClear:=True
End If

If mRemoteAccess = True Then
    'datRecset.Open "Select * from PurchDtl left join PartyMast on PurchDtl.PurPrtCode=PartyMast.PrtCode where PurCode=" & CStr(mPurCode) & " order by PurDate,OpgTime", dbGtdDatabase, adOpenKeyset, adLockOptimistic
Else
    'datRecset.Open "Select * from PurchDtl left join PartyMast on PurchDtl.PurPrtCode=PartyMast.PrtCode order by PurDate,OpgTime", dbGtdDatabase, adOpenKeyset, adLockOptimistic
End If
Mfgrd1.FixedCols = 0
Call SmryList

Call ShowEntryMode(False)

End Sub

Private Sub Form_Resize()
lblFormHeading.Width = Me.Width
cmdFormEscape.Left = Me.Width - (cmdFormEscape.Width * 2)
cmdFormEnter.Left = Me.Width + cmdFormEscape.Width
frFormSmry.Left = (Me.Width - frFormSmry.Width) / 2: frFormSmry.Top = cmbFormEntryMode.Top + (cmbFormEntryMode.Height * 1.25)
'frFormDtl.Left = (Me.Width - frFormDtl.Width) / 2: frFormDtl.Top = frFormSmry.Top

End Sub

Private Sub Form_Unload(Cancel As Integer)
Set clsJRN = Nothing
Set clsAH = Nothing
Set clsARA = Nothing
Set clsSTN = Nothing
Set clsVTM = Nothing
Set fcmbPrtName = Nothing
Set fcmbAraName = Nothing
Set fcmbStnName = Nothing
Set fcmbVtmName = Nothing
Set fcmbSimName = Nothing
Set clsListStru = Nothing
Set frmTrn = Nothing

CloseTable datRecset
CloseDataSource dbAcDatabase
CloseDataSource dbGtdDatabase
CloseDataSource dbGrpDatabase
CloseDataSource dbComDatabase

End Sub

Private Sub ShowEntryMode(ByVal EntryMode As Boolean)
If Me.Visible = True Then
    txtVoid.SetFocus
End If
frFormSmry.Visible = Not EntryMode: frFormSmry.Enabled = Not EntryMode
'frFormDtl.Visible = EntryMode: frFormDtl.Enabled = EntryMode
'cmdSaveForm.Enabled = EntryMode
If EntryMode = False Then
    FormAddEditMode = cFORM_SMRYMODE
    'PatAddEditMode = cFORM_SMRYMODE
End If

End Sub

'Private Function Data_Verify() As Boolean
'Dim mPttRegNo As Long, mOpgVchNo As Long, mPurPrtCode As Long
'
'Data_Verify = False
'If FormAddEditMode = cFORM_EDITMODE And Val(mskFormBoundField.Text) < 1 Then
'    ErrorBox "Invalid Key Value !!!"
'    txtPrtName.SetFocus
'    GoTo EndSub
'End If
'
'Rem patient validation
'mPurPrtCode = Val(mskPrtCode.Text)
'If mPurPrtCode < 1 And FormAddEditMode = cFORM_EDITMODE Then
'    ErrorBox "Invalid Key Value !!!"
'    txtPrtName.SetFocus
'    GoTo EndSub
'End If
'If Trim(txtPrtName.Text) = "" Then
'    ErrorBox "Invalid Input !!!"
'    txtPrtName.SetFocus
'    GoTo EndSub
'End If
'
'mPttRegNo = Val(UnMyNumFmt(mskPttRegNo.Text))
'If mPttRegNo < 0 Then
'    ErrorBox "Invalid Input !!!"
'    mskPttRegNo.SetFocus
'    GoTo EndSub
'Else
'    If mPttRegNo <> mPttRegNo_old Or FormAddEditMode = cFORM_ADDMODE Then
'        If FormAddEditMode = cFORM_ADDMODE And mPttRegNo <> mPttRegNo_old And clsHOPT.mOpgPttRegNoAddModeChange_bln = False Then
'            AlertBox "Change Prohibited in Add Mode !!!"
'            mskPttRegNo.Text = ToMyNumFmt(mPttRegNo_old, mDecimals:=0)
'            mskPttRegNo.SetFocus
'            GoTo EndSub
'
'        ElseIf FormAddEditMode = cFORM_EDITMODE And mPttRegNo <> mPttRegNo_old And clsHOPT.mOpgPttRegNoEditModeChange_bln = False Then
'            AlertBox "Change Prohibited in Edit Mode !!!"
'            mskPttRegNo.Text = ToMyNumFmt(mPttRegNo_old, mDecimals:=0)
'            mskPttRegNo.SetFocus
'            GoTo EndSub
'
'        ElseIf mPttRegNo = 0 And clsHOPT.mOpgPttRegNoNotZero_bln = True Then
'            AlertBox "Prohibited Zero Patient Reg.No. !!!"
'            If FormAddEditMode = cFORM_ADDMODE Then
'                If clsHOPT.mOpgPttRegNoAutoNumber_bln = True Then
'                    mPttRegNo = GetNextSeqno(dbGtdDatabase, "PartyMast", "PttRegNo")
'                    mskPttRegNo.Text = ToMyNumFmt(mPttRegNo, mDecimals:=0)
'                End If
'            Else
'                mskPttRegNo.Text = ToMyNumFmt(mPttRegNo_old, mDecimals:=0)
'            End If
'            mskPttRegNo.SetFocus
'            GoTo EndSub
'
'        ElseIf mPttRegNo <> 0 Then
'            If ChkIsDuplicate(dbGtdDatabase, "PartyMast", "PttRegNo", mPttRegNo, "PrtCode", mPurPrtCode) = True Then
'                ErrorBox "Duplicate Patient Reg.No. !!!"
'                mskPttRegNo.SetFocus
'                ' -----------
'                If FormAddEditMode = cFORM_ADDMODE Then
'                    If clsHOPT.mOpgPttRegNoAutoNumber_bln = True Then
'                        mPttRegNo = GetNextSeqno(dbGtdDatabase, "PartyMast", "PttRegNo")
'                    End If
'                Else
'                    mPttRegNo = mPttRegNo_old
'                End If
'                mskPttRegNo.Text = ToMyNumFmt(mPttRegNo, mDecimals:=0)
'                GoTo EndSub
'            End If
'
'        End If
'    End If
'End If
'If IsDate(dtpPttRegDate.Text) = False Then
'    ErrorBox "Invalid Input !!!"
'    dtpPttRegDate.SetFocus
'    GoTo EndSub
'End If
'If cmbPttSex.ListIndex = -1 Then
'    ErrorBox "Invalid Selection !!!"
'    cmbPttSex.SetFocus
'    GoTo EndSub
'End If
'If Val(mskPttAgeYr.Text) < 0 Then
'    ErrorBox "Invalid Input !!!"
'    mskPttAgeYr.SetFocus
'    GoTo EndSub
'End If
'If Val(mskPttAgeMn.Text) < 0 Then
'    ErrorBox "Invalid Input !!!"
'    mskPttAgeMn.SetFocus
'    GoTo EndSub
'End If
'If Val(mskPttAgeDy.Text) < 0 Then
'    ErrorBox "Invalid Input !!!"
'    mskPttAgeDy.SetFocus
'    GoTo EndSub
'End If
'If Val(mskPttAgeYr.Text) < 1 And Val(mskPttAgeMn.Text) < 1 And Val(mskPttAgeDy.Text) < 1 Then
'    ErrorBox "Invalid Input !!!"
'    mskPttAgeYr.SetFocus
'    GoTo EndSub
'End If
'If IsDate(dtpPttAgeAsOnDt.Text) = False Then
'    ErrorBox "Invalid Input !!!"
'    dtpPttAgeAsOnDt.SetFocus
'    GoTo EndSub
'End If
'If IsDate(dtpPttDob.Text) = False Then
'    ErrorBox "Invalid Input !!!"
'    dtpPttDob.SetFocus
'    GoTo EndSub
'End If
'If Val(fcmbAraName.BoundText) <= 0 Then
'    ErrorBox "Invalid Selection !!!"
'    txtAraName.SetFocus
'    GoTo EndSub
'End If
'If Val(fcmbStnName.BoundText) <= 0 Then
'    ErrorBox "Invalid Selection !!!"
'    txtAraName.SetFocus
'    GoTo EndSub
'End If
'If Val(fcmbPcgName.BoundText) <= 0 Then
'    ErrorBox "Invalid Selection !!!"
'    txtPcgName.SetFocus
'    GoTo EndSub
'End If
'If Val(UnMyPerFmt(mskPttDiscPer.Text)) < 0 Then
'    ErrorBox "Invalid Amount Percentage !!!"
'    mskPttDiscPer.SetFocus
'    GoTo EndSub
'End If
'If Val(fcmbAhName.BoundText) <= 0 Then
'    ErrorBox "Invalid Account Name !!!"
'    txtAhName.SetFocus
'    GoTo EndSub
'End If
'Rem outdoor registration validation
'If Val(fcmbVtmName.BoundText) <= 0 Then
'    ErrorBox "Invalid Selection !!!"
'    txtVtmName.SetFocus
'    GoTo EndSub
'End If
'mOpgVchNo = Val(UnMyNumFmt(mskOpgVchNo.Text))
'If mOpgVchNo > 0 Then
'    If mOpgVchNo <> mOpgVchNo_old Or Val(fcmbVtmName.BoundText) <> mOpgVtmCode_old Or Ctod(dtpPurDate.Text) <> mPurDate_old Or FormAddEditMode = cFORM_ADDMODE Then
'        If ChkIsDuplVTypeNo(dbGtdDatabase, dbAcDatabase, mTableName:="PurchDtl", mChkFieldName:="OpgVchNo", mChkFieldValue:=mOpgVchNo, mKeyFieldName:="PurCode", mKeyFieldValue:=mPurCode, mVtmFieldName:="OpgVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="OpgCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="PurDate", mDateFieldValue:=Ctod(dtpPurDate.Text)) = True Then
'            ErrorBox "Duplicate Voucher No. !!!"
'            mskOpgVchNo.SetFocus
'            ' ---------------
'            If FormAddEditMode = True Then
'                mOpgVchNo = GetNextVTypeNo(dbGtdDatabase, dbAcDatabase, dbComDatabase, mTableName:="PurchDtl", mFieldName:="OpgVchNo", mVtmFieldName:="OpgVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="OpgCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="PurDate", mDateFieldValue:=Ctod(dtpPurDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormOpgAcsPermFileName)
'            Else
'                mOpgVchNo = mOpgVchNo_old
'            End If
'            mskOpgVchNo.Text = ToMyNumFmt(mOpgVchNo, mDecimals:=0)
'            GoTo EndSub
'        End If
'    End If
'Else
'    ErrorBox "Invalid Input !!!"
'    mskOpgVchNo.SetFocus
'    GoTo EndSub
'End If
'If IsDate(dtpPurDate.Text) = False Then
'    ErrorBox "Invalid Input !!!"
'    dtpPurDate.SetFocus
'    GoTo EndSub
'Else
'    If IsFinYrDate(Ctod(dtpPurDate.Text)) = False Then
'        ErrorBox "Invalid Input !!!"
'        dtpPurDate.SetFocus
'        GoTo EndSub
'    End If
'End If
'If TimeToMin(txtOpgTime_str.Text) > cDAYMINUTES Then
'    ErrorBox "Invalid Input !!!"
'    txtOpgTime_str.SetFocus
'    GoTo EndSub
'End If
'If Val(fcmbCDctName.BoundText) <= 0 Then
'    ErrorBox "Invalid Selection !!!"
'    txtCDctName.SetFocus
'    GoTo EndSub
'End If
''If Val(fcmbRByName.BoundText) <= 0 Then
''    ErrorBox "Invalid Selection !!!"
''    txtRByName.SetFocus
''    GoTo EndSub
''End If
'If Val(fcmbFDigName.BoundText) <= 0 Then
'    ErrorBox "Invalid Selection !!!"
'    txtFDigName.SetFocus
'    GoTo EndSub
'End If
'If Val(fcmbSimName.BoundText) <= 0 Then
'    ErrorBox "Invalid Selection !!!"
'    txtSimName.SetFocus
'    GoTo EndSub
'End If
'If Val(UnMyNumFmt(mskOpgUnit.Text)) <= 0 Then
'    ErrorBox "Invalid Input !!!"
'    mskOpgUnit.SetFocus
'    GoTo EndSub
'End If
'If Val(UnMyNumFmt(mskOpgRate.Text)) <= 0 Then
'    ErrorBox "Invalid Input !!!"
'    mskOpgRate.SetFocus
'    GoTo EndSub
'End If
'If Val(UnMyNumFmt(mskOpgAmtBefDisc.Text)) <= 0 Then
'    ErrorBox "Invalid Input !!!"
'    mskOpgAmtBefDisc.SetFocus
'    GoTo EndSub
'End If
'If Val(UnMyPerFmt(mskOpgDiscPer.Text)) < 0 Then
'    ErrorBox "Invalid Input !!!"
'    mskOpgDiscPer.SetFocus
'    GoTo EndSub
'End If
'If Val(UnMyNumFmt(mskPurAmount.Text)) < 0 Then
'    ErrorBox "Invalid Input !!!"
'    mskPurAmount.SetFocus
'    GoTo EndSub
'End If
'If Val(UnMyNumFmt(mskPurQty.Text)) < 0 Then
'    ErrorBox "Invalid Input !!!"
'    mskPurQty.SetFocus
'    GoTo EndSub
'End If
'
'Data_Verify = True
'
'EndSub:
'Exit Function
'
'End Function

'Private Function Data_NetwAuth() As Boolean
'Dim mOpgVchNo As Long, mPttRegNo As Long, mPurPrtCode As Long
'Data_NetwAuth = False
'
'mPurPrtCode = Val(mskPrtCode.Text)
'mPttRegNo = Val(UnMyNumFmt(mskPttRegNo.Text))
'If mPttRegNo <> mPttRegNo_old Or FormAddEditMode = cFORM_ADDMODE Then
'    If mPttRegNo <> 0 Then
'        If ChkIsDuplicate(dbGtdDatabase, "PartyMast", "PttRegNo", mPttRegNo, "PrtCode", mPurPrtCode) = True Then
'            ErrorBox "Duplicate Patient Reg.No. !!!"
'            mskPttRegNo.SetFocus
'            ' -------
'            If FormAddEditMode = cFORM_ADDMODE Then
'                If clsHOPT.mOpgPttRegNoAutoNumber_bln = True Then
'                    mPttRegNo = GetNextSeqno(dbGtdDatabase, "PartyMast", "PttRegNo")
'                End If
'            Else
'                mPttRegNo = mPttRegNo_old
'            End If
'            mskPttRegNo.Text = ToMyNumFmt(mPttRegNo, mDecimals:=0)
'            Exit Function
'        End If
'    End If
'End If
'
'mOpgVchNo = Val(UnMyNumFmt(mskOpgVchNo.Text))
'If mOpgVchNo <> mOpgVchNo_old Or Val(fcmbVtmName.BoundText) <> mOpgVtmCode_old Or Ctod(dtpPurDate.Text) <> mPurDate_old Or FormAddEditMode = cFORM_ADDMODE Then
'    If ChkIsDuplVTypeNo(dbGtdDatabase, dbAcDatabase, mTableName:="PurchDtl", mChkFieldName:="OpgVchNo", mChkFieldValue:=mOpgVchNo, mKeyFieldName:="PurCode", mKeyFieldValue:=mPurCode, mVtmFieldName:="OpgVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="OpgCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="PurDate", mDateFieldValue:=Ctod(dtpPurDate.Text)) = True Then
'        ErrorBox "Duplicate Voucher No. !!!"
'        mskOpgVchNo.SetFocus
'        ' ---------------
'        If FormAddEditMode = True Then
'            mOpgVchNo = GetNextVTypeNo(dbGtdDatabase, dbAcDatabase, dbComDatabase, mTableName:="PurchDtl", mFieldName:="OpgVchNo", mVtmFieldName:="OpgVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="OpgCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="PurDate", mDateFieldValue:=Ctod(dtpPurDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormOpgAcsPermFileName)
'        Else
'            mOpgVchNo = mOpgVchNo_old
'        End If
'        mskOpgVchNo.Text = ToMyNumFmt(mOpgVchNo, mDecimals:=0)
'        Exit Function
'    End If
'End If
'
'Data_NetwAuth = True
'
'End Function

'Private Sub mskPurQty_GotFocus()
'FlashActiveControl mskPurQty, True
'End Sub
'
'Private Sub mskPurQty_LostFocus()
'FlashActiveControl mskPurQty, False
'End Sub
'
'Private Sub mskPurQty_Validate(Cancel As Boolean)
'mskPurQty.Text = ToMyNumFmt(mskPurQty.Text)
'If Val(UnMyNumFmt(mskPurQty.Text)) < 0 Then
'    ErrorBox "Invalid Input !!!"
'    mskPurQty.SetFocus
'    Cancel = True
'Else
'    Call CalcOpgChg
'End If
'
'End Sub
'
'Private Sub mskOpgAmtBefDisc_GotFocus()
'FlashActiveControl mskOpgAmtBefDisc, True
'End Sub
'
'Private Sub mskOpgAmtBefDisc_LostFocus()
'FlashActiveControl mskOpgAmtBefDisc, False
'End Sub
'
'Private Sub mskOpgAmtBefDisc_Validate(Cancel As Boolean)
'mskOpgAmtBefDisc.Text = ToMyNumFmt(mskOpgAmtBefDisc.Text)
'If Val(UnMyNumFmt(mskOpgAmtBefDisc.Text)) <= 0 Then
'    ErrorBox "Invalid Input !!!"
'    mskOpgAmtBefDisc.SetFocus
'    Cancel = True
'Else
'    Call CalcOpgChg
'End If
'
'End Sub
'
'Private Sub mskPurAmount_GotFocus()
'FlashActiveControl mskPurAmount, True
'End Sub
'
'Private Sub mskPurAmount_LostFocus()
'FlashActiveControl mskPurAmount, False
'End Sub
'
'Private Sub mskPurAmount_Validate(Cancel As Boolean)
'mskPurAmount.Text = ToMyNumFmt(mskPurAmount.Text)
'If Val(UnMyNumFmt(mskPurAmount.Text)) < 0 Then
'    ErrorBox "Invalid Input !!!"
'    mskPurAmount.SetFocus
'    Cancel = True
'Else
'    Call CalcOpgChg
'End If
'
'End Sub
'
'Private Sub mskOpgDiscPer_GotFocus()
'FlashActiveControl mskOpgDiscPer, True
'End Sub
'
'Private Sub mskOpgDiscPer_LostFocus()
'FlashActiveControl mskOpgDiscPer, False
'End Sub
'
'Private Sub mskOpgDiscPer_Validate(Cancel As Boolean)
'mskOpgDiscPer.Text = ToMyPerFmt(mskOpgDiscPer.Text)
'If Val(UnMyPerFmt(mskOpgDiscPer.Text)) < 0 Then
'    ErrorBox "Invalid Input !!!"
'    mskOpgDiscPer.SetFocus
'    Cancel = True
'Else
'    Call CalcOpgChg
'End If
'
'End Sub
'
'Private Sub mskOpgVchNo_GotFocus()
'FlashActiveControl mskOpgVchNo, True
'End Sub
'
'Private Sub mskOpgVchNo_LostFocus()
'FlashActiveControl mskOpgVchNo, False
'End Sub
'
'Private Sub mskOpgVchNo_Validate(Cancel As Boolean)
'Dim mOpgVchNo As Long
'mOpgVchNo = Val(UnMyNumFmt(mskOpgVchNo.Text))
'If mOpgVchNo < 0 Then
'    mOpgVchNo = GetNextVTypeNo(dbGtdDatabase, dbAcDatabase, dbComDatabase, mTableName:="PurchDtl", mFieldName:="OpgVchNo", mVtmFieldName:="OpgVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="OpgCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="PurDate", mDateFieldValue:=Ctod(dtpPurDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormOpgAcsPermFileName)
'    mskOpgVchNo.Text = ToMyNumFmt(mOpgVchNo, mDecimals:=0)
'ElseIf mOpgVchNo > 0 Then
'    If mOpgVchNo <> mOpgVchNo_old Or Val(fcmbVtmName.BoundText) <> mOpgVtmCode_old Or Ctod(dtpPurDate.Text) <> mPurDate_old Or FormAddEditMode = cFORM_ADDMODE Then
'        If ChkIsDuplVTypeNo(dbGtdDatabase, dbAcDatabase, mTableName:="PurchDtl", mChkFieldName:="OpgVchNo", mChkFieldValue:=CStr(mOpgVchNo), mKeyFieldName:="PurCode", mKeyFieldValue:=mPurCode, mVtmFieldName:="OpgVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="OpgCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="PurDate", mDateFieldValue:=Ctod(dtpPurDate.Text)) = True Then
'            ErrorBox "Duplicate Voucher No. !!!"
'            Cancel = True
'            mskOpgVchNo.SetFocus
'            ' ----------
'            Rem RemoveNetwVchNo dbComDatabase, mVtmCode:=Val(fcmbVtmName.BoundText), mVchNo:=mOpgVchNo, mVchDate:=Ctod(dtpPurDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mShowFailedMsg:=False
'            If FormAddEditMode = cFORM_ADDMODE Then
'                mOpgVchNo = GetNextVTypeNo(dbGtdDatabase, dbAcDatabase, dbComDatabase, mTableName:="PurchDtl", mFieldName:="OpgVchNo", mVtmFieldName:="OpgVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="OpgCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="PurDate", mDateFieldValue:=Ctod(dtpPurDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormOpgAcsPermFileName)
'            Else
'                mOpgVchNo = mOpgVchNo_old
'            End If
'            mskOpgVchNo.Text = ToMyNumFmt(mOpgVchNo, mDecimals:=0)
'        Rem Else
'        Rem     GetNextVTypeNo dbGtdDatabase, dbAcDatabase, dbComDatabase, mTableName:="PurchDtl", mFieldName:="OpgVchNo", mVtmFieldName:="OpgVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="OpgCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="PurDate", mDateFieldValue:=Ctod(dtpPurDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormOpgAcsPermFileName, mDeletedVchNo:=mOpgVchNo
'        End If
'    End If
'    If Cancel = False Then
'        mskOpgVchNo.Text = ToMyNumFmt(mOpgVchNo, mDecimals:=0)
'    End If
'Else
'    ErrorBox "Invalid Input !!!"
'    mskOpgVchNo.SetFocus
'    Cancel = True
'End If
'
'End Sub
'
'Private Sub mskOpgRate_GotFocus()
'FlashActiveControl mskOpgRate, True
'End Sub
'
'Private Sub mskOpgRate_LostFocus()
'FlashActiveControl mskOpgRate, False
'End Sub
'
'Private Sub mskOpgRate_Validate(Cancel As Boolean)
'mskOpgRate.Text = ToMyNumFmt(mskOpgRate.Text)
'If Val(UnMyNumFmt(mskOpgRate.Text)) <= 0 Then
'    ErrorBox "Invalid Input !!!"
'    mskOpgRate.SetFocus
'    Cancel = True
'Else
'    Call CalcOpgChg
'End If
'
'End Sub
'
'Private Sub mskOpgUnit_GotFocus()
'FlashActiveControl mskOpgUnit, True
'End Sub
'
'Private Sub mskOpgUnit_LostFocus()
'FlashActiveControl mskOpgUnit, False
'End Sub
'
'Private Sub mskOpgUnit_Validate(Cancel As Boolean)
'mskOpgUnit.Text = ToMyNumFmt(mskOpgUnit.Text, mDecimals:=0)
'If Val(UnMyNumFmt(mskOpgUnit.Text)) <= 0 Then
'    ErrorBox "Invalid Input !!!"
'    mskOpgUnit.SetFocus
'    Cancel = True
'Else
'    Call CalcOpgChg
'End If
'
'End Sub
'
'Private Sub mskPttAgeDy_Change()
'mPttAgeChanged = True
'End Sub
'
'Private Sub mskPttAgeDy_GotFocus()
'FlashActiveControl mskPttAgeDy, True
'mPttAgeChanged = False
'End Sub
'
'Private Sub mskPttAgeDy_LostFocus()
'FlashActiveControl mskPttAgeDy, False
'End Sub
'
'Private Sub mskPttAgeDy_Validate(Cancel As Boolean)
'mskPttAgeDy.Text = ToMyNumFmt(mskPttAgeDy.Text, mDecimals:=0, mUseAbs:=True, mGroupedDigit:=False)
'If mPttAgeChanged = True Then
'    Call ShowPttDob
'End If
'
'End Sub
'
'Private Sub mskPttAgeMn_Change()
'mPttAgeChanged = True
'End Sub
'
'Private Sub mskPttAgeMn_GotFocus()
'FlashActiveControl mskPttAgeMn, True
'mPttAgeChanged = False
'End Sub
'
'Private Sub mskPttAgeMn_LostFocus()
'FlashActiveControl mskPttAgeMn, False
'End Sub
'
'Private Sub mskPttAgeMn_Validate(Cancel As Boolean)
'mskPttAgeMn.Text = ToMyNumFmt(mskPttAgeMn.Text, mDecimals:=0, mUseAbs:=True, mGroupedDigit:=False)
'If mPttAgeChanged = True Then
'    Call ShowPttDob
'End If
'
'End Sub
'
'Private Sub mskPttAgeYr_Change()
'mPttAgeChanged = True
'End Sub
'
'Private Sub mskPttAgeYr_GotFocus()
'FlashActiveControl mskPttAgeYr, True
'mPttAgeChanged = False
'End Sub
'
'Private Sub mskPttAgeYr_LostFocus()
'FlashActiveControl mskPttAgeYr, False
'End Sub
'
'Private Sub mskPttAgeYr_Validate(Cancel As Boolean)
'mskPttAgeYr.Text = ToMyNumFmt(mskPttAgeYr.Text, mDecimals:=0, mUseAbs:=True, mGroupedDigit:=False)
'If mPttAgeChanged = True Then
'    Call ShowPttDob
'End If
'
'End Sub
'
'Private Sub mskPttDiscPer_GotFocus()
'FlashActiveControl mskPttDiscPer, True
'End Sub
'
'Private Sub mskPttDiscPer_LostFocus()
'FlashActiveControl mskPttDiscPer, False
'End Sub
'
'Private Sub mskPttDiscPer_Validate(Cancel As Boolean)
'Dim mPttDiscPer As Double
'
'mPttDiscPer = Val(UnMyPerFmt(mskPttDiscPer.Text))
'mskPttDiscPer.Text = ToMyPerFmt(mPttDiscPer)
'If mPttDiscPer < 0 Then
'    ErrorBox "Invalid Amount Percentage !!!"
'    mskPttDiscPer.SetFocus
'    Cancel = True
'Else
'    If FormAddEditMode = cFORM_ADDMODE And mPttDiscPer > 0 Then
'        mskOpgDiscPer.Text = mskPttDiscPer.Text
'        Call CalcOpgChg
'    End If
'End If
'
'End Sub
'
'Private Sub mskPttRegNo_GotFocus()
'FlashActiveControl mskPttRegNo, True
'End Sub

'Private Sub mskPttRegNo_KeyDown(KeyCode As Integer, Shift As Integer)
'If MyDropDownKey(Shift, KeyCode) = True Then
'    If fcmbPttRegNo.CallFromText_Change = False Then
'        fcmbPttRegNo.CallFromText_Change = True
'        If InterActiveChange(mskPttRegNo) = True Then
'            fcmbPttRegNo.UserText = Array(mskPttRegNo.Text, mskPttRegNo.SelStart)
'            fcmbPttRegNo.Show
'            If fcmbPttRegNo.ListSelected = True And Val(fcmbPttRegNo.BoundText) > 0 Then
'                If FormAddEditMode = cFORM_ADDMODE Then
'                    clsPAT.EndMast mPrtCode
'
'                    PatAddEditMode = cFORM_EDITMODE
'                    mPrtCode = Val(fcmbPttRegNo.BoundText)
'                    If clsPAT.BeginMast(mPrtCode) = True Then
'                        mPrtCode = clsPAT.ActiveCode
'                    Else
'                        mPrtCode = 0
'                    End If
'                    ShowPttDiscPer mPrtCode
'                    mOpgOldPurCode = GetOldPurCodeFromPrtCode(mPrtCode)
'                    ShowOldPurCodeDesc mOpgOldPurCode
'                    ShowPatData mPrtCode
'                    Call StorePatOldData
'
'                    Rem SendKeys "{tab}"
'                Else
'                    AlertBox "Prohibited in Edit Mode !!!"
'                End If
'            End If
'        End If
'        fcmbPttRegNo.CallFromText_Change = False
'    End If
'ElseIf MyAddNewKey(Shift, KeyCode) = True Then
'    If FormAddEditMode = cFORM_ADDMODE Then
'        clsPAT.EndMast mPrtCode
'
'        PatAddEditMode = cFORM_ADDMODE
'        If clsPAT.BeginMast(0) = True Then
'            mPrtCode = clsPAT.ActiveCode
'        Else
'            mPrtCode = 0
'        End If
'        ShowPttDiscPer mPrtCode
'        mOpgOldPurCode = 0
'        ShowOldPurCodeDesc mOpgOldPurCode
'        ShowPatData mPrtCode
'        Call ShowPatDefData
'        Call StorePatOldData
'    Else
'        AlertBox "Prohibited in Edit Mode !!!"
'    End If
'ElseIf Shift = 0 And KeyCode = vbKeyF6 Then
'    Call ShowOldOpgListByPttRegNo
'End If
'
'End Sub
'
'Private Sub mskPttRegNo_LostFocus()
'FlashActiveControl mskPttRegNo, False
'End Sub
'
'Private Sub mskPttRegNo_Validate(Cancel As Boolean)
'Dim mPttRegNo As Long, mPurPrtCode As Long
'
'mPurPrtCode = Val(mskPrtCode.Text)
'mPttRegNo = Val(UnMyNumFmt(mskPttRegNo.Text))
'If mPttRegNo < 0 Then
'    ErrorBox "Invalid Input !!!"
'    Cancel = True
'    mskPttRegNo.SetFocus
'Else
'    If mPttRegNo <> mPttRegNo_old Or FormAddEditMode = cFORM_ADDMODE Then
'        If FormAddEditMode = cFORM_ADDMODE And mPttRegNo <> mPttRegNo_old And clsHOPT.mOpgPttRegNoAddModeChange_bln = False Then
'            AlertBox "Change Prohibited in Add Mode !!!"
'            mskPttRegNo.Text = ToMyNumFmt(mPttRegNo_old, mDecimals:=0)
'            Cancel = True
'            mskPttRegNo.SetFocus
'
'        ElseIf FormAddEditMode = cFORM_EDITMODE And mPttRegNo <> mPttRegNo_old And clsHOPT.mOpgPttRegNoEditModeChange_bln = False Then
'            AlertBox "Change Prohibited in Edit Mode !!!"
'            mskPttRegNo.Text = ToMyNumFmt(mPttRegNo_old, mDecimals:=0)
'            Cancel = True
'            mskPttRegNo.SetFocus
'
'        ElseIf mPttRegNo = 0 And clsHOPT.mOpgPttRegNoNotZero_bln = True Then
'            AlertBox "Prohibited Zero Patient Reg.No. !!!"
'            If FormAddEditMode = cFORM_ADDMODE Then
'                If clsHOPT.mOpgPttRegNoAutoNumber_bln = True Then
'                    mPttRegNo = GetNextSeqno(dbGtdDatabase, "PartyMast", "PttRegNo")
'                    mskPttRegNo.Text = ToMyNumFmt(mPttRegNo, mDecimals:=0)
'                End If
'            Else
'                mskPttRegNo.Text = ToMyNumFmt(mPttRegNo_old, mDecimals:=0)
'            End If
'            Cancel = True
'            mskPttRegNo.SetFocus
'        ElseIf mPttRegNo <> 0 Then
'            If ChkIsDuplicate(dbGtdDatabase, "PartyMast", "PttRegNo", mPttRegNo, "PrtCode", mPurPrtCode) = True Then
'                ErrorBox "Duplicate Patient Reg.No. !!!"
'                Cancel = True
'                mskPttRegNo.SetFocus
'                ' -----------
'                If FormAddEditMode = cFORM_ADDMODE Then
'                    If clsHOPT.mOpgPttRegNoAutoNumber_bln = True Then
'                        mPttRegNo = GetNextSeqno(dbGtdDatabase, "PartyMast", "PttRegNo")
'                    End If
'                Else
'                    mPttRegNo = mPttRegNo_old
'                End If
'                mskPttRegNo.Text = ToMyNumFmt(mPttRegNo, mDecimals:=0)
'            End If
'        End If
'    End If
'End If
'
'End Sub

Private Sub optDatewise_GotFocus()
FlashActiveControl optDatewise, True
End Sub

Private Sub optDatewise_LostFocus()
FlashActiveControl optDatewise, False
End Sub

Private Sub optDetailed_GotFocus()
FlashActiveControl optDetailed, True
End Sub

Private Sub optDetailed_LostFocus()
FlashActiveControl optDetailed, False
End Sub

Private Sub optExpanded_GotFocus()
FlashActiveControl optExpanded, True
End Sub

Private Sub optExpanded_LostFocus()
FlashActiveControl optExpanded, False
End Sub

Private Sub optMonthwise_GotFocus()
FlashActiveControl optMonthwise, True
End Sub

Private Sub optMonthwise_LostFocus()
FlashActiveControl optMonthwise, False
End Sub

Private Sub optPartyNamewise_GotFocus()
FlashActiveControl optPartyNamewise, True
End Sub

Private Sub optPartyNamewise_LostFocus()
FlashActiveControl optPartyNamewise, False
End Sub

'Private Sub txtAhName_Change()
'If fcmbAhName.CallFromText_Change = False Then
'    fcmbAhName.CallFromText_Change = True
'    If InterActiveChange(txtAhName) = True Then
'        fcmbAhName.UserText = Array(txtAhName.Text, txtAhName.SelStart)
'        fcmbAhName.Show
'        txtAhName.Text = fcmbAhName.Text
'        If fcmbAhName.ListSelected = True Then
'            SendKeys "{tab}"
'        End If
'    End If
'    fcmbAhName.CallFromText_Change = False
'End If
'
'End Sub
'
'Private Sub txtAhName_GotFocus()
'FlashActiveControl txtAhName, True
'End Sub
'
'Private Sub txtAhName_LostFocus()
'FlashActiveControl txtAhName, False
'End Sub
'
'Private Sub txtAhname_Validate(Cancel As Boolean)
'If Val(fcmbAhName.BoundText) <= 0 Then
'    AlertBox "Invalid Account Head Name !!!"
'    txtAhName.SetFocus
'    Cancel = True
'Else
'    Call ShowPatBal
'End If
'
'End Sub
'
'Private Sub txtAraName_Change()
'If fcmbAraName.CallFromText_Change = False Then
'    fcmbAraName.CallFromText_Change = True
'    If InterActiveChange(txtAraName) = True Then
'        fcmbAraName.UserText = Array(txtAraName.Text, txtAraName.SelStart)
'        fcmbAraName.Show
'        txtAraName.Text = fcmbAraName.Text
'        If fcmbAraName.ListSelected = True Then
'            SendKeys "{tab}"
'        End If
'    End If
'    fcmbAraName.CallFromText_Change = False
'End If
'
'End Sub
'
'Private Sub txtAraName_GotFocus()
'FlashActiveControl txtAraName, True
'End Sub
'
'Private Sub txtAraName_LostFocus()
'FlashActiveControl txtAraName, False
'End Sub
'
'Private Sub txtAraName_Validate(Cancel As Boolean)
'If Val(fcmbAraName.BoundText) <= 0 Then
'    ErrorBox "Invalid Selection !!!"
'    txtAraName.SetFocus
'    Cancel = True
'Else
'    If mPrtAraCode_old <> Val(fcmbAraName.BoundText) Or Val(fcmbStnName.BoundText) = 0 Then
'        clsARA.GetData Val(fcmbAraName.BoundText)
'        fcmbStnName.BoundText = CStr(clsARA.mAraStnCode_lng): txtStnName.Text = fcmbStnName.Text
'        If Val(fcmbStnName.BoundText) = 0 Then
'            fcmbStnName.Requery
'            fcmbStnName.BoundText = CStr(clsARA.mAraStnCode_lng): txtStnName.Text = fcmbStnName.Text
'        End If
'    End If
'End If
'
'End Sub
'
'Private Sub txtCDctName_Change()
'If fcmbCDctName.CallFromText_Change = False Then
'    fcmbCDctName.CallFromText_Change = True
'    If InterActiveChange(txtCDctName) = True Then
'        fcmbCDctName.UserText = Array(txtCDctName.Text, txtCDctName.SelStart)
'        fcmbCDctName.Show
'        txtCDctName.Text = fcmbCDctName.Text
'        If fcmbCDctName.ListSelected = True Then
'            SendKeys "{tab}"
'        End If
'    End If
'    fcmbCDctName.CallFromText_Change = False
'End If
'
'End Sub
'
'Private Sub txtCDctName_GotFocus()
'FlashActiveControl txtCDctName, True
'End Sub
'
'Private Sub txtCDctName_LostFocus()
'FlashActiveControl txtCDctName, False
'End Sub
'
'Private Sub txtCDctName_Validate(Cancel As Boolean)
'If Val(fcmbCDctName.BoundText) <= 0 Then
'    ErrorBox "Invalid Selection !!!"
'    txtCDctName.SetFocus
'    Cancel = True
'Else
'    Call ChkServRate
'    Call CalcOpgChg
'End If
'
'End Sub
'
'Private Sub txtFDigName_Change()
'If fcmbFDigName.CallFromText_Change = False Then
'    fcmbFDigName.CallFromText_Change = True
'    If InterActiveChange(txtFDigName) = True Then
'        fcmbFDigName.UserText = Array(txtFDigName.Text, txtFDigName.SelStart)
'        fcmbFDigName.Show
'        txtFDigName.Text = fcmbFDigName.Text
'        If fcmbFDigName.ListSelected = True Then
'            SendKeys "{tab}"
'        End If
'    End If
'    fcmbFDigName.CallFromText_Change = False
'End If
'
'End Sub
'
'Private Sub txtFDigName_GotFocus()
'FlashActiveControl txtFDigName, True
'End Sub
'
'Private Sub txtFDigName_LostFocus()
'FlashActiveControl txtFDigName, False
'End Sub
'
'Private Sub txtFDigName_Validate(Cancel As Boolean)
'If Val(fcmbFDigName.BoundText) <= 0 Then
'    ErrorBox "Invalid Selection !!!"
'    txtFDigName.SetFocus
'    Cancel = True
'End If
'
'End Sub
'
'Private Sub txtOpgRemark_GotFocus()
'FlashActiveControl txtOpgRemark, True
'End Sub
'
'Private Sub txtOpgRemark_LostFocus()
'FlashActiveControl txtOpgRemark, False
'End Sub
'
'Private Sub txtOpgRemark_Validate(Cancel As Boolean)
'txtOpgRemark.Text = ToMyWord(txtOpgRemark.Text)
'End Sub
'
'Private Sub txtOpgTime_str_GotFocus()
'FlashActiveControl txtOpgTime_str, True
'End Sub
'
'Private Sub txtOpgTime_str_LostFocus()
'FlashActiveControl txtOpgTime_str, False
'End Sub
'
'Private Sub txtOpgTime_str_Validate(Cancel As Boolean)
'txtOpgTime_str.Text = MinToTime(TimeToMin(txtOpgTime_str.Text))
'If TimeToMin(txtOpgTime_str.Text) > cDAYMINUTES Then
'    ErrorBox "Invalid Input !!!"
'    txtOpgTime_str.SetFocus
'    Cancel = True
'Else
'    Call ChkServRate
'    Call CalcOpgChg
'End If
'
'End Sub
'
'Private Sub txtPttAddr_GotFocus()
'FlashActiveControl txtPttAddr, True
'End Sub
'
'Private Sub txtPttAddr_LostFocus()
'FlashActiveControl txtPttAddr, False
'End Sub
'
'Private Sub txtPttAddr_Validate(Cancel As Boolean)
'txtPttAddr.Text = ToMyWord(txtPttAddr.Text)
'End Sub
'
'Private Sub txtPttEmail_GotFocus()
'FlashActiveControl txtPttEmail, True
'End Sub
'
'Private Sub txtPttEmail_LostFocus()
'FlashActiveControl txtPttEmail, False
'End Sub

'Private Sub txtPrtName_GotFocus()
'FlashActiveControl txtPrtName, True
'End Sub
'
'Private Sub txtPrtName_KeyDown(KeyCode As Integer, Shift As Integer)
'If MyDropDownKey(Shift, KeyCode) = True Then
'    If fcmbPrtName.CallFromText_Change = False Then
'        fcmbPrtName.CallFromText_Change = True
'        If InterActiveChange(txtPrtName) = True Then
'            fcmbPrtName.UserText = Array(txtPrtName.Text, txtPrtName.SelStart)
'            fcmbPrtName.Show
'            If fcmbPrtName.ListSelected = True And Val(fcmbPrtName.BoundText) > 0 Then
'                If FormAddEditMode = cFORM_ADDMODE Then
'                    clsPAT.EndMast mPrtCode
'
'                    PatAddEditMode = cFORM_EDITMODE
'                    mPrtCode = Val(fcmbPrtName.BoundText)
'                    If clsPAT.BeginMast(mPrtCode) = True Then
'                        mPrtCode = clsPAT.ActiveCode
'                    Else
'                        mPrtCode = 0
'                    End If
'                    ShowPttDiscPer mPrtCode
'                    mOpgOldPurCode = GetOldPurCodeFromPrtCode(mPrtCode)
'                    ShowOldPurCodeDesc mOpgOldPurCode
'                    ShowPatData mPrtCode
'                    Rem SendKeys "{tab}"
'                Else
'                    AlertBox "Prohibited in Edit Mode !!!"
'                End If
'            End If
'        End If
'        fcmbPrtName.CallFromText_Change = False
'    End If
'ElseIf MyAddNewKey(Shift, KeyCode) = True Then
'    If FormAddEditMode = cFORM_ADDMODE Then
'        clsPAT.EndMast mPrtCode
'
'        PatAddEditMode = cFORM_ADDMODE
'        If clsPAT.BeginMast(0) = True Then
'            mPrtCode = clsPAT.ActiveCode
'        Else
'            mPrtCode = 0
'        End If
'        ShowPttDiscPer mPrtCode
'        mOpgOldPurCode = 0
'        ShowOldPurCodeDesc mOpgOldPurCode
'        ShowPatData mPrtCode
'        Call ShowPatDefData
'    Else
'        AlertBox "Prohibited in Edit Mode !!!"
'    End If
'ElseIf Shift = 0 And KeyCode = vbKeyF6 Then
'    Call ShowOldOpgListByPrtName
'End If
'
'End Sub
'
'Private Sub txtPrtName_LostFocus()
'FlashActiveControl txtPrtName, False
'End Sub
'
'Private Sub txtPrtName_Validate(Cancel As Boolean)
'txtPrtName.Text = ToMyWord(txtPrtName.Text)
'If Trim(txtPrtName.Text) = "" Then
'    ErrorBox "Invalid Input !!!"
'    Cancel = True
'    txtPrtName.SetFocus
'End If
'
'End Sub

Private Sub Data_AddEvent()
'Dim mPttRegNo As Long
'
'If clsOPG.BeginTran(0) = False Then
'    Exit Sub
'ElseIf clsPAT.BeginMast(0) = False Then
'    Exit Sub
'End If
'mEntrySaved = False: mEntryAborted = False
'FormAddEditMode = cFORM_ADDMODE
'PatAddEditMode = cFORM_ADDMODE
'
'clsOPG.Clear
'clsPAT.Clear
'mPurCode = clsOPG.ActiveCode
'mPrtCode = clsPAT.ActiveCode
'
'ShowPatData mPrtCode
'ShowOpgData mPurCode
'
'Rem restoring user editing features
'Call ShowPatDefData
'Call ShowOpgDefData
'
'Rem old values
'Call StorePatOldData
'Call StoreOpgOldData
'
'Call ShowEntryMode(True)
'txtPrtName.SetFocus

End Sub

Private Sub Data_EditEvent()

'If clsOPG.BeginTran(datRecset.fields("PurCode")) = False Then
'    Exit Sub
'ElseIf clsPAT.BeginMast(datRecset.fields("PurPrtCode")) = False Then
'    Exit Sub
'End If
'mEntrySaved = False: mEntryAborted = False
'FormAddEditMode = cFORM_EDITMODE
'PatAddEditMode = cFORM_EDITMODE
'
'With datRecset
'mPurCode = .fields("PurCode")
'mPrtCode = .fields("PurPrtCode")
'clsOPG.GetData mPurCode
'clsPAT.GetData mPrtCode
'End With
'
'ShowPatData mPrtCode
'ShowOpgData mPurCode
'
'Rem old values
'Call StorePatOldData
'Call StoreOpgOldData
'
'Call ShowEntryMode(True)
'txtPrtName.SetFocus

End Sub

'Private Sub ShowPatData(ByVal mPrtCode As Long)
'
'With clsPAT
'.GetData mPrtCode
'
'mskPrtCode.Text = mPrtCode
'txtPrtName.Text = .mName_str
'mskPttRegNo.Text = ToMyNumFmt(.mPttRegNo_lng, mDecimals:=0)
'dtpPttRegDate.Text = Dtoc(.mPttRegDate_dt)
'cmbPttSex.ListIndex = GetMidStrPos(cPTTSEX_LIST, .mPttSex_str, ",") - 1
'mskPttAgeYr.Text = 0
'mskPttAgeMn.Text = 0
'mskPttAgeDy.Text = 0
'dtpPttAgeAsOnDt.Text = Dtoc(.mPttAgeAsOnDt_dt)
'dtpPttDob.Text = Dtoc(.mPttDob_dt)
'fcmbPcgName.BoundText = CStr(.mPttPcgCode_lng): txtPcgName.Text = fcmbPcgName.Text
'cmbPttRefRela.ListIndex = GetMidStrPos(cPTTREFRELA_LIST, .mPttRefRela_str, ",") - 1
'txtPttRefName.Text = .mPttRefName_str
'txtPttAddr.Text = .mPttAddr_str
'fcmbAraName.BoundText = CStr(.mPrtAraCode_lng): txtAraName.Text = fcmbAraName.Text
'fcmbStnName.BoundText = CStr(.mPrtStnCode_lng): txtStnName.Text = fcmbStnName.Text
'txtPttTelNo.Text = .mPttTelNo_str
'txtPttSMSNo.Text = .mPttSMSNo_str
'txtPttEmail.Text = .mPttEmail_str
'chkPttInfAllowed.Value = IIf(.mPttInfAllowed_bln = True, vbChecked, vbUnchecked)
'chkPttDefAllowed.Value = IIf(.mPttDefAllowed_bln = True, vbChecked, vbUnchecked)
'chkPttDiscAllowed.Value = IIf(.mPttDiscAllowed_bln = True, vbChecked, vbUnchecked)
'mskPttDiscPer.Text = ToMyPerFmt(.mPttDiscPer_dbl)
'chkPttShowInList.Value = IIf(.mPttShowInList_bln = True, vbChecked, vbUnchecked)
'txtPttRemark.Text = .mPttRemark_str
'fcmbAhName.BoundText = CStr(.mPttAhCode_lng): txtAhName.Text = fcmbAhName.Text
'End With
'
'Call ShowPatAge
'Call ShowPatBal
'
'Rem disallow editing for exising patients, strictly from patient master only
'txtPrtName.Locked = (mPrtCode > 0)
'mskPttRegNo.Locked = (mPrtCode > 0)
'dtpPttRegDate.Locked = (mPrtCode > 0)
'cmbPttSex.Locked = (mPrtCode > 0)
'mskPttAgeYr.Locked = (mPrtCode > 0)
'mskPttAgeMn.Locked = (mPrtCode > 0)
'mskPttAgeDy.Locked = (mPrtCode > 0)
'dtpPttAgeAsOnDt.Locked = (mPrtCode > 0)
'dtpPttDob.Locked = (mPrtCode > 0)
'txtPcgName.Locked = (mPrtCode > 0)
'cmbPttRefRela.Locked = (mPrtCode > 0)
'txtPttRefName.Locked = (mPrtCode > 0)
'txtPttAddr.Locked = (mPrtCode > 0)
'txtAraName.Locked = (mPrtCode > 0)
'txtStnName.Locked = (mPrtCode > 0)
'txtPttTelNo.Locked = (mPrtCode > 0)
'txtPttSMSNo.Locked = (mPrtCode > 0)
'txtPttEmail.Locked = (mPrtCode > 0)
'chkPttInfAllowed.Enabled = Not (mPrtCode > 0)
'chkPttDefAllowed.Enabled = Not (mPrtCode > 0)
'chkPttDiscAllowed.Enabled = Not (mPrtCode > 0)
'mskPttDiscPer.Locked = (mPrtCode > 0)
'chkPttShowInList.Enabled = Not (mPrtCode > 0)
'txtPttRemark.Locked = (mPrtCode > 0)
'txtAhName.Locked = (mPrtCode > 0)
'
'End Sub
'
'Private Sub ShowPatDefData()
'Dim mPttRegNo As Long
'
'If clsHOPT.mOpgPttRegNoAutoNumber_bln = True Then
'    mPttRegNo = GetNextSeqno(dbGtdDatabase, "PartyMast", "PttRegNo")
'    mskPttRegNo.Text = ToMyNumFmt(mPttRegNo, mDecimals:=0)
'End If
'dtpPttRegDate.Text = Dtoc(DefaultEntryDate)
'cmbPttSex.ListIndex = 0
'dtpPttAgeAsOnDt.Text = dtpPttRegDate.Text
'dtpPttDob.Text = dtpPttRegDate.Text
'cmbPttRefRela.ListIndex = 0
'chkPttInfAllowed.Value = vbChecked
'chkPttDefAllowed.Value = vbChecked
'chkPttDiscAllowed.Value = vbChecked
'chkPttShowInList.Value = vbChecked
'fcmbAraName.BoundText = CStr(clsHOPT.GetPurchDtlOptBoundCode("OpgAraCode")): txtAraName.Text = fcmbAraName.Text
'fcmbStnName.BoundText = CStr(clsHOPT.GetPurchDtlOptBoundCode("OpgStnCode")): txtStnName.Text = fcmbStnName.Text
'fcmbPcgName.BoundText = CStr(clsHOPT.GetPurchDtlOptBoundCode("OpgPcgCode")): txtPcgName.Text = fcmbPcgName.Text
'fcmbAhName.BoundText = CStr(clsHOPT.GetPurchDtlOptBoundCode("OpgPttAhCode")): txtAhName.Text = fcmbAhName.Text
'
'Call ShowPatAge
'Call ShowPatBal
'
'End Sub
'
'Private Sub StorePatOldData()
'mPrtCode_old = mPrtCode
'mPrtName_old = txtPrtName.Text
'mPttRegNo_old = Val(UnMyNumFmt(mskPttRegNo.Text))
'mPttPcgCode_old = Val(fcmbPcgName.BoundText)
'mPttAhCode_old = Val(fcmbAhName.BoundText)
'mPrtAraCode_old = Val(fcmbAraName.BoundText)
'
'End Sub
'
'Private Sub ShowPatBal()
'Dim mOpnBal As Double, mCurBal As Double, mLCount As Integer, mUCount As Integer, mCount As Integer
'
'mOpnBal = 0
'With clsAH
'.GetData Val(fcmbAhName.BoundText)
'Rem opn balance
'mLCount = .LOpnBal
'mUCount = .UOpnBal
'For mCount = mLCount To mUCount
'    mOpnBal = mOpnBal + .OpnAmt(mCount)
'Next mCount
'
'Rem current balance
'mLCount = .LCurBal
'mUCount = .UCurBal
'For mCount = mLCount To mUCount
'    mCurBal = mCurBal + .CurAmt(mCount)
'Next mCount
'End With
'
''mskAhOpBal.Text = ToMyNumFmt(mOpnBal, mUseAbs:=True)
'lblAhCurBal.Caption = ToMyAcFmt(mCurBal)
''txtDrCrFlag.Text = SenseDrCrFlag(mOpnBal)
'
'End Sub
'
'Private Sub ShowOpgData(ByVal mPurCode As Long)
'
''With clsOPG
''.GetData mPurCode
''
''mskFormBoundField.Text = mPurCode
''fcmbVtmName.BoundText = CStr(.mVtmCode_lng): txtVtmName.Text = fcmbVtmName.Text
''txtOpgPrefix.Text = .mOpgPrefix_str
''mskOpgVchNo.Text = ToMyNumFmt(.mVchNo_lng, mDecimals:=0)
''dtpPurDate.Text = Dtoc(.mVchDate_dt)
''txtOpgTime_str.Text = MinToTime(.mOpgTime_lng)
''fcmbCDctName.BoundText = CStr(.mOpgCDctCode_lng): txtCDctName.Text = fcmbCDctName.Text
''fcmbRByName.BoundText = CStr(.mOpgRByCode_lng): txtRByName.Text = fcmbRByName.Text
''fcmbFDigName.BoundText = CStr(.mOpgFDigCode_lng): txtFDigName.Text = fcmbFDigName.Text
''fcmbSimName.BoundText = CStr(.mPurSimCode_lng): txtSimName.Text = fcmbSimName.Text
''mskOpgUnit.Text = .mOpgUnit_lng
''mskOpgRate.Text = ToMyNumFmt(.mOpgRate_dbl)
''mskOpgAmtBefDisc.Text = ToMyNumFmt(.mOpgAmtBefDisc_dbl)
''mskOpgDiscPer.Text = ToMyPerFmt(.mOpgDiscPer_dbl)
''mskPurAmount.Text = ToMyNumFmt(.mPurAmount_dbl)
''mskPurQty.Text = ToMyNumFmt(.mPurQty_dbl)
''txtOpgRemark.Text = .mOpgRemark_str
''Rem old outdoor data
''lblOldPurCodeDesc.Caption = ""
''mOpgOldPurCode = .mOpgOldPurCode_lng
''ShowOldPurCodeDesc mOpgOldPurCode
''End With
''
''Call CalcOpgChg
'
'End Sub
'
'Private Sub ShowOpgDefData()
''Dim mOpgVchNo As Long
''
''dtpPurDate.Text = Dtoc(DefaultEntryDate)
''txtOpgTime_str.Text = MinToTime(TimeToMin(DateTime.Time$))
''mskOpgUnit.Text = 1
''
''fcmbVtmName.BoundText = CStr(clsHOPT.GetPurchDtlOptBoundCode("OpgVtmCode")): txtVtmName.Text = fcmbVtmName.Text
''fcmbCDctName.BoundText = CStr(clsHOPT.GetPurchDtlOptBoundCode("OpgCDctCode")): txtCDctName.Text = fcmbCDctName.Text
''fcmbRByName.BoundText = CStr(clsHOPT.GetPurchDtlOptBoundCode("OpgRByCode")): txtRByName.Text = fcmbRByName.Text
''fcmbFDigName.BoundText = CStr(clsHOPT.GetPurchDtlOptBoundCode("OpgFDigCode")): txtFDigName.Text = fcmbFDigName.Text
''fcmbSimName.BoundText = CStr(clsHOPT.GetPurchDtlOptBoundCode("PurSimCode")): txtSimName.Text = fcmbSimName.Text
''
''mOpgVchNo = GetNextVTypeNo(dbGtdDatabase, dbAcDatabase, dbComDatabase, mTableName:="PurchDtl", mFieldName:="OpgVchNo", mVtmFieldName:="OpgVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="OpgCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="PurDate", mDateFieldValue:=Ctod(dtpPurDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormOpgAcsPermFileName)
''mskOpgVchNo.Text = ToMyNumFmt(mOpgVchNo, mDecimals:=0)
''
''' clsSRV.GetData Val(fcmbSimName.BoundText)
''' mskOpgRate.Text = ToMyNumFmt(clsSRV.mSrvOpdGenChg_dbl)
''Call ChkServRate
''Call CalcOpgChg
'
'End Sub
'
'Private Sub StoreOpgOldData()
''mPurCode_old = mPurCode
''mPurDate_old = Ctod(dtpPurDate.Text)
''mOpgTime_old = TimeToMin(txtOpgTime_str)
''mOpgVtmCode_old = Val(fcmbVtmName.BoundText)
''mOpgVchNo_old = Val(UnMyNumFmt(mskOpgVchNo.Text))
''mPurSimCode_old = Val(fcmbSimName.BoundText)
'
'End Sub
'
'Private Sub Data_SaveEvent()
'With clsPAT
'If PatAddEditMode = cFORM_ADDMODE Then
'    .Clear
'Else
'    .GetData mPrtCode
'End If
'.mName_str = txtPrtName.Text
'.mPttRegNo_lng = Val(UnMyNumFmt(mskPttRegNo.Text))
'.mPttRegDate_dt = Ctod(dtpPttRegDate.Text)
'.mPttSex_str = cmbPttSex.Text
'.mPttAgeAsOnDt_dt = Ctod(dtpPttAgeAsOnDt.Text)
'.mPttDob_dt = Ctod(dtpPttDob.Text)
'.mPttPcgCode_lng = Val(fcmbPcgName.BoundText)
'.mPttRefRela_str = cmbPttRefRela.Text
'.mPttRefName_str = txtPttRefName.Text
'.mPttAddr_str = txtPttAddr.Text
'.mPrtAraCode_lng = Val(fcmbAraName.BoundText)
'.mPrtStnCode_lng = Val(fcmbStnName.BoundText)
'.mPttTelNo_str = txtPttTelNo.Text
'.mPttSMSNo_str = txtPttSMSNo.Text
'.mPttEmail_str = txtPttEmail.Text
'.mPttInfAllowed_bln = (chkPttInfAllowed.Value = vbChecked)
'.mPttDefAllowed_bln = (chkPttDefAllowed.Value = vbChecked)
'.mPttDiscAllowed_bln = (chkPttDiscAllowed.Value = vbChecked)
'.mPttDiscPer_dbl = Val(UnMyPerFmt(mskPttDiscPer.Text))
'.mPttShowInList_bln = (chkPttShowInList.Value = vbChecked)
'.mPttRemark_str = txtPttRemark.Text
'.mPttAhCode_lng = Val(fcmbAhName.BoundText)
'If PatAddEditMode = cFORM_ADDMODE Then
'    .AddNew
'    mskPrtCode.Text = .mCode_lng
'Else
'    .Update mPrtCode
'End If
'If .mCode_lng > 0 Then   ' updated successfully
'    mPrtCode = .mCode_lng
'
'    .UpdateMast .mCode_lng
'    .EndMast .mCode_lng
'
'    With clsOPG
'    If FormAddEditMode = cFORM_ADDMODE Then
'        .Clear
'    Else
'        .GetData mPurCode
'    End If
'    .mVtmCode_lng = Val(fcmbVtmName.BoundText)
'    .mVchNo_lng = Val(UnMyNumFmt(mskOpgVchNo.Text))
'    .mVchDate_dt = Ctod(dtpPurDate.Text)
'    .mCmpCode_int = sFinYrCmpCode
'    .mOpgPrefix_str = txtOpgPrefix.Text
'    .mOpgPostfix_str = ""
'    .mOpgTime_lng = TimeToMin(txtOpgTime_str.Text)
'    .mOpgOldPurCode_lng = mOpgOldPurCode
'    .mPurPrtCode_lng = mPrtCode
'    .mOpgCDctCode_lng = Val(fcmbCDctName.BoundText)
'    .mOpgRByCode_lng = Val(fcmbRByName.BoundText)
'    .mOpgFDigCode_lng = Val(fcmbFDigName.BoundText)
'    .mPurSimCode_lng = Val(fcmbSimName.BoundText)
'    .mOpgUnit_lng = Val(UnMyNumFmt(mskOpgUnit.Text))
'    .mOpgRate_dbl = Val(UnMyNumFmt(mskOpgRate.Text))
'    .mOpgAmtBefDisc_dbl = Val(UnMyNumFmt(mskOpgAmtBefDisc.Text))
'    .mOpgDiscPer_dbl = Val(UnMyPerFmt(mskOpgDiscPer.Text))
'    .mPurAmount_dbl = Val(UnMyNumFmt(mskPurAmount.Text))
'    .mPurQty_dbl = Val(UnMyNumFmt(mskPurQty.Text))
'    .mOpgRemark_str = txtOpgRemark.Text
'
'    If FormAddEditMode = cFORM_ADDMODE Then
'        .AddNew
'        mskFormBoundField.Text = .mCode_lng
'    Else
'        .Update mPurCode
'    End If
'    If .mCode_lng > 0 Then   ' updated successfully
'        mPurCode = .mCode_lng
'
'        .UpdateTran .mCode_lng
'        .EndTran .mCode_lng
'
'
'
'
'        Rem updating user editing carry forward features
'        clsHOPT.mOpgAraCodeOld_lng = clsPAT.mPrtAraCode_lng
'        clsHOPT.mOpgStnCodeOld_lng = clsPAT.mPrtStnCode_lng
'        clsHOPT.mOpgPcgCodeOld_lng = clsPAT.mPttPcgCode_lng
'        clsHOPT.mOpgPttAhCodeOld_lng = clsPAT.mPttAhCode_lng
'        clsHOPT.mOpgVtmCodeOld_lng = .mVtmCode_lng
'        clsHOPT.mOpgCDctCodeOld_lng = .mOpgCDctCode_lng
'        clsHOPT.mOpgRByCodeOld_lng = .mOpgRByCode_lng
'        clsHOPT.mOpgFDigCodeOld_lng = .mOpgFDigCode_lng
'        clsHOPT.mPurSimCodeOld_lng = .mPurSimCode_lng
'        clsHOPT.UpdatePurchDtlOld
'
'        mEntrySaved = True
'    Else
'        Call Data_CancelEvent
'        ErrorBox "Entry Cancelled !!!"
'    End If
'
'    End With
'Else
'    Call Data_CancelEvent
'    ErrorBox "Entry Cancelled !!!"
'End If
'End With
'
'
'If clsOPG.mCode_lng > 0 Then   ' updated successfully
'
'
''''    Rem refreshing required here if new account created done at form_activate
''''    If clsAH.BeginAchd(Val(fcmbAhName.BoundText)) = True Then
''''        'clsAH.EditOpnBal mJrnICode:=clsAH.OpnICode(clsAH.LOpnBal), mJrnAmt:=Val(UnMyAcFmt(mskAhOpBal.Text, txtDrCrFlag.Text))
''''        clsAH.Update Val(fcmbAhName.BoundText), mUpdOpnBalOnly:=True
''''        clsAH.UpdateAchd Val(fcmbAhName.BoundText)
''''        clsAH.EndAchd Val(fcmbAhName.BoundText)
''''    End If
''''    If FormAddEditMode = cFORM_ADDMODE Then
''''        clsAH.UpdateDependency Val(fcmbAhName.BoundText), True
''''    Else
''''        If mPttAhCode_old <> Val(fcmbAhName.BoundText) Then
''''            clsAH.UpdateDependency mPttAhCode_old, False
''''            clsAH.UpdateDependency Val(fcmbAhName.BoundText), True
''''        End If
''''    End If
'
''''    mEntrySaved = True
''''Else
''''    Call Data_CancelEvent
''''    ErrorBox "Entry Cancelled !!!"
'End If
'
'
'End Sub
'
'Private Sub Data_DeleteEvent()
'Dim mDeleteit As Boolean, mRecAbsPos As Long, mPttAhCode As Long, mOpgVchNo As Long, mOpgVtmCode As Long, mPurDate As Date
'If (datRecset.EOF Or datRecset.BOF) = True Then
'    Exit Sub
'End If
'
'mPurCode = datRecset.fields("PurCode")
'mOpgVtmCode = datRecset.fields("OpgVtmCode")
'mOpgVchNo = datRecset.fields("OpgVchNo")
'mPurDate = datRecset.fields("PurDate")
'mPrtCode = datRecset.fields("PurPrtCode")
'mPttAhCode = datRecset.fields("PttAhCode")
'mRecAbsPos = datRecset.AbsolutePosition
'
'If clsOPG.CanDeleteTran(mPurCode) = True Then
'    txtVoid.SetFocus
'    If clsOPG.BeginTran(mPurCode) = True Then
'        clsOPG.DeleteTran mPurCode
'        clsOPG.UpdateTran mPurCode
'        clsOPG.EndTran mPurCode
'
'        Rem clsPAT.DeleteMast mPrtCode
'        Rem clsPAT.UpdateMast mPrtCode
'        Rem clsPAT.EndMast mPrtCode
'
'        Call SmryList
'        If datRecset.RecordCount > mRecAbsPos And mRecAbsPos > 0 Then
'            datRecset.Move mRecAbsPos - 1, 1
'        Else
'            MoveRecToLast datRecset
'        End If
'
'        Rem clsAH.UpdateDependency mPttAhCode, False
'    End If
'    ShowRecActiveFlexRow datRecset, Mfgrd1
'    Mfgrd1.SetFocus
'Else
'    Mfgrd1.SetFocus
'End If
'
'End Sub
'

Private Sub SmryList()
Dim gcolcount As Integer, acount As Integer, mLow As Integer, mHigh As Integer, mPos As Integer, srow As Long, mColCount As Integer
Dim aAcntBal As Variant, mBal As Double, mQryStr As String
Dim mCount_Tot As Double, mAmtAftDisc_Tot As Double, mDiscAmt_Tot As Double

Me.MousePointer = vbHourglass
If datRecset.State = 1 Then
    CloseTable datRecset
End If
RefreshDatabase dbGtdDatabase
RefreshDatabase dbAcDatabase
RefreshDatabase dbGrpDatabase
RefreshDatabase dbComDatabase
clsListStru.Clear

If optMonthwise.Value = True Or optDatewise.Value = True Or optPartyNamewise.Value = True Or optItemWise.Value = True Then
    If optMonthwise.Value = True Then
        clsListStru.AddFields mExpr:="TrnYrMonth", mAttrib:=cFAT_SYSTEM
        clsListStru.AddFields mExpr:="TrnMnYear", mTitle:="Month", mShowItem:=True, mAlign:=1, mWidth:=2000
        clsListStru.AddFields mExpr:="TrnCount", mTitle:="Count", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="TrnQty_sum", mTitle:="Qty", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="TrnAmount_sum", mTitle:="Amount", mShowItem:=True, mAlign:=7, mWidth:=1500
        
        mQryStr = "Select format(TrnDate,'yyyy/MM') as TrnYrMonth" _
         & ",Count(*) as TrnCount" _
         & ",Sum(TrnQty) as TrnQty_sum" _
         & ",Sum(TrnAmount) as TrnAmount_sum"
        mQryStr = mQryStr & " from ("
        Rem reserved query string producing no records
        mQryStr = mQryStr & "Select PurDate as TrnDate" _
         & ",PurQty as TrnQty" _
         & ",PurAmount as TrnAmount" _
         & " from PurchDtl" _
         & " inner join (PurchHdr inner join VTypMast on PurchHdr.PuhVtmCode = VTypMast.VtmCode) on PurchDtl.PurCode = PurchHdr.PuhCode" _
         & " where PurDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and PurCode > 0 and True = False" _
         & IIf(mQryPrtCode > 0, " and PurPrtCode = " & CStr(mQryPrtCode), "") _
         & IIf(mQrySimCode > 0, " and PurSimCode = " & CStr(mQrySimCode), "")
        Rem opening stock
        If chkFByOpnStock.Value = vbChecked And True = False Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select PurDate as TrnDate" _
             & ",PurQty as TrnQty" _
             & ",PurAmount as TrnAmount" _
             & " from PurchDtl" _
             & " inner join (PurchHdr inner join VTypMast on PurchHdr.PuhVtmCode = VTypMast.VtmCode) on PurchDtl.PurCode = PurchHdr.PuhCode" _
             & " where PurCode > 0 and VtmSysCode = " & CStr(cCOM_VTYPE_OPNSTK) _
             & IIf(mQryPrtCode > 0, " and PurPrtCode = " & CStr(mQryPrtCode), "") _
             & IIf(mQrySimCode > 0, " and PurSimCode = " & CStr(mQrySimCode), "")
        End If
        Rem purchase
        If chkFByPurch.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select PurDate as TrnDate" _
             & ",PurQty as TrnQty" _
             & ",PurAmount as TrnAmount" _
             & " from PurchDtl" _
             & " inner join (PurchHdr inner join VTypMast on PurchHdr.PuhVtmCode = VTypMast.VtmCode) on PurchDtl.PurCode = PurchHdr.PuhCode" _
             & " where PurDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and PurCode > 0 and VtmSysCode = " & CStr(cCOM_VTYPE_PURCHASE) _
             & IIf(mQryPrtCode > 0, " and PurPrtCode = " & CStr(mQryPrtCode), "") _
             & IIf(mQrySimCode > 0, " and PurSimCode =" & CStr(mQrySimCode), "")
        End If
        Rem sales return
        If chkFByRetnInw.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select PurDate as TrnDate" _
             & ",PurQty as TrnQty" _
             & ",PurAmount as TrnAmount" _
             & " from PurchDtl" _
             & " inner join (PurchHdr inner join VTypMast on PurchHdr.PuhVtmCode = VTypMast.VtmCode) on PurchDtl.PurCode = PurchHdr.PuhCode" _
             & " where PurDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and PurCode > 0 and VtmSysCode = " & CStr(cCOM_VTYPE_RETNINW) _
             & IIf(mQryPrtCode > 0, " and PurPrtCode = " & CStr(mQryPrtCode), "") _
             & IIf(mQrySimCode > 0, " and PurSimCode =" & CStr(mQrySimCode), "")
        End If
        Rem sales ---------------------
        If chkFBySale.Value = vbChecked = True Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select SalDate as TrnDate" _
             & ",SalQty as TrnQty" _
             & ",SalAmount as TrnAmount" _
             & " from SaleDtl" _
             & " inner join (SaleHdr inner join VTypMast on SaleHdr.SahVtmCode = VTypMast.VtmCode) on SaleDtl.SalCode = SaleHdr.SahCode" _
             & " where SalDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and SalCode > 0 and VtmSysCode = " & CStr(cCOM_VTYPE_SALES) _
             & IIf(mQryPrtCode > 0, " and SalPrtCode = " & CStr(mQryPrtCode), "") _
             & IIf(mQrySimCode > 0, " and SalSimCode = " & CStr(mQrySimCode), "")
        End If
        Rem purchase return
        If chkFByRetnOutw.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select SalDate as TrnDate" _
             & ",SalQty as TrnQty" _
             & ",SalAmount as TrnAmount" _
             & " from SaleDtl" _
             & " inner join (SaleHdr inner join VTypMast on SaleHdr.SahVtmCode = VTypMast.VtmCode) on SaleDtl.SalCode = SaleHdr.SahCode" _
             & " where SalDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and SalCode > 0 and VtmSysCode = " & CStr(cCOM_VTYPE_RETNOUTW) _
             & IIf(mQryPrtCode > 0, " and SalPrtCode = " & CStr(mQryPrtCode), "") _
             & IIf(mQrySimCode > 0, " and SalSimCode = " & CStr(mQrySimCode), "")
        End If
        Rem ----------------------------------
        mQryStr = mQryStr & ")"
        mQryStr = mQryStr & " group by format(TrnDate,'yyyy/MM')" _
         & " order by format(TrnDate,'yyyy/MM')"
        
        datRecset.Open mQryStr, dbComDatabase, adOpenKeyset, adLockReadOnly
        
    ElseIf optDatewise.Value = True Then
        clsListStru.AddFields mExpr:="TrnDateYMD", mAttrib:=cFAT_SYSTEM
        clsListStru.AddFields mExpr:="TrnDate", mTitle:="Date", mShowItem:=True, mAlign:=1, mWidth:=2000
        clsListStru.AddFields mExpr:="TrnCount", mTitle:="Count", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="TrnQty_sum", mTitle:="Qty", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="TrnAmount_sum", mTitle:="Amount", mShowItem:=True, mAlign:=7, mWidth:=1500
        
        mQryStr = "Select TrnDate" _
         & ",Count(*) as TrnCount" _
         & ",Sum(TrnQty) as TrnQty_sum" _
         & ",Sum(TrnAmount) as TrnAmount_sum"
        mQryStr = mQryStr & " from ("
        Rem reserved query string producing no records
        mQryStr = mQryStr & "Select PurDate as TrnDate" _
         & ",PurQty as TrnQty" _
         & ",PurAmount as TrnAmount" _
         & " from PurchDtl" _
         & " inner join (PurchHdr inner join VTypMast on PurchHdr.PuhVtmCode = VTypMast.VtmCode) on PurchDtl.PurCode = PurchHdr.PuhCode" _
         & " where PurDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and PurCode > 0 and True = False" _
         & IIf(mQryPrtCode > 0, " and PurPrtCode = " & CStr(mQryPrtCode), "") _
         & IIf(mQrySimCode > 0, " and PurSimCode = " & CStr(mQrySimCode), "")
        Rem opening stock
        If chkFByOpnStock.Value = vbChecked And True = False Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & "Select PurDate as TrnDate" _
             & ",PurQty as TrnQty" _
             & ",PurAmount as TrnAmount" _
             & " from PurchDtl" _
             & " inner join (PurchHdr inner join VTypMast on PurchHdr.PuhVtmCode = VTypMast.VtmCode) on PurchDtl.PurCode = PurchHdr.PuhCode" _
             & " where PurCode > 0 and VtmSysCode = " & CStr(cCOM_VTYPE_OPNSTK) _
             & " and PurDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & IIf(mQryPrtCode > 0, " and PurPrtCode = " & CStr(mQryPrtCode), "") _
             & IIf(mQrySimCode > 0, " and PurSimCode = " & CStr(mQrySimCode), "")
        End If
        Rem purchase
        If chkFByPurch.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select PurDate as TrnDate" _
             & ",PurQty as TrnQty" _
             & ",PurAmount as TrnAmount" _
             & " from PurchDtl" _
             & " inner join (PurchHdr inner join VTypMast on PurchHdr.PuhVtmCode = VTypMast.VtmCode) on PurchDtl.PurCode = PurchHdr.PuhCode" _
             & " where PurDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and PurCode > 0 and VtmSysCode = " & CStr(cCOM_VTYPE_PURCHASE) _
             & IIf(mQryPrtCode > 0, " and PurPrtCode = " & CStr(mQryPrtCode), "") _
             & IIf(mQrySimCode > 0, " and PurSimCode = " & CStr(mQrySimCode), "")
        End If
        Rem sales return
        If chkFByRetnInw.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select PurDate as TrnDate" _
             & ",PurQty as TrnQty" _
             & ",PurAmount as TrnAmount" _
             & " from PurchDtl" _
             & " inner join (PurchHdr inner join VTypMast on PurchHdr.PuhVtmCode = VTypMast.VtmCode) on PurchDtl.PurCode = PurchHdr.PuhCode" _
             & " where PurDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and PurCode > 0 and VtmSysCode = " & CStr(cCOM_VTYPE_RETNINW) _
             & IIf(mQryPrtCode > 0, " and PurPrtCode = " & CStr(mQryPrtCode), "") _
             & IIf(mQrySimCode > 0, " and PurSimCode = " & CStr(mQrySimCode), "")
        End If
        Rem sales ---------------------
        If chkFBySale.Value = vbChecked = True Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select SalDate as TrnDate" _
             & ",SalQty as TrnQty" _
             & ",SalAmount as TrnAmount" _
             & " from SaleDtl" _
             & " inner join (SaleHdr inner join VTypMast on SaleHdr.SahVtmCode = VTypMast.VtmCode) on SaleDtl.SalCode = SaleHdr.SahCode" _
             & " where SalDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and SalCode > 0 and VtmSysCode = " & CStr(cCOM_VTYPE_SALES) _
             & IIf(mQryPrtCode > 0, " and SalPrtCode = " & CStr(mQryPrtCode), "") _
             & IIf(mQrySimCode > 0, " and SalSimCode = " & CStr(mQrySimCode), "")
        End If
        Rem purchase return
        If chkFByRetnOutw.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select SalDate as TrnDate" _
             & ",SalQty as TrnQty" _
             & ",SalAmount as TrnAmount" _
             & " from SaleDtl" _
             & " inner join (SaleHdr inner join VTypMast on SaleHdr.SahVtmCode = VTypMast.VtmCode) on SaleDtl.SalCode = SaleHdr.SahCode" _
             & " where SalDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and SalCode > 0 and VtmSysCode = " & CStr(cCOM_VTYPE_RETNOUTW) _
             & IIf(mQryPrtCode > 0, " and SalPrtCode = " & CStr(mQryPrtCode), "") _
             & IIf(mQrySimCode > 0, " and SalSimCode = " & CStr(mQrySimCode), "")
        End If
        Rem ----------------------------------
        mQryStr = mQryStr & ")"
        mQryStr = mQryStr & " group by TrnDate" _
         & " order by TrnDate"
        
        datRecset.Open mQryStr, dbComDatabase, adOpenKeyset, adLockReadOnly
        
    ElseIf optPartyNamewise.Value = True Then
        clsListStru.AddFields mExpr:="PrtName", mTitle:="Party Name", mShowItem:=True, mAlign:=1, mWidth:=3000
        clsListStru.AddFields mExpr:="TrnCount", mTitle:="Count", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="TrnQty_sum", mTitle:="Qty", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="TrnAmount_sum", mTitle:="Amount", mShowItem:=True, mAlign:=7, mWidth:=1500
        
        mQryStr = "Select PartyMast.PrtName,t1.TrnPrtCode" _
         & ",Count(*) as TrnCount" _
         & ",Sum(t1.TrnQty) as TrnQty_sum" _
         & ",Sum(t1.TrnAmount) as TrnAmount_sum"
        mQryStr = mQryStr & " from ("
        Rem reserved query string producing no records
        mQryStr = mQryStr & "Select PurPrtCode as TrnPrtCode" _
         & ",PurQty as TrnQty" _
         & ",PurAmount as TrnAmount" _
         & " from PurchDtl" _
         & " inner join (PurchHdr inner join VTypMast on PurchHdr.PuhVtmCode = VTypMast.VtmCode) on PurchDtl.PurCode = PurchHdr.PuhCode" _
         & " where PurDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and PurCode > 0 and True = False" _
         & IIf(mQryPrtCode > 0, " and PurPrtCode = " & CStr(mQryPrtCode), "") _
         & IIf(mQrySimCode > 0, " and PurSimCode = " & CStr(mQrySimCode), "")
        Rem opening stock
        If chkFByOpnStock.Value = vbChecked And True = False Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select PurPrtCode as TrnPrtCode" _
             & ",PurQty as TrnQty" _
             & ",PurAmount as TrnAmount" _
             & " from PurchDtl" _
             & " inner join (PurchHdr inner join VTypMast on PurchHdr.PuhVtmCode = VTypMast.VtmCode) on PurchDtl.PurCode = PurchHdr.PuhCode" _
             & " where PurCode > 0 and VtmSysCode = " & CStr(cCOM_VTYPE_OPNSTK) _
             & IIf(mQryPrtCode > 0, " and PurPrtCode = " & CStr(mQryPrtCode), "") _
             & IIf(mQrySimCode > 0, " and PurSimCode = " & CStr(mQrySimCode), "")
        End If
        Rem purchase
        If chkFByPurch.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select PurPrtCode as TrnPrtCode" _
             & ",PurQty as TrnQty" _
             & ",PurAmount as TrnAmount" _
             & " from PurchDtl" _
             & " inner join (PurchHdr inner join VTypMast on PurchHdr.PuhVtmCode = VTypMast.VtmCode) on PurchDtl.PurCode = PurchHdr.PuhCode" _
             & " where PurDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and PurCode > 0 and VtmSysCode = " & CStr(cCOM_VTYPE_PURCHASE) _
             & IIf(mQryPrtCode > 0, " and PurPrtCode = " & CStr(mQryPrtCode), "") _
             & IIf(mQrySimCode > 0, " and PurSimCode = " & CStr(mQrySimCode), "")
        End If
        Rem sales return
        If chkFByRetnInw.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select PurPrtCode as TrnPrtCode" _
             & ",PurQty as TrnQty" _
             & ",PurAmount as TrnAmount" _
             & " from PurchDtl" _
             & " inner join (PurchHdr inner join VTypMast on PurchHdr.PuhVtmCode = VTypMast.VtmCode) on PurchDtl.PurCode = PurchHdr.PuhCode" _
             & " where PurDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and PurCode > 0 and VtmSysCode = " & CStr(cCOM_VTYPE_RETNINW) _
             & IIf(mQryPrtCode > 0, " and PurPrtCode = " & CStr(mQryPrtCode), "") _
             & IIf(mQrySimCode > 0, " and PurSimCode = " & CStr(mQrySimCode), "")
        End If
        Rem sales ---------------------
        If chkFBySale.Value = vbChecked = True Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select SalPrtCode as TrnPrtCode" _
             & ",SalQty as TrnQty" _
             & ",SalAmount as TrnAmount" _
             & " from SaleDtl" _
             & " inner join (SaleHdr inner join VTypMast on SaleHdr.SahVtmCode = VTypMast.VtmCode) on SaleDtl.SalCode = SaleHdr.SahCode" _
             & " where SalDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and SalCode > 0 and VtmSysCode = " & CStr(cCOM_VTYPE_SALES) _
             & IIf(mQryPrtCode > 0, " and SalPrtCode = " & CStr(mQryPrtCode), "") _
             & IIf(mQrySimCode > 0, " and SalSimCode = " & CStr(mQrySimCode), "")
        End If
        Rem purchase return
        If chkFByRetnOutw.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select SalPrtCode as TrnPrtCode" _
             & ",SalQty as TrnQty" _
             & ",SalAmount as TrnAmount" _
             & " from SaleDtl" _
             & " inner join (SaleHdr inner join VTypMast on SaleHdr.SahVtmCode = VTypMast.VtmCode) on SaleDtl.SalCode = SaleHdr.SahCode" _
             & " where SalDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and SalCode > 0 and VtmSysCode = " & CStr(cCOM_VTYPE_RETNOUTW) _
             & IIf(mQryPrtCode > 0, " and SalPrtCode = " & CStr(mQryPrtCode), "") _
             & IIf(mQrySimCode > 0, " and SalSimCode = " & CStr(mQrySimCode), "")
        End If
        Rem ----------------------------------
        mQryStr = mQryStr & ")"
        mQryStr = mQryStr & " as t1 inner join PartyMast on t1.TrnPrtCode=PartyMast.PrtCode" _
         & " group by PartyMast.PrtName,t1.TrnPrtCode" _
         & " order by PartyMast.PrtName,t1.TrnPrtCode"
        
        datRecset.Open mQryStr, dbComDatabase, adOpenKeyset, adLockReadOnly
        
    ElseIf optItemWise.Value = True Then
        clsListStru.AddFields mExpr:="TrnSimName", mTitle:="Item Name", mShowItem:=True, mAlign:=1, mWidth:=3000
        clsListStru.AddFields mExpr:="TrnCount", mTitle:="Count", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="TrnQty_sum", mTitle:="Qty", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="TrnAmount_sum", mTitle:="Amount", mShowItem:=True, mAlign:=7, mWidth:=1500
        
        mQryStr = "Select " _
         & " t1.TrnSimName,t1.TrnSimCode" _
         & ",Count(*) as TrnCount" _
         & ",Sum(t1.TrnQty) as TrnQty_sum" _
         & ",Sum(t1.TrnAmount) as TrnAmount_sum"
        mQryStr = mQryStr & " from ("
        Rem reserved query string producing no records
        mQryStr = mQryStr & "Select PurSimCode as TrnSimCode,SubItmMast.SimName as TrnSimName" _
         & ",PurQty as TrnQty" _
         & ",PurAmount as TrnAmount" _
         & " from (PurchDtl" _
         & " inner join (PurchHdr inner join VTypMast on PurchHdr.PuhVtmCode = VTypMast.VtmCode) on PurchDtl.PurCode = PurchHdr.PuhCode)" _
         & " inner join SubItmMast on PurchDtl.PurSimCode=SubItmMast.SimCode" _
         & " where PurDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and PurCode > 0 and True = False" _
         & IIf(mQryPrtCode > 0, " and PurPrtCode = " & CStr(mQryPrtCode), "") _
         & IIf(mQrySimCode > 0, " and PurSimCode = " & CStr(mQrySimCode), "")
        Rem opening stock
        If chkFByOpnStock.Value = vbChecked And True = False Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select PurSimCode as TrnSimCode,SubItmMast.SimName as TrnSimName" _
             & ",PurQty as TrnQty" _
             & ",PurAmount as TrnAmount" _
             & " from (PurchDtl" _
             & " inner join (PurchHdr inner join VTypMast on PurchHdr.PuhVtmCode = VTypMast.VtmCode) on PurchDtl.PurCode = PurchHdr.PuhCode)" _
             & " inner join SubItmMast on PurchDtl.PurSimCode=SubItmMast.SimCode" _
             & " where PurCode > 0 and VtmSysCode = " & CStr(cCOM_VTYPE_OPNSTK) _
             & IIf(mQryPrtCode > 0, " and PurPrtCode = " & CStr(mQryPrtCode), "") _
             & IIf(mQrySimCode > 0, " and PurSimCode = " & CStr(mQrySimCode), "")
        End If
        Rem purchase
        If chkFByPurch.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select PurSimCode as TrnSimCode,SubItmMast.SimName as TrnSimName" _
             & ",PurQty as TrnQty" _
             & ",PurAmount as TrnAmount" _
             & " from (PurchDtl" _
             & " inner join (PurchHdr inner join VTypMast on PurchHdr.PuhVtmCode = VTypMast.VtmCode) on PurchDtl.PurCode = PurchHdr.PuhCode)" _
             & " inner join SubItmMast on PurchDtl.PurSimCode=SubItmMast.SimCode" _
             & " where PurDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and PurCode > 0 and VtmSysCode = " & CStr(cCOM_VTYPE_PURCHASE) _
             & IIf(mQryPrtCode > 0, " and PurPrtCode = " & CStr(mQryPrtCode), "") _
             & IIf(mQrySimCode > 0, " and PurSimCode = " & CStr(mQrySimCode), "")
        End If
        Rem sales return
        If chkFByRetnInw.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select PurSimCode as TrnSimCode,SubItmMast.SimName as TrnSimName" _
             & ",PurQty as TrnQty" _
             & ",PurAmount as TrnAmount" _
             & " from (PurchDtl" _
             & " inner join (PurchHdr inner join VTypMast on PurchHdr.PuhVtmCode = VTypMast.VtmCode) on PurchDtl.PurCode = PurchHdr.PuhCode)" _
             & " inner join SubItmMast on PurchDtl.PurSimCode = SubItmMast.SimCode" _
             & " where PurDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and PurCode > 0 and VtmSysCode = " & CStr(cCOM_VTYPE_RETNINW) _
             & IIf(mQryPrtCode > 0, " and PurPrtCode = " & CStr(mQryPrtCode), "") _
             & IIf(mQrySimCode > 0, " and PurSimCode = " & CStr(mQrySimCode), "")
        End If
        Rem sales ---------------------
        If chkFBySale.Value = vbChecked = True Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select SalSimCode as TrnSimCode,SubItmMast.SimName as TrnSimName" _
             & ",SalQty as TrnQty" _
             & ",SalAmount as TrnAmount" _
             & " from (SaleDtl" _
             & " inner join (SaleHdr inner join VTypMast on SaleHdr.SahVtmCode = VTypMast.VtmCode) on SaleDtl.SalCode = SaleHdr.SahCode)" _
             & " inner join SubItmMast on SaleDtl.SalSimCode = SubItmMast.SimCode" _
             & " where SalDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and SalCode > 0 and VtmSysCode = " & CStr(cCOM_VTYPE_SALES) _
             & IIf(mQryPrtCode > 0, " and SalPrtCode = " & CStr(mQryPrtCode), "") _
             & IIf(mQrySimCode > 0, " and SalSimCode = " & CStr(mQrySimCode), "")
        End If
        Rem purchase return
        If chkFByRetnOutw.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select SalSimCode as TrnSimCode,SubItmMast.SimName as TrnSimName" _
             & ",SalQty as TrnQty" _
             & ",SalAmount as TrnAmount" _
             & " from (SaleDtl" _
             & " inner join (SaleHdr inner join VTypMast on SaleHdr.SahVtmCode = VTypMast.VtmCode) on SaleDtl.SalCode = SaleHdr.SahCode)" _
             & " inner join SubItmMast on SaleDtl.SalSimCode=SubItmMast.SimCode" _
             & " where SalDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and SalCode > 0 and VtmSysCode = " & CStr(cCOM_VTYPE_RETNOUTW) _
             & IIf(mQryPrtCode > 0, " and SalPrtCode = " & CStr(mQryPrtCode), "") _
             & IIf(mQrySimCode > 0, " and SalSimCode = " & CStr(mQrySimCode), "")
        End If
        Rem ----------------------------------
        mQryStr = mQryStr & ")"
        mQryStr = mQryStr & " as t1 group by t1.TrnSimName,t1.TrnSimCode" _
         & " order by t1.TrnSimName,t1.TrnSimCode"
        
        datRecset.Open mQryStr, dbComDatabase, adOpenKeyset, adLockReadOnly
    End If
    
ElseIf optExpanded.Value = True Then
    clsListStru.AddFields mExpr:="tTrnSmryId", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="TrnVtmCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="VtmSysCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="TrnCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="VtmName", mTitle:="Voucher", mAlign:=1, mWidth:=2250, mShowItem:=True
    clsListStru.AddFields mExpr:="TrnVchNo", mTitle:="Vchr.No", mAlign:=7, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="TrnDate", mTitle:="Date", mAlign:=1, mWidth:=1300, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="PrtCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="PrtName", mTitle:="Party Name", mAlign:=1, mWidth:=2500, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="TrnSimName", mTitle:="Item Name", mAlign:=1, mWidth:=2500, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="TrnQty", mTitle:="Qty", mAlign:=7, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="TrnAmount", mTitle:="Amount", mAlign:=7, mWidth:=1250, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="PttAddr", mTitle:="Address", mAlign:=1, mWidth:=2000, mShowItem:=True
    clsListStru.AddFields mExpr:="PatAraName", mTitle:="Area", mAlign:=1, mWidth:=1500, mShowItem:=True
    clsListStru.AddFields mExpr:="PatStnName", mTitle:="Station", mAlign:=1, mWidth:=1500, mShowItem:=True
    
    mQryStr = "Select *" _
     & ",format(TrnDate,'yyyymmdd')+format(TrnVtmCode,'" & cLONGCODESTRFMT & "')+format(TrnCode,'" & cLONGCODESTRFMT & "') as tTrnSmryId"
    mQryStr = mQryStr & " from ("
    Rem reserved query string producing no records
    mQryStr = mQryStr & "Select " _
     & "VtmSysCode" _
     & ",PurCode as TrnCode" _
     & ",PurDate as TrnDate" _
     & ",PurSimCode as TrnSimCode,SubItmMast.SimName as TrnSimName" _
     & ",PurPrtCode as TrnPrtCode" _
     & ",PuhVchNo as TrnVchNo" _
     & ",PuhVtmCode as TrnVtmCode" _
     & ",PurQty as TrnQty" _
     & ",PurAmount as TrnAmount" _
     & " from (PurchDtl" _
     & " inner join (PurchHdr inner join VTypMast on PurchHdr.PuhVtmCode = VTypMast.VtmCode) on PurchDtl.PurCode = PurchHdr.PuhCode)" _
     & " inner join SubItmMast on PurchDtl.PurSimCode = SubItmMast.SimCode" _
     & " where PurDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & " and PurCode>0 and True = False" _
     & IIf(mQryPrtCode > 0, " and PurPrtCode = " & CStr(mQryPrtCode), "") _
     & IIf(mQrySimCode > 0, " and PurSimCode = " & CStr(mQrySimCode), "")
    Rem opening stock
    If chkFByOpnStock.Value = vbChecked And True = False Then
        mQryStr = mQryStr & " UNION ALL "
        mQryStr = mQryStr & " Select " _
         & "VtmSysCode" _
         & ",PurCode as TrnCode" _
         & ",PurDate as TrnDate" _
         & ",PurSimCode as TrnSimCode,SubItmMast.SimName as TrnSimName" _
         & ",PurPrtCode as TrnPrtCode" _
         & ",PuhVchNo as TrnVchNo" _
         & ",PuhVtmCode as TrnVtmCode" _
         & ",PurQty as TrnQty" _
         & ",PurAmount as TrnAmount" _
         & " from (PurchDtl" _
         & " inner join (PurchHdr inner join VTypMast on PurchHdr.PuhVtmCode = VTypMast.VtmCode) on PurchDtl.PurCode = PurchHdr.PuhCode)" _
         & " inner join SubItmMast on PurchDtl.PurSimCode = SubItmMast.SimCode" _
         & " where PurCode > 0 and VtmSysCode = " & CStr(cCOM_VTYPE_OPNSTK) _
         & " and PurDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & IIf(mQryPrtCode > 0, " and PurPrtCode = " & CStr(mQryPrtCode), "") _
         & IIf(mQrySimCode > 0, " and PurSimCode = " & CStr(mQrySimCode), "")
    End If
    Rem purchase
    If chkFByPurch.Value = vbChecked Then
        mQryStr = mQryStr & " UNION ALL "
        mQryStr = mQryStr & " Select " _
         & "VtmSysCode" _
         & ",PurCode as TrnCode" _
         & ",PurDate as TrnDate" _
         & ",PurSimCode as TrnSimCode,SubItmMast.SimName as TrnSimName" _
         & ",PurPrtCode as TrnPrtCode" _
         & ",PuhVchNo as TrnVchNo" _
         & ",PuhVtmCode as TrnVtmCode" _
         & ",PurQty as TrnQty" _
         & ",PurAmount as TrnAmount" _
         & " from (PurchDtl" _
         & " inner join (PurchHdr inner join VTypMast on PurchHdr.PuhVtmCode = VTypMast.VtmCode) on PurchDtl.PurCode = PurchHdr.PuhCode)" _
         & " inner join SubItmMast on PurchDtl.PurSimCode = SubItmMast.SimCode" _
         & " where PurDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and PurCode > 0 and VtmSysCode = " & CStr(cCOM_VTYPE_PURCHASE) _
         & IIf(mQryPrtCode > 0, " and PurPrtCode = " & CStr(mQryPrtCode), "") _
         & IIf(mQrySimCode > 0, " and PurSimCode = " & CStr(mQrySimCode), "")
    End If
    Rem sales return
    If chkFByRetnInw.Value = vbChecked Then
        mQryStr = mQryStr & " UNION ALL "
        mQryStr = mQryStr & " Select " _
         & "VtmSysCode" _
         & ",PurCode as TrnCode" _
         & ",PurDate as TrnDate" _
         & ",PurSimCode as TrnSimCode,SubItmMast.SimName as TrnSimName" _
         & ",PurPrtCode as TrnPrtCode" _
         & ",PuhVchNo as TrnVchNo" _
         & ",PuhVtmCode as TrnVtmCode" _
         & ",PurQty as TrnQty" _
         & ",PurAmount as TrnAmount" _
         & " from (PurchDtl" _
         & " inner join (PurchHdr inner join VTypMast on PurchHdr.PuhVtmCode = VTypMast.VtmCode) on PurchDtl.PurCode = PurchHdr.PuhCode)" _
         & " inner join SubItmMast on PurchDtl.PurSimCode = SubItmMast.SimCode" _
         & " where PurDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and PurCode > 0 and VtmSysCode = " & CStr(cCOM_VTYPE_RETNINW) _
         & IIf(mQryPrtCode > 0, " and PurPrtCode = " & CStr(mQryPrtCode), "") _
         & IIf(mQrySimCode > 0, " and PurSimCode = " & CStr(mQrySimCode), "")
    End If
    Rem sales ---------------------
    If chkFBySale.Value = vbChecked = True Then
        mQryStr = mQryStr & " UNION ALL "
        mQryStr = mQryStr & " Select " _
         & "VtmSysCode" _
         & ",SalCode as TrnCode" _
         & ",SalDate as TrnDate" _
         & ",SalSimCode as TrnSimCode,SubItmMast.SimName as TrnSimName" _
         & ",SalPrtCode as TrnPrtCode" _
         & ",SahVchNo as TrnVchNo" _
         & ",SahVtmCode as TrnVtmCode" _
         & ",SalQty as TrnQty" _
         & ",SalAmount as TrnAmount" _
         & " from (SaleDtl" _
         & " inner join (SaleHdr inner join VTypMast on SaleHdr.SahVtmCode = VTypMast.VtmCode) on SaleDtl.SalCode = SaleHdr.SahCode)" _
         & " inner join SubItmMast on SaleDtl.SalSimCode = SubItmMast.SimCode" _
         & " where SalDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and SalCode > 0 and VtmSysCode = " & CStr(cCOM_VTYPE_SALES) _
         & IIf(mQryPrtCode > 0, " and SalPrtCode = " & CStr(mQryPrtCode), "") _
         & IIf(mQrySimCode > 0, " and SalSimCode = " & CStr(mQrySimCode), "")
    End If
    Rem purchase return
    If chkFByRetnOutw.Value = vbChecked Then
        mQryStr = mQryStr & " UNION ALL "
        mQryStr = mQryStr & " Select " _
         & "VtmSysCode" _
         & ",SalCode as TrnCode" _
         & ",SalDate as TrnDate" _
         & ",SalSimCode as TrnSimCode,SubItmMast.SimName as TrnSimName" _
         & ",SalPrtCode as TrnPrtCode" _
         & ",SahVchNo as TrnVchNo" _
         & ",SahVtmCode as TrnVtmCode" _
         & ",SalQty as TrnQty" _
         & ",SalAmount as TrnAmount" _
         & " from (SaleDtl" _
         & " inner join (SaleHdr inner join VTypMast on SaleHdr.SahVtmCode = VTypMast.VtmCode) on SaleDtl.SalCode = SaleHdr.SahCode)" _
         & " inner join SubItmMast on SaleDtl.SalSimCode = SubItmMast.SimCode" _
         & " where SalDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and SalCode > 0 and VtmSysCode = " & CStr(cCOM_VTYPE_RETNOUTW) _
         & IIf(mQryPrtCode > 0, " and SalPrtCode = " & CStr(mQryPrtCode), "") _
         & IIf(mQrySimCode > 0, " and SalSimCode = " & CStr(mQrySimCode), "")
    End If
    Rem ----------------------------------
    mQryStr = mQryStr & ") as t1"
    mQryStr = mQryStr & " inner join PartyMast on t1.TrnPrtCode = PartyMast.PrtCode" _
     & " order by t1.TrnDate,t1.VtmSysCode,t1.TrnVtmCode,t1.TrnCode"
    
    datRecset.Open mQryStr, dbComDatabase, adOpenKeyset, adLockReadOnly
    
ElseIf optDetailed.Value = True Then    ''' ------------------------------------------------------------------------
    clsListStru.AddFields mExpr:="tTrnSmryId", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="TrnVtmCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="VtmSysCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="TrnCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="VtmName", mTitle:="Voucher", mAlign:=1, mWidth:=2250, mShowItem:=True
    clsListStru.AddFields mExpr:="TrnVchNo", mTitle:="Vchr.No", mAlign:=7, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="TrnDate", mTitle:="Date", mAlign:=1, mWidth:=1300, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="PrtCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="PrtName", mTitle:="Party Name", mAlign:=1, mWidth:=2500, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="TrnQty", mTitle:="Qty", mAlign:=7, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="TrnAmount", mTitle:="Amount", mAlign:=7, mWidth:=1250, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="PttAddr", mTitle:="Address", mAlign:=1, mWidth:=2000, mShowItem:=True
    clsListStru.AddFields mExpr:="PatAraName", mTitle:="Area", mAlign:=1, mWidth:=1500, mShowItem:=True
    clsListStru.AddFields mExpr:="PatStnName", mTitle:="Station", mAlign:=1, mWidth:=1500, mShowItem:=True
    
    mQryStr = "Select *" _
     & ",format(TrnDate,'yyyymmdd')+format(TrnVtmCode,'" & cLONGCODESTRFMT & "')+format(TrnCode,'" & cLONGCODESTRFMT & "') as tTrnSmryId"
    mQryStr = mQryStr & " from ("
    Rem reserved query string producing no records
    mQryStr = mQryStr & "Select " _
     & "VtmSysCode" _
     & ",PuhCode as TrnCode" _
     & ",PuhDate as TrnDate" _
     & ",PuhPrtCode as TrnPrtCode" _
     & ",PuhVchNo as TrnVchNo" _
     & ",PuhVtmCode as TrnVtmCode" _
     & ",PuhQty as TrnQty" _
     & ",PuhAmount as TrnAmount" _
     & " from PurchHdr" _
     & " inner join VTypMast on PurchHdr.PuhVtmCode = VTypMast.VtmCode" _
     & " where PuhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & " and PuhCode>0 and True = False" _
     & IIf(mQryPrtCode > 0, " and PuhPrtCode = " & CStr(mQryPrtCode), "")
    Rem opening stock
    If chkFByOpnStock.Value = vbChecked And True = False Then
        mQryStr = mQryStr & " UNION ALL "
        mQryStr = mQryStr & " Select " _
         & "VtmSysCode" _
         & ",PuhCode as TrnCode" _
         & ",PuhDate as TrnDate" _
         & ",PuhPrtCode as TrnPrtCode" _
         & ",PuhVchNo as TrnVchNo" _
         & ",PuhVtmCode as TrnVtmCode" _
         & ",PuhQty as TrnQty" _
         & ",PuhAmount as TrnAmount" _
         & " from PurchHdr" _
         & " inner join VTypMast on PurchHdr.PuhVtmCode = VTypMast.VtmCode" _
         & " where PuhCode > 0 and VtmSysCode = " & CStr(cCOM_VTYPE_OPNSTK) _
         & " and PuhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & IIf(mQryPrtCode > 0, " and PuhPrtCode = " & CStr(mQryPrtCode), "")
    End If
    Rem purchase
    If chkFByPurch.Value = vbChecked Then
        mQryStr = mQryStr & " UNION ALL "
        mQryStr = mQryStr & " Select " _
         & "VtmSysCode" _
         & ",PuhCode as TrnCode" _
         & ",PuhDate as TrnDate" _
         & ",PuhPrtCode as TrnPrtCode" _
         & ",PuhVchNo as TrnVchNo" _
         & ",PuhVtmCode as TrnVtmCode" _
         & ",PuhQty as TrnQty" _
         & ",PuhAmount as TrnAmount" _
         & " from PurchHdr" _
         & " inner join VTypMast on PurchHdr.PuhVtmCode = VTypMast.VtmCode" _
         & " where PuhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and PuhCode > 0 and VtmSysCode = " & CStr(cCOM_VTYPE_PURCHASE) _
         & IIf(mQryPrtCode > 0, " and PuhPrtCode = " & CStr(mQryPrtCode), "")
    End If
    Rem sales return
    If chkFByRetnInw.Value = vbChecked Then
        mQryStr = mQryStr & " UNION ALL "
        mQryStr = mQryStr & " Select " _
         & "VtmSysCode" _
         & ",PuhCode as TrnCode" _
         & ",PuhDate as TrnDate" _
         & ",PuhPrtCode as TrnPrtCode" _
         & ",PuhVchNo as TrnVchNo" _
         & ",PuhVtmCode as TrnVtmCode" _
         & ",PuhQty as TrnQty" _
         & ",PuhAmount as TrnAmount" _
         & " from PurchHdr" _
         & " inner join VTypMast on PurchHdr.PuhVtmCode = VTypMast.VtmCode" _
         & " where PuhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and PuhCode > 0 and VtmSysCode = " & CStr(cCOM_VTYPE_RETNINW) _
         & IIf(mQryPrtCode > 0, " and PuhPrtCode = " & CStr(mQryPrtCode), "")
    End If
    Rem sales ---------------------
    If chkFBySale.Value = vbChecked = True Then
        mQryStr = mQryStr & " UNION ALL "
        mQryStr = mQryStr & " Select " _
         & "VtmSysCode" _
         & ",SahCode as TrnCode" _
         & ",SahDate as TrnDate" _
         & ",SahPrtCode as TrnPrtCode" _
         & ",SahVchNo as TrnVchNo" _
         & ",SahVtmCode as TrnVtmCode" _
         & ",SahQty as TrnQty" _
         & ",SahAmount as TrnAmount" _
         & " from SaleHdr" _
         & " inner join VTypMast on SaleHdr.SahVtmCode = VTypMast.VtmCode" _
         & " where SahDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and SahCode > 0 and VtmSysCode = " & CStr(cCOM_VTYPE_SALES) _
         & IIf(mQryPrtCode > 0, " and SahPrtCode = " & CStr(mQryPrtCode), "")
    End If
    Rem purchase return
    If chkFByRetnOutw.Value = vbChecked Then
        mQryStr = mQryStr & " UNION ALL "
        mQryStr = mQryStr & " Select " _
         & "VtmSysCode" _
         & ",SahCode as TrnCode" _
         & ",SahDate as TrnDate" _
         & ",SahPrtCode as TrnPrtCode" _
         & ",SahVchNo as TrnVchNo" _
         & ",SahVtmCode as TrnVtmCode" _
         & ",SahQty as TrnQty" _
         & ",SahAmount as TrnAmount" _
         & " from SaleHdr" _
         & " inner join VTypMast on SaleHdr.SahVtmCode = VTypMast.VtmCode" _
         & " where SahDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and SahCode > 0 and VtmSysCode = " & CStr(cCOM_VTYPE_RETNOUTW) _
         & IIf(mQryPrtCode > 0, " and SahPrtCode = " & CStr(mQryPrtCode), "")
    End If
    Rem ----------------------------------
    mQryStr = mQryStr & ") as t1"
    mQryStr = mQryStr & " inner join PartyMast on t1.TrnPrtCode = PartyMast.PrtCode" _
     & " order by t1.TrnDate,t1.VtmSysCode,t1.TrnVtmCode,t1.TrnCode"
    
    datRecset.Open mQryStr, dbComDatabase, adOpenKeyset, adLockReadOnly
    
End If

Mfgrd1.Height = Int(Mfgrd1.Height / Mfgrd1.RowHeightMin) * Mfgrd1.RowHeightMin
Mfgrd1.Cols = clsListStru.UFields + 1
gcolcount = 0
mLow = clsListStru.LFields
mHigh = clsListStru.UFields
For acount = mLow To mHigh
    With Mfgrd1
    'If .Cols <= gcolcount Then
    '    .Cols = gcolcount + 1
    'End If
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

mCount_Tot = 0: mAmtAftDisc_Tot = 0: mDiscAmt_Tot = 0
srow = 1
MoveRecToFirst datRecset
With datRecset
If .RecordCount > 0 Then
    Do While .EOF = False
        If optMonthwise.Value = True Then
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnYrMonth")) = .fields("TrnYrMonth")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnMnYear")) = MonthName(Val(Right(.fields("TrnYrMonth"), 2))) & "-" & Left(.fields("TrnYrMonth"), 4)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCount")) = ToMyNumFmt(.fields("TrnCount"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnQty_sum")) = ToMyNumFmt(.fields("TrnQty_sum"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnAmount_sum")) = ToMyNumFmt(.fields("TrnAmount_sum"))
            
        ElseIf optDatewise.Value = True Then
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDateYMD")) = Format(.fields("TrnDate"), "yyyymmdd")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDate")) = Dtoc(.fields("TrnDate"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCount")) = ToMyNumFmt(.fields("TrnCount"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnQty_sum")) = ToMyNumFmt(.fields("TrnQty_sum"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnAmount_sum")) = ToMyNumFmt(.fields("TrnAmount_sum"))
            
        ElseIf optPartyNamewise.Value = True Then
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PrtName")) = .fields("PrtName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCount")) = ToMyNumFmt(.fields("TrnCount"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnQty_sum")) = ToMyNumFmt(.fields("TrnQty_sum"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnAmount_sum")) = ToMyNumFmt(.fields("TrnAmount_sum"))
            
        ElseIf optItemWise.Value = True Then
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnSimName")) = .fields("TrnSimName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCount")) = ToMyNumFmt(.fields("TrnCount"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnQty_sum")) = ToMyNumFmt(.fields("TrnQty_sum"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnAmount_sum")) = ToMyNumFmt(.fields("TrnAmount_sum"))
        
        ElseIf optDetailed.Value = True Or optExpanded.Value = True Then
            clsARA.GetData .fields("PrtAraCode")
            clsSTN.GetData .fields("PrtStnCode")
            clsVTM.GetData .fields("TrnVtmCode")
            
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("tTrnSmryId")) = .fields("tTrnSmryId")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnVtmCode")) = .fields("TrnVtmCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("VtmSysCode")) = .fields("VtmSysCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCode")) = .fields("TrnCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("VtmName")) = clsVTM.mName_str
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnVchNo")) = .fields("TrnVchNo")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDate")) = Dtoc(.fields("TrnDate"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnQty")) = ToMyNumFmt(.fields("TrnQty"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnAmount")) = ToMyNumFmt(.fields("TrnAmount"))
            ' ------------------------------------
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PrtCode")) = .fields("PrtCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PrtName")) = .fields("PrtName")
            ' ------------------------------------
            If optExpanded.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnSimName")) = .fields("TrnSimName")
            End If
            ' ------------------------------------
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttAddr")) = .fields("PrtAddr")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PatAraName")) = clsARA.mName_str
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PatStnName")) = clsSTN.mName_str
        
        End If
        If optDetailed.Value = True Or optExpanded.Value = True Then
            mCount_Tot = mCount_Tot + 1
            mAmtAftDisc_Tot = mAmtAftDisc_Tot + .fields("TrnQty")
            mDiscAmt_Tot = mDiscAmt_Tot + .fields("TrnAmount")
        Else
            mCount_Tot = mCount_Tot + .fields("TrnCount")
            mAmtAftDisc_Tot = mAmtAftDisc_Tot + .fields("TrnQty_sum")
            mDiscAmt_Tot = mDiscAmt_Tot + .fields("TrnAmount_sum")
        End If
        
        srow = srow + 1
        If Mfgrd1.Rows < srow + 1 Then
            Mfgrd1.Rows = Mfgrd1.Rows + 1
        End If
        
        .MoveNext
    Loop
End If
End With

Rem grand total
If optMonthwise.Value = True Then
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnYrMonth")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnMnYear")) = "Grand Total"
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCount")) = ToMyNumFmt(mCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnQty_sum")) = ToMyNumFmt(mAmtAftDisc_Tot)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnAmount_sum")) = ToMyNumFmt(mDiscAmt_Tot)
    
ElseIf optDatewise.Value = True Then
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDateYMD")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDate")) = "Grand Total"
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCount")) = ToMyNumFmt(mCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnQty_sum")) = ToMyNumFmt(mAmtAftDisc_Tot)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnAmount_sum")) = ToMyNumFmt(mDiscAmt_Tot)
    
ElseIf optPartyNamewise.Value = True Then
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PrtName")) = "Grand Total"
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCount")) = ToMyNumFmt(mCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnQty_sum")) = ToMyNumFmt(mAmtAftDisc_Tot)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnAmount_sum")) = ToMyNumFmt(mDiscAmt_Tot)
    
ElseIf optItemWise.Value = True Then
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnSimName")) = "Grand Total"
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCount")) = ToMyNumFmt(mCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnQty_sum")) = ToMyNumFmt(mAmtAftDisc_Tot)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnAmount_sum")) = ToMyNumFmt(mDiscAmt_Tot)
    
ElseIf optDetailed.Value = True Or optExpanded.Value = True Then
    
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("tTrnSmryId")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnVtmCode")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("VtmSysCode")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCode")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("VtmName")) = "Grand Total (" & CStr(mCount_Tot) & ")"
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnVchNo")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDate")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnQty")) = ToMyNumFmt(mAmtAftDisc_Tot)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnAmount")) = ToMyNumFmt(mDiscAmt_Tot)
    ' ------------------------------------
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PrtCode")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PrtName")) = ""
    ' ------------------------------------
    If optExpanded.Value = True Then
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnSimName")) = ""
    End If
    ' ------------------------------------
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttAddr")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PatAraName")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PatStnName")) = ""

End If
srow = srow + 1
If Mfgrd1.Rows < srow + 1 Then
    Mfgrd1.Rows = Mfgrd1.Rows + 1
End If

For mColCount = 0 To Mfgrd1.Cols - 1
    Mfgrd1.TextMatrix(srow, mColCount) = ""
Next mColCount
Mfgrd1.Rows = srow + 1

SetFlexColCursor txtList1Col, Mfgrd1

Me.MousePointer = vbNormal

Rem Call CalcDrCrAmtTot

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

'''Private Sub CalcDrCrAmtTot()
'''Dim mOpnDrAmtTot As Double, mOpnCrAmtTot As Double, mOpnNetBal As Double, mCurDrAmtTot As Double, mCurCrAmtTot As Double, mCurNetBal As Double
'''Dim aAhOpBal As Variant, aAhCurBal As Variant, mRowPos As Integer
'''
'''lblOpnDrAmtTot.Caption = ToMyAcFmt(0)
'''lblOpnCrAmtTot.Caption = ToMyAcFmt(0)
'''lblOpnNetBal.Caption = ToMyAcFmt(0)
'''lblCurDrAmtTot.Caption = ToMyAcFmt(0)
'''lblCurCrAmtTot.Caption = ToMyAcFmt(0)
'''lblCurNetBal.Caption = ToMyAcFmt(0)
'''
'''mOpnDrAmtTot = 0: mOpnCrAmtTot = 0: mOpnNetBal = 0
'''mCurDrAmtTot = 0: mCurCrAmtTot = 0: mCurNetBal = 0
'''
'''MoveRecToFirst datRecset
'''Do While datRecset.EOF = False
'''    Rem opening balance
'''    aAhOpBal = clsAH.GetAhOpnBal(datRecset.Fields("PttAhCode"), mDrCrSeperated:=True)
'''    mOpnDrAmtTot = mOpnDrAmtTot + aAhOpBal(0)
'''    mOpnCrAmtTot = mOpnCrAmtTot + aAhOpBal(1)
'''
'''    Rem current balance
'''    aAhCurBal = clsAH.GetAhCurBal(datRecset.Fields("PttAhCode"), sFinYrEndDate, mDrCrSeperated:=True)
'''    mCurDrAmtTot = mCurDrAmtTot + aAhCurBal(0)
'''    mCurCrAmtTot = mCurCrAmtTot + aAhCurBal(1)
'''
'''    datRecset.MoveNext
'''Loop
'''mOpnNetBal = mOpnDrAmtTot + mOpnCrAmtTot
'''mCurNetBal = mCurDrAmtTot + mCurCrAmtTot
'''
'''lblOpnDrAmtTot.Caption = ToMyAcFmt(mOpnDrAmtTot)
'''lblOpnCrAmtTot.Caption = ToMyAcFmt(mOpnCrAmtTot)
'''lblOpnNetBal.Caption = ToMyAcFmt(mOpnNetBal)
'''lblCurDrAmtTot.Caption = ToMyAcFmt(mCurDrAmtTot)
'''lblCurCrAmtTot.Caption = ToMyAcFmt(mCurCrAmtTot)
'''lblCurNetBal.Caption = ToMyAcFmt(mCurNetBal)
'''
''''frBottomTotal.Left = (dgList.Columns(dgList.Columns.Count - 1).Left + dgList.Columns(dgList.Columns.Count - 1).Width - frBottomTotal.Width)
'''
'''End Sub

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
Dim srow As Integer, mTrnCode As Long, mTrnSysType As Integer

srow = Mfgrd1.Row
If Shift = 0 And KeyCode = vbKeyF12 Then
    fcmbPrtName.BoundText = CStr(mQryPrtCode)
    fcmbSimName.BoundText = CStr(mQrySimCode)
    txtQryPrtName.Text = fcmbPrtName.Text
    txtQrySimName.Text = fcmbSimName.Text
    ' ----------------
    frConfigure.ZOrder
    frConfigure.Visible = True
    Mfgrd1.Enabled = False
    dtpFromDate.SetFocus
ElseIf MyAddNewKey(Shift, KeyCode) = True Then
    Rem Call Data_AddEvent
ElseIf MyDeleteKey(Shift, KeyCode) = True Then
    If srow < Mfgrd1.Rows - 1 And (optDetailed.Value = True Or optExpanded.Value = True) Then
        Rem Call Data_DeleteEvent
    End If
ElseIf Shift = vbCtrlMask And KeyCode = vbKeySpace Then
    If srow < Mfgrd1.Rows - 1 And (optDetailed.Value = True Or optExpanded.Value = True) Then
        mTrnCode = Val(Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCode")))
        mTrnSysType = Val(Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("VtmSysCode")))
        If mTrnCode > 0 Then
            mEntryAccessed = True
            mLastRowAccessed = srow
            Select Case mTrnSysType
            Case cCOM_VTYPE_OPNSTK
                Set frmTrn = New frmPurchaseInv
                Load frmTrn
                frmTrn.FormSysVchType = cCOM_VTYPE_OPNSTK
                frmTrn.RemoteAccessCode = mTrnCode
                Call frmTrn.Form_Load
                frmTrn.Show 1
                Me.ZOrder
                
            Case cCOM_VTYPE_PURCHASE
                Set frmTrn = New frmPurchaseInv
                Load frmTrn
                frmTrn.FormSysVchType = cCOM_VTYPE_PURCHASE
                frmTrn.RemoteAccessCode = mTrnCode
                Call frmTrn.Form_Load
                frmTrn.Show 1
                Me.ZOrder
            
            Case cCOM_VTYPE_RETNINW
                Set frmTrn = New frmPurchaseInv
                Load frmTrn
                frmTrn.FormSysVchType = cCOM_VTYPE_RETNINW
                frmTrn.RemoteAccessCode = mTrnCode
                Call frmTrn.Form_Load
                frmTrn.Show 1
                Me.ZOrder
            
            Case cCOM_VTYPE_SALES
                Set frmTrn = New frmSalesInv
                Load frmTrn
                frmTrn.FormSysVchType = cCOM_VTYPE_SALES
                frmTrn.RemoteAccessCode = mTrnCode
                Call frmTrn.Form_Load
                frmTrn.Show 1
                Me.ZOrder
            
            Case cCOM_VTYPE_RETNOUTW
                Set frmTrn = New frmSalesInv
                Load frmTrn
                frmTrn.FormSysVchType = cCOM_VTYPE_RETNOUTW
                frmTrn.RemoteAccessCode = mTrnCode
                Call frmTrn.Form_Load
                frmTrn.Show 1
                Me.ZOrder
            
            Case Else
                ErrorBox Me.Name & "_Mfgrd1_KeyDown_#3361_[Undefined]"
                mEntryAccessed = False
            End Select
        End If
    End If
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

Private Sub optItemwise_GotFocus()
FlashActiveControl optItemWise, True
End Sub

Private Sub optItemwise_LostFocus()
FlashActiveControl optItemWise, False
End Sub

Private Sub txtList1Col_DblClick(Index As Integer)
Call Mfgrd1_DblClick
End Sub

Private Sub txtList1Col_GotFocus(Index As Integer)
Mfgrd1.SetFocus
End Sub

Private Sub txtSearch1Text_InterActiveChange(Optional ByVal mText)

If IsMissing(mText) = True Then ' user is typing is search text box
    mText = txtSearch1Text.Text
    SearchRawFlex Mfgrd1, FlexLeftVisibleCol(Mfgrd1), mText
Else    ' system field search has been requested by programmer
    If optDetailed.Value = True Or optExpanded.Value = True Then
        SearchRawFlex Mfgrd1, clsListStru.GetItemIndex("tTrnSmryId"), mText
    ElseIf optMonthwise.Value = True Then
        SearchRawFlex Mfgrd1, clsListStru.GetItemIndex("TrnYrMonth"), mText
    ElseIf optDatewise.Value = True Then
        SearchRawFlex Mfgrd1, clsListStru.GetItemIndex("TrnDateYMD"), mText
    ElseIf optPartyNamewise.Value = True Then
        SearchRawFlex Mfgrd1, clsListStru.GetItemIndex("PrtName"), mText
    ElseIf optItemWise.Value = True Then
        SearchRawFlex Mfgrd1, clsListStru.GetItemIndex("SimName"), mText
    End If
End If
ShowActiveFlexRow Mfgrd1

End Sub

Private Sub txtQryPrtName_Change()
If fcmbPrtName.CallFromText_Change = False Then
    fcmbPrtName.CallFromText_Change = True
    If InterActiveChange(txtQryPrtName) = True Then
        fcmbPrtName.UserText = Array(txtQryPrtName.Text, txtQryPrtName.SelStart)
        fcmbPrtName.Show
        txtQryPrtName.Text = fcmbPrtName.Text
        mQryPrtCode = Val(fcmbPrtName.BoundText)
        If fcmbPrtName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbPrtName.CallFromText_Change = False
End If

End Sub

Private Sub txtQryPrtName_GotFocus()
FlashActiveControl txtQryPrtName, True
End Sub

Private Sub txtQryPrtName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtQryPrtName_Change
ElseIf MyAddNewKey(Shift, KeyCode) = True Then
    Rem not required
End If

End Sub

Private Sub txtQryPrtName_LostFocus()
FlashActiveControl txtQryPrtName, False
End Sub

'Private Sub txtRByName_Change()
'If fcmbRByName.CallFromText_Change = False Then
'    fcmbRByName.CallFromText_Change = True
'    If InterActiveChange(txtRByName) = True Then
'        fcmbRByName.UserText = Array(txtRByName.Text, txtRByName.SelStart)
'        fcmbRByName.Show
'        txtRByName.Text = fcmbRByName.Text
'        If fcmbRByName.ListSelected = True Then
'            SendKeys "{tab}"
'        End If
'    End If
'    fcmbRByName.CallFromText_Change = False
'End If
'
'End Sub
'
'Private Sub txtRByName_GotFocus()
'FlashActiveControl txtRByName, True
'End Sub
'
'Private Sub txtRByName_LostFocus()
'FlashActiveControl txtRByName, False
'End Sub
'
'Private Sub txtRByName_Validate(Cancel As Boolean)
'If Val(fcmbRByName.BoundText) <= 0 Then
'    'ErrorBox "Invalid Selection !!!"
'    'txtRByName.SetFocus
'    'Cancel = True
'Else
'    Call ChkServRate
'    Call CalcOpgChg
'End If
'
'End Sub

Private Sub txtSearch1Text_GotFocus()
FlashActiveControl txtSearch1Text, True
End Sub

Private Sub txtSearch1Text_LostFocus()
FlashActiveControl txtSearch1Text, False
End Sub

Private Sub txtQrySimName_Change()
If fcmbSimName.CallFromText_Change = False Then
    fcmbSimName.CallFromText_Change = True
    If InterActiveChange(txtQrySimName) = True Then
        fcmbSimName.UserText = Array(txtQrySimName.Text, txtQrySimName.SelStart)
        fcmbSimName.Show
        txtQrySimName.Text = fcmbSimName.Text
        If fcmbSimName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbSimName.CallFromText_Change = False
End If

End Sub

Private Sub txtQrySimName_GotFocus()
FlashActiveControl txtQrySimName, True
End Sub

Private Sub txtQrySimName_LostFocus()
FlashActiveControl txtQrySimName, False
End Sub

Private Sub txtQrySimName_Validate(Cancel As Boolean)
'Dim mOpgRate As Double, mOpgDiscPer As Double, mOpgInfByPer As Double, mOpgDefByPer As Double
'
'If Val(fcmbSimName.BoundText) <= 0 Then
'    ErrorBox "Invalid Selection !!!"
'    txtSimName.SetFocus
'    Cancel = True
'Else
'    If Val(fcmbSimName.BoundText) <> mPurSimCode_old Or FormAddEditMode = cFORM_ADDMODE Then
'        Call ChkServRate
'        Call CalcOpgChg
'    End If
'End If

End Sub

'Private Sub ChkServRate()
'Dim mOpgRate As Double, mOpgDiscPer As Double, mOpgInfByPer As Double, mOpgDefByPer As Double
'
'If FormAddEditMode = cFORM_ADDMODE Or Val(fcmbSimName.BoundText) <> mPurSimCode_old Or mOpgCDctCode_old <> Val(fcmbCDctName.BoundText) Or mPttPcgCode_old <> Val(fcmbPcgName.BoundText) Or mOpgRByCode_old <> Val(fcmbRByName.BoundText) Or mPurDate_old <> Ctod(dtpPurDate.Text) Or mOpgTime_old <> TimeToMin(txtOpgTime_str) Then     ' Or mOpgRToCode_old <> Val(fcmbRToName.BoundText)
'    GetServRateValues cnn:=dbGtdDatabase, mSimCode:=Val(fcmbSimName.BoundText), mTranDate:=Ctod(dtpPurDate.Text), mTranTime:=TimeToMin(txtOpgTime_str.Text), mSrmDctCode:=Val(fcmbCDctName.BoundText), mSrmPcgCode:=Val(fcmbPcgName.BoundText), mSrmRByCode:=Val(fcmbRByName.BoundText), mSrmRToCode:=0, mSrmRate:=mOpgRate, mSrmDiscPer:=mOpgDiscPer, mSrmInfByPer:=mOpgInfByPer, mSrmDefByPer:=mOpgDefByPer
'    If mOpgDiscPer = 0 And chkPttDiscAllowed.Value = vbChecked Then
'        mOpgDiscPer = Val(UnMyPerFmt(mskPttDiscPer.Text))
'    End If
'    If mOpgDiscPer = 0 And Val(UnMyPerFmt(mskPttDiscPer.Text)) <> 0 Then
'        mOpgDiscPer = Val(UnMyPerFmt(mskPttDiscPer.Text))
'    End If
'    If mOpgInfByPer <> 0 Then
'         mOpgRate = mOpgRate + (mOpgRate * mOpgInfByPer / 100)
'    ElseIf mOpgDefByPer <> 0 Then
'        mOpgRate = mOpgRate - (mOpgRate * mOpgDefByPer / 100)
'    End If
'    mskOpgRate.Text = ToMyNumFmt(mOpgRate)
'    mskOpgDiscPer.Text = ToMyPerFmt(mOpgDiscPer)
'End If
'
'End Sub
'
'Private Sub txtStnName_Change()
'If fcmbStnName.CallFromText_Change = False Then
'    fcmbStnName.CallFromText_Change = True
'    If InterActiveChange(txtStnName) = True Then
'        fcmbStnName.UserText = Array(txtStnName.Text, txtStnName.SelStart)
'        fcmbStnName.Show
'        txtStnName.Text = fcmbStnName.Text
'        If fcmbStnName.ListSelected = True Then
'            SendKeys "{tab}"
'        End If
'    End If
'    fcmbStnName.CallFromText_Change = False
'End If
'
'End Sub
'
'Private Sub txtStnName_GotFocus()
'FlashActiveControl txtStnName, True
'End Sub
'
'Private Sub txtStnName_LostFocus()
'FlashActiveControl txtStnName, False
'End Sub
'
'Private Sub txtStnName_Validate(Cancel As Boolean)
'If Val(fcmbStnName.BoundText) <= 0 Then
'    ErrorBox "Invalid Selection !!!"
'    txtStnName.SetFocus
'    Cancel = True
'End If
'
'End Sub
'
'Private Sub ShowPttDob()
'Dim mPttDob As Date
'
'mPttDob = CalcDob(Ctod(dtpPttAgeAsOnDt.Text), Val(mskPttAgeYr.Text), Val(mskPttAgeMn.Text), Val(mskPttAgeDy.Text))
'dtpPttDob.Text = Dtoc(mPttDob)
'
'End Sub
'
'Private Sub ShowPatAge()
'Dim mYears As Long, mMonths As Long, mDays As Long
'
'CalcAge Ctod(dtpPttDob.Text), Ctod(dtpPttAgeAsOnDt.Text), mYears, mMonths, mDays
'mskPttAgeYr.Text = CStr(mYears)
'mskPttAgeMn.Text = CStr(mMonths)
'mskPttAgeDy.Text = CStr(mDays)
'
'End Sub
'
'Private Sub txtVtmName_Change()
'If fcmbVtmName.CallFromText_Change = False Then
'    fcmbVtmName.CallFromText_Change = True
'    If InterActiveChange(txtVtmName) = True Then
'        fcmbVtmName.UserText = Array(txtVtmName.Text, txtVtmName.SelStart)
'        fcmbVtmName.Show
'        txtVtmName.Text = fcmbVtmName.Text
'        If fcmbVtmName.ListSelected = True Then
'            SendKeys "{tab}"
'        End If
'    End If
'    fcmbVtmName.CallFromText_Change = False
'End If
'
'End Sub
'
'Private Sub txtVtmName_GotFocus()
'FlashActiveControl txtVtmName, True
'End Sub
'
'Private Sub txtVtmName_KeyDown(KeyCode As Integer, Shift As Integer)
'If MyDropDownKey(Shift, KeyCode) = True Then
'    Call txtVtmName_Change
'ElseIf MyAddNewKey(Shift, KeyCode) = True Then
'
'ElseIf Shift = 0 And KeyCode = vbKeyF6 Then
'    Call ShowOldOpgListByOpgNo
'End If
'
'End Sub
'
'Private Sub txtVtmName_LostFocus()
'FlashActiveControl txtVtmName, False
'End Sub
'
'Private Sub txtVtmName_Validate(Cancel As Boolean)
'Dim mOpgVchNo As Long
'
'If Val(fcmbVtmName.BoundText) <= 0 Then
'    ErrorBox "Invalid Selection !!!"
'    txtVtmName.SetFocus
'    Cancel = True
'Else
'    If Val(fcmbVtmName.BoundText) <> mOpgVtmCode_old Or Ctod(dtpPurDate.Text) <> mPurDate_old Or FormAddEditMode = cFORM_ADDMODE Then
'        mOpgVchNo = GetNextVTypeNo(dbGtdDatabase, dbAcDatabase, dbComDatabase, mTableName:="PurchDtl", mFieldName:="OpgVchNo", mVtmFieldName:="OpgVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="OpgCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="PurDate", mDateFieldValue:=Ctod(dtpPurDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormOpgAcsPermFileName)
'        mskOpgVchNo.Text = ToMyNumFmt(mOpgVchNo, mDecimals:=0)
'    End If
'End If
'
'End Sub

'Private Sub CalcOpgChg()
'Dim mOpgUnit As Long, mOpgRate As Double, mOpgAmtBefDisc As Double, mOpgDiscPer As Double, mPurAmount As Double, mPurQty As Double
'mOpgUnit = Val(UnMyNumFmt(mskOpgUnit.Text))
'mOpgRate = Val(UnMyNumFmt(mskOpgRate.Text))
'mOpgAmtBefDisc = mOpgUnit * mOpgRate
'mOpgDiscPer = Val(UnMyPerFmt(mskOpgDiscPer.Text))
'mPurAmount = Round(mOpgAmtBefDisc * mOpgDiscPer / 100, 2)
'mPurQty = mOpgAmtBefDisc - mPurAmount
'' --------
'mskOpgAmtBefDisc.Text = ToMyNumFmt(mOpgAmtBefDisc)
'mskPurAmount.Text = ToMyNumFmt(mPurAmount)
'mskPurQty.Text = ToMyNumFmt(mPurQty)
'
'End Sub

'Private Sub ShowOldPurCodeDesc(ByVal mOldPurCode As Long)
'Dim tRecset As New ADODB.Recordset
'
'With tRecset
'.Open "Select * from PurchDtl where PurCode=" & CStr(mOldPurCode) & "", dbGtdDatabase, adOpenKeyset, adLockOptimistic
'If .RecordCount > 0 Then
'    clsVTM.GetData .fields("OpgVtmCode")
'    lblOldPurCodeDesc.Caption = RTrim(clsVTM.mName_str) & " No.:" & CStr(.fields("OpgVchNo")) & " Dated:" & Dtoc(.fields("PurDate"))
'Else
'    lblOldPurCodeDesc.Caption = "#" & CStr(mOldPurCode) & "#"
'End If
'End With
'CloseTable tRecset
'
'End Sub

'Private Function GetOldPurCodeFromPrtCode(ByVal mPrtCode As Long) As Long
'Dim tRecset As New ADODB.Recordset
'
'With tRecset
'.Open "Select top 1 * from PurchDtl where PurPrtCode = " & CStr(mPrtCode) & " order by PurDate desc,OpgVchNo desc,PurCode desc", dbGtdDatabase, adOpenKeyset, adLockOptimistic
'If .RecordCount > 0 Then
'    GetOldPurCodeFromPrtCode = .fields("PurCode")
'Else
'    GetOldPurCodeFromPrtCode = 0
'End If
'End With
'CloseTable tRecset
'
'End Function

'Private Sub ShowPttDiscPer(ByVal mPrtCode As Long)
'Dim tRecset As New ADODB.Recordset
'
'With tRecset
'.Open "Select * from PartyMast where PrtCode=" & CStr(mPrtCode) & "", dbGtdDatabase, adOpenKeyset, adLockOptimistic
'If .RecordCount > 0 Then
'    If .fields("PttDiscAllowed") = True And .fields("PttDiscPer") > 0 Then
'        mskOpgDiscPer.Text = ToMyPerFmt(.fields("PttDiscPer"))
'        Call CalcOpgChg
'    End If
'End If
'End With
'CloseTable tRecset
'
'End Sub

'Private Sub ShowOldOpgListByOpgNo()
'Dim tRecset As New ADODB.Recordset, mOldPurCode As Long, mOldPrtCode As Long
'
'If fcmbOldOpgByOpgNo.CallFromText_Change = False Then
'    fcmbOldOpgByOpgNo.CallFromText_Change = True
'    If InterActiveChange(txtVtmName) = True Then
'        fcmbOldOpgByOpgNo.UserText = Array("", 0)
'        fcmbOldOpgByOpgNo.Show
'        If fcmbOldOpgByOpgNo.ListSelected = True And Val(fcmbOldOpgByOpgNo.BoundText) > 0 Then
'            mOldPurCode = Val(fcmbOldOpgByOpgNo.BoundText)
'            tRecset.Open "Select * from PurchDtl where PurCode=" & CStr(mOldPurCode) & " order by PurDate,OpgVchNo,PurCode", dbGtdDatabase, adOpenKeyset, adLockOptimistic
'            If tRecset.RecordCount > 0 Then
'                mOldPrtCode = tRecset.fields("PurPrtCode")
'            End If
'            CloseTable tRecset
'            If FormAddEditMode = cFORM_ADDMODE And mOldPurCode > 0 And mOldPrtCode > 0 Then
'                clsPAT.EndMast mPrtCode
'                PatAddEditMode = cFORM_EDITMODE
'                mPrtCode = mOldPrtCode
'                If clsPAT.BeginMast(mPrtCode) = True Then
'                    mPrtCode = clsPAT.ActiveCode
'                Else
'                    mPrtCode = 0
'                End If
'                ShowPttDiscPer mPrtCode
'                Rem mOpgOldPurCode = GetOldPurCodeFromPrtCode(mPrtCode) will create chaos when last entry entered first and earlier entry entered in last
'                mOpgOldPurCode = mOldPurCode
'                ShowPatData mPrtCode
'                ShowOldPurCodeDesc mOpgOldPurCode
'            Else
'                If mOldPurCode > 0 And mOldPrtCode > 0 Then
'                    AlertBox "Prohibited in Edit Mode !!!"
'                End If
'            End If
'        End If
'    End If
'    fcmbOldOpgByOpgNo.CallFromText_Change = False
'End If
'CloseTable tRecset, mCheckOpen:=True
'
'End Sub

'Private Sub ShowOldOpgListByPttRegNo()
'Dim tRecset As New ADODB.Recordset, mOldPurCode As Long, mOldPrtCode As Long
'
'If fcmbOldOpgByPttRegNo.CallFromText_Change = False Then
'    fcmbOldOpgByPttRegNo.CallFromText_Change = True
'    If InterActiveChange(mskPttRegNo) = True Then
'        fcmbOldOpgByPttRegNo.UserText = Array("", 0)
'        fcmbOldOpgByPttRegNo.Show
'        If fcmbOldOpgByPttRegNo.ListSelected = True And Val(fcmbOldOpgByPttRegNo.BoundText) > 0 Then
'            mOldPurCode = Val(fcmbOldOpgByPttRegNo.LFieldValue("PurCode"))
'            tRecset.Open "Select * from PurchDtl where PurCode=" & CStr(mOldPurCode) & "", dbGtdDatabase, adOpenKeyset, adLockOptimistic
'            If tRecset.RecordCount > 0 Then
'                mOldPrtCode = tRecset.fields("PurPrtCode")
'            End If
'            CloseTable tRecset
'            If FormAddEditMode = cFORM_ADDMODE And mOldPurCode > 0 And mOldPrtCode > 0 Then
'                clsPAT.EndMast mPrtCode
'                PatAddEditMode = cFORM_EDITMODE
'                mPrtCode = mOldPrtCode
'                If clsPAT.BeginMast(mPrtCode) = True Then
'                    mPrtCode = clsPAT.ActiveCode
'                Else
'                    mPrtCode = 0
'                End If
'                ShowPttDiscPer mPrtCode
'                Rem mOpgOldPurCode = GetOldPurCodeFromPrtCode(mPrtCode) will create chaos when last entry entered first and earlier entry entered in last
'                mOpgOldPurCode = mOldPurCode
'                ShowPatData mPrtCode
'                ShowOldPurCodeDesc mOpgOldPurCode
'            Else
'                If mOldPurCode > 0 And mOldPrtCode > 0 Then
'                    AlertBox "Prohibited in Edit Mode !!!"
'                End If
'            End If
'        End If
'    End If
'    fcmbOldOpgByPttRegNo.CallFromText_Change = False
'End If
'CloseTable tRecset, mCheckOpen:=True
'
'End Sub

'Private Sub ShowOldOpgListByPrtName()
'Dim tRecset As New ADODB.Recordset, mOldPurCode As Long, mOldPrtCode As Long
'
'If fcmbOldOpgByPrtName.CallFromText_Change = False Then
'    fcmbOldOpgByPrtName.CallFromText_Change = True
'    If InterActiveChange(mskPttRegNo) = True Then
'        fcmbOldOpgByPrtName.UserText = Array("", 0)
'        fcmbOldOpgByPrtName.Show
'        If fcmbOldOpgByPrtName.ListSelected = True And Val(fcmbOldOpgByPrtName.BoundText) > 0 Then
'            mOldPurCode = Val(fcmbOldOpgByPrtName.LFieldValue("PurCode"))
'            tRecset.Open "Select * from PurchDtl where PurCode=" & CStr(mOldPurCode) & "", dbGtdDatabase, adOpenKeyset, adLockOptimistic
'            If tRecset.RecordCount > 0 Then
'                mOldPrtCode = tRecset.fields("PurPrtCode")
'            End If
'            CloseTable tRecset
'            If FormAddEditMode = cFORM_ADDMODE And mOldPurCode > 0 And mOldPrtCode > 0 Then
'                clsPAT.EndMast mPrtCode
'                PatAddEditMode = cFORM_EDITMODE
'                mPrtCode = mOldPrtCode
'                If clsPAT.BeginMast(mPrtCode) = True Then
'                    mPrtCode = clsPAT.ActiveCode
'                Else
'                    mPrtCode = 0
'                End If
'                ShowPttDiscPer mPrtCode
'                Rem mOpgOldPurCode = GetOldPurCodeFromPrtCode(mPrtCode) will create chaos when last entry entered first and earlier entry entered in last
'                mOpgOldPurCode = mOldPurCode
'                ShowPatData mPrtCode
'                ShowOldPurCodeDesc mOpgOldPurCode
'            Else
'                If mOldPurCode > 0 And mOldPrtCode > 0 Then
'                    AlertBox "Prohibited in Edit Mode !!!"
'                End If
'            End If
'        End If
'    End If
'    fcmbOldOpgByPrtName.CallFromText_Change = False
'End If
'CloseTable tRecset, mCheckOpen:=True
'
'End Sub

Private Sub Chk_EntryAccessed()
Dim mTrnDate As Date, mTrnCode As Long, mTrnVtmCode As Long, mSearchIdStr As String

mTrnDate = frmTrn.EntryDate
mTrnCode = frmTrn.EntryBoundCode
mTrnVtmCode = frmTrn.EntryVtmCode       ''' GetValueFromTableCol(cnn:=dbComDatabase, mTableName:="VTypMast", mColumnName:="VtmSysCode", mFilterCond:="VtmCode = " & CStr(frmTrn.EntryVtmCode), mRtnDefValue:=-1)

If frmTrn.EntrySaved = True Then
    mSearchIdStr = Format(mTrnDate, "yyyymmdd") & Format(mTrnVtmCode, cLONGCODESTRFMT) & Format(mTrnCode, cLONGCODESTRFMT)
    SearchRawFlex Mfgrd1, clsListStru.GetItemIndex("tTrnSmryId"), mSearchIdStr
    
Else
    If mLastRowAccessed < Mfgrd1.Rows - 1 Then
        Mfgrd1.Row = mLastRowAccessed
    Else
        Mfgrd1.Row = Mfgrd1.Rows - 1
    End If
End If

mEntryAccessed = False
mLastRowAccessed = -1
Unload frmTrn
Set frmTrn = Nothing

End Sub

