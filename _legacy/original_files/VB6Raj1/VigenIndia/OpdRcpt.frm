VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "Mscomctl.ocx"
Begin VB.Form frmOutdoorReceipt 
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
      Height          =   315
      ItemData        =   "OpdRcpt.frx":0000
      Left            =   0
      List            =   "OpdRcpt.frx":000D
      Style           =   1  'Simple Combo
      TabIndex        =   64
      TabStop         =   0   'False
      Text            =   "cmbFormEntryMode"
      Top             =   360
      Width           =   1455
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
      TabIndex        =   150
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
            TextSave        =   "11:38"
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
      Begin VB.TextBox mskOrcICode 
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
         TabIndex        =   37
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
         TabIndex        =   139
         Top             =   7320
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
            TabIndex        =   46
            Top             =   1080
            Width           =   735
         End
         Begin VB.TextBox txtOrdRemark 
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
         Begin VB.TextBox mskOrdSno 
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
            TabIndex        =   140
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
         TabIndex        =   124
         Top             =   7320
         Width           =   12855
         Begin VB.TextBox mskOrcRefuAmtTot 
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
         Begin VB.TextBox mskOrcAdvAmtTot 
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
         Begin VB.TextBox mskOrcBalAmtTot 
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
         Begin VB.TextBox mskOrcDepoAmtTot 
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
         Begin VB.TextBox mskOrcRecdAmtTot 
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
            TabIndex        =   138
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
            TabIndex        =   137
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
            TabIndex        =   136
            Top             =   1920
            Width           =   1695
         End
         Begin VB.Label lblOldOrcCodeDesc 
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
            TabIndex        =   135
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
            TabIndex        =   133
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
            TabIndex        =   132
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
            TabIndex        =   131
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
            TabIndex        =   129
            Top             =   840
            Width           =   1935
         End
         Begin VB.Label lblOrcAmtAftDiscTot 
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
            TabIndex        =   128
            Top             =   120
            Width           =   1455
         End
         Begin VB.Label lblOrcDiscAmtTot 
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
            TabIndex        =   127
            Top             =   120
            Width           =   1215
         End
         Begin VB.Label lblOrcAmtBefDiscTot 
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
            TabIndex        =   126
            Top             =   120
            Width           =   1455
         End
         Begin VB.Label lblOrcUnitTot 
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
            TabIndex        =   125
            Top             =   120
            Width           =   855
         End
      End
      Begin VB.TextBox mskOrcSno 
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
         TabIndex        =   38
         Tag             =   "AhCode"
         Text            =   "1)"
         Top             =   6000
         Width           =   495
      End
      Begin VB.Frame frHeader 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   4935
         Left            =   120
         TabIndex        =   96
         Top             =   240
         Width           =   12855
         Begin VB.TextBox txtOpgRemark 
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
            Top             =   3720
            Width           =   4455
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
         Begin VB.TextBox mskOrcOpgCode 
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
         Begin VB.TextBox mskOrcPttDiscPer 
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
            Top             =   4560
            Width           =   1215
         End
         Begin VB.TextBox txtOrcTime_str 
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
            Left            =   10920
            MaxLength       =   50
            TabIndex        =   33
            TabStop         =   0   'False
            Text            =   "00:00"
            Top             =   4200
            Width           =   855
         End
         Begin VB.TextBox dtpOrcDate 
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
            Top             =   4200
            Width           =   1455
         End
         Begin VB.TextBox mskOrcVchNo 
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
            Tag             =   "AhCode"
            Text            =   "0"
            Top             =   4200
            Width           =   1455
         End
         Begin VB.TextBox txtOrcVtmName 
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
         Begin VB.TextBox txtOrcPrefix 
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
            Tag             =   "AhCode"
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
         Begin VB.TextBox txtOpgVtmName 
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
         Begin VB.TextBox mskOpgVchNo 
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
            Top             =   3000
            Width           =   1335
         End
         Begin VB.TextBox txtOpgPrefix 
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
         Begin VB.TextBox dtpOpgDate 
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
            Top             =   3000
            Width           =   1455
         End
         Begin VB.TextBox txtOpgTime_str 
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
            Left            =   10920
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
            Left            =   7320
            MaxLength       =   50
            TabIndex        =   26
            TabStop         =   0   'False
            Top             =   3360
            Width           =   4455
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
         Begin VB.TextBox mskOrcPttCode 
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
         Begin VB.TextBox txtOhrRemark 
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
            Width           =   5415
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
            TabIndex        =   134
            Top             =   3720
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
            TabIndex        =   130
            Top             =   4560
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
            TabIndex        =   123
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
            Left            =   10320
            TabIndex        =   122
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
            TabIndex        =   121
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
            TabIndex        =   120
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
            TabIndex        =   119
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
            TabIndex        =   118
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
            TabIndex        =   117
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
            TabIndex        =   116
            Top             =   1440
            Width           =   1935
         End
         Begin VB.Line Line3 
            Index           =   1
            X1              =   0
            X2              =   12840
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
            TabIndex        =   115
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
            TabIndex        =   114
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
            TabIndex        =   113
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
            TabIndex        =   112
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
            TabIndex        =   111
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
            TabIndex        =   110
            Top             =   1440
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
            TabIndex        =   109
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
            TabIndex        =   108
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
            Left            =   10440
            TabIndex        =   107
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
            TabIndex        =   106
            Top             =   1080
            Width           =   735
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "OPD Type:"
            BeginProperty Font 
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
            TabIndex        =   105
            Top             =   3000
            Width           =   1935
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Opd No.:"
            BeginProperty Font 
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
            TabIndex        =   104
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
            TabIndex        =   103
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
            Left            =   10320
            TabIndex        =   102
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
            TabIndex        =   101
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
            TabIndex        =   100
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
            TabIndex        =   99
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
            TabIndex        =   98
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
            TabIndex        =   97
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
      Begin VB.TextBox mskOrcAmtAftDisc 
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
      Begin VB.TextBox mskOrcDiscAmt 
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
      Begin VB.TextBox mskOrcDiscPer 
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
      Begin VB.TextBox mskOrcAmtBefDisc 
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
      Begin VB.TextBox mskOrcRate 
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
      Begin VB.TextBox mskOrcUnit 
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
      Begin MSFlexGridLib.MSFlexGrid Mfgrd2 
         Height          =   2175
         Left            =   120
         TabIndex        =   36
         Top             =   5160
         Width           =   12855
         _ExtentX        =   22675
         _ExtentY        =   3836
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
         TabIndex        =   141
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
            TabIndex        =   88
            Top             =   3000
            Width           =   855
         End
         Begin VB.TextBox mskOrcVchNo 
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
         Begin VB.TextBox txtOrcVtmName 
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
         Begin VB.TextBox mskOrcVchNo 
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
            TabIndex        =   149
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
            TabIndex        =   148
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
            TabIndex        =   147
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
            TabIndex        =   146
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
            TabIndex        =   145
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
            TabIndex        =   144
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
            TabIndex        =   143
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
            TabIndex        =   142
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
      Caption         =   "Outdoor Receipt"
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
Attribute VB_Name = "frmOutdoorReceipt"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Dim mFormLoaded As Boolean, mLastKeyPressed As Integer, mMaskKeyPressed As Integer
Dim mFormUIdCode As Long, mFormOrcUIdFileName As String, mFormOrcAcsPermFileName As String
Dim mOrcCode As Long, mOrcOpgCode As Long, mOrcPttCode As Long, mQryPttCode As Long, mOrcOldOrcCode As Long, dtlAddEditMode As Boolean, dtlAddMode As Boolean, dtlEditCanceled As Boolean
Dim dtlSdcAddEditMode As Boolean, dtlSdcAddMode As Boolean, dtlSdcEditCanceled As Boolean
Dim mRemoteAccess As Boolean, mEntrySaved As Boolean, mEntryAborted As Boolean
Dim dbAcDatabase As New ADODB.Connection, dbVgnDatabase As New ADODB.Connection, dbGrpDatabase As New ADODB.Connection, dbComDatabase As New ADODB.Connection
Dim datRecset As New ADODB.Recordset
Dim mPttRegNo_old As Long, mOrcRecdAmtTot_old As Double
Dim mOrcCode_old As Long, mOrcDate_old As Date, mOrcVtmCode_old As Long, mOrcVchNo_old As Long, mOpgCDctCode_old As Long, mPttPcgCode_old As Long, mOpgRByCode_old As Long, mOpgRToCode_old As Long, mOrcTime_old As Long
Dim mOrcSrvCode_old As Long
Dim mSdcDctCode_old As Long
Dim clsJRN As clsJournal, clsAH As clsAccountHead, clsOPG As clsVgnSnglTranEntry, clsORC As clsVgnOpdMultiTranEntry, clsARA As clsComMastEntry, clsSTN As clsComMastEntry, clsVTM As clsComMastEntry, clsVGNOPT As clsVgnOpdOptionsEntry
Dim clsPAT As clsVgnMasterEntry, clsPCG As clsVgnMasterEntry, clsDCT As clsVgnMasterEntry, clsDIG As clsVgnMasterEntry, clsSRV As clsVgnMasterEntry, clsDRL As clsVgnMasterEntry
Dim mActiveControl As Object, clsListStru As clsSelectQueryStructure
Dim fcmbOrcVtmName As clsComFlexSearch
Dim fcmbOldOpgByOpgNo As clsVgnFlexSearch, fcmbOldOpgByPttRegNo As clsVgnFlexSearch, fcmbOldOpgByPttName As clsVgnFlexSearch, fcmbPttName As clsVgnFlexSearch, fcmbPttRegNo As clsVgnFlexSearch, fcmbSrvName As clsVgnFlexSearch, fcmbSDctName As clsVgnFlexSearch, fcmbDrlName As clsVgnFlexSearch

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
Const X2ORCICODE_COL = 0
Const X2ORCSNO_COL = 1
Const X2SRVNAME_COL = 2
Const X2SDCFLAG_COL = 3
Const X2ORCUNIT_COL = 4
Const X2ORCRATE_COL = 5
Const X2ORCAMTBEFDISC_COL = 6
Const X2ORCDISCPER_COL = 7
Const X2ORCDISCAMT_COL = 8
Const X2ORCAMTAFTDISC_COL = 9
Const X2ORCADVAMT_COL = 10
Const X2ORCRECDAMT_COL = 11
Const X2ORCDEPOAMT_COL = 12
Const X2ORCREFUAMT_COL = 13
Const X2ORCBALAMT_COL = 14
Const X2ORCSRVCODE_COL = 15
Const X2ORCRECSTATE_COL = 16
Const MFGRD2_COLS = 17

Rem service doctor column definitions
Const X3ORDICODE_COL = 0
Const X3ORDSNO_COL = 1
Const X3DCTNAME_COL = 2
Const X3DRLNAME_COL = 3
Const X3ORDREMARK_COL = 4
Const X3ORDDCTCODE_COL = 5
Const X3ORDDRLCODE_COL = 6
Const X3ORDRECSTATE_COL = 7
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
mOrcCode = mAccessCode
End Property

Public Property Get EntryBoundCode() As Long
EntryBoundCode = Val(mskFormBoundField.Text)
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
                    dtpFromDate.Text = Dtoc(MonthStartDate(DateSerial(Val(Left(.fields("OrcYrMonth"), 4)), Val(Right(.fields("OrcYrMonth"), 2)), 1)))
                    dtpToDate.Text = Dtoc(MonthEndDate(DateSerial(Val(Left(.fields("OrcYrMonth"), 4)), Val(Right(.fields("OrcYrMonth"), 2)), 1)))
                    optMonthwise.Value = False
                    optDatewise.Value = True
                ElseIf optDatewise.Value = True Then
                    dtpFromDate.Text = Dtoc(.fields("OhrDate"))
                    dtpToDate.Text = Dtoc(.fields("OhrDate"))
                    optDatewise.Value = False
                    optDetailed.Value = True
                ElseIf optPatientwise.Value = True Then
                    mQryPttCode = .fields("OhrPttCode")
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
    mskOrcUnit.SetFocus
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
Dim tRecset As New ADODB.Recordset, srow As Integer, mOrcSno As Integer, mOrcICode As Long, mReqdRecdAmt As Double

srow = Mfgrd2.Row
mOrcSno = Val(Mfgrd2.TextMatrix(srow, X2ORCSNO_COL))
mOrcICode = Val(Mfgrd2.TextMatrix(srow, X2ORCICODE_COL))

Call ValidDtl    ' to check any service doctor detail for multidoctor detail service for false

If cmdOK.Caption = "&OK" And dtlEditCanceled = False Then
    With clsORC
    If dtlAddMode = True Then
        .ClearDtl
    Else
        .GetDtlData mOrcCode, mOrcICode
    End If
    .mTrnCode_lng = mOrcCode
    .mTrnDtlSno_int = Val(UnMyNumFmt(mskOrcSno.Text))
    .mTrnDate_dt = Ctod(dtpOrcDate.Text)
    .mTrnCmpCode_int = sFinYrCmpCode
    
    .mOrcPttCode_lng = mOrcPttCode
    .mOrcSrvCode_lng = Val(fcmbSrvName.BoundText)
    .mOrcUnit_dbl = Val(UnMyNumFmt(mskOrcUnit.Text))
    .mOrcRate_dbl = Val(UnMyNumFmt(mskOrcRate.Text))
    .mOrcAmtBefDisc_dbl = Val(UnMyNumFmt(mskOrcAmtBefDisc.Text))
    .mOrcDiscPer_dbl = Val(UnMyPerFmt(mskOrcDiscPer.Text))
    .mOrcDiscAmt_dbl = Val(UnMyNumFmt(mskOrcDiscAmt.Text))
    .mOrcAmtAftDisc_dbl = Val(UnMyNumFmt(mskOrcAmtAftDisc.Text))
    .mOrcRemark_str = ""
    
    If dtlAddMode = True Then
        .mOrcAdvAmt_dbl = 0 ' advance adjustment
        .mOrcRecdAmt_dbl = 0 ' .mOrcAmtAftDisc_dbl - .mOrcAdvAmt_dbl
        .mOrcDepoAmt_dbl = 0
        .mOrcRefuAmt_dbl = 0 ' refund adjustment
        .mOrcBalAmt_dbl = 0 ' automated in stored procedure
        
        If .AddNewDtl(mOrcCode) = True Then
            Rem dbVgnDatabase.BeginTrans
            Rem dbVgnDatabase.Execute "Update OutdRcDctDtl set OrdOrcCode=" & CStr(.mTrnDtlICode_lng) & " where OrdCode=" & CStr(mOrcCode) & " and OrdOrcCode=" & CStr(mOrcICode) & ""
            Rem dbVgnDatabase.CommitTrans
            
            mOrcICode = .mTrnDtlICode_lng
        End If
    Else
        .UpdateDtl mOrcCode, mOrcICode
    End If
    End With
    
    RefreshDatabase dbVgnDatabase
    With tRecset
    .open "Select * from OutdRcpt where OrcCode=" & CStr(mOrcCode) & " and OrcICode=" & CStr(mOrcICode) & "", dbVgnDatabase, adOpenKeyset, adLockOptimistic
    
    clsSRV.GetData .fields("OrcSrvCode")
    
    Mfgrd2.TextMatrix(srow, X2ORCICODE_COL) = .fields("OrcICode")
    Mfgrd2.TextMatrix(srow, X2ORCSNO_COL) = ToMyNumFmt(.fields("OrcSno"), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2SRVNAME_COL) = clsSRV.mName_str
    If GetServDctDtlCount(cnn:=dbVgnDatabase, mTableName:="OutdRcDctDtl", mSdcCodeField:="OrdCode", mSdcCode:=.fields("OrcCode"), mSdcSubCodeField:="OrdOrcCode", mSdcSubCode:=.fields("OrcICode")) > 0 Then
        Mfgrd2.TextMatrix(srow, X2SDCFLAG_COL) = "Y"
    Else
        If clsSRV.mSrvMultiDctIncl_bln = True Then
            Mfgrd2.TextMatrix(srow, X2SDCFLAG_COL) = "N"
        Else
            Mfgrd2.TextMatrix(srow, X2SDCFLAG_COL) = ""
        End If
    End If
    Mfgrd2.TextMatrix(srow, X2ORCUNIT_COL) = ToMyNumFmt(.fields("OrcUnit"), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2ORCRATE_COL) = ToMyNumFmt(.fields("OrcRate"))
    Mfgrd2.TextMatrix(srow, X2ORCAMTBEFDISC_COL) = ToMyNumFmt(.fields("OrcAmtBefDisc"))
    Mfgrd2.TextMatrix(srow, X2ORCDISCPER_COL) = ToMyPerFmt(.fields("OrcDiscPer"))
    Mfgrd2.TextMatrix(srow, X2ORCDISCAMT_COL) = ToMyNumFmt(.fields("OrcDiscAmt"))
    Mfgrd2.TextMatrix(srow, X2ORCAMTAFTDISC_COL) = ToMyNumFmt(.fields("OrcAmtAftDisc"))
    Mfgrd2.TextMatrix(srow, X2ORCADVAMT_COL) = ToMyNumFmt(.fields("OrcAdvAmt"))
    Mfgrd2.TextMatrix(srow, X2ORCRECDAMT_COL) = ToMyNumFmt(.fields("OrcRecdAmt"))
    Mfgrd2.TextMatrix(srow, X2ORCDEPOAMT_COL) = ToMyNumFmt(.fields("OrcDepoAmt"))
    Mfgrd2.TextMatrix(srow, X2ORCREFUAMT_COL) = ToMyNumFmt(.fields("OrcRefuAmt"))
    Mfgrd2.TextMatrix(srow, X2ORCBALAMT_COL) = ToMyNumFmt(.fields("OrcBalAmt"))
    Mfgrd2.TextMatrix(srow, X2ORCSRVCODE_COL) = .fields("OrcSrvCode")
    Mfgrd2.TextMatrix(srow, X2ORCRECSTATE_COL) = .fields("OrcRecState")
    
    End With
    CloseTable tRecset
    
    If dtlAddMode = True Then
        Mfgrd2.Rows = Mfgrd2.Rows + 1
    End If
    srow = srow + 1
    Mfgrd2.Row = srow
    
    Call CalcFtrTotal
