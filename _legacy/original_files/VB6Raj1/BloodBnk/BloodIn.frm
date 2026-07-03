VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmBloodInTran 
   Appearance      =   0  'Flat
   BackColor       =   &H00FFFFFF&
   ClientHeight    =   10800
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
   LockControls    =   -1  'True
   ScaleHeight     =   10800
   ScaleWidth      =   15120
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
      TabIndex        =   40
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
      TabIndex        =   39
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
      ItemData        =   "BloodIn.frx":0000
      Left            =   0
      List            =   "BloodIn.frx":000D
      Style           =   1  'Simple Combo
      TabIndex        =   38
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
      TabIndex        =   37
      Top             =   840
      Width           =   14775
      Begin VB.TextBox dtpBinBldExpDt 
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
         Left            =   9540
         MaxLength       =   50
         TabIndex        =   19
         Text            =   "dd/mm/yyyy"
         Top             =   4950
         Width           =   1455
      End
      Begin VB.TextBox mskBinItmCode 
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
         TabIndex        =   99
         Tag             =   "AhCode"
         Text            =   "ItmCode"
         Top             =   5580
         Visible         =   0   'False
         Width           =   1335
      End
      Begin VB.TextBox mskBinBldQty 
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
         Left            =   11865
         TabIndex        =   21
         Tag             =   "AhCode"
         Text            =   "BldQty"
         Top             =   4950
         Width           =   975
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
         Left            =   2100
         MaxLength       =   50
         TabIndex        =   16
         Text            =   "BdcName"
         Top             =   4950
         Width           =   2265
      End
      Begin VB.Frame frHeader 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   4455
         Left            =   120
         TabIndex        =   69
         Top             =   240
         Width           =   14535
         Begin VB.TextBox txtLnkBinTrnRefNo 
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
            Left            =   1665
            MaxLength       =   15
            TabIndex        =   1
            Tag             =   "AhCode"
            Top             =   960
            Width           =   1575
         End
         Begin VB.TextBox txtEfmSMSNo 
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
            Left            =   7920
            Locked          =   -1  'True
            MaxLength       =   50
            TabIndex        =   95
            TabStop         =   0   'False
            Top             =   3165
            Width           =   5295
         End
         Begin VB.TextBox txtEfmTelNo 
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
            Left            =   7920
            Locked          =   -1  'True
            MaxLength       =   50
            TabIndex        =   94
            TabStop         =   0   'False
            Top             =   2865
            Width           =   5295
         End
         Begin VB.TextBox txtEfmStnName 
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
            Left            =   7920
            Locked          =   -1  'True
            MaxLength       =   50
            TabIndex        =   93
            TabStop         =   0   'False
            Top             =   2565
            Width           =   5295
         End
         Begin VB.TextBox txtEfmAraName 
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
            Left            =   7920
            Locked          =   -1  'True
            MaxLength       =   50
            TabIndex        =   92
            TabStop         =   0   'False
            Top             =   2265
            Width           =   5295
         End
         Begin VB.TextBox txtEfmAddr 
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
            Left            =   7920
            Locked          =   -1  'True
            MaxLength       =   250
            MultiLine       =   -1  'True
            TabIndex        =   91
            TabStop         =   0   'False
            Top             =   1605
            Width           =   5295
         End
         Begin VB.TextBox mskEfmRegNo 
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
            Left            =   7905
            MaxLength       =   50
            TabIndex        =   4
            Text            =   "0"
            Top             =   960
            Width           =   1395
         End
         Begin VB.TextBox txtEfmName 
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
            Left            =   7905
            MaxLength       =   50
            TabIndex        =   5
            Top             =   1260
            Width           =   5295
         End
         Begin VB.TextBox mskEttRegNo 
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
            Left            =   4305
            MaxLength       =   50
            TabIndex        =   2
            Text            =   "0"
            Top             =   960
            Width           =   1635
         End
         Begin VB.TextBox mskBinStkCode 
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
            Left            =   3360
            TabIndex        =   86
            Tag             =   "AhCode"
            Text            =   "-1"
            Top             =   120
            Width           =   1575
         End
         Begin VB.TextBox dtpBinTrnRefDt 
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
            Left            =   5220
            MaxLength       =   50
            TabIndex        =   11
            Text            =   "dd/mm/yyyy"
            Top             =   4020
            Width           =   1455
         End
         Begin VB.TextBox txtBinTrnRefNo 
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
            Left            =   1665
            MaxLength       =   15
            TabIndex        =   10
            Tag             =   "AhCode"
            Top             =   4020
            Width           =   2355
         End
         Begin VB.TextBox txtBinTime_str 
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
            Left            =   10935
            MaxLength       =   50
            TabIndex        =   9
            Text            =   "00:00"
            Top             =   3660
            Width           =   855
         End
         Begin VB.TextBox dtpBinDate 
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
            TabIndex        =   8
            Text            =   "dd/mm/yyyy"
            Top             =   3660
            Width           =   1455
         End
         Begin VB.TextBox mskBinVchNo 
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
            Left            =   6255
            TabIndex        =   7
            TabStop         =   0   'False
            Tag             =   "AhCode"
            Text            =   "0"
            Top             =   3660
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
            Left            =   1665
            MaxLength       =   50
            TabIndex        =   6
            TabStop         =   0   'False
            Top             =   3660
            Width           =   2355
         End
         Begin VB.TextBox txtBinPrefix 
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
            Left            =   5220
            TabIndex        =   29
            Tag             =   "AhCode"
            Text            =   "[Prefix]"
            Top             =   3660
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
            Left            =   1680
            TabIndex        =   0
            Tag             =   "AhCode"
            Text            =   "-1"
            Top             =   120
            Width           =   1635
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
            Left            =   1665
            MaxLength       =   50
            TabIndex        =   3
            Top             =   1260
            Width           =   6165
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
            Left            =   1665
            Locked          =   -1  'True
            MaxLength       =   250
            MultiLine       =   -1  'True
            TabIndex        =   25
            TabStop         =   0   'False
            Top             =   1605
            Width           =   6165
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
            Left            =   1665
            Locked          =   -1  'True
            MaxLength       =   50
            TabIndex        =   27
            TabStop         =   0   'False
            Top             =   2265
            Width           =   6165
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
            Left            =   1665
            Locked          =   -1  'True
            MaxLength       =   50
            TabIndex        =   28
            TabStop         =   0   'False
            Top             =   2565
            Width           =   6165
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
            Left            =   1665
            Locked          =   -1  'True
            MaxLength       =   50
            TabIndex        =   24
            TabStop         =   0   'False
            Top             =   2865
            Width           =   6165
         End
         Begin VB.TextBox txtEttSMSNo 
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
            Left            =   1665
            Locked          =   -1  'True
            MaxLength       =   50
            TabIndex        =   26
            TabStop         =   0   'False
            Top             =   3165
            Width           =   6165
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
            Left            =   8760
            MaxLength       =   50
            TabIndex        =   12
            Top             =   4020
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
            TabIndex        =   111
            Top             =   960
            Width           =   1575
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            Caption         =   "Family of Donor/Person Donated Blood"
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
            Left            =   7920
            TabIndex        =   90
            Top             =   615
            Width           =   5295
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            Caption         =   "Donor/Person Donated Blood"
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
            Left            =   1665
            TabIndex        =   89
            Top             =   615
            Width           =   6165
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
            Index           =   16
            Left            =   3360
            TabIndex        =   88
            Top             =   960
            Width           =   855
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
            Left            =   4260
            TabIndex        =   85
            Top             =   4020
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
            TabIndex        =   84
            Top             =   4020
            Width           =   1575
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
            Left            =   7920
            TabIndex        =   81
            Top             =   3660
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
            Left            =   10320
            TabIndex        =   80
            Top             =   3660
            Width           =   570
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
            Left            =   4260
            TabIndex        =   79
            Top             =   3660
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
            TabIndex        =   78
            Top             =   3660
            Width           =   1575
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
            TabIndex        =   77
            Top             =   120
            Width           =   1575
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Name:"
            BeginProperty Font 
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
            TabIndex        =   76
            Top             =   1245
            Width           =   1575
         End
         Begin VB.Line Line3 
            Index           =   1
            X1              =   0
            X2              =   14535
            Y1              =   540
            Y2              =   540
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
            TabIndex        =   75
            Top             =   1605
            Width           =   1575
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
            TabIndex        =   74
            Top             =   2265
            Width           =   1575
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
            TabIndex        =   73
            Top             =   2565
            Width           =   1575
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
            TabIndex        =   72
            Top             =   2865
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
            Height          =   285
            Index           =   12
            Left            =   120
            TabIndex        =   71
            Top             =   3165
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
            Height          =   285
            Index           =   33
            Left            =   7920
            TabIndex        =   70
            Top             =   4020
            Width           =   1215
         End
         Begin VB.Shape Shape1 
            BackColor       =   &H00F1CFA6&
            BackStyle       =   1  'Opaque
            Height          =   3555
            Index           =   0
            Left            =   0
            Top             =   0
            Width           =   14535
         End
         Begin VB.Shape Shape1 
            BackColor       =   &H00FFFF80&
            BackStyle       =   1  'Opaque
            Height          =   915
            Index           =   2
            Left            =   0
            Top             =   3540
            Width           =   14535
         End
      End
      Begin VB.TextBox txtBinNarr 
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
         Left            =   4350
         MaxLength       =   25
         TabIndex        =   17
         Text            =   "Narr"
         Top             =   4950
         Width           =   2370
      End
      Begin VB.TextBox mskBinStkICode 
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
         TabIndex        =   30
         Tag             =   "AhCode"
         Text            =   "StkICode"
         Top             =   5565
         Visible         =   0   'False
         Width           =   1335
      End
      Begin VB.TextBox mskBinItrCode 
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
         TabIndex        =   33
         Tag             =   "AhCode"
         Text            =   "ItrCode"
         Top             =   5265
         Visible         =   0   'False
         Width           =   1335
      End
      Begin VB.TextBox mskBinBldCode 
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
         TabIndex        =   32
         Tag             =   "AhCode"
         Text            =   "BldCode"
         Top             =   5265
         Visible         =   0   'False
         Width           =   1335
      End
      Begin VB.TextBox txtBinBldRefNo 
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
         Left            =   6720
         MaxLength       =   25
         TabIndex        =   18
         Text            =   "BldRefNo"
         Top             =   4950
         Width           =   2790
      End
      Begin VB.TextBox mskBinICode 
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
         TabIndex        =   31
         Tag             =   "AhCode"
         Text            =   "BinICode"
         Top             =   5265
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
         Left            =   12165
         Style           =   1  'Graphical
         TabIndex        =   22
         Top             =   5295
         Width           =   735
      End
      Begin VB.TextBox mskBinSno 
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
         TabIndex        =   14
         Tag             =   "AhCode"
         Text            =   "1)"
         Top             =   4950
         Width           =   375
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
         Left            =   495
         MaxLength       =   50
         TabIndex        =   15
         Text            =   "BdgName"
         Top             =   4950
         Width           =   1620
      End
      Begin VB.TextBox mskBinPckQty 
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
         Left            =   10995
         TabIndex        =   20
         Tag             =   "AhCode"
         Text            =   "PckQty"
         Top             =   4950
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
         Left            =   14280
         Style           =   1  'Graphical
         TabIndex        =   23
         Top             =   9480
         Width           =   375
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd2 
         Height          =   1860
         Left            =   120
         TabIndex        =   13
         Top             =   4680
         Width           =   14535
         _ExtentX        =   25638
         _ExtentY        =   3281
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
         Height          =   3315
         Left            =   120
         TabIndex        =   82
         Top             =   6540
         Width           =   14535
         Begin MSFlexGridLib.MSFlexGrid Mfgrd3 
            Height          =   1740
            Left            =   0
            TabIndex        =   109
            TabStop         =   0   'False
            Top             =   60
            Width           =   12195
            _ExtentX        =   21511
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
            Height          =   1500
            Left            =   0
            TabIndex        =   110
            TabStop         =   0   'False
            Top             =   1800
            Width           =   12195
            _ExtentX        =   21511
            _ExtentY        =   2646
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
         Begin VB.Label lblBinBldQtyTot 
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
            Left            =   13545
            TabIndex        =   96
            Top             =   120
            Width           =   855
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
            TabIndex        =   87
            Top             =   0
            Width           =   855
         End
         Begin VB.Label lblBinPckQtyTot 
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
            Left            =   12300
            TabIndex        =   83
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
      TabIndex        =   36
      Top             =   840
      Width           =   14895
      Begin VB.Frame frPrintCRList 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   3615
         Left            =   3480
         TabIndex        =   100
         Top             =   1620
         Width           =   5895
         Begin VB.ComboBox cmbPrinterList 
            Height          =   315
            Left            =   2160
            Style           =   2  'Dropdown List
            TabIndex        =   60
            Top             =   1680
            Width           =   3495
         End
         Begin VB.ComboBox cmbPrintDest 
            Height          =   315
            Left            =   2160
            Style           =   2  'Dropdown List
            TabIndex        =   62
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
            TabIndex        =   61
            Text            =   "0"
            Top             =   2040
            Width           =   1455
         End
         Begin VB.ComboBox cmbCRList 
            Height          =   315
            Left            =   2160
            Style           =   2  'Dropdown List
            TabIndex        =   59
            Top             =   1320
            Width           =   3495
         End
         Begin VB.TextBox mskBinVchNo 
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
            TabIndex        =   58
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
            TabIndex        =   56
            Top             =   600
            Width           =   3495
         End
         Begin VB.TextBox mskBinVchNo 
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
            TabIndex        =   57
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
            TabIndex        =   63
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
            TabIndex        =   108
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
            TabIndex        =   107
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
            TabIndex        =   106
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
            TabIndex        =   105
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
            TabIndex        =   104
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
            TabIndex        =   103
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
            TabIndex        =   102
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
            TabIndex        =   101
            Top             =   0
            Width           =   5895
         End
      End
      Begin VB.Frame frConfigure 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   6105
         Left            =   3000
         TabIndex        =   65
         Top             =   720
         Width           =   6735
         Begin VB.TextBox txtQryEfmName 
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
            TabIndex        =   47
            Top             =   1560
            Width           =   4455
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
            TabIndex        =   46
            Top             =   1200
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
            Left            =   3000
            TabIndex        =   55
            Top             =   5505
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
            Height          =   3255
            Left            =   2160
            TabIndex        =   48
            Top             =   2025
            Width           =   2655
            Begin VB.OptionButton optEFamilywise 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Family-wise"
               BeginProperty Font 
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
               Top             =   2760
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
               TabIndex        =   49
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
               TabIndex        =   50
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
               TabIndex        =   51
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
               TabIndex        =   52
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
               TabIndex        =   53
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
            TabIndex        =   45
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
            TabIndex        =   44
            Tag             =   "AhCode"
            Text            =   "dd/mm/yyyy"
            Top             =   720
            Width           =   1455
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Family Name:"
            BeginProperty Font 
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
            TabIndex        =   98
            Top             =   1560
            Width           =   1575
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Person Name:"
            BeginProperty Font 
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
            TabIndex        =   97
            Top             =   1200
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
            TabIndex        =   68
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
            TabIndex        =   67
            Top             =   720
            Width           =   1575
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
            TabIndex        =   66
            Top             =   0
            Width           =   6735
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
         TabIndex        =   43
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
         TabIndex        =   41
         Top             =   360
         Width           =   4215
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd1 
         Height          =   6375
         Left            =   120
         TabIndex        =   42
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
         TabIndex        =   64
         Top             =   360
         Width           =   735
      End
   End
   Begin VB.TextBox txtVoid 
      CausesValidation=   0   'False
      Height          =   375
      Left            =   120
      TabIndex        =   34
      TabStop         =   0   'False
      Text            =   "Void"
      Top             =   10380
      Width           =   375
   End
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Blood In (Opn/Donate/Filter)"
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
      TabIndex        =   35
      Top             =   0
      Width           =   9015
   End
End
Attribute VB_Name = "frmBloodInTran"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Dim mFormLoaded As Boolean, mLastKeyPressed As Integer, mMaskKeyPressed As Integer
Dim mFormUIdCode As Long, mFormUIdFileName As String, mFormAcsPermFileName As String
Dim mFormSysVchType As Integer, mFormVchTypeList As String, mBinCode As Long, mBinStkCode As Long, mBinEttCode As Long, mBinEfmCode As Long, mQryEttCode As Long, mQryEfmCode As Long, mEttRegNoChanged As Boolean, mEfmRegNoChanged As Boolean, mBinDateChanged As Boolean, dtlAddEditMode As Boolean, dtlAddMode As Boolean, dtlEditCanceled As Boolean
Dim mRemoteAccess As Boolean, mEntrySaved As Boolean, mEntryAborted As Boolean
Dim dbAcDatabase As New ADODB.Connection, dbStDatabase As New ADODB.Connection, dbBdkDatabase As New ADODB.Connection, dbGrpDatabase As New ADODB.Connection, dbComDatabase As New ADODB.Connection
Dim datRecset As New ADODB.Recordset
Dim mBinCode_old As Long, mBinStkCode_old As Long, mBinEttCode_old As Long, mBinEfmCode_old As Long, mBinDate_old As Date, mBinVtmCode_old As Long, mBinVchNo_old As Long, mBinTime_old As Long
Dim mBinBdgCode_old As Long, mBinBdcCode_old As Long, mBinBldCode_old As Long, mBinPckQty_old As Double, mBinItmCode_old As Long, mBinItrCode_old As Long, mBinBldRefNo_old As String       ''' mBinBdpCode_old As Long,
Dim clsAH As clsAccountHead, clsSTK As clsStockJrn, clsBIN As clsBdkMultiTranEntry, clsARA As clsComMastEntry, clsSTN As clsComMastEntry, clsVTM As clsComMastEntry
Dim clsETT As clsBdkMasterEntry, clsEFM As clsBdkMasterEntry, clsBDG As clsBdkMasterEntry, clsBDC As clsBdkMasterEntry
Dim mActiveControl As Object, clsListStru As clsSelectQueryStructure
Dim fcmbVtmName As clsComFlexSearch
Dim fcmbEttName As clsBdkFlexSearch, fcmbEfmName As clsBdkFlexSearch, fcmbBdgName As clsBdkFlexSearch, fcmbBdcName As clsBdkFlexSearch  ''' , fcmbBdpName As clsBdkFlexSearch

Private Type SmryPara
mIndex() As Variant
mFromDate() As Variant
mToDate() As Variant
mEttCode() As Variant
mEfmCode() As Variant
mExpanded() As Variant
mDetailed() As Variant
mMonthwise() As Variant
mDatewise() As Variant
mEntitywise() As Variant
mEFamilywise() As Variant
mRowIndex() As Variant

End Type

Dim SmryParaLayer As SmryPara

Rem service charges column definitions
Const X2BINICODE_COL = 0
Const X2BINSNO_COL = 1
Const X2BDGNAME_COL = 2
Const X2BDCNAME_COL = 3
Const X2BINNARR_COL = 4
Const X2BINBLDREFNO_COL = 5
Const X2BINBLDEXPDT_COL = 6
Const X2BINBLDOKSTATUS_COL = 7
'''Const X2BDPNAME_COL = 8
Const X2BINPCKQTY_COL = 8
Const X2BINBLDQTY_COL = 9
Const X2BINBDGCODE_COL = 10
Const X2BINBDCCODE_COL = 11
'''Const X2BINBDPCODE_COL = 12
Const X2BINBLDCODE_COL = 12
Const X2BINITMCODE_COL = 13
Const X2BINITRCODE_COL = 14
Const X2BINBLDOKSTATE_COL = 15
Const X2BINSTKICODE_COL = 16
Const X2BINRECSTATE_COL = 17
Const MFGRD2_COLS = 18

