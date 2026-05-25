VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmLabRefdRcpt 
   Appearance      =   0  'Flat
   AutoRedraw      =   -1  'True
   BackColor       =   &H80000005&
   ClientHeight    =   10860
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
   ScaleHeight     =   10860
   ScaleWidth      =   14520
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
      ItemData        =   "LabRfRc.frx":0000
      Left            =   0
      List            =   "LabRfRc.frx":000D
      Style           =   1  'Simple Combo
      TabIndex        =   53
      TabStop         =   0   'False
      Text            =   "cmbFormEntryMode"
      Top             =   360
      Width           =   1455
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   120
      Top             =   10545
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
            TextSave        =   "12:00"
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
      Height          =   9615
      Left            =   120
      TabIndex        =   52
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
         TabIndex        =   48
         Top             =   9240
         Width           =   375
      End
      Begin VB.TextBox mskLrcRefuAmtExcl 
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
         Left            =   8640
         TabIndex        =   44
         Text            =   "0.00"
         Top             =   6000
         Width           =   1215
      End
      Begin VB.TextBox mskLrcAdvAmt 
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
      Begin VB.TextBox mskLrcBalAmt 
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
      Begin VB.TextBox mskLrcDepoAmt 
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
      Begin VB.TextBox mskLrcRecdAmt 
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
         Left            =   3840
         TabIndex        =   40
         Text            =   "0.00"
         Top             =   6000
         Width           =   1215
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
         Left            =   2400
         MaxLength       =   50
         TabIndex        =   39
         TabStop         =   0   'False
         Text            =   "dd/mm/yyyy"
         Top             =   6000
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
         TabIndex        =   109
         Top             =   7680
         Width           =   12975
         Begin VB.Label lblLrcRefuAmtExclTot 
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
            TabIndex        =   119
            Top             =   240
            Width           =   1215
         End
         Begin VB.Label lblLrcAdvAmtTot 
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
            TabIndex        =   118
            Top             =   240
            Width           =   1215
         End
         Begin VB.Label lblLrcBalAmtTot 
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
            TabIndex        =   117
            Top             =   240
            Width           =   1215
         End
         Begin VB.Label lblLfdRefuAmtTot 
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
            TabIndex        =   116
            Top             =   240
            Width           =   1215
         End
         Begin VB.Label lblLrcDepoAmtTot 
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
            TabIndex        =   115
            Top             =   240
            Width           =   1215
         End
         Begin VB.Label lblLrcRecdAmtTot 
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
            TabIndex        =   114
            Top             =   240
            Width           =   1215
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Last OPD Refd:"
            BeginProperty Font 
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
            TabIndex        =   113
            Top             =   1440
            Width           =   1575
         End
         Begin VB.Label lblOldLfdCodeDesc 
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
            Left            =   1680
            TabIndex        =   112
            Top             =   1440
            Width           =   6375
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
            TabIndex        =   111
            Top             =   240
            Visible         =   0   'False
            Width           =   3495
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
            Left            =   3720
            TabIndex        =   110
            Top             =   240
            Width           =   1215
         End
      End
      Begin VB.TextBox mskLfdSno 
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
         Height          =   4995
         Left            =   120
         TabIndex        =   85
         Top             =   240
         Width           =   12975
         Begin VB.TextBox mskLfdLhrCode 
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
            Left            =   3540
            TabIndex        =   1
            Tag             =   "AhCode"
            Text            =   "-1"
            Top             =   240
            Width           =   1455
         End
         Begin VB.TextBox txtLhrRemark 
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
            Left            =   7380
            MaxLength       =   50
            TabIndex        =   28
            TabStop         =   0   'False
            Top             =   3720
            Width           =   5295
         End
         Begin VB.TextBox txtLhrVtmName 
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
            Width           =   1935
         End
         Begin VB.TextBox mskLhrVchNo 
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
         Begin VB.TextBox txtLhrPrefix 
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
            Left            =   4920
            TabIndex        =   21
            TabStop         =   0   'False
            Tag             =   "AhCode"
            Text            =   "[Prefix]"
            Top             =   3000
            Width           =   1095
         End
         Begin VB.TextBox dtpLhrDate 
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
         Begin VB.TextBox txtLhrTime_str 
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
         Begin VB.TextBox txtLfdTime_str 
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
            Left            =   10560
            MaxLength       =   50
            TabIndex        =   33
            TabStop         =   0   'False
            Text            =   "00:00"
            Top             =   4260
            Width           =   855
         End
         Begin VB.TextBox dtpLfdDate 
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
            Left            =   8280
            MaxLength       =   50
            TabIndex        =   32
            Text            =   "dd/mm/yyyy"
            Top             =   4260
            Width           =   1455
         End
         Begin VB.TextBox mskLfdVchNo 
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
            Text            =   "0"
            Top             =   4260
            Width           =   1455
         End
         Begin VB.TextBox txtLfdVtmName 
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
            Top             =   4260
            Width           =   1815
         End
         Begin VB.TextBox txtLfdPrefix 
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
            Top             =   4260
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
            Left            =   9000
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
            Left            =   11280
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
            Left            =   9000
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
            Left            =   9000
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
            Left            =   9000
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
            Left            =   11280
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
            Left            =   9000
            MaxLength       =   50
            TabIndex        =   10
            TabStop         =   0   'False
            Text            =   "dd/mm/yyyy"
            Top             =   1080
            Width           =   1455
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
            Left            =   7380
            MaxLength       =   50
            TabIndex        =   26
            TabStop         =   0   'False
            Top             =   3360
            Width           =   5295
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
         Begin VB.TextBox mskLfdPttCode 
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
            Left            =   5100
            TabIndex        =   2
            Tag             =   "AhCode"
            Text            =   "-1"
            Top             =   240
            Width           =   1455
         End
         Begin VB.TextBox txtLfhRemark 
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
            Top             =   4620
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
            Left            =   6180
            TabIndex        =   134
            Top             =   3720
            Width           =   1095
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Rcpt. Type:"
            BeginProperty Font 
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
            TabIndex        =   133
            Top             =   3000
            Width           =   1935
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Rcpt No:"
            BeginProperty Font 
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
            Left            =   4080
            TabIndex        =   132
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
            TabIndex        =   131
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
            TabIndex        =   130
            Top             =   3000
            Width           =   495
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
            Left            =   7560
            TabIndex        =   108
            Top             =   4260
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
            Height          =   285
            Index           =   38
            Left            =   9960
            TabIndex        =   107
            Top             =   4260
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
            TabIndex        =   106
            Top             =   4260
            Width           =   855
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Refund Type:"
            BeginProperty Font 
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
            TabIndex        =   105
            Top             =   4260
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
            Height          =   285
            Index           =   0
            Left            =   120
            TabIndex        =   104
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
            Height          =   285
            Index           =   0
            Left            =   120
            TabIndex        =   103
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
            Height          =   285
            Index           =   5
            Left            =   7440
            TabIndex        =   102
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
            Height          =   285
            Index           =   6
            Left            =   120
            TabIndex        =   101
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
            Height          =   285
            Index           =   4
            Left            =   7440
            TabIndex        =   100
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
            Height          =   285
            Index           =   7
            Left            =   10560
            TabIndex        =   99
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
            Height          =   285
            Index           =   8
            Left            =   120
            TabIndex        =   98
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
            Left            =   120
            TabIndex        =   97
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
            Height          =   285
            Index           =   10
            Left            =   120
            TabIndex        =   96
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
            Height          =   285
            Index           =   11
            Left            =   7440
            TabIndex        =   95
            Top             =   1440
            Width           =   1455
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "SMS Mobile No.:"
            BeginProperty Font 
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
            Left            =   7440
            TabIndex        =   94
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
            Height          =   285
            Index           =   16
            Left            =   3360
            TabIndex        =   93
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
            Height          =   285
            Index           =   17
            Left            =   10800
            TabIndex        =   92
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
            Height          =   285
            Index           =   18
            Left            =   7440
            TabIndex        =   91
            Top             =   1080
            Width           =   615
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
            Height          =   285
            Index           =   24
            Left            =   6180
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
            Height          =   285
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
            Height          =   285
            Index           =   33
            Left            =   120
            TabIndex        =   87
            Top             =   4620
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
            Width           =   12975
         End
         Begin VB.Shape Shape1 
            BackColor       =   &H00FFFFC0&
            BackStyle       =   1  'Opaque
            Height          =   1275
            Index           =   1
            Left            =   0
            Top             =   2880
            Width           =   12975
         End
         Begin VB.Shape Shape1 
            BackColor       =   &H00FFFF80&
            BackStyle       =   1  'Opaque
            Height          =   855
            Index           =   2
            Left            =   0
            Top             =   4140
            Width           =   12975
         End
      End
      Begin VB.TextBox mskLrcVchNo 
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
      Begin VB.TextBox mskLfdRefuAmt 
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
         TabIndex        =   45
         Text            =   "0.00"
         Top             =   6000
         Width           =   1215
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd2 
         Height          =   2475
         Left            =   120
         TabIndex        =   35
         Top             =   5220
         Width           =   12975
         _ExtentX        =   22886
         _ExtentY        =   4366
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
         TabIndex        =   121
         Top             =   1200
         Width           =   5895
         Begin VB.ComboBox cmbPrinterList 
            Height          =   315
            Left            =   2160
            Style           =   2  'Dropdown List
            TabIndex        =   74
            Top             =   1680
            Width           =   3495
         End
         Begin VB.ComboBox cmbPrintDest 
            Height          =   315
            Left            =   2160
            Style           =   2  'Dropdown List
            TabIndex        =   76
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
            TabIndex        =   75
            Text            =   "0"
            Top             =   2040
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
         Begin VB.TextBox mskLfdVchNo 
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
         Begin VB.TextBox txtLfdVtmName 
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
         Begin VB.TextBox mskLfdVchNo 
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
            TabIndex        =   129
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
            TabIndex        =   128
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
            TabIndex        =   127
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
            TabIndex        =   126
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
            TabIndex        =   125
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
            TabIndex        =   124
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
            TabIndex        =   123
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
            TabIndex        =   122
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
         Width           =   13575
         _ExtentX        =   23945
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
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Lab Refund Receipt"
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
Attribute VB_Name = "frmLabRefdRcpt"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Dim mFormLoaded As Boolean, mLastKeyPressed As Integer, mMaskKeyPressed As Integer
Dim mFormUIdCode As Long, mFormUIdFileName As String, mFormAcsPermFileName As String
Dim mLfdCode As Long, mLfdLhrCode As Long, mLfdPttCode As Long, mQryPttCode As Long, mLfdOldLfdCode As Long, dtlAddEditMode As Boolean, dtlAddMode As Boolean, dtlEditCanceled As Boolean
Dim mRemoteAccess As Boolean, mEntrySaved As Boolean, mEntryAborted As Boolean
Dim dbAcDatabase As New ADODB.Connection, dbHmsDatabase As New ADODB.Connection, dbGrpDatabase As New ADODB.Connection, dbComDatabase As New ADODB.Connection
Dim datRecset As New ADODB.Recordset
Dim mPttRegNo_old As Long
Dim mLfdCode_old As Long, mLfdDate_old As Date, mLfdVtmCode_old As Long, mLfdVchNo_old As Long
Dim mLrcCode_old As Long, mLfdRefuAmt_old As Double
Dim clsJRN As clsJournal, clsAH As clsAccountHead, clsLRC As clsHmsLabMultiTranEntry, clsLFD As clsHmsLabMultiTranEntry, clsARA As clsComMastEntry, clsSTN As clsComMastEntry, clsVTM As clsComMastEntry, clsHOPT As clsHmsLabOptionsEntry      ''' clsLPG As clsHmsSnglTranEntry,
Dim clsPAT As clsHmsMasterEntry, clsPCG As clsHmsMasterEntry, clsDCT As clsHmsMasterEntry, clsDIG As clsHmsMasterEntry, clsSRV As clsHmsMasterEntry
Dim mActiveControl As Object, clsListStru As clsSelectQueryStructure
Dim fcmbLfdVtmName As clsComFlexSearch
Dim fcmbOldLhrByLhrNo As clsHmsFlexSearch, fcmbOldLrcByPttRegNo As clsHmsFlexSearch, fcmbOldLrcByPttName As clsHmsFlexSearch, fcmbPttName As clsHmsFlexSearch, fcmbPttRegNo As clsHmsFlexSearch, fcmbLrcVchNo As clsHmsFlexSearch

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

Rem refundeded amount column definitions
Const X2LFDICODE_COL = 0
Const X2LFDSNO_COL = 1
Const X2LRCVCHNO_COL = 2
Const X2LRCVTMNAME_COL = 3
Const X2LRCDATE_COL = 4
Const X2LRCAMTAFTDISC_COL = 5
Const X2LRCADVAMT_COL = 6
Const X2LRCRECDAMT_COL = 7
Const X2LRCDEPOAMT_COL = 8
Const X2LRCREFUAMTEXCL_COL = 9
Const X2LFDREFUAMT_COL = 10
Const X2LRCBALAMT_COL = 11
Const X2LRCCODE_COL = 12
Const X2LFDRECSTATE_COL = 13
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
mLfdCode = mAccessCode
End Property

Public Property Get EntryBoundCode() As Long
EntryBoundCode = Val(mskFormBoundField.Text)
End Property

Public Property Get EntryDate() As Date
EntryDate = Ctod(dtpLfdDate.Text)
End Property

Public Property Get EntryType() As String
EntryType = "Lfd"
End Property

Public Property Get EntryVtmCode() As Integer
EntryVtmCode = Val(fcmbLfdVtmName.BoundText)
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
                    dtpFromDate.Text = Dtoc(MonthStartDate(DateSerial(Val(Left(.fields("LfdYrMonth"), 4)), Val(Right(.fields("LfdYrMonth"), 2)), 1)))
                    dtpToDate.Text = Dtoc(MonthEndDate(DateSerial(Val(Left(.fields("LfdYrMonth"), 4)), Val(Right(.fields("LfdYrMonth"), 2)), 1)))
                    optMonthwise.Value = False
                    optDatewise.Value = True
                ElseIf optDatewise.Value = True Then
                    dtpFromDate.Text = Dtoc(.fields("LfhDate"))
                    dtpToDate.Text = Dtoc(.fields("LfhDate"))
                    optDatewise.Value = False
                    optDetailed.Value = True
                ElseIf optPatientwise.Value = True Then
                    Call ChkPttNameListFirstTime
                    Call ChkPttRegNoListFirstTime
                    
                    mQryPttCode = .fields("LfhPttCode")
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
Dim tRecset As New ADODB.Recordset, srow As Integer, mLfdSno As Integer, mLfdICode As Long

srow = Mfgrd2.Row
mLfdSno = Val(Mfgrd2.TextMatrix(srow, X2LFDSNO_COL))
mLfdICode = Val(Mfgrd2.TextMatrix(srow, X2LFDICODE_COL))

If cmdOK.Caption = "&OK" And dtlEditCanceled = False Then
    With clsLFD
    If dtlAddMode = True Then
        .ClearDtl
    Else
        .GetDtlData mLfdCode, mLfdICode
    End If
    .mTrnCode_lng = mLfdCode
    .mTrnDtlSno_int = Val(UnMyNumFmt(mskLfdSno.Text))
    .mTrnDate_dt = Ctod(dtpLfdDate.Text)
    .mTrnCmpCode_int = sFinYrCmpCode
    
    .mLfdPttCode_lng = mLfdPttCode
    .mLfdLhrCode_lng = Val(fcmbLrcVchNo.BoundText)
    .mLfdRefuAmt_dbl = Val(UnMyNumFmt(mskLfdRefuAmt.Text))
    .mLfdRemark_str = ""
    
    If dtlAddMode = True Then
        .AddNewDtl mLfdCode
        mLfdICode = .mTrnDtlICode_lng
    Else
        .UpdateDtl mLfdCode, mLfdICode
    End If
    End With
    
    RefreshDatabase dbHmsDatabase
    With tRecset
    .open "Select * from LabRefdDtl where LfdCode=" & CStr(mLfdCode) & " and LfdICode=" & CStr(mLfdICode) & "", dbHmsDatabase, adOpenKeyset, adLockOptimistic
    
    clsLRC.GetHdrData .fields("LfdLhrCode")
    clsVTM.GetData clsLRC.mTrnVtmCode_lng
    
    Mfgrd2.TextMatrix(srow, X2LFDICODE_COL) = .fields("LfdICode")
    Mfgrd2.TextMatrix(srow, X2LFDSNO_COL) = ToMyNumFmt(.fields("LfdSno"), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2LRCVCHNO_COL) = clsLRC.mTrnVchNo_lng
    Mfgrd2.TextMatrix(srow, X2LRCVTMNAME_COL) = clsVTM.mName_str
    Mfgrd2.TextMatrix(srow, X2LRCDATE_COL) = clsLRC.mTrnDate_dt
    Mfgrd2.TextMatrix(srow, X2LRCAMTAFTDISC_COL) = ToMyNumFmt(clsLRC.mLhrAmtAftDisc_dbl)
    Mfgrd2.TextMatrix(srow, X2LRCADVAMT_COL) = ToMyNumFmt(clsLRC.mLhrAdvAmt_dbl)
    Mfgrd2.TextMatrix(srow, X2LRCRECDAMT_COL) = ToMyNumFmt(clsLRC.mLhrRecdAmt_dbl)
    Mfgrd2.TextMatrix(srow, X2LRCDEPOAMT_COL) = ToMyNumFmt(clsLRC.mLhrDepoAmt_dbl)
    Mfgrd2.TextMatrix(srow, X2LRCREFUAMTEXCL_COL) = ToMyNumFmt(clsLRC.mLhrRefuAmt_dbl - .fields("LfdRefuAmt"))
    Mfgrd2.TextMatrix(srow, X2LFDREFUAMT_COL) = ToMyNumFmt(.fields("LfdRefuAmt"))
    Mfgrd2.TextMatrix(srow, X2LRCBALAMT_COL) = ToMyNumFmt(clsLRC.mLhrBalAmt_dbl)
    Mfgrd2.TextMatrix(srow, X2LRCCODE_COL) = .fields("LfdLhrCode")
    Mfgrd2.TextMatrix(srow, X2LFDRECSTATE_COL) = .fields("LfdRecState")
    
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
    txtSearch1Text_InterActiveChange Format(Ctod(dtpLfdDate.Text), "yyyymmdd") + Format(mLfdCode, "0000000")
ElseIf optMonthwise.Value = True Then
    txtSearch1Text_InterActiveChange Format(Ctod(dtpLfdDate.Text), "yyyy") & "/" & Format(Ctod(dtpLfdDate.Text), "mm")
ElseIf optDatewise.Value = True Then
    txtSearch1Text_InterActiveChange Format(Ctod(dtpLfdDate.Text), "yyyymmdd")
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
        If GetAccessPerm(mLrcAcsPermNo, mRetryCount, mFormAcsPermFileName) = True And mRetryCount = 0 Then
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

Private Sub dtpLhrDate_GotFocus()
FlashActiveControl dtpLhrDate, True
End Sub

Private Sub dtpLhrDate_LostFocus()
FlashActiveControl dtpLhrDate, False
End Sub

Private Sub dtpLhrDate_Validate(Cancel As Boolean)
dtpLhrDate.Text = ToMyDate(dtpLhrDate.Text)
If IsDate(dtpLhrDate.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpLhrDate.SetFocus
    Cancel = True
End If

End Sub

Private Sub dtpLfdDate_GotFocus()
FlashActiveControl dtpLfdDate, True
End Sub

Private Sub dtpLfdDate_LostFocus()
FlashActiveControl dtpLfdDate, False
End Sub

Private Sub dtpLfdDate_Validate(Cancel As Boolean)
dtpLfdDate.Text = ToMyDate(dtpLfdDate.Text)
If IsFinYrDate(Ctod(dtpLfdDate.Text)) = False Then
    ErrorBox "Invalid Input !!!"
    dtpLfdDate.SetFocus
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
        If mLfdCode = 0 Then
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

mFormUIdFileName = "LabRfRc.Uid"
mFormAcsPermFileName = "LabRfRc.Acp"
mFormUIdCode = GetUIdCode(mProcess:=Me.Name, mUIdFileName:=mFormUIdFileName, mAcsPermFileName:=mFormAcsPermFileName)

mFormLoaded = False
mEntrySaved = False: mEntryAborted = False
SetFormSize Me, frmMain
Call Form_Resize

Call SetVoidControl(txtVoid)
txtSearch1Text.Enabled = False
frConfigure.Visible = False
frPrintCRList.Visible = False

ChkCustomForm Me, CfsFileFullPath("LabRefd.Cfs")

OpenAcDataSource dbAcDatabase
OpenHmsDataSource dbHmsDatabase
OpenGrpDataSource dbGrpDatabase
OpenComDataSource dbComDatabase

Set clsListStru = New clsSelectQueryStructure

Set clsHOPT = New clsHmsLabOptionsEntry
clsHOPT.blnLabRefdOptMast = True
clsHOPT.Init
clsHOPT.GetLabRefdOptData

Set clsAH = New clsAccountHead
Set clsAH.dbAcDatabase = dbAcDatabase
Set clsAH.dbGrpDatabase = dbGrpDatabase

'''Set clsLPG = New clsHmsSnglTranEntry
'''Set clsLPG.dbAcDatabase = dbAcDatabase
'''Set clsLPG.dbHmsDatabase = dbHmsDatabase
'''clsLPG.blnOutdRegTran = True
'''clsLPG.Init

