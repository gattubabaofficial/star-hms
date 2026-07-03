VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "Mscomctl.ocx"
Begin VB.Form frmCollectionViewRep 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   ClientHeight    =   10980
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
   LockControls    =   -1  'True
   ScaleHeight     =   10980
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
      Begin VB.Frame frPrintCRList 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   3615
         Left            =   3960
         TabIndex        =   58
         Top             =   2520
         Width           =   5895
         Begin VB.TextBox txtToTime1 
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
            Left            =   4440
            MaxLength       =   50
            TabIndex        =   69
            TabStop         =   0   'False
            Text            =   "00:00"
            Top             =   960
            Width           =   855
         End
         Begin VB.TextBox txtFromTime1 
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
            Left            =   4440
            MaxLength       =   50
            TabIndex        =   68
            TabStop         =   0   'False
            Text            =   "00:00"
            Top             =   600
            Width           =   855
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
            Left            =   2160
            TabIndex        =   45
            Tag             =   "AhCode"
            Text            =   "dd/mm/yyyy"
            Top             =   600
            Width           =   1575
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
            Left            =   2160
            TabIndex        =   46
            Tag             =   "AhCode"
            Text            =   "dd/mm/yyyy"
            Top             =   960
            Width           =   1575
         End
         Begin VB.CommandButton cmdPrintCRL 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
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
            Left            =   2520
            Style           =   1  'Graphical
            TabIndex        =   51
            Top             =   3000
            Width           =   855
         End
         Begin VB.ComboBox cmbCRList 
            Height          =   315
            Left            =   2160
            Style           =   2  'Dropdown List
            TabIndex        =   47
            Top             =   1320
            Width           =   3495
         End
         Begin VB.TextBox mskPrintCopies 
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
            Left            =   2160
            TabIndex        =   49
            Text            =   "0"
            Top             =   2040
            Width           =   1455
         End
         Begin VB.ComboBox cmbPrintDest 
            Height          =   315
            Left            =   2160
            Style           =   2  'Dropdown List
            TabIndex        =   50
            Top             =   2400
            Width           =   3495
         End
         Begin VB.ComboBox cmbPrinterList 
            Height          =   315
            Left            =   2160
            Style           =   2  'Dropdown List
            TabIndex        =   48
            Top             =   1680
            Width           =   3495
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Time:"
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
            Index           =   13
            Left            =   3840
            TabIndex        =   67
            Top             =   960
            Width           =   615
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Time:"
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
            Left            =   3840
            TabIndex        =   66
            Top             =   600
            Width           =   615
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
            Index           =   7
            Left            =   120
            TabIndex        =   65
            Top             =   600
            Width           =   1335
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
            Index           =   0
            Left            =   120
            TabIndex        =   64
            Top             =   960
            Width           =   1335
         End
         Begin VB.Label Label2 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Print Dialog"
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
            Index           =   36
            Left            =   0
            TabIndex        =   63
            Top             =   0
            Width           =   5895
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Print Format Name:"
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
            Left            =   120
            TabIndex        =   62
            Top             =   1320
            Width           =   1935
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "No. of Copies:"
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
            Index           =   10
            Left            =   120
            TabIndex        =   61
            Top             =   2040
            Width           =   1935
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Destination:"
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
            Index           =   11
            Left            =   120
            TabIndex        =   60
            Top             =   2400
            Width           =   1935
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Printer Name:"
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
            Index           =   12
            Left            =   120
            TabIndex        =   59
            Top             =   1680
            Width           =   1935
         End
      End
      Begin VB.Frame frConfigure 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   8955
         Left            =   1440
         TabIndex        =   70
         Top             =   120
         Width           =   10815
         Begin VB.TextBox txtQrySgpName 
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
            Height          =   285
            Left            =   1920
            TabIndex        =   15
            Top             =   2040
            Width           =   4455
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
            Left            =   1920
            TabIndex        =   13
            Top             =   1320
            Width           =   4455
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
            Left            =   1920
            TabIndex        =   10
            Tag             =   "AhCode"
            Text            =   "dd/mm/yyyy"
            Top             =   600
            Width           =   1575
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
            Left            =   4680
            TabIndex        =   11
            Tag             =   "AhCode"
            Text            =   "dd/mm/yyyy"
            Top             =   600
            Width           =   1575
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
            Height          =   5115
            Left            =   120
            TabIndex        =   17
            Top             =   2820
            Width           =   3735
            Begin VB.OptionButton optServGrpNServWise 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Service Group/Service-wise"
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
               TabIndex        =   26
               Top             =   4080
               Width           =   3315
            End
            Begin VB.OptionButton optServGrpWise 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Service Group-wise"
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
               TabIndex        =   25
               Top             =   3660
               Width           =   3315
            End
            Begin VB.OptionButton optEntityNamewise 
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
               TabIndex        =   22
               Top             =   2280
               Width           =   3315
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
               TabIndex        =   21
               Top             =   1800
               Width           =   3315
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
               TabIndex        =   20
               Top             =   1320
               Width           =   3315
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
               TabIndex        =   19
               Top             =   840
               Value           =   -1  'True
               Width           =   3315
            End
            Begin VB.OptionButton optEntityRegNoWise 
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
               TabIndex        =   23
               Top             =   2760
               Width           =   3315
            End
            Begin VB.OptionButton optServiceWise 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Service-wise"
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
               TabIndex        =   24
               Top             =   3240
               Width           =   3315
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
               TabIndex        =   18
               Top             =   360
               Width           =   3315
            End
            Begin VB.OptionButton optVTypewise 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Voucher Type-wise"
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
               TabIndex        =   27
               Top             =   4500
               Width           =   3315
            End
         End
         Begin VB.CommandButton cmdConfigure 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
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
            Left            =   5100
            Style           =   1  'Graphical
            TabIndex        =   44
            Top             =   8280
            Width           =   855
         End
         Begin VB.TextBox mskQryEttRegNo 
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
            Left            =   1920
            TabIndex        =   12
            Text            =   "0"
            Top             =   960
            Width           =   1575
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
            Height          =   5115
            Left            =   3960
            TabIndex        =   71
            Top             =   2820
            Width           =   6555
            Begin VB.CheckBox chkFByOutdReg1 
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
               Height          =   285
               Left            =   360
               TabIndex        =   29
               Top             =   720
               Value           =   1  'Checked
               Visible         =   0   'False
               Width           =   2895
            End
            Begin VB.CheckBox chkFByOutdRcpt 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Blood Issue Receipt"
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
               Left            =   3300
               TabIndex        =   30
               Top             =   720
               Value           =   1  'Checked
               Width           =   3015
            End
            Begin VB.CheckBox chkFByOutdPymt 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Blood Issue Payment"
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
               Left            =   360
               TabIndex        =   31
               Top             =   1140
               Value           =   1  'Checked
               Width           =   2895
            End
            Begin VB.CheckBox chkFByOutdRefd 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Blood Issue Refund"
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
               Left            =   3300
               TabIndex        =   32
               Top             =   1140
               Value           =   1  'Checked
               Width           =   3015
            End
            Begin VB.CheckBox chkFByIndrReg1 
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
               Height          =   285
               Left            =   360
               TabIndex        =   36
               Top             =   2640
               Value           =   1  'Checked
               Visible         =   0   'False
               Width           =   2895
            End
            Begin VB.CheckBox chkFByIndrRcpt1 
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
               Height          =   285
               Left            =   3300
               TabIndex        =   37
               Top             =   2640
               Value           =   1  'Checked
               Visible         =   0   'False
               Width           =   3015
            End
            Begin VB.CheckBox chkFByIndrPymt1 
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
               Height          =   285
               Left            =   360
               TabIndex        =   38
               Top             =   3120
               Value           =   1  'Checked
               Visible         =   0   'False
               Width           =   2895
            End
            Begin VB.CheckBox chkFByIndrRefd1 
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
               Height          =   285
               Left            =   3300
               TabIndex        =   39
               Top             =   3120
               Value           =   1  'Checked
               Visible         =   0   'False
               Width           =   3015
            End
            Begin VB.CheckBox chkFByIndrRgPymt1 
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
               Height          =   285
               Left            =   360
               TabIndex        =   40
               Top             =   3540
               Value           =   1  'Checked
               Visible         =   0   'False
               Width           =   2895
            End
            Begin VB.CheckBox chkFByIndrRgRefd1 
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
               Height          =   285
               Left            =   3300
               TabIndex        =   41
               Top             =   3540
               Value           =   1  'Checked
               Visible         =   0   'False
               Width           =   3015
            End
            Begin VB.CheckBox chkFByIndrBlPymt1 
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
               Height          =   285
               Left            =   360
               TabIndex        =   42
               Top             =   4020
               Value           =   1  'Checked
               Visible         =   0   'False
               Width           =   2895
            End
            Begin VB.CheckBox chkFByIndrBlRefd1 
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
               Height          =   285
               Left            =   3300
               TabIndex        =   43
               Top             =   4020
               Value           =   1  'Checked
               Visible         =   0   'False
               Width           =   3015
            End
            Begin VB.CheckBox chkFByOutdoor 
               Caption         =   "Blood Issue Collection (All)"
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
               TabIndex        =   28
               Top             =   360
               Value           =   1  'Checked
               Visible         =   0   'False
               Width           =   3495
            End
            Begin VB.CheckBox chkFByIndoor1 
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
               Height          =   285
               Left            =   120
               TabIndex        =   35
               Top             =   2220
               Value           =   1  'Checked
               Visible         =   0   'False
               Width           =   3495
            End
            Begin VB.CheckBox chkFByOutdBlPymt1 
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
               Height          =   285
               Left            =   360
               TabIndex        =   33
               Top             =   1620
               Value           =   1  'Checked
               Visible         =   0   'False
               Width           =   2895
            End
            Begin VB.CheckBox chkFByOutdBlRefd1 
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
               Height          =   285
               Left            =   3300
               TabIndex        =   34
               Top             =   1620
               Value           =   1  'Checked
               Visible         =   0   'False
               Width           =   3015
            End
         End
         Begin VB.TextBox txtQrySrvName 
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
            Height          =   285
            Left            =   1920
            TabIndex        =   14
            Top             =   1680
            Width           =   4455
         End
         Begin VB.TextBox txtQryVtmName 
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
            Left            =   1920
            TabIndex        =   16
            Top             =   2400
            Width           =   4455
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Service Group:"
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
            Index           =   15
            Left            =   120
            TabIndex        =   79
            Top             =   2040
            Width           =   1815
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
            TabIndex        =   78
            Top             =   1320
            Width           =   1815
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
            TabIndex        =   77
            Top             =   0
            Width           =   10815
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
            TabIndex        =   76
            Top             =   600
            Width           =   1815
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
            Left            =   3720
            TabIndex        =   75
            Top             =   600
            Width           =   855
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
            TabIndex        =   74
            Top             =   960
            Width           =   1815
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
            TabIndex        =   73
            Top             =   1680
            Width           =   1815
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Voucher Type:"
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
            Index           =   14
            Left            =   120
            TabIndex        =   72
            Top             =   2400
            Width           =   1815
         End
      End
      Begin VB.CommandButton cmdPrintRep 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFF80&
         Caption         =   "Print Report"
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
         TabIndex        =   53
         Top             =   8760
         Width           =   1575
      End
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
         TabIndex        =   54
         Top             =   9240
         Width           =   1575
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
         TabIndex        =   56
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
         TabIndex        =   55
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
         TabIndex        =   52
         Top             =   360
         Width           =   735
      End
   End
   Begin VB.TextBox txtVoid 
      CausesValidation=   0   'False
      Height          =   375
      Left            =   0
      TabIndex        =   0
      TabStop         =   0   'False
      Text            =   "Void"
      Top             =   10200
      Width           =   375
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   57
      Top             =   10665
      Width           =   14520
      _ExtentX        =   25612
      _ExtentY        =   556
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   9
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   6174
            MinWidth        =   6174
            Text            =   "CompanyName"
            TextSave        =   "CompanyName"
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   2646
            MinWidth        =   2646
            Text            =   "Fin-Year"
            TextSave        =   "Fin-Year"
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   3087
            MinWidth        =   3087
            Text            =   "UserName"
            TextSave        =   "UserName"
         EndProperty
         BeginProperty Panel4 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Text            =   "UserRole"
            TextSave        =   "UserRole"
         EndProperty
         BeginProperty Panel5 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   2381
            MinWidth        =   2381
            Text            =   "CurrentDate"
            TextSave        =   "CurrentDate"
         EndProperty
         BeginProperty Panel6 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   2381
            MinWidth        =   2381
            Text            =   "SystemDate"
            TextSave        =   "SystemDate"
         EndProperty
         BeginProperty Panel7 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   5
            Object.Width           =   1764
            MinWidth        =   1764
            Text            =   "SystemTime"
            TextSave        =   "20:18"
         EndProperty
         BeginProperty Panel8 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   1
            Enabled         =   0   'False
            Object.Width           =   1764
            MinWidth        =   1764
            Text            =   "CapsLock"
            TextSave        =   "CAPS"
         EndProperty
         BeginProperty Panel9 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   2
            Object.Width           =   1764
            MinWidth        =   1764
            Text            =   "NumLock"
            TextSave        =   "NUM"
         EndProperty
      EndProperty
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
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Collection Report"
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
Dim mFormUIdCode As Long, mFormOpgUIdFileName As String, mFormOpgAcsPermFileName As String
Dim mOpgCode As Long, mEttCode As Long, mQryEttCode As Long, mQrySrvCode As Long, mQrySgpCode As Long, mQryVtmCode As Long, mOpgOldOpgCode As Long
Dim mRemoteAccess As Boolean, mEntryAccessed As Boolean, mLastRowAccessed As Long, mEntrySaved As Boolean, mEntryAborted As Boolean
Dim dbAcDatabase As New ADODB.Connection, dbBdkDatabase As New ADODB.Connection, dbGrpDatabase As New ADODB.Connection, dbComDatabase As New ADODB.Connection
Dim datRecset As New ADODB.Recordset
Dim mOpgCode_old As Long, mEttCode_old As Long, mOpgDate_old As Date, mOpgTime_old As Date, mOpgVtmCode_old As Long, mOpgVchNo_old As Long, mEttName_old As String, mEttRegNo_old As Long, mEttEtgCode_old As Long, mEttAhCode_old As Long, mEttAgeChanged As Boolean, mEttAraCode_old As Long, mOpgCDctCode_old As Long, mOpgRByCode_old As Long, mOpgRToCode_old As Long
Dim mOpgSrvCode_old As Long
Dim clsJRN As clsJournal, clsAH As clsAccountHead, clsETT As clsBdkMasterEntry, clsETG As clsBdkMasterEntry, clsARA As clsComMastEntry, clsSTN As clsComMastEntry, clsVTM As clsComMastEntry, clsSRV As clsBdkMasterEntry     ''' clsOPG As clsHmsSnglTranEntry, , clsHOPT As clsHmsOpdOptionsEntry
Dim mActiveControl As Object, clsListStru As clsSelectQueryStructure
Dim fcmbAhName As clsComFlexSearch, fcmbAraName As clsComFlexSearch, fcmbStnName As clsComFlexSearch, fcmbVtmName As clsComFlexSearch
Dim fcmbOldOpgByOpgNo As clsBdkFlexSearch, fcmbOldOpgByEttRegNo As clsBdkFlexSearch, fcmbOldOpgByEttName As clsBdkFlexSearch, fcmbEttName As clsBdkFlexSearch, fcmbEttRegNo As clsBdkFlexSearch, fcmbEtgName As clsBdkFlexSearch, fcmbCDctName As clsBdkFlexSearch, fcmbRByName As clsBdkFlexSearch, fcmbFDigName As clsBdkFlexSearch, fcmbSrvName As clsBdkFlexSearch, fcmbSgpName As clsBdkFlexSearch
Dim frmTrn As Form

Private Type SmryPara
mIndex() As Variant
mFromDate() As Variant
mToDate() As Variant
mEttRegNo() As Variant
mEttCode() As Variant
mSrvCode() As Variant
mSgpCode() As Variant
mVtmCode() As Variant
mExpanded() As Variant
mDetailed() As Variant
mMonthwise() As Variant
mDatewise() As Variant
mEttNameWise() As Variant
mEttRegNoWise() As Variant
mServWise() As Variant
mServGrpWise() As Variant
mServGrpNServWise() As Variant
mVTypeWise() As Variant
mRowIndex() As Variant

End Type

Dim SmryParaLayer As SmryPara

Private Sub ClearSmryParaLayer()

With SmryParaLayer
.mIndex = Array()
.mFromDate = Array()
.mToDate = Array()
.mEttRegNo = Array()
.mEttCode = Array()
.mSrvCode = Array()
.mSgpCode = Array()
.mVtmCode = Array()
.mExpanded = Array()
.mDetailed = Array()
.mMonthwise = Array()
.mDatewise = Array()
.mEttNameWise = Array()
.mEttRegNoWise = Array()
.mServWise = Array()
.mServGrpWise = Array()
.mServGrpNServWise = Array()
.mVTypeWise = Array()
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
    ReDim Preserve .mEttRegNo(mIndex)
    ReDim Preserve .mEttCode(mIndex)
    ReDim Preserve .mSrvCode(mIndex)
    ReDim Preserve .mSgpCode(mIndex)
    ReDim Preserve .mVtmCode(mIndex)
    ReDim Preserve .mExpanded(mIndex)
    ReDim Preserve .mDetailed(mIndex)
    ReDim Preserve .mMonthwise(mIndex)
    ReDim Preserve .mDatewise(mIndex)
    ReDim Preserve .mEttNameWise(mIndex)
    ReDim Preserve .mEttRegNoWise(mIndex)
    ReDim Preserve .mServWise(mIndex)
    ReDim Preserve .mServGrpWise(mIndex)
    ReDim Preserve .mServGrpNServWise(mIndex)
    ReDim Preserve .mVTypeWise(mIndex)
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
ReDim Preserve .mEttRegNo(mIndex)
ReDim Preserve .mEttCode(mIndex)
ReDim Preserve .mSrvCode(mIndex)
ReDim Preserve .mSgpCode(mIndex)
ReDim Preserve .mVtmCode(mIndex)
ReDim Preserve .mExpanded(mIndex)
ReDim Preserve .mDetailed(mIndex)
ReDim Preserve .mMonthwise(mIndex)
ReDim Preserve .mDatewise(mIndex)
ReDim Preserve .mEttNameWise(mIndex)
ReDim Preserve .mEttRegNoWise(mIndex)
ReDim Preserve .mServWise(mIndex)
ReDim Preserve .mServGrpWise(mIndex)
ReDim Preserve .mServGrpNServWise(mIndex)
ReDim Preserve .mVTypeWise(mIndex)
ReDim Preserve .mRowIndex(mIndex)
' -----------------------
.mIndex(mIndex) = mIndex
.mFromDate(mIndex) = Ctod(dtpFromDate.Text)
.mToDate(mIndex) = Ctod(dtpToDate.Text)
    fcmbEttRegNo.BoundText = CStr(mQryEttCode)
    fcmbEttName.BoundText = CStr(mQryEttCode)
    fcmbSrvName.BoundText = CStr(mQrySrvCode)
    fcmbSgpName.BoundText = CStr(mQrySgpCode)
    fcmbVtmName.BoundText = CStr(mQryVtmCode)
.mEttRegNo(mIndex) = Val(fcmbEttRegNo.Text)
.mEttCode(mIndex) = Val(fcmbEttName.BoundText)
.mSrvCode(mIndex) = Val(fcmbSrvName.BoundText)
.mSgpCode(mIndex) = Val(fcmbSgpName.BoundText)
.mVtmCode(mIndex) = Val(fcmbVtmName.BoundText)
.mExpanded(mIndex) = optExpanded.Value
.mDetailed(mIndex) = optDetailed.Value
.mMonthwise(mIndex) = optMonthwise.Value
.mDatewise(mIndex) = optDatewise.Value
.mEttNameWise(mIndex) = optEntityNamewise.Value
.mEttRegNoWise(mIndex) = optEntityRegNoWise.Value
.mServWise(mIndex) = optServiceWise.Value
.mServGrpWise(mIndex) = optServGrpWise.Value
.mServGrpNServWise(mIndex) = optServGrpNServWise.Value
.mVTypeWise(mIndex) = optVTypewise.Value
.mRowIndex(mIndex) = -1

End With

End Sub

Private Sub RestoreDefaultSmryPara()

dtpFromDate.Text = Dtoc(DefaultEntryDate)
dtpToDate.Text = Dtoc(DefaultEntryDate)
mQryEttCode = 0
mQrySrvCode = 0
mQrySgpCode = 0
mQryVtmCode = 0
mskQryEttRegNo.Text = "": fcmbEttRegNo.BoundText = ""
txtQryEttName.Text = "": fcmbEttName.BoundText = ""
txtQrySrvName.Text = "": fcmbSrvName.BoundText = ""
txtQrySgpName.Text = "": fcmbSgpName.BoundText = ""
txtQryVtmName.Text = "": fcmbVtmName.BoundText = ""
optExpanded.Value = False
optDetailed.Value = True
optMonthwise.Value = False
optDatewise.Value = False
optEntityNamewise.Value = False
optEntityRegNoWise.Value = False
optServiceWise.Value = False
optServGrpWise.Value = False
optServGrpNServWise.Value = False
optVTypewise.Value = False
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
    mQrySrvCode = .mSrvCode(mIndex)
    mQrySgpCode = .mSgpCode(mIndex)
    mQryVtmCode = .mVtmCode(mIndex)
    fcmbEttRegNo.BoundText = CStr(mQryEttCode): mskQryEttRegNo.Text = fcmbEttRegNo.Text
    fcmbEttName.BoundText = CStr(mQryEttCode): txtQryEttName.Text = fcmbEttName.Text
    fcmbSrvName.BoundText = CStr(mQrySrvCode): txtQrySrvName.Text = fcmbSrvName.Text
    fcmbSgpName.BoundText = CStr(mQrySgpCode): txtQrySgpName.Text = fcmbSgpName.Text
    fcmbVtmName.BoundText = CStr(mQryVtmCode): txtQryVtmName.Text = fcmbVtmName.Text
optExpanded.Value = .mExpanded(mIndex)
optDetailed.Value = .mDetailed(mIndex)
optMonthwise.Value = .mMonthwise(mIndex)
optDatewise.Value = .mDatewise(mIndex)
optEntityNamewise.Value = .mEttNameWise(mIndex)
optEntityRegNoWise.Value = .mEttRegNoWise(mIndex)
optServiceWise.Value = .mServWise(mIndex)
optServGrpWise.Value = .mServGrpWise(mIndex)
optServGrpNServWise.Value = .mServGrpNServWise(mIndex)
optVTypewise.Value = .mVTypeWise(mIndex)
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
'Public Property Get EttName() As String
'EttName = txtEttName.Text
'End Property

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

'Private Sub chkFByIndoor_Click()
'Dim mNewValue As Integer
'
'mNewValue = chkFByIndoor.Value
'If mNewValue = 0 Or mNewValue = 1 Then
'    chkFByIndrReg.Value = mNewValue
'    chkFByIndrRcpt.Value = mNewValue
'    chkFByIndrPymt.Value = mNewValue
'    chkFByIndrRefd.Value = mNewValue
'    chkFByIndrBlPymt.Value = mNewValue
'    chkFByIndrBlRefd.Value = mNewValue
'    chkFByIndrRgPymt.Value = mNewValue
'    chkFByIndrRgRefd.Value = mNewValue
'End If
'
'If mNewValue = 0 Then
'    chkFByIndoor.Caption = "Indoor Collection (None)"
'ElseIf mNewValue = 1 Then
'    chkFByIndoor.Caption = "Indoor Collection (All)"
'ElseIf mNewValue = 2 Then
'    chkFByIndoor.Caption = "Indoor Collection (Partial)"
'End If
'Call ChkIndrSeleCriteria
'
'End Sub

'Private Sub chkFByIndoor_GotFocus()
'FlashActiveControl chkFByIndoor, True
'End Sub
'
'Private Sub chkFByIndoor_LostFocus()
'FlashActiveControl chkFByIndoor, False
'End Sub
'
'Private Sub chkFByIndrBlPymt_Click()
'Call ChkIndrItemCheck
'Call ChkIndrSeleCriteria
'End Sub
'
'Private Sub chkFByIndrBlRefd_Click()
'Call ChkIndrItemCheck
'Call ChkIndrSeleCriteria
'End Sub
'
'Private Sub chkFByIndrBlRefd_GotFocus()
'FlashActiveControl chkFByIndrBlRefd, True
'End Sub
'
'Private Sub chkFByIndrBlRefd_LostFocus()
'FlashActiveControl chkFByIndrBlRefd, False
'End Sub
'
'Private Sub chkFByIndrPymt_Click()
'Call ChkIndrItemCheck
'Call ChkIndrSeleCriteria
'End Sub
'
'Private Sub chkFByIndrPymt_GotFocus()
'FlashActiveControl chkFByIndrPymt, True
'End Sub
'
'Private Sub chkFByIndrPymt_LostFocus()
'FlashActiveControl chkFByIndrPymt, False
'End Sub
'
'Private Sub chkFByIndrRcpt_Click()
'Call ChkIndrItemCheck
'Call ChkIndrSeleCriteria
'End Sub
'
'Private Sub chkFByIndrRcpt_GotFocus()
'FlashActiveControl chkFByIndrRcpt, True
'End Sub
'
'Private Sub chkFByIndrRcpt_LostFocus()
'FlashActiveControl chkFByIndrRcpt, False
'End Sub
'
'Private Sub chkFByIndrRefd_Click()
'Call ChkIndrItemCheck
'Call ChkIndrSeleCriteria
'End Sub
'
'Private Sub chkFByIndrRefd_GotFocus()
'FlashActiveControl chkFByIndrRefd, True
'End Sub
'
'Private Sub chkFByIndrRefd_LostFocus()
'FlashActiveControl chkFByIndrRefd, False
'End Sub
'
'Private Sub chkFByIndrReg_Click()
'Call ChkIndrItemCheck
'Call ChkIndrSeleCriteria
'End Sub
'
'Private Sub chkFByIndrReg_GotFocus()
'FlashActiveControl chkFByIndrReg, True
'End Sub
'
'Private Sub chkFByIndrReg_LostFocus()
'FlashActiveControl chkFByIndrReg, False
'End Sub
'
'Private Sub chkFByIndrRgPymt_Click()
'Call ChkIndrItemCheck
'Call ChkIndrSeleCriteria
'End Sub
'
'Private Sub chkFByIndrRgRefd_Click()
'Call ChkIndrItemCheck
'Call ChkIndrSeleCriteria
'End Sub
'
'Private Sub chkFByIndrRgRefd_GotFocus()
'FlashActiveControl chkFByIndrRgRefd, True
'End Sub
'
'Private Sub chkFByIndrRgRefd_LostFocus()
'FlashActiveControl chkFByIndrRgRefd, False
'End Sub

'Private Sub chkFByOutdBlPymt_Click()
'Call ChkOutdItemCheck
'Call ChkOutdSeleCriteria
'End Sub
'
'Private Sub chkFByOutdBlPymt_GotFocus()
'FlashActiveControl chkFByOutdBlPymt, True
'End Sub
'
'Private Sub chkFByOutdBlPymt_LostFocus()
'FlashActiveControl chkFByOutdBlPymt, False
'End Sub
'
'Private Sub chkFByOutdBlRefd_Click()
'Call ChkOutdItemCheck
'Call ChkOutdSeleCriteria
'End Sub
'
'Private Sub chkFByOutdBlRefd_GotFocus()
'FlashActiveControl chkFByOutdBlRefd, True
'End Sub
'
'Private Sub chkFByOutdBlRefd_LostFocus()
'FlashActiveControl chkFByOutdBlRefd, False
'End Sub

Private Sub chkFByOutdoor_Click()
Dim mNewValue As Integer

mNewValue = chkFByOutdoor.Value
If mNewValue = 0 Or mNewValue = 1 Then
'    chkFByOutdReg.Value = mNewValue
    chkFByOutdRcpt.Value = mNewValue
    chkFByOutdPymt.Value = mNewValue
    chkFByOutdRefd.Value = mNewValue
'    chkFByOutdBlPymt.Value = mNewValue
'    chkFByOutdBlRefd.Value = mNewValue
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

'Private Sub chkFByOutdReg_Click()
'Call ChkOutdItemCheck
'Call ChkOutdSeleCriteria
'End Sub
'
'Private Sub chkFByOutdReg_GotFocus()
'FlashActiveControl chkFByOutdReg, True
'End Sub
'
'Private Sub chkFByOutdReg_LostFocus()
'FlashActiveControl chkFByOutdReg, False
'End Sub

'Private Sub chkFByIndrBlPymt_GotFocus()
'FlashActiveControl chkFByIndrBlPymt, True
'End Sub
'
'Private Sub chkFByIndrBlPymt_LostFocus()
'FlashActiveControl chkFByIndrBlPymt, False
'End Sub
'
'Private Sub chkFByIndrRgPymt_GotFocus()
'FlashActiveControl chkFByIndrRgPymt, True
'End Sub
'
'Private Sub chkFByIndrRgPymt_LostFocus()
'FlashActiveControl chkFByIndrRgPymt, False
'End Sub

Private Sub ChkOutdItemCheck()

Rem If chkFByOutdReg.Value = 1 And chkFByOutdRcpt.Value = 1 And chkFByOutdPymt.Value = 1 And chkFByOutdRefd.Value = 1 And chkFByOutdBlPymt.Value = 1 And chkFByOutdBlRefd.Value = 1 Then
If chkFByOutdRcpt.Value = 1 And chkFByOutdPymt.Value = 1 And chkFByOutdRefd.Value = 1 Then
    chkFByOutdoor.Value = 1
Rem ElseIf chkFByOutdReg.Value = 1 Or chkFByOutdRcpt.Value = 1 Or chkFByOutdPymt.Value = 1 Or chkFByOutdRefd.Value = 1 Or chkFByOutdBlPymt.Value = 1 Or chkFByOutdBlRefd.Value = 1 Then
ElseIf chkFByOutdRcpt.Value = 1 Or chkFByOutdPymt.Value = 1 Or chkFByOutdRefd.Value = 1 Then
    chkFByOutdoor.Value = 2
Else
    chkFByOutdoor.Value = 0
End If

End Sub

'Private Sub ChkIndrItemCheck()
'
'If chkFByIndrReg.Value = 1 And chkFByIndrRcpt.Value = 1 And chkFByIndrPymt.Value = 1 And chkFByIndrRefd.Value = 1 And chkFByIndrBlPymt.Value = 1 And chkFByIndrBlRefd.Value = 1 And chkFByIndrRgPymt.Value = 1 And chkFByIndrRgRefd.Value = 1 Then
'    chkFByIndoor.Value = 1
'ElseIf chkFByIndrReg.Value = 1 Or chkFByIndrRcpt.Value = 1 Or chkFByIndrPymt.Value = 1 Or chkFByIndrRefd.Value = 1 Or chkFByIndrBlPymt.Value = 1 Or chkFByIndrBlRefd.Value = 1 Or chkFByIndrRgPymt.Value = 1 Or chkFByIndrRgRefd.Value = 1 Then
'    chkFByIndoor.Value = 2
'Else
'    chkFByIndoor.Value = 0
'End If
'
'End Sub

Private Sub ChkOutdSeleCriteria()

Rem If chkFByOutdReg.Value = 1 And chkFByOutdRcpt.Value = 1 And chkFByOutdPymt.Value = 1 And chkFByOutdRefd.Value = 1 And chkFByOutdBlPymt.Value = 1 And chkFByOutdBlRefd.Value = 1 Then
If chkFByOutdRcpt.Value = 1 And chkFByOutdPymt.Value = 1 And chkFByOutdRefd.Value = 1 Then
    lblOutdSeleCriteria.Caption = chkFByOutdoor.Caption
Rem ElseIf chkFByOutdReg.Value = 1 Or chkFByOutdRcpt.Value = 1 Or chkFByOutdPymt.Value = 1 Or chkFByOutdRefd.Value = 1 Or chkFByOutdBlPymt.Value = 1 Or chkFByOutdBlRefd.Value = 1 Then
ElseIf chkFByOutdRcpt.Value = 1 Or chkFByOutdPymt.Value = 1 Or chkFByOutdRefd.Value = 1 Then
    With lblOutdSeleCriteria
    .Caption = ""
'    If chkFByOutdReg.Value = 1 Then
'        .Caption = .Caption & chkFByOutdReg.Caption & ", "
'    End If
    If chkFByOutdRcpt.Value = 1 Then
        .Caption = .Caption & chkFByOutdRcpt.Caption & ", "
    End If
    If chkFByOutdPymt.Value = 1 Then
        .Caption = .Caption & chkFByOutdPymt.Caption & ", "
    End If
    If chkFByOutdRefd.Value = 1 Then
        .Caption = .Caption & chkFByOutdRefd.Caption & ", "
    End If
'    If chkFByOutdBlPymt.Value = 1 Then
'        .Caption = .Caption & chkFByOutdBlPymt.Caption & ", "
'    End If
'    If chkFByOutdBlRefd.Value = 1 Then
'        .Caption = .Caption & chkFByOutdBlRefd.Caption & ", "
'    End If
    If Right(.Caption, 2) = ", " Then
        .Caption = Left(.Caption, Len(.Caption) - 2)
    End If
    End With
    
Else
    lblOutdSeleCriteria.Caption = chkFByOutdoor.Caption
End If

End Sub

'Private Sub ChkIndrSeleCriteria()
'
'If chkFByIndrReg.Value = 1 And chkFByIndrRcpt.Value = 1 And chkFByIndrPymt.Value = 1 And chkFByIndrRefd.Value = 1 And chkFByIndrBlPymt.Value = 1 And chkFByIndrBlRefd.Value = 1 And chkFByIndrRgPymt.Value = 1 And chkFByIndrRgRefd.Value = 1 Then
'    lblIndrSeleCriteria.Caption = chkFByIndoor.Caption
'ElseIf chkFByIndrReg.Value = 1 Or chkFByIndrRcpt.Value = 1 Or chkFByIndrPymt.Value = 1 Or chkFByIndrRefd.Value = 1 Or chkFByIndrBlPymt.Value = 1 Or chkFByIndrBlRefd.Value = 1 Or chkFByIndrRgPymt.Value = 1 Or chkFByIndrRgRefd.Value = 1 Then
'    With lblIndrSeleCriteria
'    .Caption = ""
'    If chkFByIndrReg.Value = 1 Then
'        .Caption = .Caption & chkFByIndrReg.Caption & ", "
'    End If
'    If chkFByIndrRcpt.Value = 1 Then
'        .Caption = .Caption & chkFByIndrRcpt.Caption & ", "
'    End If
'    If chkFByIndrPymt.Value = 1 Then
'        .Caption = .Caption & chkFByIndrPymt.Caption & ", "
'    End If
'    If chkFByIndrRefd.Value = 1 Then
'        .Caption = .Caption & chkFByIndrRefd.Caption & ", "
'    End If
'    If chkFByIndrBlPymt.Value = 1 Then
'        .Caption = .Caption & chkFByIndrBlPymt.Caption & ", "
'    End If
'    If chkFByIndrBlRefd.Value = 1 Then
'        .Caption = .Caption & chkFByIndrBlRefd.Caption & ", "
'    End If
'    If chkFByIndrRgPymt.Value = 1 Then
'        .Caption = .Caption & chkFByIndrRgPymt.Caption & ", "
'    End If
'    If chkFByIndrRgRefd.Value = 1 Then
'        .Caption = .Caption & chkFByIndrRgRefd.Caption & ", "
'    End If
'    If Right(.Caption, 2) = ", " Then
'        .Caption = Left(.Caption, Len(.Caption) - 2)
'    End If
'    End With
'Else
'    lblIndrSeleCriteria.Caption = chkFByIndoor.Caption
'End If
'
'End Sub

'Public Property Get PatAddEditMode() As Integer
'PatAddEditMode = cmbPatEntryMode.ListIndex
'End Property
'
'Public Property Let PatAddEditMode(ByVal New_PatEntryMode As Integer)
'cmbPatEntryMode.ListIndex = New_PatEntryMode
'End Property
'
'Private Sub chkEttDefAllowed_GotFocus()
'FlashActiveControl chkEttDefAllowed, True
'End Sub
'
'Private Sub chkEttDefAllowed_LostFocus()
'FlashActiveControl chkEttDefAllowed, False
'End Sub
'
'Private Sub chkEttDiscAllowed_GotFocus()
'FlashActiveControl chkEttDiscAllowed, True
'End Sub
'
'Private Sub chkEttDiscAllowed_LostFocus()
'FlashActiveControl chkEttDiscAllowed, False
'End Sub
'
'Private Sub chkEttInfAllowed_GotFocus()
'FlashActiveControl chkEttInfAllowed, True
'End Sub
'
'Private Sub chkEttInfAllowed_LostFocus()
'FlashActiveControl chkEttInfAllowed, False
'End Sub
'
'Private Sub chkEttShowInList_GotFocus()
'FlashActiveControl chkEttShowInList, True
'End Sub
'
'Private Sub chkEttShowInList_LostFocus()
'FlashActiveControl chkEttShowInList, False
'End Sub
'
'Private Sub cmbEttRefRela_GotFocus()
'FlashActiveControl cmbEttRefRela, True
'End Sub
'
'Private Sub cmbEttRefRela_LostFocus()
'FlashActiveControl cmbEttRefRela, False
'End Sub
'
'Private Sub cmbEttRefRela_Validate(Cancel As Boolean)
'If cmbEttRefRela.ListIndex = -1 Then
'    ErrorBox "Invalid Selection !!!"
'    cmbEttRefRela.SetFocus
'    Cancel = True
'End If
'
'End Sub
'
'Private Sub cmbEttSex_GotFocus()
'FlashActiveControl cmbEttSex, True
'End Sub
'
'Private Sub cmbEttSex_LostFocus()
'FlashActiveControl cmbEttSex, False
'End Sub
'
'Private Sub cmbEttSex_Validate(Cancel As Boolean)
'If cmbEttSex.ListIndex = -1 Then
'    ErrorBox "Invalid Selection !!!"
'    cmbEttSex.SetFocus
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

Private Sub cmdConfigure_GotFocus()
FlashActiveControl cmdConfigure, True
End Sub

Private Sub cmdConfigure_LostFocus()
FlashActiveControl cmdConfigure, False
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
                fcmbEttRegNo.BoundText = CStr(mQryEttCode)
                fcmbEttName.BoundText = CStr(mQryEttCode)
                fcmbSrvName.BoundText = CStr(mQrySrvCode)
                fcmbSgpName.BoundText = CStr(mQrySgpCode)
                fcmbVtmName.BoundText = CStr(mQryVtmCode)
                
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
                    
                ElseIf optEntityNamewise.Value = True Then
                    mQryEttCode = .fields("TrnEttCode")
                    fcmbEttRegNo.BoundText = CStr(mQryEttCode)
                    fcmbEttName.BoundText = CStr(mQryEttCode)
                    mskQryEttRegNo.Text = fcmbEttRegNo.Text
                    txtQryEttName.Text = fcmbEttName.Text
                    optEntityNamewise.Value = False
                    optDatewise.Value = True
                    
                ElseIf optEntityRegNoWise.Value = True Then
                    mQryEttCode = .fields("TrnEttCode")
                    fcmbEttRegNo.BoundText = CStr(mQryEttCode)
                    fcmbEttName.BoundText = CStr(mQryEttCode)
                    mskQryEttRegNo.Text = fcmbEttRegNo.Text
                    txtQryEttName.Text = fcmbEttName.Text
                    optEntityRegNoWise.Value = False
                    optDatewise.Value = True
                    
                ElseIf optServiceWise.Value = True Then
                    mQrySrvCode = .fields("TrnSrvCode")
                    fcmbSrvName.BoundText = CStr(mQrySrvCode)
                    txtQrySrvName.Text = fcmbSrvName.Text
                    optServiceWise.Value = False
                    optDatewise.Value = True
                    
                ElseIf optServGrpWise.Value = True Then
                    mQrySgpCode = .fields("TrnSgpCode")
                    fcmbSgpName.BoundText = CStr(mQrySgpCode)
                    txtQrySgpName.Text = fcmbSgpName.Text
                    optServGrpWise.Value = False
                    optDatewise.Value = True
                    
                ElseIf optServGrpNServWise.Value = True Then
                    mQrySgpCode = .fields("TrnSgpCode"): mQrySrvCode = .fields("TrnSrvCode")
                    fcmbSgpName.BoundText = CStr(mQrySgpCode): fcmbSrvName.BoundText = CStr(mQrySrvCode)
                    txtQrySgpName.Text = fcmbSgpName.Text: txtQrySrvName.Text = fcmbSrvName.Text
                    optServGrpNServWise.Value = False
                    optDatewise.Value = True
                    
                ElseIf optVTypewise.Value = True Then
                    mQryVtmCode = .fields("TrnVtmCode")
                    fcmbVtmName.BoundText = CStr(mQryVtmCode)
                    txtQryVtmName.Text = fcmbVtmName.Text
                    optVTypewise.Value = False
                    optDatewise.Value = True
                    
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
            ''' Call Data_AddEvent
        End If
        End With
    End If
