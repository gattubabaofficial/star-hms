VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "Mscomctl.ocx"
Begin VB.Form frmOutdoorRefdRcpt 
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
      Height          =   315
      ItemData        =   "OpdRfRc.frx":0000
      Left            =   0
      List            =   "OpdRfRc.frx":000D
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
      Height          =   9615
      Left            =   120
      TabIndex        =   52
      Top             =   720
      Width           =   13215
      Begin VB.TextBox mskOrcRefuAmtExcl 
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
      Begin VB.TextBox mskOrcAdvAmt 
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
      Begin VB.TextBox mskOrcBalAmt 
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
      Begin VB.TextBox mskOrcDepoAmt 
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
      Begin VB.TextBox mskOrcRecdAmt 
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
         Left            =   3840
         TabIndex        =   40
         Text            =   "0.00"
         Top             =   6000
         Width           =   1215
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
         Left            =   2400
         MaxLength       =   50
         TabIndex        =   39
         TabStop         =   0   'False
         Text            =   "dd/mm/yyyy"
         Top             =   6000
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
         Width           =   12975
         Begin VB.Label lblOrcRefuAmtExclTot 
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
            TabIndex        =   124
            Top             =   240
            Width           =   1215
         End
         Begin VB.Label lblOrcAdvAmtTot 
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
         Begin VB.Label lblOrcBalAmtTot 
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
         Begin VB.Label lblOfdRefuAmtTot 
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
            TabIndex        =   121
            Top             =   240
            Width           =   1215
         End
         Begin VB.Label lblOrcDepoAmtTot 
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
         Begin VB.Label lblOrcRecdAmtTot 
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
            TabIndex        =   118
            Top             =   1440
            Width           =   1575
         End
         Begin VB.Label lblOldOfdCodeDesc 
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
            TabIndex        =   117
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
            TabIndex        =   115
            Top             =   240
            Visible         =   0   'False
            Width           =   3495
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
            Left            =   3720
            TabIndex        =   114
            Top             =   240
            Width           =   1215
         End
      End
      Begin VB.TextBox mskOfdSno 
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
         Width           =   12975
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
            Width           =   4095
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
         Begin VB.TextBox mskOfdOpgCode 
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
         Begin VB.TextBox txtOfdTime_str 
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
            Top             =   4200
            Width           =   855
         End
         Begin VB.TextBox dtpOfdDate 
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
            Top             =   4200
            Width           =   1455
         End
         Begin VB.TextBox mskOfdVchNo 
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
            Width           =   1455
         End
         Begin VB.TextBox txtOfdVtmName 
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
         Begin VB.TextBox txtOfdPrefix 
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
            Left            =   8160
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
            Left            =   10560
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
            Width           =   4095
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
         Begin VB.TextBox mskOfdPttCode 
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
         Begin VB.TextBox txtOfhRemark 
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
            Left            =   7560
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
            Left            =   9960
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
            Left            =   10560
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
            Left            =   10800
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
            TabIndex        =   94
            Top             =   3000
            Width           =   1935
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Opd No:"
            BeginProperty Font 
               Name            =   "Verdana"
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
            Left            =   7560
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
            Left            =   9960
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
            Width           =   12975
         End
         Begin VB.Shape Shape1 
            BackColor       =   &H00FFFFC0&
            BackStyle       =   1  'Opaque
            Height          =   1215
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
            Top             =   4080
            Width           =   12975
         End
      End
      Begin VB.TextBox mskOrcVchNo 
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
      Begin VB.TextBox mskOfdRefuAmt 
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
         Width           =   12975
         _ExtentX        =   22886
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
         Begin VB.TextBox mskOfdVchNo 
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
         Begin VB.TextBox txtOfdVtmName 
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
         Begin VB.TextBox mskOfdVchNo 
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
            TabIndex        =   134
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
            TabIndex        =   133
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
            TabIndex        =   132
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
            TabIndex        =   131
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
            TabIndex        =   130
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
            TabIndex        =   129
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
            TabIndex        =   128
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
            TabIndex        =   127
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
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Outdoor Refund Receipt"
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
Attribute VB_Name = "frmOutdoorRefdRcpt"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim mFormLoaded As Boolean, mLastKeyPressed As Integer, mMaskKeyPressed As Integer
Dim mFormUIdCode As Long, mFormUIdFileName As String, mFormAcsPermFileName As String
Dim mOfdCode As Long, mOfdOpgCode As Long, mOfdPttCode As Long, mQryPttCode As Long, mOfdOldOfdCode As Long, dtlAddEditMode As Boolean, dtlAddMode As Boolean, dtlEditCanceled As Boolean
Dim mRemoteAccess As Boolean, mEntrySaved As Boolean, mEntryAborted As Boolean
Dim dbAcDatabase As New ADODB.Connection, dbVgnDatabase As New ADODB.Connection, dbGrpDatabase As New ADODB.Connection, dbComDatabase As New ADODB.Connection
Dim datRecset As New ADODB.Recordset
Dim mPttRegNo_old As Long
Dim mOfdCode_old As Long, mOfdDate_old As Date, mOfdVtmCode_old As Long, mOfdVchNo_old As Long
Dim mOrcCode_old As Long, mOfdRefuAmt_old As Double
Dim clsJRN As clsJournal, clsAH As clsAccountHead, clsOPG As clsVgnSnglTranEntry, clsORC As clsVgnOpdMultiTranEntry, clsOFD As clsVgnOpdMultiTranEntry, clsARA As clsComMastEntry, clsSTN As clsComMastEntry, clsVTM As clsComMastEntry, clsVGNOPT As clsVgnOpdOptionsEntry
Dim clsPAT As clsVgnMasterEntry, clsPCG As clsVgnMasterEntry, clsDCT As clsVgnMasterEntry, clsDIG As clsVgnMasterEntry, clsSRV As clsVgnMasterEntry
Dim mActiveControl As Object, clsListStru As clsSelectQueryStructure
Dim fcmbOfdVtmName As clsComFlexSearch
Dim fcmbOldOpgByOpgNo As clsVgnFlexSearch, fcmbOldOpgByPttRegNo As clsVgnFlexSearch, fcmbOldOpgByPttName As clsVgnFlexSearch, fcmbPttName As clsVgnFlexSearch, fcmbPttRegNo As clsVgnFlexSearch, fcmbOrcVchNo As clsVgnFlexSearch

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
Const X2OFDICODE_COL = 0
Const X2OFDSNO_COL = 1
Const X2ORCVCHNO_COL = 2
Const X2ORCVTMNAME_COL = 3
Const X2ORCDATE_COL = 4
Const X2ORCAMTAFTDISC_COL = 5
Const X2ORCADVAMT_COL = 6
Const X2ORCRECDAMT_COL = 7
Const X2ORCDEPOAMT_COL = 8
Const X2ORCREFUAMTEXCL_COL = 9
Const X2OFDREFUAMT_COL = 10
Const X2ORCBALAMT_COL = 11
Const X2ORCCODE_COL = 12
Const X2OFDRECSTATE_COL = 13
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
mOfdCode = mAccessCode
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
                    dtpFromDate.Text = Dtoc(MonthStartDate(DateSerial(Val(Left(.fields("OfdYrMonth"), 4)), Val(Right(.fields("OfdYrMonth"), 2)), 1)))
                    dtpToDate.Text = Dtoc(MonthEndDate(DateSerial(Val(Left(.fields("OfdYrMonth"), 4)), Val(Right(.fields("OfdYrMonth"), 2)), 1)))
                    optMonthwise.Value = False
                    optDatewise.Value = True
                ElseIf optDatewise.Value = True Then
                    dtpFromDate.Text = Dtoc(.fields("OfhDate"))
                    dtpToDate.Text = Dtoc(.fields("OfhDate"))
                    optDatewise.Value = False
                    optDetailed.Value = True
                ElseIf optPatientwise.Value = True Then
                    mQryPttCode = .fields("OfhPttCode")
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
Dim tRecset As New ADODB.Recordset, srow As Integer, mOfdSno As Integer, mOfdICode As Long

srow = Mfgrd2.Row
mOfdSno = Val(Mfgrd2.TextMatrix(srow, X2OFDSNO_COL))
mOfdICode = Val(Mfgrd2.TextMatrix(srow, X2OFDICODE_COL))

If cmdOK.Caption = "&OK" And dtlEditCanceled = False Then
    With clsOFD
    If dtlAddMode = True Then
        .ClearDtl
    Else
        .GetDtlData mOfdCode, mOfdICode
    End If
    .mTrnCode_lng = mOfdCode
    .mTrnDtlSno_int = Val(UnMyNumFmt(mskOfdSno.Text))
    .mTrnDate_dt = Ctod(dtpOfdDate.Text)
    .mTrnCmpCode_int = sFinYrCmpCode
    
    .mOfdPttCode_lng = mOfdPttCode
    .mOfdOhrCode_lng = Val(fcmbOrcVchNo.BoundText)
    .mOfdRefuAmt_dbl = Val(UnMyNumFmt(mskOfdRefuAmt.Text))
    .mOfdRemark_str = ""
    
    If dtlAddMode = True Then
        .AddNewDtl mOfdCode
        mOfdICode = .mTrnDtlICode_lng
    Else
        .UpdateDtl mOfdCode, mOfdICode
    End If
    End With
    
    RefreshDatabase dbVgnDatabase
    With tRecset
    .open "Select * from OutdRefdDtl where OfdCode=" & CStr(mOfdCode) & " and OfdICode=" & CStr(mOfdICode) & "", dbVgnDatabase, adOpenKeyset, adLockOptimistic
    
    clsORC.GetHdrData .fields("OfdOhrCode")
    clsVTM.GetData clsORC.mTrnVtmCode_lng
    
    Mfgrd2.TextMatrix(srow, X2OFDICODE_COL) = .fields("OfdICode")
    Mfgrd2.TextMatrix(srow, X2OFDSNO_COL) = ToMyNumFmt(.fields("OfdSno"), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2ORCVCHNO_COL) = clsORC.mTrnVchNo_lng
    Mfgrd2.TextMatrix(srow, X2ORCVTMNAME_COL) = clsVTM.mName_str
    Mfgrd2.TextMatrix(srow, X2ORCDATE_COL) = clsORC.mTrnDate_dt
    Mfgrd2.TextMatrix(srow, X2ORCAMTAFTDISC_COL) = ToMyNumFmt(clsORC.mOhrAmtAftDisc_dbl)
    Mfgrd2.TextMatrix(srow, X2ORCADVAMT_COL) = ToMyNumFmt(clsORC.mOhrAdvAmt_dbl)
    Mfgrd2.TextMatrix(srow, X2ORCRECDAMT_COL) = ToMyNumFmt(clsORC.mOhrRecdAmt_dbl)
    Mfgrd2.TextMatrix(srow, X2ORCDEPOAMT_COL) = ToMyNumFmt(clsORC.mOhrDepoAmt_dbl)
    Mfgrd2.TextMatrix(srow, X2ORCREFUAMTEXCL_COL) = ToMyNumFmt(clsORC.mOhrRefuAmt_dbl - .fields("OfdRefuAmt"))
    Mfgrd2.TextMatrix(srow, X2OFDREFUAMT_COL) = ToMyNumFmt(.fields("OfdRefuAmt"))
    Mfgrd2.TextMatrix(srow, X2ORCBALAMT_COL) = ToMyNumFmt(clsORC.mOhrBalAmt_dbl)
    Mfgrd2.TextMatrix(srow, X2ORCCODE_COL) = .fields("OfdOhrCode")
    Mfgrd2.TextMatrix(srow, X2OFDRECSTATE_COL) = .fields("OfdRecState")
    
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
    txtSearch1Text_InterActiveChange Format(Ctod(dtpOfdDate.Text), "yyyymmdd") + Format(mOfdCode, "0000000")
