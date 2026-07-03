VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "Mscomctl.ocx"
Begin VB.Form frmBookIssue 
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
      ItemData        =   "BookIsu.frx":0000
      Left            =   0
      List            =   "BookIsu.frx":000D
      Style           =   1  'Simple Combo
      TabIndex        =   35
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
      Height          =   9375
      Left            =   120
      TabIndex        =   34
      Top             =   840
      Width           =   14895
      Begin VB.TextBox txtGdmName 
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
         Left            =   10080
         MaxLength       =   50
         TabIndex        =   25
         Text            =   "GdmName"
         Top             =   4320
         Width           =   2175
      End
      Begin VB.TextBox mskBidSimCode 
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
         TabIndex        =   22
         Tag             =   "AhCode"
         Text            =   "BidSimCode"
         Top             =   5520
         Visible         =   0   'False
         Width           =   1335
      End
      Begin VB.TextBox txtBidNarr 
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
         Left            =   6000
         MaxLength       =   150
         TabIndex        =   21
         Text            =   "BidNarr"
         Top             =   4320
         Width           =   3255
      End
      Begin VB.TextBox mskBidPurICode 
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
         TabIndex        =   27
         Tag             =   "AhCode"
         Text            =   "BidPurICode"
         Top             =   5160
         Visible         =   0   'False
         Width           =   1335
      End
      Begin VB.TextBox mskBidPurCode 
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
         TabIndex        =   26
         Tag             =   "AhCode"
         Text            =   "BidPurCode"
         Top             =   5160
         Visible         =   0   'False
         Width           =   1335
      End
      Begin VB.TextBox mskBidItmCode 
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
         TabIndex        =   23
         Tag             =   "AhCode"
         Text            =   "BidItmCode"
         Top             =   5160
         Visible         =   0   'False
         Width           =   1335
      End
      Begin VB.TextBox txtBidItrRefNo 
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
         Left            =   3840
         MaxLength       =   25
         TabIndex        =   24
         Text            =   "BidItrRefNo"
         Top             =   4320
         Width           =   2175
      End
      Begin VB.TextBox mskBidICode 
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
         TabIndex        =   18
         Tag             =   "AhCode"
         Text            =   "BidICode"
         Top             =   5160
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
         Left            =   13680
         Style           =   1  'Graphical
         TabIndex        =   29
         Top             =   4680
         Width           =   735
      End
      Begin VB.TextBox mskBidSno 
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
         TabIndex        =   19
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
         Width           =   14655
         Begin VB.TextBox dtpBisTrnRefDt 
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
         Begin VB.TextBox txtBisTrnRefNo 
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
         Begin VB.TextBox txtBisTime_str 
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
         Begin VB.TextBox dtpBisDate 
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
         Begin VB.TextBox mskBisVchNo 
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
         Begin VB.TextBox txtBisPrefix 
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
         Begin VB.TextBox txtSdtName 
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
         Begin VB.TextBox txtSdtAddr 
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
         Begin VB.TextBox txtSdtTelNo 
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
         Begin VB.TextBox txtSdtSMSNo 
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
         Begin VB.TextBox txtBihRemark 
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
            Height          =   255
            Index           =   37
            Left            =   3960
            TabIndex        =   67
            Top             =   2640
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
            Height          =   255
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
            Caption         =   "Student Name:"
            BeginProperty Font 
               Name            =   "Verdana"
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
            BackColor       =   &H00D9FFB3&
            BackStyle       =   1  'Opaque
            Height          =   2415
            Index           =   0
            Left            =   0
            Top             =   120
            Width           =   14655
         End
         Begin VB.Shape Shape1 
            BackColor       =   &H00F7D987&
            BackStyle       =   1  'Opaque
            Height          =   855
            Index           =   2
            Left            =   0
            Top             =   2520
            Width           =   14655
         End
      End
      Begin VB.TextBox txtBkmName 
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
         TabIndex        =   20
         Text            =   "BkmName"
         Top             =   4320
         Width           =   3255
      End
      Begin VB.TextBox mskBidQty 
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
         Left            =   12360
         TabIndex        =   28
         Tag             =   "AhCode"
         Text            =   "BidQty"
         Top             =   4320
         Width           =   1335
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
         Left            =   14280
         Style           =   1  'Graphical
         TabIndex        =   30
         Top             =   9240
         Width           =   375
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd2 
         Height          =   3135
         Left            =   120
         TabIndex        =   17
         Top             =   3600
         Width           =   14655
         _ExtentX        =   25850
         _ExtentY        =   5530
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
         Height          =   2535
         Left            =   120
         TabIndex        =   70
         Top             =   6720
         Width           =   14655
         Begin VB.TextBox txtLinkTranDesc 
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
            Height          =   1245
            Left            =   0
            MultiLine       =   -1  'True
            ScrollBars      =   2  'Vertical
            TabIndex        =   77
            TabStop         =   0   'False
            Text            =   "BookIsu.frx":002D
            Top             =   840
            Width           =   9975
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Last Sale:"
            BeginProperty Font 
               Name            =   "Verdana"
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
            Top             =   2160
            Width           =   1695
         End
         Begin VB.Label lblOldSalCodeDesc 
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
            Top             =   2160
            Width           =   6135
         End
         Begin VB.Label lblTaxSmry 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Sale / Purchase Return Tax Summary"
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
            Left            =   0
            TabIndex        =   72
            Top             =   480
            Width           =   9975
            WordWrap        =   -1  'True
         End
         Begin VB.Label lblBidQtyTot 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "BidQtyTot"
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
            Left            =   12120
            TabIndex        =   71
            Top             =   120
            Width           =   1455
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
      Top             =   840
      Width           =   15015
      Begin VB.Frame frConfigure 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   5415
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
            Left            =   3000
            TabIndex        =   50
            Top             =   4800
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
            Height          =   3015
            Left            =   2160
            TabIndex        =   44
            Top             =   1560
            Width           =   2655
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
               TabIndex        =   45
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
               TabIndex        =   46
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
               TabIndex        =   47
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
               TabIndex        =   48
               Top             =   1800
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
   Begin VB.TextBox txtVoid 
      CausesValidation=   0   'False
      Height          =   375
      Left            =   0
      TabIndex        =   31
      TabStop         =   0   'False
      Text            =   "Void"
      Top             =   9720
      Width           =   375
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   78
      Top             =   10545
      Width           =   15210
      _ExtentX        =   26829
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
            TextSave        =   "07:59"
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
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Book Issue to Students"
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
      TabIndex        =   32
      Top             =   0
      Width           =   9015
   End
End
Attribute VB_Name = "frmBookIssue"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Dim mFormLoaded As Boolean, mLastKeyPressed As Integer, mMaskKeyPressed As Integer
Dim mFormUIdCode As Long, mFormUIdFileName As String, mFormAcsPermFileName As String
Dim mFormSysVchType As Integer, mFormVchTypeList As String, mSalCode As Long, mSalStkCode As Long, mQryPrtCode As Long, dtlAddEditMode As Boolean, dtlAddMode As Boolean, dtlEditCanceled As Boolean
Dim mRemoteAccess As Boolean, mEntrySaved As Boolean, mEntryAborted As Boolean
Dim dbAcDatabase As New ADODB.Connection, dbStDatabase As New ADODB.Connection, dbNcbDatabase As New ADODB.Connection, dbGrpDatabase As New ADODB.Connection, dbComDatabase As New ADODB.Connection
Dim datRecset As New ADODB.Recordset
Dim mSalCode_old As Long, mSalStkCode_old As Long, mSalPrtCode_old As Long, mSalDate_old As Date, mSalVtmCode_old As Long, mSalVchNo_old As Long, mSalTime_old As Long
Dim mSalBkmCode_old As Long, mSalItmCode_old As Long, mSalItrCode_old As Long, mSalPurCode_old As Long, mSalPurICode_old As Long, mSalAmtBefDisc_old As Double, mSalDiscPer_old As Double, mSalAmtBefTax_old As Double, mSalTaxPer_old As Double
Dim mSahAmount_old As Double
Dim clsAH As clsAccountHead, clsSTK As clsStockJrn, clsSAL As clsNcbMultiTranEntry, clsARA As clsComMastEntry, clsSTN As clsComMastEntry, clsVTM As clsComMastEntry
Dim clsPRT As clsNcbMasterEntry, clsBKM As clsNcbMasterEntry, clsSIM As clsNcbMasterEntry
Dim mActiveControl As Object, clsListStru As clsSelectQueryStructure
Dim fcmbVtmName As clsComFlexSearch
Dim fcmbPrtName As clsNcbFlexSearch, fcmbBkmName As clsNcbFlexSearch, fcmbItrRefNo As clsNcbFlexSearch, fcmbGdmName As clsNcbFlexSearch

Private Type SmryPara
mIndex() As Variant
mFromDate() As Variant
mToDate() As Variant
mPrtCode() As Variant
mExpanded() As Variant
mDetailed() As Variant
mMonthwise() As Variant
mDatewise() As Variant
mPatwise() As Variant

End Type

Dim SmryParaLayer As SmryPara

Rem service charges column definitions
Const X2SALICODE_COL = 0
Const X2SALSNO_COL = 1
Const X2BKMNAME_COL = 2
Const X2SALITRREFNO_COL = 3
Const X2SALQTY_COL = 4
Const X2SALRATE_COL = 5
Const X2PURMRP_COL = 6
Const X2PURRATE_COL = 7
Const X2SALAMTBEFDISC_COL = 8
Const X2SALDISCPER_COL = 9
Const X2SALDISCAMT_COL = 10
Const X2SALAMTBEFTAX_COL = 11
Const X2SALTAXPER_COL = 12
Const X2SALTAXAMT_COL = 13
Const X2SALAMOUNT_COL = 14
Const X2SALNARR_COL = 15
Const X2SALBKMCODE_COL = 16
Const X2SALITMCODE_COL = 17
Const X2SALITRCODE_COL = 18
Const X2SALSTKICODE_COL = 19
Const X2SALPURCODE_COL = 20
Const X2SALPURICODE_COL = 21
Const X2SALRECSTATE_COL = 22
Const MFGRD2_COLS = 23

Private Sub ClearSmryParaLayer()

With SmryParaLayer
.mIndex = Array()
.mFromDate = Array()
.mToDate = Array()
.mPrtCode = Array()
.mExpanded = Array()
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
    ReDim Preserve .mExpanded(mIndex)
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
ReDim Preserve .mExpanded(mIndex)
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
.mExpanded(mIndex) = optExpanded.Value
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
optExpanded.Value = False
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
optExpanded.Value = .mExpanded(mIndex)
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

Public Property Let FormSysVchType(ByVal mSysVchType As Integer)
mFormSysVchType = mSysVchType
End Property

Public Property Let RemoteAccessCode(ByVal mAccessCode As Long)
mRemoteAccess = True
mSalCode = mAccessCode
End Property

Public Property Get EntryBoundCode() As Long
EntryBoundCode = Val(mskFormBoundField.Text)
End Property

Public Property Get EntryDate() As Date
EntryDate = Ctod(dtpSalDate.Text)
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
                fcmbPrtName.BoundText = CStr(mQryPrtCode)
                
                txtVoid.SetFocus
                If optMonthwise.Value = True Then
                    dtpFromDate.Text = Dtoc(MonthStartDate(DateSerial(Val(Left(.fields("SalYrMonth"), 4)), Val(Right(.fields("SalYrMonth"), 2)), 1)))
                    dtpToDate.Text = Dtoc(MonthEndDate(DateSerial(Val(Left(.fields("SalYrMonth"), 4)), Val(Right(.fields("SalYrMonth"), 2)), 1)))
                    optMonthwise.Value = False
                    optDatewise.Value = True
                ElseIf optDatewise.Value = True Then
                    dtpFromDate.Text = Dtoc(.fields("SahDate"))
                    dtpToDate.Text = Dtoc(.fields("SahDate"))
                    optDatewise.Value = False
                    optDetailed.Value = True
                ElseIf optPartywise.Value = True Then
                    mQryPrtCode = .fields("SahPrtCode")
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
        txtPrtName.SetFocus
    End If
End If

End Sub

Private Sub cmdOK_Click()
Dim tRecset As New ADODB.Recordset, srow As Integer, mSalICode As Long, mSalStkICode As Long, mSalItrCode As Long, mReqdRecdAmt As Double