Set clsLFD = New clsHmsLabMultiTranEntry
Set clsLFD.dbAcDatabase = dbAcDatabase
Set clsLFD.dbHmsDatabase = dbHmsDatabase
clsLFD.blnLabRefdTran = True
clsLFD.Init

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

Set fcmbLfdVtmName = New clsComFlexSearch
Set fcmbLfdVtmName.dbAcDatabase = dbAcDatabase
fcmbLfdVtmName.blnVTypeMastList = True
fcmbLfdVtmName.mListSqlExpr = "Select * from VTypMast where VtmSysCode=" & CStr(cHMS_VTYPE_LAB_REFD) & " order by VtmName"
fcmbLfdVtmName.Init

Set fcmbLrcVchNo = New clsHmsFlexSearch
Set fcmbLrcVchNo.dbHmsDatabase = dbHmsDatabase
Set fcmbLrcVchNo.dbComDatabase = dbComDatabase
fcmbLrcVchNo.blnOldLrcListByLrcNo = True
fcmbLrcVchNo.Init

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

Set fcmbOldLhrByLhrNo = New clsHmsFlexSearch
Set fcmbOldLhrByLhrNo.dbHmsDatabase = dbHmsDatabase
Set fcmbOldLhrByLhrNo.dbComDatabase = dbComDatabase
fcmbOldLhrByLhrNo.blnOldLrcListByLrcNo = True
fcmbOldLhrByLhrNo.mFiltCond = "0 = 1"
fcmbOldLhrByLhrNo.Init

Set fcmbOldLrcByPttRegNo = New clsHmsFlexSearch
Set fcmbOldLrcByPttRegNo.dbHmsDatabase = dbHmsDatabase
Set fcmbOldLrcByPttRegNo.dbComDatabase = dbComDatabase
fcmbOldLrcByPttRegNo.blnOldLrcListByPttRegNo = True
fcmbOldLrcByPttRegNo.mFiltCond = "0 = 1"
fcmbOldLrcByPttRegNo.Init

Set fcmbOldLrcByPttName = New clsHmsFlexSearch
Set fcmbOldLrcByPttName.dbHmsDatabase = dbHmsDatabase
Set fcmbOldLrcByPttName.dbComDatabase = dbComDatabase
fcmbOldLrcByPttName.blnOldLrcListByPttName = True
fcmbOldLrcByPttName.mFiltCond = "0 = 1"
fcmbOldLrcByPttName.Init

