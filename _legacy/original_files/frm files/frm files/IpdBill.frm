VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmIndoorBill 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   ClientHeight    =   10950
   ClientLeft      =   60
   ClientTop       =   60
   ClientWidth     =   14460
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
   ScaleHeight     =   10950
   ScaleWidth      =   14460
   ShowInTaskbar   =   0   'False
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   187
      Top             =   10635
      Width           =   14460
      _ExtentX        =   25506
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
            TextSave        =   "13:14"
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
      TabIndex        =   98
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
      TabIndex        =   97
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
      ItemData        =   "IpdBill.frx":0000
      Left            =   0
      List            =   "IpdBill.frx":000D
      Style           =   1  'Simple Combo
      TabIndex        =   96
      TabStop         =   0   'False
      Text            =   "cmbFormEntryMode"
      Top             =   360
      Width           =   1455
   End
   Begin VB.TextBox txtVoid 
      CausesValidation=   0   'False
      Height          =   375
      Left            =   0
      TabIndex        =   92
      TabStop         =   0   'False
      Text            =   "Void"
      Top             =   10320
      Width           =   375
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
      Height          =   9975
      Left            =   120
      TabIndex        =   95
      Top             =   720
      Width           =   14055
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
         Left            =   13440
         Style           =   1  'Graphical
         TabIndex        =   91
         Top             =   9600
         Width           =   375
      End
      Begin VB.TextBox mskIbbsIbsCode 
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
         Left            =   6000
         TabIndex        =   46
         Tag             =   "AhCode"
         Text            =   "0"
         Top             =   6720
         Width           =   1455
      End
      Begin VB.TextBox mskIbbsToTime 
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
         Left            =   11160
         MaxLength       =   50
         TabIndex        =   50
         TabStop         =   0   'False
         Text            =   "00:00"
         Top             =   6720
         Width           =   855
      End
      Begin VB.TextBox mskIbbsFromTime 
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
         Left            =   8880
         MaxLength       =   50
         TabIndex        =   48
         TabStop         =   0   'False
         Text            =   "00:00"
         Top             =   6720
         Width           =   855
      End
      Begin VB.TextBox dtpIbbsToDate 
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
         Left            =   9720
         MaxLength       =   50
         TabIndex        =   49
         Text            =   "dd/mm/yyyy"
         Top             =   6720
         Width           =   1455
      End
      Begin VB.TextBox dtpIbbsFromDate 
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
         Left            =   7440
         MaxLength       =   50
         TabIndex        =   47
         Text            =   "dd/mm/yyyy"
         Top             =   6720
         Width           =   1455
      End
      Begin VB.Frame frSdcDtl 
         Appearance      =   0  'Flat
         BackColor       =   &H00F0CAA6&
         ForeColor       =   &H80000008&
         Height          =   2295
         Left            =   120
         TabIndex        =   170
         Top             =   7680
         Width           =   10695
         Begin VB.CommandButton cmdSdcOK 
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
            Left            =   9480
            Style           =   1  'Graphical
            TabIndex        =   57
            Top             =   1080
            Width           =   735
         End
         Begin VB.TextBox txtIbdRemark 
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
            Left            =   6120
            MaxLength       =   100
            TabIndex        =   56
            Top             =   1080
            Width           =   3375
         End
         Begin VB.TextBox txtDrlName 
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
            Left            =   3600
            MaxLength       =   50
            TabIndex        =   55
            Top             =   1080
            Width           =   2535
         End
         Begin VB.TextBox txtSDctName 
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
            Left            =   720
            MaxLength       =   50
            TabIndex        =   54
            Top             =   1080
            Width           =   2895
         End
         Begin VB.TextBox mskIbdSno 
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
            TabIndex        =   53
            Tag             =   "AhCode"
            Text            =   "0"
            Top             =   1080
            Width           =   615
         End
         Begin MSFlexGridLib.MSFlexGrid Mfgrd3 
            Height          =   1575
            Left            =   120
            TabIndex        =   52
            Top             =   600
            Width           =   10215
            _ExtentX        =   18018
            _ExtentY        =   2778
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
            Caption         =   "Doctors Involved Detail:"
            BeginProperty Font 
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
            Index           =   30
            Left            =   120
            TabIndex        =   171
            Top             =   240
            Width           =   2535
         End
      End
      Begin VB.TextBox mskIblICode 
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
         Left            =   720
         TabIndex        =   42
         Tag             =   "AhCode"
         Text            =   "0"
         Top             =   6360
         Visible         =   0   'False
         Width           =   1335
      End
      Begin VB.TextBox txtSdcFlag 
         Alignment       =   2  'Center
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
         Left            =   4680
         TabIndex        =   51
         Tag             =   "AhCode"
         Text            =   "Y"
         Top             =   6000
         Width           =   375
      End
      Begin VB.TextBox txtIbbsRemark 
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
         Height          =   575
         Left            =   720
         Locked          =   -1  'True
         MaxLength       =   100
         MultiLine       =   -1  'True
         TabIndex        =   45
         Text            =   "IpdBill.frx":002D
         Top             =   6720
         Width           =   5295
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
         Left            =   13080
         Style           =   1  'Graphical
         TabIndex        =   64
         Top             =   6000
         Width           =   735
      End
      Begin VB.Frame frFooter 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         ForeColor       =   &H80000008&
         Height          =   2175
         Left            =   120
         TabIndex        =   156
         Top             =   7800
         Width           =   13695
         Begin VB.TextBox mskIblRfugAmtTot 
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
               Italic          =   -1  'True
               Strikethrough   =   0   'False
            EndProperty
            Height          =   225
            Left            =   11520
            Locked          =   -1  'True
            TabIndex        =   78
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   1200
            Width           =   1575
         End
         Begin VB.TextBox mskIblDpogAmtTot 
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
               Italic          =   -1  'True
               Strikethrough   =   0   'False
            EndProperty
            Height          =   225
            Left            =   11520
            Locked          =   -1  'True
            TabIndex        =   66
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   720
            Width           =   1575
         End
         Begin VB.TextBox mskIblRefuAmtTot 
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
               Italic          =   -1  'True
               Strikethrough   =   0   'False
            EndProperty
            Height          =   225
            Left            =   11520
            Locked          =   -1  'True
            TabIndex        =   89
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   1440
            Width           =   1575
         End
         Begin VB.TextBox mskIblAdvAmt 
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
               Italic          =   -1  'True
               Strikethrough   =   0   'False
            EndProperty
            Height          =   225
            Left            =   11520
            Locked          =   -1  'True
            TabIndex        =   65
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   480
            Width           =   1575
         End
         Begin VB.TextBox mskIblBalAmtTot 
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
               Italic          =   -1  'True
               Strikethrough   =   0   'False
            EndProperty
            Height          =   225
            Left            =   11520
            Locked          =   -1  'True
            TabIndex        =   90
            TabStop         =   0   'False
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   1680
            Width           =   1575
         End
         Begin VB.TextBox mskIblDepoAmtTot 
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
               Italic          =   -1  'True
               Strikethrough   =   0   'False
            EndProperty
            Height          =   225
            Left            =   11520
            Locked          =   -1  'True
            TabIndex        =   77
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   960
            Width           =   1575
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "IPD Refund Amt:"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   225
            Index           =   32
            Left            =   9600
            TabIndex        =   182
            Top             =   1200
            Width           =   1935
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "IPD Deposit Amt:"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   225
            Index           =   26
            Left            =   9600
            TabIndex        =   181
            Top             =   720
            Width           =   1935
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Bill Refund Amt:"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   225
            Index           =   21
            Left            =   9600
            TabIndex        =   169
            Top             =   1440
            Width           =   1935
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Advance Amount:"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   225
            Index           =   15
            Left            =   9600
            TabIndex        =   168
            Top             =   480
            Width           =   1935
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Last IPD Bill:"
            BeginProperty Font 
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
            TabIndex        =   167
            Top             =   1800
            Width           =   1695
         End
         Begin VB.Label lblOldIblCodeDesc 
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
            Left            =   1920
            TabIndex        =   166
            Top             =   1800
            Width           =   6135
         End
         Begin VB.Label lblLinkTranDesc 
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
               Italic          =   -1  'True
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   1215
            Left            =   0
            TabIndex        =   164
            Top             =   480
            Width           =   8055
            WordWrap        =   -1  'True
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Balance Amount:"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   225
            Index           =   29
            Left            =   9600
            TabIndex        =   163
            Top             =   1680
            Width           =   1935
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Bill Deposit Amt:"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   225
            Index           =   27
            Left            =   9600
            TabIndex        =   162
            Top             =   960
            Width           =   1935
         End
         Begin VB.Label lblIblAmtAftDiscTot 
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
            Left            =   11280
            TabIndex        =   160
            Top             =   120
            Width           =   1575
         End
         Begin VB.Label lblIblDiscAmtTot 
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
            Left            =   9960
            TabIndex        =   159
            Top             =   120
            Width           =   1335
         End
         Begin VB.Label lblIblAmtBefDiscTot 
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
            Left            =   7080
            TabIndex        =   158
            Top             =   120
            Width           =   1575
         End
         Begin VB.Label lblIblUnitTot 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "0"
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
            TabIndex        =   157
            Top             =   120
            Width           =   975
         End
      End
      Begin VB.TextBox mskIblSno 
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
         TabIndex        =   43
         Tag             =   "AhCode"
         Text            =   "0)"
         Top             =   6000
         Width           =   615
      End
      Begin VB.Frame frHeader 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   4935
         Left            =   120
         TabIndex        =   128
         Top             =   240
         Width           =   13695
         Begin VB.TextBox dtpIbsDischDate 
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
            Left            =   2040
            TabIndex        =   36
            Text            =   "dd/mm/yyyy"
            Top             =   4560
            Width           =   1575
         End
         Begin VB.TextBox txtIbsDischTime 
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
            Left            =   4380
            TabIndex        =   37
            Text            =   "00:00"
            Top             =   4560
            Width           =   975
         End
         Begin VB.TextBox txtIbsRemark 
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
            Left            =   8760
            TabIndex        =   39
            Top             =   4560
            Width           =   1935
         End
         Begin VB.ComboBox cmbIbsDischState 
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
            Height          =   315
            Left            =   6240
            Style           =   2  'Dropdown List
            TabIndex        =   38
            Top             =   4560
            Width           =   1935
         End
         Begin VB.CommandButton cmdAutoServInsert 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            Caption         =   "Indoor Bill Automation"
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
            Left            =   10920
            Style           =   1  'Graphical
            TabIndex        =   40
            Top             =   4500
            Width           =   2475
         End
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
            Left            =   7320
            MaxLength       =   50
            TabIndex        =   28
            TabStop         =   0   'False
            Top             =   3300
            Width           =   4695
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
            Top             =   1320
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
            Top             =   1020
            Width           =   1215
         End
         Begin VB.TextBox mskIblIpgCode 
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
         Begin VB.TextBox mskIblPttDiscPer 
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
            Left            =   8760
            TabIndex        =   35
            Tag             =   "AhCode"
            Text            =   "0.00 %"
            Top             =   4080
            Width           =   1455
         End
         Begin VB.TextBox txtIblTime_str 
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
            Left            =   11160
            MaxLength       =   50
            TabIndex        =   33
            Text            =   "00:00"
            Top             =   3780
            Width           =   855
         End
         Begin VB.TextBox dtpIblDate 
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
            Left            =   8760
            MaxLength       =   50
            TabIndex        =   32
            Text            =   "dd/mm/yyyy"
            Top             =   3780
            Width           =   1455
         End
         Begin VB.TextBox mskIblVchNo 
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
            TabStop         =   0   'False
            Tag             =   "AhCode"
            Text            =   "0"
            Top             =   3780
            Width           =   1455
         End
         Begin VB.TextBox txtIblVtmName 
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
            TabStop         =   0   'False
            Top             =   3780
            Width           =   1815
         End
         Begin VB.TextBox txtIblPrefix 
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
            Top             =   3780
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
            Top             =   1920
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
            Top             =   1320
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
            Top             =   1620
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
            Top             =   1920
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
            Top             =   2220
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
            Top             =   1320
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
            Top             =   1620
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
            Tag             =   "AhCode"
            Text            =   "0"
            Top             =   1020
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
            Top             =   1020
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
            Top             =   1020
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
            Top             =   1020
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
            Top             =   1020
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
            Top             =   2700
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
            Tag             =   "AhCode"
            Text            =   "0"
            Top             =   2700
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
            Top             =   2700
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
            Left            =   8760
            MaxLength       =   50
            TabIndex        =   23
            TabStop         =   0   'False
            Text            =   "dd/mm/yyyy"
            Top             =   2700
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
            Left            =   11160
            MaxLength       =   50
            TabIndex        =   24
            TabStop         =   0   'False
            Text            =   "00:00"
            Top             =   2700
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
            Top             =   3000
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
            Left            =   7320
            MaxLength       =   50
            TabIndex        =   26
            TabStop         =   0   'False
            Top             =   3000
            Width           =   4695
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
            Top             =   3300
            Width           =   3975
         End
         Begin VB.TextBox mskIblPttCode 
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
         Begin VB.TextBox txtIbhRemark 
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
            Top             =   4080
            Width           =   5415
         End
         Begin VB.Line Line3 
            Index           =   0
            X1              =   0
            X2              =   13680
            Y1              =   4440
            Y2              =   4440
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Rem:"
            BeginProperty Font 
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
            Index           =   44
            Left            =   8220
            TabIndex        =   191
            Top             =   4560
            Width           =   555
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Status:"
            BeginProperty Font 
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
            Index           =   43
            Left            =   5460
            TabIndex        =   190
            Top             =   4560
            Width           =   675
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
            Index           =   42
            Left            =   3660
            TabIndex        =   189
            Top             =   4560
            Width           =   615
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Discharge Date:"
            BeginProperty Font 
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
            Index           =   41
            Left            =   120
            TabIndex        =   188
            Top             =   4560
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
            Index           =   13
            Left            =   6120
            TabIndex        =   165
            Top             =   3300
            Width           =   1095
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Disc.%:"
            BeginProperty Font 
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
            Index           =   28
            Left            =   7560
            TabIndex        =   161
            Top             =   4080
            Width           =   735
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
            Left            =   7560
            TabIndex        =   155
            Top             =   3780
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
            Left            =   10440
            TabIndex        =   154
            Top             =   3780
            Width           =   495
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Bill No.:"
            BeginProperty Font 
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
            TabIndex        =   153
            Top             =   3780
            Width           =   855
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Bill Type:"
            BeginProperty Font 
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
            TabIndex        =   152
            Top             =   3780
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
            TabIndex        =   151
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
            TabIndex        =   150
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
            TabIndex        =   149
            Top             =   1920
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
            TabIndex        =   148
            Top             =   1320
            Width           =   1935
         End
         Begin VB.Line Line3 
            Index           =   1
            X1              =   0
            X2              =   13680
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
            TabIndex        =   147
            Top             =   720
            Width           =   1695
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
            TabIndex        =   146
            Top             =   720
            Width           =   975
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
            TabIndex        =   145
            Top             =   1620
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
            TabIndex        =   144
            Top             =   1920
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
            TabIndex        =   143
            Top             =   2220
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
            TabIndex        =   142
            Top             =   1320
            Width           =   1575
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
            TabIndex        =   141
            Top             =   1620
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
            TabIndex        =   140
            Top             =   1020
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
            Left            =   10440
            TabIndex        =   139
            Top             =   1020
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
            TabIndex        =   138
            Top             =   1020
            Width           =   735
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
            TabIndex        =   137
            Top             =   2700
            Width           =   1935
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Ipd No.:"
            BeginProperty Font 
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
            TabIndex        =   136
            Top             =   2700
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
            TabIndex        =   135
            Top             =   2700
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
            Left            =   10440
            TabIndex        =   134
            Top             =   2700
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
            TabIndex        =   133
            Top             =   3000
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
            TabIndex        =   132
            Top             =   3000
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
            TabIndex        =   131
            Top             =   3300
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
            TabIndex        =   130
            Top             =   4080
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
            TabIndex        =   129
            Top             =   1020
            Width           =   1935
         End
         Begin VB.Shape Shape1 
            BackColor       =   &H00FFD7B7&
            BackStyle       =   1  'Opaque
            Height          =   2475
            Index           =   0
            Left            =   0
            Top             =   120
            Width           =   13695
         End
         Begin VB.Shape Shape1 
            BackColor       =   &H00FFFFC0&
            BackStyle       =   1  'Opaque
            Height          =   1095
            Index           =   1
            Left            =   0
            Top             =   2580
            Width           =   13695
         End
         Begin VB.Shape Shape1 
            BackColor       =   &H00FFFF80&
            BackStyle       =   1  'Opaque
            Height          =   1275
            Index           =   2
            Left            =   0
            Top             =   3660
            Width           =   13695
         End
      End
      Begin VB.TextBox txtSrvName 
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
         Left            =   720
         MaxLength       =   50
         TabIndex        =   44
         Top             =   6000
         Width           =   3975
      End
      Begin VB.TextBox mskIblAmtAftDisc 
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
         Left            =   11400
         TabIndex        =   63
         Text            =   "0.00"
         Top             =   6000
         Width           =   1695
      End
      Begin VB.TextBox mskIblDiscAmt 
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
         Left            =   10080
         TabIndex        =   62
         TabStop         =   0   'False
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   6000
         Width           =   1335
      End
      Begin VB.TextBox mskIblDiscPer 
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
         Left            =   8760
         TabIndex        =   61
         Tag             =   "AhCode"
         Text            =   "0.00 %"
         Top             =   6000
         Width           =   1335
      End
      Begin VB.TextBox mskIblAmtBefDisc 
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
         Left            =   7200
         TabIndex        =   60
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   6000
         Width           =   1575
      End
      Begin VB.TextBox mskIblRate 
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
         Left            =   6000
         TabIndex        =   59
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   6000
         Width           =   1215
      End
      Begin VB.TextBox mskIblUnit 
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
         Left            =   5040
         TabIndex        =   58
         Tag             =   "AhCode"
         Text            =   "0"
         Top             =   6000
         Width           =   975
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd2 
         Height          =   2655
         Left            =   120
         TabIndex        =   41
         Top             =   5160
         Width           =   13695
         _ExtentX        =   24156
         _ExtentY        =   4683
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
      Begin VB.Frame frRfugAdjDtl 
         Appearance      =   0  'Flat
         BackColor       =   &H00FADEE7&
         ForeColor       =   &H80000008&
         Height          =   2295
         Left            =   120
         TabIndex        =   185
         Top             =   7680
         Width           =   12135
         Begin VB.CommandButton cmdRfugOk 
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
            Left            =   10800
            Style           =   1  'Graphical
            TabIndex        =   88
            Top             =   1440
            Width           =   735
         End
         Begin VB.TextBox txtIgfVtmName 
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
            Left            =   1920
            MaxLength       =   50
            TabIndex        =   82
            Top             =   1080
            Width           =   2415
         End
         Begin VB.TextBox mskIgfVchNo 
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
            Left            =   720
            MaxLength       =   50
            TabIndex        =   81
            Top             =   1080
            Width           =   1215
         End
         Begin VB.TextBox mskIbgfSno 
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
            Left            =   120
            TabIndex        =   80
            Tag             =   "AhCode"
            Text            =   "0"
            Top             =   1080
            Width           =   615
         End
         Begin VB.TextBox dtpIgfDate 
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
            Left            =   4320
            MaxLength       =   50
            TabIndex        =   83
            Text            =   "dd/mm/yyyy"
            Top             =   1080
            Width           =   1455
         End
         Begin VB.TextBox mskIgfRfugAmt 
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
            Left            =   5760
            TabIndex        =   84
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   1080
            Width           =   1455
         End
         Begin VB.TextBox mskIgfAdjAmtExcl 
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
            Left            =   7200
            TabIndex        =   85
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   1080
            Width           =   1455
         End
         Begin VB.TextBox mskIbgfRfugAmt 
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
            TabIndex        =   86
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   1080
            Width           =   1455
         End
         Begin VB.TextBox mskIgfBalAmt 
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
            Left            =   10080
            TabIndex        =   87
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   1080
            Width           =   1455
         End
         Begin MSFlexGridLib.MSFlexGrid Mfgrd5 
            Height          =   1575
            Left            =   120
            TabIndex        =   79
            Top             =   600
            Width           =   11775
            _ExtentX        =   20770
            _ExtentY        =   2778
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
            Caption         =   "Ipd On A/c. Refund Adjustment Details:"
            BeginProperty Font 
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
            Index           =   40
            Left            =   120
            TabIndex        =   186
            Top             =   240
            Width           =   4215
         End
      End
      Begin VB.Frame frDpogAdjDtl 
         Appearance      =   0  'Flat
         BackColor       =   &H00FAEADC&
         ForeColor       =   &H80000008&
         Height          =   2295
         Left            =   120
         TabIndex        =   183
         Top             =   7680
         Width           =   12135
         Begin VB.TextBox mskIgtBalAmt 
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
            Left            =   10080
            TabIndex        =   75
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   1080
            Width           =   1455
         End
         Begin VB.TextBox mskIbgdDpogAmt 
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
            TabIndex        =   74
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   1080
            Width           =   1455
         End
         Begin VB.TextBox mskIgtAdjAmtExcl 
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
            Left            =   7200
            TabIndex        =   73
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   1080
            Width           =   1455
         End
         Begin VB.TextBox mskIgtDpogAmt 
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
            Left            =   5760
            TabIndex        =   72
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   1080
            Width           =   1455
         End
         Begin VB.TextBox dtpIgtDate 
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
            Left            =   4320
            MaxLength       =   50
            TabIndex        =   71
            Text            =   "dd/mm/yyyy"
            Top             =   1080
            Width           =   1455
         End
         Begin VB.TextBox mskIbgdSno 
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
            Left            =   120
            TabIndex        =   68
            Tag             =   "AhCode"
            Text            =   "0"
            Top             =   1080
            Width           =   615
         End
         Begin VB.TextBox mskIgtVchNo 
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
            Left            =   720
            MaxLength       =   50
            TabIndex        =   69
            Top             =   1080
            Width           =   1215
         End
         Begin VB.TextBox txtIgtVtmName 
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
            Left            =   1920
            MaxLength       =   50
            TabIndex        =   70
            Top             =   1080
            Width           =   2415
         End
         Begin VB.CommandButton cmdDpogOK 
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
            Left            =   10800
            Style           =   1  'Graphical
            TabIndex        =   76
            Top             =   1440
            Width           =   735
         End
         Begin MSFlexGridLib.MSFlexGrid Mfgrd4 
            Height          =   1575
            Left            =   120
            TabIndex        =   67
            Top             =   600
            Width           =   11775
            _ExtentX        =   20770
            _ExtentY        =   2778
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
            Caption         =   "Ipd On A/c. Payment Adjustment Details:"
            BeginProperty Font 
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
            Index           =   35
            Left            =   120
            TabIndex        =   184
            Top             =   240
            Width           =   4215
         End
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
         TabIndex        =   99
         Top             =   8640
         Width           =   1575
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
      Height          =   7575
      Left            =   120
      TabIndex        =   94
      Top             =   720
      Width           =   14175
      Begin VB.Frame frPrintCRList 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   3615
         Left            =   3360
         TabIndex        =   172
         Top             =   1320
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
            TabIndex        =   120
            Top             =   3000
            Width           =   855
         End
         Begin VB.TextBox mskIblVchNo 
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
            TabIndex        =   114
            Tag             =   "AhCode"
            Text            =   "0"
            Top             =   960
            Width           =   1455
         End
         Begin VB.TextBox txtIblVtmName 
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
            TabIndex        =   113
            Top             =   600
            Width           =   3495
         End
         Begin VB.TextBox mskIblVchNo 
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
            TabIndex        =   115
            Tag             =   "AhCode"
            Text            =   "0"
            Top             =   960
            Width           =   1455
         End
         Begin VB.ComboBox cmbCRList 
            Height          =   315
            Left            =   2160
            Style           =   2  'Dropdown List
            TabIndex        =   116
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
            TabIndex        =   118
            Text            =   "0"
            Top             =   2040
            Width           =   1455
         End
         Begin VB.ComboBox cmbPrintDest 
            Height          =   315
            Left            =   2160
            Style           =   2  'Dropdown List
            TabIndex        =   119
            Top             =   2400
            Width           =   3495
         End
         Begin VB.ComboBox cmbPrinterList 
            Height          =   315
            Left            =   2160
            Style           =   2  'Dropdown List
            TabIndex        =   117
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
            TabIndex        =   180
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
            TabIndex        =   179
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
            TabIndex        =   178
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
            TabIndex        =   177
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
            TabIndex        =   176
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
            TabIndex        =   175
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
            TabIndex        =   174
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
            TabIndex        =   173
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
         TabIndex        =   122
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
            TabIndex        =   105
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
            TabIndex        =   112
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
            TabIndex        =   107
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
               TabIndex        =   108
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
               TabIndex        =   109
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
               TabIndex        =   110
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
               TabIndex        =   111
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
            Left            =   4560
            TabIndex        =   104
            Tag             =   "AhCode"
            Text            =   "dd/mm/yyyy"
            Top             =   720
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
            TabIndex        =   103
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
            TabIndex        =   106
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
            TabIndex        =   127
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
            Left            =   3600
            TabIndex        =   126
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
            TabIndex        =   125
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
            TabIndex        =   124
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
            TabIndex        =   123
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
         TabIndex        =   102
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
         TabIndex        =   100
         Top             =   360
         Width           =   4215
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd1 
         Height          =   6615
         Left            =   120
         TabIndex        =   101
         Top             =   720
         Width           =   13935
         _ExtentX        =   24580
         _ExtentY        =   11668
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
         TabIndex        =   121
         Top             =   360
         Width           =   735
      End
   End
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Indoor Bill"
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
      TabIndex        =   93
      Top             =   0
      Width           =   9015
   End
End
Attribute VB_Name = "frmIndoorBill"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Dim mFormLoaded As Boolean, mLastKeyPressed As Integer, mMaskKeyPressed As Integer
Dim mFormUIdCode As Long, mFormIblUIdFileName As String, mFormIblAcsPermFileName As String
Dim mIblCode As Long, mIblIpgCode As Long, mIblPttCode As Long, mQryPttCode As Long, mIblOldIblCode As Long, dtlAddEditMode As Boolean, dtlAddMode As Boolean, dtlEditCanceled As Boolean, mAutoInsServInProcess As Boolean, mIpdDischState As Integer
Dim dtlSdcAddEditMode As Boolean, dtlSdcAddMode As Boolean, dtlSdcEditCanceled As Boolean
Dim dtlDpogAddEditMode As Boolean, dtlDpogAddMode As Boolean, dtlDpogEditCanceled As Boolean
Dim dtlRfugAddEditMode As Boolean, dtlRfugAddMode As Boolean, dtlRfugEditCanceled As Boolean
Dim mRemoteAccess As Boolean, mEntrySaved As Boolean, mEntryAborted As Boolean
Dim dbAcDatabase As New ADODB.Connection, dbHmsDatabase As New ADODB.Connection, dbGrpDatabase As New ADODB.Connection, dbComDatabase As New ADODB.Connection
Dim datRecset As New ADODB.Recordset
Dim mPttRegNo_old As Long
Dim mIblCode_old As Long, mIblDate_old As Date, mIblVtmCode_old As Long, mIblVchNo_old As Long, mIpgCDctCode_old As Long, mPttPcgCode_old As Long, mIpgRByCode_old As Long, mIpgRToCode_old As Long, mIblTime_old As Long, mIblAdvAmt_old As Double
Dim mIblSrvCode_old As Long
Dim mSdcDctCode_old As Long
Dim mIgtCode_old As Long, mIbgdDpogAmt_old As Double, mIgfCode_old As Long, mIbgfRfugAmt_old As Double
Dim clsJRN As clsJournal, clsAH As clsAccountHead, clsIPG As clsHmsSnglTranEntry, clsIBS As clsHmsSnglTranEntry, clsIGT As clsHmsSnglTranEntry, clsIGF As clsHmsSnglTranEntry, clsIBL As clsHmsIpdMultiTranEntry, clsARA As clsComMastEntry, clsSTN As clsComMastEntry, clsVTM As clsComMastEntry, clsHOPT As clsHmsIpdOptionsEntry
Dim clsPAT As clsHmsMasterEntry, clsPCG As clsHmsMasterEntry, clsDCT As clsHmsMasterEntry, clsDIG As clsHmsMasterEntry, clsSRV As clsHmsMasterEntry, clsDRL As clsHmsMasterEntry
Dim mActiveControl As Object, clsListStru As clsSelectQueryStructure
Dim fcmbIblVtmName As clsComFlexSearch
Dim fcmbAdmIpgByIpgNo As clsHmsFlexSearch, fcmbAdmIpgByPttRegNo As clsHmsFlexSearch, fcmbAdmIpgByPttName As clsHmsFlexSearch, fcmbPttName As clsHmsFlexSearch, fcmbPttRegNo As clsHmsFlexSearch, fcmbSrvName As clsHmsFlexSearch, fcmbSDctName As clsHmsFlexSearch, fcmbDrlName As clsHmsFlexSearch
Dim fcmbIgtVchNo As clsHmsFlexSearch, fcmbIgfVchNo As clsHmsFlexSearch

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

Rem service charges column definitions
Const X2IBLICODE_COL = 0
Const X2IBLSNO_COL = 1
Const X2SRVNAME_COL = 2
Const X2SDCFLAG_COL = 3
Const X2IBLUNIT_COL = 4
Const X2IBLRATE_COL = 5
Const X2IBLAMTBEFDISC_COL = 6
Const X2IBLDISCPER_COL = 7
Const X2IBLDISCAMT_COL = 8
Const X2IBLAMTAFTDISC_COL = 9
Const X2IBLADVAMT_COL = 10
Const X2IBLDPOGAMT_COL = 11
Const X2IBLDEPOAMT_COL = 12
Const X2IBLRFUGAMT_COL = 13
Const X2IBLREFUAMT_COL = 14
Const X2IBLBALAMT_COL = 15
Const X2IBLREMARK_COL = 16
Const X2IBLSRVCODE_COL = 17
Const X2IBBSICODE_COL = 18
Const X2IBBSIBSCODE_COL = 19
Const X2IBBSFROMDATE_COL = 20
Const X2IBBSFROMTIME_COL = 21
Const X2IBBSTODATE_COL = 22
Const X2IBBSTOTIME_COL = 23
Const X2IBBSREMARK_COL = 24
Const X2IBLRECSTATE_COL = 25
Const MFGRD2_COLS = 26

Rem service doctor column definitions
Const X3IBDICODE_COL = 0
Const X3IBDSNO_COL = 1
Const X3DCTNAME_COL = 2
Const X3DRLNAME_COL = 3
Const X3IBDREMARK_COL = 4
Const X3IBDDCTCODE_COL = 5
Const X3IBDDRLCODE_COL = 6
Const X3IBDRECSTATE_COL = 7
Const MFGRD3_COLS = 8

Rem Ipd On A/c.Payment adjustment columns
Const X4IBGDICODE_COL = 0
Const X4IBGDSNO_COL = 1
Const X4IGTVCHNO_COL = 2
Const X4IGTVTMNAME_COL = 3
Const X4IGTDATE_COL = 4
Const X4IGTDPOGAMT_COL = 5
Const X4IGTADJAMTEXCL_COL = 6
Const X4IBGDDPOGAMT_COL = 7
Const X4IGTBALAMT_COL = 8
Const X4IBGDIGTCODE_COL = 9
Const X4IBGDRECSTATE_COL = 10
Const MFGRD4_COLS = 11

Rem Ipd On A/c.Refund adjustment columns
Const X5IBGFICODE_COL = 0
Const X5IBGFSNO_COL = 1
Const X5IGFVCHNO_COL = 2
Const X5IGFVTMNAME_COL = 3
Const X5IGFDATE_COL = 4
Const X5IGFRFUGAMT_COL = 5
Const X5IGFADJAMTEXCL_COL = 6
Const X5IBGFRFUGAMT_COL = 7
Const X5IGFBALAMT_COL = 8
Const X5IBGFIGFCODE_COL = 9
Const X5IBGFRECSTATE_COL = 10
Const MFGRD5_COLS = 11

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

dtpFromDate.Text = Dtoc(DefaultEntryDate)
dtpToDate.Text = Dtoc(DefaultEntryDate)
mQryPttCode = 0
mskQryPttRegNo.Text = "": fcmbPttRegNo.BoundText = ""
txtQryPttName.Text = "": fcmbPttName.BoundText = ""
optDetailed.Value = True
optMonthwise.Value = False
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
mIblCode = mAccessCode
End Property

Public Property Get EntryBoundCode() As Long
EntryBoundCode = Val(mskFormBoundField.Text)
End Property

Public Property Get EntryDate() As Date
EntryDate = Ctod(dtpIblDate.Text)
End Property

Public Property Get EntryType() As String
EntryType = "Ibl"
End Property

Public Property Get EntryVtmCode() As Integer
EntryVtmCode = Val(fcmbIblVtmName.BoundText)
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

Private Sub cmbIbsDischState_GotFocus()
FlashActiveControl cmbIbsDischState, True
End Sub

Private Sub cmbIbsDischState_LostFocus()
FlashActiveControl cmbIbsDischState, False
End Sub

Private Sub cmbIbsDischState_Validate(Cancel As Boolean)
Dim mIbsDischDate As Date, mIbsDischTime As Long, mIbsDischState As Integer

mIbsDischState = cmbIbsDischState.ItemData(cmbIbsDischState.ListIndex)
If mIbsDischState = cIBS_STATE_UNKNOWN Then
    ErrorBox "Invalid Discharge Status !!!"
    cmbIbsDischState.SetFocus
    Cancel = True
ElseIf mIbsDischState = cIBS_STATE_OCCUPIED Then
    dtpIbsDischDate.Text = ""
    txtIbsDischTime.Text = ""
ElseIf mIbsDischState = cIBS_STATE_SHIFTED Then
    ErrorBox "Invalid Discharge Status !!!"
    Rem cmbIbsDischState.SetFocus
    Rem Cancel = True
