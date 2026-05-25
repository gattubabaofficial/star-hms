VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmLabReceipt 
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
   LockControls    =   -1  'True
   ScaleHeight     =   10860
   ScaleWidth      =   14505
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
      ItemData        =   "LabRcpt.frx":0000
      Left            =   1860
      List            =   "LabRcpt.frx":000D
      Style           =   1  'Simple Combo
      TabIndex        =   152
      TabStop         =   0   'False
      Text            =   "cmbPatEntryMode"
      Top             =   360
      Width           =   1860
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
      TabIndex        =   66
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
      TabIndex        =   65
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
      ItemData        =   "LabRcpt.frx":0034
      Left            =   0
      List            =   "LabRcpt.frx":0041
      Style           =   1  'Simple Combo
      TabIndex        =   64
      TabStop         =   0   'False
      Text            =   "cmbFormEntryMode"
      Top             =   360
      Width           =   1635
   End
   Begin VB.TextBox txtVoid 
      CausesValidation=   0   'False
      Height          =   375
      Left            =   0
      TabIndex        =   60
      TabStop         =   0   'False
      Text            =   "Void"
      Top             =   10080
      Width           =   375
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   145
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
            TextSave        =   "18:45"
         EndProperty
         BeginProperty Panel8 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   1
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
      Height          =   9735
      Left            =   120
      TabIndex        =   63
      Top             =   720
      Width           =   13215
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
         TabIndex        =   59
         Top             =   9360
         Width           =   375
      End
      Begin VB.TextBox mskLrcICode 
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
         Left            =   600
         TabIndex        =   38
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
         TabIndex        =   40
         Tag             =   "AhCode"
         Text            =   "Y"
         Top             =   6000
         Width           =   375
      End
      Begin VB.Frame frSdcDtl 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         ForeColor       =   &H80000008&
         Height          =   2415
         Left            =   120
         TabIndex        =   134
         Top             =   7320
         Width           =   10575
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
            TabIndex        =   46
            Top             =   1080
            Width           =   735
         End
         Begin VB.TextBox txtLrdRemark 
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
            TabIndex        =   45
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
            TabIndex        =   44
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
            TabIndex        =   43
            Top             =   1080
            Width           =   2895
         End
         Begin VB.TextBox mskLrdSno 
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
            TabIndex        =   42
            Tag             =   "AhCode"
            Text            =   "0"
            Top             =   1080
            Width           =   615
         End
         Begin MSFlexGridLib.MSFlexGrid Mfgrd3 
            Height          =   1695
            Left            =   120
            TabIndex        =   41
            Top             =   600
            Width           =   10215
            _ExtentX        =   18018
            _ExtentY        =   2990
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
            TabIndex        =   135
            Top             =   240
            Width           =   2535
         End
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
         TabIndex        =   53
         Top             =   6000
         Width           =   735
      End
      Begin VB.Frame frFooter 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         ForeColor       =   &H80000008&
         Height          =   2415
         Left            =   120
         TabIndex        =   120
         Top             =   7320
         Width           =   12855
         Begin VB.TextBox mskLrcRefuAmtTot 
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
            Height          =   285
            Left            =   10560
            Locked          =   -1  'True
            TabIndex        =   57
            TabStop         =   0   'False
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   1560
            Width           =   1575
         End
         Begin VB.TextBox mskLrcAdvAmtTot 
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
            Height          =   285
            Left            =   10560
            Locked          =   -1  'True
            TabIndex        =   54
            TabStop         =   0   'False
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   480
            Width           =   1575
         End
         Begin VB.TextBox mskLrcBalAmtTot 
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
            Height          =   285
            Left            =   10560
            Locked          =   -1  'True
            TabIndex        =   58
            TabStop         =   0   'False
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   1920
            Width           =   1575
         End
         Begin VB.TextBox mskLrcDepoAmtTot 
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
            Height          =   285
            Left            =   10560
            Locked          =   -1  'True
            TabIndex        =   56
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   1200
            Width           =   1575
         End
         Begin VB.TextBox mskLrcRecdAmtTot 
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
            Left            =   10560
            TabIndex        =   55
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   840
            Width           =   1575
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Refunded Amount:"
            BeginProperty Font 
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
            Index           =   21
            Left            =   8640
            TabIndex        =   133
            Top             =   1560
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
            Height          =   255
            Index           =   15
            Left            =   8640
            TabIndex        =   132
            Top             =   480
            Width           =   1935
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Last OPD Receipt:"
            BeginProperty Font 
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
            TabIndex        =   131
            Top             =   1920
            Width           =   1695
         End
         Begin VB.Label lblOldLrcCodeDesc 
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
            TabIndex        =   130
            Top             =   1920
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
            Height          =   1335
            Left            =   0
            TabIndex        =   129
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
            Height          =   255
            Index           =   29
            Left            =   8640
            TabIndex        =   128
            Top             =   1920
            Width           =   1935
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Deposited Amount:"
            BeginProperty Font 
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
            Index           =   27
            Left            =   8640
            TabIndex        =   127
            Top             =   1200
            Width           =   1935
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Received Amount:"
            BeginProperty Font 
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
            Index           =   26
            Left            =   8640
            TabIndex        =   125
            Top             =   840
            Width           =   1935
         End
         Begin VB.Label lblLrcAmtAftDiscTot 
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
            Left            =   10680
            TabIndex        =   124
            Top             =   120
            Width           =   1455
         End
         Begin VB.Label lblLrcDiscAmtTot 
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
            Left            =   9480
            TabIndex        =   123
            Top             =   120
            Width           =   1215
         End
         Begin VB.Label lblLrcAmtBefDiscTot 
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
            Left            =   6840
            TabIndex        =   122
            Top             =   120
            Width           =   1455
         End
         Begin VB.Label lblLrcUnitTot 
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
            TabIndex        =   121
            Top             =   120
            Width           =   855
         End
      End
      Begin VB.TextBox mskLrcSno 
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
         TabIndex        =   37
         Tag             =   "AhCode"
         Text            =   "1)"
         Top             =   6000
         Width           =   495
      End
      Begin VB.Frame frHeader 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   5175
         Left            =   120
         TabIndex        =   96
         Top             =   240
         Width           =   12855
         Begin VB.TextBox txtAhName 
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
            TabIndex        =   20
            Top             =   3180
            Width           =   3795
         End
         Begin VB.CheckBox chkPttShowInList 
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
            Left            =   10320
            TabIndex        =   25
            TabStop         =   0   'False
            Top             =   3480
            Width           =   1755
         End
         Begin VB.CheckBox chkPttInfAllowed 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Increament Allowed:"
            BeginProperty Font 
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
            Left            =   120
            TabIndex        =   21
            TabStop         =   0   'False
            Top             =   3480
            Width           =   2535
         End
         Begin VB.CheckBox chkPttDefAllowed 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Decreament Allowed:"
            BeginProperty Font 
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
            Left            =   2880
            TabIndex        =   22
            TabStop         =   0   'False
            Top             =   3480
            Width           =   2535
         End
         Begin VB.CheckBox chkPttDiscAllowed 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Discount Allowed:"
            BeginProperty Font 
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
            Left            =   5520
            TabIndex        =   23
            TabStop         =   0   'False
            Top             =   3480
            Width           =   2055
         End
         Begin VB.TextBox mskPttDiscPer 
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
            Left            =   8880
            TabIndex        =   24
            TabStop         =   0   'False
            Tag             =   "AhCode"
            Text            =   "0.00 %"
            Top             =   3480
            Width           =   1215
         End
         Begin VB.TextBox txtPttEmail 
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
            TabIndex        =   18
            Top             =   2760
            Width           =   5295
         End
         Begin VB.TextBox txtPttAddr 
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
            Height          =   615
            Left            =   2040
            MaxLength       =   250
            MultiLine       =   -1  'True
            TabIndex        =   13
            Top             =   1800
            Width           =   5295
         End
         Begin VB.ComboBox cmbPttRefRela 
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
            Left            =   2040
            Style           =   2  'Dropdown List
            TabIndex        =   11
            Top             =   1500
            Width           =   1215
         End
         Begin VB.ComboBox cmbPttSex 
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
            Left            =   2040
            Style           =   2  'Dropdown List
            TabIndex        =   5
            Top             =   1200
            Width           =   1215
         End
         Begin VB.TextBox mskLrcPttDiscPer 
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
            Top             =   4800
            Width           =   1215
         End
         Begin VB.TextBox txtLrcTime_str 
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
            Left            =   11040
            MaxLength       =   50
            TabIndex        =   30
            TabStop         =   0   'False
            Text            =   "00:00"
            Top             =   3900
            Width           =   855
         End
         Begin VB.TextBox dtpLrcDate 
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
            TabIndex        =   29
            Text            =   "dd/mm/yyyy"
            Top             =   3900
            Width           =   1455
         End
         Begin VB.TextBox mskLrcVchNo 
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
            Left            =   5880
            TabIndex        =   28
            TabStop         =   0   'False
            Tag             =   "AhCode"
            Text            =   "0"
            Top             =   3900
            Width           =   1455
         End
         Begin VB.TextBox txtLrcVtmName 
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
            TabIndex        =   26
            TabStop         =   0   'False
            Top             =   3900
            Width           =   1815
         End
         Begin VB.TextBox txtLrcPrefix 
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
            TabIndex        =   27
            Tag             =   "AhCode"
            Text            =   "[Prefix]"
            Top             =   3900
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
            Top             =   180
            Width           =   1455
         End
         Begin VB.TextBox txtPttName 
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
            TabIndex        =   4
            Top             =   900
            Width           =   5295
         End
         Begin VB.TextBox txtPcgName 
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
            TabIndex        =   19
            Top             =   3180
            Width           =   4275
         End
         Begin VB.TextBox dtpPttRegDate 
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
            Left            =   4380
            MaxLength       =   50
            TabIndex        =   3
            TabStop         =   0   'False
            Text            =   "dd/mm/yyyy"
            Top             =   600
            Width           =   1455
         End
         Begin VB.TextBox mskPttRegNo 
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
            Left            =   2040
            TabIndex        =   2
            Tag             =   "AhCode"
            Text            =   "0"
            Top             =   600
            Width           =   1455
         End
         Begin VB.TextBox txtPttRefName 
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
            Left            =   3360
            MaxLength       =   50
            TabIndex        =   12
            Top             =   1500
            Width           =   3975
         End
         Begin VB.TextBox txtAraName 
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
            TabIndex        =   14
            Top             =   1800
            Width           =   3795
         End
         Begin VB.TextBox txtStnName 
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
            Left            =   8880
            MaxLength       =   50
            TabIndex        =   15
            Top             =   2100
            Width           =   3795
         End
         Begin VB.TextBox txtPttTelNo 
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
            TabIndex        =   16
            Top             =   2460
            Width           =   5295
         End
         Begin VB.TextBox txtPttSMSNo 
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
            TabIndex        =   17
            Top             =   2460
            Width           =   3795
         End
         Begin VB.TextBox mskPttAgeYr 
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
            Left            =   5280
            TabIndex        =   6
            Tag             =   "AhCode"
            Text            =   "0"
            Top             =   1200
            Width           =   735
         End
         Begin VB.TextBox mskPttAgeMn 
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
            TabIndex        =   7
            Tag             =   "AhCode"
            Text            =   "0"
            Top             =   1200
            Width           =   615
         End
         Begin VB.TextBox mskPttAgeDy 
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
            Left            =   6600
            TabIndex        =   8
            Tag             =   "AhCode"
            Text            =   "0"
            Top             =   1200
            Width           =   735
         End
         Begin VB.TextBox dtpPttDob 
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
            TabIndex        =   10
            TabStop         =   0   'False
            Text            =   "dd/mm/yyyy"
            Top             =   1200
            Width           =   1455
         End
         Begin VB.TextBox dtpPttAgeAsOnDt 
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
            TabIndex        =   9
            TabStop         =   0   'False
            Text            =   "dd/mm/yyyy"
            Top             =   1200
            Width           =   1455
         End
         Begin VB.TextBox txtCDctName 
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
            TabIndex        =   31
            Top             =   4200
            Width           =   5295
         End
         Begin VB.TextBox txtRByName 
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
            TabIndex        =   32
            Top             =   4200
            Width           =   3795
         End
         Begin VB.TextBox txtFDigName 
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
            TabIndex        =   33
            Top             =   4500
            Width           =   5295
         End
         Begin VB.TextBox mskLrcPttCode 
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
            Top             =   180
            Width           =   1455
         End
         Begin VB.TextBox txtLhrRemark 
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
            Top             =   4800
            Width           =   5295
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
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   285
            Index           =   20
            Left            =   8880
            TabIndex        =   151
            Top             =   3180
            Width           =   1935
         End
         Begin VB.Label lblAhCurBal 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "0.00 __"
            BeginProperty Font 
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
            Left            =   10920
            TabIndex        =   150
            Top             =   3180
            Width           =   1635
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Account Head:"
            BeginProperty Font 
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
            Index           =   19
            Left            =   7380
            TabIndex        =   149
            Top             =   3180
            Width           =   1515
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Disc.(%):"
            BeginProperty Font 
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
            Left            =   7920
            TabIndex        =   148
            Top             =   3480
            Width           =   975
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Email:"
            BeginProperty Font 
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
            Index           =   13
            Left            =   120
            TabIndex        =   147
            Top             =   2760
            Width           =   1935
         End
         Begin VB.Label lblPcgDiscPer 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Disc.(%):"
            BeginProperty Font 
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
            TabIndex        =   146
            Top             =   3180
            Width           =   975
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
            Height          =   285
            Index           =   28
            Left            =   7380
            TabIndex        =   126
            Top             =   4800
            Width           =   1515
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
            Height          =   285
            Index           =   39
            Left            =   7380
            TabIndex        =   119
            Top             =   3900
            Width           =   1515
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
            Height          =   285
            Index           =   38
            Left            =   10440
            TabIndex        =   118
            Top             =   3900
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
            Height          =   285
            Index           =   37
            Left            =   3960
            TabIndex        =   117
            Top             =   3900
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
            Height          =   285
            Index           =   36
            Left            =   120
            TabIndex        =   116
            Top             =   3900
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
            TabIndex        =   115
            Top             =   180
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
            Height          =   285
            Index           =   0
            Left            =   120
            TabIndex        =   114
            Top             =   900
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
            Height          =   285
            Index           =   5
            Left            =   120
            TabIndex        =   113
            Top             =   3180
            Width           =   1935
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
            Height          =   285
            Index           =   6
            Left            =   120
            TabIndex        =   112
            Top             =   1500
            Width           =   1935
         End
         Begin VB.Line Line3 
            Index           =   1
            X1              =   0
            X2              =   12840
            Y1              =   540
            Y2              =   540
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
            Height          =   285
            Index           =   4
            Left            =   120
            TabIndex        =   111
            Top             =   600
            Width           =   1935
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
            Left            =   3600
            TabIndex        =   110
            Top             =   600
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
            Height          =   285
            Index           =   8
            Left            =   120
            TabIndex        =   109
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
            Height          =   285
            Index           =   9
            Left            =   7380
            TabIndex        =   108
            Top             =   1800
            Width           =   1515
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
            Height          =   285
            Index           =   10
            Left            =   7380
            TabIndex        =   107
            Top             =   2100
            Width           =   1515
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
            Height          =   285
            Index           =   11
            Left            =   120
            TabIndex        =   106
            Top             =   2460
            Width           =   1935
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
            Height          =   285
            Index           =   12
            Left            =   7380
            TabIndex        =   105
            Top             =   2460
            Width           =   1515
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
            TabIndex        =   104
            Top             =   1200
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
            Height          =   285
            Index           =   17
            Left            =   10440
            TabIndex        =   103
            Top             =   1200
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
            Height          =   285
            Index           =   18
            Left            =   7380
            TabIndex        =   102
            Top             =   1200
            Width           =   1515
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
            Height          =   285
            Index           =   23
            Left            =   120
            TabIndex        =   101
            Top             =   4200
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
            Height          =   285
            Index           =   24
            Left            =   7380
            TabIndex        =   100
            Top             =   4200
            Width           =   1515
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
            Height          =   285
            Index           =   25
            Left            =   120
            TabIndex        =   99
            Top             =   4500
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
            Height          =   285
            Index           =   33
            Left            =   120
            TabIndex        =   98
            Top             =   4800
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
            Height          =   285
            Index           =   34
            Left            =   120
            TabIndex        =   97
            Top             =   1200
            Width           =   1935
         End
         Begin VB.Shape Shape1 
            BackColor       =   &H00FFD7B7&
            BackStyle       =   1  'Opaque
            Height          =   3015
            Index           =   0
            Left            =   0
            Top             =   120
            Width           =   12855
         End
         Begin VB.Shape Shape1 
            BackColor       =   &H00FFFFC0&
            BackStyle       =   1  'Opaque
            Height          =   735
            Index           =   1
            Left            =   0
            Top             =   3120
            Width           =   12855
         End
         Begin VB.Shape Shape1 
            BackColor       =   &H00FFFF80&
            BackStyle       =   1  'Opaque
            Height          =   1335
            Index           =   2
            Left            =   0
            Top             =   3840
            Width           =   12855
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
         Left            =   600
         MaxLength       =   50
         TabIndex        =   39
         Top             =   6000
         Width           =   4095
      End
      Begin VB.TextBox mskLrcAmtAftDisc 
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
         Left            =   10800
         TabIndex        =   52
         Text            =   "0.00"
         Top             =   6000
         Width           =   1455
      End
      Begin VB.TextBox mskLrcDiscAmt 
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
         Left            =   9600
         TabIndex        =   51
         TabStop         =   0   'False
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   6000
         Width           =   1215
      End
      Begin VB.TextBox mskLrcDiscPer 
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
         Left            =   8400
         TabIndex        =   50
         Tag             =   "AhCode"
         Text            =   "0.00 %"
         Top             =   6000
         Width           =   1215
      End
      Begin VB.TextBox mskLrcAmtBefDisc 
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
         Left            =   6960
         TabIndex        =   49
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   6000
         Width           =   1455
      End
      Begin VB.TextBox mskLrcRate 
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
         Left            =   5880
         TabIndex        =   48
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   6000
         Width           =   1095
      End
      Begin VB.TextBox mskLrcUnit 
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
         TabIndex        =   47
         Tag             =   "AhCode"
         Text            =   "0"
         Top             =   6000
         Width           =   855
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd2 
         Height          =   1935
         Left            =   120
         TabIndex        =   36
         Top             =   5400
         Width           =   12855
         _ExtentX        =   22675
         _ExtentY        =   3413
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
         TabIndex        =   67
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
      TabIndex        =   62
      Top             =   720
      Width           =   14175
      Begin VB.Frame frPrintCRList 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   3615
         Left            =   3480
         TabIndex        =   136
         Top             =   1320
         Width           =   5895
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
            TabIndex        =   88
            Top             =   3000
            Width           =   855
         End
         Begin VB.TextBox mskLrcVchNo 
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
            TabIndex        =   82
            Tag             =   "AhCode"
            Text            =   "0"
            Top             =   960
            Width           =   1455
         End
         Begin VB.TextBox txtLrcVtmName 
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
            TabIndex        =   81
            Top             =   600
            Width           =   3495
         End
         Begin VB.TextBox mskLrcVchNo 
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
            TabIndex        =   83
            Tag             =   "AhCode"
            Text            =   "0"
            Top             =   960
            Width           =   1455
         End
         Begin VB.ComboBox cmbCRList 
            Height          =   315
            Left            =   2160
            Style           =   2  'Dropdown List
            TabIndex        =   84
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
            TabIndex        =   86
            Text            =   "0"
            Top             =   2040
            Width           =   1455
         End
         Begin VB.ComboBox cmbPrintDest 
            Height          =   315
            Left            =   2160
            Style           =   2  'Dropdown List
            TabIndex        =   87
            Top             =   2400
            Width           =   3495
         End
         Begin VB.ComboBox cmbPrinterList 
            Height          =   315
            Left            =   2160
            Style           =   2  'Dropdown List
            TabIndex        =   85
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
            TabIndex        =   144
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
            TabIndex        =   143
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
            TabIndex        =   142
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
            TabIndex        =   141
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
            TabIndex        =   140
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
            TabIndex        =   139
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
            TabIndex        =   138
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
            TabIndex        =   137
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
         TabIndex        =   90
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
            TabIndex        =   73
            Text            =   "0"
            Top             =   1080
            Width           =   1455
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
            Left            =   3120
            Style           =   1  'Graphical
            TabIndex        =   80
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
            TabIndex        =   75
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
               TabIndex        =   76
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
               TabIndex        =   77
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
               TabIndex        =   78
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
               TabIndex        =   79
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
            TabIndex        =   72
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
            TabIndex        =   71
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
            TabIndex        =   74
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
            TabIndex        =   95
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
            TabIndex        =   94
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
            TabIndex        =   93
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
            TabIndex        =   92
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
            TabIndex        =   91
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
         TabIndex        =   70
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
         TabIndex        =   68
         Top             =   360
         Width           =   4215
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd1 
         Height          =   6375
         Left            =   120
         TabIndex        =   69
         Top             =   720
         Width           =   13815
         _ExtentX        =   24368
         _ExtentY        =   11245
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
         TabIndex        =   89
         Top             =   360
         Width           =   735
      End
   End
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Lab Receipt"
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
      TabIndex        =   61
      Top             =   0
      Width           =   9015
   End
End
Attribute VB_Name = "frmLabReceipt"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Dim mFormLoaded As Boolean, mLastKeyPressed As Integer, mMaskKeyPressed As Integer
Dim mFormUIdCode As Long, mFormLrcUIdFileName As String, mFormLrcAcsPermFileName As String
Dim mLrcCode As Long, mLrcPttCode As Long, mQryPttCode As Long, mLrcOldLrcCode As Long, dtlAddEditMode As Boolean, dtlAddMode As Boolean, dtlEditCanceled As Boolean    ''' mLrcLpgCode As Long,
Dim dtlSdcAddEditMode As Boolean, dtlSdcAddMode As Boolean, dtlSdcEditCanceled As Boolean
Dim mRemoteAccess As Boolean, mEntrySaved As Boolean, mEntryAborted As Boolean
Dim dbAcDatabase As New ADODB.Connection, dbHmsDatabase As New ADODB.Connection, dbGrpDatabase As New ADODB.Connection, dbComDatabase As New ADODB.Connection
Dim datRecset As New ADODB.Recordset
Dim mPttCode_old As Long, mPttName_old As String, mPttRegNo_old As Long, mLrcRecdAmtTot_old As Double
Dim mLrcCode_old As Long, mLrcDate_old As Date, mLrcVtmCode_old As Long, mLrcVchNo_old As Long, mPttAhCode_old As Long, mPttAgeChanged As Boolean, mPttPcgCode_old As Long, mPttAraCode_old As Long, mLrcCDctCode_old As Long, mLrcRByCode_old As Long, mLrcRToCode_old As Long, mLrcTime_old As Long
Dim mLrcSrvCode_old As Long
Dim mSdcDctCode_old As Long
Dim clsJRN As clsJournal, clsAH As clsAccountHead, clsLRC As clsHmsLabMultiTranEntry, clsARA As clsComMastEntry, clsSTN As clsComMastEntry, clsVTM As clsComMastEntry, clsHOPT As clsHmsLabOptionsEntry     ''' clsLPG As clsHmsSnglTranEntry,
Dim clsPAT As clsHmsMasterEntry, clsPCG As clsHmsMasterEntry, clsDCT As clsHmsMasterEntry, clsDIG As clsHmsMasterEntry, clsSRV As clsHmsMasterEntry, clsDRL As clsHmsMasterEntry
Dim mActiveControl As Object, clsListStru As clsSelectQueryStructure
Dim fcmbAhName As clsComFlexSearch, fcmbAraName As clsComFlexSearch, fcmbStnName As clsComFlexSearch, fcmbLrcVtmName As clsComFlexSearch
Rem Dim fcmbOldLpgByLpgNo As clsHmsFlexSearch, fcmbOldLpgByPttRegNo As clsHmsFlexSearch, fcmbOldLpgByPttName As clsHmsFlexSearch
Dim fcmbPttName As clsHmsFlexSearch, fcmbPttRegNo As clsHmsFlexSearch, fcmbPcgName As clsHmsFlexSearch, fcmbCDctName As clsHmsFlexSearch, fcmbRByName As clsHmsFlexSearch, fcmbFDigName As clsHmsFlexSearch, fcmbSrvName As clsHmsFlexSearch, fcmbSDctName As clsHmsFlexSearch, fcmbDrlName As clsHmsFlexSearch

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
Const X2LRCICODE_COL = 0
Const X2LRCSNO_COL = 1
Const X2SRVNAME_COL = 2
Const X2SDCFLAG_COL = 3
Const X2LRCUNIT_COL = 4
Const X2LRCRATE_COL = 5
Const X2LRCAMTBEFDISC_COL = 6
Const X2LRCDISCPER_COL = 7
Const X2LRCDISCAMT_COL = 8
Const X2LRCAMTAFTDISC_COL = 9
Const X2LRCADVAMT_COL = 10
Const X2LRCRECDAMT_COL = 11
Const X2LRCDEPOAMT_COL = 12
Const X2LRCREFUAMT_COL = 13
Const X2LRCBALAMT_COL = 14
Const X2LRCSRVCODE_COL = 15
Const X2LRCRECSTATE_COL = 16
Const MFGRD2_COLS = 17