srow = Mfgrd2.Row
mSalICode = Val(Mfgrd2.TextMatrix(srow, X2SALICODE_COL))
mSalStkICode = Val(Mfgrd2.TextMatrix(srow, X2SALSTKICODE_COL))
mSalItrCode = Val(fcmbItrRefNo.BoundText)  ''' Val(Mfgrd2.TextMatrix(srow, X2SALITRCODE_COL))

If cmdOK.Caption = "&OK" And dtlEditCanceled = False Then
    Rem updating values in saledtl table
    With clsSAL
    If dtlAddMode = True Then
        .ClearDtl
    Else
        .GetDtlData mSalCode, mSalICode
    End If
    .mTrnCode_lng = mSalCode
    .mTrnDtlSno_int = Val(UnMyNumFmt(mskSalSno.Text))
    .mTrnDate_dt = Ctod(dtpSalDate.Text)
    .mTrnCmpCode_int = sFinYrCmpCode
    
    .mSalStkCode_lng = mSalStkCode
    .mSalStkICode_lng = mSalStkICode
    .mSalPrtCode_lng = Val(fcmbPrtName.BoundText)
    .mSalBkmCode_lng = Val(fcmbBkmName.BoundText)
    .mSalNarr_str = txtSalNarr.Text
    .mSalItmCode_lng = Val(mskSalItmCode.Text)
    .mSalItrCode_lng = Val(fcmbItrRefNo.BoundText)
    .mSalItrRefNo_str = txtSalItrRefNo.Text
    .mSalPurCode_lng = Val(mskSalPurCode.Text)
    .mSalPurICode_lng = Val(mskSalPurICode.Text)
    .mSalQty_dbl = Val(UnMyNumFmt(mskSalQty.Text))
    .mSalRate_dbl = Val(UnMyNumFmt(mskSalRate.Text))
    .mSalAmtBefDisc_dbl = Val(UnMyNumFmt(mskSalAmtBefDisc.Text))
    .mSalDiscPer_dbl = Val(UnMyPerFmt(mskSalDiscPer.Text))
    .mSalDiscAmt_dbl = Val(UnMyNumFmt(mskSalDiscAmt.Text))
    .mSalAmtBefTax_dbl = Val(UnMyNumFmt(mskSalAmtBefTax.Text))
    .mSalTaxPer_dbl = Val(UnMyPerFmt(mskSalTaxPer.Text))
    .mSalTaxAmt_dbl = Val(UnMyNumFmt(mskSalTaxAmt.Text))
    .mSalAmount_dbl = Val(UnMyNumFmt(mskSalAmount.Text))
    .mSalRemark_str = ""
    
    If dtlAddMode = True Then
        If .AddNewDtl(mSalCode) = True Then
            mSalICode = .mTrnDtlICode_lng
        End If
    Else
        .UpdateDtl mSalCode, mSalICode
    End If
    End With
    
    Rem updating values in stock table
    With clsSTK
    If dtlAddMode = True Then
        .ClearDtl
    Else
        .GetDtlData mSalStkCode, mSalStkICode
    End If
    .mStkSno_int = Val(UnMyNumFmt(mskSalSno.Text))
    .mStkVtmCode_lng = Val(fcmbVtmName.BoundText)
    .mStkPrefix_str = txtSalPrefix.Text
    .mStkVchNo_lng = Val(UnMyNumFmt(mskSalVchNo.Text))
    .mStkPostfix_str = ""
    .mStkDate_dt = Ctod(dtpSalDate.Text)
    .mStkItmCode_lng = Val(mskSalItmCode.Text)
    .mStkItmRefCode_lng = Val(fcmbItrRefNo.BoundText)
    .mStkItmRef1Name_str = txtSalItrRefNo.Text
    .mStkItmRef2Name_str = ""
    .mStkQty_dbl = ToIssueQty(Val(UnMyNumFmt(mskSalQty.Text)))
    .mStkRate_dbl = Val(UnMyNumFmt(mskSalRate.Text))
    .mStkValue_dbl = Val(UnMyNumFmt(mskSalAmount.Text))
    .mStkNarr_str = ""
    .mStkAutoGen_bln = True
    .mStkCmpCode_int = sFinYrCmpCode
    If dtlAddMode = True Then
        If .AddNewDtl(mSalStkCode) = True Then          ''' , mNewItemRef:=False
            mSalStkICode = .mStkICode_lng
        End If
    Else
        .UpdateDtl mSalStkCode, mSalStkICode
    End If
    End With
    
    Rem updating StkICode in SaleDtl
    With clsSAL
    If mSalICode > 0 And mSalStkICode > 0 And mSalItrCode > 0 Then
        If dtlAddMode = True Then
            .GetDtlData mSalCode, mSalICode
            
            .mSalStkICode_lng = mSalStkICode
            .UpdateDtl mSalCode, mSalICode
        Else
        End If
    End If
    End With
    
    RefreshDatabase dbNcbDatabase
    ChkAnyExcessIsuExist mSalICode
    ChkAnyMisLinkedRcExist mSalICode
    
    With tRecset
    .Open "Select * from SaleDtl" _
        & " left join (PurchDtl left join PurchHdr on PurchDtl.PurCode = PurchHdr.PuhCode)" _
        & " on SaleDtl.SalPurCode = PurchDtl.PurCode and SaleDtl.SalPurICode = PurchDtl.PurICode and SaleDtl.SalBkmCode = PurchDtl.PurBkmCode and SaleDtl.SalItmCode = PurchDtl.PurItmCode and SaleDtl.SalItrCode = PurchDtl.PurItrCode" _
        & " where SalCode=" & CStr(mSalCode) _
        & " and SalICode=" & CStr(mSalICode) _
        & " order by SalSno", dbNcbDatabase, adOpenKeyset, adLockOptimistic
    
    clsBKM.GetData .fields("SalBkmCode")
    
    Mfgrd2.TextMatrix(srow, X2SALICODE_COL) = .fields("SalICode")
    Mfgrd2.TextMatrix(srow, X2SALSTKICODE_COL) = .fields("SalStkICode")
    Mfgrd2.TextMatrix(srow, X2SALSNO_COL) = ToMyNumFmt(.fields("SalSno"), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2BKMNAME_COL) = clsBKM.mName_str
    Mfgrd2.TextMatrix(srow, X2SALITRREFNO_COL) = .fields("SalItrRefNo")
    Mfgrd2.TextMatrix(srow, X2SALQTY_COL) = ToMyNumFmt(.fields("SalQty"), mDecimals:=-1)
    Mfgrd2.TextMatrix(srow, X2SALRATE_COL) = ToMyNumFmt(.fields("SalRate"))
    Mfgrd2.TextMatrix(srow, X2PURMRP_COL) = ToMyNumFmt(.fields("PurMRP"))
    If mFormSysVchType = cCOM_VTYPE_RETNOUTW Then
        Mfgrd2.TextMatrix(srow, X2PURRATE_COL) = ToMyNumFmt(.fields("PurSRate"))
    Else
        Mfgrd2.TextMatrix(srow, X2PURRATE_COL) = ToMyNumFmt(.fields("PurRate"))
    End If
    Mfgrd2.TextMatrix(srow, X2SALAMTBEFDISC_COL) = ToMyNumFmt(.fields("SalAmtBefDisc"))
    Mfgrd2.TextMatrix(srow, X2SALDISCPER_COL) = ToMyPerFmt(.fields("SalDiscPer"), mDecimals:=-1)
    Mfgrd2.TextMatrix(srow, X2SALDISCAMT_COL) = ToMyNumFmt(.fields("SalDiscAmt"))
    Mfgrd2.TextMatrix(srow, X2SALAMTBEFTAX_COL) = ToMyNumFmt(.fields("SalAmtBefTax"))
    Mfgrd2.TextMatrix(srow, X2SALTAXPER_COL) = ToMyPerFmt(.fields("SalTaxPer"), mDecimals:=-1)
    Mfgrd2.TextMatrix(srow, X2SALTAXAMT_COL) = ToMyNumFmt(.fields("SalTaxAmt"))
    Mfgrd2.TextMatrix(srow, X2SALAMOUNT_COL) = ToMyNumFmt(.fields("SalAmount"))
    Mfgrd2.TextMatrix(srow, X2SALNARR_COL) = .fields("SalNarr")
    Mfgrd2.TextMatrix(srow, X2SALBKMCODE_COL) = .fields("SalBkmCode")
    Mfgrd2.TextMatrix(srow, X2SALITMCODE_COL) = .fields("SalItmCode")
    Mfgrd2.TextMatrix(srow, X2SALITRCODE_COL) = .fields("SalItrCode")
    Mfgrd2.TextMatrix(srow, X2SALPURCODE_COL) = .fields("SalPurCode")
    Mfgrd2.TextMatrix(srow, X2SALPURICODE_COL) = .fields("SalPurICode")
    Mfgrd2.TextMatrix(srow, X2SALRECSTATE_COL) = .fields("SalRecState")
    
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
    txtSearch1Text_InterActiveChange Format(Ctod(dtpSalDate.Text), "yyyymmdd") + Format(mSalCode, cLONGCODESTRFMT)
ElseIf optMonthwise.Value = True Then
    txtSearch1Text_InterActiveChange Format(Ctod(dtpSalDate.Text), "yyyy") & "/" & Format(Ctod(dtpSalDate.Text), "mm")
ElseIf optDatewise.Value = True Then
    txtSearch1Text_InterActiveChange Format(Ctod(dtpSalDate.Text), "yyyymmdd")
ElseIf optPartywise.Value = True Then
    txtSearch1Text_InterActiveChange txtPrtName.Text
End If

Call ShowEntryMode(False)
Mfgrd1.SetFocus

End Sub

Private Sub cmdSaveForm_GotFocus()
Dim mSalAcsPermNo As Integer, mRetryCount As Integer

