VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmStockRegRep 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   ClientHeight    =   10830
   ClientLeft      =   60
   ClientTop       =   60
   ClientWidth     =   14715
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
   ScaleHeight     =   10830
   ScaleWidth      =   14715
   ShowInTaskbar   =   0   'False
   Begin VB.ComboBox cmbPatEntryMode 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
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
      Width           =   14475
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
         TabIndex        =   41
         Top             =   8760
         Width           =   1575
      End
      Begin VB.Frame frConfigure 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   7515
         Left            =   2760
         TabIndex        =   35
         Top             =   120
         Width           =   7935
         Begin VB.TextBox txtQryBldName 
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
            Left            =   6180
            TabIndex        =   15
            Top             =   1680
            Visible         =   0   'False
            Width           =   1515
         End
         Begin VB.TextBox txtQryBdcName 
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
            TabIndex        =   14
            Top             =   1680
            Width           =   4455
         End
         Begin VB.TextBox txtQryBdgName 
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
            Height          =   4275
            Left            =   3960
            TabIndex        =   25
            Top             =   2220
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
               TabIndex        =   30
               Top             =   1920
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
               TabIndex        =   26
               Top             =   360
               Value           =   1  'Checked
               Width           =   3495
            End
            Begin VB.CheckBox chkFByRetnOutw 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Issue Return"
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
               TabIndex        =   32
               Top             =   2640
               Value           =   1  'Checked
               Width           =   3015
            End
            Begin VB.CheckBox chkFByBloodOut 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Blood Issue"
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
               TabIndex        =   31
               Top             =   2280
               Value           =   1  'Checked
               Width           =   3015
            End
            Begin VB.CheckBox chkFByRetnInw 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Donate Return"
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
               TabIndex        =   29
               Top             =   1440
               Value           =   1  'Checked
               Width           =   3015
            End
            Begin VB.CheckBox chkFByBloodIn 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Blood Donate"
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
               Top             =   1080
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
               TabIndex        =   27
               Top             =   720
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
            Left            =   3540
            TabIndex        =   33
            Top             =   6780
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
            Height          =   4275
            Left            =   120
            TabIndex        =   16
            Top             =   2220
            Width           =   3735
            Begin VB.OptionButton optBloodwise 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Blood Group/Component-wise"
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
               TabIndex        =   24
               Top             =   3660
               Width           =   3375
            End
            Begin VB.OptionButton optBloodCompowise 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Component-wise"
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
               TabIndex        =   23
               Top             =   3240
               Width           =   3375
            End
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
               TabIndex        =   17
               Top             =   360
               Width           =   3375
            End
            Begin VB.OptionButton optBloodGrpwise 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Blood Group-wise"
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
               TabIndex        =   22
               Top             =   2760
               Width           =   3375
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
               TabIndex        =   18
               Top             =   840
               Value           =   -1  'True
               Width           =   3375
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
               TabIndex        =   19
               Top             =   1320
               Width           =   3375
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
               TabIndex        =   20
               Top             =   1800
               Width           =   3375
            End
            Begin VB.OptionButton optEntityNamewise 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Donor/Patient Name wise"
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
               TabIndex        =   21
               Top             =   2280
               Width           =   3375
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
         Begin VB.TextBox txtQryEttName 
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
            Caption         =   "Component:"
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
            Left            =   120
            TabIndex        =   44
            Top             =   1680
            Width           =   1575
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Blood Group:"
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
            TabIndex        =   40
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
            TabIndex        =   39
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
            TabIndex        =   38
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
            TabIndex        =   37
            Top             =   0
            Width           =   7935
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Doner/Patient:"
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
            TabIndex        =   36
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
         Width           =   14235
         _ExtentX        =   25109
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
         TabIndex        =   43
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
         TabIndex        =   42
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
         TabIndex        =   34
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
      Caption         =   "Blood Stock Register"
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
Dim mQryEttCode As Long, mQryBdgCode As Long, mQryBdcCode As Long, mQryBldCode As Long
Dim mRemoteAccess As Boolean, mEntryAccessed As Boolean, mLastRowAccessed As Long, mEntrySaved As Boolean, mEntryAborted As Boolean
Dim dbAcDatabase As New ADODB.Connection, dbBdkDatabase As New ADODB.Connection, dbGrpDatabase As New ADODB.Connection, dbComDatabase As New ADODB.Connection
Dim datRecset As New ADODB.Recordset
Dim clsJRN As clsJournal, clsAH As clsAccountHead, clsARA As clsComMastEntry, clsSTN As clsComMastEntry, clsVTM As clsComMastEntry
Dim mActiveControl As Object, clsListStru As clsSelectQueryStructure
Dim fcmbAraName As clsComFlexSearch, fcmbStnName As clsComFlexSearch, fcmbVtmName As clsComFlexSearch
Dim fcmbEttName As clsBdkFlexSearch, fcmbBdgName As clsBdkFlexSearch, fcmbBdcName As clsBdkFlexSearch, fcmbBldName As clsBdkFlexSearch
Dim frmTrn As Form

Private Type SmryPara
mIndex() As Variant
mFromDate() As Variant
mToDate() As Variant
mEttCode() As Variant
mBdgCode() As Variant
mBdcCode() As Variant
mBldCode() As Variant
mExpanded() As Variant
mDetailed() As Variant
mMonthwise() As Variant
mDatewise() As Variant
mEntityNameWise() As Variant
mBloodGrpwise() As Variant
mBloodCompowise() As Variant
mBloodwise() As Variant
mRowIndex() As Variant

End Type

Dim SmryParaLayer As SmryPara

Private Sub ClearSmryParaLayer()

With SmryParaLayer
.mIndex = Array()
.mFromDate = Array()
.mToDate = Array()
.mEttCode = Array()
.mBdgCode = Array()
.mBdcCode = Array()
.mBldCode = Array()
.mExpanded = Array()
.mDetailed = Array()
.mMonthwise = Array()
.mDatewise = Array()
.mEntityNameWise = Array()
.mBloodGrpwise = Array()
.mBloodCompowise = Array()
.mBloodwise = Array()
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
    ReDim Preserve .mEttCode(mIndex)
    ReDim Preserve .mBdgCode(mIndex)
    ReDim Preserve .mBdcCode(mIndex)
    ReDim Preserve .mBldCode(mIndex)
    ReDim Preserve .mExpanded(mIndex)
    ReDim Preserve .mDetailed(mIndex)
    ReDim Preserve .mMonthwise(mIndex)
    ReDim Preserve .mDatewise(mIndex)
    ReDim Preserve .mEntityNameWise(mIndex)
    ReDim Preserve .mBloodGrpwise(mIndex)
    ReDim Preserve .mBloodCompowise(mIndex)
    ReDim Preserve .mBloodwise(mIndex)
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
ReDim Preserve .mEttCode(mIndex)
ReDim Preserve .mBdgCode(mIndex)
ReDim Preserve .mBdcCode(mIndex)
ReDim Preserve .mBldCode(mIndex)
ReDim Preserve .mExpanded(mIndex)
ReDim Preserve .mDetailed(mIndex)
ReDim Preserve .mMonthwise(mIndex)
ReDim Preserve .mDatewise(mIndex)
ReDim Preserve .mEntityNameWise(mIndex)
ReDim Preserve .mBloodGrpwise(mIndex)
ReDim Preserve .mBloodCompowise(mIndex)
ReDim Preserve .mBloodwise(mIndex)
ReDim Preserve .mRowIndex(mIndex)
' -----------------------
.mIndex(mIndex) = mIndex
.mFromDate(mIndex) = Ctod(dtpFromDate.Text)
.mToDate(mIndex) = Ctod(dtpToDate.Text)
    fcmbEttName.BoundText = CStr(mQryEttCode)
    fcmbBdgName.BoundText = CStr(mQryBdgCode)
    fcmbBdcName.BoundText = CStr(mQryBdcCode)
    fcmbBldName.BoundText = CStr(mQryBldCode)
.mEttCode(mIndex) = Val(fcmbEttName.BoundText)
.mBdgCode(mIndex) = Val(fcmbBdgName.BoundText)
.mBdcCode(mIndex) = Val(fcmbBdcName.BoundText)
.mBldCode(mIndex) = Val(fcmbBldName.BoundText)
.mExpanded(mIndex) = optExpanded.Value
.mDetailed(mIndex) = optDetailed.Value
.mMonthwise(mIndex) = optMonthwise.Value
.mDatewise(mIndex) = optDatewise.Value
.mEntityNameWise(mIndex) = optEntityNamewise.Value
.mBloodGrpwise(mIndex) = optBloodGrpwise.Value
.mBloodCompowise(mIndex) = optBloodCompowise.Value
.mBloodwise(mIndex) = optBloodwise.Value
.mRowIndex(mIndex) = -1

End With

End Sub

Private Sub RestoreDefaultSmryPara()

dtpFromDate.Text = Dtoc(sFinYrStartDate)
dtpToDate.Text = Dtoc(sFinYrEndDate)
mQryEttCode = 0
mQryBdgCode = 0
mQryBdcCode = 0
mQryBldCode = 0
txtQryEttName.Text = "": fcmbEttName.BoundText = ""
txtQryBdgName.Text = "": fcmbBdgName.BoundText = ""
txtQryBdcName.Text = "": fcmbBdcName.BoundText = ""
txtQryBldName.Text = "": fcmbBldName.BoundText = ""
optExpanded.Value = False
optDetailed.Value = False
optMonthwise.Value = False
optDatewise.Value = False
optEntityNamewise.Value = False
optBloodGrpwise.Value = False
optBloodCompowise.Value = False
optBloodwise.Value = True
' ----------
AddSmryParaLayer mClear:=True

End Sub

Private Sub RestoreRecentSmryPara()
Dim mIndex As Integer

With SmryParaLayer
mIndex = UBound(.mIndex)
dtpFromDate.Text = Dtoc(.mFromDate(mIndex))
dtpToDate.Text = Dtoc(.mToDate(mIndex))
    mQryEttCode = .mEttCode(mIndex)
    mQryBdgCode = .mBdgCode(mIndex)
    mQryBdcCode = .mBdcCode(mIndex)
    mQryBldCode = .mBldCode(mIndex)
    fcmbEttName.BoundText = CStr(mQryEttCode): txtQryEttName.Text = fcmbEttName.Text
    fcmbBdgName.BoundText = CStr(mQryBdgCode): txtQryBdgName.Text = fcmbBdgName.Text
    fcmbBdcName.BoundText = CStr(mQryBdcCode): txtQryBdcName.Text = fcmbBdcName.Text
    fcmbBldName.BoundText = CStr(mQryBldCode): txtQryBldName.Text = fcmbBldName.Text
optExpanded.Value = .mExpanded(mIndex)
optDetailed.Value = .mDetailed(mIndex)
optMonthwise.Value = .mMonthwise(mIndex)
optDatewise.Value = .mDatewise(mIndex)
optEntityNamewise.Value = .mEntityNameWise(mIndex)
optBloodGrpwise.Value = .mBloodGrpwise(mIndex)
optBloodCompowise.Value = .mBloodCompowise(mIndex)
optBloodwise.Value = .mBloodwise(mIndex)

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
End Property

Public Property Get SecuMenuName() As String
SecuMenuName = Me.Name
End Property

Private Sub chkFByStockOut_Click()
Dim mNewValue As Integer

mNewValue = chkFByStockOut.Value
If mNewValue = 0 Or mNewValue = 1 Then
    chkFByBloodOut.Value = mNewValue
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

Private Sub chkFByBloodOut_Click()
Call ChkStockOutItemCheck
Call ChkStockOutSeleCriteria
End Sub

Private Sub chkFByBloodOut_GotFocus()
FlashActiveControl chkFByBloodOut, True
End Sub

Private Sub chkFByBloodOut_LostFocus()
FlashActiveControl chkFByBloodOut, False
End Sub

Private Sub chkFByStockIn_Click()
Dim mNewValue As Integer

mNewValue = chkFByStockIn.Value
If mNewValue = 0 Or mNewValue = 1 Then
    chkFByOpnStock.Value = mNewValue
    chkFByBloodIn.Value = mNewValue
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

Private Sub chkFByBloodIn_Click()
Call ChkStockInItemCheck
Call ChkStockInSeleCriteria
End Sub

Private Sub chkFByBloodIn_GotFocus()
FlashActiveControl chkFByBloodIn, True
End Sub

Private Sub chkFByBloodIn_LostFocus()
FlashActiveControl chkFByBloodIn, False
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

If chkFByOpnStock.Value = 1 And chkFByBloodIn.Value = 1 And chkFByRetnInw.Value = 1 Then
    chkFByStockIn.Value = 1
ElseIf chkFByOpnStock.Value = 1 Or chkFByBloodIn.Value = 1 Or chkFByRetnInw.Value = 1 Then
    chkFByStockIn.Value = 2
Else
    chkFByStockIn.Value = 0
End If

End Sub

Private Sub ChkStockOutItemCheck()

If chkFByBloodOut.Value = 1 And chkFByRetnOutw.Value = 1 Then
    chkFByStockOut.Value = 1
ElseIf chkFByBloodOut.Value = 1 Or chkFByRetnOutw.Value = 1 Then
    chkFByStockOut.Value = 2
Else
    chkFByStockOut.Value = 0
End If

End Sub

Private Sub ChkStockInSeleCriteria()

If chkFByOpnStock.Value = 1 And chkFByBloodIn.Value = 1 And chkFByRetnInw.Value = 1 Then
    lblInwSeleCriteria.Caption = chkFByStockIn.Caption
ElseIf chkFByOpnStock.Value = 1 Or chkFByBloodIn.Value = 1 Or chkFByRetnInw.Value = 1 Then
    With lblInwSeleCriteria
    .Caption = ""
    If chkFByOpnStock.Value = 1 Then
        .Caption = .Caption & chkFByOpnStock.Caption & ", "
    End If
    If chkFByBloodIn.Value = 1 Then
        .Caption = .Caption & chkFByBloodIn.Caption & ", "
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

If chkFByBloodOut.Value = 1 And chkFByRetnOutw.Value = 1 Then
    lblOutwSeleCriteria.Caption = chkFByStockOut.Caption
ElseIf chkFByBloodOut.Value = 1 Or chkFByRetnOutw.Value = 1 Then
    With lblOutwSeleCriteria
    .Caption = ""
    If chkFByBloodOut.Value = 1 Then
        .Caption = .Caption & chkFByBloodOut.Caption & ", "
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
                fcmbEttName.BoundText = CStr(mQryEttCode)
                fcmbBdgName.BoundText = CStr(mQryBdgCode)
                fcmbBdcName.BoundText = CStr(mQryBdcCode)
                fcmbBldName.BoundText = CStr(mQryBldCode)
                
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
                    If mQryBdgCode > 0 Or mQryBdcCode > 0 Or mQryBldCode > 0 Then
                        optExpanded.Value = True
                    Else
                        optDetailed.Value = True
                    End If
                    
                ElseIf optEntityNamewise.Value = True Then
                    mQryEttCode = .fields("TrnEttCode")
                    fcmbEttName.BoundText = CStr(mQryEttCode)
                    txtQryEttName.Text = fcmbEttName.Text
                    optEntityNamewise.Value = False
                    optMonthwise.Value = True
                    
                ElseIf optBloodGrpwise.Value = True Then
                    mQryBdgCode = .fields("TrnBdgCode")
                    fcmbBdgName.BoundText = CStr(mQryBdgCode)
                    txtQryBdgName.Text = fcmbBdgName.Text
                    optBloodGrpwise.Value = False
                    optMonthwise.Value = True
                    
                ElseIf optBloodCompowise.Value = True Then
                    mQryBdcCode = .fields("TrnBdcCode")
                    fcmbBdcName.BoundText = CStr(mQryBdcCode)
                    txtQryBdcName.Text = fcmbBdcName.Text
                    optBloodCompowise.Value = False
                    optMonthwise.Value = True
                    
                ElseIf optBloodwise.Value = True Then
                    mQryBldCode = .fields("TrnBldCode")
                    fcmbBldName.BoundText = CStr(mQryBldCode)
                    txtQryBldName.Text = fcmbBldName.Text
                    optBloodwise.Value = False
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
Me.MousePointer = vbNormal
AlertBox "Done !!!"

clsExcel.OpenExcelWorkBook mXlsRepPath
clsExcel.Visible = True

clsExcel.CloseExcelApp
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
    RefreshDatabase dbBdkDatabase
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
OpenBdkDataSource dbBdkDatabase
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

Set fcmbBdgName = New clsBdkFlexSearch
Set fcmbBdgName.dbBdkDatabase = dbBdkDatabase
Set fcmbBdgName.dbComDatabase = dbComDatabase
fcmbBdgName.blnBloodGrpMastList = True
fcmbBdgName.Init

Set fcmbBdcName = New clsBdkFlexSearch
Set fcmbBdcName.dbBdkDatabase = dbBdkDatabase
Set fcmbBdcName.dbComDatabase = dbComDatabase
fcmbBdcName.blnBloodCompoMastList = True
fcmbBdcName.Init

Set fcmbBldName = New clsBdkFlexSearch
Set fcmbBldName.dbBdkDatabase = dbBdkDatabase
Set fcmbBldName.dbComDatabase = dbComDatabase
fcmbBldName.blnBloodMastList = True
fcmbBldName.Init

Set fcmbEttName = New clsBdkFlexSearch
Set fcmbEttName.dbBdkDatabase = dbBdkDatabase
Set fcmbEttName.dbComDatabase = dbComDatabase
fcmbEttName.blnEntityMastListByName = True
fcmbEttName.Init

Call RestoreDefaultSmryPara
If mRemoteAccess = True Then
    optDetailed.Value = True
    AddSmryParaLayer mClear:=True
End If

If mRemoteAccess = True Then
    Rem datRecset.open "Select * from BloodInDtl" _
        & " left join EntityMast on BloodInDtl.BinEttCode = EntityMast.EttCode" _
        & " where BinCode = " & CStr(mBinCode) _
        & " order by BinDate,OpgTime" _
        , dbBdkDatabase, adOpenKeyset, adLockOptimistic
Else
    datRecset.open "Select * from BloodInDtl" _
        & " left join EntityMast on BloodInDtl.BinEttCode = EntityMast.EttCode" _
        & " order by BinDate" _
        , dbBdkDatabase, adOpenKeyset, adLockOptimistic
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
Set fcmbEttName = Nothing
Set fcmbAraName = Nothing
Set fcmbStnName = Nothing
Set fcmbVtmName = Nothing
Set fcmbBdgName = Nothing
Set fcmbBdcName = Nothing
Set fcmbBldName = Nothing
Set clsListStru = Nothing
Set frmTrn = Nothing

CloseTable datRecset
CloseDataSource dbAcDatabase
CloseDataSource dbBdkDatabase
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

Private Sub optEntityNameWise_GotFocus()
FlashActiveControl optEntityNamewise, True
End Sub

Private Sub optEntityNameWise_LostFocus()
FlashActiveControl optEntityNamewise, False
End Sub