Rem service doctor column definitions
Const X3LRDICODE_COL = 0
Const X3LRDSNO_COL = 1
Const X3DCTNAME_COL = 2
Const X3DRLNAME_COL = 3
Const X3LRDREMARK_COL = 4
Const X3LRDDCTCODE_COL = 5
Const X3LRDDRLCODE_COL = 6
Const X3LRDRECSTATE_COL = 7
Const MFGRD3_COLS = 8

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
mLrcCode = mAccessCode
End Property

Public Property Get EntryBoundCode() As Long
EntryBoundCode = Val(mskFormBoundField.Text)
End Property

Public Property Get EntryDate() As Date
EntryDate = Ctod(dtpLrcDate.Text)
End Property

Public Property Get EntryType() As String
EntryType = "Lrc"
End Property

Public Property Get EntryVtmCode() As Integer
EntryVtmCode = Val(fcmbLrcVtmName.BoundText)
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

Public Property Get PatAddEditMode() As Integer
PatAddEditMode = cmbPatEntryMode.ListIndex
End Property

Public Property Let PatAddEditMode(ByVal New_PatEntryMode As Integer)
cmbPatEntryMode.ListIndex = New_PatEntryMode
ChkEntryModeSign cmbPatEntryMode

End Property

Private Sub chkPttDefAllowed_GotFocus()
FlashActiveControl chkPttDefAllowed, True
End Sub

Private Sub chkPttDefAllowed_LostFocus()
FlashActiveControl chkPttDefAllowed, False
End Sub

Private Sub chkPttDiscAllowed_GotFocus()
FlashActiveControl chkPttDiscAllowed, True
End Sub

Private Sub chkPttDiscAllowed_LostFocus()
FlashActiveControl chkPttDiscAllowed, False
End Sub

Private Sub chkPttInfAllowed_GotFocus()
FlashActiveControl chkPttInfAllowed, True
End Sub

Private Sub chkPttInfAllowed_LostFocus()
FlashActiveControl chkPttInfAllowed, False
End Sub

Private Sub chkPttShowInList_GotFocus()
FlashActiveControl chkPttShowInList, True
End Sub

Private Sub chkPttShowInList_LostFocus()
FlashActiveControl chkPttShowInList, False
End Sub

Private Sub cmbPttRefRela_GotFocus()
FlashActiveControl cmbPttRefRela, True
End Sub

Private Sub cmbPttRefRela_LostFocus()
FlashActiveControl cmbPttRefRela, False
End Sub

Private Sub cmbPttRefRela_Validate(Cancel As Boolean)
If cmbPttRefRela.ListIndex = -1 Then
    ErrorBox "Invalid Selection !!!"
    cmbPttRefRela.SetFocus
    Cancel = True
End If

End Sub

Private Sub cmbPttSex_GotFocus()
FlashActiveControl cmbPttSex, True
End Sub

Private Sub cmbPttSex_LostFocus()
FlashActiveControl cmbPttSex, False
End Sub

Private Sub cmbPttSex_Validate(Cancel As Boolean)
If cmbPttSex.ListIndex = -1 Then
    ErrorBox "Invalid Selection !!!"
    cmbPttSex.SetFocus
    Cancel = True
End If

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
                    dtpFromDate.Text = Dtoc(MonthStartDate(DateSerial(Val(Left(.fields("LrcYrMonth"), 4)), Val(Right(.fields("LrcYrMonth"), 2)), 1)))
                    dtpToDate.Text = Dtoc(MonthEndDate(DateSerial(Val(Left(.fields("LrcYrMonth"), 4)), Val(Right(.fields("LrcYrMonth"), 2)), 1)))
                    optMonthwise.Value = False
                    optDatewise.Value = True
                ElseIf optDatewise.Value = True Then
                    dtpFromDate.Text = Dtoc(.fields("LhrDate"))
                    dtpToDate.Text = Dtoc(.fields("LhrDate"))
                    optDatewise.Value = False
                    optDetailed.Value = True
                ElseIf optPatientwise.Value = True Then
                    Call ChkPttNameListFirstTime
                    Call ChkPttRegNoListFirstTime
                    
                    mQryPttCode = .fields("LhrPttCode")
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
    End If
ElseIf Screen.ActiveControl.Name = txtSdcFlag.Name Then
    txtSdcFlag_KeyPress vbKeyReturn
    If frSdcDtl.Visible = False Then
        SendKeys "{tab}"
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

ElseIf dtlSdcAddEditMode = True Then
    dtlSdcEditCanceled = True
    Call cmdSdcOK_Click

ElseIf frSdcDtl.Visible = True Then
    ShowSdcEntryMode False
    mskLrcUnit.SetFocus
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
Dim tRecset As New ADODB.Recordset, srow As Integer, mLrcSno As Integer, mLrcICode As Long, mReqdRecdAmt As Double

srow = Mfgrd2.Row
mLrcSno = Val(Mfgrd2.TextMatrix(srow, X2LRCSNO_COL))
mLrcICode = Val(Mfgrd2.TextMatrix(srow, X2LRCICODE_COL))

Call ValidDtl    ' to check any service doctor detail for multidoctor detail service for false

If cmdOK.Caption = "&OK" And dtlEditCanceled = False Then
    With clsLRC
    If dtlAddMode = True Then
        .ClearDtl
    Else
        .GetDtlData mLrcCode, mLrcICode
    End If
    .mTrnCode_lng = mLrcCode
    .mTrnDtlSno_int = Val(UnMyNumFmt(mskLrcSno.Text))
    .mTrnDate_dt = Ctod(dtpLrcDate.Text)
    .mTrnCmpCode_int = sFinYrCmpCode
    
    .mLrcPttCode_lng = mLrcPttCode
    .mLrcSrvCode_lng = Val(fcmbSrvName.BoundText)
    .mLrcUnit_dbl = Val(UnMyNumFmt(mskLrcUnit.Text))
    .mLrcRate_dbl = Val(UnMyNumFmt(mskLrcRate.Text))
    .mLrcAmtBefDisc_dbl = Val(UnMyNumFmt(mskLrcAmtBefDisc.Text))
    .mLrcDiscPer_dbl = Val(UnMyPerFmt(mskLrcDiscPer.Text))
    .mLrcDiscAmt_dbl = Val(UnMyNumFmt(mskLrcDiscAmt.Text))
    .mLrcAmtAftDisc_dbl = Val(UnMyNumFmt(mskLrcAmtAftDisc.Text))
    .mLrcRemark_str = ""
    
    If dtlAddMode = True Then
        .mLrcAdvAmt_dbl = 0 ' advance adjustment
        .mLrcRecdAmt_dbl = 0 ' .mLrcAmtAftDisc_dbl - .mLrcAdvAmt_dbl
        .mLrcDepoAmt_dbl = 0
        .mLrcRefuAmt_dbl = 0 ' refund adjustment
        .mLrcBalAmt_dbl = 0 ' automated in stored procedure
        
        If .AddNewDtl(mLrcCode) = True Then
            Rem dbHmsDatabase.BeginTrans
            Rem dbHmsDatabase.Execute "Update LabRcDctDtl set LrdLrcCode = " & CStr(.mTrnDtlICode_lng) & " where LrdCode = " & CStr(mLrcCode) & " and LrdLrcCode=" & CStr(mLrcICode) & ""
            Rem dbHmsDatabase.CommitTrans
            
            mLrcICode = .mTrnDtlICode_lng
        End If
    Else
        .UpdateDtl mLrcCode, mLrcICode
    End If
    End With
    
    RefreshDatabase dbHmsDatabase
    With tRecset
    .open "Select * from LabRcpt where LrcCode=" & CStr(mLrcCode) & " and LrcICode=" & CStr(mLrcICode) & "", dbHmsDatabase, adOpenKeyset, adLockOptimistic
    
    clsSRV.GetData .fields("LrcSrvCode")
    
    Mfgrd2.TextMatrix(srow, X2LRCICODE_COL) = .fields("LrcICode")
    Mfgrd2.TextMatrix(srow, X2LRCSNO_COL) = ToMyNumFmt(.fields("LrcSno"), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2SRVNAME_COL) = clsSRV.mName_str
    If GetServDctDtlCount(cnn:=dbHmsDatabase, mTableName:="LabRcDctDtl", mSdcCodeField:="LrdCode", mSdcCode:=.fields("LrcCode"), mSdcSubCodeField:="LrdLrcCode", mSdcSubCode:=.fields("LrcICode")) > 0 Then
        Mfgrd2.TextMatrix(srow, X2SDCFLAG_COL) = "Y"
    Else
        If clsSRV.mSrvMultiDctIncl_bln = True Then
            Mfgrd2.TextMatrix(srow, X2SDCFLAG_COL) = "N"
        Else
            Mfgrd2.TextMatrix(srow, X2SDCFLAG_COL) = ""
        End If
    End If
    Mfgrd2.TextMatrix(srow, X2LRCUNIT_COL) = ToMyNumFmt(.fields("LrcUnit"), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2LRCRATE_COL) = ToMyNumFmt(.fields("LrcRate"))
    Mfgrd2.TextMatrix(srow, X2LRCAMTBEFDISC_COL) = ToMyNumFmt(.fields("LrcAmtBefDisc"))
    Mfgrd2.TextMatrix(srow, X2LRCDISCPER_COL) = ToMyPerFmt(.fields("LrcDiscPer"))
    Mfgrd2.TextMatrix(srow, X2LRCDISCAMT_COL) = ToMyNumFmt(.fields("LrcDiscAmt"))
    Mfgrd2.TextMatrix(srow, X2LRCAMTAFTDISC_COL) = ToMyNumFmt(.fields("LrcAmtAftDisc"))
    Mfgrd2.TextMatrix(srow, X2LRCADVAMT_COL) = ToMyNumFmt(.fields("LrcAdvAmt"))
    Mfgrd2.TextMatrix(srow, X2LRCRECDAMT_COL) = ToMyNumFmt(.fields("LrcRecdAmt"))
    Mfgrd2.TextMatrix(srow, X2LRCDEPOAMT_COL) = ToMyNumFmt(.fields("LrcDepoAmt"))
    Mfgrd2.TextMatrix(srow, X2LRCREFUAMT_COL) = ToMyNumFmt(.fields("LrcRefuAmt"))
    Mfgrd2.TextMatrix(srow, X2LRCBALAMT_COL) = ToMyNumFmt(.fields("LrcBalAmt"))
    Mfgrd2.TextMatrix(srow, X2LRCSRVCODE_COL) = .fields("LrcSrvCode")
    Mfgrd2.TextMatrix(srow, X2LRCRECSTATE_COL) = .fields("LrcRecState")
    
    End With
    CloseTable tRecset
    
    If dtlAddMode = True Then
        Mfgrd2.Rows = Mfgrd2.Rows + 1
    End If
    srow = srow + 1
    Mfgrd2.Row = srow
    
    Call CalcFtrTotal
Else
    clsLRC.CancelSdcTran mLrcCode, mLrcICode
End If
dtlAddEditMode = False
dtlAddMode = False
dtlEditCanceled = False
ShowSdcEntryMode False
VisibleControls False
Mfgrd2.SetFocus
CloseTable tRecset, mCheckOpen:=True

End Sub

Private Sub cmdSaveForm_Click()
txtVoid.SetFocus
Call Data_SaveEvent
Call SmryList

If optDetailed.Value = True Then
    txtSearch1Text_InterActiveChange Format(Ctod(dtpLrcDate.Text), "yyyymmdd") + Format(mLrcCode, "0000000")
ElseIf optMonthwise.Value = True Then
    txtSearch1Text_InterActiveChange Format(Ctod(dtpLrcDate.Text), "yyyy") & "/" & Format(Ctod(dtpLrcDate.Text), "mm")
ElseIf optDatewise.Value = True Then
    txtSearch1Text_InterActiveChange Format(Ctod(dtpLrcDate.Text), "yyyymmdd")
ElseIf optPatientwise.Value = True Then
    txtSearch1Text_InterActiveChange txtPttName.Text
End If

Call ShowEntryMode(False)
Mfgrd1.SetFocus

End Sub

Private Sub cmdSaveForm_GotFocus()
Dim mLrcAcsPermNo As Integer, mRetryCount As Integer

txtVoid.SetFocus
cmdSaveForm.Enabled = False
If Data_Verify() = True Then
    If CanAccept() = True Then
        If GetAccessPerm(mLrcAcsPermNo, mRetryCount, mFormLrcAcsPermFileName) = True And mRetryCount = 0 Then
            If Data_NetwAuth() = True Then
                Call cmdSaveForm_Click
                Close #mLrcAcsPermNo
                If mRemoteAccess = True Then
                    ''Unload Me
                    Me.Hide
                    Exit Sub
                Else
                    Call Mfgrd1_RowColChange
                    Data_PrintDialog "SaveEvent"
                End If
            Else
                Close #mLrcAcsPermNo
            End If
        Else
            Close #mLrcAcsPermNo
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
Dim tRecset As New ADODB.Recordset, srow As Integer, mLrdSno As Integer, mLrdICode As Long, mLrdLrcCode As Long, mLrdSrvCode As Long

srow = Mfgrd3.Row
mLrdSno = Val(Mfgrd3.TextMatrix(srow, X3LRDSNO_COL))
mLrdICode = Val(Mfgrd3.TextMatrix(srow, X3LRDICODE_COL))
mLrdLrcCode = Val(Mfgrd2.TextMatrix(Mfgrd2.Row, X2LRCICODE_COL))
mLrdSrvCode = Val(fcmbSrvName.BoundText)

If cmdOK.Caption = "&OK" And dtlSdcEditCanceled = False Then
    With clsLRC
    If dtlSdcAddMode = True Then
        .ClearSdc
    Else
        .GetSdcData mLrcCode, mLrdLrcCode, mLrdICode
    End If
    .mSdcCode_lng = mLrcCode
    .mSdcSubCode_lng = mLrdLrcCode
    .mSdcSno_int = Val(UnMyNumFmt(mskLrdSno.Text))
    .mSdcDate_dt = Ctod(dtpLrcDate.Text)
    .mSdcSrvCode_lng = mLrdSrvCode
    .mSdcPttCode_lng = mLrcPttCode
    .mSdcDctCode_lng = Val(fcmbSDctName.BoundText)
    .mSdcDrlCode_lng = Val(fcmbDrlName.BoundText)
    .mSdcRemark_str = txtLrdRemark.Text
    .mSdcCmpCode_int = sFinYrCmpCode
    
    If dtlSdcAddMode = True Then
        .AddNewSdc mLrcCode, mLrdLrcCode
        mLrdICode = .mSdcICode_lng
    Else
        .UpdateSdc mLrcCode, mLrdLrcCode, mLrdICode
    End If
    End With
    
    RefreshDatabase dbHmsDatabase
    With tRecset
    .open "Select * from LabRcDctDtl where LrdCode = " & CStr(mLrcCode) & " and LrdLrcCode = " & CStr(mLrdLrcCode) & " and LrdICode = " & CStr(mLrdICode) & "", dbHmsDatabase, adOpenKeyset, adLockOptimistic
    
    clsDCT.GetData .fields("LrdDctCode")
    clsDRL.GetData .fields("LrdDrlCode")
    
    Mfgrd3.TextMatrix(srow, X3LRDICODE_COL) = .fields("LrdICode")
    Mfgrd3.TextMatrix(srow, X3LRDSNO_COL) = ToMyNumFmt(.fields("LrdSno"), mDecimals:=0)
    Mfgrd3.TextMatrix(srow, X3DCTNAME_COL) = clsDCT.mName_str
    Mfgrd3.TextMatrix(srow, X3DRLNAME_COL) = clsDRL.mName_str
    Mfgrd3.TextMatrix(srow, X3LRDREMARK_COL) = .fields("LrdRemark")
    Mfgrd3.TextMatrix(srow, X3LRDDCTCODE_COL) = .fields("LrdDctCode")
    Mfgrd3.TextMatrix(srow, X3LRDDRLCODE_COL) = .fields("LrdDrlCode")
    Mfgrd3.TextMatrix(srow, X3LRDRECSTATE_COL) = .fields("LrdRecState")
    
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

'''Private Sub dtpLpgDate_GotFocus()
'''FlashActiveControl dtpLpgDate, True
'''End Sub
'''
'''Private Sub dtpLpgDate_LostFocus()
'''FlashActiveControl dtpLpgDate, False
'''End Sub
'''
'''Private Sub dtpLpgDate_Validate(Cancel As Boolean)
'''dtpLpgDate.Text = ToMyDate(dtpLpgDate.Text)
'''If IsDate(dtpLpgDate.Text) = False Then
'''    ErrorBox "Invalid Input !!!"
'''    dtpLpgDate.SetFocus
'''    Cancel = True
'''End If
'''
'''End Sub

Private Sub dtpLrcDate_GotFocus()
FlashActiveControl dtpLrcDate, True
End Sub

Private Sub dtpLrcDate_LostFocus()
FlashActiveControl dtpLrcDate, False
End Sub

Private Sub dtpLrcDate_Validate(Cancel As Boolean)
dtpLrcDate.Text = ToMyDate(dtpLrcDate.Text)
If IsFinYrDate(Ctod(dtpLrcDate.Text)) = False Then
    ErrorBox "Invalid Input !!!"
    dtpLrcDate.SetFocus
    Cancel = True
Else
'''    Call ChkServRate
'''    Call CalcLrcChg
End If

End Sub

Private Sub dtpPttAgeAsOnDt_Change()
mPttAgeChanged = True
End Sub

Private Sub dtpPttAgeAsOnDt_GotFocus()
FlashActiveControl dtpPttAgeAsOnDt, True
mPttAgeChanged = False
End Sub

Private Sub dtpPttAgeAsOnDt_LostFocus()
FlashActiveControl dtpPttAgeAsOnDt, False
End Sub

Private Sub dtpPttAgeAsOnDt_Validate(Cancel As Boolean)
dtpPttAgeAsOnDt.Text = ToMyDate(dtpPttAgeAsOnDt.Text)
If IsDate(dtpPttAgeAsOnDt.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpPttAgeAsOnDt.SetFocus
    Cancel = True
Else
    If mPttAgeChanged = True Then
        Call ShowPttDob
    End If
End If

End Sub

Private Sub dtpPttDob_Change()
mPttAgeChanged = True
End Sub

Private Sub dtpPttDob_GotFocus()
FlashActiveControl dtpPttDob, True
mPttAgeChanged = False
End Sub

Private Sub dtpPttDob_LostFocus()
FlashActiveControl dtpPttDob, False
End Sub

Private Sub dtpPttDob_Validate(Cancel As Boolean)
Dim mYears As Long, mMonths As Long, mDays As Long

dtpPttDob.Text = ToMyDate(dtpPttDob.Text)
If IsDate(dtpPttDob.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpPttDob.SetFocus
    Cancel = True
Else
    If mPttAgeChanged = True Then
        Call ShowPatAge
    End If
End If

End Sub

Private Sub dtpPttRegDate_Change()
mPttAgeChanged = True
End Sub

Private Sub dtpPttRegDate_GotFocus()
mPttAgeChanged = False
FlashActiveControl dtpPttRegDate, True
End Sub

Private Sub dtpPttRegDate_LostFocus()
FlashActiveControl dtpPttRegDate, False
End Sub

Private Sub dtpPttRegDate_Validate(Cancel As Boolean)
dtpPttRegDate.Text = ToMyDate(dtpPttRegDate.Text)
If IsDate(dtpPttRegDate.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpPttRegDate.SetFocus
    Cancel = True
Else
    If mPttAgeChanged = True Then
        dtpPttAgeAsOnDt.Text = dtpPttRegDate.Text
        Call ShowPttDob
    End If
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
If mFormLoaded = False Then
    If mRemoteAccess = True Then
        MoveRecToFirst datRecset
        ShowRecActiveFlexRow datRecset, Mfgrd1
        Mfgrd1.SetFocus
        If mLrcCode = 0 Then
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

mFormLrcUIdFileName = "LabRcpt.Uid"
mFormLrcAcsPermFileName = "LabRcpt.Acp"
mFormUIdCode = GetUIdCode(mProcess:=Me.Name, mUIdFileName:=mFormLrcUIdFileName, mAcsPermFileName:=mFormLrcAcsPermFileName)

mFormLoaded = False
mEntrySaved = False: mEntryAborted = False
SetFormSize Me, frmMain
Call Form_Resize

Call SetVoidControl(txtVoid)
txtSearch1Text.Enabled = False
frConfigure.Visible = False
frPrintCRList.Visible = False
txtSdcFlag.Locked = True
mskLrcDiscPer.Tag = False
mskLrcDiscAmt.Tag = False

ChkCustomForm Me, CfsFileFullPath("LabRcpt.Cfs")

OpenAcDataSource dbAcDatabase
OpenHmsDataSource dbHmsDatabase
OpenGrpDataSource dbGrpDatabase
OpenComDataSource dbComDatabase

cmbPttSex.Clear
cmbPttSex.AddItem "Male"
cmbPttSex.AddItem "Female"
cmbPttSex.AddItem "None"

cmbPttRefRela.Clear
cmbPttRefRela.AddItem "C/o"
cmbPttRefRela.AddItem "S/o"
cmbPttRefRela.AddItem "D/o"
cmbPttRefRela.AddItem "W/o"
cmbPttRefRela.AddItem "F/o"
cmbPttRefRela.AddItem "M/o"

Set clsListStru = New clsSelectQueryStructure

Set clsHOPT = New clsHmsLabOptionsEntry
clsHOPT.blnLabRcptOptMast = True
clsHOPT.Init
clsHOPT.GetLabRegOptData
clsHOPT.GetLabRcptOptData

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

'''Set clsLPG = New clsHmsSnglTranEntry
'''Set clsLPG.dbAcDatabase = dbAcDatabase
'''Set clsLPG.dbHmsDatabase = dbHmsDatabase
'''clsLPG.blnLabRegTran = True
'''clsLPG.Init

Set clsLRC = New clsHmsLabMultiTranEntry
Set clsLRC.dbAcDatabase = dbAcDatabase
Set clsLRC.dbHmsDatabase = dbHmsDatabase
clsLRC.blnLabRcptTran = True
clsLRC.Init

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

Set clsVTM = New clsComMastEntry
Set clsVTM.dbAcDatabase = dbAcDatabase
clsVTM.blnVTypeMast = True
clsVTM.Init

Set fcmbAhName = New clsComFlexSearch
Set fcmbAhName.dbAcDatabase = dbAcDatabase
fcmbAhName.blnAchdMastList = True
fcmbAhName.Init

Set fcmbAraName = New clsComFlexSearch
Set fcmbAraName.dbAcDatabase = dbAcDatabase
fcmbAraName.blnAreaMastList = True
fcmbAraName.Init

Set fcmbStnName = New clsComFlexSearch
Set fcmbStnName.dbAcDatabase = dbAcDatabase
fcmbStnName.blnStationMastList = True
fcmbStnName.Init

Set fcmbPcgName = New clsHmsFlexSearch
Set fcmbPcgName.dbHmsDatabase = dbHmsDatabase
fcmbPcgName.blnPatCatgMstList = True
fcmbPcgName.Init

Set fcmbLrcVtmName = New clsComFlexSearch
Set fcmbLrcVtmName.dbAcDatabase = dbAcDatabase
fcmbLrcVtmName.blnVTypeMastList = True
fcmbLrcVtmName.mListSqlExpr = "Select * from VTypMast where VtmSysCode=" & CStr(cHMS_VTYPE_LAB_RCPT) & " order by VtmName"
fcmbLrcVtmName.Init

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

Set fcmbSDctName = New clsHmsFlexSearch
Set fcmbSDctName.dbHmsDatabase = dbHmsDatabase
fcmbSDctName.blnDoctMastList = True
fcmbSDctName.Init

Set fcmbDrlName = New clsHmsFlexSearch
Set fcmbDrlName.dbHmsDatabase = dbHmsDatabase
fcmbDrlName.blnDoctRoleMastList = True
fcmbDrlName.Init

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

'''Set fcmbOldLpgByLpgNo = New clsHmsFlexSearch
'''Set fcmbOldLpgByLpgNo.dbHmsDatabase = dbHmsDatabase
'''Set fcmbOldLpgByLpgNo.dbComDatabase = dbComDatabase
'''fcmbOldLpgByLpgNo.blnOldLpgListByLpgNo = True
'''fcmbOldLpgByLpgNo.mFiltCond = "0 = 1"
'''fcmbOldLpgByLpgNo.Init
'''
'''Set fcmbOldLpgByPttRegNo = New clsHmsFlexSearch
'''Set fcmbOldLpgByPttRegNo.dbHmsDatabase = dbHmsDatabase
'''Set fcmbOldLpgByPttRegNo.dbComDatabase = dbComDatabase
'''fcmbOldLpgByPttRegNo.blnOldLpgListByPttRegNo = True
'''fcmbOldLpgByPttRegNo.mFiltCond = "0 = 1"
'''fcmbOldLpgByPttRegNo.Init
'''
'''Set fcmbOldLpgByPttName = New clsHmsFlexSearch
'''Set fcmbOldLpgByPttName.dbHmsDatabase = dbHmsDatabase
'''Set fcmbOldLpgByPttName.dbComDatabase = dbComDatabase
'''fcmbOldLpgByPttName.blnOldLpgListByPttName = True
'''fcmbOldLpgByPttName.mFiltCond = "0 = 1"
'''fcmbOldLpgByPttName.Init

