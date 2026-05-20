VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmStockRegRep 
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
      ItemData        =   "StockReg.frx":0000
      Left            =   1560
      List            =   "StockReg.frx":000D
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
      ItemData        =   "StockReg.frx":0034
      Left            =   0
      List            =   "StockReg.frx":0041
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
      Begin VB.Label lblOutwSeleCriteria 
         Caption         =   "Outgoing Stock Selection Criteria"
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
      Begin VB.Label lblInwSeleCriteria 
         Caption         =   "Incoming Stock Selection Criteria"
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
      Caption         =   "Stock Register"
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
Attribute VB_Name = "frmStockRegRep"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Dim mFormLoaded As Boolean, mLastKeyPressed As Integer, mMaskKeyPressed As Integer
Dim mPurCode As Long, mPrtCode As Long, mQryPrtCode As Long, mQrySimCode As Long, mOpgOldPurCode As Long
Dim mRemoteAccess As Boolean, mEntryAccessed As Boolean, mLastRowAccessed As Long, mEntrySaved As Boolean, mEntryAborted As Boolean
Dim dbAcDatabase As New ADODB.Connection, dbMdsDatabase As New ADODB.Connection, dbHmsDatabase As New ADODB.Connection, dbGrpDatabase As New ADODB.Connection, dbComDatabase As New ADODB.Connection
Dim datRecset As New ADODB.Recordset
Dim mPurCode_old As Long, mPrtCode_old As Long, mPurDate_old As Date, mOpgTime_old As Date, mOpgVtmCode_old As Long, mOpgVchNo_old As Long, mPrtName_old As String, mPttPcgCode_old As Long, mPttAhCode_old As Long, mPttAgeChanged As Boolean, mPrtAraCode_old As Long, mOpgCDctCode_old As Long, mOpgRByCode_old As Long, mOpgRToCode_old As Long
Dim mPurSimCode_old As Long
Dim clsJRN As clsJournal, clsAH As clsAccountHead, clsARA As clsComMastEntry, clsSTN As clsComMastEntry, clsVTM As clsComMastEntry
Dim mActiveControl As Object, clsListStru As clsSelectQueryStructure
Dim fcmbAraName As clsComFlexSearch, fcmbStnName As clsComFlexSearch, fcmbVtmName As clsComFlexSearch
Dim fcmbPrtName As clsHmsFlexSearch, fcmbSimName As clsHmsFlexSearch
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
mRowIndex() As Variant

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
.mRowIndex = Array()
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
    ReDim Preserve .mRowIndex(mIndex)
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
ReDim Preserve .mRowIndex(mIndex)
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
.mRowIndex(mIndex) = -1

End With

End Sub

Private Sub RestoreDefaultSmryPara()

dtpFromDate.Text = Dtoc(DefaultEntryDate)
dtpToDate.Text = Dtoc(DefaultEntryDate)
mQryPrtCode = 0
mQrySimCode = 0
txtQryPrtName.Text = "": fcmbPrtName.BoundText = ""
txtQrySimName.Text = "": fcmbSimName.BoundText = ""
optExpanded.Value = False
optDetailed.Value = False
optMonthwise.Value = False
optDatewise.Value = False
optPartyNamewise.Value = False
optItemWise.Value = True
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
    lblInwSeleCriteria.Caption = chkFByStockIn.Caption
ElseIf chkFByOpnStock.Value = 1 Or chkFByPurch.Value = 1 Or chkFByRetnInw.Value = 1 Then
    With lblInwSeleCriteria
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
    lblInwSeleCriteria.Caption = chkFByStockIn.Caption
End If

End Sub

Private Sub ChkStockOutSeleCriteria()

If chkFBySale.Value = 1 And chkFByRetnOutw.Value = 1 Then
    lblOutwSeleCriteria.Caption = chkFByStockOut.Caption
ElseIf chkFBySale.Value = 1 Or chkFByRetnOutw.Value = 1 Then
    With lblOutwSeleCriteria
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
    lblOutwSeleCriteria.Caption = chkFByStockOut.Caption
End If

End Sub

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
If UBound(SmryParaLayer.mIndex) >= LBound(SmryParaLayer.mIndex) Then
    SmryParaLayer.mRowIndex(UBound(SmryParaLayer.mIndex)) = Mfgrd1.Row
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
                    If Month(.fields("TrnYrMonth")) < Month(Ctod(dtpFromDate.Text)) And Year(.fields("TrnYrMonth")) <= Year(Ctod(dtpFromDate.Text)) Then
                        dtpFromDate.Text = dtpFromDate.Text
                        dtpToDate.Text = Dtoc(Ctod(dtpFromDate.Text) - 1)
                    Else
                        dtpFromDate.Text = Dtoc(MonthStartDate(DateSerial(Val(Left(.fields("TrnYrMonth"), 4)), Val(Right(.fields("TrnYrMonth"), 2)), 1)))
                        dtpToDate.Text = Dtoc(MonthEndDate(DateSerial(Val(Left(.fields("TrnYrMonth"), 4)), Val(Right(.fields("TrnYrMonth"), 2)), 1)))
                    End If
                    optMonthwise.Value = False
                    optDatewise.Value = True
                    
                ElseIf optDatewise.Value = True Then
                    If .fields("TrnDate") < Ctod(dtpFromDate.Text) Then
                        dtpFromDate.Text = dtpFromDate.Text
                        dtpToDate.Text = Dtoc(Ctod(dtpFromDate.Text) - 1)
                    Else
                        dtpFromDate.Text = Dtoc(.fields("TrnDate"))
                        dtpToDate.Text = Dtoc(.fields("TrnDate"))
                    End If
                    optDatewise.Value = False
                    optDetailed.Value = True
                    
                ElseIf optPartyNamewise.Value = True Then
                    mQryPrtCode = .fields("TrnPrtCode")
                    fcmbPrtName.BoundText = CStr(mQryPrtCode)
                    txtQryPrtName.Text = fcmbPrtName.Text
                    optPartyNamewise.Value = False
                    optMonthwise.Value = True
                    
                ElseIf optItemWise.Value = True Then
                    mQrySimCode = .fields("TrnSimCode")
                    fcmbSimName.BoundText = CStr(mQrySimCode)
                    txtQrySimName.Text = fcmbSimName.Text
                    optItemWise.Value = False
                    optMonthwise.Value = True
                    
                End If
                If UBound(SmryParaLayer.mIndex) >= LBound(SmryParaLayer.mIndex) Then
                    SmryParaLayer.mRowIndex(UBound(SmryParaLayer.mIndex)) = Mfgrd1.Row
                End If
                Call AddSmryParaLayer
                
                Call SmryList
                MoveRecToLast datRecset
                ShowRecActiveFlexRow datRecset, Mfgrd1
                Mfgrd1.SetFocus
            End If
        Else
            Rem Call Data_AddEvent
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
            
            srow = SmryParaLayer.mRowIndex(UBound(SmryParaLayer.mIndex))
            If Mfgrd1.Rows - 1 > srow Then
                Mfgrd1.Row = srow
            Else
                MoveRecToLast datRecset
                ShowRecActiveFlexRow datRecset, Mfgrd1
            End If
            Mfgrd1.SetFocus
            
        Else
            Unload Me
        End If
    End If
End If

End Sub

Private Sub cmdPrintToExcel_Click()
Dim clsExcel As New clsExcelApp, mXlsRepPath As String
Dim srow As Long, scol As Integer

Me.MousePointer = vbHourglass
mXlsRepPath = App.Path & "\StockReg.xls"
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
clsExcel.WriteValue "'" & "Stock Register From " & dtpFromDate.Text & " To " & dtpToDate.Text
clsExcel.ActiveCellFormat FontBold:=True
clsExcel.SelectNextRecordIndex
clsExcel.WriteValue "'" & "for " & lblInwSeleCriteria.Caption & " & " & lblOutwSeleCriteria.Caption
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
    MoveRecToFirst datRecset
    ShowRecActiveFlexRow datRecset, Mfgrd1
    Mfgrd1.SetFocus

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
    RefreshDatabase dbMdsDatabase
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
OpenHmsDataSource dbHmsDatabase
OpenMdsDataSource dbMdsDatabase
OpenGrpDataSource dbGrpDatabase
OpenComDataSource dbComDatabase

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

Set fcmbSimName = New clsHmsFlexSearch
Set fcmbSimName.dbHmsDatabase = dbHmsDatabase
Set fcmbSimName.dbComDatabase = dbComDatabase
fcmbSimName.blnSubItmMastList = True
fcmbSimName.Init

Set fcmbPrtName = New clsHmsFlexSearch
Set fcmbPrtName.dbHmsDatabase = dbHmsDatabase
Set fcmbPrtName.dbComDatabase = dbComDatabase
fcmbPrtName.blnPartyMastList = True
fcmbPrtName.Init

Call RestoreDefaultSmryPara
If mRemoteAccess = True Then
    optDetailed.Value = True
    AddSmryParaLayer mClear:=True
End If

If mRemoteAccess = True Then
    'datRecset.Open "Select * from MedPurchDtl left join PartyMast on MedPurchDtl.PurPrtCode=PartyMast.PrtCode where PurCode=" & CStr(mPurCode) & " order by PurDate,OpgTime", dbMdsDatabase, adOpenKeyset, adLockOptimistic
Else
    'datRecset.Open "Select * from MedPurchDtl left join PartyMast on MedPurchDtl.PurPrtCode=PartyMast.PrtCode order by PurDate,OpgTime", dbMdsDatabase, adOpenKeyset, adLockOptimistic
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
CloseDataSource dbHmsDatabase
CloseDataSource dbMdsDatabase
CloseDataSource dbGrpDatabase
CloseDataSource dbComDatabase

