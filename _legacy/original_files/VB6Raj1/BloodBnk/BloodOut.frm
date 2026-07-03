VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmBloodOutTran 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   ClientHeight    =   10860
   ClientLeft      =   60
   ClientTop       =   60
   ClientWidth     =   15210
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
   ScaleWidth      =   15210
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
      TabIndex        =   42
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
      TabIndex        =   41
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
      ItemData        =   "BloodOut.frx":0000
      Left            =   0
      List            =   "BloodOut.frx":000D
      Style           =   1  'Simple Combo
      TabIndex        =   40
      TabStop         =   0   'False
      Text            =   "cmbFormEntryMode"
      Top             =   480
      Width           =   1455
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
      Height          =   9855
      Left            =   120
      TabIndex        =   39
      Top             =   840
      Width           =   14895
      Begin VB.TextBox mskBouBldCode 
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
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   4680
         TabIndex        =   91
         Tag             =   "AhCode"
         Text            =   "BldCode"
         Top             =   6000
         Visible         =   0   'False
         Width           =   1335
      End
      Begin VB.TextBox txtBdcName 
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
            Name            =   "MS Sans Serif"
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
         TabIndex        =   18
         Text            =   "BdcName"
         Top             =   5580
         Width           =   2055
      End
      Begin VB.TextBox txtBouNarr 
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
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   4440
         MaxLength       =   150
         TabIndex        =   19
         Text            =   "Narr"
         Top             =   5580
         Width           =   2055
      End
      Begin VB.TextBox mskBouBinICode 
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
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   7560
         TabIndex        =   35
         Tag             =   "AhCode"
         Text            =   "BinICode"
         Top             =   6000
         Visible         =   0   'False
         Width           =   1335
      End
      Begin VB.TextBox mskBouBinCode 
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
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   6120
         TabIndex        =   34
         Tag             =   "AhCode"
         Text            =   "BinCode"
         Top             =   6000
         Visible         =   0   'False
         Width           =   1335
      End
      Begin VB.TextBox mskBouStkICode 
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
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   360
         TabIndex        =   31
         Tag             =   "AhCode"
         Text            =   "StkICode"
         Top             =   6000
         Visible         =   0   'False
         Width           =   1335
      End
      Begin VB.TextBox mskBouItmCode 
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
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   3240
         TabIndex        =   33
         Tag             =   "AhCode"
         Text            =   "ItmCode"
         Top             =   6000
         Visible         =   0   'False
         Width           =   1335
      End
      Begin VB.TextBox txtBouBldRefNo 
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
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   6480
         MaxLength       =   25
         TabIndex        =   20
         Text            =   "RefNo"
         Top             =   5580
         Width           =   2835
      End
      Begin VB.TextBox mskBouICode 
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
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   1800
         TabIndex        =   32
         Tag             =   "AhCode"
         Text            =   "BouICode"
         Top             =   6000
         Visible         =   0   'False
         Width           =   1335
      End
      Begin VB.CommandButton cmdOK 
         Appearance      =   0  'Flat
         BackColor       =   &H008080FF&
         Caption         =   "&OK"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   11460
         Style           =   1  'Graphical
         TabIndex        =   23
         Top             =   5580
         Width           =   735
      End
      Begin VB.TextBox mskBouSno 
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
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   120
         TabIndex        =   16
         Tag             =   "AhCode"
         Text            =   "1)"
         Top             =   5580
         Width           =   495
      End
      Begin VB.Frame frHeader 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   5055
         Left            =   120
         TabIndex        =   72
         Top             =   240
         Width           =   14655
         Begin VB.TextBox txtLnkBouTrnRefNo 
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
            MaxLength       =   15
            TabIndex        =   1
            Tag             =   "AhCode"
            Top             =   1020
            Width           =   1275
         End
         Begin VB.TextBox txtEttRefName 
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
            Left            =   3300
            MaxLength       =   50
            TabIndex        =   112
            TabStop         =   0   'False
            Top             =   2040
            Width           =   4635
         End
         Begin VB.TextBox txtEttRefRela 
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
            TabIndex        =   111
            TabStop         =   0   'False
            Top             =   2040
            Width           =   1215
         End
         Begin VB.TextBox mskEttAgeDy 
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
            TabIndex        =   108
            TabStop         =   0   'False
            Tag             =   "AhCode"
            Text            =   "0"
            Top             =   1740
            Width           =   735
         End
         Begin VB.TextBox mskEttAgeMn 
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
            TabIndex        =   107
            TabStop         =   0   'False
            Tag             =   "AhCode"
            Text            =   "0"
            Top             =   1740
            Width           =   615
         End
         Begin VB.TextBox mskEttAgeYr 
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
            TabIndex        =   106
            TabStop         =   0   'False
            Tag             =   "AhCode"
            Text            =   "0"
            Top             =   1740
            Width           =   735
         End
         Begin VB.TextBox txtEttSex 
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
            TabIndex        =   105
            TabStop         =   0   'False
            Top             =   1740
            Width           =   1215
         End
         Begin VB.TextBox dtpEttRegDate 
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
            Left            =   6480
            MaxLength       =   50
            TabIndex        =   103
            TabStop         =   0   'False
            Text            =   "dd/mm/yyyy"
            Top             =   1020
            Width           =   1455
         End
         Begin VB.TextBox txtBouHpmRefNo 
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
            Left            =   9540
            MaxLength       =   15
            TabIndex        =   6
            Tag             =   "AhCode"
            Top             =   1740
            Width           =   1815
         End
         Begin VB.TextBox dtpBouHpmRefDt 
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
            Left            =   12600
            MaxLength       =   50
            TabIndex        =   7
            Text            =   "dd/mm/yyyy"
            Top             =   1740
            Width           =   1455
         End
         Begin VB.TextBox mskHpmRegNo 
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
            Left            =   8160
            TabIndex        =   4
            Text            =   "0"
            Top             =   1020
            Width           =   1455
         End
         Begin VB.TextBox txtHpmSmsNo 
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
            Left            =   8160
            Locked          =   -1  'True
            MaxLength       =   50
            TabIndex        =   99
            TabStop         =   0   'False
            Top             =   3900
            Width           =   5895
         End
         Begin VB.TextBox txtHpmTelNo 
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
            Left            =   8160
            Locked          =   -1  'True
            MaxLength       =   50
            TabIndex        =   98
            TabStop         =   0   'False
            Top             =   3600
            Width           =   5895
         End
         Begin VB.TextBox txtHpmStnName 
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
            Left            =   8160
            Locked          =   -1  'True
            MaxLength       =   50
            TabIndex        =   97
            TabStop         =   0   'False
            Top             =   3300
            Width           =   5895
         End
         Begin VB.TextBox txtHpmAraName 
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
            Left            =   8160
            Locked          =   -1  'True
            MaxLength       =   50
            TabIndex        =   96
            TabStop         =   0   'False
            Top             =   3000
            Width           =   5895
         End
         Begin VB.TextBox txtHpmAddr 
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
            Height          =   645
            Left            =   8160
            Locked          =   -1  'True
            MaxLength       =   250
            TabIndex        =   95
            TabStop         =   0   'False
            Top             =   2340
            Width           =   5895
         End
         Begin VB.TextBox txtHpmName 
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
            Left            =   8160
            MaxLength       =   50
            TabIndex        =   5
            Top             =   1320
            Width           =   5895
         End
         Begin VB.TextBox mskEttRegNo 
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
            Left            =   4200
            TabIndex        =   2
            Text            =   "0"
            Top             =   1020
            Width           =   1455
         End
         Begin VB.TextBox mskBouStkCode 
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
            TabIndex        =   89
            Text            =   "-1"
            Top             =   240
            Width           =   1455
         End
         Begin VB.TextBox dtpBouTrnRefDt 
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
            Left            =   5520
            MaxLength       =   50
            TabIndex        =   13
            Text            =   "dd/mm/yyyy"
            Top             =   4680
            Width           =   1455
         End
         Begin VB.TextBox txtBouTrnRefNo 
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
            MaxLength       =   15
            TabIndex        =   12
            Tag             =   "AhCode"
            Top             =   4680
            Width           =   2295
         End
         Begin VB.TextBox txtBouTime_str 
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
            Left            =   11280
            MaxLength       =   50
            TabIndex        =   11
            Text            =   "00:00"
            Top             =   4320
            Width           =   855
         End
         Begin VB.TextBox dtpBouDate 
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
            Left            =   9120
            MaxLength       =   50
            TabIndex        =   10
            Text            =   "dd/mm/yyyy"
            Top             =   4320
            Width           =   1455
         End
         Begin VB.TextBox mskBouVchNo 
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
            Left            =   6480
            TabIndex        =   9
            TabStop         =   0   'False
            Tag             =   "AhCode"
            Text            =   "0"
            Top             =   4320
            Width           =   1455
         End
         Begin VB.TextBox txtVtmName 
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
            TabIndex        =   8
            TabStop         =   0   'False
            Top             =   4320
            Width           =   2295
         End
         Begin VB.TextBox txtBouPrefix 
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
            Left            =   5520
            TabIndex        =   30
            Tag             =   "AhCode"
            Text            =   "[Prefix]"
            Top             =   4320
            Width           =   975
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
            Text            =   "-1"
            Top             =   240
            Width           =   1455
         End
         Begin VB.TextBox txtEttName 
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
            TabIndex        =   3
            Top             =   1320
            Width           =   5895
         End
         Begin VB.TextBox txtEttAddr 
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
            Height          =   645
            Left            =   2040
            Locked          =   -1  'True
            MaxLength       =   250
            TabIndex        =   26
            TabStop         =   0   'False
            Top             =   2340
            Width           =   5895
         End
         Begin VB.TextBox txtEttAraName 
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
            Locked          =   -1  'True
            MaxLength       =   50
            TabIndex        =   28
            TabStop         =   0   'False
            Top             =   3000
            Width           =   5895
         End
         Begin VB.TextBox txtEttStnName 
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
            Locked          =   -1  'True
            MaxLength       =   50
            TabIndex        =   29
            TabStop         =   0   'False
            Top             =   3300
            Width           =   5895
         End
         Begin VB.TextBox txtEttTelNo 
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
            Locked          =   -1  'True
            MaxLength       =   50
            TabIndex        =   25
            TabStop         =   0   'False
            Top             =   3600
            Width           =   5895
         End
         Begin VB.TextBox txtEttSmsNo 
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
            Locked          =   -1  'True
            MaxLength       =   50
            TabIndex        =   27
            TabStop         =   0   'False
            Top             =   3900
            Width           =   5895
         End
         Begin VB.TextBox txtBohRemark 
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
            Left            =   9120
            MaxLength       =   50
            TabIndex        =   14
            Text            =   "HdrNarr"
            Top             =   4680
            Width           =   5295
         End
         Begin VB.Label lblLnkBagRefNo 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Bag Ref.No.:"
            BeginProperty Font 
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
            TabIndex        =   125
            Top             =   1020
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
            Index           =   13
            Left            =   120
            TabIndex        =   113
            Top             =   2040
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
            TabIndex        =   110
            Top             =   1740
            Width           =   1935
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
            TabIndex        =   109
            Top             =   1740
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
            Height          =   285
            Index           =   7
            Left            =   5700
            TabIndex        =   104
            Top             =   1020
            Width           =   795
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Hosp.Ref.No.:"
            BeginProperty Font 
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
            Left            =   8220
            TabIndex        =   102
            Top             =   1740
            Width           =   1275
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "H.Ref.Date:"
            BeginProperty Font 
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
            Left            =   11460
            TabIndex        =   101
            Top             =   1740
            Width           =   1095
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
            Left            =   3360
            TabIndex        =   94
            Top             =   1020
            Width           =   795
         End
         Begin VB.Label Label2 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            Caption         =   "Patient Reg.No./Name and Address"
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
            Index           =   19
            Left            =   2040
            TabIndex        =   93
            Top             =   660
            Width           =   5865
         End
         Begin VB.Label Label2 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            Caption         =   "Hospital Reg.No./Name and Address"
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
            Index           =   20
            Left            =   8175
            TabIndex        =   92
            Top             =   660
            Width           =   5895
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Ref.Date:"
            BeginProperty Font 
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
            Index           =   2
            Left            =   4560
            TabIndex        =   88
            Top             =   4680
            Width           =   975
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Bag Ref.No.:"
            BeginProperty Font 
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
            Index           =   1
            Left            =   120
            TabIndex        =   87
            Top             =   4680
            Width           =   1935
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
            Left            =   8160
            TabIndex        =   84
            Top             =   4320
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
            Left            =   10680
            TabIndex        =   83
            Top             =   4320
            Width           =   495
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Vch.No.:"
            BeginProperty Font 
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
            Left            =   4560
            TabIndex        =   82
            Top             =   4320
            Width           =   855
         End
         Begin VB.Label lblVchType 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Vch.Type:"
            BeginProperty Font 
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
            TabIndex        =   81
            Top             =   4320
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
            TabIndex        =   80
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
            TabIndex        =   79
            Top             =   1320
            Width           =   1935
         End
         Begin VB.Line Line3 
            Index           =   1
            X1              =   0
            X2              =   14640
            Y1              =   600
            Y2              =   600
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
            TabIndex        =   78
            Top             =   2340
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
            TabIndex        =   77
            Top             =   3000
            Width           =   1935
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
            TabIndex        =   76
            Top             =   3300
            Width           =   1935
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
            TabIndex        =   75
            Top             =   3600
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
            Left            =   120
            TabIndex        =   74
            Top             =   3900
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
            Left            =   8160
            TabIndex        =   73
            Top             =   4680
            Width           =   975
         End
         Begin VB.Shape Shape1 
            BackColor       =   &H00E4DAFF&
            BackStyle       =   1  'Opaque
            Height          =   4155
            Index           =   0
            Left            =   0
            Top             =   120
            Width           =   14655
         End
         Begin VB.Shape Shape1 
            BackColor       =   &H00F7D987&
            BackStyle       =   1  'Opaque
            Height          =   795
            Index           =   2
            Left            =   0
            Top             =   4260
            Width           =   14655
         End
      End
      Begin VB.TextBox txtBdgName 
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
            Name            =   "MS Sans Serif"
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
         TabIndex        =   17
         Text            =   "BdgName"
         Top             =   5580
         Width           =   1815
      End
      Begin VB.TextBox mskBouPckQty 
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
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   9300
         TabIndex        =   21
         Tag             =   "AhCode"
         Text            =   "PckQty"
         Top             =   5580
         Width           =   1155
      End
      Begin VB.TextBox mskBouBldQty 
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
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   10440
         TabIndex        =   22
         Tag             =   "AhCode"
         Text            =   "BldQty"
         Top             =   5580
         Width           =   1035
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
         Left            =   14400
         Style           =   1  'Graphical
         TabIndex        =   24
         Top             =   9480
         Width           =   375
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd2 
         Height          =   1275
         Left            =   120
         TabIndex        =   15
         Top             =   5280
         Width           =   14655
         _ExtentX        =   25850
         _ExtentY        =   2249
         _Version        =   393216
         RowHeightMin    =   285
         HighLight       =   2
         SelectionMode   =   1
         Appearance      =   0
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin VB.Frame frFooter 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         ForeColor       =   &H80000008&
         Height          =   3255
         Left            =   120
         TabIndex        =   85
         Top             =   6600
         Width           =   14655
         Begin MSFlexGridLib.MSFlexGrid Mfgrd3 
            Height          =   1740
            Left            =   0
            TabIndex        =   123
            TabStop         =   0   'False
            Top             =   60
            Width           =   10815
            _ExtentX        =   19076
            _ExtentY        =   3069
            _Version        =   393216
            RowHeightMin    =   285
            HighLight       =   2
            SelectionMode   =   1
            Appearance      =   0
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
         End
         Begin MSFlexGridLib.MSFlexGrid Mfgrd4 
            Height          =   1440
            Left            =   0
            TabIndex        =   124
            TabStop         =   0   'False
            Top             =   1800
            Width           =   14115
            _ExtentX        =   24897
            _ExtentY        =   2540
            _Version        =   393216
            RowHeightMin    =   285
            HighLight       =   2
            SelectionMode   =   1
            Appearance      =   0
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
         End
         Begin VB.Label lblBouBldQtyTot 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "BldQty"
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
            Left            =   11940
            TabIndex        =   90
            Top             =   120
            Width           =   975
         End
         Begin VB.Label lblBouPckQtyTot 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "PckQty"
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
            Left            =   10860
            TabIndex        =   86
            Top             =   120
            Width           =   975
         End
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
      TabIndex        =   38
      Top             =   840
      Width           =   15015
      Begin VB.Frame frPrintCRList 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   3615
         Left            =   3480
         TabIndex        =   114
         Top             =   1860
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
            TabIndex        =   65
            Top             =   3000
            Width           =   855
         End
         Begin VB.TextBox mskBouVchNo 
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
            TabIndex        =   59
            Tag             =   "AhCode"
            Text            =   "0"
            Top             =   960
            Width           =   1455
         End
         Begin VB.TextBox txtVtmName 
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
            TabIndex        =   58
            Top             =   600
            Width           =   3495
         End
         Begin VB.TextBox mskBouVchNo 
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
            TabIndex        =   60
            Tag             =   "AhCode"
            Text            =   "0"
            Top             =   960
            Width           =   1455
         End
         Begin VB.ComboBox cmbCRList 
            Height          =   315
            Left            =   2160
            Style           =   2  'Dropdown List
            TabIndex        =   61
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
            TabIndex        =   63
            Text            =   "0"
            Top             =   2040
            Width           =   1455
         End
         Begin VB.ComboBox cmbPrintDest 
            Height          =   315
            Left            =   2160
            Style           =   2  'Dropdown List
            TabIndex        =   64
            Top             =   2400
            Width           =   3495
         End
         Begin VB.ComboBox cmbPrinterList 
            Height          =   315
            Left            =   2160
            Style           =   2  'Dropdown List
            TabIndex        =   62
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
            TabIndex        =   122
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
            TabIndex        =   121
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
            TabIndex        =   120
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
            TabIndex        =   119
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
            TabIndex        =   118
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
            TabIndex        =   117
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
            TabIndex        =   116
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
            TabIndex        =   115
            Top             =   1680
            Width           =   1935
         End
      End
      Begin VB.Frame frConfigure 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   6015
         Left            =   3000
         TabIndex        =   67
         Top             =   720
         Width           =   6735
         Begin VB.TextBox txtQryHpmName 
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
            TabIndex        =   49
            Top             =   1560
            Width           =   4455
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
            Left            =   3060
            TabIndex        =   57
            Top             =   5340
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
            Height          =   3195
            Left            =   2160
            TabIndex        =   50
            Top             =   1980
            Width           =   2655
            Begin VB.OptionButton optHospwise 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Hospital-wise"
               BeginProperty Font 
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
               TabIndex        =   56
               Top             =   2700
               Width           =   2055
            End
            Begin VB.OptionButton optExpanded 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Expanded"
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
               TabIndex        =   51
               Top             =   360
               Width           =   2055
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
               TabIndex        =   52
               Top             =   840
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
               TabIndex        =   53
               Top             =   1320
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
               TabIndex        =   54
               Top             =   1800
               Width           =   2055
            End
            Begin VB.OptionButton optEntitywise 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Person-wise"
               BeginProperty Font 
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
               TabIndex        =   55
               Top             =   2280
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
            TabIndex        =   47
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
            TabIndex        =   46
            Tag             =   "AhCode"
            Text            =   "dd/mm/yyyy"
            Top             =   720
            Width           =   1455
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
            TabIndex        =   48
            Top             =   1140
            Width           =   4455
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Hospital Name:"
            BeginProperty Font 
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
            TabIndex        =   100
            Top             =   1620
            Width           =   1515
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
            Height          =   285
            Index           =   3
            Left            =   3600
            TabIndex        =   71
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
            Height          =   285
            Index           =   2
            Left            =   120
            TabIndex        =   70
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
            TabIndex        =   69
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
            Height          =   285
            Index           =   1
            Left            =   120
            TabIndex        =   68
            Top             =   1140
            Width           =   1515
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
         TabIndex        =   45
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
         TabIndex        =   43
         Top             =   360
         Width           =   4215
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd1 
         Height          =   6375
         Left            =   120
         TabIndex        =   44
         Top             =   720
         Width           =   14055
         _ExtentX        =   24791
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
         TabIndex        =   66
         Top             =   360
         Width           =   735
      End
   End
   Begin VB.TextBox txtVoid 
      CausesValidation=   0   'False
      Height          =   375
      Left            =   0
      TabIndex        =   36
      TabStop         =   0   'False
      Text            =   "Void"
      Top             =   10440
      Width           =   375
   End
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Blood Issue (Outgoing)"
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
      TabIndex        =   37
      Top             =   0
      Width           =   9015
   End
End
Attribute VB_Name = "frmBloodOutTran"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Dim mFormLoaded As Boolean, mLastKeyPressed As Integer, mMaskKeyPressed As Integer
Dim mFormUIdCode As Long, mFormUIdFileName As String, mFormAcsPermFileName As String
Dim mFormSysVchType As Integer, mFormVchTypeList As String, mBouCode As Long, mBouStkCode As Long, mBouEttCode As Long, mBouHpmCode As Long, mQryEttCode As Long, mQryHpmCode As Long, mEttRegNoChanged As Boolean, mHpmRegNoChanged As Boolean, mBouDateChanged As Boolean, dtlAddEditMode As Boolean, dtlAddMode As Boolean, dtlEditCanceled As Boolean
Dim mRemoteAccess As Boolean, mEntrySaved As Boolean, mEntryAborted As Boolean
Dim dbAcDatabase As New ADODB.Connection, dbStDatabase As New ADODB.Connection, dbBdkDatabase As New ADODB.Connection, dbGrpDatabase As New ADODB.Connection, dbComDatabase As New ADODB.Connection
Dim datRecset As New ADODB.Recordset
Dim mBouCode_old As Long, mBouStkCode_old As Long, mBouEttCode_old As Long, mBouHpmCode_old As Long, mBouDate_old As Date, mBouVtmCode_old As Long, mBouVchNo_old As Long, mBouTime_old As Long
Dim mBouBdgCode_old As Long, mBouBdcCode_old As Long, mBouBldCode_old As Long, mBouPckQty_old As Double, mBouItmCode_old As Long, mBouItrCode_old As Long, mBouBinCode_old As Long, mBouBinICode_old As Long    ''' mBouBdpCode_old As Long,
Dim clsAH As clsAccountHead, clsSTK As clsStockJrn, clsBOU As clsBdkMultiTranEntry, clsARA As clsComMastEntry, clsSTN As clsComMastEntry, clsVTM As clsComMastEntry
Dim clsETT As clsBdkMasterEntry, clsHPM As clsBdkMasterEntry, clsBDG As clsBdkMasterEntry, clsBDC As clsBdkMasterEntry, clsBLD As clsBdkMasterEntry, clsBDP As clsBdkMasterEntry
Dim mActiveControl As Object, clsListStru As clsSelectQueryStructure
Dim fcmbVtmName As clsComFlexSearch
Dim fcmbEttName As clsBdkFlexSearch, fcmbHpmName As clsBdkFlexSearch, fcmbBdgName As clsBdkFlexSearch, fcmbBdcName As clsBdkFlexSearch, fcmbBldRefNo As clsBdkFlexSearch    ''' fcmbBdpName As clsBdkFlexSearch,

Private Type SmryPara
mIndex() As Variant
mFromDate() As Variant
mToDate() As Variant
mEttCode() As Variant
mHpmCode() As Variant
mExpanded() As Variant
mDetailed() As Variant
mMonthwise() As Variant
mDatewise() As Variant
mEntitywise() As Variant
mHospwise() As Variant
mRowIndex() As Variant

End Type

Dim SmryParaLayer As SmryPara

Rem service charges column definitions
Const X2BOUICODE_COL = 0
Const X2BOUSNO_COL = 1
Const X2BDGNAME_COL = 2
Const X2BDCNAME_COL = 3
Const X2BOUNARR_COL = 4
Const X2BOUBLDREFNO_COL = 5
'''Const X2BDPNAME_COL = 6
Const X2BOUPCKQTY_COL = 6
Const X2BOUBLDQTY_COL = 7
Const X2BOUBDGCODE_COL = 8
Const X2BOUBDCCODE_COL = 9
'''Const X2BOUBDPCODE_COL = 11
Const X2BOUBLDCODE_COL = 10
Const X2BOUITMCODE_COL = 11
Const X2BOUITRCODE_COL = 12
Const X2BOUSTKICODE_COL = 13
Const X2BOUBINCODE_COL = 14
Const X2BOUBINICODE_COL = 15
Const X2BOURECSTATE_COL = 16
Const MFGRD2_COLS = 17