Rem link transaction-IN column definitions
Const X3LNKICODE_COL = 0
Const X3LNKSNO_COL = 1
Const X3LNKVTMNAME_COL = 2
Const X3LNKVCHNO_COL = 3
Const X3LNKDATE_COL = 4
Const X3LNKBDGNAME_COL = 5
Const X3LNKBDCNAME_COL = 6
Const X3LNKBLDEXPDT_COL = 7
'''Const X3LNKBDPNAME_COL = 8
Const X3LNKPCKQTY_COL = 8
Const X3LNKBLDQTY_COL = 9
Const X3LNKVTMCODE_COL = 10
Const X3LNKCODE_COL = 11
Const MFGRD3_COLS = 12

Rem link transaction-OUT column definitions
Const X4LNKICODE_COL = 0
Const X4LNKSNO_COL = 1
Const X4LNKVTMNAME_COL = 2
Const X4LNKVCHNO_COL = 3
Const X4LNKDATE_COL = 4
Const X4LNKETTNAME_COL = 5
Const X4LNKPCKQTY_COL = 6
Const X4LNKBLDQTY_COL = 7
Const X4LNKBDGNAME_COL = 8
Const X4LNKBDCNAME_COL = 9
'''Const X4LNKBDPNAME_COL = 10
Const X4LNKVTMCODE_COL = 10
Const X4LNKCODE_COL = 11
Const MFGRD4_COLS = 12

Private Sub ClearSmryParaLayer()

With SmryParaLayer
.mIndex = Array()
.mFromDate = Array()
.mToDate = Array()
.mEttCode = Array()
.mEfmCode = Array()
.mExpanded = Array()
.mDetailed = Array()
.mMonthwise = Array()
.mDatewise = Array()
.mEntitywise = Array()
.mEFamilywise = Array()
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
    ReDim Preserve .mEfmCode(mIndex)
    ReDim Preserve .mExpanded(mIndex)
    ReDim Preserve .mDetailed(mIndex)
    ReDim Preserve .mMonthwise(mIndex)
    ReDim Preserve .mDatewise(mIndex)
    ReDim Preserve .mEntitywise(mIndex)
    ReDim Preserve .mEFamilywise(mIndex)
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
ReDim Preserve .mEfmCode(mIndex)
ReDim Preserve .mExpanded(mIndex)
ReDim Preserve .mDetailed(mIndex)
ReDim Preserve .mMonthwise(mIndex)
ReDim Preserve .mDatewise(mIndex)
ReDim Preserve .mEntitywise(mIndex)
ReDim Preserve .mEFamilywise(mIndex)
ReDim Preserve .mRowIndex(mIndex)
' -----------------------
.mIndex(mIndex) = mIndex
.mFromDate(mIndex) = Ctod(dtpFromDate.Text)
.mToDate(mIndex) = Ctod(dtpToDate.Text)
    fcmbEttName.BoundText = CStr(mQryEttCode)
    fcmbEfmName.BoundText = CStr(mQryEfmCode)
.mEttCode(mIndex) = Val(fcmbEttName.BoundText)
.mEfmCode(mIndex) = Val(fcmbEfmName.BoundText)
.mExpanded(mIndex) = optExpanded.Value
.mDetailed(mIndex) = optDetailed.Value
.mMonthwise(mIndex) = optMonthwise.Value
.mDatewise(mIndex) = optDatewise.Value
.mEntitywise(mIndex) = optEntitywise.Value
.mEFamilywise(mIndex) = optEFamilywise.Value
.mRowIndex(mIndex) = -1

End With

End Sub

Private Sub RestoreDefaultSmryPara()

dtpFromDate.Text = IIf(mFormSysVchType = cCOM_VTYPE_OPNSTK, Dtoc(sCmpBookStartDate - 1), Dtoc(DefaultEntryDate))
dtpToDate.Text = IIf(mFormSysVchType = cCOM_VTYPE_OPNSTK, Dtoc(sCmpBookStartDate - 1), Dtoc(DefaultEntryDate))
mQryEttCode = 0: mQryEfmCode = 0
txtQryEttName.Text = "": fcmbEttName.BoundText = ""
txtQryEfmName.Text = "": fcmbEfmName.BoundText = ""
optExpanded.Value = False
optDetailed.Value = True
optMonthwise.Value = False
optDatewise.Value = False
optEntitywise.Value = False
optEFamilywise.Value = False
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
    mQryEfmCode = .mEfmCode(mIndex)
fcmbEttName.BoundText = CStr(mQryEttCode): txtQryEttName.Text = fcmbEttName.Text
fcmbEfmName.BoundText = CStr(mQryEfmCode): txtQryEfmName.Text = fcmbEfmName.Text
optExpanded.Value = .mExpanded(mIndex)
optDetailed.Value = .mDetailed(mIndex)
optMonthwise.Value = .mMonthwise(mIndex)
optDatewise.Value = .mDatewise(mIndex)
optEntitywise.Value = .mEntitywise(mIndex)
optEFamilywise.Value = .mEFamilywise(mIndex)
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
mBinCode = mAccessCode
End Property

Public Property Get EntryBoundCode() As Long
EntryBoundCode = Val(mskFormBoundField.Text)
End Property

Public Property Get EntryDate() As Date
EntryDate = Ctod(dtpBinDate.Text)
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

Public Property Get EfmName() As String
EfmName = txtEfmName.Text
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
                fcmbEfmName.BoundText = CStr(mQryEfmCode)
                
                txtVoid.SetFocus
                If optMonthwise.Value = True Then
                    If mFormSysVchType = cCOM_VTYPE_OPNSTK Then
                        dtpFromDate.Text = Dtoc(MonthEndDate(DateSerial(Val(Left(.fields("BinYrMonth"), 4)), Val(Right(.fields("BinYrMonth"), 2)), 1)))
                    Else
                        dtpFromDate.Text = Dtoc(MonthStartDate(DateSerial(Val(Left(.fields("BinYrMonth"), 4)), Val(Right(.fields("BinYrMonth"), 2)), 1)))
                    End If
                    dtpToDate.Text = Dtoc(MonthEndDate(DateSerial(Val(Left(.fields("BinYrMonth"), 4)), Val(Right(.fields("BinYrMonth"), 2)), 1)))
                    optMonthwise.Value = False
                    optDatewise.Value = True
                
                ElseIf optDatewise.Value = True Then
                    dtpFromDate.Text = Dtoc(.fields("BihDate"))
                    dtpToDate.Text = Dtoc(.fields("BihDate"))
                    optDatewise.Value = False
                    optDetailed.Value = True
                
                ElseIf optEntitywise.Value = True Then
                    mQryEttCode = .fields("BihEttCode")
                    fcmbEttName.BoundText = CStr(.fields("BihEttCode"))
                    txtQryEttName.Text = fcmbEttName.Text
                    optEntitywise.Value = False
                    optDatewise.Value = True
                    
                ElseIf optEFamilywise.Value = True Then
                    mQryEfmCode = .fields("BihEfmCode")
                    fcmbEfmName.BoundText = CStr(.fields("BihEfmCode"))
                    txtQryEfmName.Text = fcmbEfmName.Text
                    optEFamilywise.Value = False
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
        txtEttName.SetFocus
    End If
End If

End Sub

Private Sub cmdOK_Click()
Dim tRecset As New ADODB.Recordset, srow As Integer, mBinICode As Long, mBinStkICode As Long, mBinItrCode As Long, mReqdRecdAmt As Double

srow = Mfgrd2.Row
mBinICode = Val(Mfgrd2.TextMatrix(srow, X2BINICODE_COL))
mBinStkICode = Val(Mfgrd2.TextMatrix(srow, X2BINSTKICODE_COL))
mBinItrCode = Val(Mfgrd2.TextMatrix(srow, X2BINITRCODE_COL))

If cmdOK.Caption = "&OK" And dtlEditCanceled = False Then
    Rem updating values in Blood-In table
    With clsBIN
    If dtlAddMode = True Then
        .ClearDtl
        .mBinBldOkState_bln = False
    Else
        .GetDtlData mBinCode, mBinICode
    End If
    .mTrnCode_lng = mBinCode
    .mTrnDtlSno_int = Val(UnMyNumFmt(mskBinSno.Text))
    .mTrnDate_dt = Ctod(dtpBinDate.Text)
    .mTrnCmpCode_int = sFinYrCmpCode
    
    .mBinStkCode_lng = mBinStkCode
    .mBinStkICode_lng = mBinStkICode
    .mBinEttCode_lng = Val(fcmbEttName.BoundText)
    .mBinEfmCode_lng = Val(fcmbEfmName.BoundText)
    .mBinBdgCode_lng = Val(fcmbBdgName.BoundText)
    .mBinBdcCode_lng = Val(fcmbBdcName.BoundText)
    .mBinNarr_str = txtBinNarr.Text
    .mBinBldRefNo_str = txtBinBldRefNo.Text
    .mBinBldExpDt_dt = Ctod(dtpBinBldExpDt.Text)
    Rem .mBinBldOkState_bln = True shifted above not be affected here, but in different module
    .mBinPckQty_dbl = Val(UnMyNumFmt(mskBinPckQty.Text))
    .mBinBldQty_dbl = Val(UnMyNumFmt(mskBinBldQty.Text))
    .mBinBdpCode_lng = 0    ''' Val(fcmbBdpName.BoundText)
    .mBinBldCode_lng = Val(mskBinBldCode.Text)
    .mBinItmCode_lng = Val(mskBinItmCode.Text)
    .mBinItrCode_lng = Val(mskBinItrCode.Text)
    .mBinRemark_str = ""
    
    If dtlAddMode = True Then
        If .AddNewDtl(mBinCode) = True Then
            mBinICode = .mTrnDtlICode_lng
        End If
    Else
        .UpdateDtl mBinCode, mBinICode
    End If
    End With
    
    Rem updating values in stock table
    With clsSTK
    If dtlAddMode = True Then
        .ClearDtl
    Else
        .GetDtlData mBinStkCode, mBinStkICode
    End If
    .mStkSno_int = Val(UnMyNumFmt(mskBinSno.Text))
    .mStkVtmCode_lng = Val(fcmbVtmName.BoundText)
    .mStkPrefix_str = txtBinPrefix.Text
    .mStkVchNo_lng = Val(UnMyNumFmt(mskBinVchNo(0).Text))
    .mStkPostfix_str = ""
    .mStkDate_dt = Ctod(dtpBinDate.Text)
    .mStkItmCode_lng = Val(mskBinItmCode.Text)
    .mStkItmRef1Name_str = txtBinBldRefNo.Text
    .mStkItmRef2Name_str = ""
    .mStkQty_dbl = ToRcptQty(Val(UnMyNumFmt(mskBinBldQty.Text)))
    .mStkNarr_str = ""
    .mStkAutoGen_bln = True
    .mStkCmpCode_int = sFinYrCmpCode
    If dtlAddMode = True Then
        If .AddNewDtl(mBinStkCode, mNewItemRef:=True) = True Then
            mBinStkICode = .mStkICode_lng
            mBinItrCode = .mStkItmRefCode_lng
        End If
    Else
        If Val(fcmbBdgName.BoundText) <> mBinBdgCode_old Or Val(fcmbBdcName.BoundText) <> mBinBdcCode_old Or Val(mskBinBldCode.Text) <> mBinBldCode_old Or Val(mskBinItmCode.Text) <> mBinItmCode_old Or txtBinBldRefNo.Text <> mBinBldRefNo_old Then
            .UpdateDtl mBinStkCode, mBinStkICode, mNewItemRef:=True
            mBinItrCode = .mStkItmRefCode_lng
        Else
            .UpdateDtl mBinStkCode, mBinStkICode
        End If
    End If
    End With
    
    Rem updating StkICode in BloodInDtl
    With clsBIN
    If mBinICode > 0 And mBinStkICode > 0 And mBinItrCode > 0 Then
        If dtlAddMode = True Then
            .GetDtlData mBinCode, mBinICode
            
            .mBinStkICode_lng = mBinStkICode
            .mBinItrCode_lng = mBinItrCode
            .UpdateDtl mBinCode, mBinICode
        Else
            If Val(fcmbBdgName.BoundText) <> mBinBdgCode_old Or Val(fcmbBdcName.BoundText) <> mBinBdcCode_old Or Val(mskBinBldCode.Text) <> mBinBldCode_old Or Val(mskBinItmCode.Text) <> mBinItmCode_old Or txtBinBldRefNo.Text <> mBinBldRefNo_old Then
                .GetDtlData mBinCode, mBinICode
                
                .mBinItrCode_lng = mBinItrCode
                .UpdateDtl mBinCode, mBinICode
            End If
        End If
    End If
    End With
    
    RefreshDatabase dbBdkDatabase
    RefreshDatabase dbComDatabase
    ChkAnyShortRcExist mBinICode
    ChkAnyMisLinkedIsuExist mBinICode
    
    With tRecset
    .open "Select * from (BloodInDtl" _
        & " Inner Join BloodGrpMst on BloodInDtl.BinBdgCode = BloodGrpMst.BdgCode)" _
        & " Inner Join BloodCompoMst on BloodInDtl.BinBdcCode = BloodCompoMst.BdcCode" _
        & " where BinCode = " & CStr(mBinCode) & " and BinICode=" & CStr(mBinICode) & "" _
        , dbBdkDatabase, adOpenKeyset, adLockOptimistic
    Rem & " Inner Join BloodPckMst on BloodInDtl.BinBdpCode = BloodPckMst.BdpCode"
    
    Mfgrd2.TextMatrix(srow, X2BINICODE_COL) = .fields("BinICode")
    Mfgrd2.TextMatrix(srow, X2BINSTKICODE_COL) = .fields("BinStkICode")
    Mfgrd2.TextMatrix(srow, X2BINSNO_COL) = ToMyNumFmt(.fields("BinSno"), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2BDGNAME_COL) = .fields("BdgName")
    Mfgrd2.TextMatrix(srow, X2BDCNAME_COL) = .fields("BdcName")
    Mfgrd2.TextMatrix(srow, X2BINBLDREFNO_COL) = .fields("BinBldRefNo")
    Mfgrd2.TextMatrix(srow, X2BINBLDEXPDT_COL) = Dtoc(.fields("BinBldExpDt"))
    Mfgrd2.TextMatrix(srow, X2BINBLDOKSTATUS_COL) = IIf(.fields("BinBldOkState") = True, "Ok", "X")
    '''Mfgrd2.TextMatrix(srow, X2BDPNAME_COL) = .fields("BdpName")
    Mfgrd2.TextMatrix(srow, X2BINPCKQTY_COL) = ToMyNumFmt(.fields("BinPckQty"), mDecimals:=-1)
    Mfgrd2.TextMatrix(srow, X2BINBLDQTY_COL) = ToMyNumFmt(.fields("BinBldQty"), mDecimals:=-1)
    Mfgrd2.TextMatrix(srow, X2BINNARR_COL) = .fields("BinNarr")
    Mfgrd2.TextMatrix(srow, X2BINBDGCODE_COL) = .fields("BinBdgCode")
    Mfgrd2.TextMatrix(srow, X2BINBDCCODE_COL) = .fields("BinBdcCode")
    '''Mfgrd2.TextMatrix(srow, X2BINBDPCODE_COL) = .fields("BinBdpCode")
    Mfgrd2.TextMatrix(srow, X2BINITRCODE_COL) = .fields("BinItrCode")
    Mfgrd2.TextMatrix(srow, X2BINBLDOKSTATE_COL) = .fields("BinBldOkState")
    Mfgrd2.TextMatrix(srow, X2BINBLDCODE_COL) = .fields("BinBldCode")
    Mfgrd2.TextMatrix(srow, X2BINITMCODE_COL) = .fields("BinItmCode")
    Mfgrd2.TextMatrix(srow, X2BINRECSTATE_COL) = .fields("BinRecState")
    
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
    txtSearch1Text_InterActiveChange Format(Ctod(dtpBinDate.Text), "yyyymmdd") + Format(mBinCode, cLONGCODESTRFMT)
ElseIf optMonthwise.Value = True Then
    txtSearch1Text_InterActiveChange Format(Ctod(dtpBinDate.Text), "yyyy") & "/" & Format(Ctod(dtpBinDate.Text), "mm")
ElseIf optDatewise.Value = True Then
    txtSearch1Text_InterActiveChange Format(Ctod(dtpBinDate.Text), "yyyymmdd")
ElseIf optEntitywise.Value = True Then
    txtSearch1Text_InterActiveChange txtEttName.Text
ElseIf optEFamilywise.Value = True Then
    txtSearch1Text_InterActiveChange txtEfmName.Text
End If

Call ShowEntryMode(False)
Mfgrd1.SetFocus

End Sub

Private Sub cmdSaveForm_GotFocus()
Dim mBinAcsPermNo As Integer, mRetryCount As Integer

txtVoid.SetFocus
cmdSaveForm.Enabled = False
If Data_Verify() = True Then
    If CanAccept() = True Then
        If GetAccessPerm(mBinAcsPermNo, mRetryCount, mFormAcsPermFileName) = True And mRetryCount = 0 Then
            If Data_NetwAuth() = True Then
                Call cmdSaveForm_Click
                Close #mBinAcsPermNo
                If mRemoteAccess = True Then
                    Me.Hide     '''Unload Me
                    Exit Sub
                Else
                    Call Mfgrd1_RowColChange
                    Data_PrintDialog "SaveEvent"
                End If
            Else
                Close #mBinAcsPermNo
            End If
        Else
            Close #mBinAcsPermNo
            AlertBox "System Busy, Try Again !!!"
            
            txtEttName.SetFocus
        End If
    Else
        txtEttName.SetFocus
    End If
End If
cmdSaveForm.Enabled = True
End Sub

Private Sub dtpBinBldExpDt_GotFocus()
FlashActiveControl dtpBinBldExpDt, True
End Sub

Private Sub dtpBinBldExpDt_LostFocus()
FlashActiveControl dtpBinBldExpDt, False
End Sub