End Sub

Private Sub ShowEntryMode(ByVal EntryMode As Boolean)
If Me.Visible = True Then
    txtVoid.SetFocus
End If
frFormSmry.Visible = Not EntryMode: frFormSmry.Enabled = Not EntryMode
If EntryMode = False Then
    FormAddEditMode = cFORM_SMRYMODE
End If

End Sub

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

Private Sub SmryList()
Dim gcolcount As Integer, acount As Integer, mLow As Integer, mHigh As Integer, mPos As Integer, srow As Long, mColCount As Integer
Dim aAcntBal As Variant, mBal As Double, mQryStr As String
Dim mCount_Tot As Double, mQty_Tot As Double, mAmount_Tot As Double
Dim mOpnCount_Tot As Double, mOpnQty_Tot As Double, mOpnAmount_Tot As Double
Dim mPurCount_Tot As Double, mPurQty_Tot As Double, mPurAmount_Tot As Double
Dim mSalCount_Tot As Double, mSalQty_Tot As Double, mSalAmount_Tot As Double
Dim mBalCount_Tot As Double, mBalQty_Tot As Double, mBalAmount_Tot As Double

Me.MousePointer = vbHourglass
If datRecset.State = 1 Then
    CloseTable datRecset
End If
RefreshDatabase dbMdsDatabase
RefreshDatabase dbAcDatabase
RefreshDatabase dbGrpDatabase
RefreshDatabase dbComDatabase
clsListStru.Clear

