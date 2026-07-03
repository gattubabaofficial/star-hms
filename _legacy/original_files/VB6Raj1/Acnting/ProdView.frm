VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmItemView 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   ClientHeight    =   9315
   ClientLeft      =   60
   ClientTop       =   60
   ClientWidth     =   14535
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
   ScaleWidth      =   14535
   Begin VB.Frame frConfigure 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   5895
      Left            =   3120
      TabIndex        =   28
      Top             =   720
      Width           =   6735
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
         Width           =   3735
         Begin VB.OptionButton optShowIsTranOnly 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Show Issue Transaction only"
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
            Width           =   3495
         End
         Begin VB.OptionButton optShowRcTranOnly 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Show Receipt Transaction only"
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
            Width           =   3495
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
            Width           =   3495
         End
      End
      Begin VB.TextBox txtQryItmName 
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
         Left            =   3480
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
         Left            =   1560
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
            Width           =   2175
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
            Width           =   2055
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
            Width           =   2055
         End
         Begin VB.OptionButton optItemwise 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Product-wise"
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
            Width           =   2055
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
         Width           =   6735
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Product Name:"
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
         Left            =   3120
         TabIndex        =   32
         Top             =   720
         Width           =   255
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
      Height          =   7275
      Left            =   120
      TabIndex        =   39
      Top             =   2040
      Width           =   13215
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
      Begin MSFlexGridLib.MSFlexGrid Mfgrd1 
         Height          =   4695
         Left            =   0
         TabIndex        =   37
         Top             =   600
         Width           =   13215
         _ExtentX        =   23310
         _ExtentY        =   8281
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
         TabIndex        =   71
         Top             =   240
         Width           =   735
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Caption         =   "Qty"
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
         Index           =   13
         Left            =   8760
         TabIndex        =   70
         Top             =   5760
         Width           =   1575
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Caption         =   "Amount"
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
         Index           =   12
         Left            =   10440
         TabIndex        =   69
         Top             =   5760
         Width           =   1575
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Caption         =   "Qty"
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
         Index           =   11
         Left            =   5400
         TabIndex        =   68
         Top             =   5760
         Width           =   1575
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Caption         =   "Amount"
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
         Left            =   7080
         TabIndex        =   67
         Top             =   5760
         Width           =   1575
      End
      Begin VB.Label lblCurNetQty 
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
         Left            =   8760
         TabIndex        =   66
         Top             =   6840
         Width           =   1575
      End
      Begin VB.Label lblCurNetValue 
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
         Left            =   10440
         TabIndex        =   65
         Top             =   6840
         Width           =   1575
      End
      Begin VB.Label lblCurIsQtyTot 
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
         Left            =   5400
         TabIndex        =   64
         Top             =   6840
         Width           =   1575
      End
      Begin VB.Label lblCurIsValueTot 
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
         Left            =   7080
         TabIndex        =   63
         Top             =   6840
         Width           =   1575
      End
      Begin VB.Label lblCurRcQtyTot 
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
         Left            =   2040
         TabIndex        =   62
         Top             =   6840
         Width           =   1575
      End
      Begin VB.Label lblCurRcValueTot 
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
         Left            =   3720
         TabIndex        =   61
         Top             =   6840
         Width           =   1575
      End
      Begin VB.Label lblTrNetQty 
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
         Left            =   8760
         TabIndex        =   60
         Top             =   6480
         Width           =   1575
      End
      Begin VB.Label lblTrNetValue 
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
         Left            =   10440
         TabIndex        =   59
         Top             =   6480
         Width           =   1575
      End
      Begin VB.Label lblTrIsQtyTot 
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
         Left            =   5400
         TabIndex        =   58
         Top             =   6480
         Width           =   1575
      End
      Begin VB.Label lblTrIsValueTot 
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
         Left            =   7080
         TabIndex        =   57
         Top             =   6480
         Width           =   1575
      End
      Begin VB.Label lblTrRcQtyTot 
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
         Left            =   2040
         TabIndex        =   56
         Top             =   6480
         Width           =   1575
      End
      Begin VB.Label lblTrRcValueTot 
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
         Left            =   3720
         TabIndex        =   55
         Top             =   6480
         Width           =   1575
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
         Index           =   26
         Left            =   240
         TabIndex        =   54
         Top             =   6840
         Width           =   1695
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
         Index           =   24
         Left            =   240
         TabIndex        =   53
         Top             =   6480
         Width           =   1695
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
         Index           =   23
         Left            =   240
         TabIndex        =   52
         Top             =   6120
         Width           =   1695
      End
      Begin VB.Label lblOpnNetValue 
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
         Left            =   10440
         TabIndex        =   51
         Top             =   6120
         Width           =   1575
      End
      Begin VB.Label lblOpnIsValueTot 
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
         Left            =   7080
         TabIndex        =   50
         Top             =   6120
         Width           =   1575
      End
      Begin VB.Label lblOpnRcValueTot 
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
         Left            =   3720
         TabIndex        =   49
         Top             =   6120
         Width           =   1575
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Caption         =   "Amount"
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
         Left            =   3720
         TabIndex        =   48
         Top             =   5760
         Width           =   1575
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Caption         =   "Qty"
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
         Index           =   7
         Left            =   2040
         TabIndex        =   47
         Top             =   5760
         Width           =   1575
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         Caption         =   "Receipt:"
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
         Left            =   2040
         TabIndex        =   45
         Top             =   5400
         Width           =   3255
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         Caption         =   "Issue:"
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
         Left            =   5400
         TabIndex        =   44
         Top             =   5400
         Width           =   3255
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         Caption         =   "Net:"
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
         Left            =   8760
         TabIndex        =   43
         Top             =   5400
         Width           =   3255
      End
      Begin VB.Label lblOpnRcQtyTot 
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
         Left            =   2040
         TabIndex        =   42
         Top             =   6120
         Width           =   1575
      End
      Begin VB.Label lblOpnIsQtyTot 
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
         Left            =   5400
         TabIndex        =   41
         Top             =   6120
         Width           =   1575
      End
      Begin VB.Label lblOpnNetQty 
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
         Left            =   8760
         TabIndex        =   40
         Top             =   6120
         Width           =   1575
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
      Width           =   13215
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
         Left            =   5880
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
         Left            =   3720
         TabIndex        =   1
         Tag             =   "AhCode"
         Text            =   "dd/mm/yyyy"
         Top             =   360
         Width           =   1455
      End
      Begin VB.TextBox txtItmName 
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
         Left            =   1800
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
         Left            =   1800
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
         Index           =   6
         Left            =   3360
         TabIndex        =   46
         Top             =   360
         Width           =   255
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "To:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   2
         Left            =   2880
         TabIndex        =   27
         Top             =   360
         Width           =   375
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Product Name:"
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
         Width           =   1335
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
      Caption         =   "Product View"
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
Attribute VB_Name = "frmItemView"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim dbStDatabase As New ADODB.Connection, dbGrpDatabase As New ADODB.Connection, dbComDatabase As New ADODB.Connection
Dim datRecset As New ADODB.Recordset
Dim mStkItmCode As Long
Dim mFormLoaded As Boolean, mLastKeyPressed As Integer, mMaskKeyPressed As Integer, mSmryLayer As Integer
Dim clsSTK As clsStockJrn, mActiveControl As Object, clsListStru As clsSelectQueryStructure
Dim fcmbItem As clsComFlexSearch
Dim frmS1 As frmStockJrn, mRemoteAccess As Boolean, mEntryAccessed As Boolean, mLastRowAccessed As Long

