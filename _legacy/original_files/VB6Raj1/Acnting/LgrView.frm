VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmLedgerView 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   ClientHeight    =   10275
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
   ScaleHeight     =   10275
   ScaleWidth      =   13650
   Begin VB.Frame frConfigure 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   5895
      Left            =   2880
      TabIndex        =   28
      Top             =   1200
      Width           =   6495
      Begin VB.CheckBox chkCombinedClosBal 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Combined Closing Balance"
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
         Left            =   2880
         TabIndex        =   19
         Top             =   4680
         Value           =   1  'Checked
         Width           =   3015
      End
      Begin VB.CheckBox chkShowClosBal 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Show Closing Balance"
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
         TabIndex        =   18
         Top             =   4680
         Value           =   1  'Checked
         Width           =   2535
      End
      Begin VB.CheckBox chkCombinedTran 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Combined Transaction"
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
         Left            =   2880
         TabIndex        =   17
         Top             =   4320
         Value           =   1  'Checked
         Width           =   3015
      End
      Begin VB.CheckBox chkShowTran 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Show Transaction"
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
         TabIndex        =   16
         Top             =   4320
         Value           =   1  'Checked
         Width           =   2535
      End
      Begin VB.CheckBox chkShowOpnBal 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Show Opening Balance"
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
         TabIndex        =   14
         Top             =   3960
         Value           =   1  'Checked
         Width           =   2535
      End
      Begin VB.Frame frShowTran 
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
         Height          =   1575
         Left            =   2880
         TabIndex        =   35
         Top             =   1680
         Width           =   3495
         Begin VB.OptionButton optShowCrTranOnly 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Show Credit Transaction only"
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
            TabIndex        =   13
            Top             =   1080
            Width           =   3255
         End
         Begin VB.OptionButton optShowDrTranOnly 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Show Debit Transaction only"
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
            TabIndex        =   12
            Top             =   720
            Width           =   3255
         End
         Begin VB.OptionButton optShowBothTran 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Show Both Transaction"
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
            TabIndex        =   11
            Top             =   360
            Value           =   -1  'True
            Width           =   3255
         End
      End
      Begin VB.TextBox txtQryAhname 
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
         Left            =   1440
         TabIndex        =   6
         Top             =   1200
         Width           =   3855
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
         Left            =   3360
         TabIndex        =   5
         Tag             =   "AhCode"
         Text            =   "dd/mm/yyyy"
         Top             =   720
         Width           =   1455
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
         Left            =   1440
         TabIndex        =   4
         Tag             =   "AhCode"
         Text            =   "dd/mm/yyyy"
         Top             =   720
         Width           =   1455
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
         Left            =   2640
         TabIndex        =   20
         Top             =   5160
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
         Height          =   2055
         Left            =   120
         TabIndex        =   29
         Top             =   1680
         Width           =   2655
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
            TabIndex        =   7
            Top             =   360
            Value           =   -1  'True
            Width           =   2295
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
            TabIndex        =   8
            Top             =   720
            Width           =   2175
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
            TabIndex        =   9
            Top             =   1080
            Width           =   2175
         End
         Begin VB.OptionButton optAccountwise 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Account-wise"
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
            TabIndex        =   10
            Top             =   1440
            Width           =   2175
         End
      End
      Begin VB.CheckBox chkCombinedOpnBal 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Combined Opening Balance"
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
         Left            =   2880
         TabIndex        =   15
         Top             =   3960
         Value           =   1  'Checked
         Width           =   3015
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
         Left            =   0
         TabIndex        =   30
         Top             =   0
         Width           =   6495
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Ledger Name:"
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
         Left            =   120
         TabIndex        =   33
         Top             =   1200
         Width           =   1455
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "To:"
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
         Left            =   3000
         TabIndex        =   32
         Top             =   720
         Width           =   375
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "From:"
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
         Left            =   120
         TabIndex        =   31
         Top             =   720
         Width           =   615
      End
   End
   Begin VB.Frame frDetail 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   6765
      Left            =   120
      TabIndex        =   39
      Top             =   2040
      Width           =   12015
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
         Left            =   0
         MousePointer    =   1  'Arrow
         TabIndex        =   38
         TabStop         =   0   'False
         Top             =   1440
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
         Left            =   840
         TabIndex        =   36
         Top             =   240
         Width           =   4215
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd1 
         Height          =   4575
         Left            =   0
         TabIndex        =   37
         Top             =   600
         Width           =   12015
         _ExtentX        =   21193
         _ExtentY        =   8070
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
         Index           =   22
         Left            =   120
         TabIndex        =   55
         Top             =   240
         Width           =   735
      End
      Begin VB.Label lblCurDrAmtTot 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFF80&
         Caption         =   "0.00"
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
         Left            =   2520
         TabIndex        =   54
         Top             =   6360
         Width           =   1695
      End
      Begin VB.Label lblCurCrAmtTot 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFF80&
         Caption         =   "0.00"
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
         Left            =   4440
         TabIndex        =   53
         Top             =   6360
         Width           =   1695
      End
      Begin VB.Label lblCurNetBal 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFF80&
         Caption         =   "0.00"
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
         Left            =   6360
         TabIndex        =   52
         Top             =   6360
         Width           =   1695
      End
      Begin VB.Label lblTrNetBal 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H0080C0FF&
         Caption         =   "0.00"
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
         Left            =   6360
         TabIndex        =   51
         Top             =   6000
         Width           =   1695
      End
      Begin VB.Label lblTrCrAmtTot 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H0080C0FF&
         Caption         =   "0.00"
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
         Left            =   4440
         TabIndex        =   50
         Top             =   6000
         Width           =   1695
      End
      Begin VB.Label lblTrDrAmtTot 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H0080C0FF&
         Caption         =   "0.00"
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
         Left            =   2520
         TabIndex        =   49
         Top             =   6000
         Width           =   1695
      End
      Begin VB.Label Label1 
         BackColor       =   &H00FFFF80&
         Caption         =   "Closing:"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   9
         Left            =   600
         TabIndex        =   48
         Top             =   6360
         Width           =   1335
      End
      Begin VB.Label Label1 
         BackColor       =   &H0080C0FF&
         Caption         =   "Transaction:"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   8
         Left            =   600
         TabIndex        =   47
         Top             =   6000
         Width           =   1335
      End
      Begin VB.Label Label1 
         BackColor       =   &H00C0C0FF&
         Caption         =   "Opening:"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   6
         Left            =   600
         TabIndex        =   46
         Top             =   5640
         Width           =   1335
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Caption         =   "Debit Amount:"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   15
         Left            =   2520
         TabIndex        =   45
         Top             =   5280
         Width           =   1695
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Caption         =   "Credit Amount:"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   14
         Left            =   4440
         TabIndex        =   44
         Top             =   5280
         Width           =   1695
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Caption         =   "Net Amount:"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   10
         Left            =   6360
         TabIndex        =   43
         Top             =   5280
         Width           =   1695
      End
      Begin VB.Label lblOpnDrAmtTot 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0FF&
         Caption         =   "0.00"
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
         Left            =   2520
         TabIndex        =   42
         Top             =   5640
         Width           =   1695
      End
      Begin VB.Label lblOpnCrAmtTot 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0FF&
         Caption         =   "0.00"
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
         Left            =   4440
         TabIndex        =   41
         Top             =   5640
         Width           =   1695
      End
      Begin VB.Label lblOpnNetBal 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0FF&
         Caption         =   "0.00"
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
         Left            =   6360
         TabIndex        =   40
         Top             =   5640
         Width           =   1695
      End
   End
   Begin VB.TextBox txtVoid 
      CausesValidation=   0   'False
      Height          =   375
      Left            =   0
      TabIndex        =   34
      TabStop         =   0   'False
      Text            =   "Void"
      Top             =   8640
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
      TabIndex        =   24
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
      TabIndex        =   23
      TabStop         =   0   'False
      Top             =   0
      UseMaskColor    =   -1  'True
      Width           =   255
   End
   Begin VB.Frame frHeader 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   1335
      Left            =   120
      TabIndex        =   22
      Top             =   600
      Width           =   12015
      Begin VB.CommandButton cmdOK 
         BackColor       =   &H0080FFFF&
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
         Left            =   5640
         Style           =   1  'Graphical
         TabIndex        =   3
         Top             =   840
         Width           =   735
      End
      Begin VB.TextBox dtpToDate1 
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
         Left            =   3480
         TabIndex        =   1
         Tag             =   "AhCode"
         Text            =   "dd/mm/yyyy"
         Top             =   360
         Width           =   1455
      End
      Begin VB.TextBox txtAhname 
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
         Left            =   1560
         TabIndex        =   2
         Top             =   840
         Width           =   3855
      End
      Begin VB.TextBox dtpFromDate1 
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
         Left            =   1560
         TabIndex        =   0
         Tag             =   "AhCode"
         Text            =   "dd/mm/yyyy"
         Top             =   360
         Width           =   1455
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "To:"
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
         Left            =   3120
         TabIndex        =   27
         Top             =   360
         Width           =   375
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Ledger Name:"
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
         Left            =   240
         TabIndex        =   26
         Top             =   840
         Width           =   1455
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "From:"
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
         Left            =   240
         TabIndex        =   25
         Top             =   360
         Width           =   615
      End
   End
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Ledger View"
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
      TabIndex        =   21
      Top             =   0
      Width           =   9015
   End