Else
    If dtpIbsDischDate.Text = "" Then
        ErrorBox "Invalid Discharge Date !!!"
        Rem dtpIbsDischDate.SetFocus
    ElseIf txtIbsDischTime.Text = "" Then
        ErrorBox "Invalid Discharge Time !!!"
        Rem txtIbsDischTime.SetFocus
    Else
        mIbsDischDate = Ctod(dtpIbsDischDate.Text)
        mIbsDischTime = TimeToMin(txtIbsDischTime.Text)
        If Not (mIbsDischDate > Ctod(dtpIblDate.Text) Or (mIbsDischDate = Ctod(dtpIblDate.Text) And mIbsDischTime >= TimeToMin(txtIblTime_str.Text))) Then
            ErrorBox "Invalid Discharge Date/Time !!!"
        End If
    End If
End If
'''Call ValidDtl

End Sub

Private Sub cmdAutoServInsert_GotFocus()
FlashActiveControl cmdAutoServInsert, True
End Sub

Private Sub cmdAutoServInsert_LostFocus()
FlashActiveControl cmdAutoServInsert, False
End Sub

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
                    dtpFromDate.Text = Dtoc(MonthStartDate(DateSerial(Val(Left(.fields("IblYrMonth"), 4)), Val(Right(.fields("IblYrMonth"), 2)), 1)))
                    dtpToDate.Text = Dtoc(MonthEndDate(DateSerial(Val(Left(.fields("IblYrMonth"), 4)), Val(Right(.fields("IblYrMonth"), 2)), 1)))
                    optMonthwise.Value = False
                    optDatewise.Value = True
                ElseIf optDatewise.Value = True Then
                    dtpFromDate.Text = Dtoc(.fields("IbhDate"))
                    dtpToDate.Text = Dtoc(.fields("IbhDate"))
                    optDatewise.Value = False
                    optDetailed.Value = True
                ElseIf optPatientwise.Value = True Then
                    Call ChkPttNameListFirstTime
                    Call ChkPttRegNoListFirstTime
                    
                    mQryPttCode = .fields("IbhPttCode")
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
    ElseIf Screen.ActiveControl.Name = Mfgrd3.Name Then
        Mfgrd3_KeyPress vbKeyReturn
    ElseIf Screen.ActiveControl.Name = Mfgrd4.Name Then
        Mfgrd4_KeyPress vbKeyReturn
    ElseIf Screen.ActiveControl.Name = Mfgrd5.Name Then
        Mfgrd5_KeyPress vbKeyReturn
    End If

ElseIf Screen.ActiveControl.Name = txtSdcFlag.Name Then
    txtSdcFlag_KeyPress vbKeyReturn
    If frSdcDtl.Visible = False Then
        SendKeys "{tab}"
    End If

ElseIf Screen.ActiveControl.Name = mskIblDpogAmtTot.Name Then
    mskIblDpogAmtTot_KeyPress vbKeyReturn

ElseIf Screen.ActiveControl.Name = mskIblRfugAmtTot.Name Then
    mskIblRfugAmtTot_KeyPress vbKeyReturn

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
ElseIf dtlSdcAddEditMode = True Then
    dtlSdcEditCanceled = True
    Call cmdSdcOK_Click
ElseIf frSdcDtl.Visible = True Then
    ShowSdcEntryMode False
    mskIblUnit.SetFocus
ElseIf dtlAddEditMode = True Then
    dtlEditCanceled = True
    Call cmdOK_Click
ElseIf dtlDpogAddEditMode = True Then
    dtlDpogEditCanceled = True
    Call cmdDpogOK_Click
ElseIf frDpogAdjDtl.Visible = True Then
    ShowDpogEntryMode False
    mskIblDepoAmtTot.SetFocus
ElseIf dtlRfugAddEditMode = True Then
    dtlRfugEditCanceled = True
    Call cmdRfugOK_Click
ElseIf frRfugAdjDtl.Visible = True Then
    ShowRfugEntryMode False
    mskIblRefuAmtTot.SetFocus
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

Private Sub cmdAutoServInsert_Click()
Dim tRecset As ADODB.Recordset, srow As Integer, mIpgDate As Date, mIpgTime As Long, mIblDate As Date, mIblTime As Long, mUnitCount As Integer, mUnitLocal As Integer
Dim t1Recset As ADODB.Recordset, t2Recset As ADODB.Recordset, t3Recset As ADODB.Recordset, mIbbsFromDate As Date, mIbbsFromTime As Long, mIbbsToDate As Date, mIbbsToTime As Long, mAddBedCharges As Boolean
Dim mAutoInsertServ As Boolean, mIbbsICode_old As Long
Dim mLoopStep As Integer

If mIblIpgCode > 0 And mIblPttCode > 0 And mIpdDischState = cIBS_STATE_OCCUPIED And IIf(ChkBillDate() = False, False, IIf(ChkBillTime() = False, False, True)) Then           ''' And Mfgrd2.Rows < (Mfgrd2.FixedRows + 2)
    If Mfgrd2.Rows < (Mfgrd2.FixedRows + 2) Then
        mAutoInsertServ = (MsgBox("Auto Insert Mendatory Services", vbYesNoCancel + vbDefaultButton1 + vbQuestion, "Automation") = vbYes)
    Else
        mAutoInsertServ = (MsgBox("Auto Insert Mendatory Services", vbYesNoCancel + vbDefaultButton2 + vbQuestion, "Automation") = vbYes)
    End If
    If mAutoInsertServ = True Then
        Me.MousePointer = vbHourglass
        mIpgDate = Ctod(dtpIpgDate.Text)
        mIpgTime = TimeToMin(txtIpgTime_str.Text)
        mIblDate = Ctod(dtpIblDate.Text)
        mIblTime = TimeToMin(txtIblTime_str.Text)
        
        Rem Auto insert marked services (master inherited)
        Rem step first not having association with bed and diagnosis
        Rem step second having association with diagnosis
        For mLoopStep = 0 To 1
            If mLoopStep = 0 Then       ''' General Auto Insertion
                Set tRecset = dbComDatabase.Execute("Select * from ServMast" _
                    & " where SrvAutoInsIpdBill = True" _
                    & " and SrvCode NOT IN (Select distinct SrvCode from ServMast as srv inner join vewBedSrvLnkMst as bdm on srv.SrvCode = bdm.BdmSrvCode where SrvAutoInsIpdBill = True)" _
                    & " and SrvCode NOT IN (Select distinct SrvCode from ServMast as srv inner join DiagSrvMst as dsm on srv.SrvCode = dsm.DsmSrvCode where SrvAutoInsIpdBill = True)" _
                    & " order by SrvIndex")
                    Rem & " inner join IBedState as ibs on bdm.BdmCode=ibs.IbsBdmCode    and IbsIpgCode=" & CStr(mIblIpgCode)  "
            ElseIf mLoopStep = 1 Then   ''' Diagnosis Auto Insertion
                Set tRecset = dbHmsDatabase.Execute("Select * from ServMast as srv" _
                    & " inner join (DiagSrvMst as dsm inner join DiagMast as dig on dsm.DsmCode = dig.DigCode) on srv.SrvCode = dsm.DsmSrvCode" _
                    & " where srv.SrvAutoInsIpdBill = True" _
                    & " and dsm.DsmCode = (Select IpgFDigCode from IndrReg where IpgCode = " & CStr(mIblIpgCode) & ")" _
                    & " order by SrvIndex")
            End If
            With tRecset
            If .EOF = False Then
                txtVoid.SetFocus
                mAutoInsServInProcess = True
                Do While .EOF = False
                    Set t2Recset = dbHmsDatabase.Execute("Select top 1 * from IndrBill" _
                        & " where IblCode = " & CStr(mIblCode) & " and IblSrvCode = " & CStr(.fields("SrvCode")) _
                        & " and IblRecState IN (" & CStr(cREC_ADDED) & "," & CStr(cREC_EDITED) & "," & CStr(cREC_UNCHANGED) & ")")
                    If t2Recset.EOF = True Then ''' checking pre-existence in same bill
                        Set t3Recset = dbHmsDatabase.Execute("Select top 1 * from IndrBill" _
                            & " left join IndrBlHdr on IndrBill.IblCode = IndrBlHdr.IbhCode" _
                            & " where IblCode <> " & CStr(mIblCode) & " and IblIpgCode = " & CStr(mIblIpgCode) & " and IblSrvCode = " & CStr(.fields("SrvCode")) _
                            & " and IblRecState IN (" & CStr(cREC_ADDED) & "," & CStr(cREC_EDITED) & "," & CStr(cREC_UNCHANGED) & ")" _
                            & " order by IblDate desc,IbhTime desc,IblCode desc,IblICode desc")
                        If .fields("SrvAutoInsOnceIpdBill") = False Or t3Recset.EOF = True Then ''' checking pre-existence in other bills of same ipd no when applicable only once
                            mUnitCount = 0
                            srow = FlexNewRow(Mfgrd2)
                            Mfgrd2.Row = srow
                            Mfgrd2_KeyPress vbKeyReturn
                            
                            If .fields("SrvAutoCalcIpdBill") = True Then
                                If t3Recset.EOF = False Then
                                    mUnitCount = mIblDate - t3Recset.fields("IblDate") + IIf(mIblTime > mIpgTime, 1, 0) - IIf(t3Recset.fields("IbhTime") > mIpgTime, 1, 0)
                                Else
                                    mUnitCount = mIblDate - Ctod(dtpIpgDate.Text) + IIf(mIblTime > mIpgTime, 1, 0)
                                End If
                            Else
                                mUnitCount = 1
                            End If
                            mUnitCount = IIf(mUnitCount < 1, IIf(t3Recset.EOF = True, 1, 0), mUnitCount)
                            
                            fcmbSrvName.BoundText = CStr(.fields("SrvCode")): txtSrvName.Text = fcmbSrvName.Text
                            mskIblUnit.Text = ToMyNumFmt(mUnitCount, mDecimals:=0)
                            txtSrvName_Validate False
                            Call ValidDtl
                            Call cmdOK_Click
                        End If
                        CloseTable t3Recset
                    End If
                    CloseTable t2Recset
                    
                    .MoveNext
                Loop
                mAutoInsServInProcess = False
            End If
            End With
            CloseTable tRecset
        Next mLoopStep
        
        Rem Auto insert bed charges ---------------------------------------------------------------
        Set tRecset = dbComDatabase.Execute("Select * from" _
            & " (ServMast as srv inner join vewBedSrvLnkMst as bdm on srv.SrvCode = bdm.BdmSrvCode)" _
            & " inner join IBedState as ibs on bdm.BdmCode = ibs.IbsBdmCode where SrvAutoInsIpdBill = True and IbsIpgCode = " & CStr(mIblIpgCode) _
            & " order by IbsCode,BdmSrvIndex,SrvIndex")
        With tRecset
        If .EOF = False Then
            txtVoid.SetFocus
            mAutoInsServInProcess = True
            Do While .EOF = False
                Set t2Recset = dbHmsDatabase.Execute("Select top 1 * from IndrBill" _
                    & " inner join IndrBlIbsDtl on IndrBill.IblCode = IndrBlIbsDtl.IbbsCode and IndrBill.IblICode = IndrBlIbsDtl.IbbsIblICode" _
                    & " where IblCode = " & CStr(mIblCode) & " and IblIpgCode = " & CStr(mIblIpgCode) & " and IblSrvCode = " & CStr(.fields("SrvCode")) & " and IbbsIbsCode = " & CStr(.fields("IbsCode")) _
                    & " and IblRecState IN (" & CStr(cREC_ADDED) & "," & CStr(cREC_EDITED) & "," & CStr(cREC_UNCHANGED) & ")" _
                    & " and IbbsRecState IN (" & CStr(cREC_ADDED) & "," & CStr(cREC_EDITED) & "," & CStr(cREC_UNCHANGED) & ")")
                If t2Recset.EOF = True Then ''' checking pre-existence of auto-inserted service in same bill
                    Set t3Recset = dbHmsDatabase.Execute("Select top 1 * from (IndrBill" _
                        & " left join IndrBlHdr on IndrBill.IblCode = IndrBlHdr.IbhCode)" _
                        & " inner join IndrBlIbsDtl on IndrBill.IblCode = IndrBlIbsDtl.IbbsCode and IndrBill.IblICode = IndrBlIbsDtl.IbbsIblICode" _
                        & " where IblCode <> " & CStr(mIblCode) & " and IblIpgCode = " & CStr(mIblIpgCode) & " and IblSrvCode = " & CStr(.fields("SrvCode")) & " and IbbsIbsCode = " & CStr(.fields("IbsCode")) _
                        & " and IblRecState IN (" & CStr(cREC_ADDED) & "," & CStr(cREC_EDITED) & "," & CStr(cREC_UNCHANGED) & ")" _
                        & " and IbbsRecState IN (" & CStr(cREC_ADDED) & "," & CStr(cREC_EDITED) & "," & CStr(cREC_UNCHANGED) & ")" _
                        & " order by IblDate desc,IbhTime desc,IblCode desc,IblICode desc")
                    If .fields("SrvAutoInsOnceIpdBill") = False Or t3Recset.EOF = True Then ''' checking pre-existence in other bills of same ipd no when applicable only once
                        mAddBedCharges = True
                        mUnitCount = 0
                        srow = FlexNewRow(Mfgrd2)
                        Mfgrd2.Row = srow
                        Mfgrd2_KeyPress vbKeyReturn
                        
                        Set t1Recset = dbHmsDatabase.Execute("Select top 1 * from IndrBlIbsDtl" _
                            & " where IbbsIpgCode = " & CStr(mIblIpgCode) & " and IbbsIbsCode = " & CStr(.fields("IbsCode")) _
                            & " and IbbsRecState IN (" & CStr(cREC_ADDED) & "," & CStr(cREC_EDITED) & "," & CStr(cREC_UNCHANGED) & ")" _
                            & " order by IbbsToDate desc,IbbsToTime desc")
                        Rem maintain original state of main bed record i.e. BdmSrvIndex = 1
                        If .fields("BdmSrvIndex") = 2 Then  ''' for other bed services linked with main bed service
                            If t1Recset.EOF = False Then
                                mIbbsICode_old = t1Recset.fields("IbbsICode")
                                CloseTable t1Recset
                                Set t1Recset = dbHmsDatabase.Execute("Select top 1 * from IndrBlIbsDtl" _
                                    & " where IbbsIpgCode = " & CStr(mIblIpgCode) & " and IbbsIbsCode = " & CStr(.fields("IbsCode")) _
                                    & " and IbbsRecState IN (" & CStr(cREC_ADDED) & "," & CStr(cREC_EDITED) & "," & CStr(cREC_UNCHANGED) & ")" _
                                    & " and IbbsICode <> " & CStr(mIbbsICode_old) _
                                    & " order by IbbsToDate desc,IbbsToTime desc")
                            End If
                        End If
                        If .fields("IbsDischState") = cIBS_STATE_OCCUPIED Then  ''' yet admitted
                            If t1Recset.EOF = False Then
                                mIbbsFromDate = t1Recset.fields("IbbsToDate")
                                mIbbsFromTime = t1Recset.fields("IbbsToTime")
                            Else
                                mIbbsFromDate = .fields("IbsDate")
                                mIbbsFromTime = .fields("IbsTime")
                            End If
                            
                            mIbbsToDate = mIblDate
                            mIbbsToTime = mIblTime
                            If .fields("BdmChkOutTimeBasis") = cBDM_CHKOUTTIMEBASIS_FIXEDTIME Then
                                If t1Recset.EOF = False Then        ''' Or t3Recset.EOF = False
                                    mUnitCount = mIbbsToDate - mIbbsFromDate + IIf(mIbbsToTime > .fields("BdmChkTime"), 1, 0) - IIf(mIbbsFromTime > .fields("BdmChkTime"), 1, 0)
                                Else
                                    mUnitCount = mIbbsToDate - mIbbsFromDate + IIf(mIbbsToTime > .fields("BdmChkTime"), 1, 0)
                                End If
                            Else
                                If t1Recset.EOF = False Or t3Recset.EOF = False Then
                                    mUnitCount = mIbbsToDate - mIbbsFromDate + IIf(mIbbsToTime > mIpgTime, 1, 0) - IIf(mIbbsFromTime > mIpgTime, 1, 0)
                                Else
                                    mUnitCount = mIbbsToDate - mIbbsFromDate + IIf(mIbbsToTime > mIpgTime, 1, 0)
                                End If
                            End If
                            txtIbbsRemark.Text = Trim(.fields("BdmName")) & " From " & Dtoc(mIbbsFromDate) & "/" & MinToTime(mIbbsFromTime) & " To " & Dtoc(mIbbsToDate) & "/" & MinToTime(mIbbsToTime) & " Occupied"
                            
                        ElseIf .fields("IbsDischState") = cIBS_STATE_SHIFTED Then       ''' bed shifting
                            If t1Recset.EOF = False Then
                                If .fields("IbsDischDate") > t1Recset.fields("IbbsToDate") Or (.fields("IbsDischDate") = t1Recset.fields("IbbsToDate") And .fields("IbsDischTime") > t1Recset.fields("IbbsToTime")) Then
                                    Rem mAddBedCharges = True
                                    mIbbsFromDate = t1Recset.fields("IbbsToDate")
                                    mIbbsFromTime = t1Recset.fields("IbbsToTime")
                                Else
                                    mAddBedCharges = False
                                End If
                            Else
                                mIbbsFromDate = .fields("IbsDate")
                                mIbbsFromTime = .fields("IbsTime")
                            End If
                            
                            mIbbsToDate = .fields("IbsDischDate")
                            mIbbsToTime = .fields("IbsDischTime")
                            
                            If mAddBedCharges = True Then
                                If .fields("BdmChkOutTimeBasis") = cBDM_CHKOUTTIMEBASIS_FIXEDTIME Then
                                    If t1Recset.EOF = False Then    ''' Or t3Recset.EOF = False
                                        mUnitCount = mIbbsToDate - mIbbsFromDate + IIf(mIbbsToTime > .fields("BdmChkTime"), 1, 0) - IIf(mIbbsFromTime > .fields("BdmChkTime"), 1, 0)
                                    Else
                                        mUnitCount = mIbbsToDate - mIbbsFromDate + IIf(mIbbsToTime > .fields("BdmChkTime"), 1, 0)
                                    End If
                                Else
                                    If t1Recset.EOF = False Then    ''' Or t3Recset.EOF = False
                                        mUnitCount = mIbbsToDate - mIbbsFromDate + IIf(mIbbsToTime > mIpgTime, 1, 0) - IIf(mIbbsFromTime > mIpgTime, 1, 0)
                                    Else
                                        mUnitCount = mIbbsToDate - mIbbsFromDate + IIf(mIbbsToTime > mIpgTime, 1, 0)
                                    End If
                                End If
                                txtIbbsRemark.Text = Trim(.fields("BdmName")) & " From " & Dtoc(mIbbsFromDate) & "/" & MinToTime(mIbbsFromTime) & " To " & Dtoc(mIbbsToDate) & "/" & MinToTime(mIbbsToTime) & " Shifted"
                            End If
                            
                        Else    ''' discharged  generaly this situation will be avoided because no transaction will be made after patient discharge
                            If t1Recset.EOF = False Then
                                If .fields("IbsDischDate") > t1Recset.fields("IbbsToDate") Or (.fields("IbsDischDate") = t1Recset.fields("IbbsToDate") And .fields("IbsDischTime") > t1Recset.fields("IbbsToTime")) Then
                                    Rem mAddBedCharges = True
                                    mIbbsFromDate = t1Recset.fields("IbbsToDate")
                                    mIbbsFromTime = t1Recset.fields("IbbsToTime")
                                Else
                                    mAddBedCharges = False
                                End If
                            Else
                                mIbbsFromDate = .fields("IbsDate")
                                mIbbsFromTime = .fields("IbsTime")
                            End If
                            
                            mIbbsToDate = .fields("IbsDischDate")
                            mIbbsToTime = .fields("IbsDischTime")
                            If mAddBedCharges = True Then
                                If .fields("BdmChkOutTimeBasis") = cBDM_CHKOUTTIMEBASIS_FIXEDTIME Then
                                    If t1Recset.EOF = False Then    ''' Or t3Recset.EOF = False
                                        mUnitCount = mIbbsToDate - mIbbsFromDate + IIf(mIbbsToTime > .fields("BdmChkTime"), 1, 0) - IIf(mIbbsFromTime > .fields("BdmChkTime"), 1, 0)
                                    Else
                                        mUnitCount = mIbbsToDate - mIbbsFromDate + IIf(mIbbsToTime > .fields("BdmChkTime"), 1, 0)
                                    End If
                                Else
                                    If mIbbsToTime > mIpgTime Then
                                        mUnitCount = mIbbsToDate - mIbbsFromDate + IIf(mIbbsToTime > mIpgTime, 1, 0) - IIf(mIbbsFromTime > mIpgTime, 1, 0)
                                    Else
                                        mUnitCount = mIbbsToDate - mIbbsFromDate + IIf(mIbbsToTime > mIpgTime, 1, 0)
                                    End If
                                End If
                                txtIbbsRemark.Text = Trim(.fields("BdmName")) & " From " & Dtoc(mIbbsFromDate) & "/" & MinToTime(mIbbsFromTime) & " To " & Dtoc(mIbbsToDate) & "/" & MinToTime(mIbbsToTime) & " Discharged/Leaved"
                            End If
                        End If
                        mUnitCount = IIf(mUnitCount < 1, IIf(t1Recset.EOF = True, 1, 0), mUnitCount)
                        CloseTable t1Recset
                        If mAddBedCharges = True Then
                            mskIbbsIbsCode.Text = .fields("IbsCode")
                            dtpIbbsFromDate.Text = Dtoc(mIbbsFromDate)
                            mskIbbsFromTime.Text = MinToTime(mIbbsFromTime)
                            dtpIbbsToDate.Text = Dtoc(mIbbsToDate)
                            mskIbbsToTime.Text = MinToTime(mIbbsToTime)
                            fcmbSrvName.BoundText = CStr(.fields("SrvCode")): txtSrvName.Text = fcmbSrvName.Text
                            mskIblUnit.Text = ToMyNumFmt(mUnitCount, mDecimals:=0)
                            Rem txtSrvName_Validate False
                            ChkBedRate mBdmCode:=.fields("IbsBdmCode")
                            If .fields("BdmSrvIndex") = 2 Then
                                mskIblRate.Text = ToMyNumFmt(.fields("BdmCharges"))
                            End If
                            Call CalcIblChg
                            Call ChkIblICode
                            Rem ------------------
                            Call ValidDtl
                            Call cmdOK_Click
                        End If
                    End If
                    CloseTable t3Recset
                End If
                CloseTable t2Recset
                
                .MoveNext
            Loop
            mAutoInsServInProcess = False
        End If
        End With
        CloseTable tRecset
        Me.MousePointer = vbNormal
        
        Call AutoServIndex
        
    Else
        Call AutoServIndex
'''        'If Mfgrd2.Enabled = True Then
'''            Mfgrd2.SetFocus
'''        'End If
    End If
    Mfgrd2.Row = 1
    txtVoid.SetFocus
    Mfgrd2.SetFocus
End If

End Sub

Private Sub AutoServIndex()
Rem Auto arrange services in display indexing order
If Mfgrd2.Rows > (Mfgrd2.FixedRows + 1) Then
    If MsgBox("Auto-Arrange Services in Respective Index Order", vbYesNoCancel + vbDefaultButton1 + vbQuestion, "Automation") = vbYes Then
        Me.MousePointer = vbHourglass
        ResetIpdBillSrvIndexOrder cnn:=dbHmsDatabase, mIblCode:=mIblCode
        ShowDtlData mIblCode
        Me.MousePointer = vbNormal
    End If
End If

End Sub

Private Sub cmdOK_Click()
Dim tRecset As New ADODB.Recordset, srow As Integer, mIblSno As Integer, mIblICode As Long

srow = Mfgrd2.Row
mIblSno = Val(Mfgrd2.TextMatrix(srow, X2IBLSNO_COL))
mIblICode = Val(Mfgrd2.TextMatrix(srow, X2IBLICODE_COL))

Call ValidDtl    ' to check any service doctor detail for multidoctor detail service for false

If cmdOK.Caption = "&OK" And dtlEditCanceled = False Then
    With clsIBL
    If dtlAddMode = True Then
        .ClearDtl
    Else
        .GetDtlData mIblCode, mIblICode
    End If
    .mTrnCode_lng = mIblCode
    .mTrnDtlSno_int = Val(UnMyNumFmt(mskIblSno.Text))
    .mTrnDate_dt = Ctod(dtpIblDate.Text)
    .mTrnCmpCode_int = sFinYrCmpCode
    
    .mIblIpgCode_lng = mIblIpgCode
    .mIblPttCode_lng = mIblPttCode
    .mIblSrvCode_dbl = Val(fcmbSrvName.BoundText)
    .mIblUnit_dbl = Val(UnMyNumFmt(mskIblUnit.Text))
    .mIblRate_dbl = Val(UnMyNumFmt(mskIblRate.Text))
    .mIblAmtBefDisc_dbl = Val(UnMyNumFmt(mskIblAmtBefDisc.Text))
    .mIblDiscPer_dbl = Val(UnMyPerFmt(mskIblDiscPer.Text))
    .mIblDiscAmt_dbl = Val(UnMyNumFmt(mskIblDiscAmt.Text))
    .mIblAmtAftDisc_dbl = Val(UnMyNumFmt(mskIblAmtAftDisc.Text))
    .mIblRemark_str = ""
    ' indoor bed status detail -------------------
    If dtlAddMode = False And Val(fcmbSrvName.BoundText) <> mIblSrvCode_old And Val(mskIbbsIbsCode.Text) > 0 Then
        AlertBox "Bed Charges Automation De-Linked !!!"
        .mIbbsIbsCode_lng = 0
    Else
        .mIbbsIbsCode_lng = Val(mskIbbsIbsCode.Text)
    End If
    .mIbbsIpgCode_lng = mIblIpgCode
    .mIbbsSno_int = .mIbbsSno_int
    .mIbbsFromDate_dt = Ctod(dtpIbbsFromDate.Text)
    .mIbbsFromTime_lng = TimeToMin(mskIbbsFromTime.Text)
    .mIbbsToDate_dt = Ctod(dtpIbbsToDate.Text)
    .mIbbsToTime_lng = TimeToMin(mskIbbsToTime.Text)
    .mIbbsUnit_int = Val(UnMyNumFmt(mskIblUnit.Text))
    .mIbbsRemark_str = txtIbbsRemark.Text
    .mIbbsCmpCode_int = sFinYrCmpCode
    
    If dtlAddMode = True Then
        .mIblAdvAmt_dbl = 0
        .mIblDpogAmt_dbl = 0
        .mIblDepoAmt_dbl = 0
        .mIblRfugAmt_dbl = 0
        .mIblRefuAmt_dbl = 0
        .mIblBalAmt_dbl = 0
        
        If .AddNewDtl(mIblCode) = True Then
            mIblICode = .mTrnDtlICode_lng
        End If
    Else
        .UpdateDtl mIblCode, mIblICode
    End If
    End With
    
    RefreshDatabase dbHmsDatabase
    With tRecset
    .open "Select * from IndrBill" _
        & " left join IndrBlIbsDtl on IndrBill.IblCode = IndrBlIbsDtl.IbbsCode and IndrBill.IblICode = IndrBlIbsDtl.IbbsIblICode" _
        & " where IblCode = " & CStr(mIblCode) & " and IblICode = " & CStr(mIblICode) _
        & "", dbHmsDatabase, adOpenKeyset, adLockOptimistic
        
    clsSRV.GetData .fields("IblSrvCode")
    
    Mfgrd2.TextMatrix(srow, X2IBLICODE_COL) = .fields("IblICode")
    Mfgrd2.TextMatrix(srow, X2IBLSNO_COL) = ToMyNumFmt(.fields("IblSno"), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2SRVNAME_COL) = clsSRV.mName_str
    If GetServDctDtlCount(cnn:=dbHmsDatabase, mTableName:="IndrBlDctDtl", mSdcCodeField:="IbdCode", mSdcCode:=.fields("IblCode"), mSdcSubCodeField:="IbdIblCode", mSdcSubCode:=.fields("IblICode")) > 0 Then
        Mfgrd2.TextMatrix(srow, X2SDCFLAG_COL) = "Y"
    Else
        If clsSRV.mSrvMultiDctIncl_bln = True Then
            Mfgrd2.TextMatrix(srow, X2SDCFLAG_COL) = "N"
        Else
            Mfgrd2.TextMatrix(srow, X2SDCFLAG_COL) = ""
        End If
    End If
    Mfgrd2.TextMatrix(srow, X2IBLUNIT_COL) = ToMyNumFmt(.fields("IblUnit"), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2IBLRATE_COL) = ToMyNumFmt(.fields("IblRate"))
    Mfgrd2.TextMatrix(srow, X2IBLAMTBEFDISC_COL) = ToMyNumFmt(.fields("IblAmtBefDisc"))
    Mfgrd2.TextMatrix(srow, X2IBLDISCPER_COL) = ToMyPerFmt(.fields("IblDiscPer"))
    Mfgrd2.TextMatrix(srow, X2IBLDISCAMT_COL) = ToMyNumFmt(.fields("IblDiscAmt"))
    Mfgrd2.TextMatrix(srow, X2IBLAMTAFTDISC_COL) = ToMyNumFmt(.fields("IblAmtAftDisc"))
    Mfgrd2.TextMatrix(srow, X2IBLADVAMT_COL) = ToMyNumFmt(.fields("IblAdvAmt"))
    Mfgrd2.TextMatrix(srow, X2IBLDPOGAMT_COL) = ToMyNumFmt(.fields("IblDpogAmt"))
    Mfgrd2.TextMatrix(srow, X2IBLDEPOAMT_COL) = ToMyNumFmt(.fields("IblDepoAmt"))
    Mfgrd2.TextMatrix(srow, X2IBLRFUGAMT_COL) = ToMyNumFmt(.fields("IblRfugAmt"))
    Mfgrd2.TextMatrix(srow, X2IBLREFUAMT_COL) = ToMyNumFmt(.fields("IblRefuAmt"))
    Mfgrd2.TextMatrix(srow, X2IBLBALAMT_COL) = ToMyNumFmt(.fields("IblBalAmt"))
    Mfgrd2.TextMatrix(srow, X2IBLREMARK_COL) = .fields("IblRemark")
    Mfgrd2.TextMatrix(srow, X2IBLSRVCODE_COL) = .fields("IblSrvCode")
    Mfgrd2.TextMatrix(srow, X2IBLRECSTATE_COL) = .fields("IblRecState")
    If IsNull(.fields("IbbsCode")) = False And InList(.fields("IbbsRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
        Mfgrd2.TextMatrix(srow, X2IBBSICODE_COL) = .fields("IbbsICode")
        Mfgrd2.TextMatrix(srow, X2IBBSIBSCODE_COL) = .fields("IbbsIbsCode")
        Mfgrd2.TextMatrix(srow, X2IBBSFROMDATE_COL) = Dtoc(.fields("IbbsFromDate"))
        Mfgrd2.TextMatrix(srow, X2IBBSFROMTIME_COL) = MinToTime(.fields("IbbsFromTime"))
        Mfgrd2.TextMatrix(srow, X2IBBSTODATE_COL) = Dtoc(.fields("IbbsToDate"))
        Mfgrd2.TextMatrix(srow, X2IBBSTOTIME_COL) = MinToTime(.fields("IbbsToTime"))
        Mfgrd2.TextMatrix(srow, X2IBBSREMARK_COL) = .fields("IbbsRemark")
    End If
    
    End With
    CloseTable tRecset
    
    If dtlAddMode = True Then
        Mfgrd2.Rows = Mfgrd2.Rows + 1
    End If
    srow = srow + 1
    Mfgrd2.Row = srow
    
    Call CalcFtrTotal
Else
    clsIBL.CancelSdcTran mIblCode, mIblICode
End If
dtlAddEditMode = False
dtlAddMode = False
dtlEditCanceled = False
ShowSdcEntryMode False
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
    txtSearch1Text_InterActiveChange Format(Ctod(dtpIblDate.Text), "yyyymmdd") + Format(mIblCode, "0000000")
ElseIf optMonthwise.Value = True Then
    txtSearch1Text_InterActiveChange Format(Ctod(dtpIblDate.Text), "yyyy") & "/" & Format(Ctod(dtpIblDate.Text), "mm")
ElseIf optDatewise.Value = True Then
    txtSearch1Text_InterActiveChange Format(Ctod(dtpIblDate.Text), "yyyymmdd")
ElseIf optPatientwise.Value = True Then
    txtSearch1Text_InterActiveChange txtPttName.Text
End If

Call ShowEntryMode(False)
Mfgrd1.SetFocus

End Sub

Private Sub cmdSaveForm_GotFocus()
Dim mIblAcsPermNo As Integer, mRetryCount As Integer

txtVoid.SetFocus
cmdSaveForm.Enabled = False
If Data_Verify() = True Then
    If CanAccept() = True Then
        If GetAccessPerm(mIblAcsPermNo, mRetryCount, mFormIblAcsPermFileName) = True And mRetryCount = 0 Then
            If Data_NetwAuth() = True Then
                Call cmdSaveForm_Click
                Close #mIblAcsPermNo
                If mRemoteAccess = True Then
                    ''Unload Me
                    Me.Hide
                    Exit Sub
                Else
                    Call Mfgrd1_RowColChange
                    Data_PrintDialog "SaveEvent"
                End If
            Else
                Close #mIblAcsPermNo
            End If
        Else
            Close #mIblAcsPermNo
            AlertBox "System Busy, Try Again !!!"
            
            txtPttName.SetFocus
        End If
    Else
        txtPttName.SetFocus
    End If
End If
cmdSaveForm.Enabled = True
End Sub

Private Sub cmdSdcOK_Click()
Dim tRecset As New ADODB.Recordset, srow As Integer, mIbdSno As Integer, mIbdICode As Long, mIbdIblCode As Long, mIbdSrvCode As Long

srow = Mfgrd3.Row
mIbdSno = Val(Mfgrd3.TextMatrix(srow, X3IBDSNO_COL))
mIbdICode = Val(Mfgrd3.TextMatrix(srow, X3IBDICODE_COL))
mIbdIblCode = Val(Mfgrd2.TextMatrix(Mfgrd2.Row, X2IBLICODE_COL))
mIbdSrvCode = Val(fcmbSrvName.BoundText)

If cmdSdcOK.Caption = "&OK" And dtlSdcEditCanceled = False Then
    With clsIBL
    If dtlSdcAddMode = True Then
        .ClearSdc
    Else
        .GetSdcData mIblCode, mIbdIblCode, mIbdICode
    End If
    .mSdcCode_lng = mIblCode
    .mSdcSubCode_lng = mIbdIblCode
    .mSdcSno_int = Val(UnMyNumFmt(mskIbdSno.Text))
    .mSdcDate_dt = Ctod(dtpIblDate.Text)
    .mSdcSrvCode_lng = mIbdSrvCode
    .mSdcPttCode_lng = mIblPttCode
    .mSdcDctCode_lng = Val(fcmbSDctName.BoundText)
    .mSdcDrlCode_lng = Val(fcmbDrlName.BoundText)
    .mSdcRemark_str = txtIbdRemark.Text
    .mSdcCmpCode_int = sFinYrCmpCode
    
    If dtlSdcAddMode = True Then
        .AddNewSdc mIblCode, mIbdIblCode
        mIbdICode = .mSdcICode_lng
    Else
        .UpdateSdc mIblCode, mIbdIblCode, mIbdICode
    End If
    End With
    
    RefreshDatabase dbHmsDatabase
    With tRecset
    .open "Select * from IndrBlDctDtl where IbdCode=" & CStr(mIblCode) & " and IbdIblCode=" & CStr(mIbdIblCode) & " and IbdICode=" & CStr(mIbdICode) & "", dbHmsDatabase, adOpenKeyset, adLockOptimistic
    
    clsDCT.GetData .fields("IbdDctCode")
    clsDRL.GetData .fields("IbdDrlCode")
    
    Mfgrd3.TextMatrix(srow, X3IBDICODE_COL) = .fields("IbdICode")
    Mfgrd3.TextMatrix(srow, X3IBDSNO_COL) = ToMyNumFmt(.fields("IbdSno"), mDecimals:=0)
    Mfgrd3.TextMatrix(srow, X3DCTNAME_COL) = clsDCT.mName_str
    Mfgrd3.TextMatrix(srow, X3DRLNAME_COL) = clsDRL.mName_str
    Mfgrd3.TextMatrix(srow, X3IBDREMARK_COL) = .fields("IbdRemark")
    Mfgrd3.TextMatrix(srow, X3IBDDCTCODE_COL) = .fields("IbdDctCode")
    Mfgrd3.TextMatrix(srow, X3IBDDRLCODE_COL) = .fields("IbdDrlCode")
    Mfgrd3.TextMatrix(srow, X3IBDRECSTATE_COL) = .fields("IbdRecState")
    
    End With
    CloseTable tRecset
    
    If dtlSdcAddMode = True Then
        Mfgrd3.Rows = Mfgrd3.Rows + 1
    End If
    srow = srow + 1
    Mfgrd3.Row = srow
    
End If
dtlSdcAddEditMode = False
dtlSdcAddMode = False
dtlSdcEditCanceled = False
VisibleSdcControls False
txtVoid.SetFocus
Mfgrd3.SetFocus
CloseTable tRecset, mCheckOpen:=True

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

Private Sub dtpIbsDischDate_GotFocus()
FlashActiveControl dtpIbsDischDate, True
End Sub

Private Sub dtpIbsDischDate_LostFocus()
FlashActiveControl dtpIbsDischDate, False
End Sub

Private Sub dtpIbsDischDate_Validate(Cancel As Boolean)
Dim tRecset As New ADODB.Recordset, srow As Integer, mIbsCode As Long, mIbsDischDate As Date, mIbsDischDate_old As Date

'''srow = Mfgrd3.Row
If dtpIbsDischDate.Text <> "" Then
    dtpIbsDischDate.Text = ToMyDate(dtpIbsDischDate.Text)
    If Ctod(dtpIbsDischDate.Text) < Ctod(dtpIblDate.Text) Then
        ErrorBox "Invalid Discharge Date !!!"
        dtpIbsDischDate.SetFocus
        Cancel = True
    Else
        mIbsDischDate = Ctod(dtpIbsDischDate.Text)
        Set tRecset = dbHmsDatabase.Execute("Select * from ((IndrBlIbsDtl" _
            & " inner join IBedState on IndrBlIbsDtl.IbbsIbsCode = IBedState.IbsCode)" _
            & " inner join IndrBill on IndrBlIbsDtl.IbbsCode = IndrBill.IblCode and IndrBlIbsDtl.IbbsIblICode = IndrBill.IblICode)" _
            & " left join IndrBlHdr on IndrBill.IblCode = IndrBlHdr.IbhCode" _
            & " where IbbsIpgCode = " & CStr(mIblIpgCode) & " and IbbsCode <> " & CStr(mIblCode) & " and IbbsToDate >= #" & CStr(ToSysDate(mIbsDischDate)) & "#" _
            & " order by IbbsToDate Desc,IbbsToTime desc,IbbsICode desc" & "")
        With tRecset
        If .EOF = False Then
            If .fields("IbbsToDate") > mIbsDischDate Then
                If IsNull(.fields("IbhCode")) = False Then
                    ErrorBox "Bed Charges Already Charged in Indoor Bill No." & CStr(.fields("IbhVchNo")) & " Dated " & Dtoc(.fields("IbhDate")) & " " & MinToTime(.fields("IbhTime")) & " !!!"
                Else
                    ErrorBox "Bed Charges Already Charged in Indoor Bill Dated " & Dtoc(.fields("IblDate")) & " Under Process !!!"
                End If
                dtpIbsDischDate.Text = ""
                dtpIbsDischDate.SetFocus
                Cancel = True
            End If
        End If
        End With
        CloseTable tRecset
    End If
    