Private Type SmryPara
mFromDate As Date
mToDate  As Date
mItmCode As Long
mDetailed As Boolean
mMonthwise As Boolean
mDatewise As Boolean
mItemwise As Boolean
mShowBothTran As Boolean
mShowRcTranOnly As Boolean
mShowIsTranOnly As Boolean
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
fcmbItem.BoundText = "": txtQryItmName.Text = "": txtItmName.Text = ""
optDetailed.Value = True
optMonthwise.Value = False
optDatewise.Value = False
optItemWise.Value = False
optShowBothTran.Value = True
optShowRcTranOnly.Value = False
optShowIsTranOnly.Value = False
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
fcmbItem.BoundText = CStr(OldSmryPara.mItmCode): txtQryItmName.Text = fcmbItem.Text: txtItmName.Text = fcmbItem.Text
optDetailed.Value = OldSmryPara.mDetailed
optMonthwise.Value = OldSmryPara.mMonthwise
optDatewise.Value = OldSmryPara.mDatewise
optItemWise.Value = OldSmryPara.mItemwise
optShowBothTran.Value = OldSmryPara.mShowBothTran
optShowRcTranOnly.Value = OldSmryPara.mShowRcTranOnly
optShowIsTranOnly.Value = OldSmryPara.mShowIsTranOnly
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
fcmbItem.BoundText = CStr(BackSmryPara.mItmCode): txtQryItmName.Text = fcmbItem.Text: txtItmName.Text = fcmbItem.Text
optDetailed.Value = BackSmryPara.mDetailed
optMonthwise.Value = BackSmryPara.mMonthwise
optDatewise.Value = BackSmryPara.mDatewise
optItemWise.Value = BackSmryPara.mItemwise
optShowBothTran.Value = BackSmryPara.mShowBothTran
optShowRcTranOnly.Value = BackSmryPara.mShowRcTranOnly
optShowIsTranOnly.Value = BackSmryPara.mShowIsTranOnly
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
OldSmryPara.mItmCode = Val(fcmbItem.BoundText)
OldSmryPara.mDetailed = optDetailed.Value
OldSmryPara.mMonthwise = optMonthwise.Value
OldSmryPara.mDatewise = optDatewise.Value
OldSmryPara.mItemwise = optItemWise.Value
OldSmryPara.mShowBothTran = optShowBothTran.Value
OldSmryPara.mShowRcTranOnly = optShowRcTranOnly.Value
OldSmryPara.mShowIsTranOnly = optShowIsTranOnly.Value
OldSmryPara.mActiveRow = Mfgrd1.Row
OldSmryPara.mShowOpnBal = chkShowOpnBal.Value
OldSmryPara.mCombinedOpnBal = chkCombinedOpnBal.Value
OldSmryPara.mShowTran = chkShowTran.Value
OldSmryPara.mCombinedTran = chkCombinedTran.Value
OldSmryPara.mShowClosBal = chkShowClosBal.Value
OldSmryPara.mCombinedClosBal = chkCombinedClosBal.Value

dtpFromDate1.Text = dtpFromDate.Text
dtpToDate1.Text = dtpToDate.Text
txtItmName.Text = txtQryItmName.Text

End Sub

Private Sub SaveBackSmryPara()
BackSmryPara.mFromDate = OldSmryPara.mFromDate
BackSmryPara.mToDate = OldSmryPara.mToDate
BackSmryPara.mItmCode = OldSmryPara.mItmCode
BackSmryPara.mDetailed = OldSmryPara.mDetailed
BackSmryPara.mMonthwise = OldSmryPara.mMonthwise
BackSmryPara.mDatewise = OldSmryPara.mDatewise
BackSmryPara.mItemwise = OldSmryPara.mItemwise
BackSmryPara.mShowBothTran = OldSmryPara.mShowBothTran
BackSmryPara.mShowRcTranOnly = OldSmryPara.mShowRcTranOnly
BackSmryPara.mShowIsTranOnly = OldSmryPara.mShowIsTranOnly
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
mStkItmCode = mAccessCode
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

Private Sub optItemwise_Validate(Cancel As Boolean)
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

Private Sub optShowIsTranOnly_GotFocus()
FlashActiveControl optShowIsTranOnly, True
End Sub

Private Sub optShowIsTranOnly_LostFocus()
FlashActiveControl optShowIsTranOnly, False
End Sub

Private Sub optShowRcTranOnly_GotFocus()
FlashActiveControl optShowRcTranOnly, True
End Sub