ElseIf optMonthwise.Value = True Then
    txtSearch1Text_InterActiveChange Format(Ctod(dtpOfdDate.Text), "yyyy") & "/" & Format(Ctod(dtpOfdDate.Text), "mm")
ElseIf optDatewise.Value = True Then
    txtSearch1Text_InterActiveChange Format(Ctod(dtpOfdDate.Text), "yyyymmdd")
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
        If GetAccessPerm(mOrcAcsPermNo, mRetryCount, mFormAcsPermFileName) = True And mRetryCount = 0 Then
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

Private Sub dtpOfdDate_GotFocus()
FlashActiveControl dtpOfdDate, True
End Sub

Private Sub dtpOfdDate_LostFocus()
FlashActiveControl dtpOfdDate, False
End Sub

Private Sub dtpOfdDate_Validate(Cancel As Boolean)
dtpOfdDate.Text = ToMyDate(dtpOfdDate.Text)
If IsFinYrDate(Ctod(dtpOfdDate.Text)) = False Then
    ErrorBox "Invalid Input !!!"
    dtpOfdDate.SetFocus
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
        If mOfdCode = 0 Then
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

mFormUIdFileName = "OutdRfRc.Uid"
mFormAcsPermFileName = "OutdRfRc.Acp"
mFormUIdCode = GetUIdCode(mProcess:=Me.Name, mUIdFileName:=mFormUIdFileName, mAcsPermFileName:=mFormAcsPermFileName)

mFormLoaded = False
mEntrySaved = False: mEntryAborted = False
SetFormSize Me, frmMain
Call Form_Resize

Call SetVoidControl(txtVoid)
txtSearch1Text.Enabled = False
frConfigure.Visible = False
frPrintCRList.Visible = False

ChkCustomForm Me, CfsFileFullPath("OutdRefd.Cfs")

OpenAcDataSource dbAcDatabase
OpenVgnDataSource dbVgnDatabase
OpenGrpDataSource dbGrpDatabase
OpenComDataSource dbComDatabase

Set clsListStru = New clsSelectQueryStructure

Set clsVGNOPT = New clsVgnOpdOptionsEntry
clsVGNOPT.blnOutdRefdOptMast = True
clsVGNOPT.Init
clsVGNOPT.GetOutdRefdOptData

Set clsAH = New clsAccountHead
Set clsAH.dbAcDatabase = dbAcDatabase
Set clsAH.dbGrpDatabase = dbGrpDatabase

Set clsOPG = New clsVgnSnglTranEntry
Set clsOPG.dbAcDatabase = dbAcDatabase
Set clsOPG.dbVgnDatabase = dbVgnDatabase
clsOPG.blnOutdRegTran = True
clsOPG.Init

Set clsOFD = New clsVgnOpdMultiTranEntry
Set clsOFD.dbAcDatabase = dbAcDatabase
Set clsOFD.dbVgnDatabase = dbVgnDatabase
clsOFD.blnOutdRefdTran = True
clsOFD.Init

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

Set fcmbOfdVtmName = New clsComFlexSearch
Set fcmbOfdVtmName.dbAcDatabase = dbAcDatabase
fcmbOfdVtmName.blnVTypeMastList = True
fcmbOfdVtmName.mListSqlExpr = "Select * from VTypMast where VtmSysCode=" & CStr(cVGN_VTYPE_OUTDOOR_REFD) & " order by VtmName"
fcmbOfdVtmName.Init

Set fcmbOrcVchNo = New clsVgnFlexSearch
Set fcmbOrcVchNo.dbVgnDatabase = dbVgnDatabase
Set fcmbOrcVchNo.dbComDatabase = dbComDatabase
fcmbOrcVchNo.blnOldOrcListByOrcNo = True
fcmbOrcVchNo.Init

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
    datRecset.open "Select * from OutdRefdHdr inner join PatMast on OutdRefdHdr.OfhPttCode=PatMast.PttCode where OfhCode=" & CStr(mOfdCode) & " order by OfhDate,OfhTime", dbVgnDatabase, adOpenKeyset, adLockOptimistic
Else
    datRecset.open "Select * from OutdRefdHdr inner join PatMast on OutdRefdHdr.OfhPttCode=PatMast.PttCode order by OfhDate,OfhTime", dbVgnDatabase, adOpenKeyset, adLockOptimistic
End If
Mfgrd1.FixedCols = 0
Call SmryList

Mfgrd2.FixedRows = 1: Mfgrd2.FixedCols = 0: Mfgrd2.Rows = 2: Mfgrd2.Cols = MFGRD2_COLS: SetGridAutoHeight Mfgrd2

colcnt = X2OFDICODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2OFDICODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2OFDSNO_COL: Mfgrd2.ColWidth(colcnt) = mskOfdSno.Width: Mfgrd2.TextMatrix(0, colcnt) = "Sno": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2ORCVCHNO_COL: Mfgrd2.ColWidth(colcnt) = mskOrcVchNo.Width: Mfgrd2.TextMatrix(0, colcnt) = "Vch.No": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2ORCVTMNAME_COL: Mfgrd2.ColWidth(colcnt) = txtOrcVtmName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Vch.Type": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2ORCDATE_COL: Mfgrd2.ColWidth(colcnt) = dtpOrcDate.Width: Mfgrd2.TextMatrix(0, colcnt) = "Vch.Date": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2ORCAMTAFTDISC_COL: Mfgrd2.ColWidth(colcnt) = mskOrcAmtAftDisc.Width: Mfgrd2.TextMatrix(0, colcnt) = "Amount": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2ORCADVAMT_COL: Mfgrd2.ColWidth(colcnt) = mskOrcAdvAmt.Width: Mfgrd2.TextMatrix(0, colcnt) = "Adv.Amt": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2ORCRECDAMT_COL: Mfgrd2.ColWidth(colcnt) = mskOrcRecdAmt.Width: Mfgrd2.TextMatrix(0, colcnt) = "Recd.Amt": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2ORCDEPOAMT_COL: Mfgrd2.ColWidth(colcnt) = mskOrcDepoAmt.Width: Mfgrd2.TextMatrix(0, colcnt) = "Depo.Amt": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2ORCREFUAMTEXCL_COL: Mfgrd2.ColWidth(colcnt) = mskOrcRefuAmtExcl.Width: Mfgrd2.TextMatrix(0, colcnt) = "PreRefd.Amt": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2OFDREFUAMT_COL: Mfgrd2.ColWidth(colcnt) = mskOfdRefuAmt.Width: Mfgrd2.TextMatrix(0, colcnt) = "Refund Amt": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2ORCBALAMT_COL: Mfgrd2.ColWidth(colcnt) = mskOrcBalAmt.Width: Mfgrd2.TextMatrix(0, colcnt) = "Bal.Amt": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2ORCCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2ORCCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2OFDRECSTATE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2OFDRECSTATE_COL": Mfgrd2.ColAlignment(colcnt) = 7

colcnt = X2OFDSNO_COL: mskOfdSno.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2ORCVCHNO_COL: mskOrcVchNo.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2ORCVTMNAME_COL: txtOrcVtmName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2ORCDATE_COL: dtpOrcDate.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2ORCAMTAFTDISC_COL: mskOrcAmtAftDisc.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2ORCADVAMT_COL: mskOrcAdvAmt.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2ORCRECDAMT_COL: mskOrcRecdAmt.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2ORCDEPOAMT_COL: mskOrcDepoAmt.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2ORCREFUAMTEXCL_COL: mskOrcRefuAmtExcl.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2OFDREFUAMT_COL: mskOfdRefuAmt.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2ORCBALAMT_COL: mskOrcBalAmt.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
cmdOK.Left = mskOrcBalAmt.Left + mskOrcBalAmt.Width

