VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmBloodInTranxxx 
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
      ItemData        =   "BloodInxx.frx":0000
      Left            =   0
      List            =   "BloodInxx.frx":000D
      Style           =   1  'Simple Combo
      TabIndex        =   38
      TabStop         =   0   'False
      Text            =   "cmbFormEntryMode"
      Top             =   480
      Width           =   1455
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
      Height          =   9495
      Left            =   120
      TabIndex        =   37
      Top             =   840
      Width           =   14775
      Begin VB.TextBox dtpBmkBinBldExpDt 
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
         TabIndex        =   18
         Text            =   "dd/mm/yyyy"
         Top             =   5370
         Width           =   1455
      End
      Begin VB.TextBox mskBmkBinItmCode 
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
         TabIndex        =   102
         Tag             =   "AhCode"
         Text            =   "ItmCode"
         Top             =   6540
         Visible         =   0   'False
         Width           =   1335
      End
      Begin VB.TextBox txtBinBdpName 
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
         Left            =   11010
         MaxLength       =   50
         TabIndex        =   19
         Text            =   "BdpName"
         Top             =   5370
         Width           =   1365
      End
      Begin VB.TextBox mskBmkBinBldQty 
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
         Left            =   13245
         TabIndex        =   21
         Tag             =   "AhCode"
         Text            =   "BldQty"
         Top             =   5370
         Width           =   975
      End
      Begin VB.TextBox txtBinBdcName 
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
         TabIndex        =   15
         Text            =   "BdcName"
         Top             =   5370
         Width           =   2265
      End
      Begin VB.Frame frHeader 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   4815
         Left            =   120
         TabIndex        =   67
         Top             =   240
         Width           =   14535
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
            TabIndex        =   96
            TabStop         =   0   'False
            Top             =   3465
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
            TabIndex        =   95
            TabStop         =   0   'False
            Top             =   3105
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
            TabIndex        =   94
            TabStop         =   0   'False
            Top             =   2745
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
            TabIndex        =   93
            TabStop         =   0   'False
            Top             =   2385
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
            TabIndex        =   92
            TabStop         =   0   'False
            Top             =   1665
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
            TabIndex        =   3
            Text            =   "0"
            Top             =   1005
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
            TabIndex        =   4
            Top             =   1350
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
            Left            =   1785
            MaxLength       =   50
            TabIndex        =   1
            Text            =   "0"
            Top             =   1020
            Width           =   1395
         End
         Begin VB.TextBox mskBmkBinStkCode 
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
            Top             =   180
            Width           =   1455
         End
         Begin VB.TextBox dtpBmkTrnRefDt 
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
            TabIndex        =   10
            Text            =   "dd/mm/yyyy"
            Top             =   4440
            Width           =   1455
         End
         Begin VB.TextBox txtBmkTrnRefNo 
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
            TabIndex        =   9
            Tag             =   "AhCode"
            Top             =   4440
            Width           =   1815
         End
         Begin VB.TextBox txtBmkTime_str 
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
            Left            =   10575
            MaxLength       =   50
            TabIndex        =   8
            TabStop         =   0   'False
            Text            =   "00:00"
            Top             =   4080
            Width           =   855
         End
         Begin VB.TextBox dtpBmkDate 
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
            TabIndex        =   7
            Text            =   "dd/mm/yyyy"
            Top             =   4080
            Width           =   1455
         End
         Begin VB.TextBox mskBmkVchNo 
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
            Left            =   5880
            TabIndex        =   6
            Tag             =   "AhCode"
            Text            =   "0"
            Top             =   4080
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
            TabIndex        =   5
            Top             =   4080
            Width           =   1815
         End
         Begin VB.TextBox txtBmkPrefix 
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
            TabIndex        =   29
            Tag             =   "AhCode"
            Text            =   "[Prefix]"
            Top             =   4080
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
            Left            =   1800
            TabIndex        =   0
            Tag             =   "AhCode"
            Text            =   "-1"
            Top             =   180
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
            Left            =   1785
            MaxLength       =   50
            TabIndex        =   2
            Top             =   1380
            Width           =   5925
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
            Left            =   1785
            Locked          =   -1  'True
            MaxLength       =   250
            MultiLine       =   -1  'True
            TabIndex        =   25
            TabStop         =   0   'False
            Top             =   1680
            Width           =   5925
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
            Left            =   1785
            Locked          =   -1  'True
            MaxLength       =   50
            TabIndex        =   27
            TabStop         =   0   'False
            Top             =   2400
            Width           =   5925
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
            Left            =   1785
            Locked          =   -1  'True
            MaxLength       =   50
            TabIndex        =   28
            TabStop         =   0   'False
            Top             =   2760
            Width           =   5925
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
            Left            =   1785
            Locked          =   -1  'True
            MaxLength       =   50
            TabIndex        =   24
            TabStop         =   0   'False
            Top             =   3120
            Width           =   5925
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
            Left            =   1785
            Locked          =   -1  'True
            MaxLength       =   50
            TabIndex        =   26
            TabStop         =   0   'False
            Top             =   3480
            Width           =   5925
         End
         Begin VB.TextBox txtBkhRemark 
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
            TabIndex        =   11
            Top             =   4440
            Width           =   5295
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
            TabIndex        =   91
            Top             =   675
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
            Left            =   1785
            TabIndex        =   90
            Top             =   675
            Width           =   5925
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
            Left            =   120
            TabIndex        =   89
            Top             =   1020
            Width           =   1635
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
            TabIndex        =   85
            Top             =   4440
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
            TabIndex        =   84
            Top             =   4440
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
            TabIndex        =   79
            Top             =   4080
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
            TabIndex        =   78
            Top             =   4080
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
            Left            =   3960
            TabIndex        =   77
            Top             =   4080
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
            TabIndex        =   76
            Top             =   4080
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
            TabIndex        =   75
            Top             =   180
            Width           =   1935
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
            TabIndex        =   74
            Top             =   1365
            Width           =   1635
         End
         Begin VB.Line Line3 
            Index           =   1
            X1              =   0
            X2              =   14535
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
            TabIndex        =   73
            Top             =   1680
            Width           =   1635
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
            TabIndex        =   72
            Top             =   2400
            Width           =   1635
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
            TabIndex        =   71
            Top             =   2760
            Width           =   1635
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
            TabIndex        =   70
            Top             =   3120
            Width           =   1635
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
            TabIndex        =   69
            Top             =   3480
            Width           =   1635
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
            TabIndex        =   68
            Top             =   4440
            Width           =   1215
         End
         Begin VB.Shape Shape1 
            BackColor       =   &H00D9FFB3&
            BackStyle       =   1  'Opaque
            Height          =   3975
            Index           =   0
            Left            =   0
            Top             =   0
            Width           =   14535
         End
         Begin VB.Shape Shape1 
            BackColor       =   &H00FFFF80&
            BackStyle       =   1  'Opaque
            Height          =   855
            Index           =   2
            Left            =   0
            Top             =   3960
            Width           =   14535
         End
      End
      Begin VB.TextBox txtBmkBinNarr 
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
         TabIndex        =   16
         Text            =   "Narr"
         Top             =   5370
         Width           =   2370
      End
      Begin VB.TextBox mskBmkBinStkICode 
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
         Top             =   6525
         Visible         =   0   'False
         Width           =   1335
      End
      Begin VB.TextBox mskBmkBinItrCode 
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
         Top             =   6165
         Visible         =   0   'False
         Width           =   1335
      End
      Begin VB.TextBox mskBmkBinBldCode 
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
         Top             =   6165
         Visible         =   0   'False
         Width           =   1335
      End
      Begin VB.TextBox txtBmkBinBldRefNo 
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
         TabIndex        =   17
         Text            =   "BldRefNo"
         Top             =   5370
         Width           =   2790
      End
      Begin VB.TextBox mskBmkBinICode 
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
         Top             =   6165
         Visible         =   0   'False
         Width           =   1335
      End
      Begin VB.CommandButton cmdOK3 
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
         Left            =   13545
         Style           =   1  'Graphical
         TabIndex        =   22
         Top             =   5715
         Width           =   735
      End
      Begin VB.TextBox mskBmkBinSno 
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
         TabIndex        =   13
         Tag             =   "AhCode"
         Text            =   "1)"
         Top             =   5370
         Width           =   375
      End
      Begin VB.TextBox txtBinBdgName 
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
         TabIndex        =   14
         Text            =   "BdgName"
         Top             =   5370
         Width           =   1620
      End
      Begin VB.TextBox mskBmkBinPckQty 
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
         Left            =   12375
         TabIndex        =   20
         Tag             =   "AhCode"
         Text            =   "PckQty"
         Top             =   5370
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
         Top             =   9120
         Width           =   375
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd3 
         Height          =   2340
         Left            =   120
         TabIndex        =   12
         Top             =   5040
         Width           =   14535
         _ExtentX        =   25638
         _ExtentY        =   4128
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
      Begin VB.Frame frFooter3 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         ForeColor       =   &H80000008&
         Height          =   1695
         Left            =   120
         TabIndex        =   80
         Top             =   7800
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
            Height          =   765
            Left            =   0
            Locked          =   -1  'True
            MultiLine       =   -1  'True
            ScrollBars      =   2  'Vertical
            TabIndex        =   88
            TabStop         =   0   'False
            Top             =   480
            Width           =   9255
         End
         Begin VB.Label lblBmkBinBldQtyTot 
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
            Left            =   6525
            TabIndex        =   97
            Top             =   135
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
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Last Donate:"
            BeginProperty Font 
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
            TabIndex        =   83
            Top             =   1320
            Width           =   1575
         End
         Begin VB.Label lblOldBmkCodeDesc 
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
            TabIndex        =   82
            Top             =   1320
            Width           =   7575
         End
         Begin VB.Label lblBmkBinPckQtyTot 
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
            Left            =   5280
            TabIndex        =   81
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
         TabIndex        =   103
         Top             =   1140
         Width           =   5895
         Begin VB.ComboBox cmbPrinterList 
            Height          =   315
            Left            =   2160
            Style           =   2  'Dropdown List
            TabIndex        =   58
            Top             =   1680
            Width           =   3495
         End
         Begin VB.ComboBox cmbPrintDest 
            Height          =   315
            Left            =   2160
            Style           =   2  'Dropdown List
            TabIndex        =   60
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
            TabIndex        =   59
            Text            =   "0"
            Top             =   2040
            Width           =   1455
         End
         Begin VB.ComboBox cmbCRList 
            Height          =   315
            Left            =   2160
            Style           =   2  'Dropdown List
            TabIndex        =   57
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
            TabIndex        =   56
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
            TabIndex        =   54
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
            TabIndex        =   55
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
            TabIndex        =   61
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
            TabIndex        =   111
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
            TabIndex        =   110
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
            TabIndex        =   109
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
            TabIndex        =   108
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
            TabIndex        =   107
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
            TabIndex        =   106
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
            TabIndex        =   105
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
            TabIndex        =   104
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
         TabIndex        =   63
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
            TabIndex        =   100
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
            TabIndex        =   98
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
            TabIndex        =   53
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
            TabIndex        =   46
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
               TabIndex        =   52
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
               TabIndex        =   47
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
               TabIndex        =   48
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
               TabIndex        =   49
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
               TabIndex        =   50
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
               TabIndex        =   51
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
            TabIndex        =   101
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
            TabIndex        =   99
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
            TabIndex        =   66
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
            TabIndex        =   65
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
            TabIndex        =   64
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
         TabIndex        =   62
         Top             =   360
         Width           =   735
      End
   End
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Blood Donate (Incoming)"
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
Attribute VB_Name = "frmBloodInTranxxx"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Dim mFormLoaded As Boolean, mLastKeyPressed As Integer, mMaskKeyPressed As Integer
Dim mFormUIdCode As Long, mFormUIdFileName As String, mFormAcsPermFileName As String
Dim mFormSysVchType As Integer, mFormVchTypeList As String, mBmkCode As Long, mBmkStkCode As Long, mBmkEttCode As Long, mBmkEfmCode As Long, mQryEttCode As Long, mQryEfmCode As Long, mEttRegNoChanged As Boolean, mEfmRegNoChanged As Boolean, mBmkDateChanged As Boolean, dtlAddEditMode As Boolean, dtlAddMode As Boolean, dtlEditCanceled As Boolean
Dim mRemoteAccess As Boolean, mEntrySaved As Boolean, mEntryAborted As Boolean
Dim dbAcDatabase As New ADODB.Connection, dbStDatabase As New ADODB.Connection, dbBdkDatabase As New ADODB.Connection, dbGrpDatabase As New ADODB.Connection, dbComDatabase As New ADODB.Connection
Dim datRecset As New ADODB.Recordset
Dim mBmkCode_old As Long, mBmkStkCode_old As Long, mBmkEttCode_old As Long, mBmkEfmCode_old As Long, mBmkDate_old As Date, mBmkVtmCode_old As Long, mBmkVchNo_old As Long, mBmkTime_old As Long
Dim mBmkBdgCode_old As Long, mBmkBdcCode_old As Long, mBmkBdpCode_old As Long, mBmkBldCode_old As Long, mBmkPckQty_old As Double, mBmkItmCode_old As Long, mBmkItrCode_old As Long, mBmkBldRefNo_old As String
Dim clsAH As clsAccountHead, clsBINSTK As clsStockJrn, clsBMK As clsBdkMultiTranEntry, clsARA As clsComMastEntry, clsSTN As clsComMastEntry, clsVTM As clsComMastEntry
Dim clsETT As clsBdkMasterEntry, clsEFM As clsBdkMasterEntry, clsBDG As clsBdkMasterEntry, clsBDC As clsBdkMasterEntry
Dim mActiveControl As Object, clsListStru As clsSelectQueryStructure
Dim fcmbVtmName As clsComFlexSearch
Dim fcmbEttName As clsBdkFlexSearch, fcmbEfmName As clsBdkFlexSearch, fcmbBdgName As clsBdkFlexSearch, fcmbBdcName As clsBdkFlexSearch, fcmbBdpName As clsBdkFlexSearch

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
Const X3BMKICODE_COL = 0
Const X3BMKSNO_COL = 1
Const X3BDGNAME_COL = 2
Const X3BDCNAME_COL = 3
Const X3BMKNARR_COL = 4
Const X3BMKBLDREFNO_COL = 5
Const X3BMKBLDEXPDT_COL = 6
Const X3BMKBLDOKSTATUS_COL = 7
Const X3BDPNAME_COL = 8
Const X3BMKPCKQTY_COL = 9
Const X3BMKBLDQTY_COL = 10
Const X3BMKBDGCODE_COL = 11
Const X3BMKBDCCODE_COL = 12
Const X3BMKBDPCODE_COL = 13
Const X3BMKBLDCODE_COL = 14
Const X3BMKITMCODE_COL = 15
Const X3BMKITRCODE_COL = 16
Const X3BMKBLDOKSTATE_COL = 17
Const X3BMKSTKICODE_COL = 18
Const X3BMKRECSTATE_COL = 19
Const MFGRD2_COLS = 20

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

