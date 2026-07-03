VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmJobIssue 
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
   Begin VB.TextBox txtVoid 
      CausesValidation=   0   'False
      Height          =   375
      Left            =   0
      TabIndex        =   32
      TabStop         =   0   'False
      Text            =   "Void"
      Top             =   10440
      Width           =   375
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
      TabIndex        =   38
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
      TabIndex        =   37
      TabStop         =   0   'False
      Top             =   0
      Width           =   255
   End
   Begin VB.ComboBox cmbFormEntryMode 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   315
      ItemData        =   "JobIssu.frx":0000
      Left            =   0
      List            =   "JobIssu.frx":000D
      Style           =   1  'Simple Combo
      TabIndex        =   36
      TabStop         =   0   'False
      Text            =   "cmbFormEntryMode"
      Top             =   360
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
      Height          =   9255
      Left            =   120
      TabIndex        =   35
      Top             =   720
      Width           =   14175
      Begin VB.TextBox txtJisNarr 
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
         Left            =   6600
         MaxLength       =   150
         TabIndex        =   26
         Top             =   4320
         Width           =   3015
      End
      Begin VB.TextBox mskJisJrcICode 
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
         Left            =   6120
         TabIndex        =   25
         Tag             =   "AhCode"
         Text            =   "0"
         Top             =   5160
         Visible         =   0   'False
         Width           =   1335
      End
      Begin VB.TextBox mskJisJrcCode 
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
         Left            =   4680
         TabIndex        =   24
         Tag             =   "AhCode"
         Text            =   "0"
         Top             =   5160
         Visible         =   0   'False
         Width           =   1335
      End
      Begin VB.TextBox mskJisStkICode 
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
         Left            =   360
         TabIndex        =   18
         Tag             =   "AhCode"
         Text            =   "0"
         Top             =   5160
         Visible         =   0   'False
         Width           =   1335
      End
      Begin VB.TextBox mskJisItmCode 
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
         Left            =   3240
         TabIndex        =   22
         Tag             =   "AhCode"
         Text            =   "0"
         Top             =   5160
         Visible         =   0   'False
         Width           =   1335
      End
      Begin VB.TextBox txtJisSimRefNo 
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
         Left            =   3960
         MaxLength       =   25
         TabIndex        =   23
         Top             =   4320
         Width           =   2655
      End
      Begin VB.TextBox mskJisICode 
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
         Left            =   1800
         TabIndex        =   19
         Tag             =   "AhCode"
         Text            =   "0"
         Top             =   5160
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
         Left            =   13200
         Style           =   1  'Graphical
         TabIndex        =   30
         Top             =   4320
         Width           =   735
      End
      Begin VB.TextBox mskJisSno 
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
         TabIndex        =   20
         Tag             =   "AhCode"
         Text            =   "1)"
         Top             =   4320
         Width           =   495
      End
      Begin VB.Frame frHeader 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   3375
         Left            =   120
         TabIndex        =   57
         Top             =   240
         Width           =   13935
         Begin VB.TextBox mskJisStkCode 
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
            TabIndex        =   78
            Tag             =   "AhCode"
            Text            =   "-1"
            Top             =   240
            Width           =   1455
         End
         Begin VB.TextBox dtpJisTrnRefDt 
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
            Left            =   4920
            MaxLength       =   50
            TabIndex        =   15
            Text            =   "dd/mm/yyyy"
            Top             =   3000
            Width           =   1455
         End
         Begin VB.TextBox txtJisTrnRefNo 
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
            TabIndex        =   14
            Tag             =   "AhCode"
            Top             =   3000
            Width           =   1815
         End
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
            TabIndex        =   8
            TabStop         =   0   'False
            Top             =   3720
            Width           =   4455
         End
         Begin VB.TextBox txtJisTime_str 
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
            TabIndex        =   13
            TabStop         =   0   'False
            Text            =   "00:00"
            Top             =   2640
            Width           =   855
         End
         Begin VB.TextBox dtpJisDate 
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
            Left            =   8400
            MaxLength       =   50
            TabIndex        =   12
            Text            =   "dd/mm/yyyy"
            Top             =   2640
            Width           =   1455
         End
         Begin VB.TextBox mskJisVchNo 
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
            TabIndex        =   11
            Tag             =   "AhCode"
            Text            =   "0"
            Top             =   2640
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
            Left            =   2040
            MaxLength       =   50
            TabIndex        =   9
            Top             =   2640
            Width           =   1815
         End
         Begin VB.TextBox txtJisPrefix 
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
            TabIndex        =   10
            Tag             =   "AhCode"
            Text            =   "[Prefix]"
            Top             =   2640
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
            Tag             =   "AhCode"
            Text            =   "-1"
            Top             =   240
            Width           =   1455
         End
         Begin VB.TextBox txtPrtName 
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
            TabIndex        =   1
            Top             =   720
            Width           =   5295
         End
         Begin VB.TextBox txtPrtAddr 
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
            TabIndex        =   3
            TabStop         =   0   'False
            Top             =   1080
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
            TabIndex        =   5
            TabStop         =   0   'False
            Top             =   1800
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
            Locked          =   -1  'True
            MaxLength       =   50
            TabIndex        =   6
            TabStop         =   0   'False
            Top             =   2160
            Width           =   5295
         End
         Begin VB.TextBox txtPrtTelNo 
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
            Left            =   8880
            Locked          =   -1  'True
            MaxLength       =   50
            TabIndex        =   2
            TabStop         =   0   'False
            Top             =   1080
            Width           =   3735
         End
         Begin VB.TextBox txtPrtSMSNo 
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
            Left            =   8880
            Locked          =   -1  'True
            MaxLength       =   50
            TabIndex        =   4
            TabStop         =   0   'False
            Top             =   1440
            Width           =   3735
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
            TabIndex        =   7
            TabStop         =   0   'False
            Top             =   3720
            Width           =   3975
         End
         Begin VB.TextBox txtJihRemark 
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
            TabIndex        =   16
            Top             =   3000
            Width           =   5295
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
            Height          =   255
            Index           =   2
            Left            =   3960
            TabIndex        =   77
            Top             =   3000
            Width           =   975
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Ref.No.:"
            BeginProperty Font 
               Name            =   "Verdana"
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
            TabIndex        =   76
            Top             =   3000
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
            Height          =   255
            Index           =   39
            Left            =   7680
            TabIndex        =   69
            Top             =   2640
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
            TabIndex        =   68
            Top             =   2640
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
            TabIndex        =   67
            Top             =   2640
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
            TabIndex        =   66
            Top             =   2640
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
            TabIndex        =   65
            Top             =   240
            Width           =   1935
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Party Name:"
            BeginProperty Font 
               Name            =   "Verdana"
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
            Top             =   720
            Width           =   1935
         End
         Begin VB.Line Line3 
            Index           =   1
            X1              =   0
            X2              =   13920
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
            Height          =   255
            Index           =   8
            Left            =   120
            TabIndex        =   63
            Top             =   1080
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
            TabIndex        =   62
            Top             =   1800
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
            TabIndex        =   61
            Top             =   2160
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
            TabIndex        =   60
            Top             =   1080
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
            TabIndex        =   59
            Top             =   1440
            Width           =   1575
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
            Left            =   6480
            TabIndex        =   58
            Top             =   3000
            Width           =   975
         End
         Begin VB.Shape Shape1 
            BackColor       =   &H00FFC0C0&
            BackStyle       =   1  'Opaque
            Height          =   2415
            Index           =   0
            Left            =   0
            Top             =   120
            Width           =   13935
         End
         Begin VB.Shape Shape1 
            BackColor       =   &H00FFFF80&
            BackStyle       =   1  'Opaque
            Height          =   855
            Index           =   2
            Left            =   0
            Top             =   2520
            Width           =   13935
         End
      End
      Begin VB.TextBox txtSimName 
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
         TabIndex        =   21
         Top             =   4320
         Width           =   3375
      End
      Begin VB.TextBox mskJisAmount 
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
         Left            =   11640
         TabIndex        =   29
         Text            =   "0.00"
         Top             =   4320
         Width           =   1575
      End
      Begin VB.TextBox mskJisRate 
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
         Left            =   10440
         TabIndex        =   28
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   4320
         Width           =   1215
      End
      Begin VB.TextBox mskJisQty 
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
         TabIndex        =   27
         Tag             =   "AhCode"
         Text            =   "0"
         Top             =   4320
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
         TabIndex        =   31
         Top             =   8880
         Width           =   375
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd2 
         Height          =   2775
         Left            =   120
         TabIndex        =   17
         Top             =   3600
         Width           =   13935
         _ExtentX        =   24580
         _ExtentY        =   4895
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
      Begin VB.Frame frFooter 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         ForeColor       =   &H80000008&
         Height          =   2415
         Left            =   120
         TabIndex        =   70
         Top             =   6360
         Width           =   13935
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Last Issue:"
            BeginProperty Font 
               Name            =   "Verdana"
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
            TabIndex        =   75
            Top             =   1920
            Width           =   1695
         End
         Begin VB.Label lblOldJisCodeDesc 
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
            TabIndex        =   74
            Top             =   1920
            Width           =   6135
         End
         Begin VB.Label lblLinkTranDesc 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Job Issue Detail:"
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
            TabIndex        =   73
            Top             =   480
            Width           =   8055
            WordWrap        =   -1  'True
         End
         Begin VB.Label lblJisAmountTot 
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
            Left            =   11640
            TabIndex        =   72
            Top             =   120
            Width           =   1575
         End
         Begin VB.Label lblJisQtyTot 
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
            Left            =   9600
            TabIndex        =   71
            Top             =   120
            Width           =   855
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
      TabIndex        =   34
      Top             =   720
      Width           =   14295
      Begin VB.Frame frConfigure 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   4935
         Left            =   3000
         TabIndex        =   52
         Top             =   720
         Width           =   6735
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
            TabIndex        =   50
            Top             =   4200
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
            TabIndex        =   45
            Top             =   1560
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
               TabIndex        =   46
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
               TabIndex        =   47
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
               TabIndex        =   48
               Top             =   1320
               Width           =   2055
            End
            Begin VB.OptionButton optPartywise 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Party-wise"
               BeginProperty Font 
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
               TabIndex        =   49
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
            TabIndex        =   43
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
            TabIndex        =   42
            Tag             =   "AhCode"
            Text            =   "dd/mm/yyyy"
            Top             =   720
            Width           =   1455
         End
         Begin VB.TextBox txtQryPrtName 
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
            TabIndex        =   44
            Top             =   1200
            Width           =   4455
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
            TabIndex        =   56
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
            TabIndex        =   55
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
            TabIndex        =   54
            Top             =   0
            Width           =   6735
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Party Name:"
            BeginProperty Font 
               Name            =   "Verdana"
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
            TabIndex        =   53
            Top             =   1200
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
         TabIndex        =   41
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
         TabIndex        =   39
         Top             =   360
         Width           =   4215
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd1 
         Height          =   6375
         Left            =   120
         TabIndex        =   40
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
         TabIndex        =   51
         Top             =   360
         Width           =   735
      End
   End
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Job Issue"
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
      TabIndex        =   33
      Top             =   0
      Width           =   9015
   End
End
Attribute VB_Name = "frmJobIssue"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim mFormLoaded As Boolean, mLastKeyPressed As Integer, mMaskKeyPressed As Integer
Dim mFormUIdCode As Long, mFormUIdFileName As String, mFormAcsPermFileName As String
Dim mJisCode As Long, mJisStkCode As Long, mQryPrtCode As Long, dtlAddEditMode As Boolean, dtlAddMode As Boolean, dtlEditCanceled As Boolean
Dim dtlSdcAddEditMode As Boolean, dtlSdcAddMode As Boolean, dtlSdcEditCanceled As Boolean
Dim mRemoteAccess As Boolean, mEntrySaved As Boolean, mEntryAborted As Boolean
Dim dbAcDatabase As New ADODB.Connection, dbStDatabase As New ADODB.Connection, dbGtdDatabase As New ADODB.Connection, dbGrpDatabase As New ADODB.Connection, dbComDatabase As New ADODB.Connection
Dim datRecset As New ADODB.Recordset
Dim mJisCode_old As Long, mJisStkCode_old As Long, mJisPrtCode_old As Long, mJisDate_old As Date, mJisVtmCode_old As Long, mJisVchNo_old As Long, mJisTime_old As Long
Dim mJisSimCode_old As Long, mJisItmCode_old As Long, mJisItrCode_old As Long, mJisJrcCode_old As Long, mJisJrcICode_old As Long
Dim clsAH As clsAccountHead, clsSTK As clsStockJrn, clsJIS As clsGtdMultiTranEntry, clsARA As clsComMastEntry, clsSTN As clsComMastEntry, clsVTM As clsComMastEntry
Dim clsPRT As clsGtdMasterEntry, clsSIM As clsGtdMasterEntry
Dim mActiveControl As Object, clsListStru As clsSelectQueryStructure
Dim fcmbVtmName As clsComFlexSearch
Dim fcmbPrtName As clsGtdFlexSearch, fcmbSimName As clsGtdFlexSearch, fcmbSimRefNo As clsGtdFlexSearch