Call RestoreDefaultSmryPara
If mRemoteAccess = True Then
    optDetailed.Value = True
    AddSmryParaLayer mClear:=True
End If

If mRemoteAccess = True Then
    datRecset.open "Select * from LabRefdHdr inner join PatMast on LabRefdHdr.LfhPttCode = PatMast.PttCode where LfhCode = " & CStr(mLfdCode) & " order by LfhDate,LfhTime", dbHmsDatabase, adOpenKeyset, adLockOptimistic
    dtpFromDate.Text = Dtoc(datRecset.fields("LfhDate"))
    dtpToDate.Text = Dtoc(datRecset.fields("LfhDate"))
    AddSmryParaLayer mClear:=True
    
Else
    datRecset.open "Select * from LabRefdHdr inner join PatMast on LabRefdHdr.LfhPttCode=PatMast.PttCode order by LfhDate,LfhTime", dbHmsDatabase, adOpenKeyset, adLockOptimistic
End If
Mfgrd1.FixedCols = 0
Call SmryList

Mfgrd2.FixedRows = 1: Mfgrd2.FixedCols = 0: Mfgrd2.Rows = 2: Mfgrd2.Cols = MFGRD2_COLS: SetGridAutoHeight Mfgrd2

colcnt = X2LFDICODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2LFDICODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2LFDSNO_COL: Mfgrd2.ColWidth(colcnt) = mskLfdSno.Width: Mfgrd2.TextMatrix(0, colcnt) = "Sno": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2LRCVCHNO_COL: Mfgrd2.ColWidth(colcnt) = mskLrcVchNo.Width: Mfgrd2.TextMatrix(0, colcnt) = "Vch.No": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2LRCVTMNAME_COL: Mfgrd2.ColWidth(colcnt) = txtLrcVtmName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Vch.Type": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2LRCDATE_COL: Mfgrd2.ColWidth(colcnt) = dtpLrcDate.Width: Mfgrd2.TextMatrix(0, colcnt) = "Vch.Date": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2LRCAMTAFTDISC_COL: Mfgrd2.ColWidth(colcnt) = mskLrcAmtAftDisc.Width: Mfgrd2.TextMatrix(0, colcnt) = "Amount": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2LRCADVAMT_COL: Mfgrd2.ColWidth(colcnt) = mskLrcAdvAmt.Width: Mfgrd2.TextMatrix(0, colcnt) = "Adv.Amt": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2LRCRECDAMT_COL: Mfgrd2.ColWidth(colcnt) = mskLrcRecdAmt.Width: Mfgrd2.TextMatrix(0, colcnt) = "Recd.Amt": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2LRCDEPOAMT_COL: Mfgrd2.ColWidth(colcnt) = mskLrcDepoAmt.Width: Mfgrd2.TextMatrix(0, colcnt) = "Depo.Amt": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2LRCREFUAMTEXCL_COL: Mfgrd2.ColWidth(colcnt) = mskLrcRefuAmtExcl.Width: Mfgrd2.TextMatrix(0, colcnt) = "PreRefd.Amt": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2LFDREFUAMT_COL: Mfgrd2.ColWidth(colcnt) = mskLfdRefuAmt.Width: Mfgrd2.TextMatrix(0, colcnt) = "Refund Amt": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2LRCBALAMT_COL: Mfgrd2.ColWidth(colcnt) = mskLrcBalAmt.Width: Mfgrd2.TextMatrix(0, colcnt) = "Bal.Amt": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2LRCCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2LRCCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2LFDRECSTATE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2LFDRECSTATE_COL": Mfgrd2.ColAlignment(colcnt) = 7

colcnt = X2LFDSNO_COL: mskLfdSno.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2LRCVCHNO_COL: mskLrcVchNo.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2LRCVTMNAME_COL: txtLrcVtmName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2LRCDATE_COL: dtpLrcDate.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2LRCAMTAFTDISC_COL: mskLrcAmtAftDisc.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2LRCADVAMT_COL: mskLrcAdvAmt.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2LRCRECDAMT_COL: mskLrcRecdAmt.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2LRCDEPOAMT_COL: mskLrcDepoAmt.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2LRCREFUAMTEXCL_COL: mskLrcRefuAmtExcl.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2LFDREFUAMT_COL: mskLfdRefuAmt.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2LRCBALAMT_COL: mskLrcBalAmt.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
cmdOK.Left = mskLrcBalAmt.Left + mskLrcBalAmt.Width