Private Sub SmryList()
Dim gcolcount As Integer, acount As Integer, mLow As Integer, mHigh As Integer, mPos As Integer, srow As Long, mColCount As Integer
Dim aAcntBal As Variant, mBal As Double, mQryStr As String
Dim mCount_Tot As Double, mPckQty_Tot As Double, mBldQty_Tot As Double
Dim mOpnCount_Tot As Double, mOpnPckQty_Tot As Double, mOpnBldQty_Tot As Double
Dim mBinCount_Tot As Double, mBinPckQty_Tot As Double, mBinBldQty_Tot As Double
Dim mBouCount_Tot As Double, mBouPckQty_Tot As Double, mBouBldQty_Tot As Double
Dim mBalCount_Tot As Double, mBalPckQty_Tot As Double, mBalBldQty_Tot As Double

Me.MousePointer = vbHourglass
If datRecset.State = 1 Then
    CloseTable datRecset
End If
RefreshDatabase dbBdkDatabase
RefreshDatabase dbAcDatabase
RefreshDatabase dbGrpDatabase
RefreshDatabase dbComDatabase
clsListStru.Clear

If optMonthwise.Value = True Or optDatewise.Value = True Or optEntityNamewise.Value = True Or optBloodGrpwise.Value = True Or optBloodCompowise.Value = True Or optBloodwise.Value = True Then
    If optMonthwise.Value = True Then
        clsListStru.AddFields mExpr:="TrnYrMonth", mAttrib:=cFAT_SYSTEM
        clsListStru.AddFields mExpr:="TrnMnYear", mTitle:="Month", mShowItem:=True, mAlign:=1, mWidth:=2000
        clsListStru.AddFields mExpr:="TrnBinCount", mTitle:="In.Count", mShowItem:=False, mAlign:=7, mWidth:=1100
        clsListStru.AddFields mExpr:="TrnBinPckQty_sum", mTitle:="In.Pck/Bag", mShowItem:=True, mAlign:=7, mWidth:=1250
        clsListStru.AddFields mExpr:="TrnBinBldQty_sum", mTitle:="In.Bld.Qty", mShowItem:=True, mAlign:=7, mWidth:=1250
        clsListStru.AddFields mExpr:="TrnBouCount", mTitle:="Out.Count", mShowItem:=False, mAlign:=7, mWidth:=1100
        clsListStru.AddFields mExpr:="TrnBouPckQty_sum", mTitle:="Out.Pck/Bag", mShowItem:=True, mAlign:=7, mWidth:=1250
        clsListStru.AddFields mExpr:="TrnBouBldQty_sum", mTitle:="Out.Bld.Qty", mShowItem:=True, mAlign:=7, mWidth:=1250
        clsListStru.AddFields mExpr:="TrnBalCount", mTitle:="Bal.Count", mShowItem:=False, mAlign:=7, mWidth:=1100
        clsListStru.AddFields mExpr:="TrnBalPckQty_sum", mTitle:="Bal.Pck/Bag", mShowItem:=True, mAlign:=7, mWidth:=1250
        clsListStru.AddFields mExpr:="TrnBalBldQty_sum", mTitle:="Bal.Bld.Qty", mShowItem:=True, mAlign:=7, mWidth:=1250
        
        mQryStr = "Select format(TrnDate,'yyyy/MM') as TrnYrMonth" _
         & ",Count(TrnBinType) as TrnBinCount" _
         & ",Sum(TrnBinPckQty) as TrnBinPckQty_sum" _
         & ",Sum(TrnBinBldQty) as TrnBinBldQty_sum" _
         & ",Count(TrnBouType) as TrnBouCount" _
         & ",Sum(TrnBouPckQty) as TrnBouPckQty_sum" _
         & ",Sum(TrnBouBldQty) as TrnBouBldQty_sum" _
         & ",Count(TrnBalType) as TrnBalCount" _
         & ",Sum(TrnBalPckQty) as TrnBalPckQty_sum" _
         & ",Sum(TrnBalBldQty) as TrnBalBldQty_sum"
        mQryStr = mQryStr & " from ("
        Rem reserved query string producing no records
        mQryStr = mQryStr & "Select BinDate as TrnDate" _
         & ",'Bin' as TrnBinType,0 as TrnBinPckQty,0 as TrnBinBldQty" _
         & ",'Bou' as TrnBouType,0 as TrnBouPckQty,0 as TrnBouBldQty" _
         & ",'Bal' as TrnBalType,0 as TrnBalPckQty,0 as TrnBalBldQty" _
         & " from BloodInDtl" _
         & " inner join (BloodInHdr inner join VTypMast on BloodInHdr.BihVtmCode = VTypMast.VtmCode) on BloodInDtl.BinCode = BloodInHdr.BihCode" _
         & " where BinDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and BinDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and BinCode > 0 and True = False" _
         & IIf(mQryEttCode > 0, " and BinEttCode = " & CStr(mQryEttCode), "") _
         & IIf(mQryBdgCode > 0, " and BinBdgCode = " & CStr(mQryBdgCode), "") _
         & IIf(mQryBdcCode > 0, " and BinBdcCode = " & CStr(mQryBdcCode), "") _
         & IIf(mQryBldCode > 0, " and BinBldCode = " & CStr(mQryBldCode), "")
        Rem opening stock
        If chkFByOpnStock.Value = vbChecked Then
            Rem incoming stock
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select #" & CStr(ToSysDate(Ctod(dtpFromDate.Text) - 1)) & "# as TrnDate" _
             & ",'Bin' as TrnBinType,BinPckQty as TrnBinPckQty,BinBldQty as TrnBinBldQty" _
             & ",'Bou' as TrnBouType,0 as TrnBouPckQty,0 as TrnBouBldQty" _
             & ",'Bal' as TrnBalType,BinPckQty as TrnBalPckQty,BinBldQty as TrnBalBldQty" _
             & " from BloodInDtl" _
             & " inner join (BloodInHdr inner join VTypMast on BloodInHdr.BihVtmCode = VTypMast.VtmCode) on BloodInDtl.BinCode = BloodInHdr.BihCode" _
             & " where BinCode > 0 and VtmSysCode IN (" & CStr(cCOM_VTYPE_OPNSTK) & "," & CStr(cBDK_VTYPE_BLOODDONATE) & "," & CStr(cBDK_VTYPE_BLOODFILTER) & ")" _
             & " and BinDate < #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "#" _
             & IIf(mQryEttCode > 0, " and BinEttCode = " & CStr(mQryEttCode), "") _
             & IIf(mQryBdgCode > 0, " and BinBdgCode = " & CStr(mQryBdgCode), "") _
             & IIf(mQryBdcCode > 0, " and BinBdcCode = " & CStr(mQryBdcCode), "") _
             & IIf(mQryBldCode > 0, " and BinBldCode = " & CStr(mQryBldCode), "")
            Rem outgoing stock
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select #" & CStr(ToSysDate(Ctod(dtpFromDate.Text) - 1)) & "# as TrnDate" _
             & ",'Bin' as TrnBinType,0 as TrnBinPckQty,0 as TrnBinBldQty" _
             & ",'Bou' as TrnBouType,BouPckQty  as TrnBouPckQty,BouBldQty  as TrnBouBldQty" _
             & ",'Bal' as TrnBalType,BouPckQty * -1 as TrnBalPckQty,BouBldQty * -1 as TrnBalBldQty" _
             & " from BloodOutDtl" _
             & " inner join (BloodOutHdr inner join VTypMast on BloodOutHdr.BohVtmCode = VTypMast.VtmCode) on BloodOutDtl.BouCode = BloodOutHdr.BohCode" _
             & " where BouCode > 0 and VtmSysCode IN (" & CStr(cBDK_VTYPE_BLOODISSUED) & "," & CStr(cBDK_VTYPE_BLOODCONS) & ")" _
             & " and BouDate < #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "#" _
             & IIf(mQryEttCode > 0, " and BouEttCode = " & CStr(mQryEttCode), "") _
             & IIf(mQryBdgCode > 0, " and BouBdgCode = " & CStr(mQryBdgCode), "") _
             & IIf(mQryBdcCode > 0, " and BouBdcCode = " & CStr(mQryBdcCode), "") _
             & IIf(mQryBldCode > 0, " and BouBldCode = " & CStr(mQryBldCode), "")
             
        End If
        Rem purchase
        If chkFByBloodIn.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select BinDate as TrnDate" _
             & ",'Bin' as TrnBinType,BinPckQty as TrnBinPckQty,BinBldQty as TrnBinBldQty" _
             & ",'Bou' as TrnBouType,0 as TrnBouPckQty,0 as TrnBouBldQty" _
             & ",'Bal' as TrnBalType,BinPckQty as TrnBalPckQty,BinBldQty as TrnBalBldQty" _
             & " from BloodInDtl" _
             & " inner join (BloodInHdr inner join VTypMast on BloodInHdr.BihVtmCode = VTypMast.VtmCode) on BloodInDtl.BinCode = BloodInHdr.BihCode" _
             & " where BinDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and BinDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and BinCode > 0 and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODDONATE) _
             & IIf(mQryEttCode > 0, " and BinEttCode = " & CStr(mQryEttCode), "") _
             & IIf(mQryBdgCode > 0, " and BinBdgCode =" & CStr(mQryBdgCode), "") _
             & IIf(mQryBdcCode > 0, " and BinBdcCode =" & CStr(mQryBdcCode), "") _
             & IIf(mQryBldCode > 0, " and BinBldCode =" & CStr(mQryBldCode), "")
        End If
        Rem sales return
        If chkFByRetnInw.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select BinDate as TrnDate" _
             & ",'Bin' as TrnBinType,BinPckQty as TrnBinPckQty,BinBldQty as TrnBinBldQty" _
             & ",'Bou' as TrnBouType,0 as TrnBouPckQty,0 as TrnBouBldQty" _
             & ",'Bal' as TrnBalType,BinPckQty as TrnBalPckQty,BinBldQty as TrnBalBldQty" _
             & " from BloodInDtl" _
             & " inner join (BloodInHdr inner join VTypMast on BloodInHdr.BihVtmCode = VTypMast.VtmCode) on BloodInDtl.BinCode = BloodInHdr.BihCode" _
             & " where BinDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and BinDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and BinCode > 0 and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODFILTER) _
             & IIf(mQryEttCode > 0, " and BinEttCode = " & CStr(mQryEttCode), "") _
             & IIf(mQryBdgCode > 0, " and BinBdgCode =" & CStr(mQryBdgCode), "") _
             & IIf(mQryBdcCode > 0, " and BinBdcCode =" & CStr(mQryBdcCode), "") _
             & IIf(mQryBldCode > 0, " and BinBldCode =" & CStr(mQryBldCode), "")
        End If
        Rem sales ---------------------
        If chkFByBloodOut.Value = vbChecked = True Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select BouDate as TrnDate" _
             & ",'Bin' as TrnBinType,0 as TrnBinPckQty,0 as TrnBinBldQty" _
             & ",'Bou' as TrnBouType,BouPckQty as TrnBouPckQty,BouBldQty as TrnBouBldQty" _
             & ",'Bal' as TrnBalType,BouPckQty * -1 as TrnBalPckQty,BouBldQty * -1 as TrnBalBldQty" _
             & " from BloodOutDtl" _
             & " inner join (BloodOutHdr inner join VTypMast on BloodOutHdr.BohVtmCode = VTypMast.VtmCode) on BloodOutDtl.BouCode = BloodOutHdr.BohCode" _
             & " where BouDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and BouDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and BouCode > 0 and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODISSUED) _
             & IIf(mQryEttCode > 0, " and BouEttCode = " & CStr(mQryEttCode), "") _
             & IIf(mQryBdgCode > 0, " and BouBdgCode = " & CStr(mQryBdgCode), "") _
             & IIf(mQryBdcCode > 0, " and BouBdcCode = " & CStr(mQryBdcCode), "") _
             & IIf(mQryBldCode > 0, " and BouBldCode = " & CStr(mQryBldCode), "")
        End If
        Rem purchase return
        If chkFByRetnOutw.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select BouDate as TrnDate" _
             & ",'Bin' as TrnBinType,0 as TrnBinPckQty,0 as TrnBinBldQty" _
             & ",'Bou' as TrnBouType,BouPckQty as TrnBouPckQty,BouBldQty as TrnBouBldQty" _
             & ",'Bal' as TrnBalType,BouPckQty * -1 as TrnBalPckQty,BouBldQty * -1 as TrnBalBldQty" _
             & " from BloodOutDtl" _
             & " inner join (BloodOutHdr inner join VTypMast on BloodOutHdr.BohVtmCode = VTypMast.VtmCode) on BloodOutDtl.BouCode = BloodOutHdr.BohCode" _
             & " where BouDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and BouDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and BouCode > 0 and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODCONS) _
             & IIf(mQryEttCode > 0, " and BouEttCode = " & CStr(mQryEttCode), "") _
             & IIf(mQryBdgCode > 0, " and BouBdgCode = " & CStr(mQryBdgCode), "") _
             & IIf(mQryBdcCode > 0, " and BouBdcCode = " & CStr(mQryBdcCode), "") _
             & IIf(mQryBldCode > 0, " and BouBldCode = " & CStr(mQryBldCode), "")
        End If
        Rem ----------------------------------
        mQryStr = mQryStr & ")"
        mQryStr = mQryStr & " group by format(TrnDate,'yyyy/MM')" _
         & " order by format(TrnDate,'yyyy/MM')"
        
        datRecset.open mQryStr, dbComDatabase, adOpenKeyset, adLockReadOnly
        
    ElseIf optDatewise.Value = True Then
        clsListStru.AddFields mExpr:="TrnDateYMD", mAttrib:=cFAT_SYSTEM
        clsListStru.AddFields mExpr:="TrnDate", mTitle:="Date", mShowItem:=True, mAlign:=1, mWidth:=2000
        clsListStru.AddFields mExpr:="TrnBinCount", mTitle:="In.Count", mShowItem:=False, mAlign:=7, mWidth:=1100
        clsListStru.AddFields mExpr:="TrnBinPckQty_sum", mTitle:="In.Pck/Bag", mShowItem:=True, mAlign:=7, mWidth:=1250
        clsListStru.AddFields mExpr:="TrnBinBldQty_sum", mTitle:="In.Bld.Qty", mShowItem:=True, mAlign:=7, mWidth:=1250
        clsListStru.AddFields mExpr:="TrnBouCount", mTitle:="Out.Count", mShowItem:=False, mAlign:=7, mWidth:=1100
        clsListStru.AddFields mExpr:="TrnBouPckQty_sum", mTitle:="Out.Pck/Bag", mShowItem:=True, mAlign:=7, mWidth:=1250
        clsListStru.AddFields mExpr:="TrnBouBldQty_sum", mTitle:="Out.Bld.Qty", mShowItem:=True, mAlign:=7, mWidth:=1250
        clsListStru.AddFields mExpr:="TrnBalCount", mTitle:="Bal.Count", mShowItem:=False, mAlign:=7, mWidth:=1100
        clsListStru.AddFields mExpr:="TrnBalPckQty_sum", mTitle:="Bal.Pck/Bag", mShowItem:=True, mAlign:=7, mWidth:=1250
        clsListStru.AddFields mExpr:="TrnBalBldQty_sum", mTitle:="Bal.Bld.Qty", mShowItem:=True, mAlign:=7, mWidth:=1250
        
        mQryStr = "Select TrnDate" _
         & ",Count(TrnBinType) as TrnBinCount" _
         & ",Sum(TrnBinPckQty) as TrnBinPckQty_sum" _
         & ",Sum(TrnBinBldQty) as TrnBinBldQty_sum" _
         & ",Count(TrnBouType) as TrnBouCount" _
         & ",Sum(TrnBouPckQty) as TrnBouPckQty_sum" _
         & ",Sum(TrnBouBldQty) as TrnBouBldQty_sum" _
         & ",Count(TrnBalType) as TrnBalCount" _
         & ",Sum(TrnBalPckQty) as TrnBalPckQty_sum" _
         & ",Sum(TrnBalBldQty) as TrnBalBldQty_sum"
        mQryStr = mQryStr & " from ("
        Rem reserved query string producing no records
        mQryStr = mQryStr & "Select BinDate as TrnDate" _
         & ",'Bin' as TrnBinType,0 as TrnBinPckQty,0 as TrnBinBldQty" _
         & ",'Bou' as TrnBouType,0 as TrnBouPckQty,0 as TrnBouBldQty" _
         & ",'Bal' as TrnBalType,0 as TrnBalPckQty,0 as TrnBalBldQty" _
         & " from BloodInDtl" _
         & " inner join (BloodInHdr inner join VTypMast on BloodInHdr.BihVtmCode = VTypMast.VtmCode) on BloodInDtl.BinCode = BloodInHdr.BihCode" _
         & " where BinDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and BinDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and BinCode > 0 and True = False" _
         & IIf(mQryEttCode > 0, " and BinEttCode = " & CStr(mQryEttCode), "") _
         & IIf(mQryBdgCode > 0, " and BinBdgCode = " & CStr(mQryBdgCode), "") _
         & IIf(mQryBdcCode > 0, " and BinBdcCode = " & CStr(mQryBdcCode), "") _
         & IIf(mQryBldCode > 0, " and BinBldCode = " & CStr(mQryBldCode), "")
        Rem opening stock
        If chkFByOpnStock.Value = vbChecked Then
            Rem incoming stock
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & "Select #" & CStr(ToSysDate(Ctod(dtpFromDate.Text) - 1)) & "# as TrnDate" _
             & ",'Bin' as TrnBinType,BinPckQty as TrnBinPckQty,BinBldQty as TrnBinBldQty" _
             & ",'Bou' as TrnBouType,0 as TrnBouPckQty,0 as TrnBouBldQty" _
             & ",'Bal' as TrnBalType,BinPckQty as TrnBalPckQty,BinBldQty as TrnBalBldQty" _
             & " from BloodInDtl" _
             & " inner join (BloodInHdr inner join VTypMast on BloodInHdr.BihVtmCode = VTypMast.VtmCode) on BloodInDtl.BinCode = BloodInHdr.BihCode" _
             & " where BinCode > 0 and VtmSysCode IN (" & CStr(cCOM_VTYPE_OPNSTK) & "," & CStr(cBDK_VTYPE_BLOODDONATE) & "," & CStr(cBDK_VTYPE_BLOODFILTER) & ")" _
             & " and BinDate < #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "#" _
             & IIf(mQryEttCode > 0, " and BinEttCode = " & CStr(mQryEttCode), "") _
             & IIf(mQryBdgCode > 0, " and BinBdgCode = " & CStr(mQryBdgCode), "") _
             & IIf(mQryBdcCode > 0, " and BinBdcCode = " & CStr(mQryBdcCode), "") _
             & IIf(mQryBldCode > 0, " and BinBldCode = " & CStr(mQryBldCode), "")
            Rem outgoing stock
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & "Select #" & CStr(ToSysDate(Ctod(dtpFromDate.Text) - 1)) & "# as TrnDate" _
             & ",'Bin' as TrnBinType,0 as TrnBinPckQty,0 as TrnBinBldQty" _
             & ",'Bou' as TrnBouType,BouPckQty  as TrnBouPckQty,BouBldQty  as TrnBouBldQty" _
             & ",'Bal' as TrnBalType,BouPckQty * -1 as TrnBalPckQty,BouBldQty * -1 as TrnBalBldQty" _
             & " from BloodOutDtl" _
             & " inner join (BloodOutHdr inner join VTypMast on BloodOutHdr.BohVtmCode = VTypMast.VtmCode) on BloodOutDtl.BouCode = BloodOutHdr.BohCode" _
             & " where BouCode > 0 and VtmSysCode IN (" & CStr(cBDK_VTYPE_BLOODISSUED) & "," & CStr(cBDK_VTYPE_BLOODCONS) & ")" _
             & " and BouDate < #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "#" _
             & IIf(mQryEttCode > 0, " and BouEttCode = " & CStr(mQryEttCode), "") _
             & IIf(mQryBdgCode > 0, " and BouBdgCode = " & CStr(mQryBdgCode), "") _
             & IIf(mQryBdcCode > 0, " and BouBdcCode = " & CStr(mQryBdcCode), "") _
             & IIf(mQryBldCode > 0, " and BouBldCode = " & CStr(mQryBldCode), "")
             
        End If
        Rem purchase
        If chkFByBloodIn.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select BinDate as TrnDate" _
             & ",'Bin' as TrnBinType,BinPckQty as TrnBinPckQty,BinBldQty as TrnBinBldQty" _
             & ",'Bou' as TrnBouType,0 as TrnBouPckQty,0 as TrnBouBldQty" _
             & ",'Bal' as TrnBalType,BinPckQty as TrnBalPckQty,BinBldQty as TrnBalBldQty" _
             & " from BloodInDtl" _
             & " inner join (BloodInHdr inner join VTypMast on BloodInHdr.BihVtmCode = VTypMast.VtmCode) on BloodInDtl.BinCode = BloodInHdr.BihCode" _
             & " where BinDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and BinDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and BinCode > 0 and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODDONATE) _
             & IIf(mQryEttCode > 0, " and BinEttCode = " & CStr(mQryEttCode), "") _
             & IIf(mQryBdgCode > 0, " and BinBdgCode = " & CStr(mQryBdgCode), "") _
             & IIf(mQryBdcCode > 0, " and BinBdcCode = " & CStr(mQryBdcCode), "") _
             & IIf(mQryBldCode > 0, " and BinBldCode = " & CStr(mQryBldCode), "")
             
        End If
        Rem sales return
        If chkFByRetnInw.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select BinDate as TrnDate" _
             & ",'Bin' as TrnBinType,BinPckQty as TrnBinPckQty,BinBldQty as TrnBinBldQty" _
             & ",'Bou' as TrnBouType,0 as TrnBouPckQty,0 as TrnBouBldQty" _
             & ",'Bal' as TrnBalType,BinPckQty as TrnBalPckQty,BinBldQty as TrnBalBldQty" _
             & " from BloodInDtl" _
             & " inner join (BloodInHdr inner join VTypMast on BloodInHdr.BihVtmCode = VTypMast.VtmCode) on BloodInDtl.BinCode = BloodInHdr.BihCode" _
             & " where BinDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and BinDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and BinCode > 0 and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODFILTER) _
             & IIf(mQryEttCode > 0, " and BinEttCode = " & CStr(mQryEttCode), "") _
             & IIf(mQryBdgCode > 0, " and BinBdgCode = " & CStr(mQryBdgCode), "") _
             & IIf(mQryBdcCode > 0, " and BinBdcCode = " & CStr(mQryBdcCode), "") _
             & IIf(mQryBldCode > 0, " and BinBldCode = " & CStr(mQryBldCode), "")
             
        End If
        Rem sales ---------------------
        If chkFByBloodOut.Value = vbChecked = True Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select BouDate as TrnDate" _
             & ",'Bin' as TrnBinType,0 as TrnBinPckQty,0 as TrnBinBldQty" _
             & ",'Bou' as TrnBouType,BouPckQty as TrnBouPckQty,BouBldQty as TrnBouBldQty" _
             & ",'Bal' as TrnBalType,BouPckQty * -1 as TrnBalPckQty,BouBldQty * -1 as TrnBalBldQty" _
             & " from BloodOutDtl" _
             & " inner join (BloodOutHdr inner join VTypMast on BloodOutHdr.BohVtmCode = VTypMast.VtmCode) on BloodOutDtl.BouCode = BloodOutHdr.BohCode" _
             & " where BouDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and BouDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and BouCode > 0 and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODISSUED) _
             & IIf(mQryEttCode > 0, " and BouEttCode = " & CStr(mQryEttCode), "") _
             & IIf(mQryBdgCode > 0, " and BouBdgCode = " & CStr(mQryBdgCode), "") _
             & IIf(mQryBdcCode > 0, " and BouBdcCode = " & CStr(mQryBdcCode), "") _
             & IIf(mQryBldCode > 0, " and BouBldCode = " & CStr(mQryBldCode), "")
             
        End If
        Rem purchase return
        If chkFByRetnOutw.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select BouDate as TrnDate" _
             & ",'Bin' as TrnBinType,0 as TrnBinPckQty,0 as TrnBinBldQty" _
             & ",'Bou' as TrnBouType,BouPckQty as TrnBouPckQty,BouBldQty as TrnBouBldQty" _
             & ",'Bal' as TrnBalType,BouPckQty * -1 as TrnBalPckQty,BouBldQty * -1 as TrnBalBldQty" _
             & " from BloodOutDtl" _
             & " inner join (BloodOutHdr inner join VTypMast on BloodOutHdr.BohVtmCode = VTypMast.VtmCode) on BloodOutDtl.BouCode = BloodOutHdr.BohCode" _
             & " where BouDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and BouDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and BouCode > 0 and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODCONS) _
             & IIf(mQryEttCode > 0, " and BouEttCode = " & CStr(mQryEttCode), "") _
             & IIf(mQryBdgCode > 0, " and BouBdgCode = " & CStr(mQryBdgCode), "") _
             & IIf(mQryBdcCode > 0, " and BouBdcCode = " & CStr(mQryBdcCode), "") _
             & IIf(mQryBldCode > 0, " and BouBldCode = " & CStr(mQryBldCode), "")
             
        End If
        Rem ----------------------------------
        mQryStr = mQryStr & ")"
        mQryStr = mQryStr & " group by TrnDate" _
         & " order by TrnDate"
        
        datRecset.open mQryStr, dbComDatabase, adOpenKeyset, adLockReadOnly
        
    ElseIf optEntityNamewise.Value = True Then
        clsListStru.AddFields mExpr:="EttName", mTitle:="Patient Name", mShowItem:=True, mAlign:=1, mWidth:=3000
        clsListStru.AddFields mExpr:="TrnOpnCount", mTitle:="Opn.Count", mShowItem:=False, mAlign:=7, mWidth:=1100
        clsListStru.AddFields mExpr:="TrnOpnPckQty_sum", mTitle:="Opn.Pck/Bag", mShowItem:=True, mAlign:=7, mWidth:=1250
        clsListStru.AddFields mExpr:="TrnOpnBldQty_sum", mTitle:="Opn.Bld.Qty", mShowItem:=True, mAlign:=7, mWidth:=1250
        clsListStru.AddFields mExpr:="TrnBinCount", mTitle:="In.Count", mShowItem:=False, mAlign:=7, mWidth:=1100
        clsListStru.AddFields mExpr:="TrnBinPckQty_sum", mTitle:="In.Pck/Bag", mShowItem:=True, mAlign:=7, mWidth:=1250
        clsListStru.AddFields mExpr:="TrnBinBldQty_sum", mTitle:="In.Bld.Qty", mShowItem:=True, mAlign:=7, mWidth:=1250
        clsListStru.AddFields mExpr:="TrnBouCount", mTitle:="Out.Count", mShowItem:=False, mAlign:=7, mWidth:=1100
        clsListStru.AddFields mExpr:="TrnBouPckQty_sum", mTitle:="Out.Pck/Bag", mShowItem:=True, mAlign:=7, mWidth:=1250
        clsListStru.AddFields mExpr:="TrnBouBldQty_sum", mTitle:="Out.Bld.Qty", mShowItem:=True, mAlign:=7, mWidth:=1250
        clsListStru.AddFields mExpr:="TrnBalCount", mTitle:="Bal.Count", mShowItem:=False, mAlign:=7, mWidth:=1100
        clsListStru.AddFields mExpr:="TrnBalPckQty_sum", mTitle:="Bal.Pck/Bag", mShowItem:=True, mAlign:=7, mWidth:=1250
        clsListStru.AddFields mExpr:="TrnBalBldQty_sum", mTitle:="Bal.Bld.Qty", mShowItem:=True, mAlign:=7, mWidth:=1250
        
        mQryStr = "Select EntityMast.EttName,t1.TrnEttCode" _
         & ",Count(TrnOpnType) as TrnOpnCount" _
         & ",Sum(TrnOpnPckQty) as TrnOpnPckQty_sum" _
         & ",Sum(TrnOpnBldQty) as TrnOpnBldQty_sum" _
         & ",Count(TrnBinType) as TrnBinCount" _
         & ",Sum(TrnBinPckQty) as TrnBinPckQty_sum" _
         & ",Sum(TrnBinBldQty) as TrnBinBldQty_sum" _
         & ",Count(TrnBouType) as TrnBouCount" _
         & ",Sum(TrnBouPckQty) as TrnBouPckQty_sum" _
         & ",Sum(TrnBouBldQty) as TrnBouBldQty_sum" _
         & ",Count(TrnBalType) as TrnBalCount" _
         & ",Sum(TrnBalPckQty) as TrnBalPckQty_sum" _
         & ",Sum(TrnBalBldQty) as TrnBalBldQty_sum"
        mQryStr = mQryStr & " from ("
        Rem reserved query string producing no records
        mQryStr = mQryStr & "Select BinEttCode as TrnEttCode" _
         & ",'Opn' as TrnOpnType,0 as TrnOpnPckQty,0 as TrnOpnBldQty" _
         & ",'Bin' as TrnBinType,0 as TrnBinPckQty,0 as TrnBinBldQty" _
         & ",'Bou' as TrnBouType,0 as TrnBouPckQty,0 as TrnBouBldQty" _
         & ",'Bal' as TrnBalType,0 as TrnBalPckQty,0 as TrnBalBldQty" _
         & " from BloodInDtl" _
         & " inner join (BloodInHdr inner join VTypMast on BloodInHdr.BihVtmCode = VTypMast.VtmCode) on BloodInDtl.BinCode = BloodInHdr.BihCode" _
         & " where BinDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and BinDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and BinCode > 0 and True = False" _
         & IIf(mQryEttCode > 0, " and BinEttCode = " & CStr(mQryEttCode), "") _
         & IIf(mQryBdgCode > 0, " and BinBdgCode = " & CStr(mQryBdgCode), "") _
         & IIf(mQryBdcCode > 0, " and BinBdcCode = " & CStr(mQryBdcCode), "") _
         & IIf(mQryBldCode > 0, " and BinBldCode = " & CStr(mQryBldCode), "")
         
        Rem opening stock
        If chkFByOpnStock.Value = vbChecked Then
            Rem incoming stock
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select BinEttCode as TrnEttCode" _
             & ",'Opn' as TrnOpnType,BinPckQty as TrnOpnPckQty,BinBldQty as TrnOpnBldQty" _
             & ",'Bin' as TrnBinType,0 as TrnBinPckQty,0 as TrnBinBldQty" _
             & ",'Bou' as TrnBouType,0 as TrnBouPckQty,0 as TrnBouBldQty" _
             & ",'Bal' as TrnBalType,BinPckQty as TrnBalPckQty,BinBldQty as TrnBalBldQty" _
             & " from BloodInDtl" _
             & " inner join (BloodInHdr inner join VTypMast on BloodInHdr.BihVtmCode = VTypMast.VtmCode) on BloodInDtl.BinCode = BloodInHdr.BihCode" _
             & " where BinCode > 0 and VtmSysCode IN (" & CStr(cCOM_VTYPE_OPNSTK) & "," & CStr(cBDK_VTYPE_BLOODDONATE) & "," & CStr(cBDK_VTYPE_BLOODFILTER) & ")" _
             & " and BinDate < #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "#" _
             & IIf(mQryEttCode > 0, " and BinEttCode = " & CStr(mQryEttCode), "") _
             & IIf(mQryBdgCode > 0, " and BinBdgCode = " & CStr(mQryBdgCode), "") _
             & IIf(mQryBdcCode > 0, " and BinBdcCode = " & CStr(mQryBdcCode), "") _
             & IIf(mQryBldCode > 0, " and BinBldCode = " & CStr(mQryBldCode), "")
             
            Rem outgoing stock
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select BouEttCode as TrnEttCode" _
             & ",'Opn' as TrnOpnType,BouPckQty * -1 as TrnOpnPckQty,BouBldQty * -1 as TrnOpnBldQty" _
             & ",'Bin' as TrnBinType,0 as TrnBinPckQty,0 as TrnBinBldQty" _
             & ",'Bou' as TrnBouType,0 as TrnBouPckQty,0 as TrnBouBldQty" _
             & ",'Bal' as TrnBalType,BouPckQty * -1 as TrnBalPckQty,BouBldQty * -1 as TrnBalBldQty" _
             & " from BloodOutDtl" _
             & " inner join (BloodOutHdr inner join VTypMast on BloodOutHdr.BohVtmCode = VTypMast.VtmCode) on BloodOutDtl.BouCode = BloodOutHdr.BohCode" _
             & " where BouCode > 0 and VtmSysCode IN (" & CStr(cBDK_VTYPE_BLOODISSUED) & "," & CStr(cBDK_VTYPE_BLOODCONS) & ")" _
             & " and BouDate < #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "#" _
             & IIf(mQryEttCode > 0, " and BouEttCode = " & CStr(mQryEttCode), "") _
             & IIf(mQryBdgCode > 0, " and BouBdgCode = " & CStr(mQryBdgCode), "") _
             & IIf(mQryBdcCode > 0, " and BouBdcCode = " & CStr(mQryBdcCode), "") _
             & IIf(mQryBldCode > 0, " and BouBldCode = " & CStr(mQryBldCode), "")
            
        End If
        Rem purchase
        If chkFByBloodIn.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select BinEttCode as TrnEttCode" _
             & ",'Opn' as TrnOpnType,0 as TrnOpnPckQty,0 as TrnOpnBldQty" _
             & ",'Bin' as TrnBinType,BinPckQty as TrnBinPckQty,BinBldQty as TrnBinBldQty" _
             & ",'Bou' as TrnBouType,0 as TrnBouPckQty,0 as TrnBouBldQty" _
             & ",'Bal' as TrnBalType,BinPckQty as TrnBalPckQty,BinBldQty as TrnBalBldQty" _
             & " from BloodInDtl" _
             & " inner join (BloodInHdr inner join VTypMast on BloodInHdr.BihVtmCode = VTypMast.VtmCode) on BloodInDtl.BinCode = BloodInHdr.BihCode" _
             & " where BinDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and BinDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and BinCode > 0 and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODDONATE) _
             & IIf(mQryEttCode > 0, " and BinEttCode = " & CStr(mQryEttCode), "") _
             & IIf(mQryBdgCode > 0, " and BinBdgCode = " & CStr(mQryBdgCode), "") _
             & IIf(mQryBdcCode > 0, " and BinBdcCode = " & CStr(mQryBdcCode), "") _
             & IIf(mQryBldCode > 0, " and BinBldCode = " & CStr(mQryBldCode), "")
             
        End If
        Rem sales return
        If chkFByRetnInw.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select BinEttCode as TrnEttCode" _
             & ",'Opn' as TrnOpnType,0 as TrnOpnPckQty,0 as TrnOpnBldQty" _
             & ",'Bin' as TrnBinType,BinPckQty as TrnBinPckQty,BinBldQty as TrnBinBldQty" _
             & ",'Bou' as TrnBouType,0 as TrnBouPckQty,0 as TrnBouBldQty" _
             & ",'Bal' as TrnBalType,BinPckQty as TrnBalPckQty,BinBldQty as TrnBalBldQty" _
             & " from BloodInDtl" _
             & " inner join (BloodInHdr inner join VTypMast on BloodInHdr.BihVtmCode = VTypMast.VtmCode) on BloodInDtl.BinCode = BloodInHdr.BihCode" _
             & " where BinDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and BinDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and BinCode > 0 and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODFILTER) _
             & IIf(mQryEttCode > 0, " and BinEttCode = " & CStr(mQryEttCode), "") _
             & IIf(mQryBdgCode > 0, " and BinBdgCode = " & CStr(mQryBdgCode), "") _
             & IIf(mQryBdcCode > 0, " and BinBdcCode = " & CStr(mQryBdcCode), "") _
             & IIf(mQryBldCode > 0, " and BinBldCode = " & CStr(mQryBldCode), "")
             
        End If
        Rem sales ---------------------
        If chkFByBloodOut.Value = vbChecked = True Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select BouEttCode as TrnEttCode" _
             & ",'Opn' as TrnOpnType,0 as TrnOpnPckQty,0 as TrnOpnBldQty" _
             & ",'Bin' as TrnBinType,0 as TrnBinPckQty,0 as TrnBinBldQty" _
             & ",'Bou' as TrnBouType,BouPckQty as TrnBouPckQty,BouBldQty as TrnBouBldQty" _
             & ",'Bal' as TrnBalType,BouPckQty * -1 as TrnBalPckQty,BouBldQty * -1 as TrnBalBldQty" _
             & " from BloodOutDtl" _
             & " inner join (BloodOutHdr inner join VTypMast on BloodOutHdr.BohVtmCode = VTypMast.VtmCode) on BloodOutDtl.BouCode = BloodOutHdr.BohCode" _
             & " where BouDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and BouDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and BouCode > 0 and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODISSUED) _
             & IIf(mQryEttCode > 0, " and BouEttCode = " & CStr(mQryEttCode), "") _
             & IIf(mQryBdgCode > 0, " and BouBdgCode = " & CStr(mQryBdgCode), "") _
             & IIf(mQryBdcCode > 0, " and BouBdcCode = " & CStr(mQryBdcCode), "") _
             & IIf(mQryBldCode > 0, " and BouBldCode = " & CStr(mQryBldCode), "")
             
        End If
        Rem purchase return
        If chkFByRetnOutw.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select BouEttCode as TrnEttCode" _
             & ",'Opn' as TrnOpnType,0 as TrnOpnPckQty,0 as TrnOpnBldQty" _
             & ",'Bin' as TrnBinType,0 as TrnBinPckQty,0 as TrnBinBldQty" _
             & ",'Bou' as TrnBouType,BouPckQty as TrnBouPckQty,BouBldQty as TrnBouBldQty" _
             & ",'Bal' as TrnBalType,BouPckQty * -1 as TrnBalPckQty,BouBldQty * -1 as TrnBalBldQty" _
             & " from BloodOutDtl" _
             & " inner join (BloodOutHdr inner join VTypMast on BloodOutHdr.BohVtmCode = VTypMast.VtmCode) on BloodOutDtl.BouCode = BloodOutHdr.BohCode" _
             & " where BouDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and BouDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and BouCode > 0 and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODCONS) _
             & IIf(mQryEttCode > 0, " and BouEttCode = " & CStr(mQryEttCode), "") _
             & IIf(mQryBdgCode > 0, " and BouBdgCode = " & CStr(mQryBdgCode), "") _
             & IIf(mQryBdcCode > 0, " and BouBdcCode = " & CStr(mQryBdcCode), "") _
             & IIf(mQryBldCode > 0, " and BouBldCode = " & CStr(mQryBldCode), "")
             
        End If
        Rem ----------------------------------
        mQryStr = mQryStr & ")"
        mQryStr = mQryStr & " as t1 inner join EntityMast on t1.TrnEttCode=EntityMast.EttCode" _
         & " group by EntityMast.EttName,t1.TrnEttCode" _
         & " order by EntityMast.EttName,t1.TrnEttCode"
        
        datRecset.open mQryStr, dbComDatabase, adOpenKeyset, adLockReadOnly
        
    ElseIf optBloodGrpwise.Value = True Then
        clsListStru.AddFields mExpr:="TrnBdgName", mTitle:="Blood Group", mShowItem:=True, mAlign:=1, mWidth:=2500
        clsListStru.AddFields mExpr:="TrnOpnCount", mTitle:="Opn.Count", mShowItem:=False, mAlign:=7, mWidth:=1100
        clsListStru.AddFields mExpr:="TrnOpnPckQty_sum", mTitle:="Opn.Pck/Bag", mShowItem:=True, mAlign:=7, mWidth:=1250
        clsListStru.AddFields mExpr:="TrnOpnBldQty_sum", mTitle:="Opn.Bld.Qty", mShowItem:=True, mAlign:=7, mWidth:=1250
        clsListStru.AddFields mExpr:="TrnBinCount", mTitle:="In.Count", mShowItem:=False, mAlign:=7, mWidth:=1100
        clsListStru.AddFields mExpr:="TrnBinPckQty_sum", mTitle:="In.Pck/Bag", mShowItem:=True, mAlign:=7, mWidth:=1250
        clsListStru.AddFields mExpr:="TrnBinBldQty_sum", mTitle:="In.Bld.Qty", mShowItem:=True, mAlign:=7, mWidth:=1250
        clsListStru.AddFields mExpr:="TrnBouCount", mTitle:="Out.Count", mShowItem:=False, mAlign:=7, mWidth:=1100
        clsListStru.AddFields mExpr:="TrnBouPckQty_sum", mTitle:="Out.Pck/Bag", mShowItem:=True, mAlign:=7, mWidth:=1250
        clsListStru.AddFields mExpr:="TrnBouBldQty_sum", mTitle:="Out.Bld.Qty", mShowItem:=True, mAlign:=7, mWidth:=1250
        clsListStru.AddFields mExpr:="TrnBalCount", mTitle:="Bal.Count", mShowItem:=False, mAlign:=7, mWidth:=1100
        clsListStru.AddFields mExpr:="TrnBalPckQty_sum", mTitle:="Bal.Pck/Bag", mShowItem:=True, mAlign:=7, mWidth:=1250
        clsListStru.AddFields mExpr:="TrnBalBldQty_sum", mTitle:="Bal.Bld.Qty", mShowItem:=True, mAlign:=7, mWidth:=1250
        
        mQryStr = "Select " _
         & " t1.TrnBdgName,t1.TrnBdgCode" _
         & ",Count(t1.TrnOpnType) as TrnOpnCount" _
         & ",Sum(t1.TrnOpnPckQty) as TrnOpnPckQty_sum" _
         & ",Sum(t1.TrnOpnBldQty) as TrnOpnBldQty_sum" _
         & ",Count(t1.TrnBinType) as TrnBinCount" _
         & ",Sum(t1.TrnBinPckQty) as TrnBinPckQty_sum" _
         & ",Sum(t1.TrnBinBldQty) as TrnBinBldQty_sum" _
         & ",Count(t1.TrnBouType) as TrnBouCount" _
         & ",Sum(t1.TrnBouPckQty) as TrnBouPckQty_sum" _
         & ",Sum(t1.TrnBouBldQty) as TrnBouBldQty_sum" _
         & ",Count(t1.TrnBalType) as TrnBalCount" _
         & ",Sum(t1.TrnBalPckQty) as TrnBalPckQty_sum" _
         & ",Sum(t1.TrnBalBldQty) as TrnBalBldQty_sum"
        mQryStr = mQryStr & " from ("
        Rem reserved query string producing no records
        mQryStr = mQryStr & "Select 0 as TrnBdgCode,'' as TrnBdgName" _
         & ",'' as TrnOpnType,0 as TrnOpnPckQty,0 as TrnOpnBldQty" _
         & ",'' as TrnBinType,0 as TrnBinPckQty,0 as TrnBinBldQty" _
         & ",'' as TrnBouType,0 as TrnBouPckQty,0 as TrnBouBldQty" _
         & ",'' as TrnBalType,0 as TrnBalPckQty,0 as TrnBalBldQty" _
         & " from (BloodInDtl" _
         & " inner join (BloodInHdr inner join VTypMast on BloodInHdr.BihVtmCode = VTypMast.VtmCode) on BloodInDtl.BinCode = BloodInHdr.BihCode)" _
         & " inner join BloodGrpMst on BloodInDtl.BinBdgCode=BloodGrpMst.BdgCode" _
         & " where BinDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and BinDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and BinCode > 0 and True = False" _
         & IIf(mQryEttCode > 0, " and BinEttCode = " & CStr(mQryEttCode), "") _
         & IIf(mQryBdgCode > 0, " and BinBdgCode = " & CStr(mQryBdgCode), "") _
         & IIf(mQryBdcCode > 0, " and BinBdcCode = " & CStr(mQryBdcCode), "") _
         & IIf(mQryBldCode > 0, " and BinBldCode = " & CStr(mQryBldCode), "")
         
        Rem opening stock
        If chkFByOpnStock.Value = vbChecked Then
            Rem incoming stock
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select BinBdgCode as TrnBdgCode,BloodGrpMst.BdgName as TrnBdgName" _
             & ",'Opn' as TrnOpnType,BinPckQty as TrnOpnPckQty,BinBldQty as TrnOpnBldQty" _
             & ",'' as TrnBinType,0 as TrnBinPckQty,0 as TrnBinBldQty" _
             & ",'' as TrnBouType,0 as TrnBouPckQty,0 as TrnBouBldQty" _
             & ",'Bal' as TrnBalType,BinPckQty as TrnBalPckQty,BinBldQty as TrnBalBldQty" _
             & " from (BloodInDtl" _
             & " inner join (BloodInHdr inner join VTypMast on BloodInHdr.BihVtmCode = VTypMast.VtmCode) on BloodInDtl.BinCode = BloodInHdr.BihCode)" _
             & " inner join BloodGrpMst on BloodInDtl.BinBdgCode=BloodGrpMst.BdgCode" _
             & " where BinCode > 0 and VtmSysCode IN (" & CStr(cCOM_VTYPE_OPNSTK) & "," & CStr(cBDK_VTYPE_BLOODDONATE) & "," & CStr(cBDK_VTYPE_BLOODFILTER) & ")" _
             & " and BinDate < #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "#" _
             & IIf(mQryEttCode > 0, " and BinEttCode = " & CStr(mQryEttCode), "") _
             & IIf(mQryBdgCode > 0, " and BinBdgCode = " & CStr(mQryBdgCode), "") _
             & IIf(mQryBdcCode > 0, " and BinBdcCode = " & CStr(mQryBdcCode), "") _
             & IIf(mQryBldCode > 0, " and BinBldCode = " & CStr(mQryBldCode), "")
             
            Rem outgoing stock
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select BouBdgCode as TrnBdgCode,BloodGrpMst.BdgName as TrnBdgName" _
             & ",'Opn' as TrnOpnType,BouPckQty * -1 as TrnOpnPckQty,BouBldQty * -1 as TrnOpnBldQty" _
             & ",'' as TrnBinType,0 as TrnBinPckQty,0 as TrnBinBldQty" _
             & ",'' as TrnBouType,0 as TrnBouPckQty,0 as TrnBouBldQty" _
             & ",'Bal' as TrnBalType,BouPckQty * -1 as TrnBalPckQty,BouBldQty * -1 as TrnBalBldQty" _
             & " from (BloodOutDtl" _
             & " inner join (BloodOutHdr inner join VTypMast on BloodOutHdr.BohVtmCode = VTypMast.VtmCode) on BloodOutDtl.BouCode = BloodOutHdr.BohCode)" _
             & " inner join BloodGrpMst on BloodOutDtl.BouBdgCode=BloodGrpMst.BdgCode" _
             & " where BouCode > 0 and VtmSysCode IN (" & CStr(cBDK_VTYPE_BLOODISSUED) & "," & CStr(cBDK_VTYPE_BLOODCONS) & ")" _
             & " and BouDate < #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "#" _
             & IIf(mQryEttCode > 0, " and BouEttCode = " & CStr(mQryEttCode), "") _
             & IIf(mQryBdgCode > 0, " and BouBdgCode = " & CStr(mQryBdgCode), "") _
             & IIf(mQryBdcCode > 0, " and BouBdcCode = " & CStr(mQryBdcCode), "") _
             & IIf(mQryBldCode > 0, " and BouBldCode = " & CStr(mQryBldCode), "")
             
        End If
        Rem purchase
        If chkFByBloodIn.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select BinBdgCode as TrnBdgCode,BloodGrpMst.BdgName as TrnBdgName" _
             & ",'' as TrnOpnType,0 as TrnOpnPckQty,0 as TrnOpnBldQty" _
             & ",'Bin' as TrnBinType,BinPckQty as TrnBinPckQty,BinBldQty as TrnBinBldQty" _
             & ",'' as TrnBouType,0 as TrnBouPckQty,0 as TrnBouBldQty" _
             & ",'Bal' as TrnBalType,BinPckQty as TrnBalPckQty,BinBldQty as TrnBalBldQty" _
             & " from (BloodInDtl" _
             & " inner join (BloodInHdr inner join VTypMast on BloodInHdr.BihVtmCode = VTypMast.VtmCode) on BloodInDtl.BinCode = BloodInHdr.BihCode)" _
             & " inner join BloodGrpMst on BloodInDtl.BinBdgCode=BloodGrpMst.BdgCode" _
             & " where BinDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and BinDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and BinCode > 0 and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODDONATE) _
             & IIf(mQryEttCode > 0, " and BinEttCode = " & CStr(mQryEttCode), "") _
             & IIf(mQryBdgCode > 0, " and BinBdgCode = " & CStr(mQryBdgCode), "") _
             & IIf(mQryBdcCode > 0, " and BinBdcCode = " & CStr(mQryBdcCode), "") _
             & IIf(mQryBldCode > 0, " and BinBldCode = " & CStr(mQryBldCode), "")
             
        End If
        Rem sales return
        If chkFByRetnInw.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select BinBdgCode as TrnBdgCode,BloodGrpMst.BdgName as TrnBdgName" _
             & ",'' as TrnOpnType,0 as TrnOpnPckQty,0 as TrnOpnBldQty" _
             & ",'Bin' as TrnBinType,BinPckQty as TrnBinPckQty,BinBldQty as TrnBinBldQty" _
             & ",'' as TrnBouType,0 as TrnBouPckQty,0 as TrnBouBldQty" _
             & ",'Bal' as TrnBalType,BinPckQty as TrnBalPckQty,BinBldQty as TrnBalBldQty" _
             & " from (BloodInDtl" _
             & " inner join (BloodInHdr inner join VTypMast on BloodInHdr.BihVtmCode = VTypMast.VtmCode) on BloodInDtl.BinCode = BloodInHdr.BihCode)" _
             & " inner join BloodGrpMst on BloodInDtl.BinBdgCode = BloodGrpMst.BdgCode" _
             & " where BinDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and BinDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and BinCode > 0 and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODFILTER) _
             & IIf(mQryEttCode > 0, " and BinEttCode = " & CStr(mQryEttCode), "") _
             & IIf(mQryBdgCode > 0, " and BinBdgCode = " & CStr(mQryBdgCode), "") _
             & IIf(mQryBdcCode > 0, " and BinBdcCode = " & CStr(mQryBdcCode), "") _
             & IIf(mQryBldCode > 0, " and BinBldCode = " & CStr(mQryBldCode), "")
             
        End If
        Rem sales ---------------------
        If chkFByBloodOut.Value = vbChecked = True Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select BouBdgCode as TrnBdgCode,BloodGrpMst.BdgName as TrnBdgName" _
             & ",'' as TrnOpnType,0 as TrnOpnPckQty,0 as TrnOpnBldQty" _
             & ",'' as TrnBinType,0 as TrnBinPckQty,0 as TrnBinBldQty" _
             & ",'Bou' as TrnBouType,BouPckQty as TrnBouPckQty,BouBldQty as TrnBouBldQty" _
             & ",'Bal' as TrnBalType,BouPckQty * -1 as TrnBalPckQty,BouBldQty * -1 as TrnBalBldQty" _
             & " from (BloodOutDtl" _
             & " inner join (BloodOutHdr inner join VTypMast on BloodOutHdr.BohVtmCode = VTypMast.VtmCode) on BloodOutDtl.BouCode = BloodOutHdr.BohCode)" _
             & " inner join BloodGrpMst on BloodOutDtl.BouBdgCode = BloodGrpMst.BdgCode" _
             & " where BouDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and BouDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and BouCode > 0 and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODISSUED) _
             & IIf(mQryEttCode > 0, " and BouEttCode = " & CStr(mQryEttCode), "") _
             & IIf(mQryBdgCode > 0, " and BouBdgCode = " & CStr(mQryBdgCode), "") _
             & IIf(mQryBdcCode > 0, " and BouBdcCode = " & CStr(mQryBdcCode), "") _
             & IIf(mQryBldCode > 0, " and BouBldCode = " & CStr(mQryBldCode), "")
             
        End If
        Rem purchase return
        If chkFByRetnOutw.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select BouBdgCode as TrnBdgCode,BloodGrpMst.BdgName as TrnBdgName" _
             & ",'' as TrnOpnType,0 as TrnOpnPckQty,0 as TrnOpnBldQty" _
             & ",'' as TrnBinType,0 as TrnBinPckQty,0 as TrnBinBldQty" _
             & ",'Bou' as TrnBouType,BouPckQty as TrnBouPckQty,BouBldQty as TrnBouBldQty" _
             & ",'Bal' as TrnBalType,BouPckQty * -1 as TrnBalPckQty,BouBldQty * -1 as TrnBalBldQty" _
             & " from (BloodOutDtl" _
             & " inner join (BloodOutHdr inner join VTypMast on BloodOutHdr.BohVtmCode = VTypMast.VtmCode) on BloodOutDtl.BouCode = BloodOutHdr.BohCode)" _
             & " inner join BloodGrpMst on BloodOutDtl.BouBdgCode=BloodGrpMst.BdgCode" _
             & " where BouDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and BouDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and BouCode > 0 and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODCONS) _
             & IIf(mQryEttCode > 0, " and BouEttCode = " & CStr(mQryEttCode), "") _
             & IIf(mQryBdgCode > 0, " and BouBdgCode = " & CStr(mQryBdgCode), "") _
             & IIf(mQryBdcCode > 0, " and BouBdcCode = " & CStr(mQryBdcCode), "") _
             & IIf(mQryBldCode > 0, " and BouBldCode = " & CStr(mQryBldCode), "")
             
        End If
        Rem ----------------------------------
        mQryStr = mQryStr & ")"
        mQryStr = mQryStr & " as t1 group by t1.TrnBdgName,t1.TrnBdgCode" _
         & " order by t1.TrnBdgName,t1.TrnBdgCode"
        
        datRecset.open mQryStr, dbComDatabase, adOpenKeyset, adLockReadOnly
    
    ElseIf optBloodCompowise.Value = True Then
        clsListStru.AddFields mExpr:="TrnBdcName", mTitle:="Blood Component", mShowItem:=True, mAlign:=1, mWidth:=2500
        clsListStru.AddFields mExpr:="TrnOpnCount", mTitle:="Opn.Count", mShowItem:=False, mAlign:=7, mWidth:=1100
        clsListStru.AddFields mExpr:="TrnOpnPckQty_sum", mTitle:="Opn.Pck/Bag", mShowItem:=True, mAlign:=7, mWidth:=1250
        clsListStru.AddFields mExpr:="TrnOpnBldQty_sum", mTitle:="Opn.Bld.Qty", mShowItem:=True, mAlign:=7, mWidth:=1250
        clsListStru.AddFields mExpr:="TrnBinCount", mTitle:="In.Count", mShowItem:=False, mAlign:=7, mWidth:=1100
        clsListStru.AddFields mExpr:="TrnBinPckQty_sum", mTitle:="In.Pck/Bag", mShowItem:=True, mAlign:=7, mWidth:=1250
        clsListStru.AddFields mExpr:="TrnBinBldQty_sum", mTitle:="In.Bld.Qty", mShowItem:=True, mAlign:=7, mWidth:=1250
        clsListStru.AddFields mExpr:="TrnBouCount", mTitle:="Out.Count", mShowItem:=False, mAlign:=7, mWidth:=1100
        clsListStru.AddFields mExpr:="TrnBouPckQty_sum", mTitle:="Out.Pck/Bag", mShowItem:=True, mAlign:=7, mWidth:=1250
        clsListStru.AddFields mExpr:="TrnBouBldQty_sum", mTitle:="Out.Bld.Qty", mShowItem:=True, mAlign:=7, mWidth:=1250
        clsListStru.AddFields mExpr:="TrnBalCount", mTitle:="Bal.Count", mShowItem:=False, mAlign:=7, mWidth:=1100
        clsListStru.AddFields mExpr:="TrnBalPckQty_sum", mTitle:="Bal.Pck/Bag", mShowItem:=True, mAlign:=7, mWidth:=1250
        clsListStru.AddFields mExpr:="TrnBalBldQty_sum", mTitle:="Bal.Bld.Qty", mShowItem:=True, mAlign:=7, mWidth:=1250
        
        mQryStr = "Select " _
         & " t1.TrnBdcName,t1.TrnBdcCode" _
         & ",Count(t1.TrnOpnType) as TrnOpnCount" _
         & ",Sum(t1.TrnOpnPckQty) as TrnOpnPckQty_sum" _
         & ",Sum(t1.TrnOpnBldQty) as TrnOpnBldQty_sum" _
         & ",Count(t1.TrnBinType) as TrnBinCount" _
         & ",Sum(t1.TrnBinPckQty) as TrnBinPckQty_sum" _
         & ",Sum(t1.TrnBinBldQty) as TrnBinBldQty_sum" _
         & ",Count(t1.TrnBouType) as TrnBouCount" _
         & ",Sum(t1.TrnBouPckQty) as TrnBouPckQty_sum" _
         & ",Sum(t1.TrnBouBldQty) as TrnBouBldQty_sum" _
         & ",Count(t1.TrnBalType) as TrnBalCount" _
         & ",Sum(t1.TrnBalPckQty) as TrnBalPckQty_sum" _
         & ",Sum(t1.TrnBalBldQty) as TrnBalBldQty_sum"
        mQryStr = mQryStr & " from ("
        Rem reserved query string producing no records
        mQryStr = mQryStr & "Select 0 as TrnBdcCode,'' as TrnBdcName" _
         & ",'' as TrnOpnType,0 as TrnOpnPckQty,0 as TrnOpnBldQty" _
         & ",'' as TrnBinType,0 as TrnBinPckQty,0 as TrnBinBldQty" _
         & ",'' as TrnBouType,0 as TrnBouPckQty,0 as TrnBouBldQty" _
         & ",'' as TrnBalType,0 as TrnBalPckQty,0 as TrnBalBldQty" _
         & " from (BloodInDtl" _
         & " inner join (BloodInHdr inner join VTypMast on BloodInHdr.BihVtmCode = VTypMast.VtmCode) on BloodInDtl.BinCode = BloodInHdr.BihCode)" _
         & " inner join BloodCompoMst on BloodInDtl.BinBdcCode=BloodCompoMst.BdcCode" _
         & " where BinDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and BinDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and BinCode > 0 and True = False" _
         & IIf(mQryEttCode > 0, " and BinEttCode = " & CStr(mQryEttCode), "") _
         & IIf(mQryBdgCode > 0, " and BinBdgCode = " & CStr(mQryBdgCode), "") _
         & IIf(mQryBdcCode > 0, " and BinBdcCode = " & CStr(mQryBdcCode), "") _
         & IIf(mQryBldCode > 0, " and BinBldCode = " & CStr(mQryBldCode), "")
         
        Rem opening stock
        If chkFByOpnStock.Value = vbChecked Then
            Rem incoming stock
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select BinBdcCode as TrnBdcCode,BloodCompoMst.BdcName as TrnBdcName" _
             & ",'Opn' as TrnOpnType,BinPckQty as TrnOpnPckQty,BinBldQty as TrnOpnBldQty" _
             & ",'' as TrnBinType,0 as TrnBinPckQty,0 as TrnBinBldQty" _
             & ",'' as TrnBouType,0 as TrnBouPckQty,0 as TrnBouBldQty" _
             & ",'Bal' as TrnBalType,BinPckQty as TrnBalPckQty,BinBldQty as TrnBalBldQty" _
             & " from (BloodInDtl" _
             & " inner join (BloodInHdr inner join VTypMast on BloodInHdr.BihVtmCode = VTypMast.VtmCode) on BloodInDtl.BinCode = BloodInHdr.BihCode)" _
             & " inner join BloodCompoMst on BloodInDtl.BinBdcCode=BloodCompoMst.BdcCode" _
             & " where BinCode > 0 and VtmSysCode IN (" & CStr(cCOM_VTYPE_OPNSTK) & "," & CStr(cBDK_VTYPE_BLOODDONATE) & "," & CStr(cBDK_VTYPE_BLOODFILTER) & ")" _
             & " and BinDate < #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "#" _
             & IIf(mQryEttCode > 0, " and BinEttCode = " & CStr(mQryEttCode), "") _
             & IIf(mQryBdgCode > 0, " and BinBdgCode = " & CStr(mQryBdgCode), "") _
             & IIf(mQryBdcCode > 0, " and BinBdcCode = " & CStr(mQryBdcCode), "") _
             & IIf(mQryBldCode > 0, " and BinBldCode = " & CStr(mQryBldCode), "")
             
            Rem outgoing stock
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select BouBdcCode as TrnBdcCode,BloodCompoMst.BdcName as TrnBdcName" _
             & ",'Opn' as TrnOpnType,BouPckQty * -1 as TrnOpnPckQty,BouBldQty * -1 as TrnOpnBldQty" _
             & ",'' as TrnBinType,0 as TrnBinPckQty,0 as TrnBinBldQty" _
             & ",'' as TrnBouType,0 as TrnBouPckQty,0 as TrnBouBldQty" _
             & ",'Bal' as TrnBalType,BouPckQty * -1 as TrnBalPckQty,BouBldQty * -1 as TrnBalBldQty" _
             & " from (BloodOutDtl" _
             & " inner join (BloodOutHdr inner join VTypMast on BloodOutHdr.BohVtmCode = VTypMast.VtmCode) on BloodOutDtl.BouCode = BloodOutHdr.BohCode)" _
             & " inner join BloodCompoMst on BloodOutDtl.BouBdcCode=BloodCompoMst.BdcCode" _
             & " where BouCode > 0 and VtmSysCode IN (" & CStr(cBDK_VTYPE_BLOODISSUED) & "," & CStr(cBDK_VTYPE_BLOODCONS) & ")" _
             & " and BouDate < #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "#" _
             & IIf(mQryEttCode > 0, " and BouEttCode = " & CStr(mQryEttCode), "") _
             & IIf(mQryBdgCode > 0, " and BouBdgCode = " & CStr(mQryBdgCode), "") _
             & IIf(mQryBdcCode > 0, " and BouBdcCode = " & CStr(mQryBdcCode), "") _
             & IIf(mQryBldCode > 0, " and BouBldCode = " & CStr(mQryBldCode), "")
             
        End If
        Rem purchase
        If chkFByBloodIn.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select BinBdcCode as TrnBdcCode,BloodCompoMst.BdcName as TrnBdcName" _
             & ",'' as TrnOpnType,0 as TrnOpnPckQty,0 as TrnOpnBldQty" _
             & ",'Bin' as TrnBinType,BinPckQty as TrnBinPckQty,BinBldQty as TrnBinBldQty" _
             & ",'' as TrnBouType,0 as TrnBouPckQty,0 as TrnBouBldQty" _
             & ",'Bal' as TrnBalType,BinPckQty as TrnBalPckQty,BinBldQty as TrnBalBldQty" _
             & " from (BloodInDtl" _
             & " inner join (BloodInHdr inner join VTypMast on BloodInHdr.BihVtmCode = VTypMast.VtmCode) on BloodInDtl.BinCode = BloodInHdr.BihCode)" _
             & " inner join BloodCompoMst on BloodInDtl.BinBdcCode=BloodCompoMst.BdcCode" _
             & " where BinDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and BinDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and BinCode > 0 and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODDONATE) _
             & IIf(mQryEttCode > 0, " and BinEttCode = " & CStr(mQryEttCode), "") _
             & IIf(mQryBdgCode > 0, " and BinBdgCode = " & CStr(mQryBdgCode), "") _
             & IIf(mQryBdcCode > 0, " and BinBdcCode = " & CStr(mQryBdcCode), "") _
             & IIf(mQryBldCode > 0, " and BinBldCode = " & CStr(mQryBldCode), "")
             
        End If
        Rem sales return
        If chkFByRetnInw.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select BinBdcCode as TrnBdcCode,BloodCompoMst.BdcName as TrnBdcName" _
             & ",'' as TrnOpnType,0 as TrnOpnPckQty,0 as TrnOpnBldQty" _
             & ",'Bin' as TrnBinType,BinPckQty as TrnBinPckQty,BinBldQty as TrnBinBldQty" _
             & ",'' as TrnBouType,0 as TrnBouPckQty,0 as TrnBouBldQty" _
             & ",'Bal' as TrnBalType,BinPckQty as TrnBalPckQty,BinBldQty as TrnBalBldQty" _
             & " from (BloodInDtl" _
             & " inner join (BloodInHdr inner join VTypMast on BloodInHdr.BihVtmCode = VTypMast.VtmCode) on BloodInDtl.BinCode = BloodInHdr.BihCode)" _
             & " inner join BloodCompoMst on BloodInDtl.BinBdcCode = BloodCompoMst.BdcCode" _
             & " where BinDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and BinDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and BinCode > 0 and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODFILTER) _
             & IIf(mQryEttCode > 0, " and BinEttCode = " & CStr(mQryEttCode), "") _
             & IIf(mQryBdgCode > 0, " and BinBdgCode = " & CStr(mQryBdgCode), "") _
             & IIf(mQryBdcCode > 0, " and BinBdcCode = " & CStr(mQryBdcCode), "") _
             & IIf(mQryBldCode > 0, " and BinBldCode = " & CStr(mQryBldCode), "")
             
        End If
        Rem sales ---------------------
        If chkFByBloodOut.Value = vbChecked = True Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select BouBdcCode as TrnBdcCode,BloodCompoMst.BdcName as TrnBdcName" _
             & ",'' as TrnOpnType,0 as TrnOpnPckQty,0 as TrnOpnBldQty" _
             & ",'' as TrnBinType,0 as TrnBinPckQty,0 as TrnBinBldQty" _
             & ",'Bou' as TrnBouType,BouPckQty as TrnBouPckQty,BouBldQty as TrnBouBldQty" _
             & ",'Bal' as TrnBalType,BouPckQty * -1 as TrnBalPckQty,BouBldQty * -1 as TrnBalBldQty" _
             & " from (BloodOutDtl" _
             & " inner join (BloodOutHdr inner join VTypMast on BloodOutHdr.BohVtmCode = VTypMast.VtmCode) on BloodOutDtl.BouCode = BloodOutHdr.BohCode)" _
             & " inner join BloodCompoMst on BloodOutDtl.BouBdcCode = BloodCompoMst.BdcCode" _
             & " where BouDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and BouDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and BouCode > 0 and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODISSUED) _
             & IIf(mQryEttCode > 0, " and BouEttCode = " & CStr(mQryEttCode), "") _
             & IIf(mQryBdgCode > 0, " and BouBdgCode = " & CStr(mQryBdgCode), "") _
             & IIf(mQryBdcCode > 0, " and BouBdcCode = " & CStr(mQryBdcCode), "") _
             & IIf(mQryBldCode > 0, " and BouBldCode = " & CStr(mQryBldCode), "")
             
        End If
        Rem purchase return
        If chkFByRetnOutw.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select BouBdcCode as TrnBdcCode,BloodCompoMst.BdcName as TrnBdcName" _
             & ",'' as TrnOpnType,0 as TrnOpnPckQty,0 as TrnOpnBldQty" _
             & ",'' as TrnBinType,0 as TrnBinPckQty,0 as TrnBinBldQty" _
             & ",'Bou' as TrnBouType,BouPckQty as TrnBouPckQty,BouBldQty as TrnBouBldQty" _
             & ",'Bal' as TrnBalType,BouPckQty * -1 as TrnBalPckQty,BouBldQty * -1 as TrnBalBldQty" _
             & " from (BloodOutDtl" _
             & " inner join (BloodOutHdr inner join VTypMast on BloodOutHdr.BohVtmCode = VTypMast.VtmCode) on BloodOutDtl.BouCode = BloodOutHdr.BohCode)" _
             & " inner join BloodCompoMst on BloodOutDtl.BouBdcCode=BloodCompoMst.BdcCode" _
             & " where BouDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and BouDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and BouCode > 0 and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODCONS) _
             & IIf(mQryEttCode > 0, " and BouEttCode = " & CStr(mQryEttCode), "") _
             & IIf(mQryBdgCode > 0, " and BouBdgCode = " & CStr(mQryBdgCode), "") _
             & IIf(mQryBdcCode > 0, " and BouBdcCode = " & CStr(mQryBdcCode), "") _
             & IIf(mQryBldCode > 0, " and BouBldCode = " & CStr(mQryBldCode), "")
             
        End If
        Rem ----------------------------------
        mQryStr = mQryStr & ")"
        mQryStr = mQryStr & " as t1 group by t1.TrnBdcName,t1.TrnBdcCode" _
         & " order by t1.TrnBdcName,t1.TrnBdcCode"
        
        datRecset.open mQryStr, dbComDatabase, adOpenKeyset, adLockReadOnly
    
    ElseIf optBloodwise.Value = True Then
        clsListStru.AddFields mExpr:="TrnBdgName", mTitle:="Blood Group", mShowItem:=True, mAlign:=1, mWidth:=1500
        clsListStru.AddFields mExpr:="TrnBdcName", mTitle:="Component", mShowItem:=True, mAlign:=1, mWidth:=1750
        clsListStru.AddFields mExpr:="TrnOpnCount", mTitle:="Opn.Count", mShowItem:=False, mAlign:=7, mWidth:=1100
        clsListStru.AddFields mExpr:="TrnOpnPckQty_sum", mTitle:="Opn.Pck/Bag", mShowItem:=True, mAlign:=7, mWidth:=1300
        clsListStru.AddFields mExpr:="TrnOpnBldQty_sum", mTitle:="Opn.Bld.Qty", mShowItem:=True, mAlign:=7, mWidth:=1300
        clsListStru.AddFields mExpr:="TrnBinCount", mTitle:="In.Count", mShowItem:=False, mAlign:=7, mWidth:=1100
        clsListStru.AddFields mExpr:="TrnBinPckQty_sum", mTitle:="In.Pck/Bag", mShowItem:=True, mAlign:=7, mWidth:=1300
        clsListStru.AddFields mExpr:="TrnBinBldQty_sum", mTitle:="In.Bld.Qty", mShowItem:=True, mAlign:=7, mWidth:=1300
        clsListStru.AddFields mExpr:="TrnBouCount", mTitle:="Out.Count", mShowItem:=False, mAlign:=7, mWidth:=1100
        clsListStru.AddFields mExpr:="TrnBouPckQty_sum", mTitle:="Out.Pck/Bag", mShowItem:=True, mAlign:=7, mWidth:=1300
        clsListStru.AddFields mExpr:="TrnBouBldQty_sum", mTitle:="Out.Bld.Qty", mShowItem:=True, mAlign:=7, mWidth:=1300
        clsListStru.AddFields mExpr:="TrnBalCount", mTitle:="Bal.Count", mShowItem:=False, mAlign:=7, mWidth:=1100
        clsListStru.AddFields mExpr:="TrnBalPckQty_sum", mTitle:="Bal.Pck/Bag", mShowItem:=True, mAlign:=7, mWidth:=1300
        clsListStru.AddFields mExpr:="TrnBalBldQty_sum", mTitle:="Bal.Bld.Qty", mShowItem:=True, mAlign:=7, mWidth:=1300
        
        mQryStr = "Select " _
         & " t1.TrnBldCode,t1.TrnBdgName,t1.TrnBdgCode,t1.TrnBdcName,t1.TrnBdcCode" _
         & ",Count(t1.TrnOpnType) as TrnOpnCount" _
         & ",Sum(t1.TrnOpnPckQty) as TrnOpnPckQty_sum" _
         & ",Sum(t1.TrnOpnBldQty) as TrnOpnBldQty_sum" _
         & ",Count(t1.TrnBinType) as TrnBinCount" _
         & ",Sum(t1.TrnBinPckQty) as TrnBinPckQty_sum" _
         & ",Sum(t1.TrnBinBldQty) as TrnBinBldQty_sum" _
         & ",Count(t1.TrnBouType) as TrnBouCount" _
         & ",Sum(t1.TrnBouPckQty) as TrnBouPckQty_sum" _
         & ",Sum(t1.TrnBouBldQty) as TrnBouBldQty_sum" _
         & ",Count(t1.TrnBalType) as TrnBalCount" _
         & ",Sum(t1.TrnBalPckQty) as TrnBalPckQty_sum" _
         & ",Sum(t1.TrnBalBldQty) as TrnBalBldQty_sum"
        mQryStr = mQryStr & " from ("
        Rem reserved query string producing no records
        mQryStr = mQryStr & "Select 0 as TrnBldCode,0 as TrnBdgCode,'' as TrnBdgName,0 as TrnBdcCode,'' as TrnBdcName" _
         & ",'' as TrnOpnType,0 as TrnOpnPckQty,0 as TrnOpnBldQty" _
         & ",'' as TrnBinType,0 as TrnBinPckQty,0 as TrnBinBldQty" _
         & ",'' as TrnBouType,0 as TrnBouPckQty,0 as TrnBouBldQty" _
         & ",'' as TrnBalType,0 as TrnBalPckQty,0 as TrnBalBldQty" _
         & " from ((BloodInDtl" _
         & " inner join (BloodInHdr inner join VTypMast on BloodInHdr.BihVtmCode = VTypMast.VtmCode) on BloodInDtl.BinCode = BloodInHdr.BihCode)" _
         & " inner join BloodGrpMst on BloodInDtl.BinBdgCode=BloodGrpMst.BdgCode)" _
         & " inner join BloodCompoMst on BloodInDtl.BinBdcCode=BloodCompoMst.BdcCode" _
         & " where BinDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and BinDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and BinCode > 0 and True = False" _
         & IIf(mQryEttCode > 0, " and BinEttCode = " & CStr(mQryEttCode), "") _
         & IIf(mQryBdgCode > 0, " and BinBdgCode = " & CStr(mQryBdgCode), "") _
         & IIf(mQryBdcCode > 0, " and BinBdcCode = " & CStr(mQryBdcCode), "") _
         & IIf(mQryBldCode > 0, " and BinBldCode = " & CStr(mQryBldCode), "")
         
        Rem opening stock
        If chkFByOpnStock.Value = vbChecked Then
            Rem incoming stock
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select BinBldCode as TrnBldCode,BinBdgCode as TrnBdgCode,BloodGrpMst.BdgName as TrnBdgName,BinBdcCode as TrnBdcCode,BloodCompoMst.BdcName as TrnBdcName" _
             & ",'Opn' as TrnOpnType,BinPckQty as TrnOpnPckQty,BinBldQty as TrnOpnBldQty" _
             & ",'' as TrnBinType,0 as TrnBinPckQty,0 as TrnBinBldQty" _
             & ",'' as TrnBouType,0 as TrnBouPckQty,0 as TrnBouBldQty" _
             & ",'Bal' as TrnBalType,BinPckQty as TrnBalPckQty,BinBldQty as TrnBalBldQty" _
             & " from ((BloodInDtl" _
             & " inner join (BloodInHdr inner join VTypMast on BloodInHdr.BihVtmCode = VTypMast.VtmCode) on BloodInDtl.BinCode = BloodInHdr.BihCode)" _
             & " inner join BloodGrpMst on BloodInDtl.BinBdgCode=BloodGrpMst.BdgCode)" _
             & " inner join BloodCompoMst on BloodInDtl.BinBdcCode=BloodCompoMst.BdcCode" _
             & " where BinCode > 0 and VtmSysCode IN (" & CStr(cCOM_VTYPE_OPNSTK) & "," & CStr(cBDK_VTYPE_BLOODDONATE) & "," & CStr(cBDK_VTYPE_BLOODFILTER) & ")" _
             & " and BinDate < #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "#" _
             & IIf(mQryEttCode > 0, " and BinEttCode = " & CStr(mQryEttCode), "") _
             & IIf(mQryBdgCode > 0, " and BinBdgCode = " & CStr(mQryBdgCode), "") _
             & IIf(mQryBdcCode > 0, " and BinBdcCode = " & CStr(mQryBdcCode), "") _
             & IIf(mQryBldCode > 0, " and BinBldCode = " & CStr(mQryBldCode), "")
             
            Rem outgoing stock
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select BouBldCode as TrnBldCode,BouBdgCode as TrnBdgCode,BloodGrpMst.BdgName as TrnBdgName,BouBdcCode as TrnBdcCode,BloodCompoMst.BdcName as TrnBdcName" _
             & ",'Opn' as TrnOpnType,BouPckQty * -1 as TrnOpnPckQty,BouBldQty * -1 as TrnOpnBldQty" _
             & ",'' as TrnBinType,0 as TrnBinPckQty,0 as TrnBinBldQty" _
             & ",'' as TrnBouType,0 as TrnBouPckQty,0 as TrnBouBldQty" _
             & ",'Bal' as TrnBalType,BouPckQty * -1 as TrnBalPckQty,BouBldQty * -1 as TrnBalBldQty" _
             & " from ((BloodOutDtl" _
             & " inner join (BloodOutHdr inner join VTypMast on BloodOutHdr.BohVtmCode = VTypMast.VtmCode) on BloodOutDtl.BouCode = BloodOutHdr.BohCode)" _
             & " inner join BloodGrpMst on BloodOutDtl.BouBdgCode=BloodGrpMst.BdgCode)" _
             & " inner join BloodCompoMst on BloodOutDtl.BouBdcCode=BloodCompoMst.BdcCode" _
             & " where BouCode > 0 and VtmSysCode IN (" & CStr(cBDK_VTYPE_BLOODISSUED) & "," & CStr(cBDK_VTYPE_BLOODCONS) & ")" _
             & " and BouDate < #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "#" _
             & IIf(mQryEttCode > 0, " and BouEttCode = " & CStr(mQryEttCode), "") _
             & IIf(mQryBdgCode > 0, " and BouBdgCode = " & CStr(mQryBdgCode), "") _
             & IIf(mQryBdcCode > 0, " and BouBdcCode = " & CStr(mQryBdcCode), "") _
             & IIf(mQryBldCode > 0, " and BouBldCode = " & CStr(mQryBldCode), "")
             
        End If
        Rem purchase
        If chkFByBloodIn.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select BinBldCode as TrnBldCode,BinBdgCode as TrnBdgCode,BloodGrpMst.BdgName as TrnBdgName,BinBdcCode as TrnBdcCode,BloodCompoMst.BdcName as TrnBdcName" _
             & ",'' as TrnOpnType,0 as TrnOpnPckQty,0 as TrnOpnBldQty" _
             & ",'Bin' as TrnBinType,BinPckQty as TrnBinPckQty,BinBldQty as TrnBinBldQty" _
             & ",'' as TrnBouType,0 as TrnBouPckQty,0 as TrnBouBldQty" _
             & ",'Bal' as TrnBalType,BinPckQty as TrnBalPckQty,BinBldQty as TrnBalBldQty" _
             & " from ((BloodInDtl" _
             & " inner join (BloodInHdr inner join VTypMast on BloodInHdr.BihVtmCode = VTypMast.VtmCode) on BloodInDtl.BinCode = BloodInHdr.BihCode)" _
             & " inner join BloodGrpMst on BloodInDtl.BinBdgCode=BloodGrpMst.BdgCode)" _
             & " inner join BloodCompoMst on BloodInDtl.BinBdcCode=BloodCompoMst.BdcCode" _
             & " where BinDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and BinDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and BinCode > 0 and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODDONATE) _
             & IIf(mQryEttCode > 0, " and BinEttCode = " & CStr(mQryEttCode), "") _
             & IIf(mQryBdgCode > 0, " and BinBdgCode = " & CStr(mQryBdgCode), "") _
             & IIf(mQryBdcCode > 0, " and BinBdcCode = " & CStr(mQryBdcCode), "") _
             & IIf(mQryBldCode > 0, " and BinBldCode = " & CStr(mQryBldCode), "")
             
        End If
        Rem sales return
        If chkFByRetnInw.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select BinBldCode as TrnBldCode,BinBdgCode as TrnBdgCode,BloodGrpMst.BdgName as TrnBdgName,BinBdcCode as TrnBdcCode,BloodCompoMst.BdcName as TrnBdcName" _
             & ",'' as TrnOpnType,0 as TrnOpnPckQty,0 as TrnOpnBldQty" _
             & ",'Bin' as TrnBinType,BinPckQty as TrnBinPckQty,BinBldQty as TrnBinBldQty" _
             & ",'' as TrnBouType,0 as TrnBouPckQty,0 as TrnBouBldQty" _
             & ",'Bal' as TrnBalType,BinPckQty as TrnBalPckQty,BinBldQty as TrnBalBldQty" _
             & " from ((BloodInDtl" _
             & " inner join (BloodInHdr inner join VTypMast on BloodInHdr.BihVtmCode = VTypMast.VtmCode) on BloodInDtl.BinCode = BloodInHdr.BihCode)" _
             & " inner join BloodGrpMst on BloodInDtl.BinBdgCode = BloodGrpMst.BdgCode)" _
             & " inner join BloodCompoMst on BloodInDtl.BinBdcCode = BloodCompoMst.BdcCode" _
             & " where BinDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and BinDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and BinCode > 0 and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODFILTER) _
             & IIf(mQryEttCode > 0, " and BinEttCode = " & CStr(mQryEttCode), "") _
             & IIf(mQryBdgCode > 0, " and BinBdgCode = " & CStr(mQryBdgCode), "") _
             & IIf(mQryBdcCode > 0, " and BinBdcCode = " & CStr(mQryBdcCode), "") _
             & IIf(mQryBldCode > 0, " and BinBldCode = " & CStr(mQryBldCode), "")
             
        End If
        Rem sales ---------------------
        If chkFByBloodOut.Value = vbChecked = True Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select BouBldCode as TrnBldCode,BouBdgCode as TrnBdgCode,BloodGrpMst.BdgName as TrnBdgName,BouBdcCode as TrnBdcCode,BloodCompoMst.BdcName as TrnBdcName" _
             & ",'' as TrnOpnType,0 as TrnOpnPckQty,0 as TrnOpnBldQty" _
             & ",'' as TrnBinType,0 as TrnBinPckQty,0 as TrnBinBldQty" _
             & ",'Bou' as TrnBouType,BouPckQty as TrnBouPckQty,BouBldQty as TrnBouBldQty" _
             & ",'Bal' as TrnBalType,BouPckQty * -1 as TrnBalPckQty,BouBldQty * -1 as TrnBalBldQty" _
             & " from ((BloodOutDtl" _
             & " inner join (BloodOutHdr inner join VTypMast on BloodOutHdr.BohVtmCode = VTypMast.VtmCode) on BloodOutDtl.BouCode = BloodOutHdr.BohCode)" _
             & " inner join BloodGrpMst on BloodOutDtl.BouBdgCode = BloodGrpMst.BdgCode)" _
             & " inner join BloodCompoMst on BloodOutDtl.BouBdcCode = BloodCompoMst.BdcCode" _
             & " where BouDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and BouDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and BouCode > 0 and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODISSUED) _
             & IIf(mQryEttCode > 0, " and BouEttCode = " & CStr(mQryEttCode), "") _
             & IIf(mQryBdgCode > 0, " and BouBdgCode = " & CStr(mQryBdgCode), "") _
             & IIf(mQryBdcCode > 0, " and BouBdcCode = " & CStr(mQryBdcCode), "") _
             & IIf(mQryBldCode > 0, " and BouBldCode = " & CStr(mQryBldCode), "")
             
        End If
        Rem purchase return
        If chkFByRetnOutw.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select BouBldCode as TrnBldCode,BouBdgCode as TrnBdgCode,BloodGrpMst.BdgName as TrnBdgName,BouBdcCode as TrnBdcCode,BloodCompoMst.BdcName as TrnBdcName" _
             & ",'' as TrnOpnType,0 as TrnOpnPckQty,0 as TrnOpnBldQty" _
             & ",'' as TrnBinType,0 as TrnBinPckQty,0 as TrnBinBldQty" _
             & ",'Bou' as TrnBouType,BouPckQty as TrnBouPckQty,BouBldQty as TrnBouBldQty" _
             & ",'Bal' as TrnBalType,BouPckQty * -1 as TrnBalPckQty,BouBldQty * -1 as TrnBalBldQty" _
             & " from ((BloodOutDtl" _
             & " inner join (BloodOutHdr inner join VTypMast on BloodOutHdr.BohVtmCode = VTypMast.VtmCode) on BloodOutDtl.BouCode = BloodOutHdr.BohCode)" _
             & " inner join BloodGrpMst on BloodOutDtl.BouBdgCode=BloodGrpMst.BdgCode)" _
             & " inner join BloodCompoMst on BloodOutDtl.BouBdcCode=BloodCompoMst.BdcCode" _
             & " where BouDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and BouDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and BouCode > 0 and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODCONS) _
             & IIf(mQryEttCode > 0, " and BouEttCode = " & CStr(mQryEttCode), "") _
             & IIf(mQryBdgCode > 0, " and BouBdgCode = " & CStr(mQryBdgCode), "") _
             & IIf(mQryBdcCode > 0, " and BouBdcCode = " & CStr(mQryBdcCode), "") _
             & IIf(mQryBldCode > 0, " and BouBldCode = " & CStr(mQryBldCode), "")
             
        End If
        Rem ----------------------------------
        mQryStr = mQryStr & ")"
        mQryStr = mQryStr & " as t1 group by t1.TrnBdgName,t1.TrnBdgCode,t1.TrnBdcName,t1.TrnBdcCode,t1.TrnBldCode" _
         & " order by t1.TrnBdgName,t1.TrnBdgCode,t1.TrnBdcName,t1.TrnBdcCode,t1.TrnBldCode"
        
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
    clsListStru.AddFields mExpr:="EttCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="EttName", mTitle:="Patient Name", mAlign:=1, mWidth:=2500, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="TrnBdgName", mTitle:="Blood Group", mAlign:=1, mWidth:=1500, mShowItem:=True
    clsListStru.AddFields mExpr:="TrnBdcName", mTitle:="Blood Component", mAlign:=1, mWidth:=2000, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="TrnRefNo", mTitle:="Ref.No", mAlign:=1, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="TrnPckQty", mTitle:="Pck/Bag", mAlign:=7, mWidth:=1250, mShowItem:=False
    clsListStru.AddFields mExpr:="TrnBldQty", mTitle:="Bld.Qty", mAlign:=7, mWidth:=1250, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="EttAddr", mTitle:="Address", mAlign:=1, mWidth:=2000, mShowItem:=True
    clsListStru.AddFields mExpr:="EttAraName", mTitle:="Area", mAlign:=1, mWidth:=1500, mShowItem:=True
    clsListStru.AddFields mExpr:="EttStnName", mTitle:="Station", mAlign:=1, mWidth:=1500, mShowItem:=True
    
    mQryStr = "Select *" _
     & ",format(TrnDate,'yyyymmdd')+format(TrnVtmCode,'" & cLONGCODESTRFMT & "')+format(TrnCode,'" & cLONGCODESTRFMT & "') as tTrnSmryId"
    mQryStr = mQryStr & " from ("
    Rem reserved query string producing no records
    mQryStr = mQryStr & "Select " _
     & "VtmName,VtmSysCode" _
     & ",BinCode as TrnCode" _
     & ",BinDate as TrnDate" _
     & ",BinBdgCode as TrnBdgCode,BloodGrpMst.BdgName as TrnBdgName" _
     & ",BinBdcCode as TrnBdcCode,BloodCompoMst.BdcName as TrnBdcName" _
     & ",BinEttCode as TrnEttCode" _
     & ",BihVchNo as TrnVchNo" _
     & ",BihVtmCode as TrnVtmCode" _
     & ",BihTrnRefNo as TrnRefNo" _
     & ",BinPckQty as TrnPckQty" _
     & ",BinBldQty as TrnBldQty" _
     & " from ((BloodInDtl" _
     & " inner join (BloodInHdr inner join VTypMast on BloodInHdr.BihVtmCode = VTypMast.VtmCode) on BloodInDtl.BinCode = BloodInHdr.BihCode)" _
     & " inner join BloodGrpMst on BloodInDtl.BinBdgCode = BloodGrpMst.BdgCode)" _
     & " inner join BloodCompoMst on BloodInDtl.BinBdcCode = BloodCompoMst.BdcCode" _
     & " where BinDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and BinDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & " and BinCode > 0 and True = False" _
     & IIf(mQryEttCode > 0, " and BinEttCode = " & CStr(mQryEttCode), "") _
     & IIf(mQryBdgCode > 0, " and BinBdgCode = " & CStr(mQryBdgCode), "") _
     & IIf(mQryBdcCode > 0, " and BinBdcCode = " & CStr(mQryBdcCode), "") _
     & IIf(mQryBldCode > 0, " and BinBldCode = " & CStr(mQryBldCode), "")
     
    Rem opening stock
    If chkFByOpnStock.Value = vbChecked Then
        mQryStr = mQryStr & " UNION ALL "
        mQryStr = mQryStr & " Select " _
         & "VtmName,VtmSysCode" _
         & ",BinCode as TrnCode" _
         & ",BinDate as TrnDate" _
         & ",BinBdgCode as TrnBdgCode,BloodGrpMst.BdgName as TrnBdgName" _
         & ",BinBdcCode as TrnBdcCode,BloodCompoMst.BdcName as TrnBdcName" _
         & ",BinEttCode as TrnEttCode" _
         & ",BihVchNo as TrnVchNo" _
         & ",BihVtmCode as TrnVtmCode" _
         & ",BihTrnRefNo as TrnRefNo" _
         & ",BinPckQty as TrnPckQty" _
         & ",BinBldQty as TrnBldQty" _
         & " from ((BloodInDtl" _
         & " inner join (BloodInHdr inner join VTypMast on BloodInHdr.BihVtmCode = VTypMast.VtmCode) on BloodInDtl.BinCode = BloodInHdr.BihCode)" _
         & " inner join BloodGrpMst on BloodInDtl.BinBdgCode = BloodGrpMst.BdgCode)" _
         & " inner join BloodCompoMst on BloodInDtl.BinBdcCode = BloodCompoMst.BdcCode" _
         & " where BinCode > 0 and VtmSysCode = " & CStr(cCOM_VTYPE_OPNSTK) _
         & " and BinDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and BinDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & IIf(mQryEttCode > 0, " and BinEttCode = " & CStr(mQryEttCode), "") _
         & IIf(mQryBdgCode > 0, " and BinBdgCode = " & CStr(mQryBdgCode), "") _
         & IIf(mQryBdcCode > 0, " and BinBdcCode = " & CStr(mQryBdcCode), "") _
         & IIf(mQryBldCode > 0, " and BinBldCode = " & CStr(mQryBldCode), "")
         
    End If
    Rem purchase
    If chkFByBloodIn.Value = vbChecked Then
        mQryStr = mQryStr & " UNION ALL "
        mQryStr = mQryStr & " Select " _
         & "VtmName,VtmSysCode" _
         & ",BinCode as TrnCode" _
         & ",BinDate as TrnDate" _
         & ",BinBdgCode as TrnBdgCode,BloodGrpMst.BdgName as TrnBdgName" _
         & ",BinBdcCode as TrnBdcCode,BloodCompoMst.BdcName as TrnBdcName" _
         & ",BinEttCode as TrnEttCode" _
         & ",BihVchNo as TrnVchNo" _
         & ",BihVtmCode as TrnVtmCode" _
         & ",BihTrnRefNo as TrnRefNo" _
         & ",BinPckQty as TrnPckQty" _
         & ",BinBldQty as TrnBldQty" _
         & " from ((BloodInDtl" _
         & " inner join (BloodInHdr inner join VTypMast on BloodInHdr.BihVtmCode = VTypMast.VtmCode) on BloodInDtl.BinCode = BloodInHdr.BihCode)" _
         & " inner join BloodGrpMst on BloodInDtl.BinBdgCode = BloodGrpMst.BdgCode)" _
         & " inner join BloodCompoMst on BloodInDtl.BinBdcCode = BloodCompoMst.BdcCode" _
         & " where BinDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and BinDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and BinCode > 0 and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODDONATE) _
         & IIf(mQryEttCode > 0, " and BinEttCode = " & CStr(mQryEttCode), "") _
         & IIf(mQryBdgCode > 0, " and BinBdgCode = " & CStr(mQryBdgCode), "") _
         & IIf(mQryBdcCode > 0, " and BinBdcCode = " & CStr(mQryBdcCode), "") _
         & IIf(mQryBldCode > 0, " and BinBldCode = " & CStr(mQryBldCode), "")
         
    End If
    Rem sales return
    If chkFByRetnInw.Value = vbChecked Then
        mQryStr = mQryStr & " UNION ALL "
        mQryStr = mQryStr & " Select " _
         & "VtmName,VtmSysCode" _
         & ",BinCode as TrnCode" _
         & ",BinDate as TrnDate" _
         & ",BinBdgCode as TrnBdgCode,BloodGrpMst.BdgName as TrnBdgName" _
         & ",BinBdcCode as TrnBdcCode,BloodCompoMst.BdcName as TrnBdcName" _
         & ",BinEttCode as TrnEttCode" _
         & ",BihVchNo as TrnVchNo" _
         & ",BihVtmCode as TrnVtmCode" _
         & ",BihTrnRefNo as TrnRefNo" _
         & ",BinPckQty as TrnPckQty" _
         & ",BinBldQty as TrnBldQty" _
         & " from ((BloodInDtl" _
         & " inner join (BloodInHdr inner join VTypMast on BloodInHdr.BihVtmCode = VTypMast.VtmCode) on BloodInDtl.BinCode = BloodInHdr.BihCode)" _
         & " inner join BloodGrpMst on BloodInDtl.BinBdgCode = BloodGrpMst.BdgCode)" _
         & " inner join BloodCompoMst on BloodInDtl.BinBdcCode = BloodCompoMst.BdcCode" _
         & " where BinDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and BinDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and BinCode > 0 and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODFILTER) _
         & IIf(mQryEttCode > 0, " and BinEttCode = " & CStr(mQryEttCode), "") _
         & IIf(mQryBdgCode > 0, " and BinBdgCode = " & CStr(mQryBdgCode), "") _
         & IIf(mQryBdcCode > 0, " and BinBdcCode = " & CStr(mQryBdcCode), "") _
         & IIf(mQryBldCode > 0, " and BinBldCode = " & CStr(mQryBldCode), "")
         
    End If
    Rem sales ---------------------
    If chkFByBloodOut.Value = vbChecked = True Then
        mQryStr = mQryStr & " UNION ALL "
        mQryStr = mQryStr & " Select " _
         & "VtmName,VtmSysCode" _
         & ",BouCode as TrnCode" _
         & ",BouDate as TrnDate" _
         & ",BouBdgCode as TrnBdgCode,BloodGrpMst.BdgName as TrnBdgName" _
         & ",BouBdcCode as TrnBdcCode,BloodCompoMst.BdcName as TrnBdcName" _
         & ",BouEttCode as TrnEttCode" _
         & ",BohVchNo as TrnVchNo" _
         & ",BohVtmCode as TrnVtmCode" _
         & ",BohTrnRefNo as TrnRefNo" _
         & ",BouPckQty as TrnPckQty" _
         & ",BouBldQty as TrnBldQty" _
         & " from ((BloodOutDtl" _
         & " inner join (BloodOutHdr inner join VTypMast on BloodOutHdr.BohVtmCode = VTypMast.VtmCode) on BloodOutDtl.BouCode = BloodOutHdr.BohCode)" _
         & " inner join BloodGrpMst on BloodOutDtl.BouBdgCode = BloodGrpMst.BdgCode)" _
         & " inner join BloodCompoMst on BloodOutDtl.BouBdcCode = BloodCompoMst.BdcCode" _
         & " where BouDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and BouDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and BouCode > 0 and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODISSUED) _
         & IIf(mQryEttCode > 0, " and BouEttCode = " & CStr(mQryEttCode), "") _
         & IIf(mQryBdgCode > 0, " and BouBdgCode = " & CStr(mQryBdgCode), "") _
         & IIf(mQryBdcCode > 0, " and BouBdcCode = " & CStr(mQryBdcCode), "") _
         & IIf(mQryBldCode > 0, " and BouBldCode = " & CStr(mQryBldCode), "")
         
    End If
    Rem purchase return
    If chkFByRetnOutw.Value = vbChecked Then
        mQryStr = mQryStr & " UNION ALL "
        mQryStr = mQryStr & " Select " _
         & "VtmName,VtmSysCode" _
         & ",BouCode as TrnCode" _
         & ",BouDate as TrnDate" _
         & ",BouBdgCode as TrnBdgCode,BloodGrpMst.BdgName as TrnBdgName" _
         & ",BouBdcCode as TrnBdcCode,BloodCompoMst.BdcName as TrnBdcName" _
         & ",BouEttCode as TrnEttCode" _
         & ",BohVchNo as TrnVchNo" _
         & ",BohVtmCode as TrnVtmCode" _
         & ",BohTrnRefNo as TrnRefNo" _
         & ",BouPckQty as TrnPckQty" _
         & ",BouBldQty as TrnBldQty" _
         & " from ((BloodOutDtl" _
         & " inner join (BloodOutHdr inner join VTypMast on BloodOutHdr.BohVtmCode = VTypMast.VtmCode) on BloodOutDtl.BouCode = BloodOutHdr.BohCode)" _
         & " inner join BloodGrpMst on BloodOutDtl.BouBdgCode = BloodGrpMst.BdgCode)" _
         & " inner join BloodCompoMst on BloodOutDtl.BouBdcCode = BloodCompoMst.BdcCode" _
         & " where BouDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and BouDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and BouCode > 0 and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODCONS) _
         & IIf(mQryEttCode > 0, " and BouEttCode = " & CStr(mQryEttCode), "") _
         & IIf(mQryBdgCode > 0, " and BouBdgCode = " & CStr(mQryBdgCode), "") _
         & IIf(mQryBdcCode > 0, " and BouBdcCode = " & CStr(mQryBdcCode), "") _
         & IIf(mQryBldCode > 0, " and BouBldCode = " & CStr(mQryBldCode), "")
         
    End If
    Rem ----------------------------------
    mQryStr = mQryStr & ") as t1"
    mQryStr = mQryStr & " inner join ((EntityMast ett" _
     & " inner join AreaMast ara on ett.EttAraCode = ara.AraCode)" _
     & " inner join StsnMast stn on ett.EttStnCode = stn.StnCode)" _
     & " on t1.TrnEttCode = ett.EttCode" _
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
    clsListStru.AddFields mExpr:="EttCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="EttName", mTitle:="Patient Name", mAlign:=1, mWidth:=2500, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="TrnRefNo", mTitle:="Ref.No", mAlign:=1, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="TrnPckQty", mTitle:="Pck/Bag", mAlign:=7, mWidth:=1250, mShowItem:=False
    clsListStru.AddFields mExpr:="TrnBldQty", mTitle:="Bld.Qty", mAlign:=7, mWidth:=1250, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="EttAddr", mTitle:="Address", mAlign:=1, mWidth:=2000, mShowItem:=True
    clsListStru.AddFields mExpr:="EttAraName", mTitle:="Area", mAlign:=1, mWidth:=1500, mShowItem:=True
    clsListStru.AddFields mExpr:="EttStnName", mTitle:="Station", mAlign:=1, mWidth:=1500, mShowItem:=True
    
    mQryStr = "Select *" _
     & ",format(TrnDate,'yyyymmdd')+format(TrnVtmCode,'" & cLONGCODESTRFMT & "')+format(TrnCode,'" & cLONGCODESTRFMT & "') as tTrnSmryId"
    mQryStr = mQryStr & " from ("
    Rem reserved query string producing no records
    mQryStr = mQryStr & "Select " _
     & "VtmName,VtmSysCode" _
     & ",BihCode as TrnCode" _
     & ",BihDate as TrnDate" _
     & ",BihEttCode as TrnEttCode" _
     & ",BihVchNo as TrnVchNo" _
     & ",BihVtmCode as TrnVtmCode" _
     & ",BihTrnRefNo as TrnRefNo" _
     & ",BihPckQty as TrnPckQty" _
     & ",BihBldQty as TrnBldQty" _
     & " from BloodInHdr" _
     & " inner join VTypMast on BloodInHdr.BihVtmCode = VTypMast.VtmCode" _
     & " where BihDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and BihDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & " and BihCode>0 and True = False" _
     & IIf(mQryEttCode > 0, " and BihEttCode = " & CStr(mQryEttCode), "")
    Rem opening stock
    If chkFByOpnStock.Value = vbChecked Then
        mQryStr = mQryStr & " UNION ALL "
        mQryStr = mQryStr & " Select " _
         & "VtmName,VtmSysCode" _
         & ",BihCode as TrnCode" _
         & ",BihDate as TrnDate" _
         & ",BihEttCode as TrnEttCode" _
         & ",BihVchNo as TrnVchNo" _
         & ",BihVtmCode as TrnVtmCode" _
         & ",BihTrnRefNo as TrnRefNo" _
         & ",BihPckQty as TrnPckQty" _
         & ",BihBldQty as TrnBldQty" _
         & " from BloodInHdr" _
         & " inner join VTypMast on BloodInHdr.BihVtmCode = VTypMast.VtmCode" _
         & " where BihCode > 0 and VtmSysCode = " & CStr(cCOM_VTYPE_OPNSTK) _
         & " and BihDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and BihDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & IIf(mQryEttCode > 0, " and BihEttCode = " & CStr(mQryEttCode), "")
    End If
    Rem purchase
    If chkFByBloodIn.Value = vbChecked Then
        mQryStr = mQryStr & " UNION ALL "
        mQryStr = mQryStr & " Select " _
         & "VtmName,VtmSysCode" _
         & ",BihCode as TrnCode" _
         & ",BihDate as TrnDate" _
         & ",BihEttCode as TrnEttCode" _
         & ",BihVchNo as TrnVchNo" _
         & ",BihVtmCode as TrnVtmCode" _
         & ",BihTrnRefNo as TrnRefNo" _
         & ",BihPckQty as TrnPckQty" _
         & ",BihBldQty as TrnBldQty" _
         & " from BloodInHdr" _
         & " inner join VTypMast on BloodInHdr.BihVtmCode = VTypMast.VtmCode" _
         & " where BihDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and BihDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and BihCode > 0 and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODDONATE) _
         & IIf(mQryEttCode > 0, " and BihEttCode = " & CStr(mQryEttCode), "")
    End If
    Rem sales return
    If chkFByRetnInw.Value = vbChecked Then
        mQryStr = mQryStr & " UNION ALL "
        mQryStr = mQryStr & " Select " _
         & "VtmName,VtmSysCode" _
         & ",BihCode as TrnCode" _
         & ",BihDate as TrnDate" _
         & ",BihEttCode as TrnEttCode" _
         & ",BihVchNo as TrnVchNo" _
         & ",BihVtmCode as TrnVtmCode" _
         & ",BihTrnRefNo as TrnRefNo" _
         & ",BihPckQty as TrnPckQty" _
         & ",BihBldQty as TrnBldQty" _
         & " from BloodInHdr" _
         & " inner join VTypMast on BloodInHdr.BihVtmCode = VTypMast.VtmCode" _
         & " where BihDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and BihDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and BihCode > 0 and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODFILTER) _
         & IIf(mQryEttCode > 0, " and BihEttCode = " & CStr(mQryEttCode), "")
    End If
    Rem sales ---------------------
    If chkFByBloodOut.Value = vbChecked = True Then
        mQryStr = mQryStr & " UNION ALL "
        mQryStr = mQryStr & " Select " _
         & "VtmName,VtmSysCode" _
         & ",BohCode as TrnCode" _
         & ",BohDate as TrnDate" _
         & ",BohEttCode as TrnEttCode" _
         & ",BohVchNo as TrnVchNo" _
         & ",BohVtmCode as TrnVtmCode" _
         & ",BohTrnRefNo as TrnRefNo" _
         & ",BohPckQty as TrnPckQty" _
         & ",BohBldQty as TrnBldQty" _
         & " from BloodOutHdr" _
         & " inner join VTypMast on BloodOutHdr.BohVtmCode = VTypMast.VtmCode" _
         & " where BohDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and BohDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and BohCode > 0 and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODISSUED) _
         & IIf(mQryEttCode > 0, " and BohEttCode = " & CStr(mQryEttCode), "")
    End If
    Rem purchase return
    If chkFByRetnOutw.Value = vbChecked Then
        mQryStr = mQryStr & " UNION ALL "
        mQryStr = mQryStr & " Select " _
         & "VtmName,VtmSysCode" _
         & ",BohCode as TrnCode" _
         & ",BohDate as TrnDate" _
         & ",BohEttCode as TrnEttCode" _
         & ",BohVchNo as TrnVchNo" _
         & ",BohVtmCode as TrnVtmCode" _
         & ",BohTrnRefNo as TrnRefNo" _
         & ",BohPckQty as TrnPckQty" _
         & ",BohBldQty as TrnBldQty" _
         & " from BloodOutHdr" _
         & " inner join VTypMast on BloodOutHdr.BohVtmCode = VTypMast.VtmCode" _
         & " where BohDate >= #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and BohDate <= #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and BohCode > 0 and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODCONS) _
         & IIf(mQryEttCode > 0, " and BohEttCode = " & CStr(mQryEttCode), "")
    End If
    Rem ----------------------------------
    mQryStr = mQryStr & ") as t1"
    mQryStr = mQryStr & " inner join ((EntityMast ett" _
     & " inner join AreaMast ara on ett.EttAraCode = ara.AraCode)" _
     & " inner join StsnMast stn on ett.EttStnCode = stn.StnCode)" _
     & " on t1.TrnEttCode = ett.EttCode" _
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