lblOrcAmtAftDiscTot.Left = mskOrcAmtAftDisc.Left - frFooter.Left: lblOrcAmtAftDiscTot.Width = mskOrcAmtAftDisc.Width
lblOrcAdvAmtTot.Left = mskOrcAdvAmt.Left - frFooter.Left: lblOrcAdvAmtTot.Width = mskOrcAdvAmt.Width
lblOrcRecdAmtTot.Left = mskOrcRecdAmt.Left - frFooter.Left: lblOrcRecdAmtTot.Width = mskOrcRecdAmt.Width
lblOrcDepoAmtTot.Left = mskOrcDepoAmt.Left - frFooter.Left: lblOrcDepoAmtTot.Width = mskOrcDepoAmt.Width
lblOrcRefuAmtExclTot.Left = mskOrcRefuAmtExcl.Left - frFooter.Left: lblOrcRefuAmtExclTot.Width = mskOrcRefuAmtExcl.Width
lblOfdRefuAmtTot.Left = mskOfdRefuAmt.Left - frFooter.Left: lblOfdRefuAmtTot.Width = mskOfdRefuAmt.Width
lblOrcBalAmtTot.Left = mskOrcBalAmt.Left - frFooter.Left: lblOrcBalAmtTot.Width = mskOrcBalAmt.Width

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
Set clsOPG = Nothing
Set clsOFD = Nothing
Set clsORC = Nothing
Set clsPAT = Nothing
Set clsPCG = Nothing
Set clsDCT = Nothing
Set clsDIG = Nothing
Set clsSRV = Nothing
Set clsARA = Nothing
Set clsSTN = Nothing
Set clsVTM = Nothing
Set fcmbOldOpgByOpgNo = Nothing
Set fcmbOldOpgByPttRegNo = Nothing
Set fcmbOldOpgByPttName = Nothing
Set fcmbPttRegNo = Nothing
Set fcmbPttName = Nothing
Set fcmbOfdVtmName = Nothing
Set fcmbOrcVchNo = Nothing
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
Dim mPttRegNo As Long, mOfdPttCode As Long, mOpgVchNo As Long, mOfdVchNo As Long
Dim mOrcAmtAftDiscAmtTot As Double, mOrcAdvAmtTot As Double, mOrcRecdAmtTot As Double, mOrcDepoAmtTot As Double, mOrcRefuAmtExclTot As Double, mOfdRefuAmtTot As Double

Data_Verify = False
If FormAddEditMode = cFORM_EDITMODE And Val(mskFormBoundField.Text) < 1 Then
    ErrorBox "Invalid Key Value !!!"
    txtPttName.SetFocus
    GoTo EndSub
End If
Rem patient validation
mOfdPttCode = Val(mskOfdPttCode.Text)
If mOfdPttCode < 1 Then
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
    If mPttRegNo = 0 And clsVGNOPT.mOfdPttRegNoNotZero_bln = True Then
        AlertBox "Prohibited Zero Patient Reg.No. !!!"
        mskPttRegNo.SetFocus
        GoTo EndSub
    End If