Private Sub optShowRcTranOnly_LostFocus()
FlashActiveControl optShowRcTranOnly, False
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
Mfgrd1.Enabled = True
frHeader.Enabled = True
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
                dtpFromDate.Text = Dtoc(MonthStartDate(DateSerial(Val(Left(.fields("StkYrMonth"), 4)), Val(Right(.fields("StkYrMonth"), 2)), 1)))
                dtpToDate.Text = Dtoc(MonthEndDate(DateSerial(Val(Left(.fields("StkYrMonth"), 4)), Val(Right(.fields("StkYrMonth"), 2)), 1)))
                
                dtpFromDate1.Text = dtpFromDate.Text
                dtpToDate1.Text = dtpToDate.Text
            ElseIf optDatewise.Value = True Then
                dtpFromDate.Text = Dtoc(.fields("StkDate"))
                dtpToDate.Text = Dtoc(.fields("StkDate"))
                
                dtpFromDate1.Text = dtpFromDate.Text
                dtpToDate1.Text = dtpToDate.Text
            ElseIf optItemWise.Value = True Then
                fcmbItem.BoundText = CStr(.fields("StkItmCode"))
                txtItmName.Text = fcmbItem.Text: txtQryItmName.Text = fcmbItem.Text
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
    Mfgrd1.Enabled = True
    frConfigure.Visible = False
    txtItmName.SetFocus
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
            txtItmName.SetFocus
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
Call SaveSmryPara

Call SmryList
MoveRecToLast datRecset
ShowRecActiveFlexRow datRecset, Mfgrd1
txtVoid.SetFocus
Mfgrd1.Enabled = True
frConfigure.Visible = False
Mfgrd1.SetFocus

End Sub

Private Sub SmryList()
Dim aBal As Variant, mStkStartDate As Date, mStkEndDate As Date
Dim gcolcount As Integer, acount As Integer, mLow As Integer, mHigh As Integer, mPos As Integer, srow As Long, mColCount As Integer

If datRecset.State = 1 Then
    CloseTable datRecset
End If
RefreshDatabase dbStDatabase
clsListStru.Clear