End
Attribute VB_Name = "frmLedgerView"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim dbAcDatabase As New ADODB.Connection, dbGrpDatabase As New ADODB.Connection, dbComDatabase As New ADODB.Connection
Dim datRecset As New ADODB.Recordset
Dim mJrnAhCode As Long
Dim mFormLoaded As Boolean, mLastKeyPressed As Integer, mMaskKeyPressed As Integer, mSmryLayer As Integer
Dim clsJRN As clsJournal, mActiveControl As Object, clsListStru As clsSelectQueryStructure
Dim fcmbAhName As clsComFlexSearch
Dim frmj1 As frmJournal, mRemoteAccess As Boolean, mEntryAccessed As Boolean, mLastRowAccessed As Long
Dim X1DRAMT_COL As Integer, X1CRAMT_COL  As Integer, X1CLOSAMT_COL As Integer

Private Type SmryPara
mFromDate As Date
mToDate  As Date
mAhCode As Long
mDetailed As Boolean
mMonthwise As Boolean
mDatewise As Boolean
mAcntwise As Boolean
mShowBothTran As Boolean
mShowDrTranOnly As Boolean
mShowCrTranOnly As Boolean
mActiveRow As Long
mShowOpnBal As Integer
mCombinedOpnBal As Integer
mShowTran As Integer
mCombinedTran As Integer
mShowClosBal As Integer
mCombinedClosBal As Integer
mRowIndex() As Variant

End Type

Dim OldSmryPara As SmryPara
Dim BackSmryPara As SmryPara

Private Sub RestoreDefaultSmryPara()
dtpFromDate.Text = Dtoc(DefaultEntryDate)
dtpFromDate1.Text = Dtoc(DefaultEntryDate)
dtpToDate.Text = Dtoc(DefaultEntryDate)
dtpToDate1.Text = Dtoc(DefaultEntryDate)
fcmbAhName.BoundText = "": txtQryAhname.Text = "": txtAhName.Text = ""
optDetailed.Value = True
optMonthwise.Value = False
optDatewise.Value = False
optAccountwise.Value = False
optShowBothTran.Value = True
optShowDrTranOnly.Value = False
optShowCrTranOnly.Value = False
chkShowOpnBal.Value = 0
chkCombinedOpnBal.Value = 1
chkShowTran.Value = 1
chkCombinedTran.Value = 0
chkShowClosBal.Value = 0
chkCombinedClosBal.Value = 1

End Sub

Private Sub RestoreOldSmryPara()
dtpFromDate.Text = Dtoc(OldSmryPara.mFromDate)
dtpFromDate1.Text = Dtoc(OldSmryPara.mFromDate)
dtpToDate.Text = Dtoc(OldSmryPara.mToDate)
dtpToDate1.Text = Dtoc(OldSmryPara.mToDate)
fcmbAhName.BoundText = CStr(OldSmryPara.mAhCode): txtQryAhname.Text = fcmbAhName.Text: txtAhName.Text = fcmbAhName.Text
optDetailed.Value = OldSmryPara.mDetailed
optMonthwise.Value = OldSmryPara.mMonthwise
optDatewise.Value = OldSmryPara.mDatewise
optAccountwise.Value = OldSmryPara.mAcntwise
optShowBothTran.Value = OldSmryPara.mShowBothTran
optShowDrTranOnly.Value = OldSmryPara.mShowDrTranOnly
optShowCrTranOnly.Value = OldSmryPara.mShowCrTranOnly
chkShowOpnBal.Value = OldSmryPara.mShowOpnBal
chkCombinedOpnBal.Value = OldSmryPara.mCombinedOpnBal
chkShowTran.Value = OldSmryPara.mShowTran
chkCombinedTran.Value = OldSmryPara.mCombinedTran
chkShowClosBal.Value = OldSmryPara.mShowClosBal
chkCombinedClosBal.Value = OldSmryPara.mCombinedClosBal

End Sub

Private Sub RestoreBackSmryPara()
dtpFromDate.Text = Dtoc(BackSmryPara.mFromDate)
dtpFromDate1.Text = Dtoc(BackSmryPara.mFromDate)
dtpToDate.Text = Dtoc(BackSmryPara.mToDate)
dtpToDate1.Text = Dtoc(BackSmryPara.mToDate)
fcmbAhName.BoundText = CStr(BackSmryPara.mAhCode): txtQryAhname.Text = fcmbAhName.Text: txtAhName.Text = fcmbAhName.Text
optDetailed.Value = BackSmryPara.mDetailed
optMonthwise.Value = BackSmryPara.mMonthwise
optDatewise.Value = BackSmryPara.mDatewise
optAccountwise.Value = BackSmryPara.mAcntwise
optShowBothTran.Value = BackSmryPara.mShowBothTran
optShowDrTranOnly.Value = BackSmryPara.mShowDrTranOnly
optShowCrTranOnly.Value = BackSmryPara.mShowCrTranOnly
chkShowOpnBal.Value = BackSmryPara.mShowOpnBal
chkCombinedOpnBal.Value = BackSmryPara.mCombinedOpnBal
chkShowTran.Value = BackSmryPara.mShowTran
chkCombinedTran.Value = BackSmryPara.mCombinedTran
chkShowClosBal.Value = BackSmryPara.mShowClosBal
chkCombinedClosBal.Value = BackSmryPara.mCombinedClosBal