If optMonthwise.Value = True Or optDatewise.Value = True Or optPartyNamewise.Value = True Or optItemWise.Value = True Then
    If optMonthwise.Value = True Then
        clsListStru.AddFields mExpr:="TrnYrMonth", mAttrib:=cFAT_SYSTEM
        clsListStru.AddFields mExpr:="TrnMnYear", mTitle:="Month", mShowItem:=True, mAlign:=1, mWidth:=2000
        clsListStru.AddFields mExpr:="TrnPurCount", mTitle:="In.Count", mShowItem:=False, mAlign:=7, mWidth:=1100
        clsListStru.AddFields mExpr:="TrnPurQty_sum", mTitle:="In.Qty", mShowItem:=True, mAlign:=7, mWidth:=1250
        clsListStru.AddFields mExpr:="TrnPurAmount_sum", mTitle:="In.Amount", mShowItem:=False, mAlign:=7, mWidth:=1350
        clsListStru.AddFields mExpr:="TrnSalCount", mTitle:="Out.Count", mShowItem:=False, mAlign:=7, mWidth:=1100
        clsListStru.AddFields mExpr:="TrnSalQty_sum", mTitle:="Out.Qty", mShowItem:=True, mAlign:=7, mWidth:=1250
        clsListStru.AddFields mExpr:="TrnSalAmount_sum", mTitle:="Out.Amount", mShowItem:=False, mAlign:=7, mWidth:=1350
        clsListStru.AddFields mExpr:="TrnBalCount", mTitle:="Bal.Count", mShowItem:=False, mAlign:=7, mWidth:=1100
        clsListStru.AddFields mExpr:="TrnBalQty_sum", mTitle:="Bal.Qty", mShowItem:=True, mAlign:=7, mWidth:=1250
        clsListStru.AddFields mExpr:="TrnBalAmount_sum", mTitle:="Bal.Amount", mShowItem:=False, mAlign:=7, mWidth:=1350
        
        mQryStr = "Select format(TrnDate,'yyyy/MM') as TrnYrMonth" _
         & ",Count(TrnPurType) as TrnPurCount" _
         & ",Sum(TrnPurQty) as TrnPurQty_sum" _
         & ",Sum(TrnPurAmount) as TrnPurAmount_sum" _
         & ",Count(TrnSalType) as TrnSalCount" _
         & ",Sum(TrnSalQty) as TrnSalQty_sum" _
         & ",Sum(TrnSalAmount) as TrnSalAmount_sum" _
         & ",Count(TrnBalType) as TrnBalCount" _
         & ",Sum(TrnBalQty) as TrnBalQty_sum" _
         & ",Sum(TrnBalAmount) as TrnBalAmount_sum"
        mQryStr = mQryStr & " from ("
        Rem reserved query string producing no records
        mQryStr = mQryStr & "Select PurDate as TrnDate" _
         & ",'Pur' as TrnPurType,0 as TrnPurQty,0 as TrnPurAmount" _
         & ",'Sal' as TrnSalType,0 as TrnSalQty,0 as TrnSalAmount" _
         & ",'Bal' as TrnBalType,0 as TrnBalQty,0 as TrnBalAmount" _
         & " from MedPurchDtl" _
         & " inner join (MedPurchHdr inner join VTypMast on MedPurchHdr.PuhVtmCode = VTypMast.VtmCode) on MedPurchDtl.PurCode = MedPurchHdr.PuhCode" _
         & " where PurDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and PurDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and PurCode > 0 and True = False" _
         & IIf(mQryPrtCode > 0, " and PurPrtCode = " & CStr(mQryPrtCode), "") _
         & IIf(mQrySimCode > 0, " and PurSimCode = " & CStr(mQrySimCode), "")
        Rem opening stock
        If chkFByOpnStock.Value = vbChecked Then
            Rem incoming stock
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select #" & CStr(ToSysDate(Ctod(dtpFromDate.Text) - 1)) & "# as TrnDate" _
             & ",'Pur' as TrnPurType,PurQty as TrnPurQty,PurAmount as TrnPurAmount" _
             & ",'Sal' as TrnSalType,0 as TrnSalQty,0 as TrnSalAmount" _
             & ",'Bal' as TrnBalType,PurQty as TrnBalQty,PurAmount as TrnBalAmount" _
             & " from MedPurchDtl" _
             & " inner join (MedPurchHdr inner join VTypMast on MedPurchHdr.PuhVtmCode = VTypMast.VtmCode) on MedPurchDtl.PurCode = MedPurchHdr.PuhCode" _
             & " where PurCode > 0 and VtmSysCode IN (" & CStr(cCOM_VTYPE_OPNSTK) & "," & CStr(cCOM_VTYPE_PURCHASE) & "," & CStr(cCOM_VTYPE_RETNINW) & ")" _
             & " and PurDate < #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "#" _
             & IIf(mQryPrtCode > 0, " and PurPrtCode = " & CStr(mQryPrtCode), "") _
             & IIf(mQrySimCode > 0, " and PurSimCode = " & CStr(mQrySimCode), "")
            Rem outgoing stock
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select #" & CStr(ToSysDate(Ctod(dtpFromDate.Text) - 1)) & "# as TrnDate" _
             & ",'Pur' as TrnPurType,0 as TrnPurQty,0 as TrnPurAmount" _
             & ",'Sal' as TrnSalType,SalQty  as TrnSalQty,SalAmount  as TrnSalAmount" _
             & ",'Bal' as TrnBalType,SalQty * -1 as TrnBalQty,SalAmount * -1 as TrnBalAmount" _
             & " from MedSaleDtl" _
             & " inner join (MedSaleHdr inner join VTypMast on MedSaleHdr.SahVtmCode = VTypMast.VtmCode) on MedSaleDtl.SalCode = MedSaleHdr.SahCode" _
             & " where SalCode > 0 and VtmSysCode IN (" & CStr(cCOM_VTYPE_SALES) & "," & CStr(cCOM_VTYPE_RETNOUTW) & ")" _
             & " and SalDate < #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "#" _
             & IIf(mQryPrtCode > 0, " and SalPrtCode = " & CStr(mQryPrtCode), "") _
             & IIf(mQrySimCode > 0, " and SalSimCode = " & CStr(mQrySimCode), "")
             
        End If
        Rem purchase
        If chkFByPurch.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select PurDate as TrnDate" _
             & ",'Pur' as TrnPurType,PurQty as TrnPurQty,PurAmount as TrnPurAmount" _
             & ",'Sal' as TrnSalType,0 as TrnSalQty,0 as TrnSalAmount" _
             & ",'Bal' as TrnBalType,PurQty as TrnBalQty,PurAmount as TrnBalAmount" _
             & " from MedPurchDtl" _
             & " inner join (MedPurchHdr inner join VTypMast on MedPurchHdr.PuhVtmCode = VTypMast.VtmCode) on MedPurchDtl.PurCode = MedPurchHdr.PuhCode" _
             & " where PurDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and PurDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and PurCode > 0 and VtmSysCode = " & CStr(cCOM_VTYPE_PURCHASE) _
             & IIf(mQryPrtCode > 0, " and PurPrtCode = " & CStr(mQryPrtCode), "") _
             & IIf(mQrySimCode > 0, " and PurSimCode =" & CStr(mQrySimCode), "")
        End If
        Rem sales return
        If chkFByRetnInw.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select PurDate as TrnDate" _
             & ",'Pur' as TrnPurType,PurQty as TrnPurQty,PurAmount as TrnPurAmount" _
             & ",'Sal' as TrnSalType,0 as TrnSalQty,0 as TrnSalAmount" _
             & ",'Bal' as TrnBalType,PurQty as TrnBalQty,PurAmount as TrnBalAmount" _
             & " from MedPurchDtl" _
             & " inner join (MedPurchHdr inner join VTypMast on MedPurchHdr.PuhVtmCode = VTypMast.VtmCode) on MedPurchDtl.PurCode = MedPurchHdr.PuhCode" _
             & " where PurDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and PurDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and PurCode > 0 and VtmSysCode = " & CStr(cCOM_VTYPE_RETNINW) _
             & IIf(mQryPrtCode > 0, " and PurPrtCode = " & CStr(mQryPrtCode), "") _
             & IIf(mQrySimCode > 0, " and PurSimCode =" & CStr(mQrySimCode), "")
        End If
        Rem sales ---------------------
        If chkFBySale.Value = vbChecked = True Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select SalDate as TrnDate" _
             & ",'Pur' as TrnPurType,0 as TrnPurQty,0 as TrnPurAmount" _
             & ",'Sal' as TrnSalType,SalQty as TrnSalQty,SalAmount as TrnSalAmount" _
             & ",'Bal' as TrnBalType,SalQty * -1 as TrnBalQty,SalAmount * -1 as TrnBalAmount" _
             & " from MedSaleDtl" _
             & " inner join (MedSaleHdr inner join VTypMast on MedSaleHdr.SahVtmCode = VTypMast.VtmCode) on MedSaleDtl.SalCode = MedSaleHdr.SahCode" _
             & " where SalDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and SalDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and SalCode > 0 and VtmSysCode = " & CStr(cCOM_VTYPE_SALES) _
             & IIf(mQryPrtCode > 0, " and SalPrtCode = " & CStr(mQryPrtCode), "") _
             & IIf(mQrySimCode > 0, " and SalSimCode = " & CStr(mQrySimCode), "")
        End If
        Rem purchase return
        If chkFByRetnOutw.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select SalDate as TrnDate" _
             & ",'Pur' as TrnPurType,0 as TrnPurQty,0 as TrnPurAmount" _
             & ",'Sal' as TrnSalType,SalQty as TrnSalQty,SalAmount as TrnSalAmount" _
             & ",'Bal' as TrnBalType,SalQty * -1 as TrnBalQty,SalAmount * -1 as TrnBalAmount" _
             & " from MedSaleDtl" _
             & " inner join (MedSaleHdr inner join VTypMast on MedSaleHdr.SahVtmCode = VTypMast.VtmCode) on MedSaleDtl.SalCode = MedSaleHdr.SahCode" _
             & " where SalDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and SalDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and SalCode > 0 and VtmSysCode = " & CStr(cCOM_VTYPE_RETNOUTW) _
             & IIf(mQryPrtCode > 0, " and SalPrtCode = " & CStr(mQryPrtCode), "") _
             & IIf(mQrySimCode > 0, " and SalSimCode = " & CStr(mQrySimCode), "")
        End If
        Rem ----------------------------------
        mQryStr = mQryStr & ")"
        mQryStr = mQryStr & " group by format(TrnDate,'yyyy/MM')" _
         & " order by format(TrnDate,'yyyy/MM')"
        
        datRecset.open mQryStr, dbComDatabase, adOpenKeyset, adLockReadOnly
        
    ElseIf optDatewise.Value = True Then
        clsListStru.AddFields mExpr:="TrnDateYMD", mAttrib:=cFAT_SYSTEM
        clsListStru.AddFields mExpr:="TrnDate", mTitle:="Date", mShowItem:=True, mAlign:=1, mWidth:=2000
        clsListStru.AddFields mExpr:="TrnPurCount", mTitle:="In.Count", mShowItem:=False, mAlign:=7, mWidth:=1100
        clsListStru.AddFields mExpr:="TrnPurQty_sum", mTitle:="In.Qty", mShowItem:=True, mAlign:=7, mWidth:=1250
        clsListStru.AddFields mExpr:="TrnPurAmount_sum", mTitle:="In.Amount", mShowItem:=False, mAlign:=7, mWidth:=1350
        clsListStru.AddFields mExpr:="TrnSalCount", mTitle:="Out.Count", mShowItem:=False, mAlign:=7, mWidth:=1100
        clsListStru.AddFields mExpr:="TrnSalQty_sum", mTitle:="Out.Qty", mShowItem:=True, mAlign:=7, mWidth:=1250
        clsListStru.AddFields mExpr:="TrnSalAmount_sum", mTitle:="Out.Amount", mShowItem:=False, mAlign:=7, mWidth:=1350
        clsListStru.AddFields mExpr:="TrnBalCount", mTitle:="Bal.Count", mShowItem:=False, mAlign:=7, mWidth:=1100
        clsListStru.AddFields mExpr:="TrnBalQty_sum", mTitle:="Bal.Qty", mShowItem:=True, mAlign:=7, mWidth:=1250
        clsListStru.AddFields mExpr:="TrnBalAmount_sum", mTitle:="Bal.Amount", mShowItem:=False, mAlign:=7, mWidth:=1350
        
        mQryStr = "Select TrnDate" _
         & ",Count(TrnPurType) as TrnPurCount" _
         & ",Sum(TrnPurQty) as TrnPurQty_sum" _
         & ",Sum(TrnPurAmount) as TrnPurAmount_sum" _
         & ",Count(TrnSalType) as TrnSalCount" _
         & ",Sum(TrnSalQty) as TrnSalQty_sum" _
         & ",Sum(TrnSalAmount) as TrnSalAmount_sum" _
         & ",Count(TrnBalType) as TrnBalCount" _
         & ",Sum(TrnBalQty) as TrnBalQty_sum" _
         & ",Sum(TrnBalAmount) as TrnBalAmount_sum"
        mQryStr = mQryStr & " from ("
        Rem reserved query string producing no records
        mQryStr = mQryStr & "Select PurDate as TrnDate" _
         & ",'Pur' as TrnPurType,0 as TrnPurQty,0 as TrnPurAmount" _
         & ",'Sal' as TrnSalType,0 as TrnSalQty,0 as TrnSalAmount" _
         & ",'Bal' as TrnBalType,0 as TrnBalQty,0 as TrnBalAmount" _
         & " from MedPurchDtl" _
         & " inner join (MedPurchHdr inner join VTypMast on MedPurchHdr.PuhVtmCode = VTypMast.VtmCode) on MedPurchDtl.PurCode = MedPurchHdr.PuhCode" _
         & " where PurDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and PurDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and PurCode > 0 and True = False" _
         & IIf(mQryPrtCode > 0, " and PurPrtCode = " & CStr(mQryPrtCode), "") _
         & IIf(mQrySimCode > 0, " and PurSimCode = " & CStr(mQrySimCode), "")
        Rem opening stock
        If chkFByOpnStock.Value = vbChecked Then
            Rem incoming stock
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & "Select #" & CStr(ToSysDate(Ctod(dtpFromDate.Text) - 1)) & "# as TrnDate" _
             & ",'Pur' as TrnPurType,PurQty as TrnPurQty,PurAmount as TrnPurAmount" _
             & ",'Sal' as TrnSalType,0 as TrnSalQty,0 as TrnSalAmount" _
             & ",'Bal' as TrnBalType,PurQty as TrnBalQty,PurAmount as TrnBalAmount" _
             & " from MedPurchDtl" _
             & " inner join (MedPurchHdr inner join VTypMast on MedPurchHdr.PuhVtmCode = VTypMast.VtmCode) on MedPurchDtl.PurCode = MedPurchHdr.PuhCode" _
             & " where PurCode > 0 and VtmSysCode IN (" & CStr(cCOM_VTYPE_OPNSTK) & "," & CStr(cCOM_VTYPE_PURCHASE) & "," & CStr(cCOM_VTYPE_RETNINW) & ")" _
             & " and PurDate < #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "#" _
             & IIf(mQryPrtCode > 0, " and PurPrtCode = " & CStr(mQryPrtCode), "") _
             & IIf(mQrySimCode > 0, " and PurSimCode = " & CStr(mQrySimCode), "")
            Rem outgoing stock
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & "Select #" & CStr(ToSysDate(Ctod(dtpFromDate.Text) - 1)) & "# as TrnDate" _
             & ",'Pur' as TrnPurType,0 as TrnPurQty,0 as TrnPurAmount" _
             & ",'Sal' as TrnSalType,SalQty  as TrnSalQty,SalAmount  as TrnSalAmount" _
             & ",'Bal' as TrnBalType,SalQty * -1 as TrnBalQty,SalAmount * -1 as TrnBalAmount" _
             & " from MedSaleDtl" _
             & " inner join (MedSaleHdr inner join VTypMast on MedSaleHdr.SahVtmCode = VTypMast.VtmCode) on MedSaleDtl.SalCode = MedSaleHdr.SahCode" _
             & " where SalCode > 0 and VtmSysCode IN (" & CStr(cCOM_VTYPE_SALES) & "," & CStr(cCOM_VTYPE_RETNOUTW) & ")" _
             & " and SalDate < #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "#" _
             & IIf(mQryPrtCode > 0, " and SalPrtCode = " & CStr(mQryPrtCode), "") _
             & IIf(mQrySimCode > 0, " and SalSimCode = " & CStr(mQrySimCode), "")
             
        End If
        Rem purchase
        If chkFByPurch.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select PurDate as TrnDate" _
             & ",'Pur' as TrnPurType,PurQty as TrnPurQty,PurAmount as TrnPurAmount" _
             & ",'Sal' as TrnSalType,0 as TrnSalQty,0 as TrnSalAmount" _
             & ",'Bal' as TrnBalType,PurQty as TrnBalQty,PurAmount as TrnBalAmount" _
             & " from MedPurchDtl" _
             & " inner join (MedPurchHdr inner join VTypMast on MedPurchHdr.PuhVtmCode = VTypMast.VtmCode) on MedPurchDtl.PurCode = MedPurchHdr.PuhCode" _
             & " where PurDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and PurDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and PurCode > 0 and VtmSysCode = " & CStr(cCOM_VTYPE_PURCHASE) _
             & IIf(mQryPrtCode > 0, " and PurPrtCode = " & CStr(mQryPrtCode), "") _
             & IIf(mQrySimCode > 0, " and PurSimCode = " & CStr(mQrySimCode), "")
        End If
        Rem sales return
        If chkFByRetnInw.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select PurDate as TrnDate" _
             & ",'Pur' as TrnPurType,PurQty as TrnPurQty,PurAmount as TrnPurAmount" _
             & ",'Sal' as TrnSalType,0 as TrnSalQty,0 as TrnSalAmount" _
             & ",'Bal' as TrnBalType,PurQty as TrnBalQty,PurAmount as TrnBalAmount" _
             & " from MedPurchDtl" _
             & " inner join (MedPurchHdr inner join VTypMast on MedPurchHdr.PuhVtmCode = VTypMast.VtmCode) on MedPurchDtl.PurCode = MedPurchHdr.PuhCode" _
             & " where PurDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and PurDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and PurCode > 0 and VtmSysCode = " & CStr(cCOM_VTYPE_RETNINW) _
             & IIf(mQryPrtCode > 0, " and PurPrtCode = " & CStr(mQryPrtCode), "") _
             & IIf(mQrySimCode > 0, " and PurSimCode = " & CStr(mQrySimCode), "")
        End If
        Rem sales ---------------------
        If chkFBySale.Value = vbChecked = True Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select SalDate as TrnDate" _
             & ",'Pur' as TrnPurType,0 as TrnPurQty,0 as TrnPurAmount" _
             & ",'Sal' as TrnSalType,SalQty as TrnSalQty,SalAmount as TrnSalAmount" _
             & ",'Bal' as TrnBalType,SalQty * -1 as TrnBalQty,SalAmount * -1 as TrnBalAmount" _
             & " from MedSaleDtl" _
             & " inner join (MedSaleHdr inner join VTypMast on MedSaleHdr.SahVtmCode = VTypMast.VtmCode) on MedSaleDtl.SalCode = MedSaleHdr.SahCode" _
             & " where SalDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and SalDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and SalCode > 0 and VtmSysCode = " & CStr(cCOM_VTYPE_SALES) _
             & IIf(mQryPrtCode > 0, " and SalPrtCode = " & CStr(mQryPrtCode), "") _
             & IIf(mQrySimCode > 0, " and SalSimCode = " & CStr(mQrySimCode), "")
        End If
        Rem purchase return
        If chkFByRetnOutw.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select SalDate as TrnDate" _
             & ",'Pur' as TrnPurType,0 as TrnPurQty,0 as TrnPurAmount" _
             & ",'Sal' as TrnSalType,SalQty as TrnSalQty,SalAmount as TrnSalAmount" _
             & ",'Bal' as TrnBalType,SalQty * -1 as TrnBalQty,SalAmount * -1 as TrnBalAmount" _
             & " from MedSaleDtl" _
             & " inner join (MedSaleHdr inner join VTypMast on MedSaleHdr.SahVtmCode = VTypMast.VtmCode) on MedSaleDtl.SalCode = MedSaleHdr.SahCode" _
             & " where SalDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and SalDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and SalCode > 0 and VtmSysCode = " & CStr(cCOM_VTYPE_RETNOUTW) _
             & IIf(mQryPrtCode > 0, " and SalPrtCode = " & CStr(mQryPrtCode), "") _
             & IIf(mQrySimCode > 0, " and SalSimCode = " & CStr(mQrySimCode), "")
        End If
        Rem ----------------------------------
        mQryStr = mQryStr & ")"
        mQryStr = mQryStr & " group by TrnDate" _
         & " order by TrnDate"
        
        datRecset.open mQryStr, dbComDatabase, adOpenKeyset, adLockReadOnly
        
    ElseIf optPartyNamewise.Value = True Then
        clsListStru.AddFields mExpr:="PrtName", mTitle:="Party Name", mShowItem:=True, mAlign:=1, mWidth:=3000
        clsListStru.AddFields mExpr:="TrnOpnCount", mTitle:="Opn.Count", mShowItem:=False, mAlign:=7, mWidth:=1100
        clsListStru.AddFields mExpr:="TrnOpnQty_sum", mTitle:="Opn.Qty", mShowItem:=True, mAlign:=7, mWidth:=1250
        clsListStru.AddFields mExpr:="TrnOpnAmount_sum", mTitle:="Opn.Amount", mShowItem:=False, mAlign:=7, mWidth:=1350
        clsListStru.AddFields mExpr:="TrnPurCount", mTitle:="In.Count", mShowItem:=False, mAlign:=7, mWidth:=1100
        clsListStru.AddFields mExpr:="TrnPurQty_sum", mTitle:="In.Qty", mShowItem:=True, mAlign:=7, mWidth:=1250
        clsListStru.AddFields mExpr:="TrnPurAmount_sum", mTitle:="In.Amount", mShowItem:=False, mAlign:=7, mWidth:=1350
        clsListStru.AddFields mExpr:="TrnSalCount", mTitle:="Out.Count", mShowItem:=False, mAlign:=7, mWidth:=1100
        clsListStru.AddFields mExpr:="TrnSalQty_sum", mTitle:="Out.Qty", mShowItem:=True, mAlign:=7, mWidth:=1250
        clsListStru.AddFields mExpr:="TrnSalAmount_sum", mTitle:="Out.Amount", mShowItem:=False, mAlign:=7, mWidth:=1350
        clsListStru.AddFields mExpr:="TrnBalCount", mTitle:="Bal.Count", mShowItem:=False, mAlign:=7, mWidth:=1100
        clsListStru.AddFields mExpr:="TrnBalQty_sum", mTitle:="Bal.Qty", mShowItem:=True, mAlign:=7, mWidth:=1250
        clsListStru.AddFields mExpr:="TrnBalAmount_sum", mTitle:="Bal.Amount", mShowItem:=False, mAlign:=7, mWidth:=1350
        
        mQryStr = "Select PartyMast.PrtName,t1.TrnPrtCode" _
         & ",Count(TrnOpnType) as TrnOpnCount" _
         & ",Sum(TrnOpnQty) as TrnOpnQty_sum" _
         & ",Sum(TrnOpnAmount) as TrnOpnAmount_sum" _
         & ",Count(TrnPurType) as TrnPurCount" _
         & ",Sum(TrnPurQty) as TrnPurQty_sum" _
         & ",Sum(TrnPurAmount) as TrnPurAmount_sum" _
         & ",Count(TrnSalType) as TrnSalCount" _
         & ",Sum(TrnSalQty) as TrnSalQty_sum" _
         & ",Sum(TrnSalAmount) as TrnSalAmount_sum" _
         & ",Count(TrnBalType) as TrnBalCount" _
         & ",Sum(TrnBalQty) as TrnBalQty_sum" _
         & ",Sum(TrnBalAmount) as TrnBalAmount_sum"
        mQryStr = mQryStr & " from ("
        Rem reserved query string producing no records
        mQryStr = mQryStr & "Select PurPrtCode as TrnPrtCode" _
         & ",'Opn' as TrnOpnType,0 as TrnOpnQty,0 as TrnOpnAmount" _
         & ",'Pur' as TrnPurType,0 as TrnPurQty,0 as TrnPurAmount" _
         & ",'Sal' as TrnSalType,0 as TrnSalQty,0 as TrnSalAmount" _
         & ",'Bal' as TrnBalType,0 as TrnBalQty,0 as TrnBalAmount" _
         & " from MedPurchDtl" _
         & " inner join (MedPurchHdr inner join VTypMast on MedPurchHdr.PuhVtmCode = VTypMast.VtmCode) on MedPurchDtl.PurCode = MedPurchHdr.PuhCode" _
         & " where PurDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and PurDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and PurCode > 0 and True = False" _
         & IIf(mQryPrtCode > 0, " and PurPrtCode = " & CStr(mQryPrtCode), "") _
         & IIf(mQrySimCode > 0, " and PurSimCode = " & CStr(mQrySimCode), "")
        Rem opening stock
        If chkFByOpnStock.Value = vbChecked Then
            Rem incoming stock
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select PurPrtCode as TrnPrtCode" _
             & ",'Opn' as TrnOpnType,PurQty as TrnOpnQty,PurAmount as TrnOpnAmount" _
             & ",'Pur' as TrnPurType,0 as TrnPurQty,0 as TrnPurAmount" _
             & ",'Sal' as TrnSalType,0 as TrnSalQty,0 as TrnSalAmount" _
             & ",'Bal' as TrnBalType,PurQty as TrnBalQty,PurAmount as TrnBalAmount" _
             & " from MedPurchDtl" _
             & " inner join (MedPurchHdr inner join VTypMast on MedPurchHdr.PuhVtmCode = VTypMast.VtmCode) on MedPurchDtl.PurCode = MedPurchHdr.PuhCode" _
             & " where PurCode > 0 and VtmSysCode IN (" & CStr(cCOM_VTYPE_OPNSTK) & "," & CStr(cCOM_VTYPE_PURCHASE) & "," & CStr(cCOM_VTYPE_RETNINW) & ")" _
             & " and PurDate < #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "#" _
             & IIf(mQryPrtCode > 0, " and PurPrtCode = " & CStr(mQryPrtCode), "") _
             & IIf(mQrySimCode > 0, " and PurSimCode = " & CStr(mQrySimCode), "")
            Rem outgoing stock
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select SalPrtCode as TrnPrtCode" _
             & ",'Opn' as TrnOpnType,SalQty * -1 as TrnOpnQty,SalAmount * -1 as TrnOpnAmount" _
             & ",'Pur' as TrnPurType,0 as TrnPurQty,0 as TrnPurAmount" _
             & ",'Sal' as TrnSalType,0 as TrnSalQty,0 as TrnSalAmount" _
             & ",'Bal' as TrnBalType,SalQty * -1 as TrnBalQty,SalAmount * -1 as TrnBalAmount" _
             & " from MedSaleDtl" _
             & " inner join (MedSaleHdr inner join VTypMast on MedSaleHdr.SahVtmCode = VTypMast.VtmCode) on MedSaleDtl.SalCode = MedSaleHdr.SahCode" _
             & " where SalCode > 0 and VtmSysCode IN (" & "," & CStr(cCOM_VTYPE_SALES) & "," & CStr(cCOM_VTYPE_RETNOUTW) & ")" _
             & " and SalDate < #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "#" _
             & IIf(mQryPrtCode > 0, " and SalPrtCode = " & CStr(mQryPrtCode), "") _
             & IIf(mQrySimCode > 0, " and SalSimCode = " & CStr(mQrySimCode), "")
            
        End If
        Rem purchase
        If chkFByPurch.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select PurPrtCode as TrnPrtCode" _
             & ",'Opn' as TrnOpnType,0 as TrnOpnQty,0 as TrnOpnAmount" _
             & ",'Pur' as TrnPurType,PurQty as TrnPurQty,PurAmount as TrnPurAmount" _
             & ",'Sal' as TrnSalType,0 as TrnSalQty,0 as TrnSalAmount" _
             & ",'Bal' as TrnBalType,PurQty as TrnBalQty,PurAmount as TrnBalAmount" _
             & " from MedPurchDtl" _
             & " inner join (MedPurchHdr inner join VTypMast on MedPurchHdr.PuhVtmCode = VTypMast.VtmCode) on MedPurchDtl.PurCode = MedPurchHdr.PuhCode" _
             & " where PurDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and PurDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and PurCode > 0 and VtmSysCode = " & CStr(cCOM_VTYPE_PURCHASE) _
             & IIf(mQryPrtCode > 0, " and PurPrtCode = " & CStr(mQryPrtCode), "") _
             & IIf(mQrySimCode > 0, " and PurSimCode = " & CStr(mQrySimCode), "")
        End If
        Rem sales return
        If chkFByRetnInw.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select PurPrtCode as TrnPrtCode" _
             & ",'Opn' as TrnOpnType,0 as TrnOpnQty,0 as TrnOpnAmount" _
             & ",'Pur' as TrnPurType,PurQty as TrnPurQty,PurAmount as TrnPurAmount" _
             & ",'Sal' as TrnSalType,0 as TrnSalQty,0 as TrnSalAmount" _
             & ",'Bal' as TrnBalType,PurQty as TrnBalQty,PurAmount as TrnBalAmount" _
             & " from MedPurchDtl" _
             & " inner join (MedPurchHdr inner join VTypMast on MedPurchHdr.PuhVtmCode = VTypMast.VtmCode) on MedPurchDtl.PurCode = MedPurchHdr.PuhCode" _
             & " where PurDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and PurDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and PurCode > 0 and VtmSysCode = " & CStr(cCOM_VTYPE_RETNINW) _
             & IIf(mQryPrtCode > 0, " and PurPrtCode = " & CStr(mQryPrtCode), "") _
             & IIf(mQrySimCode > 0, " and PurSimCode = " & CStr(mQrySimCode), "")
        End If
        Rem sales ---------------------
        If chkFBySale.Value = vbChecked = True Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select SalPrtCode as TrnPrtCode" _
             & ",'Opn' as TrnOpnType,0 as TrnOpnQty,0 as TrnOpnAmount" _
             & ",'Pur' as TrnPurType,0 as TrnPurQty,0 as TrnPurAmount" _
             & ",'Sal' as TrnSalType,SalQty as TrnSalQty,SalAmount as TrnSalAmount" _
             & ",'Bal' as TrnBalType,SalQty * -1 as TrnBalQty,SalAmount * -1 as TrnBalAmount" _
             & " from MedSaleDtl" _
             & " inner join (MedSaleHdr inner join VTypMast on MedSaleHdr.SahVtmCode = VTypMast.VtmCode) on MedSaleDtl.SalCode = MedSaleHdr.SahCode" _
             & " where SalDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and SalDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and SalCode > 0 and VtmSysCode = " & CStr(cCOM_VTYPE_SALES) _
             & IIf(mQryPrtCode > 0, " and SalPrtCode = " & CStr(mQryPrtCode), "") _
             & IIf(mQrySimCode > 0, " and SalSimCode = " & CStr(mQrySimCode), "")
        End If
        Rem purchase return
        If chkFByRetnOutw.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select SalPrtCode as TrnPrtCode" _
             & ",'Opn' as TrnOpnType,0 as TrnOpnQty,0 as TrnOpnAmount" _
             & ",'Pur' as TrnPurType,0 as TrnPurQty,0 as TrnPurAmount" _
             & ",'Sal' as TrnSalType,SalQty as TrnSalQty,SalAmount as TrnSalAmount" _
             & ",'Bal' as TrnBalType,SalQty * -1 as TrnBalQty,SalAmount * -1 as TrnBalAmount" _
             & " from MedSaleDtl" _
             & " inner join (MedSaleHdr inner join VTypMast on MedSaleHdr.SahVtmCode = VTypMast.VtmCode) on MedSaleDtl.SalCode = MedSaleHdr.SahCode" _
             & " where SalDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and SalDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and SalCode > 0 and VtmSysCode = " & CStr(cCOM_VTYPE_RETNOUTW) _
             & IIf(mQryPrtCode > 0, " and SalPrtCode = " & CStr(mQryPrtCode), "") _
             & IIf(mQrySimCode > 0, " and SalSimCode = " & CStr(mQrySimCode), "")
        End If
        Rem ----------------------------------
        mQryStr = mQryStr & ")"
        mQryStr = mQryStr & " as t1 inner join PartyMast on t1.TrnPrtCode=PartyMast.PrtCode" _
         & " group by PartyMast.PrtName,t1.TrnPrtCode" _
         & " order by PartyMast.PrtName,t1.TrnPrtCode"
        
        datRecset.open mQryStr, dbComDatabase, adOpenKeyset, adLockReadOnly
        
    ElseIf optItemWise.Value = True Then
        clsListStru.AddFields mExpr:="TrnSimName", mTitle:="Item Name", mShowItem:=True, mAlign:=1, mWidth:=2500
        clsListStru.AddFields mExpr:="TrnOpnCount", mTitle:="Opn.Count", mShowItem:=False, mAlign:=7, mWidth:=1100
        clsListStru.AddFields mExpr:="TrnOpnQty_sum", mTitle:="Opn.Qty", mShowItem:=True, mAlign:=7, mWidth:=1250
        clsListStru.AddFields mExpr:="TrnOpnAmount_sum", mTitle:="Opn.Amount", mShowItem:=False, mAlign:=7, mWidth:=1350
        clsListStru.AddFields mExpr:="TrnPurCount", mTitle:="In.Count", mShowItem:=False, mAlign:=7, mWidth:=1100
        clsListStru.AddFields mExpr:="TrnPurQty_sum", mTitle:="In.Qty", mShowItem:=True, mAlign:=7, mWidth:=1250
        clsListStru.AddFields mExpr:="TrnPurAmount_sum", mTitle:="In.Amount", mShowItem:=False, mAlign:=7, mWidth:=1350
        clsListStru.AddFields mExpr:="TrnSalCount", mTitle:="Out.Count", mShowItem:=False, mAlign:=7, mWidth:=1100
        clsListStru.AddFields mExpr:="TrnSalQty_sum", mTitle:="Out.Qty", mShowItem:=True, mAlign:=7, mWidth:=1250
        clsListStru.AddFields mExpr:="TrnSalAmount_sum", mTitle:="Out.Amount", mShowItem:=False, mAlign:=7, mWidth:=1350
        clsListStru.AddFields mExpr:="TrnBalCount", mTitle:="Bal.Count", mShowItem:=False, mAlign:=7, mWidth:=1100
        clsListStru.AddFields mExpr:="TrnBalQty_sum", mTitle:="Bal.Qty", mShowItem:=True, mAlign:=7, mWidth:=1250
        clsListStru.AddFields mExpr:="TrnBalAmount_sum", mTitle:="Bal.Amount", mShowItem:=False, mAlign:=7, mWidth:=1350
        
        mQryStr = "Select " _
         & " t1.TrnSimName,t1.TrnSimCode" _
         & ",Count(t1.TrnOpnType) as TrnOpnCount" _
         & ",Sum(t1.TrnOpnQty) as TrnOpnQty_sum" _
         & ",Sum(t1.TrnOpnAmount) as TrnOpnAmount_sum" _
         & ",Count(t1.TrnPurType) as TrnPurCount" _
         & ",Sum(t1.TrnPurQty) as TrnPurQty_sum" _
         & ",Sum(t1.TrnPurAmount) as TrnPurAmount_sum" _
         & ",Count(t1.TrnSalType) as TrnSalCount" _
         & ",Sum(t1.TrnSalQty) as TrnSalQty_sum" _
         & ",Sum(t1.TrnSalAmount) as TrnSalAmount_sum" _
         & ",Count(t1.TrnBalType) as TrnBalCount" _
         & ",Sum(t1.TrnBalQty) as TrnBalQty_sum" _
         & ",Sum(t1.TrnBalAmount) as TrnBalAmount_sum"
        mQryStr = mQryStr & " from ("
        Rem reserved query string producing no records
        mQryStr = mQryStr & "Select 0 as TrnSimCode,'' as TrnSimName" _
         & ",'' as TrnOpnType,0 as TrnOpnQty,0 as TrnOpnAmount" _
         & ",'' as TrnPurType,0 as TrnPurQty,0 as TrnPurAmount" _
         & ",'' as TrnSalType,0 as TrnSalQty,0 as TrnSalAmount" _
         & ",'' as TrnBalType,0 as TrnBalQty,0 as TrnBalAmount" _
         & " from (MedPurchDtl" _
         & " inner join (MedPurchHdr inner join VTypMast on MedPurchHdr.PuhVtmCode = VTypMast.VtmCode) on MedPurchDtl.PurCode = MedPurchHdr.PuhCode)" _
         & " inner join SubItmMast on MedPurchDtl.PurSimCode=SubItmMast.SimCode" _
         & " where PurDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and PurDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and PurCode > 0 and True = False" _
         & IIf(mQryPrtCode > 0, " and PurPrtCode = " & CStr(mQryPrtCode), "") _
         & IIf(mQrySimCode > 0, " and PurSimCode = " & CStr(mQrySimCode), "")
        Rem opening stock
        If chkFByOpnStock.Value = vbChecked Then
            Rem incoming stock
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select PurSimCode as TrnSimCode,SubItmMast.SimName as TrnSimName" _
             & ",'Opn' as TrnOpnType,PurQty as TrnOpnQty,PurAmount as TrnOpnAmount" _
             & ",'' as TrnPurType,0 as TrnPurQty,0 as TrnPurAmount" _
             & ",'' as TrnSalType,0 as TrnSalQty,0 as TrnSalAmount" _
             & ",'Bal' as TrnBalType,PurQty as TrnBalQty,PurAmount as TrnBalAmount" _
             & " from (MedPurchDtl" _
             & " inner join (MedPurchHdr inner join VTypMast on MedPurchHdr.PuhVtmCode = VTypMast.VtmCode) on MedPurchDtl.PurCode = MedPurchHdr.PuhCode)" _
             & " inner join SubItmMast on MedPurchDtl.PurSimCode=SubItmMast.SimCode" _
             & " where PurCode > 0 and VtmSysCode IN (" & CStr(cCOM_VTYPE_OPNSTK) & "," & CStr(cCOM_VTYPE_PURCHASE) & "," & CStr(cCOM_VTYPE_RETNINW) & ")" _
             & " and PurDate < #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "#" _
             & IIf(mQryPrtCode > 0, " and PurPrtCode = " & CStr(mQryPrtCode), "") _
             & IIf(mQrySimCode > 0, " and PurSimCode = " & CStr(mQrySimCode), "")
            Rem outgoing stock
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select SalSimCode as TrnSimCode,SubItmMast.SimName as TrnSimName" _
             & ",'Opn' as TrnOpnType,SalQty * -1 as TrnOpnQty,SalAmount * -1 as TrnOpnAmount" _
             & ",'' as TrnPurType,0 as TrnPurQty,0 as TrnPurAmount" _
             & ",'' as TrnSalType,0 as TrnSalQty,0 as TrnSalAmount" _
             & ",'Bal' as TrnBalType,SalQty * -1 as TrnBalQty,SalAmount * -1 as TrnBalAmount" _
             & " from (MedSaleDtl" _
             & " inner join (MedSaleHdr inner join VTypMast on MedSaleHdr.SahVtmCode = VTypMast.VtmCode) on MedSaleDtl.SalCode = MedSaleHdr.SahCode)" _
             & " inner join SubItmMast on MedSaleDtl.SalSimCode=SubItmMast.SimCode" _
             & " where SalCode > 0 and VtmSysCode IN (" & CStr(cCOM_VTYPE_SALES) & "," & CStr(cCOM_VTYPE_RETNOUTW) & ")" _
             & " and SalDate < #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "#" _
             & IIf(mQryPrtCode > 0, " and SalPrtCode = " & CStr(mQryPrtCode), "") _
             & IIf(mQrySimCode > 0, " and SalSimCode = " & CStr(mQrySimCode), "")
             
        End If
        Rem purchase
        If chkFByPurch.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select PurSimCode as TrnSimCode,SubItmMast.SimName as TrnSimName" _
             & ",'' as TrnOpnType,0 as TrnOpnQty,0 as TrnOpnAmount" _
             & ",'Pur' as TrnPurType,PurQty as TrnPurQty,PurAmount as TrnPurAmount" _
             & ",'' as TrnSalType,0 as TrnSalQty,0 as TrnSalAmount" _
             & ",'Bal' as TrnBalType,PurQty as TrnBalQty,PurAmount as TrnBalAmount" _
             & " from (MedPurchDtl" _
             & " inner join (MedPurchHdr inner join VTypMast on MedPurchHdr.PuhVtmCode = VTypMast.VtmCode) on MedPurchDtl.PurCode = MedPurchHdr.PuhCode)" _
             & " inner join SubItmMast on MedPurchDtl.PurSimCode=SubItmMast.SimCode" _
             & " where PurDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and PurDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and PurCode > 0 and VtmSysCode = " & CStr(cCOM_VTYPE_PURCHASE) _
             & IIf(mQryPrtCode > 0, " and PurPrtCode = " & CStr(mQryPrtCode), "") _
             & IIf(mQrySimCode > 0, " and PurSimCode = " & CStr(mQrySimCode), "")
        End If
        Rem sales return
        If chkFByRetnInw.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select PurSimCode as TrnSimCode,SubItmMast.SimName as TrnSimName" _
             & ",'' as TrnOpnType,0 as TrnOpnQty,0 as TrnOpnAmount" _
             & ",'Pur' as TrnPurType,PurQty as TrnPurQty,PurAmount as TrnPurAmount" _
             & ",'' as TrnSalType,0 as TrnSalQty,0 as TrnSalAmount" _
             & ",'Bal' as TrnBalType,PurQty as TrnBalQty,PurAmount as TrnBalAmount" _
             & " from (MedPurchDtl" _
             & " inner join (MedPurchHdr inner join VTypMast on MedPurchHdr.PuhVtmCode = VTypMast.VtmCode) on MedPurchDtl.PurCode = MedPurchHdr.PuhCode)" _
             & " inner join SubItmMast on MedPurchDtl.PurSimCode = SubItmMast.SimCode" _
             & " where PurDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and PurDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and PurCode > 0 and VtmSysCode = " & CStr(cCOM_VTYPE_RETNINW) _
             & IIf(mQryPrtCode > 0, " and PurPrtCode = " & CStr(mQryPrtCode), "") _
             & IIf(mQrySimCode > 0, " and PurSimCode = " & CStr(mQrySimCode), "")
        End If
        Rem sales ---------------------
        If chkFBySale.Value = vbChecked = True Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select SalSimCode as TrnSimCode,SubItmMast.SimName as TrnSimName" _
             & ",'' as TrnOpnType,0 as TrnOpnQty,0 as TrnOpnAmount" _
             & ",'' as TrnPurType,0 as TrnPurQty,0 as TrnPurAmount" _
             & ",'Sal' as TrnSalType,SalQty as TrnSalQty,SalAmount as TrnSalAmount" _
             & ",'Bal' as TrnBalType,SalQty * -1 as TrnBalQty,SalAmount * -1 as TrnBalAmount" _
             & " from (MedSaleDtl" _
             & " inner join (MedSaleHdr inner join VTypMast on MedSaleHdr.SahVtmCode = VTypMast.VtmCode) on MedSaleDtl.SalCode = MedSaleHdr.SahCode)" _
             & " inner join SubItmMast on MedSaleDtl.SalSimCode = SubItmMast.SimCode" _
             & " where SalDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and SalDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and SalCode > 0 and VtmSysCode = " & CStr(cCOM_VTYPE_SALES) _
             & IIf(mQryPrtCode > 0, " and SalPrtCode = " & CStr(mQryPrtCode), "") _
             & IIf(mQrySimCode > 0, " and SalSimCode = " & CStr(mQrySimCode), "")
        End If
        Rem purchase return
        If chkFByRetnOutw.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select SalSimCode as TrnSimCode,SubItmMast.SimName as TrnSimName" _
             & ",'' as TrnOpnType,0 as TrnOpnQty,0 as TrnOpnAmount" _
             & ",'' as TrnPurType,0 as TrnPurQty,0 as TrnPurAmount" _
             & ",'Sal' as TrnSalType,SalQty as TrnSalQty,SalAmount as TrnSalAmount" _
             & ",'Bal' as TrnBalType,SalQty * -1 as TrnBalQty,SalAmount * -1 as TrnBalAmount" _
             & " from (MedSaleDtl" _
             & " inner join (MedSaleHdr inner join VTypMast on MedSaleHdr.SahVtmCode = VTypMast.VtmCode) on MedSaleDtl.SalCode = MedSaleHdr.SahCode)" _
             & " inner join SubItmMast on MedSaleDtl.SalSimCode=SubItmMast.SimCode" _
             & " where SalDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and SalDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and SalCode > 0 and VtmSysCode = " & CStr(cCOM_VTYPE_RETNOUTW) _
             & IIf(mQryPrtCode > 0, " and SalPrtCode = " & CStr(mQryPrtCode), "") _
             & IIf(mQrySimCode > 0, " and SalSimCode = " & CStr(mQrySimCode), "")
        End If
        Rem ----------------------------------
        mQryStr = mQryStr & ")"
        mQryStr = mQryStr & " as t1 group by t1.TrnSimName,t1.TrnSimCode" _
         & " order by t1.TrnSimName,t1.TrnSimCode"
        
        datRecset.open mQryStr, dbComDatabase, adOpenKeyset, adLockReadOnly
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
     & " from (MedPurchDtl" _
     & " inner join (MedPurchHdr inner join VTypMast on MedPurchHdr.PuhVtmCode = VTypMast.VtmCode) on MedPurchDtl.PurCode = MedPurchHdr.PuhCode)" _
     & " inner join SubItmMast on MedPurchDtl.PurSimCode = SubItmMast.SimCode" _
     & " where PurDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and PurDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & " and PurCode > 0 and True = False" _
     & IIf(mQryPrtCode > 0, " and PurPrtCode = " & CStr(mQryPrtCode), "") _
     & IIf(mQrySimCode > 0, " and PurSimCode = " & CStr(mQrySimCode), "")
    Rem opening stock
    If chkFByOpnStock.Value = vbChecked Then
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
         & " from (MedPurchDtl" _
         & " inner join (MedPurchHdr inner join VTypMast on MedPurchHdr.PuhVtmCode = VTypMast.VtmCode) on MedPurchDtl.PurCode = MedPurchHdr.PuhCode)" _
         & " inner join SubItmMast on MedPurchDtl.PurSimCode = SubItmMast.SimCode" _
         & " where PurCode > 0 and VtmSysCode = " & CStr(cCOM_VTYPE_OPNSTK) _
         & " and PurDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and PurDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
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
         & " from (MedPurchDtl" _
         & " inner join (MedPurchHdr inner join VTypMast on MedPurchHdr.PuhVtmCode = VTypMast.VtmCode) on MedPurchDtl.PurCode = MedPurchHdr.PuhCode)" _
         & " inner join SubItmMast on MedPurchDtl.PurSimCode = SubItmMast.SimCode" _
         & " where PurDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and PurDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
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
         & " from (MedPurchDtl" _
         & " inner join (MedPurchHdr inner join VTypMast on MedPurchHdr.PuhVtmCode = VTypMast.VtmCode) on MedPurchDtl.PurCode = MedPurchHdr.PuhCode)" _
         & " inner join SubItmMast on MedPurchDtl.PurSimCode = SubItmMast.SimCode" _
         & " where PurDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and PurDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
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
         & " from (MedSaleDtl" _
         & " inner join (MedSaleHdr inner join VTypMast on MedSaleHdr.SahVtmCode = VTypMast.VtmCode) on MedSaleDtl.SalCode = MedSaleHdr.SahCode)" _
         & " inner join SubItmMast on MedSaleDtl.SalSimCode = SubItmMast.SimCode" _
         & " where SalDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and SalDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
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
         & " from (MedSaleDtl" _
         & " inner join (MedSaleHdr inner join VTypMast on MedSaleHdr.SahVtmCode = VTypMast.VtmCode) on MedSaleDtl.SalCode = MedSaleHdr.SahCode)" _
         & " inner join SubItmMast on MedSaleDtl.SalSimCode = SubItmMast.SimCode" _
         & " where SalDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and SalDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and SalCode > 0 and VtmSysCode = " & CStr(cCOM_VTYPE_RETNOUTW) _
         & IIf(mQryPrtCode > 0, " and SalPrtCode = " & CStr(mQryPrtCode), "") _
         & IIf(mQrySimCode > 0, " and SalSimCode = " & CStr(mQrySimCode), "")
    End If
    Rem ----------------------------------
    mQryStr = mQryStr & ") as t1"
    mQryStr = mQryStr & " inner join PartyMast on t1.TrnPrtCode = PartyMast.PrtCode" _
     & " order by t1.TrnDate,t1.VtmSysCode,t1.TrnVtmCode,t1.TrnCode"
    
    datRecset.open mQryStr, dbComDatabase, adOpenKeyset, adLockReadOnly
    
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
     & " from MedPurchHdr" _
     & " inner join VTypMast on MedPurchHdr.PuhVtmCode = VTypMast.VtmCode" _
     & " where PuhDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and PuhDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & " and PuhCode>0 and True = False" _
     & IIf(mQryPrtCode > 0, " and PuhPrtCode = " & CStr(mQryPrtCode), "")
    Rem opening stock
    If chkFByOpnStock.Value = vbChecked Then
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
         & " from MedPurchHdr" _
         & " inner join VTypMast on MedPurchHdr.PuhVtmCode = VTypMast.VtmCode" _
         & " where PuhCode > 0 and VtmSysCode = " & CStr(cCOM_VTYPE_OPNSTK) _
         & " and PuhDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and PuhDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
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
         & " from MedPurchHdr" _
         & " inner join VTypMast on MedPurchHdr.PuhVtmCode = VTypMast.VtmCode" _
         & " where PuhDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and PuhDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
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
         & " from MedPurchHdr" _
         & " inner join VTypMast on MedPurchHdr.PuhVtmCode = VTypMast.VtmCode" _
         & " where PuhDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and PuhDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
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
         & " from MedSaleHdr" _
         & " inner join VTypMast on MedSaleHdr.SahVtmCode = VTypMast.VtmCode" _
         & " where SahDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and SahDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
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
         & " from MedSaleHdr" _
         & " inner join VTypMast on MedSaleHdr.SahVtmCode = VTypMast.VtmCode" _
         & " where SahDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and SahDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and SahCode > 0 and VtmSysCode = " & CStr(cCOM_VTYPE_RETNOUTW) _
         & IIf(mQryPrtCode > 0, " and SahPrtCode = " & CStr(mQryPrtCode), "")
    End If
    Rem ----------------------------------
    mQryStr = mQryStr & ") as t1"
    mQryStr = mQryStr & " inner join PartyMast on t1.TrnPrtCode = PartyMast.PrtCode" _
     & " order by t1.TrnDate,t1.VtmSysCode,t1.TrnVtmCode,t1.TrnCode"
    
    datRecset.open mQryStr, dbComDatabase, adOpenKeyset, adLockReadOnly
    
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