ElseIf FormAddEditMode = cFORM_SMRYMODE And frConfigure.Visible = False And frPrintCRList.Visible = False Then

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
    
ElseIf frPrintCRList.Visible = True Then
    txtVoid.SetFocus
    Mfgrd1.Enabled = True
    frPrintCRList.Visible = False
    Mfgrd1.SetFocus
    
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
            If Mfgrd1.Rows - 1 > srow And srow > 0 Then
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

Private Sub cmdPrintRep_Click()
Call Data_PrintDialog
End Sub

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

Private Sub dtpFromDate1_GotFocus()
FlashActiveControl dtpFromDate1, True
End Sub

Private Sub dtpFromDate1_LostFocus()
FlashActiveControl dtpFromDate1, False
End Sub

Private Sub dtpFromDate1_Validate(Cancel As Boolean)
dtpFromDate1.Text = ToMyDate(dtpFromDate1.Text)
If IsFinYrDate(Ctod(dtpFromDate1.Text)) = False Then
    ErrorBox "Invalid Date Range !!!"
    dtpFromDate1.SetFocus
    Cancel = True
End If

End Sub

Private Sub dtpToDate1_GotFocus()
FlashActiveControl dtpToDate1, True
End Sub

Private Sub dtpToDate1_LostFocus()
FlashActiveControl dtpToDate1, False
End Sub

Private Sub dtpToDate1_Validate(Cancel As Boolean)
dtpToDate1.Text = ToMyDate(dtpToDate1.Text)
If IsFinYrDate(Ctod(dtpToDate1.Text)) = False Then
    ErrorBox "Invalid Date Range !!!"
    dtpToDate1.SetFocus
    Cancel = True
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

mFormOpgUIdFileName = "CollRep.Uid"
mFormOpgAcsPermFileName = "CollRep.Acp"
mFormUIdCode = GetUIdCode(mProcess:=Me.Name, mUIdFileName:=mFormOpgUIdFileName, mAcsPermFileName:=mFormOpgAcsPermFileName)

mFormLoaded = False
mEntrySaved = False: mEntryAborted = False
SetFormSize Me, frmMain
Call Form_Resize
chkFByOutdoor.Value = 1
'chkFByIndoor.Value = 1
Call chkFByOutdoor_Click
'Call chkFByIndoor_Click

Call SetVoidControl(txtVoid)
txtSearch1Text.Enabled = False
frConfigure.Visible = False
frPrintCRList.Visible = False

OpenAcDataSource dbAcDatabase
OpenBdkDataSource dbBdkDatabase
OpenGrpDataSource dbGrpDatabase
OpenComDataSource dbComDatabase

Set clsListStru = New clsSelectQueryStructure

'Set clsHOPT = New clsHmsOpdOptionsEntry
'clsHOPT.blnOutdRegOptMast = True
'clsHOPT.Init
'clsHOPT.GetOutdRegOptData

Set clsAH = New clsAccountHead
Set clsAH.dbAcDatabase = dbAcDatabase
Set clsAH.dbGrpDatabase = dbGrpDatabase

'Set clsOPG = New clsHmsSnglTranEntry
'Set clsOPG.dbAcDatabase = dbAcDatabase
'Set clsOPG.dbBdkDatabase = dbBdkDatabase
'clsOPG.blnOutdRegTran = True
'clsOPG.Init

Set clsETT = New clsBdkMasterEntry
Set clsETT.dbAcDatabase = dbAcDatabase
Set clsETT.dbBdkDatabase = dbBdkDatabase
clsETT.blnEntityMast = True
clsETT.Init

Set clsETG = New clsBdkMasterEntry
Set clsETG.dbBdkDatabase = dbBdkDatabase
clsETG.blnEntityCatgMast = True
clsETG.Init

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

Set clsSRV = New clsBdkMasterEntry
Set clsSRV.dbBdkDatabase = dbBdkDatabase
clsSRV.blnServMast = True
clsSRV.Init

Set fcmbVtmName = New clsComFlexSearch
Set fcmbVtmName.dbAcDatabase = dbAcDatabase
fcmbVtmName.blnVTypeMastList = True
fcmbVtmName.Init

'''Set fcmbAhName = New clsComFlexSearch
'''Set fcmbAhName.dbAcDatabase = dbAcDatabase
'''fcmbAhName.blnAchdMastList = True
'''fcmbAhName.Init

'''Set fcmbEtgName = New clsBdkFlexSearch
'''Set fcmbEtgName.dbBdkDatabase = dbBdkDatabase
'''fcmbEtgName.blnPatCatgMstList = True
'''fcmbEtgName.Init

'''Set fcmbAraName = New clsComFlexSearch
'''Set fcmbAraName.dbAcDatabase = dbAcDatabase
'''fcmbAraName.blnAreaMastList = True
'''fcmbAraName.Init

'''Set fcmbStnName = New clsComFlexSearch
'''Set fcmbStnName.dbAcDatabase = dbAcDatabase
'''fcmbStnName.blnStationMastList = True
'''fcmbStnName.Init

'''Set fcmbCDctName = New clsBdkFlexSearch
'''Set fcmbCDctName.dbBdkDatabase = dbBdkDatabase
'''fcmbCDctName.blnDoctMastList = True
'''fcmbCDctName.Init

'''Set fcmbRByName = New clsBdkFlexSearch
'''Set fcmbRByName.dbBdkDatabase = dbBdkDatabase
'''fcmbRByName.blnRefByMastList = True
'''fcmbRByName.Init

'''Set fcmbFDigName = New clsBdkFlexSearch
'''Set fcmbFDigName.dbBdkDatabase = dbBdkDatabase
'''fcmbFDigName.blnDiagMastList = True
'''fcmbFDigName.Init

Set fcmbSrvName = New clsBdkFlexSearch
Set fcmbSrvName.dbBdkDatabase = dbBdkDatabase
fcmbSrvName.blnServMastList = True
fcmbSrvName.Init

Set fcmbSgpName = New clsBdkFlexSearch
Set fcmbSgpName.dbBdkDatabase = dbBdkDatabase
fcmbSgpName.blnServGrpMstList = True
fcmbSgpName.Init

Set fcmbEttRegNo = New clsBdkFlexSearch
Set fcmbEttRegNo.dbBdkDatabase = dbBdkDatabase
Set fcmbEttRegNo.dbComDatabase = dbComDatabase
fcmbEttRegNo.blnEntityMastListByRegNo = True
fcmbEttRegNo.Init