'''    mIbsDischDate = Ctod(dtpIbsDischDate.Text)
'''    mIbsDischDate_old = Ctod(Mfgrd3.TextMatrix(srow, X3IBSDISCHDATE_COL))
'''    mIbsCode = Val(Mfgrd3.TextMatrix(srow, X3IBSCODE_COL))
'''    If dtlAddMode = False And Cancel = False Then
'''        If mIbsDischDate <> mIbsDischDate_old Then
'''            With tRecset
'''            .open "Select * from ((IndrBlIbsDtl" _
'''                & " inner join IBedState on IndrBlIbsDtl.IbbsIbsCode = IBedState.IbsCode)" _
'''                & " inner join IndrBill on IndrBlIbsDtl.IbbsCode = IndrBill.IblCode and IndrBlIbsDtl.IbbsIblICode = IndrBill.IblICode)" _
'''                & " left join IndrBlHdr on IndrBill.IblCode = IndrBlHdr.IbhCode" _
'''                & " where IbbsIpgCode = " & CStr(Val(lblIbsIpgCode.Caption)) & " and IbbsIbsCode = " & CStr(mIbsCode) _
'''                & " order by IblDate Desc" & "", dbHmsDatabase, adOpenKeyset, adLockReadOnly
'''            If .EOF = False Then
'''                If .fields("IbbsToDate") > mIbsDischDate Then
'''                    If IsNull(.fields("IbhCode")) = False Then
'''                        ErrorBox "Bed Charges Already Charged in Indoor Bill No." & CStr(.fields("IbhVchNo")) & " Dated " & Dtoc(.fields("IbhDate")) & " !!!"
'''                    Else
'''                        ErrorBox "Bed Charges Already Charged in Indoor Bill Dated " & Dtoc(.fields("IblDate")) & " Under Process !!!"
'''                    End If
'''                    If Mfgrd3.TextMatrix(srow, X3IBSDISCHDATE_COL) = "" Then
'''                        dtpIbsDischDate.Text = ""
'''                    Else
'''                        dtpIbsDischDate.Text = Dtoc(mIbsDischDate_old)
'''                    End If
'''                    dtpIbsDischDate.SetFocus
'''                    Cancel = True
'''                End If
'''            End If
'''            End With
'''            CloseTable tRecset
'''        End If
'''    End If
End If
'''Call ValidDtl

End Sub


Private Sub dtpIgfDate_GotFocus()
FlashActiveControl dtpIgfDate, True
End Sub

Private Sub dtpIgfDate_LostFocus()
FlashActiveControl dtpIgfDate, False
End Sub

Private Sub dtpIgtDate_GotFocus()
FlashActiveControl dtpIgtDate, True
End Sub

Private Sub dtpIgtDate_LostFocus()
FlashActiveControl dtpIgtDate, False
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

Private Sub dtpIblDate_GotFocus()
FlashActiveControl dtpIblDate, True
End Sub

Private Sub dtpIblDate_LostFocus()
FlashActiveControl dtpIblDate, False
End Sub

Private Sub dtpIblDate_Validate(Cancel As Boolean)
dtpIblDate.Text = ToMyDate(dtpIblDate.Text)
If IsFinYrDate(Ctod(dtpIblDate.Text)) = False Then
    ErrorBox "Invalid Financial Year Date !!!"
    dtpIblDate.SetFocus
    Cancel = True
ElseIf ChkBillDate() = False Then
    Rem ErrorBox "Invalid Bill Date !!!"
    dtpIblDate.SetFocus
    Cancel = True
Else
'''    Call ChkServRate
'''    Call CalcIblChg
End If

End Sub

Private Function ChkBillDate() As Boolean
Dim tRecset As New ADODB.Recordset, mRtnval As Boolean

If FormAddEditMode = cFORM_EDITMODE And mIblDate_old = Ctod(dtpIblDate.Text) Then
    ChkBillDate = True
    Exit Function
End If

mRtnval = True
Set tRecset = dbHmsDatabase.Execute("Select top 1 * from IndrBill" _
    & " left join IndrBlHdr on IndrBill.IblCode = IndrBlHdr.IbhCode" _
    & " where IblIpgCode = " & CStr(mIblIpgCode) & " and IblCode <> " & CStr(mIblCode) _
    & " order by IblDate desc,IbhTime desc,IblCode desc,IblICode desc")
With tRecset
If .EOF = False Then
    If .fields("IblDate") > Ctod(dtpIblDate.Text) Then
        mRtnval = False
        If IsNull(.fields("IbhCode")) = False Then
            ErrorBox "Prior Bill Exist vide Bill No." & CStr(.fields("IbhVchNo")) & " Dated " & Dtoc(.fields("IblDate")) & " " & MinToTime(.fields("IbhTime")) & " !!!"
        Else
            ErrorBox "Prior Bill Under Process Dated " & Dtoc(.fields("IblDate")) & " !!!"
        End If
    End If
End If
End With
CloseTable tRecset

If mRtnval = True Then
    If Ctod(dtpIpgDate.Text) > Ctod(dtpIblDate.Text) Then
        mRtnval = False
        ErrorBox "Admission Date Greater than Bill Date !!!"
    End If
End If

If mRtnval = True Then
    Set tRecset = dbHmsDatabase.Execute("Select * from (IndrBill" _
        & " inner join IndrBlIbsDtl on IndrBill.IblCode = IndrBlIbsDtl.IbbsCode and IndrBill.IblICode = IndrBlIbsDtl.IbbsIblICode)" _
        & " inner join IBedState on IndrBlIbsDtl.IbbsIbsCode = IBedState.IbsCode" _
        & " where IblCode = " & CStr(mIblCode) _
        & " order by IblSno")
    With tRecset
    If .EOF = False Then
        Do While .EOF = False
            If .fields("IbsDischState") <> cIBS_STATE_SHIFTED And .fields("IbbsToDate") <> Ctod(dtpIblDate.Text) Then
                mRtnval = False
                ErrorBox "Mismatch Bill Date " & Dtoc(dtpIblDate.Text) & " with Generated Bed Status Date " & Dtoc(.fields("IbbsToDate")) & " !!!"
                Exit Do
            End If
            .MoveNext
        Loop
    End If
    End With
    CloseTable tRecset
End If

ChkBillDate = mRtnval

Set tRecset = Nothing

End Function

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
        If mIblCode = 0 Then
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

mFormIblUIdFileName = "IndrBill.Uid"
mFormIblAcsPermFileName = "IndrBill.Acp"
mFormUIdCode = GetUIdCode(mProcess:=Me.Name, mUIdFileName:=mFormIblUIdFileName, mAcsPermFileName:=mFormIblAcsPermFileName)

mAutoInsServInProcess = False
mIpdDischState = 0
mFormLoaded = False
mEntrySaved = False: mEntryAborted = False
SetFormSize Me, frmMain
Call Form_Resize

Call SetVoidControl(txtVoid)
txtSearch1Text.Enabled = False
frConfigure.Visible = False
frPrintCRList.Visible = False
txtSdcFlag.Locked = True
mskIblDiscPer.Tag = False
mskIblDiscAmt.Tag = False

ChkCustomForm Me, CfsFileFullPath("IndrBill.Cfs")

OpenAcDataSource dbAcDatabase
OpenHmsDataSource dbHmsDatabase
OpenGrpDataSource dbGrpDatabase
OpenComDataSource dbComDatabase

AddItemToComboFromList mCmbObj:=cmbIbsDischState, mList:=cIPD_DISCHARGE_STATE, mSprtr:=","

Set clsListStru = New clsSelectQueryStructure

Set clsHOPT = New clsHmsIpdOptionsEntry
clsHOPT.blnIndrBillOptMast = True
clsHOPT.Init
clsHOPT.GetIndrBillOptData

Set clsAH = New clsAccountHead
Set clsAH.dbAcDatabase = dbAcDatabase
Set clsAH.dbGrpDatabase = dbGrpDatabase

Set clsIPG = New clsHmsSnglTranEntry
Set clsIPG.dbAcDatabase = dbAcDatabase
Set clsIPG.dbHmsDatabase = dbHmsDatabase
clsIPG.blnIndrRegTran = True
clsIPG.Init

Set clsIBS = New clsHmsSnglTranEntry
Set clsIBS.dbAcDatabase = dbAcDatabase
Set clsIBS.dbHmsDatabase = dbHmsDatabase
clsIBS.blnIndrBedStatus = True
clsIBS.Init

Set clsIGT = New clsHmsSnglTranEntry
Set clsIGT.dbAcDatabase = dbAcDatabase
Set clsIGT.dbHmsDatabase = dbHmsDatabase
clsIGT.blnIndrRgPymtTran = True
clsIGT.Init

Set clsIGF = New clsHmsSnglTranEntry
Set clsIGF.dbAcDatabase = dbAcDatabase
Set clsIGF.dbHmsDatabase = dbHmsDatabase
clsIGF.blnIndrRgRefdTran = True
clsIGF.Init

Set clsIBL = New clsHmsIpdMultiTranEntry
Set clsIBL.dbAcDatabase = dbAcDatabase
Set clsIBL.dbHmsDatabase = dbHmsDatabase
clsIBL.blnIndrBillTran = True
clsIBL.Init

Set clsPAT = New clsHmsMasterEntry
Set clsPAT.dbAcDatabase = dbAcDatabase
Set clsPAT.dbHmsDatabase = dbHmsDatabase
clsPAT.blnPatMast = True
clsPAT.Init

Set clsPCG = New clsHmsMasterEntry
Set clsPCG.dbHmsDatabase = dbHmsDatabase
clsPCG.blnPatCatgMast = True
clsPCG.Init

Set clsDCT = New clsHmsMasterEntry
Set clsDCT.dbHmsDatabase = dbHmsDatabase
clsDCT.blnDoctMast = True
clsDCT.Init

Set clsDIG = New clsHmsMasterEntry
Set clsDIG.dbHmsDatabase = dbHmsDatabase
clsDIG.blnDiagMast = True
clsDIG.Init

Set clsSRV = New clsHmsMasterEntry
Set clsSRV.dbHmsDatabase = dbHmsDatabase
clsSRV.blnServMast = True
clsSRV.Init

Set clsDRL = New clsHmsMasterEntry
Set clsDRL.dbHmsDatabase = dbHmsDatabase
clsDRL.blnDoctRoleMast = True
clsDRL.Init

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

Set fcmbIblVtmName = New clsComFlexSearch
Set fcmbIblVtmName.dbAcDatabase = dbAcDatabase
fcmbIblVtmName.blnVTypeMastList = True
fcmbIblVtmName.mListSqlExpr = "Select * from VTypMast where VtmSysCode=" & CStr(cHMS_VTYPE_INDOOR_BILL) & " order by VtmName"
fcmbIblVtmName.Init

Set fcmbSrvName = New clsHmsFlexSearch
Set fcmbSrvName.dbHmsDatabase = dbHmsDatabase
fcmbSrvName.blnServMastList = True
fcmbSrvName.Init

Set fcmbSDctName = New clsHmsFlexSearch
Set fcmbSDctName.dbHmsDatabase = dbHmsDatabase
fcmbSDctName.blnDoctMastList = True
fcmbSDctName.Init

Set fcmbDrlName = New clsHmsFlexSearch
Set fcmbDrlName.dbHmsDatabase = dbHmsDatabase
fcmbDrlName.blnDoctRoleMastList = True
fcmbDrlName.Init

Set fcmbIgtVchNo = New clsHmsFlexSearch
Set fcmbIgtVchNo.dbHmsDatabase = dbHmsDatabase
Set fcmbIgtVchNo.dbComDatabase = dbComDatabase
fcmbIgtVchNo.blnOldIgtListByIgtNo = True
fcmbIgtVchNo.Init

Set fcmbIgfVchNo = New clsHmsFlexSearch
Set fcmbIgfVchNo.dbHmsDatabase = dbHmsDatabase
Set fcmbIgfVchNo.dbComDatabase = dbComDatabase
fcmbIgfVchNo.blnOldIgfListByIgfNo = True
fcmbIgfVchNo.Init

Set fcmbPttRegNo = New clsHmsFlexSearch
Set fcmbPttRegNo.dbHmsDatabase = dbHmsDatabase
Set fcmbPttRegNo.dbComDatabase = dbComDatabase
fcmbPttRegNo.blnPatMastListByRegNo = True
fcmbPttRegNo.mFiltCond = "0 = 1"
fcmbPttRegNo.Init

Set fcmbPttName = New clsHmsFlexSearch
Set fcmbPttName.dbHmsDatabase = dbHmsDatabase
Set fcmbPttName.dbComDatabase = dbComDatabase
fcmbPttName.blnPatMastListByName = True
fcmbPttName.mFiltCond = "0 = 1"
fcmbPttName.Init

Set fcmbAdmIpgByIpgNo = New clsHmsFlexSearch
Set fcmbAdmIpgByIpgNo.dbHmsDatabase = dbHmsDatabase
Set fcmbAdmIpgByIpgNo.dbComDatabase = dbComDatabase
fcmbAdmIpgByIpgNo.blnAdmIpgListByIpgNo = True
fcmbAdmIpgByIpgNo.mFiltCond = "0 = 1"
fcmbAdmIpgByIpgNo.Init

Set fcmbAdmIpgByPttRegNo = New clsHmsFlexSearch
Set fcmbAdmIpgByPttRegNo.dbHmsDatabase = dbHmsDatabase
Set fcmbAdmIpgByPttRegNo.dbComDatabase = dbComDatabase
fcmbAdmIpgByPttRegNo.blnAdmIpgListByPttRegNo = True
fcmbAdmIpgByPttRegNo.mFiltCond = "0 = 1"
fcmbAdmIpgByPttRegNo.Init

Set fcmbAdmIpgByPttName = New clsHmsFlexSearch
Set fcmbAdmIpgByPttName.dbHmsDatabase = dbHmsDatabase
Set fcmbAdmIpgByPttName.dbComDatabase = dbComDatabase
fcmbAdmIpgByPttName.blnAdmIpgListByPttName = True
fcmbAdmIpgByPttName.mFiltCond = "0 = 1"
fcmbAdmIpgByPttName.Init

Call RestoreDefaultSmryPara
If mRemoteAccess = True Then
    optDetailed.Value = True
    AddSmryParaLayer mClear:=True
End If

If mRemoteAccess = True Then
    datRecset.open "Select * from IndrBlHdr inner join PatMast on IndrBlHdr.IbhPttCode = PatMast.PttCode where IbhCode = " & CStr(mIblCode) & " order by IbhDate,IbhTime", dbHmsDatabase, adOpenKeyset, adLockOptimistic
    dtpFromDate.Text = Dtoc(datRecset.fields("IbhDate"))
    dtpToDate.Text = Dtoc(datRecset.fields("IbhDate"))
    AddSmryParaLayer mClear:=True

Else
    datRecset.open "Select * from IndrBlHdr inner join PatMast on IndrBlHdr.IbhPttCode=PatMast.PttCode order by IbhDate,IbhTime", dbHmsDatabase, adOpenKeyset, adLockOptimistic
End If
Mfgrd1.FixedCols = 0
Call SmryList

Mfgrd2.FixedRows = 1: Mfgrd2.FixedCols = 0: Mfgrd2.Rows = 2: Mfgrd2.Cols = MFGRD2_COLS: SetGridAutoHeight Mfgrd2

colcnt = X2IBLICODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2IBLICODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2IBLSNO_COL: Mfgrd2.ColWidth(colcnt) = mskIblSno.Width: Mfgrd2.TextMatrix(0, colcnt) = "Sno": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SRVNAME_COL: Mfgrd2.ColWidth(colcnt) = txtSrvName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Service Name": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2SDCFLAG_COL: Mfgrd2.ColWidth(colcnt) = txtSdcFlag.Width: Mfgrd2.TextMatrix(0, colcnt) = "Dtl": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2IBLUNIT_COL: Mfgrd2.ColWidth(colcnt) = mskIblUnit.Width: Mfgrd2.TextMatrix(0, colcnt) = "Unit": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2IBLRATE_COL: Mfgrd2.ColWidth(colcnt) = mskIblRate.Width: Mfgrd2.TextMatrix(0, colcnt) = "Rate": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2IBLAMTBEFDISC_COL: Mfgrd2.ColWidth(colcnt) = mskIblAmtBefDisc.Width: Mfgrd2.TextMatrix(0, colcnt) = "Basic Amt": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2IBLDISCPER_COL: Mfgrd2.ColWidth(colcnt) = mskIblDiscPer.Width: Mfgrd2.TextMatrix(0, colcnt) = "Disc.%": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2IBLDISCAMT_COL: Mfgrd2.ColWidth(colcnt) = mskIblDiscAmt.Width: Mfgrd2.TextMatrix(0, colcnt) = "Disc.Amt": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2IBLAMTAFTDISC_COL: Mfgrd2.ColWidth(colcnt) = mskIblAmtAftDisc.Width: Mfgrd2.TextMatrix(0, colcnt) = "Amount": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2IBLADVAMT_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2IBLADVAMT_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2IBLDPOGAMT_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2IBLDPOGAMT_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2IBLDEPOAMT_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2IBLDEPOAMT_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2IBLRFUGAMT_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2IBLRFUGAMT_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2IBLREFUAMT_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2IBLREFUAMT_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2IBLBALAMT_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2IBLBALAMT_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2IBLREMARK_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2IBLREMARK_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2IBLSRVCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2IBLSRVCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2IBBSICODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2IBBSICODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2IBBSIBSCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2IBBSIBSCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2IBBSFROMDATE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2IBBSFROMDATE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2IBBSFROMTIME_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2IBBSFROMTIME_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2IBBSTODATE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2IBBSTODATE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2IBBSTOTIME_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2IBBSTOTIME_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2IBBSREMARK_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2IBBSREMARK_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2IBLRECSTATE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2IBLRECSTATE_COL": Mfgrd2.ColAlignment(colcnt) = 7

colcnt = X2IBLSNO_COL: mskIblSno.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2SRVNAME_COL: txtSrvName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2SRVNAME_COL: txtIbbsRemark.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2SDCFLAG_COL: txtSdcFlag.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2IBLUNIT_COL: mskIblUnit.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2IBLRATE_COL: mskIblRate.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2IBLAMTBEFDISC_COL: mskIblAmtBefDisc.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2IBLDISCPER_COL: mskIblDiscPer.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2IBLDISCAMT_COL: mskIblDiscAmt.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2IBLAMTAFTDISC_COL: mskIblAmtAftDisc.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
cmdOK.Left = mskIblAmtAftDisc.Left + mskIblAmtAftDisc.Width

lblIblUnitTot.Left = mskIblUnit.Left - frFooter.Left: lblIblUnitTot.Width = mskIblUnit.Width
lblIblAmtBefDiscTot.Left = mskIblAmtBefDisc.Left - frFooter.Left: lblIblAmtBefDiscTot.Width = mskIblAmtBefDisc.Width
lblIblDiscAmtTot.Left = mskIblDiscAmt.Left - frFooter.Left: lblIblDiscAmtTot.Width = mskIblDiscAmt.Width
lblIblAmtAftDiscTot.Left = mskIblAmtAftDisc.Left - frFooter.Left: lblIblAmtAftDiscTot.Width = mskIblAmtAftDisc.Width

Rem service doctor detail flexgrid
Mfgrd3.FixedRows = 1: Mfgrd3.FixedCols = 0: Mfgrd3.Rows = 2: Mfgrd3.Cols = MFGRD3_COLS
colcnt = X3IBDICODE_COL: Mfgrd3.ColWidth(colcnt) = 0: Mfgrd3.TextMatrix(0, colcnt) = "X3IBDICODE_COL": Mfgrd3.ColAlignment(colcnt) = 7
colcnt = X3IBDSNO_COL: Mfgrd3.ColWidth(colcnt) = mskIblSno.Width: Mfgrd3.TextMatrix(0, colcnt) = "Sno": Mfgrd3.ColAlignment(colcnt) = 7
colcnt = X3DCTNAME_COL: Mfgrd3.ColWidth(colcnt) = txtSDctName.Width: Mfgrd3.TextMatrix(0, colcnt) = "Doctor Name": Mfgrd3.ColAlignment(colcnt) = 1
colcnt = X3DRLNAME_COL: Mfgrd3.ColWidth(colcnt) = txtDrlName.Width: Mfgrd3.TextMatrix(0, colcnt) = "Doctor Role": Mfgrd3.ColAlignment(colcnt) = 1
colcnt = X3IBDREMARK_COL: Mfgrd3.ColWidth(colcnt) = txtIbdRemark.Width: Mfgrd3.TextMatrix(0, colcnt) = "Remark": Mfgrd3.ColAlignment(colcnt) = 1
colcnt = X3IBDDCTCODE_COL: Mfgrd3.ColWidth(colcnt) = 0: Mfgrd3.TextMatrix(0, colcnt) = "X3IBDDCTCODE_COL": Mfgrd3.ColAlignment(colcnt) = 7
colcnt = X3IBDDRLCODE_COL: Mfgrd3.ColWidth(colcnt) = 0: Mfgrd3.TextMatrix(0, colcnt) = "X3IBDDRLCODE_COL": Mfgrd3.ColAlignment(colcnt) = 7
colcnt = X3IBDRECSTATE_COL: Mfgrd3.ColWidth(colcnt) = 0: Mfgrd3.TextMatrix(0, colcnt) = "X3IBDRECSTATE_COL": Mfgrd3.ColAlignment(colcnt) = 7

colcnt = X3IBDSNO_COL: mskIblSno.Left = Mfgrd3.Left + Mfgrd3.ColPos(colcnt)
colcnt = X3DCTNAME_COL: txtSDctName.Left = Mfgrd3.Left + Mfgrd3.ColPos(colcnt)
colcnt = X3DRLNAME_COL: txtDrlName.Left = Mfgrd3.Left + Mfgrd3.ColPos(colcnt)
colcnt = X3IBDREMARK_COL: txtIbdRemark.Left = Mfgrd3.Left + Mfgrd3.ColPos(colcnt)
cmdSdcOK.Left = txtIbdRemark.Left + txtIbdRemark.Width

Rem Ipd on a/c payment adjustement column details
Mfgrd4.FixedRows = 1: Mfgrd4.FixedCols = 0: Mfgrd4.Rows = 2: Mfgrd4.Cols = MFGRD4_COLS
colcnt = X4IBGDICODE_COL: Mfgrd4.ColWidth(colcnt) = 0: Mfgrd4.TextMatrix(0, colcnt) = "X4IBGDICODE_COL": Mfgrd4.ColAlignment(colcnt) = 7
colcnt = X4IBGDSNO_COL: Mfgrd4.ColWidth(colcnt) = mskIbgdSno.Width: Mfgrd4.TextMatrix(0, colcnt) = "Sno": Mfgrd4.ColAlignment(colcnt) = 7
colcnt = X4IGTVCHNO_COL: Mfgrd4.ColWidth(colcnt) = mskIgtVchNo.Width: Mfgrd4.TextMatrix(0, colcnt) = "Vch.No": Mfgrd4.ColAlignment(colcnt) = 7
colcnt = X4IGTVTMNAME_COL: Mfgrd4.ColWidth(colcnt) = txtIgtVtmName.Width: Mfgrd4.TextMatrix(0, colcnt) = "Vch.Type": Mfgrd4.ColAlignment(colcnt) = 1
colcnt = X4IGTDATE_COL: Mfgrd4.ColWidth(colcnt) = dtpIgtDate.Width: Mfgrd4.TextMatrix(0, colcnt) = "Vch.Date": Mfgrd4.ColAlignment(colcnt) = 1
colcnt = X4IGTDPOGAMT_COL: Mfgrd4.ColWidth(colcnt) = mskIgtDpogAmt.Width: Mfgrd4.TextMatrix(0, colcnt) = "Depo.Amt": Mfgrd4.ColAlignment(colcnt) = 7
colcnt = X4IGTADJAMTEXCL_COL: Mfgrd4.ColWidth(colcnt) = mskIgtAdjAmtExcl.Width: Mfgrd4.TextMatrix(0, colcnt) = "Pre-Adj.Amt": Mfgrd4.ColAlignment(colcnt) = 7
colcnt = X4IBGDDPOGAMT_COL: Mfgrd4.ColWidth(colcnt) = mskIbgdDpogAmt.Width: Mfgrd4.TextMatrix(0, colcnt) = "Adj.Amt": Mfgrd4.ColAlignment(colcnt) = 7
colcnt = X4IGTBALAMT_COL: Mfgrd4.ColWidth(colcnt) = mskIgtBalAmt.Width: Mfgrd4.TextMatrix(0, colcnt) = "Bal.Amt": Mfgrd4.ColAlignment(colcnt) = 7
colcnt = X4IBGDIGTCODE_COL: Mfgrd4.ColWidth(colcnt) = 0: Mfgrd4.TextMatrix(0, colcnt) = "X4IBGDIGTCODE_COL": Mfgrd4.ColAlignment(colcnt) = 7
colcnt = X4IBGDRECSTATE_COL: Mfgrd4.ColWidth(colcnt) = 0: Mfgrd4.TextMatrix(0, colcnt) = "X4IBGDRECSTATE_COL": Mfgrd4.ColAlignment(colcnt) = 7

colcnt = X4IBGDSNO_COL: mskIbgdSno.Left = Mfgrd4.Left + Mfgrd4.ColPos(colcnt)
colcnt = X4IGTVCHNO_COL: mskIgtVchNo.Left = Mfgrd4.Left + Mfgrd4.ColPos(colcnt)
colcnt = X4IGTVTMNAME_COL: txtIgtVtmName.Left = Mfgrd4.Left + Mfgrd4.ColPos(colcnt)
colcnt = X4IGTDATE_COL: dtpIgtDate.Left = Mfgrd4.Left + Mfgrd4.ColPos(colcnt)
colcnt = X4IGTDPOGAMT_COL: mskIgtDpogAmt.Left = Mfgrd4.Left + Mfgrd4.ColPos(colcnt)
colcnt = X4IGTADJAMTEXCL_COL: mskIgtAdjAmtExcl.Left = Mfgrd4.Left + Mfgrd4.ColPos(colcnt)
colcnt = X4IBGDDPOGAMT_COL: mskIbgdDpogAmt.Left = Mfgrd4.Left + Mfgrd4.ColPos(colcnt)
colcnt = X4IGTBALAMT_COL: mskIgtBalAmt.Left = Mfgrd4.Left + Mfgrd4.ColPos(colcnt)
cmdDpogOK.Left = mskIgtBalAmt.Left

Rem Ipd on a/c payment adjustement column details
Mfgrd5.FixedRows = 1: Mfgrd5.FixedCols = 0: Mfgrd5.Rows = 2: Mfgrd5.Cols = MFGRD5_COLS
colcnt = X5IBGFICODE_COL: Mfgrd5.ColWidth(colcnt) = 0: Mfgrd5.TextMatrix(0, colcnt) = "X5IBGFICODE_COL": Mfgrd5.ColAlignment(colcnt) = 7
colcnt = X5IBGFSNO_COL: Mfgrd5.ColWidth(colcnt) = mskIbgfSno.Width: Mfgrd5.TextMatrix(0, colcnt) = "Sno": Mfgrd5.ColAlignment(colcnt) = 7
colcnt = X5IGFVCHNO_COL: Mfgrd5.ColWidth(colcnt) = mskIgfVchNo.Width: Mfgrd5.TextMatrix(0, colcnt) = "Vch.No": Mfgrd5.ColAlignment(colcnt) = 7
colcnt = X5IGFVTMNAME_COL: Mfgrd5.ColWidth(colcnt) = txtIgfVtmName.Width: Mfgrd5.TextMatrix(0, colcnt) = "Vch.Type": Mfgrd5.ColAlignment(colcnt) = 1
colcnt = X5IGFDATE_COL: Mfgrd5.ColWidth(colcnt) = dtpIgfDate.Width: Mfgrd5.TextMatrix(0, colcnt) = "Vch.Date": Mfgrd5.ColAlignment(colcnt) = 1
colcnt = X5IGFRFUGAMT_COL: Mfgrd5.ColWidth(colcnt) = mskIgfRfugAmt.Width: Mfgrd5.TextMatrix(0, colcnt) = "Depo.Amt": Mfgrd5.ColAlignment(colcnt) = 7
colcnt = X5IGFADJAMTEXCL_COL: Mfgrd5.ColWidth(colcnt) = mskIgfAdjAmtExcl.Width: Mfgrd5.TextMatrix(0, colcnt) = "Pre-Adj.Amt": Mfgrd5.ColAlignment(colcnt) = 7
colcnt = X5IBGFRFUGAMT_COL: Mfgrd5.ColWidth(colcnt) = mskIbgfRfugAmt.Width: Mfgrd5.TextMatrix(0, colcnt) = "Adj.Amt": Mfgrd5.ColAlignment(colcnt) = 7
colcnt = X5IGFBALAMT_COL: Mfgrd5.ColWidth(colcnt) = mskIgfBalAmt.Width: Mfgrd5.TextMatrix(0, colcnt) = "Bal.Amt": Mfgrd5.ColAlignment(colcnt) = 7
colcnt = X5IBGFIGFCODE_COL: Mfgrd5.ColWidth(colcnt) = 0: Mfgrd5.TextMatrix(0, colcnt) = "X5IBGFIGFCODE_COL": Mfgrd5.ColAlignment(colcnt) = 7
colcnt = X5IBGFRECSTATE_COL: Mfgrd5.ColWidth(colcnt) = 0: Mfgrd5.TextMatrix(0, colcnt) = "X5IBGFRECSTATE_COL": Mfgrd5.ColAlignment(colcnt) = 7

colcnt = X5IBGFSNO_COL: mskIbgfSno.Left = Mfgrd5.Left + Mfgrd5.ColPos(colcnt)
colcnt = X5IGFVCHNO_COL: mskIgfVchNo.Left = Mfgrd5.Left + Mfgrd5.ColPos(colcnt)
colcnt = X5IGFVTMNAME_COL: txtIgfVtmName.Left = Mfgrd5.Left + Mfgrd5.ColPos(colcnt)
colcnt = X5IGFDATE_COL: dtpIgfDate.Left = Mfgrd5.Left + Mfgrd5.ColPos(colcnt)
colcnt = X5IGFRFUGAMT_COL: mskIgfRfugAmt.Left = Mfgrd5.Left + Mfgrd5.ColPos(colcnt)
colcnt = X5IGFADJAMTEXCL_COL: mskIgfAdjAmtExcl.Left = Mfgrd5.Left + Mfgrd5.ColPos(colcnt)
colcnt = X5IBGFRFUGAMT_COL: mskIbgfRfugAmt.Left = Mfgrd5.Left + Mfgrd5.ColPos(colcnt)
colcnt = X5IGFBALAMT_COL: mskIgfBalAmt.Left = Mfgrd5.Left + Mfgrd5.ColPos(colcnt)
cmdRfugOk.Left = mskIgfBalAmt.Left

ShowEntryMode False
VisibleControls False
ShowSdcEntryMode False
ShowDpogEntryMode False
ShowRfugEntryMode False
ShowStatusBarText StatusBar1

End Sub

Private Sub mskIblDiscAmt_Change()
If InterActiveChange(mskIblDiscAmt) = True Then
    mskIblDiscAmt.Tag = True
    mskIblDiscPer.Tag = False
End If

End Sub

Private Sub mskIblDiscPer_Change()
If InterActiveChange(mskIblDiscPer) = True Then
    mskIblDiscPer.Tag = True
    mskIblDiscAmt.Tag = False
End If

End Sub

Private Sub StatusBar1_PanelClick(ByVal Panel As MSComctlLib.Panel)
ShowStatusBarText StatusBar1
End Sub

Private Sub Form_Resize()
lblFormHeading.Width = Me.Width
cmdFormEscape.Left = Me.Width - (cmdFormEscape.Width * 2)
cmdFormEnter.Left = Me.Width + cmdFormEscape.Width
frFormSmry.Left = (Me.Width - frFormSmry.Width) / 2: frFormSmry.Top = cmbFormEntryMode.Top + (cmbFormEntryMode.Height * 1.25)
frFormDtl.Left = (Me.Width - frFormDtl.Width) / 2: frFormDtl.Top = frFormSmry.Top

End Sub

Private Sub Form_Unload(Cancel As Integer)
Set clsHOPT = Nothing
Set clsJRN = Nothing
Set clsAH = Nothing
Set clsIPG = Nothing
Set clsIBS = Nothing
Set clsIGT = Nothing
Set clsIGF = Nothing
Set clsIBL = Nothing
Set clsPAT = Nothing
Set clsPCG = Nothing
Set clsDCT = Nothing
Set clsDIG = Nothing
Set clsSRV = Nothing
Set clsDRL = Nothing
Set clsARA = Nothing
Set clsSTN = Nothing
Set clsVTM = Nothing
Set fcmbAdmIpgByIpgNo = Nothing
Set fcmbAdmIpgByPttRegNo = Nothing
Set fcmbAdmIpgByPttName = Nothing
Set fcmbIgtVchNo = Nothing
Set fcmbIgfVchNo = Nothing
Set fcmbPttRegNo = Nothing
Set fcmbPttName = Nothing
Set fcmbIblVtmName = Nothing
Set fcmbSrvName = Nothing
Set fcmbSDctName = Nothing
Set fcmbDrlName = Nothing
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
frFormDtl.Visible = EntryMode: frFormDtl.Enabled = EntryMode
frHeader.Visible = EntryMode: frHeader.Enabled = EntryMode
frFooter.Visible = EntryMode: frFooter.Enabled = EntryMode
cmdSaveForm.Enabled = EntryMode
If EntryMode = False Then
    FormAddEditMode = cFORM_SMRYMODE
End If

End Sub

Private Function Data_Verify() As Boolean
Dim mPttRegNo As Long, mIpgPttCode As Long, mIpgVchNo As Long, mIblVchNo As Long
Dim mIblAmtAftDiscTot As Double, mIblAdvAmt As Double, mIblDpogAmtTot As Double, mIblDepoAmtTot As Double, mIblRfugAmtTot As Double, mIblRefuAmtTot As Double, mIblBalAmtTot As Double
Dim mIbsDischDate As Date, mIbsDischTime As Long, mIbsDischState As Integer
Dim tRecset As New ADODB.Recordset

Data_Verify = False

If frDpogAdjDtl.Visible = True Then
    Call cmdFormEscape_Click
    GoTo EndSub
End If
If frRfugAdjDtl.Visible = True Then
    Call cmdFormEscape_Click
    GoTo EndSub
End If
If FormAddEditMode = cFORM_EDITMODE And Val(mskFormBoundField.Text) < 1 Then
    ErrorBox "Invalid Key Value !!!"
    txtPttName.SetFocus
    GoTo EndSub
End If
Rem patient validation
mIpgPttCode = Val(mskIblPttCode.Text)
If mIpgPttCode < 1 Then
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
    If mPttRegNo = 0 And clsHOPT.mIblPttRegNoNotZero_bln = True Then
        AlertBox "Prohibited Zero Patient Reg.No. !!!"
        mskPttRegNo.SetFocus
        GoTo EndSub
    End If
End If
If Val(UnMyPerFmt(mskIblPttDiscPer.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskIblPttDiscPer.SetFocus
    GoTo EndSub
End If
Rem indoor registration validation
If Val(mskIblIpgCode.Text) < 1 Then
    ErrorBox "Invalid Key Value !!!"
    txtPttName.SetFocus
    GoTo EndSub
End If
If mIpdDischState <> cIBS_STATE_OCCUPIED Then
    AlertBox "Patient Discharged / Any Discharge State !!!"
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
Rem indoor receipt validations
mIblVchNo = Val(UnMyNumFmt(mskIblVchNo(0).Text))
If mIblVchNo > 0 Then
    If mIblVchNo <> mIblVchNo_old Or Val(fcmbIblVtmName.BoundText) <> mIblVtmCode_old Or Ctod(dtpIblDate.Text) <> mIblDate_old Or FormAddEditMode = cFORM_ADDMODE Then
        If ChkIsDuplVTypeNo(dbHmsDatabase, dbAcDatabase, mTableName:="IndrBlHdr", mChkFieldName:="IbhVchNo", mChkFieldValue:=mIblVchNo, mKeyFieldName:="IbhCode", mKeyFieldValue:=mIblCode, mVtmFieldName:="IbhVtmCode", mVtmFieldValue:=Val(fcmbIblVtmName.BoundText), mFinYrFieldName:="IbhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="IbhDate", mDateFieldValue:=Ctod(dtpIblDate.Text)) = True Then
            ErrorBox "Duplicate Voucher No. !!!"
            mskIblVchNo(0).SetFocus
            ' ---------------
            If FormAddEditMode = cFORM_ADDMODE Then
                mIblVchNo = GetNextVTypeNo(dbHmsDatabase, dbAcDatabase, dbComDatabase, mTableName:="IndrBlHdr", mFieldName:="IbhVchNo", mVtmFieldName:="IbhVtmCode", mVtmFieldValue:=Val(fcmbIblVtmName.BoundText), mFinYrFieldName:="IbhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="IbhDate", mDateFieldValue:=Ctod(dtpIblDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormIblAcsPermFileName)
            Else
                mIblVchNo = mIblVchNo_old
            End If
            mskIblVchNo(0).Text = ToMyNumFmt(mIblVchNo, mDecimals:=0)
            GoTo EndSub
        End If
    End If
Else
    ErrorBox "Invalid Input !!!"
    mskIblVchNo(0).SetFocus
    GoTo EndSub
End If
If IsDate(dtpIblDate.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpIblDate.SetFocus
    GoTo EndSub
ElseIf IsFinYrDate(Ctod(dtpIblDate.Text)) = False Then
    ErrorBox "Invalid Input !!!"
    dtpIblDate.SetFocus
    GoTo EndSub
ElseIf ChkBillDate() = False Then
    Rem ErrorBox "Invalid Bill Date !!!"
    dtpIblDate.SetFocus
    GoTo EndSub
End If
If TimeToMin(txtIblTime_str.Text) > cDAYMINUTES Then
    ErrorBox "Invalid Input !!!"
    txtIblTime_str.SetFocus
    GoTo EndSub
ElseIf ChkBillTime() = False Then
    Rem ErrorBox "Invalid Bill Time !!!"
    txtIblTime_str.SetFocus
    GoTo EndSub
End If
If mIpdDischState = cIBS_STATE_OCCUPIED Then
    mIbsDischState = cmbIbsDischState.ItemData(cmbIbsDischState.ListIndex)
    If mIbsDischState = cIBS_STATE_UNKNOWN Then
        ErrorBox "Invalid Discharge Status !!!"
        cmbIbsDischState.SetFocus
        GoTo EndSub
    ElseIf mIbsDischState = cIBS_STATE_OCCUPIED Then
        dtpIbsDischDate.Text = ""
        txtIbsDischTime.Text = ""
    ElseIf mIbsDischState = cIBS_STATE_SHIFTED Then
        ErrorBox "Invalid Discharge Status !!!"
        cmbIbsDischState.SetFocus
        GoTo EndSub
    Else
        If dtpIbsDischDate.Text = "" Then
            ErrorBox "Invalid Discharge Date !!!"
            dtpIbsDischDate.SetFocus
            GoTo EndSub
        Else
            dtpIbsDischDate.Text = ToMyDate(dtpIbsDischDate.Text)
            If Ctod(dtpIbsDischDate.Text) < Ctod(dtpIblDate.Text) Then
                ErrorBox "Invalid Discharge Date !!!"
                dtpIbsDischDate.SetFocus
                GoTo EndSub
            Else
                mIbsDischDate = Ctod(dtpIbsDischDate.Text)
                Set tRecset = dbHmsDatabase.Execute("Select * from ((IndrBlIbsDtl" _
                    & " inner join IBedState on IndrBlIbsDtl.IbbsIbsCode = IBedState.IbsCode)" _
                    & " inner join IndrBill on IndrBlIbsDtl.IbbsCode = IndrBill.IblCode and IndrBlIbsDtl.IbbsIblICode = IndrBill.IblICode)" _
                    & " left join IndrBlHdr on IndrBill.IblCode = IndrBlHdr.IbhCode" _
                    & " where IbbsIpgCode = " & CStr(mIblIpgCode) & " and IbbsCode <> " & CStr(mIblCode) & " and IbbsToDate >= #" & CStr(ToSysDate(mIbsDischDate)) & "#" _
                    & " order by IbbsToDate Desc,IbbsToTime desc,IbbsICode desc" & "")
                With tRecset
                If .EOF = False Then
                    If .fields("IbbsToDate") > mIbsDischDate Then
                        If IsNull(.fields("IbhCode")) = False Then
                            ErrorBox "Bed Charges Already Charged in Indoor Bill No." & CStr(.fields("IbhVchNo")) & " Dated " & Dtoc(.fields("IbhDate")) & " " & MinToTime(.fields("IbhTime")) & " !!!"
                        Else
                            ErrorBox "Bed Charges Already Charged in Indoor Bill Dated " & Dtoc(.fields("IblDate")) & " Under Process !!!"
                        End If
                        dtpIbsDischDate.Text = ""
                        dtpIbsDischDate.SetFocus
                        GoTo EndSub
                    End If
                End If
                End With
                CloseTable tRecset
            End If
        End If
        If txtIbsDischTime.Text = "" Then
            ErrorBox "Invalid Discharge Time !!!"
            txtIbsDischTime.SetFocus
            GoTo EndSub
        Else
            txtIbsDischTime.Text = MinToTime(TimeToMin(txtIbsDischTime.Text))
            If Between(TimeToMin(txtIbsDischTime.Text), 0, cDAYMINUTES) = False Then
                ErrorBox "Invalid Discharge Time !!!"
                txtIbsDischTime.SetFocus
                GoTo EndSub
            ElseIf Ctod(dtpIbsDischDate.Text) = Ctod(dtpIblDate.Text) And TimeToMin(txtIbsDischTime.Text) < TimeToMin(txtIblTime_str.Text) Then
                ErrorBox "Invalid Discharge/Shift Time !!!"
                txtIbsDischTime.SetFocus
                GoTo EndSub
            Else
                mIbsDischDate = Ctod(dtpIbsDischDate.Text)
                mIbsDischTime = TimeToMin(txtIbsDischTime.Text)
                Set tRecset = dbHmsDatabase.Execute("Select * from ((IndrBlIbsDtl" _
                    & " inner join IBedState on IndrBlIbsDtl.IbbsIbsCode = IBedState.IbsCode)" _
                    & " inner join IndrBill on IndrBlIbsDtl.IbbsCode = IndrBill.IblCode and IndrBlIbsDtl.IbbsIblICode = IndrBill.IblICode)" _
                    & " left join IndrBlHdr on IndrBill.IblCode = IndrBlHdr.IbhCode" _
                    & " where IbbsIpgCode = " & CStr(mIblIpgCode) & " and IbbsCode <> " & CStr(mIblCode) & " and IbbsToDate >= #" & CStr(ToSysDate(mIbsDischDate)) & "#" _
                    & " order by IbbsToDate Desc,IbbsToTime desc,IbbsICode desc" & "")
                With tRecset
                If .EOF = False Then
                    If .fields("IbbsToDate") = mIbsDischDate And .fields("IbbsToTime") > mIbsDischTime Then
                        If IsNull(.fields("IbhCode")) = False Then
                            ErrorBox "Bed Charges Already Charged in Indoor Bill No." & CStr(.fields("IbhVchNo")) & " Dated " & Dtoc(.fields("IbhDate")) & " " & MinToTime(.fields("IbhTime")) & " !!!"
                        Else
                            ErrorBox "Bed Charges Already Charged in Indoor Bill Dated " & Dtoc(.fields("IblDate")) & " Under Process !!!"
                        End If
                        txtIbsDischTime.Text = ""
                        txtIbsDischTime.SetFocus
                        GoTo EndSub
                    End If
                End If
                End With
                CloseTable tRecset
            End If
        End If
        
        mIbsDischDate = Ctod(dtpIbsDischDate.Text)
        mIbsDischTime = TimeToMin(txtIbsDischTime.Text)
        If Not (mIbsDischDate > Ctod(dtpIblDate.Text) Or (mIbsDischDate = Ctod(dtpIblDate.Text) And mIbsDischTime >= TimeToMin(txtIblTime_str.Text))) Then
            ErrorBox "Invalid Discharge/Shift Date/Time !!!"
            dtpIbsDischDate.SetFocus
            GoTo EndSub
        End If
    End If
End If

mIblAmtAftDiscTot = Val(UnMyNumFmt(lblIblAmtAftDiscTot.Caption))
If mIblAmtAftDiscTot < 0 Then
    ErrorBox "Invalid Total After Discount !!!"
    Mfgrd2.SetFocus
    GoTo EndSub
End If
mIblAdvAmt = Val(UnMyNumFmt(mskIblAdvAmt.Text))
If mIblAdvAmt < 0 Then
    ErrorBox "Invalid Input !!!"
    mskIblAdvAmt.SetFocus
    GoTo EndSub
End If
mIblDpogAmtTot = Val(UnMyNumFmt(mskIblDpogAmtTot.Text))
If mIblDpogAmtTot < 0 Then
    ErrorBox "Invalid Input !!!"
    mskIblDpogAmtTot.SetFocus
    GoTo EndSub
End If
mIblDepoAmtTot = Val(UnMyNumFmt(mskIblDepoAmtTot.Text))
If mIblDepoAmtTot < 0 Then
    ErrorBox "Invalid Input !!!"
    mskIblDepoAmtTot.SetFocus
    GoTo EndSub
End If
mIblRfugAmtTot = Val(UnMyNumFmt(mskIblRfugAmtTot.Text))
If mIblRfugAmtTot < 0 Then
    ErrorBox "Invalid Input !!!"
    mskIblRfugAmtTot.SetFocus
    GoTo EndSub
End If
mIblRefuAmtTot = Val(UnMyNumFmt(mskIblRefuAmtTot.Text))
If mIblRefuAmtTot < 0 Then
    ErrorBox "Invalid Input !!!"
    mskIblRefuAmtTot.SetFocus
    GoTo EndSub
End If
mIblBalAmtTot = Val(UnMyNumFmt(mskIblBalAmtTot.Text))
'If mIblBalAmtTot < 0 Then
'    ErrorBox "Invalid Input !!!"
'    mskIblBalAmtTot.SetFocus
'    GoTo EndSub
'End If
If mIblAmtAftDiscTot < (mIblAdvAmt + mIblDpogAmtTot + mIblDepoAmtTot - mIblRfugAmtTot - mIblRefuAmtTot) Then
    ErrorBox "Excess Amount Deposited !!!"
    Mfgrd2.SetFocus
    Rem GoTo EndSub
ElseIf (mIblRfugAmtTot + mIblRefuAmtTot) > (mIblAdvAmt + mIblDpogAmtTot + mIblDepoAmtTot) Then
    ErrorBox "Excess Amount Refunded !!!"
    mskIblDepoAmtTot.SetFocus
    Rem GoTo EndSub
End If

Data_Verify = True

EndSub:
Exit Function

End Function

Private Function Data_NetwAuth() As Boolean
Dim mIblVchNo As Long
Data_NetwAuth = False

mIblVchNo = Val(UnMyNumFmt(mskIblVchNo(0).Text))
If mIblVchNo <> mIblVchNo_old Or Val(fcmbIblVtmName.BoundText) <> mIblVtmCode_old Or Ctod(dtpIblDate.Text) <> mIblDate_old Or FormAddEditMode = cFORM_ADDMODE Then
    If ChkIsDuplVTypeNo(dbHmsDatabase, dbAcDatabase, mTableName:="IndrBlHdr", mChkFieldName:="IbhVchNo", mChkFieldValue:=mIblVchNo, mKeyFieldName:="IbhCode", mKeyFieldValue:=mIblCode, mVtmFieldName:="IbhVtmCode", mVtmFieldValue:=Val(fcmbIblVtmName.BoundText), mFinYrFieldName:="IbhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="IbhDate", mDateFieldValue:=Ctod(dtpIblDate.Text)) = True Then
        ErrorBox "Duplicate Voucher No. !!!"
        mskIblVchNo(0).SetFocus
        ' ---------------
        If FormAddEditMode = True Then
            mIblVchNo = GetNextVTypeNo(dbHmsDatabase, dbAcDatabase, dbComDatabase, mTableName:="IndrBlHdr", mFieldName:="IbhVchNo", mVtmFieldName:="IbhVtmCode", mVtmFieldValue:=Val(fcmbIblVtmName.BoundText), mFinYrFieldName:="IbhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="IbhDate", mDateFieldValue:=Ctod(dtpIblDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormIblAcsPermFileName)
        Else
            mIblVchNo = mIblVchNo_old
        End If
        mskIblVchNo(0).Text = ToMyNumFmt(mIblVchNo, mDecimals:=0)
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
Dim srow As Integer, mIblICode As Long, mDeleteit As Boolean

srow = Mfgrd2.Row
mIblICode = Val(Mfgrd2.TextMatrix(srow, X2IBLICODE_COL))

If MyDeleteKey(Shift, KeyCode, mCheckCtrlMask:=False) = True And mIblICode > 0 And mIpdDischState = cIBS_STATE_OCCUPIED Then
    mDeleteit = True
    If mDeleteit = True Then
        mDeleteit = CanDelete()
    End If
    If mDeleteit = True Then
        clsIBL.ClearDtl
        clsIBL.mIbbsICode_lng = Val(Mfgrd2.TextMatrix(srow, X2IBBSICODE_COL))
        ' ---------------------
        clsIBL.DeleteDtl mIblCode, mIblICode
        
        ShowDtlData mIblCode
        Mfgrd2.Row = srow
        Mfgrd2.SetFocus
        Call Mfgrd2_RowColChange
    End If
End If

End Sub

Private Sub Mfgrd2_KeyPress(KeyAscii As Integer)
Dim srow As Integer

If KeyAscii = vbKeyReturn And mIpdDischState = cIBS_STATE_OCCUPIED Then
    srow = Mfgrd2.Row
    
    dtlAddEditMode = True
    dtlAddMode = IsFlexNewRow(Mfgrd2, srow)
    If mAutoInsServInProcess = False Then
        VisibleControls True, Mfgrd2.Top + Mfgrd2.RowPos(Mfgrd2.Row)
    End If
    If dtlAddMode = True Then
        mskIblSno.Text = ToMyNumFmt(FlexNextSeqno(Mfgrd2, X2IBLSNO_COL), mDecimals:=0)
        txtSrvName.Text = "": fcmbSrvName.BoundText = ""
        mskIblUnit.Text = ToMyNumFmt(1, mDecimals:=0)
        mskIblDiscPer.Text = mskIblPttDiscPer.Text
    Else
        mskIblICode.Text = Val(Mfgrd2.TextMatrix(srow, X2IBLICODE_COL))
        mskIblSno.Text = Mfgrd2.TextMatrix(srow, X2IBLSNO_COL)
        fcmbSrvName.BoundText = Mfgrd2.TextMatrix(srow, X2IBLSRVCODE_COL): txtSrvName.Text = fcmbSrvName.Text
        txtIbbsRemark.Text = Mfgrd2.TextMatrix(srow, X2IBBSREMARK_COL)
        If Val(Mfgrd2.TextMatrix(srow, X2IBBSIBSCODE_COL)) > 0 Then
            txtIbbsRemark.Visible = True
        End If
        mskIbbsIbsCode.Text = Mfgrd2.TextMatrix(srow, X2IBBSIBSCODE_COL)
        dtpIbbsFromDate.Text = Mfgrd2.TextMatrix(srow, X2IBBSFROMDATE_COL)
        mskIbbsFromTime.Text = Mfgrd2.TextMatrix(srow, X2IBBSFROMTIME_COL)
        dtpIbbsToDate.Text = Mfgrd2.TextMatrix(srow, X2IBBSTODATE_COL)
        mskIbbsToTime.Text = Mfgrd2.TextMatrix(srow, X2IBBSTOTIME_COL)
        txtSdcFlag.Text = Mfgrd2.TextMatrix(srow, X2SDCFLAG_COL)
        mskIblUnit.Text = Mfgrd2.TextMatrix(srow, X2IBLUNIT_COL)
        mskIblRate.Text = Mfgrd2.TextMatrix(srow, X2IBLRATE_COL)
        mskIblAmtBefDisc.Text = Mfgrd2.TextMatrix(srow, X2IBLAMTBEFDISC_COL)
        mskIblDiscPer.Text = Mfgrd2.TextMatrix(srow, X2IBLDISCPER_COL)
        mskIblDiscAmt.Text = Mfgrd2.TextMatrix(srow, X2IBLDISCAMT_COL)
        mskIblAmtAftDisc.Text = Mfgrd2.TextMatrix(srow, X2IBLAMTAFTDISC_COL)
        
    End If
    If mAutoInsServInProcess = False Then
        txtSrvName.SetFocus
    End If
    Call ValidDtl
    
    mIblSrvCode_old = Val(fcmbSrvName.BoundText)
End If

End Sub

Private Sub Mfgrd2_RowColChange()
ShowActiveFlexRow Mfgrd2

End Sub

Private Sub mskIbgdDpogAmt_GotFocus()
FlashActiveControl mskIbgdDpogAmt, True
End Sub

Private Sub mskIbgdDpogAmt_LostFocus()
FlashActiveControl mskIbgdDpogAmt, False
End Sub

Private Sub mskIbgdDpogAmt_Validate(Cancel As Boolean)
If chkIgtDpogAmt() = False Then
    mskIbgdDpogAmt.SetFocus
    Cancel = True
End If
Call ValidDpogDtl

End Sub

Private Function chkIgtDpogAmt() As Boolean
Dim mRtnval As Boolean
Dim mIgtDpogAmt As Double, mIgtAdjAmtExcl As Double, mIbgdDpogAmt As Double

mRtnval = True
mIgtDpogAmt = Val(UnMyNumFmt(mskIgtDpogAmt.Text))
mIgtAdjAmtExcl = Val(UnMyNumFmt(mskIgtAdjAmtExcl.Text))
mIbgdDpogAmt = Val(UnMyNumFmt(mskIbgdDpogAmt.Text))

mskIbgdDpogAmt.Text = ToMyNumFmt(mIbgdDpogAmt)
If mIbgdDpogAmt < 1 Then
    If InterActiveChange(mskIbgdDpogAmt) = True Then
        ErrorBox "Invalid Input !!!"
    End If
    mRtnval = False
Else
    If (mIgtAdjAmtExcl + mIbgdDpogAmt) > mIgtDpogAmt Then
        If InterActiveChange(mskIbgdDpogAmt) = True Then
            ErrorBox "Excess Amount Adjusted !!!"
            mIbgdDpogAmt = mIgtDpogAmt - mIgtAdjAmtExcl
            mskIbgdDpogAmt.Text = ToMyNumFmt(mIbgdDpogAmt)
        End If
        mRtnval = False
    End If
End If
mskIgtBalAmt.Text = ToMyNumFmt(mIgtDpogAmt - (mIgtAdjAmtExcl + mIbgdDpogAmt))

chkIgtDpogAmt = mRtnval

End Function

Private Sub mskIbgdSno_GotFocus()
FlashActiveControl mskIbgdSno, True
End Sub

Private Sub mskIbgdSno_LostFocus()
FlashActiveControl mskIbgdSno, False
End Sub

Private Sub mskIbgfRfugAmt_GotFocus()
FlashActiveControl mskIbgfRfugAmt, True
End Sub

Private Sub mskIbgfRfugAmt_LostFocus()
FlashActiveControl mskIbgfRfugAmt, False
End Sub

Private Sub mskIbgfRfugAmt_Validate(Cancel As Boolean)
If chkIgfRfugAmt() = False Then
    mskIbgfRfugAmt.SetFocus
    Cancel = True
End If
Call ValidRfugDtl

End Sub

Private Function chkIgfRfugAmt() As Boolean
Dim mRtnval As Boolean
Dim mIgfRfugAmt As Double, mIgfAdjAmtExcl As Double, mIbgfRfugAmt As Double

mRtnval = True
mIgfRfugAmt = Val(UnMyNumFmt(mskIgfRfugAmt.Text))
mIgfAdjAmtExcl = Val(UnMyNumFmt(mskIgfAdjAmtExcl.Text))
mIbgfRfugAmt = Val(UnMyNumFmt(mskIbgfRfugAmt.Text))

mskIbgfRfugAmt.Text = ToMyNumFmt(mIbgfRfugAmt)
If mIbgfRfugAmt < 1 Then
    If InterActiveChange(mskIbgfRfugAmt) = True Then
        ErrorBox "Invalid Input !!!"
    End If
    mRtnval = False
Else
    If (mIgfAdjAmtExcl + mIbgfRfugAmt) > mIgfRfugAmt Then
        If InterActiveChange(mskIbgfRfugAmt) = True Then
            ErrorBox "Excess Amount Adjusted !!!"
            mIbgfRfugAmt = mIgfRfugAmt - mIgfAdjAmtExcl
            mskIbgfRfugAmt.Text = ToMyNumFmt(mIbgfRfugAmt)
        End If
        mRtnval = False
    End If
End If
mskIgfBalAmt.Text = ToMyNumFmt(mIgfRfugAmt - (mIgfAdjAmtExcl + mIbgfRfugAmt))

chkIgfRfugAmt = mRtnval

End Function

Private Sub mskIbgfSno_GotFocus()
FlashActiveControl mskIbgfSno, True
End Sub

Private Sub mskIbgfSno_LostFocus()
FlashActiveControl mskIbgfSno, False
End Sub

Private Sub mskIblAdvAmt_GotFocus()
FlashActiveControl mskIblAdvAmt, True
End Sub

Private Sub mskIblAdvAmt_LostFocus()
FlashActiveControl mskIblAdvAmt, False
End Sub

Private Sub mskIblAmtAftDisc_GotFocus()
FlashActiveControl mskIblAmtAftDisc, True
End Sub

Private Sub mskIblAmtAftDisc_LostFocus()
FlashActiveControl mskIblAmtAftDisc, False
End Sub

Private Sub mskIblAmtAftDisc_Validate(Cancel As Boolean)
mskIblAmtAftDisc.Text = ToMyNumFmt(mskIblAmtAftDisc.Text)
If Val(UnMyNumFmt(mskIblAmtAftDisc.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskIblAmtAftDisc.SetFocus
    Cancel = True
Else
    Call CalcIblChg
    Call ValidDtl
End If

End Sub

Rem discart this validation, instead use validation at receipt hdr level
Private Function chkIblAmtAftDisc() As Boolean
Dim mRtnval As Boolean, srow As Integer, mIblAmtAftDisc As Double, mIblAdvAmt As Double, mIblDpogAmt As Double, mIblDepoAmt As Double, mIblRfugAmt As Double, mIblRefuAmt As Double

mRtnval = True
srow = Mfgrd2.Row
mIblAmtAftDisc = Val(UnMyNumFmt(mskIblAmtAftDisc.Text))
mIblAdvAmt = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2IBLADVAMT_COL)))
mIblDpogAmt = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2IBLDPOGAMT_COL)))
mIblDepoAmt = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2IBLDEPOAMT_COL)))
mIblRfugAmt = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2IBLRFUGAMT_COL)))
mIblRefuAmt = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2IBLREFUAMT_COL)))

chkIblAmtAftDisc = mRtnval

End Function

Private Sub mskIblAmtBefDisc_GotFocus()
FlashActiveControl mskIblAmtBefDisc, True
End Sub

Private Sub mskIblAmtBefDisc_LostFocus()
FlashActiveControl mskIblAmtBefDisc, False
End Sub

Private Sub mskIblAmtBefDisc_Validate(Cancel As Boolean)
mskIblAmtBefDisc.Text = ToMyNumFmt(mskIblAmtBefDisc.Text)
If Val(UnMyNumFmt(mskIblAmtBefDisc.Text)) <= 0 Then
    ErrorBox "Invalid Input !!!"
    mskIblAmtBefDisc.SetFocus
    Cancel = True
Else
    Call CalcIblChg
    Call ValidDtl
End If

End Sub

Private Sub mskIblBalAmtTot_GotFocus()
FlashActiveControl mskIblBalAmtTot, True
End Sub

Private Sub mskIblBalAmtTot_LostFocus()
FlashActiveControl mskIblBalAmtTot, False
End Sub

Private Sub mskIblBalAmtTot_Validate(Cancel As Boolean)
'If Val(UnMyNumFmt(mskIblBalAmtTot.Text)) < 0 Then
'    ErrorBox "Invalid Input !!!"
'    mskIblBalAmtTot.SetFocus
'    Rem Cancel = True
'End If

End Sub

Private Sub mskIblDepoAmtTot_GotFocus()
FlashActiveControl mskIblDepoAmtTot, True
End Sub

Private Sub mskIblDepoAmtTot_LostFocus()
FlashActiveControl mskIblDepoAmtTot, False
End Sub

Private Sub mskIblDepoAmtTot_Validate(Cancel As Boolean)
If Val(UnMyNumFmt(mskIblDepoAmtTot.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskIblDepoAmtTot.SetFocus
    Rem Cancel = True
End If

End Sub

Private Sub mskIblDiscAmt_GotFocus()
FlashActiveControl mskIblDiscAmt, True
End Sub

Private Sub mskIblDiscAmt_LostFocus()
FlashActiveControl mskIblDiscAmt, False
End Sub

Private Sub mskIblDiscAmt_Validate(Cancel As Boolean)
mskIblDiscAmt.Text = ToMyNumFmt(mskIblDiscAmt.Text, mUseAbs:=True)
If Val(UnMyNumFmt(mskIblDiscAmt.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskIblDiscAmt.SetFocus
    Cancel = True
Else
    Call CalcIblChg
End If
Call ValidDtl

End Sub

Private Sub mskIblDiscPer_GotFocus()
FlashActiveControl mskIblDiscPer, True
End Sub

Private Sub mskIblDiscPer_LostFocus()
FlashActiveControl mskIblDiscPer, False
End Sub

Private Sub mskIblDiscPer_Validate(Cancel As Boolean)
mskIblDiscPer.Text = ToMyPerFmt(mskIblDiscPer.Text, mUseAbs:=True)
If Val(UnMyPerFmt(mskIblDiscPer.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskIblDiscPer.SetFocus
    Cancel = True
Else
    Call CalcIblChg
End If
Call ValidDtl

End Sub

Private Sub mskIblDpogAmtTot_GotFocus()
FlashActiveControl mskIblDpogAmtTot, True
End Sub

Private Sub mskIblDpogAmtTot_KeyPress(KeyAscii As Integer)
If KeyAscii = vbKeyReturn And mIblPttCode > 0 And mIblIpgCode > 0 Then
    ShowDpogDtlData mIblCode
    ShowDpogEntryMode True
    Mfgrd4.SetFocus
End If

End Sub

Private Sub mskIblDpogAmtTot_LostFocus()
FlashActiveControl mskIblDpogAmtTot, False
End Sub

Private Sub mskIblDpogAmtTot_Validate(Cancel As Boolean)
If Val(UnMyNumFmt(mskIblDpogAmtTot.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskIblDpogAmtTot.SetFocus
    Rem Cancel = True
End If

End Sub

Private Sub mskIblRfugAmtTot_GotFocus()
FlashActiveControl mskIblRfugAmtTot, True
End Sub

Private Sub mskIblRfugAmtTot_KeyPress(KeyAscii As Integer)
If KeyAscii = vbKeyReturn And mIblPttCode > 0 And mIblIpgCode > 0 Then
    ShowRfugDtlData mIblCode
    ShowRfugEntryMode True
    Mfgrd5.SetFocus
End If

End Sub

Private Sub mskIblRfugAmtTot_LostFocus()
FlashActiveControl mskIblRfugAmtTot, False
End Sub

Private Sub mskIblRfugAmtTot_Validate(Cancel As Boolean)
If Val(UnMyNumFmt(mskIblRfugAmtTot.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskIblRfugAmtTot.SetFocus
    Rem Cancel = True
End If

End Sub

Private Sub mskIgtAdjAmtExcl_GotFocus()
FlashActiveControl mskIgtAdjAmtExcl, True
End Sub

Private Sub mskIgtAdjAmtExcl_LostFocus()
FlashActiveControl mskIgtAdjAmtExcl, False
End Sub

Private Sub mskIgtBalAmt_GotFocus()
FlashActiveControl mskIgtBalAmt, True
End Sub

Private Sub mskIgtBalAmt_LostFocus()
FlashActiveControl mskIgtBalAmt, False
End Sub

Private Sub mskIgtDpogAmt_GotFocus()
FlashActiveControl mskIgtDpogAmt, True
End Sub

Private Sub mskIgtDpogAmt_LostFocus()
FlashActiveControl mskIgtDpogAmt, False
End Sub

Private Sub mskIgtVchNo_Change()
If fcmbIgtVchNo.CallFromText_Change = False Then
    fcmbIgtVchNo.CallFromText_Change = True
    If InterActiveChange(mskIgtVchNo) = True Then
        fcmbIgtVchNo.mFiltCond = "IgtIpgCode=" & CStr(mIblIpgCode)
        fcmbIgtVchNo.ReInit
        
        fcmbIgtVchNo.UserText = Array(mskIgtVchNo.Text, mskIgtVchNo.SelStart)
        fcmbIgtVchNo.Show
        mskIgtVchNo.Text = fcmbIgtVchNo.Text
        If fcmbIgtVchNo.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbIgtVchNo.CallFromText_Change = False
End If

End Sub

Private Sub mskIgtVchNo_GotFocus()
FlashActiveControl mskIgtVchNo, True
End Sub

Private Sub mskIgtVchNo_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call mskIgtVchNo_Change
End If

End Sub

Private Sub mskIgtVchNo_LostFocus()
FlashActiveControl mskIgtVchNo, False
End Sub

Private Sub mskIgtVchNo_Validate(Cancel As Boolean)
If Val(fcmbIgtVchNo.BoundText) <= 0 Then
    ErrorBox "Invalid Selection !!!"
    mskIgtVchNo.SetFocus
    Cancel = True
Else
    If Val(fcmbIgtVchNo.BoundText) <> mIgtCode_old Or FormAddEditMode = cFORM_ADDMODE Then
        clsIGT.GetData Val(fcmbIgtVchNo.BoundText)
        clsVTM.GetData clsIGT.mVtmCode_lng
        
        txtIgtVtmName.Text = clsVTM.mName_str
        dtpIgtDate.Text = Dtoc(clsIGT.mVchDate_dt)
        mskIgtDpogAmt.Text = ToMyNumFmt(clsIGT.mIgtDpogAmt_dbl)
        mskIgtAdjAmtExcl.Text = ToMyNumFmt(clsIGT.mIgtAdjAmt_dbl - mIbgdDpogAmt_old)
        If Val(UnMyNumFmt(mskIbgdDpogAmt.Text)) = 0 Then
            mskIbgdDpogAmt.Text = ToMyNumFmt(clsIGT.mIgtBalAmt_dbl)
        End If
        mskIgtBalAmt.Text = ToMyNumFmt(clsIGT.mIgtBalAmt_dbl)
    End If
End If
Call ValidDpogDtl

End Sub

Private Sub mskIgfAdjAmtExcl_GotFocus()
FlashActiveControl mskIgfAdjAmtExcl, True
End Sub

Private Sub mskIgfAdjAmtExcl_LostFocus()
FlashActiveControl mskIgfAdjAmtExcl, False
End Sub

Private Sub mskIgfBalAmt_GotFocus()
FlashActiveControl mskIgfBalAmt, True
End Sub

Private Sub mskIgfBalAmt_LostFocus()
FlashActiveControl mskIgfBalAmt, False
End Sub

Private Sub mskIgfRfugAmt_GotFocus()
FlashActiveControl mskIgfRfugAmt, True
End Sub

Private Sub mskIgfRfugAmt_LostFocus()
FlashActiveControl mskIgfRfugAmt, False
End Sub

Private Sub mskIgfVchNo_Change()
If fcmbIgfVchNo.CallFromText_Change = False Then
    fcmbIgfVchNo.CallFromText_Change = True
    If InterActiveChange(mskIgfVchNo) = True Then
        fcmbIgfVchNo.mFiltCond = "IgfIpgCode=" & CStr(mIblIpgCode)
        fcmbIgfVchNo.ReInit
        
        fcmbIgfVchNo.UserText = Array(mskIgfVchNo.Text, mskIgfVchNo.SelStart)
        fcmbIgfVchNo.Show
        mskIgfVchNo.Text = fcmbIgfVchNo.Text
        If fcmbIgfVchNo.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbIgfVchNo.CallFromText_Change = False
End If

End Sub

Private Sub mskIgfVchNo_GotFocus()
FlashActiveControl mskIgfVchNo, True
End Sub

Private Sub mskIgfVchNo_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call mskIgfVchNo_Change
End If

End Sub

Private Sub mskIgfVchNo_LostFocus()
FlashActiveControl mskIgfVchNo, False
End Sub

Private Sub mskIgfVchNo_Validate(Cancel As Boolean)
If Val(fcmbIgfVchNo.BoundText) <= 0 Then
    ErrorBox "Invalid Selection !!!"
    mskIgfVchNo.SetFocus
    Cancel = True
Else
    If Val(fcmbIgfVchNo.BoundText) <> mIgfCode_old Or FormAddEditMode = cFORM_ADDMODE Then
        clsIGF.GetData Val(fcmbIgfVchNo.BoundText)
        clsVTM.GetData clsIGF.mVtmCode_lng
        
        txtIgfVtmName.Text = clsVTM.mName_str
        dtpIgfDate.Text = Dtoc(clsIGF.mVchDate_dt)
        mskIgfRfugAmt.Text = ToMyNumFmt(clsIGF.mIgfRfugAmt_dbl)
        mskIgfAdjAmtExcl.Text = ToMyNumFmt(clsIGF.mIgfAdjAmt_dbl - mIbgfRfugAmt_old)
        If Val(UnMyNumFmt(mskIbgfRfugAmt.Text)) = 0 Then
            mskIbgfRfugAmt.Text = ToMyNumFmt(clsIGF.mIgfBalAmt_dbl)
        End If
        mskIgfBalAmt.Text = ToMyNumFmt(clsIGF.mIgfBalAmt_dbl)
    End If
End If
Call ValidRfugDtl

End Sub

Private Sub mskIpgVchNo_GotFocus()
FlashActiveControl mskIpgVchNo, True
End Sub

Private Sub mskIpgVchNo_LostFocus()
FlashActiveControl mskIpgVchNo, False
End Sub

Private Sub mskIpgVchNo_Validate(Cancel As Boolean)
Dim mIpgVchNo As Long
mIpgVchNo = Val(UnMyNumFmt(mskIpgVchNo.Text))
If mIpgVchNo < 0 Then
    ErrorBox "Invalid Input !!!"
    mskIpgVchNo.SetFocus
    Cancel = True
End If

End Sub

Private Sub mskIblRate_GotFocus()
FlashActiveControl mskIblRate, True
End Sub

Private Sub mskIblRate_LostFocus()
FlashActiveControl mskIblRate, False
End Sub

Private Sub mskIblRate_Validate(Cancel As Boolean)
mskIblRate.Text = ToMyNumFmt(mskIblRate.Text)
If Val(UnMyNumFmt(mskIblRate.Text)) <= 0 Then
    ErrorBox "Invalid Input !!!"
    mskIblRate.SetFocus
    Cancel = True
Else
    Call CalcIblChg
    Call ValidDtl
End If

End Sub

Private Sub mskIblRefuAmtTot_GotFocus()
FlashActiveControl mskIblRefuAmtTot, True
End Sub

Private Sub mskIblRefuAmtTot_LostFocus()
FlashActiveControl mskIblRefuAmtTot, False
End Sub

Private Sub mskIblRefuAmtTot_Validate(Cancel As Boolean)
If Val(UnMyNumFmt(mskIblRefuAmtTot.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskIblRefuAmtTot.SetFocus
    Rem Cancel = True
End If

End Sub

Private Sub mskIblUnit_GotFocus()
FlashActiveControl mskIblUnit, True
End Sub

Private Sub mskIblUnit_LostFocus()
FlashActiveControl mskIblUnit, False
End Sub

Private Sub mskIblUnit_Validate(Cancel As Boolean)
mskIblUnit.Text = ToMyNumFmt(mskIblUnit.Text, mDecimals:=0)
If Val(UnMyNumFmt(mskIblUnit.Text)) <= 0 Then
    ErrorBox "Invalid Input !!!"
    mskIblUnit.SetFocus
    Cancel = True
Else
    Call CalcIblChg
    Call ValidDtl
End If

End Sub

Private Sub mskIblVchNo_GotFocus(Index As Integer)
FlashActiveControl mskIblVchNo(Index), True
End Sub

Private Sub mskIblVchNo_LostFocus(Index As Integer)
FlashActiveControl mskIblVchNo(Index), False
End Sub

Private Sub mskIblVchNo_Validate(Index As Integer, Cancel As Boolean)
Dim mIblVchNo As Long

mIblVchNo = Val(UnMyNumFmt(mskIblVchNo(Index).Text))
If mIblVchNo < 0 Then
    If Index = 0 Then
        mIblVchNo = GetNextVTypeNo(dbHmsDatabase, dbAcDatabase, dbComDatabase, mTableName:="IndrBlHdr", mFieldName:="IbhVchNo", mVtmFieldName:="IbhVtmCode", mVtmFieldValue:=Val(fcmbIblVtmName.BoundText), mFinYrFieldName:="IbhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="IbhDate", mDateFieldValue:=Ctod(dtpIblDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormIblAcsPermFileName)
        mskIblVchNo(Index).Text = ToMyNumFmt(mIblVchNo, mDecimals:=0)
    Else
        ErrorBox "Invalid Input !!!"
        mskIblVchNo(Index).SetFocus
        Cancel = True
    End If
ElseIf mIblVchNo > 0 Then
    If Index = 0 Then
        If mIblVchNo <> mIblVchNo_old Or Val(fcmbIblVtmName.BoundText) <> mIblVtmCode_old Or Ctod(dtpIblDate.Text) <> mIblDate_old Or FormAddEditMode = cFORM_ADDMODE Then
            If ChkIsDuplVTypeNo(dbHmsDatabase, dbAcDatabase, mTableName:="IndrBlHdr", mChkFieldName:="IbhVchNo", mChkFieldValue:=mIblVchNo, mKeyFieldName:="IbhCode", mKeyFieldValue:=mIblCode, mVtmFieldName:="IbhVtmCode", mVtmFieldValue:=Val(fcmbIblVtmName.BoundText), mFinYrFieldName:="IbhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="IbhDate", mDateFieldValue:=Ctod(dtpIblDate.Text)) = True Then
                ErrorBox "Duplicate Voucher No. !!!"
                Cancel = True
                mskIblVchNo(Index).SetFocus
                ' ----------
                If FormAddEditMode = cFORM_ADDMODE Then
                    mIblVchNo = GetNextVTypeNo(dbHmsDatabase, dbAcDatabase, dbComDatabase, mTableName:="IndrBlHdr", mFieldName:="IbhVchNo", mVtmFieldName:="IbhVtmCode", mVtmFieldValue:=Val(fcmbIblVtmName.BoundText), mFinYrFieldName:="IbhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="IbhDate", mDateFieldValue:=Ctod(dtpIblDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormIblAcsPermFileName)
                Else
                    mIblVchNo = mIblVchNo_old
                End If
                mskIblVchNo(Index).Text = ToMyNumFmt(mIblVchNo, mDecimals:=0)
            End If
        End If
        If Cancel = False Then
            mskIblVchNo(Index).Text = ToMyNumFmt(mIblVchNo, mDecimals:=0)
        End If
    Else
        If ChkIsExistVTypeNo(dbHmsDatabase, mTableName:="IndrBlHdr", mChkFieldName:="IbhVchNo", mChkFieldValue:=CStr(mIblVchNo), mVtmFieldName:="IbhVtmCode", mVtmFieldValue:=Val(fcmbIblVtmName.BoundText), mFinYrFieldName:="IbhCmpCode", mFinYrFieldValue:=sFinYrCmpCode) = False Then
            ErrorBox "Voucher No. does not Exist !!!"
            mskIblVchNo(Index).SetFocus
            Rem Cancel = True
        End If
    End If
Else
    ErrorBox "Invalid Input !!!"
    mskIblVchNo(Index).SetFocus
    Cancel = True
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

Private Sub mskIblPttDiscPer_GotFocus()
FlashActiveControl mskIblPttDiscPer, True
End Sub

Private Sub mskIblPttDiscPer_LostFocus()
FlashActiveControl mskIblPttDiscPer, False
End Sub

Private Sub mskIblPttDiscPer_Validate(Cancel As Boolean)
mskIblPttDiscPer.Text = ToMyPerFmt(mskIblPttDiscPer.Text)
If Val(UnMyPerFmt(mskIblPttDiscPer.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskIblPttDiscPer.SetFocus
    Cancel = True
End If

End Sub

Private Sub mskPttRegNo_GotFocus()
FlashActiveControl mskPttRegNo, True
End Sub

Private Sub mskPttRegNo_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call ShowOldIpgListByPttRegNo
ElseIf MyAddNewKey(Shift, KeyCode) = True Then
    If FormAddEditMode = cFORM_ADDMODE Then
        clsIBL.EndTran mIblCode
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
        If mPttRegNo = 0 And clsHOPT.mIblPttRegNoNotZero_bln = True Then
            AlertBox "Prohibited Zero Patient Reg.No. !!!"
        End If
    End If
End If

End Sub

Private Sub mskQryPttRegNo_Change()
If fcmbPttRegNo.CallFromText_Change = False Then
    fcmbPttRegNo.CallFromText_Change = True
    If InterActiveChange(mskQryPttRegNo) = True Then
        Call ChkPttRegNoListFirstTime
        
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

Private Sub ChkPttRegNoListFirstTime()
If fcmbPttRegNo.LRecordCount = 0 Then
    fcmbPttRegNo.mFiltCond = ""
    fcmbPttRegNo.ReInit
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

Private Sub txtDrlName_Change()
If fcmbDrlName.CallFromText_Change = False Then
    fcmbDrlName.CallFromText_Change = True
    If InterActiveChange(txtDrlName) = True Then
        fcmbDrlName.UserText = Array(txtDrlName.Text, txtDrlName.SelStart)
        fcmbDrlName.Show
        txtDrlName.Text = fcmbDrlName.Text
        If fcmbDrlName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbDrlName.CallFromText_Change = False
End If

End Sub

Private Sub txtDrlName_GotFocus()
FlashActiveControl txtDrlName, True
End Sub

Private Sub txtDrlName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtDrlName_Change
End If

End Sub

Private Sub txtDrlName_LostFocus()
FlashActiveControl txtDrlName, False
End Sub

Private Sub txtDrlName_Validate(Cancel As Boolean)
If Val(fcmbDrlName.BoundText) <= 0 Then
    ErrorBox "Invalid Selection !!!"
    txtDrlName.SetFocus
    Cancel = True
End If
Call ValidSdcDtl

End Sub

Private Sub txtFDigName_GotFocus()
FlashActiveControl txtFDigName, True
End Sub

Private Sub txtFDigName_LostFocus()
FlashActiveControl txtFDigName, False
End Sub

Private Sub txtIbbsRemark_GotFocus()
FlashActiveControl txtIbbsRemark, True
End Sub

Private Sub txtIbbsRemark_LostFocus()
FlashActiveControl txtIbbsRemark, False
End Sub

Private Sub txtIbhRemark_GotFocus()
FlashActiveControl txtIbhRemark, True
End Sub

Private Sub txtIbhRemark_LostFocus()
FlashActiveControl txtIbhRemark, False
End Sub

Private Sub txtIbhRemark_Validate(Cancel As Boolean)
txtIbhRemark.Text = ToMyWord(txtIbhRemark.Text)
End Sub

Private Sub txtIbsDischTime_GotFocus()
FlashActiveControl txtIbsDischTime, True
End Sub

Private Sub txtIbsDischTime_LostFocus()
FlashActiveControl txtIbsDischTime, False
End Sub

Private Sub txtIbsDischTime_Validate(Cancel As Boolean)
Dim tRecset As New ADODB.Recordset, srow As Integer, mIbsCode As Long, mIbsDischDate As Date, mIbsDischDate_old As Date, mIbsDischTime As Long, mIbsDischTime_old As Long

'''srow = Mfgrd3.Row
If txtIbsDischTime.Text <> "" Then
    txtIbsDischTime.Text = MinToTime(TimeToMin(txtIbsDischTime.Text))
    If Between(TimeToMin(txtIbsDischTime.Text), 0, cDAYMINUTES) = False Then
        ErrorBox "Invalid Discharge Time !!!"
        txtIbsDischTime.SetFocus
        Cancel = True
    ElseIf Ctod(dtpIbsDischDate.Text) = Ctod(dtpIblDate.Text) And TimeToMin(txtIbsDischTime.Text) < TimeToMin(txtIblTime_str.Text) Then
        ErrorBox "Invalid Discharge Time !!!"
        txtIbsDischTime.SetFocus
        Cancel = True
    Else
        mIbsDischDate = Ctod(dtpIbsDischDate.Text)
        mIbsDischTime = TimeToMin(txtIbsDischTime.Text)
        Set tRecset = dbHmsDatabase.Execute("Select * from ((IndrBlIbsDtl" _
            & " inner join IBedState on IndrBlIbsDtl.IbbsIbsCode = IBedState.IbsCode)" _
            & " inner join IndrBill on IndrBlIbsDtl.IbbsCode = IndrBill.IblCode and IndrBlIbsDtl.IbbsIblICode = IndrBill.IblICode)" _
            & " left join IndrBlHdr on IndrBill.IblCode = IndrBlHdr.IbhCode" _
            & " where IbbsIpgCode = " & CStr(mIblIpgCode) & " and IbbsCode <> " & CStr(mIblCode) & " and IbbsToDate >= #" & CStr(ToSysDate(mIbsDischDate)) & "#" _
            & " order by IbbsToDate Desc,IbbsToTime desc,IbbsICode desc" & "")
        With tRecset
        If .EOF = False Then
            If .fields("IbbsToDate") = mIbsDischDate And .fields("IbbsToTime") > mIbsDischTime Then
                If IsNull(.fields("IbhCode")) = False Then
                    ErrorBox "Bed Charges Already Charged in Indoor Bill No." & CStr(.fields("IbhVchNo")) & " Dated " & Dtoc(.fields("IbhDate")) & " " & MinToTime(.fields("IbhTime")) & " !!!"
                Else
                    ErrorBox "Bed Charges Already Charged in Indoor Bill Dated " & Dtoc(.fields("IblDate")) & " Under Process !!!"
                End If
                txtIbsDischTime.Text = ""
                txtIbsDischTime.SetFocus
                Cancel = True
            End If
        End If
        End With
        CloseTable tRecset
    End If
