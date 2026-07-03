VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "Mscomctl.ocx"
Begin VB.Form frmIndoorReceipt 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   ClientHeight    =   10860
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
   ScaleHeight     =   10860
   ScaleWidth      =   14460
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
      ItemData        =   "IpdRcpt.frx":0000
      Left            =   0
      List            =   "IpdRcpt.frx":000D
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
      Width           =   13815
      Begin VB.Frame frSdcDtl 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         ForeColor       =   &H80000008&
         Height          =   2415
         Left            =   120
         TabIndex        =   139
         Top             =   7320
         Width           =   10575
         Begin VB.TextBox mskIrdSno 
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
         Begin VB.TextBox txtIrdRemark 
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
         Left            =   4440
         TabIndex        =   40
         Tag             =   "AhCode"
         Text            =   "Y"
         Top             =   6000
         Width           =   375
      End
      Begin VB.TextBox mskIrcICode 
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
         TabIndex        =   37
         Tag             =   "AhCode"
         Text            =   "0"
         Top             =   6480
         Visible         =   0   'False
         Width           =   1335
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
         Left            =   12720
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
         Width           =   13335
         Begin VB.TextBox mskIrcRefuAmtTot 
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
            Left            =   11160
            Locked          =   -1  'True
            TabIndex        =   57
            TabStop         =   0   'False
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   1560
            Width           =   1575
         End
         Begin VB.TextBox mskIrcAdvAmtTot 
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
            Left            =   11160
            Locked          =   -1  'True
            TabIndex        =   54
            TabStop         =   0   'False
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   480
            Width           =   1575
         End
         Begin VB.TextBox mskIrcBalAmtTot 
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
            Left            =   11160
            Locked          =   -1  'True
            TabIndex        =   58
            TabStop         =   0   'False
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   1920
            Width           =   1575
         End
         Begin VB.TextBox mskIrcDepoAmtTot 
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
            Left            =   11160
            Locked          =   -1  'True
            TabIndex        =   56
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   1200
            Width           =   1575
         End
         Begin VB.TextBox mskIrcRecdAmtTot 
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
            Left            =   11160
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
            Left            =   9240
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
            Left            =   9240
            TabIndex        =   137
            Top             =   480
            Width           =   1935
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Last IPD Receipt:"
            BeginProperty Font 
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
         Begin VB.Label lblOldIrcCodeDesc 
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
            Width           =   6375
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
            Width           =   8295
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
            Left            =   9240
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
            Left            =   9240
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
            Left            =   9240
            TabIndex        =   129
            Top             =   840
            Width           =   1935
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
            Left            =   11040
            TabIndex        =   128
            Top             =   120
            Width           =   1575
         End
         Begin VB.Label lblIrcDiscAmtTot 
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
            TabIndex        =   127
            Top             =   120
            Width           =   1335
         End
         Begin VB.Label lblIrcAmtBefDiscTot 
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
            Width           =   1575
         End
         Begin VB.Label lblIrcUnitTot 
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
            Left            =   4680
            TabIndex        =   125
            Top             =   120
            Width           =   975
         End
      End
      Begin VB.TextBox mskIrcSno 
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
         TabIndex        =   96
         Top             =   240
         Width           =   13335
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
         Begin VB.TextBox mskIrcIpgCode 
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
         Begin VB.TextBox mskIrcPttDiscPer 
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
         Begin VB.TextBox txtIrcTime_str 
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
            Left            =   8760
            MaxLength       =   50
            TabIndex        =   32
            Text            =   "dd/mm/yyyy"
            Top             =   4200
            Width           =   1455
         End
         Begin VB.TextBox mskIrcVchNo 
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
            BeginProperty Font 
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
         Begin VB.TextBox txtIrcPrefix 
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
            Tag             =   "AhCode"
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
            Left            =   8760
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
         Begin VB.TextBox mskIrcPttCode 
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
         Begin VB.TextBox txtIhrRemark 
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
            X2              =   13320
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
            TabIndex        =   105
            Top             =   3000
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
            Width           =   13335
         End
         Begin VB.Shape Shape1 
            BackColor       =   &H00FFFFC0&
            BackStyle       =   1  'Opaque
            Height          =   1215
            Index           =   1
            Left            =   0
            Top             =   2880
            Width           =   13335
         End
         Begin VB.Shape Shape1 
            BackColor       =   &H00FFFF80&
            BackStyle       =   1  'Opaque
            Height          =   855
            Index           =   2
            Left            =   0
            Top             =   4080
            Width           =   13335
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
         TabIndex        =   39
         Top             =   6000
         Width           =   3735
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
         Left            =   11160
         TabIndex        =   52
         Text            =   "0.00"
         Top             =   6000
         Width           =   1575
      End
      Begin VB.TextBox mskIrcDiscAmt 
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
         Left            =   9840
         TabIndex        =   51
         TabStop         =   0   'False
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   6000
         Width           =   1335
      End
      Begin VB.TextBox mskIrcDiscPer 
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
         Left            =   8520
         TabIndex        =   50
         Tag             =   "AhCode"
         Text            =   "0.00 %"
         Top             =   6000
         Width           =   1335
      End
      Begin VB.TextBox mskIrcAmtBefDisc 
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
         Width           =   1575
      End
      Begin VB.TextBox mskIrcRate 
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
         Left            =   5760
         TabIndex        =   48
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   6000
         Width           =   1215
      End
      Begin VB.TextBox mskIrcUnit 
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
         Left            =   4800
         TabIndex        =   47
         Tag             =   "AhCode"
         Text            =   "0"
         Top             =   6000
         Width           =   975
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
         Left            =   13440
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
         Width           =   13335
         _ExtentX        =   23521
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
         Left            =   3360
         TabIndex        =   141
         Top             =   1320
         Width           =   5895
         Begin VB.ComboBox cmbPrinterList 
            Height          =   315
            Left            =   2160
            Style           =   2  'Dropdown List
            TabIndex        =   85
            Top             =   1680
            Width           =   3495
         End
         Begin VB.ComboBox cmbPrintDest 
            Height          =   315
            Left            =   2160
            Style           =   2  'Dropdown List
            TabIndex        =   87
            Top             =   2400
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
         Begin VB.ComboBox cmbCRList 
            Height          =   315
            Left            =   2160
            Style           =   2  'Dropdown List
            TabIndex        =   84
            Top             =   1320
            Width           =   3495
         End
         Begin VB.TextBox mskIrcVchNo 
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
            BeginProperty Font 
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
         Begin VB.TextBox mskIrcVchNo 
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
            TabIndex        =   149
            Top             =   1680
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
            TabIndex        =   148
            Top             =   2400
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
            TabIndex        =   147
            Top             =   2040
            Width           =   1935
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
            TabIndex        =   146
            Top             =   1320
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
            TabIndex        =   145
            Top             =   960
            Width           =   375
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
            TabIndex        =   144
            Top             =   960
            Width           =   1935
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
            TabIndex        =   142
            Top             =   0
            Width           =   5895
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
         Height          =   6615
         Left            =   120
         TabIndex        =   69
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
      Caption         =   "Indoor Receipt"
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
Attribute VB_Name = "frmIndoorReceipt"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Dim mFormLoaded As Boolean, mLastKeyPressed As Integer, mMaskKeyPressed As Integer
Dim mFormUIdCode As Long, mFormIrcUIdFileName As String, mFormIrcAcsPermFileName As String
Dim mIrcCode As Long, mIrcIpgCode As Long, mIrcPttCode As Long, mQryPttCode As Long, mIrcOldIrcCode As Long, dtlAddEditMode As Boolean, dtlAddMode As Boolean, dtlEditCanceled As Boolean
Dim dtlSdcAddEditMode As Boolean, dtlSdcAddMode As Boolean, dtlSdcEditCanceled As Boolean
Dim mRemoteAccess As Boolean, mEntrySaved As Boolean, mEntryAborted As Boolean
Dim dbAcDatabase As New ADODB.Connection, dbVgnDatabase As New ADODB.Connection, dbGrpDatabase As New ADODB.Connection, dbComDatabase As New ADODB.Connection
Dim datRecset As New ADODB.Recordset
Dim mPttRegNo_old As Long, mIrcRecdAmtTot_old As Double
Dim mIrcCode_old As Long, mIrcDate_old As Date, mIrcVtmCode_old As Long, mIrcVchNo_old As Long, mIpgCDctCode_old As Long, mPttPcgCode_old As Long, mIpgRByCode_old As Long, mIpgRToCode_old As Long, mIrcTime_old As Long
Dim mIrcSrvCode_old As Long
Dim mSdcDctCode_old As Long
Dim clsJRN As clsJournal, clsAH As clsAccountHead, clsIPG As clsVgnSnglTranEntry, clsIRC As clsVgnIpdMultiTranEntry, clsARA As clsComMastEntry, clsSTN As clsComMastEntry, clsVTM As clsComMastEntry, clsVGNOPT As clsVgnIpdOptionsEntry
Dim clsPAT As clsVgnMasterEntry, clsPCG As clsVgnMasterEntry, clsDCT As clsVgnMasterEntry, clsDIG As clsVgnMasterEntry, clsSRV As clsVgnMasterEntry, clsDRL As clsVgnMasterEntry
Dim mActiveControl As Object, clsListStru As clsSelectQueryStructure
Dim fcmbIrcVtmName As clsComFlexSearch
Dim fcmbAdmIpgByIpgNo As clsVgnFlexSearch, fcmbAdmIpgByPttRegNo As clsVgnFlexSearch, fcmbAdmIpgByPttName As clsVgnFlexSearch, fcmbPttName As clsVgnFlexSearch, fcmbPttRegNo As clsVgnFlexSearch, fcmbSrvName As clsVgnFlexSearch, fcmbSDctName As clsVgnFlexSearch, fcmbDrlName As clsVgnFlexSearch

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
Const X2IRCICODE_COL = 0
Const X2IRCSNO_COL = 1
Const X2SRVNAME_COL = 2
Const X2SDCFLAG_COL = 3
Const X2IRCUNIT_COL = 4
Const X2IRCRATE_COL = 5
Const X2IRCAMTBEFDISC_COL = 6
Const X2IRCDISCPER_COL = 7
Const X2IRCDISCAMT_COL = 8
Const X2IRCAMTAFTDISC_COL = 9
Const X2IRCADVAMT_COL = 10
Const X2IRCRECDAMT_COL = 11
Const X2IRCDEPOAMT_COL = 12
Const X2IRCREFUAMT_COL = 13
Const X2IRCBALAMT_COL = 14
Const X2IRCSRVCODE_COL = 15
Const X2IRCRECSTATE_COL = 16
Const MFGRD2_COLS = 17

Rem service doctor column definitions
Const X3IRDICODE_COL = 0
Const X3IRDSNO_COL = 1
Const X3DCTNAME_COL = 2
Const X3DRLNAME_COL = 3
Const X3IRDREMARK_COL = 4
Const X3IRDDCTCODE_COL = 5
Const X3IRDDRLCODE_COL = 6
Const X3IRDRECSTATE_COL = 7
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
mIrcCode = mAccessCode
End Property

Public Property Get EntryBoundCode() As Long
EntryBoundCode = Val(mskFormBoundField.Text)
End Property

Public Property Get EntryDate() As Date
EntryDate = Ctod(dtpIrcDate.Text)
End Property

Public Property Get EntryType() As String
EntryType = "Irc"
End Property

Public Property Get EntryVtmCode() As Integer
EntryVtmCode = Val(fcmbIrcVtmName.BoundText)
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
                    dtpFromDate.Text = Dtoc(MonthStartDate(DateSerial(Val(Left(.fields("IrcYrMonth"), 4)), Val(Right(.fields("IrcYrMonth"), 2)), 1)))
                    dtpToDate.Text = Dtoc(MonthEndDate(DateSerial(Val(Left(.fields("IrcYrMonth"), 4)), Val(Right(.fields("IrcYrMonth"), 2)), 1)))
                    optMonthwise.Value = False
                    optDatewise.Value = True
                ElseIf optDatewise.Value = True Then
                    dtpFromDate.Text = Dtoc(.fields("IhrDate"))
                    dtpToDate.Text = Dtoc(.fields("IhrDate"))
                    optDatewise.Value = False
                    optDetailed.Value = True
                ElseIf optPatientwise.Value = True Then
                    mQryPttCode = .fields("IhrPttCode")
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
    mskIrcUnit.SetFocus
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
Dim tRecset As New ADODB.Recordset, srow As Integer, mIrcSno As Integer, mIrcICode As Long, mReqdRecdAmt As Double

srow = Mfgrd2.Row
mIrcSno = Val(Mfgrd2.TextMatrix(srow, X2IRCSNO_COL))
mIrcICode = Val(Mfgrd2.TextMatrix(srow, X2IRCICODE_COL))

Call ValidDtl    ' to check any service doctor detail for multidoctor detail service for false

