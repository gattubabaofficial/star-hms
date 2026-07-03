VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "Mscomctl.ocx"
Begin VB.Form frmPurchaseInv 
   Appearance      =   0  'Flat
   BackColor       =   &H00FFFFFF&
   ClientHeight    =   11340
   ClientLeft      =   60
   ClientTop       =   60
   ClientWidth     =   15120
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
   ScaleHeight     =   11340
   ScaleWidth      =   15120
   ShowInTaskbar   =   0   'False
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   106
      Top             =   11025
      Width           =   15120
      _ExtentX        =   26670
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
            TextSave        =   "20:19"
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
      TabIndex        =   53
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
      TabIndex        =   52
      TabStop         =   0   'False
      Top             =   0
      Width           =   255
   End
   Begin VB.ComboBox cmbFormEntryMode 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   315
      ItemData        =   "PurchEnt.frx":0000
      Left            =   0
      List            =   "PurchEnt.frx":000D
      Style           =   1  'Simple Combo
      TabIndex        =   51
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
      Height          =   9975
      Left            =   120
      TabIndex        =   50
      Top             =   840
      Width           =   14775
      Begin VB.TextBox mskPurSimCode 
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
         Left            =   2160
         TabIndex        =   23
         Tag             =   "AhCode"
         Text            =   "PurSimCode"
         Top             =   5520
         Visible         =   0   'False
         Width           =   1335
      End
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
         Left            =   5160
         MaxLength       =   25
         TabIndex        =   27
         Text            =   "GdmName"
         Top             =   4320
         Width           =   1335
      End
      Begin VB.TextBox mskPurAmtBefDisc 
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
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   5520
         TabIndex        =   32
         Text            =   "PurAmtBefDis"
         Top             =   5160
         Visible         =   0   'False
         Width           =   1455
      End
      Begin VB.TextBox mskPurDiscPer 
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
         Left            =   9120
         TabIndex        =   33
         Tag             =   "AhCode"
         Text            =   "DisPer"
         Top             =   4320
         Width           =   855
      End
      Begin VB.TextBox mskPurDiscAmt 
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
         Left            =   9960
         TabIndex        =   34
         Tag             =   "AhCode"
         Text            =   "DiscAmt"
         Top             =   4320
         Width           =   1095
      End
      Begin VB.TextBox mskPurAmtBefTax 
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
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   7320
         TabIndex        =   35
         Text            =   "PurAmtBefTax"
         Top             =   5160
         Visible         =   0   'False
         Width           =   1455
      End
      Begin VB.TextBox mskPurTaxAmt 
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
         Left            =   11760
         TabIndex        =   37
         Tag             =   "AhCode"
         Text            =   "TaxAmt"
         Top             =   4320
         Width           =   975
      End
      Begin VB.TextBox mskPurTaxPer 
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
         Left            =   11040
         TabIndex        =   36
         Tag             =   "AhCode"
         Text            =   "TaxPer"
         Top             =   4320
         Width           =   735
      End
      Begin VB.TextBox mskPurSRate 
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
         Left            =   7320
         TabIndex        =   31
         Tag             =   "AhCode"
         Text            =   "PurSRate"
         Top             =   5520
         Width           =   975
      End
      Begin VB.TextBox mskPurMRP 
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
         Left            =   8160
         TabIndex        =   30
         Tag             =   "AhCode"
         Text            =   "PurMRP"
         Top             =   4320
         Width           =   975
      End
      Begin VB.TextBox txtPurNarr 
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
         MaxLength       =   25
         TabIndex        =   22
         Text            =   "PurNarr"
         Top             =   4680
         Width           =   6015
      End
      Begin VB.TextBox mskPurStkICode 
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
         Left            =   600
         TabIndex        =   18
         Tag             =   "AhCode"
         Text            =   "PurStkICode"
         Top             =   5520
         Visible         =   0   'False
         Width           =   1335
      End
      Begin VB.TextBox mskPurItrCode 
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
         Left            =   3720
         TabIndex        =   25
         Tag             =   "AhCode"
         Text            =   "PurItrCode"
         Top             =   5160
         Visible         =   0   'False
         Width           =   1335
      End
      Begin VB.TextBox mskPurItmCode 
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
         Left            =   2160
         TabIndex        =   24
         Tag             =   "AhCode"
         Text            =   "PurItmCode"
         Top             =   5160
         Visible         =   0   'False
         Width           =   1335
      End
      Begin VB.TextBox txtPurItrRefNo 
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
         Left            =   3360
         MaxLength       =   25
         TabIndex        =   26
         Text            =   "PurItrRefNo"
         Top             =   4320
         Width           =   1815
      End
      Begin VB.TextBox mskPurICode 
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
         Left            =   600
         TabIndex        =   19
         Tag             =   "AhCode"
         Text            =   "PurICode"
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
         Left            =   12840
         Style           =   1  'Graphical
         TabIndex        =   39
         Top             =   4680
         Width           =   735
      End
      Begin VB.TextBox mskPurSno 
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
         Height          =   3015
         Left            =   120
         TabIndex        =   73
         Top             =   240
         Width           =   14535
         Begin VB.TextBox mskPurStkCode 
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
            TabIndex        =   94
            Tag             =   "AhCode"
            Text            =   "-1"
            Top             =   240
            Width           =   1455
         End
         Begin VB.TextBox dtpPurTrnRefDt 
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
            Top             =   2640
            Width           =   1455
         End
         Begin VB.TextBox txtPurTrnRefNo 
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
            Top             =   2640
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
         Begin VB.TextBox txtPurTime_str 
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
            Top             =   2280
            Width           =   855
         End
         Begin VB.TextBox dtpPurDate 
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
            Top             =   2280
            Width           =   1455
         End
         Begin VB.TextBox mskPurVchNo 
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
            Top             =   2280
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
            Top             =   2280
            Width           =   1815
         End
         Begin VB.TextBox txtPurPrefix 
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
            Top             =   2280
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
            Left            =   8880
            Locked          =   -1  'True
            MaxLength       =   50
            TabIndex        =   6
            TabStop         =   0   'False
            Top             =   1800
            Width           =   5055
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
            Width           =   5055
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
            Width           =   5055
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
         Begin VB.TextBox txtPuhRemark 
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
            Top             =   2640
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
            Height          =   285
            Index           =   2
            Left            =   3960
            TabIndex        =   93
            Top             =   2640
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
            Height          =   285
            Index           =   1
            Left            =   120
            TabIndex        =   92
            Top             =   2640
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
            Left            =   7680
            TabIndex        =   85
            Top             =   2280
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
            TabIndex        =   84
            Top             =   2280
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
            Left            =   3960
            TabIndex        =   83
            Top             =   2280
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
            TabIndex        =   82
            Top             =   2280
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
            TabIndex        =   81
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
            Height          =   285
            Index           =   0
            Left            =   120
            TabIndex        =   80
            Top             =   720
            Width           =   1935
         End
         Begin VB.Line Line3 
            Index           =   1
            X1              =   0
            X2              =   14280
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
            TabIndex        =   79
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
            Height          =   285
            Index           =   9
            Left            =   120
            TabIndex        =   78
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
            Height          =   285
            Index           =   10
            Left            =   7440
            TabIndex        =   77
            Top             =   1800
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
            TabIndex        =   76
            Top             =   1080
            Width           =   1455
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
            Left            =   7440
            TabIndex        =   75
            Top             =   1440
            Width           =   1455
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
            Left            =   6480
            TabIndex        =   74
            Top             =   2640
            Width           =   1215
         End
         Begin VB.Shape Shape1 
            BackColor       =   &H00D9FFB3&
            BackStyle       =   1  'Opaque
            Height          =   2055
            Index           =   0
            Left            =   0
            Top             =   120
            Width           =   14535
         End
         Begin VB.Shape Shape1 
            BackColor       =   &H00FFFF80&
            BackStyle       =   1  'Opaque
            Height          =   855
            Index           =   2
            Left            =   0
            Top             =   2160
            Width           =   14535
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
         TabIndex        =   21
         Text            =   "BkmName"
         Top             =   4320
         Width           =   2775
      End
      Begin VB.TextBox mskPurAmount 
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
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   12720
         TabIndex        =   38
         Text            =   "PurAmount"
         Top             =   4320
         Width           =   1455
      End
      Begin VB.TextBox mskPurRate 
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
         Left            =   7200
         TabIndex        =   29
         Tag             =   "AhCode"
         Text            =   "PurRate"
         Top             =   4320
         Width           =   975
      End
      Begin VB.TextBox mskPurQty 
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
         Left            =   6480
         TabIndex        =   28
         Tag             =   "AhCode"
         Text            =   "PurQty"
         Top             =   4320
         Width           =   735
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
         Left            =   9600
         Style           =   1  'Graphical
         TabIndex        =   46
         Top             =   9480
         Width           =   375
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd2 
         Height          =   4095
         Left            =   120
         TabIndex        =   17
         Top             =   3240
         Width           =   14535
         _ExtentX        =   25638
         _ExtentY        =   7223
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
         Height          =   2415
         Left            =   120
         TabIndex        =   86
         Top             =   7440
         Width           =   14535
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
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   1005
            Left            =   0
            Locked          =   -1  'True
            MultiLine       =   -1  'True
            ScrollBars      =   2  'Vertical
            TabIndex        =   105
            TabStop         =   0   'False
            Text            =   "PurchEnt.frx":002D
            Top             =   840
            Width           =   9255
         End
         Begin VB.TextBox mskPuhDiscPer 
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
            Left            =   11760
            TabIndex        =   40
            Text            =   "PuhDiscPer"
            Top             =   480
            Width           =   1095
         End
         Begin VB.TextBox mskPuhDiscAmt 
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
            Left            =   12840
            TabIndex        =   41
            Text            =   "PuhDiscAmt"
            Top             =   480
            Width           =   1455
         End
         Begin VB.TextBox mskPuhROffAmt 
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
            Left            =   12840
            TabIndex        =   45
            Text            =   "PuhROffAmt"
            Top             =   1560
            Width           =   1455
         End
         Begin VB.TextBox mskPuhOtherAmt 
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
            Left            =   12840
            TabIndex        =   44
            Text            =   "PuhOtherAmt"
            Top             =   1200
            Width           =   1455
         End
         Begin VB.TextBox mskPuhTaxAmt 
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
            Left            =   12840
            TabIndex        =   43
            Text            =   "PuhTaxAmt"
            Top             =   840
            Width           =   1455
         End
         Begin VB.TextBox mskPuhTaxPer 
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
            Left            =   11760
            TabIndex        =   42
            Text            =   "PuhTaxPer"
            Top             =   840
            Width           =   1095
         End
         Begin VB.Label lblPuhAmtBefTax 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "PuhAmtBefTax"
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
            TabIndex        =   104
            Top             =   120
            Visible         =   0   'False
            Width           =   1455
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Disc.%"
            BeginProperty Font 
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
            Index           =   15
            Left            =   10320
            TabIndex        =   103
            Top             =   480
            Width           =   1455
         End
         Begin VB.Label lblPurDiscAmtTot 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "PurDiscAmt"
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
            TabIndex        =   102
            Top             =   120
            Width           =   1095
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Net Amount:"
            BeginProperty Font 
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
            Left            =   10320
            TabIndex        =   101
            Top             =   1920
            Width           =   1455
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Round Off:"
            BeginProperty Font 
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
            Left            =   10320
            TabIndex        =   100
            Top             =   1560
            Width           =   1455
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Other Chg.:"
            BeginProperty Font 
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
            Left            =   10320
            TabIndex        =   99
            Top             =   1200
            Width           =   1455
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Tax:"
            BeginProperty Font 
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
            Left            =   10320
            TabIndex        =   98
            Top             =   840
            Width           =   1455
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
            Index           =   4
            Left            =   16200
            TabIndex        =   97
            Top             =   0
            Width           =   855
         End
         Begin VB.Label lblPurTaxAmtTot 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "PurTaxAmt"
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
            Left            =   11760
            TabIndex        =   96
            Top             =   120
            Width           =   1095
         End
         Begin VB.Label lblPurAmtBefDiscTot 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "PurAmtBefDisc"
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
            Left            =   12840
            TabIndex        =   95
            Top             =   120
            Width           =   1455
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Last Purchase:"
            BeginProperty Font 
               Name            =   "Verdana"
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
            TabIndex        =   91
            Top             =   2040
            Width           =   1575
         End
         Begin VB.Label lblOldPurCodeDesc 
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
            TabIndex        =   90
            Top             =   2040
            Width           =   6135
         End
         Begin VB.Label lblTaxSmry 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Purchase / Sales Return Tax Summary"
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
            TabIndex        =   89
            Top             =   480
            Width           =   9255
            WordWrap        =   -1  'True
         End
         Begin VB.Label lblPuhAmount 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "PuhAmount"
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
            Left            =   12840
            TabIndex        =   88
            Top             =   1920
            Width           =   1455
         End
         Begin VB.Label lblPurQtyTot 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "PurQty"
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
            Left            =   5280
            TabIndex        =   87
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
      TabIndex        =   49
      Top             =   840
      Width           =   14895
      Begin VB.Frame frConfigure 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   5295
         Left            =   3000
         TabIndex        =   68
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
            TabIndex        =   66
            Top             =   4560
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
            Height          =   2775
            Left            =   2160
            TabIndex        =   60
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
               TabIndex        =   61
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
               TabIndex        =   62
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
               TabIndex        =   63
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
               TabIndex        =   64
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
               TabIndex        =   65
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
            TabIndex        =   58
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
            TabIndex        =   57
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
            TabIndex        =   59
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
            TabIndex        =   72
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
            TabIndex        =   71
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
            TabIndex        =   70
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
            TabIndex        =   69
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
         TabIndex        =   56
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
         TabIndex        =   54
         Top             =   360
         Width           =   4215
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd1 
         Height          =   6375
         Left            =   120
         TabIndex        =   55
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
         TabIndex        =   67
         Top             =   360
         Width           =   735
      End
   End
   Begin VB.TextBox txtVoid 
      CausesValidation=   0   'False
      Height          =   375
      Left            =   0
      TabIndex        =   47
      TabStop         =   0   'False
      Text            =   "Void"
      Top             =   10560
      Width           =   375
   End
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Incoming Stock Voucher"
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
      TabIndex        =   48
      Top             =   0
      Width           =   9015
   End