'''    mIbsDischDate = Ctod(dtpIbsDischDate.Text)
'''    mIbsDischDate_old = Ctod(Mfgrd3.TextMatrix(srow, X3IBSDISCHDATE_COL))
'''    mIbsDischTime = TimeToMin(txtIbsDischTime.Text)
'''    mIbsDischTime_old = TimeToMin(Mfgrd3.TextMatrix(srow, X3IBSDISCHTIME_COL))
'''    mIbsCode = Val(Mfgrd3.TextMatrix(srow, X3IBSCODE_COL))
'''    If dtlAddMode = False And Cancel = False Then
'''        If mIbsDischDate <> mIbsDischDate_old Or mIbsDischTime <> mIbsDischTime_old Then
'''            With tRecset
'''            .open "Select * from ((IndrBlIbsDtl" _
'''                & " inner join IBedState on IndrBlIbsDtl.IbbsIbsCode = IBedState.IbsCode)" _
'''                & " inner join IndrBill on IndrBlIbsDtl.IbbsCode = IndrBill.IblCode and IndrBlIbsDtl.IbbsIblICode = IndrBill.IblICode)" _
'''                & " left join IndrBlHdr on IndrBill.IblCode = IndrBlHdr.IbhCode" _
'''                & " where IbbsIpgCode = " & CStr(Val(lblIbsIpgCode.Caption)) & " and IbbsIbsCode = " & CStr(mIbsCode) _
'''                & " order by IblDate Desc" & "", dbHmsDatabase, adOpenKeyset, adLockReadOnly
'''            If .EOF = False Then
'''                If .fields("IbbsToDate") = mIbsDischDate And .fields("IbbsToTime") > mIbsDischTime Then
'''                    If IsNull(.fields("IbhCode")) = False Then
'''                        ErrorBox "Bed Charges Already Charged in Indoor Bill No." & CStr(.fields("IbhVchNo")) & " Dated " & Dtoc(.fields("IbhDate")) & "/" & MinToTime(.fields("IbbsToTime")) & " !!!"
'''                    Else
'''                        ErrorBox "Bed Charges Already Charged in Indoor Bill Dated " & Dtoc(.fields("IblDate")) & "/" & MinToTime(.fields("IbbsToTime")) & " Under Process !!!"
'''                    End If
'''                    If Mfgrd3.TextMatrix(srow, X3IBSDISCHTIME_COL) = "" Then
'''                        txtIbsDischTime.Text = ""
'''                    Else
'''                        txtIbsDischTime.Text = MinToTime(mIbsDischTime_old)
'''                    End If
'''                    txtIbsDischTime.SetFocus
'''                    Cancel = True
'''                End If
'''            End If
'''            End With
'''            CloseTable tRecset
'''        End If
'''    End If
End If
'''Call ValidDtl

End Sub

Private Sub txtIbsRemark_GotFocus()
FlashActiveControl txtIbsRemark, True
End Sub

Private Sub txtIbsRemark_LostFocus()
FlashActiveControl txtIbsRemark, False
End Sub

Private Sub txtIgtVtmName_GotFocus()
FlashActiveControl txtIgtVtmName, True
End Sub

Private Sub txtIgtVtmName_LostFocus()
FlashActiveControl txtIgtVtmName, False
End Sub

Private Sub txtIgfVtmName_GotFocus()
FlashActiveControl txtIgfVtmName, True
End Sub

Private Sub txtIgfVtmName_LostFocus()
FlashActiveControl txtIgfVtmName, False
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

Private Sub txtIblTime_str_GotFocus()
FlashActiveControl txtIblTime_str, True
End Sub

Private Sub txtIblTime_str_LostFocus()
FlashActiveControl txtIblTime_str, False
End Sub

Private Sub txtIblTime_str_Validate(Cancel As Boolean)
txtIblTime_str.Text = MinToTime(TimeToMin(txtIblTime_str.Text))
If TimeToMin(txtIblTime_str.Text) > cDAYMINUTES Then
    ErrorBox "Invalid Input !!!"
    txtIblTime_str.SetFocus
    Cancel = True
ElseIf ChkBillTime() = False Then
    Rem ErrorBox "Invalid Bill Time !!!"
    txtIblTime_str.SetFocus
    Cancel = True
Else
'''    Call ChkServRate
'''    Call CalcIblChg
End If

End Sub

Private Function ChkBillTime() As Boolean
Dim tRecset As New ADODB.Recordset, mRtnval As Boolean

If FormAddEditMode = cFORM_EDITMODE And mIblTime_old = TimeToMin(txtIblTime_str.Text) Then
    ChkBillTime = True
    Exit Function
End If

mRtnval = True
Set tRecset = dbHmsDatabase.Execute("Select top 1 * from IndrBill" _
    & " left join IndrBlHdr on IndrBill.IblCode = IndrBlHdr.IbhCode" _
    & " where IblIpgCode = " & CStr(mIblIpgCode) & " and IblCode <> " & CStr(mIblCode) _
    & " order by IblDate desc,IbhTime desc,IblCode desc,IblICode desc")
With tRecset
If .EOF = False Then
    If .fields("IblDate") = Ctod(dtpIblDate.Text) And NoneZero1(.fields("IbhTime"), TimeToMin(txtIblTime_str.Text)) > TimeToMin(txtIblTime_str.Text) Then
        mRtnval = False
        If IsNull(.fields("IbhCode")) = False Then
            ErrorBox "Prior Bill Exist vide Bill No." & CStr(.fields("IbhVchNo")) & " Dated " & Dtoc(.fields("IblDate")) & " - " & MinToTime(.fields("IbhTime")) & " !!!"
        Else
            ErrorBox "Prior Bill Under Process Dated " & Dtoc(.fields("IblDate")) & " !!!"
        End If
    End If
End If
End With
CloseTable tRecset

If mRtnval = True Then
    If Ctod(dtpIpgDate.Text) = Ctod(dtpIblDate.Text) And TimeToMin(txtIpgTime_str.Text) > TimeToMin(txtIblTime_str.Text) Then
        mRtnval = False
        ErrorBox "Admission Time Greater than Bill Time !!!"
    End If
End If

If mRtnval = True Then
    Set tRecset = dbHmsDatabase.Execute("Select * from (IndrBill" _
        & " inner join IndrBlIbsDtl on IndrBill.IblCode = IndrBlIbsDtl.IbbsCode and IndrBill.IblICode = IndrBlIbsDtl.IbbsIblICode)" _
        & " inner join IBedState on IndrBlIbsDtl.IbbsIbsCode = IBedState.IbsCode" _
        & " where IblCode = " & CStr(mIblCode) _
        & " order by IblSno")
    With tRecset
    If .EOF = False Then
        Do While .EOF = False
            If .fields("IbsDischState") <> cIBS_STATE_SHIFTED And .fields("IbbsToTime") <> TimeToMin(txtIblTime_str.Text) Then
                mRtnval = False
                ErrorBox "Mismatch Bill Time " & CStr(txtIblTime_str.Text) & " with Generated Bed Status Time " & MinToTime(.fields("IbbsToTime")) & " !!!"
                Exit Do
            End If
            .MoveNext
        Loop
    End If
    End With
    CloseTable tRecset
End If

ChkBillTime = mRtnval

Set tRecset = Nothing

End Function

Private Sub txtIblVtmName_Change(Index As Integer)
If fcmbIblVtmName.CallFromText_Change = False Then
    fcmbIblVtmName.CallFromText_Change = True
    If InterActiveChange(txtIblVtmName(Index)) = True Then
        fcmbIblVtmName.UserText = Array(txtIblVtmName(Index).Text, txtIblVtmName(Index).SelStart)
        fcmbIblVtmName.Show
        txtIblVtmName(Index).Text = fcmbIblVtmName.Text
        If fcmbIblVtmName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbIblVtmName.CallFromText_Change = False
End If

End Sub

Private Sub txtIblVtmName_GotFocus(Index As Integer)
FlashActiveControl txtIblVtmName(Index), True
End Sub

Private Sub txtIblVtmName_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    txtIblVtmName_Change Index
ElseIf MyAddNewKey(Shift, KeyCode) = True Then

ElseIf Shift = 0 And KeyCode = vbKeyF6 Then
    Rem Call ShowOldIpgListByIpgNo show here all indoor receipt details
End If

End Sub

Private Sub txtIblVtmName_LostFocus(Index As Integer)
FlashActiveControl txtIblVtmName(Index), False
End Sub

Private Sub txtIblVtmName_Validate(Index As Integer, Cancel As Boolean)
Dim mIblVchNo As Long

If Val(fcmbIblVtmName.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    txtIblVtmName(Index).SetFocus
    Cancel = True
Else
    If Index = 0 Then
        If Val(fcmbIblVtmName.BoundText) <> mIblVtmCode_old Or Ctod(dtpIblDate.Text) <> mIblDate_old Or FormAddEditMode = cFORM_ADDMODE Then
            mIblVchNo = GetNextVTypeNo(dbHmsDatabase, dbAcDatabase, dbComDatabase, mTableName:="IndrBlHdr", mFieldName:="IbhVchNo", mVtmFieldName:="IbhVtmCode", mVtmFieldValue:=Val(fcmbIblVtmName.BoundText), mFinYrFieldName:="IbhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="IbhDate", mDateFieldValue:=Ctod(dtpIblDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormIblAcsPermFileName)
            mskIblVchNo(Index).Text = ToMyNumFmt(mIblVchNo, mDecimals:=0)
        End If
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
        clsIBL.EndTran mIblCode
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
If clsIBL.BeginTran(0) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_ADDMODE

clsIBL.ClearHdr: clsIBL.ClearDtl
clsIPG.Clear
clsPAT.Clear

mIblCode = clsIBL.ActiveTrnCode
mIblIpgCode = 0
mIblPttCode = 0

ShowIblData mIblCode
ShowIpgData mIblIpgCode
ShowPatData mIblPttCode

Rem restoring user editing features
Call ShowIblDefData
Call ShowPatDefData
Call ShowIpgDefData

Rem old values
Call StoreIblOldData
Call StorePatOldData
Call StoreIpgOldData

Call ShowEntryMode(True)
Call ChkIpdDischState
txtPttName.SetFocus

End Sub

Private Sub Data_EditEvent()

If CanUserEditOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If clsIBL.BeginTran(datRecset.fields("IbhCode")) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_EDITMODE

With datRecset
mIblCode = .fields("IbhCode")
mIblIpgCode = .fields("IbhIpgCode")
mIblPttCode = .fields("IbhPttCode")

clsIBL.GetHdrData mIblCode
clsIPG.GetData mIblIpgCode
clsPAT.GetData mIblPttCode
End With

ShowIblData mIblCode
ShowIpgData mIblIpgCode
ShowPatData mIblPttCode

Rem old values
Call StoreIblOldData
Call StoreIpgOldData
Call StorePatOldData

Call ShowEntryMode(True)
Call ChkIpdDischState
txtPttName.SetFocus

End Sub

Private Sub ShowPatData(ByVal mPttCode As Long)

With clsPAT
.GetData mPttCode

mskIblPttCode.Text = mPttCode
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
clsPAT.GetData Val(UnMyNumFmt(mskIblPttCode.Text))

mPttRegNo_old = Val(UnMyNumFmt(mskPttRegNo.Text))
mPttPcgCode_old = clsPAT.mPttPcgCode_lng

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
Dim tRecset As ADODB.Recordset

With clsIPG
.GetData mIpgCode

mskIblIpgCode.Text = mIpgCode
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
ChkIpgAdvAmt mIpgCode
'ChkIpgDpogAmt mIpgCode
'ChkIpgRfugAmt mIpgCode

txtIpgVtmName.Locked = (mIpgCode > 0)
txtIpgPrefix.Locked = (mIpgCode > 0)
mskIpgVchNo.Locked = (mIpgCode > 0)
dtpIpgDate.Locked = (mIpgCode > 0)
txtIpgTime_str.Locked = (mIpgCode > 0)
txtCDctName.Locked = (mIpgCode > 0)
txtRByName.Locked = (mIpgCode > 0)
txtFDigName.Locked = (mIpgCode > 0)
txtIpgRemark.Locked = (mIpgCode > 0)

Rem discharge status
dtpIbsDischDate.Text = ""
txtIbsDischTime.Text = ""
cmbIbsDischState.ListIndex = GetListIndexFromItemData(mCmbObj:=cmbIbsDischState, mTargetItemData:=cIBS_STATE_OCCUPIED)
txtIbsRemark.Text = ""

Set tRecset = dbHmsDatabase.Execute("Select * from IBedState where IbsIpgCode = " & CStr(mIpgCode) & " and IbsDischState not IN (" & CStr(cIBS_STATE_OCCUPIED) & "," & CStr(cIBS_STATE_SHIFTED) & "," & CStr(cIBS_STATE_UNKNOWN) & ") order by IbsCode desc")
With tRecset
If .EOF = False Then
    dtpIbsDischDate.Text = Dtoc(.fields("IbsDischDate"))
    txtIbsDischTime.Text = MinToTime(.fields("IbsDischTime"))
    cmbIbsDischState.ListIndex = GetListIndexFromItemData(mCmbObj:=cmbIbsDischState, mTargetItemData:=.fields("IbsDischState"))
    txtIbsRemark.Text = .fields("IbsRemark")
End If
End With
CloseTable tRecset

End Sub

Private Sub ChkIpgAdvAmt(ByVal mIpgCode As Long)
Dim tRecset As New ADODB.Recordset, mIpgAdvAmt As Double

With tRecset
.open "Select IpgAdvAmt from IndrReg where IpgCode=" & CStr(mIpgCode) & "", dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    mIpgAdvAmt = .fields("IpgAdvAmt")
End If
End With
CloseTable tRecset

With tRecset
.open "Select sum(IbhAdvAmt) as IbhAdvAmt_sum from IndrBlHdr where IbhIpgCode=" & CStr(mIpgCode) & " and IbhCode<>" & CStr(mIblCode) & "", dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    mIpgAdvAmt = mIpgAdvAmt - NoneZero1(.fields("IbhAdvAmt_sum"), 0)
End If
End With
CloseTable tRecset
mIpgAdvAmt = IIf(mIpgAdvAmt < 0, 0, mIpgAdvAmt)

mskIblAdvAmt.Text = ToMyNumFmt(mIpgAdvAmt)
If mIblAdvAmt_old <> mIpgAdvAmt Then
    Call CalcFtrTotal
End If

End Sub

''Private Sub ChkIpgDpogAmt(ByVal mIpgCode As Long)
''Dim tRecset As New ADODB.Recordset, mIpgDpogAmt As Double
''
''mIpgDpogAmt = 0
''With tRecset
''.Open "Select sum(IgtDpogAmt) as IgtDpogAmt_sum from IndrRgPymt where IgtIpgCode=" & CStr(mIpgCode) & "", dbHmsDatabase, adOpenKeyset, adLockOptimistic
''If .EOF = False Then
''    mIpgDpogAmt = NoneZero1(.fields("IgtDpogAmt_sum"), 0)
''End If
''End With
''CloseTable tRecset
''
''With tRecset
''.Open "Select sum(IbhDpogAmt) as IbhDpogAmt_sum from IndrBlHdr where IbhCode<>" & CStr(mIblCode) & "", dbHmsDatabase, adOpenKeyset, adLockOptimistic
''If .EOF = False Then
''    mIpgDpogAmt = mIpgDpogAmt - NoneZero1(.fields("IbhDpogAmt_sum"), 0)
''End If
''End With
''CloseTable tRecset
''
''mskIblDpogAmtTot.Text = ToMyNumFmt(mIpgDpogAmt)
''
''End Sub
''
''Private Sub ChkIpgRfugAmt(ByVal mIpgCode As Long)
''Dim tRecset As New ADODB.Recordset, mIpgRfugAmt As Double
''
''mIpgRfugAmt = 0
''With tRecset
''.Open "Select sum(IgfRfugAmt) as IgfRfugAmt_sum from IndrRgRefd where IgfIpgCode=" & CStr(mIpgCode) & "", dbHmsDatabase, adOpenKeyset, adLockOptimistic
''If .EOF = False Then
''    mIpgRfugAmt = NoneZero1(.fields("IgfRfugAmt_sum"), 0)
''End If
''End With
''CloseTable tRecset
''
''With tRecset
''.Open "Select sum(IbhRfugAmt) as IbhRfugAmt_sum from IndrBlHdr where IbhCode<>" & CStr(mIblCode) & "", dbHmsDatabase, adOpenKeyset, adLockOptimistic
''If .EOF = False Then
''    mIpgRfugAmt = mIpgRfugAmt - NoneZero1(.fields("IbhRfugAmt_sum"), 0)
''End If
''End With
''CloseTable tRecset
''
''mskIblRfugAmtTot.Text = ToMyNumFmt(mIpgRfugAmt)
''
''End Sub

Private Sub ShowIpgDefData()
Dim mIpgVchNo As Long

dtpIpgDate.Text = Dtoc(DefaultEntryDate)
txtIpgTime_str.Text = MinToTime(TimeToMin(DateTime.Time$))
txtIpgVtmName.Text = ""
txtIpgPrefix.Text = ""
mskIpgVchNo.Text = 0
mskIblAdvAmt.Text = ToMyNumFmt(0)
mskIblDpogAmtTot.Text = ToMyNumFmt(0)
mskIblRfugAmtTot.Text = ToMyNumFmt(0)

End Sub

Private Sub StoreIpgOldData()
clsIPG.GetData Val(UnMyNumFmt(mskIblIpgCode.Text))

mIpgCDctCode_old = clsIPG.mIpgCDctCode_lng
mIpgRByCode_old = clsIPG.mIpgRByCode_lng
mIpgRToCode_old = clsIPG.mIpgRToCode_lng

End Sub

Private Sub ShowIblData(ByVal mIblCode As Long)
With clsIBL
.GetHdrData mIblCode

mskFormBoundField.Text = mIblCode
fcmbIblVtmName.BoundText = CStr(.mTrnVtmCode_lng): txtIblVtmName(0).Text = fcmbIblVtmName.Text
txtIblPrefix.Text = .mTrnPrefix_str
mskIblVchNo(0).Text = ToMyNumFmt(.mTrnVchNo_lng, mDecimals:=0)
dtpIblDate.Text = Dtoc(.mTrnDate_dt)
txtIblTime_str.Text = MinToTime(.mIbhTime_lng)
txtIbhRemark.Text = .mIbhRemark_str
mskIblPttDiscPer.Text = ToMyPerFmt(.mIbhPttDiscPer_dbl)

mskIblAdvAmt.Text = ToMyNumFmt(.mIbhAdvAmt_dbl)
mskIblDpogAmtTot.Text = ToMyNumFmt(.mIbhDpogAmt_dbl)
mskIblDepoAmtTot.Text = ToMyNumFmt(.mIbhDepoAmt_dbl)
mskIblRfugAmtTot.Text = ToMyNumFmt(.mIbhRfugAmt_dbl)
mskIblRefuAmtTot.Text = ToMyNumFmt(.mIbhRefuAmt_dbl)

Rem old indoor receipt
mIblOldIblCode = .mIbhOldIbhCode_lng
ShowOldIblCodeDesc mIblOldIblCode
End With

'Call CalcIblChg
ShowDtlData mIblCode
Call ShowLinkTranDtl


End Sub

Private Sub ShowIblDefData()
Dim mIblVchNo As Long

dtpIblDate.Text = Dtoc(DefaultEntryDate)
txtIblTime_str.Text = MinToTime(TimeToMin(DateTime.Time$))

fcmbIblVtmName.BoundText = CStr(clsHOPT.GetIndrBillOptBoundCode("IblVtmCode")): txtIblVtmName(0).Text = fcmbIblVtmName.Text

mIblVchNo = GetNextVTypeNo(dbHmsDatabase, dbAcDatabase, dbComDatabase, mTableName:="IndrBlHdr", mFieldName:="IbhVchNo", mVtmFieldName:="IbhVtmCode", mVtmFieldValue:=Val(fcmbIblVtmName.BoundText), mFinYrFieldName:="IbhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="IbhDate", mDateFieldValue:=Ctod(dtpIblDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormIblAcsPermFileName)
mskIblVchNo(0).Text = ToMyNumFmt(mIblVchNo, mDecimals:=0)

End Sub

Private Sub StoreIblOldData()
mIblCode_old = mIblCode
mIblDate_old = Ctod(dtpIblDate.Text)
mIblTime_old = TimeToMin(txtIblTime_str.Text)
mIblVtmCode_old = Val(fcmbIblVtmName.BoundText)
mIblVchNo_old = Val(UnMyNumFmt(mskIblVchNo(0).Text))
mIblAdvAmt_old = Val(UnMyNumFmt(mskIblAdvAmt.Text))

mskIblDiscPer.Tag = False
mskIblDiscAmt.Tag = False

End Sub

Private Sub ShowDtlData(ByVal mIblCode As Long)
Dim srow As Integer, tRecset As New ADODB.Recordset, mColCnt As Integer

srow = 1
Mfgrd2.Rows = 2

Set tRecset = dbHmsDatabase.Execute("Select * from IndrBill" _
    & " left join IndrBlIbsDtl on IndrBill.IblCode = IndrBlIbsDtl.IbbsCode and IndrBill.IblICode = IndrBlIbsDtl.IbbsIblICode" _
    & " where IblCode = " & CStr(mIblCode) _
    & " order by IblSno")
With tRecset
If .EOF = False Then
    Do While .EOF = False
        If InList(.fields("IblRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
            clsSRV.GetData .fields("IblSrvCode")
            
            Mfgrd2.TextMatrix(srow, X2IBLICODE_COL) = .fields("IblICode")
            Mfgrd2.TextMatrix(srow, X2IBLSNO_COL) = ToMyNumFmt(.fields("IblSno"), mDecimals:=0)
            Mfgrd2.TextMatrix(srow, X2SRVNAME_COL) = clsSRV.mName_str
            If GetServDctDtlCount(cnn:=dbHmsDatabase, mTableName:="IndrBlDctDtl", mSdcCodeField:="IbdCode", mSdcCode:=.fields("IblCode"), mSdcSubCodeField:="IbdIblCode", mSdcSubCode:=.fields("IblICode")) > 0 Then
                Mfgrd2.TextMatrix(srow, X2SDCFLAG_COL) = "Y"
            Else
                If clsSRV.mSrvMultiDctIncl_bln = True Then
                    Mfgrd2.TextMatrix(srow, X2SDCFLAG_COL) = "N"
                Else
                    Mfgrd2.TextMatrix(srow, X2SDCFLAG_COL) = ""
                End If
            End If
            Mfgrd2.TextMatrix(srow, X2IBLUNIT_COL) = ToMyNumFmt(.fields("IblUnit"), mDecimals:=0)
            Mfgrd2.TextMatrix(srow, X2IBLRATE_COL) = ToMyNumFmt(.fields("IblRate"))
            Mfgrd2.TextMatrix(srow, X2IBLAMTBEFDISC_COL) = ToMyNumFmt(.fields("IblAmtBefDisc"))
            Mfgrd2.TextMatrix(srow, X2IBLDISCPER_COL) = ToMyPerFmt(.fields("IblDiscPer"))
            Mfgrd2.TextMatrix(srow, X2IBLDISCAMT_COL) = ToMyNumFmt(.fields("IblDiscAmt"))
            Mfgrd2.TextMatrix(srow, X2IBLAMTAFTDISC_COL) = ToMyNumFmt(.fields("IblAmtAftDisc"))
            Mfgrd2.TextMatrix(srow, X2IBLADVAMT_COL) = ToMyNumFmt(.fields("IblAdvAmt"))
            Mfgrd2.TextMatrix(srow, X2IBLDPOGAMT_COL) = ToMyNumFmt(.fields("IblDpogAmt"))
            Mfgrd2.TextMatrix(srow, X2IBLDEPOAMT_COL) = ToMyNumFmt(.fields("IblDepoAmt"))
            Mfgrd2.TextMatrix(srow, X2IBLRFUGAMT_COL) = ToMyNumFmt(.fields("IblRfugAmt"))
            Mfgrd2.TextMatrix(srow, X2IBLREFUAMT_COL) = ToMyNumFmt(.fields("IblRefuAmt"))
            Mfgrd2.TextMatrix(srow, X2IBLBALAMT_COL) = ToMyNumFmt(.fields("IblBalAmt"))
            Mfgrd2.TextMatrix(srow, X2IBLREMARK_COL) = .fields("IblRemark")
            Mfgrd2.TextMatrix(srow, X2IBLSRVCODE_COL) = .fields("IblSrvCode")
            Mfgrd2.TextMatrix(srow, X2IBLRECSTATE_COL) = .fields("IblRecState")
            If IsNull(.fields("IbbsCode")) = False And InList(.fields("IbbsRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
                Mfgrd2.TextMatrix(srow, X2IBBSICODE_COL) = .fields("IbbsICode")
                Mfgrd2.TextMatrix(srow, X2IBBSIBSCODE_COL) = .fields("IbbsIbsCode")
                Mfgrd2.TextMatrix(srow, X2IBBSFROMDATE_COL) = Dtoc(.fields("IbbsFromDate"))
                Mfgrd2.TextMatrix(srow, X2IBBSFROMTIME_COL) = MinToTime(.fields("IbbsFromTime"))
                Mfgrd2.TextMatrix(srow, X2IBBSTODATE_COL) = Dtoc(.fields("IbbsToDate"))
                Mfgrd2.TextMatrix(srow, X2IBBSTOTIME_COL) = MinToTime(.fields("IbbsToTime"))
                Mfgrd2.TextMatrix(srow, X2IBBSREMARK_COL) = .fields("IbbsRemark")
            End If
            
            Mfgrd2.Rows = Mfgrd2.Rows + 1
            srow = srow + 1
        Else
            If InList(.fields("IblRecState"), Array(cREC_CANCELED, cREC_DELETED)) = False Then
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
Dim tRecset As New ADODB.Recordset, mIbsCode As Long

With clsIBL
If FormAddEditMode = cFORM_ADDMODE Then
    .ClearHdr
Else
    .GetHdrData mIblCode
End If
.mTrnDate_dt = Ctod(dtpIblDate.Text)
.mTrnVtmCode_lng = Val(fcmbIblVtmName.BoundText)
.mTrnPrefix_str = txtIblPrefix.Text
.mTrnVchNo_lng = Val(UnMyNumFmt(mskIblVchNo(0).Text))
.mTrnPostfix_str = ""
.mTrnCmpCode_int = sFinYrCmpCode

.mIbhTime_lng = TimeToMin(txtIblTime_str.Text)
.mIbhIpgCode_lng = mIblIpgCode
.mIbhPttCode_lng = mIblPttCode
.mIbhPttDiscPer_dbl = Val(UnMyPerFmt(mskIblPttDiscPer.Text))
.mIbhOldIbhCode_lng = mIblOldIblCode
.mIbhAmtBefDisc_dbl = Val(UnMyNumFmt(lblIblAmtBefDiscTot.Caption))
.mIbhDiscAmt_dbl = Val(UnMyNumFmt(lblIblDiscAmtTot.Caption))
.mIbhAmtAftDisc_dbl = Val(UnMyNumFmt(lblIblAmtAftDiscTot.Caption))
.mIbhAdvAmt_dbl = Val(UnMyNumFmt(mskIblAdvAmt.Text))
.mIbhDpogAmt_dbl = Val(UnMyNumFmt(mskIblDpogAmtTot.Text))
.mIbhDepoAmt_dbl = Val(UnMyNumFmt(mskIblDepoAmtTot.Text))
.mIbhRfugAmt_dbl = Val(UnMyNumFmt(mskIblRfugAmtTot.Text))
.mIbhRefuAmt_dbl = Val(UnMyNumFmt(mskIblRefuAmtTot.Text))
.mIbhBalAmt_dbl = Val(UnMyNumFmt(mskIblBalAmtTot.Text))
.mIbhRemark_str = txtIbhRemark.Text

If FormAddEditMode = cFORM_ADDMODE Then
    If .AddNewHdr() = True Then
        mskFormBoundField.Text = .mTrnCode_lng
        
        Rem remove any unexpected doctor detail for service
        dbHmsDatabase.BeginTrans
        dbHmsDatabase.Execute "Delete from IndrBlDctDtl where IbdIblCode IN (Select IblICode from IndrBill as ibl inner join ServMast as srv on ibl.IblSrvCode=srv.SrvCode where srv.SrvMultiDctIncl=False and ibl.IblCode=" & CStr(mIblCode) & ") and IbdCode=" & CStr(mIblCode) & ""
        dbHmsDatabase.CommitTrans
    End If
Else
    .UpdateHdr mIblCode
End If
If .mTrnCode_lng > 0 Then   ' updated successfully
    mIblCode = .mTrnCode_lng
    
    .UpdateTran .mTrnCode_lng
    .EndTran .mTrnCode_lng
    
    If mIpdDischState = cIBS_STATE_OCCUPIED And InList(cmbIbsDischState.ListIndex, Array(cIBS_STATE_OCCUPIED, cIBS_STATE_SHIFTED, cIBS_STATE_UNKNOWN)) = False Then
        mIbsCode = 0
        Set tRecset = dbHmsDatabase.Execute("Select * from IBedState where IbsIpgCode = " & CStr(mIblIpgCode) & " order by IbsCode desc")
        With tRecset
        If .EOF = False Then
            If .fields("IbsDischState") <> cIBS_STATE_OCCUPIED Then
                ErrorBox "Unexpected Bed Status " & CStr(.fields("IbsDischState")) & " !!!"
            Else
                mIbsCode = .fields("IbsCode")
            End If
        End If
        End With
        CloseTable tRecset
        
        If mIbsCode > 0 Then
            If clsIBS.BeginTran(mIbsCode) = False Then
                ErrorBox "Discharge Process Cancelled !!!"
                mIbsCode = 0
            End If
        End If
        If mIbsCode > 0 Then
            With clsIBS
            .GetData mIbsCode
            
            .mVtmCode_lng = .mVtmCode_lng            ''' clsIPG.mVtmCode_lng      ''' Val(fcmbVtmName.BoundText)
            .mIbsSno_int = .mIbsSno_int              ''' Val(UnMyNumFmt(mskIbsSno.Text))
            .mVchNo_lng = .mVchNo_lng                ''' clsIPG.mVchNo_lng         ''   Val(UnMyNumFmt(mskIpgVchNo.Text))
            .mVchDate_dt = .mVchDate_dt              ''' Ctod(dtpIbsDate.Text)    ''  Ctod(dtpIpgDate.Text)
            .mCmpCode_int = .mCmpCode_int            ''' sFinYrCmpCode
            
            .mIbsPrefix_str = .mIbsPrefix_str
            .mIbsPostfix_str = .mIbsPostfix_str
            .mIbsTime_lng = .mIbsTime_lng
            .mIbsIpgCode_lng = .mIbsIpgCode_lng
            .mIbsBdmCode_lng = .mIbsBdmCode_lng
            .mIbsPttCode_lng = .mIbsPttCode_lng
            .mIbsDischDate_dt = Ctod(dtpIbsDischDate.Text)
            .mIbsDischTime_lng = TimeToMin(txtIbsDischTime.Text)
            .mIbsDischState_int = cmbIbsDischState.ListIndex
            .mIbsRemark_str = txtIbsRemark.Text
            
            .Update mIbsCode
            
            .UpdateTran mIbsCode
            .EndTran mIbsCode
            
            End With
        Else
            ErrorBox "Discharge Process Aborted Unexpectedely !!!"
        End If
    End If
    
    Rem updating user editing carry forward features
    clsHOPT.mIblVtmCodeOld_lng = .mTrnVtmCode_lng
    clsHOPT.UpdateIndrBillOld
    
    mEntrySaved = True
Else
    Call Data_CancelEvent
    ErrorBox "Entry Cancelled !!!"
End If
End With

If clsIBL.mTrnCode_lng > 0 Then   ' updated successfully
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

mIblCode = datRecset.fields("IbhCode")
mIblPttCode = datRecset.fields("IbhPttCode")
mRecAbsPos = datRecset.AbsolutePosition

If clsIBL.CanDeleteTran(mIblCode) = True Then
    txtVoid.SetFocus
    If clsIBL.BeginTran(mIblCode) = True Then
        clsIBL.DeleteTran mIblCode
        clsIBL.UpdateTran mIblCode
        clsIBL.EndTran mIblCode
    
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
clsIBL.CancelTran mIblCode
clsIBL.EndTran mIblCode

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
Dim tRecset As ADODB.Recordset

If datRecset.State = 1 Then
    CloseTable datRecset
End If
RefreshDatabase dbHmsDatabase
RefreshDatabase dbAcDatabase
RefreshDatabase dbGrpDatabase
RefreshDatabase dbComDatabase
clsListStru.Clear

If optMonthwise.Value = True Or optDatewise.Value = True Or optPatientwise.Value = True Then
    If optMonthwise.Value = True Then
        clsListStru.AddFields mExpr:="IblYrMonth", mAttrib:=cFAT_SYSTEM
        clsListStru.AddFields mExpr:="IblMnYear", mTitle:="Month", mShowItem:=True, mAlign:=1, mWidth:=2000
        clsListStru.AddFields mExpr:="IblCount", mTitle:="Count", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IblAmtAftDisc_sum", mTitle:="Charges", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IblBalAmt_sum", mTitle:="Due Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IblAdvAmt_sum", mTitle:="Adv.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IblDpogAmt_sum", mTitle:="Ipd Depo.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IblDepoAmt_sum", mTitle:="Bill Depo.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IblRfugAmt_sum", mTitle:="Ipd Refu.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IblRefuAmt_sum", mTitle:="Bill Refu.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IblDiscAmt_sum", mTitle:="Discount", mShowItem:=True, mAlign:=7, mWidth:=1500
        
        datRecset.open "Select format(IbhDate,'yyyy/MM') as IblYrMonth" _
         & ",Count(IbhCode) as IblCount" _
         & ",Sum(IbhAmtAftDisc) as IblAmtAftDisc_sum" _
         & ",Sum(IbhBalAmt) as IblBalAmt_sum" _
         & ",Sum(IbhAdvAmt) as IblAdvAmt_sum" _
         & ",Sum(IbhDpogAmt) as IblDpogAmt_sum" _
         & ",Sum(IbhDepoAmt) as IblDepoAmt_sum" _
         & ",Sum(IbhRfugAmt) as IblRfugAmt_sum" _
         & ",Sum(IbhRefuAmt) as IblRefuAmt_sum" _
         & ",Sum(IbhDiscAmt) as IblDiscAmt_sum" _
         & " from IndrBlHdr" _
         & " where IbhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and IbhCode>0" _
         & IIf(mQryPttCode > 0, " and IbhPttCode=" & CStr(mQryPttCode), "") _
         & " group by format(IbhDate,'yyyy/MM')" _
         & " order by format(IbhDate,'yyyy/MM')" _
         , dbHmsDatabase, adOpenKeyset, adLockReadOnly

    ElseIf optDatewise.Value = True Then
        clsListStru.AddFields mExpr:="IblDateYMD", mAttrib:=cFAT_SYSTEM
        clsListStru.AddFields mExpr:="IblDate", mTitle:="Date", mShowItem:=True, mAlign:=1, mWidth:=2000
        clsListStru.AddFields mExpr:="IblCount", mTitle:="Count", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IblAmtAftDisc_sum", mTitle:="Charges", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IblBalAmt_sum", mTitle:="Due Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IblAdvAmt_sum", mTitle:="Adv.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IblDpogAmt_sum", mTitle:="Ipd Depo.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IblDepoAmt_sum", mTitle:="Bill Depo.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IblRfugAmt_sum", mTitle:="Ipd Refu.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IblRefuAmt_sum", mTitle:="Bill Refu.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IblDiscAmt_sum", mTitle:="Discount", mShowItem:=True, mAlign:=7, mWidth:=1500
        
        datRecset.open "Select IbhDate" _
         & ",Count(IbhCode) as IblCount" _
         & ",Sum(IbhAmtAftDisc) as IblAmtAftDisc_sum" _
         & ",Sum(IbhBalAmt) as IblBalAmt_sum" _
         & ",Sum(IbhAdvAmt) as IblAdvAmt_sum" _
         & ",Sum(IbhDpogAmt) as IblDpogAmt_sum" _
         & ",Sum(IbhDepoAmt) as IblDepoAmt_sum" _
         & ",Sum(IbhRfugAmt) as IblRfugAmt_sum" _
         & ",Sum(IbhRefuAmt) as IblRefuAmt_sum" _
         & ",Sum(IbhDiscAmt) as IblDiscAmt_sum" _
         & " from IndrBlHdr" _
         & " where IbhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and IbhCode>0" _
         & IIf(mQryPttCode > 0, " and IbhPttCode=" & CStr(mQryPttCode), "") _
         & " group by IbhDate" _
         & " order by IbhDate" _
         , dbHmsDatabase, adOpenKeyset, adLockReadOnly
        
    ElseIf optPatientwise.Value = True Then
        clsListStru.AddFields mExpr:="PttName", mTitle:="Patient Name", mShowItem:=True, mAlign:=1, mWidth:=3000
        clsListStru.AddFields mExpr:="PttRegNo", mTitle:="Reg.No", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="PttRefName", mTitle:="Care of", mShowItem:=True, mAlign:=1, mWidth:=2000
        clsListStru.AddFields mExpr:="IblCount", mTitle:="Count", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IblAmtAftDisc_sum", mTitle:="Charges", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IblBalAmt_sum", mTitle:="Due Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IblAdvAmt_sum", mTitle:="Adv.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IblDpogAmt_sum", mTitle:="Ipd Depo.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IblDepoAmt_sum", mTitle:="Bill Depo.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IblRfugAmt_sum", mTitle:="Ipd Refu.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IblRefuAmt_sum", mTitle:="Bill Refu.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IblDiscAmt_sum", mTitle:="Discount", mShowItem:=True, mAlign:=7, mWidth:=1500
        
        datRecset.open "Select PatMast.PttName,PatMast.PttRegNo,IndrBlHdr.IbhPttCode" _
         & ",Count(IbhCode) as IblCount" _
         & ",Sum(IbhAmtAftDisc) as IblAmtAftDisc_sum" _
         & ",Sum(IbhBalAmt) as IblBalAmt_sum" _
         & ",Sum(IbhAdvAmt) as IblAdvAmt_sum" _
         & ",Sum(IbhDpogAmt) as IblDpogAmt_sum" _
         & ",Sum(IbhDepoAmt) as IblDepoAmt_sum" _
         & ",Sum(IbhRfugAmt) as IblRfugAmt_sum" _
         & ",Sum(IbhRefuAmt) as IblRefuAmt_sum" _
         & ",Sum(IbhDiscAmt) as IblDiscAmt_sum" _
         & " from IndrBlHdr inner join PatMast on IndrBlHdr.IbhPttCode=PatMast.PttCode" _
         & " where IbhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and IbhCode>0" _
         & IIf(mQryPttCode > 0, " and IbhPttCode=" & CStr(mQryPttCode), "") _
         & " group by PatMast.PttName,PatMast.PttRegNo,IndrBlHdr.IbhPttCode" _
         & " order by PatMast.PttName,PatMast.PttRegNo,IndrBlHdr.IbhPttCode" _
         , dbHmsDatabase, adOpenKeyset, adLockReadOnly
    End If
    
ElseIf optDetailed.Value = True Then
    clsListStru.AddFields mExpr:="tIblSmryId", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="IblCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="VtmName", mTitle:="Voucher", mAlign:=1, mWidth:=1500, mShowItem:=True
    clsListStru.AddFields mExpr:="IblVchNo", mTitle:="Vchr.No", mAlign:=7, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="IblDate", mTitle:="Date", mAlign:=1, mWidth:=1250, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="PttCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="PttName", mTitle:="Patient Name", mAlign:=1, mWidth:=2500, mShowItem:=True
    clsListStru.AddFields mExpr:="PttRegNo", mTitle:="Reg.No", mAlign:=7, mWidth:=1250, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="IblAmtAftDisc", mTitle:="Charges", mAlign:=7, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="IblBalAmt", mTitle:="Due Amt", mAlign:=7, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="IblAdvAmt", mTitle:="Adv.Amt", mAlign:=7, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="IblDpogAmt", mTitle:="Ipd Depo.Amt", mAlign:=7, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="IblDepoAmt", mTitle:="Bill Depo.Amt", mAlign:=7, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="IblRfugAmt", mTitle:="Ipd Refu.Amt", mAlign:=7, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="IblRefuAmt", mTitle:="Bill Refu.Amt", mAlign:=7, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="IblDiscAmt", mTitle:="Discount", mAlign:=7, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="PttRefName", mTitle:="Care of", mAlign:=1, mWidth:=2000, mShowItem:=True
    clsListStru.AddFields mExpr:="PttAddr", mTitle:="Address", mAlign:=1, mWidth:=2000, mShowItem:=True
    clsListStru.AddFields mExpr:="PatAraName", mTitle:="Area", mAlign:=1, mWidth:=1500, mShowItem:=True
    clsListStru.AddFields mExpr:="PatStnName", mTitle:="Station", mAlign:=1, mWidth:=1500, mShowItem:=True
    clsListStru.AddFields mExpr:="PatPcgName", mTitle:="Category", mAlign:=1, mWidth:=2000, mShowItem:=True
    
    datRecset.open "Select IndrBlHdr.*,PatMast.*,PatCatgMst.PcgName,AreaMast.AraName,StsnMast.StnName,VTypMast.VtmName" _
     & ",format(IbhDate,'yyyymmdd')+format(IbhCode,'0000000') as tIblSmryId" _
     & " from (IndrBlHdr inner join (((PatMast" _
     & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
     & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode)" _
     & " inner join PatCatgMst on PatMast.PttPcgCode = PatCatgMst.PcgCode)" _
     & " on IndrBlHdr.IbhPttCode = PatMast.PttCode)" _
     & " inner join VTypMast on IndrBlHdr.IbhVtmCode = VTypMast.VtmCode" _
     & " where IbhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & IIf(mRemoteAccess = True, " and IbhCode=" & CStr(mIblCode) & "", "") _
     & " and IbhCode>0" _
     & IIf(mQryPttCode > 0, " and IbhPttCode=" & CStr(mQryPttCode), "") _
     & " order by IbhDate,IbhCode" _
     , dbComDatabase, adOpenKeyset, adLockReadOnly
    
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
Rem MoveRecToFirst datRecset
Set tRecset = datRecset.ActiveConnection.Execute(datRecset.Source)
With tRecset
If .EOF = False Then
    Do While .EOF = False
        If optMonthwise.Value = True Or optDatewise.Value = True Or optPatientwise.Value = True Then
            If optMonthwise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IblYrMonth")) = .fields("IblYrMonth")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IblMnYear")) = MonthName(Val(Right(.fields("IblYrMonth"), 2))) & "-" & Left(.fields("IblYrMonth"), 4)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IblCount")) = ToMyNumFmt(.fields("IblCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IblAmtAftDisc_sum")) = ToMyNumFmt(.fields("IblAmtAftDisc_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IblBalAmt_sum")) = ToMyNumFmt(.fields("IblBalAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IblAdvAmt_sum")) = ToMyNumFmt(.fields("IblAdvAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IblDpogAmt_sum")) = ToMyNumFmt(.fields("IblDpogAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IblDepoAmt_sum")) = ToMyNumFmt(.fields("IblDepoAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IblRfugAmt_sum")) = ToMyNumFmt(.fields("IblRfugAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IblRefuAmt_sum")) = ToMyNumFmt(.fields("IblRefuAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IblDiscAmt_sum")) = ToMyNumFmt(.fields("IblDiscAmt_sum"))
                
            ElseIf optDatewise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IblDateYMD")) = Format(.fields("IbhDate"), "yyyymmdd")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IblDate")) = Dtoc(.fields("IbhDate"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IblCount")) = ToMyNumFmt(.fields("IblCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IblAmtAftDisc_sum")) = ToMyNumFmt(.fields("IblAmtAftDisc_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IblBalAmt_sum")) = ToMyNumFmt(.fields("IblBalAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IblAdvAmt_sum")) = ToMyNumFmt(.fields("IblAdvAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IblDpogAmt_sum")) = ToMyNumFmt(.fields("IblDpogAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IblDepoAmt_sum")) = ToMyNumFmt(.fields("IblDepoAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IblRfugAmt_sum")) = ToMyNumFmt(.fields("IblRfugAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IblRefuAmt_sum")) = ToMyNumFmt(.fields("IblRefuAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IblDiscAmt_sum")) = ToMyNumFmt(.fields("IblDiscAmt_sum"))
                
            ElseIf optPatientwise.Value = True Then
                clsPAT.GetData .fields("IbhPttCode")
                
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttName")) = .fields("PttName")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttRegNo")) = ToMyNumFmt(.fields("PttRegNo"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttRefName")) = clsPAT.mPttRefName_str
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IblCount")) = ToMyNumFmt(.fields("IblCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IblAmtAftDisc_sum")) = ToMyNumFmt(.fields("IblAmtAftDisc_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IblBalAmt_sum")) = ToMyNumFmt(.fields("IblBalAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IblAdvAmt_sum")) = ToMyNumFmt(.fields("IblAdvAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IblDpogAmt_sum")) = ToMyNumFmt(.fields("IblDpogAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IblDepoAmt_sum")) = ToMyNumFmt(.fields("IblDepoAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IblRfugAmt_sum")) = ToMyNumFmt(.fields("IblRfugAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IblRefuAmt_sum")) = ToMyNumFmt(.fields("IblRefuAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IblDiscAmt_sum")) = ToMyNumFmt(.fields("IblDiscAmt_sum"))
                
            End If
        
        ElseIf optDetailed.Value = True Then
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("tIblSmryId")) = Format(.fields("IbhDate"), "yyyymmdd") & Format(.fields("IbhCode"), "0000000")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IblCode")) = .fields("IbhCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("VtmName")) = .fields("VtmName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IblVchNo")) = .fields("IbhVchNo")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IblDate")) = Dtoc(.fields("IbhDate"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IblAmtAftDisc")) = ToMyNumFmt(.fields("IbhAmtAftDisc"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IblBalAmt")) = ToMyNumFmt(.fields("IbhBalAmt"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IblAdvAmt")) = ToMyNumFmt(.fields("IbhAdvAmt"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IblDpogAmt")) = ToMyNumFmt(.fields("IbhDpogAmt"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IblDepoAmt")) = ToMyNumFmt(.fields("IbhDepoAmt"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IblRfugAmt")) = ToMyNumFmt(.fields("IbhRfugAmt"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IblRefuAmt")) = ToMyNumFmt(.fields("IbhRefuAmt"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IblDiscAmt")) = ToMyNumFmt(.fields("IbhDiscAmt"))
            ' ------------------------------------
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttCode")) = .fields("PttCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttName")) = .fields("PttName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttRegNo")) = .fields("PttRegNo")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttRefName")) = .fields("PttRefName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttAddr")) = .fields("PttAddr")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PatAraName")) = .fields("AraName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PatStnName")) = .fields("StnName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PatPcgName")) = .fields("PcgName")
        
        End If
        
        srow = srow + 1
        If Mfgrd1.Rows < srow + 1 Then
            Mfgrd1.Rows = Mfgrd1.Rows + 1
        End If
        
        .MoveNext
    Loop
End If
End With
CloseTable tRecset

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
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("tIblSmryId"), mText
    ElseIf optMonthwise.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("IblYrMonth"), mText
    ElseIf optDatewise.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("IblDateYMD"), mText
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
        Call ChkPttNameListFirstTime
        
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

Private Sub ChkPttNameListFirstTime()
If fcmbPttName.LRecordCount = 0 Then
    fcmbPttName.mFiltCond = ""
    fcmbPttName.ReInit
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

Private Sub txtSdcFlag_KeyPress(KeyAscii As Integer)
If KeyAscii = vbKeyReturn And Val(fcmbSrvName.BoundText) > 0 And mIblPttCode > 0 And mIblIpgCode > 0 Then
    clsSRV.GetData Val(fcmbSrvName.BoundText)
    If clsSRV.mSrvMultiDctIncl_bln = True Then
        ShowSdcDtlData mIblCode, Val(mskIblICode.Text)
        ShowSdcEntryMode True
        Mfgrd3.SetFocus
    End If
End If

End Sub

Private Sub txtSDctName_Change()
If fcmbSDctName.CallFromText_Change = False Then
    fcmbSDctName.CallFromText_Change = True
    If InterActiveChange(txtSDctName) = True Then
        fcmbSDctName.UserText = Array(txtSDctName.Text, txtSDctName.SelStart)
        fcmbSDctName.Show
        txtSDctName.Text = fcmbSDctName.Text
        If fcmbSDctName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbSDctName.CallFromText_Change = False
End If

End Sub

Private Sub txtSDctName_GotFocus()
FlashActiveControl txtSDctName, True
End Sub

Private Sub txtSDctName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtSDctName_Change
End If

End Sub

Private Sub txtSDctName_LostFocus()
FlashActiveControl txtSDctName, False
End Sub

Private Sub txtSDctName_Validate(Cancel As Boolean)
If Val(fcmbSDctName.BoundText) <= 0 Then
    ErrorBox "Invalid Selection !!!"
    txtSDctName.SetFocus
    Cancel = True
Else
    If Val(fcmbSDctName.BoundText) <> mSdcDctCode_old Then
        fcmbDrlName.BoundText = CStr(GetValueFromTableCol(cnn:=dbHmsDatabase, mTableName:="DoctMast", mColumnName:="DctDrlCode", mFilterCond:="DctCode = " & CStr(Val(fcmbSDctName.BoundText)), mRtnDefValue:=0))
        txtDrlName.Text = fcmbDrlName.Text
    End If

End If
Call ValidSdcDtl

End Sub

Private Sub txtSearch1Text_GotFocus()
FlashActiveControl txtSearch1Text, True
End Sub

Private Sub txtSearch1Text_LostFocus()
FlashActiveControl txtSearch1Text, False
End Sub

Private Sub txtSrvName_Change()
If fcmbSrvName.CallFromText_Change = False Then
    fcmbSrvName.CallFromText_Change = True
    If InterActiveChange(txtSrvName) = True Then
        fcmbSrvName.UserText = Array(txtSrvName.Text, txtSrvName.SelStart)
        fcmbSrvName.Show
        txtSrvName.Text = fcmbSrvName.Text
        If fcmbSrvName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbSrvName.CallFromText_Change = False
End If

End Sub

Private Sub txtSrvName_GotFocus()
FlashActiveControl txtSrvName, True
End Sub

Private Sub txtSrvName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtSrvName_Change
End If

End Sub

Private Sub txtSrvName_LostFocus()
FlashActiveControl txtSrvName, False
End Sub

Private Sub txtSrvName_Validate(Cancel As Boolean)
If Val(fcmbSrvName.BoundText) <= 0 Then
    If InterActiveChange(txtSrvName) = True Then
        ErrorBox "Invalid Selection !!!"
        txtSrvName.SetFocus
        Cancel = True
    End If
Else
    If Val(fcmbSrvName.BoundText) <> mIblSrvCode_old Or dtlAddMode = True Then
        If dtlAddMode = False And Val(fcmbSrvName.BoundText) <> mIblSrvCode_old And Val(mskIbbsIbsCode.Text) > 0 Then
            AlertBox "De-Linking Bed Charges Automation !!!"
        End If
        
        Call ChkServRate
        Call CalcIblChg
        Call ChkIblICode
    End If
    Call ValidDtl
End If

End Sub

Private Sub ChkIblICode()
If mIblCode <> 0 And mIblPttCode <> 0 And mIblIpgCode <> 0 Then
    If dtlAddMode = True And Val(fcmbSrvName.BoundText) > 0 And Val(fcmbSrvName.BoundText) <> mIblSrvCode_old Then          ''' And Val(mskIblICode.Text) = 0
        Rem mskIblICode.Text = clsIBL.GetDtlTranUnqCode()
        
        clsSRV.GetData Val(fcmbSrvName.BoundText)
        If clsSRV.mSrvMultiDctIncl_bln = True Then
            txtSdcFlag.Text = "N"
        End If
    End If
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