End If
Rem outdoor registration validation
If Val(mskOfdOpgCode.Text) < 1 Then
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
Rem outdoor refund receipt validations
mOfdVchNo = Val(UnMyNumFmt(mskOfdVchNo(0).Text))
If mOfdVchNo > 0 Then
    If mOfdVchNo <> mOfdVchNo_old Or Val(fcmbOfdVtmName.BoundText) <> mOfdVtmCode_old Or Ctod(dtpOfdDate.Text) <> mOfdDate_old Or FormAddEditMode = cFORM_ADDMODE Then
        If ChkIsDuplVTypeNo(dbVgnDatabase, dbAcDatabase, mTableName:="OutdRefdHdr", mChkFieldName:="OfhVchNo", mChkFieldValue:=mOfdVchNo, mKeyFieldName:="OfhCode", mKeyFieldValue:=mOfdCode, mVtmFieldName:="OfhVtmCode", mVtmFieldValue:=Val(fcmbOfdVtmName.BoundText), mFinYrFieldName:="OfhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="OfhDate", mDateFieldValue:=Ctod(dtpOfdDate.Text)) = True Then
            ErrorBox "Duplicate Voucher No. !!!"
            mskOfdVchNo(0).SetFocus
            ' ---------------
            If FormAddEditMode = True Then
                mOfdVchNo = GetNextVTypeNo(dbVgnDatabase, dbAcDatabase, dbComDatabase, mTableName:="OutdRefdHdr", mFieldName:="OfhVchNo", mVtmFieldName:="OfhVtmCode", mVtmFieldValue:=Val(fcmbOfdVtmName.BoundText), mFinYrFieldName:="OfhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="OfhDate", mDateFieldValue:=Ctod(dtpOfdDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
            Else
                mOfdVchNo = mOfdVchNo_old
            End If
            mskOfdVchNo(0).Text = ToMyNumFmt(mOfdVchNo, mDecimals:=0)
            GoTo EndSub
        End If
    End If
Else
    ErrorBox "Invalid Input !!!"
    mskOfdVchNo(0).SetFocus
    GoTo EndSub
End If
If IsDate(dtpOfdDate.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpOfdDate.SetFocus
    GoTo EndSub
Else
    If IsFinYrDate(Ctod(dtpOfdDate.Text)) = False Then
        ErrorBox "Invalid Input !!!"
        dtpOfdDate.SetFocus
        GoTo EndSub
    End If
End If
If TimeToMin(txtOfdTime_str.Text) > cDAYMINUTES Then
    ErrorBox "Invalid Input !!!"
    txtOfdTime_str.SetFocus
    GoTo EndSub
End If
mOfdRefuAmtTot = Val(UnMyNumFmt(lblOfdRefuAmtTot.Caption))
If mOfdRefuAmtTot < 0 Then
    ErrorBox "Invalid Input !!!"
    Mfgrd2.SetFocus
    GoTo EndSub
End If
mOrcAmtAftDiscAmtTot = Val(UnMyNumFmt(lblOrcAmtAftDiscTot.Caption))
mOrcAdvAmtTot = Val(UnMyNumFmt(lblOrcAdvAmtTot.Caption))
mOrcRecdAmtTot = Val(UnMyNumFmt(lblOrcRecdAmtTot.Caption))
mOrcDepoAmtTot = Val(UnMyNumFmt(lblOrcDepoAmtTot.Caption))
mOrcRefuAmtExclTot = Val(UnMyNumFmt(lblOrcRefuAmtExclTot.Caption))
If (mOfdRefuAmtTot + mOrcRefuAmtExclTot) > (mOrcAdvAmtTot + mOrcRecdAmtTot + mOrcDepoAmtTot) Then
    ErrorBox "Excess Refund Amount !!!"
    Mfgrd2.SetFocus
    GoTo EndSub
End If

Data_Verify = True

EndSub:
Exit Function

End Function

Private Function Data_NetwAuth() As Boolean
Dim mOfdVchNo As Long
Data_NetwAuth = False

mOfdVchNo = Val(UnMyNumFmt(mskOfdVchNo(0).Text))
If mOfdVchNo <> mOfdVchNo_old Or Val(fcmbOfdVtmName.BoundText) <> mOfdVtmCode_old Or Ctod(dtpOfdDate.Text) <> mOfdDate_old Or FormAddEditMode = cFORM_ADDMODE Then
    If ChkIsDuplVTypeNo(dbVgnDatabase, dbAcDatabase, mTableName:="OutdRefdHdr", mChkFieldName:="OfhVchNo", mChkFieldValue:=mOfdVchNo, mKeyFieldName:="OfhCode", mKeyFieldValue:=mOfdCode, mVtmFieldName:="OfhVtmCode", mVtmFieldValue:=Val(fcmbOfdVtmName.BoundText), mFinYrFieldName:="OfhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="OfhDate", mDateFieldValue:=Ctod(dtpOfdDate.Text)) = True Then
        ErrorBox "Duplicate Voucher No. !!!"
        mskOfdVchNo(0).SetFocus
        ' ---------------
        If FormAddEditMode = True Then
            mOfdVchNo = GetNextVTypeNo(dbVgnDatabase, dbAcDatabase, dbComDatabase, mTableName:="OutdRefdHdr", mFieldName:="OfhVchNo", mVtmFieldName:="OfhVtmCode", mVtmFieldValue:=Val(fcmbOfdVtmName.BoundText), mFinYrFieldName:="OfhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="OfhDate", mDateFieldValue:=Ctod(dtpOfdDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
        Else
            mOfdVchNo = mOfdVchNo_old
        End If
        mskOfdVchNo(0).Text = ToMyNumFmt(mOfdVchNo, mDecimals:=0)
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
Dim srow As Integer, mOfdICode As Long, mDeleteit As Boolean
srow = Mfgrd2.Row
mOfdICode = Val(Mfgrd2.TextMatrix(srow, X2OFDICODE_COL))

If MyDeleteKey(Shift, KeyCode, mCheckCtrlMask:=False) = True And mOfdICode > 0 Then
    mDeleteit = True
    If mDeleteit = True Then
        mDeleteit = CanDelete()
    End If
    If mDeleteit = True Then
        clsOFD.DeleteDtl mOfdCode, mOfdICode
        
        ShowDtlData mOfdCode
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
        mskOfdSno.Text = ToMyNumFmt(FlexNextSeqno(Mfgrd2, X2OFDSNO_COL), mDecimals:=0)
        mskOrcVchNo.Text = "": fcmbOrcVchNo.BoundText = ""
    Else
        With Mfgrd2
        mskOfdSno.Text = .TextMatrix(srow, X2OFDSNO_COL)
        fcmbOrcVchNo.BoundText = .TextMatrix(srow, X2ORCCODE_COL): mskOrcVchNo.Text = ToMyNumFmt(Val(fcmbOrcVchNo.Text), mDecimals:=0)
        txtOrcVtmName.Text = .TextMatrix(srow, X2ORCVTMNAME_COL)
        dtpOrcDate.Text = .TextMatrix(srow, X2ORCDATE_COL)
        mskOrcAmtAftDisc.Text = .TextMatrix(srow, X2ORCAMTAFTDISC_COL)
        mskOrcAdvAmt.Text = .TextMatrix(srow, X2ORCADVAMT_COL)
        mskOrcRecdAmt.Text = .TextMatrix(srow, X2ORCRECDAMT_COL)
        mskOrcDepoAmt.Text = .TextMatrix(srow, X2ORCDEPOAMT_COL)
        mskOrcRefuAmtExcl.Text = .TextMatrix(srow, X2ORCREFUAMTEXCL_COL)
        mskOfdRefuAmt.Text = .TextMatrix(srow, X2OFDREFUAMT_COL)
        mskOrcBalAmt.Text = .TextMatrix(srow, X2ORCBALAMT_COL)
        End With
    End If
    mskOrcVchNo.SetFocus
    Call ValidDtl
    
    mOrcCode_old = Val(fcmbOrcVchNo.BoundText)
    mOfdRefuAmt_old = Val(UnMyNumFmt(mskOfdRefuAmt.Text))
End If

End Sub

Private Sub Mfgrd2_RowColChange()
ShowActiveFlexRow Mfgrd2

End Sub

Private Sub mskOfdRefuAmt_GotFocus()
FlashActiveControl mskOfdRefuAmt, True
End Sub

Private Sub mskOfdRefuAmt_LostFocus()
FlashActiveControl mskOfdRefuAmt, False
End Sub

Private Sub mskOfdRefuAmt_Validate(Cancel As Boolean)
If chkOfdRefuAmt() = False Then
    mskOfdRefuAmt.SetFocus
    Cancel = True
Else
    Call ValidDtl
End If

End Sub

Private Function chkOfdRefuAmt() As Boolean
Dim mRtnval As Boolean
Dim mOrcAmtAftDisc As Double, mOrcAdvAmt As Double, mOrcRecdAmt As Double, mOrcDepoAmt As Double, mOrcRefuAmtExcl As Double, mOfdRefuAmt As Double, mOrcBalAmt As Double

mRtnval = True
mOrcAmtAftDisc = Val(UnMyNumFmt(mskOrcAmtAftDisc.Text))
mOrcAdvAmt = Val(UnMyNumFmt(mskOrcAdvAmt.Text))
mOrcRecdAmt = Val(UnMyNumFmt(mskOrcRecdAmt.Text))
mOrcDepoAmt = Val(UnMyNumFmt(mskOrcDepoAmt.Text))
mOrcRefuAmtExcl = Val(UnMyNumFmt(mskOrcRefuAmtExcl.Text))
mOfdRefuAmt = Val(UnMyNumFmt(mskOfdRefuAmt.Text))

mskOfdRefuAmt.Text = ToMyNumFmt(mOfdRefuAmt)
If mOfdRefuAmt < 1 Then
    If InterActiveChange(mskOfdRefuAmt) = True Then
        ErrorBox "Invalid Input !!!"
    End If
    mRtnval = False
Else
    If (mOfdRefuAmt + mOrcRefuAmtExcl) > (mOrcAdvAmt + mOrcRecdAmt + mOrcDepoAmt) Then
        If InterActiveChange(mskOfdRefuAmt) = True Then
            ErrorBox "Excess Refund Amount !!!"
            mskOfdRefuAmt.Text = ToMyNumFmt(mOfdRefuAmt_old)
            mOfdRefuAmt = Val(UnMyNumFmt(mskOfdRefuAmt.Text))
        End If
        mRtnval = False
    End If
End If
mskOrcBalAmt.Text = ToMyNumFmt(mOrcAmtAftDisc - (mOrcAdvAmt + mOrcRecdAmt + mOrcDepoAmt))

chkOfdRefuAmt = mRtnval

End Function

'Private Sub mskOrcAmtAftDisc_GotFocus()
'FlashActiveControl mskOrcAmtAftDisc, True
'End Sub
'
'Private Sub mskOrcAmtAftDisc_LostFocus()
'FlashActiveControl mskOrcAmtAftDisc, False
'End Sub

'Private Sub mskOrcAmtAftDisc_Validate(Cancel As Boolean)
'mskOrcAmtAftDisc.Text = ToMyNumFmt(mskOrcAmtAftDisc.Text)
'If Val(UnMyNumFmt(mskOrcAmtAftDisc.Text)) < 0 Then
'    ErrorBox "Invalid Input !!!"
'    mskOrcAmtAftDisc.SetFocus
'    Cancel = True
'Else
'    Call CalcOrcChg
'    Call ValidDtl
'End If
'
'End Sub

'Private Sub mskOrcBalAmtTot_GotFocus()
'FlashActiveControl mskOrcBalAmtTot, True
'End Sub
'
'Private Sub mskOrcBalAmtTot_LostFocus()
'FlashActiveControl mskOrcBalAmtTot, False
'End Sub

'Private Sub mskOrcBalAmtTot_Validate(Cancel As Boolean)
'If Val(UnMyNumFmt(mskOrcBalAmtTot.Text)) < 0 Then
'    ErrorBox "Invalid Input !!!"
'    mskOrcBalAmtTot.SetFocus
'    Cancel = True
'End If
'
'End Sub

'Private Sub mskOrcDepoAmtTot_GotFocus()
'FlashActiveControl mskOrcDepoAmtTot, True
'End Sub
'
'Private Sub mskOrcDepoAmtTot_LostFocus()
'FlashActiveControl mskOrcDepoAmtTot, False
'End Sub
'
'Private Sub mskOrcDepoAmtTot_Validate(Cancel As Boolean)
'If Val(UnMyNumFmt(mskOrcDepoAmtTot.Text)) < 0 Then
'    ErrorBox "Invalid Input !!!"
'    mskOrcDepoAmtTot.SetFocus
'    Cancel = True
'End If
'
'End Sub

Private Sub mskOpgVchNo_GotFocus()
FlashActiveControl mskOpgVchNo, True
End Sub

Private Sub mskOpgVchNo_LostFocus()
FlashActiveControl mskOpgVchNo, False
End Sub

Private Sub mskOpgVchNo_Validate(Cancel As Boolean)
Dim mOpgVchNo As Long

mOpgVchNo = Val(UnMyNumFmt(mskOpgVchNo.Text))
mskOpgVchNo.Text = ToMyNumFmt(mOpgVchNo, mDecimals:=0)
If mOpgVchNo < 0 Then
    ErrorBox "Invalid Input !!!"
    mskOpgVchNo.SetFocus
    Cancel = True
End If

End Sub

'Private Sub mskOrcRecdAmtTot_GotFocus()
'FlashActiveControl mskOrcRecdAmtTot, True
'End Sub
'
'Private Sub mskOrcRecdAmtTot_LostFocus()
'FlashActiveControl mskOrcRecdAmtTot, False
'End Sub

''Private Sub mskOrcRecdAmtTot_Validate(Cancel As Boolean)
''Dim mOrcRecdAmtTot As Double, mOrcDepoAmtTot As Double, mOrcAmtAftDiscTot As Double
''
''mOrcRecdAmtTot = Val(UnMyNumFmt(mskOrcRecdAmtTot.Text))
''mOrcDepoAmtTot = Val(UnMyNumFmt(mskOrcDepoAmtTot.Text))
''mOrcAmtAftDiscTot = Val(UnMyNumFmt(lblOrcAmtAftDiscTot.Caption))
''
''mskOrcRecdAmtTot.Text = ToMyNumFmt(mOrcRecdAmtTot)
''If mOrcRecdAmtTot < 0 Then
''    ErrorBox "Invalid Input !!!"
''    mskOrcRecdAmtTot.SetFocus
''    Cancel = True
''Else
''    If (mOrcRecdAmtTot + mOrcDepoAmtTot) > mOrcAmtAftDiscTot Then
''        ErrorBox "Excess Received Amount !!!"
''        mOrcRecdAmtTot = mOrcAmtAftDiscTot - mOrcDepoAmtTot
''        mskOrcRecdAmtTot.Text = ToMyNumFmt(mOrcRecdAmtTot)
''        mskOrcRecdAmtTot.SetFocus
''        Cancel = True
''    Else
''        If FormAddEditMode = cFORM_ADDMODE Or mOrcRecdAmtTot <> mOrcRecdAmtTot_old Then
''            DisperseRecdAmt mOfdCode
''            ShowDtlData mOfdCode
''        End If
''
''    End If
''End If
''
''End Sub

Private Sub mskOfdVchNo_GotFocus(Index As Integer)
FlashActiveControl mskOfdVchNo(Index), True
End Sub

Private Sub mskOfdVchNo_LostFocus(Index As Integer)
FlashActiveControl mskOfdVchNo(Index), False
End Sub

Private Sub mskOfdVchNo_Validate(Index As Integer, Cancel As Boolean)
Dim mOfdVchNo As Long

mOfdVchNo = Val(UnMyNumFmt(mskOfdVchNo(Index).Text))
If mOfdVchNo < 0 And Index = 0 Then
    mOfdVchNo = GetNextVTypeNo(dbVgnDatabase, dbAcDatabase, dbComDatabase, mTableName:="OutdRefdHdr", mFieldName:="OfhVchNo", mVtmFieldName:="OfhVtmCode", mVtmFieldValue:=Val(fcmbOfdVtmName.BoundText), mFinYrFieldName:="OfhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="OfhDate", mDateFieldValue:=Ctod(dtpOfdDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
    mskOfdVchNo(Index).Text = ToMyNumFmt(mOfdVchNo, mDecimals:=0)
ElseIf mOfdVchNo > 0 And Index = 0 Then
    If mOfdVchNo <> mOfdVchNo_old Or Val(fcmbOfdVtmName.BoundText) <> mOfdVtmCode_old Or Ctod(dtpOfdDate.Text) <> mOfdDate_old Or FormAddEditMode = cFORM_ADDMODE Then
        If ChkIsDuplVTypeNo(dbVgnDatabase, dbAcDatabase, mTableName:="OutdRefdHdr", mChkFieldName:="OfhVchNo", mChkFieldValue:=mOfdVchNo, mKeyFieldName:="OfhCode", mKeyFieldValue:=mOfdCode, mVtmFieldName:="OfhVtmCode", mVtmFieldValue:=Val(fcmbOfdVtmName.BoundText), mFinYrFieldName:="OfhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="OfhDate", mDateFieldValue:=Ctod(dtpOfdDate.Text)) = True Then
            ErrorBox "Duplicate Voucher No. !!!"
            Cancel = True
            mskOfdVchNo(Index).SetFocus
            ' ----------
            If FormAddEditMode = cFORM_ADDMODE Then
                mOfdVchNo = GetNextVTypeNo(dbVgnDatabase, dbAcDatabase, dbComDatabase, mTableName:="OutdRefdHdr", mFieldName:="OfhVchNo", mVtmFieldName:="OfhVtmCode", mVtmFieldValue:=Val(fcmbOfdVtmName.BoundText), mFinYrFieldName:="OfhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="OfhDate", mDateFieldValue:=Ctod(dtpOfdDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
            Else
                mOfdVchNo = mOfdVchNo_old
            End If
            mskOfdVchNo(Index).Text = ToMyNumFmt(mOfdVchNo, mDecimals:=0)
        End If
    End If
    If Cancel = False Then
        mskOfdVchNo(Index).Text = ToMyNumFmt(mOfdVchNo, mDecimals:=0)
    End If
ElseIf mOfdVchNo < 1 Then
    ErrorBox "Invalid Input !!!"
    mskOfdVchNo(Index).SetFocus
    Cancel = True
End If

End Sub

Private Sub mskOrcVchNo_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call mskOrcVchNo_Change
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
    Call ShowOldOpgListByPttRegNo
ElseIf MyAddNewKey(Shift, KeyCode) = True Then
    If FormAddEditMode = cFORM_ADDMODE Then
        clsOFD.EndTran mOfdCode
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
        If mPttRegNo = 0 And clsVGNOPT.mOfdPttRegNoNotZero_bln = True Then
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

Private Sub txtOfhRemark_GotFocus()
FlashActiveControl txtOfhRemark, True
End Sub

Private Sub txtOfhRemark_LostFocus()
FlashActiveControl txtOfhRemark, False
End Sub

Private Sub txtOfhRemark_Validate(Cancel As Boolean)
txtOfhRemark.Text = ToMyWord(txtOfhRemark.Text)
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

Private Sub txtOfdTime_str_GotFocus()
FlashActiveControl txtOfdTime_str, True
End Sub

Private Sub txtOfdTime_str_LostFocus()
FlashActiveControl txtOfdTime_str, False
End Sub

Private Sub txtOfdTime_str_Validate(Cancel As Boolean)
txtOfdTime_str.Text = MinToTime(TimeToMin(txtOfdTime_str.Text))
If TimeToMin(txtOfdTime_str.Text) > cDAYMINUTES Then
    ErrorBox "Invalid Input !!!"
    txtOfdTime_str.SetFocus
    Cancel = True
End If

End Sub

Private Sub txtOfdVtmName_Change(Index As Integer)
If fcmbOfdVtmName.CallFromText_Change = False Then
    fcmbOfdVtmName.CallFromText_Change = True
    If InterActiveChange(txtOfdVtmName(Index)) = True Then
        fcmbOfdVtmName.UserText = Array(txtOfdVtmName(Index).Text, txtOfdVtmName(Index).SelStart)
        fcmbOfdVtmName.Show
        txtOfdVtmName(Index).Text = fcmbOfdVtmName.Text
        If fcmbOfdVtmName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbOfdVtmName.CallFromText_Change = False
End If

End Sub

Private Sub txtOfdVtmName_GotFocus(Index As Integer)
FlashActiveControl txtOfdVtmName(Index), True
End Sub

Private Sub txtOfdVtmName_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtOfdVtmName_Change(Index)
ElseIf MyAddNewKey(Shift, KeyCode) = True Then

ElseIf Shift = 0 And KeyCode = vbKeyF6 Then
    Rem Call ShowOldOpgListByOpgNo show here all outdoor receipt details
End If

End Sub

Private Sub txtOfdVtmName_LostFocus(Index As Integer)
FlashActiveControl txtOfdVtmName(Index), False
End Sub

Private Sub txtOfdVtmName_Validate(Index As Integer, Cancel As Boolean)
Dim mOfdVchNo As Long

If Val(fcmbOfdVtmName.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    txtOfdVtmName(Index).SetFocus
    Cancel = True
ElseIf Index = 0 Then
    If Val(fcmbOfdVtmName.BoundText) <> mOfdVtmCode_old Or Ctod(dtpOfdDate.Text) <> mOfdDate_old Or FormAddEditMode = cFORM_ADDMODE Then
        mOfdVchNo = GetNextVTypeNo(dbVgnDatabase, dbAcDatabase, dbComDatabase, mTableName:="OutdRefdHdr", mFieldName:="OfhVchNo", mVtmFieldName:="OfhVtmCode", mVtmFieldValue:=Val(fcmbOfdVtmName.BoundText), mFinYrFieldName:="OfhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="OfhDate", mDateFieldValue:=Ctod(dtpOfdDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
        mskOfdVchNo(Index).Text = ToMyNumFmt(mOfdVchNo, mDecimals:=0)
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
    Call ShowOldOpgListByPttName
ElseIf MyAddNewKey(Shift, KeyCode) = True Then
    If FormAddEditMode = cFORM_ADDMODE Then
        clsOFD.EndTran mOfdCode
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
If clsOFD.BeginTran(0) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_ADDMODE

clsOFD.ClearHdr: clsOFD.ClearDtl
clsOPG.Clear
clsPAT.Clear

mOfdCode = clsOFD.ActiveTrnCode
mOfdOpgCode = 0
mOfdPttCode = 0

ShowOfdData mOfdCode
ShowOpgData mOfdOpgCode
ShowPatData mOfdPttCode

Rem restoring user editing features
Call ShowOfdDefData
Call ShowPatDefData
Call ShowOpgDefData

Rem old values
Call StoreOfdOldData
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
If clsOFD.BeginTran(datRecset.fields("OfhCode")) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_EDITMODE

With datRecset
mOfdCode = .fields("OfhCode")
mOfdOpgCode = .fields("OfhOpgCode")
mOfdPttCode = .fields("OfhPttCode")

clsOFD.GetHdrData mOfdCode
clsOPG.GetData mOfdOpgCode
clsPAT.GetData mOfdPttCode
End With

ShowOfdData mOfdCode
ShowOpgData mOfdOpgCode
ShowPatData mOfdPttCode

Rem old values
Call StoreOfdOldData
Call StoreOpgOldData
Call StorePatOldData

Call ShowEntryMode(True)
txtPttName.SetFocus

End Sub

Private Sub ShowPatData(ByVal mPttCode As Long)

With clsPAT
.GetData mPttCode

mskOfdPttCode.Text = mPttCode
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

Private Sub ShowOpgData(ByVal mOpgCode As Long)

With clsOPG
.GetData mOpgCode

mskOfdOpgCode.Text = mOpgCode
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
Rem nothing
End Sub

Private Sub ShowOfdData(ByVal mOfdCode As Long)

With clsOFD
.GetHdrData mOfdCode

mskFormBoundField.Text = mOfdCode
fcmbOfdVtmName.BoundText = CStr(.mTrnVtmCode_lng): txtOfdVtmName(0).Text = fcmbOfdVtmName.Text
txtOfdPrefix.Text = .mTrnPrefix_str
mskOfdVchNo(0).Text = ToMyNumFmt(.mTrnVchNo_lng, mDecimals:=0)
dtpOfdDate.Text = Dtoc(.mTrnDate_dt)
txtOfdTime_str.Text = MinToTime(.mOfhTime_lng)
txtOfhRemark.Text = .mOfhRemark_str
Rem old outdoor receipt
mOfdOldOfdCode = .mOfhOldOfhCode_lng
ShowOldOfdCodeDesc mOfdOldOfdCode
End With

'Call CalcOrcChg
ShowDtlData mOfdCode

End Sub

Private Sub ShowOfdDefData()
Dim mOfdVchNo As Long

dtpOfdDate.Text = Dtoc(DefaultEntryDate)
txtOfdTime_str.Text = MinToTime(TimeToMin(DateTime.Time$))

fcmbOfdVtmName.BoundText = CStr(clsVGNOPT.GetOutdRefdOptBoundCode("OfdVtmCode")): txtOfdVtmName(0).Text = fcmbOfdVtmName.Text

mOfdVchNo = GetNextVTypeNo(dbVgnDatabase, dbAcDatabase, dbComDatabase, mTableName:="OutdRefdHdr", mFieldName:="OfhVchNo", mVtmFieldName:="OfhVtmCode", mVtmFieldValue:=Val(fcmbOfdVtmName.BoundText), mFinYrFieldName:="OfhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="OfhDate", mDateFieldValue:=Ctod(dtpOfdDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
mskOfdVchNo(0).Text = ToMyNumFmt(mOfdVchNo, mDecimals:=0)

End Sub

Private Sub StoreOfdOldData()
mOfdCode_old = mOfdCode
mOfdDate_old = Ctod(dtpOfdDate.Text)
mOfdVtmCode_old = Val(fcmbOfdVtmName.BoundText)
mOfdVchNo_old = Val(UnMyNumFmt(mskOfdVchNo(0).Text))

End Sub

Private Sub ShowDtlData(ByVal mOfdCode As Long)
Dim srow As Integer, tRecset As New ADODB.Recordset, mColCnt As Integer

srow = 1
Mfgrd2.Rows = 2

With tRecset
.open "Select * from OutdRefdDtl where OfdCode=" & CStr(mOfdCode) & " order by OfdSno", dbVgnDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Do While .EOF = False
        If InList(.fields("OfdRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
            clsORC.GetHdrData .fields("OfdOhrCode")
            clsVTM.GetData clsORC.mTrnVtmCode_lng
            
            Mfgrd2.TextMatrix(srow, X2OFDICODE_COL) = .fields("OfdICode")
            Mfgrd2.TextMatrix(srow, X2OFDSNO_COL) = ToMyNumFmt(.fields("OfdSno"), mDecimals:=0)
            Mfgrd2.TextMatrix(srow, X2ORCVCHNO_COL) = clsORC.mTrnVchNo_lng
            Mfgrd2.TextMatrix(srow, X2ORCVTMNAME_COL) = clsVTM.mName_str
            Mfgrd2.TextMatrix(srow, X2ORCDATE_COL) = clsORC.mTrnDate_dt
            Mfgrd2.TextMatrix(srow, X2ORCAMTAFTDISC_COL) = ToMyNumFmt(clsORC.mOhrAmtAftDisc_dbl)
            Mfgrd2.TextMatrix(srow, X2ORCADVAMT_COL) = ToMyNumFmt(clsORC.mOhrAdvAmt_dbl)
            Mfgrd2.TextMatrix(srow, X2ORCRECDAMT_COL) = ToMyNumFmt(clsORC.mOhrRecdAmt_dbl)
            Mfgrd2.TextMatrix(srow, X2ORCDEPOAMT_COL) = ToMyNumFmt(clsORC.mOhrDepoAmt_dbl)
            Mfgrd2.TextMatrix(srow, X2ORCREFUAMTEXCL_COL) = ToMyNumFmt(clsORC.mOhrRefuAmt_dbl - .fields("OfdRefuAmt"))
            Mfgrd2.TextMatrix(srow, X2OFDREFUAMT_COL) = ToMyNumFmt(.fields("OfdRefuAmt"))
            Mfgrd2.TextMatrix(srow, X2ORCBALAMT_COL) = ToMyNumFmt(clsORC.mOhrBalAmt_dbl)
            Mfgrd2.TextMatrix(srow, X2ORCCODE_COL) = .fields("OfdOhrCode")
            Mfgrd2.TextMatrix(srow, X2OFDRECSTATE_COL) = .fields("OfdRecState")
            
            Mfgrd2.Rows = Mfgrd2.Rows + 1
            srow = srow + 1
        Else
            If InList(.fields("OfdRecState"), Array(cREC_CANCELED, cREC_DELETED)) = False Then
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

With clsOFD
If FormAddEditMode = cFORM_ADDMODE Then
    .ClearHdr
Else
    .GetHdrData mOfdCode
End If
.mTrnDate_dt = Ctod(dtpOfdDate.Text)
.mTrnVtmCode_lng = Val(fcmbOfdVtmName.BoundText)
.mTrnPrefix_str = txtOfdPrefix.Text
.mTrnVchNo_lng = Val(UnMyNumFmt(mskOfdVchNo(0).Text))
.mTrnPostfix_str = ""
.mTrnCmpCode_int = sFinYrCmpCode

.mOfhTime_lng = TimeToMin(txtOfdTime_str.Text)
.mOfhOpgCode_lng = mOfdOpgCode
.mOfhPttCode_lng = mOfdPttCode
.mOfhOldOfhCode_lng = mOfdOldOfdCode
.mOfhRefuAmt_dbl = Val(UnMyNumFmt(lblOfdRefuAmtTot.Caption))
.mOfhRemark_str = txtOfhRemark.Text

If FormAddEditMode = cFORM_ADDMODE Then
    .AddNewHdr
    mskFormBoundField.Text = .mTrnCode_lng
Else
    .UpdateHdr mOfdCode
End If
If .mTrnCode_lng > 0 Then   ' updated successfully
    mOfdCode = .mTrnCode_lng
    
    .UpdateTran .mTrnCode_lng
    .EndTran .mTrnCode_lng
        
    Rem updating user editing carry forward features
    clsVGNOPT.mOfdVtmCodeOld_lng = .mTrnVtmCode_lng
    clsVGNOPT.UpdateOutdRefdOld
    
    mEntrySaved = True
Else
    Call Data_CancelEvent
    ErrorBox "Entry Cancelled !!!"
End If
End With

If clsOFD.mTrnCode_lng > 0 Then   ' updated successfully
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

mOfdCode = datRecset.fields("OfhCode")
mOfdPttCode = datRecset.fields("OfhPttCode")
mRecAbsPos = datRecset.AbsolutePosition

If clsOFD.CanDeleteTran(mOfdCode) = True Then
    txtVoid.SetFocus
    If clsOFD.BeginTran(mOfdCode) = True Then
        clsOFD.DeleteTran mOfdCode
        clsOFD.UpdateTran mOfdCode
        clsOFD.EndTran mOfdCode
    
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
clsOFD.CancelTran mOfdCode
clsOFD.EndTran mOfdCode

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
        clsListStru.AddFields mExpr:="OfdYrMonth", mAttrib:=cFAT_SYSTEM
        clsListStru.AddFields mExpr:="OfdMnYear", mTitle:="Month", mShowItem:=True, mAlign:=1, mWidth:=2000
        clsListStru.AddFields mExpr:="OfdCount", mTitle:="Count", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="OfdRefuAmt_sum", mTitle:="Refd.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        
        datRecset.open "Select format(OfhDate,'yyyy/MM') as OfdYrMonth" _
         & ",Count(OfhCode) as OfdCount" _
         & ",Sum(OfhRefuAmt) as OfdRefuAmt_sum" _
         & " from OutdRefdHdr" _
         & " where OfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and OfhCode>0" _
         & IIf(mQryPttCode > 0, " and OfhPttCode=" & CStr(mQryPttCode), "") _
         & " group by format(OfhDate,'yyyy/MM')" _
         & " order by format(OfhDate,'yyyy/MM')" _
         , dbVgnDatabase, adOpenKeyset, adLockReadOnly

    ElseIf optDatewise.Value = True Then
        clsListStru.AddFields mExpr:="OfdDateYMD", mAttrib:=cFAT_SYSTEM
        clsListStru.AddFields mExpr:="OfdDate", mTitle:="Date", mShowItem:=True, mAlign:=1, mWidth:=2000
        clsListStru.AddFields mExpr:="OfdCount", mTitle:="Count", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="OfdRefuAmt_sum", mTitle:="Refd.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        
        datRecset.open "Select OfhDate" _
         & ",Count(OfhCode) as OfdCount" _
         & ",Sum(OfhRefuAmt) as OfdRefuAmt_sum" _
         & " from OutdRefdHdr" _
         & " where OfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and OfhCode>0" _
         & IIf(mQryPttCode > 0, " and OfhPttCode=" & CStr(mQryPttCode), "") _
         & " group by OfhDate" _
         & " order by OfhDate" _
         , dbVgnDatabase, adOpenKeyset, adLockReadOnly
        
    ElseIf optPatientwise.Value = True Then
        clsListStru.AddFields mExpr:="PttName", mTitle:="Patient Name", mShowItem:=True, mAlign:=1, mWidth:=3000
        clsListStru.AddFields mExpr:="PttRegNo", mTitle:="Reg.No", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="PttRefName", mTitle:="Care of", mShowItem:=True, mAlign:=1, mWidth:=2000
        clsListStru.AddFields mExpr:="OfdCount", mTitle:="Count", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="OfdRefuAmt_sum", mTitle:="Refu.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
        
        datRecset.open "Select PatMast.PttName,PatMast.PttRegNo,OutdRefdHdr.OfhPttCode" _
         & ",Count(OfhCode) as OfdCount" _
         & ",Sum(OfhRefuAmt) as OfdRefuAmt_sum" _
         & " from OutdRefdHdr inner join PatMast on OutdRefdHdr.OfhPttCode=PatMast.PttCode" _
         & " where OfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and OfhCode>0" _
         & IIf(mQryPttCode > 0, " and OfhPttCode=" & CStr(mQryPttCode), "") _
         & " group by PatMast.PttName,PatMast.PttRegNo,OutdRefdHdr.OfhPttCode" _
         & " order by PatMast.PttName,PatMast.PttRegNo,OutdRefdHdr.OfhPttCode" _
         , dbVgnDatabase, adOpenKeyset, adLockReadOnly
    End If
    
ElseIf optDetailed.Value = True Then
    clsListStru.AddFields mExpr:="tOfdSmryId", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="OfdCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="VtmName", mTitle:="Voucher", mAlign:=1, mWidth:=1500, mShowItem:=True
    clsListStru.AddFields mExpr:="OrcVchNo", mTitle:="Vchr.No", mAlign:=7, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="OfdDate", mTitle:="Date", mAlign:=1, mWidth:=1300, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="PttCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="PttName", mTitle:="Patient Name", mAlign:=1, mWidth:=2500, mShowItem:=True
    clsListStru.AddFields mExpr:="PttRegNo", mTitle:="Reg.No", mAlign:=7, mWidth:=1250, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="OfdRefuAmt", mTitle:="Refd.Amt", mAlign:=7, mWidth:=1250, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="PttRefName", mTitle:="Care of", mAlign:=1, mWidth:=2000, mShowItem:=True
    clsListStru.AddFields mExpr:="PttAddr", mTitle:="Address", mAlign:=1, mWidth:=2000, mShowItem:=True
    clsListStru.AddFields mExpr:="PatAraName", mTitle:="Area", mAlign:=1, mWidth:=1500, mShowItem:=True
    clsListStru.AddFields mExpr:="PatStnName", mTitle:="Station", mAlign:=1, mWidth:=1500, mShowItem:=True
    clsListStru.AddFields mExpr:="PatPcgName", mTitle:="Category", mAlign:=1, mWidth:=2000, mShowItem:=True
    
    datRecset.open "Select OutdRefdHdr.*,PatMast.*" _
     & ",format(OfhDate,'yyyymmdd')+format(OfhCode,'0000000') as tOfdSmryId" _
     & " from OutdRefdHdr inner join PatMast on OutdRefdHdr.OfhPttCode=PatMast.PttCode" _
     & " where OfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & IIf(mRemoteAccess = True, " and OfhCode=" & CStr(mOfdCode) & "", "") _
     & " and OfhCode>0" _
     & IIf(mQryPttCode > 0, " and OfhPttCode=" & CStr(mQryPttCode), "") _
     & " order by OfhDate,OfhCode" _
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
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OfdYrMonth")) = .fields("OfdYrMonth")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OfdMnYear")) = MonthName(Val(Right(.fields("OfdYrMonth"), 2))) & "-" & Left(.fields("OfdYrMonth"), 4)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OfdCount")) = ToMyNumFmt(.fields("OfdCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OfdRefuAmt_sum")) = ToMyNumFmt(.fields("OfdRefuAmt_sum"))
                
            ElseIf optDatewise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OfdDateYMD")) = Format(.fields("OfhDate"), "yyyymmdd")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OfdDate")) = Dtoc(.fields("OfhDate"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OfdCount")) = ToMyNumFmt(.fields("OfdCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OfdRefuAmt_sum")) = ToMyNumFmt(.fields("OfdRefuAmt_sum"))
                
            ElseIf optPatientwise.Value = True Then
                clsPAT.GetData .fields("OfhPttCode")
                
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttName")) = .fields("PttName")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttRegNo")) = ToMyNumFmt(.fields("PttRegNo"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttRefName")) = clsPAT.mPttRefName_str
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OfdCount")) = ToMyNumFmt(.fields("OfdCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OfdRefuAmt_sum")) = ToMyNumFmt(.fields("OfdRefuAmt_sum"))
                
            End If
        
        ElseIf optDetailed.Value = True Then
            clsPCG.GetData .fields("PttPcgCode")
            clsARA.GetData .fields("PttAraCode")
            clsSTN.GetData .fields("PttStnCode")
            clsVTM.GetData .fields("OfhVtmCode")
            
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("tOfdSmryId")) = Format(.fields("OfhDate"), "yyyymmdd") & Format(.fields("OfhCode"), "0000000")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OfdCode")) = .fields("OfhCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("VtmName")) = clsVTM.mName_str
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OrcVchNo")) = .fields("OfhVchNo")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OfdDate")) = Dtoc(.fields("OfhDate"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OfdRefuAmt")) = ToMyNumFmt(.fields("OfhRefuAmt"))
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
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("tOfdSmryId"), mText
    ElseIf optMonthwise.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("OfdYrMonth"), mText
    ElseIf optDatewise.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("OfdDateYMD"), mText
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

Private Sub mskOrcVchNo_Change()
If fcmbOrcVchNo.CallFromText_Change = False Then
    fcmbOrcVchNo.CallFromText_Change = True
    If InterActiveChange(mskOrcVchNo) = True Then
        fcmbOrcVchNo.mFiltCond = "OhrOpgCode=" & CStr(mOfdOpgCode)
        fcmbOrcVchNo.ReInit
        
        fcmbOrcVchNo.UserText = Array(mskOrcVchNo.Text, mskOrcVchNo.SelStart)
        fcmbOrcVchNo.Show
        mskOrcVchNo.Text = fcmbOrcVchNo.Text
        If fcmbOrcVchNo.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbOrcVchNo.CallFromText_Change = False
End If

End Sub

Private Sub mskOrcVchNo_GotFocus()
FlashActiveControl mskOrcVchNo, True
End Sub

Private Sub mskOrcVchNo_LostFocus()
FlashActiveControl mskOrcVchNo, False
End Sub

Private Sub mskOrcVchNo_Validate(Cancel As Boolean)
If Val(fcmbOrcVchNo.BoundText) <= 0 Then
    ErrorBox "Invalid Selection !!!"
    mskOrcVchNo.SetFocus
    Cancel = True
Else
    If Val(fcmbOrcVchNo.BoundText) <> mOrcCode_old Or FormAddEditMode = cFORM_ADDMODE Then
        clsORC.GetHdrData Val(fcmbOrcVchNo.BoundText)
        clsVTM.GetData clsORC.mTrnVtmCode_lng
        
        txtOrcVtmName.Text = clsVTM.mName_str
        dtpOrcDate.Text = Dtoc(clsORC.mTrnDate_dt)
        mskOrcAmtAftDisc.Text = ToMyNumFmt(clsORC.mOhrAmtAftDisc_dbl)
        mskOrcAdvAmt.Text = ToMyNumFmt(clsORC.mOhrAdvAmt_dbl)
        mskOrcRecdAmt.Text = ToMyNumFmt(clsORC.mOhrRecdAmt_dbl)
        mskOrcDepoAmt.Text = ToMyNumFmt(clsORC.mOhrDepoAmt_dbl)
        Rem mskOfdRefuAmt.Text =
        mskOrcRefuAmtExcl.Text = ToMyNumFmt(clsORC.mOhrRefuAmt_dbl - mOfdRefuAmt_old)   '''  Val(UnMyNumFmt(mskOfdRefuAmt.Text))
        mskOrcBalAmt.Text = ToMyNumFmt(clsORC.mOhrBalAmt_dbl)
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

Private Sub ShowOldOfdCodeDesc(ByVal mOldOrcCode As Long)
Dim tRecset As New ADODB.Recordset

With tRecset
.open "Select * from OutdRefdHdr where OfhCode=" & CStr(mOldOrcCode) & "", dbVgnDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    clsVTM.GetData .fields("OfhVtmCode")
    lblOldOfdCodeDesc.Caption = RTrim(clsVTM.mName_str) & " No.:" & CStr(.fields("OfhVchNo")) & " Dated:" & Dtoc(.fields("OfhDate"))
Else
    lblOldOfdCodeDesc.Caption = "#" & CStr(mOldOrcCode) & "#"
End If
End With
CloseTable tRecset

End Sub

Private Function GetOldOfdCodeFromPttCode(ByVal mPttCode As Long) As Long
Dim tRecset As New ADODB.Recordset

With tRecset
.open "Select top 1 * from OutdRefdHdr where OfhPttCode=" & CStr(mPttCode) & " order by OfhDate desc,OfhVchNo desc,OfhCode desc", dbVgnDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    GetOldOfdCodeFromPttCode = .fields("OfhCode")
Else
    GetOldOfdCodeFromPttCode = 0
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

Private Sub ShowOldOpgListByOpgNo()
Dim tRecset As New ADODB.Recordset, mOldOpgCode As Long, mOldOpgPttCode As Long

If fcmbOldOpgByOpgNo.CallFromText_Change = False Then
    fcmbOldOpgByOpgNo.CallFromText_Change = True
    If InterActiveChange(txtOpgVtmName) = True Then
        fcmbOldOpgByOpgNo.UserText = Array("", 0)
        fcmbOldOpgByOpgNo.Show
        If FormAddEditMode = cFORM_ADDMODE And Mfgrd2.Rows = 2 And fcmbOldOpgByOpgNo.ListSelected = True And Val(fcmbOldOpgByOpgNo.BoundText) > 0 Then
            mOldOpgCode = Val(fcmbOldOpgByOpgNo.BoundText)
            tRecset.open "Select * from OutdReg where OpgCode=" & CStr(mOldOpgCode) & "", dbVgnDatabase, adOpenKeyset, adLockOptimistic
            If tRecset.RecordCount > 0 Then
                mOldOpgPttCode = tRecset.fields("OpgPttCode")
            End If
            CloseTable tRecset
            If mOldOpgCode > 0 And mOldOpgPttCode > 0 Then
                mOfdPttCode = mOldOpgPttCode
                ShowPatData mOfdPttCode
                Call StorePatOldData
                'ShowPttDiscPer mOfdPttCode
                
                mOfdOpgCode = mOldOpgCode
                ShowOpgData mOfdOpgCode
                Call StoreOpgOldData
                
                mOfdOldOfdCode = GetOldOfdCodeFromPttCode(mOfdPttCode)
                ShowOldOfdCodeDesc mOfdOldOfdCode
            End If
        Else
            If fcmbOldOpgByOpgNo.ListSelected = True And Val(fcmbOldOpgByOpgNo.BoundText) > 0 Then
                If FormAddEditMode = cFORM_EDITMODE Then
                    AlertBox "Prohibited in Edit Mode !!!"
                ElseIf Mfgrd2.Rows > 2 Then
                    AlertBox "Prohibited After Refunding Amount !!!"
                End If
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
        If FormAddEditMode = cFORM_ADDMODE And Mfgrd2.Rows = 2 And fcmbOldOpgByPttRegNo.ListSelected = True And Val(fcmbOldOpgByPttRegNo.BoundText) > 0 Then
            mOldOpgCode = Val(fcmbOldOpgByPttRegNo.LFieldValue("OpgCode"))
            tRecset.open "Select * from OutdReg where OpgCode=" & CStr(mOldOpgCode) & "", dbVgnDatabase, adOpenKeyset, adLockOptimistic
            If tRecset.RecordCount > 0 Then
                mOldOpgPttCode = tRecset.fields("OpgPttCode")
            End If
            CloseTable tRecset
            If mOldOpgCode > 0 And mOldOpgPttCode > 0 Then
                mOfdPttCode = mOldOpgPttCode
                ShowPatData mOfdPttCode
                Call StorePatOldData
                'ShowPttDiscPer mOfdPttCode
                
                mOfdOpgCode = mOldOpgCode
                ShowOpgData mOfdOpgCode
                Call StoreOpgOldData
                
                mOfdOldOfdCode = GetOldOfdCodeFromPttCode(mOfdPttCode)
                ShowOldOfdCodeDesc mOfdOldOfdCode
            End If
        Else
            If fcmbOldOpgByPttRegNo.ListSelected = True And Val(fcmbOldOpgByPttRegNo.BoundText) > 0 Then
                If FormAddEditMode = cFORM_EDITMODE Then
                    AlertBox "Prohibited in Edit Mode !!!"
                ElseIf Mfgrd2.Rows > 2 Then
                    AlertBox "Prohibited After Refunding Amount !!!"
                End If
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
        If FormAddEditMode = cFORM_ADDMODE And Mfgrd2.Rows = 2 And fcmbOldOpgByPttName.ListSelected = True And Val(fcmbOldOpgByPttName.BoundText) > 0 Then
            mOldOpgCode = Val(fcmbOldOpgByPttName.LFieldValue("OpgCode"))
            tRecset.open "Select * from OutdReg where OpgCode=" & CStr(mOldOpgCode) & "", dbVgnDatabase, adOpenKeyset, adLockOptimistic
            If tRecset.RecordCount > 0 Then
                mOldOpgPttCode = tRecset.fields("OpgPttCode")
            End If
            CloseTable tRecset
            If mOldOpgCode > 0 And mOldOpgPttCode > 0 Then
                mOfdPttCode = mOldOpgPttCode
                ShowPatData mOfdPttCode
                Call StorePatOldData
                'ShowPttDiscPer mOfdPttCode
                
                mOfdOpgCode = mOldOpgCode
                ShowOpgData mOfdOpgCode
                Call StoreOpgOldData
                
                mOfdOldOfdCode = GetOldOfdCodeFromPttCode(mOfdPttCode)
                ShowOldOfdCodeDesc mOfdOldOfdCode
            End If
        Else
            If fcmbOldOpgByPttName.ListSelected = True And Val(fcmbOldOpgByPttName.BoundText) > 0 Then
                If FormAddEditMode = cFORM_EDITMODE Then
                    AlertBox "Prohibited in Edit Mode !!!"
                ElseIf Mfgrd2.Rows > 2 Then
                    AlertBox "Prohibited After Refunding Amount !!!"
                End If
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
    mskOfdSno.Top = mRowPos
    mskOrcVchNo.Top = mRowPos
    txtOrcVtmName.Top = mRowPos
    dtpOrcDate.Top = mRowPos
    mskOrcAmtAftDisc.Top = mRowPos
    mskOrcAdvAmt.Top = mRowPos
    mskOrcRecdAmt.Top = mRowPos
    mskOrcDepoAmt.Top = mRowPos
    mskOrcRefuAmtExcl.Top = mRowPos
    mskOfdRefuAmt.Top = mRowPos
    mskOrcBalAmt.Top = mRowPos
    cmdOK.Top = mRowPos
End If

mskOfdSno.Text = 0
mskOrcVchNo.Text = 0: fcmbOrcVchNo.BoundText = ""
txtOrcVtmName.Text = ""
dtpOrcDate.Text = ""
mskOrcAmtAftDisc.Text = ToMyNumFmt(0)
mskOrcAdvAmt.Text = ToMyNumFmt(0)
mskOrcRecdAmt.Text = ToMyNumFmt(0)
mskOrcDepoAmt.Text = ToMyNumFmt(0)
mskOrcRefuAmtExcl.Text = ToMyNumFmt(0)
mskOfdRefuAmt.Text = ToMyNumFmt(0)
mskOrcBalAmt.Text = ToMyNumFmt(0)

Call ValidDtl

mskOfdSno.Visible = mShowItem
mskOrcVchNo.Visible = mShowItem
txtOrcVtmName.Visible = mShowItem
dtpOrcDate.Visible = mShowItem
mskOrcAmtAftDisc.Visible = mShowItem
mskOrcAdvAmt.Visible = mShowItem
mskOrcRecdAmt.Visible = mShowItem
mskOrcDepoAmt.Visible = mShowItem
mskOrcRefuAmtExcl.Visible = mShowItem
mskOfdRefuAmt.Visible = mShowItem
mskOrcBalAmt.Visible = mShowItem
cmdOK.Visible = mShowItem

frHeader.Enabled = (mShowItem = False)
Mfgrd2.Enabled = (mShowItem = False)
frFooter.Enabled = (mShowItem = False)
cmdSaveForm.Enabled = (mShowItem = False)

End Sub

Private Sub ValidDtl()
Dim mDataOk As Boolean
mDataOk = (Val(UnMyNumFmt(mskOfdSno.Text)) > 0 And Val(fcmbOrcVchNo.BoundText) > 0 And Val(UnMyNumFmt(mskOfdRefuAmt.Text)) > 0 And chkOfdRefuAmt() = True)
cmdOK.Caption = IIf(mDataOk = True, "&OK", "&Cancel")
cmdOK.BackColor = IIf(mDataOk = True, &H80FF80, &H8080FF)
End Sub

Private Sub CalcFtrTotal()
Dim mOrcAmtAftDiscTot As Double, mOrcAdvAmtTot As Double, mOrcRecdAmtTot As Double, mOrcDepoAmtTot As Double, mOrcRefuAmtExclTot As Double, mOfdRefuAmtTot As Double, mOrcBalAmtTot As Double

mOrcAmtAftDiscTot = FlexColSum(Mfgrd2, X2ORCAMTAFTDISC_COL)
mOrcAdvAmtTot = FlexColSum(Mfgrd2, X2ORCADVAMT_COL)
mOrcRecdAmtTot = FlexColSum(Mfgrd2, X2ORCRECDAMT_COL)
mOrcDepoAmtTot = FlexColSum(Mfgrd2, X2ORCDEPOAMT_COL)
mOrcRefuAmtExclTot = FlexColSum(Mfgrd2, X2ORCREFUAMTEXCL_COL)
mOfdRefuAmtTot = FlexColSum(Mfgrd2, X2OFDREFUAMT_COL)
mOrcBalAmtTot = FlexColSum(Mfgrd2, X2ORCBALAMT_COL)

lblOrcAmtAftDiscTot.Caption = ToMyNumFmt(mOrcAmtAftDiscTot)
lblOrcAdvAmtTot.Caption = ToMyNumFmt(mOrcAdvAmtTot)
lblOrcRecdAmtTot.Caption = ToMyNumFmt(mOrcRecdAmtTot)
lblOrcDepoAmtTot.Caption = ToMyNumFmt(mOrcDepoAmtTot)
lblOrcRefuAmtExclTot.Caption = ToMyNumFmt(mOrcRefuAmtExclTot)
lblOfdRefuAmtTot.Caption = ToMyNumFmt(mOfdRefuAmtTot)
lblOrcBalAmtTot.Caption = ToMyNumFmt(mOrcBalAmtTot)

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
Dim mOfdVchNo As Long

If Val(fcmbOfdVtmName.BoundText) < 1 Then
    ErrorBox "Invalid Voucher Type !!!"
    txtOfdVtmName(1).SetFocus
    Exit Sub
End If
If Val(UnMyNumFmt(mskOfdVchNo(1).Text)) < 1 Then
    ErrorBox "Invalid Voucher No. !!!"
    mskOfdVchNo(1).SetFocus
    Exit Sub
Else
    mOfdVchNo = Val(UnMyNumFmt(mskOfdVchNo(1).Text))
    If ChkIsExistVTypeNo(dbVgnDatabase, mTableName:="OutdRefdHdr", mChkFieldName:="OfhVchNo", mChkFieldValue:=CStr(mOfdVchNo), mVtmFieldName:="OfhVtmCode", mVtmFieldValue:=Val(fcmbOfdVtmName.BoundText), mFinYrFieldName:="OfhCmpCode", mFinYrFieldValue:=sFinYrCmpCode) = False Then
        ErrorBox "Voucher No. does not Exist !!!"
        mskOfdVchNo(1).SetFocus
        Exit Sub
    End If
End If
If Val(UnMyNumFmt(mskOfdVchNo(2).Text)) < 1 Then
    ErrorBox "Invalid Voucher No. !!!"
    mskOfdVchNo(2).SetFocus
    Exit Sub
Else
    mOfdVchNo = Val(UnMyNumFmt(mskOfdVchNo(2).Text))
    If ChkIsExistVTypeNo(dbVgnDatabase, mTableName:="OutdRefdHdr", mChkFieldName:="OfhVchNo", mChkFieldValue:=CStr(mOfdVchNo), mVtmFieldName:="OfhVtmCode", mVtmFieldValue:=Val(fcmbOfdVtmName.BoundText), mFinYrFieldName:="OfhCmpCode", mFinYrFieldValue:=sFinYrCmpCode) = False Then
        ErrorBox "Voucher No. does not Exist !!!"
        mskOfdVchNo(2).SetFocus
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
Dim mFromOfdVchNo As Long, mToOfdVchNo As Long, mOfdVtmCode As Long
Dim fCRView As Form

mFromOfdVchNo = Val(UnMyNumFmt(mskOfdVchNo(1).Text))
mToOfdVchNo = Val(UnMyNumFmt(mskOfdVchNo(2).Text))
mOfdVtmCode = Val(fcmbOfdVtmName.BoundText)

frmMain.Cryst.Reset
frmMain.Cryst.ReportFileName = Trim(Right(cmbCRList.List(cmbCRList.ListIndex), 100))
frmMain.Cryst.DiscardSavedData = True
frmMain.Cryst.DataFiles(0) = dbComDatabaseFullPath

frmMain.Cryst.SelectionFormula = "{vewOutdRefd.OfhVchNo}>=" & CStr(mFromOfdVchNo) & " and {vewOutdRefd.OfhVchNo}<=" & CStr(mToOfdVchNo) & " and {vewOutdRefd.OfhVtmCode}=" & CStr(mOfdVtmCode) & " and {vewOutdRefd.OfhCmpCode}=" & CStr(sFinYrCmpCode)
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
        fcmbOfdVtmName.BoundText = CStr(datRecset.fields("OfhVtmCode"))
        txtOfdVtmName(1).Text = fcmbOfdVtmName.Text
        mskOfdVchNo(1).Text = datRecset.fields("OfhVchNo")
        mskOfdVchNo(2).Text = datRecset.fields("OfhVchNo")
        ' ----------------
        Call AssignPrintPara
        frPrintCRList.ZOrder
        frPrintCRList.Visible = True
        Mfgrd1.Enabled = False
        cmbPrintDest.SetFocus
    End If
    
ElseIf mCallSource = "SaveEvent" Then
    txtOfdVtmName(1).Text = fcmbOfdVtmName.Text
    mskOfdVchNo(1).Text = CStr(Val(UnMyNumFmt(mskOfdVchNo(0).Text)))
    mskOfdVchNo(2).Text = CStr(Val(UnMyNumFmt(mskOfdVchNo(0).Text)))
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

If Dir(OutdRefdCRLFileFullPath) = "" Then
    fhand = FreeFile
    Open OutdRefdCRLFileFullPath For Output As #fhand
    Write #fhand, "Outdoor (Receipt) Refund", "OutdRefd.Rpt", True
    Close #fhand
End If

cmbCRList.Clear
fhand = FreeFile
Open OutdRefdCRLFileFullPath For Input As #fhand
Do While EOF(fhand) = False
    Input #fhand, mCRLTitle, mCRLFileName, mCRLDefault
    If Dir(OutdRefdCRLFileFullPath(mFileName:=mCRLFileName)) <> "" Then
        cmbCRList.AddItem mCRLTitle & Space(100) & OutdRefdCRLFileFullPath(mFileName:=mCRLFileName)
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