lblLrcAmtAftDiscTot.Left = mskLrcAmtAftDisc.Left - frFooter.Left: lblLrcAmtAftDiscTot.Width = mskLrcAmtAftDisc.Width
lblLrcAdvAmtTot.Left = mskLrcAdvAmt.Left - frFooter.Left: lblLrcAdvAmtTot.Width = mskLrcAdvAmt.Width
lblLrcRecdAmtTot.Left = mskLrcRecdAmt.Left - frFooter.Left: lblLrcRecdAmtTot.Width = mskLrcRecdAmt.Width
lblLrcDepoAmtTot.Left = mskLrcDepoAmt.Left - frFooter.Left: lblLrcDepoAmtTot.Width = mskLrcDepoAmt.Width
lblLrcRefuAmtExclTot.Left = mskLrcRefuAmtExcl.Left - frFooter.Left: lblLrcRefuAmtExclTot.Width = mskLrcRefuAmtExcl.Width
lblLfdRefuAmtTot.Left = mskLfdRefuAmt.Left - frFooter.Left: lblLfdRefuAmtTot.Width = mskLfdRefuAmt.Width
lblLrcBalAmtTot.Left = mskLrcBalAmt.Left - frFooter.Left: lblLrcBalAmtTot.Width = mskLrcBalAmt.Width

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
Set clsHOPT = Nothing
Set clsJRN = Nothing
Set clsAH = Nothing
'''Set clsLPG = Nothing
Set clsLFD = Nothing
Set clsLRC = Nothing
Set clsPAT = Nothing
Set clsPCG = Nothing
Set clsDCT = Nothing
Set clsDIG = Nothing
Set clsSRV = Nothing
Set clsARA = Nothing
Set clsSTN = Nothing
Set clsVTM = Nothing
Set fcmbOldLhrByLhrNo = Nothing
Set fcmbOldLrcByPttRegNo = Nothing
Set fcmbOldLrcByPttName = Nothing
Set fcmbPttRegNo = Nothing
Set fcmbPttName = Nothing
Set fcmbLfdVtmName = Nothing
Set fcmbLrcVchNo = Nothing
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
Dim mPttRegNo As Long, mLfdPttCode As Long, mLhrVchNo As Long, mLfdVchNo As Long
Dim mLrcAmtAftDiscAmtTot As Double, mLrcAdvAmtTot As Double, mLrcRecdAmtTot As Double, mLrcDepoAmtTot As Double, mLrcRefuAmtExclTot As Double, mLfdRefuAmtTot As Double

Data_Verify = False
If FormAddEditMode = cFORM_EDITMODE And Val(mskFormBoundField.Text) < 1 Then
    ErrorBox "Invalid Key Value !!!"
    txtPttName.SetFocus
    GoTo EndSub
End If
Rem patient validation
mLfdPttCode = Val(mskLfdPttCode.Text)
If mLfdPttCode < 1 Then
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
    If mPttRegNo = 0 And clsHOPT.mLfdPttRegNoNotZero_bln = True Then
        AlertBox "Prohibited Zero Patient Reg.No. !!!"
        mskPttRegNo.SetFocus
        GoTo EndSub
    End If
End If
Rem lab receipt validation
If Val(mskLfdLhrCode.Text) < 1 Then
    ErrorBox "Invalid Key Value !!!"
    txtPttName.SetFocus
    GoTo EndSub
End If
mLhrVchNo = Val(UnMyNumFmt(mskLhrVchNo.Text))
If mLhrVchNo < 1 Then
    ErrorBox "Invalid Input !!!"
    mskLhrVchNo.SetFocus
    GoTo EndSub
End If
If IsDate(dtpLhrDate.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpLhrDate.SetFocus
    GoTo EndSub
End If
Rem lab refund receipt validations
mLfdVchNo = Val(UnMyNumFmt(mskLfdVchNo(0).Text))
If mLfdVchNo > 0 Then
    If mLfdVchNo <> mLfdVchNo_old Or Val(fcmbLfdVtmName.BoundText) <> mLfdVtmCode_old Or Ctod(dtpLfdDate.Text) <> mLfdDate_old Or FormAddEditMode = cFORM_ADDMODE Then
        If ChkIsDuplVTypeNo(dbHmsDatabase, dbAcDatabase, mTableName:="LabRefdHdr", mChkFieldName:="LfhVchNo", mChkFieldValue:=mLfdVchNo, mKeyFieldName:="LfhCode", mKeyFieldValue:=mLfdCode, mVtmFieldName:="LfhVtmCode", mVtmFieldValue:=Val(fcmbLfdVtmName.BoundText), mFinYrFieldName:="LfhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="LfhDate", mDateFieldValue:=Ctod(dtpLfdDate.Text)) = True Then
            ErrorBox "Duplicate Voucher No. !!!"
            mskLfdVchNo(0).SetFocus
            ' ---------------
            If FormAddEditMode = True Then
                mLfdVchNo = GetNextVTypeNo(dbHmsDatabase, dbAcDatabase, dbComDatabase, mTableName:="LabRefdHdr", mFieldName:="LfhVchNo", mVtmFieldName:="LfhVtmCode", mVtmFieldValue:=Val(fcmbLfdVtmName.BoundText), mFinYrFieldName:="LfhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="LfhDate", mDateFieldValue:=Ctod(dtpLfdDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
            Else
                mLfdVchNo = mLfdVchNo_old
            End If
            mskLfdVchNo(0).Text = ToMyNumFmt(mLfdVchNo, mDecimals:=0)
            GoTo EndSub
        End If
    End If
Else
    ErrorBox "Invalid Input !!!"
    mskLfdVchNo(0).SetFocus
    GoTo EndSub
End If
If IsDate(dtpLfdDate.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpLfdDate.SetFocus
    GoTo EndSub
Else
    If IsFinYrDate(Ctod(dtpLfdDate.Text)) = False Then
        ErrorBox "Invalid Input !!!"
        dtpLfdDate.SetFocus
        GoTo EndSub
    End If
End If
If TimeToMin(txtLfdTime_str.Text) > cDAYMINUTES Then
    ErrorBox "Invalid Input !!!"
    txtLfdTime_str.SetFocus
    GoTo EndSub
End If
mLfdRefuAmtTot = Val(UnMyNumFmt(lblLfdRefuAmtTot.Caption))
If mLfdRefuAmtTot < 0 Then
    ErrorBox "Invalid Input !!!"
    Mfgrd2.SetFocus
    GoTo EndSub
End If
mLrcAmtAftDiscAmtTot = Val(UnMyNumFmt(lblLrcAmtAftDiscTot.Caption))
mLrcAdvAmtTot = Val(UnMyNumFmt(lblLrcAdvAmtTot.Caption))
mLrcRecdAmtTot = Val(UnMyNumFmt(lblLrcRecdAmtTot.Caption))
mLrcDepoAmtTot = Val(UnMyNumFmt(lblLrcDepoAmtTot.Caption))
mLrcRefuAmtExclTot = Val(UnMyNumFmt(lblLrcRefuAmtExclTot.Caption))
If (mLfdRefuAmtTot + mLrcRefuAmtExclTot) > (mLrcAdvAmtTot + mLrcRecdAmtTot + mLrcDepoAmtTot) Then
    ErrorBox "Excess Refund Amount !!!"
    Mfgrd2.SetFocus
    GoTo EndSub
End If

Data_Verify = True

EndSub:
Exit Function

End Function

Private Function Data_NetwAuth() As Boolean
Dim mLfdVchNo As Long
Data_NetwAuth = False

mLfdVchNo = Val(UnMyNumFmt(mskLfdVchNo(0).Text))
If mLfdVchNo <> mLfdVchNo_old Or Val(fcmbLfdVtmName.BoundText) <> mLfdVtmCode_old Or Ctod(dtpLfdDate.Text) <> mLfdDate_old Or FormAddEditMode = cFORM_ADDMODE Then
    If ChkIsDuplVTypeNo(dbHmsDatabase, dbAcDatabase, mTableName:="LabRefdHdr", mChkFieldName:="LfhVchNo", mChkFieldValue:=mLfdVchNo, mKeyFieldName:="LfhCode", mKeyFieldValue:=mLfdCode, mVtmFieldName:="LfhVtmCode", mVtmFieldValue:=Val(fcmbLfdVtmName.BoundText), mFinYrFieldName:="LfhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="LfhDate", mDateFieldValue:=Ctod(dtpLfdDate.Text)) = True Then
        ErrorBox "Duplicate Voucher No. !!!"
        mskLfdVchNo(0).SetFocus
        ' ---------------
        If FormAddEditMode = True Then
            mLfdVchNo = GetNextVTypeNo(dbHmsDatabase, dbAcDatabase, dbComDatabase, mTableName:="LabRefdHdr", mFieldName:="LfhVchNo", mVtmFieldName:="LfhVtmCode", mVtmFieldValue:=Val(fcmbLfdVtmName.BoundText), mFinYrFieldName:="LfhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="LfhDate", mDateFieldValue:=Ctod(dtpLfdDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
        Else
            mLfdVchNo = mLfdVchNo_old
        End If
        mskLfdVchNo(0).Text = ToMyNumFmt(mLfdVchNo, mDecimals:=0)
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
Dim srow As Integer, mLfdICode As Long, mDeleteit As Boolean
srow = Mfgrd2.Row
mLfdICode = Val(Mfgrd2.TextMatrix(srow, X2LFDICODE_COL))

If MyDeleteKey(Shift, KeyCode, mCheckCtrlMask:=False) = True And mLfdICode > 0 Then
    mDeleteit = True
    If mDeleteit = True Then
        mDeleteit = CanDelete()
    End If
    If mDeleteit = True Then
        clsLFD.DeleteDtl mLfdCode, mLfdICode
        
        ShowDtlData mLfdCode
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
        mskLfdSno.Text = ToMyNumFmt(FlexNextSeqno(Mfgrd2, X2LFDSNO_COL), mDecimals:=0)
        mskLrcVchNo.Text = "": fcmbLrcVchNo.BoundText = ""
    Else
        With Mfgrd2
        mskLfdSno.Text = .TextMatrix(srow, X2LFDSNO_COL)
        fcmbLrcVchNo.BoundText = .TextMatrix(srow, X2LRCCODE_COL): mskLrcVchNo.Text = ToMyNumFmt(Val(fcmbLrcVchNo.Text), mDecimals:=0)
        txtLrcVtmName.Text = .TextMatrix(srow, X2LRCVTMNAME_COL)
        dtpLrcDate.Text = .TextMatrix(srow, X2LRCDATE_COL)
        mskLrcAmtAftDisc.Text = .TextMatrix(srow, X2LRCAMTAFTDISC_COL)
        mskLrcAdvAmt.Text = .TextMatrix(srow, X2LRCADVAMT_COL)
        mskLrcRecdAmt.Text = .TextMatrix(srow, X2LRCRECDAMT_COL)
        mskLrcDepoAmt.Text = .TextMatrix(srow, X2LRCDEPOAMT_COL)
        mskLrcRefuAmtExcl.Text = .TextMatrix(srow, X2LRCREFUAMTEXCL_COL)
        mskLfdRefuAmt.Text = .TextMatrix(srow, X2LFDREFUAMT_COL)
        mskLrcBalAmt.Text = .TextMatrix(srow, X2LRCBALAMT_COL)
        End With
    End If
    mskLrcVchNo.SetFocus
    Call ValidDtl
    
    mLrcCode_old = Val(fcmbLrcVchNo.BoundText)
    mLfdRefuAmt_old = Val(UnMyNumFmt(mskLfdRefuAmt.Text))
End If

End Sub

Private Sub Mfgrd2_RowColChange()
ShowActiveFlexRow Mfgrd2

End Sub

Private Sub mskLfdRefuAmt_GotFocus()
FlashActiveControl mskLfdRefuAmt, True
End Sub

Private Sub mskLfdRefuAmt_LostFocus()
FlashActiveControl mskLfdRefuAmt, False
End Sub

Private Sub mskLfdRefuAmt_Validate(Cancel As Boolean)
If chkLfdRefuAmt() = False Then
    mskLfdRefuAmt.SetFocus
    Cancel = True
Else
    Call ValidDtl
End If

End Sub

Private Function chkLfdRefuAmt() As Boolean
Dim mRtnval As Boolean
Dim mLrcAmtAftDisc As Double, mLrcAdvAmt As Double, mLrcRecdAmt As Double, mLrcDepoAmt As Double, mLrcRefuAmtExcl As Double, mLfdRefuAmt As Double, mLrcBalAmt As Double

mRtnval = True
mLrcAmtAftDisc = Val(UnMyNumFmt(mskLrcAmtAftDisc.Text))
mLrcAdvAmt = Val(UnMyNumFmt(mskLrcAdvAmt.Text))
mLrcRecdAmt = Val(UnMyNumFmt(mskLrcRecdAmt.Text))
mLrcDepoAmt = Val(UnMyNumFmt(mskLrcDepoAmt.Text))
mLrcRefuAmtExcl = Val(UnMyNumFmt(mskLrcRefuAmtExcl.Text))
mLfdRefuAmt = Val(UnMyNumFmt(mskLfdRefuAmt.Text))

mskLfdRefuAmt.Text = ToMyNumFmt(mLfdRefuAmt)
If mLfdRefuAmt < 1 Then
    If InterActiveChange(mskLfdRefuAmt) = True Then
        ErrorBox "Invalid Input !!!"
    End If
    mRtnval = False
Else
    If (mLfdRefuAmt + mLrcRefuAmtExcl) > (mLrcAdvAmt + mLrcRecdAmt + mLrcDepoAmt) Then
        If InterActiveChange(mskLfdRefuAmt) = True Then
            ErrorBox "Excess Refund Amount !!!"
            mskLfdRefuAmt.Text = ToMyNumFmt(mLfdRefuAmt_old)
            mLfdRefuAmt = Val(UnMyNumFmt(mskLfdRefuAmt.Text))
        End If
        mRtnval = False
    End If
End If
mskLrcBalAmt.Text = ToMyNumFmt(mLrcAmtAftDisc - (mLrcAdvAmt + mLrcRecdAmt + mLrcDepoAmt))

chkLfdRefuAmt = mRtnval

End Function

'Private Sub mskLrcAmtAftDisc_GotFocus()
'FlashActiveControl mskLrcAmtAftDisc, True
'End Sub
'
'Private Sub mskLrcAmtAftDisc_LostFocus()
'FlashActiveControl mskLrcAmtAftDisc, False
'End Sub

'Private Sub mskLrcAmtAftDisc_Validate(Cancel As Boolean)
'mskLrcAmtAftDisc.Text = ToMyNumFmt(mskLrcAmtAftDisc.Text)
'If Val(UnMyNumFmt(mskLrcAmtAftDisc.Text)) < 0 Then
'    ErrorBox "Invalid Input !!!"
'    mskLrcAmtAftDisc.SetFocus
'    Cancel = True
'Else
'    Call CalcLrcChg
'    Call ValidDtl
'End If
'
'End Sub

'Private Sub mskLrcBalAmtTot_GotFocus()
'FlashActiveControl mskLrcBalAmtTot, True
'End Sub
'
'Private Sub mskLrcBalAmtTot_LostFocus()
'FlashActiveControl mskLrcBalAmtTot, False
'End Sub

'Private Sub mskLrcBalAmtTot_Validate(Cancel As Boolean)
'If Val(UnMyNumFmt(mskLrcBalAmtTot.Text)) < 0 Then
'    ErrorBox "Invalid Input !!!"
'    mskLrcBalAmtTot.SetFocus
'    Cancel = True
'End If
'
'End Sub

'Private Sub mskLrcDepoAmtTot_GotFocus()
'FlashActiveControl mskLrcDepoAmtTot, True
'End Sub
'
'Private Sub mskLrcDepoAmtTot_LostFocus()
'FlashActiveControl mskLrcDepoAmtTot, False
'End Sub
'
'Private Sub mskLrcDepoAmtTot_Validate(Cancel As Boolean)
'If Val(UnMyNumFmt(mskLrcDepoAmtTot.Text)) < 0 Then
'    ErrorBox "Invalid Input !!!"
'    mskLrcDepoAmtTot.SetFocus
'    Cancel = True
'End If
'
'End Sub

Private Sub mskLhrVchNo_GotFocus()
FlashActiveControl mskLhrVchNo, True
End Sub

Private Sub mskLhrVchNo_LostFocus()
FlashActiveControl mskLhrVchNo, False
End Sub

Private Sub mskLhrVchNo_Validate(Cancel As Boolean)
Dim mLhrVchNo As Long

mLhrVchNo = Val(UnMyNumFmt(mskLhrVchNo.Text))
mskLhrVchNo.Text = ToMyNumFmt(mLhrVchNo, mDecimals:=0)
If mLhrVchNo < 0 Then
    ErrorBox "Invalid Input !!!"
    mskLhrVchNo.SetFocus
    Cancel = True
End If

End Sub

'Private Sub mskLrcRecdAmtTot_GotFocus()
'FlashActiveControl mskLrcRecdAmtTot, True
'End Sub
'
'Private Sub mskLrcRecdAmtTot_LostFocus()
'FlashActiveControl mskLrcRecdAmtTot, False
'End Sub

''Private Sub mskLrcRecdAmtTot_Validate(Cancel As Boolean)
''Dim mLrcRecdAmtTot As Double, mLrcDepoAmtTot As Double, mLrcAmtAftDiscTot As Double
''
''mLrcRecdAmtTot = Val(UnMyNumFmt(mskLrcRecdAmtTot.Text))
''mLrcDepoAmtTot = Val(UnMyNumFmt(mskLrcDepoAmtTot.Text))
''mLrcAmtAftDiscTot = Val(UnMyNumFmt(lblLrcAmtAftDiscTot.Caption))
''
''mskLrcRecdAmtTot.Text = ToMyNumFmt(mLrcRecdAmtTot)
''If mLrcRecdAmtTot < 0 Then
''    ErrorBox "Invalid Input !!!"
''    mskLrcRecdAmtTot.SetFocus
''    Cancel = True
''Else
''    If (mLrcRecdAmtTot + mLrcDepoAmtTot) > mLrcAmtAftDiscTot Then
''        ErrorBox "Excess Received Amount !!!"
''        mLrcRecdAmtTot = mLrcAmtAftDiscTot - mLrcDepoAmtTot
''        mskLrcRecdAmtTot.Text = ToMyNumFmt(mLrcRecdAmtTot)
''        mskLrcRecdAmtTot.SetFocus
''        Cancel = True
''    Else
''        If FormAddEditMode = cFORM_ADDMODE Or mLrcRecdAmtTot <> mLrcRecdAmtTot_old Then
''            DisperseRecdAmt mLfdCode
''            ShowDtlData mLfdCode
''        End If
''
''    End If
''End If
''
''End Sub

Private Sub mskLfdVchNo_GotFocus(Index As Integer)
FlashActiveControl mskLfdVchNo(Index), True
End Sub

Private Sub mskLfdVchNo_LostFocus(Index As Integer)
FlashActiveControl mskLfdVchNo(Index), False
End Sub

Private Sub mskLfdVchNo_Validate(Index As Integer, Cancel As Boolean)
Dim mLfdVchNo As Long

mLfdVchNo = Val(UnMyNumFmt(mskLfdVchNo(Index).Text))
If mLfdVchNo < 0 And Index = 0 Then
    mLfdVchNo = GetNextVTypeNo(dbHmsDatabase, dbAcDatabase, dbComDatabase, mTableName:="LabRefdHdr", mFieldName:="LfhVchNo", mVtmFieldName:="LfhVtmCode", mVtmFieldValue:=Val(fcmbLfdVtmName.BoundText), mFinYrFieldName:="LfhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="LfhDate", mDateFieldValue:=Ctod(dtpLfdDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
    mskLfdVchNo(Index).Text = ToMyNumFmt(mLfdVchNo, mDecimals:=0)
ElseIf mLfdVchNo > 0 And Index = 0 Then
    If mLfdVchNo <> mLfdVchNo_old Or Val(fcmbLfdVtmName.BoundText) <> mLfdVtmCode_old Or Ctod(dtpLfdDate.Text) <> mLfdDate_old Or FormAddEditMode = cFORM_ADDMODE Then
        If ChkIsDuplVTypeNo(dbHmsDatabase, dbAcDatabase, mTableName:="LabRefdHdr", mChkFieldName:="LfhVchNo", mChkFieldValue:=mLfdVchNo, mKeyFieldName:="LfhCode", mKeyFieldValue:=mLfdCode, mVtmFieldName:="LfhVtmCode", mVtmFieldValue:=Val(fcmbLfdVtmName.BoundText), mFinYrFieldName:="LfhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="LfhDate", mDateFieldValue:=Ctod(dtpLfdDate.Text)) = True Then
            ErrorBox "Duplicate Voucher No. !!!"
            Cancel = True
            mskLfdVchNo(Index).SetFocus
            ' ----------
            If FormAddEditMode = cFORM_ADDMODE Then
                mLfdVchNo = GetNextVTypeNo(dbHmsDatabase, dbAcDatabase, dbComDatabase, mTableName:="LabRefdHdr", mFieldName:="LfhVchNo", mVtmFieldName:="LfhVtmCode", mVtmFieldValue:=Val(fcmbLfdVtmName.BoundText), mFinYrFieldName:="LfhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="LfhDate", mDateFieldValue:=Ctod(dtpLfdDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
            Else
                mLfdVchNo = mLfdVchNo_old
            End If
            mskLfdVchNo(Index).Text = ToMyNumFmt(mLfdVchNo, mDecimals:=0)
        End If
    End If
    If Cancel = False Then
        mskLfdVchNo(Index).Text = ToMyNumFmt(mLfdVchNo, mDecimals:=0)
    End If
ElseIf mLfdVchNo < 1 Then
    ErrorBox "Invalid Input !!!"
    mskLfdVchNo(Index).SetFocus
    Cancel = True
End If

End Sub

Private Sub mskLrcVchNo_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call mskLrcVchNo_Change
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
    Call ShowOldLrcListByPttRegNo
ElseIf MyAddNewKey(Shift, KeyCode) = True Then
    If FormAddEditMode = cFORM_ADDMODE Then
        clsLFD.EndTran mLfdCode
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
        If mPttRegNo = 0 And clsHOPT.mLfdPttRegNoNotZero_bln = True Then
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

Private Sub txtFDigName_GotFocus()
FlashActiveControl txtFDigName, True
End Sub

Private Sub txtFDigName_LostFocus()
FlashActiveControl txtFDigName, False
End Sub

Private Sub txtLfhRemark_GotFocus()
FlashActiveControl txtLfhRemark, True
End Sub

Private Sub txtLfhRemark_LostFocus()
FlashActiveControl txtLfhRemark, False
End Sub

Private Sub txtLfhRemark_Validate(Cancel As Boolean)
txtLfhRemark.Text = ToMyWord(txtLfhRemark.Text)
End Sub

Private Sub txtLhrTime_str_GotFocus()
FlashActiveControl txtLhrTime_str, True
End Sub

Private Sub txtLhrTime_str_LostFocus()
FlashActiveControl txtLhrTime_str, False
End Sub

Private Sub txtLhrTime_str_Validate(Cancel As Boolean)
txtLhrTime_str.Text = MinToTime(TimeToMin(txtLhrTime_str.Text))
If TimeToMin(txtLhrTime_str.Text) > cDAYMINUTES Then
    ErrorBox "Invalid Input !!!"
    txtLhrTime_str.SetFocus
    Cancel = True
End If

End Sub

Private Sub txtLfdTime_str_GotFocus()
FlashActiveControl txtLfdTime_str, True
End Sub

Private Sub txtLfdTime_str_LostFocus()
FlashActiveControl txtLfdTime_str, False
End Sub

Private Sub txtLfdTime_str_Validate(Cancel As Boolean)
txtLfdTime_str.Text = MinToTime(TimeToMin(txtLfdTime_str.Text))
If TimeToMin(txtLfdTime_str.Text) > cDAYMINUTES Then
    ErrorBox "Invalid Input !!!"
    txtLfdTime_str.SetFocus
    Cancel = True
End If

End Sub

Private Sub txtLfdVtmName_Change(Index As Integer)
If fcmbLfdVtmName.CallFromText_Change = False Then
    fcmbLfdVtmName.CallFromText_Change = True
    If InterActiveChange(txtLfdVtmName(Index)) = True Then
        fcmbLfdVtmName.UserText = Array(txtLfdVtmName(Index).Text, txtLfdVtmName(Index).SelStart)
        fcmbLfdVtmName.Show
        txtLfdVtmName(Index).Text = fcmbLfdVtmName.Text
        If fcmbLfdVtmName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbLfdVtmName.CallFromText_Change = False
End If

End Sub

Private Sub txtLfdVtmName_GotFocus(Index As Integer)
FlashActiveControl txtLfdVtmName(Index), True
End Sub

Private Sub txtLfdVtmName_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtLfdVtmName_Change(Index)
ElseIf MyAddNewKey(Shift, KeyCode) = True Then

ElseIf Shift = 0 And KeyCode = vbKeyF6 Then
    Rem Call ShowOldLhrListByLhrNo show here all lab receipt details
End If

End Sub

Private Sub txtLfdVtmName_LostFocus(Index As Integer)
FlashActiveControl txtLfdVtmName(Index), False
End Sub

Private Sub txtLfdVtmName_Validate(Index As Integer, Cancel As Boolean)
Dim mLfdVchNo As Long

If Val(fcmbLfdVtmName.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    txtLfdVtmName(Index).SetFocus
    Cancel = True
ElseIf Index = 0 Then
    If Val(fcmbLfdVtmName.BoundText) <> mLfdVtmCode_old Or Ctod(dtpLfdDate.Text) <> mLfdDate_old Or FormAddEditMode = cFORM_ADDMODE Then
        mLfdVchNo = GetNextVTypeNo(dbHmsDatabase, dbAcDatabase, dbComDatabase, mTableName:="LabRefdHdr", mFieldName:="LfhVchNo", mVtmFieldName:="LfhVtmCode", mVtmFieldValue:=Val(fcmbLfdVtmName.BoundText), mFinYrFieldName:="LfhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="LfhDate", mDateFieldValue:=Ctod(dtpLfdDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
        mskLfdVchNo(Index).Text = ToMyNumFmt(mLfdVchNo, mDecimals:=0)
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
    Call ShowOldLrcListByPttName
ElseIf MyAddNewKey(Shift, KeyCode) = True Then
    If FormAddEditMode = cFORM_ADDMODE Then
        clsLFD.EndTran mLfdCode
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
If clsLFD.BeginTran(0) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_ADDMODE

clsLFD.ClearHdr: clsLFD.ClearDtl
clsLRC.ClearHdr
clsPAT.Clear

mLfdCode = clsLFD.ActiveTrnCode
mLfdLhrCode = 0
mLfdPttCode = 0

ShowLfdData mLfdCode
ShowLhrData mLfdLhrCode
ShowPatData mLfdPttCode

Rem restoring user editing features
Call ShowLfdDefData
Call ShowPatDefData
Call ShowLhrDefData

Rem old values
Call StoreLfdOldData
Call StorePatOldData
Call StoreLhrOldData

Call ShowEntryMode(True)
txtPttName.SetFocus

End Sub

Private Sub Data_EditEvent()

If CanUserEditOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If clsLFD.BeginTran(datRecset.fields("LfhCode")) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_EDITMODE

With datRecset
mLfdCode = .fields("LfhCode")
mLfdLhrCode = .fields("LfhLhrCode")
mLfdPttCode = .fields("LfhPttCode")

clsLFD.GetHdrData mLfdCode
clsLRC.GetHdrData mLfdLhrCode
clsPAT.GetData mLfdPttCode
End With

ShowLfdData mLfdCode
ShowLhrData mLfdLhrCode
ShowPatData mLfdPttCode

Rem old values
Call StoreLfdOldData
Call StoreLhrOldData
Call StorePatOldData

Call ShowEntryMode(True)
txtPttName.SetFocus

End Sub

Private Sub ShowPatData(ByVal mPttCode As Long)

With clsPAT
.GetData mPttCode

mskLfdPttCode.Text = mPttCode
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

Private Sub ShowLhrData(ByVal mLhrCode As Long)

With clsLRC
.GetHdrData mLhrCode

mskLfdLhrCode.Text = mLhrCode
clsVTM.GetData .mTrnVtmCode_lng: txtLhrVtmName.Text = clsVTM.mName_str
txtLhrPrefix.Text = .mTrnPrefix_str
mskLhrVchNo.Text = ToMyNumFmt(.mTrnVchNo_lng, mDecimals:=0)
dtpLhrDate.Text = Dtoc(.mTrnDate_dt)
txtLhrTime_str.Text = MinToTime(.mLhrTime_lng)
clsDCT.GetData .mLhrCDctCode_lng: txtCDctName.Text = clsDCT.mName_str
clsDCT.GetData .mLhrRByCode_lng: txtRByName.Text = clsDCT.mName_str
clsDIG.GetData .mLhrFDigCode_lng: txtFDigName.Text = clsDIG.mName_str
txtLhrRemark.Text = .mLhrRemark_str
End With

txtLhrVtmName.Locked = (mLhrCode > 0)
txtLhrPrefix.Locked = (mLhrCode > 0)
mskLhrVchNo.Locked = (mLhrCode > 0)
dtpLhrDate.Locked = (mLhrCode > 0)
txtLhrTime_str.Locked = (mLhrCode > 0)
txtCDctName.Locked = (mLhrCode > 0)
txtRByName.Locked = (mLhrCode > 0)
txtFDigName.Locked = (mLhrCode > 0)
txtLhrRemark.Locked = (mLhrCode > 0)

End Sub

Private Sub ShowLhrDefData()
Dim mLhrVchNo As Long

dtpLhrDate.Text = Dtoc(DefaultEntryDate)
txtLhrTime_str.Text = MinToTime(TimeToMin(DateTime.Time$))
txtLhrVtmName.Text = ""
txtLhrPrefix.Text = ""
mskLhrVchNo.Text = 0

End Sub

Private Sub StoreLhrOldData()
Rem nothing
End Sub

Private Sub ShowLfdData(ByVal mLfdCode As Long)

With clsLFD
.GetHdrData mLfdCode

mskFormBoundField.Text = mLfdCode
fcmbLfdVtmName.BoundText = CStr(.mTrnVtmCode_lng): txtLfdVtmName(0).Text = fcmbLfdVtmName.Text
txtLfdPrefix.Text = .mTrnPrefix_str
mskLfdVchNo(0).Text = ToMyNumFmt(.mTrnVchNo_lng, mDecimals:=0)
dtpLfdDate.Text = Dtoc(.mTrnDate_dt)
txtLfdTime_str.Text = MinToTime(.mLfhTime_lng)
txtLfhRemark.Text = .mLfhRemark_str
Rem old lab receipt
mLfdOldLfdCode = .mLfhOldLfhCode_lng
ShowOldLfdCodeDesc mLfdOldLfdCode
End With

'Call CalcLrcChg
ShowDtlData mLfdCode

End Sub

Private Sub ShowLfdDefData()
Dim mLfdVchNo As Long

dtpLfdDate.Text = Dtoc(DefaultEntryDate)
txtLfdTime_str.Text = MinToTime(TimeToMin(DateTime.Time$))

fcmbLfdVtmName.BoundText = CStr(clsHOPT.GetLabRefdOptBoundCode("LfdVtmCode")): txtLfdVtmName(0).Text = fcmbLfdVtmName.Text

mLfdVchNo = GetNextVTypeNo(dbHmsDatabase, dbAcDatabase, dbComDatabase, mTableName:="LabRefdHdr", mFieldName:="LfhVchNo", mVtmFieldName:="LfhVtmCode", mVtmFieldValue:=Val(fcmbLfdVtmName.BoundText), mFinYrFieldName:="LfhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="LfhDate", mDateFieldValue:=Ctod(dtpLfdDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
mskLfdVchNo(0).Text = ToMyNumFmt(mLfdVchNo, mDecimals:=0)

End Sub

Private Sub StoreLfdOldData()
mLfdCode_old = mLfdCode
mLfdDate_old = Ctod(dtpLfdDate.Text)
mLfdVtmCode_old = Val(fcmbLfdVtmName.BoundText)
mLfdVchNo_old = Val(UnMyNumFmt(mskLfdVchNo(0).Text))

End Sub

Private Sub ShowDtlData(ByVal mLfdCode As Long)
Dim srow As Integer, tRecset As New ADODB.Recordset, mColCnt As Integer

srow = 1
Mfgrd2.Rows = 2

With tRecset
.open "Select * from LabRefdDtl where LfdCode=" & CStr(mLfdCode) & " order by LfdSno", dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Do While .EOF = False
        If InList(.fields("LfdRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
            clsLRC.GetHdrData .fields("LfdLhrCode")
            clsVTM.GetData clsLRC.mTrnVtmCode_lng
            
            Mfgrd2.TextMatrix(srow, X2LFDICODE_COL) = .fields("LfdICode")
            Mfgrd2.TextMatrix(srow, X2LFDSNO_COL) = ToMyNumFmt(.fields("LfdSno"), mDecimals:=0)
            Mfgrd2.TextMatrix(srow, X2LRCVCHNO_COL) = clsLRC.mTrnVchNo_lng
            Mfgrd2.TextMatrix(srow, X2LRCVTMNAME_COL) = clsVTM.mName_str
            Mfgrd2.TextMatrix(srow, X2LRCDATE_COL) = clsLRC.mTrnDate_dt
            Mfgrd2.TextMatrix(srow, X2LRCAMTAFTDISC_COL) = ToMyNumFmt(clsLRC.mLhrAmtAftDisc_dbl)
            Mfgrd2.TextMatrix(srow, X2LRCADVAMT_COL) = ToMyNumFmt(clsLRC.mLhrAdvAmt_dbl)
            Mfgrd2.TextMatrix(srow, X2LRCRECDAMT_COL) = ToMyNumFmt(clsLRC.mLhrRecdAmt_dbl)
            Mfgrd2.TextMatrix(srow, X2LRCDEPOAMT_COL) = ToMyNumFmt(clsLRC.mLhrDepoAmt_dbl)
            Mfgrd2.TextMatrix(srow, X2LRCREFUAMTEXCL_COL) = ToMyNumFmt(clsLRC.mLhrRefuAmt_dbl - .fields("LfdRefuAmt"))
            Mfgrd2.TextMatrix(srow, X2LFDREFUAMT_COL) = ToMyNumFmt(.fields("LfdRefuAmt"))
            Mfgrd2.TextMatrix(srow, X2LRCBALAMT_COL) = ToMyNumFmt(clsLRC.mLhrBalAmt_dbl)
            Mfgrd2.TextMatrix(srow, X2LRCCODE_COL) = .fields("LfdLhrCode")
            Mfgrd2.TextMatrix(srow, X2LFDRECSTATE_COL) = .fields("LfdRecState")
            
            Mfgrd2.Rows = Mfgrd2.Rows + 1
            srow = srow + 1
        Else
            If InList(.fields("LfdRecState"), Array(cREC_CANCELED, cREC_DELETED)) = False Then
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

With clsLFD
If FormAddEditMode = cFORM_ADDMODE Then
    .ClearHdr
Else
    .GetHdrData mLfdCode
End If
.mTrnDate_dt = Ctod(dtpLfdDate.Text)
.mTrnVtmCode_lng = Val(fcmbLfdVtmName.BoundText)
.mTrnPrefix_str = txtLfdPrefix.Text
.mTrnVchNo_lng = Val(UnMyNumFmt(mskLfdVchNo(0).Text))
.mTrnPostfix_str = ""
.mTrnCmpCode_int = sFinYrCmpCode

.mLfhTime_lng = TimeToMin(txtLfdTime_str.Text)
.mLfhLpgCode_lng = 0
.mLfhLhrCode_lng = mLfdLhrCode
.mLfhPttCode_lng = mLfdPttCode
.mLfhOldLfhCode_lng = mLfdOldLfdCode
.mLfhRefuAmt_dbl = Val(UnMyNumFmt(lblLfdRefuAmtTot.Caption))
.mLfhRemark_str = txtLfhRemark.Text

If FormAddEditMode = cFORM_ADDMODE Then
    .AddNewHdr
    mskFormBoundField.Text = .mTrnCode_lng
Else
    .UpdateHdr mLfdCode
End If
If .mTrnCode_lng > 0 Then   ' updated successfully
    mLfdCode = .mTrnCode_lng
    
    .UpdateTran .mTrnCode_lng
    .EndTran .mTrnCode_lng
        
    Rem updating user editing carry forward features
    clsHOPT.mLfdVtmCodeOld_lng = .mTrnVtmCode_lng
    clsHOPT.UpdateLabRefdOld
    
    mEntrySaved = True
Else
    Call Data_CancelEvent
    ErrorBox "Entry Cancelled !!!"
End If
End With

If clsLFD.mTrnCode_lng > 0 Then   ' updated successfully
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

mLfdCode = datRecset.fields("LfhCode")
mLfdPttCode = datRecset.fields("LfhPttCode")
mRecAbsPos = datRecset.AbsolutePosition

If clsLFD.CanDeleteTran(mLfdCode) = True Then
    txtVoid.SetFocus
    If clsLFD.BeginTran(mLfdCode) = True Then
        clsLFD.DeleteTran mLfdCode
        clsLFD.UpdateTran mLfdCode
        clsLFD.EndTran mLfdCode
    
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
clsLFD.CancelTran mLfdCode
clsLFD.EndTran mLfdCode

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
RefreshDatabase dbHmsDatabase
RefreshDatabase dbAcDatabase
RefreshDatabase dbGrpDatabase
RefreshDatabase dbComDatabase
clsListStru.Clear

If optMonthwise.Value = True Or optDatewise.Value = True Or optPatientwise.Value = True Then
    If optMonthwise.Value = True Then
        clsListStru.AddFields mExpr:="LfdYrMonth", mAttrib:=cFAT_SYSTEM
        clsListStru.AddFields mExpr:="LfdMnYear", mTitle:="Month", mShowItem:=True, mAlign:=1, mWidth:=2000
        clsListStru.AddFields mExpr:="LfdCount", mTitle:="Count", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="LfdRefuAmt_sum", mTitle:="Refd.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        
        datRecset.open "Select format(LfhDate,'yyyy/MM') as LfdYrMonth" _
         & ",Count(LfhCode) as LfdCount" _
         & ",Sum(LfhRefuAmt) as LfdRefuAmt_sum" _
         & " from LabRefdHdr" _
         & " where LfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and LfhCode>0" _
         & IIf(mQryPttCode > 0, " and LfhPttCode=" & CStr(mQryPttCode), "") _
         & " group by format(LfhDate,'yyyy/MM')" _
         & " order by format(LfhDate,'yyyy/MM')" _
         , dbHmsDatabase, adOpenKeyset, adLockReadOnly

    ElseIf optDatewise.Value = True Then
        clsListStru.AddFields mExpr:="LfdDateYMD", mAttrib:=cFAT_SYSTEM
        clsListStru.AddFields mExpr:="LfdDate", mTitle:="Date", mShowItem:=True, mAlign:=1, mWidth:=2000
        clsListStru.AddFields mExpr:="LfdCount", mTitle:="Count", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="LfdRefuAmt_sum", mTitle:="Refd.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        
        datRecset.open "Select LfhDate" _
         & ",Count(LfhCode) as LfdCount" _
         & ",Sum(LfhRefuAmt) as LfdRefuAmt_sum" _
         & " from LabRefdHdr" _
         & " where LfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and LfhCode>0" _
         & IIf(mQryPttCode > 0, " and LfhPttCode=" & CStr(mQryPttCode), "") _
         & " group by LfhDate" _
         & " order by LfhDate" _
         , dbHmsDatabase, adOpenKeyset, adLockReadOnly
        
    ElseIf optPatientwise.Value = True Then
        clsListStru.AddFields mExpr:="PttName", mTitle:="Patient Name", mShowItem:=True, mAlign:=1, mWidth:=3000
        clsListStru.AddFields mExpr:="PttRegNo", mTitle:="Reg.No", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="PttRefName", mTitle:="Care of", mShowItem:=True, mAlign:=1, mWidth:=2000
        clsListStru.AddFields mExpr:="LfdCount", mTitle:="Count", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="LfdRefuAmt_sum", mTitle:="Refu.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        
        datRecset.open "Select PatMast.PttName,PatMast.PttRegNo,LabRefdHdr.LfhPttCode" _
         & ",Count(LfhCode) as LfdCount" _
         & ",Sum(LfhRefuAmt) as LfdRefuAmt_sum" _
         & " from LabRefdHdr inner join PatMast on LabRefdHdr.LfhPttCode=PatMast.PttCode" _
         & " where LfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and LfhCode>0" _
         & IIf(mQryPttCode > 0, " and LfhPttCode=" & CStr(mQryPttCode), "") _
         & " group by PatMast.PttName,PatMast.PttRegNo,LabRefdHdr.LfhPttCode" _
         & " order by PatMast.PttName,PatMast.PttRegNo,LabRefdHdr.LfhPttCode" _
         , dbHmsDatabase, adOpenKeyset, adLockReadOnly
    End If
    
ElseIf optDetailed.Value = True Then
    clsListStru.AddFields mExpr:="tLfdSmryId", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="LfdCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="VtmName", mTitle:="Voucher", mAlign:=1, mWidth:=1500, mShowItem:=True
    clsListStru.AddFields mExpr:="LrcVchNo", mTitle:="Vchr.No", mAlign:=7, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="LfdDate", mTitle:="Date", mAlign:=1, mWidth:=1300, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="PttCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="PttName", mTitle:="Patient Name", mAlign:=1, mWidth:=2500, mShowItem:=True
    clsListStru.AddFields mExpr:="PttRegNo", mTitle:="Reg.No", mAlign:=7, mWidth:=1250, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="LfdRefuAmt", mTitle:="Refd.Amt", mAlign:=7, mWidth:=1250, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="PttRefName", mTitle:="Care of", mAlign:=1, mWidth:=2000, mShowItem:=True
    clsListStru.AddFields mExpr:="PttAddr", mTitle:="Address", mAlign:=1, mWidth:=2000, mShowItem:=True
    clsListStru.AddFields mExpr:="PatAraName", mTitle:="Area", mAlign:=1, mWidth:=1500, mShowItem:=True
    clsListStru.AddFields mExpr:="PatStnName", mTitle:="Station", mAlign:=1, mWidth:=1500, mShowItem:=True
    clsListStru.AddFields mExpr:="PatPcgName", mTitle:="Category", mAlign:=1, mWidth:=2000, mShowItem:=True
    
    datRecset.open "Select LabRefdHdr.*,PatMast.*" _
     & ",format(LfhDate,'yyyymmdd')+format(LfhCode,'0000000') as tLfdSmryId" _
     & " from LabRefdHdr inner join PatMast on LabRefdHdr.LfhPttCode=PatMast.PttCode" _
     & " where LfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & IIf(mRemoteAccess = True, " and LfhCode=" & CStr(mLfdCode) & "", "") _
     & " and LfhCode>0" _
     & IIf(mQryPttCode > 0, " and LfhPttCode=" & CStr(mQryPttCode), "") _
     & " order by LfhDate,LfhCode" _
     , dbHmsDatabase, adOpenKeyset, adLockReadOnly
    
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
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("LfdYrMonth")) = .fields("LfdYrMonth")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("LfdMnYear")) = MonthName(Val(Right(.fields("LfdYrMonth"), 2))) & "-" & Left(.fields("LfdYrMonth"), 4)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("LfdCount")) = ToMyNumFmt(.fields("LfdCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("LfdRefuAmt_sum")) = ToMyNumFmt(.fields("LfdRefuAmt_sum"))
                
            ElseIf optDatewise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("LfdDateYMD")) = Format(.fields("LfhDate"), "yyyymmdd")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("LfdDate")) = Dtoc(.fields("LfhDate"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("LfdCount")) = ToMyNumFmt(.fields("LfdCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("LfdRefuAmt_sum")) = ToMyNumFmt(.fields("LfdRefuAmt_sum"))
                
            ElseIf optPatientwise.Value = True Then
                clsPAT.GetData .fields("LfhPttCode")
                
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttName")) = .fields("PttName")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttRegNo")) = ToMyNumFmt(.fields("PttRegNo"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttRefName")) = clsPAT.mPttRefName_str
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("LfdCount")) = ToMyNumFmt(.fields("LfdCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("LfdRefuAmt_sum")) = ToMyNumFmt(.fields("LfdRefuAmt_sum"))
                
            End If
        
        ElseIf optDetailed.Value = True Then
            clsPCG.GetData .fields("PttPcgCode")
            clsARA.GetData .fields("PttAraCode")
            clsSTN.GetData .fields("PttStnCode")
            clsVTM.GetData .fields("LfhVtmCode")
            
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("tLfdSmryId")) = Format(.fields("LfhDate"), "yyyymmdd") & Format(.fields("LfhCode"), "0000000")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("LfdCode")) = .fields("LfhCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("VtmName")) = clsVTM.mName_str
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("LrcVchNo")) = .fields("LfhVchNo")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("LfdDate")) = Dtoc(.fields("LfhDate"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("LfdRefuAmt")) = ToMyNumFmt(.fields("LfhRefuAmt"))
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
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("tLfdSmryId"), mText
    ElseIf optMonthwise.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("LfdYrMonth"), mText
    ElseIf optDatewise.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("LfdDateYMD"), mText
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

Private Sub txtSearch1Text_GotFocus()
FlashActiveControl txtSearch1Text, True
End Sub

Private Sub txtSearch1Text_LostFocus()
FlashActiveControl txtSearch1Text, False
End Sub

Private Sub mskLrcVchNo_Change()
If fcmbLrcVchNo.CallFromText_Change = False Then
    fcmbLrcVchNo.CallFromText_Change = True
    If InterActiveChange(mskLrcVchNo) = True Then
        fcmbLrcVchNo.mFiltCond = "LhrCode = " & CStr(mLfdLhrCode)
        fcmbLrcVchNo.ReInit
        
        fcmbLrcVchNo.UserText = Array(mskLrcVchNo.Text, mskLrcVchNo.SelStart)
        fcmbLrcVchNo.Show
        mskLrcVchNo.Text = fcmbLrcVchNo.Text
        If fcmbLrcVchNo.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbLrcVchNo.CallFromText_Change = False
End If

End Sub

Private Sub mskLrcVchNo_GotFocus()
FlashActiveControl mskLrcVchNo, True
End Sub

Private Sub mskLrcVchNo_LostFocus()
FlashActiveControl mskLrcVchNo, False
End Sub

Private Sub mskLrcVchNo_Validate(Cancel As Boolean)
If Val(fcmbLrcVchNo.BoundText) <= 0 Then
    ErrorBox "Invalid Selection !!!"
    mskLrcVchNo.SetFocus
    Cancel = True
Else
    If Val(fcmbLrcVchNo.BoundText) <> mLrcCode_old Or FormAddEditMode = cFORM_ADDMODE Then
        clsLRC.GetHdrData Val(fcmbLrcVchNo.BoundText)
        clsVTM.GetData clsLRC.mTrnVtmCode_lng
        
        txtLrcVtmName.Text = clsVTM.mName_str
        dtpLrcDate.Text = Dtoc(clsLRC.mTrnDate_dt)
        mskLrcAmtAftDisc.Text = ToMyNumFmt(clsLRC.mLhrAmtAftDisc_dbl)
        mskLrcAdvAmt.Text = ToMyNumFmt(clsLRC.mLhrAdvAmt_dbl)
        mskLrcRecdAmt.Text = ToMyNumFmt(clsLRC.mLhrRecdAmt_dbl)
        mskLrcDepoAmt.Text = ToMyNumFmt(clsLRC.mLhrDepoAmt_dbl)
        Rem mskLfdRefuAmt.Text =
        mskLrcRefuAmtExcl.Text = ToMyNumFmt(clsLRC.mLhrRefuAmt_dbl - mLfdRefuAmt_old)   '''  Val(UnMyNumFmt(mskLfdRefuAmt.Text))
        mskLrcBalAmt.Text = ToMyNumFmt(clsLRC.mLhrBalAmt_dbl)
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