Private Sub ChkServRate()
Dim mIblRate As Double, mIblDiscPer As Double, mIblInfByPer As Double, mIblDefByPer As Double

clsIPG.GetData Val(UnMyNumFmt(mskIblIpgCode.Text))
clsPAT.GetData clsIPG.mIpgPttCode_lng
If Val(fcmbSrvName.BoundText) <> mIblSrvCode_old Or mIpgCDctCode_old <> clsIPG.mIpgCDctCode_lng Or mPttPcgCode_old <> clsPAT.mPttPcgCode_lng Or mIpgRByCode_old <> clsIPG.mIpgRByCode_lng Or mIpgRToCode_old <> clsIPG.mIpgRToCode_lng Or mIblDate_old <> Ctod(dtpIblDate.Text) Or mIblTime_old <> TimeToMin(txtIblTime_str) Or FormAddEditMode = cFORM_ADDMODE Then
    GetServRateValues cnn:=dbHmsDatabase, mSrvCode:=Val(fcmbSrvName.BoundText), mTranDate:=Ctod(dtpIblDate.Text), mTranTime:=TimeToMin(txtIblTime_str.Text), mSrmPttCode:=mIblPttCode, mSrmDctCode:=clsIPG.mIpgCDctCode_lng, mSrmPcgCode:=clsPAT.mPttPcgCode_lng, mSrmRByCode:=clsIPG.mIpgRByCode_lng, mSrmRToCode:=0, mSrmRate:=mIblRate, mSrmDiscPer:=mIblDiscPer, mSrmInfByPer:=mIblInfByPer, mSrmDefByPer:=mIblDefByPer
