VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "Mscomctl.ocx"
Begin VB.Form frmIndoorPymtRcpt 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   ClientHeight    =   10860
   ClientLeft      =   60
   ClientTop       =   60
   ClientWidth     =   14505
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
   ScaleHeight     =   10860
   ScaleWidth      =   14505
   ShowInTaskbar   =   0   'False
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
      TabIndex        =   55
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
      TabIndex        =   54
      TabStop         =   0   'False
      Top             =   0
      Width           =   255
   End
   Begin VB.ComboBox cmbFormEntryMode 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   315
      ItemData        =   "IpdPyRc.frx":0000
      Left            =   0
      List            =   "IpdPyRc.frx":000D
      Style           =   1  'Simple Combo
      TabIndex        =   53
      TabStop         =   0   'False
      Text            =   "cmbFormEntryMode"
      Top             =   360
      Width           =   1455
   End
   Begin VB.TextBox txtVoid 
      CausesValidation=   0   'False
      Height          =   375
      Left            =   0
      TabIndex        =   49
      TabStop         =   0   'False
      Text            =   "Void"
      Top             =   9960
      Width           =   375
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   125
      Top             =   10545
      Width           =   14505
      _ExtentX        =   25585
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
            TextSave        =   "08:28"
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
      Height          =   7575
      Left            =   120
      TabIndex        =   51
      Top             =   720
      Width           =   14175
      Begin VB.Frame frPrintCRList 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   3615
         Left            =   3480
         TabIndex        =   126
         Top             =   1200
         Width           =   5895
         Begin VB.CommandButton cmdPrintCRL 
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
            Left            =   2520
            TabIndex        =   77
            Top             =   3000
            Width           =   855
         End
         Begin VB.TextBox mskIpyVchNo 
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
            Index           =   1
            Left            =   2160
            TabIndex        =   71
            Tag             =   "AhCode"
            Text            =   "0"
            Top             =   960
            Width           =   1455
         End
         Begin VB.TextBox txtIpyVtmName 
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
            Left            =   2160
            MaxLength       =   50
            TabIndex        =   70
            Top             =   600
            Width           =   3495
         End
         Begin VB.TextBox mskIpyVchNo 
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
            Index           =   2
            Left            =   4200
            TabIndex        =   72
            Tag             =   "AhCode"
            Text            =   "0"
            Top             =   960
            Width           =   1455
         End
         Begin VB.ComboBox cmbCRList 
            Height          =   315
            Left            =   2160
            Style           =   2  'Dropdown List
            TabIndex        =   73
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
            TabIndex        =   75
            Text            =   "0"
            Top             =   2040
            Width           =   1455
         End
         Begin VB.ComboBox cmbPrintDest 
            Height          =   315
            Left            =   2160
            Style           =   2  'Dropdown List
            TabIndex        =   76
            Top             =   2400
            Width           =   3495
         End
         Begin VB.ComboBox cmbPrinterList 
            Height          =   315
            Left            =   2160
            Style           =   2  'Dropdown List
            TabIndex        =   74
            Top             =   1680
            Width           =   3495
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
            Index           =   31
            Left            =   0
            TabIndex        =   134
            Top             =   0
            Width           =   5895
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
            Index           =   6
            Left            =   120
            TabIndex        =   133
            Top             =   600
            Width           =   1935
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "From Vch.No.:"
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
            TabIndex        =   132
            Top             =   960
            Width           =   1935
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
            Index           =   8
            Left            =   3720
            TabIndex        =   131
            Top             =   960
            Width           =   375
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
            TabIndex        =   130
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
            TabIndex        =   129
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
            TabIndex        =   128
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
            TabIndex        =   127
            Top             =   1680
            Width           =   1935
         End
      End
      Begin VB.Frame frConfigure 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   4935
         Left            =   3000
         TabIndex        =   79
         Top             =   720
         Width           =   6735
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
            TabIndex        =   62
            Text            =   "0"
            Top             =   1080
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
            Left            =   3120
            TabIndex        =   69
            Top             =   4320
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
            Height          =   2295
            Left            =   2160
            TabIndex        =   64
            Top             =   1800
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
               TabIndex        =   65
               Top             =   360
               Value           =   -1  'True
               Width           =   2055
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
               TabIndex        =   66
               Top             =   840
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
               TabIndex        =   67
               Top             =   1320
               Width           =   2055
            End
            Begin VB.OptionButton optPatientwise 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Patient-wise"
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
               TabIndex        =   68
               Top             =   1800
               Width           =   2055
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
            Left            =   4680
            TabIndex        =   61
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
            Left            =   1680
            TabIndex        =   60
            Tag             =   "AhCode"
            Text            =   "dd/mm/yyyy"
            Top             =   720
            Width           =   1455
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
            TabIndex        =   63
            Top             =   1440
            Width           =   4455
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
            TabIndex        =   84
            Top             =   1080
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
            Left            =   3720
            TabIndex        =   83
            Top             =   720
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
            TabIndex        =   82
            Top             =   720
            Width           =   1455
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
            TabIndex        =   81
            Top             =   0
            Width           =   6735
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
            TabIndex        =   80
            Top             =   1440
            Width           =   1455
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
         TabIndex        =   59
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
         TabIndex        =   57
         Top             =   360
         Width           =   4215
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd1 
         Height          =   6495
         Left            =   120
         TabIndex        =   58
         Top             =   720
         Width           =   13815
         _ExtentX        =   24368
         _ExtentY        =   11456
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
         Index           =   4
         Left            =   120
         TabIndex        =   78
         Top             =   360
         Width           =   735
      End
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
      Height          =   9615
      Left            =   120
      TabIndex        =   52
      Top             =   720
      Width           =   13215
      Begin VB.TextBox mskIrcRefuAmt 
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
         Left            =   9840
         TabIndex        =   45
         Text            =   "0.00"
         Top             =   6000
         Width           =   1215
      End
      Begin VB.TextBox mskIrcAdvAmt 
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
         Left            =   5040
         TabIndex        =   41
         Text            =   "0.00"
         Top             =   6000
         Width           =   1215
      End
      Begin VB.TextBox mskIrcBalAmt 
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
         Left            =   11040
         TabIndex        =   46
         Text            =   "0.00"
         Top             =   6000
         Width           =   1215
      End
      Begin VB.TextBox mskIrcDepoAmtExcl 
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
         TabIndex        =   43
         Text            =   "0.00"
         Top             =   6000
         Width           =   1215
      End
      Begin VB.TextBox mskIrcRecdAmt 
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
         Left            =   6240
         TabIndex        =   42
         Text            =   "0.00"
         Top             =   6000
         Width           =   1215
      End
      Begin VB.TextBox mskIrcAmtAftDisc 
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
         Left            =   3840
         TabIndex        =   40
         Text            =   "0.00"
         Top             =   6000
         Width           =   1215
      End
      Begin VB.TextBox dtpIrcDate 
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
         Left            =   2400
         MaxLength       =   50
         TabIndex        =   39
         TabStop         =   0   'False
         Text            =   "dd/mm/yyyy"
         Top             =   6000
         Width           =   1455
      End
      Begin VB.TextBox txtIrcVtmName 
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
         Left            =   1680
         MaxLength       =   50
         TabIndex        =   38
         Top             =   6000
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
         Left            =   12240
         Style           =   1  'Graphical
         TabIndex        =   47
         Top             =   6000
         Width           =   735
      End
      Begin VB.Frame frFooter 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         ForeColor       =   &H80000008&
         Height          =   1815
         Left            =   120
         TabIndex        =   113
         Top             =   7680
         Width           =   12855
         Begin VB.Label lblIrcRefuAmtTot 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "0.00"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   -1  'True
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   285
            Left            =   9720
            TabIndex        =   124
            Top             =   240
            Width           =   1215
         End
         Begin VB.Label lblIrcAdvAmtTot 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "0.00"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   -1  'True
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   285
            Left            =   4920
            TabIndex        =   123
            Top             =   240
            Width           =   1215
         End
         Begin VB.Label lblIrcBalAmtTot 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "0.00"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   -1  'True
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   285
            Left            =   10920
            TabIndex        =   122
            Top             =   240
            Width           =   1215
         End
         Begin VB.Label lblIpyDepoAmtTot 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "0.00"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   -1  'True
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   285
            Left            =   8520
            TabIndex        =   121
            Top             =   240
            Width           =   1215
         End
         Begin VB.Label lblIrcDepoAmtExclTot 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "0.00"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   -1  'True
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   285
            Left            =   7320
            TabIndex        =   120
            Top             =   240
            Width           =   1215
         End
         Begin VB.Label lblIrcRecdAmtTot 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "0.00"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   -1  'True
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   285
            Left            =   6120
            TabIndex        =   119
            Top             =   240
            Width           =   1215
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Last IPD Pymnt:"
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
            TabIndex        =   118
            Top             =   1440
            Width           =   1695
         End
         Begin VB.Label lblOldIpyCodeDesc 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
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
            Left            =   1800
            TabIndex        =   117
            Top             =   1440
            Width           =   7695
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Deposited Amount Detail:"
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
            Height          =   975
            Index           =   30
            Left            =   0
            TabIndex        =   115
            Top             =   240
            Visible         =   0   'False
            Width           =   3495
         End
         Begin VB.Label lblIrcAmtAftDiscTot 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "0.00"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   -1  'True
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   285
            Left            =   3720
            TabIndex        =   114
            Top             =   240
            Width           =   1215
         End
      End
      Begin VB.TextBox mskIpySno 
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
         Left            =   120
         TabIndex        =   36
         Tag             =   "AhCode"
         Text            =   "0"
         Top             =   6000
         Width           =   495
      End
      Begin VB.Frame frHeader 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   4935
         Left            =   120
         TabIndex        =   85
         Top             =   240
         Width           =   12855
         Begin VB.TextBox txtIpgRemark 
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
            Left            =   7440
            MaxLength       =   50
            TabIndex        =   28
            TabStop         =   0   'False
            Top             =   3720
            Width           =   5175
         End
         Begin VB.TextBox txtPttRefRela 
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
            MaxLength       =   10
            TabIndex        =   12
            TabStop         =   0   'False
            Top             =   1440
            Width           =   1215
         End
         Begin VB.TextBox txtPttSex 
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
            MaxLength       =   10
            TabIndex        =   6
            TabStop         =   0   'False
            Top             =   1080
            Width           =   1215
         End
         Begin VB.TextBox mskIpyIpgCode 
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
            Left            =   3600
            TabIndex        =   1
            Tag             =   "AhCode"
            Text            =   "-1"
            Top             =   240
            Width           =   1455
         End
         Begin VB.TextBox txtIpyTime_str 
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
            Left            =   10200
            MaxLength       =   50
            TabIndex        =   33
            TabStop         =   0   'False
            Text            =   "00:00"
            Top             =   4200
            Width           =   855
         End
         Begin VB.TextBox dtpIpyDate 
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
            Left            =   8040
            MaxLength       =   50
            TabIndex        =   32
            Text            =   "dd/mm/yyyy"
            Top             =   4200
            Width           =   1455
         End
         Begin VB.TextBox mskIpyVchNo 
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
            Index           =   0
            Left            =   6000
            TabIndex        =   31
            Text            =   "0"
            Top             =   4200
            Width           =   1335
         End
         Begin VB.TextBox txtIpyVtmName 
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
            Left            =   2040
            MaxLength       =   50
            TabIndex        =   29
            Top             =   4200
            Width           =   1815
         End
         Begin VB.TextBox txtIpyPrefix 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BorderStyle     =   0  'None
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
            Left            =   4800
            TabIndex        =   30
            Tag             =   "AhCode"
            Text            =   "[Prefix]"
            Top             =   4200
            Width           =   1095
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
            Left            =   2040
            TabIndex        =   0
            Tag             =   "AhCode"
            Text            =   "-1"
            Top             =   240
            Width           =   1455
         End
         Begin VB.TextBox txtPttName 
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
            TabIndex        =   3
            Top             =   720
            Width           =   5295
         End
         Begin VB.TextBox txtPcgName 
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
            Left            =   8880
            MaxLength       =   50
            TabIndex        =   18
            TabStop         =   0   'False
            Top             =   2160
            Width           =   3735
         End
         Begin VB.TextBox dtpPttRegDate 
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
            Left            =   11160
            MaxLength       =   50
            TabIndex        =   5
            TabStop         =   0   'False
            Text            =   "dd/mm/yyyy"
            Top             =   720
            Width           =   1455
         End
         Begin VB.TextBox mskPttRegNo 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BorderStyle     =   0  'None
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
            Left            =   8880
            TabIndex        =   4
            Tag             =   "AhCode"
            Text            =   "0"
            Top             =   720
            Width           =   1455
         End
         Begin VB.TextBox txtPttRefName 
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
            Left            =   3360
            MaxLength       =   50
            TabIndex        =   13
            TabStop         =   0   'False
            Top             =   1440
            Width           =   3975
         End
         Begin VB.TextBox txtPttAddr 
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
            MaxLength       =   250
            TabIndex        =   15
            TabStop         =   0   'False
            Top             =   1800
            Width           =   5295
         End
         Begin VB.TextBox txtAraName 
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
            TabIndex        =   17
            TabStop         =   0   'False
            Top             =   2160
            Width           =   5295
         End
         Begin VB.TextBox txtStnName 
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
            Left            =   2040
            MaxLength       =   50
            TabIndex        =   19
            TabStop         =   0   'False
            Top             =   2520
            Width           =   5295
         End
         Begin VB.TextBox txtPttTelNo 
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
            Left            =   8880
            MaxLength       =   50
            TabIndex        =   14
            TabStop         =   0   'False
            Top             =   1440
            Width           =   3735
         End
         Begin VB.TextBox txtPttSMSNo 
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
            Left            =   8880
            MaxLength       =   50
            TabIndex        =   16
            TabStop         =   0   'False
            Top             =   1800
            Width           =   3735
         End
         Begin VB.TextBox mskPttAgeYr 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BorderStyle     =   0  'None
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
            Left            =   5280
            TabIndex        =   7
            TabStop         =   0   'False
            Text            =   "0"
            Top             =   1080
            Width           =   735
         End
         Begin VB.TextBox mskPttAgeMn 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BorderStyle     =   0  'None
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
            Left            =   6000
            TabIndex        =   8
            TabStop         =   0   'False
            Tag             =   "AhCode"
            Text            =   "0"
            Top             =   1080
            Width           =   615
         End
         Begin VB.TextBox mskPttAgeDy 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BorderStyle     =   0  'None
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
            Left            =   6600
            TabIndex        =   9
            TabStop         =   0   'False
            Tag             =   "AhCode"
            Text            =   "0"
            Top             =   1080
            Width           =   735
         End
         Begin VB.TextBox dtpPttDob 
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
            Left            =   11160
            MaxLength       =   50
            TabIndex        =   11
            TabStop         =   0   'False
            Text            =   "dd/mm/yyyy"
            Top             =   1080
            Width           =   1455
         End
         Begin VB.TextBox dtpPttAgeAsOnDt 
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
            Left            =   8880
            MaxLength       =   50
            TabIndex        =   10
            TabStop         =   0   'False
            Text            =   "dd/mm/yyyy"
            Top             =   1080
            Width           =   1455
         End
         Begin VB.TextBox txtIpgVtmName 
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
            TabIndex        =   20
            Top             =   3000
            Width           =   1815
         End
         Begin VB.TextBox mskIpgVchNo 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BorderStyle     =   0  'None
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
            Left            =   6000
            TabIndex        =   22
            Text            =   "0"
            Top             =   3000
            Width           =   1335
         End
         Begin VB.TextBox txtIpgPrefix 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BorderStyle     =   0  'None
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
            Left            =   4800
            TabIndex        =   21
            TabStop         =   0   'False
            Tag             =   "AhCode"
            Text            =   "[Prefix]"
            Top             =   3000
            Width           =   1095
         End
         Begin VB.TextBox dtpIpgDate 
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
            Left            =   8040
            MaxLength       =   50
            TabIndex        =   23
            TabStop         =   0   'False
            Text            =   "dd/mm/yyyy"
            Top             =   3000
            Width           =   1455
         End
         Begin VB.TextBox txtIpgTime_str 
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
            Left            =   10200
            MaxLength       =   50
            TabIndex        =   24
            TabStop         =   0   'False
            Text            =   "00:00"
            Top             =   3000
            Width           =   855
         End
         Begin VB.TextBox txtCDctName 
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
            TabIndex        =   25
            TabStop         =   0   'False
            Top             =   3360
            Width           =   3975
         End
         Begin VB.TextBox txtRByName 
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
            Left            =   7440
            MaxLength       =   50
            TabIndex        =   26
            TabStop         =   0   'False
            Top             =   3360
            Width           =   5175
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
            TabIndex        =   27
            TabStop         =   0   'False
            Top             =   3720
            Width           =   3975
         End
         Begin VB.TextBox mskIpyPttCode 
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
            Left            =   5160
            TabIndex        =   2
            Tag             =   "AhCode"
            Text            =   "-1"
            Top             =   240
            Width           =   1455
         End
         Begin VB.TextBox txtIphRemark 
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
            Left            =   2040
            MaxLength       =   50
            TabIndex        =   34
            Top             =   4560
            Width           =   5295
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Remark:"
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
            Left            =   6120
            TabIndex        =   116
            Top             =   3720
            Width           =   1095
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Date:"
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
            Index           =   39
            Left            =   7440
            TabIndex        =   112
            Top             =   4200
            Width           =   495
         End
         Begin VB.Label Label2 
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
            Index           =   38
            Left            =   9600
            TabIndex        =   111
            Top             =   4200
            Width           =   495
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Rcpt.No.:"
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
            Index           =   37
            Left            =   3960
            TabIndex        =   110
            Top             =   4200
            Width           =   855
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Receipt Type:"
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
            Index           =   36
            Left            =   120
            TabIndex        =   109
            Top             =   4200
            Width           =   1935
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
            Left            =   120
            TabIndex        =   108
            Top             =   240
            Width           =   1935
         End
         Begin VB.Label Label2 
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
            Index           =   0
            Left            =   120
            TabIndex        =   107
            Top             =   720
            Width           =   1935
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Category:"
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
            Left            =   7440
            TabIndex        =   106
            Top             =   2160
            Width           =   1455
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Care of:"
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
            TabIndex        =   105
            Top             =   1440
            Width           =   1935
         End
         Begin VB.Line Line3 
            Index           =   1
            X1              =   0
            X2              =   12240
            Y1              =   600
            Y2              =   600
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Reg.No.:"
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
            Left            =   7440
            TabIndex        =   104
            Top             =   720
            Width           =   1575
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Reg.Dt:"
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
            Left            =   10440
            TabIndex        =   103
            Top             =   720
            Width           =   735
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Address:"
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
            Left            =   120
            TabIndex        =   102
            Top             =   1800
            Width           =   1935
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Area:"
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
            TabIndex        =   101
            Top             =   2160
            Width           =   855
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Station:"
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
            TabIndex        =   100
            Top             =   2520
            Width           =   1455
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Contact No.:"
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
            Left            =   7440
            TabIndex        =   99
            Top             =   1440
            Width           =   1455
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "SMS Mobile No:"
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
            Left            =   7440
            TabIndex        =   98
            Top             =   1800
            Width           =   1575
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Age (Yrs/Mn/Dys):"
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
            Index           =   16
            Left            =   3360
            TabIndex        =   97
            Top             =   1080
            Width           =   1935
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "DOB:"
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
            Index           =   17
            Left            =   10680
            TabIndex        =   96
            Top             =   1080
            Width           =   495
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "As On:"
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
            Index           =   18
            Left            =   7440
            TabIndex        =   95
            Top             =   1080
            Width           =   615
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "IPD Type:"
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
            TabIndex        =   94
            Top             =   3000
            Width           =   1935
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Ipd No:"
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
            Index           =   19
            Left            =   3960
            TabIndex        =   93
            Top             =   3000
            Width           =   855
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Date:"
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
            Index           =   20
            Left            =   7440
            TabIndex        =   92
            Top             =   3000
            Width           =   495
         End
         Begin VB.Label Label2 
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
            Index           =   22
            Left            =   9600
            TabIndex        =   91
            Top             =   3000
            Width           =   495
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Consulting Doctor:"
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
            Index           =   23
            Left            =   120
            TabIndex        =   90
            Top             =   3360
            Width           =   1935
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Ref.By:"
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
            Index           =   24
            Left            =   6120
            TabIndex        =   89
            Top             =   3360
            Width           =   1095
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Final Diagnosis:"
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
            Index           =   25
            Left            =   120
            TabIndex        =   88
            Top             =   3720
            Width           =   1935
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Remark:"
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
            Index           =   33
            Left            =   120
            TabIndex        =   87
            Top             =   4560
            Width           =   1935
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Sex:"
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
            Index           =   34
            Left            =   120
            TabIndex        =   86
            Top             =   1080
            Width           =   1935
         End
         Begin VB.Shape Shape1 
            BackColor       =   &H00FFD7B7&
            BackStyle       =   1  'Opaque
            Height          =   2775
            Index           =   0
            Left            =   0
            Top             =   120
            Width           =   12855
         End
         Begin VB.Shape Shape1 
            BackColor       =   &H00FFFFC0&
            BackStyle       =   1  'Opaque
            Height          =   1215
            Index           =   1
            Left            =   0
            Top             =   2880
            Width           =   12855
         End
         Begin VB.Shape Shape1 
            BackColor       =   &H00FFFF80&
            BackStyle       =   1  'Opaque
            Height          =   855
            Index           =   2
            Left            =   0
            Top             =   4080
            Width           =   12855
         End
      End
      Begin VB.TextBox mskIrcVchNo 
         Alignment       =   1  'Right Justify
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
         Left            =   600
         MaxLength       =   50
         TabIndex        =   37
         Text            =   "0"
         Top             =   6000
         Width           =   1095
      End
      Begin VB.TextBox mskIpyDepoAmt 
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
         Left            =   8640
         TabIndex        =   44
         Text            =   "0.00"
         Top             =   6000
         Width           =   1215
      End
      Begin VB.CommandButton cmdSaveForm 
         Appearance      =   0  'Flat
         BackColor       =   &H80000009&
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   12840
         Style           =   1  'Graphical
         TabIndex        =   48
         Top             =   9240
         Width           =   375
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd2 
         Height          =   2535
         Left            =   120
         TabIndex        =   35
         Top             =   5160
         Width           =   12855
         _ExtentX        =   22675
         _ExtentY        =   4471
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
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Current Balance:"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   2
         Left            =   8400
         TabIndex        =   56
         Top             =   8640
         Width           =   1575
      End
   End
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Indoor Due Payment Receipt"
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
      TabIndex        =   50
      Top             =   0
      Width           =   9015
   End