If optMonthwise.Value = True Or optDatewise.Value = True Or optItemWise.Value = True Then
    If optMonthwise.Value = True Then
        clsListStru.AddFields mExpr:="StkYrMonth", mAttrib:=cFAT_SYSTEM
        clsListStru.AddFields mExpr:="StkMnYear", mTitle:="Month", mShowItem:=True, mAlign:=1, mWidth:=2000
        
        datRecset.open "Select format(StkDate,'yyyy/MM') as StkYrMonth" _
         & ",Sum(StkQty) as StkTranQty_sum" _
         & ",Sum(iif(StkQty>0,StkQty,0)) as StkTranRcQty_sum" _
         & ",Sum(iif(StkQty<0,StkQty,0)) as StkTranIsQty_sum" _
         & ",Sum(StkValue) as StkTranValue_sum" _
         & ",Sum(iif(StkQty>0,StkValue,0)) as StkTranRcValue_sum" _
         & ",Sum(iif(StkQty<0,StkValue,0)) as StkTranIsValue_sum" _
         & " from StockJrn" _
         & " where StkDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and StkCode<>" & CStr(cOPSTKCODE) & "" _
         & IIf(Val(fcmbItem.BoundText) > 0, " and StkItmCode=" & CStr(Val(fcmbItem.BoundText)), "") _
         & IIf(optShowRcTranOnly.Value = True, " and StkQty>0", "") _
         & IIf(optShowIsTranOnly.Value = True, " and StkQty<0", "") _
         & " group by format(StkDate,'yyyy/MM')" _
         & " order by format(StkDate,'yyyy/MM')" _
         , dbStDatabase, adOpenKeyset, adLockReadOnly
        
    ElseIf optDatewise.Value = True Then
        clsListStru.AddFields mExpr:="StkDateYMD", mAttrib:=cFAT_SYSTEM
        clsListStru.AddFields mExpr:="StkDate", mTitle:="Date", mShowItem:=True, mAlign:=1, mWidth:=2000
        
        datRecset.open "Select StkDate" _
         & ",Sum(StkQty) as StkTranQty_sum" _
         & ",Sum(iif(StkQty>0,StkQty,0)) as StkTranRcQty_sum" _
         & ",Sum(iif(StkQty<0,StkQty,0)) as StkTranIsQty_sum" _
         & ",Sum(StkValue) as StkTranValue_sum" _
         & ",Sum(iif(StkQty>0,StkValue,0)) as StkTranRcValue_sum" _
         & ",Sum(iif(StkQty<0,StkValue,0)) as StkTranIsValue_sum" _
         & " from StockJrn" _
         & " where StkDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and StkCode<>" & CStr(cOPSTKCODE) & "" _
         & IIf(Val(fcmbItem.BoundText) > 0, " and StkItmCode=" & CStr(Val(fcmbItem.BoundText)), "") _
         & IIf(optShowRcTranOnly.Value = True, " and StkQty>0", "") _
         & IIf(optShowIsTranOnly.Value = True, " and StkQty<0", "") _
         & " group by StkDate" _
         & " order by StkDate" _
         , dbStDatabase, adOpenKeyset, adLockReadOnly
        
    ElseIf optItemWise.Value = True Then
        clsListStru.AddFields mExpr:="StkItmName", mTitle:="Product Name", mShowItem:=True, mAlign:=1, mWidth:=2000
        
        datRecset.open "Select ProdMast.ItmName,StkItmCode" _
         & ",Sum(StkQty) as StkTranQty_sum" _
         & ",Sum(iif(StkQty>0,StkQty,0)) as StkTranRcQty_sum" _
         & ",Sum(iif(StkQty<0,StkQty,0)) as StkTranIsQty_sum" _
         & ",Sum(StkValue) as StkTranValue_sum" _
         & ",Sum(iif(StkQty>0,StkValue,0)) as StkTranRcValue_sum" _
         & ",Sum(iif(StkQty<0,StkValue,0)) as StkTranIsValue_sum" _
         & " from StockJrn left join ProdMast on StockJrn.StkItmCode=ProdMast.ItmCode" _
         & " where StkDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and StkCode<>" & CStr(cOPSTKCODE) & "" _
         & IIf(Val(fcmbItem.BoundText) > 0, " and StkItmCode=" & CStr(Val(fcmbItem.BoundText)), "") _
         & IIf(optShowRcTranOnly.Value = True, " and StkQty>0", "") _
         & IIf(optShowIsTranOnly.Value = True, " and StkQty<0", "") _
         & " and StkSno>0" _
         & " group by ProdMast.ItmName,StkItmCode" _
         & " order by ProdMast.ItmName,StkItmCode" _
         , dbStDatabase, adOpenKeyset, adLockReadOnly

    End If
    clsListStru.AddFields mExpr:="StkOpnRcQty_sum", mTitle:="Opn.Rc.Qty", mShowItem:=False, mAlign:=7, mWidth:=1500
    clsListStru.AddFields mExpr:="StkOpnRcValue_sum", mTitle:="Opn.Rc.Value", mShowItem:=False, mAlign:=7, mWidth:=1500
    clsListStru.AddFields mExpr:="StkOpnIsQty_sum", mTitle:="Opn.Is.Qty", mShowItem:=False, mAlign:=7, mWidth:=1500
    clsListStru.AddFields mExpr:="StkOpnIsValue_sum", mTitle:="Opn.Is.Value", mShowItem:=False, mAlign:=7, mWidth:=1500
    clsListStru.AddFields mExpr:="StkOpnQty_sum", mTitle:="Opn.Qty", mShowItem:=False, mAlign:=7, mWidth:=1500
    clsListStru.AddFields mExpr:="StkOpnValue_sum", mTitle:="Opn.Value", mShowItem:=False, mAlign:=7, mWidth:=1500
    clsListStru.AddFields mExpr:="StkTranRcQty_sum", mTitle:="Tran.Rc.Qty", mShowItem:=False, mAlign:=7, mWidth:=1500
    clsListStru.AddFields mExpr:="StkTranRcValue_sum", mTitle:="Tran.Rc.Value", mShowItem:=False, mAlign:=7, mWidth:=1500
    clsListStru.AddFields mExpr:="StkTranIsQty_sum", mTitle:="Tran.Is.Qty", mShowItem:=False, mAlign:=7, mWidth:=1500
    clsListStru.AddFields mExpr:="StkTranIsValue_sum", mTitle:="Tran.Is.Value", mShowItem:=False, mAlign:=7, mWidth:=1500
    clsListStru.AddFields mExpr:="StkTranQty_sum", mTitle:="Tran.Qty", mShowItem:=False, mAlign:=7, mWidth:=1500
    clsListStru.AddFields mExpr:="StkTranValue_sum", mTitle:="Tran.Value", mShowItem:=False, mAlign:=7, mWidth:=1500
    clsListStru.AddFields mExpr:="StkClosRcQty_sum", mTitle:="Clos.Rc.Qty", mShowItem:=False, mAlign:=7, mWidth:=1500
    clsListStru.AddFields mExpr:="StkClosRcValue_sum", mTitle:="Clos.Rc.Value", mShowItem:=False, mAlign:=7, mWidth:=1500
    clsListStru.AddFields mExpr:="StkClosIsQty_sum", mTitle:="Clos.Is.Qty", mShowItem:=False, mAlign:=7, mWidth:=1500
    clsListStru.AddFields mExpr:="StkClosIsValue_sum", mTitle:="Clos.Is.Value", mShowItem:=False, mAlign:=7, mWidth:=1500
    clsListStru.AddFields mExpr:="StkClosQty_sum", mTitle:="Clos.Qty", mShowItem:=False, mAlign:=7, mWidth:=1500
    clsListStru.AddFields mExpr:="StkClosValue_sum", mTitle:="Clos.Value", mShowItem:=False, mAlign:=7, mWidth:=1500
    
    If chkShowOpnBal.Value = 1 Then
        If chkCombinedOpnBal.Value = 1 Then
            clsListStru.UpdateField mAlias:="StkOpnQty_sum", mShowItem:=True
            clsListStru.UpdateField mAlias:="StkOpnValue_sum", mShowItem:=True
        Else
            clsListStru.UpdateField mAlias:="StkOpnRcQty_sum", mShowItem:=True
            clsListStru.UpdateField mAlias:="StkOpnRcValue_sum", mShowItem:=True
            clsListStru.UpdateField mAlias:="StkOpnIsQty_sum", mShowItem:=True
            clsListStru.UpdateField mAlias:="StkOpnIsValue_sum", mShowItem:=True
        End If
    End If
    If chkShowTran.Value = 1 Then
        If chkCombinedTran.Value = 1 Then
            clsListStru.UpdateField mAlias:="StkTranQty_sum", mShowItem:=True
            clsListStru.UpdateField mAlias:="StkTranValue_sum", mShowItem:=True
        Else
            clsListStru.UpdateField mAlias:="StkTranRcQty_sum", mShowItem:=True
            clsListStru.UpdateField mAlias:="StkTranRcValue_sum", mShowItem:=True
            clsListStru.UpdateField mAlias:="StkTranIsQty_sum", mShowItem:=True
            clsListStru.UpdateField mAlias:="StkTranIsValue_sum", mShowItem:=True
        End If
    End If
    If chkShowClosBal.Value = 1 Then
        If chkCombinedClosBal.Value = 1 Then
            clsListStru.UpdateField mAlias:="StkClosQty_sum", mShowItem:=True
            clsListStru.UpdateField mAlias:="StkClosValue_sum", mShowItem:=True
        Else
            clsListStru.UpdateField mAlias:="StkClosRcQty_sum", mShowItem:=True
            clsListStru.UpdateField mAlias:="StkClosRcValue_sum", mShowItem:=True
            clsListStru.UpdateField mAlias:="StkClosIsQty_sum", mShowItem:=True
            clsListStru.UpdateField mAlias:="StkClosIsValue_sum", mShowItem:=True
        End If
    End If