txtVoid.SetFocus
cmdSaveForm.Enabled = False
If Data_Verify() = True Then
    If CanAccept() = True Then
        If GetAccessPerm(mSalAcsPermNo, mRetryCount, mFormAcsPermFileName) = True And mRetryCount = 0 Then
            If Data_NetwAuth() = True Then
                Call cmdSaveForm_Click
                Close #mSalAcsPermNo
                If mRemoteAccess = True Then
                    Me.Hide     '''Unload Me
                    Exit Sub
                End If
            Else
                Close #mSalAcsPermNo
            End If
        Else
            Close #mSalAcsPermNo
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
If IsFinYrDate(Ctod(dtpFromDate.Text)) = False Then
    ErrorBox "Invalid Date Range !!!"
    dtpFromDate.SetFocus
    Cancel = True
End If

End Sub

Private Sub dtpSalDate_GotFocus()
FlashActiveControl dtpSalDate, True
End Sub

Private Sub dtpSalDate_LostFocus()
FlashActiveControl dtpSalDate, False
End Sub

Private Sub dtpSalDate_Validate(Cancel As Boolean)
dtpSalDate.Text = ToMyDate(dtpSalDate.Text)
If IsFinYrDate(Ctod(dtpSalDate.Text)) = False Then
    ErrorBox "Invalid Input !!!"
    dtpSalDate.SetFocus
    Cancel = True
End If

End Sub

Private Sub dtpSalTrnRefDt_GotFocus()
FlashActiveControl dtpSalTrnRefDt, True
End Sub

Private Sub dtpSalTrnRefDt_LostFocus()
FlashActiveControl dtpSalTrnRefDt, False
End Sub

Private Sub dtpSalTrnRefDt_Validate(Cancel As Boolean)
dtpSalTrnRefDt.Text = ToMyDate(dtpSalTrnRefDt.Text)

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
    Case cCOM_VTYPE_SALES
        lblFormHeading.Caption = "Sales Voucher"
        lblVchType.Caption = "Sale Type"
        lblFormHeading.BackColor = RGB(1, 255, 220)
    Case cCOM_VTYPE_RETNOUTW
        lblFormHeading.Caption = "Purchase Return Voucher"
        lblVchType.Caption = "PRet.Type"
        lblFormHeading.BackColor = RGB(150, 255, 220)
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
    
    If mRemoteAccess = True Then
        MoveRecToFirst datRecset
        ShowRecActiveFlexRow datRecset, Mfgrd1
        Mfgrd1.SetFocus
        If mSalCode = 0 Then
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
    RefreshDatabase dbNcbDatabase
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

mFormUIdFileName = "SaleDtl.Uid"
mFormAcsPermFileName = "SaleDtl.Acp"
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
mskPurMRP.Enabled = False
mskPurRate.Enabled = False

OpenAcDataSource dbAcDatabase
OpenStDataSource dbStDatabase
OpenNcbDataSource dbNcbDatabase
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

Set clsSAL = New clsNcbMultiTranEntry
Set clsSAL.dbAcDatabase = dbAcDatabase
Set clsSAL.dbStDatabase = dbStDatabase
Set clsSAL.dbNcbDatabase = dbNcbDatabase
clsSAL.blnSaleTran = True
clsSAL.Init

Set clsPRT = New clsNcbMasterEntry
Set clsPRT.dbAcDatabase = dbAcDatabase
Set clsPRT.dbNcbDatabase = dbNcbDatabase
clsPRT.blnPartyMast = True
clsPRT.Init

Set clsBKM = New clsNcbMasterEntry
Set clsBKM.dbNcbDatabase = dbNcbDatabase
Set clsBKM.dbStDatabase = dbStDatabase
clsBKM.blnBookMast = True
clsBKM.Init

Set clsSIM = New clsNcbMasterEntry
Set clsSIM.dbNcbDatabase = dbNcbDatabase
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
fcmbVtmName.mListSqlExpr = "Select * from VTypMast where VtmSysCode=" & CStr(mFormSysVchType) & " order by VtmName"
fcmbVtmName.Init

Set fcmbBkmName = New clsNcbFlexSearch
Set fcmbBkmName.dbNcbDatabase = dbNcbDatabase
Set fcmbBkmName.dbComDatabase = dbComDatabase
fcmbBkmName.blnBookMastList = True
fcmbBkmName.Init

Set fcmbGdmName = New clsNcbFlexSearch
Set fcmbGdmName.dbNcbDatabase = dbNcbDatabase
Set fcmbGdmName.dbComDatabase = dbComDatabase
fcmbGdmName.blnGodownMastList = True
fcmbGdmName.Init

Set fcmbItrRefNo = New clsNcbFlexSearch
Set fcmbItrRefNo.dbNcbDatabase = dbNcbDatabase
Set fcmbItrRefNo.dbComDatabase = dbComDatabase
fcmbItrRefNo.mFiltCond = "True=False"
fcmbItrRefNo.blnBalItrRefNoList = True
fcmbItrRefNo.Init

Set fcmbPrtName = New clsNcbFlexSearch
Set fcmbPrtName.dbNcbDatabase = dbNcbDatabase
Set fcmbPrtName.dbComDatabase = dbComDatabase
fcmbPrtName.blnPartyMastList = True
fcmbPrtName.Init

Call RestoreDefaultSmryPara
If mRemoteAccess = True Then
    optDetailed.Value = True
    AddSmryParaLayer mClear:=True
End If

If mRemoteAccess = True Then
    datRecset.Open "Select * from SaleHdr" _
        & " inner join PartyMast on SaleHdr.SahPrtCode = PartyMast.PrtCode" _
        & " where SahCode=" & CStr(mSalCode) _
        & " and SahVtmCode IN (" & mFormVchTypeList & ")" _
        & " order by SahDate,SahTime" _
        , dbNcbDatabase, adOpenKeyset, adLockOptimistic
Else
    datRecset.Open "Select * from SaleHdr" _
        & " inner join PartyMast on SaleHdr.SahPrtCode = PartyMast.PrtCode" _
        & " where SahVtmCode IN (" & mFormVchTypeList & ")" _
        & " order by SahDate,SahTime" _
        , dbNcbDatabase, adOpenKeyset, adLockOptimistic
End If
Mfgrd1.FixedCols = 0
Call SmryList

Mfgrd2.FixedRows = 1: Mfgrd2.FixedCols = 0: Mfgrd2.Rows = 2: Mfgrd2.Cols = MFGRD2_COLS: SetGridAutoHeight Mfgrd2

colcnt = X2SALICODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2SALICODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SALSNO_COL: Mfgrd2.ColWidth(colcnt) = mskSalSno.Width: Mfgrd2.TextMatrix(0, colcnt) = "Sno": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BKMNAME_COL: Mfgrd2.ColWidth(colcnt) = txtBkmName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Item Name": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2SALITRREFNO_COL: Mfgrd2.ColWidth(colcnt) = txtSalItrRefNo.Width: Mfgrd2.TextMatrix(0, colcnt) = "Ref.No": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2SALQTY_COL: Mfgrd2.ColWidth(colcnt) = mskSalQty.Width: Mfgrd2.TextMatrix(0, colcnt) = "Unit": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SALRATE_COL: Mfgrd2.ColWidth(colcnt) = mskSalRate.Width: Mfgrd2.TextMatrix(0, colcnt) = "Rate": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2PURMRP_COL: Mfgrd2.ColWidth(colcnt) = mskPurMRP.Width: Mfgrd2.TextMatrix(0, colcnt) = "MRP": Mfgrd2.ColAlignment(colcnt) = 7
If mFormSysVchType = cCOM_VTYPE_RETNOUTW Then
    colcnt = X2PURRATE_COL: Mfgrd2.ColWidth(colcnt) = mskPurRate.Width: Mfgrd2.TextMatrix(0, colcnt) = "S.Rate": Mfgrd2.ColAlignment(colcnt) = 7
Else
    colcnt = X2PURRATE_COL: Mfgrd2.ColWidth(colcnt) = mskPurRate.Width: Mfgrd2.TextMatrix(0, colcnt) = "P.Rate": Mfgrd2.ColAlignment(colcnt) = 7
End If
colcnt = X2SALAMTBEFDISC_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2SALAMTBEFDISC_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SALDISCPER_COL: Mfgrd2.ColWidth(colcnt) = mskSalDiscPer.Width: Mfgrd2.TextMatrix(0, colcnt) = "Disc%": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SALDISCAMT_COL: Mfgrd2.ColWidth(colcnt) = mskSalDiscAmt.Width: Mfgrd2.TextMatrix(0, colcnt) = "Disc.Amt": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SALAMTBEFTAX_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2SALAMTBEFTAX_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SALTAXPER_COL: Mfgrd2.ColWidth(colcnt) = mskSalTaxPer.Width: Mfgrd2.TextMatrix(0, colcnt) = "Tax%": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SALTAXAMT_COL: Mfgrd2.ColWidth(colcnt) = mskSalTaxAmt.Width: Mfgrd2.TextMatrix(0, colcnt) = "Tax.Amt": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SALAMOUNT_COL: Mfgrd2.ColWidth(colcnt) = mskSalAmount.Width: Mfgrd2.TextMatrix(0, colcnt) = "Amount": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SALNARR_COL: Mfgrd2.ColWidth(colcnt) = txtSalNarr.Width: Mfgrd2.TextMatrix(0, colcnt) = "Description": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2SALBKMCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2SALBKMCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SALITMCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2SALITMCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SALITRCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2SALITRCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SALSTKICODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2SALSTKICODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SALPURCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2SALPURCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SALPURICODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2SALPURICODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2SALRECSTATE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2SALRECSTATE_COL": Mfgrd2.ColAlignment(colcnt) = 7
' ---------------------------
colcnt = X2SALSNO_COL: mskSalSno.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2BKMNAME_COL: txtBkmName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2SALITRREFNO_COL: txtSalItrRefNo.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2SALQTY_COL: mskSalQty.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2SALRATE_COL: mskSalRate.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2PURMRP_COL: mskPurMRP.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2PURRATE_COL: mskPurRate.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2SALDISCPER_COL: mskSalDiscPer.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2SALDISCAMT_COL: mskSalDiscAmt.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2SALTAXPER_COL: mskSalTaxPer.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2SALTAXAMT_COL: mskSalTaxAmt.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2SALAMOUNT_COL: mskSalAmount.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
txtSalNarr.Left = txtBkmName.Left
cmdOK.Left = mskSalAmount.Left + mskSalAmount.Width - cmdOK.Width

lblSalQtyTot.Left = mskSalQty.Left - frFooter.Left: lblSalQtyTot.Width = mskSalQty.Width

lblSalDiscAmtTot.Left = mskSalDiscAmt.Left - frFooter.Left: lblSalDiscAmtTot.Width = mskSalDiscAmt.Width
lblSalTaxAmtTot.Left = mskSalTaxAmt.Left - frFooter.Left: lblSalTaxAmtTot.Width = mskSalTaxAmt.Width
lblSalAmtBefDiscTot.Left = mskSalAmount.Left - frFooter.Left: lblSalAmtBefDiscTot.Width = mskSalAmount.Width
mskSahDiscPer.Left = lblSalTaxAmtTot.Left: mskSahDiscPer.Width = lblSalTaxAmtTot.Width
mskSahDiscAmt.Left = lblSalAmtBefDiscTot.Left: mskSahDiscAmt.Width = lblSalAmtBefDiscTot.Width
mskSahTaxPer.Left = lblSalTaxAmtTot.Left: mskSahTaxPer.Width = lblSalTaxAmtTot.Width
mskSahTaxAmt.Left = lblSalAmtBefDiscTot.Left: mskSahTaxAmt.Width = lblSalAmtBefDiscTot.Width
mskSahOtherAmt.Left = lblSalAmtBefDiscTot.Left: mskSahOtherAmt.Width = lblSalAmtBefDiscTot.Width
mskSahROffAmt.Left = lblSalAmtBefDiscTot.Left: mskSahROffAmt.Width = lblSalAmtBefDiscTot.Width
lblSahAmount.Left = lblSalAmtBefDiscTot.Left: lblSahAmount.Width = lblSalAmtBefDiscTot.Width

ShowEntryMode False
VisibleControls False

ShowStatusBarText StatusBar1

End Sub

Private Sub Form_Resize()
lblFormHeading.Width = Me.Width
cmdFormEscape.Left = Me.Width - (cmdFormEscape.Width * 2)
cmdFormEnter.Left = Me.Width + cmdFormEscape.Width
frFormSmry.Left = (Me.Width - frFormSmry.Width) / 2: frFormSmry.Top = cmbFormEntryMode.Top + (cmbFormEntryMode.Height * 1.01)
frFormDtl.Left = (Me.Width - frFormDtl.Width) / 2: frFormDtl.Top = frFormSmry.Top

End Sub

Private Sub Form_Unload(Cancel As Integer)
Set clsSTK = Nothing
Set clsAH = Nothing
Set clsSAL = Nothing
Set clsPRT = Nothing
Set clsBKM = Nothing
Set clsSIM = Nothing
Set clsARA = Nothing
Set clsSTN = Nothing
Set clsVTM = Nothing
Set fcmbPrtName = Nothing
Set fcmbVtmName = Nothing
Set fcmbBkmName = Nothing
Set fcmbGdmName = Nothing
Set fcmbItrRefNo = Nothing
Set clsListStru = Nothing

CloseTable datRecset
CloseDataSource dbAcDatabase
CloseDataSource dbStDatabase
CloseDataSource dbNcbDatabase
CloseDataSource dbGrpDatabase
CloseDataSource dbComDatabase
mFormSysVchType = 0
End Sub

Private Sub StatusBar1_PanelClick(ByVal Panel As MSComctlLib.Panel)
ShowStatusBarText StatusBar1
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
Dim mOpgVchNo As Long, mSalVchNo As Long
Dim mSalAmountTot As Double

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
Rem sale validations
mSalVchNo = Val(UnMyNumFmt(mskSalVchNo.Text))
If mSalVchNo > 0 Then
    If mSalVchNo <> mSalVchNo_old Or Val(fcmbVtmName.BoundText) <> mSalVtmCode_old Or Ctod(dtpSalDate.Text) <> mSalDate_old Or FormAddEditMode = cFORM_ADDMODE Then
        If ChkIsDuplVTypeNo(dbNcbDatabase, dbAcDatabase, mTableName:="SaleHdr", mChkFieldName:="SahVchNo", mChkFieldValue:=mSalVchNo, mKeyFieldName:="SahCode", mKeyFieldValue:=mSalCode, mVtmFieldName:="SahVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="SahCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="SahDate", mDateFieldValue:=Ctod(dtpSalDate.Text)) = True Then
            ErrorBox "Duplicate Voucher No. !!!"
            mskSalVchNo.SetFocus
            ' ---------------
            If FormAddEditMode = cFORM_ADDMODE Then
                mSalVchNo = GetNextVTypeNo(dbNcbDatabase, dbAcDatabase, dbComDatabase, mTableName:="SaleHdr", mFieldName:="SahVchNo", mVtmFieldName:="SahVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="SahCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="SahDate", mDateFieldValue:=Ctod(dtpSalDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
            Else
                mSalVchNo = mSalVchNo_old
            End If
            mskSalVchNo.Text = ToMyNumFmt(mSalVchNo, mDecimals:=0)
            GoTo EndSub
        End If
    End If
Else
    ErrorBox "Invalid Input !!!"
    mskSalVchNo.SetFocus
    GoTo EndSub
End If
If IsDate(dtpSalDate.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpSalDate.SetFocus
    GoTo EndSub
Else
    If IsFinYrDate(Ctod(dtpSalDate.Text)) = False Then
        ErrorBox "Invalid Input !!!"
        dtpSalDate.SetFocus
        GoTo EndSub
    End If
End If
If TimeToMin(txtSalTime_str.Text) > cDAYMINUTES Then
    ErrorBox "Invalid Input !!!"
    txtSalTime_str.SetFocus
    GoTo EndSub
End If
If IsDate(dtpSalTrnRefDt.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpSalTrnRefDt.SetFocus
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
Dim mSalVchNo As Long
Data_NetwAuth = False

mSalVchNo = Val(UnMyNumFmt(mskSalVchNo.Text))
If mSalVchNo <> mSalVchNo_old Or Val(fcmbVtmName.BoundText) <> mSalVtmCode_old Or Ctod(dtpSalDate.Text) <> mSalDate_old Or FormAddEditMode = cFORM_ADDMODE Then
    If ChkIsDuplVTypeNo(dbNcbDatabase, dbAcDatabase, mTableName:="SaleHdr", mChkFieldName:="SahVchNo", mChkFieldValue:=mSalVchNo, mKeyFieldName:="SahCode", mKeyFieldValue:=mSalCode, mVtmFieldName:="SahVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="SahCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="SahDate", mDateFieldValue:=Ctod(dtpSalDate.Text)) = True Then
        ErrorBox "Duplicate Voucher No. !!!"
        mskSalVchNo.SetFocus
        ' ---------------
        If FormAddEditMode = True Then
            mSalVchNo = GetNextVTypeNo(dbNcbDatabase, dbAcDatabase, dbComDatabase, mTableName:="SaleHdr", mFieldName:="SahVchNo", mVtmFieldName:="SahVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="SahCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="SahDate", mDateFieldValue:=Ctod(dtpSalDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
        Else
            mSalVchNo = mSalVchNo_old
        End If
        mskSalVchNo.Text = ToMyNumFmt(mSalVchNo, mDecimals:=0)
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
Dim srow As Integer, mSalICode As Long, mSalStkICode As Long, mDeleteit As Boolean

srow = Mfgrd2.Row
mSalICode = Val(Mfgrd2.TextMatrix(srow, X2SALICODE_COL))
mSalStkICode = Val(Mfgrd2.TextMatrix(srow, X2SALSTKICODE_COL))

If MyDeleteKey(Shift, KeyCode, mCheckCtrlMask:=False) = True And mSalICode > 0 Then
    mDeleteit = True
    If mDeleteit = True Then
        mDeleteit = CanDelete()
    End If
    If mDeleteit = True Then
        clsSAL.DeleteDtl mSalCode, mSalICode
        clsSTK.DeleteDtl mSalStkCode, mSalStkICode
        
        ShowDtlData mSalCode
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
        mskSalSno.Text = ToMyNumFmt(FlexNextSeqno(Mfgrd2, X2SALSNO_COL), mDecimals:=0)
        mskSalQty.Text = ToMyNumFmt(1, mDecimals:=-1)
    Else
        mskSalICode.Text = Val(Mfgrd2.TextMatrix(srow, X2SALICODE_COL))
        mskSalStkICode.Text = Val(Mfgrd2.TextMatrix(srow, X2SALSTKICODE_COL))
        mskSalSno.Text = Mfgrd2.TextMatrix(srow, X2SALSNO_COL)
        fcmbBkmName.BoundText = Mfgrd2.TextMatrix(srow, X2SALBKMCODE_COL): txtBkmName.Text = fcmbBkmName.Text
        txtSalNarr.Text = Mfgrd2.TextMatrix(srow, X2SALNARR_COL)
        mskSalItmCode.Text = Val(Mfgrd2.TextMatrix(srow, X2SALITMCODE_COL))
        ' --------------------
        Call ChkItrRefNoList
        ' ---------------------
        fcmbItrRefNo.BoundText = Mfgrd2.TextMatrix(srow, X2SALITRCODE_COL): txtSalItrRefNo.Text = fcmbItrRefNo.Text
        mskSalPurCode.Text = Mfgrd2.TextMatrix(srow, X2SALPURCODE_COL)
        mskSalPurICode.Text = Mfgrd2.TextMatrix(srow, X2SALPURICODE_COL)
        txtSalItrRefNo.Text = Mfgrd2.TextMatrix(srow, X2SALITRREFNO_COL)
        mskSalQty.Text = Mfgrd2.TextMatrix(srow, X2SALQTY_COL)
        mskSalRate.Text = Mfgrd2.TextMatrix(srow, X2SALRATE_COL)
        mskPurMRP.Text = Mfgrd2.TextMatrix(srow, X2PURMRP_COL)
        mskPurRate.Text = Mfgrd2.TextMatrix(srow, X2PURRATE_COL)
        mskSalAmtBefDisc.Text = Mfgrd2.TextMatrix(srow, X2SALAMTBEFDISC_COL)
        mskSalDiscPer.Text = Mfgrd2.TextMatrix(srow, X2SALDISCPER_COL)
        mskSalDiscAmt.Text = Mfgrd2.TextMatrix(srow, X2SALDISCAMT_COL)
        mskSalAmtBefTax.Text = Mfgrd2.TextMatrix(srow, X2SALAMTBEFTAX_COL)
        mskSalTaxPer.Text = Mfgrd2.TextMatrix(srow, X2SALTAXPER_COL)
        mskSalTaxAmt.Text = Mfgrd2.TextMatrix(srow, X2SALTAXAMT_COL)
        mskSalAmount.Text = Mfgrd2.TextMatrix(srow, X2SALAMOUNT_COL)
    End If
    txtBkmName.SetFocus
    Call ValidDtl
    
    mSalBkmCode_old = Val(fcmbBkmName.BoundText)
    mSalItmCode_old = Val(mskSalItmCode.Text)
    mSalItrCode_old = Val(fcmbItrRefNo.BoundText)
    mSalPurCode_old = Val(mskSalPurCode.Text)
    mSalPurICode_old = Val(mskSalPurICode.Text)
    mSalAmtBefDisc_old = Val(UnMyNumFmt(mskSalAmtBefDisc.Text))
    mSalDiscPer_old = Val(UnMyPerFmt(mskSalDiscPer.Text))
    mSalAmtBefTax_old = Val(UnMyNumFmt(mskSalAmtBefTax.Text))
    mSalTaxPer_old = Val(UnMyPerFmt(mskSalTaxPer.Text))
End If

End Sub

Private Sub Mfgrd2_RowColChange()
ShowActiveFlexRow Mfgrd2
End Sub

Private Sub mskSahDiscAmt_GotFocus()
FlashActiveControl mskSahDiscAmt, True
End Sub

Private Sub mskSahDiscAmt_LostFocus()
FlashActiveControl mskSahDiscAmt, False
End Sub

Private Sub mskSahDiscAmt_Validate(Cancel As Boolean)
mskSahDiscAmt.Text = ToMyNumFmt(mskSahDiscAmt.Text, mUseAbs:=True)
Call CalcFtrTotal

End Sub

Private Sub mskSahDiscPer_GotFocus()
FlashActiveControl mskSahDiscPer, True
End Sub

Private Sub mskSahDiscPer_LostFocus()
FlashActiveControl mskSahDiscPer, False
End Sub

Private Sub mskSahDiscPer_Validate(Cancel As Boolean)
mskSahDiscPer.Text = ToMyPerFmt(mskSahDiscPer.Text, mUseAbs:=True)
Call CalcFtrTotal

End Sub

Private Sub mskSahOtherAmt_GotFocus()
FlashActiveControl mskSahOtherAmt, True
End Sub

Private Sub mskSahOtherAmt_LostFocus()
FlashActiveControl mskSahOtherAmt, False
End Sub

Private Sub mskSahOtherAmt_Validate(Cancel As Boolean)
mskSahOtherAmt.Text = ToMyNumFmt(mskSahOtherAmt.Text, mUseAbs:=True)
Call CalcFtrTotal

End Sub

Private Sub mskSahROffAmt_GotFocus()
FlashActiveControl mskSahROffAmt, True
End Sub

Private Sub mskSahROffAmt_LostFocus()
FlashActiveControl mskSahROffAmt, False
End Sub

Private Sub mskSahROffAmt_Validate(Cancel As Boolean)
mskSahROffAmt.Text = ToMyNumFmt(mskSahROffAmt.Text, mUseAbs:=True)
Call CalcFtrTotal

End Sub

Private Sub mskSahTaxAmt_GotFocus()
FlashActiveControl mskSahTaxAmt, True
End Sub

Private Sub mskSahTaxAmt_LostFocus()
FlashActiveControl mskSahTaxAmt, False
End Sub

Private Sub mskSahTaxAmt_Validate(Cancel As Boolean)
mskSahTaxAmt.Text = ToMyNumFmt(mskSahTaxAmt.Text, mUseAbs:=True)
Call CalcFtrTotal

End Sub

Private Sub mskSahTaxPer_GotFocus()
FlashActiveControl mskSahTaxPer, True
End Sub

Private Sub mskSahTaxPer_LostFocus()
FlashActiveControl mskSahTaxPer, False
End Sub

Private Sub mskSahTaxPer_Validate(Cancel As Boolean)
mskSahTaxPer.Text = ToMyPerFmt(mskSahTaxPer.Text, mDecimals:=-1, mUseAbs:=True)
Call CalcFtrTotal

End Sub

Private Sub mskSalAmount_GotFocus()
FlashActiveControl mskSalAmount, True
End Sub

Private Sub mskSalAmount_LostFocus()
FlashActiveControl mskSalAmount, False
End Sub

Private Sub mskSalAmount_Validate(Cancel As Boolean)
mskSalAmount.Text = ToMyNumFmt(mskSalAmount.Text)
If Val(UnMyNumFmt(mskSalAmount.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskSalAmount.SetFocus
    Cancel = True
End If
Call ValidDtl

End Sub

Rem discart this validation, instead use validation at sale hdr level
Private Function chkSalAmount() As Boolean
Dim mRtnval As Boolean, srow As Integer, mSalAmount As Double

mRtnval = True
srow = Mfgrd2.Row
mSalAmount = Val(UnMyNumFmt(mskSalAmount.Text))

chkSalAmount = mRtnval

End Function

Private Sub mskSalDiscAmt_GotFocus()
FlashActiveControl mskSalDiscAmt, True
End Sub

Private Sub mskSalDiscAmt_LostFocus()
FlashActiveControl mskSalDiscAmt, False
End Sub

Private Sub mskSalDiscAmt_Validate(Cancel As Boolean)
mskSalDiscAmt.Text = ToMyNumFmt(mskSalDiscAmt.Text, mUseAbs:=True)
Call CalcSalChg
Call ValidDtl

End Sub

Private Sub mskSalDiscPer_GotFocus()
FlashActiveControl mskSalDiscPer, True
End Sub

Private Sub mskSalDiscPer_LostFocus()
FlashActiveControl mskSalDiscPer, False
End Sub

Private Sub mskSalDiscPer_Validate(Cancel As Boolean)
mskSalDiscPer.Text = ToMyPerFmt(mskSalDiscPer.Text, mUseAbs:=True)
Call CalcSalChg
Call ValidDtl

End Sub

Private Sub mskSalRate_GotFocus()
FlashActiveControl mskSalRate, True
End Sub

Private Sub mskSalRate_LostFocus()
FlashActiveControl mskSalRate, False
End Sub

Private Sub mskSalRate_Validate(Cancel As Boolean)
mskSalRate.Text = ToMyNumFmt(mskSalRate.Text)
If Val(UnMyNumFmt(mskSalRate.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskSalRate.SetFocus
    Cancel = True
Else
    Call CalcSalChg
End If
Call ValidDtl

End Sub

Private Sub mskSalQty_GotFocus()
FlashActiveControl mskSalQty, True
End Sub

Private Sub mskSalQty_LostFocus()
FlashActiveControl mskSalQty, False
End Sub

Private Sub mskSalQty_Validate(Cancel As Boolean)
mskSalQty.Text = ToMyNumFmt(mskSalQty.Text, mDecimals:=-1, mUseAbs:=True)
If Val(UnMyNumFmt(mskSalQty.Text)) <= 0 Then
    ErrorBox "Invalid Input !!!"
    mskSalQty.SetFocus
    Cancel = True
Else
    Call CalcSalChg
End If
Call ValidDtl

End Sub

Private Sub mskSalTaxAmt_GotFocus()
FlashActiveControl mskSalTaxAmt, True
End Sub

Private Sub mskSalTaxAmt_LostFocus()
FlashActiveControl mskSalTaxAmt, False
End Sub

Private Sub mskSalTaxAmt_Validate(Cancel As Boolean)
mskSalTaxAmt.Text = ToMyNumFmt(mskSalTaxAmt.Text, mUseAbs:=True)
Call CalcSalChg
Call ValidDtl

End Sub

Private Sub mskSalTaxPer_GotFocus()
FlashActiveControl mskSalTaxPer, True
End Sub

Private Sub mskSalTaxPer_LostFocus()
FlashActiveControl mskSalTaxPer, False
End Sub

Private Sub mskSalTaxPer_Validate(Cancel As Boolean)
mskSalTaxPer.Text = ToMyPerFmt(mskSalTaxPer.Text, mDecimals:=-1, mUseAbs:=True)
Call CalcSalChg
Call ValidDtl

End Sub

Private Sub mskSalVchNo_GotFocus()
FlashActiveControl mskSalVchNo, True
End Sub

Private Sub mskSalVchNo_LostFocus()
FlashActiveControl mskSalVchNo, False
End Sub

Private Sub mskSalVchNo_Validate(Cancel As Boolean)
Dim mSalVchNo As Long
mSalVchNo = Val(UnMyNumFmt(mskSalVchNo.Text))
If mSalVchNo < 0 Then
    mSalVchNo = GetNextVTypeNo(dbNcbDatabase, dbAcDatabase, dbComDatabase, mTableName:="SaleHdr", mFieldName:="SahVchNo", mVtmFieldName:="SahVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="SahCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="SahDate", mDateFieldValue:=Ctod(dtpSalDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
    mskSalVchNo.Text = ToMyNumFmt(mSalVchNo, mDecimals:=0)
ElseIf mSalVchNo > 0 Then
    If mSalVchNo <> mSalVchNo_old Or Val(fcmbVtmName.BoundText) <> mSalVtmCode_old Or Ctod(dtpSalDate.Text) <> mSalDate_old Or FormAddEditMode = cFORM_ADDMODE Then
        If ChkIsDuplVTypeNo(dbNcbDatabase, dbAcDatabase, mTableName:="SaleHdr", mChkFieldName:="SahVchNo", mChkFieldValue:=mSalVchNo, mKeyFieldName:="SahCode", mKeyFieldValue:=mSalCode, mVtmFieldName:="SahVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="SahCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="SahDate", mDateFieldValue:=Ctod(dtpSalDate.Text)) = True Then
            ErrorBox "Duplicate Voucher No. !!!"
            Cancel = True
            mskSalVchNo.SetFocus
            ' ----------
            If FormAddEditMode = cFORM_ADDMODE Then
                mSalVchNo = GetNextVTypeNo(dbNcbDatabase, dbAcDatabase, dbComDatabase, mTableName:="SaleHdr", mFieldName:="SahVchNo", mVtmFieldName:="SahVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="SahCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="SahDate", mDateFieldValue:=Ctod(dtpSalDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
            Else
                mSalVchNo = mSalVchNo_old
            End If
            mskSalVchNo.Text = ToMyNumFmt(mSalVchNo, mDecimals:=0)
        End If
    End If
    If Cancel = False Then
        mskSalVchNo.Text = ToMyNumFmt(mSalVchNo, mDecimals:=0)
    End If
Else
    ErrorBox "Invalid Input !!!"
    mskSalVchNo.SetFocus
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

Private Sub optExpanded_GotFocus()
FlashActiveControl optExpanded, True
End Sub

Private Sub optExpanded_LostFocus()
FlashActiveControl optExpanded, False
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

Private Sub txtGdmName_Change()
If fcmbGdmName.CallFromText_Change = False Then
    fcmbGdmName.CallFromText_Change = True
    If InterActiveChange(txtGdmName) = True Then
        fcmbGdmName.UserText = Array(txtGdmName.Text, txtGdmName.SelStart)
        fcmbGdmName.Show
        txtGdmName.Text = fcmbGdmName.Text
        If fcmbGdmName.ListSelected = True Then
            SendKeys "{TAB}"
        End If
    End If
    fcmbGdmName.CallFromText_Change = False
End If

End Sub

Private Sub txtGdmName_GotFocus()
FlashActiveControl txtGdmName, True
End Sub

Private Sub txtGdmName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtGdmName_Change
End If

End Sub

Private Sub txtGdmName_LostFocus()
FlashActiveControl txtGdmName, False
End Sub

Private Sub txtGdmName_Validate(Cancel As Boolean)
If Val(fcmbGdmName.BoundText) <= 0 Then
    ErrorBox "Invalid Selection !!!"
    txtGdmName.SetFocus
    Cancel = True
End If
Call ValidDtl

End Sub

Private Sub txtSalNarr_GotFocus()
FlashActiveControl txtSalNarr, True
End Sub

Private Sub txtSalNarr_LostFocus()
FlashActiveControl txtSalNarr, False
End Sub

Private Sub txtSalNarr_Validate(Cancel As Boolean)
txtSalNarr.Text = ToMyWord(txtSalNarr.Text, mFilterStr:=False)
End Sub

Private Sub txtSalItrRefNo_Change()
If fcmbItrRefNo.CallFromText_Change = False Then
    fcmbItrRefNo.CallFromText_Change = True
    If InterActiveChange(txtSalItrRefNo) = True Then
        fcmbItrRefNo.UserText = Array(txtSalItrRefNo.Text, txtSalItrRefNo.SelStart)
        fcmbItrRefNo.Show
        txtSalItrRefNo.Text = fcmbItrRefNo.Text
        If fcmbItrRefNo.ListSelected = True Then
            SendKeys "{TAB}"
        End If
    End If
    fcmbItrRefNo.CallFromText_Change = False
End If

End Sub

Private Sub txtSalItrRefNo_GotFocus()
FlashActiveControl txtSalItrRefNo, True
End Sub

Private Sub txtSalItrRefNo_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtSalItrRefNo_Change
End If

End Sub

Private Sub txtSalItrRefNo_LostFocus()
FlashActiveControl txtSalItrRefNo, False
End Sub

Private Sub txtSalItrRefNo_Validate(Cancel As Boolean)
Dim tRecset As New ADODB.Recordset

If Val(fcmbItrRefNo.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    Rem txtSalItrRefNo.SetFocus
    Rem Cancel = True
Else
    If FormAddEditMode = cFORM_ADDMODE Or dtlAddMode = True Or Val(fcmbBkmName.BoundText) <> mSalBkmCode_old Or Val(mskSalItmCode.Text) <> mSalItmCode_old Or Val(fcmbItrRefNo.BoundText) <> mSalItrCode_old Then
        With tRecset
        .Open "Select * from PurchDtl pur" _
            & " inner join PurchHdr puh on pur.PurCode = puh.PuhCode" _
            & " where pur.PurBkmCode = " & CStr(Val(fcmbBkmName.BoundText)) _
            & " and pur.PurItmCode = " & CStr(Val(mskSalItmCode.Text)) _
            & " and pur.PurItrCode=" & CStr(Val(fcmbItrRefNo.BoundText)) _
            , dbNcbDatabase, adOpenKeyset, adLockOptimistic
        Rem & " where pur.PurPrtCode=" & CStr(Val(fcmbPrtName.BoundText))
        mskSalPurCode.Text = .fields("PurCode")
        mskSalPurICode.Text = .fields("PurICode")
        If mFormSysVchType = cCOM_VTYPE_RETNOUTW Then
            mskSalRate.Text = ToMyNumFmt(.fields("PurRate"))
            mskPurRate.Text = ToMyNumFmt(.fields("PurSRate"))
        Else
            mskSalRate.Text = ToMyNumFmt(.fields("PurSRate"))
            mskPurRate.Text = ToMyNumFmt(.fields("PurRate"))
        End If
        mskPurMRP.Text = ToMyNumFmt(.fields("PurMRP"))
        End With
        CloseTable tRecset
        
        Call CalcSalChg
    End If
End If
Call ValidDtl

End Sub

Private Sub txtSalTrnRefNo_GotFocus()
FlashActiveControl txtSalTrnRefNo, True
End Sub

Private Sub txtSalTrnRefNo_LostFocus()
FlashActiveControl txtSalTrnRefNo, False
End Sub

Private Sub txtSalTrnRefNo_Validate(Cancel As Boolean)
Rem nothing
End Sub

Private Sub txtSahRemark_GotFocus()
FlashActiveControl txtSahRemark, True
End Sub

Private Sub txtSahRemark_LostFocus()
FlashActiveControl txtSahRemark, False
End Sub

Private Sub txtSahRemark_Validate(Cancel As Boolean)
txtSahRemark.Text = ToMyWord(txtSahRemark.Text, mFilterStr:=False)
End Sub

Private Sub txtSalTime_str_GotFocus()
FlashActiveControl txtSalTime_str, True
End Sub

Private Sub txtSalTime_str_LostFocus()
FlashActiveControl txtSalTime_str, False
End Sub

Private Sub txtSalTime_str_Validate(Cancel As Boolean)
txtSalTime_str.Text = MinToTime(TimeToMin(txtSalTime_str.Text))
If TimeToMin(txtSalTime_str.Text) > cDAYMINUTES Then
    ErrorBox "Invalid Input !!!"
    txtSalTime_str.SetFocus
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
    Rem Call ShowOldOpgListByOpgNo show here all sale details
End If

End Sub

Private Sub txtVtmName_LostFocus()
FlashActiveControl txtVtmName, False
End Sub

Private Sub txtVtmName_Validate(Cancel As Boolean)
Dim mSalVchNo As Long

If Val(fcmbVtmName.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    txtVtmName.SetFocus
    Cancel = True
Else
    If Val(fcmbVtmName.BoundText) <> mSalVtmCode_old Or Ctod(dtpSalDate.Text) <> mSalDate_old Or FormAddEditMode = cFORM_ADDMODE Then
        mSalVchNo = GetNextVTypeNo(dbNcbDatabase, dbAcDatabase, dbComDatabase, mTableName:="SaleHdr", mFieldName:="SahVchNo", mVtmFieldName:="SahVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="SahCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="SahDate", mDateFieldValue:=Ctod(dtpSalDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
        mskSalVchNo.Text = ToMyNumFmt(mSalVchNo, mDecimals:=0)
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
    
    fcmbPrtName.BoundText = CStr(mSalPrtCode_old)
    txtPrtName.Text = fcmbPrtName.Text
Else
    ShowPartyData Val(fcmbPrtName.BoundText)
End If

End Sub

Private Sub ShowPartyData(ByVal mSalPrtCode As Long)
Dim tRecset As New ADODB.Recordset

txtPrtAddr.Text = ""
txtAraName.Text = ""
txtStnName.Text = ""
txtPrtTelNo.Text = ""
txtPrtSMSNo.Text = ""

With tRecset
.Open "Select * from (PartyMast prt inner join AreaMast ara on prt.PrtAraCode=ara.AraCode) inner join StsnMast stn on prt.PrtStnCode=stn.StnCode where prt.PrtCode=" & CStr(mSalPrtCode) & "", dbComDatabase, adOpenKeyset, adLockOptimistic
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
If clsSAL.BeginTran(0) = False Then
    Exit Sub
ElseIf clsSTK.BeginStock(0) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_ADDMODE

clsSAL.ClearHdr: clsSAL.ClearDtl
clsSTK.ClearHdr

mSalCode = clsSAL.ActiveTrnCode
mSalStkCode = clsSTK.ActiveStkCode

ShowSalData mSalCode
ShowStkData mSalStkCode

Rem restoring user editing features
Call ShowSalDefData

Rem old values
Call StoreSalOldData
Call StoreStkOldData

Call ShowEntryMode(True)
txtPrtName.SetFocus

End Sub

Private Sub Data_EditEvent()

If clsSAL.BeginTran(datRecset.fields("SahCode")) = False Then
    Exit Sub
ElseIf clsSTK.BeginStock(datRecset.fields("SahStkCode")) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_EDITMODE

With datRecset
mSalCode = .fields("SahCode")
mSalStkCode = .fields("SahStkCode")

End With

ShowSalData mSalCode
ShowStkData mSalStkCode

Rem old values
Call StoreSalOldData
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

Private Sub ShowSalData(ByVal mSalCode As Long)
With clsSAL
.GetHdrData mSalCode

mskFormBoundField.Text = mSalCode
fcmbPrtName.BoundText = CStr(.mSahPrtCode_lng): txtPrtName.Text = fcmbPrtName.Text
fcmbVtmName.BoundText = CStr(.mTrnVtmCode_lng): txtVtmName.Text = fcmbVtmName.Text
txtSalPrefix.Text = .mTrnPrefix_str
mskSalVchNo.Text = ToMyNumFmt(.mTrnVchNo_lng, mDecimals:=0)
dtpSalDate.Text = Dtoc(.mTrnDate_dt)
txtSalTime_str.Text = MinToTime(.mSahTime_lng)
txtSalTrnRefNo.Text = .mSahTrnRefNo_str
dtpSalTrnRefDt.Text = Dtoc(.mSahTrnRefDt_dt)
mskSahDiscPer.Text = ToMyPerFmt(.mSahDiscPer_dbl)
mskSahDiscAmt.Text = ToMyNumFmt(.mSahDiscAmt_dbl)
mskSahTaxPer.Text = ToMyPerFmt(.mSahTaxPer_dbl, mDecimals:=-1)
mskSahTaxAmt.Text = ToMyNumFmt(.mSahTaxAmt_dbl)
mskSahOtherAmt.Text = ToMyNumFmt(.mSahOtherAmt_dbl)
mskSahROffAmt.Text = ToMyNumFmt(.mSahROffAmt_dbl)
lblSahAmount.Caption = ToMyNumFmt(.mSahAmount_dbl)
txtSahRemark.Text = .mSahRemark_str

ShowPartyData .mSahPrtCode_lng
Call ShowOldSalCodeDesc
End With

ShowDtlData mSalCode
Call ShowLinkTranDtl

End Sub

Private Sub ShowStkData(ByVal mSalStkCode As Long)
mskSalStkCode.Text = mSalStkCode

End Sub

Private Sub ShowSalDefData()
Dim tRecset As New ADODB.Recordset, t1Recset As New ADODB.Recordset, mSalVchNo As Long

With tRecset
.Open "Select top 1 * from SaleHdr where SahVtmCode IN (" & mFormVchTypeList & ") and SahCmpCode = " & CStr(sFinYrCmpCode) & " order by SahCode desc", dbNcbDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    dtpSalDate.Text = Dtoc(.fields("SahDate"))
    fcmbVtmName.BoundText = CStr(.fields("SahVtmCode"))
Else
    dtpSalDate.Text = Dtoc(DefaultEntryDate)
    With t1Recset
    .Open "Select top 1 * from VTypMast where VtmSysCode=" & CStr(mFormSysVchType) & "", dbAcDatabase, adOpenKeyset, adLockOptimistic
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
txtSalTime_str.Text = MinToTime(TimeToMin(DateTime.Time$))

mSalVchNo = GetNextVTypeNo(dbNcbDatabase, dbAcDatabase, dbComDatabase, mTableName:="SaleHdr", mFieldName:="SahVchNo", mVtmFieldName:="SahVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="SahCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="SahDate", mDateFieldValue:=Ctod(dtpSalDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
mskSalVchNo.Text = ToMyNumFmt(mSalVchNo, mDecimals:=0)
dtpSalTrnRefDt.Text = dtpSalDate.Text

End Sub

Private Sub StoreSalOldData()
mSalCode_old = mSalCode
mSalPrtCode_old = Val(fcmbPrtName.BoundText)
mSalDate_old = Ctod(dtpSalDate.Text)
mSalTime_old = TimeToMin(txtSalTime_str.Text)
mSalVtmCode_old = Val(fcmbVtmName.BoundText)
mSalVchNo_old = Val(UnMyNumFmt(mskSalVchNo.Text))
mSahAmount_old = Val(UnMyNumFmt(lblSahAmount.Caption))

End Sub

Private Sub StoreStkOldData()
mSalStkCode_old = mSalStkCode

End Sub

Private Sub ShowDtlData(ByVal mSalCode As Long)
Dim srow As Integer, tRecset As New ADODB.Recordset, mColCnt As Integer

srow = 1
Mfgrd2.Rows = 2

With tRecset
.Open "Select * from SaleDtl" _
    & " left join (PurchDtl left join PurchHdr on PurchDtl.PurCode = PurchHdr.PuhCode)" _
    & " on SaleDtl.SalPurCode = PurchDtl.PurCode and SaleDtl.SalPurICode = PurchDtl.PurICode and SaleDtl.SalBkmCode = PurchDtl.PurBkmCode and SaleDtl.SalItmCode = PurchDtl.PurItmCode and SaleDtl.SalItrCode = PurchDtl.PurItrCode" _
    & " where SalCode=" & CStr(mSalCode) _
    & " order by SalSno", dbNcbDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Do While .EOF = False
        If InList(.fields("SalRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
            clsBKM.GetData .fields("SalBkmCode")
            
            Mfgrd2.TextMatrix(srow, X2SALICODE_COL) = .fields("SalICode")
            Mfgrd2.TextMatrix(srow, X2SALSTKICODE_COL) = .fields("SalStkICode")
            Mfgrd2.TextMatrix(srow, X2SALSNO_COL) = ToMyNumFmt(.fields("SalSno"), mDecimals:=0)
            Mfgrd2.TextMatrix(srow, X2BKMNAME_COL) = clsBKM.mName_str
            Mfgrd2.TextMatrix(srow, X2SALITRREFNO_COL) = .fields("SalItrRefNo")
            Mfgrd2.TextMatrix(srow, X2SALQTY_COL) = ToMyNumFmt(.fields("SalQty"), mDecimals:=-1)
            Mfgrd2.TextMatrix(srow, X2SALRATE_COL) = ToMyNumFmt(.fields("SalRate"))
            Mfgrd2.TextMatrix(srow, X2PURMRP_COL) = ToMyNumFmt(NoneZero1(.fields("PurMRP"), 0))
            If mFormSysVchType = cCOM_VTYPE_RETNOUTW Then
                Mfgrd2.TextMatrix(srow, X2PURRATE_COL) = ToMyNumFmt(NoneZero1(.fields("PurSRate"), 0))
            Else
                Mfgrd2.TextMatrix(srow, X2PURRATE_COL) = ToMyNumFmt(NoneZero1(.fields("PurRate"), 0))
            End If
            Mfgrd2.TextMatrix(srow, X2SALAMTBEFDISC_COL) = ToMyNumFmt(.fields("SalAmtBefDisc"))
            Mfgrd2.TextMatrix(srow, X2SALDISCPER_COL) = ToMyPerFmt(.fields("SalDiscPer"), mDecimals:=-1)
            Mfgrd2.TextMatrix(srow, X2SALDISCAMT_COL) = ToMyNumFmt(.fields("SalDiscAmt"))
            Mfgrd2.TextMatrix(srow, X2SALAMTBEFTAX_COL) = ToMyNumFmt(.fields("SalAmtBefTax"))
            Mfgrd2.TextMatrix(srow, X2SALTAXPER_COL) = ToMyPerFmt(.fields("SalTaxPer"), mDecimals:=-1)
            Mfgrd2.TextMatrix(srow, X2SALTAXAMT_COL) = ToMyNumFmt(.fields("SalTaxAmt"))
            Mfgrd2.TextMatrix(srow, X2SALAMOUNT_COL) = ToMyNumFmt(.fields("SalAmount"))
            Mfgrd2.TextMatrix(srow, X2SALNARR_COL) = .fields("SalNarr")
            Mfgrd2.TextMatrix(srow, X2SALBKMCODE_COL) = .fields("SalBkmCode")
            Mfgrd2.TextMatrix(srow, X2SALITMCODE_COL) = .fields("SalItmCode")
            Mfgrd2.TextMatrix(srow, X2SALITRCODE_COL) = .fields("SalItrCode")
            Mfgrd2.TextMatrix(srow, X2SALPURCODE_COL) = .fields("SalPurCode")
            Mfgrd2.TextMatrix(srow, X2SALPURICODE_COL) = .fields("SalPurICode")
            Mfgrd2.TextMatrix(srow, X2SALRECSTATE_COL) = .fields("SalRecState")
            
            Mfgrd2.Rows = Mfgrd2.Rows + 1
            srow = srow + 1
        Else
            If InList(.fields("SalRecState"), Array(cREC_CANCELED, cREC_DELETED)) = False Then
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

With clsSAL
If FormAddEditMode = cFORM_ADDMODE Then
    .ClearHdr
Else
    .GetHdrData mSalCode
End If
.mTrnDate_dt = Ctod(dtpSalDate.Text)
.mTrnVtmCode_lng = Val(fcmbVtmName.BoundText)
.mTrnPrefix_str = txtSalPrefix.Text
.mTrnVchNo_lng = Val(UnMyNumFmt(mskSalVchNo.Text))
.mTrnPostfix_str = ""
.mTrnCmpCode_int = sFinYrCmpCode

.mSahStkCode_lng = mSalStkCode
.mSahTime_lng = TimeToMin(txtSalTime_str.Text)
.mSahPrtCode_lng = Val(fcmbPrtName.BoundText)
.mSahTrnRefNo_str = txtSalTrnRefNo.Text
.mSahTrnRefDt_dt = Ctod(dtpSalTrnRefDt.Text)
.mSahQty_dbl = Val(UnMyNumFmt(lblSalQtyTot.Caption))
.mSahAmtBefDisc_dbl = Val(UnMyNumFmt(lblSalAmtBefDiscTot.Caption))
.mSahDiscPer_dbl = Val(UnMyPerFmt(mskSahDiscPer.Text))
.mSahDiscAmt_dbl = Val(UnMyNumFmt(mskSahDiscAmt.Text))
.mSahAmtBefTax_dbl = Val(UnMyNumFmt(lblSahAmtBefTax.Caption))
.mSahTaxPer_dbl = Val(UnMyPerFmt(mskSahTaxPer.Text))
.mSahTaxAmt_dbl = Val(UnMyNumFmt(mskSahTaxAmt.Text))
.mSahOtherAmt_dbl = Val(UnMyNumFmt(mskSahOtherAmt.Text))
.mSahROffAmt_dbl = Val(UnMyNumFmt(mskSahROffAmt.Text))
.mSahAmount_dbl = Val(UnMyNumFmt(lblSahAmount.Caption))
.mSahRemark_str = txtSahRemark.Text

If FormAddEditMode = cFORM_ADDMODE Then
    If .AddNewHdr() = True Then
        mskFormBoundField.Text = .mTrnCode_lng
        mSalCode = .mTrnCode_lng
    End If
Else
    .UpdateHdr mSalCode
End If
If .mTrnCode_lng > 0 Then   ' updated successfully
    With clsSTK
    If FormAddEditMode = cFORM_ADDMODE Then
        .ClearHdr
    Else
        .GetHdrData mSalStkCode
    End If
    .mShrVtmCode_lng = Val(fcmbVtmName.BoundText)
    .mShrPrefix_str = txtSalPrefix.Text
    .mShrVchNo_lng = Val(UnMyNumFmt(mskSalVchNo.Text))
    .mShrPostfix_str = ""
    .mShrDate_dt = Ctod(dtpSalDate.Text)
    .mShrQty_dbl = Val(UnMyNumFmt(lblSalQtyTot.Caption))
    .mShrValue_dbl = Val(UnMyNumFmt(lblSahAmount.Caption))
    .mShrNarr_str = "Automated Sale"
    .mShrAutoGen_bln = True
    .mShrCmpCode_int = sFinYrCmpCode
    If FormAddEditMode = cFORM_ADDMODE Then
        If .AddNewHdr() = True Then
            mskSalStkCode.Text = .mShrCode_lng
            mSalStkCode = .mShrCode_lng
        End If
    Else
        .UpdateHdr mSalStkCode
    End If
    If .mShrCode_lng > 0 Then
        If FormAddEditMode = cFORM_ADDMODE Then
            clsSAL.GetHdrData mSalCode
            clsSAL.mSahStkCode_lng = mSalStkCode
            
            dbNcbDatabase.BeginTrans
            dbNcbDatabase.Execute "Update SaleHdr set SahStkCode=" & CStr(mSalStkCode) & " where SahCode=" & CStr(mSalCode)
            dbNcbDatabase.Execute "Update SaleDtl set SalStkCode=" & CStr(mSalStkCode) & " where SalCode=" & CStr(mSalCode)
            dbNcbDatabase.CommitTrans
        End If
        clsSAL.UpdateTran mSalCode
        clsSAL.EndTran mSalCode
        
        .CommitStock mSalStkCode
        .EndStock mSalStkCode
        
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

If clsSAL.mTrnCode_lng > 0 Then   ' updated successfully
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

mSalCode = datRecset.fields("SahCode")
mSalStkCode = datRecset.fields("SahStkCode")
mRecAbsPos = datRecset.AbsolutePosition

If clsSAL.CanDeleteTran(mSalCode) = True Then
    txtVoid.SetFocus
    If clsSAL.BeginTran(mSalCode) = True And clsSTK.BeginStock(mSalStkCode) = True Then
        clsSAL.DeleteTran mSalCode
        clsSAL.UpdateTran mSalCode
        clsSAL.EndTran mSalCode
        
        clsSTK.DeleteStock mSalStkCode
        clsSTK.CommitStock mSalStkCode
        clsSTK.EndStock mSalStkCode
        
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
clsSAL.CancelTran mSalCode
clsSAL.EndTran mSalCode

clsSTK.CancelStock mSalStkCode
clsSTK.EndStock mSalStkCode

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
RefreshDatabase dbNcbDatabase
RefreshDatabase dbAcDatabase
RefreshDatabase dbGrpDatabase
RefreshDatabase dbComDatabase
clsListStru.Clear

If optMonthwise.Value = True Or optDatewise.Value = True Or optPartywise.Value = True Then
    If optMonthwise.Value = True Then
        clsListStru.AddFields mExpr:="SalYrMonth", mAttrib:=cFAT_SYSTEM
        clsListStru.AddFields mExpr:="SalMnYear", mTitle:="Month", mShowItem:=True, mAlign:=flexAlignLeftCenter, mWidth:=2000
        clsListStru.AddFields mExpr:="SalCount", mTitle:="Count", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="SalQty_sum", mTitle:="Qty", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="SalAmount_sum", mTitle:="Amount", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        
        datRecset.Open "Select format(SahDate,'yyyy/MM') as SalYrMonth" _
         & ",Count(SahCode) as SalCount" _
         & ",Sum(SahQty) as SalQty_sum" _
         & ",Sum(SahAmount) as SalAmount_sum" _
         & " from SaleHdr" _
         & " where SahDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and SahCode > 0 and SahVtmCode IN (" & mFormVchTypeList & ")" _
         & IIf(mQryPrtCode > 0, " and SahPrtCode = " & CStr(mQryPrtCode), "") _
         & " group by format(SahDate,'yyyy/MM')" _
         & " order by format(SahDate,'yyyy/MM')" _
         , dbNcbDatabase, adOpenKeyset, adLockReadOnly

    ElseIf optDatewise.Value = True Then
        clsListStru.AddFields mExpr:="SalDateYMD", mAttrib:=cFAT_SYSTEM
        clsListStru.AddFields mExpr:="SalDate", mTitle:="Date", mShowItem:=True, mAlign:=flexAlignLeftCenter, mWidth:=2000
        clsListStru.AddFields mExpr:="SalCount", mTitle:="Count", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="SalQty_sum", mTitle:="Qty", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="SalAmount_sum", mTitle:="Amount", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        
        datRecset.Open "Select SahDate" _
         & ",Count(SahCode) as SalCount" _
         & ",Sum(SahQty) as SalQty_sum" _
         & ",Sum(SahAmount) as SalAmount_sum" _
         & " from SaleHdr" _
         & " where SahDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and SahCode > 0 and SahVtmCode IN (" & mFormVchTypeList & ")" _
         & IIf(mQryPrtCode > 0, " and SahPrtCode=" & CStr(mQryPrtCode), "") _
         & " group by SahDate" _
         & " order by SahDate" _
         , dbNcbDatabase, adOpenKeyset, adLockReadOnly
        
    ElseIf optPartywise.Value = True Then
        clsListStru.AddFields mExpr:="PrtName", mTitle:="Party Name", mShowItem:=True, mAlign:=flexAlignLeftCenter, mWidth:=3000
        clsListStru.AddFields mExpr:="SalCount", mTitle:="Count", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="SalQty_sum", mTitle:="Qty", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="SalAmount_sum", mTitle:="Amount", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        
        datRecset.Open "Select PartyMast.PrtName,SaleHdr.SahPrtCode" _
         & ",Count(SahCode) as SalCount" _
         & ",Sum(SahQty) as SalQty_sum" _
         & ",Sum(SahAmount) as SalAmount_sum" _
         & " from SaleHdr inner join PartyMast on SaleHdr.SahPrtCode = PartyMast.PrtCode" _
         & " where SahDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and SahCode > 0 and SahVtmCode IN (" & mFormVchTypeList & ")" _
         & IIf(mQryPrtCode > 0, " and SahPrtCode=" & CStr(mQryPrtCode), "") _
         & " group by PartyMast.PrtName,SaleHdr.SahPrtCode" _
         & " order by PartyMast.PrtName,SaleHdr.SahPrtCode" _
         , dbNcbDatabase, adOpenKeyset, adLockReadOnly
    End If
    
ElseIf optDetailed.Value = True Then
    clsListStru.AddFields mExpr:="tSalSmryId", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="SalCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="VtmName", mTitle:="Voucher", mAlign:=flexAlignLeftCenter, mWidth:=1500, mShowItem:=True
    clsListStru.AddFields mExpr:="SalVchNo", mTitle:="Vchr.No", mAlign:=flexAlignRightCenter, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="SalDate", mTitle:="Date", mAlign:=flexAlignLeftCenter, mWidth:=1300, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="PrtCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="PrtName", mTitle:="Party Name", mAlign:=flexAlignLeftCenter, mWidth:=2500, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="SalQty", mTitle:="Qty", mAlign:=flexAlignRightCenter, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="SalAmount", mTitle:="Amount", mAlign:=flexAlignRightCenter, mWidth:=1250, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="PrtAddr", mTitle:="Address", mAlign:=flexAlignLeftCenter, mWidth:=2000, mShowItem:=True
    clsListStru.AddFields mExpr:="PatAraName", mTitle:="Area", mAlign:=flexAlignLeftCenter, mWidth:=1500, mShowItem:=True
    clsListStru.AddFields mExpr:="PatStnName", mTitle:="Station", mAlign:=flexAlignLeftCenter, mWidth:=1500, mShowItem:=True
    
    datRecset.Open "Select SaleHdr.*,PartyMast.*" _
     & ",format(SahDate,'yyyymmdd')+format(SahCode,'" & cLONGCODESTRFMT & "') as tSalSmryId" _
     & " from SaleHdr inner join PartyMast on SaleHdr.SahPrtCode=PartyMast.PrtCode" _
     & " where SahDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & IIf(mRemoteAccess = True, " and SahCode=" & CStr(mSalCode) & "", "") _
     & " and SahCode > 0 and SahVtmCode IN (" & mFormVchTypeList & ")" _
     & IIf(mQryPrtCode > 0, " and SahPrtCode=" & CStr(mQryPrtCode), "") _
     & " order by SahDate,SahCode" _
     , dbNcbDatabase, adOpenKeyset, adLockReadOnly
    
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
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalYrMonth")) = .fields("SalYrMonth")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalMnYear")) = MonthName(Val(Right(.fields("SalYrMonth"), 2))) & "-" & Left(.fields("SalYrMonth"), 4)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalCount")) = ToMyNumFmt(.fields("SalCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalQty_sum")) = ToMyNumFmt(.fields("SalQty_sum"), mDecimals:=-1)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalAmount_sum")) = ToMyNumFmt(.fields("SalAmount_sum"))
                
            ElseIf optDatewise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalDateYMD")) = Format(.fields("SahDate"), "yyyymmdd")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalDate")) = Dtoc(.fields("SahDate"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalCount")) = ToMyNumFmt(.fields("SalCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalQty_sum")) = ToMyNumFmt(.fields("SalQty_sum"), mDecimals:=-1)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalAmount_sum")) = ToMyNumFmt(.fields("SalAmount_sum"))
                
            ElseIf optPartywise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PrtName")) = .fields("PrtName")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalCount")) = ToMyNumFmt(.fields("SalCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalQty_sum")) = ToMyNumFmt(.fields("SalQty_sum"), mDecimals:=-1)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalAmount_sum")) = ToMyNumFmt(.fields("SalAmount_sum"))
                
            End If
        
        ElseIf optDetailed.Value = True Then
            clsARA.GetData .fields("PrtAraCode")
            clsSTN.GetData .fields("PrtStnCode")
            clsVTM.GetData .fields("SahVtmCode")
            
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("tSalSmryId")) = .fields("tSalSmryId")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalCode")) = .fields("SahCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("VtmName")) = clsVTM.mName_str
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalVchNo")) = .fields("SahVchNo")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalDate")) = Dtoc(.fields("SahDate"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalQty")) = ToMyNumFmt(.fields("SahQty"), mDecimals:=-1)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SalAmount")) = ToMyNumFmt(.fields("SahAmount"))
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
    If optDetailed.Value = True Or optExpanded.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("tSalSmryId"), mText
    ElseIf optMonthwise.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("SalYrMonth"), mText
    ElseIf optDatewise.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("SalDateYMD"), mText
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

Private Sub txtBkmName_Change()
If fcmbBkmName.CallFromText_Change = False Then
    fcmbBkmName.CallFromText_Change = True
    If InterActiveChange(txtBkmName) = True Then
        fcmbBkmName.UserText = Array(txtBkmName.Text, txtBkmName.SelStart)
        fcmbBkmName.Show
        txtBkmName.Text = fcmbBkmName.Text
        If fcmbBkmName.ListSelected = True Then
            SendKeys "{TAB}"
        End If
    End If
    fcmbBkmName.CallFromText_Change = False
End If

End Sub

Private Sub txtBkmName_GotFocus()
FlashActiveControl txtBkmName, True

End Sub

Private Sub txtBkmName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtBkmName_Change
End If

End Sub

Private Sub txtBkmName_LostFocus()
FlashActiveControl txtBkmName, False
End Sub

Private Sub txtBkmName_Validate(Cancel As Boolean)
If Val(fcmbBkmName.BoundText) <= 0 Then
    ErrorBox "Invalid Selection !!!"
    txtBkmName.SetFocus
    Cancel = True
Else
    If FormAddEditMode = cFORM_ADDMODE Or dtlAddMode = True Or Val(fcmbBkmName.BoundText) <> mSalBkmCode_old Then
        clsBKM.GetData Val(fcmbBkmName.BoundText)
        clsSIM.GetData clsBKM.mBkmSimCode_lng
        
        mskSalSimCode.Text = clsBKM.mBkmSimCode_lng
        mskSalItmCode.Text = clsSIM.mSimItmCode_lng
        
        Call ChkItrRefNoList
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

Private Sub CalcSalChg()
Dim mSalQty As Double, mSalRate As Double, mSalAmount As Double, mSalAmtBefDisc As Double, mSalDiscPer As Double, mSalDiscAmt As Double, mSalAmtBefTax As Double, mSalTaxPer As Double, mSalTaxAmt As Double

mSalQty = Val(UnMyNumFmt(mskSalQty.Text))
mSalRate = Val(UnMyNumFmt(mskSalRate.Text))
mSalDiscPer = Val(UnMyPerFmt(mskSalDiscPer.Text))
mSalTaxPer = Val(UnMyPerFmt(mskSalTaxPer.Text))
Rem If mFormSysVchType = cCOM_VTYPE_RETNOUTW Then
    mSalAmtBefDisc = Round(mSalQty * mSalRate, 2)
    
    mSalDiscAmt = Round(CDec(mSalAmtBefDisc) * CDec(mSalDiscPer) / 100, 2)
    
    mSalAmtBefTax = mSalAmtBefDisc - mSalDiscAmt
    Rem If FormAddEditMode = cFORM_ADDMODE Or dtlAddMode = True Or mSalTaxPer <> mSalTaxPer_old Or mSalAmtBefTax <> mSalAmtBefTax_old Or Val(UnMyNumFmt(mskSalTaxAmt.Text)) = 0 Then
        mSalTaxAmt = Round(CDec(mSalAmtBefTax) * CDec(mSalTaxPer) / 100, 2)
    Rem Else
    Rem     mSalTaxAmt = Val(UnMyNumFmt(mskSalTaxAmt.Text))
    Rem End If
    mSalAmount = Round(mSalAmtBefTax + mSalTaxAmt, 2)
Rem Else
Rem     mSalAmtBefTax = Round(mSalQty * mSalRate, 2)
Rem     If FormAddEditMode = cFORM_ADDMODE Or dtlAddMode = True Or mSalTaxPer <> mSalTaxPer_old Or mSalAmtBefTax <> mSalAmtBefTax_old Or Val(UnMyNumFmt(mskSalTaxAmt.Text)) = 0 Then
Rem         mSalTaxAmt = Round(CDec(mSalAmtBefTax) * CDec(mSalTaxPer) / 100, 2)
Rem     Else
Rem         mSalTaxAmt = Val(UnMyNumFmt(mskSalTaxAmt.Text))
Rem     End If
Rem     mSalAmount = Round(mSalAmtBefTax + mSalTaxAmt, 2)
Rem End If
' --------
mskSalAmtBefDisc.Text = ToMyNumFmt(mSalAmtBefDisc)
mskSalDiscAmt.Text = ToMyNumFmt(mSalDiscAmt)
mskSalAmtBefTax.Text = ToMyNumFmt(mSalAmtBefTax)
mskSalTaxAmt.Text = ToMyNumFmt(mSalTaxAmt)
mskSalAmount.Text = ToMyNumFmt(mSalAmount)

End Sub

Private Sub ShowOldSalCodeDesc()
Dim tRecset As New ADODB.Recordset, mSalDate As Date, mSalPrtCode As Long

mSalPrtCode = Val(fcmbPrtName.BoundText)
mSalDate = Ctod(dtpSalDate.Text)
With tRecset
'If FormAddEditMode = cFORM_ADDMODE Then
'    .Open "Select top 1 sah.*,vtm.VtmName from SaleHdr sah inner join VTypMast vtm on sah.SahVtmCode=vtm.VtmCode where sah.SahPrtCode=" & CStr(mSalPrtCode) & " order by sah.SahDate Desc", dbComDatabase, adOpenKeyset, adLockOptimistic
'Else
    .Open "Select top 1 sah.*,vtm.VtmName from SaleHdr sah" _
        & " inner join VTypMast vtm on sah.SahVtmCode = vtm.VtmCode" _
        & " where sah.SahPrtCode = " & CStr(mSalPrtCode) _
        & " and sah.SahCode <> " & CStr(mSalCode) _
        & " and sah.SahDate <= #" & ToSysDate(mSalDate) & "#" _
        & " and sah.SahVtmCode IN (" & mFormVchTypeList & ")" _
        & " order by sah.SahDate Desc", dbComDatabase, adOpenKeyset, adLockOptimistic
'End If
If .RecordCount > 0 Then
    lblOldSalCodeDesc.Caption = RTrim(.fields("VtmName")) & " No.:" & CStr(.fields("SahVchNo")) & " Dated:" & Dtoc(.fields("SahDate"))
Else
    lblOldSalCodeDesc.Caption = "#" & CStr(mSalPrtCode) & "#"
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
    Rem mskSalICode.Top = mRowPos
    Rem mskSalStkICode.Top = mRowPos
    mskSalSno.Top = mRowPos
    txtBkmName.Top = mRowPos
    txtSalNarr.Top = mRowPos + txtBkmName.Height
    Rem mskSalItmCode.Top = mRowPos
    txtSalItrRefNo.Top = mRowPos
    Rem mskSalPurCode.Top = mRowPos
    Rem mskSalPurICode.Top = mRowPos
    mskSalQty.Top = mRowPos
    mskSalRate.Top = mRowPos
    mskPurMRP.Top = mRowPos
    mskPurRate.Top = mRowPos
    Rem mskSalAmtBefDisc.Top = mRowPos
    mskSalDiscPer.Top = mRowPos
    mskSalDiscAmt.Top = mRowPos
    Rem mskSalAmtBefTax.Top = mRowPos
    mskSalTaxPer.Top = mRowPos
    mskSalTaxAmt.Top = mRowPos
    mskSalAmount.Top = mRowPos
    cmdOK.Top = mRowPos + mskSalAmount.Height
End If

mskSalICode.Text = 0
mskSalStkICode.Text = 0
mskSalSno.Text = 0
txtBkmName.Text = "": fcmbBkmName.BoundText = ""
txtSalNarr.Text = ""
mskSalItmCode.Text = 0
txtSalItrRefNo.Text = "": fcmbItrRefNo.BoundText = ""
mskSalPurCode.Text = 0
mskSalPurICode.Text = 0
mskSalQty.Text = ToMyNumFmt(0, mDecimals:=-1)
mskSalRate.Text = ToMyNumFmt(0)
mskPurMRP.Text = ToMyNumFmt(0)
mskPurRate.Text = ToMyNumFmt(0)
mskSalAmtBefDisc.Text = ToMyNumFmt(0)
mskSalDiscPer.Text = ToMyPerFmt(0)
mskSalDiscAmt.Text = ToMyNumFmt(0)
mskSalAmtBefTax.Text = ToMyNumFmt(0)
mskSalTaxPer.Text = ToMyPerFmt(0, mDecimals:=-1)
mskSalTaxAmt.Text = ToMyNumFmt(0)
mskSalAmount.Text = ToMyNumFmt(0)

Call ValidDtl

mskSalICode.Visible = False     '''  mShowItem
mskSalStkICode.Visible = False     '''  mShowItem
mskSalSno.Visible = mShowItem
txtBkmName.Visible = mShowItem
txtSalNarr.Visible = mShowItem
mskSalItmCode.Visible = False     '''  mShowItem
txtSalItrRefNo.Visible = mShowItem
mskSalPurCode.Visible = False     '''  mShowItem
mskSalPurICode.Visible = False     '''  mShowItem
mskSalQty.Visible = mShowItem
mskSalRate.Visible = mShowItem
mskPurMRP.Visible = mShowItem
mskPurRate.Visible = mShowItem
Rem mskSalAmtBefDisc.Visible = mShowItem
mskSalDiscPer.Visible = mShowItem
mskSalDiscAmt.Visible = mShowItem
Rem mskSalAmtBefTax.Visible = mShowItem
mskSalTaxPer.Visible = mShowItem
mskSalTaxAmt.Visible = mShowItem
mskSalAmount.Visible = mShowItem
cmdOK.Visible = mShowItem

