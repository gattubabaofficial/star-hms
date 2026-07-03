VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmCollectionViewRep 
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
      ItemData        =   "CollView.frx":0000
      Left            =   1560
      List            =   "CollView.frx":000D
      Style           =   1  'Simple Combo
      TabIndex        =   4
      TabStop         =   0   'False
      Text            =   "cmbPatEntryMode"
      Top             =   360
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
      ItemData        =   "CollView.frx":0034
      Left            =   0
      List            =   "CollView.frx":0041
      Style           =   1  'Simple Combo
      TabIndex        =   3
      TabStop         =   0   'False
      Text            =   "cmbFormEntryMode"
      Top             =   360
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
      Top             =   720
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
         TabIndex        =   48
         Top             =   8760
         Width           =   1575
      End
      Begin VB.Frame frConfigure 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   9135
         Left            =   2760
         TabIndex        =   41
         Top             =   120
         Width           =   7935
         Begin VB.TextBox txtQrySrvName 
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
            Height          =   6255
            Left            =   3960
            TabIndex        =   22
            Top             =   2040
            Width           =   3735
            Begin VB.CheckBox chkFByOutdBlRefd 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Outdoor Bill Refund"
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
               Top             =   2400
               Value           =   1  'Checked
               Width           =   3015
            End
            Begin VB.CheckBox chkFByOutdBlPymt 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Outdoor Bill Payment"
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
               Top             =   2040
               Value           =   1  'Checked
               Width           =   3015
            End
            Begin VB.CheckBox chkFByIndoor 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Indoor Collection (All)"
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
               Top             =   2880
               Value           =   1  'Checked
               Width           =   3495
            End
            Begin VB.CheckBox chkFByOutdoor 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Outdoor Collection (All)"
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
               TabIndex        =   23
               Top             =   240
               Value           =   1  'Checked
               Width           =   3495
            End
            Begin VB.CheckBox chkFByIndrBlRefd 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Indoor Bill Refund"
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
               TabIndex        =   38
               Top             =   5760
               Value           =   1  'Checked
               Width           =   3015
            End
            Begin VB.CheckBox chkFByIndrBlPymt 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Indoor Bill Payment"
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
               TabIndex        =   37
               Top             =   5400
               Value           =   1  'Checked
               Width           =   3015
            End
            Begin VB.CheckBox chkFByIndrRgRefd 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Indoor On A/c.Refund"
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
               TabIndex        =   36
               Top             =   5040
               Value           =   1  'Checked
               Width           =   3015
            End
            Begin VB.CheckBox chkFByIndrRgPymt 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Indoor On A/c.Payment"
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
               TabIndex        =   35
               Top             =   4680
               Value           =   1  'Checked
               Width           =   3015
            End
            Begin VB.CheckBox chkFByIndrRefd 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Indoor Rcpt Refund"
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
               TabIndex        =   34
               Top             =   4320
               Value           =   1  'Checked
               Width           =   3015
            End
            Begin VB.CheckBox chkFByIndrPymt 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Indoor Rcpt Payment"
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
               TabIndex        =   33
               Top             =   3960
               Value           =   1  'Checked
               Width           =   3015
            End
            Begin VB.CheckBox chkFByIndrRcpt 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Indoor Receipts"
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
               Top             =   3600
               Value           =   1  'Checked
               Width           =   3015
            End
            Begin VB.CheckBox chkFByIndrReg 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Indoor Admit.Advance"
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
               Top             =   3240
               Value           =   1  'Checked
               Width           =   3015
            End
            Begin VB.CheckBox chkFByOutdRefd 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Outdoor Rcpt Refund"
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
               Top             =   1680
               Value           =   1  'Checked
               Width           =   3015
            End
            Begin VB.CheckBox chkFByOutdPymt 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Outdoor Rcpt Payment"
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
               TabIndex        =   26
               Top             =   1320
               Value           =   1  'Checked
               Width           =   3015
            End
            Begin VB.CheckBox chkFByOutdRcpt 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Outdoor Receipts"
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
               Top             =   960
               Value           =   1  'Checked
               Width           =   3015
            End
            Begin VB.CheckBox chkFByOutdReg 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Outdoor Registration"
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
               Top             =   600
               Value           =   1  'Checked
               Width           =   3015
            End
         End
         Begin VB.TextBox mskQryPttRegNo 
            Alignment       =   1  'Right Justify
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
            Text            =   "0"
            Top             =   960
            Width           =   1575
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
            TabIndex        =   39
            Top             =   8520
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
            Height          =   6255
            Left            =   120
            TabIndex        =   15
            Top             =   2040
            Width           =   3735
            Begin VB.OptionButton optServiceWise 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Service-wise"
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
               Top             =   2760
               Width           =   2535
            End
            Begin VB.OptionButton optPatientRegNoWise 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Patient Reg.No. wise"
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
               Top             =   2280
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
               Top             =   360
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
               Top             =   840
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
               Top             =   1320
               Width           =   2535
            End
            Begin VB.OptionButton optPatientNamewise 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Patient Name wise"
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
               Top             =   1800
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
         Begin VB.TextBox txtQryPttName 
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
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Service Name:"
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
            TabIndex        =   47
            Top             =   1680
            Width           =   1575
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Patient Reg.No:"
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
            TabIndex        =   46
            Top             =   960
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
            TabIndex        =   45
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
            TabIndex        =   44
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
            TabIndex        =   43
            Top             =   0
            Width           =   7935
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Patient Name:"
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
            TabIndex        =   42
            Top             =   1320
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
         TabIndex        =   50
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
         TabIndex        =   49
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
         TabIndex        =   40
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
      Caption         =   "Outdoor Registration"
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
      TabIndex        =   1
      Top             =   0
      Width           =   9015
   End
End
Attribute VB_Name = "frmCollectionViewRep"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim mFormLoaded As Boolean, mLastKeyPressed As Integer, mMaskKeyPressed As Integer
Dim mFormUIdCode As Long, mFormOpgUIdFileName As String, mFormOpgAcsPermFileName As String, mFormPatUIdFileName As String, mFormPatAcsPermFileName As String
Dim mOpgCode As Long, mPttCode As Long, mQryPttCode As Long, mQrySrvCode As Long, mOpgOldOpgCode As Long
Dim mRemoteAccess As Boolean, mEntrySaved As Boolean, mEntryAborted As Boolean
Dim dbAcDatabase As New ADODB.Connection, dbHmsDatabase As New ADODB.Connection, dbGrpDatabase As New ADODB.Connection, dbComDatabase As New ADODB.Connection
Dim datRecset As New ADODB.Recordset
Dim mOpgCode_old As Long, mPttCode_old As Long, mOpgDate_old As Date, mOpgTime_old As Date, mOpgVtmCode_old As Long, mOpgVchNo_old As Long, mPttName_old As String, mPttRegNo_old As Long, mPttPcgCode_old As Long, mPttAhCode_old As Long, mPttAgeChanged As Boolean, mPttAraCode_old As Long, mOpgCDctCode_old As Long, mOpgRByCode_old As Long, mOpgRToCode_old As Long
Dim mOpgSrvCode_old As Long
Dim clsJRN As clsJournal, clsAH As clsAccountHead, clsOPG As clsHmsSnglTranEntry, clsPAT As clsHmsMasterEntry, clsPCG As clsHmsMasterEntry, clsARA As clsComMastEntry, clsSTN As clsComMastEntry, clsVTM As clsComMastEntry, clsSRV As clsHmsMasterEntry, clsHOPT As clsHmsOpdOptionsEntry
Dim mActiveControl As Object, clsListStru As clsSelectQueryStructure
Dim fcmbAhName As clsComFlexSearch, fcmbAraName As clsComFlexSearch, fcmbStnName As clsComFlexSearch, fcmbVtmName As clsComFlexSearch
Dim fcmbOldOpgByOpgNo As clsHmsFlexSearch, fcmbOldOpgByPttRegNo As clsHmsFlexSearch, fcmbOldOpgByPttName As clsHmsFlexSearch, fcmbPttName As clsHmsFlexSearch, fcmbPttRegNo As clsHmsFlexSearch, fcmbPcgName As clsHmsFlexSearch, fcmbCDctName As clsHmsFlexSearch, fcmbRByName As clsHmsFlexSearch, fcmbFDigName As clsHmsFlexSearch, fcmbSrvName As clsHmsFlexSearch

Private Type SmryPara
mIndex() As Variant
mFromDate() As Variant
mToDate() As Variant
mPttRegNo() As Variant
mPttCode() As Variant
mSrvCode() As Variant
mDetailed() As Variant
mMonthwise() As Variant
mDatewise() As Variant
mPatNameWise() As Variant
mPatRegNoWise() As Variant
mServWise() As Variant

End Type

Dim SmryParaLayer As SmryPara

Private Sub ClearSmryParaLayer()

With SmryParaLayer
.mIndex = Array()
.mFromDate = Array()
.mToDate = Array()
.mPttRegNo = Array()
.mPttCode = Array()
.mSrvCode = Array()
.mDetailed = Array()
.mMonthwise = Array()
.mDatewise = Array()
.mPatNameWise = Array()
.mPatRegNoWise = Array()
.mServWise = Array()
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
    ReDim Preserve .mPttRegNo(mIndex)
    ReDim Preserve .mPttCode(mIndex)
    ReDim Preserve .mSrvCode(mIndex)
    ReDim Preserve .mDetailed(mIndex)
    ReDim Preserve .mMonthwise(mIndex)
    ReDim Preserve .mDatewise(mIndex)
    ReDim Preserve .mPatNameWise(mIndex)
    ReDim Preserve .mPatRegNoWise(mIndex)
    ReDim Preserve .mServWise(mIndex)
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
ReDim Preserve .mPttRegNo(mIndex)
ReDim Preserve .mPttCode(mIndex)
ReDim Preserve .mSrvCode(mIndex)
ReDim Preserve .mDetailed(mIndex)
ReDim Preserve .mMonthwise(mIndex)
ReDim Preserve .mDatewise(mIndex)
ReDim Preserve .mPatNameWise(mIndex)
ReDim Preserve .mPatRegNoWise(mIndex)
ReDim Preserve .mServWise(mIndex)
' -----------------------
.mIndex(mIndex) = mIndex
.mFromDate(mIndex) = Ctod(dtpFromDate.Text)
.mToDate(mIndex) = Ctod(dtpToDate.Text)
    fcmbPttRegNo.BoundText = CStr(mQryPttCode)
    fcmbPttName.BoundText = CStr(mQryPttCode)
    fcmbSrvName.BoundText = CStr(mQrySrvCode)
.mPttRegNo(mIndex) = Val(fcmbPttRegNo.Text)
.mPttCode(mIndex) = Val(fcmbPttName.BoundText)
.mSrvCode(mIndex) = Val(fcmbSrvName.BoundText)
.mDetailed(mIndex) = optDetailed.Value
.mMonthwise(mIndex) = optMonthwise.Value
.mDatewise(mIndex) = optDatewise.Value
.mPatNameWise(mIndex) = optPatientNamewise.Value
.mPatRegNoWise(mIndex) = optPatientRegNoWise.Value
.mServWise(mIndex) = optServiceWise.Value

End With

End Sub

Private Sub RestoreDefaultSmryPara()

dtpFromDate.Text = Dtoc(sFinYrStartDate)
dtpToDate.Text = Dtoc(sFinYrEndDate)
mQryPttCode = 0
mQrySrvCode = 0
mskQryPttRegNo.Text = "": fcmbPttRegNo.BoundText = ""
txtQryPttName.Text = "": fcmbPttName.BoundText = ""
txtQrySrvName.Text = "": fcmbSrvName.BoundText = ""
optDetailed.Value = False
optMonthwise.Value = True
optDatewise.Value = False
optPatientNamewise.Value = False
optPatientRegNoWise.Value = False
optServiceWise.Value = False
' ----------
AddSmryParaLayer mClear:=True

End Sub

Private Sub RestoreRecentSmryPara()
Dim mIndex As Integer

With SmryParaLayer
mIndex = UBound(.mIndex)
dtpFromDate.Text = Dtoc(.mFromDate(mIndex))
dtpToDate.Text = Dtoc(.mToDate(mIndex))
    mQryPttCode = .mPttCode(mIndex)
    mQrySrvCode = .mSrvCode(mIndex)
    fcmbPttRegNo.BoundText = CStr(mQryPttCode): mskQryPttRegNo.Text = fcmbPttRegNo.Text
    fcmbPttName.BoundText = CStr(mQryPttCode): txtQryPttName.Text = fcmbPttName.Text
    fcmbSrvName.BoundText = CStr(mQrySrvCode): txtQrySrvName.Text = fcmbSrvName.Text
optDetailed.Value = .mDetailed(mIndex)
optMonthwise.Value = .mMonthwise(mIndex)
optDatewise.Value = .mDatewise(mIndex)
optPatientNamewise.Value = .mPatNameWise(mIndex)
optPatientRegNoWise.Value = .mPatRegNoWise(mIndex)
optServiceWise.Value = .mServWise(mIndex)
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
'mOpgCode = mAccessCode
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
'Public Property Get PttName() As String
'PttName = txtPttName.Text
'End Property

Public Property Get FormAddEditMode() As Integer
FormAddEditMode = cmbFormEntryMode.ListIndex
End Property

Public Property Let FormAddEditMode(ByVal New_FormEntryMode As Integer)
cmbFormEntryMode.ListIndex = New_FormEntryMode
End Property

Private Sub chkFByIndoor_Click()
Dim mNewValue As Integer

mNewValue = chkFByIndoor.Value
If mNewValue = 0 Or mNewValue = 1 Then
    chkFByIndrReg.Value = mNewValue
    chkFByIndrRcpt.Value = mNewValue
    chkFByIndrPymt.Value = mNewValue
    chkFByIndrRefd.Value = mNewValue
    chkFByIndrBlPymt.Value = mNewValue
    chkFByIndrBlRefd.Value = mNewValue
    chkFByIndrRgPymt.Value = mNewValue
    chkFByIndrRgRefd.Value = mNewValue
End If

If mNewValue = 0 Then
    chkFByIndoor.Caption = "Indoor Collection (None)"
ElseIf mNewValue = 1 Then
    chkFByIndoor.Caption = "Indoor Collection (All)"
ElseIf mNewValue = 2 Then
    chkFByIndoor.Caption = "Indoor Collection (Partial)"
End If
Call ChkIndrSeleCriteria

End Sub

Private Sub chkFByIndoor_GotFocus()
FlashActiveControl chkFByIndoor, True
End Sub

Private Sub chkFByIndoor_LostFocus()
FlashActiveControl chkFByIndoor, False
End Sub

Private Sub chkFByIndrBlPymt_Click()
Call ChkIndrItemCheck
Call ChkIndrSeleCriteria
End Sub

Private Sub chkFByIndrBlRefd_Click()
Call ChkIndrItemCheck
Call ChkIndrSeleCriteria
End Sub

Private Sub chkFByIndrBlRefd_GotFocus()
FlashActiveControl chkFByIndrBlRefd, True
End Sub

Private Sub chkFByIndrBlRefd_LostFocus()
FlashActiveControl chkFByIndrBlRefd, False
End Sub

Private Sub chkFByIndrPymt_Click()
Call ChkIndrItemCheck
Call ChkIndrSeleCriteria
End Sub

Private Sub chkFByIndrPymt_GotFocus()
FlashActiveControl chkFByIndrPymt, True
End Sub

Private Sub chkFByIndrPymt_LostFocus()
FlashActiveControl chkFByIndrPymt, False
End Sub

Private Sub chkFByIndrRcpt_Click()
Call ChkIndrItemCheck
Call ChkIndrSeleCriteria
End Sub

Private Sub chkFByIndrRcpt_GotFocus()
FlashActiveControl chkFByIndrRcpt, True
End Sub

Private Sub chkFByIndrRcpt_LostFocus()
FlashActiveControl chkFByIndrRcpt, False
End Sub

Private Sub chkFByIndrRefd_Click()
Call ChkIndrItemCheck
Call ChkIndrSeleCriteria
End Sub

Private Sub chkFByIndrRefd_GotFocus()
FlashActiveControl chkFByIndrRefd, True
End Sub

Private Sub chkFByIndrRefd_LostFocus()
FlashActiveControl chkFByIndrRefd, False
End Sub

Private Sub chkFByIndrReg_Click()
Call ChkIndrItemCheck
Call ChkIndrSeleCriteria
End Sub

Private Sub chkFByIndrReg_GotFocus()
FlashActiveControl chkFByIndrReg, True
End Sub

Private Sub chkFByIndrReg_LostFocus()
FlashActiveControl chkFByIndrReg, False
End Sub

Private Sub chkFByIndrRgPymt_Click()
Call ChkIndrItemCheck
Call ChkIndrSeleCriteria
End Sub

Private Sub chkFByIndrRgRefd_Click()
Call ChkIndrItemCheck
Call ChkIndrSeleCriteria
End Sub

Private Sub chkFByIndrRgRefd_GotFocus()
FlashActiveControl chkFByIndrRgRefd, True
End Sub

Private Sub chkFByIndrRgRefd_LostFocus()
FlashActiveControl chkFByIndrRgRefd, False
End Sub

Private Sub chkFByOutdBlPymt_Click()
Call ChkOutdItemCheck
Call ChkOutdSeleCriteria
End Sub

Private Sub chkFByOutdBlPymt_GotFocus()
FlashActiveControl chkFByOutdBlPymt, True
End Sub

Private Sub chkFByOutdBlPymt_LostFocus()
FlashActiveControl chkFByOutdBlPymt, False
End Sub

Private Sub chkFByOutdBlRefd_Click()
Call ChkOutdItemCheck
Call ChkOutdSeleCriteria
End Sub

Private Sub chkFByOutdBlRefd_GotFocus()
FlashActiveControl chkFByOutdBlRefd, True
End Sub

Private Sub chkFByOutdBlRefd_LostFocus()
FlashActiveControl chkFByOutdBlRefd, False
End Sub

Private Sub chkFByOutdoor_Click()
Dim mNewValue As Integer

mNewValue = chkFByOutdoor.Value
If mNewValue = 0 Or mNewValue = 1 Then
    chkFByOutdReg.Value = mNewValue
    chkFByOutdRcpt.Value = mNewValue
    chkFByOutdPymt.Value = mNewValue
    chkFByOutdRefd.Value = mNewValue
    chkFByOutdBlPymt.Value = mNewValue
    chkFByOutdBlRefd.Value = mNewValue
End If
If mNewValue = 0 Then
    chkFByOutdoor.Caption = "Outdoor Collection (None)"
ElseIf mNewValue = 1 Then
    chkFByOutdoor.Caption = "Outdoor Collection (All)"
ElseIf mNewValue = 2 Then
    chkFByOutdoor.Caption = "Outdoor Collection (Partial)"
End If
Call ChkOutdSeleCriteria

End Sub

Private Sub chkFByOutdoor_GotFocus()
FlashActiveControl chkFByOutdoor, True
End Sub

Private Sub chkFByOutdoor_LostFocus()
FlashActiveControl chkFByOutdoor, False
End Sub

Private Sub chkFByOutdPymt_Click()
Call ChkOutdItemCheck
Call ChkOutdSeleCriteria
End Sub