dtpFromDate.Text = IIf(mFormSysVchType = cCOM_VTYPE_OPNSTK, Dtoc(sCmpBookStartDate - 1), Dtoc(sFinYrStartDate))
dtpToDate.Text = IIf(mFormSysVchType = cCOM_VTYPE_OPNSTK, Dtoc(sCmpBookStartDate - 1), Dtoc(sFinYrEndDate))
mQryEttCode = 0: mQryEfmCode = 0
txtQryEttName.Text = "": fcmbEttName.BoundText = ""
txtQryEfmName.Text = "": fcmbEfmName.BoundText = ""
optExpanded.Value = False
optDetailed.Value = False
optMonthwise.Value = True
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
mBmkCode = mAccessCode
End Property

Public Property Get EntryBoundCode() As Long
EntryBoundCode = Val(mskFormBoundField.Text)
End Property

Public Property Get EntryDate() As Date
EntryDate = Ctod(dtpBmkDate.Text)
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
                        dtpFromDate.Text = Dtoc(MonthEndDate(DateSerial(Val(Left(.fields("BmkYrMonth"), 4)), Val(Right(.fields("BmkYrMonth"), 2)), 1)))
                    Else
                        dtpFromDate.Text = Dtoc(MonthStartDate(DateSerial(Val(Left(.fields("BmkYrMonth"), 4)), Val(Right(.fields("BmkYrMonth"), 2)), 1)))
                    End If
                    dtpToDate.Text = Dtoc(MonthEndDate(DateSerial(Val(Left(.fields("BmkYrMonth"), 4)), Val(Right(.fields("BmkYrMonth"), 2)), 1)))
                    optMonthwise.Value = False
                    optDatewise.Value = True
                
                ElseIf optDatewise.Value = True Then
                    dtpFromDate.Text = Dtoc(.fields("BkhDate"))
                    dtpToDate.Text = Dtoc(.fields("BkhDate"))
                    optDatewise.Value = False
                    optDetailed.Value = True
                
                ElseIf optEntitywise.Value = True Then
                    mQryEttCode = .fields("BkhEttCode")
                    fcmbEttName.BoundText = CStr(.fields("BkhEttCode"))
                    txtQryEttName.Text = fcmbEttName.Text
                    optEntitywise.Value = False
                    optDatewise.Value = True
                    
                ElseIf optEFamilywise.Value = True Then
                    mQryEfmCode = .fields("BkhEfmCode")
                    fcmbEfmName.BoundText = CStr(.fields("BkhEfmCode"))
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
    ElseIf Screen.ActiveControl.Name = Mfgrd3.Name Then
        Mfgrd3_KeyPress vbKeyReturn
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
    Call cmdOK3_Click

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

Private Sub cmdOK3_Click()
Dim tRecset As New ADODB.Recordset, srow As Integer, mBmkICode As Long, mBmkStkICode As Long, mBmkItrCode As Long, mReqdRecdAmt As Double

srow = Mfgrd3.Row
mBmkICode = Val(Mfgrd3.TextMatrix(srow, X3BMKICODE_COL))
mBmkStkICode = Val(Mfgrd3.TextMatrix(srow, X3BMKSTKICODE_COL))
mBmkItrCode = Val(Mfgrd3.TextMatrix(srow, X3BMKITRCODE_COL))

If cmdOK3.Caption = "&OK" And dtlEditCanceled = False Then
    Rem updating values in Blood-In table
    With clsBMK
    If dtlAddMode = True Then
        .ClearDtl
        .mBmkBldOkState_bln = False
    Else
        .GetDtlData mBmkCode, mBmkICode
    End If
    .mTrnCode_lng = mBmkCode
    .mTrnDtlSno_int = Val(UnMyNumFmt(mskBmkBinSno.Text))
    .mTrnDate_dt = Ctod(dtpBmkDate.Text)
    .mTrnCmpCode_int = sFinYrCmpCode
    
    .mBmkStkCode_lng = mBmkStkCode
    .mBmkStkICode_lng = mBmkStkICode
    'If mFormSysVchType = cBDK_VTYPE_BLOODRETINW Then
    '    .mBmkEttCode_lng = Val(fcmbEttName.BoundText)
    '    .mBmkEttCode_lng = 0
    'Else
        .mBmkEttCode_lng = Val(fcmbEttName.BoundText)
        .mBmkEfmCode_lng = Val(fcmbEfmName.BoundText)
    'End If
    .mBmkBdgCode_lng = Val(fcmbBdgName.BoundText)
    .mBmkBdcCode_lng = Val(fcmbBdcName.BoundText)
    .mBmkNarr_str = txtBmkBinNarr.Text
    .mBmkBldRefNo_str = txtBmkBinBldRefNo.Text
    .mBmkBldExpDt_dt = Ctod(dtpBmkBinBldExpDt.Text)
    Rem .mBmkBldOkState_bln = True shifted above not be affected here, but in different module
    .mBmkPckQty_dbl = Val(UnMyNumFmt(mskBmkBinPckQty.Text))
    .mBmkBldQty_dbl = Val(UnMyNumFmt(mskBmkBinBldQty.Text))
    .mBmkBdpCode_lng = Val(fcmbBdpName.BoundText)
    .mBmkBldCode_lng = Val(mskBmkBinBldCode.Text)
    .mBmkItmCode_lng = Val(mskBmkBinItmCode.Text)
    .mBmkItrCode_lng = Val(mskBmkBinItrCode.Text)
    .mBmkRemark_str = ""
    
    If dtlAddMode = True Then
        If .AddNewDtl(mBmkCode) = True Then
            mBmkICode = .mTrnDtlICode_lng
        End If
    Else
        .UpdateDtl mBmkCode, mBmkICode
    End If
    End With
    
    Rem updating values in stock table
    With clsBINSTK
    If dtlAddMode = True Then
        .ClearDtl
    Else
        .GetDtlData mBmkStkCode, mBmkStkICode
    End If
    .mStkSno_int = Val(UnMyNumFmt(mskBmkBinSno.Text))
    .mStkVtmCode_lng = Val(fcmbVtmName.BoundText)
    .mStkPrefix_str = txtBmkPrefix.Text
    .mStkVchNo_lng = Val(UnMyNumFmt(mskBmkVchNo(0).Text))
    .mStkPostfix_str = ""
    .mStkDate_dt = Ctod(dtpBmkDate.Text)
    .mStkItmCode_lng = Val(mskBmkBinItmCode.Text)
    .mStkItmRef1Name_str = txtBmkBinBldRefNo.Text
    .mStkItmRef2Name_str = ""
    .mStkQty_dbl = ToRcptQty(Val(UnMyNumFmt(mskBmkBinBldQty.Text)))
    .mStkNarr_str = ""
    .mStkAutoGen_bln = True
    .mStkCmpCode_int = sFinYrCmpCode
    If dtlAddMode = True Then
        If .AddNewDtl(mBmkStkCode, mNewItemRef:=True) = True Then
            mBmkStkICode = .mStkICode_lng
            mBmkItrCode = .mStkItmRefCode_lng
        End If
    Else
        If Val(fcmbBdgName.BoundText) <> mBmkBdgCode_old Or Val(fcmbBdcName.BoundText) <> mBmkBdcCode_old Or Val(mskBmkBinBldCode.Text) <> mBmkBldCode_old Or Val(mskBmkBinItmCode.Text) <> mBmkItmCode_old Or txtBmkBinBldRefNo.Text <> mBmkBldRefNo_old Then
            .UpdateDtl mBmkStkCode, mBmkStkICode, mNewItemRef:=True
            mBmkItrCode = .mStkItmRefCode_lng
        Else
            .UpdateDtl mBmkStkCode, mBmkStkICode
        End If
    End If
    End With
    
    Rem updating StkICode in BloodMkDtl
    With clsBMK
    If mBmkICode > 0 And mBmkStkICode > 0 And mBmkItrCode > 0 Then
        If dtlAddMode = True Then
            .GetDtlData mBmkCode, mBmkICode
            
            .mBmkStkICode_lng = mBmkStkICode
            .mBmkItrCode_lng = mBmkItrCode
            .UpdateDtl mBmkCode, mBmkICode
        Else
            If Val(fcmbBdgName.BoundText) <> mBmkBdgCode_old Or Val(fcmbBdcName.BoundText) <> mBmkBdcCode_old Or Val(mskBmkBinBldCode.Text) <> mBmkBldCode_old Or Val(mskBmkBinItmCode.Text) <> mBmkItmCode_old Or txtBmkBinBldRefNo.Text <> mBmkBldRefNo_old Then
                .GetDtlData mBmkCode, mBmkICode
                
                .mBmkItrCode_lng = mBmkItrCode
                .UpdateDtl mBmkCode, mBmkICode
            End If
        End If
    End If
    End With
    
    RefreshDatabase dbBdkDatabase
    ChkAnyShortRcExist mBmkICode
    ChkAnyMisLinkedIsuExist mBmkICode
    
    With tRecset
    .open "Select * from ((BloodMkDtl" _
        & " Inner Join BloodGrpMst on BloodMkDtl.BmkBdgCode = BloodGrpMst.BdgCode)" _
        & " Inner Join BloodCompoMst on BloodMkDtl.BmkBdcCode = BloodCompoMst.BdcCode)" _
        & " Inner Join BloodPckMst on BloodMkDtl.BmkBdpCode = BloodPckMst.BdpCode" _
        & " where BmkCode = " & CStr(mBmkCode) & " and BmkICode=" & CStr(mBmkICode) & "" _
        , dbBdkDatabase, adOpenKeyset, adLockOptimistic
    
    Mfgrd3.TextMatrix(srow, X3BMKICODE_COL) = .fields("BmkICode")
    Mfgrd3.TextMatrix(srow, X3BMKSTKICODE_COL) = .fields("BmkStkICode")
    Mfgrd3.TextMatrix(srow, X3BMKSNO_COL) = ToMyNumFmt(.fields("BmkSno"), mDecimals:=0)
    Mfgrd3.TextMatrix(srow, X3BDGNAME_COL) = .fields("BdgName")
    Mfgrd3.TextMatrix(srow, X3BDCNAME_COL) = .fields("BdcName")
    Mfgrd3.TextMatrix(srow, X3BMKBLDREFNO_COL) = .fields("BmkBldRefNo")
    Mfgrd3.TextMatrix(srow, X3BMKBLDEXPDT_COL) = Dtoc(.fields("BmkBldExpDt"))
    Mfgrd3.TextMatrix(srow, X3BMKBLDOKSTATUS_COL) = IIf(.fields("BmkBldOkState") = True, "Ok", "X")
    Mfgrd3.TextMatrix(srow, X3BDPNAME_COL) = .fields("BdpName")
    Mfgrd3.TextMatrix(srow, X3BMKPCKQTY_COL) = ToMyNumFmt(.fields("BmkPckQty"), mDecimals:=-1)
    Mfgrd3.TextMatrix(srow, X3BMKBLDQTY_COL) = ToMyNumFmt(.fields("BmkBldQty"), mDecimals:=-1)
    Mfgrd3.TextMatrix(srow, X3BMKNARR_COL) = .fields("BmkNarr")
    Mfgrd3.TextMatrix(srow, X3BMKBDGCODE_COL) = .fields("BmkBdgCode")
    Mfgrd3.TextMatrix(srow, X3BMKBDCCODE_COL) = .fields("BmkBdcCode")
    Mfgrd3.TextMatrix(srow, X3BMKBDPCODE_COL) = .fields("BmkBdpCode")
    Mfgrd3.TextMatrix(srow, X3BMKITRCODE_COL) = .fields("BmkItrCode")
    Mfgrd3.TextMatrix(srow, X3BMKBLDOKSTATE_COL) = .fields("BmkBldOkState")
    Mfgrd3.TextMatrix(srow, X3BMKBLDCODE_COL) = .fields("BmkBldCode")
    Mfgrd3.TextMatrix(srow, X3BMKITMCODE_COL) = .fields("BmkItmCode")
    Mfgrd3.TextMatrix(srow, X3BMKRECSTATE_COL) = .fields("BmkRecState")
    
    End With
    CloseTable tRecset
    
    If dtlAddMode = True Then
        Mfgrd3.Rows = Mfgrd3.Rows + 1
    End If
    srow = srow + 1
    Mfgrd3.Row = srow
    
    Call CalcFtrTotal
End If
dtlAddEditMode = False
dtlAddMode = False
dtlEditCanceled = False
VisibleControls False
Mfgrd3.SetFocus
CloseTable tRecset, mCheckOpen:=True

End Sub

Private Sub cmdSaveForm_Click()
txtVoid.SetFocus
Call Data_SaveEvent
Call SmryList

If optDetailed.Value = True Or optExpanded.Value = True Then
    txtSearch1Text_InterActiveChange Format(Ctod(dtpBmkDate.Text), "yyyymmdd") + Format(mBmkCode, cLONGCODESTRFMT)
ElseIf optMonthwise.Value = True Then
    txtSearch1Text_InterActiveChange Format(Ctod(dtpBmkDate.Text), "yyyy") & "/" & Format(Ctod(dtpBmkDate.Text), "mm")
ElseIf optDatewise.Value = True Then
    txtSearch1Text_InterActiveChange Format(Ctod(dtpBmkDate.Text), "yyyymmdd")
ElseIf optEntitywise.Value = True Then
    txtSearch1Text_InterActiveChange txtEttName.Text