Rem link transaction-OUT column definitions
Const X3LNKICODE_COL = 0
Const X3LNKSNO_COL = 1
Const X3LNKVTMNAME_COL = 2
Const X3LNKVCHNO_COL = 3
Const X3LNKDATE_COL = 4
Const X3LNKBDGNAME_COL = 5
Const X3LNKBDCNAME_COL = 6
'''Const X3LNKBDPNAME_COL = 7
Const X3LNKPCKQTY_COL = 7
Const X3LNKBLDQTY_COL = 8
Const X3LNKVTMCODE_COL = 9
Const X3LNKCODE_COL = 10
Const X3LNKBINCODE_COL = 11
Const X3LNKBINICODE_COL = 12
Const MFGRD3_COLS = 13

Rem link transaction-IN column definitions
Const X4LNKICODE_COL = 0
Const X4LNKSNO_COL = 1
Const X4LNKVTMNAME_COL = 2
Const X4LNKVCHNO_COL = 3
Const X4LNKDATE_COL = 4
Const X4LNKETTNAME_COL = 5
Const X4LNKPCKQTY_COL = 6
Const X4LNKBLDQTY_COL = 7
Const X4LNKBLDEXPDT_COL = 8
Const X4LNKBDGNAME_COL = 9
Const X4LNKBDCNAME_COL = 10
'''Const X4LNKBDPNAME_COL = 11
Const X4LNKVTMCODE_COL = 11
Const X4LNKCODE_COL = 12
Const MFGRD4_COLS = 13

Private Sub ClearSmryParaLayer()

With SmryParaLayer
.mIndex = Array()
.mFromDate = Array()
.mToDate = Array()
.mEttCode = Array()
.mHpmCode = Array()
.mExpanded = Array()
.mDetailed = Array()
.mMonthwise = Array()
.mDatewise = Array()
.mEntitywise = Array()
.mHospwise = Array()
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
    ReDim Preserve .mHpmCode(mIndex)
    ReDim Preserve .mExpanded(mIndex)
    ReDim Preserve .mDetailed(mIndex)
    ReDim Preserve .mMonthwise(mIndex)
    ReDim Preserve .mDatewise(mIndex)
    ReDim Preserve .mEntitywise(mIndex)
    ReDim Preserve .mHospwise(mIndex)
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
ReDim Preserve .mHpmCode(mIndex)
ReDim Preserve .mExpanded(mIndex)
ReDim Preserve .mDetailed(mIndex)
ReDim Preserve .mMonthwise(mIndex)
ReDim Preserve .mDatewise(mIndex)
ReDim Preserve .mEntitywise(mIndex)
ReDim Preserve .mHospwise(mIndex)
ReDim Preserve .mRowIndex(mIndex)
' -----------------------
.mIndex(mIndex) = mIndex
.mFromDate(mIndex) = Ctod(dtpFromDate.Text)
.mToDate(mIndex) = Ctod(dtpToDate.Text)
    fcmbEttName.BoundText = CStr(mQryEttCode)
    fcmbHpmName.BoundText = CStr(mQryHpmCode)
.mEttCode(mIndex) = Val(fcmbEttName.BoundText)
.mHpmCode(mIndex) = Val(fcmbHpmName.BoundText)
.mExpanded(mIndex) = optExpanded.Value
.mDetailed(mIndex) = optDetailed.Value
.mMonthwise(mIndex) = optMonthwise.Value
.mDatewise(mIndex) = optDatewise.Value
.mEntitywise(mIndex) = optEntitywise.Value
.mHospwise(mIndex) = optHospwise.Value
.mRowIndex(mIndex) = -1

End With

End Sub

Private Sub RestoreDefaultSmryPara()

dtpFromDate.Text = Dtoc(DefaultEntryDate)
dtpToDate.Text = Dtoc(DefaultEntryDate)
mQryEttCode = 0
mQryHpmCode = 0
txtQryEttName.Text = "": fcmbEttName.BoundText = ""
txtQryHpmName.Text = "": fcmbHpmName.BoundText = ""
optExpanded.Value = False
optDetailed.Value = True
optMonthwise.Value = False
optDatewise.Value = False
optEntitywise.Value = False
optHospwise.Value = False
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
    mQryHpmCode = .mHpmCode(mIndex)
fcmbEttName.BoundText = CStr(mQryEttCode): txtQryEttName.Text = fcmbEttName.Text
fcmbHpmName.BoundText = CStr(mQryHpmCode): txtQryHpmName.Text = fcmbHpmName.Text
optExpanded.Value = .mExpanded(mIndex)
optDetailed.Value = .mDetailed(mIndex)
optMonthwise.Value = .mMonthwise(mIndex)
optDatewise.Value = .mDatewise(mIndex)
optEntitywise.Value = .mEntitywise(mIndex)
optHospwise.Value = .mHospwise(mIndex)
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

Public Property Let FormSysVchType(ByVal mSysVchType As Integer)
mFormSysVchType = mSysVchType
End Property

Public Property Let RemoteAccessCode(ByVal mAccessCode As Long)
mRemoteAccess = True
mBouCode = mAccessCode
End Property

Public Property Get EntryBoundCode() As Long
EntryBoundCode = Val(mskFormBoundField.Text)
End Property

Public Property Get EntryDate() As Date
EntryDate = Ctod(dtpBouDate.Text)
End Property

Public Property Get EntryVtmCode() As Integer
EntryVtmCode = Val(fcmbVtmName.BoundText)
End Property

Public Property Get EntrySaved() As Boolean
EntrySaved = mEntrySaved
End Property

Public Property Get EntryAborted() As Boolean
EntryAborted = mEntryAborted
End Property

Public Property Get EttName() As String
EttName = txtEttName.Text
End Property

Public Property Get FormAddEditMode() As Integer
FormAddEditMode = cmbFormEntryMode.ListIndex
End Property

Public Property Let FormAddEditMode(ByVal New_FormEntryMode As Integer)
cmbFormEntryMode.ListIndex = New_FormEntryMode
End Property

Public Property Get SecuMenuName() As String
SecuMenuName = Me.Name
End Property

Private Sub cmdConfigure_Click()
If IsFinYrDate(Ctod(dtpFromDate.Text)) = False Then
    ErrorBox "Invalid Date Range !!!"
    dtpFromDate.SetFocus
    Exit Sub
End If
If IsFinYrDate(Ctod(dtpToDate.Text)) = False Then
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
                Call Data_EditEvent
            Else
                fcmbEttName.BoundText = CStr(mQryEttCode)
                fcmbHpmName.BoundText = CStr(mQryHpmCode)
                
                txtVoid.SetFocus
                If optMonthwise.Value = True Then
                    dtpFromDate.Text = Dtoc(MonthStartDate(DateSerial(Val(Left(.fields("BouYrMonth"), 4)), Val(Right(.fields("BouYrMonth"), 2)), 1)))
                    dtpToDate.Text = Dtoc(MonthEndDate(DateSerial(Val(Left(.fields("BouYrMonth"), 4)), Val(Right(.fields("BouYrMonth"), 2)), 1)))
                    optMonthwise.Value = False
                    optDatewise.Value = True
                    
                ElseIf optDatewise.Value = True Then
                    dtpFromDate.Text = Dtoc(.fields("BohDate"))
                    dtpToDate.Text = Dtoc(.fields("BohDate"))
                    optDatewise.Value = False
                    optDetailed.Value = True
                    
                ElseIf optEntitywise.Value = True Then
                    mQryEttCode = .fields("BohEttCode")
                    fcmbEttName.BoundText = CStr(mQryEttCode)
                    txtQryEttName.Text = fcmbEttName.Text
                    optEntitywise.Value = False
                    optDatewise.Value = True
                    
                ElseIf optHospwise.Value = True Then
                    mQryHpmCode = .fields("BohHpmCode")
                    fcmbHpmName.BoundText = CStr(mQryHpmCode)
                    txtQryHpmName.Text = fcmbHpmName.Text
                    optHospwise.Value = False
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
    SendKeys "{TAB}"
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
            Exit Sub
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
            Me.Hide     ''' Unload Me
            Exit Sub
        Else
            Mfgrd1.SetFocus
        End If
    Else
        txtEttName.SetFocus
    End If
End If

End Sub

Private Sub cmdOK_Click()
Dim tRecset As New ADODB.Recordset, srow As Integer, mBouICode As Long, mBouStkICode As Long, mBouItrCode As Long

srow = Mfgrd2.Row
mBouICode = Val(Mfgrd2.TextMatrix(srow, X2BOUICODE_COL))
mBouStkICode = Val(Mfgrd2.TextMatrix(srow, X2BOUSTKICODE_COL))
mBouItrCode = Val(fcmbBldRefNo.BoundText)  ''' Val(Mfgrd2.TextMatrix(srow, X2BOUITRCODE_COL))

If cmdOK.Caption = "&OK" And dtlEditCanceled = False Then
    Rem updating values in saledtl table
    With clsBOU
    If dtlAddMode = True Then
        .ClearDtl
    Else
        .GetDtlData mBouCode, mBouICode
    End If
    .mTrnCode_lng = mBouCode
    .mTrnDtlSno_int = Val(UnMyNumFmt(mskBouSno.Text))
    .mTrnDate_dt = Ctod(dtpBouDate.Text)
    .mTrnCmpCode_int = sFinYrCmpCode
    
    .mBouStkCode_lng = mBouStkCode
    .mBouStkICode_lng = mBouStkICode
    .mBouEttCode_lng = Val(fcmbEttName.BoundText)
    .mBouHpmCode_lng = Val(fcmbHpmName.BoundText)
    .mBouBdgCode_lng = Val(fcmbBdgName.BoundText)
    .mBouBdcCode_lng = Val(fcmbBdcName.BoundText)
    .mBouNarr_str = txtBouNarr.Text
    .mBouItmCode_lng = Val(mskBouItmCode.Text)
    .mBouBldCode_lng = Val(mskBouBldCode.Text)
    .mBouItrCode_lng = Val(fcmbBldRefNo.BoundText)
    .mBouBldRefNo_str = txtBouBldRefNo.Text
    .mBouBinCode_lng = Val(mskBouBinCode.Text)
    .mBouBinICode_lng = Val(mskBouBinICode.Text)
    .mBouBdpCode_lng = 0    ''' Val(fcmbBdpName.BoundText)
    .mBouBldQty_dbl = Val(UnMyNumFmt(mskBouBldQty.Text))
    .mBouPckQty_dbl = Val(UnMyNumFmt(mskBouPckQty.Text))
    .mBouRemark_str = ""
    
    If dtlAddMode = True Then
        If .AddNewDtl(mBouCode) = True Then
            mBouICode = .mTrnDtlICode_lng
        End If
    Else
        .UpdateDtl mBouCode, mBouICode
    End If
    End With
    
    Rem updating values in stock table
    With clsSTK
    If dtlAddMode = True Then
        .ClearDtl
    Else
        .GetDtlData mBouStkCode, mBouStkICode
    End If
    .mStkSno_int = Val(UnMyNumFmt(mskBouSno.Text))
    .mStkVtmCode_lng = Val(fcmbVtmName.BoundText)
    .mStkPrefix_str = txtBouPrefix.Text
    .mStkVchNo_lng = Val(UnMyNumFmt(mskBouVchNo(0).Text))
    .mStkPostfix_str = ""
    .mStkDate_dt = Ctod(dtpBouDate.Text)
    .mStkItmCode_lng = Val(mskBouItmCode.Text)
    .mStkItmRefCode_lng = Val(fcmbBldRefNo.BoundText)
    .mStkItmRef1Name_str = txtBouBldRefNo.Text
    .mStkItmRef2Name_str = ""
    .mStkQty_dbl = ToIssueQty(Val(UnMyNumFmt(mskBouBldQty.Text)))
    .mStkRate_dbl = 0
    .mStkValue_dbl = 0
    .mStkNarr_str = ""
    .mStkAutoGen_bln = True
    .mStkCmpCode_int = sFinYrCmpCode
    If dtlAddMode = True Then
        If .AddNewDtl(mBouStkCode) = True Then          ''' , mNewItemRef:=False
            mBouStkICode = .mStkICode_lng
        End If
    Else
        .UpdateDtl mBouStkCode, mBouStkICode
    End If
    End With
    
    Rem updating StkICode in BloodOutDtl
    With clsBOU
    If mBouICode > 0 And mBouStkICode > 0 And mBouItrCode > 0 Then
        If dtlAddMode = True Then
            .GetDtlData mBouCode, mBouICode
            
            .mBouStkICode_lng = mBouStkICode
            .UpdateDtl mBouCode, mBouICode
        Else
        End If
    End If
    End With
    
    RefreshDatabase dbBdkDatabase
    RefreshDatabase dbComDatabase
    ChkAnyExcessIsuExist mBouICode
    ChkAnyMisLinkedRcExist mBouICode
    
    With tRecset
    .open "Select * from (((BloodOutDtl" _
        & " inner join BloodMast on BloodOutDtl.BouBldCode = BloodMast.BldCode)" _
        & " inner join BloodGrpMst on BloodOutDtl.BouBdgCode = BloodGrpMst.BdgCode)" _
        & " inner join BloodCompoMst on BloodOutDtl.BouBdcCode = BloodCompoMst.BdcCode)" _
        & " left join (BloodInDtl left join BloodInHdr on BloodInDtl.BinCode = BloodInHdr.BihCode)" _
        & " on BloodOutDtl.BouBinCode = BloodInDtl.BinCode and BloodOutDtl.BouBinICode = BloodInDtl.BinICode" _
        & " and BloodOutDtl.BouBdgCode = BloodInDtl.BinBdgCode and BloodOutDtl.BouBdcCode = BloodInDtl.BinBdcCode" _
        & " and BloodOutDtl.BouBldCode = BloodInDtl.BinBldCode and BloodOutDtl.BouItmCode = BloodInDtl.BinItmCode" _
        & " and BloodOutDtl.BouItrCode = BloodInDtl.BinItrCode" _
        & " where BouCode = " & CStr(mBouCode) & " and BouICode = " & CStr(mBouICode) _
        & " order by BouSno", dbBdkDatabase, adOpenKeyset, adLockOptimistic
    Rem & " inner join BloodPckMst on BloodOutDtl.BouBdpCode = BloodPckMst.BdpCode)"
    '''clsBLD.GetData .fields("BouBdgCode")
    Mfgrd2.TextMatrix(srow, X2BOUICODE_COL) = .fields("BouICode")
    Mfgrd2.TextMatrix(srow, X2BOUSTKICODE_COL) = .fields("BouStkICode")
    Mfgrd2.TextMatrix(srow, X2BOUSNO_COL) = ToMyNumFmt(.fields("BouSno"), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2BDGNAME_COL) = .fields("BdgName")
    Mfgrd2.TextMatrix(srow, X2BDCNAME_COL) = .fields("BdcName")
    Mfgrd2.TextMatrix(srow, X2BOUNARR_COL) = .fields("BouNarr")
    Mfgrd2.TextMatrix(srow, X2BOUBLDREFNO_COL) = .fields("BouBldRefNo")
    '''Mfgrd2.TextMatrix(srow, X2BDPNAME_COL) = .fields("BdpName")
    Mfgrd2.TextMatrix(srow, X2BOUPCKQTY_COL) = ToMyNumFmt(.fields("BouPckQty"), mDecimals:=-1)
    Mfgrd2.TextMatrix(srow, X2BOUBLDQTY_COL) = ToMyNumFmt(.fields("BouBldQty"), mDecimals:=-1)
    Mfgrd2.TextMatrix(srow, X2BOUBDGCODE_COL) = .fields("BouBdgCode")
    Mfgrd2.TextMatrix(srow, X2BOUBDCCODE_COL) = .fields("BouBdcCode")
    '''Mfgrd2.TextMatrix(srow, X2BOUBDPCODE_COL) = .fields("BouBdpCode")
    Mfgrd2.TextMatrix(srow, X2BOUITMCODE_COL) = .fields("BouItmCode")
    Mfgrd2.TextMatrix(srow, X2BOUBLDCODE_COL) = .fields("BouBldCode")
    Mfgrd2.TextMatrix(srow, X2BOUITRCODE_COL) = .fields("BouItrCode")
    Mfgrd2.TextMatrix(srow, X2BOUBINCODE_COL) = .fields("BouBinCode")
    Mfgrd2.TextMatrix(srow, X2BOUBINICODE_COL) = .fields("BouBinICode")
    Mfgrd2.TextMatrix(srow, X2BOURECSTATE_COL) = .fields("BouRecState")
    
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
Mfgrd2.SetFocus
CloseTable tRecset, mCheckOpen:=True

End Sub

Private Sub cmdSaveForm_Click()
txtVoid.SetFocus
Call Data_SaveEvent
Call SmryList

If optDetailed.Value = True Or optExpanded.Value = True Then
    txtSearch1Text_InterActiveChange Format(Ctod(dtpBouDate.Text), "yyyymmdd") + Format(mBouCode, cLONGCODESTRFMT)
ElseIf optMonthwise.Value = True Then
    txtSearch1Text_InterActiveChange Format(Ctod(dtpBouDate.Text), "yyyy") & "/" & Format(Ctod(dtpBouDate.Text), "mm")
ElseIf optDatewise.Value = True Then
    txtSearch1Text_InterActiveChange Format(Ctod(dtpBouDate.Text), "yyyymmdd")
ElseIf optEntitywise.Value = True Then
    txtSearch1Text_InterActiveChange txtEttName.Text
ElseIf optHospwise.Value = True Then
    txtSearch1Text_InterActiveChange txtHpmName.Text
End If

Call ShowEntryMode(False)
Mfgrd1.SetFocus

End Sub

Private Sub cmdSaveForm_GotFocus()
Dim mBouAcsPermNo As Integer, mRetryCount As Integer

txtVoid.SetFocus
cmdSaveForm.Enabled = False
If Data_Verify() = True Then
    If CanAccept() = True Then
        If GetAccessPerm(mBouAcsPermNo, mRetryCount, mFormAcsPermFileName) = True And mRetryCount = 0 Then
            If Data_NetwAuth() = True Then
                Call cmdSaveForm_Click
                Close #mBouAcsPermNo
                If mRemoteAccess = True Then
                    Me.Hide     '''Unload Me
                    Exit Sub
                Else
                    Call Mfgrd1_RowColChange
                    Data_PrintDialog "SaveEvent"
                End If
            Else
                Close #mBouAcsPermNo
            End If
        Else
            Close #mBouAcsPermNo
            AlertBox "System Busy, Try Again !!!"
            
            txtEttName.SetFocus
        End If
    Else
        txtEttName.SetFocus
    End If
End If
cmdSaveForm.Enabled = True
End Sub

Private Sub dtpBouDate_Change()
If InterActiveChange(dtpBouDate) = True Then
    mBouDateChanged = False
End If

End Sub

Private Sub dtpBouHpmRefDt_GotFocus()
FlashActiveControl dtpBouHpmRefDt, True
End Sub

Private Sub dtpBouHpmRefDt_LostFocus()
FlashActiveControl dtpBouHpmRefDt, False
End Sub

Private Sub dtpFromDate_GotFocus()
FlashActiveControl dtpFromDate, True
End Sub

Private Sub dtpFromDate_LostFocus()
FlashActiveControl dtpFromDate, False
End Sub

Private Sub dtpFromDate_Validate(Cancel As Boolean)
dtpFromDate.Text = ToMyDate(dtpFromDate.Text)
If IsFinYrDate(Ctod(dtpFromDate.Text)) = False Then
    ErrorBox "Invalid Date Range !!!"
    dtpFromDate.SetFocus
    Cancel = True
End If

End Sub

Private Sub dtpBouDate_GotFocus()
FlashActiveControl dtpBouDate, True
mBouDateChanged = False
End Sub

Private Sub dtpBouDate_LostFocus()
FlashActiveControl dtpBouDate, False
End Sub

Private Sub dtpBouDate_Validate(Cancel As Boolean)
dtpBouDate.Text = ToMyDate(dtpBouDate.Text)
If IsFinYrDate(Ctod(dtpBouDate.Text)) = False Then
    ErrorBox "Invalid Input !!!"
    dtpBouDate.SetFocus
    Cancel = True
Else
'''    If mBouDateChanged = True Then
'''        Call ShowOldBouCodeDesc
'''    End If
End If

End Sub

Private Sub dtpBouTrnRefDt_GotFocus()
FlashActiveControl dtpBouTrnRefDt, True
End Sub

Private Sub dtpBouTrnRefDt_LostFocus()
FlashActiveControl dtpBouTrnRefDt, False
End Sub

Private Sub dtpBouTrnRefDt_Validate(Cancel As Boolean)
dtpBouTrnRefDt.Text = ToMyDate(dtpBouTrnRefDt.Text)

End Sub

Private Sub dtpToDate_GotFocus()
FlashActiveControl dtpToDate, True
End Sub

Private Sub dtpToDate_LostFocus()
FlashActiveControl dtpToDate, False
End Sub

Private Sub dtpToDate_Validate(Cancel As Boolean)
dtpToDate.Text = ToMyDate(dtpToDate.Text)
If IsFinYrDate(Ctod(dtpToDate.Text)) = False Then
    ErrorBox "Invalid Date Range !!!"
    dtpToDate.SetFocus
    Cancel = True
End If

End Sub

Private Sub Form_Activate()
If mFormLoaded = False Then
    Select Case mFormSysVchType
    Case cBDK_VTYPE_BLOODCONS
        lblFormHeading.Caption = "Blood Consumption (Out) Voucher"
        lblVchType.Caption = "Vch.Type"
        lblFormHeading.BackColor = RGB(142, 172, 187)
    Case cBDK_VTYPE_BLOODISSUED
        lblFormHeading.Caption = "Blood Issue (Out) Voucher"
        lblVchType.Caption = "Vch.Type"
        lblFormHeading.BackColor = RGB(199, 210, 146)
    Case Else
        ErrorBox "Invalid Voucher Type !!!"
        If mRemoteAccess = True Then
            Me.Hide
            Exit Sub
        Else
            Unload Me
            Exit Sub
        End If
    End Select
    Shape1(2).BackColor = lblFormHeading.BackColor
    
    If mRemoteAccess = True Then
        MoveRecToFirst datRecset
        ShowRecActiveFlexRow datRecset, Mfgrd1
        Mfgrd1.SetFocus
        If mBouCode = 0 Then
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

Public Sub Form_Load()
Dim colcnt As Integer

If mFormSysVchType < 1 Then
    Exit Sub
End If

mFormUIdFileName = "BldOutDt.Uid"
mFormAcsPermFileName = "BldOutDt.Acp"
mFormUIdCode = GetUIdCode(mProcess:=Me.Name, mUIdFileName:=mFormUIdFileName, mAcsPermFileName:=mFormAcsPermFileName)
If mFormUIdCode = 0 Then
    ErrorBox cSYSBUSY_ACS_DENIED
    Unload Me
    Exit Sub
End If

mFormLoaded = False
mFormVchTypeList = ""
mEntrySaved = False: mEntryAborted = False
SetFormSize Me, frmMain
Call Form_Resize

Call SetVoidControl(txtVoid)
txtSearch1Text.Enabled = False
frConfigure.Visible = False
frPrintCRList.Visible = False

ChkCustomForm Me, CfsFileFullPath("BloodOut.Cfs")

lblLnkBagRefNo.Visible = (mFormSysVchType = cBDK_VTYPE_BLOODCONS)
txtLnkBouTrnRefNo.Visible = (mFormSysVchType = cBDK_VTYPE_BLOODCONS)

OpenAcDataSource dbAcDatabase
OpenStDataSource dbStDatabase
OpenBdkDataSource dbBdkDatabase
OpenGrpDataSource dbGrpDatabase
OpenComDataSource dbComDatabase

mFormVchTypeList = GetSubVchTypeList(cnn:=dbAcDatabase, mSysVchType:=mFormSysVchType, mRtnDefValue:="0")

Set clsListStru = New clsSelectQueryStructure

Set clsSTK = New clsStockJrn
Set clsSTK.dbStDatabase = dbStDatabase
Set clsSTK.dbGrpDatabase = dbGrpDatabase

Set clsAH = New clsAccountHead
Set clsAH.dbAcDatabase = dbAcDatabase
Set clsAH.dbGrpDatabase = dbGrpDatabase

Set clsBOU = New clsBdkMultiTranEntry
Set clsBOU.dbAcDatabase = dbAcDatabase
Set clsBOU.dbStDatabase = dbStDatabase
Set clsBOU.dbBdkDatabase = dbBdkDatabase
clsBOU.blnBloodOutTran = True
clsBOU.Init

Set clsETT = New clsBdkMasterEntry
Set clsETT.dbAcDatabase = dbAcDatabase
Set clsETT.dbBdkDatabase = dbBdkDatabase
clsETT.blnEntityMast = True
clsETT.Init

Set clsHPM = New clsBdkMasterEntry
Set clsHPM.dbAcDatabase = dbAcDatabase
Set clsHPM.dbBdkDatabase = dbBdkDatabase
clsHPM.blnHospMast = True
clsHPM.Init

Set clsBLD = New clsBdkMasterEntry
Set clsBLD.dbBdkDatabase = dbBdkDatabase
Set clsBLD.dbStDatabase = dbStDatabase
clsBLD.blnBloodMast = True
clsBLD.Init

Set clsBDG = New clsBdkMasterEntry
Set clsBDG.dbBdkDatabase = dbBdkDatabase
Set clsBDG.dbStDatabase = dbStDatabase
clsBDG.blnBloodGrpMast = True
clsBDG.Init

Set clsBDC = New clsBdkMasterEntry
Set clsBDC.dbBdkDatabase = dbBdkDatabase
Set clsBDC.dbStDatabase = dbStDatabase
clsBDC.blnBloodCompoMast = True
clsBDC.Init

Set clsBDP = New clsBdkMasterEntry
Set clsBDP.dbBdkDatabase = dbBdkDatabase
Set clsBDP.dbStDatabase = dbStDatabase
clsBDP.blnBloodPackMast = True
clsBDP.Init

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

Set fcmbVtmName = New clsComFlexSearch
Set fcmbVtmName.dbAcDatabase = dbAcDatabase
fcmbVtmName.blnVTypeMastList = True
fcmbVtmName.mListSqlExpr = "Select * from VTypMast where VtmSysCode = " & CStr(mFormSysVchType) & " order by VtmName"
fcmbVtmName.Init

Set fcmbEttName = New clsBdkFlexSearch
Set fcmbEttName.dbBdkDatabase = dbBdkDatabase
Set fcmbEttName.dbComDatabase = dbComDatabase
fcmbEttName.blnEntityMastListByName = True
fcmbEttName.Init

Set fcmbHpmName = New clsBdkFlexSearch
Set fcmbHpmName.dbBdkDatabase = dbBdkDatabase
Set fcmbHpmName.dbComDatabase = dbComDatabase
fcmbHpmName.blnHospMastListByName = True
fcmbHpmName.Init

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

Set fcmbBldRefNo = New clsBdkFlexSearch
Set fcmbBldRefNo.dbBdkDatabase = dbBdkDatabase
Set fcmbBldRefNo.dbComDatabase = dbComDatabase
fcmbBldRefNo.mFiltCond = "True = False"
fcmbBldRefNo.blnBalBldRefNoList = True
fcmbBldRefNo.Init

'''Set fcmbBdpName = New clsBdkFlexSearch
'''Set fcmbBdpName.dbBdkDatabase = dbBdkDatabase
'''Set fcmbBdpName.dbComDatabase = dbComDatabase
'''fcmbBdpName.blnBloodPckMastList = True
'''fcmbBdpName.Init