End Sub

Private Sub SaveSmryPara()
OldSmryPara.mFromDate = Ctod(dtpFromDate.Text)
OldSmryPara.mToDate = Ctod(dtpToDate.Text)
OldSmryPara.mAhCode = Val(fcmbAhName.BoundText)
OldSmryPara.mDetailed = optDetailed.Value
OldSmryPara.mMonthwise = optMonthwise.Value
OldSmryPara.mDatewise = optDatewise.Value
OldSmryPara.mAcntwise = optAccountwise.Value
OldSmryPara.mShowBothTran = optShowBothTran.Value
OldSmryPara.mShowDrTranOnly = optShowDrTranOnly.Value
OldSmryPara.mShowCrTranOnly = optShowCrTranOnly.Value
OldSmryPara.mActiveRow = Mfgrd1.Row
OldSmryPara.mShowOpnBal = chkShowOpnBal.Value
OldSmryPara.mCombinedOpnBal = chkCombinedOpnBal.Value
OldSmryPara.mShowTran = chkShowTran.Value
OldSmryPara.mCombinedTran = chkCombinedTran.Value
OldSmryPara.mShowClosBal = chkShowClosBal.Value
OldSmryPara.mCombinedClosBal = chkCombinedClosBal.Value

dtpFromDate1.Text = dtpFromDate.Text
dtpToDate1.Text = dtpToDate.Text
txtAhName.Text = txtQryAhname.Text

End Sub

Private Sub SaveBackSmryPara()
BackSmryPara.mFromDate = OldSmryPara.mFromDate
BackSmryPara.mToDate = OldSmryPara.mToDate
BackSmryPara.mAhCode = OldSmryPara.mAhCode
BackSmryPara.mDetailed = OldSmryPara.mDetailed
BackSmryPara.mMonthwise = OldSmryPara.mMonthwise
BackSmryPara.mDatewise = OldSmryPara.mDatewise
BackSmryPara.mAcntwise = OldSmryPara.mAcntwise
BackSmryPara.mShowBothTran = OldSmryPara.mShowBothTran
BackSmryPara.mShowDrTranOnly = OldSmryPara.mShowDrTranOnly
BackSmryPara.mShowCrTranOnly = OldSmryPara.mShowCrTranOnly
BackSmryPara.mActiveRow = Mfgrd1.Row
BackSmryPara.mShowOpnBal = OldSmryPara.mShowOpnBal
BackSmryPara.mCombinedOpnBal = OldSmryPara.mCombinedOpnBal
BackSmryPara.mShowTran = OldSmryPara.mShowTran
BackSmryPara.mCombinedTran = OldSmryPara.mCombinedTran
BackSmryPara.mShowClosBal = OldSmryPara.mShowClosBal
BackSmryPara.mCombinedClosBal = OldSmryPara.mCombinedClosBal

End Sub

Public Property Let RemoteAccessCode(ByVal mAccessCode As Long)
mRemoteAccess = True
mJrnAhCode = mAccessCode
End Property

Public Property Get SecuMenuName() As String
SecuMenuName = Me.Name
End Property

Private Sub chkShowOpnBal_GotFocus()
FlashActiveControl chkShowOpnBal, True
End Sub

Private Sub chkShowOpnBal_LostFocus()
FlashActiveControl chkShowOpnBal, False
End Sub

Private Sub chkCombinedOpnBal_GotFocus()
FlashActiveControl chkCombinedOpnBal, True
End Sub

Private Sub chkCombinedOpnBal_LostFocus()
FlashActiveControl chkCombinedOpnBal, False
End Sub

Private Sub chkShowTran_GotFocus()
FlashActiveControl chkShowTran, True
End Sub

Private Sub chkShowTran_LostFocus()
FlashActiveControl chkShowTran, False
End Sub

Private Sub chkCombinedTran_GotFocus()
FlashActiveControl chkCombinedTran, True
End Sub

Private Sub chkCombinedTran_LostFocus()
FlashActiveControl chkCombinedTran, False
End Sub

Private Sub chkShowClosBal_GotFocus()
FlashActiveControl chkShowClosBal, True
End Sub

Private Sub chkShowClosBal_LostFocus()
FlashActiveControl chkShowClosBal, False
End Sub

Private Sub chkCombinedClosBal_GotFocus()
FlashActiveControl chkCombinedClosBal, True
End Sub

Private Sub chkCombinedClosBal_LostFocus()
FlashActiveControl chkCombinedClosBal, False
End Sub

Private Sub optAccountwise_Validate(Cancel As Boolean)
Call CheckOpnTranClosCols
End Sub

Private Sub optDatewise_Validate(Cancel As Boolean)
Call CheckOpnTranClosCols
End Sub

Private Sub optDetailed_Validate(Cancel As Boolean)
Call CheckOpnTranClosCols
End Sub

Private Sub optMonthwise_Validate(Cancel As Boolean)
Call CheckOpnTranClosCols
End Sub

Private Sub optShowCrTranOnly_GotFocus()
FlashActiveControl optShowCrTranOnly, True
End Sub

Private Sub optShowCrTranOnly_LostFocus()
FlashActiveControl optShowCrTranOnly, False
End Sub

Private Sub optShowDrTranOnly_GotFocus()
FlashActiveControl optShowDrTranOnly, True
End Sub

Private Sub optShowDrTranOnly_LostFocus()
FlashActiveControl optShowDrTranOnly, False
End Sub

Private Sub optShowBothTran_GotFocus()
FlashActiveControl optShowBothTran, True
End Sub

Private Sub optShowBothTran_LostFocus()
FlashActiveControl optShowBothTran, False
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
Call SaveSmryPara

Call SmryList
MoveRecToLast datRecset
ShowRecActiveFlexRow datRecset, Mfgrd1
txtVoid.SetFocus
frHeader.Enabled = True
frDetail.Enabled = True
frConfigure.Visible = False
Mfgrd1.SetFocus

End Sub

Private Sub cmdFormEnter_Click()
mLastKeyPressed = 13
If Screen.ActiveControl.Name = Mfgrd1.Name And frConfigure.Visible = False Then
    With datRecset
    If .EOF = False And .BOF = False Then
        If optDetailed.Value = True Then
            Call Data_EditEvent
        Else
            txtVoid.SetFocus
            If optMonthwise.Value = True Then
                dtpFromDate.Text = Dtoc(MonthStartDate(DateSerial(Val(Left(.fields("JrnYrMonth"), 4)), Val(Right(.fields("JrnYrMonth"), 2)), 1)))
                dtpToDate.Text = Dtoc(MonthEndDate(DateSerial(Val(Left(.fields("JrnYrMonth"), 4)), Val(Right(.fields("JrnYrMonth"), 2)), 1)))
            
                dtpFromDate1.Text = dtpFromDate.Text
                dtpToDate1.Text = dtpToDate.Text
            ElseIf optDatewise.Value = True Then
                dtpFromDate.Text = Dtoc(.fields("JrnDate"))
                dtpToDate.Text = Dtoc(.fields("JrnDate"))
                
                dtpFromDate1.Text = dtpFromDate.Text
                dtpToDate1.Text = dtpToDate.Text
            ElseIf optAccountwise.Value = True Then
                fcmbAhName.BoundText = CStr(.fields("JrnAhCode"))
                txtAhName.Text = fcmbAhName.Text
                txtQryAhname.Text = fcmbAhName.Text
                
            End If
            optDetailed.Value = True
            Call SaveBackSmryPara
            Call SaveSmryPara
            
            Call SmryList
            MoveRecToLast datRecset
            ShowRecActiveFlexRow datRecset, Mfgrd1
            Mfgrd1.SetFocus
            mSmryLayer = 2
        End If
    Else
        Call Data_AddEvent
    End If
    End With