End
Attribute VB_Name = "frmPurchaseInv"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Dim mFormLoaded As Boolean, mLastKeyPressed As Integer, mMaskKeyPressed As Integer
Dim mFormUIdCode As Long, mFormUIdFileName As String, mFormAcsPermFileName As String
Dim mFormSysVchType As Integer, mFormVchTypeList As String, mPurCode As Long, mPurStkCode As Long, mQryPrtCode As Long, dtlAddEditMode As Boolean, dtlAddMode As Boolean, dtlEditCanceled As Boolean
Dim mRemoteAccess As Boolean, mEntrySaved As Boolean, mEntryAborted As Boolean
Dim dbAcDatabase As New ADODB.Connection, dbStDatabase As New ADODB.Connection, dbNcbDatabase As New ADODB.Connection, dbGrpDatabase As New ADODB.Connection, dbComDatabase As New ADODB.Connection
Dim datRecset As New ADODB.Recordset
Dim mPurCode_old As Long, mPurStkCode_old As Long, mPurPrtCode_old As Long, mPurDate_old As Date, mPurVtmCode_old As Long, mPurVchNo_old As Long, mPurTime_old As Long
Dim mPurBkmCode_old As Long, mPurGdmCode_old As Long, mPurSimCode_old As Long, mPurItmCode_old As Long, mPurItrCode_old As Long, mPurItrRefNo_old As String, mPurAmtBefDisc_old As Double, mPurDiscPer_old As Double, mPurAmtBefTax_old As Double, mPurTaxPer_old As Double
Dim mPuhAmount_old As Double
Dim clsAH As clsAccountHead, clsSTK As clsStockJrn, clsPUR As clsNcbMultiTranEntry, clsARA As clsComMastEntry, clsSTN As clsComMastEntry, clsVTM As clsComMastEntry
Dim clsPRT As clsNcbMasterEntry, clsBKM As clsNcbMasterEntry, clsSIM As clsNcbMasterEntry
Dim mActiveControl As Object, clsListStru As clsSelectQueryStructure
Dim fcmbVtmName As clsComFlexSearch
Dim fcmbPrtName As clsNcbFlexSearch, fcmbBkmName As clsNcbFlexSearch, fcmbGdmName As clsNcbFlexSearch

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
Const X2PURICODE_COL = 0
Const X2PURSNO_COL = 1
Const X2BKMNAME_COL = 2
Const X2PURITRREFNO_COL = 3
Const X2GDMNAME_COL = 4
Const X2PURQTY_COL = 5
Const X2PURRATE_COL = 6
Const X2PURMRP_COL = 7
Const X2PURSRATE_COL = 8
Const X2PURAMTBEFDISC_COL = 9
Const X2PURDISCPER_COL = 10
Const X2PURDISCAMT_COL = 11
Const X2PURAMTBEFTAX_COL = 12
Const X2PURTAXPER_COL = 13
Const X2PURTAXAMT_COL = 14
Const X2PURAMOUNT_COL = 15
Const X2PURNARR_COL = 16
Const X2PURBKMCODE_COL = 17
Const X2PURSIMCODE_COL = 18
Const X2PURGDMCODE_COL = 19
Const X2PURITMCODE_COL = 20
Const X2PURITRCODE_COL = 21
Const X2PURSTKICODE_COL = 22
Const X2PURRECSTATE_COL = 23
Const MFGRD2_COLS = 24

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

dtpFromDate.Text = IIf(mFormSysVchType = cCOM_VTYPE_OPNSTK, Dtoc(sCmpBookStartDate - 1), Dtoc(sFinYrStartDate))
dtpToDate.Text = IIf(mFormSysVchType = cCOM_VTYPE_OPNSTK, Dtoc(sCmpBookStartDate - 1), Dtoc(sFinYrEndDate))
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
mPurCode = mAccessCode
End Property

Public Property Get EntryBoundCode() As Long
EntryBoundCode = Val(mskFormBoundField.Text)
End Property

Public Property Get EntryDate() As Date
EntryDate = Ctod(dtpPurDate.Text)
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
If mFormSysVchType = cCOM_VTYPE_OPNSTK Then
    If Ctod(dtpFromDate.Text) <> sCmpBookStartDate - 1 Then
        dtpFromDate.Text = Dtoc(sCmpBookStartDate - 1)
    End If
    If Ctod(dtpToDate.Text) <> sCmpBookStartDate - 1 Then
        dtpToDate.Text = Dtoc(sCmpBookStartDate - 1)
    End If
ElseIf IsFinYrDate(Ctod(dtpFromDate.Text)) = False Then
    ErrorBox "Invalid Date Range !!!"
    dtpFromDate.SetFocus
    Exit Sub
ElseIf IsFinYrDate(Ctod(dtpToDate.Text)) = False Then
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
                    If mFormSysVchType = cCOM_VTYPE_OPNSTK Then
                        dtpFromDate.Text = Dtoc(MonthEndDate(DateSerial(Val(Left(.fields("PurYrMonth"), 4)), Val(Right(.fields("PurYrMonth"), 2)), 1)))
                    Else
                        dtpFromDate.Text = Dtoc(MonthStartDate(DateSerial(Val(Left(.fields("PurYrMonth"), 4)), Val(Right(.fields("PurYrMonth"), 2)), 1)))
                    End If
                    dtpToDate.Text = Dtoc(MonthEndDate(DateSerial(Val(Left(.fields("PurYrMonth"), 4)), Val(Right(.fields("PurYrMonth"), 2)), 1)))
                    optMonthwise.Value = False
                    optDatewise.Value = True
                ElseIf optDatewise.Value = True Then
                    dtpFromDate.Text = Dtoc(.fields("PuhDate"))
                    dtpToDate.Text = Dtoc(.fields("PuhDate"))
                    optDatewise.Value = False
                    optDetailed.Value = True
                ElseIf optPartywise.Value = True Then
                    mQryPrtCode = .fields("PuhPrtCode")
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
            Me.Hide     '''Unload Me
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
Dim tRecset As New ADODB.Recordset, srow As Integer, mPurICode As Long, mPurStkICode As Long, mPurItrCode As Long, mReqdRecdAmt As Double

srow = Mfgrd2.Row
mPurICode = Val(Mfgrd2.TextMatrix(srow, X2PURICODE_COL))
mPurStkICode = Val(Mfgrd2.TextMatrix(srow, X2PURSTKICODE_COL))
mPurItrCode = Val(Mfgrd2.TextMatrix(srow, X2PURITRCODE_COL))

If cmdOK.Caption = "&OK" And dtlEditCanceled = False Then
    Rem updating values in purchase table
    With clsPUR
    If dtlAddMode = True Then
        .ClearDtl
    Else
        .GetDtlData mPurCode, mPurICode
    End If
    .mTrnCode_lng = mPurCode
    .mTrnDtlSno_int = Val(UnMyNumFmt(mskPurSno.Text))
    .mTrnDate_dt = Ctod(dtpPurDate.Text)
    .mTrnCmpCode_int = sFinYrCmpCode
    
    .mPurStkCode_lng = mPurStkCode
    .mPurStkICode_lng = mPurStkICode
    .mPurPrtCode_lng = Val(fcmbPrtName.BoundText)
    .mPurBkmCode_lng = Val(fcmbBkmName.BoundText)
    .mPurNarr_str = txtPurNarr.Text
    .mPurGdmCode_lng = Val(fcmbGdmName.BoundText)
    .mPurSimCode_lng = Val(mskPurSimCode.Text)
    .mPurItmCode_lng = Val(mskPurItmCode.Text)
    .mPurItrCode_lng = Val(mskPurItrCode.Text)
    .mPurItrRefNo_str = txtPurItrRefNo.Text
    .mPurQty_dbl = Val(UnMyNumFmt(mskPurQty.Text))
    .mPurRate_dbl = Val(UnMyNumFmt(mskPurRate.Text))
    .mPurMRP_dbl = Val(UnMyNumFmt(mskPurMRP.Text))
    .mPurSRate_dbl = Val(UnMyNumFmt(mskPurSRate.Text))
    .mPurAmtBefDisc_dbl = Val(UnMyNumFmt(mskPurAmtBefDisc.Text))
    .mPurDiscPer_dbl = Val(UnMyPerFmt(mskPurDiscPer.Text))
    .mPurDiscAmt_dbl = Val(UnMyNumFmt(mskPurDiscAmt.Text))
    .mPurAmtBefTax_dbl = Val(UnMyNumFmt(mskPurAmtBefTax.Text))
    .mPurTaxPer_dbl = Val(UnMyPerFmt(mskPurTaxPer.Text))
    .mPurTaxAmt_dbl = Val(UnMyNumFmt(mskPurTaxAmt.Text))
    .mPurAmount_dbl = Val(UnMyNumFmt(mskPurAmount.Text))
    .mPurRemark_str = ""
    .mPurLICode_lng = 0
    .mPurRICode_lng = 0
    
    If dtlAddMode = True Then
        If .AddNewDtl(mPurCode) = True Then
            mPurICode = .mTrnDtlICode_lng
        End If
    Else
        .UpdateDtl mPurCode, mPurICode
    End If
    End With
    
    Rem updating values in stock table
    With clsSTK
    If dtlAddMode = True Then
        .ClearDtl
    Else
        .GetDtlData mPurStkCode, mPurStkICode
    End If
    .mStkSno_int = Val(UnMyNumFmt(mskPurSno.Text))
    .mStkVtmCode_lng = Val(fcmbVtmName.BoundText)
    .mStkPrefix_str = txtPurPrefix.Text
    .mStkVchNo_lng = Val(UnMyNumFmt(mskPurVchNo.Text))
    .mStkPostfix_str = ""
    .mStkDate_dt = Ctod(dtpPurDate.Text)
    .mStkItmCode_lng = Val(mskPurItmCode.Text)
    .mStkItmRef1Name_str = txtPurItrRefNo.Text
    .mStkItmRef2Name_str = ""
    .mStkQty_dbl = ToRcptQty(Val(UnMyNumFmt(mskPurQty.Text)))
    .mStkRate_dbl = Val(UnMyNumFmt(mskPurRate.Text))
    .mItrPRate_dbl = Val(UnMyNumFmt(mskPurRate.Text))
    .mItrMRP_dbl = Val(UnMyNumFmt(mskPurMRP.Text))
    .mItrSRate_dbl = Val(UnMyNumFmt(mskPurSRate.Text))
    .mStkValue_dbl = Val(UnMyNumFmt(mskPurAmount.Text))
    .mStkNarr_str = ""
    .mStkAutoGen_bln = True
    .mStkCmpCode_int = sFinYrCmpCode
    If dtlAddMode = True Then
        If .AddNewDtl(mPurStkCode, mNewItemRef:=True) = True Then
            mPurStkICode = .mStkICode_lng
            mPurItrCode = .mStkItmRefCode_lng
        End If
    Else
        If Val(fcmbBkmName.BoundText) <> mPurBkmCode_old Or Val(mskPurSimCode.Text) <> mPurSimCode_old Or Val(mskPurItmCode.Text) <> mPurItmCode_old Or txtPurItrRefNo.Text <> mPurItrRefNo_old Then
            .UpdateDtl mPurStkCode, mPurStkICode, mNewItemRef:=True
            mPurItrCode = .mStkItmRefCode_lng
        Else
            .UpdateDtl mPurStkCode, mPurStkICode
        End If
    End If
    End With
    
    Rem updating StkICode in PurchDtl
    With clsPUR
    If mPurICode > 0 And mPurStkICode > 0 And mPurItrCode > 0 Then
        If dtlAddMode = True Then
            .GetDtlData mPurCode, mPurICode
            
            .mPurStkICode_lng = mPurStkICode
            .mPurItrCode_lng = mPurItrCode
            .UpdateDtl mPurCode, mPurICode
        Else
            If Val(fcmbBkmName.BoundText) <> mPurBkmCode_old Or Val(mskPurSimCode.Text) <> mPurSimCode_old Or Val(mskPurItmCode.Text) <> mPurItmCode_old Or txtPurItrRefNo.Text <> mPurItrRefNo_old Then
                .GetDtlData mPurCode, mPurICode
                
                .mPurItrCode_lng = mPurItrCode
                .UpdateDtl mPurCode, mPurICode
            End If
        End If
    End If
    End With
    
    RefreshDatabase dbNcbDatabase
    ChkAnyShortRcExist mPurICode
    ChkAnyMisLinkedIsuExist mPurICode
    
    With tRecset
    .Open "Select * from (PurchDtl" _
        & " inner join BookMast on PurchDtl.PurBkmCode = BookMast.BkmCode)" _
        & " inner join GodownMast on PurchDtl.PurGdmCode = GodownMast.GdmCode" _
        & " where PurCode=" & CStr(mPurCode) & " and PurICode=" & CStr(mPurICode) & "", dbNcbDatabase, adOpenKeyset, adLockOptimistic
    
    Mfgrd2.TextMatrix(srow, X2PURICODE_COL) = .fields("PurICode")
    Mfgrd2.TextMatrix(srow, X2PURSTKICODE_COL) = .fields("PurStkICode")
    Mfgrd2.TextMatrix(srow, X2PURSNO_COL) = ToMyNumFmt(.fields("PurSno"), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2BKMNAME_COL) = .fields("BkmName")
    Mfgrd2.TextMatrix(srow, X2PURITRREFNO_COL) = .fields("PurItrRefNo")
    Mfgrd2.TextMatrix(srow, X2GDMNAME_COL) = .fields("GdmName")
    Mfgrd2.TextMatrix(srow, X2PURQTY_COL) = ToMyNumFmt(.fields("PurQty"), mDecimals:=-1)
    Mfgrd2.TextMatrix(srow, X2PURRATE_COL) = ToMyNumFmt(.fields("PurRate"))
    Mfgrd2.TextMatrix(srow, X2PURMRP_COL) = ToMyNumFmt(.fields("PurMRP"))
    Mfgrd2.TextMatrix(srow, X2PURSRATE_COL) = ToMyNumFmt(.fields("PurSRate"))
    Mfgrd2.TextMatrix(srow, X2PURAMTBEFDISC_COL) = ToMyNumFmt(.fields("PurAmtBefDisc"))
    Mfgrd2.TextMatrix(srow, X2PURDISCPER_COL) = ToMyPerFmt(.fields("PurDiscPer"))
    Mfgrd2.TextMatrix(srow, X2PURDISCAMT_COL) = ToMyNumFmt(.fields("PurDiscAmt"))
    Mfgrd2.TextMatrix(srow, X2PURAMTBEFTAX_COL) = ToMyNumFmt(.fields("PurAmtBefTax"))
    Mfgrd2.TextMatrix(srow, X2PURTAXPER_COL) = ToMyPerFmt(.fields("PurTaxPer"), mDecimals:=-1)
    Mfgrd2.TextMatrix(srow, X2PURTAXAMT_COL) = ToMyNumFmt(.fields("PurTaxAmt"))
    Mfgrd2.TextMatrix(srow, X2PURAMOUNT_COL) = ToMyNumFmt(.fields("PurAmount"))
    Mfgrd2.TextMatrix(srow, X2PURNARR_COL) = .fields("PurNarr")
    Mfgrd2.TextMatrix(srow, X2PURBKMCODE_COL) = .fields("PurBkmCode")
    Mfgrd2.TextMatrix(srow, X2PURGDMCODE_COL) = .fields("PurGdmCode")
    Mfgrd2.TextMatrix(srow, X2PURSIMCODE_COL) = .fields("PurSimCode")
    Mfgrd2.TextMatrix(srow, X2PURITMCODE_COL) = .fields("PurItmCode")
    Mfgrd2.TextMatrix(srow, X2PURITRCODE_COL) = .fields("PurItrCode")
    Mfgrd2.TextMatrix(srow, X2PURRECSTATE_COL) = .fields("PurRecState")
    
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
    txtSearch1Text_InterActiveChange Format(Ctod(dtpPurDate.Text), "yyyymmdd") + Format(mPurCode, cLONGCODESTRFMT)
ElseIf optMonthwise.Value = True Then
    txtSearch1Text_InterActiveChange Format(Ctod(dtpPurDate.Text), "yyyy") & "/" & Format(Ctod(dtpPurDate.Text), "mm")
ElseIf optDatewise.Value = True Then
    txtSearch1Text_InterActiveChange Format(Ctod(dtpPurDate.Text), "yyyymmdd")
ElseIf optPartywise.Value = True Then
    txtSearch1Text_InterActiveChange txtPrtName.Text
End If

Call ShowEntryMode(False)
Mfgrd1.SetFocus

End Sub

Private Sub cmdSaveForm_GotFocus()
Dim mPurAcsPermNo As Integer, mRetryCount As Integer

txtVoid.SetFocus
cmdSaveForm.Enabled = False
If Data_Verify() = True Then
    If CanAccept() = True Then
        If GetAccessPerm(mPurAcsPermNo, mRetryCount, mFormAcsPermFileName) = True And mRetryCount = 0 Then
            If Data_NetwAuth() = True Then
                Call cmdSaveForm_Click
                Close #mPurAcsPermNo
                If mRemoteAccess = True Then
                    Me.Hide     '''Unload Me
                    Exit Sub
                End If
            Else
                Close #mPurAcsPermNo
            End If
        Else
            Close #mPurAcsPermNo
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
If mFormSysVchType = cCOM_VTYPE_OPNSTK Then
    If Ctod(dtpFromDate.Text) <> sCmpBookStartDate - 1 Then
        dtpFromDate.Text = Dtoc(sCmpBookStartDate - 1)
    End If