Private Sub txtLhrVtmName_GotFocus()
FlashActiveControl txtLhrVtmName, True
End Sub

Private Sub txtLhrVtmName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call ShowOldLhrListByLhrNo
ElseIf MyAddNewKey(Shift, KeyCode) = True Then

ElseIf Shift = 0 And KeyCode = vbKeyF6 Then
    
End If

End Sub

Private Sub txtLhrVtmName_LostFocus()
FlashActiveControl txtLhrVtmName, False
End Sub

Private Sub ShowOldLfdCodeDesc(ByVal mOldLrcCode As Long)
Dim tRecset As New ADODB.Recordset

With tRecset
.open "Select * from LabRefdHdr where LfhCode=" & CStr(mOldLrcCode) & "", dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    clsVTM.GetData .fields("LfhVtmCode")
    lblOldLfdCodeDesc.Caption = RTrim(clsVTM.mName_str) & " No.:" & CStr(.fields("LfhVchNo")) & " Dated:" & Dtoc(.fields("LfhDate"))
Else
    lblOldLfdCodeDesc.Caption = "#" & CStr(mOldLrcCode) & "#"
End If
End With
CloseTable tRecset

End Sub

Private Function GetOldLfdCodeFromPttCode(ByVal mPttCode As Long) As Long
Dim tRecset As New ADODB.Recordset