Else
    SendKeys "{tab}"
End If

End Sub

Private Sub cmdFormEscape_Click()
mLastKeyPressed = 27
If frConfigure.Visible = True Then
    txtVoid.SetFocus
    frHeader.Enabled = True
    frDetail.Enabled = True
    frConfigure.Visible = False
    txtAhName.SetFocus
    Call RestoreOldSmryPara
    
ElseIf Screen.ActiveControl.Name = Mfgrd1.Name Then
    If mSmryLayer = 2 Then
        txtVoid.SetFocus
        Call RestoreBackSmryPara
        Call SaveSmryPara
        Call SmryList
        If BackSmryPara.mActiveRow < Mfgrd1.Rows - 1 Then
            Mfgrd1.Row = BackSmryPara.mActiveRow
        Else
            MoveRecToLast datRecset
            ShowRecActiveFlexRow datRecset, Mfgrd1
        End If
        Mfgrd1.SetFocus
        mSmryLayer = 1
    Else
        If Len(txtSearch1Text.Text) > 0 Then
            txtSearch1Text.Text = ""
            Call txtSearch1Text_InterActiveChange
        Else
            txtAhName.SetFocus
        End If
    End If
Else
    Unload Me
End If

End Sub

Private Sub cmdOK_Click()
If Between(Ctod(dtpFromDate.Text), sFinYrStartDate, sFinYrEndDate) = False Then
    ErrorBox "Invalid Date Range !!!"
    dtpFromDate1.SetFocus
    Exit Sub
End If
If Between(Ctod(dtpToDate.Text), sFinYrStartDate, sFinYrEndDate) = False Then
    ErrorBox "Invalid Date Range !!!"
    dtpToDate1.SetFocus
    Exit Sub
End If
''optMonthwise.Value = True
''Call SaveSmryPara
''Call SmryList
''Mfgrd1.SetFocus

Call SaveSmryPara

Call SmryList
MoveRecToLast datRecset
ShowRecActiveFlexRow datRecset, Mfgrd1
txtVoid.SetFocus
frDetail.Enabled = True
frConfigure.Visible = False
Mfgrd1.SetFocus

End Sub

Private Sub SmryList()
Dim aBal As Variant, mJrnStartDate As Date, mJrnEndDate As Date
Dim gcolcount As Integer, acount As Integer, mLow As Integer, mHigh As Integer, mPos As Integer, srow As Long, mColCount As Integer

If datRecset.State = 1 Then
    CloseTable datRecset
End If
RefreshDatabase dbAcDatabase
clsListStru.Clear

If optMonthwise.Value = True Or optDatewise.Value = True Or optAccountwise.Value = True Then
    If optMonthwise.Value = True Then
        clsListStru.AddFields mExpr:="JrnYrMonth", mAttrib:=cFAT_SYSTEM
        clsListStru.AddFields mExpr:="JrnMnYear", mTitle:="Month", mShowItem:=True, mAlign:=1, mWidth:=2000
        
        datRecset.open "Select format(JrnDate,'yyyy/MM') as JrnYrMonth" _
         & ",Sum(JrnAmt) as JrnTranAmt_sum" _
         & ",Sum(iif(JrnAmt<0,JrnAmt,0)) as JrnTranDrAmt_sum" _
         & ",Sum(iif(JrnAmt>0,JrnAmt,0)) as JrnTranCrAmt_sum" _
         & " from Journal" _
         & " where JrnDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and JrnCode<>" & CStr(cOPJRNCODE) & "" _
         & IIf(Val(fcmbAhName.BoundText) > 0, " and JrnAhCode=" & CStr(Val(fcmbAhName.BoundText)), "") _
         & IIf(optShowDrTranOnly.Value = True, " and JrnAmt<0", "") _
         & IIf(optShowCrTranOnly.Value = True, " and JrnAmt>0", "") _
         & " group by format(JrnDate,'yyyy/MM')" _
         & " order by format(JrnDate,'yyyy/MM')" _
         , dbAcDatabase, adOpenKeyset, adLockReadOnly
        
    ElseIf optDatewise.Value = True Then
        clsListStru.AddFields mExpr:="JrnDateYMD", mAttrib:=cFAT_SYSTEM
        clsListStru.AddFields mExpr:="JrnDate", mTitle:="Date", mShowItem:=True, mAlign:=1, mWidth:=2000
        
        datRecset.open "Select JrnDate" _
         & ",Sum(JrnAmt) as JrnTranAmt_sum" _
         & ",Sum(iif(JrnAmt<0,JrnAmt,0)) as JrnTranDrAmt_sum" _
         & ",Sum(iif(JrnAmt>0,JrnAmt,0)) as JrnTranCrAmt_sum" _
         & " from Journal" _
         & " where JrnDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and JrnCode<>" & CStr(cOPJRNCODE) & "" _
         & IIf(Val(fcmbAhName.BoundText) > 0, " and JrnAhCode=" & CStr(Val(fcmbAhName.BoundText)), "") _
         & IIf(optShowDrTranOnly.Value = True, " and JrnAmt<0", "") _
         & IIf(optShowCrTranOnly.Value = True, " and JrnAmt>0", "") _
         & " group by JrnDate" _
         & " order by JrnDate" _
         , dbAcDatabase, adOpenKeyset, adLockReadOnly
        
    ElseIf optAccountwise.Value = True Then
        clsListStru.AddFields mExpr:="JrnAhName", mTitle:="Account Name", mShowItem:=True, mAlign:=1, mWidth:=2000
        
        datRecset.open "Select AchdMast.AhName,JrnAhCode" _
         & ",Sum(JrnAmt) as JrnTranAmt_sum" _
         & ",Sum(iif(JrnAmt<0,JrnAmt,0)) as JrnTranDrAmt_sum" _
         & ",Sum(iif(JrnAmt>0,JrnAmt,0)) as JrnTranCrAmt_sum" _
         & " from Journal left join AchdMast on Journal.JrnAhCode=AchdMast.AhCode" _
         & " where JrnDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and JrnCode<>" & CStr(cOPJRNCODE) & "" _
         & IIf(Val(fcmbAhName.BoundText) > 0, " and JrnAhCode=" & CStr(Val(fcmbAhName.BoundText)), "") _
         & IIf(optShowDrTranOnly.Value = True, " and JrnAmt<0", "") _
         & IIf(optShowCrTranOnly.Value = True, " and JrnAmt>0", "") _
         & " and JrnSno>0" _
         & " group by AchdMast.AhName,JrnAhCode" _
         & " order by AchdMast.AhName,JrnAhCode" _
         , dbAcDatabase, adOpenKeyset, adLockReadOnly

    End If
    clsListStru.AddFields mExpr:="JrnOpnDrAmt_sum", mTitle:="Opn.Dr.Amt", mShowItem:=False, mAlign:=7, mWidth:=1500
    clsListStru.AddFields mExpr:="JrnOpnCrAmt_sum", mTitle:="Opn.Cr.Amt", mShowItem:=False, mAlign:=7, mWidth:=1500
    clsListStru.AddFields mExpr:="JrnOpnAmt_sum", mTitle:="Opn.Amt", mShowItem:=False, mAlign:=7, mWidth:=1500
    clsListStru.AddFields mExpr:="JrnTranDrAmt_sum", mTitle:="Tran.Dr.Amt", mShowItem:=False, mAlign:=7, mWidth:=1500
    clsListStru.AddFields mExpr:="JrnTranCrAmt_sum", mTitle:="Tran.Cr.Amt", mShowItem:=False, mAlign:=7, mWidth:=1500
    clsListStru.AddFields mExpr:="JrnTranAmt_sum", mTitle:="Tran.Amt", mShowItem:=False, mAlign:=7, mWidth:=1500
    clsListStru.AddFields mExpr:="JrnClosDrAmt_sum", mTitle:="Clos.Dr.Amt", mShowItem:=False, mAlign:=7, mWidth:=1500
    clsListStru.AddFields mExpr:="JrnClosCrAmt_sum", mTitle:="Clos.Cr.Amt", mShowItem:=False, mAlign:=7, mWidth:=1500
    clsListStru.AddFields mExpr:="JrnClosAmt_sum", mTitle:="Clos.Amt", mShowItem:=False, mAlign:=7, mWidth:=1500
    
    If chkShowOpnBal.Value = 1 Then
        If chkCombinedOpnBal.Value = 1 Then
            clsListStru.UpdateField mAlias:="JrnOpnAmt_sum", mShowItem:=True
        Else
            clsListStru.UpdateField mAlias:="JrnOpnDrAmt_sum", mShowItem:=True
            clsListStru.UpdateField mAlias:="JrnOpnCrAmt_sum", mShowItem:=True
        End If
    End If
    If chkShowTran.Value = 1 Then
        If chkCombinedTran.Value = 1 Then
            clsListStru.UpdateField mAlias:="JrnTranAmt_sum", mShowItem:=True
        Else
            clsListStru.UpdateField mAlias:="JrnTranDrAmt_sum", mShowItem:=True
            clsListStru.UpdateField mAlias:="JrnTranCrAmt_sum", mShowItem:=True
        End If
    End If
    If chkShowClosBal.Value = 1 Then
        If chkCombinedClosBal.Value = 1 Then
            clsListStru.UpdateField mAlias:="JrnClosAmt_sum", mShowItem:=True
        Else
            clsListStru.UpdateField mAlias:="JrnClosDrAmt_sum", mShowItem:=True
            clsListStru.UpdateField mAlias:="JrnClosCrAmt_sum", mShowItem:=True
        End If
    End If