End
Attribute VB_Name = "frmIndoorPymtRcpt"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Dim mFormLoaded As Boolean, mLastKeyPressed As Integer, mMaskKeyPressed As Integer
Dim mFormUIdCode As Long, mFormUIdFileName As String, mFormAcsPermFileName As String
Dim mIpyCode As Long, mIpyIpgCode As Long, mIpyPttCode As Long, mQryPttCode As Long, mIpyOldIpyCode As Long, dtlAddEditMode As Boolean, dtlAddMode As Boolean, dtlEditCanceled As Boolean
Dim mRemoteAccess As Boolean, mEntrySaved As Boolean, mEntryAborted As Boolean
Dim dbAcDatabase As New ADODB.Connection, dbVgnDatabase As New ADODB.Connection, dbGrpDatabase As New ADODB.Connection, dbComDatabase As New ADODB.Connection
Dim datRecset As New ADODB.Recordset
Dim mPttRegNo_old As Long
Dim mIpyCode_old As Long, mIpyDate_old As Date, mIpyVtmCode_old As Long, mIpyVchNo_old As Long
Dim mIrcCode_old As Long, mIpyDepoAmt_old As Double
Dim clsJRN As clsJournal, clsAH As clsAccountHead, clsIPG As clsVgnSnglTranEntry, clsIRC As clsVgnIpdMultiTranEntry, clsIPY As clsVgnIpdMultiTranEntry, clsARA As clsComMastEntry, clsSTN As clsComMastEntry, clsVTM As clsComMastEntry, clsVGNOPT As clsVgnIpdOptionsEntry
Dim clsPAT As clsVgnMasterEntry, clsPCG As clsVgnMasterEntry, clsDCT As clsVgnMasterEntry, clsDIG As clsVgnMasterEntry, clsSRV As clsVgnMasterEntry
Dim mActiveControl As Object, clsListStru As clsSelectQueryStructure
Dim fcmbIpyVtmName As clsComFlexSearch
Dim fcmbAdmIpgByIpgNo As clsVgnFlexSearch, fcmbAdmIpgByPttRegNo As clsVgnFlexSearch, fcmbAdmIpgByPttName As clsVgnFlexSearch, fcmbPttName As clsVgnFlexSearch, fcmbPttRegNo As clsVgnFlexSearch, fcmbIrcVchNo As clsVgnFlexSearch

Private Type SmryPara
mIndex() As Variant
mFromDate() As Variant
mToDate() As Variant
mPttRegNo() As Variant
mPttCode() As Variant
mDetailed() As Variant
mMonthwise() As Variant
mDatewise() As Variant
mPatwise() As Variant
mRowIndex() As Variant

End Type

Dim SmryParaLayer As SmryPara

Rem deposited amount column definitions
Const X2IPYICODE_COL = 0
Const X2IPYSNO_COL = 1
Const X2IRCVCHNO_COL = 2
Const X2IRCVTMNAME_COL = 3
Const X2IRCDATE_COL = 4
Const X2IRCAMTAFTDISC_COL = 5
Const X2IRCADVAMT_COL = 6
Const X2IRCRECDAMT_COL = 7
Const X2IRCDEPOAMTEXCL_COL = 8
Const X2IPYDEPOAMT_COL = 9
Const X2IRCREFUAMT_COL = 10
Const X2IRCBALAMT_COL = 11
Const X2IRCCODE_COL = 12
Const X2IPYRECSTATE_COL = 13
Const MFGRD2_COLS = 14

Private Sub ClearSmryParaLayer()

With SmryParaLayer
.mIndex = Array()
.mFromDate = Array()
.mToDate = Array()
.mPttRegNo = Array()
.mPttCode = Array()
.mDetailed = Array()
.mMonthwise = Array()
.mDatewise = Array()
.mPatwise = Array()
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
    ReDim Preserve .mPttRegNo(mIndex)
    ReDim Preserve .mPttCode(mIndex)
    ReDim Preserve .mDetailed(mIndex)
    ReDim Preserve .mMonthwise(mIndex)
    ReDim Preserve .mDatewise(mIndex)
    ReDim Preserve .mPatwise(mIndex)
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
ReDim Preserve .mPttRegNo(mIndex)
ReDim Preserve .mPttCode(mIndex)
ReDim Preserve .mDetailed(mIndex)
ReDim Preserve .mMonthwise(mIndex)
ReDim Preserve .mDatewise(mIndex)
ReDim Preserve .mPatwise(mIndex)
ReDim Preserve .mRowIndex(mIndex)
' -----------------------
.mIndex(mIndex) = mIndex
.mFromDate(mIndex) = Ctod(dtpFromDate.Text)
.mToDate(mIndex) = Ctod(dtpToDate.Text)
    fcmbPttRegNo.BoundText = CStr(mQryPttCode)
    fcmbPttName.BoundText = CStr(mQryPttCode)
.mPttRegNo(mIndex) = Val(fcmbPttRegNo.Text)
.mPttCode(mIndex) = Val(fcmbPttName.BoundText)
.mDetailed(mIndex) = optDetailed.Value
.mMonthwise(mIndex) = optMonthwise.Value
.mDatewise(mIndex) = optDatewise.Value
.mPatwise(mIndex) = optPatientwise.Value
.mRowIndex(mIndex) = -1

End With

End Sub

Private Sub RestoreDefaultSmryPara()

dtpFromDate.Text = Dtoc(sFinYrStartDate)
dtpToDate.Text = Dtoc(sFinYrEndDate)
mQryPttCode = 0
mskQryPttRegNo.Text = "": fcmbPttRegNo.BoundText = ""
txtQryPttName.Text = "": fcmbPttName.BoundText = ""
optDetailed.Value = False
optMonthwise.Value = True
optDatewise.Value = False
optPatientwise.Value = False
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
fcmbPttRegNo.BoundText = CStr(mQryPttCode): mskQryPttRegNo.Text = fcmbPttRegNo.Text
fcmbPttName.BoundText = CStr(mQryPttCode): txtQryPttName.Text = fcmbPttName.Text
optDetailed.Value = .mDetailed(mIndex)
optMonthwise.Value = .mMonthwise(mIndex)
optDatewise.Value = .mDatewise(mIndex)
optPatientwise.Value = .mPatwise(mIndex)
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

Public Property Let RemoteAccessCode(ByVal mAccessCode As Long)
mRemoteAccess = True
mIpyCode = mAccessCode
End Property

Public Property Get EntryBoundCode() As Long
EntryBoundCode = Val(mskFormBoundField.Text)
End Property

Public Property Get EntryDate() As Date
EntryDate = Ctod(dtpIpyDate.Text)
End Property

Public Property Get EntryType() As String
EntryType = "Ipy"
End Property

Public Property Get EntryVtmCode() As Integer
EntryVtmCode = Val(fcmbIpyVtmName.BoundText)
End Property

Public Property Get EntrySaved() As Boolean
EntrySaved = mEntrySaved
End Property

Public Property Get EntryAborted() As Boolean
EntryAborted = mEntryAborted
End Property

Public Property Get PttName() As String
PttName = txtPttName.Text
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

Private Sub cmdConfigure_Click()
If Between(Ctod(dtpFromDate.Text), sFinYrStartDate, sFinYrEndDate) = False Then
    ErrorBox "Invalid Date Range !!!"
    'dtpFromDate.SetFocus
    'Exit Sub
End If
If Between(Ctod(dtpToDate.Text), sFinYrStartDate, sFinYrEndDate) = False Then
    ErrorBox "Invalid Date Range !!!"
    'dtpToDate.SetFocus
    'Exit Sub
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
            If optDetailed.Value = True Then
                Call Data_EditEvent
            Else
                fcmbPttRegNo.BoundText = CStr(mQryPttCode)
                fcmbPttName.BoundText = CStr(mQryPttCode)
                
                txtVoid.SetFocus
                If optMonthwise.Value = True Then
                    dtpFromDate.Text = Dtoc(MonthStartDate(DateSerial(Val(Left(.fields("IpyYrMonth"), 4)), Val(Right(.fields("IpyYrMonth"), 2)), 1)))
                    dtpToDate.Text = Dtoc(MonthEndDate(DateSerial(Val(Left(.fields("IpyYrMonth"), 4)), Val(Right(.fields("IpyYrMonth"), 2)), 1)))
                    optMonthwise.Value = False
                    optDatewise.Value = True
                ElseIf optDatewise.Value = True Then
                    dtpFromDate.Text = Dtoc(.fields("IphDate"))
                    dtpToDate.Text = Dtoc(.fields("IphDate"))
                    optDatewise.Value = False
                    optDetailed.Value = True
                ElseIf optPatientwise.Value = True Then
                    mQryPttCode = .fields("IphPttCode")
                    fcmbPttRegNo.BoundText = CStr(mQryPttCode)
                    fcmbPttName.BoundText = CStr(mQryPttCode)
                    mskQryPttRegNo.Text = fcmbPttRegNo.Text
                    txtQryPttName.Text = fcmbPttName.Text
                    optPatientwise.Value = False
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
            Call Data_AddEvent
        End If
        End With
    ElseIf Screen.ActiveControl.Name = Mfgrd2.Name Then
        Mfgrd2_KeyPress vbKeyReturn
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
            datRecset.Move mRecAbsPos - 1, 1
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
        txtPttName.SetFocus
    End If
End If

End Sub

Private Sub cmdOK_Click()
Dim tRecset As New ADODB.Recordset, srow As Integer, mIpySno As Integer, mIpyICode As Long

srow = Mfgrd2.Row
mIpySno = Val(Mfgrd2.TextMatrix(srow, X2IPYSNO_COL))
mIpyICode = Val(Mfgrd2.TextMatrix(srow, X2IPYICODE_COL))