Private Sub dtpBinBldExpDt_Validate(Cancel As Boolean)
dtpBinBldExpDt.Text = ToMyDate(dtpBinBldExpDt.Text)
If IsDate(dtpBinBldExpDt.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpBinBldExpDt.SetFocus
    Cancel = True
ElseIf Not Ctod(dtpBinBldExpDt.Text) > Ctod(dtpBinDate.Text) Then
    ErrorBox "Invalid Input !!!"
    dtpBinBldExpDt.SetFocus
    Cancel = True
End If

End Sub

Private Sub dtpBinDate_Change()
If InterActiveChange(dtpBinDate) = True Then
    mBinDateChanged = True
End If

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

Private Sub dtpBinDate_GotFocus()
FlashActiveControl dtpBinDate, True
mBinDateChanged = False
End Sub

Private Sub dtpBinDate_LostFocus()
FlashActiveControl dtpBinDate, False
End Sub

Private Sub dtpBinDate_Validate(Cancel As Boolean)
dtpBinDate.Text = ToMyDate(dtpBinDate.Text)
If mFormSysVchType = cCOM_VTYPE_OPNSTK Then
    If Ctod(dtpBinDate.Text) <> sCmpBookStartDate - 1 Then
        dtpBinDate.Text = Dtoc(sCmpBookStartDate - 1)
    End If
ElseIf IsFinYrDate(Ctod(dtpBinDate.Text)) = False Then
    ErrorBox "Invalid Input !!!"
    dtpBinDate.SetFocus
    Cancel = True
ElseIf ChkAnyPriorIsuExist() = True Then
    ErrorBox "Invalid Input !!!"
    dtpBinDate.SetFocus
    Cancel = True
    dtpBinDate.Text = Dtoc(mBinDate_old)
Else
    If mBinDateChanged = True Then
        Call ShowOldBinCodeDesc
    End If
End If

End Sub

Private Sub dtpBinTrnRefDt_GotFocus()
FlashActiveControl dtpBinTrnRefDt, True
End Sub

Private Sub dtpBinTrnRefDt_LostFocus()
FlashActiveControl dtpBinTrnRefDt, False
End Sub

Private Sub dtpBinTrnRefDt_Validate(Cancel As Boolean)
dtpBinTrnRefDt.Text = ToMyDate(dtpBinTrnRefDt.Text)

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
        lblFormHeading.Caption = "Opening Blood Stock Voucher"
        lblVchType.Caption = "Opn.Type"
        lblFormHeading.BackColor = RGB(255, 255, 255)
    Case cBDK_VTYPE_BLOODDONATE
        lblFormHeading.Caption = "Blood Donate (In) Voucher"
        lblVchType.Caption = "Vch.Type"
        lblFormHeading.BackColor = RGB(204, 255, 217)
    Case cBDK_VTYPE_BLOODFILTER
        lblFormHeading.Caption = "Blood Filter/Component (In) Voucher"
        lblVchType.Caption = "Vch.Type"
        lblFormHeading.BackColor = RGB(79, 244, 241)
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
        If mBinCode = 0 Then
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

mFormUIdFileName = "BloodIn.Uid"
mFormAcsPermFileName = "BloodIn.Acp"
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

ChkCustomForm Me, CfsFileFullPath("BloodIn.Cfs")

Call SetVoidControl(txtVoid)
txtSearch1Text.Enabled = False
frConfigure.Visible = False
frPrintCRList.Visible = False

lblLnkBagRefNo.Visible = (mFormSysVchType = cBDK_VTYPE_BLOODFILTER)
txtLnkBinTrnRefNo.Visible = (mFormSysVchType = cBDK_VTYPE_BLOODFILTER)

OpenAcDataSource dbAcDatabase
OpenStDataSource dbStDatabase
OpenGrpDataSource dbGrpDatabase
OpenComDataSource dbComDatabase
OpenBdkDataSource dbBdkDatabase

mFormVchTypeList = GetSubVchTypeList(cnn:=dbAcDatabase, mSysVchType:=mFormSysVchType, mRtnDefValue:="0")

Set clsListStru = New clsSelectQueryStructure

Set clsSTK = New clsStockJrn
Set clsSTK.dbStDatabase = dbStDatabase
Set clsSTK.dbGrpDatabase = dbGrpDatabase

Set clsAH = New clsAccountHead
Set clsAH.dbAcDatabase = dbAcDatabase
Set clsAH.dbGrpDatabase = dbGrpDatabase

Set clsBIN = New clsBdkMultiTranEntry
Set clsBIN.dbAcDatabase = dbAcDatabase
Set clsBIN.dbStDatabase = dbStDatabase
Set clsBIN.dbBdkDatabase = dbBdkDatabase
Set clsBIN.dbComDatabase = dbComDatabase
clsBIN.blnBloodInTran = True
clsBIN.Init

Set clsBDG = New clsBdkMasterEntry
Set clsBDG.dbBdkDatabase = dbBdkDatabase
clsBDG.blnBloodGrpMast = True
clsBDG.Init

Set clsBDC = New clsBdkMasterEntry
Set clsBDC.dbBdkDatabase = dbBdkDatabase
clsBDC.blnBloodCompoMast = True
clsBDC.Init

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

Set fcmbBdgName = New clsBdkFlexSearch
Set fcmbBdgName.dbBdkDatabase = dbBdkDatabase
fcmbBdgName.blnBloodGrpMastList = True
fcmbBdgName.Init

Set fcmbBdcName = New clsBdkFlexSearch
Set fcmbBdcName.dbBdkDatabase = dbBdkDatabase
fcmbBdcName.blnBloodCompoMastList = True
fcmbBdcName.Init

'''Set fcmbBdpName = New clsBdkFlexSearch
'''Set fcmbBdpName.dbBdkDatabase = dbBdkDatabase
'''fcmbBdpName.blnBloodPckMastList = True
'''fcmbBdpName.Init

Set fcmbEttName = New clsBdkFlexSearch
Set fcmbEttName.dbBdkDatabase = dbBdkDatabase
Set fcmbEttName.dbComDatabase = dbComDatabase
fcmbEttName.blnEntityMastListByName = True
fcmbEttName.Init

Set clsETT = New clsBdkMasterEntry
Set clsETT.dbBdkDatabase = dbBdkDatabase
Set clsETT.dbAcDatabase = dbAcDatabase
clsETT.blnEntityMast = True
clsETT.Init

Set fcmbEfmName = New clsBdkFlexSearch
Set fcmbEfmName.dbBdkDatabase = dbBdkDatabase
Set fcmbEfmName.dbComDatabase = dbComDatabase
fcmbEfmName.blnEFamilyMastListByName = True
fcmbEfmName.Init

Set clsEFM = New clsBdkMasterEntry
Set clsEFM.dbBdkDatabase = dbBdkDatabase
Set clsEFM.dbAcDatabase = dbAcDatabase
clsEFM.blnEFamilyMast = True
clsEFM.Init

Call RestoreDefaultSmryPara
If mRemoteAccess = True Then
    optDetailed.Value = True
    AddSmryParaLayer mClear:=True
End If

If mRemoteAccess = True Then
    datRecset.open "Select * from (BloodInHdr bih" _
      & " inner join EntityMast on bih.BihEttCode = EntityMast.EttCode)" _
      & " inner join EFamilyMast on bih.BihEfmCode = EFamilyMast.EfmCode" _
      & " where bih.BihCode = " & CStr(mBinCode) _
      & " and BihVtmCode in (" & mFormVchTypeList & ")" _
      & " order by BihDate,BihTime", dbComDatabase, adOpenKeyset, adLockOptimistic
    dtpFromDate.Text = Dtoc(datRecset.fields("BihDate"))
    dtpToDate.Text = Dtoc(datRecset.fields("BihDate"))
    AddSmryParaLayer mClear:=True
Else
    datRecset.open "Select * from (BloodInHdr bih" _
        & " inner join EntityMast on bih.BihEttCode = EntityMast.EttCode)" _
        & " inner join EFamilyMast on bih.BihEfmCode = EFamilyMast.EfmCode" _
        & " where BihVtmCode in (" & mFormVchTypeList & ")" _
        & " order by BihDate,BihTime", dbComDatabase, adOpenKeyset, adLockOptimistic
End If
Mfgrd1.FixedCols = 0
Call SmryList

Mfgrd2.FixedRows = 1: Mfgrd2.FixedCols = 0: Mfgrd2.Rows = 2: Mfgrd2.Cols = MFGRD2_COLS: SetGridAutoHeight Mfgrd2

colcnt = X2BINICODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2BINICODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BINSNO_COL: Mfgrd2.ColWidth(colcnt) = mskBinSno.Width: Mfgrd2.TextMatrix(0, colcnt) = "Sno": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BDGNAME_COL: Mfgrd2.ColWidth(colcnt) = txtBdgName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Blood Group": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2BDCNAME_COL: Mfgrd2.ColWidth(colcnt) = txtBdcName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Blood Component": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2BINNARR_COL: Mfgrd2.ColWidth(colcnt) = txtBinNarr.Width: Mfgrd2.TextMatrix(0, colcnt) = "Description": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2BINBLDREFNO_COL: Mfgrd2.ColWidth(colcnt) = txtBinBldRefNo.Width: Mfgrd2.TextMatrix(0, colcnt) = "Ref.No": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2BINBLDEXPDT_COL: Mfgrd2.ColWidth(colcnt) = dtpBinBldExpDt.Width: Mfgrd2.TextMatrix(0, colcnt) = "Exp.Dt": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2BINBLDOKSTATUS_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "Status": Mfgrd2.ColAlignment(colcnt) = 1
'''colcnt = X2BDPNAME_COL: Mfgrd2.ColWidth(colcnt) = txtBdpName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Packing": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2BINPCKQTY_COL: Mfgrd2.ColWidth(colcnt) = mskBinPckQty.Width: Mfgrd2.TextMatrix(0, colcnt) = "Pck/Bag": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BINBLDQTY_COL: Mfgrd2.ColWidth(colcnt) = mskBinBldQty.Width: Mfgrd2.TextMatrix(0, colcnt) = "Qty": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BINBDGCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2BINBDGCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BINBDCCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2BINBDCCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
'''colcnt = X2BINBDPCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2BINBDPCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BINBLDCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2BINBLDCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BINITMCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2BINITMCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BINITRCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2BINITRCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BINBLDOKSTATE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2BINBLDOKSTATE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BINSTKICODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2BINSTKICODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BINRECSTATE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2BINRECSTATE_COL": Mfgrd2.ColAlignment(colcnt) = 7
' -----------------
colcnt = X2BINSNO_COL: mskBinSno.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2BDGNAME_COL: txtBdgName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2BDCNAME_COL: txtBdcName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2BINNARR_COL: txtBinNarr.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2BINBLDREFNO_COL: txtBinBldRefNo.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2BINBLDEXPDT_COL: dtpBinBldExpDt.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
'''colcnt = X2BDPNAME_COL: txtBdpName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2BINPCKQTY_COL: mskBinPckQty.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2BINBLDQTY_COL: mskBinBldQty.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
cmdOK.Left = mskBinBldQty.Left + mskBinBldQty.Width - cmdOK.Width
' --------------------------------------
lblBinPckQtyTot.Left = mskBinPckQty.Left - frFooter.Left: lblBinPckQtyTot.Width = mskBinPckQty.Width
lblBinBldQtyTot.Left = mskBinBldQty.Left - frFooter.Left: lblBinBldQtyTot.Width = mskBinBldQty.Width

' --------------------------------------------------------
Mfgrd3.FixedRows = 1: Mfgrd3.FixedCols = 0: Mfgrd3.Rows = 2: Mfgrd3.Cols = MFGRD3_COLS: SetGridAutoHeight Mfgrd3

colcnt = X3LNKICODE_COL: Mfgrd3.ColWidth(colcnt) = 0: Mfgrd3.TextMatrix(0, colcnt) = "X3LNKICODE_COL": Mfgrd3.ColAlignment(colcnt) = 7
colcnt = X3LNKSNO_COL: Mfgrd3.ColWidth(colcnt) = 350: Mfgrd3.TextMatrix(0, colcnt) = "Sno": Mfgrd3.ColAlignment(colcnt) = 7
colcnt = X3LNKVTMNAME_COL: Mfgrd3.ColWidth(colcnt) = 1500: Mfgrd3.TextMatrix(0, colcnt) = "Voucher": Mfgrd3.ColAlignment(colcnt) = 1
colcnt = X3LNKVCHNO_COL: Mfgrd3.ColWidth(colcnt) = 1250: Mfgrd3.TextMatrix(0, colcnt) = "Vch.No": Mfgrd3.ColAlignment(colcnt) = 7
colcnt = X3LNKDATE_COL: Mfgrd3.ColWidth(colcnt) = 1250: Mfgrd3.TextMatrix(0, colcnt) = "Date": Mfgrd3.ColAlignment(colcnt) = 1
colcnt = X3LNKBDGNAME_COL: Mfgrd3.ColWidth(colcnt) = 1250: Mfgrd3.TextMatrix(0, colcnt) = "Blood Group": Mfgrd3.ColAlignment(colcnt) = 1
colcnt = X3LNKBDCNAME_COL: Mfgrd3.ColWidth(colcnt) = 1500: Mfgrd3.TextMatrix(0, colcnt) = "Blood Component": Mfgrd3.ColAlignment(colcnt) = 1
colcnt = X3LNKBLDEXPDT_COL: Mfgrd3.ColWidth(colcnt) = 1250: Mfgrd3.TextMatrix(0, colcnt) = "Exp.Dt": Mfgrd3.ColAlignment(colcnt) = 1
'''colcnt = X3LNKBDPNAME_COL: Mfgrd3.ColWidth(colcnt) = 1250: Mfgrd3.TextMatrix(0, colcnt) = "Packing": Mfgrd3.ColAlignment(colcnt) = 1
colcnt = X3LNKPCKQTY_COL: Mfgrd3.ColWidth(colcnt) = 1000: Mfgrd3.TextMatrix(0, colcnt) = "Pck/Bag": Mfgrd3.ColAlignment(colcnt) = 7
colcnt = X3LNKBLDQTY_COL: Mfgrd3.ColWidth(colcnt) = 1000: Mfgrd3.TextMatrix(0, colcnt) = "Qty": Mfgrd3.ColAlignment(colcnt) = 7
colcnt = X3LNKVTMCODE_COL: Mfgrd3.ColWidth(colcnt) = 0: Mfgrd3.TextMatrix(0, colcnt) = "X3LNKVTMCODE_COL": Mfgrd3.ColAlignment(colcnt) = 7
colcnt = X3LNKCODE_COL: Mfgrd3.ColWidth(colcnt) = 0: Mfgrd3.TextMatrix(0, colcnt) = "X3LNKCODE_COL": Mfgrd3.ColAlignment(colcnt) = 7

' --------------------------------------------------------
Mfgrd4.FixedRows = 1: Mfgrd4.FixedCols = 0: Mfgrd4.Rows = 2: Mfgrd4.Cols = MFGRD4_COLS: SetGridAutoHeight Mfgrd4

colcnt = X4LNKICODE_COL: Mfgrd4.ColWidth(colcnt) = 0: Mfgrd4.TextMatrix(0, colcnt) = "X4LNKICODE_COL": Mfgrd4.ColAlignment(colcnt) = 7
colcnt = X4LNKSNO_COL: Mfgrd4.ColWidth(colcnt) = 350: Mfgrd4.TextMatrix(0, colcnt) = "Sno": Mfgrd4.ColAlignment(colcnt) = 7
colcnt = X4LNKVTMNAME_COL: Mfgrd4.ColWidth(colcnt) = 1500: Mfgrd4.TextMatrix(0, colcnt) = "Voucher": Mfgrd4.ColAlignment(colcnt) = 1
colcnt = X4LNKVCHNO_COL: Mfgrd4.ColWidth(colcnt) = 1250: Mfgrd4.TextMatrix(0, colcnt) = "Vch.No": Mfgrd4.ColAlignment(colcnt) = 7
colcnt = X4LNKDATE_COL: Mfgrd4.ColWidth(colcnt) = 1250: Mfgrd4.TextMatrix(0, colcnt) = "Date": Mfgrd4.ColAlignment(colcnt) = 1
colcnt = X4LNKETTNAME_COL: Mfgrd4.ColWidth(colcnt) = 2000: Mfgrd4.TextMatrix(0, colcnt) = "Patient Name": Mfgrd4.ColAlignment(colcnt) = 1
colcnt = X4LNKPCKQTY_COL: Mfgrd4.ColWidth(colcnt) = 1000: Mfgrd4.TextMatrix(0, colcnt) = "Pck/Bag": Mfgrd4.ColAlignment(colcnt) = 7
colcnt = X4LNKBLDQTY_COL: Mfgrd4.ColWidth(colcnt) = 1000: Mfgrd4.TextMatrix(0, colcnt) = "Qty": Mfgrd4.ColAlignment(colcnt) = 7
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
frFormSmry.Left = (Me.Width - frFormSmry.Width) / 2: frFormSmry.Top = cmbFormEntryMode.Top + (cmbFormEntryMode.Height * 1)
frFormDtl.Left = (Me.Width - frFormDtl.Width) / 2: frFormDtl.Top = frFormSmry.Top

End Sub

Private Sub Form_Unload(Cancel As Integer)
Set clsSTK = Nothing
Set clsAH = Nothing
Set clsBIN = Nothing
Set clsETT = Nothing
Set clsEFM = Nothing
Set clsBDG = Nothing
Set clsBDC = Nothing
Set clsARA = Nothing
Set clsSTN = Nothing
Set clsVTM = Nothing
Set fcmbEttName = Nothing
Set fcmbEfmName = Nothing
Set fcmbVtmName = Nothing
Set fcmbBdgName = Nothing
Set fcmbBdcName = Nothing
'''Set fcmbBdpName = Nothing
Set clsListStru = Nothing

CloseTable datRecset, mCheckOpen:=True
CloseDataSource dbAcDatabase, mCheckOpen:=True
CloseDataSource dbStDatabase, mCheckOpen:=True
CloseDataSource dbGrpDatabase, mCheckOpen:=True
CloseDataSource dbComDatabase, mCheckOpen:=True
CloseDataSource dbBdkDatabase, mCheckOpen:=True
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
Dim mOpgVchNo As Long, mBinVchNo As Long, tRecset As ADODB.Recordset

Data_Verify = False
If FormAddEditMode = cFORM_EDITMODE And Val(mskFormBoundField.Text) < 1 Then
    ErrorBox "Invalid Key Value !!!"
    txtEttName.SetFocus
    GoTo EndSub
End If
If Val(fcmbEttName.BoundText) < 1 Or Val(fcmbEttName.BoundText) <> mBinEttCode Or (FormAddEditMode = cFORM_EDITMODE And mBinEttCode <> mBinEttCode_old) Then
    ErrorBox "Invalid Donor/Person Selection !!!"
    txtEttName.SetFocus
    GoTo EndSub
End If
If Val(fcmbEfmName.BoundText) < 1 Or Val(fcmbEfmName.BoundText) <> mBinEfmCode Or (FormAddEditMode = cFORM_EDITMODE And mBinEfmCode <> mBinEfmCode_old) Then
    ErrorBox "Invalid Donor/Person Family Selection !!!"
    txtEfmName.SetFocus
    GoTo EndSub
End If

Rem Blood-In validations
mBinVchNo = Val(UnMyNumFmt(mskBinVchNo(0).Text))
If mBinVchNo > 0 Then
    If mBinVchNo <> mBinVchNo_old Or Val(fcmbVtmName.BoundText) <> mBinVtmCode_old Or Ctod(dtpBinDate.Text) <> mBinDate_old Or FormAddEditMode = cFORM_ADDMODE Then
        If ChkIsDuplVTypeNo(dbBdkDatabase, dbAcDatabase, mTableName:="BloodInHdr", mChkFieldName:="BihVchNo", mChkFieldValue:=mBinVchNo, mKeyFieldName:="BihCode", mKeyFieldValue:=mBinCode, mVtmFieldName:="BihVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="BihCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="BihDate", mDateFieldValue:=Ctod(dtpBinDate.Text)) = True Then
            ErrorBox "Duplicate Voucher No. !!!"
            mskBinVchNo(0).SetFocus
            ' ---------------
            If FormAddEditMode = cFORM_ADDMODE Then
                mBinVchNo = GetNextVTypeNo(dbBdkDatabase, dbAcDatabase, dbComDatabase, mTableName:="BloodInHdr", mFieldName:="BihVchNo", mVtmFieldName:="BihVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="BihCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="BihDate", mDateFieldValue:=Ctod(dtpBinDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
            Else
                mBinVchNo = mBinVchNo_old
            End If
            mskBinVchNo(0).Text = ToMyNumFmt(mBinVchNo, mDecimals:=0)
            GoTo EndSub
        End If
    End If
Else
    ErrorBox "Invalid Input !!!"
    mskBinVchNo(0).SetFocus
    GoTo EndSub
End If
If IsDate(dtpBinDate.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpBinDate.SetFocus
    GoTo EndSub
ElseIf mFormSysVchType = cCOM_VTYPE_OPNSTK Then
    If Ctod(dtpBinDate.Text) <> sCmpBookStartDate - 1 Then
        dtpBinDate.Text = Dtoc(sCmpBookStartDate - 1)
    End If
ElseIf IsFinYrDate(Ctod(dtpBinDate.Text)) = False Then
    ErrorBox "Invalid Input !!!"
    dtpBinDate.SetFocus
    GoTo EndSub
ElseIf ChkAnyPriorIsuExist() = True Then
    ErrorBox "Invalid Input !!!"
    dtpBinDate.SetFocus
    dtpBinDate.Text = Dtoc(mBinDate_old)
    GoTo EndSub
End If
If TimeToMin(txtBinTime_str.Text) > cDAYMINUTES Then
    ErrorBox "Invalid Input !!!"
    txtBinTime_str.SetFocus
    GoTo EndSub
End If
Rem ------------------------------------------------
txtBinTrnRefNo.Text = ToMyString(Trim(txtBinTrnRefNo.Text))
If txtBinTrnRefNo.Text = "" Then
    ErrorBox "Invalid Input !!!"
    txtBinTrnRefNo.SetFocus
    GoTo EndSub
Else
    If mFormSysVchType = cBDK_VTYPE_BLOODDONATE Then
        Set tRecset = dbComDatabase.Execute("Select * from BloodInHdr bih inner join VTypMast vtm on bih.BihVtmCode = vtm.VtmCode where BihTrnRefNo = '" & txtBinTrnRefNo.Text & "' and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODDONATE) & " and BihDate >= #" & CStr(ToSysDate(sFinYrStartDate)) & "# and BihDate <= #" & CStr(ToSysDate(sFinYrEndDate)) & "# and BihCode <> " & CStr(mBinCode))
        With tRecset
        If .EOF = False Then
            ErrorBox "Bag No. Already Used in " & .fields("VtmName") & " No. " & CStr(.fields("BihVchNo")) & " Dated " & Dtoc(.fields("BihDate"))
            txtBinTrnRefNo.SetFocus
            CloseTable tRecset
            GoTo EndSub
        End If
        End With
        CloseTable tRecset
        
    ElseIf mFormSysVchType = cBDK_VTYPE_BLOODFILTER Then
        Set tRecset = dbComDatabase.Execute("Select * from BloodInHdr bih inner join VTypMast vtm on bih.BihVtmCode = vtm.VtmCode where BihTrnRefNo = '" & txtBinTrnRefNo.Text & "' and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODDONATE) & " order by BihDate desc")
        With tRecset
        If .EOF = True Then
            ErrorBox "Bag No. does not Exist in Blood Donate Entry !!!"
            txtBinTrnRefNo.SetFocus
            CloseTable tRecset
            GoTo EndSub
        Else
            Do While .EOF = False
                If tRecset.fields("BihEttCode") = Val(fcmbEttName.BoundText) Then
                    Exit Do
                End If
                .MoveNext
            Loop
            If .EOF = True Then
                ErrorBox "Mismatch Doner Name Selection !!!"
                txtBinTrnRefNo.SetFocus
                CloseTable tRecset
                GoTo EndSub
            End If
        End If
        End With
        CloseTable tRecset
        
    End If
End If
Set tRecset = Nothing

If ChkBldRefNoLink(mCallFromDtlAddEdit:=False) = False Then
    GoTo EndSub
End If
If IsDate(dtpBinTrnRefDt.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpBinTrnRefDt.SetFocus
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
If Not tRecset Is Nothing Then
    CloseTable tRecset, mCheckOpen:=True
End If
Exit Function

End Function

Private Function Data_NetwAuth() As Boolean
Dim mBinVchNo As Long
Data_NetwAuth = False

mBinVchNo = Val(UnMyNumFmt(mskBinVchNo(0).Text))
If mBinVchNo <> mBinVchNo_old Or Val(fcmbVtmName.BoundText) <> mBinVtmCode_old Or Ctod(dtpBinDate.Text) <> mBinDate_old Or FormAddEditMode = cFORM_ADDMODE Then
    If ChkIsDuplVTypeNo(dbBdkDatabase, dbAcDatabase, mTableName:="BloodInHdr", mChkFieldName:="BihVchNo", mChkFieldValue:=mBinVchNo, mKeyFieldName:="BihCode", mKeyFieldValue:=mBinCode, mVtmFieldName:="BihVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="BihCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="BihDate", mDateFieldValue:=Ctod(dtpBinDate.Text)) = True Then
        ErrorBox "Duplicate Voucher No. !!!"
        mskBinVchNo(0).SetFocus
        ' ---------------
        If FormAddEditMode = True Then
            mBinVchNo = GetNextVTypeNo(dbBdkDatabase, dbAcDatabase, dbComDatabase, mTableName:="BloodInHdr", mFieldName:="BihVchNo", mVtmFieldName:="BihVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="BihCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="BihDate", mDateFieldValue:=Ctod(dtpBinDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
        Else
            mBinVchNo = mBinVchNo_old
        End If
        mskBinVchNo(0).Text = ToMyNumFmt(mBinVchNo, mDecimals:=0)
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
Dim srow As Integer, mBinICode As Long, mBinStkICode As Long, mDeleteit As Boolean

srow = Mfgrd2.Row
mBinICode = Val(Mfgrd2.TextMatrix(srow, X2BINICODE_COL))
mBinStkICode = Val(Mfgrd2.TextMatrix(srow, X2BINSTKICODE_COL))

If MyDeleteKey(Shift, KeyCode, mCheckCtrlMask:=False) = True And mBinICode > 0 Then
    txtVoid.SetFocus
    If clsBIN.CanDeleteDtl(mBinCode, mBinICode) = True Then
        clsBIN.DeleteDtl mBinCode, mBinICode
        clsSTK.DeleteDtl mBinStkCode, mBinStkICode
        
        ShowDtlData mBinCode
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

srow = Mfgrd2.Row
If KeyAscii = vbKeyReturn Then
    dtlAddEditMode = True
    dtlAddMode = IsFlexNewRow(Mfgrd2, srow)
    VisibleControls True, Mfgrd2.Top + Mfgrd2.RowPos(Mfgrd2.Row)
    If dtlAddMode = True Then
        mskBinSno.Text = ToMyNumFmt(FlexNextSeqno(Mfgrd2, X2BINSNO_COL), mDecimals:=0)
        dtpBinBldExpDt.Text = Dtoc(Ctod(dtpBinDate.Text) + 1)
        mskBinPckQty.Text = ToMyNumFmt(1, mDecimals:=-1)
        mskBinBldQty.Text = ToMyNumFmt(1, mDecimals:=-1)
        ary1 = Split(txtEttName.Text & Space(1), Space(1))
        txtBinBldRefNo.Text = Left(Trim(txtBinTrnRefNo.Text) & "/" & Format(Ctod(dtpBinDate.Text), "yymmdd") & "/" & ary1(0), 25)
        Erase ary1
    Else
        mskBinICode.Text = Val(Mfgrd2.TextMatrix(srow, X2BINICODE_COL))
        mskBinStkICode.Text = Val(Mfgrd2.TextMatrix(srow, X2BINSTKICODE_COL))
        mskBinSno.Text = Mfgrd2.TextMatrix(srow, X2BINSNO_COL)
        fcmbBdgName.BoundText = Mfgrd2.TextMatrix(srow, X2BINBDGCODE_COL): txtBdgName.Text = fcmbBdgName.Text
        fcmbBdcName.BoundText = Mfgrd2.TextMatrix(srow, X2BINBDCCODE_COL): txtBdcName.Text = fcmbBdcName.Text
        txtBinNarr.Text = Mfgrd2.TextMatrix(srow, X2BINNARR_COL)
        txtBinBldRefNo.Text = Mfgrd2.TextMatrix(srow, X2BINBLDREFNO_COL)
        dtpBinBldExpDt.Text = Mfgrd2.TextMatrix(srow, X2BINBLDEXPDT_COL)
        '''fcmbBdpName.BoundText = Mfgrd2.TextMatrix(srow, X2BINBDPCODE_COL): txtBdpName.Text = fcmbBdpName.Text
        mskBinPckQty.Text = Mfgrd2.TextMatrix(srow, X2BINPCKQTY_COL)
        mskBinBldQty.Text = Mfgrd2.TextMatrix(srow, X2BINBLDQTY_COL)
        mskBinItrCode.Text = Val(Mfgrd2.TextMatrix(srow, X2BINITRCODE_COL))
        mskBinBldCode.Text = Val(Mfgrd2.TextMatrix(srow, X2BINBLDCODE_COL))
        mskBinItmCode.Text = Val(Mfgrd2.TextMatrix(srow, X2BINITMCODE_COL))
        
    End If
    txtBdgName.SetFocus
    Call ValidDtl
    
    mBinBdgCode_old = Val(fcmbBdgName.BoundText)
    mBinBdcCode_old = Val(fcmbBdcName.BoundText)
    '''mBinBdpCode_old = Val(fcmbBdpName.BoundText)
    mBinItrCode_old = Val(mskBinItrCode.Text)
    mBinBldCode_old = Val(mskBinBldCode.Text)
    mBinPckQty_old = Val(UnMyNumFmt(mskBinPckQty.Text))
    mBinItmCode_old = Val(mskBinItmCode.Text)
    mBinBldRefNo_old = txtBinBldRefNo.Text
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
Call ShowLinkTranOutDtl

End Sub

Private Sub Mfgrd3_RowColChange()
ShowActiveFlexRow Mfgrd3
Call ShowLinkTranOutDtl

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

Private Sub mskBinPckQty_GotFocus()
FlashActiveControl mskBinPckQty, True
End Sub

Private Sub mskBinPckQty_LostFocus()
FlashActiveControl mskBinPckQty, False
End Sub

Private Sub mskBinPckQty_Validate(Cancel As Boolean)
mskBinPckQty.Text = ToMyNumFmt(mskBinPckQty.Text, mDecimals:=0, mUseAbs:=True)
If Val(UnMyNumFmt(mskBinPckQty.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskBinPckQty.SetFocus
    Cancel = True
Else
    If FormAddEditMode = cFORM_ADDMODE Or dtlAddMode = True Or Val(UnMyNumFmt(mskBinPckQty.Text)) <> mBinPckQty_old Then
        Rem Call CalcBinBldQty
    End If
End If
Call ValidDtl

End Sub

Private Sub mskBinBldQty_GotFocus()
FlashActiveControl mskBinBldQty, True
End Sub

Private Sub mskBinBldQty_LostFocus()
FlashActiveControl mskBinBldQty, False
End Sub

Private Sub mskBinBldQty_Validate(Cancel As Boolean)
mskBinBldQty.Text = ToMyNumFmt(mskBinBldQty.Text, mDecimals:=0, mUseAbs:=True)
If Val(UnMyNumFmt(mskBinBldQty.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskBinBldQty.SetFocus
    Cancel = True
Else
    Rem Call CalcBinBldQty
End If
Call ValidDtl

End Sub

Private Sub mskBinVchNo_GotFocus(Index As Integer)
FlashActiveControl mskBinVchNo(Index), True
End Sub

Private Sub mskBinVchNo_LostFocus(Index As Integer)
FlashActiveControl mskBinVchNo(Index), False
End Sub

Private Sub mskBinVchNo_Validate(Index As Integer, Cancel As Boolean)
Dim mBinVchNo As Long

mBinVchNo = Val(UnMyNumFmt(mskBinVchNo(Index).Text))
If mBinVchNo < 0 And Index = 0 Then
    mBinVchNo = GetNextVTypeNo(dbBdkDatabase, dbAcDatabase, dbComDatabase, mTableName:="BloodInHdr", mFieldName:="BihVchNo", mVtmFieldName:="BihVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="BihCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="BihDate", mDateFieldValue:=Ctod(dtpBinDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
    mskBinVchNo(Index).Text = ToMyNumFmt(mBinVchNo, mDecimals:=0)
ElseIf mBinVchNo > 0 Then
    If Index = 0 Then
        If mBinVchNo <> mBinVchNo_old Or Val(fcmbVtmName.BoundText) <> mBinVtmCode_old Or Ctod(dtpBinDate.Text) <> mBinDate_old Or FormAddEditMode = cFORM_ADDMODE Then
            If ChkIsDuplVTypeNo(dbBdkDatabase, dbAcDatabase, mTableName:="BloodInHdr", mChkFieldName:="BihVchNo", mChkFieldValue:=mBinVchNo, mKeyFieldName:="BihCode", mKeyFieldValue:=mBinCode, mVtmFieldName:="BihVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="BihCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="BihDate", mDateFieldValue:=Ctod(dtpBinDate.Text)) = True Then
                ErrorBox "Duplicate Voucher No. !!!"
                Cancel = True
                mskBinVchNo(Index).SetFocus
                ' ----------
                If FormAddEditMode = cFORM_ADDMODE Then
                    mBinVchNo = GetNextVTypeNo(dbBdkDatabase, dbAcDatabase, dbComDatabase, mTableName:="BloodInHdr", mFieldName:="BihVchNo", mVtmFieldName:="BihVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="BihCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="BihDate", mDateFieldValue:=Ctod(dtpBinDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
                Else
                    mBinVchNo = mBinVchNo_old
                End If
                mskBinVchNo(Index).Text = ToMyNumFmt(mBinVchNo, mDecimals:=0)
            End If
        End If
        If Cancel = False Then
            mskBinVchNo(Index).Text = ToMyNumFmt(mBinVchNo, mDecimals:=0)
        End If
    End If
Else
    ErrorBox "Invalid Input !!!"
    mskBinVchNo(Index).SetFocus
    Cancel = True
End If

End Sub

Private Sub mskEfmRegNo_Change()
If InterActiveChange(mskEfmRegNo) = True Then
    mEfmRegNoChanged = True
End If

End Sub

Private Sub mskEfmRegNo_GotFocus()
FlashActiveControl mskEfmRegNo, True
mEfmRegNoChanged = False
End Sub

Private Sub mskEfmRegNo_LostFocus()
FlashActiveControl mskEfmRegNo, False
End Sub

Private Sub mskEfmRegNo_Validate(Cancel As Boolean)
Dim tRecset As ADODB.Recordset, mEfmRegNo As Long

mskEfmRegNo.Text = ToMyNumFmt(mskEfmRegNo.Text, mDecimals:=0, mUseAbs:=True)
mEfmRegNo = Val(UnMyNumFmt(mskEfmRegNo.Text))
If mEfmRegNoChanged = True Then
    mBinEfmCode = 0
    If mEfmRegNo > 0 And FormAddEditMode = cFORM_ADDMODE Then
        Set tRecset = New ADODB.Recordset
        With tRecset
        .open "Select * from EFamilyMast where EfmRegNo = " & CStr(mEfmRegNo) & "", dbBdkDatabase, adOpenKeyset, adLockOptimistic
        If .EOF = False Then
            mBinEfmCode = .fields("EfmCode")
        Else
            ErrorBox "Reg.No. not Found !!!"
        End If
        End With
        CloseTable tRecset
    End If
    fcmbEfmName.BoundText = CStr(mBinEfmCode): txtEfmName.Text = fcmbEfmName.Text
    ShowEFamilyData mBinEfmCode
End If
Set tRecset = Nothing

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
    mBinEttCode = 0
    If mEttRegNo > 0 And FormAddEditMode = cFORM_ADDMODE Then
        Set tRecset = New ADODB.Recordset
        With tRecset
        .open "Select * from EntityMast where EttRegNo = " & CStr(mEttRegNo) & "", dbBdkDatabase, adOpenKeyset, adLockOptimistic
        If .EOF = False Then
            mBinEttCode = .fields("EttCode")
        Else
            ErrorBox "Reg.No. not Found !!!"
        End If
        End With
        CloseTable tRecset
    End If
    fcmbEttName.BoundText = CStr(mBinEttCode): txtEttName.Text = fcmbEttName.Text
    ShowEntityData mBinEttCode
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

Private Sub optEFamilywise_GotFocus()
FlashActiveControl optEFamilywise, True
End Sub

Private Sub optEFamilywise_LostFocus()
FlashActiveControl optEFamilywise, False
End Sub

'''Private Sub txtBdpName_Change()
'''If fcmbBdpName.CallFromText_Change = False Then
'''    fcmbBdpName.CallFromText_Change = True
'''    If InterActiveChange(txtBdpName) = True Then
'''        fcmbBdpName.UserText = Array(txtBdpName.Text, txtBdpName.SelStart)
'''        fcmbBdpName.Show
'''        txtBdpName.Text = fcmbBdpName.Text
'''        If fcmbBdpName.ListSelected = True Then
'''            SendKeys "{tab}"
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
'''    If FormAddEditMode = cFORM_ADDMODE Or dtlAddMode = True Or Val(fcmbBdpName.BoundText) <> mBinBdpCode_old Then
'''        Call CalcBinBldQty
'''    End If
'''End If
'''Call ValidDtl
'''
'''End Sub

Private Sub txtEfmName_Change()
If fcmbEfmName.CallFromText_Change = False Then
    fcmbEfmName.CallFromText_Change = True
    If InterActiveChange(txtEfmName) = True Then
        fcmbEfmName.UserText = Array(txtEfmName.Text, txtEfmName.SelStart)
        fcmbEfmName.Show
        If FormAddEditMode = cFORM_ADDMODE Then
            txtEfmName.Text = fcmbEfmName.Text
        Else
            AlertBox "Prohibited in Edit Mode !!!"
            fcmbEfmName.BoundText = CStr(mBinEfmCode_old)
            txtEfmName.Text = fcmbEfmName.Text
        End If
        If fcmbEfmName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbEfmName.CallFromText_Change = False
End If

End Sub

Private Sub txtEfmName_GotFocus()
FlashActiveControl txtEfmName, True
End Sub

Private Sub txtEfmName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtEfmName_Change
End If

End Sub

Private Sub txtEfmName_LostFocus()
FlashActiveControl txtEfmName, False
End Sub

Private Sub txtEfmName_Validate(Cancel As Boolean)
If Val(fcmbEfmName.BoundText) < 1 Then
    ErrorBox "Invalid Donor/Person Family Selection !!!"
    Rem Cancel = True
    Rem txtEfmName.SetFocus
'ElseIf ChkAnyMisLinkedIsuExist() = True Then
'    ErrorBox "Invalid Linking Selection !!!"
'    Cancel = True
'    txtEfmName.SetFocus
'
'    fcmbEfmName.BoundText = CStr(mBinEfmCode_old)
'    txtEfmName.Text = fcmbEfmName.Text
ElseIf FormAddEditMode = cFORM_EDITMODE And Val(fcmbEfmName.BoundText) <> mBinEfmCode_old Then
    ErrorBox "Prohibited in Edit Mode !!!"
    txtEfmName.SetFocus
    Cancel = True
Else
    ShowEFamilyData Val(fcmbEfmName.BoundText)
End If

End Sub

Private Sub txtEttAraName_GotFocus()
FlashActiveControl txtEttAraName, True
End Sub

Private Sub txtEttAraName_LostFocus()
FlashActiveControl txtEttAraName, False
End Sub

Private Sub txtEfmAraName_GotFocus()
FlashActiveControl txtEfmAraName, True
End Sub

Private Sub txtEfmAraName_LostFocus()
FlashActiveControl txtEfmAraName, False
End Sub

Private Sub txtBinNarr_GotFocus()
FlashActiveControl txtBinNarr, True
End Sub

Private Sub txtBinNarr_LostFocus()
FlashActiveControl txtBinNarr, False
End Sub

Private Sub txtBinNarr_Validate(Cancel As Boolean)
txtBinNarr.Text = ToMyWord(txtBinNarr.Text, mFilterStr:=False)
End Sub

Private Sub txtBinBldRefNo_GotFocus()
FlashActiveControl txtBinBldRefNo, True
End Sub

Private Sub txtBinBldRefNo_LostFocus()
FlashActiveControl txtBinBldRefNo, False
End Sub

Private Sub txtBinBldRefNo_Validate(Cancel As Boolean)
txtBinBldRefNo.Text = ToMyString(Trim(txtBinBldRefNo.Text))
If Trim(txtBinBldRefNo.Text) = "" Then
    ErrorBox "Invalid Input !!!"
    txtBinBldRefNo.SetFocus
    Cancel = True
Else
    If dtlAddMode = False And txtBinBldRefNo.Text <> mBinBldRefNo_old Then
        AlertBox "Item Reference No. Changed !!!"
    End If
    If ChkBldRefNoLink(mCallFromDtlAddEdit:=True) = False Then
        txtBinBldRefNo.SetFocus
        Cancel = True
    End If
End If
Call ValidDtl

End Sub

Private Sub txtBinTrnRefNo_GotFocus()
FlashActiveControl txtBinTrnRefNo, True
End Sub

Private Sub txtBinTrnRefNo_LostFocus()
FlashActiveControl txtBinTrnRefNo, False
End Sub

Private Sub txtBinTrnRefNo_Validate(Cancel As Boolean)
Dim tRecset As ADODB.Recordset

txtBinTrnRefNo.Text = ToMyString(Trim(txtBinTrnRefNo.Text))
If txtBinTrnRefNo.Text = "" Then
    ErrorBox "Invalid Input !!!"
    txtBinTrnRefNo.SetFocus
    Cancel = True
Else
    If mFormSysVchType = cBDK_VTYPE_BLOODDONATE Then
        Set tRecset = dbComDatabase.Execute("Select * from BloodInHdr bih inner join VTypMast vtm on bih.BihVtmCode = vtm.VtmCode where BihTrnRefNo = '" & txtBinTrnRefNo.Text & "' and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODDONATE) & " and BihDate >= #" & CStr(ToSysDate(sFinYrStartDate)) & "# and BihDate <= #" & CStr(ToSysDate(sFinYrEndDate)) & "# and BihCode <> " & CStr(mBinCode))
        With tRecset
        If .EOF = False Then
            ErrorBox "Bag No. Already Used in " & .fields("VtmName") & " No. " & CStr(.fields("BihVchNo")) & " Dated " & Dtoc(.fields("BihDate"))
            txtBinTrnRefNo.SetFocus
            Cancel = True
        End If
        End With
        CloseTable tRecset
        
    ElseIf mFormSysVchType = cBDK_VTYPE_BLOODFILTER Then
        Set tRecset = dbComDatabase.Execute("Select * from BloodInHdr bih inner join VTypMast vtm on bih.BihVtmCode = vtm.VtmCode where BihTrnRefNo = '" & txtBinTrnRefNo.Text & "' and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODDONATE) & " order by BihCode desc")
        With tRecset
        If .EOF = True Then
            ErrorBox "Bag No. does not Exist in Blood Donate Entry !!!"
            txtBinTrnRefNo.SetFocus
            Cancel = True
        Else
            Do While .EOF = False
                If tRecset.fields("BihEttCode") = Val(fcmbEttName.BoundText) Then
                    Exit Do
                End If
                .MoveNext
            Loop
            If .EOF = True Then
                ErrorBox "Mismatch Doner Name Selection !!!"
                txtBinTrnRefNo.SetFocus
                Cancel = True
            End If
        End If
        End With
        CloseTable tRecset
        
    End If
End If
Set tRecset = Nothing

End Sub

Private Sub txtBihRemark_GotFocus()
FlashActiveControl txtBihRemark, True
End Sub

Private Sub txtBihRemark_LostFocus()
FlashActiveControl txtBihRemark, False
End Sub

Private Sub txtBihRemark_Validate(Cancel As Boolean)
txtBihRemark.Text = ToMyWord(txtBihRemark.Text, mFilterStr:=False)
End Sub

Private Sub txtBinTime_str_GotFocus()
FlashActiveControl txtBinTime_str, True
End Sub

Private Sub txtBinTime_str_LostFocus()
FlashActiveControl txtBinTime_str, False
End Sub

Private Sub txtBinTime_str_Validate(Cancel As Boolean)
txtBinTime_str.Text = MinToTime(TimeToMin(txtBinTime_str.Text))
If TimeToMin(txtBinTime_str.Text) > cDAYMINUTES Then
    ErrorBox "Invalid Input !!!"
    txtBinTime_str.SetFocus
    Cancel = True
End If

End Sub

Private Sub txtLnkBinTrnRefNo_GotFocus()
FlashActiveControl txtLnkBinTrnRefNo, True
End Sub

Private Sub txtLnkBinTrnRefNo_LostFocus()
FlashActiveControl txtLnkBinTrnRefNo, False
End Sub

Private Sub txtLnkBinTrnRefNo_Validate(Cancel As Boolean)
Dim tRecset As ADODB.Recordset

If FormAddEditMode = cFORM_ADDMODE And Mfgrd2.Rows = (Mfgrd2.FixedRows + 1) Then
    txtLnkBinTrnRefNo.Text = ToMyString(Trim(txtLnkBinTrnRefNo.Text))
    If txtLnkBinTrnRefNo.Text <> "" Then
        Set tRecset = dbBdkDatabase.Execute("Select * from BloodInHdr where BihTrnRefNo = '" & txtLnkBinTrnRefNo.Text & "' order by BihDate desc")
        If tRecset.EOF = False Then
            fcmbEttName.BoundText = CStr(tRecset.fields("BihEttCode"))
            txtEttName.Text = fcmbEttName.Text
            ShowEntityData Val(fcmbEttName.BoundText)
            
            fcmbEfmName.BoundText = CStr(tRecset.fields("BihEfmCode"))
            txtEfmName.Text = fcmbEfmName.Text
            ShowEFamilyData Val(fcmbEfmName.BoundText)
            
            txtBinTrnRefNo.Text = txtLnkBinTrnRefNo.Text
        End If
        CloseTable tRecset
    End If
End If
Set tRecset = Nothing

End Sub

Private Sub txtQryEfmName_Change()
If fcmbEfmName.CallFromText_Change = False Then
    fcmbEfmName.CallFromText_Change = True
    If InterActiveChange(txtQryEfmName) = True Then
        fcmbEfmName.UserText = Array(txtQryEfmName.Text, txtQryEfmName.SelStart)
        fcmbEfmName.Show
        txtQryEfmName.Text = fcmbEfmName.Text
        mQryEfmCode = Val(fcmbEfmName.BoundText)
        If fcmbEfmName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbEfmName.CallFromText_Change = False
End If

End Sub

Private Sub txtQryEfmName_GotFocus()
FlashActiveControl txtQryEfmName, True
End Sub

Private Sub txtQryEfmName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtQryEfmName_Change
ElseIf MyAddNewKey(Shift, KeyCode) = True Then
    Rem not required
End If

End Sub

Private Sub txtQryEfmName_LostFocus()
FlashActiveControl txtQryEfmName, False
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
    Rem Call ShowOldOpgListByOpgNo show here all Blood-In details
End If

End Sub

Private Sub txtVtmName_LostFocus(Index As Integer)
FlashActiveControl txtVtmName(Index), False
End Sub

Private Sub txtVtmName_Validate(Index As Integer, Cancel As Boolean)
Dim mBinVchNo As Long

If Val(fcmbVtmName.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    txtVtmName(Index).SetFocus
    Cancel = True
Else
    If Index = 0 Then
        If Val(fcmbVtmName.BoundText) <> mBinVtmCode_old Or Ctod(dtpBinDate.Text) <> mBinDate_old Or FormAddEditMode = cFORM_ADDMODE Then
            mBinVchNo = GetNextVTypeNo(dbBdkDatabase, dbAcDatabase, dbComDatabase, mTableName:="BloodInHdr", mFieldName:="BihVchNo", mVtmFieldName:="BihVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="BihCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="BihDate", mDateFieldValue:=Ctod(dtpBinDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
            mskBinVchNo(Index).Text = ToMyNumFmt(mBinVchNo, mDecimals:=0)
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
            fcmbEttName.BoundText = CStr(mBinEttCode_old)
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
    ErrorBox "Invalid Donor/Person Selection !!!"
    Rem Cancel = True
    Rem txtEttName.SetFocus
''ElseIf ChkAnyMisLinkedIsuExist() = True Then
''    ErrorBox "Invalid Linking Selection !!!"
''    Cancel = True
''    txtEttName.SetFocus
''
''    fcmbEttName.BoundText = CStr(mBinEttCode_old)
''    txtEttName.Text = fcmbEttName.Text
ElseIf FormAddEditMode = cFORM_EDITMODE And Val(fcmbEttName.BoundText) <> mBinEttCode_old Then
    ErrorBox "Prohibited in Edit Mode !!!"
    txtEttName.SetFocus
    Cancel = True
Else
    ShowEntityData Val(fcmbEttName.BoundText)
End If

End Sub

Private Sub ShowEntityData(ByVal mEttCode As Long)
Dim tRecset As New ADODB.Recordset

mBinEttCode = 0
mskEttRegNo.Text = 0
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
    mBinEttCode = mEttCode
    mskEttRegNo.Text = ToMyNumFmt(.fields("EttRegNo"), mDecimals:=0)
    txtEttAddr.Text = .fields("EttAddr")
    txtEttAraName.Text = .fields("AraName")
    txtEttStnName.Text = .fields("StnName")
    txtEttTelNo.Text = .fields("EttTelNo")
    txtEttSMSNo.Text = .fields("EttSmsNo")
End If
End With
CloseTable tRecset
Rem Call ShowOldBinCodeDesc
Call ShowLinkTranInDtl

End Sub

Private Sub ShowEFamilyData(ByVal mEfmCode As Long)
Dim tRecset As New ADODB.Recordset

mBinEfmCode = 0
txtEfmAddr.Text = ""
txtEfmAraName.Text = ""
txtEfmStnName.Text = ""
txtEfmTelNo.Text = ""
txtEfmSMSNo.Text = ""

With tRecset
.open "Select * from (EFamilyMast efm" _
    & " inner join AreaMast ara on efm.EfmAraCode = ara.AraCode)" _
    & " inner join StsnMast stn on efm.EfmStnCode = stn.StnCode" _
    & " where efm.EfmCode = " & CStr(mEfmCode) & "" _
    , dbComDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    mBinEfmCode = mEfmCode
    mskEfmRegNo.Text = ToMyNumFmt(.fields("EfmRegNo"), mDecimals:=0)
    txtEfmAddr.Text = .fields("EfmAddr")
    txtEfmAraName.Text = .fields("AraName")
    txtEfmStnName.Text = .fields("StnName")
    txtEfmTelNo.Text = .fields("EfmTelNo")
    txtEfmSMSNo.Text = .fields("EfmSmsNo")
End If
End With
CloseTable tRecset

End Sub

Private Sub Data_AddEvent()

If CanUserAddOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If clsBIN.BeginTran(0) = False Then
    Exit Sub
ElseIf clsSTK.BeginStock(0) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_ADDMODE

clsBIN.ClearHdr: clsBIN.ClearDtl
clsSTK.ClearHdr

mBinCode = clsBIN.ActiveTrnCode
mBinStkCode = clsSTK.ActiveStkCode

ShowBinData mBinCode
ShowStkData mBinStkCode

Rem restoring user editing features
Call ShowBinDefData

Rem old values
Call StoreBinOldData
Call StoreStkOldData

Call ShowEntryMode(True)
txtLnkBinTrnRefNo.Locked = False
If mFormSysVchType = cBDK_VTYPE_BLOODFILTER Then
    txtLnkBinTrnRefNo.SetFocus
Else
    mskEttRegNo.SetFocus
End If

End Sub

Private Sub Data_EditEvent()

If CanUserEditOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If clsBIN.BeginTran(datRecset.fields("BihCode")) = False Then
    Exit Sub
ElseIf clsSTK.BeginStock(datRecset.fields("BihStkCode")) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_EDITMODE

With datRecset
mBinCode = .fields("BihCode")
mBinStkCode = .fields("BihStkCode")

End With

ShowBinData mBinCode
ShowStkData mBinStkCode

Rem old values
Call StoreBinOldData
Call StoreStkOldData

Call ShowEntryMode(True)
txtLnkBinTrnRefNo.Locked = True
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

Private Sub ShowBinData(ByVal mBinCode As Long)
With clsBIN
.GetHdrData mBinCode

mskFormBoundField.Text = mBinCode
txtLnkBinTrnRefNo.Text = ""
mskEttRegNo.Text = 0: mskEfmRegNo.Text = 0
fcmbEttName.BoundText = CStr(.mBihEttCode_lng)
fcmbEfmName.BoundText = CStr(.mBihEfmCode_lng)
txtEttName.Text = fcmbEttName.Text
txtEfmName.Text = fcmbEfmName.Text
fcmbVtmName.BoundText = CStr(.mTrnVtmCode_lng): txtVtmName(0).Text = fcmbVtmName.Text
txtBinPrefix.Text = .mTrnPrefix_str
mskBinVchNo(0).Text = ToMyNumFmt(.mTrnVchNo_lng, mDecimals:=0)
dtpBinDate.Text = Dtoc(.mTrnDate_dt)
txtBinTime_str.Text = MinToTime(.mBihTime_lng)
txtBinTrnRefNo.Text = .mBihTrnRefNo_str
dtpBinTrnRefDt.Text = Dtoc(.mBihTrnRefDt_dt)
txtBihRemark.Text = .mBihRemark_str

ShowEntityData .mBihEttCode_lng
ShowEFamilyData .mBihEfmCode_lng

mskEttRegNo.Locked = (mBinCode > 0)
txtEttName.Locked = (mBinCode > 0)
mskEfmRegNo.Locked = (mBinCode > 0)
txtEfmName.Locked = (mBinCode > 0)

Rem Call ShowOldBinCodeDesc
End With

ShowDtlData mBinCode
Rem Call ShowLinkTranInDtl

End Sub

Private Sub ShowStkData(ByVal mBinStkCode As Long)
mskBinStkCode.Text = mBinStkCode

End Sub

Private Sub ShowBinDefData()
Dim tRecset As New ADODB.Recordset, t1Recset As New ADODB.Recordset, mBinVchNo As Long

With tRecset
.open "Select top 1 * from BloodInHdr where BihVtmCode IN (" & mFormVchTypeList & ") and BihCmpCode = " & CStr(sFinYrCmpCode) & " order by BihCode desc", dbBdkDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    dtpBinDate.Text = Dtoc(DefaultEntryDate)            ''' Dtoc(.fields("BihDate"))
    fcmbVtmName.BoundText = CStr(.fields("BihVtmCode"))
    fcmbEfmName.BoundText = CStr(.fields("BihEfmCode")): txtEfmName.Text = fcmbEfmName.Text
Else
    dtpBinDate.Text = Dtoc(DefaultEntryDate)
    With t1Recset
    .open "Select top 1 * from VTypMast where VtmSysCode=" & CStr(mFormSysVchType) & "", dbAcDatabase, adOpenKeyset, adLockOptimistic
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
    If Ctod(dtpBinDate.Text) <> sCmpBookStartDate - 1 Then
        dtpBinDate.Text = Dtoc(sCmpBookStartDate - 1)
    End If
End If

txtVtmName(0).Text = fcmbVtmName.Text
txtBinTime_str.Text = MinToTime(TimeToMin(DateTime.Time$))

mBinVchNo = GetNextVTypeNo(dbBdkDatabase, dbAcDatabase, dbComDatabase, mTableName:="BloodInHdr", mFieldName:="BihVchNo", mVtmFieldName:="BihVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="BihCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="BihDate", mDateFieldValue:=Ctod(dtpBinDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
mskBinVchNo(0).Text = ToMyNumFmt(mBinVchNo, mDecimals:=0)
dtpBinTrnRefDt.Text = dtpBinDate.Text

End Sub

Private Sub StoreBinOldData()
mBinCode_old = mBinCode
mBinEttCode_old = Val(fcmbEttName.BoundText)
mBinEfmCode_old = Val(fcmbEfmName.BoundText)
mBinDate_old = Ctod(dtpBinDate.Text)
mBinTime_old = TimeToMin(txtBinTime_str.Text)
mBinVtmCode_old = Val(fcmbVtmName.BoundText)
mBinVchNo_old = Val(UnMyNumFmt(mskBinVchNo(0).Text))

End Sub

Private Sub StoreStkOldData()
mBinStkCode_old = mBinStkCode

End Sub

Private Sub ShowDtlData(ByVal mBinCode As Long)
Dim srow As Integer, tRecset As New ADODB.Recordset, mColCnt As Integer

srow = 1
Mfgrd2.Rows = 2

With tRecset
.open "Select * from (BloodInDtl" _
    & " inner join BloodGrpMst on BloodInDtl.BinBdgCode = BloodGrpMst.BdgCode)" _
    & " inner join BloodCompoMst on BloodInDtl.BinBdcCode = BloodCompoMst.BdcCode" _
    & " where BinCode = " & CStr(mBinCode) & " order by BinSno" _
    , dbBdkDatabase, adOpenKeyset, adLockOptimistic
Rem & " inner join BloodPckMst on BloodInDtl.BinBdpCode = BloodPckMst.BdpCode"
If .RecordCount > 0 Then
    Do While .EOF = False
        If InList(.fields("BinRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
            
            Mfgrd2.TextMatrix(srow, X2BINICODE_COL) = .fields("BinICode")
            Mfgrd2.TextMatrix(srow, X2BINSTKICODE_COL) = .fields("BinStkICode")
            Mfgrd2.TextMatrix(srow, X2BINSNO_COL) = ToMyNumFmt(.fields("BinSno"), mDecimals:=0)
            Mfgrd2.TextMatrix(srow, X2BDGNAME_COL) = .fields("BdgName")
            Mfgrd2.TextMatrix(srow, X2BDCNAME_COL) = .fields("BdcName")
            Mfgrd2.TextMatrix(srow, X2BINBLDREFNO_COL) = .fields("BinBldRefNo")
            Mfgrd2.TextMatrix(srow, X2BINBLDEXPDT_COL) = Dtoc(.fields("BinBldExpDt"))
            Mfgrd2.TextMatrix(srow, X2BINBLDOKSTATUS_COL) = IIf(.fields("BinBldOkState") = True, "Ok", "X")
            '''Mfgrd2.TextMatrix(srow, X2BDPNAME_COL) = .fields("BdpName")
            Mfgrd2.TextMatrix(srow, X2BINPCKQTY_COL) = ToMyNumFmt(.fields("BinPckQty"), mDecimals:=-1)
            Mfgrd2.TextMatrix(srow, X2BINBLDQTY_COL) = ToMyNumFmt(.fields("BinBldQty"), mDecimals:=-1)
            Mfgrd2.TextMatrix(srow, X2BINNARR_COL) = .fields("BinNarr")
            Mfgrd2.TextMatrix(srow, X2BINBDGCODE_COL) = .fields("BinBdgCode")
            Mfgrd2.TextMatrix(srow, X2BINBDCCODE_COL) = .fields("BinBdcCode")
            '''Mfgrd2.TextMatrix(srow, X2BINBDPCODE_COL) = .fields("BinBdpCode")
            Mfgrd2.TextMatrix(srow, X2BINITRCODE_COL) = .fields("BinItrCode")
            Mfgrd2.TextMatrix(srow, X2BINBLDOKSTATE_COL) = .fields("BinBldOkState")
            Mfgrd2.TextMatrix(srow, X2BINBLDCODE_COL) = .fields("BinBldCode")
            Mfgrd2.TextMatrix(srow, X2BINITMCODE_COL) = .fields("BinItmCode")
            Mfgrd2.TextMatrix(srow, X2BINRECSTATE_COL) = .fields("BinRecState")
            
            Mfgrd2.Rows = Mfgrd2.Rows + 1
            srow = srow + 1
        Else
            If InList(.fields("BinRecState"), Array(cREC_CANCELED, cREC_DELETED)) = False Then
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

With clsBIN
If FormAddEditMode = cFORM_ADDMODE Then
    .ClearHdr
Else
    .GetHdrData mBinCode
End If
.mTrnDate_dt = Ctod(dtpBinDate.Text)
.mTrnVtmCode_lng = Val(fcmbVtmName.BoundText)
.mTrnPrefix_str = txtBinPrefix.Text
.mTrnVchNo_lng = Val(UnMyNumFmt(mskBinVchNo(0).Text))
.mTrnPostfix_str = ""
.mTrnCmpCode_int = sFinYrCmpCode

.mBihStkCode_lng = mBinStkCode
.mBihTime_lng = TimeToMin(txtBinTime_str.Text)
.mBihEttCode_lng = Val(fcmbEttName.BoundText)
.mBihEfmCode_lng = Val(fcmbEfmName.BoundText)
.mBihTrnRefNo_str = txtBinTrnRefNo.Text
.mBihTrnRefDt_dt = Ctod(dtpBinTrnRefDt.Text)
.mBihPckQty_dbl = Val(UnMyNumFmt(lblBinPckQtyTot.Caption))
.mBihBldQty_dbl = Val(UnMyNumFmt(lblBinBldQtyTot.Caption))
.mBihRemark_str = txtBihRemark.Text

If FormAddEditMode = cFORM_ADDMODE Then
    If .AddNewHdr() = True Then
        mskFormBoundField.Text = .mTrnCode_lng
        mBinCode = .mTrnCode_lng
    End If
Else
    .UpdateHdr mBinCode
End If
If .mTrnCode_lng > 0 Then   ' updated successfully
    With clsSTK
    If FormAddEditMode = cFORM_ADDMODE Then
        .ClearHdr
    Else
        .GetHdrData mBinStkCode
    End If
    .mShrVtmCode_lng = Val(fcmbVtmName.BoundText)
    .mShrPrefix_str = txtBinPrefix.Text
    .mShrVchNo_lng = Val(UnMyNumFmt(mskBinVchNo(0).Text))
    .mShrPostfix_str = ""
    .mShrDate_dt = Ctod(dtpBinDate.Text)
    .mShrQty_dbl = Val(UnMyNumFmt(lblBinBldQtyTot.Caption))
    .mShrValue_dbl = 0
    .mShrNarr_str = "Automated Blood-In Entry"
    .mShrAutoGen_bln = True
    .mShrCmpCode_int = sFinYrCmpCode
    If FormAddEditMode = cFORM_ADDMODE Then
        If .AddNewHdr() = True Then
            mskBinStkCode.Text = .mShrCode_lng
            mBinStkCode = .mShrCode_lng
        End If
    Else
        .UpdateHdr mBinStkCode
    End If
    If .mShrCode_lng > 0 Then
        If FormAddEditMode = cFORM_ADDMODE Then
            clsBIN.GetHdrData mBinCode
            clsBIN.mBihStkCode_lng = mBinStkCode
            
            dbBdkDatabase.BeginTrans
            dbBdkDatabase.Execute "Update BloodInHdr set BihStkCode = " & CStr(mBinStkCode) & " where BihCode=" & CStr(mBinCode)
            dbBdkDatabase.Execute "Update BloodInDtl set BinStkCode = " & CStr(mBinStkCode) & " where BinCode=" & CStr(mBinCode)
            dbBdkDatabase.CommitTrans
        End If
        clsBIN.UpdateTran mBinCode
        clsBIN.EndTran mBinCode
        
        .CommitStock mBinStkCode
        .EndStock mBinStkCode
        
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

If clsBIN.mTrnCode_lng > 0 Then   ' updated successfully
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

mBinCode = datRecset.fields("BihCode")
mBinStkCode = datRecset.fields("BihStkCode")
mRecAbsPos = datRecset.AbsolutePosition

If clsBIN.CanDeleteTran(mBinCode) = True Then
    txtVoid.SetFocus
    If clsBIN.BeginTran(mBinCode) = True And clsSTK.BeginStock(mBinStkCode) = True Then
        clsBIN.DeleteTran mBinCode
        clsBIN.UpdateTran mBinCode
        clsBIN.EndTran mBinCode
        
        clsSTK.DeleteStock mBinStkCode
        clsSTK.CommitStock mBinStkCode
        clsSTK.EndStock mBinStkCode
        
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
clsBIN.CancelTran mBinCode
clsBIN.EndTran mBinCode

clsSTK.CancelStock mBinStkCode
clsSTK.EndStock mBinStkCode

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
RefreshDatabase dbAcDatabase
RefreshDatabase dbGrpDatabase
RefreshDatabase dbComDatabase
clsListStru.Clear

If optMonthwise.Value = True Or optDatewise.Value = True Or optEntitywise.Value = True Or optEFamilywise.Value = True Then
    If optMonthwise.Value = True Then
        clsListStru.AddFields mExpr:="BinYrMonth", mAttrib:=cFAT_SYSTEM
        clsListStru.AddFields mExpr:="BinMnYear", mTitle:="Month", mShowItem:=True, mAlign:=flexAlignLeftCenter, mWidth:=2000
        clsListStru.AddFields mExpr:="BinCount", mTitle:="Count", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="BinPckQty_sum", mTitle:="Bag", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="BinBldQty_sum", mTitle:="Qty", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        
        datRecset.open "Select format(BihDate,'yyyy/MM') as BinYrMonth" _
         & ",Count(BihCode) as BinCount" _
         & ",Sum(BihPckQty) as BinPckQty_sum" _
         & ",Sum(BihBldQty) as BinBldQty_sum" _
         & " from BloodInHdr" _
         & " where BihDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and BihCode > 0 and BihVtmCode in (" & mFormVchTypeList & ")" _
         & IIf(mQryEttCode > 0, " and BihEttCode = " & CStr(mQryEttCode), "") _
         & IIf(mQryEfmCode > 0, " and BihEfmCode = " & CStr(mQryEfmCode), "") _
         & " group by format(BihDate,'yyyy/MM')" _
         & " order by format(BihDate,'yyyy/MM')" _
         , dbComDatabase, adOpenKeyset, adLockReadOnly

    ElseIf optDatewise.Value = True Then
        clsListStru.AddFields mExpr:="BinDateYMD", mAttrib:=cFAT_SYSTEM
        clsListStru.AddFields mExpr:="BinDate", mTitle:="Date", mShowItem:=True, mAlign:=flexAlignLeftCenter, mWidth:=2000
        clsListStru.AddFields mExpr:="BinCount", mTitle:="Count", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="BinPckQty_sum", mTitle:="Bag", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="BinBldQty_sum", mTitle:="Qty", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        
        datRecset.open "Select BihDate" _
         & ",Count(BihCode) as BinCount" _
         & ",Sum(BihPckQty) as BinPckQty_sum" _
         & ",Sum(BihBldQty) as BinBldQty_sum" _
         & " from BloodInHdr" _
         & " where BihDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and BihCode > 0 and BihVtmCode in (" & mFormVchTypeList & ")" _
         & IIf(mQryEttCode > 0, " and BihEttCode = " & CStr(mQryEttCode), "") _
         & IIf(mQryEfmCode > 0, " and BihEfmCode = " & CStr(mQryEfmCode), "") _
         & " group by BihDate" _
         & " order by BihDate" _
         , dbComDatabase, adOpenKeyset, adLockReadOnly
        
    ElseIf optEntitywise.Value = True Then
        clsListStru.AddFields mExpr:="EttName", mTitle:="Donor/Person Name", mShowItem:=True, mAlign:=flexAlignLeftCenter, mWidth:=3000
        clsListStru.AddFields mExpr:="BinCount", mTitle:="Count", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="BinPckQty_sum", mTitle:="Bag", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="BinBldQty_sum", mTitle:="Qty", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        
        datRecset.open "Select ett.EttName,hdr.BihEttCode" _
         & ",Count(BihCode) as BinCount" _
         & ",Sum(BihPckQty) as BinPckQty_sum" _
         & ",Sum(BihBldQty) as BinBldQty_sum" _
         & " from BloodInHdr hdr inner join EntityMast ett on hdr.BihEttCode = ett.EttCode" _
         & " where BihDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and BihCode > 0 and BihVtmCode in (" & mFormVchTypeList & ")" _
         & IIf(mQryEttCode > 0, " and BihEttCode = " & CStr(mQryEttCode), "") _
         & IIf(mQryEfmCode > 0, " and BihEfmCode = " & CStr(mQryEfmCode), "") _
         & " group by ett.EttName,hdr.BihEttCode" _
         & " order by ett.EttName,hdr.BihEttCode" _
         , dbComDatabase, adOpenKeyset, adLockReadOnly
    
    ElseIf optEFamilywise.Value = True Then
        clsListStru.AddFields mExpr:="EfmName", mTitle:="Entity Family Name", mShowItem:=True, mAlign:=flexAlignLeftCenter, mWidth:=3000
        clsListStru.AddFields mExpr:="BinCount", mTitle:="Count", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="BinPckQty_sum", mTitle:="Bag", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="BinBldQty_sum", mTitle:="Qty", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        
        datRecset.open "Select ett.EfmName,hdr.BihEfmCode" _
         & ",Count(BihCode) as BinCount" _
         & ",Sum(BihPckQty) as BinPckQty_sum" _
         & ",Sum(BihBldQty) as BinBldQty_sum" _
         & " from BloodInHdr hdr inner join EFamilyMast efm on hdr.BihEfmCode = efm.EfmCode" _
         & " where BihDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and BihCode > 0 and BihVtmCode in (" & mFormVchTypeList & ")" _
         & IIf(mQryEttCode > 0, " and BihEttCode = " & CStr(mQryEttCode), "") _
         & IIf(mQryEfmCode > 0, " and BihEfmCode = " & CStr(mQryEfmCode), "") _
         & " group by efm.EfmName,hdr.BihEfmCode" _
         & " order by efm.EfmName,hdr.BihEfmCode" _
         , dbComDatabase, adOpenKeyset, adLockReadOnly
    
    End If
    
ElseIf optDetailed.Value = True Then
    clsListStru.AddFields mExpr:="tBinSmryId", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="BinCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="VtmName", mTitle:="Voucher", mAlign:=flexAlignLeftCenter, mWidth:=1500, mShowItem:=True
    clsListStru.AddFields mExpr:="BinVchNo", mTitle:="Vchr.No", mAlign:=flexAlignRightCenter, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="BinDate", mTitle:="Date", mAlign:=flexAlignLeftCenter, mWidth:=1300, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="EttCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="EttName", mTitle:="Donor/Person Name", mAlign:=flexAlignLeftCenter, mWidth:=2500, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="EfmCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="EfmName", mTitle:="Donor/Person Family Name", mAlign:=flexAlignLeftCenter, mWidth:=2500, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="BinTrnRefNo", mTitle:="Ref.No", mAlign:=flexAlignRightCenter, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="BinPckQty", mTitle:="Bag", mAlign:=flexAlignRightCenter, mWidth:=1250, mShowItem:=False
    clsListStru.AddFields mExpr:="BinBldQty", mTitle:="Qty", mAlign:=flexAlignRightCenter, mWidth:=1250, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="EttAddr", mTitle:="Address", mAlign:=flexAlignLeftCenter, mWidth:=2000, mShowItem:=True
    clsListStru.AddFields mExpr:="EttAraName", mTitle:="Area", mAlign:=flexAlignLeftCenter, mWidth:=1500, mShowItem:=True
    clsListStru.AddFields mExpr:="EttStnName", mTitle:="Station", mAlign:=flexAlignLeftCenter, mWidth:=1500, mShowItem:=True
    
    datRecset.open "Select hdr.*,ett.*,efm.*,ara.AraName,stn.StnName,vtm.VtmName" _
     & ",format(BihDate,'yyyymmdd')+format(BihCode,'" & cLONGCODESTRFMT & "') as tBinSmryId" _
     & " from ((BloodInHdr hdr inner join ((EntityMast ett" _
     & " inner join AreaMast ara on ett.EttAraCode = ara.AraCode)" _
     & " inner join StsnMast stn on ett.EttStnCode = stn.StnCode)" _
     & " on hdr.BihEttCode = ett.EttCode)" _
     & " inner join EFamilyMast efm on hdr.BihEfmCode = efm.EfmCode)" _
     & " inner join VTypMast vtm on hdr.BihVtmCode = vtm.VtmCode" _
     & " where BihDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & IIf(mRemoteAccess = True, " and BihCode = " & CStr(mBinCode) & "", "") _
     & " and BihCode > 0 and BihVtmCode in (" & mFormVchTypeList & ")" _
     & IIf(mQryEttCode > 0, " and BihEttCode = " & CStr(mQryEttCode), "") _
     & IIf(mQryEfmCode > 0, " and BihEfmCode = " & CStr(mQryEfmCode), "") _
     & " order by BihDate,BihCode" _
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
Rem If .RecordCount > 0 Then
If IsValidRec(tRecset) = True Then
    Do While .EOF = False
        If optMonthwise.Value = True Or optDatewise.Value = True Or optEntitywise.Value = True Or optEFamilywise.Value = True Then
            If optMonthwise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BinYrMonth")) = .fields("BinYrMonth")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BinMnYear")) = MonthName(Val(Right(.fields("BinYrMonth"), 2))) & "-" & Left(.fields("BinYrMonth"), 4)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BinCount")) = ToMyNumFmt(.fields("BinCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BinPckQty_sum")) = ToMyNumFmt(.fields("BinPckQty_sum"), mDecimals:=-1)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BinBldQty_sum")) = ToMyNumFmt(.fields("BinBldQty_sum"), mDecimals:=-1)
                
            ElseIf optDatewise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BinDateYMD")) = Format(.fields("BihDate"), "yyyymmdd")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BinDate")) = Dtoc(.fields("BihDate"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BinCount")) = ToMyNumFmt(.fields("BinCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BinPckQty_sum")) = ToMyNumFmt(.fields("BinPckQty_sum"), mDecimals:=-1)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BinBldQty_sum")) = ToMyNumFmt(.fields("BinBldQty_sum"), mDecimals:=-1)
                
            ElseIf optEntitywise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttName")) = .fields("EttName")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BinCount")) = ToMyNumFmt(.fields("BinCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BinPckQty_sum")) = ToMyNumFmt(.fields("BinPckQty_sum"), mDecimals:=-1)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BinBldQty_sum")) = ToMyNumFmt(.fields("BinBldQty_sum"), mDecimals:=-1)
                
            ElseIf optEFamilywise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EfmName")) = .fields("EfmName")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BinCount")) = ToMyNumFmt(.fields("BinCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BinPckQty_sum")) = ToMyNumFmt(.fields("BinPckQty_sum"), mDecimals:=-1)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BinBldQty_sum")) = ToMyNumFmt(.fields("BinBldQty_sum"), mDecimals:=-1)
                
            End If
        
        ElseIf optDetailed.Value = True Then
            Rem clsARA.GetData .fields("EttAraCode")
            Rem clsSTN.GetData .fields("EttStnCode")
            Rem clsVTM.GetData .fields("BihVtmCode")
            
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("tBinSmryId")) = .fields("tBinSmryId")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BinCode")) = .fields("BihCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("VtmName")) = .fields("VtmName")   '''  clsVTM.mName_str
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BinVchNo")) = .fields("BihVchNo")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BinDate")) = Dtoc(.fields("BihDate"))
            ' ------------------------------------
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BinTrnRefNo")) = .fields("BihTrnRefNo")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BinPckQty")) = ToMyNumFmt(.fields("BihPckQty"), mDecimals:=-1)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BinBldQty")) = ToMyNumFmt(.fields("BihBldQty"), mDecimals:=-1)
            ' ------------------------------------
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttCode")) = .fields("BihEttCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttName")) = .fields("EttName")
            ' ------------------------------------
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EfmCode")) = .fields("BihEfmCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EfmName")) = .fields("EfmName")
            ' ------------------------------------
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttAddr")) = .fields("EttAddr")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttAraName")) = .fields("AraName")        ''' clsARA.mName_str
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
    fcmbEttName.BoundText = CStr(mQryEttCode)
    fcmbEfmName.BoundText = CStr(mQryEfmCode)
    txtQryEttName.Text = fcmbEttName.Text
    txtQryEfmName.Text = fcmbEfmName.Text
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
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("tBinSmryId"), mText
    ElseIf optMonthwise.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("BinYrMonth"), mText
    ElseIf optDatewise.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("BinDateYMD"), mText
    ElseIf optEntitywise.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("EttName"), mText
    ElseIf optEFamilywise.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("EfmName"), mText
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
            SendKeys "{tab}"
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
    If FormAddEditMode = cFORM_ADDMODE Or dtlAddMode = True Or Val(fcmbBdgName.BoundText) <> mBinBdgCode_old Then
        Call ChkBldnItmCode
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
            SendKeys "{tab}"
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
    If FormAddEditMode = cFORM_ADDMODE Or dtlAddMode = True Or Val(fcmbBdcName.BoundText) <> mBinBdcCode_old Then
        Call ChkBldnItmCode
        mskBinBldQty.Text = GetValueFromTableCol(cnn:=dbBdkDatabase, mTableName:="BloodCompoMst", mColumnName:="BdcBldQty", mFilterCond:="BdcCode = " & CStr(fcmbBdcName.BoundText), mRtnDefValue:=0)
        '''fcmbBdpName.BoundText = GetValueFromTableCol(cnn:=dbBdkDatabase, mTableName:="BloodCompoMst", mColumnName:="BdcBdpCode", mFilterCond:="BdcCode = " & CStr(fcmbBdcName.BoundText), mRtnDefValue:=0)
        '''txtBdpName.Text = fcmbBdpName.Text
        Rem Call CalcBinBldQty
        If Val(mskBinItmCode.Text) < 1 Then
            AlertBox "Blood Group and Component Combination  does not Exist !!!"
        Else
            Call ChkBldExpDate
        End If
    End If