Call RestoreDefaultSmryPara
If mRemoteAccess = True Then
    optDetailed.Value = True
    AddSmryParaLayer mClear:=True
End If

If mRemoteAccess = True Then
    datRecset.open "Select * from LabHdr inner join PatMast on LabHdr.LhrPttCode = PatMast.PttCode where LhrCode = " & CStr(mLrcCode) & " order by LhrDate,LhrTime", dbHmsDatabase, adOpenKeyset, adLockOptimistic
    dtpFromDate.Text = Dtoc(datRecset.fields("LhrDate"))
    dtpToDate.Text = Dtoc(datRecset.fields("LhrDate"))
    AddSmryParaLayer mClear:=True
    
Else
    datRecset.open "Select * from LabHdr inner join PatMast on LabHdr.LhrPttCode = PatMast.PttCode order by LhrDate,LhrTime", dbHmsDatabase, adOpenKeyset, adLockOptimistic
End If
Mfgrd1.FixedCols = 0
Call SmryList

Mfgrd2.FixedRows = 1: Mfgrd2.FixedCols = 0: Mfgrd2.Rows = 2: Mfgrd2.Cols = MFGRD2_COLS: SetGridAutoHeight Mfgrd2

colcnt = X2LRCICODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2LRCICODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2LRCSNO_COL: Mfgrd2.ColWidth(colcnt) = mskLrcSno.Width: Mfgrd2.TextMatrix(0, colcnt) = "Sno": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SRVNAME_COL: Mfgrd2.ColWidth(colcnt) = txtSrvName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Service Name": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2SDCFLAG_COL: Mfgrd2.ColWidth(colcnt) = txtSdcFlag.Width: Mfgrd2.TextMatrix(0, colcnt) = "Dtl": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2LRCUNIT_COL: Mfgrd2.ColWidth(colcnt) = mskLrcUnit.Width: Mfgrd2.TextMatrix(0, colcnt) = "Unit": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2LRCRATE_COL: Mfgrd2.ColWidth(colcnt) = mskLrcRate.Width: Mfgrd2.TextMatrix(0, colcnt) = "Rate": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2LRCAMTBEFDISC_COL: Mfgrd2.ColWidth(colcnt) = mskLrcAmtBefDisc.Width: Mfgrd2.TextMatrix(0, colcnt) = "Basic Amt": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2LRCDISCPER_COL: Mfgrd2.ColWidth(colcnt) = mskLrcDiscPer.Width: Mfgrd2.TextMatrix(0, colcnt) = "Disc.%": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2LRCDISCAMT_COL: Mfgrd2.ColWidth(colcnt) = mskLrcDiscAmt.Width: Mfgrd2.TextMatrix(0, colcnt) = "Disc.Amt": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2LRCAMTAFTDISC_COL: Mfgrd2.ColWidth(colcnt) = mskLrcAmtAftDisc.Width: Mfgrd2.TextMatrix(0, colcnt) = "Amount": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2LRCADVAMT_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2LRCADVAMT_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2LRCRECDAMT_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2LRCRECDAMT_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2LRCDEPOAMT_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2LRCDEPOAMT_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2LRCREFUAMT_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2LRCREFUAMT_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2LRCBALAMT_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2LRCBALAMT_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2LRCSRVCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2LRCSRVCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2LRCRECSTATE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2LRCRECSTATE_COL": Mfgrd2.ColAlignment(colcnt) = 7

colcnt = X2LRCSNO_COL: mskLrcSno.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2SRVNAME_COL: txtSrvName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2SDCFLAG_COL: txtSdcFlag.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2LRCUNIT_COL: mskLrcUnit.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2LRCRATE_COL: mskLrcRate.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2LRCAMTBEFDISC_COL: mskLrcAmtBefDisc.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2LRCDISCPER_COL: mskLrcDiscPer.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2LRCDISCAMT_COL: mskLrcDiscAmt.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2LRCAMTAFTDISC_COL: mskLrcAmtAftDisc.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
cmdOK.Left = mskLrcAmtAftDisc.Left + mskLrcAmtAftDisc.Width

lblLrcUnitTot.Left = mskLrcUnit.Left - frFooter.Left: lblLrcUnitTot.Width = mskLrcUnit.Width
lblLrcAmtBefDiscTot.Left = mskLrcAmtBefDisc.Left - frFooter.Left: lblLrcAmtBefDiscTot.Width = mskLrcAmtBefDisc.Width
lblLrcDiscAmtTot.Left = mskLrcDiscAmt.Left - frFooter.Left: lblLrcDiscAmtTot.Width = mskLrcDiscAmt.Width
lblLrcAmtAftDiscTot.Left = mskLrcAmtAftDisc.Left - frFooter.Left: lblLrcAmtAftDiscTot.Width = mskLrcAmtAftDisc.Width

Rem service doctor detail flexgrid
Mfgrd3.FixedRows = 1: Mfgrd3.FixedCols = 0: Mfgrd3.Rows = 2: Mfgrd3.Cols = MFGRD3_COLS
colcnt = X3LRDICODE_COL: Mfgrd3.ColWidth(colcnt) = 0: Mfgrd3.TextMatrix(0, colcnt) = "X3LRDICODE_COL": Mfgrd3.ColAlignment(colcnt) = 7
colcnt = X3LRDSNO_COL: Mfgrd3.ColWidth(colcnt) = mskLrdSno.Width: Mfgrd3.TextMatrix(0, colcnt) = "Sno": Mfgrd3.ColAlignment(colcnt) = 7
colcnt = X3DCTNAME_COL: Mfgrd3.ColWidth(colcnt) = txtSDctName.Width: Mfgrd3.TextMatrix(0, colcnt) = "Doctor Name": Mfgrd3.ColAlignment(colcnt) = 1
colcnt = X3DRLNAME_COL: Mfgrd3.ColWidth(colcnt) = txtDrlName.Width: Mfgrd3.TextMatrix(0, colcnt) = "Doctor Role": Mfgrd3.ColAlignment(colcnt) = 1
colcnt = X3LRDREMARK_COL: Mfgrd3.ColWidth(colcnt) = txtLrdRemark.Width: Mfgrd3.TextMatrix(0, colcnt) = "Remark": Mfgrd3.ColAlignment(colcnt) = 1
colcnt = X3LRDDCTCODE_COL: Mfgrd3.ColWidth(colcnt) = 0: Mfgrd3.TextMatrix(0, colcnt) = "X3LRDDCTCODE_COL": Mfgrd3.ColAlignment(colcnt) = 7
colcnt = X3LRDDRLCODE_COL: Mfgrd3.ColWidth(colcnt) = 0: Mfgrd3.TextMatrix(0, colcnt) = "X3LRDDRLCODE_COL": Mfgrd3.ColAlignment(colcnt) = 7
colcnt = X3LRDRECSTATE_COL: Mfgrd3.ColWidth(colcnt) = 0: Mfgrd3.TextMatrix(0, colcnt) = "X3LRDRECSTATE_COL": Mfgrd3.ColAlignment(colcnt) = 7

colcnt = X3LRDSNO_COL: mskLrdSno.Left = Mfgrd3.Left + Mfgrd3.ColPos(colcnt)
colcnt = X3DCTNAME_COL: txtSDctName.Left = Mfgrd3.Left + Mfgrd3.ColPos(colcnt)
colcnt = X3DRLNAME_COL: txtDrlName.Left = Mfgrd3.Left + Mfgrd3.ColPos(colcnt)
colcnt = X3LRDREMARK_COL: txtLrdRemark.Left = Mfgrd3.Left + Mfgrd3.ColPos(colcnt)
cmdSdcOK.Left = txtLrdRemark.Left + txtLrdRemark.Width

ShowEntryMode False
VisibleControls False
ShowSdcEntryMode False
ShowStatusBarText StatusBar1

End Sub

Private Sub mskLrcDiscAmt_Change()
If InterActiveChange(mskLrcDiscAmt) = True Then
    mskLrcDiscAmt.Tag = True
    mskLrcDiscPer.Tag = False
End If

End Sub

Private Sub mskLrcDiscPer_Change()
If InterActiveChange(mskLrcDiscPer) = True Then
    mskLrcDiscPer.Tag = True
    mskLrcDiscAmt.Tag = False
End If

End Sub

Private Sub mskPttDiscPer_GotFocus()
FlashActiveControl mskPttDiscPer, True
End Sub

Private Sub mskPttDiscPer_LostFocus()
FlashActiveControl mskPttDiscPer, False
End Sub

Private Sub mskPttDiscPer_Validate(Cancel As Boolean)
Dim mPttDiscPer As Double

mPttDiscPer = Val(UnMyPerFmt(mskPttDiscPer.Text))
mskPttDiscPer.Text = ToMyPerFmt(mPttDiscPer)
If mPttDiscPer < 0 Then
    ErrorBox "Invalid Discount Percentage !!!"
    mskPttDiscPer.SetFocus
    Cancel = True
Else
'''    If FormAddEditMode = cFORM_ADDMODE And mPttDiscPer > 0 Then
'''        Call CalcLpgChg
'''    End If
End If

End Sub

Private Sub StatusBar1_PanelClick(ByVal Panel As MSComctlLib.Panel)
ShowStatusBarText StatusBar1
End Sub

Private Sub Form_Resize()
lblFormHeading.Width = Me.Width
cmdFormEscape.Left = Me.Width - (cmdFormEscape.Width * 2)
cmdFormEnter.Left = Me.Width + cmdFormEscape.Width
frFormSmry.Left = (Me.Width - frFormSmry.Width) / 2: frFormSmry.Top = cmbFormEntryMode.Top + (cmbFormEntryMode.Height * 1.5)
frFormDtl.Left = (Me.Width - frFormDtl.Width) / 2: frFormDtl.Top = frFormSmry.Top

End Sub

Private Sub Form_Unload(Cancel As Integer)
Set clsHOPT = Nothing
Set clsJRN = Nothing
Set clsAH = Nothing
'''Set clsLPG = Nothing
Set clsLRC = Nothing
Set clsPAT = Nothing
Set clsPCG = Nothing
Set clsDCT = Nothing
Set clsDIG = Nothing
Set clsSRV = Nothing
Set clsDRL = Nothing
Set clsARA = Nothing
Set clsSTN = Nothing
Set clsVTM = Nothing
Set fcmbAhName = Nothing
Set fcmbPcgName = Nothing
Set fcmbAraName = Nothing
Set fcmbStnName = Nothing
'''Set fcmbOldLpgByLpgNo = Nothing
'''Set fcmbOldLpgByPttRegNo = Nothing
'''Set fcmbOldLpgByPttName = Nothing
Set fcmbPttRegNo = Nothing
Set fcmbPttName = Nothing
Set fcmbCDctName = Nothing
Set fcmbRByName = Nothing
Set fcmbFDigName = Nothing
Set fcmbLrcVtmName = Nothing
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
    PatAddEditMode = cFORM_SMRYMODE
End If

End Sub

Private Function Data_Verify() As Boolean
Dim mPttRegNo As Long, mLrcPttCode As Long, mLpgVchNo As Long, mLrcVchNo As Long
Dim mLrcAmtAftDiscTot As Double, mLrcAdvAmtTot As Double, mLrcRecdAmtTot As Double, mLrcDepoAmtTot As Double, mLrcRefuAmtTot As Double, mLrcBalAmtTot As Double

Data_Verify = False
If FormAddEditMode = cFORM_EDITMODE And Val(mskFormBoundField.Text) < 1 Then
    ErrorBox "Invalid Key Value !!!"
    txtPttName.SetFocus
    GoTo EndSub
End If
Rem patient validation
mLrcPttCode = Val(mskLrcPttCode.Text)
If FormAddEditMode = cFORM_EDITMODE And mLrcPttCode < 1 Then
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
    If mPttRegNo <> mPttRegNo_old Or FormAddEditMode = cFORM_ADDMODE Then
        If PatAddEditMode = cFORM_ADDMODE And mPttRegNo <> mPttRegNo_old And clsHOPT.mLpgPttRegNoAddModeChange_bln = False Then
            AlertBox "Change Prohibited in Add Mode !!!"
            mskPttRegNo.Text = ToMyNumFmt(mPttRegNo_old, mDecimals:=0)
            mskPttRegNo.SetFocus
            GoTo EndSub
            
        ElseIf PatAddEditMode = cFORM_EDITMODE And mPttRegNo <> mPttRegNo_old And clsHOPT.mLpgPttRegNoEditModeChange_bln = False Then
            AlertBox "Change Prohibited in Edit Mode !!!"
            mskPttRegNo.Text = ToMyNumFmt(mPttRegNo_old, mDecimals:=0)
            mskPttRegNo.SetFocus
            GoTo EndSub
            
        ElseIf mPttRegNo = 0 And clsHOPT.mLpgPttRegNoNotZero_bln = True Then
            AlertBox "Prohibited Zero Patient Reg.No. !!!"
            If PatAddEditMode = cFORM_ADDMODE Then
                If clsHOPT.mLpgPttRegNoAutoNumber_bln = True Then
                    mPttRegNo = GetNextSeqno(dbHmsDatabase, "PatMast", "PttRegNo")
                    mskPttRegNo.Text = ToMyNumFmt(mPttRegNo, mDecimals:=0)
                    mPttRegNo_old = mPttRegNo
                End If
            Else
                mskPttRegNo.Text = ToMyNumFmt(mPttRegNo_old, mDecimals:=0)
            End If
            mskPttRegNo.SetFocus
            GoTo EndSub
            
        ElseIf mPttRegNo <> 0 Then
            If ChkIsDuplicate(dbHmsDatabase, "PatMast", "PttRegNo", mPttRegNo, "PttCode", mLrcPttCode) = True Then
                ErrorBox "Duplicate Patient Reg.No. !!!"
                mskPttRegNo.SetFocus
                ' -----------
                If PatAddEditMode = cFORM_ADDMODE Then
                    If clsHOPT.mLpgPttRegNoAutoNumber_bln = True Then
                        mPttRegNo = GetNextSeqno(dbHmsDatabase, "PatMast", "PttRegNo")
                        mPttRegNo_old = mPttRegNo
                    End If
                Else
                    mPttRegNo = mPttRegNo_old
                End If
                mskPttRegNo.Text = ToMyNumFmt(mPttRegNo, mDecimals:=0)
                GoTo EndSub
            End If
            
        End If
    End If
End If
If IsDate(dtpPttRegDate.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpPttRegDate.SetFocus
    GoTo EndSub
End If
If cmbPttSex.ListIndex = -1 Then
    ErrorBox "Invalid Selection !!!"
    cmbPttSex.SetFocus
    GoTo EndSub
End If
If cmbPttRefRela.ListIndex = -1 Then
    ErrorBox "Invalid Selection !!!"
    cmbPttRefRela.SetFocus
    GoTo EndSub
End If
If Val(mskPttAgeYr.Text) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskPttAgeYr.SetFocus
    GoTo EndSub
End If
If Val(mskPttAgeMn.Text) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskPttAgeMn.SetFocus
    GoTo EndSub
End If
If Val(mskPttAgeDy.Text) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskPttAgeDy.SetFocus
    GoTo EndSub
End If
If True = False Then  ''' ruled out
    If Val(mskPttAgeYr.Text) < 1 And Val(mskPttAgeMn.Text) < 1 And Val(mskPttAgeDy.Text) < 1 Then
        ErrorBox "Invalid Input !!!"
        mskPttAgeYr.SetFocus
        GoTo EndSub
    End If