ElseIf optEFamilywise.Value = True Then
    txtSearch1Text_InterActiveChange txtEfmName.Text
End If

Call ShowEntryMode(False)
Mfgrd1.SetFocus

End Sub

Private Sub cmdSaveForm_GotFocus()
Dim mBmkAcsPermNo As Integer, mRetryCount As Integer

txtVoid.SetFocus
cmdSaveForm.Enabled = False
If Data_Verify() = True Then
    If CanAccept() = True Then
        If GetAccessPerm(mBmkAcsPermNo, mRetryCount, mFormAcsPermFileName) = True And mRetryCount = 0 Then
            If Data_NetwAuth() = True Then
                Call cmdSaveForm_Click
                Close #mBmkAcsPermNo
                If mRemoteAccess = True Then
                    Me.Hide     '''Unload Me
                    Exit Sub
                Else
                    Call Mfgrd1_RowColChange
                    Data_PrintDialog "SaveEvent"
                End If
            Else
                Close #mBmkAcsPermNo
            End If
        Else
            Close #mBmkAcsPermNo
            AlertBox "System Busy, Try Again !!!"
            
            txtEttName.SetFocus
        End If
    Else
        txtEttName.SetFocus
    End If
End If
cmdSaveForm.Enabled = True
End Sub

Private Sub dtpBmkBinBldExpDt_GotFocus()
FlashActiveControl dtpBmkBinBldExpDt, True
End Sub

Private Sub dtpBmkBinBldExpDt_LostFocus()
FlashActiveControl dtpBmkBinBldExpDt, False
End Sub

Private Sub dtpBmkBinBldExpDt_Validate(Cancel As Boolean)
dtpBmkBinBldExpDt.Text = ToMyDate(dtpBmkBinBldExpDt.Text)
If IsDate(dtpBmkBinBldExpDt.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpBmkBinBldExpDt.SetFocus
    Cancel = True
ElseIf Not Ctod(dtpBmkBinBldExpDt.Text) > Ctod(dtpBmkDate.Text) Then
    ErrorBox "Invalid Input !!!"
    dtpBmkBinBldExpDt.SetFocus
    Cancel = True
End If

End Sub

Private Sub dtpBmkDate_Change()
If InterActiveChange(dtpBmkDate) = True Then
    mBmkDateChanged = True
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

Private Sub dtpBmkDate_GotFocus()
FlashActiveControl dtpBmkDate, True
mBmkDateChanged = False
End Sub

Private Sub dtpBmkDate_LostFocus()
FlashActiveControl dtpBmkDate, False
End Sub

Private Sub dtpBmkDate_Validate(Cancel As Boolean)
dtpBmkDate.Text = ToMyDate(dtpBmkDate.Text)
If mFormSysVchType = cCOM_VTYPE_OPNSTK Then
    If Ctod(dtpBmkDate.Text) <> sCmpBookStartDate - 1 Then
        dtpBmkDate.Text = Dtoc(sCmpBookStartDate - 1)
    End If
ElseIf IsFinYrDate(Ctod(dtpBmkDate.Text)) = False Then
    ErrorBox "Invalid Input !!!"
    dtpBmkDate.SetFocus
    Cancel = True
ElseIf ChkAnyPriorIsuExist() = True Then
    ErrorBox "Invalid Input !!!"
    dtpBmkDate.SetFocus
    Cancel = True
    dtpBmkDate.Text = Dtoc(mBmkDate_old)
Else
    If mBmkDateChanged = True Then
        Call ShowOldBmkCodeDesc
    End If
End If

End Sub

Private Sub dtpBmkTrnRefDt_GotFocus()
FlashActiveControl dtpBmkTrnRefDt, True
End Sub

Private Sub dtpBmkTrnRefDt_LostFocus()
FlashActiveControl dtpBmkTrnRefDt, False
End Sub

Private Sub dtpBmkTrnRefDt_Validate(Cancel As Boolean)
dtpBmkTrnRefDt.Text = ToMyDate(dtpBmkTrnRefDt.Text)

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
    Case cBDK_VTYPE_BLOODDONATE
        lblFormHeading.Caption = "Blood Donate (In) Voucher"
        lblVchType.Caption = "Vch.Type"
        lblFormHeading.BackColor = RGB(1, 255, 255)
'    Case cBDK_VTYPE_BLOODRETINW
'        lblFormHeading.Caption = "Blood-Out Return Voucher"
'        lblVchType.Caption = "Vch.Type"
'        lblFormHeading.BackColor = RGB(100, 255, 255)
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
        If mBmkCode = 0 Then
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

Call SetVoidControl(txtVoid)
txtSearch1Text.Enabled = False
frConfigure.Visible = False
frPrintCRList.Visible = False

OpenAcDataSource dbAcDatabase
OpenStDataSource dbStDatabase
OpenGrpDataSource dbGrpDatabase
OpenComDataSource dbComDatabase
OpenBdkDataSource dbBdkDatabase

mFormVchTypeList = GetSubVchTypeList(cnn:=dbAcDatabase, mSysVchType:=mFormSysVchType, mRtnDefValue:="0")

Set clsListStru = New clsSelectQueryStructure

Set clsBINSTK = New clsStockJrn
Set clsBINSTK.dbStDatabase = dbStDatabase
Set clsBINSTK.dbGrpDatabase = dbGrpDatabase

Set clsAH = New clsAccountHead
Set clsAH.dbAcDatabase = dbAcDatabase
Set clsAH.dbGrpDatabase = dbGrpDatabase

Set clsBMK = New clsBdkMultiTranEntry
Set clsBMK.dbAcDatabase = dbAcDatabase
Set clsBMK.dbStDatabase = dbStDatabase
Set clsBMK.dbBdkDatabase = dbBdkDatabase
Set clsBMK.dbComDatabase = dbComDatabase
clsBMK.blnBloodInTran = True
clsBMK.Init

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

Set fcmbBdpName = New clsBdkFlexSearch
Set fcmbBdpName.dbBdkDatabase = dbBdkDatabase
fcmbBdpName.blnBloodPckMastList = True
fcmbBdpName.Init

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
    datRecset.open "Select * from (BloodMkHdr bkh" _
        & " inner join EntityMast on bkh.BkhEttCode = EntityMast.EttCode)" _
        & " inner join EFamilyMast on bkh.BkhEfmCode = EFamilyMast.EfmCode" _
        & " where bkh.BkhCode = " & CStr(mBmkCode) _
        & " and BkhVtmCode in (" & mFormVchTypeList & ")" _
        & " order by BkhDate,BkhTime", dbComDatabase, adOpenKeyset, adLockOptimistic
Else
    datRecset.open "Select * from (BloodMkHdr bkh" _
        & " inner join EntityMast on bkh.BkhEttCode = EntityMast.EttCode)" _
        & " inner join EFamilyMast on bkh.BkhEfmCode = EFamilyMast.EfmCode" _
        & " where BkhVtmCode in (" & mFormVchTypeList & ")" _
        & " order by BkhDate,BkhTime", dbComDatabase, adOpenKeyset, adLockOptimistic
End If
Mfgrd1.FixedCols = 0
Call SmryList

Mfgrd3.FixedRows = 1: Mfgrd3.FixedCols = 0: Mfgrd3.Rows = 2: Mfgrd3.Cols = MFGRD2_COLS: SetGridAutoHeight Mfgrd3

colcnt = X3BMKICODE_COL: Mfgrd3.ColWidth(colcnt) = 0: Mfgrd3.TextMatrix(0, colcnt) = "X3BMKICODE_COL": Mfgrd3.ColAlignment(colcnt) = 7
colcnt = X3BMKSNO_COL: Mfgrd3.ColWidth(colcnt) = mskBmkBinSno.Width: Mfgrd3.TextMatrix(0, colcnt) = "Sno": Mfgrd3.ColAlignment(colcnt) = 7
colcnt = X3BDGNAME_COL: Mfgrd3.ColWidth(colcnt) = txtBinBdgName.Width: Mfgrd3.TextMatrix(0, colcnt) = "Blood Group": Mfgrd3.ColAlignment(colcnt) = 1
colcnt = X3BDCNAME_COL: Mfgrd3.ColWidth(colcnt) = txtBinBdcName.Width: Mfgrd3.TextMatrix(0, colcnt) = "Blood Component": Mfgrd3.ColAlignment(colcnt) = 1
colcnt = X3BMKNARR_COL: Mfgrd3.ColWidth(colcnt) = txtBmkBinNarr.Width: Mfgrd3.TextMatrix(0, colcnt) = "Description": Mfgrd3.ColAlignment(colcnt) = 1
colcnt = X3BMKBLDREFNO_COL: Mfgrd3.ColWidth(colcnt) = txtBmkBinBldRefNo.Width: Mfgrd3.TextMatrix(0, colcnt) = "Ref.No": Mfgrd3.ColAlignment(colcnt) = 1
colcnt = X3BMKBLDEXPDT_COL: Mfgrd3.ColWidth(colcnt) = dtpBmkBinBldExpDt.Width: Mfgrd3.TextMatrix(0, colcnt) = "Exp.Dt": Mfgrd3.ColAlignment(colcnt) = 1
colcnt = X3BMKBLDOKSTATUS_COL: Mfgrd3.ColWidth(colcnt) = 0: Mfgrd3.TextMatrix(0, colcnt) = "Status": Mfgrd3.ColAlignment(colcnt) = 1
colcnt = X3BDPNAME_COL: Mfgrd3.ColWidth(colcnt) = txtBinBdpName.Width: Mfgrd3.TextMatrix(0, colcnt) = "Packing": Mfgrd3.ColAlignment(colcnt) = 1
colcnt = X3BMKPCKQTY_COL: Mfgrd3.ColWidth(colcnt) = mskBmkBinPckQty.Width: Mfgrd3.TextMatrix(0, colcnt) = "Pck/Bag": Mfgrd3.ColAlignment(colcnt) = 7
colcnt = X3BMKBLDQTY_COL: Mfgrd3.ColWidth(colcnt) = mskBmkBinBldQty.Width: Mfgrd3.TextMatrix(0, colcnt) = "Qty": Mfgrd3.ColAlignment(colcnt) = 7
colcnt = X3BMKBDGCODE_COL: Mfgrd3.ColWidth(colcnt) = 0: Mfgrd3.TextMatrix(0, colcnt) = "X3BMKBDGCODE_COL": Mfgrd3.ColAlignment(colcnt) = 7
colcnt = X3BMKBDCCODE_COL: Mfgrd3.ColWidth(colcnt) = 0: Mfgrd3.TextMatrix(0, colcnt) = "X3BMKBDCCODE_COL": Mfgrd3.ColAlignment(colcnt) = 7
colcnt = X3BMKBDPCODE_COL: Mfgrd3.ColWidth(colcnt) = 0: Mfgrd3.TextMatrix(0, colcnt) = "X3BMKBDPCODE_COL": Mfgrd3.ColAlignment(colcnt) = 7
colcnt = X3BMKBLDCODE_COL: Mfgrd3.ColWidth(colcnt) = 0: Mfgrd3.TextMatrix(0, colcnt) = "X3BMKBLDCODE_COL": Mfgrd3.ColAlignment(colcnt) = 7
colcnt = X3BMKITMCODE_COL: Mfgrd3.ColWidth(colcnt) = 0: Mfgrd3.TextMatrix(0, colcnt) = "X3BMKITMCODE_COL": Mfgrd3.ColAlignment(colcnt) = 7
colcnt = X3BMKITRCODE_COL: Mfgrd3.ColWidth(colcnt) = 0: Mfgrd3.TextMatrix(0, colcnt) = "X3BMKITRCODE_COL": Mfgrd3.ColAlignment(colcnt) = 7
colcnt = X3BMKBLDOKSTATE_COL: Mfgrd3.ColWidth(colcnt) = 0: Mfgrd3.TextMatrix(0, colcnt) = "X3BMKBLDOKSTATE_COL": Mfgrd3.ColAlignment(colcnt) = 7
colcnt = X3BMKSTKICODE_COL: Mfgrd3.ColWidth(colcnt) = 0: Mfgrd3.TextMatrix(0, colcnt) = "X3BMKSTKICODE_COL": Mfgrd3.ColAlignment(colcnt) = 7
colcnt = X3BMKRECSTATE_COL: Mfgrd3.ColWidth(colcnt) = 0: Mfgrd3.TextMatrix(0, colcnt) = "X3BMKRECSTATE_COL": Mfgrd3.ColAlignment(colcnt) = 7
' -----------------
colcnt = X3BMKSNO_COL: mskBmkBinSno.Left = Mfgrd3.Left + Mfgrd3.ColPos(colcnt)
colcnt = X3BDGNAME_COL: txtBinBdgName.Left = Mfgrd3.Left + Mfgrd3.ColPos(colcnt)
colcnt = X3BDCNAME_COL: txtBinBdcName.Left = Mfgrd3.Left + Mfgrd3.ColPos(colcnt)
colcnt = X3BMKNARR_COL: txtBmkBinNarr.Left = Mfgrd3.Left + Mfgrd3.ColPos(colcnt)
colcnt = X3BMKBLDREFNO_COL: txtBmkBinBldRefNo.Left = Mfgrd3.Left + Mfgrd3.ColPos(colcnt)
colcnt = X3BMKBLDEXPDT_COL: dtpBmkBinBldExpDt.Left = Mfgrd3.Left + Mfgrd3.ColPos(colcnt)
colcnt = X3BDPNAME_COL: txtBinBdpName.Left = Mfgrd3.Left + Mfgrd3.ColPos(colcnt)
colcnt = X3BMKPCKQTY_COL: mskBmkBinPckQty.Left = Mfgrd3.Left + Mfgrd3.ColPos(colcnt)
colcnt = X3BMKBLDQTY_COL: mskBmkBinBldQty.Left = Mfgrd3.Left + Mfgrd3.ColPos(colcnt)
cmdOK3.Left = mskBmkBinBldQty.Left + mskBmkBinBldQty.Width - cmdOK3.Width
' --------------------------------------
lblBmkBinPckQtyTot.Left = mskBmkBinPckQty.Left - frFooter3.Left: lblBmkBinPckQtyTot.Width = mskBmkBinPckQty.Width
lblBmkBinBldQtyTot.Left = mskBmkBinBldQty.Left - frFooter3.Left: lblBmkBinBldQtyTot.Width = mskBmkBinBldQty.Width

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
Set clsBINSTK = Nothing
Set clsAH = Nothing
Set clsBMK = Nothing
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
Set fcmbBdpName = Nothing
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
frFooter3.Visible = EntryMode: frFooter3.Enabled = EntryMode
cmdSaveForm.Enabled = EntryMode
If EntryMode = False Then
    FormAddEditMode = cFORM_SMRYMODE
End If

End Sub

Private Function Data_Verify() As Boolean
Dim mOpgVchNo As Long, mBmkVchNo As Long

Data_Verify = False
If FormAddEditMode = cFORM_EDITMODE And Val(mskFormBoundField.Text) < 1 Then
    ErrorBox "Invalid Key Value !!!"
    txtEttName.SetFocus
    GoTo EndSub
End If
If Val(fcmbEttName.BoundText) < 1 Or Val(fcmbEttName.BoundText) <> mBmkEttCode Or (FormAddEditMode = cFORM_EDITMODE And mBmkEttCode <> mBmkEttCode_old) Then
    ErrorBox "Invalid Donor/Person Selection !!!"
    txtEttName.SetFocus
    GoTo EndSub
End If
If Val(fcmbEfmName.BoundText) < 1 Or Val(fcmbEfmName.BoundText) <> mBmkEfmCode Or (FormAddEditMode = cFORM_EDITMODE And mBmkEfmCode <> mBmkEfmCode_old) Then
    ErrorBox "Invalid Donor/Person Family Selection !!!"
    txtEfmName.SetFocus
    GoTo EndSub
End If

Rem Blood-In validations
mBmkVchNo = Val(UnMyNumFmt(mskBmkVchNo(0).Text))
If mBmkVchNo > 0 Then
    If mBmkVchNo <> mBmkVchNo_old Or Val(fcmbVtmName.BoundText) <> mBmkVtmCode_old Or Ctod(dtpBmkDate.Text) <> mBmkDate_old Or FormAddEditMode = cFORM_ADDMODE Then
        If ChkIsDuplVTypeNo(dbBdkDatabase, dbAcDatabase, mTableName:="BloodMkHdr", mChkFieldName:="BkhVchNo", mChkFieldValue:=mBmkVchNo, mKeyFieldName:="BkhCode", mKeyFieldValue:=mBmkCode, mVtmFieldName:="BkhVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="BkhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="BkhDate", mDateFieldValue:=Ctod(dtpBmkDate.Text)) = True Then
            ErrorBox "Duplicate Voucher No. !!!"
            mskBmkVchNo(0).SetFocus
            ' ---------------
            If FormAddEditMode = cFORM_ADDMODE Then
                mBmkVchNo = GetNextVTypeNo(dbBdkDatabase, dbAcDatabase, dbComDatabase, mTableName:="BloodMkHdr", mFieldName:="BkhVchNo", mVtmFieldName:="BkhVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="BkhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="BkhDate", mDateFieldValue:=Ctod(dtpBmkDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
            Else
                mBmkVchNo = mBmkVchNo_old
            End If
            mskBmkVchNo(0).Text = ToMyNumFmt(mBmkVchNo, mDecimals:=0)
            GoTo EndSub
        End If
    End If
Else
    ErrorBox "Invalid Input !!!"
    mskBmkVchNo(0).SetFocus
    GoTo EndSub
End If
If IsDate(dtpBmkDate.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpBmkDate.SetFocus
    GoTo EndSub
ElseIf mFormSysVchType = cCOM_VTYPE_OPNSTK Then
    If Ctod(dtpBmkDate.Text) <> sCmpBookStartDate - 1 Then
        dtpBmkDate.Text = Dtoc(sCmpBookStartDate - 1)
    End If
ElseIf IsFinYrDate(Ctod(dtpBmkDate.Text)) = False Then
    ErrorBox "Invalid Input !!!"
    dtpBmkDate.SetFocus
    GoTo EndSub
ElseIf ChkAnyPriorIsuExist() = True Then
    ErrorBox "Invalid Input !!!"
    dtpBmkDate.SetFocus
    dtpBmkDate.Text = Dtoc(mBmkDate_old)
    GoTo EndSub
End If
If TimeToMin(txtBmkTime_str.Text) > cDAYMINUTES Then
    ErrorBox "Invalid Input !!!"
    txtBmkTime_str.SetFocus
    GoTo EndSub
End If
'If mFormSysVchType = cBDK_VTYPE_BLOODDONATE Then
    If txtBmkTrnRefNo.Text = "" Then
        ErrorBox "Invalid Input !!!"
        txtBmkTrnRefNo.SetFocus
        GoTo EndSub
    End If
'End If
If IsDate(dtpBmkTrnRefDt.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpBmkTrnRefDt.SetFocus
    GoTo EndSub
End If
If ChkAnyShortRcExist() = True Then
    Mfgrd3.SetFocus
    GoTo EndSub
End If
If ChkAnyMisLinkedIsuExist() = True Then
    ErrorBox "Invalid Linking !!!"
    Mfgrd3.SetFocus
    GoTo EndSub
End If

Data_Verify = True

EndSub:
Exit Function

End Function

Private Function Data_NetwAuth() As Boolean
Dim mBmkVchNo As Long
Data_NetwAuth = False

mBmkVchNo = Val(UnMyNumFmt(mskBmkVchNo(0).Text))
If mBmkVchNo <> mBmkVchNo_old Or Val(fcmbVtmName.BoundText) <> mBmkVtmCode_old Or Ctod(dtpBmkDate.Text) <> mBmkDate_old Or FormAddEditMode = cFORM_ADDMODE Then
    If ChkIsDuplVTypeNo(dbBdkDatabase, dbAcDatabase, mTableName:="BloodMkHdr", mChkFieldName:="BkhVchNo", mChkFieldValue:=mBmkVchNo, mKeyFieldName:="BkhCode", mKeyFieldValue:=mBmkCode, mVtmFieldName:="BkhVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="BkhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="BkhDate", mDateFieldValue:=Ctod(dtpBmkDate.Text)) = True Then
        ErrorBox "Duplicate Voucher No. !!!"
        mskBmkVchNo(0).SetFocus
        ' ---------------
        If FormAddEditMode = True Then
            mBmkVchNo = GetNextVTypeNo(dbBdkDatabase, dbAcDatabase, dbComDatabase, mTableName:="BloodMkHdr", mFieldName:="BkhVchNo", mVtmFieldName:="BkhVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="BkhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="BkhDate", mDateFieldValue:=Ctod(dtpBmkDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
        Else
            mBmkVchNo = mBmkVchNo_old
        End If
        mskBmkVchNo(0).Text = ToMyNumFmt(mBmkVchNo, mDecimals:=0)
        Exit Function
    End If
End If

Data_NetwAuth = True

End Function

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
Dim srow As Integer, mBmkICode As Long, mBmkStkICode As Long, mDeleteit As Boolean

srow = Mfgrd3.Row
mBmkICode = Val(Mfgrd3.TextMatrix(srow, X3BMKICODE_COL))
mBmkStkICode = Val(Mfgrd3.TextMatrix(srow, X3BMKSTKICODE_COL))

If MyDeleteKey(Shift, KeyCode, mCheckCtrlMask:=False) = True And mBmkICode > 0 Then
    txtVoid.SetFocus
    If clsBMK.CanDeleteDtl(mBmkCode, mBmkICode) = True Then
        clsBMK.DeleteDtl mBmkCode, mBmkICode
        clsBINSTK.DeleteDtl mBmkStkCode, mBmkStkICode
        
        ShowDtlData mBmkCode
        Mfgrd3.Row = srow
        Mfgrd3.SetFocus
        Call Mfgrd3_RowColChange
    Else
        Mfgrd3.SetFocus
    End If
End If

End Sub

Private Sub Mfgrd3_KeyPress(KeyAscii As Integer)
Dim srow As Integer, ary1 As Variant

If KeyAscii = vbKeyReturn Then
    srow = Mfgrd3.Row
    
    dtlAddEditMode = True
    dtlAddMode = IsFlexNewRow(Mfgrd3, srow)
    VisibleControls True, Mfgrd3.Top + Mfgrd3.RowPos(Mfgrd3.Row)
    If dtlAddMode = True Then
        mskBmkBinSno.Text = ToMyNumFmt(FlexNextSeqno(Mfgrd3, X3BMKSNO_COL), mDecimals:=0)
        dtpBmkBinBldExpDt.Text = Dtoc(Ctod(dtpBmkDate.Text) + 1)
        mskBmkBinPckQty.Text = ToMyNumFmt(1, mDecimals:=-1)
        mskBmkBinBldQty.Text = ToMyNumFmt(1, mDecimals:=-1)
        ary1 = Split(txtEttName.Text & Space(1), Space(1))
        txtBmkBinBldRefNo.Text = Left(ary1(0) & "/" & Format(Ctod(dtpBmkDate.Text), "yymmdd") & "/" & txtBmkTrnRefNo.Text, 25)
        Erase ary1
    Else
        mskBmkBinICode.Text = Val(Mfgrd3.TextMatrix(srow, X3BMKICODE_COL))
        mskBmkBinStkICode.Text = Val(Mfgrd3.TextMatrix(srow, X3BMKSTKICODE_COL))
        mskBmkBinSno.Text = Mfgrd3.TextMatrix(srow, X3BMKSNO_COL)
        fcmbBdgName.BoundText = Mfgrd3.TextMatrix(srow, X3BMKBDGCODE_COL): txtBinBdgName.Text = fcmbBdgName.Text
        fcmbBdcName.BoundText = Mfgrd3.TextMatrix(srow, X3BMKBDCCODE_COL): txtBinBdcName.Text = fcmbBdcName.Text
        txtBmkBinNarr.Text = Mfgrd3.TextMatrix(srow, X3BMKNARR_COL)
        txtBmkBinBldRefNo.Text = Mfgrd3.TextMatrix(srow, X3BMKBLDREFNO_COL)
        dtpBmkBinBldExpDt.Text = Mfgrd3.TextMatrix(srow, X3BMKBLDEXPDT_COL)
        fcmbBdpName.BoundText = Mfgrd3.TextMatrix(srow, X3BMKBDPCODE_COL): txtBinBdpName.Text = fcmbBdpName.Text
        mskBmkBinPckQty.Text = Mfgrd3.TextMatrix(srow, X3BMKPCKQTY_COL)
        mskBmkBinBldQty.Text = Mfgrd3.TextMatrix(srow, X3BMKBLDQTY_COL)
        mskBmkBinItrCode.Text = Val(Mfgrd3.TextMatrix(srow, X3BMKITRCODE_COL))
        mskBmkBinBldCode.Text = Val(Mfgrd3.TextMatrix(srow, X3BMKBLDCODE_COL))
        mskBmkBinItmCode.Text = Val(Mfgrd3.TextMatrix(srow, X3BMKITMCODE_COL))
        
    End If
    txtBinBdgName.SetFocus
    Call ValidDtl
    
    mBmkBdgCode_old = Val(fcmbBdgName.BoundText)
    mBmkBdcCode_old = Val(fcmbBdcName.BoundText)
    mBmkBdpCode_old = Val(fcmbBdpName.BoundText)
    mBmkItrCode_old = Val(mskBmkBinItrCode.Text)
    mBmkBldCode_old = Val(mskBmkBinBldCode.Text)
    mBmkPckQty_old = Val(UnMyNumFmt(mskBmkBinPckQty.Text))
    mBmkItmCode_old = Val(mskBmkBinItmCode.Text)
    mBmkBldRefNo_old = txtBmkBinBldRefNo.Text
End If

End Sub

Private Sub Mfgrd3_RowColChange()
ShowActiveFlexRow Mfgrd3

End Sub

Private Sub mskBmkBinPckQty_GotFocus()
FlashActiveControl mskBmkBinPckQty, True
End Sub

Private Sub mskBmkBinPckQty_LostFocus()
FlashActiveControl mskBmkBinPckQty, False
End Sub

Private Sub mskBmkBinPckQty_Validate(Cancel As Boolean)
mskBmkBinPckQty.Text = ToMyNumFmt(mskBmkBinPckQty.Text, mDecimals:=0, mUseAbs:=True)
If Val(UnMyNumFmt(mskBmkBinPckQty.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskBmkBinPckQty.SetFocus
    Cancel = True
Else
    If FormAddEditMode = cFORM_ADDMODE Or dtlAddMode = True Or Val(UnMyNumFmt(mskBmkBinPckQty.Text)) <> mBmkPckQty_old Then
        Call CalcBmkBldQty
    End If
End If
Call ValidDtl

End Sub

Private Sub mskBmkBinBldQty_GotFocus()
FlashActiveControl mskBmkBinBldQty, True
End Sub

Private Sub mskBmkBinBldQty_LostFocus()
FlashActiveControl mskBmkBinBldQty, False
End Sub

Private Sub mskBmkBinBldQty_Validate(Cancel As Boolean)
mskBmkBinBldQty.Text = ToMyNumFmt(mskBmkBinBldQty.Text, mDecimals:=0, mUseAbs:=True)
If Val(UnMyNumFmt(mskBmkBinBldQty.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskBmkBinBldQty.SetFocus
    Cancel = True
Else
    Rem Call CalcBmkBldQty
End If
Call ValidDtl

End Sub

Private Sub mskBmkVchNo_GotFocus(Index As Integer)
FlashActiveControl mskBmkVchNo(Index), True
End Sub

Private Sub mskBmkVchNo_LostFocus(Index As Integer)
FlashActiveControl mskBmkVchNo(Index), False
End Sub

Private Sub mskBmkVchNo_Validate(Index As Integer, Cancel As Boolean)
Dim mBmkVchNo As Long

mBmkVchNo = Val(UnMyNumFmt(mskBmkVchNo(Index).Text))
If mBmkVchNo < 0 And Index = 0 Then
    mBmkVchNo = GetNextVTypeNo(dbBdkDatabase, dbAcDatabase, dbComDatabase, mTableName:="BloodMkHdr", mFieldName:="BkhVchNo", mVtmFieldName:="BkhVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="BkhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="BkhDate", mDateFieldValue:=Ctod(dtpBmkDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
    mskBmkVchNo(Index).Text = ToMyNumFmt(mBmkVchNo, mDecimals:=0)
ElseIf mBmkVchNo > 0 Then
    If Index = 0 Then
        If mBmkVchNo <> mBmkVchNo_old Or Val(fcmbVtmName.BoundText) <> mBmkVtmCode_old Or Ctod(dtpBmkDate.Text) <> mBmkDate_old Or FormAddEditMode = cFORM_ADDMODE Then
            If ChkIsDuplVTypeNo(dbBdkDatabase, dbAcDatabase, mTableName:="BloodMkHdr", mChkFieldName:="BkhVchNo", mChkFieldValue:=mBmkVchNo, mKeyFieldName:="BkhCode", mKeyFieldValue:=mBmkCode, mVtmFieldName:="BkhVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="BkhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="BkhDate", mDateFieldValue:=Ctod(dtpBmkDate.Text)) = True Then
                ErrorBox "Duplicate Voucher No. !!!"
                Cancel = True
                mskBmkVchNo(Index).SetFocus
                ' ----------
                If FormAddEditMode = cFORM_ADDMODE Then
                    mBmkVchNo = GetNextVTypeNo(dbBdkDatabase, dbAcDatabase, dbComDatabase, mTableName:="BloodMkHdr", mFieldName:="BkhVchNo", mVtmFieldName:="BkhVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="BkhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="BkhDate", mDateFieldValue:=Ctod(dtpBmkDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
                Else
                    mBmkVchNo = mBmkVchNo_old
                End If
                mskBmkVchNo(Index).Text = ToMyNumFmt(mBmkVchNo, mDecimals:=0)
            End If
        End If
        If Cancel = False Then
            mskBmkVchNo(Index).Text = ToMyNumFmt(mBmkVchNo, mDecimals:=0)
        End If
    End If
Else
    ErrorBox "Invalid Input !!!"
    mskBmkVchNo(Index).SetFocus
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
    mBmkEfmCode = 0
    If mEfmRegNo > 0 And FormAddEditMode = cFORM_ADDMODE Then
        Set tRecset = New ADODB.Recordset
        With tRecset
        .open "Select * from EFamilyMast where EfmRegNo = " & CStr(mEfmRegNo) & "", dbBdkDatabase, adOpenKeyset, adLockOptimistic
        If .EOF = False Then
            mBmkEfmCode = .fields("EfmCode")
        Else
            ErrorBox "Reg.No. not Found !!!"
        End If
        End With
        CloseTable tRecset
    End If
    fcmbEfmName.BoundText = CStr(mBmkEfmCode): txtEfmName.Text = fcmbEfmName.Text
    ShowEFamilyData mBmkEfmCode
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
    mBmkEttCode = 0
    If mEttRegNo > 0 And FormAddEditMode = cFORM_ADDMODE Then
        Set tRecset = New ADODB.Recordset
        With tRecset
        .open "Select * from EntityMast where EttRegNo = " & CStr(mEttRegNo) & "", dbBdkDatabase, adOpenKeyset, adLockOptimistic
        If .EOF = False Then
            mBmkEttCode = .fields("EttCode")
        Else
            ErrorBox "Reg.No. not Found !!!"
        End If
        End With
        CloseTable tRecset
    End If
    fcmbEttName.BoundText = CStr(mBmkEttCode): txtEttName.Text = fcmbEttName.Text
    ShowEntityData mBmkEttCode
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

Private Sub txtBinBdpName_Change()
If fcmbBdpName.CallFromText_Change = False Then
    fcmbBdpName.CallFromText_Change = True
    If InterActiveChange(txtBinBdpName) = True Then
        fcmbBdpName.UserText = Array(txtBinBdpName.Text, txtBinBdpName.SelStart)
        fcmbBdpName.Show
        txtBinBdpName.Text = fcmbBdpName.Text
        If fcmbBdpName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbBdpName.CallFromText_Change = False
End If

End Sub

Private Sub txtBinBdpName_GotFocus()
FlashActiveControl txtBinBdpName, True
End Sub

Private Sub txtBinBdpName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtBinBdpName_Change
End If

End Sub

Private Sub txtBinBdpName_LostFocus()
FlashActiveControl txtBinBdpName, False
End Sub

Private Sub txtBinBdpName_Validate(Cancel As Boolean)
If Val(fcmbBdpName.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    txtBinBdpName.SetFocus
    Cancel = True
Else
    If FormAddEditMode = cFORM_ADDMODE Or dtlAddMode = True Or Val(fcmbBdpName.BoundText) <> mBmkBdpCode_old Then
        Call CalcBmkBldQty
    End If
End If
Call ValidDtl

End Sub

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
            fcmbEfmName.BoundText = CStr(mBmkEfmCode_old)
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
'    fcmbEfmName.BoundText = CStr(mBmkEfmCode_old)
'    txtEfmName.Text = fcmbEfmName.Text
ElseIf FormAddEditMode = cFORM_EDITMODE And Val(fcmbEfmName.BoundText) <> mBmkEfmCode_old Then
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

Private Sub txtBmkBinNarr_GotFocus()
FlashActiveControl txtBmkBinNarr, True
End Sub

Private Sub txtBmkBinNarr_LostFocus()
FlashActiveControl txtBmkBinNarr, False
End Sub

Private Sub txtBmkBinNarr_Validate(Cancel As Boolean)
txtBmkBinNarr.Text = ToMyWord(txtBmkBinNarr.Text, mFilterStr:=False)
End Sub

Private Sub txtBmkBinBldRefNo_GotFocus()
FlashActiveControl txtBmkBinBldRefNo, True
End Sub

Private Sub txtBmkBinBldRefNo_LostFocus()
FlashActiveControl txtBmkBinBldRefNo, False
End Sub

Private Sub txtBmkBinBldRefNo_Validate(Cancel As Boolean)
If Trim(txtBmkBinBldRefNo.Text) = "" Then
    ErrorBox "Invalid Input !!!"
    txtBmkBinBldRefNo.SetFocus
    Cancel = True
ElseIf dtlAddMode = False And txtBmkBinBldRefNo.Text <> mBmkBldRefNo_old Then
    AlertBox "Item Reference No. Changed !!!"
End If
Call ValidDtl

End Sub

Private Sub txtBmkTrnRefNo_GotFocus()
FlashActiveControl txtBmkTrnRefNo, True
End Sub

Private Sub txtBmkTrnRefNo_LostFocus()
FlashActiveControl txtBmkTrnRefNo, False
End Sub

Private Sub txtBmkTrnRefNo_Validate(Cancel As Boolean)
'If mFormSysVchType = cBDK_VTYPE_BLOODDONATE Then
    If txtBmkTrnRefNo.Text = "" Then
        ErrorBox "Invalid Input !!!"
        txtBmkTrnRefNo.SetFocus
        Cancel = True
    End If
'End If

End Sub

Private Sub txtBkhRemark_GotFocus()
FlashActiveControl txtBkhRemark, True
End Sub

Private Sub txtBkhRemark_LostFocus()
FlashActiveControl txtBkhRemark, False
End Sub

Private Sub txtBkhRemark_Validate(Cancel As Boolean)
txtBkhRemark.Text = ToMyWord(txtBkhRemark.Text, mFilterStr:=False)
End Sub

Private Sub txtBmkTime_str_GotFocus()
FlashActiveControl txtBmkTime_str, True
End Sub

Private Sub txtBmkTime_str_LostFocus()
FlashActiveControl txtBmkTime_str, False
End Sub

Private Sub txtBmkTime_str_Validate(Cancel As Boolean)
txtBmkTime_str.Text = MinToTime(TimeToMin(txtBmkTime_str.Text))
If TimeToMin(txtBmkTime_str.Text) > cDAYMINUTES Then
    ErrorBox "Invalid Input !!!"
    txtBmkTime_str.SetFocus
    Cancel = True
End If

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
Dim mBmkVchNo As Long

If Val(fcmbVtmName.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    txtVtmName(Index).SetFocus
    Cancel = True
Else
    If Index = 0 Then
        If Val(fcmbVtmName.BoundText) <> mBmkVtmCode_old Or Ctod(dtpBmkDate.Text) <> mBmkDate_old Or FormAddEditMode = cFORM_ADDMODE Then
            mBmkVchNo = GetNextVTypeNo(dbBdkDatabase, dbAcDatabase, dbComDatabase, mTableName:="BloodMkHdr", mFieldName:="BkhVchNo", mVtmFieldName:="BkhVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="BkhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="BkhDate", mDateFieldValue:=Ctod(dtpBmkDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
            mskBmkVchNo(Index).Text = ToMyNumFmt(mBmkVchNo, mDecimals:=0)
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
            fcmbEttName.BoundText = CStr(mBmkEttCode_old)
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
''    fcmbEttName.BoundText = CStr(mBmkEttCode_old)
''    txtEttName.Text = fcmbEttName.Text
ElseIf FormAddEditMode = cFORM_EDITMODE And Val(fcmbEttName.BoundText) <> mBmkEttCode_old Then
    ErrorBox "Prohibited in Edit Mode !!!"
    txtEttName.SetFocus
    Cancel = True
Else
    ShowEntityData Val(fcmbEttName.BoundText)
End If

End Sub

Private Sub ShowEntityData(ByVal mEttCode As Long)
Dim tRecset As New ADODB.Recordset

mBmkEttCode = 0
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
    mBmkEttCode = mEttCode
    mskEttRegNo.Text = ToMyNumFmt(.fields("EttRegNo"), mDecimals:=0)
    txtEttAddr.Text = .fields("EttAddr")
    txtEttAraName.Text = .fields("AraName")
    txtEttStnName.Text = .fields("StnName")
    txtEttTelNo.Text = .fields("EttTelNo")
    txtEttSMSNo.Text = .fields("EttSmsNo")
End If
End With
CloseTable tRecset
Call ShowOldBmkCodeDesc

End Sub

Private Sub ShowEFamilyData(ByVal mEfmCode As Long)
Dim tRecset As New ADODB.Recordset

mBmkEfmCode = 0
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
    mBmkEfmCode = mEfmCode
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
If clsBMK.BeginTran(0) = False Then
    Exit Sub
ElseIf clsBINSTK.BeginStock(0) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_ADDMODE

clsBMK.ClearHdr: clsBMK.ClearDtl
clsBINSTK.ClearHdr

mBmkCode = clsBMK.ActiveTrnCode
mBmkStkCode = clsBINSTK.ActiveStkCode

ShowBmkData mBmkCode
ShowStkData mBmkStkCode

Rem restoring user editing features
Call ShowBmkDefData

Rem old values
Call StoreBmkOldData
Call StoreStkOldData

Call ShowEntryMode(True)
mskEttRegNo.SetFocus

End Sub

Private Sub Data_EditEvent()

If CanUserEditOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If clsBMK.BeginTran(datRecset.fields("BkhCode")) = False Then
    Exit Sub
ElseIf clsBINSTK.BeginStock(datRecset.fields("BkhStkCode")) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_EDITMODE

With datRecset
mBmkCode = .fields("BkhCode")
mBmkStkCode = .fields("BkhStkCode")

End With

ShowBmkData mBmkCode
ShowStkData mBmkStkCode

Rem old values
Call StoreBmkOldData
Call StoreStkOldData

Call ShowEntryMode(True)
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

Private Sub ShowBmkData(ByVal mBmkCode As Long)
With clsBMK
.GetHdrData mBmkCode

mskFormBoundField.Text = mBmkCode
mskEttRegNo.Text = 0: mskEfmRegNo.Text = 0
'''fcmbEttName.BoundText = CStr(.mBkhEttCode_lng)
'''fcmbEfmName.BoundText = CStr(.mBkhEfmCode_lng)
txtEttName.Text = fcmbEttName.Text
txtEfmName.Text = fcmbEfmName.Text
fcmbVtmName.BoundText = CStr(.mTrnVtmCode_lng): txtVtmName(0).Text = fcmbVtmName.Text
txtBmkPrefix.Text = .mTrnPrefix_str
mskBmkVchNo(0).Text = ToMyNumFmt(.mTrnVchNo_lng, mDecimals:=0)
dtpBmkDate.Text = Dtoc(.mTrnDate_dt)
txtBmkTime_str.Text = MinToTime(.mBkhTime_lng)
txtBmkTrnRefNo.Text = .mBkhTrnRefNo_str
dtpBmkTrnRefDt.Text = Dtoc(.mBkhTrnRefDt_dt)
txtBkhRemark.Text = .mBkhRemark_str

'If mFormSysVchType = cBDK_VTYPE_BLOODRETINW Then
'    ShowEntityData .mBkhEttCode_lng
'Else
    '''ShowEntityData .mBkhEttCode_lng
    '''ShowEFamilyData .mBkhEfmCode_lng
'End If
mskEttRegNo.Locked = (mBmkCode > 0)
txtEttName.Locked = (mBmkCode > 0)
mskEfmRegNo.Locked = (mBmkCode > 0)
txtEfmName.Locked = (mBmkCode > 0)

Rem Call ShowOldBmkCodeDesc
End With

ShowDtlData mBmkCode
Call ShowLinkTranDtl

End Sub

Private Sub ShowStkData(ByVal mBmkStkCode As Long)
mskBmkBinStkCode.Text = mBmkStkCode

End Sub

Private Sub ShowBmkDefData()
Dim tRecset As New ADODB.Recordset, t1Recset As New ADODB.Recordset, mBmkVchNo As Long

With tRecset
.open "Select top 1 * from BloodMkHdr where BkhVtmCode IN (" & mFormVchTypeList & ") and BkhCmpCode = " & CStr(sFinYrCmpCode) & " order by BkhCode desc", dbBdkDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    dtpBmkDate.Text = Dtoc(.fields("BkhDate"))
    fcmbVtmName.BoundText = CStr(.fields("BkhVtmCode"))
    fcmbEfmName.BoundText = CStr(.fields("BkhEfmCode")): txtEfmName.Text = fcmbEfmName.Text
Else
    dtpBmkDate.Text = Dtoc(DefaultEntryDate)
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
    If Ctod(dtpBmkDate.Text) <> sCmpBookStartDate - 1 Then
        dtpBmkDate.Text = Dtoc(sCmpBookStartDate - 1)
    End If
End If

txtVtmName(0).Text = fcmbVtmName.Text
txtBmkTime_str.Text = MinToTime(TimeToMin(DateTime.Time$))

mBmkVchNo = GetNextVTypeNo(dbBdkDatabase, dbAcDatabase, dbComDatabase, mTableName:="BloodMkHdr", mFieldName:="BkhVchNo", mVtmFieldName:="BkhVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="BkhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="BkhDate", mDateFieldValue:=Ctod(dtpBmkDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
mskBmkVchNo(0).Text = ToMyNumFmt(mBmkVchNo, mDecimals:=0)
dtpBmkTrnRefDt.Text = dtpBmkDate.Text

End Sub

Private Sub StoreBmkOldData()
mBmkCode_old = mBmkCode
mBmkEttCode_old = Val(fcmbEttName.BoundText)
mBmkEfmCode_old = Val(fcmbEfmName.BoundText)
mBmkDate_old = Ctod(dtpBmkDate.Text)
mBmkTime_old = TimeToMin(txtBmkTime_str.Text)
mBmkVtmCode_old = Val(fcmbVtmName.BoundText)
mBmkVchNo_old = Val(UnMyNumFmt(mskBmkVchNo(0).Text))

End Sub

Private Sub StoreStkOldData()
mBmkStkCode_old = mBmkStkCode

End Sub

Private Sub ShowDtlData(ByVal mBmkCode As Long)
Dim srow As Integer, tRecset As New ADODB.Recordset, mColCnt As Integer

srow = 1
Mfgrd3.Rows = 2

With tRecset
.open "Select * from ((BloodMkDtl" _
    & " inner join BloodGrpMst on BloodMkDtl.BmkBdgCode = BloodGrpMst.BdgCode)" _
    & " inner join BloodCompoMst on BloodMkDtl.BmkBdcCode = BloodCompoMst.BdcCode)" _
    & " inner join BloodPckMst on BloodMkDtl.BmkBdpCode = BloodPckMst.BdpCode" _
    & " where BmkCode = " & CStr(mBmkCode) & " order by BmkSno" _
    , dbBdkDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Do While .EOF = False
        If InList(.fields("BmkRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
            
            Mfgrd3.TextMatrix(srow, X3BMKICODE_COL) = .fields("BmkICode")
            Mfgrd3.TextMatrix(srow, X3BMKSTKICODE_COL) = .fields("BmkStkICode")
            Mfgrd3.TextMatrix(srow, X3BMKSNO_COL) = ToMyNumFmt(.fields("BmkSno"), mDecimals:=0)
            Mfgrd3.TextMatrix(srow, X3BDGNAME_COL) = .fields("BdgName")
            Mfgrd3.TextMatrix(srow, X3BDCNAME_COL) = .fields("BdcName")
            Mfgrd3.TextMatrix(srow, X3BMKBLDREFNO_COL) = .fields("BmkBldRefNo")
            Mfgrd3.TextMatrix(srow, X3BMKBLDEXPDT_COL) = Dtoc(.fields("BmkBldExpDt"))
            Mfgrd3.TextMatrix(srow, X3BMKBLDOKSTATUS_COL) = IIf(.fields("BmkBldOkState") = True, "Ok", "X")
            Mfgrd3.TextMatrix(srow, X3BDPNAME_COL) = .fields("BdpName")
            Mfgrd3.TextMatrix(srow, X3BMKPCKQTY_COL) = ToMyNumFmt(.fields("BmkPckQty"), mDecimals:=-1)
            Mfgrd3.TextMatrix(srow, X3BMKBLDQTY_COL) = ToMyNumFmt(.fields("BmkBldQty"), mDecimals:=-1)
            Mfgrd3.TextMatrix(srow, X3BMKNARR_COL) = .fields("BmkNarr")
            Mfgrd3.TextMatrix(srow, X3BMKBDGCODE_COL) = .fields("BmkBdgCode")
            Mfgrd3.TextMatrix(srow, X3BMKBDCCODE_COL) = .fields("BmkBdcCode")
            Mfgrd3.TextMatrix(srow, X3BMKBDPCODE_COL) = .fields("BmkBdpCode")
            Mfgrd3.TextMatrix(srow, X3BMKITRCODE_COL) = .fields("BmkItrCode")
            Mfgrd3.TextMatrix(srow, X3BMKBLDOKSTATE_COL) = .fields("BmkBldOkState")
            Mfgrd3.TextMatrix(srow, X3BMKBLDCODE_COL) = .fields("BmkBldCode")
            Mfgrd3.TextMatrix(srow, X3BMKITMCODE_COL) = .fields("BmkItmCode")
            Mfgrd3.TextMatrix(srow, X3BMKRECSTATE_COL) = .fields("BmkRecState")
            
            Mfgrd3.Rows = Mfgrd3.Rows + 1
            srow = srow + 1
        Else
            If InList(.fields("BmkRecState"), Array(cREC_CANCELED, cREC_DELETED)) = False Then
                ErrorBox Me.Name & "_ShowDtlData_#2316_[Invalid Record Status]"
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

Call CalcFtrTotal

End Sub

Private Sub Data_SaveEvent()

With clsBMK
If FormAddEditMode = cFORM_ADDMODE Then
    .ClearHdr
Else
    .GetHdrData mBmkCode
End If
.mTrnDate_dt = Ctod(dtpBmkDate.Text)
.mTrnVtmCode_lng = Val(fcmbVtmName.BoundText)
.mTrnPrefix_str = txtBmkPrefix.Text
.mTrnVchNo_lng = Val(UnMyNumFmt(mskBmkVchNo(0).Text))
.mTrnPostfix_str = ""
.mTrnCmpCode_int = sFinYrCmpCode

.mBkhStkCode_lng = mBmkStkCode
.mBkhTime_lng = TimeToMin(txtBmkTime_str.Text)
'If mFormSysVchType = cBDK_VTYPE_BLOODRETINW Then
'    .mBkhEttCode_lng = Val(fcmbEttName.BoundText)
'    .mBkhEttCode_lng = 0
'Else
    '''.mBkhEttCode_lng = Val(fcmbEttName.BoundText)
    '''.mBkhEfmCode_lng = Val(fcmbEfmName.BoundText)
'End If
.mBkhTrnRefNo_str = txtBmkTrnRefNo.Text
.mBkhTrnRefDt_dt = Ctod(dtpBmkTrnRefDt.Text)
.mBkhBinPckQty_dbl = Val(UnMyNumFmt(lblBmkBinPckQtyTot.Caption))
.mBkhBinBldQty_dbl = Val(UnMyNumFmt(lblBmkBinBldQtyTot.Caption))
.mBkhRemark_str = txtBkhRemark.Text

If FormAddEditMode = cFORM_ADDMODE Then
    If .AddNewHdr() = True Then
        mskFormBoundField.Text = .mTrnCode_lng
        mBmkCode = .mTrnCode_lng
    End If
Else
    .UpdateHdr mBmkCode
End If
If .mTrnCode_lng > 0 Then   ' updated successfully
    With clsBINSTK
    If FormAddEditMode = cFORM_ADDMODE Then
        .ClearHdr
    Else
        .GetHdrData mBmkStkCode
    End If
    .mShrVtmCode_lng = Val(fcmbVtmName.BoundText)
    .mShrPrefix_str = txtBmkPrefix.Text
    .mShrVchNo_lng = Val(UnMyNumFmt(mskBmkVchNo(0).Text))
    .mShrPostfix_str = ""
    .mShrDate_dt = Ctod(dtpBmkDate.Text)
    .mShrQty_dbl = Val(UnMyNumFmt(lblBmkBinBldQtyTot.Caption))
    .mShrValue_dbl = 0
    .mShrNarr_str = "Automated Blood Make In/Extract Entry"
    .mShrAutoGen_bln = True
    .mShrCmpCode_int = sFinYrCmpCode
    If FormAddEditMode = cFORM_ADDMODE Then
        If .AddNewHdr() = True Then
            mskBmkBinStkCode.Text = .mShrCode_lng
            mBmkStkCode = .mShrCode_lng
        End If
    Else
        .UpdateHdr mBmkStkCode
    End If
    If .mShrCode_lng > 0 Then
        If FormAddEditMode = cFORM_ADDMODE Then
            clsBMK.GetHdrData mBmkCode
            clsBMK.mBkhStkCode_lng = mBmkStkCode
            
            dbBdkDatabase.BeginTrans
            dbBdkDatabase.Execute "Update BloodMkHdr set BkhStkCode = " & CStr(mBmkStkCode) & " where BkhCode=" & CStr(mBmkCode)
            dbBdkDatabase.Execute "Update BloodMkDtl set BmkStkCode = " & CStr(mBmkStkCode) & " where BmkCode=" & CStr(mBmkCode)
            dbBdkDatabase.CommitTrans
        End If
        clsBMK.UpdateTran mBmkCode
        clsBMK.EndTran mBmkCode
        
        .CommitStock mBmkStkCode
        .EndStock mBmkStkCode
        
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

If clsBMK.mTrnCode_lng > 0 Then   ' updated successfully
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

mBmkCode = datRecset.fields("BkhCode")
mBmkStkCode = datRecset.fields("BkhStkCode")
mRecAbsPos = datRecset.AbsolutePosition

If clsBMK.CanDeleteTran(mBmkCode) = True Then
    txtVoid.SetFocus
    If clsBMK.BeginTran(mBmkCode) = True And clsBINSTK.BeginStock(mBmkStkCode) = True Then
        clsBMK.DeleteTran mBmkCode
        clsBMK.UpdateTran mBmkCode
        clsBMK.EndTran mBmkCode
        
        clsBINSTK.DeleteStock mBmkStkCode
        clsBINSTK.CommitStock mBmkStkCode
        clsBINSTK.EndStock mBmkStkCode
        
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
clsBMK.CancelTran mBmkCode
clsBMK.EndTran mBmkCode

clsBINSTK.CancelStock mBmkStkCode
clsBINSTK.EndStock mBmkStkCode

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
        clsListStru.AddFields mExpr:="BmkYrMonth", mAttrib:=cFAT_SYSTEM
        clsListStru.AddFields mExpr:="BmkMnYear", mTitle:="Month", mShowItem:=True, mAlign:=flexAlignLeftCenter, mWidth:=2000
        clsListStru.AddFields mExpr:="BmkCount", mTitle:="Count", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="BmkBinPckQty_sum", mTitle:="Bag", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="BmkBinBldQty_sum", mTitle:="Qty", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        
        datRecset.open "Select format(BkhDate,'yyyy/MM') as BmkYrMonth" _
         & ",Count(BkhCode) as BmkCount" _
         & ",Sum(BkhBinPckQty) as BmkBinPckQty_sum" _
         & ",Sum(BkhBinBldQty) as BmkBinBldQty_sum" _
         & " from BloodMkHdr" _
         & " where BkhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and BkhCode > 0 and BkhVtmCode in (" & mFormVchTypeList & ")" _
         & IIf(mQryEttCode > 0, " and BkhEttCode = " & CStr(mQryEttCode), "") _
         & IIf(mQryEfmCode > 0, " and BkhEfmCode = " & CStr(mQryEfmCode), "") _
         & " group by format(BkhDate,'yyyy/MM')" _
         & " order by format(BkhDate,'yyyy/MM')" _
         , dbComDatabase, adOpenKeyset, adLockReadOnly

    ElseIf optDatewise.Value = True Then
        clsListStru.AddFields mExpr:="BmkDateYMD", mAttrib:=cFAT_SYSTEM
        clsListStru.AddFields mExpr:="BmkDate", mTitle:="Date", mShowItem:=True, mAlign:=flexAlignLeftCenter, mWidth:=2000
        clsListStru.AddFields mExpr:="BmkCount", mTitle:="Count", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="BmkBinPckQty_sum", mTitle:="Bag", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="BmkBinBldQty_sum", mTitle:="Qty", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        
        datRecset.open "Select BkhDate" _
         & ",Count(BkhCode) as BmkCount" _
         & ",Sum(BkhBinPckQty) as BmkBinPckQty_sum" _
         & ",Sum(BkhBinBldQty) as BmkBinBldQty_sum" _
         & " from BloodMkHdr" _
         & " where BkhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and BkhCode > 0 and BkhVtmCode in (" & mFormVchTypeList & ")" _
         & IIf(mQryEttCode > 0, " and BkhEttCode = " & CStr(mQryEttCode), "") _
         & IIf(mQryEfmCode > 0, " and BkhEfmCode = " & CStr(mQryEfmCode), "") _
         & " group by BkhDate" _
         & " order by BkhDate" _
         , dbComDatabase, adOpenKeyset, adLockReadOnly
        
    ElseIf optEntitywise.Value = True Then
        clsListStru.AddFields mExpr:="EttName", mTitle:="Donor/Person Name", mShowItem:=True, mAlign:=flexAlignLeftCenter, mWidth:=3000
        clsListStru.AddFields mExpr:="BmkCount", mTitle:="Count", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="BmkBinPckQty_sum", mTitle:="Bag", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="BmkBinBldQty_sum", mTitle:="Qty", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        
        datRecset.open "Select ett.EttName,hdr.BkhEttCode" _
         & ",Count(BkhCode) as BmkCount" _
         & ",Sum(BkhBinPckQty) as BmkBinPckQty_sum" _
         & ",Sum(BkhBinBldQty) as BmkBinBldQty_sum" _
         & " from BloodMkHdr hdr inner join EntityMast ett on hdr.BkhEttCode = ett.EttCode" _
         & " where BkhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and BkhCode > 0 and BkhVtmCode in (" & mFormVchTypeList & ")" _
         & IIf(mQryEttCode > 0, " and BkhEttCode = " & CStr(mQryEttCode), "") _
         & IIf(mQryEfmCode > 0, " and BkhEfmCode = " & CStr(mQryEfmCode), "") _
         & " group by ett.EttName,hdr.BkhEttCode" _
         & " order by ett.EttName,hdr.BkhEttCode" _
         , dbComDatabase, adOpenKeyset, adLockReadOnly
    
    ElseIf optEFamilywise.Value = True Then
        clsListStru.AddFields mExpr:="EfmName", mTitle:="Entity Family Name", mShowItem:=True, mAlign:=flexAlignLeftCenter, mWidth:=3000
        clsListStru.AddFields mExpr:="BmkCount", mTitle:="Count", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="BmkBinPckQty_sum", mTitle:="Bag", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="BmkBinBldQty_sum", mTitle:="Qty", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        
        datRecset.open "Select ett.EfmName,hdr.BkhEfmCode" _
         & ",Count(BkhCode) as BmkCount" _
         & ",Sum(BkhBinPckQty) as BmkBinPckQty_sum" _
         & ",Sum(BkhBinBldQty) as BmkBinBldQty_sum" _
         & " from BloodMkHdr hdr inner join EFamilyMast efm on hdr.BkhEfmCode = efm.EfmCode" _
         & " where BkhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and BkhCode > 0 and BkhVtmCode in (" & mFormVchTypeList & ")" _
         & IIf(mQryEttCode > 0, " and BkhEttCode = " & CStr(mQryEttCode), "") _
         & IIf(mQryEfmCode > 0, " and BkhEfmCode = " & CStr(mQryEfmCode), "") _
         & " group by efm.EfmName,hdr.BkhEfmCode" _
         & " order by efm.EfmName,hdr.BkhEfmCode" _
         , dbComDatabase, adOpenKeyset, adLockReadOnly
    
    End If
    
ElseIf optDetailed.Value = True Then
    clsListStru.AddFields mExpr:="tBmkSmryId", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="BmkCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="VtmName", mTitle:="Voucher", mAlign:=flexAlignLeftCenter, mWidth:=1500, mShowItem:=True
    clsListStru.AddFields mExpr:="BmkVchNo", mTitle:="Vchr.No", mAlign:=flexAlignRightCenter, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="BmkDate", mTitle:="Date", mAlign:=flexAlignLeftCenter, mWidth:=1300, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="EttCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="EttName", mTitle:="Donor/Person Name", mAlign:=flexAlignLeftCenter, mWidth:=2500, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="EfmCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="EfmName", mTitle:="Donor/Person Family Name", mAlign:=flexAlignLeftCenter, mWidth:=2500, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="BmkPckQty", mTitle:="Bag", mAlign:=flexAlignRightCenter, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="BmkBldQty", mTitle:="Qty", mAlign:=flexAlignRightCenter, mWidth:=1250, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="EttAddr", mTitle:="Address", mAlign:=flexAlignLeftCenter, mWidth:=2000, mShowItem:=True
    clsListStru.AddFields mExpr:="EttAraName", mTitle:="Area", mAlign:=flexAlignLeftCenter, mWidth:=1500, mShowItem:=True
    clsListStru.AddFields mExpr:="EttStnName", mTitle:="Station", mAlign:=flexAlignLeftCenter, mWidth:=1500, mShowItem:=True
    
    datRecset.open "Select hdr.*,ett.*,efm.*" _
     & ",format(BkhDate,'yyyymmdd')+format(BkhCode,'" & cLONGCODESTRFMT & "') as tBmkSmryId" _
     & " from (BloodMkHdr hdr inner join EntityMast ett on hdr.BkhEttCode = ett.EttCode)" _
     & " inner join EFamilyMast efm on hdr.BkhEfmCode = efm.EfmCode" _
     & " where BkhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & IIf(mRemoteAccess = True, " and BkhCode = " & CStr(mBmkCode) & "", "") _
     & " and BkhCode > 0 and BkhVtmCode in (" & mFormVchTypeList & ")" _
     & IIf(mQryEttCode > 0, " and BkhEttCode = " & CStr(mQryEttCode), "") _
     & IIf(mQryEfmCode > 0, " and BkhEfmCode = " & CStr(mQryEfmCode), "") _
     & " order by BkhDate,BkhCode" _
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
MoveRecToFirst datRecset
With datRecset
If .RecordCount > 0 Then
    Do While .EOF = False
        If optMonthwise.Value = True Or optDatewise.Value = True Or optEntitywise.Value = True Or optEFamilywise.Value = True Then
            If optMonthwise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BmkYrMonth")) = .fields("BmkYrMonth")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BmkMnYear")) = MonthName(Val(Right(.fields("BmkYrMonth"), 2))) & "-" & Left(.fields("BmkYrMonth"), 4)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BmkCount")) = ToMyNumFmt(.fields("BmkCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BmkBinPckQty_sum")) = ToMyNumFmt(.fields("BmkBinPckQty_sum"), mDecimals:=-1)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BmkBinBldQty_sum")) = ToMyNumFmt(.fields("BmkBinBldQty_sum"), mDecimals:=-1)
                
            ElseIf optDatewise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BmkDateYMD")) = Format(.fields("BkhDate"), "yyyymmdd")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BmkDate")) = Dtoc(.fields("BkhDate"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BmkCount")) = ToMyNumFmt(.fields("BmkCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BmkBinPckQty_sum")) = ToMyNumFmt(.fields("BmkBinPckQty_sum"), mDecimals:=-1)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BmkBinBldQty_sum")) = ToMyNumFmt(.fields("BmkBinBldQty_sum"), mDecimals:=-1)
                
            ElseIf optEntitywise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttName")) = .fields("EttName")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BmkCount")) = ToMyNumFmt(.fields("BmkCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BmkBinPckQty_sum")) = ToMyNumFmt(.fields("BmkBinPckQty_sum"), mDecimals:=-1)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BmkBinBldQty_sum")) = ToMyNumFmt(.fields("BmkBinBldQty_sum"), mDecimals:=-1)
                
            ElseIf optEFamilywise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EfmName")) = .fields("EfmName")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BmkCount")) = ToMyNumFmt(.fields("BmkCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BmkBinPckQty_sum")) = ToMyNumFmt(.fields("BmkBinPckQty_sum"), mDecimals:=-1)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BmkBinBldQty_sum")) = ToMyNumFmt(.fields("BmkBinBldQty_sum"), mDecimals:=-1)
                
            End If
        
        ElseIf optDetailed.Value = True Then
            clsARA.GetData .fields("EttAraCode")
            clsSTN.GetData .fields("EttStnCode")
            clsVTM.GetData .fields("BkhVtmCode")
            
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("tBmkSmryId")) = .fields("tBmkSmryId")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BmkCode")) = .fields("BkhCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("VtmName")) = clsVTM.mName_str
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BmkVchNo")) = .fields("BkhVchNo")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BmkDate")) = Dtoc(.fields("BkhDate"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BmkPckQty")) = ToMyNumFmt(.fields("BkhBinPckQty"), mDecimals:=-1)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BmkBldQty")) = ToMyNumFmt(.fields("BkhBinBldQty"), mDecimals:=-1)
            ' ------------------------------------
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttCode")) = .fields("BkhEttCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttName")) = .fields("EttName")
            ' ------------------------------------
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EfmCode")) = .fields("BkhEfmCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EfmName")) = .fields("EfmName")
            ' ------------------------------------
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttAddr")) = .fields("EttAddr")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttAraName")) = clsARA.mName_str
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttStnName")) = clsSTN.mName_str
        
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
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("tBmkSmryId"), mText
    ElseIf optMonthwise.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("BmkYrMonth"), mText
    ElseIf optDatewise.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("BmkDateYMD"), mText
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

Private Sub txtBinBdgName_Change()
If fcmbBdgName.CallFromText_Change = False Then
    fcmbBdgName.CallFromText_Change = True
    If InterActiveChange(txtBinBdgName) = True Then
        fcmbBdgName.UserText = Array(txtBinBdgName.Text, txtBinBdgName.SelStart)
        fcmbBdgName.Show
        txtBinBdgName.Text = fcmbBdgName.Text
        If fcmbBdgName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbBdgName.CallFromText_Change = False
End If

End Sub

Private Sub txtBinBdgName_GotFocus()
FlashActiveControl txtBinBdgName, True

End Sub

Private Sub txtBinBdgName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtBinBdgName_Change
End If

End Sub

Private Sub txtBinBdgName_LostFocus()
FlashActiveControl txtBinBdgName, False
End Sub

Private Sub txtBinBdgName_Validate(Cancel As Boolean)
If Val(fcmbBdgName.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    txtBinBdgName.SetFocus
    Cancel = True
Else
    If FormAddEditMode = cFORM_ADDMODE Or dtlAddMode = True Or Val(fcmbBdgName.BoundText) <> mBmkBdgCode_old Then
        Call ChkBldnItmCode
    End If
End If
Call ValidDtl

End Sub

Private Sub txtBinBdcName_Change()
If fcmbBdcName.CallFromText_Change = False Then
    fcmbBdcName.CallFromText_Change = True
    If InterActiveChange(txtBinBdcName) = True Then
        fcmbBdcName.UserText = Array(txtBinBdcName.Text, txtBinBdcName.SelStart)
        fcmbBdcName.Show
        txtBinBdcName.Text = fcmbBdcName.Text
        If fcmbBdcName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbBdcName.CallFromText_Change = False
End If

End Sub

Private Sub txtBinBdcName_GotFocus()
FlashActiveControl txtBinBdcName, True

End Sub

Private Sub txtBinBdcName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtBinBdcName_Change
End If

End Sub

Private Sub txtBinBdcName_LostFocus()
FlashActiveControl txtBinBdcName, False
End Sub

Private Sub txtBinBdcName_Validate(Cancel As Boolean)
If Val(fcmbBdcName.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    txtBinBdcName.SetFocus
    Cancel = True
Else
    If FormAddEditMode = cFORM_ADDMODE Or dtlAddMode = True Or Val(fcmbBdcName.BoundText) <> mBmkBdcCode_old Then
        Call ChkBldnItmCode
        If Val(mskBmkBinItmCode.Text) < 1 Then
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
    dtpBmkBinBldExpDt.Text = Dtoc(Ctod(dtpBmkDate.Text) + .fields("BdcExpDays"))
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

Private Sub CalcBmkBldQty()
Dim tRecset As New ADODB.Recordset, mBdpCode As Long, mBdpQty As Double

mBdpQty = 0
mBdpCode = Val(fcmbBdpName.BoundText)
With tRecset
.open "Select * from BloodPckMst where BdpCode = " & CStr(mBdpCode) & "", dbBdkDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    mBdpQty = .fields("BdpQty")
End If
End With
CloseTable tRecset
mskBmkBinBldQty.Text = ToMyNumFmt(mBdpQty * Val(UnMyNumFmt(mskBmkBinPckQty.Text)), mDecimals:=0)

End Sub

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
mskBmkBinBldCode.Text = CStr(mBldCode)
mskBmkBinItmCode.Text = CStr(mItmCode)
Set tRecset = Nothing

End Sub

Private Sub ShowOldBmkCodeDesc()
Dim tRecset As New ADODB.Recordset, mBmkDate As Date, mEttCode As Long

mEttCode = Val(fcmbEttName.BoundText)
mBmkDate = Ctod(dtpBmkDate.Text)
With tRecset
'If FormAddEditMode = cFORM_ADDMODE Then
'    .Open "Select top 1 bkh.*,vtm.VtmName from BloodMkHdr bkh inner join VTypMast vtm on bkh.BkhVtmCode=vtm.VtmCode where bkh.BkhEttCode=" & CStr(mEttCode) & " order by bkh.BkhDate Desc", dbComDatabase, adOpenKeyset, adLockOptimistic
'Else
    .open "Select top 1 bkh.*,vtm.VtmName from BloodMkHdr bkh" _
        & " inner join VTypMast vtm on bkh.BkhVtmCode = vtm.VtmCode" _
        & " where bkh.BkhEttCode = " & CStr(mEttCode) _
        & " and bkh.BkhCode <> " & CStr(mBmkCode) _
        & " and bkh.BkhDate <= #" & ToSysDate(mBmkDate) & "#" _
        & " and bkh.BkhVtmCode IN (" & mFormVchTypeList & ")" _
        & " order by bkh.BkhDate Desc", dbComDatabase, adOpenKeyset, adLockOptimistic
'End If
If .EOF = False Then
    lblOldBmkCodeDesc.Caption = RTrim(.fields("VtmName")) & " No.:" & CStr(.fields("BkhVchNo")) & " Dated:" & Dtoc(.fields("BkhDate")) & " (" & CStr(mBmkDate - .fields("BkhDate")) & " Days Past)"
    If mBmkDate > DateAdd("M", 3, .fields("BkhDate")) Then
        lblOldBmkCodeDesc.BackColor = vbGreen
    Else
        lblOldBmkCodeDesc.BackColor = vbRed
    End If
Else
    lblOldBmkCodeDesc.Caption = "# First Time #"       ''' & CStr(mEttCode)
    lblOldBmkCodeDesc.BackColor = vbWindowBackground
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
    mskBmkBinSno.Top = mRowPos
    txtBinBdgName.Top = mRowPos
    txtBinBdcName.Top = mRowPos
    txtBmkBinNarr.Top = mRowPos
    txtBmkBinBldRefNo.Top = mRowPos
    dtpBmkBinBldExpDt.Top = mRowPos
    txtBinBdpName.Top = mRowPos
    mskBmkBinPckQty.Top = mRowPos
    mskBmkBinBldQty.Top = mRowPos
    cmdOK3.Top = mRowPos + mskBmkBinBldQty.Height