ElseIf optDetailed.Value = True Then
    Rem column definitions
    clsListStru.AddFields mExpr:="StkCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="StkICode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="StkSno", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="StkItmCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="StkRecState", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="tStkSmryId", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="StkDate", mTitle:="Date", mShowItem:=True, mWidth:=1250
    clsListStru.AddFields mExpr:="StkItmName", mTitle:="Product Name", mShowItem:=True, mAlign:=1, mWidth:=4000
    clsListStru.AddFields mExpr:="StkQty", mTitle:="Qty", mShowItem:=False, mAlign:=7, mWidth:=1500
    clsListStru.AddFields mExpr:="StkValue", mTitle:="Value", mShowItem:=False, mAlign:=7, mWidth:=1500
    clsListStru.AddFields mExpr:="StkRcQty", mTitle:="Rc.Qty", mShowItem:=False, mAlign:=7, mWidth:=1500
    clsListStru.AddFields mExpr:="StkRcValue", mTitle:="Rc.Amt", mShowItem:=False, mAlign:=7, mWidth:=1500
    clsListStru.AddFields mExpr:="StkIsQty", mTitle:="Is.Qty", mShowItem:=False, mAlign:=7, mWidth:=1500
    clsListStru.AddFields mExpr:="StkIsValue", mTitle:="Is.Amt", mShowItem:=False, mAlign:=7, mWidth:=1500
    clsListStru.AddFields mExpr:="StkNarr", mTitle:="Narration", mShowItem:=False, mAlign:=1, mWidth:=2000
    
    datRecset.open "Select StockJrn.*,ProdMast.ItmName" _
     & ",iif(StkQty>0,StkQty,0) as StkRcQty" _
     & ",iif(StkQty<0,StkQty,0) as StkIsQty" _
     & ",iif(StkQty>0,StkValue,0) as StkRcValue" _
     & ",iif(StkQty<0,StkValue,0) as StkIsValue" _
     & ",format(StkDate,'yyyymmdd')+format(StkCode,'0000000') as tStkSmryId" _
     & " from StockJrn left join ProdMast on StockJrn.StkItmCode=ProdMast.ItmCode" _
     & " where StkDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & IIf(mRemoteAccess = True, " and StkItmCode=" & CStr(mStkItmCode) & "", "") _
     & " and StkCode<>" & CStr(cOPSTKCODE) & "" _
     & IIf(Val(fcmbItem.BoundText) > 0, " and StkItmCode=" & CStr(Val(fcmbItem.BoundText)), "") _
     & IIf(optDetailed.Value = True, " and StkSno>0", "") _
     & IIf(optShowRcTranOnly.Value = True, " and StkQty>0", "") _
     & IIf(optShowIsTranOnly.Value = True, " and StkQty<0", "") _
     & " order by StkDate,StkCode,StkSno" _
     , dbStDatabase, adOpenKeyset, adLockReadOnly
    
    If chkCombinedTran.Value = 1 Then
        clsListStru.UpdateField mAlias:="StkQty", mShowItem:=True
        clsListStru.UpdateField mAlias:="StkValue", mShowItem:=True
    Else
        clsListStru.UpdateField mAlias:="StkRcQty", mShowItem:=True
        clsListStru.UpdateField mAlias:="StkRcValue", mShowItem:=True
        clsListStru.UpdateField mAlias:="StkIsQty", mShowItem:=True
        clsListStru.UpdateField mAlias:="StkIsValue", mShowItem:=True
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
        If optMonthwise.Value = True Or optDatewise.Value = True Or optItemWise.Value = True Then
            If optMonthwise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkYrMonth")) = .fields("StkYrMonth")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkMnYear")) = MonthName(Val(Right(.fields("StkYrMonth"), 2))) & "-" & Left(.fields("StkYrMonth"), 4)
                mStkStartDate = DateSerial(Val(Left(.fields("StkYrMonth"), 4)), Val(Right(.fields("StkYrMonth"), 2)), 1)
                mStkEndDate = MonthEndDate(mStkStartDate)
            ElseIf optDatewise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkDateYMD")) = Format(.fields("StkDate"), "yyyymmdd")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkDate")) = Dtoc(.fields("StkDate"))
                mStkStartDate = .fields("StkDate")
                mStkEndDate = .fields("StkDate")
            ElseIf optItemWise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkItmName")) = .fields("ItmName")
                mStkStartDate = Ctod(dtpFromDate.Text)
                mStkEndDate = Ctod(dtpToDate.Text)
            End If
            If chkShowOpnBal.Value = 1 Then
                If chkCombinedOpnBal.Value = 1 Then
                    If Val(fcmbItem.BoundText) > 0 Then
                        aBal = clsSTK.clsIT.GetItmCurQtyRateValue(Val(fcmbItem.BoundText), mStkStartDate - 1, mIsRcSeperated:=False)
                    Else
                        aBal = clsSTK.clsIT.GetAllItmCurQtyRateValue(mStkStartDate - 1, mIsRcSeperated:=False)
                    End If
                    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkOpnQty_sum")) = ToMyStqFmt(aBal(0, 0))
                    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkOpnValue_sum")) = ToMyStvFmt(aBal(0, 2))
                Else
                    If Val(fcmbItem.BoundText) > 0 Then
                        aBal = clsSTK.clsIT.GetItmCurQtyRateValue(Val(fcmbItem.BoundText), mStkStartDate - 1, mIsRcSeperated:=True)
                    Else
                        aBal = clsSTK.clsIT.GetAllItmCurQtyRateValue(mStkStartDate - 1, mIsRcSeperated:=True)
                    End If
                    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkOpnRcQty_sum")) = ToMyStqFmt(aBal(0, 0))
                    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkOpnRcValue_sum")) = ToMyStvFmt(aBal(0, 2))
                    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkOpnIsQty_sum")) = ToMyStqFmt(aBal(1, 0))
                    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkOpnIsValue_sum")) = ToMyStvFmt(aBal(1, 2))
                End If
            End If
            If chkShowTran.Value = 1 Then
                If chkCombinedTran.Value = 1 Then
                    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkTranQty_sum")) = ToMyStqFmt(.fields("StkTranQty_sum"))
                    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkTranValue_sum")) = ToMyStvFmt(.fields("StkTranValue_sum"))
                Else
                    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkTranRcQty_sum")) = ToMyStqFmt(.fields("StkTranRcQty_sum"))
                    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkTranRcValue_sum")) = ToMyStvFmt(.fields("StkTranRcValue_sum"))
                    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkTranIsQty_sum")) = ToMyStqFmt(.fields("StkTranIsQty_sum"))
                    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkTranIsValue_sum")) = ToMyStvFmt(.fields("StkTranIsValue_sum"))
                End If
            End If
            If chkShowClosBal.Value = 1 Then
                If chkCombinedClosBal.Value = 1 Then
                    If Val(fcmbItem.BoundText) > 0 Then
                        aBal = clsSTK.clsIT.GetItmCurQtyRateValue(Val(fcmbItem.BoundText), mStkEndDate, mIsRcSeperated:=False)
                    Else
                        aBal = clsSTK.clsIT.GetAllItmCurQtyRateValue(mStkEndDate, mIsRcSeperated:=False)
                    End If
                    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkClosQty_sum")) = ToMyStqFmt(aBal(0, 0))
                    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkClosValue_sum")) = ToMyStvFmt(aBal(0, 2))
                Else
                    If Val(fcmbItem.BoundText) > 0 Then
                        aBal = clsSTK.clsIT.GetItmCurQtyRateValue(Val(fcmbItem.BoundText), mStkEndDate, mIsRcSeperated:=True)
                    Else
                        aBal = clsSTK.clsIT.GetAllItmCurQtyRateValue(mStkEndDate, mIsRcSeperated:=True)
                    End If
                    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkClosRcQty_sum")) = ToMyStqFmt(aBal(0, 0))
                    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkClosRcValue_sum")) = ToMyStvFmt(aBal(0, 2))
                    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkClosIsQty_sum")) = ToMyStqFmt(aBal(1, 0))
                    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkClosIsValue_sum")) = ToMyStvFmt(aBal(1, 2))
                End If
            End If
        
        ElseIf optDetailed.Value = True Then
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkCode")) = .fields("StkCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkICode")) = .fields("StkICode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkSno")) = .fields("StkSno")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkItmCode")) = .fields("StkItmCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkRecState")) = .fields("StkRecState")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("tStkSmryId")) = Format(.fields("StkDate"), "yyyymmdd") & Format(.fields("StkCode"), "0000000")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkDate")) = Dtoc(.fields("StkDate"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkItmName")) = .fields("ItmName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkQty")) = ToMyStqFmt(.fields("StkQty"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkValue")) = ToMyStvFmt(.fields("StkValue"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkRcQty")) = ToMyStqFmt(.fields("StkRcQty"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkRcValue")) = ToMyStvFmt(.fields("StkRcValue"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkIsQty")) = ToMyStqFmt(.fields("StkIsQty"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkIsValue")) = ToMyStvFmt(.fields("StkIsValue"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkNarr")) = .fields("StkNarr")
            
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