End If
If IsDate(dtpPttAgeAsOnDt.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpPttAgeAsOnDt.SetFocus
    GoTo EndSub
End If
If IsDate(dtpPttDob.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpPttDob.SetFocus
    GoTo EndSub
End If
If Val(fcmbAraName.BoundText) <= 0 Then
    ErrorBox "Invalid Selection !!!"
    txtAraName.SetFocus
    GoTo EndSub
End If
If Val(fcmbStnName.BoundText) <= 0 Then
    ErrorBox "Invalid Selection !!!"
    txtAraName.SetFocus
    GoTo EndSub
End If
If Val(fcmbPcgName.BoundText) <= 0 Then
    ErrorBox "Invalid Selection !!!"
    txtPcgName.SetFocus
    GoTo EndSub
End If
If Val(UnMyPerFmt(mskPttDiscPer.Text)) < 0 Then
    ErrorBox "Invalid Discount Percentage !!!"
    mskPttDiscPer.SetFocus
    GoTo EndSub
End If
If Val(fcmbAhName.BoundText) <= 0 Then
    ErrorBox "Invalid Account Name !!!"
    txtAhName.SetFocus
    GoTo EndSub
End If
If Val(UnMyPerFmt(mskLrcPttDiscPer.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskLrcPttDiscPer.SetFocus
    GoTo EndSub
End If
Rem lab registration validation
'''If Val(mskLrcLpgCode.Text) < 1 Then
'''    ErrorBox "Invalid Key Value !!!"
'''    txtPttName.SetFocus
'''    GoTo EndSub
'''End If
'''mLpgVchNo = Val(UnMyNumFmt(mskLpgVchNo.Text))
'''If mLpgVchNo < 1 Then
'''    ErrorBox "Invalid Input !!!"
'''    mskLpgVchNo.SetFocus
'''    GoTo EndSub
'''End If
'''If IsDate(dtpLpgDate.Text) = False Then
'''    ErrorBox "Invalid Input !!!"
'''    dtpLpgDate.SetFocus
'''    GoTo EndSub
'''End If
Rem lab receipt validations
mLrcVchNo = Val(UnMyNumFmt(mskLrcVchNo(0).Text))
If mLrcVchNo > 0 Then
    If mLrcVchNo <> mLrcVchNo_old Or Val(fcmbLrcVtmName.BoundText) <> mLrcVtmCode_old Or Ctod(dtpLrcDate.Text) <> mLrcDate_old Or FormAddEditMode = cFORM_ADDMODE Then
        If ChkIsDuplVTypeNo(dbHmsDatabase, dbAcDatabase, mTableName:="LabHdr", mChkFieldName:="LhrVchNo", mChkFieldValue:=mLrcVchNo, mKeyFieldName:="LhrCode", mKeyFieldValue:=mLrcCode, mVtmFieldName:="LhrVtmCode", mVtmFieldValue:=Val(fcmbLrcVtmName.BoundText), mFinYrFieldName:="LhrCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="LhrDate", mDateFieldValue:=Ctod(dtpLrcDate.Text)) = True Then
            ErrorBox "Duplicate Voucher No. !!!"
            mskLrcVchNo(0).SetFocus
            ' ---------------
            If FormAddEditMode = cFORM_ADDMODE Then
                mLrcVchNo = GetNextVTypeNo(dbHmsDatabase, dbAcDatabase, dbComDatabase, mTableName:="LabHdr", mFieldName:="LhrVchNo", mVtmFieldName:="LhrVtmCode", mVtmFieldValue:=Val(fcmbLrcVtmName.BoundText), mFinYrFieldName:="LhrCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="LhrDate", mDateFieldValue:=Ctod(dtpLrcDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormLrcAcsPermFileName)
            Else
                mLrcVchNo = mLrcVchNo_old
            End If
            mskLrcVchNo(0).Text = ToMyNumFmt(mLrcVchNo, mDecimals:=0)
            GoTo EndSub
        End If
    End If
Else
    ErrorBox "Invalid Input !!!"
    mskLrcVchNo(0).SetFocus
    GoTo EndSub
End If
If IsDate(dtpLrcDate.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpLrcDate.SetFocus
    GoTo EndSub
Else
    If IsFinYrDate(Ctod(dtpLrcDate.Text)) = False Then
        ErrorBox "Invalid Input !!!"
        dtpLrcDate.SetFocus
        GoTo EndSub
    End If
End If
If TimeToMin(txtLrcTime_str.Text) > cDAYMINUTES Then
    ErrorBox "Invalid Input !!!"
    txtLrcTime_str.SetFocus
    GoTo EndSub
End If
If Val(fcmbCDctName.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    txtCDctName.SetFocus
    GoTo EndSub
End If
'If Val(fcmbRByName.BoundText) <= 0 Then
'    ErrorBox "Invalid Selection !!!"
'    txtRByName.SetFocus
'    GoTo EndSub
'End If
If Val(fcmbFDigName.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    txtFDigName.SetFocus
    GoTo EndSub
End If

mLrcAmtAftDiscTot = Val(UnMyNumFmt(lblLrcAmtAftDiscTot.Caption))
If mLrcAmtAftDiscTot < 0 Then
    ErrorBox "Invalid Total After Discount !!!"
    Mfgrd2.SetFocus
    GoTo EndSub
End If
mLrcAdvAmtTot = Val(UnMyNumFmt(mskLrcAdvAmtTot.Text))
If mLrcAdvAmtTot < 0 Then
    ErrorBox "Invalid Input !!!"
    mskLrcAdvAmtTot.SetFocus
    GoTo EndSub
End If
mLrcRecdAmtTot = Val(UnMyNumFmt(mskLrcRecdAmtTot.Text))
If mLrcRecdAmtTot < 0 Then
    ErrorBox "Invalid Input !!!"
    mskLrcRecdAmtTot.SetFocus
    GoTo EndSub
End If
mLrcDepoAmtTot = Val(UnMyNumFmt(mskLrcDepoAmtTot.Text))
If mLrcDepoAmtTot < 0 Then
    ErrorBox "Invalid Input !!!"
    mskLrcDepoAmtTot.SetFocus
    GoTo EndSub
End If
mLrcRefuAmtTot = Val(UnMyNumFmt(mskLrcRefuAmtTot.Text))
If mLrcRefuAmtTot < 0 Then
    ErrorBox "Invalid Input !!!"
    mskLrcRefuAmtTot.SetFocus
    GoTo EndSub
End If
mLrcBalAmtTot = Val(UnMyNumFmt(mskLrcBalAmtTot.Text))
If mLrcBalAmtTot < 0 Then
    ErrorBox "Invalid Input !!!"
    mskLrcBalAmtTot.SetFocus
    GoTo EndSub
End If
If (mLrcAdvAmtTot + mLrcRecdAmtTot + mLrcDepoAmtTot) > mLrcAmtAftDiscTot Then
    ErrorBox "Excess Received Amount !!!"
    mskLrcRecdAmtTot.SetFocus
    GoTo EndSub
ElseIf mLrcRefuAmtTot > (mLrcAdvAmtTot + mLrcRecdAmtTot + mLrcDepoAmtTot) Then
    ErrorBox "Excess Amount Refunded !!!"
    mskLrcRecdAmtTot.SetFocus
    GoTo EndSub
End If

Data_Verify = True

EndSub:
Exit Function

End Function

Private Function Data_NetwAuth() As Boolean
Dim mLrcVchNo As Long, mPttRegNo As Long, mLrcPttCode As Long
Data_NetwAuth = False

mLrcPttCode = Val(mskLrcPttCode.Text)
mPttRegNo = Val(UnMyNumFmt(mskPttRegNo.Text))
If mPttRegNo <> mPttRegNo_old Or FormAddEditMode = cFORM_ADDMODE Then
    If mPttRegNo <> 0 Then
        If ChkIsDuplicate(dbHmsDatabase, "PatMast", "PttRegNo", mPttRegNo, "PttCode", mLrcPttCode) = True Then
            ErrorBox "Duplicate Patient Reg.No. !!!"
            mskPttRegNo.SetFocus
            ' -------
            If PatAddEditMode = cFORM_ADDMODE Then
                If clsHOPT.mLpgPttRegNoAutoNumber_bln = True Then
                    mPttRegNo = GetNextSeqno(dbHmsDatabase, "PatMast", "PttRegNo")
                    mPttRegNo_old = mPttRegNo
                End If
            Else
                mPttRegNo = mPttRegNo_old
            End If
            mskPttRegNo.Text = ToMyNumFmt(mPttRegNo, mDecimals:=0)
            Exit Function
        End If
    End If
End If

mLrcVchNo = Val(UnMyNumFmt(mskLrcVchNo(0).Text))
If mLrcVchNo <> mLrcVchNo_old Or Val(fcmbLrcVtmName.BoundText) <> mLrcVtmCode_old Or Ctod(dtpLrcDate.Text) <> mLrcDate_old Or FormAddEditMode = cFORM_ADDMODE Then
    If ChkIsDuplVTypeNo(dbHmsDatabase, dbAcDatabase, mTableName:="LabHdr", mChkFieldName:="LhrVchNo", mChkFieldValue:=mLrcVchNo, mKeyFieldName:="LhrCode", mKeyFieldValue:=mLrcCode, mVtmFieldName:="LhrVtmCode", mVtmFieldValue:=Val(fcmbLrcVtmName.BoundText), mFinYrFieldName:="LhrCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="LhrDate", mDateFieldValue:=Ctod(dtpLrcDate.Text)) = True Then
        ErrorBox "Duplicate Voucher No. !!!"
        mskLrcVchNo(0).SetFocus
        ' ---------------
        If FormAddEditMode = True Then
            mLrcVchNo = GetNextVTypeNo(dbHmsDatabase, dbAcDatabase, dbComDatabase, mTableName:="LabHdr", mFieldName:="LhrVchNo", mVtmFieldName:="LhrVtmCode", mVtmFieldValue:=Val(fcmbLrcVtmName.BoundText), mFinYrFieldName:="LhrCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="LhrDate", mDateFieldValue:=Ctod(dtpLrcDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormLrcAcsPermFileName)
        Else
            mLrcVchNo = mLrcVchNo_old
        End If
        mskLrcVchNo(0).Text = ToMyNumFmt(mLrcVchNo, mDecimals:=0)
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
Dim srow As Integer, mLrcICode As Long, mDeleteit As Boolean
srow = Mfgrd2.Row
mLrcICode = Val(Mfgrd2.TextMatrix(srow, X2LRCICODE_COL))

If MyDeleteKey(Shift, KeyCode, mCheckCtrlMask:=False) = True And mLrcICode > 0 Then
    mDeleteit = True
    If mDeleteit = True Then
        mDeleteit = CanDelete()
    End If
    If mDeleteit = True Then
        clsLRC.DeleteDtl mLrcCode, mLrcICode
        
        ShowDtlData mLrcCode
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
        mskLrcSno.Text = ToMyNumFmt(FlexNextSeqno(Mfgrd2, X2LRCSNO_COL), mDecimals:=0)
        mskLrcUnit.Text = ToMyNumFmt(1, mDecimals:=0)
        mskLrcDiscPer.Text = mskLrcPttDiscPer.Text
    Else
        mskLrcICode.Text = Val(Mfgrd2.TextMatrix(srow, X2LRCICODE_COL))
        mskLrcSno.Text = Mfgrd2.TextMatrix(srow, X2LRCSNO_COL)
        fcmbSrvName.BoundText = Mfgrd2.TextMatrix(srow, X2LRCSRVCODE_COL): txtSrvName.Text = fcmbSrvName.Text
        txtSdcFlag.Text = Mfgrd2.TextMatrix(srow, X2SDCFLAG_COL)
        mskLrcUnit.Text = Mfgrd2.TextMatrix(srow, X2LRCUNIT_COL)
        mskLrcRate.Text = Mfgrd2.TextMatrix(srow, X2LRCRATE_COL)
        mskLrcAmtBefDisc.Text = Mfgrd2.TextMatrix(srow, X2LRCAMTBEFDISC_COL)
        mskLrcDiscPer.Text = Mfgrd2.TextMatrix(srow, X2LRCDISCPER_COL)
        mskLrcDiscAmt.Text = Mfgrd2.TextMatrix(srow, X2LRCDISCAMT_COL)
        mskLrcAmtAftDisc.Text = Mfgrd2.TextMatrix(srow, X2LRCAMTAFTDISC_COL)
    End If
    txtSrvName.SetFocus
    Call ValidDtl
    
    mLrcSrvCode_old = Val(fcmbSrvName.BoundText)
End If

End Sub

Private Sub Mfgrd2_RowColChange()
ShowActiveFlexRow Mfgrd2

End Sub

Private Sub mskLrcAdvAmtTot_GotFocus()
FlashActiveControl mskLrcAdvAmtTot, True
End Sub

Private Sub mskLrcAdvAmtTot_LostFocus()
FlashActiveControl mskLrcAdvAmtTot, False
End Sub

Private Sub mskLrcAmtAftDisc_GotFocus()
FlashActiveControl mskLrcAmtAftDisc, True
End Sub

Private Sub mskLrcAmtAftDisc_LostFocus()
FlashActiveControl mskLrcAmtAftDisc, False
End Sub

Private Sub mskLrcAmtAftDisc_Validate(Cancel As Boolean)
mskLrcAmtAftDisc.Text = ToMyNumFmt(mskLrcAmtAftDisc.Text)
If Val(UnMyNumFmt(mskLrcAmtAftDisc.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskLrcAmtAftDisc.SetFocus
    Cancel = True
Else
    Call CalcLrcChg
    Call ValidDtl
End If

End Sub

Rem discart this validation, instead use validation at receipt hdr level
Private Function chkLrcAmtAftDisc() As Boolean
Dim mRtnval As Boolean, srow As Integer, mLrcAmtAftDisc As Double, mLrcAdvAmt As Double, mLrcRecdAmt As Double, mLrcDepoAmt As Double, mLrcRefuAmt As Double

mRtnval = True
srow = Mfgrd2.Row
mLrcAmtAftDisc = Val(UnMyNumFmt(mskLrcAmtAftDisc.Text))
mLrcAdvAmt = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2LRCADVAMT_COL)))
mLrcDepoAmt = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2LRCDEPOAMT_COL)))
mLrcRefuAmt = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2LRCREFUAMT_COL)))

mLrcRecdAmt = mLrcAmtAftDisc - (mLrcAdvAmt + mLrcDepoAmt)
If mLrcRecdAmt < 0 Then
    ErrorBox "Amount Received in Excess !!!"
    mRtnval = False
ElseIf mLrcAmtAftDisc < (mLrcAdvAmt + mLrcRecdAmt + mLrcDepoAmt) Then
    ErrorBox "Amount Received in Excess !!!"
    mRtnval = False
ElseIf mLrcRefuAmt > (mLrcAdvAmt + mLrcDepoAmt + mLrcRecdAmt) Then
    ErrorBox "Amount Already Refunded !!!"
    mRtnval = False
End If
chkLrcAmtAftDisc = mRtnval

End Function

Private Sub mskLrcAmtBefDisc_GotFocus()
FlashActiveControl mskLrcAmtBefDisc, True
End Sub

Private Sub mskLrcAmtBefDisc_LostFocus()
FlashActiveControl mskLrcAmtBefDisc, False
End Sub

Private Sub mskLrcAmtBefDisc_Validate(Cancel As Boolean)
mskLrcAmtBefDisc.Text = ToMyNumFmt(mskLrcAmtBefDisc.Text)
If Val(UnMyNumFmt(mskLrcAmtBefDisc.Text)) <= 0 Then
    ErrorBox "Invalid Input !!!"
    mskLrcAmtBefDisc.SetFocus
    Cancel = True
Else
    Call CalcLrcChg
    Call ValidDtl
End If

End Sub

Private Sub mskLrcBalAmtTot_GotFocus()
FlashActiveControl mskLrcBalAmtTot, True
End Sub

Private Sub mskLrcBalAmtTot_LostFocus()
FlashActiveControl mskLrcBalAmtTot, False
End Sub

Private Sub mskLrcBalAmtTot_Validate(Cancel As Boolean)
If Val(UnMyNumFmt(mskLrcBalAmtTot.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskLrcBalAmtTot.SetFocus
    Rem Cancel = True
End If

End Sub

Private Sub mskLrcDepoAmtTot_GotFocus()
FlashActiveControl mskLrcDepoAmtTot, True
End Sub

Private Sub mskLrcDepoAmtTot_LostFocus()
FlashActiveControl mskLrcDepoAmtTot, False
End Sub

Private Sub mskLrcDepoAmtTot_Validate(Cancel As Boolean)
If Val(UnMyNumFmt(mskLrcDepoAmtTot.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskLrcDepoAmtTot.SetFocus
    Rem Cancel = True
End If

End Sub

Private Sub mskLrcDiscAmt_GotFocus()
FlashActiveControl mskLrcDiscAmt, True
End Sub

Private Sub mskLrcDiscAmt_LostFocus()
FlashActiveControl mskLrcDiscAmt, False
End Sub

Private Sub mskLrcDiscAmt_Validate(Cancel As Boolean)
mskLrcDiscAmt.Text = ToMyNumFmt(mskLrcDiscAmt.Text, mUseAbs:=True)
If Val(UnMyNumFmt(mskLrcDiscAmt.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskLrcDiscAmt.SetFocus
    Cancel = True
Else
    Call CalcLrcChg
End If
Call ValidDtl

End Sub

Private Sub mskLrcDiscPer_GotFocus()
FlashActiveControl mskLrcDiscPer, True
End Sub

Private Sub mskLrcDiscPer_LostFocus()
FlashActiveControl mskLrcDiscPer, False
End Sub

Private Sub mskLrcDiscPer_Validate(Cancel As Boolean)
mskLrcDiscPer.Text = ToMyPerFmt(mskLrcDiscPer.Text, mUseAbs:=True)
If Val(UnMyPerFmt(mskLrcDiscPer.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskLrcDiscPer.SetFocus
    Cancel = True
Else
    Call CalcLrcChg
End If
Call ValidDtl

End Sub

'''Private Sub mskLpgVchNo_GotFocus()
'''FlashActiveControl mskLpgVchNo, True
'''End Sub
'''
'''Private Sub mskLpgVchNo_LostFocus()
'''FlashActiveControl mskLpgVchNo, False
'''End Sub
'''
'''Private Sub mskLpgVchNo_Validate(Cancel As Boolean)
'''Dim mLpgVchNo As Long
'''
'''mLpgVchNo = Val(UnMyNumFmt(mskLpgVchNo.Text))
'''If mLpgVchNo < 0 Then
'''    ErrorBox "Invalid Input !!!"
'''    mskLpgVchNo.SetFocus
'''    Cancel = True
'''End If
'''
'''End Sub

Private Sub mskLrcRate_GotFocus()
FlashActiveControl mskLrcRate, True
End Sub

Private Sub mskLrcRate_LostFocus()
FlashActiveControl mskLrcRate, False
End Sub

Private Sub mskLrcRate_Validate(Cancel As Boolean)
mskLrcRate.Text = ToMyNumFmt(mskLrcRate.Text)
If Val(UnMyNumFmt(mskLrcRate.Text)) <= 0 Then
    ErrorBox "Invalid Input !!!"
    mskLrcRate.SetFocus
    Cancel = True
Else
    Call CalcLrcChg
    Call ValidDtl
End If

End Sub

Private Sub mskLrcRecdAmtTot_GotFocus()
FlashActiveControl mskLrcRecdAmtTot, True
End Sub

Private Sub mskLrcRecdAmtTot_LostFocus()
FlashActiveControl mskLrcRecdAmtTot, False
End Sub

Private Sub mskLrcRecdAmtTot_Validate(Cancel As Boolean)
Dim mLrcAdvAmtTot As Double, mLrcRecdAmtTot As Double, mLrcDepoAmtTot As Double, mLrcRefuAmtTot As Double, mLrcAmtAftDiscTot As Double

mLrcAdvAmtTot = Val(UnMyNumFmt(mskLrcAdvAmtTot.Text))
mLrcRecdAmtTot = Val(UnMyNumFmt(mskLrcRecdAmtTot.Text))
mLrcDepoAmtTot = Val(UnMyNumFmt(mskLrcDepoAmtTot.Text))
mLrcRefuAmtTot = Val(UnMyNumFmt(mskLrcRefuAmtTot.Text))
mLrcAmtAftDiscTot = Val(UnMyNumFmt(lblLrcAmtAftDiscTot.Caption))

mskLrcRecdAmtTot.Text = ToMyNumFmt(mLrcRecdAmtTot)
If mLrcRecdAmtTot < 0 Then
    ErrorBox "Invalid Input !!!"
    mskLrcRecdAmtTot.SetFocus
    Rem Cancel = True
Else
    If (mLrcAdvAmtTot + mLrcRecdAmtTot + mLrcDepoAmtTot) > mLrcAmtAftDiscTot Then
        ErrorBox "Excess Received Amount !!!"
        mLrcRecdAmtTot = mLrcAmtAftDiscTot - (mLrcAdvAmtTot + mLrcDepoAmtTot)
        mskLrcRecdAmtTot.Text = ToMyNumFmt(mLrcRecdAmtTot)
        mskLrcRecdAmtTot.SetFocus
        Rem Cancel = True
    ElseIf mLrcRefuAmtTot > (mLrcAdvAmtTot + mLrcRecdAmtTot + mLrcDepoAmtTot) Then
        ErrorBox "Excess Amount Refunded !!!"
        mLrcRecdAmtTot = mLrcRefuAmtTot - (mLrcAdvAmtTot + mLrcDepoAmtTot)
        mskLrcRecdAmtTot.Text = ToMyNumFmt(mLrcRecdAmtTot)
        mskLrcRecdAmtTot.SetFocus
        Rem Cancel = True
    Else
        CalcFtrTotal mCalcBalOnly:=True
'    Else
'        If FormAddEditMode = cFORM_ADDMODE Or mLrcRecdAmtTot <> mLrcRecdAmtTot_old Then
'            DisperseRecdAmt mLrcCode
'            ShowDtlData mLrcCode
'        End If
    End If
End If

End Sub

Private Sub mskLrcRefuAmtTot_GotFocus()
FlashActiveControl mskLrcRefuAmtTot, True
End Sub

Private Sub mskLrcRefuAmtTot_LostFocus()
FlashActiveControl mskLrcRefuAmtTot, False
End Sub

Private Sub mskLrcRefuAmtTot_Validate(Cancel As Boolean)
If Val(UnMyNumFmt(mskLrcRefuAmtTot.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskLrcRefuAmtTot.SetFocus
    Rem Cancel = True
End If

End Sub

Private Sub mskLrcUnit_GotFocus()
FlashActiveControl mskLrcUnit, True
End Sub

Private Sub mskLrcUnit_LostFocus()
FlashActiveControl mskLrcUnit, False
End Sub

Private Sub mskLrcUnit_Validate(Cancel As Boolean)
mskLrcUnit.Text = ToMyNumFmt(mskLrcUnit.Text, mDecimals:=0)
If Val(UnMyNumFmt(mskLrcUnit.Text)) <= 0 Then
    ErrorBox "Invalid Input !!!"
    mskLrcUnit.SetFocus
    Cancel = True
Else
    Call CalcLrcChg
    Call ValidDtl
End If

End Sub

Private Sub mskLrcVchNo_GotFocus(Index As Integer)
FlashActiveControl mskLrcVchNo(Index), True
End Sub

Private Sub mskLrcVchNo_LostFocus(Index As Integer)
FlashActiveControl mskLrcVchNo(Index), False
End Sub

Private Sub mskLrcVchNo_Validate(Index As Integer, Cancel As Boolean)
Dim mLrcVchNo As Long

mLrcVchNo = Val(UnMyNumFmt(mskLrcVchNo(Index).Text))
If mLrcVchNo < 0 Then
    If Index = 0 Then
        mLrcVchNo = GetNextVTypeNo(dbHmsDatabase, dbAcDatabase, dbComDatabase, mTableName:="LabHdr", mFieldName:="LhrVchNo", mVtmFieldName:="LhrVtmCode", mVtmFieldValue:=Val(fcmbLrcVtmName.BoundText), mFinYrFieldName:="LhrCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="LhrDate", mDateFieldValue:=Ctod(dtpLrcDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormLrcAcsPermFileName)
        mskLrcVchNo(Index).Text = ToMyNumFmt(mLrcVchNo, mDecimals:=0)
    Else
        ErrorBox "Invalid Input !!!"
        mskLrcVchNo(Index).SetFocus
        Cancel = True
    End If
ElseIf mLrcVchNo > 0 Then
    If Index = 0 Then
        If mLrcVchNo <> mLrcVchNo_old Or Val(fcmbLrcVtmName.BoundText) <> mLrcVtmCode_old Or Ctod(dtpLrcDate.Text) <> mLrcDate_old Or FormAddEditMode = cFORM_ADDMODE Then
            If ChkIsDuplVTypeNo(dbHmsDatabase, dbAcDatabase, mTableName:="LabHdr", mChkFieldName:="LhrVchNo", mChkFieldValue:=mLrcVchNo, mKeyFieldName:="LhrCode", mKeyFieldValue:=mLrcCode, mVtmFieldName:="LhrVtmCode", mVtmFieldValue:=Val(fcmbLrcVtmName.BoundText), mFinYrFieldName:="LhrCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="LhrDate", mDateFieldValue:=Ctod(dtpLrcDate.Text)) = True Then
                ErrorBox "Duplicate Voucher No. !!!"
                Cancel = True
                mskLrcVchNo(Index).SetFocus
                ' ----------
                If FormAddEditMode = cFORM_ADDMODE Then
                    mLrcVchNo = GetNextVTypeNo(dbHmsDatabase, dbAcDatabase, dbComDatabase, mTableName:="LabHdr", mFieldName:="LhrVchNo", mVtmFieldName:="LhrVtmCode", mVtmFieldValue:=Val(fcmbLrcVtmName.BoundText), mFinYrFieldName:="LhrCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="LhrDate", mDateFieldValue:=Ctod(dtpLrcDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormLrcAcsPermFileName)
                Else
                    mLrcVchNo = mLrcVchNo_old
                End If
                mskLrcVchNo(Index).Text = ToMyNumFmt(mLrcVchNo, mDecimals:=0)
            End If
        End If
        If Cancel = False Then
            mskLrcVchNo(Index).Text = ToMyNumFmt(mLrcVchNo, mDecimals:=0)
        End If
    Else
        If ChkIsExistVTypeNo(dbHmsDatabase, mTableName:="LabHdr", mChkFieldName:="LhrVchNo", mChkFieldValue:=CStr(mLrcVchNo), mVtmFieldName:="LhrVtmCode", mVtmFieldValue:=Val(fcmbLrcVtmName.BoundText), mFinYrFieldName:="LhrCmpCode", mFinYrFieldValue:=sFinYrCmpCode) = False Then
            ErrorBox "Voucher No. does not Exist !!!"
            mskLrcVchNo(Index).SetFocus
            Rem Cancel = True
        End If
    End If
Else
    ErrorBox "Invalid Input !!!"
    mskLrcVchNo(Index).SetFocus
    Cancel = True
End If

End Sub

Private Sub mskLrdSno_GotFocus()
FlashActiveControl mskLrdSno, True
End Sub

Private Sub mskLrdSno_LostFocus()
FlashActiveControl mskLrdSno, False
End Sub

Private Sub mskPttAgeDy_Change()
mPttAgeChanged = True
End Sub

Private Sub mskPttAgeDy_GotFocus()
FlashActiveControl mskPttAgeDy, True
mPttAgeChanged = False
End Sub

Private Sub mskPttAgeDy_LostFocus()
FlashActiveControl mskPttAgeDy, False
End Sub

Private Sub mskPttAgeDy_Validate(Cancel As Boolean)
mskPttAgeDy.Text = ToMyNumFmt(mskPttAgeDy.Text, mDecimals:=0, mUseAbs:=True, mGroupedDigit:=False)
If mPttAgeChanged = True Then
    Call ShowPttDob
End If

End Sub

Private Sub mskPttAgeMn_Change()
mPttAgeChanged = True
End Sub

Private Sub mskPttAgeMn_GotFocus()
FlashActiveControl mskPttAgeMn, True
mPttAgeChanged = False
End Sub

Private Sub mskPttAgeMn_LostFocus()
FlashActiveControl mskPttAgeMn, False
End Sub

Private Sub mskPttAgeMn_Validate(Cancel As Boolean)
mskPttAgeMn.Text = ToMyNumFmt(mskPttAgeMn.Text, mDecimals:=0, mUseAbs:=True, mGroupedDigit:=False)
If mPttAgeChanged = True Then
    Call ShowPttDob
End If

End Sub

Private Sub mskPttAgeYr_Change()
mPttAgeChanged = True
End Sub

Private Sub mskPttAgeYr_GotFocus()
FlashActiveControl mskPttAgeYr, True
mPttAgeChanged = False
End Sub

Private Sub mskPttAgeYr_LostFocus()
FlashActiveControl mskPttAgeYr, False
End Sub

Private Sub mskPttAgeYr_Validate(Cancel As Boolean)
mskPttAgeYr.Text = ToMyNumFmt(mskPttAgeYr.Text, mDecimals:=0, mUseAbs:=True, mGroupedDigit:=False)
If mPttAgeChanged = True Then
    Call ShowPttDob
End If

End Sub

Private Sub mskLrcPttDiscPer_GotFocus()
FlashActiveControl mskLrcPttDiscPer, True
End Sub

Private Sub mskLrcPttDiscPer_LostFocus()
FlashActiveControl mskLrcPttDiscPer, False
End Sub

Private Sub mskLrcPttDiscPer_Validate(Cancel As Boolean)
mskLrcPttDiscPer.Text = ToMyPerFmt(mskLrcPttDiscPer.Text)
If Val(UnMyPerFmt(mskLrcPttDiscPer.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskLrcPttDiscPer.SetFocus
    Cancel = True
End If

End Sub

'''Private Sub mskPttRegNo_GotFocus()
'''FlashActiveControl mskPttRegNo, True
'''End Sub
'''
'''Private Sub mskPttRegNo_KeyDown(KeyCode As Integer, Shift As Integer)
'''If MyDropDownKey(Shift, KeyCode) = True Then
'''    Call ShowOldLpgListByPttRegNo
'''ElseIf MyAddNewKey(Shift, KeyCode) = True Then
'''    If FormAddEditMode = cFORM_ADDMODE Then
'''        clsLRC.EndTran mLrcCode
'''        Call Data_AddEvent
'''    Else
'''        AlertBox "Prohibited in Edit Mode !!!"
'''    End If
'''End If
'''
'''End Sub
'''
'''Private Sub mskPttRegNo_LostFocus()
'''FlashActiveControl mskPttRegNo, False
'''End Sub
'''
'''Private Sub mskPttRegNo_Validate(Cancel As Boolean)
'''Dim mPttRegNo As Long
'''
'''mPttRegNo = Val(UnMyNumFmt(mskPttRegNo.Text))
'''If mPttRegNo < 0 Then
'''    ErrorBox "Invalid Input !!!"
'''    Rem Cancel = True
'''    Rem mskPttRegNo.SetFocus
'''Else
'''    If mPttRegNo <> mPttRegNo_old Or FormAddEditMode = cFORM_ADDMODE Then
'''        If mPttRegNo = 0 And clsHOPT.mLrcPttRegNoNotZero_bln = True Then
'''            AlertBox "Prohibited Zero Patient Reg.No. !!!"
'''        End If
'''    End If
'''End If
'''
'''End Sub

Private Sub mskPttRegNo_GotFocus()
FlashActiveControl mskPttRegNo, True
End Sub

Private Sub mskPttRegNo_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    If fcmbPttRegNo.CallFromText_Change = False Then
        fcmbPttRegNo.CallFromText_Change = True
        If InterActiveChange(mskPttRegNo) = True Then
            Call ChkPttRegNoListFirstTime
            
            fcmbPttRegNo.UserText = Array(mskPttRegNo.Text, mskPttRegNo.SelStart)
            fcmbPttRegNo.Show
            If fcmbPttRegNo.ListSelected = True And Val(fcmbPttRegNo.BoundText) > 0 Then
                If FormAddEditMode = cFORM_ADDMODE And Mfgrd2.Rows = 2 Then
                    clsPAT.EndMast mLrcPttCode
                    
                    PatAddEditMode = cFORM_EDITMODE
                    mLrcPttCode = Val(fcmbPttRegNo.BoundText)
                    If clsPAT.BeginMast(mLrcPttCode) = True Then
                        mLrcPttCode = clsPAT.ActiveCode
                    Else
                        mLrcPttCode = 0
                    End If
                    ShowPttDiscPer mLrcPttCode
                    mLrcOldLrcCode = GetOldLrcCodeFromPttCode(mLrcPttCode)
                    ShowOldLrcCodeDesc mLrcOldLrcCode
                    ShowPatData mLrcPttCode
                    Call StorePatOldData
                    
                    Rem SendKeys "{tab}"
                Else
                    If FormAddEditMode = cFORM_EDITMODE Then
                        AlertBox "Prohibited in Edit Mode !!!"
                    ElseIf Mfgrd2.Rows > 2 Then
                        AlertBox "Prohibited After Entering Service Detail !!!"
                    End If
                End If
            End If
        End If
        fcmbPttRegNo.CallFromText_Change = False
    End If
ElseIf MyAddNewKey(Shift, KeyCode) = True Then
    If FormAddEditMode = cFORM_ADDMODE Then
        clsPAT.EndMast mLrcPttCode
        
        PatAddEditMode = cFORM_ADDMODE
        If clsPAT.BeginMast(0) = True Then
            mLrcPttCode = clsPAT.ActiveCode
        Else
            mLrcPttCode = 0
        End If
        ShowPttDiscPer mLrcPttCode
        mLrcOldLrcCode = 0
        ShowOldLrcCodeDesc mLrcOldLrcCode
        ShowPatData mLrcPttCode
        Call ShowPatDefData
        Call StorePatOldData
    Else
        AlertBox "Prohibited in Edit Mode !!!"
    End If
ElseIf Shift = 0 And KeyCode = vbKeyF6 Then
    Rem Call ShowOldLpgListByPttRegNo
End If

End Sub

Private Sub mskPttRegNo_LostFocus()
FlashActiveControl mskPttRegNo, False
End Sub

Private Sub mskPttRegNo_Validate(Cancel As Boolean)
Dim mPttRegNo As Long, mLrcPttCode As Long

mLrcPttCode = Val(mskLrcPttCode.Text)
mPttRegNo = Val(UnMyNumFmt(mskPttRegNo.Text))
If mPttRegNo < 0 Then
    ErrorBox "Invalid Input !!!"
    Cancel = True
    mskPttRegNo.SetFocus
Else
    If mPttRegNo <> mPttRegNo_old Or FormAddEditMode = cFORM_ADDMODE Then
        If PatAddEditMode = cFORM_ADDMODE And mPttRegNo <> mPttRegNo_old And clsHOPT.mLpgPttRegNoAddModeChange_bln = False Then
            AlertBox "Change Prohibited in Add Mode !!!"
            mskPttRegNo.Text = ToMyNumFmt(mPttRegNo_old, mDecimals:=0)
            Cancel = True
            mskPttRegNo.SetFocus
            
        ElseIf PatAddEditMode = cFORM_EDITMODE And mPttRegNo <> mPttRegNo_old And clsHOPT.mLpgPttRegNoEditModeChange_bln = False Then
            AlertBox "Change Prohibited in Edit Mode !!!"
            mskPttRegNo.Text = ToMyNumFmt(mPttRegNo_old, mDecimals:=0)
            Cancel = True
            mskPttRegNo.SetFocus
            
        ElseIf mPttRegNo = 0 And clsHOPT.mLpgPttRegNoNotZero_bln = True Then
            AlertBox "Prohibited Zero Patient Reg.No. !!!"
            If PatAddEditMode = cFORM_ADDMODE Then
                If clsHOPT.mLpgPttRegNoAutoNumber_bln = True Then
                    mPttRegNo = GetNextSeqno(dbHmsDatabase, "PatMast", "PttRegNo")
                    mskPttRegNo.Text = ToMyNumFmt(mPttRegNo, mDecimals:=0)
                    mPttRegNo_old = mPttRegNo
                End If
            Else
                mskPttRegNo.Text = ToMyNumFmt(mPttRegNo_old, mDecimals:=0)
            End If
            Cancel = True
            mskPttRegNo.SetFocus
        ElseIf mPttRegNo <> 0 Then
            If ChkIsDuplicate(dbHmsDatabase, "PatMast", "PttRegNo", mPttRegNo, "PttCode", mLrcPttCode) = True Then
                ErrorBox "Duplicate Patient Reg.No. !!!"
                Cancel = True
                mskPttRegNo.SetFocus
                ' -----------
                If PatAddEditMode = cFORM_ADDMODE Then
                    If clsHOPT.mLpgPttRegNoAutoNumber_bln = True Then
                        mPttRegNo = GetNextSeqno(dbHmsDatabase, "PatMast", "PttRegNo")
                        mPttRegNo_old = mPttRegNo
                    End If
                Else
                    mPttRegNo = mPttRegNo_old
                End If
                mskPttRegNo.Text = ToMyNumFmt(mPttRegNo, mDecimals:=0)
            End If
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

Private Sub txtAhName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtAhName_Change
End If

End Sub

Private Sub txtAhName_LostFocus()
FlashActiveControl txtAhName, False
End Sub

Private Sub txtAhname_Validate(Cancel As Boolean)
If Val(fcmbAhName.BoundText) <= 0 Then
    AlertBox "Invalid Account Head Name !!!"
    txtAhName.SetFocus
    Cancel = True
Else
    Call ShowPatBal
End If

End Sub

Private Sub txtAraName_Change()
If fcmbAraName.CallFromText_Change = False Then
    fcmbAraName.CallFromText_Change = True
    If InterActiveChange(txtAraName) = True Then
        fcmbAraName.UserText = Array(txtAraName.Text, txtAraName.SelStart)
        fcmbAraName.Show
        txtAraName.Text = fcmbAraName.Text
        If fcmbAraName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbAraName.CallFromText_Change = False
End If

End Sub

Private Sub txtAraName_GotFocus()
FlashActiveControl txtAraName, True
End Sub

Private Sub txtAraName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtAraName_Change
End If

End Sub

Private Sub txtAraName_LostFocus()
FlashActiveControl txtAraName, False
End Sub

Private Sub txtAraName_Validate(Cancel As Boolean)
If Val(fcmbAraName.BoundText) <= 0 Then
    ErrorBox "Invalid Selection !!!"
    txtAraName.SetFocus
    Cancel = True
Else
    If mPttAraCode_old <> Val(fcmbAraName.BoundText) Or Val(fcmbStnName.BoundText) = 0 Then
        AutoInitStationFromArea cnn:=dbAcDatabase, txtStnName:=txtStnName, fcmbStnName:=fcmbStnName, mAraCode:=Val(fcmbAraName.BoundText)
        
'        clsARA.GetData Val(fcmbAraName.BoundText)
'        fcmbStnName.BoundText = CStr(clsARA.mAraStnCode_lng): txtStnName.Text = fcmbStnName.Text
'        If Val(fcmbStnName.BoundText) = 0 Then
'            fcmbStnName.Requery
'            fcmbStnName.BoundText = CStr(clsARA.mAraStnCode_lng): txtStnName.Text = fcmbStnName.Text
'        End If
    End If
End If

End Sub

Private Sub txtCDctName_Change()
If fcmbCDctName.CallFromText_Change = False Then
    fcmbCDctName.CallFromText_Change = True
    If InterActiveChange(txtCDctName) = True Then
        fcmbCDctName.UserText = Array(txtCDctName.Text, txtCDctName.SelStart)
        fcmbCDctName.Show
        txtCDctName.Text = fcmbCDctName.Text
        If fcmbCDctName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbCDctName.CallFromText_Change = False
End If

End Sub

Private Sub txtCDctName_GotFocus()
FlashActiveControl txtCDctName, True
End Sub

Private Sub txtCDctName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtCDctName_Change
End If
    
End Sub

Private Sub txtCDctName_LostFocus()
FlashActiveControl txtCDctName, False
End Sub

Private Sub txtCDctName_Validate(Cancel As Boolean)
If Val(fcmbCDctName.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    txtCDctName.SetFocus
    Cancel = True
Else
'''    Call ChkServRate
'''    Call CalcOpgChg
End If

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

Private Sub txtFDigName_Change()
If fcmbFDigName.CallFromText_Change = False Then
    fcmbFDigName.CallFromText_Change = True
    If InterActiveChange(txtFDigName) = True Then
        fcmbFDigName.UserText = Array(txtFDigName.Text, txtFDigName.SelStart)
        fcmbFDigName.Show
        txtFDigName.Text = fcmbFDigName.Text
        If fcmbFDigName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbFDigName.CallFromText_Change = False
End If

End Sub

Private Sub txtFDigName_GotFocus()
FlashActiveControl txtFDigName, True
End Sub

Private Sub txtFDigName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtFDigName_Change
End If

End Sub

Private Sub txtFDigName_LostFocus()
FlashActiveControl txtFDigName, False
End Sub

Private Sub txtFDigName_Validate(Cancel As Boolean)
If Val(fcmbFDigName.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    txtFDigName.SetFocus
    Cancel = True
End If

End Sub

Private Sub txtLhrRemark_GotFocus()
FlashActiveControl txtLhrRemark, True
End Sub

Private Sub txtLhrRemark_LostFocus()
FlashActiveControl txtLhrRemark, False
End Sub

Private Sub txtLhrRemark_Validate(Cancel As Boolean)
txtLhrRemark.Text = ToMyWord(txtLhrRemark.Text)
End Sub

'''Private Sub txtLpgTime_str_GotFocus()
'''FlashActiveControl txtLpgTime_str, True
'''End Sub
'''
'''Private Sub txtLpgTime_str_LostFocus()
'''FlashActiveControl txtLpgTime_str, False
'''End Sub
'''
'''Private Sub txtLpgTime_str_Validate(Cancel As Boolean)
'''txtLpgTime_str.Text = MinToTime(TimeToMin(txtLpgTime_str.Text))
'''If TimeToMin(txtLpgTime_str.Text) > cDAYMINUTES Then
'''    ErrorBox "Invalid Input !!!"
'''    txtLpgTime_str.SetFocus
'''    Cancel = True
'''End If
'''
'''End Sub

Private Sub txtLrcTime_str_GotFocus()
FlashActiveControl txtLrcTime_str, True
End Sub

Private Sub txtLrcTime_str_LostFocus()
FlashActiveControl txtLrcTime_str, False
End Sub

Private Sub txtLrcTime_str_Validate(Cancel As Boolean)
txtLrcTime_str.Text = MinToTime(TimeToMin(txtLrcTime_str.Text))
If TimeToMin(txtLrcTime_str.Text) > cDAYMINUTES Then
    ErrorBox "Invalid Input !!!"
    txtLrcTime_str.SetFocus
    Cancel = True
Else
'''    Call ChkServRate
'''    Call CalcLrcChg
End If

End Sub

Private Sub txtLrcVtmName_Change(Index As Integer)
If fcmbLrcVtmName.CallFromText_Change = False Then
    fcmbLrcVtmName.CallFromText_Change = True
    If InterActiveChange(txtLrcVtmName(Index)) = True Then
        fcmbLrcVtmName.UserText = Array(txtLrcVtmName(Index).Text, txtLrcVtmName(Index).SelStart)
        fcmbLrcVtmName.Show
        txtLrcVtmName(Index).Text = fcmbLrcVtmName.Text
        If fcmbLrcVtmName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbLrcVtmName.CallFromText_Change = False
End If

End Sub

Private Sub txtLrcVtmName_GotFocus(Index As Integer)
FlashActiveControl txtLrcVtmName(Index), True
End Sub

Private Sub txtLrcVtmName_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    txtLrcVtmName_Change Index
ElseIf MyAddNewKey(Shift, KeyCode) = True Then

ElseIf Shift = 0 And KeyCode = vbKeyF6 Then
    Rem Call ShowOldLpgListByLpgNo show here all lab receipt details
End If

End Sub

Private Sub txtLrcVtmName_LostFocus(Index As Integer)
FlashActiveControl txtLrcVtmName(Index), False
End Sub

Private Sub txtLrcVtmName_Validate(Index As Integer, Cancel As Boolean)
Dim mLrcVchNo As Long

If Val(fcmbLrcVtmName.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    txtLrcVtmName(Index).SetFocus
    Cancel = True
Else
    If Index = 0 Then
        If Val(fcmbLrcVtmName.BoundText) <> mLrcVtmCode_old Or Ctod(dtpLrcDate.Text) <> mLrcDate_old Or FormAddEditMode = cFORM_ADDMODE Then
            mLrcVchNo = GetNextVTypeNo(dbHmsDatabase, dbAcDatabase, dbComDatabase, mTableName:="LabHdr", mFieldName:="LhrVchNo", mVtmFieldName:="LhrVtmCode", mVtmFieldValue:=Val(fcmbLrcVtmName.BoundText), mFinYrFieldName:="LhrCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="LhrDate", mDateFieldValue:=Ctod(dtpLrcDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormLrcAcsPermFileName)
            mskLrcVchNo(Index).Text = ToMyNumFmt(mLrcVchNo, mDecimals:=0)
        End If
    End If
End If

End Sub

Private Sub txtLrdRemark_GotFocus()
FlashActiveControl txtLrdRemark, True
End Sub

Private Sub txtLrdRemark_LostFocus()
FlashActiveControl txtLrdRemark, False
End Sub

Private Sub txtLrdRemark_Validate(Cancel As Boolean)
Call ValidSdcDtl

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

Private Sub txtPttEmail_GotFocus()
FlashActiveControl txtPttEmail, True
End Sub

Private Sub txtPttEmail_LostFocus()
FlashActiveControl txtPttEmail, False
End Sub

'''Private Sub txtPttName_GotFocus()
'''FlashActiveControl txtPttName, True
'''End Sub
'''
'''Private Sub txtPttName_KeyDown(KeyCode As Integer, Shift As Integer)
'''If MyDropDownKey(Shift, KeyCode) = True Then
'''    Call ShowOldLpgListByPttName
'''ElseIf MyAddNewKey(Shift, KeyCode) = True Then
'''    If FormAddEditMode = cFORM_ADDMODE Then
'''        clsLRC.EndTran mLrcCode
'''        Call Data_AddEvent
'''    Else
'''        AlertBox "Prohibited in Edit Mode !!!"
'''    End If
'''End If
'''
'''End Sub
'''
'''Private Sub txtPttName_LostFocus()
'''FlashActiveControl txtPttName, False
'''End Sub
'''
'''Private Sub txtPttName_Validate(Cancel As Boolean)
'''txtPttName.Text = ToMyWord(txtPttName.Text)
'''If Trim(txtPttName.Text) = "" Then
'''    ErrorBox "Invalid Input !!!"
'''    Rem Cancel = True
'''    Rem txtPttName.SetFocus
'''End If
'''
'''End Sub

Private Sub txtPttName_GotFocus()
FlashActiveControl txtPttName, True
End Sub

Private Sub txtPttName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    If fcmbPttName.CallFromText_Change = False Then
        fcmbPttName.CallFromText_Change = True
        If InterActiveChange(txtPttName) = True Then
            Call ChkPttNameListFirstTime
            
            fcmbPttName.UserText = Array(txtPttName.Text, txtPttName.SelStart)
            fcmbPttName.Show
            If fcmbPttName.ListSelected = True And Val(fcmbPttName.BoundText) > 0 Then
                If FormAddEditMode = cFORM_ADDMODE And Mfgrd2.Rows = 2 Then
                    clsPAT.EndMast mLrcPttCode
                    
                    PatAddEditMode = cFORM_EDITMODE
                    mLrcPttCode = Val(fcmbPttName.BoundText)
                    If clsPAT.BeginMast(mLrcPttCode) = True Then
                        mLrcPttCode = clsPAT.ActiveCode
                    Else
                        mLrcPttCode = 0
                    End If
                    ShowPttDiscPer mLrcPttCode
                    mLrcOldLrcCode = GetOldLrcCodeFromPttCode(mLrcPttCode)
                    ShowOldLrcCodeDesc mLrcOldLrcCode
                    ShowPatData mLrcPttCode
                    Call StorePatOldData
                    Rem SendKeys "{tab}"
                Else
                    If FormAddEditMode = cFORM_EDITMODE Then
                        AlertBox "Prohibited in Edit Mode !!!"
                    ElseIf Mfgrd2.Rows > 2 Then
                        AlertBox "Prohibited After Entering Service Detail !!!"
                    End If
                End If
            End If
        End If
        fcmbPttName.CallFromText_Change = False
    End If
ElseIf MyAddNewKey(Shift, KeyCode) = True Then
    If FormAddEditMode = cFORM_ADDMODE Then
        clsPAT.EndMast mLrcPttCode
        
        PatAddEditMode = cFORM_ADDMODE
        If clsPAT.BeginMast(0) = True Then
            mLrcPttCode = clsPAT.ActiveCode
        Else
            mLrcPttCode = 0
        End If
        ShowPttDiscPer mLrcPttCode
        mLrcOldLrcCode = 0
        ShowOldLrcCodeDesc mLrcOldLrcCode
        ShowPatData mLrcPttCode
        Call ShowPatDefData
        Call StorePatOldData
    Else
        AlertBox "Prohibited in Edit Mode !!!"
    End If
ElseIf Shift = 0 And KeyCode = vbKeyF6 Then
    Rem Call ShowOldLpgListByPttName
End If

End Sub

Private Sub ChkPttNameListFirstTime()
If fcmbPttName.LRecordCount = 0 Then
    fcmbPttName.mFiltCond = ""
    fcmbPttName.ReInit
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
If clsLRC.BeginTran(0) = False Then
    Exit Sub
ElseIf clsPAT.BeginMast(0) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_ADDMODE
PatAddEditMode = cFORM_ADDMODE

clsLRC.ClearHdr: clsLRC.ClearDtl
'''clsLPG.Clear
clsPAT.Clear

mLrcCode = clsLRC.ActiveTrnCode
'''mLrcLpgCode = 0
mLrcPttCode = clsPAT.ActiveCode

ShowLrcData mLrcCode
Rem ShowLpgData mLrcLpgCode
ShowPatData mLrcPttCode

Rem restoring user editing features
Call ShowLrcDefData
Call ShowPatDefData
Rem Call ShowLpgDefData

Rem old values
Call StoreLrcOldData
Call StorePatOldData
Rem Call StoreLpgOldData

Call ShowEntryMode(True)
txtPttName.SetFocus

End Sub

Private Sub Data_EditEvent()

If CanUserEditOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If clsLRC.BeginTran(datRecset.fields("LhrCode")) = False Then
    Exit Sub
ElseIf clsPAT.BeginMast(datRecset.fields("LhrPttCode")) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_EDITMODE
PatAddEditMode = cFORM_EDITMODE

With datRecset
mLrcCode = .fields("LhrCode")
'''mLrcLpgCode = .fields("LhrLpgCode")
mLrcPttCode = .fields("LhrPttCode")

clsLRC.GetHdrData mLrcCode
'''clsLPG.GetData mLrcLpgCode
clsPAT.GetData mLrcPttCode
End With

ShowLrcData mLrcCode
Rem ShowLpgData mLrcLpgCode
ShowPatData mLrcPttCode

Rem old values
Call StoreLrcOldData
Rem Call StoreLpgOldData
Call StorePatOldData

Call ShowEntryMode(True)
txtPttName.SetFocus

End Sub

Private Sub ShowPatData(ByVal mPttCode As Long)

With clsPAT
.GetData mPttCode

mskLrcPttCode.Text = mPttCode
txtPttName.Text = .mName_str
mskPttRegNo.Text = ToMyNumFmt(.mPttRegNo_lng, mDecimals:=0)
dtpPttRegDate.Text = Dtoc(.mPttRegDate_dt)
cmbPttSex.ListIndex = GetMidStrPos(cPTTSEX_LIST, .mPttSex_str, ",") - 1
mskPttAgeYr.Text = 0
mskPttAgeMn.Text = 0
mskPttAgeDy.Text = 0
dtpPttAgeAsOnDt.Text = Dtoc(.mPttAgeAsOnDt_dt)
dtpPttDob.Text = Dtoc(.mPttDob_dt)
fcmbPcgName.BoundText = CStr(.mPttPcgCode_lng): txtPcgName.Text = fcmbPcgName.Text
cmbPttRefRela.ListIndex = GetMidStrPos(cPTTREFRELA_LIST, .mPttRefRela_str, ",") - 1
txtPttRefName.Text = .mPttRefName_str
txtPttAddr.Text = .mPttAddr_str
fcmbAraName.BoundText = CStr(.mPttAraCode_lng): txtAraName.Text = fcmbAraName.Text
fcmbStnName.BoundText = CStr(.mPttStnCode_lng): txtStnName.Text = fcmbStnName.Text
txtPttTelNo.Text = .mPttTelNo_str
txtPttSMSNo.Text = .mPttSMSNo_str
txtPttEmail.Text = .mPttEmail_str
chkPttInfAllowed.Value = IIf(.mPttInfAllowed_bln = True, vbChecked, vbUnchecked)
chkPttDefAllowed.Value = IIf(.mPttDefAllowed_bln = True, vbChecked, vbUnchecked)
chkPttDiscAllowed.Value = IIf(.mPttDiscAllowed_bln = True, vbChecked, vbUnchecked)
mskPttDiscPer.Text = ToMyPerFmt(.mPttDiscPer_dbl)
chkPttShowInList.Value = IIf(.mPttShowInList_bln = True, vbChecked, vbUnchecked)
Rem txtPttRemark.Text = .mPttRemark_str
fcmbAhName.BoundText = CStr(.mPttAhCode_lng): txtAhName.Text = fcmbAhName.Text
End With

Call ShowPatAge
Call ShowPatBal

Rem disallow editing for exising patients, strictly from patient master only
txtPttName.Locked = (mPttCode > 0)
mskPttRegNo.Locked = (mPttCode > 0)
dtpPttRegDate.Locked = (mPttCode > 0)
cmbPttSex.Locked = (mPttCode > 0)
mskPttAgeYr.Locked = (mPttCode > 0)
mskPttAgeMn.Locked = (mPttCode > 0)
mskPttAgeDy.Locked = (mPttCode > 0)
dtpPttAgeAsOnDt.Locked = (mPttCode > 0)
dtpPttDob.Locked = (mPttCode > 0)
txtPcgName.Enabled = Not (mPttCode > 0)
cmbPttRefRela.Locked = (mPttCode > 0)
txtPttRefName.Locked = (mPttCode > 0)
txtPttAddr.Locked = (mPttCode > 0)
txtAraName.Locked = (mPttCode > 0)
txtStnName.Locked = (mPttCode > 0)
txtPttTelNo.Locked = (mPttCode > 0)
txtPttSMSNo.Locked = (mPttCode > 0)
txtPttEmail.Locked = (mPttCode > 0)
chkPttInfAllowed.Enabled = Not (mPttCode > 0)
chkPttDefAllowed.Enabled = Not (mPttCode > 0)
chkPttDiscAllowed.Enabled = Not (mPttCode > 0)
mskPttDiscPer.Locked = (mPttCode > 0)
chkPttShowInList.Enabled = Not (mPttCode > 0)
Rem txtPttRemark.Locked = (mPttCode > 0)
txtAhName.Locked = (mPttCode > 0)

End Sub

Private Sub ShowPatDefData()
Dim mPttRegNo As Long, tRecset As New ADODB.Recordset

If clsHOPT.mLpgPttRegNoAutoNumber_bln = True Then
    mPttRegNo = GetNextSeqno(dbHmsDatabase, "PatMast", "PttRegNo")
    mskPttRegNo.Text = ToMyNumFmt(mPttRegNo, mDecimals:=0)
End If
dtpPttRegDate.Text = Dtoc(DefaultEntryDate)
cmbPttSex.ListIndex = 0
dtpPttAgeAsOnDt.Text = dtpPttRegDate.Text
dtpPttDob.Text = dtpPttRegDate.Text
cmbPttRefRela.ListIndex = 0
chkPttInfAllowed.Value = vbChecked
chkPttDefAllowed.Value = vbChecked
chkPttDiscAllowed.Value = vbChecked
chkPttShowInList.Value = vbChecked
fcmbAraName.BoundText = CStr(clsHOPT.GetLabRegOptBoundCode("LpgAraCode"))
fcmbStnName.BoundText = CStr(clsHOPT.GetLabRegOptBoundCode("LpgStnCode"))
fcmbPcgName.BoundText = CStr(clsHOPT.GetLabRegOptBoundCode("LpgPcgCode"))
fcmbAhName.BoundText = CStr(clsHOPT.GetLabRegOptBoundCode("LpgPttAhCode"))

If Val(fcmbAraName.BoundText) = 0 Or Val(fcmbStnName.BoundText) = 0 Or Val(fcmbPcgName.BoundText) = 0 Or Val(fcmbAhName.BoundText) = 0 Then
    With tRecset
    .open "Select * from PatMast where PttCode = (Select top 1 LhrPttCode from LabHdr order by LhrCode desc)", dbHmsDatabase, adOpenKeyset, adLockOptimistic
    If .EOF = False Then
        If Val(fcmbAraName.BoundText) = 0 Then
            fcmbAraName.BoundText = CStr(.fields("PttAraCode"))
        End If
        If Val(fcmbStnName.BoundText) = 0 Then
            fcmbStnName.BoundText = CStr(.fields("PttStnCode"))
        End If
        If Val(fcmbPcgName.BoundText) = 0 Then
            fcmbPcgName.BoundText = CStr(.fields("PttPcgCode"))
        End If
        If Val(fcmbAhName.BoundText) = 0 Then
            fcmbAhName.BoundText = CStr(.fields("PttAhCode"))
        End If
    End If
    End With
    CloseTable tRecset
End If

txtAraName.Text = fcmbAraName.Text
txtStnName.Text = fcmbStnName.Text
txtPcgName.Text = fcmbPcgName.Text
txtAhName.Text = fcmbAhName.Text

Call ShowPatAge
Call ShowPatBal
Set tRecset = Nothing

End Sub

Private Sub StorePatOldData()
mPttCode_old = mLrcPttCode
mPttName_old = txtPttName.Text
mPttRegNo_old = Val(UnMyNumFmt(mskPttRegNo.Text))
mPttPcgCode_old = Val(fcmbPcgName.BoundText)
mPttAhCode_old = Val(fcmbAhName.BoundText)
mPttAraCode_old = Val(fcmbAraName.BoundText)

End Sub

Private Sub ShowPatBal()
Dim mOpnBal As Double, mCurBal As Double, mLCount As Integer, mUCount As Integer, mCount As Integer

mOpnBal = 0
With clsAH
.GetData Val(fcmbAhName.BoundText)
Rem opn balance
mLCount = .LOpnBal
mUCount = .UOpnBal
For mCount = mLCount To mUCount
    mOpnBal = mOpnBal + .OpnAmt(mCount)
Next mCount

Rem current balance
mLCount = .LCurBal
mUCount = .UCurBal
For mCount = mLCount To mUCount
    mCurBal = mCurBal + .CurAmt(mCount)
Next mCount
End With

'mskAhOpBal.Text = ToMyNumFmt(mOpnBal, mUseAbs:=True)
lblAhCurBal.Caption = ToMyAcFmt(mCurBal)
'txtDrCrFlag.Text = SenseDrCrFlag(mOpnBal)

End Sub

Private Sub ShowLrcData(ByVal mLrcCode As Long)
With clsLRC
.GetHdrData mLrcCode

mskFormBoundField.Text = mLrcCode
fcmbLrcVtmName.BoundText = CStr(.mTrnVtmCode_lng): txtLrcVtmName(0).Text = fcmbLrcVtmName.Text
txtLrcPrefix.Text = .mTrnPrefix_str
mskLrcVchNo(0).Text = ToMyNumFmt(.mTrnVchNo_lng, mDecimals:=0)
dtpLrcDate.Text = Dtoc(.mTrnDate_dt)
txtLrcTime_str.Text = MinToTime(.mLhrTime_lng)

fcmbCDctName.BoundText = CStr(.mLhrCDctCode_lng): txtCDctName.Text = fcmbCDctName.Text
fcmbRByName.BoundText = CStr(.mLhrRByCode_lng): txtRByName.Text = fcmbRByName.Text
fcmbFDigName.BoundText = CStr(.mLhrFDigCode_lng): txtFDigName.Text = fcmbFDigName.Text
txtLhrRemark.Text = .mLhrRemark_str
mskLrcPttDiscPer.Text = ToMyPerFmt(.mLhrPttDiscPer_dbl)

mskLrcAdvAmtTot.Text = ToMyNumFmt(.mLhrAdvAmt_dbl)
mskLrcRecdAmtTot.Text = ToMyNumFmt(.mLhrRecdAmt_dbl)
mskLrcDepoAmtTot.Text = ToMyNumFmt(.mLhrDepoAmt_dbl)
mskLrcRefuAmtTot.Text = ToMyNumFmt(.mLhrRefuAmt_dbl)

Rem old lab receipt
mLrcOldLrcCode = .mLhrOldLhrCode_lng
ShowOldLrcCodeDesc mLrcOldLrcCode
End With

'Call CalcLrcChg
ShowDtlData mLrcCode
Call ShowLinkTranDtl

End Sub

Private Sub ShowLrcDefData()
Dim mLrcVchNo As Long, tRecset As ADODB.Recordset

dtpLrcDate.Text = Dtoc(DefaultEntryDate)
txtLrcTime_str.Text = MinToTime(TimeToMin(DateTime.Time$))

fcmbLrcVtmName.BoundText = CStr(clsHOPT.GetLabRcptOptBoundCode("LrcVtmCode"))
fcmbCDctName.BoundText = CStr(clsHOPT.GetLabRegOptBoundCode("LpgCDctCode"))
fcmbRByName.BoundText = CStr(clsHOPT.GetLabRegOptBoundCode("LpgRByCode"))
fcmbFDigName.BoundText = CStr(clsHOPT.GetLabRegOptBoundCode("LpgFDigCode"))

If Val(fcmbLrcVtmName.BoundText) = 0 Or Val(fcmbCDctName.BoundText) = 0 Or Val(fcmbRByName.BoundText) = 0 Or Val(fcmbFDigName.BoundText) = 0 Then
    Set tRecset = dbHmsDatabase.Execute("Select top 1 * from LabHdr order by LhrCode desc")
    With tRecset
    If .EOF = False Then
        If Val(fcmbLrcVtmName.BoundText) = 0 Then
            fcmbLrcVtmName.BoundText = CStr(.fields("LhrVtmCode"))
        End If
        If Val(fcmbCDctName.BoundText) = 0 Then
            fcmbCDctName.BoundText = CStr(.fields("LhrCDctCode"))
        End If
        If Val(fcmbRByName.BoundText) = 0 Then
            fcmbRByName.BoundText = CStr(.fields("LhrRByCode"))
        End If
        If Val(fcmbFDigName.BoundText) = 0 Then
            fcmbFDigName.BoundText = CStr(.fields("LhrFDigCode"))
        End If
    End If
    End With
    CloseTable tRecset
End If

txtLrcVtmName(0).Text = fcmbLrcVtmName.Text
txtCDctName.Text = fcmbCDctName.Text
txtRByName.Text = fcmbRByName.Text
txtFDigName.Text = fcmbFDigName.Text

mLrcVchNo = GetNextVTypeNo(dbHmsDatabase, dbAcDatabase, dbComDatabase, mTableName:="LabHdr", mFieldName:="LhrVchNo", mVtmFieldName:="LhrVtmCode", mVtmFieldValue:=Val(fcmbLrcVtmName.BoundText), mFinYrFieldName:="LhrCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="LhrDate", mDateFieldValue:=Ctod(dtpLrcDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormLrcAcsPermFileName)
mskLrcVchNo(0).Text = ToMyNumFmt(mLrcVchNo, mDecimals:=0)

Set tRecset = Nothing

End Sub

Private Sub StoreLrcOldData()
mLrcCode_old = mLrcCode
mLrcDate_old = Ctod(dtpLrcDate.Text)
mLrcTime_old = TimeToMin(txtLrcTime_str.Text)
mLrcVtmCode_old = Val(fcmbLrcVtmName.BoundText)
mLrcVchNo_old = Val(UnMyNumFmt(mskLrcVchNo(0).Text))
mLrcCDctCode_old = Val(fcmbCDctName.BoundText)
mLrcRByCode_old = Val(fcmbRByName.BoundText)
Rem mLrcRToCode_old = Val(fcmbRToName.BoundText)
mLrcRecdAmtTot_old = Val(UnMyNumFmt(mskLrcRecdAmtTot.Text))

mskLrcDiscPer.Tag = False
mskLrcDiscAmt.Tag = False

End Sub

Private Sub ShowDtlData(ByVal mLrcCode As Long)
Dim srow As Integer, tRecset As New ADODB.Recordset, mColCnt As Integer, mSdcCount As Integer

srow = 1
Mfgrd2.Rows = 2

With tRecset
.open "Select * from LabRcpt where LrcCode=" & CStr(mLrcCode) & " order by LrcSno", dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Do While .EOF = False
        If InList(.fields("LrcRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
            clsSRV.GetData .fields("LrcSrvCode")
            
            Mfgrd2.TextMatrix(srow, X2LRCICODE_COL) = .fields("LrcICode")
            Mfgrd2.TextMatrix(srow, X2LRCSNO_COL) = ToMyNumFmt(.fields("LrcSno"), mDecimals:=0)
            Mfgrd2.TextMatrix(srow, X2SRVNAME_COL) = clsSRV.mName_str
            If GetServDctDtlCount(cnn:=dbHmsDatabase, mTableName:="LabRcDctDtl", mSdcCodeField:="LrdCode", mSdcCode:=.fields("LrcCode"), mSdcSubCodeField:="LrdLrcCode", mSdcSubCode:=.fields("LrcICode")) > 0 Then
                Mfgrd2.TextMatrix(srow, X2SDCFLAG_COL) = "Y"
            Else
                If clsSRV.mSrvMultiDctIncl_bln = True Then
                    Mfgrd2.TextMatrix(srow, X2SDCFLAG_COL) = "N"
                Else
                    Mfgrd2.TextMatrix(srow, X2SDCFLAG_COL) = ""
                End If
            End If
            Mfgrd2.TextMatrix(srow, X2LRCUNIT_COL) = ToMyNumFmt(.fields("LrcUnit"), mDecimals:=0)
            Mfgrd2.TextMatrix(srow, X2LRCRATE_COL) = ToMyNumFmt(.fields("LrcRate"))
            Mfgrd2.TextMatrix(srow, X2LRCAMTBEFDISC_COL) = ToMyNumFmt(.fields("LrcAmtBefDisc"))
            Mfgrd2.TextMatrix(srow, X2LRCDISCPER_COL) = ToMyPerFmt(.fields("LrcDiscPer"))
            Mfgrd2.TextMatrix(srow, X2LRCDISCAMT_COL) = ToMyNumFmt(.fields("LrcDiscAmt"))
            Mfgrd2.TextMatrix(srow, X2LRCAMTAFTDISC_COL) = ToMyNumFmt(.fields("LrcAmtAftDisc"))
            Mfgrd2.TextMatrix(srow, X2LRCADVAMT_COL) = ToMyNumFmt(.fields("LrcAdvAmt"))
            Mfgrd2.TextMatrix(srow, X2LRCRECDAMT_COL) = ToMyNumFmt(.fields("LrcRecdAmt"))
            Mfgrd2.TextMatrix(srow, X2LRCDEPOAMT_COL) = ToMyNumFmt(.fields("LrcDepoAmt"))
            Mfgrd2.TextMatrix(srow, X2LRCREFUAMT_COL) = ToMyNumFmt(.fields("LrcRefuAmt"))
            Mfgrd2.TextMatrix(srow, X2LRCBALAMT_COL) = ToMyNumFmt(.fields("LrcBalAmt"))
            Mfgrd2.TextMatrix(srow, X2LRCSRVCODE_COL) = .fields("LrcSrvCode")
            Mfgrd2.TextMatrix(srow, X2LRCRECSTATE_COL) = .fields("LrcRecState")
            
            Mfgrd2.Rows = Mfgrd2.Rows + 1
            srow = srow + 1
        Else
            If InList(.fields("LrcRecState"), Array(cREC_CANCELED, cREC_DELETED)) = False Then
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

With clsPAT
If PatAddEditMode = cFORM_ADDMODE Then
    .Clear
Else
    .GetData mLrcPttCode
End If
.mName_str = txtPttName.Text
.mPttRegNo_lng = Val(UnMyNumFmt(mskPttRegNo.Text))
.mPttRegDate_dt = Ctod(dtpPttRegDate.Text)
.mPttSex_str = cmbPttSex.Text
.mPttAgeAsOnDt_dt = Ctod(dtpPttAgeAsOnDt.Text)
.mPttDob_dt = Ctod(dtpPttDob.Text)
.mPttPcgCode_lng = Val(fcmbPcgName.BoundText)
.mPttRefRela_str = cmbPttRefRela.Text
.mPttRefName_str = txtPttRefName.Text
.mPttAddr_str = txtPttAddr.Text
.mPttAraCode_lng = Val(fcmbAraName.BoundText)
.mPttStnCode_lng = Val(fcmbStnName.BoundText)
.mPttTelNo_str = txtPttTelNo.Text
.mPttSMSNo_str = txtPttSMSNo.Text
.mPttEmail_str = txtPttEmail.Text
.mPttInfAllowed_bln = (chkPttInfAllowed.Value = vbChecked)
.mPttDefAllowed_bln = (chkPttDefAllowed.Value = vbChecked)
.mPttDiscAllowed_bln = (chkPttDiscAllowed.Value = vbChecked)
.mPttDiscPer_dbl = Val(UnMyPerFmt(mskPttDiscPer.Text))
.mPttShowInList_bln = (chkPttShowInList.Value = vbChecked)
.mPttRemark_str = ""    ''' txtPttRemark.Text
.mPttAhCode_lng = Val(fcmbAhName.BoundText)
If PatAddEditMode = cFORM_ADDMODE Then
    .AddNew
    mskLrcPttCode.Text = .mCode_lng
Else
    .Update mLrcPttCode
End If
If .mCode_lng > 0 Then   ' updated successfully
    mLrcPttCode = .mCode_lng
    
    .UpdateMast .mCode_lng
    .EndMast .mCode_lng
    
    With clsLRC
    If FormAddEditMode = cFORM_ADDMODE Then
        .ClearHdr
    Else
        .GetHdrData mLrcCode
    End If
    .mTrnDate_dt = Ctod(dtpLrcDate.Text)
    .mTrnVtmCode_lng = Val(fcmbLrcVtmName.BoundText)
    .mTrnPrefix_str = txtLrcPrefix.Text
    .mTrnVchNo_lng = Val(UnMyNumFmt(mskLrcVchNo(0).Text))
    .mTrnPostfix_str = ""
    .mTrnCmpCode_int = sFinYrCmpCode
    
    .mLhrTime_lng = TimeToMin(txtLrcTime_str.Text)
    .mLhrLpgCode_lng = 0    ''' mLrcLpgCode
    .mLhrPttCode_lng = mLrcPttCode
    .mLhrCDctCode_lng = Val(fcmbCDctName.BoundText)
    .mLhrRByCode_lng = Val(fcmbRByName.BoundText)
    .mLhrFDigCode_lng = Val(fcmbFDigName.BoundText)
    .mLhrPttDiscPer_dbl = Val(UnMyPerFmt(mskLrcPttDiscPer.Text))
    .mLhrOldLhrCode_lng = mLrcOldLrcCode
    .mLhrAmtBefDisc_dbl = Val(UnMyNumFmt(lblLrcAmtBefDiscTot.Caption))
    .mLhrDiscAmt_dbl = Val(UnMyNumFmt(lblLrcDiscAmtTot.Caption))
    .mLhrAmtAftDisc_dbl = Val(UnMyNumFmt(lblLrcAmtAftDiscTot.Caption))
    .mLhrAdvAmt_dbl = Val(UnMyNumFmt(mskLrcAdvAmtTot.Text))
    .mLhrRecdAmt_dbl = Val(UnMyNumFmt(mskLrcRecdAmtTot.Text))
    .mLhrDepoAmt_dbl = Val(UnMyNumFmt(mskLrcDepoAmtTot.Text))
    .mLhrRefuAmt_dbl = Val(UnMyNumFmt(mskLrcRefuAmtTot.Text))
    .mLhrBalAmt_dbl = Val(UnMyNumFmt(mskLrcBalAmtTot.Text))
    .mLhrRemark_str = txtLhrRemark.Text
    
    If FormAddEditMode = cFORM_ADDMODE Then
        If .AddNewHdr() = True Then
            mskFormBoundField.Text = .mTrnCode_lng
            
            Rem remove any unexpected doctor detail for service
            dbHmsDatabase.BeginTrans
            dbHmsDatabase.Execute "Delete from LabRcDctDtl where LrdLrcCode IN (Select LrcICode from LabRcpt as lrc inner join ServMast as srv on lrc.LrcSrvCode = srv.SrvCode where srv.SrvMultiDctIncl = False and lrc.LrcCode = " & CStr(mLrcCode) & ") and LrdCode = " & CStr(mLrcCode) & ""
            dbHmsDatabase.CommitTrans
            
            Rem updating linked autonumber
            Rem dbHmsDatabase.BeginTrans
            Rem dbHmsDatabase.Execute "Update LabRcDctDtl set LrdCode=" & CStr(.mTrnCode_lng) & " where LrdCode=" & CStr(mLrcCode) & ""
            Rem dbHmsDatabase.CommitTrans
        End If
    Else
        .UpdateHdr mLrcCode
    End If
    If .mTrnCode_lng > 0 Then   ' updated successfully
        mLrcCode = .mTrnCode_lng
        
        .UpdateTran .mTrnCode_lng
        .EndTran .mTrnCode_lng
        
        Rem updating user editing carry forward features
        clsHOPT.mLrcVtmCodeOld_lng = .mTrnVtmCode_lng
        clsHOPT.UpdateLabRcptOld
        
        mEntrySaved = True
    Else
        Call Data_CancelEvent
        ErrorBox "Entry Cancelled !!!"
    End If
    End With
Else
    Call Data_CancelEvent
    ErrorBox "Entry Cancelled !!!"
End If
End With

If clsLRC.mTrnCode_lng > 0 Then   ' updated successfully
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

mLrcCode = datRecset.fields("LhrCode")
mLrcPttCode = datRecset.fields("LhrPttCode")
mRecAbsPos = datRecset.AbsolutePosition

If clsLRC.CanDeleteTran(mLrcCode) = True Then
    txtVoid.SetFocus
    If clsLRC.BeginTran(mLrcCode) = True Then
        clsLRC.DeleteTran mLrcCode
        clsLRC.UpdateTran mLrcCode
        clsLRC.EndTran mLrcCode
        
        Rem clsPAT.DeleteMast mLrcPttCode
        Rem clsPAT.UpdateMast mLrcPttCode
        Rem clsPAT.EndMast mLrcPttCode
        
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
clsLRC.CancelTran mLrcCode
clsLRC.EndTran mLrcCode

clsPAT.CancelMast mLrcPttCode
clsPAT.EndMast mLrcPttCode

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

'''Private Sub txtPttRefRela_GotFocus()
'''FlashActiveControl txtPttRefRela, True
'''End Sub
'''
'''Private Sub txtPttRefRela_LostFocus()
'''FlashActiveControl txtPttRefRela, False
'''End Sub
'''
'''Private Sub txtPttSex_GotFocus()
'''FlashActiveControl txtPttSex, True
'''End Sub
'''
'''Private Sub txtPttSex_LostFocus()
'''FlashActiveControl txtPttSex, False
'''End Sub

Private Sub txtPttSMSNo_GotFocus()
FlashActiveControl txtPttSMSNo, True
End Sub

Private Sub txtPttSMSNo_LostFocus()
FlashActiveControl txtPttSMSNo, False
End Sub

Private Sub txtPttSMSNo_Validate(Cancel As Boolean)
txtPttSMSNo.Text = ToMyString(Trim(txtPttSMSNo.Text))
If txtPttSMSNo.Text <> "" Then
    If Left(txtPttSMSNo.Text, 1) <> "0" Then
        txtPttSMSNo.Text = "0" & txtPttSMSNo.Text
    End If
End If
If PatAddEditMode = cFORM_ADDMODE And txtPttSMSNo.Text <> "" Then
    ChkDuplPatByContNo cnn:=dbHmsDatabase, mPttCode:=mLrcPttCode, mContNo:=txtPttSMSNo.Text
End If

End Sub

Private Sub txtPttTelNo_GotFocus()
FlashActiveControl txtPttTelNo, True
End Sub

Private Sub txtPttTelNo_LostFocus()
FlashActiveControl txtPttTelNo, False
End Sub

Private Sub txtPttTelNo_Validate(Cancel As Boolean)
txtPttTelNo.Text = ToMyString(Trim(txtPttTelNo.Text))
If txtPttTelNo.Text <> "" Then
    If Left(txtPttTelNo.Text, 1) <> "0" Then
        txtPttTelNo.Text = "0" & txtPttTelNo.Text
    End If
End If
If PatAddEditMode = cFORM_ADDMODE And txtPttTelNo.Text <> "" Then
    ChkDuplPatByContNo cnn:=dbHmsDatabase, mPttCode:=mLrcPttCode, mContNo:=txtPttTelNo.Text
End If

End Sub

Private Sub txtPcgName_Change()
If fcmbPcgName.CallFromText_Change = False Then
    fcmbPcgName.CallFromText_Change = True
    If InterActiveChange(txtPcgName) = True Then
        fcmbPcgName.UserText = Array(txtPcgName.Text, txtPcgName.SelStart)
        fcmbPcgName.Show
        txtPcgName.Text = fcmbPcgName.Text
        If fcmbPcgName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbPcgName.CallFromText_Change = False
End If

End Sub

Private Sub txtPcgName_GotFocus()
FlashActiveControl txtPcgName, True
End Sub

Private Sub txtPcgName_LostFocus()
FlashActiveControl txtPcgName, False
End Sub

Private Sub txtPcgName_Validate(Cancel As Boolean)
If Val(fcmbPcgName.BoundText) <= 0 Then
    ErrorBox "Invalid Selection !!!"
    txtPcgName.SetFocus
    Cancel = True
Else
    If mPttPcgCode_old <> Val(fcmbPcgName.BoundText) Or FormAddEditMode = cFORM_ADDMODE Then
        Rem clsPCG.GetData Val(fcmbPcgName.BoundText)
        
        Rem chkPttInfAllowed.Value = IIf(clsPCG.mPcgInfAllowed_bln = True, vbChecked, vbUnchecked)
        Rem chkPttDefAllowed.Value = IIf(clsPCG.mPcgDefAllowed_bln = True, vbChecked, vbUnchecked)
        Rem chkPttDiscAllowed.Value = IIf(clsPCG.mPcgDiscAllowed_bln = True, vbChecked, vbUnchecked)
        Rem mskPttDiscPer.Text = ToMyPerFmt(clsPCG.mPcgDiscPer_dbl)
        
        Rem Call ChkServRate
        Rem Call CalcLrcChg
    End If
End If

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
        clsListStru.AddFields mExpr:="LrcYrMonth", mAttrib:=cFAT_SYSTEM
        clsListStru.AddFields mExpr:="LrcMnYear", mTitle:="Month", mShowItem:=True, mAlign:=1, mWidth:=2000
        clsListStru.AddFields mExpr:="LrcCount", mTitle:="Count", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="LrcAmtAftDisc_sum", mTitle:="Charges", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="LrcBalAmt_sum", mTitle:="Due Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="LrcAdvAmt_sum", mTitle:="Adv.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="LrcRecdAmt_sum", mTitle:="Recd.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="LrcDepoAmt_sum", mTitle:="Depo.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="LrcRefuAmt_sum", mTitle:="Refu.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="LrcDiscAmt_sum", mTitle:="Discount", mShowItem:=True, mAlign:=7, mWidth:=1500
        
        datRecset.open "Select format(LhrDate,'yyyy/MM') as LrcYrMonth" _
         & ",Count(LhrCode) as LrcCount" _
         & ",Sum(LhrAmtAftDisc) as LrcAmtAftDisc_sum" _
         & ",Sum(LhrBalAmt) as LrcBalAmt_sum" _
         & ",Sum(LhrAdvAmt) as LrcAdvAmt_sum" _
         & ",Sum(LhrRecdAmt) as LrcRecdAmt_sum" _
         & ",Sum(LhrDepoAmt) as LrcDepoAmt_sum" _
         & ",Sum(LhrRefuAmt) as LrcRefuAmt_sum" _
         & ",Sum(LhrDiscAmt) as LrcDiscAmt_sum" _
         & " from LabHdr" _
         & " where LhrDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and LhrCode>0" _
         & IIf(mQryPttCode > 0, " and LhrPttCode = " & CStr(mQryPttCode), "") _
         & " group by format(LhrDate,'yyyy/MM')" _
         & " order by format(LhrDate,'yyyy/MM')" _
         , dbComDatabase, adOpenKeyset, adLockReadOnly

    ElseIf optDatewise.Value = True Then
        clsListStru.AddFields mExpr:="LrcDateYMD", mAttrib:=cFAT_SYSTEM
        clsListStru.AddFields mExpr:="LrcDate", mTitle:="Date", mShowItem:=True, mAlign:=1, mWidth:=2000
        clsListStru.AddFields mExpr:="LrcCount", mTitle:="Count", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="LrcAmtAftDisc_sum", mTitle:="Charges", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="LrcBalAmt_sum", mTitle:="Due Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="LrcAdvAmt_sum", mTitle:="Adv.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="LrcRecdAmt_sum", mTitle:="Recd.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="LrcDepoAmt_sum", mTitle:="Depo.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="LrcRefuAmt_sum", mTitle:="Refu.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="LrcDiscAmt_sum", mTitle:="Discount", mShowItem:=True, mAlign:=7, mWidth:=1500
        
        datRecset.open "Select LhrDate" _
         & ",Count(LhrCode) as LrcCount" _
         & ",Sum(LhrAmtAftDisc) as LrcAmtAftDisc_sum" _
         & ",Sum(LhrBalAmt) as LrcBalAmt_sum" _
         & ",Sum(LhrAdvAmt) as LrcAdvAmt_sum" _
         & ",Sum(LhrRecdAmt) as LrcRecdAmt_sum" _
         & ",Sum(LhrDepoAmt) as LrcDepoAmt_sum" _
         & ",Sum(LhrRefuAmt) as LrcRefuAmt_sum" _
         & ",Sum(LhrDiscAmt) as LrcDiscAmt_sum" _
         & " from LabHdr" _
         & " where LhrDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and LhrCode>0" _
         & IIf(mQryPttCode > 0, " and LhrPttCode = " & CStr(mQryPttCode), "") _
         & " group by LhrDate" _
         & " order by LhrDate" _
         , dbComDatabase, adOpenKeyset, adLockReadOnly
        
    ElseIf optPatientwise.Value = True Then
        clsListStru.AddFields mExpr:="PttName", mTitle:="Patient Name", mShowItem:=True, mAlign:=1, mWidth:=3000
        clsListStru.AddFields mExpr:="PttRegNo", mTitle:="Reg.No", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="PttRefName", mTitle:="Care of", mShowItem:=True, mAlign:=1, mWidth:=2000
        clsListStru.AddFields mExpr:="LrcCount", mTitle:="Count", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="LrcAmtAftDisc_sum", mTitle:="Charges", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="LrcBalAmt_sum", mTitle:="Due Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="LrcAdvAmt_sum", mTitle:="Adv.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="LrcRecdAmt_sum", mTitle:="Recd.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="LrcDepoAmt_sum", mTitle:="Depo.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="LrcRefuAmt_sum", mTitle:="Refu.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="LrcDiscAmt_sum", mTitle:="Discount", mShowItem:=True, mAlign:=7, mWidth:=1500
        
        datRecset.open "Select PatMast.PttName,PatMast.PttRegNo,LabHdr.LhrPttCode" _
         & ",Count(LhrCode) as LrcCount" _
         & ",Sum(LhrAmtAftDisc) as LrcAmtAftDisc_sum" _
         & ",Sum(LhrBalAmt) as LrcBalAmt_sum" _
         & ",Sum(LhrAdvAmt) as LrcAdvAmt_sum" _
         & ",Sum(LhrRecdAmt) as LrcRecdAmt_sum" _
         & ",Sum(LhrDepoAmt) as LrcDepoAmt_sum" _
         & ",Sum(LhrRefuAmt) as LrcRefuAmt_sum" _
         & ",Sum(LhrDiscAmt) as LrcDiscAmt_sum" _
         & " from LabHdr inner join PatMast on LabHdr.LhrPttCode = PatMast.PttCode" _
         & " where LhrDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and LhrCode > 0" _
         & IIf(mQryPttCode > 0, " and LhrPttCode = " & CStr(mQryPttCode), "") _
         & " group by PatMast.PttName,PatMast.PttRegNo,LabHdr.LhrPttCode" _
         & " order by PatMast.PttName,PatMast.PttRegNo,LabHdr.LhrPttCode" _
         , dbComDatabase, adOpenKeyset, adLockReadOnly
    End If
    
ElseIf optDetailed.Value = True Then
    clsListStru.AddFields mExpr:="tLrcSmryId", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="LrcCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="VtmName", mTitle:="Voucher", mAlign:=1, mWidth:=1500, mShowItem:=True
    clsListStru.AddFields mExpr:="LrcVchNo", mTitle:="Vchr.No", mAlign:=7, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="LrcDate", mTitle:="Date", mAlign:=1, mWidth:=1300, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="PttCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="PttName", mTitle:="Patient Name", mAlign:=1, mWidth:=2500, mShowItem:=True
    clsListStru.AddFields mExpr:="PttRegNo", mTitle:="Reg.No", mAlign:=7, mWidth:=1250, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="LrcAmtAftDisc", mTitle:="Charges", mAlign:=7, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="LrcBalAmt", mTitle:="Due Amt", mAlign:=7, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="LrcAdvAmt", mTitle:="Adv.Amt", mAlign:=7, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="LrcRecdAmt", mTitle:="Recd.Amt", mAlign:=7, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="LrcDepoAmt", mTitle:="Depo.Amt", mAlign:=7, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="LrcRefuAmt", mTitle:="Refu.Amt", mAlign:=7, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="LrcDiscAmt", mTitle:="Discount", mAlign:=7, mWidth:=1250, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="PttRefName", mTitle:="Care of", mAlign:=1, mWidth:=2000, mShowItem:=True
    clsListStru.AddFields mExpr:="PttAddr", mTitle:="Address", mAlign:=1, mWidth:=2000, mShowItem:=True
    clsListStru.AddFields mExpr:="PatAraName", mTitle:="Area", mAlign:=1, mWidth:=1500, mShowItem:=True
    clsListStru.AddFields mExpr:="PatStnName", mTitle:="Station", mAlign:=1, mWidth:=1500, mShowItem:=True
    clsListStru.AddFields mExpr:="PatPcgName", mTitle:="Category", mAlign:=1, mWidth:=2000, mShowItem:=True
    
    datRecset.open "Select LabHdr.*,PatMast.*,PatCatgMst.PcgName,AreaMast.AraName,StsnMast.StnName,VTypMast.VtmName" _
     & ",format(LhrDate,'yyyymmdd')+format(LhrCode,'0000000') as tLrcSmryId" _
     & " from (LabHdr inner join (((PatMast" _
     & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
     & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode)" _
     & " inner join PatCatgMst on PatMast.PttPcgCode = PatCatgMst.PcgCode)" _
     & " on LabHdr.LhrPttCode = PatMast.PttCode)" _
     & " inner join VTypMast on LabHdr.LhrVtmCode = VTypMast.VtmCode" _
     & " where LhrDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & IIf(mRemoteAccess = True, " and LhrCode=" & CStr(mLrcCode) & "", "") _
     & " and LhrCode>0" _
     & IIf(mQryPttCode > 0, " and LhrPttCode = " & CStr(mQryPttCode), "") _
     & " order by LhrDate,LhrCode" _
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
If IsValidRec(tRecset) = True Then
Rem If .RecordCount > 0 Then
    Do While .EOF = False
        If optMonthwise.Value = True Or optDatewise.Value = True Or optPatientwise.Value = True Then
            If optMonthwise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("LrcYrMonth")) = .fields("LrcYrMonth")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("LrcMnYear")) = MonthName(Val(Right(.fields("LrcYrMonth"), 2))) & "-" & Left(.fields("LrcYrMonth"), 4)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("LrcCount")) = ToMyNumFmt(.fields("LrcCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("LrcAmtAftDisc_sum")) = ToMyNumFmt(.fields("LrcAmtAftDisc_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("LrcBalAmt_sum")) = ToMyNumFmt(.fields("LrcBalAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("LrcAdvAmt_sum")) = ToMyNumFmt(.fields("LrcAdvAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("LrcRecdAmt_sum")) = ToMyNumFmt(.fields("LrcRecdAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("LrcDepoAmt_sum")) = ToMyNumFmt(.fields("LrcDepoAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("LrcRefuAmt_sum")) = ToMyNumFmt(.fields("LrcRefuAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("LrcDiscAmt_sum")) = ToMyNumFmt(.fields("LrcDiscAmt_sum"))
                
            ElseIf optDatewise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("LrcDateYMD")) = Format(.fields("LhrDate"), "yyyymmdd")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("LrcDate")) = Dtoc(.fields("LhrDate"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("LrcCount")) = ToMyNumFmt(.fields("LrcCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("LrcAmtAftDisc_sum")) = ToMyNumFmt(.fields("LrcAmtAftDisc_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("LrcBalAmt_sum")) = ToMyNumFmt(.fields("LrcBalAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("LrcAdvAmt_sum")) = ToMyNumFmt(.fields("LrcAdvAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("LrcRecdAmt_sum")) = ToMyNumFmt(.fields("LrcRecdAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("LrcDepoAmt_sum")) = ToMyNumFmt(.fields("LrcDepoAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("LrcRefuAmt_sum")) = ToMyNumFmt(.fields("LrcRefuAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("LrcDiscAmt_sum")) = ToMyNumFmt(.fields("LrcDiscAmt_sum"))
                
            ElseIf optPatientwise.Value = True Then
                clsPAT.GetData .fields("LhrPttCode")
                
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttName")) = .fields("PttName")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttRegNo")) = ToMyNumFmt(.fields("PttRegNo"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttRefName")) = clsPAT.mPttRefName_str
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("LrcCount")) = ToMyNumFmt(.fields("LrcCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("LrcAmtAftDisc_sum")) = ToMyNumFmt(.fields("LrcAmtAftDisc_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("LrcBalAmt_sum")) = ToMyNumFmt(.fields("LrcBalAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("LrcAdvAmt_sum")) = ToMyNumFmt(.fields("LrcAdvAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("LrcRecdAmt_sum")) = ToMyNumFmt(.fields("LrcRecdAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("LrcDepoAmt_sum")) = ToMyNumFmt(.fields("LrcDepoAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("LrcRefuAmt_sum")) = ToMyNumFmt(.fields("LrcRefuAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("LrcDiscAmt_sum")) = ToMyNumFmt(.fields("LrcDiscAmt_sum"))
                
            End If
        
        ElseIf optDetailed.Value = True Then
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("tLrcSmryId")) = Format(.fields("LhrDate"), "yyyymmdd") & Format(.fields("LhrCode"), "0000000")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("LrcCode")) = .fields("LhrCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("VtmName")) = .fields("VtmName")   ''' clsVTM.mName_str
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("LrcVchNo")) = .fields("LhrVchNo")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("LrcDate")) = Dtoc(.fields("LhrDate"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("LrcAmtAftDisc")) = ToMyNumFmt(.fields("LhrAmtAftDisc"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("LrcBalAmt")) = ToMyNumFmt(.fields("LhrBalAmt"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("LrcAdvAmt")) = ToMyNumFmt(.fields("LhrAdvAmt"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("LrcRecdAmt")) = ToMyNumFmt(.fields("LhrRecdAmt"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("LrcDepoAmt")) = ToMyNumFmt(.fields("LhrDepoAmt"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("LrcRefuAmt")) = ToMyNumFmt(.fields("LhrRefuAmt"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("LrcDiscAmt")) = ToMyNumFmt(.fields("LhrDiscAmt"))
            ' ------------------------------------
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttCode")) = .fields("PttCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttName")) = .fields("PttName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttRegNo")) = .fields("PttRegNo")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttRefName")) = .fields("PttRefName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttAddr")) = .fields("PttAddr")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PatAraName")) = .fields("AraName")    ''' clsARA.mName_str
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PatStnName")) = .fields("StnName")    ''' clsSTN.mName_str
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PatPcgName")) = .fields("PcgName")    ''' clsPCG.mName_str
        
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
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("tLrcSmryId"), mText
    ElseIf optMonthwise.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("LrcYrMonth"), mText
    ElseIf optDatewise.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("LrcDateYMD"), mText
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

Private Sub txtRByName_Change()
If fcmbRByName.CallFromText_Change = False Then
    fcmbRByName.CallFromText_Change = True
    If InterActiveChange(txtRByName) = True Then
        fcmbRByName.UserText = Array(txtRByName.Text, txtRByName.SelStart)
        fcmbRByName.Show
        txtRByName.Text = fcmbRByName.Text
        If fcmbRByName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbRByName.CallFromText_Change = False
End If

End Sub

Private Sub txtRByName_GotFocus()
FlashActiveControl txtRByName, True
End Sub

Private Sub txtRByName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtRByName_Change
End If

End Sub

Private Sub txtRByName_LostFocus()
FlashActiveControl txtRByName, False
End Sub

Private Sub txtRByName_Validate(Cancel As Boolean)
If Val(fcmbRByName.BoundText) <= 0 Then
    'ErrorBox "Invalid Selection !!!"
    'txtRByName.SetFocus
    'Cancel = True
Else
'''    Call ChkServRate
'''    Call CalcOpgChg
End If

End Sub

Private Sub txtSdcFlag_KeyPress(KeyAscii As Integer)
If KeyAscii = vbKeyReturn And Val(fcmbSrvName.BoundText) > 0 And (mLrcPttCode > 0 Or FormAddEditMode = cFORM_ADDMODE) Then         ''' And mLrcLpgCode > 0
    clsSRV.GetData Val(fcmbSrvName.BoundText)
    If clsSRV.mSrvMultiDctIncl_bln = True Then
        ShowSdcDtlData mLrcCode, Val(mskLrcICode.Text)
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
If Val(fcmbSDctName.BoundText) < 1 Then
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
    ErrorBox "Invalid Selection !!!"
    txtSrvName.SetFocus
    Cancel = True
Else
    If Val(fcmbSrvName.BoundText) <> mLrcSrvCode_old Or dtlAddMode = True Then
        'clsSRV.GetData Val(fcmbSrvName.BoundText)
        'mskLrcRate.Text = ToMyNumFmt(clsSRV.mSrvRate_dbl)
        'If Val(UnMyPerFmt(mskLrcPttDiscPer.Text)) = 0 Then
        '    mskLrcDiscPer.Text = ToMyPerFmt(clsSRV.mSrvDiscPer_dbl)
        'End If
        Call ChkServRate
        Call CalcLrcChg
        Call ChkLrcICode
    End If
End If
Call ValidDtl

End Sub

Private Sub ChkLrcICode()
If mLrcCode <> 0 And (mLrcPttCode <> 0 Or FormAddEditMode = cFORM_ADDMODE) Then    ''' And mLrcLpgCode <> 0
    If dtlAddMode = True And Val(fcmbSrvName.BoundText) > 0 And Val(fcmbSrvName.BoundText) <> mLrcSrvCode_old Then          ''' And Val(mskLrcICode.Text) = 0
        Rem mskLrcICode.Text = clsLRC.GetDtlTranUnqCode()
        
        clsSRV.GetData Val(fcmbSrvName.BoundText)
        If clsSRV.mSrvMultiDctIncl_bln = True Then
            txtSdcFlag.Text = "N"
        End If
    End If
End If

End Sub

Private Sub txtStnName_Change()
If fcmbStnName.CallFromText_Change = False Then
    fcmbStnName.CallFromText_Change = True
    If InterActiveChange(txtStnName) = True Then
        fcmbStnName.UserText = Array(txtStnName.Text, txtStnName.SelStart)
        fcmbStnName.Show
        txtStnName.Text = fcmbStnName.Text
        If fcmbStnName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbStnName.CallFromText_Change = False
End If

End Sub

Private Sub txtStnName_GotFocus()
FlashActiveControl txtStnName, True
End Sub

Private Sub txtStnName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtStnName_Change
End If

End Sub

Private Sub txtStnName_LostFocus()
FlashActiveControl txtStnName, False
End Sub

Private Sub txtStnName_Validate(Cancel As Boolean)
If Val(fcmbStnName.BoundText) <= 0 Then
    ErrorBox "Invalid Selection !!!"
    txtStnName.SetFocus
    Cancel = True
End If

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

'''Private Sub txtLpgVtmName_GotFocus()
'''FlashActiveControl txtLpgVtmName, True
'''End Sub
'''
'''Private Sub txtLpgVtmName_KeyDown(KeyCode As Integer, Shift As Integer)
'''If MyDropDownKey(Shift, KeyCode) = True Then
'''    Call ShowOldLpgListByLpgNo
'''ElseIf MyAddNewKey(Shift, KeyCode) = True Then
'''
'''ElseIf Shift = 0 And KeyCode = vbKeyF6 Then
'''
'''End If
'''
'''End Sub
'''
'''Private Sub txtLpgVtmName_LostFocus()
'''FlashActiveControl txtLpgVtmName, False
'''End Sub

Private Sub ChkServRate()
Dim mLrcRate As Double, mLrcDiscPer As Double, mLrcInfByPer As Double, mLrcDefByPer As Double

clsLRC.GetHdrData Val(UnMyNumFmt(mskFormBoundField.Text))
clsPAT.GetData Val(UnMyNumFmt(mskLrcPttCode.Text))
If Val(fcmbSrvName.BoundText) <> mLrcSrvCode_old Or mLrcCDctCode_old <> clsLRC.mLhrCDctCode_lng Or mPttPcgCode_old <> clsPAT.mPttPcgCode_lng Or mLrcRByCode_old <> clsLRC.mLhrRByCode_lng Or mLrcRToCode_old <> clsLRC.mLhrRToCode_lng Or mLrcDate_old <> Ctod(dtpLrcDate.Text) Or mLrcTime_old <> TimeToMin(txtLrcTime_str) Or FormAddEditMode = cFORM_ADDMODE Then
    GetServRateValues cnn:=dbHmsDatabase, mSrvCode:=Val(fcmbSrvName.BoundText), mTranDate:=Ctod(dtpLrcDate.Text), mTranTime:=TimeToMin(txtLrcTime_str.Text), mSrmPttCode:=mLrcPttCode, mSrmDctCode:=clsLRC.mLhrCDctCode_lng, mSrmPcgCode:=clsPAT.mPttPcgCode_lng, mSrmRByCode:=clsLRC.mLhrRByCode_lng, mSrmRToCode:=0, mSrmRate:=mLrcRate, mSrmDiscPer:=mLrcDiscPer, mSrmInfByPer:=mLrcInfByPer, mSrmDefByPer:=mLrcDefByPer
'    If mLrcDiscPer = 0 And clsPAT.mPttDiscAllowed_bln = True Then
'        mLrcDiscPer = clsPAT.mPttDiscPer_dbl
'    End If
    If mLrcDiscPer = 0 And Val(UnMyPerFmt(mskLrcPttDiscPer.Text)) <> 0 Then
        mLrcDiscPer = Val(UnMyPerFmt(mskLrcPttDiscPer.Text))
    End If
    If mLrcInfByPer <> 0 Then
         mLrcRate = mLrcRate + (mLrcRate * mLrcInfByPer / 100)
    ElseIf mLrcDefByPer <> 0 Then
        mLrcRate = mLrcRate - (mLrcRate * mLrcDefByPer / 100)
    End If
    mskLrcRate.Text = ToMyNumFmt(mLrcRate)
    mskLrcDiscPer.Text = ToMyPerFmt(mLrcDiscPer)
End If

End Sub

Private Sub CalcLrcChg()
Dim mLrcUnit As Long, mLrcRate As Double, mLrcAmtBefDisc As Double, mLrcDiscPer As Double, mLrcDiscAmt As Double, mLrcAmtAftDisc As Double
mLrcUnit = Val(UnMyNumFmt(mskLrcUnit.Text))
mLrcRate = Val(UnMyNumFmt(mskLrcRate.Text))
mLrcAmtBefDisc = mLrcUnit * mLrcRate
mLrcDiscPer = Val(UnMyPerFmt(mskLrcDiscPer.Text))
mLrcDiscAmt = Val(UnMyNumFmt(mskLrcDiscAmt.Text))
If mskLrcDiscPer.Tag = True Then
    mLrcDiscAmt = Round(mLrcAmtBefDisc * mLrcDiscPer / 100, 2)
ElseIf mskLrcDiscAmt.Tag = True Then
    If mLrcDiscAmt <> 0 And mLrcAmtBefDisc <> 0 Then
        mLrcDiscPer = Round(mLrcDiscAmt * 100 / mLrcAmtBefDisc, 2)
    Else
        mLrcDiscPer = 0
    End If
ElseIf dtlAddMode = True Then
    mLrcDiscAmt = Round(mLrcAmtBefDisc * mLrcDiscPer / 100, 2)
End If
mLrcAmtAftDisc = mLrcAmtBefDisc - mLrcDiscAmt
' --------
mskLrcAmtBefDisc.Text = ToMyNumFmt(mLrcAmtBefDisc)
mskLrcDiscPer.Text = ToMyPerFmt(mLrcDiscPer)
mskLrcDiscAmt.Text = ToMyNumFmt(mLrcDiscAmt)
mskLrcAmtAftDisc.Text = ToMyNumFmt(mLrcAmtAftDisc)

End Sub

Private Sub ShowOldLrcCodeDesc(ByVal mOldLrcCode As Long)
Dim tRecset As New ADODB.Recordset

With tRecset
.open "Select * from LabHdr where LhrCode=" & CStr(mOldLrcCode) & "", dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    clsVTM.GetData .fields("LhrVtmCode")
    lblOldLrcCodeDesc.Caption = RTrim(clsVTM.mName_str) & " No.:" & CStr(.fields("LhrVchNo")) & " Dated:" & Dtoc(.fields("LhrDate"))
Else
    lblOldLrcCodeDesc.Caption = "#" & CStr(mOldLrcCode) & "#"
End If
End With
CloseTable tRecset

End Sub

Private Function GetOldLrcCodeFromPttCode(ByVal mPttCode As Long) As Long
Dim tRecset As New ADODB.Recordset

Set tRecset = dbHmsDatabase.Execute("Select top 1 * from LabHdr where LhrPttCode = " & CStr(mPttCode) & " order by LhrDate desc,LhrVchNo desc,LhrCode desc")
With tRecset
If .EOF = False Then
    GetOldLrcCodeFromPttCode = .fields("LhrCode")
Else
    GetOldLrcCodeFromPttCode = 0
End If
End With
CloseTable tRecset

End Function

'''Private Function GetOldLpgCodeFromPttCode(ByVal mPttCode As Long) As Long
'''Dim tRecset As New ADODB.Recordset
'''
'''With tRecset
'''.open "Select top 1 * from LabReg where LpgPttCode=" & CStr(mPttCode) & " order by LpgDate desc,LpgVchNo desc,LpgCode desc", dbHmsDatabase, adOpenKeyset, adLockOptimistic
'''If .RecordCount > 0 Then
'''    GetOldLpgCodeFromPttCode = .fields("LpgCode")
'''Else
'''    GetOldLpgCodeFromPttCode = 0
'''End If
'''End With
'''CloseTable tRecset
'''
'''End Function

Private Sub ShowPttDiscPer(ByVal mPttCode As Long)
Dim tRecset As New ADODB.Recordset

With tRecset
.open "Select * from PatMast where PttCode = " & CStr(mPttCode) & "", dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    If .fields("PttDiscAllowed") = True And .fields("PttDiscPer") > 0 Then
        'mskLrcPttDiscPer.Text = ToMyPerFmt(.fields("PttDiscPer"))
        'Call CalcLrcChg
    End If
End If
End With
CloseTable tRecset

End Sub

'''Private Sub ShowOldLpgListByLpgNo()
'''Dim tRecset As New ADODB.Recordset, mOldLpgCode As Long, mOldLpgPttCode As Long
'''
'''If fcmbOldLpgByLpgNo.CallFromText_Change = False Then
'''    fcmbOldLpgByLpgNo.CallFromText_Change = True
'''    If InterActiveChange(txtLpgVtmName) = True Then
'''        If fcmbOldLpgByLpgNo.LRecordCount = 0 Then
'''            fcmbOldLpgByLpgNo.mFiltCond = ""
'''            fcmbOldLpgByLpgNo.ReInit
'''        End If
'''
'''        fcmbOldLpgByLpgNo.UserText = Array("", 0)
'''        fcmbOldLpgByLpgNo.Show
'''        If FormAddEditMode = cFORM_ADDMODE And fcmbOldLpgByLpgNo.ListSelected = True And Val(fcmbOldLpgByLpgNo.BoundText) > 0 Then
'''            mOldLpgCode = Val(fcmbOldLpgByLpgNo.BoundText)
'''            tRecset.open "Select * from LabReg where LpgCode=" & CStr(mOldLpgCode) & "", dbHmsDatabase, adOpenKeyset, adLockOptimistic
'''            If tRecset.RecordCount > 0 Then
'''                mOldLpgPttCode = tRecset.fields("LpgPttCode")
'''            End If
'''            CloseTable tRecset
'''            If mOldLpgCode > 0 And mOldLpgPttCode > 0 Then
'''                mLrcPttCode = mOldLpgPttCode
'''                ShowPatData mLrcPttCode
'''                Call StorePatOldData
'''                ShowPttDiscPer mLrcPttCode
'''
'''                mLrcLpgCode = mOldLpgCode
'''                ShowLabData mLrcLpgCode
'''                Call StoreLabOldData
'''
'''                mLrcOldLrcCode = GetOldLrcCodeFromPttCode(mLrcPttCode)
'''                ShowOldLrcCodeDesc mLrcOldLrcCode
'''            End If
'''        Else
'''            If FormAddEditMode = cFORM_EDITMODE And fcmbOldLpgByLpgNo.ListSelected = True And Val(fcmbOldLpgByLpgNo.BoundText) > 0 Then
'''                AlertBox "Prohibited in Edit Mode !!!"
'''            End If
'''        End If
'''    End If
'''    fcmbOldLpgByLpgNo.CallFromText_Change = False
'''End If
'''CloseTable tRecset, mCheckOpen:=True
'''
'''End Sub

'''Private Sub ShowOldLpgListByPttRegNo()
'''Dim tRecset As New ADODB.Recordset, mOldLpgCode As Long, mOldLpgPttCode As Long
'''
'''If fcmbOldLpgByPttRegNo.CallFromText_Change = False Then
'''    fcmbOldLpgByPttRegNo.CallFromText_Change = True
'''    If InterActiveChange(mskPttRegNo) = True Then
'''        If fcmbOldLpgByPttRegNo.LRecordCount = 0 Then
'''            fcmbOldLpgByPttRegNo.mFiltCond = ""
'''            fcmbOldLpgByPttRegNo.ReInit
'''        End If
'''
'''        fcmbOldLpgByPttRegNo.UserText = Array("", 0)
'''        fcmbOldLpgByPttRegNo.Show
'''        If FormAddEditMode = cFORM_ADDMODE And fcmbOldLpgByPttRegNo.ListSelected = True And Val(fcmbOldLpgByPttRegNo.BoundText) > 0 Then
'''            mOldLpgCode = Val(fcmbOldLpgByPttRegNo.LFieldValue("LpgCode"))
'''            tRecset.open "Select * from LabReg where LpgCode=" & CStr(mOldLpgCode) & "", dbHmsDatabase, adOpenKeyset, adLockOptimistic
'''            If tRecset.RecordCount > 0 Then
'''                mOldLpgPttCode = tRecset.fields("LpgPttCode")
'''            End If
'''            CloseTable tRecset
'''            If mOldLpgCode > 0 And mOldLpgPttCode > 0 Then
'''                mLrcPttCode = mOldLpgPttCode
'''                ShowPatData mLrcPttCode
'''                Call StorePatOldData
'''                ShowPttDiscPer mLrcPttCode
'''
'''                mLrcLpgCode = mOldLpgCode
'''                ShowLabData mLrcLpgCode
'''                Call StoreLabOldData
'''
'''                mLrcOldLrcCode = GetOldLrcCodeFromPttCode(mLrcPttCode)
'''                ShowOldLrcCodeDesc mLrcOldLrcCode
'''            End If
'''        Else
'''            If FormAddEditMode = cFORM_EDITMODE And fcmbOldLpgByPttRegNo.ListSelected = True And Val(fcmbOldLpgByPttRegNo.BoundText) > 0 Then
'''                AlertBox "Prohibited in Edit Mode !!!"
'''            End If
'''        End If
'''    End If
'''    fcmbOldLpgByPttRegNo.CallFromText_Change = False
'''End If
'''CloseTable tRecset, mCheckOpen:=True
'''
'''End Sub

'''Private Sub ShowOldLpgListByPttName()
'''Dim tRecset As New ADODB.Recordset, mOldLpgCode As Long, mOldLpgPttCode As Long
'''
'''If fcmbOldLpgByPttName.CallFromText_Change = False Then
'''    fcmbOldLpgByPttName.CallFromText_Change = True
'''    If InterActiveChange(txtPttName) = True Then
'''        If fcmbOldLpgByPttName.LRecordCount = 0 Then
'''            fcmbOldLpgByPttName.mFiltCond = ""
'''            fcmbOldLpgByPttName.ReInit
'''        End If
'''
'''        fcmbOldLpgByPttName.UserText = Array("", 0)
'''        fcmbOldLpgByPttName.Show
'''        If FormAddEditMode = cFORM_ADDMODE And fcmbOldLpgByPttName.ListSelected = True And Val(fcmbOldLpgByPttName.BoundText) > 0 Then
'''            mOldLpgCode = Val(fcmbOldLpgByPttName.LFieldValue("LpgCode"))
'''            Set tRecset = dbHmsDatabase.Execute("Select * from LabReg where LpgCode = " & CStr(mOldLpgCode) & "")
'''            If tRecset.EOF = False Then
'''                mOldLpgPttCode = tRecset.fields("LpgPttCode")
'''            Else
'''                RefreshDatabase dbHmsDatabase
'''                tRecset.Requery
'''                If tRecset.EOF = False Then
'''                    mOldLpgPttCode = tRecset.fields("LpgPttCode")
'''                End If
'''            End If
'''            CloseTable tRecset
'''            If mOldLpgCode > 0 And mOldLpgPttCode > 0 Then
'''                mLrcPttCode = mOldLpgPttCode
'''                ShowPatData mLrcPttCode
'''                Call StorePatOldData
'''                ShowPttDiscPer mLrcPttCode
'''
'''                mLrcLpgCode = mOldLpgCode
'''                ShowLabData mLrcLpgCode
'''                Call StoreLabOldData
'''
'''                mLrcOldLrcCode = GetOldLrcCodeFromPttCode(mLrcPttCode)
'''                ShowOldLrcCodeDesc mLrcOldLrcCode
'''            End If
'''        Else
'''            If FormAddEditMode = cFORM_EDITMODE And fcmbOldLpgByPttName.ListSelected = True And Val(fcmbOldLpgByPttName.BoundText) > 0 Then
'''                AlertBox "Prohibited in Edit Mode !!!"
'''            End If
'''        End If
'''    End If
'''    fcmbOldLpgByPttName.CallFromText_Change = False
'''End If
'''CloseTable tRecset, mCheckOpen:=True
'''
'''End Sub

Private Sub VisibleControls(ByVal mShowItem As Boolean, Optional ByVal mRowPos)
Rem Important - dtlAddEditMode & dtlAddMode must be initialised prior to this
If Me.Visible = True Then
    txtVoid.SetFocus
End If
If IsMissing(mRowPos) = False Then
    Rem mskLrcICode.Top = mRowPos
    mskLrcSno.Top = mRowPos
    txtSrvName.Top = mRowPos
    txtSdcFlag.Top = mRowPos
    mskLrcUnit.Top = mRowPos
    mskLrcRate.Top = mRowPos
    mskLrcAmtBefDisc.Top = mRowPos
    mskLrcDiscPer.Top = mRowPos
    mskLrcDiscAmt.Top = mRowPos
    mskLrcAmtAftDisc.Top = mRowPos
    cmdOK.Top = mRowPos
End If

mskLrcICode.Text = 0
mskLrcSno.Text = 0
txtSrvName.Text = "": fcmbSrvName.BoundText = ""
txtSdcFlag.Text = ""
mskLrcUnit.Text = ToMyNumFmt(0, mDecimals:=0)
mskLrcRate.Text = ToMyNumFmt(0)
mskLrcAmtBefDisc.Text = ToMyNumFmt(0)
mskLrcDiscPer.Text = ToMyPerFmt(0)
mskLrcDiscAmt.Text = ToMyNumFmt(0)
mskLrcAmtAftDisc.Text = ToMyNumFmt(0)

Call ValidDtl

mskLrcICode.Visible = False     '''  mShowItem
mskLrcSno.Visible = mShowItem
txtSrvName.Visible = mShowItem
txtSdcFlag.Visible = mShowItem
mskLrcUnit.Visible = mShowItem
mskLrcRate.Visible = mShowItem
mskLrcAmtBefDisc.Visible = mShowItem
mskLrcDiscPer.Visible = mShowItem
mskLrcDiscAmt.Visible = mShowItem
mskLrcAmtAftDisc.Visible = mShowItem
cmdOK.Visible = mShowItem

frHeader.Enabled = (mShowItem = False)
Mfgrd2.Enabled = (mShowItem = False)
frFooter.Enabled = (mShowItem = False)
cmdSaveForm.Enabled = (mShowItem = False)

End Sub

Private Sub ValidDtl()
Dim mDataOk As Boolean, srow As Integer
srow = Mfgrd2.Row
mDataOk = ((mLrcPttCode > 0 Or FormAddEditMode = cFORM_ADDMODE) And frSdcDtl.Visible = False And Val(UnMyNumFmt(mskLrcSno.Text)) > 0 And Val(fcmbSrvName.BoundText) > 0 And Val(UnMyNumFmt(mskLrcUnit.Text)) > 0 And Val(UnMyNumFmt(mskLrcRate.Text)) > 0 And Val(UnMyNumFmt(mskLrcAmtBefDisc.Text)) > 0 And Val(UnMyNumFmt(mskLrcAmtAftDisc.Text)) >= 0)         ''' And mLrcLpgCode > 0
If dtlAddEditMode = True And dtlAddMode = False And mDataOk = True And InterActiveChange(cmdOK) = True Then
    clsSRV.GetData Val(fcmbSrvName.BoundText)
    If clsSRV.mSrvMultiDctIncl_bln = False Then
        If GetServDctDtlCount(cnn:=dbHmsDatabase, mTableName:="LabRcDctDtl", mSdcCodeField:="LrdCode", mSdcCode:=mLrcCode, mSdcSubCodeField:="LrdLrcCode", mSdcSubCode:=Val(mskLrcICode.Text)) > 0 Then
            ErrorBox "Service Doctor Detail Exist !!!"
            mDataOk = False
        End If
    End If
End If

cmdOK.Caption = IIf(mDataOk = True, "&OK", "&Cancel")
cmdOK.BackColor = IIf(mDataOk = True, &H80FF80, &H8080FF)
End Sub

Private Sub CalcFtrTotal(Optional ByVal mCalcBalOnly As Boolean = False)
Dim mLrcUnitTot As Double, mLrcAmtBefDiscTot As Double, mLrcDiscAmtTot As Double, mLrcAmtAftDiscTot As Double, mLrcAdvAmtTot As Double, mLrcRecdAmtTot As Double, mLrcDepoAmtTot As Double, mLrcRefuAmtTot As Double, mLrcBalAmtTot As Double

If mCalcBalOnly = False Then
    mLrcUnitTot = FlexColSum(Mfgrd2, X2LRCUNIT_COL)
    mLrcAmtBefDiscTot = FlexColSum(Mfgrd2, X2LRCAMTBEFDISC_COL)
    mLrcDiscAmtTot = FlexColSum(Mfgrd2, X2LRCDISCAMT_COL)
    mLrcAmtAftDiscTot = FlexColSum(Mfgrd2, X2LRCAMTAFTDISC_COL)
Else
    mLrcUnitTot = Val(UnMyNumFmt(lblLrcUnitTot.Caption))
    mLrcAmtBefDiscTot = Val(UnMyNumFmt(lblLrcAmtBefDiscTot.Caption))
    mLrcDiscAmtTot = Val(UnMyNumFmt(lblLrcDiscAmtTot.Caption))
    mLrcAmtAftDiscTot = Val(UnMyNumFmt(lblLrcAmtAftDiscTot.Caption))
End If

mLrcAdvAmtTot = Val(UnMyNumFmt(mskLrcAdvAmtTot.Text))
mLrcRecdAmtTot = Val(UnMyNumFmt(mskLrcRecdAmtTot.Text))
mLrcDepoAmtTot = Val(UnMyNumFmt(mskLrcDepoAmtTot.Text))
mLrcRefuAmtTot = Val(UnMyNumFmt(mskLrcRefuAmtTot.Text))
If mCalcBalOnly = False Then
    If mLrcRecdAmtTot > (mLrcAmtAftDiscTot - mLrcAdvAmtTot - mLrcDepoAmtTot) Then
        mLrcRecdAmtTot = (mLrcAmtAftDiscTot - mLrcAdvAmtTot - mLrcDepoAmtTot)
    ElseIf FormAddEditMode = cFORM_ADDMODE Then
        mLrcRecdAmtTot = (mLrcAmtAftDiscTot - mLrcAdvAmtTot - mLrcDepoAmtTot)
    End If
    mskLrcRecdAmtTot.Text = ToMyNumFmt(mLrcRecdAmtTot)
End If
mLrcBalAmtTot = (mLrcAmtAftDiscTot - (mLrcAdvAmtTot + mLrcRecdAmtTot + mLrcDepoAmtTot))

If mCalcBalOnly = False Then
    lblLrcUnitTot.Caption = ToMyNumFmt(mLrcUnitTot, mDecimals:=0)
    lblLrcAmtBefDiscTot.Caption = ToMyNumFmt(mLrcAmtBefDiscTot)
    lblLrcDiscAmtTot.Caption = ToMyNumFmt(mLrcDiscAmtTot)
    lblLrcAmtAftDiscTot.Caption = ToMyNumFmt(mLrcAmtAftDiscTot)
End If
mskLrcBalAmtTot.Text = ToMyNumFmt(mLrcBalAmtTot)

End Sub

'''Private Sub DisperseRecdAmt(ByVal mLrcCode As Long)
'''Dim tRecset As New ADODB.Recordset, mRecdAmtBal As Double, mReqdRecdAmt As Double
'''
'''mRecdAmtBal = Val(UnMyNumFmt(mskLrcRecdAmtTot.Text))
'''
'''With tRecset
'''.Open "Select * from LabRcpt where LrcCode=" & CStr(mLrcCode) & " order by LrcSno", dbHmsDatabase, adOpenKeyset, adLockOptimistic
'''If .RecordCount > 0 Then
'''    dbHmsDatabase.BeginTrans
'''    Do While .EOF = False
'''        If InList(.Fields("LrcRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
'''            'mReqdRecdAmt = .Fields("LrcAmtAftDisc") - .Fields("LrcAdvAmt") - .Fields("LrcDepoAmt") - .Fields("LrcRefuAmt")
'''            mReqdRecdAmt = .Fields("LrcAmtAftDisc") - (.Fields("LrcAdvAmt") + .Fields("LrcDepoAmt"))
'''            If mRecdAmtBal > 0 Then
'''                If Not mRecdAmtBal >= mReqdRecdAmt Then
'''                    mReqdRecdAmt = mRecdAmtBal
'''                End If
'''                .Fields("LrcRecdAmt") = mReqdRecdAmt
'''                .Fields("LrcBalAmt") = .Fields("LrcAmtAftDisc") - (.Fields("LrcAdvAmt") + .Fields("LrcDepoAmt")) + .Fields("LrcRefuAmt") - mReqdRecdAmt
'''                .Update
'''
'''                mRecdAmtBal = mRecdAmtBal - mReqdRecdAmt
'''            Else
'''                .Fields("LrcRecdAmt") = 0
'''                .Fields("LrcBalAmt") = .Fields("LrcAmtAftDisc") - (.Fields("LrcAdvAmt") + .Fields("LrcDepoAmt")) + .Fields("LrcRefuAmt")
'''                .Update
'''            End If
'''        Else
'''            If InList(.Fields("LrcRecState"), Array(cREC_CANCELED, cREC_DELETED)) = False Then
'''                ErrorBox Me.Name & "_DisperseRecdAmt_#2316_[Invalid Record Status]"
'''            End If
'''        End If
'''        .MoveNext
'''    Loop
'''    dbHmsDatabase.CommitTrans
'''Else
'''    If mRecdAmtBal <> 0 Then
'''        ErrorBox Me.Name & "_DisperseRecdAmt_#3002_[Unexpected]"
'''    End If
'''End If
'''End With
'''CloseTable tRecset
'''
'''End Sub

Private Sub ShowLinkTranDtl()
Dim tRecset As New ADODB.Recordset, mLinkTranStr As String

With tRecset
.open "Select LabPymtDtl.*,LabPymtHdr.LphVtmCode,LabPymtHdr.LphVchNo from LabPymtDtl inner join LabPymtHdr on LabPymtDtl.LpyCode = LabPymtHdr.LphCode where LpyLhrCode = " & CStr(mLrcCode) & " order by LpyDate", dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Do While .EOF = False
        clsVTM.GetData .fields("LphVtmCode")
        mLinkTranStr = mLinkTranStr & clsVTM.mName_str & " No." & CStr(.fields("LphVchNo")) & " Dated " & Dtoc(.fields("LpyDate")) & " Rs." & ToMyNumFmt(.fields("LpyDepoAmt")) & vbCrLf
        
        .MoveNext
    Loop
End If
End With
CloseTable tRecset

With tRecset
.open "Select LabRefdDtl.*,LabRefdHdr.LfhVtmCode,LabRefdHdr.LfhVchNo from LabRefdDtl inner join LabRefdHdr on LabRefdDtl.LfdCode = LabRefdHdr.LfhCode where LfdLhrCode = " & CStr(mLrcCode) & " order by LfdDate", dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Do While .EOF = False
        clsVTM.GetData .fields("LfhVtmCode")
        mLinkTranStr = mLinkTranStr & clsVTM.mName_str & " No." & CStr(.fields("LfhVchNo")) & " Dated " & Dtoc(.fields("LfdDate")) & " Rs." & ToMyNumFmt(.fields("LfdRefuAmt")) & vbCrLf
        
        .MoveNext
    Loop
End If
End With
CloseTable tRecset


lblLinkTranDesc.Caption = mLinkTranStr

End Sub

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
Dim srow As Integer, mLrdICode As Long, mLrdLrcCode As Long, mDeleteit As Boolean
srow = Mfgrd3.Row
mLrdICode = Val(Mfgrd3.TextMatrix(srow, X3LRDICODE_COL))
mLrdLrcCode = Val(Mfgrd2.TextMatrix(Mfgrd2.Row, X2LRCICODE_COL))

If MyDeleteKey(Shift, KeyCode, mCheckCtrlMask:=False) = True And mLrdICode > 0 Then
    mDeleteit = True
    If mDeleteit = True Then
        mDeleteit = CanDelete()
    End If
    If mDeleteit = True Then
        clsLRC.DeleteSdc mLrcCode, mLrdLrcCode, mLrdICode
        
        ShowSdcDtlData mLrcCode, mLrdLrcCode
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
        mskLrdSno.Text = ToMyNumFmt(FlexNextSeqno(Mfgrd3, X3LRDSNO_COL), mDecimals:=0)
    Else
        mskLrdSno.Text = Mfgrd3.TextMatrix(srow, X3LRDSNO_COL)
        fcmbSDctName.BoundText = Mfgrd3.TextMatrix(srow, X3LRDDCTCODE_COL): txtSDctName.Text = fcmbSDctName.Text
        fcmbDrlName.BoundText = Mfgrd3.TextMatrix(srow, X3LRDDRLCODE_COL): txtDrlName.Text = fcmbDrlName.Text
        txtLrdRemark.Text = Mfgrd3.TextMatrix(srow, X3LRDREMARK_COL)
    End If
    mSdcDctCode_old = Val(fcmbSDctName.BoundText)
    
    txtSDctName.SetFocus
    Call ValidSdcDtl
    
    
    
End If

End Sub

Private Sub Mfgrd3_RowColChange()
Rem nothing
End Sub

Private Sub VisibleSdcControls(ByVal mShowItem As Boolean, Optional ByVal mRowPos)
Rem Important - dtlSdcAddEditMode & dtlSdcAddMode must be initialised prior to this
If Me.Visible = True Then
    txtVoid.SetFocus
End If
If IsMissing(mRowPos) = False Then
    mskLrdSno.Top = mRowPos
    txtSDctName.Top = mRowPos
    txtDrlName.Top = mRowPos
    txtLrdRemark.Top = mRowPos
    cmdSdcOK.Top = mRowPos
End If

mskLrdSno.Text = 0
txtSDctName.Text = "": fcmbSDctName.BoundText = ""
txtDrlName.Text = "": fcmbDrlName.BoundText = ""
txtLrdRemark.Text = ""

Call ValidSdcDtl

mskLrdSno.Visible = mShowItem
txtSDctName.Visible = mShowItem
txtDrlName.Visible = mShowItem
txtLrdRemark.Visible = mShowItem
cmdSdcOK.Visible = mShowItem

Mfgrd3.Enabled = (mShowItem = False)

End Sub

Private Sub ValidSdcDtl()
Dim mDataOk As Boolean, srow As Integer
srow = Mfgrd3.Row
mDataOk = (Val(fcmbSrvName.BoundText) > 0 And (mLrcPttCode > 0 Or FormAddEditMode = cFORM_ADDMODE) And Val(UnMyNumFmt(mskLrdSno.Text)) > 0 And Val(fcmbSDctName.BoundText) > 0 And Val(fcmbDrlName.BoundText) > 0)      ''' And mLrcLpgCode > 0
cmdSdcOK.Caption = IIf(mDataOk = True, "&OK", "&Cancel")
cmdSdcOK.BackColor = IIf(mDataOk = True, &H80FF80, &H8080FF)
End Sub

Private Sub ShowSdcDtlData(ByVal mLrdCode As Long, ByVal mLrdLrcCode As Long)
Dim srow As Integer, tRecset As New ADODB.Recordset, mColCnt As Integer

srow = 1
Mfgrd3.Rows = 2

With tRecset
.open "Select * from LabRcDctDtl where LrdCode = " & CStr(mLrdCode) & " and LrdLrcCode = " & CStr(mLrdLrcCode) & " order by LrdSno", dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Do While .EOF = False
        If InList(.fields("LrdRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
            clsDCT.GetData .fields("LrdDctCode")
            clsDRL.GetData .fields("LrdDrlCode")
            
            Mfgrd3.TextMatrix(srow, X3LRDICODE_COL) = .fields("LrdICode")
            Mfgrd3.TextMatrix(srow, X3LRDSNO_COL) = ToMyNumFmt(.fields("LrdSno"), mDecimals:=0)
            Mfgrd3.TextMatrix(srow, X3DCTNAME_COL) = clsDCT.mName_str
            Mfgrd3.TextMatrix(srow, X3DRLNAME_COL) = clsDRL.mName_str
            Mfgrd3.TextMatrix(srow, X3LRDREMARK_COL) = .fields("LrdRemark")
            Mfgrd3.TextMatrix(srow, X3LRDDCTCODE_COL) = .fields("LrdDctCode")
            Mfgrd3.TextMatrix(srow, X3LRDDRLCODE_COL) = .fields("LrdDrlCode")
            Mfgrd3.TextMatrix(srow, X3LRDRECSTATE_COL) = .fields("LrdRecState")
            
            Mfgrd3.Rows = Mfgrd3.Rows + 1
            srow = srow + 1
        Else
            If InList(.fields("LrdRecState"), Array(cREC_CANCELED, cREC_DELETED)) = False Then
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
    frSdcDtl.Visible = True
    VisibleSdcControls False
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
Dim mLrcVchNo As Long

txtVoid.SetFocus
cmdPrintCRL.Enabled = False
If Val(fcmbLrcVtmName.BoundText) < 1 Then
    ErrorBox "Invalid Voucher Type !!!"
    txtLrcVtmName(1).SetFocus
    GoTo EndSub
End If
If Val(UnMyNumFmt(mskLrcVchNo(1).Text)) < 1 Then
    ErrorBox "Invalid Voucher No. !!!"
    mskLrcVchNo(1).SetFocus
    GoTo EndSub
Else
    mLrcVchNo = Val(UnMyNumFmt(mskLrcVchNo(1).Text))
    If ChkIsExistVTypeNo(dbHmsDatabase, mTableName:="LabHdr", mChkFieldName:="LhrVchNo", mChkFieldValue:=CStr(mLrcVchNo), mVtmFieldName:="LhrVtmCode", mVtmFieldValue:=Val(fcmbLrcVtmName.BoundText), mFinYrFieldName:="LhrCmpCode", mFinYrFieldValue:=sFinYrCmpCode) = False Then
        ErrorBox "Voucher No. does not Exist !!!"
        mskLrcVchNo(1).SetFocus
        GoTo EndSub
    End If
End If
If Val(UnMyNumFmt(mskLrcVchNo(2).Text)) < 1 Then
    ErrorBox "Invalid Voucher No. !!!"
    mskLrcVchNo(2).SetFocus
    GoTo EndSub
Else
    mLrcVchNo = Val(UnMyNumFmt(mskLrcVchNo(2).Text))
    If ChkIsExistVTypeNo(dbHmsDatabase, mTableName:="LabHdr", mChkFieldName:="LhrVchNo", mChkFieldValue:=CStr(mLrcVchNo), mVtmFieldName:="LhrVtmCode", mVtmFieldValue:=Val(fcmbLrcVtmName.BoundText), mFinYrFieldName:="LhrCmpCode", mFinYrFieldValue:=sFinYrCmpCode) = False Then
        ErrorBox "Voucher No. does not Exist !!!"
        mskLrcVchNo(2).SetFocus
        GoTo EndSub
    End If
End If
If cmbCRList.ListIndex < 0 Then
    ErrorBox "Invalid Print Format Name !!!"
    cmbCRList.SetFocus
    GoTo EndSub
End If
If cmbPrinterList.ListIndex < 0 Then
    ErrorBox "Invalid Print Selection !!!"
    cmbPrinterList.SetFocus
    GoTo EndSub
End If
If Val(mskPrintCopies.Text) < 1 Then
    ErrorBox "Invalid Input !!!"
    mskPrintCopies.SetFocus
    GoTo EndSub
End If
If cmbPrintDest.ListIndex < 0 Then
    ErrorBox "Invalid Print Destination !!!"
    cmbPrintDest.SetFocus
    GoTo EndSub
End If
Call Data_PrintEvent

EndSub:
cmdPrintCRL.Enabled = True
Exit Sub

End Sub

Private Sub Data_PrintEvent()
Dim mFromLrcVchNo As Long, mToLrcVchNo As Long, mLrcVtmCode As Long
Dim fCRView As Form

mFromLrcVchNo = Val(UnMyNumFmt(mskLrcVchNo(1).Text))
mToLrcVchNo = Val(UnMyNumFmt(mskLrcVchNo(2).Text))
mLrcVtmCode = Val(fcmbLrcVtmName.BoundText)

frmMain.Cryst.Reset
frmMain.Cryst.ReportFileName = Trim(Right(cmbCRList.List(cmbCRList.ListIndex), 100))
frmMain.Cryst.DiscardSavedData = True
frmMain.Cryst.DataFiles(0) = dbComDatabaseFullPath

frmMain.Cryst.SelectionFormula = "{vewLabRcpt.LhrVchNo}>=" & CStr(mFromLrcVchNo) & " and {vewLabRcpt.LhrVchNo}<=" & CStr(mToLrcVchNo) & " and {vewLabRcpt.LhrVtmCode}=" & CStr(mLrcVtmCode) & " and {vewLabRcpt.LhrCmpCode}=" & CStr(sFinYrCmpCode)
frmMain.Cryst.CopiesToPrinter = Val(mskPrintCopies.Text)
frmMain.Cryst.PrinterName = Trim(Left(cmbPrinterList.List(cmbPrinterList.ListIndex), 100))
frmMain.Cryst.PrinterDriver = Trim(Right(cmbPrinterList.List(cmbPrinterList.ListIndex), 100))
frmMain.Cryst.ReportTitle = MyCompany.mUserName
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
        fcmbLrcVtmName.BoundText = CStr(datRecset.fields("LhrVtmCode"))
        txtLrcVtmName(1).Text = fcmbLrcVtmName.Text
        mskLrcVchNo(1).Text = datRecset.fields("LhrVchNo")
        mskLrcVchNo(2).Text = datRecset.fields("LhrVchNo")
        ' ----------------
        Call AssignPrintPara
        frPrintCRList.ZOrder
        frPrintCRList.Visible = True
        Mfgrd1.Enabled = False
        cmbPrintDest.SetFocus
    End If
    
ElseIf mCallSource = "SaveEvent" Then
    txtLrcVtmName(1).Text = fcmbLrcVtmName.Text
    mskLrcVchNo(1).Text = CStr(Val(UnMyNumFmt(mskLrcVchNo(0).Text)))
    mskLrcVchNo(2).Text = CStr(Val(UnMyNumFmt(mskLrcVchNo(0).Text)))
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

If Dir(LabRcptCRLFileFullPath) = "" Then
    fhand = FreeFile
    Open LabRcptCRLFileFullPath For Output As #fhand
    Write #fhand, "Lab Receipt", "LabRcpt.Rpt", True
    Close #fhand
End If

cmbCRList.Clear
fhand = FreeFile
Open LabRcptCRLFileFullPath For Input As #fhand
Do While EOF(fhand) = False
    Input #fhand, mCRLTitle, mCRLFileName, mCRLDefault
    If Dir(LabRcptCRLFileFullPath(mFileName:=mCRLFileName)) <> "" Then
        cmbCRList.AddItem mCRLTitle & Space(100) & LabRcptCRLFileFullPath(mFileName:=mCRLFileName)
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