mOpnCount_Tot = 0: mOpnPckQty_Tot = 0: mOpnBldQty_Tot = 0
mBinCount_Tot = 0: mBinPckQty_Tot = 0: mBinBldQty_Tot = 0
mBouCount_Tot = 0: mBouPckQty_Tot = 0: mBouBldQty_Tot = 0
mBalCount_Tot = 0: mBalPckQty_Tot = 0: mBalBldQty_Tot = 0

srow = 1
MoveRecToFirst datRecset
With datRecset
If .RecordCount > 0 Then
    Do While .EOF = False
        If optDetailed.Value = True Or optExpanded.Value = True Then
            mCount_Tot = mCount_Tot + 1
            mPckQty_Tot = mPckQty_Tot + .fields("TrnPckQty")
            mBldQty_Tot = mBldQty_Tot + .fields("TrnBldQty")
            
        Else
            If optBloodGrpwise.Value = True Or optBloodCompowise.Value = True Or optBloodwise.Value = True Or optEntityNamewise.Value = True Then
                mOpnCount_Tot = mOpnCount_Tot + .fields("TrnOpnCount")
                mOpnPckQty_Tot = mOpnPckQty_Tot + .fields("TrnOpnPckQty_sum")
                mOpnBldQty_Tot = mOpnBldQty_Tot + .fields("TrnOpnBldQty_sum")
            End If
            
            mBinCount_Tot = mBinCount_Tot + .fields("TrnBinCount")
            mBinPckQty_Tot = mBinPckQty_Tot + .fields("TrnBinPckQty_sum")
            mBinBldQty_Tot = mBinBldQty_Tot + .fields("TrnBinBldQty_sum")
            
            mBouCount_Tot = mBouCount_Tot + .fields("TrnBouCount")
            mBouPckQty_Tot = mBouPckQty_Tot + .fields("TrnBouPckQty_sum")
            mBouBldQty_Tot = mBouBldQty_Tot + .fields("TrnBouBldQty_sum")
            
            mBalCount_Tot = mBalCount_Tot + .fields("TrnBalCount")
            mBalPckQty_Tot = mBalPckQty_Tot + .fields("TrnBalPckQty_sum")
            mBalBldQty_Tot = mBalBldQty_Tot + .fields("TrnBalBldQty_sum")
            
        End If
        If optMonthwise.Value = True Then
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnYrMonth")) = .fields("TrnYrMonth")
            If Month(.fields("TrnYrMonth")) < Month(Ctod(dtpFromDate.Text)) And Year(.fields("TrnYrMonth")) <= Year(Ctod(dtpFromDate.Text)) Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnMnYear")) = "Opening"
            Else
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnMnYear")) = MonthName(Val(Right(.fields("TrnYrMonth"), 2))) & "-" & Left(.fields("TrnYrMonth"), 4)
            End If
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBinCount")) = ToMyNumFmt(.fields("TrnBinCount"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBinPckQty_sum")) = ToMyNumFmt(.fields("TrnBinPckQty_sum"), mDecimals:=-1)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBinBldQty_sum")) = ToMyNumFmt(.fields("TrnBinBldQty_sum"), mDecimals:=-1)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBouCount")) = ToMyNumFmt(.fields("TrnBouCount"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBouPckQty_sum")) = ToMyNumFmt(.fields("TrnBouPckQty_sum"), mDecimals:=-1)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBouBldQty_sum")) = ToMyNumFmt(.fields("TrnBouBldQty_sum"), mDecimals:=-1)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalCount")) = ToMyNumFmt(mBalCount_Tot, mDecimals:=0)         ''' .fields("TrnBalCount")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalPckQty_sum")) = ToMyNumFmt(mBalPckQty_Tot, mDecimals:=-1)          ''' .fields("TrnBalPckQty_sum")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalBldQty_sum")) = ToMyNumFmt(mBalBldQty_Tot, mDecimals:=-1)        '''    .fields("TrnBalBldQty_sum")
            
        ElseIf optDatewise.Value = True Then
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDateYMD")) = Format(.fields("TrnDate"), "yyyymmdd")
            If .fields("TrnDate") < Ctod(dtpFromDate.Text) Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDate")) = "Opening"
            Else
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDate")) = Dtoc(.fields("TrnDate"))
            End If
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBinCount")) = ToMyNumFmt(.fields("TrnBinCount"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBinPckQty_sum")) = ToMyNumFmt(.fields("TrnBinPckQty_sum"), mDecimals:=-1)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBinBldQty_sum")) = ToMyNumFmt(.fields("TrnBinBldQty_sum"), mDecimals:=-1)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBouCount")) = ToMyNumFmt(.fields("TrnBouCount"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBouPckQty_sum")) = ToMyNumFmt(.fields("TrnBouPckQty_sum"), mDecimals:=-1)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBouBldQty_sum")) = ToMyNumFmt(.fields("TrnBouBldQty_sum"), mDecimals:=-1)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalCount")) = ToMyNumFmt(mBalCount_Tot, mDecimals:=0)         ''' .fields("TrnBalCount")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalPckQty_sum")) = ToMyNumFmt(mBalPckQty_Tot, mDecimals:=-1)          ''' .fields("TrnBalPckQty_sum")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalBldQty_sum")) = ToMyNumFmt(mBalBldQty_Tot, mDecimals:=-1)        '''    .fields("TrnBalBldQty_sum")
            
        ElseIf optEntityNamewise.Value = True Then
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttName")) = .fields("EttName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnOpnCount")) = ToMyNumFmt(.fields("TrnOpnCount"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnOpnPckQty_sum")) = ToMyNumFmt(.fields("TrnOpnPckQty_sum"), mDecimals:=-1)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnOpnBldQty_sum")) = ToMyNumFmt(.fields("TrnOpnBldQty_sum"), mDecimals:=-1)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBinCount")) = ToMyNumFmt(.fields("TrnBinCount"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBinPckQty_sum")) = ToMyNumFmt(.fields("TrnBinPckQty_sum"), mDecimals:=-1)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBinBldQty_sum")) = ToMyNumFmt(.fields("TrnBinBldQty_sum"), mDecimals:=-1)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBouCount")) = ToMyNumFmt(.fields("TrnBouCount"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBouPckQty_sum")) = ToMyNumFmt(.fields("TrnBouPckQty_sum"), mDecimals:=-1)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBouBldQty_sum")) = ToMyNumFmt(.fields("TrnBouBldQty_sum"), mDecimals:=-1)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalCount")) = ToMyNumFmt(.fields("TrnBalCount"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalPckQty_sum")) = ToMyNumFmt(.fields("TrnBalPckQty_sum"), mDecimals:=-1)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalBldQty_sum")) = ToMyNumFmt(.fields("TrnBalBldQty_sum"), mDecimals:=-1)
            
        ElseIf optBloodGrpwise.Value = True Then
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBdgName")) = .fields("TrnBdgName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnOpnCount")) = ToMyNumFmt(.fields("TrnOpnCount"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnOpnPckQty_sum")) = ToMyNumFmt(.fields("TrnOpnPckQty_sum"), mDecimals:=-1)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnOpnBldQty_sum")) = ToMyNumFmt(.fields("TrnOpnBldQty_sum"), mDecimals:=-1)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBinCount")) = ToMyNumFmt(.fields("TrnBinCount"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBinPckQty_sum")) = ToMyNumFmt(.fields("TrnBinPckQty_sum"), mDecimals:=-1)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBinBldQty_sum")) = ToMyNumFmt(.fields("TrnBinBldQty_sum"), mDecimals:=-1)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBouCount")) = ToMyNumFmt(.fields("TrnBouCount"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBouPckQty_sum")) = ToMyNumFmt(.fields("TrnBouPckQty_sum"), mDecimals:=-1)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBouBldQty_sum")) = ToMyNumFmt(.fields("TrnBouBldQty_sum"), mDecimals:=-1)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalCount")) = ToMyNumFmt(.fields("TrnBalCount"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalPckQty_sum")) = ToMyNumFmt(.fields("TrnBalPckQty_sum"), mDecimals:=-1)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalBldQty_sum")) = ToMyNumFmt(.fields("TrnBalBldQty_sum"), mDecimals:=-1)
            
        ElseIf optBloodCompowise.Value = True Then
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBdcName")) = .fields("TrnBdcName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnOpnCount")) = ToMyNumFmt(.fields("TrnOpnCount"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnOpnPckQty_sum")) = ToMyNumFmt(.fields("TrnOpnPckQty_sum"), mDecimals:=-1)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnOpnBldQty_sum")) = ToMyNumFmt(.fields("TrnOpnBldQty_sum"), mDecimals:=-1)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBinCount")) = ToMyNumFmt(.fields("TrnBinCount"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBinPckQty_sum")) = ToMyNumFmt(.fields("TrnBinPckQty_sum"), mDecimals:=-1)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBinBldQty_sum")) = ToMyNumFmt(.fields("TrnBinBldQty_sum"), mDecimals:=-1)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBouCount")) = ToMyNumFmt(.fields("TrnBouCount"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBouPckQty_sum")) = ToMyNumFmt(.fields("TrnBouPckQty_sum"), mDecimals:=-1)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBouBldQty_sum")) = ToMyNumFmt(.fields("TrnBouBldQty_sum"), mDecimals:=-1)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalCount")) = ToMyNumFmt(.fields("TrnBalCount"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalPckQty_sum")) = ToMyNumFmt(.fields("TrnBalPckQty_sum"), mDecimals:=-1)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalBldQty_sum")) = ToMyNumFmt(.fields("TrnBalBldQty_sum"), mDecimals:=-1)
            
        ElseIf optBloodwise.Value = True Then
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBdgName")) = .fields("TrnBdgName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBdcName")) = .fields("TrnBdcName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnOpnCount")) = ToMyNumFmt(.fields("TrnOpnCount"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnOpnPckQty_sum")) = ToMyNumFmt(.fields("TrnOpnPckQty_sum"), mDecimals:=-1)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnOpnBldQty_sum")) = ToMyNumFmt(.fields("TrnOpnBldQty_sum"), mDecimals:=-1)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBinCount")) = ToMyNumFmt(.fields("TrnBinCount"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBinPckQty_sum")) = ToMyNumFmt(.fields("TrnBinPckQty_sum"), mDecimals:=-1)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBinBldQty_sum")) = ToMyNumFmt(.fields("TrnBinBldQty_sum"), mDecimals:=-1)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBouCount")) = ToMyNumFmt(.fields("TrnBouCount"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBouPckQty_sum")) = ToMyNumFmt(.fields("TrnBouPckQty_sum"), mDecimals:=-1)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBouBldQty_sum")) = ToMyNumFmt(.fields("TrnBouBldQty_sum"), mDecimals:=-1)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalCount")) = ToMyNumFmt(.fields("TrnBalCount"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalPckQty_sum")) = ToMyNumFmt(.fields("TrnBalPckQty_sum"), mDecimals:=-1)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalBldQty_sum")) = ToMyNumFmt(.fields("TrnBalBldQty_sum"), mDecimals:=-1)
            
        ElseIf optDetailed.Value = True Or optExpanded.Value = True Then
            Rem clsARA.GetData .fields("EttAraCode")
            Rem clsSTN.GetData .fields("EttStnCode")
            Rem clsVTM.GetData .fields("TrnVtmCode")
            
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("tTrnSmryId")) = .fields("tTrnSmryId")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnVtmCode")) = .fields("TrnVtmCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("VtmSysCode")) = .fields("VtmSysCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCode")) = .fields("TrnCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("VtmName")) = .fields("VtmName")   ''' clsVTM.mName_str
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnVchNo")) = .fields("TrnVchNo")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDate")) = Dtoc(.fields("TrnDate"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnRefNo")) = .fields("TrnRefNo")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnPckQty")) = ToMyNumFmt(.fields("TrnPckQty"), mDecimals:=-1)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBldQty")) = ToMyNumFmt(.fields("TrnBldQty"), mDecimals:=-1)
            ' ------------------------------------
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttCode")) = .fields("EttCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttName")) = .fields("EttName")
            ' ------------------------------------
            If optExpanded.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBdgName")) = .fields("TrnBdgName")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBdcName")) = .fields("TrnBdcName")
            End If
            ' ------------------------------------
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttAddr")) = .fields("EttAddr")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttAraName")) = .fields("AraName")    ''' clsARA.mName_str
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttStnName")) = .fields("StnName")    ''' clsSTN.mName_str
        
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
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBinCount")) = ToMyNumFmt(mBinCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBinPckQty_sum")) = ToMyNumFmt(mBinPckQty_Tot, mDecimals:=-1)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBinBldQty_sum")) = ToMyNumFmt(mBinBldQty_Tot, mDecimals:=-1)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBouCount")) = ToMyNumFmt(mBouCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBouPckQty_sum")) = ToMyNumFmt(mBouPckQty_Tot, mDecimals:=-1)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBouBldQty_sum")) = ToMyNumFmt(mBouBldQty_Tot, mDecimals:=-1)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalCount")) = ""   ''' ToMyNumFmt(mBalCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalPckQty_sum")) = ""  '''  ToMyNumFmt(mBalPckQty_Tot)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalBldQty_sum")) = ""   '''  ToMyNumFmt(mBalBldQty_Tot)
    
