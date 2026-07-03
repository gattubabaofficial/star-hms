VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmBloodMakeTran 
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
      TabIndex        =   31
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
      TabIndex        =   30
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
      ItemData        =   "BloodMke.frx":0000
      Left            =   0
      List            =   "BloodMke.frx":000D
      Style           =   1  'Simple Combo
      TabIndex        =   29
      TabStop         =   0   'False
      Text            =   "cmbFormEntryMode"
      Top             =   480
      Width           =   1455
   End
   Begin VB.TextBox txtVoid 
      CausesValidation=   0   'False
      Height          =   375
      Left            =   0
      TabIndex        =   25
      TabStop         =   0   'False
      Text            =   "Void"
      Top             =   10440
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
      Height          =   9615
      Left            =   120
      TabIndex        =   28
      Top             =   840
      Width           =   14895
      Begin VB.Frame frFooter3 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         ForeColor       =   &H80000008&
         Height          =   435
         Left            =   120
         TabIndex        =   87
         Top             =   7260
         Width           =   14535
         Begin VB.TextBox Text1 
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
            TabIndex        =   93
            Top             =   120
            Width           =   855
         End
         Begin VB.Label Label3 
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
            TabIndex        =   92
            Top             =   1320
            Width           =   7575
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
            Index           =   0
            Left            =   120
            TabIndex        =   91
            Top             =   1320
            Width           =   1575
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
            TabIndex        =   90
            Top             =   0
            Width           =   855
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
            TabIndex        =   89
            Top             =   135
            Width           =   855
         End
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
         TabIndex        =   85
         Tag             =   "AhCode"
         Text            =   "PckQty"
         Top             =   5250
         Width           =   855
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
         TabIndex        =   84
         Text            =   "BdgName"
         Top             =   5250
         Width           =   1620
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
         TabIndex        =   83
         Tag             =   "AhCode"
         Text            =   "1)"
         Top             =   5250
         Width           =   375
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
         TabIndex        =   82
         Top             =   5595
         Width           =   735
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
         TabIndex        =   81
         Tag             =   "AhCode"
         Text            =   "BinICode"
         Top             =   6045
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
         TabIndex        =   80
         Text            =   "BldRefNo"
         Top             =   5250
         Width           =   2790
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
         TabIndex        =   79
         Tag             =   "AhCode"
         Text            =   "BldCode"
         Top             =   6045
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
         TabIndex        =   78
         Tag             =   "AhCode"
         Text            =   "ItrCode"
         Top             =   6045
         Visible         =   0   'False
         Width           =   1335
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
         TabIndex        =   77
         Tag             =   "AhCode"
         Text            =   "StkICode"
         Top             =   6405
         Visible         =   0   'False
         Width           =   1335
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
         TabIndex        =   76
         Text            =   "Narr"
         Top             =   5250
         Width           =   2370
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
         TabIndex        =   75
         Text            =   "BdcName"
         Top             =   5250
         Width           =   2265
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
         TabIndex        =   74
         Tag             =   "AhCode"
         Text            =   "BldQty"
         Top             =   5250
         Width           =   975
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
         TabIndex        =   73
         Text            =   "BdpName"
         Top             =   5250
         Width           =   1365
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
         TabIndex        =   72
         Tag             =   "AhCode"
         Text            =   "ItmCode"
         Top             =   6420
         Visible         =   0   'False
         Width           =   1335
      End
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
         TabIndex        =   71
         Text            =   "dd/mm/yyyy"
         Top             =   5250
         Width           =   1455
      End
      Begin VB.TextBox mskBmkBouBldCode 
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
         TabIndex        =   69
         Tag             =   "AhCode"
         Text            =   "BldCode"
         Top             =   2940
         Visible         =   0   'False
         Width           =   1335
      End
      Begin VB.TextBox txtBouBdpName 
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
         Left            =   9300
         MaxLength       =   50
         TabIndex        =   14
         Text            =   "BdpName"
         Top             =   2100
         Width           =   1455
      End
      Begin VB.TextBox txtBouBdcName 
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
         TabIndex        =   11
         Text            =   "BdcName"
         Top             =   2100
         Width           =   2055
      End
      Begin VB.TextBox txtBmkBouNarr 
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
         TabIndex        =   12
         Text            =   "Narr"
         Top             =   2100
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
         TabIndex        =   24
         Tag             =   "AhCode"
         Text            =   "BouICode"
         Top             =   2940
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
         TabIndex        =   23
         Tag             =   "AhCode"
         Text            =   "BouCode"
         Top             =   2940
         Visible         =   0   'False
         Width           =   1335
      End
      Begin VB.TextBox mskBmkBouStkICode 
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
         TabIndex        =   20
         Tag             =   "AhCode"
         Text            =   "StkICode"
         Top             =   2940
         Visible         =   0   'False
         Width           =   1335
      End
      Begin VB.TextBox mskBmkBouItmCode 
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
         Text            =   "ItmCode"
         Top             =   2940
         Visible         =   0   'False
         Width           =   1335
      End
      Begin VB.TextBox txtBmkBouBldRefNo 
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
         TabIndex        =   13
         Text            =   "RefNo"
         Top             =   2100
         Width           =   2835
      End
      Begin VB.TextBox mskBmkBouICode 
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
         TabIndex        =   21
         Tag             =   "AhCode"
         Text            =   "BouICode"
         Top             =   2940
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
         Left            =   12900
         Style           =   1  'Graphical
         TabIndex        =   17
         Top             =   2100
         Width           =   735
      End
      Begin VB.TextBox mskBmkBouSno 
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
         TabIndex        =   9
         Tag             =   "AhCode"
         Text            =   "1)"
         Top             =   2100
         Width           =   495
      End
      Begin VB.Frame frHeader 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   1575
         Left            =   120
         TabIndex        =   53
         Top             =   240
         Width           =   14655
         Begin VB.TextBox mskBmkBinCode 
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
            Left            =   8100
            TabIndex        =   96
            Text            =   "-1"
            Top             =   240
            Width           =   1455
         End
         Begin VB.TextBox mskBmkBouCode 
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
            Left            =   6600
            TabIndex        =   95
            Text            =   "-1"
            Top             =   240
            Width           =   1455
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
            Left            =   5100
            TabIndex        =   94
            Text            =   "-1"
            Top             =   240
            Width           =   1455
         End
         Begin VB.TextBox mskBmkBouStkCode 
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
            TabIndex        =   66
            Text            =   "-1"
            Top             =   240
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
            TabIndex        =   6
            Text            =   "dd/mm/yyyy"
            Top             =   1140
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
            TabIndex        =   5
            Tag             =   "AhCode"
            Top             =   1140
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
            Left            =   10560
            MaxLength       =   50
            TabIndex        =   4
            TabStop         =   0   'False
            Text            =   "00:00"
            Top             =   720
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
            TabIndex        =   3
            Text            =   "dd/mm/yyyy"
            Top             =   720
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
            Left            =   5880
            TabIndex        =   2
            Tag             =   "AhCode"
            Text            =   "0"
            Top             =   720
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
            TabIndex        =   1
            Top             =   720
            Width           =   1815
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
            Left            =   4920
            TabIndex        =   19
            Tag             =   "AhCode"
            Text            =   "[Prefix]"
            Top             =   720
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
            Left            =   8400
            MaxLength       =   50
            TabIndex        =   7
            Text            =   "HdrNarr"
            Top             =   1140
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
            TabIndex        =   65
            Top             =   1140
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
            TabIndex        =   64
            Top             =   1140
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
            TabIndex        =   59
            Top             =   720
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
            TabIndex        =   58
            Top             =   720
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
            TabIndex        =   57
            Top             =   720
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
            TabIndex        =   56
            Top             =   720
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
            TabIndex        =   55
            Top             =   240
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
            Left            =   7440
            TabIndex        =   54
            Top             =   1140
            Width           =   975
         End
         Begin VB.Shape Shape1 
            BackColor       =   &H00D9FFB3&
            BackStyle       =   1  'Opaque
            Height          =   495
            Index           =   0
            Left            =   0
            Top             =   120
            Width           =   14655
         End
         Begin VB.Shape Shape1 
            BackColor       =   &H00F7D987&
            BackStyle       =   1  'Opaque
            Height          =   975
            Index           =   2
            Left            =   0
            Top             =   600
            Width           =   14655
         End
      End
      Begin VB.TextBox txtBouBdgName 
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
         TabIndex        =   10
         Text            =   "BdgName"
         Top             =   2100
         Width           =   1815
      End
      Begin VB.TextBox mskBmkBouPckQty 
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
         Left            =   10740
         TabIndex        =   15
         Tag             =   "AhCode"
         Text            =   "PckQty"
         Top             =   2100
         Width           =   1155
      End
      Begin VB.TextBox mskBmkBouBldQty 
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
         Left            =   11880
         TabIndex        =   16
         Tag             =   "AhCode"
         Text            =   "BldQty"
         Top             =   2100
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
         TabIndex        =   18
         Top             =   9240
         Width           =   375
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd2 
         Height          =   1875
         Left            =   120
         TabIndex        =   8
         Top             =   1800
         Width           =   14655
         _ExtentX        =   25850
         _ExtentY        =   3307
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
      Begin VB.Frame frFooter2 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         ForeColor       =   &H80000008&
         Height          =   435
         Left            =   120
         TabIndex        =   60
         Top             =   3660
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
            Height          =   285
            Left            =   0
            MultiLine       =   -1  'True
            ScrollBars      =   2  'Vertical
            TabIndex        =   68
            TabStop         =   0   'False
            Top             =   480
            Width           =   9975
         End
         Begin VB.Label lblBmkBouBldQtyTot 
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
            Left            =   7680
            TabIndex        =   67
            Top             =   120
            Width           =   1575
         End
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
            TabIndex        =   63
            Top             =   840
            Width           =   1095
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
            Left            =   1260
            TabIndex        =   62
            Top             =   840
            Width           =   8775
         End
         Begin VB.Label lblBmkBouPckQtyTot 
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
            Left            =   6480
            TabIndex        =   61
            Top             =   120
            Width           =   855
         End
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd3 
         Height          =   2340
         Left            =   120
         TabIndex        =   86
         Top             =   4920
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
      TabIndex        =   27
      Top             =   840
      Width           =   15015
      Begin VB.Frame frConfigure 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   6015
         Left            =   3000
         TabIndex        =   48
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
            TabIndex        =   38
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
            TabIndex        =   46
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
            TabIndex        =   39
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
               TabIndex        =   45
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
               TabIndex        =   40
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
               TabIndex        =   41
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
               TabIndex        =   42
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
               TabIndex        =   43
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
               TabIndex        =   44
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
            TabIndex        =   36
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
            TabIndex        =   35
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
            TabIndex        =   37
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
            TabIndex        =   70
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
            TabIndex        =   52
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
            TabIndex        =   51
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
            TabIndex        =   50
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
            TabIndex        =   49
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
         TabIndex        =   34
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
         TabIndex        =   32
         Top             =   360
         Width           =   4215
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd1 
         Height          =   6375
         Left            =   120
         TabIndex        =   33
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
         TabIndex        =   47
         Top             =   360
         Width           =   735
      End
   End
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Blood Make (Extract)"
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
      TabIndex        =   26
      Top             =   0
      Width           =   9015
   End
End
Attribute VB_Name = "frmBloodMakeTran"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Dim mFormLoaded As Boolean, mLastKeyPressed As Integer, mMaskKeyPressed As Integer
Dim mFormUIdCode As Long, mFormUIdFileName As String, mFormAcsPermFileName As String
Dim mFormSysVchType As Integer, mFormVchTypeList As String, mBmkCode As Long, mBmkStkCode As Long, mBmkEttCode As Long, mBmkHpmCode As Long, mQryEttCode As Long, mQryHpmCode As Long, mEttRegNoChanged As Boolean, mHpmRegNoChanged As Boolean, mBmkDateChanged As Boolean, dtlAddEditMode As Boolean, dtlAddMode As Boolean, dtlEditCanceled As Boolean
Dim mRemoteAccess As Boolean, mEntrySaved As Boolean, mEntryAborted As Boolean
Dim dbAcDatabase As New ADODB.Connection, dbStDatabase As New ADODB.Connection, dbBdkDatabase As New ADODB.Connection, dbGrpDatabase As New ADODB.Connection, dbComDatabase As New ADODB.Connection
Dim datRecset As New ADODB.Recordset
Dim mBmkCode_old As Long, mBmkStkCode_old As Long, mBmkEttCode_old As Long, mBmkHpmCode_old As Long, mBmkDate_old As Date, mBmkVtmCode_old As Long, mBmkVchNo_old As Long, mBmkTime_old As Long
Dim mBmkBdgCode_old As Long, mBmkBdcCode_old As Long, mBmkBldCode_old As Long, mBmkBdpCode_old As Long, mBmkPckQty_old As Double, mBmkItmCode_old As Long, mBmkItrCode_old As Long, mBmkBinCode_old As Long, mBmkBinICode_old As Long
Dim clsAH As clsAccountHead, clsBOUSTK As clsStockJrn, clsBMK As clsBdkMultiTranEntry, clsARA As clsComMastEntry, clsSTN As clsComMastEntry, clsVTM As clsComMastEntry
Dim clsETT As clsBdkMasterEntry, clsHPM As clsBdkMasterEntry, clsBDG As clsBdkMasterEntry, clsBDC As clsBdkMasterEntry, clsBLD As clsBdkMasterEntry, clsBDP As clsBdkMasterEntry
Dim mActiveControl As Object, clsListStru As clsSelectQueryStructure
Dim fcmbVtmName As clsComFlexSearch
Dim fcmbEttName As clsBdkFlexSearch, fcmbHpmName As clsBdkFlexSearch, fcmbBdgName As clsBdkFlexSearch, fcmbBdcName As clsBdkFlexSearch, fcmbBdpName As clsBdkFlexSearch, fcmbBldRefNo As clsBdkFlexSearch

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
Const X2BMKICODE_COL = 0
Const X2BMKSNO_COL = 1
Const X2BDGNAME_COL = 2
Const X2BDCNAME_COL = 3
Const X2BMKNARR_COL = 4
Const X2BMKBLDREFNO_COL = 5
Const X2BDPNAME_COL = 6
Const X2BMKPCKQTY_COL = 7
Const X2BMKBLDQTY_COL = 8
Const X2BMKBDGCODE_COL = 9
Const X2BMKBDCCODE_COL = 10
Const X2BMKBDPCODE_COL = 11
Const X2BMKBLDCODE_COL = 12
Const X2BMKITMCODE_COL = 13
Const X2BMKITRCODE_COL = 14
Const X2BMKSTKICODE_COL = 15
Const X2BOUBINCODE_COL = 16
Const X2BOUBINICODE_COL = 17
Const X2BMKRECSTATE_COL = 18
Const MFGRD2_COLS = 19

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