ElseIf optDetailed.Value = True Then
    Rem column definitions
    clsListStru.AddFields mExpr:="JrnCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="JrnICode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="JrnSno", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="JrnAhCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="JrnRecState", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="tJrnSmryId", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="JrnDate", mTitle:="Date", mShowItem:=True, mWidth:=1250
    clsListStru.AddFields mExpr:="JrnAhName", mTitle:="Account Name", mShowItem:=True, mAlign:=1, mWidth:=4000
    clsListStru.AddFields mExpr:="JrnAmt", mTitle:="Amount", mShowItem:=False, mAlign:=7, mWidth:=1750
    clsListStru.AddFields mExpr:="JrnDrAmt", mTitle:="Dr.Amount", mShowItem:=False, mAlign:=7, mWidth:=1750
    clsListStru.AddFields mExpr:="JrnCrAmt", mTitle:="Cr.Amount", mShowItem:=False, mAlign:=7, mWidth:=1750
    clsListStru.AddFields mExpr:="JrnNarr", mTitle:="Narration", mShowItem:=False, mAlign:=1, mWidth:=2000
    
    datRecset.open "Select Journal.*,AchdMast.AhName" _
     & ",iif(JrnAmt<0,JrnAmt,0) as JrnDrAmt" _
     & ",iif(JrnAmt>0,JrnAmt,0) as JrnCrAmt" _
     & ",format(JrnDate,'yyyymmdd')+format(JrnCode,'0000000') as tJrnSmryId" _
     & " from Journal left join AchdMast on Journal.JrnAhCode=AchdMast.AhCode" _
     & " where JrnDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & IIf(mRemoteAccess = True, " and JrnAhCode=" & CStr(mJrnAhCode) & "", "") _
     & " and JrnCode<>" & CStr(cOPJRNCODE) & "" _
     & IIf(Val(fcmbAhName.BoundText) > 0, " and JrnAhCode=" & CStr(Val(fcmbAhName.BoundText)), "") _
     & IIf(optDetailed.Value = True, " and JrnSno>0", "") _
     & IIf(optShowDrTranOnly.Value = True, " and JrnAmt<0", "") _
     & IIf(optShowCrTranOnly.Value = True, " and JrnAmt>0", "") _
     & " order by JrnDate,JrnCode,JrnSno" _
     , dbAcDatabase, adOpenKeyset, adLockReadOnly
    
    If chkCombinedTran.Value = 1 Then
        clsListStru.UpdateField mAlias:="JrnAmt", mShowItem:=True
    Else
        clsListStru.UpdateField mAlias:="JrnDrAmt", mShowItem:=True
        clsListStru.UpdateField mAlias:="JrnCrAmt", mShowItem:=True
    End If
    
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