Set fcmbEttName = New clsBdkFlexSearch
Set fcmbEttName.dbBdkDatabase = dbBdkDatabase
Set fcmbEttName.dbComDatabase = dbComDatabase
fcmbEttName.blnEntityMastListByName = True
fcmbEttName.Init

'''Set fcmbOldOpgByOpgNo = New clsBdkFlexSearch
'''Set fcmbOldOpgByOpgNo.dbBdkDatabase = dbBdkDatabase
'''Set fcmbOldOpgByOpgNo.dbComDatabase = dbComDatabase
'''fcmbOldOpgByOpgNo.blnOldOpgListByOpgNo = True
'''fcmbOldOpgByOpgNo.Init

'''Set fcmbOldOpgByEttRegNo = New clsBdkFlexSearch
'''Set fcmbOldOpgByEttRegNo.dbBdkDatabase = dbBdkDatabase
'''Set fcmbOldOpgByEttRegNo.dbComDatabase = dbComDatabase
'''fcmbOldOpgByEttRegNo.blnOldOpgListByEttRegNo = True
'''fcmbOldOpgByEttRegNo.Init

'''Set fcmbOldOpgByEttName = New clsBdkFlexSearch
'''Set fcmbOldOpgByEttName.dbBdkDatabase = dbBdkDatabase
'''Set fcmbOldOpgByEttName.dbComDatabase = dbComDatabase
'''fcmbOldOpgByEttName.blnOldOpgListByEttName = True
'''fcmbOldOpgByEttName.Init

Call RestoreDefaultSmryPara
If mRemoteAccess = True Then
    optDetailed.Value = True
    AddSmryParaLayer mClear:=True
End If

If mRemoteAccess = True Then
    'datRecset.Open "Select * from OutdReg left join EntityMast on OutdReg.OpgEttCode=EntityMast.EttCode where OpgCode=" & CStr(mOpgCode) & " order by OpgDate,OpgTime", dbBdkDatabase, adOpenKeyset, adLockOptimistic
Else
    'datRecset.Open "Select * from OutdReg left join EntityMast on OutdReg.OpgEttCode=EntityMast.EttCode order by OpgDate,OpgTime", dbBdkDatabase, adOpenKeyset, adLockOptimistic
End If
Mfgrd1.FixedCols = 0
Call SmryList

ShowEntryMode False
ShowStatusBarText StatusBar1

End Sub

Private Sub optServGrpNServWise_GotFocus()
FlashActiveControl optServGrpNServWise, True
End Sub

Private Sub optServGrpNServWise_LostFocus()
FlashActiveControl optServGrpNServWise, False
End Sub

Private Sub optServGrpWise_GotFocus()
FlashActiveControl optServGrpWise, True
End Sub

Private Sub optServGrpWise_LostFocus()
FlashActiveControl optServGrpWise, False
End Sub

Private Sub optVTypewise_GotFocus()
FlashActiveControl optVTypewise, True
End Sub

Private Sub optVTypewise_LostFocus()
FlashActiveControl optVTypewise, False
End Sub

Private Sub StatusBar1_PanelClick(ByVal Panel As MSComctlLib.Panel)
ShowStatusBarText StatusBar1
End Sub

Private Sub Form_Resize()
lblFormHeading.Width = Me.Width
cmdFormEscape.Left = Me.Width - (cmdFormEscape.Width * 2)
cmdFormEnter.Left = Me.Width + cmdFormEscape.Width
frFormSmry.Left = (Me.Width - frFormSmry.Width) / 2: frFormSmry.Top = cmbFormEntryMode.Top + (cmbFormEntryMode.Height * 1.25)
'frFormDtl.Left = (Me.Width - frFormDtl.Width) / 2: frFormDtl.Top = frFormSmry.Top

End Sub

Private Sub Form_Unload(Cancel As Integer)
'Set clsHOPT = Nothing
Set clsJRN = Nothing
Set clsAH = Nothing
'Set clsOPG = Nothing
Set clsETT = Nothing
Set clsETG = Nothing
Set clsARA = Nothing
Set clsSTN = Nothing
Set clsVTM = Nothing
Set clsSRV = Nothing
Set fcmbOldOpgByOpgNo = Nothing
Set fcmbOldOpgByEttRegNo = Nothing
Set fcmbOldOpgByEttName = Nothing
Set fcmbEttRegNo = Nothing
Set fcmbEttName = Nothing
Set fcmbAhName = Nothing
Set fcmbEtgName = Nothing
Set fcmbAraName = Nothing
Set fcmbStnName = Nothing
Set fcmbVtmName = Nothing
Set fcmbCDctName = Nothing
Set fcmbRByName = Nothing
Set fcmbFDigName = Nothing
Set fcmbSrvName = Nothing
Set fcmbSgpName = Nothing
Set clsListStru = Nothing

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
'frFormDtl.Visible = EntryMode: frFormDtl.Enabled = EntryMode
'cmdSaveForm.Enabled = EntryMode
If EntryMode = False Then
    FormAddEditMode = cFORM_SMRYMODE
    'PatAddEditMode = cFORM_SMRYMODE
End If

End Sub

Private Sub mskQryEttRegNo_Change()
If fcmbEttRegNo.CallFromText_Change = False Then
    fcmbEttRegNo.CallFromText_Change = True
    If InterActiveChange(mskQryEttRegNo) = True Then
        fcmbEttRegNo.UserText = Array(mskQryEttRegNo.Text, mskQryEttRegNo.SelStart)
        fcmbEttRegNo.Show
        mskQryEttRegNo.Text = fcmbEttRegNo.Text
        mQryEttCode = Val(fcmbEttRegNo.BoundText)
        fcmbEttName.BoundText = CStr(mQryEttCode)
        txtQryEttName.Text = fcmbEttName.Text
        If fcmbEttRegNo.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbEttRegNo.CallFromText_Change = False
End If

End Sub

Private Sub mskQryEttRegNo_GotFocus()
FlashActiveControl mskQryEttRegNo, True
End Sub

Private Sub mskQryEttRegNo_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call mskQryEttRegNo_Change
ElseIf MyAddNewKey(Shift, KeyCode) = True Then
    Rem not required here
End If

End Sub

Private Sub mskQryEttRegNo_LostFocus()
FlashActiveControl mskQryEttRegNo, False
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

Private Sub optExpanded_Click()
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

Private Sub Data_AddEvent()
Rem none
End Sub

Private Sub Data_EditEvent()

'If clsOPG.BeginTran(datRecset.fields("OpgCode")) = False Then
'    Exit Sub
'ElseIf clsETT.BeginMast(datRecset.fields("OpgEttCode")) = False Then
'    Exit Sub
'End If
'mEntrySaved = False: mEntryAborted = False
'FormAddEditMode = cFORM_EDITMODE
'PatAddEditMode = cFORM_EDITMODE
'
'With datRecset
'mOpgCode = .fields("OpgCode")
'mEttCode = .fields("OpgEttCode")
'clsOPG.GetData mOpgCode
'clsETT.GetData mEttCode
'End With
'
'ShowPatData mEttCode
'ShowOpgData mOpgCode
'
'Rem old values
'Call StorePatOldData
'Call StoreOpgOldData
'
'Call ShowEntryMode(True)
'txtEttName.SetFocus

End Sub

Private Sub SmryList()
Dim gcolcount As Integer, acount As Integer, mLow As Integer, mHigh As Integer, mPos As Integer, srow As Long, mColCount As Integer
Dim aAcntBal As Variant, mBal As Double, mQryStr As String
Dim mCount_Tot As Double, mAmtAftDisc_Tot As Double, mDiscAmt_Tot As Double

Me.MousePointer = vbHourglass
If datRecset.State = 1 Then
    CloseTable datRecset
End If
RefreshDatabase dbBdkDatabase
RefreshDatabase dbAcDatabase
RefreshDatabase dbGrpDatabase
RefreshDatabase dbComDatabase
clsListStru.Clear

If optMonthwise.Value = True Or optDatewise.Value = True Or optEntityNamewise.Value = True Or optEntityRegNoWise.Value = True Or optServiceWise.Value = True Or optServGrpWise.Value = True Or optServGrpNServWise.Value = True Or optVTypewise.Value = True Then
    If optMonthwise.Value = True Then
        Call CreateMonthlySrmyList
        
    ElseIf optDatewise.Value = True Then
        Call CreateDailySrmyList
        
    ElseIf optEntityNamewise.Value = True Then
        Call CreateEttNameSmryList
        
    ElseIf optEntityRegNoWise.Value = True Then
        Call CreateEttRegNoSmryList
        
    ElseIf optServiceWise.Value = True Then
        Call CreateServNameSmryList
        
    ElseIf optServGrpWise.Value = True Then
        Call CreateServGrpNameSmryList
    
    ElseIf optServGrpNServWise.Value = True Then
        Call CreateServGrpNServNameSmryList
    
    ElseIf optVTypewise.Value = True Then
        Call CreateVTypeNameSmryList
    
    End If
    
ElseIf optDetailed.Value = True Then
    Call CreateDetailedSrmyList
    
ElseIf optExpanded.Value = True Then
    Call CreateExpandedSrmyList
    
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
            
        ElseIf optEntityNamewise.Value = True Then
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttName")) = .fields("EttName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttRegNo")) = ToMyNumFmt(.fields("EttRegNo"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttRefName")) = .fields("EttRefName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCount")) = ToMyNumFmt(.fields("TrnCount"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnAmtAftDisc_sum")) = ToMyNumFmt(.fields("TrnAmtAftDisc_sum"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDiscAmt_sum")) = ToMyNumFmt(.fields("TrnDiscAmt_sum"))
            
        ElseIf optEntityRegNoWise.Value = True Then
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttRegNo")) = ToMyNumFmt(.fields("EttRegNo"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttName")) = .fields("EttName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttRefName")) = .fields("EttRefName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCount")) = ToMyNumFmt(.fields("TrnCount"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnAmtAftDisc_sum")) = ToMyNumFmt(.fields("TrnAmtAftDisc_sum"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDiscAmt_sum")) = ToMyNumFmt(.fields("TrnDiscAmt_sum"))
            
        ElseIf optServiceWise.Value = True Then
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnSrvName")) = .fields("TrnSrvName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCount")) = ToMyNumFmt(.fields("TrnCount"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnAmtAftDisc_sum")) = ToMyNumFmt(.fields("TrnAmtAftDisc_sum"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDiscAmt_sum")) = ToMyNumFmt(.fields("TrnDiscAmt_sum"))
        
        ElseIf optServGrpWise.Value = True Then
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnSgpName")) = .fields("TrnSgpName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCount")) = ToMyNumFmt(.fields("TrnCount"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnAmtAftDisc_sum")) = ToMyNumFmt(.fields("TrnAmtAftDisc_sum"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDiscAmt_sum")) = ToMyNumFmt(.fields("TrnDiscAmt_sum"))
        
        ElseIf optServGrpNServWise.Value = True Then
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnSgpName")) = .fields("TrnSgpName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnSrvName")) = .fields("TrnSrvName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCount")) = ToMyNumFmt(.fields("TrnCount"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnAmtAftDisc_sum")) = ToMyNumFmt(.fields("TrnAmtAftDisc_sum"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDiscAmt_sum")) = ToMyNumFmt(.fields("TrnDiscAmt_sum"))
        
        ElseIf optVTypewise.Value = True Then
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnVtmName")) = .fields("TrnVtmName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCount")) = ToMyNumFmt(.fields("TrnCount"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnAmtAftDisc_sum")) = ToMyNumFmt(.fields("TrnAmtAftDisc_sum"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDiscAmt_sum")) = ToMyNumFmt(.fields("TrnDiscAmt_sum"))
        
        ElseIf optDetailed.Value = True Or optExpanded.Value = True Then
            clsETG.GetData .fields("EttEtgCode")
            clsARA.GetData .fields("EttAraCode")
            clsSTN.GetData .fields("EttStnCode")
            clsVTM.GetData .fields("TrnVtmCode")
            
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("tTrnSmryId")) = .fields("tTrnSmryId")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnType")) = .fields("TrnType")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("VtmSysCode")) = .fields("VtmSysCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCode")) = .fields("TrnCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("VtmName")) = clsVTM.mName_str
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnVchNo")) = .fields("TrnVchNo")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDate")) = Dtoc(.fields("TrnDate"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnAmtAftDisc")) = ToMyNumFmt(.fields("TrnAmtAftDisc"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDiscAmt")) = ToMyNumFmt(.fields("TrnDiscAmt"))
            ' ------------------------------------
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttCode")) = .fields("EttCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttName")) = .fields("EttName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttRegNo")) = .fields("EttRegNo")
            If optExpanded.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnSrvName")) = .fields("TrnSrvName")
            End If
            ' ------------------------------------
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttRefName")) = .fields("EttRefName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttAddr")) = .fields("EttAddr")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttAraName")) = clsARA.mName_str
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttStnName")) = clsSTN.mName_str
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttEtgName")) = clsETG.mName_str
        
        End If
        If optDetailed.Value = True Or optExpanded.Value = True Then
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
    
ElseIf optEntityNamewise.Value = True Then
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttName")) = "Grand Total"
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttRegNo")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttRefName")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCount")) = ToMyNumFmt(mCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnAmtAftDisc_sum")) = ToMyNumFmt(mAmtAftDisc_Tot)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDiscAmt_sum")) = ToMyNumFmt(mDiscAmt_Tot)
    
ElseIf optEntityRegNoWise.Value = True Then
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttRegNo")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttName")) = "Grand Total"
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttRefName")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCount")) = ToMyNumFmt(mCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnAmtAftDisc_sum")) = ToMyNumFmt(mAmtAftDisc_Tot)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDiscAmt_sum")) = ToMyNumFmt(mDiscAmt_Tot)
    
ElseIf optServiceWise.Value = True Then
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnSrvName")) = "Grand Total"
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCount")) = ToMyNumFmt(mCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnAmtAftDisc_sum")) = ToMyNumFmt(mAmtAftDisc_Tot)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDiscAmt_sum")) = ToMyNumFmt(mDiscAmt_Tot)
    
ElseIf optServGrpWise.Value = True Then
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnSgpName")) = "Grand Total"
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCount")) = ToMyNumFmt(mCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnAmtAftDisc_sum")) = ToMyNumFmt(mAmtAftDisc_Tot)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDiscAmt_sum")) = ToMyNumFmt(mDiscAmt_Tot)
    
ElseIf optServGrpNServWise.Value = True Then
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnSgpName")) = "Grand Total"
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnSrvName")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCount")) = ToMyNumFmt(mCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnAmtAftDisc_sum")) = ToMyNumFmt(mAmtAftDisc_Tot)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDiscAmt_sum")) = ToMyNumFmt(mDiscAmt_Tot)
    
ElseIf optVTypewise.Value = True Then
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnVtmName")) = "Grand Total"
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCount")) = ToMyNumFmt(mCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnAmtAftDisc_sum")) = ToMyNumFmt(mAmtAftDisc_Tot)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDiscAmt_sum")) = ToMyNumFmt(mDiscAmt_Tot)
    
ElseIf optDetailed.Value = True Or optExpanded.Value = True Then
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("tTrnSmryId")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnType")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("VtmSysCode")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCode")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("VtmName")) = "Grand Total (" & CStr(mCount_Tot) & ")"
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnVchNo")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDate")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnAmtAftDisc")) = ToMyNumFmt(mAmtAftDisc_Tot)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDiscAmt")) = ToMyNumFmt(mDiscAmt_Tot)
    ' ------------------------------------
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttCode")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttName")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttRegNo")) = ""
    If optExpanded.Value = True Then
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnSrvName")) = ""
    End If
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttRefName")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttAddr")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttAraName")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttStnName")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttEtgName")) = ""

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

Private Sub CreateMonthlySrmyList()
Dim mQryStr As String

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
mQryStr = mQryStr & "Select OrcDate as TrnDate" _
 & ",OrcAmtAftDisc as TrnAmtAftDisc" _
 & ",OrcDiscAmt as TrnDiscAmt" _
 & " from (OutdRcpt" _
 & " inner join OutdHdr on OutdRcpt.OrcCode = OutdHdr.OhrCode)" _
 & " inner join ServMast on OutdRcpt.OrcSrvCode = ServMast.SrvCode" _
 & " where OrcDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
 & " and OrcCode>0 and True=False" _
 & IIf(mQryEttCode > 0, " and OrcEttCode=" & CStr(mQryEttCode), "") _
 & IIf(mQrySrvCode > 0, " and OrcSrvCode=" & CStr(mQrySrvCode), "") _
 & IIf(mQrySgpCode > 0, " and SrvSgpCode=" & CStr(mQrySgpCode), "") _
 & IIf(mQryVtmCode > 0, " and OhrVtmCode=" & CStr(mQryVtmCode), "")
Rem outdoor registration
'If chkFByOutdReg.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select OpgDate as TrnDate" _
'     & ",OpgAmtAftDisc as TrnAmtAftDisc" _
'     & ",OpgDiscAmt as TrnDiscAmt" _
'     & " from OutdReg" _
'     & " inner join ServMast on OutdReg.OpgSrvCode = ServMast.SrvCode" _
'     & " where OpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and OpgCode>0" _
'     & IIf(mQryEttCode > 0, " and OpgEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and OpgSrvCode=" & CStr(mQrySrvCode), "") _
'     & IIf(mQrySgpCode > 0, " and SrvSgpCode=" & CStr(mQrySgpCode), "") _
'     & IIf(mQryVtmCode > 0, " and OpgVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem outdoor receipt received amount
If chkFByOutdRcpt.Value = vbChecked Then
    mQryStr = mQryStr & " UNION ALL "
    mQryStr = mQryStr & " Select OrcDate as TrnDate" _
     & ",OrcRecdAmt as TrnAmtAftDisc" _
     & ",OrcDiscAmt as TrnDiscAmt" _
     & " from (OutdRcpt" _
     & " inner join OutdHdr on OutdRcpt.OrcCode = OutdHdr.OhrCode)" _
     & " inner join ServMast on OutdRcpt.OrcSrvCode = ServMast.SrvCode" _
     & " where OrcDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & " and OrcCode > 0" _
     & IIf(mQryEttCode > 0, " and OrcEttCode=" & CStr(mQryEttCode), "") _
     & IIf(mQrySrvCode > 0, " and OrcSrvCode=" & CStr(mQrySrvCode), "") _
     & IIf(mQrySgpCode > 0, " and SrvSgpCode=" & CStr(mQrySgpCode), "") _
     & IIf(mQryVtmCode > 0, " and OhrVtmCode=" & CStr(mQryVtmCode), "")
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
     & IIf(mQryEttCode > 0, " and OphEttCode=" & CStr(mQryEttCode), "") _
     & IIf(mQrySrvCode > 0, " and True=False", "") _
     & IIf(mQrySgpCode > 0, " and True=False", "") _
     & IIf(mQryVtmCode > 0, " and OphVtmCode=" & CStr(mQryVtmCode), "")
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
     & IIf(mQryEttCode > 0, " and OfhEttCode=" & CStr(mQryEttCode), "") _
     & IIf(mQrySrvCode > 0, " and True=False", "") _
     & IIf(mQrySgpCode > 0, " and True=False", "") _
     & IIf(mQryVtmCode > 0, " and OfhVtmCode=" & CStr(mQryVtmCode), "")
End If
Rem outdoor bill payment
'If chkFByOutdBlPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select ObphDate as TrnDate" _
'     & ",ObphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdBlPymtHdr" _
'     & " where ObphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and ObphCode>0" _
'     & IIf(mQryEttCode > 0, " and ObphEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and ObphVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem outdoor bill refund
'If chkFByOutdBlRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select ObfhDate as TrnDate" _
'     & ",(ObfhRefuAmt * -1) as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdBlRefdHdr" _
'     & " where ObfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and ObfhCode>0" _
'     & IIf(mQryEttCode > 0, " and ObfhEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and ObfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor advance ---------------------
'If chkFByIndrReg.Value = vbChecked = True Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IpgDate as TrnDate" _
'     & ",IpgAdvAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrReg" _
'     & " where IpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IpgCode>0" _
'     & IIf(mQryEttCode > 0, " and IpgEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IpgVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor receipt received amount
'If chkFByIndrRcpt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IrcDate as TrnDate" _
'     & ",IrcRecdAmt as TrnAmtAftDisc" _
'     & ",IrcDiscAmt as TrnDiscAmt" _
'     & " from (IndrRcpt" _
'     & " inner join IndrHdr on IndrRcpt.IrcCode = IndrHdr.IhrCode)" _
'     & " inner join ServMast on IndrRcpt.IrcSrvCode = ServMast.SrvCode" _
'     & " where IrcDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IrcCode>0" _
'     & IIf(mQryEttCode > 0, " and IrcEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and IrcSrvCode=" & CStr(mQrySrvCode), "") _
'     & IIf(mQrySgpCode > 0, " and SrvSgpCode=" & CStr(mQrySgpCode), "") _
'     & IIf(mQryVtmCode > 0, " and IhrVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor payment
'If chkFByIndrPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IphDate as TrnDate" _
'     & ",IphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrPymtHdr" _
'     & " where IphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IphCode>0" _
'     & IIf(mQryEttCode > 0, " and IphEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IphVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor refund
'If chkFByIndrRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IfhDate as TrnDate" _
'     & ",(IfhRefuAmt * -1) as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRefdHdr" _
'     & " where IfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IfhCode>0" _
'     & IIf(mQryEttCode > 0, " and IfhEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor bill payment
'If chkFByIndrBlPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IbphDate as TrnDate" _
'     & ",IbphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrBlPymtHdr" _
'     & " where IbphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IbphCode>0" _
'     & IIf(mQryEttCode > 0, " and IbphEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IbphVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor bill refund
'If chkFByIndrBlRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IbfhDate as TrnDate" _
'     & ",(IbfhRefuAmt * -1) as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrBlRefdHdr" _
'     & " where IbfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IbfhCode>0" _
'     & IIf(mQryEttCode > 0, " and IbfhEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IbfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor on a/c payment
'If chkFByIndrRgPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IgtDate as TrnDate" _
'     & ",IgtDpogAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRgPymt" _
'     & " where IgtDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IgtCode>0" _
'     & IIf(mQryEttCode > 0, " and IgtEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IgtVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor on a/c refund
'If chkFByIndrRgRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IgfDate as TrnDate" _
'     & ",(IgfRfugAmt * -1) as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRgRefd" _
'     & " where IgfDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IgfCode>0" _
'     & IIf(mQryEttCode > 0, " and IgfEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IgfVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem ----------------------------------
mQryStr = mQryStr & ")"
mQryStr = mQryStr & " group by format(TrnDate,'yyyy/MM')" _
 & " order by format(TrnDate,'yyyy/MM')"

datRecset.open mQryStr, dbComDatabase, adOpenKeyset, adLockReadOnly


End Sub

Private Sub CreateDailySrmyList()
Dim mQryStr As String

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
mQryStr = mQryStr & "Select OrcDate as TrnDate" _
 & ",OrcAmtAftDisc as TrnAmtAftDisc" _
 & ",OrcDiscAmt as TrnDiscAmt" _
 & " from (OutdRcpt" _
 & " inner join OutdHdr on OutdRcpt.OrcCode = OutdHdr.OhrCode)" _
 & " inner join ServMast on OutdRcpt.OrcSrvCode = ServMast.SrvCode" _
 & " where OrcDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
 & " and OrcCode > 0 and True = False" _
 & IIf(mQryEttCode > 0, " and OrcEttCode = " & CStr(mQryEttCode), "") _
 & IIf(mQrySrvCode > 0, " and OrcSrvCode = " & CStr(mQrySrvCode), "") _
 & IIf(mQrySgpCode > 0, " and SrvSgpCode = " & CStr(mQrySgpCode), "") _
 & IIf(mQryVtmCode > 0, " and OhrVtmCode = " & CStr(mQryVtmCode), "")
Rem outdoor registration
'If chkFByOutdReg.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & "Select OpgDate as TrnDate" _
'     & ",OpgAmtAftDisc as TrnAmtAftDisc" _
'     & ",OpgDiscAmt as TrnDiscAmt" _
'     & " from OutdReg" _
'     & " inner join ServMast on OutdReg.OpgSrvCode = ServMast.SrvCode" _
'     & " where OpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and OpgCode>0" _
'     & IIf(mQryEttCode > 0, " and OpgEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and OpgSrvCode=" & CStr(mQrySrvCode), "") _
'     & IIf(mQrySgpCode > 0, " and SrvSgpCode=" & CStr(mQrySgpCode), "") _
'     & IIf(mQryVtmCode > 0, " and OpgVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem outdoor receipt received amount
If chkFByOutdRcpt.Value = vbChecked Then
    mQryStr = mQryStr & " UNION ALL "
    mQryStr = mQryStr & " Select OrcDate as TrnDate" _
     & ",OrcRecdAmt as TrnAmtAftDisc" _
     & ",OrcDiscAmt as TrnDiscAmt" _
     & " from (OutdRcpt" _
     & " inner join OutdHdr on OutdRcpt.OrcCode = OutdHdr.OhrCode)" _
     & " inner join ServMast on OutdRcpt.OrcSrvCode = ServMast.SrvCode" _
     & " where OrcDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & " and OrcCode > 0" _
     & IIf(mQryEttCode > 0, " and OrcEttCode=" & CStr(mQryEttCode), "") _
     & IIf(mQrySrvCode > 0, " and OrcSrvCode=" & CStr(mQrySrvCode), "") _
     & IIf(mQrySgpCode > 0, " and SrvSgpCode=" & CStr(mQrySgpCode), "") _
     & IIf(mQryVtmCode > 0, " and OhrVtmCode=" & CStr(mQryVtmCode), "")
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
     & IIf(mQryEttCode > 0, " and OphEttCode=" & CStr(mQryEttCode), "") _
     & IIf(mQrySrvCode > 0, " and True=False", "") _
     & IIf(mQrySgpCode > 0, " and True=False", "") _
     & IIf(mQryVtmCode > 0, " and OphVtmCode=" & CStr(mQryVtmCode), "")
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
     & IIf(mQryEttCode > 0, " and OfhEttCode=" & CStr(mQryEttCode), "") _
     & IIf(mQrySrvCode > 0, " and True=False", "") _
     & IIf(mQrySgpCode > 0, " and True=False", "") _
     & IIf(mQryVtmCode > 0, " and OfhVtmCode=" & CStr(mQryVtmCode), "")
End If
Rem outdoor bill payment
'If chkFByOutdBlPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select ObphDate as TrnDate" _
'     & ",ObphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdBlPymtHdr" _
'     & " where ObphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and ObphCode>0" _
'     & IIf(mQryEttCode > 0, " and ObphEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and ObphVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem outdoor bill refund
'If chkFByOutdBlRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select ObfhDate as TrnDate" _
'     & ",ObfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdBlRefdHdr" _
'     & " where ObfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and ObfhCode>0" _
'     & IIf(mQryEttCode > 0, " and ObfhEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and ObfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor advance ---------------------
'If chkFByIndrReg.Value = vbChecked = True Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IpgDate as TrnDate" _
'     & ",IpgAdvAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrReg" _
'     & " where IpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IpgCode>0" _
'     & IIf(mQryEttCode > 0, " and IpgEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IpgVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor receipt received amount
'If chkFByIndrRcpt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IrcDate as TrnDate" _
'     & ",IrcRecdAmt as TrnAmtAftDisc" _
'     & ",IrcDiscAmt as TrnDiscAmt" _
'     & " from (IndrRcpt" _
'     & " inner join IndrHdr on IndrRcpt.IrcCode = IndrHdr.IhrCode)" _
'     & " inner join ServMast on IndrRcpt.IrcSrvCode = ServMast.SrvCode" _
'     & " where IrcDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IrcCode>0" _
'     & IIf(mQryEttCode > 0, " and IrcEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and IrcSrvCode=" & CStr(mQrySrvCode), "") _
'     & IIf(mQrySgpCode > 0, " and SrvSgpCode=" & CStr(mQrySgpCode), "") _
'     & IIf(mQryVtmCode > 0, " and IhrVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor payment
'If chkFByIndrPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IphDate as TrnDate" _
'     & ",IphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrPymtHdr" _
'     & " where IphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IphCode>0" _
'     & IIf(mQryEttCode > 0, " and IphEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IphVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor refund
'If chkFByIndrRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IfhDate as TrnDate" _
'     & ",IfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRefdHdr" _
'     & " where IfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IfhCode>0" _
'     & IIf(mQryEttCode > 0, " and IfhEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor bill payment
'If chkFByIndrBlPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IbphDate as TrnDate" _
'     & ",IbphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrBlPymtHdr" _
'     & " where IbphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IbphCode>0" _
'     & IIf(mQryEttCode > 0, " and IbphEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IbphVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor bill refund
'If chkFByIndrBlRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IbfhDate as TrnDate" _
'     & ",IbfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrBlRefdHdr" _
'     & " where IbfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IbfhCode>0" _
'     & IIf(mQryEttCode > 0, " and IbfhEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IbfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor on a/c payment
'If chkFByIndrRgPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IgtDate as TrnDate" _
'     & ",IgtDpogAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRgPymt" _
'     & " where IgtDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IgtCode>0" _
'     & IIf(mQryEttCode > 0, " and IgtEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IgtVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor on a/c refund
'If chkFByIndrRgRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IgfDate as TrnDate" _
'     & ",IgfRfugAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRgRefd" _
'     & " where IgfDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IgfCode>0" _
'     & IIf(mQryEttCode > 0, " and IgfEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IgfVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem ----------------------------------
mQryStr = mQryStr & ")"
mQryStr = mQryStr & " group by TrnDate" _
 & " order by TrnDate"

datRecset.open mQryStr, dbComDatabase, adOpenKeyset, adLockReadOnly


End Sub

Private Sub CreateEttNameSmryList()
Dim mQryStr As String

clsListStru.AddFields mExpr:="EttName", mTitle:="Patient Name", mShowItem:=True, mAlign:=1, mWidth:=3000
clsListStru.AddFields mExpr:="EttRegNo", mTitle:="Reg.No", mShowItem:=True, mAlign:=7, mWidth:=1500
clsListStru.AddFields mExpr:="EttRefName", mTitle:="Care of", mShowItem:=True, mAlign:=1, mWidth:=2000
clsListStru.AddFields mExpr:="TrnCount", mTitle:="Count", mShowItem:=True, mAlign:=7, mWidth:=1500
clsListStru.AddFields mExpr:="TrnAmtAftDisc_sum", mTitle:="Recd.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
clsListStru.AddFields mExpr:="TrnDiscAmt_sum", mTitle:="Discount", mShowItem:=True, mAlign:=7, mWidth:=1500

mQryStr = "Select EntityMast.EttName,t1.TrnEttCode,EntityMast.EttRegNo,EntityMast.EttRefName" _
 & ",Count(*) as TrnCount" _
 & ",Sum(t1.TrnAmtAftDisc) as TrnAmtAftDisc_sum" _
 & ",Sum(t1.TrnDiscAmt) as TrnDiscAmt_sum"
mQryStr = mQryStr & " from ("
Rem reserved query string producing no records
mQryStr = mQryStr & "Select OrcEttCode as TrnEttCode" _
 & ",OrcAmtAftDisc as TrnAmtAftDisc" _
 & ",OrcDiscAmt as TrnDiscAmt" _
 & " from (OutdRcpt" _
 & " inner join OutdHdr on OutdRcpt.OrcCode = OutdHdr.OhrCode)" _
 & " inner join ServMast on OutdRcpt.OrcSrvCode = ServMast.SrvCode" _
 & " where OrcDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
 & " and OrcCode > 0 and True = False" _
 & IIf(mQryEttCode > 0, " and OrcEttCode = " & CStr(mQryEttCode), "") _
 & IIf(mQrySrvCode > 0, " and OrcSrvCode = " & CStr(mQrySrvCode), "") _
 & IIf(mQrySgpCode > 0, " and SrvSgpCode = " & CStr(mQrySgpCode), "") _
 & IIf(mQryVtmCode > 0, " and OhrVtmCode = " & CStr(mQryVtmCode), "")
Rem outdoor registration
'If chkFByOutdReg.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select OpgEttCode as TrnEttCode" _
'     & ",OpgAmtAftDisc as TrnAmtAftDisc" _
'     & ",OpgDiscAmt as TrnDiscAmt" _
'     & " from OutdReg" _
'     & " inner join ServMast on OutdReg.OpgSrvCode = ServMast.SrvCode" _
'     & " where OpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and OpgCode>0" _
'     & IIf(mQryEttCode > 0, " and OpgEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and OpgSrvCode=" & CStr(mQrySrvCode), "") _
'     & IIf(mQrySgpCode > 0, " and SrvSgpCode=" & CStr(mQrySgpCode), "") _
'     & IIf(mQryVtmCode > 0, " and OpgVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem outdoor receipt received amount
If chkFByOutdRcpt.Value = vbChecked Then
    mQryStr = mQryStr & " UNION ALL "
    mQryStr = mQryStr & " Select OrcEttCode as TrnEttCode" _
     & ",OrcRecdAmt as TrnAmtAftDisc" _
     & ",OrcDiscAmt as TrnDiscAmt" _
     & " from (OutdRcpt" _
     & " inner join OutdHdr on OutdRcpt.OrcCode = OutdHdr.OhrCode)" _
     & " inner join ServMast on OutdRcpt.OrcSrvCode = ServMast.SrvCode" _
     & " where OrcDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & " and OrcCode > 0" _
     & IIf(mQryEttCode > 0, " and OrcEttCode=" & CStr(mQryEttCode), "") _
     & IIf(mQrySrvCode > 0, " and OrcSrvCode=" & CStr(mQrySrvCode), "") _
     & IIf(mQrySgpCode > 0, " and SrvSgpCode=" & CStr(mQrySgpCode), "") _
     & IIf(mQryVtmCode > 0, " and OhrVtmCode=" & CStr(mQryVtmCode), "")
End If
Rem outdoor payment
If chkFByOutdPymt.Value = vbChecked Then
    mQryStr = mQryStr & " UNION ALL "
    mQryStr = mQryStr & " Select OphEttCode as TrnEttCode" _
     & ",OphDepoAmt as TrnAmtAftDisc" _
     & ",0 as TrnDiscAmt" _
     & " from OutdPymtHdr" _
     & " where OphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & " and OphCode>0" _
     & IIf(mQryEttCode > 0, " and OphEttCode=" & CStr(mQryEttCode), "") _
     & IIf(mQrySrvCode > 0, " and True=False", "") _
     & IIf(mQrySgpCode > 0, " and True=False", "") _
     & IIf(mQryVtmCode > 0, " and OphVtmCode=" & CStr(mQryVtmCode), "")
End If
Rem outdoor refund
If chkFByOutdRefd.Value = vbChecked Then
    mQryStr = mQryStr & " UNION ALL "
    mQryStr = mQryStr & " Select OfhEttCode as TrnEttCode" _
     & ",OfhRefuAmt * -1 as TrnAmtAftDisc" _
     & ",0 as TrnDiscAmt" _
     & " from OutdRefdHdr" _
     & " where OfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & " and OfhCode>0" _
     & IIf(mQryEttCode > 0, " and OfhEttCode=" & CStr(mQryEttCode), "") _
     & IIf(mQrySrvCode > 0, " and True=False", "") _
     & IIf(mQrySgpCode > 0, " and True=False", "") _
     & IIf(mQryVtmCode > 0, " and OfhVtmCode=" & CStr(mQryVtmCode), "")
End If
Rem outdoor bill payment
'If chkFByOutdBlPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select ObphEttCode as TrnEttCode" _
'     & ",ObphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdBlPymtHdr" _
'     & " where ObphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and ObphCode>0" _
'     & IIf(mQryEttCode > 0, " and ObphEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and ObphVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem outdoor bill refund
'If chkFByOutdBlRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select ObfhEttCode as TrnEttCode" _
'     & ",ObfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdBlRefdHdr" _
'     & " where ObfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and ObfhCode>0" _
'     & IIf(mQryEttCode > 0, " and ObfhEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and ObfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor advance ---------------------
'If chkFByIndrReg.Value = vbChecked = True Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IpgEttCode as TrnEttCode" _
'     & ",IpgAdvAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrReg" _
'     & " where IpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IpgCode>0" _
'     & IIf(mQryEttCode > 0, " and IpgEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IpgVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor receipt received amount
'If chkFByIndrRcpt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IrcEttCode as TrnEttCode" _
'     & ",IrcRecdAmt as TrnAmtAftDisc" _
'     & ",IrcDiscAmt as TrnDiscAmt" _
'     & " from (IndrRcpt" _
'     & " inner join IndrHdr on IndrRcpt.IrcCode = IndrHdr.IhrCode)" _
'     & " inner join ServMast on IndrRcpt.IrcSrvCode = ServMast.SrvCode" _
'     & " where IrcDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IrcCode>0" _
'     & IIf(mQryEttCode > 0, " and IrcEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and IrcSrvCode=" & CStr(mQrySrvCode), "") _
'     & IIf(mQrySgpCode > 0, " and SrvSgpCode=" & CStr(mQrySgpCode), "") _
'     & IIf(mQryVtmCode > 0, " and IhrVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor payment
'If chkFByIndrPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IphEttCode as TrnEttCode" _
'     & ",IphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrPymtHdr" _
'     & " where IphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IphCode>0" _
'     & IIf(mQryEttCode > 0, " and IphEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IphVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor refund
'If chkFByIndrRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IfhEttCode as TrnEttCode" _
'     & ",IfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRefdHdr" _
'     & " where IfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IfhCode>0" _
'     & IIf(mQryEttCode > 0, " and IfhEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor bill payment
'If chkFByIndrBlPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IbphEttCode as TrnEttCode" _
'     & ",IbphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrBlPymtHdr" _
'     & " where IbphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IbphCode>0" _
'     & IIf(mQryEttCode > 0, " and IbphEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IbphVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor bill refund
'If chkFByIndrBlRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IbfhEttCode as TrnEttCode" _
'     & ",IbfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrBlRefdHdr" _
'     & " where IbfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IbfhCode>0" _
'     & IIf(mQryEttCode > 0, " and IbfhEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IbfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor on a/c payment
'If chkFByIndrRgPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IgtEttCode as TrnEttCode" _
'     & ",IgtDpogAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRgPymt" _
'     & " where IgtDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IgtCode>0" _
'     & IIf(mQryEttCode > 0, " and IgtEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IgtVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor on a/c refund
'If chkFByIndrRgRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IgfEttCode as TrnEttCode" _
'     & ",IgfRfugAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRgRefd" _
'     & " where IgfDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IgfCode>0" _
'     & IIf(mQryEttCode > 0, " and IgfEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IgfVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem ----------------------------------
mQryStr = mQryStr & ")"
mQryStr = mQryStr & " as t1 inner join EntityMast on t1.TrnEttCode=EntityMast.EttCode" _
 & " group by EntityMast.EttName,EntityMast.EttRegNo,EntityMast.EttRefName,t1.TrnEttCode" _
 & " order by EntityMast.EttName,EntityMast.EttRegNo,EntityMast.EttRefName,t1.TrnEttCode"

datRecset.open mQryStr, dbComDatabase, adOpenKeyset, adLockReadOnly

End Sub

Private Sub CreateEttRegNoSmryList()
Dim mQryStr As String

clsListStru.AddFields mExpr:="EttRegNo", mTitle:="Reg.No", mShowItem:=True, mAlign:=7, mWidth:=1500
clsListStru.AddFields mExpr:="EttName", mTitle:="Patient Name", mShowItem:=True, mAlign:=1, mWidth:=3000
clsListStru.AddFields mExpr:="EttRefName", mTitle:="Care of", mShowItem:=True, mAlign:=1, mWidth:=2000
clsListStru.AddFields mExpr:="TrnCount", mTitle:="Count", mShowItem:=True, mAlign:=7, mWidth:=1500
clsListStru.AddFields mExpr:="TrnAmtAftDisc_sum", mTitle:="Recd.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
clsListStru.AddFields mExpr:="TrnDiscAmt_sum", mTitle:="Discount", mShowItem:=True, mAlign:=7, mWidth:=1500

mQryStr = "Select EntityMast.EttRegNo,t1.TrnEttCode,EntityMast.EttName,EntityMast.EttRefName" _
 & ",Count(*) as TrnCount" _
 & ",Sum(t1.TrnAmtAftDisc) as TrnAmtAftDisc_sum" _
 & ",Sum(t1.TrnDiscAmt) as TrnDiscAmt_sum"
mQryStr = mQryStr & " from ("
Rem reserved query string producing no records
mQryStr = mQryStr & "Select OrcEttCode as TrnEttCode" _
 & ",OrcAmtAftDisc as TrnAmtAftDisc" _
 & ",OrcDiscAmt as TrnDiscAmt" _
 & " from (OutdRcpt" _
 & " inner join OutdHdr on OutdRcpt.OrcCode = OutdHdr.OhrCode)" _
 & " inner join ServMast on OutdRcpt.OrcSrvCode = ServMast.SrvCode" _
 & " where OrcDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
 & " and OrcCode > 0 and True = False" _
 & IIf(mQryEttCode > 0, " and OrcEttCode = " & CStr(mQryEttCode), "") _
 & IIf(mQrySrvCode > 0, " and OrcSrvCode = " & CStr(mQrySrvCode), "") _
 & IIf(mQrySgpCode > 0, " and SrvSgpCode = " & CStr(mQrySgpCode), "") _
 & IIf(mQryVtmCode > 0, " and OhrVtmCode = " & CStr(mQryVtmCode), "")
Rem outdoor registration
'If chkFByOutdReg.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select OpgEttCode as TrnEttCode" _
'     & ",OpgAmtAftDisc as TrnAmtAftDisc" _
'     & ",OpgDiscAmt as TrnDiscAmt" _
'     & " from OutdReg" _
'     & " inner join ServMast on OutdReg.OpgSrvCode = ServMast.SrvCode" _
'     & " where OpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and OpgCode>0" _
'     & IIf(mQryEttCode > 0, " and OpgEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and OpgSrvCode=" & CStr(mQrySrvCode), "") _
'     & IIf(mQrySgpCode > 0, " and SrvSgpCode=" & CStr(mQrySgpCode), "") _
'     & IIf(mQryVtmCode > 0, " and OpgVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem outdoor receipt received amount
If chkFByOutdRcpt.Value = vbChecked Then
    mQryStr = mQryStr & " UNION ALL "
    mQryStr = mQryStr & " Select OrcEttCode as TrnEttCode" _
     & ",OrcRecdAmt as TrnAmtAftDisc" _
     & ",OrcDiscAmt as TrnDiscAmt" _
     & " from (OutdRcpt" _
     & " inner join OutdHdr on OutdRcpt.OrcCode = OutdHdr.OhrCode)" _
     & " inner join ServMast on OutdRcpt.OrcSrvCode = ServMast.SrvCode" _
     & " where OrcDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & " and OrcCode>0" _
     & IIf(mQryEttCode > 0, " and OrcEttCode=" & CStr(mQryEttCode), "") _
     & IIf(mQrySrvCode > 0, " and OrcSrvCode=" & CStr(mQrySrvCode), "") _
     & IIf(mQrySgpCode > 0, " and SrvSgpCode=" & CStr(mQrySgpCode), "") _
     & IIf(mQryVtmCode > 0, " and OhrVtmCode=" & CStr(mQryVtmCode), "")
End If
Rem outdoor payment
If chkFByOutdPymt.Value = vbChecked Then
    mQryStr = mQryStr & " UNION ALL "
    mQryStr = mQryStr & " Select OphEttCode as TrnEttCode" _
     & ",OphDepoAmt as TrnAmtAftDisc" _
     & ",0 as TrnDiscAmt" _
     & " from OutdPymtHdr" _
     & " where OphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & " and OphCode>0" _
     & IIf(mQryEttCode > 0, " and OphEttCode=" & CStr(mQryEttCode), "") _
     & IIf(mQrySrvCode > 0, " and True=False", "") _
     & IIf(mQrySgpCode > 0, " and True=False", "") _
     & IIf(mQryVtmCode > 0, " and OphVtmCode=" & CStr(mQryVtmCode), "")
End If
Rem outdoor refund
If chkFByOutdRefd.Value = vbChecked Then
    mQryStr = mQryStr & " UNION ALL "
    mQryStr = mQryStr & " Select OfhEttCode as TrnEttCode" _
     & ",OfhRefuAmt * -1 as TrnAmtAftDisc" _
     & ",0 as TrnDiscAmt" _
     & " from OutdRefdHdr" _
     & " where OfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & " and OfhCode>0" _
     & IIf(mQryEttCode > 0, " and OfhEttCode=" & CStr(mQryEttCode), "") _
     & IIf(mQrySrvCode > 0, " and True=False", "") _
     & IIf(mQrySgpCode > 0, " and True=False", "") _
     & IIf(mQryVtmCode > 0, " and OfhVtmCode=" & CStr(mQryVtmCode), "")
End If
Rem outdoor bill payment
'If chkFByOutdBlPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select ObphEttCode as TrnEttCode" _
'     & ",ObphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdBlPymtHdr" _
'     & " where ObphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and ObphCode>0" _
'     & IIf(mQryEttCode > 0, " and ObphEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and ObphVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem outdoor bill refund
'If chkFByOutdBlRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select ObfhEttCode as TrnEttCode" _
'     & ",ObfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdBlRefdHdr" _
'     & " where ObfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and ObfhCode>0" _
'     & IIf(mQryEttCode > 0, " and ObfhEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and ObfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor advance ---------------------
'If chkFByIndrReg.Value = vbChecked = True Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IpgEttCode as TrnEttCode" _
'     & ",IpgAdvAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrReg" _
'     & " where IpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IpgCode>0" _
'     & IIf(mQryEttCode > 0, " and IpgEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IpgVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor receipt received amount
'If chkFByIndrRcpt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IrcEttCode as TrnEttCode" _
'     & ",IrcRecdAmt as TrnAmtAftDisc" _
'     & ",IrcDiscAmt as TrnDiscAmt" _
'     & " from (IndrRcpt" _
'     & " inner join IndrHdr on IndrRcpt.IrcCode = IndrHdr.IhrCode)" _
'     & " inner join ServMast on IndrRcpt.IrcSrvCode = ServMast.SrvCode" _
'     & " where IrcDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IrcCode>0" _
'     & IIf(mQryEttCode > 0, " and IrcEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and IrcSrvCode=" & CStr(mQrySrvCode), "") _
'     & IIf(mQrySgpCode > 0, " and SrvSgpCode=" & CStr(mQrySgpCode), "") _
'     & IIf(mQryVtmCode > 0, " and IhrVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor payment
'If chkFByIndrPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IphEttCode as TrnEttCode" _
'     & ",IphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrPymtHdr" _
'     & " where IphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IphCode>0" _
'     & IIf(mQryEttCode > 0, " and IphEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IphVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor refund
'If chkFByIndrRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IfhEttCode as TrnEttCode" _
'     & ",IfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRefdHdr" _
'     & " where IfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IfhCode>0" _
'     & IIf(mQryEttCode > 0, " and IfhEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor bill payment
'If chkFByIndrBlPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IbphEttCode as TrnEttCode" _
'     & ",IbphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrBlPymtHdr" _
'     & " where IbphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IbphCode>0" _
'     & IIf(mQryEttCode > 0, " and IbphEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IbphVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor bill refund
'If chkFByIndrBlRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IbfhEttCode as TrnEttCode" _
'     & ",IbfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrBlRefdHdr" _
'     & " where IbfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IbfhCode>0" _
'     & IIf(mQryEttCode > 0, " and IbfhEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IbfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor on a/c payment
'If chkFByIndrRgPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IgtEttCode as TrnEttCode" _
'     & ",IgtDpogAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRgPymt" _
'     & " where IgtDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IgtCode>0" _
'     & IIf(mQryEttCode > 0, " and IgtEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IgtVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor on a/c refund
'If chkFByIndrRgRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IgfEttCode as TrnEttCode" _
'     & ",IgfRfugAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRgRefd" _
'     & " where IgfDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IgfCode>0" _
'     & IIf(mQryEttCode > 0, " and IgfEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IgfVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem ----------------------------------
mQryStr = mQryStr & ")"
mQryStr = mQryStr & " as t1 inner join EntityMast on t1.TrnEttCode=EntityMast.EttCode" _
 & " group by EntityMast.EttRegNo,EntityMast.EttName,EntityMast.EttRefName,t1.TrnEttCode" _
 & " order by EntityMast.EttRegNo,EntityMast.EttName,EntityMast.EttRefName,t1.TrnEttCode"

datRecset.open mQryStr, dbComDatabase, adOpenKeyset, adLockReadOnly

End Sub

Private Sub CreateServNameSmryList()
Dim mQryStr As String

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
mQryStr = mQryStr & "Select OrcSrvCode as TrnSrvCode,ServMast.SrvName as TrnSrvName" _
 & ",OrcAmtAftDisc as TrnAmtAftDisc" _
 & ",OrcDiscAmt as TrnDiscAmt" _
 & " from (OutdRcpt" _
 & " inner join OutdHdr on OutdRcpt.OrcCode = OutdHdr.OhrCode)" _
 & " inner join ServMast on OutdRcpt.OrcSrvCode = ServMast.SrvCode" _
 & " where OrcDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
 & " and OrcCode > 0 and True = False" _
 & IIf(mQryEttCode > 0, " and OrcEttCode = " & CStr(mQryEttCode), "") _
 & IIf(mQrySrvCode > 0, " and OrcSrvCode = " & CStr(mQrySrvCode), "") _
 & IIf(mQrySgpCode > 0, " and SrvSgpCode = " & CStr(mQrySgpCode), "") _
 & IIf(mQryVtmCode > 0, " and OhrVtmCode = " & CStr(mQryVtmCode), "")
Rem outdoor registration
'If chkFByOutdReg.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select OpgSrvCode as TrnSrvCode,ServMast.SrvName as TrnSrvName" _
'     & ",OpgAmtAftDisc as TrnAmtAftDisc" _
'     & ",OpgDiscAmt as TrnDiscAmt" _
'     & " from OutdReg" _
'     & " inner join ServMast on OutdReg.OpgSrvCode=ServMast.SrvCode" _
'     & " where OpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and OpgCode>0" _
'     & IIf(mQryEttCode > 0, " and OpgEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and OpgSrvCode=" & CStr(mQrySrvCode), "") _
'     & IIf(mQrySgpCode > 0, " and SrvSgpCode=" & CStr(mQrySgpCode), "") _
'     & IIf(mQryVtmCode > 0, " and OpgVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem outdoor receipt received amount
If chkFByOutdRcpt.Value = vbChecked Then
    mQryStr = mQryStr & " UNION ALL "
    mQryStr = mQryStr & " Select OrcSrvCode as TrnSrvCode,ServMast.SrvName as TrnSrvName" _
     & ",OrcRecdAmt as TrnAmtAftDisc" _
     & ",OrcDiscAmt as TrnDiscAmt" _
     & " from (OutdRcpt" _
     & " inner join OutdHdr on OutdRcpt.OrcCode = OutdHdr.OhrCode)" _
     & " inner join ServMast on OutdRcpt.OrcSrvCode = ServMast.SrvCode" _
     & " where OrcDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & " and OrcCode>0" _
     & IIf(mQryEttCode > 0, " and OrcEttCode=" & CStr(mQryEttCode), "") _
     & IIf(mQrySrvCode > 0, " and OrcSrvCode=" & CStr(mQrySrvCode), "") _
     & IIf(mQrySgpCode > 0, " and SrvSgpCode=" & CStr(mQrySgpCode), "") _
     & IIf(mQryVtmCode > 0, " and OhrVtmCode=" & CStr(mQryVtmCode), "")
End If
Rem outdoor payment
If chkFByOutdPymt.Value = vbChecked Then
    mQryStr = mQryStr & " UNION ALL "
    mQryStr = mQryStr & " Select OphVtmCode * -1 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
     & ",OphDepoAmt as TrnAmtAftDisc" _
     & ",0 as TrnDiscAmt" _
     & " from OutdPymtHdr" _
     & " inner join VTypMast on OutdPymtHdr.OphVtmCode = VTypMast.VtmCode" _
     & " where OphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & " and OphCode>0" _
     & IIf(mQryEttCode > 0, " and OphEttCode=" & CStr(mQryEttCode), "") _
     & IIf(mQrySrvCode > 0, " and True=False", "") _
     & IIf(mQrySgpCode > 0, " and True=False", "") _
     & IIf(mQryVtmCode > 0, " and OphVtmCode=" & CStr(mQryVtmCode), "")
End If
Rem outdoor refund
If chkFByOutdRefd.Value = vbChecked Then
    mQryStr = mQryStr & " UNION ALL "
    mQryStr = mQryStr & " Select OfhVtmCode * -1 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
     & ",OfhRefuAmt * -1 as TrnAmtAftDisc" _
     & ",0 as TrnDiscAmt" _
     & " from OutdRefdHdr" _
     & " inner join VTypMast on OutdRefdHdr.OfhVtmCode = VTypMast.VtmCode" _
     & " where OfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & " and OfhCode>0" _
     & IIf(mQryEttCode > 0, " and OfhEttCode=" & CStr(mQryEttCode), "") _
     & IIf(mQrySrvCode > 0, " and True=False", "") _
     & IIf(mQrySgpCode > 0, " and True=False", "") _
     & IIf(mQryVtmCode > 0, " and OfhVtmCode=" & CStr(mQryVtmCode), "")
End If
Rem outdoor bill payment
'If chkFByOutdBlPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select ObphVtmCode * - 1 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",ObphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdBlPymtHdr" _
'     & " inner join VTypMast on OutdBlPymtHdr.ObphVtmCode = VTypMast.VtmCode" _
'     & " where ObphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and ObphCode>0" _
'     & IIf(mQryEttCode > 0, " and ObphEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and ObphVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem outdoor bill refund
'If chkFByOutdBlRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select ObfhVtmCode * -1 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",ObfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdBlRefdHdr" _
'     & " inner join VTypMast on OutdBlRefdHdr.ObfhVtmCode = VTypMast.VtmCode" _
'     & " where ObfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and ObfhCode>0" _
'     & IIf(mQryEttCode > 0, " and ObfhEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and ObfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor advance ---------------------
'If chkFByIndrReg.Value = vbChecked = True Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IpgVtmCode * - 1 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",IpgAdvAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrReg" _
'     & " inner join VTypMast on IndrReg.IpgVtmCode = VTypMast.VtmCode" _
'     & " where IpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IpgCode>0" _
'     & IIf(mQryEttCode > 0, " and IpgEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IpgVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor receipt received amount
'If chkFByIndrRcpt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IrcSrvCode as TrnSrvCode,ServMast.SrvName as TrnSrvName" _
'     & ",IrcRecdAmt as TrnAmtAftDisc" _
'     & ",IrcDiscAmt as TrnDiscAmt" _
'     & " from (IndrRcpt" _
'     & " inner join IndrHdr on IndrRcpt.IrcCode = IndrHdr.IhrCode)" _
'     & " inner join ServMast on IndrRcpt.IrcSrvCode=ServMast.SrvCode" _
'     & " where IrcDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IrcCode>0" _
'     & IIf(mQryEttCode > 0, " and IrcEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and IrcSrvCode=" & CStr(mQrySrvCode), "") _
'     & IIf(mQrySgpCode > 0, " and SrvSgpCode=" & CStr(mQrySgpCode), "") _
'     & IIf(mQryVtmCode > 0, " and IhrVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor payment
'If chkFByIndrPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IphVtmCode * -1 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",IphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrPymtHdr" _
'     & " inner join VTypMast on IndrPymtHdr.IphVtmCode = VTypMast.VtmCode" _
'     & " where IphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IphCode>0" _
'     & IIf(mQryEttCode > 0, " and IphEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IphVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor refund
'If chkFByIndrRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IfhVtmCode * -1 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",IfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRefdHdr" _
'     & " inner join VTypMast on IndrRefdHdr.IfhVtmCode = VTypMast.VtmCode" _
'     & " where IfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IfhCode>0" _
'     & IIf(mQryEttCode > 0, " and IfhEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor bill payment
'If chkFByIndrBlPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IbphVtmCode * -1 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",IbphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrBlPymtHdr" _
'     & " inner join VTypMast on IndrBlPymtHdr.IbphVtmCode = VTypMast.VtmCode" _
'     & " where IbphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IbphCode>0" _
'     & IIf(mQryEttCode > 0, " and IbphEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IbphVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor bill refund
'If chkFByIndrBlRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IbfhVtmCode * -1 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",IbfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrBlRefdHdr" _
'     & " inner join VTypMast on IndrBlRefdHdr.IbfhVtmCode = VTypMast.VtmCode" _
'     & " where IbfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IbfhCode>0" _
'     & IIf(mQryEttCode > 0, " and IbfhEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IbfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor on a/c payment
'If chkFByIndrRgPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IgtVtmCode * -1 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",IgtDpogAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRgPymt" _
'     & " inner join VTypMast on IndrRgPymt.IgtVtmCode = VTypMast.VtmCode" _
'     & " where IgtDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IgtCode>0" _
'     & IIf(mQryEttCode > 0, " and IgtEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IgtVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor on a/c refund
'If chkFByIndrRgRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IgfVtmCode * -1 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",IgfRfugAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRgRefd" _
'     & " inner join VTypMast on IndrRgRefd.IgfVtmCode = VTypMast.VtmCode" _
'     & " where IgfDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IgfCode>0" _
'     & IIf(mQryEttCode > 0, " and IgfEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IgfVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem ----------------------------------
mQryStr = mQryStr & ")"
mQryStr = mQryStr & " as t1 group by t1.TrnSrvName,t1.TrnSrvCode" _
 & " order by t1.TrnSrvName,t1.TrnSrvCode"

datRecset.open mQryStr, dbComDatabase, adOpenKeyset, adLockReadOnly


End Sub

Private Sub CreateServGrpNameSmryList()
Dim mQryStr As String

clsListStru.AddFields mExpr:="TrnSgpName", mTitle:="Service Group Name", mShowItem:=True, mAlign:=1, mWidth:=3000
clsListStru.AddFields mExpr:="TrnCount", mTitle:="Count", mShowItem:=True, mAlign:=7, mWidth:=1500
clsListStru.AddFields mExpr:="TrnAmtAftDisc_sum", mTitle:="Recd.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
clsListStru.AddFields mExpr:="TrnDiscAmt_sum", mTitle:="Discount", mShowItem:=True, mAlign:=7, mWidth:=1500

mQryStr = "Select " _
 & " t1.TrnSgpName,t1.TrnSgpCode" _
 & ",Count(*) as TrnCount" _
 & ",Sum(t1.TrnAmtAftDisc) as TrnAmtAftDisc_sum" _
 & ",Sum(t1.TrnDiscAmt) as TrnDiscAmt_sum"
mQryStr = mQryStr & " from ("
Rem reserved query string producing no records
mQryStr = mQryStr & "Select SrvSgpCode as TrnSgpCode,ServGrpMst.SgpName as TrnSgpName" _
 & ",OrcAmtAftDisc as TrnAmtAftDisc" _
 & ",OrcDiscAmt as TrnDiscAmt" _
 & " from (OutdRcpt" _
 & " inner join OutdHdr on OutdRcpt.OrcCode = OutdHdr.OhrCode)" _
 & " inner join (ServMast inner join ServGrpMst on ServMast.SrvSgpCode = ServGrpMst.SgpCode) on OutdRcpt.OrcSrvCode = ServMast.SrvCode" _
 & " where OrcDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
 & " and OrcCode > 0 and True = False" _
 & IIf(mQryEttCode > 0, " and OrcEttCode = " & CStr(mQryEttCode), "") _
 & IIf(mQrySrvCode > 0, " and OrcSrvCode = " & CStr(mQrySrvCode), "") _
 & IIf(mQrySgpCode > 0, " and SrvSgpCode = " & CStr(mQrySgpCode), "") _
 & IIf(mQryVtmCode > 0, " and OhrVtmCode = " & CStr(mQryVtmCode), "")
Rem outdoor registration
'If chkFByOutdReg.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select SrvSgpCode as TrnSgpCode,ServGrpMst.SgpName as TrnSgpName" _
'     & ",OpgAmtAftDisc as TrnAmtAftDisc" _
'     & ",OpgDiscAmt as TrnDiscAmt" _
'     & " from OutdReg" _
'     & " inner join (ServMast inner join ServGrpMst on ServMast.SrvSgpCode = ServGrpMst.SgpCode) on OutdReg.OpgSrvCode=ServMast.SrvCode" _
'     & " where OpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and OpgCode>0" _
'     & IIf(mQryEttCode > 0, " and OpgEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and OpgSrvCode=" & CStr(mQrySrvCode), "") _
'     & IIf(mQrySgpCode > 0, " and SrvSgpCode=" & CStr(mQrySgpCode), "") _
'     & IIf(mQryVtmCode > 0, " and OpgVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem outdoor receipt received amount
If chkFByOutdRcpt.Value = vbChecked Then
    mQryStr = mQryStr & " UNION ALL "
    mQryStr = mQryStr & " Select SrvSgpCode as TrnSgpCode,ServGrpMst.SgpName as TrnSgpName" _
     & ",OrcRecdAmt as TrnAmtAftDisc" _
     & ",OrcDiscAmt as TrnDiscAmt" _
     & " from (OutdRcpt" _
     & " inner join OutdHdr on OutdRcpt.OrcCode = OutdHdr.OhrCode)" _
     & " inner join (ServMast inner join ServGrpMst on ServMast.SrvSgpCode = ServGrpMst.SgpCode) on OutdRcpt.OrcSrvCode = ServMast.SrvCode" _
     & " where OrcDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & " and OrcCode>0" _
     & IIf(mQryEttCode > 0, " and OrcEttCode=" & CStr(mQryEttCode), "") _
     & IIf(mQrySrvCode > 0, " and OrcSrvCode=" & CStr(mQrySrvCode), "") _
     & IIf(mQrySgpCode > 0, " and SrvSgpCode=" & CStr(mQrySgpCode), "") _
     & IIf(mQryVtmCode > 0, " and OhrVtmCode=" & CStr(mQryVtmCode), "")
End If
Rem outdoor payment
If chkFByOutdPymt.Value = vbChecked Then
    mQryStr = mQryStr & " UNION ALL "
    mQryStr = mQryStr & " Select OphVtmCode * -1 as TrnSgpCode,VTypMast.VtmName as TrnSgpName" _
     & ",OphDepoAmt as TrnAmtAftDisc" _
     & ",0 as TrnDiscAmt" _
     & " from OutdPymtHdr" _
     & " inner join VTypMast on OutdPymtHdr.OphVtmCode = VTypMast.VtmCode" _
     & " where OphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & " and OphCode>0" _
     & IIf(mQryEttCode > 0, " and OphEttCode=" & CStr(mQryEttCode), "") _
     & IIf(mQrySrvCode > 0, " and True=False", "") _
     & IIf(mQrySgpCode > 0, " and True=False", "") _
     & IIf(mQryVtmCode > 0, " and OphVtmCode=" & CStr(mQryVtmCode), "")
End If
Rem outdoor refund
If chkFByOutdRefd.Value = vbChecked Then
    mQryStr = mQryStr & " UNION ALL "
    mQryStr = mQryStr & " Select OfhVtmCode * -1 as TrnSgpCode,VTypMast.VtmName as TrnSgpName" _
     & ",OfhRefuAmt * -1 as TrnAmtAftDisc" _
     & ",0 as TrnDiscAmt" _
     & " from OutdRefdHdr" _
     & " inner join VTypMast on OutdRefdHdr.OfhVtmCode = VTypMast.VtmCode" _
     & " where OfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & " and OfhCode>0" _
     & IIf(mQryEttCode > 0, " and OfhEttCode=" & CStr(mQryEttCode), "") _
     & IIf(mQrySrvCode > 0, " and True=False", "") _
     & IIf(mQrySgpCode > 0, " and True=False", "") _
     & IIf(mQryVtmCode > 0, " and OfhVtmCode=" & CStr(mQryVtmCode), "")
End If
Rem outdoor bill payment
'If chkFByOutdBlPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select ObphVtmCode * -1 as TrnSgpCode,VTypMast.VtmName as TrnSgpName" _
'     & ",ObphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdBlPymtHdr" _
'     & " inner join VTypMast on OutdBlPymtHdr.ObphVtmCode = VTypMast.VtmCode" _
'     & " where ObphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and ObphCode>0" _
'     & IIf(mQryEttCode > 0, " and ObphEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and ObphVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem outdoor bill refund
'If chkFByOutdBlRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select ObfhVtmCode * -1 as TrnSgpCode,VTypMast.VtmName as TrnSgpName" _
'     & ",ObfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdBlRefdHdr" _
'     & " inner join VTypMast on OutdBlRefdHdr.ObfhVtmCode = VTypMast.VtmCode" _
'     & " where ObfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and ObfhCode>0" _
'     & IIf(mQryEttCode > 0, " and ObfhEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and ObfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor advance ---------------------
'If chkFByIndrReg.Value = vbChecked = True Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IpgVtmCode * -1 as TrnSgpCode,VTypMast.VtmName as TrnSgpName" _
'     & ",IpgAdvAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrReg" _
'     & " inner join VTypMast on IndrReg.IpgVtmCode = VTypMast.VtmCode" _
'     & " where IpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IpgCode>0" _
'     & IIf(mQryEttCode > 0, " and IpgEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IpgVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor receipt received amount
'If chkFByIndrRcpt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select SrvSgpCode as TrnSgpCode,ServGrpMst.SgpName as TrnSgpName" _
'     & ",IrcRecdAmt as TrnAmtAftDisc" _
'     & ",IrcDiscAmt as TrnDiscAmt" _
'     & " from (IndrRcpt" _
'     & " inner join IndrHdr on IndrRcpt.IrcCode = IndrHdr.IhrCode)" _
'     & " inner join (ServMast inner join ServGrpMst on ServMast.SrvSgpCode = ServGrpMst.SgpCode) on IndrRcpt.IrcSrvCode=ServMast.SrvCode" _
'     & " where IrcDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IrcCode>0" _
'     & IIf(mQryEttCode > 0, " and IrcEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and IrcSrvCode=" & CStr(mQrySrvCode), "") _
'     & IIf(mQrySgpCode > 0, " and SrvSgpCode=" & CStr(mQrySgpCode), "") _
'     & IIf(mQryVtmCode > 0, " and IhrVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor payment
'If chkFByIndrPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IphVtmCode * -1 as TrnSgpCode,VTypMast.VtmName as TrnSgpName" _
'     & ",IphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrPymtHdr" _
'     & " inner join VTypMast on IndrPymtHdr.IphVtmCode = VTypMast.VtmCode" _
'     & " where IphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IphCode>0" _
'     & IIf(mQryEttCode > 0, " and IphEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IphVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor refund
'If chkFByIndrRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IfhVtmCode * -1 as TrnSgpCode,VTypMast.VtmName as TrnSgpName" _
'     & ",IfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRefdHdr" _
'     & " inner join VTypMast on IndrRefdHdr.IfhVtmCode = VTypMast.VtmCode" _
'     & " where IfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IfhCode>0" _
'     & IIf(mQryEttCode > 0, " and IfhEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor bill payment
'If chkFByIndrBlPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IbphVtmCode * -1 as TrnSgpCode,VTypMast.VtmName as TrnSgpName" _
'     & ",IbphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrBlPymtHdr" _
'     & " inner join VTypMast on IndrBlPymtHdr.IbphVtmCode = VTypMast.VtmCode" _
'     & " where IbphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IbphCode>0" _
'     & IIf(mQryEttCode > 0, " and IbphEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IbphVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor bill refund
'If chkFByIndrBlRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IbfhVtmCode * -1 as TrnSgpCode,VTypMast.VtmName as TrnSgpName" _
'     & ",IbfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrBlRefdHdr" _
'     & " inner join VTypMast on IndrBlRefdHdr.IbfhVtmCode = VTypMast.VtmCode" _
'     & " where IbfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IbfhCode>0" _
'     & IIf(mQryEttCode > 0, " and IbfhEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IbfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor on a/c payment
'If chkFByIndrRgPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IgtVtmCode * -1 as TrnSgpCode,VTypMast.VtmName as TrnSgpName" _
'     & ",IgtDpogAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRgPymt" _
'     & " inner join VTypMast on IndrRgPymt.IgtVtmCode = VTypMast.VtmCode" _
'     & " where IgtDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IgtCode>0" _
'     & IIf(mQryEttCode > 0, " and IgtEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IgtVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor on a/c refund
'If chkFByIndrRgRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IgfVtmCode * -1 as TrnSgpCode,VTypMast.VtmName as TrnSgpName" _
'     & ",IgfRfugAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRgRefd" _
'     & " inner join VTypMast on IndrRgRefd.IgfVtmCode = VTypMast.VtmCode" _
'     & " where IgfDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IgfCode>0" _
'     & IIf(mQryEttCode > 0, " and IgfEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IgfVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem ----------------------------------
mQryStr = mQryStr & ")"
mQryStr = mQryStr & " as t1 group by t1.TrnSgpName,t1.TrnSgpCode" _
 & " order by t1.TrnSgpName,t1.TrnSgpCode"

datRecset.open mQryStr, dbComDatabase, adOpenKeyset, adLockReadOnly

End Sub

Private Sub CreateServGrpNServNameSmryList()
Dim mQryStr As String

clsListStru.AddFields mExpr:="TrnSgpName", mTitle:="Service Group Name", mShowItem:=True, mAlign:=1, mWidth:=3000
clsListStru.AddFields mExpr:="TrnSrvName", mTitle:="Service Name", mShowItem:=True, mAlign:=1, mWidth:=3000
clsListStru.AddFields mExpr:="TrnCount", mTitle:="Count", mShowItem:=True, mAlign:=7, mWidth:=1500
clsListStru.AddFields mExpr:="TrnAmtAftDisc_sum", mTitle:="Recd.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
clsListStru.AddFields mExpr:="TrnDiscAmt_sum", mTitle:="Discount", mShowItem:=True, mAlign:=7, mWidth:=1500

mQryStr = "Select " _
 & " t1.TrnSgpName,t1.TrnSgpCode" _
 & ",t1.TrnSrvName,t1.TrnSrvCode" _
 & ",Count(*) as TrnCount" _
 & ",Sum(t1.TrnAmtAftDisc) as TrnAmtAftDisc_sum" _
 & ",Sum(t1.TrnDiscAmt) as TrnDiscAmt_sum"
mQryStr = mQryStr & " from ("
Rem reserved query string producing no records
mQryStr = mQryStr & "Select SrvSgpCode as TrnSgpCode,ServGrpMst.SgpName as TrnSgpName,OrcSrvCode as TrnSrvCode,ServMast.SrvName as TrnSrvName" _
 & ",OrcAmtAftDisc as TrnAmtAftDisc" _
 & ",OrcDiscAmt as TrnDiscAmt" _
 & " from (OutdRcpt" _
 & " inner join OutdHdr on OutdRcpt.OrcCode = OutdHdr.OhrCode)" _
 & " inner join (ServMast inner join ServGrpMst on ServMast.SrvSgpCode = ServGrpMst.SgpCode) on OutdRcpt.OrcSrvCode = ServMast.SrvCode" _
 & " where OrcDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
 & " and OrcCode > 0 and True = False" _
 & IIf(mQryEttCode > 0, " and OrcEttCode = " & CStr(mQryEttCode), "") _
 & IIf(mQrySrvCode > 0, " and OrcSrvCode = " & CStr(mQrySrvCode), "") _
 & IIf(mQrySgpCode > 0, " and SrvSgpCode = " & CStr(mQrySgpCode), "") _
 & IIf(mQryVtmCode > 0, " and OhrVtmCode = " & CStr(mQryVtmCode), "")
Rem outdoor registration
'If chkFByOutdReg.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select SrvSgpCode as TrnSgpCode,ServGrpMst.SgpName as TrnSgpName,OpgSrvCode as TrnSrvCode,ServMast.SrvName as TrnSrvName" _
'     & ",OpgAmtAftDisc as TrnAmtAftDisc" _
'     & ",OpgDiscAmt as TrnDiscAmt" _
'     & " from OutdReg" _
'     & " inner join (ServMast inner join ServGrpMst on ServMast.SrvSgpCode = ServGrpMst.SgpCode) on OutdReg.OpgSrvCode=ServMast.SrvCode" _
'     & " where OpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and OpgCode>0" _
'     & IIf(mQryEttCode > 0, " and OpgEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and OpgSrvCode=" & CStr(mQrySrvCode), "") _
'     & IIf(mQrySgpCode > 0, " and SrvSgpCode=" & CStr(mQrySgpCode), "") _
'     & IIf(mQryVtmCode > 0, " and OpgVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem outdoor receipt received amount
If chkFByOutdRcpt.Value = vbChecked Then
    mQryStr = mQryStr & " UNION ALL "
    mQryStr = mQryStr & " Select SrvSgpCode as TrnSgpCode,ServGrpMst.SgpName as TrnSgpName,OrcSrvCode as TrnSrvCode,ServMast.SrvName as TrnSrvName" _
     & ",OrcRecdAmt as TrnAmtAftDisc" _
     & ",OrcDiscAmt as TrnDiscAmt" _
     & " from (OutdRcpt" _
     & " inner join OutdHdr on OutdRcpt.OrcCode = OutdHdr.OhrCode)" _
     & " inner join (ServMast inner join ServGrpMst on ServMast.SrvSgpCode = ServGrpMst.SgpCode) on OutdRcpt.OrcSrvCode = ServMast.SrvCode" _
     & " where OrcDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & " and OrcCode>0" _
     & IIf(mQryEttCode > 0, " and OrcEttCode=" & CStr(mQryEttCode), "") _
     & IIf(mQrySrvCode > 0, " and OrcSrvCode=" & CStr(mQrySrvCode), "") _
     & IIf(mQrySgpCode > 0, " and SrvSgpCode=" & CStr(mQrySgpCode), "") _
     & IIf(mQryVtmCode > 0, " and OhrVtmCode=" & CStr(mQryVtmCode), "")
End If
Rem outdoor payment
If chkFByOutdPymt.Value = vbChecked Then
    mQryStr = mQryStr & " UNION ALL "
    mQryStr = mQryStr & " Select OphVtmCode * -1 as TrnSgpCode,VTypMast.VtmName as TrnSgpName,OphVtmCode * -2 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
     & ",OphDepoAmt as TrnAmtAftDisc" _
     & ",0 as TrnDiscAmt" _
     & " from OutdPymtHdr" _
     & " inner join VTypMast on OutdPymtHdr.OphVtmCode = VTypMast.VtmCode" _
     & " where OphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & " and OphCode>0" _
     & IIf(mQryEttCode > 0, " and OphEttCode=" & CStr(mQryEttCode), "") _
     & IIf(mQrySrvCode > 0, " and True=False", "") _
     & IIf(mQrySgpCode > 0, " and True=False", "") _
     & IIf(mQryVtmCode > 0, " and OphVtmCode=" & CStr(mQryVtmCode), "")
End If
Rem outdoor refund
If chkFByOutdRefd.Value = vbChecked Then
    mQryStr = mQryStr & " UNION ALL "
    mQryStr = mQryStr & " Select OfhVtmCode * -1 as TrnSgpCode,VTypMast.VtmName as TrnSgpName,OfhVtmCode * -2 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
     & ",OfhRefuAmt * -1 as TrnAmtAftDisc" _
     & ",0 as TrnDiscAmt" _
     & " from OutdRefdHdr" _
     & " inner join VTypMast on OutdRefdHdr.OfhVtmCode = VTypMast.VtmCode" _
     & " where OfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & " and OfhCode>0" _
     & IIf(mQryEttCode > 0, " and OfhEttCode=" & CStr(mQryEttCode), "") _
     & IIf(mQrySrvCode > 0, " and True=False", "") _
     & IIf(mQrySgpCode > 0, " and True=False", "") _
     & IIf(mQryVtmCode > 0, " and OfhVtmCode=" & CStr(mQryVtmCode), "")
End If
Rem outdoor bill payment
'If chkFByOutdBlPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select ObphVtmCode * -1 as TrnSgpCode,VTypMast.VtmName as TrnSgpName,ObphVtmCode * -2 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",ObphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdBlPymtHdr" _
'     & " inner join VTypMast on OutdBlPymtHdr.ObphVtmCode = VTypMast.VtmCode" _
'     & " where ObphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and ObphCode>0" _
'     & IIf(mQryEttCode > 0, " and ObphEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and ObphVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem outdoor bill refund
'If chkFByOutdBlRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select ObfhVtmCode * -1 as TrnSgpCode,VTypMast.VtmName as TrnSgpName,ObfhVtmCode * -2 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",ObfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdBlRefdHdr" _
'     & " inner join VTypMast on OutdBlRefdHdr.ObfhVtmCode = VTypMast.VtmCode" _
'     & " where ObfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and ObfhCode>0" _
'     & IIf(mQryEttCode > 0, " and ObfhEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and ObfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor advance ---------------------
'If chkFByIndrReg.Value = vbChecked = True Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IpgVtmCode * -1 as TrnSgpCode,VTypMast.VtmName as TrnSgpName,IpgVtmCode * -2 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",IpgAdvAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrReg" _
'     & " inner join VTypMast on IndrReg.IpgVtmCode = VTypMast.VtmCode" _
'     & " where IpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IpgCode>0" _
'     & IIf(mQryEttCode > 0, " and IpgEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IpgVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor receipt received amount
'If chkFByIndrRcpt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select SrvSgpCode as TrnSgpCode,ServGrpMst.SgpName as TrnSgpName,IrcSrvCode as TrnSrvCode,ServMast.SrvName as TrnSrvName" _
'     & ",IrcRecdAmt as TrnAmtAftDisc" _
'     & ",IrcDiscAmt as TrnDiscAmt" _
'     & " from (IndrRcpt" _
'     & " inner join IndrHdr on IndrRcpt.IrcCode = IndrHdr.IhrCode)" _
'     & " inner join (ServMast inner join ServGrpMst on ServMast.SrvSgpCode = ServGrpMst.SgpCode) on IndrRcpt.IrcSrvCode=ServMast.SrvCode" _
'     & " where IrcDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IrcCode>0" _
'     & IIf(mQryEttCode > 0, " and IrcEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and IrcSrvCode=" & CStr(mQrySrvCode), "") _
'     & IIf(mQrySgpCode > 0, " and SrvSgpCode=" & CStr(mQrySgpCode), "") _
'     & IIf(mQryVtmCode > 0, " and IhrVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor payment
'If chkFByIndrPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IphVtmCode * -1 as TrnSgpCode,VTypMast.VtmName as TrnSgpName,IphVtmCode * -2 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",IphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrPymtHdr" _
'     & " inner join VTypMast on IndrPymtHdr.IphVtmCode = VTypMast.VtmCode" _
'     & " where IphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IphCode>0" _
'     & IIf(mQryEttCode > 0, " and IphEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IphVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor refund
'If chkFByIndrRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IfhVtmCode * -1 as TrnSgpCode,VTypMast.VtmName as TrnSgpName,IfhVtmCode * -2 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",IfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRefdHdr" _
'     & " inner join VTypMast on IndrRefdHdr.IfhVtmCode = VTypMast.VtmCode" _
'     & " where IfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IfhCode>0" _
'     & IIf(mQryEttCode > 0, " and IfhEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor bill payment
'If chkFByIndrBlPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IbphVtmCode * -1 as TrnSgpCode,VTypMast.VtmName as TrnSgpName,IbphVtmCode * -2 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",IbphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrBlPymtHdr" _
'     & " inner join VTypMast on IndrBlPymtHdr.IbphVtmCode = VTypMast.VtmCode" _
'     & " where IbphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IbphCode>0" _
'     & IIf(mQryEttCode > 0, " and IbphEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IbphVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor bill refund
'If chkFByIndrBlRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IbfhVtmCode * -1 as TrnSgpCode,VTypMast.VtmName as TrnSgpName,IbfhVtmCode * -2 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",IbfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrBlRefdHdr" _
'     & " inner join VTypMast on IndrBlRefdHdr.IbfhVtmCode = VTypMast.VtmCode" _
'     & " where IbfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IbfhCode>0" _
'     & IIf(mQryEttCode > 0, " and IbfhEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IbfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor on a/c payment
'If chkFByIndrRgPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IgtVtmCode * -1 as TrnSgpCode,VTypMast.VtmName as TrnSgpName,IgtVtmCode * -2 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",IgtDpogAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRgPymt" _
'     & " inner join VTypMast on IndrRgPymt.IgtVtmCode = VTypMast.VtmCode" _
'     & " where IgtDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IgtCode>0" _
'     & IIf(mQryEttCode > 0, " and IgtEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IgtVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor on a/c refund
'If chkFByIndrRgRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IgfVtmCode * -1 as TrnSgpCode,VTypMast.VtmName as TrnSgpName,IgfVtmCode * -2 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",IgfRfugAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRgRefd" _
'     & " inner join VTypMast on IndrRgRefd.IgfVtmCode = VTypMast.VtmCode" _
'     & " where IgfDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IgfCode>0" _
'     & IIf(mQryEttCode > 0, " and IgfEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IgfVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem ----------------------------------
mQryStr = mQryStr & ")"
mQryStr = mQryStr & " as t1 group by t1.TrnSgpName,t1.TrnSgpCode,t1.TrnSrvName,t1.TrnSrvCode" _
 & " order by t1.TrnSgpName,t1.TrnSgpCode,t1.TrnSrvName,t1.TrnSrvCode"

datRecset.open mQryStr, dbComDatabase, adOpenKeyset, adLockReadOnly

End Sub

Private Sub CreateVTypeNameSmryList()
Dim mQryStr As String

clsListStru.AddFields mExpr:="TrnVtmName", mTitle:="Voucher Type", mShowItem:=True, mAlign:=1, mWidth:=3000
clsListStru.AddFields mExpr:="TrnCount", mTitle:="Count", mShowItem:=True, mAlign:=7, mWidth:=1500
clsListStru.AddFields mExpr:="TrnAmtAftDisc_sum", mTitle:="Recd.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
clsListStru.AddFields mExpr:="TrnDiscAmt_sum", mTitle:="Discount", mShowItem:=True, mAlign:=7, mWidth:=1500

mQryStr = "Select " _
 & " t1.TrnVtmName,t1.TrnVtmCode" _
 & ",Count(*) as TrnCount" _
 & ",Sum(t1.TrnAmtAftDisc) as TrnAmtAftDisc_sum" _
 & ",Sum(t1.TrnDiscAmt) as TrnDiscAmt_sum"
mQryStr = mQryStr & " from ("
Rem reserved query string producing no records
mQryStr = mQryStr & "Select OhrVtmCode as TrnVtmCode,VTypMast.VtmName as TrnVtmName" _
 & ",OrcAmtAftDisc as TrnAmtAftDisc" _
 & ",OrcDiscAmt as TrnDiscAmt" _
 & " from (OutdRcpt" _
 & " inner join OutdHdr on OutdRcpt.OrcCode = OutdHdr.OhrCode)" _
 & " inner join VTypMast on OutdHdr.OhrVtmCode = VTypMast.VtmCode" _
 & " where OrcDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
 & " and OrcCode > 0 and True = False" _
 & IIf(mQryEttCode > 0, " and OrcEttCode = " & CStr(mQryEttCode), "") _
 & IIf(mQrySrvCode > 0, " and OrcSrvCode = " & CStr(mQrySrvCode), "") _
 & IIf(mQrySgpCode > 0, " and SrvSgpCode = " & CStr(mQrySgpCode), "") _
 & IIf(mQryVtmCode > 0, " and OhrVtmCode = " & CStr(mQryVtmCode), "")
Rem outdoor registration
'If chkFByOutdReg.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select OpgVtmCode as TrnVtmCode,VTypMast.VtmName as TrnVtmName" _
'     & ",OpgAmtAftDisc as TrnAmtAftDisc" _
'     & ",OpgDiscAmt as TrnDiscAmt" _
'     & " from OutdReg" _
'     & " inner join VTypMast on OutdReg.OpgVtmCode = VTypMast.VtmCode" _
'     & " where OpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and OpgCode>0" _
'     & IIf(mQryEttCode > 0, " and OpgEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and OpgSrvCode=" & CStr(mQrySrvCode), "") _
'     & IIf(mQrySgpCode > 0, " and SrvSgpCode=" & CStr(mQrySgpCode), "") _
'     & IIf(mQryVtmCode > 0, " and OpgVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem outdoor receipt received amount
If chkFByOutdRcpt.Value = vbChecked Then
    mQryStr = mQryStr & " UNION ALL "
    mQryStr = mQryStr & " Select OhrVtmCode as TrnVtmCode,VTypMast.VtmName as TrnVtmName" _
     & ",OrcRecdAmt as TrnAmtAftDisc" _
     & ",OrcDiscAmt as TrnDiscAmt" _
     & " from (OutdRcpt" _
     & " inner join OutdHdr on OutdRcpt.OrcCode = OutdHdr.OhrCode)" _
     & " inner join VTypMast on OutdHdr.OhrVtmCode = VTypMast.VtmCode" _
     & " where OrcDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & " and OrcCode>0" _
     & IIf(mQryEttCode > 0, " and OrcEttCode=" & CStr(mQryEttCode), "") _
     & IIf(mQrySrvCode > 0, " and OrcSrvCode=" & CStr(mQrySrvCode), "") _
     & IIf(mQrySgpCode > 0, " and SrvSgpCode=" & CStr(mQrySgpCode), "") _
     & IIf(mQryVtmCode > 0, " and OhrVtmCode=" & CStr(mQryVtmCode), "")
End If
Rem outdoor payment
If chkFByOutdPymt.Value = vbChecked Then
    mQryStr = mQryStr & " UNION ALL "
    mQryStr = mQryStr & " Select OphVtmCode as TrnVtmCode,VTypMast.VtmName as TrnVtmName" _
     & ",OphDepoAmt as TrnAmtAftDisc" _
     & ",0 as TrnDiscAmt" _
     & " from OutdPymtHdr" _
     & " inner join VTypMast on OutdPymtHdr.OphVtmCode = VTypMast.VtmCode" _
     & " where OphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & " and OphCode>0" _
     & IIf(mQryEttCode > 0, " and OphEttCode=" & CStr(mQryEttCode), "") _
     & IIf(mQrySrvCode > 0, " and True=False", "") _
     & IIf(mQrySgpCode > 0, " and True=False", "") _
     & IIf(mQryVtmCode > 0, " and OphVtmCode=" & CStr(mQryVtmCode), "")
End If
Rem outdoor refund
If chkFByOutdRefd.Value = vbChecked Then
    mQryStr = mQryStr & " UNION ALL "
    mQryStr = mQryStr & " Select OfhVtmCode as TrnVtmCode,VTypMast.VtmName as TrnVtmName" _
     & ",OfhRefuAmt * -1 as TrnAmtAftDisc" _
     & ",0 as TrnDiscAmt" _
     & " from OutdRefdHdr" _
     & " inner join VTypMast on OutdRefdHdr.OfhVtmCode = VTypMast.VtmCode" _
     & " where OfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & " and OfhCode>0" _
     & IIf(mQryEttCode > 0, " and OfhEttCode=" & CStr(mQryEttCode), "") _
     & IIf(mQrySrvCode > 0, " and True=False", "") _
     & IIf(mQrySgpCode > 0, " and True=False", "") _
     & IIf(mQryVtmCode > 0, " and OfhVtmCode=" & CStr(mQryVtmCode), "")
End If
Rem outdoor bill payment
'If chkFByOutdBlPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select ObphVtmCode as TrnVtmCode,VTypMast.VtmName as TrnVtmName" _
'     & ",ObphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdBlPymtHdr" _
'     & " inner join VTypMast on OutdBlPymtHdr.ObphVtmCode = VTypMast.VtmCode" _
'     & " where ObphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and ObphCode>0" _
'     & IIf(mQryEttCode > 0, " and ObphEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and ObphVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem outdoor bill refund
'If chkFByOutdBlRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select ObfhVtmCode as TrnVtmCode,VTypMast.VtmName as TrnVtmName" _
'     & ",ObfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdBlRefdHdr" _
'     & " inner join VTypMast on OutdBlRefdHdr.ObfhVtmCode = VTypMast.VtmCode" _
'     & " where ObfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and ObfhCode>0" _
'     & IIf(mQryEttCode > 0, " and ObfhEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and ObfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor advance ---------------------
'If chkFByIndrReg.Value = vbChecked = True Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IpgVtmCode as TrnVtmCode,VTypMast.VtmName as TrnVtmName" _
'     & ",IpgAdvAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrReg" _
'     & " inner join VTypMast on IndrReg.IpgVtmCode = VTypMast.VtmCode" _
'     & " where IpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IpgCode>0" _
'     & IIf(mQryEttCode > 0, " and IpgEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IpgVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor receipt received amount
'If chkFByIndrRcpt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IhrVtmCode as TrnVtmCode,VTypMast.VtmName as TrnVtmName" _
'     & ",IrcRecdAmt as TrnAmtAftDisc" _
'     & ",IrcDiscAmt as TrnDiscAmt" _
'     & " from (IndrRcpt" _
'     & " inner join IndrHdr on IndrRcpt.IrcCode = IndrHdr.IhrCode)" _
'     & " inner join VTypMast on IndrHdr.IhrVtmCode = VTypMast.VtmCode" _
'     & " where IrcDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IrcCode>0" _
'     & IIf(mQryEttCode > 0, " and IrcEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and IrcSrvCode=" & CStr(mQrySrvCode), "") _
'     & IIf(mQrySgpCode > 0, " and SrvSgpCode=" & CStr(mQrySgpCode), "") _
'     & IIf(mQryVtmCode > 0, " and IhrVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor payment
'If chkFByIndrPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IphVtmCode as TrnVtmCode,VTypMast.VtmName as TrnVtmName" _
'     & ",IphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrPymtHdr" _
'     & " inner join VTypMast on IndrPymtHdr.IphVtmCode = VTypMast.VtmCode" _
'     & " where IphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IphCode>0" _
'     & IIf(mQryEttCode > 0, " and IphEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IphVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor refund
'If chkFByIndrRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IfhVtmCode as TrnVtmCode,VTypMast.VtmName as TrnVtmName" _
'     & ",IfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRefdHdr" _
'     & " inner join VTypMast on IndrRefdHdr.IfhVtmCode = VTypMast.VtmCode" _
'     & " where IfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IfhCode>0" _
'     & IIf(mQryEttCode > 0, " and IfhEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor bill payment
'If chkFByIndrBlPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IbphVtmCode as TrnVtmCode,VTypMast.VtmName as TrnVtmName" _
'     & ",IbphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrBlPymtHdr" _
'     & " inner join VTypMast on IndrBlPymtHdr.IbphVtmCode = VTypMast.VtmCode" _
'     & " where IbphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IbphCode>0" _
'     & IIf(mQryEttCode > 0, " and IbphEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IbphVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor bill refund
'If chkFByIndrBlRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IbfhVtmCode as TrnVtmCode,VTypMast.VtmName as TrnVtmName" _
'     & ",IbfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrBlRefdHdr" _
'     & " inner join VTypMast on IndrBlRefdHdr.IbfhVtmCode = VTypMast.VtmCode" _
'     & " where IbfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IbfhCode > 0" _
'     & IIf(mQryEttCode > 0, " and IbfhEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IbfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor on a/c payment
'If chkFByIndrRgPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IgtVtmCode as TrnVtmCode,VTypMast.VtmName as TrnVtmName" _
'     & ",IgtDpogAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRgPymt" _
'     & " inner join VTypMast on IndrRgPymt.IgtVtmCode = VTypMast.VtmCode" _
'     & " where IgtDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IgtCode>0" _
'     & IIf(mQryEttCode > 0, " and IgtEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IgtVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor on a/c refund
'If chkFByIndrRgRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IgfVtmCode as TrnVtmCode,VTypMast.VtmName as TrnVtmName" _
'     & ",IgfRfugAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRgRefd" _
'     & " inner join VTypMast on IndrRgRefd.IgfVtmCode = VTypMast.VtmCode" _
'     & " where IgfDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IgfCode>0" _
'     & IIf(mQryEttCode > 0, " and IgfEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IgfVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem ----------------------------------
mQryStr = mQryStr & ")"
mQryStr = mQryStr & " as t1 group by t1.TrnVtmName,t1.TrnVtmCode" _
 & " order by t1.TrnVtmName,t1.TrnVtmCode"

datRecset.open mQryStr, dbComDatabase, adOpenKeyset, adLockReadOnly

End Sub

Private Sub CreateDetailedSrmyList()
Dim mQryStr As String

clsListStru.AddFields mExpr:="tTrnSmryId", mAttrib:=cFAT_SYSTEM
clsListStru.AddFields mExpr:="TrnType", mAttrib:=cFAT_SYSTEM
clsListStru.AddFields mExpr:="VtmSysCode", mAttrib:=cFAT_SYSTEM
clsListStru.AddFields mExpr:="TrnCode", mAttrib:=cFAT_SYSTEM
clsListStru.AddFields mExpr:="VtmName", mTitle:="Voucher", mAlign:=1, mWidth:=2250, mShowItem:=True
clsListStru.AddFields mExpr:="TrnVchNo", mTitle:="Vchr.No", mAlign:=7, mWidth:=1250, mShowItem:=True
clsListStru.AddFields mExpr:="TrnDate", mTitle:="Date", mAlign:=1, mWidth:=1300, mShowItem:=True
' --------------------------------------
clsListStru.AddFields mExpr:="EttCode", mAttrib:=cFAT_SYSTEM
clsListStru.AddFields mExpr:="EttName", mTitle:="Patient Name", mAlign:=1, mWidth:=2500, mShowItem:=True
clsListStru.AddFields mExpr:="EttRegNo", mTitle:="Reg.No", mAlign:=7, mWidth:=1250, mShowItem:=True
' --------------------------------------
clsListStru.AddFields mExpr:="TrnAmtAftDisc", mTitle:="Recd.Amt", mAlign:=7, mWidth:=1250, mShowItem:=True
clsListStru.AddFields mExpr:="TrnDiscAmt", mTitle:="Discount", mAlign:=7, mWidth:=1250, mShowItem:=True
' --------------------------------------
clsListStru.AddFields mExpr:="EttRefName", mTitle:="Care of", mAlign:=1, mWidth:=2000, mShowItem:=True
clsListStru.AddFields mExpr:="EttAddr", mTitle:="Address", mAlign:=1, mWidth:=2000, mShowItem:=True
clsListStru.AddFields mExpr:="EttAraName", mTitle:="Area", mAlign:=1, mWidth:=1500, mShowItem:=True
clsListStru.AddFields mExpr:="EttStnName", mTitle:="Station", mAlign:=1, mWidth:=1500, mShowItem:=True
clsListStru.AddFields mExpr:="EttEtgName", mTitle:="Category", mAlign:=1, mWidth:=2000, mShowItem:=True

mQryStr = "Select *" _
 & ",format(TrnDate,'yyyymmdd')+format(TrnVtmCode,'" & cLONGCODESTRFMT & "')+format(TrnCode,'" & CStr(cLONGCODESTRFMT) & "') as tTrnSmryId"
mQryStr = mQryStr & " from (("
Rem reserved query string producing no records
mQryStr = mQryStr & "Select " _
 & "'Orc' as TrnType" _
 & ",OrcCode as TrnCode" _
 & ",OrcDate as TrnDate" _
 & ",OrcEttCode as TrnEttCode" _
 & ",OhrVtmCode as TrnVtmCode" _
 & ",OhrVchNo as TrnVchNo" _
 & ",OrcAmtAftDisc as TrnAmtAftDisc" _
 & ",OrcDiscAmt as TrnDiscAmt" _
 & " from (OutdRcpt" _
 & " inner join OutdHdr on OutdRcpt.OrcCode = OutdHdr.OhrCode)" _
 & " inner join ServMast on OutdRcpt.OrcSrvCode = ServMast.SrvCode" _
 & " where OrcDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
 & " and OrcCode > 0 and True = False" _
 & IIf(mQryEttCode > 0, " and OrcEttCode = " & CStr(mQryEttCode), "") _
 & IIf(mQrySrvCode > 0, " and OrcSrvCode = " & CStr(mQrySrvCode), "") _
 & IIf(mQrySgpCode > 0, " and SrvSgpCode = " & CStr(mQrySgpCode), "") _
 & IIf(mQryVtmCode > 0, " and OhrVtmCode = " & CStr(mQryVtmCode), "")
Rem outdoor registration
'If chkFByOutdReg.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select " _
'     & "'Opg' as TrnType" _
'     & ",OpgCode as TrnCode" _
'     & ",OpgDate as TrnDate" _
'     & ",OpgEttCode as TrnEttCode" _
'     & ",OpgVtmCode as TrnVtmCode" _
'     & ",OpgVchNo as TrnVchNo" _
'     & ",OpgAmtAftDisc as TrnAmtAftDisc" _
'     & ",OpgDiscAmt as TrnDiscAmt" _
'     & " from OutdReg" _
'     & " inner join ServMast on OutdReg.OpgSrvCode = ServMast.SrvCode" _
'     & " where OpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and OpgCode>0" _
'     & IIf(mQryEttCode > 0, " and OpgEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and OpgSrvCode=" & CStr(mQrySrvCode), "") _
'     & IIf(mQrySgpCode > 0, " and SrvSgpCode=" & CStr(mQrySgpCode), "") _
'     & IIf(mQryVtmCode > 0, " and OpgVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem outdoor receipt received amount
If chkFByOutdRcpt.Value = vbChecked Then
    mQryStr = mQryStr & " UNION ALL "
    mQryStr = mQryStr & " Select " _
     & "'Orc' as TrnType" _
     & ",OhrCode as TrnCode" _
     & ",OhrDate as TrnDate" _
     & ",OhrEttCode as TrnEttCode" _
     & ",OhrVtmCode as TrnVtmCode" _
     & ",OhrVchNo as TrnVchNo" _
     & ",OhrRecdAmt as TrnAmtAftDisc" _
     & ",OhrDiscAmt as TrnDiscAmt" _
     & " from OutdHdr" _
     & " where OhrDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & " and OhrCode > 0" _
     & IIf(mQryEttCode > 0, " and OhrEttCode = " & CStr(mQryEttCode), "") _
     & IIf(mQrySrvCode > 0, " and True=False", "") _
     & IIf(mQrySgpCode > 0, " and True=False", "") _
     & IIf(mQryVtmCode > 0, " and OhrVtmCode = " & CStr(mQryVtmCode), "")
End If
Rem outdoor payment
If chkFByOutdPymt.Value = vbChecked Then
    mQryStr = mQryStr & " UNION ALL "
    mQryStr = mQryStr & " Select " _
     & "'Oph' as TrnType" _
     & ",OphCode as TrnCode" _
     & ",OphDate as TrnDate" _
     & ",OphEttCode as TrnEttCode" _
     & ",OphVtmCode as TrnVtmCode" _
     & ",OphVchNo as TrnVchNo" _
     & ",OphDepoAmt as TrnAmtAftDisc" _
     & ",0 as TrnDiscAmt" _
     & " from OutdPymtHdr" _
     & " where OphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & " and OphCode > 0" _
     & IIf(mQryEttCode > 0, " and OphEttCode=" & CStr(mQryEttCode), "") _
     & IIf(mQrySrvCode > 0, " and True=False", "") _
     & IIf(mQrySgpCode > 0, " and True=False", "") _
     & IIf(mQryVtmCode > 0, " and OphVtmCode=" & CStr(mQryVtmCode), "")
End If
Rem outdoor refund
If chkFByOutdRefd.Value = vbChecked Then
    mQryStr = mQryStr & " UNION ALL "
    mQryStr = mQryStr & " Select " _
     & "'Ofh' as TrnType" _
     & ",OfhCode as TrnCode" _
     & ",OfhDate as TrnDate" _
     & ",OfhEttCode as TrnEttCode" _
     & ",OfhVtmCode as TrnVtmCode" _
     & ",OfhVchNo as TrnVchNo" _
     & ",OfhRefuAmt * -1 as TrnAmtAftDisc" _
     & ",0 as TrnDiscAmt" _
     & " from OutdRefdHdr" _
     & " where OfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & " and OfhCode > 0" _
     & IIf(mQryEttCode > 0, " and OfhEttCode=" & CStr(mQryEttCode), "") _
     & IIf(mQrySrvCode > 0, " and True=False", "") _
     & IIf(mQrySgpCode > 0, " and True=False", "") _
     & IIf(mQryVtmCode > 0, " and OfhVtmCode=" & CStr(mQryVtmCode), "")
End If
Rem outdoor bill payment
'If chkFByOutdBlPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select " _
'     & "'Obph' as TrnType" _
'     & ",ObphCode as TrnCode" _
'     & ",ObphDate as TrnDate" _
'     & ",ObphEttCode as TrnEttCode" _
'     & ",ObphVtmCode as TrnVtmCode" _
'     & ",ObphVchNo as TrnVchNo" _
'     & ",ObphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdBlPymtHdr" _
'     & " where ObphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and ObphCode > 0" _
'     & IIf(mQryEttCode > 0, " and ObphEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and ObphVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem outdoor bill refund
'If chkFByOutdBlRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select " _
'     & "'Obfh' as TrnType" _
'     & ",ObfhCode as TrnCode" _
'     & ",ObfhDate as TrnDate" _
'     & ",ObfhEttCode as TrnEttCode" _
'     & ",ObfhVtmCode as TrnVtmCode" _
'     & ",ObfhVchNo as TrnVchNo" _
'     & ",ObfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdBlRefdHdr" _
'     & " where ObfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and ObfhCode > 0" _
'     & IIf(mQryEttCode > 0, " and ObfhEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and ObfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor advance ---------------------
'If chkFByIndrReg.Value = vbChecked = True Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select " _
'     & "'Ipg' as TrnType" _
'     & ",IpgCode as TrnCode" _
'     & ",IpgDate as TrnDate" _
'     & ",IpgEttCode as TrnEttCode" _
'     & ",IpgVtmCode as TrnVtmCode" _
'     & ",IpgVchNo as TrnVchNo" _
'     & ",IpgAdvAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrReg" _
'     & " where IpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IpgCode > 0 and IpgAdvAmt > 0" _
'     & IIf(mQryEttCode > 0, " and IpgEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IpgVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor receipt received amount
'If chkFByIndrRcpt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select " _
'     & "'Irc' as TrnType" _
'     & ",IhrCode as TrnCode" _
'     & ",IhrDate as TrnDate" _
'     & ",IhrEttCode as TrnEttCode" _
'     & ",IhrVtmCode as TrnVtmCode" _
'     & ",IhrVchNo as TrnVchNo" _
'     & ",IhrRecdAmt as TrnAmtAftDisc" _
'     & ",IhrDiscAmt as TrnDiscAmt" _
'     & " from IndrHdr" _
'     & " where IhrDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IhrCode > 0" _
'     & IIf(mQryEttCode > 0, " and IhrEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IhrVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor payment
'If chkFByIndrPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select " _
'     & "'Iph' as TrnType" _
'     & ",IphCode as TrnCode" _
'     & ",IphDate as TrnDate" _
'     & ",IphEttCode as TrnEttCode" _
'     & ",IphVtmCode as TrnVtmCode" _
'     & ",IphVchNo as TrnVchNo" _
'     & ",IphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrPymtHdr" _
'     & " where IphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IphCode > 0" _
'     & IIf(mQryEttCode > 0, " and IphEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IphVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor refund
'If chkFByIndrRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select " _
'     & "'Ifh' as TrnType" _
'     & ",IfhCode as TrnCode" _
'     & ",IfhDate as TrnDate" _
'     & ",IfhEttCode as TrnEttCode" _
'     & ",IfhVtmCode as TrnVtmCode" _
'     & ",IfhVchNo as TrnVchNo" _
'     & ",IfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRefdHdr" _
'     & " where IfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IfhCode > 0" _
'     & IIf(mQryEttCode > 0, " and IfhEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor bill payment
'If chkFByIndrBlPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select " _
'     & "'Ibph' as TrnType" _
'     & ",IbphCode as TrnCode" _
'     & ",IbphDate as TrnDate" _
'     & ",IbphEttCode as TrnEttCode" _
'     & ",IbphVtmCode as TrnVtmCode" _
'     & ",IbphVchNo as TrnVchNo" _
'     & ",IbphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrBlPymtHdr" _
'     & " where IbphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IbphCode > 0" _
'     & IIf(mQryEttCode > 0, " and IbphEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IbphVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor bill refund
'If chkFByIndrBlRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select " _
'     & "'Ibfh' as TrnType" _
'     & ",IbfhCode as TrnCode" _
'     & ",IbfhDate as TrnDate" _
'     & ",IbfhEttCode as TrnEttCode" _
'     & ",IbfhVtmCode as TrnVtmCode" _
'     & ",IbfhVchNo as TrnVchNo" _
'     & ",IbfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrBlRefdHdr" _
'     & " where IbfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IbfhCode > 0" _
'     & IIf(mQryEttCode > 0, " and IbfhEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IbfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor on a/c payment
'If chkFByIndrRgPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select " _
'     & "'Igt' as TrnType" _
'     & ",IgtCode as TrnCode" _
'     & ",IgtDate as TrnDate" _
'     & ",IgtEttCode as TrnEttCode" _
'     & ",IgtVtmCode as TrnVtmCode" _
'     & ",IgtVchNo as TrnVchNo" _
'     & ",IgtDpogAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRgPymt" _
'     & " where IgtDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IgtCode > 0" _
'     & IIf(mQryEttCode > 0, " and IgtEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IgtVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor on a/c refund
'If chkFByIndrRgRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select " _
'     & "'Igf' as TrnType" _
'     & ",IgfCode as TrnCode" _
'     & ",IgfDate as TrnDate" _
'     & ",IgfEttCode as TrnEttCode" _
'     & ",IgfVtmCode as TrnVtmCode" _
'     & ",IgfVchNo as TrnVchNo" _
'     & ",IgfRfugAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRgRefd" _
'     & " where IgfDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IgfCode > 0" _
'     & IIf(mQryEttCode > 0, " and IgfEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IgfVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem ----------------------------------
mQryStr = mQryStr & ") as t1"
mQryStr = mQryStr & " inner join EntityMast on t1.TrnEttCode = EntityMast.EttCode)" _
 & " inner join VTypMast on t1.TrnVtmCode = VTypMast.VtmCode" _
 & " order by t1.TrnDate,t1.TrnVtmCode,t1.TrnCode"

datRecset.open mQryStr, dbComDatabase, adOpenKeyset, adLockReadOnly

End Sub

Private Sub CreateExpandedSrmyList()
Dim mQryStr As String

clsListStru.AddFields mExpr:="tTrnSmryId", mAttrib:=cFAT_SYSTEM
clsListStru.AddFields mExpr:="TrnType", mAttrib:=cFAT_SYSTEM
clsListStru.AddFields mExpr:="VtmSysCode", mAttrib:=cFAT_SYSTEM
clsListStru.AddFields mExpr:="TrnCode", mAttrib:=cFAT_SYSTEM
clsListStru.AddFields mExpr:="VtmName", mTitle:="Voucher", mAlign:=1, mWidth:=2250, mShowItem:=True
clsListStru.AddFields mExpr:="TrnVchNo", mTitle:="Vchr.No", mAlign:=7, mWidth:=1250, mShowItem:=True
clsListStru.AddFields mExpr:="TrnDate", mTitle:="Date", mAlign:=1, mWidth:=1300, mShowItem:=True
' --------------------------------------
clsListStru.AddFields mExpr:="EttCode", mAttrib:=cFAT_SYSTEM
clsListStru.AddFields mExpr:="EttName", mTitle:="Patient Name", mAlign:=1, mWidth:=2500, mShowItem:=True
clsListStru.AddFields mExpr:="EttRegNo", mTitle:="Reg.No", mAlign:=7, mWidth:=1250, mShowItem:=True
' --------------------------------------
clsListStru.AddFields mExpr:="TrnSrvName", mTitle:="Service Name", mAlign:=1, mWidth:=2500, mShowItem:=True
' --------------------------------------
clsListStru.AddFields mExpr:="TrnAmtAftDisc", mTitle:="Recd.Amt", mAlign:=7, mWidth:=1250, mShowItem:=True
clsListStru.AddFields mExpr:="TrnDiscAmt", mTitle:="Discount", mAlign:=7, mWidth:=1250, mShowItem:=True
' --------------------------------------
clsListStru.AddFields mExpr:="EttRefName", mTitle:="Care of", mAlign:=1, mWidth:=2000, mShowItem:=True
clsListStru.AddFields mExpr:="EttAddr", mTitle:="Address", mAlign:=1, mWidth:=2000, mShowItem:=True
clsListStru.AddFields mExpr:="EttAraName", mTitle:="Area", mAlign:=1, mWidth:=1500, mShowItem:=True
clsListStru.AddFields mExpr:="EttStnName", mTitle:="Station", mAlign:=1, mWidth:=1500, mShowItem:=True
clsListStru.AddFields mExpr:="EttEtgName", mTitle:="Category", mAlign:=1, mWidth:=2000, mShowItem:=True

mQryStr = "Select *" _
 & ",format(TrnDate,'yyyymmdd')+format(TrnVtmCode,'" & cLONGCODESTRFMT & "')+format(TrnCode,'" & CStr(cLONGCODESTRFMT) & "') as tTrnSmryId"
mQryStr = mQryStr & " from (("
Rem reserved query string producing no records
mQryStr = mQryStr & "Select " _
 & "'Orc' as TrnType" _
 & ",OrcCode as TrnCode" _
 & ",OrcDate as TrnDate" _
 & ",OrcSrvCode as TrnSrvCode,ServMast.SrvName as TrnSrvName" _
 & ",OrcEttCode as TrnEttCode" _
 & ",OhrVtmCode as TrnVtmCode" _
 & ",OhrVchNo as TrnVchNo" _
 & ",OrcAmtAftDisc as TrnAmtAftDisc" _
 & ",OrcDiscAmt as TrnDiscAmt" _
 & " from (OutdRcpt" _
 & " inner join OutdHdr on OutdRcpt.OrcCode = OutdHdr.OhrCode)" _
 & " inner join ServMast on OutdRcpt.OrcSrvCode = ServMast.SrvCode" _
 & " where OrcDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
 & " and OrcCode > 0 and True = False" _
 & IIf(mQryEttCode > 0, " and OrcEttCode = " & CStr(mQryEttCode), "") _
 & IIf(mQrySrvCode > 0, " and OrcSrvCode = " & CStr(mQrySrvCode), "") _
 & IIf(mQrySgpCode > 0, " and SrvSgpCode = " & CStr(mQrySgpCode), "") _
 & IIf(mQryVtmCode > 0, " and OhrVtmCode = " & CStr(mQryVtmCode), "")
Rem outdoor registration
'If chkFByOutdReg.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select " _
'     & "'Opg' as TrnType" _
'     & ",OpgCode as TrnCode" _
'     & ",OpgDate as TrnDate" _
'     & ",OpgSrvCode as TrnSrvCode,ServMast.SrvName as TrnSrvName" _
'     & ",OpgEttCode as TrnEttCode" _
'     & ",OpgVtmCode as TrnVtmCode" _
'     & ",OpgVchNo as TrnVchNo" _
'     & ",OpgAmtAftDisc as TrnAmtAftDisc" _
'     & ",OpgDiscAmt as TrnDiscAmt" _
'     & " from OutdReg" _
'     & " inner join ServMast on OutdReg.OpgSrvCode=ServMast.SrvCode" _
'     & " where OpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and OpgCode>0" _
'     & IIf(mQryEttCode > 0, " and OpgEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and OpgSrvCode=" & CStr(mQrySrvCode), "") _
'     & IIf(mQrySgpCode > 0, " and SrvSgpCode=" & CStr(mQrySgpCode), "") _
'     & IIf(mQryVtmCode > 0, " and OpgVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem outdoor receipt received amount
If chkFByOutdRcpt.Value = vbChecked Then
    mQryStr = mQryStr & " UNION ALL "
    mQryStr = mQryStr & " Select " _
     & "'Orc' as TrnType" _
     & ",OrcICode as TrnCode" _
     & ",OrcDate as TrnDate" _
     & ",OrcSrvCode as TrnSrvCode,ServMast.SrvName as TrnSrvName" _
     & ",OrcEttCode as TrnEttCode" _
     & ",OhrVtmCode as TrnVtmCode" _
     & ",OhrVchNo as TrnVchNo" _
     & ",OrcRecdAmt as TrnAmtAftDisc" _
     & ",OrcDiscAmt as TrnDiscAmt" _
     & " from (OutdRcpt" _
     & " inner join OutdHdr on OutdRcpt.OrcCode=OutdHdr.OhrCode)" _
     & " inner join ServMast on OutdRcpt.OrcSrvCode=ServMast.SrvCode" _
     & " where OrcDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & " and OrcCode>0" _
     & IIf(mQryEttCode > 0, " and OrcEttCode=" & CStr(mQryEttCode), "") _
     & IIf(mQrySrvCode > 0, " and OrcSrvCode=" & CStr(mQrySrvCode), "") _
     & IIf(mQrySgpCode > 0, " and SrvSgpCode=" & CStr(mQrySgpCode), "") _
     & IIf(mQryVtmCode > 0, " and OhrVtmCode=" & CStr(mQryVtmCode), "")
End If
Rem outdoor payment
If chkFByOutdPymt.Value = vbChecked Then
    mQryStr = mQryStr & " UNION ALL "
    mQryStr = mQryStr & " Select " _
     & "'Oph' as TrnType" _
     & ",OphCode as TrnCode" _
     & ",OphDate as TrnDate" _
     & ",OphVtmCode * -1 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
     & ",OphEttCode as TrnEttCode" _
     & ",OphVtmCode as TrnVtmCode" _
     & ",OphVchNo as TrnVchNo" _
     & ",OphDepoAmt as TrnAmtAftDisc" _
     & ",0 as TrnDiscAmt" _
     & " from OutdPymtHdr" _
     & " inner join VTypMast on OutdPymtHdr.OphVtmCode = VTypMast.VtmCode" _
     & " where OphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & " and OphCode>0" _
     & IIf(mQryEttCode > 0, " and OphEttCode=" & CStr(mQryEttCode), "") _
     & IIf(mQrySrvCode > 0, " and True=False", "") _
     & IIf(mQrySgpCode > 0, " and True=False", "") _
     & IIf(mQryVtmCode > 0, " and OphVtmCode=" & CStr(mQryVtmCode), "")
     Rem & ",-111 as TrnSrvCode,'Outdoor Rcpt Payment' as TrnSrvName"
End If
Rem outdoor refund
If chkFByOutdRefd.Value = vbChecked Then
    mQryStr = mQryStr & " UNION ALL "
    mQryStr = mQryStr & " Select " _
     & "'Ofh' as TrnType" _
     & ",OfhCode as TrnCode" _
     & ",OfhDate as TrnDate" _
     & ",OfhVtmCode * -1 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
     & ",OfhEttCode as TrnEttCode" _
     & ",OfhVtmCode as TrnVtmCode" _
     & ",OfhVchNo as TrnVchNo" _
     & ",OfhRefuAmt * -1 as TrnAmtAftDisc" _
     & ",0 as TrnDiscAmt" _
     & " from OutdRefdHdr" _
     & " inner join VTypMast on OutdRefdHdr.OfhVtmCode = VTypMast.VtmCode" _
     & " where OfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & " and OfhCode>0" _
     & IIf(mQryEttCode > 0, " and OfhEttCode=" & CStr(mQryEttCode), "") _
     & IIf(mQrySrvCode > 0, " and True=False", "") _
     & IIf(mQrySgpCode > 0, " and True=False", "") _
     & IIf(mQryVtmCode > 0, " and OfhVtmCode=" & CStr(mQryVtmCode), "")
End If
Rem outdoor bill payment
'If chkFByOutdBlPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select " _
'     & "'Obph' as TrnType" _
'     & ",ObphCode as TrnCode" _
'     & ",ObphDate as TrnDate" _
'     & ",ObphVtmCode * -1 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",ObphEttCode as TrnEttCode" _
'     & ",ObphVtmCode as TrnVtmCode" _
'     & ",ObphVchNo as TrnVchNo" _
'     & ",ObphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdBlPymtHdr" _
'     & " inner join VTypMast on OutdBlPymtHdr.ObphVtmCode = VTypMast.VtmCode" _
'     & " where ObphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and ObphCode>0" _
'     & IIf(mQryEttCode > 0, " and ObphEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and ObphVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem outdoor bill refund
'If chkFByOutdBlRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select " _
'     & "'Obfh' as TrnType" _
'     & ",ObfhCode as TrnCode" _
'     & ",ObfhDate as TrnDate" _
'     & ",ObfhVtmCode * -1 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",ObfhEttCode as TrnEttCode" _
'     & ",ObfhVtmCode as TrnVtmCode" _
'     & ",ObfhVchNo as TrnVchNo" _
'     & ",ObfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdBlRefdHdr" _
'     & " inner join VTypMast on OutdBlRefdHdr.ObfhVtmCode = VTypMast.VtmCode" _
'     & " where ObfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and ObfhCode>0" _
'     & IIf(mQryEttCode > 0, " and ObfhEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and ObfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor advance ---------------------
'If chkFByIndrReg.Value = vbChecked = True Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select " _
'     & "'Ipg' as TrnType" _
'     & ",IpgCode as TrnCode" _
'     & ",IpgDate as TrnDate" _
'     & ",IpgVtmCode * -1 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",IpgEttCode as TrnEttCode" _
'     & ",IpgVtmCode as TrnVtmCode" _
'     & ",IpgVchNo as TrnVchNo" _
'     & ",IpgAdvAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrReg" _
'     & " inner join VTypMast on IndrReg.IpgVtmCode = VTypMast.VtmCode" _
'     & " where IpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IpgCode>0" _
'     & IIf(mQryEttCode > 0, " and IpgEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IpgVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor receipt received amount
'If chkFByIndrRcpt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select " _
'     & "'Irc' as TrnType" _
'     & ",IrcICode as TrnCode" _
'     & ",IrcDate as TrnDate" _
'     & ",IrcSrvCode as TrnSrvCode,ServMast.SrvName as TrnSrvName" _
'     & ",IrcEttCode as TrnEttCode" _
'     & ",IhrVtmCode as TrnVtmCode" _
'     & ",IhrVchNo as TrnVchNo" _
'     & ",IrcRecdAmt as TrnAmtAftDisc" _
'     & ",IrcDiscAmt as TrnDiscAmt" _
'     & " from (IndrRcpt" _
'     & " inner join IndrHdr on IndrRcpt.IrcCode=IndrHdr.IhrCode)" _
'     & " inner join ServMast on IndrRcpt.IrcSrvCode=ServMast.SrvCode" _
'     & " where IrcDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IrcCode>0" _
'     & IIf(mQryEttCode > 0, " and IrcEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and IrcSrvCode=" & CStr(mQrySrvCode), "") _
'     & IIf(mQrySgpCode > 0, " and SrvSgpCode=" & CStr(mQrySgpCode), "") _
'     & IIf(mQryVtmCode > 0, " and IhrVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor payment
'If chkFByIndrPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select " _
'     & "'Iph' as TrnType" _
'     & ",IphCode as TrnCode" _
'     & ",IphDate as TrnDate" _
'     & ",IphVtmCode * -1 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",IphEttCode as TrnEttCode" _
'     & ",IphVtmCode as TrnVtmCode" _
'     & ",IphVchNo as TrnVchNo" _
'     & ",IphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrPymtHdr" _
'     & " inner join VTypMast on IndrPymtHdr.IphVtmCode = VTypMast.VtmCode" _
'     & " where IphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IphCode>0" _
'     & IIf(mQryEttCode > 0, " and IphEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IphVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor refund
'If chkFByIndrRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select " _
'     & "'Ifh' as TrnType" _
'     & ",IfhCode as TrnCode" _
'     & ",IfhDate as TrnDate" _
'     & ",IfhVtmCode * -1 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",IfhEttCode as TrnEttCode" _
'     & ",IfhVtmCode as TrnVtmCode" _
'     & ",IfhVchNo as TrnVchNo" _
'     & ",IfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRefdHdr" _
'     & " inner join VTypMast on IndrRefdHdr.IfhVtmCode = VTypMast.VtmCode" _
'     & " where IfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IfhCode>0" _
'     & IIf(mQryEttCode > 0, " and IfhEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor bill payment
'If chkFByIndrBlPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select " _
'     & "'Ibph' as TrnType" _
'     & ",IbphCode as TrnCode" _
'     & ",IbphDate as TrnDate" _
'     & ",IbphVtmCode * -1 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",IbphEttCode as TrnEttCode" _
'     & ",IbphVtmCode as TrnVtmCode" _
'     & ",IbphVchNo as TrnVchNo" _
'     & ",IbphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrBlPymtHdr" _
'     & " inner join VTypMast on IndrBlPymtHdr.IbphVtmCode = VTypMast.VtmCode" _
'     & " where IbphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IbphCode>0" _
'     & IIf(mQryEttCode > 0, " and IbphEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IbphVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor bill refund
'If chkFByIndrBlRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select " _
'     & "'Ibfh' as TrnType" _
'     & ",IbfhCode as TrnCode" _
'     & ",IbfhDate as TrnDate" _
'     & ",IbfhVtmCode * -1 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",IbfhEttCode as TrnEttCode" _
'     & ",IbfhVtmCode as TrnVtmCode" _
'     & ",IbfhVchNo as TrnVchNo" _
'     & ",IbfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrBlRefdHdr" _
'     & " inner join VTypMast on IndrBlRefdHdr.IbfhVtmCode = VTypMast.VtmCode" _
'     & " where IbfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IbfhCode>0" _
'     & IIf(mQryEttCode > 0, " and IbfhEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IbfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor on a/c payment
'If chkFByIndrRgPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select " _
'     & "'Igt' as TrnType" _
'     & ",IgtCode as TrnCode" _
'     & ",IgtDate as TrnDate" _
'     & ",IgtVtmCode * -1 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",IgtEttCode as TrnEttCode" _
'     & ",IgtVtmCode as TrnVtmCode" _
'     & ",IgtVchNo as TrnVchNo" _
'     & ",IgtDpogAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRgPymt" _
'     & " inner join VTypMast on IndrRgPymt.IgtVtmCode = VTypMast.VtmCode" _
'     & " where IgtDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IgtCode>0" _
'     & IIf(mQryEttCode > 0, " and IgtEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IgtVtmCode=" & CStr(mQryVtmCode), "")
'End If
'Rem indoor on a/c refund
'If chkFByIndrRgRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select " _
'     & "'Igf' as TrnType" _
'     & ",IgfCode as TrnCode" _
'     & ",IgfDate as TrnDate" _
'     & ",IgfVtmCode * - 1 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",IgfEttCode as TrnEttCode" _
'     & ",IgfVtmCode as TrnVtmCode" _
'     & ",IgfVchNo as TrnVchNo" _
'     & ",IgfRfugAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRgRefd" _
'     & " inner join VTypMast on IndrRgRefd.IgfVtmCode = VTypMast.VtmCode" _
'     & " where IgfDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IgfCode>0" _
'     & IIf(mQryEttCode > 0, " and IgfEttCode=" & CStr(mQryEttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IgfVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem ----------------------------------
mQryStr = mQryStr & ") as t1"
mQryStr = mQryStr & " inner join EntityMast on t1.TrnEttCode=EntityMast.EttCode)" _
 & " inner join VTypMast on t1.TrnVtmCode = VTypMast.VtmCode" _
 & " order by t1.TrnDate,t1.TrnType,t1.TrnCode"

datRecset.open mQryStr, dbComDatabase, adOpenKeyset, adLockReadOnly

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
    fcmbEttRegNo.BoundText = CStr(mQryEttCode)
    fcmbEttName.BoundText = CStr(mQryEttCode)
    fcmbSrvName.BoundText = CStr(mQrySrvCode)
    fcmbSgpName.BoundText = CStr(mQrySgpCode)
    fcmbVtmName.BoundText = CStr(mQryVtmCode)
    mskQryEttRegNo.Text = fcmbEttRegNo.Text
    txtQryEttName.Text = fcmbEttName.Text
    txtQrySrvName.Text = fcmbSrvName.Text
    txtQrySgpName.Text = fcmbSgpName.Text
    txtQryVtmName.Text = fcmbVtmName.Text
    ' ----------------
    frConfigure.ZOrder
    frConfigure.Visible = True
    Mfgrd1.Enabled = False
    dtpFromDate.SetFocus
ElseIf MyAddNewKey(Shift, KeyCode) = True Then
    ''' Call Data_AddEvent