ElseIf optDatewise.Value = True Then
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDateYMD")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDate")) = "Grand Total"
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBinCount")) = ToMyNumFmt(mBinCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBinPckQty_sum")) = ToMyNumFmt(mBinPckQty_Tot, mDecimals:=-1)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBinBldQty_sum")) = ToMyNumFmt(mBinBldQty_Tot, mDecimals:=-1)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBouCount")) = ToMyNumFmt(mBouCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBouPckQty_sum")) = ToMyNumFmt(mBouPckQty_Tot, mDecimals:=-1)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBouBldQty_sum")) = ToMyNumFmt(mBouBldQty_Tot, mDecimals:=-1)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalCount")) = ""   ''' ToMyNumFmt(mBalCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalPckQty_sum")) = ""   ''' ToMyNumFmt(mBalPckQty_Tot)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalBldQty_sum")) = ""   ''' ToMyNumFmt(mBalBldQty_Tot, mDecimals:=0)
    
ElseIf optEntityNamewise.Value = True Then
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttName")) = "Grand Total"
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnOpnCount")) = ToMyNumFmt(mOpnCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnOpnPckQty_sum")) = ToMyNumFmt(mOpnPckQty_Tot, mDecimals:=-1)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnOpnBldQty_sum")) = ToMyNumFmt(mOpnBldQty_Tot, mDecimals:=-1)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBinCount")) = ToMyNumFmt(mBinCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBinPckQty_sum")) = ToMyNumFmt(mBinPckQty_Tot, mDecimals:=-1)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBinBldQty_sum")) = ToMyNumFmt(mBinBldQty_Tot, mDecimals:=-1)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBouCount")) = ToMyNumFmt(mBouCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBouPckQty_sum")) = ToMyNumFmt(mBouPckQty_Tot, mDecimals:=-1)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBouBldQty_sum")) = ToMyNumFmt(mBouBldQty_Tot, mDecimals:=-1)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalCount")) = ""   ''' ToMyNumFmt(mBalCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalPckQty_sum")) = ""  ''' ToMyNumFmt(mBalPckQty_Tot)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalBldQty_sum")) = "" ''' ToMyNumFmt(mBalBldQty_Tot)
    