mOpnCount_Tot = 0: mOpnQty_Tot = 0: mOpnAmount_Tot = 0
mPurCount_Tot = 0: mPurQty_Tot = 0: mPurAmount_Tot = 0
mSalCount_Tot = 0: mSalQty_Tot = 0: mSalAmount_Tot = 0
mBalCount_Tot = 0: mBalQty_Tot = 0: mBalAmount_Tot = 0

srow = 1
MoveRecToFirst datRecset
With datRecset
If .RecordCount > 0 Then
    Do While .EOF = False
        If optDetailed.Value = True Or optExpanded.Value = True Then
            mCount_Tot = mCount_Tot + 1
            mQty_Tot = mQty_Tot + .fields("TrnQty")
            mAmount_Tot = mAmount_Tot + .fields("TrnAmount")
            
        Else
            If optItemWise.Value = True Or optPartyNamewise.Value = True Then
                mOpnCount_Tot = mOpnCount_Tot + .fields("TrnOpnCount")
                mOpnQty_Tot = mOpnQty_Tot + .fields("TrnOpnQty_sum")
                mOpnAmount_Tot = mOpnAmount_Tot + .fields("TrnOpnAmount_sum")
            End If
            
            mPurCount_Tot = mPurCount_Tot + .fields("TrnPurCount")
            mPurQty_Tot = mPurQty_Tot + .fields("TrnPurQty_sum")
            mPurAmount_Tot = mPurAmount_Tot + .fields("TrnPurAmount_sum")
            
            mSalCount_Tot = mSalCount_Tot + .fields("TrnSalCount")
            mSalQty_Tot = mSalQty_Tot + .fields("TrnSalQty_sum")
            mSalAmount_Tot = mSalAmount_Tot + .fields("TrnSalAmount_sum")
            
            mBalCount_Tot = mBalCount_Tot + .fields("TrnBalCount")
            mBalQty_Tot = mBalQty_Tot + .fields("TrnBalQty_sum")
            mBalAmount_Tot = mBalAmount_Tot + .fields("TrnBalAmount_sum")
            
        End If
        If optMonthwise.Value = True Then
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnYrMonth")) = .fields("TrnYrMonth")
            If Month(.fields("TrnYrMonth")) < Month(Ctod(dtpFromDate.Text)) And Year(.fields("TrnYrMonth")) <= Year(Ctod(dtpFromDate.Text)) Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnMnYear")) = "Opening"
            Else
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnMnYear")) = MonthName(Val(Right(.fields("TrnYrMonth"), 2))) & "-" & Left(.fields("TrnYrMonth"), 4)
            End If
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnPurCount")) = ToMyNumFmt(.fields("TrnPurCount"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnPurQty_sum")) = ToMyNumFmt(.fields("TrnPurQty_sum"), mDecimals:=-1)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnPurAmount_sum")) = ToMyNumFmt(.fields("TrnPurAmount_sum"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnSalCount")) = ToMyNumFmt(.fields("TrnSalCount"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnSalQty_sum")) = ToMyNumFmt(.fields("TrnSalQty_sum"), mDecimals:=-1)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnSalAmount_sum")) = ToMyNumFmt(.fields("TrnSalAmount_sum"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalCount")) = ToMyNumFmt(mBalCount_Tot, mDecimals:=0)         ''' .fields("TrnBalCount")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalQty_sum")) = ToMyNumFmt(mBalQty_Tot, mDecimals:=-1)        '''    .fields("TrnBalQty_sum")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalAmount_sum")) = ToMyNumFmt(mBalAmount_Tot)          ''' .fields("TrnBalAmount_sum")
            
        ElseIf optDatewise.Value = True Then
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDateYMD")) = Format(.fields("TrnDate"), "yyyymmdd")
            If .fields("TrnDate") < Ctod(dtpFromDate.Text) Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDate")) = "Opening"
            Else
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDate")) = Dtoc(.fields("TrnDate"))
            End If
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnPurCount")) = ToMyNumFmt(.fields("TrnPurCount"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnPurQty_sum")) = ToMyNumFmt(.fields("TrnPurQty_sum"), mDecimals:=-1)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnPurAmount_sum")) = ToMyNumFmt(.fields("TrnPurAmount_sum"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnSalCount")) = ToMyNumFmt(.fields("TrnSalCount"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnSalQty_sum")) = ToMyNumFmt(.fields("TrnSalQty_sum"), mDecimals:=-1)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnSalAmount_sum")) = ToMyNumFmt(.fields("TrnSalAmount_sum"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalCount")) = ToMyNumFmt(mBalCount_Tot, mDecimals:=0)         ''' .fields("TrnBalCount")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalQty_sum")) = ToMyNumFmt(mBalQty_Tot, mDecimals:=-1)        '''    .fields("TrnBalQty_sum")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalAmount_sum")) = ToMyNumFmt(mBalAmount_Tot)          ''' .fields("TrnBalAmount_sum")
            
        ElseIf optPartyNamewise.Value = True Then
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PrtName")) = .fields("PrtName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnOpnCount")) = ToMyNumFmt(.fields("TrnOpnCount"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnOpnQty_sum")) = ToMyNumFmt(.fields("TrnOpnQty_sum"), mDecimals:=-1)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnOpnAmount_sum")) = ToMyNumFmt(.fields("TrnOpnAmount_sum"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnPurCount")) = ToMyNumFmt(.fields("TrnPurCount"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnPurQty_sum")) = ToMyNumFmt(.fields("TrnPurQty_sum"), mDecimals:=-1)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnPurAmount_sum")) = ToMyNumFmt(.fields("TrnPurAmount_sum"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnSalCount")) = ToMyNumFmt(.fields("TrnSalCount"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnSalQty_sum")) = ToMyNumFmt(.fields("TrnSalQty_sum"), mDecimals:=-1)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnSalAmount_sum")) = ToMyNumFmt(.fields("TrnSalAmount_sum"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalCount")) = ToMyNumFmt(.fields("TrnBalCount"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalQty_sum")) = ToMyNumFmt(.fields("TrnBalQty_sum"), mDecimals:=-1)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalAmount_sum")) = ToMyNumFmt(.fields("TrnBalAmount_sum"))
            
        ElseIf optItemWise.Value = True Then
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnSimName")) = .fields("TrnSimName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnOpnCount")) = ToMyNumFmt(.fields("TrnOpnCount"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnOpnQty_sum")) = ToMyNumFmt(.fields("TrnOpnQty_sum"), mDecimals:=-1)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnOpnAmount_sum")) = ToMyNumFmt(.fields("TrnOpnAmount_sum"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnPurCount")) = ToMyNumFmt(.fields("TrnPurCount"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnPurQty_sum")) = ToMyNumFmt(.fields("TrnPurQty_sum"), mDecimals:=-1)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnPurAmount_sum")) = ToMyNumFmt(.fields("TrnPurAmount_sum"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnSalCount")) = ToMyNumFmt(.fields("TrnSalCount"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnSalQty_sum")) = ToMyNumFmt(.fields("TrnSalQty_sum"), mDecimals:=-1)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnSalAmount_sum")) = ToMyNumFmt(.fields("TrnSalAmount_sum"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalCount")) = ToMyNumFmt(.fields("TrnBalCount"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalQty_sum")) = ToMyNumFmt(.fields("TrnBalQty_sum"), mDecimals:=-1)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalAmount_sum")) = ToMyNumFmt(.fields("TrnBalAmount_sum"))
            
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
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnQty")) = ToMyNumFmt(.fields("TrnQty"), mDecimals:=-1)
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
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnPurCount")) = ToMyNumFmt(mPurCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnPurQty_sum")) = ToMyNumFmt(mPurQty_Tot, mDecimals:=-1)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnPurAmount_sum")) = ToMyNumFmt(mPurAmount_Tot)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnSalCount")) = ToMyNumFmt(mSalCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnSalQty_sum")) = ToMyNumFmt(mSalQty_Tot, mDecimals:=-1)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnSalAmount_sum")) = ToMyNumFmt(mSalAmount_Tot)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalCount")) = ""   ''' ToMyNumFmt(mBalCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalQty_sum")) = ""   '''  ToMyNumFmt(mBalQty_Tot)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalAmount_sum")) = ""  '''  ToMyNumFmt(mBalAmount_Tot)
    