End If

mskBmkBinICode.Text = 0
mskBmkBinStkICode.Text = 0
mskBmkBinSno.Text = 0
txtBinBdgName.Text = "": fcmbBdgName.BoundText = ""
txtBinBdcName.Text = "": fcmbBdcName.BoundText = ""
txtBmkBinNarr.Text = ""
mskBmkBinBldCode.Text = 0
mskBmkBinItmCode.Text = 0
mskBmkBinItrCode.Text = 0
txtBmkBinBldRefNo.Text = ""
dtpBmkBinBldExpDt.Text = Dtoc(cUNKNOWNDATE)
txtBinBdpName.Text = "": fcmbBdpName.BoundText = ""
mskBmkBinPckQty.Text = ToMyNumFmt(0, mDecimals:=-1)
mskBmkBinBldQty.Text = ToMyNumFmt(0, mDecimals:=-1)

Call ValidDtl

mskBmkBinSno.Visible = mShowItem
txtBinBdgName.Visible = mShowItem
txtBinBdcName.Visible = mShowItem
txtBmkBinNarr.Visible = mShowItem
txtBmkBinBldRefNo.Visible = mShowItem
dtpBmkBinBldExpDt.Visible = mShowItem
txtBinBdpName.Visible = mShowItem
mskBmkBinPckQty.Visible = mShowItem
mskBmkBinBldQty.Visible = mShowItem
cmdOK3.Visible = mShowItem