ElseIf optBloodGrpwise.Value = True Then
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBdgName")) = "Grand Total"
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnOpnCount")) = ToMyNumFmt(mOpnCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnOpnPckQty_sum")) = ToMyNumFmt(mOpnPckQty_Tot, mDecimals:=-1)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnOpnBldQty_sum")) = ToMyNumFmt(mOpnBldQty_Tot, mDecimals:=-1)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBinCount")) = ToMyNumFmt(mBinCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBinPckQty_sum")) = ToMyNumFmt(mBinPckQty_Tot, mDecimals:=-1)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBinBldQty_sum")) = ToMyNumFmt(mBinBldQty_Tot, mDecimals:=-1)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBouCount")) = ToMyNumFmt(mBouCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBouPckQty_sum")) = ToMyNumFmt(mBouPckQty_Tot, mDecimals:=-1)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBouBldQty_sum")) = ToMyNumFmt(mBouBldQty_Tot, mDecimals:=-1)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalCount")) = ""   ''' ToMyNumFmt(mBalCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalPckQty_sum")) = ""  ''' ToMyNumFmt(mBalPckQty_Tot)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalBldQty_sum")) = "" ''' ToMyNumFmt(mBalBldQty_Tot, mDecimals:=0)
    
ElseIf optBloodCompowise.Value = True Then
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBdcName")) = "Grand Total"
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnOpnCount")) = ToMyNumFmt(mOpnCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnOpnPckQty_sum")) = ToMyNumFmt(mOpnPckQty_Tot, mDecimals:=-1)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnOpnBldQty_sum")) = ToMyNumFmt(mOpnBldQty_Tot, mDecimals:=-1)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBinCount")) = ToMyNumFmt(mBinCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBinPckQty_sum")) = ToMyNumFmt(mBinPckQty_Tot, mDecimals:=-1)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBinBldQty_sum")) = ToMyNumFmt(mBinBldQty_Tot, mDecimals:=-1)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBouCount")) = ToMyNumFmt(mBouCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBouPckQty_sum")) = ToMyNumFmt(mBouPckQty_Tot, mDecimals:=-1)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBouBldQty_sum")) = ToMyNumFmt(mBouBldQty_Tot, mDecimals:=-1)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalCount")) = ""   ''' ToMyNumFmt(mBalCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalPckQty_sum")) = ""  ''' ToMyNumFmt(mBalPckQty_Tot)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalBldQty_sum")) = "" ''' ToMyNumFmt(mBalBldQty_Tot, mDecimals:=0)
    