Private Sub chkFByOutdPymt_GotFocus()
FlashActiveControl chkFByOutdPymt, True
End Sub

Private Sub chkFByOutdPymt_LostFocus()
FlashActiveControl chkFByOutdPymt, False
End Sub

Private Sub chkFByOutdRcpt_Click()
Call ChkOutdItemCheck
Call ChkOutdSeleCriteria
End Sub

Private Sub chkFByOutdRcpt_GotFocus()
FlashActiveControl chkFByOutdRcpt, True
End Sub

Private Sub chkFByOutdRcpt_LostFocus()
FlashActiveControl chkFByOutdRcpt, False
End Sub

Private Sub chkFByOutdRefd_Click()
Call ChkOutdItemCheck
Call ChkOutdSeleCriteria
End Sub

Private Sub chkFByOutdRefd_GotFocus()
FlashActiveControl chkFByOutdRefd, True
End Sub

Private Sub chkFByOutdRefd_LostFocus()
FlashActiveControl chkFByOutdRefd, False
End Sub

Private Sub chkFByOutdReg_Click()
Call ChkOutdItemCheck
Call ChkOutdSeleCriteria
End Sub

Private Sub chkFByOutdReg_GotFocus()
FlashActiveControl chkFByOutdReg, True
End Sub

Private Sub chkFByOutdReg_LostFocus()
FlashActiveControl chkFByOutdReg, False
End Sub

Private Sub chkFByIndrBlPymt_GotFocus()
FlashActiveControl chkFByIndrBlPymt, True
End Sub

Private Sub chkFByIndrBlPymt_LostFocus()
FlashActiveControl chkFByIndrBlPymt, False
End Sub

Private Sub chkFByIndrRgPymt_GotFocus()
FlashActiveControl chkFByIndrRgPymt, True
End Sub

Private Sub chkFByIndrRgPymt_LostFocus()
FlashActiveControl chkFByIndrRgPymt, False
End Sub

Private Sub ChkOutdItemCheck()

If chkFByOutdReg.Value = 1 And chkFByOutdRcpt.Value = 1 And chkFByOutdPymt.Value = 1 And chkFByOutdRefd.Value = 1 And chkFByOutdBlPymt.Value = 1 And chkFByOutdBlRefd.Value = 1 Then
    chkFByOutdoor.Value = 1
ElseIf chkFByOutdReg.Value = 1 Or chkFByOutdRcpt.Value = 1 Or chkFByOutdPymt.Value = 1 Or chkFByOutdRefd.Value = 1 Or chkFByOutdBlPymt.Value = 1 Or chkFByOutdBlRefd.Value = 1 Then
    chkFByOutdoor.Value = 2
Else
    chkFByOutdoor.Value = 0
End If

End Sub

Private Sub ChkIndrItemCheck()

If chkFByIndrReg.Value = 1 And chkFByIndrRcpt.Value = 1 And chkFByIndrPymt.Value = 1 And chkFByIndrRefd.Value = 1 And chkFByIndrBlPymt.Value = 1 And chkFByIndrBlRefd.Value = 1 And chkFByIndrRgPymt.Value = 1 And chkFByIndrRgRefd.Value = 1 Then
    chkFByIndoor.Value = 1
ElseIf chkFByIndrReg.Value = 1 Or chkFByIndrRcpt.Value = 1 Or chkFByIndrPymt.Value = 1 Or chkFByIndrRefd.Value = 1 Or chkFByIndrBlPymt.Value = 1 Or chkFByIndrBlRefd.Value = 1 Or chkFByIndrRgPymt.Value = 1 Or chkFByIndrRgRefd.Value = 1 Then
    chkFByIndoor.Value = 2
Else
    chkFByIndoor.Value = 0
End If

End Sub

Private Sub ChkOutdSeleCriteria()

If chkFByOutdReg.Value = 1 And chkFByOutdRcpt.Value = 1 And chkFByOutdPymt.Value = 1 And chkFByOutdRefd.Value = 1 And chkFByOutdBlPymt.Value = 1 And chkFByOutdBlRefd.Value = 1 Then
    lblOutdSeleCriteria.Caption = chkFByOutdoor.Caption
ElseIf chkFByOutdReg.Value = 1 Or chkFByOutdRcpt.Value = 1 Or chkFByOutdPymt.Value = 1 Or chkFByOutdRefd.Value = 1 Or chkFByOutdBlPymt.Value = 1 Or chkFByOutdBlRefd.Value = 1 Then
    With lblOutdSeleCriteria
    .Caption = ""
    If chkFByOutdReg.Value = 1 Then
        .Caption = .Caption & chkFByOutdReg.Caption & ", "
    End If
    If chkFByOutdRcpt.Value = 1 Then
        .Caption = .Caption & chkFByOutdRcpt.Caption & ", "
    End If
    If chkFByOutdPymt.Value = 1 Then
        .Caption = .Caption & chkFByOutdPymt.Caption & ", "
    End If
    If chkFByOutdRefd.Value = 1 Then
        .Caption = .Caption & chkFByOutdRefd.Caption & ", "
    End If
    If chkFByOutdBlPymt.Value = 1 Then
        .Caption = .Caption & chkFByOutdBlPymt.Caption & ", "
    End If
    If chkFByOutdBlRefd.Value = 1 Then
        .Caption = .Caption & chkFByOutdBlRefd.Caption & ", "
    End If
    If Right(.Caption, 2) = ", " Then
        .Caption = Left(.Caption, Len(.Caption) - 2)
    End If
    End With
    
Else
    lblOutdSeleCriteria.Caption = chkFByOutdoor.Caption
End If

End Sub

Private Sub ChkIndrSeleCriteria()

If chkFByIndrReg.Value = 1 And chkFByIndrRcpt.Value = 1 And chkFByIndrPymt.Value = 1 And chkFByIndrRefd.Value = 1 And chkFByIndrBlPymt.Value = 1 And chkFByIndrBlRefd.Value = 1 And chkFByIndrRgPymt.Value = 1 And chkFByIndrRgRefd.Value = 1 Then
    lblIndrSeleCriteria.Caption = chkFByIndoor.Caption
ElseIf chkFByIndrReg.Value = 1 Or chkFByIndrRcpt.Value = 1 Or chkFByIndrPymt.Value = 1 Or chkFByIndrRefd.Value = 1 Or chkFByIndrBlPymt.Value = 1 Or chkFByIndrBlRefd.Value = 1 Or chkFByIndrRgPymt.Value = 1 Or chkFByIndrRgRefd.Value = 1 Then
    With lblIndrSeleCriteria
    .Caption = ""
    If chkFByIndrReg.Value = 1 Then
        .Caption = .Caption & chkFByIndrReg.Caption & ", "
    End If
    If chkFByIndrRcpt.Value = 1 Then
        .Caption = .Caption & chkFByIndrRcpt.Caption & ", "
    End If
    If chkFByIndrPymt.Value = 1 Then
        .Caption = .Caption & chkFByIndrPymt.Caption & ", "
    End If
    If chkFByIndrRefd.Value = 1 Then
        .Caption = .Caption & chkFByIndrRefd.Caption & ", "
    End If
    If chkFByIndrBlPymt.Value = 1 Then
        .Caption = .Caption & chkFByIndrBlPymt.Caption & ", "
    End If
    If chkFByIndrBlRefd.Value = 1 Then
        .Caption = .Caption & chkFByIndrBlRefd.Caption & ", "
    End If
    If chkFByIndrRgPymt.Value = 1 Then
        .Caption = .Caption & chkFByIndrRgPymt.Caption & ", "
    End If
    If chkFByIndrRgRefd.Value = 1 Then
        .Caption = .Caption & chkFByIndrRgRefd.Caption & ", "
    End If
    If Right(.Caption, 2) = ", " Then
        .Caption = Left(.Caption, Len(.Caption) - 2)
    End If
    End With
Else
    lblIndrSeleCriteria.Caption = chkFByIndoor.Caption
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
            If optDetailed.Value = True Then
                Call Data_EditEvent
            Else
                fcmbPttRegNo.BoundText = CStr(mQryPttCode)
                fcmbPttName.BoundText = CStr(mQryPttCode)
                fcmbSrvName.BoundText = CStr(mQrySrvCode)
                
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
                    
                ElseIf optPatientNamewise.Value = True Then
                    mQryPttCode = .fields("TrnPttCode")
                    fcmbPttRegNo.BoundText = CStr(mQryPttCode)
                    fcmbPttName.BoundText = CStr(mQryPttCode)
                    mskQryPttRegNo.Text = fcmbPttRegNo.Text
                    txtQryPttName.Text = fcmbPttName.Text
                    optPatientNamewise.Value = False
                    optDatewise.Value = True
                    
                ElseIf optPatientRegNoWise.Value = True Then
                    mQryPttCode = .fields("TrnPttCode")
                    fcmbPttRegNo.BoundText = CStr(mQryPttCode)
                    fcmbPttName.BoundText = CStr(mQryPttCode)
                    mskQryPttRegNo.Text = fcmbPttRegNo.Text
                    txtQryPttName.Text = fcmbPttName.Text
                    optPatientRegNoWise.Value = False
                    optDatewise.Value = True
                    
                ElseIf optServiceWise.Value = True Then
                    mQrySrvCode = .fields("TrnSrvCode")
                    fcmbSrvName.BoundText = CStr(mQrySrvCode)
                    txtQrySrvName.Text = fcmbSrvName.Text
                    optServiceWise.Value = False
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
'        'txtPttName.SetFocus
'    End If
End If

End Sub

'Private Sub cmdSaveForm_Click()
'txtVoid.SetFocus
'Call Data_SaveEvent
'Call SmryList
'
'If optDetailed.Value = True Then
'    txtSearch1Text_InterActiveChange Format(Ctod(dtpOpgDate.Text), "yyyymmdd") + Format(mOpgCode, "0000000")
'ElseIf optMonthwise.Value = True Then
'    txtSearch1Text_InterActiveChange Format(Ctod(dtpOpgDate.Text), "yyyy") & "/" & Format(Ctod(dtpOpgDate.Text), "mm")
'ElseIf optDatewise.Value = True Then
'    txtSearch1Text_InterActiveChange Format(Ctod(dtpOpgDate.Text), "yyyymmdd")
'ElseIf optPatientNamewise.Value = True Then
'    txtSearch1Text_InterActiveChange txtPttName.Text
'ElseIf optPatientRegNoWise.Value = True Then
'    txtSearch1Text_InterActiveChange mskPttRegNo.Text
'ElseIf optServiceWise.Value = True Then
'    txtSearch1Text_InterActiveChange txtSrvName.Text
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
'            txtPttName.SetFocus
'        End If
'    Else
'        txtPttName.SetFocus
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

'Private Sub dtpOpgDate_GotFocus()
'FlashActiveControl dtpOpgDate, True
'End Sub
'
'Private Sub dtpOpgDate_LostFocus()
'FlashActiveControl dtpOpgDate, False
'End Sub
'
'Private Sub dtpOpgDate_Validate(Cancel As Boolean)
'dtpOpgDate.Text = ToMyDate(dtpOpgDate.Text)
'If IsFinYrDate(Ctod(dtpOpgDate.Text)) = False Then
'    ErrorBox "Invalid Input !!!"
'    dtpOpgDate.SetFocus
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
If mFormLoaded = False Then
'    If mRemoteAccess = True Then
'        If mOpgCode = 0 Then
'            Call Data_AddEvent
'        Else
'            Call Data_EditEvent
'        End If
'    Else
        MoveRecToFirst datRecset
        ShowRecActiveFlexRow datRecset, Mfgrd1
        Mfgrd1.SetFocus
'    End If
Else
    RefreshDatabase dbHmsDatabase
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

mFormOpgUIdFileName = "CollRep.Uid"
mFormOpgAcsPermFileName = "CollRep.Acp"
mFormUIdCode = GetUIdCode(mProcess:=Me.Name, mUIdFileName:=mFormOpgUIdFileName, mAcsPermFileName:=mFormOpgAcsPermFileName)
mFormPatUIdFileName = "PatMast.Uid"
mFormPatAcsPermFileName = "PatMast.Acp"

mFormLoaded = False
mEntrySaved = False: mEntryAborted = False
SetFormSize Me, frmMain
Call Form_Resize
chkFByOutdoor.Value = 1
chkFByIndoor.Value = 1
Call chkFByOutdoor_Click
Call chkFByIndoor_Click

Call SetVoidControl(txtVoid)
txtSearch1Text.Enabled = False
frConfigure.Visible = False
'txtOpgPrefix.Enabled = False

OpenAcDataSource dbAcDatabase
OpenHmsDataSource dbHmsDatabase
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

Set clsHOPT = New clsHmsOpdOptionsEntry
clsHOPT.blnOutdRegOptMast = True
clsHOPT.Init
clsHOPT.GetOutdRegOptData

Set clsAH = New clsAccountHead
Set clsAH.dbAcDatabase = dbAcDatabase
Set clsAH.dbGrpDatabase = dbGrpDatabase

Set clsOPG = New clsHmsSnglTranEntry
Set clsOPG.dbAcDatabase = dbAcDatabase
Set clsOPG.dbHmsDatabase = dbHmsDatabase
clsOPG.blnOutdRegTran = True
clsOPG.Init

Set clsPAT = New clsHmsMasterEntry
Set clsPAT.dbAcDatabase = dbAcDatabase
Set clsPAT.dbHmsDatabase = dbHmsDatabase
clsPAT.blnPatMast = True
clsPAT.Init

Set clsPCG = New clsHmsMasterEntry
Set clsPCG.dbHmsDatabase = dbHmsDatabase
clsPCG.blnPatCatgMast = True
clsPCG.Init

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

Set clsSRV = New clsHmsMasterEntry
Set clsSRV.dbHmsDatabase = dbHmsDatabase
clsSRV.blnServMast = True
clsSRV.Init

Set fcmbAhName = New clsComFlexSearch
Set fcmbAhName.dbAcDatabase = dbAcDatabase
fcmbAhName.blnAchdMastList = True
fcmbAhName.Init

Set fcmbPcgName = New clsHmsFlexSearch
Set fcmbPcgName.dbHmsDatabase = dbHmsDatabase
fcmbPcgName.blnPatCatgMstList = True
fcmbPcgName.Init

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
fcmbVtmName.mListSqlExpr = "Select * from VTypMast where VtmSysCode=" & CStr(cHMS_VTYPE_OUTDOOR_REG) & " order by VtmName"
fcmbVtmName.Init

Set fcmbCDctName = New clsHmsFlexSearch
Set fcmbCDctName.dbHmsDatabase = dbHmsDatabase
fcmbCDctName.blnDoctMastList = True
fcmbCDctName.Init

Set fcmbRByName = New clsHmsFlexSearch
Set fcmbRByName.dbHmsDatabase = dbHmsDatabase
fcmbRByName.blnRefByMastList = True
fcmbRByName.Init

Set fcmbFDigName = New clsHmsFlexSearch
Set fcmbFDigName.dbHmsDatabase = dbHmsDatabase
fcmbFDigName.blnDiagMastList = True
fcmbFDigName.Init

Set fcmbSrvName = New clsHmsFlexSearch
Set fcmbSrvName.dbHmsDatabase = dbHmsDatabase
fcmbSrvName.blnServMastList = True
fcmbSrvName.Init

Set fcmbPttRegNo = New clsHmsFlexSearch
Set fcmbPttRegNo.dbHmsDatabase = dbHmsDatabase
Set fcmbPttRegNo.dbComDatabase = dbComDatabase
fcmbPttRegNo.blnPatMastListByRegNo = True
fcmbPttRegNo.Init

Set fcmbPttName = New clsHmsFlexSearch
Set fcmbPttName.dbHmsDatabase = dbHmsDatabase
Set fcmbPttName.dbComDatabase = dbComDatabase
fcmbPttName.blnPatMastListByName = True
fcmbPttName.Init

Set fcmbOldOpgByOpgNo = New clsHmsFlexSearch
Set fcmbOldOpgByOpgNo.dbHmsDatabase = dbHmsDatabase
Set fcmbOldOpgByOpgNo.dbComDatabase = dbComDatabase
fcmbOldOpgByOpgNo.blnOldOpgListByOpgNo = True
fcmbOldOpgByOpgNo.Init

Set fcmbOldOpgByPttRegNo = New clsHmsFlexSearch
Set fcmbOldOpgByPttRegNo.dbHmsDatabase = dbHmsDatabase
Set fcmbOldOpgByPttRegNo.dbComDatabase = dbComDatabase
fcmbOldOpgByPttRegNo.blnOldOpgListByPttRegNo = True
fcmbOldOpgByPttRegNo.Init

Set fcmbOldOpgByPttName = New clsHmsFlexSearch
Set fcmbOldOpgByPttName.dbHmsDatabase = dbHmsDatabase
Set fcmbOldOpgByPttName.dbComDatabase = dbComDatabase
fcmbOldOpgByPttName.blnOldOpgListByPttName = True
fcmbOldOpgByPttName.Init

Call RestoreDefaultSmryPara
If mRemoteAccess = True Then
    optDetailed.Value = True
    AddSmryParaLayer mClear:=True
End If

If mRemoteAccess = True Then
    'datRecset.Open "Select * from OutdReg left join PatMast on OutdReg.OpgPttCode=PatMast.PttCode where OpgCode=" & CStr(mOpgCode) & " order by OpgDate,OpgTime", dbHmsDatabase, adOpenKeyset, adLockOptimistic
Else
    'datRecset.Open "Select * from OutdReg left join PatMast on OutdReg.OpgPttCode=PatMast.PttCode order by OpgDate,OpgTime", dbHmsDatabase, adOpenKeyset, adLockOptimistic
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
Set clsHOPT = Nothing
Set clsJRN = Nothing
Set clsAH = Nothing
Set clsOPG = Nothing
Set clsPAT = Nothing
Set clsPCG = Nothing
Set clsARA = Nothing
Set clsSTN = Nothing
Set clsVTM = Nothing
Set clsSRV = Nothing
Set fcmbOldOpgByOpgNo = Nothing
Set fcmbOldOpgByPttRegNo = Nothing
Set fcmbOldOpgByPttName = Nothing
Set fcmbPttRegNo = Nothing
Set fcmbPttName = Nothing
Set fcmbAhName = Nothing
Set fcmbPcgName = Nothing
Set fcmbAraName = Nothing
Set fcmbStnName = Nothing
Set fcmbVtmName = Nothing
Set fcmbCDctName = Nothing
Set fcmbRByName = Nothing
Set fcmbFDigName = Nothing
Set fcmbSrvName = Nothing
Set clsListStru = Nothing