If cmdOK.Caption = "&OK" And dtlEditCanceled = False Then
    With clsIRC
    If dtlAddMode = True Then
        .ClearDtl
    Else
        .GetDtlData mIrcCode, mIrcICode
    End If
    .mTrnCode_lng = mIrcCode
    .mTrnDtlSno_int = Val(UnMyNumFmt(mskIrcSno.Text))
    .mTrnDate_dt = Ctod(dtpIrcDate.Text)
    .mTrnCmpCode_int = sFinYrCmpCode
    
    .mIrcPttCode_lng = mIrcPttCode
    .mIrcSrvCode_dbl = Val(fcmbSrvName.BoundText)
    .mIrcUnit_dbl = Val(UnMyNumFmt(mskIrcUnit.Text))
    .mIrcRate_dbl = Val(UnMyNumFmt(mskIrcRate.Text))
    .mIrcAmtBefDisc_dbl = Val(UnMyNumFmt(mskIrcAmtBefDisc.Text))
    .mIrcDiscPer_dbl = Val(UnMyPerFmt(mskIrcDiscPer.Text))
    .mIrcDiscAmt_dbl = Val(UnMyNumFmt(mskIrcDiscAmt.Text))
    .mIrcAmtAftDisc_dbl = Val(UnMyNumFmt(mskIrcAmtAftDisc.Text))
    .mIrcRemark_str = ""
    
    If dtlAddMode = True Then
        .mIrcAdvAmt_dbl = 0 ' advance adjustment
        .mIrcRecdAmt_dbl = 0 ' .mIrcAmtAftDisc_dbl - .mIrcAdvAmt_dbl
        .mIrcDepoAmt_dbl = 0
        .mIrcRefuAmt_dbl = 0 ' refund adjustment
        .mIrcBalAmt_dbl = 0 ' automated in stored procedure
        
        If .AddNewDtl(mIrcCode) = True Then
            mIrcICode = .mTrnDtlICode_lng
        End If
    Else
        'mReqdRecdAmt = .mIrcAmtAftDisc_dbl - (.mIrcAdvAmt_dbl + .mIrcDepoAmt_dbl)
        '.mIrcRecdAmt_dbl = mReqdRecdAmt
        '.mIrcBalAmt_dbl = (.mIrcAmtAftDisc_dbl - (.mIrcAdvAmt_dbl + .mIrcRecdAmt_dbl + .mIrcDepoAmt_dbl) + .mIrcRefuAmt_dbl)  ' automated in stored procedure
        
        .UpdateDtl mIrcCode, mIrcICode
    End If
    End With
    
    RefreshDatabase dbVgnDatabase
    With tRecset
    .open "Select * from IndrRcpt where IrcCode=" & CStr(mIrcCode) & " and IrcICode=" & CStr(mIrcICode) & "", dbVgnDatabase, adOpenKeyset, adLockOptimistic
    
    clsSRV.GetData .fields("IrcSrvCode")
    
    Mfgrd2.TextMatrix(srow, X2IRCICODE_COL) = .fields("IrcICode")
    Mfgrd2.TextMatrix(srow, X2IRCSNO_COL) = ToMyNumFmt(.fields("IrcSno"), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2SRVNAME_COL) = clsSRV.mName_str
    If GetServDctDtlCount(cnn:=dbVgnDatabase, mTableName:="IndrRcDctDtl", mSdcCodeField:="IrdCode", mSdcCode:=.fields("IrcCode"), mSdcSubCodeField:="IrdIrcCode", mSdcSubCode:=.fields("IrcICode")) > 0 Then
        Mfgrd2.TextMatrix(srow, X2SDCFLAG_COL) = "Y"
    Else
        If clsSRV.mSrvMultiDctIncl_bln = True Then
            Mfgrd2.TextMatrix(srow, X2SDCFLAG_COL) = "N"
        Else
            Mfgrd2.TextMatrix(srow, X2SDCFLAG_COL) = ""
        End If
    End If
    Mfgrd2.TextMatrix(srow, X2IRCUNIT_COL) = ToMyNumFmt(.fields("IrcUnit"), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2IRCRATE_COL) = ToMyNumFmt(.fields("IrcRate"))
    Mfgrd2.TextMatrix(srow, X2IRCAMTBEFDISC_COL) = ToMyNumFmt(.fields("IrcAmtBefDisc"))
    Mfgrd2.TextMatrix(srow, X2IRCDISCPER_COL) = ToMyPerFmt(.fields("IrcDiscPer"))
    Mfgrd2.TextMatrix(srow, X2IRCDISCAMT_COL) = ToMyNumFmt(.fields("IrcDiscAmt"))
    Mfgrd2.TextMatrix(srow, X2IRCAMTAFTDISC_COL) = ToMyNumFmt(.fields("IrcAmtAftDisc"))
    Mfgrd2.TextMatrix(srow, X2IRCADVAMT_COL) = ToMyNumFmt(.fields("IrcAdvAmt"))
    Mfgrd2.TextMatrix(srow, X2IRCRECDAMT_COL) = ToMyNumFmt(.fields("IrcRecdAmt"))
    Mfgrd2.TextMatrix(srow, X2IRCDEPOAMT_COL) = ToMyNumFmt(.fields("IrcDepoAmt"))
    Mfgrd2.TextMatrix(srow, X2IRCREFUAMT_COL) = ToMyNumFmt(.fields("IrcRefuAmt"))
    Mfgrd2.TextMatrix(srow, X2IRCBALAMT_COL) = ToMyNumFmt(.fields("IrcBalAmt"))
    Mfgrd2.TextMatrix(srow, X2IRCSRVCODE_COL) = .fields("IrcSrvCode")
    Mfgrd2.TextMatrix(srow, X2IRCRECSTATE_COL) = .fields("IrcRecState")
    
    End With
    CloseTable tRecset
    
    If dtlAddMode = True Then
        Mfgrd2.Rows = Mfgrd2.Rows + 1
    End If
    srow = srow + 1
    Mfgrd2.Row = srow
    
    Call CalcFtrTotal
Else
    clsIRC.CancelSdcTran mIrcCode, mIrcICode
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
    txtSearch1Text_InterActiveChange Format(Ctod(dtpIrcDate.Text), "yyyymmdd") + Format(mIrcCode, "0000000")
ElseIf optMonthwise.Value = True Then
    txtSearch1Text_InterActiveChange Format(Ctod(dtpIrcDate.Text), "yyyy") & "/" & Format(Ctod(dtpIrcDate.Text), "mm")
ElseIf optDatewise.Value = True Then
    txtSearch1Text_InterActiveChange Format(Ctod(dtpIrcDate.Text), "yyyymmdd")
ElseIf optPatientwise.Value = True Then
    txtSearch1Text_InterActiveChange txtPttName.Text
End If

Call ShowEntryMode(False)
Mfgrd1.SetFocus

End Sub

Private Sub cmdSdcOK_Click()
Dim tRecset As New ADODB.Recordset, srow As Integer, mIrdSno As Integer, mIrdICode As Long, mIrdIrcCode As Long, mIrdSrvCode As Long

srow = Mfgrd3.Row
mIrdSno = Val(Mfgrd3.TextMatrix(srow, X3IRDSNO_COL))
mIrdICode = Val(Mfgrd3.TextMatrix(srow, X3IRDICODE_COL))
mIrdIrcCode = Val(Mfgrd2.TextMatrix(Mfgrd2.Row, X2IRCICODE_COL))
mIrdSrvCode = Val(fcmbSrvName.BoundText)

If cmdOK.Caption = "&OK" And dtlSdcEditCanceled = False Then
    With clsIRC
    If dtlSdcAddMode = True Then
        .ClearSdc
    Else
        .GetSdcData mIrcCode, mIrdIrcCode, mIrdICode
    End If
    .mSdcCode_lng = mIrcCode
    .mSdcSubCode_lng = mIrdIrcCode
    .mSdcSno_int = Val(UnMyNumFmt(mskIrdSno.Text))
    .mSdcDate_dt = Ctod(dtpIrcDate.Text)
    .mSdcSrvCode_lng = mIrdSrvCode
    .mSdcPttCode_lng = mIrcPttCode
    .mSdcDctCode_lng = Val(fcmbSDctName.BoundText)
    .mSdcDrlCode_lng = Val(fcmbDrlName.BoundText)
    .mSdcRemark_str = txtIrdRemark.Text
    .mSdcCmpCode_int = sFinYrCmpCode
    
    If dtlSdcAddMode = True Then
        .AddNewSdc mIrcCode, mIrdIrcCode
        mIrdICode = .mSdcICode_lng
    Else
        .UpdateSdc mIrcCode, mIrdIrcCode, mIrdICode
    End If
    End With
    
    RefreshDatabase dbVgnDatabase
    With tRecset
    .open "Select * from IndrRcDctDtl where IrdCode=" & CStr(mIrcCode) & " and IrdIrcCode=" & CStr(mIrdIrcCode) & " and IrdICode=" & CStr(mIrdICode) & "", dbVgnDatabase, adOpenKeyset, adLockOptimistic
    
    clsDCT.GetData .fields("IrdDctCode")
    clsDRL.GetData .fields("IrdDrlCode")
    
    Mfgrd3.TextMatrix(srow, X3IRDICODE_COL) = .fields("IrdICode")
    Mfgrd3.TextMatrix(srow, X3IRDSNO_COL) = ToMyNumFmt(.fields("IrdSno"), mDecimals:=0)
    Mfgrd3.TextMatrix(srow, X3DCTNAME_COL) = clsDCT.mName_str
    Mfgrd3.TextMatrix(srow, X3DRLNAME_COL) = clsDRL.mName_str
    Mfgrd3.TextMatrix(srow, X3IRDREMARK_COL) = .fields("IrdRemark")
    Mfgrd3.TextMatrix(srow, X3IRDDCTCODE_COL) = .fields("IrdDctCode")
    Mfgrd3.TextMatrix(srow, X3IRDDRLCODE_COL) = .fields("IrdDrlCode")
    Mfgrd3.TextMatrix(srow, X3IRDRECSTATE_COL) = .fields("IrdRecState")
    
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

Private Sub cmdSaveForm_GotFocus()
Dim mIrcAcsPermNo As Integer, mRetryCount As Integer

txtVoid.SetFocus
cmdSaveForm.Enabled = False
If Data_Verify() = True Then
    If CanAccept() = True Then
        If GetAccessPerm(mIrcAcsPermNo, mRetryCount, mFormIrcAcsPermFileName) = True And mRetryCount = 0 Then
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

Private Sub dtpIrcDate_GotFocus()
FlashActiveControl dtpIrcDate, True
End Sub

Private Sub dtpIrcDate_LostFocus()
FlashActiveControl dtpIrcDate, False
End Sub

Private Sub dtpIrcDate_Validate(Cancel As Boolean)
dtpIrcDate.Text = ToMyDate(dtpIrcDate.Text)
If IsFinYrDate(Ctod(dtpIrcDate.Text)) = False Then
    ErrorBox "Invalid Input !!!"
    dtpIrcDate.SetFocus
    Cancel = True
Else
    Call ChkServRate
    Call CalcIrcChg
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
        If mIrcCode = 0 Then
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

mFormIrcUIdFileName = "IndrRcpt.Uid"
mFormIrcAcsPermFileName = "IndrRcpt.Acp"
mFormUIdCode = GetUIdCode(mProcess:=Me.Name, mUIdFileName:=mFormIrcUIdFileName, mAcsPermFileName:=mFormIrcAcsPermFileName)

mFormLoaded = False
mEntrySaved = False: mEntryAborted = False
SetFormSize Me, frmMain
Call Form_Resize

Call SetVoidControl(txtVoid)
txtSearch1Text.Enabled = False
frConfigure.Visible = False
frPrintCRList.Visible = False
txtSdcFlag.Locked = True
mskIrcDiscPer.Tag = False
mskIrcDiscAmt.Tag = False

ChkCustomForm Me, CfsFileFullPath("IndrRcpt.Cfs")

OpenAcDataSource dbAcDatabase
OpenVgnDataSource dbVgnDatabase
OpenGrpDataSource dbGrpDatabase
OpenComDataSource dbComDatabase

Set clsListStru = New clsSelectQueryStructure

Set clsVGNOPT = New clsVgnIpdOptionsEntry
clsVGNOPT.blnIndrRcptOptMast = True
clsVGNOPT.Init
clsVGNOPT.GetIndrRcptOptData

Set clsAH = New clsAccountHead
Set clsAH.dbAcDatabase = dbAcDatabase
Set clsAH.dbGrpDatabase = dbGrpDatabase

Set clsIPG = New clsVgnSnglTranEntry
Set clsIPG.dbAcDatabase = dbAcDatabase
Set clsIPG.dbVgnDatabase = dbVgnDatabase
clsIPG.blnIndrRegTran = True
clsIPG.Init

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

Set fcmbIrcVtmName = New clsComFlexSearch
Set fcmbIrcVtmName.dbAcDatabase = dbAcDatabase
fcmbIrcVtmName.blnVTypeMastList = True
fcmbIrcVtmName.mListSqlExpr = "Select * from VTypMast where VtmSysCode=" & CStr(cVGN_VTYPE_INDOOR_RCPT) & " order by VtmName"
fcmbIrcVtmName.Init

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
    datRecset.open "Select * from IndrHdr inner join PatMast on IndrHdr.IhrPttCode=PatMast.PttCode where IhrCode=" & CStr(mIrcCode) & " order by IhrDate,IhrTime", dbVgnDatabase, adOpenKeyset, adLockOptimistic
Else
    datRecset.open "Select * from IndrHdr inner join PatMast on IndrHdr.IhrPttCode=PatMast.PttCode order by IhrDate,IhrTime", dbVgnDatabase, adOpenKeyset, adLockOptimistic
End If
Mfgrd1.FixedCols = 0
Call SmryList

Mfgrd2.FixedRows = 1: Mfgrd2.FixedCols = 0: Mfgrd2.Rows = 2: Mfgrd2.Cols = MFGRD2_COLS: SetGridAutoHeight Mfgrd2

colcnt = X2IRCICODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2IRCICODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2IRCSNO_COL: Mfgrd2.ColWidth(colcnt) = mskIrcSno.Width: Mfgrd2.TextMatrix(0, colcnt) = "Sno": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SRVNAME_COL: Mfgrd2.ColWidth(colcnt) = txtSrvName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Service Name": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2SDCFLAG_COL: Mfgrd2.ColWidth(colcnt) = txtSdcFlag.Width: Mfgrd2.TextMatrix(0, colcnt) = "Dtl": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2IRCUNIT_COL: Mfgrd2.ColWidth(colcnt) = mskIrcUnit.Width: Mfgrd2.TextMatrix(0, colcnt) = "Unit": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2IRCRATE_COL: Mfgrd2.ColWidth(colcnt) = mskIrcRate.Width: Mfgrd2.TextMatrix(0, colcnt) = "Rate": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2IRCAMTBEFDISC_COL: Mfgrd2.ColWidth(colcnt) = mskIrcAmtBefDisc.Width: Mfgrd2.TextMatrix(0, colcnt) = "Basic Amt": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2IRCDISCPER_COL: Mfgrd2.ColWidth(colcnt) = mskIrcDiscPer.Width: Mfgrd2.TextMatrix(0, colcnt) = "Disc.%": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2IRCDISCAMT_COL: Mfgrd2.ColWidth(colcnt) = mskIrcDiscAmt.Width: Mfgrd2.TextMatrix(0, colcnt) = "Disc.Amt": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2IRCAMTAFTDISC_COL: Mfgrd2.ColWidth(colcnt) = mskIrcAmtAftDisc.Width: Mfgrd2.TextMatrix(0, colcnt) = "Amount": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2IRCADVAMT_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2IRCADVAMT_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2IRCRECDAMT_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2IRCRECDAMT_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2IRCDEPOAMT_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2IRCDEPOAMT_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2IRCREFUAMT_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2IRCREFUAMT_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2IRCBALAMT_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2IRCBALAMT_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2IRCSRVCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2IRCSRVCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2IRCRECSTATE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2IRCRECSTATE_COL": Mfgrd2.ColAlignment(colcnt) = 7

colcnt = X2IRCSNO_COL: mskIrcSno.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2SRVNAME_COL: txtSrvName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2SDCFLAG_COL: txtSdcFlag.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2IRCUNIT_COL: mskIrcUnit.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2IRCRATE_COL: mskIrcRate.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2IRCAMTBEFDISC_COL: mskIrcAmtBefDisc.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2IRCDISCPER_COL: mskIrcDiscPer.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2IRCDISCAMT_COL: mskIrcDiscAmt.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2IRCAMTAFTDISC_COL: mskIrcAmtAftDisc.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
cmdOK.Left = mskIrcAmtAftDisc.Left + mskIrcAmtAftDisc.Width

lblIrcUnitTot.Left = mskIrcUnit.Left - frFooter.Left: lblIrcUnitTot.Width = mskIrcUnit.Width
lblIrcAmtBefDiscTot.Left = mskIrcAmtBefDisc.Left - frFooter.Left: lblIrcAmtBefDiscTot.Width = mskIrcAmtBefDisc.Width
lblIrcDiscAmtTot.Left = mskIrcDiscAmt.Left - frFooter.Left: lblIrcDiscAmtTot.Width = mskIrcDiscAmt.Width
lblIrcAmtAftDiscTot.Left = mskIrcAmtAftDisc.Left - frFooter.Left: lblIrcAmtAftDiscTot.Width = mskIrcAmtAftDisc.Width