End If
Call ValidDtl

End Sub

Private Sub ChkBldExpDate()
Dim tRecset As New ADODB.Recordset

With tRecset
.open "Select * from BloodCompoMst where BdcCode = " & CStr(Val(fcmbBdcName.BoundText)) & "", dbBdkDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    dtpBinBldExpDt.Text = Dtoc(Ctod(dtpBinDate.Text) + .fields("BdcExpDays"))
End If
End With
CloseTable tRecset

End Sub

Private Sub txtEttStnName_GotFocus()
FlashActiveControl txtEttStnName, True
End Sub

Private Sub txtEttStnName_LostFocus()
FlashActiveControl txtEttStnName, False
End Sub

'''Private Sub CalcBinBldQty()
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
'''mskBinBldQty.Text = ToMyNumFmt(mBdpQty * Val(UnMyNumFmt(mskBinPckQty.Text)), mDecimals:=0)
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
mskBinBldCode.Text = CStr(mBldCode)
mskBinItmCode.Text = CStr(mItmCode)
Set tRecset = Nothing

End Sub

'''Private Sub ChkBldPacking()
'''Dim tRecset As ADODB.Recordset, mBdgCode As Long, mBdcCode As Long, mBdpCode As Long
'''
'''mBdpCode = 0
'''mBdcCode = Val(fcmbBdcName.BoundText)
'''If mBdcCode > 0 Then
'''    Set tRecset = New ADODB.Recordset
'''    With tRecset
'''    .open "Select * from BloodCompoMst where BdcCode = " & CStr(mBdcCode) & "", dbBdkDatabase, adOpenKeyset, adLockOptimistic
'''    If .EOF = False Then
'''        mBdpCode = .fields("BdpCode")
'''    End If
'''    End With
'''    CloseTable tRecset
'''End If
'''mskBinItmCode.Text = CStr(mBdpCode)
'''Set tRecset = Nothing
'''
'''End Sub

Private Sub ShowOldBinCodeDesc()
Dim tRecset As New ADODB.Recordset, mBinDate As Date, mEttCode As Long

mEttCode = Val(fcmbEttName.BoundText)
mBinDate = Ctod(dtpBinDate.Text)
With tRecset
'If FormAddEditMode = cFORM_ADDMODE Then
'    .Open "Select top 1 bih.*,vtm.VtmName from BloodInHdr bih inner join VTypMast vtm on bih.BihVtmCode=vtm.VtmCode where bih.BihEttCode=" & CStr(mEttCode) & " order by bih.BihDate Desc", dbComDatabase, adOpenKeyset, adLockOptimistic
'Else
    .open "Select top 1 bih.*,vtm.VtmName from BloodInHdr bih" _
        & " inner join VTypMast vtm on bih.BihVtmCode = vtm.VtmCode" _
        & " where bih.BihEttCode = " & CStr(mEttCode) _
        & " and bih.BihCode <> " & CStr(mBinCode) _
        & " and bih.BihDate <= #" & ToSysDate(mBinDate) & "#" _
        & " and bih.BihVtmCode IN (" & mFormVchTypeList & ")" _
        & " order by bih.BihDate Desc", dbComDatabase, adOpenKeyset, adLockOptimistic
'End If
If .EOF = False Then
    'lblOldBinCodeDesc.Caption = RTrim(.fields("VtmName")) & " No.:" & CStr(.fields("BihVchNo")) & " Dated:" & Dtoc(.fields("BihDate")) & " (" & CStr(mBinDate - .fields("BihDate")) & " Days Past)"
    If mBinDate > DateAdd("M", 3, .fields("BihDate")) Then
        'lblOldBinCodeDesc.BackColor = vbGreen
    Else
        'lblOldBinCodeDesc.BackColor = vbRed
    End If
Else
    'lblOldBinCodeDesc.Caption = "# First Time #"       ''' & CStr(mEttCode)
    'lblOldBinCodeDesc.BackColor = vbWindowBackground
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
    mskBinSno.Top = mRowPos
    txtBdgName.Top = mRowPos
    txtBdcName.Top = mRowPos
    txtBinNarr.Top = mRowPos
    txtBinBldRefNo.Top = mRowPos
    dtpBinBldExpDt.Top = mRowPos
    '''txtBdpName.Top = mRowPos
    mskBinPckQty.Top = mRowPos
    mskBinBldQty.Top = mRowPos
    cmdOK.Top = mRowPos + mskBinBldQty.Height
End If

mskBinICode.Text = 0
mskBinStkICode.Text = 0
mskBinSno.Text = 0
txtBdgName.Text = "": fcmbBdgName.BoundText = ""
txtBdcName.Text = "": fcmbBdcName.BoundText = ""
txtBinNarr.Text = ""
mskBinBldCode.Text = 0
mskBinItmCode.Text = 0
mskBinItrCode.Text = 0
txtBinBldRefNo.Text = ""
dtpBinBldExpDt.Text = ""
'''txtBdpName.Text = "": fcmbBdpName.BoundText = ""
mskBinPckQty.Text = ToMyNumFmt(0, mDecimals:=-1)
mskBinBldQty.Text = ToMyNumFmt(0, mDecimals:=-1)