Private Type SmryPara
mIndex() As Variant
mFromDate() As Variant
mToDate() As Variant
mPrtCode() As Variant
mDetailed() As Variant
mMonthwise() As Variant
mDatewise() As Variant
mPatwise() As Variant

End Type

Dim SmryParaLayer As SmryPara

Rem service charges column definitions
Const X2JISICODE_COL = 0
Const X2JISSNO_COL = 1
Const X2SIMNAME_COL = 2
Const X2JISSIMREFNO_COL = 3
Const X2JISNARR_COL = 4
Const X2JISQTY_COL = 5
Const X2JISRATE_COL = 6
Const X2JISAMOUNT_COL = 7
Const X2JISSIMCODE_COL = 8
Const X2JISITMCODE_COL = 9
Const X2JISITRCODE_COL = 10
Const X2JISSTKICODE_COL = 11
Const X2JISJRCCODE_COL = 12
Const X2JISJRCICODE_COL = 13
Const X2JISRECSTATE_COL = 14
Const MFGRD2_COLS = 15

Private Sub ClearSmryParaLayer()

With SmryParaLayer
.mIndex = Array()
.mFromDate = Array()
.mToDate = Array()
.mPrtCode = Array()
.mDetailed = Array()
.mMonthwise = Array()
.mDatewise = Array()
.mPatwise = Array()
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
    ReDim Preserve .mPrtCode(mIndex)
    ReDim Preserve .mDetailed(mIndex)
    ReDim Preserve .mMonthwise(mIndex)
    ReDim Preserve .mDatewise(mIndex)
    ReDim Preserve .mPatwise(mIndex)
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
ReDim Preserve .mPrtCode(mIndex)
ReDim Preserve .mDetailed(mIndex)
ReDim Preserve .mMonthwise(mIndex)
ReDim Preserve .mDatewise(mIndex)
ReDim Preserve .mPatwise(mIndex)
' -----------------------
.mIndex(mIndex) = mIndex
.mFromDate(mIndex) = Ctod(dtpFromDate.Text)
.mToDate(mIndex) = Ctod(dtpToDate.Text)
    fcmbPrtName.BoundText = CStr(mQryPrtCode)
.mPrtCode(mIndex) = Val(fcmbPrtName.BoundText)
.mDetailed(mIndex) = optDetailed.Value
.mMonthwise(mIndex) = optMonthwise.Value
.mDatewise(mIndex) = optDatewise.Value
.mPatwise(mIndex) = optPartywise.Value

End With

End Sub

Private Sub RestoreDefaultSmryPara()

dtpFromDate.Text = Dtoc(sFinYrStartDate)
dtpToDate.Text = Dtoc(sFinYrEndDate)
mQryPrtCode = 0
txtQryPrtName.Text = "": fcmbPrtName.BoundText = ""
optDetailed.Value = False
optMonthwise.Value = True
optDatewise.Value = False
optPartywise.Value = False
' ----------
AddSmryParaLayer mClear:=True

End Sub

Private Sub RestoreRecentSmryPara()
Dim mIndex As Integer

With SmryParaLayer
mIndex = UBound(.mIndex)
dtpFromDate.Text = Dtoc(.mFromDate(mIndex))
dtpToDate.Text = Dtoc(.mToDate(mIndex))
    mQryPrtCode = .mPrtCode(mIndex)
fcmbPrtName.BoundText = CStr(mQryPrtCode): txtQryPrtName.Text = fcmbPrtName.Text
optDetailed.Value = .mDetailed(mIndex)
optMonthwise.Value = .mMonthwise(mIndex)
optDatewise.Value = .mDatewise(mIndex)
optPartywise.Value = .mPatwise(mIndex)
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
mJisCode = mAccessCode
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

Public Property Get PrtName() As String
PrtName = txtPrtName.Text
End Property

Public Property Get FormAddEditMode() As Integer
FormAddEditMode = cmbFormEntryMode.ListIndex
End Property

Public Property Let FormAddEditMode(ByVal New_FormEntryMode As Integer)
cmbFormEntryMode.ListIndex = New_FormEntryMode
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
                fcmbPrtName.BoundText = CStr(mQryPrtCode)
                
                txtVoid.SetFocus
                If optMonthwise.Value = True Then
                    dtpFromDate.Text = Dtoc(MonthStartDate(DateSerial(Val(Left(.fields("JisYrMonth"), 4)), Val(Right(.fields("JisYrMonth"), 2)), 1)))
                    dtpToDate.Text = Dtoc(MonthEndDate(DateSerial(Val(Left(.fields("JisYrMonth"), 4)), Val(Right(.fields("JisYrMonth"), 2)), 1)))
                    optMonthwise.Value = False
                    optDatewise.Value = True
                ElseIf optDatewise.Value = True Then
                    dtpFromDate.Text = Dtoc(.fields("JihDate"))
                    dtpToDate.Text = Dtoc(.fields("JihDate"))
                    optDatewise.Value = False
                    optDetailed.Value = True
                ElseIf optPartywise.Value = True Then
                    mQryPrtCode = .fields("JihPrtCode")
                    fcmbPrtName.BoundText = CStr(mQryPrtCode)
                    txtQryPrtName.Text = fcmbPrtName.Text
                    optPartywise.Value = False
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
    ElseIf Screen.ActiveControl.Name = Mfgrd2.Name Then
        Mfgrd2_KeyPress vbKeyReturn
    End If
ElseIf FormAddEditMode = cFORM_SMRYMODE And frConfigure.Visible = False Then

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
        txtPrtName.SetFocus
    End If
End If

End Sub

Private Sub cmdOK_Click()
Dim tRecset As New ADODB.Recordset, srow As Integer, mJisICode As Long, mJisStkICode As Long, mJisItrCode As Long, mReqdRecdAmt As Double

srow = Mfgrd2.Row
mJisICode = Val(Mfgrd2.TextMatrix(srow, X2JISICODE_COL))
mJisStkICode = Val(Mfgrd2.TextMatrix(srow, X2JISSTKICODE_COL))
mJisItrCode = Val(fcmbSimRefNo.BoundText)  ''' Val(Mfgrd2.TextMatrix(srow, X2JISITRCODE_COL))

If cmdOK.Caption = "&OK" And dtlEditCanceled = False Then
    Rem updating values in job issue table
    With clsJIS
    If dtlAddMode = True Then
        .ClearDtl
    Else
        .GetDtlData mJisCode, mJisICode
    End If
    .mTrnCode_lng = mJisCode
    .mTrnDtlSno_int = Val(UnMyNumFmt(mskJisSno.Text))
    .mTrnDate_dt = Ctod(dtpJisDate.Text)
    .mTrnCmpCode_int = sFinYrCmpCode
    
    .mJisStkCode_lng = mJisStkCode
    .mJisStkICode_lng = mJisStkICode
    .mJisPrtCode_lng = Val(fcmbPrtName.BoundText)
    .mJisSimCode_lng = Val(fcmbSimName.BoundText)
    .mJisItmCode_lng = Val(mskJisItmCode.Text)
    .mJisItrCode_lng = Val(fcmbSimRefNo.BoundText)
    .mJisSimRefNo_str = txtJisSimRefNo.Text
    .mJisJrcCode_lng = Val(mskJisJrcCode.Text)
    .mJisJrcICode_lng = Val(mskJisJrcICode.Text)
    .mJisNarr_str = txtJisNarr.Text
    .mJisQty_dbl = Val(UnMyNumFmt(mskJisQty.Text))
    .mJisRate_dbl = Val(UnMyNumFmt(mskJisRate.Text))
    .mJisAmount_dbl = Val(UnMyNumFmt(mskJisAmount.Text))
    .mJisRemark_str = ""
    
    If dtlAddMode = True Then
        If .AddNewDtl(mJisCode) = True Then
            mJisICode = .mTrnDtlICode_lng
        End If
    Else
        .UpdateDtl mJisCode, mJisICode
    End If
    End With
    
    Rem updating values in stock table
    With clsSTK
    If dtlAddMode = True Then
        .ClearDtl
    Else
        .GetDtlData mJisStkCode, mJisStkICode
    End If
    .mStkSno_int = Val(UnMyNumFmt(mskJisSno.Text))
    .mStkVtmCode_lng = Val(fcmbVtmName.BoundText)
    .mStkPrefix_str = txtJisPrefix.Text
    .mStkVchNo_lng = Val(UnMyNumFmt(mskJisVchNo.Text))
    .mStkPostfix_str = ""
    .mStkDate_dt = Ctod(dtpJisDate.Text)
    .mStkItmCode_lng = Val(mskJisItmCode.Text)
    .mStkItmRefCode_lng = Val(fcmbSimRefNo.BoundText)
    .mStkItmRef1Name_str = txtJisSimRefNo.Text
    .mStkItmRef2Name_str = ""
    .mStkQty_dbl = ToIssueQty(Val(UnMyNumFmt(mskJisQty.Text)))
    .mStkRate_dbl = Val(UnMyNumFmt(mskJisRate.Text))
    .mStkValue_dbl = Val(UnMyNumFmt(mskJisAmount.Text))
    .mStkNarr_str = ""
    .mStkAutoGen_bln = True
    .mStkCmpCode_int = sFinYrCmpCode
    If dtlAddMode = True Then
        If .AddNewDtl(mJisStkCode) = True Then          ''' , mNewItemRef:=False
            mJisStkICode = .mStkICode_lng
        End If
    Else
        .UpdateDtl mJisStkCode, mJisStkICode
    End If
    End With
    
    Rem updating StkICode in JobIssue
    With clsJIS
    If mJisICode > 0 And mJisStkICode > 0 And mJisItrCode > 0 Then
        If dtlAddMode = True Then
            .GetDtlData mJisCode, mJisICode
            
            .mJisStkICode_lng = mJisStkICode
            .UpdateDtl mJisCode, mJisICode
        Else
        End If
    End If
    End With
    
    RefreshDatabase dbGtdDatabase
    ChkAnyExcessIsuExist mJisICode
    ChkAnyMisLinkedRcExist mJisICode
    
    With tRecset
    .Open "Select * from JobIssu where JisCode=" & CStr(mJisCode) & " and JisICode=" & CStr(mJisICode) & "", dbGtdDatabase, adOpenKeyset, adLockOptimistic
    
    clsSIM.GetData .fields("JisSimCode")
    
    Mfgrd2.TextMatrix(srow, X2JISICODE_COL) = .fields("JisICode")
    Mfgrd2.TextMatrix(srow, X2JISSTKICODE_COL) = .fields("JisStkICode")
    Mfgrd2.TextMatrix(srow, X2JISSNO_COL) = ToMyNumFmt(.fields("JisSno"), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2SIMNAME_COL) = clsSIM.mName_str
    Mfgrd2.TextMatrix(srow, X2JISSIMREFNO_COL) = .fields("JisSimRefNo")
    Mfgrd2.TextMatrix(srow, X2JISNARR_COL) = .fields("JisNarr")
    Mfgrd2.TextMatrix(srow, X2JISQTY_COL) = ToMyNumFmt(.fields("JisQty"), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2JISRATE_COL) = ToMyNumFmt(.fields("JisRate"))
    Mfgrd2.TextMatrix(srow, X2JISAMOUNT_COL) = ToMyNumFmt(.fields("JisAmount"))
    Mfgrd2.TextMatrix(srow, X2JISSIMCODE_COL) = .fields("JisSimCode")
    Mfgrd2.TextMatrix(srow, X2JISITMCODE_COL) = .fields("JisItmCode")
    Mfgrd2.TextMatrix(srow, X2JISITRCODE_COL) = .fields("JisItrCode")
    Mfgrd2.TextMatrix(srow, X2JISJRCCODE_COL) = .fields("JisJrcCode")
    Mfgrd2.TextMatrix(srow, X2JISJRCICODE_COL) = .fields("JisJrcICode")
    Mfgrd2.TextMatrix(srow, X2JISRECSTATE_COL) = .fields("JisRecState")
    
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