Rem service doctor detail flexgrid
Mfgrd3.FixedRows = 1: Mfgrd3.FixedCols = 0: Mfgrd3.Rows = 2: Mfgrd3.Cols = MFGRD3_COLS
colcnt = X3IRDICODE_COL: Mfgrd3.ColWidth(colcnt) = 0: Mfgrd3.TextMatrix(0, colcnt) = "X3IRDICODE_COL": Mfgrd3.ColAlignment(colcnt) = 7
colcnt = X3IRDSNO_COL: Mfgrd3.ColWidth(colcnt) = mskIrdSno.Width: Mfgrd3.TextMatrix(0, colcnt) = "Sno": Mfgrd3.ColAlignment(colcnt) = 7
colcnt = X3DCTNAME_COL: Mfgrd3.ColWidth(colcnt) = txtSDctName.Width: Mfgrd3.TextMatrix(0, colcnt) = "Doctor Name": Mfgrd3.ColAlignment(colcnt) = 1
colcnt = X3DRLNAME_COL: Mfgrd3.ColWidth(colcnt) = txtDrlName.Width: Mfgrd3.TextMatrix(0, colcnt) = "Doctor Role": Mfgrd3.ColAlignment(colcnt) = 1
colcnt = X3IRDREMARK_COL: Mfgrd3.ColWidth(colcnt) = txtIrdRemark.Width: Mfgrd3.TextMatrix(0, colcnt) = "Remark": Mfgrd3.ColAlignment(colcnt) = 1
colcnt = X3IRDDCTCODE_COL: Mfgrd3.ColWidth(colcnt) = 0: Mfgrd3.TextMatrix(0, colcnt) = "X3IRDDCTCODE_COL": Mfgrd3.ColAlignment(colcnt) = 7
colcnt = X3IRDDRLCODE_COL: Mfgrd3.ColWidth(colcnt) = 0: Mfgrd3.TextMatrix(0, colcnt) = "X3IRDDRLCODE_COL": Mfgrd3.ColAlignment(colcnt) = 7
colcnt = X3IRDRECSTATE_COL: Mfgrd3.ColWidth(colcnt) = 0: Mfgrd3.TextMatrix(0, colcnt) = "X3IRDRECSTATE_COL": Mfgrd3.ColAlignment(colcnt) = 7

colcnt = X3IRDSNO_COL: mskIrdSno.Left = Mfgrd3.Left + Mfgrd3.ColPos(colcnt)
colcnt = X3DCTNAME_COL: txtSDctName.Left = Mfgrd3.Left + Mfgrd3.ColPos(colcnt)
colcnt = X3DRLNAME_COL: txtDrlName.Left = Mfgrd3.Left + Mfgrd3.ColPos(colcnt)
colcnt = X3IRDREMARK_COL: txtIrdRemark.Left = Mfgrd3.Left + Mfgrd3.ColPos(colcnt)
cmdSdcOK.Left = txtIrdRemark.Left + txtIrdRemark.Width

ShowEntryMode False
VisibleControls False
ShowSdcEntryMode False
ShowStatusBarText StatusBar1

End Sub

Private Sub mskIrcDiscAmt_Change()
If InterActiveChange(mskIrcDiscAmt) = True Then
    mskIrcDiscAmt.Tag = True
    mskIrcDiscPer.Tag = False
End If

End Sub

Private Sub mskIrcDiscPer_Change()
If InterActiveChange(mskIrcDiscPer) = True Then
    mskIrcDiscPer.Tag = True
    mskIrcDiscAmt.Tag = False
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
Set clsIPG = Nothing
Set clsIRC = Nothing
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
Set fcmbPttRegNo = Nothing
Set fcmbPttName = Nothing
Set fcmbIrcVtmName = Nothing
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
Dim mPttRegNo As Long, mIpgPttCode As Long, mIpgVchNo As Long, mIrcVchNo As Long
Dim mIrcAmtAftDiscTot As Double, mIrcAdvAmtTot As Double, mIrcRecdAmtTot As Double, mIrcDepoAmtTot As Double, mIrcRefuAmtTot As Double, mIrcBalAmtTot As Double

Data_Verify = False
If FormAddEditMode = cFORM_EDITMODE And Val(mskFormBoundField.Text) < 1 Then
    ErrorBox "Invalid Key Value !!!"
    txtPttName.SetFocus
    GoTo EndSub
End If
Rem patient validation
mIpgPttCode = Val(mskIrcPttCode.Text)
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
    If mPttRegNo = 0 And clsVGNOPT.mIrcPttRegNoNotZero_bln = True Then
        AlertBox "Prohibited Zero Patient Reg.No. !!!"
        mskPttRegNo.SetFocus
        GoTo EndSub
    End If
End If
If Val(UnMyPerFmt(mskIrcPttDiscPer.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskIrcPttDiscPer.SetFocus
    GoTo EndSub
End If
Rem indoor registration validation
If Val(mskIrcIpgCode.Text) < 1 Then
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
Rem indoor receipt validations
mIrcVchNo = Val(UnMyNumFmt(mskIrcVchNo(0).Text))
If mIrcVchNo > 0 Then
    If mIrcVchNo <> mIrcVchNo_old Or Val(fcmbIrcVtmName.BoundText) <> mIrcVtmCode_old Or Ctod(dtpIrcDate.Text) <> mIrcDate_old Or FormAddEditMode = cFORM_ADDMODE Then
        If ChkIsDuplVTypeNo(dbVgnDatabase, dbAcDatabase, mTableName:="IndrHdr", mChkFieldName:="IhrVchNo", mChkFieldValue:=mIrcVchNo, mKeyFieldName:="IhrCode", mKeyFieldValue:=mIrcCode, mVtmFieldName:="IhrVtmCode", mVtmFieldValue:=Val(fcmbIrcVtmName.BoundText), mFinYrFieldName:="IhrCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="IhrDate", mDateFieldValue:=Ctod(dtpIrcDate.Text)) = True Then
            ErrorBox "Duplicate Voucher No. !!!"
            mskIrcVchNo(0).SetFocus
            ' ---------------
            If FormAddEditMode = cFORM_ADDMODE Then
                mIrcVchNo = GetNextVTypeNo(dbVgnDatabase, dbAcDatabase, dbComDatabase, mTableName:="IndrHdr", mFieldName:="IhrVchNo", mVtmFieldName:="IhrVtmCode", mVtmFieldValue:=Val(fcmbIrcVtmName.BoundText), mFinYrFieldName:="IhrCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="IhrDate", mDateFieldValue:=Ctod(dtpIrcDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormIrcAcsPermFileName)
            Else
                mIrcVchNo = mIrcVchNo_old
            End If
            mskIrcVchNo(0).Text = ToMyNumFmt(mIrcVchNo, mDecimals:=0)
            GoTo EndSub
        End If
    End If
Else
    ErrorBox "Invalid Input !!!"
    mskIrcVchNo(0).SetFocus
    GoTo EndSub
End If
If IsDate(dtpIrcDate.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpIrcDate.SetFocus
    GoTo EndSub
Else
    If IsFinYrDate(Ctod(dtpIrcDate.Text)) = False Then
        ErrorBox "Invalid Input !!!"
        dtpIrcDate.SetFocus
        GoTo EndSub
    End If
End If
If TimeToMin(txtIrcTime_str.Text) > cDAYMINUTES Then
    ErrorBox "Invalid Input !!!"
    txtIrcTime_str.SetFocus
    GoTo EndSub
End If
mIrcAmtAftDiscTot = Val(UnMyNumFmt(lblIrcAmtAftDiscTot.Caption))
If mIrcAmtAftDiscTot < 0 Then
    ErrorBox "Invalid Total After Discount !!!"
    Mfgrd2.SetFocus
    GoTo EndSub
End If
mIrcAdvAmtTot = Val(UnMyNumFmt(mskIrcAdvAmtTot.Text))
If mIrcAdvAmtTot < 0 Then
    ErrorBox "Invalid Input !!!"
    mskIrcAdvAmtTot.SetFocus
    GoTo EndSub
End If
mIrcRecdAmtTot = Val(UnMyNumFmt(mskIrcRecdAmtTot.Text))
If mIrcRecdAmtTot < 0 Then
    ErrorBox "Invalid Input !!!"
    mskIrcRecdAmtTot.SetFocus
    GoTo EndSub
End If
mIrcDepoAmtTot = Val(UnMyNumFmt(mskIrcDepoAmtTot.Text))
If mIrcDepoAmtTot < 0 Then
    ErrorBox "Invalid Input !!!"
    mskIrcDepoAmtTot.SetFocus
    GoTo EndSub
End If
mIrcRefuAmtTot = Val(UnMyNumFmt(mskIrcRefuAmtTot.Text))
If mIrcRefuAmtTot < 0 Then
    ErrorBox "Invalid Input !!!"
    mskIrcRefuAmtTot.SetFocus
    GoTo EndSub
End If
mIrcBalAmtTot = Val(UnMyNumFmt(mskIrcBalAmtTot.Text))
If mIrcBalAmtTot < 0 Then
    ErrorBox "Invalid Input !!!"
    mskIrcBalAmtTot.SetFocus
    GoTo EndSub
End If
If (mIrcAdvAmtTot + mIrcRecdAmtTot + mIrcDepoAmtTot) > mIrcAmtAftDiscTot Then
    ErrorBox "Excess Received Amount !!!"
    mskIrcRecdAmtTot.SetFocus
    GoTo EndSub
ElseIf mIrcRefuAmtTot > (mIrcAdvAmtTot + mIrcRecdAmtTot + mIrcDepoAmtTot) Then
    ErrorBox "Excess Amount Refunded !!!"
    mskIrcRecdAmtTot.SetFocus
    GoTo EndSub
End If

Data_Verify = True

EndSub:
Exit Function

End Function

Private Function Data_NetwAuth() As Boolean
Dim mIrcVchNo As Long
Data_NetwAuth = False

mIrcVchNo = Val(UnMyNumFmt(mskIrcVchNo(0).Text))
If mIrcVchNo <> mIrcVchNo_old Or Val(fcmbIrcVtmName.BoundText) <> mIrcVtmCode_old Or Ctod(dtpIrcDate.Text) <> mIrcDate_old Or FormAddEditMode = cFORM_ADDMODE Then
    If ChkIsDuplVTypeNo(dbVgnDatabase, dbAcDatabase, mTableName:="IndrHdr", mChkFieldName:="IhrVchNo", mChkFieldValue:=mIrcVchNo, mKeyFieldName:="IhrCode", mKeyFieldValue:=mIrcCode, mVtmFieldName:="IhrVtmCode", mVtmFieldValue:=Val(fcmbIrcVtmName.BoundText), mFinYrFieldName:="IhrCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="IhrDate", mDateFieldValue:=Ctod(dtpIrcDate.Text)) = True Then
        ErrorBox "Duplicate Voucher No. !!!"
        mskIrcVchNo(0).SetFocus
        ' ---------------
        If FormAddEditMode = True Then
            mIrcVchNo = GetNextVTypeNo(dbVgnDatabase, dbAcDatabase, dbComDatabase, mTableName:="IndrHdr", mFieldName:="IhrVchNo", mVtmFieldName:="IhrVtmCode", mVtmFieldValue:=Val(fcmbIrcVtmName.BoundText), mFinYrFieldName:="IhrCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="IhrDate", mDateFieldValue:=Ctod(dtpIrcDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormIrcAcsPermFileName)
        Else
            mIrcVchNo = mIrcVchNo_old
        End If
        mskIrcVchNo(0).Text = ToMyNumFmt(mIrcVchNo, mDecimals:=0)
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
Dim srow As Integer, mIrcICode As Long, mDeleteit As Boolean
srow = Mfgrd2.Row
mIrcICode = Val(Mfgrd2.TextMatrix(srow, X2IRCICODE_COL))

If MyDeleteKey(Shift, KeyCode, mCheckCtrlMask:=False) = True And mIrcICode > 0 Then
    mDeleteit = True
    If mDeleteit = True Then
        mDeleteit = CanDelete()
    End If
    If mDeleteit = True Then
        clsIRC.DeleteDtl mIrcCode, mIrcICode
        
        ShowDtlData mIrcCode
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
        mskIrcSno.Text = ToMyNumFmt(FlexNextSeqno(Mfgrd2, X2IRCSNO_COL), mDecimals:=0)
        txtSrvName.Text = "": fcmbSrvName.BoundText = ""
        mskIrcUnit.Text = ToMyNumFmt(1, mDecimals:=0)
        mskIrcDiscPer.Text = mskIrcPttDiscPer.Text
    Else
        mskIrcICode.Text = Val(Mfgrd2.TextMatrix(srow, X2IRCICODE_COL))
        mskIrcSno.Text = Mfgrd2.TextMatrix(srow, X2IRCSNO_COL)
        fcmbSrvName.BoundText = Mfgrd2.TextMatrix(srow, X2IRCSRVCODE_COL): txtSrvName.Text = fcmbSrvName.Text
        txtSdcFlag.Text = Mfgrd2.TextMatrix(srow, X2SDCFLAG_COL)
        mskIrcUnit.Text = Mfgrd2.TextMatrix(srow, X2IRCUNIT_COL)
        mskIrcRate.Text = Mfgrd2.TextMatrix(srow, X2IRCRATE_COL)
        mskIrcAmtBefDisc.Text = Mfgrd2.TextMatrix(srow, X2IRCAMTBEFDISC_COL)
        mskIrcDiscPer.Text = Mfgrd2.TextMatrix(srow, X2IRCDISCPER_COL)
        mskIrcDiscAmt.Text = Mfgrd2.TextMatrix(srow, X2IRCDISCAMT_COL)
        mskIrcAmtAftDisc.Text = Mfgrd2.TextMatrix(srow, X2IRCAMTAFTDISC_COL)
    End If
    txtSrvName.SetFocus
    Call ValidDtl
    
    mIrcSrvCode_old = Val(fcmbSrvName.BoundText)
End If

End Sub

Private Sub Mfgrd2_RowColChange()
ShowActiveFlexRow Mfgrd2

End Sub

Private Sub mskIrcAdvAmtTot_GotFocus()
FlashActiveControl mskIrcAdvAmtTot, True
End Sub

Private Sub mskIrcAdvAmtTot_LostFocus()
FlashActiveControl mskIrcAdvAmtTot, False
End Sub

Private Sub mskIrcAmtAftDisc_GotFocus()
FlashActiveControl mskIrcAmtAftDisc, True
End Sub

Private Sub mskIrcAmtAftDisc_LostFocus()
FlashActiveControl mskIrcAmtAftDisc, False
End Sub

Private Sub mskIrcAmtAftDisc_Validate(Cancel As Boolean)
mskIrcAmtAftDisc.Text = ToMyNumFmt(mskIrcAmtAftDisc.Text)
If Val(UnMyNumFmt(mskIrcAmtAftDisc.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskIrcAmtAftDisc.SetFocus
    Cancel = True
Else
    Call CalcIrcChg
    Call ValidDtl
End If

End Sub

Rem discart this validation, instead use validation at receipt hdr level
Private Function chkIrcAmtAftDisc() As Boolean
Dim mRtnval As Boolean, srow As Integer, mIrcAmtAftDisc As Double, mIrcAdvAmt As Double, mIrcRecdAmt As Double, mIrcDepoAmt As Double, mIrcRefuAmt As Double

mRtnval = True
srow = Mfgrd2.Row
mIrcAmtAftDisc = Val(UnMyNumFmt(mskIrcAmtAftDisc.Text))
mIrcAdvAmt = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2IRCADVAMT_COL)))
mIrcDepoAmt = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2IRCDEPOAMT_COL)))
mIrcRefuAmt = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2IRCREFUAMT_COL)))