If cmdOK.Caption = "&OK" And dtlEditCanceled = False Then
    With clsIPY
    If dtlAddMode = True Then
        .ClearDtl
    Else
        .GetDtlData mIpyCode, mIpyICode
    End If
    .mTrnCode_lng = mIpyCode
    .mTrnDtlSno_int = Val(UnMyNumFmt(mskIpySno.Text))
    .mTrnDate_dt = Ctod(dtpIpyDate.Text)
    .mTrnCmpCode_int = sFinYrCmpCode
    
    .mIpyPttCode_lng = mIpyPttCode
    .mIpyIhrCode_lng = Val(fcmbIrcVchNo.BoundText)
    .mIpyDepoAmt_dbl = Val(UnMyNumFmt(mskIpyDepoAmt.Text))
    .mIpyRemark_str = ""
    
    If dtlAddMode = True Then
        .AddNewDtl mIpyCode
        mIpyICode = .mTrnDtlICode_lng
    Else
        .UpdateDtl mIpyCode, mIpyICode
    End If
    End With
    
    RefreshDatabase dbVgnDatabase
    With tRecset
    .open "Select * from IndrPymtDtl where IpyCode=" & CStr(mIpyCode) & " and IpyICode=" & CStr(mIpyICode) & "", dbVgnDatabase, adOpenKeyset, adLockOptimistic
    
    clsIRC.GetHdrData .fields("IpyIhrCode")
    clsVTM.GetData clsIRC.mTrnVtmCode_lng
    
    Mfgrd2.TextMatrix(srow, X2IPYICODE_COL) = .fields("IpyICode")
    Mfgrd2.TextMatrix(srow, X2IPYSNO_COL) = ToMyNumFmt(.fields("IpySno"), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2IRCVCHNO_COL) = clsIRC.mTrnVchNo_lng
    Mfgrd2.TextMatrix(srow, X2IRCVTMNAME_COL) = clsVTM.mName_str
    Mfgrd2.TextMatrix(srow, X2IRCDATE_COL) = clsIRC.mTrnDate_dt
    Mfgrd2.TextMatrix(srow, X2IRCAMTAFTDISC_COL) = ToMyNumFmt(clsIRC.mIhrAmtAftDisc_dbl)
    Mfgrd2.TextMatrix(srow, X2IRCADVAMT_COL) = ToMyNumFmt(clsIRC.mIhrAdvAmt_dbl)
    Mfgrd2.TextMatrix(srow, X2IRCRECDAMT_COL) = ToMyNumFmt(clsIRC.mIhrRecdAmt_dbl)
    Mfgrd2.TextMatrix(srow, X2IRCDEPOAMTEXCL_COL) = ToMyNumFmt(clsIRC.mIhrDepoAmt_dbl - .fields("IpyDepoAmt"))
    Mfgrd2.TextMatrix(srow, X2IPYDEPOAMT_COL) = ToMyNumFmt(.fields("IpyDepoAmt"))
    Mfgrd2.TextMatrix(srow, X2IRCREFUAMT_COL) = ToMyNumFmt(clsIRC.mIhrRefuAmt_dbl)
    Mfgrd2.TextMatrix(srow, X2IRCBALAMT_COL) = ToMyNumFmt(clsIRC.mIhrBalAmt_dbl)
    Mfgrd2.TextMatrix(srow, X2IRCCODE_COL) = .fields("IpyIhrCode")
    Mfgrd2.TextMatrix(srow, X2IPYRECSTATE_COL) = .fields("IpyRecState")
    
    End With
    CloseTable tRecset
    
    If dtlAddMode = True Then
        Mfgrd2.Rows = Mfgrd2.Rows + 1
    End If
    srow = srow + 1
    Mfgrd2.Row = srow
    
    Call CalcFtrTotal
End If
dtlAddEditMode = False
dtlAddMode = False
dtlEditCanceled = False
VisibleControls False
txtVoid.SetFocus
Mfgrd2.SetFocus
CloseTable tRecset, mCheckOpen:=True

End Sub

Private Sub cmdSaveForm_Click()
txtVoid.SetFocus
Call Data_SaveEvent
Call SmryList

If optDetailed.Value = True Then
    txtSearch1Text_InterActiveChange Format(Ctod(dtpIpyDate.Text), "yyyymmdd") + Format(mIpyCode, "0000000")
ElseIf optMonthwise.Value = True Then
    txtSearch1Text_InterActiveChange Format(Ctod(dtpIpyDate.Text), "yyyy") & "/" & Format(Ctod(dtpIpyDate.Text), "mm")
ElseIf optDatewise.Value = True Then
    txtSearch1Text_InterActiveChange Format(Ctod(dtpIpyDate.Text), "yyyymmdd")
ElseIf optPatientwise.Value = True Then
    txtSearch1Text_InterActiveChange txtPttName.Text
End If

Call ShowEntryMode(False)
Mfgrd1.SetFocus

End Sub

Private Sub cmdSaveForm_GotFocus()
Dim mIrcAcsPermNo As Integer, mRetryCount As Integer

txtVoid.SetFocus
cmdSaveForm.Enabled = False
If Data_Verify() = True Then
    If CanAccept() = True Then
        If GetAccessPerm(mIrcAcsPermNo, mRetryCount, mFormAcsPermFileName) = True And mRetryCount = 0 Then
            If Data_NetwAuth() = True Then
                Call cmdSaveForm_Click
                Close #mIrcAcsPermNo
                If mRemoteAccess = True Then
                    ''Unload Me
                    Me.Hide
                    Exit Sub
                Else
                    Call Mfgrd1_RowColChange
                    Data_PrintDialog "SaveEvent"
                End If
            Else
                Close #mIrcAcsPermNo
            End If
        Else
            Close #mIrcAcsPermNo
            AlertBox "System Busy, Try Again !!!"
            
            txtPttName.SetFocus
        End If
    Else
        txtPttName.SetFocus
    End If
End If
cmdSaveForm.Enabled = True
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

Private Sub dtpIpgDate_GotFocus()
FlashActiveControl dtpIpgDate, True
End Sub

Private Sub dtpIpgDate_LostFocus()
FlashActiveControl dtpIpgDate, False
End Sub