CloseTable datRecset
CloseDataSource dbAcDatabase
CloseDataSource dbHmsDatabase
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
'Dim mPttRegNo As Long, mOpgVchNo As Long, mOpgPttCode As Long
'
'Data_Verify = False
'If FormAddEditMode = cFORM_EDITMODE And Val(mskFormBoundField.Text) < 1 Then
'    ErrorBox "Invalid Key Value !!!"
'    txtPttName.SetFocus
'    GoTo EndSub
'End If
'
'Rem patient validation
'mOpgPttCode = Val(mskPttCode.Text)
'If mOpgPttCode < 1 And FormAddEditMode = cFORM_EDITMODE Then
'    ErrorBox "Invalid Key Value !!!"
'    txtPttName.SetFocus
'    GoTo EndSub
'End If
'If Trim(txtPttName.Text) = "" Then
'    ErrorBox "Invalid Input !!!"
'    txtPttName.SetFocus
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
'                    mPttRegNo = GetNextSeqno(dbHmsDatabase, "PatMast", "PttRegNo")
'                    mskPttRegNo.Text = ToMyNumFmt(mPttRegNo, mDecimals:=0)
'                End If
'            Else
'                mskPttRegNo.Text = ToMyNumFmt(mPttRegNo_old, mDecimals:=0)
'            End If
'            mskPttRegNo.SetFocus
'            GoTo EndSub
'
'        ElseIf mPttRegNo <> 0 Then
'            If ChkIsDuplicate(dbHmsDatabase, "PatMast", "PttRegNo", mPttRegNo, "PttCode", mOpgPttCode) = True Then
'                ErrorBox "Duplicate Patient Reg.No. !!!"
'                mskPttRegNo.SetFocus
'                ' -----------
'                If FormAddEditMode = cFORM_ADDMODE Then
'                    If clsHOPT.mOpgPttRegNoAutoNumber_bln = True Then
'                        mPttRegNo = GetNextSeqno(dbHmsDatabase, "PatMast", "PttRegNo")
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
'    ErrorBox "Invalid Discount Percentage !!!"
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
'    If mOpgVchNo <> mOpgVchNo_old Or Val(fcmbVtmName.BoundText) <> mOpgVtmCode_old Or Ctod(dtpOpgDate.Text) <> mOpgDate_old Or FormAddEditMode = cFORM_ADDMODE Then
'        If ChkIsDuplVTypeNo(dbHmsDatabase, dbAcDatabase, mTableName:="OutdReg", mChkFieldName:="OpgVchNo", mChkFieldValue:=mOpgVchNo, mKeyFieldName:="OpgCode", mKeyFieldValue:=mOpgCode, mVtmFieldName:="OpgVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="OpgCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="OpgDate", mDateFieldValue:=Ctod(dtpOpgDate.Text)) = True Then
'            ErrorBox "Duplicate Voucher No. !!!"
'            mskOpgVchNo.SetFocus
'            ' ---------------
'            If FormAddEditMode = True Then
'                mOpgVchNo = GetNextVTypeNo(dbHmsDatabase, dbAcDatabase, dbComDatabase, mTableName:="OutdReg", mFieldName:="OpgVchNo", mVtmFieldName:="OpgVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="OpgCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="OpgDate", mDateFieldValue:=Ctod(dtpOpgDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormOpgAcsPermFileName)
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
'If IsDate(dtpOpgDate.Text) = False Then
'    ErrorBox "Invalid Input !!!"
'    dtpOpgDate.SetFocus
'    GoTo EndSub
'Else
'    If IsFinYrDate(Ctod(dtpOpgDate.Text)) = False Then
'        ErrorBox "Invalid Input !!!"
'        dtpOpgDate.SetFocus
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
'If Val(fcmbSrvName.BoundText) <= 0 Then
'    ErrorBox "Invalid Selection !!!"
'    txtSrvName.SetFocus
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
'If Val(UnMyNumFmt(mskOpgDiscAmt.Text)) < 0 Then
'    ErrorBox "Invalid Input !!!"
'    mskOpgDiscAmt.SetFocus
'    GoTo EndSub
'End If
'If Val(UnMyNumFmt(mskOpgAmtAftDisc.Text)) < 0 Then
'    ErrorBox "Invalid Input !!!"
'    mskOpgAmtAftDisc.SetFocus
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
'Dim mOpgVchNo As Long, mPttRegNo As Long, mOpgPttCode As Long
'Data_NetwAuth = False
'
'mOpgPttCode = Val(mskPttCode.Text)
'mPttRegNo = Val(UnMyNumFmt(mskPttRegNo.Text))
'If mPttRegNo <> mPttRegNo_old Or FormAddEditMode = cFORM_ADDMODE Then
'    If mPttRegNo <> 0 Then
'        If ChkIsDuplicate(dbHmsDatabase, "PatMast", "PttRegNo", mPttRegNo, "PttCode", mOpgPttCode) = True Then
'            ErrorBox "Duplicate Patient Reg.No. !!!"
'            mskPttRegNo.SetFocus
'            ' -------
'            If FormAddEditMode = cFORM_ADDMODE Then
'                If clsHOPT.mOpgPttRegNoAutoNumber_bln = True Then
'                    mPttRegNo = GetNextSeqno(dbHmsDatabase, "PatMast", "PttRegNo")
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
'If mOpgVchNo <> mOpgVchNo_old Or Val(fcmbVtmName.BoundText) <> mOpgVtmCode_old Or Ctod(dtpOpgDate.Text) <> mOpgDate_old Or FormAddEditMode = cFORM_ADDMODE Then
'    If ChkIsDuplVTypeNo(dbHmsDatabase, dbAcDatabase, mTableName:="OutdReg", mChkFieldName:="OpgVchNo", mChkFieldValue:=mOpgVchNo, mKeyFieldName:="OpgCode", mKeyFieldValue:=mOpgCode, mVtmFieldName:="OpgVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="OpgCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="OpgDate", mDateFieldValue:=Ctod(dtpOpgDate.Text)) = True Then
'        ErrorBox "Duplicate Voucher No. !!!"
'        mskOpgVchNo.SetFocus
'        ' ---------------
'        If FormAddEditMode = True Then
'            mOpgVchNo = GetNextVTypeNo(dbHmsDatabase, dbAcDatabase, dbComDatabase, mTableName:="OutdReg", mFieldName:="OpgVchNo", mVtmFieldName:="OpgVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="OpgCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="OpgDate", mDateFieldValue:=Ctod(dtpOpgDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormOpgAcsPermFileName)
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

'Private Sub mskOpgAmtAftDisc_GotFocus()
'FlashActiveControl mskOpgAmtAftDisc, True
'End Sub
'
'Private Sub mskOpgAmtAftDisc_LostFocus()
'FlashActiveControl mskOpgAmtAftDisc, False
'End Sub
'
'Private Sub mskOpgAmtAftDisc_Validate(Cancel As Boolean)
'mskOpgAmtAftDisc.Text = ToMyNumFmt(mskOpgAmtAftDisc.Text)
'If Val(UnMyNumFmt(mskOpgAmtAftDisc.Text)) < 0 Then
'    ErrorBox "Invalid Input !!!"
'    mskOpgAmtAftDisc.SetFocus
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
'Private Sub mskOpgDiscAmt_GotFocus()
'FlashActiveControl mskOpgDiscAmt, True
'End Sub
'
'Private Sub mskOpgDiscAmt_LostFocus()
'FlashActiveControl mskOpgDiscAmt, False
'End Sub
'
'Private Sub mskOpgDiscAmt_Validate(Cancel As Boolean)
'mskOpgDiscAmt.Text = ToMyNumFmt(mskOpgDiscAmt.Text)
'If Val(UnMyNumFmt(mskOpgDiscAmt.Text)) < 0 Then
'    ErrorBox "Invalid Input !!!"
'    mskOpgDiscAmt.SetFocus
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
'    mOpgVchNo = GetNextVTypeNo(dbHmsDatabase, dbAcDatabase, dbComDatabase, mTableName:="OutdReg", mFieldName:="OpgVchNo", mVtmFieldName:="OpgVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="OpgCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="OpgDate", mDateFieldValue:=Ctod(dtpOpgDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormOpgAcsPermFileName)
'    mskOpgVchNo.Text = ToMyNumFmt(mOpgVchNo, mDecimals:=0)
'ElseIf mOpgVchNo > 0 Then
'    If mOpgVchNo <> mOpgVchNo_old Or Val(fcmbVtmName.BoundText) <> mOpgVtmCode_old Or Ctod(dtpOpgDate.Text) <> mOpgDate_old Or FormAddEditMode = cFORM_ADDMODE Then
'        If ChkIsDuplVTypeNo(dbHmsDatabase, dbAcDatabase, mTableName:="OutdReg", mChkFieldName:="OpgVchNo", mChkFieldValue:=CStr(mOpgVchNo), mKeyFieldName:="OpgCode", mKeyFieldValue:=mOpgCode, mVtmFieldName:="OpgVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="OpgCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="OpgDate", mDateFieldValue:=Ctod(dtpOpgDate.Text)) = True Then
'            ErrorBox "Duplicate Voucher No. !!!"
'            Cancel = True
'            mskOpgVchNo.SetFocus
'            ' ----------
'            Rem RemoveNetwVchNo dbComDatabase, mVtmCode:=Val(fcmbVtmName.BoundText), mVchNo:=mOpgVchNo, mVchDate:=Ctod(dtpOpgDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mShowFailedMsg:=False
'            If FormAddEditMode = cFORM_ADDMODE Then
'                mOpgVchNo = GetNextVTypeNo(dbHmsDatabase, dbAcDatabase, dbComDatabase, mTableName:="OutdReg", mFieldName:="OpgVchNo", mVtmFieldName:="OpgVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="OpgCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="OpgDate", mDateFieldValue:=Ctod(dtpOpgDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormOpgAcsPermFileName)
'            Else
'                mOpgVchNo = mOpgVchNo_old
'            End If
'            mskOpgVchNo.Text = ToMyNumFmt(mOpgVchNo, mDecimals:=0)
'        Rem Else
'        Rem     GetNextVTypeNo dbHmsDatabase, dbAcDatabase, dbComDatabase, mTableName:="OutdReg", mFieldName:="OpgVchNo", mVtmFieldName:="OpgVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="OpgCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="OpgDate", mDateFieldValue:=Ctod(dtpOpgDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormOpgAcsPermFileName, mDeletedVchNo:=mOpgVchNo
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
'    ErrorBox "Invalid Discount Percentage !!!"
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
'                    clsPAT.EndMast mPttCode
'
'                    PatAddEditMode = cFORM_EDITMODE
'                    mPttCode = Val(fcmbPttRegNo.BoundText)
'                    If clsPAT.BeginMast(mPttCode) = True Then
'                        mPttCode = clsPAT.ActiveCode
'                    Else
'                        mPttCode = 0
'                    End If
'                    ShowPttDiscPer mPttCode
'                    mOpgOldOpgCode = GetOldOpgCodeFromPttCode(mPttCode)
'                    ShowOldOpgCodeDesc mOpgOldOpgCode
'                    ShowPatData mPttCode
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
'        clsPAT.EndMast mPttCode
'
'        PatAddEditMode = cFORM_ADDMODE
'        If clsPAT.BeginMast(0) = True Then
'            mPttCode = clsPAT.ActiveCode
'        Else
'            mPttCode = 0
'        End If
'        ShowPttDiscPer mPttCode
'        mOpgOldOpgCode = 0
'        ShowOldOpgCodeDesc mOpgOldOpgCode
'        ShowPatData mPttCode
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
'Dim mPttRegNo As Long, mOpgPttCode As Long
'
'mOpgPttCode = Val(mskPttCode.Text)
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
'                    mPttRegNo = GetNextSeqno(dbHmsDatabase, "PatMast", "PttRegNo")
'                    mskPttRegNo.Text = ToMyNumFmt(mPttRegNo, mDecimals:=0)
'                End If
'            Else
'                mskPttRegNo.Text = ToMyNumFmt(mPttRegNo_old, mDecimals:=0)
'            End If
'            Cancel = True
'            mskPttRegNo.SetFocus
'        ElseIf mPttRegNo <> 0 Then
'            If ChkIsDuplicate(dbHmsDatabase, "PatMast", "PttRegNo", mPttRegNo, "PttCode", mOpgPttCode) = True Then
'                ErrorBox "Duplicate Patient Reg.No. !!!"
'                Cancel = True
'                mskPttRegNo.SetFocus
'                ' -----------
'                If FormAddEditMode = cFORM_ADDMODE Then
'                    If clsHOPT.mOpgPttRegNoAutoNumber_bln = True Then
'                        mPttRegNo = GetNextSeqno(dbHmsDatabase, "PatMast", "PttRegNo")
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

Private Sub mskQryPttRegNo_Change()
If fcmbPttRegNo.CallFromText_Change = False Then
    fcmbPttRegNo.CallFromText_Change = True
    If InterActiveChange(mskQryPttRegNo) = True Then
        fcmbPttRegNo.UserText = Array(mskQryPttRegNo.Text, mskQryPttRegNo.SelStart)
        fcmbPttRegNo.Show
        mskQryPttRegNo.Text = fcmbPttRegNo.Text
        mQryPttCode = Val(fcmbPttRegNo.BoundText)
        fcmbPttName.BoundText = CStr(mQryPttCode)
        txtQryPttName.Text = fcmbPttName.Text
        If fcmbPttRegNo.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbPttRegNo.CallFromText_Change = False
End If

End Sub

Private Sub mskQryPttRegNo_GotFocus()
FlashActiveControl mskQryPttRegNo, True
End Sub

Private Sub mskQryPttRegNo_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call mskQryPttRegNo_Change
ElseIf MyAddNewKey(Shift, KeyCode) = True Then
    Rem not required here
End If

End Sub

Private Sub mskQryPttRegNo_LostFocus()
FlashActiveControl mskQryPttRegNo, False
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

Private Sub optPatientNameWise_GotFocus()
FlashActiveControl optPatientNamewise, True
End Sub

Private Sub optPatientNameWise_LostFocus()
FlashActiveControl optPatientNamewise, False
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
'    If mPttAraCode_old <> Val(fcmbAraName.BoundText) Or Val(fcmbStnName.BoundText) = 0 Then
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

'Private Sub txtPttName_GotFocus()
'FlashActiveControl txtPttName, True
'End Sub
'
'Private Sub txtPttName_KeyDown(KeyCode As Integer, Shift As Integer)
'If MyDropDownKey(Shift, KeyCode) = True Then
'    If fcmbPttName.CallFromText_Change = False Then
'        fcmbPttName.CallFromText_Change = True
'        If InterActiveChange(txtPttName) = True Then
'            fcmbPttName.UserText = Array(txtPttName.Text, txtPttName.SelStart)
'            fcmbPttName.Show
'            If fcmbPttName.ListSelected = True And Val(fcmbPttName.BoundText) > 0 Then
'                If FormAddEditMode = cFORM_ADDMODE Then
'                    clsPAT.EndMast mPttCode
'
'                    PatAddEditMode = cFORM_EDITMODE
'                    mPttCode = Val(fcmbPttName.BoundText)
'                    If clsPAT.BeginMast(mPttCode) = True Then
'                        mPttCode = clsPAT.ActiveCode
'                    Else
'                        mPttCode = 0
'                    End If
'                    ShowPttDiscPer mPttCode
'                    mOpgOldOpgCode = GetOldOpgCodeFromPttCode(mPttCode)
'                    ShowOldOpgCodeDesc mOpgOldOpgCode
'                    ShowPatData mPttCode
'                    Rem SendKeys "{tab}"
'                Else
'                    AlertBox "Prohibited in Edit Mode !!!"
'                End If
'            End If
'        End If
'        fcmbPttName.CallFromText_Change = False
'    End If
'ElseIf MyAddNewKey(Shift, KeyCode) = True Then
'    If FormAddEditMode = cFORM_ADDMODE Then
'        clsPAT.EndMast mPttCode
'
'        PatAddEditMode = cFORM_ADDMODE
'        If clsPAT.BeginMast(0) = True Then
'            mPttCode = clsPAT.ActiveCode
'        Else
'            mPttCode = 0
'        End If
'        ShowPttDiscPer mPttCode
'        mOpgOldOpgCode = 0
'        ShowOldOpgCodeDesc mOpgOldOpgCode
'        ShowPatData mPttCode
'        Call ShowPatDefData
'    Else
'        AlertBox "Prohibited in Edit Mode !!!"
'    End If
'ElseIf Shift = 0 And KeyCode = vbKeyF6 Then
'    Call ShowOldOpgListByPttName
'End If
'
'End Sub
'
'Private Sub txtPttName_LostFocus()
'FlashActiveControl txtPttName, False
'End Sub
'
'Private Sub txtPttName_Validate(Cancel As Boolean)
'txtPttName.Text = ToMyWord(txtPttName.Text)
'If Trim(txtPttName.Text) = "" Then
'    ErrorBox "Invalid Input !!!"
'    Cancel = True
'    txtPttName.SetFocus
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
'mOpgCode = clsOPG.ActiveCode
'mPttCode = clsPAT.ActiveCode
'
'ShowPatData mPttCode
'ShowOpgData mOpgCode
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
'txtPttName.SetFocus

End Sub

Private Sub Data_EditEvent()

'If clsOPG.BeginTran(datRecset.fields("OpgCode")) = False Then
'    Exit Sub
'ElseIf clsPAT.BeginMast(datRecset.fields("OpgPttCode")) = False Then
'    Exit Sub
'End If
'mEntrySaved = False: mEntryAborted = False
'FormAddEditMode = cFORM_EDITMODE
'PatAddEditMode = cFORM_EDITMODE
'
'With datRecset
'mOpgCode = .fields("OpgCode")
'mPttCode = .fields("OpgPttCode")
'clsOPG.GetData mOpgCode
'clsPAT.GetData mPttCode
'End With
'
'ShowPatData mPttCode
'ShowOpgData mOpgCode
'
'Rem old values
'Call StorePatOldData
'Call StoreOpgOldData
'
'Call ShowEntryMode(True)
'txtPttName.SetFocus

End Sub

