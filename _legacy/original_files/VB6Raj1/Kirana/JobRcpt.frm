VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmJobReceipt 
   Appearance      =   0  'Flat
   BackColor       =   &H00FFFFFF&
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
      TabIndex        =   31
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
      TabIndex        =   37
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
      TabIndex        =   36
      TabStop         =   0   'False
      Top             =   0
      Width           =   255
   End
   Begin VB.ComboBox cmbFormEntryMode 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   315
      ItemData        =   "JobRcpt.frx":0000
      Left            =   0
      List            =   "JobRcpt.frx":000D
      Style           =   1  'Simple Combo
      TabIndex        =   35
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
      TabIndex        =   34
      Top             =   720
      Width           =   13935
      Begin VB.TextBox txtJrcNarr 
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
         Left            =   6960
         MaxLength       =   25
         TabIndex        =   25
         Top             =   4320
         Width           =   2535
      End
      Begin VB.TextBox mskJrcStkICode 
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
         TabIndex        =   18
         Tag             =   "AhCode"
         Text            =   "0"
         Top             =   5040
         Visible         =   0   'False
         Width           =   1335
      End
      Begin VB.TextBox mskJrcItrCode 
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
         Left            =   3720
         TabIndex        =   23
         Tag             =   "AhCode"
         Text            =   "0"
         Top             =   4680
         Visible         =   0   'False
         Width           =   1335
      End
      Begin VB.TextBox mskJrcItmCode 
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
         Left            =   2160
         TabIndex        =   22
         Tag             =   "AhCode"
         Text            =   "0"
         Top             =   4680
         Visible         =   0   'False
         Width           =   1335
      End
      Begin VB.TextBox txtJrcSimRefNo 
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
         Left            =   4200
         MaxLength       =   25
         TabIndex        =   24
         Top             =   4320
         Width           =   2775
      End
      Begin VB.TextBox mskJrcICode 
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
         TabIndex        =   19
         Tag             =   "AhCode"
         Text            =   "0"
         Top             =   4680
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
         Left            =   12960
         Style           =   1  'Graphical
         TabIndex        =   29
         Top             =   4320
         Width           =   735
      End
      Begin VB.TextBox mskJrcSno 
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
         TabIndex        =   56
         Top             =   240
         Width           =   13695
         Begin VB.TextBox mskJrcStkCode 
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
            TabIndex        =   77
            Tag             =   "AhCode"
            Text            =   "-1"
            Top             =   240
            Width           =   1455
         End
         Begin VB.TextBox dtpJrcTrnRefDt 
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
         Begin VB.TextBox txtJrcTrnRefNo 
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
         Begin VB.TextBox txtJrcTime_str 
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
         Begin VB.TextBox dtpJrcDate 
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
         Begin VB.TextBox mskJrcVchNo 
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
         Begin VB.TextBox txtJrcPrefix 
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
         Begin VB.TextBox txtJrhRemark 
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
            TabIndex        =   76
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
            TabIndex        =   75
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
            TabIndex        =   68
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
            TabIndex        =   67
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
            TabIndex        =   66
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
            TabIndex        =   65
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
            TabIndex        =   64
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
            TabIndex        =   63
            Top             =   720
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
            TabIndex        =   62
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
            TabIndex        =   61
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
            TabIndex        =   60
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
            TabIndex        =   59
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
            TabIndex        =   58
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
            TabIndex        =   57
            Top             =   3000
            Width           =   1215
         End
         Begin VB.Shape Shape1 
            BackColor       =   &H00FFC0C0&
            BackStyle       =   1  'Opaque
            Height          =   2415
            Index           =   0
            Left            =   0
            Top             =   120
            Width           =   13695
         End
         Begin VB.Shape Shape1 
            BackColor       =   &H00FFFF80&
            BackStyle       =   1  'Opaque
            Height          =   855
            Index           =   2
            Left            =   0
            Top             =   2520
            Width           =   13695
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
         Width           =   3615
      End
      Begin VB.TextBox mskJrcAmount 
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
         Left            =   11520
         TabIndex        =   28
         Text            =   "0.00"
         Top             =   4320
         Width           =   1455
      End
      Begin VB.TextBox mskJrcRate 
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
         Left            =   10320
         TabIndex        =   27
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   4320
         Width           =   1215
      End
      Begin VB.TextBox mskJrcQty 
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
         Left            =   9480
         TabIndex        =   26
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
         TabIndex        =   30
         Top             =   8880
         Width           =   375
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd2 
         Height          =   2775
         Left            =   120
         TabIndex        =   17
         Top             =   3600
         Width           =   13695
         _ExtentX        =   24156
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
         TabIndex        =   69
         Top             =   6360
         Width           =   13695
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Last Receipt:"
            BeginProperty Font 
               Name            =   "Verdana"
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
            TabIndex        =   74
            Top             =   1920
            Width           =   1695
         End
         Begin VB.Label lblOldJrcCodeDesc 
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
            TabIndex        =   73
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
            TabIndex        =   72
            Top             =   480
            Width           =   8055
            WordWrap        =   -1  'True
         End
         Begin VB.Label lblJrcAmountTot 
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
            Left            =   11520
            TabIndex        =   71
            Top             =   120
            Width           =   1455
         End
         Begin VB.Label lblJrcQtyTot 
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
            Left            =   9480
            TabIndex        =   70
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
      TabIndex        =   33
      Top             =   720
      Width           =   14295
      Begin VB.Frame frConfigure 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   4935
         Left            =   3000
         TabIndex        =   51
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
            TabIndex        =   49
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
            TabIndex        =   44
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
               TabIndex        =   45
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
               TabIndex        =   46
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
               TabIndex        =   47
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
               TabIndex        =   48
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
            TabIndex        =   42
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
            TabIndex        =   41
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
            TabIndex        =   43
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
            TabIndex        =   55
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
            TabIndex        =   54
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
            TabIndex        =   53
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
            TabIndex        =   52
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
         TabIndex        =   40
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
         TabIndex        =   38
         Top             =   360
         Width           =   4215
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd1 
         Height          =   6375
         Left            =   120
         TabIndex        =   39
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
         TabIndex        =   50
         Top             =   360
         Width           =   735
      End
   End
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Job Receipt"
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
      TabIndex        =   32
      Top             =   0
      Width           =   9015
   End
End
Attribute VB_Name = "frmJobReceipt"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim mFormLoaded As Boolean, mLastKeyPressed As Integer, mMaskKeyPressed As Integer
Dim mFormUIdCode As Long, mFormUIdFileName As String, mFormAcsPermFileName As String
Dim mJrcCode As Long, mJrcStkCode As Long, mQryPrtCode As Long, dtlAddEditMode As Boolean, dtlAddMode As Boolean, dtlEditCanceled As Boolean
Dim dtlSdcAddEditMode As Boolean, dtlSdcAddMode As Boolean, dtlSdcEditCanceled As Boolean
Dim mRemoteAccess As Boolean, mEntrySaved As Boolean, mEntryAborted As Boolean
Dim dbAcDatabase As New ADODB.Connection, dbStDatabase As New ADODB.Connection, dbGtdDatabase As New ADODB.Connection, dbGrpDatabase As New ADODB.Connection, dbComDatabase As New ADODB.Connection
Dim datRecset As New ADODB.Recordset
Dim mJrcCode_old As Long, mJrcStkCode_old As Long, mJrcPrtCode_old As Long, mJrcDate_old As Date, mJrcVtmCode_old As Long, mJrcVchNo_old As Long, mJrcTime_old As Long
Dim mJrcSimCode_old As Long, mJrcItmCode_old As Long, mJrcItrCode_old As Long, mJrcSimRefNo_old As String
Dim clsAH As clsAccountHead, clsSTK As clsStockJrn, clsJRC As clsGtdMultiTranEntry, clsARA As clsComMastEntry, clsSTN As clsComMastEntry, clsVTM As clsComMastEntry
Dim clsPRT As clsGtdMasterEntry, clsSIM As clsGtdMasterEntry
Dim mActiveControl As Object, clsListStru As clsSelectQueryStructure
Dim fcmbVtmName As clsComFlexSearch
Dim fcmbPrtName As clsGtdFlexSearch, fcmbSimName As clsGtdFlexSearch

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
Const X2JRCICODE_COL = 0
Const X2JRCSNO_COL = 1
Const X2SIMNAME_COL = 2
Const X2JRCSIMREFNO_COL = 3
Const X2JRCNARR_COL = 4
Const X2JRCQTY_COL = 5
Const X2JRCRATE_COL = 6
Const X2JRCAMOUNT_COL = 7
Const X2JRCSIMCODE_COL = 8
Const X2JRCITMCODE_COL = 9
Const X2JRCITRCODE_COL = 10
Const X2JRCSTKICODE_COL = 11
Const X2JRCRECSTATE_COL = 12
Const MFGRD2_COLS = 13

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
mJrcCode = mAccessCode
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
                    dtpFromDate.Text = Dtoc(MonthStartDate(DateSerial(Val(Left(.fields("JrcYrMonth"), 4)), Val(Right(.fields("JrcYrMonth"), 2)), 1)))
                    dtpToDate.Text = Dtoc(MonthEndDate(DateSerial(Val(Left(.fields("JrcYrMonth"), 4)), Val(Right(.fields("JrcYrMonth"), 2)), 1)))
                    optMonthwise.Value = False
                    optDatewise.Value = True
                ElseIf optDatewise.Value = True Then
                    dtpFromDate.Text = Dtoc(.fields("JrhDate"))
                    dtpToDate.Text = Dtoc(.fields("JrhDate"))
                    optDatewise.Value = False
                    optDetailed.Value = True
                ElseIf optPartywise.Value = True Then
                    mQryPrtCode = .fields("JrhPrtCode")
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
Dim tRecset As New ADODB.Recordset, srow As Integer, mJrcICode As Long, mJrcStkICode As Long, mJrcItrCode As Long, mReqdRecdAmt As Double