ElseIf optBloodwise.Value = True Then
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBdgName")) = "Grand Total"
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBdcName")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnOpnCount")) = ToMyNumFmt(mOpnCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnOpnPckQty_sum")) = ToMyNumFmt(mOpnPckQty_Tot, mDecimals:=-1)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnOpnBldQty_sum")) = ToMyNumFmt(mOpnBldQty_Tot, mDecimals:=-1)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBinCount")) = ToMyNumFmt(mBinCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBinPckQty_sum")) = ToMyNumFmt(mBinPckQty_Tot, mDecimals:=-1)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBinBldQty_sum")) = ToMyNumFmt(mBinBldQty_Tot, mDecimals:=-1)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBouCount")) = ToMyNumFmt(mBouCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBouPckQty_sum")) = ToMyNumFmt(mBouPckQty_Tot, mDecimals:=-1)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBouBldQty_sum")) = ToMyNumFmt(mBouBldQty_Tot, mDecimals:=-1)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalCount")) = ""   ''' ToMyNumFmt(mBalCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalPckQty_sum")) = ""  ''' ToMyNumFmt(mBalPckQty_Tot)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBalBldQty_sum")) = "" ''' ToMyNumFmt(mBalBldQty_Tot, mDecimals:=0)
    
ElseIf optDetailed.Value = True Or optExpanded.Value = True Then
    
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("tTrnSmryId")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnVtmCode")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("VtmSysCode")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCode")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("VtmName")) = "Grand Total (" & CStr(mCount_Tot) & ")"
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnVchNo")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDate")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnRefNo")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnPckQty")) = ToMyNumFmt(mPckQty_Tot, mDecimals:=-1)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBldQty")) = ToMyNumFmt(mBldQty_Tot, mDecimals:=-1)
    ' ------------------------------------
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttCode")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttName")) = ""
    ' ------------------------------------
    If optExpanded.Value = True Then
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBdgName")) = ""
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnBdcName")) = ""
    End If
    ' ------------------------------------
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttAddr")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttAraName")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttStnName")) = ""

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
    fcmbEttName.BoundText = CStr(mQryEttCode)
    fcmbBdgName.BoundText = CStr(mQryBdgCode)
    fcmbBdcName.BoundText = CStr(mQryBdcCode)
    fcmbBldName.BoundText = CStr(mQryBldCode)
    txtQryEttName.Text = fcmbEttName.Text
    txtQryBdgName.Text = fcmbBdgName.Text
    txtQryBdcName.Text = fcmbBdcName.Text
    txtQryBldName.Text = fcmbBldName.Text
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
                Set frmTrn = New frmBloodInTran
                Load frmTrn
                frmTrn.FormSysVchType = cCOM_VTYPE_OPNSTK
                frmTrn.RemoteAccessCode = mTrnCode
                Call frmTrn.Form_Load
                frmTrn.Show 1
                Me.ZOrder
                
            Case cBDK_VTYPE_BLOODDONATE
                Set frmTrn = New frmBloodInTran
                Load frmTrn
                frmTrn.FormSysVchType = cBDK_VTYPE_BLOODDONATE
                frmTrn.RemoteAccessCode = mTrnCode
                Call frmTrn.Form_Load
                frmTrn.Show 1
                Me.ZOrder
            
            Case cBDK_VTYPE_BLOODFILTER
                Set frmTrn = New frmBloodInTran
                Load frmTrn
                frmTrn.FormSysVchType = cBDK_VTYPE_BLOODFILTER
                frmTrn.RemoteAccessCode = mTrnCode
                Call frmTrn.Form_Load
                frmTrn.Show 1
                Me.ZOrder
            
            Case cBDK_VTYPE_BLOODCONS
                Set frmTrn = New frmBloodOutTran
                Load frmTrn
                frmTrn.FormSysVchType = cBDK_VTYPE_BLOODCONS
                frmTrn.RemoteAccessCode = mTrnCode
                Call frmTrn.Form_Load
                frmTrn.Show 1
                Me.ZOrder
            
            Case cBDK_VTYPE_BLOODISSUED
                Set frmTrn = New frmBloodOutTran
                Load frmTrn
                frmTrn.FormSysVchType = cBDK_VTYPE_BLOODISSUED
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