With tRecset
.open "Select top 1 * from LabRefdHdr where LfhPttCode=" & CStr(mPttCode) & " order by LfhDate desc,LfhVchNo desc,LfhCode desc", dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    GetOldLfdCodeFromPttCode = .fields("LfhCode")
Else
    GetOldLfdCodeFromPttCode = 0
End If
End With
CloseTable tRecset

End Function

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

Private Sub ShowOldLhrListByLhrNo()
Dim tRecset As New ADODB.Recordset, mOldLhrCode As Long, mOldLhrPttCode As Long

If fcmbOldLhrByLhrNo.CallFromText_Change = False Then
    fcmbOldLhrByLhrNo.CallFromText_Change = True
    If InterActiveChange(txtLhrVtmName) = True Then
        If fcmbOldLhrByLhrNo.LRecordCount = 0 Then
            fcmbOldLhrByLhrNo.mFiltCond = ""
            fcmbOldLhrByLhrNo.ReInit
        End If
        
        fcmbOldLhrByLhrNo.UserText = Array("", 0)
        fcmbOldLhrByLhrNo.Show
        If FormAddEditMode = cFORM_ADDMODE And Mfgrd2.Rows = 2 And fcmbOldLhrByLhrNo.ListSelected = True And Val(fcmbOldLhrByLhrNo.BoundText) > 0 Then
            mOldLhrCode = Val(fcmbOldLhrByLhrNo.BoundText)
            Set tRecset = dbHmsDatabase.Execute("Select * from LabHdr where LhrCode = " & CStr(mOldLhrCode) & "")
            If tRecset.EOF = False Then
                mOldLhrPttCode = tRecset.fields("LhrPttCode")
            End If
            CloseTable tRecset
            If mOldLhrCode > 0 And mOldLhrPttCode > 0 Then
                mLfdPttCode = mOldLhrPttCode
                ShowPatData mLfdPttCode
                Call StorePatOldData
                'ShowPttDiscPer mLfdPttCode
                
                mLfdLhrCode = mOldLhrCode
                ShowLhrData mLfdLhrCode
                Call StoreLhrOldData
                
                mLfdOldLfdCode = GetOldLfdCodeFromPttCode(mLfdPttCode)
                ShowOldLfdCodeDesc mLfdOldLfdCode
            End If
        Else
            If fcmbOldLhrByLhrNo.ListSelected = True And Val(fcmbOldLhrByLhrNo.BoundText) > 0 Then
                If FormAddEditMode = cFORM_EDITMODE Then
                    AlertBox "Prohibited in Edit Mode !!!"
                ElseIf Mfgrd2.Rows > 2 Then
                    AlertBox "Prohibited After Refunding Amount !!!"
                End If
            End If
        End If
    End If
    fcmbOldLhrByLhrNo.CallFromText_Change = False