ElseIf MyDeleteKey(Shift, KeyCode) = True Then
    If Mfgrd1.Row < Mfgrd1.Rows - 1 And (optDetailed.Value = True Or optExpanded.Value = True) Then
        'Call Data_DeleteEvent
    End If
ElseIf Shift = vbCtrlMask And KeyCode = vbKeySpace Then
    If srow < Mfgrd1.Rows - 1 And (optDetailed.Value = True Or optExpanded.Value = True) Then
        mTrnCode = Val(Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCode")))
        mTrnSysType = Val(Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("VtmSysCode")))
        If mTrnCode > 0 Then
            mEntryAccessed = True
            mLastRowAccessed = srow
            Select Case mTrnSysType
'            Case cHMS_VTYPE_OUTDOOR_REG
'                Set frmTrn = New frmOutdoorReg
'
            Case cBDK_VTYPE_BLDISU_RCPT
                Set frmTrn = New frmBloodIssueRcpt
            
            Case cBDK_VTYPE_BLDISU_PYMT
                Rem Set frmTrn = New frmBloodIssuePymt
            
            Case cBDK_VTYPE_BLDISU_REFD
                Rem Set frmTrn = New frmBloodIssueRefd
            
'            Case cHMS_VTYPE_OUTDOOR_BILL
'                Set frmTrn = New frmOutdoorBill
'
'            Case cHMS_VTYPE_INDOOR_REG
'                Set frmTrn = New frmIndoorReg
'
'            Case cHMS_VTYPE_INDOOR_RCPT
'                Set frmTrn = New frmIndoorReceipt
'
'            Case cHMS_VTYPE_INDOOR_PYMT
'                Set frmTrn = New frmIndoorPymtRcpt
'
'            Case cHMS_VTYPE_INDOOR_REFD
'                Set frmTrn = New frmIndoorRefdRcpt
'
'            Case cHMS_VTYPE_INDOOR_RGPYMT
'                Set frmTrn = New frmIndoorRgPayment
'
'            Case cHMS_VTYPE_INDOOR_RGREFD
'                Set frmTrn = New frmIndoorRgRefund
'
'            Case cHMS_VTYPE_INDOOR_BILL
'                Set frmTrn = New frmIndoorBill
'
'            Case cHMS_VTYPE_INDOOR_BLPYMT
'                Set frmTrn = New frmIndoorBlPayment
'
'            Case cHMS_VTYPE_INDOOR_BLREFD
'                Set frmTrn = New frmIndoorBlRefund
'
            Case Else
                ErrorBox Me.Name & "_Mfgrd1_KeyDown_#4813_[Undefined]"
                mEntryAccessed = False
            End Select
            If Not frmTrn Is Nothing Then
                frmTrn.RemoteAccessCode = mTrnCode
                Load frmTrn
                frmTrn.Show 1
                Me.ZOrder
            End If
            
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