Call ValidDtl

mskBinSno.Visible = mShowItem
txtBdgName.Visible = mShowItem
txtBdcName.Visible = mShowItem
txtBinNarr.Visible = mShowItem
txtBinBldRefNo.Visible = mShowItem
dtpBinBldExpDt.Visible = mShowItem
'''txtBdpName.Visible = mShowItem
mskBinPckQty.Visible = mShowItem
mskBinBldQty.Visible = mShowItem
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
mDataOk = (Val(fcmbEttName.BoundText) > 0 And Val(fcmbEttName.BoundText) = mBinEttCode And Val(fcmbEfmName.BoundText) > 0 And Val(fcmbEfmName.BoundText) = mBinEfmCode And Val(UnMyNumFmt(mskBinSno.Text)) > 0 And Val(fcmbBdgName.BoundText) > 0 And Val(fcmbBdcName.BoundText) > 0 And Val(mskBinBldCode.Text) > 0 And Val(mskBinItmCode.Text) > 0 And Trim(txtBinBldRefNo.Text) <> "" And IsDate(dtpBinBldExpDt.Text) = True And Ctod(dtpBinBldExpDt.Text) > Ctod(dtpBinDate.Text) And IIf(dtlAddMode = True, True, Val(mskBinItrCode.Text) > 0 And Val(mskBinICode.Text) > 0 And Val(mskBinStkICode.Text) > 0) And Val(UnMyNumFmt(mskBinPckQty.Text)) >= 0 And Val(UnMyNumFmt(mskBinBldQty.Text)) >= 0) ''' And Val(fcmbBdpName.BoundText) > 0