dtpFromDate.Text = Dtoc(sFinYrStartDate)
dtpToDate.Text = Dtoc(sFinYrEndDate)
mQryEttCode = 0
mQryHpmCode = 0
txtQryEttName.Text = "": fcmbEttName.BoundText = ""
txtQryHpmName.Text = "": fcmbHpmName.BoundText = ""
optExpanded.Value = False
optDetailed.Value = False
optMonthwise.Value = True
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

'Public Property Get EttName() As String
'EttName = txtEttName.Text
'End Property

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
                    dtpFromDate.Text = Dtoc(MonthStartDate(DateSerial(Val(Left(.fields("BmkYrMonth"), 4)), Val(Right(.fields("BmkYrMonth"), 2)), 1)))
                    dtpToDate.Text = Dtoc(MonthEndDate(DateSerial(Val(Left(.fields("BmkYrMonth"), 4)), Val(Right(.fields("BmkYrMonth"), 2)), 1)))
                    optMonthwise.Value = False
                    optDatewise.Value = True
                    
                ElseIf optDatewise.Value = True Then
                    dtpFromDate.Text = Dtoc(.fields("BkhDate"))
                    dtpToDate.Text = Dtoc(.fields("BkhDate"))
                    optDatewise.Value = False
                    optDetailed.Value = True
                    
'                ElseIf optEntitywise.Value = True Then
'                    mQryEttCode = .fields("BkhEttCode")
'                    fcmbEttName.BoundText = CStr(mQryEttCode)
'                    txtQryEttName.Text = fcmbEttName.Text
'                    optEntitywise.Value = False
'                    optDatewise.Value = True
                    
'                ElseIf optHospwise.Value = True Then
'                    mQryHpmCode = .fields("BkhHpmCode")
'                    fcmbHpmName.BoundText = CStr(mQryHpmCode)
'                    txtQryHpmName.Text = fcmbHpmName.Text
'                    optHospwise.Value = False
'                    optDatewise.Value = True
                    
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
        txtVtmName.SetFocus
    End If
End If

End Sub

Private Sub cmdOK_Click()
Dim tRecset As New ADODB.Recordset, srow As Integer, mBmkICode As Long, mBmkStkICode As Long, mBmkItrCode As Long