frHeader.Enabled = (mShowItem = False)
Mfgrd3.Enabled = (mShowItem = False)
frFooter3.Enabled = (mShowItem = False)
cmdSaveForm.Enabled = (mShowItem = False)

End Sub

Private Sub ValidDtl()
Dim mDataOk As Boolean, srow As Integer

srow = Mfgrd3.Row
mDataOk = (Val(fcmbEttName.BoundText) > 0 And Val(fcmbEttName.BoundText) = mBmkEttCode And Val(fcmbEfmName.BoundText) > 0 And Val(fcmbEfmName.BoundText) = mBmkEfmCode And Val(UnMyNumFmt(mskBmkBinSno.Text)) > 0 And Val(fcmbBdgName.BoundText) > 0 And Val(fcmbBdcName.BoundText) > 0 And Val(fcmbBdpName.BoundText) > 0 And Val(mskBmkBinBldCode.Text) > 0 And Val(mskBmkBinItmCode.Text) > 0 And Trim(txtBmkBinBldRefNo.Text) <> "" And IsDate(dtpBmkBinBldExpDt.Text) = True And Ctod(dtpBmkBinBldExpDt.Text) > Ctod(dtpBmkDate.Text) And IIf(dtlAddMode = True, True, Val(mskBmkBinItrCode.Text) > 0 And Val(mskBmkBinICode.Text) > 0 And Val(mskBmkBinStkICode.Text) > 0) And Val(UnMyNumFmt(mskBmkBinPckQty.Text)) >= 0 And Val(UnMyNumFmt(mskBmkBinBldQty.Text)) >= 0)