Call RestoreDefaultSmryPara
If mRemoteAccess = True Then
    optDetailed.Value = True
    AddSmryParaLayer mClear:=True
End If

If mRemoteAccess = True Then
    datRecset.open "Select * from (BloodOutHdr" _
        & " inner join EntityMast ett on BloodOutHdr.BohEttCode = ett.EttCode)" _
        & " inner join HospMast hpm on BloodOutHdr.BohHpmCode = hpm.HpmCode" _
        & " where BohCode = " & CStr(mBouCode) _
        & " and BohVtmCode IN (" & mFormVchTypeList & ")" _
        & " order by BohDate,BohTime" _
        , dbComDatabase, adOpenKeyset, adLockOptimistic
    dtpFromDate.Text = Dtoc(datRecset.fields("BohDate"))
    dtpToDate.Text = Dtoc(datRecset.fields("BohDate"))
    AddSmryParaLayer mClear:=True
Else
    datRecset.open "Select * from (BloodOutHdr" _
        & " inner join EntityMast ett on BloodOutHdr.BohEttCode = ett.EttCode)" _
        & " inner join HospMast hpm on BloodOutHdr.BohHpmCode = hpm.HpmCode" _
        & " where BohVtmCode IN (" & mFormVchTypeList & ")" _
        & " order by BohDate,BohTime" _
        , dbComDatabase, adOpenKeyset, adLockOptimistic
End If
Mfgrd1.FixedCols = 0
Call SmryList

Mfgrd2.FixedRows = 1: Mfgrd2.FixedCols = 0: Mfgrd2.Rows = 2: Mfgrd2.Cols = MFGRD2_COLS: SetGridAutoHeight Mfgrd2

colcnt = X2BOUICODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2BOUICODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BOUSNO_COL: Mfgrd2.ColWidth(colcnt) = mskBouSno.Width: Mfgrd2.TextMatrix(0, colcnt) = "Sno": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BDGNAME_COL: Mfgrd2.ColWidth(colcnt) = txtBdgName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Blood Group": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2BDCNAME_COL: Mfgrd2.ColWidth(colcnt) = txtBdcName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Blood Component": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2BOUNARR_COL: Mfgrd2.ColWidth(colcnt) = txtBouNarr.Width: Mfgrd2.TextMatrix(0, colcnt) = "Description": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2BOUBLDREFNO_COL: Mfgrd2.ColWidth(colcnt) = txtBouBldRefNo.Width: Mfgrd2.TextMatrix(0, colcnt) = "Ref.No": Mfgrd2.ColAlignment(colcnt) = 1
'''colcnt = X2BDPNAME_COL: Mfgrd2.ColWidth(colcnt) = txtBdpName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Packing": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2BOUPCKQTY_COL: Mfgrd2.ColWidth(colcnt) = mskBouPckQty.Width: Mfgrd2.TextMatrix(0, colcnt) = "Pck/Bag": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BOUBLDQTY_COL: Mfgrd2.ColWidth(colcnt) = mskBouBldQty.Width: Mfgrd2.TextMatrix(0, colcnt) = "Qty": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BOUBDGCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2BOUBDGCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BOUBDCCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2BOUBDCCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
'''colcnt = X2BOUBDPCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2BOUBDPCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BOUITMCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2BOUITMCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BOUBLDCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2BOUBLDCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BOUITRCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2BOUITRCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BOUSTKICODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2BOUSTKICODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BOUBINCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2BOUBINCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BOUBINICODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2BOUBINICODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BOURECSTATE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2BOURECSTATE_COL": Mfgrd2.ColAlignment(colcnt) = 7
' ---------------------------
colcnt = X2BOUSNO_COL: mskBouSno.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2BDGNAME_COL: txtBdgName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2BDCNAME_COL: txtBdcName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2BOUNARR_COL: txtBouNarr.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2BOUBLDREFNO_COL: txtBouBldRefNo.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
'''colcnt = X2BDPNAME_COL: txtBdpName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2BOUPCKQTY_COL: mskBouPckQty.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2BOUBLDQTY_COL: mskBouBldQty.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
cmdOK.Left = mskBouBldQty.Left + mskBouBldQty.Width

lblBouPckQtyTot.Left = mskBouPckQty.Left - frFooter.Left: lblBouPckQtyTot.Width = mskBouPckQty.Width
lblBouBldQtyTot.Left = mskBouBldQty.Left - frFooter.Left: lblBouBldQtyTot.Width = mskBouBldQty.Width

' --------------------------------------------------------
Mfgrd3.FixedRows = 1: Mfgrd3.FixedCols = 0: Mfgrd3.Rows = 2: Mfgrd3.Cols = MFGRD3_COLS: SetGridAutoHeight Mfgrd3

colcnt = X3LNKICODE_COL: Mfgrd3.ColWidth(colcnt) = 0: Mfgrd3.TextMatrix(0, colcnt) = "X3LNKICODE_COL": Mfgrd3.ColAlignment(colcnt) = 7
colcnt = X3LNKSNO_COL: Mfgrd3.ColWidth(colcnt) = 350: Mfgrd3.TextMatrix(0, colcnt) = "Sno": Mfgrd3.ColAlignment(colcnt) = 7
colcnt = X3LNKVTMNAME_COL: Mfgrd3.ColWidth(colcnt) = 1500: Mfgrd3.TextMatrix(0, colcnt) = "Voucher": Mfgrd3.ColAlignment(colcnt) = 1
colcnt = X3LNKVCHNO_COL: Mfgrd3.ColWidth(colcnt) = 1250: Mfgrd3.TextMatrix(0, colcnt) = "Vch.No": Mfgrd3.ColAlignment(colcnt) = 7
colcnt = X3LNKDATE_COL: Mfgrd3.ColWidth(colcnt) = 1250: Mfgrd3.TextMatrix(0, colcnt) = "Date": Mfgrd3.ColAlignment(colcnt) = 1
colcnt = X3LNKBDGNAME_COL: Mfgrd3.ColWidth(colcnt) = 1250: Mfgrd3.TextMatrix(0, colcnt) = "Blood Group": Mfgrd3.ColAlignment(colcnt) = 1
colcnt = X3LNKBDCNAME_COL: Mfgrd3.ColWidth(colcnt) = 1500: Mfgrd3.TextMatrix(0, colcnt) = "Blood Component": Mfgrd3.ColAlignment(colcnt) = 1
'''colcnt = X3LNKBDPNAME_COL: Mfgrd3.ColWidth(colcnt) = 1250: Mfgrd3.TextMatrix(0, colcnt) = "Packing": Mfgrd3.ColAlignment(colcnt) = 1
colcnt = X3LNKPCKQTY_COL: Mfgrd3.ColWidth(colcnt) = 1000: Mfgrd3.TextMatrix(0, colcnt) = "Pck/Bag": Mfgrd3.ColAlignment(colcnt) = 7
colcnt = X3LNKBLDQTY_COL: Mfgrd3.ColWidth(colcnt) = 1000: Mfgrd3.TextMatrix(0, colcnt) = "Qty": Mfgrd3.ColAlignment(colcnt) = 7
colcnt = X3LNKVTMCODE_COL: Mfgrd3.ColWidth(colcnt) = 0: Mfgrd3.TextMatrix(0, colcnt) = "X3LNKVTMCODE_COL": Mfgrd3.ColAlignment(colcnt) = 7
colcnt = X3LNKCODE_COL: Mfgrd3.ColWidth(colcnt) = 0: Mfgrd3.TextMatrix(0, colcnt) = "X3LNKCODE_COL": Mfgrd3.ColAlignment(colcnt) = 7
colcnt = X3LNKBINCODE_COL: Mfgrd3.ColWidth(colcnt) = 0: Mfgrd3.TextMatrix(0, colcnt) = "X3LNKBINCODE_COL": Mfgrd3.ColAlignment(colcnt) = 7
colcnt = X3LNKBINICODE_COL: Mfgrd3.ColWidth(colcnt) = 0: Mfgrd3.TextMatrix(0, colcnt) = "X3LNKBINICODE_COL": Mfgrd3.ColAlignment(colcnt) = 7

' --------------------------------------------------------
Mfgrd4.FixedRows = 1: Mfgrd4.FixedCols = 0: Mfgrd4.Rows = 2: Mfgrd4.Cols = MFGRD4_COLS: SetGridAutoHeight Mfgrd4

colcnt = X4LNKICODE_COL: Mfgrd4.ColWidth(colcnt) = 0: Mfgrd4.TextMatrix(0, colcnt) = "X4LNKICODE_COL": Mfgrd4.ColAlignment(colcnt) = 7
colcnt = X4LNKSNO_COL: Mfgrd4.ColWidth(colcnt) = 350: Mfgrd4.TextMatrix(0, colcnt) = "Sno": Mfgrd4.ColAlignment(colcnt) = 7
colcnt = X4LNKVTMNAME_COL: Mfgrd4.ColWidth(colcnt) = 1500: Mfgrd4.TextMatrix(0, colcnt) = "Voucher": Mfgrd4.ColAlignment(colcnt) = 1
colcnt = X4LNKVCHNO_COL: Mfgrd4.ColWidth(colcnt) = 1250: Mfgrd4.TextMatrix(0, colcnt) = "Vch.No": Mfgrd4.ColAlignment(colcnt) = 7
colcnt = X4LNKDATE_COL: Mfgrd4.ColWidth(colcnt) = 1250: Mfgrd4.TextMatrix(0, colcnt) = "Date": Mfgrd4.ColAlignment(colcnt) = 1
colcnt = X4LNKETTNAME_COL: Mfgrd4.ColWidth(colcnt) = 2000: Mfgrd4.TextMatrix(0, colcnt) = "Doner Name": Mfgrd4.ColAlignment(colcnt) = 1
colcnt = X4LNKPCKQTY_COL: Mfgrd4.ColWidth(colcnt) = 1000: Mfgrd4.TextMatrix(0, colcnt) = "Pck/Bag": Mfgrd4.ColAlignment(colcnt) = 7
colcnt = X4LNKBLDQTY_COL: Mfgrd4.ColWidth(colcnt) = 1000: Mfgrd4.TextMatrix(0, colcnt) = "Qty": Mfgrd4.ColAlignment(colcnt) = 7
colcnt = X4LNKBLDEXPDT_COL: Mfgrd4.ColWidth(colcnt) = 1250: Mfgrd4.TextMatrix(0, colcnt) = "Exp.Dt": Mfgrd4.ColAlignment(colcnt) = 1
colcnt = X4LNKBDGNAME_COL: Mfgrd4.ColWidth(colcnt) = 1250: Mfgrd4.TextMatrix(0, colcnt) = "Blood Group": Mfgrd4.ColAlignment(colcnt) = 1
colcnt = X4LNKBDCNAME_COL: Mfgrd4.ColWidth(colcnt) = 1500: Mfgrd4.TextMatrix(0, colcnt) = "Blood Component": Mfgrd4.ColAlignment(colcnt) = 1
'''colcnt = X4LNKBDPNAME_COL: Mfgrd4.ColWidth(colcnt) = 1250: Mfgrd4.TextMatrix(0, colcnt) = "Packing": Mfgrd4.ColAlignment(colcnt) = 1
colcnt = X4LNKVTMCODE_COL: Mfgrd4.ColWidth(colcnt) = 0: Mfgrd4.TextMatrix(0, colcnt) = "X4LNKVTMCODE_COL": Mfgrd4.ColAlignment(colcnt) = 7
colcnt = X4LNKCODE_COL: Mfgrd4.ColWidth(colcnt) = 0: Mfgrd4.TextMatrix(0, colcnt) = "X4LNKCODE_COL": Mfgrd4.ColAlignment(colcnt) = 7

ShowEntryMode False
VisibleControls False

End Sub

Private Sub Form_Resize()
lblFormHeading.Width = Me.Width
cmdFormEscape.Left = Me.Width - (cmdFormEscape.Width * 2)
cmdFormEnter.Left = Me.Width + cmdFormEscape.Width
frFormSmry.Left = (Me.Width - frFormSmry.Width) / 2: frFormSmry.Top = cmbFormEntryMode.Top + (cmbFormEntryMode.Height * 1.1)
frFormDtl.Left = (Me.Width - frFormDtl.Width) / 2: frFormDtl.Top = frFormSmry.Top

End Sub

Private Sub Form_Unload(Cancel As Integer)
Set clsSTK = Nothing
Set clsAH = Nothing
Set clsBOU = Nothing
Set clsETT = Nothing
Set clsHPM = Nothing
Set clsBLD = Nothing
Set clsBDG = Nothing
Set clsBDC = Nothing
Set clsBDP = Nothing
Set clsARA = Nothing
Set clsSTN = Nothing
Set clsVTM = Nothing
Set fcmbEttName = Nothing
Set fcmbHpmName = Nothing
Set fcmbVtmName = Nothing
Set fcmbBdgName = Nothing
Set fcmbBdcName = Nothing
'''Set fcmbBdpName = Nothing
Set fcmbBldRefNo = Nothing
Set clsListStru = Nothing

CloseTable datRecset, mCheckOpen:=True
CloseDataSource dbAcDatabase, mCheckOpen:=True
CloseDataSource dbStDatabase, mCheckOpen:=True
CloseDataSource dbBdkDatabase, mCheckOpen:=True
CloseDataSource dbGrpDatabase, mCheckOpen:=True
CloseDataSource dbComDatabase, mCheckOpen:=True
mFormSysVchType = 0
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
Dim mOpgVchNo As Long, mBouVchNo As Long, tRecset As ADODB.Recordset

Data_Verify = False
If FormAddEditMode = cFORM_EDITMODE And Val(mskFormBoundField.Text) < 1 Then
    ErrorBox "Invalid Key Value !!!"
    txtEttName.SetFocus
    GoTo EndSub
End If
If Val(fcmbEttName.BoundText) < 1 Or Val(fcmbEttName.BoundText) <> mBouEttCode Or (FormAddEditMode = cFORM_EDITMODE And mBouEttCode <> mBouEttCode_old) Then
    ErrorBox "Invalid Patient Selection !!!"
    txtEttName.SetFocus
    GoTo EndSub
End If
If Val(fcmbHpmName.BoundText) < 1 Or Val(fcmbHpmName.BoundText) <> mBouHpmCode Or (FormAddEditMode = cFORM_EDITMODE And mBouHpmCode <> mBouHpmCode_old) Then
    ErrorBox "Invalid Hospital Selection !!!"
    txtHpmName.SetFocus
    GoTo EndSub