Else
    clsORC.CancelSdcTran mOrcCode, mOrcICode
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
    txtSearch1Text_InterActiveChange Format(Ctod(dtpOrcDate.Text), "yyyymmdd") + Format(mOrcCode, "0000000")
ElseIf optMonthwise.Value = True Then
    txtSearch1Text_InterActiveChange Format(Ctod(dtpOrcDate.Text), "yyyy") & "/" & Format(Ctod(dtpOrcDate.Text), "mm")
ElseIf optDatewise.Value = True Then
    txtSearch1Text_InterActiveChange Format(Ctod(dtpOrcDate.Text), "yyyymmdd")
ElseIf optPatientwise.Value = True Then
    txtSearch1Text_InterActiveChange txtPttName.Text
End If

Call ShowEntryMode(False)
Mfgrd1.SetFocus

End Sub

Private Sub cmdSaveForm_GotFocus()
Dim mOrcAcsPermNo As Integer, mRetryCount As Integer

txtVoid.SetFocus
cmdSaveForm.Enabled = False
If Data_Verify() = True Then
    If CanAccept() = True Then
        If GetAccessPerm(mOrcAcsPermNo, mRetryCount, mFormOrcAcsPermFileName) = True And mRetryCount = 0 Then
            If Data_NetwAuth() = True Then
                Call cmdSaveForm_Click
                Close #mOrcAcsPermNo
                If mRemoteAccess = True Then
                    ''Unload Me
                    Me.Hide
                    Exit Sub
                Else
                    Call Mfgrd1_RowColChange
                    Data_PrintDialog "SaveEvent"
                End If
            Else
                Close #mOrcAcsPermNo
            End If
        Else
            Close #mOrcAcsPermNo
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
Dim tRecset As New ADODB.Recordset, srow As Integer, mOrdSno As Integer, mOrdICode As Long, mOrdOrcCode As Long, mOrdSrvCode As Long

srow = Mfgrd3.Row
mOrdSno = Val(Mfgrd3.TextMatrix(srow, X3ORDSNO_COL))
mOrdICode = Val(Mfgrd3.TextMatrix(srow, X3ORDICODE_COL))
mOrdOrcCode = Val(Mfgrd2.TextMatrix(Mfgrd2.Row, X2ORCICODE_COL))
mOrdSrvCode = Val(fcmbSrvName.BoundText)

If cmdOK.Caption = "&OK" And dtlSdcEditCanceled = False Then
    With clsORC
    If dtlSdcAddMode = True Then
        .ClearSdc
    Else
        .GetSdcData mOrcCode, mOrdOrcCode, mOrdICode
    End If
    .mSdcCode_lng = mOrcCode
    .mSdcSubCode_lng = mOrdOrcCode
    .mSdcSno_int = Val(UnMyNumFmt(mskOrdSno.Text))
    .mSdcDate_dt = Ctod(dtpOrcDate.Text)
    .mSdcSrvCode_lng = mOrdSrvCode
    .mSdcPttCode_lng = mOrcPttCode
    .mSdcDctCode_lng = Val(fcmbSDctName.BoundText)
    .mSdcDrlCode_lng = Val(fcmbDrlName.BoundText)
    .mSdcRemark_str = txtOrdRemark.Text
    .mSdcCmpCode_int = sFinYrCmpCode
    
    If dtlSdcAddMode = True Then
        .AddNewSdc mOrcCode, mOrdOrcCode
        mOrdICode = .mSdcICode_lng
    Else
        .UpdateSdc mOrcCode, mOrdOrcCode, mOrdICode
    End If
    End With
    
    RefreshDatabase dbVgnDatabase
    With tRecset
    .open "Select * from OutdRcDctDtl where OrdCode=" & CStr(mOrcCode) & " and OrdOrcCode=" & CStr(mOrdOrcCode) & " and OrdICode=" & CStr(mOrdICode) & "", dbVgnDatabase, adOpenKeyset, adLockOptimistic
    
    clsDCT.GetData .fields("OrdDctCode")
    clsDRL.GetData .fields("OrdDrlCode")
    
    Mfgrd3.TextMatrix(srow, X3ORDICODE_COL) = .fields("OrdICode")
    Mfgrd3.TextMatrix(srow, X3ORDSNO_COL) = ToMyNumFmt(.fields("OrdSno"), mDecimals:=0)
    Mfgrd3.TextMatrix(srow, X3DCTNAME_COL) = clsDCT.mName_str
    Mfgrd3.TextMatrix(srow, X3DRLNAME_COL) = clsDRL.mName_str
    Mfgrd3.TextMatrix(srow, X3ORDREMARK_COL) = .fields("OrdRemark")
    Mfgrd3.TextMatrix(srow, X3ORDDCTCODE_COL) = .fields("OrdDctCode")
    Mfgrd3.TextMatrix(srow, X3ORDDRLCODE_COL) = .fields("OrdDrlCode")
    Mfgrd3.TextMatrix(srow, X3ORDRECSTATE_COL) = .fields("OrdRecState")
    
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

Private Sub dtpOpgDate_GotFocus()
FlashActiveControl dtpOpgDate, True
End Sub

Private Sub dtpOpgDate_LostFocus()
FlashActiveControl dtpOpgDate, False
End Sub