Private Sub optEntityRegNoWise_GotFocus()
FlashActiveControl optEntityRegNoWise, True
End Sub

Private Sub optEntityRegNoWise_LostFocus()
FlashActiveControl optEntityRegNoWise, False
End Sub

Private Sub optServiceWise_GotFocus()
FlashActiveControl optServiceWise, True
End Sub

Private Sub optServiceWise_LostFocus()
FlashActiveControl optServiceWise, False
End Sub

Private Sub txtFromTime1_GotFocus()
FlashActiveControl txtFromTime1, True
End Sub

Private Sub txtFromTime1_LostFocus()
FlashActiveControl txtFromTime1, False
End Sub

Private Sub txtFromTime1_Validate(Cancel As Boolean)
txtFromTime1.Text = MinToTime(TimeToMin(txtFromTime1.Text))
If TimeToMin(txtFromTime1.Text) > cDAYMINUTES Then
    ErrorBox "Invalid Input !!!"
    txtFromTime1.SetFocus
    Cancel = True
End If

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
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("tTrnSmryId"), mText
    ElseIf optMonthwise.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("TrnYrMonth"), mText
    ElseIf optDatewise.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("TrnDateYMD"), mText
    ElseIf optEntityNamewise.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("EttName"), mText
    ElseIf optEntityRegNoWise.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("EttRegNo"), mText
    ElseIf optServiceWise.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("SrvName"), mText
    ElseIf optServGrpWise.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("SgpName"), mText
    ElseIf optServGrpNServWise.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("SgpName"), mText
    ElseIf optVTypewise.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("VtmName"), mText
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
        fcmbEttRegNo.BoundText = CStr(mQryEttCode)
        mskQryEttRegNo.Text = fcmbEttRegNo.Text
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