'Private Sub ShowPatData(ByVal mPttCode As Long)
'
'With clsPAT
'.GetData mPttCode
'
'mskPttCode.Text = mPttCode
'txtPttName.Text = .mName_str
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
'fcmbAraName.BoundText = CStr(.mPttAraCode_lng): txtAraName.Text = fcmbAraName.Text
'fcmbStnName.BoundText = CStr(.mPttStnCode_lng): txtStnName.Text = fcmbStnName.Text
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
'txtPttName.Locked = (mPttCode > 0)
'mskPttRegNo.Locked = (mPttCode > 0)
'dtpPttRegDate.Locked = (mPttCode > 0)
'cmbPttSex.Locked = (mPttCode > 0)
'mskPttAgeYr.Locked = (mPttCode > 0)
'mskPttAgeMn.Locked = (mPttCode > 0)
'mskPttAgeDy.Locked = (mPttCode > 0)
'dtpPttAgeAsOnDt.Locked = (mPttCode > 0)
'dtpPttDob.Locked = (mPttCode > 0)
'txtPcgName.Locked = (mPttCode > 0)
'cmbPttRefRela.Locked = (mPttCode > 0)
'txtPttRefName.Locked = (mPttCode > 0)
'txtPttAddr.Locked = (mPttCode > 0)
'txtAraName.Locked = (mPttCode > 0)
'txtStnName.Locked = (mPttCode > 0)
'txtPttTelNo.Locked = (mPttCode > 0)
'txtPttSMSNo.Locked = (mPttCode > 0)
'txtPttEmail.Locked = (mPttCode > 0)
'chkPttInfAllowed.Enabled = Not (mPttCode > 0)
'chkPttDefAllowed.Enabled = Not (mPttCode > 0)
'chkPttDiscAllowed.Enabled = Not (mPttCode > 0)
'mskPttDiscPer.Locked = (mPttCode > 0)
'chkPttShowInList.Enabled = Not (mPttCode > 0)
'txtPttRemark.Locked = (mPttCode > 0)
'txtAhName.Locked = (mPttCode > 0)
'
'End Sub
'
'Private Sub ShowPatDefData()
'Dim mPttRegNo As Long
'
'If clsHOPT.mOpgPttRegNoAutoNumber_bln = True Then
'    mPttRegNo = GetNextSeqno(dbHmsDatabase, "PatMast", "PttRegNo")
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
'fcmbAraName.BoundText = CStr(clsHOPT.GetOutdRegOptBoundCode("OpgAraCode")): txtAraName.Text = fcmbAraName.Text
'fcmbStnName.BoundText = CStr(clsHOPT.GetOutdRegOptBoundCode("OpgStnCode")): txtStnName.Text = fcmbStnName.Text
'fcmbPcgName.BoundText = CStr(clsHOPT.GetOutdRegOptBoundCode("OpgPcgCode")): txtPcgName.Text = fcmbPcgName.Text
'fcmbAhName.BoundText = CStr(clsHOPT.GetOutdRegOptBoundCode("OpgPttAhCode")): txtAhName.Text = fcmbAhName.Text
'
'Call ShowPatAge
'Call ShowPatBal
'
'End Sub
'
'Private Sub StorePatOldData()
'mPttCode_old = mPttCode
'mPttName_old = txtPttName.Text
'mPttRegNo_old = Val(UnMyNumFmt(mskPttRegNo.Text))
'mPttPcgCode_old = Val(fcmbPcgName.BoundText)
'mPttAhCode_old = Val(fcmbAhName.BoundText)
'mPttAraCode_old = Val(fcmbAraName.BoundText)
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
'Private Sub ShowOpgData(ByVal mOpgCode As Long)
'
''With clsOPG
''.GetData mOpgCode
''
''mskFormBoundField.Text = mOpgCode
''fcmbVtmName.BoundText = CStr(.mVtmCode_lng): txtVtmName.Text = fcmbVtmName.Text
''txtOpgPrefix.Text = .mOpgPrefix_str
''mskOpgVchNo.Text = ToMyNumFmt(.mVchNo_lng, mDecimals:=0)
''dtpOpgDate.Text = Dtoc(.mVchDate_dt)
''txtOpgTime_str.Text = MinToTime(.mOpgTime_lng)
''fcmbCDctName.BoundText = CStr(.mOpgCDctCode_lng): txtCDctName.Text = fcmbCDctName.Text
''fcmbRByName.BoundText = CStr(.mOpgRByCode_lng): txtRByName.Text = fcmbRByName.Text
''fcmbFDigName.BoundText = CStr(.mOpgFDigCode_lng): txtFDigName.Text = fcmbFDigName.Text
''fcmbSrvName.BoundText = CStr(.mOpgSrvCode_lng): txtSrvName.Text = fcmbSrvName.Text
''mskOpgUnit.Text = .mOpgUnit_lng
''mskOpgRate.Text = ToMyNumFmt(.mOpgRate_dbl)
''mskOpgAmtBefDisc.Text = ToMyNumFmt(.mOpgAmtBefDisc_dbl)
''mskOpgDiscPer.Text = ToMyPerFmt(.mOpgDiscPer_dbl)
''mskOpgDiscAmt.Text = ToMyNumFmt(.mOpgDiscAmt_dbl)
''mskOpgAmtAftDisc.Text = ToMyNumFmt(.mOpgAmtAftDisc_dbl)
''txtOpgRemark.Text = .mOpgRemark_str
''Rem old outdoor data
''lblOldOpgCodeDesc.Caption = ""
''mOpgOldOpgCode = .mOpgOldOpgCode_lng
''ShowOldOpgCodeDesc mOpgOldOpgCode
''End With
''
''Call CalcOpgChg
'
'End Sub
'
'Private Sub ShowOpgDefData()
''Dim mOpgVchNo As Long
''
''dtpOpgDate.Text = Dtoc(DefaultEntryDate)
''txtOpgTime_str.Text = MinToTime(TimeToMin(DateTime.Time$))
''mskOpgUnit.Text = 1
''
''fcmbVtmName.BoundText = CStr(clsHOPT.GetOutdRegOptBoundCode("OpgVtmCode")): txtVtmName.Text = fcmbVtmName.Text
''fcmbCDctName.BoundText = CStr(clsHOPT.GetOutdRegOptBoundCode("OpgCDctCode")): txtCDctName.Text = fcmbCDctName.Text
''fcmbRByName.BoundText = CStr(clsHOPT.GetOutdRegOptBoundCode("OpgRByCode")): txtRByName.Text = fcmbRByName.Text
''fcmbFDigName.BoundText = CStr(clsHOPT.GetOutdRegOptBoundCode("OpgFDigCode")): txtFDigName.Text = fcmbFDigName.Text
''fcmbSrvName.BoundText = CStr(clsHOPT.GetOutdRegOptBoundCode("OpgSrvCode")): txtSrvName.Text = fcmbSrvName.Text
''
''mOpgVchNo = GetNextVTypeNo(dbHmsDatabase, dbAcDatabase, dbComDatabase, mTableName:="OutdReg", mFieldName:="OpgVchNo", mVtmFieldName:="OpgVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="OpgCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="OpgDate", mDateFieldValue:=Ctod(dtpOpgDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormOpgAcsPermFileName)
''mskOpgVchNo.Text = ToMyNumFmt(mOpgVchNo, mDecimals:=0)
''
''' clsSRV.GetData Val(fcmbSrvName.BoundText)
''' mskOpgRate.Text = ToMyNumFmt(clsSRV.mSrvOpdGenChg_dbl)
''Call ChkServRate
''Call CalcOpgChg
'
'End Sub
'
'Private Sub StoreOpgOldData()
''mOpgCode_old = mOpgCode
''mOpgDate_old = Ctod(dtpOpgDate.Text)
''mOpgTime_old = TimeToMin(txtOpgTime_str)
''mOpgVtmCode_old = Val(fcmbVtmName.BoundText)
''mOpgVchNo_old = Val(UnMyNumFmt(mskOpgVchNo.Text))
''mOpgSrvCode_old = Val(fcmbSrvName.BoundText)
'
'End Sub
'
'Private Sub Data_SaveEvent()
'With clsPAT
'If PatAddEditMode = cFORM_ADDMODE Then
'    .Clear
'Else
'    .GetData mPttCode
'End If
'.mName_str = txtPttName.Text
'.mPttRegNo_lng = Val(UnMyNumFmt(mskPttRegNo.Text))
'.mPttRegDate_dt = Ctod(dtpPttRegDate.Text)
'.mPttSex_str = cmbPttSex.Text
'.mPttAgeAsOnDt_dt = Ctod(dtpPttAgeAsOnDt.Text)
'.mPttDob_dt = Ctod(dtpPttDob.Text)
'.mPttPcgCode_lng = Val(fcmbPcgName.BoundText)
'.mPttRefRela_str = cmbPttRefRela.Text
'.mPttRefName_str = txtPttRefName.Text
'.mPttAddr_str = txtPttAddr.Text
'.mPttAraCode_lng = Val(fcmbAraName.BoundText)
'.mPttStnCode_lng = Val(fcmbStnName.BoundText)
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
'    mskPttCode.Text = .mCode_lng
'Else
'    .Update mPttCode
'End If
'If .mCode_lng > 0 Then   ' updated successfully
'    mPttCode = .mCode_lng
'
'    .UpdateMast .mCode_lng
'    .EndMast .mCode_lng
'
'    With clsOPG
'    If FormAddEditMode = cFORM_ADDMODE Then
'        .Clear
'    Else
'        .GetData mOpgCode
'    End If
'    .mVtmCode_lng = Val(fcmbVtmName.BoundText)
'    .mVchNo_lng = Val(UnMyNumFmt(mskOpgVchNo.Text))
'    .mVchDate_dt = Ctod(dtpOpgDate.Text)
'    .mCmpCode_int = sFinYrCmpCode
'    .mOpgPrefix_str = txtOpgPrefix.Text
'    .mOpgPostfix_str = ""
'    .mOpgTime_lng = TimeToMin(txtOpgTime_str.Text)
'    .mOpgOldOpgCode_lng = mOpgOldOpgCode
'    .mOpgPttCode_lng = mPttCode
'    .mOpgCDctCode_lng = Val(fcmbCDctName.BoundText)
'    .mOpgRByCode_lng = Val(fcmbRByName.BoundText)
'    .mOpgFDigCode_lng = Val(fcmbFDigName.BoundText)
'    .mOpgSrvCode_lng = Val(fcmbSrvName.BoundText)
'    .mOpgUnit_lng = Val(UnMyNumFmt(mskOpgUnit.Text))
'    .mOpgRate_dbl = Val(UnMyNumFmt(mskOpgRate.Text))
'    .mOpgAmtBefDisc_dbl = Val(UnMyNumFmt(mskOpgAmtBefDisc.Text))
'    .mOpgDiscPer_dbl = Val(UnMyPerFmt(mskOpgDiscPer.Text))
'    .mOpgDiscAmt_dbl = Val(UnMyNumFmt(mskOpgDiscAmt.Text))
'    .mOpgAmtAftDisc_dbl = Val(UnMyNumFmt(mskOpgAmtAftDisc.Text))
'    .mOpgRemark_str = txtOpgRemark.Text
'
'    If FormAddEditMode = cFORM_ADDMODE Then
'        .AddNew
'        mskFormBoundField.Text = .mCode_lng
'    Else
'        .Update mOpgCode
'    End If
'    If .mCode_lng > 0 Then   ' updated successfully
'        mOpgCode = .mCode_lng
'
'        .UpdateTran .mCode_lng
'        .EndTran .mCode_lng
'
'
'
'
'        Rem updating user editing carry forward features
'        clsHOPT.mOpgAraCodeOld_lng = clsPAT.mPttAraCode_lng
'        clsHOPT.mOpgStnCodeOld_lng = clsPAT.mPttStnCode_lng
'        clsHOPT.mOpgPcgCodeOld_lng = clsPAT.mPttPcgCode_lng
'        clsHOPT.mOpgPttAhCodeOld_lng = clsPAT.mPttAhCode_lng
'        clsHOPT.mOpgVtmCodeOld_lng = .mVtmCode_lng
'        clsHOPT.mOpgCDctCodeOld_lng = .mOpgCDctCode_lng
'        clsHOPT.mOpgRByCodeOld_lng = .mOpgRByCode_lng
'        clsHOPT.mOpgFDigCodeOld_lng = .mOpgFDigCode_lng
'        clsHOPT.mOpgSrvCodeOld_lng = .mOpgSrvCode_lng
'        clsHOPT.UpdateOutdRegOld
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
'Dim mDeleteit As Boolean, mRecAbsPos As Long, mPttAhCode As Long, mOpgVchNo As Long, mOpgVtmCode As Long, mOpgDate As Date
'If (datRecset.EOF Or datRecset.BOF) = True Then
'    Exit Sub
'End If
'
'mOpgCode = datRecset.fields("OpgCode")
'mOpgVtmCode = datRecset.fields("OpgVtmCode")
'mOpgVchNo = datRecset.fields("OpgVchNo")
'mOpgDate = datRecset.fields("OpgDate")
'mPttCode = datRecset.fields("OpgPttCode")
'mPttAhCode = datRecset.fields("PttAhCode")
'mRecAbsPos = datRecset.AbsolutePosition
'
'If clsOPG.CanDeleteTran(mOpgCode) = True Then
'    txtVoid.SetFocus
'    If clsOPG.BeginTran(mOpgCode) = True Then
'        clsOPG.DeleteTran mOpgCode
'        clsOPG.UpdateTran mOpgCode
'        clsOPG.EndTran mOpgCode
'
'        Rem clsPAT.DeleteMast mPttCode
'        Rem clsPAT.UpdateMast mPttCode
'        Rem clsPAT.EndMast mPttCode
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
'Private Sub Data_CancelEvent()
''clsOPG.CancelTran mOpgCode
''clsOPG.EndTran mOpgCode
''
''clsPAT.CancelMast mPttCode
''clsPAT.EndMast mPttCode
''
''mEntryAborted = True
'
'End Sub
'
'Private Sub txtPttRefName_GotFocus()
'FlashActiveControl txtPttRefName, True
'End Sub
'
'Private Sub txtPttRefName_LostFocus()
'FlashActiveControl txtPttRefName, False
'End Sub
'
'Private Sub txtPttRefName_Validate(Cancel As Boolean)
'txtPttRefName.Text = ToMyWord(txtPttRefName.Text)
'End Sub
'
'Private Sub txtPttRemark_GotFocus()
'FlashActiveControl txtPttRemark, True
'End Sub
'
'Private Sub txtPttRemark_LostFocus()
'FlashActiveControl txtPttRemark, False
'End Sub
'
'Private Sub txtPttSMSNo_GotFocus()
'FlashActiveControl txtPttSMSNo, True
'End Sub
'
'Private Sub txtPttSMSNo_LostFocus()
'FlashActiveControl txtPttSMSNo, False
'End Sub
'
'Private Sub txtPttTelNo_GotFocus()
'FlashActiveControl txtPttTelNo, True
'End Sub
'
'Private Sub txtPttTelNo_LostFocus()
'FlashActiveControl txtPttTelNo, False
'End Sub
'
'Private Sub txtPcgName_Change()
'If fcmbPcgName.CallFromText_Change = False Then
'    fcmbPcgName.CallFromText_Change = True
'    If InterActiveChange(txtPcgName) = True Then
'        fcmbPcgName.UserText = Array(txtPcgName.Text, txtPcgName.SelStart)
'        fcmbPcgName.Show
'        txtPcgName.Text = fcmbPcgName.Text
'        If fcmbPcgName.ListSelected = True Then
'            SendKeys "{tab}"
'        End If
'    End If
'    fcmbPcgName.CallFromText_Change = False
'End If
'
'End Sub
'
'Private Sub txtPcgName_GotFocus()
'FlashActiveControl txtPcgName, True
'End Sub
'
'Private Sub txtPcgName_LostFocus()
'FlashActiveControl txtPcgName, False
'End Sub
'
'Private Sub txtPcgName_Validate(Cancel As Boolean)
'If Val(fcmbPcgName.BoundText) <= 0 Then
'    ErrorBox "Invalid Selection !!!"
'    txtPcgName.SetFocus
'    Cancel = True
'Else
'    If mPttPcgCode_old <> Val(fcmbPcgName.BoundText) Or FormAddEditMode = cFORM_ADDMODE Then
'        clsPCG.GetData Val(fcmbPcgName.BoundText)
'
'        chkPttInfAllowed.Value = IIf(clsPCG.mPcgInfAllowed_bln = True, vbChecked, vbUnchecked)
'        chkPttDefAllowed.Value = IIf(clsPCG.mPcgDefAllowed_bln = True, vbChecked, vbUnchecked)
'        chkPttDiscAllowed.Value = IIf(clsPCG.mPcgDiscAllowed_bln = True, vbChecked, vbUnchecked)
'        mskPttDiscPer.Text = ToMyPerFmt(clsPCG.mPcgDiscPer_dbl)
'
'        Call ChkServRate
'        Call CalcOpgChg
'    End If
'End If
'
'End Sub

Private Sub SmryList()
Dim gcolcount As Integer, acount As Integer, mLow As Integer, mHigh As Integer, mPos As Integer, srow As Long, mColCount As Integer
Dim aAcntBal As Variant, mBal As Double, mQryStr As String
Dim mCount_Tot As Double, mAmtAftDisc_Tot As Double, mDiscAmt_Tot As Double

Me.MousePointer = vbHourglass
If datRecset.State = 1 Then
    CloseTable datRecset
End If
RefreshDatabase dbHmsDatabase
RefreshDatabase dbAcDatabase
RefreshDatabase dbGrpDatabase
RefreshDatabase dbComDatabase
clsListStru.Clear

If optMonthwise.Value = True Or optDatewise.Value = True Or optPatientNamewise.Value = True Or optPatientRegNoWise.Value = True Or optServiceWise.Value = True Then
    If optMonthwise.Value = True Then
        clsListStru.AddFields mExpr:="TrnYrMonth", mAttrib:=cFAT_SYSTEM
        clsListStru.AddFields mExpr:="TrnMnYear", mTitle:="Month", mShowItem:=True, mAlign:=1, mWidth:=2000
        clsListStru.AddFields mExpr:="TrnCount", mTitle:="Count", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="TrnAmtAftDisc_sum", mTitle:="Recd.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="TrnDiscAmt_sum", mTitle:="Discount", mShowItem:=True, mAlign:=7, mWidth:=1500
        
        mQryStr = "Select format(TrnDate,'yyyy/MM') as TrnYrMonth" _
         & ",Count(*) as TrnCount" _
         & ",Sum(TrnAmtAftDisc) as TrnAmtAftDisc_sum" _
         & ",Sum(TrnDiscAmt) as TrnDiscAmt_sum"
        mQryStr = mQryStr & " from ("
        Rem reserved query string producing no records
        mQryStr = mQryStr & "Select OpgDate as TrnDate" _
         & ",OpgAmtAftDisc as TrnAmtAftDisc" _
         & ",OpgDiscAmt as TrnDiscAmt" _
         & " from OutdReg" _
         & " where OpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and OpgCode>0 and True=False" _
         & IIf(mQryPttCode > 0, " and OpgPttCode=" & CStr(mQryPttCode), "") _
         & IIf(mQrySrvCode > 0, " and OpgSrvCode=" & CStr(mQrySrvCode), "")
        Rem outdoor registration
        If chkFByOutdReg.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select OpgDate as TrnDate" _
             & ",OpgAmtAftDisc as TrnAmtAftDisc" _
             & ",OpgDiscAmt as TrnDiscAmt" _
             & " from OutdReg" _
             & " where OpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and OpgCode>0" _
             & IIf(mQryPttCode > 0, " and OpgPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and OpgSrvCode=" & CStr(mQrySrvCode), "")
        End If
        Rem outdoor receipt received amount
        If chkFByOutdRcpt.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select OrcDate as TrnDate" _
             & ",OrcRecdAmt as TrnAmtAftDisc" _
             & ",OrcDiscAmt as TrnDiscAmt" _
             & " from OutdRcpt" _
             & " where OrcDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and OrcCode>0" _
             & IIf(mQryPttCode > 0, " and OrcPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and OrcSrvCode=" & CStr(mQrySrvCode), "")
        End If
        Rem outdoor payment
        If chkFByOutdPymt.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select OphDate as TrnDate" _
             & ",OphDepoAmt as TrnAmtAftDisc" _
             & ",0 as TrnDiscAmt" _
             & " from OutdPymtHdr" _
             & " where OphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and OphCode>0" _
             & IIf(mQryPttCode > 0, " and OphPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and True=False", "")
        End If
        Rem outdoor refund
        If chkFByOutdRefd.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select OfhDate as TrnDate" _
             & ",(OfhRefuAmt * -1) as TrnAmtAftDisc" _
             & ",0 as TrnDiscAmt" _
             & " from OutdRefdHdr" _
             & " where OfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and OfhCode>0" _
             & IIf(mQryPttCode > 0, " and OfhPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and True=False", "")
        End If
        Rem outdoor bill payment
        If chkFByOutdBlPymt.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select ObphDate as TrnDate" _
             & ",ObphDepoAmt as TrnAmtAftDisc" _
             & ",0 as TrnDiscAmt" _
             & " from OutdBlPymtHdr" _
             & " where ObphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and ObphCode>0" _
             & IIf(mQryPttCode > 0, " and ObphPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and True=False", "")
        End If
        Rem outdoor bill refund
        If chkFByOutdBlRefd.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select ObfhDate as TrnDate" _
             & ",(ObfhRefuAmt * -1) as TrnAmtAftDisc" _
             & ",0 as TrnDiscAmt" _
             & " from OutdBlRefdHdr" _
             & " where ObfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and ObfhCode>0" _
             & IIf(mQryPttCode > 0, " and ObfhPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and True=False", "")
        End If
        Rem indoor advance ---------------------
        If chkFByIndrReg.Value = vbChecked = True Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select IpgDate as TrnDate" _
             & ",IpgAdvAmt as TrnAmtAftDisc" _
             & ",0 as TrnDiscAmt" _
             & " from IndrReg" _
             & " where IpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and IpgCode>0" _
             & IIf(mQryPttCode > 0, " and IpgPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and True=False", "")
        End If
        Rem indoor receipt received amount
        If chkFByIndrRcpt.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select IrcDate as TrnDate" _
             & ",IrcRecdAmt as TrnAmtAftDisc" _
             & ",IrcDiscAmt as TrnDiscAmt" _
             & " from IndrRcpt" _
             & " where IrcDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and IrcCode>0" _
             & IIf(mQryPttCode > 0, " and IrcPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and IrcSrvCode=" & CStr(mQrySrvCode), "")
        End If
        Rem indoor payment
        If chkFByIndrPymt.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select IphDate as TrnDate" _
             & ",IphDepoAmt as TrnAmtAftDisc" _
             & ",0 as TrnDiscAmt" _
             & " from IndrPymtHdr" _
             & " where IphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and IphCode>0" _
             & IIf(mQryPttCode > 0, " and IphPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and True=False", "")
        End If
        Rem indoor refund
        If chkFByIndrRefd.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select IfhDate as TrnDate" _
             & ",(IfhRefuAmt * -1) as TrnAmtAftDisc" _
             & ",0 as TrnDiscAmt" _
             & " from IndrRefdHdr" _
             & " where IfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and IfhCode>0" _
             & IIf(mQryPttCode > 0, " and IfhPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and True=False", "")
        End If
        Rem indoor bill payment
        If chkFByIndrBlPymt.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select IbphDate as TrnDate" _
             & ",IbphDepoAmt as TrnAmtAftDisc" _
             & ",0 as TrnDiscAmt" _
             & " from IndrBlPymtHdr" _
             & " where IbphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and IbphCode>0" _
             & IIf(mQryPttCode > 0, " and IbphPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and True=False", "")
        End If
        Rem indoor bill refund
        If chkFByIndrBlRefd.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select IbfhDate as TrnDate" _
             & ",(IbfhRefuAmt * -1) as TrnAmtAftDisc" _
             & ",0 as TrnDiscAmt" _
             & " from IndrBlRefdHdr" _
             & " where IbfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and IbfhCode>0" _
             & IIf(mQryPttCode > 0, " and IbfhPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and True=False", "")
        End If
        Rem indoor on a/c payment
        If chkFByIndrRgPymt.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select IgtDate as TrnDate" _
             & ",IgtDpogAmt as TrnAmtAftDisc" _
             & ",0 as TrnDiscAmt" _
             & " from IndrRgPymt" _
             & " where IgtDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and IgtCode>0" _
             & IIf(mQryPttCode > 0, " and IgtPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and True=False", "")
        End If
        Rem indoor on a/c refund
        If chkFByIndrRgRefd.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select IgfDate as TrnDate" _
             & ",(IgfRfugAmt * -1) as TrnAmtAftDisc" _
             & ",0 as TrnDiscAmt" _
             & " from IndrRgRefd" _
             & " where IgfDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and IgfCode>0" _
             & IIf(mQryPttCode > 0, " and IgfPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and True=False", "")
        End If
        Rem ----------------------------------
        mQryStr = mQryStr & ")"
        mQryStr = mQryStr & " group by format(TrnDate,'yyyy/MM')" _
         & " order by format(TrnDate,'yyyy/MM')"
        
        datRecset.Open mQryStr, dbHmsDatabase, adOpenKeyset, adLockReadOnly
        
    ElseIf optDatewise.Value = True Then
        clsListStru.AddFields mExpr:="TrnDateYMD", mAttrib:=cFAT_SYSTEM
        clsListStru.AddFields mExpr:="TrnDate", mTitle:="Date", mShowItem:=True, mAlign:=1, mWidth:=2000
        clsListStru.AddFields mExpr:="TrnCount", mTitle:="Count", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="TrnAmtAftDisc_sum", mTitle:="Recd.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="TrnDiscAmt_sum", mTitle:="Discount", mShowItem:=True, mAlign:=7, mWidth:=1500
        
        mQryStr = "Select TrnDate" _
         & ",Count(*) as TrnCount" _
         & ",Sum(TrnAmtAftDisc) as TrnAmtAftDisc_sum" _
         & ",Sum(TrnDiscAmt) as TrnDiscAmt_sum"
        mQryStr = mQryStr & " from ("
        Rem reserved query string producing no records
        mQryStr = mQryStr & "Select OpgDate as TrnDate" _
         & ",OpgAmtAftDisc as TrnAmtAftDisc" _
         & ",OpgDiscAmt as TrnDiscAmt" _
         & " from OutdReg" _
         & " where OpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and OpgCode>0 and True=False" _
         & IIf(mQryPttCode > 0, " and OpgPttCode=" & CStr(mQryPttCode), "") _
         & IIf(mQrySrvCode > 0, " and OpgSrvCode=" & CStr(mQrySrvCode), "")
        Rem outdoor registration
        If chkFByOutdReg.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & "Select OpgDate as TrnDate" _
             & ",OpgAmtAftDisc as TrnAmtAftDisc" _
             & ",OpgDiscAmt as TrnDiscAmt" _
             & " from OutdReg" _
             & " where OpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and OpgCode>0" _
             & IIf(mQryPttCode > 0, " and OpgPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and OpgSrvCode=" & CStr(mQrySrvCode), "")
        End If
        Rem outdoor receipt received amount
        If chkFByOutdRcpt.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select OrcDate as TrnDate" _
             & ",OrcRecdAmt as TrnAmtAftDisc" _
             & ",OrcDiscAmt as TrnDiscAmt" _
             & " from OutdRcpt" _
             & " where OrcDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and OrcCode>0" _
             & IIf(mQryPttCode > 0, " and OrcPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and OrcSrvCode=" & CStr(mQrySrvCode), "")
        End If
        Rem outdoor payment
        If chkFByOutdPymt.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select OphDate as TrnDate" _
             & ",OphDepoAmt as TrnAmtAftDisc" _
             & ",0 as TrnDiscAmt" _
             & " from OutdPymtHdr" _
             & " where OphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and OphCode>0" _
             & IIf(mQryPttCode > 0, " and OphPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and True=False", "")
        End If
        Rem outdoor refund
        If chkFByOutdRefd.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select OfhDate as TrnDate" _
             & ",OfhRefuAmt * -1 as TrnAmtAftDisc" _
             & ",0 as TrnDiscAmt" _
             & " from OutdRefdHdr" _
             & " where OfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and OfhCode>0" _
             & IIf(mQryPttCode > 0, " and OfhPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and True=False", "")
        End If
        Rem outdoor bill payment
        If chkFByOutdBlPymt.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select ObphDate as TrnDate" _
             & ",ObphDepoAmt as TrnAmtAftDisc" _
             & ",0 as TrnDiscAmt" _
             & " from OutdBlPymtHdr" _
             & " where ObphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and ObphCode>0" _
             & IIf(mQryPttCode > 0, " and ObphPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and True=False", "")
        End If
        Rem outdoor bill refund
        If chkFByOutdBlRefd.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select ObfhDate as TrnDate" _
             & ",ObfhRefuAmt * -1 as TrnAmtAftDisc" _
             & ",0 as TrnDiscAmt" _
             & " from OutdBlRefdHdr" _
             & " where ObfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and ObfhCode>0" _
             & IIf(mQryPttCode > 0, " and ObfhPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and True=False", "")
        End If
        Rem indoor advance ---------------------
        If chkFByIndrReg.Value = vbChecked = True Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select IpgDate as TrnDate" _
             & ",IpgAdvAmt as TrnAmtAftDisc" _
             & ",0 as TrnDiscAmt" _
             & " from IndrReg" _
             & " where IpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and IpgCode>0" _
             & IIf(mQryPttCode > 0, " and IpgPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and True=False", "")
        End If
        Rem indoor receipt received amount
        If chkFByIndrRcpt.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select IrcDate as TrnDate" _
             & ",IrcRecdAmt as TrnAmtAftDisc" _
             & ",IrcDiscAmt as TrnDiscAmt" _
             & " from IndrRcpt" _
             & " where IrcDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and IrcCode>0" _
             & IIf(mQryPttCode > 0, " and IrcPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and IrcSrvCode=" & CStr(mQrySrvCode), "")
        End If
        Rem indoor payment
        If chkFByIndrPymt.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select IphDate as TrnDate" _
             & ",IphDepoAmt as TrnAmtAftDisc" _
             & ",0 as TrnDiscAmt" _
             & " from IndrPymtHdr" _
             & " where IphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and IphCode>0" _
             & IIf(mQryPttCode > 0, " and IphPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and True=False", "")
        End If
        Rem indoor refund
        If chkFByIndrRefd.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select IfhDate as TrnDate" _
             & ",IfhRefuAmt * -1 as TrnAmtAftDisc" _
             & ",0 as TrnDiscAmt" _
             & " from IndrRefdHdr" _
             & " where IfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and IfhCode>0" _
             & IIf(mQryPttCode > 0, " and IfhPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and True=False", "")
        End If
        Rem indoor bill payment
        If chkFByIndrBlPymt.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select IbphDate as TrnDate" _
             & ",IbphDepoAmt as TrnAmtAftDisc" _
             & ",0 as TrnDiscAmt" _
             & " from IndrBlPymtHdr" _
             & " where IbphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and IbphCode>0" _
             & IIf(mQryPttCode > 0, " and IbphPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and True=False", "")
        End If
        Rem indoor bill refund
        If chkFByIndrBlRefd.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select IbfhDate as TrnDate" _
             & ",IbfhRefuAmt * -1 as TrnAmtAftDisc" _
             & ",0 as TrnDiscAmt" _
             & " from IndrBlRefdHdr" _
             & " where IbfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and IbfhCode>0" _
             & IIf(mQryPttCode > 0, " and IbfhPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and True=False", "")
        End If
        Rem indoor on a/c payment
        If chkFByIndrRgPymt.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select IgtDate as TrnDate" _
             & ",IgtDpogAmt as TrnAmtAftDisc" _
             & ",0 as TrnDiscAmt" _
             & " from IndrRgPymt" _
             & " where IgtDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and IgtCode>0" _
             & IIf(mQryPttCode > 0, " and IgtPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and True=False", "")
        End If
        Rem indoor on a/c refund
        If chkFByIndrRgRefd.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select IgfDate as TrnDate" _
             & ",IgfRfugAmt * -1 as TrnAmtAftDisc" _
             & ",0 as TrnDiscAmt" _
             & " from IndrRgRefd" _
             & " where IgfDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and IgfCode>0" _
             & IIf(mQryPttCode > 0, " and IgfPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and True=False", "")
        End If
        Rem ----------------------------------
        mQryStr = mQryStr & ")"
        mQryStr = mQryStr & " group by TrnDate" _
         & " order by TrnDate"
        
        datRecset.Open mQryStr, dbHmsDatabase, adOpenKeyset, adLockReadOnly
        
    ElseIf optPatientNamewise.Value = True Then
        clsListStru.AddFields mExpr:="PttName", mTitle:="Patient Name", mShowItem:=True, mAlign:=1, mWidth:=3000
        clsListStru.AddFields mExpr:="PttRegNo", mTitle:="Reg.No", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="PttRefName", mTitle:="Care of", mShowItem:=True, mAlign:=1, mWidth:=2000
        clsListStru.AddFields mExpr:="TrnCount", mTitle:="Count", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="TrnAmtAftDisc_sum", mTitle:="Recd.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="TrnDiscAmt_sum", mTitle:="Discount", mShowItem:=True, mAlign:=7, mWidth:=1500
        
        mQryStr = "Select PatMast.PttName,t1.TrnPttCode,PatMast.PttRegNo,PatMast.PttRefName" _
         & ",Count(*) as TrnCount" _
         & ",Sum(t1.TrnAmtAftDisc) as TrnAmtAftDisc_sum" _
         & ",Sum(t1.TrnDiscAmt) as TrnDiscAmt_sum"
        mQryStr = mQryStr & " from ("
        Rem reserved query string producing no records
        mQryStr = mQryStr & "Select OpgPttCode as TrnPttCode" _
         & ",OpgAmtAftDisc as TrnAmtAftDisc" _
         & ",OpgDiscAmt as TrnDiscAmt" _
         & " from OutdReg" _
         & " where OpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and OpgCode>0 and True=False" _
         & IIf(mQryPttCode > 0, " and OpgPttCode=" & CStr(mQryPttCode), "") _
         & IIf(mQrySrvCode > 0, " and OpgSrvCode=" & CStr(mQrySrvCode), "")
        Rem outdoor registration
        If chkFByOutdReg.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select OpgPttCode as TrnPttCode" _
             & ",OpgAmtAftDisc as TrnAmtAftDisc" _
             & ",OpgDiscAmt as TrnDiscAmt" _
             & " from OutdReg" _
             & " where OpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and OpgCode>0" _
             & IIf(mQryPttCode > 0, " and OpgPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and OpgSrvCode=" & CStr(mQrySrvCode), "")
        End If
        Rem outdoor receipt received amount
        If chkFByOutdRcpt.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select OrcPttCode as TrnPttCode" _
             & ",OrcRecdAmt as TrnAmtAftDisc" _
             & ",OrcDiscAmt as TrnDiscAmt" _
             & " from OutdRcpt" _
             & " where OrcDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and OrcCode>0" _
             & IIf(mQryPttCode > 0, " and OrcPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and OrcSrvCode=" & CStr(mQrySrvCode), "")
        End If
        Rem outdoor payment
        If chkFByOutdPymt.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select OphPttCode as TrnPttCode" _
             & ",OphDepoAmt as TrnAmtAftDisc" _
             & ",0 as TrnDiscAmt" _
             & " from OutdPymtHdr" _
             & " where OphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and OphCode>0" _
             & IIf(mQryPttCode > 0, " and OphPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and True=False", "")
        End If
        Rem outdoor refund
        If chkFByOutdRefd.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select OfhPttCode as TrnPttCode" _
             & ",OfhRefuAmt * -1 as TrnAmtAftDisc" _
             & ",0 as TrnDiscAmt" _
             & " from OutdRefdHdr" _
             & " where OfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and OfhCode>0" _
             & IIf(mQryPttCode > 0, " and OfhPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and True=False", "")
        End If
        Rem outdoor bill payment
        If chkFByOutdBlPymt.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select ObphPttCode as TrnPttCode" _
             & ",ObphDepoAmt as TrnAmtAftDisc" _
             & ",0 as TrnDiscAmt" _
             & " from OutdBlPymtHdr" _
             & " where ObphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and ObphCode>0" _
             & IIf(mQryPttCode > 0, " and ObphPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and True=False", "")
        End If
        Rem outdoor bill refund
        If chkFByOutdBlRefd.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select ObfhPttCode as TrnPttCode" _
             & ",ObfhRefuAmt * -1 as TrnAmtAftDisc" _
             & ",0 as TrnDiscAmt" _
             & " from OutdBlRefdHdr" _
             & " where ObfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and ObfhCode>0" _
             & IIf(mQryPttCode > 0, " and ObfhPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and True=False", "")
        End If
        Rem indoor advance ---------------------
        If chkFByIndrReg.Value = vbChecked = True Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select IpgPttCode as TrnPttCode" _
             & ",IpgAdvAmt as TrnAmtAftDisc" _
             & ",0 as TrnDiscAmt" _
             & " from IndrReg" _
             & " where IpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and IpgCode>0" _
             & IIf(mQryPttCode > 0, " and IpgPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and True=False", "")
        End If
        Rem indoor receipt received amount
        If chkFByIndrRcpt.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select IrcPttCode as TrnPttCode" _
             & ",IrcRecdAmt as TrnAmtAftDisc" _
             & ",IrcDiscAmt as TrnDiscAmt" _
             & " from IndrRcpt" _
             & " where IrcDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and IrcCode>0" _
             & IIf(mQryPttCode > 0, " and IrcPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and IrcSrvCode=" & CStr(mQrySrvCode), "")
        End If
        Rem indoor payment
        If chkFByIndrPymt.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select IphPttCode as TrnPttCode" _
             & ",IphDepoAmt as TrnAmtAftDisc" _
             & ",0 as TrnDiscAmt" _
             & " from IndrPymtHdr" _
             & " where IphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and IphCode>0" _
             & IIf(mQryPttCode > 0, " and IphPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and True=False", "")
        End If
        Rem indoor refund
        If chkFByIndrRefd.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select IfhPttCode as TrnPttCode" _
             & ",IfhRefuAmt * -1 as TrnAmtAftDisc" _
             & ",0 as TrnDiscAmt" _
             & " from IndrRefdHdr" _
             & " where IfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and IfhCode>0" _
             & IIf(mQryPttCode > 0, " and IfhPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and True=False", "")
        End If
        Rem indoor bill payment
        If chkFByIndrBlPymt.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select IbphPttCode as TrnPttCode" _
             & ",IbphDepoAmt as TrnAmtAftDisc" _
             & ",0 as TrnDiscAmt" _
             & " from IndrBlPymtHdr" _
             & " where IbphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and IbphCode>0" _
             & IIf(mQryPttCode > 0, " and IbphPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and True=False", "")
        End If
        Rem indoor bill refund
        If chkFByIndrBlRefd.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select IbfhPttCode as TrnPttCode" _
             & ",IbfhRefuAmt * -1 as TrnAmtAftDisc" _
             & ",0 as TrnDiscAmt" _
             & " from IndrBlRefdHdr" _
             & " where IbfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and IbfhCode>0" _
             & IIf(mQryPttCode > 0, " and IbfhPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and True=False", "")
        End If
        Rem indoor on a/c payment
        If chkFByIndrRgPymt.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select IgtPttCode as TrnPttCode" _
             & ",IgtDpogAmt as TrnAmtAftDisc" _
             & ",0 as TrnDiscAmt" _
             & " from IndrRgPymt" _
             & " where IgtDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and IgtCode>0" _
             & IIf(mQryPttCode > 0, " and IgtPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and True=False", "")
        End If
        Rem indoor on a/c refund
        If chkFByIndrRgRefd.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select IgfPttCode as TrnPttCode" _
             & ",IgfRfugAmt * -1 as TrnAmtAftDisc" _
             & ",0 as TrnDiscAmt" _
             & " from IndrRgRefd" _
             & " where IgfDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and IgfCode>0" _
             & IIf(mQryPttCode > 0, " and IgfPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and True=False", "")
        End If
        Rem ----------------------------------
        mQryStr = mQryStr & ")"
        mQryStr = mQryStr & " as t1 inner join PatMast on t1.TrnPttCode=PatMast.PttCode" _
         & " group by PatMast.PttName,PatMast.PttRegNo,PatMast.PttRefName,t1.TrnPttCode" _
         & " order by PatMast.PttName,PatMast.PttRegNo,PatMast.PttRefName,t1.TrnPttCode"
        
        datRecset.Open mQryStr, dbHmsDatabase, adOpenKeyset, adLockReadOnly
        
    ElseIf optPatientRegNoWise.Value = True Then
        clsListStru.AddFields mExpr:="PttRegNo", mTitle:="Reg.No", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="PttName", mTitle:="Patient Name", mShowItem:=True, mAlign:=1, mWidth:=3000
        clsListStru.AddFields mExpr:="PttRefName", mTitle:="Care of", mShowItem:=True, mAlign:=1, mWidth:=2000
        clsListStru.AddFields mExpr:="TrnCount", mTitle:="Count", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="TrnAmtAftDisc_sum", mTitle:="Recd.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="TrnDiscAmt_sum", mTitle:="Discount", mShowItem:=True, mAlign:=7, mWidth:=1500
        
        mQryStr = "Select PatMast.PttRegNo,t1.TrnPttCode,PatMast.PttName,PatMast.PttRefName" _
         & ",Count(*) as TrnCount" _
         & ",Sum(t1.TrnAmtAftDisc) as TrnAmtAftDisc_sum" _
         & ",Sum(t1.TrnDiscAmt) as TrnDiscAmt_sum"
        mQryStr = mQryStr & " from ("
        Rem reserved query string producing no records
        mQryStr = mQryStr & "Select OpgPttCode as TrnPttCode" _
         & ",OpgAmtAftDisc as TrnAmtAftDisc" _
         & ",OpgDiscAmt as TrnDiscAmt" _
         & " from OutdReg" _
         & " where OpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and OpgCode>0 and True=False" _
         & IIf(mQryPttCode > 0, " and OpgPttCode=" & CStr(mQryPttCode), "") _
         & IIf(mQrySrvCode > 0, " and OpgSrvCode=" & CStr(mQrySrvCode), "")
        Rem outdoor registration
        If chkFByOutdReg.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select OpgPttCode as TrnPttCode" _
             & ",OpgAmtAftDisc as TrnAmtAftDisc" _
             & ",OpgDiscAmt as TrnDiscAmt" _
             & " from OutdReg" _
             & " where OpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and OpgCode>0" _
             & IIf(mQryPttCode > 0, " and OpgPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and OpgSrvCode=" & CStr(mQrySrvCode), "")
        End If
        Rem outdoor receipt received amount
        If chkFByOutdRcpt.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select OrcPttCode as TrnPttCode" _
             & ",OrcRecdAmt as TrnAmtAftDisc" _
             & ",OrcDiscAmt as TrnDiscAmt" _
             & " from OutdRcpt" _
             & " where OrcDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and OrcCode>0" _
             & IIf(mQryPttCode > 0, " and OrcPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and OrcSrvCode=" & CStr(mQrySrvCode), "")
        End If
        Rem outdoor payment
        If chkFByOutdPymt.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select OphPttCode as TrnPttCode" _
             & ",OphDepoAmt as TrnAmtAftDisc" _
             & ",0 as TrnDiscAmt" _
             & " from OutdPymtHdr" _
             & " where OphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and OphCode>0" _
             & IIf(mQryPttCode > 0, " and OphPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and True=False", "")
        End If
        Rem outdoor refund
        If chkFByOutdRefd.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select OfhPttCode as TrnPttCode" _
             & ",OfhRefuAmt * -1 as TrnAmtAftDisc" _
             & ",0 as TrnDiscAmt" _
             & " from OutdRefdHdr" _
             & " where OfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and OfhCode>0" _
             & IIf(mQryPttCode > 0, " and OfhPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and True=False", "")
        End If
        Rem outdoor bill payment
        If chkFByOutdBlPymt.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select ObphPttCode as TrnPttCode" _
             & ",ObphDepoAmt as TrnAmtAftDisc" _
             & ",0 as TrnDiscAmt" _
             & " from OutdBlPymtHdr" _
             & " where ObphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and ObphCode>0" _
             & IIf(mQryPttCode > 0, " and ObphPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and True=False", "")
        End If
        Rem outdoor bill refund
        If chkFByOutdBlRefd.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select ObfhPttCode as TrnPttCode" _
             & ",ObfhRefuAmt * -1 as TrnAmtAftDisc" _
             & ",0 as TrnDiscAmt" _
             & " from OutdBlRefdHdr" _
             & " where ObfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and ObfhCode>0" _
             & IIf(mQryPttCode > 0, " and ObfhPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and True=False", "")
        End If
        Rem indoor advance ---------------------
        If chkFByIndrReg.Value = vbChecked = True Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select IpgPttCode as TrnPttCode" _
             & ",IpgAdvAmt as TrnAmtAftDisc" _
             & ",0 as TrnDiscAmt" _
             & " from IndrReg" _
             & " where IpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and IpgCode>0" _
             & IIf(mQryPttCode > 0, " and IpgPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and True=False", "")
        End If
        Rem indoor receipt received amount
        If chkFByIndrRcpt.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select IrcPttCode as TrnPttCode" _
             & ",IrcRecdAmt as TrnAmtAftDisc" _
             & ",IrcDiscAmt as TrnDiscAmt" _
             & " from IndrRcpt" _
             & " where IrcDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and IrcCode>0" _
             & IIf(mQryPttCode > 0, " and IrcPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and IrcSrvCode=" & CStr(mQrySrvCode), "")
        End If
        Rem indoor payment
        If chkFByIndrPymt.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select IphPttCode as TrnPttCode" _
             & ",IphDepoAmt as TrnAmtAftDisc" _
             & ",0 as TrnDiscAmt" _
             & " from IndrPymtHdr" _
             & " where IphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and IphCode>0" _
             & IIf(mQryPttCode > 0, " and IphPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and True=False", "")
        End If
        Rem indoor refund
        If chkFByIndrRefd.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select IfhPttCode as TrnPttCode" _
             & ",IfhRefuAmt * -1 as TrnAmtAftDisc" _
             & ",0 as TrnDiscAmt" _
             & " from IndrRefdHdr" _
             & " where IfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and IfhCode>0" _
             & IIf(mQryPttCode > 0, " and IfhPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and True=False", "")
        End If
        Rem indoor bill payment
        If chkFByIndrBlPymt.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select IbphPttCode as TrnPttCode" _
             & ",IbphDepoAmt as TrnAmtAftDisc" _
             & ",0 as TrnDiscAmt" _
             & " from IndrBlPymtHdr" _
             & " where IbphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and IbphCode>0" _
             & IIf(mQryPttCode > 0, " and IbphPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and True=False", "")
        End If
        Rem indoor bill refund
        If chkFByIndrBlRefd.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select IbfhPttCode as TrnPttCode" _
             & ",IbfhRefuAmt * -1 as TrnAmtAftDisc" _
             & ",0 as TrnDiscAmt" _
             & " from IndrBlRefdHdr" _
             & " where IbfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and IbfhCode>0" _
             & IIf(mQryPttCode > 0, " and IbfhPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and True=False", "")
        End If
        Rem indoor on a/c payment
        If chkFByIndrRgPymt.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select IgtPttCode as TrnPttCode" _
             & ",IgtDpogAmt as TrnAmtAftDisc" _
             & ",0 as TrnDiscAmt" _
             & " from IndrRgPymt" _
             & " where IgtDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and IgtCode>0" _
             & IIf(mQryPttCode > 0, " and IgtPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and True=False", "")
        End If
        Rem indoor on a/c refund
        If chkFByIndrRgRefd.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select IgfPttCode as TrnPttCode" _
             & ",IgfRfugAmt * -1 as TrnAmtAftDisc" _
             & ",0 as TrnDiscAmt" _
             & " from IndrRgRefd" _
             & " where IgfDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and IgfCode>0" _
             & IIf(mQryPttCode > 0, " and IgfPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and True=False", "")
        End If
        Rem ----------------------------------
        mQryStr = mQryStr & ")"
        mQryStr = mQryStr & " as t1 inner join PatMast on t1.TrnPttCode=PatMast.PttCode" _
         & " group by PatMast.PttRegNo,PatMast.PttName,PatMast.PttRefName,t1.TrnPttCode" _
         & " order by PatMast.PttRegNo,PatMast.PttName,PatMast.PttRefName,t1.TrnPttCode"
        
        datRecset.Open mQryStr, dbHmsDatabase, adOpenKeyset, adLockReadOnly
        
    ElseIf optServiceWise.Value = True Then
        clsListStru.AddFields mExpr:="TrnSrvName", mTitle:="Service Name", mShowItem:=True, mAlign:=1, mWidth:=3000
        clsListStru.AddFields mExpr:="TrnCount", mTitle:="Count", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="TrnAmtAftDisc_sum", mTitle:="Recd.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="TrnDiscAmt_sum", mTitle:="Discount", mShowItem:=True, mAlign:=7, mWidth:=1500
        
        mQryStr = "Select " _
         & " t1.TrnSrvName,t1.TrnSrvCode" _
         & ",Count(*) as TrnCount" _
         & ",Sum(t1.TrnAmtAftDisc) as TrnAmtAftDisc_sum" _
         & ",Sum(t1.TrnDiscAmt) as TrnDiscAmt_sum"
        mQryStr = mQryStr & " from ("
        Rem reserved query string producing no records
        mQryStr = mQryStr & "Select OpgSrvCode as TrnSrvCode,ServMast.SrvName as TrnSrvName" _
         & ",OpgAmtAftDisc as TrnAmtAftDisc" _
         & ",OpgDiscAmt as TrnDiscAmt" _
         & " from OutdReg" _
         & " inner join ServMast on OutdReg.OpgSrvCode=ServMast.SrvCode" _
         & " where OpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and OpgCode>0 and True=False" _
         & IIf(mQryPttCode > 0, " and OpgPttCode=" & CStr(mQryPttCode), "") _
         & IIf(mQrySrvCode > 0, " and OpgSrvCode=" & CStr(mQrySrvCode), "")
        Rem outdoor registration
        If chkFByOutdReg.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select OpgSrvCode as TrnSrvCode,ServMast.SrvName as TrnSrvName" _
             & ",OpgAmtAftDisc as TrnAmtAftDisc" _
             & ",OpgDiscAmt as TrnDiscAmt" _
             & " from OutdReg" _
             & " inner join ServMast on OutdReg.OpgSrvCode=ServMast.SrvCode" _
             & " where OpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and OpgCode>0" _
             & IIf(mQryPttCode > 0, " and OpgPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and OpgSrvCode=" & CStr(mQrySrvCode), "")
        End If
        Rem outdoor receipt received amount
        If chkFByOutdRcpt.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select OrcSrvCode as TrnSrvCode,ServMast.SrvName as TrnSrvName" _
             & ",OrcRecdAmt as TrnAmtAftDisc" _
             & ",OrcDiscAmt as TrnDiscAmt" _
             & " from OutdRcpt" _
             & " inner join ServMast on OutdRcpt.OrcSrvCode=ServMast.SrvCode" _
             & " where OrcDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and OrcCode>0" _
             & IIf(mQryPttCode > 0, " and OrcPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and OrcSrvCode=" & CStr(mQrySrvCode), "")
        End If
        Rem outdoor payment
        If chkFByOutdPymt.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select -111 as TrnSrvCode,'Outdoor Rcpt Payment' as TrnSrvName" _
             & ",OphDepoAmt as TrnAmtAftDisc" _
             & ",0 as TrnDiscAmt" _
             & " from OutdPymtHdr" _
             & " where OphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and OphCode>0" _
             & IIf(mQryPttCode > 0, " and OphPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and True=False", "")
        End If
        Rem outdoor refund
        If chkFByOutdRefd.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select -112 as TrnSrvCode,'Outdoor Rcpt Refund' as TrnSrvName" _
             & ",OfhRefuAmt * -1 as TrnAmtAftDisc" _
             & ",0 as TrnDiscAmt" _
             & " from OutdRefdHdr" _
             & " where OfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and OfhCode>0" _
             & IIf(mQryPttCode > 0, " and OfhPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and True=False", "")
        End If
        Rem outdoor bill payment
        If chkFByOutdBlPymt.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select -113 as TrnSrvCode,'Outdoor Bill Payment' as TrnSrvName" _
             & ",ObphDepoAmt as TrnAmtAftDisc" _
             & ",0 as TrnDiscAmt" _
             & " from OutdBlPymtHdr" _
             & " where ObphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and ObphCode>0" _
             & IIf(mQryPttCode > 0, " and ObphPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and True=False", "")
        End If
        Rem outdoor bill refund
        If chkFByOutdBlRefd.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select -114 as TrnSrvCode,'Outdoor Bill Refund' as TrnSrvName" _
             & ",ObfhRefuAmt * -1 as TrnAmtAftDisc" _
             & ",0 as TrnDiscAmt" _
             & " from OutdBlRefdHdr" _
             & " where ObfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and ObfhCode>0" _
             & IIf(mQryPttCode > 0, " and ObfhPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and True=False", "")
        End If
        Rem indoor advance ---------------------
        If chkFByIndrReg.Value = vbChecked = True Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select -211 as TrnSrvCode,'Indoor Advance' as TrnSrvName" _
             & ",IpgAdvAmt as TrnAmtAftDisc" _
             & ",0 as TrnDiscAmt" _
             & " from IndrReg" _
             & " where IpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and IpgCode>0" _
             & IIf(mQryPttCode > 0, " and IpgPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and True=False", "")
        End If
        Rem indoor receipt received amount
        If chkFByIndrRcpt.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select IrcSrvCode as TrnSrvCode,ServMast.SrvName as TrnSrvName" _
             & ",IrcRecdAmt as TrnAmtAftDisc" _
             & ",IrcDiscAmt as TrnDiscAmt" _
             & " from IndrRcpt" _
             & " inner join ServMast on IndrRcpt.IrcSrvCode=ServMast.SrvCode" _
             & " where IrcDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and IrcCode>0" _
             & IIf(mQryPttCode > 0, " and IrcPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and IrcSrvCode=" & CStr(mQrySrvCode), "")
        End If
        Rem indoor payment
        If chkFByIndrPymt.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select -212 as TrnSrvCode,'Indoor Rcpt Payment' as TrnSrvName" _
             & ",IphDepoAmt as TrnAmtAftDisc" _
             & ",0 as TrnDiscAmt" _
             & " from IndrPymtHdr" _
             & " where IphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and IphCode>0" _
             & IIf(mQryPttCode > 0, " and IphPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and True=False", "")
        End If
        Rem indoor refund
        If chkFByIndrRefd.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select -213 as TrnSrvCode,'Indoor Rcpt Refund' as TrnSrvName" _
             & ",IfhRefuAmt * -1 as TrnAmtAftDisc" _
             & ",0 as TrnDiscAmt" _
             & " from IndrRefdHdr" _
             & " where IfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and IfhCode>0" _
             & IIf(mQryPttCode > 0, " and IfhPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and True=False", "")
        End If
        Rem indoor bill payment
        If chkFByIndrBlPymt.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select -214 as TrnSrvCode,'Indoor Bill Payment' as TrnSrvName" _
             & ",IbphDepoAmt as TrnAmtAftDisc" _
             & ",0 as TrnDiscAmt" _
             & " from IndrBlPymtHdr" _
             & " where IbphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and IbphCode>0" _
             & IIf(mQryPttCode > 0, " and IbphPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and True=False", "")
        End If
        Rem indoor bill refund
        If chkFByIndrBlRefd.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select -215 as TrnSrvCode,'Indoor Bill Refund' as TrnSrvName" _
             & ",IbfhRefuAmt * -1 as TrnAmtAftDisc" _
             & ",0 as TrnDiscAmt" _
             & " from IndrBlRefdHdr" _
             & " where IbfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and IbfhCode>0" _
             & IIf(mQryPttCode > 0, " and IbfhPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and True=False", "")
        End If
        Rem indoor on a/c payment
        If chkFByIndrRgPymt.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select -216 as TrnSrvCode,'Indoor On A/c. Payment' as TrnSrvName" _
             & ",IgtDpogAmt as TrnAmtAftDisc" _
             & ",0 as TrnDiscAmt" _
             & " from IndrRgPymt" _
             & " where IgtDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and IgtCode>0" _
             & IIf(mQryPttCode > 0, " and IgtPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and True=False", "")
        End If
        Rem indoor on a/c refund
        If chkFByIndrRgRefd.Value = vbChecked Then
            mQryStr = mQryStr & " UNION ALL "
            mQryStr = mQryStr & " Select -217 as TrnSrvCode,'Indoor On A/c. Refund' as TrnSrvName" _
             & ",IgfRfugAmt * -1 as TrnAmtAftDisc" _
             & ",0 as TrnDiscAmt" _
             & " from IndrRgRefd" _
             & " where IgfDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
             & " and IgfCode>0" _
             & IIf(mQryPttCode > 0, " and IgfPttCode=" & CStr(mQryPttCode), "") _
             & IIf(mQrySrvCode > 0, " and True=False", "")
        End If
        Rem ----------------------------------
        mQryStr = mQryStr & ")"
        mQryStr = mQryStr & " as t1 group by t1.TrnSrvName,t1.TrnSrvCode" _
         & " order by t1.TrnSrvName,t1.TrnSrvCode"
        
        datRecset.Open mQryStr, dbHmsDatabase, adOpenKeyset, adLockReadOnly
    End If
    
ElseIf optDetailed.Value = True Then
    clsListStru.AddFields mExpr:="tTrnSmryId", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="TrnType", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="TrnCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="VtmName", mTitle:="Voucher", mAlign:=1, mWidth:=2250, mShowItem:=True
    clsListStru.AddFields mExpr:="TrnVchNo", mTitle:="Vchr.No", mAlign:=7, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="TrnDate", mTitle:="Date", mAlign:=1, mWidth:=1300, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="PttCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="PttName", mTitle:="Patient Name", mAlign:=1, mWidth:=2500, mShowItem:=True
    clsListStru.AddFields mExpr:="PttRegNo", mTitle:="Reg.No", mAlign:=7, mWidth:=1250, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="TrnSrvName", mTitle:="Service Name", mAlign:=1, mWidth:=2500, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="TrnAmtAftDisc", mTitle:="Recd.Amt", mAlign:=7, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="TrnDiscAmt", mTitle:="Discount", mAlign:=7, mWidth:=1250, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="PttRefName", mTitle:="Care of", mAlign:=1, mWidth:=2000, mShowItem:=True
    clsListStru.AddFields mExpr:="PttAddr", mTitle:="Address", mAlign:=1, mWidth:=2000, mShowItem:=True
    clsListStru.AddFields mExpr:="PatAraName", mTitle:="Area", mAlign:=1, mWidth:=1500, mShowItem:=True
    clsListStru.AddFields mExpr:="PatStnName", mTitle:="Station", mAlign:=1, mWidth:=1500, mShowItem:=True
    clsListStru.AddFields mExpr:="PatPcgName", mTitle:="Category", mAlign:=1, mWidth:=2000, mShowItem:=True
    
    mQryStr = "Select *" _
     & ",format(TrnDate,'yyyymmdd')+TrnType+format(TrnCode,'0000000') as tTrnSmryId"
    mQryStr = mQryStr & " from ("
    Rem reserved query string producing no records
    mQryStr = mQryStr & "Select " _
     & "'Opg' as TrnType" _
     & ",OpgCode as TrnCode" _
     & ",OpgDate as TrnDate" _
     & ",OpgSrvCode as TrnSrvCode,ServMast.SrvName as TrnSrvName" _
     & ",OpgPttCode as TrnPttCode" _
     & ",OpgVtmCode as TrnVtmCode" _
     & ",OpgVchNo as TrnVchNo" _
     & ",OpgAmtAftDisc as TrnAmtAftDisc" _
     & ",OpgDiscAmt as TrnDiscAmt" _
     & " from OutdReg" _
     & " inner join ServMast on OutdReg.OpgSrvCode=ServMast.SrvCode" _
     & " where OpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & " and OpgCode>0 and True=False" _
     & IIf(mQryPttCode > 0, " and OpgPttCode=" & CStr(mQryPttCode), "") _
     & IIf(mQrySrvCode > 0, " and OpgSrvCode=" & CStr(mQrySrvCode), "")
    Rem outdoor registration
    If chkFByOutdReg.Value = vbChecked Then
        mQryStr = mQryStr & " UNION ALL "
        mQryStr = mQryStr & " Select " _
         & "'Opg' as TrnType" _
         & ",OpgCode as TrnCode" _
         & ",OpgDate as TrnDate" _
         & ",OpgSrvCode as TrnSrvCode,ServMast.SrvName as TrnSrvName" _
         & ",OpgPttCode as TrnPttCode" _
         & ",OpgVtmCode as TrnVtmCode" _
         & ",OpgVchNo as TrnVchNo" _
         & ",OpgAmtAftDisc as TrnAmtAftDisc" _
         & ",OpgDiscAmt as TrnDiscAmt" _
         & " from OutdReg" _
         & " inner join ServMast on OutdReg.OpgSrvCode=ServMast.SrvCode" _
         & " where OpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and OpgCode>0" _
         & IIf(mQryPttCode > 0, " and OpgPttCode=" & CStr(mQryPttCode), "") _
         & IIf(mQrySrvCode > 0, " and OpgSrvCode=" & CStr(mQrySrvCode), "")
    End If
    Rem outdoor receipt received amount
    If chkFByOutdRcpt.Value = vbChecked Then
        mQryStr = mQryStr & " UNION ALL "
        mQryStr = mQryStr & " Select " _
         & "'Orc' as TrnType" _
         & ",OrcICode as TrnCode" _
         & ",OrcDate as TrnDate" _
         & ",OrcSrvCode as TrnSrvCode,ServMast.SrvName as TrnSrvName" _
         & ",OrcPttCode as TrnPttCode" _
         & ",OhrVtmCode as TrnVtmCode" _
         & ",OhrVchNo as TrnVchNo" _
         & ",OrcRecdAmt as TrnAmtAftDisc" _
         & ",OrcDiscAmt as TrnDiscAmt" _
         & " from (OutdRcpt" _
         & " inner join OutdHdr on OutdRcpt.OrcCode=OutdHdr.OhrCode)" _
         & " inner join ServMast on OutdRcpt.OrcSrvCode=ServMast.SrvCode" _
         & " where OrcDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and OrcCode>0" _
         & IIf(mQryPttCode > 0, " and OrcPttCode=" & CStr(mQryPttCode), "") _
         & IIf(mQrySrvCode > 0, " and OrcSrvCode=" & CStr(mQrySrvCode), "")
    End If
    Rem outdoor payment
    If chkFByOutdPymt.Value = vbChecked Then
        mQryStr = mQryStr & " UNION ALL "
        mQryStr = mQryStr & " Select " _
         & "'Oph' as TrnType" _
         & ",OphCode as TrnCode" _
         & ",OphDate as TrnDate" _
         & ",-111 as TrnSrvCode,'Outdoor Rcpt Payment' as TrnSrvName" _
         & ",OphPttCode as TrnPttCode" _
         & ",OphVtmCode as TrnVtmCode" _
         & ",OphVchNo as TrnVchNo" _
         & ",OphDepoAmt as TrnAmtAftDisc" _
         & ",0 as TrnDiscAmt" _
         & " from OutdPymtHdr" _
         & " where OphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and OphCode>0" _
         & IIf(mQryPttCode > 0, " and OphPttCode=" & CStr(mQryPttCode), "") _
         & IIf(mQrySrvCode > 0, " and True=False", "")
    End If
    Rem outdoor refund
    If chkFByOutdRefd.Value = vbChecked Then
        mQryStr = mQryStr & " UNION ALL "
        mQryStr = mQryStr & " Select " _
         & "'Ofh' as TrnType" _
         & ",OfhCode as TrnCode" _
         & ",OfhDate as TrnDate" _
         & ",-112 as TrnSrvCode,'Outdoor Rcpt Refund' as TrnSrvName" _
         & ",OfhPttCode as TrnPttCode" _
         & ",OfhVtmCode as TrnVtmCode" _
         & ",OfhVchNo as TrnVchNo" _
         & ",OfhRefuAmt * -1 as TrnAmtAftDisc" _
         & ",0 as TrnDiscAmt" _
         & " from OutdRefdHdr" _
         & " where OfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and OfhCode>0" _
         & IIf(mQryPttCode > 0, " and OfhPttCode=" & CStr(mQryPttCode), "") _
         & IIf(mQrySrvCode > 0, " and True=False", "")
    End If
    Rem outdoor bill payment
    If chkFByOutdBlPymt.Value = vbChecked Then
        mQryStr = mQryStr & " UNION ALL "
        mQryStr = mQryStr & " Select " _
         & "'Obph' as TrnType" _
         & ",ObphCode as TrnCode" _
         & ",ObphDate as TrnDate" _
         & ",-113 as TrnSrvCode,'Outdoor Bill Payment' as TrnSrvName" _
         & ",ObphPttCode as TrnPttCode" _
         & ",ObphVtmCode as TrnVtmCode" _
         & ",ObphVchNo as TrnVchNo" _
         & ",ObphDepoAmt as TrnAmtAftDisc" _
         & ",0 as TrnDiscAmt" _
         & " from OutdBlPymtHdr" _
         & " where ObphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and ObphCode>0" _
         & IIf(mQryPttCode > 0, " and ObphPttCode=" & CStr(mQryPttCode), "") _
         & IIf(mQrySrvCode > 0, " and True=False", "")
    End If
    Rem outdoor bill refund
    If chkFByOutdBlRefd.Value = vbChecked Then
        mQryStr = mQryStr & " UNION ALL "
        mQryStr = mQryStr & " Select " _
         & "'Obfh' as TrnType" _
         & ",ObfhCode as TrnCode" _
         & ",ObfhDate as TrnDate" _
         & ",-114 as TrnSrvCode,'Outdoor Bill Refund' as TrnSrvName" _
         & ",ObfhPttCode as TrnPttCode" _
         & ",ObfhVtmCode as TrnVtmCode" _
         & ",ObfhVchNo as TrnVchNo" _
         & ",ObfhRefuAmt * -1 as TrnAmtAftDisc" _
         & ",0 as TrnDiscAmt" _
         & " from OutdBlRefdHdr" _
         & " where ObfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and ObfhCode>0" _
         & IIf(mQryPttCode > 0, " and ObfhPttCode=" & CStr(mQryPttCode), "") _
         & IIf(mQrySrvCode > 0, " and True=False", "")
    End If
    Rem indoor advance ---------------------
    If chkFByIndrReg.Value = vbChecked = True Then
        mQryStr = mQryStr & " UNION ALL "
        mQryStr = mQryStr & " Select " _
         & "'Ipg' as TrnType" _
         & ",IpgCode as TrnCode" _
         & ",IpgDate as TrnDate" _
         & ",-211 as TrnSrvCode,'Indoor Advance' as TrnSrvName" _
         & ",IpgPttCode as TrnPttCode" _
         & ",IpgVtmCode as TrnVtmCode" _
         & ",IpgVchNo as TrnVchNo" _
         & ",IpgAdvAmt as TrnAmtAftDisc" _
         & ",0 as TrnDiscAmt" _
         & " from IndrReg" _
         & " where IpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and IpgCode>0" _
         & IIf(mQryPttCode > 0, " and IpgPttCode=" & CStr(mQryPttCode), "") _
         & IIf(mQrySrvCode > 0, " and True=False", "")
    End If
    Rem indoor receipt received amount
    If chkFByIndrRcpt.Value = vbChecked Then
        mQryStr = mQryStr & " UNION ALL "
        mQryStr = mQryStr & " Select " _
         & "'Irc' as TrnType" _
         & ",IrcICode as TrnCode" _
         & ",IrcDate as TrnDate" _
         & ",IrcSrvCode as TrnSrvCode,ServMast.SrvName as TrnSrvName" _
         & ",IrcPttCode as TrnPttCode" _
         & ",IhrVtmCode as TrnVtmCode" _
         & ",IhrVchNo as TrnVchNo" _
         & ",IrcRecdAmt as TrnAmtAftDisc" _
         & ",IrcDiscAmt as TrnDiscAmt" _
         & " from (IndrRcpt" _
         & " inner join IndrHdr on IndrRcpt.IrcCode=IndrHdr.IhrCode)" _
         & " inner join ServMast on IndrRcpt.IrcSrvCode=ServMast.SrvCode" _
         & " where IrcDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and IrcCode>0" _
         & IIf(mQryPttCode > 0, " and IrcPttCode=" & CStr(mQryPttCode), "") _
         & IIf(mQrySrvCode > 0, " and IrcSrvCode=" & CStr(mQrySrvCode), "")
    End If
    Rem indoor payment
    If chkFByIndrPymt.Value = vbChecked Then
        mQryStr = mQryStr & " UNION ALL "
        mQryStr = mQryStr & " Select " _
         & "'Iph' as TrnType" _
         & ",IphCode as TrnCode" _
         & ",IphDate as TrnDate" _
         & ",-212 as TrnSrvCode,'Indoor Rcpt Payment' as TrnSrvName" _
         & ",IphPttCode as TrnPttCode" _
         & ",IphVtmCode as TrnVtmCode" _
         & ",IphVchNo as TrnVchNo" _
         & ",IphDepoAmt as TrnAmtAftDisc" _
         & ",0 as TrnDiscAmt" _
         & " from IndrPymtHdr" _
         & " where IphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and IphCode>0" _
         & IIf(mQryPttCode > 0, " and IphPttCode=" & CStr(mQryPttCode), "") _
         & IIf(mQrySrvCode > 0, " and True=False", "")
    End If
    Rem indoor refund
    If chkFByIndrRefd.Value = vbChecked Then
        mQryStr = mQryStr & " UNION ALL "
        mQryStr = mQryStr & " Select " _
         & "'Ifh' as TrnType" _
         & ",IfhCode as TrnCode" _
         & ",IfhDate as TrnDate" _
         & ",-213 as TrnSrvCode,'Indoor Rcpt Refund' as TrnSrvName" _
         & ",IfhPttCode as TrnPttCode" _
         & ",IfhVtmCode as TrnVtmCode" _
         & ",IfhVchNo as TrnVchNo" _
         & ",IfhRefuAmt * -1 as TrnAmtAftDisc" _
         & ",0 as TrnDiscAmt" _
         & " from IndrRefdHdr" _
         & " where IfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and IfhCode>0" _
         & IIf(mQryPttCode > 0, " and IfhPttCode=" & CStr(mQryPttCode), "") _
         & IIf(mQrySrvCode > 0, " and True=False", "")
    End If
    Rem indoor bill payment
    If chkFByIndrBlPymt.Value = vbChecked Then
        mQryStr = mQryStr & " UNION ALL "
        mQryStr = mQryStr & " Select " _
         & "'Ibph' as TrnType" _
         & ",IbphCode as TrnCode" _
         & ",IbphDate as TrnDate" _
         & ",-214 as TrnSrvCode,'Indoor Bill Payment' as TrnSrvName" _
         & ",IbphPttCode as TrnPttCode" _
         & ",IbphVtmCode as TrnVtmCode" _
         & ",IbphVchNo as TrnVchNo" _
         & ",IbphDepoAmt as TrnAmtAftDisc" _
         & ",0 as TrnDiscAmt" _
         & " from IndrBlPymtHdr" _
         & " where IbphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and IbphCode>0" _
         & IIf(mQryPttCode > 0, " and IbphPttCode=" & CStr(mQryPttCode), "") _
         & IIf(mQrySrvCode > 0, " and True=False", "")
    End If
    Rem indoor bill refund
    If chkFByIndrBlRefd.Value = vbChecked Then
        mQryStr = mQryStr & " UNION ALL "
        mQryStr = mQryStr & " Select " _
         & "'Ibfh' as TrnType" _
         & ",IbfhCode as TrnCode" _
         & ",IbfhDate as TrnDate" _
         & ",-215 as TrnSrvCode,'Indoor Bill Refund' as TrnSrvName" _
         & ",IbfhPttCode as TrnPttCode" _
         & ",IbfhVtmCode as TrnVtmCode" _
         & ",IbfhVchNo as TrnVchNo" _
         & ",IbfhRefuAmt * -1 as TrnAmtAftDisc" _
         & ",0 as TrnDiscAmt" _
         & " from IndrBlRefdHdr" _
         & " where IbfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and IbfhCode>0" _
         & IIf(mQryPttCode > 0, " and IbfhPttCode=" & CStr(mQryPttCode), "") _
         & IIf(mQrySrvCode > 0, " and True=False", "")
    End If
    Rem indoor on a/c payment
    If chkFByIndrRgPymt.Value = vbChecked Then
        mQryStr = mQryStr & " UNION ALL "
        mQryStr = mQryStr & " Select " _
         & "'Igt' as TrnType" _
         & ",IgtCode as TrnCode" _
         & ",IgtDate as TrnDate" _
         & ",-216 as TrnSrvCode,'Indoor On A/c. Payment' as TrnSrvName" _
         & ",IgtPttCode as TrnPttCode" _
         & ",IgtVtmCode as TrnVtmCode" _
         & ",IgtVchNo as TrnVchNo" _
         & ",IgtDpogAmt as TrnAmtAftDisc" _
         & ",0 as TrnDiscAmt" _
         & " from IndrRgPymt" _
         & " where IgtDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and IgtCode>0" _
         & IIf(mQryPttCode > 0, " and IgtPttCode=" & CStr(mQryPttCode), "") _
         & IIf(mQrySrvCode > 0, " and True=False", "")
    End If
    Rem indoor on a/c refund
    If chkFByIndrRgRefd.Value = vbChecked Then
        mQryStr = mQryStr & " UNION ALL "
        mQryStr = mQryStr & " Select " _
         & "'Igf' as TrnType" _
         & ",IgfCode as TrnCode" _
         & ",IgfDate as TrnDate" _
         & ",-217 as TrnSrvCode,'Indoor On A/c. Refund' as TrnSrvName" _
         & ",IgfPttCode as TrnPttCode" _
         & ",IgfVtmCode as TrnVtmCode" _
         & ",IgfVchNo as TrnVchNo" _
         & ",IgfRfugAmt * -1 as TrnAmtAftDisc" _
         & ",0 as TrnDiscAmt" _
         & " from IndrRgRefd" _
         & " where IgfDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and IgfCode>0" _
         & IIf(mQryPttCode > 0, " and IgfPttCode=" & CStr(mQryPttCode), "") _
         & IIf(mQrySrvCode > 0, " and True=False", "")
    End If
    Rem ----------------------------------
    mQryStr = mQryStr & ") as t1"
    mQryStr = mQryStr & " inner join PatMast on t1.TrnPttCode=PatMast.PttCode" _
     & " order by t1.TrnDate,t1.TrnType,t1.TrnCode"
    
    datRecset.Open mQryStr, dbHmsDatabase, adOpenKeyset, adLockReadOnly
    
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
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnAmtAftDisc_sum")) = ToMyNumFmt(.fields("TrnAmtAftDisc_sum"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDiscAmt_sum")) = ToMyNumFmt(.fields("TrnDiscAmt_sum"))
            
        ElseIf optDatewise.Value = True Then
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDateYMD")) = Format(.fields("TrnDate"), "yyyymmdd")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDate")) = Dtoc(.fields("TrnDate"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCount")) = ToMyNumFmt(.fields("TrnCount"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnAmtAftDisc_sum")) = ToMyNumFmt(.fields("TrnAmtAftDisc_sum"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDiscAmt_sum")) = ToMyNumFmt(.fields("TrnDiscAmt_sum"))
            
        ElseIf optPatientNamewise.Value = True Then
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttName")) = .fields("PttName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttRegNo")) = ToMyNumFmt(.fields("PttRegNo"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttRefName")) = .fields("PttRefName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCount")) = ToMyNumFmt(.fields("TrnCount"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnAmtAftDisc_sum")) = ToMyNumFmt(.fields("TrnAmtAftDisc_sum"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDiscAmt_sum")) = ToMyNumFmt(.fields("TrnDiscAmt_sum"))
            
        ElseIf optPatientRegNoWise.Value = True Then
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttRegNo")) = ToMyNumFmt(.fields("PttRegNo"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttName")) = .fields("PttName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttRefName")) = .fields("PttRefName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCount")) = ToMyNumFmt(.fields("TrnCount"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnAmtAftDisc_sum")) = ToMyNumFmt(.fields("TrnAmtAftDisc_sum"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDiscAmt_sum")) = ToMyNumFmt(.fields("TrnDiscAmt_sum"))
            
        ElseIf optServiceWise.Value = True Then
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnSrvName")) = .fields("TrnSrvName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCount")) = ToMyNumFmt(.fields("TrnCount"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnAmtAftDisc_sum")) = ToMyNumFmt(.fields("TrnAmtAftDisc_sum"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDiscAmt_sum")) = ToMyNumFmt(.fields("TrnDiscAmt_sum"))
        
        ElseIf optDetailed.Value = True Then
            clsPCG.GetData .fields("PttPcgCode")
            clsARA.GetData .fields("PttAraCode")
            clsSTN.GetData .fields("PttStnCode")
            clsVTM.GetData .fields("TrnVtmCode")
            
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("tTrnSmryId")) = .fields("tTrnSmryId")      'Format(.fields("TrnDate"), "yyyymmdd") & .fields("TrnType") & Format(.fields("TrnCode"), "0000000")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnType")) = .fields("TrnType")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCode")) = .fields("TrnCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("VtmName")) = clsVTM.mName_str
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnVchNo")) = .fields("TrnVchNo")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDate")) = Dtoc(.fields("TrnDate"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnAmtAftDisc")) = ToMyNumFmt(.fields("TrnAmtAftDisc"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDiscAmt")) = ToMyNumFmt(.fields("TrnDiscAmt"))
            ' ------------------------------------
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttCode")) = .fields("PttCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttName")) = .fields("PttName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttRegNo")) = .fields("PttRegNo")
            ' ------------------------------------
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnSrvName")) = .fields("TrnSrvName")
            ' ------------------------------------
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttRefName")) = .fields("PttRefName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttAddr")) = .fields("PttAddr")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PatAraName")) = clsARA.mName_str
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PatStnName")) = clsSTN.mName_str
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PatPcgName")) = clsPCG.mName_str
        
        End If
        If optDetailed.Value = True Then
            mCount_Tot = mCount_Tot + 1
            mAmtAftDisc_Tot = mAmtAftDisc_Tot + .fields("TrnAmtAftDisc")
            mDiscAmt_Tot = mDiscAmt_Tot + .fields("TrnDiscAmt")
        Else
            mCount_Tot = mCount_Tot + .fields("TrnCount")
            mAmtAftDisc_Tot = mAmtAftDisc_Tot + .fields("TrnAmtAftDisc_sum")
            mDiscAmt_Tot = mDiscAmt_Tot + .fields("TrnDiscAmt_sum")
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
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnAmtAftDisc_sum")) = ToMyNumFmt(mAmtAftDisc_Tot)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDiscAmt_sum")) = ToMyNumFmt(mDiscAmt_Tot)
    