ElseIf optDatewise.Value = True Then
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDateYMD")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDate")) = "Grand Total"
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnPurCount")) = ToMyNumFmt(mPurCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnPurQty_sum")) = ToMyNumFmt(mPurQty_Tot, mDecimals:=-1)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnPurAmount_sum")) = ToMyNumFmt(mPurAmount_Tot)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnSalCount")) = ToMyNumFmt(mSalCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnSalQty_sum")) = ToMyNumFmt(mSalQty_Tot, mDecimals:=-1)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnSalAmount_sum")) = ToMyNumFmt(mSalAmount_Tot)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalCount")) = ""   ''' ToMyNumFmt(mBalCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalQty_sum")) = ""   ''' ToMyNumFmt(mBalQty_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalAmount_sum")) = ""   ''' ToMyNumFmt(mBalAmount_Tot)
    
ElseIf optPartyNamewise.Value = True Then
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PrtName")) = "Grand Total"
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnOpnCount")) = ToMyNumFmt(mOpnCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnOpnQty_sum")) = ToMyNumFmt(mOpnQty_Tot, mDecimals:=-1)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnOpnAmount_sum")) = ToMyNumFmt(mOpnAmount_Tot)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnPurCount")) = ToMyNumFmt(mPurCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnPurQty_sum")) = ToMyNumFmt(mPurQty_Tot, mDecimals:=-1)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnPurAmount_sum")) = ToMyNumFmt(mPurAmount_Tot)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnSalCount")) = ToMyNumFmt(mSalCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnSalQty_sum")) = ToMyNumFmt(mSalQty_Tot, mDecimals:=-1)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnSalAmount_sum")) = ToMyNumFmt(mSalAmount_Tot)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalCount")) = ""   ''' ToMyNumFmt(mBalCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalQty_sum")) = "" ''' ToMyNumFmt(mBalQty_Tot)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalAmount_sum")) = ""  ''' ToMyNumFmt(mBalAmount_Tot)
    