cmdOK.Caption = IIf(mDataOk = True, "&OK", "&Cancel")
cmdOK.BackColor = IIf(mDataOk = True, &H80FF80, &H8080FF)
End Sub

Private Sub CalcFtrTotal(Optional ByVal mCalcBalOnly As Boolean = False)
Dim mDtlPckQtyTot As Double, mDtlBldQtyTot As Double

mDtlPckQtyTot = FlexColSum(Mfgrd2, X2BINPCKQTY_COL)
mDtlBldQtyTot = FlexColSum(Mfgrd2, X2BINBLDQTY_COL)

lblBinPckQtyTot.Caption = ToMyNumFmt(mDtlPckQtyTot, mDecimals:=-1)
lblBinBldQtyTot.Caption = ToMyNumFmt(mDtlBldQtyTot, mDecimals:=-1)

End Sub

Private Sub ShowLinkTranInDtl()
Dim tRecset As New ADODB.Recordset, mEttCode As Long, srow As Integer, mColCnt As Integer

mEttCode = Val(fcmbEttName.BoundText)
With tRecset
.open "Select bin.*,bih.*,bdg.BdgName,bdc.BdcName,vtm.VtmName from (((BloodInDtl bin" _
  & " inner join BloodInHdr bih on bin.BinCode = bih.BihCode)" _
  & " inner join BloodGrpMst bdg on bin.BinBdgCode = bdg.BdgCode)" _
  & " inner join BloodCompoMst bdc on bin.BinBdcCode = bdc.BdcCode)" _
  & " inner join VTypMast vtm on bih.BihVtmCode = vtm.VtmCode" _
  & " where bin.BinEttCode = " & CStr(mEttCode) _
  & " and bin.BinCode <> " & CStr(mBinCode) _
  & " order by bin.BinDate Desc,bih.BihTime desc,bin.BinCode,bin.BinSno", dbComDatabase, adOpenKeyset, adLockOptimistic
  Rem & " and bin.BinCode <> " & CStr(mBinCode)
  Rem & " and bih.BihDate <= #" & ToSysDate(mBinDate) & "#"
  Rem & " and bih.BihVtmCode IN (" & mFormVchTypeList & ")"
  Rem & " inner join BloodPckMst bdp on bin.BinBdpCode = bdp.BdpCode)"