Private Sub optBloodGrpwise_GotFocus()
FlashActiveControl optBloodGrpwise, True
End Sub

Private Sub optBloodGrpwise_LostFocus()
FlashActiveControl optBloodGrpwise, False
End Sub

Private Sub optBloodCompowise_GotFocus()
FlashActiveControl optBloodCompowise, True
End Sub

Private Sub optBloodCompowise_LostFocus()
FlashActiveControl optBloodCompowise, False
End Sub

Private Sub optBloodwise_GotFocus()
FlashActiveControl optBloodwise, True
End Sub

Private Sub optBloodwise_LostFocus()
FlashActiveControl optBloodwise, False
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
    ElseIf optEntityNamewise.Value = True Then
        SearchRawFlex Mfgrd1, clsListStru.GetItemIndex("EttName"), mText
    ElseIf optBloodGrpwise.Value = True Then
        SearchRawFlex Mfgrd1, clsListStru.GetItemIndex("BdgName"), mText
    ElseIf optBloodCompowise.Value = True Then
        SearchRawFlex Mfgrd1, clsListStru.GetItemIndex("BdcName"), mText
    ElseIf optBloodwise.Value = True Then
        SearchRawFlex Mfgrd1, clsListStru.GetItemIndex("BdgName"), mText
    End If