ElseIf optItemWise.Value = True Then
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnSimName")) = "Grand Total"
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnOpnCount")) = ToMyNumFmt(mOpnCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnOpnQty_sum")) = ToMyNumFmt(mOpnQty_Tot, mDecimals:=-1)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnOpnAmount_sum")) = ToMyNumFmt(mOpnAmount_Tot)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnPurCount")) = ToMyNumFmt(mPurCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnPurQty_sum")) = ToMyNumFmt(mPurQty_Tot, mDecimals:=-1)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnPurAmount_sum")) = ToMyNumFmt(mPurAmount_Tot)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnSalCount")) = ToMyNumFmt(mSalCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnSalQty_sum")) = ToMyNumFmt(mSalQty_Tot, mDecimals:=-1)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnSalAmount_sum")) = ToMyNumFmt(mSalAmount_Tot)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalCount")) = ""   ''' ToMyNumFmt(mBalCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalQty_sum")) = "" ''' ToMyNumFmt(mBalQty_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalAmount_sum")) = ""  ''' ToMyNumFmt(mBalAmount_Tot)
    
ElseIf optDetailed.Value = True Or optExpanded.Value = True Then
    
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("tTrnSmryId")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnVtmCode")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("VtmSysCode")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCode")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("VtmName")) = "Grand Total (" & CStr(mCount_Tot) & ")"
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnVchNo")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDate")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnQty")) = ToMyNumFmt(mQty_Tot, mDecimals:=-1)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnAmount")) = ToMyNumFmt(mAmount_Tot)
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
                Set frmTrn = New frmMedicalPurch
                Load frmTrn
                frmTrn.FormSysVchType = cCOM_VTYPE_OPNSTK
                frmTrn.RemoteAccessCode = mTrnCode
                Call frmTrn.Form_Load
                frmTrn.Show 1
                Me.ZOrder
                
            Case cCOM_VTYPE_PURCHASE
                Set frmTrn = New frmMedicalPurch
                Load frmTrn
                frmTrn.FormSysVchType = cCOM_VTYPE_PURCHASE
                frmTrn.RemoteAccessCode = mTrnCode
                Call frmTrn.Form_Load
                frmTrn.Show 1
                Me.ZOrder
            
            Case cCOM_VTYPE_RETNINW
                Set frmTrn = New frmMedicalPurch
                Load frmTrn
                frmTrn.FormSysVchType = cCOM_VTYPE_RETNINW
                frmTrn.RemoteAccessCode = mTrnCode
                Call frmTrn.Form_Load
                frmTrn.Show 1
                Me.ZOrder
            
            Case cCOM_VTYPE_SALES
                Set frmTrn = New frmMedicalSale
                Load frmTrn
                frmTrn.FormSysVchType = cCOM_VTYPE_SALES
                frmTrn.RemoteAccessCode = mTrnCode
                Call frmTrn.Form_Load
                frmTrn.Show 1
                Me.ZOrder
            
            Case cCOM_VTYPE_RETNOUTW
                Set frmTrn = New frmMedicalSale
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

Private Sub txtQrySimName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtQrySimName_Change
End If
End Sub

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