End If
CloseTable tRecset, mCheckOpen:=True

End Sub

Private Sub ShowOldLrcListByPttRegNo()
Dim tRecset As New ADODB.Recordset, mOldLhrCode As Long, mOldLhrPttCode As Long

If fcmbOldLrcByPttRegNo.CallFromText_Change = False Then
    fcmbOldLrcByPttRegNo.CallFromText_Change = True
    If InterActiveChange(mskPttRegNo) = True Then
        If fcmbOldLrcByPttRegNo.LRecordCount = 0 Then
            fcmbOldLrcByPttRegNo.mFiltCond = ""
            fcmbOldLrcByPttRegNo.ReInit
        End If
        
        fcmbOldLrcByPttRegNo.UserText = Array("", 0)
        fcmbOldLrcByPttRegNo.Show
        If fcmbOldLrcByPttRegNo.ListSelected = True And Val(fcmbOldLrcByPttRegNo.BoundText) > 0 Then
            If FormAddEditMode = cFORM_ADDMODE And Mfgrd2.Rows = 2 Then
                mOldLhrCode = Val(fcmbOldLrcByPttRegNo.LFieldValue("LhrCode"))
                Set tRecset = dbHmsDatabase.Execute("Select * from LabHdr where LhrCode = " & CStr(mOldLhrCode) & "")
                If tRecset.EOF = False Then
                    mOldLhrPttCode = tRecset.fields("LhrPttCode")
                End If
                CloseTable tRecset
                If mOldLhrCode > 0 And mOldLhrPttCode > 0 Then
                    mLfdPttCode = mOldLhrPttCode
                    ShowPatData mLfdPttCode
                    Call StorePatOldData
                    'ShowPttDiscPer mLfdPttCode
                    
                    mLfdLhrCode = mOldLhrCode
                    ShowLhrData mLfdLhrCode
                    Call StoreLhrOldData
                    
                    mLfdOldLfdCode = GetOldLfdCodeFromPttCode(mLfdPttCode)
                    ShowOldLfdCodeDesc mLfdOldLfdCode
                End If
            Else
                If FormAddEditMode = cFORM_EDITMODE Then
                    AlertBox "Prohibited in Edit Mode !!!"
                ElseIf Mfgrd2.Rows > 2 Then
                    AlertBox "Prohibited After Refunding Amount !!!"
                End If
            End If
        End If
    End If
    fcmbOldLrcByPttRegNo.CallFromText_Change = False
End If
CloseTable tRecset, mCheckOpen:=True

End Sub

Private Sub ShowOldLrcListByPttName()
Dim tRecset As New ADODB.Recordset, mOldLhrCode As Long, mOldLhrPttCode As Long