'    If mIblDiscPer = 0 And clsPAT.mPttDiscAllowed_bln = True Then
'        mIblDiscPer = clsPAT.mPttDiscPer_dbl
'    End If
    If mIblDiscPer = 0 And Val(UnMyPerFmt(mskIblPttDiscPer.Text)) <> 0 Then
        mIblDiscPer = Val(UnMyPerFmt(mskIblPttDiscPer.Text))
    End If
    If mIblInfByPer <> 0 Then
         mIblRate = mIblRate + (mIblRate * mIblInfByPer / 100)
    ElseIf mIblDefByPer <> 0 Then
        mIblRate = mIblRate - (mIblRate * mIblDefByPer / 100)
    End If
    mskIblRate.Text = ToMyNumFmt(mIblRate)
    mskIblDiscPer.Text = ToMyPerFmt(mIblDiscPer)
End If

End Sub

Private Sub ChkBedRate(ByVal mBdmCode As Long)
Dim mIblRate As Double, mIblDiscPer As Double, mIblInfByPer As Double, mIblDefByPer As Double

clsIPG.GetData Val(UnMyNumFmt(mskIblIpgCode.Text))
clsPAT.GetData clsIPG.mIpgPttCode_lng
If mIpgCDctCode_old <> clsIPG.mIpgCDctCode_lng Or mPttPcgCode_old <> clsPAT.mPttPcgCode_lng Or mIpgRByCode_old <> clsIPG.mIpgRByCode_lng Or mIpgRToCode_old <> clsIPG.mIpgRToCode_lng Or mIblDate_old <> Ctod(dtpIblDate.Text) Or mIblTime_old <> TimeToMin(txtIblTime_str) Or FormAddEditMode = cFORM_ADDMODE Or dtlAddMode = True Then
    GetBedRateValues cnn:=dbHmsDatabase, mBdmCode:=mBdmCode, mTranDate:=Ctod(dtpIblDate.Text), mTranTime:=TimeToMin(txtIblTime_str.Text), mSrmPttCode:=mIblPttCode, mSrmDctCode:=clsIPG.mIpgCDctCode_lng, mSrmPcgCode:=clsPAT.mPttPcgCode_lng, mSrmRByCode:=clsIPG.mIpgRByCode_lng, mSrmRToCode:=0, mSrmRate:=mIblRate, mSrmDiscPer:=mIblDiscPer, mSrmInfByPer:=mIblInfByPer, mSrmDefByPer:=mIblDefByPer