End If
Rem sale validations
mBouVchNo = Val(UnMyNumFmt(mskBouVchNo(0).Text))
If mBouVchNo > 0 Then
    If mBouVchNo <> mBouVchNo_old Or Val(fcmbVtmName.BoundText) <> mBouVtmCode_old Or Ctod(dtpBouDate.Text) <> mBouDate_old Or FormAddEditMode = cFORM_ADDMODE Then
        If ChkIsDuplVTypeNo(dbBdkDatabase, dbAcDatabase, mTableName:="BloodOutHdr", mChkFieldName:="BohVchNo", mChkFieldValue:=mBouVchNo, mKeyFieldName:="BohCode", mKeyFieldValue:=mBouCode, mVtmFieldName:="BohVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="BohCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="BohDate", mDateFieldValue:=Ctod(dtpBouDate.Text)) = True Then
            ErrorBox "Duplicate Voucher No. !!!"
            mskBouVchNo(0).SetFocus
            ' ---------------
            If FormAddEditMode = cFORM_ADDMODE Then
                mBouVchNo = GetNextVTypeNo(dbBdkDatabase, dbAcDatabase, dbComDatabase, mTableName:="BloodOutHdr", mFieldName:="BohVchNo", mVtmFieldName:="BohVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="BohCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="BohDate", mDateFieldValue:=Ctod(dtpBouDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
            Else
                mBouVchNo = mBouVchNo_old
            End If
            mskBouVchNo(0).Text = ToMyNumFmt(mBouVchNo, mDecimals:=0)
            GoTo EndSub
        End If
    End If
Else
    ErrorBox "Invalid Input !!!"
    mskBouVchNo(0).SetFocus
    GoTo EndSub
End If
If IsDate(dtpBouDate.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpBouDate.SetFocus
    GoTo EndSub
Else
    If IsFinYrDate(Ctod(dtpBouDate.Text)) = False Then
        ErrorBox "Invalid Input !!!"
        dtpBouDate.SetFocus
        GoTo EndSub
    End If
End If
If TimeToMin(txtBouTime_str.Text) > cDAYMINUTES Then
    ErrorBox "Invalid Input !!!"
    txtBouTime_str.SetFocus
    GoTo EndSub
End If
Rem ------------------------------------------------
txtBouTrnRefNo.Text = ToMyString(Trim(txtBouTrnRefNo.Text))
If txtBouTrnRefNo.Text = "" Then
    ErrorBox "Invalid Input !!!"
    txtBouTrnRefNo.SetFocus
    GoTo EndSub
Else
    If mFormSysVchType = cBDK_VTYPE_BLOODISSUED Then
        Set tRecset = dbComDatabase.Execute("Select * from BloodInHdr bih inner join VTypMast vtm on bih.BihVtmCode = vtm.VtmCode where BihTrnRefNo = '" & txtBouTrnRefNo.Text & "' and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODDONATE) & " order by BihDate desc")
        With tRecset
        If .EOF = True Then
            ErrorBox "Bag No. does not Exist in Blood Donate Entry !!!"
            txtBouTrnRefNo.SetFocus
            CloseTable tRecset
            GoTo EndSub
        End If
        End With
        CloseTable tRecset
    
        Rem If Cancel = False Then
        Rem     Set tRecset = dbComDatabase.Execute("Select * from BloodInHdr bih inner join VTypMast vtm on bih.BihVtmCode = vtm.VtmCode where BihTrnRefNo = '" & txtBouTrnRefNo.Text & "' and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODFILTER))
        Rem     With tRecset
        Rem     If .EOF = True Then
        Rem         ErrorBox "Bag No. does not Exist in Blood Filter/Component Entry !!!"
        Rem         txtBouTrnRefNo.SetFocus
        Rem         CloseTable tRecset
        Rem         GoTo EndSub
        Rem     End If
        Rem     End With
        Rem     CloseTable tRecset
        Rem End If
        
        Rem If Cancel = False Then
        Rem     Set tRecset = dbComDatabase.Execute("Select * from BloodOutHdr boh inner join VTypMast vtm on boh.BohVtmCode = vtm.VtmCode where BohTrnRefNo = '" & txtBouTrnRefNo.Text & "' and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODISSUED) & " and BohCode <> " & CStr(mBouCode))
        Rem     With tRecset
        Rem     If .EOF = False Then
        Rem         ErrorBox "Bag No. Already Used in " & .fields("VtmName") & " No. " & CStr(.fields("BohVchNo")) & " Dated " & Dtoc(.fields("BohDate"))
        Rem         txtBouTrnRefNo.SetFocus
        Rem         CloseTable tRecset
        Rem         GoTo EndSub
        Rem    End If
        Rem     End With
        Rem     CloseTable tRecset
        Rem End If
    
    ElseIf mFormSysVchType = cBDK_VTYPE_BLOODCONS Then
        Set tRecset = dbComDatabase.Execute("Select * from BloodInHdr bih inner join VTypMast vtm on bih.BihVtmCode = vtm.VtmCode where BihTrnRefNo = '" & txtBouTrnRefNo.Text & "' and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODDONATE) & " order by BihDate desc")
        With tRecset
        If .EOF = True Then
            ErrorBox "Bag No. does not Exist in Blood Donate Entry !!!"
            txtBouTrnRefNo.SetFocus
            CloseTable tRecset
            GoTo EndSub
        End If
        End With
        CloseTable tRecset
    
        Rem If Cancel = False Then
        Rem     Set tRecset = dbComDatabase.Execute("Select * from BloodOutHdr boh inner join VTypMast vtm on boh.BohVtmCode = vtm.VtmCode where BohTrnRefNo = '" & txtBouTrnRefNo.Text & "' and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODCONS) & " and BohCode <> " & CStr(mBouCode))
        Rem     With tRecset
        Rem     If .EOF = False Then
        Rem         ErrorBox "Bag No. Already Used in " & .fields("VtmName") & " No. " & CStr(.fields("BohVchNo")) & " Dated " & Dtoc(.fields("BohDate"))
        Rem         txtBouTrnRefNo.SetFocus
        Rem         CloseTable tRecset
        Rem         GoTo EndSub
        Rem     End If
        Rem     End With
        Rem     CloseTable tRecset
        Rem End If
        
        Rem If Cancel = False Then
        Rem     Set tRecset = dbComDatabase.Execute("Select * from BloodOutHdr boh inner join VTypMast vtm on boh.BohVtmCode = vtm.VtmCode where BohTrnRefNo = '" & txtBouTrnRefNo.Text & "' and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODISSUED))
        Rem     With tRecset
        Rem     If .EOF = False Then
        Rem         If tRecset.fields("BohEttCode") <> Val(fcmbEttName.BoundText) Then
        Rem             ErrorBox "Mismatch Patient Name with Entry " & tRecset.fields("VtmName") & " No." & CStr(tRecset.fields("BohVchNo")) & " Dated " & Dtoc(tRecset.fields("BohDate")) & " !!!"
        Rem             txtBouTrnRefNo.SetFocus
        Rem             CloseTable tRecset
        Rem             GoTo EndSub
        Rem
        Rem         ElseIf tRecset.fields("BohHpmCode") <> Val(fcmbHpmName.BoundText) Then
        Rem             ErrorBox "Mismatch Hospital Name with Entry " & tRecset.fields("VtmName") & " No." & CStr(tRecset.fields("BohVchNo")) & " Dated " & Dtoc(tRecset.fields("BohDate")) & " !!!"
        Rem             txtBouTrnRefNo.SetFocus
        Rem             CloseTable tRecset
        Rem             GoTo EndSub
        Rem
        Rem         ElseIf tRecset.fields("BohHpmRefNo") <> txtBouHpmRefNo.Text Then
        Rem             ErrorBox "Mismatch Hospital Ref.No. with Entry " & tRecset.fields("VtmName") & " No." & CStr(tRecset.fields("BohVchNo")) & " Dated " & Dtoc(tRecset.fields("BohDate")) & " !!!"
        Rem             txtBouTrnRefNo.SetFocus
        Rem             CloseTable tRecset
        Rem             GoTo EndSub
        Rem
        Rem         ElseIf tRecset.fields("BohHpmRefDt") <> Ctod(dtpBouHpmRefDt.Text) Then
        Rem             ErrorBox "Mismatch Hospital Ref.Date with Entry " & tRecset.fields("VtmName") & " No." & CStr(tRecset.fields("BohVchNo")) & " Dated " & Dtoc(tRecset.fields("BohDate")) & " !!!"
        Rem             txtBouTrnRefNo.SetFocus
        Rem             CloseTable tRecset
        Rem             GoTo EndSub
        Rem
        Rem         End If
        Rem     End If
        Rem     End With
        Rem     CloseTable tRecset
        Rem End If
    End If
End If
Set tRecset = Nothing

If ChkBldRefNoLink(mCallFromDtlAddEdit:=False) = False Then
    GoTo EndSub
End If
If IsDate(dtpBouTrnRefDt.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpBouTrnRefDt.SetFocus
    GoTo EndSub
End If
If ChkAnyExcessIsuExist() = True Then
    Mfgrd2.SetFocus
    GoTo EndSub
End If
If ChkAnyMisLinkedRcExist() = True Then
    ErrorBox "Invalid Linking !!!"
    Mfgrd2.SetFocus
    GoTo EndSub
End If

Data_Verify = True

EndSub:
If Not tRecset Is Nothing Then
    CloseTable tRecset, mCheckOpen:=True
End If
Exit Function

End Function

Private Function Data_NetwAuth() As Boolean
Dim mBouVchNo As Long
Data_NetwAuth = False

mBouVchNo = Val(UnMyNumFmt(mskBouVchNo(0).Text))
If mBouVchNo <> mBouVchNo_old Or Val(fcmbVtmName.BoundText) <> mBouVtmCode_old Or Ctod(dtpBouDate.Text) <> mBouDate_old Or FormAddEditMode = cFORM_ADDMODE Then
    If ChkIsDuplVTypeNo(dbBdkDatabase, dbAcDatabase, mTableName:="BloodOutHdr", mChkFieldName:="BohVchNo", mChkFieldValue:=mBouVchNo, mKeyFieldName:="BohCode", mKeyFieldValue:=mBouCode, mVtmFieldName:="BohVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="BohCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="BohDate", mDateFieldValue:=Ctod(dtpBouDate.Text)) = True Then
        ErrorBox "Duplicate Voucher No. !!!"
        mskBouVchNo(0).SetFocus
        ' ---------------
        If FormAddEditMode = True Then
            mBouVchNo = GetNextVTypeNo(dbBdkDatabase, dbAcDatabase, dbComDatabase, mTableName:="BloodOutHdr", mFieldName:="BohVchNo", mVtmFieldName:="BohVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="BohCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="BohDate", mDateFieldValue:=Ctod(dtpBouDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
        Else
            mBouVchNo = mBouVchNo_old
        End If
        mskBouVchNo(0).Text = ToMyNumFmt(mBouVchNo, mDecimals:=0)
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
Dim srow As Integer, mBouICode As Long, mBouStkICode As Long, mDeleteit As Boolean

srow = Mfgrd2.Row
mBouICode = Val(Mfgrd2.TextMatrix(srow, X2BOUICODE_COL))
mBouStkICode = Val(Mfgrd2.TextMatrix(srow, X2BOUSTKICODE_COL))

If MyDeleteKey(Shift, KeyCode, mCheckCtrlMask:=False) = True And mBouICode > 0 Then
    mDeleteit = True
    If mDeleteit = True Then
        mDeleteit = CanDelete()
    End If
    If mDeleteit = True Then
        clsBOU.DeleteDtl mBouCode, mBouICode
        clsSTK.DeleteDtl mBouStkCode, mBouStkICode
        
        ShowDtlData mBouCode
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
        mskBouSno.Text = ToMyNumFmt(FlexNextSeqno(Mfgrd2, X2BOUSNO_COL), mDecimals:=0)
        mskBouPckQty.Text = ToMyNumFmt(1, mDecimals:=-1)
    Else
        mskBouICode.Text = Val(Mfgrd2.TextMatrix(srow, X2BOUICODE_COL))
        mskBouStkICode.Text = Val(Mfgrd2.TextMatrix(srow, X2BOUSTKICODE_COL))
        mskBouSno.Text = Mfgrd2.TextMatrix(srow, X2BOUSNO_COL)
        txtBouNarr.Text = Mfgrd2.TextMatrix(srow, X2BOUNARR_COL)
        ' -------------------- depedent assignments
        fcmbBdgName.BoundText = Mfgrd2.TextMatrix(srow, X2BOUBDGCODE_COL): txtBdgName.Text = fcmbBdgName.Text
        fcmbBdcName.BoundText = Mfgrd2.TextMatrix(srow, X2BOUBDCCODE_COL): txtBdcName.Text = fcmbBdcName.Text
        mskBouItmCode.Text = Val(Mfgrd2.TextMatrix(srow, X2BOUITMCODE_COL))
        mskBouBldCode.Text = Val(Mfgrd2.TextMatrix(srow, X2BOUBLDCODE_COL))
        ' --------------------
        Call ChkBldRefNoList
        ' ---------------------
        fcmbBldRefNo.BoundText = Mfgrd2.TextMatrix(srow, X2BOUITRCODE_COL): txtBouBldRefNo.Text = fcmbBldRefNo.Text
        '''txtBouBldRefNo.Text = Mfgrd2.TextMatrix(srow, X2BOUBLDREFNO_COL)
        '''fcmbBdpName.BoundText = Mfgrd2.TextMatrix(srow, X2BOUBDPCODE_COL): txtBdpName.Text = fcmbBdpName.Text
        mskBouPckQty.Text = Mfgrd2.TextMatrix(srow, X2BOUPCKQTY_COL)
        mskBouBldQty.Text = Mfgrd2.TextMatrix(srow, X2BOUBLDQTY_COL)
        mskBouBinCode.Text = Mfgrd2.TextMatrix(srow, X2BOUBINCODE_COL)
        mskBouBinICode.Text = Mfgrd2.TextMatrix(srow, X2BOUBINICODE_COL)
        
    End If
    txtBdgName.SetFocus
    Call ValidDtl
    
    mBouBdgCode_old = Val(fcmbBdgName.BoundText)
    mBouBdcCode_old = Val(fcmbBdcName.BoundText)
    mBouBldCode_old = Val(mskBouBldCode.Text)
    '''mBouBdpCode_old = Val(fcmbBdpName.BoundText)
    mBouItmCode_old = Val(mskBouItmCode.Text)
    mBouItrCode_old = Val(fcmbBldRefNo.BoundText)
    mBouPckQty_old = Val(UnMyNumFmt(mskBouPckQty.Text))
    mBouBinCode_old = Val(mskBouBinCode.Text)
    mBouBinICode_old = Val(mskBouBinICode.Text)
End If

End Sub

Private Sub Mfgrd2_RowColChange()
ShowActiveFlexRow Mfgrd2

End Sub

Private Sub Mfgrd3_GotFocus()
Mfgrd3.Col = FlexLeftVisibleCol(Mfgrd3)
Mfgrd3.LeftCol = FlexLeftVisibleCol(Mfgrd3)
If Mfgrd3.SelectionMode = flexSelectionByRow Then
    Mfgrd3.ColSel = 0: Mfgrd3.ColSel = Mfgrd3.Cols - 1
End If
Call ShowLinkTranInDtl

End Sub

Private Sub Mfgrd3_RowColChange()
ShowActiveFlexRow Mfgrd3
Call ShowLinkTranInDtl

End Sub

Private Sub Mfgrd4_GotFocus()
Mfgrd4.Col = FlexLeftVisibleCol(Mfgrd4)
Mfgrd4.LeftCol = FlexLeftVisibleCol(Mfgrd4)
If Mfgrd4.SelectionMode = flexSelectionByRow Then
    Mfgrd4.ColSel = 0: Mfgrd4.ColSel = Mfgrd4.Cols - 1
End If

End Sub

Private Sub Mfgrd4_RowColChange()
ShowActiveFlexRow Mfgrd4

End Sub

Rem discart this validation, instead use validation at sale hdr level
'Private Function chkSalAmount() As Boolean
'Dim mRtnval As Boolean, srow As Integer, mSalAmount As Double
'
'mRtnval = True
'srow = Mfgrd2.Row
'mSalAmount = Val(UnMyNumFmt(mskBouAmount.Text))
'
'chkSalAmount = mRtnval
'
'End Function

Private Sub mskBouPckQty_GotFocus()
FlashActiveControl mskBouPckQty, True
End Sub

Private Sub mskBouPckQty_LostFocus()
FlashActiveControl mskBouPckQty, False
End Sub

Private Sub mskBouPckQty_Validate(Cancel As Boolean)
mskBouPckQty.Text = ToMyNumFmt(mskBouPckQty.Text, mDecimals:=0, mUseAbs:=True)
If Val(UnMyNumFmt(mskBouPckQty.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskBouPckQty.SetFocus
    Cancel = True
Else
    If FormAddEditMode = cFORM_ADDMODE Or dtlAddMode = True Or Val(UnMyNumFmt(mskBouPckQty.Text)) <> mBouPckQty_old Then
        Rem Call CalcBouBldQty
    End If
End If
Call ValidDtl

End Sub

Private Sub mskBouBldQty_GotFocus()
FlashActiveControl mskBouBldQty, True
End Sub

Private Sub mskBouBldQty_LostFocus()
FlashActiveControl mskBouBldQty, False
End Sub

Private Sub mskBouBldQty_Validate(Cancel As Boolean)
mskBouBldQty.Text = ToMyNumFmt(mskBouBldQty.Text, mDecimals:=0, mUseAbs:=True)
If Val(UnMyNumFmt(mskBouBldQty.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskBouBldQty.SetFocus
    Cancel = True
Else
    Rem Call CalcBouBldQty
End If
Call ValidDtl

End Sub

Private Sub mskBouVchNo_GotFocus(Index As Integer)
FlashActiveControl mskBouVchNo(Index), True
End Sub

Private Sub mskBouVchNo_LostFocus(Index As Integer)
FlashActiveControl mskBouVchNo(Index), False
End Sub

Private Sub mskBouVchNo_Validate(Index As Integer, Cancel As Boolean)
Dim mBouVchNo As Long

mBouVchNo = Val(UnMyNumFmt(mskBouVchNo(0).Text))
If mBouVchNo < 0 And Index = 0 Then
    mBouVchNo = GetNextVTypeNo(dbBdkDatabase, dbAcDatabase, dbComDatabase, mTableName:="BloodOutHdr", mFieldName:="BohVchNo", mVtmFieldName:="BohVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="BohCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="BohDate", mDateFieldValue:=Ctod(dtpBouDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
    mskBouVchNo(Index).Text = ToMyNumFmt(mBouVchNo, mDecimals:=0)
ElseIf mBouVchNo > 0 And Index = 0 Then
    If mBouVchNo <> mBouVchNo_old Or Val(fcmbVtmName.BoundText) <> mBouVtmCode_old Or Ctod(dtpBouDate.Text) <> mBouDate_old Or FormAddEditMode = cFORM_ADDMODE Then
        If ChkIsDuplVTypeNo(dbBdkDatabase, dbAcDatabase, mTableName:="BloodOutHdr", mChkFieldName:="BohVchNo", mChkFieldValue:=mBouVchNo, mKeyFieldName:="BohCode", mKeyFieldValue:=mBouCode, mVtmFieldName:="BohVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="BohCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="BohDate", mDateFieldValue:=Ctod(dtpBouDate.Text)) = True Then
            ErrorBox "Duplicate Voucher No. !!!"
            Cancel = True
            mskBouVchNo(Index).SetFocus
            ' ----------
            If FormAddEditMode = cFORM_ADDMODE Then
                mBouVchNo = GetNextVTypeNo(dbBdkDatabase, dbAcDatabase, dbComDatabase, mTableName:="BloodOutHdr", mFieldName:="BohVchNo", mVtmFieldName:="BohVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="BohCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="BohDate", mDateFieldValue:=Ctod(dtpBouDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
            Else
                mBouVchNo = mBouVchNo_old
            End If
            mskBouVchNo(Index).Text = ToMyNumFmt(mBouVchNo, mDecimals:=0)
        End If
    End If
    If Cancel = False Then
        mskBouVchNo(Index).Text = ToMyNumFmt(mBouVchNo, mDecimals:=0)
    End If
Else
    ErrorBox "Invalid Input !!!"
    mskBouVchNo(Index).SetFocus
    Cancel = True
End If

End Sub

Private Sub mskEttRegNo_Change()
If InterActiveChange(mskEttRegNo) = True Then
    mEttRegNoChanged = True
End If

End Sub

Private Sub mskEttRegNo_GotFocus()
FlashActiveControl mskEttRegNo, True
mEttRegNoChanged = False
End Sub

Private Sub mskEttRegNo_LostFocus()
FlashActiveControl mskEttRegNo, False
End Sub

Private Sub mskEttRegNo_Validate(Cancel As Boolean)
Dim tRecset As ADODB.Recordset, mEttRegNo As Long

mskEttRegNo.Text = ToMyNumFmt(mskEttRegNo.Text, mDecimals:=0, mUseAbs:=True)
mEttRegNo = Val(UnMyNumFmt(mskEttRegNo.Text))
If mEttRegNoChanged = True Then
    mBouEttCode = 0
    If mEttRegNo > 0 And FormAddEditMode = cFORM_ADDMODE Then
        Set tRecset = New ADODB.Recordset
        With tRecset
        .open "Select * from EntityMast where EttRegNo = " & CStr(mEttRegNo) & "", dbBdkDatabase, adOpenKeyset, adLockOptimistic
        If .EOF = False Then
            mBouEttCode = .fields("EttCode")
        Else
            ErrorBox "Reg.No. not Found !!!"
        End If
        End With
        CloseTable tRecset
    End If
    fcmbEttName.BoundText = CStr(mBouEttCode): txtEttName.Text = fcmbEttName.Text
    ShowEntityData mBouEttCode
End If
Set tRecset = Nothing

End Sub

Private Sub mskHpmRegNo_Change()
If InterActiveChange(mskHpmRegNo) = True Then
    mHpmRegNoChanged = True
End If

End Sub

Private Sub mskHpmRegNo_GotFocus()
FlashActiveControl mskHpmRegNo, True
mHpmRegNoChanged = False
End Sub

Private Sub mskHpmRegNo_LostFocus()
FlashActiveControl mskHpmRegNo, False
End Sub

Private Sub mskHpmRegNo_Validate(Cancel As Boolean)
Dim tRecset As ADODB.Recordset, mHpmRegNo As Long

mskHpmRegNo.Text = ToMyNumFmt(mskHpmRegNo.Text, mDecimals:=0, mUseAbs:=True)
mHpmRegNo = Val(UnMyNumFmt(mskHpmRegNo.Text))
If mHpmRegNoChanged = True Then
    mBouHpmCode = 0
    If mHpmRegNo > 0 And FormAddEditMode = cFORM_ADDMODE Then
        Set tRecset = New ADODB.Recordset
        With tRecset
        .open "Select * from HospMast where HpmRegNo = " & CStr(mHpmRegNo) & "", dbBdkDatabase, adOpenKeyset, adLockOptimistic
        If .EOF = False Then
            mBouHpmCode = .fields("HpmCode")
        Else
            ErrorBox "Reg.No. not Found !!!"
        End If
        End With
        CloseTable tRecset
    End If
    fcmbHpmName.BoundText = CStr(mBouHpmCode): txtHpmName.Text = fcmbHpmName.Text
    ShowHospData mBouHpmCode
End If
Set tRecset = Nothing

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

Private Sub optHospwise_GotFocus()
FlashActiveControl optHospwise, True
End Sub

Private Sub optHospwise_LostFocus()
FlashActiveControl optHospwise, False
End Sub

Private Sub optMonthwise_GotFocus()
FlashActiveControl optMonthwise, True
End Sub

Private Sub optMonthwise_LostFocus()
FlashActiveControl optMonthwise, False
End Sub

Private Sub optEntitywise_GotFocus()
FlashActiveControl optEntitywise, True
End Sub

Private Sub optEntitywise_LostFocus()
FlashActiveControl optEntitywise, False
End Sub

Private Sub txtBouHpmRefNo_GotFocus()
FlashActiveControl txtBouHpmRefNo, True
End Sub

Private Sub txtBouHpmRefNo_LostFocus()
FlashActiveControl txtBouHpmRefNo, False
End Sub

Private Sub txtEttAraName_GotFocus()
FlashActiveControl txtEttAraName, True
End Sub

Private Sub txtEttAraName_LostFocus()
FlashActiveControl txtEttAraName, False
End Sub

Private Sub txtBouNarr_GotFocus()
FlashActiveControl txtBouNarr, True
End Sub

Private Sub txtBouNarr_LostFocus()
FlashActiveControl txtBouNarr, False
End Sub

Private Sub txtBouNarr_Validate(Cancel As Boolean)
txtBouNarr.Text = ToMyWord(txtBouNarr.Text, mFilterStr:=False)
End Sub

Private Sub txtBouBldRefNo_Change()
If fcmbBldRefNo.CallFromText_Change = False Then
    fcmbBldRefNo.CallFromText_Change = True
    If InterActiveChange(txtBouBldRefNo) = True Then
        fcmbBldRefNo.UserText = Array(txtBouBldRefNo.Text, txtBouBldRefNo.SelStart)
        fcmbBldRefNo.Show
        txtBouBldRefNo.Text = fcmbBldRefNo.Text
        If fcmbBldRefNo.ListSelected = True Then
            SendKeys "{TAB}"
        End If
    End If
    fcmbBldRefNo.CallFromText_Change = False
End If

End Sub

Private Sub txtBouBldRefNo_GotFocus()
FlashActiveControl txtBouBldRefNo, True
End Sub

Private Sub txtBouBldRefNo_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtBouBldRefNo_Change
End If

End Sub

Private Sub txtBouBldRefNo_LostFocus()
FlashActiveControl txtBouBldRefNo, False
End Sub

Private Sub txtBouBldRefNo_Validate(Cancel As Boolean)
Dim tRecset As New ADODB.Recordset

If Val(fcmbBldRefNo.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    Rem txtBouBldRefNo.SetFocus
    Rem Cancel = True
Else
    If FormAddEditMode = cFORM_ADDMODE Or dtlAddMode = True Or Val(fcmbBdgName.BoundText) <> mBouBdgCode_old Or Val(fcmbBdcName.BoundText) <> mBouBdcCode_old Or Val(mskBouBldCode.Text) <> mBouBldCode_old Or Val(mskBouItmCode.Text) <> mBouItmCode_old Or Val(fcmbBldRefNo.BoundText) <> mBouItrCode_old Then
        With tRecset
        .open "Select * from BloodInDtl bin" _
            & " inner join BloodInHdr bih on bin.BinCode = bih.BihCode" _
            & " where bin.BinBdgCode = " & CStr(Val(fcmbBdgName.BoundText)) _
            & " and bin.BinBdcCode = " & CStr(Val(fcmbBdcName.BoundText)) _
            & " and bin.BinBldCode = " & CStr(Val(mskBouBldCode.Text)) _
            & " and bin.BinItmCode = " & CStr(Val(mskBouItmCode.Text)) _
            & " and bin.BinItrCode = " & CStr(Val(fcmbBldRefNo.BoundText)) _
            , dbBdkDatabase, adOpenKeyset, adLockOptimistic
        Rem & " where bin.BinEttCode = " & CStr(Val(fcmbEttName.BoundText))
        mskBouBinCode.Text = .fields("BinCode")
        mskBouBinICode.Text = .fields("BinICode")
        '''fcmbBdpName.BoundText = CStr(.fields("BinBdpCode")): txtBdpName.Text = fcmbBdpName.Text
        mskBouPckQty.Text = ToMyNumFmt(.fields("BinPckQty"), mDecimals:=-1)
        mskBouBldQty.Text = ToMyNumFmt(.fields("BinBldQty"), mDecimals:=-1)
        End With
        CloseTable tRecset
        
        Rem Call CalcSalChg
    End If
    If ChkBldRefNoLink(mCallFromDtlAddEdit:=True) = False Then
        txtBouBldRefNo.SetFocus
        Cancel = True
    End If
End If
Call ValidDtl

End Sub

Private Sub txtBouTrnRefNo_GotFocus()
FlashActiveControl txtBouTrnRefNo, True
End Sub

Private Sub txtBouTrnRefNo_LostFocus()
FlashActiveControl txtBouTrnRefNo, False
End Sub

Private Sub txtBouTrnRefNo_Validate(Cancel As Boolean)
Dim tRecset As ADODB.Recordset

txtBouTrnRefNo.Text = ToMyString(Trim(txtBouTrnRefNo.Text))
If txtBouTrnRefNo.Text = "" Then
    ErrorBox "Invalid Input !!!"
    txtBouTrnRefNo.SetFocus
    Cancel = True
Else
    If mFormSysVchType = cBDK_VTYPE_BLOODISSUED Then
        Set tRecset = dbComDatabase.Execute("Select * from BloodInHdr bih inner join VTypMast vtm on bih.BihVtmCode = vtm.VtmCode where BihTrnRefNo = '" & txtBouTrnRefNo.Text & "' and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODDONATE) & " order by BihDate desc")
        With tRecset
        If .EOF = True Then
            ErrorBox "Bag No. does not Exist in Blood Donate Entry !!!"
            txtBouTrnRefNo.SetFocus
            Cancel = True
        End If
        End With
        CloseTable tRecset
        
        Rem If Cancel = False Then
        Rem     Set tRecset = dbComDatabase.Execute("Select * from BloodInHdr bih inner join VTypMast vtm on bih.BihVtmCode = vtm.VtmCode where BihTrnRefNo = '" & txtBouTrnRefNo.Text & "' and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODFILTER))
        Rem     With tRecset
        Rem     If .EOF = True Then
        Rem         ErrorBox "Bag No. does not Exist in Blood Filter/Component Entry !!!"
        Rem         txtBouTrnRefNo.SetFocus
        Rem         Cancel = True
        Rem     End If
        Rem     End With
        Rem     CloseTable tRecset
        Rem End If
        
        Rem If Cancel = False Then
        Rem     Set tRecset = dbComDatabase.Execute("Select * from BloodOutHdr boh inner join VTypMast vtm on boh.BohVtmCode = vtm.VtmCode where BohTrnRefNo = '" & txtBouTrnRefNo.Text & "' and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODISSUED) & " and BohCode <> " & CStr(mBouCode))
        Rem     With tRecset
        Rem     If .EOF = False Then
        Rem         ErrorBox "Bag No. Already Used in " & .fields("VtmName") & " No. " & CStr(.fields("BohVchNo")) & " Dated " & Dtoc(.fields("BohDate"))
        Rem         txtBouTrnRefNo.SetFocus
        Rem         Cancel = True
        Rem     End If
        Rem     End With
        Rem     CloseTable tRecset
        Rem End If
        
    ElseIf mFormSysVchType = cBDK_VTYPE_BLOODCONS Then
        Set tRecset = dbComDatabase.Execute("Select * from BloodInHdr bih inner join VTypMast vtm on bih.BihVtmCode = vtm.VtmCode where BihTrnRefNo = '" & txtBouTrnRefNo.Text & "' and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODDONATE) & " order by BihDate desc")
        With tRecset
        If .EOF = True Then
            ErrorBox "Bag No. does not Exist in Blood Donate Entry !!!"
            txtBouTrnRefNo.SetFocus
            Cancel = True
        End If
        End With
        CloseTable tRecset
        
        Rem If Cancel = False Then
        Rem     Set tRecset = dbComDatabase.Execute("Select * from BloodOutHdr boh inner join VTypMast vtm on boh.BohVtmCode = vtm.VtmCode where BohTrnRefNo = '" & txtBouTrnRefNo.Text & "' and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODCONS) & " and BohCode <> " & CStr(mBouCode))
        Rem     With tRecset
        Rem     If .EOF = False Then
        Rem         ErrorBox "Bag No. Already Used in " & .fields("VtmName") & " No. " & CStr(.fields("BohVchNo")) & " Dated " & Dtoc(.fields("BohDate"))
        Rem         txtBouTrnRefNo.SetFocus
        Rem         Cancel = True
        Rem     End If
        Rem     End With
        Rem     CloseTable tRecset
        Rem End If
        
        Rem If Cancel = False Then
        Rem     Set tRecset = dbComDatabase.Execute("Select * from BloodOutHdr boh inner join VTypMast vtm on boh.BohVtmCode = vtm.VtmCode where BohTrnRefNo = '" & txtBouTrnRefNo.Text & "' and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODISSUED))
        Rem     With tRecset
        Rem     If .EOF = False Then
        Rem         If tRecset.fields("BohEttCode") <> Val(fcmbEttName.BoundText) Then
        Rem             ErrorBox "Mismatch Patient Name with Entry " & tRecset.fields("VtmName") & " No." & CStr(tRecset.fields("BohVchNo")) & " Dated " & Dtoc(tRecset.fields("BohDate")) & " !!!"
        Rem             txtBouTrnRefNo.SetFocus
        Rem             Cancel = True
        Rem
        Rem         ElseIf tRecset.fields("BohHpmCode") <> Val(fcmbHpmName.BoundText) Then
        Rem             ErrorBox "Mismatch Hospital Name with Entry " & tRecset.fields("VtmName") & " No." & CStr(tRecset.fields("BohVchNo")) & " Dated " & Dtoc(tRecset.fields("BohDate")) & " !!!"
        Rem             txtBouTrnRefNo.SetFocus
        Rem             Cancel = True
        Rem
        Rem         ElseIf tRecset.fields("BohHpmRefNo") <> txtBouHpmRefNo.Text Then
        Rem             ErrorBox "Mismatch Hospital Ref.No. with Entry " & tRecset.fields("VtmName") & " No." & CStr(tRecset.fields("BohVchNo")) & " Dated " & Dtoc(tRecset.fields("BohDate")) & " !!!"
        Rem             txtBouTrnRefNo.SetFocus
        Rem             Cancel = True
        Rem
        Rem         ElseIf tRecset.fields("BohHpmRefDt") <> Ctod(dtpBouHpmRefDt.Text) Then
        Rem             ErrorBox "Mismatch Hospital Ref.Date with Entry " & tRecset.fields("VtmName") & " No." & CStr(tRecset.fields("BohVchNo")) & " Dated " & Dtoc(tRecset.fields("BohDate")) & " !!!"
        Rem             txtBouTrnRefNo.SetFocus
        Rem             Cancel = True
        Rem
        Rem         End If
        Rem     End If
        Rem     End With
        Rem     CloseTable tRecset
        Rem End If
    End If
End If
Set tRecset = Nothing

End Sub

Private Sub txtBohRemark_GotFocus()
FlashActiveControl txtBohRemark, True
End Sub

Private Sub txtBohRemark_LostFocus()
FlashActiveControl txtBohRemark, False
End Sub

Private Sub txtBohRemark_Validate(Cancel As Boolean)
txtBohRemark.Text = ToMyWord(txtBohRemark.Text, mFilterStr:=False)
End Sub

Private Sub txtBouTime_str_GotFocus()
FlashActiveControl txtBouTime_str, True
End Sub

Private Sub txtBouTime_str_LostFocus()
FlashActiveControl txtBouTime_str, False
End Sub

Private Sub txtBouTime_str_Validate(Cancel As Boolean)
txtBouTime_str.Text = MinToTime(TimeToMin(txtBouTime_str.Text))
If TimeToMin(txtBouTime_str.Text) > cDAYMINUTES Then
    ErrorBox "Invalid Input !!!"
    txtBouTime_str.SetFocus
    Cancel = True
End If

End Sub

Private Sub txtHpmName_Change()
If fcmbHpmName.CallFromText_Change = False Then
    fcmbHpmName.CallFromText_Change = True
    If InterActiveChange(txtHpmName) = True Then
        fcmbHpmName.UserText = Array(txtHpmName.Text, txtHpmName.SelStart)
        fcmbHpmName.Show
        If FormAddEditMode = cFORM_ADDMODE Then
            txtHpmName.Text = fcmbHpmName.Text
        Else
            AlertBox "Prohibited in Edit Mode !!!"
            fcmbHpmName.BoundText = CStr(mBouHpmCode_old)
            txtHpmName.Text = fcmbHpmName.Text
        End If
        If fcmbHpmName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbHpmName.CallFromText_Change = False
End If

End Sub

Private Sub txtHpmName_GotFocus()
FlashActiveControl txtHpmName, True
End Sub

Private Sub txtHpmName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtHpmName_Change
End If

End Sub

Private Sub txtHpmName_LostFocus()
FlashActiveControl txtHpmName, False
End Sub

Private Sub txtHpmName_Validate(Cancel As Boolean)
If Val(fcmbHpmName.BoundText) < 1 Then
    ErrorBox "Invalid Hospital Selection !!!"
    Cancel = True
    txtHpmName.SetFocus
'ElseIf ChkAnyMisLinkedIsuExist() = True Then
'    ErrorBox "Invalid Linking Selection !!!"
'    Cancel = True
'    txtHpmName.SetFocus
'
'    fcmbHpmName.BoundText = CStr(mBouHpmCode_old)
'    txtHpmName.Text = fcmbHpmName.Text
ElseIf FormAddEditMode = cFORM_EDITMODE And Val(fcmbHpmName.BoundText) <> mBouHpmCode_old Then
    ErrorBox "Prohibited in Edit Mode !!!"
    txtHpmName.SetFocus
    Cancel = True
Else
    ShowHospData Val(fcmbHpmName.BoundText)
End If

End Sub

Private Sub txtLnkBouTrnRefNo_GotFocus()
FlashActiveControl txtLnkBouTrnRefNo, True
End Sub

Private Sub txtLnkBouTrnRefNo_LostFocus()
FlashActiveControl txtLnkBouTrnRefNo, False
End Sub

Private Sub txtLnkBouTrnRefNo_Validate(Cancel As Boolean)
Dim tRecset As ADODB.Recordset

If FormAddEditMode = cFORM_ADDMODE Then
    txtLnkBouTrnRefNo.Text = ToMyString(Trim(txtLnkBouTrnRefNo.Text))
    If txtLnkBouTrnRefNo.Text <> "" Then
        Set tRecset = dbBdkDatabase.Execute("Select * from BloodOutHdr where BohTrnRefNo = '" & txtLnkBouTrnRefNo.Text & "' order by BohDate desc")
        If tRecset.EOF = False Then
            fcmbEttName.BoundText = CStr(tRecset.fields("BohEttCode"))
            txtEttName.Text = fcmbEttName.Text
            ShowEntityData Val(fcmbEttName.BoundText)
            
            fcmbHpmName.BoundText = CStr(tRecset.fields("BohHpmCode"))
            txtHpmName.Text = fcmbHpmName.Text
            ShowHospData Val(fcmbHpmName.BoundText)
            
            txtBouHpmRefNo.Text = tRecset.fields("BohHpmRefNo")
            dtpBouHpmRefDt.Text = Dtoc(tRecset.fields("BohHpmRefDt"))
        End If
        CloseTable tRecset
    End If
End If
Set tRecset = Nothing

End Sub

Private Sub txtVtmName_Change(Index As Integer)
If fcmbVtmName.CallFromText_Change = False Then
    fcmbVtmName.CallFromText_Change = True
    If InterActiveChange(txtVtmName(Index)) = True Then
        fcmbVtmName.UserText = Array(txtVtmName(Index).Text, txtVtmName(Index).SelStart)
        fcmbVtmName.Show
        txtVtmName(Index).Text = fcmbVtmName.Text
        If fcmbVtmName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbVtmName.CallFromText_Change = False
End If

End Sub

Private Sub txtVtmName_GotFocus(Index As Integer)
FlashActiveControl txtVtmName(Index), True

End Sub

Private Sub txtVtmName_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    txtVtmName_Change Index
ElseIf MyAddNewKey(Shift, KeyCode) = True Then

ElseIf Shift = 0 And KeyCode = vbKeyF6 Then
    Rem Call ShowOldOpgListByOpgNo show here all sale details
End If

End Sub

Private Sub txtVtmName_LostFocus(Index As Integer)
FlashActiveControl txtVtmName(Index), False
End Sub

Private Sub txtVtmName_Validate(Index As Integer, Cancel As Boolean)
Dim mBouVchNo As Long

If Val(fcmbVtmName.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    txtVtmName(Index).SetFocus
    Cancel = True
Else
    If Index = 0 Then
        If Val(fcmbVtmName.BoundText) <> mBouVtmCode_old Or Ctod(dtpBouDate.Text) <> mBouDate_old Or FormAddEditMode = cFORM_ADDMODE Then
            mBouVchNo = GetNextVTypeNo(dbBdkDatabase, dbAcDatabase, dbComDatabase, mTableName:="BloodOutHdr", mFieldName:="BohVchNo", mVtmFieldName:="BohVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="BohCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="BohDate", mDateFieldValue:=Ctod(dtpBouDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
            mskBouVchNo(Index).Text = ToMyNumFmt(mBouVchNo, mDecimals:=0)
        End If
    End If
End If

End Sub

Private Sub txtEttAddr_GotFocus()
FlashActiveControl txtEttAddr, True
End Sub

Private Sub txtEttAddr_LostFocus()
FlashActiveControl txtEttAddr, False
End Sub

Private Sub txtEttName_Change()
If fcmbEttName.CallFromText_Change = False Then
    fcmbEttName.CallFromText_Change = True
    If InterActiveChange(txtEttName) = True Then
        fcmbEttName.UserText = Array(txtEttName.Text, txtEttName.SelStart)
        fcmbEttName.Show
        If FormAddEditMode = cFORM_ADDMODE Then
            txtEttName.Text = fcmbEttName.Text
        Else
            AlertBox "Prohibited in Edit Mode !!!"
            fcmbEttName.BoundText = CStr(mBouEttCode_old)
            txtEttName.Text = fcmbEttName.Text
        End If
        If fcmbEttName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbEttName.CallFromText_Change = False
End If

End Sub

Private Sub txtEttName_GotFocus()
FlashActiveControl txtEttName, True

End Sub

Private Sub txtEttName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtEttName_Change
End If

End Sub

Private Sub txtEttName_LostFocus()
FlashActiveControl txtEttName, False
End Sub

Private Sub txtEttName_Validate(Cancel As Boolean)
If Val(fcmbEttName.BoundText) < 1 Then
    ErrorBox "Invalid Patient Selection !!!"
    Rem Cancel = True
    Rem txtEttName.SetFocus
'''ElseIf ChkAnyMisLinkedRcExist() = True Then
'''    ErrorBox "Invalid Patient Selection !!!"
'''    Cancel = True
'''    txtEttName.SetFocus
'''
'''    fcmbEttName.BoundText = CStr(mBouEttCode_old)
'''    txtEttName.Text = fcmbEttName.Text
ElseIf FormAddEditMode = cFORM_EDITMODE And Val(fcmbEttName.BoundText) <> mBouEttCode_old Then
    ErrorBox "Prohibited in Edit Mode !!!"
    txtEttName.SetFocus
    Cancel = True
Else
    ShowEntityData Val(fcmbEttName.BoundText)
End If

End Sub

Private Sub ShowEntityData(ByVal mEttCode As Long)
Dim tRecset As New ADODB.Recordset

mBouEttCode = 0
txtEttAddr.Text = ""
txtEttAraName.Text = ""
txtEttStnName.Text = ""
txtEttTelNo.Text = ""
txtEttSMSNo.Text = ""

With tRecset
.open "Select * from (EntityMast ett" _
    & " inner join AreaMast ara on ett.EttAraCode = ara.AraCode)" _
    & " inner join StsnMast stn on ett.EttStnCode = stn.StnCode" _
    & " where ett.EttCode = " & CStr(mEttCode) & "" _
    , dbComDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    mBouEttCode = mEttCode
    mskEttRegNo.Text = ToMyNumFmt(.fields("EttRegNo"), mDecimals:=0)
    txtEttAddr.Text = .fields("EttAddr")
    txtEttAraName.Text = .fields("AraName")
    txtEttStnName.Text = .fields("StnName")
    txtEttTelNo.Text = .fields("EttTelNo")
    txtEttSMSNo.Text = .fields("EttSmsNo")
End If
End With
CloseTable tRecset
Rem Call ShowOldBouCodeDesc
Call ShowLinkTranOutDtl

End Sub

Private Sub ShowHospData(ByVal mHpmCode As Long)
Dim tRecset As New ADODB.Recordset

mBouHpmCode = 0
txtHpmAddr.Text = ""
txtHpmAraName.Text = ""
txtHpmStnName.Text = ""
txtHpmTelNo.Text = ""
txtHpmSmsNo.Text = ""

With tRecset
.open "Select * from (HospMast efm" _
    & " inner join AreaMast ara on efm.HpmAraCode = ara.AraCode)" _
    & " inner join StsnMast stn on efm.HpmStnCode = stn.StnCode" _
    & " where efm.HpmCode = " & CStr(mHpmCode) & "" _
    , dbComDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    mBouHpmCode = mHpmCode
    mskHpmRegNo.Text = ToMyNumFmt(.fields("HpmRegNo"), mDecimals:=0)
    txtHpmAddr.Text = .fields("HpmAddr")
    txtHpmAraName.Text = .fields("AraName")
    txtHpmStnName.Text = .fields("StnName")
    txtHpmTelNo.Text = .fields("HpmTelNo")
    txtHpmSmsNo.Text = .fields("HpmSmsNo")
End If
End With
CloseTable tRecset

End Sub

Private Sub Data_AddEvent()

If CanUserAddOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If clsBOU.BeginTran(0) = False Then
    Exit Sub
ElseIf clsSTK.BeginStock(0) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_ADDMODE

clsBOU.ClearHdr: clsBOU.ClearDtl
clsSTK.ClearHdr

mBouCode = clsBOU.ActiveTrnCode
mBouStkCode = clsSTK.ActiveStkCode

ShowBouData mBouCode
ShowStkData mBouStkCode

Rem restoring user editing features
Call ShowBouDefData

Rem old values
Call StoreBouOldData
Call StoreStkOldData

Call ShowEntryMode(True)

txtLnkBouTrnRefNo.Locked = False
If mFormSysVchType = cBDK_VTYPE_BLOODCONS Then
    txtLnkBouTrnRefNo.SetFocus
Else
    mskEttRegNo.SetFocus
End If

End Sub

Private Sub Data_EditEvent()

If CanUserEditOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If clsBOU.BeginTran(datRecset.fields("BohCode")) = False Then
    Exit Sub
ElseIf clsSTK.BeginStock(datRecset.fields("BohStkCode")) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_EDITMODE

With datRecset
mBouCode = .fields("BohCode")
mBouStkCode = .fields("BohStkCode")

End With

ShowBouData mBouCode
ShowStkData mBouStkCode

Rem old values
Call StoreBouOldData
Call StoreStkOldData

Call ShowEntryMode(True)
txtLnkBouTrnRefNo.Locked = True
mskEttRegNo.SetFocus

End Sub

Private Sub ShowPartyBal()
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

Private Sub ShowBouData(ByVal mBouCode As Long)
With clsBOU
.GetHdrData mBouCode

mskFormBoundField.Text = mBouCode
txtLnkBouTrnRefNo.Text = ""
mskEttRegNo.Text = 0: mskHpmRegNo.Text = 0
fcmbEttName.BoundText = CStr(.mBohEttCode_lng): txtEttName.Text = fcmbEttName.Text
fcmbHpmName.BoundText = CStr(.mBohHpmCode_lng): txtHpmName.Text = fcmbHpmName.Text
fcmbVtmName.BoundText = CStr(.mTrnVtmCode_lng): txtVtmName(0).Text = fcmbVtmName.Text
txtBouPrefix.Text = .mTrnPrefix_str
mskBouVchNo(0).Text = ToMyNumFmt(.mTrnVchNo_lng, mDecimals:=0)
dtpBouDate.Text = Dtoc(.mTrnDate_dt)
txtBouTime_str.Text = MinToTime(.mBohTime_lng)
txtBouTrnRefNo.Text = .mBohTrnRefNo_str
dtpBouTrnRefDt.Text = Dtoc(.mBohTrnRefDt_dt)
txtBouHpmRefNo.Text = .mBohHpmRefNo_str
dtpBouHpmRefDt.Text = Dtoc(.mBohHpmRefDt_dt)
txtBohRemark.Text = .mBohRemark_str

ShowEntityData .mBohEttCode_lng
ShowHospData .mBohHpmCode_lng

mskEttRegNo.Locked = (mBouCode > 0)
txtEttName.Locked = (mBouCode > 0)
mskHpmRegNo.Locked = (mBouCode > 0)
txtHpmName.Locked = (mBouCode > 0)

Rem Call ShowOldBouCodeDesc
End With

ShowDtlData mBouCode
Rem Call ShowLinkTranDtl

End Sub

Private Sub ShowStkData(ByVal mBouStkCode As Long)
mskBouStkCode.Text = mBouStkCode

End Sub

Private Sub ShowBouDefData()
Dim tRecset As New ADODB.Recordset, t1Recset As New ADODB.Recordset, mBouVchNo As Long

With tRecset
.open "Select top 1 * from BloodOutHdr where BohVtmCode IN (" & mFormVchTypeList & ") and BohCmpCode = " & CStr(sFinYrCmpCode) & " order by BohCode desc", dbBdkDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    dtpBouDate.Text = Dtoc(DefaultEntryDate)          '''  Dtoc(.fields("BohDate"))
    fcmbVtmName.BoundText = CStr(.fields("BohVtmCode"))
    fcmbHpmName.BoundText = CStr(.fields("BohHpmCode")): txtHpmName.Text = fcmbHpmName.Text
Else
    dtpBouDate.Text = Dtoc(DefaultEntryDate)
    With t1Recset
    .open "Select top 1 * from VTypMast where VtmSysCode = " & CStr(mFormSysVchType) & "", dbAcDatabase, adOpenKeyset, adLockOptimistic
    If .EOF = False Then
        fcmbVtmName.BoundText = .fields("VtmCode")
    Else
        fcmbVtmName.BoundText = ""
    End If
    End With
    CloseTable t1Recset
End If
End With
CloseTable tRecset

txtVtmName(0).Text = fcmbVtmName.Text
txtBouTime_str.Text = MinToTime(TimeToMin(DateTime.Time$))

mBouVchNo = GetNextVTypeNo(dbBdkDatabase, dbAcDatabase, dbComDatabase, mTableName:="BloodOutHdr", mFieldName:="BohVchNo", mVtmFieldName:="BohVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="BohCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="BohDate", mDateFieldValue:=Ctod(dtpBouDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
mskBouVchNo(0).Text = ToMyNumFmt(mBouVchNo, mDecimals:=0)
dtpBouTrnRefDt.Text = dtpBouDate.Text
dtpBouHpmRefDt.Text = dtpBouDate.Text

End Sub

Private Sub StoreBouOldData()
mBouCode_old = mBouCode
mBouEttCode_old = Val(fcmbEttName.BoundText)
mBouHpmCode_old = Val(fcmbHpmName.BoundText)
mBouDate_old = Ctod(dtpBouDate.Text)
mBouTime_old = TimeToMin(txtBouTime_str.Text)
mBouVtmCode_old = Val(fcmbVtmName.BoundText)
mBouVchNo_old = Val(UnMyNumFmt(mskBouVchNo(0).Text))

End Sub

Private Sub StoreStkOldData()
mBouStkCode_old = mBouStkCode

End Sub

Private Sub ShowDtlData(ByVal mBouCode As Long)
Dim srow As Integer, tRecset As New ADODB.Recordset, mColCnt As Integer

srow = 1
Mfgrd2.Rows = 2

With tRecset
.open "Select * from (((BloodOutDtl" _
    & " inner join BloodMast on BloodOutDtl.BouBldCode = BloodMast.BldCode)" _
    & " inner join BloodGrpMst on BloodOutDtl.BouBdgCode = BloodGrpMst.BdgCode)" _
    & " inner join BloodCompoMst on BloodOutDtl.BouBdcCode = BloodCompoMst.BdcCode)" _
    & " left join (BloodInDtl left join BloodInHdr on BloodInDtl.BinCode = BloodInHdr.BihCode)" _
    & " on BloodOutDtl.BouBinCode = BloodInDtl.BinCode and BloodOutDtl.BouBinICode = BloodInDtl.BinICode" _
    & " and BloodOutDtl.BouBdgCode = BloodInDtl.BinBdgCode and BloodOutDtl.BouBdcCode = BloodInDtl.BinBdcCode" _
    & " and BloodOutDtl.BouBldCode = BloodInDtl.BinBldCode and BloodOutDtl.BouItmCode = BloodInDtl.BinItmCode" _
    & " and BloodOutDtl.BouItrCode = BloodInDtl.BinItrCode" _
    & " where BouCode = " & CStr(mBouCode) _
    & " order by BouSno", dbBdkDatabase, adOpenKeyset, adLockOptimistic
Rem & " inner join BloodPckMst on BloodOutDtl.BouBdpCode = BloodPckMst.BdpCode)"
If .RecordCount > 0 Then
    Do While .EOF = False
        If InList(.fields("BouRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
'            clsBLD.GetData .fields("BouBldCode")
'            clsBDG.GetData .fields("BouBdgCode")
'            clsBDC.GetData .fields("BouBdcCode")
'            clsBDP.GetData .fields("BouBdpCode")
            
            Mfgrd2.TextMatrix(srow, X2BOUICODE_COL) = .fields("BouICode")
            Mfgrd2.TextMatrix(srow, X2BOUSTKICODE_COL) = .fields("BouStkICode")
            Mfgrd2.TextMatrix(srow, X2BOUSNO_COL) = ToMyNumFmt(.fields("BouSno"), mDecimals:=0)
            Mfgrd2.TextMatrix(srow, X2BDGNAME_COL) = .fields("BdgName")       ''clsBLD.mName_str
            Mfgrd2.TextMatrix(srow, X2BDCNAME_COL) = .fields("BdcName")
            Mfgrd2.TextMatrix(srow, X2BOUNARR_COL) = .fields("BouNarr")
            Mfgrd2.TextMatrix(srow, X2BOUBLDREFNO_COL) = .fields("BouBldRefNo")
            '''Mfgrd2.TextMatrix(srow, X2BDPNAME_COL) = .fields("BdpName")
            Mfgrd2.TextMatrix(srow, X2BOUPCKQTY_COL) = ToMyNumFmt(.fields("BouPckQty"), mDecimals:=-1)
            Mfgrd2.TextMatrix(srow, X2BOUBLDQTY_COL) = ToMyNumFmt(.fields("BouBldQty"), mDecimals:=-1)
            Mfgrd2.TextMatrix(srow, X2BOUBDGCODE_COL) = .fields("BouBdgCode")
            Mfgrd2.TextMatrix(srow, X2BOUBDCCODE_COL) = .fields("BouBdcCode")
            '''Mfgrd2.TextMatrix(srow, X2BOUBDPCODE_COL) = .fields("BouBdpCode")
            Mfgrd2.TextMatrix(srow, X2BOUITMCODE_COL) = .fields("BouItmCode")
            Mfgrd2.TextMatrix(srow, X2BOUBLDCODE_COL) = .fields("BouBldCode")
            Mfgrd2.TextMatrix(srow, X2BOUITRCODE_COL) = .fields("BouItrCode")
            Mfgrd2.TextMatrix(srow, X2BOUBINCODE_COL) = .fields("BouBinCode")
            Mfgrd2.TextMatrix(srow, X2BOUBINICODE_COL) = .fields("BouBinICode")
            Mfgrd2.TextMatrix(srow, X2BOURECSTATE_COL) = .fields("BouRecState")
            
            Mfgrd2.Rows = Mfgrd2.Rows + 1
            srow = srow + 1
        Else
            If InList(.fields("BouRecState"), Array(cREC_CANCELED, cREC_DELETED)) = False Then
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

With clsBOU
If FormAddEditMode = cFORM_ADDMODE Then
    .ClearHdr
Else
    .GetHdrData mBouCode
End If
.mTrnDate_dt = Ctod(dtpBouDate.Text)
.mTrnVtmCode_lng = Val(fcmbVtmName.BoundText)
.mTrnPrefix_str = txtBouPrefix.Text
.mTrnVchNo_lng = Val(UnMyNumFmt(mskBouVchNo(0).Text))
.mTrnPostfix_str = ""
.mTrnCmpCode_int = sFinYrCmpCode

.mBohStkCode_lng = mBouStkCode
.mBohTime_lng = TimeToMin(txtBouTime_str.Text)
.mBohEttCode_lng = Val(fcmbEttName.BoundText)
.mBohHpmCode_lng = Val(fcmbHpmName.BoundText)
.mBohTrnRefNo_str = txtBouTrnRefNo.Text
.mBohTrnRefDt_dt = Ctod(dtpBouTrnRefDt.Text)
.mBohHpmRefNo_str = txtBouHpmRefNo.Text
.mBohHpmRefDt_dt = Ctod(dtpBouHpmRefDt.Text)
.mBohPckQty_dbl = Val(UnMyNumFmt(lblBouPckQtyTot.Caption))
.mBohBldQty_dbl = Val(UnMyNumFmt(lblBouBldQtyTot.Caption))
.mBohRemark_str = txtBohRemark.Text

If FormAddEditMode = cFORM_ADDMODE Then
    If .AddNewHdr() = True Then
        mskFormBoundField.Text = .mTrnCode_lng
        mBouCode = .mTrnCode_lng
    End If
Else
    .UpdateHdr mBouCode
End If
If .mTrnCode_lng > 0 Then   ' updated successfully
    With clsSTK
    If FormAddEditMode = cFORM_ADDMODE Then
        .ClearHdr
    Else
        .GetHdrData mBouStkCode
    End If
    .mShrVtmCode_lng = Val(fcmbVtmName.BoundText)
    .mShrPrefix_str = txtBouPrefix.Text
    .mShrVchNo_lng = Val(UnMyNumFmt(mskBouVchNo(0).Text))
    .mShrPostfix_str = ""
    .mShrDate_dt = Ctod(dtpBouDate.Text)
    .mShrQty_dbl = Val(UnMyNumFmt(lblBouBldQtyTot.Caption))
    .mShrValue_dbl = 0
    .mShrNarr_str = "Automated Blood Issue"
    .mShrAutoGen_bln = True
    .mShrCmpCode_int = sFinYrCmpCode
    If FormAddEditMode = cFORM_ADDMODE Then
        If .AddNewHdr() = True Then
            mskBouStkCode.Text = .mShrCode_lng
            mBouStkCode = .mShrCode_lng
        End If
    Else
        .UpdateHdr mBouStkCode
    End If
    If .mShrCode_lng > 0 Then
        If FormAddEditMode = cFORM_ADDMODE Then
            clsBOU.GetHdrData mBouCode
            clsBOU.mBohStkCode_lng = mBouStkCode
            
            dbBdkDatabase.BeginTrans
            dbBdkDatabase.Execute "Update BloodOutHdr set BohStkCode = " & CStr(mBouStkCode) & " where BohCode =" & CStr(mBouCode)
            dbBdkDatabase.Execute "Update BloodOutDtl set BouStkCode = " & CStr(mBouStkCode) & " where BouCode =" & CStr(mBouCode)
            dbBdkDatabase.CommitTrans
        End If
        clsBOU.UpdateTran mBouCode
        clsBOU.EndTran mBouCode
        
        .CommitStock mBouStkCode
        .EndStock mBouStkCode
        
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

If clsBOU.mTrnCode_lng > 0 Then   ' updated successfully
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

mBouCode = datRecset.fields("BohCode")
mBouStkCode = datRecset.fields("BohStkCode")
mRecAbsPos = datRecset.AbsolutePosition

If clsBOU.CanDeleteTran(mBouCode) = True Then
    txtVoid.SetFocus
    If clsBOU.BeginTran(mBouCode) = True And clsSTK.BeginStock(mBouStkCode) = True Then
        clsBOU.DeleteTran mBouCode
        clsBOU.UpdateTran mBouCode
        clsBOU.EndTran mBouCode
        
        clsSTK.DeleteStock mBouStkCode
        clsSTK.CommitStock mBouStkCode
        clsSTK.EndStock mBouStkCode
        
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
clsBOU.CancelTran mBouCode
clsBOU.EndTran mBouCode

clsSTK.CancelStock mBouStkCode
clsSTK.EndStock mBouStkCode

mEntryAborted = True

End Sub

Private Sub txtEttSMSNo_GotFocus()
FlashActiveControl txtEttSMSNo, True
End Sub

Private Sub txtEttSMSNo_LostFocus()
FlashActiveControl txtEttSMSNo, False
End Sub

Private Sub txtEttTelNo_GotFocus()
FlashActiveControl txtEttTelNo, True
End Sub

Private Sub txtEttTelNo_LostFocus()
FlashActiveControl txtEttTelNo, False
End Sub

Private Sub SmryList()
Dim gcolcount As Integer, acount As Integer, mLow As Integer, mHigh As Integer, mPos As Integer, srow As Long, mColCount As Integer
Dim aAcntBal As Variant, mBal As Double
Dim tRecset As ADODB.Recordset

If datRecset.State = 1 Then
    CloseTable datRecset
End If
RefreshDatabase dbBdkDatabase
RefreshDatabase dbBdkDatabase
RefreshDatabase dbAcDatabase
RefreshDatabase dbGrpDatabase
RefreshDatabase dbComDatabase
clsListStru.Clear

If optMonthwise.Value = True Or optDatewise.Value = True Or optEntitywise.Value = True Or optHospwise.Value = True Then
    If optMonthwise.Value = True Then
        clsListStru.AddFields mExpr:="BouYrMonth", mAttrib:=cFAT_SYSTEM
        clsListStru.AddFields mExpr:="BouMnYear", mTitle:="Month", mShowItem:=True, mAlign:=flexAlignLeftCenter, mWidth:=2000
        clsListStru.AddFields mExpr:="BouCount", mTitle:="Count", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="BouPckQty_sum", mTitle:="Pck/Bag", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="BouBldQty_sum", mTitle:="Qty", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        
        datRecset.open "Select format(BohDate,'yyyy/MM') as BouYrMonth" _
         & ",Count(BohCode) as BouCount" _
         & ",Sum(BohPckQty) as BouPckQty_sum" _
         & ",Sum(BohBldQty) as BouBldQty_sum" _
         & " from BloodOutHdr" _
         & " where BohDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and BohCode > 0 and BohVtmCode IN (" & mFormVchTypeList & ")" _
         & IIf(mQryEttCode > 0, " and BohEttCode = " & CStr(mQryEttCode), "") _
         & IIf(mQryHpmCode > 0, " and BohHpmCode = " & CStr(mQryHpmCode), "") _
         & " group by format(BohDate,'yyyy/MM')" _
         & " order by format(BohDate,'yyyy/MM')" _
         , dbComDatabase, adOpenKeyset, adLockReadOnly

    ElseIf optDatewise.Value = True Then
        clsListStru.AddFields mExpr:="BouDateYMD", mAttrib:=cFAT_SYSTEM
        clsListStru.AddFields mExpr:="BouDate", mTitle:="Date", mShowItem:=True, mAlign:=flexAlignLeftCenter, mWidth:=2000
        clsListStru.AddFields mExpr:="BouCount", mTitle:="Count", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="BouPckQty_sum", mTitle:="Pck/Bag", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="BouBldQty_sum", mTitle:="Qty", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        
        datRecset.open "Select BohDate" _
         & ",Count(BohCode) as BouCount" _
         & ",Sum(BohPckQty) as BouPckQty_sum" _
         & ",Sum(BohBldQty) as BouBldQty_sum" _
         & " from BloodOutHdr" _
         & " where BohDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and BohCode > 0 and BohVtmCode IN (" & mFormVchTypeList & ")" _
         & IIf(mQryEttCode > 0, " and BohEttCode = " & CStr(mQryEttCode), "") _
         & IIf(mQryHpmCode > 0, " and BohHpmCode = " & CStr(mQryHpmCode), "") _
         & " group by BohDate" _
         & " order by BohDate" _
         , dbComDatabase, adOpenKeyset, adLockReadOnly
        
    ElseIf optEntitywise.Value = True Then
        clsListStru.AddFields mExpr:="EttName", mTitle:="Patient Name", mShowItem:=True, mAlign:=flexAlignLeftCenter, mWidth:=3000
        clsListStru.AddFields mExpr:="BouCount", mTitle:="Count", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="BouPckQty_sum", mTitle:="Pck/Bag", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="BouBldQty_sum", mTitle:="Qty", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        
        datRecset.open "Select ett.EttName,BloodOutHdr.BohEttCode" _
         & ",Count(BohCode) as BouCount" _
         & ",Sum(BohPckQty) as BouPckQty_sum" _
         & ",Sum(BohBldQty) as BouBldQty_sum" _
         & " from BloodOutHdr inner join EntityMast ett on BloodOutHdr.BohEttCode = ett.EttCode" _
         & " where BohDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and BohCode > 0 and BohVtmCode IN (" & mFormVchTypeList & ")" _
         & IIf(mQryEttCode > 0, " and BohEttCode = " & CStr(mQryEttCode), "") _
         & IIf(mQryHpmCode > 0, " and BohHpmCode = " & CStr(mQryHpmCode), "") _
         & " group by ett.EttName,BloodOutHdr.BohEttCode" _
         & " order by ett.EttName,BloodOutHdr.BohEttCode" _
         , dbComDatabase, adOpenKeyset, adLockReadOnly
    
    ElseIf optHospwise.Value = True Then
        clsListStru.AddFields mExpr:="HpmName", mTitle:="Hospital Name", mShowItem:=True, mAlign:=flexAlignLeftCenter, mWidth:=3000
        clsListStru.AddFields mExpr:="BouCount", mTitle:="Count", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="BouPckQty_sum", mTitle:="Pck/Bag", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="BouBldQty_sum", mTitle:="Qty", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        
        datRecset.open "Select hpm.HpmName,BloodOutHdr.BohHpmCode" _
         & ",Count(BohCode) as BouCount" _
         & ",Sum(BohPckQty) as BouPckQty_sum" _
         & ",Sum(BohBldQty) as BouBldQty_sum" _
         & " from BloodOutHdr inner join HospMast hpm on BloodOutHdr.BohHpmCode = hpm.HpmCode" _
         & " where BohDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and BohCode > 0 and BohVtmCode IN (" & mFormVchTypeList & ")" _
         & IIf(mQryEttCode > 0, " and BohEttCode = " & CStr(mQryEttCode), "") _
         & IIf(mQryHpmCode > 0, " and BohHpmCode = " & CStr(mQryHpmCode), "") _
         & " group by hpm.HpmName,BloodOutHdr.BohHpmCode" _
         & " order by hpm.HpmName,BloodOutHdr.BohHpmCode" _
         , dbComDatabase, adOpenKeyset, adLockReadOnly
        
    End If
    
ElseIf optDetailed.Value = True Then
    clsListStru.AddFields mExpr:="tBouSmryId", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="BouCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="VtmName", mTitle:="Voucher", mAlign:=flexAlignLeftCenter, mWidth:=1500, mShowItem:=True
    clsListStru.AddFields mExpr:="BouVchNo", mTitle:="Vchr.No", mAlign:=flexAlignRightCenter, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="BouDate", mTitle:="Date", mAlign:=flexAlignLeftCenter, mWidth:=1300, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="EttCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="EttName", mTitle:="Patient Name", mAlign:=flexAlignLeftCenter, mWidth:=2500, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="HpmCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="HpmName", mTitle:="Hospital Name", mAlign:=flexAlignLeftCenter, mWidth:=2500, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="BouTrnRefNo", mTitle:="Ref.No", mAlign:=flexAlignRightCenter, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="BouPckQty", mTitle:="Pck/Bag", mAlign:=flexAlignRightCenter, mWidth:=1250, mShowItem:=False
    clsListStru.AddFields mExpr:="BouBldQty", mTitle:="Qty", mAlign:=flexAlignRightCenter, mWidth:=1250, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="EttAddr", mTitle:="Address", mAlign:=flexAlignLeftCenter, mWidth:=2000, mShowItem:=True
    clsListStru.AddFields mExpr:="EttAraName", mTitle:="Area", mAlign:=flexAlignLeftCenter, mWidth:=1500, mShowItem:=True
    clsListStru.AddFields mExpr:="EttStnName", mTitle:="Station", mAlign:=flexAlignLeftCenter, mWidth:=1500, mShowItem:=True
    
    datRecset.open "Select hdr.*,ett.*,hpm.*,ara.AraName,stn.StnName,vtm.VtmName" _
     & ",format(BohDate,'yyyymmdd')+format(BohCode,'" & cLONGCODESTRFMT & "') as tBouSmryId" _
     & " from ((BloodOutHdr hdr inner join ((EntityMast ett" _
     & " inner join AreaMast ara on ett.EttAraCode = ara.AraCode)" _
     & " inner join StsnMast stn on ett.EttStnCode = stn.StnCode)" _
     & " on hdr.BohEttCode = ett.EttCode)" _
     & " inner join HospMast hpm on hdr.BohHpmCode = hpm.HpmCode)" _
     & " inner join VTypMast vtm on hdr.BohVtmCode = vtm.VtmCode" _
     & " where BohDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & IIf(mRemoteAccess = True, " and BohCode = " & CStr(mBouCode) & "", "") _
     & " and BohCode > 0 and BohVtmCode IN (" & mFormVchTypeList & ")" _
     & IIf(mQryEttCode > 0, " and BohEttCode = " & CStr(mQryEttCode), "") _
     & IIf(mQryHpmCode > 0, " and BohHpmCode = " & CStr(mQryHpmCode), "") _
     & " order by BohDate,BohCode" _
     , dbComDatabase, adOpenKeyset, adLockReadOnly
    
     Rem & " from (BloodOutHdr"
     Rem & " inner join EntityMast ett on BloodOutHdr.BohEttCode = ett.EttCode)"
     Rem & " inner join HospMast hpm on BloodOutHdr.BohHpmCode = hpm.HpmCode"
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
Rem If .RecordCount > 0 Then
If IsValidRec(tRecset) = True Then
    Do While .EOF = False
        If optMonthwise.Value = True Or optDatewise.Value = True Or optEntitywise.Value = True Then
            If optMonthwise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BouYrMonth")) = .fields("BouYrMonth")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BouMnYear")) = MonthName(Val(Right(.fields("BouYrMonth"), 2))) & "-" & Left(.fields("BouYrMonth"), 4)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BouCount")) = ToMyNumFmt(.fields("BouCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BouPckQty_sum")) = ToMyNumFmt(.fields("BouPckQty_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BouBldQty_sum")) = ToMyNumFmt(.fields("BouBldQty_sum"), mDecimals:=-1)
                
            ElseIf optDatewise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BouDateYMD")) = Format(.fields("BohDate"), "yyyymmdd")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BouDate")) = Dtoc(.fields("BohDate"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BouCount")) = ToMyNumFmt(.fields("BouCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BouPckQty_sum")) = ToMyNumFmt(.fields("BouPckQty_sum"), mDecimals:=-1)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BouBldQty_sum")) = ToMyNumFmt(.fields("BouBldQty_sum"), mDecimals:=-1)
                
            ElseIf optEntitywise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttName")) = .fields("EttName")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BouCount")) = ToMyNumFmt(.fields("BouCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BouPckQty_sum")) = ToMyNumFmt(.fields("BouPckQty_sum"), mDecimals:=-1)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BouBldQty_sum")) = ToMyNumFmt(.fields("BouBldQty_sum"), mDecimals:=-1)
                
            ElseIf optHospwise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("HpmName")) = .fields("HpmName")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BouCount")) = ToMyNumFmt(.fields("BouCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BouPckQty_sum")) = ToMyNumFmt(.fields("BouPckQty_sum"), mDecimals:=-1)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BouBldQty_sum")) = ToMyNumFmt(.fields("BouBldQty_sum"), mDecimals:=-1)
                
            End If
        
        ElseIf optDetailed.Value = True Then
            Rem clsARA.GetData .fields("EttAraCode")
            Rem clsSTN.GetData .fields("EttStnCode")
            Rem clsVTM.GetData .fields("BohVtmCode")
            
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("tBouSmryId")) = .fields("tBouSmryId")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BouCode")) = .fields("BohCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("VtmName")) = .fields("VtmName")  ''' clsVTM.mName_str
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BouVchNo")) = .fields("BohVchNo")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BouDate")) = Dtoc(.fields("BohDate"))
            ' ------------------------------------
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BouTrnRefNo")) = .fields("BohTrnRefNo")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BouPckQty")) = ToMyNumFmt(.fields("BohPckQty"), mDecimals:=-1)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BouBldQty")) = ToMyNumFmt(.fields("BohBldQty"), mDecimals:=-1)
            ' ------------------------------------
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttCode")) = .fields("EttCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttName")) = .fields("EttName")
            ' ------------------------------------
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("HpmCode")) = .fields("HpmCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("HpmName")) = .fields("HpmName")
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
'''    aAhOpBal = clsAH.GetAhOpnBal(datRecset.Fields("PrtAhCode"), mDrCrSeperated:=True)
'''    mOpnDrAmtTot = mOpnDrAmtTot + aAhOpBal(0)
'''    mOpnCrAmtTot = mOpnCrAmtTot + aAhOpBal(1)
'''
'''    Rem current balance
'''    aAhCurBal = clsAH.GetAhCurBal(datRecset.Fields("PrtAhCode"), sFinYrEndDate, mDrCrSeperated:=True)
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
    fcmbEttName.BoundText = CStr(mQryEttCode): txtQryEttName.Text = fcmbEttName.Text
    fcmbHpmName.BoundText = CStr(mQryHpmCode): txtQryHpmName.Text = fcmbHpmName.Text
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
    If optDetailed.Value = True Or optExpanded.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("tBouSmryId"), mText
    ElseIf optMonthwise.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("BouYrMonth"), mText
    ElseIf optDatewise.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("BouDateYMD"), mText
    ElseIf optEntitywise.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("EttName"), mText
    ElseIf optHospwise.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("HpmName"), mText
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

Private Sub txtQryHpmName_Change()
If fcmbHpmName.CallFromText_Change = False Then
    fcmbHpmName.CallFromText_Change = True
    If InterActiveChange(txtQryHpmName) = True Then
        fcmbHpmName.UserText = Array(txtQryHpmName.Text, txtQryHpmName.SelStart)
        fcmbHpmName.Show
        txtQryHpmName.Text = fcmbHpmName.Text
        mQryHpmCode = Val(fcmbHpmName.BoundText)
        If fcmbHpmName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbHpmName.CallFromText_Change = False
End If

End Sub

Private Sub txtQryHpmName_GotFocus()
FlashActiveControl txtQryHpmName, True
End Sub

Private Sub txtQryHpmName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtQryHpmName_Change
ElseIf MyAddNewKey(Shift, KeyCode) = True Then
    Rem not required
End If

End Sub

Private Sub txtQryHpmName_LostFocus()
FlashActiveControl txtQryHpmName, False
End Sub

Private Sub txtSearch1Text_GotFocus()
FlashActiveControl txtSearch1Text, True
End Sub

Private Sub txtSearch1Text_LostFocus()
FlashActiveControl txtSearch1Text, False
End Sub

Private Sub txtBdgName_Change()
If fcmbBdgName.CallFromText_Change = False Then
    fcmbBdgName.CallFromText_Change = True
    If InterActiveChange(txtBdgName) = True Then
        fcmbBdgName.UserText = Array(txtBdgName.Text, txtBdgName.SelStart)
        fcmbBdgName.Show
        txtBdgName.Text = fcmbBdgName.Text
        If fcmbBdgName.ListSelected = True Then
            SendKeys "{TAB}"
        End If
    End If
    fcmbBdgName.CallFromText_Change = False
End If

End Sub

Private Sub txtBdgName_GotFocus()
FlashActiveControl txtBdgName, True

End Sub

Private Sub txtBdgName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtBdgName_Change
End If

End Sub

Private Sub txtBdgName_LostFocus()
FlashActiveControl txtBdgName, False
End Sub

Private Sub txtBdgName_Validate(Cancel As Boolean)
If Val(fcmbBdgName.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    txtBdgName.SetFocus
    Cancel = True
Else
    If FormAddEditMode = cFORM_ADDMODE Or dtlAddMode = True Or Val(fcmbBdgName.BoundText) <> mBouBdgCode_old Then
        Call ChkBldnItmCode
        Call ChkBldRefNoList
    End If
End If
Call ValidDtl

End Sub

Private Sub txtBdcName_Change()
If fcmbBdcName.CallFromText_Change = False Then
    fcmbBdcName.CallFromText_Change = True
    If InterActiveChange(txtBdcName) = True Then
        fcmbBdcName.UserText = Array(txtBdcName.Text, txtBdcName.SelStart)
        fcmbBdcName.Show
        txtBdcName.Text = fcmbBdcName.Text
        If fcmbBdcName.ListSelected = True Then
            SendKeys "{TAB}"
        End If
    End If
    fcmbBdcName.CallFromText_Change = False
End If

End Sub

Private Sub txtBdcName_GotFocus()
FlashActiveControl txtBdcName, True

End Sub

Private Sub txtBdcName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtBdcName_Change
End If

End Sub

Private Sub txtBdcName_LostFocus()
FlashActiveControl txtBdcName, False
End Sub

Private Sub txtBdcName_Validate(Cancel As Boolean)
If Val(fcmbBdcName.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    txtBdcName.SetFocus
    Cancel = True
Else
    If FormAddEditMode = cFORM_ADDMODE Or dtlAddMode = True Or Val(fcmbBdcName.BoundText) <> mBouBdcCode_old Then
        Call ChkBldnItmCode
        Call ChkBldRefNoList
        mskBouBldQty.Text = GetValueFromTableCol(cnn:=dbBdkDatabase, mTableName:="BloodCompoMst", mColumnName:="BdcBldQty", mFilterCond:="BdcCode = " & CStr(fcmbBdcName.BoundText), mRtnDefValue:=0)
        '''fcmbBdpName.BoundText = GetValueFromTableCol(cnn:=dbBdkDatabase, mTableName:="BloodCompoMst", mColumnName:="BdcBdpCode", mFilterCond:="BdcCode = " & CStr(fcmbBdcName.BoundText), mRtnDefValue:=0)
        '''txtBdpName.Text = fcmbBdpName.Text
        '''Call CalcBouBldQty
    End If
End If
Call ValidDtl

End Sub

'''Private Sub txtBdpName_Change()
'''If fcmbBdpName.CallFromText_Change = False Then
'''    fcmbBdpName.CallFromText_Change = True
'''    If InterActiveChange(txtBdpName) = True Then
'''        fcmbBdpName.UserText = Array(txtBdpName.Text, txtBdpName.SelStart)
'''        fcmbBdpName.Show
'''        txtBdpName.Text = fcmbBdpName.Text
'''        If fcmbBdpName.ListSelected = True Then
'''            SendKeys "{TAB}"
'''        End If
'''    End If
'''    fcmbBdpName.CallFromText_Change = False
'''End If
'''
'''End Sub
'''
'''Private Sub txtBdpName_GotFocus()
'''FlashActiveControl txtBdpName, True
'''End Sub
'''
'''Private Sub txtBdpName_KeyDown(KeyCode As Integer, Shift As Integer)
'''If MyDropDownKey(Shift, KeyCode) = True Then
'''    Call txtBdpName_Change
'''End If
'''
'''End Sub
'''
'''Private Sub txtBdpName_LostFocus()
'''FlashActiveControl txtBdpName, False
'''End Sub
'''
'''Private Sub txtBdpName_Validate(Cancel As Boolean)
'''If Val(fcmbBdpName.BoundText) < 1 Then
'''    ErrorBox "Invalid Selection !!!"
'''    txtBdpName.SetFocus
'''    Cancel = True
'''Else
'''    If FormAddEditMode = cFORM_ADDMODE Or dtlAddMode = True Or Val(fcmbBdpName.BoundText) <> mBouBdpCode_old Then
'''        Call CalcBouBldQty
'''    End If
'''End If
'''Call ValidDtl
'''
'''End Sub

Private Sub txtEttStnName_GotFocus()
FlashActiveControl txtEttStnName, True
End Sub

Private Sub txtEttStnName_LostFocus()
FlashActiveControl txtEttStnName, False
End Sub

'''Private Sub CalcBouBldQty()
'''Dim tRecset As New ADODB.Recordset, mBdpCode As Long, mBdpQty As Double
'''
'''mBdpQty = 0
'''mBdpCode = Val(fcmbBdpName.BoundText)
'''With tRecset
'''.open "Select * from BloodPckMst where BdpCode = " & CStr(mBdpCode) & "", dbBdkDatabase, adOpenKeyset, adLockOptimistic
'''If .EOF = False Then
'''    mBdpQty = .fields("BdpQty")
'''End If
'''End With
'''CloseTable tRecset
'''mskBouBldQty.Text = ToMyNumFmt(mBdpQty * Val(UnMyNumFmt(mskBouPckQty.Text)), mDecimals:=0)
'''
'''End Sub

Private Sub ChkBldnItmCode()
Dim tRecset As ADODB.Recordset, mBdgCode As Long, mBdcCode As Long, mBldCode As Long, mItmCode As Long

mBldCode = 0
mItmCode = 0
mBdgCode = Val(fcmbBdgName.BoundText)
mBdcCode = Val(fcmbBdcName.BoundText)
If mBdgCode > 0 And mBdcCode > 0 Then
    Set tRecset = New ADODB.Recordset
    With tRecset
    .open "Select * from BloodMast where BldBdgCode = " & CStr(mBdgCode) & " and BldBdcCode = " & CStr(mBdcCode) & "", dbBdkDatabase, adOpenKeyset, adLockOptimistic
    If .EOF = False Then
        mBldCode = .fields("BldCode")
        mItmCode = .fields("BldItmCode")
    End If
    End With
    CloseTable tRecset
End If
mskBouBldCode.Text = CStr(mBldCode)
mskBouItmCode.Text = CStr(mItmCode)
Set tRecset = Nothing

End Sub

'Private Sub CalcSalChg()
'Dim mBouBldQty As Double, mBouPckQty As Double, mSalAmount As Double, mBouAmtBefDisc As Double, mBouDiscPer As Double, mSalDiscAmt As Double, mBouAmtBefTax As Double, mSalTaxPer As Double, mSalTaxAmt As Double
'
'mBouBldQty = Val(UnMyNumFmt(mskBouBldQty.Text))
'mBouPckQty = Val(UnMyNumFmt(mskBouPckQty.Text))
'mBouDiscPer = Val(UnMyPerFmt(mskBouDiscPer.Text))
'mSalTaxPer = Val(UnMyPerFmt(mskBouTaxPer.Text))
'Rem If mFormSysVchType = cCOM_VTYPE_RETNOUTW Then
'    mBouAmtBefDisc = Round(mBouBldQty * mBouPckQty, 2)
'
'    mSalDiscAmt = Round(CDec(mBouAmtBefDisc) * CDec(mBouDiscPer) / 100, 2)
'
'    mBouAmtBefTax = mBouAmtBefDisc - mSalDiscAmt
'    Rem If FormAddEditMode = cFORM_ADDMODE Or dtlAddMode = True Or mSalTaxPer <> mSalTaxPer_old Or mBouAmtBefTax <> mBouAmtBefTax_old Or Val(UnMyNumFmt(mskBouTaxAmt.Text)) = 0 Then
'        mSalTaxAmt = Round(CDec(mBouAmtBefTax) * CDec(mSalTaxPer) / 100, 2)
'    Rem Else
'    Rem     mSalTaxAmt = Val(UnMyNumFmt(mskBouTaxAmt.Text))
'    Rem End If
'    mSalAmount = Round(mBouAmtBefTax + mSalTaxAmt, 2)
'Rem Else
'Rem     mBouAmtBefTax = Round(mBouBldQty * mBouPckQty, 2)
'Rem     If FormAddEditMode = cFORM_ADDMODE Or dtlAddMode = True Or mSalTaxPer <> mSalTaxPer_old Or mBouAmtBefTax <> mBouAmtBefTax_old Or Val(UnMyNumFmt(mskBouTaxAmt.Text)) = 0 Then
'Rem         mSalTaxAmt = Round(CDec(mBouAmtBefTax) * CDec(mSalTaxPer) / 100, 2)
'Rem     Else
'Rem         mSalTaxAmt = Val(UnMyNumFmt(mskBouTaxAmt.Text))
'Rem     End If
'Rem     mSalAmount = Round(mBouAmtBefTax + mSalTaxAmt, 2)
'Rem End If
'' --------
''mskBouAmtBefDisc.Text = ToMyNumFmt(mBouAmtBefDisc)
''mskBouDiscAmt.Text = ToMyNumFmt(mSalDiscAmt)
''mskBouAmtBefTax.Text = ToMyNumFmt(mBouAmtBefTax)
''mskBouTaxAmt.Text = ToMyNumFmt(mSalTaxAmt)
''mskBouAmount.Text = ToMyNumFmt(mSalAmount)
'
'End Sub

'''Private Sub ShowOldBouCodeDesc()
'''Dim tRecset As New ADODB.Recordset, mBouDate As Date, mBouEttCode As Long
'''
'''mBouEttCode = Val(fcmbEttName.BoundText)
'''mBouDate = Ctod(dtpBouDate.Text)
'''With tRecset
''''If FormAddEditMode = cFORM_ADDMODE Then
''''    .Open "Select top 1 boh.*,vtm.VtmName from BloodOutHdr boh inner join VTypMast vtm on boh.BohVtmCode=vtm.VtmCode where boh.BohEttCode=" & CStr(mBouEttCode) & " order by boh.BohDate Desc", dbComDatabase, adOpenKeyset, adLockOptimistic
''''Else
'''    .open "Select top 1 boh.*,vtm.VtmName from BloodOutHdr boh" _
'''        & " inner join VTypMast vtm on boh.BohVtmCode = vtm.VtmCode" _
'''        & " where boh.BohEttCode = " & CStr(mBouEttCode) _
'''        & " and boh.BohCode <> " & CStr(mBouCode) _
'''        & " and boh.BohDate <= #" & ToSysDate(mBouDate) & "#" _
'''        & " and boh.BohVtmCode IN (" & mFormVchTypeList & ")" _
'''        & " order by boh.BohDate Desc", dbComDatabase, adOpenKeyset, adLockOptimistic
''''End If
'''If .RecordCount > 0 Then
'''    lblOldBouCodeDesc.Caption = RTrim(.fields("VtmName")) & " No.:" & CStr(.fields("BohVchNo")) & " Dated:" & Dtoc(.fields("BohDate")) & " (" & CStr(mBouDate - .fields("BohDate")) & " Days Past)"
'''Else
'''    lblOldBouCodeDesc.Caption = "# First Time #"    ''' CStr(mBouEttCode)
'''End If
'''End With
'''CloseTable tRecset
'''
'''End Sub

Private Sub VisibleControls(ByVal mShowItem As Boolean, Optional ByVal mRowPos)
Rem Important - dtlAddEditMode & dtlAddMode must be initialised prior to this
If Me.Visible = True Then
    txtVoid.SetFocus
End If
If IsMissing(mRowPos) = False Then
    mskBouSno.Top = mRowPos
    txtBdgName.Top = mRowPos
    txtBdcName.Top = mRowPos
    txtBouNarr.Top = mRowPos
    txtBouBldRefNo.Top = mRowPos
    '''txtBdpName.Top = mRowPos
    mskBouPckQty.Top = mRowPos
    mskBouBldQty.Top = mRowPos
    cmdOK.Top = mRowPos
End If

mskBouICode.Text = 0
mskBouStkICode.Text = 0
mskBouSno.Text = 0
txtBdgName.Text = "": fcmbBdgName.BoundText = ""
txtBdcName.Text = "": fcmbBdcName.BoundText = ""
txtBouNarr.Text = ""
mskBouItmCode.Text = 0
mskBouBldCode.Text = 0
txtBouBldRefNo.Text = "": fcmbBldRefNo.BoundText = ""
mskBouBinCode.Text = 0
mskBouBinICode.Text = 0
'''txtBdpName.Text = "": fcmbBdpName.BoundText = ""
mskBouPckQty.Text = ToMyNumFmt(0, mDecimals:=-1)
mskBouBldQty.Text = ToMyNumFmt(0, mDecimals:=-1)

Call ValidDtl

mskBouICode.Visible = False     '''  mShowItem
mskBouStkICode.Visible = False     '''  mShowItem
mskBouSno.Visible = mShowItem
txtBdgName.Visible = mShowItem
txtBdcName.Visible = mShowItem
txtBouNarr.Visible = mShowItem
mskBouItmCode.Visible = False     '''  mShowItem
mskBouBldCode.Visible = False     '''  mShowItem
txtBouBldRefNo.Visible = mShowItem
mskBouBinCode.Visible = False     '''  mShowItem
mskBouBinICode.Visible = False     '''  mShowItem
'''txtBdpName.Visible = mShowItem
mskBouPckQty.Visible = mShowItem
mskBouBldQty.Visible = mShowItem
cmdOK.Visible = mShowItem

frHeader.Enabled = (mShowItem = False)
Mfgrd2.Enabled = (mShowItem = False)
Mfgrd3.Enabled = (mShowItem = False)
Mfgrd4.Enabled = (mShowItem = False)
frFooter.Enabled = (mShowItem = False)
cmdSaveForm.Enabled = (mShowItem = False)

End Sub

Private Sub ValidDtl()
Dim mDataOk As Boolean, srow As Integer

srow = Mfgrd2.Row
mDataOk = (Val(fcmbEttName.BoundText) > 0 And Val(fcmbEttName.BoundText) = mBouEttCode And Val(fcmbHpmName.BoundText) > 0 And Val(fcmbHpmName.BoundText) = mBouHpmCode And Val(UnMyNumFmt(mskBouSno.Text)) > 0 And Val(fcmbBdgName.BoundText) > 0 And Val(fcmbBdcName.BoundText) > 0 And Val(mskBouBldCode.Text) > 0 And Val(mskBouItmCode.Text) > 0 And Trim(txtBouBldRefNo.Text) <> "" And Val(mskBouBinCode.Text) > 0 And Val(mskBouBinICode.Text) > 0 And IIf(dtlAddMode = True, True, Val(mskBouICode.Text) > 0 And Val(mskBouStkICode.Text) > 0) And Val(UnMyNumFmt(mskBouPckQty.Text)) >= 0 And Val(UnMyNumFmt(mskBouBldQty.Text)) >= 0) ''' And Val(fcmbBdpName.BoundText) > 0

cmdOK.Caption = IIf(mDataOk = True, "&OK", "&Cancel")
cmdOK.BackColor = IIf(mDataOk = True, &H80FF80, &H8080FF)
End Sub

Private Sub CalcFtrTotal()
Dim mBldQtyTot As Double, mPckQtyTot As Double

mBldQtyTot = FlexColSum(Mfgrd2, X2BOUBLDQTY_COL)
mPckQtyTot = FlexColSum(Mfgrd2, X2BOUPCKQTY_COL)

lblBouBldQtyTot.Caption = ToMyNumFmt(mBldQtyTot, mDecimals:=-1)
lblBouPckQtyTot.Caption = ToMyNumFmt(mPckQtyTot, mDecimals:=-1)

End Sub

'''Private Sub ShowLinkTranDtl()
'''Dim tRecset As New ADODB.Recordset, mLinkTranStr As String
'''
'''mLinkTranStr = ""
'''
'''With tRecset
'''.open "Select * from ((((((BloodOutDtl bou" _
'''    & " inner join BloodOutHdr boh on bou.BouCode = boh.BohCode)" _
'''    & " inner join BloodInDtl bin on bou.BouBinICode = bin.BinICode)" _
'''    & " inner join BloodInHdr bih on bin.BinCode = bih.BihCode)" _
'''    & " inner join BloodMast bld on bin.BinBldCode = bld.BldCode)" _
'''    & " inner join BloodGrpMst bdg on bin.BinBdgCode = bdg.BdgCode)" _
'''    & " inner join BloodCompoMst bdc on bin.BinBdcCode = bdc.BdcCode)" _
'''    & " inner join VTypMast vtm on bih.BihVtmCode = vtm.VtmCode" _
'''    & " where BouCode = " & CStr(mBouCode) _
'''    & " order by BinDate,BinCode,BinSno" _
'''    , dbComDatabase, adOpenKeyset, adLockOptimistic
'''If .EOF = False Then
'''    Do While .EOF = False
'''        mLinkTranStr = mLinkTranStr & .fields("VtmName") & " No." & CStr(.fields("BihVchNo")) & " Dt." & Dtoc(.fields("BihDate")) & " Blood - " & .fields("BdgName") & ", " & .fields("BdcName") & " Rf." & .fields("BinBldRefNo") & " Pck/Bld.Qty." & ToMyNumFmt(.fields("BinPckQty"), mDecimals:=-1) & "/" & ToMyNumFmt(.fields("BinBldQty"), mDecimals:=-1) & vbCrLf
'''
'''        .MoveNext
'''    Loop
'''End If
'''End With
'''CloseTable tRecset
'''
'''txtLinkTranDesc.Text = mLinkTranStr
'''
'''End Sub

Private Sub ShowLinkTranOutDtl()
Dim tRecset As New ADODB.Recordset, mEttCode As Long, srow As Integer, mColCnt As Integer

mEttCode = Val(fcmbEttName.BoundText)
With tRecset
.open "Select bou.*,boh.*,bdg.BdgName,bdc.BdcName,vtm.VtmName from (((BloodOutDtl bou" _
  & " inner join BloodOutHdr boh on bou.BouCode = boh.BohCode)" _
  & " inner join BloodGrpMst bdg on bou.BouBdgCode = bdg.BdgCode)" _
  & " inner join BloodCompoMst bdc on bou.BouBdcCode = bdc.BdcCode)" _
  & " inner join VTypMast vtm on boh.BohVtmCode = vtm.VtmCode" _
  & " where bou.BouEttCode = " & CStr(mEttCode) _
  & " and bou.BouCode <> " & CStr(mBouCode) _
  & " order by bou.BouDate Desc,boh.BohTime,bou.BouCode,bou.BouSno", dbComDatabase, adOpenKeyset, adLockOptimistic
  Rem & " and bou.BouCode <> " & CStr(mBouCode)
  Rem & " and boh.BohDate <= #" & ToSysDate(mBouDate) & "#"
  Rem & " and boh.BohVtmCode IN (" & mFormVchTypeList & ")"
  Rem & " inner join BloodPckMst bdp on bou.BouBdpCode = bdp.BdpCode)"
srow = 1
Mfgrd3.Rows = 2
If .EOF = False Then
    Do While .EOF = False
        If InList(.fields("BouRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
            Mfgrd3.TextMatrix(srow, X3LNKICODE_COL) = .fields("BouICode")
            Mfgrd3.TextMatrix(srow, X3LNKSNO_COL) = ToMyNumFmt(.fields("BouSno"), mDecimals:=0)
            Mfgrd3.TextMatrix(srow, X3LNKVTMNAME_COL) = .fields("VtmName")
            Mfgrd3.TextMatrix(srow, X3LNKVCHNO_COL) = ToMyNumFmt(.fields("BohVchNo"), mDecimals:=0)
            Mfgrd3.TextMatrix(srow, X3LNKDATE_COL) = Dtoc(.fields("BouDate"))
            Mfgrd3.TextMatrix(srow, X3LNKBDGNAME_COL) = .fields("BdgName")
            Mfgrd3.TextMatrix(srow, X3LNKBDCNAME_COL) = .fields("BdcName")
            '''Mfgrd3.TextMatrix(srow, X3LNKBDPNAME_COL) = .fields("BdpName")
            Mfgrd3.TextMatrix(srow, X3LNKPCKQTY_COL) = ToMyNumFmt(.fields("BouPckQty"), mDecimals:=-1)
            Mfgrd3.TextMatrix(srow, X3LNKBLDQTY_COL) = ToMyNumFmt(.fields("BouBldQty"), mDecimals:=-1)
            Mfgrd3.TextMatrix(srow, X3LNKVTMCODE_COL) = .fields("BohVtmCode")
            Mfgrd3.TextMatrix(srow, X3LNKCODE_COL) = .fields("BouCode")
            Mfgrd3.TextMatrix(srow, X3LNKBINCODE_COL) = .fields("BouBinCode")
            Mfgrd3.TextMatrix(srow, X3LNKBINICODE_COL) = .fields("BouBinICode")
            
            Mfgrd3.Rows = Mfgrd3.Rows + 1
            srow = srow + 1
        Else
            If InList(.fields("BouRecState"), Array(cREC_CANCELED, cREC_DELETED)) = False Then
                ErrorBox Me.Name & "_ShowLinkTranOutDtl_#3271_[Invalid Record Status]"
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

Private Sub ShowLinkTranInDtl()
Dim tRecset As New ADODB.Recordset, mLinkCode As Long, mLinkICode As Long, srow As Integer, mColCnt As Integer

srow = Mfgrd3.Row
mLinkCode = Val(Mfgrd3.TextMatrix(srow, X3LNKBINCODE_COL))
mLinkICode = Val(Mfgrd3.TextMatrix(srow, X3LNKBINICODE_COL))

With tRecset
.open "Select * from (((((BloodInDtl bin" _
    & " inner join BloodInHdr bih on bin.BinCode = bih.BihCode)" _
    & " inner join BloodGrpMst bdg on bin.BinBdgCode = bdg.BdgCode)" _
    & " inner join BloodCompoMst bdc on bin.BinBdcCode = bdc.BdcCode)" _
    & " inner join BloodMast bld on bin.BinBldCode = bld.BldCode)" _
    & " inner join EntityMast ett on bin.BinEttCode = ett.EttCode)" _
    & " inner join VTypMast vtm on bih.BihVtmCode = vtm.VtmCode" _
    & " where BinCode = " & CStr(mLinkCode) & " and BinICode = " & CStr(mLinkICode) _
    & " order by BinDate desc,BinCode desc,BinSno" _
    , dbComDatabase, adOpenKeyset, adLockOptimistic
Rem & " inner join BloodPckMst bdp on bin.BinBdpCode = bdp.BdpCode)"
srow = 1
Mfgrd4.Rows = 2
If .EOF = False Then
    Do While .EOF = False
        If InList(.fields("BinRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
            Mfgrd4.TextMatrix(srow, X4LNKICODE_COL) = .fields("BinICode")
            Mfgrd4.TextMatrix(srow, X4LNKSNO_COL) = ToMyNumFmt(.fields("BinSno"), mDecimals:=0)
            Mfgrd4.TextMatrix(srow, X4LNKVTMNAME_COL) = .fields("VtmName")
            Mfgrd4.TextMatrix(srow, X4LNKVCHNO_COL) = ToMyNumFmt(.fields("BihVchNo"), mDecimals:=0)
            Mfgrd4.TextMatrix(srow, X4LNKDATE_COL) = Dtoc(.fields("BinDate"))
            Mfgrd4.TextMatrix(srow, X4LNKETTNAME_COL) = .fields("EttName")
            Mfgrd4.TextMatrix(srow, X4LNKPCKQTY_COL) = ToMyNumFmt(.fields("BinPckQty"), mDecimals:=-1)
            Mfgrd4.TextMatrix(srow, X4LNKBLDQTY_COL) = ToMyNumFmt(.fields("BinBldQty"), mDecimals:=-1)
            Mfgrd4.TextMatrix(srow, X4LNKBLDEXPDT_COL) = Dtoc(.fields("BinBldExpDt"))
            Mfgrd4.TextMatrix(srow, X4LNKBDGNAME_COL) = .fields("BdgName")
            Mfgrd4.TextMatrix(srow, X4LNKBDCNAME_COL) = .fields("BdcName")
            '''Mfgrd4.TextMatrix(srow, X4LNKBDPNAME_COL) = .fields("BdpName")
            Mfgrd4.TextMatrix(srow, X4LNKVTMCODE_COL) = .fields("BihVtmCode")
            Mfgrd4.TextMatrix(srow, X4LNKCODE_COL) = .fields("BinCode")
            
            Mfgrd4.Rows = Mfgrd4.Rows + 1
            srow = srow + 1
        Else
            If InList(.fields("BinRecState"), Array(cREC_CANCELED, cREC_DELETED)) = False Then
                ErrorBox Me.Name & "_ShowLinkTranInDtl_#3375_[Invalid Record Status]"
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

End Sub


Private Sub ChkBldRefNoList()
Rem important: below queries not almost same as in flexsearch class
fcmbBldRefNo.mBoundSqlExpr = "Select *,BldRefNo+'_'+format(ItrCode,'" & cLONGCODESTRFMT & "') as BldRefNoUnq from (" _
    & "Select BldRefNo,ItrCode,sum(PckQty) as PckQty_sum,sum(BldQty) as BldQty_sum from (" _
    & "Select BinItrCode as ItrCode,BinBldRefNo as BldRefNo,BinPckQty as PckQty,BinBldQty as BldQty from BloodInDtl" _
    & " inner join BloodInHdr on BloodInDtl.BinCode = BloodInHdr.BihCode" _
    & " where BinBdgCode = " & CStr(Val(fcmbBdgName.BoundText)) & " and BinBdcCode = " & CStr(Val(fcmbBdcName.BoundText)) _
    & " and BinBldCode = " & CStr(Val(mskBouBldCode.Text)) & " and BinItmCode = " & CStr(Val(mskBouItmCode.Text)) _
    & " and BinDate <= #" & CStr(ToSysDate(Ctod(dtpBouDate.Text))) & "#" _
    & " Union All " _
    & "Select BouItrCode as ItrCode,BouBldRefNo as BldRefNo,(BouPckQty*-1) as PckQty,(BouBldQty*-1) as BldQty from BloodOutDtl" _
    & IIf(FormAddEditMode = cFORM_EDITMODE, " inner join BloodOutHdr on BloodOutDtl.BouCode = BloodOutHdr.BohCode", "") _
    & " where BouBdgCode = " & CStr(Val(fcmbBdgName.BoundText)) & " and BouBdcCode = " & CStr(Val(fcmbBdcName.BoundText)) _
    & " and BouBldCode = " & CStr(Val(mskBouBldCode.Text)) & " and BouItmCode = " & CStr(Val(mskBouItmCode.Text)) _
    & " and BouICode <> " & CStr(Val(mskBouICode.Text)) _
    & " and (BouRecState <> " & CStr(cREC_CANCELED) & " and BouRecState <> " & CStr(cREC_DELETED) & ")" _
    & ")" _
    & " group by ItrCode,BldRefNo order by ItrCode,BldRefNo" _
    & ") as t1 inner join ProdRef on t1.ItrCode = ProdRef.ItrRefCode" _
    & " where PckQty_sum > 0 or BldQty_sum > 0"
    Rem & " where BinEttCode = " & CStr(Val(fcmbEttName.BoundText)) & " where BouEttCode = " & CStr(Val(fcmbEttName.BoundText))
    Rem & " and (BouRecState <> " & CStr(cREC_CANCELED) & " and BouRecState <> " & CStr(cREC_DELETED) & " and BouCode = " & CStr(mBouCode) & ")"
fcmbBldRefNo.mListSqlExpr = "Select *,BldRefNo+'_'+format(ItrCode,'" & cLONGCODESTRFMT & "') as BldRefNoUnq from (" _
    & "Select BldRefNo,ItrCode,sum(PckQty) as PckQty_sum,sum(BldQty) as BldQty_sum from (" _
    & "Select BinItrCode as ItrCode,BinBldRefNo as BldRefNo,BinPckQty as PckQty,BinBldQty as BldQty from BloodInDtl" _
    & " inner join BloodInHdr on BloodInDtl.BinCode = BloodInHdr.BihCode" _
    & " where BinBdgCode = " & CStr(Val(fcmbBdgName.BoundText)) & " and BinBdcCode = " & CStr(Val(fcmbBdcName.BoundText)) _
    & " and BinBldCode = " & CStr(Val(mskBouBldCode.Text)) & " and BinItmCode = " & CStr(Val(mskBouItmCode.Text)) _
    & " and BinDate <= #" & CStr(ToSysDate(Ctod(dtpBouDate.Text))) & "#" _
    & " Union All " _
    & "Select BouItrCode as ItrCode,BouBldRefNo as BldRefNo,(BouPckQty*-1) as PckQty,(BouBldQty*-1) as BldQty from BloodOutDtl" _
    & IIf(FormAddEditMode = cFORM_EDITMODE, " inner join BloodOutHdr on BloodOutDtl.BouCode = BloodOutHdr.BohCode", "") _
    & " where BouBdgCode = " & CStr(Val(fcmbBdgName.BoundText)) & " and BouBdcCode = " & CStr(Val(fcmbBdcName.BoundText)) _
    & " and BouBldCode = " & CStr(Val(mskBouBldCode.Text)) & " and BouItmCode = " & CStr(Val(mskBouItmCode.Text)) _
    & " and BouICode <> " & CStr(Val(mskBouICode.Text)) _
    & " and (BouRecState <> " & CStr(cREC_CANCELED) & " and BouRecState <> " & CStr(cREC_DELETED) & ")" _
    & ")" _
    & " group by BldRefNo,ItrCode order by BldRefNo,ItrCode" _
    & ") as t1 inner join ProdRef on t1.ItrCode = ProdRef.ItrRefCode" _
    & " where PckQty_sum > 0 or BldQty_sum > 0"
    Rem & " where BinEttCode = " & CStr(Val(fcmbEttName.BoundText)) & " where BouEttCode = " & CStr(Val(fcmbEttName.BoundText))
    Rem & " and (BouRecState <> " & CStr(cREC_CANCELED) & " and BouRecState <> " & CStr(cREC_DELETED) & " and BouCode = " & CStr(mBouCode) & ")"
fcmbBldRefNo.ReInit

End Sub

Private Function ChkAnyPostRcExist() As Boolean
Dim tRecset As New ADODB.Recordset

ChkAnyPostRcExist = False

With tRecset
.open "Select top 1 * from ((BloodInDtl" _
    & " inner join BloodInHdr on BloodInDtl.BinCode = BloodInHdr.BihCode)" _
    & " inner join BloodOutDtl on BloodInDtl.BinICode = BloodOutDtl.BouBinICode)" _
    & " Inner Join BloodOutHdr on BloodOutDtl.BouCode = BloodOutHdr.BohCode" _
    & " where BouCode = " & CStr(mBouCode) _
    & " and BinDate > #" & CStr(ToSysDate(Ctod(dtpBouDate.Text))) & "#" _
    & " order by BinDate,BinCode" _
    , dbBdkDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    clsVTM.GetData .fields("BihVtmCode")
    ErrorBox "Post Blood Donate Exist !!!" _
        & vbCrLf & clsVTM.mName_str & " No." & CStr(.fields("BihVchNo")) & " Dated " & Dtoc(.fields("BihDate")) & ""
    ChkAnyPostRcExist = True
End If
End With
CloseTable tRecset

End Function

Private Function ChkAnyMisLinkedRcExist(Optional ByVal mBouICode) As Boolean
Dim tRecset As New ADODB.Recordset, mMisLinkedDesc As String

ChkAnyMisLinkedRcExist = False
mMisLinkedDesc = ""

With tRecset
.open "Select top 1 * from ((BloodInDtl" _
    & " inner join BloodInHdr on BloodInDtl.BinCode = BloodInHdr.BihCode)" _
    & " inner join BloodOutDtl on BloodInDtl.BinICode = BloodOutDtl.BouBinICode)" _
    & " Inner Join BloodOutHdr on BloodOutDtl.BouCode = BloodOutHdr.BohCode" _
    & " where BouCode = " & CStr(mBouCode) _
    & IIf(IsMissing(mBouICode) = False, " and BouICode = " & CStr(mBouICode), "") _
    & " and (BouBdgCode <> BinBdgCode or BouBdcCode <> BinBdcCode or BouBldCode <> BinBldCode or BouItmCode <> BinItmCode or BouItrCode <> BinItrCode or BouBldRefNo <> BinBldRefNo)" _
    & " order by BihDate,BihCode" _
    , dbBdkDatabase, adOpenKeyset, adLockOptimistic
    Rem BihEttCode <> " & CStr(Val(fcmbEttName.BoundText)) & " or
If .EOF = False Then
    clsVTM.GetData .fields("BihVtmCode")
    'If .fields("BihEttCode") <> Val(fcmbEttName.BoundText) Then
    '    mMisLinkedDesc = mMisLinkedDesc & "<Party Name>"
    'End If
    If .fields("BouBdgCode") <> .fields("BinBdgCode") Then
        mMisLinkedDesc = mMisLinkedDesc & "<Blood Group>"
    End If
    If .fields("BouBdcCode") <> .fields("BinBdcCode") Then
        mMisLinkedDesc = mMisLinkedDesc & "<Blood Component>"
    End If
    If .fields("BouBldCode") <> .fields("BinBldCode") Then
        mMisLinkedDesc = mMisLinkedDesc & "<Blood Name>"
    End If
    If .fields("BouItmCode") <> .fields("BinItmCode") Then
        mMisLinkedDesc = mMisLinkedDesc & "<Master Item>"
    End If
    If .fields("BouItrCode") <> .fields("BinItrCode") Then
        mMisLinkedDesc = mMisLinkedDesc & "<Item Ref.Code>"
    End If
    If .fields("BouBldRefNo") <> .fields("BinBldRefNo") Then
        mMisLinkedDesc = mMisLinkedDesc & "<Item Ref.No.>"
    End If
    ErrorBox "Mis-Linked Blood Donate Exist !!!" _
        & vbCrLf & clsVTM.mName_str & " No." & CStr(.fields("BihVchNo")) & " Dated " & Dtoc(.fields("BihDate")) _
        & vbCrLf & "Alteration made in " _
        & vbCrLf & mMisLinkedDesc
    ChkAnyMisLinkedRcExist = True
End If
End With
CloseTable tRecset

End Function

Private Function ChkAnyExcessIsuExist(Optional ByVal mBouICode) As Boolean
Dim tRecset As New ADODB.Recordset

ChkAnyExcessIsuExist = False

With tRecset
.open "Select top 1 * from (((" _
    & "Select BinICode,BdgCode,BdcCode,BldCode,ItmCode,ItrCode,BldRefNo,sum(PckQty) as PckQty_sum,sum(BldQty) as BldQty_sum from (" _
    & "Select BinICode,BinBdgCode as BdgCode,BinBdcCode as BdcCode,BinBldCode as BldCode,BinItmCode as ItmCode,BinItrCode as ItrCode,BinBldRefNo as BldRefNo,BinPckQty as PckQty,BinBldQty as BldQty from (BloodInDtl" _
    & " inner join BloodInHdr on BloodInDtl.BinCode = BloodInHdr.BihCode)" _
    & " inner join BloodOutDtl on BloodInDtl.BinICode = BloodOutDtl.BouBinICode" _
    & " where BouCode = " & CStr(mBouCode) & IIf(IsMissing(mBouICode) = False, " and BouICode=" & CStr(mBouICode), "") _
    & " and BinRecState IN (" & CStr(cREC_ADDED) & "," & CStr(cREC_EDITED) & "," & CStr(cREC_UNCHANGED) & ")" _
    & " Union All " _
    & "Select BouBinICode as BinICode,BouBdgCode as BdgCode,BouBdcCode as BdcCode,BouBldCode as BldCode,BouItmCode as ItmCode,BouItrCode as ItrCode,BouBldRefNo as BldRefNo,(BouPckQty*-1) as PckQty,(BouBldQty*-1) as BldQty from BloodOutDtl" _
    & " left join BloodOutHdr on BloodOutDtl.BouCode = BloodOutHdr.BohCode" _
    & " where BouCode = " & CStr(mBouCode) & IIf(IsMissing(mBouICode) = False, " and BouICode=" & CStr(mBouICode), "") _
    & " and BouRecState <> " & CStr(cREC_CANCELED) _
    & " Union All " _
    & "Select bou.BouBinICode as BinICode,bou.BouBdgCode as BdgCode,bou.BouBdcCode as BdcCode,bou.BouBldCode as BldCode,bou.BouItmCode as ItmCode,bou.BouItrCode as ItrCode,bou.BouBldRefNo as BldRefNo,(bou.BouPckQty*-1) as PckQty,(bou.BouBldQty*-1) as BldQty from ((BloodOutDtl" _
    & " left join BloodOutHdr on BloodOutDtl.BouCode = BloodOutHdr.BohCode)" _
    & " inner join BloodOutDtl bou on BloodOutDtl.BouBinICode = bou.BouBinICode)" _
    & " left join BloodOutHdr boh on bou.BouCode = boh.BohCode" _
    & " where BloodOutDtl.BouCode = " & CStr(mBouCode) & " and bou.BouCode <> " & CStr(mBouCode) & IIf(IsMissing(mBouICode) = False, " and BloodOutDtl.BouICode = " & CStr(mBouICode) & " and bou.BouICode <> " & CStr(mBouICode), "") _
    & " and bou.BouRecState <> " & CStr(cREC_CANCELED) _
    & ")" _
    & " group by BinICode,BdgCode,BdcCode,BldCode,ItmCode,ItrCode,BldRefNo order by BinICode,BdgCode,BdcCode,BldCode,ItmCode,ItrCode,BldRefNo" _
    & ") as a" _
    & " inner join BloodGrpMst on a.BdgCode = BloodGrpMst.BdgCode)" & " inner join BloodCompoMst on a.BdcCode = BloodCompoMst.BdcCode)" & " inner join BloodMast on a.BldCode = BloodMast.BldCode" _
    & " where PckQty_sum < 0 or BldQty_sum < 0" _
    , dbComDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    ErrorBox "Blood Issue going Excess for Blood " & vbCrLf & .fields("BdgName") & "/" & .fields("BdcName") & " Ref.No." & CStr(.fields("BldRefNo")) & " by Pck/Bld.Qty " & CStr(.fields("PckQty_sum")) & "/" & CStr(.fields("BldQty_sum"))
    ChkAnyExcessIsuExist = True
End If
End With
CloseTable tRecset

End Function

Private Function ChkBldRefNoLink(ByVal mCallFromDtlAddEdit As Boolean) As Boolean
Dim tRecset As ADODB.Recordset, srow As Integer, mBldRefNo As String

ChkBldRefNoLink = True
If mCallFromDtlAddEdit = True Then
    mBldRefNo = txtBouBldRefNo.Text
    If mFormSysVchType = cBDK_VTYPE_BLOODISSUED Then
        Rem Set tRecset = dbComDatabase.Execute("Select * from (BloodOutDtl bou inner join BloodOutHdr boh on bou.BouCode = boh.BohCode) inner join VTypMast vtm on boh.BohVtmCode = vtm.VtmCode where BouBldRefNo = '" & mBldRefNo & "' and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODISSUED) & " and BouCode <> " & CStr(mBouCode))
        Rem With tRecset
        Rem If .EOF = False Then
        Rem     ErrorBox "Bag No. Already Used in " & .fields("VtmName") & " No. " & CStr(.fields("BohVchNo")) & " Dated " & Dtoc(.fields("BohDate"))
        Rem     ChkBldRefNoLink = False
        Rem End If
        Rem End With
        Rem CloseTable tRecset
        
        If ChkBldRefNoLink = True Then
            Set tRecset = dbComDatabase.Execute("Select * from (BloodInDtl bin inner join BloodInHdr bih on bin.BinCode = bih.BihCode) inner join VTypMast vtm on bih.BihVtmCode = vtm.VtmCode where BinBldRefNo = '" & mBldRefNo & "' and BihTrnRefNo = '" & txtBouTrnRefNo.Text & "' and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODDONATE) & " order by BihDate desc")
            With tRecset
            If .EOF = True Then
                ErrorBox "Bag No. does not Exist in Blood Donate Entry !!!"
                ChkBldRefNoLink = False
            Else
                Do While .EOF = False
                    If tRecset.fields("BinBdgCode") = Val(fcmbBdgName.BoundText) Then
                        Exit Do
                    End If
                    .MoveNext
                Loop
                If .EOF = True Then
                    ErrorBox "Blood Group does not Match with Blood Donate !!!"
                    ChkBldRefNoLink = False
                End If
            End If
            End With
            CloseTable tRecset
        End If
        
    ElseIf mFormSysVchType = cBDK_VTYPE_BLOODCONS Then
        Rem Set tRecset = dbComDatabase.Execute("Select * from (BloodOutDtl bou inner join BloodOutHdr boh on bou.BouCode = boh.BohCode) inner join VTypMast vtm on boh.BohVtmCode = vtm.VtmCode where BouBldRefNo = '" & mBldRefNo & "' and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODCONS) & " and BouCode <> " & CStr(mBouCode))
        Rem With tRecset
        Rem If .EOF = False Then
        Rem     ErrorBox "Bag No. Already Used in " & .fields("VtmName") & " No. " & CStr(.fields("BohVchNo")) & " Dated " & Dtoc(.fields("BohDate"))
        Rem     ChkBldRefNoLink = False
        Rem End If
        Rem End With
        Rem CloseTable tRecset
        
        If ChkBldRefNoLink = True Then
            Set tRecset = dbComDatabase.Execute("Select * from (BloodInDtl bin inner join BloodInHdr bih on bin.BinCode = bih.BihCode) inner join VTypMast vtm on bih.BihVtmCode = vtm.VtmCode where BinBldRefNo = '" & mBldRefNo & "' and BihTrnRefNo = '" & txtBouTrnRefNo.Text & "' and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODDONATE) & " order by BihDate desc")
            With tRecset
            If .EOF = True Then
                ErrorBox "Bag No. does not Exist in Blood Donate Entry !!!"
                ChkBldRefNoLink = False
            Else
                Do While .EOF = False
                    If tRecset.fields("BinBdgCode") = Val(fcmbBdgName.BoundText) Then
                        Exit Do
                    End If
                    .MoveNext
                Loop
                If .EOF = True Then
                    ErrorBox "Blood Group does not Match with Blood Donate !!!"
                    ChkBldRefNoLink = False
                End If
            End If
            End With
            CloseTable tRecset
        End If
    End If
Else
    For srow = 1 To Mfgrd2.Rows - 2
        mBldRefNo = Mfgrd2.TextMatrix(srow, X2BOUBLDREFNO_COL)
        If mFormSysVchType = cBDK_VTYPE_BLOODISSUED Then
            Rem Set tRecset = dbComDatabase.Execute("Select * from (BloodOutDtl bou inner join BloodOutHdr boh on bou.BouCode = boh.BohCode) inner join VTypMast vtm on boh.BohVtmCode = vtm.VtmCode where BouBldRefNo = '" & mBldRefNo & "' and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODISSUED) & " and BouCode <> " & CStr(mBouCode))
            Rem With tRecset
            Rem If .EOF = False Then
            Rem     ErrorBox "Bag No. Already Used in " & .fields("VtmName") & " No. " & CStr(.fields("BohVchNo")) & " Dated " & Dtoc(.fields("BohDate"))
            Rem     Mfgrd2.Row = srow
            Rem     Mfgrd2.SetFocus
            Rem     ChkBldRefNoLink = False
            Rem     Exit For
            Rem End If
            Rem End With
            Rem CloseTable tRecset
            
            If ChkBldRefNoLink = True Then
                Set tRecset = dbComDatabase.Execute("Select * from (BloodInDtl bin inner join BloodInHdr bih on bin.BinCode = bih.BihCode) inner join VTypMast vtm on bih.BihVtmCode = vtm.VtmCode where BinBldRefNo = '" & mBldRefNo & "' and BihTrnRefNo = '" & txtBouTrnRefNo.Text & "' and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODDONATE) & " order by BihDate desc")
                With tRecset
                If .EOF = True Then
                    ErrorBox "Bag No. does not Exist in Blood Donate Entry !!!"
                    Mfgrd2.Row = srow
                    Mfgrd2.SetFocus
                    ChkBldRefNoLink = False
                    Exit For
                Else
                    Do While .EOF = False
                        If tRecset.fields("BinBdgCode") = Val(Mfgrd2.TextMatrix(srow, X2BOUBDGCODE_COL)) Then
                            Exit Do
                        End If
                        .MoveNext
                    Loop
                    If .EOF = True Then
                        ErrorBox "Blood Group does not Match with Blood Donate !!!"
                        Mfgrd2.Row = srow
                        Mfgrd2.SetFocus
                        ChkBldRefNoLink = False
                        Exit For
                    End If
                End If
                End With
                CloseTable tRecset
            End If
            
        ElseIf mFormSysVchType = cBDK_VTYPE_BLOODCONS Then
            Rem Set tRecset = dbComDatabase.Execute("Select * from (BloodOutDtl bou inner join BloodOutHdr boh on bou.BouCode = boh.BohCode) inner join VTypMast vtm on boh.BohVtmCode = vtm.VtmCode where BouBldRefNo = '" & mBldRefNo & "' and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODCONS) & " and BouCode <> " & CStr(mBouCode))
            Rem With tRecset
            Rem If .EOF = False Then
            Rem     ErrorBox "Bag No. Already Used in " & .fields("VtmName") & " No. " & CStr(.fields("BohVchNo")) & " Dated " & Dtoc(.fields("BohDate"))
            Rem     Mfgrd2.Row = srow
            Rem     Mfgrd2.SetFocus
            Rem     ChkBldRefNoLink = False
            Rem     Exit For
            Rem End If
            Rem End With
            Rem CloseTable tRecset
            
            If ChkBldRefNoLink = True Then
                Set tRecset = dbComDatabase.Execute("Select * from (BloodInDtl bin inner join BloodInHdr bih on bin.BinCode = bih.BihCode) inner join VTypMast vtm on bih.BihVtmCode = vtm.VtmCode where BinBldRefNo = '" & mBldRefNo & "' and BihTrnRefNo = '" & txtBouTrnRefNo.Text & "' and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODDONATE) & " order by BihDate desc")
                With tRecset
                If .EOF = True Then
                    ErrorBox "Bag No. does not Exist in Blood Donate Entry !!!"
                    Mfgrd2.Row = srow
                    Mfgrd2.SetFocus
                    ChkBldRefNoLink = False
                    Exit For
                Else
                    Do While .EOF = False
                        If tRecset.fields("BinBdgCode") = Val(Mfgrd2.TextMatrix(srow, X2BOUBDGCODE_COL)) Then
                            Exit Do
                        End If
                        .MoveNext
                    Loop
                    If .EOF = True Then
                        ErrorBox "Blood Group does not Match with Blood Donate !!!"
                        Mfgrd2.Row = srow
                        Mfgrd2.SetFocus
                        ChkBldRefNoLink = False
                        Exit For
                    End If
                End If
                End With
                CloseTable tRecset
            End If
        End If
    Next srow

End If
If Not tRecset Is Nothing Then
    CloseTable tRecset, mCheckOpen:=True
End If

End Function

Rem - print -------------------------------------------------------------------------------------------------
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
Dim mBouVchNo As Long

If Val(fcmbVtmName.BoundText) < 1 Then
    ErrorBox "Invalid Voucher Type !!!"
    txtVtmName(1).SetFocus
    Exit Sub
End If
If Val(UnMyNumFmt(mskBouVchNo(1).Text)) < 1 Then
    ErrorBox "Invalid Voucher No. !!!"
    mskBouVchNo(1).SetFocus
    Exit Sub
Else
    mBouVchNo = Val(UnMyNumFmt(mskBouVchNo(1).Text))
    If ChkIsExistVTypeNo(dbBdkDatabase, mTableName:="BloodOutHdr", mChkFieldName:="BohVchNo", mChkFieldValue:=CStr(mBouVchNo), mVtmFieldName:="BohVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="BohCmpCode", mFinYrFieldValue:=sFinYrCmpCode) = False Then
        ErrorBox "Voucher No. does not Exist !!!"
        mskBouVchNo(1).SetFocus
        Exit Sub
    End If
End If
If Val(UnMyNumFmt(mskBouVchNo(2).Text)) < 1 Then
    ErrorBox "Invalid Voucher No. !!!"
    mskBouVchNo(2).SetFocus
    Exit Sub
Else
    mBouVchNo = Val(UnMyNumFmt(mskBouVchNo(2).Text))
    If ChkIsExistVTypeNo(dbBdkDatabase, mTableName:="BloodOutHdr", mChkFieldName:="BohVchNo", mChkFieldValue:=CStr(mBouVchNo), mVtmFieldName:="BohVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="BohCmpCode", mFinYrFieldValue:=sFinYrCmpCode) = False Then
        ErrorBox "Voucher No. does not Exist !!!"
        mskBouVchNo(2).SetFocus
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
Dim mFromBouVchNo As Long, mToBouVchNo As Long, mBouVtmCode As Long
Dim fCRView As Form

mFromBouVchNo = Val(UnMyNumFmt(mskBouVchNo(1).Text))
mToBouVchNo = Val(UnMyNumFmt(mskBouVchNo(2).Text))
mBouVtmCode = Val(fcmbVtmName.BoundText)

frmMain.Cryst.Reset
frmMain.Cryst.ReportFileName = Trim(Right(cmbCRList.List(cmbCRList.ListIndex), 100))
frmMain.Cryst.DiscardSavedData = True
frmMain.Cryst.DataFiles(0) = dbComDatabaseFullPath

frmMain.Cryst.SelectionFormula = "{vewBloodOut.BohVchNo}>=" & CStr(mFromBouVchNo) & " and {vewBloodOut.BohVchNo}<=" & CStr(mToBouVchNo) & " and {vewBloodOut.BohVtmCode}=" & CStr(mBouVtmCode) & " and {vewBloodOut.BohCmpCode}=" & CStr(sFinYrCmpCode)
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

If mFormSysVchType <> cBDK_VTYPE_BLOODISSUED Then
    Exit Sub
End If
If mCallSource = "Keydown" Then
    If Mfgrd1.Row < Mfgrd1.Rows - 1 And optDetailed.Value = True And datRecset.BOF = False And datRecset.EOF = False Then
        fcmbVtmName.BoundText = CStr(datRecset.fields("BohVtmCode"))
        txtVtmName(1).Text = fcmbVtmName.Text
        mskBouVchNo(1).Text = datRecset.fields("BohVchNo")
        mskBouVchNo(2).Text = datRecset.fields("BohVchNo")
        ' ----------------
        Call AssignPrintPara
        frPrintCRList.ZOrder
        frPrintCRList.Visible = True
        Mfgrd1.Enabled = False
        cmbPrintDest.SetFocus
    End If
    
ElseIf mCallSource = "SaveEvent" Then
    txtVtmName(1).Text = fcmbVtmName.Text
    mskBouVchNo(1).Text = CStr(Val(UnMyNumFmt(mskBouVchNo(0).Text)))
    mskBouVchNo(2).Text = CStr(Val(UnMyNumFmt(mskBouVchNo(0).Text)))
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

If Dir(BldOutNoteCRLFileFullPath) = "" Then
    fhand = FreeFile
    Open BldOutNoteCRLFileFullPath For Output As #fhand
    Write #fhand, "Blood Issue Note", "BldOutNt.Rpt", True
    Close #fhand
End If

cmbCRList.Clear
fhand = FreeFile
Open BldOutNoteCRLFileFullPath For Input As #fhand
Do While EOF(fhand) = False
    Input #fhand, mCRLTitle, mCRLFileName, mCRLDefault
    If Dir(BldOutNoteCRLFileFullPath(mFileName:=mCRLFileName)) <> "" Then
        cmbCRList.AddItem mCRLTitle & Space(100) & BldOutNoteCRLFileFullPath(mFileName:=mCRLFileName)
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





Rem ---------------------------------------------- end of form -------------------------------------------------



Rem ---------------------------------------------- end of form -------------------------------------------------