frHeader.Enabled = (mShowItem = False)
Mfgrd2.Enabled = (mShowItem = False)
frFooter.Enabled = (mShowItem = False)
cmdSaveForm.Enabled = (mShowItem = False)

End Sub

Private Sub ValidDtl()
Dim mDataOk As Boolean, srow As Integer

srow = Mfgrd2.Row
mDataOk = (Val(fcmbPrtName.BoundText) > 0 And Val(fcmbVtmName.BoundText) > 0 And Val(UnMyNumFmt(mskSalSno.Text)) > 0 And Val(fcmbBkmName.BoundText) > 0 And Val(fcmbGdmName.BoundText) > 0 And Val(mskSalSimCode.Text) > 0 And Val(mskSalItmCode.Text) > 0 And Val(fcmbItrRefNo.BoundText) > 0 And Val(mskSalPurCode.Text) > 0 And Val(mskSalPurICode.Text) > 0 And Val(UnMyNumFmt(mskSalQty.Text)) > 0 And Val(UnMyNumFmt(mskSalRate.Text)) >= 0 And Val(UnMyNumFmt(mskSalDiscAmt.Text)) >= 0 And Val(UnMyNumFmt(mskSalTaxAmt.Text)) >= 0 And Val(UnMyNumFmt(mskSalAmount.Text)) >= 0)