ElseIf optDatewise.Value = True Then
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDateYMD")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDate")) = "Grand Total"
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCount")) = ToMyNumFmt(mCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnAmtAftDisc_sum")) = ToMyNumFmt(mAmtAftDisc_Tot)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDiscAmt_sum")) = ToMyNumFmt(mDiscAmt_Tot)
    
ElseIf optPatientNamewise.Value = True Then
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttName")) = "Grand Total"
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttRegNo")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttRefName")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCount")) = ToMyNumFmt(mCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnAmtAftDisc_sum")) = ToMyNumFmt(mAmtAftDisc_Tot)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDiscAmt_sum")) = ToMyNumFmt(mDiscAmt_Tot)
    
ElseIf optPatientRegNoWise.Value = True Then
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttRegNo")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttName")) = "Grand Total"
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttRefName")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCount")) = ToMyNumFmt(mCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnAmtAftDisc_sum")) = ToMyNumFmt(mAmtAftDisc_Tot)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDiscAmt_sum")) = ToMyNumFmt(mDiscAmt_Tot)
    
ElseIf optServiceWise.Value = True Then
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnSrvName")) = "Grand Total"
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCount")) = ToMyNumFmt(mCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnAmtAftDisc_sum")) = ToMyNumFmt(mAmtAftDisc_Tot)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDiscAmt_sum")) = ToMyNumFmt(mDiscAmt_Tot)
    