'    If mIblDiscPer = 0 And clsPAT.mPttDiscAllowed_bln = True Then
'        mIblDiscPer = clsPAT.mPttDiscPer_dbl
'    End If
    If mIblDiscPer = 0 And Val(UnMyPerFmt(mskIblPttDiscPer.Text)) <> 0 Then
        mIblDiscPer = Val(UnMyPerFmt(mskIblPttDiscPer.Text))
    End If
    If mIblInfByPer <> 0 Then
         mIblRate = mIblRate + (mIblRate * mIblInfByPer / 100)
    ElseIf mIblDefByPer <> 0 Then
        mIblRate = mIblRate - (mIblRate * mIblDefByPer / 100)
    End If
    mskIblRate.Text = ToMyNumFmt(mIblRate)
    mskIblDiscPer.Text = ToMyPerFmt(mIblDiscPer)
End If

End Sub

Private Sub CalcIblChg()
Dim mIblUnit As Long, mIblRate As Double, mIblAmtBefDisc As Double, mIblDiscPer As Double, mIblDiscAmt As Double, mIblAmtAftDisc As Double

mIblUnit = Val(UnMyNumFmt(mskIblUnit.Text))
mIblRate = Val(UnMyNumFmt(mskIblRate.Text))
mIblAmtBefDisc = mIblUnit * mIblRate
mIblDiscPer = Val(UnMyPerFmt(mskIblDiscPer.Text))
mIblDiscAmt = Val(UnMyNumFmt(mskIblDiscAmt.Text))
If mskIblDiscPer.Tag = True Then
    mIblDiscAmt = Round(mIblAmtBefDisc * mIblDiscPer / 100, 2)
ElseIf mskIblDiscAmt.Tag = True Then
    If mIblDiscAmt <> 0 And mIblAmtBefDisc <> 0 Then
        mIblDiscPer = Round(mIblDiscAmt * 100 / mIblAmtBefDisc, 2)
    Else
        mIblDiscPer = 0
    End If
ElseIf dtlAddMode = True Then
    mIblDiscAmt = Round(mIblAmtBefDisc * mIblDiscPer / 100, 2)
End If
mIblAmtAftDisc = mIblAmtBefDisc - mIblDiscAmt
' --------
mskIblAmtBefDisc.Text = ToMyNumFmt(mIblAmtBefDisc)
mskIblDiscPer.Text = ToMyPerFmt(mIblDiscPer)
mskIblDiscAmt.Text = ToMyNumFmt(mIblDiscAmt)
mskIblAmtAftDisc.Text = ToMyNumFmt(mIblAmtAftDisc)

End Sub

Private Sub ShowOldIblCodeDesc(ByVal mOldIblCode As Long)
Dim tRecset As New ADODB.Recordset

With tRecset
.open "Select * from IndrBlHdr where IbhCode=" & CStr(mOldIblCode) & "", dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    clsVTM.GetData .fields("IbhVtmCode")
    lblOldIblCodeDesc.Caption = RTrim(clsVTM.mName_str) & " No.:" & CStr(.fields("IbhVchNo")) & " Dated:" & Dtoc(.fields("IbhDate"))
Else
    lblOldIblCodeDesc.Caption = "#" & CStr(mOldIblCode) & "#"
End If
End With
CloseTable tRecset

End Sub

Private Function GetOldIblCodeFromPttCode(ByVal mPttCode As Long) As Long
Dim tRecset As New ADODB.Recordset

With tRecset
.open "Select top 1 * from IndrBlHdr where IbhPttCode=" & CStr(mPttCode) & " order by IbhDate desc,IbhVchNo desc,IbhCode desc", dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    GetOldIblCodeFromPttCode = .fields("IbhCode")
Else
    GetOldIblCodeFromPttCode = 0
End If
End With
CloseTable tRecset

End Function

Private Function GetOldIpgCodeFromPttCode(ByVal mPttCode As Long) As Long
Dim tRecset As New ADODB.Recordset

With tRecset
.open "Select top 1 * from IndrReg where IpgPttCode=" & CStr(mPttCode) & " order by IpgDate desc,IpgVchNo desc,IpgCode desc", dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    GetOldIpgCodeFromPttCode = .fields("IpgCode")
Else
    GetOldIpgCodeFromPttCode = 0
End If
End With
CloseTable tRecset

End Function

Private Sub ShowPttDiscPer(ByVal mPttCode As Long)
Dim tRecset As New ADODB.Recordset

With tRecset
.open "Select * from PatMast where PttCode=" & CStr(mPttCode) & "", dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    If .fields("PttDiscAllowed") = True And .fields("PttDiscPer") > 0 Then
        'mskIblPttDiscPer.Text = ToMyPerFmt(.fields("PttDiscPer"))
        'Call CalcIblChg
    End If
End If
End With
CloseTable tRecset

End Sub

Private Sub ShowOldIpgListByIpgNo()
Dim tRecset As New ADODB.Recordset, mOldIpgCode As Long, mOldIpgPttCode As Long

If fcmbAdmIpgByIpgNo.CallFromText_Change = False Then
    fcmbAdmIpgByIpgNo.CallFromText_Change = True
    If InterActiveChange(txtIpgVtmName) = True Then
        If fcmbAdmIpgByIpgNo.LRecordCount = 0 Then
            fcmbAdmIpgByIpgNo.mFiltCond = ""
            fcmbAdmIpgByIpgNo.ReInit
        End If
        
        fcmbAdmIpgByIpgNo.UserText = Array("", 0)
        fcmbAdmIpgByIpgNo.Show
        If fcmbAdmIpgByIpgNo.ListSelected = True And Val(fcmbAdmIpgByIpgNo.BoundText) > 0 Then
            If FormAddEditMode = cFORM_ADDMODE And Mfgrd2.Rows = 2 Then
                mOldIpgCode = Val(fcmbAdmIpgByIpgNo.BoundText)
                tRecset.open "Select * from IndrReg where IpgCode=" & CStr(mOldIpgCode) & "", dbHmsDatabase, adOpenKeyset, adLockOptimistic
                If tRecset.RecordCount > 0 Then
                    mOldIpgPttCode = tRecset.fields("IpgPttCode")
                End If
                CloseTable tRecset
                If mOldIpgCode > 0 And mOldIpgPttCode > 0 Then
                    mIblPttCode = mOldIpgPttCode
                    ShowPatData mIblPttCode
                    Call StorePatOldData
                    ShowPttDiscPer mIblPttCode
                    
                    mIblIpgCode = mOldIpgCode
                    ShowIpgData mIblIpgCode
                    Call StoreIpgOldData
                    
                    mIblOldIblCode = GetOldIblCodeFromPttCode(mIblPttCode)
                    ShowOldIblCodeDesc mIblOldIblCode
                    
                    Call ChkIpdDischState
                End If
            Else
                If FormAddEditMode = cFORM_EDITMODE Then
                    AlertBox "Prohibited in Edit Mode !!!"
                ElseIf Mfgrd2.Rows > 2 Then
                    AlertBox "Prohibited After Entering Service Detail !!!"
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
        If fcmbAdmIpgByPttRegNo.LRecordCount = 0 Then
            fcmbAdmIpgByPttRegNo.mFiltCond = ""
            fcmbAdmIpgByPttRegNo.ReInit
        End If
        
        fcmbAdmIpgByPttRegNo.UserText = Array("", 0)
        fcmbAdmIpgByPttRegNo.Show
        If fcmbAdmIpgByPttRegNo.ListSelected = True And Val(fcmbAdmIpgByPttRegNo.BoundText) > 0 Then
            If FormAddEditMode = cFORM_ADDMODE And Mfgrd2.Rows = 2 Then
                mOldIpgCode = Val(fcmbAdmIpgByPttRegNo.LFieldValue("IpgCode"))
                tRecset.open "Select * from IndrReg where IpgCode=" & CStr(mOldIpgCode) & "", dbHmsDatabase, adOpenKeyset, adLockOptimistic
                If tRecset.RecordCount > 0 Then
                    mOldIpgPttCode = tRecset.fields("IpgPttCode")
                End If
                CloseTable tRecset
                If mOldIpgCode > 0 And mOldIpgPttCode > 0 Then
                    mIblPttCode = mOldIpgPttCode
                    ShowPatData mIblPttCode
                    Call StorePatOldData
                    ShowPttDiscPer mIblPttCode
                    
                    mIblIpgCode = mOldIpgCode
                    ShowIpgData mIblIpgCode
                    Call StoreIpgOldData
                    
                    mIblOldIblCode = GetOldIblCodeFromPttCode(mIblPttCode)
                    ShowOldIblCodeDesc mIblOldIblCode
                    
                    Call ChkIpdDischState
                End If
            Else
                If FormAddEditMode = cFORM_EDITMODE Then
                    AlertBox "Prohibited in Edit Mode !!!"
                ElseIf Mfgrd2.Rows > 2 Then
                    AlertBox "Prohibited After Entering Service Detail !!!"
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
        If fcmbAdmIpgByPttName.LRecordCount = 0 Then
            fcmbAdmIpgByPttName.mFiltCond = ""
            fcmbAdmIpgByPttName.ReInit
        End If
        
        fcmbAdmIpgByPttName.UserText = Array("", 0)
        fcmbAdmIpgByPttName.Show
        If fcmbAdmIpgByPttName.ListSelected = True And Val(fcmbAdmIpgByPttName.BoundText) > 0 Then
            If FormAddEditMode = cFORM_ADDMODE And Mfgrd2.Rows = 2 Then
                mOldIpgCode = Val(fcmbAdmIpgByPttName.LFieldValue("IpgCode"))
                tRecset.open "Select * from IndrReg where IpgCode=" & CStr(mOldIpgCode) & "", dbHmsDatabase, adOpenKeyset, adLockOptimistic
                If tRecset.RecordCount > 0 Then
                    mOldIpgPttCode = tRecset.fields("IpgPttCode")
                End If
                CloseTable tRecset
                If mOldIpgCode > 0 And mOldIpgPttCode > 0 Then
                    mIblPttCode = mOldIpgPttCode
                    ShowPatData mIblPttCode
                    Call StorePatOldData
                    ShowPttDiscPer mIblPttCode
                    
                    mIblIpgCode = mOldIpgCode
                    ShowIpgData mIblIpgCode
                    Call StoreIpgOldData
                    
                    mIblOldIblCode = GetOldIblCodeFromPttCode(mIblPttCode)
                    ShowOldIblCodeDesc mIblOldIblCode
                    
                    Call ChkIpdDischState
                End If
            Else
                If FormAddEditMode = cFORM_EDITMODE Then
                    AlertBox "Prohibited in Edit Mode !!!"
                ElseIf Mfgrd2.Rows > 2 Then
                    AlertBox "Prohibited After Entering Service Detail !!!"
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
    Rem mskIblICode.Top = mRowPos
    mskIblSno.Top = mRowPos
    txtSrvName.Top = mRowPos
    txtIbbsRemark.Top = mRowPos + txtSrvName.Height
    mskIbbsIbsCode.Top = txtIbbsRemark.Top
    dtpIbbsFromDate.Top = txtIbbsRemark.Top
    mskIbbsFromTime.Top = txtIbbsRemark.Top
    dtpIbbsToDate.Top = txtIbbsRemark.Top
    mskIbbsToTime.Top = txtIbbsRemark.Top
    txtSdcFlag.Top = mRowPos
    mskIblUnit.Top = mRowPos
    mskIblRate.Top = mRowPos
    mskIblAmtBefDisc.Top = mRowPos
    mskIblDiscPer.Top = mRowPos
    mskIblDiscAmt.Top = mRowPos
    mskIblAmtAftDisc.Top = mRowPos
    cmdOK.Top = mRowPos
End If

mskIblICode.Text = 0
mskIblSno.Text = 0
txtSrvName.Text = "": fcmbSrvName.BoundText = ""
txtIbbsRemark.Text = ""
mskIbbsIbsCode.Text = ""
dtpIbbsFromDate.Text = Dtoc(cUNKNOWNDATE)
mskIbbsFromTime.Text = MinToTime(0)
dtpIbbsToDate.Text = Dtoc(cUNKNOWNDATE)
mskIbbsToTime.Text = MinToTime(0)
txtSdcFlag.Text = ""
mskIblUnit.Text = ToMyNumFmt(0, mDecimals:=0)
mskIblRate.Text = ToMyNumFmt(0)
mskIblAmtBefDisc.Text = ToMyNumFmt(0)
mskIblDiscPer.Text = ToMyPerFmt(0)
mskIblDiscAmt.Text = ToMyNumFmt(0)
mskIblAmtAftDisc.Text = ToMyNumFmt(0)

Call ValidDtl