ElseIf IsFinYrDate(Ctod(dtpFromDate.Text)) = False Then
    ErrorBox "Invalid Date Range !!!"
    dtpFromDate.SetFocus
    Cancel = True
End If

End Sub

Private Sub dtpPurDate_GotFocus()
FlashActiveControl dtpPurDate, True
End Sub

Private Sub dtpPurDate_LostFocus()
FlashActiveControl dtpPurDate, False
End Sub

Private Sub dtpPurDate_Validate(Cancel As Boolean)
dtpPurDate.Text = ToMyDate(dtpPurDate.Text)
If mFormSysVchType = cCOM_VTYPE_OPNSTK Then
    If Ctod(dtpPurDate.Text) <> sCmpBookStartDate - 1 Then
        dtpPurDate.Text = Dtoc(sCmpBookStartDate - 1)
    End If
ElseIf IsFinYrDate(Ctod(dtpPurDate.Text)) = False Then
    ErrorBox "Invalid Input !!!"
    dtpPurDate.SetFocus
    Cancel = True
ElseIf ChkAnyPriorIsuExist() = True Then
    ErrorBox "Invalid Input !!!"
    dtpPurDate.SetFocus
    Cancel = True
    dtpPurDate.Text = Dtoc(mPurDate_old)
End If

End Sub

Private Sub dtpPurTrnRefDt_GotFocus()
FlashActiveControl dtpPurTrnRefDt, True
End Sub

Private Sub dtpPurTrnRefDt_LostFocus()
FlashActiveControl dtpPurTrnRefDt, False
End Sub

Private Sub dtpPurTrnRefDt_Validate(Cancel As Boolean)
dtpPurTrnRefDt.Text = ToMyDate(dtpPurTrnRefDt.Text)

End Sub

Private Sub dtpToDate_GotFocus()
FlashActiveControl dtpToDate, True
End Sub

Private Sub dtpToDate_LostFocus()
FlashActiveControl dtpToDate, False
End Sub

Private Sub dtpToDate_Validate(Cancel As Boolean)
dtpToDate.Text = ToMyDate(dtpToDate.Text)
If mFormSysVchType = cCOM_VTYPE_OPNSTK Then
    If Ctod(dtpToDate.Text) <> sCmpBookStartDate - 1 Then
        dtpToDate.Text = Dtoc(sCmpBookStartDate - 1)
    End If
ElseIf IsFinYrDate(Ctod(dtpToDate.Text)) = False Then
    ErrorBox "Invalid Date Range !!!"
    dtpToDate.SetFocus
    Cancel = True
End If

End Sub

Private Sub Form_Activate()
If mFormLoaded = False Then
    Select Case mFormSysVchType
    Case cCOM_VTYPE_OPNSTK
        lblFormHeading.Caption = "Opening Stock Voucher"
        lblVchType.Caption = "Opn.Type"
        lblFormHeading.BackColor = RGB(50, 244, 255)
    Case cCOM_VTYPE_PURCHASE
        lblFormHeading.Caption = "Purchase Voucher"
        lblVchType.Caption = "Purch.Type"
        lblFormHeading.BackColor = RGB(1, 255, 255)
    Case cCOM_VTYPE_RETNINW
        lblFormHeading.Caption = "Sales Return Voucher"
        lblVchType.Caption = "SRet.Type"
        lblFormHeading.BackColor = RGB(100, 255, 255)
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
        If mPurCode = 0 Then
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

mFormUIdFileName = "PurchDtl.Uid"
mFormAcsPermFileName = "PurchDtl.Acp"
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

Set clsPUR = New clsNcbMultiTranEntry
Set clsPUR.dbAcDatabase = dbAcDatabase
Set clsPUR.dbStDatabase = dbStDatabase
Set clsPUR.dbNcbDatabase = dbNcbDatabase
Set clsPUR.dbComDatabase = dbComDatabase
clsPUR.blnPurchTran = True
clsPUR.Init

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
    datRecset.Open "Select * from PurchHdr" _
        & " inner join PartyMast on PurchHdr.PuhPrtCode = PartyMast.PrtCode" _
        & " where PuhCode=" & CStr(mPurCode) _
        & " and PuhVtmCode in (" & mFormVchTypeList & ")" _
        & " order by PuhDate,PuhTime", dbNcbDatabase, adOpenKeyset, adLockOptimistic
Else
    datRecset.Open "Select * from PurchHdr" _
        & " inner join PartyMast on PurchHdr.PuhPrtCode = PartyMast.PrtCode" _
        & " where PuhVtmCode in (" & mFormVchTypeList & ")" _
        & " order by PuhDate,PuhTime", dbNcbDatabase, adOpenKeyset, adLockOptimistic
End If
Mfgrd1.FixedCols = 0
Call SmryList

Mfgrd2.FixedRows = 1: Mfgrd2.FixedCols = 0: Mfgrd2.Rows = 2: Mfgrd2.Cols = MFGRD2_COLS: SetGridAutoHeight Mfgrd2