Call SmryIsRcTot

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
    Rem txtItmName.SetFocus
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
    Rem     txtItmName.SetFocus
    End If
End If

mFormLoaded = True
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
mLastKeyPressed = KeyCode
mMaskKeyPressed = Shift

If Shift = 0 And KeyCode = vbKeyF12 And frConfigure.Visible = False Then
    txtVoid.SetFocus
    frConfigure.ZOrder
    frConfigure.Visible = True
    Mfgrd1.Enabled = False
    frHeader.Enabled = False
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

OpenStDataSource dbStDatabase
OpenGrpDataSource dbGrpDatabase
OpenComDataSource dbComDatabase

Set clsSTK = New clsStockJrn
Set clsSTK.dbStDatabase = dbStDatabase
Set clsSTK.dbGrpDatabase = dbGrpDatabase

Set clsListStru = New clsSelectQueryStructure

Set fcmbItem = New clsComFlexSearch
Set fcmbItem.dbStDatabase = dbStDatabase
fcmbItem.blnProdMastList = True
fcmbItem.Init

Call RestoreDefaultSmryPara
If mRemoteAccess = True Then
    optDetailed.Value = True
    fcmbItem.BoundText = CStr(mStkItmCode)
    txtItmName.Text = fcmbItem.Text
    txtQryItmName.Text = fcmbItem.Text
End If
Call SaveSmryPara

Mfgrd1.Rows = 2: Mfgrd1.FixedRows = 1: Mfgrd1.FixedCols = 0
datRecset.open "Select * from StockJrn order by StkICode", dbStDatabase, adOpenKeyset, adLockOptimistic
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
Set fcmbItem = Nothing
Set clsSTK = Nothing
Set clsListStru = Nothing

CloseTable datRecset
CloseDataSource dbStDatabase
CloseDataSource dbGrpDatabase
CloseDataSource dbComDatabase

Set frmS1 = Nothing
End Sub

Private Sub SmryIsRcTot()
Dim aBal As Variant, mStkStartDate As Date
Dim mOpnRcQtyTot As Double, mOpnIsQtyTot As Double, mOpnNetQty As Double, mCurRcQtyTot As Double, mCurIsQtyTot As Double, mCurNetQty As Double, mTrRcQtyTot As Double, mTrIsQtyTot As Double, mTrNetQty As Double
Dim mOpnRcValueTot As Double, mOpnIsValueTot As Double, mOpnNetValue As Double, mCurRcValueTot As Double, mCurIsValueTot As Double, mCurNetValue As Double, mTrRcValueTot As Double, mTrIsValueTot As Double, mTrNetValue As Double
Dim aColRef(0 To 5, 0 To 2) As Variant, mRowPos As Integer

lblOpnRcQtyTot.Caption = ToMyStqFmt(0)
lblOpnRcValueTot.Caption = ToMyStvFmt(0)
lblOpnIsQtyTot.Caption = ToMyStqFmt(0)
lblOpnIsValueTot.Caption = ToMyStvFmt(0)
lblOpnNetQty.Caption = ToMyStqFmt(0)
lblOpnNetValue.Caption = ToMyStvFmt(0)

lblTrRcQtyTot.Caption = ToMyStqFmt(0)
lblTrRcValueTot.Caption = ToMyStvFmt(0)
lblTrIsQtyTot.Caption = ToMyStqFmt(0)
lblTrIsValueTot.Caption = ToMyStvFmt(0)
lblTrNetQty.Caption = ToMyStqFmt(0)
lblTrNetValue.Caption = ToMyStvFmt(0)

lblCurRcQtyTot.Caption = ToMyStqFmt(0)
lblCurRcValueTot.Caption = ToMyStvFmt(0)
lblCurIsQtyTot.Caption = ToMyStqFmt(0)
lblCurIsValueTot.Caption = ToMyStvFmt(0)
lblCurNetQty.Caption = ToMyStqFmt(0)
lblCurNetValue.Caption = ToMyStvFmt(0)