cmdOK.Caption = IIf(mDataOk = True, "&OK", "&Cancel")
cmdOK.BackColor = IIf(mDataOk = True, &H80FF80, &H8080FF)
End Sub

Private Sub CalcFtrTotal(Optional ByVal mCalcBalOnly As Boolean = False)
Dim mDtlQtyTot As Double, mDtlAmtBefDiscTot As Double, mDtlDiscAmtTot As Double, mBillTaxableAmt As Double, mDtlTaxAmtTot As Double
Dim mHdrAmtBefDiscTot As Double, mHdrDiscPer As Double, mHdrDiscAmt As Double, mHdrTaxableAmt As Double, mHdrTaxPer As Double, mHdrTaxAmt As Double, mHdrOtherAmt As Double, mHdrROffAmt As Double, mHdrAmount As Double
Dim mItmTaxPer As Double, mItmTaxAmt As Double, mItmTaxableAmt As Double
Dim srow As Integer
Dim mTaxSmry As String, aPos As Integer, aryTaxPer() As Variant, aryTaxableAmt() As Variant, aryTaxAmt() As Variant

aryTaxPer = Array(): aryTaxableAmt = Array(): aryTaxAmt = Array()

mDtlQtyTot = FlexColSum(Mfgrd2, X2SALQTY_COL)
mDtlAmtBefDiscTot = FlexColSum(Mfgrd2, X2SALAMTBEFDISC_COL)
mDtlDiscAmtTot = FlexColSum(Mfgrd2, X2SALDISCAMT_COL)
mBillTaxableAmt = FlexColSum(Mfgrd2, X2SALAMTBEFTAX_COL)
mDtlTaxAmtTot = FlexColSum(Mfgrd2, X2SALTAXAMT_COL)