If fcmbOldLrcByPttName.CallFromText_Change = False Then
    fcmbOldLrcByPttName.CallFromText_Change = True
    If InterActiveChange(txtPttName) = True Then
        If fcmbOldLrcByPttName.LRecordCount = 0 Then
            fcmbOldLrcByPttName.mFiltCond = ""
            fcmbOldLrcByPttName.ReInit
        End If
        
        fcmbOldLrcByPttName.UserText = Array("", 0)
        fcmbOldLrcByPttName.Show
        If FormAddEditMode = cFORM_ADDMODE And Mfgrd2.Rows = 2 And fcmbOldLrcByPttName.ListSelected = True And Val(fcmbOldLrcByPttName.BoundText) > 0 Then
            mOldLhrCode = Val(fcmbOldLrcByPttName.LFieldValue("LhrCode"))
            Set tRecset = dbHmsDatabase.Execute("Select * from LabHdr where LhrCode = " & CStr(mOldLhrCode) & "")
            If tRecset.EOF = False Then
                mOldLhrPttCode = tRecset.fields("LhrPttCode")
            End If
            CloseTable tRecset
            If mOldLhrCode > 0 And mOldLhrPttCode > 0 Then
                mLfdPttCode = mOldLhrPttCode
                ShowPatData mLfdPttCode
                Call StorePatOldData
                'ShowPttDiscPer mLfdPttCode
                
                mLfdLhrCode = mOldLhrCode
                ShowLhrData mLfdLhrCode
                Call StoreLhrOldData
                
                mLfdOldLfdCode = GetOldLfdCodeFromPttCode(mLfdPttCode)
                ShowOldLfdCodeDesc mLfdOldLfdCode
            End If
        Else
            If fcmbOldLrcByPttName.ListSelected = True And Val(fcmbOldLrcByPttName.BoundText) > 0 Then
                If FormAddEditMode = cFORM_EDITMODE Then
                    AlertBox "Prohibited in Edit Mode !!!"
                ElseIf Mfgrd2.Rows > 2 Then
                    AlertBox "Prohibited After Refunding Amount !!!"
                End If
            End If
        End If
    End If
    fcmbOldLrcByPttName.CallFromText_Change = False
End If
CloseTable tRecset, mCheckOpen:=True

End Sub

Private Sub VisibleControls(ByVal mShowItem As Boolean, Optional ByVal mRowPos)
Rem Important - dtlAddEditMode & dtlAddMode must be initialised prior to this
If Me.Visible = True Then
    txtVoid.SetFocus
End If
If IsMissing(mRowPos) = False Then
    mskLfdSno.Top = mRowPos
    mskLrcVchNo.Top = mRowPos
    txtLrcVtmName.Top = mRowPos
    dtpLrcDate.Top = mRowPos
    mskLrcAmtAftDisc.Top = mRowPos
    mskLrcAdvAmt.Top = mRowPos
    mskLrcRecdAmt.Top = mRowPos
    mskLrcDepoAmt.Top = mRowPos
    mskLrcRefuAmtExcl.Top = mRowPos
    mskLfdRefuAmt.Top = mRowPos
    mskLrcBalAmt.Top = mRowPos
    cmdOK.Top = mRowPos
End If

mskLfdSno.Text = 0
mskLrcVchNo.Text = 0: fcmbLrcVchNo.BoundText = ""
txtLrcVtmName.Text = ""
dtpLrcDate.Text = ""
mskLrcAmtAftDisc.Text = ToMyNumFmt(0)
mskLrcAdvAmt.Text = ToMyNumFmt(0)
mskLrcRecdAmt.Text = ToMyNumFmt(0)
mskLrcDepoAmt.Text = ToMyNumFmt(0)
mskLrcRefuAmtExcl.Text = ToMyNumFmt(0)
mskLfdRefuAmt.Text = ToMyNumFmt(0)
mskLrcBalAmt.Text = ToMyNumFmt(0)

Call ValidDtl

mskLfdSno.Visible = mShowItem
mskLrcVchNo.Visible = mShowItem
txtLrcVtmName.Visible = mShowItem
dtpLrcDate.Visible = mShowItem
mskLrcAmtAftDisc.Visible = mShowItem
mskLrcAdvAmt.Visible = mShowItem
mskLrcRecdAmt.Visible = mShowItem
mskLrcDepoAmt.Visible = mShowItem
mskLrcRefuAmtExcl.Visible = mShowItem
mskLfdRefuAmt.Visible = mShowItem
mskLrcBalAmt.Visible = mShowItem
cmdOK.Visible = mShowItem

frHeader.Enabled = (mShowItem = False)
Mfgrd2.Enabled = (mShowItem = False)
frFooter.Enabled = (mShowItem = False)
cmdSaveForm.Enabled = (mShowItem = False)

End Sub

Private Sub ValidDtl()
Dim mDataOk As Boolean
mDataOk = (Val(UnMyNumFmt(mskLfdSno.Text)) > 0 And Val(fcmbLrcVchNo.BoundText) > 0 And Val(UnMyNumFmt(mskLfdRefuAmt.Text)) > 0 And chkLfdRefuAmt() = True)
cmdOK.Caption = IIf(mDataOk = True, "&OK", "&Cancel")
cmdOK.BackColor = IIf(mDataOk = True, &H80FF80, &H8080FF)
End Sub

Private Sub CalcFtrTotal()
Dim mLrcAmtAftDiscTot As Double, mLrcAdvAmtTot As Double, mLrcRecdAmtTot As Double, mLrcDepoAmtTot As Double, mLrcRefuAmtExclTot As Double, mLfdRefuAmtTot As Double, mLrcBalAmtTot As Double

mLrcAmtAftDiscTot = FlexColSum(Mfgrd2, X2LRCAMTAFTDISC_COL)
mLrcAdvAmtTot = FlexColSum(Mfgrd2, X2LRCADVAMT_COL)
mLrcRecdAmtTot = FlexColSum(Mfgrd2, X2LRCRECDAMT_COL)
mLrcDepoAmtTot = FlexColSum(Mfgrd2, X2LRCDEPOAMT_COL)
mLrcRefuAmtExclTot = FlexColSum(Mfgrd2, X2LRCREFUAMTEXCL_COL)
mLfdRefuAmtTot = FlexColSum(Mfgrd2, X2LFDREFUAMT_COL)
mLrcBalAmtTot = FlexColSum(Mfgrd2, X2LRCBALAMT_COL)

lblLrcAmtAftDiscTot.Caption = ToMyNumFmt(mLrcAmtAftDiscTot)
lblLrcAdvAmtTot.Caption = ToMyNumFmt(mLrcAdvAmtTot)
lblLrcRecdAmtTot.Caption = ToMyNumFmt(mLrcRecdAmtTot)
lblLrcDepoAmtTot.Caption = ToMyNumFmt(mLrcDepoAmtTot)
lblLrcRefuAmtExclTot.Caption = ToMyNumFmt(mLrcRefuAmtExclTot)
lblLfdRefuAmtTot.Caption = ToMyNumFmt(mLfdRefuAmtTot)
lblLrcBalAmtTot.Caption = ToMyNumFmt(mLrcBalAmtTot)

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
Dim mLfdVchNo As Long

If Val(fcmbLfdVtmName.BoundText) < 1 Then
    ErrorBox "Invalid Voucher Type !!!"
    txtLfdVtmName(1).SetFocus
    Exit Sub
End If
If Val(UnMyNumFmt(mskLfdVchNo(1).Text)) < 1 Then
    ErrorBox "Invalid Voucher No. !!!"
    mskLfdVchNo(1).SetFocus
    Exit Sub
Else
    mLfdVchNo = Val(UnMyNumFmt(mskLfdVchNo(1).Text))
    If ChkIsExistVTypeNo(dbHmsDatabase, mTableName:="LabRefdHdr", mChkFieldName:="LfhVchNo", mChkFieldValue:=CStr(mLfdVchNo), mVtmFieldName:="LfhVtmCode", mVtmFieldValue:=Val(fcmbLfdVtmName.BoundText), mFinYrFieldName:="LfhCmpCode", mFinYrFieldValue:=sFinYrCmpCode) = False Then
        ErrorBox "Voucher No. does not Exist !!!"
        mskLfdVchNo(1).SetFocus
        Exit Sub
    End If
End If
If Val(UnMyNumFmt(mskLfdVchNo(2).Text)) < 1 Then
    ErrorBox "Invalid Voucher No. !!!"
    mskLfdVchNo(2).SetFocus
    Exit Sub
Else
    mLfdVchNo = Val(UnMyNumFmt(mskLfdVchNo(2).Text))
    If ChkIsExistVTypeNo(dbHmsDatabase, mTableName:="LabRefdHdr", mChkFieldName:="LfhVchNo", mChkFieldValue:=CStr(mLfdVchNo), mVtmFieldName:="LfhVtmCode", mVtmFieldValue:=Val(fcmbLfdVtmName.BoundText), mFinYrFieldName:="LfhCmpCode", mFinYrFieldValue:=sFinYrCmpCode) = False Then
        ErrorBox "Voucher No. does not Exist !!!"
        mskLfdVchNo(2).SetFocus
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
Dim mFromLfdVchNo As Long, mToLfdVchNo As Long, mLfdVtmCode As Long
Dim fCRView As Form

mFromLfdVchNo = Val(UnMyNumFmt(mskLfdVchNo(1).Text))
mToLfdVchNo = Val(UnMyNumFmt(mskLfdVchNo(2).Text))
mLfdVtmCode = Val(fcmbLfdVtmName.BoundText)

frmMain.Cryst.Reset
frmMain.Cryst.ReportFileName = Trim(Right(cmbCRList.List(cmbCRList.ListIndex), 100))
frmMain.Cryst.DiscardSavedData = True
frmMain.Cryst.DataFiles(0) = dbComDatabaseFullPath

frmMain.Cryst.SelectionFormula = "{vewLabRefd.LfhVchNo}>=" & CStr(mFromLfdVchNo) & " and {vewLabRefd.LfhVchNo}<=" & CStr(mToLfdVchNo) & " and {vewLabRefd.LfhVtmCode}=" & CStr(mLfdVtmCode) & " and {vewLabRefd.LfhCmpCode}=" & CStr(sFinYrCmpCode)
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
        fcmbLfdVtmName.BoundText = CStr(datRecset.fields("LfhVtmCode"))
        txtLfdVtmName(1).Text = fcmbLfdVtmName.Text
        mskLfdVchNo(1).Text = datRecset.fields("LfhVchNo")
        mskLfdVchNo(2).Text = datRecset.fields("LfhVchNo")
        ' ----------------
        Call AssignPrintPara
        frPrintCRList.ZOrder
        frPrintCRList.Visible = True
        Mfgrd1.Enabled = False
        cmbPrintDest.SetFocus
    End If
    
ElseIf mCallSource = "SaveEvent" Then
    txtLfdVtmName(1).Text = fcmbLfdVtmName.Text
    mskLfdVchNo(1).Text = CStr(Val(UnMyNumFmt(mskLfdVchNo(0).Text)))
    mskLfdVchNo(2).Text = CStr(Val(UnMyNumFmt(mskLfdVchNo(0).Text)))
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

If Dir(LabRefdCRLFileFullPath) = "" Then
    fhand = FreeFile
    Open LabRefdCRLFileFullPath For Output As #fhand
    Write #fhand, "Lab (Receipt) Refund", "LabRefd.Rpt", True
    Close #fhand
End If

cmbCRList.Clear
fhand = FreeFile
Open LabRefdCRLFileFullPath For Input As #fhand
Do While EOF(fhand) = False
    Input #fhand, mCRLTitle, mCRLFileName, mCRLDefault
    If Dir(LabRefdCRLFileFullPath(mFileName:=mCRLFileName)) <> "" Then
        cmbCRList.AddItem mCRLTitle & Space(100) & LabRefdCRLFileFullPath(mFileName:=mCRLFileName)
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