srow = Mfgrd2.Row
mJrcICode = Val(Mfgrd2.TextMatrix(srow, X2JRCICODE_COL))
mJrcStkICode = Val(Mfgrd2.TextMatrix(srow, X2JRCSTKICODE_COL))
mJrcItrCode = Val(Mfgrd2.TextMatrix(srow, X2JRCITRCODE_COL))

If cmdOK.Caption = "&OK" And dtlEditCanceled = False Then
    Rem updating values in job receipt table
    With clsJRC
    If dtlAddMode = True Then
        .ClearDtl
    Else
        .GetDtlData mJrcCode, mJrcICode
    End If
    .mTrnCode_lng = mJrcCode
    .mTrnDtlSno_int = Val(UnMyNumFmt(mskJrcSno.Text))
    .mTrnDate_dt = Ctod(dtpJrcDate.Text)
    .mTrnCmpCode_int = sFinYrCmpCode
    
    .mJrcStkCode_lng = mJrcStkCode
    .mJrcStkICode_lng = mJrcStkICode
    .mJrcPrtCode_lng = Val(fcmbPrtName.BoundText)
    .mJrcSimCode_lng = Val(fcmbSimName.BoundText)
    .mJrcItmCode_lng = Val(mskJrcItmCode.Text)
    .mJrcItrCode_lng = Val(mskJrcItrCode.Text)
    .mJrcSimRefNo_str = txtJrcSimRefNo.Text
    .mJrcNarr_str = txtJrcNarr.Text
    .mJrcQty_dbl = Val(UnMyNumFmt(mskJrcQty.Text))
    .mJrcRate_dbl = Val(UnMyNumFmt(mskJrcRate.Text))
    .mJrcAmount_dbl = Val(UnMyNumFmt(mskJrcAmount.Text))
    .mJrcRemark_str = ""
    
    If dtlAddMode = True Then
        If .AddNewDtl(mJrcCode) = True Then
            mJrcICode = .mTrnDtlICode_lng
        End If
    Else
        .UpdateDtl mJrcCode, mJrcICode
    End If
    End With
    
    Rem updating values in stock table
    With clsSTK
    If dtlAddMode = True Then
        .ClearDtl
    Else
        .GetDtlData mJrcStkCode, mJrcStkICode
    End If
    .mStkSno_int = Val(UnMyNumFmt(mskJrcSno.Text))
    .mStkVtmCode_lng = Val(fcmbVtmName.BoundText)
    .mStkPrefix_str = txtJrcPrefix.Text
    .mStkVchNo_lng = Val(UnMyNumFmt(mskJrcVchNo.Text))
    .mStkPostfix_str = ""
    .mStkDate_dt = Ctod(dtpJrcDate.Text)
    .mStkItmCode_lng = Val(mskJrcItmCode.Text)
    .mStkItmRef1Name_str = txtJrcSimRefNo.Text
    .mStkItmRef2Name_str = ""
    .mStkQty_dbl = ToRcptQty(Val(UnMyNumFmt(mskJrcQty.Text)))
    .mStkRate_dbl = Val(UnMyNumFmt(mskJrcRate.Text))
    .mStkValue_dbl = Val(UnMyNumFmt(mskJrcAmount.Text))
    .mStkNarr_str = ""
    .mStkAutoGen_bln = True
    .mStkCmpCode_int = sFinYrCmpCode
    If dtlAddMode = True Then
        If .AddNewDtl(mJrcStkCode, mNewItemRef:=True) = True Then
            mJrcStkICode = .mStkICode_lng
            mJrcItrCode = .mStkItmRefCode_lng
        End If
    Else
        If Val(fcmbSimName.BoundText) <> mJrcSimCode_old Or Val(mskJrcItmCode.Text) <> mJrcItmCode_old Or txtJrcSimRefNo.Text <> mJrcSimRefNo_old Then
            .UpdateDtl mJrcStkCode, mJrcStkICode, mNewItemRef:=True
            mJrcItrCode = .mStkItmRefCode_lng
        Else
            .UpdateDtl mJrcStkCode, mJrcStkICode
        End If
    End If
    End With
    
    Rem updating StkICode in JobRcpt
    With clsJRC
    If mJrcICode > 0 And mJrcStkICode > 0 And mJrcItrCode > 0 Then
        If dtlAddMode = True Then
            .GetDtlData mJrcCode, mJrcICode
            
            .mJrcStkICode_lng = mJrcStkICode
            .mJrcItrCode_lng = mJrcItrCode
            .UpdateDtl mJrcCode, mJrcICode
        Else
            If Val(fcmbSimName.BoundText) <> mJrcSimCode_old Or Val(mskJrcItmCode.Text) <> mJrcItmCode_old Or txtJrcSimRefNo.Text <> mJrcSimRefNo_old Then
                .GetDtlData mJrcCode, mJrcICode
                
                .mJrcItrCode_lng = mJrcItrCode
                .UpdateDtl mJrcCode, mJrcICode
            End If
        End If
    End If
    End With
    
    RefreshDatabase dbGtdDatabase
    ChkAnyShortRcExist mJrcICode
    ChkAnyMisLinkedIsuExist mJrcICode
    
    With tRecset
    .Open "Select * from JobRcpt where JrcCode=" & CStr(mJrcCode) & " and JrcICode=" & CStr(mJrcICode) & "", dbGtdDatabase, adOpenKeyset, adLockOptimistic
    
    clsSIM.GetData .fields("JrcSimCode")
    
    Mfgrd2.TextMatrix(srow, X2JRCICODE_COL) = .fields("JrcICode")
    Mfgrd2.TextMatrix(srow, X2JRCSTKICODE_COL) = .fields("JrcStkICode")
    Mfgrd2.TextMatrix(srow, X2JRCSNO_COL) = ToMyNumFmt(.fields("JrcSno"), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2SIMNAME_COL) = clsSIM.mName_str
    Mfgrd2.TextMatrix(srow, X2JRCSIMREFNO_COL) = .fields("JrcSimRefNo")
    Mfgrd2.TextMatrix(srow, X2JRCNARR_COL) = .fields("JrcNarr")
    Mfgrd2.TextMatrix(srow, X2JRCQTY_COL) = ToMyNumFmt(.fields("JrcQty"), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2JRCRATE_COL) = ToMyNumFmt(.fields("JrcRate"))
    Mfgrd2.TextMatrix(srow, X2JRCAMOUNT_COL) = ToMyNumFmt(.fields("JrcAmount"))
    Mfgrd2.TextMatrix(srow, X2JRCSIMCODE_COL) = .fields("JrcSimCode")
    Mfgrd2.TextMatrix(srow, X2JRCITMCODE_COL) = .fields("JrcItmCode")
    Mfgrd2.TextMatrix(srow, X2JRCITRCODE_COL) = .fields("JrcItrCode")
    Mfgrd2.TextMatrix(srow, X2JRCRECSTATE_COL) = .fields("JrcRecState")
    
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
    txtSearch1Text_InterActiveChange Format(Ctod(dtpJrcDate.Text), "yyyymmdd") + Format(mJrcCode, "0000000")
ElseIf optMonthwise.Value = True Then
    txtSearch1Text_InterActiveChange Format(Ctod(dtpJrcDate.Text), "yyyy") & "/" & Format(Ctod(dtpJrcDate.Text), "mm")
ElseIf optDatewise.Value = True Then
    txtSearch1Text_InterActiveChange Format(Ctod(dtpJrcDate.Text), "yyyymmdd")
ElseIf optPartywise.Value = True Then
    txtSearch1Text_InterActiveChange txtPrtName.Text
End If

Call ShowEntryMode(False)
Mfgrd1.SetFocus

End Sub

Private Sub cmdSaveForm_GotFocus()
Dim mJrcAcsPermNo As Integer, mRetryCount As Integer

txtVoid.SetFocus
cmdSaveForm.Enabled = False
If Data_Verify() = True Then
    If CanAccept() = True Then
        If GetAccessPerm(mJrcAcsPermNo, mRetryCount, mFormAcsPermFileName) = True And mRetryCount = 0 Then
            If Data_NetwAuth() = True Then
                Call cmdSaveForm_Click
                Close #mJrcAcsPermNo
                If mRemoteAccess = True Then
                    ''Unload Me
                    Me.Hide
                    Exit Sub
                End If
            Else
                Close #mJrcAcsPermNo
            End If
        Else
            Close #mJrcAcsPermNo
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