mIrcRecdAmt = mIrcAmtAftDisc - (mIrcAdvAmt + mIrcDepoAmt)
If mIrcRecdAmt < 0 Then
    ErrorBox "Amount Received in Excess !!!"
    mRtnval = False
ElseIf mIrcAmtAftDisc < (mIrcAdvAmt + mIrcRecdAmt + mIrcDepoAmt) Then
    ErrorBox "Amount Received in Excess !!!"
    mRtnval = False
ElseIf mIrcRefuAmt > (mIrcAdvAmt + mIrcDepoAmt + mIrcRecdAmt) Then
    ErrorBox "Amount Already Refunded !!!"
    mRtnval = False
End If
chkIrcAmtAftDisc = mRtnval

End Function

Private Sub mskIrcAmtBefDisc_GotFocus()
FlashActiveControl mskIrcAmtBefDisc, True
End Sub

Private Sub mskIrcAmtBefDisc_LostFocus()
FlashActiveControl mskIrcAmtBefDisc, False
End Sub

Private Sub mskIrcAmtBefDisc_Validate(Cancel As Boolean)
mskIrcAmtBefDisc.Text = ToMyNumFmt(mskIrcAmtBefDisc.Text)
If Val(UnMyNumFmt(mskIrcAmtBefDisc.Text)) <= 0 Then
    ErrorBox "Invalid Input !!!"
    mskIrcAmtBefDisc.SetFocus
    Cancel = True
Else
    Call CalcIrcChg
    Call ValidDtl
End If

End Sub

Private Sub mskIrcBalAmtTot_GotFocus()
FlashActiveControl mskIrcBalAmtTot, True
End Sub

Private Sub mskIrcBalAmtTot_LostFocus()
FlashActiveControl mskIrcBalAmtTot, False
End Sub