cmdOK3.Caption = IIf(mDataOk = True, "&OK", "&Cancel")
cmdOK3.BackColor = IIf(mDataOk = True, &H80FF80, &H8080FF)
End Sub

Private Sub CalcFtrTotal(Optional ByVal mCalcBalOnly As Boolean = False)
Dim mDtlPckQtyTot As Double, mDtlBldQtyTot As Double

mDtlPckQtyTot = FlexColSum(Mfgrd3, X3BMKPCKQTY_COL)
mDtlBldQtyTot = FlexColSum(Mfgrd3, X3BMKBLDQTY_COL)

lblBmkBinPckQtyTot.Caption = ToMyNumFmt(mDtlPckQtyTot, mDecimals:=-1)
lblBmkBinBldQtyTot.Caption = ToMyNumFmt(mDtlBldQtyTot, mDecimals:=-1)

End Sub

Private Sub ShowLinkTranDtl()
Dim tRecset As New ADODB.Recordset, mLinkTranStr As String

mLinkTranStr = ""

With tRecset
.open "Select * from ((((BloodOutDtl bou" _
    & " inner join BloodOutHdr boh on bou.BouCode = boh.BohCode)" _
    & " inner join BloodGrpMst bdg on bou.BouBdgCode = bdg.BdgCode)" _
    & " inner join BloodCompoMst bdc on bou.BouBdcCode = bdc.BdcCode)" _
    & " inner join BloodMast bld on bou.BouBldCode = bld.BldCode)" _
    & " inner join VTypMast vtm on boh.BohVtmCode = vtm.VtmCode" _
    & " where BouBmkCode = " & CStr(mBmkCode) _
    & " order by BouDate,BouSno" _
    , dbComDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    Do While .EOF = False
        mLinkTranStr = mLinkTranStr & .fields("VtmName") & " No." & CStr(.fields("BohVchNo")) & " Dt." & Dtoc(.fields("BohDate")) & " Blood Group " & .fields("BdgName") & ", Blood Component " & .fields("BdcName") & " Rf." & .fields("BouBldRefNo") & " Pck/Bld.Qty." & ToMyNumFmt(.fields("BouPckQty"), mDecimals:=-1) & "/" & ToMyNumFmt(.fields("BouBldQty"), mDecimals:=-1) & vbCrLf
    
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
.open "Select top 1 * from ((BloodMkDtl" _
    & " inner join BloodMkHdr on BloodMkDtl.BmkCode = BloodMkHdr.BkhCode)" _
    & " inner join BloodOutDtl on BloodMkDtl.BmkICode = BloodOutDtl.BouBmkICode)" _
    & " Inner Join BloodOutHdr on BloodOutDtl.BouCode = BloodOutHdr.BohCode" _
    & " where BmkCode = " & CStr(mBmkCode) _
    & " and BouDate < #" & CStr(ToSysDate(Ctod(dtpBmkDate.Text))) & "#" _
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