lblSalQtyTot.Caption = ToMyNumFmt(mDtlQtyTot, mDecimals:=-1)
lblSalAmtBefDiscTot.Caption = ToMyNumFmt(mDtlAmtBefDiscTot)
lblSalDiscAmtTot.Caption = ToMyNumFmt(mDtlDiscAmtTot)
lblSalTaxAmtTot.Caption = ToMyNumFmt(mDtlTaxAmtTot)

mHdrAmtBefDiscTot = 0
mHdrTaxableAmt = 0
With Mfgrd2
For srow = .FixedRows To .Rows - 1
    If Val(UnMyNumFmt(.TextMatrix(srow, X2SALDISCAMT_COL))) = 0 Then
        mHdrAmtBefDiscTot = mHdrAmtBefDiscTot + Val(UnMyNumFmt(.TextMatrix(srow, X2SALAMTBEFDISC_COL)))
    End If
    mItmTaxPer = Val(UnMyPerFmt(.TextMatrix(srow, X2SALTAXPER_COL)))
    mItmTaxAmt = Val(UnMyNumFmt(.TextMatrix(srow, X2SALTAXAMT_COL)))
    mItmTaxableAmt = Val(UnMyNumFmt(.TextMatrix(srow, X2SALAMTBEFTAX_COL)))
    If mItmTaxAmt = 0 Then
        mHdrTaxableAmt = mHdrTaxableAmt + mItmTaxableAmt
    Else
        aPos = AScan(aryTaxPer, mItmTaxPer)
        If aPos >= LBound(aryTaxPer) Then
            aryTaxableAmt(aPos) = aryTaxableAmt(aPos) + mItmTaxableAmt
            aryTaxAmt(aPos) = aryTaxAmt(aPos) + mItmTaxAmt
        Else
            AddToArray aryTaxPer, mItmTaxPer
            AddToArray aryTaxableAmt, mItmTaxableAmt
            AddToArray aryTaxAmt, mItmTaxAmt
        End If
    End If
    