End If
ShowActiveFlexRow Mfgrd1

End Sub

Private Sub txtQryEttName_Change()
If fcmbEttName.CallFromText_Change = False Then
    fcmbEttName.CallFromText_Change = True
    If InterActiveChange(txtQryEttName) = True Then
        fcmbEttName.UserText = Array(txtQryEttName.Text, txtQryEttName.SelStart)
        fcmbEttName.Show
        txtQryEttName.Text = fcmbEttName.Text
        mQryEttCode = Val(fcmbEttName.BoundText)
        If fcmbEttName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbEttName.CallFromText_Change = False
End If

End Sub

Private Sub txtQryEttName_GotFocus()
FlashActiveControl txtQryEttName, True
End Sub

Private Sub txtQryEttName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtQryEttName_Change
ElseIf MyAddNewKey(Shift, KeyCode) = True Then
    Rem not required
End If

End Sub

Private Sub txtQryEttName_LostFocus()
FlashActiveControl txtQryEttName, False
End Sub

Private Sub txtSearch1Text_GotFocus()
FlashActiveControl txtSearch1Text, True
End Sub

Private Sub txtSearch1Text_LostFocus()
FlashActiveControl txtSearch1Text, False
End Sub

Private Sub txtQryBdgName_Change()
If fcmbBdgName.CallFromText_Change = False Then
    fcmbBdgName.CallFromText_Change = True
    If InterActiveChange(txtQryBdgName) = True Then
        fcmbBdgName.UserText = Array(txtQryBdgName.Text, txtQryBdgName.SelStart)
        fcmbBdgName.Show
        txtQryBdgName.Text = fcmbBdgName.Text
        mQryBdgCode = Val(fcmbBdgName.BoundText)
        If fcmbBdgName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbBdgName.CallFromText_Change = False
End If

End Sub

Private Sub txtQryBdgName_GotFocus()
FlashActiveControl txtQryBdgName, True
End Sub

Private Sub txtQryBdgName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtQryBdgName_Change
End If
End Sub

Private Sub txtQryBdgName_LostFocus()
FlashActiveControl txtQryBdgName, False
End Sub

Private Sub txtQryBdcName_Change()
If fcmbBdcName.CallFromText_Change = False Then
    fcmbBdcName.CallFromText_Change = True
    If InterActiveChange(txtQryBdcName) = True Then
        fcmbBdcName.UserText = Array(txtQryBdcName.Text, txtQryBdcName.SelStart)
        fcmbBdcName.Show
        txtQryBdcName.Text = fcmbBdcName.Text
        mQryBdcCode = Val(fcmbBdcName.BoundText)
        If fcmbBdcName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbBdcName.CallFromText_Change = False
End If

End Sub

Private Sub txtQryBdcName_GotFocus()
FlashActiveControl txtQryBdcName, True
End Sub

Private Sub txtQryBdcName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtQryBdcName_Change
End If
End Sub

Private Sub txtQryBdcName_LostFocus()
FlashActiveControl txtQryBdcName, False
End Sub

Private Sub txtQryBldName_Change()
If fcmbBldName.CallFromText_Change = False Then
    fcmbBldName.CallFromText_Change = True
    If InterActiveChange(txtQryBldName) = True Then
        fcmbBldName.UserText = Array(txtQryBldName.Text, txtQryBldName.SelStart)
        fcmbBldName.Show
        txtQryBldName.Text = fcmbBldName.Text
        mQryBldCode = Val(fcmbBldName.BoundText)
        If fcmbBldName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbBldName.CallFromText_Change = False
End If

End Sub

Private Sub txtQryBldName_GotFocus()
FlashActiveControl txtQryBldName, True
End Sub

Private Sub txtQryBldName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtQryBldName_Change
End If
End Sub

Private Sub txtQryBldName_LostFocus()
FlashActiveControl txtQryBldName, False
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