Private Function ChkAnyMisLinkedIsuExist(Optional ByVal mBmkICode) As Boolean
Dim tRecset As New ADODB.Recordset, mMisLinkedDesc As String

ChkAnyMisLinkedIsuExist = False
mMisLinkedDesc = ""

With tRecset
.open "Select top 1 * from ((BloodMkDtl" _
    & " inner join BloodMkHdr on BloodMkDtl.BmkCode = BloodMkHdr.BkhCode)" _
    & " inner join BloodOutDtl on BloodMkDtl.BmkICode = BloodOutDtl.BouBmkICode)" _
    & " Inner Join BloodOutHdr on BloodOutDtl.BouCode = BloodOutHdr.BohCode" _
    & " where BmkCode = " & CStr(mBmkCode) & IIf(IsMissing(mBmkICode) = False, " and BmkICode = " & CStr(mBmkICode), "") _
    & " and (BouBdgCode <> BmkBdgCode or BouBdcCode <> BmkBdcCode  or BouBldCode <> BmkBldCode or BouItmCode <> BmkItmCode or BouItrCode <> BmkItrCode or BouBldRefNo <> BmkBldRefNo)" _
    & " order by BohDate,BohCode" _
    , dbBdkDatabase, adOpenKeyset, adLockOptimistic
    Rem BohEttCode <> " & CStr(Val(fcmbEttName.BoundText)) & " or