colcnt = X2PURICODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2PURICODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2PURSNO_COL: Mfgrd2.ColWidth(colcnt) = mskPurSno.Width: Mfgrd2.TextMatrix(0, colcnt) = "Sno": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BKMNAME_COL: Mfgrd2.ColWidth(colcnt) = txtBkmName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Book Name": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2PURITRREFNO_COL: Mfgrd2.ColWidth(colcnt) = txtPurItrRefNo.Width: Mfgrd2.TextMatrix(0, colcnt) = "Ref.No": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2GDMNAME_COL: Mfgrd2.ColWidth(colcnt) = txtGdmName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Location": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2PURQTY_COL: Mfgrd2.ColWidth(colcnt) = mskPurQty.Width: Mfgrd2.TextMatrix(0, colcnt) = "Unit": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2PURRATE_COL: Mfgrd2.ColWidth(colcnt) = mskPurRate.Width: Mfgrd2.TextMatrix(0, colcnt) = "Rate": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2PURMRP_COL: Mfgrd2.ColWidth(colcnt) = mskPurMRP.Width: Mfgrd2.TextMatrix(0, colcnt) = "MRP": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2PURSRATE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "S.Rate": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2PURAMTBEFDISC_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2PURAMTBEFDISC_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2PURDISCPER_COL: Mfgrd2.ColWidth(colcnt) = mskPurDiscPer.Width: Mfgrd2.TextMatrix(0, colcnt) = "Disc%": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2PURDISCAMT_COL: Mfgrd2.ColWidth(colcnt) = mskPurDiscAmt.Width: Mfgrd2.TextMatrix(0, colcnt) = "Disc.Amt": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2PURAMTBEFTAX_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2PURAMTBEFTAX_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2PURTAXPER_COL: Mfgrd2.ColWidth(colcnt) = mskPurTaxPer.Width: Mfgrd2.TextMatrix(0, colcnt) = "Tax%": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2PURTAXAMT_COL: Mfgrd2.ColWidth(colcnt) = mskPurTaxAmt.Width: Mfgrd2.TextMatrix(0, colcnt) = "Tax.Amt": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2PURAMOUNT_COL: Mfgrd2.ColWidth(colcnt) = mskPurAmount.Width: Mfgrd2.TextMatrix(0, colcnt) = "Amount": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2PURNARR_COL: Mfgrd2.ColWidth(colcnt) = txtPurNarr.Width: Mfgrd2.TextMatrix(0, colcnt) = "Description": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2PURBKMCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2PURBKMCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2PURSIMCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2PURSIMCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2PURGDMCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2PURGDMCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2PURITMCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2PURITMCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2PURITRCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2PURITRCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2PURSTKICODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2PURSTKICODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2PURRECSTATE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2PURRECSTATE_COL": Mfgrd2.ColAlignment(colcnt) = 7
' -----------------
colcnt = X2PURSNO_COL: mskPurSno.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2BKMNAME_COL: txtBkmName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2PURITRREFNO_COL: txtPurItrRefNo.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2GDMNAME_COL: txtGdmName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2PURQTY_COL: mskPurQty.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2PURRATE_COL: mskPurRate.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2PURMRP_COL: mskPurMRP.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
Rem colcnt = X2PURSRATE_COL: mskPurSRate.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2PURDISCPER_COL: mskPurDiscPer.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2PURDISCAMT_COL: mskPurDiscAmt.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2PURTAXPER_COL: mskPurTaxPer.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2PURTAXAMT_COL: mskPurTaxAmt.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2PURAMOUNT_COL: mskPurAmount.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
txtPurNarr.Left = txtBkmName.Left
cmdOK.Left = mskPurAmount.Left + mskPurAmount.Width - cmdOK.Width
' --------------------------------------
lblPurQtyTot.Left = mskPurQty.Left - frFooter.Left: lblPurQtyTot.Width = mskPurQty.Width
lblPurTaxAmtTot.Left = mskPurTaxAmt.Left - frFooter.Left: lblPurTaxAmtTot.Width = mskPurTaxAmt.Width
lblPurAmtBefDiscTot.Left = mskPurAmount.Left - frFooter.Left: lblPurAmtBefDiscTot.Width = mskPurAmount.Width
mskPuhDiscPer.Left = lblPurTaxAmtTot.Left: mskPuhDiscPer.Width = lblPurTaxAmtTot.Width
mskPuhDiscAmt.Left = lblPurAmtBefDiscTot.Left: mskPuhDiscAmt.Width = lblPurAmtBefDiscTot.Width
mskPuhTaxPer.Left = lblPurTaxAmtTot.Left: mskPuhTaxPer.Width = lblPurTaxAmtTot.Width
mskPuhTaxAmt.Left = lblPurAmtBefDiscTot.Left: mskPuhTaxAmt.Width = lblPurAmtBefDiscTot.Width
mskPuhOtherAmt.Left = lblPurAmtBefDiscTot.Left: mskPuhOtherAmt.Width = lblPurAmtBefDiscTot.Width
mskPuhROffAmt.Left = lblPurAmtBefDiscTot.Left: mskPuhROffAmt.Width = lblPurAmtBefDiscTot.Width
lblPuhAmount.Left = lblPurAmtBefDiscTot.Left: lblPuhAmount.Width = lblPurAmtBefDiscTot.Width

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
Set clsPUR = Nothing
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
Dim mOpgVchNo As Long, mPurVchNo As Long
Dim mPurAmountTot As Double

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
Rem purchase validations
mPurVchNo = Val(UnMyNumFmt(mskPurVchNo.Text))
If mPurVchNo > 0 Then
    If mPurVchNo <> mPurVchNo_old Or Val(fcmbVtmName.BoundText) <> mPurVtmCode_old Or Ctod(dtpPurDate.Text) <> mPurDate_old Or FormAddEditMode = cFORM_ADDMODE Then
        If ChkIsDuplVTypeNo(dbNcbDatabase, dbAcDatabase, mTableName:="PurchHdr", mChkFieldName:="PuhVchNo", mChkFieldValue:=mPurVchNo, mKeyFieldName:="PuhCode", mKeyFieldValue:=mPurCode, mVtmFieldName:="PuhVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="PuhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="PuhDate", mDateFieldValue:=Ctod(dtpPurDate.Text)) = True Then
            ErrorBox "Duplicate Voucher No. !!!"
            mskPurVchNo.SetFocus
            ' ---------------
            If FormAddEditMode = cFORM_ADDMODE Then
                mPurVchNo = GetNextVTypeNo(dbNcbDatabase, dbAcDatabase, dbComDatabase, mTableName:="PurchHdr", mFieldName:="PuhVchNo", mVtmFieldName:="PuhVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="PuhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="PuhDate", mDateFieldValue:=Ctod(dtpPurDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
            Else
                mPurVchNo = mPurVchNo_old
            End If
            mskPurVchNo.Text = ToMyNumFmt(mPurVchNo, mDecimals:=0)
            GoTo EndSub
        End If
    End If
Else
    ErrorBox "Invalid Input !!!"
    mskPurVchNo.SetFocus
    GoTo EndSub
End If
If IsDate(dtpPurDate.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpPurDate.SetFocus
    GoTo EndSub
ElseIf mFormSysVchType = cCOM_VTYPE_OPNSTK Then
    If Ctod(dtpPurDate.Text) <> sCmpBookStartDate - 1 Then
        dtpPurDate.Text = Dtoc(sCmpBookStartDate - 1)
    End If
ElseIf IsFinYrDate(Ctod(dtpPurDate.Text)) = False Then
    ErrorBox "Invalid Input !!!"
    dtpPurDate.SetFocus
    GoTo EndSub
ElseIf ChkAnyPriorIsuExist() = True Then
    ErrorBox "Invalid Input !!!"
    dtpPurDate.SetFocus
    dtpPurDate.Text = Dtoc(mPurDate_old)
    GoTo EndSub
End If
If TimeToMin(txtPurTime_str.Text) > cDAYMINUTES Then
    ErrorBox "Invalid Input !!!"
    txtPurTime_str.SetFocus
    GoTo EndSub
End If
If mFormSysVchType = cCOM_VTYPE_PURCHASE Then
    If txtPurTrnRefNo.Text = "" Then
        ErrorBox "Invalid Input !!!"
        txtPurTrnRefNo.SetFocus
        GoTo EndSub
    End If
End If
If IsDate(dtpPurTrnRefDt.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpPurTrnRefDt.SetFocus
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
Dim mPurVchNo As Long
Data_NetwAuth = False

mPurVchNo = Val(UnMyNumFmt(mskPurVchNo.Text))
If mPurVchNo <> mPurVchNo_old Or Val(fcmbVtmName.BoundText) <> mPurVtmCode_old Or Ctod(dtpPurDate.Text) <> mPurDate_old Or FormAddEditMode = cFORM_ADDMODE Then
    If ChkIsDuplVTypeNo(dbNcbDatabase, dbAcDatabase, mTableName:="PurchHdr", mChkFieldName:="PuhVchNo", mChkFieldValue:=mPurVchNo, mKeyFieldName:="PuhCode", mKeyFieldValue:=mPurCode, mVtmFieldName:="PuhVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="PuhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="PuhDate", mDateFieldValue:=Ctod(dtpPurDate.Text)) = True Then
        ErrorBox "Duplicate Voucher No. !!!"
        mskPurVchNo.SetFocus
        ' ---------------
        If FormAddEditMode = True Then
            mPurVchNo = GetNextVTypeNo(dbNcbDatabase, dbAcDatabase, dbComDatabase, mTableName:="PurchHdr", mFieldName:="PuhVchNo", mVtmFieldName:="PuhVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="PuhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="PuhDate", mDateFieldValue:=Ctod(dtpPurDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
        Else
            mPurVchNo = mPurVchNo_old
        End If
        mskPurVchNo.Text = ToMyNumFmt(mPurVchNo, mDecimals:=0)
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
Dim srow As Integer, mPurICode As Long, mPurStkICode As Long, mDeleteit As Boolean

srow = Mfgrd2.Row
mPurICode = Val(Mfgrd2.TextMatrix(srow, X2PURICODE_COL))
mPurStkICode = Val(Mfgrd2.TextMatrix(srow, X2PURSTKICODE_COL))

If MyDeleteKey(Shift, KeyCode, mCheckCtrlMask:=False) = True And mPurICode > 0 Then
    txtVoid.SetFocus
    If clsPUR.CanDeleteDtl(mPurCode, mPurICode) = True Then
        clsPUR.DeleteDtl mPurCode, mPurICode
        clsSTK.DeleteDtl mPurStkCode, mPurStkICode
        
        ShowDtlData mPurCode
        Mfgrd2.Row = srow
        Mfgrd2.SetFocus
        Call Mfgrd2_RowColChange
    Else
        Mfgrd2.SetFocus
    End If
End If

End Sub

Private Sub Mfgrd2_KeyPress(KeyAscii As Integer)
Dim srow As Integer, ary1 As Variant

If KeyAscii = vbKeyReturn Then
    srow = Mfgrd2.Row
    
    dtlAddEditMode = True
    dtlAddMode = IsFlexNewRow(Mfgrd2, srow)
    VisibleControls True, Mfgrd2.Top + Mfgrd2.RowPos(Mfgrd2.Row)
    If dtlAddMode = True Then
        mskPurSno.Text = ToMyNumFmt(FlexNextSeqno(Mfgrd2, X2PURSNO_COL), mDecimals:=0)
        mskPurQty.Text = ToMyNumFmt(1, mDecimals:=-1)
        ary1 = Split(txtPrtName.Text, Space(1))
        txtPurItrRefNo.Text = Left(ary1(0) & "/" & Format(Ctod(dtpPurDate.Text), "yymmdd") & "/" & txtPurTrnRefNo.Text, 25)
        Erase ary1
    Else
        mskPurICode.Text = Val(Mfgrd2.TextMatrix(srow, X2PURICODE_COL))
        mskPurStkICode.Text = Val(Mfgrd2.TextMatrix(srow, X2PURSTKICODE_COL))
        mskPurSno.Text = Mfgrd2.TextMatrix(srow, X2PURSNO_COL)
        fcmbBkmName.BoundText = Mfgrd2.TextMatrix(srow, X2PURBKMCODE_COL): txtBkmName.Text = fcmbBkmName.Text
        txtPurNarr.Text = Mfgrd2.TextMatrix(srow, X2PURNARR_COL)
        mskPurSimCode.Text = Val(Mfgrd2.TextMatrix(srow, X2PURSIMCODE_COL))
        mskPurItmCode.Text = Val(Mfgrd2.TextMatrix(srow, X2PURITMCODE_COL))
        mskPurItrCode.Text = Val(Mfgrd2.TextMatrix(srow, X2PURITRCODE_COL))
        txtPurItrRefNo.Text = Mfgrd2.TextMatrix(srow, X2PURITRREFNO_COL)
        fcmbGdmName.BoundText = Mfgrd2.TextMatrix(srow, X2PURGDMCODE_COL): txtGdmName.Text = fcmbGdmName.Text
        mskPurQty.Text = Mfgrd2.TextMatrix(srow, X2PURQTY_COL)
        mskPurRate.Text = Mfgrd2.TextMatrix(srow, X2PURRATE_COL)
        mskPurMRP.Text = Mfgrd2.TextMatrix(srow, X2PURMRP_COL)
        mskPurSRate.Text = Mfgrd2.TextMatrix(srow, X2PURSRATE_COL)
        mskPurAmtBefDisc.Text = Mfgrd2.TextMatrix(srow, X2PURAMTBEFDISC_COL)
        mskPurDiscPer.Text = Mfgrd2.TextMatrix(srow, X2PURDISCPER_COL)
        mskPurDiscAmt.Text = Mfgrd2.TextMatrix(srow, X2PURDISCAMT_COL)
        mskPurAmtBefTax.Text = Mfgrd2.TextMatrix(srow, X2PURAMTBEFTAX_COL)
        mskPurTaxPer.Text = Mfgrd2.TextMatrix(srow, X2PURTAXPER_COL)
        mskPurTaxAmt.Text = Mfgrd2.TextMatrix(srow, X2PURTAXAMT_COL)
        mskPurAmount.Text = Mfgrd2.TextMatrix(srow, X2PURAMOUNT_COL)
    End If
    txtBkmName.SetFocus
    Call ValidDtl
    
    mPurBkmCode_old = Val(fcmbBkmName.BoundText)
    mPurGdmCode_old = Val(fcmbGdmName.BoundText)
    mPurSimCode_old = Val(mskPurSimCode.Text)
    mPurItmCode_old = Val(mskPurItmCode.Text)
    mPurItrCode_old = Val(mskPurItrCode.Text)
    mPurItrRefNo_old = txtPurItrRefNo.Text
    mPurAmtBefDisc_old = Val(UnMyNumFmt(mskPurAmtBefDisc.Text))
    mPurDiscPer_old = Val(UnMyPerFmt(mskPurDiscPer.Text))
    mPurAmtBefTax_old = Val(UnMyNumFmt(mskPurAmtBefTax.Text))
    mPurTaxPer_old = Val(UnMyPerFmt(mskPurTaxPer.Text))
End If

End Sub

Private Sub Mfgrd2_RowColChange()
ShowActiveFlexRow Mfgrd2
End Sub

Private Sub mskPuhDiscAmt_GotFocus()
FlashActiveControl mskPuhDiscAmt, True
End Sub

Private Sub mskPuhDiscAmt_LostFocus()
FlashActiveControl mskPuhDiscAmt, False
End Sub

Private Sub mskPuhDiscAmt_Validate(Cancel As Boolean)
mskPuhDiscAmt.Text = ToMyNumFmt(mskPuhDiscAmt.Text)
Call CalcFtrTotal
End Sub

Private Sub mskPuhDiscPer_GotFocus()
FlashActiveControl mskPuhDiscPer, True
End Sub

Private Sub mskPuhDiscPer_LostFocus()
FlashActiveControl mskPuhDiscPer, False
End Sub

Private Sub mskPuhDiscPer_Validate(Cancel As Boolean)
mskPuhDiscPer.Text = ToMyPerFmt(mskPuhDiscPer.Text, mUseAbs:=True)
Call CalcFtrTotal
End Sub

Private Sub mskPuhOtherAmt_GotFocus()
FlashActiveControl mskPuhOtherAmt, True
End Sub

Private Sub mskPuhOtherAmt_LostFocus()
FlashActiveControl mskPuhOtherAmt, False
End Sub

Private Sub mskPuhOtherAmt_Validate(Cancel As Boolean)
mskPuhOtherAmt.Text = ToMyNumFmt(mskPuhOtherAmt.Text, mUseAbs:=True)
Call CalcFtrTotal

End Sub

Private Sub mskPuhROffAmt_GotFocus()
FlashActiveControl mskPuhROffAmt, True
End Sub

Private Sub mskPuhROffAmt_LostFocus()
FlashActiveControl mskPuhROffAmt, False
End Sub

Private Sub mskPuhROffAmt_Validate(Cancel As Boolean)
mskPuhROffAmt.Text = ToMyNumFmt(mskPuhROffAmt.Text)
Call CalcFtrTotal

End Sub

Private Sub mskPuhTaxAmt_GotFocus()
FlashActiveControl mskPuhTaxAmt, True
End Sub

Private Sub mskPuhTaxAmt_LostFocus()
FlashActiveControl mskPuhTaxAmt, False
End Sub

Private Sub mskPuhTaxAmt_Validate(Cancel As Boolean)
mskPuhTaxAmt.Text = ToMyNumFmt(mskPuhTaxAmt.Text, mUseAbs:=True)
Call CalcFtrTotal

End Sub

Private Sub mskPuhTaxPer_GotFocus()
FlashActiveControl mskPuhTaxPer, True
End Sub

Private Sub mskPuhTaxPer_LostFocus()
FlashActiveControl mskPuhTaxPer, False
End Sub

Private Sub mskPuhTaxPer_Validate(Cancel As Boolean)
mskPuhTaxPer.Text = ToMyPerFmt(mskPuhTaxPer.Text, mDecimals:=-1, mUseAbs:=True)
Call CalcFtrTotal
End Sub

Private Sub mskPurAmount_GotFocus()
FlashActiveControl mskPurAmount, True
End Sub

Private Sub mskPurAmount_LostFocus()
FlashActiveControl mskPurAmount, False
End Sub

Private Sub mskPurAmount_Validate(Cancel As Boolean)
mskPurAmount.Text = ToMyNumFmt(mskPurAmount.Text, mUseAbs:=True)
Call ValidDtl

End Sub

Private Sub mskPurDiscAmt_GotFocus()
FlashActiveControl mskPurDiscAmt, True
End Sub

Private Sub mskPurDiscAmt_LostFocus()
FlashActiveControl mskPurDiscAmt, False
End Sub

Private Sub mskPurDiscAmt_Validate(Cancel As Boolean)
mskPurDiscAmt.Text = ToMyNumFmt(mskPurDiscAmt.Text, mUseAbs:=True)
Call CalcPurChg
Call ValidDtl

End Sub

Private Sub mskPurDiscPer_GotFocus()
FlashActiveControl mskPurDiscPer, True
End Sub

Private Sub mskPurDiscPer_LostFocus()
FlashActiveControl mskPurDiscPer, False
End Sub

Private Sub mskPurDiscPer_Validate(Cancel As Boolean)
mskPurDiscPer.Text = ToMyPerFmt(mskPurDiscPer.Text, mUseAbs:=True)
Call CalcPurChg
Call ValidDtl

End Sub

Private Sub mskPurMRP_GotFocus()
FlashActiveControl mskPurMRP, True
End Sub

Private Sub mskPurMRP_LostFocus()
FlashActiveControl mskPurMRP, False
End Sub

Private Sub mskPurMRP_Validate(Cancel As Boolean)
mskPurMRP.Text = ToMyNumFmt(mskPurMRP.Text, mUseAbs:=True)

If FormAddEditMode = cFORM_ADDMODE Or dtlAddMode = True Or Val(UnMyNumFmt(mskPurSRate.Text)) = 0 Then
    mskPurSRate.Text = mskPurMRP.Text
End If
Call CalcPurChg
Call ValidDtl

End Sub

Private Sub mskPurRate_GotFocus()
FlashActiveControl mskPurRate, True
End Sub

Private Sub mskPurRate_LostFocus()
FlashActiveControl mskPurRate, False
End Sub

Private Sub mskPurRate_Validate(Cancel As Boolean)
mskPurRate.Text = ToMyNumFmt(mskPurRate.Text, mUseAbs:=True)
Call CalcPurChg
Call ValidDtl

End Sub

Private Sub mskPurQty_GotFocus()
FlashActiveControl mskPurQty, True
End Sub

Private Sub mskPurQty_LostFocus()
FlashActiveControl mskPurQty, False
End Sub

Private Sub mskPurQty_Validate(Cancel As Boolean)
mskPurQty.Text = ToMyNumFmt(mskPurQty.Text, mDecimals:=-1, mUseAbs:=True)
Call CalcPurChg
Call ValidDtl

End Sub

Private Sub mskPurSRate_GotFocus()
FlashActiveControl mskPurSRate, True
End Sub

Private Sub mskPurSRate_LostFocus()
FlashActiveControl mskPurSRate, False
End Sub

Private Sub mskPurSRate_Validate(Cancel As Boolean)
mskPurSRate.Text = ToMyNumFmt(mskPurSRate.Text, mUseAbs:=True)
If Val(UnMyNumFmt(mskPurSRate.Text)) = 0 Then
    mskPurSRate.Text = mskPurMRP.Text
End If
Call CalcPurChg
Call ValidDtl

End Sub

Private Sub mskPurTaxAmt_GotFocus()
FlashActiveControl mskPurTaxAmt, True
End Sub

Private Sub mskPurTaxAmt_LostFocus()
FlashActiveControl mskPurTaxAmt, False
End Sub

Private Sub mskPurTaxAmt_Validate(Cancel As Boolean)
mskPurTaxAmt.Text = ToMyNumFmt(mskPurTaxAmt.Text, mUseAbs:=True)
Call CalcPurChg
Call ValidDtl

End Sub

Private Sub mskPurTaxPer_GotFocus()
FlashActiveControl mskPurTaxPer, True
End Sub

Private Sub mskPurTaxPer_LostFocus()
FlashActiveControl mskPurTaxPer, False
End Sub

Private Sub mskPurTaxPer_Validate(Cancel As Boolean)
mskPurTaxPer.Text = ToMyPerFmt(mskPurTaxPer.Text, mDecimals:=-1, mUseAbs:=True)
Call CalcPurChg
Call ValidDtl

End Sub

Private Sub mskPurVchNo_GotFocus()
FlashActiveControl mskPurVchNo, True
End Sub

Private Sub mskPurVchNo_LostFocus()
FlashActiveControl mskPurVchNo, False
End Sub

Private Sub mskPurVchNo_Validate(Cancel As Boolean)
Dim mPurVchNo As Long
mPurVchNo = Val(UnMyNumFmt(mskPurVchNo.Text))
If mPurVchNo < 0 Then
    mPurVchNo = GetNextVTypeNo(dbNcbDatabase, dbAcDatabase, dbComDatabase, mTableName:="PurchHdr", mFieldName:="PuhVchNo", mVtmFieldName:="PuhVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="PuhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="PuhDate", mDateFieldValue:=Ctod(dtpPurDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
    mskPurVchNo.Text = ToMyNumFmt(mPurVchNo, mDecimals:=0)
ElseIf mPurVchNo > 0 Then
    If mPurVchNo <> mPurVchNo_old Or Val(fcmbVtmName.BoundText) <> mPurVtmCode_old Or Ctod(dtpPurDate.Text) <> mPurDate_old Or FormAddEditMode = cFORM_ADDMODE Then
        If ChkIsDuplVTypeNo(dbNcbDatabase, dbAcDatabase, mTableName:="PurchHdr", mChkFieldName:="PuhVchNo", mChkFieldValue:=mPurVchNo, mKeyFieldName:="PuhCode", mKeyFieldValue:=mPurCode, mVtmFieldName:="PuhVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="PuhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="PuhDate", mDateFieldValue:=Ctod(dtpPurDate.Text)) = True Then
            ErrorBox "Duplicate Voucher No. !!!"
            Cancel = True
            mskPurVchNo.SetFocus
            ' ----------
            If FormAddEditMode = cFORM_ADDMODE Then
                mPurVchNo = GetNextVTypeNo(dbNcbDatabase, dbAcDatabase, dbComDatabase, mTableName:="PurchHdr", mFieldName:="PuhVchNo", mVtmFieldName:="PuhVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="PuhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="PuhDate", mDateFieldValue:=Ctod(dtpPurDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
            Else
                mPurVchNo = mPurVchNo_old
            End If
            mskPurVchNo.Text = ToMyNumFmt(mPurVchNo, mDecimals:=0)
        End If
    End If
    If Cancel = False Then
        mskPurVchNo.Text = ToMyNumFmt(mPurVchNo, mDecimals:=0)
    End If
Else
    ErrorBox "Invalid Input !!!"
    mskPurVchNo.SetFocus
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
            SendKeys "{tab}"
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
If Val(fcmbGdmName.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    txtGdmName.SetFocus
    Cancel = True
End If
Call ValidDtl

End Sub

Private Sub txtPurNarr_GotFocus()
FlashActiveControl txtPurNarr, True
End Sub

Private Sub txtPurNarr_LostFocus()
FlashActiveControl txtPurNarr, False
End Sub

Private Sub txtPurNarr_Validate(Cancel As Boolean)
txtPurNarr.Text = ToMyWord(txtPurNarr.Text, mFilterStr:=False)
End Sub

Private Sub txtPurItrRefNo_GotFocus()
FlashActiveControl txtPurItrRefNo, True
End Sub

Private Sub txtPurItrRefNo_LostFocus()
FlashActiveControl txtPurItrRefNo, False
End Sub

Private Sub txtPurItrRefNo_Validate(Cancel As Boolean)
If Trim(txtPurItrRefNo.Text) = "" Then
    ErrorBox "Invalid Input !!!"
    txtPurItrRefNo.SetFocus
    Cancel = True
ElseIf dtlAddMode = False And txtPurItrRefNo.Text <> mPurItrRefNo_old Then
    AlertBox "Item Reference No. Changed !!!"
End If
Call ValidDtl

End Sub

Private Sub txtPurTrnRefNo_GotFocus()
FlashActiveControl txtPurTrnRefNo, True
End Sub

Private Sub txtPurTrnRefNo_LostFocus()
FlashActiveControl txtPurTrnRefNo, False
End Sub

Private Sub txtPurTrnRefNo_Validate(Cancel As Boolean)
If mFormSysVchType = cCOM_VTYPE_PURCHASE Then
    If txtPurTrnRefNo.Text = "" Then
        ErrorBox "Invalid Input !!!"
        txtPurTrnRefNo.SetFocus
        Cancel = True
    End If
End If

End Sub

Private Sub txtPuhRemark_GotFocus()
FlashActiveControl txtPuhRemark, True
End Sub

Private Sub txtPuhRemark_LostFocus()
FlashActiveControl txtPuhRemark, False
End Sub

Private Sub txtPuhRemark_Validate(Cancel As Boolean)
txtPuhRemark.Text = ToMyWord(txtPuhRemark.Text, mFilterStr:=False)
End Sub

Private Sub txtPurTime_str_GotFocus()
FlashActiveControl txtPurTime_str, True
End Sub

Private Sub txtPurTime_str_LostFocus()
FlashActiveControl txtPurTime_str, False
End Sub

Private Sub txtPurTime_str_Validate(Cancel As Boolean)
txtPurTime_str.Text = MinToTime(TimeToMin(txtPurTime_str.Text))
If TimeToMin(txtPurTime_str.Text) > cDAYMINUTES Then
    ErrorBox "Invalid Input !!!"
    txtPurTime_str.SetFocus
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
    Rem Call ShowOldOpgListByOpgNo show here all purchase details
End If

End Sub

Private Sub txtVtmName_LostFocus()
FlashActiveControl txtVtmName, False
End Sub

Private Sub txtVtmName_Validate(Cancel As Boolean)
Dim mPurVchNo As Long

If Val(fcmbVtmName.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    txtVtmName.SetFocus
    Cancel = True
Else
    If Val(fcmbVtmName.BoundText) <> mPurVtmCode_old Or Ctod(dtpPurDate.Text) <> mPurDate_old Or FormAddEditMode = cFORM_ADDMODE Then
        mPurVchNo = GetNextVTypeNo(dbNcbDatabase, dbAcDatabase, dbComDatabase, mTableName:="PurchHdr", mFieldName:="PuhVchNo", mVtmFieldName:="PuhVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="PuhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="PuhDate", mDateFieldValue:=Ctod(dtpPurDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
        mskPurVchNo.Text = ToMyNumFmt(mPurVchNo, mDecimals:=0)
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
    
    fcmbPrtName.BoundText = CStr(mPurPrtCode_old)
    txtPrtName.Text = fcmbPrtName.Text
Else
    ShowPartyData Val(fcmbPrtName.BoundText)
End If

End Sub

Private Sub ShowPartyData(ByVal mPurPrtCode As Long)
Dim tRecset As New ADODB.Recordset

txtPrtAddr.Text = ""
txtAraName.Text = ""
txtStnName.Text = ""
txtPrtTelNo.Text = ""
txtPrtSMSNo.Text = ""

With tRecset
.Open "Select * from (PartyMast prt inner join AreaMast ara on prt.PrtAraCode=ara.AraCode) inner join StsnMast stn on prt.PrtStnCode=stn.StnCode where prt.PrtCode=" & CStr(mPurPrtCode) & "", dbComDatabase, adOpenKeyset, adLockOptimistic
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
If clsPUR.BeginTran(0) = False Then
    Exit Sub
ElseIf clsSTK.BeginStock(0) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_ADDMODE

clsPUR.ClearHdr: clsPUR.ClearDtl
clsSTK.ClearHdr

mPurCode = clsPUR.ActiveTrnCode
mPurStkCode = clsSTK.ActiveStkCode

ShowPurData mPurCode
ShowStkData mPurStkCode

Rem restoring user editing features
Call ShowPurDefData

Rem old values
Call StorePurOldData
Call StoreStkOldData

Call ShowEntryMode(True)
txtPrtName.SetFocus

End Sub

Private Sub Data_EditEvent()

If clsPUR.BeginTran(datRecset.fields("PuhCode")) = False Then
    Exit Sub
ElseIf clsSTK.BeginStock(datRecset.fields("PuhStkCode")) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_EDITMODE

With datRecset
mPurCode = .fields("PuhCode")
mPurStkCode = .fields("PuhStkCode")

End With

ShowPurData mPurCode
ShowStkData mPurStkCode

Rem old values
Call StorePurOldData
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

Private Sub ShowPurData(ByVal mPurCode As Long)
With clsPUR
.GetHdrData mPurCode

mskFormBoundField.Text = mPurCode
fcmbPrtName.BoundText = CStr(.mPuhPrtCode_lng): txtPrtName.Text = fcmbPrtName.Text
fcmbVtmName.BoundText = CStr(.mTrnVtmCode_lng): txtVtmName.Text = fcmbVtmName.Text
txtPurPrefix.Text = .mTrnPrefix_str
mskPurVchNo.Text = ToMyNumFmt(.mTrnVchNo_lng, mDecimals:=0)
dtpPurDate.Text = Dtoc(.mTrnDate_dt)
txtPurTime_str.Text = MinToTime(.mPuhTime_lng)
txtPurTrnRefNo.Text = .mPuhTrnRefNo_str
dtpPurTrnRefDt.Text = Dtoc(.mPuhTrnRefDt_dt)
mskPuhDiscPer.Text = ToMyPerFmt(.mPuhDiscPer_dbl)
mskPuhDiscAmt.Text = ToMyNumFmt(.mPuhDiscAmt_dbl)
mskPuhTaxPer.Text = ToMyPerFmt(.mPuhTaxPer_dbl, mDecimals:=-1)
mskPuhTaxAmt.Text = ToMyNumFmt(.mPuhTaxAmt_dbl)
mskPuhOtherAmt.Text = ToMyNumFmt(.mPuhOtherAmt_dbl)
mskPuhROffAmt.Text = ToMyNumFmt(.mPuhROffAmt_dbl)
lblPuhAmount.Caption = ToMyNumFmt(.mPuhAmount_dbl)
txtPuhRemark.Text = .mPuhRemark_str

ShowPartyData .mPuhPrtCode_lng
Call ShowOldPurCodeDesc
End With

ShowDtlData mPurCode
Call ShowLinkTranDtl

End Sub

Private Sub ShowStkData(ByVal mPurStkCode As Long)
mskPurStkCode.Text = mPurStkCode

End Sub

Private Sub ShowPurDefData()
Dim tRecset As New ADODB.Recordset, t1Recset As New ADODB.Recordset, mPurVchNo As Long

With tRecset
.Open "Select top 1 * from PurchHdr where PuhVtmCode IN (" & mFormVchTypeList & ") and PuhCmpCode = " & CStr(sFinYrCmpCode) & " order by PuhCode desc", dbNcbDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    dtpPurDate.Text = Dtoc(.fields("PuhDate"))
    fcmbVtmName.BoundText = CStr(.fields("PuhVtmCode"))
Else
    dtpPurDate.Text = Dtoc(DefaultEntryDate)
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

If mFormSysVchType = cCOM_VTYPE_OPNSTK Then
    If Ctod(dtpPurDate.Text) <> sCmpBookStartDate - 1 Then
        dtpPurDate.Text = Dtoc(sCmpBookStartDate - 1)
    End If
End If

txtVtmName.Text = fcmbVtmName.Text
txtPurTime_str.Text = MinToTime(TimeToMin(DateTime.Time$))

mPurVchNo = GetNextVTypeNo(dbNcbDatabase, dbAcDatabase, dbComDatabase, mTableName:="PurchHdr", mFieldName:="PuhVchNo", mVtmFieldName:="PuhVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="PuhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="PuhDate", mDateFieldValue:=Ctod(dtpPurDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
mskPurVchNo.Text = ToMyNumFmt(mPurVchNo, mDecimals:=0)
dtpPurTrnRefDt.Text = dtpPurDate.Text

End Sub

Private Sub StorePurOldData()
mPurCode_old = mPurCode
mPurPrtCode_old = Val(fcmbPrtName.BoundText)
mPurDate_old = Ctod(dtpPurDate.Text)
mPurTime_old = TimeToMin(txtPurTime_str.Text)
mPurVtmCode_old = Val(fcmbVtmName.BoundText)
mPurVchNo_old = Val(UnMyNumFmt(mskPurVchNo.Text))
mPuhAmount_old = Val(UnMyNumFmt(lblPuhAmount.Caption))

End Sub

Private Sub StoreStkOldData()
mPurStkCode_old = mPurStkCode

End Sub

Private Sub ShowDtlData(ByVal mPurCode As Long)
Dim srow As Integer, tRecset As New ADODB.Recordset, mColCnt As Integer

srow = 1
Mfgrd2.Rows = 2

With tRecset
.Open "Select * from (PurchDtl" _
    & " inner join BookMast on PurchDtl.PurBkmCode = BookMast.BkmCode)" _
    & " inner join GodownMast on PurchDtl.PurGdmCode = GodownMast.GdmCode" _
    & " where PurCode = " & CStr(mPurCode) & " order by PurSno", dbNcbDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Do While .EOF = False
        If InList(.fields("PurRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
            Mfgrd2.TextMatrix(srow, X2PURICODE_COL) = .fields("PurICode")
            Mfgrd2.TextMatrix(srow, X2PURSTKICODE_COL) = .fields("PurStkICode")
            Mfgrd2.TextMatrix(srow, X2PURSNO_COL) = ToMyNumFmt(.fields("PurSno"), mDecimals:=0)
            Mfgrd2.TextMatrix(srow, X2BKMNAME_COL) = .fields("BkmName")
            Mfgrd2.TextMatrix(srow, X2PURITRREFNO_COL) = .fields("PurItrRefNo")
            Mfgrd2.TextMatrix(srow, X2GDMNAME_COL) = .fields("GdmName")
            Mfgrd2.TextMatrix(srow, X2PURQTY_COL) = ToMyNumFmt(.fields("PurQty"), mDecimals:=-1)
            Mfgrd2.TextMatrix(srow, X2PURRATE_COL) = ToMyNumFmt(.fields("PurRate"))
            Mfgrd2.TextMatrix(srow, X2PURMRP_COL) = ToMyNumFmt(.fields("PurMRP"))
            Mfgrd2.TextMatrix(srow, X2PURSRATE_COL) = ToMyNumFmt(.fields("PurSRate"))
            Mfgrd2.TextMatrix(srow, X2PURAMTBEFDISC_COL) = ToMyNumFmt(.fields("PurAmtBefDisc"))
            Mfgrd2.TextMatrix(srow, X2PURDISCPER_COL) = ToMyPerFmt(.fields("PurDiscPer"))
            Mfgrd2.TextMatrix(srow, X2PURDISCAMT_COL) = ToMyNumFmt(.fields("PurDiscAmt"))
            Mfgrd2.TextMatrix(srow, X2PURAMTBEFTAX_COL) = ToMyNumFmt(.fields("PurAmtBefTax"))
            Mfgrd2.TextMatrix(srow, X2PURTAXPER_COL) = ToMyPerFmt(.fields("PurTaxPer"), mDecimals:=-1)
            Mfgrd2.TextMatrix(srow, X2PURTAXAMT_COL) = ToMyNumFmt(.fields("PurTaxAmt"))
            Mfgrd2.TextMatrix(srow, X2PURAMOUNT_COL) = ToMyNumFmt(.fields("PurAmount"))
            Mfgrd2.TextMatrix(srow, X2PURNARR_COL) = .fields("PurNarr")
            Mfgrd2.TextMatrix(srow, X2PURBKMCODE_COL) = .fields("PurBkmCode")
            Mfgrd2.TextMatrix(srow, X2PURGDMCODE_COL) = .fields("PurGdmCode")
            Mfgrd2.TextMatrix(srow, X2PURSIMCODE_COL) = .fields("PurSimCode")
            Mfgrd2.TextMatrix(srow, X2PURITMCODE_COL) = .fields("PurItmCode")
            Mfgrd2.TextMatrix(srow, X2PURITRCODE_COL) = .fields("PurItrCode")
            Mfgrd2.TextMatrix(srow, X2PURRECSTATE_COL) = .fields("PurRecState")
            
            Mfgrd2.Rows = Mfgrd2.Rows + 1
            srow = srow + 1
        Else
            If InList(.fields("PurRecState"), Array(cREC_CANCELED, cREC_DELETED)) = False Then
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

With clsPUR
If FormAddEditMode = cFORM_ADDMODE Then
    .ClearHdr
Else
    .GetHdrData mPurCode
End If
.mTrnDate_dt = Ctod(dtpPurDate.Text)
.mTrnVtmCode_lng = Val(fcmbVtmName.BoundText)
.mTrnPrefix_str = txtPurPrefix.Text
.mTrnVchNo_lng = Val(UnMyNumFmt(mskPurVchNo.Text))
.mTrnPostfix_str = ""
.mTrnCmpCode_int = sFinYrCmpCode

.mPuhStkCode_lng = mPurStkCode
.mPuhTime_lng = TimeToMin(txtPurTime_str.Text)
.mPuhPrtCode_lng = Val(fcmbPrtName.BoundText)
.mPuhTrnRefNo_str = txtPurTrnRefNo.Text
.mPuhTrnRefDt_dt = Ctod(dtpPurTrnRefDt.Text)
.mPuhQty_dbl = Val(UnMyNumFmt(lblPurQtyTot.Caption))
.mPuhAmtBefDisc_dbl = Val(UnMyNumFmt(lblPurAmtBefDiscTot.Caption))
.mPuhDiscPer_dbl = Val(UnMyPerFmt(mskPuhDiscPer.Text))
.mPuhDiscAmt_dbl = Val(UnMyNumFmt(mskPuhDiscAmt.Text))
.mPuhAmtBefTax_dbl = Val(UnMyNumFmt(lblPuhAmtBefTax.Caption))
.mPuhTaxPer_dbl = Val(UnMyPerFmt(mskPuhTaxPer.Text))
.mPuhTaxAmt_dbl = Val(UnMyNumFmt(mskPuhTaxAmt.Text))
.mPuhOtherAmt_dbl = Val(UnMyNumFmt(mskPuhOtherAmt.Text))
.mPuhROffAmt_dbl = Val(UnMyNumFmt(mskPuhROffAmt.Text))
.mPuhAmount_dbl = Val(UnMyNumFmt(lblPuhAmount.Caption))
.mPuhRemark_str = txtPuhRemark.Text

If FormAddEditMode = cFORM_ADDMODE Then
    If .AddNewHdr() = True Then
        mskFormBoundField.Text = .mTrnCode_lng
        mPurCode = .mTrnCode_lng
    End If
Else
    .UpdateHdr mPurCode
End If
If .mTrnCode_lng > 0 Then   ' updated successfully
    With clsSTK
    If FormAddEditMode = cFORM_ADDMODE Then
        .ClearHdr
    Else
        .GetHdrData mPurStkCode
    End If
    .mShrVtmCode_lng = Val(fcmbVtmName.BoundText)
    .mShrPrefix_str = txtPurPrefix.Text
    .mShrVchNo_lng = Val(UnMyNumFmt(mskPurVchNo.Text))
    .mShrPostfix_str = ""
    .mShrDate_dt = Ctod(dtpPurDate.Text)
    .mShrQty_dbl = Val(UnMyNumFmt(lblPurQtyTot.Caption))
    .mShrValue_dbl = Val(UnMyNumFmt(lblPuhAmount.Caption))
    .mShrNarr_str = "Automated Purchase Entry"
    .mShrAutoGen_bln = True
    .mShrCmpCode_int = sFinYrCmpCode
    If FormAddEditMode = cFORM_ADDMODE Then
        If .AddNewHdr() = True Then
            mskPurStkCode.Text = .mShrCode_lng
            mPurStkCode = .mShrCode_lng
        End If
    Else
        .UpdateHdr mPurStkCode
    End If
    If .mShrCode_lng > 0 Then
        If FormAddEditMode = cFORM_ADDMODE Then
            clsPUR.GetHdrData mPurCode
            clsPUR.mPuhStkCode_lng = mPurStkCode
            
            dbNcbDatabase.BeginTrans
            dbNcbDatabase.Execute "Update PurchHdr set PuhStkCode=" & CStr(mPurStkCode) & " where PuhCode=" & CStr(mPurCode)
            dbNcbDatabase.Execute "Update PurchDtl set PurStkCode=" & CStr(mPurStkCode) & " where PurCode=" & CStr(mPurCode)
            dbNcbDatabase.CommitTrans
        End If
        clsPUR.UpdateTran mPurCode
        clsPUR.EndTran mPurCode
        
        .CommitStock mPurStkCode
        .EndStock mPurStkCode
        
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

If clsPUR.mTrnCode_lng > 0 Then   ' updated successfully
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

mPurCode = datRecset.fields("PuhCode")
mPurStkCode = datRecset.fields("PuhStkCode")
mRecAbsPos = datRecset.AbsolutePosition

If clsPUR.CanDeleteTran(mPurCode) = True Then
    txtVoid.SetFocus
    If clsPUR.BeginTran(mPurCode) = True And clsSTK.BeginStock(mPurStkCode) = True Then
        clsPUR.DeleteTran mPurCode
        clsPUR.UpdateTran mPurCode
        clsPUR.EndTran mPurCode
        
        clsSTK.DeleteStock mPurStkCode
        clsSTK.CommitStock mPurStkCode
        clsSTK.EndStock mPurStkCode
        
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
clsPUR.CancelTran mPurCode
clsPUR.EndTran mPurCode

clsSTK.CancelStock mPurStkCode
clsSTK.EndStock mPurStkCode

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
        clsListStru.AddFields mExpr:="PurYrMonth", mAttrib:=cFAT_SYSTEM
        clsListStru.AddFields mExpr:="PurMnYear", mTitle:="Month", mShowItem:=True, mAlign:=flexAlignLeftCenter, mWidth:=2000
        clsListStru.AddFields mExpr:="PurCount", mTitle:="Count", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="PurQty_sum", mTitle:="Qty", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="PurAmount_sum", mTitle:="Amount", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        
        datRecset.Open "Select format(PuhDate,'yyyy/MM') as PurYrMonth" _
         & ",Count(PuhCode) as PurCount" _
         & ",Sum(PuhQty) as PurQty_sum" _
         & ",Sum(PuhAmount) as PurAmount_sum" _
         & " from PurchHdr" _
         & " where PuhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and PuhCode > 0 and PuhVtmCode in (" & mFormVchTypeList & ")" _
         & IIf(mQryPrtCode > 0, " and PuhPrtCode=" & CStr(mQryPrtCode), "") _
         & " group by format(PuhDate,'yyyy/MM')" _
         & " order by format(PuhDate,'yyyy/MM')" _
         , dbNcbDatabase, adOpenKeyset, adLockReadOnly

    ElseIf optDatewise.Value = True Then
        clsListStru.AddFields mExpr:="PurDateYMD", mAttrib:=cFAT_SYSTEM
        clsListStru.AddFields mExpr:="PurDate", mTitle:="Date", mShowItem:=True, mAlign:=flexAlignLeftCenter, mWidth:=2000
        clsListStru.AddFields mExpr:="PurCount", mTitle:="Count", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="PurQty_sum", mTitle:="Qty", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="PurAmount_sum", mTitle:="Amount", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        
        datRecset.Open "Select PuhDate" _
         & ",Count(PuhCode) as PurCount" _
         & ",Sum(PuhQty) as PurQty_sum" _
         & ",Sum(PuhAmount) as PurAmount_sum" _
         & " from PurchHdr" _
         & " where PuhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and PuhCode > 0 and PuhVtmCode in (" & mFormVchTypeList & ")" _
         & IIf(mQryPrtCode > 0, " and PuhPrtCode=" & CStr(mQryPrtCode), "") _
         & " group by PuhDate" _
         & " order by PuhDate" _
         , dbNcbDatabase, adOpenKeyset, adLockReadOnly
        
    ElseIf optPartywise.Value = True Then
        clsListStru.AddFields mExpr:="PrtName", mTitle:="Party Name", mShowItem:=True, mAlign:=flexAlignLeftCenter, mWidth:=3000
        clsListStru.AddFields mExpr:="PurCount", mTitle:="Count", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="PurQty_sum", mTitle:="Qty", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="PurAmount_sum", mTitle:="Amount", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        
        datRecset.Open "Select PartyMast.PrtName,PurchHdr.PuhPrtCode" _
         & ",Count(PuhCode) as PurCount" _
         & ",Sum(PuhQty) as PurQty_sum" _
         & ",Sum(PuhAmount) as PurAmount_sum" _
         & " from PurchHdr inner join PartyMast on PurchHdr.PuhPrtCode=PartyMast.PrtCode" _
         & " where PuhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and PuhCode > 0 and PuhVtmCode in (" & mFormVchTypeList & ")" _
         & IIf(mQryPrtCode > 0, " and PuhPrtCode=" & CStr(mQryPrtCode), "") _
         & " group by PartyMast.PrtName,PurchHdr.PuhPrtCode" _
         & " order by PartyMast.PrtName,PurchHdr.PuhPrtCode" _
         , dbNcbDatabase, adOpenKeyset, adLockReadOnly
    End If
    
ElseIf optDetailed.Value = True Then
    clsListStru.AddFields mExpr:="tPurSmryId", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="PurCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="VtmName", mTitle:="Voucher", mAlign:=flexAlignLeftCenter, mWidth:=1500, mShowItem:=True
    clsListStru.AddFields mExpr:="PurVchNo", mTitle:="Vchr.No", mAlign:=flexAlignRightCenter, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="PurDate", mTitle:="Date", mAlign:=flexAlignLeftCenter, mWidth:=1300, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="PrtCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="PrtName", mTitle:="Party Name", mAlign:=flexAlignLeftCenter, mWidth:=2500, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="PurQty", mTitle:="Qty", mAlign:=flexAlignRightCenter, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="PurAmount", mTitle:="Amount", mAlign:=flexAlignRightCenter, mWidth:=1250, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="PrtAddr", mTitle:="Address", mAlign:=flexAlignLeftCenter, mWidth:=2000, mShowItem:=True
    clsListStru.AddFields mExpr:="PatAraName", mTitle:="Area", mAlign:=flexAlignLeftCenter, mWidth:=1500, mShowItem:=True
    clsListStru.AddFields mExpr:="PatStnName", mTitle:="Station", mAlign:=flexAlignLeftCenter, mWidth:=1500, mShowItem:=True
    
    datRecset.Open "Select PurchHdr.*,PartyMast.*" _
     & ",format(PuhDate,'yyyymmdd')+format(PuhCode,'" & cLONGCODESTRFMT & "') as tPurSmryId" _
     & " from PurchHdr inner join PartyMast on PurchHdr.PuhPrtCode = PartyMast.PrtCode" _
     & " where PuhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & IIf(mRemoteAccess = True, " and PuhCode = " & CStr(mPurCode) & "", "") _
     & " and PuhCode > 0 and PuhVtmCode in (" & mFormVchTypeList & ")" _
     & IIf(mQryPrtCode > 0, " and PuhPrtCode = " & CStr(mQryPrtCode), "") _
     & " order by PuhDate,PuhCode" _
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
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PurYrMonth")) = .fields("PurYrMonth")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PurMnYear")) = MonthName(Val(Right(.fields("PurYrMonth"), 2))) & "-" & Left(.fields("PurYrMonth"), 4)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PurCount")) = ToMyNumFmt(.fields("PurCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PurQty_sum")) = ToMyNumFmt(.fields("PurQty_sum"), mDecimals:=-1)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PurAmount_sum")) = ToMyNumFmt(.fields("PurAmount_sum"))
                
            ElseIf optDatewise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PurDateYMD")) = Format(.fields("PuhDate"), "yyyymmdd")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PurDate")) = Dtoc(.fields("PuhDate"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PurCount")) = ToMyNumFmt(.fields("PurCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PurQty_sum")) = ToMyNumFmt(.fields("PurQty_sum"), mDecimals:=-1)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PurAmount_sum")) = ToMyNumFmt(.fields("PurAmount_sum"))
                
            ElseIf optPartywise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PrtName")) = .fields("PrtName")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PurCount")) = ToMyNumFmt(.fields("PurCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PurQty_sum")) = ToMyNumFmt(.fields("PurQty_sum"), mDecimals:=-1)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PurAmount_sum")) = ToMyNumFmt(.fields("PurAmount_sum"))
                
            End If
        
        ElseIf optDetailed.Value = True Then
            clsARA.GetData .fields("PrtAraCode")
            clsSTN.GetData .fields("PrtStnCode")
            clsVTM.GetData .fields("PuhVtmCode")
            
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("tPurSmryId")) = .fields("tPurSmryId")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PurCode")) = .fields("PuhCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("VtmName")) = clsVTM.mName_str
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PurVchNo")) = .fields("PuhVchNo")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PurDate")) = Dtoc(.fields("PuhDate"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PurQty")) = ToMyNumFmt(.fields("PuhQty"), mDecimals:=-1)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PurAmount")) = ToMyNumFmt(.fields("PuhAmount"))
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
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("tPurSmryId"), mText
    ElseIf optMonthwise.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("PurYrMonth"), mText
    ElseIf optDatewise.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("PurDateYMD"), mText
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
            SendKeys "{tab}"
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
If Val(fcmbBkmName.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    txtBkmName.SetFocus
    Cancel = True
Else
    If FormAddEditMode = cFORM_ADDMODE Or dtlAddMode = True Or Val(fcmbBkmName.BoundText) <> mPurBkmCode_old Then
        clsBKM.GetData Val(fcmbBkmName.BoundText)
        clsSIM.GetData clsBKM.mBkmSimCode_lng
        
        mskPurSimCode.Text = clsBKM.mBkmSimCode_lng
        mskPurItmCode.Text = clsSIM.mSimItmCode_lng
        mskPurRate.Text = ToMyNumFmt(clsSIM.mSimPurchRate_dbl)
        mskPurMRP.Text = ToMyNumFmt(clsSIM.mSimMRPRate_dbl)
        mskPurSRate.Text = ToMyNumFmt(clsSIM.mSimSaleRate_dbl)
        Call CalcPurChg
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

Private Sub CalcPurChg()
Dim mPurQty As Double, mPurRate As Double, mPurSRate As Double, mPurAmount As Double, mPurAmtBefDisc As Double, mPurDiscPer As Double, mPurDiscAmt As Double, mPurAmtBefTax As Double, mPurTaxPer As Double, mPurTaxAmt As Double

mPurQty = Val(UnMyNumFmt(mskPurQty.Text))
mPurRate = Val(UnMyNumFmt(mskPurRate.Text))
mPurSRate = Val(UnMyNumFmt(mskPurSRate.Text))
mPurDiscPer = Val(UnMyPerFmt(mskPurDiscPer.Text))
mPurTaxPer = Val(UnMyPerFmt(mskPurTaxPer.Text))

If mFormSysVchType = cCOM_VTYPE_RETNINW Then
    mPurAmtBefDisc = Round(mPurQty * mPurSRate, 2)
    
    Rem If FormAddEditMode = cFORM_ADDMODE Or dtlAddMode = True Or mPurAmtBefDisc <> mPurAmtBefDisc_old Or mPurDiscPer <> mPurDiscPer_old Or Val(UnMyNumFmt(mskPurDiscAmt.Text)) = 0 Then
        mPurDiscAmt = Round(CDec(Round(mPurQty * mPurRate, 2)) * CDec(mPurDiscPer) / 100, 2)
    Rem Else
    Rem     mPurDiscAmt = Val(UnMyNumFmt(mskPurDiscAmt.Text))
    Rem End If
    
    mPurAmtBefTax = mPurAmtBefDisc - mPurDiscAmt
    
    Rem If FormAddEditMode = cFORM_ADDMODE Or dtlAddMode = True Or mPurAmtBefTax <> mPurAmtBefTax_old Or mPurTaxPer <> mPurTaxPer_old Or Val(UnMyNumFmt(mskPurTaxAmt.Text)) = 0 Then
        mPurTaxAmt = Round(CDec(Round(mPurQty * mPurRate, 2) - mPurDiscAmt) * CDec(mPurTaxPer) / 100, 2)
    Rem Else
    Rem     mPurTaxAmt = Val(UnMyNumFmt(mskPurTaxAmt.Text))
    Rem End If
    
    mPurAmount = Round(mPurAmtBefTax + mPurTaxAmt, 2)
    
Else
    mPurAmtBefDisc = Round(mPurQty * mPurRate, 2)
    
    Rem If FormAddEditMode = cFORM_ADDMODE Or dtlAddMode = True Or mPurAmtBefDisc <> mPurAmtBefDisc_old Or mPurDiscPer <> mPurDiscPer_old Or Val(UnMyNumFmt(mskPurDiscAmt.Text)) = 0 Then
        mPurDiscAmt = Round(CDec(mPurAmtBefDisc) * CDec(mPurDiscPer) / 100, 2)
    Rem Else
    Rem     mPurDiscAmt = Val(UnMyNumFmt(mskPurDiscAmt.Text))
    Rem End If

    mPurAmtBefTax = mPurAmtBefDisc - mPurDiscAmt
    
    Rem If FormAddEditMode = cFORM_ADDMODE Or dtlAddMode = True Or mPurAmtBefTax <> mPurAmtBefTax_old Or mPurTaxPer <> mPurTaxPer_old Or Val(UnMyNumFmt(mskPurTaxAmt.Text)) = 0 Then
        mPurTaxAmt = Round(CDec(mPurAmtBefTax) * CDec(mPurTaxPer) / 100, 2)
    Rem Else
    Rem     mPurTaxAmt = Val(UnMyNumFmt(mskPurTaxAmt.Text))
    Rem End If
    
    mPurAmount = Round(mPurAmtBefTax + mPurTaxAmt, 2)
    
End If
' --------
mskPurAmtBefDisc.Text = ToMyNumFmt(mPurAmtBefDisc)
mskPurDiscAmt.Text = ToMyNumFmt(mPurDiscAmt)
mskPurAmtBefTax.Text = ToMyNumFmt(mPurAmtBefTax)
mskPurTaxAmt.Text = ToMyNumFmt(mPurTaxAmt)
mskPurAmount.Text = ToMyNumFmt(mPurAmount)


End Sub

Private Sub ShowOldPurCodeDesc()
Dim tRecset As New ADODB.Recordset, mPurDate As Date, mPurPrtCode As Long

mPurPrtCode = Val(fcmbPrtName.BoundText)
mPurDate = Ctod(dtpPurDate.Text)
With tRecset
'If FormAddEditMode = cFORM_ADDMODE Then
'    .Open "Select top 1 puh.*,vtm.VtmName from PurchHdr puh inner join VTypMast vtm on puh.PuhVtmCode=vtm.VtmCode where puh.PuhPrtCode=" & CStr(mPurPrtCode) & " order by puh.PuhDate Desc", dbComDatabase, adOpenKeyset, adLockOptimistic
'Else
    .Open "Select top 1 puh.*,vtm.VtmName from PurchHdr puh" _
        & " inner join VTypMast vtm on puh.PuhVtmCode = vtm.VtmCode" _
        & " where puh.PuhPrtCode = " & CStr(mPurPrtCode) _
        & " and puh.PuhCode <> " & CStr(mPurCode) _
        & " and puh.PuhDate <= #" & ToSysDate(mPurDate) & "#" _
        & " and puh.PuhVtmCode IN (" & mFormVchTypeList & ")" _
        & " order by puh.PuhDate Desc", dbComDatabase, adOpenKeyset, adLockOptimistic
'End If
If .EOF = False Then
    lblOldPurCodeDesc.Caption = RTrim(.fields("VtmName")) & " No.:" & CStr(.fields("PuhVchNo")) & " Dated:" & Dtoc(.fields("PuhDate"))
Else
    lblOldPurCodeDesc.Caption = "#" & CStr(mPurPrtCode) & "#"
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
    Rem mskPurICode.Top = mRowPos
    Rem mskPurStkICode.Top = mRowPos
    mskPurSno.Top = mRowPos
    txtBkmName.Top = mRowPos
    txtPurNarr.Top = mRowPos + txtBkmName.Height
    Rem mskPurSimCode.Top = mRowPos
    Rem mskPurItmCode.Top = mRowPos
    Rem mskPurItrCode.Top = mRowPos
    txtPurItrRefNo.Top = mRowPos
    txtGdmName.Top = mRowPos
    mskPurQty.Top = mRowPos
    mskPurRate.Top = mRowPos
    mskPurMRP.Top = mRowPos
    Rem mskPurSRate.Top = mRowPos
    Rem mskPurAmtBefDisc.Top = mRowPos
    mskPurDiscPer.Top = mRowPos
    mskPurDiscAmt.Top = mRowPos
    Rem mskPurAmtBefTax.Top = mRowPos
    mskPurTaxPer.Top = mRowPos
    mskPurTaxAmt.Top = mRowPos
    mskPurAmount.Top = mRowPos
    cmdOK.Top = mRowPos + mskPurAmount.Height
End If

mskPurICode.Text = 0
mskPurStkICode.Text = 0
mskPurSno.Text = 0
txtBkmName.Text = "": fcmbBkmName.BoundText = ""
txtPurNarr.Text = ""
mskPurSimCode.Text = 0
mskPurItmCode.Text = 0
mskPurItrCode.Text = 0
txtPurItrRefNo.Text = ""
txtGdmName.Text = "": fcmbGdmName.BoundText = ""
mskPurQty.Text = ToMyNumFmt(0, mDecimals:=-1)
mskPurRate.Text = ToMyNumFmt(0)
mskPurMRP.Text = ToMyNumFmt(0)
mskPurSRate.Text = ToMyNumFmt(0)
mskPurAmtBefDisc.Text = ToMyNumFmt(0)
mskPurDiscPer.Text = ToMyPerFmt(0)
mskPurDiscAmt.Text = ToMyNumFmt(0)
mskPurAmtBefTax.Text = ToMyNumFmt(0)
mskPurTaxPer.Text = ToMyPerFmt(0, mDecimals:=-1)
mskPurTaxAmt.Text = ToMyNumFmt(0)
mskPurAmount.Text = ToMyNumFmt(0)

Call ValidDtl

mskPurICode.Visible = False     '''  mShowItem
mskPurStkICode.Visible = False     '''  mShowItem
mskPurSno.Visible = mShowItem
txtBkmName.Visible = mShowItem
txtPurNarr.Visible = mShowItem
mskPurSimCode.Visible = False     '''  mShowItem
mskPurItmCode.Visible = False     '''  mShowItem
mskPurItrCode.Visible = False     '''  mShowItem
txtPurItrRefNo.Visible = mShowItem
txtGdmName.Visible = mShowItem
mskPurQty.Visible = mShowItem
mskPurRate.Visible = mShowItem
mskPurMRP.Visible = mShowItem
mskPurSRate.Visible = False         ''' mShowItem
Rem mskPurAmtBefDisc.Visible = mShowItem
mskPurDiscPer.Visible = mShowItem
mskPurDiscAmt.Visible = mShowItem
Rem mskPurAmtBefTax.Visible = mShowItem
mskPurTaxPer.Visible = mShowItem
mskPurTaxAmt.Visible = mShowItem
mskPurAmount.Visible = mShowItem
cmdOK.Visible = mShowItem

frHeader.Enabled = (mShowItem = False)
Mfgrd2.Enabled = (mShowItem = False)
frFooter.Enabled = (mShowItem = False)
cmdSaveForm.Enabled = (mShowItem = False)

End Sub

Private Sub ValidDtl()
Dim mDataOk As Boolean, srow As Integer

srow = Mfgrd2.Row
mDataOk = (Val(fcmbPrtName.BoundText) > 0 And Val(fcmbVtmName.BoundText) > 0 And Val(UnMyNumFmt(mskPurSno.Text)) > 0 And Val(fcmbBkmName.BoundText) > 0 And Val(fcmbGdmName.BoundText) > 0 And Val(mskPurSimCode.Text) > 0 And Val(mskPurItmCode.Text) > 0 And Trim(txtPurItrRefNo.Text) <> "" And IIf(dtlAddMode = True, True, Val(mskPurItrCode.Text) > 0 And Val(mskPurICode.Text) > 0 And Val(mskPurStkICode.Text) > 0) And Val(UnMyNumFmt(mskPurQty.Text)) > 0 And Val(UnMyNumFmt(mskPurRate.Text)) >= 0 And Val(UnMyNumFmt(mskPurMRP.Text)) >= 0 And Val(UnMyNumFmt(mskPurSRate.Text)) >= 0 And Val(UnMyNumFmt(mskPurAmtBefDisc.Text)) >= 0 And Val(UnMyPerFmt(mskPurDiscPer.Text)) >= 0 And Val(UnMyNumFmt(mskPurDiscAmt.Text)) >= 0 And Val(UnMyPerFmt(mskPurTaxPer.Text)) >= 0 And Val(UnMyPerFmt(mskPurTaxPer.Text)) >= 0 And Val(UnMyNumFmt(mskPurAmtBefTax.Text)) >= 0 And Val(UnMyNumFmt(mskPurAmount.Text)) >= 0)

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

mDtlQtyTot = FlexColSum(Mfgrd2, X2PURQTY_COL)
mDtlAmtBefDiscTot = FlexColSum(Mfgrd2, X2PURAMTBEFDISC_COL)
mDtlDiscAmtTot = FlexColSum(Mfgrd2, X2PURDISCAMT_COL)
mBillTaxableAmt = FlexColSum(Mfgrd2, X2PURAMTBEFTAX_COL)
mDtlTaxAmtTot = FlexColSum(Mfgrd2, X2PURTAXAMT_COL)

lblPurQtyTot.Caption = ToMyNumFmt(mDtlQtyTot, mDecimals:=-1)
lblPurAmtBefDiscTot.Caption = ToMyNumFmt(mDtlAmtBefDiscTot)
lblPurDiscAmtTot.Caption = ToMyNumFmt(mDtlDiscAmtTot)
lblPurTaxAmtTot.Caption = ToMyNumFmt(mDtlTaxAmtTot)

mHdrAmtBefDiscTot = 0
mHdrTaxableAmt = 0
With Mfgrd2
For srow = .FixedRows To .Rows - 1
    If Val(UnMyNumFmt(.TextMatrix(srow, X2PURDISCAMT_COL))) = 0 Then
        mHdrAmtBefDiscTot = mHdrAmtBefDiscTot + Val(UnMyNumFmt(.TextMatrix(srow, X2PURAMTBEFDISC_COL)))
    End If
    mItmTaxPer = Val(UnMyPerFmt(.TextMatrix(srow, X2PURTAXPER_COL)))
    mItmTaxAmt = Val(UnMyNumFmt(.TextMatrix(srow, X2PURTAXAMT_COL)))
    mItmTaxableAmt = Val(UnMyNumFmt(.TextMatrix(srow, X2PURAMTBEFTAX_COL)))
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
mHdrDiscPer = Val(UnMyPerFmt(mskPuhDiscPer.Text))
mHdrTaxPer = Val(UnMyPerFmt(mskPuhTaxPer.Text))
mHdrOtherAmt = Val(UnMyNumFmt(mskPuhOtherAmt.Text))
mHdrROffAmt = Val(UnMyNumFmt(mskPuhROffAmt.Text))

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

mskPuhDiscAmt.Text = ToMyNumFmt(mHdrDiscAmt)
mskPuhTaxAmt.Text = ToMyNumFmt(mHdrTaxAmt)
lblPuhAmtBefTax.Caption = ToMyNumFmt(mBillTaxableAmt)
lblPuhAmount.Caption = ToMyNumFmt(mHdrAmount)

For aPos = LBound(aryTaxPer) To UBound(aryTaxPer)
    mTaxSmry = mTaxSmry & CStr(aryTaxableAmt(aPos)) & " @ " & CStr(aryTaxPer(aPos)) & "% = " & CStr(aryTaxAmt(aPos)) & ", "
Next aPos
If Right(mTaxSmry, 2) = ", " Then
    mTaxSmry = Left(mTaxSmry, Len(mTaxSmry) - 2)
End If
lblTaxSmry.Caption = mTaxSmry

Erase aryTaxPer: Erase aryTaxableAmt: Erase aryTaxAmt

End Sub

Private Sub ShowLinkTranDtl()
Dim tRecset As New ADODB.Recordset, mLinkTranStr As String

mLinkTranStr = ""

With tRecset
.Open "Select * from ((SaleDtl sal" _
    & " inner join SaleHdr sah on sal.SalCode = sah.SahCode)" _
    & " inner join BookMast bkm on sal.SalBkmCode = bkm.BkmCode)" _
    & " inner join VTypMast vtm on sah.SahVtmCode = vtm.VtmCode" _
    & " where SalPurCode = " & CStr(mPurCode) _
    & " order by SalDate,SalSno" _
    , dbComDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    Do While .EOF = False
        mLinkTranStr = mLinkTranStr & .fields("VtmName") & " No." & CStr(.fields("SahVchNo")) & " Dt." & Dtoc(.fields("SahDate")) & " It." & .fields("BkmName") & " Rf." & .fields("SalItrRefNo") & " Qty." & ToMyNumFmt(.fields("SalQty"), mDecimals:=0) & vbCrLf
    
        .MoveNext
    Loop
End If
End With
CloseTable tRecset

txtLinkTranDesc.Text = mLinkTranStr

End Sub

Private Function ChkAnyPriorIsuExist() As Boolean
Dim tRecset As New ADODB.Recordset

ChkAnyPriorIsuExist = False

With tRecset
.Open "Select top 1 * from ((PurchDtl" _
    & " inner join PurchHdr on PurchDtl.PurCode = PurchHdr.PuhCode)" _
    & " inner join SaleDtl on PurchDtl.PurICode = SaleDtl.SalPurICode)" _
    & " Inner Join SaleHdr on SaleDtl.SalCode = SaleHdr.SahCode" _
    & " where PurCode = " & CStr(mPurCode) _
    & " and SalDate < #" & CStr(ToSysDate(Ctod(dtpPurDate.Text))) & "#" _
    & " order by SalDate,SalCode" _
    , dbNcbDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    clsVTM.GetData .fields("SahVtmCode")
    ErrorBox "Prior Sales/Issue Exist !!!" _
        & vbCrLf & clsVTM.mName_str & " No." & CStr(.fields("SahVchNo")) & " Dated " & Dtoc(.fields("SahDate")) & ""
    ChkAnyPriorIsuExist = True
End If
End With
CloseTable tRecset

End Function

Private Function ChkAnyMisLinkedIsuExist(Optional ByVal mPurICode) As Boolean
Dim tRecset As New ADODB.Recordset, mMisLinkedDesc As String

ChkAnyMisLinkedIsuExist = False
mMisLinkedDesc = ""

With tRecset
.Open "Select top 1 * from ((PurchDtl" _
    & " inner join PurchHdr on PurchDtl.PurCode = PurchHdr.PuhCode)" _
    & " inner join SaleDtl on PurchDtl.PurICode = SaleDtl.SalPurICode)" _
    & " Inner Join SaleHdr on SaleDtl.SalCode = SaleHdr.SahCode" _
    & " where PurCode=" & CStr(mPurCode) & IIf(IsMissing(mPurICode) = False, " and PurICode=" & CStr(mPurICode), "") _
    & " and (SalBkmCode <> PurBkmCode or SalItmCode <> PurItmCode or SalItrCode <> PurItrCode or SalItrRefNo <> PurItrRefNo)" _
    & " order by SahDate,SahCode" _
    , dbNcbDatabase, adOpenKeyset, adLockOptimistic
    Rem SahPrtCode <> " & CStr(Val(fcmbPrtName.BoundText)) & " or

If .EOF = False Then
    clsVTM.GetData .fields("SahVtmCode")
    'If .fields("SahPrtCode") <> Val(fcmbPrtName.BoundText) Then
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
    ErrorBox "Mis-Linked Sale/Issue Exist !!!" _
        & vbCrLf & clsVTM.mName_str & " No." & CStr(.fields("SahVchNo")) & " Dated " & Dtoc(.fields("SahDate")) _
        & vbCrLf & "Alteration made in " _
        & vbCrLf & mMisLinkedDesc
    ChkAnyMisLinkedIsuExist = True
End If
End With
CloseTable tRecset

End Function

Private Function ChkAnyShortRcExist(Optional ByVal mPurICode) As Boolean
Dim tRecset As New ADODB.Recordset

ChkAnyShortRcExist = False

With tRecset
.Open "Select top 1 * from (" _
    & "Select PurICode,BkmCode,ItmCode,ItrCode,ItrRefNo,sum(Qty) as Qty_sum from (" _
    & "Select PurICode,PurBkmCode as BkmCode,PurItmCode as ItmCode,PurItrCode as ItrCode,PurItrRefNo as ItrRefNo,PurQty as Qty from PurchDtl" _
    & " inner join PurchHdr on PurchDtl.PurCode = PurchHdr.PuhCode" _
    & " where PurCode=" & CStr(mPurCode) & IIf(IsMissing(mPurICode) = False, " and PurICode=" & CStr(mPurICode), "") _
    & " and PurRecState IN (" & CStr(cREC_ADDED) & "," & CStr(cREC_EDITED) & "," & CStr(cREC_UNCHANGED) & ")" _
    & " Union All " _
    & "Select SalPurICode as PurICode,SalBkmCode as BkmCode,SalItmCode as ItmCode,SalItrCode as ItrCode,SalItrRefNo as ItrRefNo,(SalQty*-1) as Qty from (SaleDtl" _
    & " left join SaleHdr on SaleDtl.SalCode = SaleHdr.SahCode)" _
    & " inner join PurchDtl on SaleDtl.SalPurICode = PurchDtl.PurICode" _
    & " where SalPurCode = " & CStr(mPurCode) & IIf(IsMissing(mPurICode) = False, " and SalPurICode=" & CStr(mPurICode), "") _
    & " and SalRecState <> " & CStr(cREC_CANCELED) _
    & ")" _
    & " group by PurICode,BkmCode,ItmCode,ItrCode,ItrRefNo" _
    & " order by PurICode,BkmCode,ItmCode,ItrCode,ItrRefNo" _
    & ") as a" _
    & " inner join BookMast on a.BkmCode = BookMast.BkmCode" _
    & " where Qty_sum < 0" _
    , dbNcbDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    ErrorBox "Purchase going Short for Item " & vbCrLf & .fields("BkmName") & " Ref.No." & CStr(.fields("ItrRefNo")) & " by Qty " & CStr(.fields("Qty_sum"))
    ChkAnyShortRcExist = True
End If
End With
CloseTable tRecset

End Function



Rem ---------------------------------------------- end of form -------------------------------------------------