mskIblICode.Visible = False     '''  mShowItem
mskIblSno.Visible = mShowItem
txtSrvName.Visible = mShowItem
txtIbbsRemark.Visible = False   ''' mShowItem
mskIbbsIbsCode.Visible = False   ''' mShowItem
dtpIbbsFromDate.Visible = False   ''' mShowItem
mskIbbsFromTime.Visible = False   ''' mShowItem
dtpIbbsToDate.Visible = False   ''' mShowItem
mskIbbsToTime.Visible = False   ''' mShowItem
txtSdcFlag.Visible = mShowItem
mskIblUnit.Visible = mShowItem
mskIblRate.Visible = mShowItem
mskIblAmtBefDisc.Visible = mShowItem
mskIblDiscPer.Visible = mShowItem
mskIblDiscAmt.Visible = mShowItem
mskIblAmtAftDisc.Visible = mShowItem
cmdOK.Visible = mShowItem

frHeader.Enabled = (mShowItem = False)
Mfgrd2.Enabled = (mShowItem = False)
frFooter.Enabled = (mShowItem = False)
cmdSaveForm.Enabled = (mShowItem = False)

End Sub

Private Sub ValidDtl()
Dim mDataOk As Boolean, srow As Integer

srow = Mfgrd2.Row
mDataOk = (mIblPttCode > 0 And mIblIpgCode > 0 And frSdcDtl.Visible = False And mIpdDischState = cIBS_STATE_OCCUPIED And Val(UnMyNumFmt(mskIblSno.Text)) > 0 And Val(fcmbSrvName.BoundText) > 0 And Val(UnMyNumFmt(mskIblUnit.Text)) > 0 And Val(UnMyNumFmt(mskIblRate.Text)) > 0 And Val(UnMyNumFmt(mskIblAmtBefDisc.Text)) > 0 And Val(UnMyNumFmt(mskIblAmtAftDisc.Text)) >= 0)
If dtlAddEditMode = True And dtlAddMode = False And mDataOk = True And InterActiveChange(cmdOK) = True Then
    clsSRV.GetData Val(fcmbSrvName.BoundText)
    If clsSRV.mSrvMultiDctIncl_bln = False Then
        If GetServDctDtlCount(cnn:=dbHmsDatabase, mTableName:="IndrBlDctDtl", mSdcCodeField:="IbdCode", mSdcCode:=mIblCode, mSdcSubCodeField:="IbdIblCode", mSdcSubCode:=Val(mskIblICode.Text)) > 0 Then
            ErrorBox "Service Doctor Detail Exist !!!"
            mDataOk = False
        End If
    End If
End If
cmdOK.Caption = IIf(mDataOk = True, "&OK", "&Cancel")
cmdOK.BackColor = IIf(mDataOk = True, &H80FF80, &H8080FF)
End Sub

Private Sub CalcFtrTotal(Optional ByVal mCalcBalOnly As Boolean = False)
Dim mIblUnitTot As Double, mIblAmtBefDiscTot As Double, mIblDiscAmtTot As Double, mIblAmtAftDiscTot As Double, mIblAdvAmt As Double, mIblDpogAmtTot As Double, mIblDepoAmtTot As Double, mIblRfugAmtTot As Double, mIblRefuAmtTot As Double, mIblBalAmtTot As Double

If mCalcBalOnly = False Then
    mIblUnitTot = FlexColSum(Mfgrd2, X2IBLUNIT_COL)
    mIblAmtBefDiscTot = FlexColSum(Mfgrd2, X2IBLAMTBEFDISC_COL)
    mIblDiscAmtTot = FlexColSum(Mfgrd2, X2IBLDISCAMT_COL)
    mIblAmtAftDiscTot = FlexColSum(Mfgrd2, X2IBLAMTAFTDISC_COL)
Else
    mIblUnitTot = Val(UnMyNumFmt(lblIblUnitTot.Caption))
    mIblAmtBefDiscTot = Val(UnMyNumFmt(lblIblAmtBefDiscTot.Caption))
    mIblDiscAmtTot = Val(UnMyNumFmt(lblIblDiscAmtTot.Caption))
    mIblAmtAftDiscTot = Val(UnMyNumFmt(lblIblAmtAftDiscTot.Caption))
End If

mIblAdvAmt = Val(UnMyNumFmt(mskIblAdvAmt.Text))
mIblDpogAmtTot = Val(UnMyNumFmt(mskIblDpogAmtTot.Text))
mIblDepoAmtTot = Val(UnMyNumFmt(mskIblDepoAmtTot.Text))
mIblRfugAmtTot = Val(UnMyNumFmt(mskIblRfugAmtTot.Text))
mIblRefuAmtTot = Val(UnMyNumFmt(mskIblRefuAmtTot.Text))

mIblBalAmtTot = (mIblAmtAftDiscTot - (mIblAdvAmt + mIblDpogAmtTot + mIblDepoAmtTot) + mIblRfugAmtTot + mIblRefuAmtTot)
If mCalcBalOnly = False Then
    lblIblUnitTot.Caption = ToMyNumFmt(mIblUnitTot, mDecimals:=0)
    lblIblAmtBefDiscTot.Caption = ToMyNumFmt(mIblAmtBefDiscTot)
    lblIblDiscAmtTot.Caption = ToMyNumFmt(mIblDiscAmtTot)
    lblIblAmtAftDiscTot.Caption = ToMyNumFmt(mIblAmtAftDiscTot)
End If
mskIblBalAmtTot.Text = ToMyNumFmt(mIblBalAmtTot)

End Sub

Private Sub ShowLinkTranDtl()
Dim tRecset As New ADODB.Recordset, mLinkTranStr As String

With tRecset
.open "Select IndrBlPymtDtl.*,IndrBlPymtHdr.IbphVtmCode,IndrBlPymtHdr.IbphVchNo from IndrBlPymtDtl inner join IndrBlPymtHdr on IndrBlPymtDtl.IbpyCode=IndrBlPymtHdr.IbphCode where IbpyIbhCode=" & CStr(mIblCode) & " order by IbpyDate", dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Do While .EOF = False
        clsVTM.GetData .fields("IbphVtmCode")
        mLinkTranStr = mLinkTranStr & clsVTM.mName_str & " No." & CStr(.fields("IbphVchNo")) & " Dated " & Dtoc(.fields("IbpyDate")) & " Rs." & ToMyNumFmt(.fields("IbpyDepoAmt")) & vbCrLf
        
        .MoveNext
    Loop
End If
End With
CloseTable tRecset

With tRecset
.open "Select IndrBlRefdDtl.*,IndrBlRefdHdr.IbfhVtmCode,IndrBlRefdHdr.IbfhVchNo from IndrBlRefdDtl inner join IndrBlRefdHdr on IndrBlRefdDtl.IbfdCode=IndrBlRefdHdr.IbfhCode where IbfdIbhCode=" & CStr(mIblCode) & " order by IbfdDate", dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Do While .EOF = False
        clsVTM.GetData .fields("IbfhVtmCode")
        mLinkTranStr = mLinkTranStr & clsVTM.mName_str & " No." & CStr(.fields("IbfhVchNo")) & " Dated " & Dtoc(.fields("IbfdDate")) & " Rs." & ToMyNumFmt(.fields("IbfdRefuAmt")) & vbCrLf
        
        .MoveNext
    Loop
End If
End With
CloseTable tRecset

lblLinkTranDesc.Caption = mLinkTranStr

End Sub

Private Sub ChkIpdDischState()
Dim tRecset As New ADODB.Recordset

mIpdDischState = GetIpdDischState(cnn:=dbHmsDatabase, mIpgCode:=mIblIpgCode)

dtpIbsDischDate.Enabled = True
txtIbsDischTime.Enabled = True
cmbIbsDischState.Enabled = True
txtIbsRemark.Enabled = True
If mIpdDischState <> cIBS_STATE_OCCUPIED Then
    If mIblIpgCode <> 0 Then
        AlertBox "Patient Discharged / Any Discharge State !!!"
    End If
    dtpIbsDischDate.Enabled = False
    txtIbsDischTime.Enabled = False
    cmbIbsDischState.Enabled = False
    txtIbsRemark.Enabled = False
End If

End Sub

' ======================================================================================================
Private Sub Mfgrd3_DblClick()
Mfgrd3_KeyPress vbKeyReturn
End Sub

Private Sub Mfgrd3_GotFocus()
Mfgrd3.Col = FlexLeftVisibleCol(Mfgrd3)
Mfgrd3.LeftCol = FlexLeftVisibleCol(Mfgrd3)
If Mfgrd3.SelectionMode = flexSelectionByRow Then
    Mfgrd3.ColSel = 0: Mfgrd3.ColSel = Mfgrd3.Cols - 1
End If

Rem Call Mfgrd3_RowColChange
End Sub

Private Sub Mfgrd3_KeyDown(KeyCode As Integer, Shift As Integer)
Dim srow As Integer, mIbdICode As Long, mIbdIblCode As Long, mDeleteit As Boolean
srow = Mfgrd3.Row
mIbdICode = Val(Mfgrd3.TextMatrix(srow, X3IBDICODE_COL))
mIbdIblCode = Val(Mfgrd2.TextMatrix(Mfgrd2.Row, X2IBLICODE_COL))

If MyDeleteKey(Shift, KeyCode, mCheckCtrlMask:=False) = True And mIbdICode > 0 Then
    mDeleteit = True
    If mDeleteit = True Then
        mDeleteit = CanDelete()
    End If
    If mDeleteit = True Then
        clsIBL.DeleteSdc mIblCode, mIbdIblCode, mIbdICode
        
        ShowSdcDtlData mIblCode, mIbdIblCode
        Mfgrd3.Row = srow
        Mfgrd3.SetFocus
        Call Mfgrd3_RowColChange
    End If
End If

End Sub

Private Sub Mfgrd3_KeyPress(KeyAscii As Integer)
Dim srow As Integer

If KeyAscii = vbKeyReturn Then
    srow = Mfgrd3.Row
    
    dtlSdcAddEditMode = True
    dtlSdcAddMode = IsFlexNewRow(Mfgrd3, srow)
    VisibleSdcControls True, Mfgrd3.Top + Mfgrd3.RowPos(Mfgrd3.Row)
    If dtlSdcAddMode = True Then
        mskIbdSno.Text = ToMyNumFmt(FlexNextSeqno(Mfgrd3, X3IBDSNO_COL), mDecimals:=0)
    Else
        mskIbdSno.Text = Mfgrd3.TextMatrix(srow, X3IBDSNO_COL)
        fcmbSDctName.BoundText = Mfgrd3.TextMatrix(srow, X3IBDDCTCODE_COL): txtSDctName.Text = fcmbSDctName.Text
        fcmbDrlName.BoundText = Mfgrd3.TextMatrix(srow, X3IBDDRLCODE_COL): txtDrlName.Text = fcmbDrlName.Text
        txtIbdRemark.Text = Mfgrd3.TextMatrix(srow, X3IBDREMARK_COL)
    End If
    txtSDctName.SetFocus
    Call ValidSdcDtl
    
End If

End Sub

Private Sub Mfgrd3_RowColChange()
ShowActiveFlexRow Mfgrd3
End Sub

Private Sub VisibleSdcControls(ByVal mShowItem As Boolean, Optional ByVal mRowPos)
Rem Important - dtlSdcAddEditMode & dtlSdcAddMode must be initialised prior to this
If Me.Visible = True Then
    txtVoid.SetFocus
End If
If IsMissing(mRowPos) = False Then
    mskIbdSno.Top = mRowPos
    txtSDctName.Top = mRowPos
    txtDrlName.Top = mRowPos
    txtIbdRemark.Top = mRowPos
    cmdSdcOK.Top = mRowPos
End If

mskIbdSno.Text = 0
txtSDctName.Text = "": fcmbSDctName.BoundText = ""
txtDrlName.Text = "": fcmbDrlName.BoundText = ""
txtIbdRemark.Text = ""

Call ValidSdcDtl

mskIbdSno.Visible = mShowItem
txtSDctName.Visible = mShowItem
txtDrlName.Visible = mShowItem
txtIbdRemark.Visible = mShowItem
cmdSdcOK.Visible = mShowItem

Mfgrd3.Enabled = (mShowItem = False)

End Sub

Private Sub ValidSdcDtl()
Dim mDataOk As Boolean, srow As Integer

srow = Mfgrd3.Row
mDataOk = (Val(fcmbSrvName.BoundText) > 0 And mIblPttCode > 0 And mIblIpgCode > 0 And Val(UnMyNumFmt(mskIbdSno.Text)) > 0 And Val(fcmbSDctName.BoundText) > 0 And Val(fcmbDrlName.BoundText) > 0)
cmdSdcOK.Caption = IIf(mDataOk = True, "&OK", "&Cancel")
cmdSdcOK.BackColor = IIf(mDataOk = True, &H80FF80, &H8080FF)
End Sub

Private Sub ShowSdcDtlData(ByVal mIblCode As Long, ByVal mIbdIblCode As Long)
Dim srow As Integer, tRecset As New ADODB.Recordset, mColCnt As Integer

srow = 1
Mfgrd3.Rows = 2

With tRecset
.open "Select * from IndrBlDctDtl where IbdCode=" & CStr(mIblCode) & " and IbdIblCode=" & CStr(mIbdIblCode) & " order by IbdSno", dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Do While .EOF = False
        If InList(.fields("IbdRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
            clsDCT.GetData .fields("IbdDctCode")
            clsDRL.GetData .fields("IbdDrlCode")
            
            Mfgrd3.TextMatrix(srow, X3IBDICODE_COL) = .fields("IbdICode")
            Mfgrd3.TextMatrix(srow, X3IBDSNO_COL) = ToMyNumFmt(.fields("IbdSno"), mDecimals:=0)
            Mfgrd3.TextMatrix(srow, X3DCTNAME_COL) = clsDCT.mName_str
            Mfgrd3.TextMatrix(srow, X3DRLNAME_COL) = clsDRL.mName_str
            Mfgrd3.TextMatrix(srow, X3IBDREMARK_COL) = .fields("IbdRemark")
            Mfgrd3.TextMatrix(srow, X3IBDDCTCODE_COL) = .fields("IbdDctCode")
            Mfgrd3.TextMatrix(srow, X3IBDDRLCODE_COL) = .fields("IbdDrlCode")
            Mfgrd3.TextMatrix(srow, X3IBDRECSTATE_COL) = .fields("IbdRecState")
            
            Mfgrd3.Rows = Mfgrd3.Rows + 1
            srow = srow + 1
        Else
            If InList(.fields("IbdRecState"), Array(cREC_CANCELED, cREC_DELETED)) = False Then
                ErrorBox Me.Name & "_ShowSdcDtlData_#3545_[Invalid Record Status]"
            End If
        End If
    
        .MoveNext
    Loop
    If srow = 1 Then
        For mColCnt = 0 To Mfgrd3.Cols - 1
            Mfgrd3.TextMatrix(srow, mColCnt) = ""
        Next
    End If
Else
    For mColCnt = 0 To Mfgrd3.Cols - 1
        Mfgrd3.TextMatrix(srow, mColCnt) = ""
    Next
End If
End With
CloseTable tRecset

End Sub

Private Sub ShowSdcEntryMode(ByVal mShowItem As Boolean)
If Me.Visible = True Then
    txtVoid.SetFocus
End If
If mShowItem = False Then
    If dtlSdcAddEditMode = True Then
        dtlSdcEditCanceled = True
        Call cmdSdcOK_Click
    Else
        dtlSdcAddMode = False
        dtlSdcAddEditMode = False
        dtlSdcEditCanceled = False
        VisibleSdcControls False
    End If
    frSdcDtl.Visible = False
Else
    dtlSdcAddMode = False
    dtlSdcAddEditMode = False
    dtlSdcEditCanceled = False
    frSdcDtl.ZOrder
    frSdcDtl.Visible = True
    VisibleSdcControls False
End If

End Sub

' =*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
Private Sub cmdDpogOK_Click()
Dim tRecset As New ADODB.Recordset, srow As Integer, mIbgdSno As Integer, mIbgdICode As Long

srow = Mfgrd4.Row
mIbgdSno = Val(Mfgrd4.TextMatrix(srow, X4IBGDSNO_COL))
mIbgdICode = Val(Mfgrd4.TextMatrix(srow, X4IBGDICODE_COL))

If cmdDpogOK.Caption = "&OK" And dtlDpogEditCanceled = False Then
    With clsIBL
    If dtlDpogAddMode = True Then
        .ClearDpog
    Else
        .GetDpogData mIblCode, mIbgdICode
    End If
    .mIbgdCode_lng = mIblCode
    .mIbgdSno_int = Val(UnMyNumFmt(mskIbgdSno.Text))
    .mIbgdIgtCode_lng = Val(fcmbIgtVchNo.BoundText)
    .mIbgdDpogAmt_dbl = Val(UnMyNumFmt(mskIbgdDpogAmt.Text))
    .mIbgdRemark_str = ""
    .mIbgdCmpCode_int = sFinYrCmpCode
    If dtlDpogAddMode = True Then
        If .AddNewDpog(mIblCode) = True Then
            mIbgdICode = .mIbgdICode_lng
        End If
    Else
        .UpdateDpog mIblCode, mIbgdICode
    End If
    End With
    
    RefreshDatabase dbHmsDatabase
    With tRecset
    .open "Select * from IndrBlDpogDtl where IbgdCode=" & CStr(mIblCode) & " and IbgdICode=" & CStr(mIbgdICode) & " order by IbgdSno", dbHmsDatabase, adOpenKeyset, adLockOptimistic
    
    clsIGT.GetData .fields("IbgdIgtCode")
    clsVTM.GetData clsIGT.mVtmCode_lng
    
    Mfgrd4.TextMatrix(srow, X4IBGDICODE_COL) = .fields("IbgdICode")
    Mfgrd4.TextMatrix(srow, X4IBGDSNO_COL) = ToMyNumFmt(.fields("IbgdSno"), mDecimals:=0)
    Mfgrd4.TextMatrix(srow, X4IGTVCHNO_COL) = ToMyNumFmt(clsIGT.mVchNo_lng, mDecimals:=0)
    Mfgrd4.TextMatrix(srow, X4IGTVTMNAME_COL) = clsVTM.mName_str
    Mfgrd4.TextMatrix(srow, X4IGTDATE_COL) = Dtoc(clsIGT.mVchDate_dt)
    Mfgrd4.TextMatrix(srow, X4IGTDPOGAMT_COL) = ToMyNumFmt(clsIGT.mIgtDpogAmt_dbl)
    Mfgrd4.TextMatrix(srow, X4IGTADJAMTEXCL_COL) = ToMyNumFmt(clsIGT.mIgtAdjAmt_dbl - .fields("IbgdDpogAmt"))
    Mfgrd4.TextMatrix(srow, X4IBGDDPOGAMT_COL) = ToMyNumFmt(.fields("IbgdDpogAmt"))
    Mfgrd4.TextMatrix(srow, X4IGTBALAMT_COL) = ToMyNumFmt(clsIGT.mIgtBalAmt_dbl)
    Mfgrd4.TextMatrix(srow, X4IBGDIGTCODE_COL) = .fields("IbgdIgtCode")
    Mfgrd4.TextMatrix(srow, X4IBGDRECSTATE_COL) = .fields("IbgdRecState")
    
    End With
    CloseTable tRecset
    mskIblDpogAmtTot.Text = ToMyNumFmt(Val(UnMyNumFmt(mskIblDpogAmtTot.Text)) + Val(UnMyNumFmt(mskIbgdDpogAmt.Text)) - mIbgdDpogAmt_old)
    
    If dtlDpogAddMode = True Then
        Mfgrd4.Rows = Mfgrd4.Rows + 1
    End If
    srow = srow + 1
    Mfgrd4.Row = srow
    
    Call CalcFtrTotal
End If
dtlDpogAddEditMode = False
dtlDpogAddMode = False
dtlDpogEditCanceled = False
VisibleDpogControls False
txtVoid.SetFocus
Mfgrd4.SetFocus
CloseTable tRecset, mCheckOpen:=True

End Sub

Private Sub Mfgrd4_DblClick()
Mfgrd4_KeyPress vbKeyReturn
End Sub

Private Sub Mfgrd4_GotFocus()
Mfgrd4.Col = FlexLeftVisibleCol(Mfgrd4)
Mfgrd4.LeftCol = FlexLeftVisibleCol(Mfgrd4)
If Mfgrd4.SelectionMode = flexSelectionByRow Then
    Mfgrd4.ColSel = 0: Mfgrd4.ColSel = Mfgrd4.Cols - 1
End If

Rem Call Mfgrd4_RowColChange
End Sub

Private Sub Mfgrd4_KeyDown(KeyCode As Integer, Shift As Integer)
Dim srow As Integer, mIbgdICode As Long, mDeleteit As Boolean

srow = Mfgrd4.Row
mIbgdICode = Val(Mfgrd4.TextMatrix(srow, X4IBGDICODE_COL))

If MyDeleteKey(Shift, KeyCode, mCheckCtrlMask:=False) = True And mIbgdICode > 0 Then
    mDeleteit = True
    If mDeleteit = True Then
        mDeleteit = CanDelete()
    End If
    If mDeleteit = True Then
        clsIBL.DeleteDpog mIblCode, mIbgdICode
        
        ShowDpogDtlData mIblCode
        Mfgrd4.Row = srow
        Mfgrd4.SetFocus
        Call Mfgrd4_RowColChange
    End If
End If

End Sub

Private Sub Mfgrd4_KeyPress(KeyAscii As Integer)
Dim srow As Integer

If KeyAscii = vbKeyReturn Then
    srow = Mfgrd4.Row
    
    dtlDpogAddEditMode = True
    dtlDpogAddMode = IsFlexNewRow(Mfgrd4, srow)
    VisibleDpogControls True, Mfgrd4.Top + Mfgrd4.RowPos(Mfgrd4.Row)
    If dtlDpogAddMode = True Then
        mskIbgdSno.Text = ToMyNumFmt(FlexNextSeqno(Mfgrd4, X4IBGDSNO_COL), mDecimals:=0)
    Else
        clsIGT.GetData Val(Mfgrd4.TextMatrix(srow, X4IBGDIGTCODE_COL))
        clsVTM.GetData clsIGT.mVtmCode_lng
            
        mskIbgdSno.Text = Mfgrd4.TextMatrix(srow, X4IBGDSNO_COL)
        fcmbIgtVchNo.BoundText = Mfgrd4.TextMatrix(srow, X4IBGDIGTCODE_COL): mskIgtVchNo.Text = fcmbIgtVchNo.Text
        txtIgtVtmName.Text = clsVTM.mName_str
        dtpIgtDate.Text = Dtoc(clsIGT.mVchDate_dt)
        mskIgtDpogAmt.Text = ToMyNumFmt(clsIGT.mIgtDpogAmt_dbl)
        mskIgtAdjAmtExcl.Text = ToMyNumFmt(clsIGT.mIgtAdjAmt_dbl - Val(UnMyNumFmt(Mfgrd4.TextMatrix(srow, X4IBGDDPOGAMT_COL))))
        mskIbgdDpogAmt.Text = Mfgrd4.TextMatrix(srow, X4IBGDDPOGAMT_COL)
        mskIgtBalAmt.Text = Mfgrd4.TextMatrix(srow, X4IGTBALAMT_COL)
    End If
    mskIgtVchNo.SetFocus
    Call ValidDpogDtl
    
    mIgtCode_old = Val(fcmbIgtVchNo.BoundText)
    mIbgdDpogAmt_old = Val(UnMyNumFmt(mskIbgdDpogAmt.Text))
End If

End Sub

Private Sub Mfgrd4_RowColChange()
ShowActiveFlexRow Mfgrd4
End Sub

Private Sub VisibleDpogControls(ByVal mShowItem As Boolean, Optional ByVal mRowPos)
Rem Important - dtlDpogAddEditMode & dtlDpogAddMode must be initialised prior to this
If Me.Visible = True Then
    txtVoid.SetFocus
End If
If IsMissing(mRowPos) = False Then
    mskIbgdSno.Top = mRowPos
    mskIgtVchNo.Top = mRowPos
    txtIgtVtmName.Top = mRowPos
    dtpIgtDate.Top = mRowPos
    mskIgtDpogAmt.Top = mRowPos
    mskIgtAdjAmtExcl.Top = mRowPos
    mskIbgdDpogAmt.Top = mRowPos
    mskIgtBalAmt.Top = mRowPos
    cmdDpogOK.Top = mRowPos + mskIgtBalAmt.Height
End If

mskIbgdSno.Text = 0
mskIgtVchNo.Text = 0: fcmbIgtVchNo.BoundText = ""
txtIgtVtmName.Text = ""
dtpIgtDate.Text = ""
mskIgtDpogAmt.Text = ToMyNumFmt(0)
mskIgtAdjAmtExcl.Text = ToMyNumFmt(0)
mskIbgdDpogAmt.Text = ToMyNumFmt(0)
mskIgtBalAmt.Text = ToMyNumFmt(0)

Call ValidDpogDtl

mskIbgdSno.Visible = mShowItem
mskIgtVchNo.Visible = mShowItem
txtIgtVtmName.Visible = mShowItem
dtpIgtDate.Visible = mShowItem
mskIgtDpogAmt.Visible = mShowItem
mskIgtAdjAmtExcl.Visible = mShowItem
mskIbgdDpogAmt.Visible = mShowItem
mskIgtBalAmt.Visible = mShowItem
cmdDpogOK.Visible = mShowItem

Mfgrd4.Enabled = (mShowItem = False)

End Sub

Private Sub ValidDpogDtl()
Dim mDataOk As Boolean, srow As Integer

srow = Mfgrd4.Row
mDataOk = (Val(UnMyNumFmt(mskIbgdSno.Text)) > 0 And Val(fcmbIgtVchNo.BoundText) > 0 And txtIgtVtmName.Text <> "" And mIblPttCode > 0 And mIblIpgCode > 0 And Val(UnMyNumFmt(mskIbgdDpogAmt.Text)) > 0 And chkIgtDpogAmt() = True)
cmdDpogOK.Caption = IIf(mDataOk = True, "&OK", "&Cancel")
cmdDpogOK.BackColor = IIf(mDataOk = True, &H80FF80, &H8080FF)
End Sub

Private Sub ShowDpogDtlData(ByVal mIblCode As Long)
Dim srow As Integer, tRecset As New ADODB.Recordset, mColCnt As Integer
Dim mIbgdDpogAmtTot As Double

srow = 1
Mfgrd4.Rows = 2
mIbgdDpogAmtTot = 0

With tRecset
.open "Select * from IndrBlDpogDtl where IbgdCode=" & CStr(mIblCode) & " order by IbgdSno", dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Do While .EOF = False
        If InList(.fields("IbgdRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
            clsIGT.GetData .fields("IbgdIgtCode")
            clsVTM.GetData clsIGT.mVtmCode_lng
            
            Mfgrd4.TextMatrix(srow, X4IBGDICODE_COL) = .fields("IbgdICode")
            Mfgrd4.TextMatrix(srow, X4IBGDSNO_COL) = ToMyNumFmt(.fields("IbgdSno"), mDecimals:=0)
            Mfgrd4.TextMatrix(srow, X4IGTVCHNO_COL) = ToMyNumFmt(clsIGT.mVchNo_lng, mDecimals:=0)
            Mfgrd4.TextMatrix(srow, X4IGTVTMNAME_COL) = clsVTM.mName_str
            Mfgrd4.TextMatrix(srow, X4IGTDATE_COL) = Dtoc(clsIGT.mVchDate_dt)
            Mfgrd4.TextMatrix(srow, X4IGTDPOGAMT_COL) = ToMyNumFmt(clsIGT.mIgtDpogAmt_dbl)
            Mfgrd4.TextMatrix(srow, X4IGTADJAMTEXCL_COL) = ToMyNumFmt(clsIGT.mIgtAdjAmt_dbl - .fields("IbgdDpogAmt"))
            Mfgrd4.TextMatrix(srow, X4IBGDDPOGAMT_COL) = ToMyNumFmt(.fields("IbgdDpogAmt"))
            Mfgrd4.TextMatrix(srow, X4IGTBALAMT_COL) = ToMyNumFmt(clsIGT.mIgtBalAmt_dbl)
            Mfgrd4.TextMatrix(srow, X4IBGDIGTCODE_COL) = .fields("IbgdIgtCode")
            Mfgrd4.TextMatrix(srow, X4IBGDRECSTATE_COL) = .fields("IbgdRecState")
            
            mIbgdDpogAmtTot = mIbgdDpogAmtTot + .fields("IbgdDpogAmt")
            
            Mfgrd4.Rows = Mfgrd4.Rows + 1
            srow = srow + 1
        Else
            If InList(.fields("IbgdRecState"), Array(cREC_CANCELED, cREC_DELETED)) = False Then
                ErrorBox Me.Name & "_ShowDpogDtlData_#4024_[Invalid Record Status]"
            End If
        End If
    
        .MoveNext
    Loop
    If srow = 1 Then
        For mColCnt = 0 To Mfgrd4.Cols - 1
            Mfgrd4.TextMatrix(srow, mColCnt) = ""
        Next
    End If
Else
    For mColCnt = 0 To Mfgrd4.Cols - 1
        Mfgrd4.TextMatrix(srow, mColCnt) = ""
    Next
End If
End With
CloseTable tRecset

mskIblDpogAmtTot.Text = ToMyNumFmt(mIbgdDpogAmtTot)

Call CalcFtrTotal

End Sub

Private Sub ShowDpogEntryMode(ByVal mShowItem As Boolean)
If Me.Visible = True Then
    txtVoid.SetFocus
End If
If mShowItem = False Then
    If dtlDpogAddEditMode = True Then
        dtlDpogEditCanceled = True
        Call cmdDpogOK_Click
    Else
        dtlDpogAddMode = False
        dtlDpogAddEditMode = False
        dtlDpogEditCanceled = False
        VisibleDpogControls False
    End If
    frDpogAdjDtl.Visible = False
Else
    dtlDpogAddMode = False
    dtlDpogAddEditMode = False
    dtlDpogEditCanceled = False
    frDpogAdjDtl.ZOrder
    frDpogAdjDtl.Visible = True
    VisibleDpogControls False
End If

End Sub

' /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-
Private Sub cmdRfugOK_Click()
Dim tRecset As New ADODB.Recordset, srow As Integer, mIbgfSno As Integer, mIbgfICode As Long

srow = Mfgrd5.Row
mIbgfSno = Val(Mfgrd5.TextMatrix(srow, X5IBGFSNO_COL))
mIbgfICode = Val(Mfgrd5.TextMatrix(srow, X5IBGFICODE_COL))

If cmdRfugOk.Caption = "&OK" And dtlRfugEditCanceled = False Then
    With clsIBL
    If dtlRfugAddMode = True Then
        .ClearRfug
    Else
        .GetRfugData mIblCode, mIbgfICode
    End If
    .mIbgfCode_lng = mIblCode
    .mIbgfSno_int = Val(UnMyNumFmt(mskIbgfSno.Text))
    .mIbgfIgfCode_lng = Val(fcmbIgfVchNo.BoundText)
    .mIbgfRfugAmt_dbl = Val(UnMyNumFmt(mskIbgfRfugAmt.Text))
    .mIbgfRemark_str = ""
    .mIbgfCmpCode_int = sFinYrCmpCode
    If dtlRfugAddMode = True Then
        If .AddNewRfug(mIblCode) = True Then
            mIbgfICode = .mIbgfICode_lng
        End If
    Else
        .UpdateRfug mIblCode, mIbgfICode
    End If
    End With
    
    RefreshDatabase dbHmsDatabase
    With tRecset
    .open "Select * from IndrBlRfugDtl where IbgfCode=" & CStr(mIblCode) & " and IbgfICode=" & CStr(mIbgfICode) & " order by IbgfSno", dbHmsDatabase, adOpenKeyset, adLockOptimistic
    
    clsIGF.GetData .fields("IbgfIgfCode")
    clsVTM.GetData clsIGF.mVtmCode_lng
    
    Mfgrd5.TextMatrix(srow, X5IBGFICODE_COL) = .fields("IbgfICode")
    Mfgrd5.TextMatrix(srow, X5IBGFSNO_COL) = ToMyNumFmt(.fields("IbgfSno"), mDecimals:=0)
    Mfgrd5.TextMatrix(srow, X5IGFVCHNO_COL) = ToMyNumFmt(clsIGF.mVchNo_lng, mDecimals:=0)
    Mfgrd5.TextMatrix(srow, X5IGFVTMNAME_COL) = clsVTM.mName_str
    Mfgrd5.TextMatrix(srow, X5IGFDATE_COL) = Dtoc(clsIGF.mVchDate_dt)
    Mfgrd5.TextMatrix(srow, X5IGFRFUGAMT_COL) = ToMyNumFmt(clsIGF.mIgfRfugAmt_dbl)
    Mfgrd5.TextMatrix(srow, X5IGFADJAMTEXCL_COL) = ToMyNumFmt(clsIGF.mIgfAdjAmt_dbl - .fields("IbgfRfugAmt"))
    Mfgrd5.TextMatrix(srow, X5IBGFRFUGAMT_COL) = ToMyNumFmt(.fields("IbgfRfugAmt"))
    Mfgrd5.TextMatrix(srow, X5IGFBALAMT_COL) = ToMyNumFmt(clsIGF.mIgfBalAmt_dbl)
    Mfgrd5.TextMatrix(srow, X5IBGFIGFCODE_COL) = .fields("IbgfIgfCode")
    Mfgrd5.TextMatrix(srow, X5IBGFRECSTATE_COL) = .fields("IbgfRecState")
    
    End With
    CloseTable tRecset
    mskIblRfugAmtTot.Text = ToMyNumFmt(Val(UnMyNumFmt(mskIblRfugAmtTot.Text)) + Val(UnMyNumFmt(mskIbgfRfugAmt.Text)) - mIbgfRfugAmt_old)
    
    If dtlRfugAddMode = True Then
        Mfgrd5.Rows = Mfgrd5.Rows + 1
    End If
    srow = srow + 1
    Mfgrd5.Row = srow
    
    Call CalcFtrTotal
    
End If
dtlRfugAddEditMode = False
dtlRfugAddMode = False
dtlRfugEditCanceled = False
VisibleRfugControls False
txtVoid.SetFocus
Mfgrd5.SetFocus
CloseTable tRecset, mCheckOpen:=True

End Sub

Private Sub Mfgrd5_DblClick()
Mfgrd5_KeyPress vbKeyReturn
End Sub

Private Sub Mfgrd5_GotFocus()
Mfgrd5.Col = FlexLeftVisibleCol(Mfgrd5)
Mfgrd5.LeftCol = FlexLeftVisibleCol(Mfgrd5)
If Mfgrd5.SelectionMode = flexSelectionByRow Then
    Mfgrd5.ColSel = 0: Mfgrd5.ColSel = Mfgrd5.Cols - 1
End If

Rem Call Mfgrd5_RowColChange
End Sub

Private Sub Mfgrd5_KeyDown(KeyCode As Integer, Shift As Integer)
Dim srow As Integer, mIbgfICode As Long, mDeleteit As Boolean

srow = Mfgrd5.Row
mIbgfICode = Val(Mfgrd5.TextMatrix(srow, X5IBGFICODE_COL))

If MyDeleteKey(Shift, KeyCode, mCheckCtrlMask:=False) = True And mIbgfICode > 0 Then
    mDeleteit = True
    If mDeleteit = True Then
        mDeleteit = CanDelete()
    End If
    If mDeleteit = True Then
        clsIBL.DeleteRfug mIblCode, mIbgfICode
        
        ShowRfugDtlData mIblCode
        Mfgrd5.Row = srow
        Mfgrd5.SetFocus
        Call Mfgrd5_RowColChange
    End If
End If

End Sub

Private Sub Mfgrd5_KeyPress(KeyAscii As Integer)
Dim srow As Integer

If KeyAscii = vbKeyReturn Then
    srow = Mfgrd5.Row
    
    dtlRfugAddEditMode = True
    dtlRfugAddMode = IsFlexNewRow(Mfgrd5, srow)
    VisibleRfugControls True, Mfgrd5.Top + Mfgrd5.RowPos(Mfgrd5.Row)
    If dtlRfugAddMode = True Then
        mskIbgfSno.Text = ToMyNumFmt(FlexNextSeqno(Mfgrd5, X5IBGFSNO_COL), mDecimals:=0)
    Else
        clsIGF.GetData Val(Mfgrd5.TextMatrix(srow, X5IBGFIGFCODE_COL))
        clsVTM.GetData clsIGF.mVtmCode_lng
            
        mskIbgfSno.Text = Mfgrd5.TextMatrix(srow, X5IBGFSNO_COL)
        fcmbIgfVchNo.BoundText = Mfgrd5.TextMatrix(srow, X5IBGFIGFCODE_COL): mskIgfVchNo.Text = fcmbIgfVchNo.Text
        txtIgfVtmName.Text = clsVTM.mName_str
        dtpIgfDate.Text = Dtoc(clsIGF.mVchDate_dt)
        mskIgfRfugAmt.Text = ToMyNumFmt(clsIGF.mIgfRfugAmt_dbl)
        mskIgfAdjAmtExcl.Text = ToMyNumFmt(clsIGF.mIgfAdjAmt_dbl - Val(UnMyNumFmt(Mfgrd5.TextMatrix(srow, X5IBGFRFUGAMT_COL))))
        mskIbgfRfugAmt.Text = Mfgrd5.TextMatrix(srow, X5IBGFRFUGAMT_COL)
        mskIgfBalAmt.Text = Mfgrd5.TextMatrix(srow, X5IGFBALAMT_COL)
    End If
    mskIgfVchNo.SetFocus
    Call ValidRfugDtl
    
    mIgfCode_old = Val(fcmbIgfVchNo.BoundText)
    mIbgfRfugAmt_old = Val(UnMyNumFmt(mskIbgfRfugAmt.Text))
    mSdcDctCode_old = Val(fcmbSDctName.BoundText)
End If

End Sub

Private Sub Mfgrd5_RowColChange()
ShowActiveFlexRow Mfgrd5
End Sub

Private Sub VisibleRfugControls(ByVal mShowItem As Boolean, Optional ByVal mRowPos)
Rem Important - dtlRfugAddEditMode & dtlRfugAddMode must be initialised prior to this
If Me.Visible = True Then
    txtVoid.SetFocus
End If
If IsMissing(mRowPos) = False Then
    mskIbgfSno.Top = mRowPos
    mskIgfVchNo.Top = mRowPos
    txtIgfVtmName.Top = mRowPos
    dtpIgfDate.Top = mRowPos
    mskIgfRfugAmt.Top = mRowPos
    mskIgfAdjAmtExcl.Top = mRowPos
    mskIbgfRfugAmt.Top = mRowPos
    mskIgfBalAmt.Top = mRowPos
    cmdRfugOk.Top = mRowPos + mskIgfBalAmt.Height
End If

mskIbgfSno.Text = 0
mskIgfVchNo.Text = 0: fcmbIgfVchNo.BoundText = ""
txtIgfVtmName.Text = ""
dtpIgfDate.Text = ""
mskIgfRfugAmt.Text = ToMyNumFmt(0)
mskIgfAdjAmtExcl.Text = ToMyNumFmt(0)
mskIbgfRfugAmt.Text = ToMyNumFmt(0)
mskIgfBalAmt.Text = ToMyNumFmt(0)

Call ValidRfugDtl

mskIbgfSno.Visible = mShowItem
mskIgfVchNo.Visible = mShowItem
txtIgfVtmName.Visible = mShowItem
dtpIgfDate.Visible = mShowItem
mskIgfRfugAmt.Visible = mShowItem
mskIgfAdjAmtExcl.Visible = mShowItem
mskIbgfRfugAmt.Visible = mShowItem
mskIgfBalAmt.Visible = mShowItem
cmdRfugOk.Visible = mShowItem

Mfgrd5.Enabled = (mShowItem = False)

End Sub

Private Sub ValidRfugDtl()
Dim mDataOk As Boolean, srow As Integer

srow = Mfgrd5.Row
mDataOk = (Val(UnMyNumFmt(mskIbgfSno.Text)) > 0 And Val(fcmbIgfVchNo.BoundText) > 0 And txtIgfVtmName.Text <> "" And mIblPttCode > 0 And mIblIpgCode > 0 And Val(UnMyNumFmt(mskIbgfRfugAmt.Text)) > 0 And chkIgfRfugAmt() = True)
cmdRfugOk.Caption = IIf(mDataOk = True, "&OK", "&Cancel")
cmdRfugOk.BackColor = IIf(mDataOk = True, &H80FF80, &H8080FF)
End Sub

Private Sub ShowRfugDtlData(ByVal mIblCode As Long)
Dim srow As Integer, tRecset As New ADODB.Recordset, mColCnt As Integer
Dim mIbgfRfugAmtTot As Double

srow = 1
Mfgrd5.Rows = 2
mIbgfRfugAmtTot = 0

With tRecset
.open "Select * from IndrBlRfugDtl where IbgfCode=" & CStr(mIblCode) & " order by IbgfSno", dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Do While .EOF = False
        If InList(.fields("IbgfRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
            clsIGF.GetData .fields("IbgfIgfCode")
            clsVTM.GetData clsIGF.mVtmCode_lng
            
            Mfgrd5.TextMatrix(srow, X5IBGFICODE_COL) = .fields("IbgfICode")
            Mfgrd5.TextMatrix(srow, X5IBGFSNO_COL) = ToMyNumFmt(.fields("IbgfSno"), mDecimals:=0)
            Mfgrd5.TextMatrix(srow, X5IGFVCHNO_COL) = ToMyNumFmt(clsIGF.mVchNo_lng, mDecimals:=0)
            Mfgrd5.TextMatrix(srow, X5IGFVTMNAME_COL) = clsVTM.mName_str
            Mfgrd5.TextMatrix(srow, X5IGFDATE_COL) = Dtoc(clsIGF.mVchDate_dt)
            Mfgrd5.TextMatrix(srow, X5IGFRFUGAMT_COL) = ToMyNumFmt(clsIGF.mIgfRfugAmt_dbl)
            Mfgrd5.TextMatrix(srow, X5IGFADJAMTEXCL_COL) = ToMyNumFmt(clsIGF.mIgfAdjAmt_dbl - .fields("IbgfRfugAmt"))
            Mfgrd5.TextMatrix(srow, X5IBGFRFUGAMT_COL) = ToMyNumFmt(.fields("IbgfRfugAmt"))
            Mfgrd5.TextMatrix(srow, X5IGFBALAMT_COL) = ToMyNumFmt(clsIGF.mIgfBalAmt_dbl)
            Mfgrd5.TextMatrix(srow, X5IBGFIGFCODE_COL) = .fields("IbgfIgfCode")
            Mfgrd5.TextMatrix(srow, X5IBGFRECSTATE_COL) = .fields("IbgfRecState")
            
            mIbgfRfugAmtTot = mIbgfRfugAmtTot + .fields("IbgfRfugAmt")
            
            Mfgrd5.Rows = Mfgrd5.Rows + 1
            srow = srow + 1
        Else
            If InList(.fields("IbgfRecState"), Array(cREC_CANCELED, cREC_DELETED)) = False Then
                ErrorBox Me.Name & "_ShowRfugDtlData_#4024_[Invalid Record Status]"
            End If
        End If
    
        .MoveNext
    Loop
    If srow = 1 Then
        For mColCnt = 0 To Mfgrd5.Cols - 1
            Mfgrd5.TextMatrix(srow, mColCnt) = ""
        Next
    End If
Else
    For mColCnt = 0 To Mfgrd5.Cols - 1
        Mfgrd5.TextMatrix(srow, mColCnt) = ""
    Next
End If
End With
CloseTable tRecset

mskIblRfugAmtTot.Text = ToMyNumFmt(mIbgfRfugAmtTot)

Call CalcFtrTotal

End Sub

Private Sub ShowRfugEntryMode(ByVal mShowItem As Boolean)
If Me.Visible = True Then
    txtVoid.SetFocus
End If
If mShowItem = False Then
    If dtlRfugAddEditMode = True Then
        dtlRfugEditCanceled = True
        Call cmdRfugOK_Click
    Else
        dtlRfugAddMode = False
        dtlRfugAddEditMode = False
        dtlRfugEditCanceled = False
        VisibleRfugControls False
    End If
    frRfugAdjDtl.Visible = False
Else
    dtlRfugAddMode = False
    dtlRfugAddEditMode = False
    dtlRfugEditCanceled = False
    frRfugAdjDtl.ZOrder
    frRfugAdjDtl.Visible = True
    VisibleRfugControls False
End If

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
Dim mIblVchNo As Long

If Val(fcmbIblVtmName.BoundText) < 1 Then
    ErrorBox "Invalid Voucher Type !!!"
    txtIblVtmName(1).SetFocus
    Exit Sub
End If
If Val(UnMyNumFmt(mskIblVchNo(1).Text)) < 1 Then
    ErrorBox "Invalid Voucher No. !!!"
    mskIblVchNo(1).SetFocus
    Exit Sub
Else
    mIblVchNo = Val(UnMyNumFmt(mskIblVchNo(1).Text))
    If ChkIsExistVTypeNo(dbHmsDatabase, mTableName:="IndrBlHdr", mChkFieldName:="IbhVchNo", mChkFieldValue:=CStr(mIblVchNo), mVtmFieldName:="IbhVtmCode", mVtmFieldValue:=Val(fcmbIblVtmName.BoundText), mFinYrFieldName:="IbhCmpCode", mFinYrFieldValue:=sFinYrCmpCode) = False Then
        ErrorBox "Voucher No. does not Exist !!!"
        mskIblVchNo(1).SetFocus
        Exit Sub
    End If
End If
If Val(UnMyNumFmt(mskIblVchNo(2).Text)) < 1 Then
    ErrorBox "Invalid Voucher No. !!!"
    mskIblVchNo(2).SetFocus
    Exit Sub
Else
    mIblVchNo = Val(UnMyNumFmt(mskIblVchNo(2).Text))
    If ChkIsExistVTypeNo(dbHmsDatabase, mTableName:="IndrBlHdr", mChkFieldName:="IbhVchNo", mChkFieldValue:=CStr(mIblVchNo), mVtmFieldName:="IbhVtmCode", mVtmFieldValue:=Val(fcmbIblVtmName.BoundText), mFinYrFieldName:="IbhCmpCode", mFinYrFieldValue:=sFinYrCmpCode) = False Then
        ErrorBox "Voucher No. does not Exist !!!"
        mskIblVchNo(2).SetFocus
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
Dim mFromIblVchNo As Long, mToIblVchNo As Long, mIblVtmCode As Long
Dim fCRView As Form

mFromIblVchNo = Val(UnMyNumFmt(mskIblVchNo(1).Text))
mToIblVchNo = Val(UnMyNumFmt(mskIblVchNo(2).Text))
mIblVtmCode = Val(fcmbIblVtmName.BoundText)

frmMain.Cryst.Reset
frmMain.Cryst.ReportFileName = Trim(Right(cmbCRList.List(cmbCRList.ListIndex), 100))
frmMain.Cryst.DiscardSavedData = True
frmMain.Cryst.DataFiles(0) = dbComDatabaseFullPath

frmMain.Cryst.SelectionFormula = "{vewIndrBill.IbhVchNo}>=" & CStr(mFromIblVchNo) & " and {vewIndrBill.IbhVchNo}<=" & CStr(mToIblVchNo) & " and {vewIndrBill.IbhVtmCode}=" & CStr(mIblVtmCode) & " and {vewIndrBill.IbhCmpCode}=" & CStr(sFinYrCmpCode)
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
        fcmbIblVtmName.BoundText = CStr(datRecset.fields("IbhVtmCode"))
        txtIblVtmName(1).Text = fcmbIblVtmName.Text
        mskIblVchNo(1).Text = datRecset.fields("IbhVchNo")
        mskIblVchNo(2).Text = datRecset.fields("IbhVchNo")
        ' ----------------
        Call AssignPrintPara
        frPrintCRList.ZOrder
        frPrintCRList.Visible = True
        Mfgrd1.Enabled = False
        cmbPrintDest.SetFocus
    End If
    
ElseIf mCallSource = "SaveEvent" Then
    txtIblVtmName(1).Text = fcmbIblVtmName.Text
    mskIblVchNo(1).Text = CStr(Val(UnMyNumFmt(mskIblVchNo(0).Text)))
    mskIblVchNo(2).Text = CStr(Val(UnMyNumFmt(mskIblVchNo(0).Text)))
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

If Dir(IndrBillCRLFileFullPath) = "" Then
    fhand = FreeFile
    Open IndrBillCRLFileFullPath For Output As #fhand
    Write #fhand, "Indoor Bill", "IndrBill.Rpt", True
    Close #fhand
End If

cmbCRList.Clear
fhand = FreeFile
Open IndrBillCRLFileFullPath For Input As #fhand
Do While EOF(fhand) = False
    Input #fhand, mCRLTitle, mCRLFileName, mCRLDefault
    If Dir(IndrBillCRLFileFullPath(mFileName:=mCRLFileName)) <> "" Then
        cmbCRList.AddItem mCRLTitle & Space(100) & IndrBillCRLFileFullPath(mFileName:=mCRLFileName)
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


Rem ************************* E N D  O F  F O R M ************************