Private Sub mskIrcBalAmtTot_Validate(Cancel As Boolean)
If Val(UnMyNumFmt(mskIrcBalAmtTot.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskIrcBalAmtTot.SetFocus
    Rem Cancel = True
End If

End Sub

Private Sub mskIrcDepoAmtTot_GotFocus()
FlashActiveControl mskIrcDepoAmtTot, True
End Sub

Private Sub mskIrcDepoAmtTot_LostFocus()
FlashActiveControl mskIrcDepoAmtTot, False
End Sub

Private Sub mskIrcDepoAmtTot_Validate(Cancel As Boolean)
If Val(UnMyNumFmt(mskIrcDepoAmtTot.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskIrcDepoAmtTot.SetFocus
    Rem Cancel = True
End If

End Sub

Private Sub mskIrcDiscAmt_GotFocus()
FlashActiveControl mskIrcDiscAmt, True
End Sub

Private Sub mskIrcDiscAmt_LostFocus()
FlashActiveControl mskIrcDiscAmt, False
End Sub

Private Sub mskIrcDiscAmt_Validate(Cancel As Boolean)
mskIrcDiscAmt.Text = ToMyNumFmt(mskIrcDiscAmt.Text, mUseAbs:=True)
If Val(UnMyNumFmt(mskIrcDiscAmt.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskIrcDiscAmt.SetFocus
    Cancel = True
Else
    Call CalcIrcChg
End If
Call ValidDtl

End Sub

Private Sub mskIrcDiscPer_GotFocus()
FlashActiveControl mskIrcDiscPer, True
End Sub

Private Sub mskIrcDiscPer_LostFocus()
FlashActiveControl mskIrcDiscPer, False
End Sub

Private Sub mskIrcDiscPer_Validate(Cancel As Boolean)
mskIrcDiscPer.Text = ToMyPerFmt(mskIrcDiscPer.Text, mUseAbs:=True)
If Val(UnMyPerFmt(mskIrcDiscPer.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskIrcDiscPer.SetFocus
    Cancel = True
Else
    Call CalcIrcChg
End If
Call ValidDtl

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

Private Sub mskIrcRate_GotFocus()
FlashActiveControl mskIrcRate, True
End Sub

Private Sub mskIrcRate_LostFocus()
FlashActiveControl mskIrcRate, False
End Sub

Private Sub mskIrcRate_Validate(Cancel As Boolean)
mskIrcRate.Text = ToMyNumFmt(mskIrcRate.Text)
If Val(UnMyNumFmt(mskIrcRate.Text)) <= 0 Then
    ErrorBox "Invalid Input !!!"
    mskIrcRate.SetFocus
    Cancel = True
Else
    Call CalcIrcChg
    Call ValidDtl
End If

End Sub

Private Sub mskIrcRecdAmtTot_GotFocus()
FlashActiveControl mskIrcRecdAmtTot, True
End Sub

Private Sub mskIrcRecdAmtTot_LostFocus()
FlashActiveControl mskIrcRecdAmtTot, False
End Sub

Private Sub mskIrcRecdAmtTot_Validate(Cancel As Boolean)
Dim mIrcAdvAmtTot As Double, mIrcRecdAmtTot As Double, mIrcDepoAmtTot As Double, mIrcRefuAmtTot As Double, mIrcAmtAftDiscTot As Double

mIrcAdvAmtTot = Val(UnMyNumFmt(mskIrcAdvAmtTot.Text))
mIrcRecdAmtTot = Val(UnMyNumFmt(mskIrcRecdAmtTot.Text))
mIrcDepoAmtTot = Val(UnMyNumFmt(mskIrcDepoAmtTot.Text))
mIrcRefuAmtTot = Val(UnMyNumFmt(mskIrcRefuAmtTot.Text))
mIrcAmtAftDiscTot = Val(UnMyNumFmt(lblIrcAmtAftDiscTot.Caption))

mskIrcRecdAmtTot.Text = ToMyNumFmt(mIrcRecdAmtTot)
If mIrcRecdAmtTot < 0 Then
    ErrorBox "Invalid Input !!!"
    mskIrcRecdAmtTot.SetFocus
    Rem Cancel = True
Else
    If (mIrcAdvAmtTot + mIrcRecdAmtTot + mIrcDepoAmtTot) > mIrcAmtAftDiscTot Then
        ErrorBox "Excess Received Amount !!!"
        mIrcRecdAmtTot = mIrcAmtAftDiscTot - (mIrcAdvAmtTot + mIrcDepoAmtTot)
        mskIrcRecdAmtTot.Text = ToMyNumFmt(mIrcRecdAmtTot)
        mskIrcRecdAmtTot.SetFocus
        Rem Cancel = True
    ElseIf mIrcRefuAmtTot > (mIrcAdvAmtTot + mIrcRecdAmtTot + mIrcDepoAmtTot) Then
        ErrorBox "Excess Amount Refunded !!!"
        mIrcRecdAmtTot = mIrcRefuAmtTot - (mIrcAdvAmtTot + mIrcDepoAmtTot)
        mskIrcRecdAmtTot.Text = ToMyNumFmt(mIrcRecdAmtTot)
        mskIrcRecdAmtTot.SetFocus
        Rem Cancel = True
    Else
        CalcFtrTotal mCalcBalOnly:=True
'    Else
'        If FormAddEditMode = cFORM_ADDMODE Or mIrcRecdAmtTot <> mIrcRecdAmtTot_old Then
'            DisperseRecdAmt mIrcCode
'            ShowDtlData mIrcCode
'        End If
    End If
End If

End Sub

Private Sub mskIrcRefuAmtTot_GotFocus()
FlashActiveControl mskIrcRefuAmtTot, True
End Sub

Private Sub mskIrcRefuAmtTot_LostFocus()
FlashActiveControl mskIrcRefuAmtTot, False
End Sub

Private Sub mskIrcRefuAmtTot_Validate(Cancel As Boolean)
If Val(UnMyNumFmt(mskIrcRefuAmtTot.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskIrcRefuAmtTot.SetFocus
    Rem Cancel = True
End If

End Sub

Private Sub mskIrcUnit_GotFocus()
FlashActiveControl mskIrcUnit, True
End Sub

Private Sub mskIrcUnit_LostFocus()
FlashActiveControl mskIrcUnit, False
End Sub

Private Sub mskIrcUnit_Validate(Cancel As Boolean)
mskIrcUnit.Text = ToMyNumFmt(mskIrcUnit.Text, mDecimals:=0)
If Val(UnMyNumFmt(mskIrcUnit.Text)) <= 0 Then
    ErrorBox "Invalid Input !!!"
    mskIrcUnit.SetFocus
    Cancel = True
Else
    Call CalcIrcChg
    Call ValidDtl
End If

End Sub

Private Sub mskIrcVchNo_GotFocus(Index As Integer)
FlashActiveControl mskIrcVchNo(Index), True
End Sub

Private Sub mskIrcVchNo_LostFocus(Index As Integer)
FlashActiveControl mskIrcVchNo(Index), False
End Sub

Private Sub mskIrcVchNo_Validate(Index As Integer, Cancel As Boolean)
Dim mIrcVchNo As Long

mIrcVchNo = Val(UnMyNumFmt(mskIrcVchNo(Index).Text))
If mIrcVchNo < 0 Then
    If Index = 0 Then
        mIrcVchNo = GetNextVTypeNo(dbVgnDatabase, dbAcDatabase, dbComDatabase, mTableName:="IndrHdr", mFieldName:="IhrVchNo", mVtmFieldName:="IhrVtmCode", mVtmFieldValue:=Val(fcmbIrcVtmName.BoundText), mFinYrFieldName:="IhrCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="IhrDate", mDateFieldValue:=Ctod(dtpIrcDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormIrcAcsPermFileName)
        mskIrcVchNo(Index).Text = ToMyNumFmt(mIrcVchNo, mDecimals:=0)
    Else
        ErrorBox "Invalid Input !!!"
        mskIrcVchNo(Index).SetFocus
        Cancel = True
    End If
ElseIf mIrcVchNo > 0 Then
    If Index = 0 Then
        If mIrcVchNo <> mIrcVchNo_old Or Val(fcmbIrcVtmName.BoundText) <> mIrcVtmCode_old Or Ctod(dtpIrcDate.Text) <> mIrcDate_old Or FormAddEditMode = cFORM_ADDMODE Then
            If ChkIsDuplVTypeNo(dbVgnDatabase, dbAcDatabase, mTableName:="IndrHdr", mChkFieldName:="IhrVchNo", mChkFieldValue:=mIrcVchNo, mKeyFieldName:="IhrCode", mKeyFieldValue:=mIrcCode, mVtmFieldName:="IhrVtmCode", mVtmFieldValue:=Val(fcmbIrcVtmName.BoundText), mFinYrFieldName:="IhrCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="IhrDate", mDateFieldValue:=Ctod(dtpIrcDate.Text)) = True Then
                ErrorBox "Duplicate Voucher No. !!!"
                Cancel = True
                mskIrcVchNo(Index).SetFocus
                ' ----------
                If FormAddEditMode = cFORM_ADDMODE Then
                    mIrcVchNo = GetNextVTypeNo(dbVgnDatabase, dbAcDatabase, dbComDatabase, mTableName:="IndrHdr", mFieldName:="IhrVchNo", mVtmFieldName:="IhrVtmCode", mVtmFieldValue:=Val(fcmbIrcVtmName.BoundText), mFinYrFieldName:="IhrCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="IhrDate", mDateFieldValue:=Ctod(dtpIrcDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormIrcAcsPermFileName)
                Else
                    mIrcVchNo = mIrcVchNo_old
                End If
                mskIrcVchNo(Index).Text = ToMyNumFmt(mIrcVchNo, mDecimals:=0)
            End If
        End If
        If Cancel = False Then
            mskIrcVchNo(Index).Text = ToMyNumFmt(mIrcVchNo, mDecimals:=0)
        End If
    Else
        If ChkIsExistVTypeNo(dbVgnDatabase, mTableName:="IndrHdr", mChkFieldName:="IhrVchNo", mChkFieldValue:=CStr(mIrcVchNo), mVtmFieldName:="IhrVtmCode", mVtmFieldValue:=Val(fcmbIrcVtmName.BoundText), mFinYrFieldName:="IhrCmpCode", mFinYrFieldValue:=sFinYrCmpCode) = False Then
            ErrorBox "Voucher No. does not Exist !!!"
            mskIrcVchNo(Index).SetFocus
            Rem Cancel = True
        End If
    End If
Else
    ErrorBox "Invalid Input !!!"
    mskIrcVchNo(Index).SetFocus
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

Private Sub mskIrcPttDiscPer_GotFocus()
FlashActiveControl mskIrcPttDiscPer, True
End Sub

Private Sub mskIrcPttDiscPer_LostFocus()
FlashActiveControl mskIrcPttDiscPer, False
End Sub

Private Sub mskIrcPttDiscPer_Validate(Cancel As Boolean)
mskIrcPttDiscPer.Text = ToMyPerFmt(mskIrcPttDiscPer.Text)
If Val(UnMyPerFmt(mskIrcPttDiscPer.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskIrcPttDiscPer.SetFocus
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
        clsIRC.EndTran mIrcCode
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
        If mPttRegNo = 0 And clsVGNOPT.mIrcPttRegNoNotZero_bln = True Then
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

Private Sub txtIhrRemark_GotFocus()
FlashActiveControl txtIhrRemark, True
End Sub

Private Sub txtIhrRemark_LostFocus()
FlashActiveControl txtIhrRemark, False
End Sub

Private Sub txtIhrRemark_Validate(Cancel As Boolean)
txtIhrRemark.Text = ToMyWord(txtIhrRemark.Text)
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

Private Sub txtIrcTime_str_GotFocus()
FlashActiveControl txtIrcTime_str, True
End Sub

Private Sub txtIrcTime_str_LostFocus()
FlashActiveControl txtIrcTime_str, False
End Sub

Private Sub txtIrcTime_str_Validate(Cancel As Boolean)
txtIrcTime_str.Text = MinToTime(TimeToMin(txtIrcTime_str.Text))
If TimeToMin(txtIrcTime_str.Text) > cDAYMINUTES Then
    ErrorBox "Invalid Input !!!"
    txtIrcTime_str.SetFocus
    Cancel = True
Else
    Call ChkServRate
    Call CalcIrcChg
End If

End Sub

Private Sub txtIrcVtmName_Change(Index As Integer)
If fcmbIrcVtmName.CallFromText_Change = False Then
    fcmbIrcVtmName.CallFromText_Change = True
    If InterActiveChange(txtIrcVtmName(Index)) = True Then
        fcmbIrcVtmName.UserText = Array(txtIrcVtmName(Index).Text, txtIrcVtmName(Index).SelStart)
        fcmbIrcVtmName.Show
        txtIrcVtmName(Index).Text = fcmbIrcVtmName.Text
        If fcmbIrcVtmName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbIrcVtmName.CallFromText_Change = False
End If

End Sub

Private Sub txtIrcVtmName_GotFocus(Index As Integer)
FlashActiveControl txtIrcVtmName(Index), True
End Sub

Private Sub txtIrcVtmName_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    txtIrcVtmName_Change Index
ElseIf MyAddNewKey(Shift, KeyCode) = True Then

ElseIf Shift = 0 And KeyCode = vbKeyF6 Then
    Rem Call ShowOldIpgListByIpgNo show here all indoor receipt details
End If

End Sub

Private Sub txtIrcVtmName_LostFocus(Index As Integer)
FlashActiveControl txtIrcVtmName(Index), False
End Sub

Private Sub txtIrcVtmName_Validate(Index As Integer, Cancel As Boolean)
Dim mIrcVchNo As Long

If Val(fcmbIrcVtmName.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    txtIrcVtmName(Index).SetFocus
    Cancel = True
Else
    If Index = 0 Then
        If Val(fcmbIrcVtmName.BoundText) <> mIrcVtmCode_old Or Ctod(dtpIrcDate.Text) <> mIrcDate_old Or FormAddEditMode = cFORM_ADDMODE Then
            mIrcVchNo = GetNextVTypeNo(dbVgnDatabase, dbAcDatabase, dbComDatabase, mTableName:="IndrHdr", mFieldName:="IhrVchNo", mVtmFieldName:="IhrVtmCode", mVtmFieldValue:=Val(fcmbIrcVtmName.BoundText), mFinYrFieldName:="IhrCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="IhrDate", mDateFieldValue:=Ctod(dtpIrcDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormIrcAcsPermFileName)
            mskIrcVchNo(Index).Text = ToMyNumFmt(mIrcVchNo, mDecimals:=0)
        End If
    End If
End If

End Sub

Private Sub txtIrdRemark_GotFocus()
FlashActiveControl txtIrdRemark, True
End Sub

Private Sub txtIrdRemark_LostFocus()
FlashActiveControl txtIrdRemark, False
End Sub

Private Sub txtIrdRemark_Validate(Cancel As Boolean)
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
    Call ShowOldIpgListByPttName
ElseIf MyAddNewKey(Shift, KeyCode) = True Then
    If FormAddEditMode = cFORM_ADDMODE Then
        clsIRC.EndTran mIrcCode
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
If clsIRC.BeginTran(0) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_ADDMODE

clsIRC.ClearHdr: clsIRC.ClearDtl
clsIPG.Clear
clsPAT.Clear

mIrcCode = clsIRC.ActiveTrnCode
mIrcIpgCode = 0
mIrcPttCode = 0

ShowIrcData mIrcCode
ShowIpgData mIrcIpgCode
ShowPatData mIrcPttCode

Rem restoring user editing features
Call ShowIrcDefData
Call ShowPatDefData
Call ShowIpgDefData

Rem old values
Call StoreIrcOldData
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
If clsIRC.BeginTran(datRecset.fields("IhrCode")) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_EDITMODE

With datRecset
mIrcCode = .fields("IhrCode")
mIrcIpgCode = .fields("IhrIpgCode")
mIrcPttCode = .fields("IhrPttCode")

clsIRC.GetHdrData mIrcCode
clsIPG.GetData mIrcIpgCode
clsPAT.GetData mIrcPttCode
End With

ShowIrcData mIrcCode
ShowIpgData mIrcIpgCode
ShowPatData mIrcPttCode

Rem old values
Call StoreIrcOldData
Call StoreIpgOldData
Call StorePatOldData

Call ShowEntryMode(True)
txtPttName.SetFocus

End Sub

Private Sub ShowPatData(ByVal mPttCode As Long)

With clsPAT
.GetData mPttCode

mskIrcPttCode.Text = mPttCode
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
clsPAT.GetData Val(UnMyNumFmt(mskIrcPttCode.Text))

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

With clsIPG
.GetData mIpgCode

mskIrcIpgCode.Text = mIpgCode
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
clsIPG.GetData Val(UnMyNumFmt(mskIrcIpgCode.Text))

mIpgCDctCode_old = clsIPG.mIpgCDctCode_lng
mIpgRByCode_old = clsIPG.mIpgRByCode_lng
mIpgRToCode_old = clsIPG.mIpgRToCode_lng

End Sub

Private Sub ShowIrcData(ByVal mIrcCode As Long)
With clsIRC
.GetHdrData mIrcCode

mskFormBoundField.Text = mIrcCode
fcmbIrcVtmName.BoundText = CStr(.mTrnVtmCode_lng): txtIrcVtmName(0).Text = fcmbIrcVtmName.Text
txtIrcPrefix.Text = .mTrnPrefix_str
mskIrcVchNo(0).Text = ToMyNumFmt(.mTrnVchNo_lng, mDecimals:=0)
dtpIrcDate.Text = Dtoc(.mTrnDate_dt)
txtIrcTime_str.Text = MinToTime(.mIhrTime_lng)
txtIhrRemark.Text = .mIhrRemark_str
mskIrcPttDiscPer.Text = ToMyPerFmt(.mIhrPttDiscPer_dbl)

mskIrcAdvAmtTot.Text = ToMyNumFmt(.mIhrAdvAmt_dbl)
mskIrcRecdAmtTot.Text = ToMyNumFmt(.mIhrRecdAmt_dbl)
mskIrcDepoAmtTot.Text = ToMyNumFmt(.mIhrDepoAmt_dbl)
mskIrcRefuAmtTot.Text = ToMyNumFmt(.mIhrRefuAmt_dbl)

Rem old indoor receipt
mIrcOldIrcCode = .mIhrOldIhrCode_lng
ShowOldIrcCodeDesc mIrcOldIrcCode
End With

'Call CalcIrcChg
ShowDtlData mIrcCode
Call ShowLinkTranDtl

End Sub

Private Sub ShowIrcDefData()
Dim mIrcVchNo As Long

dtpIrcDate.Text = Dtoc(DefaultEntryDate)
txtIrcTime_str.Text = MinToTime(TimeToMin(DateTime.Time$))

fcmbIrcVtmName.BoundText = CStr(clsVGNOPT.GetIndrRcptOptBoundCode("IrcVtmCode")): txtIrcVtmName(0).Text = fcmbIrcVtmName.Text

mIrcVchNo = GetNextVTypeNo(dbVgnDatabase, dbAcDatabase, dbComDatabase, mTableName:="IndrHdr", mFieldName:="IhrVchNo", mVtmFieldName:="IhrVtmCode", mVtmFieldValue:=Val(fcmbIrcVtmName.BoundText), mFinYrFieldName:="IhrCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="IhrDate", mDateFieldValue:=Ctod(dtpIrcDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormIrcAcsPermFileName)
mskIrcVchNo(0).Text = ToMyNumFmt(mIrcVchNo, mDecimals:=0)

End Sub

Private Sub StoreIrcOldData()
mIrcCode_old = mIrcCode
mIrcDate_old = Ctod(dtpIrcDate.Text)
mIrcTime_old = TimeToMin(txtIrcTime_str.Text)
mIrcVtmCode_old = Val(fcmbIrcVtmName.BoundText)
mIrcVchNo_old = Val(UnMyNumFmt(mskIrcVchNo(0).Text))
mIrcRecdAmtTot_old = Val(UnMyNumFmt(mskIrcRecdAmtTot.Text))

mskIrcDiscPer.Tag = False
mskIrcDiscAmt.Tag = False

End Sub

Private Sub ShowDtlData(ByVal mIrcCode As Long)
Dim srow As Integer, tRecset As New ADODB.Recordset, mColCnt As Integer

srow = 1
Mfgrd2.Rows = 2

With tRecset
.open "Select * from IndrRcpt where IrcCode=" & CStr(mIrcCode) & " order by IrcSno", dbVgnDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Do While .EOF = False
        If InList(.fields("IrcRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
            clsSRV.GetData .fields("IrcSrvCode")
            
            Mfgrd2.TextMatrix(srow, X2IRCICODE_COL) = .fields("IrcICode")
            Mfgrd2.TextMatrix(srow, X2IRCSNO_COL) = ToMyNumFmt(.fields("IrcSno"), mDecimals:=0)
            Mfgrd2.TextMatrix(srow, X2SRVNAME_COL) = clsSRV.mName_str
            If GetServDctDtlCount(cnn:=dbVgnDatabase, mTableName:="IndrRcDctDtl", mSdcCodeField:="IrdCode", mSdcCode:=.fields("IrcCode"), mSdcSubCodeField:="IrdIrcCode", mSdcSubCode:=.fields("IrcICode")) > 0 Then
                Mfgrd2.TextMatrix(srow, X2SDCFLAG_COL) = "Y"
            Else
                If clsSRV.mSrvMultiDctIncl_bln = True Then
                    Mfgrd2.TextMatrix(srow, X2SDCFLAG_COL) = "N"
                Else
                    Mfgrd2.TextMatrix(srow, X2SDCFLAG_COL) = ""
                End If
            End If
            Mfgrd2.TextMatrix(srow, X2IRCUNIT_COL) = ToMyNumFmt(.fields("IrcUnit"), mDecimals:=0)
            Mfgrd2.TextMatrix(srow, X2IRCRATE_COL) = ToMyNumFmt(.fields("IrcRate"))
            Mfgrd2.TextMatrix(srow, X2IRCAMTBEFDISC_COL) = ToMyNumFmt(.fields("IrcAmtBefDisc"))
            Mfgrd2.TextMatrix(srow, X2IRCDISCPER_COL) = ToMyPerFmt(.fields("IrcDiscPer"))
            Mfgrd2.TextMatrix(srow, X2IRCDISCAMT_COL) = ToMyNumFmt(.fields("IrcDiscAmt"))
            Mfgrd2.TextMatrix(srow, X2IRCAMTAFTDISC_COL) = ToMyNumFmt(.fields("IrcAmtAftDisc"))
            Mfgrd2.TextMatrix(srow, X2IRCADVAMT_COL) = ToMyNumFmt(.fields("IrcAdvAmt"))
            Mfgrd2.TextMatrix(srow, X2IRCRECDAMT_COL) = ToMyNumFmt(.fields("IrcRecdAmt"))
            Mfgrd2.TextMatrix(srow, X2IRCDEPOAMT_COL) = ToMyNumFmt(.fields("IrcDepoAmt"))
            Mfgrd2.TextMatrix(srow, X2IRCREFUAMT_COL) = ToMyNumFmt(.fields("IrcRefuAmt"))
            Mfgrd2.TextMatrix(srow, X2IRCBALAMT_COL) = ToMyNumFmt(.fields("IrcBalAmt"))
            Mfgrd2.TextMatrix(srow, X2IRCSRVCODE_COL) = .fields("IrcSrvCode")
            Mfgrd2.TextMatrix(srow, X2IRCRECSTATE_COL) = .fields("IrcRecState")
            
            Mfgrd2.Rows = Mfgrd2.Rows + 1
            srow = srow + 1
        Else
            If InList(.fields("IrcRecState"), Array(cREC_CANCELED, cREC_DELETED)) = False Then
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

With clsIRC
If FormAddEditMode = cFORM_ADDMODE Then
    .ClearHdr
Else
    .GetHdrData mIrcCode
End If
.mTrnDate_dt = Ctod(dtpIrcDate.Text)
.mTrnVtmCode_lng = Val(fcmbIrcVtmName.BoundText)
.mTrnPrefix_str = txtIrcPrefix.Text
.mTrnVchNo_lng = Val(UnMyNumFmt(mskIrcVchNo(0).Text))
.mTrnPostfix_str = ""
.mTrnCmpCode_int = sFinYrCmpCode

.mIhrTime_lng = TimeToMin(txtIrcTime_str.Text)
.mIhrIpgCode_lng = mIrcIpgCode
.mIhrPttCode_lng = mIrcPttCode
.mIhrPttDiscPer_dbl = Val(UnMyPerFmt(mskIrcPttDiscPer.Text))
.mIhrOldIhrCode_lng = mIrcOldIrcCode
.mIhrAmtBefDisc_dbl = Val(UnMyNumFmt(lblIrcAmtBefDiscTot.Caption))
.mIhrDiscAmt_dbl = Val(UnMyNumFmt(lblIrcDiscAmtTot.Caption))
.mIhrAmtAftDisc_dbl = Val(UnMyNumFmt(lblIrcAmtAftDiscTot.Caption))
.mIhrAdvAmt_dbl = Val(UnMyNumFmt(mskIrcAdvAmtTot.Text))
.mIhrRecdAmt_dbl = Val(UnMyNumFmt(mskIrcRecdAmtTot.Text))
.mIhrDepoAmt_dbl = Val(UnMyNumFmt(mskIrcDepoAmtTot.Text))
.mIhrRefuAmt_dbl = Val(UnMyNumFmt(mskIrcRefuAmtTot.Text))
.mIhrBalAmt_dbl = Val(UnMyNumFmt(mskIrcBalAmtTot.Text))
.mIhrRemark_str = txtIhrRemark.Text

If FormAddEditMode = cFORM_ADDMODE Then
    If .AddNewHdr() = True Then
        mskFormBoundField.Text = .mTrnCode_lng
        
        Rem remove any unexpected doctor detail for service
        dbVgnDatabase.BeginTrans
        dbVgnDatabase.Execute "Delete from IndrRcDctDtl where IrdIrcCode IN (Select IrcICode from IndrRcpt as irc inner join ServMast as srv on irc.IrcSrvCode=srv.SrvCode where srv.SrvMultiDctIncl=False and irc.IrcCode=" & CStr(mIrcCode) & ") and IrdCode=" & CStr(mIrcCode) & ""
        dbVgnDatabase.CommitTrans
    End If
Else
    .UpdateHdr mIrcCode
End If
If .mTrnCode_lng > 0 Then   ' updated successfully
    mIrcCode = .mTrnCode_lng
    
    .UpdateTran .mTrnCode_lng
    .EndTran .mTrnCode_lng
        
    Rem updating user editing carry forward features
    clsVGNOPT.mIrcVtmCodeOld_lng = .mTrnVtmCode_lng
    clsVGNOPT.UpdateIndrRcptOld
    
    mEntrySaved = True
Else
    Call Data_CancelEvent
    ErrorBox "Entry Cancelled !!!"
End If
End With

If clsIRC.mTrnCode_lng > 0 Then   ' updated successfully
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

mIrcCode = datRecset.fields("IhrCode")
mIrcPttCode = datRecset.fields("IhrPttCode")
mRecAbsPos = datRecset.AbsolutePosition

If clsIRC.CanDeleteTran(mIrcCode) = True Then
    txtVoid.SetFocus
    If clsIRC.BeginTran(mIrcCode) = True Then
        clsIRC.DeleteTran mIrcCode
        clsIRC.UpdateTran mIrcCode
        clsIRC.EndTran mIrcCode
        
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
clsIRC.CancelTran mIrcCode
clsIRC.EndTran mIrcCode

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
        clsListStru.AddFields mExpr:="IrcYrMonth", mAttrib:=cFAT_SYSTEM
        clsListStru.AddFields mExpr:="IrcMnYear", mTitle:="Month", mShowItem:=True, mAlign:=1, mWidth:=2000
        clsListStru.AddFields mExpr:="IrcCount", mTitle:="Count", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IrcAmtAftDisc_sum", mTitle:="Charges", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IrcBalAmt_sum", mTitle:="Due Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IrcAdvAmt_sum", mTitle:="Adv.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IrcRecdAmt_sum", mTitle:="Recd.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IrcDepoAmt_sum", mTitle:="Depo.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IrcRefuAmt_sum", mTitle:="Refu.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IrcDiscAmt_sum", mTitle:="Discount", mShowItem:=True, mAlign:=7, mWidth:=1500
        
        datRecset.open "Select format(IhrDate,'yyyy/MM') as IrcYrMonth" _
         & ",Count(IhrCode) as IrcCount" _
         & ",Sum(IhrAmtAftDisc) as IrcAmtAftDisc_sum" _
         & ",Sum(IhrBalAmt) as IrcBalAmt_sum" _
         & ",Sum(IhrAdvAmt) as IrcAdvAmt_sum" _
         & ",Sum(IhrRecdAmt) as IrcRecdAmt_sum" _
         & ",Sum(IhrDepoAmt) as IrcDepoAmt_sum" _
         & ",Sum(IhrRefuAmt) as IrcRefuAmt_sum" _
         & ",Sum(IhrDiscAmt) as IrcDiscAmt_sum" _
         & " from IndrHdr" _
         & " where IhrDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and IhrCode>0" _
         & IIf(mQryPttCode > 0, " and IhrPttCode=" & CStr(mQryPttCode), "") _
         & " group by format(IhrDate,'yyyy/MM')" _
         & " order by format(IhrDate,'yyyy/MM')" _
         , dbVgnDatabase, adOpenKeyset, adLockReadOnly

    ElseIf optDatewise.Value = True Then
        clsListStru.AddFields mExpr:="IrcDateYMD", mAttrib:=cFAT_SYSTEM
        clsListStru.AddFields mExpr:="IrcDate", mTitle:="Date", mShowItem:=True, mAlign:=1, mWidth:=2000
        clsListStru.AddFields mExpr:="IrcCount", mTitle:="Count", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IrcAmtAftDisc_sum", mTitle:="Charges", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IrcBalAmt_sum", mTitle:="Due Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IrcAdvAmt_sum", mTitle:="Adv.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IrcRecdAmt_sum", mTitle:="Recd.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IrcDepoAmt_sum", mTitle:="Depo.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IrcRefuAmt_sum", mTitle:="Refu.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IrcDiscAmt_sum", mTitle:="Discount", mShowItem:=True, mAlign:=7, mWidth:=1500
        
        datRecset.open "Select IhrDate" _
         & ",Count(IhrCode) as IrcCount" _
         & ",Sum(IhrAmtAftDisc) as IrcAmtAftDisc_sum" _
         & ",Sum(IhrBalAmt) as IrcBalAmt_sum" _
         & ",Sum(IhrAdvAmt) as IrcAdvAmt_sum" _
         & ",Sum(IhrRecdAmt) as IrcRecdAmt_sum" _
         & ",Sum(IhrDepoAmt) as IrcDepoAmt_sum" _
         & ",Sum(IhrRefuAmt) as IrcRefuAmt_sum" _
         & ",Sum(IhrDiscAmt) as IrcDiscAmt_sum" _
         & " from IndrHdr" _
         & " where IhrDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and IhrCode>0" _
         & IIf(mQryPttCode > 0, " and IhrPttCode=" & CStr(mQryPttCode), "") _
         & " group by IhrDate" _
         & " order by IhrDate" _
         , dbVgnDatabase, adOpenKeyset, adLockReadOnly
        
    ElseIf optPatientwise.Value = True Then
        clsListStru.AddFields mExpr:="PttName", mTitle:="Patient Name", mShowItem:=True, mAlign:=1, mWidth:=3000
        clsListStru.AddFields mExpr:="PttRegNo", mTitle:="Reg.No", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="PttRefName", mTitle:="Care of", mShowItem:=True, mAlign:=1, mWidth:=2000
        clsListStru.AddFields mExpr:="IrcCount", mTitle:="Count", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IrcAmtAftDisc_sum", mTitle:="Charges", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IrcBalAmt_sum", mTitle:="Due Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IrcAdvAmt_sum", mTitle:="Adv.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IrcRecdAmt_sum", mTitle:="Recd.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IrcDepoAmt_sum", mTitle:="Depo.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IrcRefuAmt_sum", mTitle:="Refu.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IrcDiscAmt_sum", mTitle:="Discount", mShowItem:=True, mAlign:=7, mWidth:=1500
        
        datRecset.open "Select PatMast.PttName,PatMast.PttRegNo,IndrHdr.IhrPttCode" _
         & ",Count(IhrCode) as IrcCount" _
         & ",Sum(IhrAmtAftDisc) as IrcAmtAftDisc_sum" _
         & ",Sum(IhrBalAmt) as IrcBalAmt_sum" _
         & ",Sum(IhrAdvAmt) as IrcAdvAmt_sum" _
         & ",Sum(IhrRecdAmt) as IrcRecdAmt_sum" _
         & ",Sum(IhrDepoAmt) as IrcDepoAmt_sum" _
         & ",Sum(IhrRefuAmt) as IrcRefuAmt_sum" _
         & ",Sum(IhrDiscAmt) as IrcDiscAmt_sum" _
         & " from IndrHdr inner join PatMast on IndrHdr.IhrPttCode=PatMast.PttCode" _
         & " where IhrDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and IhrCode>0" _
         & IIf(mQryPttCode > 0, " and IhrPttCode=" & CStr(mQryPttCode), "") _
         & " group by PatMast.PttName,PatMast.PttRegNo,IndrHdr.IhrPttCode" _
         & " order by PatMast.PttName,PatMast.PttRegNo,IndrHdr.IhrPttCode" _
         , dbVgnDatabase, adOpenKeyset, adLockReadOnly
    End If
    
ElseIf optDetailed.Value = True Then
    clsListStru.AddFields mExpr:="tIrcSmryId", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="IrcCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="VtmName", mTitle:="Voucher", mAlign:=1, mWidth:=1500, mShowItem:=True
    clsListStru.AddFields mExpr:="IrcVchNo", mTitle:="Vchr.No", mAlign:=7, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="IrcDate", mTitle:="Date", mAlign:=1, mWidth:=1250, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="PttCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="PttName", mTitle:="Patient Name", mAlign:=1, mWidth:=2500, mShowItem:=True
    clsListStru.AddFields mExpr:="PttRegNo", mTitle:="Reg.No", mAlign:=7, mWidth:=1250, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="IrcAmtAftDisc", mTitle:="Charges", mAlign:=7, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="IrcBalAmt", mTitle:="Due Amt", mAlign:=7, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="IrcAdvAmt", mTitle:="Adv.Amt", mAlign:=7, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="IrcRecdAmt", mTitle:="Recd.Amt", mAlign:=7, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="IrcDepoAmt", mTitle:="Depo.Amt", mAlign:=7, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="IrcRefuAmt", mTitle:="Refu.Amt", mAlign:=7, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="IrcDiscAmt", mTitle:="Discount", mAlign:=7, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="PttRefName", mTitle:="Care of", mAlign:=1, mWidth:=2000, mShowItem:=True
    clsListStru.AddFields mExpr:="PttAddr", mTitle:="Address", mAlign:=1, mWidth:=2000, mShowItem:=True
    clsListStru.AddFields mExpr:="PatAraName", mTitle:="Area", mAlign:=1, mWidth:=1500, mShowItem:=True
    clsListStru.AddFields mExpr:="PatStnName", mTitle:="Station", mAlign:=1, mWidth:=1500, mShowItem:=True
    clsListStru.AddFields mExpr:="PatPcgName", mTitle:="Category", mAlign:=1, mWidth:=2000, mShowItem:=True
    
    datRecset.open "Select IndrHdr.*,PatMast.*" _
     & ",format(IhrDate,'yyyymmdd')+format(IhrCode,'0000000') as tIrcSmryId" _
     & " from IndrHdr inner join PatMast on IndrHdr.IhrPttCode=PatMast.PttCode" _
     & " where IhrDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & IIf(mRemoteAccess = True, " and IhrCode=" & CStr(mIrcCode) & "", "") _
     & " and IhrCode>0" _
     & IIf(mQryPttCode > 0, " and IhrPttCode=" & CStr(mQryPttCode), "") _
     & " order by IhrDate,IhrCode" _
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
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IrcYrMonth")) = .fields("IrcYrMonth")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IrcMnYear")) = MonthName(Val(Right(.fields("IrcYrMonth"), 2))) & "-" & Left(.fields("IrcYrMonth"), 4)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IrcCount")) = ToMyNumFmt(.fields("IrcCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IrcAmtAftDisc_sum")) = ToMyNumFmt(.fields("IrcAmtAftDisc_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IrcBalAmt_sum")) = ToMyNumFmt(.fields("IrcBalAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IrcAdvAmt_sum")) = ToMyNumFmt(.fields("IrcAdvAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IrcRecdAmt_sum")) = ToMyNumFmt(.fields("IrcRecdAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IrcDepoAmt_sum")) = ToMyNumFmt(.fields("IrcDepoAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IrcRefuAmt_sum")) = ToMyNumFmt(.fields("IrcRefuAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IrcDiscAmt_sum")) = ToMyNumFmt(.fields("IrcDiscAmt_sum"))
                
            ElseIf optDatewise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IrcDateYMD")) = Format(.fields("IhrDate"), "yyyymmdd")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IrcDate")) = Dtoc(.fields("IhrDate"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IrcCount")) = ToMyNumFmt(.fields("IrcCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IrcAmtAftDisc_sum")) = ToMyNumFmt(.fields("IrcAmtAftDisc_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IrcBalAmt_sum")) = ToMyNumFmt(.fields("IrcBalAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IrcAdvAmt_sum")) = ToMyNumFmt(.fields("IrcAdvAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IrcRecdAmt_sum")) = ToMyNumFmt(.fields("IrcRecdAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IrcDepoAmt_sum")) = ToMyNumFmt(.fields("IrcDepoAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IrcRefuAmt_sum")) = ToMyNumFmt(.fields("IrcRefuAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IrcDiscAmt_sum")) = ToMyNumFmt(.fields("IrcDiscAmt_sum"))
                
            ElseIf optPatientwise.Value = True Then
                clsPAT.GetData .fields("IhrPttCode")
                
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttName")) = .fields("PttName")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttRegNo")) = ToMyNumFmt(.fields("PttRegNo"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttRefName")) = clsPAT.mPttRefName_str
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IrcCount")) = ToMyNumFmt(.fields("IrcCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IrcAmtAftDisc_sum")) = ToMyNumFmt(.fields("IrcAmtAftDisc_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IrcBalAmt_sum")) = ToMyNumFmt(.fields("IrcBalAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IrcAdvAmt_sum")) = ToMyNumFmt(.fields("IrcAdvAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IrcRecdAmt_sum")) = ToMyNumFmt(.fields("IrcRecdAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IrcDepoAmt_sum")) = ToMyNumFmt(.fields("IrcDepoAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IrcRefuAmt_sum")) = ToMyNumFmt(.fields("IrcRefuAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IrcDiscAmt_sum")) = ToMyNumFmt(.fields("IrcDiscAmt_sum"))
                
            End If
        
        ElseIf optDetailed.Value = True Then
            clsPCG.GetData .fields("PttPcgCode")
            clsARA.GetData .fields("PttAraCode")
            clsSTN.GetData .fields("PttStnCode")
            clsVTM.GetData .fields("IhrVtmCode")
            
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("tIrcSmryId")) = Format(.fields("IhrDate"), "yyyymmdd") & Format(.fields("IhrCode"), "0000000")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IrcCode")) = .fields("IhrCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("VtmName")) = clsVTM.mName_str
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IrcVchNo")) = .fields("IhrVchNo")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IrcDate")) = Dtoc(.fields("IhrDate"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IrcAmtAftDisc")) = ToMyNumFmt(.fields("IhrAmtAftDisc"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IrcBalAmt")) = ToMyNumFmt(.fields("IhrBalAmt"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IrcAdvAmt")) = ToMyNumFmt(.fields("IhrAdvAmt"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IrcRecdAmt")) = ToMyNumFmt(.fields("IhrRecdAmt"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IrcDepoAmt")) = ToMyNumFmt(.fields("IhrDepoAmt"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IrcRefuAmt")) = ToMyNumFmt(.fields("IhrRefuAmt"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IrcDiscAmt")) = ToMyNumFmt(.fields("IhrDiscAmt"))
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
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("tIrcSmryId"), mText
    ElseIf optMonthwise.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("IrcYrMonth"), mText
    ElseIf optDatewise.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("IrcDateYMD"), mText
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

Private Sub txtSDctName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtSDctName_Change
End If

End Sub

Private Sub txtSearch1Text_GotFocus()
FlashActiveControl txtSearch1Text, True
End Sub

Private Sub txtSdcFlag_KeyPress(KeyAscii As Integer)
If KeyAscii = vbKeyReturn And Val(fcmbSrvName.BoundText) > 0 And mIrcPttCode > 0 And mIrcIpgCode > 0 Then
    clsSRV.GetData Val(fcmbSrvName.BoundText)
    If clsSRV.mSrvMultiDctIncl_bln = True Then
        ShowSdcDtlData mIrcCode, Val(mskIrcICode.Text)
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
        fcmbDrlName.BoundText = CStr(GetValueFromTableCol(cnn:=dbVgnDatabase, mTableName:="DoctMast", mColumnName:="DctDrlCode", mFilterCond:="DctCode = " & CStr(Val(fcmbSDctName.BoundText)), mRtnDefValue:=0))
        txtDrlName.Text = fcmbDrlName.Text
    End If

End If
Call ValidSdcDtl

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
    If Val(fcmbSrvName.BoundText) <> mIrcSrvCode_old Or dtlAddMode = True Then
        'clsSRV.GetData Val(fcmbSrvName.BoundText)
        'mskIrcRate.Text = ToMyNumFmt(clsSRV.mSrvRate_dbl)
        'If Val(UnMyPerFmt(mskIrcPttDiscPer.Text)) = 0 Then
        '    mskIrcDiscPer.Text = ToMyPerFmt(clsSRV.mSrvDiscPer_dbl)
        'End If
        Call ChkServRate
        Call CalcIrcChg
        Call ChkIrcICode
    End If
    Call ValidDtl
End If

End Sub

Private Sub ChkIrcICode()
If mIrcCode <> 0 And mIrcPttCode <> 0 And mIrcIpgCode <> 0 Then
    If dtlAddMode = True And Val(fcmbSrvName.BoundText) > 0 And Val(fcmbSrvName.BoundText) <> mIrcSrvCode_old Then          ''' And Val(mskIrcICode.Text) = 0
        Rem mskIrcICode.Text = clsIRC.GetDtlTranUnqCode()
        
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
Dim mIrcRate As Double, mIrcDiscPer As Double, mIrcInfByPer As Double, mIrcDefByPer As Double

clsIPG.GetData Val(UnMyNumFmt(mskIrcIpgCode.Text))
clsPAT.GetData clsIPG.mIpgPttCode_lng
If Val(fcmbSrvName.BoundText) <> mIrcSrvCode_old Or mIpgCDctCode_old <> clsIPG.mIpgCDctCode_lng Or mPttPcgCode_old <> clsPAT.mPttPcgCode_lng Or mIpgRByCode_old <> clsIPG.mIpgRByCode_lng Or mIpgRToCode_old <> clsIPG.mIpgRToCode_lng Or mIrcDate_old <> Ctod(dtpIrcDate.Text) Or mIrcTime_old <> TimeToMin(txtIrcTime_str) Or FormAddEditMode = cFORM_ADDMODE Then
    GetServRateValues cnn:=dbVgnDatabase, mSrvCode:=Val(fcmbSrvName.BoundText), mTranDate:=Ctod(dtpIrcDate.Text), mTranTime:=TimeToMin(txtIrcTime_str.Text), mSrmPttCode:=mIrcPttCode, mSrmDctCode:=clsIPG.mIpgCDctCode_lng, mSrmPcgCode:=clsPAT.mPttPcgCode_lng, mSrmRByCode:=clsIPG.mIpgRByCode_lng, mSrmRToCode:=0, mSrmRate:=mIrcRate, mSrmDiscPer:=mIrcDiscPer, mSrmInfByPer:=mIrcInfByPer, mSrmDefByPer:=mIrcDefByPer
'    If mIrcDiscPer = 0 And clsPAT.mPttDiscAllowed_bln = True Then
'        mIrcDiscPer = clsPAT.mPttDiscPer_dbl
'    End If
    If mIrcDiscPer = 0 And Val(UnMyPerFmt(mskIrcPttDiscPer.Text)) <> 0 Then
        mIrcDiscPer = Val(UnMyPerFmt(mskIrcPttDiscPer.Text))
    End If
    If mIrcInfByPer <> 0 Then
         mIrcRate = mIrcRate + (mIrcRate * mIrcInfByPer / 100)
    ElseIf mIrcDefByPer <> 0 Then
        mIrcRate = mIrcRate - (mIrcRate * mIrcDefByPer / 100)
    End If
    mskIrcRate.Text = ToMyNumFmt(mIrcRate)
    mskIrcDiscPer.Text = ToMyPerFmt(mIrcDiscPer)
End If

End Sub

Private Sub CalcIrcChg()
Dim mIrcUnit As Long, mIrcRate As Double, mIrcAmtBefDisc As Double, mIrcDiscPer As Double, mIrcDiscAmt As Double, mIrcAmtAftDisc As Double
mIrcUnit = Val(UnMyNumFmt(mskIrcUnit.Text))
mIrcRate = Val(UnMyNumFmt(mskIrcRate.Text))
mIrcAmtBefDisc = mIrcUnit * mIrcRate
mIrcDiscPer = Val(UnMyPerFmt(mskIrcDiscPer.Text))
mIrcDiscAmt = Val(UnMyNumFmt(mskIrcDiscAmt.Text))
If mskIrcDiscPer.Tag = True Then
    mIrcDiscAmt = Round(mIrcAmtBefDisc * mIrcDiscPer / 100, 2)
ElseIf mskIrcDiscAmt.Tag = True Then
    If mIrcDiscAmt <> 0 And mIrcAmtBefDisc <> 0 Then
        mIrcDiscPer = Round(mIrcDiscAmt * 100 / mIrcAmtBefDisc, 2)
    Else
        mIrcDiscPer = 0
    End If
ElseIf dtlAddMode = True Then
    mIrcDiscAmt = Round(mIrcAmtBefDisc * mIrcDiscPer / 100, 2)
End If
mIrcAmtAftDisc = mIrcAmtBefDisc - mIrcDiscAmt
' --------
mskIrcAmtBefDisc.Text = ToMyNumFmt(mIrcAmtBefDisc)
mskIrcDiscPer.Text = ToMyPerFmt(mIrcDiscPer)
mskIrcDiscAmt.Text = ToMyNumFmt(mIrcDiscAmt)
mskIrcAmtAftDisc.Text = ToMyNumFmt(mIrcAmtAftDisc)

End Sub

Private Sub ShowOldIrcCodeDesc(ByVal mOldIrcCode As Long)
Dim tRecset As New ADODB.Recordset

With tRecset
.open "Select * from IndrHdr where IhrCode=" & CStr(mOldIrcCode) & "", dbVgnDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    clsVTM.GetData .fields("IhrVtmCode")
    lblOldIrcCodeDesc.Caption = RTrim(clsVTM.mName_str) & " No.:" & CStr(.fields("IhrVchNo")) & " Dated:" & Dtoc(.fields("IhrDate"))
Else
    lblOldIrcCodeDesc.Caption = "#" & CStr(mOldIrcCode) & "#"
End If
End With
CloseTable tRecset

End Sub

Private Function GetOldIrcCodeFromPttCode(ByVal mPttCode As Long) As Long
Dim tRecset As New ADODB.Recordset

With tRecset
.open "Select top 1 * from IndrHdr where IhrPttCode=" & CStr(mPttCode) & " order by IhrDate desc,IhrVchNo desc,IhrCode desc", dbVgnDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    GetOldIrcCodeFromPttCode = .fields("IhrCode")
Else
    GetOldIrcCodeFromPttCode = 0
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

Private Sub ShowPttDiscPer(ByVal mPttCode As Long)
Dim tRecset As New ADODB.Recordset

With tRecset
.open "Select * from PatMast where PttCode=" & CStr(mPttCode) & "", dbVgnDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    If .fields("PttDiscAllowed") = True And .fields("PttDiscPer") > 0 Then
        'mskIrcPttDiscPer.Text = ToMyPerFmt(.fields("PttDiscPer"))
        'Call CalcIrcChg
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
        fcmbAdmIpgByIpgNo.UserText = Array("", 0)
        fcmbAdmIpgByIpgNo.Show
        If FormAddEditMode = cFORM_ADDMODE And fcmbAdmIpgByIpgNo.ListSelected = True And Val(fcmbAdmIpgByIpgNo.BoundText) > 0 Then
            mOldIpgCode = Val(fcmbAdmIpgByIpgNo.BoundText)
            tRecset.open "Select * from IndrReg where IpgCode=" & CStr(mOldIpgCode) & "", dbVgnDatabase, adOpenKeyset, adLockOptimistic
            If tRecset.RecordCount > 0 Then
                mOldIpgPttCode = tRecset.fields("IpgPttCode")
            End If
            CloseTable tRecset
            If mOldIpgCode > 0 And mOldIpgPttCode > 0 Then
                mIrcPttCode = mOldIpgPttCode
                ShowPatData mIrcPttCode
                Call StorePatOldData
                ShowPttDiscPer mIrcPttCode
                
                mIrcIpgCode = mOldIpgCode
                ShowIpgData mIrcIpgCode
                Call StoreIpgOldData
                
                mIrcOldIrcCode = GetOldIrcCodeFromPttCode(mIrcPttCode)
                ShowOldIrcCodeDesc mIrcOldIrcCode
            End If
        Else
            If FormAddEditMode = cFORM_EDITMODE And fcmbAdmIpgByIpgNo.ListSelected = True And Val(fcmbAdmIpgByIpgNo.BoundText) > 0 Then
                AlertBox "Prohibited in Edit Mode !!!"
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
        If FormAddEditMode = cFORM_ADDMODE And fcmbAdmIpgByPttRegNo.ListSelected = True And Val(fcmbAdmIpgByPttRegNo.BoundText) > 0 Then
            mOldIpgCode = Val(fcmbAdmIpgByPttRegNo.LFieldValue("IpgCode"))
            tRecset.open "Select * from IndrReg where IpgCode=" & CStr(mOldIpgCode) & "", dbVgnDatabase, adOpenKeyset, adLockOptimistic
            If tRecset.RecordCount > 0 Then
                mOldIpgPttCode = tRecset.fields("IpgPttCode")
            End If
            CloseTable tRecset
            If mOldIpgCode > 0 And mOldIpgPttCode > 0 Then
                mIrcPttCode = mOldIpgPttCode
                ShowPatData mIrcPttCode
                Call StorePatOldData
                ShowPttDiscPer mIrcPttCode
                
                mIrcIpgCode = mOldIpgCode
                ShowIpgData mIrcIpgCode
                Call StoreIpgOldData
                
                mIrcOldIrcCode = GetOldIrcCodeFromPttCode(mIrcPttCode)
                ShowOldIrcCodeDesc mIrcOldIrcCode
            End If
        Else
            If FormAddEditMode = cFORM_EDITMODE And fcmbAdmIpgByPttRegNo.ListSelected = True And Val(fcmbAdmIpgByPttRegNo.BoundText) > 0 Then
                AlertBox "Prohibited in Edit Mode !!!"
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
        If FormAddEditMode = cFORM_ADDMODE And fcmbAdmIpgByPttName.ListSelected = True And Val(fcmbAdmIpgByPttName.BoundText) > 0 Then
            mOldIpgCode = Val(fcmbAdmIpgByPttName.LFieldValue("IpgCode"))
            tRecset.open "Select * from IndrReg where IpgCode=" & CStr(mOldIpgCode) & "", dbVgnDatabase, adOpenKeyset, adLockOptimistic
            If tRecset.RecordCount > 0 Then
                mOldIpgPttCode = tRecset.fields("IpgPttCode")
            End If
            CloseTable tRecset
            If mOldIpgCode > 0 And mOldIpgPttCode > 0 Then
                mIrcPttCode = mOldIpgPttCode
                ShowPatData mIrcPttCode
                Call StorePatOldData
                ShowPttDiscPer mIrcPttCode
                
                mIrcIpgCode = mOldIpgCode
                ShowIpgData mIrcIpgCode
                Call StoreIpgOldData
                
                mIrcOldIrcCode = GetOldIrcCodeFromPttCode(mIrcPttCode)
                ShowOldIrcCodeDesc mIrcOldIrcCode
            End If
        Else
            If FormAddEditMode = cFORM_EDITMODE And fcmbAdmIpgByPttName.ListSelected = True And Val(fcmbAdmIpgByPttName.BoundText) > 0 Then
                AlertBox "Prohibited in Edit Mode !!!"
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
    mskIrcSno.Top = mRowPos
    txtSrvName.Top = mRowPos
    txtSdcFlag.Top = mRowPos
    mskIrcUnit.Top = mRowPos
    mskIrcRate.Top = mRowPos
    mskIrcAmtBefDisc.Top = mRowPos
    mskIrcDiscPer.Top = mRowPos
    mskIrcDiscAmt.Top = mRowPos
    mskIrcAmtAftDisc.Top = mRowPos
    cmdOK.Top = mRowPos
End If

mskIrcICode.Text = 0
mskIrcSno.Text = 0
txtSrvName.Text = "": fcmbSrvName.BoundText = ""
txtSdcFlag.Text = ""
mskIrcUnit.Text = ToMyNumFmt(0, mDecimals:=0)
mskIrcRate.Text = ToMyNumFmt(0)
mskIrcAmtBefDisc.Text = ToMyNumFmt(0)
mskIrcDiscPer.Text = ToMyPerFmt(0)
mskIrcDiscAmt.Text = ToMyNumFmt(0)
mskIrcAmtAftDisc.Text = ToMyNumFmt(0)

Call ValidDtl

mskIrcICode.Visible = False     '''  mShowItem
mskIrcSno.Visible = mShowItem
txtSrvName.Visible = mShowItem
txtSdcFlag.Visible = mShowItem
mskIrcUnit.Visible = mShowItem
mskIrcRate.Visible = mShowItem
mskIrcAmtBefDisc.Visible = mShowItem
mskIrcDiscPer.Visible = mShowItem
mskIrcDiscAmt.Visible = mShowItem
mskIrcAmtAftDisc.Visible = mShowItem
cmdOK.Visible = mShowItem

frHeader.Enabled = (mShowItem = False)
Mfgrd2.Enabled = (mShowItem = False)
frFooter.Enabled = (mShowItem = False)
cmdSaveForm.Enabled = (mShowItem = False)

End Sub

Private Sub ValidDtl()
Dim mDataOk As Boolean, srow As Integer
srow = Mfgrd2.Row
mDataOk = (mIrcPttCode > 0 And mIrcIpgCode > 0 And frSdcDtl.Visible = False And Val(UnMyNumFmt(mskIrcSno.Text)) > 0 And Val(fcmbSrvName.BoundText) > 0 And Val(UnMyNumFmt(mskIrcUnit.Text)) > 0 And Val(UnMyNumFmt(mskIrcRate.Text)) > 0 And Val(UnMyNumFmt(mskIrcAmtBefDisc.Text)) > 0 And Val(UnMyNumFmt(mskIrcAmtAftDisc.Text)) >= 0)
If dtlAddEditMode = True And dtlAddMode = False And mDataOk = True And InterActiveChange(cmdOK) = True Then
    clsSRV.GetData Val(fcmbSrvName.BoundText)
    If clsSRV.mSrvMultiDctIncl_bln = False Then
        If GetServDctDtlCount(cnn:=dbVgnDatabase, mTableName:="IndrRcDctDtl", mSdcCodeField:="IrdCode", mSdcCode:=mIrcCode, mSdcSubCodeField:="IrdIrcCode", mSdcSubCode:=Val(mskIrcICode.Text)) > 0 Then
            ErrorBox "Service Doctor Detail Exist !!!"
            mDataOk = False
        End If
    End If
End If

cmdOK.Caption = IIf(mDataOk = True, "&OK", "&Cancel")
cmdOK.BackColor = IIf(mDataOk = True, &H80FF80, &H8080FF)
End Sub

Private Sub CalcFtrTotal(Optional ByVal mCalcBalOnly As Boolean = False)
Dim mIrcUnitTot As Double, mIrcAmtBefDiscTot As Double, mIrcDiscAmtTot As Double, mIrcAmtAftDiscTot As Double, mIrcAdvAmtTot As Double, mIrcRecdAmtTot As Double, mIrcDepoAmtTot As Double, mIrcRefuAmtTot As Double, mIrcBalAmtTot As Double

If mCalcBalOnly = False Then
    mIrcUnitTot = FlexColSum(Mfgrd2, X2IRCUNIT_COL)
    mIrcAmtBefDiscTot = FlexColSum(Mfgrd2, X2IRCAMTBEFDISC_COL)
    mIrcDiscAmtTot = FlexColSum(Mfgrd2, X2IRCDISCAMT_COL)
    mIrcAmtAftDiscTot = FlexColSum(Mfgrd2, X2IRCAMTAFTDISC_COL)
Else
    mIrcUnitTot = Val(UnMyNumFmt(lblIrcUnitTot.Caption))
    mIrcAmtBefDiscTot = Val(UnMyNumFmt(lblIrcAmtBefDiscTot.Caption))
    mIrcDiscAmtTot = Val(UnMyNumFmt(lblIrcDiscAmtTot.Caption))
    mIrcAmtAftDiscTot = Val(UnMyNumFmt(lblIrcAmtAftDiscTot.Caption))
End If

mIrcAdvAmtTot = Val(UnMyNumFmt(mskIrcAdvAmtTot.Text))
mIrcRecdAmtTot = Val(UnMyNumFmt(mskIrcRecdAmtTot.Text))
mIrcDepoAmtTot = Val(UnMyNumFmt(mskIrcDepoAmtTot.Text))
mIrcRefuAmtTot = Val(UnMyNumFmt(mskIrcRefuAmtTot.Text))
If mCalcBalOnly = False Then
    If mIrcRecdAmtTot > (mIrcAmtAftDiscTot - mIrcAdvAmtTot - mIrcDepoAmtTot) Then
        mIrcRecdAmtTot = (mIrcAmtAftDiscTot - mIrcAdvAmtTot - mIrcDepoAmtTot)
    ElseIf FormAddEditMode = cFORM_ADDMODE Then
        mIrcRecdAmtTot = mIrcAmtAftDiscTot
    End If
    mskIrcRecdAmtTot.Text = ToMyNumFmt(mIrcRecdAmtTot)
End If
mIrcBalAmtTot = (mIrcAmtAftDiscTot - (mIrcAdvAmtTot + mIrcRecdAmtTot + mIrcDepoAmtTot))

If mCalcBalOnly = False Then
    lblIrcUnitTot.Caption = ToMyNumFmt(mIrcUnitTot, mDecimals:=0)
    lblIrcAmtBefDiscTot.Caption = ToMyNumFmt(mIrcAmtBefDiscTot)
    lblIrcDiscAmtTot.Caption = ToMyNumFmt(mIrcDiscAmtTot)
    lblIrcAmtAftDiscTot.Caption = ToMyNumFmt(mIrcAmtAftDiscTot)
End If
mskIrcBalAmtTot.Text = ToMyNumFmt(mIrcBalAmtTot)

End Sub

'''Private Sub DisperseRecdAmt(ByVal mIrcCode As Long)
'''Dim tRecset As New ADODB.Recordset, mRecdAmtBal As Double, mReqdRecdAmt As Double
'''
'''mRecdAmtBal = Val(UnMyNumFmt(mskIrcRecdAmtTot.Text))
'''
'''With tRecset
'''.Open "Select * from IndrRcpt where IrcCode=" & CStr(mIrcCode) & " order by IrcSno", dbVgnDatabase, adOpenKeyset, adLockOptimistic
'''If .RecordCount > 0 Then
'''    dbVgnDatabase.BeginTrans
'''    Do While .EOF = False
'''        If InList(.Fields("IrcRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
'''            'mReqdRecdAmt = .Fields("IrcAmtAftDisc") - .Fields("IrcAdvAmt") - .Fields("IrcDepoAmt") - .Fields("IrcRefuAmt")
'''            mReqdRecdAmt = .Fields("IrcAmtAftDisc") - (.Fields("IrcAdvAmt") + .Fields("IrcDepoAmt"))
'''            If mRecdAmtBal > 0 Then
'''                If Not mRecdAmtBal >= mReqdRecdAmt Then
'''                    mReqdRecdAmt = mRecdAmtBal
'''                End If
'''                .Fields("IrcRecdAmt") = mReqdRecdAmt
'''                .Fields("IrcBalAmt") = .Fields("IrcAmtAftDisc") - (.Fields("IrcAdvAmt") + .Fields("IrcDepoAmt")) + .Fields("IrcRefuAmt") - mReqdRecdAmt
'''                .Update
'''
'''                mRecdAmtBal = mRecdAmtBal - mReqdRecdAmt
'''            Else
'''                .Fields("IrcRecdAmt") = 0
'''                .Fields("IrcBalAmt") = .Fields("IrcAmtAftDisc") - (.Fields("IrcAdvAmt") + .Fields("IrcDepoAmt")) + .Fields("IrcRefuAmt")
'''                .Update
'''            End If
'''        Else
'''            If InList(.Fields("IrcRecState"), Array(cREC_CANCELED, cREC_DELETED)) = False Then
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
.open "Select IndrPymtDtl.*,IndrPymtHdr.IphVtmCode,IndrPymtHdr.IphVchNo from IndrPymtDtl inner join IndrPymtHdr on IndrPymtDtl.IpyCode=IndrPymtHdr.IphCode where IpyIhrCode=" & CStr(mIrcCode) & " order by IpyDate", dbVgnDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Do While .EOF = False
        clsVTM.GetData .fields("IphVtmCode")
        mLinkTranStr = mLinkTranStr & clsVTM.mName_str & " No." & CStr(.fields("IphVchNo")) & " Dated " & Dtoc(.fields("IpyDate")) & " Rs." & ToMyNumFmt(.fields("IpyDepoAmt")) & vbCrLf
        
        .MoveNext
    Loop
End If
End With
CloseTable tRecset

With tRecset
.open "Select IndrRefdDtl.*,IndrRefdHdr.IfhVtmCode,IndrRefdHdr.IfhVchNo from IndrRefdDtl inner join IndrRefdHdr on IndrRefdDtl.IfdCode=IndrRefdHdr.IfhCode where IfdIhrCode=" & CStr(mIrcCode) & " order by IfdDate", dbVgnDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Do While .EOF = False
        clsVTM.GetData .fields("IfhVtmCode")
        mLinkTranStr = mLinkTranStr & clsVTM.mName_str & " No." & CStr(.fields("IfhVchNo")) & " Dated " & Dtoc(.fields("IfdDate")) & " Rs." & ToMyNumFmt(.fields("IfdRefuAmt")) & vbCrLf
        
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
Dim srow As Integer, mIrdICode As Long, mIrdIrcCode As Long, mDeleteit As Boolean
srow = Mfgrd3.Row
mIrdICode = Val(Mfgrd3.TextMatrix(srow, X3IRDICODE_COL))
mIrdIrcCode = Val(Mfgrd2.TextMatrix(Mfgrd2.Row, X2IRCICODE_COL))

If MyDeleteKey(Shift, KeyCode, mCheckCtrlMask:=False) = True And mIrdICode > 0 Then
    mDeleteit = True
    If mDeleteit = True Then
        mDeleteit = CanDelete()
    End If
    If mDeleteit = True Then
        clsIRC.DeleteSdc mIrcCode, mIrdIrcCode, mIrdICode
        
        ShowSdcDtlData mIrcCode, mIrdIrcCode
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
        mskIrdSno.Text = ToMyNumFmt(FlexNextSeqno(Mfgrd3, X3IRDSNO_COL), mDecimals:=0)
    Else
        mskIrdSno.Text = Mfgrd3.TextMatrix(srow, X3IRDSNO_COL)
        fcmbSDctName.BoundText = Mfgrd3.TextMatrix(srow, X3IRDDCTCODE_COL): txtSDctName.Text = fcmbSDctName.Text
        fcmbDrlName.BoundText = Mfgrd3.TextMatrix(srow, X3IRDDRLCODE_COL): txtDrlName.Text = fcmbDrlName.Text
        txtIrdRemark.Text = Mfgrd3.TextMatrix(srow, X3IRDREMARK_COL)
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
    mskIrdSno.Top = mRowPos
    txtSDctName.Top = mRowPos
    txtDrlName.Top = mRowPos
    txtIrdRemark.Top = mRowPos
    cmdSdcOK.Top = mRowPos
End If

mskIrdSno.Text = 0
txtSDctName.Text = "": fcmbSDctName.BoundText = ""
txtDrlName.Text = "": fcmbDrlName.BoundText = ""
txtIrdRemark.Text = ""

Call ValidSdcDtl

mskIrdSno.Visible = mShowItem
txtSDctName.Visible = mShowItem
txtDrlName.Visible = mShowItem
txtIrdRemark.Visible = mShowItem
cmdSdcOK.Visible = mShowItem

Mfgrd3.Enabled = (mShowItem = False)

End Sub

Private Sub ValidSdcDtl()
Dim mDataOk As Boolean, srow As Integer
srow = Mfgrd3.Row
mDataOk = (Val(fcmbSrvName.BoundText) > 0 And mIrcPttCode > 0 And mIrcIpgCode > 0 And Val(UnMyNumFmt(mskIrdSno.Text)) > 0 And Val(fcmbSDctName.BoundText) > 0 And Val(fcmbDrlName.BoundText) > 0)
cmdSdcOK.Caption = IIf(mDataOk = True, "&OK", "&Cancel")
cmdSdcOK.BackColor = IIf(mDataOk = True, &H80FF80, &H8080FF)
End Sub

Private Sub ShowSdcDtlData(ByVal mIrdCode As Long, ByVal mIrdIrcCode As Long)
Dim srow As Integer, tRecset As New ADODB.Recordset, mColCnt As Integer

srow = 1
Mfgrd3.Rows = 2

With tRecset
.open "Select * from IndrRcDctDtl where IrdCode=" & CStr(mIrdCode) & " and IrdIrcCode=" & CStr(mIrdIrcCode) & " order by IrdSno", dbVgnDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Do While .EOF = False
        If InList(.fields("IrdRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
            clsDCT.GetData .fields("IrdDctCode")
            clsDRL.GetData .fields("IrdDrlCode")
            
            Mfgrd3.TextMatrix(srow, X3IRDICODE_COL) = .fields("IrdICode")
            Mfgrd3.TextMatrix(srow, X3IRDSNO_COL) = ToMyNumFmt(.fields("IrdSno"), mDecimals:=0)
            Mfgrd3.TextMatrix(srow, X3DCTNAME_COL) = clsDCT.mName_str
            Mfgrd3.TextMatrix(srow, X3DRLNAME_COL) = clsDRL.mName_str
            Mfgrd3.TextMatrix(srow, X3IRDREMARK_COL) = .fields("IrdRemark")
            Mfgrd3.TextMatrix(srow, X3IRDDCTCODE_COL) = .fields("IrdDctCode")
            Mfgrd3.TextMatrix(srow, X3IRDDRLCODE_COL) = .fields("IrdDrlCode")
            Mfgrd3.TextMatrix(srow, X3IRDRECSTATE_COL) = .fields("IrdRecState")
            
            Mfgrd3.Rows = Mfgrd3.Rows + 1
            srow = srow + 1
        Else
            If InList(.fields("IrdRecState"), Array(cREC_CANCELED, cREC_DELETED)) = False Then
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
Dim mIrcVchNo As Long

If Val(fcmbIrcVtmName.BoundText) < 1 Then
    ErrorBox "Invalid Voucher Type !!!"
    txtIrcVtmName(1).SetFocus
    Exit Sub
End If
If Val(UnMyNumFmt(mskIrcVchNo(1).Text)) < 1 Then
    ErrorBox "Invalid Voucher No. !!!"
    mskIrcVchNo(1).SetFocus
    Exit Sub
Else
    mIrcVchNo = Val(UnMyNumFmt(mskIrcVchNo(1).Text))
    If ChkIsExistVTypeNo(dbVgnDatabase, mTableName:="IndrHdr", mChkFieldName:="IhrVchNo", mChkFieldValue:=CStr(mIrcVchNo), mVtmFieldName:="IhrVtmCode", mVtmFieldValue:=Val(fcmbIrcVtmName.BoundText), mFinYrFieldName:="IhrCmpCode", mFinYrFieldValue:=sFinYrCmpCode) = False Then
        ErrorBox "Voucher No. does not Exist !!!"
        mskIrcVchNo(1).SetFocus
        Exit Sub
    End If
End If
If Val(UnMyNumFmt(mskIrcVchNo(2).Text)) < 1 Then
    ErrorBox "Invalid Voucher No. !!!"
    mskIrcVchNo(2).SetFocus
    Exit Sub
Else
    mIrcVchNo = Val(UnMyNumFmt(mskIrcVchNo(2).Text))
    If ChkIsExistVTypeNo(dbVgnDatabase, mTableName:="IndrHdr", mChkFieldName:="IhrVchNo", mChkFieldValue:=CStr(mIrcVchNo), mVtmFieldName:="IhrVtmCode", mVtmFieldValue:=Val(fcmbIrcVtmName.BoundText), mFinYrFieldName:="IhrCmpCode", mFinYrFieldValue:=sFinYrCmpCode) = False Then
        ErrorBox "Voucher No. does not Exist !!!"
        mskIrcVchNo(2).SetFocus
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
Dim mFromIrcVchNo As Long, mToIrcVchNo As Long, mIrcVtmCode As Long
Dim fCRView As Form

mFromIrcVchNo = Val(UnMyNumFmt(mskIrcVchNo(1).Text))
mToIrcVchNo = Val(UnMyNumFmt(mskIrcVchNo(2).Text))
mIrcVtmCode = Val(fcmbIrcVtmName.BoundText)

frmMain.Cryst.Reset
frmMain.Cryst.ReportFileName = Trim(Right(cmbCRList.List(cmbCRList.ListIndex), 100))
frmMain.Cryst.DiscardSavedData = True
frmMain.Cryst.DataFiles(0) = dbComDatabaseFullPath

frmMain.Cryst.SelectionFormula = "{vewIndrRcpt.IhrVchNo}>=" & CStr(mFromIrcVchNo) & " and {vewIndrRcpt.IhrVchNo}<=" & CStr(mToIrcVchNo) & " and {vewIndrRcpt.IhrVtmCode}=" & CStr(mIrcVtmCode) & " and {vewIndrRcpt.IhrCmpCode}=" & CStr(sFinYrCmpCode)
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
        fcmbIrcVtmName.BoundText = CStr(datRecset.fields("IhrVtmCode"))
        txtIrcVtmName(1).Text = fcmbIrcVtmName.Text
        mskIrcVchNo(1).Text = datRecset.fields("IhrVchNo")
        mskIrcVchNo(2).Text = datRecset.fields("IhrVchNo")
        ' ----------------
        Call AssignPrintPara
        frPrintCRList.ZOrder
        frPrintCRList.Visible = True
        Mfgrd1.Enabled = False
        cmbPrintDest.SetFocus
    End If
    
ElseIf mCallSource = "SaveEvent" Then
    txtIrcVtmName(1).Text = fcmbIrcVtmName.Text
    mskIrcVchNo(1).Text = CStr(Val(UnMyNumFmt(mskIrcVchNo(0).Text)))
    mskIrcVchNo(2).Text = CStr(Val(UnMyNumFmt(mskIrcVchNo(0).Text)))
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

If Dir(IndrRcptCRLFileFullPath) = "" Then
    fhand = FreeFile
    Open IndrRcptCRLFileFullPath For Output As #fhand
    Write #fhand, "Indoor Receipt", "IndrRcpt.Rpt", True
    Close #fhand
End If

cmbCRList.Clear
fhand = FreeFile
Open IndrRcptCRLFileFullPath For Input As #fhand
Do While EOF(fhand) = False
    Input #fhand, mCRLTitle, mCRLFileName, mCRLDefault
    If Dir(IndrRcptCRLFileFullPath(mFileName:=mCRLFileName)) <> "" Then
        cmbCRList.AddItem mCRLTitle & Space(100) & IndrRcptCRLFileFullPath(mFileName:=mCRLFileName)
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