srow = Mfgrd2.Row
mBmkICode = Val(Mfgrd2.TextMatrix(srow, X2BMKICODE_COL))
mBmkStkICode = Val(Mfgrd2.TextMatrix(srow, X2BMKSTKICODE_COL))
mBmkItrCode = Val(fcmbBldRefNo.BoundText)  ''' Val(Mfgrd2.TextMatrix(srow, X2BMKITRCODE_COL))

If cmdOK.Caption = "&OK" And dtlEditCanceled = False Then
    Rem updating values in saledtl table
    With clsBMK
    If dtlAddMode = True Then
        .ClearDtl
    Else
        .GetDtlData mBmkCode, mBmkICode
    End If
    .mTrnCode_lng = mBmkCode
    .mTrnDtlSno_int = Val(UnMyNumFmt(mskBmkBouSno.Text))
    .mTrnDate_dt = Ctod(dtpBmkDate.Text)
    .mTrnCmpCode_int = sFinYrCmpCode
    
    .mBmkStkCode_lng = mBmkStkCode
    .mBmkStkICode_lng = mBmkStkICode
    .mBmkEttCode_lng = Val(fcmbEttName.BoundText)
    .mBmkHpmCode_lng = Val(fcmbHpmName.BoundText)
    .mBmkBdgCode_lng = Val(fcmbBdgName.BoundText)
    .mBmkBdcCode_lng = Val(fcmbBdcName.BoundText)
    .mBmkNarr_str = txtBmkBouNarr.Text
    .mBmkItmCode_lng = Val(mskBmkBouItmCode.Text)
    .mBmkBldCode_lng = Val(mskBmkBouBldCode.Text)
    .mBmkItrCode_lng = Val(fcmbBldRefNo.BoundText)
    .mBmkBldRefNo_str = txtBmkBouBldRefNo.Text
    .mBmkBinCode_lng = Val(mskBouBinCode.Text)
    .mBmkBinICode_lng = Val(mskBouBinICode.Text)
    .mBmkBdpCode_lng = Val(fcmbBdpName.BoundText)
    .mBmkBldQty_dbl = Val(UnMyNumFmt(mskBmkBouBldQty.Text))
    .mBmkPckQty_dbl = Val(UnMyNumFmt(mskBmkBouPckQty.Text))
    .mBouRemark_str = ""
    
    If dtlAddMode = True Then
        If .AddNewDtl(mBmkCode) = True Then
            mBmkICode = .mTrnDtlICode_lng
        End If
    Else
        .UpdateDtl mBmkCode, mBmkICode
    End If
    End With
    
    Rem updating values in stock table
    With clsBOUSTK
    If dtlAddMode = True Then
        .ClearDtl
    Else
        .GetDtlData mBmkStkCode, mBmkStkICode
    End If
    .mStkSno_int = Val(UnMyNumFmt(mskBmkBouSno.Text))
    .mStkVtmCode_lng = Val(fcmbVtmName.BoundText)
    .mStkPrefix_str = txtBouPrefix.Text
    .mStkVchNo_lng = Val(UnMyNumFmt(mskBmkVchNo.Text))
    .mStkPostfix_str = ""
    .mStkDate_dt = Ctod(dtpBmkDate.Text)
    .mStkItmCode_lng = Val(mskBmkBouItmCode.Text)
    .mStkItmRefCode_lng = Val(fcmbBldRefNo.BoundText)
    .mStkItmRef1Name_str = txtBmkBouBldRefNo.Text
    .mStkItmRef2Name_str = ""
    .mStkQty_dbl = ToIssueQty(Val(UnMyNumFmt(mskBmkBouBldQty.Text)))
    .mStkRate_dbl = 0
    .mStkValue_dbl = 0
    .mStkNarr_str = ""
    .mStkAutoGen_bln = True
    .mStkCmpCode_int = sFinYrCmpCode
    If dtlAddMode = True Then
        If .AddNewDtl(mBmkStkCode) = True Then          ''' , mNewItemRef:=False
            mBmkStkICode = .mStkICode_lng
        End If
    Else
        .UpdateDtl mBmkStkCode, mBmkStkICode
    End If
    End With
    
    Rem updating StkICode in BloodMkDtl
    With clsBMK
    If mBmkICode > 0 And mBmkStkICode > 0 And mBmkItrCode > 0 Then
        If dtlAddMode = True Then
            .GetDtlData mBmkCode, mBmkICode
            
            .mBmkStkICode_lng = mBmkStkICode
            .UpdateDtl mBmkCode, mBmkICode
        Else
        End If
    End If
    End With
    
    RefreshDatabase dbBdkDatabase
    RefreshDatabase dbComDatabase
    ChkAnyExcessIsuExist mBmkICode
    ChkAnyMisLinkedRcExist mBmkICode
    
    With tRecset
    .open "Select * from ((((BloodMkDtl" _
        & " inner join BloodMast on BloodMkDtl.BmkBldCode = BloodMast.BldCode)" _
        & " inner join BloodGrpMst on BloodMkDtl.BmkBdgCode = BloodGrpMst.BdgCode)" _
        & " inner join BloodCompoMst on BloodMkDtl.BmkBdcCode = BloodCompoMst.BdcCode)" _
        & " inner join BloodPckMst on BloodMkDtl.BmkBdpCode = BloodPckMst.BdpCode)" _
        & " left join (BloodInDtl left join BloodInHdr on BloodInDtl.BinCode = BloodInHdr.BihCode)" _
        & " on BloodMkDtl.BmkBinCode = BloodInDtl.BinCode and BloodMkDtl.BmkBinICode = BloodInDtl.BinICode" _
        & " and BloodMkDtl.BmkBdgCode = BloodInDtl.BinBdgCode and BloodMkDtl.BmkBdcCode = BloodInDtl.BinBdcCode" _
        & " and BloodMkDtl.BmkBldCode = BloodInDtl.BinBldCode and BloodMkDtl.BmkItmCode = BloodInDtl.BinItmCode" _
        & " and BloodMkDtl.BmkItrCode = BloodInDtl.BinItrCode" _
        & " where BmkCode = " & CStr(mBmkCode) & " and BmkICode = " & CStr(mBmkICode) _
        & " order by BmkSno", dbBdkDatabase, adOpenKeyset, adLockOptimistic
    
    '''clsBLD.GetData .fields("BmkBdgCode")
    Mfgrd2.TextMatrix(srow, X2BMKICODE_COL) = .fields("BmkICode")
    Mfgrd2.TextMatrix(srow, X2BMKSTKICODE_COL) = .fields("BmkStkICode")
    Mfgrd2.TextMatrix(srow, X2BMKSNO_COL) = ToMyNumFmt(.fields("BmkSno"), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2BDGNAME_COL) = .fields("BdgName")
    Mfgrd2.TextMatrix(srow, X2BDCNAME_COL) = .fields("BdcName")
    Mfgrd2.TextMatrix(srow, X2BMKNARR_COL) = .fields("BmkNarr")
    Mfgrd2.TextMatrix(srow, X2BMKBLDREFNO_COL) = .fields("BmkBldRefNo")
    Mfgrd2.TextMatrix(srow, X2BDPNAME_COL) = .fields("BdpName")
    Mfgrd2.TextMatrix(srow, X2BMKPCKQTY_COL) = ToMyNumFmt(.fields("BmkPckQty"), mDecimals:=-1)
    Mfgrd2.TextMatrix(srow, X2BMKBLDQTY_COL) = ToMyNumFmt(.fields("BmkBldQty"), mDecimals:=-1)
    Mfgrd2.TextMatrix(srow, X2BMKBDGCODE_COL) = .fields("BmkBdgCode")
    Mfgrd2.TextMatrix(srow, X2BMKBDCCODE_COL) = .fields("BmkBdcCode")
    Mfgrd2.TextMatrix(srow, X2BMKBDPCODE_COL) = .fields("BmkBdpCode")
    Mfgrd2.TextMatrix(srow, X2BMKITMCODE_COL) = .fields("BmkItmCode")
    Mfgrd2.TextMatrix(srow, X2BMKBLDCODE_COL) = .fields("BmkBldCode")
    Mfgrd2.TextMatrix(srow, X2BMKITRCODE_COL) = .fields("BmkItrCode")
    Mfgrd2.TextMatrix(srow, X2BOUBINCODE_COL) = .fields("BmkBinCode")
    Mfgrd2.TextMatrix(srow, X2BOUBINICODE_COL) = .fields("BmkBinICode")
    Mfgrd2.TextMatrix(srow, X2BMKRECSTATE_COL) = .fields("BmkRecState")
    
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
    txtSearch1Text_InterActiveChange Format(Ctod(dtpBmkDate.Text), "yyyymmdd") + Format(mBmkCode, cLONGCODESTRFMT)
ElseIf optMonthwise.Value = True Then
    txtSearch1Text_InterActiveChange Format(Ctod(dtpBmkDate.Text), "yyyy") & "/" & Format(Ctod(dtpBmkDate.Text), "mm")
ElseIf optDatewise.Value = True Then
    txtSearch1Text_InterActiveChange Format(Ctod(dtpBmkDate.Text), "yyyymmdd")
'ElseIf optEntitywise.Value = True Then
'    txtSearch1Text_InterActiveChange txtEttName.Text
'ElseIf optHospwise.Value = True Then
'    txtSearch1Text_InterActiveChange txtHpmName.Text
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
                End If
            Else
                Close #mBouAcsPermNo
            End If
        Else
            Close #mBouAcsPermNo
            AlertBox "System Busy, Try Again !!!"
            
            txtVtmName.SetFocus
        End If
    Else
        txtVtmName.SetFocus
    End If
End If
cmdSaveForm.Enabled = True
End Sub

Private Sub dtpBmkDate_Change()
If InterActiveChange(dtpBmkDate) = True Then
    mBmkDateChanged = False
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
If IsFinYrDate(Ctod(dtpFromDate.Text)) = False Then
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
If IsFinYrDate(Ctod(dtpBmkDate.Text)) = False Then
    ErrorBox "Invalid Input !!!"
    dtpBmkDate.SetFocus
    Cancel = True
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
If IsFinYrDate(Ctod(dtpToDate.Text)) = False Then
    ErrorBox "Invalid Date Range !!!"
    dtpToDate.SetFocus
    Cancel = True
End If

End Sub

Private Sub Form_Activate()
If mFormLoaded = False Then
    Select Case mFormSysVchType
    Case cBDK_VTYPE_BLOODISSUED
        lblFormHeading.Caption = "Blood Issue (Outgoing) Voucher"
        lblVchType.Caption = "Vch.Type"
        lblFormHeading.BackColor = RGB(1, 255, 220)
'    Case cCOM_VTYPE_RETNOUTW
'        lblFormHeading.Caption = "Purchase Return Voucher"
'        lblVchType.Caption = "PRet.Type"
'        lblFormHeading.BackColor = RGB(150, 255, 220)
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

OpenAcDataSource dbAcDatabase
OpenStDataSource dbStDatabase
OpenBdkDataSource dbBdkDatabase
OpenGrpDataSource dbGrpDatabase
OpenComDataSource dbComDatabase

mFormVchTypeList = GetSubVchTypeList(cnn:=dbAcDatabase, mSysVchType:=mFormSysVchType, mRtnDefValue:="0")

Set clsListStru = New clsSelectQueryStructure

Set clsBOUSTK = New clsStockJrn
Set clsBOUSTK.dbStDatabase = dbStDatabase
Set clsBOUSTK.dbGrpDatabase = dbGrpDatabase

Set clsAH = New clsAccountHead
Set clsAH.dbAcDatabase = dbAcDatabase
Set clsAH.dbGrpDatabase = dbGrpDatabase

Set clsBMK = New clsBdkMultiTranEntry
Set clsBMK.dbAcDatabase = dbAcDatabase
Set clsBMK.dbStDatabase = dbStDatabase
Set clsBMK.dbBdkDatabase = dbBdkDatabase
clsBMK.blnBloodOutTran = True
clsBMK.Init

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

Set fcmbBdpName = New clsBdkFlexSearch
Set fcmbBdpName.dbBdkDatabase = dbBdkDatabase
Set fcmbBdpName.dbComDatabase = dbComDatabase
fcmbBdpName.blnBloodPckMastList = True
fcmbBdpName.Init

Call RestoreDefaultSmryPara
If mRemoteAccess = True Then
    optDetailed.Value = True
    AddSmryParaLayer mClear:=True
End If

If mRemoteAccess = True Then
    datRecset.open "Select * from (BloodMkHdr" _
        & " inner join EntityMast ett on BloodMkHdr.BkhEttCode = ett.EttCode)" _
        & " inner join HospMast hpm on BloodMkHdr.BkhHpmCode = hpm.HpmCode" _
        & " where BkhCode = " & CStr(mBmkCode) _
        & " and BkhVtmCode IN (" & mFormVchTypeList & ")" _
        & " order by BkhDate,BkhTime" _
        , dbComDatabase, adOpenKeyset, adLockOptimistic
Else
    datRecset.open "Select * from (BloodMkHdr" _
        & " inner join EntityMast ett on BloodMkHdr.BkhEttCode = ett.EttCode)" _
        & " inner join HospMast hpm on BloodMkHdr.BkhHpmCode = hpm.HpmCode" _
        & " where BkhVtmCode IN (" & mFormVchTypeList & ")" _
        & " order by BkhDate,BkhTime" _
        , dbComDatabase, adOpenKeyset, adLockOptimistic
End If
Mfgrd1.FixedCols = 0
Call SmryList

Mfgrd2.FixedRows = 1: Mfgrd2.FixedCols = 0: Mfgrd2.Rows = 2: Mfgrd2.Cols = MFGRD2_COLS: SetGridAutoHeight Mfgrd2

colcnt = X2BMKICODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2BMKICODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BMKSNO_COL: Mfgrd2.ColWidth(colcnt) = mskBmkBouSno.Width: Mfgrd2.TextMatrix(0, colcnt) = "Sno": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BDGNAME_COL: Mfgrd2.ColWidth(colcnt) = txtBouBdgName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Blood Group": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2BDCNAME_COL: Mfgrd2.ColWidth(colcnt) = txtBouBdcName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Blood Component": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2BMKNARR_COL: Mfgrd2.ColWidth(colcnt) = txtBmkBouNarr.Width: Mfgrd2.TextMatrix(0, colcnt) = "Description": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2BMKBLDREFNO_COL: Mfgrd2.ColWidth(colcnt) = txtBmkBouBldRefNo.Width: Mfgrd2.TextMatrix(0, colcnt) = "Ref.No": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2BDPNAME_COL: Mfgrd2.ColWidth(colcnt) = txtBouBdpName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Packing": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2BMKPCKQTY_COL: Mfgrd2.ColWidth(colcnt) = mskBmkBouPckQty.Width: Mfgrd2.TextMatrix(0, colcnt) = "Pck/Bag": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BMKBLDQTY_COL: Mfgrd2.ColWidth(colcnt) = mskBmkBouBldQty.Width: Mfgrd2.TextMatrix(0, colcnt) = "Qty": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BMKBDGCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2BMKBDGCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BMKBDCCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2BMKBDCCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BMKBDPCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2BMKBDPCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BMKITMCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2BMKITMCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BMKBLDCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2BMKBLDCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BMKITRCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2BMKITRCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BMKSTKICODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2BMKSTKICODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BOUBINCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2BOUBINCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BOUBINICODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2BOUBINICODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BMKRECSTATE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2BMKRECSTATE_COL": Mfgrd2.ColAlignment(colcnt) = 7
' ---------------------------
colcnt = X2BMKSNO_COL: mskBmkBouSno.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2BDGNAME_COL: txtBouBdgName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2BDCNAME_COL: txtBouBdcName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2BMKNARR_COL: txtBmkBouNarr.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2BMKBLDREFNO_COL: txtBmkBouBldRefNo.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2BDPNAME_COL: txtBouBdpName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2BMKPCKQTY_COL: mskBmkBouPckQty.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2BMKBLDQTY_COL: mskBmkBouBldQty.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
cmdOK.Left = mskBmkBouBldQty.Left + mskBmkBouBldQty.Width

lblBmkBouPckQtyTot.Left = mskBmkBouPckQty.Left - frFooter2.Left: lblBmkBouPckQtyTot.Width = mskBmkBouPckQty.Width
lblBmkBouBldQtyTot.Left = mskBmkBouBldQty.Left - frFooter2.Left: lblBmkBouBldQtyTot.Width = mskBmkBouBldQty.Width

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
Set clsBOUSTK = Nothing
Set clsAH = Nothing
Set clsBMK = Nothing
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
Set fcmbBdpName = Nothing
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
frFooter2.Visible = EntryMode: frFooter2.Enabled = EntryMode
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
    txtVtmName.SetFocus
    GoTo EndSub
End If
'If Val(fcmbEttName.BoundText) < 1 Or Val(fcmbEttName.BoundText) <> mBmkEttCode Or (FormAddEditMode = cFORM_EDITMODE And mBmkEttCode <> mBmkEttCode_old) Then
'    ErrorBox "Invalid Patient Selection !!!"
'    txtEttName.SetFocus
'    GoTo EndSub
'End If
'If Val(fcmbHpmName.BoundText) < 1 Or Val(fcmbHpmName.BoundText) <> mBmkHpmCode Or (FormAddEditMode = cFORM_EDITMODE And mBmkHpmCode <> mBmkHpmCode_old) Then
'    ErrorBox "Invalid Hospital Selection !!!"
'    txtHpmName.SetFocus
'    GoTo EndSub
'End If
Rem sale validations
mBmkVchNo = Val(UnMyNumFmt(mskBmkVchNo.Text))
If mBmkVchNo > 0 Then
    If mBmkVchNo <> mBmkVchNo_old Or Val(fcmbVtmName.BoundText) <> mBmkVtmCode_old Or Ctod(dtpBmkDate.Text) <> mBmkDate_old Or FormAddEditMode = cFORM_ADDMODE Then
        If ChkIsDuplVTypeNo(dbBdkDatabase, dbAcDatabase, mTableName:="BloodMkHdr", mChkFieldName:="BkhVchNo", mChkFieldValue:=mBmkVchNo, mKeyFieldName:="BkhCode", mKeyFieldValue:=mBmkCode, mVtmFieldName:="BkhVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="BkhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="BkhDate", mDateFieldValue:=Ctod(dtpBmkDate.Text)) = True Then
            ErrorBox "Duplicate Voucher No. !!!"
            mskBmkVchNo.SetFocus
            ' ---------------
            If FormAddEditMode = cFORM_ADDMODE Then
                mBmkVchNo = GetNextVTypeNo(dbBdkDatabase, dbAcDatabase, dbComDatabase, mTableName:="BloodMkHdr", mFieldName:="BkhVchNo", mVtmFieldName:="BkhVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="BkhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="BkhDate", mDateFieldValue:=Ctod(dtpBmkDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
            Else
                mBmkVchNo = mBmkVchNo_old
            End If
            mskBmkVchNo.Text = ToMyNumFmt(mBmkVchNo, mDecimals:=0)
            GoTo EndSub
        End If
    End If
Else
    ErrorBox "Invalid Input !!!"
    mskBmkVchNo.SetFocus
    GoTo EndSub
End If
If IsDate(dtpBmkDate.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpBmkDate.SetFocus
    GoTo EndSub
Else
    If IsFinYrDate(Ctod(dtpBmkDate.Text)) = False Then
        ErrorBox "Invalid Input !!!"
        dtpBmkDate.SetFocus
        GoTo EndSub
    End If
End If
If TimeToMin(txtBmkTime_str.Text) > cDAYMINUTES Then
    ErrorBox "Invalid Input !!!"
    txtBmkTime_str.SetFocus
    GoTo EndSub
End If
If IsDate(dtpBmkTrnRefDt.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpBmkTrnRefDt.SetFocus
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
Dim mBmkVchNo As Long
Data_NetwAuth = False

mBmkVchNo = Val(UnMyNumFmt(mskBmkVchNo.Text))
If mBmkVchNo <> mBmkVchNo_old Or Val(fcmbVtmName.BoundText) <> mBmkVtmCode_old Or Ctod(dtpBmkDate.Text) <> mBmkDate_old Or FormAddEditMode = cFORM_ADDMODE Then
    If ChkIsDuplVTypeNo(dbBdkDatabase, dbAcDatabase, mTableName:="BloodMkHdr", mChkFieldName:="BkhVchNo", mChkFieldValue:=mBmkVchNo, mKeyFieldName:="BkhCode", mKeyFieldValue:=mBmkCode, mVtmFieldName:="BkhVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="BkhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="BkhDate", mDateFieldValue:=Ctod(dtpBmkDate.Text)) = True Then
        ErrorBox "Duplicate Voucher No. !!!"
        mskBmkVchNo.SetFocus
        ' ---------------
        If FormAddEditMode = True Then
            mBmkVchNo = GetNextVTypeNo(dbBdkDatabase, dbAcDatabase, dbComDatabase, mTableName:="BloodMkHdr", mFieldName:="BkhVchNo", mVtmFieldName:="BkhVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="BkhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="BkhDate", mDateFieldValue:=Ctod(dtpBmkDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
        Else
            mBmkVchNo = mBmkVchNo_old
        End If
        mskBmkVchNo.Text = ToMyNumFmt(mBmkVchNo, mDecimals:=0)
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
Dim srow As Integer, mBmkICode As Long, mBmkStkICode As Long, mDeleteit As Boolean

srow = Mfgrd2.Row
mBmkICode = Val(Mfgrd2.TextMatrix(srow, X2BMKICODE_COL))
mBmkStkICode = Val(Mfgrd2.TextMatrix(srow, X2BMKSTKICODE_COL))

If MyDeleteKey(Shift, KeyCode, mCheckCtrlMask:=False) = True And mBmkICode > 0 Then
    mDeleteit = True
    If mDeleteit = True Then
        mDeleteit = CanDelete()
    End If
    If mDeleteit = True Then
        clsBMK.DeleteDtl mBmkCode, mBmkICode
        clsBOUSTK.DeleteDtl mBmkStkCode, mBmkStkICode
        
        ShowDtlData mBmkCode
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
        mskBmkBouSno.Text = ToMyNumFmt(FlexNextSeqno(Mfgrd2, X2BMKSNO_COL), mDecimals:=0)
        mskBmkBouPckQty.Text = ToMyNumFmt(1, mDecimals:=-1)
    Else
        mskBmkBouICode.Text = Val(Mfgrd2.TextMatrix(srow, X2BMKICODE_COL))
        mskBmkBouStkICode.Text = Val(Mfgrd2.TextMatrix(srow, X2BMKSTKICODE_COL))
        mskBmkBouSno.Text = Mfgrd2.TextMatrix(srow, X2BMKSNO_COL)
        txtBmkBouNarr.Text = Mfgrd2.TextMatrix(srow, X2BMKNARR_COL)
        ' -------------------- depedent assignments
        fcmbBdgName.BoundText = Mfgrd2.TextMatrix(srow, X2BMKBDGCODE_COL): txtBouBdgName.Text = fcmbBdgName.Text
        fcmbBdcName.BoundText = Mfgrd2.TextMatrix(srow, X2BMKBDCCODE_COL): txtBouBdcName.Text = fcmbBdcName.Text
        mskBmkBouItmCode.Text = Val(Mfgrd2.TextMatrix(srow, X2BMKITMCODE_COL))
        mskBmkBouBldCode.Text = Val(Mfgrd2.TextMatrix(srow, X2BMKBLDCODE_COL))
        ' --------------------
        Call ChkBldRefNoList
        ' ---------------------
        fcmbBldRefNo.BoundText = Mfgrd2.TextMatrix(srow, X2BMKITRCODE_COL): txtBmkBouBldRefNo.Text = fcmbBldRefNo.Text
        '''txtBmkBouBldRefNo.Text = Mfgrd2.TextMatrix(srow, X2BMKBLDREFNO_COL)
        fcmbBdpName.BoundText = Mfgrd2.TextMatrix(srow, X2BMKBDPCODE_COL): txtBouBdpName.Text = fcmbBdpName.Text
        mskBmkBouPckQty.Text = Mfgrd2.TextMatrix(srow, X2BMKPCKQTY_COL)
        mskBmkBouBldQty.Text = Mfgrd2.TextMatrix(srow, X2BMKBLDQTY_COL)
        mskBouBinCode.Text = Mfgrd2.TextMatrix(srow, X2BOUBINCODE_COL)
        mskBouBinICode.Text = Mfgrd2.TextMatrix(srow, X2BOUBINICODE_COL)
        
    End If
    txtBouBdgName.SetFocus
    Call ValidDtl
    
    mBmkBdgCode_old = Val(fcmbBdgName.BoundText)
    mBmkBdcCode_old = Val(fcmbBdcName.BoundText)
    mBmkBldCode_old = Val(mskBmkBouBldCode.Text)
    mBmkBdpCode_old = Val(fcmbBdpName.BoundText)
    mBmkItmCode_old = Val(mskBmkBouItmCode.Text)
    mBmkItrCode_old = Val(fcmbBldRefNo.BoundText)
    mBmkPckQty_old = Val(UnMyNumFmt(mskBmkBouPckQty.Text))
    mBmkBinCode_old = Val(mskBouBinCode.Text)
    mBmkBinICode_old = Val(mskBouBinICode.Text)