Private Sub dtpJrcDate_GotFocus()
FlashActiveControl dtpJrcDate, True
End Sub

Private Sub dtpJrcDate_LostFocus()
FlashActiveControl dtpJrcDate, False
End Sub

Private Sub dtpJrcDate_Validate(Cancel As Boolean)
dtpJrcDate.Text = ToMyDate(dtpJrcDate.Text)
If IsFinYrDate(Ctod(dtpJrcDate.Text)) = False Then
    ErrorBox "Invalid Input !!!"
    dtpJrcDate.SetFocus
    Cancel = True
ElseIf ChkAnyPriorIsuExist() = True Then
    ErrorBox "Invalid Input !!!"
    dtpJrcDate.SetFocus
    Cancel = True
    dtpJrcDate.Text = Dtoc(mJrcDate_old)
End If

End Sub

Private Sub dtpJrcTrnRefDt_GotFocus()
FlashActiveControl dtpJrcTrnRefDt, True
End Sub

Private Sub dtpJrcTrnRefDt_LostFocus()
FlashActiveControl dtpJrcTrnRefDt, False
End Sub

Private Sub dtpJrcTrnRefDt_Validate(Cancel As Boolean)
dtpJrcTrnRefDt.Text = ToMyDate(dtpJrcTrnRefDt.Text)

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
        If mJrcCode = 0 Then
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

mFormUIdFileName = "JobRcpt.Uid"
mFormAcsPermFileName = "JobRcpt.Acp"
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

Set clsJRC = New clsGtdMultiTranEntry
Set clsJRC.dbAcDatabase = dbAcDatabase
Set clsJRC.dbStDatabase = dbStDatabase
Set clsJRC.dbGtdDatabase = dbGtdDatabase
Set clsJRC.dbComDatabase = dbComDatabase
clsJRC.blnJobRcptTran = True
clsJRC.Init

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
fcmbVtmName.mListSqlExpr = "Select * from VTypMast where VtmSysCode=" & CStr(cGTD_VTYPE_JOB_RCPT) & " order by VtmName"
fcmbVtmName.Init

Set fcmbSimName = New clsGtdFlexSearch
Set fcmbSimName.dbGtdDatabase = dbGtdDatabase
Set fcmbSimName.dbComDatabase = dbComDatabase
fcmbSimName.blnSubItmMastList = True
fcmbSimName.Init

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
    datRecset.Open "Select * from JobRcHdr inner join PartyMast on JobRcHdr.JrhPrtCode=PartyMast.PrtCode where JrhCode=" & CStr(mJrcCode) & " order by JrhDate,JrhTime", dbGtdDatabase, adOpenKeyset, adLockOptimistic
Else
    datRecset.Open "Select * from JobRcHdr inner join PartyMast on JobRcHdr.JrhPrtCode=PartyMast.PrtCode order by JrhDate,JrhTime", dbGtdDatabase, adOpenKeyset, adLockOptimistic
End If
Mfgrd1.FixedCols = 0
Call SmryList

Mfgrd2.FixedRows = 1: Mfgrd2.FixedCols = 0: Mfgrd2.Rows = 2: Mfgrd2.Cols = MFGRD2_COLS
colcnt = X2JRCICODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2JRCICODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2JRCSNO_COL: Mfgrd2.ColWidth(colcnt) = mskJrcSno.Width: Mfgrd2.TextMatrix(0, colcnt) = "Sno": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SIMNAME_COL: Mfgrd2.ColWidth(colcnt) = txtSimName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Item Name": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2JRCSIMREFNO_COL: Mfgrd2.ColWidth(colcnt) = txtJrcSimRefNo.Width: Mfgrd2.TextMatrix(0, colcnt) = "Ref.No": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2JRCNARR_COL: Mfgrd2.ColWidth(colcnt) = txtJrcNarr.Width: Mfgrd2.TextMatrix(0, colcnt) = "Description": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2JRCQTY_COL: Mfgrd2.ColWidth(colcnt) = mskJrcQty.Width: Mfgrd2.TextMatrix(0, colcnt) = "Unit": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2JRCRATE_COL: Mfgrd2.ColWidth(colcnt) = mskJrcRate.Width: Mfgrd2.TextMatrix(0, colcnt) = "Rate": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2JRCAMOUNT_COL: Mfgrd2.ColWidth(colcnt) = mskJrcAmount.Width: Mfgrd2.TextMatrix(0, colcnt) = "Amount": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2JRCSIMCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2JRCSIMCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2JRCITMCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2JRCITMCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2JRCITRCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2JRCITRCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2JRCSTKICODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2JRCSTKICODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2JRCRECSTATE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2JRCRECSTATE_COL": Mfgrd2.ColAlignment(colcnt) = 7

colcnt = X2JRCSNO_COL: mskJrcSno.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2SIMNAME_COL: txtSimName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2JRCSIMREFNO_COL: txtJrcSimRefNo.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2JRCNARR_COL: txtJrcNarr.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2JRCQTY_COL: mskJrcQty.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2JRCRATE_COL: mskJrcRate.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2JRCAMOUNT_COL: mskJrcAmount.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
cmdOK.Left = mskJrcAmount.Left + mskJrcAmount.Width