ElseIf optDetailed.Value = True Then
    
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("tTrnSmryId")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnType")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCode")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("VtmName")) = "Grand Total (" & CStr(mCount_Tot) & ")"
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnVchNo")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDate")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnAmtAftDisc")) = ToMyNumFmt(mAmtAftDisc_Tot)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDiscAmt")) = ToMyNumFmt(mDiscAmt_Tot)
    ' ------------------------------------
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttCode")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttName")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttRegNo")) = ""
    ' ------------------------------------
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnSrvName")) = ""
    ' ------------------------------------
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttRefName")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttAddr")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PatAraName")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PatStnName")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PatPcgName")) = ""

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
If Shift = 0 And KeyCode = vbKeyF12 Then
    fcmbPttRegNo.BoundText = CStr(mQryPttCode)
    fcmbPttName.BoundText = CStr(mQryPttCode)
    fcmbSrvName.BoundText = CStr(mQrySrvCode)
    mskQryPttRegNo.Text = fcmbPttRegNo.Text
    txtQryPttName.Text = fcmbPttName.Text
    txtQrySrvName.Text = fcmbSrvName.Text
    ' ----------------
    frConfigure.ZOrder
    frConfigure.Visible = True
    Mfgrd1.Enabled = False
    dtpFromDate.SetFocus