Private Sub txtQrySgpName_Change()
If fcmbSgpName.CallFromText_Change = False Then
    fcmbSgpName.CallFromText_Change = True
    If InterActiveChange(txtQrySgpName) = True Then
        fcmbSgpName.UserText = Array(txtQrySgpName.Text, txtQrySgpName.SelStart)
        fcmbSgpName.Show
        txtQrySgpName.Text = fcmbSgpName.Text
        mQrySgpCode = Val(fcmbSgpName.BoundText)
        If fcmbSgpName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbSgpName.CallFromText_Change = False
End If

End Sub

Private Sub txtQrySgpName_GotFocus()
FlashActiveControl txtQrySgpName, True
End Sub

Private Sub txtQrySgpName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtQrySgpName_Change
End If
End Sub

Private Sub txtQrySgpName_LostFocus()
FlashActiveControl txtQrySgpName, False
End Sub

Private Sub txtQrySgpName_Validate(Cancel As Boolean)
'Dim mOpgRate As Double, mOpgDiscPer As Double, mOpgInfByPer As Double, mOpgDefByPer As Double
'
'If Val(fcmbSgpName.BoundText) <= 0 Then
'    ErrorBox "Invalid Selection !!!"
'    txtSgpName.SetFocus
'    Cancel = True
'Else
'    If Val(fcmbSgpName.BoundText) <> mOpgSgpCode_old Or FormAddEditMode = cFORM_ADDMODE Then
'        Call ChkServRate
'        Call CalcOpgChg
'    End If
'End If