Next srow
End With
mHdrDiscPer = Val(UnMyPerFmt(mskSahDiscPer.Text))
mHdrTaxPer = Val(UnMyPerFmt(mskSahTaxPer.Text))
mHdrOtherAmt = Val(UnMyNumFmt(mskSahOtherAmt.Text))
mHdrROffAmt = Val(UnMyNumFmt(mskSahROffAmt.Text))

If mHdrDiscPer <> 0 Then
    mHdrDiscAmt = Round(CDec(mHdrAmtBefDiscTot) * CDec(mHdrDiscPer) / 100, 2)
Else
    mHdrDiscAmt = 0
End If

mHdrTaxableAmt = mHdrTaxableAmt - mHdrDiscAmt
If mHdrTaxPer <> 0 Then
    mHdrTaxAmt = Round(CDec(mHdrTaxableAmt) * CDec(mHdrTaxPer) / 100, 2)
    
    aPos = AScan(aryTaxPer, mHdrTaxPer)
    If aPos >= LBound(aryTaxPer) Then
        aryTaxableAmt(aPos) = aryTaxableAmt(aPos) + mHdrTaxableAmt
        aryTaxAmt(aPos) = aryTaxAmt(aPos) + mHdrTaxAmt
    Else
        AddToArray aryTaxPer, mHdrTaxPer
        AddToArray aryTaxableAmt, mHdrTaxableAmt
        AddToArray aryTaxAmt, mHdrTaxAmt
    End If
Else
    mHdrTaxAmt = 0
End If
mBillTaxableAmt = mBillTaxableAmt - mHdrDiscAmt
mHdrDiscAmt = mHdrDiscAmt + mDtlDiscAmtTot
mHdrTaxAmt = mHdrTaxAmt + mDtlTaxAmtTot
mHdrAmount = mDtlAmtBefDiscTot - mHdrDiscAmt + mHdrTaxAmt + mHdrOtherAmt + mHdrROffAmt

mskSahDiscAmt.Text = ToMyNumFmt(mHdrDiscAmt)
mskSahTaxAmt.Text = ToMyNumFmt(mHdrTaxAmt)
lblSahAmtBefTax.Caption = ToMyNumFmt(mBillTaxableAmt)
lblSahAmount.Caption = ToMyNumFmt(mHdrAmount)

For aPos = LBound(aryTaxPer) To UBound(aryTaxPer)
    mTaxSmry = mTaxSmry & CStr(aryTaxableAmt(aPos)) & " @ " & CStr(aryTaxPer(aPos)) & "% = " & CStr(aryTaxAmt(aPos)) & ", "
Next aPos
If Right(mTaxSmry, 2) = ", " Then
    mTaxSmry = Left(mTaxSmry, Len(mTaxSmry) - 2)
End If
lblTaxSmry.Caption = mTaxSmry

Erase aryTaxPer: Erase aryTaxableAmt: Erase aryTaxAmt