If optDetailed.Value = True Then
    txtSearch1Text_InterActiveChange Format(Ctod(dtpJisDate.Text), "yyyymmdd") + Format(mJisCode, "0000000")
ElseIf optMonthwise.Value = True Then
    txtSearch1Text_InterActiveChange Format(Ctod(dtpJisDate.Text), "yyyy") & "/" & Format(Ctod(dtpJisDate.Text), "mm")
ElseIf optDatewise.Value = True Then
    txtSearch1Text_InterActiveChange Format(Ctod(dtpJisDate.Text), "yyyymmdd")
ElseIf optPartywise.Value = True Then
    txtSearch1Text_InterActiveChange txtPrtName.Text
End If

Call ShowEntryMode(False)
Mfgrd1.SetFocus

End Sub

Private Sub cmdSaveForm_GotFocus()
Dim mJisAcsPermNo As Integer, mRetryCount As Integer

txtVoid.SetFocus
cmdSaveForm.Enabled = False
If Data_Verify() = True Then
    If CanAccept() = True Then
        If GetAccessPerm(mJisAcsPermNo, mRetryCount, mFormAcsPermFileName) = True And mRetryCount = 0 Then
            If Data_NetwAuth() = True Then
                Call cmdSaveForm_Click
                Close #mJisAcsPermNo
                If mRemoteAccess = True Then
                    ''Unload Me
                    Me.Hide
                    Exit Sub
                End If
            Else
                Close #mJisAcsPermNo
            End If
        Else
            Close #mJisAcsPermNo
            AlertBox "System Busy, Try Again !!!"
            
            txtPrtName.SetFocus
        End If
    Else
        txtPrtName.SetFocus
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

Private Sub dtpJisDate_GotFocus()
FlashActiveControl dtpJisDate, True
End Sub

Private Sub dtpJisDate_LostFocus()
FlashActiveControl dtpJisDate, False
End Sub

Private Sub dtpJisDate_Validate(Cancel As Boolean)
dtpJisDate.Text = ToMyDate(dtpJisDate.Text)
If IsFinYrDate(Ctod(dtpJisDate.Text)) = False Then
    ErrorBox "Invalid Input !!!"
    dtpJisDate.SetFocus
    Cancel = True
End If

End Sub

Private Sub dtpJisTrnRefDt_GotFocus()
FlashActiveControl dtpJisTrnRefDt, True
End Sub

Private Sub dtpJisTrnRefDt_LostFocus()
FlashActiveControl dtpJisTrnRefDt, False
End Sub

Private Sub dtpJisTrnRefDt_Validate(Cancel As Boolean)
dtpJisTrnRefDt.Text = ToMyDate(dtpJisTrnRefDt.Text)

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
        If mJisCode = 0 Then
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
    RefreshDatabase dbGtdDatabase
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

mFormUIdFileName = "JobIssu.Uid"
mFormAcsPermFileName = "JobIssu.Acp"
mFormUIdCode = GetUIdCode(mProcess:=Me.Name, mUIdFileName:=mFormUIdFileName, mAcsPermFileName:=mFormAcsPermFileName)
If mFormUIdCode = 0 Then
    ErrorBox cSYSBUSY_ACS_DENIED
    Unload Me
End If

mFormLoaded = False
mEntrySaved = False: mEntryAborted = False
SetFormSize Me, frmMain
Call Form_Resize

Call SetVoidControl(txtVoid)
txtSearch1Text.Enabled = False
frConfigure.Visible = False

OpenAcDataSource dbAcDatabase
OpenStDataSource dbStDatabase
OpenGtdDataSource dbGtdDatabase
OpenGrpDataSource dbGrpDatabase
OpenComDataSource dbComDatabase

Set clsListStru = New clsSelectQueryStructure

Set clsSTK = New clsStockJrn
Set clsSTK.dbStDatabase = dbStDatabase
Set clsSTK.dbGrpDatabase = dbGrpDatabase

Set clsAH = New clsAccountHead
Set clsAH.dbAcDatabase = dbAcDatabase
Set clsAH.dbGrpDatabase = dbGrpDatabase

Set clsJIS = New clsGtdMultiTranEntry
Set clsJIS.dbAcDatabase = dbAcDatabase
Set clsJIS.dbStDatabase = dbStDatabase
Set clsJIS.dbGtdDatabase = dbGtdDatabase
clsJIS.blnJobIssueTran = True
clsJIS.Init

Set clsPRT = New clsGtdMasterEntry
Set clsPRT.dbAcDatabase = dbAcDatabase
Set clsPRT.dbGtdDatabase = dbGtdDatabase
clsPRT.blnPartyMast = True
clsPRT.Init

Set clsSIM = New clsGtdMasterEntry
Set clsSIM.dbGtdDatabase = dbGtdDatabase
Set clsSIM.dbStDatabase = dbStDatabase
clsSIM.blnSubItmMast = True
clsSIM.Init

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
fcmbVtmName.mListSqlExpr = "Select * from VTypMast where VtmSysCode=" & CStr(cCOM_VTYPE_SALES) & " order by VtmName"
fcmbVtmName.Init

Set fcmbSimName = New clsGtdFlexSearch
Set fcmbSimName.dbGtdDatabase = dbGtdDatabase
Set fcmbSimName.dbComDatabase = dbComDatabase
fcmbSimName.blnSubItmMastList = True
fcmbSimName.Init

Set fcmbSimRefNo = New clsGtdFlexSearch
Set fcmbSimRefNo.dbGtdDatabase = dbGtdDatabase
Set fcmbSimRefNo.dbComDatabase = dbComDatabase
fcmbSimRefNo.mFiltCond = "True=False"
fcmbSimRefNo.blnBalSimRefNoList = True
fcmbSimRefNo.Init

Set fcmbPrtName = New clsGtdFlexSearch
Set fcmbPrtName.dbGtdDatabase = dbGtdDatabase
Set fcmbPrtName.dbComDatabase = dbComDatabase
fcmbPrtName.blnPartyMastList = True
fcmbPrtName.Init

Call RestoreDefaultSmryPara
If mRemoteAccess = True Then
    optDetailed.Value = True
    AddSmryParaLayer mClear:=True
End If

If mRemoteAccess = True Then
    datRecset.Open "Select * from JobIsHdr inner join PartyMast on JobIsHdr.JihPrtCode=PartyMast.PrtCode where JihCode=" & CStr(mJisCode) & " order by JihDate,JihTime", dbGtdDatabase, adOpenKeyset, adLockOptimistic
Else
    datRecset.Open "Select * from JobIsHdr inner join PartyMast on JobIsHdr.JihPrtCode=PartyMast.PrtCode order by JihDate,JihTime", dbGtdDatabase, adOpenKeyset, adLockOptimistic
End If
Mfgrd1.FixedCols = 0
Call SmryList

Mfgrd2.FixedRows = 1: Mfgrd2.FixedCols = 0: Mfgrd2.Rows = 2: Mfgrd2.Cols = MFGRD2_COLS
colcnt = X2JISICODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2JISICODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2JISSNO_COL: Mfgrd2.ColWidth(colcnt) = mskJisSno.Width: Mfgrd2.TextMatrix(0, colcnt) = "Sno": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SIMNAME_COL: Mfgrd2.ColWidth(colcnt) = txtSimName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Item Name": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2JISSIMREFNO_COL: Mfgrd2.ColWidth(colcnt) = txtJisSimRefNo.Width: Mfgrd2.TextMatrix(0, colcnt) = "Ref.No": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2JISNARR_COL: Mfgrd2.ColWidth(colcnt) = txtJisNarr.Width: Mfgrd2.TextMatrix(0, colcnt) = "Description": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2JISQTY_COL: Mfgrd2.ColWidth(colcnt) = mskJisQty.Width: Mfgrd2.TextMatrix(0, colcnt) = "Unit": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2JISRATE_COL: Mfgrd2.ColWidth(colcnt) = mskJisRate.Width: Mfgrd2.TextMatrix(0, colcnt) = "Rate": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2JISAMOUNT_COL: Mfgrd2.ColWidth(colcnt) = mskJisAmount.Width: Mfgrd2.TextMatrix(0, colcnt) = "Amount": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2JISSIMCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2JISSIMCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2JISITMCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2JISITMCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2JISITRCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2JISITRCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2JISSTKICODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2JISSTKICODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2JISJRCCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2JISJRCCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2JISJRCICODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2JISJRCICODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2JISRECSTATE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2JISRECSTATE_COL": Mfgrd2.ColAlignment(colcnt) = 7

colcnt = X2JISSNO_COL: mskJisSno.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2SIMNAME_COL: txtSimName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2JISSIMREFNO_COL: txtJisSimRefNo.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2JISNARR_COL: txtJisNarr.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2JISQTY_COL: mskJisQty.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2JISRATE_COL: mskJisRate.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2JISAMOUNT_COL: mskJisAmount.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
cmdOK.Left = mskJisAmount.Left + mskJisAmount.Width

lblJisQtyTot.Left = mskJisQty.Left - frFooter.Left: lblJisQtyTot.Width = mskJisQty.Width
lblJisAmountTot.Left = mskJisAmount.Left - frFooter.Left: lblJisAmountTot.Width = mskJisAmount.Width

ShowEntryMode False
VisibleControls False

End Sub

Private Sub Form_Resize()
lblFormHeading.Width = Me.Width
cmdFormEscape.Left = Me.Width - (cmdFormEscape.Width * 2)
cmdFormEnter.Left = Me.Width + cmdFormEscape.Width
frFormSmry.Left = (Me.Width - frFormSmry.Width) / 2: frFormSmry.Top = cmbFormEntryMode.Top + (cmbFormEntryMode.Height * 2)
frFormDtl.Left = (Me.Width - frFormDtl.Width) / 2: frFormDtl.Top = frFormSmry.Top

End Sub

Private Sub Form_Unload(Cancel As Integer)
Set clsSTK = Nothing
Set clsAH = Nothing
Set clsJIS = Nothing
Set clsPRT = Nothing
Set clsSIM = Nothing
Set clsARA = Nothing
Set clsSTN = Nothing
Set clsVTM = Nothing
Set fcmbPrtName = Nothing
Set fcmbVtmName = Nothing
Set fcmbSimName = Nothing
Set fcmbSimRefNo = Nothing
Set clsListStru = Nothing

CloseTable datRecset
CloseDataSource dbAcDatabase
CloseDataSource dbStDatabase
CloseDataSource dbGtdDatabase
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
Dim mOpgVchNo As Long, mJisVchNo As Long
Dim mJisAmountTot As Double

Data_Verify = False
If FormAddEditMode = cFORM_EDITMODE And Val(mskFormBoundField.Text) < 1 Then
    ErrorBox "Invalid Key Value !!!"
    txtPrtName.SetFocus
    GoTo EndSub
End If
If Val(fcmbPrtName.BoundText) < 1 Then
    ErrorBox "Invalid Party Selection !!!"
    txtPrtName.SetFocus
    GoTo EndSub