If .EOF = False Then
    clsVTM.GetData .fields("BohVtmCode")
    'If .fields("BohEttCode") <> Val(fcmbEttName.BoundText) Then
    '    mMisLinkedDesc = mMisLinkedDesc & "<Party Name>"
    'End If
    If .fields("BouBdgCode") <> .fields("BmkBdgCode") Then
        mMisLinkedDesc = mMisLinkedDesc & "<Blood Group>"
    End If
    If .fields("BouBdcCode") <> .fields("BmkBdcCode") Then
        mMisLinkedDesc = mMisLinkedDesc & "<Blood Component>"
    End If
    If .fields("BouBldCode") <> .fields("BmkBldCode") Then
        mMisLinkedDesc = mMisLinkedDesc & "<Blood Name>"
    End If
    If .fields("BouItmCode") <> .fields("BmkItmCode") Then
        mMisLinkedDesc = mMisLinkedDesc & "<Master Item Name>"
    End If
    If .fields("BouItrCode") <> .fields("BmkItrCode") Then
        mMisLinkedDesc = mMisLinkedDesc & "<Blood Ref.Code>"
    End If
    If .fields("BouBldRefNo") <> .fields("BmkBldRefNo") Then
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

Private Function ChkAnyShortRcExist(Optional ByVal mBmkICode) As Boolean
Dim tRecset As New ADODB.Recordset

ChkAnyShortRcExist = False

With tRecset
.open "Select top 1 * from (((" _
    & "Select BmkICode,BdgCode,BdcCode,BldCode,ItmCode,ItrCode,BldRefNo,sum(PckQty) as PckQty_sum,sum(BldQty) as BldQty_sum from (" _
    & "Select BmkICode,BmkBdgCode as BdgCode,BmkBdcCode as BdcCode,BmkBldCode as BldCode,BmkItmCode as ItmCode,BmkItrCode as ItrCode,BmkBldRefNo as BldRefNo,BmkPckQty as PckQty,BmkBldQty as BldQty from BloodMkDtl" _
    & " inner join BloodMkHdr on BloodMkDtl.BmkCode = BloodMkHdr.BkhCode" _
    & " where BmkCode = " & CStr(mBmkCode) & IIf(IsMissing(mBmkICode) = False, " and BmkICode = " & CStr(mBmkICode), "") _
    & " and BmkRecState IN (" & CStr(cREC_ADDED) & "," & CStr(cREC_EDITED) & "," & CStr(cREC_UNCHANGED) & ")" _
    & " Union All " _
    & "Select BouBmkICode as BmkICode,BouBdgCode as BdgCode,BouBdcCode as BdcCode,BouBldCode as BldCode,BouItmCode as ItmCode,BouItrCode as ItrCode,BouBldRefNo as BldRefNo,(BouPckQty*-1) as PckQty,(BouBldQty*-1) as BldQty from (BloodOutDtl" _
    & " left join BloodOutHdr on BloodOutDtl.BouCode = BloodOutHdr.BohCode)" _
    & " inner join BloodMkDtl on BloodOutDtl.BouBmkICode = BloodMkDtl.BmkICode" _
    & " where BouBmkCode = " & CStr(mBmkCode) & IIf(IsMissing(mBmkICode) = False, " and BouBmkICode = " & CStr(mBmkICode), "") _
    & " and BouRecState <> " & CStr(cREC_CANCELED) _
    & ")" _
    & " group by BmkICode,BdgCode,BdcCode,BldCode,ItmCode,ItrCode,BldRefNo" _
    & " order by BmkICode,BdgCode,BdcCode,BldCode,ItmCode,ItrCode,BldRefNo" _
    & ") as a" _
    & " inner join BloodGrpMst on a.BdgCode = BloodGrpMst.BdgCode)" _
    & " inner join BloodCompoMst on a.BdcCode = BloodCompoMst.BdcCode)" _
    & " inner join BloodMast on a.BldCode = BloodMast.BldCode" _
    & " where PckQty_sum < 0 or BldQty_sum < 0" _
    , dbComDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    ErrorBox "Blood-In going Short for Item " & vbCrLf & .fields("BdgName") & ", " & .fields("BdcName") & " Ref.No." & CStr(.fields("BldRefNo")) & " by Pck/Bld.Qty " & CStr(.fields("PckQty_sum")) & "/" & CStr(.fields("BldQty_sum"))
    ChkAnyShortRcExist = True
End If
End With
CloseTable tRecset

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
Dim mBmkVchNo As Long

If Val(fcmbVtmName.BoundText) < 1 Then
    ErrorBox "Invalid Voucher Type !!!"
    txtVtmName(1).SetFocus
    Exit Sub
End If
If Val(UnMyNumFmt(mskBmkVchNo(1).Text)) < 1 Then
    ErrorBox "Invalid Voucher No. !!!"
    mskBmkVchNo(1).SetFocus
    Exit Sub
Else
    mBmkVchNo = Val(UnMyNumFmt(mskBmkVchNo(1).Text))
    If ChkIsExistVTypeNo(dbBdkDatabase, mTableName:="BloodMkHdr", mChkFieldName:="BkhVchNo", mChkFieldValue:=CStr(mBmkVchNo), mVtmFieldName:="BkhVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="BkhCmpCode", mFinYrFieldValue:=sFinYrCmpCode) = False Then
        ErrorBox "Voucher No. does not Exist !!!"
        mskBmkVchNo(1).SetFocus
        Exit Sub
    End If
End If
If Val(UnMyNumFmt(mskBmkVchNo(2).Text)) < 1 Then
    ErrorBox "Invalid Voucher No. !!!"
    mskBmkVchNo(2).SetFocus
    Exit Sub
Else
    mBmkVchNo = Val(UnMyNumFmt(mskBmkVchNo(2).Text))
    If ChkIsExistVTypeNo(dbBdkDatabase, mTableName:="BloodMkHdr", mChkFieldName:="BkhVchNo", mChkFieldValue:=CStr(mBmkVchNo), mVtmFieldName:="BkhVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="BkhCmpCode", mFinYrFieldValue:=sFinYrCmpCode) = False Then
        ErrorBox "Voucher No. does not Exist !!!"
        mskBmkVchNo(2).SetFocus
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
Dim mFromBmkVchNo As Long, mToBmkVchNo As Long, mBmkVtmCode As Long
Dim fCRView As Form

mFromBmkVchNo = Val(UnMyNumFmt(mskBmkVchNo(1).Text))
mToBmkVchNo = Val(UnMyNumFmt(mskBmkVchNo(2).Text))
mBmkVtmCode = Val(fcmbVtmName.BoundText)

frmMain.Cryst.Reset
frmMain.Cryst.ReportFileName = Trim(Right(cmbCRList.List(cmbCRList.ListIndex), 100))
frmMain.Cryst.DiscardSavedData = True
frmMain.Cryst.DataFiles(0) = dbComDatabaseFullPath

frmMain.Cryst.SelectionFormula = "{vewBloodIn.BkhVchNo}>=" & CStr(mFromBmkVchNo) & " and {vewBloodIn.BkhVchNo}<=" & CStr(mToBmkVchNo) & " and {vewBloodIn.BkhVtmCode}=" & CStr(mBmkVtmCode) & " and {vewBloodIn.BkhCmpCode}=" & CStr(sFinYrCmpCode)
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
        fcmbVtmName.BoundText = CStr(datRecset.fields("BkhVtmCode"))
        txtVtmName(1).Text = fcmbVtmName.Text
        mskBmkVchNo(1).Text = datRecset.fields("BkhVchNo")
        mskBmkVchNo(2).Text = datRecset.fields("BkhVchNo")
        ' ----------------
        Call AssignPrintPara
        frPrintCRList.ZOrder
        frPrintCRList.Visible = True
        Mfgrd1.Enabled = False
        cmbPrintDest.SetFocus
    End If
    
ElseIf mCallSource = "SaveEvent" Then
    txtVtmName(1).Text = fcmbVtmName.Text
    mskBmkVchNo(1).Text = CStr(Val(UnMyNumFmt(mskBmkVchNo(0).Text)))
    mskBmkVchNo(2).Text = CStr(Val(UnMyNumFmt(mskBmkVchNo(0).Text)))
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