ElseIf MyAddNewKey(Shift, KeyCode) = True Then
    Call Data_AddEvent
ElseIf MyDeleteKey(Shift, KeyCode) = True Then
    If Mfgrd1.Row < Mfgrd1.Rows - 1 And optDetailed.Value = True Then
        'Call Data_DeleteEvent
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

Private Sub optPatientRegNoWise_GotFocus()
FlashActiveControl optPatientRegNoWise, True
End Sub

Private Sub optPatientRegNoWise_LostFocus()
FlashActiveControl optPatientRegNoWise, False
End Sub

Private Sub optServiceWise_GotFocus()
FlashActiveControl optServiceWise, True
End Sub

Private Sub optServiceWise_LostFocus()
FlashActiveControl optServiceWise, False
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
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("tTrnSmryId"), mText
    ElseIf optMonthwise.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("TrnYrMonth"), mText
    ElseIf optDatewise.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("TrnDateYMD"), mText
    ElseIf optPatientNamewise.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("PttName"), mText
    ElseIf optPatientRegNoWise.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("PttRegNo"), mText
    ElseIf optServiceWise.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("SrvName"), mText
    End If
End If
ShowActiveFlexRow Mfgrd1

End Sub

Private Sub txtQryPttName_Change()
If fcmbPttName.CallFromText_Change = False Then
    fcmbPttName.CallFromText_Change = True
    If InterActiveChange(txtQryPttName) = True Then
        fcmbPttName.UserText = Array(txtQryPttName.Text, txtQryPttName.SelStart)
        fcmbPttName.Show
        txtQryPttName.Text = fcmbPttName.Text
        mQryPttCode = Val(fcmbPttName.BoundText)
        fcmbPttRegNo.BoundText = CStr(mQryPttCode)
        mskQryPttRegNo.Text = fcmbPttRegNo.Text
        If fcmbPttName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbPttName.CallFromText_Change = False