srow = 1
Mfgrd3.Rows = 2
If .EOF = False Then
    Do While .EOF = False
        If InList(.fields("BinRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
            Mfgrd3.TextMatrix(srow, X3LNKICODE_COL) = .fields("BinICode")
            Mfgrd3.TextMatrix(srow, X3LNKSNO_COL) = ToMyNumFmt(.fields("BinSno"), mDecimals:=0)
            Mfgrd3.TextMatrix(srow, X3LNKVTMNAME_COL) = .fields("VtmName")
            Mfgrd3.TextMatrix(srow, X3LNKVCHNO_COL) = ToMyNumFmt(.fields("BihVchNo"), mDecimals:=0)
            Mfgrd3.TextMatrix(srow, X3LNKDATE_COL) = Dtoc(.fields("BinDate"))
            Mfgrd3.TextMatrix(srow, X3LNKBDGNAME_COL) = .fields("BdgName")
            Mfgrd3.TextMatrix(srow, X3LNKBDCNAME_COL) = .fields("BdcName")
            Mfgrd3.TextMatrix(srow, X3LNKBLDEXPDT_COL) = Dtoc(.fields("BinBldExpDt"))
            '''Mfgrd3.TextMatrix(srow, X3LNKBDPNAME_COL) = .fields("BdpName")
            Mfgrd3.TextMatrix(srow, X3LNKPCKQTY_COL) = ToMyNumFmt(.fields("BinPckQty"), mDecimals:=-1)
            Mfgrd3.TextMatrix(srow, X3LNKBLDQTY_COL) = ToMyNumFmt(.fields("BinBldQty"), mDecimals:=-1)
            Mfgrd3.TextMatrix(srow, X3LNKVTMCODE_COL) = .fields("BihVtmCode")
            Mfgrd3.TextMatrix(srow, X3LNKCODE_COL) = .fields("BinCode")
            
            Mfgrd3.Rows = Mfgrd3.Rows + 1
            srow = srow + 1
        Else
            If InList(.fields("BinRecState"), Array(cREC_CANCELED, cREC_DELETED)) = False Then
                ErrorBox Me.Name & "_ShowLinkTranInDtl_#3095_[Invalid Record Status]"
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

'''Dim tRecset As New ADODB.Recordset, mLinkTranStr As String
'''
'''mLinkTranStr = ""
'''
'''With tRecset
'''.open "Select * from ((((BloodOutDtl bou" _
'''    & " inner join BloodOutHdr boh on bou.BouCode = boh.BohCode)" _
'''    & " inner join BloodGrpMst bdg on bou.BouBdgCode = bdg.BdgCode)" _
'''    & " inner join BloodCompoMst bdc on bou.BouBdcCode = bdc.BdcCode)" _
'''    & " inner join BloodMast bld on bou.BouBldCode = bld.BldCode)" _
'''    & " inner join VTypMast vtm on boh.BohVtmCode = vtm.VtmCode" _
'''    & " where BouBinCode = " & CStr(mBinCode) _
'''    & " order by BouDate,BouSno" _
'''    , dbComDatabase, adOpenKeyset, adLockOptimistic
'''If .EOF = False Then
'''    Do While .EOF = False
'''        mLinkTranStr = mLinkTranStr & .fields("VtmName") & " No." & CStr(.fields("BohVchNo")) & " Dt." & Dtoc(.fields("BohDate")) & " Blood Group " & .fields("BdgName") & ", Blood Component " & .fields("BdcName") & " Rf." & .fields("BouBldRefNo") & " Pck/Bld.Qty." & ToMyNumFmt(.fields("BouPckQty"), mDecimals:=-1) & "/" & ToMyNumFmt(.fields("BouBldQty"), mDecimals:=-1) & vbCrLf
'''
'''        .MoveNext
'''    Loop
'''End If
'''End With
'''CloseTable tRecset
'''
'''txtLinkTranDesc.Text = mLinkTranStr
'''
'''If .EOF = False Then
'''    lblOldBinCodeDesc.Caption = RTrim(.fields("VtmName")) & " No.:" & CStr(.fields("BihVchNo")) & " Dated:" & Dtoc(.fields("BihDate")) & " (" & CStr(mBinDate - .fields("BihDate")) & " Days Past)"
'''    If mBinDate > DateAdd("M", 3, .fields("BihDate")) Then
'''        lblOldBinCodeDesc.BackColor = vbGreen
'''    Else
'''        lblOldBinCodeDesc.BackColor = vbRed
'''    End If
'''Else
'''    lblOldBinCodeDesc.Caption = "# First Time #"       ''' & CStr(mEttCode)
'''    lblOldBinCodeDesc.BackColor = vbWindowBackground
'''End If
''End With
''CloseTable tRecset

End Sub

Private Sub ShowLinkTranOutDtl()
Dim tRecset As New ADODB.Recordset, mLinkCode As Long, mLinkICode As Long, srow As Integer, mColCnt As Integer

srow = Mfgrd3.Row
mLinkCode = Val(Mfgrd3.TextMatrix(srow, X3LNKCODE_COL))
mLinkICode = Val(Mfgrd3.TextMatrix(srow, X3LNKICODE_COL))

With tRecset
.open "Select * from (((((BloodOutDtl bou" _
    & " inner join BloodOutHdr boh on bou.BouCode = boh.BohCode)" _
    & " inner join BloodGrpMst bdg on bou.BouBdgCode = bdg.BdgCode)" _
    & " inner join BloodCompoMst bdc on bou.BouBdcCode = bdc.BdcCode)" _
    & " inner join BloodMast bld on bou.BouBldCode = bld.BldCode)" _
    & " inner join EntityMast ett on bou.BouEttCode = ett.EttCode)" _
    & " inner join VTypMast vtm on boh.BohVtmCode = vtm.VtmCode" _
    & " where BouBinCode = " & CStr(mLinkCode) & " and BouBinICode = " & CStr(mLinkICode) _
    & " order by BouDate desc,BouCode desc,BouSno" _
    , dbComDatabase, adOpenKeyset, adLockOptimistic
Rem & " inner join BloodPckMst bdp on bou.BouBdpCode = bdp.BdpCode)"

srow = 1
Mfgrd4.Rows = 2
If .EOF = False Then
    Do While .EOF = False
        If InList(.fields("BouRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
            Mfgrd4.TextMatrix(srow, X4LNKICODE_COL) = .fields("BouICode")
            Mfgrd4.TextMatrix(srow, X4LNKSNO_COL) = ToMyNumFmt(.fields("BouSno"), mDecimals:=0)
            Mfgrd4.TextMatrix(srow, X4LNKVTMNAME_COL) = .fields("VtmName")
            Mfgrd4.TextMatrix(srow, X4LNKVCHNO_COL) = ToMyNumFmt(.fields("BohVchNo"), mDecimals:=0)
            Mfgrd4.TextMatrix(srow, X4LNKDATE_COL) = Dtoc(.fields("BouDate"))
            Mfgrd4.TextMatrix(srow, X4LNKETTNAME_COL) = .fields("EttName")
            Mfgrd4.TextMatrix(srow, X4LNKPCKQTY_COL) = ToMyNumFmt(.fields("BouPckQty"), mDecimals:=-1)
            Mfgrd4.TextMatrix(srow, X4LNKBLDQTY_COL) = ToMyNumFmt(.fields("BouBldQty"), mDecimals:=-1)
            Mfgrd4.TextMatrix(srow, X4LNKBDGNAME_COL) = .fields("BdgName")
            Mfgrd4.TextMatrix(srow, X4LNKBDCNAME_COL) = .fields("BdcName")
            '''Mfgrd4.TextMatrix(srow, X4LNKBDPNAME_COL) = .fields("BdpName")
            Mfgrd4.TextMatrix(srow, X4LNKVTMCODE_COL) = .fields("BohVtmCode")
            Mfgrd4.TextMatrix(srow, X4LNKCODE_COL) = .fields("BouCode")
            
            Mfgrd4.Rows = Mfgrd4.Rows + 1
            srow = srow + 1
        Else
            If InList(.fields("BouRecState"), Array(cREC_CANCELED, cREC_DELETED)) = False Then
                ErrorBox Me.Name & "_ShowLinkTranOutDtl_#3274_[Invalid Record Status]"
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

Private Function ChkAnyPriorIsuExist() As Boolean
Dim tRecset As New ADODB.Recordset

ChkAnyPriorIsuExist = False

With tRecset
.open "Select top 1 * from ((BloodInDtl" _
    & " inner join BloodInHdr on BloodInDtl.BinCode = BloodInHdr.BihCode)" _
    & " inner join BloodOutDtl on BloodInDtl.BinICode = BloodOutDtl.BouBinICode)" _
    & " Inner Join BloodOutHdr on BloodOutDtl.BouCode = BloodOutHdr.BohCode" _
    & " where BinCode = " & CStr(mBinCode) _
    & " and BouDate < #" & CStr(ToSysDate(Ctod(dtpBinDate.Text))) & "#" _
    & " order by BouDate,BouCode" _
    , dbBdkDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    clsVTM.GetData .fields("BohVtmCode")
    ErrorBox "Prior Blood Issue Exist !!!" _
        & vbCrLf & clsVTM.mName_str & " No." & CStr(.fields("BohVchNo")) & " Dated " & Dtoc(.fields("BohDate")) & ""
    ChkAnyPriorIsuExist = True
End If
End With
CloseTable tRecset

End Function

Private Function ChkAnyMisLinkedIsuExist(Optional ByVal mBinICode) As Boolean
Dim tRecset As New ADODB.Recordset, mMisLinkedDesc As String

ChkAnyMisLinkedIsuExist = False
mMisLinkedDesc = ""

With tRecset
.open "Select top 1 * from ((BloodInDtl" _
    & " inner join BloodInHdr on BloodInDtl.BinCode = BloodInHdr.BihCode)" _
    & " inner join BloodOutDtl on BloodInDtl.BinICode = BloodOutDtl.BouBinICode)" _
    & " Inner Join BloodOutHdr on BloodOutDtl.BouCode = BloodOutHdr.BohCode" _
    & " where BinCode = " & CStr(mBinCode) & IIf(IsMissing(mBinICode) = False, " and BinICode = " & CStr(mBinICode), "") _
    & " and (BouBdgCode <> BinBdgCode or BouBdcCode <> BinBdcCode  or BouBldCode <> BinBldCode or BouItmCode <> BinItmCode or BouItrCode <> BinItrCode or BouBldRefNo <> BinBldRefNo)" _
    & " order by BohDate,BohCode" _
    , dbBdkDatabase, adOpenKeyset, adLockOptimistic
    Rem BohEttCode <> " & CStr(Val(fcmbEttName.BoundText)) & " or

If .EOF = False Then
    clsVTM.GetData .fields("BohVtmCode")
    'If .fields("BohEttCode") <> Val(fcmbEttName.BoundText) Then
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
        mMisLinkedDesc = mMisLinkedDesc & "<Master Item Name>"
    End If
    If .fields("BouItrCode") <> .fields("BinItrCode") Then
        mMisLinkedDesc = mMisLinkedDesc & "<Blood Ref.Code>"
    End If
    If .fields("BouBldRefNo") <> .fields("BinBldRefNo") Then
        mMisLinkedDesc = mMisLinkedDesc & "<Blood Ref.No.>"
    End If
    ErrorBox "Mis-Linked Blood Issue Exist !!!" _
        & vbCrLf & clsVTM.mName_str & " No." & CStr(.fields("BohVchNo")) & " Dated " & Dtoc(.fields("BohDate")) _
        & vbCrLf & "Alteration made in " _
        & vbCrLf & mMisLinkedDesc
    ChkAnyMisLinkedIsuExist = True
End If
End With
CloseTable tRecset

End Function

Private Function ChkAnyShortRcExist(Optional ByVal mBinICode) As Boolean
Dim tRecset As New ADODB.Recordset

ChkAnyShortRcExist = False

''''With tRecset
''''.open "Select top 1 * from (((" _
''''    & "Select BinICode,BdgCode,BdcCode,BldCode,ItmCode,ItrCode,BldRefNo,sum(PckQty) as PckQty_sum,sum(BldQty) as BldQty_sum from (" _
''''    & "Select BinICode,BinBdgCode as BdgCode,BinBdcCode as BdcCode,BinBldCode as BldCode,BinItmCode as ItmCode,BinItrCode as ItrCode,BinBldRefNo as BldRefNo,BinPckQty as PckQty,BinBldQty as BldQty from BloodInDtl" _
''''    & " inner join BloodInHdr on BloodInDtl.BinCode = BloodInHdr.BihCode" _
''''    & " where BinCode = " & CStr(mBinCode) & IIf(IsMissing(mBinICode) = False, " and BinICode = " & CStr(mBinICode), "") _
''''    & " and BinRecState IN (" & CStr(cREC_ADDED) & "," & CStr(cREC_EDITED) & "," & CStr(cREC_UNCHANGED) & ")" _
''''    & " Union All " _
''''    & "Select BouBinICode as BinICode,BouBdgCode as BdgCode,BouBdcCode as BdcCode,BouBldCode as BldCode,BouItmCode as ItmCode,BouItrCode as ItrCode,BouBldRefNo as BldRefNo,(BouPckQty*-1) as PckQty,(BouBldQty*-1) as BldQty from (BloodOutDtl" _
''''    & " left join BloodOutHdr on BloodOutDtl.BouCode = BloodOutHdr.BohCode)" _
''''    & " inner join BloodInDtl on BloodOutDtl.BouBinICode = BloodInDtl.BinICode" _
''''    & " where BouBinCode = " & CStr(mBinCode) & IIf(IsMissing(mBinICode) = False, " and BouBinICode = " & CStr(mBinICode), "") _
''''    & " and BouRecState <> " & CStr(cREC_CANCELED) _
''''    & ")" _
''''    & " group by BinICode,BdgCode,BdcCode,BldCode,ItmCode,ItrCode,BldRefNo" _
''''    & " order by BinICode,BdgCode,BdcCode,BldCode,ItmCode,ItrCode,BldRefNo" _
''''    & ") as a" _
''''    & " inner join BloodGrpMst on a.BdgCode = BloodGrpMst.BdgCode)" _
''''    & " inner join BloodCompoMst on a.BdcCode = BloodCompoMst.BdcCode)" _
''''    & " inner join BloodMast on a.BldCode = BloodMast.BldCode" _
''''    & " where PckQty_sum < 0 or BldQty_sum < 0" _
''''    , dbComDatabase, adOpenKeyset, adLockOptimistic
''''If .EOF = False Then
''''    ErrorBox "Blood-In going Short for Item " & vbCrLf & .fields("BdgName") & ", " & .fields("BdcName") & " Ref.No." & CStr(.fields("BldRefNo")) & " by Pck/Bld.Qty " & CStr(.fields("PckQty_sum")) & "/" & CStr(.fields("BldQty_sum"))
''''    ChkAnyShortRcExist = True
''''End If
''''End With
''''CloseTable tRecset

Rem first checking for any created blood not going in minus
With tRecset
.open "Select top 1 * from (((" _
    & "Select BinICode,BdgCode,BdcCode,BldCode,ItmCode,ItrCode,BldRefNo,sum(PckQty) as PckQty_sum,sum(BldQty) as BldQty_sum from (" _
    & "Select BinICode,BinBdgCode as BdgCode,BinBdcCode as BdcCode,BinBldCode as BldCode,BinItmCode as ItmCode,BinItrCode as ItrCode,BinBldRefNo as BldRefNo,BinPckQty as PckQty,BinBldQty as BldQty from BloodInDtl" _
    & " inner join BloodInHdr on BloodInDtl.BinCode = BloodInHdr.BihCode" _
    & " where BinCode = " & CStr(mBinCode) & IIf(IsMissing(mBinICode) = False, " and BinICode = " & CStr(mBinICode), "") _
    & " and BinPckQty > 0 and BinBldQty > 0" _
    & " and BinRecState IN (" & CStr(cREC_ADDED) & "," & CStr(cREC_EDITED) & "," & CStr(cREC_UNCHANGED) & ")" _
    & " Union All " _
    & "Select BouBinICode as BinICode,BouBdgCode as BdgCode,BouBdcCode as BdcCode,BouBldCode as BldCode,BouItmCode as ItmCode,BouItrCode as ItrCode,BouBldRefNo as BldRefNo,(BouPckQty*-1) as PckQty,(BouBldQty*-1) as BldQty from (BloodOutDtl" _
    & " left join BloodOutHdr on BloodOutDtl.BouCode = BloodOutHdr.BohCode)" _
    & " inner join BloodInDtl on BloodOutDtl.BouBinICode = BloodInDtl.BinICode" _
    & " where BouBinCode = " & CStr(mBinCode) & IIf(IsMissing(mBinICode) = False, " and BouBinICode = " & CStr(mBinICode), "") _
    & " and BouRecState <> " & CStr(cREC_CANCELED) _
    & ")" _
    & " group by BinICode,BdgCode,BdcCode,BldCode,ItmCode,ItrCode,BldRefNo" _
    & " order by BinICode,BdgCode,BdcCode,BldCode,ItmCode,ItrCode,BldRefNo" _
    & ") as a" _
    & " inner join BloodGrpMst on a.BdgCode = BloodGrpMst.BdgCode)" _
    & " inner join BloodCompoMst on a.BdcCode = BloodCompoMst.BdcCode)" _
    & " inner join BloodMast on a.BldCode = BloodMast.BldCode" _
    & " where PckQty_sum < 0 or BldQty_sum < 0" _
    , dbComDatabase, adOpenKeyset, adLockOptimistic
    Rem & " and BinPckQty > 0 and BinBldQty > 0"
If .EOF = False Then
    ErrorBox "Blood-In going Short for Item " & vbCrLf & .fields("BdgName") & ", " & .fields("BdcName") & " Ref.No." & CStr(.fields("BldRefNo")) & " by Pck/Bld.Qty " & CStr(.fields("PckQty_sum")) & "/" & CStr(.fields("BldQty_sum"))
    ChkAnyShortRcExist = True
End If
End With
CloseTable tRecset

Rem second checking for dummy minus not going excess
If ChkAnyShortRcExist = False Then
    With tRecset
    .open "Select top 1 * from (((" _
        & "Select BdgCode,BdcCode,BldCode,ItmCode,ItrCode,BldRefNo,sum(PckQty) as PckQty_sum,sum(BldQty) as BldQty_sum from (" _
        & "Select BinBdgCode as BdgCode,BinBdcCode as BdcCode,BinBldCode as BldCode,BinItmCode as ItmCode,BinItrCode as ItrCode,BinBldRefNo as BldRefNo,BinPckQty as PckQty,BinBldQty as BldQty from BloodInDtl" _
        & " inner join BloodInHdr on BloodInDtl.BinCode = BloodInHdr.BihCode" _
        & " where BinCode = " & CStr(mBinCode) & IIf(IsMissing(mBinICode) = False And True = False, " and BinICode = " & CStr(mBinICode), "") _
        & " and BinRecState IN (" & CStr(cREC_ADDED) & "," & CStr(cREC_EDITED) & "," & CStr(cREC_UNCHANGED) & ")" _
        & " Union All " _
        & "Select BouBdgCode as BdgCode,BouBdcCode as BdcCode,BouBldCode as BldCode,BouItmCode as ItmCode,BouItrCode as ItrCode,BouBldRefNo as BldRefNo,(BouPckQty*-1) as PckQty,(BouBldQty*-1) as BldQty from (BloodOutDtl" _
        & " left join BloodOutHdr on BloodOutDtl.BouCode = BloodOutHdr.BohCode)" _
        & " inner join BloodInDtl on BloodOutDtl.BouBinICode = BloodInDtl.BinICode" _
        & " where BouBinCode = " & CStr(mBinCode) & IIf(IsMissing(mBinICode) = False, " and BouBinICode = " & CStr(mBinICode), "") _
        & " and BouRecState <> " & CStr(cREC_CANCELED) _
        & ")" _
        & " group by BdgCode,BdcCode,BldCode,ItmCode,ItrCode,BldRefNo" _
        & " order by BdgCode,BdcCode,BldCode,ItmCode,ItrCode,BldRefNo" _
        & ") as a" _
        & " inner join BloodGrpMst on a.BdgCode = BloodGrpMst.BdgCode)" _
        & " inner join BloodCompoMst on a.BdcCode = BloodCompoMst.BdcCode)" _
        & " inner join BloodMast on a.BldCode = BloodMast.BldCode" _
        & " where PckQty_sum < 0 or BldQty_sum < 0" _
        , dbComDatabase, adOpenKeyset, adLockOptimistic
    Rem Rem additional BinICode,BinICode,   BouBinICode as BinICode,   group by BinICode,   order by BinICode, IIf(IsMissing(mBinICode) = False And True = False, " and BinICode = " & CStr(mBinICode), "")
    If .EOF = False Then
        ErrorBox "Blood-In going Short for Item " & vbCrLf & .fields("BdgName") & ", " & .fields("BdcName") & " Ref.No." & CStr(.fields("BldRefNo")) & " by Pck/Bld.Qty " & CStr(.fields("PckQty_sum")) & "/" & CStr(.fields("BldQty_sum"))
        ChkAnyShortRcExist = True
    End If
    End With
    CloseTable tRecset
End If

End Function

Private Function ChkBldRefNoLink(ByVal mCallFromDtlAddEdit As Boolean) As Boolean
Dim tRecset As ADODB.Recordset, srow As Integer, mBldRefNo As String

ChkBldRefNoLink = True
If mCallFromDtlAddEdit = True Then
    mBldRefNo = txtBinBldRefNo.Text
    If mFormSysVchType = cBDK_VTYPE_BLOODDONATE Then
        Set tRecset = dbComDatabase.Execute("Select * from (BloodInDtl bin inner join BloodInHdr bih on bin.BinCode = bih.BihCode) inner join VTypMast vtm on bih.BihVtmCode = vtm.VtmCode where BinBldRefNo = '" & mBldRefNo & "' and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODDONATE) & " and BinCode <> " & CStr(mBinCode))
        With tRecset
        If .EOF = False Then
            ErrorBox "Bag No. Already Used in " & .fields("VtmName") & " No. " & CStr(.fields("BihVchNo")) & " Dated " & Dtoc(.fields("BihDate"))
            ChkBldRefNoLink = False
        End If
        End With
        CloseTable tRecset
        
    ElseIf mFormSysVchType = cBDK_VTYPE_BLOODFILTER Then
        Rem Set tRecset = dbComDatabase.Execute("Select * from (BloodInDtl bin inner join BloodInHdr bih on bin.BinCode = bih.BihCode) inner join VTypMast vtm on bih.BihVtmCode = vtm.VtmCode where BinBldRefNo = '" & mBldRefNo & "' and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODFILTER) & " and BinCode <> " & CStr(mBinCode))
        Rem With tRecset
        Rem If .EOF = False Then
        Rem     ErrorBox "Bag No. Already Used in " & .fields("VtmName") & " No. " & CStr(.fields("BihVchNo")) & " Dated " & Dtoc(.fields("BihDate"))
        Rem     ChkBldRefNoLink = False
        Rem End If
        Rem End With
        Rem CloseTable tRecset
        
        If ChkBldRefNoLink = True Then
            Set tRecset = dbComDatabase.Execute("Select * from (BloodInDtl bin inner join BloodInHdr bih on bin.BinCode = bih.BihCode) inner join VTypMast vtm on bih.BihVtmCode = vtm.VtmCode where BinBldRefNo = '" & mBldRefNo & "' and BihTrnRefNo = '" & txtBinTrnRefNo.Text & "' and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODDONATE) & " order by BihDate desc")
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
        mBldRefNo = Mfgrd2.TextMatrix(srow, X2BINBLDREFNO_COL)
        If mFormSysVchType = cBDK_VTYPE_BLOODDONATE Then
            Set tRecset = dbComDatabase.Execute("Select * from (BloodInDtl bin inner join BloodInHdr bih on bin.BinCode = bih.BihCode) inner join VTypMast vtm on bih.BihVtmCode = vtm.VtmCode where BinBldRefNo = '" & mBldRefNo & "' and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODDONATE) & " and BinCode <> " & CStr(mBinCode))
            With tRecset
            If .EOF = False Then
                ErrorBox "Bag No. Already Used in " & .fields("VtmName") & " No. " & CStr(.fields("BihVchNo")) & " Dated " & Dtoc(.fields("BihDate"))
                Mfgrd2.Row = srow
                Mfgrd2.SetFocus
                ChkBldRefNoLink = False
                Exit For
            End If
            End With
            CloseTable tRecset
            
        ElseIf mFormSysVchType = cBDK_VTYPE_BLOODFILTER Then
            Rem Set tRecset = dbComDatabase.Execute("Select * from (BloodInDtl bin inner join BloodInHdr bih on bin.BinCode = bih.BihCode) inner join VTypMast vtm on bih.BihVtmCode = vtm.VtmCode where BinBldRefNo = '" & mBldRefNo & "' and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODFILTER) & " and BinCode <> " & CStr(mBinCode))
            Rem With tRecset
            Rem If .EOF = False Then
            Rem     ErrorBox "Bag No. Already Used in " & .fields("VtmName") & " No. " & CStr(.fields("BihVchNo")) & " Dated " & Dtoc(.fields("BihDate"))
            Rem     Mfgrd2.Row = srow
            Rem     Mfgrd2.SetFocus
            Rem     ChkBldRefNoLink = False
            Rem     Exit For
            Rem End If
            Rem End With
            Rem CloseTable tRecset
            
            If ChkBldRefNoLink = True Then
                Set tRecset = dbComDatabase.Execute("Select * from (BloodInDtl bin inner join BloodInHdr bih on bin.BinCode = bih.BihCode) inner join VTypMast vtm on bih.BihVtmCode = vtm.VtmCode where BinBldRefNo = '" & mBldRefNo & "' and BihTrnRefNo = '" & txtBinTrnRefNo.Text & "' and VtmSysCode = " & CStr(cBDK_VTYPE_BLOODDONATE) & " order by BihDate desc")
                With tRecset
                If .EOF = True Then
                    ErrorBox "Bag No. does not Exist in Blood Donate Entry !!!"
                    Mfgrd2.Row = srow
                    Mfgrd2.SetFocus
                    ChkBldRefNoLink = False
                    Exit For
                Else
                    Do While .EOF = False
                        If tRecset.fields("BinBdgCode") = Val(Mfgrd2.TextMatrix(srow, X2BINBDGCODE_COL)) Then
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
Dim mBinVchNo As Long

If Val(fcmbVtmName.BoundText) < 1 Then
    ErrorBox "Invalid Voucher Type !!!"
    txtVtmName(1).SetFocus
    Exit Sub
End If
If Val(UnMyNumFmt(mskBinVchNo(1).Text)) < 1 Then
    ErrorBox "Invalid Voucher No. !!!"
    mskBinVchNo(1).SetFocus
    Exit Sub
Else
    mBinVchNo = Val(UnMyNumFmt(mskBinVchNo(1).Text))
    If ChkIsExistVTypeNo(dbBdkDatabase, mTableName:="BloodInHdr", mChkFieldName:="BihVchNo", mChkFieldValue:=CStr(mBinVchNo), mVtmFieldName:="BihVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="BihCmpCode", mFinYrFieldValue:=sFinYrCmpCode) = False Then
        ErrorBox "Voucher No. does not Exist !!!"
        mskBinVchNo(1).SetFocus
        Exit Sub
    End If
End If
If Val(UnMyNumFmt(mskBinVchNo(2).Text)) < 1 Then
    ErrorBox "Invalid Voucher No. !!!"
    mskBinVchNo(2).SetFocus
    Exit Sub
Else
    mBinVchNo = Val(UnMyNumFmt(mskBinVchNo(2).Text))
    If ChkIsExistVTypeNo(dbBdkDatabase, mTableName:="BloodInHdr", mChkFieldName:="BihVchNo", mChkFieldValue:=CStr(mBinVchNo), mVtmFieldName:="BihVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="BihCmpCode", mFinYrFieldValue:=sFinYrCmpCode) = False Then
        ErrorBox "Voucher No. does not Exist !!!"
        mskBinVchNo(2).SetFocus
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
Dim mFromBinVchNo As Long, mToBinVchNo As Long, mBinVtmCode As Long
Dim fCRView As Form

mFromBinVchNo = Val(UnMyNumFmt(mskBinVchNo(1).Text))
mToBinVchNo = Val(UnMyNumFmt(mskBinVchNo(2).Text))
mBinVtmCode = Val(fcmbVtmName.BoundText)

frmMain.Cryst.Reset
frmMain.Cryst.ReportFileName = Trim(Right(cmbCRList.List(cmbCRList.ListIndex), 100))
frmMain.Cryst.DiscardSavedData = True
frmMain.Cryst.DataFiles(0) = dbComDatabaseFullPath

frmMain.Cryst.SelectionFormula = "{vewBloodIn.BihVchNo}>=" & CStr(mFromBinVchNo) & " and {vewBloodIn.BihVchNo}<=" & CStr(mToBinVchNo) & " and {vewBloodIn.BihVtmCode}=" & CStr(mBinVtmCode) & " and {vewBloodIn.BihCmpCode}=" & CStr(sFinYrCmpCode)
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

If mFormSysVchType <> cBDK_VTYPE_BLOODDONATE Then
    Exit Sub
End If
If mCallSource = "Keydown" Then
    If Mfgrd1.Row < Mfgrd1.Rows - 1 And optDetailed.Value = True And datRecset.BOF = False And datRecset.EOF = False Then
        fcmbVtmName.BoundText = CStr(datRecset.fields("BihVtmCode"))
        txtVtmName(1).Text = fcmbVtmName.Text
        mskBinVchNo(1).Text = datRecset.fields("BihVchNo")
        mskBinVchNo(2).Text = datRecset.fields("BihVchNo")
        ' ----------------
        Call AssignPrintPara
        frPrintCRList.ZOrder
        frPrintCRList.Visible = True
        Mfgrd1.Enabled = False
        cmbPrintDest.SetFocus
    End If
    
ElseIf mCallSource = "SaveEvent" Then
    txtVtmName(1).Text = fcmbVtmName.Text
    mskBinVchNo(1).Text = CStr(Val(UnMyNumFmt(mskBinVchNo(0).Text)))
    mskBinVchNo(2).Text = CStr(Val(UnMyNumFmt(mskBinVchNo(0).Text)))
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

If Dir(BldInNoteCRLFileFullPath) = "" Then
    fhand = FreeFile
    Open BldInNoteCRLFileFullPath For Output As #fhand
    Write #fhand, "Blood Donate Receipt", "BldInNt.Rpt", True
    Close #fhand
End If

cmbCRList.Clear
fhand = FreeFile
Open BldInNoteCRLFileFullPath For Input As #fhand
Do While EOF(fhand) = False
    Input #fhand, mCRLTitle, mCRLFileName, mCRLDefault
    If Dir(BldInNoteCRLFileFullPath(mFileName:=mCRLFileName)) <> "" Then
        cmbCRList.AddItem mCRLTitle & Space(100) & BldInNoteCRLFileFullPath(mFileName:=mCRLFileName)
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