Rem opening balance
mStkStartDate = Ctod(dtpFromDate.Text)

If chkCombinedOpnBal.Value = 1 Then
    If Val(fcmbItem.BoundText) > 0 Then
        aBal = clsSTK.clsIT.GetItmCurQtyRateValue(Val(fcmbItem.BoundText), mStkStartDate - 1, mIsRcSeperated:=False)
    Else
        aBal = clsSTK.clsIT.GetAllItmCurQtyRateValue(mStkStartDate - 1, mIsRcSeperated:=False)
    End If
    mOpnNetQty = aBal(0, 0)
    mOpnNetValue = aBal(0, 2)
    If mOpnNetQty > 0 Then
        mOpnRcQtyTot = mOpnNetQty
        mOpnRcValueTot = mOpnNetValue
    Else
        mOpnIsQtyTot = mOpnNetQty
        mOpnIsValueTot = mOpnNetValue
    End If
Else
    If Val(fcmbItem.BoundText) > 0 Then
        aBal = clsSTK.clsIT.GetItmCurQtyRateValue(Val(fcmbItem.BoundText), mStkStartDate - 1, mIsRcSeperated:=True)
    Else
        aBal = clsSTK.clsIT.GetAllItmCurQtyRateValue(mStkStartDate - 1, mIsRcSeperated:=True)
    End If
    mOpnRcQtyTot = aBal(0, 0)
    mOpnRcValueTot = aBal(0, 2)
    mOpnIsQtyTot = aBal(1, 0)
    mOpnIsValueTot = aBal(1, 2)
    mOpnNetQty = mOpnRcQtyTot + mOpnIsQtyTot
    mOpnNetValue = mOpnRcValueTot + mOpnIsValueTot
End If

Rem transaction balance
mRowPos = 0: aColRef(mRowPos, 0) = IIf(optDetailed.Value = True, "StkQty", "StkTranRcQty_sum"): aColRef(mRowPos, 1) = cRCPT_FLAG: aColRef(mRowPos, 2) = 0
mRowPos = 1: aColRef(mRowPos, 0) = IIf(optDetailed.Value = True, "StkValue", "StkTranRcValue_sum"): aColRef(mRowPos, 1) = cRCPT_FLAG: aColRef(mRowPos, 2) = 0
mRowPos = 2: aColRef(mRowPos, 0) = IIf(optDetailed.Value = True, "StkQty", "StkTranIsQty_sum"): aColRef(mRowPos, 1) = cISSUE_FLAG: aColRef(mRowPos, 2) = 0
mRowPos = 3: aColRef(mRowPos, 0) = IIf(optDetailed.Value = True, "StkValue", "StkTranIsValue_sum"): aColRef(mRowPos, 1) = cISSUE_FLAG: aColRef(mRowPos, 2) = 0
mRowPos = 4: aColRef(mRowPos, 0) = IIf(optDetailed.Value = True, "StkQty", "StkTranQty_sum"): aColRef(mRowPos, 1) = "": aColRef(mRowPos, 2) = 0
mRowPos = 5: aColRef(mRowPos, 0) = IIf(optDetailed.Value = True, "StkValue", "StkTranValue_sum"): aColRef(mRowPos, 1) = "": aColRef(mRowPos, 2) = 0

RecsetMColSum datRecset, aColRef

mTrRcQtyTot = aColRef(0, 2)
mTrRcValueTot = aColRef(1, 2)
mTrIsQtyTot = aColRef(2, 2)
mTrIsValueTot = aColRef(3, 2)
mTrNetQty = aColRef(4, 2)
mTrNetValue = aColRef(5, 2)

Rem current balance
mCurRcQtyTot = mOpnRcQtyTot + mTrRcQtyTot
mCurRcValueTot = mOpnRcValueTot + mTrRcValueTot
mCurIsQtyTot = mOpnIsQtyTot + mTrIsQtyTot
mCurIsValueTot = mOpnIsValueTot + mTrIsValueTot
mCurNetQty = mOpnNetQty + mTrNetQty
mCurNetValue = mOpnNetValue + mTrNetValue

Rem showing balances
lblOpnRcQtyTot.Caption = ToMyStqFmt(mOpnRcQtyTot)
lblOpnRcValueTot.Caption = ToMyStvFmt(mOpnRcValueTot)
lblOpnIsQtyTot.Caption = ToMyStqFmt(mOpnIsQtyTot)
lblOpnIsValueTot.Caption = ToMyStvFmt(mOpnIsValueTot)
lblOpnNetQty.Caption = ToMyStqFmt(mOpnNetQty)
lblOpnNetValue.Caption = ToMyStvFmt(mOpnNetValue)

lblTrRcQtyTot.Caption = ToMyStqFmt(mTrRcQtyTot)
lblTrRcValueTot.Caption = ToMyStvFmt(mTrRcValueTot)
lblTrIsQtyTot.Caption = ToMyStqFmt(mTrIsQtyTot)
lblTrIsValueTot.Caption = ToMyStvFmt(mTrIsValueTot)
lblTrNetQty.Caption = ToMyStqFmt(mTrNetQty)
lblTrNetValue.Caption = ToMyStvFmt(mTrNetValue)

lblCurRcQtyTot.Caption = ToMyStqFmt(mCurRcQtyTot)
lblCurRcValueTot.Caption = ToMyStvFmt(mCurRcValueTot)
lblCurIsQtyTot.Caption = ToMyStqFmt(mCurIsQtyTot)
lblCurIsValueTot.Caption = ToMyStvFmt(mCurIsValueTot)
lblCurNetQty.Caption = ToMyStqFmt(mCurNetQty)
lblCurNetValue.Caption = ToMyStvFmt(mCurNetValue)

'frBottomTotal.Left = (dgList.Columns(dgList.Columns.Count - 1).Left + dgList.Columns(dgList.Columns.Count - 1).Width - frBottomTotal.Width)
Erase aColRef

End Sub

Private Sub optItemwise_GotFocus()
FlashActiveControl optItemWise, True
End Sub

Private Sub optItemwise_LostFocus()
FlashActiveControl optItemWise, False
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