End If

End Sub

Private Sub Mfgrd2_RowColChange()
ShowActiveFlexRow Mfgrd2

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

Private Sub mskBmkBouPckQty_GotFocus()
FlashActiveControl mskBmkBouPckQty, True
End Sub

Private Sub mskBmkBouPckQty_LostFocus()
FlashActiveControl mskBmkBouPckQty, False
End Sub

Private Sub mskBmkBouPckQty_Validate(Cancel As Boolean)
mskBmkBouPckQty.Text = ToMyNumFmt(mskBmkBouPckQty.Text, mDecimals:=0, mUseAbs:=True)
If Val(UnMyNumFmt(mskBmkBouPckQty.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskBmkBouPckQty.SetFocus
    Cancel = True
Else
    If FormAddEditMode = cFORM_ADDMODE Or dtlAddMode = True Or Val(UnMyNumFmt(mskBmkBouPckQty.Text)) <> mBmkPckQty_old Then
        Call CalcBmkBldQty
    End If
End If
Call ValidDtl

End Sub

Private Sub mskBmkBouBldQty_GotFocus()
FlashActiveControl mskBmkBouBldQty, True
End Sub

Private Sub mskBmkBouBldQty_LostFocus()
FlashActiveControl mskBmkBouBldQty, False
End Sub

Private Sub mskBmkBouBldQty_Validate(Cancel As Boolean)
mskBmkBouBldQty.Text = ToMyNumFmt(mskBmkBouBldQty.Text, mDecimals:=0, mUseAbs:=True)
If Val(UnMyNumFmt(mskBmkBouBldQty.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskBmkBouBldQty.SetFocus
    Cancel = True
Else
    Rem Call CalcBmkBldQty
End If
Call ValidDtl

End Sub

Private Sub mskBmkVchNo_GotFocus()
FlashActiveControl mskBmkVchNo, True
End Sub

Private Sub mskBmkVchNo_LostFocus()
FlashActiveControl mskBmkVchNo, False
End Sub

Private Sub mskBmkVchNo_Validate(Cancel As Boolean)
Dim mBmkVchNo As Long

mBmkVchNo = Val(UnMyNumFmt(mskBmkVchNo.Text))
If mBmkVchNo < 0 Then
    mBmkVchNo = GetNextVTypeNo(dbBdkDatabase, dbAcDatabase, dbComDatabase, mTableName:="BloodMkHdr", mFieldName:="BkhVchNo", mVtmFieldName:="BkhVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="BkhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="BkhDate", mDateFieldValue:=Ctod(dtpBmkDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
    mskBmkVchNo.Text = ToMyNumFmt(mBmkVchNo, mDecimals:=0)
ElseIf mBmkVchNo > 0 Then
    If mBmkVchNo <> mBmkVchNo_old Or Val(fcmbVtmName.BoundText) <> mBmkVtmCode_old Or Ctod(dtpBmkDate.Text) <> mBmkDate_old Or FormAddEditMode = cFORM_ADDMODE Then
        If ChkIsDuplVTypeNo(dbBdkDatabase, dbAcDatabase, mTableName:="BloodMkHdr", mChkFieldName:="BkhVchNo", mChkFieldValue:=mBmkVchNo, mKeyFieldName:="BkhCode", mKeyFieldValue:=mBmkCode, mVtmFieldName:="BkhVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="BkhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="BkhDate", mDateFieldValue:=Ctod(dtpBmkDate.Text)) = True Then
            ErrorBox "Duplicate Voucher No. !!!"
            Cancel = True
            mskBmkVchNo.SetFocus
            ' ----------
            If FormAddEditMode = cFORM_ADDMODE Then
                mBmkVchNo = GetNextVTypeNo(dbBdkDatabase, dbAcDatabase, dbComDatabase, mTableName:="BloodMkHdr", mFieldName:="BkhVchNo", mVtmFieldName:="BkhVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="BkhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="BkhDate", mDateFieldValue:=Ctod(dtpBmkDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
            Else
                mBmkVchNo = mBmkVchNo_old
            End If
            mskBmkVchNo.Text = ToMyNumFmt(mBmkVchNo, mDecimals:=0)
        End If
    End If
    If Cancel = False Then
        mskBmkVchNo.Text = ToMyNumFmt(mBmkVchNo, mDecimals:=0)
    End If
Else
    ErrorBox "Invalid Input !!!"
    mskBmkVchNo.SetFocus
    Cancel = True
End If

End Sub

'Private Sub mskEttRegNo_Change()
'If InterActiveChange(mskEttRegNo) = True Then
'    mEttRegNoChanged = True
'End If
'
'End Sub
'
'Private Sub mskEttRegNo_GotFocus()
'FlashActiveControl mskEttRegNo, True
'mEttRegNoChanged = False
'End Sub
'
'Private Sub mskEttRegNo_LostFocus()
'FlashActiveControl mskEttRegNo, False
'End Sub
'
'Private Sub mskEttRegNo_Validate(Cancel As Boolean)
'Dim tRecset As ADODB.Recordset, mEttRegNo As Long
'
'mskEttRegNo.Text = ToMyNumFmt(mskEttRegNo.Text, mDecimals:=0, mUseAbs:=True)
'mEttRegNo = Val(UnMyNumFmt(mskEttRegNo.Text))
'If mEttRegNoChanged = True Then
'    mBmkEttCode = 0
'    If mEttRegNo > 0 And FormAddEditMode = cFORM_ADDMODE Then
'        Set tRecset = New ADODB.Recordset
'        With tRecset
'        .open "Select * from EntityMast where EttRegNo = " & CStr(mEttRegNo) & "", dbBdkDatabase, adOpenKeyset, adLockOptimistic
'        If .EOF = False Then
'            mBmkEttCode = .fields("EttCode")
'        Else
'            ErrorBox "Reg.No. not Found !!!"
'        End If
'        End With
'        CloseTable tRecset
'    End If
'    fcmbEttName.BoundText = CStr(mBmkEttCode): txtEttName.Text = fcmbEttName.Text
'    ShowEntityData mBmkEttCode
'End If
'Set tRecset = Nothing
'
'End Sub

'Private Sub mskHpmRegNo_Change()
'If InterActiveChange(mskHpmRegNo) = True Then
'    mHpmRegNoChanged = True
'End If
'
'End Sub
'
'Private Sub mskHpmRegNo_GotFocus()
'FlashActiveControl mskHpmRegNo, True
'mHpmRegNoChanged = False
'End Sub
'
'Private Sub mskHpmRegNo_LostFocus()
'FlashActiveControl mskHpmRegNo, False
'End Sub
'
'Private Sub mskHpmRegNo_Validate(Cancel As Boolean)
'Dim tRecset As ADODB.Recordset, mHpmRegNo As Long
'
'mskHpmRegNo.Text = ToMyNumFmt(mskHpmRegNo.Text, mDecimals:=0, mUseAbs:=True)
'mHpmRegNo = Val(UnMyNumFmt(mskHpmRegNo.Text))
'If mHpmRegNoChanged = True Then
'    mBmkHpmCode = 0
'    If mHpmRegNo > 0 And FormAddEditMode = cFORM_ADDMODE Then
'        Set tRecset = New ADODB.Recordset
'        With tRecset
'        .open "Select * from HospMast where HpmRegNo = " & CStr(mHpmRegNo) & "", dbBdkDatabase, adOpenKeyset, adLockOptimistic
'        If .EOF = False Then
'            mBmkHpmCode = .fields("HpmCode")
'        Else
'            ErrorBox "Reg.No. not Found !!!"
'        End If
'        End With
'        CloseTable tRecset
'    End If
'    fcmbHpmName.BoundText = CStr(mBmkHpmCode): txtHpmName.Text = fcmbHpmName.Text
'    ShowHospData mBmkHpmCode
'End If
'Set tRecset = Nothing
'
'End Sub

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

Private Sub txtBmkBouNarr_GotFocus()
FlashActiveControl txtBmkBouNarr, True
End Sub

Private Sub txtBmkBouNarr_LostFocus()
FlashActiveControl txtBmkBouNarr, False
End Sub

Private Sub txtBmkBouNarr_Validate(Cancel As Boolean)
txtBmkBouNarr.Text = ToMyWord(txtBmkBouNarr.Text, mFilterStr:=False)
End Sub

Private Sub txtBmkBouBldRefNo_Change()
If fcmbBldRefNo.CallFromText_Change = False Then
    fcmbBldRefNo.CallFromText_Change = True
    If InterActiveChange(txtBmkBouBldRefNo) = True Then
        fcmbBldRefNo.UserText = Array(txtBmkBouBldRefNo.Text, txtBmkBouBldRefNo.SelStart)
        fcmbBldRefNo.Show
        txtBmkBouBldRefNo.Text = fcmbBldRefNo.Text
        If fcmbBldRefNo.ListSelected = True Then
            SendKeys "{TAB}"
        End If
    End If
    fcmbBldRefNo.CallFromText_Change = False
End If

End Sub

Private Sub txtBmkBouBldRefNo_GotFocus()
FlashActiveControl txtBmkBouBldRefNo, True
End Sub

Private Sub txtBmkBouBldRefNo_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtBmkBouBldRefNo_Change
End If

End Sub

Private Sub txtBmkBouBldRefNo_LostFocus()
FlashActiveControl txtBmkBouBldRefNo, False
End Sub

Private Sub txtBmkBouBldRefNo_Validate(Cancel As Boolean)
Dim tRecset As New ADODB.Recordset

If Val(fcmbBldRefNo.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    Rem txtBmkBouBldRefNo.SetFocus
    Rem Cancel = True
Else
    If FormAddEditMode = cFORM_ADDMODE Or dtlAddMode = True Or Val(fcmbBdgName.BoundText) <> mBmkBdgCode_old Or Val(fcmbBdcName.BoundText) <> mBmkBdcCode_old Or Val(mskBmkBouBldCode.Text) <> mBmkBldCode_old Or Val(mskBmkBouItmCode.Text) <> mBmkItmCode_old Or Val(fcmbBldRefNo.BoundText) <> mBmkItrCode_old Then
        With tRecset
        .open "Select * from BloodInDtl bin" _
            & " inner join BloodInHdr bih on bin.BinCode = bih.BihCode" _
            & " where bin.BinBdgCode = " & CStr(Val(fcmbBdgName.BoundText)) _
            & " and bin.BinBdcCode = " & CStr(Val(fcmbBdcName.BoundText)) _
            & " and bin.BinBldCode = " & CStr(Val(mskBmkBouBldCode.Text)) _
            & " and bin.BinItmCode = " & CStr(Val(mskBmkBouItmCode.Text)) _
            & " and bin.BinItrCode = " & CStr(Val(fcmbBldRefNo.BoundText)) _
            , dbBdkDatabase, adOpenKeyset, adLockOptimistic
        Rem & " where bin.BinEttCode = " & CStr(Val(fcmbEttName.BoundText))
        mskBouBinCode.Text = .fields("BinCode")
        mskBouBinICode.Text = .fields("BinICode")
        'If mFormSysVchType = cCOM_VTYPE_RETNOUTW Then
        '    mskBmkBouPckQty.Text = ToMyNumFmt(.fields("PurRate"))
        '    mskPurRate.Text = ToMyNumFmt(.fields("PurSRate"))
        'Else
            fcmbBdpName.BoundText = CStr(.fields("BinBdpCode")): txtBouBdpName.Text = fcmbBdpName.Text
            mskBmkBouPckQty.Text = ToMyNumFmt(.fields("BinPckQty"), mDecimals:=-1)
            mskBmkBouBldQty.Text = ToMyNumFmt(.fields("BinBldQty"), mDecimals:=-1)
        'End If
        End With
        CloseTable tRecset
        
        Rem Call CalcSalChg
    End If
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
Rem nothing
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

'Private Sub txtHpmName_Change()
'If fcmbHpmName.CallFromText_Change = False Then
'    fcmbHpmName.CallFromText_Change = True
'    If InterActiveChange(txtHpmName) = True Then
'        fcmbHpmName.UserText = Array(txtHpmName.Text, txtHpmName.SelStart)
'        fcmbHpmName.Show
'        If FormAddEditMode = cFORM_ADDMODE Then
'            txtHpmName.Text = fcmbHpmName.Text
'        Else
'            AlertBox "Prohibited in Edit Mode !!!"
'            fcmbHpmName.BoundText = CStr(mBmkHpmCode_old)
'            txtHpmName.Text = fcmbHpmName.Text
'        End If
'        If fcmbHpmName.ListSelected = True Then
'            SendKeys "{tab}"
'        End If
'    End If
'    fcmbHpmName.CallFromText_Change = False
'End If
'
'End Sub
'
'Private Sub txtHpmName_GotFocus()
'FlashActiveControl txtHpmName, True
'End Sub
'
'Private Sub txtHpmName_KeyDown(KeyCode As Integer, Shift As Integer)
'If MyDropDownKey(Shift, KeyCode) = True Then
'    Call txtHpmName_Change
'End If
'
'End Sub
'
'Private Sub txtHpmName_LostFocus()
'FlashActiveControl txtHpmName, False
'End Sub
'
'Private Sub txtHpmName_Validate(Cancel As Boolean)
'If Val(fcmbHpmName.BoundText) < 1 Then
'    ErrorBox "Invalid Hospital Selection !!!"
'    Cancel = True
'    txtHpmName.SetFocus
''ElseIf ChkAnyMisLinkedIsuExist() = True Then
''    ErrorBox "Invalid Linking Selection !!!"
''    Cancel = True
''    txtHpmName.SetFocus
''
''    fcmbHpmName.BoundText = CStr(mBmkHpmCode_old)
''    txtHpmName.Text = fcmbHpmName.Text
'ElseIf FormAddEditMode = cFORM_EDITMODE And Val(fcmbHpmName.BoundText) <> mBmkHpmCode_old Then
'    ErrorBox "Prohibited in Edit Mode !!!"
'    txtHpmName.SetFocus
'    Cancel = True
'Else
'    ShowHospData Val(fcmbHpmName.BoundText)
'End If
'
'End Sub

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
Dim mBmkVchNo As Long

If Val(fcmbVtmName.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    txtVtmName.SetFocus
    Cancel = True
Else
    If Val(fcmbVtmName.BoundText) <> mBmkVtmCode_old Or Ctod(dtpBmkDate.Text) <> mBmkDate_old Or FormAddEditMode = cFORM_ADDMODE Then
        mBmkVchNo = GetNextVTypeNo(dbBdkDatabase, dbAcDatabase, dbComDatabase, mTableName:="BloodMkHdr", mFieldName:="BkhVchNo", mVtmFieldName:="BkhVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="BkhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="BkhDate", mDateFieldValue:=Ctod(dtpBmkDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
        mskBmkVchNo.Text = ToMyNumFmt(mBmkVchNo, mDecimals:=0)
    End If
End If

End Sub

'Private Sub txtEttName_Change()
'If fcmbEttName.CallFromText_Change = False Then
'    fcmbEttName.CallFromText_Change = True
'    If InterActiveChange(txtEttName) = True Then
'        fcmbEttName.UserText = Array(txtEttName.Text, txtEttName.SelStart)
'        fcmbEttName.Show
'        If FormAddEditMode = cFORM_ADDMODE Then
'            txtEttName.Text = fcmbEttName.Text
'        Else
'            AlertBox "Prohibited in Edit Mode !!!"
'            fcmbEttName.BoundText = CStr(mBmkEttCode_old)
'            txtEttName.Text = fcmbEttName.Text
'        End If
'        If fcmbEttName.ListSelected = True Then
'            SendKeys "{tab}"
'        End If
'    End If
'    fcmbEttName.CallFromText_Change = False
'End If
'
'End Sub
'
'Private Sub txtEttName_GotFocus()
'FlashActiveControl txtEttName, True
'
'End Sub
'
'Private Sub txtEttName_KeyDown(KeyCode As Integer, Shift As Integer)
'If MyDropDownKey(Shift, KeyCode) = True Then
'    Call txtEttName_Change
'End If
'
'End Sub
'
'Private Sub txtEttName_LostFocus()
'FlashActiveControl txtEttName, False
'End Sub
'
'Private Sub txtEttName_Validate(Cancel As Boolean)
'If Val(fcmbEttName.BoundText) < 1 Then
'    ErrorBox "Invalid Patient Selection !!!"
'    Rem Cancel = True
'    Rem txtEttName.SetFocus
''''ElseIf ChkAnyMisLinkedRcExist() = True Then
''''    ErrorBox "Invalid Patient Selection !!!"
''''    Cancel = True
''''    txtEttName.SetFocus
''''
''''    fcmbEttName.BoundText = CStr(mBmkEttCode_old)
''''    txtEttName.Text = fcmbEttName.Text
'ElseIf FormAddEditMode = cFORM_EDITMODE And Val(fcmbEttName.BoundText) <> mBmkEttCode_old Then
'    ErrorBox "Prohibited in Edit Mode !!!"
'    txtEttName.SetFocus
'    Cancel = True
'Else
'    ShowEntityData Val(fcmbEttName.BoundText)
'End If
'
'End Sub

'Private Sub ShowEntityData(ByVal mEttCode As Long)
'Dim tRecset As New ADODB.Recordset
'
'mBmkEttCode = 0
'
'With tRecset
'.open "Select * from (EntityMast ett" _
'    & " inner join AreaMast ara on ett.EttAraCode = ara.AraCode)" _
'    & " inner join StsnMast stn on ett.EttStnCode = stn.StnCode" _
'    & " where ett.EttCode = " & CStr(mEttCode) & "" _
'    , dbComDatabase, adOpenKeyset, adLockOptimistic
'If .EOF = False Then
'    mBmkEttCode = mEttCode
'    mskEttRegNo.Text = ToMyNumFmt(.fields("EttRegNo"), mDecimals:=0)
'End If
'End With
'CloseTable tRecset
'Call ShowOldBmkCodeDesc
'
'End Sub

'Private Sub ShowHospData(ByVal mHpmCode As Long)
'Dim tRecset As New ADODB.Recordset
'
'mBmkHpmCode = 0
'
'With tRecset
'.open "Select * from (HospMast efm" _
'    & " inner join AreaMast ara on efm.HpmAraCode = ara.AraCode)" _
'    & " inner join StsnMast stn on efm.HpmStnCode = stn.StnCode" _
'    & " where efm.HpmCode = " & CStr(mHpmCode) & "" _
'    , dbComDatabase, adOpenKeyset, adLockOptimistic
'If .EOF = False Then
'    mBmkHpmCode = mHpmCode
'    mskHpmRegNo.Text = ToMyNumFmt(.fields("HpmRegNo"), mDecimals:=0)
'End If
'End With
'CloseTable tRecset
'
'End Sub

Private Sub Data_AddEvent()

If CanUserAddOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If clsBMK.BeginTran(0) = False Then
    Exit Sub
ElseIf clsBOUSTK.BeginStock(0) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_ADDMODE

clsBMK.ClearHdr: clsBMK.ClearDtl
clsBOUSTK.ClearHdr

mBmkCode = clsBMK.ActiveTrnCode
mBmkStkCode = clsBOUSTK.ActiveStkCode

ShowBmkData mBmkCode
ShowStkData mBmkStkCode

Rem restoring user editing features
Call ShowBmkDefData

Rem old values
Call StoreBmkOldData
Call StoreStkOldData

Call ShowEntryMode(True)
txtVtmName.SetFocus

End Sub

Private Sub Data_EditEvent()

If CanUserEditOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If clsBMK.BeginTran(datRecset.fields("BkhCode")) = False Then
    Exit Sub
ElseIf clsBOUSTK.BeginStock(datRecset.fields("BkhStkCode")) = False Then
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
txtVtmName.SetFocus

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
'''mskEttRegNo.Text = 0: mskHpmRegNo.Text = 0
'''fcmbEttName.BoundText = CStr(.mBkhEttCode_lng): txtEttName.Text = fcmbEttName.Text
'''fcmbHpmName.BoundText = CStr(.mBkhHpmCode_lng): txtHpmName.Text = fcmbHpmName.Text
fcmbVtmName.BoundText = CStr(.mTrnVtmCode_lng): txtVtmName.Text = fcmbVtmName.Text
txtBouPrefix.Text = .mTrnPrefix_str
mskBmkVchNo.Text = ToMyNumFmt(.mTrnVchNo_lng, mDecimals:=0)
dtpBmkDate.Text = Dtoc(.mTrnDate_dt)
txtBmkTime_str.Text = MinToTime(.mBkhTime_lng)
txtBmkTrnRefNo.Text = .mBkhTrnRefNo_str
dtpBmkTrnRefDt.Text = Dtoc(.mBkhTrnRefDt_dt)
txtBkhRemark.Text = .mBkhRemark_str

'''ShowEntityData .mBkhEttCode_lng
'''ShowHospData .mBkhHpmCode_lng

'''mskEttRegNo.Locked = (mBmkCode > 0)
'''txtEttName.Locked = (mBmkCode > 0)
'''mskHpmRegNo.Locked = (mBmkCode > 0)
'''txtHpmName.Locked = (mBmkCode > 0)

Rem Call ShowOldBmkCodeDesc
End With

ShowDtlData mBmkCode
Call ShowLinkTranDtl

End Sub

Private Sub ShowStkData(ByVal mBmkStkCode As Long)
mskBmkBouStkCode.Text = mBmkStkCode

End Sub

Private Sub ShowBmkDefData()
Dim tRecset As New ADODB.Recordset, t1Recset As New ADODB.Recordset, mBmkVchNo As Long

With tRecset
.open "Select top 1 * from BloodMkHdr where BkhVtmCode IN (" & mFormVchTypeList & ") and BkhCmpCode = " & CStr(sFinYrCmpCode) & " order by BkhCode desc", dbBdkDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    dtpBmkDate.Text = Dtoc(.fields("BkhDate"))
    fcmbVtmName.BoundText = CStr(.fields("BkhVtmCode"))
    '''fcmbHpmName.BoundText = CStr(.fields("BkhHpmCode")): txtHpmName.Text = fcmbHpmName.Text
Else
    dtpBmkDate.Text = Dtoc(DefaultEntryDate)
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

txtVtmName.Text = fcmbVtmName.Text
txtBmkTime_str.Text = MinToTime(TimeToMin(DateTime.Time$))

mBmkVchNo = GetNextVTypeNo(dbBdkDatabase, dbAcDatabase, dbComDatabase, mTableName:="BloodMkHdr", mFieldName:="BkhVchNo", mVtmFieldName:="BkhVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="BkhCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="BkhDate", mDateFieldValue:=Ctod(dtpBmkDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
mskBmkVchNo.Text = ToMyNumFmt(mBmkVchNo, mDecimals:=0)
dtpBmkTrnRefDt.Text = dtpBmkDate.Text

End Sub

Private Sub StoreBmkOldData()
mBmkCode_old = mBmkCode
mBmkEttCode_old = Val(fcmbEttName.BoundText)
mBmkHpmCode_old = Val(fcmbHpmName.BoundText)
mBmkDate_old = Ctod(dtpBmkDate.Text)
mBmkTime_old = TimeToMin(txtBmkTime_str.Text)
mBmkVtmCode_old = Val(fcmbVtmName.BoundText)
mBmkVchNo_old = Val(UnMyNumFmt(mskBmkVchNo.Text))

End Sub

Private Sub StoreStkOldData()
mBmkStkCode_old = mBmkStkCode

End Sub

Private Sub ShowDtlData(ByVal mBmkCode As Long)
Dim srow As Integer, tRecset As New ADODB.Recordset, mColCnt As Integer

srow = 1
Mfgrd2.Rows = 2

With tRecset
.open "Select * from ((((BloodMkDtl" _
    & " inner join BloodMast on BloodMkDtl.BmkBldCode = BloodMast.BldCode)" _
    & " inner join BloodGrpMst on BloodMkDtl.BmkBdgCode = BloodGrpMst.BdgCode)" _
    & " inner join BloodCompoMst on BloodMkDtl.BmkBdcCode = BloodCompoMst.BdcCode)" _
    & " inner join BloodPckMst on BloodMkDtl.BmkBdpCode = BloodPckMst.BdpCode)" _
    & " left join (BloodInDtl left join BloodInHdr on BloodInDtl.BinCode = BloodInHdr.BihCode)" _
    & " on BloodMkDtl.BmkBinCode = BloodInDtl.BinCode and BloodMkDtl.BmkBinICode = BloodInDtl.BinICode" _
    & " and BloodMkDtl.BmkBdgCode = BloodInDtl.BinBdgCode and BloodMkDtl.BmkBdcCode = BloodInDtl.BinBdcCode" _
    & " and BloodMkDtl.BmkBldCode = BloodInDtl.BinBldCode and BloodMkDtl.BmkItmCode = BloodInDtl.BinItmCode" _
    & " and BloodMkDtl.BmkItrCode = BloodInDtl.BinItrCode" _
    & " where BmkCode = " & CStr(mBmkCode) _
    & " order by BmkSno", dbBdkDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Do While .EOF = False
        If InList(.fields("BmkRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
'            clsBLD.GetData .fields("BmkBldCode")
'            clsBDG.GetData .fields("BmkBdgCode")
'            clsBDC.GetData .fields("BmkBdcCode")
'            clsBDP.GetData .fields("BmkBdpCode")
            
            Mfgrd2.TextMatrix(srow, X2BMKICODE_COL) = .fields("BmkICode")
            Mfgrd2.TextMatrix(srow, X2BMKSTKICODE_COL) = .fields("BmkStkICode")
            Mfgrd2.TextMatrix(srow, X2BMKSNO_COL) = ToMyNumFmt(.fields("BmkSno"), mDecimals:=0)
            Mfgrd2.TextMatrix(srow, X2BDGNAME_COL) = .fields("BdgName")       ''clsBLD.mName_str
            Mfgrd2.TextMatrix(srow, X2BDCNAME_COL) = .fields("BdcName")
            Mfgrd2.TextMatrix(srow, X2BMKNARR_COL) = .fields("BmkNarr")
            Mfgrd2.TextMatrix(srow, X2BMKBLDREFNO_COL) = .fields("BmkBldRefNo")
            Mfgrd2.TextMatrix(srow, X2BDPNAME_COL) = .fields("BdpName")
            Mfgrd2.TextMatrix(srow, X2BMKPCKQTY_COL) = ToMyNumFmt(.fields("BmkPckQty"), mDecimals:=-1)
            Mfgrd2.TextMatrix(srow, X2BMKBLDQTY_COL) = ToMyNumFmt(.fields("BmkBldQty"), mDecimals:=-1)
            Mfgrd2.TextMatrix(srow, X2BMKBDGCODE_COL) = .fields("BmkBdgCode")
            Mfgrd2.TextMatrix(srow, X2BMKBDCCODE_COL) = .fields("BmkBdcCode")
            Mfgrd2.TextMatrix(srow, X2BMKBDPCODE_COL) = .fields("BmkBdpCode")
            Mfgrd2.TextMatrix(srow, X2BMKITMCODE_COL) = .fields("BmkItmCode")
            Mfgrd2.TextMatrix(srow, X2BMKBLDCODE_COL) = .fields("BmkBldCode")
            Mfgrd2.TextMatrix(srow, X2BMKITRCODE_COL) = .fields("BmkItrCode")
            Mfgrd2.TextMatrix(srow, X2BOUBINCODE_COL) = .fields("BmkBinCode")
            Mfgrd2.TextMatrix(srow, X2BOUBINICODE_COL) = .fields("BmkBinICode")
            Mfgrd2.TextMatrix(srow, X2BMKRECSTATE_COL) = .fields("BmkRecState")
            
            Mfgrd2.Rows = Mfgrd2.Rows + 1
            srow = srow + 1
        Else
            If InList(.fields("BmkRecState"), Array(cREC_CANCELED, cREC_DELETED)) = False Then
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

With clsBMK
If FormAddEditMode = cFORM_ADDMODE Then
    .ClearHdr
Else
    .GetHdrData mBmkCode
End If
.mTrnDate_dt = Ctod(dtpBmkDate.Text)
.mTrnVtmCode_lng = Val(fcmbVtmName.BoundText)
.mTrnPrefix_str = txtBouPrefix.Text
.mTrnVchNo_lng = Val(UnMyNumFmt(mskBmkVchNo.Text))
.mTrnPostfix_str = ""
.mTrnCmpCode_int = sFinYrCmpCode

.mBkhStkCode_lng = mBmkStkCode
.mBkhTime_lng = TimeToMin(txtBmkTime_str.Text)
'''.mBkhEttCode_lng = Val(fcmbEttName.BoundText)
'''.mBkhHpmCode_lng = Val(fcmbHpmName.BoundText)
.mBkhTrnRefNo_str = txtBmkTrnRefNo.Text
.mBkhTrnRefDt_dt = Ctod(dtpBmkTrnRefDt.Text)
.mBkhBinPckQty_dbl = Val(UnMyNumFmt(lblBmkBouPckQtyTot.Caption))
.mBkhBinBldQty_dbl = Val(UnMyNumFmt(lblBmkBouBldQtyTot.Caption))
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
    With clsBOUSTK
    If FormAddEditMode = cFORM_ADDMODE Then
        .ClearHdr
    Else
        .GetHdrData mBmkStkCode
    End If
    .mShrVtmCode_lng = Val(fcmbVtmName.BoundText)
    .mShrPrefix_str = txtBouPrefix.Text
    .mShrVchNo_lng = Val(UnMyNumFmt(mskBmkVchNo.Text))
    .mShrPostfix_str = ""
    .mShrDate_dt = Ctod(dtpBmkDate.Text)
    .mShrQty_dbl = Val(UnMyNumFmt(lblBmkBouBldQtyTot.Caption))
    .mShrValue_dbl = 0
    .mShrNarr_str = "Automated Blood Make Issue/Consumption"
    .mShrAutoGen_bln = True
    .mShrCmpCode_int = sFinYrCmpCode
    If FormAddEditMode = cFORM_ADDMODE Then
        If .AddNewHdr() = True Then
            mskBmkBouStkCode.Text = .mShrCode_lng
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
            dbBdkDatabase.Execute "Update BloodMkHdr set BkhStkCode = " & CStr(mBmkStkCode) & " where BkhCode =" & CStr(mBmkCode)
            dbBdkDatabase.Execute "Update BloodMkDtl set BmkStkCode = " & CStr(mBmkStkCode) & " where BmkCode =" & CStr(mBmkCode)
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
    If clsBMK.BeginTran(mBmkCode) = True And clsBOUSTK.BeginStock(mBmkStkCode) = True Then
        clsBMK.DeleteTran mBmkCode
        clsBMK.UpdateTran mBmkCode
        clsBMK.EndTran mBmkCode
        
        clsBOUSTK.DeleteStock mBmkStkCode
        clsBOUSTK.CommitStock mBmkStkCode
        clsBOUSTK.EndStock mBmkStkCode
        
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

clsBOUSTK.CancelStock mBmkStkCode
clsBOUSTK.EndStock mBmkStkCode

mEntryAborted = True

End Sub

Private Sub SmryList()
Dim gcolcount As Integer, acount As Integer, mLow As Integer, mHigh As Integer, mPos As Integer, srow As Long, mColCount As Integer
Dim aAcntBal As Variant, mBal As Double

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
        clsListStru.AddFields mExpr:="BmkYrMonth", mAttrib:=cFAT_SYSTEM
        clsListStru.AddFields mExpr:="BmkMnYear", mTitle:="Month", mShowItem:=True, mAlign:=flexAlignLeftCenter, mWidth:=2000
        clsListStru.AddFields mExpr:="BmkCount", mTitle:="Count", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="BmkBouPckQty_sum", mTitle:="Pck/Bag", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="BmkBouBldQty_sum", mTitle:="Qty", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        
        datRecset.open "Select format(BkhDate,'yyyy/MM') as BmkYrMonth" _
         & ",Count(BkhCode) as BmkCount" _
         & ",Sum(BkhBinPckQty) as BmkBouPckQty_sum" _
         & ",Sum(BkhBinBldQty) as BmkBouBldQty_sum" _
         & " from BloodMkHdr" _
         & " where BkhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and BkhCode > 0 and BkhVtmCode IN (" & mFormVchTypeList & ")" _
         & " group by format(BkhDate,'yyyy/MM')" _
         & " order by format(BkhDate,'yyyy/MM')" _
         , dbBdkDatabase, adOpenKeyset, adLockReadOnly
         ''& IIf(mQryEttCode > 0, " and BkhEttCode = " & CStr(mQryEttCode), "")
         ''& IIf(mQryHpmCode > 0, " and BkhHpmCode = " & CStr(mQryHpmCode), "")

    ElseIf optDatewise.Value = True Then
        clsListStru.AddFields mExpr:="BmkDateYMD", mAttrib:=cFAT_SYSTEM
        clsListStru.AddFields mExpr:="BmkDate", mTitle:="Date", mShowItem:=True, mAlign:=flexAlignLeftCenter, mWidth:=2000
        clsListStru.AddFields mExpr:="BmkCount", mTitle:="Count", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="BmkBouPckQty_sum", mTitle:="Pck/Bag", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        clsListStru.AddFields mExpr:="BmkBouBldQty_sum", mTitle:="Qty", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
        
        datRecset.open "Select BkhDate" _
         & ",Count(BkhCode) as BmkCount" _
         & ",Sum(BkhBinPckQty) as BmkBouPckQty_sum" _
         & ",Sum(BkhBinBldQty) as BmkBouBldQty_sum" _
         & " from BloodMkHdr" _
         & " where BkhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and BkhCode > 0 and BkhVtmCode IN (" & mFormVchTypeList & ")" _
         & " group by BkhDate" _
         & " order by BkhDate" _
         , dbBdkDatabase, adOpenKeyset, adLockReadOnly
''         & IIf(mQryEttCode > 0, " and BkhEttCode = " & CStr(mQryEttCode), "")
''         & IIf(mQryHpmCode > 0, " and BkhHpmCode = " & CStr(mQryHpmCode), "")

''    ElseIf optEntitywise.Value = True Then
''        clsListStru.AddFields mExpr:="EttName", mTitle:="Patient Name", mShowItem:=True, mAlign:=flexAlignLeftCenter, mWidth:=3000
''        clsListStru.AddFields mExpr:="BmkCount", mTitle:="Count", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
''        clsListStru.AddFields mExpr:="BmkBouPckQty_sum", mTitle:="Pck/Bag", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
''        clsListStru.AddFields mExpr:="BmkBouBldQty_sum", mTitle:="Qty", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
''
''        datRecset.open "Select ett.EttName,BloodMkHdr.BkhEttCode" _
''         & ",Count(BkhCode) as BmkCount" _
''         & ",Sum(BkhBinPckQty) as BmkBouPckQty_sum" _
''         & ",Sum(BkhBinBldQty) as BmkBouBldQty_sum" _
''         & " from BloodMkHdr inner join EntityMast ett on BloodMkHdr.BkhEttCode = ett.EttCode" _
''         & " where BkhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
''         & " and BkhCode > 0 and BkhVtmCode IN (" & mFormVchTypeList & ")" _
''         & IIf(mQryEttCode > 0, " and BkhEttCode = " & CStr(mQryEttCode), "") _
''         & IIf(mQryHpmCode > 0, " and BkhHpmCode = " & CStr(mQryHpmCode), "") _
''         & " group by ett.EttName,BloodMkHdr.BkhEttCode" _
''         & " order by ett.EttName,BloodMkHdr.BkhEttCode" _
''         , dbComDatabase, adOpenKeyset, adLockReadOnly
    
''    ElseIf optHospwise.Value = True Then
''        clsListStru.AddFields mExpr:="HpmName", mTitle:="Hospital Name", mShowItem:=True, mAlign:=flexAlignLeftCenter, mWidth:=3000
''        clsListStru.AddFields mExpr:="BmkCount", mTitle:="Count", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
''        clsListStru.AddFields mExpr:="BmkBouPckQty_sum", mTitle:="Pck/Bag", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
''        clsListStru.AddFields mExpr:="BmkBouBldQty_sum", mTitle:="Qty", mShowItem:=True, mAlign:=flexAlignRightCenter, mWidth:=1500
''
''        datRecset.open "Select hpm.HpmName,BloodMkHdr.BkhHpmCode" _
''         & ",Count(BkhCode) as BmkCount" _
''         & ",Sum(BkhBinPckQty) as BmkBouPckQty_sum" _
''         & ",Sum(BkhBinBldQty) as BmkBouBldQty_sum" _
''         & " from BloodMkHdr inner join HospMast hpm on BloodMkHdr.BkhHpmCode = hpm.HpmCode" _
''         & " where BkhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
''         & " and BkhCode > 0 and BkhVtmCode IN (" & mFormVchTypeList & ")" _
''         & IIf(mQryEttCode > 0, " and BkhEttCode = " & CStr(mQryEttCode), "") _
''         & IIf(mQryHpmCode > 0, " and BkhHpmCode = " & CStr(mQryHpmCode), "") _
''         & " group by hpm.HpmName,BloodMkHdr.BkhHpmCode" _
''         & " order by hpm.HpmName,BloodMkHdr.BkhHpmCode" _
''         , dbComDatabase, adOpenKeyset, adLockReadOnly
        
    End If
    
ElseIf optDetailed.Value = True Then
    clsListStru.AddFields mExpr:="tBouSmryId", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="BmkCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="VtmName", mTitle:="Voucher", mAlign:=flexAlignLeftCenter, mWidth:=1500, mShowItem:=True
    clsListStru.AddFields mExpr:="BmkVchNo", mTitle:="Vchr.No", mAlign:=flexAlignRightCenter, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="BmkDate", mTitle:="Date", mAlign:=flexAlignLeftCenter, mWidth:=1300, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="EttCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="EttName", mTitle:="Patient Name", mAlign:=flexAlignLeftCenter, mWidth:=2500, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="HpmCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="HpmName", mTitle:="Hospital Name", mAlign:=flexAlignLeftCenter, mWidth:=2500, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="BmkPckQty", mTitle:="Pck/Bag", mAlign:=flexAlignRightCenter, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="BmkBldQty", mTitle:="Qty", mAlign:=flexAlignRightCenter, mWidth:=1250, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="EttAddr", mTitle:="Address", mAlign:=flexAlignLeftCenter, mWidth:=2000, mShowItem:=True
    clsListStru.AddFields mExpr:="EttAraName", mTitle:="Area", mAlign:=flexAlignLeftCenter, mWidth:=1500, mShowItem:=True
    clsListStru.AddFields mExpr:="EttStnName", mTitle:="Station", mAlign:=flexAlignLeftCenter, mWidth:=1500, mShowItem:=True
    
    datRecset.open "Select BloodMkHdr.*,ett.*,hpm.*" _
     & ",format(BkhDate,'yyyymmdd')+format(BkhCode,'" & cLONGCODESTRFMT & "') as tBouSmryId" _
     & " from (BloodMkHdr" _
     & " inner join EntityMast ett on BloodMkHdr.BkhEttCode = ett.EttCode)" _
     & " inner join HospMast hpm on BloodMkHdr.BkhHpmCode = hpm.HpmCode" _
     & " where BkhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & IIf(mRemoteAccess = True, " and BkhCode = " & CStr(mBmkCode) & "", "") _
     & " and BkhCode > 0 and BkhVtmCode IN (" & mFormVchTypeList & ")" _
     & IIf(mQryEttCode > 0, " and BkhEttCode = " & CStr(mQryEttCode), "") _
     & IIf(mQryHpmCode > 0, " and BkhHpmCode = " & CStr(mQryHpmCode), "") _
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
        If optMonthwise.Value = True Or optDatewise.Value = True Or optEntitywise.Value = True Then
            If optMonthwise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BmkYrMonth")) = .fields("BmkYrMonth")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BmkMnYear")) = MonthName(Val(Right(.fields("BmkYrMonth"), 2))) & "-" & Left(.fields("BmkYrMonth"), 4)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BmkCount")) = ToMyNumFmt(.fields("BmkCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BmkBouPckQty_sum")) = ToMyNumFmt(.fields("BmkBouPckQty_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BmkBouBldQty_sum")) = ToMyNumFmt(.fields("BmkBouBldQty_sum"), mDecimals:=-1)
                
            ElseIf optDatewise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BmkDateYMD")) = Format(.fields("BkhDate"), "yyyymmdd")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BmkDate")) = Dtoc(.fields("BkhDate"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BmkCount")) = ToMyNumFmt(.fields("BmkCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BmkBouPckQty_sum")) = ToMyNumFmt(.fields("BmkBouPckQty_sum"), mDecimals:=-1)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BmkBouBldQty_sum")) = ToMyNumFmt(.fields("BmkBouBldQty_sum"), mDecimals:=-1)
                
            ElseIf optEntitywise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttName")) = .fields("EttName")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BmkCount")) = ToMyNumFmt(.fields("BmkCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BmkBouPckQty_sum")) = ToMyNumFmt(.fields("BmkBouPckQty_sum"), mDecimals:=-1)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BmkBouBldQty_sum")) = ToMyNumFmt(.fields("BmkBouBldQty_sum"), mDecimals:=-1)
                
            ElseIf optHospwise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("HpmName")) = .fields("HpmName")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BmkCount")) = ToMyNumFmt(.fields("BmkCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BmkBouPckQty_sum")) = ToMyNumFmt(.fields("BmkBouPckQty_sum"), mDecimals:=-1)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BmkBouBldQty_sum")) = ToMyNumFmt(.fields("BmkBouBldQty_sum"), mDecimals:=-1)
                
            End If
        
        ElseIf optDetailed.Value = True Then
            clsARA.GetData .fields("EttAraCode")
            clsSTN.GetData .fields("EttStnCode")
            clsVTM.GetData .fields("BkhVtmCode")
            
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("tBouSmryId")) = .fields("tBouSmryId")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BmkCode")) = .fields("BkhCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("VtmName")) = clsVTM.mName_str
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BmkVchNo")) = .fields("BkhVchNo")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BmkDate")) = Dtoc(.fields("BkhDate"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BmkPckQty")) = ToMyNumFmt(.fields("BkhBinPckQty"), mDecimals:=-1)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BmkBldQty")) = ToMyNumFmt(.fields("BkhBinBldQty"), mDecimals:=-1)
            ' ------------------------------------
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttCode")) = .fields("EttCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttName")) = .fields("EttName")
            ' ------------------------------------
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("HpmCode")) = .fields("HpmCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("HpmName")) = .fields("HpmName")
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
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("BmkYrMonth"), mText
    ElseIf optDatewise.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("BmkDateYMD"), mText
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

Private Sub txtBouBdgName_Change()
If fcmbBdgName.CallFromText_Change = False Then
    fcmbBdgName.CallFromText_Change = True
    If InterActiveChange(txtBouBdgName) = True Then
        fcmbBdgName.UserText = Array(txtBouBdgName.Text, txtBouBdgName.SelStart)
        fcmbBdgName.Show
        txtBouBdgName.Text = fcmbBdgName.Text
        If fcmbBdgName.ListSelected = True Then
            SendKeys "{TAB}"
        End If
    End If
    fcmbBdgName.CallFromText_Change = False
End If

End Sub

Private Sub txtBouBdgName_GotFocus()
FlashActiveControl txtBouBdgName, True

End Sub

Private Sub txtBouBdgName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtBouBdgName_Change
End If

End Sub

Private Sub txtBouBdgName_LostFocus()
FlashActiveControl txtBouBdgName, False
End Sub

Private Sub txtBouBdgName_Validate(Cancel As Boolean)
If Val(fcmbBdgName.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    txtBouBdgName.SetFocus
    Cancel = True
Else
    If FormAddEditMode = cFORM_ADDMODE Or dtlAddMode = True Or Val(fcmbBdgName.BoundText) <> mBmkBdgCode_old Then
        Call ChkBldnItmCode
        Call ChkBldRefNoList
    End If
End If
Call ValidDtl

End Sub

Private Sub txtBouBdcName_Change()
If fcmbBdcName.CallFromText_Change = False Then
    fcmbBdcName.CallFromText_Change = True
    If InterActiveChange(txtBouBdcName) = True Then
        fcmbBdcName.UserText = Array(txtBouBdcName.Text, txtBouBdcName.SelStart)
        fcmbBdcName.Show
        txtBouBdcName.Text = fcmbBdcName.Text
        If fcmbBdcName.ListSelected = True Then
            SendKeys "{TAB}"
        End If
    End If
    fcmbBdcName.CallFromText_Change = False
End If

End Sub

Private Sub txtBouBdcName_GotFocus()
FlashActiveControl txtBouBdcName, True

End Sub

Private Sub txtBouBdcName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtBouBdcName_Change
End If

End Sub

Private Sub txtBouBdcName_LostFocus()
FlashActiveControl txtBouBdcName, False
End Sub

Private Sub txtBouBdcName_Validate(Cancel As Boolean)
If Val(fcmbBdcName.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    txtBouBdcName.SetFocus
    Cancel = True
Else
    If FormAddEditMode = cFORM_ADDMODE Or dtlAddMode = True Or Val(fcmbBdcName.BoundText) <> mBmkBdcCode_old Then
        Call ChkBldnItmCode
        Call ChkBldRefNoList
    End If
End If
Call ValidDtl

End Sub

Private Sub txtBouBdpName_Change()
If fcmbBdpName.CallFromText_Change = False Then
    fcmbBdpName.CallFromText_Change = True
    If InterActiveChange(txtBouBdpName) = True Then
        fcmbBdpName.UserText = Array(txtBouBdpName.Text, txtBouBdpName.SelStart)
        fcmbBdpName.Show
        txtBouBdpName.Text = fcmbBdpName.Text
        If fcmbBdpName.ListSelected = True Then
            SendKeys "{TAB}"
        End If
    End If
    fcmbBdpName.CallFromText_Change = False
End If

End Sub

Private Sub txtBouBdpName_GotFocus()
FlashActiveControl txtBouBdpName, True
End Sub

Private Sub txtBouBdpName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtBouBdpName_Change
End If

End Sub

Private Sub txtBouBdpName_LostFocus()
FlashActiveControl txtBouBdpName, False
End Sub

Private Sub txtBouBdpName_Validate(Cancel As Boolean)
If Val(fcmbBdpName.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    txtBouBdpName.SetFocus
    Cancel = True
Else
    If FormAddEditMode = cFORM_ADDMODE Or dtlAddMode = True Or Val(fcmbBdpName.BoundText) <> mBmkBdpCode_old Then
        Call CalcBmkBldQty
    End If
End If
Call ValidDtl

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
mskBmkBouBldQty.Text = ToMyNumFmt(mBdpQty * Val(UnMyNumFmt(mskBmkBouPckQty.Text)), mDecimals:=0)

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
mskBmkBouBldCode.Text = CStr(mBldCode)
mskBmkBouItmCode.Text = CStr(mItmCode)
Set tRecset = Nothing

End Sub

'Private Sub CalcSalChg()
'Dim mBmkBldQty As Double, mBmkPckQty As Double, mSalAmount As Double, mBouAmtBefDisc As Double, mBouDiscPer As Double, mSalDiscAmt As Double, mBouAmtBefTax As Double, mSalTaxPer As Double, mSalTaxAmt As Double
'
'mBmkBldQty = Val(UnMyNumFmt(mskBmkBouBldQty.Text))
'mBmkPckQty = Val(UnMyNumFmt(mskBmkBouPckQty.Text))
'mBouDiscPer = Val(UnMyPerFmt(mskBouDiscPer.Text))
'mSalTaxPer = Val(UnMyPerFmt(mskBouTaxPer.Text))
'Rem If mFormSysVchType = cCOM_VTYPE_RETNOUTW Then
'    mBouAmtBefDisc = Round(mBmkBldQty * mBmkPckQty, 2)
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
'Rem     mBouAmtBefTax = Round(mBmkBldQty * mBmkPckQty, 2)
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

Private Sub ShowOldBmkCodeDesc()
Dim tRecset As New ADODB.Recordset, mBmkDate As Date, mBmkEttCode As Long

mBmkEttCode = Val(fcmbEttName.BoundText)
mBmkDate = Ctod(dtpBmkDate.Text)
With tRecset
'If FormAddEditMode = cFORM_ADDMODE Then
'    .Open "Select top 1 bkh.*,vtm.VtmName from BloodMkHdr bkh inner join VTypMast vtm on bkh.BkhVtmCode=vtm.VtmCode where bkh.BkhEttCode=" & CStr(mBmkEttCode) & " order by bkh.BkhDate Desc", dbComDatabase, adOpenKeyset, adLockOptimistic
'Else
    .open "Select top 1 bkh.*,vtm.VtmName from BloodMkHdr bkh" _
        & " inner join VTypMast vtm on bkh.BkhVtmCode = vtm.VtmCode" _
        & " where bkh.BkhEttCode = " & CStr(mBmkEttCode) _
        & " and bkh.BkhCode <> " & CStr(mBmkCode) _
        & " and bkh.BkhDate <= #" & ToSysDate(mBmkDate) & "#" _
        & " and bkh.BkhVtmCode IN (" & mFormVchTypeList & ")" _
        & " order by bkh.BkhDate Desc", dbComDatabase, adOpenKeyset, adLockOptimistic
'End If
If .RecordCount > 0 Then
    lblOldBmkCodeDesc.Caption = RTrim(.fields("VtmName")) & " No.:" & CStr(.fields("BkhVchNo")) & " Dated:" & Dtoc(.fields("BkhDate")) & " (" & CStr(mBmkDate - .fields("BkhDate")) & " Days Past)"
Else
    lblOldBmkCodeDesc.Caption = "# First Time #"    ''' CStr(mBmkEttCode)
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
    mskBmkBouSno.Top = mRowPos
    txtBouBdgName.Top = mRowPos
    txtBouBdcName.Top = mRowPos
    txtBmkBouNarr.Top = mRowPos
    txtBmkBouBldRefNo.Top = mRowPos
    txtBouBdpName.Top = mRowPos
    mskBmkBouPckQty.Top = mRowPos
    mskBmkBouBldQty.Top = mRowPos
    cmdOK.Top = mRowPos
End If

mskBmkBouICode.Text = 0
mskBmkBouStkICode.Text = 0
mskBmkBouSno.Text = 0
txtBouBdgName.Text = "": fcmbBdgName.BoundText = ""
txtBouBdcName.Text = "": fcmbBdcName.BoundText = ""
txtBmkBouNarr.Text = ""
mskBmkBouItmCode.Text = 0
mskBmkBouBldCode.Text = 0
txtBmkBouBldRefNo.Text = "": fcmbBldRefNo.BoundText = ""
mskBouBinCode.Text = 0
mskBouBinICode.Text = 0
txtBouBdpName.Text = "": fcmbBdpName.BoundText = ""
mskBmkBouPckQty.Text = ToMyNumFmt(0, mDecimals:=-1)
mskBmkBouBldQty.Text = ToMyNumFmt(0, mDecimals:=-1)

Call ValidDtl

mskBmkBouICode.Visible = False     '''  mShowItem
mskBmkBouStkICode.Visible = False     '''  mShowItem
mskBmkBouSno.Visible = mShowItem
txtBouBdgName.Visible = mShowItem
txtBouBdcName.Visible = mShowItem
txtBmkBouNarr.Visible = mShowItem
mskBmkBouItmCode.Visible = False     '''  mShowItem
mskBmkBouBldCode.Visible = False     '''  mShowItem
txtBmkBouBldRefNo.Visible = mShowItem
mskBouBinCode.Visible = False     '''  mShowItem
mskBouBinICode.Visible = False     '''  mShowItem
txtBouBdpName.Visible = mShowItem
mskBmkBouPckQty.Visible = mShowItem
mskBmkBouBldQty.Visible = mShowItem
cmdOK.Visible = mShowItem

frHeader.Enabled = (mShowItem = False)
Mfgrd2.Enabled = (mShowItem = False)
frFooter2.Enabled = (mShowItem = False)
cmdSaveForm.Enabled = (mShowItem = False)

End Sub

Private Sub ValidDtl()
Dim mDataOk As Boolean, srow As Integer

srow = Mfgrd2.Row
mDataOk = (Val(fcmbEttName.BoundText) > 0 And Val(fcmbEttName.BoundText) = mBmkEttCode And Val(fcmbHpmName.BoundText) > 0 And Val(fcmbHpmName.BoundText) = mBmkHpmCode And Val(UnMyNumFmt(mskBmkBouSno.Text)) > 0 And Val(fcmbBdgName.BoundText) > 0 And Val(fcmbBdcName.BoundText) > 0 And Val(fcmbBdpName.BoundText) > 0 And Val(mskBmkBouBldCode.Text) > 0 And Val(mskBmkBouItmCode.Text) > 0 And Trim(txtBmkBouBldRefNo.Text) <> "" And Val(mskBouBinCode.Text) > 0 And Val(mskBouBinICode.Text) > 0 And IIf(dtlAddMode = True, True, Val(mskBmkBouICode.Text) > 0 And Val(mskBmkBouStkICode.Text) > 0) And Val(UnMyNumFmt(mskBmkBouPckQty.Text)) >= 0 And Val(UnMyNumFmt(mskBmkBouBldQty.Text)) >= 0)

cmdOK.Caption = IIf(mDataOk = True, "&OK", "&Cancel")
cmdOK.BackColor = IIf(mDataOk = True, &H80FF80, &H8080FF)
End Sub

Private Sub CalcFtrTotal()
Dim mBldQtyTot As Double, mPckQtyTot As Double

mBldQtyTot = FlexColSum(Mfgrd2, X2BMKBLDQTY_COL)
mPckQtyTot = FlexColSum(Mfgrd2, X2BMKPCKQTY_COL)

lblBmkBouBldQtyTot.Caption = ToMyNumFmt(mBldQtyTot, mDecimals:=-1)
lblBmkBouPckQtyTot.Caption = ToMyNumFmt(mPckQtyTot, mDecimals:=-1)

End Sub

Private Sub ShowLinkTranDtl()
Dim tRecset As New ADODB.Recordset, mLinkTranStr As String

mLinkTranStr = ""

With tRecset
.open "Select * from ((((((BloodMkDtl bkm" _
    & " inner join BloodMkHdr bkh on bkm.BmkCode = bkh.BkhCode)" _
    & " inner join BloodInDtl bin on bkm.BmkBinICode = bin.BinICode)" _
    & " inner join BloodInHdr bih on bin.BinCode = bih.BihCode)" _
    & " inner join BloodMast bld on bin.BinBldCode = bld.BldCode)" _
    & " inner join BloodGrpMst bdg on bin.BinBdgCode = bdg.BdgCode)" _
    & " inner join BloodCompoMst bdc on bin.BinBdcCode = bdc.BdcCode)" _
    & " inner join VTypMast vtm on bih.BihVtmCode = vtm.VtmCode" _
    & " where BmkCode = " & CStr(mBmkCode) _
    & " order by BinDate,BinCode,BinSno" _
    , dbComDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    Do While .EOF = False
        mLinkTranStr = mLinkTranStr & .fields("VtmName") & " No." & CStr(.fields("BihVchNo")) & " Dt." & Dtoc(.fields("BihDate")) & " Blood - " & .fields("BdgName") & ", " & .fields("BdcName") & " Rf." & .fields("BinBldRefNo") & " Pck/Bld.Qty." & ToMyNumFmt(.fields("BinPckQty"), mDecimals:=-1) & "/" & ToMyNumFmt(.fields("BinBldQty"), mDecimals:=-1) & vbCrLf
    
        .MoveNext
    Loop
End If
End With
CloseTable tRecset

txtLinkTranDesc.Text = mLinkTranStr

End Sub

Private Sub ChkBldRefNoList()
Rem important: below queries not almost same as in flexsearch class
fcmbBldRefNo.mBoundSqlExpr = "Select *,BldRefNo+'_'+format(ItrCode,'" & cLONGCODESTRFMT & "') as BldRefNoUnq from (" _
    & "Select BldRefNo,ItrCode,sum(PckQty) as PckQty_sum,sum(BldQty) as BldQty_sum from (" _
    & "Select BinItrCode as ItrCode,BinBldRefNo as BldRefNo,BinPckQty as PckQty,BinBldQty as BldQty from BloodInDtl" _
    & " inner join BloodInHdr on BloodInDtl.BinCode = BloodInHdr.BihCode" _
    & " where BinBdgCode = " & CStr(Val(fcmbBdgName.BoundText)) & " and BinBdcCode = " & CStr(Val(fcmbBdcName.BoundText)) _
    & " and BinBldCode = " & CStr(Val(mskBmkBouBldCode.Text)) & " and BinItmCode = " & CStr(Val(mskBmkBouItmCode.Text)) _
    & " and BinDate <= #" & CStr(ToSysDate(Ctod(dtpBmkDate.Text))) & "#" _
    & " Union All " _
    & "Select BmkItrCode as ItrCode,BmkBldRefNo as BldRefNo,(BmkPckQty*-1) as PckQty,(BmkBldQty*-1) as BldQty from BloodMkDtl" _
    & IIf(FormAddEditMode = cFORM_EDITMODE, " inner join BloodMkHdr on BloodMkDtl.BmkCode = BloodMkHdr.BkhCode", "") _
    & " where BmkBdgCode = " & CStr(Val(fcmbBdgName.BoundText)) & " and BmkBdcCode = " & CStr(Val(fcmbBdcName.BoundText)) _
    & " and BmkBldCode = " & CStr(Val(mskBmkBouBldCode.Text)) & " and BmkItmCode = " & CStr(Val(mskBmkBouItmCode.Text)) _
    & " and BmkICode <> " & CStr(Val(mskBmkBouICode.Text)) _
    & " and (BmkRecState <> " & CStr(cREC_CANCELED) & " and BmkRecState <> " & CStr(cREC_DELETED) & ")" _
    & ")" _
    & " group by ItrCode,BldRefNo order by ItrCode,BldRefNo" _
    & ") as t1 inner join ProdRef on t1.ItrCode = ProdRef.ItrRefCode" _
    & " where PckQty_sum > 0 or BldQty_sum > 0"
    Rem & " where BinEttCode = " & CStr(Val(fcmbEttName.BoundText)) & " where BmkEttCode = " & CStr(Val(fcmbEttName.BoundText))
    Rem & " and (BmkRecState <> " & CStr(cREC_CANCELED) & " and BmkRecState <> " & CStr(cREC_DELETED) & " and BmkCode = " & CStr(mBmkCode) & ")"
fcmbBldRefNo.mListSqlExpr = "Select *,BldRefNo+'_'+format(ItrCode,'" & cLONGCODESTRFMT & "') as BldRefNoUnq from (" _
    & "Select BldRefNo,ItrCode,sum(PckQty) as PckQty_sum,sum(BldQty) as BldQty_sum from (" _
    & "Select BinItrCode as ItrCode,BinBldRefNo as BldRefNo,BinPckQty as PckQty,BinBldQty as BldQty from BloodInDtl" _
    & " inner join BloodInHdr on BloodInDtl.BinCode = BloodInHdr.BihCode" _
    & " where BinBdgCode = " & CStr(Val(fcmbBdgName.BoundText)) & " and BinBdcCode = " & CStr(Val(fcmbBdcName.BoundText)) _
    & " and BinBldCode = " & CStr(Val(mskBmkBouBldCode.Text)) & " and BinItmCode = " & CStr(Val(mskBmkBouItmCode.Text)) _
    & " and BinDate <= #" & CStr(ToSysDate(Ctod(dtpBmkDate.Text))) & "#" _
    & " Union All " _
    & "Select BmkItrCode as ItrCode,BmkBldRefNo as BldRefNo,(BmkPckQty*-1) as PckQty,(BmkBldQty*-1) as BldQty from BloodMkDtl" _
    & IIf(FormAddEditMode = cFORM_EDITMODE, " inner join BloodMkHdr on BloodMkDtl.BmkCode = BloodMkHdr.BkhCode", "") _
    & " where BmkBdgCode = " & CStr(Val(fcmbBdgName.BoundText)) & " and BmkBdcCode = " & CStr(Val(fcmbBdcName.BoundText)) _
    & " and BmkBldCode = " & CStr(Val(mskBmkBouBldCode.Text)) & " and BmkItmCode = " & CStr(Val(mskBmkBouItmCode.Text)) _
    & " and BmkICode <> " & CStr(Val(mskBmkBouICode.Text)) _
    & " and (BmkRecState <> " & CStr(cREC_CANCELED) & " and BmkRecState <> " & CStr(cREC_DELETED) & ")" _
    & ")" _
    & " group by BldRefNo,ItrCode order by BldRefNo,ItrCode" _
    & ") as t1 inner join ProdRef on t1.ItrCode = ProdRef.ItrRefCode" _
    & " where PckQty_sum > 0 or BldQty_sum > 0"
    Rem & " where BinEttCode = " & CStr(Val(fcmbEttName.BoundText)) & " where BmkEttCode = " & CStr(Val(fcmbEttName.BoundText))
    Rem & " and (BmkRecState <> " & CStr(cREC_CANCELED) & " and BmkRecState <> " & CStr(cREC_DELETED) & " and BmkCode = " & CStr(mBmkCode) & ")"
fcmbBldRefNo.ReInit

End Sub

Private Function ChkAnyPostRcExist() As Boolean
Dim tRecset As New ADODB.Recordset

ChkAnyPostRcExist = False

With tRecset
.open "Select top 1 * from ((BloodInDtl" _
    & " inner join BloodInHdr on BloodInDtl.BinCode = BloodInHdr.BihCode)" _
    & " inner join BloodMkDtl on BloodInDtl.BinICode = BloodMkDtl.BmkBinICode)" _
    & " Inner Join BloodMkHdr on BloodMkDtl.BmkCode = BloodMkHdr.BkhCode" _
    & " where BmkCode = " & CStr(mBmkCode) _
    & " and BinDate > #" & CStr(ToSysDate(Ctod(dtpBmkDate.Text))) & "#" _
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

Private Function ChkAnyMisLinkedRcExist(Optional ByVal mBmkICode) As Boolean
Dim tRecset As New ADODB.Recordset, mMisLinkedDesc As String

ChkAnyMisLinkedRcExist = False
mMisLinkedDesc = ""

With tRecset
.open "Select top 1 * from ((BloodInDtl" _
    & " inner join BloodInHdr on BloodInDtl.BinCode = BloodInHdr.BihCode)" _
    & " inner join BloodMkDtl on BloodInDtl.BinICode = BloodMkDtl.BmkBinICode)" _
    & " Inner Join BloodMkHdr on BloodMkDtl.BmkCode = BloodMkHdr.BkhCode" _
    & " where BmkCode = " & CStr(mBmkCode) _
    & IIf(IsMissing(mBmkICode) = False, " and BmkICode = " & CStr(mBmkICode), "") _
    & " and (BmkBdgCode <> BinBdgCode or BmkBdcCode <> BinBdcCode or BmkBldCode <> BinBldCode or BmkItmCode <> BinItmCode or BmkItrCode <> BinItrCode or BmkBldRefNo <> BinBldRefNo)" _
    & " order by BihDate,BihCode" _
    , dbBdkDatabase, adOpenKeyset, adLockOptimistic
    Rem BihEttCode <> " & CStr(Val(fcmbEttName.BoundText)) & " or
If .EOF = False Then
    clsVTM.GetData .fields("BihVtmCode")
    'If .fields("BihEttCode") <> Val(fcmbEttName.BoundText) Then
    '    mMisLinkedDesc = mMisLinkedDesc & "<Party Name>"
    'End If
    If .fields("BmkBdgCode") <> .fields("BinBdgCode") Then
        mMisLinkedDesc = mMisLinkedDesc & "<Blood Group>"
    End If
    If .fields("BmkBdcCode") <> .fields("BinBdcCode") Then
        mMisLinkedDesc = mMisLinkedDesc & "<Blood Component>"
    End If
    If .fields("BmkBldCode") <> .fields("BinBldCode") Then
        mMisLinkedDesc = mMisLinkedDesc & "<Blood Name>"
    End If
    If .fields("BmkItmCode") <> .fields("BinItmCode") Then
        mMisLinkedDesc = mMisLinkedDesc & "<Master Item>"
    End If
    If .fields("BmkItrCode") <> .fields("BinItrCode") Then
        mMisLinkedDesc = mMisLinkedDesc & "<Item Ref.Code>"
    End If
    If .fields("BmkBldRefNo") <> .fields("BinBldRefNo") Then
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

Private Function ChkAnyExcessIsuExist(Optional ByVal mBmkICode) As Boolean
Dim tRecset As New ADODB.Recordset

ChkAnyExcessIsuExist = False

With tRecset
.open "Select top 1 * from (((" _
    & "Select BinICode,BdgCode,BdcCode,BldCode,ItmCode,ItrCode,BldRefNo,sum(PckQty) as PckQty_sum,sum(BldQty) as BldQty_sum from (" _
    & "Select BinICode,BinBdgCode as BdgCode,BinBdcCode as BdcCode,BinBldCode as BldCode,BinItmCode as ItmCode,BinItrCode as ItrCode,BinBldRefNo as BldRefNo,BinPckQty as PckQty,BinBldQty as BldQty from (BloodInDtl" _
    & " inner join BloodInHdr on BloodInDtl.BinCode = BloodInHdr.BihCode)" _
    & " inner join BloodMkDtl on BloodInDtl.BinICode = BloodMkDtl.BmkBinICode" _
    & " where BmkCode = " & CStr(mBmkCode) & IIf(IsMissing(mBmkICode) = False, " and BmkICode=" & CStr(mBmkICode), "") _
    & " and BinRecState IN (" & CStr(cREC_ADDED) & "," & CStr(cREC_EDITED) & "," & CStr(cREC_UNCHANGED) & ")" _
    & " Union All " _
    & "Select BmkBinICode as BinICode,BmkBdgCode as BdgCode,BmkBdcCode as BdcCode,BmkBldCode as BldCode,BmkItmCode as ItmCode,BmkItrCode as ItrCode,BmkBldRefNo as BldRefNo,(BmkPckQty*-1) as PckQty,(BmkBldQty*-1) as BldQty from BloodMkDtl" _
    & " left join BloodMkHdr on BloodMkDtl.BmkCode = BloodMkHdr.BkhCode" _
    & " where BmkCode = " & CStr(mBmkCode) & IIf(IsMissing(mBmkICode) = False, " and BmkICode=" & CStr(mBmkICode), "") _
    & " and BmkRecState <> " & CStr(cREC_CANCELED) _
    & " Union All " _
    & "Select bkm.BmkBinICode as BinICode,bkm.BmkBdgCode as BdgCode,bkm.BmkBdcCode as BdcCode,bkm.BmkBldCode as BldCode,bkm.BmkItmCode as ItmCode,bkm.BmkItrCode as ItrCode,bkm.BmkBldRefNo as BldRefNo,(bkm.BmkPckQty*-1) as PckQty,(bkm.BmkBldQty*-1) as BldQty from ((BloodMkDtl" _
    & " left join BloodMkHdr on BloodMkDtl.BmkCode = BloodMkHdr.BkhCode)" _
    & " inner join BloodMkDtl bkm on BloodMkDtl.BmkBinICode = bkm.BmkBinICode)" _
    & " left join BloodMkHdr bkh on bkm.BmkCode = bkh.BkhCode" _
    & " where BloodMkDtl.BmkCode = " & CStr(mBmkCode) & " and bkm.BmkCode <> " & CStr(mBmkCode) & IIf(IsMissing(mBmkICode) = False, " and BloodMkDtl.BmkICode = " & CStr(mBmkICode) & " and bkm.BmkICode <> " & CStr(mBmkICode), "") _
    & " and bkm.BmkRecState <> " & CStr(cREC_CANCELED) _
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


Rem ---------------------------------------------- end of form -------------------------------------------------