End If
Rem job issue validations
mJisVchNo = Val(UnMyNumFmt(mskJisVchNo.Text))
If mJisVchNo > 0 Then
    If mJisVchNo <> mJisVchNo_old Or Val(fcmbVtmName.BoundText) <> mJisVtmCode_old Or Ctod(dtpJisDate.Text) <> mJisDate_old Or FormAddEditMode = cFORM_ADDMODE Then
        If ChkIsDuplVTypeNo(dbGtdDatabase, dbAcDatabase, mTableName:="JobIsHdr", mChkFieldName:="JihVchNo", mChkFieldValue:=mJisVchNo, mKeyFieldName:="JihCode", mKeyFieldValue:=mJisCode, mVtmFieldName:="JihVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="JihCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="JihDate", mDateFieldValue:=Ctod(dtpJisDate.Text)) = True Then
            ErrorBox "Duplicate Voucher No. !!!"
            mskJisVchNo.SetFocus
            ' ---------------
            If FormAddEditMode = cFORM_ADDMODE Then
                mJisVchNo = GetNextVTypeNo(dbGtdDatabase, dbAcDatabase, dbComDatabase, mTableName:="JobIsHdr", mFieldName:="JihVchNo", mVtmFieldName:="JihVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="JihCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="JihDate", mDateFieldValue:=Ctod(dtpJisDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
            Else
                mJisVchNo = mJisVchNo_old
            End If
            mskJisVchNo.Text = ToMyNumFmt(mJisVchNo, mDecimals:=0)
            GoTo EndSub
        End If
    End If
Else
    ErrorBox "Invalid Input !!!"
    mskJisVchNo.SetFocus
    GoTo EndSub
End If
If IsDate(dtpJisDate.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpJisDate.SetFocus
    GoTo EndSub
Else
    If IsFinYrDate(Ctod(dtpJisDate.Text)) = False Then
        ErrorBox "Invalid Input !!!"
        dtpJisDate.SetFocus
        GoTo EndSub
    End If
End If
If TimeToMin(txtJisTime_str.Text) > cDAYMINUTES Then
    ErrorBox "Invalid Input !!!"
    txtJisTime_str.SetFocus
    GoTo EndSub
End If
If txtJisTrnRefNo.Text = "" Then
    ErrorBox "Invalid Input !!!"
    txtJisTrnRefNo.SetFocus
    GoTo EndSub
End If
If IsDate(dtpJisTrnRefDt.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpJisTrnRefDt.SetFocus
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
Exit Function

End Function

Private Function Data_NetwAuth() As Boolean
Dim mJisVchNo As Long
Data_NetwAuth = False

mJisVchNo = Val(UnMyNumFmt(mskJisVchNo.Text))
If mJisVchNo <> mJisVchNo_old Or Val(fcmbVtmName.BoundText) <> mJisVtmCode_old Or Ctod(dtpJisDate.Text) <> mJisDate_old Or FormAddEditMode = cFORM_ADDMODE Then
    If ChkIsDuplVTypeNo(dbGtdDatabase, dbAcDatabase, mTableName:="JobIsHdr", mChkFieldName:="JihVchNo", mChkFieldValue:=mJisVchNo, mKeyFieldName:="JihCode", mKeyFieldValue:=mJisCode, mVtmFieldName:="JihVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="JihCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="JihDate", mDateFieldValue:=Ctod(dtpJisDate.Text)) = True Then
        ErrorBox "Duplicate Voucher No. !!!"
        mskJisVchNo.SetFocus
        ' ---------------
        If FormAddEditMode = True Then
            mJisVchNo = GetNextVTypeNo(dbGtdDatabase, dbAcDatabase, dbComDatabase, mTableName:="JobIsHdr", mFieldName:="JihVchNo", mVtmFieldName:="JihVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="JihCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="JihDate", mDateFieldValue:=Ctod(dtpJisDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
        Else
            mJisVchNo = mJisVchNo_old
        End If
        mskJisVchNo.Text = ToMyNumFmt(mJisVchNo, mDecimals:=0)
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
Dim srow As Integer, mJisICode As Long, mJisStkICode As Long, mDeleteit As Boolean

srow = Mfgrd2.Row
mJisICode = Val(Mfgrd2.TextMatrix(srow, X2JISICODE_COL))
mJisStkICode = Val(Mfgrd2.TextMatrix(srow, X2JISSTKICODE_COL))

If MyDeleteKey(Shift, KeyCode, mCheckCtrlMask:=False) = True And mJisICode > 0 Then
    mDeleteit = True
    If mDeleteit = True Then
        mDeleteit = CanDelete()
    End If
    If mDeleteit = True Then
        clsJIS.DeleteDtl mJisCode, mJisICode
        clsSTK.DeleteDtl mJisStkCode, mJisStkICode
        
        ShowDtlData mJisCode
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
        mskJisSno.Text = ToMyNumFmt(FlexNextSeqno(Mfgrd2, X2JISSNO_COL), mDecimals:=0)
        mskJisQty.Text = ToMyNumFmt(1, mDecimals:=0)
    Else
        mskJisICode.Text = Val(Mfgrd2.TextMatrix(srow, X2JISICODE_COL))
        mskJisStkICode.Text = Val(Mfgrd2.TextMatrix(srow, X2JISSTKICODE_COL))
        mskJisSno.Text = Mfgrd2.TextMatrix(srow, X2JISSNO_COL)
        fcmbSimName.BoundText = Mfgrd2.TextMatrix(srow, X2JISSIMCODE_COL): txtSimName.Text = fcmbSimName.Text
        mskJisItmCode.Text = Val(Mfgrd2.TextMatrix(srow, X2JISITMCODE_COL))
        ' --------------------
        Call ChkSimRefNoList
        ' ---------------------
        fcmbSimRefNo.BoundText = Mfgrd2.TextMatrix(srow, X2JISITRCODE_COL): txtJisSimRefNo.Text = fcmbSimRefNo.Text
        mskJisJrcCode.Text = Mfgrd2.TextMatrix(srow, X2JISJRCCODE_COL)
        mskJisJrcICode.Text = Mfgrd2.TextMatrix(srow, X2JISJRCICODE_COL)
        txtJisSimRefNo.Text = Mfgrd2.TextMatrix(srow, X2JISSIMREFNO_COL)
        txtJisNarr.Text = Mfgrd2.TextMatrix(srow, X2JISNARR_COL)
        mskJisQty.Text = Mfgrd2.TextMatrix(srow, X2JISQTY_COL)
        mskJisRate.Text = Mfgrd2.TextMatrix(srow, X2JISRATE_COL)
        mskJisAmount.Text = Mfgrd2.TextMatrix(srow, X2JISAMOUNT_COL)
    End If
    txtSimName.SetFocus
    Call ValidDtl
    
    mJisSimCode_old = Val(fcmbSimName.BoundText)
    mJisItmCode_old = Val(mskJisItmCode.Text)
    mJisItrCode_old = Val(fcmbSimRefNo.BoundText)
    mJisJrcCode_old = Val(mskJisJrcCode.Text)
    mJisJrcICode_old = Val(mskJisJrcICode.Text)
End If

End Sub

Private Sub Mfgrd2_RowColChange()
Rem nothing
End Sub

Private Sub mskJisAmount_GotFocus()
FlashActiveControl mskJisAmount, True
End Sub

Private Sub mskJisAmount_LostFocus()
FlashActiveControl mskJisAmount, False
End Sub

Private Sub mskJisAmount_Validate(Cancel As Boolean)
mskJisAmount.Text = ToMyNumFmt(mskJisAmount.Text)
If Val(UnMyNumFmt(mskJisAmount.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskJisAmount.SetFocus
    Cancel = True
End If
Call ValidDtl

End Sub

Rem discart this validation, instead use validation at job issue hdr level
Private Function chkJisAmount() As Boolean
Dim mRtnval As Boolean, srow As Integer, mJisAmount As Double

mRtnval = True
srow = Mfgrd2.Row
mJisAmount = Val(UnMyNumFmt(mskJisAmount.Text))

chkJisAmount = mRtnval

End Function

Private Sub mskJisRate_GotFocus()
FlashActiveControl mskJisRate, True
End Sub

Private Sub mskJisRate_LostFocus()
FlashActiveControl mskJisRate, False
End Sub

Private Sub mskJisRate_Validate(Cancel As Boolean)
mskJisRate.Text = ToMyNumFmt(mskJisRate.Text)
If Val(UnMyNumFmt(mskJisRate.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskJisRate.SetFocus
    Cancel = True
Else
    Call CalcJisChg
End If
Call ValidDtl

End Sub

Private Sub mskJisQty_GotFocus()
FlashActiveControl mskJisQty, True
End Sub

Private Sub mskJisQty_LostFocus()
FlashActiveControl mskJisQty, False
End Sub

Private Sub mskJisQty_Validate(Cancel As Boolean)
mskJisQty.Text = ToMyNumFmt(mskJisQty.Text, mDecimals:=0)
If Val(UnMyNumFmt(mskJisQty.Text)) <= 0 Then
    ErrorBox "Invalid Input !!!"
    mskJisQty.SetFocus
    Cancel = True
Else
    Call CalcJisChg
End If
Call ValidDtl

End Sub

Private Sub mskJisVchNo_GotFocus()
FlashActiveControl mskJisVchNo, True
End Sub

Private Sub mskJisVchNo_LostFocus()
FlashActiveControl mskJisVchNo, False
End Sub

Private Sub mskJisVchNo_Validate(Cancel As Boolean)
Dim mJisVchNo As Long
mJisVchNo = Val(UnMyNumFmt(mskJisVchNo.Text))
If mJisVchNo < 0 Then
    mJisVchNo = GetNextVTypeNo(dbGtdDatabase, dbAcDatabase, dbComDatabase, mTableName:="JobIsHdr", mFieldName:="JihVchNo", mVtmFieldName:="JihVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="JihCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="JihDate", mDateFieldValue:=Ctod(dtpJisDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
    mskJisVchNo.Text = ToMyNumFmt(mJisVchNo, mDecimals:=0)
ElseIf mJisVchNo > 0 Then
    If mJisVchNo <> mJisVchNo_old Or Val(fcmbVtmName.BoundText) <> mJisVtmCode_old Or Ctod(dtpJisDate.Text) <> mJisDate_old Or FormAddEditMode = cFORM_ADDMODE Then
        If ChkIsDuplVTypeNo(dbGtdDatabase, dbAcDatabase, mTableName:="JobIsHdr", mChkFieldName:="JihVchNo", mChkFieldValue:=mJisVchNo, mKeyFieldName:="JihCode", mKeyFieldValue:=mJisCode, mVtmFieldName:="JihVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="JihCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="JihDate", mDateFieldValue:=Ctod(dtpJisDate.Text)) = True Then
            ErrorBox "Duplicate Voucher No. !!!"
            Cancel = True
            mskJisVchNo.SetFocus
            ' ----------
            If FormAddEditMode = cFORM_ADDMODE Then
                mJisVchNo = GetNextVTypeNo(dbGtdDatabase, dbAcDatabase, dbComDatabase, mTableName:="JobIsHdr", mFieldName:="JihVchNo", mVtmFieldName:="JihVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="JihCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="JihDate", mDateFieldValue:=Ctod(dtpJisDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
            Else
                mJisVchNo = mJisVchNo_old
            End If
            mskJisVchNo.Text = ToMyNumFmt(mJisVchNo, mDecimals:=0)
        End If
    End If
    If Cancel = False Then
        mskJisVchNo.Text = ToMyNumFmt(mJisVchNo, mDecimals:=0)
    End If
Else
    ErrorBox "Invalid Input !!!"
    mskJisVchNo.SetFocus
    Cancel = True
End If

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

Private Sub optPartywise_GotFocus()
FlashActiveControl optPartywise, True
End Sub

Private Sub optPartywise_LostFocus()
FlashActiveControl optPartywise, False
End Sub

Private Sub txtAraName_GotFocus()
FlashActiveControl txtAraName, True
End Sub

Private Sub txtAraName_LostFocus()
FlashActiveControl txtAraName, False
End Sub

Private Sub txtJisSimRefNo_Change()
If fcmbSimRefNo.CallFromText_Change = False Then
    fcmbSimRefNo.CallFromText_Change = True
    If InterActiveChange(txtJisSimRefNo) = True Then
        fcmbSimRefNo.UserText = Array(txtJisSimRefNo.Text, txtJisSimRefNo.SelStart)
        fcmbSimRefNo.Show
        txtJisSimRefNo.Text = fcmbSimRefNo.Text
        If fcmbSimRefNo.ListSelected = True Then
            SendKeys "{TAB}"
        End If
    End If
    fcmbSimRefNo.CallFromText_Change = False
End If

End Sub

Private Sub txtJisSimRefNo_GotFocus()
FlashActiveControl txtJisSimRefNo, True
End Sub

Private Sub txtJisSimRefNo_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtJisSimRefNo_Change
End If

End Sub

Private Sub txtJisSimRefNo_LostFocus()
FlashActiveControl txtJisSimRefNo, False
End Sub

Private Sub txtJisSimRefNo_Validate(Cancel As Boolean)
Dim tRecset As New ADODB.Recordset

If Val(fcmbSimRefNo.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    txtJisSimRefNo.SetFocus
    Cancel = True
Else
    If FormAddEditMode = cFORM_ADDMODE Or dtlAddMode = True Or Val(fcmbSimName.BoundText) <> mJisSimCode_old Or Val(mskJisItmCode.Text) <> mJisItmCode_old Or Val(fcmbSimRefNo.BoundText) <> mJisItrCode_old Then
        With tRecset
        .Open "Select * from JobRcpt jrc inner join JobRcHdr jrh on jrc.JrcCode=jrh.JrhCode where jrc.JrcPrtCode=" & CStr(Val(fcmbPrtName.BoundText)) & " and jrc.JrcSimCode=" & CStr(Val(fcmbSimName.BoundText)) & " and jrc.JrcItmCode=" & CStr(Val(mskJisItmCode.Text)) & " and jrc.JrcItrCode=" & CStr(Val(fcmbSimRefNo.BoundText)) & "", dbGtdDatabase, adOpenKeyset, adLockOptimistic
        mskJisJrcCode.Text = .fields("JrcCode")
        mskJisJrcICode.Text = .fields("JrcICode")
        End With
        CloseTable tRecset
    End If
End If
Call ValidDtl

End Sub

Private Sub txtJisTrnRefNo_GotFocus()
FlashActiveControl txtJisTrnRefNo, True
End Sub

Private Sub txtJisTrnRefNo_LostFocus()
FlashActiveControl txtJisTrnRefNo, False
End Sub

Private Sub txtJisTrnRefNo_Validate(Cancel As Boolean)
If txtJisTrnRefNo.Text = "" Then
    ErrorBox "Invalid Input !!!"
    txtJisTrnRefNo.SetFocus
    Cancel = True
End If

End Sub

Private Sub txtJihRemark_GotFocus()
FlashActiveControl txtJihRemark, True
End Sub

Private Sub txtJihRemark_LostFocus()
FlashActiveControl txtJihRemark, False
End Sub

Private Sub txtJihRemark_Validate(Cancel As Boolean)
txtJihRemark.Text = ToMyWord(txtJihRemark.Text)
End Sub

Private Sub txtJisTime_str_GotFocus()
FlashActiveControl txtJisTime_str, True
End Sub

Private Sub txtJisTime_str_LostFocus()
FlashActiveControl txtJisTime_str, False
End Sub

Private Sub txtJisTime_str_Validate(Cancel As Boolean)
txtJisTime_str.Text = MinToTime(TimeToMin(txtJisTime_str.Text))
If TimeToMin(txtJisTime_str.Text) > cDAYMINUTES Then
    ErrorBox "Invalid Input !!!"
    txtJisTime_str.SetFocus
    Cancel = True
End If

End Sub

Private Sub txtVtmName_Change()
If fcmbVtmName.CallFromText_Change = False Then
    fcmbVtmName.CallFromText_Change = True
    If InterActiveChange(txtVtmName) = True Then
        fcmbVtmName.UserText = Array(txtVtmName.Text, txtVtmName.SelStart)
        fcmbVtmName.Show
        txtVtmName.Text = fcmbVtmName.Text
        If fcmbVtmName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbVtmName.CallFromText_Change = False
End If

End Sub

Private Sub txtVtmName_GotFocus()
FlashActiveControl txtVtmName, True

End Sub

Private Sub txtVtmName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtVtmName_Change
ElseIf MyAddNewKey(Shift, KeyCode) = True Then

ElseIf Shift = 0 And KeyCode = vbKeyF6 Then
    Rem Call ShowOldOpgListByOpgNo show here all job issue details
End If

End Sub

Private Sub txtVtmName_LostFocus()
FlashActiveControl txtVtmName, False
End Sub

Private Sub txtVtmName_Validate(Cancel As Boolean)
Dim mJisVchNo As Long

If Val(fcmbVtmName.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    txtVtmName.SetFocus
    Cancel = True
Else
    If Val(fcmbVtmName.BoundText) <> mJisVtmCode_old Or Ctod(dtpJisDate.Text) <> mJisDate_old Or FormAddEditMode = cFORM_ADDMODE Then
        mJisVchNo = GetNextVTypeNo(dbGtdDatabase, dbAcDatabase, dbComDatabase, mTableName:="JobIsHdr", mFieldName:="JihVchNo", mVtmFieldName:="JihVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="JihCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="JihDate", mDateFieldValue:=Ctod(dtpJisDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
        mskJisVchNo.Text = ToMyNumFmt(mJisVchNo, mDecimals:=0)
    End If
End If

End Sub

Private Sub txtPrtAddr_GotFocus()
FlashActiveControl txtPrtAddr, True
End Sub

Private Sub txtPrtAddr_LostFocus()
FlashActiveControl txtPrtAddr, False
End Sub

Private Sub txtPrtName_Change()
If fcmbPrtName.CallFromText_Change = False Then
    fcmbPrtName.CallFromText_Change = True
    If InterActiveChange(txtPrtName) = True Then
        fcmbPrtName.UserText = Array(txtPrtName.Text, txtPrtName.SelStart)
        fcmbPrtName.Show
        txtPrtName.Text = fcmbPrtName.Text
        If fcmbPrtName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbPrtName.CallFromText_Change = False
End If

End Sub

Private Sub txtPrtName_GotFocus()
FlashActiveControl txtPrtName, True

End Sub

Private Sub txtPrtName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtPrtName_Change
End If

End Sub

Private Sub txtPrtName_LostFocus()
FlashActiveControl txtPrtName, False
End Sub

Private Sub txtPrtName_Validate(Cancel As Boolean)
If Val(fcmbPrtName.BoundText) < 1 Then
    ErrorBox "Invalid Party Selection !!!"
    Cancel = True
    txtPrtName.SetFocus
ElseIf ChkAnyMisLinkedRcExist() = True Then
    ErrorBox "Invalid Party Selection !!!"
    Cancel = True
    txtPrtName.SetFocus
    
    fcmbPrtName.BoundText = CStr(mJisPrtCode_old)
    txtPrtName.Text = fcmbPrtName.Text
Else
    ShowPartyData Val(fcmbPrtName.BoundText)
End If

End Sub

Private Sub ShowPartyData(ByVal mJisPrtCode As Long)
Dim tRecset As New ADODB.Recordset

txtPrtAddr.Text = ""
txtAraName.Text = ""
txtStnName.Text = ""
txtPrtTelNo.Text = ""
txtPrtSMSNo.Text = ""

With tRecset
.Open "Select * from (PartyMast prt inner join AreaMast ara on prt.PrtAraCode=ara.AraCode) inner join StsnMast stn on prt.PrtStnCode=stn.StnCode where prt.PrtCode=" & CStr(mJisPrtCode) & "", dbComDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    txtPrtAddr.Text = .fields("PrtAddr")
    txtAraName.Text = .fields("AraName")
    txtStnName.Text = .fields("StnName")
    txtPrtTelNo.Text = .fields("PrtTelNo")
    txtPrtSMSNo.Text = .fields("PrtSMSNo")
End If
End With
CloseTable tRecset

End Sub

Private Sub Data_AddEvent()
If clsJIS.BeginTran(0) = False Then
    Exit Sub
ElseIf clsSTK.BeginStock(0) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_ADDMODE

clsJIS.ClearHdr: clsJIS.ClearDtl
clsSTK.ClearHdr

mJisCode = clsJIS.ActiveTrnCode
mJisStkCode = clsSTK.ActiveStkCode

ShowJisData mJisCode
ShowStkData mJisStkCode

Rem restoring user editing features
Call ShowJisDefData

Rem old values
Call StoreJisOldData
Call StoreStkOldData

Call ShowEntryMode(True)
txtPrtName.SetFocus

End Sub

Private Sub Data_EditEvent()

If clsJIS.BeginTran(datRecset.fields("JihCode")) = False Then
    Exit Sub
ElseIf clsSTK.BeginStock(datRecset.fields("JihStkCode")) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_EDITMODE

With datRecset
mJisCode = .fields("JihCode")
mJisStkCode = .fields("JihStkCode")

End With

ShowJisData mJisCode
ShowStkData mJisStkCode

Rem old values
Call StoreJisOldData
Call StoreStkOldData

Call ShowEntryMode(True)
txtPrtName.SetFocus

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

Private Sub ShowJisData(ByVal mJisCode As Long)
With clsJIS
.GetHdrData mJisCode

mskFormBoundField.Text = mJisCode
fcmbPrtName.BoundText = CStr(.mJihPrtCode_lng): txtPrtName.Text = fcmbPrtName.Text
fcmbVtmName.BoundText = CStr(.mTrnVtmCode_lng): txtVtmName.Text = fcmbVtmName.Text
txtJisPrefix.Text = .mTrnPrefix_str
mskJisVchNo.Text = ToMyNumFmt(.mTrnVchNo_lng, mDecimals:=0)
dtpJisDate.Text = Dtoc(.mTrnDate_dt)
txtJisTime_str.Text = MinToTime(.mJihTime_lng)
txtJisTrnRefNo.Text = .mJihTrnRefNo_str
dtpJisTrnRefDt.Text = Dtoc(.mJihTrnRefDt_dt)
txtJihRemark.Text = .mJihRemark_str

ShowPartyData .mJihPrtCode_lng
Call ShowOldJisCodeDesc
End With

ShowDtlData mJisCode
Call ShowLinkTranDtl

End Sub

Private Sub ShowStkData(ByVal mJisStkCode As Long)
mskJisStkCode.Text = mJisStkCode

End Sub

Private Sub ShowJisDefData()
Dim tRecset As New ADODB.Recordset, t1Recset As New ADODB.Recordset, mJisVchNo As Long

With tRecset
.Open "Select top 1 * from JobIsHdr order by JihCode desc", dbGtdDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    dtpJisDate.Text = Dtoc(.fields("JihDate"))
    fcmbVtmName.BoundText = CStr(.fields("JihVtmCode"))
Else
    dtpJisDate.Text = Dtoc(DefaultEntryDate)
    With t1Recset
    .Open "Select top 1 * from VTypMast where VtmSysCode=" & CStr(cCOM_VTYPE_SALES) & "", dbAcDatabase, adOpenKeyset, adLockOptimistic
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

txtVtmName.Text = fcmbVtmName.Text
txtJisTime_str.Text = MinToTime(TimeToMin(DateTime.Time$))

mJisVchNo = GetNextVTypeNo(dbGtdDatabase, dbAcDatabase, dbComDatabase, mTableName:="JobIsHdr", mFieldName:="JihVchNo", mVtmFieldName:="JihVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="JihCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="JihDate", mDateFieldValue:=Ctod(dtpJisDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
mskJisVchNo.Text = ToMyNumFmt(mJisVchNo, mDecimals:=0)
dtpJisTrnRefDt.Text = Dtoc(DefaultEntryDate)

End Sub

Private Sub StoreJisOldData()
mJisCode_old = mJisCode
mJisPrtCode_old = Val(fcmbPrtName.BoundText)
mJisDate_old = Ctod(dtpJisDate.Text)
mJisTime_old = TimeToMin(txtJisTime_str.Text)
mJisVtmCode_old = Val(fcmbVtmName.BoundText)
mJisVchNo_old = Val(UnMyNumFmt(mskJisVchNo.Text))

End Sub

Private Sub StoreStkOldData()
mJisStkCode_old = mJisStkCode

End Sub

Private Sub ShowDtlData(ByVal mJisCode As Long)
Dim srow As Integer, tRecset As New ADODB.Recordset, mColCnt As Integer, mSdcCount As Integer

srow = 1
Mfgrd2.Rows = 2

With tRecset
.Open "Select * from JobIssu where JisCode=" & CStr(mJisCode) & " order by JisSno", dbGtdDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Do While .EOF = False
        If InList(.fields("JisRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
            clsSIM.GetData .fields("JisSimCode")
            
            Mfgrd2.TextMatrix(srow, X2JISICODE_COL) = .fields("JisICode")
            Mfgrd2.TextMatrix(srow, X2JISSTKICODE_COL) = .fields("JisStkICode")
            Mfgrd2.TextMatrix(srow, X2JISSNO_COL) = ToMyNumFmt(.fields("JisSno"), mDecimals:=0)
            Mfgrd2.TextMatrix(srow, X2SIMNAME_COL) = clsSIM.mName_str
            Mfgrd2.TextMatrix(srow, X2JISSIMREFNO_COL) = .fields("JisSimRefNo")
            Mfgrd2.TextMatrix(srow, X2JISNARR_COL) = .fields("JisNarr")
            Mfgrd2.TextMatrix(srow, X2JISQTY_COL) = ToMyNumFmt(.fields("JisQty"), mDecimals:=0)
            Mfgrd2.TextMatrix(srow, X2JISRATE_COL) = ToMyNumFmt(.fields("JisRate"))
            Mfgrd2.TextMatrix(srow, X2JISAMOUNT_COL) = ToMyNumFmt(.fields("JisAmount"))
            Mfgrd2.TextMatrix(srow, X2JISSIMCODE_COL) = .fields("JisSimCode")
            Mfgrd2.TextMatrix(srow, X2JISITMCODE_COL) = .fields("JisItmCode")
            Mfgrd2.TextMatrix(srow, X2JISITRCODE_COL) = .fields("JisItrCode")
            Mfgrd2.TextMatrix(srow, X2JISJRCCODE_COL) = .fields("JisJrcCode")
            Mfgrd2.TextMatrix(srow, X2JISJRCICODE_COL) = .fields("JisJrcICode")
            Mfgrd2.TextMatrix(srow, X2JISRECSTATE_COL) = .fields("JisRecState")
            
            Mfgrd2.Rows = Mfgrd2.Rows + 1
            srow = srow + 1
        Else
            If InList(.fields("JisRecState"), Array(cREC_CANCELED, cREC_DELETED)) = False Then
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

With clsJIS
If FormAddEditMode = cFORM_ADDMODE Then
    .ClearHdr
Else
    .GetHdrData mJisCode
End If
.mTrnDate_dt = Ctod(dtpJisDate.Text)
.mTrnVtmCode_lng = Val(fcmbVtmName.BoundText)
.mTrnPrefix_str = txtJisPrefix.Text
.mTrnVchNo_lng = Val(UnMyNumFmt(mskJisVchNo.Text))
.mTrnPostfix_str = ""
.mTrnCmpCode_int = sFinYrCmpCode

.mJihStkCode_lng = mJisStkCode
.mJihTime_lng = TimeToMin(txtJisTime_str.Text)
.mJihPrtCode_lng = Val(fcmbPrtName.BoundText)
.mJihTrnRefNo_str = txtJisTrnRefNo.Text
.mJihTrnRefDt_dt = Ctod(dtpJisTrnRefDt.Text)
.mJihQty_dbl = Val(UnMyNumFmt(lblJisQtyTot.Caption))
.mJihAmount_dbl = Val(UnMyNumFmt(lblJisAmountTot.Caption))
.mJihRemark_str = txtJihRemark.Text

If FormAddEditMode = cFORM_ADDMODE Then
    If .AddNewHdr() = True Then
        mskFormBoundField.Text = .mTrnCode_lng
        mJisCode = .mTrnCode_lng
    End If
Else
    .UpdateHdr mJisCode
End If
If .mTrnCode_lng > 0 Then   ' updated successfully
    With clsSTK
    If FormAddEditMode = cFORM_ADDMODE Then
        .ClearHdr
    Else
        .GetHdrData mJisStkCode
    End If
    .mShrVtmCode_lng = Val(fcmbVtmName.BoundText)
    .mShrPrefix_str = txtJisPrefix.Text
    .mShrVchNo_lng = Val(UnMyNumFmt(mskJisVchNo.Text))
    .mShrPostfix_str = ""
    .mShrDate_dt = Ctod(dtpJisDate.Text)
    .mShrQty_dbl = Val(UnMyNumFmt(lblJisQtyTot.Caption))
    .mShrValue_dbl = Val(UnMyNumFmt(lblJisAmountTot.Caption))
    .mShrNarr_str = "Automated Job Issue"
    .mShrAutoGen_bln = True
    .mShrCmpCode_int = sFinYrCmpCode
    If FormAddEditMode = cFORM_ADDMODE Then
        If .AddNewHdr() = True Then
            mskJisStkCode.Text = .mShrCode_lng
            mJisStkCode = .mShrCode_lng
        End If
    Else
        .UpdateHdr mJisStkCode
    End If
    If .mShrCode_lng > 0 Then
        If FormAddEditMode = cFORM_ADDMODE Then
            clsJIS.GetHdrData mJisCode
            clsJIS.mJihStkCode_lng = mJisStkCode
            
            dbGtdDatabase.BeginTrans
            dbGtdDatabase.Execute "Update JobIsHdr set JihStkCode=" & CStr(mJisStkCode) & " where JihCode=" & CStr(mJisCode)
            dbGtdDatabase.Execute "Update JobIssu set JisStkCode=" & CStr(mJisStkCode) & " where JisCode=" & CStr(mJisCode)
            dbGtdDatabase.CommitTrans
        End If
        clsJIS.UpdateTran mJisCode
        clsJIS.EndTran mJisCode
        
        .CommitStock mJisStkCode
        .EndStock mJisStkCode
        
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

If clsJIS.mTrnCode_lng > 0 Then   ' updated successfully
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
If (datRecset.EOF Or datRecset.BOF) = True Then
    Exit Sub
End If

mJisCode = datRecset.fields("JihCode")
mJisStkCode = datRecset.fields("JihStkCode")
mRecAbsPos = datRecset.AbsolutePosition

If clsJIS.CanDeleteTran(mJisCode) = True Then
    txtVoid.SetFocus
    If clsJIS.BeginTran(mJisCode) = True And clsSTK.BeginStock(mJisStkCode) = True Then
        clsJIS.DeleteTran mJisCode
        clsJIS.UpdateTran mJisCode
        clsJIS.EndTran mJisCode
        
        clsSTK.DeleteStock mJisStkCode
        clsSTK.CommitStock mJisStkCode
        clsSTK.EndStock mJisStkCode
        
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
clsJIS.CancelTran mJisCode
clsJIS.EndTran mJisCode

clsSTK.CancelStock mJisStkCode
clsSTK.EndStock mJisStkCode

mEntryAborted = True

End Sub

Private Sub txtPrtSMSNo_GotFocus()
FlashActiveControl txtPrtSMSNo, True
End Sub

Private Sub txtPrtSMSNo_LostFocus()
FlashActiveControl txtPrtSMSNo, False
End Sub

Private Sub txtPrtTelNo_GotFocus()
FlashActiveControl txtPrtTelNo, True
End Sub

Private Sub txtPrtTelNo_LostFocus()
FlashActiveControl txtPrtTelNo, False
End Sub

Private Sub SmryList()
Dim gcolcount As Integer, acount As Integer, mLow As Integer, mHigh As Integer, mPos As Integer, srow As Long, mColCount As Integer
Dim aAcntBal As Variant, mBal As Double

If datRecset.State = 1 Then
    CloseTable datRecset
End If
RefreshDatabase dbGtdDatabase
RefreshDatabase dbAcDatabase
RefreshDatabase dbGrpDatabase
RefreshDatabase dbComDatabase
clsListStru.Clear

If optMonthwise.Value = True Or optDatewise.Value = True Or optPartywise.Value = True Then
    If optMonthwise.Value = True Then
        clsListStru.AddFields mExpr:="JisYrMonth", mAttrib:=cFAT_SYSTEM
        clsListStru.AddFields mExpr:="JisMnYear", mTitle:="Month", mShowItem:=True, mAlign:=flexAlignLeftCenter, mWidth:=2000
        clsListStru.AddFields mExpr:="JisCount", mTitle:="Count", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="JisQty_sum", mTitle:="Qty", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="JisAmount_sum", mTitle:="Amount", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        
        datRecset.Open "Select format(JihDate,'yyyy/MM') as JisYrMonth" _
         & ",Count(JihCode) as JisCount" _
         & ",Sum(JihQty) as JisQty_sum" _
         & ",Sum(JihAmount) as JisAmount_sum" _
         & " from JobIsHdr" _
         & " where JihDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and JihCode>0" _
         & IIf(mQryPrtCode > 0, " and JihPrtCode=" & CStr(mQryPrtCode), "") _
         & " group by format(JihDate,'yyyy/MM')" _
         & " order by format(JihDate,'yyyy/MM')" _
         , dbGtdDatabase, adOpenKeyset, adLockReadOnly

    ElseIf optDatewise.Value = True Then
        clsListStru.AddFields mExpr:="JisDateYMD", mAttrib:=cFAT_SYSTEM
        clsListStru.AddFields mExpr:="JisDate", mTitle:="Date", mShowItem:=True, mAlign:=flexAlignLeftCenter, mWidth:=2000
        clsListStru.AddFields mExpr:="JisCount", mTitle:="Count", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="JisQty_sum", mTitle:="Qty", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="JisAmount_sum", mTitle:="Amount", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        
        datRecset.Open "Select JihDate" _
         & ",Count(JihCode) as JisCount" _
         & ",Sum(JihQty) as JisQty_sum" _
         & ",Sum(JihAmount) as JisAmount_sum" _
         & " from JobIsHdr" _
         & " where JihDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and JihCode>0" _
         & IIf(mQryPrtCode > 0, " and JihPrtCode=" & CStr(mQryPrtCode), "") _
         & " group by JihDate" _
         & " order by JihDate" _
         , dbGtdDatabase, adOpenKeyset, adLockReadOnly
        
    ElseIf optPartywise.Value = True Then
        clsListStru.AddFields mExpr:="PrtName", mTitle:="Party Name", mShowItem:=True, mAlign:=flexAlignLeftCenter, mWidth:=3000
        clsListStru.AddFields mExpr:="JisCount", mTitle:="Count", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="JisQty_sum", mTitle:="Qty", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="JisAmount_sum", mTitle:="Amount", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        
        datRecset.Open "Select PartyMast.PrtName,JobIsHdr.JihPrtCode" _
         & ",Count(JihCode) as JisCount" _
         & ",Sum(JihQty) as JisQty_sum" _
         & ",Sum(JihAmount) as JisAmount_sum" _
         & " from JobIsHdr inner join PartyMast on JobIsHdr.JihPrtCode=PartyMast.PrtCode" _
         & " where JihDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and JihCode>0" _
         & IIf(mQryPrtCode > 0, " and JihPrtCode=" & CStr(mQryPrtCode), "") _
         & " group by PartyMast.PrtName,JobIsHdr.JihPrtCode" _
         & " order by PartyMast.PrtName,JobIsHdr.JihPrtCode" _
         , dbGtdDatabase, adOpenKeyset, adLockReadOnly
    End If
    
ElseIf optDetailed.Value = True Then
    clsListStru.AddFields mExpr:="tJisSmryId", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="JisCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="VtmName", mTitle:="Voucher", mAlign:=flexAlignLeftCenter, mWidth:=1500, mShowItem:=True
    clsListStru.AddFields mExpr:="JisVchNo", mTitle:="Vchr.No", mAlign:=flexAlignRightCenter, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="JisDate", mTitle:="Date", mAlign:=flexAlignLeftCenter, mWidth:=1300, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="PrtCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="PrtName", mTitle:="Party Name", mAlign:=flexAlignLeftCenter, mWidth:=2500, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="JisQty", mTitle:="Qty", mAlign:=flexAlignRightCenter, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="JisAmount", mTitle:="Amount", mAlign:=flexAlignRightCenter, mWidth:=1250, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="PrtAddr", mTitle:="Address", mAlign:=flexAlignLeftCenter, mWidth:=2000, mShowItem:=True
    clsListStru.AddFields mExpr:="PatAraName", mTitle:="Area", mAlign:=flexAlignLeftCenter, mWidth:=1500, mShowItem:=True
    clsListStru.AddFields mExpr:="PatStnName", mTitle:="Station", mAlign:=flexAlignLeftCenter, mWidth:=1500, mShowItem:=True
    
    datRecset.Open "Select JobIsHdr.*,PartyMast.*" _
     & ",format(JihDate,'yyyymmdd')+format(JihCode,'0000000') as tJisSmryId" _
     & " from JobIsHdr inner join PartyMast on JobIsHdr.JihPrtCode=PartyMast.PrtCode" _
     & " where JihDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & IIf(mRemoteAccess = True, " and JihCode=" & CStr(mJisCode) & "", "") _
     & " and JihCode>0" _
     & IIf(mQryPrtCode > 0, " and JihPrtCode=" & CStr(mQryPrtCode), "") _
     & " order by JihDate,JihCode" _
     , dbGtdDatabase, adOpenKeyset, adLockReadOnly
    
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
        If optMonthwise.Value = True Or optDatewise.Value = True Or optPartywise.Value = True Then
            If optMonthwise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JisYrMonth")) = .fields("JisYrMonth")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JisMnYear")) = MonthName(Val(Right(.fields("JisYrMonth"), 2))) & "-" & Left(.fields("JisYrMonth"), 4)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JisCount")) = ToMyNumFmt(.fields("JisCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JisQty_sum")) = ToMyNumFmt(.fields("JisQty_sum"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JisAmount_sum")) = ToMyNumFmt(.fields("JisAmount_sum"))
                
            ElseIf optDatewise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JisDateYMD")) = Format(.fields("JihDate"), "yyyymmdd")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JisDate")) = Dtoc(.fields("JihDate"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JisCount")) = ToMyNumFmt(.fields("JisCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JisQty_sum")) = ToMyNumFmt(.fields("JisQty_sum"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JisAmount_sum")) = ToMyNumFmt(.fields("JisAmount_sum"))
                
            ElseIf optPartywise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PrtName")) = .fields("PrtName")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JisCount")) = ToMyNumFmt(.fields("JisCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JisQty_sum")) = ToMyNumFmt(.fields("JisQty_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JisAmount_sum")) = ToMyNumFmt(.fields("JisAmount_sum"))
                
            End If
        
        ElseIf optDetailed.Value = True Then
            clsARA.GetData .fields("PrtAraCode")
            clsSTN.GetData .fields("PrtStnCode")
            clsVTM.GetData .fields("JihVtmCode")
            
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("tJisSmryId")) = .fields("tJisSmryId") '''  Format(.fields("JihDate"), "yyyymmdd") & Format(.fields("JihCode"), "0000000")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JisCode")) = .fields("JihCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("VtmName")) = clsVTM.mName_str
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JisVchNo")) = .fields("JihVchNo")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JisDate")) = Dtoc(.fields("JihDate"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JisQty")) = ToMyNumFmt(.fields("JihQty"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JisAmount")) = ToMyNumFmt(.fields("JihAmount"))
            ' ------------------------------------
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PrtCode")) = .fields("PrtCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PrtName")) = .fields("PrtName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PrtAddr")) = .fields("PrtAddr")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PatAraName")) = clsARA.mName_str
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PatStnName")) = clsSTN.mName_str
        
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
    fcmbPrtName.BoundText = CStr(mQryPrtCode)
    txtQryPrtName.Text = fcmbPrtName.Text
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
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("tJisSmryId"), mText
    ElseIf optMonthwise.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("JisYrMonth"), mText
    ElseIf optDatewise.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("JisDateYMD"), mText
    ElseIf optPartywise.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("PrtName"), mText
    End If
End If
ShowActiveFlexRow Mfgrd1

End Sub

Private Sub txtQryPrtName_Change()
If fcmbPrtName.CallFromText_Change = False Then
    fcmbPrtName.CallFromText_Change = True
    If InterActiveChange(txtQryPrtName) = True Then
        fcmbPrtName.UserText = Array(txtQryPrtName.Text, txtQryPrtName.SelStart)
        fcmbPrtName.Show
        txtQryPrtName.Text = fcmbPrtName.Text
        mQryPrtCode = Val(fcmbPrtName.BoundText)
        If fcmbPrtName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbPrtName.CallFromText_Change = False
End If

End Sub

Private Sub txtQryPrtName_GotFocus()
FlashActiveControl txtQryPrtName, True
End Sub

Private Sub txtQryPrtName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtQryPrtName_Change
ElseIf MyAddNewKey(Shift, KeyCode) = True Then
    Rem not required
End If

End Sub

Private Sub txtQryPrtName_LostFocus()
FlashActiveControl txtQryPrtName, False
End Sub

Private Sub txtSearch1Text_GotFocus()
FlashActiveControl txtSearch1Text, True
End Sub

Private Sub txtSearch1Text_LostFocus()
FlashActiveControl txtSearch1Text, False
End Sub

Private Sub txtSimName_Change()
If fcmbSimName.CallFromText_Change = False Then
    fcmbSimName.CallFromText_Change = True
    If InterActiveChange(txtSimName) = True Then
        fcmbSimName.UserText = Array(txtSimName.Text, txtSimName.SelStart)
        fcmbSimName.Show
        txtSimName.Text = fcmbSimName.Text
        If fcmbSimName.ListSelected = True Then
            SendKeys "{TAB}"
        End If
    End If
    fcmbSimName.CallFromText_Change = False
End If

End Sub

Private Sub txtSimName_GotFocus()
FlashActiveControl txtSimName, True

End Sub

Private Sub txtSimName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtSimName_Change
End If

End Sub

Private Sub txtSimName_LostFocus()
FlashActiveControl txtSimName, False
End Sub

Private Sub txtSimName_Validate(Cancel As Boolean)
If Val(fcmbSimName.BoundText) <= 0 Then
    ErrorBox "Invalid Selection !!!"
    txtSimName.SetFocus
    Cancel = True
Else
    If FormAddEditMode = cFORM_ADDMODE Or dtlAddMode = True Or Val(fcmbSimName.BoundText) <> mJisSimCode_old Then
        clsSIM.GetData Val(fcmbSimName.BoundText)
        mskJisItmCode.Text = clsSIM.mSimItmCode_lng
        
        Call ChkSimRefNoList
    End If
End If
Call ValidDtl

End Sub

Private Sub txtStnName_GotFocus()
FlashActiveControl txtStnName, True
End Sub

Private Sub txtStnName_LostFocus()
FlashActiveControl txtStnName, False
End Sub

Private Sub CalcJisChg()
Dim mJisQty As Long, mJisRate As Double, mJisAmount As Double
mJisQty = Val(UnMyNumFmt(mskJisQty.Text))
mJisRate = Val(UnMyNumFmt(mskJisRate.Text))
mJisAmount = Round(mJisQty * mJisRate, 2)
' --------
mskJisAmount.Text = ToMyNumFmt(mJisAmount)

End Sub

Private Sub ShowOldJisCodeDesc()
Dim tRecset As New ADODB.Recordset, mJisDate As Date, mJisPrtCode As Long

mJisPrtCode = Val(fcmbPrtName.BoundText)
mJisDate = Ctod(dtpJisDate.Text)
With tRecset
If FormAddEditMode = cFORM_ADDMODE Then
    .Open "Select top 1 jih.*,vtm.VtmName from JobIsHdr jih inner join VTypMast vtm on jih.JihVtmCode=vtm.VtmCode where jih.JihPrtCode=" & CStr(mJisPrtCode) & " order by jih.JihDate Desc", dbComDatabase, adOpenKeyset, adLockOptimistic
Else
    .Open "Select top 1 jih.*,vtm.VtmName from JobIsHdr jih inner join VTypMast vtm on jih.JihVtmCode=vtm.VtmCode where jih.JihPrtCode=" & CStr(mJisPrtCode) & " and jih.JihCode<>" & CStr(mJisCode) & " and jih.JihDate<=#" & ToSysDate(mJisDate) & "#" & " order by jih.JihDate Desc", dbComDatabase, adOpenKeyset, adLockOptimistic
End If
If .RecordCount > 0 Then
    lblOldJisCodeDesc.Caption = RTrim(.fields("VtmName")) & " No.:" & CStr(.fields("JihVchNo")) & " Dated:" & Dtoc(.fields("JihDate"))
Else
    lblOldJisCodeDesc.Caption = "#" & CStr(mJisPrtCode) & "#"
End If
End With
CloseTable tRecset

End Sub

Private Sub VisibleControls(ByVal mShowItem As Boolean, Optional ByVal mRowPos)
Rem Important - dtlAddEditMode & dtlAddMode must be initialised prior to this
If Me.Visible = True Then
    txtVoid.SetFocus
End If
If IsMissing(mRowPos) = False Then
    Rem mskJisICode.Top = mRowPos
    Rem mskJisStkICode.Top = mRowPos
    mskJisSno.Top = mRowPos
    txtSimName.Top = mRowPos
    Rem mskJisItmCode.Top = mRowPos
    txtJisSimRefNo.Top = mRowPos
    Rem mskJisJrcCode.Top = mRowPos
    Rem mskJisJrcICode.Top = mRowPos
    txtJisNarr.Top = mRowPos
    mskJisQty.Top = mRowPos
    mskJisRate.Top = mRowPos
    mskJisAmount.Top = mRowPos
    cmdOK.Top = mRowPos
End If

mskJisICode.Text = 0
mskJisStkICode.Text = 0
mskJisSno.Text = 0
txtSimName.Text = "": fcmbSimName.BoundText = ""
mskJisItmCode.Text = 0
txtJisSimRefNo.Text = "": fcmbSimRefNo.BoundText = ""
mskJisJrcCode.Text = 0
mskJisJrcICode.Text = 0
txtJisNarr.Text = ""
mskJisQty.Text = ToMyNumFmt(0, mDecimals:=0)
mskJisRate.Text = ToMyNumFmt(0)
mskJisAmount.Text = ToMyNumFmt(0)

Call ValidDtl

mskJisICode.Visible = False     '''  mShowItem
mskJisStkICode.Visible = False     '''  mShowItem
mskJisSno.Visible = mShowItem
txtSimName.Visible = mShowItem
mskJisItmCode.Visible = False     '''  mShowItem
txtJisSimRefNo.Visible = mShowItem
mskJisJrcCode.Visible = False     '''  mShowItem
mskJisJrcICode.Visible = False     '''  mShowItem
txtJisNarr.Visible = mShowItem
mskJisQty.Visible = mShowItem
mskJisRate.Visible = mShowItem
mskJisAmount.Visible = mShowItem
cmdOK.Visible = mShowItem

frHeader.Enabled = (mShowItem = False)
Mfgrd2.Enabled = (mShowItem = False)
frFooter.Enabled = (mShowItem = False)
cmdSaveForm.Enabled = (mShowItem = False)

End Sub

Private Sub ValidDtl()
Dim mDataOk As Boolean, srow As Integer

srow = Mfgrd2.Row
mDataOk = (Trim(txtPrtName.Text) <> "" And Val(fcmbPrtName.BoundText) > 0 And Val(UnMyNumFmt(mskJisSno.Text)) > 0 And Trim(txtSimName.Text) <> "" And Val(fcmbSimName.BoundText) > 0 And Val(mskJisItmCode.Text) > 0 And Trim(txtJisSimRefNo.Text) <> "" And Val(fcmbSimRefNo.BoundText) > 0 And Val(mskJisJrcCode.Text) > 0 And Val(mskJisJrcICode.Text) > 0 And Val(UnMyNumFmt(mskJisQty.Text)) > 0)

cmdOK.Caption = IIf(mDataOk = True, "&OK", "&Cancel")
cmdOK.BackColor = IIf(mDataOk = True, &H80FF80, &H8080FF)
End Sub

Private Sub CalcFtrTotal(Optional ByVal mCalcBalOnly As Boolean = False)
Dim mJisQtyTot As Double, mJisAmountTot As Double

mJisQtyTot = FlexColSum(Mfgrd2, X2JISQTY_COL)
mJisAmountTot = FlexColSum(Mfgrd2, X2JISAMOUNT_COL)

lblJisQtyTot.Caption = ToMyNumFmt(mJisQtyTot, mDecimals:=0)
lblJisAmountTot.Caption = ToMyNumFmt(mJisAmountTot)

End Sub

Private Sub ShowLinkTranDtl()
Dim tRecset As New ADODB.Recordset, mLinkTranStr As String

mLinkTranStr = ""

With tRecset
.Open "Select * from ((((JobIssu jis" _
    & " inner join JobIsHdr jih on jis.JisCode=jih.JihCode)" _
    & " inner join JobRcpt jrc on jis.JisJrcICode=jrc.JrcICode)" _
    & " inner join JobRcHdr jrh on jrc.JrcCode=jrh.JrhCode)" _
    & " inner join SubItmMast sim on jrc.JrcSimCode=sim.SimCode)" _
    & " inner join VTypMast vtm on jrh.JrhVtmCode=vtm.VtmCode" _
    & " where JisCode=" & CStr(mJisCode) _
    & " order by JrcDate,JrcCode,JrcSno" _
    , dbComDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    Do While .EOF = False
        mLinkTranStr = mLinkTranStr & .fields("VtmName") & " No." & CStr(.fields("JrhVchNo")) & " Dt." & Dtoc(.fields("JrhDate")) & " It." & .fields("SimName") & " Rf." & .fields("JrcSimRefNo") & " Qty." & ToMyNumFmt(.fields("JrcQty"), mDecimals:=0) & vbCrLf
    
        .MoveNext
    Loop
End If
End With
CloseTable tRecset

lblLinkTranDesc.Caption = mLinkTranStr

End Sub

Private Sub ChkSimRefNoList()
Rem important: below queries not almost same as in flexsearch class
fcmbSimRefNo.mBoundSqlExpr = "Select *,SimRefNo+'_'+format(ItrCode,'" & cLONGCODESTRFMT & "') as SimRefNoUnq from (" _
    & "Select SimRefNo,ItrCode,sum(Qty) as Qty_sum from (" _
    & "Select JrcItrCode as ItrCode,JrcSimRefNo as SimRefNo,JrcQty as Qty from JobRcpt inner join JobRcHdr on JobRcpt.JrcCode=JobRcHdr.JrhCode where JrcPrtCode=" & CStr(Val(fcmbPrtName.BoundText)) & " and JrcSimCode=" & CStr(Val(fcmbSimName.BoundText)) & " and JrcItmCode=" & CStr(Val(mskJisItmCode.Text)) & " and JrcDate<=#" & CStr(ToSysDate(Ctod(dtpJisDate.Text))) & "#" _
    & " Union All " _
    & "Select JisItrCode as ItrCode,JisSimRefNo as SimRefNo,(JisQty*-1) as Qty from JobIssu" & IIf(FormAddEditMode = cFORM_EDITMODE, " inner join JobIsHdr on JobIssu.JisCode=JobIsHdr.JihCode", "") & " where JisPrtCode=" & CStr(Val(fcmbPrtName.BoundText)) & " and JisSimCode=" & CStr(Val(fcmbSimName.BoundText)) & " and JisItmCode=" & CStr(Val(mskJisItmCode.Text)) & " and JisICode<>" & CStr(Val(mskJisICode.Text)) & " and (JisRecState<>" & CStr(cREC_CANCELED) & " and JisRecState<>" & CStr(cREC_DELETED) & " and JisCode=" & CStr(mJisCode) & ")" _
    & ")" _
    & " group by ItrCode,SimRefNo order by ItrCode,SimRefNo" _
    & ")" _
    & " where Qty_sum>0"
fcmbSimRefNo.mListSqlExpr = "Select *,SimRefNo+'_'+format(ItrCode,'" & cLONGCODESTRFMT & "') as SimRefNoUnq from (" _
    & "Select SimRefNo,ItrCode,sum(Qty) as Qty_sum from (" _
    & "Select JrcItrCode as ItrCode,JrcSimRefNo as SimRefNo,JrcQty as Qty from JobRcpt inner join JobRcHdr on JobRcpt.JrcCode=JobRcHdr.JrhCode where JrcPrtCode=" & CStr(Val(fcmbPrtName.BoundText)) & " and JrcSimCode=" & CStr(Val(fcmbSimName.BoundText)) & " and JrcItmCode=" & CStr(Val(mskJisItmCode.Text)) & " and JrcDate<=#" & CStr(ToSysDate(Ctod(dtpJisDate.Text))) & "#" _
    & " Union All " _
    & "Select JisItrCode as ItrCode,JisSimRefNo as SimRefNo,(JisQty*-1) as Qty from JobIssu" & IIf(FormAddEditMode = cFORM_EDITMODE, " inner join JobIsHdr on JobIssu.JisCode=JobIsHdr.JihCode", "") & " where JisPrtCode=" & CStr(Val(fcmbPrtName.BoundText)) & " and JisSimCode=" & CStr(Val(fcmbSimName.BoundText)) & " and JisItmCode=" & CStr(Val(mskJisItmCode.Text)) & " and JisICode<>" & CStr(Val(mskJisICode.Text)) & " and (JisRecState<>" & CStr(cREC_CANCELED) & " and JisRecState<>" & CStr(cREC_DELETED) & " and JisCode=" & CStr(mJisCode) & ")" _
    & ")" _
    & " group by SimRefNo,ItrCode order by SimRefNo,ItrCode" _
    & ")" _
    & " where Qty_sum>0"
fcmbSimRefNo.ReInit

End Sub

Private Function ChkAnyPostRcExist() As Boolean
Dim tRecset As New ADODB.Recordset

ChkAnyPostRcExist = False

With tRecset
.Open "Select top 1 * from ((JobRcpt" _
    & " inner join JobRcHdr on JobRcpt.JrcCode=JobRcHdr.JrhCode)" _
    & " inner join JobIssu on JobRcpt.JrcICode=JobIssu.JisJrcICode)" _
    & " Inner Join JobIsHdr on JobIssu.JisCode=JobIsHdr.JihCode" _
    & " where JisCode=" & CStr(mJisCode) _
    & " and JrcDate>#" & CStr(ToSysDate(Ctod(dtpJisDate.Text))) & "#" _
    & " order by JrcDate,JrcCode" _
    , dbGtdDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    clsVTM.GetData .fields("JrhVtmCode")
    ErrorBox "Post Job Receipt Exist !!!" _
        & vbCrLf & clsVTM.mName_str & " No." & CStr(.fields("JrhVchNo")) & " Dated " & Dtoc(.fields("JrhDate")) & ""
    ChkAnyPostRcExist = True
End If
End With
CloseTable tRecset

End Function

Private Function ChkAnyMisLinkedRcExist(Optional ByVal mJisICode) As Boolean
Dim tRecset As New ADODB.Recordset, mMisLinkedDesc As String

ChkAnyMisLinkedRcExist = False
mMisLinkedDesc = ""

With tRecset
.Open "Select top 1 * from ((JobRcpt" _
    & " inner join JobRcHdr on JobRcpt.JrcCode=JobRcHdr.JrhCode)" _
    & " inner join JobIssu on JobRcpt.JrcICode=JobIssu.JisJrcICode)" _
    & " Inner Join JobIsHdr on JobIssu.JisCode=JobIsHdr.JihCode" _
    & " where JisCode=" & CStr(mJisCode) & IIf(IsMissing(mJisICode) = False, " and JisICode=" & CStr(mJisICode), "") _
    & " and (JrhPrtCode<>" & CStr(Val(fcmbPrtName.BoundText)) & " or JisSimCode<>JrcSimCode or JisItmCode<>JrcItmCode or JisItrCode<>JrcItrCode or JisSimRefNo<>JrcSimRefNo)" _
    & " order by JrhDate,JrhCode" _
    , dbGtdDatabase, adOpenKeyset, adLockOptimistic

If .EOF = False Then
    clsVTM.GetData .fields("JrhVtmCode")
    If .fields("JrhPrtCode") <> Val(fcmbPrtName.BoundText) Then
        mMisLinkedDesc = mMisLinkedDesc & "<Party Name>"
    End If
    If .fields("JisSimCode") <> .fields("JrcSimCode") Then
        mMisLinkedDesc = mMisLinkedDesc & "<Item Name>"
    End If
    If .fields("JisItmCode") <> .fields("JrcItmCode") Then
        mMisLinkedDesc = mMisLinkedDesc & "<Main Product Name>"
    End If
    If .fields("JisItrCode") <> .fields("JrcItrCode") Then
        mMisLinkedDesc = mMisLinkedDesc & "<Item Ref.Code>"
    End If
    If .fields("JisSimRefNo") <> .fields("JrcSimRefNo") Then
        mMisLinkedDesc = mMisLinkedDesc & "<Item Ref.No.>"
    End If
    ErrorBox "Mis-Linked Job Receipt Exist !!!" _
        & vbCrLf & clsVTM.mName_str & " No." & CStr(.fields("JrhVchNo")) & " Dated " & Dtoc(.fields("JrhDate")) _
        & vbCrLf & "Alteration made in " _
        & vbCrLf & mMisLinkedDesc
    ChkAnyMisLinkedRcExist = True
End If
End With
CloseTable tRecset

End Function

Private Function ChkAnyExcessIsuExist(Optional ByVal mJisICode) As Boolean
Dim tRecset As New ADODB.Recordset

ChkAnyExcessIsuExist = False

With tRecset
.Open "Select top 1 * from (" _
    & "Select JrcICode,SimCode,ItmCode,ItrCode,SimRefNo,sum(Qty) as Qty_sum from (" _
    & "Select JrcICode,JrcSimCode as SimCode,JrcItmCode as ItmCode,JrcItrCode as ItrCode,JrcSimRefNo as SimRefNo,JrcQty as Qty from (JobRcpt" _
    & " inner join JobRcHdr on JobRcpt.JrcCode=JobRcHdr.JrhCode)" _
    & " inner join JobIssu on JobRcpt.JrcICode=JobIssu.JisJrcICode" _
    & " where JisCode=" & CStr(mJisCode) & IIf(IsMissing(mJisICode) = False, " and JisICode=" & CStr(mJisICode), "") _
    & " and JrcRecState IN (" & CStr(cREC_ADDED) & "," & CStr(cREC_EDITED) & "," & CStr(cREC_UNCHANGED) & ")" _
    & " Union All " _
    & "Select JisJrcICode as JrcICode,JisSimCode as SimCode,JisItmCode as ItmCode,JisItrCode as ItrCode,JisSimRefNo as SimRefNo,(JisQty*-1) as Qty from JobIssu" _
    & " left join JobIsHdr on JobIssu.JisCode=JobIsHdr.JihCode" _
    & " where JisCode=" & CStr(mJisCode) & IIf(IsMissing(mJisICode) = False, " and JisICode=" & CStr(mJisICode), "") _
    & " and JisRecState<>" & CStr(cREC_CANCELED) _
    & " Union All " _
    & "Select jis.JisJrcICode as JrcICode,jis.JisSimCode as SimCode,jis.JisItmCode as ItmCode,jis.JisItrCode as ItrCode,jis.JisSimRefNo as SimRefNo,(jis.JisQty*-1) as Qty from ((JobIssu" _
    & " left join JobIsHdr on JobIssu.JisCode=JobIsHdr.JihCode)" _
    & " inner join JobIssu jis on JobIssu.JisJrcICode=jis.JisJrcICode)" _
    & " left join JobIsHdr jih on jis.JisCode=jih.JihCode" _
    & " where JobIssu.JisCode=" & CStr(mJisCode) & " and jis.JisCode<>" & CStr(mJisCode) & IIf(IsMissing(mJisICode) = False, " and JobIssu.JisICode=" & CStr(mJisICode) & " and jis.JisICode<>" & CStr(mJisICode), "") _
    & " and jis.JisRecState<>" & CStr(cREC_CANCELED) _
    & ")" _
    & " group by JrcICode,SimCode,ItmCode,ItrCode,SimRefNo order by JrcICode,SimCode,ItmCode,ItrCode,SimRefNo" _
    & ") as a" _
    & " inner join SubItmMast on a.SimCode=SubItmMast.SimCode" _
    & " where Qty_sum<0" _
    , dbGtdDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    ErrorBox "Job Issue going Excess for Item " & vbCrLf & .fields("SimName") & " Ref.No." & CStr(.fields("SimRefNo")) & " by Qty " & CStr(.fields("Qty_sum"))
    ChkAnyExcessIsuExist = True
End If
End With
CloseTable tRecset

End Function