Private Sub dtpIpgDate_Validate(Cancel As Boolean)
dtpIpgDate.Text = ToMyDate(dtpIpgDate.Text)
If IsDate(dtpIpgDate.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpIpgDate.SetFocus
    Cancel = True
End If

End Sub

Private Sub dtpIpyDate_GotFocus()
FlashActiveControl dtpIpyDate, True
End Sub

Private Sub dtpIpyDate_LostFocus()
FlashActiveControl dtpIpyDate, False
End Sub

Private Sub dtpIpyDate_Validate(Cancel As Boolean)
dtpIpyDate.Text = ToMyDate(dtpIpyDate.Text)
If IsFinYrDate(Ctod(dtpIpyDate.Text)) = False Then
    ErrorBox "Invalid Input !!!"
    dtpIpyDate.SetFocus
    Cancel = True
End If

End Sub

Private Sub dtpPttAgeAsOnDt_GotFocus()
FlashActiveControl dtpPttAgeAsOnDt, True
End Sub

Private Sub dtpPttAgeAsOnDt_LostFocus()
FlashActiveControl dtpPttAgeAsOnDt, False
End Sub

Private Sub dtpPttDob_GotFocus()
FlashActiveControl dtpPttDob, True
End Sub

Private Sub dtpPttDob_LostFocus()
FlashActiveControl dtpPttDob, False
End Sub

Private Sub dtpPttRegDate_GotFocus()
FlashActiveControl dtpPttRegDate, True
End Sub

Private Sub dtpPttRegDate_LostFocus()
FlashActiveControl dtpPttRegDate, False
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
If mFormLoaded = False Then
    If mRemoteAccess = True Then
        MoveRecToFirst datRecset
        ShowRecActiveFlexRow datRecset, Mfgrd1
        Mfgrd1.SetFocus
        If mIpyCode = 0 Then
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
    RefreshDatabase dbVgnDatabase
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
Case vbKeyF2
    Load frmSetDefaultDate
    frmSetDefaultDate.Show 1
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
Dim colcnt As Integer

mFormUIdFileName = "IndrPyRc.Uid"
mFormAcsPermFileName = "IndrPyRc.Acp"
mFormUIdCode = GetUIdCode(mProcess:=Me.Name, mUIdFileName:=mFormUIdFileName, mAcsPermFileName:=mFormAcsPermFileName)

mFormLoaded = False
mEntrySaved = False: mEntryAborted = False
SetFormSize Me, frmMain
Call Form_Resize

Call SetVoidControl(txtVoid)
txtSearch1Text.Enabled = False
frConfigure.Visible = False
frPrintCRList.Visible = False

ChkCustomForm Me, CfsFileFullPath("IndrPymt.Cfs")

OpenAcDataSource dbAcDatabase
OpenVgnDataSource dbVgnDatabase
OpenGrpDataSource dbGrpDatabase
OpenComDataSource dbComDatabase

Set clsListStru = New clsSelectQueryStructure

Set clsVGNOPT = New clsVgnIpdOptionsEntry
clsVGNOPT.blnIndrPymtOptMast = True
clsVGNOPT.Init
clsVGNOPT.GetIndrPymtOptData

Set clsAH = New clsAccountHead
Set clsAH.dbAcDatabase = dbAcDatabase
Set clsAH.dbGrpDatabase = dbGrpDatabase

Set clsIPG = New clsVgnSnglTranEntry
Set clsIPG.dbAcDatabase = dbAcDatabase
Set clsIPG.dbVgnDatabase = dbVgnDatabase
clsIPG.blnIndrRegTran = True
clsIPG.Init

Set clsIPY = New clsVgnIpdMultiTranEntry
Set clsIPY.dbAcDatabase = dbAcDatabase
Set clsIPY.dbVgnDatabase = dbVgnDatabase
Set clsIPY.dbComDatabase = dbComDatabase
clsIPY.blnIndrPymtTran = True
clsIPY.Init

Set clsIRC = New clsVgnIpdMultiTranEntry
Set clsIRC.dbAcDatabase = dbAcDatabase
Set clsIRC.dbVgnDatabase = dbVgnDatabase
clsIRC.blnIndrRcptTran = True
clsIRC.Init

Set clsPAT = New clsVgnMasterEntry
Set clsPAT.dbAcDatabase = dbAcDatabase
Set clsPAT.dbVgnDatabase = dbVgnDatabase
clsPAT.blnPatMast = True
clsPAT.Init

Set clsPCG = New clsVgnMasterEntry
Set clsPCG.dbVgnDatabase = dbVgnDatabase
clsPCG.blnPatCatgMast = True
clsPCG.Init

Set clsDCT = New clsVgnMasterEntry
Set clsDCT.dbVgnDatabase = dbVgnDatabase
clsDCT.blnDoctMast = True
clsDCT.Init

Set clsDIG = New clsVgnMasterEntry
Set clsDIG.dbVgnDatabase = dbVgnDatabase
clsDIG.blnDiagMast = True
clsDIG.Init

Set clsSRV = New clsVgnMasterEntry
Set clsSRV.dbVgnDatabase = dbVgnDatabase
clsSRV.blnServMast = True
clsSRV.Init

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

Set fcmbIpyVtmName = New clsComFlexSearch
Set fcmbIpyVtmName.dbAcDatabase = dbAcDatabase
fcmbIpyVtmName.blnVTypeMastList = True
fcmbIpyVtmName.mListSqlExpr = "Select * from VTypMast where VtmSysCode=" & CStr(cVGN_VTYPE_INDOOR_PYMT) & " order by VtmName"
fcmbIpyVtmName.Init

Set fcmbIrcVchNo = New clsVgnFlexSearch
Set fcmbIrcVchNo.dbVgnDatabase = dbVgnDatabase
Set fcmbIrcVchNo.dbComDatabase = dbComDatabase
fcmbIrcVchNo.blnOldIrcListByIrcNo = True
fcmbIrcVchNo.Init

Set fcmbPttRegNo = New clsVgnFlexSearch
Set fcmbPttRegNo.dbVgnDatabase = dbVgnDatabase
Set fcmbPttRegNo.dbComDatabase = dbComDatabase
fcmbPttRegNo.blnPatMastListByRegNo = True
fcmbPttRegNo.Init

Set fcmbPttName = New clsVgnFlexSearch
Set fcmbPttName.dbVgnDatabase = dbVgnDatabase
Set fcmbPttName.dbComDatabase = dbComDatabase
fcmbPttName.blnPatMastListByName = True
fcmbPttName.Init

Set fcmbAdmIpgByIpgNo = New clsVgnFlexSearch
Set fcmbAdmIpgByIpgNo.dbVgnDatabase = dbVgnDatabase
Set fcmbAdmIpgByIpgNo.dbComDatabase = dbComDatabase
fcmbAdmIpgByIpgNo.blnAdmIpgListByIpgNo = True
fcmbAdmIpgByIpgNo.Init

Set fcmbAdmIpgByPttRegNo = New clsVgnFlexSearch
Set fcmbAdmIpgByPttRegNo.dbVgnDatabase = dbVgnDatabase
Set fcmbAdmIpgByPttRegNo.dbComDatabase = dbComDatabase
fcmbAdmIpgByPttRegNo.blnAdmIpgListByPttRegNo = True
fcmbAdmIpgByPttRegNo.Init

Set fcmbAdmIpgByPttName = New clsVgnFlexSearch
Set fcmbAdmIpgByPttName.dbVgnDatabase = dbVgnDatabase
Set fcmbAdmIpgByPttName.dbComDatabase = dbComDatabase
fcmbAdmIpgByPttName.blnAdmIpgListByPttName = True
fcmbAdmIpgByPttName.Init

Call RestoreDefaultSmryPara
If mRemoteAccess = True Then
    optDetailed.Value = True
    AddSmryParaLayer mClear:=True
End If

If mRemoteAccess = True Then
    datRecset.open "Select * from IndrPymtHdr inner join PatMast on IndrPymtHdr.IphPttCode=PatMast.PttCode where IphCode=" & CStr(mIpyCode) & " order by IphDate,IphTime", dbVgnDatabase, adOpenKeyset, adLockOptimistic
Else
    datRecset.open "Select * from IndrPymtHdr inner join PatMast on IndrPymtHdr.IphPttCode=PatMast.PttCode order by IphDate,IphTime", dbVgnDatabase, adOpenKeyset, adLockOptimistic
End If
Mfgrd1.FixedCols = 0
Call SmryList

Mfgrd2.FixedRows = 1: Mfgrd2.FixedCols = 0: Mfgrd2.Rows = 2: Mfgrd2.Cols = MFGRD2_COLS: SetGridAutoHeight Mfgrd2

colcnt = X2IPYICODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2IPYICODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2IPYSNO_COL: Mfgrd2.ColWidth(colcnt) = mskIpySno.Width: Mfgrd2.TextMatrix(0, colcnt) = "Sno": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2IRCVCHNO_COL: Mfgrd2.ColWidth(colcnt) = mskIrcVchNo.Width: Mfgrd2.TextMatrix(0, colcnt) = "Vch.No": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2IRCVTMNAME_COL: Mfgrd2.ColWidth(colcnt) = txtIrcVtmName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Vch.Type": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2IRCDATE_COL: Mfgrd2.ColWidth(colcnt) = dtpIrcDate.Width: Mfgrd2.TextMatrix(0, colcnt) = "Vch.Date": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2IRCAMTAFTDISC_COL: Mfgrd2.ColWidth(colcnt) = mskIrcAmtAftDisc.Width: Mfgrd2.TextMatrix(0, colcnt) = "Amount": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2IRCADVAMT_COL: Mfgrd2.ColWidth(colcnt) = mskIrcAdvAmt.Width: Mfgrd2.TextMatrix(0, colcnt) = "Adv.Amt": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2IRCRECDAMT_COL: Mfgrd2.ColWidth(colcnt) = mskIrcRecdAmt.Width: Mfgrd2.TextMatrix(0, colcnt) = "Recd.Amt": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2IRCDEPOAMTEXCL_COL: Mfgrd2.ColWidth(colcnt) = mskIrcDepoAmtExcl.Width: Mfgrd2.TextMatrix(0, colcnt) = "PreDepo.Amt": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2IPYDEPOAMT_COL: Mfgrd2.ColWidth(colcnt) = mskIpyDepoAmt.Width: Mfgrd2.TextMatrix(0, colcnt) = "Depo.Amt": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2IRCREFUAMT_COL: Mfgrd2.ColWidth(colcnt) = mskIrcRefuAmt.Width: Mfgrd2.TextMatrix(0, colcnt) = "Refund.Amt": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2IRCBALAMT_COL: Mfgrd2.ColWidth(colcnt) = mskIrcBalAmt.Width: Mfgrd2.TextMatrix(0, colcnt) = "Bal.Amt": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2IRCCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2IRCCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2IPYRECSTATE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2IPYRECSTATE_COL": Mfgrd2.ColAlignment(colcnt) = 7

colcnt = X2IPYSNO_COL: mskIpySno.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2IRCVCHNO_COL: mskIrcVchNo.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2IRCVTMNAME_COL: txtIrcVtmName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2IRCDATE_COL: dtpIrcDate.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2IRCAMTAFTDISC_COL: mskIrcAmtAftDisc.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2IRCADVAMT_COL: mskIrcAdvAmt.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2IRCRECDAMT_COL: mskIrcRecdAmt.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2IRCDEPOAMTEXCL_COL: mskIrcDepoAmtExcl.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2IPYDEPOAMT_COL: mskIpyDepoAmt.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2IRCREFUAMT_COL: mskIrcRefuAmt.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2IRCBALAMT_COL: mskIrcBalAmt.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
cmdOK.Left = mskIrcBalAmt.Left + mskIrcBalAmt.Width

lblIrcAmtAftDiscTot.Left = mskIrcAmtAftDisc.Left - frFooter.Left: lblIrcAmtAftDiscTot.Width = mskIrcAmtAftDisc.Width
lblIrcAdvAmtTot.Left = mskIrcAdvAmt.Left - frFooter.Left: lblIrcAdvAmtTot.Width = mskIrcAdvAmt.Width
lblIrcRecdAmtTot.Left = mskIrcRecdAmt.Left - frFooter.Left: lblIrcRecdAmtTot.Width = mskIrcRecdAmt.Width
lblIrcDepoAmtExclTot.Left = mskIrcDepoAmtExcl.Left - frFooter.Left: lblIrcDepoAmtExclTot.Width = mskIrcDepoAmtExcl.Width
lblIpyDepoAmtTot.Left = mskIpyDepoAmt.Left - frFooter.Left: lblIpyDepoAmtTot.Width = mskIpyDepoAmt.Width
lblIrcRefuAmtTot.Left = mskIrcRefuAmt.Left - frFooter.Left: lblIrcRefuAmtTot.Width = mskIrcRefuAmt.Width
lblIrcBalAmtTot.Left = mskIrcBalAmt.Left - frFooter.Left: lblIrcBalAmtTot.Width = mskIrcBalAmt.Width

ShowEntryMode False
VisibleControls False
ShowStatusBarText StatusBar1

End Sub

Private Sub StatusBar1_PanelClick(ByVal Panel As MSComctlLib.Panel)
ShowStatusBarText StatusBar1
End Sub

Private Sub Form_Resize()
lblFormHeading.Width = Me.Width
cmdFormEscape.Left = Me.Width - (cmdFormEscape.Width * 2)
cmdFormEnter.Left = Me.Width + cmdFormEscape.Width
frFormSmry.Left = (Me.Width - frFormSmry.Width) / 2: frFormSmry.Top = cmbFormEntryMode.Top + (cmbFormEntryMode.Height * 2)
frFormDtl.Left = (Me.Width - frFormDtl.Width) / 2: frFormDtl.Top = frFormSmry.Top

End Sub

Private Sub Form_Unload(Cancel As Integer)
Set clsVGNOPT = Nothing
Set clsJRN = Nothing
Set clsAH = Nothing
Set clsIPG = Nothing
Set clsIPY = Nothing
Set clsIRC = Nothing
Set clsPAT = Nothing
Set clsPCG = Nothing
Set clsDCT = Nothing
Set clsDIG = Nothing
Set clsSRV = Nothing
Set clsARA = Nothing
Set clsSTN = Nothing
Set clsVTM = Nothing
Set fcmbAdmIpgByIpgNo = Nothing
Set fcmbAdmIpgByPttRegNo = Nothing
Set fcmbAdmIpgByPttName = Nothing
Set fcmbPttRegNo = Nothing
Set fcmbPttName = Nothing
Set fcmbIpyVtmName = Nothing
Set fcmbIrcVchNo = Nothing
Set clsListStru = Nothing

CloseTable datRecset
CloseDataSource dbAcDatabase
CloseDataSource dbVgnDatabase
CloseDataSource dbGrpDatabase
CloseDataSource dbComDatabase
End Sub

Private Sub ShowEntryMode(ByVal EntryMode As Boolean)
If Me.Visible = True Then
    txtVoid.SetFocus
End If
frFormSmry.Visible = Not EntryMode: frFormSmry.Enabled = Not EntryMode
frFormDtl.Visible = EntryMode: frFormDtl.Enabled = EntryMode
frHeader.Visible = EntryMode: frHeader.Enabled = EntryMode
frFooter.Visible = EntryMode: frFooter.Enabled = EntryMode
cmdSaveForm.Enabled = EntryMode
If EntryMode = False Then
    FormAddEditMode = cFORM_SMRYMODE
End If

End Sub

Private Function Data_Verify() As Boolean
Dim mPttRegNo As Long, mIpyPttCode As Long, mIpgVchNo As Long, mIpyVchNo As Long
Dim mIrcAmtAftDiscAmtTot As Double, mIrcAdvAmtTot As Double, mIrcRecdAmtTot As Double, mIrcDepoAmtExclTot As Double, mIpyDepoAmtTot As Double, mIrcRefuAmtTot As Double

Data_Verify = False
If FormAddEditMode = cFORM_EDITMODE And Val(mskFormBoundField.Text) < 1 Then
    ErrorBox "Invalid Key Value !!!"
    txtPttName.SetFocus
    GoTo EndSub
End If
Rem patient validation
mIpyPttCode = Val(mskIpyPttCode.Text)
If mIpyPttCode < 1 Then
    ErrorBox "Invalid Key Value !!!"
    txtPttName.SetFocus
    GoTo EndSub
End If
If Trim(txtPttName.Text) = "" Then
    ErrorBox "Invalid Input !!!"
    txtPttName.SetFocus
    GoTo EndSub
End If
mPttRegNo = Val(UnMyNumFmt(mskPttRegNo.Text))
If mPttRegNo < 0 Then
    ErrorBox "Invalid Input !!!"
    mskPttRegNo.SetFocus
    GoTo EndSub
Else
    If mPttRegNo = 0 And clsVGNOPT.mIpyPttRegNoNotZero_bln = True Then
        AlertBox "Prohibited Zero Patient Reg.No. !!!"
        mskPttRegNo.SetFocus
        GoTo EndSub
    End If
End If
Rem indoor registration validation
If Val(mskIpyIpgCode.Text) < 1 Then
    ErrorBox "Invalid Key Value !!!"
    txtPttName.SetFocus
    GoTo EndSub
End If
mIpgVchNo = Val(UnMyNumFmt(mskIpgVchNo.Text))
If mIpgVchNo < 1 Then
    ErrorBox "Invalid Input !!!"
    mskIpgVchNo.SetFocus
    GoTo EndSub
End If
If IsDate(dtpIpgDate.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpIpgDate.SetFocus
    GoTo EndSub
End If
Rem indoor payment receipt validations
mIpyVchNo = Val(UnMyNumFmt(mskIpyVchNo(0).Text))
If mIpyVchNo > 0 Then
    If mIpyVchNo <> mIpyVchNo_old Or Val(fcmbIpyVtmName.BoundText) <> mIpyVtmCode_old Or Ctod(dtpIpyDate.Text) <> mIpyDate_old Or FormAddEditMode = cFORM_ADDMODE Then
        If ChkIsDuplVTypeNo(dbVgnDatabase, dbAcDatabase, mTableName:="IndrPymtHdr", mChkFieldName:="IphVchNo", mChkFieldValue:=mIpyVchNo, mKeyFieldName:="IphCode", mKeyFieldValue:=mIpyCode, mVtmFieldName:="IphVtmCode", mVtmFieldValue:=Val(fcmbIpyVtmName.BoundText), mFinYrFieldName:="IphCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="IphDate", mDateFieldValue:=Ctod(dtpIpyDate.Text)) = True Then
            ErrorBox "Duplicate Voucher No. !!!"
            mskIpyVchNo(0).SetFocus
            ' ---------------
            If FormAddEditMode = True Then
                mIpyVchNo = GetNextVTypeNo(dbVgnDatabase, dbAcDatabase, dbComDatabase, mTableName:="IndrPymtHdr", mFieldName:="IphVchNo", mVtmFieldName:="IphVtmCode", mVtmFieldValue:=Val(fcmbIpyVtmName.BoundText), mFinYrFieldName:="IphCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="IphDate", mDateFieldValue:=Ctod(dtpIpyDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
            Else
                mIpyVchNo = mIpyVchNo_old
            End If
            mskIpyVchNo(0).Text = ToMyNumFmt(mIpyVchNo, mDecimals:=0)
            GoTo EndSub
        End If
    End If
Else
    ErrorBox "Invalid Input !!!"
    mskIpyVchNo(0).SetFocus
    GoTo EndSub
End If
If IsDate(dtpIpyDate.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpIpyDate.SetFocus
    GoTo EndSub
Else
    If IsFinYrDate(Ctod(dtpIpyDate.Text)) = False Then
        ErrorBox "Invalid Input !!!"
        dtpIpyDate.SetFocus
        GoTo EndSub
    End If
End If
If TimeToMin(txtIpyTime_str.Text) > cDAYMINUTES Then
    ErrorBox "Invalid Input !!!"
    txtIpyTime_str.SetFocus
    GoTo EndSub
End If
mIpyDepoAmtTot = Val(UnMyNumFmt(lblIpyDepoAmtTot.Caption))
If mIpyDepoAmtTot < 0 Then
    ErrorBox "Invalid Input !!!"
    Mfgrd2.SetFocus
    GoTo EndSub
End If
mIrcAmtAftDiscAmtTot = Val(UnMyNumFmt(lblIrcAmtAftDiscTot.Caption))
mIrcAdvAmtTot = Val(UnMyNumFmt(lblIrcAdvAmtTot.Caption))
mIrcRecdAmtTot = Val(UnMyNumFmt(lblIrcRecdAmtTot.Caption))
mIrcDepoAmtExclTot = Val(UnMyNumFmt(lblIrcDepoAmtExclTot.Caption))
mIrcRefuAmtTot = Val(UnMyNumFmt(lblIrcRefuAmtTot.Caption))
If (mIrcAdvAmtTot + mIrcRecdAmtTot + mIrcDepoAmtExclTot + mIpyDepoAmtTot) > mIrcAmtAftDiscAmtTot Then
    ErrorBox "Excess Received Amount !!!"
    Mfgrd2.SetFocus
    GoTo EndSub
End If

Data_Verify = True

EndSub:
Exit Function

End Function

Private Function Data_NetwAuth() As Boolean
Dim mIpyVchNo As Long
Data_NetwAuth = False

mIpyVchNo = Val(UnMyNumFmt(mskIpyVchNo(0).Text))
If mIpyVchNo <> mIpyVchNo_old Or Val(fcmbIpyVtmName.BoundText) <> mIpyVtmCode_old Or Ctod(dtpIpyDate.Text) <> mIpyDate_old Or FormAddEditMode = cFORM_ADDMODE Then
    If ChkIsDuplVTypeNo(dbVgnDatabase, dbAcDatabase, mTableName:="IndrPymtHdr", mChkFieldName:="IphVchNo", mChkFieldValue:=mIpyVchNo, mKeyFieldName:="IphCode", mKeyFieldValue:=mIpyCode, mVtmFieldName:="IphVtmCode", mVtmFieldValue:=Val(fcmbIpyVtmName.BoundText), mFinYrFieldName:="IphCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="IphDate", mDateFieldValue:=Ctod(dtpIpyDate.Text)) = True Then
        ErrorBox "Duplicate Voucher No. !!!"
        mskIpyVchNo(0).SetFocus
        ' ---------------
        If FormAddEditMode = True Then
            mIpyVchNo = GetNextVTypeNo(dbVgnDatabase, dbAcDatabase, dbComDatabase, mTableName:="IndrPymtHdr", mFieldName:="IphVchNo", mVtmFieldName:="IphVtmCode", mVtmFieldValue:=Val(fcmbIpyVtmName.BoundText), mFinYrFieldName:="IphCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="IphDate", mDateFieldValue:=Ctod(dtpIpyDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
        Else
            mIpyVchNo = mIpyVchNo_old
        End If
        mskIpyVchNo(0).Text = ToMyNumFmt(mIpyVchNo, mDecimals:=0)
        Exit Function
    End If
End If

Data_NetwAuth = True

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
Dim srow As Integer, mIpyICode As Long, mDeleteit As Boolean
srow = Mfgrd2.Row
mIpyICode = Val(Mfgrd2.TextMatrix(srow, X2IPYICODE_COL))

If MyDeleteKey(Shift, KeyCode, mCheckCtrlMask:=False) = True And mIpyICode > 0 Then
    mDeleteit = True
    If mDeleteit = True Then
        mDeleteit = CanDelete()
    End If
    If mDeleteit = True Then
        clsIPY.DeleteDtl mIpyCode, mIpyICode
        
        ShowDtlData mIpyCode
        Mfgrd2.Row = srow
        Mfgrd2.SetFocus
        Call Mfgrd2_RowColChange
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
        mskIpySno.Text = ToMyNumFmt(FlexNextSeqno(Mfgrd2, X2IPYSNO_COL), mDecimals:=0)
        mskIrcVchNo.Text = "": fcmbIrcVchNo.BoundText = ""
    Else
        With Mfgrd2
        mskIpySno.Text = .TextMatrix(srow, X2IPYSNO_COL)
        fcmbIrcVchNo.BoundText = .TextMatrix(srow, X2IRCCODE_COL): mskIrcVchNo.Text = ToMyNumFmt(Val(fcmbIrcVchNo.Text), mDecimals:=0)
        txtIrcVtmName.Text = .TextMatrix(srow, X2IRCVTMNAME_COL)
        dtpIrcDate.Text = .TextMatrix(srow, X2IRCDATE_COL)
        mskIrcAmtAftDisc.Text = .TextMatrix(srow, X2IRCAMTAFTDISC_COL)
        mskIrcAdvAmt.Text = .TextMatrix(srow, X2IRCADVAMT_COL)
        mskIrcRecdAmt.Text = .TextMatrix(srow, X2IRCRECDAMT_COL)
        mskIrcDepoAmtExcl.Text = .TextMatrix(srow, X2IRCDEPOAMTEXCL_COL)
        mskIpyDepoAmt.Text = .TextMatrix(srow, X2IPYDEPOAMT_COL)
        mskIrcRefuAmt.Text = .TextMatrix(srow, X2IRCREFUAMT_COL)
        mskIrcBalAmt.Text = .TextMatrix(srow, X2IRCBALAMT_COL)
        End With
    End If
    mskIrcVchNo.SetFocus
    Call ValidDtl
    
    mIrcCode_old = Val(fcmbIrcVchNo.BoundText)
    mIpyDepoAmt_old = Val(UnMyNumFmt(mskIpyDepoAmt.Text))
End If

End Sub

Private Sub Mfgrd2_RowColChange()
ShowActiveFlexRow Mfgrd2

End Sub

Private Sub mskIpyDepoAmt_GotFocus()
FlashActiveControl mskIpyDepoAmt, True
End Sub

Private Sub mskIpyDepoAmt_LostFocus()
FlashActiveControl mskIpyDepoAmt, False
End Sub

Private Sub mskIpyDepoAmt_Validate(Cancel As Boolean)
If chkIpyDepoAmt() = False Then
    mskIpyDepoAmt.SetFocus
    Cancel = True
Else
    Call ValidDtl
End If

End Sub

Private Function chkIpyDepoAmt() As Boolean
Dim mRtnval As Boolean
Dim mIrcAmtAftDisc As Double, mIrcAdvAmt As Double, mIrcRecdAmt As Double, mIrcDepoAmtExcl As Double, mIpyDepoAmt As Double, mIrcRefuAmt As Double, mIrcBalAmt As Double

mRtnval = True
mIrcAmtAftDisc = Val(UnMyNumFmt(mskIrcAmtAftDisc.Text))
mIrcAdvAmt = Val(UnMyNumFmt(mskIrcAdvAmt.Text))
mIrcRecdAmt = Val(UnMyNumFmt(mskIrcRecdAmt.Text))
mIrcDepoAmtExcl = Val(UnMyNumFmt(mskIrcDepoAmtExcl.Text))
mIpyDepoAmt = Val(UnMyNumFmt(mskIpyDepoAmt.Text))
mIrcRefuAmt = Val(UnMyNumFmt(mskIrcRefuAmt.Text))

mskIpyDepoAmt.Text = ToMyNumFmt(mIpyDepoAmt)
If mIpyDepoAmt < 1 Then
    If InterActiveChange(mskIpyDepoAmt) = True Then
        ErrorBox "Invalid Input !!!"
    End If
    mRtnval = False
Else
    If (mIrcAdvAmt + mIrcRecdAmt + mIrcDepoAmtExcl + mIpyDepoAmt) > mIrcAmtAftDisc Then
        If InterActiveChange(mskIpyDepoAmt) = True Then
            ErrorBox "Excess Amount Deposited !!!"
            mskIpyDepoAmt.Text = ToMyNumFmt(mIrcAmtAftDisc - (mIrcAdvAmt + mIrcRecdAmt + mIrcDepoAmtExcl))
            mIpyDepoAmt = Val(UnMyNumFmt(mskIpyDepoAmt.Text))
        End If
        mRtnval = False
    ElseIf mIrcRefuAmt > (mIrcAdvAmt + mIrcRecdAmt + mIrcDepoAmtExcl + mIpyDepoAmt) Then
        If InterActiveChange(mskIpyDepoAmt) = True Then
            ErrorBox "Excess Amount Refunded !!!"
            mskIpyDepoAmt.Text = ToMyNumFmt(mIrcAmtAftDisc - (mIrcAdvAmt + mIrcRecdAmt + mIrcDepoAmtExcl))
            mIpyDepoAmt = Val(UnMyNumFmt(mskIpyDepoAmt.Text))
        End If
        mRtnval = False
    End If
End If
mskIrcBalAmt.Text = ToMyNumFmt(mIrcAmtAftDisc - (mIrcAdvAmt + mIrcRecdAmt + mIrcDepoAmtExcl + mIpyDepoAmt))

chkIpyDepoAmt = mRtnval

End Function

'Private Sub mskIrcAmtAftDisc_GotFocus()
'FlashActiveControl mskIrcAmtAftDisc, True
'End Sub
'
'Private Sub mskIrcAmtAftDisc_LostFocus()
'FlashActiveControl mskIrcAmtAftDisc, False
'End Sub

'Private Sub mskIrcAmtAftDisc_Validate(Cancel As Boolean)
'mskIrcAmtAftDisc.Text = ToMyNumFmt(mskIrcAmtAftDisc.Text)
'If Val(UnMyNumFmt(mskIrcAmtAftDisc.Text)) < 0 Then
'    ErrorBox "Invalid Input !!!"
'    mskIrcAmtAftDisc.SetFocus
'    Cancel = True
'Else
'    Call CalcIrcChg
'    Call ValidDtl
'End If
'
'End Sub

'Private Sub mskIrcBalAmtTot_GotFocus()
'FlashActiveControl mskIrcBalAmtTot, True
'End Sub
'
'Private Sub mskIrcBalAmtTot_LostFocus()
'FlashActiveControl mskIrcBalAmtTot, False
'End Sub

'Private Sub mskIrcBalAmtTot_Validate(Cancel As Boolean)
'If Val(UnMyNumFmt(mskIrcBalAmtTot.Text)) < 0 Then
'    ErrorBox "Invalid Input !!!"
'    mskIrcBalAmtTot.SetFocus
'    Cancel = True
'End If
'
'End Sub

'Private Sub mskIrcDepoAmtTot_GotFocus()
'FlashActiveControl mskIrcDepoAmtTot, True
'End Sub
'
'Private Sub mskIrcDepoAmtTot_LostFocus()
'FlashActiveControl mskIrcDepoAmtTot, False
'End Sub
'
'Private Sub mskIrcDepoAmtTot_Validate(Cancel As Boolean)
'If Val(UnMyNumFmt(mskIrcDepoAmtTot.Text)) < 0 Then
'    ErrorBox "Invalid Input !!!"
'    mskIrcDepoAmtTot.SetFocus
'    Cancel = True
'End If
'
'End Sub

Private Sub mskIpgVchNo_GotFocus()
FlashActiveControl mskIpgVchNo, True
End Sub

Private Sub mskIpgVchNo_LostFocus()
FlashActiveControl mskIpgVchNo, False
End Sub

Private Sub mskIpgVchNo_Validate(Cancel As Boolean)
Dim mIpgVchNo As Long

mIpgVchNo = Val(UnMyNumFmt(mskIpgVchNo.Text))
mskIpgVchNo.Text = ToMyNumFmt(mIpgVchNo, mDecimals:=0)
If mIpgVchNo < 0 Then
    ErrorBox "Invalid Input !!!"
    mskIpgVchNo.SetFocus
    Cancel = True
End If

End Sub

'Private Sub mskIrcRecdAmtTot_GotFocus()
'FlashActiveControl mskIrcRecdAmtTot, True
'End Sub
'
'Private Sub mskIrcRecdAmtTot_LostFocus()
'FlashActiveControl mskIrcRecdAmtTot, False
'End Sub

''Private Sub mskIrcRecdAmtTot_Validate(Cancel As Boolean)
''Dim mIrcRecdAmtTot As Double, mIrcDepoAmtTot As Double, mIrcAmtAftDiscTot As Double
''
''mIrcRecdAmtTot = Val(UnMyNumFmt(mskIrcRecdAmtTot.Text))
''mIrcDepoAmtTot = Val(UnMyNumFmt(mskIrcDepoAmtTot.Text))
''mIrcAmtAftDiscTot = Val(UnMyNumFmt(lblIrcAmtAftDiscTot.Caption))
''
''mskIrcRecdAmtTot.Text = ToMyNumFmt(mIrcRecdAmtTot)
''If mIrcRecdAmtTot < 0 Then
''    ErrorBox "Invalid Input !!!"
''    mskIrcRecdAmtTot.SetFocus
''    Cancel = True
''Else
''    If (mIrcRecdAmtTot + mIrcDepoAmtTot) > mIrcAmtAftDiscTot Then
''        ErrorBox "Excess Received Amount !!!"
''        mIrcRecdAmtTot = mIrcAmtAftDiscTot - mIrcDepoAmtTot
''        mskIrcRecdAmtTot.Text = ToMyNumFmt(mIrcRecdAmtTot)
''        mskIrcRecdAmtTot.SetFocus
''        Cancel = True
''    Else
''        If FormAddEditMode = cFORM_ADDMODE Or mIrcRecdAmtTot <> mIrcRecdAmtTot_old Then
''            DisperseRecdAmt mIpyCode
''            ShowDtlData mIpyCode
''        End If
''
''    End If
''End If
''
''End Sub

Private Sub mskIpyVchNo_GotFocus(Index As Integer)
FlashActiveControl mskIpyVchNo(Index), True
End Sub

Private Sub mskIpyVchNo_LostFocus(Index As Integer)
FlashActiveControl mskIpyVchNo(Index), False
End Sub

Private Sub mskIpyVchNo_Validate(Index As Integer, Cancel As Boolean)
Dim mIpyVchNo As Long

mIpyVchNo = Val(UnMyNumFmt(mskIpyVchNo(Index).Text))
If mIpyVchNo < 0 And Index = 0 Then
    mIpyVchNo = GetNextVTypeNo(dbVgnDatabase, dbAcDatabase, dbComDatabase, mTableName:="IndrPymtHdr", mFieldName:="IphVchNo", mVtmFieldName:="IphVtmCode", mVtmFieldValue:=Val(fcmbIpyVtmName.BoundText), mFinYrFieldName:="IphCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="IphDate", mDateFieldValue:=Ctod(dtpIpyDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
    mskIpyVchNo(Index).Text = ToMyNumFmt(mIpyVchNo, mDecimals:=0)
ElseIf mIpyVchNo > 0 And Index = 0 Then
    If mIpyVchNo <> mIpyVchNo_old Or Val(fcmbIpyVtmName.BoundText) <> mIpyVtmCode_old Or Ctod(dtpIpyDate.Text) <> mIpyDate_old Or FormAddEditMode = cFORM_ADDMODE Then
        If ChkIsDuplVTypeNo(dbVgnDatabase, dbAcDatabase, mTableName:="IndrPymtHdr", mChkFieldName:="IphVchNo", mChkFieldValue:=mIpyVchNo, mKeyFieldName:="IphCode", mKeyFieldValue:=mIpyCode, mVtmFieldName:="IphVtmCode", mVtmFieldValue:=Val(fcmbIpyVtmName.BoundText), mFinYrFieldName:="IphCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="IphDate", mDateFieldValue:=Ctod(dtpIpyDate.Text)) = True Then
            ErrorBox "Duplicate Voucher No. !!!"
            Cancel = True
            mskIpyVchNo(Index).SetFocus
            ' ----------
            If FormAddEditMode = cFORM_ADDMODE Then
                mIpyVchNo = GetNextVTypeNo(dbVgnDatabase, dbAcDatabase, dbComDatabase, mTableName:="IndrPymtHdr", mFieldName:="IphVchNo", mVtmFieldName:="IphVtmCode", mVtmFieldValue:=Val(fcmbIpyVtmName.BoundText), mFinYrFieldName:="IphCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="IphDate", mDateFieldValue:=Ctod(dtpIpyDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
            Else
                mIpyVchNo = mIpyVchNo_old
            End If
            mskIpyVchNo(Index).Text = ToMyNumFmt(mIpyVchNo, mDecimals:=0)
        End If
    End If
    If Cancel = False Then
        mskIpyVchNo(Index).Text = ToMyNumFmt(mIpyVchNo, mDecimals:=0)
    End If
ElseIf mIpyVchNo < 1 Then
    ErrorBox "Invalid Input !!!"
    mskIpyVchNo(Index).SetFocus
    Cancel = True
End If

End Sub

Private Sub mskIrcVchNo_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call mskIrcVchNo_Change
End If

End Sub

Private Sub mskPttAgeDy_GotFocus()
FlashActiveControl mskPttAgeDy, True
End Sub

Private Sub mskPttAgeDy_LostFocus()
FlashActiveControl mskPttAgeDy, False
End Sub

Private Sub mskPttAgeMn_GotFocus()
FlashActiveControl mskPttAgeMn, True
End Sub

Private Sub mskPttAgeMn_LostFocus()
FlashActiveControl mskPttAgeMn, False
End Sub

Private Sub mskPttAgeYr_GotFocus()
FlashActiveControl mskPttAgeYr, True
End Sub

Private Sub mskPttAgeYr_LostFocus()
FlashActiveControl mskPttAgeYr, False
End Sub

Private Sub mskPttRegNo_GotFocus()
FlashActiveControl mskPttRegNo, True
End Sub

Private Sub mskPttRegNo_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call ShowOldIpgListByPttRegNo
ElseIf MyAddNewKey(Shift, KeyCode) = True Then
    If FormAddEditMode = cFORM_ADDMODE Then
        clsIPY.EndTran mIpyCode
        Call Data_AddEvent
    Else
        AlertBox "Prohibited in Edit Mode !!!"
    End If
End If

End Sub

Private Sub mskPttRegNo_LostFocus()
FlashActiveControl mskPttRegNo, False
End Sub

Private Sub mskPttRegNo_Validate(Cancel As Boolean)
Dim mPttRegNo As Long

mPttRegNo = Val(UnMyNumFmt(mskPttRegNo.Text))
If mPttRegNo < 0 Then
    ErrorBox "Invalid Input !!!"
    Rem Cancel = True
    Rem mskPttRegNo.SetFocus
Else
    If mPttRegNo <> mPttRegNo_old Or FormAddEditMode = cFORM_ADDMODE Then
        If mPttRegNo = 0 And clsVGNOPT.mIpyPttRegNoNotZero_bln = True Then
            AlertBox "Prohibited Zero Patient Reg.No. !!!"
        End If
    End If
End If

End Sub

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

Private Sub optPatientwise_GotFocus()
FlashActiveControl optPatientwise, True
End Sub

Private Sub optPatientwise_LostFocus()
FlashActiveControl optPatientwise, False
End Sub

Private Sub txtAraName_GotFocus()
FlashActiveControl txtAraName, True
End Sub

Private Sub txtAraName_LostFocus()
FlashActiveControl txtAraName, False
End Sub

Private Sub txtCDctName_GotFocus()
FlashActiveControl txtCDctName, True
End Sub

Private Sub txtCDctName_LostFocus()
FlashActiveControl txtCDctName, False
End Sub

Private Sub txtFDigName_GotFocus()
FlashActiveControl txtFDigName, True
End Sub

Private Sub txtFDigName_LostFocus()
FlashActiveControl txtFDigName, False
End Sub

Private Sub txtIphRemark_GotFocus()
FlashActiveControl txtIphRemark, True
End Sub

Private Sub txtIphRemark_LostFocus()
FlashActiveControl txtIphRemark, False
End Sub

Private Sub txtIphRemark_Validate(Cancel As Boolean)
txtIphRemark.Text = ToMyWord(txtIphRemark.Text)
End Sub

Private Sub txtIpgTime_str_GotFocus()
FlashActiveControl txtIpgTime_str, True
End Sub

Private Sub txtIpgTime_str_LostFocus()
FlashActiveControl txtIpgTime_str, False
End Sub

Private Sub txtIpgTime_str_Validate(Cancel As Boolean)
txtIpgTime_str.Text = MinToTime(TimeToMin(txtIpgTime_str.Text))
If TimeToMin(txtIpgTime_str.Text) > cDAYMINUTES Then
    ErrorBox "Invalid Input !!!"
    txtIpgTime_str.SetFocus
    Cancel = True
End If

End Sub

Private Sub txtIpyTime_str_GotFocus()
FlashActiveControl txtIpyTime_str, True
End Sub

Private Sub txtIpyTime_str_LostFocus()
FlashActiveControl txtIpyTime_str, False
End Sub

Private Sub txtIpyTime_str_Validate(Cancel As Boolean)
txtIpyTime_str.Text = MinToTime(TimeToMin(txtIpyTime_str.Text))
If TimeToMin(txtIpyTime_str.Text) > cDAYMINUTES Then
    ErrorBox "Invalid Input !!!"
    txtIpyTime_str.SetFocus
    Cancel = True
End If

End Sub

Private Sub txtIpyVtmName_Change(Index As Integer)
If fcmbIpyVtmName.CallFromText_Change = False Then
    fcmbIpyVtmName.CallFromText_Change = True
    If InterActiveChange(txtIpyVtmName(Index)) = True Then
        fcmbIpyVtmName.UserText = Array(txtIpyVtmName(Index).Text, txtIpyVtmName(Index).SelStart)
        fcmbIpyVtmName.Show
        txtIpyVtmName(Index).Text = fcmbIpyVtmName.Text
        If fcmbIpyVtmName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbIpyVtmName.CallFromText_Change = False
End If

End Sub

Private Sub txtIpyVtmName_GotFocus(Index As Integer)
FlashActiveControl txtIpyVtmName(Index), True
End Sub

Private Sub txtIpyVtmName_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtIpyVtmName_Change(Index)
ElseIf MyAddNewKey(Shift, KeyCode) = True Then

ElseIf Shift = 0 And KeyCode = vbKeyF6 Then
    Rem Call ShowOldIpgListByIpgNo show here all indoor receipt details
End If

End Sub

Private Sub txtIpyVtmName_LostFocus(Index As Integer)
FlashActiveControl txtIpyVtmName(Index), False
End Sub

Private Sub txtIpyVtmName_Validate(Index As Integer, Cancel As Boolean)
Dim mIpyVchNo As Long

If Val(fcmbIpyVtmName.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    txtIpyVtmName(Index).SetFocus
    Cancel = True
ElseIf Index = 0 Then
    If Val(fcmbIpyVtmName.BoundText) <> mIpyVtmCode_old Or Ctod(dtpIpyDate.Text) <> mIpyDate_old Or FormAddEditMode = cFORM_ADDMODE Then
        mIpyVchNo = GetNextVTypeNo(dbVgnDatabase, dbAcDatabase, dbComDatabase, mTableName:="IndrPymtHdr", mFieldName:="IphVchNo", mVtmFieldName:="IphVtmCode", mVtmFieldValue:=Val(fcmbIpyVtmName.BoundText), mFinYrFieldName:="IphCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="IphDate", mDateFieldValue:=Ctod(dtpIpyDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
        mskIpyVchNo(Index).Text = ToMyNumFmt(mIpyVchNo, mDecimals:=0)
    End If
End If

End Sub

Private Sub txtPttAddr_GotFocus()
FlashActiveControl txtPttAddr, True
End Sub

Private Sub txtPttAddr_LostFocus()
FlashActiveControl txtPttAddr, False
End Sub

Private Sub txtPttAddr_Validate(Cancel As Boolean)
txtPttAddr.Text = ToMyWord(txtPttAddr.Text)
End Sub

Private Sub txtPttName_GotFocus()
FlashActiveControl txtPttName, True
End Sub

Private Sub txtPttName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call ShowOldIpgListByPttName
ElseIf MyAddNewKey(Shift, KeyCode) = True Then
    If FormAddEditMode = cFORM_ADDMODE Then
        clsIPY.EndTran mIpyCode
        Call Data_AddEvent
    Else
        AlertBox "Prohibited in Edit Mode !!!"
    End If
End If

End Sub

Private Sub txtPttName_LostFocus()
FlashActiveControl txtPttName, False
End Sub

Private Sub txtPttName_Validate(Cancel As Boolean)
txtPttName.Text = ToMyWord(txtPttName.Text)
If Trim(txtPttName.Text) = "" Then
    ErrorBox "Invalid Input !!!"
    Rem Cancel = True
    Rem txtPttName.SetFocus
End If

End Sub

Private Sub Data_AddEvent()

If CanUserAddOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If clsIPY.BeginTran(0) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_ADDMODE

clsIPY.ClearHdr: clsIPY.ClearDtl
clsIPG.Clear
clsPAT.Clear

mIpyCode = clsIPY.ActiveTrnCode
mIpyIpgCode = 0
mIpyPttCode = 0

ShowIpyData mIpyCode
ShowIpgData mIpyIpgCode
ShowPatData mIpyPttCode

Rem restoring user editing features
Call ShowIpyDefData
Call ShowPatDefData
Call ShowIpgDefData

Rem old values
Call StoreIpyOldData
Call StorePatOldData
Call StoreIpgOldData

Call ShowEntryMode(True)
txtPttName.SetFocus

End Sub

Private Sub Data_EditEvent()

If CanUserEditOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If clsIPY.BeginTran(datRecset.fields("IphCode")) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_EDITMODE

With datRecset
mIpyCode = .fields("IphCode")
mIpyIpgCode = .fields("IphIpgCode")
mIpyPttCode = .fields("IphPttCode")

clsIPY.GetHdrData mIpyCode
clsIPG.GetData mIpyIpgCode
clsPAT.GetData mIpyPttCode
End With

ShowIpyData mIpyCode
ShowIpgData mIpyIpgCode
ShowPatData mIpyPttCode

Rem old values
Call StoreIpyOldData
Call StoreIpgOldData
Call StorePatOldData

Call ShowEntryMode(True)
txtPttName.SetFocus

End Sub

Private Sub ShowPatData(ByVal mPttCode As Long)

With clsPAT
.GetData mPttCode

mskIpyPttCode.Text = mPttCode
txtPttName.Text = .mName_str
mskPttRegNo.Text = ToMyNumFmt(.mPttRegNo_lng, mDecimals:=0)
dtpPttRegDate.Text = Dtoc(.mPttRegDate_dt)
txtPttSex.Text = .mPttSex_str
mskPttAgeYr.Text = 0
mskPttAgeMn.Text = 0
mskPttAgeDy.Text = 0
dtpPttAgeAsOnDt.Text = Dtoc(.mPttAgeAsOnDt_dt)
dtpPttDob.Text = Dtoc(.mPttDob_dt)
clsPCG.GetData .mPttPcgCode_lng: txtPcgName.Text = clsPCG.mName_str
txtPttRefRela.Text = .mPttRefRela_str
txtPttRefName.Text = .mPttRefName_str
txtPttAddr.Text = .mPttAddr_str
clsARA.GetData .mPttAraCode_lng: txtAraName.Text = clsARA.mName_str
clsSTN.GetData .mPttStnCode_lng: txtStnName.Text = clsSTN.mName_str
txtPttTelNo.Text = .mPttTelNo_str
txtPttSMSNo.Text = .mPttSMSNo_str
End With

Call ShowPatAge
'Call ShowPatBal

Rem disallow editing for exising patients, strictly from patient master only
txtPttName.Locked = (mPttCode > 0)
mskPttRegNo.Locked = (mPttCode > 0)
dtpPttRegDate.Locked = (mPttCode > 0)
txtPttSex.Locked = (mPttCode > 0)
mskPttAgeYr.Locked = (mPttCode > 0)
mskPttAgeMn.Locked = (mPttCode > 0)
mskPttAgeDy.Locked = (mPttCode > 0)
dtpPttAgeAsOnDt.Locked = (mPttCode > 0)
dtpPttDob.Locked = (mPttCode > 0)
txtPcgName.Locked = (mPttCode > 0)
txtPttRefRela.Locked = (mPttCode > 0)
txtPttRefName.Locked = (mPttCode > 0)
txtPttAddr.Locked = (mPttCode > 0)
txtAraName.Locked = (mPttCode > 0)
txtStnName.Locked = (mPttCode > 0)
txtPttTelNo.Locked = (mPttCode > 0)
txtPttSMSNo.Locked = (mPttCode > 0)

End Sub

Private Sub ShowPatDefData()
dtpPttRegDate.Text = Dtoc(DefaultEntryDate)
dtpPttAgeAsOnDt.Text = dtpPttRegDate.Text

End Sub

Private Sub StorePatOldData()
mPttRegNo_old = Val(UnMyNumFmt(mskPttRegNo.Text))

End Sub

Private Sub ShowPatBal()
Dim mOpnBal As Double, mCurBal As Double, mLCount As Integer, mUCount As Integer, mCount As Integer

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
''lblAhCurBal.Caption = ToMyAcFmt(mCurBal)
''txtDrCrFlag.Text = SenseDrCrFlag(mOpnBal)

End Sub

Private Sub ShowIpgData(ByVal mIpgCode As Long)

With clsIPG
.GetData mIpgCode

mskIpyIpgCode.Text = mIpgCode
clsVTM.GetData .mVtmCode_lng: txtIpgVtmName.Text = clsVTM.mName_str
txtIpgPrefix.Text = .mIpgPrefix_str
mskIpgVchNo.Text = ToMyNumFmt(.mVchNo_lng, mDecimals:=0)
dtpIpgDate.Text = Dtoc(.mVchDate_dt)
txtIpgTime_str.Text = MinToTime(.mIpgTime_lng)
clsDCT.GetData .mIpgCDctCode_lng: txtCDctName.Text = clsDCT.mName_str
clsDCT.GetData .mIpgRByCode_lng: txtRByName.Text = clsDCT.mName_str
clsDIG.GetData .mIpgFDigCode_lng: txtFDigName.Text = clsDIG.mName_str
txtIpgRemark.Text = .mIpgRemark_str
End With

txtIpgVtmName.Locked = (mIpgCode > 0)
txtIpgPrefix.Locked = (mIpgCode > 0)
mskIpgVchNo.Locked = (mIpgCode > 0)
dtpIpgDate.Locked = (mIpgCode > 0)
txtIpgTime_str.Locked = (mIpgCode > 0)
txtCDctName.Locked = (mIpgCode > 0)
txtRByName.Locked = (mIpgCode > 0)
txtFDigName.Locked = (mIpgCode > 0)
txtIpgRemark.Locked = (mIpgCode > 0)

End Sub

Private Sub ShowIpgDefData()
Dim mIpgVchNo As Long

dtpIpgDate.Text = Dtoc(DefaultEntryDate)
txtIpgTime_str.Text = MinToTime(TimeToMin(DateTime.Time$))
txtIpgVtmName.Text = ""
txtIpgPrefix.Text = ""
mskIpgVchNo.Text = 0

End Sub

Private Sub StoreIpgOldData()
Rem nothing
End Sub

Private Sub ShowIpyData(ByVal mIpyCode As Long)

With clsIPY
.GetHdrData mIpyCode

mskFormBoundField.Text = mIpyCode
fcmbIpyVtmName.BoundText = CStr(.mTrnVtmCode_lng): txtIpyVtmName(0).Text = fcmbIpyVtmName.Text
txtIpyPrefix.Text = .mTrnPrefix_str
mskIpyVchNo(0).Text = ToMyNumFmt(.mTrnVchNo_lng, mDecimals:=0)
dtpIpyDate.Text = Dtoc(.mTrnDate_dt)
txtIpyTime_str.Text = MinToTime(.mIphTime_lng)
txtIphRemark.Text = .mIphRemark_str
Rem old indoor receipt
mIpyOldIpyCode = .mIphOldIphCode_lng
ShowOldIpyCodeDesc mIpyOldIpyCode
End With

'Call CalcIrcChg
ShowDtlData mIpyCode

End Sub

Private Sub ShowIpyDefData()
Dim mIpyVchNo As Long

dtpIpyDate.Text = Dtoc(DefaultEntryDate)
txtIpyTime_str.Text = MinToTime(TimeToMin(DateTime.Time$))

fcmbIpyVtmName.BoundText = CStr(clsVGNOPT.GetIndrPymtOptBoundCode("IpyVtmCode")): txtIpyVtmName(0).Text = fcmbIpyVtmName.Text

mIpyVchNo = GetNextVTypeNo(dbVgnDatabase, dbAcDatabase, dbComDatabase, mTableName:="IndrPymtHdr", mFieldName:="IphVchNo", mVtmFieldName:="IphVtmCode", mVtmFieldValue:=Val(fcmbIpyVtmName.BoundText), mFinYrFieldName:="IphCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="IphDate", mDateFieldValue:=Ctod(dtpIpyDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
mskIpyVchNo(0).Text = ToMyNumFmt(mIpyVchNo, mDecimals:=0)

End Sub

Private Sub StoreIpyOldData()
mIpyCode_old = mIpyCode
mIpyDate_old = Ctod(dtpIpyDate.Text)
mIpyVtmCode_old = Val(fcmbIpyVtmName.BoundText)
mIpyVchNo_old = Val(UnMyNumFmt(mskIpyVchNo(0).Text))

End Sub

Private Sub ShowDtlData(ByVal mIpyCode As Long)
Dim srow As Integer, tRecset As New ADODB.Recordset, mColCnt As Integer

srow = 1
Mfgrd2.Rows = 2

With tRecset
.open "Select * from IndrPymtDtl where IpyCode=" & CStr(mIpyCode) & " order by IpySno", dbVgnDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Do While .EOF = False
        If InList(.fields("IpyRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
            clsIRC.GetHdrData .fields("IpyIhrCode")
            clsVTM.GetData clsIRC.mTrnVtmCode_lng
            
            Mfgrd2.TextMatrix(srow, X2IPYICODE_COL) = .fields("IpyICode")
            Mfgrd2.TextMatrix(srow, X2IPYSNO_COL) = ToMyNumFmt(.fields("IpySno"), mDecimals:=0)
            Mfgrd2.TextMatrix(srow, X2IRCVCHNO_COL) = clsIRC.mTrnVchNo_lng
            Mfgrd2.TextMatrix(srow, X2IRCVTMNAME_COL) = clsVTM.mName_str
            Mfgrd2.TextMatrix(srow, X2IRCDATE_COL) = clsIRC.mTrnDate_dt
            Mfgrd2.TextMatrix(srow, X2IRCAMTAFTDISC_COL) = ToMyNumFmt(clsIRC.mIhrAmtAftDisc_dbl)
            Mfgrd2.TextMatrix(srow, X2IRCADVAMT_COL) = ToMyNumFmt(clsIRC.mIhrAdvAmt_dbl)
            Mfgrd2.TextMatrix(srow, X2IRCRECDAMT_COL) = ToMyNumFmt(clsIRC.mIhrRecdAmt_dbl)
            Mfgrd2.TextMatrix(srow, X2IRCDEPOAMTEXCL_COL) = ToMyNumFmt(clsIRC.mIhrDepoAmt_dbl - .fields("IpyDepoAmt"))
            Mfgrd2.TextMatrix(srow, X2IPYDEPOAMT_COL) = ToMyNumFmt(.fields("IpyDepoAmt"))
            Mfgrd2.TextMatrix(srow, X2IRCREFUAMT_COL) = ToMyNumFmt(clsIRC.mIhrRefuAmt_dbl)
            Mfgrd2.TextMatrix(srow, X2IRCBALAMT_COL) = ToMyNumFmt(clsIRC.mIhrBalAmt_dbl)
            Mfgrd2.TextMatrix(srow, X2IRCCODE_COL) = .fields("IpyIhrCode")
            Mfgrd2.TextMatrix(srow, X2IPYRECSTATE_COL) = .fields("IpyRecState")
            
            Mfgrd2.Rows = Mfgrd2.Rows + 1
            srow = srow + 1
        Else
            If InList(.fields("IpyRecState"), Array(cREC_CANCELED, cREC_DELETED)) = False Then
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

Call CalcFtrTotal

End Sub

Private Sub Data_SaveEvent()

With clsIPY
If FormAddEditMode = cFORM_ADDMODE Then
    .ClearHdr
Else
    .GetHdrData mIpyCode
End If
.mTrnDate_dt = Ctod(dtpIpyDate.Text)
.mTrnVtmCode_lng = Val(fcmbIpyVtmName.BoundText)
.mTrnPrefix_str = txtIpyPrefix.Text
.mTrnVchNo_lng = Val(UnMyNumFmt(mskIpyVchNo(0).Text))
.mTrnPostfix_str = ""
.mTrnCmpCode_int = sFinYrCmpCode

.mIphTime_lng = TimeToMin(txtIpyTime_str.Text)
.mIphIpgCode_lng = mIpyIpgCode
.mIphPttCode_lng = mIpyPttCode
.mIphOldIphCode_lng = mIpyOldIpyCode
.mIphDepoAmt_dbl = Val(UnMyNumFmt(lblIpyDepoAmtTot.Caption))
.mIphRemark_str = txtIphRemark.Text

If FormAddEditMode = cFORM_ADDMODE Then
    .AddNewHdr
    mskFormBoundField.Text = .mTrnCode_lng
Else
    .UpdateHdr mIpyCode
End If
If .mTrnCode_lng > 0 Then   ' updated successfully
    mIpyCode = .mTrnCode_lng
    
    .UpdateTran .mTrnCode_lng
    .EndTran .mTrnCode_lng
        
    Rem updating user editing carry forward features
    clsVGNOPT.mIpyVtmCodeOld_lng = .mTrnVtmCode_lng
    clsVGNOPT.UpdateIndrPymtOld
    
    mEntrySaved = True
Else
    Call Data_CancelEvent
    ErrorBox "Entry Cancelled !!!"
End If
End With

If clsIPY.mTrnCode_lng > 0 Then   ' updated successfully
'''    Rem refreshing required here if new account created done at form_activate
'''    If clsAH.BeginAchd(Val(fcmbAhName.BoundText)) = True Then
'''        'clsAH.EditOpnBal mJrnICode:=clsAH.OpnICode(clsAH.LOpnBal), mJrnAmt:=Val(UnMyAcFmt(mskAhOpBal.Text, txtDrCrFlag.Text))
'''        clsAH.Update Val(fcmbAhName.BoundText), mUpdOpnBalOnly:=True
'''        clsAH.UpdateAchd Val(fcmbAhName.BoundText)
'''        clsAH.EndAchd Val(fcmbAhName.BoundText)
'''    End If
'''    If FormAddEditMode = cFORM_ADDMODE Then
'''        clsAH.UpdateDependency Val(fcmbAhName.BoundText), True
'''    Else
'''        If mPttAhCode_old <> Val(fcmbAhName.BoundText) Then
'''            clsAH.UpdateDependency mPttAhCode_old, False
'''            clsAH.UpdateDependency Val(fcmbAhName.BoundText), True
'''        End If
'''    End If
    
'''    mEntrySaved = True
'''Else
'''    Call Data_CancelEvent
'''    ErrorBox "Entry Cancelled !!!"
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

mIpyCode = datRecset.fields("IphCode")
mIpyPttCode = datRecset.fields("IphPttCode")
mRecAbsPos = datRecset.AbsolutePosition

If clsIPY.CanDeleteTran(mIpyCode) = True Then
    txtVoid.SetFocus
    If clsIPY.BeginTran(mIpyCode) = True Then
        clsIPY.DeleteTran mIpyCode
        clsIPY.UpdateTran mIpyCode
        clsIPY.EndTran mIpyCode
    
        Call SmryList
        If datRecset.RecordCount > mRecAbsPos And mRecAbsPos > 0 Then
            datRecset.Move mRecAbsPos - 1, 1
        Else
            MoveRecToLast datRecset
        End If
        
        Rem clsAH.UpdateDependency mPttAhCode, False
    End If
    ShowRecActiveFlexRow datRecset, Mfgrd1
    Mfgrd1.SetFocus
Else
    Mfgrd1.SetFocus
End If

End Sub

Private Sub Data_CancelEvent()
clsIPY.CancelTran mIpyCode
clsIPY.EndTran mIpyCode

mEntryAborted = True

End Sub

Private Sub txtPttRefName_GotFocus()
FlashActiveControl txtPttRefName, True
End Sub

Private Sub txtPttRefName_LostFocus()
FlashActiveControl txtPttRefName, False
End Sub

Private Sub txtPttRefName_Validate(Cancel As Boolean)
txtPttRefName.Text = ToMyWord(txtPttRefName.Text)
End Sub

Private Sub txtPttRefRela_GotFocus()
FlashActiveControl txtPttRefRela, True
End Sub

Private Sub txtPttRefRela_LostFocus()
FlashActiveControl txtPttRefRela, False
End Sub

Private Sub txtPttSex_GotFocus()
FlashActiveControl txtPttSex, True
End Sub

Private Sub txtPttSex_LostFocus()
FlashActiveControl txtPttSex, False
End Sub

Private Sub txtPttSMSNo_GotFocus()
FlashActiveControl txtPttSMSNo, True
End Sub

Private Sub txtPttSMSNo_LostFocus()
FlashActiveControl txtPttSMSNo, False
End Sub

Private Sub txtPttTelNo_GotFocus()
FlashActiveControl txtPttTelNo, True
End Sub

Private Sub txtPttTelNo_LostFocus()
FlashActiveControl txtPttTelNo, False
End Sub

Private Sub txtPcgName_GotFocus()
FlashActiveControl txtPcgName, True
End Sub

Private Sub txtPcgName_LostFocus()
FlashActiveControl txtPcgName, False
End Sub

Private Sub SmryList()
Dim gcolcount As Integer, acount As Integer, mLow As Integer, mHigh As Integer, mPos As Integer, srow As Long, mColCount As Integer
Dim aAcntBal As Variant, mBal As Double

If datRecset.State = 1 Then
    CloseTable datRecset
End If
RefreshDatabase dbVgnDatabase
RefreshDatabase dbAcDatabase
RefreshDatabase dbGrpDatabase
RefreshDatabase dbComDatabase
clsListStru.Clear

If optMonthwise.Value = True Or optDatewise.Value = True Or optPatientwise.Value = True Then
    If optMonthwise.Value = True Then
        clsListStru.AddFields mExpr:="IpyYrMonth", mAttrib:=cFAT_SYSTEM
        clsListStru.AddFields mExpr:="IpyMnYear", mTitle:="Month", mShowItem:=True, mAlign:=1, mWidth:=2000
        clsListStru.AddFields mExpr:="IpyCount", mTitle:="Count", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IpyDepoAmt_sum", mTitle:="Recd.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        
        datRecset.open "Select format(IphDate,'yyyy/MM') as IpyYrMonth" _
         & ",Count(IphCode) as IpyCount" _
         & ",Sum(IphDepoAmt) as IpyDepoAmt_sum" _
         & " from IndrPymtHdr" _
         & " where IphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and IphCode>0" _
         & IIf(mQryPttCode > 0, " and IphPttCode=" & CStr(mQryPttCode), "") _
         & " group by format(IphDate,'yyyy/MM')" _
         & " order by format(IphDate,'yyyy/MM')" _
         , dbVgnDatabase, adOpenKeyset, adLockReadOnly

    ElseIf optDatewise.Value = True Then
        clsListStru.AddFields mExpr:="IpyDateYMD", mAttrib:=cFAT_SYSTEM
        clsListStru.AddFields mExpr:="IpyDate", mTitle:="Date", mShowItem:=True, mAlign:=1, mWidth:=2000
        clsListStru.AddFields mExpr:="IpyCount", mTitle:="Count", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IpyDepoAmt_sum", mTitle:="Recd.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        
        datRecset.open "Select IphDate" _
         & ",Count(IphCode) as IpyCount" _
         & ",Sum(IphDepoAmt) as IpyDepoAmt_sum" _
         & " from IndrPymtHdr" _
         & " where IphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and IphCode>0" _
         & IIf(mQryPttCode > 0, " and IphPttCode=" & CStr(mQryPttCode), "") _
         & " group by IphDate" _
         & " order by IphDate" _
         , dbVgnDatabase, adOpenKeyset, adLockReadOnly
        
    ElseIf optPatientwise.Value = True Then
        clsListStru.AddFields mExpr:="PttName", mTitle:="Patient Name", mShowItem:=True, mAlign:=1, mWidth:=3000
        clsListStru.AddFields mExpr:="PttRegNo", mTitle:="Reg.No", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="PttRefName", mTitle:="Care of", mShowItem:=True, mAlign:=1, mWidth:=2000
        clsListStru.AddFields mExpr:="IpyCount", mTitle:="Count", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IpyDepoAmt_sum", mTitle:="Recd.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        
        datRecset.open "Select PatMast.PttName,PatMast.PttRegNo,IndrPymtHdr.IphPttCode" _
         & ",Count(IphCode) as IpyCount" _
         & ",Sum(IphDepoAmt) as IpyDepoAmt_sum" _
         & " from IndrPymtHdr inner join PatMast on IndrPymtHdr.IphPttCode=PatMast.PttCode" _
         & " where IphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and IphCode>0" _
         & IIf(mQryPttCode > 0, " and IphPttCode=" & CStr(mQryPttCode), "") _
         & " group by PatMast.PttName,PatMast.PttRegNo,IndrPymtHdr.IphPttCode" _
         & " order by PatMast.PttName,PatMast.PttRegNo,IndrPymtHdr.IphPttCode" _
         , dbVgnDatabase, adOpenKeyset, adLockReadOnly
    End If
    
ElseIf optDetailed.Value = True Then
    clsListStru.AddFields mExpr:="tIpySmryId", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="IpyCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="VtmName", mTitle:="Voucher", mAlign:=1, mWidth:=1500, mShowItem:=True
    clsListStru.AddFields mExpr:="IrcVchNo", mTitle:="Vchr.No", mAlign:=7, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="IpyDate", mTitle:="Date", mAlign:=1, mWidth:=1300, mShowItem:=True
    ' -------------------------------------
    clsListStru.AddFields mExpr:="PttCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="PttName", mTitle:="Patient Name", mAlign:=1, mWidth:=2500, mShowItem:=True
    clsListStru.AddFields mExpr:="PttRegNo", mTitle:="Reg.No", mAlign:=7, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="IpyDepoAmt", mTitle:="Depo.Amt", mAlign:=7, mWidth:=1250, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="PttRefName", mTitle:="Care of", mAlign:=1, mWidth:=2000, mShowItem:=True
    clsListStru.AddFields mExpr:="PttAddr", mTitle:="Address", mAlign:=1, mWidth:=2000, mShowItem:=True
    clsListStru.AddFields mExpr:="PatAraName", mTitle:="Area", mAlign:=1, mWidth:=1500, mShowItem:=True
    clsListStru.AddFields mExpr:="PatStnName", mTitle:="Station", mAlign:=1, mWidth:=1500, mShowItem:=True
    clsListStru.AddFields mExpr:="PatPcgName", mTitle:="Category", mAlign:=1, mWidth:=2000, mShowItem:=True
    
    datRecset.open "Select IndrPymtHdr.*,PatMast.*" _
     & ",format(IphDate,'yyyymmdd')+format(IphCode,'0000000') as tIpySmryId" _
     & " from IndrPymtHdr inner join PatMast on IndrPymtHdr.IphPttCode=PatMast.PttCode" _
     & " where IphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & IIf(mRemoteAccess = True, " and IphCode=" & CStr(mIpyCode) & "", "") _
     & " and IphCode>0" _
     & IIf(mQryPttCode > 0, " and IphPttCode=" & CStr(mQryPttCode), "") _
     & " order by IphDate,IphCode" _
     , dbVgnDatabase, adOpenKeyset, adLockReadOnly
    
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
        If optMonthwise.Value = True Or optDatewise.Value = True Or optPatientwise.Value = True Then
            If optMonthwise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IpyYrMonth")) = .fields("IpyYrMonth")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IpyMnYear")) = MonthName(Val(Right(.fields("IpyYrMonth"), 2))) & "-" & Left(.fields("IpyYrMonth"), 4)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IpyCount")) = ToMyNumFmt(.fields("IpyCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IpyDepoAmt_sum")) = ToMyNumFmt(.fields("IpyDepoAmt_sum"))
                
            ElseIf optDatewise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IpyDateYMD")) = Format(.fields("IphDate"), "yyyymmdd")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IpyDate")) = Dtoc(.fields("IphDate"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IpyCount")) = ToMyNumFmt(.fields("IpyCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IpyDepoAmt_sum")) = ToMyNumFmt(.fields("IpyDepoAmt_sum"))
                
            ElseIf optPatientwise.Value = True Then
                clsPAT.GetData .fields("IphPttCode")
                
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttName")) = .fields("PttName")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttRegNo")) = ToMyNumFmt(.fields("PttRegNo"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttRefName")) = clsPAT.mPttRefName_str
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IpyCount")) = ToMyNumFmt(.fields("IpyCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IpyDepoAmt_sum")) = ToMyNumFmt(.fields("IpyDepoAmt_sum"))
                
            End If
        
        ElseIf optDetailed.Value = True Then
            clsPCG.GetData .fields("PttPcgCode")
            clsARA.GetData .fields("PttAraCode")
            clsSTN.GetData .fields("PttStnCode")
            clsVTM.GetData .fields("IphVtmCode")
            
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("tIpySmryId")) = Format(.fields("IphDate"), "yyyymmdd") & Format(.fields("IphCode"), "0000000")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IpyCode")) = .fields("IphCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("VtmName")) = clsVTM.mName_str
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IrcVchNo")) = .fields("IphVchNo")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IpyDate")) = Dtoc(.fields("IphDate"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IpyDepoAmt")) = ToMyNumFmt(.fields("IphDepoAmt"))
            ' ------------------------------------
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttCode")) = .fields("PttCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttName")) = .fields("PttName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttRegNo")) = .fields("PttRegNo")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttRefName")) = .fields("PttRefName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttAddr")) = .fields("PttAddr")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PatAraName")) = clsARA.mName_str
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PatStnName")) = clsSTN.mName_str
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PatPcgName")) = clsPCG.mName_str
        
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
    mskQryPttRegNo.Text = fcmbPttRegNo.Text
    txtQryPttName.Text = fcmbPttName.Text
    ' ----------------
    frConfigure.ZOrder
    frConfigure.Visible = True
    Mfgrd1.Enabled = False
    dtpFromDate.SetFocus
ElseIf MyAddNewKey(Shift, KeyCode) = True Then
    Call Data_AddEvent
ElseIf MyDeleteKey(Shift, KeyCode) = True Then
    If Mfgrd1.Row < Mfgrd1.Rows - 1 And optDetailed.Value = True Then
        Call Data_DeleteEvent
    End If
ElseIf MyPrintKey(Shift, KeyCode) = True Then
    Data_PrintDialog "Keydown"
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

If IsMissing(mText) = True Then ' user is typing is search text box
    mText = txtSearch1Text.Text
    SearchRawFlex Mfgrd1, FlexLeftVisibleCol(Mfgrd1), mText
Else    ' system field search has been requested by programmer
    If optDetailed.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("tIpySmryId"), mText
    ElseIf optMonthwise.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("IpyYrMonth"), mText
    ElseIf optDatewise.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("IpyDateYMD"), mText
    ElseIf optPatientwise.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("PttName"), mText
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

Private Sub txtRByName_GotFocus()
FlashActiveControl txtRByName, True
End Sub

Private Sub txtRByName_LostFocus()
FlashActiveControl txtRByName, False
End Sub

Private Sub txtSearch1Text_GotFocus()
FlashActiveControl txtSearch1Text, True
End Sub

Private Sub txtSearch1Text_LostFocus()
FlashActiveControl txtSearch1Text, False
End Sub

Private Sub mskIrcVchNo_Change()
If fcmbIrcVchNo.CallFromText_Change = False Then
    fcmbIrcVchNo.CallFromText_Change = True
    If InterActiveChange(mskIrcVchNo) = True Then
        fcmbIrcVchNo.mFiltCond = "IhrIpgCode=" & CStr(mIpyIpgCode)
        fcmbIrcVchNo.ReInit
        
        fcmbIrcVchNo.UserText = Array(mskIrcVchNo.Text, mskIrcVchNo.SelStart)
        fcmbIrcVchNo.Show
        mskIrcVchNo.Text = fcmbIrcVchNo.Text
        If fcmbIrcVchNo.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbIrcVchNo.CallFromText_Change = False
End If

End Sub

Private Sub mskIrcVchNo_GotFocus()
FlashActiveControl mskIrcVchNo, True
End Sub

Private Sub mskIrcVchNo_LostFocus()
FlashActiveControl mskIrcVchNo, False
End Sub

Private Sub mskIrcVchNo_Validate(Cancel As Boolean)
If Val(fcmbIrcVchNo.BoundText) <= 0 Then
    ErrorBox "Invalid Selection !!!"
    mskIrcVchNo.SetFocus
    Cancel = True
Else
    If Val(fcmbIrcVchNo.BoundText) <> mIrcCode_old Or FormAddEditMode = cFORM_ADDMODE Then
        clsIRC.GetHdrData Val(fcmbIrcVchNo.BoundText)
        clsVTM.GetData clsIRC.mTrnVtmCode_lng
        
        txtIrcVtmName.Text = clsVTM.mName_str
        dtpIrcDate.Text = Dtoc(clsIRC.mTrnDate_dt)
        mskIrcAmtAftDisc.Text = ToMyNumFmt(clsIRC.mIhrAmtAftDisc_dbl)
        mskIrcAdvAmt.Text = ToMyNumFmt(clsIRC.mIhrAdvAmt_dbl)
        mskIrcRecdAmt.Text = ToMyNumFmt(clsIRC.mIhrRecdAmt_dbl)
        mskIrcDepoAmtExcl.Text = ToMyNumFmt(clsIRC.mIhrDepoAmt_dbl - mIpyDepoAmt_old)   '''  Val(UnMyNumFmt(mskIpyDepoAmt.Text))
        If Val(UnMyNumFmt(mskIpyDepoAmt.Text)) = 0 Then
            mskIpyDepoAmt.Text = ToMyNumFmt(clsIRC.mIhrBalAmt_dbl)
        End If
        mskIrcRefuAmt.Text = ToMyNumFmt(clsIRC.mIhrRefuAmt_dbl)
        mskIrcBalAmt.Text = ToMyNumFmt(clsIRC.mIhrBalAmt_dbl)
    End If
    Call ValidDtl
End If

End Sub

Private Sub txtStnName_GotFocus()
FlashActiveControl txtStnName, True
End Sub

Private Sub txtStnName_LostFocus()
FlashActiveControl txtStnName, False
End Sub

Private Sub ShowPttDob()
Dim mPttDob As Date

mPttDob = CalcDob(Ctod(dtpPttAgeAsOnDt.Text), Val(mskPttAgeYr.Text), Val(mskPttAgeMn.Text), Val(mskPttAgeDy.Text))
dtpPttDob.Text = Dtoc(mPttDob)

End Sub

Private Sub ShowPatAge()
Dim mYears As Long, mMonths As Long, mDays As Long

CalcAge Ctod(dtpPttDob.Text), Ctod(dtpPttAgeAsOnDt.Text), mYears, mMonths, mDays
mskPttAgeYr.Text = CStr(mYears)
mskPttAgeMn.Text = CStr(mMonths)
mskPttAgeDy.Text = CStr(mDays)

End Sub

Private Sub txtIpgVtmName_GotFocus()
FlashActiveControl txtIpgVtmName, True
End Sub

Private Sub txtIpgVtmName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call ShowOldIpgListByIpgNo
ElseIf MyAddNewKey(Shift, KeyCode) = True Then

ElseIf Shift = 0 And KeyCode = vbKeyF6 Then
    
End If

End Sub

Private Sub txtIpgVtmName_LostFocus()
FlashActiveControl txtIpgVtmName, False
End Sub

Private Sub ShowOldIpyCodeDesc(ByVal mOldIrcCode As Long)
Dim tRecset As New ADODB.Recordset

With tRecset
.open "Select * from IndrPymtHdr where IphCode=" & CStr(mOldIrcCode) & "", dbVgnDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    clsVTM.GetData .fields("IphVtmCode")
    lblOldIpyCodeDesc.Caption = RTrim(clsVTM.mName_str) & " No.:" & CStr(.fields("IphVchNo")) & " Dated:" & Dtoc(.fields("IphDate"))
Else
    lblOldIpyCodeDesc.Caption = "#" & CStr(mOldIrcCode) & "#"
End If
End With
CloseTable tRecset

End Sub

Private Function GetOldIpyCodeFromPttCode(ByVal mPttCode As Long) As Long
Dim tRecset As New ADODB.Recordset

With tRecset
.open "Select top 1 * from IndrPymtHdr where IphPttCode=" & CStr(mPttCode) & " order by IphDate desc,IphVchNo desc,IphCode desc", dbVgnDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    GetOldIpyCodeFromPttCode = .fields("IphCode")
Else
    GetOldIpyCodeFromPttCode = 0
End If
End With
CloseTable tRecset

End Function

Private Function GetOldIpgCodeFromPttCode(ByVal mPttCode As Long) As Long
Dim tRecset As New ADODB.Recordset

With tRecset
.open "Select top 1 * from IndrReg where IpgPttCode=" & CStr(mPttCode) & " order by IpgDate desc,IpgVchNo desc,IpgCode desc", dbVgnDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    GetOldIpgCodeFromPttCode = .fields("IpgCode")
Else
    GetOldIpgCodeFromPttCode = 0
End If
End With
CloseTable tRecset

End Function

Private Sub ShowOldIpgListByIpgNo()
Dim tRecset As New ADODB.Recordset, mOldIpgCode As Long, mOldIpgPttCode As Long

If fcmbAdmIpgByIpgNo.CallFromText_Change = False Then
    fcmbAdmIpgByIpgNo.CallFromText_Change = True
    If InterActiveChange(txtIpgVtmName) = True Then
        fcmbAdmIpgByIpgNo.UserText = Array("", 0)
        fcmbAdmIpgByIpgNo.Show
        If FormAddEditMode = cFORM_ADDMODE And Mfgrd2.Rows = 2 And fcmbAdmIpgByIpgNo.ListSelected = True And Val(fcmbAdmIpgByIpgNo.BoundText) > 0 Then
            mOldIpgCode = Val(fcmbAdmIpgByIpgNo.BoundText)
            tRecset.open "Select * from IndrReg where IpgCode=" & CStr(mOldIpgCode) & "", dbVgnDatabase, adOpenKeyset, adLockOptimistic
            If tRecset.RecordCount > 0 Then
                mOldIpgPttCode = tRecset.fields("IpgPttCode")
            End If
            CloseTable tRecset
            If mOldIpgCode > 0 And mOldIpgPttCode > 0 Then
                mIpyPttCode = mOldIpgPttCode
                ShowPatData mIpyPttCode
                Call StorePatOldData
                'ShowPttDiscPer mIpyPttCode
                
                mIpyIpgCode = mOldIpgCode
                ShowIpgData mIpyIpgCode
                Call StoreIpgOldData
                
                mIpyOldIpyCode = GetOldIpyCodeFromPttCode(mIpyPttCode)
                ShowOldIpyCodeDesc mIpyOldIpyCode
            End If
        Else
            If fcmbAdmIpgByIpgNo.ListSelected = True And Val(fcmbAdmIpgByIpgNo.BoundText) > 0 Then
                If FormAddEditMode = cFORM_EDITMODE Then
                    AlertBox "Prohibited in Edit Mode !!!"
                ElseIf Mfgrd2.Rows > 2 Then
                    AlertBox "Prohibited After Depositing Amount !!!"
                End If
            End If
        End If
    End If
    fcmbAdmIpgByIpgNo.CallFromText_Change = False
End If
CloseTable tRecset, mCheckOpen:=True

End Sub

Private Sub ShowOldIpgListByPttRegNo()
Dim tRecset As New ADODB.Recordset, mOldIpgCode As Long, mOldIpgPttCode As Long

If fcmbAdmIpgByPttRegNo.CallFromText_Change = False Then
    fcmbAdmIpgByPttRegNo.CallFromText_Change = True
    If InterActiveChange(mskPttRegNo) = True Then
        fcmbAdmIpgByPttRegNo.UserText = Array("", 0)
        fcmbAdmIpgByPttRegNo.Show
        If FormAddEditMode = cFORM_ADDMODE And Mfgrd2.Rows = 2 And fcmbAdmIpgByPttRegNo.ListSelected = True And Val(fcmbAdmIpgByPttRegNo.BoundText) > 0 Then
            mOldIpgCode = Val(fcmbAdmIpgByPttRegNo.LFieldValue("IpgCode"))
            tRecset.open "Select * from IndrReg where IpgCode=" & CStr(mOldIpgCode) & "", dbVgnDatabase, adOpenKeyset, adLockOptimistic
            If tRecset.RecordCount > 0 Then
                mOldIpgPttCode = tRecset.fields("IpgPttCode")
            End If
            CloseTable tRecset
            If mOldIpgCode > 0 And mOldIpgPttCode > 0 Then
                mIpyPttCode = mOldIpgPttCode
                ShowPatData mIpyPttCode
                Call StorePatOldData
                'ShowPttDiscPer mIpyPttCode
                
                mIpyIpgCode = mOldIpgCode
                ShowIpgData mIpyIpgCode
                Call StoreIpgOldData
                
                mIpyOldIpyCode = GetOldIpyCodeFromPttCode(mIpyPttCode)
                ShowOldIpyCodeDesc mIpyOldIpyCode
            End If
        Else
            If fcmbAdmIpgByPttRegNo.ListSelected = True And Val(fcmbAdmIpgByPttRegNo.BoundText) > 0 Then
                If FormAddEditMode = cFORM_EDITMODE Then
                    AlertBox "Prohibited in Edit Mode !!!"
                ElseIf Mfgrd2.Rows > 2 Then
                    AlertBox "Prohibited After Depositing Amount !!!"
                End If
            End If
        End If
    End If
    fcmbAdmIpgByPttRegNo.CallFromText_Change = False
End If
CloseTable tRecset, mCheckOpen:=True

End Sub

Private Sub ShowOldIpgListByPttName()
Dim tRecset As New ADODB.Recordset, mOldIpgCode As Long, mOldIpgPttCode As Long

If fcmbAdmIpgByPttName.CallFromText_Change = False Then
    fcmbAdmIpgByPttName.CallFromText_Change = True
    If InterActiveChange(txtPttName) = True Then
        fcmbAdmIpgByPttName.UserText = Array("", 0)
        fcmbAdmIpgByPttName.Show
        If FormAddEditMode = cFORM_ADDMODE And Mfgrd2.Rows = 2 And fcmbAdmIpgByPttName.ListSelected = True And Val(fcmbAdmIpgByPttName.BoundText) > 0 Then
            mOldIpgCode = Val(fcmbAdmIpgByPttName.LFieldValue("IpgCode"))
            tRecset.open "Select * from IndrReg where IpgCode=" & CStr(mOldIpgCode) & "", dbVgnDatabase, adOpenKeyset, adLockOptimistic
            If tRecset.RecordCount > 0 Then
                mOldIpgPttCode = tRecset.fields("IpgPttCode")
            End If
            CloseTable tRecset
            If mOldIpgCode > 0 And mOldIpgPttCode > 0 Then
                mIpyPttCode = mOldIpgPttCode
                ShowPatData mIpyPttCode
                Call StorePatOldData
                'ShowPttDiscPer mIpyPttCode
                
                mIpyIpgCode = mOldIpgCode
                ShowIpgData mIpyIpgCode
                Call StoreIpgOldData
                
                mIpyOldIpyCode = GetOldIpyCodeFromPttCode(mIpyPttCode)
                ShowOldIpyCodeDesc mIpyOldIpyCode
            End If
        Else
            If fcmbAdmIpgByPttName.ListSelected = True And Val(fcmbAdmIpgByPttName.BoundText) > 0 Then
                If FormAddEditMode = cFORM_EDITMODE Then
                    AlertBox "Prohibited in Edit Mode !!!"
                ElseIf Mfgrd2.Rows > 2 Then
                    AlertBox "Prohibited After Depositing Amount !!!"
                End If
            End If
        End If
    End If
    fcmbAdmIpgByPttName.CallFromText_Change = False
End If
CloseTable tRecset, mCheckOpen:=True

End Sub

Private Sub VisibleControls(ByVal mShowItem As Boolean, Optional ByVal mRowPos)
Rem Important - dtlAddEditMode & dtlAddMode must be initialised prior to this
If Me.Visible = True Then
    txtVoid.SetFocus
End If
If IsMissing(mRowPos) = False Then
    mskIpySno.Top = mRowPos
    mskIrcVchNo.Top = mRowPos
    txtIrcVtmName.Top = mRowPos
    dtpIrcDate.Top = mRowPos
    mskIrcAmtAftDisc.Top = mRowPos
    mskIrcAdvAmt.Top = mRowPos
    mskIrcRecdAmt.Top = mRowPos
    mskIrcDepoAmtExcl.Top = mRowPos
    mskIpyDepoAmt.Top = mRowPos
    mskIrcRefuAmt.Top = mRowPos
    mskIrcBalAmt.Top = mRowPos
    cmdOK.Top = mRowPos
End If

mskIpySno.Text = 0
mskIrcVchNo.Text = 0: fcmbIrcVchNo.BoundText = ""
txtIrcVtmName.Text = ""
dtpIrcDate.Text = ""
mskIrcAmtAftDisc.Text = ToMyNumFmt(0)
mskIrcAdvAmt.Text = ToMyNumFmt(0)
mskIrcRecdAmt.Text = ToMyNumFmt(0)
mskIrcDepoAmtExcl.Text = ToMyNumFmt(0)
mskIpyDepoAmt.Text = ToMyNumFmt(0)
mskIrcRefuAmt.Text = ToMyNumFmt(0)
mskIrcBalAmt.Text = ToMyNumFmt(0)

Call ValidDtl

mskIpySno.Visible = mShowItem
mskIrcVchNo.Visible = mShowItem
txtIrcVtmName.Visible = mShowItem
dtpIrcDate.Visible = mShowItem
mskIrcAmtAftDisc.Visible = mShowItem
mskIrcAdvAmt.Visible = mShowItem
mskIrcRecdAmt.Visible = mShowItem
mskIrcDepoAmtExcl.Visible = mShowItem
mskIpyDepoAmt.Visible = mShowItem
mskIrcRefuAmt.Visible = mShowItem
mskIrcBalAmt.Visible = mShowItem
cmdOK.Visible = mShowItem

frHeader.Enabled = (mShowItem = False)
Mfgrd2.Enabled = (mShowItem = False)
frFooter.Enabled = (mShowItem = False)
cmdSaveForm.Enabled = (mShowItem = False)

End Sub

Private Sub ValidDtl()
Dim mDataOk As Boolean

mDataOk = (Val(UnMyNumFmt(mskIpySno.Text)) > 0 And Val(fcmbIrcVchNo.BoundText) > 0 And Val(UnMyNumFmt(mskIpyDepoAmt.Text)) > 0 And chkIpyDepoAmt() = True)
cmdOK.Caption = IIf(mDataOk = True, "&OK", "&Cancel")
cmdOK.BackColor = IIf(mDataOk = True, &H80FF80, &H8080FF)
End Sub

Private Sub CalcFtrTotal()
Dim mIrcAmtAftDiscTot As Double, mIrcAdvAmtTot As Double, mIrcRecdAmtTot As Double, mIrcDepoAmtExclTot As Double, mIpyDepoAmtTot As Double, mIrcRefuAmtTot As Double, mIrcBalAmtTot As Double

mIrcAmtAftDiscTot = FlexColSum(Mfgrd2, X2IRCAMTAFTDISC_COL)
mIrcAdvAmtTot = FlexColSum(Mfgrd2, X2IRCADVAMT_COL)
mIrcRecdAmtTot = FlexColSum(Mfgrd2, X2IRCRECDAMT_COL)
mIrcDepoAmtExclTot = FlexColSum(Mfgrd2, X2IRCDEPOAMTEXCL_COL)
mIpyDepoAmtTot = FlexColSum(Mfgrd2, X2IPYDEPOAMT_COL)
mIrcRefuAmtTot = FlexColSum(Mfgrd2, X2IRCREFUAMT_COL)
mIrcBalAmtTot = FlexColSum(Mfgrd2, X2IRCBALAMT_COL)

lblIrcAmtAftDiscTot.Caption = ToMyNumFmt(mIrcAmtAftDiscTot)
lblIrcAdvAmtTot.Caption = ToMyNumFmt(mIrcAdvAmtTot)
lblIrcRecdAmtTot.Caption = ToMyNumFmt(mIrcRecdAmtTot)
lblIrcDepoAmtExclTot.Caption = ToMyNumFmt(mIrcDepoAmtExclTot)
lblIpyDepoAmtTot.Caption = ToMyNumFmt(mIpyDepoAmtTot)
lblIrcRefuAmtTot.Caption = ToMyNumFmt(mIrcRefuAmtTot)
lblIrcBalAmtTot.Caption = ToMyNumFmt(mIrcBalAmtTot)

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
Dim mIpyVchNo As Long

If Val(fcmbIpyVtmName.BoundText) < 1 Then
    ErrorBox "Invalid Voucher Type !!!"
    txtIpyVtmName(1).SetFocus
    Exit Sub
End If
If Val(UnMyNumFmt(mskIpyVchNo(1).Text)) < 1 Then
    ErrorBox "Invalid Voucher No. !!!"
    mskIpyVchNo(1).SetFocus
    Exit Sub
Else
    mIpyVchNo = Val(UnMyNumFmt(mskIpyVchNo(1).Text))
    If ChkIsExistVTypeNo(dbVgnDatabase, mTableName:="IndrPymtHdr", mChkFieldName:="IphVchNo", mChkFieldValue:=CStr(mIpyVchNo), mVtmFieldName:="IphVtmCode", mVtmFieldValue:=Val(fcmbIpyVtmName.BoundText), mFinYrFieldName:="IphCmpCode", mFinYrFieldValue:=sFinYrCmpCode) = False Then
        ErrorBox "Voucher No. does not Exist !!!"
        mskIpyVchNo(1).SetFocus
        Exit Sub
    End If
End If
If Val(UnMyNumFmt(mskIpyVchNo(2).Text)) < 1 Then
    ErrorBox "Invalid Voucher No. !!!"
    mskIpyVchNo(2).SetFocus
    Exit Sub
Else
    mIpyVchNo = Val(UnMyNumFmt(mskIpyVchNo(2).Text))
    If ChkIsExistVTypeNo(dbVgnDatabase, mTableName:="IndrPymtHdr", mChkFieldName:="IphVchNo", mChkFieldValue:=CStr(mIpyVchNo), mVtmFieldName:="IphVtmCode", mVtmFieldValue:=Val(fcmbIpyVtmName.BoundText), mFinYrFieldName:="IphCmpCode", mFinYrFieldValue:=sFinYrCmpCode) = False Then
        ErrorBox "Voucher No. does not Exist !!!"
        mskIpyVchNo(2).SetFocus
        Exit Sub
    End If
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

Private Sub Data_PrintEvent()
Dim mFromIpyVchNo As Long, mToIpyVchNo As Long, mIpyVtmCode As Long
Dim fCRView As Form

mFromIpyVchNo = Val(UnMyNumFmt(mskIpyVchNo(1).Text))
mToIpyVchNo = Val(UnMyNumFmt(mskIpyVchNo(2).Text))
mIpyVtmCode = Val(fcmbIpyVtmName.BoundText)

frmMain.Cryst.Reset
frmMain.Cryst.ReportFileName = Trim(Right(cmbCRList.List(cmbCRList.ListIndex), 100))
frmMain.Cryst.DiscardSavedData = True
frmMain.Cryst.DataFiles(0) = dbComDatabaseFullPath

frmMain.Cryst.SelectionFormula = "{vewIndrPymt.IphVchNo}>=" & CStr(mFromIpyVchNo) & " and {vewIndrPymt.IphVchNo}<=" & CStr(mToIpyVchNo) & " and {vewIndrPymt.IphVtmCode}=" & CStr(mIpyVtmCode) & " and {vewIndrPymt.IphCmpCode}=" & CStr(sFinYrCmpCode)
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

Private Sub Data_PrintDialog(ByVal mCallSource As String)
If mCallSource = "Keydown" Then
    If Mfgrd1.Row < Mfgrd1.Rows - 1 And optDetailed.Value = True And datRecset.BOF = False And datRecset.EOF = False Then
        fcmbIpyVtmName.BoundText = CStr(datRecset.fields("IphVtmCode"))
        txtIpyVtmName(1).Text = fcmbIpyVtmName.Text
        mskIpyVchNo(1).Text = datRecset.fields("IphVchNo")
        mskIpyVchNo(2).Text = datRecset.fields("IphVchNo")
        ' ----------------
        Call AssignPrintPara
        frPrintCRList.ZOrder
        frPrintCRList.Visible = True
        Mfgrd1.Enabled = False
        cmbPrintDest.SetFocus
    End If
    
ElseIf mCallSource = "SaveEvent" Then
    txtIpyVtmName(1).Text = fcmbIpyVtmName.Text
    mskIpyVchNo(1).Text = CStr(Val(UnMyNumFmt(mskIpyVchNo(0).Text)))
    mskIpyVchNo(2).Text = CStr(Val(UnMyNumFmt(mskIpyVchNo(0).Text)))
    ' ----------------
    Call AssignPrintPara
    frPrintCRList.ZOrder
    frPrintCRList.Visible = True
    Mfgrd1.Enabled = False
    cmbPrintDest.SetFocus

End If


End Sub

Private Sub AssignPrintPara()
Dim fhand As Integer, mCRLTitle As String, mCRLFileName As String, mCRLDefault As Boolean, mDefaultCRLIndex As Integer

mDefaultCRLIndex = -1
mskPrintCopies.Text = 1

AddPrinterToCombo cmbPrinterList

AddPrintDestToCombo cmbPrintDest

If Dir(IndrPymtCRLFileFullPath) = "" Then
    fhand = FreeFile
    Open IndrPymtCRLFileFullPath For Output As #fhand
    Write #fhand, "Indoor (Receipt) Payment", "IndrPymt.Rpt", True
    Close #fhand
End If

cmbCRList.Clear
fhand = FreeFile
Open IndrPymtCRLFileFullPath For Input As #fhand
Do While EOF(fhand) = False
    Input #fhand, mCRLTitle, mCRLFileName, mCRLDefault
    If Dir(IndrPymtCRLFileFullPath(mFileName:=mCRLFileName)) <> "" Then
        cmbCRList.AddItem mCRLTitle & Space(100) & IndrPymtCRLFileFullPath(mFileName:=mCRLFileName)
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