End If

End Sub

Private Sub txtQryPttName_GotFocus()
FlashActiveControl txtQryPttName, True
End Sub

Private Sub txtQryPttName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtQryPttName_Change
ElseIf MyAddNewKey(Shift, KeyCode) = True Then
    Rem not required
End If

End Sub

Private Sub txtQryPttName_LostFocus()
FlashActiveControl txtQryPttName, False
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

Private Sub txtQrySrvName_Change()
If fcmbSrvName.CallFromText_Change = False Then
    fcmbSrvName.CallFromText_Change = True
    If InterActiveChange(txtQrySrvName) = True Then
        fcmbSrvName.UserText = Array(txtQrySrvName.Text, txtQrySrvName.SelStart)
        fcmbSrvName.Show
        txtQrySrvName.Text = fcmbSrvName.Text
        If fcmbSrvName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbSrvName.CallFromText_Change = False
End If

End Sub

Private Sub txtQrySrvName_GotFocus()
FlashActiveControl txtQrySrvName, True
End Sub

Private Sub txtQrySrvName_LostFocus()
FlashActiveControl txtQrySrvName, False
End Sub

Private Sub txtQrySrvName_Validate(Cancel As Boolean)
'Dim mOpgRate As Double, mOpgDiscPer As Double, mOpgInfByPer As Double, mOpgDefByPer As Double
'
'If Val(fcmbSrvName.BoundText) <= 0 Then
'    ErrorBox "Invalid Selection !!!"
'    txtSrvName.SetFocus
'    Cancel = True
'Else
'    If Val(fcmbSrvName.BoundText) <> mOpgSrvCode_old Or FormAddEditMode = cFORM_ADDMODE Then
'        Call ChkServRate
'        Call CalcOpgChg
'    End If
'End If

End Sub

'Private Sub ChkServRate()
'Dim mOpgRate As Double, mOpgDiscPer As Double, mOpgInfByPer As Double, mOpgDefByPer As Double
'
'If FormAddEditMode = cFORM_ADDMODE Or Val(fcmbSrvName.BoundText) <> mOpgSrvCode_old Or mOpgCDctCode_old <> Val(fcmbCDctName.BoundText) Or mPttPcgCode_old <> Val(fcmbPcgName.BoundText) Or mOpgRByCode_old <> Val(fcmbRByName.BoundText) Or mOpgDate_old <> Ctod(dtpOpgDate.Text) Or mOpgTime_old <> TimeToMin(txtOpgTime_str) Then     ' Or mOpgRToCode_old <> Val(fcmbRToName.BoundText)
'    GetServRateValues cnn:=dbHmsDatabase, mSrvCode:=Val(fcmbSrvName.BoundText), mTranDate:=Ctod(dtpOpgDate.Text), mTranTime:=TimeToMin(txtOpgTime_str.Text), mSrmDctCode:=Val(fcmbCDctName.BoundText), mSrmPcgCode:=Val(fcmbPcgName.BoundText), mSrmRByCode:=Val(fcmbRByName.BoundText), mSrmRToCode:=0, mSrmRate:=mOpgRate, mSrmDiscPer:=mOpgDiscPer, mSrmInfByPer:=mOpgInfByPer, mSrmDefByPer:=mOpgDefByPer
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
'    If Val(fcmbVtmName.BoundText) <> mOpgVtmCode_old Or Ctod(dtpOpgDate.Text) <> mOpgDate_old Or FormAddEditMode = cFORM_ADDMODE Then
'        mOpgVchNo = GetNextVTypeNo(dbHmsDatabase, dbAcDatabase, dbComDatabase, mTableName:="OutdReg", mFieldName:="OpgVchNo", mVtmFieldName:="OpgVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="OpgCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="OpgDate", mDateFieldValue:=Ctod(dtpOpgDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormOpgAcsPermFileName)
'        mskOpgVchNo.Text = ToMyNumFmt(mOpgVchNo, mDecimals:=0)
'    End If
'End If
'
'End Sub

'Private Sub CalcOpgChg()
'Dim mOpgUnit As Long, mOpgRate As Double, mOpgAmtBefDisc As Double, mOpgDiscPer As Double, mOpgDiscAmt As Double, mOpgAmtAftDisc As Double
'mOpgUnit = Val(UnMyNumFmt(mskOpgUnit.Text))
'mOpgRate = Val(UnMyNumFmt(mskOpgRate.Text))
'mOpgAmtBefDisc = mOpgUnit * mOpgRate
'mOpgDiscPer = Val(UnMyPerFmt(mskOpgDiscPer.Text))
'mOpgDiscAmt = Round(mOpgAmtBefDisc * mOpgDiscPer / 100, 2)
'mOpgAmtAftDisc = mOpgAmtBefDisc - mOpgDiscAmt
'' --------
'mskOpgAmtBefDisc.Text = ToMyNumFmt(mOpgAmtBefDisc)
'mskOpgDiscAmt.Text = ToMyNumFmt(mOpgDiscAmt)
'mskOpgAmtAftDisc.Text = ToMyNumFmt(mOpgAmtAftDisc)
'
'End Sub

'Private Sub ShowOldOpgCodeDesc(ByVal mOldOpgCode As Long)
'Dim tRecset As New ADODB.Recordset
'
'With tRecset
'.Open "Select * from OutdReg where OpgCode=" & CStr(mOldOpgCode) & "", dbHmsDatabase, adOpenKeyset, adLockOptimistic
'If .RecordCount > 0 Then
'    clsVTM.GetData .fields("OpgVtmCode")
'    lblOldOpgCodeDesc.Caption = RTrim(clsVTM.mName_str) & " No.:" & CStr(.fields("OpgVchNo")) & " Dated:" & Dtoc(.fields("OpgDate"))
'Else
'    lblOldOpgCodeDesc.Caption = "#" & CStr(mOldOpgCode) & "#"
'End If
'End With
'CloseTable tRecset
'
'End Sub

'Private Function GetOldOpgCodeFromPttCode(ByVal mPttCode As Long) As Long
'Dim tRecset As New ADODB.Recordset
'
'With tRecset
'.Open "Select top 1 * from OutdReg where OpgPttCode=" & CStr(mPttCode) & " order by OpgDate desc,OpgVchNo desc,OpgCode desc", dbHmsDatabase, adOpenKeyset, adLockOptimistic
'If .RecordCount > 0 Then
'    GetOldOpgCodeFromPttCode = .fields("OpgCode")
'Else
'    GetOldOpgCodeFromPttCode = 0
'End If
'End With
'CloseTable tRecset
'
'End Function

'Private Sub ShowPttDiscPer(ByVal mPttCode As Long)
'Dim tRecset As New ADODB.Recordset
'
'With tRecset
'.Open "Select * from PatMast where PttCode=" & CStr(mPttCode) & "", dbHmsDatabase, adOpenKeyset, adLockOptimistic
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
'Dim tRecset As New ADODB.Recordset, mOldOpgCode As Long, mOldPttCode As Long
'
'If fcmbOldOpgByOpgNo.CallFromText_Change = False Then
'    fcmbOldOpgByOpgNo.CallFromText_Change = True
'    If InterActiveChange(txtVtmName) = True Then
'        fcmbOldOpgByOpgNo.UserText = Array("", 0)
'        fcmbOldOpgByOpgNo.Show
'        If fcmbOldOpgByOpgNo.ListSelected = True And Val(fcmbOldOpgByOpgNo.BoundText) > 0 Then
'            mOldOpgCode = Val(fcmbOldOpgByOpgNo.BoundText)
'            tRecset.Open "Select * from OutdReg where OpgCode=" & CStr(mOldOpgCode) & " order by OpgDate,OpgVchNo,OpgCode", dbHmsDatabase, adOpenKeyset, adLockOptimistic
'            If tRecset.RecordCount > 0 Then
'                mOldPttCode = tRecset.fields("OpgPttCode")
'            End If
'            CloseTable tRecset
'            If FormAddEditMode = cFORM_ADDMODE And mOldOpgCode > 0 And mOldPttCode > 0 Then
'                clsPAT.EndMast mPttCode
'                PatAddEditMode = cFORM_EDITMODE
'                mPttCode = mOldPttCode
'                If clsPAT.BeginMast(mPttCode) = True Then
'                    mPttCode = clsPAT.ActiveCode
'                Else
'                    mPttCode = 0
'                End If
'                ShowPttDiscPer mPttCode
'                Rem mOpgOldOpgCode = GetOldOpgCodeFromPttCode(mPttCode) will create chaos when last entry entered first and earlier entry entered in last
'                mOpgOldOpgCode = mOldOpgCode
'                ShowPatData mPttCode
'                ShowOldOpgCodeDesc mOpgOldOpgCode
'            Else
'                If mOldOpgCode > 0 And mOldPttCode > 0 Then
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
'Dim tRecset As New ADODB.Recordset, mOldOpgCode As Long, mOldPttCode As Long
'
'If fcmbOldOpgByPttRegNo.CallFromText_Change = False Then
'    fcmbOldOpgByPttRegNo.CallFromText_Change = True
'    If InterActiveChange(mskPttRegNo) = True Then
'        fcmbOldOpgByPttRegNo.UserText = Array("", 0)
'        fcmbOldOpgByPttRegNo.Show
'        If fcmbOldOpgByPttRegNo.ListSelected = True And Val(fcmbOldOpgByPttRegNo.BoundText) > 0 Then
'            mOldOpgCode = Val(fcmbOldOpgByPttRegNo.LFieldValue("OpgCode"))
'            tRecset.Open "Select * from OutdReg where OpgCode=" & CStr(mOldOpgCode) & "", dbHmsDatabase, adOpenKeyset, adLockOptimistic
'            If tRecset.RecordCount > 0 Then
'                mOldPttCode = tRecset.fields("OpgPttCode")
'            End If
'            CloseTable tRecset
'            If FormAddEditMode = cFORM_ADDMODE And mOldOpgCode > 0 And mOldPttCode > 0 Then
'                clsPAT.EndMast mPttCode
'                PatAddEditMode = cFORM_EDITMODE
'                mPttCode = mOldPttCode
'                If clsPAT.BeginMast(mPttCode) = True Then
'                    mPttCode = clsPAT.ActiveCode
'                Else
'                    mPttCode = 0
'                End If
'                ShowPttDiscPer mPttCode
'                Rem mOpgOldOpgCode = GetOldOpgCodeFromPttCode(mPttCode) will create chaos when last entry entered first and earlier entry entered in last
'                mOpgOldOpgCode = mOldOpgCode
'                ShowPatData mPttCode
'                ShowOldOpgCodeDesc mOpgOldOpgCode
'            Else
'                If mOldOpgCode > 0 And mOldPttCode > 0 Then
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

'Private Sub ShowOldOpgListByPttName()
'Dim tRecset As New ADODB.Recordset, mOldOpgCode As Long, mOldPttCode As Long
'
'If fcmbOldOpgByPttName.CallFromText_Change = False Then
'    fcmbOldOpgByPttName.CallFromText_Change = True
'    If InterActiveChange(mskPttRegNo) = True Then
'        fcmbOldOpgByPttName.UserText = Array("", 0)
'        fcmbOldOpgByPttName.Show
'        If fcmbOldOpgByPttName.ListSelected = True And Val(fcmbOldOpgByPttName.BoundText) > 0 Then
'            mOldOpgCode = Val(fcmbOldOpgByPttName.LFieldValue("OpgCode"))
'            tRecset.Open "Select * from OutdReg where OpgCode=" & CStr(mOldOpgCode) & "", dbHmsDatabase, adOpenKeyset, adLockOptimistic
'            If tRecset.RecordCount > 0 Then
'                mOldPttCode = tRecset.fields("OpgPttCode")
'            End If
'            CloseTable tRecset
'            If FormAddEditMode = cFORM_ADDMODE And mOldOpgCode > 0 And mOldPttCode > 0 Then
'                clsPAT.EndMast mPttCode
'                PatAddEditMode = cFORM_EDITMODE
'                mPttCode = mOldPttCode
'                If clsPAT.BeginMast(mPttCode) = True Then
'                    mPttCode = clsPAT.ActiveCode
'                Else
'                    mPttCode = 0
'                End If
'                ShowPttDiscPer mPttCode
'                Rem mOpgOldOpgCode = GetOldOpgCodeFromPttCode(mPttCode) will create chaos when last entry entered first and earlier entry entered in last
'                mOpgOldOpgCode = mOldOpgCode
'                ShowPatData mPttCode
'                ShowOldOpgCodeDesc mOpgOldOpgCode
'            Else
'                If mOldOpgCode > 0 And mOldPttCode > 0 Then
'                    AlertBox "Prohibited in Edit Mode !!!"
'                End If
'            End If
'        End If
'    End If
'    fcmbOldOpgByPttName.CallFromText_Change = False
'End If
'CloseTable tRecset, mCheckOpen:=True
'
'End Sub