Private Sub dtpOpgDate_Validate(Cancel As Boolean)
dtpOpgDate.Text = ToMyDate(dtpOpgDate.Text)
If IsDate(dtpOpgDate.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpOpgDate.SetFocus
    Cancel = True
End If

End Sub

Private Sub dtpOrcDate_GotFocus()
FlashActiveControl dtpOrcDate, True
End Sub

Private Sub dtpOrcDate_LostFocus()
FlashActiveControl dtpOrcDate, False
End Sub

Private Sub dtpOrcDate_Validate(Cancel As Boolean)
dtpOrcDate.Text = ToMyDate(dtpOrcDate.Text)
If IsFinYrDate(Ctod(dtpOrcDate.Text)) = False Then
    ErrorBox "Invalid Input !!!"
    dtpOrcDate.SetFocus
    Cancel = True
Else
    Call ChkServRate
    Call CalcOrcChg
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
        If mOrcCode = 0 Then
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

mFormOrcUIdFileName = "OutdRcpt.Uid"
mFormOrcAcsPermFileName = "OutdRcpt.Acp"
mFormUIdCode = GetUIdCode(mProcess:=Me.Name, mUIdFileName:=mFormOrcUIdFileName, mAcsPermFileName:=mFormOrcAcsPermFileName)

mFormLoaded = False
mEntrySaved = False: mEntryAborted = False
SetFormSize Me, frmMain
Call Form_Resize

Call SetVoidControl(txtVoid)
txtSearch1Text.Enabled = False
frConfigure.Visible = False
frPrintCRList.Visible = False
txtSdcFlag.Locked = True
mskOrcDiscPer.Tag = False
mskOrcDiscAmt.Tag = False

ChkCustomForm Me, CfsFileFullPath("OutdRcpt.Cfs")

OpenAcDataSource dbAcDatabase
OpenVgnDataSource dbVgnDatabase
OpenGrpDataSource dbGrpDatabase
OpenComDataSource dbComDatabase

Set clsListStru = New clsSelectQueryStructure

Set clsVGNOPT = New clsVgnOpdOptionsEntry
clsVGNOPT.blnOutdRcptOptMast = True
clsVGNOPT.Init
clsVGNOPT.GetOutdRcptOptData

Set clsAH = New clsAccountHead
Set clsAH.dbAcDatabase = dbAcDatabase
Set clsAH.dbGrpDatabase = dbGrpDatabase

Set clsOPG = New clsVgnSnglTranEntry
Set clsOPG.dbAcDatabase = dbAcDatabase
Set clsOPG.dbVgnDatabase = dbVgnDatabase
clsOPG.blnOutdRegTran = True
clsOPG.Init

Set clsORC = New clsVgnOpdMultiTranEntry
Set clsORC.dbAcDatabase = dbAcDatabase
Set clsORC.dbVgnDatabase = dbVgnDatabase
clsORC.blnOutdRcptTran = True
clsORC.Init

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

Set clsDRL = New clsVgnMasterEntry
Set clsDRL.dbVgnDatabase = dbVgnDatabase
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

Set fcmbOrcVtmName = New clsComFlexSearch
Set fcmbOrcVtmName.dbAcDatabase = dbAcDatabase
fcmbOrcVtmName.blnVTypeMastList = True
fcmbOrcVtmName.mListSqlExpr = "Select * from VTypMast where VtmSysCode=" & CStr(cVGN_VTYPE_OUTDOOR_RCPT) & " order by VtmName"
fcmbOrcVtmName.Init

Set fcmbSrvName = New clsVgnFlexSearch
Set fcmbSrvName.dbVgnDatabase = dbVgnDatabase
fcmbSrvName.blnServMastList = True
fcmbSrvName.Init

Set fcmbSDctName = New clsVgnFlexSearch
Set fcmbSDctName.dbVgnDatabase = dbVgnDatabase
fcmbSDctName.blnDoctMastList = True
fcmbSDctName.Init

Set fcmbDrlName = New clsVgnFlexSearch
Set fcmbDrlName.dbVgnDatabase = dbVgnDatabase
fcmbDrlName.blnDoctRoleMastList = True
fcmbDrlName.Init

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

Set fcmbOldOpgByOpgNo = New clsVgnFlexSearch
Set fcmbOldOpgByOpgNo.dbVgnDatabase = dbVgnDatabase
Set fcmbOldOpgByOpgNo.dbComDatabase = dbComDatabase
fcmbOldOpgByOpgNo.blnOldOpgListByOpgNo = True
fcmbOldOpgByOpgNo.Init

Set fcmbOldOpgByPttRegNo = New clsVgnFlexSearch
Set fcmbOldOpgByPttRegNo.dbVgnDatabase = dbVgnDatabase
Set fcmbOldOpgByPttRegNo.dbComDatabase = dbComDatabase
fcmbOldOpgByPttRegNo.blnOldOpgListByPttRegNo = True
fcmbOldOpgByPttRegNo.Init

Set fcmbOldOpgByPttName = New clsVgnFlexSearch
Set fcmbOldOpgByPttName.dbVgnDatabase = dbVgnDatabase
Set fcmbOldOpgByPttName.dbComDatabase = dbComDatabase
fcmbOldOpgByPttName.blnOldOpgListByPttName = True
fcmbOldOpgByPttName.Init

Call RestoreDefaultSmryPara
If mRemoteAccess = True Then
    optDetailed.Value = True
    AddSmryParaLayer mClear:=True
End If

If mRemoteAccess = True Then
    datRecset.open "Select * from OutdHdr inner join PatMast on OutdHdr.OhrPttCode=PatMast.PttCode where OhrCode=" & CStr(mOrcCode) & " order by OhrDate,OhrTime", dbVgnDatabase, adOpenKeyset, adLockOptimistic
Else
    datRecset.open "Select * from OutdHdr inner join PatMast on OutdHdr.OhrPttCode=PatMast.PttCode order by OhrDate,OhrTime", dbVgnDatabase, adOpenKeyset, adLockOptimistic
End If
Mfgrd1.FixedCols = 0
Call SmryList

Mfgrd2.FixedRows = 1: Mfgrd2.FixedCols = 0: Mfgrd2.Rows = 2: Mfgrd2.Cols = MFGRD2_COLS: SetGridAutoHeight Mfgrd2

colcnt = X2ORCICODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2ORCICODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2ORCSNO_COL: Mfgrd2.ColWidth(colcnt) = mskOrcSno.Width: Mfgrd2.TextMatrix(0, colcnt) = "Sno": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SRVNAME_COL: Mfgrd2.ColWidth(colcnt) = txtSrvName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Service Name": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2SDCFLAG_COL: Mfgrd2.ColWidth(colcnt) = txtSdcFlag.Width: Mfgrd2.TextMatrix(0, colcnt) = "Dtl": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2ORCUNIT_COL: Mfgrd2.ColWidth(colcnt) = mskOrcUnit.Width: Mfgrd2.TextMatrix(0, colcnt) = "Unit": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2ORCRATE_COL: Mfgrd2.ColWidth(colcnt) = mskOrcRate.Width: Mfgrd2.TextMatrix(0, colcnt) = "Rate": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2ORCAMTBEFDISC_COL: Mfgrd2.ColWidth(colcnt) = mskOrcAmtBefDisc.Width: Mfgrd2.TextMatrix(0, colcnt) = "Basic Amt": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2ORCDISCPER_COL: Mfgrd2.ColWidth(colcnt) = mskOrcDiscPer.Width: Mfgrd2.TextMatrix(0, colcnt) = "Disc.%": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2ORCDISCAMT_COL: Mfgrd2.ColWidth(colcnt) = mskOrcDiscAmt.Width: Mfgrd2.TextMatrix(0, colcnt) = "Disc.Amt": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2ORCAMTAFTDISC_COL: Mfgrd2.ColWidth(colcnt) = mskOrcAmtAftDisc.Width: Mfgrd2.TextMatrix(0, colcnt) = "Amount": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2ORCADVAMT_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2ORCADVAMT_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2ORCRECDAMT_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2ORCRECDAMT_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2ORCDEPOAMT_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2ORCDEPOAMT_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2ORCREFUAMT_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2ORCREFUAMT_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2ORCBALAMT_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2ORCBALAMT_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2ORCSRVCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2ORCSRVCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2ORCRECSTATE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2ORCRECSTATE_COL": Mfgrd2.ColAlignment(colcnt) = 7

colcnt = X2ORCSNO_COL: mskOrcSno.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2SRVNAME_COL: txtSrvName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2SDCFLAG_COL: txtSdcFlag.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2ORCUNIT_COL: mskOrcUnit.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2ORCRATE_COL: mskOrcRate.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2ORCAMTBEFDISC_COL: mskOrcAmtBefDisc.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2ORCDISCPER_COL: mskOrcDiscPer.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2ORCDISCAMT_COL: mskOrcDiscAmt.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2ORCAMTAFTDISC_COL: mskOrcAmtAftDisc.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
cmdOK.Left = mskOrcAmtAftDisc.Left + mskOrcAmtAftDisc.Width

lblOrcUnitTot.Left = mskOrcUnit.Left - frFooter.Left: lblOrcUnitTot.Width = mskOrcUnit.Width
lblOrcAmtBefDiscTot.Left = mskOrcAmtBefDisc.Left - frFooter.Left: lblOrcAmtBefDiscTot.Width = mskOrcAmtBefDisc.Width
lblOrcDiscAmtTot.Left = mskOrcDiscAmt.Left - frFooter.Left: lblOrcDiscAmtTot.Width = mskOrcDiscAmt.Width
lblOrcAmtAftDiscTot.Left = mskOrcAmtAftDisc.Left - frFooter.Left: lblOrcAmtAftDiscTot.Width = mskOrcAmtAftDisc.Width

Rem service doctor detail flexgrid
Mfgrd3.FixedRows = 1: Mfgrd3.FixedCols = 0: Mfgrd3.Rows = 2: Mfgrd3.Cols = MFGRD3_COLS
colcnt = X3ORDICODE_COL: Mfgrd3.ColWidth(colcnt) = 0: Mfgrd3.TextMatrix(0, colcnt) = "X3ORDICODE_COL": Mfgrd3.ColAlignment(colcnt) = 7
colcnt = X3ORDSNO_COL: Mfgrd3.ColWidth(colcnt) = mskOrdSno.Width: Mfgrd3.TextMatrix(0, colcnt) = "Sno": Mfgrd3.ColAlignment(colcnt) = 7
colcnt = X3DCTNAME_COL: Mfgrd3.ColWidth(colcnt) = txtSDctName.Width: Mfgrd3.TextMatrix(0, colcnt) = "Doctor Name": Mfgrd3.ColAlignment(colcnt) = 1
colcnt = X3DRLNAME_COL: Mfgrd3.ColWidth(colcnt) = txtDrlName.Width: Mfgrd3.TextMatrix(0, colcnt) = "Doctor Role": Mfgrd3.ColAlignment(colcnt) = 1
colcnt = X3ORDREMARK_COL: Mfgrd3.ColWidth(colcnt) = txtOrdRemark.Width: Mfgrd3.TextMatrix(0, colcnt) = "Remark": Mfgrd3.ColAlignment(colcnt) = 1
colcnt = X3ORDDCTCODE_COL: Mfgrd3.ColWidth(colcnt) = 0: Mfgrd3.TextMatrix(0, colcnt) = "X3ORDDCTCODE_COL": Mfgrd3.ColAlignment(colcnt) = 7
colcnt = X3ORDDRLCODE_COL: Mfgrd3.ColWidth(colcnt) = 0: Mfgrd3.TextMatrix(0, colcnt) = "X3ORDDRLCODE_COL": Mfgrd3.ColAlignment(colcnt) = 7
colcnt = X3ORDRECSTATE_COL: Mfgrd3.ColWidth(colcnt) = 0: Mfgrd3.TextMatrix(0, colcnt) = "X3ORDRECSTATE_COL": Mfgrd3.ColAlignment(colcnt) = 7

colcnt = X3ORDSNO_COL: mskOrdSno.Left = Mfgrd3.Left + Mfgrd3.ColPos(colcnt)
colcnt = X3DCTNAME_COL: txtSDctName.Left = Mfgrd3.Left + Mfgrd3.ColPos(colcnt)
colcnt = X3DRLNAME_COL: txtDrlName.Left = Mfgrd3.Left + Mfgrd3.ColPos(colcnt)
colcnt = X3ORDREMARK_COL: txtOrdRemark.Left = Mfgrd3.Left + Mfgrd3.ColPos(colcnt)
cmdSdcOK.Left = txtOrdRemark.Left + txtOrdRemark.Width

ShowEntryMode False
VisibleControls False
ShowSdcEntryMode False
ShowStatusBarText StatusBar1

End Sub

Private Sub mskOrcDiscAmt_Change()
If InterActiveChange(mskOrcDiscAmt) = True Then
    mskOrcDiscAmt.Tag = True
    mskOrcDiscPer.Tag = False
End If

End Sub

Private Sub mskOrcDiscPer_Change()
If InterActiveChange(mskOrcDiscPer) = True Then
    mskOrcDiscPer.Tag = True
    mskOrcDiscAmt.Tag = False
End If

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
Set clsOPG = Nothing
Set clsORC = Nothing
Set clsPAT = Nothing
Set clsPCG = Nothing
Set clsDCT = Nothing
Set clsDIG = Nothing
Set clsSRV = Nothing
Set clsDRL = Nothing
Set clsARA = Nothing
Set clsSTN = Nothing
Set clsVTM = Nothing
Set fcmbOldOpgByOpgNo = Nothing
Set fcmbOldOpgByPttRegNo = Nothing
Set fcmbOldOpgByPttName = Nothing
Set fcmbPttRegNo = Nothing
Set fcmbPttName = Nothing
Set fcmbOrcVtmName = Nothing
Set fcmbSrvName = Nothing
Set fcmbSDctName = Nothing
Set fcmbDrlName = Nothing
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
Dim mPttRegNo As Long, mOpgPttCode As Long, mOpgVchNo As Long, mOrcVchNo As Long
Dim mOrcAmtAftDiscTot As Double, mOrcAdvAmtTot As Double, mOrcRecdAmtTot As Double, mOrcDepoAmtTot As Double, mOrcRefuAmtTot As Double, mOrcBalAmtTot As Double

Data_Verify = False
If FormAddEditMode = cFORM_EDITMODE And Val(mskFormBoundField.Text) < 1 Then
    ErrorBox "Invalid Key Value !!!"
    txtPttName.SetFocus
    GoTo EndSub
End If
Rem patient validation
mOpgPttCode = Val(mskOrcPttCode.Text)
If mOpgPttCode < 1 Then
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
    If mPttRegNo = 0 And clsVGNOPT.mOrcPttRegNoNotZero_bln = True Then
        AlertBox "Prohibited Zero Patient Reg.No. !!!"
        mskPttRegNo.SetFocus
        GoTo EndSub
    End If
End If
If Val(UnMyPerFmt(mskOrcPttDiscPer.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskOrcPttDiscPer.SetFocus
    GoTo EndSub
End If
Rem outdoor registration validation
If Val(mskOrcOpgCode.Text) < 1 Then
    ErrorBox "Invalid Key Value !!!"
    txtPttName.SetFocus
    GoTo EndSub
End If
mOpgVchNo = Val(UnMyNumFmt(mskOpgVchNo.Text))
If mOpgVchNo < 1 Then
    ErrorBox "Invalid Input !!!"
    mskOpgVchNo.SetFocus
    GoTo EndSub
End If
If IsDate(dtpOpgDate.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpOpgDate.SetFocus
    GoTo EndSub
End If
Rem outdoor receipt validations
mOrcVchNo = Val(UnMyNumFmt(mskOrcVchNo(0).Text))
If mOrcVchNo > 0 Then
    If mOrcVchNo <> mOrcVchNo_old Or Val(fcmbOrcVtmName.BoundText) <> mOrcVtmCode_old Or Ctod(dtpOrcDate.Text) <> mOrcDate_old Or FormAddEditMode = cFORM_ADDMODE Then
        If ChkIsDuplVTypeNo(dbVgnDatabase, dbAcDatabase, mTableName:="OutdHdr", mChkFieldName:="OhrVchNo", mChkFieldValue:=mOrcVchNo, mKeyFieldName:="OhrCode", mKeyFieldValue:=mOrcCode, mVtmFieldName:="OhrVtmCode", mVtmFieldValue:=Val(fcmbOrcVtmName.BoundText), mFinYrFieldName:="OhrCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="OhrDate", mDateFieldValue:=Ctod(dtpOrcDate.Text)) = True Then
            ErrorBox "Duplicate Voucher No. !!!"
            mskOrcVchNo(0).SetFocus
            ' ---------------
            If FormAddEditMode = cFORM_ADDMODE Then
                mOrcVchNo = GetNextVTypeNo(dbVgnDatabase, dbAcDatabase, dbComDatabase, mTableName:="OutdHdr", mFieldName:="OhrVchNo", mVtmFieldName:="OhrVtmCode", mVtmFieldValue:=Val(fcmbOrcVtmName.BoundText), mFinYrFieldName:="OhrCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="OhrDate", mDateFieldValue:=Ctod(dtpOrcDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormOrcAcsPermFileName)
            Else
                mOrcVchNo = mOrcVchNo_old
            End If
            mskOrcVchNo(0).Text = ToMyNumFmt(mOrcVchNo, mDecimals:=0)
            GoTo EndSub
        End If
    End If
Else
    ErrorBox "Invalid Input !!!"
    mskOrcVchNo(0).SetFocus
    GoTo EndSub
End If
If IsDate(dtpOrcDate.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpOrcDate.SetFocus
    GoTo EndSub
Else
    If IsFinYrDate(Ctod(dtpOrcDate.Text)) = False Then
        ErrorBox "Invalid Input !!!"
        dtpOrcDate.SetFocus
        GoTo EndSub
    End If
End If
If TimeToMin(txtOrcTime_str.Text) > cDAYMINUTES Then
    ErrorBox "Invalid Input !!!"
    txtOrcTime_str.SetFocus
    GoTo EndSub
End If
mOrcAmtAftDiscTot = Val(UnMyNumFmt(lblOrcAmtAftDiscTot.Caption))
If mOrcAmtAftDiscTot < 0 Then
    ErrorBox "Invalid Total After Discount !!!"
    Mfgrd2.SetFocus
    GoTo EndSub
End If
mOrcAdvAmtTot = Val(UnMyNumFmt(mskOrcAdvAmtTot.Text))
If mOrcAdvAmtTot < 0 Then
    ErrorBox "Invalid Input !!!"
    mskOrcAdvAmtTot.SetFocus
    GoTo EndSub
End If
mOrcRecdAmtTot = Val(UnMyNumFmt(mskOrcRecdAmtTot.Text))
If mOrcRecdAmtTot < 0 Then
    ErrorBox "Invalid Input !!!"
    mskOrcRecdAmtTot.SetFocus
    GoTo EndSub
End If
mOrcDepoAmtTot = Val(UnMyNumFmt(mskOrcDepoAmtTot.Text))
If mOrcDepoAmtTot < 0 Then
    ErrorBox "Invalid Input !!!"
    mskOrcDepoAmtTot.SetFocus
    GoTo EndSub
End If
mOrcRefuAmtTot = Val(UnMyNumFmt(mskOrcRefuAmtTot.Text))
If mOrcRefuAmtTot < 0 Then
    ErrorBox "Invalid Input !!!"
    mskOrcRefuAmtTot.SetFocus
    GoTo EndSub
End If
mOrcBalAmtTot = Val(UnMyNumFmt(mskOrcBalAmtTot.Text))
If mOrcBalAmtTot < 0 Then
    ErrorBox "Invalid Input !!!"
    mskOrcBalAmtTot.SetFocus
    GoTo EndSub
End If
If (mOrcAdvAmtTot + mOrcRecdAmtTot + mOrcDepoAmtTot) > mOrcAmtAftDiscTot Then
    ErrorBox "Excess Received Amount !!!"
    mskOrcRecdAmtTot.SetFocus
    GoTo EndSub
ElseIf mOrcRefuAmtTot > (mOrcAdvAmtTot + mOrcRecdAmtTot + mOrcDepoAmtTot) Then
    ErrorBox "Excess Amount Refunded !!!"
    mskOrcRecdAmtTot.SetFocus
    GoTo EndSub
End If

Data_Verify = True

EndSub:
Exit Function

End Function

Private Function Data_NetwAuth() As Boolean
Dim mOrcVchNo As Long
Data_NetwAuth = False

mOrcVchNo = Val(UnMyNumFmt(mskOrcVchNo(0).Text))
If mOrcVchNo <> mOrcVchNo_old Or Val(fcmbOrcVtmName.BoundText) <> mOrcVtmCode_old Or Ctod(dtpOrcDate.Text) <> mOrcDate_old Or FormAddEditMode = cFORM_ADDMODE Then
    If ChkIsDuplVTypeNo(dbVgnDatabase, dbAcDatabase, mTableName:="OutdHdr", mChkFieldName:="OhrVchNo", mChkFieldValue:=mOrcVchNo, mKeyFieldName:="OhrCode", mKeyFieldValue:=mOrcCode, mVtmFieldName:="OhrVtmCode", mVtmFieldValue:=Val(fcmbOrcVtmName.BoundText), mFinYrFieldName:="OhrCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="OhrDate", mDateFieldValue:=Ctod(dtpOrcDate.Text)) = True Then
        ErrorBox "Duplicate Voucher No. !!!"
        mskOrcVchNo(0).SetFocus
        ' ---------------
        If FormAddEditMode = True Then
            mOrcVchNo = GetNextVTypeNo(dbVgnDatabase, dbAcDatabase, dbComDatabase, mTableName:="OutdHdr", mFieldName:="OhrVchNo", mVtmFieldName:="OhrVtmCode", mVtmFieldValue:=Val(fcmbOrcVtmName.BoundText), mFinYrFieldName:="OhrCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="OhrDate", mDateFieldValue:=Ctod(dtpOrcDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormOrcAcsPermFileName)
        Else
            mOrcVchNo = mOrcVchNo_old
        End If
        mskOrcVchNo(0).Text = ToMyNumFmt(mOrcVchNo, mDecimals:=0)
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
Dim srow As Integer, mOrcICode As Long, mDeleteit As Boolean
srow = Mfgrd2.Row
mOrcICode = Val(Mfgrd2.TextMatrix(srow, X2ORCICODE_COL))

If MyDeleteKey(Shift, KeyCode, mCheckCtrlMask:=False) = True And mOrcICode > 0 Then
    mDeleteit = True
    If mDeleteit = True Then
        mDeleteit = CanDelete()
    End If
    If mDeleteit = True Then
        clsORC.DeleteDtl mOrcCode, mOrcICode
        
        ShowDtlData mOrcCode
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
        mskOrcSno.Text = ToMyNumFmt(FlexNextSeqno(Mfgrd2, X2ORCSNO_COL), mDecimals:=0)
        mskOrcUnit.Text = ToMyNumFmt(1, mDecimals:=0)
        mskOrcDiscPer.Text = mskOrcPttDiscPer.Text
    Else
        mskOrcICode.Text = Val(Mfgrd2.TextMatrix(srow, X2ORCICODE_COL))
        mskOrcSno.Text = Mfgrd2.TextMatrix(srow, X2ORCSNO_COL)
        fcmbSrvName.BoundText = Mfgrd2.TextMatrix(srow, X2ORCSRVCODE_COL): txtSrvName.Text = fcmbSrvName.Text
        txtSdcFlag.Text = Mfgrd2.TextMatrix(srow, X2SDCFLAG_COL)
        mskOrcUnit.Text = Mfgrd2.TextMatrix(srow, X2ORCUNIT_COL)
        mskOrcRate.Text = Mfgrd2.TextMatrix(srow, X2ORCRATE_COL)
        mskOrcAmtBefDisc.Text = Mfgrd2.TextMatrix(srow, X2ORCAMTBEFDISC_COL)
        mskOrcDiscPer.Text = Mfgrd2.TextMatrix(srow, X2ORCDISCPER_COL)
        mskOrcDiscAmt.Text = Mfgrd2.TextMatrix(srow, X2ORCDISCAMT_COL)
        mskOrcAmtAftDisc.Text = Mfgrd2.TextMatrix(srow, X2ORCAMTAFTDISC_COL)
    End If
    txtSrvName.SetFocus
    Call ValidDtl
    
    mOrcSrvCode_old = Val(fcmbSrvName.BoundText)
End If

End Sub

Private Sub Mfgrd2_RowColChange()
ShowActiveFlexRow Mfgrd2

End Sub

Private Sub mskOrcAdvAmtTot_GotFocus()
FlashActiveControl mskOrcAdvAmtTot, True
End Sub

Private Sub mskOrcAdvAmtTot_LostFocus()
FlashActiveControl mskOrcAdvAmtTot, False
End Sub

Private Sub mskOrcAmtAftDisc_GotFocus()
FlashActiveControl mskOrcAmtAftDisc, True
End Sub

Private Sub mskOrcAmtAftDisc_LostFocus()
FlashActiveControl mskOrcAmtAftDisc, False
End Sub

Private Sub mskOrcAmtAftDisc_Validate(Cancel As Boolean)
mskOrcAmtAftDisc.Text = ToMyNumFmt(mskOrcAmtAftDisc.Text)
If Val(UnMyNumFmt(mskOrcAmtAftDisc.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskOrcAmtAftDisc.SetFocus
    Cancel = True
Else
    Call CalcOrcChg
    Call ValidDtl
End If

End Sub

Rem discart this validation, instead use validation at receipt hdr level
Private Function chkOrcAmtAftDisc() As Boolean
Dim mRtnval As Boolean, srow As Integer, mOrcAmtAftDisc As Double, mOrcAdvAmt As Double, mOrcRecdAmt As Double, mOrcDepoAmt As Double, mOrcRefuAmt As Double

mRtnval = True
srow = Mfgrd2.Row
mOrcAmtAftDisc = Val(UnMyNumFmt(mskOrcAmtAftDisc.Text))
mOrcAdvAmt = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2ORCADVAMT_COL)))
mOrcDepoAmt = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2ORCDEPOAMT_COL)))
mOrcRefuAmt = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2ORCREFUAMT_COL)))

mOrcRecdAmt = mOrcAmtAftDisc - (mOrcAdvAmt + mOrcDepoAmt)
If mOrcRecdAmt < 0 Then
    ErrorBox "Amount Received in Excess !!!"
    mRtnval = False
ElseIf mOrcAmtAftDisc < (mOrcAdvAmt + mOrcRecdAmt + mOrcDepoAmt) Then
    ErrorBox "Amount Received in Excess !!!"
    mRtnval = False
ElseIf mOrcRefuAmt > (mOrcAdvAmt + mOrcDepoAmt + mOrcRecdAmt) Then
    ErrorBox "Amount Already Refunded !!!"
    mRtnval = False
End If
chkOrcAmtAftDisc = mRtnval

End Function

Private Sub mskOrcAmtBefDisc_GotFocus()
FlashActiveControl mskOrcAmtBefDisc, True
End Sub

Private Sub mskOrcAmtBefDisc_LostFocus()
FlashActiveControl mskOrcAmtBefDisc, False
End Sub

Private Sub mskOrcAmtBefDisc_Validate(Cancel As Boolean)
mskOrcAmtBefDisc.Text = ToMyNumFmt(mskOrcAmtBefDisc.Text)
If Val(UnMyNumFmt(mskOrcAmtBefDisc.Text)) <= 0 Then
    ErrorBox "Invalid Input !!!"
    mskOrcAmtBefDisc.SetFocus
    Cancel = True
Else
    Call CalcOrcChg
    Call ValidDtl
End If

End Sub

Private Sub mskOrcBalAmtTot_GotFocus()
FlashActiveControl mskOrcBalAmtTot, True
End Sub

Private Sub mskOrcBalAmtTot_LostFocus()
FlashActiveControl mskOrcBalAmtTot, False
End Sub

Private Sub mskOrcBalAmtTot_Validate(Cancel As Boolean)
If Val(UnMyNumFmt(mskOrcBalAmtTot.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskOrcBalAmtTot.SetFocus
    Rem Cancel = True
End If

End Sub

Private Sub mskOrcDepoAmtTot_GotFocus()
FlashActiveControl mskOrcDepoAmtTot, True
End Sub

Private Sub mskOrcDepoAmtTot_LostFocus()
FlashActiveControl mskOrcDepoAmtTot, False
End Sub

Private Sub mskOrcDepoAmtTot_Validate(Cancel As Boolean)
If Val(UnMyNumFmt(mskOrcDepoAmtTot.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskOrcDepoAmtTot.SetFocus
    Rem Cancel = True
End If

End Sub

Private Sub mskOrcDiscAmt_GotFocus()
FlashActiveControl mskOrcDiscAmt, True
End Sub

Private Sub mskOrcDiscAmt_LostFocus()
FlashActiveControl mskOrcDiscAmt, False
End Sub

Private Sub mskOrcDiscAmt_Validate(Cancel As Boolean)
mskOrcDiscAmt.Text = ToMyNumFmt(mskOrcDiscAmt.Text, mUseAbs:=True)
If Val(UnMyNumFmt(mskOrcDiscAmt.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskOrcDiscAmt.SetFocus
    Cancel = True
Else
    Call CalcOrcChg
End If
Call ValidDtl

End Sub

Private Sub mskOrcDiscPer_GotFocus()
FlashActiveControl mskOrcDiscPer, True
End Sub

Private Sub mskOrcDiscPer_LostFocus()
FlashActiveControl mskOrcDiscPer, False
End Sub

Private Sub mskOrcDiscPer_Validate(Cancel As Boolean)
mskOrcDiscPer.Text = ToMyPerFmt(mskOrcDiscPer.Text, mUseAbs:=True)
If Val(UnMyPerFmt(mskOrcDiscPer.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskOrcDiscPer.SetFocus
    Cancel = True
Else
    Call CalcOrcChg
End If
Call ValidDtl

End Sub

Private Sub mskOpgVchNo_GotFocus()
FlashActiveControl mskOpgVchNo, True
End Sub

Private Sub mskOpgVchNo_LostFocus()
FlashActiveControl mskOpgVchNo, False
End Sub

Private Sub mskOpgVchNo_Validate(Cancel As Boolean)
Dim mOpgVchNo As Long

mOpgVchNo = Val(UnMyNumFmt(mskOpgVchNo.Text))
If mOpgVchNo < 0 Then
    ErrorBox "Invalid Input !!!"
    mskOpgVchNo.SetFocus
    Cancel = True
End If

End Sub

Private Sub mskOrcRate_GotFocus()
FlashActiveControl mskOrcRate, True
End Sub

Private Sub mskOrcRate_LostFocus()
FlashActiveControl mskOrcRate, False
End Sub

Private Sub mskOrcRate_Validate(Cancel As Boolean)
mskOrcRate.Text = ToMyNumFmt(mskOrcRate.Text)
If Val(UnMyNumFmt(mskOrcRate.Text)) <= 0 Then
    ErrorBox "Invalid Input !!!"
    mskOrcRate.SetFocus
    Cancel = True
Else
    Call CalcOrcChg
    Call ValidDtl
End If

End Sub

Private Sub mskOrcRecdAmtTot_GotFocus()
FlashActiveControl mskOrcRecdAmtTot, True
End Sub

Private Sub mskOrcRecdAmtTot_LostFocus()
FlashActiveControl mskOrcRecdAmtTot, False
End Sub

Private Sub mskOrcRecdAmtTot_Validate(Cancel As Boolean)
Dim mOrcAdvAmtTot As Double, mOrcRecdAmtTot As Double, mOrcDepoAmtTot As Double, mOrcRefuAmtTot As Double, mOrcAmtAftDiscTot As Double

mOrcAdvAmtTot = Val(UnMyNumFmt(mskOrcAdvAmtTot.Text))
mOrcRecdAmtTot = Val(UnMyNumFmt(mskOrcRecdAmtTot.Text))
mOrcDepoAmtTot = Val(UnMyNumFmt(mskOrcDepoAmtTot.Text))
mOrcRefuAmtTot = Val(UnMyNumFmt(mskOrcRefuAmtTot.Text))
mOrcAmtAftDiscTot = Val(UnMyNumFmt(lblOrcAmtAftDiscTot.Caption))

mskOrcRecdAmtTot.Text = ToMyNumFmt(mOrcRecdAmtTot)
If mOrcRecdAmtTot < 0 Then
    ErrorBox "Invalid Input !!!"
    mskOrcRecdAmtTot.SetFocus
    Rem Cancel = True
Else
    If (mOrcAdvAmtTot + mOrcRecdAmtTot + mOrcDepoAmtTot) > mOrcAmtAftDiscTot Then
        ErrorBox "Excess Received Amount !!!"
        mOrcRecdAmtTot = mOrcAmtAftDiscTot - (mOrcAdvAmtTot + mOrcDepoAmtTot)
        mskOrcRecdAmtTot.Text = ToMyNumFmt(mOrcRecdAmtTot)
        mskOrcRecdAmtTot.SetFocus
        Rem Cancel = True
    ElseIf mOrcRefuAmtTot > (mOrcAdvAmtTot + mOrcRecdAmtTot + mOrcDepoAmtTot) Then
        ErrorBox "Excess Amount Refunded !!!"
        mOrcRecdAmtTot = mOrcRefuAmtTot - (mOrcAdvAmtTot + mOrcDepoAmtTot)
        mskOrcRecdAmtTot.Text = ToMyNumFmt(mOrcRecdAmtTot)
        mskOrcRecdAmtTot.SetFocus
        Rem Cancel = True
    Else
        CalcFtrTotal mCalcBalOnly:=True
'    Else
'        If FormAddEditMode = cFORM_ADDMODE Or mOrcRecdAmtTot <> mOrcRecdAmtTot_old Then
'            DisperseRecdAmt mOrcCode
'            ShowDtlData mOrcCode
'        End If
    End If
End If

End Sub

Private Sub mskOrcRefuAmtTot_GotFocus()
FlashActiveControl mskOrcRefuAmtTot, True
End Sub

Private Sub mskOrcRefuAmtTot_LostFocus()
FlashActiveControl mskOrcRefuAmtTot, False
End Sub

Private Sub mskOrcRefuAmtTot_Validate(Cancel As Boolean)
If Val(UnMyNumFmt(mskOrcRefuAmtTot.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskOrcRefuAmtTot.SetFocus
    Rem Cancel = True
End If

End Sub

Private Sub mskOrcUnit_GotFocus()
FlashActiveControl mskOrcUnit, True
End Sub

Private Sub mskOrcUnit_LostFocus()
FlashActiveControl mskOrcUnit, False
End Sub

Private Sub mskOrcUnit_Validate(Cancel As Boolean)
mskOrcUnit.Text = ToMyNumFmt(mskOrcUnit.Text, mDecimals:=0)
If Val(UnMyNumFmt(mskOrcUnit.Text)) <= 0 Then
    ErrorBox "Invalid Input !!!"
    mskOrcUnit.SetFocus
    Cancel = True
Else
    Call CalcOrcChg
    Call ValidDtl
End If

End Sub

Private Sub mskOrcVchNo_GotFocus(Index As Integer)
FlashActiveControl mskOrcVchNo(Index), True
End Sub

Private Sub mskOrcVchNo_LostFocus(Index As Integer)
FlashActiveControl mskOrcVchNo(Index), False
End Sub

Private Sub mskOrcVchNo_Validate(Index As Integer, Cancel As Boolean)
Dim mOrcVchNo As Long

mOrcVchNo = Val(UnMyNumFmt(mskOrcVchNo(Index).Text))
If mOrcVchNo < 0 Then
    If Index = 0 Then
        mOrcVchNo = GetNextVTypeNo(dbVgnDatabase, dbAcDatabase, dbComDatabase, mTableName:="OutdHdr", mFieldName:="OhrVchNo", mVtmFieldName:="OhrVtmCode", mVtmFieldValue:=Val(fcmbOrcVtmName.BoundText), mFinYrFieldName:="OhrCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="OhrDate", mDateFieldValue:=Ctod(dtpOrcDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormOrcAcsPermFileName)
        mskOrcVchNo(Index).Text = ToMyNumFmt(mOrcVchNo, mDecimals:=0)
    Else
        ErrorBox "Invalid Input !!!"
        mskOrcVchNo(Index).SetFocus
        Cancel = True
    End If
ElseIf mOrcVchNo > 0 Then
    If Index = 0 Then
        If mOrcVchNo <> mOrcVchNo_old Or Val(fcmbOrcVtmName.BoundText) <> mOrcVtmCode_old Or Ctod(dtpOrcDate.Text) <> mOrcDate_old Or FormAddEditMode = cFORM_ADDMODE Then
            If ChkIsDuplVTypeNo(dbVgnDatabase, dbAcDatabase, mTableName:="OutdHdr", mChkFieldName:="OhrVchNo", mChkFieldValue:=mOrcVchNo, mKeyFieldName:="OhrCode", mKeyFieldValue:=mOrcCode, mVtmFieldName:="OhrVtmCode", mVtmFieldValue:=Val(fcmbOrcVtmName.BoundText), mFinYrFieldName:="OhrCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="OhrDate", mDateFieldValue:=Ctod(dtpOrcDate.Text)) = True Then
                ErrorBox "Duplicate Voucher No. !!!"
                Cancel = True
                mskOrcVchNo(Index).SetFocus
                ' ----------
                If FormAddEditMode = cFORM_ADDMODE Then
                    mOrcVchNo = GetNextVTypeNo(dbVgnDatabase, dbAcDatabase, dbComDatabase, mTableName:="OutdHdr", mFieldName:="OhrVchNo", mVtmFieldName:="OhrVtmCode", mVtmFieldValue:=Val(fcmbOrcVtmName.BoundText), mFinYrFieldName:="OhrCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="OhrDate", mDateFieldValue:=Ctod(dtpOrcDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormOrcAcsPermFileName)
                Else
                    mOrcVchNo = mOrcVchNo_old
                End If
                mskOrcVchNo(Index).Text = ToMyNumFmt(mOrcVchNo, mDecimals:=0)
            End If
        End If
        If Cancel = False Then
            mskOrcVchNo(Index).Text = ToMyNumFmt(mOrcVchNo, mDecimals:=0)
        End If
    Else
        If ChkIsExistVTypeNo(dbVgnDatabase, mTableName:="OutdHdr", mChkFieldName:="OhrVchNo", mChkFieldValue:=CStr(mOrcVchNo), mVtmFieldName:="OhrVtmCode", mVtmFieldValue:=Val(fcmbOrcVtmName.BoundText), mFinYrFieldName:="OhrCmpCode", mFinYrFieldValue:=sFinYrCmpCode) = False Then
            ErrorBox "Voucher No. does not Exist !!!"
            mskOrcVchNo(Index).SetFocus
            Rem Cancel = True
        End If
    End If
Else
    ErrorBox "Invalid Input !!!"
    mskOrcVchNo(Index).SetFocus
    Cancel = True
End If

End Sub

Private Sub mskOrdSno_GotFocus()
FlashActiveControl mskOrdSno, True
End Sub

Private Sub mskOrdSno_LostFocus()
FlashActiveControl mskOrdSno, False
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

Private Sub mskOrcPttDiscPer_GotFocus()
FlashActiveControl mskOrcPttDiscPer, True
End Sub

Private Sub mskOrcPttDiscPer_LostFocus()
FlashActiveControl mskOrcPttDiscPer, False
End Sub

Private Sub mskOrcPttDiscPer_Validate(Cancel As Boolean)
mskOrcPttDiscPer.Text = ToMyPerFmt(mskOrcPttDiscPer.Text)
If Val(UnMyPerFmt(mskOrcPttDiscPer.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskOrcPttDiscPer.SetFocus
    Cancel = True
End If

End Sub

Private Sub mskPttRegNo_GotFocus()
FlashActiveControl mskPttRegNo, True
End Sub

Private Sub mskPttRegNo_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call ShowOldOpgListByPttRegNo
ElseIf MyAddNewKey(Shift, KeyCode) = True Then
    If FormAddEditMode = cFORM_ADDMODE Then
        clsORC.EndTran mOrcCode
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
        If mPttRegNo = 0 And clsVGNOPT.mOrcPttRegNoNotZero_bln = True Then
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

Private Sub txtOhrRemark_GotFocus()
FlashActiveControl txtOhrRemark, True
End Sub

Private Sub txtOhrRemark_LostFocus()
FlashActiveControl txtOhrRemark, False
End Sub

Private Sub txtOhrRemark_Validate(Cancel As Boolean)
txtOhrRemark.Text = ToMyWord(txtOhrRemark.Text)
End Sub

Private Sub txtOpgTime_str_GotFocus()
FlashActiveControl txtOpgTime_str, True
End Sub

Private Sub txtOpgTime_str_LostFocus()
FlashActiveControl txtOpgTime_str, False
End Sub

Private Sub txtOpgTime_str_Validate(Cancel As Boolean)
txtOpgTime_str.Text = MinToTime(TimeToMin(txtOpgTime_str.Text))
If TimeToMin(txtOpgTime_str.Text) > cDAYMINUTES Then
    ErrorBox "Invalid Input !!!"
    txtOpgTime_str.SetFocus
    Cancel = True
End If

End Sub

Private Sub txtOrcTime_str_GotFocus()
FlashActiveControl txtOrcTime_str, True
End Sub

Private Sub txtOrcTime_str_LostFocus()
FlashActiveControl txtOrcTime_str, False
End Sub

Private Sub txtOrcTime_str_Validate(Cancel As Boolean)
txtOrcTime_str.Text = MinToTime(TimeToMin(txtOrcTime_str.Text))
If TimeToMin(txtOrcTime_str.Text) > cDAYMINUTES Then
    ErrorBox "Invalid Input !!!"
    txtOrcTime_str.SetFocus
    Cancel = True
Else
    Call ChkServRate
    Call CalcOrcChg
End If

End Sub

Private Sub txtOrcVtmName_Change(Index As Integer)
If fcmbOrcVtmName.CallFromText_Change = False Then
    fcmbOrcVtmName.CallFromText_Change = True
    If InterActiveChange(txtOrcVtmName(Index)) = True Then
        fcmbOrcVtmName.UserText = Array(txtOrcVtmName(Index).Text, txtOrcVtmName(Index).SelStart)
        fcmbOrcVtmName.Show
        txtOrcVtmName(Index).Text = fcmbOrcVtmName.Text
        If fcmbOrcVtmName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbOrcVtmName.CallFromText_Change = False
End If

End Sub

Private Sub txtOrcVtmName_GotFocus(Index As Integer)
FlashActiveControl txtOrcVtmName(Index), True
End Sub

Private Sub txtOrcVtmName_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    txtOrcVtmName_Change Index
ElseIf MyAddNewKey(Shift, KeyCode) = True Then

ElseIf Shift = 0 And KeyCode = vbKeyF6 Then
    Rem Call ShowOldOpgListByOpgNo show here all outdoor receipt details
End If

End Sub

Private Sub txtOrcVtmName_LostFocus(Index As Integer)
FlashActiveControl txtOrcVtmName(Index), False
End Sub

Private Sub txtOrcVtmName_Validate(Index As Integer, Cancel As Boolean)
Dim mOrcVchNo As Long

If Val(fcmbOrcVtmName.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    txtOrcVtmName(Index).SetFocus
    Cancel = True
Else
    If Index = 0 Then
        If Val(fcmbOrcVtmName.BoundText) <> mOrcVtmCode_old Or Ctod(dtpOrcDate.Text) <> mOrcDate_old Or FormAddEditMode = cFORM_ADDMODE Then
            mOrcVchNo = GetNextVTypeNo(dbVgnDatabase, dbAcDatabase, dbComDatabase, mTableName:="OutdHdr", mFieldName:="OhrVchNo", mVtmFieldName:="OhrVtmCode", mVtmFieldValue:=Val(fcmbOrcVtmName.BoundText), mFinYrFieldName:="OhrCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="OhrDate", mDateFieldValue:=Ctod(dtpOrcDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormOrcAcsPermFileName)
            mskOrcVchNo(Index).Text = ToMyNumFmt(mOrcVchNo, mDecimals:=0)
        End If
    End If
End If

End Sub

Private Sub txtOrdRemark_GotFocus()
FlashActiveControl txtOrdRemark, True
End Sub

Private Sub txtOrdRemark_LostFocus()
FlashActiveControl txtOrdRemark, False
End Sub

Private Sub txtOrdRemark_Validate(Cancel As Boolean)
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

Private Sub txtPttName_GotFocus()
FlashActiveControl txtPttName, True
End Sub

Private Sub txtPttName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call ShowOldOpgListByPttName
ElseIf MyAddNewKey(Shift, KeyCode) = True Then
    If FormAddEditMode = cFORM_ADDMODE Then
        clsORC.EndTran mOrcCode
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
If clsORC.BeginTran(0) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_ADDMODE

clsORC.ClearHdr: clsORC.ClearDtl
clsOPG.Clear
clsPAT.Clear

mOrcCode = clsORC.ActiveTrnCode
mOrcOpgCode = 0
mOrcPttCode = 0

ShowOrcData mOrcCode
ShowOpgData mOrcOpgCode
ShowPatData mOrcPttCode

Rem restoring user editing features
Call ShowOrcDefData
Call ShowPatDefData
Call ShowOpgDefData

Rem old values
Call StoreOrcOldData
Call StorePatOldData
Call StoreOpgOldData

Call ShowEntryMode(True)
txtPttName.SetFocus

End Sub

Private Sub Data_EditEvent()

If CanUserEditOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If clsORC.BeginTran(datRecset.fields("OhrCode")) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_EDITMODE

With datRecset
mOrcCode = .fields("OhrCode")
mOrcOpgCode = .fields("OhrOpgCode")
mOrcPttCode = .fields("OhrPttCode")

clsORC.GetHdrData mOrcCode
clsOPG.GetData mOrcOpgCode
clsPAT.GetData mOrcPttCode
End With

ShowOrcData mOrcCode
ShowOpgData mOrcOpgCode
ShowPatData mOrcPttCode

Rem old values
Call StoreOrcOldData
Call StoreOpgOldData
Call StorePatOldData

Call ShowEntryMode(True)
txtPttName.SetFocus

End Sub

Private Sub ShowPatData(ByVal mPttCode As Long)

With clsPAT
.GetData mPttCode

mskOrcPttCode.Text = mPttCode
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
clsPAT.GetData Val(UnMyNumFmt(mskOrcPttCode.Text))

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

Private Sub ShowOpgData(ByVal mOpgCode As Long)

With clsOPG
.GetData mOpgCode

mskOrcOpgCode.Text = mOpgCode
clsVTM.GetData .mVtmCode_lng: txtOpgVtmName.Text = clsVTM.mName_str
txtOpgPrefix.Text = .mOpgPrefix_str
mskOpgVchNo.Text = ToMyNumFmt(.mVchNo_lng, mDecimals:=0)
dtpOpgDate.Text = Dtoc(.mVchDate_dt)
txtOpgTime_str.Text = MinToTime(.mOpgTime_lng)
clsDCT.GetData .mOpgCDctCode_lng: txtCDctName.Text = clsDCT.mName_str
clsDCT.GetData .mOpgRByCode_lng: txtRByName.Text = clsDCT.mName_str
clsDIG.GetData .mOpgFDigCode_lng: txtFDigName.Text = clsDIG.mName_str
txtOpgRemark.Text = .mOpgRemark_str
End With

txtOpgVtmName.Locked = (mOpgCode > 0)
txtOpgPrefix.Locked = (mOpgCode > 0)
mskOpgVchNo.Locked = (mOpgCode > 0)
dtpOpgDate.Locked = (mOpgCode > 0)
txtOpgTime_str.Locked = (mOpgCode > 0)
txtCDctName.Locked = (mOpgCode > 0)
txtRByName.Locked = (mOpgCode > 0)
txtFDigName.Locked = (mOpgCode > 0)
txtOpgRemark.Locked = (mOpgCode > 0)

End Sub

Private Sub ShowOpgDefData()
Dim mOpgVchNo As Long

dtpOpgDate.Text = Dtoc(DefaultEntryDate)
txtOpgTime_str.Text = MinToTime(TimeToMin(DateTime.Time$))
txtOpgVtmName.Text = ""
txtOpgPrefix.Text = ""
mskOpgVchNo.Text = 0

End Sub

Private Sub StoreOpgOldData()
clsOPG.GetData Val(UnMyNumFmt(mskOrcOpgCode.Text))

mOpgCDctCode_old = clsOPG.mOpgCDctCode_lng
mOpgRByCode_old = clsOPG.mOpgRByCode_lng
mOpgRToCode_old = clsOPG.mOpgRToCode_lng

End Sub

Private Sub ShowOrcData(ByVal mOrcCode As Long)
With clsORC
.GetHdrData mOrcCode

mskFormBoundField.Text = mOrcCode
fcmbOrcVtmName.BoundText = CStr(.mTrnVtmCode_lng): txtOrcVtmName(0).Text = fcmbOrcVtmName.Text
txtOrcPrefix.Text = .mTrnPrefix_str
mskOrcVchNo(0).Text = ToMyNumFmt(.mTrnVchNo_lng, mDecimals:=0)
dtpOrcDate.Text = Dtoc(.mTrnDate_dt)
txtOrcTime_str.Text = MinToTime(.mOhrTime_lng)
txtOhrRemark.Text = .mOhrRemark_str
mskOrcPttDiscPer.Text = ToMyPerFmt(.mOhrPttDiscPer_dbl)

mskOrcAdvAmtTot.Text = ToMyNumFmt(.mOhrAdvAmt_dbl)
mskOrcRecdAmtTot.Text = ToMyNumFmt(.mOhrRecdAmt_dbl)
mskOrcDepoAmtTot.Text = ToMyNumFmt(.mOhrDepoAmt_dbl)
mskOrcRefuAmtTot.Text = ToMyNumFmt(.mOhrRefuAmt_dbl)

Rem old outdoor receipt
mOrcOldOrcCode = .mOhrOldOhrCode_lng
ShowOldOrcCodeDesc mOrcOldOrcCode
End With

'Call CalcOrcChg
ShowDtlData mOrcCode
Call ShowLinkTranDtl

End Sub

Private Sub ShowOrcDefData()
Dim mOrcVchNo As Long

dtpOrcDate.Text = Dtoc(DefaultEntryDate)
txtOrcTime_str.Text = MinToTime(TimeToMin(DateTime.Time$))

fcmbOrcVtmName.BoundText = CStr(clsVGNOPT.GetOutdRcptOptBoundCode("OrcVtmCode")): txtOrcVtmName(0).Text = fcmbOrcVtmName.Text

mOrcVchNo = GetNextVTypeNo(dbVgnDatabase, dbAcDatabase, dbComDatabase, mTableName:="OutdHdr", mFieldName:="OhrVchNo", mVtmFieldName:="OhrVtmCode", mVtmFieldValue:=Val(fcmbOrcVtmName.BoundText), mFinYrFieldName:="OhrCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="OhrDate", mDateFieldValue:=Ctod(dtpOrcDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormOrcAcsPermFileName)
mskOrcVchNo(0).Text = ToMyNumFmt(mOrcVchNo, mDecimals:=0)

End Sub

Private Sub StoreOrcOldData()
mOrcCode_old = mOrcCode
mOrcDate_old = Ctod(dtpOrcDate.Text)
mOrcTime_old = TimeToMin(txtOrcTime_str.Text)
mOrcVtmCode_old = Val(fcmbOrcVtmName.BoundText)
mOrcVchNo_old = Val(UnMyNumFmt(mskOrcVchNo(0).Text))
mOrcRecdAmtTot_old = Val(UnMyNumFmt(mskOrcRecdAmtTot.Text))

mskOrcDiscPer.Tag = False
mskOrcDiscAmt.Tag = False

End Sub

Private Sub ShowDtlData(ByVal mOrcCode As Long)
Dim srow As Integer, tRecset As New ADODB.Recordset, mColCnt As Integer, mSdcCount As Integer

srow = 1
Mfgrd2.Rows = 2

With tRecset
.open "Select * from OutdRcpt where OrcCode=" & CStr(mOrcCode) & " order by OrcSno", dbVgnDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Do While .EOF = False
        If InList(.fields("OrcRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
            clsSRV.GetData .fields("OrcSrvCode")
            
            Mfgrd2.TextMatrix(srow, X2ORCICODE_COL) = .fields("OrcICode")
            Mfgrd2.TextMatrix(srow, X2ORCSNO_COL) = ToMyNumFmt(.fields("OrcSno"), mDecimals:=0)
            Mfgrd2.TextMatrix(srow, X2SRVNAME_COL) = clsSRV.mName_str
            If GetServDctDtlCount(cnn:=dbVgnDatabase, mTableName:="OutdRcDctDtl", mSdcCodeField:="OrdCode", mSdcCode:=.fields("OrcCode"), mSdcSubCodeField:="OrdOrcCode", mSdcSubCode:=.fields("OrcICode")) > 0 Then
                Mfgrd2.TextMatrix(srow, X2SDCFLAG_COL) = "Y"
            Else
                If clsSRV.mSrvMultiDctIncl_bln = True Then
                    Mfgrd2.TextMatrix(srow, X2SDCFLAG_COL) = "N"
                Else
                    Mfgrd2.TextMatrix(srow, X2SDCFLAG_COL) = ""
                End If
            End If
            Mfgrd2.TextMatrix(srow, X2ORCUNIT_COL) = ToMyNumFmt(.fields("OrcUnit"), mDecimals:=0)
            Mfgrd2.TextMatrix(srow, X2ORCRATE_COL) = ToMyNumFmt(.fields("OrcRate"))
            Mfgrd2.TextMatrix(srow, X2ORCAMTBEFDISC_COL) = ToMyNumFmt(.fields("OrcAmtBefDisc"))
            Mfgrd2.TextMatrix(srow, X2ORCDISCPER_COL) = ToMyPerFmt(.fields("OrcDiscPer"))
            Mfgrd2.TextMatrix(srow, X2ORCDISCAMT_COL) = ToMyNumFmt(.fields("OrcDiscAmt"))
            Mfgrd2.TextMatrix(srow, X2ORCAMTAFTDISC_COL) = ToMyNumFmt(.fields("OrcAmtAftDisc"))
            Mfgrd2.TextMatrix(srow, X2ORCADVAMT_COL) = ToMyNumFmt(.fields("OrcAdvAmt"))
            Mfgrd2.TextMatrix(srow, X2ORCRECDAMT_COL) = ToMyNumFmt(.fields("OrcRecdAmt"))
            Mfgrd2.TextMatrix(srow, X2ORCDEPOAMT_COL) = ToMyNumFmt(.fields("OrcDepoAmt"))
            Mfgrd2.TextMatrix(srow, X2ORCREFUAMT_COL) = ToMyNumFmt(.fields("OrcRefuAmt"))
            Mfgrd2.TextMatrix(srow, X2ORCBALAMT_COL) = ToMyNumFmt(.fields("OrcBalAmt"))
            Mfgrd2.TextMatrix(srow, X2ORCSRVCODE_COL) = .fields("OrcSrvCode")
            Mfgrd2.TextMatrix(srow, X2ORCRECSTATE_COL) = .fields("OrcRecState")
            
            Mfgrd2.Rows = Mfgrd2.Rows + 1
            srow = srow + 1
        Else
            If InList(.fields("OrcRecState"), Array(cREC_CANCELED, cREC_DELETED)) = False Then
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

With clsORC
If FormAddEditMode = cFORM_ADDMODE Then
    .ClearHdr
Else
    .GetHdrData mOrcCode
End If
.mTrnDate_dt = Ctod(dtpOrcDate.Text)
.mTrnVtmCode_lng = Val(fcmbOrcVtmName.BoundText)
.mTrnPrefix_str = txtOrcPrefix.Text
.mTrnVchNo_lng = Val(UnMyNumFmt(mskOrcVchNo(0).Text))
.mTrnPostfix_str = ""
.mTrnCmpCode_int = sFinYrCmpCode

.mOhrTime_lng = TimeToMin(txtOrcTime_str.Text)
.mOhrOpgCode_lng = mOrcOpgCode
.mOhrPttCode_lng = mOrcPttCode
.mOhrPttDiscPer_dbl = Val(UnMyPerFmt(mskOrcPttDiscPer.Text))
.mOhrOldOhrCode_lng = mOrcOldOrcCode
.mOhrAmtBefDisc_dbl = Val(UnMyNumFmt(lblOrcAmtBefDiscTot.Caption))
.mOhrDiscAmt_dbl = Val(UnMyNumFmt(lblOrcDiscAmtTot.Caption))
.mOhrAmtAftDisc_dbl = Val(UnMyNumFmt(lblOrcAmtAftDiscTot.Caption))
.mOhrAdvAmt_dbl = Val(UnMyNumFmt(mskOrcAdvAmtTot.Text))
.mOhrRecdAmt_dbl = Val(UnMyNumFmt(mskOrcRecdAmtTot.Text))
.mOhrDepoAmt_dbl = Val(UnMyNumFmt(mskOrcDepoAmtTot.Text))
.mOhrRefuAmt_dbl = Val(UnMyNumFmt(mskOrcRefuAmtTot.Text))
.mOhrBalAmt_dbl = Val(UnMyNumFmt(mskOrcBalAmtTot.Text))
.mOhrRemark_str = txtOhrRemark.Text

If FormAddEditMode = cFORM_ADDMODE Then
    If .AddNewHdr() = True Then
        mskFormBoundField.Text = .mTrnCode_lng
        
        Rem remove any unexpected doctor detail for service
        dbVgnDatabase.BeginTrans
        dbVgnDatabase.Execute "Delete from OutdRcDctDtl where OrdOrcCode IN (Select OrcICode from OutdRcpt as orc inner join ServMast as srv on orc.OrcSrvCode=srv.SrvCode where srv.SrvMultiDctIncl=False and orc.OrcCode=" & CStr(mOrcCode) & ") and OrdCode=" & CStr(mOrcCode) & ""
        dbVgnDatabase.CommitTrans
        
        Rem updating linked autonumber
        Rem dbVgnDatabase.BeginTrans
        Rem dbVgnDatabase.Execute "Update OutdRcDctDtl set OrdCode=" & CStr(.mTrnCode_lng) & " where OrdCode=" & CStr(mOrcCode) & ""
        Rem dbVgnDatabase.CommitTrans
    End If
Else
    .UpdateHdr mOrcCode
End If
If .mTrnCode_lng > 0 Then   ' updated successfully
    mOrcCode = .mTrnCode_lng
    
    .UpdateTran .mTrnCode_lng
    .EndTran .mTrnCode_lng
    
    Rem updating user editing carry forward features
    clsVGNOPT.mOrcVtmCodeOld_lng = .mTrnVtmCode_lng
    clsVGNOPT.UpdateOutdRcptOld
    
    mEntrySaved = True
Else
    Call Data_CancelEvent
    ErrorBox "Entry Cancelled !!!"
End If
End With

If clsORC.mTrnCode_lng > 0 Then   ' updated successfully
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

mOrcCode = datRecset.fields("OhrCode")
mOrcPttCode = datRecset.fields("OhrPttCode")
mRecAbsPos = datRecset.AbsolutePosition

If clsORC.CanDeleteTran(mOrcCode) = True Then
    txtVoid.SetFocus
    If clsORC.BeginTran(mOrcCode) = True Then
        clsORC.DeleteTran mOrcCode
        clsORC.UpdateTran mOrcCode
        clsORC.EndTran mOrcCode
        
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
clsORC.CancelTran mOrcCode
clsORC.EndTran mOrcCode

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
        clsListStru.AddFields mExpr:="OrcYrMonth", mAttrib:=cFAT_SYSTEM
        clsListStru.AddFields mExpr:="OrcMnYear", mTitle:="Month", mShowItem:=True, mAlign:=1, mWidth:=2000
        clsListStru.AddFields mExpr:="OrcCount", mTitle:="Count", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="OrcAmtAftDisc_sum", mTitle:="Charges", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="OrcBalAmt_sum", mTitle:="Due Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="OrcAdvAmt_sum", mTitle:="Adv.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="OrcRecdAmt_sum", mTitle:="Recd.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="OrcDepoAmt_sum", mTitle:="Depo.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="OrcRefuAmt_sum", mTitle:="Refu.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="OrcDiscAmt_sum", mTitle:="Discount", mShowItem:=True, mAlign:=7, mWidth:=1500
        
        datRecset.open "Select format(OhrDate,'yyyy/MM') as OrcYrMonth" _
         & ",Count(OhrCode) as OrcCount" _
         & ",Sum(OhrAmtAftDisc) as OrcAmtAftDisc_sum" _
         & ",Sum(OhrBalAmt) as OrcBalAmt_sum" _
         & ",Sum(OhrAdvAmt) as OrcAdvAmt_sum" _
         & ",Sum(OhrRecdAmt) as OrcRecdAmt_sum" _
         & ",Sum(OhrDepoAmt) as OrcDepoAmt_sum" _
         & ",Sum(OhrRefuAmt) as OrcRefuAmt_sum" _
         & ",Sum(OhrDiscAmt) as OrcDiscAmt_sum" _
         & " from OutdHdr" _
         & " where OhrDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and OhrCode>0" _
         & IIf(mQryPttCode > 0, " and OhrPttCode=" & CStr(mQryPttCode), "") _
         & " group by format(OhrDate,'yyyy/MM')" _
         & " order by format(OhrDate,'yyyy/MM')" _
         , dbVgnDatabase, adOpenKeyset, adLockReadOnly

    ElseIf optDatewise.Value = True Then
        clsListStru.AddFields mExpr:="OrcDateYMD", mAttrib:=cFAT_SYSTEM
        clsListStru.AddFields mExpr:="OrcDate", mTitle:="Date", mShowItem:=True, mAlign:=1, mWidth:=2000
        clsListStru.AddFields mExpr:="OrcCount", mTitle:="Count", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="OrcAmtAftDisc_sum", mTitle:="Charges", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="OrcBalAmt_sum", mTitle:="Due Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="OrcAdvAmt_sum", mTitle:="Adv.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="OrcRecdAmt_sum", mTitle:="Recd.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="OrcDepoAmt_sum", mTitle:="Depo.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="OrcRefuAmt_sum", mTitle:="Refu.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="OrcDiscAmt_sum", mTitle:="Discount", mShowItem:=True, mAlign:=7, mWidth:=1500
        
        datRecset.open "Select OhrDate" _
         & ",Count(OhrCode) as OrcCount" _
         & ",Sum(OhrAmtAftDisc) as OrcAmtAftDisc_sum" _
         & ",Sum(OhrBalAmt) as OrcBalAmt_sum" _
         & ",Sum(OhrAdvAmt) as OrcAdvAmt_sum" _
         & ",Sum(OhrRecdAmt) as OrcRecdAmt_sum" _
         & ",Sum(OhrDepoAmt) as OrcDepoAmt_sum" _
         & ",Sum(OhrRefuAmt) as OrcRefuAmt_sum" _
         & ",Sum(OhrDiscAmt) as OrcDiscAmt_sum" _
         & " from OutdHdr" _
         & " where OhrDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and OhrCode>0" _
         & IIf(mQryPttCode > 0, " and OhrPttCode=" & CStr(mQryPttCode), "") _
         & " group by OhrDate" _
         & " order by OhrDate" _
         , dbVgnDatabase, adOpenKeyset, adLockReadOnly
        
    ElseIf optPatientwise.Value = True Then
        clsListStru.AddFields mExpr:="PttName", mTitle:="Patient Name", mShowItem:=True, mAlign:=1, mWidth:=3000
        clsListStru.AddFields mExpr:="PttRegNo", mTitle:="Reg.No", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="PttRefName", mTitle:="Care of", mShowItem:=True, mAlign:=1, mWidth:=2000
        clsListStru.AddFields mExpr:="OrcCount", mTitle:="Count", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="OrcAmtAftDisc_sum", mTitle:="Charges", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="OrcBalAmt_sum", mTitle:="Due Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="OrcAdvAmt_sum", mTitle:="Adv.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="OrcRecdAmt_sum", mTitle:="Recd.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="OrcDepoAmt_sum", mTitle:="Depo.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="OrcRefuAmt_sum", mTitle:="Refu.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="OrcDiscAmt_sum", mTitle:="Discount", mShowItem:=True, mAlign:=7, mWidth:=1500
        
        datRecset.open "Select PatMast.PttName,PatMast.PttRegNo,OutdHdr.OhrPttCode" _
         & ",Count(OhrCode) as OrcCount" _
         & ",Sum(OhrAmtAftDisc) as OrcAmtAftDisc_sum" _
         & ",Sum(OhrBalAmt) as OrcBalAmt_sum" _
         & ",Sum(OhrAdvAmt) as OrcAdvAmt_sum" _
         & ",Sum(OhrRecdAmt) as OrcRecdAmt_sum" _
         & ",Sum(OhrDepoAmt) as OrcDepoAmt_sum" _
         & ",Sum(OhrRefuAmt) as OrcRefuAmt_sum" _
         & ",Sum(OhrDiscAmt) as OrcDiscAmt_sum" _
         & " from OutdHdr inner join PatMast on OutdHdr.OhrPttCode=PatMast.PttCode" _
         & " where OhrDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and OhrCode>0" _
         & IIf(mQryPttCode > 0, " and OhrPttCode=" & CStr(mQryPttCode), "") _
         & " group by PatMast.PttName,PatMast.PttRegNo,OutdHdr.OhrPttCode" _
         & " order by PatMast.PttName,PatMast.PttRegNo,OutdHdr.OhrPttCode" _
         , dbVgnDatabase, adOpenKeyset, adLockReadOnly
    End If
    
ElseIf optDetailed.Value = True Then
    clsListStru.AddFields mExpr:="tOrcSmryId", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="OrcCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="VtmName", mTitle:="Voucher", mAlign:=1, mWidth:=1500, mShowItem:=True
    clsListStru.AddFields mExpr:="OrcVchNo", mTitle:="Vchr.No", mAlign:=7, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="OrcDate", mTitle:="Date", mAlign:=1, mWidth:=1300, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="PttCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="PttName", mTitle:="Patient Name", mAlign:=1, mWidth:=2500, mShowItem:=True
    clsListStru.AddFields mExpr:="PttRegNo", mTitle:="Reg.No", mAlign:=7, mWidth:=1250, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="OrcAmtAftDisc", mTitle:="Charges", mAlign:=7, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="OrcBalAmt", mTitle:="Due Amt", mAlign:=7, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="OrcAdvAmt", mTitle:="Adv.Amt", mAlign:=7, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="OrcRecdAmt", mTitle:="Recd.Amt", mAlign:=7, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="OrcDepoAmt", mTitle:="Depo.Amt", mAlign:=7, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="OrcRefuAmt", mTitle:="Refu.Amt", mAlign:=7, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="OrcDiscAmt", mTitle:="Discount", mAlign:=7, mWidth:=1250, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="PttRefName", mTitle:="Care of", mAlign:=1, mWidth:=2000, mShowItem:=True
    clsListStru.AddFields mExpr:="PttAddr", mTitle:="Address", mAlign:=1, mWidth:=2000, mShowItem:=True
    clsListStru.AddFields mExpr:="PatAraName", mTitle:="Area", mAlign:=1, mWidth:=1500, mShowItem:=True
    clsListStru.AddFields mExpr:="PatStnName", mTitle:="Station", mAlign:=1, mWidth:=1500, mShowItem:=True
    clsListStru.AddFields mExpr:="PatPcgName", mTitle:="Category", mAlign:=1, mWidth:=2000, mShowItem:=True
    
    datRecset.open "Select OutdHdr.*,PatMast.*" _
     & ",format(OhrDate,'yyyymmdd')+format(OhrCode,'0000000') as tOrcSmryId" _
     & " from OutdHdr inner join PatMast on OutdHdr.OhrPttCode = PatMast.PttCode" _
     & " where OhrDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & IIf(mRemoteAccess = True, " and OhrCode=" & CStr(mOrcCode) & "", "") _
     & " and OhrCode>0" _
     & IIf(mQryPttCode > 0, " and OhrPttCode=" & CStr(mQryPttCode), "") _
     & " order by OhrDate,OhrCode" _
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
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OrcYrMonth")) = .fields("OrcYrMonth")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OrcMnYear")) = MonthName(Val(Right(.fields("OrcYrMonth"), 2))) & "-" & Left(.fields("OrcYrMonth"), 4)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OrcCount")) = ToMyNumFmt(.fields("OrcCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OrcAmtAftDisc_sum")) = ToMyNumFmt(.fields("OrcAmtAftDisc_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OrcBalAmt_sum")) = ToMyNumFmt(.fields("OrcBalAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OrcAdvAmt_sum")) = ToMyNumFmt(.fields("OrcAdvAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OrcRecdAmt_sum")) = ToMyNumFmt(.fields("OrcRecdAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OrcDepoAmt_sum")) = ToMyNumFmt(.fields("OrcDepoAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OrcRefuAmt_sum")) = ToMyNumFmt(.fields("OrcRefuAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OrcDiscAmt_sum")) = ToMyNumFmt(.fields("OrcDiscAmt_sum"))
                
            ElseIf optDatewise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OrcDateYMD")) = Format(.fields("OhrDate"), "yyyymmdd")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OrcDate")) = Dtoc(.fields("OhrDate"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OrcCount")) = ToMyNumFmt(.fields("OrcCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OrcAmtAftDisc_sum")) = ToMyNumFmt(.fields("OrcAmtAftDisc_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OrcBalAmt_sum")) = ToMyNumFmt(.fields("OrcBalAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OrcAdvAmt_sum")) = ToMyNumFmt(.fields("OrcAdvAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OrcRecdAmt_sum")) = ToMyNumFmt(.fields("OrcRecdAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OrcDepoAmt_sum")) = ToMyNumFmt(.fields("OrcDepoAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OrcRefuAmt_sum")) = ToMyNumFmt(.fields("OrcRefuAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OrcDiscAmt_sum")) = ToMyNumFmt(.fields("OrcDiscAmt_sum"))
                
            ElseIf optPatientwise.Value = True Then
                clsPAT.GetData .fields("OhrPttCode")
                
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttName")) = .fields("PttName")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttRegNo")) = ToMyNumFmt(.fields("PttRegNo"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttRefName")) = clsPAT.mPttRefName_str
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OrcCount")) = ToMyNumFmt(.fields("OrcCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OrcAmtAftDisc_sum")) = ToMyNumFmt(.fields("OrcAmtAftDisc_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OrcBalAmt_sum")) = ToMyNumFmt(.fields("OrcBalAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OrcAdvAmt_sum")) = ToMyNumFmt(.fields("OrcAdvAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OrcRecdAmt_sum")) = ToMyNumFmt(.fields("OrcRecdAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OrcDepoAmt_sum")) = ToMyNumFmt(.fields("OrcDepoAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OrcRefuAmt_sum")) = ToMyNumFmt(.fields("OrcRefuAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OrcDiscAmt_sum")) = ToMyNumFmt(.fields("OrcDiscAmt_sum"))
                
            End If
        
        ElseIf optDetailed.Value = True Then
            clsPCG.GetData .fields("PttPcgCode")
            clsARA.GetData .fields("PttAraCode")
            clsSTN.GetData .fields("PttStnCode")
            clsVTM.GetData .fields("OhrVtmCode")
            
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("tOrcSmryId")) = Format(.fields("OhrDate"), "yyyymmdd") & Format(.fields("OhrCode"), "0000000")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OrcCode")) = .fields("OhrCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("VtmName")) = clsVTM.mName_str
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OrcVchNo")) = .fields("OhrVchNo")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OrcDate")) = Dtoc(.fields("OhrDate"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OrcAmtAftDisc")) = ToMyNumFmt(.fields("OhrAmtAftDisc"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OrcBalAmt")) = ToMyNumFmt(.fields("OhrBalAmt"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OrcAdvAmt")) = ToMyNumFmt(.fields("OhrAdvAmt"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OrcRecdAmt")) = ToMyNumFmt(.fields("OhrRecdAmt"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OrcDepoAmt")) = ToMyNumFmt(.fields("OhrDepoAmt"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OrcRefuAmt")) = ToMyNumFmt(.fields("OhrRefuAmt"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OrcDiscAmt")) = ToMyNumFmt(.fields("OhrDiscAmt"))
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
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("tOrcSmryId"), mText
    ElseIf optMonthwise.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("OrcYrMonth"), mText
    ElseIf optDatewise.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("OrcDateYMD"), mText
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

Private Sub txtSdcFlag_KeyPress(KeyAscii As Integer)
If KeyAscii = vbKeyReturn And Val(fcmbSrvName.BoundText) > 0 And mOrcPttCode > 0 And mOrcOpgCode > 0 Then
    clsSRV.GetData Val(fcmbSrvName.BoundText)
    If clsSRV.mSrvMultiDctIncl_bln = True Then
        ShowSdcDtlData mOrcCode, Val(mskOrcICode.Text)
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
        fcmbDrlName.BoundText = CStr(GetValueFromTableCol(cnn:=dbVgnDatabase, mTableName:="DoctMast", mColumnName:="DctDrlCode", mFilterCond:="DctCode = " & CStr(Val(fcmbSDctName.BoundText)), mRtnDefValue:=0))
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
    If Val(fcmbSrvName.BoundText) <> mOrcSrvCode_old Or dtlAddMode = True Then
        'clsSRV.GetData Val(fcmbSrvName.BoundText)
        'mskOrcRate.Text = ToMyNumFmt(clsSRV.mSrvRate_dbl)
        'If Val(UnMyPerFmt(mskOrcPttDiscPer.Text)) = 0 Then
        '    mskOrcDiscPer.Text = ToMyPerFmt(clsSRV.mSrvDiscPer_dbl)
        'End If
        Call ChkServRate
        Call CalcOrcChg
        Call ChkOrcICode
    End If
End If
Call ValidDtl

End Sub

Private Sub ChkOrcICode()
If mOrcCode <> 0 And mOrcPttCode <> 0 And mOrcOpgCode <> 0 Then
    If dtlAddMode = True And Val(fcmbSrvName.BoundText) > 0 And Val(fcmbSrvName.BoundText) <> mOrcSrvCode_old Then          ''' And Val(mskOrcICode.Text) = 0
        Rem mskOrcICode.Text = clsORC.GetDtlTranUnqCode()
        
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

Private Sub txtOpgVtmName_GotFocus()
FlashActiveControl txtOpgVtmName, True
End Sub

Private Sub txtOpgVtmName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call ShowOldOpgListByOpgNo
ElseIf MyAddNewKey(Shift, KeyCode) = True Then

ElseIf Shift = 0 And KeyCode = vbKeyF6 Then
    
End If

End Sub

Private Sub txtOpgVtmName_LostFocus()
FlashActiveControl txtOpgVtmName, False
End Sub

Private Sub ChkServRate()
Dim mOrcRate As Double, mOrcDiscPer As Double, mOrcInfByPer As Double, mOrcDefByPer As Double

clsOPG.GetData Val(UnMyNumFmt(mskOrcOpgCode.Text))
clsPAT.GetData clsOPG.mOpgPttCode_lng
If Val(fcmbSrvName.BoundText) <> mOrcSrvCode_old Or mOpgCDctCode_old <> clsOPG.mOpgCDctCode_lng Or mPttPcgCode_old <> clsPAT.mPttPcgCode_lng Or mOpgRByCode_old <> clsOPG.mOpgRByCode_lng Or mOpgRToCode_old <> clsOPG.mOpgRToCode_lng Or mOrcDate_old <> Ctod(dtpOrcDate.Text) Or mOrcTime_old <> TimeToMin(txtOrcTime_str) Or FormAddEditMode = cFORM_ADDMODE Then
    GetServRateValues cnn:=dbVgnDatabase, mSrvCode:=Val(fcmbSrvName.BoundText), mTranDate:=Ctod(dtpOrcDate.Text), mTranTime:=TimeToMin(txtOrcTime_str.Text), mSrmPttCode:=mOrcPttCode, mSrmDctCode:=clsOPG.mOpgCDctCode_lng, mSrmPcgCode:=clsPAT.mPttPcgCode_lng, mSrmRByCode:=clsOPG.mOpgRByCode_lng, mSrmRToCode:=0, mSrmRate:=mOrcRate, mSrmDiscPer:=mOrcDiscPer, mSrmInfByPer:=mOrcInfByPer, mSrmDefByPer:=mOrcDefByPer
'    If mOrcDiscPer = 0 And clsPAT.mPttDiscAllowed_bln = True Then
'        mOrcDiscPer = clsPAT.mPttDiscPer_dbl
'    End If
    If mOrcDiscPer = 0 And Val(UnMyPerFmt(mskOrcPttDiscPer.Text)) <> 0 Then
        mOrcDiscPer = Val(UnMyPerFmt(mskOrcPttDiscPer.Text))
    End If
    If mOrcInfByPer <> 0 Then
         mOrcRate = mOrcRate + (mOrcRate * mOrcInfByPer / 100)
    ElseIf mOrcDefByPer <> 0 Then
        mOrcRate = mOrcRate - (mOrcRate * mOrcDefByPer / 100)
    End If
    mskOrcRate.Text = ToMyNumFmt(mOrcRate)
    mskOrcDiscPer.Text = ToMyPerFmt(mOrcDiscPer)
End If

End Sub

Private Sub CalcOrcChg()
Dim mOrcUnit As Long, mOrcRate As Double, mOrcAmtBefDisc As Double, mOrcDiscPer As Double, mOrcDiscAmt As Double, mOrcAmtAftDisc As Double
mOrcUnit = Val(UnMyNumFmt(mskOrcUnit.Text))
mOrcRate = Val(UnMyNumFmt(mskOrcRate.Text))
mOrcAmtBefDisc = mOrcUnit * mOrcRate
mOrcDiscPer = Val(UnMyPerFmt(mskOrcDiscPer.Text))
mOrcDiscAmt = Val(UnMyNumFmt(mskOrcDiscAmt.Text))
If mskOrcDiscPer.Tag = True Then
    mOrcDiscAmt = Round(mOrcAmtBefDisc * mOrcDiscPer / 100, 2)
ElseIf mskOrcDiscAmt.Tag = True Then
    If mOrcDiscAmt <> 0 And mOrcAmtBefDisc <> 0 Then
        mOrcDiscPer = Round(mOrcDiscAmt * 100 / mOrcAmtBefDisc, 2)
    Else
        mOrcDiscPer = 0
    End If
ElseIf dtlAddMode = True Then
    mOrcDiscAmt = Round(mOrcAmtBefDisc * mOrcDiscPer / 100, 2)
End If
mOrcAmtAftDisc = mOrcAmtBefDisc - mOrcDiscAmt
' --------
mskOrcAmtBefDisc.Text = ToMyNumFmt(mOrcAmtBefDisc)
mskOrcDiscPer.Text = ToMyPerFmt(mOrcDiscPer)
mskOrcDiscAmt.Text = ToMyNumFmt(mOrcDiscAmt)
mskOrcAmtAftDisc.Text = ToMyNumFmt(mOrcAmtAftDisc)

End Sub

Private Sub ShowOldOrcCodeDesc(ByVal mOldOrcCode As Long)
Dim tRecset As New ADODB.Recordset

With tRecset
.open "Select * from OutdHdr where OhrCode=" & CStr(mOldOrcCode) & "", dbVgnDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    clsVTM.GetData .fields("OhrVtmCode")
    lblOldOrcCodeDesc.Caption = RTrim(clsVTM.mName_str) & " No.:" & CStr(.fields("OhrVchNo")) & " Dated:" & Dtoc(.fields("OhrDate"))
Else
    lblOldOrcCodeDesc.Caption = "#" & CStr(mOldOrcCode) & "#"
End If
End With
CloseTable tRecset

End Sub

Private Function GetOldOrcCodeFromPttCode(ByVal mPttCode As Long) As Long
Dim tRecset As New ADODB.Recordset

With tRecset
.open "Select top 1 * from OutdHdr where OhrPttCode=" & CStr(mPttCode) & " order by OhrDate desc,OhrVchNo desc,OhrCode desc", dbVgnDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    GetOldOrcCodeFromPttCode = .fields("OhrCode")
Else
    GetOldOrcCodeFromPttCode = 0
End If
End With
CloseTable tRecset

End Function

Private Function GetOldOpgCodeFromPttCode(ByVal mPttCode As Long) As Long
Dim tRecset As New ADODB.Recordset

With tRecset
.open "Select top 1 * from OutdReg where OpgPttCode=" & CStr(mPttCode) & " order by OpgDate desc,OpgVchNo desc,OpgCode desc", dbVgnDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    GetOldOpgCodeFromPttCode = .fields("OpgCode")
Else
    GetOldOpgCodeFromPttCode = 0
End If
End With
CloseTable tRecset

End Function

Private Sub ShowPttDiscPer(ByVal mPttCode As Long)
Dim tRecset As New ADODB.Recordset

With tRecset
.open "Select * from PatMast where PttCode=" & CStr(mPttCode) & "", dbVgnDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    If .fields("PttDiscAllowed") = True And .fields("PttDiscPer") > 0 Then
        'mskOrcPttDiscPer.Text = ToMyPerFmt(.fields("PttDiscPer"))
        'Call CalcOrcChg
    End If
End If
End With
CloseTable tRecset

End Sub

Private Sub ShowOldOpgListByOpgNo()
Dim tRecset As New ADODB.Recordset, mOldOpgCode As Long, mOldOpgPttCode As Long

If fcmbOldOpgByOpgNo.CallFromText_Change = False Then
    fcmbOldOpgByOpgNo.CallFromText_Change = True
    If InterActiveChange(txtOpgVtmName) = True Then
        fcmbOldOpgByOpgNo.UserText = Array("", 0)
        fcmbOldOpgByOpgNo.Show
        If FormAddEditMode = cFORM_ADDMODE And fcmbOldOpgByOpgNo.ListSelected = True And Val(fcmbOldOpgByOpgNo.BoundText) > 0 Then
            mOldOpgCode = Val(fcmbOldOpgByOpgNo.BoundText)
            tRecset.open "Select * from OutdReg where OpgCode=" & CStr(mOldOpgCode) & "", dbVgnDatabase, adOpenKeyset, adLockOptimistic
            If tRecset.RecordCount > 0 Then
                mOldOpgPttCode = tRecset.fields("OpgPttCode")
            End If
            CloseTable tRecset
            If mOldOpgCode > 0 And mOldOpgPttCode > 0 Then
                mOrcPttCode = mOldOpgPttCode
                ShowPatData mOrcPttCode
                Call StorePatOldData
                ShowPttDiscPer mOrcPttCode
                
                mOrcOpgCode = mOldOpgCode
                ShowOpgData mOrcOpgCode
                Call StoreOpgOldData
                
                mOrcOldOrcCode = GetOldOrcCodeFromPttCode(mOrcPttCode)
                ShowOldOrcCodeDesc mOrcOldOrcCode
            End If
        Else
            If FormAddEditMode = cFORM_EDITMODE And fcmbOldOpgByOpgNo.ListSelected = True And Val(fcmbOldOpgByOpgNo.BoundText) > 0 Then
                AlertBox "Prohibited in Edit Mode !!!"
            End If
        End If
    End If
    fcmbOldOpgByOpgNo.CallFromText_Change = False
End If
CloseTable tRecset, mCheckOpen:=True

End Sub

Private Sub ShowOldOpgListByPttRegNo()
Dim tRecset As New ADODB.Recordset, mOldOpgCode As Long, mOldOpgPttCode As Long

If fcmbOldOpgByPttRegNo.CallFromText_Change = False Then
    fcmbOldOpgByPttRegNo.CallFromText_Change = True
    If InterActiveChange(mskPttRegNo) = True Then
        fcmbOldOpgByPttRegNo.UserText = Array("", 0)
        fcmbOldOpgByPttRegNo.Show
        If FormAddEditMode = cFORM_ADDMODE And fcmbOldOpgByPttRegNo.ListSelected = True And Val(fcmbOldOpgByPttRegNo.BoundText) > 0 Then
            mOldOpgCode = Val(fcmbOldOpgByPttRegNo.LFieldValue("OpgCode"))
            tRecset.open "Select * from OutdReg where OpgCode=" & CStr(mOldOpgCode) & "", dbVgnDatabase, adOpenKeyset, adLockOptimistic
            If tRecset.RecordCount > 0 Then
                mOldOpgPttCode = tRecset.fields("OpgPttCode")
            End If
            CloseTable tRecset
            If mOldOpgCode > 0 And mOldOpgPttCode > 0 Then
                mOrcPttCode = mOldOpgPttCode
                ShowPatData mOrcPttCode
                Call StorePatOldData
                ShowPttDiscPer mOrcPttCode
                
                mOrcOpgCode = mOldOpgCode
                ShowOpgData mOrcOpgCode
                Call StoreOpgOldData
                
                mOrcOldOrcCode = GetOldOrcCodeFromPttCode(mOrcPttCode)
                ShowOldOrcCodeDesc mOrcOldOrcCode
            End If
        Else
            If FormAddEditMode = cFORM_EDITMODE And fcmbOldOpgByPttRegNo.ListSelected = True And Val(fcmbOldOpgByPttRegNo.BoundText) > 0 Then
                AlertBox "Prohibited in Edit Mode !!!"
            End If
        End If
    End If
    fcmbOldOpgByPttRegNo.CallFromText_Change = False
End If
CloseTable tRecset, mCheckOpen:=True

End Sub

Private Sub ShowOldOpgListByPttName()
Dim tRecset As New ADODB.Recordset, mOldOpgCode As Long, mOldOpgPttCode As Long

If fcmbOldOpgByPttName.CallFromText_Change = False Then
    fcmbOldOpgByPttName.CallFromText_Change = True
    If InterActiveChange(txtPttName) = True Then
        fcmbOldOpgByPttName.UserText = Array("", 0)
        fcmbOldOpgByPttName.Show
        If FormAddEditMode = cFORM_ADDMODE And fcmbOldOpgByPttName.ListSelected = True And Val(fcmbOldOpgByPttName.BoundText) > 0 Then
            mOldOpgCode = Val(fcmbOldOpgByPttName.LFieldValue("OpgCode"))
            tRecset.open "Select * from OutdReg where OpgCode=" & CStr(mOldOpgCode) & "", dbVgnDatabase, adOpenKeyset, adLockOptimistic
            If tRecset.RecordCount > 0 Then
                mOldOpgPttCode = tRecset.fields("OpgPttCode")
            End If
            CloseTable tRecset
            If mOldOpgCode > 0 And mOldOpgPttCode > 0 Then
                mOrcPttCode = mOldOpgPttCode
                ShowPatData mOrcPttCode
                Call StorePatOldData
                ShowPttDiscPer mOrcPttCode
                
                mOrcOpgCode = mOldOpgCode
                ShowOpgData mOrcOpgCode
                Call StoreOpgOldData
                
                mOrcOldOrcCode = GetOldOrcCodeFromPttCode(mOrcPttCode)
                ShowOldOrcCodeDesc mOrcOldOrcCode
            End If
        Else
            If FormAddEditMode = cFORM_EDITMODE And fcmbOldOpgByPttName.ListSelected = True And Val(fcmbOldOpgByPttName.BoundText) > 0 Then
                AlertBox "Prohibited in Edit Mode !!!"
            End If
        End If
    End If
    fcmbOldOpgByPttName.CallFromText_Change = False
End If
CloseTable tRecset, mCheckOpen:=True

End Sub

Private Sub VisibleControls(ByVal mShowItem As Boolean, Optional ByVal mRowPos)
Rem Important - dtlAddEditMode & dtlAddMode must be initialised prior to this
If Me.Visible = True Then
    txtVoid.SetFocus
End If
If IsMissing(mRowPos) = False Then
    Rem mskOrcICode.Top = mRowPos
    mskOrcSno.Top = mRowPos
    txtSrvName.Top = mRowPos
    txtSdcFlag.Top = mRowPos
    mskOrcUnit.Top = mRowPos
    mskOrcRate.Top = mRowPos
    mskOrcAmtBefDisc.Top = mRowPos
    mskOrcDiscPer.Top = mRowPos
    mskOrcDiscAmt.Top = mRowPos
    mskOrcAmtAftDisc.Top = mRowPos
    cmdOK.Top = mRowPos
End If

mskOrcICode.Text = 0
mskOrcSno.Text = 0
txtSrvName.Text = "": fcmbSrvName.BoundText = ""
txtSdcFlag.Text = ""
mskOrcUnit.Text = ToMyNumFmt(0, mDecimals:=0)
mskOrcRate.Text = ToMyNumFmt(0)
mskOrcAmtBefDisc.Text = ToMyNumFmt(0)
mskOrcDiscPer.Text = ToMyPerFmt(0)
mskOrcDiscAmt.Text = ToMyNumFmt(0)
mskOrcAmtAftDisc.Text = ToMyNumFmt(0)

Call ValidDtl

mskOrcICode.Visible = False     '''  mShowItem
mskOrcSno.Visible = mShowItem
txtSrvName.Visible = mShowItem
txtSdcFlag.Visible = mShowItem
mskOrcUnit.Visible = mShowItem
mskOrcRate.Visible = mShowItem
mskOrcAmtBefDisc.Visible = mShowItem
mskOrcDiscPer.Visible = mShowItem
mskOrcDiscAmt.Visible = mShowItem
mskOrcAmtAftDisc.Visible = mShowItem
cmdOK.Visible = mShowItem

frHeader.Enabled = (mShowItem = False)
Mfgrd2.Enabled = (mShowItem = False)
frFooter.Enabled = (mShowItem = False)
cmdSaveForm.Enabled = (mShowItem = False)

End Sub

Private Sub ValidDtl()
Dim mDataOk As Boolean, srow As Integer
srow = Mfgrd2.Row
mDataOk = (mOrcPttCode > 0 And mOrcOpgCode > 0 And frSdcDtl.Visible = False And Val(UnMyNumFmt(mskOrcSno.Text)) > 0 And Val(fcmbSrvName.BoundText) > 0 And Val(UnMyNumFmt(mskOrcUnit.Text)) > 0 And Val(UnMyNumFmt(mskOrcRate.Text)) > 0 And Val(UnMyNumFmt(mskOrcAmtBefDisc.Text)) > 0 And Val(UnMyNumFmt(mskOrcAmtAftDisc.Text)) >= 0)
If dtlAddEditMode = True And dtlAddMode = False And mDataOk = True And InterActiveChange(cmdOK) = True Then
    clsSRV.GetData Val(fcmbSrvName.BoundText)
    If clsSRV.mSrvMultiDctIncl_bln = False Then
        If GetServDctDtlCount(cnn:=dbVgnDatabase, mTableName:="OutdRcDctDtl", mSdcCodeField:="OrdCode", mSdcCode:=mOrcCode, mSdcSubCodeField:="OrdOrcCode", mSdcSubCode:=Val(mskOrcICode.Text)) > 0 Then
            ErrorBox "Service Doctor Detail Exist !!!"
            mDataOk = False
        End If
    End If
End If

cmdOK.Caption = IIf(mDataOk = True, "&OK", "&Cancel")
cmdOK.BackColor = IIf(mDataOk = True, &H80FF80, &H8080FF)
End Sub

Private Sub CalcFtrTotal(Optional ByVal mCalcBalOnly As Boolean = False)
Dim mOrcUnitTot As Double, mOrcAmtBefDiscTot As Double, mOrcDiscAmtTot As Double, mOrcAmtAftDiscTot As Double, mOrcAdvAmtTot As Double, mOrcRecdAmtTot As Double, mOrcDepoAmtTot As Double, mOrcRefuAmtTot As Double, mOrcBalAmtTot As Double

If mCalcBalOnly = False Then
    mOrcUnitTot = FlexColSum(Mfgrd2, X2ORCUNIT_COL)
    mOrcAmtBefDiscTot = FlexColSum(Mfgrd2, X2ORCAMTBEFDISC_COL)
    mOrcDiscAmtTot = FlexColSum(Mfgrd2, X2ORCDISCAMT_COL)
    mOrcAmtAftDiscTot = FlexColSum(Mfgrd2, X2ORCAMTAFTDISC_COL)
Else
    mOrcUnitTot = Val(UnMyNumFmt(lblOrcUnitTot.Caption))
    mOrcAmtBefDiscTot = Val(UnMyNumFmt(lblOrcAmtBefDiscTot.Caption))
    mOrcDiscAmtTot = Val(UnMyNumFmt(lblOrcDiscAmtTot.Caption))
    mOrcAmtAftDiscTot = Val(UnMyNumFmt(lblOrcAmtAftDiscTot.Caption))
End If

mOrcAdvAmtTot = Val(UnMyNumFmt(mskOrcAdvAmtTot.Text))
mOrcRecdAmtTot = Val(UnMyNumFmt(mskOrcRecdAmtTot.Text))
mOrcDepoAmtTot = Val(UnMyNumFmt(mskOrcDepoAmtTot.Text))
mOrcRefuAmtTot = Val(UnMyNumFmt(mskOrcRefuAmtTot.Text))
If mCalcBalOnly = False Then
    If mOrcRecdAmtTot > (mOrcAmtAftDiscTot - mOrcAdvAmtTot - mOrcDepoAmtTot) Then
        mOrcRecdAmtTot = (mOrcAmtAftDiscTot - mOrcAdvAmtTot - mOrcDepoAmtTot)
    ElseIf FormAddEditMode = cFORM_ADDMODE Then
        mOrcRecdAmtTot = (mOrcAmtAftDiscTot - mOrcAdvAmtTot - mOrcDepoAmtTot)
    End If
    mskOrcRecdAmtTot.Text = ToMyNumFmt(mOrcRecdAmtTot)
End If
mOrcBalAmtTot = (mOrcAmtAftDiscTot - (mOrcAdvAmtTot + mOrcRecdAmtTot + mOrcDepoAmtTot))

If mCalcBalOnly = False Then
    lblOrcUnitTot.Caption = ToMyNumFmt(mOrcUnitTot, mDecimals:=0)
    lblOrcAmtBefDiscTot.Caption = ToMyNumFmt(mOrcAmtBefDiscTot)
    lblOrcDiscAmtTot.Caption = ToMyNumFmt(mOrcDiscAmtTot)
    lblOrcAmtAftDiscTot.Caption = ToMyNumFmt(mOrcAmtAftDiscTot)
End If
mskOrcBalAmtTot.Text = ToMyNumFmt(mOrcBalAmtTot)

End Sub

'''Private Sub DisperseRecdAmt(ByVal mOrcCode As Long)
'''Dim tRecset As New ADODB.Recordset, mRecdAmtBal As Double, mReqdRecdAmt As Double
'''
'''mRecdAmtBal = Val(UnMyNumFmt(mskOrcRecdAmtTot.Text))
'''
'''With tRecset
'''.Open "Select * from OutdRcpt where OrcCode=" & CStr(mOrcCode) & " order by OrcSno", dbVgnDatabase, adOpenKeyset, adLockOptimistic
'''If .RecordCount > 0 Then
'''    dbVgnDatabase.BeginTrans
'''    Do While .EOF = False
'''        If InList(.Fields("OrcRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
'''            'mReqdRecdAmt = .Fields("OrcAmtAftDisc") - .Fields("OrcAdvAmt") - .Fields("OrcDepoAmt") - .Fields("OrcRefuAmt")
'''            mReqdRecdAmt = .Fields("OrcAmtAftDisc") - (.Fields("OrcAdvAmt") + .Fields("OrcDepoAmt"))
'''            If mRecdAmtBal > 0 Then
'''                If Not mRecdAmtBal >= mReqdRecdAmt Then
'''                    mReqdRecdAmt = mRecdAmtBal
'''                End If
'''                .Fields("OrcRecdAmt") = mReqdRecdAmt
'''                .Fields("OrcBalAmt") = .Fields("OrcAmtAftDisc") - (.Fields("OrcAdvAmt") + .Fields("OrcDepoAmt")) + .Fields("OrcRefuAmt") - mReqdRecdAmt
'''                .Update
'''
'''                mRecdAmtBal = mRecdAmtBal - mReqdRecdAmt
'''            Else
'''                .Fields("OrcRecdAmt") = 0
'''                .Fields("OrcBalAmt") = .Fields("OrcAmtAftDisc") - (.Fields("OrcAdvAmt") + .Fields("OrcDepoAmt")) + .Fields("OrcRefuAmt")
'''                .Update
'''            End If
'''        Else
'''            If InList(.Fields("OrcRecState"), Array(cREC_CANCELED, cREC_DELETED)) = False Then
'''                ErrorBox Me.Name & "_DisperseRecdAmt_#2316_[Invalid Record Status]"
'''            End If
'''        End If
'''        .MoveNext
'''    Loop
'''    dbVgnDatabase.CommitTrans
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
.open "Select OutdPymtDtl.*,OutdPymtHdr.OphVtmCode,OutdPymtHdr.OphVchNo from OutdPymtDtl inner join OutdPymtHdr on OutdPymtDtl.OpyCode=OutdPymtHdr.OphCode where OpyOhrCode=" & CStr(mOrcCode) & " order by OpyDate", dbVgnDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Do While .EOF = False
        clsVTM.GetData .fields("OphVtmCode")
        mLinkTranStr = mLinkTranStr & clsVTM.mName_str & " No." & CStr(.fields("OphVchNo")) & " Dated " & Dtoc(.fields("OpyDate")) & " Rs." & ToMyNumFmt(.fields("OpyDepoAmt")) & vbCrLf
        
        .MoveNext
    Loop
End If
End With
CloseTable tRecset

With tRecset
.open "Select OutdRefdDtl.*,OutdRefdHdr.OfhVtmCode,OutdRefdHdr.OfhVchNo from OutdRefdDtl inner join OutdRefdHdr on OutdRefdDtl.OfdCode=OutdRefdHdr.OfhCode where OfdOhrCode=" & CStr(mOrcCode) & " order by OfdDate", dbVgnDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Do While .EOF = False
        clsVTM.GetData .fields("OfhVtmCode")
        mLinkTranStr = mLinkTranStr & clsVTM.mName_str & " No." & CStr(.fields("OfhVchNo")) & " Dated " & Dtoc(.fields("OfdDate")) & " Rs." & ToMyNumFmt(.fields("OfdRefuAmt")) & vbCrLf
        
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
Dim srow As Integer, mOrdICode As Long, mOrdOrcCode As Long, mDeleteit As Boolean
srow = Mfgrd3.Row
mOrdICode = Val(Mfgrd3.TextMatrix(srow, X3ORDICODE_COL))
mOrdOrcCode = Val(Mfgrd2.TextMatrix(Mfgrd2.Row, X2ORCICODE_COL))

If MyDeleteKey(Shift, KeyCode, mCheckCtrlMask:=False) = True And mOrdICode > 0 Then
    mDeleteit = True
    If mDeleteit = True Then
        mDeleteit = CanDelete()
    End If
    If mDeleteit = True Then
        clsORC.DeleteSdc mOrcCode, mOrdOrcCode, mOrdICode
        
        ShowSdcDtlData mOrcCode, mOrdOrcCode
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
        mskOrdSno.Text = ToMyNumFmt(FlexNextSeqno(Mfgrd3, X3ORDSNO_COL), mDecimals:=0)
    Else
        mskOrdSno.Text = Mfgrd3.TextMatrix(srow, X3ORDSNO_COL)
        fcmbSDctName.BoundText = Mfgrd3.TextMatrix(srow, X3ORDDCTCODE_COL): txtSDctName.Text = fcmbSDctName.Text
        fcmbDrlName.BoundText = Mfgrd3.TextMatrix(srow, X3ORDDRLCODE_COL): txtDrlName.Text = fcmbDrlName.Text
        txtOrdRemark.Text = Mfgrd3.TextMatrix(srow, X3ORDREMARK_COL)
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
    mskOrdSno.Top = mRowPos
    txtSDctName.Top = mRowPos
    txtDrlName.Top = mRowPos
    txtOrdRemark.Top = mRowPos
    cmdSdcOK.Top = mRowPos
End If

mskOrdSno.Text = 0
txtSDctName.Text = "": fcmbSDctName.BoundText = ""
txtDrlName.Text = "": fcmbDrlName.BoundText = ""
txtOrdRemark.Text = ""

Call ValidSdcDtl

mskOrdSno.Visible = mShowItem
txtSDctName.Visible = mShowItem
txtDrlName.Visible = mShowItem
txtOrdRemark.Visible = mShowItem
cmdSdcOK.Visible = mShowItem

Mfgrd3.Enabled = (mShowItem = False)

End Sub

Private Sub ValidSdcDtl()
Dim mDataOk As Boolean, srow As Integer
srow = Mfgrd3.Row
mDataOk = (Val(fcmbSrvName.BoundText) > 0 And mOrcPttCode > 0 And mOrcOpgCode > 0 And Val(UnMyNumFmt(mskOrdSno.Text)) > 0 And Val(fcmbSDctName.BoundText) > 0 And Val(fcmbDrlName.BoundText) > 0)
cmdSdcOK.Caption = IIf(mDataOk = True, "&OK", "&Cancel")
cmdSdcOK.BackColor = IIf(mDataOk = True, &H80FF80, &H8080FF)
End Sub

Private Sub ShowSdcDtlData(ByVal mOrdCode As Long, ByVal mOrdOrcCode As Long)
Dim srow As Integer, tRecset As New ADODB.Recordset, mColCnt As Integer

srow = 1
Mfgrd3.Rows = 2

With tRecset
.open "Select * from OutdRcDctDtl where OrdCode=" & CStr(mOrdCode) & " and OrdOrcCode=" & CStr(mOrdOrcCode) & " order by OrdSno", dbVgnDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Do While .EOF = False
        If InList(.fields("OrdRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
            clsDCT.GetData .fields("OrdDctCode")
            clsDRL.GetData .fields("OrdDrlCode")
            
            Mfgrd3.TextMatrix(srow, X3ORDICODE_COL) = .fields("OrdICode")
            Mfgrd3.TextMatrix(srow, X3ORDSNO_COL) = ToMyNumFmt(.fields("OrdSno"), mDecimals:=0)
            Mfgrd3.TextMatrix(srow, X3DCTNAME_COL) = clsDCT.mName_str
            Mfgrd3.TextMatrix(srow, X3DRLNAME_COL) = clsDRL.mName_str
            Mfgrd3.TextMatrix(srow, X3ORDREMARK_COL) = .fields("OrdRemark")
            Mfgrd3.TextMatrix(srow, X3ORDDCTCODE_COL) = .fields("OrdDctCode")
            Mfgrd3.TextMatrix(srow, X3ORDDRLCODE_COL) = .fields("OrdDrlCode")
            Mfgrd3.TextMatrix(srow, X3ORDRECSTATE_COL) = .fields("OrdRecState")
            
            Mfgrd3.Rows = Mfgrd3.Rows + 1
            srow = srow + 1
        Else
            If InList(.fields("OrdRecState"), Array(cREC_CANCELED, cREC_DELETED)) = False Then
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
Dim mOrcVchNo As Long

If Val(fcmbOrcVtmName.BoundText) < 1 Then
    ErrorBox "Invalid Voucher Type !!!"
    txtOrcVtmName(1).SetFocus
    Exit Sub
End If
If Val(UnMyNumFmt(mskOrcVchNo(1).Text)) < 1 Then
    ErrorBox "Invalid Voucher No. !!!"
    mskOrcVchNo(1).SetFocus
    Exit Sub
Else
    mOrcVchNo = Val(UnMyNumFmt(mskOrcVchNo(1).Text))
    If ChkIsExistVTypeNo(dbVgnDatabase, mTableName:="OutdHdr", mChkFieldName:="OhrVchNo", mChkFieldValue:=CStr(mOrcVchNo), mVtmFieldName:="OhrVtmCode", mVtmFieldValue:=Val(fcmbOrcVtmName.BoundText), mFinYrFieldName:="OhrCmpCode", mFinYrFieldValue:=sFinYrCmpCode) = False Then
        ErrorBox "Voucher No. does not Exist !!!"
        mskOrcVchNo(1).SetFocus
        Exit Sub
    End If
End If
If Val(UnMyNumFmt(mskOrcVchNo(2).Text)) < 1 Then
    ErrorBox "Invalid Voucher No. !!!"
    mskOrcVchNo(2).SetFocus
    Exit Sub
Else
    mOrcVchNo = Val(UnMyNumFmt(mskOrcVchNo(2).Text))
    If ChkIsExistVTypeNo(dbVgnDatabase, mTableName:="OutdHdr", mChkFieldName:="OhrVchNo", mChkFieldValue:=CStr(mOrcVchNo), mVtmFieldName:="OhrVtmCode", mVtmFieldValue:=Val(fcmbOrcVtmName.BoundText), mFinYrFieldName:="OhrCmpCode", mFinYrFieldValue:=sFinYrCmpCode) = False Then
        ErrorBox "Voucher No. does not Exist !!!"
        mskOrcVchNo(2).SetFocus
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
Dim mFromOrcVchNo As Long, mToOrcVchNo As Long, mOrcVtmCode As Long
Dim fCRView As Form

mFromOrcVchNo = Val(UnMyNumFmt(mskOrcVchNo(1).Text))
mToOrcVchNo = Val(UnMyNumFmt(mskOrcVchNo(2).Text))
mOrcVtmCode = Val(fcmbOrcVtmName.BoundText)

frmMain.Cryst.Reset
frmMain.Cryst.ReportFileName = Trim(Right(cmbCRList.List(cmbCRList.ListIndex), 100))
frmMain.Cryst.DiscardSavedData = True
frmMain.Cryst.DataFiles(0) = dbComDatabaseFullPath

frmMain.Cryst.SelectionFormula = "{vewOutdRcpt.OhrVchNo}>=" & CStr(mFromOrcVchNo) & " and {vewOutdRcpt.OhrVchNo}<=" & CStr(mToOrcVchNo) & " and {vewOutdRcpt.OhrVtmCode}=" & CStr(mOrcVtmCode) & " and {vewOutdRcpt.OhrCmpCode}=" & CStr(sFinYrCmpCode)
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
        fcmbOrcVtmName.BoundText = CStr(datRecset.fields("OhrVtmCode"))
        txtOrcVtmName(1).Text = fcmbOrcVtmName.Text
        mskOrcVchNo(1).Text = datRecset.fields("OhrVchNo")
        mskOrcVchNo(2).Text = datRecset.fields("OhrVchNo")
        ' ----------------
        Call AssignPrintPara
        frPrintCRList.ZOrder
        frPrintCRList.Visible = True
        Mfgrd1.Enabled = False
        cmbPrintDest.SetFocus
    End If
    
ElseIf mCallSource = "SaveEvent" Then
    txtOrcVtmName(1).Text = fcmbOrcVtmName.Text
    mskOrcVchNo(1).Text = CStr(Val(UnMyNumFmt(mskOrcVchNo(0).Text)))
    mskOrcVchNo(2).Text = CStr(Val(UnMyNumFmt(mskOrcVchNo(0).Text)))
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

If Dir(OutdRcptCRLFileFullPath) = "" Then
    fhand = FreeFile
    Open OutdRcptCRLFileFullPath For Output As #fhand
    Write #fhand, "Outdoor Receipt", "OutdRcpt.Rpt", True
    Close #fhand
End If

cmbCRList.Clear
fhand = FreeFile
Open OutdRcptCRLFileFullPath For Input As #fhand
Do While EOF(fhand) = False
    Input #fhand, mCRLTitle, mCRLFileName, mCRLDefault
    If Dir(OutdRcptCRLFileFullPath(mFileName:=mCRLFileName)) <> "" Then
        cmbCRList.AddItem mCRLTitle & Space(100) & OutdRcptCRLFileFullPath(mFileName:=mCRLFileName)
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