srow = 1
MoveRecToFirst datRecset
With datRecset
If .RecordCount > 0 Then
    Do While .EOF = False
        If optMonthwise.Value = True Or optDatewise.Value = True Or optAccountwise.Value = True Then
            If optMonthwise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrnYrMonth")) = .fields("JrnYrMonth")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrnMnYear")) = MonthName(Val(Right(.fields("JrnYrMonth"), 2))) & "-" & Left(.fields("JrnYrMonth"), 4)
                mJrnStartDate = DateSerial(Val(Left(.fields("JrnYrMonth"), 4)), Val(Right(.fields("JrnYrMonth"), 2)), 1)
                mJrnEndDate = MonthEndDate(mJrnStartDate)
            ElseIf optDatewise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrnDateYMD")) = Format(.fields("JrnDate"), "yyyymmdd")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrnDate")) = Dtoc(.fields("JrnDate"))
                mJrnStartDate = .fields("JrnDate")
                mJrnEndDate = .fields("JrnDate")
            ElseIf optAccountwise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrnAhName")) = .fields("AhName")
                mJrnStartDate = Ctod(dtpFromDate.Text)
                mJrnEndDate = Ctod(dtpToDate.Text)
            End If
            If chkShowOpnBal.Value = 1 Then
                If chkCombinedOpnBal.Value = 1 Then
                    If Val(fcmbAhName.BoundText) > 0 Then
                        aBal = clsJRN.clsAH.GetAhCurBal(Val(fcmbAhName.BoundText), mJrnStartDate - 1, mDrCrSeperated:=False)
                    Else
                        aBal = clsJRN.clsAH.GetAllAhCurBal(mJrnStartDate - 1, mDrCrSeperated:=False)
                    End If
                    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrnOpnAmt_sum")) = ToMyAcFmt(aBal(0))
                Else
                    If Val(fcmbAhName.BoundText) > 0 Then
                        aBal = clsJRN.clsAH.GetAhCurBal(Val(fcmbAhName.BoundText), mJrnStartDate - 1, mDrCrSeperated:=True)
                    Else
                        aBal = clsJRN.clsAH.GetAllAhCurBal(mJrnStartDate - 1, mDrCrSeperated:=True)
                    End If
                    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrnOpnDrAmt_sum")) = ToMyAcFmt(aBal(0))
                    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrnOpnCrAmt_sum")) = ToMyAcFmt(aBal(1))
                End If
            End If
            If chkShowTran.Value = 1 Then
                If chkCombinedTran.Value = 1 Then
                    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrnTranAmt_sum")) = ToMyAcFmt(.fields("JrnTranAmt_sum"))
                Else
                    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrnTranDrAmt_sum")) = ToMyAcFmt(.fields("JrnTranDrAmt_sum"))
                    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrnTranCrAmt_sum")) = ToMyAcFmt(.fields("JrnTranCrAmt_sum"))
                End If
            End If
            If chkShowClosBal.Value = 1 Then
                If chkCombinedClosBal.Value = 1 Then
                    If Val(fcmbAhName.BoundText) > 0 Then
                        aBal = clsJRN.clsAH.GetAhCurBal(Val(fcmbAhName.BoundText), mJrnEndDate, mDrCrSeperated:=False)
                    Else
                        aBal = clsJRN.clsAH.GetAllAhCurBal(mJrnEndDate, mDrCrSeperated:=False)
                    End If
                    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrnClosAmt_sum")) = ToMyAcFmt(aBal(0))
                Else
                    If Val(fcmbAhName.BoundText) > 0 Then
                        aBal = clsJRN.clsAH.GetAhCurBal(Val(fcmbAhName.BoundText), mJrnEndDate, mDrCrSeperated:=True)
                    Else
                        aBal = clsJRN.clsAH.GetAllAhCurBal(mJrnEndDate, mDrCrSeperated:=True)
                    End If
                    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrnClosDrAmt_sum")) = ToMyAcFmt(aBal(0))
                    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrnClosCrAmt_sum")) = ToMyAcFmt(aBal(1))
                End If
            End If
        
        ElseIf optDetailed.Value = True Then
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrnCode")) = .fields("JrnCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrnICode")) = .fields("JrnICode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrnSno")) = .fields("JrnSno")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrnAhCode")) = .fields("JrnAhCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrnRecState")) = .fields("JrnRecState")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("tJrnSmryId")) = Format(.fields("JrnDate"), "yyyymmdd") & Format(.fields("JrnCode"), "0000000")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrnDate")) = Dtoc(.fields("JrnDate"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrnAhName")) = .fields("AhName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrnAmt")) = ToMyAcFmt(.fields("JrnAmt"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrnDrAmt")) = ToMyAcFmt(.fields("JrnDrAmt"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrnCrAmt")) = ToMyAcFmt(.fields("JrnCrAmt"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrnNarr")) = .fields("JrnNarr")
            
        End If
        
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

Call SmryDrCrAmtTot

End Sub

Private Sub dtpFromDate_GotFocus()
FlashActiveControl dtpFromDate, True
End Sub

Private Sub dtpFromDate_LostFocus()
FlashActiveControl dtpFromDate, False
dtpFromDate1.Text = dtpFromDate.Text
End Sub

Private Sub dtpFromDate_Validate(Cancel As Boolean)
dtpFromDate.Text = ToMyDate(dtpFromDate.Text)
End Sub

Private Sub dtpFromDate1_GotFocus()
FlashActiveControl dtpFromDate1, True
End Sub

Private Sub dtpFromDate1_LostFocus()
FlashActiveControl dtpFromDate1, False
dtpFromDate.Text = dtpFromDate1.Text
End Sub

Private Sub dtpFromDate1_Validate(Cancel As Boolean)
dtpFromDate1.Text = ToMyDate(dtpFromDate1.Text)
End Sub

Private Sub dtpToDate_GotFocus()
FlashActiveControl dtpToDate, True
End Sub

Private Sub dtpToDate_LostFocus()
FlashActiveControl dtpToDate, False
dtpToDate1.Text = dtpToDate.Text
End Sub

Private Sub dtpToDate_Validate(Cancel As Boolean)
dtpToDate.Text = ToMyDate(dtpToDate.Text)
End Sub

Private Sub dtpToDate1_GotFocus()
FlashActiveControl dtpToDate1, True
End Sub

Private Sub dtpToDate1_LostFocus()
FlashActiveControl dtpToDate1, False
dtpToDate.Text = dtpToDate1.Text
End Sub

Private Sub dtpToDate1_Validate(Cancel As Boolean)
dtpToDate1.Text = ToMyDate(dtpToDate1.Text)
End Sub

Private Sub Form_Activate()
If mFormLoaded = False Then
    MoveRecToLast datRecset
    ShowRecActiveFlexRow datRecset, Mfgrd1
    Rem txtAhname.SetFocus
    Mfgrd1.SetFocus
Else
    If mEntryAccessed = True Then
        txtVoid.SetFocus
        Call SmryList
        If datRecset.RecordCount > 0 Then
            Call Chk_EntryAccessed
        End If
        Mfgrd1.SetFocus
    Rem Else
    Rem     txtAhname.SetFocus
    End If
End If

mFormLoaded = True
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
mLastKeyPressed = KeyCode
mMaskKeyPressed = Shift

If Shift = 0 And KeyCode = vbKeyF12 And frConfigure.Visible = False Then
    txtVoid.SetFocus
    frConfigure.Visible = True
    frHeader.Enabled = False
    frDetail.Enabled = False
    dtpFromDate.SetFocus
End If

End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
mLastKeyPressed = KeyAscii

End Sub

Private Sub Form_Load()

mFormLoaded = False
mSmryLayer = 1
SetFormSize Me, frmMain
Call Form_Resize

Call SetVoidControl(txtVoid)
txtSearch1Text.Enabled = False
frConfigure.Visible = False

X1DRAMT_COL = -1: X1CRAMT_COL = -1: X1CLOSAMT_COL = -1

OpenAcDataSource dbAcDatabase
OpenGrpDataSource dbGrpDatabase
OpenComDataSource dbComDatabase

Set clsJRN = New clsJournal
Set clsJRN.dbAcDatabase = dbAcDatabase
Set clsJRN.dbGrpDatabase = dbGrpDatabase

Set clsListStru = New clsSelectQueryStructure

Set fcmbAhName = New clsComFlexSearch
Set fcmbAhName.dbAcDatabase = dbAcDatabase
fcmbAhName.blnAchdMastList = True
fcmbAhName.Init

Call RestoreDefaultSmryPara
If mRemoteAccess = True Then
    optDetailed.Value = True
    fcmbAhName.BoundText = CStr(mJrnAhCode)
    txtAhName.Text = fcmbAhName.Text
    txtQryAhname.Text = fcmbAhName.Text
End If
Call SaveSmryPara

Mfgrd1.Rows = 2: Mfgrd1.FixedRows = 1: Mfgrd1.FixedCols = 0
datRecset.open "Select * from Journal order by JrnICode", dbAcDatabase, adOpenKeyset, adLockOptimistic
Call SmryList

End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
mLastKeyPressed = 0
End Sub

Private Sub Form_Resize()
lblFormHeading.Width = Me.Width
cmdFormEscape.Left = Me.Width - (cmdFormEscape.Width * 2)
cmdFormEnter.Left = Me.Width + cmdFormEscape.Width
frHeader.Left = (Me.Width - frHeader.Width) / 2: frHeader.Top = lblFormHeading.Top + (lblFormHeading.Height * 2)
frDetail.Left = (Me.Width - frDetail.Width) / 2: frDetail.Top = frHeader.Top + frHeader.Height

End Sub

Private Sub Form_Unload(Cancel As Integer)
Set fcmbAhName = Nothing
Set clsJRN = Nothing
Set clsListStru = Nothing

CloseTable datRecset
CloseDataSource dbAcDatabase
CloseDataSource dbGrpDatabase
CloseDataSource dbComDatabase

Set frmj1 = Nothing
End Sub

Private Sub SmryDrCrAmtTot()
Dim aBal As Variant, mJrnStartDate As Date
Dim mOpnDrAmtTot As Double, mOpnCrAmtTot As Double, mOpnNetBal As Double, mCurDrAmtTot As Double, mCurCrAmtTot As Double, mCurNetBal As Double, mTrDrAmtTot As Double, mTrCrAmtTot As Double, mTrNetBal As Double
Dim aColRef(0 To 2, 0 To 2) As Variant, mRowPos As Integer

lblOpnDrAmtTot.Caption = ToMyAcFmt(0)
lblOpnCrAmtTot.Caption = ToMyAcFmt(0)
lblOpnNetBal.Caption = ToMyAcFmt(0)

lblTrDrAmtTot.Caption = ToMyAcFmt(0)
lblTrCrAmtTot.Caption = ToMyAcFmt(0)
lblTrNetBal.Caption = ToMyAcFmt(0)

lblCurDrAmtTot.Caption = ToMyAcFmt(0)
lblCurCrAmtTot.Caption = ToMyAcFmt(0)
lblCurNetBal.Caption = ToMyAcFmt(0)

Rem opening balance
mJrnStartDate = Ctod(dtpFromDate.Text)

If chkCombinedOpnBal.Value = 1 Then
    If Val(fcmbAhName.BoundText) > 0 Then
        aBal = clsJRN.clsAH.GetAhCurBal(Val(fcmbAhName.BoundText), mJrnStartDate - 1, mDrCrSeperated:=False)
    Else
        aBal = clsJRN.clsAH.GetAllAhCurBal(mJrnStartDate - 1, mDrCrSeperated:=False)
    End If
    mOpnNetBal = aBal(0)
    If mOpnNetBal < 0 Then
        mOpnDrAmtTot = mOpnNetBal
    Else
        mOpnCrAmtTot = mOpnNetBal
    End If
Else
    If Val(fcmbAhName.BoundText) > 0 Then
        aBal = clsJRN.clsAH.GetAhCurBal(Val(fcmbAhName.BoundText), mJrnStartDate - 1, mDrCrSeperated:=True)
    Else
        aBal = clsJRN.clsAH.GetAllAhCurBal(mJrnStartDate - 1, mDrCrSeperated:=True)
    End If
    mOpnDrAmtTot = aBal(0)
    mOpnCrAmtTot = aBal(1)
    mOpnNetBal = mOpnDrAmtTot + mOpnCrAmtTot
End If

Rem transaction balance
mRowPos = 0: aColRef(mRowPos, 0) = IIf(optDetailed.Value = True, "JrnAmt", "JrnTranDrAmt_sum"): aColRef(mRowPos, 1) = cDR_FLAG: aColRef(mRowPos, 2) = 0
mRowPos = 1: aColRef(mRowPos, 0) = IIf(optDetailed.Value = True, "JrnAmt", "JrnTranCrAmt_sum"): aColRef(mRowPos, 1) = cCR_FLAG: aColRef(mRowPos, 2) = 0
mRowPos = 2: aColRef(mRowPos, 0) = IIf(optDetailed.Value = True, "JrnAmt", "JrnTranAmt_sum"): aColRef(mRowPos, 1) = "": aColRef(mRowPos, 2) = 0

RecsetMColSum datRecset, aColRef

mTrDrAmtTot = aColRef(0, 2)
mTrCrAmtTot = aColRef(1, 2)
mTrNetBal = aColRef(2, 2)

Rem current balance
mCurDrAmtTot = mOpnDrAmtTot + mTrDrAmtTot
mCurCrAmtTot = mOpnCrAmtTot + mTrCrAmtTot
mCurNetBal = mOpnNetBal + mTrNetBal

Rem showing balances
lblOpnDrAmtTot.Caption = ToMyAcFmt(mOpnDrAmtTot)
lblOpnCrAmtTot.Caption = ToMyAcFmt(mOpnCrAmtTot)
lblOpnNetBal.Caption = ToMyAcFmt(mOpnNetBal)

lblTrDrAmtTot.Caption = ToMyAcFmt(mTrDrAmtTot)
lblTrCrAmtTot.Caption = ToMyAcFmt(mTrCrAmtTot)
lblTrNetBal.Caption = ToMyAcFmt(mTrNetBal)

lblCurDrAmtTot.Caption = ToMyAcFmt(mCurDrAmtTot)
lblCurCrAmtTot.Caption = ToMyAcFmt(mCurCrAmtTot)
lblCurNetBal.Caption = ToMyAcFmt(mCurNetBal)

'frBottomTotal.Left = (dgList.Columns(dgList.Columns.Count - 1).Left + dgList.Columns(dgList.Columns.Count - 1).Width - frBottomTotal.Width)
Erase aColRef

End Sub

Private Sub optAccountwise_GotFocus()
FlashActiveControl optAccountwise, True
End Sub

Private Sub optAccountwise_LostFocus()
FlashActiveControl optAccountwise, False
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

Private Sub optMonthwise_GotFocus()
FlashActiveControl optMonthwise, True
End Sub

Private Sub optMonthwise_LostFocus()
FlashActiveControl optMonthwise, False
End Sub

Private Sub txtAhName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtAhName_Change
End If

End Sub

Private Sub txtAhname_Validate(Cancel As Boolean)
txtQryAhname.Text = txtAhName.Text

End Sub

Private Sub txtQryAhname_Change()
If fcmbAhName.CallFromText_Change = False Then
    fcmbAhName.CallFromText_Change = True
    If InterActiveChange(txtQryAhname) = True Then
        fcmbAhName.UserText = Array(txtQryAhname.Text, txtQryAhname.SelStart)
        fcmbAhName.Show
        txtQryAhname.Text = fcmbAhName.Text
        If fcmbAhName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbAhName.CallFromText_Change = False
End If

End Sub

Private Sub txtQryAhname_GotFocus()
FlashActiveControl txtQryAhname, True

End Sub

Private Sub txtQryAhname_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtQryAhname_Change
End If

End Sub

Private Sub txtQryAhname_LostFocus()
FlashActiveControl txtQryAhname, False

End Sub

Private Sub txtQryAhName_Validate(Cancel As Boolean)
txtAhName.Text = txtQryAhname.Text

End Sub

Private Sub Chk_EntryAccessed()
Dim mJrnDate As Date, mJrnCode As Long, mJrnSno As Integer
mJrnDate = frmj1.EntryDate
mJrnCode = frmj1.EntryBoundCode
If frmj1.EntrySaved = True Then
    If optDetailed.Value = True Then
        Rem datRecset.Find "tJrnSmryId='" & Format(mJrnDate, "yyyymmdd") + Format(mJrnCode, "0000000") & "'", Start:=1
        txtSearch1Text_InterActiveChange Format(mJrnDate, "yyyymmdd") + Format(mJrnCode, "0000000")
    ElseIf optMonthwise.Value = True Then
        Rem datRecset.Find "JrnYrMonth='" & CStr(Year(mJrnDate)) & "-" & CStr(Month(mJrnDate)) & "'", Start:=1
        txtSearch1Text_InterActiveChange Format(mJrnDate, "yyyy") & "/" & Format(mJrnDate, "mm")
    ElseIf optDatewise.Value = True Then
        Rem datRecset.Find "JrnDate=#" & CStr(ToSysDate(mJrnDate)) & "#", Start:=1
        txtSearch1Text_InterActiveChange Format(mJrnDate, "yyyymmdd")
    ElseIf optAccountwise.Value = True Then
        Rem datRecset.Find "AhName='" & frmj1.FirstAccountName & "'", Start:=1
        txtSearch1Text_InterActiveChange frmj1.FirstAccountName
    End If
Else
    If mLastRowAccessed < Mfgrd1.Rows - 1 Then
        Mfgrd1.Row = mLastRowAccessed
    Else
        Mfgrd1.Row = Mfgrd1.Rows - 1
    End If
End If

mEntryAccessed = False

End Sub

Private Sub Data_AddEvent()
Dim mDeleteit As Boolean

mEntryAccessed = True
mLastRowAccessed = Mfgrd1.Row
Set frmj1 = New frmJournal
frmj1.RemoteAccessCode = 0
Load frmj1
frmj1.Show 1
Rem frmj1.WindowState = 2
frmj1.ZOrder

End Sub

Private Sub Data_EditEvent()
With datRecset
If optDetailed.Value = True And .EOF = False And .BOF = False Then
    mEntryAccessed = True
    mLastRowAccessed = Mfgrd1.Row
    Set frmj1 = New frmJournal
    frmj1.RemoteAccessCode = datRecset.fields("JrnCode")
    Load frmj1
    frmj1.Show 1
    Rem frmj1.WindowState = 2
    frmj1.ZOrder
End If
End With

End Sub

Private Sub Data_DeleteEvent()
Dim mJrnCode As Long, mDeleteit As Boolean, mRecAbsPos As Long

If CanUserDeleteOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If (datRecset.EOF Or datRecset.BOF) = True Then
    Exit Sub
End If
mJrnCode = datRecset.fields("JrnCode")
mRecAbsPos = datRecset.AbsolutePosition

mDeleteit = True

If mDeleteit = True Then
    mDeleteit = CanDelete()
End If
txtVoid.SetFocus
If mDeleteit = True Then
    If clsJRN.BeginJournal(mJrnCode) = True Then
        clsJRN.DeleteJournal mJrnCode
        clsJRN.UpdateJournal mJrnCode
        clsJRN.EndJournal mJrnCode
        
        Call SmryList
        If datRecset.RecordCount > mRecAbsPos And mRecAbsPos > 0 Then
            datRecset.Move mRecAbsPos - 1, 1
        Else
            MoveRecToLast datRecset
        End If
        Call SmryDrCrAmtTot
    End If
    ShowRecActiveFlexRow datRecset, Mfgrd1
    Mfgrd1.SetFocus
Else
    Mfgrd1.SetFocus
End If

End Sub

Private Sub txtAhName_Change()
If fcmbAhName.CallFromText_Change = False Then
    fcmbAhName.CallFromText_Change = True
    If InterActiveChange(txtAhName) = True Then
        fcmbAhName.UserText = Array(txtAhName.Text, txtAhName.SelStart)
        fcmbAhName.Show
        txtAhName.Text = fcmbAhName.Text
        If fcmbAhName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbAhName.CallFromText_Change = False
End If

End Sub

Private Sub txtAhName_GotFocus()
FlashActiveControl txtAhName, True

End Sub

Private Sub txtAhName_LostFocus()
FlashActiveControl txtAhName, False
End Sub

Private Sub CheckOpnTranClosCols()
Dim mShowItem As Boolean
mShowItem = (optMonthwise.Value = True Or optDatewise.Value = True Or optAccountwise.Value = True)
chkShowOpnBal.Enabled = mShowItem
chkShowClosBal.Enabled = mShowItem
chkCombinedOpnBal.Enabled = mShowItem
chkCombinedClosBal.Enabled = mShowItem

End Sub

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
        If optDetailed.Value = True Then
            Call Data_DeleteEvent
        End If
    End If
ElseIf Shift = vbCtrlMask And KeyCode = vbKeySpace Then
    Call cmdFormEnter_Click
End If

End Sub

Private Sub Mfgrd1_KeyPress(KeyAscii As Integer)
mLastKeyPressed = KeyAscii
If mMaskKeyPressed = 0 Or mMaskKeyPressed = vbShiftMask Then
    Select Case KeyAscii
    Case vbKeyBack
        If txtSearch1Text.Text <> "" Then
            txtSearch1Text.Text = Left(txtSearch1Text.Text, Len(txtSearch1Text.Text) - 1)
            Call txtSearch1Text_InterActiveChange
        End If
    Case Else
        txtSearch1Text.Text = txtSearch1Text.Text & Chr(KeyAscii)
        Call txtSearch1Text_InterActiveChange
    End Select
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

If IsMissing(mText) = True Then ' user is typing is search text box
    mText = txtSearch1Text.Text
    SearchRawFlex Mfgrd1, FlexLeftVisibleCol(Mfgrd1), mText
Else    ' system field search has been requested by programmer
    If optDetailed.Value = True Then
        Rem datRecset.Find "tJrnSmryId='" & Format(mJrnDate, "yyyymmdd") + Format(mJrnCode, "0000000") & "'", Start:=1
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("tJrnSmryId"), mText
    ElseIf optMonthwise.Value = True Then
        Rem datRecset.Find "JrnYrMonth='" & CStr(Year(mJrnDate)) & "-" & CStr(Month(mJrnDate)) & "'", Start:=1
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("JrnYrMonth"), mText
    ElseIf optDatewise.Value = True Then
        Rem datRecset.Find "JrnDate=#" & CStr(ToSysDate(mJrnDate)) & "#", Start:=1
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("JrnDateYMD"), mText
    ElseIf optAccountwise.Value = True Then
        Rem datRecset.Find "AhName='" & frmj1.FirstAccountName & "'", Start:=1
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("AhName"), mText
    End If
End If
ShowActiveFlexRow Mfgrd1

End Sub

Private Sub txtSearch1Text_GotFocus()
FlashActiveControl txtSearch1Text, True

End Sub

Private Sub txtSearch1Text_LostFocus()
FlashActiveControl txtSearch1Text, False
End Sub