End Sub

Private Sub txtQryVtmName_Change()
If fcmbVtmName.CallFromText_Change = False Then
    fcmbVtmName.CallFromText_Change = True
    If InterActiveChange(txtQryVtmName) = True Then
        fcmbVtmName.UserText = Array(txtQryVtmName.Text, txtQryVtmName.SelStart)
        fcmbVtmName.Show
        txtQryVtmName.Text = fcmbVtmName.Text
        mQryVtmCode = Val(fcmbVtmName.BoundText)
        If fcmbVtmName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbVtmName.CallFromText_Change = False
End If

End Sub

Private Sub txtQryVtmName_GotFocus()
FlashActiveControl txtQryVtmName, True
End Sub

Private Sub txtQryVtmName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtQryVtmName_Change
End If
End Sub

Private Sub txtQryVtmName_LostFocus()
FlashActiveControl txtQryVtmName, False
End Sub

Private Sub txtQryVtmName_Validate(Cancel As Boolean)
'Dim mOpgRate As Double, mOpgDiscPer As Double, mOpgInfByPer As Double, mOpgDefByPer As Double
'
'If Val(fcmbVtmName.BoundText) <= 0 Then
'    ErrorBox "Invalid Selection !!!"
'    txtVtmName.SetFocus
'    Cancel = True
'Else
'    If Val(fcmbVtmName.BoundText) <> mOpgVtmCode_old Or FormAddEditMode = cFORM_ADDMODE Then
'        Call ChkServRate
'        Call CalcOpgChg
'    End If
'End If