'''Dim mDtlQtyTot As Double, mSalAmtBefTaxTot As Double, mSalTaxAmtTot As Double
'''Dim mSahAmtBefTaxTot As Double, mHdrTaxPer As Double, mHdrTaxAmt As Double, mHdrOtherAmt As Double, mHdrROffAmt As Double, mHdrAmount As Double
'''Dim srow As Integer
'''
'''mDtlQtyTot = FlexColSum(Mfgrd2, X2SALQTY_COL)
'''mSalAmtBefTaxTot = FlexColSum(Mfgrd2, X2SALAMTBEFTAX_COL)
'''mSalTaxAmtTot = FlexColSum(Mfgrd2, X2SALTAXAMT_COL)
'''
'''lblSalQtyTot.Caption = ToMyNumFmt(mDtlQtyTot, mDecimals:=-1)
'''lblSalAmtBefTaxTot.Caption = ToMyNumFmt(mSalAmtBefTaxTot)
'''lblSalTaxAmtTot.Caption = ToMyNumFmt(mSalTaxAmtTot)
'''
'''mSahAmtBefTaxTot = 0
'''With Mfgrd2
'''For srow = .FixedRows To .Rows - 1
'''    If Val(UnMyNumFmt(.TextMatrix(srow, X2SALTAXAMT_COL))) = 0 Then
'''        mSahAmtBefTaxTot = mSahAmtBefTaxTot + Val(UnMyNumFmt(.TextMatrix(srow, X2SALAMTBEFTAX_COL)))
'''    End If
'''Next srow
'''End With
'''mHdrTaxPer = Val(UnMyPerFmt(mskSahTaxPer.Text))
'''mHdrOtherAmt = Val(UnMyPerFmt(mskSahOtherAmt.Text))
'''mHdrROffAmt = Val(UnMyPerFmt(mskSahROffAmt.Text))
'''If mHdrTaxPer <> 0 Then
'''    mHdrTaxAmt = CDec(mSahAmtBefTaxTot) * CDec(mHdrTaxPer) / 100
'''Else
'''    mHdrTaxAmt = 0
'''End If
'''mHdrTaxAmt = mHdrTaxAmt + mSalTaxAmtTot
'''mHdrAmount = mSalAmtBefTaxTot + mHdrTaxAmt + mHdrOtherAmt + mHdrROffAmt
'''
'''mskSahTaxAmt.Text = ToMyNumFmt(mHdrTaxAmt)
'''lblSahAmount.Caption = ToMyNumFmt(mHdrAmount)

End Sub

Private Sub ShowLinkTranDtl()
Dim tRecset As New ADODB.Recordset, mLinkTranStr As String

mLinkTranStr = ""

With tRecset
.Open "Select * from ((((SaleDtl sal" _
    & " inner join SaleHdr sah on sal.SalCode = sah.SahCode)" _
    & " inner join PurchDtl pur on sal.SalPurICode = pur.PurICode)" _
    & " inner join PurchHdr puh on pur.PurCode = puh.PuhCode)" _
    & " inner join BookMast bkm on pur.PurBkmCode = bkm.BkmCode)" _
    & " inner join VTypMast vtm on puh.PuhVtmCode = vtm.VtmCode" _
    & " where SalCode = " & CStr(mSalCode) _
    & " order by PurDate,PurCode,PurSno" _
    , dbComDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    Do While .EOF = False
        mLinkTranStr = mLinkTranStr & .fields("VtmName") & " No." & CStr(.fields("PuhVchNo")) & " Dt." & Dtoc(.fields("PuhDate")) & " It." & .fields("BkmName") & " Rf." & .fields("PurItrRefNo") & " Qty." & ToMyNumFmt(.fields("PurQty"), mDecimals:=-1) & vbCrLf
    
        .MoveNext
    Loop
End If
End With
CloseTable tRecset

txtLinkTranDesc.Text = mLinkTranStr

End Sub

Private Sub ChkItrRefNoList()
Rem important: below queries not almost same as in flexsearch class
fcmbItrRefNo.mBoundSqlExpr = "Select *,ItrRefNo+'_'+format(ItrCode,'" & cLONGCODESTRFMT & "') as ItrRefNoUnq from (" _
    & "Select ItrRefNo,ItrCode,sum(Qty) as Qty_sum from (" _
    & "Select PurItrCode as ItrCode,PurItrRefNo as ItrRefNo,PurQty as Qty from PurchDtl" _
    & " inner join PurchHdr on PurchDtl.PurCode = PurchHdr.PuhCode" _
    & " where PurBkmCode = " & CStr(Val(fcmbBkmName.BoundText)) _
    & " and PurItmCode = " & CStr(Val(mskSalItmCode.Text)) _
    & " and PurDate <= #" & CStr(ToSysDate(Ctod(dtpSalDate.Text))) & "#" _
    & " Union All " _
    & "Select SalItrCode as ItrCode,SalItrRefNo as ItrRefNo,(SalQty*-1) as Qty from SaleDtl" _
    & IIf(FormAddEditMode = cFORM_EDITMODE, " inner join SaleHdr on SaleDtl.SalCode = SaleHdr.SahCode", "") _
    & " where SalBkmCode = " & CStr(Val(fcmbBkmName.BoundText)) _
    & " and SalItmCode = " & CStr(Val(mskSalItmCode.Text)) _
    & " and SalICode <> " & CStr(Val(mskSalICode.Text)) _
    & " and (SalRecState <> " & CStr(cREC_CANCELED) & " and SalRecState <> " & CStr(cREC_DELETED) & " and SalCode = " & CStr(mSalCode) & ")" _
    & ")" _
    & " group by ItrCode,ItrRefNo order by ItrCode,ItrRefNo" _
    & ") as t1 inner join ProdRef on t1.ItrCode = ProdRef.ItrRefCode" _
    & " where Qty_sum > 0"
    Rem & " where PurPrtCode = " & CStr(Val(fcmbPrtName.BoundText)) & " where SalPrtCode = " & CStr(Val(fcmbPrtName.BoundText))
fcmbItrRefNo.mListSqlExpr = "Select *,ItrRefNo+'_'+format(ItrCode,'" & cLONGCODESTRFMT & "') as ItrRefNoUnq from (" _
    & "Select ItrRefNo,ItrCode,sum(Qty) as Qty_sum from (" _
    & "Select PurItrCode as ItrCode,PurItrRefNo as ItrRefNo,PurQty as Qty from PurchDtl" _
    & " inner join PurchHdr on PurchDtl.PurCode = PurchHdr.PuhCode" _
    & " where PurBkmCode = " & CStr(Val(fcmbBkmName.BoundText)) _
    & " and PurItmCode = " & CStr(Val(mskSalItmCode.Text)) _
    & " and PurDate <= #" & CStr(ToSysDate(Ctod(dtpSalDate.Text))) & "#" _
    & " Union All " _
    & "Select SalItrCode as ItrCode,SalItrRefNo as ItrRefNo,(SalQty*-1) as Qty from SaleDtl" _
    & IIf(FormAddEditMode = cFORM_EDITMODE, " inner join SaleHdr on SaleDtl.SalCode = SaleHdr.SahCode", "") _
    & " where SalBkmCode = " & CStr(Val(fcmbBkmName.BoundText)) _
    & " and SalItmCode = " & CStr(Val(mskSalItmCode.Text)) _
    & " and SalICode <> " & CStr(Val(mskSalICode.Text)) _
    & " and (SalRecState <> " & CStr(cREC_CANCELED) & " and SalRecState <> " & CStr(cREC_DELETED) & " and SalCode = " & CStr(mSalCode) & ")" _
    & ")" _
    & " group by ItrRefNo,ItrCode order by ItrRefNo,ItrCode" _
    & ") as t1 inner join ProdRef on t1.ItrCode = ProdRef.ItrRefCode" _
    & " where Qty_sum > 0"
    Rem & " where PurPrtCode=" & CStr(Val(fcmbPrtName.BoundText)) & " where SalPrtCode = " & CStr(Val(fcmbPrtName.BoundText))
fcmbItrRefNo.ReInit

End Sub

Private Function ChkAnyPostRcExist() As Boolean
Dim tRecset As New ADODB.Recordset

ChkAnyPostRcExist = False

With tRecset
.Open "Select top 1 * from ((PurchDtl" _
    & " inner join PurchHdr on PurchDtl.PurCode = PurchHdr.PuhCode)" _
    & " inner join SaleDtl on PurchDtl.PurICode = SaleDtl.SalPurICode)" _
    & " Inner Join SaleHdr on SaleDtl.SalCode = SaleHdr.SahCode" _
    & " where SalCode = " & CStr(mSalCode) _
    & " and PurDate > #" & CStr(ToSysDate(Ctod(dtpSalDate.Text))) & "#" _
    & " order by PurDate,PurCode" _
    , dbNcbDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    clsVTM.GetData .fields("PuhVtmCode")
    ErrorBox "Post Purchase Exist !!!" _
        & vbCrLf & clsVTM.mName_str & " No." & CStr(.fields("PuhVchNo")) & " Dated " & Dtoc(.fields("PuhDate")) & ""
    ChkAnyPostRcExist = True
End If
End With
CloseTable tRecset

End Function

Private Function ChkAnyMisLinkedRcExist(Optional ByVal mSalICode) As Boolean
Dim tRecset As New ADODB.Recordset, mMisLinkedDesc As String

ChkAnyMisLinkedRcExist = False
mMisLinkedDesc = ""

With tRecset
.Open "Select top 1 * from ((PurchDtl" _
    & " inner join PurchHdr on PurchDtl.PurCode = PurchHdr.PuhCode)" _
    & " inner join SaleDtl on PurchDtl.PurICode = SaleDtl.SalPurICode)" _
    & " Inner Join SaleHdr on SaleDtl.SalCode = SaleHdr.SahCode" _
    & " where SalCode = " & CStr(mSalCode) _
    & IIf(IsMissing(mSalICode) = False, " and SalICode=" & CStr(mSalICode), "") _
    & " and (SalBkmCode <> PurBkmCode or SalItmCode <> PurItmCode or SalItrCode <> PurItrCode or SalItrRefNo <> PurItrRefNo)" _
    & " order by PuhDate,PuhCode" _
    , dbNcbDatabase, adOpenKeyset, adLockOptimistic
    Rem PuhPrtCode<>" & CStr(Val(fcmbPrtName.BoundText)) & " or
If .EOF = False Then
    clsVTM.GetData .fields("PuhVtmCode")
    'If .fields("PuhPrtCode") <> Val(fcmbPrtName.BoundText) Then
    '    mMisLinkedDesc = mMisLinkedDesc & "<Party Name>"
    'End If
    If .fields("SalBkmCode") <> .fields("PurBkmCode") Then
        mMisLinkedDesc = mMisLinkedDesc & "<Item Name>"
    End If
    If .fields("SalItmCode") <> .fields("PurItmCode") Then
        mMisLinkedDesc = mMisLinkedDesc & "<Main Product Name>"
    End If
    If .fields("SalItrCode") <> .fields("PurItrCode") Then
        mMisLinkedDesc = mMisLinkedDesc & "<Item Ref.Code>"
    End If
    If .fields("SalItrRefNo") <> .fields("PurItrRefNo") Then
        mMisLinkedDesc = mMisLinkedDesc & "<Item Ref.No.>"
    End If
    ErrorBox "Mis-Linked Purchase Exist !!!" _
        & vbCrLf & clsVTM.mName_str & " No." & CStr(.fields("PuhVchNo")) & " Dated " & Dtoc(.fields("PuhDate")) _
        & vbCrLf & "Alteration made in " _
        & vbCrLf & mMisLinkedDesc
    ChkAnyMisLinkedRcExist = True
End If
End With
CloseTable tRecset

End Function

Private Function ChkAnyExcessIsuExist(Optional ByVal mSalICode) As Boolean
Dim tRecset As New ADODB.Recordset

ChkAnyExcessIsuExist = False

With tRecset
.Open "Select top 1 * from (" _
    & "Select PurICode,BkmCode,ItmCode,ItrCode,ItrRefNo,sum(Qty) as Qty_sum from (" _
    & "Select PurICode,PurBkmCode as BkmCode,PurItmCode as ItmCode,PurItrCode as ItrCode,PurItrRefNo as ItrRefNo,PurQty as Qty from (PurchDtl" _
    & " inner join PurchHdr on PurchDtl.PurCode = PurchHdr.PuhCode)" _
    & " inner join SaleDtl on PurchDtl.PurICode = SaleDtl.SalPurICode" _
    & " where SalCode = " & CStr(mSalCode) & IIf(IsMissing(mSalICode) = False, " and SalICode=" & CStr(mSalICode), "") _
    & " and PurRecState IN (" & CStr(cREC_ADDED) & "," & CStr(cREC_EDITED) & "," & CStr(cREC_UNCHANGED) & ")" _
    & " Union All " _
    & "Select SalPurICode as PurICode,SalBkmCode as BkmCode,SalItmCode as ItmCode,SalItrCode as ItrCode,SalItrRefNo as ItrRefNo,(SalQty*-1) as Qty from SaleDtl" _
    & " left join SaleHdr on SaleDtl.SalCode=SaleHdr.SahCode" _
    & " where SalCode = " & CStr(mSalCode) & IIf(IsMissing(mSalICode) = False, " and SalICode=" & CStr(mSalICode), "") _
    & " and SalRecState <> " & CStr(cREC_CANCELED) _
    & " Union All " _
    & "Select sal.SalPurICode as PurICode,sal.SalBkmCode as BkmCode,sal.SalItmCode as ItmCode,sal.SalItrCode as ItrCode,sal.SalItrRefNo as ItrRefNo,(sal.SalQty*-1) as Qty from ((SaleDtl" _
    & " left join SaleHdr on SaleDtl.SalCode = SaleHdr.SahCode)" _
    & " inner join SaleDtl sal on SaleDtl.SalPurICode = sal.SalPurICode)" _
    & " left join SaleHdr sah on sal.SalCode = sah.SahCode" _
    & " where SaleDtl.SalCode = " & CStr(mSalCode) & " and sal.SalCode <> " & CStr(mSalCode) & IIf(IsMissing(mSalICode) = False, " and SaleDtl.SalICode = " & CStr(mSalICode) & " and sal.SalICode <> " & CStr(mSalICode), "") _
    & " and sal.SalRecState <> " & CStr(cREC_CANCELED) _
    & ")" _
    & " group by PurICode,BkmCode,ItmCode,ItrCode,ItrRefNo order by PurICode,BkmCode,ItmCode,ItrCode,ItrRefNo" _
    & ") as a" _
    & " inner join BookMast on a.BkmCode = BookMast.BkmCode" _
    & " where Qty_sum < 0" _
    , dbNcbDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    ErrorBox "Sale/Purch.Return going Excess for Item " & vbCrLf & .fields("BkmName") & " Ref.No." & CStr(.fields("ItrRefNo")) & " by Qty " & CStr(.fields("Qty_sum"))
    ChkAnyExcessIsuExist = True
End If
End With
CloseTable tRecset

End Function


Rem ---------------------------------------------- end of form -------------------------------------------------