lblJrcQtyTot.Left = mskJrcQty.Left - frFooter.Left: lblJrcQtyTot.Width = mskJrcQty.Width
lblJrcAmountTot.Left = mskJrcAmount.Left - frFooter.Left: lblJrcAmountTot.Width = mskJrcAmount.Width

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
Set clsJRC = Nothing
Set clsPRT = Nothing
Set clsSIM = Nothing
Set clsARA = Nothing
Set clsSTN = Nothing
Set clsVTM = Nothing
Set fcmbPrtName = Nothing
Set fcmbVtmName = Nothing
Set fcmbSimName = Nothing
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
Dim mOpgVchNo As Long, mJrcVchNo As Long
Dim mJrcAmountTot As Double

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
Rem outdoor receipt validations
mJrcVchNo = Val(UnMyNumFmt(mskJrcVchNo.Text))
If mJrcVchNo > 0 Then
    If mJrcVchNo <> mJrcVchNo_old Or Val(fcmbVtmName.BoundText) <> mJrcVtmCode_old Or Ctod(dtpJrcDate.Text) <> mJrcDate_old Or FormAddEditMode = cFORM_ADDMODE Then
        If ChkIsDuplVTypeNo(dbGtdDatabase, dbAcDatabase, mTableName:="JobRcHdr", mChkFieldName:="JrhVchNo", mChkFieldValue:=mJrcVchNo, mKeyFieldName:="JrhCode", mKeyFieldValue:=mJrcCode, mVtmFieldName:="JrhVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="JrhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="JrhDate", mDateFieldValue:=Ctod(dtpJrcDate.Text)) = True Then
            ErrorBox "Duplicate Voucher No. !!!"
            mskJrcVchNo.SetFocus
            ' ---------------
            If FormAddEditMode = cFORM_ADDMODE Then
                mJrcVchNo = GetNextVTypeNo(dbGtdDatabase, dbAcDatabase, dbComDatabase, mTableName:="JobRcHdr", mFieldName:="JrhVchNo", mVtmFieldName:="JrhVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="JrhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="JrhDate", mDateFieldValue:=Ctod(dtpJrcDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
            Else
                mJrcVchNo = mJrcVchNo_old
            End If
            mskJrcVchNo.Text = ToMyNumFmt(mJrcVchNo, mDecimals:=0)
            GoTo EndSub
        End If
    End If
Else
    ErrorBox "Invalid Input !!!"
    mskJrcVchNo.SetFocus
    GoTo EndSub
End If
If IsDate(dtpJrcDate.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpJrcDate.SetFocus
    GoTo EndSub
ElseIf IsFinYrDate(Ctod(dtpJrcDate.Text)) = False Then
    ErrorBox "Invalid Input !!!"
    dtpJrcDate.SetFocus
    GoTo EndSub
ElseIf ChkAnyPriorIsuExist() = True Then
    ErrorBox "Invalid Input !!!"
    dtpJrcDate.SetFocus
    dtpJrcDate.Text = Dtoc(mJrcDate_old)
    GoTo EndSub
End If
If TimeToMin(txtJrcTime_str.Text) > cDAYMINUTES Then
    ErrorBox "Invalid Input !!!"
    txtJrcTime_str.SetFocus
    GoTo EndSub
End If
If txtJrcTrnRefNo.Text = "" Then
    ErrorBox "Invalid Input !!!"
    txtJrcTrnRefNo.SetFocus
    GoTo EndSub
End If
If IsDate(dtpJrcTrnRefDt.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpJrcTrnRefDt.SetFocus
    GoTo EndSub
End If
If ChkAnyShortRcExist() = True Then
    Mfgrd2.SetFocus
    GoTo EndSub
End If
If ChkAnyMisLinkedIsuExist() = True Then
    ErrorBox "Invalid Linking !!!"
    Mfgrd2.SetFocus
    GoTo EndSub
End If

Data_Verify = True

EndSub:
Exit Function

End Function

Private Function Data_NetwAuth() As Boolean
Dim mJrcVchNo As Long
Data_NetwAuth = False

mJrcVchNo = Val(UnMyNumFmt(mskJrcVchNo.Text))
If mJrcVchNo <> mJrcVchNo_old Or Val(fcmbVtmName.BoundText) <> mJrcVtmCode_old Or Ctod(dtpJrcDate.Text) <> mJrcDate_old Or FormAddEditMode = cFORM_ADDMODE Then
    If ChkIsDuplVTypeNo(dbGtdDatabase, dbAcDatabase, mTableName:="JobRcHdr", mChkFieldName:="JrhVchNo", mChkFieldValue:=mJrcVchNo, mKeyFieldName:="JrhCode", mKeyFieldValue:=mJrcCode, mVtmFieldName:="JrhVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="JrhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="JrhDate", mDateFieldValue:=Ctod(dtpJrcDate.Text)) = True Then
        ErrorBox "Duplicate Voucher No. !!!"
        mskJrcVchNo.SetFocus
        ' ---------------
        If FormAddEditMode = True Then
            mJrcVchNo = GetNextVTypeNo(dbGtdDatabase, dbAcDatabase, dbComDatabase, mTableName:="JobRcHdr", mFieldName:="JrhVchNo", mVtmFieldName:="JrhVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="JrhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="JrhDate", mDateFieldValue:=Ctod(dtpJrcDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
        Else
            mJrcVchNo = mJrcVchNo_old
        End If
        mskJrcVchNo.Text = ToMyNumFmt(mJrcVchNo, mDecimals:=0)
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
Dim srow As Integer, mJrcICode As Long, mJrcStkICode As Long, mDeleteit As Boolean

srow = Mfgrd2.Row
mJrcICode = Val(Mfgrd2.TextMatrix(srow, X2JRCICODE_COL))
mJrcStkICode = Val(Mfgrd2.TextMatrix(srow, X2JRCSTKICODE_COL))

If MyDeleteKey(Shift, KeyCode, mCheckCtrlMask:=False) = True And mJrcICode > 0 Then
    txtVoid.SetFocus
    If clsJRC.CanDeleteDtl(mJrcCode, mJrcICode) = True Then
        clsJRC.DeleteDtl mJrcCode, mJrcICode
        clsSTK.DeleteDtl mJrcStkCode, mJrcStkICode
        
        ShowDtlData mJrcCode
        Mfgrd2.Row = srow
        Mfgrd2.SetFocus
        Call Mfgrd2_RowColChange
    Else
        Mfgrd2.SetFocus
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
        mskJrcSno.Text = ToMyNumFmt(FlexNextSeqno(Mfgrd2, X2JRCSNO_COL), mDecimals:=0)
        mskJrcQty.Text = ToMyNumFmt(1, mDecimals:=0)
    Else
        mskJrcICode.Text = Val(Mfgrd2.TextMatrix(srow, X2JRCICODE_COL))
        mskJrcStkICode.Text = Val(Mfgrd2.TextMatrix(srow, X2JRCSTKICODE_COL))
        mskJrcSno.Text = Mfgrd2.TextMatrix(srow, X2JRCSNO_COL)
        fcmbSimName.BoundText = Mfgrd2.TextMatrix(srow, X2JRCSIMCODE_COL): txtSimName.Text = fcmbSimName.Text
        mskJrcItmCode.Text = Val(Mfgrd2.TextMatrix(srow, X2JRCITMCODE_COL))
        mskJrcItrCode.Text = Val(Mfgrd2.TextMatrix(srow, X2JRCITRCODE_COL))
        txtJrcSimRefNo.Text = Mfgrd2.TextMatrix(srow, X2JRCSIMREFNO_COL)
        txtJrcNarr.Text = Mfgrd2.TextMatrix(srow, X2JRCNARR_COL)
        mskJrcQty.Text = Mfgrd2.TextMatrix(srow, X2JRCQTY_COL)
        mskJrcRate.Text = Mfgrd2.TextMatrix(srow, X2JRCRATE_COL)
        mskJrcAmount.Text = Mfgrd2.TextMatrix(srow, X2JRCAMOUNT_COL)
    End If
    txtSimName.SetFocus
    Call ValidDtl
    
    mJrcSimCode_old = Val(fcmbSimName.BoundText)
    mJrcItmCode_old = Val(mskJrcItmCode.Text)
    mJrcItrCode_old = Val(mskJrcItrCode.Text)
    mJrcSimRefNo_old = txtJrcSimRefNo.Text
End If

End Sub

Private Sub Mfgrd2_RowColChange()
Rem nothing
End Sub

Private Sub mskJrcAmount_GotFocus()
FlashActiveControl mskJrcAmount, True
End Sub

Private Sub mskJrcAmount_LostFocus()
FlashActiveControl mskJrcAmount, False
End Sub

Private Sub mskJrcAmount_Validate(Cancel As Boolean)
mskJrcAmount.Text = ToMyNumFmt(mskJrcAmount.Text)
If Val(UnMyNumFmt(mskJrcAmount.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskJrcAmount.SetFocus
    Cancel = True
End If
Call ValidDtl

End Sub

Rem discart this validation, instead use validation at receipt hdr level
Private Function chkJrcAmount() As Boolean
Dim mRtnval As Boolean, srow As Integer, mJrcAmount As Double

mRtnval = True
srow = Mfgrd2.Row
mJrcAmount = Val(UnMyNumFmt(mskJrcAmount.Text))

chkJrcAmount = mRtnval

End Function

Private Sub mskJrcRate_GotFocus()
FlashActiveControl mskJrcRate, True
End Sub

Private Sub mskJrcRate_LostFocus()
FlashActiveControl mskJrcRate, False
End Sub

Private Sub mskJrcRate_Validate(Cancel As Boolean)
mskJrcRate.Text = ToMyNumFmt(mskJrcRate.Text)
If Val(UnMyNumFmt(mskJrcRate.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskJrcRate.SetFocus
    Cancel = True
Else
    Call CalcJrcChg
End If
Call ValidDtl

End Sub

Private Sub mskJrcQty_GotFocus()
FlashActiveControl mskJrcQty, True
End Sub

Private Sub mskJrcQty_LostFocus()
FlashActiveControl mskJrcQty, False
End Sub

Private Sub mskJrcQty_Validate(Cancel As Boolean)
mskJrcQty.Text = ToMyNumFmt(mskJrcQty.Text, mDecimals:=0)
If Val(UnMyNumFmt(mskJrcQty.Text)) <= 0 Then
    ErrorBox "Invalid Input !!!"
    mskJrcQty.SetFocus
    Cancel = True
Else
    Call CalcJrcChg
End If
Call ValidDtl

End Sub

Private Sub mskJrcVchNo_GotFocus()
FlashActiveControl mskJrcVchNo, True
End Sub

Private Sub mskJrcVchNo_LostFocus()
FlashActiveControl mskJrcVchNo, False
End Sub

Private Sub mskJrcVchNo_Validate(Cancel As Boolean)
Dim mJrcVchNo As Long
mJrcVchNo = Val(UnMyNumFmt(mskJrcVchNo.Text))
If mJrcVchNo < 0 Then
    mJrcVchNo = GetNextVTypeNo(dbGtdDatabase, dbAcDatabase, dbComDatabase, mTableName:="JobRcHdr", mFieldName:="JrhVchNo", mVtmFieldName:="JrhVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="JrhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="JrhDate", mDateFieldValue:=Ctod(dtpJrcDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
    mskJrcVchNo.Text = ToMyNumFmt(mJrcVchNo, mDecimals:=0)
ElseIf mJrcVchNo > 0 Then
    If mJrcVchNo <> mJrcVchNo_old Or Val(fcmbVtmName.BoundText) <> mJrcVtmCode_old Or Ctod(dtpJrcDate.Text) <> mJrcDate_old Or FormAddEditMode = cFORM_ADDMODE Then
        If ChkIsDuplVTypeNo(dbGtdDatabase, dbAcDatabase, mTableName:="JobRcHdr", mChkFieldName:="JrhVchNo", mChkFieldValue:=mJrcVchNo, mKeyFieldName:="JrhCode", mKeyFieldValue:=mJrcCode, mVtmFieldName:="JrhVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="JrhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="JrhDate", mDateFieldValue:=Ctod(dtpJrcDate.Text)) = True Then
            ErrorBox "Duplicate Voucher No. !!!"
            Cancel = True
            mskJrcVchNo.SetFocus
            ' ----------
            If FormAddEditMode = cFORM_ADDMODE Then
                mJrcVchNo = GetNextVTypeNo(dbGtdDatabase, dbAcDatabase, dbComDatabase, mTableName:="JobRcHdr", mFieldName:="JrhVchNo", mVtmFieldName:="JrhVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="JrhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="JrhDate", mDateFieldValue:=Ctod(dtpJrcDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
            Else
                mJrcVchNo = mJrcVchNo_old
            End If
            mskJrcVchNo.Text = ToMyNumFmt(mJrcVchNo, mDecimals:=0)
        End If
    End If
    If Cancel = False Then
        mskJrcVchNo.Text = ToMyNumFmt(mJrcVchNo, mDecimals:=0)
    End If
Else
    ErrorBox "Invalid Input !!!"
    mskJrcVchNo.SetFocus
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

Private Sub txtJrcNarr_GotFocus()
FlashActiveControl txtJrcNarr, True
End Sub

Private Sub txtJrcNarr_LostFocus()
FlashActiveControl txtJrcNarr, False
End Sub

Private Sub txtJrcSimRefNo_GotFocus()
FlashActiveControl txtJrcSimRefNo, True
End Sub

Private Sub txtJrcSimRefNo_LostFocus()
FlashActiveControl txtJrcSimRefNo, False
End Sub

Private Sub txtJrcSimRefNo_Validate(Cancel As Boolean)
If Trim(txtJrcSimRefNo.Text) = "" Then
    ErrorBox "Invalid Input !!!"
    txtJrcSimRefNo.SetFocus
    Cancel = True
ElseIf dtlAddMode = False And txtJrcSimRefNo.Text <> mJrcSimRefNo_old Then
    AlertBox "Item Reference No. Changed !!!"
End If

End Sub

Private Sub txtJrcTrnRefNo_GotFocus()
FlashActiveControl txtJrcTrnRefNo, True
End Sub

Private Sub txtJrcTrnRefNo_LostFocus()
FlashActiveControl txtJrcTrnRefNo, False
End Sub

Private Sub txtJrcTrnRefNo_Validate(Cancel As Boolean)
If txtJrcTrnRefNo.Text = "" Then
    ErrorBox "Invalid Input !!!"
    txtJrcTrnRefNo.SetFocus
    Cancel = True
End If

End Sub

Private Sub txtJrhRemark_GotFocus()
FlashActiveControl txtJrhRemark, True
End Sub

Private Sub txtJrhRemark_LostFocus()
FlashActiveControl txtJrhRemark, False
End Sub

Private Sub txtJrhRemark_Validate(Cancel As Boolean)
txtJrhRemark.Text = ToMyWord(txtJrhRemark.Text)
End Sub

Private Sub txtJrcTime_str_GotFocus()
FlashActiveControl txtJrcTime_str, True
End Sub

Private Sub txtJrcTime_str_LostFocus()
FlashActiveControl txtJrcTime_str, False
End Sub

Private Sub txtJrcTime_str_Validate(Cancel As Boolean)
txtJrcTime_str.Text = MinToTime(TimeToMin(txtJrcTime_str.Text))
If TimeToMin(txtJrcTime_str.Text) > cDAYMINUTES Then
    ErrorBox "Invalid Input !!!"
    txtJrcTime_str.SetFocus
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
    Rem Call ShowOldOpgListByOpgNo show here all outdoor receipt details
End If

End Sub

Private Sub txtVtmName_LostFocus()
FlashActiveControl txtVtmName, False
End Sub

Private Sub txtVtmName_Validate(Cancel As Boolean)
Dim mJrcVchNo As Long

If Val(fcmbVtmName.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    txtVtmName.SetFocus
    Cancel = True
Else
    If Val(fcmbVtmName.BoundText) <> mJrcVtmCode_old Or Ctod(dtpJrcDate.Text) <> mJrcDate_old Or FormAddEditMode = cFORM_ADDMODE Then
        mJrcVchNo = GetNextVTypeNo(dbGtdDatabase, dbAcDatabase, dbComDatabase, mTableName:="JobRcHdr", mFieldName:="JrhVchNo", mVtmFieldName:="JrhVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="JrhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="JrhDate", mDateFieldValue:=Ctod(dtpJrcDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
        mskJrcVchNo.Text = ToMyNumFmt(mJrcVchNo, mDecimals:=0)
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
ElseIf ChkAnyMisLinkedIsuExist() = True Then
    ErrorBox "Invalid Party Selection !!!"
    Cancel = True
    txtPrtName.SetFocus
    
    fcmbPrtName.BoundText = CStr(mJrcPrtCode_old)
    txtPrtName.Text = fcmbPrtName.Text
Else
    ShowPartyData Val(fcmbPrtName.BoundText)
End If

End Sub

Private Sub ShowPartyData(ByVal mJrcPrtCode As Long)
Dim tRecset As New ADODB.Recordset

txtPrtAddr.Text = ""
txtAraName.Text = ""
txtStnName.Text = ""
txtPrtTelNo.Text = ""
txtPrtSMSNo.Text = ""

With tRecset
.Open "Select * from (PartyMast prt inner join AreaMast ara on prt.PrtAraCode=ara.AraCode) inner join StsnMast stn on prt.PrtStnCode=stn.StnCode where prt.PrtCode=" & CStr(mJrcPrtCode) & "", dbComDatabase, adOpenKeyset, adLockOptimistic
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
If clsJRC.BeginTran(0) = False Then
    Exit Sub
ElseIf clsSTK.BeginStock(0) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_ADDMODE

clsJRC.ClearHdr: clsJRC.ClearDtl
clsSTK.ClearHdr

mJrcCode = clsJRC.ActiveTrnCode
mJrcStkCode = clsSTK.ActiveStkCode

ShowJrcData mJrcCode
ShowStkData mJrcStkCode

Rem restoring user editing features
Call ShowJrcDefData

Rem old values
Call StoreJrcOldData
Call StoreStkOldData

Call ShowEntryMode(True)
txtPrtName.SetFocus

End Sub

Private Sub Data_EditEvent()

If clsJRC.BeginTran(datRecset.fields("JrhCode")) = False Then
    Exit Sub
ElseIf clsSTK.BeginStock(datRecset.fields("JrhStkCode")) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_EDITMODE

With datRecset
mJrcCode = .fields("JrhCode")
mJrcStkCode = .fields("JrhStkCode")

End With

ShowJrcData mJrcCode
ShowStkData mJrcStkCode

Rem old values
Call StoreJrcOldData
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

Private Sub ShowJrcData(ByVal mJrcCode As Long)
With clsJRC
.GetHdrData mJrcCode

mskFormBoundField.Text = mJrcCode
fcmbPrtName.BoundText = CStr(.mJrhPrtCode_lng): txtPrtName.Text = fcmbPrtName.Text
fcmbVtmName.BoundText = CStr(.mTrnVtmCode_lng): txtVtmName.Text = fcmbVtmName.Text
txtJrcPrefix.Text = .mTrnPrefix_str
mskJrcVchNo.Text = ToMyNumFmt(.mTrnVchNo_lng, mDecimals:=0)
dtpJrcDate.Text = Dtoc(.mTrnDate_dt)
txtJrcTime_str.Text = MinToTime(.mJrhTime_lng)
txtJrcTrnRefNo.Text = .mJrhTrnRefNo_str
dtpJrcTrnRefDt.Text = Dtoc(.mJrhTrnRefDt_dt)
txtJrhRemark.Text = .mJrhRemark_str

ShowPartyData .mJrhPrtCode_lng
Call ShowOldJrcCodeDesc
End With

ShowDtlData mJrcCode
Call ShowLinkTranDtl

End Sub

Private Sub ShowStkData(ByVal mJrcStkCode As Long)
mskJrcStkCode.Text = mJrcStkCode

End Sub

Private Sub ShowJrcDefData()
Dim tRecset As New ADODB.Recordset, t1Recset As New ADODB.Recordset, mJrcVchNo As Long

With tRecset
.Open "Select top 1 * from JobRcHdr order by JrhCode desc", dbGtdDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    dtpJrcDate.Text = Dtoc(.fields("JrhDate"))
    fcmbVtmName.BoundText = CStr(.fields("JrhVtmCode"))
Else
    dtpJrcDate.Text = Dtoc(DefaultEntryDate)
    With t1Recset
    .Open "Select top 1 * from VTypMast where VtmSysCode=" & CStr(cGTD_VTYPE_JOB_RCPT) & "", dbAcDatabase, adOpenKeyset, adLockOptimistic
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
txtJrcTime_str.Text = MinToTime(TimeToMin(DateTime.Time$))

mJrcVchNo = GetNextVTypeNo(dbGtdDatabase, dbAcDatabase, dbComDatabase, mTableName:="JobRcHdr", mFieldName:="JrhVchNo", mVtmFieldName:="JrhVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="JrhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="JrhDate", mDateFieldValue:=Ctod(dtpJrcDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
mskJrcVchNo.Text = ToMyNumFmt(mJrcVchNo, mDecimals:=0)
dtpJrcTrnRefDt.Text = Dtoc(DefaultEntryDate)

End Sub

Private Sub StoreJrcOldData()
mJrcCode_old = mJrcCode
mJrcPrtCode_old = Val(fcmbPrtName.BoundText)
mJrcDate_old = Ctod(dtpJrcDate.Text)
mJrcTime_old = TimeToMin(txtJrcTime_str.Text)
mJrcVtmCode_old = Val(fcmbVtmName.BoundText)
mJrcVchNo_old = Val(UnMyNumFmt(mskJrcVchNo.Text))

End Sub

Private Sub StoreStkOldData()
mJrcStkCode_old = mJrcStkCode

End Sub

Private Sub ShowDtlData(ByVal mJrcCode As Long)
Dim srow As Integer, tRecset As New ADODB.Recordset, mColCnt As Integer, mSdcCount As Integer

srow = 1
Mfgrd2.Rows = 2

With tRecset
.Open "Select * from JobRcpt where JrcCode=" & CStr(mJrcCode) & " order by JrcSno", dbGtdDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Do While .EOF = False
        If InList(.fields("JrcRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
            clsSIM.GetData .fields("JrcSimCode")
            
            Mfgrd2.TextMatrix(srow, X2JRCICODE_COL) = .fields("JrcICode")
            Mfgrd2.TextMatrix(srow, X2JRCSTKICODE_COL) = .fields("JrcStkICode")
            Mfgrd2.TextMatrix(srow, X2JRCSNO_COL) = ToMyNumFmt(.fields("JrcSno"), mDecimals:=0)
            Mfgrd2.TextMatrix(srow, X2SIMNAME_COL) = clsSIM.mName_str
            Mfgrd2.TextMatrix(srow, X2JRCSIMREFNO_COL) = .fields("JrcSimRefNo")
            Mfgrd2.TextMatrix(srow, X2JRCNARR_COL) = .fields("JrcNarr")
            Mfgrd2.TextMatrix(srow, X2JRCQTY_COL) = ToMyNumFmt(.fields("JrcQty"), mDecimals:=0)
            Mfgrd2.TextMatrix(srow, X2JRCRATE_COL) = ToMyNumFmt(.fields("JrcRate"))
            Mfgrd2.TextMatrix(srow, X2JRCAMOUNT_COL) = ToMyNumFmt(.fields("JrcAmount"))
            Mfgrd2.TextMatrix(srow, X2JRCSIMCODE_COL) = .fields("JrcSimCode")
            Mfgrd2.TextMatrix(srow, X2JRCITMCODE_COL) = .fields("JrcItmCode")
            Mfgrd2.TextMatrix(srow, X2JRCITRCODE_COL) = .fields("JrcItrCode")
            Mfgrd2.TextMatrix(srow, X2JRCRECSTATE_COL) = .fields("JrcRecState")
            
            Mfgrd2.Rows = Mfgrd2.Rows + 1
            srow = srow + 1
        Else
            If InList(.fields("JrcRecState"), Array(cREC_CANCELED, cREC_DELETED)) = False Then
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

With clsJRC
If FormAddEditMode = cFORM_ADDMODE Then
    .ClearHdr
Else
    .GetHdrData mJrcCode
End If
.mTrnDate_dt = Ctod(dtpJrcDate.Text)
.mTrnVtmCode_lng = Val(fcmbVtmName.BoundText)
.mTrnPrefix_str = txtJrcPrefix.Text
.mTrnVchNo_lng = Val(UnMyNumFmt(mskJrcVchNo.Text))
.mTrnPostfix_str = ""
.mTrnCmpCode_int = sFinYrCmpCode

.mJrhStkCode_lng = mJrcStkCode
.mJrhTime_lng = TimeToMin(txtJrcTime_str.Text)
.mJrhPrtCode_lng = Val(fcmbPrtName.BoundText)
.mJrhTrnRefNo_str = txtJrcTrnRefNo.Text
.mJrhTrnRefDt_dt = Ctod(dtpJrcTrnRefDt.Text)
.mJrhQty_dbl = Val(UnMyNumFmt(lblJrcQtyTot.Caption))
.mJrhAmount_dbl = Val(UnMyNumFmt(lblJrcAmountTot.Caption))
.mJrhRemark_str = txtJrhRemark.Text

If FormAddEditMode = cFORM_ADDMODE Then
    If .AddNewHdr() = True Then
        mskFormBoundField.Text = .mTrnCode_lng
        mJrcCode = .mTrnCode_lng
    End If
Else
    .UpdateHdr mJrcCode
End If
If .mTrnCode_lng > 0 Then   ' updated successfully
    With clsSTK
    If FormAddEditMode = cFORM_ADDMODE Then
        .ClearHdr
    Else
        .GetHdrData mJrcStkCode
    End If
    .mShrVtmCode_lng = Val(fcmbVtmName.BoundText)
    .mShrPrefix_str = txtJrcPrefix.Text
    .mShrVchNo_lng = Val(UnMyNumFmt(mskJrcVchNo.Text))
    .mShrPostfix_str = ""
    .mShrDate_dt = Ctod(dtpJrcDate.Text)
    .mShrQty_dbl = Val(UnMyNumFmt(lblJrcQtyTot.Caption))
    .mShrValue_dbl = Val(UnMyNumFmt(lblJrcAmountTot.Caption))
    .mShrNarr_str = "Automated Job Receipt"
    .mShrAutoGen_bln = True
    .mShrCmpCode_int = sFinYrCmpCode
    If FormAddEditMode = cFORM_ADDMODE Then
        If .AddNewHdr() = True Then
            mskJrcStkCode.Text = .mShrCode_lng
            mJrcStkCode = .mShrCode_lng
        End If
    Else
        .UpdateHdr mJrcStkCode
    End If
    If .mShrCode_lng > 0 Then
        If FormAddEditMode = cFORM_ADDMODE Then
            clsJRC.GetHdrData mJrcCode
            clsJRC.mJrhStkCode_lng = mJrcStkCode
            
            dbGtdDatabase.BeginTrans
            dbGtdDatabase.Execute "Update JobRcHdr set JrhStkCode=" & CStr(mJrcStkCode) & " where JrhCode=" & CStr(mJrcCode)
            dbGtdDatabase.Execute "Update JobRcpt set JrcStkCode=" & CStr(mJrcStkCode) & " where JrcCode=" & CStr(mJrcCode)
            dbGtdDatabase.CommitTrans
        End If
        clsJRC.UpdateTran mJrcCode
        clsJRC.EndTran mJrcCode
        
        .CommitStock mJrcStkCode
        .EndStock mJrcStkCode
        
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

If clsJRC.mTrnCode_lng > 0 Then   ' updated successfully
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

mJrcCode = datRecset.fields("JrhCode")
mJrcStkCode = datRecset.fields("JrhStkCode")
mRecAbsPos = datRecset.AbsolutePosition

If clsJRC.CanDeleteTran(mJrcCode) = True Then
    txtVoid.SetFocus
    If clsJRC.BeginTran(mJrcCode) = True And clsSTK.BeginStock(mJrcStkCode) = True Then
        clsJRC.DeleteTran mJrcCode
        clsJRC.UpdateTran mJrcCode
        clsJRC.EndTran mJrcCode
        
        clsSTK.DeleteStock mJrcStkCode
        clsSTK.CommitStock mJrcStkCode
        clsSTK.EndStock mJrcStkCode
        
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
clsJRC.CancelTran mJrcCode
clsJRC.EndTran mJrcCode

clsSTK.CancelStock mJrcStkCode
clsSTK.EndStock mJrcStkCode

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
        clsListStru.AddFields mExpr:="JrcYrMonth", mAttrib:=cFAT_SYSTEM
        clsListStru.AddFields mExpr:="JrcMnYear", mTitle:="Month", mShowItem:=True, mAlign:=flexAlignLeftCenter, mWidth:=2000
        clsListStru.AddFields mExpr:="JrcCount", mTitle:="Count", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="JrcQty_sum", mTitle:="Qty", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="JrcAmount_sum", mTitle:="Amount", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        
        datRecset.Open "Select format(JrhDate,'yyyy/MM') as JrcYrMonth" _
         & ",Count(JrhCode) as JrcCount" _
         & ",Sum(JrhQty) as JrcQty_sum" _
         & ",Sum(JrhAmount) as JrcAmount_sum" _
         & " from JobRcHdr" _
         & " where JrhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and JrhCode>0" _
         & IIf(mQryPrtCode > 0, " and JrhPrtCode=" & CStr(mQryPrtCode), "") _
         & " group by format(JrhDate,'yyyy/MM')" _
         & " order by format(JrhDate,'yyyy/MM')" _
         , dbGtdDatabase, adOpenKeyset, adLockReadOnly

    ElseIf optDatewise.Value = True Then
        clsListStru.AddFields mExpr:="JrcDateYMD", mAttrib:=cFAT_SYSTEM
        clsListStru.AddFields mExpr:="JrcDate", mTitle:="Date", mShowItem:=True, mAlign:=flexAlignLeftCenter, mWidth:=2000
        clsListStru.AddFields mExpr:="JrcCount", mTitle:="Count", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="JrcQty_sum", mTitle:="Qty", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="JrcAmount_sum", mTitle:="Amount", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        
        datRecset.Open "Select JrhDate" _
         & ",Count(JrhCode) as JrcCount" _
         & ",Sum(JrhQty) as JrcQty_sum" _
         & ",Sum(JrhAmount) as JrcAmount_sum" _
         & " from JobRcHdr" _
         & " where JrhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and JrhCode>0" _
         & IIf(mQryPrtCode > 0, " and JrhPrtCode=" & CStr(mQryPrtCode), "") _
         & " group by JrhDate" _
         & " order by JrhDate" _
         , dbGtdDatabase, adOpenKeyset, adLockReadOnly
        
    ElseIf optPartywise.Value = True Then
        clsListStru.AddFields mExpr:="PrtName", mTitle:="Party Name", mShowItem:=True, mAlign:=flexAlignLeftCenter, mWidth:=3000
        clsListStru.AddFields mExpr:="JrcCount", mTitle:="Count", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="JrcQty_sum", mTitle:="Qty", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="JrcAmount_sum", mTitle:="Amount", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        
        datRecset.Open "Select PartyMast.PrtName,JobRcHdr.JrhPrtCode" _
         & ",Count(JrhCode) as JrcCount" _
         & ",Sum(JrhQty) as JrcQty_sum" _
         & ",Sum(JrhAmount) as JrcAmount_sum" _
         & " from JobRcHdr inner join PartyMast on JobRcHdr.JrhPrtCode=PartyMast.PrtCode" _
         & " where JrhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and JrhCode>0" _
         & IIf(mQryPrtCode > 0, " and JrhPrtCode=" & CStr(mQryPrtCode), "") _
         & " group by PartyMast.PrtName,JobRcHdr.JrhPrtCode" _
         & " order by PartyMast.PrtName,JobRcHdr.JrhPrtCode" _
         , dbGtdDatabase, adOpenKeyset, adLockReadOnly
    End If
    
ElseIf optDetailed.Value = True Then
    clsListStru.AddFields mExpr:="tJrcSmryId", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="JrcCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="VtmName", mTitle:="Voucher", mAlign:=flexAlignLeftCenter, mWidth:=1500, mShowItem:=True
    clsListStru.AddFields mExpr:="JrcVchNo", mTitle:="Vchr.No", mAlign:=flexAlignRightCenter, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="JrcDate", mTitle:="Date", mAlign:=flexAlignLeftCenter, mWidth:=1300, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="PrtCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="PrtName", mTitle:="Party Name", mAlign:=flexAlignLeftCenter, mWidth:=2500, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="JrcQty", mTitle:="Qty", mAlign:=flexAlignRightCenter, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="JrcAmount", mTitle:="Amount", mAlign:=flexAlignRightCenter, mWidth:=1250, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="PrtAddr", mTitle:="Address", mAlign:=flexAlignLeftCenter, mWidth:=2000, mShowItem:=True
    clsListStru.AddFields mExpr:="PatAraName", mTitle:="Area", mAlign:=flexAlignLeftCenter, mWidth:=1500, mShowItem:=True
    clsListStru.AddFields mExpr:="PatStnName", mTitle:="Station", mAlign:=flexAlignLeftCenter, mWidth:=1500, mShowItem:=True
    
    datRecset.Open "Select JobRcHdr.*,PartyMast.*" _
     & ",format(JrhDate,'yyyymmdd')+format(JrhCode,'0000000') as tJrcSmryId" _
     & " from JobRcHdr inner join PartyMast on JobRcHdr.JrhPrtCode=PartyMast.PrtCode" _
     & " where JrhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & IIf(mRemoteAccess = True, " and JrhCode=" & CStr(mJrcCode) & "", "") _
     & " and JrhCode>0" _
     & IIf(mQryPrtCode > 0, " and JrhPrtCode=" & CStr(mQryPrtCode), "") _
     & " order by JrhDate,JrhCode" _
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
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrcYrMonth")) = .fields("JrcYrMonth")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrcMnYear")) = MonthName(Val(Right(.fields("JrcYrMonth"), 2))) & "-" & Left(.fields("JrcYrMonth"), 4)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrcCount")) = ToMyNumFmt(.fields("JrcCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrcQty_sum")) = ToMyNumFmt(.fields("JrcQty_sum"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrcAmount_sum")) = ToMyNumFmt(.fields("JrcAmount_sum"))
                
            ElseIf optDatewise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrcDateYMD")) = Format(.fields("JrhDate"), "yyyymmdd")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrcDate")) = Dtoc(.fields("JrhDate"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrcCount")) = ToMyNumFmt(.fields("JrcCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrcQty_sum")) = ToMyNumFmt(.fields("JrcQty_sum"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrcAmount_sum")) = ToMyNumFmt(.fields("JrcAmount_sum"))
                
            ElseIf optPartywise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PrtName")) = .fields("PrtName")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrcCount")) = ToMyNumFmt(.fields("JrcCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrcQty_sum")) = ToMyNumFmt(.fields("JrcQty_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrcAmount_sum")) = ToMyNumFmt(.fields("JrcAmount_sum"))
                
            End If
        
        ElseIf optDetailed.Value = True Then
            clsARA.GetData .fields("PrtAraCode")
            clsSTN.GetData .fields("PrtStnCode")
            clsVTM.GetData .fields("JrhVtmCode")
            
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("tJrcSmryId")) = .fields("tJrcSmryId") '''  Format(.fields("JrhDate"), "yyyymmdd") & Format(.fields("JrhCode"), "0000000")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrcCode")) = .fields("JrhCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("VtmName")) = clsVTM.mName_str
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrcVchNo")) = .fields("JrhVchNo")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrcDate")) = Dtoc(.fields("JrhDate"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrcQty")) = ToMyNumFmt(.fields("JrhQty"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrcAmount")) = ToMyNumFmt(.fields("JrhAmount"))
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
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("tJrcSmryId"), mText
    ElseIf optMonthwise.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("JrcYrMonth"), mText
    ElseIf optDatewise.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("JrcDateYMD"), mText
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
            SendKeys "{tab}"
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
    If FormAddEditMode = cFORM_ADDMODE Or dtlAddMode = True Or Val(fcmbSimName.BoundText) <> mJrcSimCode_old Then
        clsSIM.GetData Val(fcmbSimName.BoundText)
        mskJrcItmCode.Text = clsSIM.mSimItmCode_lng
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

Private Sub CalcJrcChg()
Dim mJrcQty As Long, mJrcRate As Double, mJrcAmount As Double
mJrcQty = Val(UnMyNumFmt(mskJrcQty.Text))
mJrcRate = Val(UnMyNumFmt(mskJrcRate.Text))
mJrcAmount = Round(mJrcQty * mJrcRate, 2)
' --------
mskJrcAmount.Text = ToMyNumFmt(mJrcAmount)

End Sub

Private Sub ShowOldJrcCodeDesc()
Dim tRecset As New ADODB.Recordset, mJrcDate As Date, mJrcPrtCode As Long

mJrcPrtCode = Val(fcmbPrtName.BoundText)
mJrcDate = Ctod(dtpJrcDate.Text)
With tRecset
'If FormAddEditMode = cFORM_ADDMODE Then
'    .Open "Select top 1 jrh.*,vtm.VtmName from JobRcHdr jrh inner join VTypMast vtm on jrh.JrhVtmCode=vtm.VtmCode where jrh.JrhPrtCode=" & CStr(mJrcPrtCode) & " order by jrh.JrhDate Desc", dbComDatabase, adOpenKeyset, adLockOptimistic
'Else
    .Open "Select top 1 jrh.*,vtm.VtmName from JobRcHdr jrh inner join VTypMast vtm on jrh.JrhVtmCode=vtm.VtmCode where jrh.JrhPrtCode=" & CStr(mJrcPrtCode) & " and jrh.JrhCode<>" & CStr(mJrcCode) & " and jrh.JrhDate<=#" & ToSysDate(mJrcDate) & "#" & " order by jrh.JrhDate Desc", dbComDatabase, adOpenKeyset, adLockOptimistic
'End If
If .EOF = False Then
    lblOldJrcCodeDesc.Caption = RTrim(.fields("VtmName")) & " No.:" & CStr(.fields("JrhVchNo")) & " Dated:" & Dtoc(.fields("JrhDate"))
Else
    lblOldJrcCodeDesc.Caption = "#" & CStr(mJrcPrtCode) & "#"
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
    Rem mskJrcICode.Top = mRowPos
    Rem mskJrcStkICode.Top = mRowPos
    mskJrcSno.Top = mRowPos
    txtSimName.Top = mRowPos
    Rem mskJrcItmCode.Top = mRowPos
    Rem mskJrcItrCode.Top = mRowPos
    txtJrcSimRefNo.Top = mRowPos
    txtJrcNarr.Top = mRowPos
    mskJrcQty.Top = mRowPos
    mskJrcRate.Top = mRowPos
    mskJrcAmount.Top = mRowPos
    cmdOK.Top = mRowPos
End If

mskJrcICode.Text = 0
mskJrcStkICode.Text = 0
mskJrcSno.Text = 0
txtSimName.Text = "": fcmbSimName.BoundText = ""
mskJrcItmCode.Text = 0
mskJrcItrCode.Text = 0
txtJrcSimRefNo.Text = ""
mskJrcQty.Text = ToMyNumFmt(0, mDecimals:=0)
txtJrcNarr.Text = ""
mskJrcRate.Text = ToMyNumFmt(0)
mskJrcAmount.Text = ToMyNumFmt(0)

Call ValidDtl

mskJrcICode.Visible = False     '''  mShowItem
mskJrcStkICode.Visible = False     '''  mShowItem
mskJrcSno.Visible = mShowItem
txtSimName.Visible = mShowItem
mskJrcItmCode.Visible = False     '''  mShowItem
mskJrcItrCode.Visible = False     '''  mShowItem
txtJrcSimRefNo.Visible = mShowItem
mskJrcQty.Visible = mShowItem
txtJrcNarr.Visible = mShowItem
mskJrcRate.Visible = mShowItem
mskJrcAmount.Visible = mShowItem
cmdOK.Visible = mShowItem

frHeader.Enabled = (mShowItem = False)
Mfgrd2.Enabled = (mShowItem = False)
frFooter.Enabled = (mShowItem = False)
cmdSaveForm.Enabled = (mShowItem = False)

End Sub

Private Sub ValidDtl()
Dim mDataOk As Boolean, srow As Integer

srow = Mfgrd2.Row
mDataOk = (Trim(txtPrtName.Text) <> "" And Val(fcmbPrtName.BoundText) > 0 And Val(UnMyNumFmt(mskJrcSno.Text)) > 0 And Trim(txtSimName.Text) <> "" And Val(fcmbSimName.BoundText) > 0 And Val(mskJrcItmCode.Text) > 0 And Trim(txtJrcSimRefNo.Text) <> "" And IIf(dtlAddMode = True, True, Val(mskJrcItrCode.Text) > 0 And Val(mskJrcICode.Text) > 0 And Val(mskJrcStkICode.Text) > 0) And Val(UnMyNumFmt(mskJrcQty.Text)) > 0)                                     ''' And Val(UnMyNumFmt(mskJrcRate.Text)) > 0 And Val(UnMyNumFmt(mskJrcAmount.Text)) >= 0

cmdOK.Caption = IIf(mDataOk = True, "&OK", "&Cancel")
cmdOK.BackColor = IIf(mDataOk = True, &H80FF80, &H8080FF)
End Sub

Private Sub CalcFtrTotal(Optional ByVal mCalcBalOnly As Boolean = False)
Dim mJrcQtyTot As Double, mJrcAmountTot As Double

mJrcQtyTot = FlexColSum(Mfgrd2, X2JRCQTY_COL)
mJrcAmountTot = FlexColSum(Mfgrd2, X2JRCAMOUNT_COL)

lblJrcQtyTot.Caption = ToMyNumFmt(mJrcQtyTot, mDecimals:=0)
lblJrcAmountTot.Caption = ToMyNumFmt(mJrcAmountTot)

End Sub

Private Sub ShowLinkTranDtl()
Dim tRecset As New ADODB.Recordset, mLinkTranStr As String

mLinkTranStr = ""

With tRecset
.Open "Select * from ((JobIssu jis" _
    & " inner join JobIsHdr jih on jis.JisCode=jih.JihCode)" _
    & " inner join SubItmMast sim on jis.JisSimCode=sim.SimCode)" _
    & " inner join VTypMast vtm on jih.JihVtmCode=vtm.VtmCode" _
    & " where JisJrcCode=" & CStr(mJrcCode) _
    & " order by JisDate,JisSno" _
    , dbComDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    Do While .EOF = False
        mLinkTranStr = mLinkTranStr & .fields("VtmName") & " No." & CStr(.fields("JihVchNo")) & " Dt." & Dtoc(.fields("JihDate")) & " It." & .fields("SimName") & " Rf." & .fields("JisSimRefNo") & " Qty." & ToMyNumFmt(.fields("JisQty"), mDecimals:=0) & vbCrLf
    
        .MoveNext
    Loop
End If
End With
CloseTable tRecset

lblLinkTranDesc.Caption = mLinkTranStr

End Sub

Private Function ChkAnyPriorIsuExist() As Boolean
Dim tRecset As New ADODB.Recordset

ChkAnyPriorIsuExist = False

With tRecset
.Open "Select top 1 * from ((JobRcpt" _
    & " inner join JobRcHdr on JobRcpt.JrcCode=JobRcHdr.JrhCode)" _
    & " inner join JobIssu on JobRcpt.JrcICode=JobIssu.JisJrcICode)" _
    & " Inner Join JobIsHdr on JobIssu.JisCode=JobIsHdr.JihCode" _
    & " where JrcCode=" & CStr(mJrcCode) _
    & " and JisDate<#" & CStr(ToSysDate(Ctod(dtpJrcDate.Text))) & "#" _
    & " order by JisDate,JisCode" _
    , dbGtdDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    clsVTM.GetData .fields("JihVtmCode")
    ErrorBox "Prior Job Issue Exist !!!" _
        & vbCrLf & clsVTM.mName_str & " No." & CStr(.fields("JihVchNo")) & " Dated " & Dtoc(.fields("JihDate")) & ""
    ChkAnyPriorIsuExist = True
End If
End With
CloseTable tRecset

End Function

Private Function ChkAnyMisLinkedIsuExist(Optional ByVal mJrcICode) As Boolean
Dim tRecset As New ADODB.Recordset, mMisLinkedDesc As String

ChkAnyMisLinkedIsuExist = False
mMisLinkedDesc = ""

With tRecset
.Open "Select top 1 * from ((JobRcpt" _
    & " inner join JobRcHdr on JobRcpt.JrcCode=JobRcHdr.JrhCode)" _
    & " inner join JobIssu on JobRcpt.JrcICode=JobIssu.JisJrcICode)" _
    & " Inner Join JobIsHdr on JobIssu.JisCode=JobIsHdr.JihCode" _
    & " where JrcCode=" & CStr(mJrcCode) & IIf(IsMissing(mJrcICode) = False, " and JrcICode=" & CStr(mJrcICode), "") _
    & " and (JihPrtCode<>" & CStr(Val(fcmbPrtName.BoundText)) & " or JisSimCode<>JrcSimCode or JisItmCode<>JrcItmCode or JisItrCode<>JrcItrCode or JisSimRefNo<>JrcSimRefNo)" _
    & " order by JihDate,JihCode" _
    , dbGtdDatabase, adOpenKeyset, adLockOptimistic

If .EOF = False Then
    clsVTM.GetData .fields("JihVtmCode")
    If .fields("JihPrtCode") <> Val(fcmbPrtName.BoundText) Then
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
    ErrorBox "Mis-Linked Job Issue Exist !!!" _
        & vbCrLf & clsVTM.mName_str & " No." & CStr(.fields("JihVchNo")) & " Dated " & Dtoc(.fields("JihDate")) _
        & vbCrLf & "Alteration made in " _
        & vbCrLf & mMisLinkedDesc
    ChkAnyMisLinkedIsuExist = True
End If
End With
CloseTable tRecset

End Function

Private Function ChkAnyShortRcExist(Optional ByVal mJrcICode) As Boolean
Dim tRecset As New ADODB.Recordset

ChkAnyShortRcExist = False

With tRecset
.Open "Select top 1 * from (" _
    & "Select JrcICode,SimCode,ItmCode,ItrCode,SimRefNo,sum(Qty) as Qty_sum from (" _
    & "Select JrcICode,JrcSimCode as SimCode,JrcItmCode as ItmCode,JrcItrCode as ItrCode,JrcSimRefNo as SimRefNo,JrcQty as Qty from JobRcpt" _
    & " inner join JobRcHdr on JobRcpt.JrcCode=JobRcHdr.JrhCode" _
    & " where JrcCode=" & CStr(mJrcCode) & IIf(IsMissing(mJrcICode) = False, " and JrcICode=" & CStr(mJrcICode), "") _
    & " and JrcRecState IN (" & CStr(cREC_ADDED) & "," & CStr(cREC_EDITED) & "," & CStr(cREC_UNCHANGED) & ")" _
    & " Union All " _
    & "Select JisJrcICode as JrcICode,JisSimCode as SimCode,JisItmCode as ItmCode,JisItrCode as ItrCode,JisSimRefNo as SimRefNo,(JisQty*-1) as Qty from (JobIssu" _
    & " left join JobIsHdr on JobIssu.JisCode=JobIsHdr.JihCode)" _
    & " inner join JobRcpt on JobIssu.JisJrcICode=JobRcpt.JrcICode" _
    & " where JisJrcCode=" & CStr(mJrcCode) & IIf(IsMissing(mJrcICode) = False, " and JisJrcICode=" & CStr(mJrcICode), "") _
    & " and JisRecState<>" & CStr(cREC_CANCELED) _
    & ")" _
    & " group by JrcICode,SimCode,ItmCode,ItrCode,SimRefNo order by JrcICode,SimCode,ItmCode,ItrCode,SimRefNo" _
    & ") as a" _
    & " inner join SubItmMast on a.SimCode=SubItmMast.SimCode" _
    & " where Qty_sum<0" _
    , dbGtdDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    ErrorBox "Job Receipt going Short for Item " & vbCrLf & .fields("SimName") & " Ref.No." & CStr(.fields("SimRefNo")) & " by Qty " & CStr(.fields("Qty_sum"))
    ChkAnyShortRcExist = True
End If
End With
CloseTable tRecset

End Function