Private Sub txtItmName_Change()
If fcmbItem.CallFromText_Change = False Then
    fcmbItem.CallFromText_Change = True
    If InterActiveChange(txtItmName) = True Then
        fcmbItem.UserText = Array(txtItmName.Text, txtItmName.SelStart)
        fcmbItem.Show
        txtItmName.Text = fcmbItem.Text
        If fcmbItem.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbItem.CallFromText_Change = False
End If

End Sub

Private Sub txtItmName_GotFocus()
FlashActiveControl txtItmName, True

End Sub

Private Sub txtItmName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtItmName_Change
End If
End Sub

Private Sub txtItmName_LostFocus()
FlashActiveControl txtItmName, False

End Sub

Private Sub txtItmName_Validate(Cancel As Boolean)
txtQryItmName.Text = txtItmName.Text

End Sub

Private Sub Chk_EntryAccessed()
Dim mStkDate As Date, mStkCode As Long, mStkSno As Integer

mStkDate = frmS1.EntryDate
mStkCode = frmS1.EntryBoundCode
If frmS1.EntrySaved = True Then
    If optDetailed.Value = True Then
        Rem datRecset.Find "tStkSmryId='" & Format(mStkDate, "yyyymmdd") + Format(mStkCode, "0000000") & "'", Start:=1
        txtSearch1Text_InterActiveChange Format(mStkDate, "yyyymmdd") + Format(mStkCode, "0000000")
    ElseIf optMonthwise.Value = True Then
        Rem datRecset.Find "StkYrMonth='" & CStr(Year(mStkDate)) & "-" & CStr(Month(mStkDate)) & "'", Start:=1
        txtSearch1Text_InterActiveChange Format(mStkDate, "yyyy") & "/" & Format(mStkDate, "mm")
    ElseIf optDatewise.Value = True Then
        Rem datRecset.Find "StkDate=#" & CStr(ToSysDate(mStkDate)) & "#", Start:=1
        txtSearch1Text_InterActiveChange Format(mStkDate, "yyyymmdd")
    ElseIf optItemWise.Value = True Then
        Rem datRecset.Find "ItmName='" & frmS1.FirstItemName & "'", Start:=1
        txtSearch1Text_InterActiveChange frmS1.FirstItemName
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
Set frmS1 = New frmStockJrn
frmS1.RemoteAccessCode = 0
Load frmS1
frmS1.Show 1
Rem frmS1.WindowState = 2
frmS1.ZOrder

End Sub

Private Sub Data_EditEvent()
With datRecset
If optDetailed.Value = True And .EOF = False And .BOF = False Then
    mEntryAccessed = True
    mLastRowAccessed = Mfgrd1.Row
    Set frmS1 = New frmStockJrn
    frmS1.RemoteAccessCode = datRecset.fields("StkCode")
    Load frmS1
    frmS1.Show 1
    Rem frmS1.WindowState = 2
    frmS1.ZOrder
End If
End With

End Sub

Private Sub Data_DeleteEvent()
Dim mStkCode As Long, mDeleteit As Boolean, mRecAbsPos As Long

If CanUserDeleteOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If (datRecset.EOF Or datRecset.BOF) = True Then
    Exit Sub
End If
mStkCode = datRecset.fields("StkCode")
mRecAbsPos = datRecset.AbsolutePosition

mDeleteit = True

If mDeleteit = True Then
    mDeleteit = CanDelete()
End If
txtVoid.SetFocus
If mDeleteit = True Then
    If clsSTK.BeginStock(mStkCode) = True Then
        clsSTK.DeleteStock mStkCode
        clsSTK.CommitStock mStkCode
        clsSTK.EndStock mStkCode
        
        Call SmryList
        If datRecset.RecordCount > mRecAbsPos And mRecAbsPos > 0 Then
            datRecset.Move mRecAbsPos - 1, 1
        Else
            MoveRecToLast datRecset
        End If
        Call SmryIsRcTot
    End If
    ShowRecActiveFlexRow datRecset, Mfgrd1
    Mfgrd1.SetFocus
Else
    Mfgrd1.SetFocus
End If

End Sub

Private Sub txtQryItmName_Change()
If fcmbItem.CallFromText_Change = False Then
    fcmbItem.CallFromText_Change = True
    If InterActiveChange(txtQryItmName) = True Then
        fcmbItem.UserText = Array(txtQryItmName.Text, txtQryItmName.SelStart)
        fcmbItem.Show
        txtQryItmName.Text = fcmbItem.Text
        If fcmbItem.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbItem.CallFromText_Change = False
End If


End Sub

Private Sub txtQryItmName_GotFocus()
FlashActiveControl txtQryItmName, True

End Sub

Private Sub txtQryItmName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtQryItmName_Change
End If
End Sub

Private Sub txtQryItmName_LostFocus()
FlashActiveControl txtQryItmName, False

End Sub

Private Sub CheckOpnTranClosCols()
Dim mShowItem As Boolean
mShowItem = (optMonthwise.Value = True Or optDatewise.Value = True Or optItemWise.Value = True)
chkShowOpnBal.Enabled = mShowItem
chkShowClosBal.Enabled = mShowItem
chkCombinedOpnBal.Enabled = mShowItem
chkCombinedClosBal.Enabled = mShowItem

End Sub

Private Sub txtQryItmName_Validate(Cancel As Boolean)
txtItmName.Text = txtQryItmName.Text

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
        Rem datRecset.Find "tStkSmryId='" & Format(mStkDate, "yyyymmdd") + Format(mStkCode, "0000000") & "'", Start:=1
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("tStkSmryId"), mText
    ElseIf optMonthwise.Value = True Then
        Rem datRecset.Find "StkYrMonth='" & CStr(Year(mStkDate)) & "-" & CStr(Month(mStkDate)) & "'", Start:=1
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("StkYrMonth"), mText
    ElseIf optDatewise.Value = True Then
        Rem datRecset.Find "StkDate=#" & CStr(ToSysDate(mStkDate)) & "#", Start:=1
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("StkDateYMD"), mText
    ElseIf optItemWise.Value = True Then
        Rem datRecset.Find "ItmName='" & frmS1.FirstItemName & "'", Start:=1
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("StkItmName"), mText
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