End Sub

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
        mQrySrvCode = Val(fcmbSrvName.BoundText)
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

Private Sub txtQrySrvName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtQrySrvName_Change
End If
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

Private Sub cmbCRList_GotFocus()
FlashActiveControl cmbCRList, True
End Sub

Private Sub cmbCRList_LostFocus()
FlashActiveControl cmbCRList, False
End Sub

Private Sub cmbPrintDest_GotFocus()
FlashActiveControl cmbPrintDest, True
End Sub

Private Sub cmbPrintDest_LostFocus()
FlashActiveControl cmbPrintDest, False
End Sub

Private Sub cmbPrinterList_GotFocus()
FlashActiveControl cmbPrinterList, True
End Sub

Private Sub cmbPrinterList_LostFocus()
FlashActiveControl cmbPrinterList, False
End Sub

Private Sub mskPrintCopies_GotFocus()
FlashActiveControl mskPrintCopies, True
End Sub

Private Sub mskPrintCopies_LostFocus()
FlashActiveControl mskPrintCopies, False
End Sub

Private Sub mskPrintCopies_Validate(Cancel As Boolean)
mskPrintCopies.Text = Val(mskPrintCopies.Text)
If Val(mskPrintCopies.Text) < 1 Then
    ErrorBox "Invalid Input !!!"
    mskPrintCopies.SetFocus
    Cancel = True
End If

End Sub

Private Sub cmdPrintCRL_GotFocus()
FlashActiveControl cmdPrintCRL, True
End Sub

Private Sub cmdPrintCRL_LostFocus()
FlashActiveControl cmdPrintCRL, False
End Sub

Private Sub cmdPrintCRL_Click()

txtFromTime1.Text = MinToTime(TimeToMin(txtFromTime1.Text))
If TimeToMin(txtFromTime1.Text) > cDAYMINUTES Then
    ErrorBox "Invalid Input !!!"
    txtFromTime1.SetFocus
    Exit Sub
End If
txtToTime1.Text = MinToTime(TimeToMin(txtToTime1.Text))
If TimeToMin(txtToTime1.Text) > cDAYMINUTES Then
    ErrorBox "Invalid Input !!!"
    txtToTime1.SetFocus
    Exit Sub
End If
If IsFinYrDate(Ctod(ToMyDate(dtpFromDate1.Text))) = False Then
    ErrorBox "Invalid Date Range !!!"
    dtpFromDate1.SetFocus
    Exit Sub
End If
If IsFinYrDate(Ctod(ToMyDate(dtpToDate1.Text))) = False Then
    ErrorBox "Invalid Date Range !!!"
    dtpToDate1.SetFocus
    Exit Sub
End If
If cmbCRList.ListIndex < 0 Then
    ErrorBox "Invalid Print Format Name !!!"
    cmbCRList.SetFocus
    Exit Sub
End If
If cmbPrinterList.ListIndex < 0 Then
    ErrorBox "Invalid Print Selection !!!"
    cmbPrinterList.SetFocus
    Exit Sub
End If
If Val(mskPrintCopies.Text) < 1 Then
    ErrorBox "Invalid Input !!!"
    mskPrintCopies.SetFocus
    Exit Sub
End If
If cmbPrintDest.ListIndex < 0 Then
    ErrorBox "Invalid Print Destination !!!"
    cmbPrintDest.SetFocus
    Exit Sub
End If
Call Data_PrintEvent

End Sub

Private Sub AssignPrintPara()
Dim mPrinter As Printer, fhand As Integer, mCRLTitle As String, mCRLFileName As String, mCRLDefault As Boolean, mDefaultCRLIndex As Integer

mDefaultCRLIndex = -1
mskPrintCopies.Text = 1

AddPrinterToCombo cmbPrinterList
AddPrintDestToCombo cmbPrintDest

If Dir(CollRepCRLFileFullPath) = "" Then
    fhand = FreeFile
    Open CollRepCRLFileFullPath For Output As #fhand
    Write #fhand, "Day Collection Report", "CollRep.Rpt", True
    Close #fhand
End If

cmbCRList.Clear
fhand = FreeFile
Open CollRepCRLFileFullPath For Input As #fhand
Do While EOF(fhand) = False
    Input #fhand, mCRLTitle, mCRLFileName, mCRLDefault
    If Dir(CollRepCRLFileFullPath(mFileName:=mCRLFileName)) <> "" Then
        cmbCRList.AddItem mCRLTitle & Space(100) & CollRepCRLFileFullPath(mFileName:=mCRLFileName)
        If mCRLDefault = True Then
            mDefaultCRLIndex = cmbCRList.NewIndex
        End If
    End If
Loop
Close #fhand
If cmbCRList.ListCount > 0 Then
    If mDefaultCRLIndex > -1 Then
        cmbCRList.ListIndex = mDefaultCRLIndex
    Else
        cmbCRList.ListIndex = 0
    End If
End If

End Sub

Private Sub Data_PrintEvent()
Dim mFromDate1 As Date, mFromTime1 As Integer, mToDate1 As Date, mToTime1 As Integer
Dim fCRView As Form

mFromDate1 = Ctod(dtpFromDate1.Text)
mFromTime1 = TimeToMin(txtFromTime1.Text)
mToDate1 = Ctod(dtpToDate1.Text)
mToTime1 = TimeToMin(txtToTime1.Text)

frmMain.Cryst.Reset
frmMain.Cryst.ReportFileName = Trim(Right(cmbCRList.List(cmbCRList.ListIndex), 100))
frmMain.Cryst.DiscardSavedData = True
frmMain.Cryst.DataFiles(0) = dbComDatabaseFullPath

frmMain.Cryst.SelectionFormula = "{vewCollDtl.TrnDate} >= Date(" & Format(mFromDate1, "yyyy,mm,dd") & ") and {vewCollDtl.TrnDate} <= Date(" & Format(mToDate1, "yyyy,mm,dd") & ") and {vewCollDtl.TrnTime} >= " & CStr(mFromTime1) & " and {vewCollDtl.TrnTime} <= " & CStr(mToTime1)        '''  & " and {vewCollDtl.TrnCmpCode}=" & CStr(sFinYrCmpCode)

frmMain.Cryst.ReportTitle = IIf(mFromDate1 <> mToDate1, "From Date " & Dtoc(mFromDate1) & " To " & Dtoc(mToDate1), "For Date " & Dtoc(mFromDate1)) & IIf(mFromTime1 <> 0 Or mToTime1 <> cDAYMINUTES, " (" & Format(MinToTime(mFromTime1), "HH:MM AM/PM") & " To " & Format(MinToTime(mToTime1), "HH:MM AM/PM") & ")", "")

frmMain.Cryst.CopiesToPrinter = Val(mskPrintCopies.Text)
frmMain.Cryst.PrinterName = Trim(Left(cmbPrinterList.List(cmbPrinterList.ListIndex), 100))
frmMain.Cryst.PrinterDriver = Trim(Right(cmbPrinterList.List(cmbPrinterList.ListIndex), 100))
If cmbPrintDest.ListIndex = 0 Then
    frmMain.Cryst.Destination = crptToPrinter
Else
    frmMain.Cryst.Destination = crptToWindow
    frmMain.Cryst.WindowState = crptMaximized
    frmMain.Cryst.WindowShowExportBtn = True
    frmMain.Cryst.WindowShowPrintBtn = True
    frmMain.Cryst.WindowShowPrintSetupBtn = True
    frmMain.Cryst.WindowShowRefreshBtn = True
    frmMain.Cryst.WindowShowSearchBtn = True
    frmMain.Cryst.WindowShowZoomCtl = True
    
    Set fCRView = New frmCRViewer
    fCRView.WindowState = 2
    fCRView.Height = frmMain.Height
    fCRView.Width = frmMain.Width
    frmMain.Cryst.WindowParentHandle = fCRView.hWnd
    fCRView.Caption = cmbCRList.List(cmbCRList.ListIndex)
End If
txtVoid.SetFocus
Mfgrd1.Enabled = True
frPrintCRList.Visible = False
Mfgrd1.SetFocus

frmMain.Cryst.Action = 1
If cmbPrintDest.ListIndex = 1 Then
    Load fCRView
    fCRView.ZOrder
    fCRView.Show 1
    Set fCRView = Nothing
End If

End Sub

Private Sub Data_PrintDialog()
        
dtpFromDate1.Text = Dtoc(DefaultEntryDate)
txtFromTime1.Text = MinToTime(0)
dtpToDate1.Text = Dtoc(DefaultEntryDate)
txtToTime1.Text = MinToTime(cDAYMINUTES)
' ----------------
Call AssignPrintPara
frPrintCRList.ZOrder
frPrintCRList.Visible = True
Mfgrd1.Enabled = False
cmbPrintDest.SetFocus

End Sub

Private Sub txtToTime1_GotFocus()
FlashActiveControl txtToTime1, True
End Sub

Private Sub txtToTime1_LostFocus()
FlashActiveControl txtToTime1, False
End Sub

Private Sub txtToTime1_Validate(Cancel As Boolean)
txtToTime1.Text = MinToTime(TimeToMin(txtToTime1.Text))
If TimeToMin(txtToTime1.Text) > cDAYMINUTES Then
    ErrorBox "Invalid Input !!!"
    txtToTime1.SetFocus
    Cancel = True
End If

End Sub

Private Sub Chk_EntryAccessed()
Dim mTrnDate As Date, mTrnCode As Long, mTrnVtmCode As Long, mSearchIdStr As String

mTrnDate = frmTrn.EntryDate
mTrnCode = frmTrn.EntryBoundCode
mTrnVtmCode = frmTrn.EntryVtmCode

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

Rem -------------------------------------------- end of form ---------------------------


