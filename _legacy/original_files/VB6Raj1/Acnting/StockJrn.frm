VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmStockJrn 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   ClientHeight    =   9315
   ClientLeft      =   60
   ClientTop       =   60
   ClientWidth     =   13650
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
   ScaleHeight     =   9315
   ScaleWidth      =   13650
   ShowInTaskbar   =   0   'False
   Begin VB.Frame frFormDtl 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   7095
      Left            =   120
      TabIndex        =   20
      Top             =   1080
      Width           =   11655
      Begin VB.TextBox mskStkValue 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BeginProperty DataFormat 
            Type            =   0
            Format          =   "0.00"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   0
         EndProperty
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   6.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   9480
         TabIndex        =   12
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   2760
         Width           =   1575
      End
      Begin VB.TextBox mskStkRate 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BeginProperty DataFormat 
            Type            =   0
            Format          =   "0.00"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   0
         EndProperty
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   6.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   8040
         TabIndex        =   11
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   2760
         Width           =   1455
      End
      Begin VB.Frame frFooter 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   1575
         Left            =   0
         TabIndex        =   41
         Top             =   4440
         Width           =   11655
         Begin VB.TextBox txtShrNarr 
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
            Height          =   885
            Left            =   1080
            TabIndex        =   15
            Top             =   240
            Width           =   4095
         End
         Begin VB.Label lblIssueValueTot 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "0.00"
            BeginProperty Font 
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
            Left            =   6600
            TabIndex        =   47
            Top             =   840
            Width           =   1455
         End
         Begin VB.Label lblRcptValueTot 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "0.00"
            BeginProperty Font 
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
            Left            =   5160
            TabIndex        =   46
            Top             =   840
            Width           =   1455
         End
         Begin VB.Label lblRcptQtyTot 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "0.00"
            BeginProperty Font 
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
            Left            =   5160
            TabIndex        =   45
            Top             =   240
            Width           =   1455
         End
         Begin VB.Label lblIssueQtyTot 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "0.00"
            BeginProperty Font 
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
            Left            =   6600
            TabIndex        =   44
            Top             =   240
            Width           =   1455
         End
         Begin VB.Label lblRcptQtyDiff 
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
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H000000FF&
            Height          =   285
            Left            =   5280
            TabIndex        =   43
            Top             =   600
            Width           =   1335
         End
         Begin VB.Label lblIssueQtyDiff 
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
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H000000FF&
            Height          =   285
            Left            =   6600
            TabIndex        =   42
            Top             =   600
            Width           =   1455
         End
      End
      Begin VB.TextBox txtItmName 
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
         Left            =   1080
         TabIndex        =   8
         Top             =   2760
         Width           =   4095
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
         Left            =   10320
         Style           =   1  'Graphical
         TabIndex        =   14
         Top             =   3120
         Width           =   735
      End
      Begin VB.TextBox txtStkNarr 
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
         Height          =   645
         Left            =   1080
         TabIndex        =   13
         Top             =   3180
         Width           =   4095
      End
      Begin VB.TextBox mskIssueQty 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BeginProperty DataFormat 
            Type            =   0
            Format          =   "0.00"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   0
         EndProperty
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   6.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   6600
         TabIndex        =   10
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   2760
         Width           =   1455
      End
      Begin VB.TextBox mskRcptQty 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BeginProperty DataFormat 
            Type            =   0
            Format          =   "0.00"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   0
         EndProperty
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   6.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   5160
         TabIndex        =   9
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   2760
         Width           =   1455
      End
      Begin VB.TextBox txtIsRcFlag 
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
         Left            =   720
         MaxLength       =   2
         TabIndex        =   7
         Top             =   2760
         Width           =   375
      End
      Begin VB.TextBox mskStkSNo 
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
         Left            =   120
         TabIndex        =   6
         Tag             =   "AhCode"
         Text            =   "-1"
         Top             =   2760
         Width           =   615
      End
      Begin VB.CommandButton cmdSaveForm 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFF80&
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   10080
         Style           =   1  'Graphical
         TabIndex        =   16
         Top             =   6240
         Width           =   615
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd2 
         Height          =   2775
         Left            =   120
         TabIndex        =   5
         Top             =   1560
         Width           =   11415
         _ExtentX        =   20135
         _ExtentY        =   4895
         _Version        =   393216
         FixedCols       =   0
         RowHeightMin    =   285
         HighLight       =   2
         SelectionMode   =   1
         AllowUserResizing=   3
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
      Begin VB.Frame frHeader 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   1335
         Left            =   0
         TabIndex        =   38
         Top             =   0
         Width           =   11655
         Begin VB.TextBox txtVtmName 
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
            TabIndex        =   2
            Tag             =   "AhCode"
            Top             =   720
            Width           =   2775
         End
         Begin VB.TextBox mskStkVchNo 
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
            Left            =   10200
            TabIndex        =   4
            Tag             =   "AhCode"
            Text            =   "-1"
            Top             =   720
            Width           =   1335
         End
         Begin VB.TextBox txtStkPrefix 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BorderStyle     =   0  'None
            BeginProperty DataFormat 
               Type            =   1
               Format          =   "dd/MM/yyyy"
               HaveTrueFalseNull=   0
               FirstDayOfWeek  =   0
               FirstWeekOfYear =   0
               LCID            =   1033
               SubFormatType   =   3
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
            TabIndex        =   3
            Tag             =   "AhCode"
            Text            =   "[Prefix]"
            Top             =   720
            Width           =   1215
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
            Left            =   1560
            TabIndex        =   0
            Tag             =   "AhCode"
            Text            =   "-1"
            Top             =   360
            Width           =   1575
         End
         Begin VB.TextBox dtpStkDate 
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
            Left            =   1560
            TabIndex        =   1
            Tag             =   "AhCode"
            Text            =   "dd/mm/yyyy"
            Top             =   720
            Width           =   1575
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
            Index           =   15
            Left            =   3240
            TabIndex        =   59
            Top             =   720
            Width           =   1455
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Voucher No.:"
            BeginProperty Font 
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
            Left            =   7560
            TabIndex        =   58
            Top             =   720
            Width           =   1335
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
            Left            =   240
            TabIndex        =   40
            Top             =   360
            Width           =   855
         End
         Begin VB.Label Label1 
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
            Index           =   1
            Left            =   240
            TabIndex        =   39
            Top             =   720
            Width           =   855
         End
      End
   End
   Begin VB.TextBox txtVoid 
      CausesValidation=   0   'False
      Height          =   375
      Left            =   0
      TabIndex        =   17
      TabStop         =   0   'False
      Text            =   "Void"
      Top             =   8520
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
      TabIndex        =   23
      TabStop         =   0   'False
      Top             =   0
      Width           =   255
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
      TabIndex        =   22
      TabStop         =   0   'False
      Top             =   0
      UseMaskColor    =   -1  'True
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
      ItemData        =   "StockJrn.frx":0000
      Left            =   0
      List            =   "StockJrn.frx":000D
      Style           =   1  'Simple Combo
      TabIndex        =   21
      TabStop         =   0   'False
      Text            =   "cmbFormMode"
      Top             =   360
      Width           =   1455
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
      Height          =   7095
      Left            =   120
      TabIndex        =   19
      Top             =   840
      Width           =   12375
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
         Left            =   1080
         TabIndex        =   53
         Top             =   480
         Width           =   4215
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
         Left            =   240
         MousePointer    =   1  'Arrow
         TabIndex        =   55
         TabStop         =   0   'False
         Top             =   1680
         Width           =   1335
      End
      Begin VB.Frame frConfigure 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   5295
         Left            =   2880
         TabIndex        =   48
         Top             =   960
         Width           =   6495
         Begin VB.Frame frShowIsRcTran 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Show Transaction"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   1455
            Left            =   2640
            TabIndex        =   56
            Top             =   2160
            Width           =   3735
            Begin VB.OptionButton optShowBothTran 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Show Both Issue / Receipt"
               BeginProperty Font 
                  Name            =   "Verdana"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               ForeColor       =   &H80000008&
               Height          =   315
               Left            =   120
               TabIndex        =   33
               Top             =   240
               Value           =   -1  'True
               Width           =   3495
            End
            Begin VB.OptionButton optShowRcTranOnly 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Show Receipt Transaction only"
               BeginProperty Font 
                  Name            =   "Verdana"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               ForeColor       =   &H80000008&
               Height          =   315
               Left            =   120
               TabIndex        =   34
               Top             =   600
               Width           =   3495
            End
            Begin VB.OptionButton optShowIsTranOnly 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Show Issue Transaction only"
               BeginProperty Font 
                  Name            =   "Verdana"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               ForeColor       =   &H80000008&
               Height          =   315
               Left            =   120
               TabIndex        =   35
               Top             =   960
               Width           =   3495
            End
         End
         Begin VB.TextBox txtQryItmName 
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
            Left            =   1560
            TabIndex        =   26
            Top             =   1080
            Width           =   3975
         End
         Begin VB.CheckBox chkCombinedIsRc 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Combined Issue / Receipts"
            BeginProperty Font 
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
            Left            =   2640
            TabIndex        =   32
            Top             =   1800
            Value           =   1  'Checked
            Width           =   3255
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
            Left            =   2760
            TabIndex        =   36
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
            Height          =   2415
            Left            =   120
            TabIndex        =   37
            Top             =   1680
            Width           =   2415
            Begin VB.OptionButton optItemwise 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Itemwise"
               BeginProperty Font 
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
               TabIndex        =   31
               Top             =   1680
               Width           =   1815
            End
            Begin VB.OptionButton optDatewise 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Datewise"
               BeginProperty Font 
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
               TabIndex        =   30
               Top             =   1320
               Width           =   1815
            End
            Begin VB.OptionButton optMonthwise 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Monthwise"
               BeginProperty Font 
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
               TabIndex        =   29
               Top             =   960
               Width           =   1815
            End
            Begin VB.OptionButton optCondensed 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Condensed"
               BeginProperty Font 
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
               TabIndex        =   28
               Top             =   600
               Width           =   1815
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
               TabIndex        =   27
               Top             =   240
               Value           =   -1  'True
               Width           =   1935
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
            Left            =   4080
            TabIndex        =   25
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
            Left            =   1560
            TabIndex        =   24
            Tag             =   "AhCode"
            Text            =   "dd/mm/yyyy"
            Top             =   720
            Width           =   1455
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Product Name:"
            BeginProperty Font 
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
            TabIndex        =   52
            Top             =   1080
            Width           =   1455
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
            Left            =   3120
            TabIndex        =   51
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
            TabIndex        =   50
            Top             =   720
            Width           =   1095
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
            Left            =   0
            TabIndex        =   49
            Top             =   0
            Width           =   6495
         End
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd1 
         Height          =   5775
         Left            =   240
         TabIndex        =   54
         Top             =   840
         Width           =   11655
         _ExtentX        =   20558
         _ExtentY        =   10186
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
         Index           =   5
         Left            =   360
         TabIndex        =   57
         Top             =   480
         Width           =   735
      End
   End
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Stock Journal"
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
      TabIndex        =   18
      Top             =   0
      Width           =   9015
   End
End
Attribute VB_Name = "frmStockJrn"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim dbStDatabase As New ADODB.Connection, dbAcDatabase As New ADODB.Connection, dbGrpDatabase As New ADODB.Connection, dbComDatabase As New ADODB.Connection
Dim datRecset As New ADODB.Recordset
Dim mFormUIdCode As Long, mFormUIdFileName As String, mFormAcsPermFileName As String
Dim mFormLoaded As Boolean, mLastKeyPressed As Integer, mMaskKeyPressed As Integer, mSmryLayer As Integer
Dim mRemoteAccess As Boolean, mEntrySaved As Boolean, mEntryAborted As Boolean
Dim mStkCode As Long, dtlAddEditMode As Boolean, dtlAddMode As Boolean, dtlEditCanceled As Boolean
Dim clsSTK As clsStockJrn, mActiveControl As Object, clsListStru As clsSelectQueryStructure
Dim fcmbItem As clsComFlexSearch, fcmbVtmName As clsComFlexSearch
Dim mIsRcQtyDiff As Double, mRcQtyTot As Double, mIsQtyTot As Double
Dim mStkDate_old As Date, mStkVtmCode_old As Long, mStkVchNo_old As Long

Private Type SmryPara
mFromDate As Date
mToDate  As Date
mItmCode As Long
mDetailed As Boolean
mCondensed  As Boolean
mMonthwise  As Boolean
mDatewise As Boolean
mItemwise As Boolean
mCombinedIsRc As Integer
mShowBothTran As Boolean
mShowRcTranOnly As Boolean
mShowIsTranOnly As Boolean
mRowIndex() As Variant

End Type

Dim OldSmryPara As SmryPara
Dim BackSmryPara As SmryPara

' StockJrn transaction detail grid Mfgrd2 column definitions
Const X2STKICODE_COL = 0
Const X2STKSNO_COL = 1
Const X2ISRCFLAG_COL = 2
Const X2ITMNAME_COL = 3
Const X2RCPTQTY_COL = 4
Const X2ISSUEQTY_COL = 5
Const X2STKRATE_COL = 6
Const X2STKVALUE_COL = 7
Const X2STKNARR_COL = 8
Const X2STKITMCODE_COL = 9
Const X2STKRECSTATE_COL = 10
Const MFGRD2_COLS = 11

Private Sub RestoreDefaultSmryPara()
dtpFromDate.Text = Dtoc(DefaultEntryDate)
dtpToDate.Text = Dtoc(DefaultEntryDate)
fcmbItem.BoundText = "": txtQryItmName.Text = ""
optDetailed.Value = True
optCondensed.Value = False
optMonthwise.Value = False
optDatewise.Value = False
optItemWise.Value = False
chkCombinedIsRc.Value = 0
optShowBothTran.Value = 1
optShowRcTranOnly.Value = 0
optShowIsTranOnly.Value = 0

End Sub

Private Sub RestoreOldSmryPara()
dtpFromDate.Text = Dtoc(OldSmryPara.mFromDate)
dtpToDate.Text = Dtoc(OldSmryPara.mToDate)
fcmbItem.BoundText = CStr(OldSmryPara.mItmCode): txtQryItmName.Text = fcmbItem.Text
optDetailed.Value = OldSmryPara.mDetailed
optCondensed.Value = OldSmryPara.mCondensed
optMonthwise.Value = OldSmryPara.mMonthwise
optDatewise.Value = OldSmryPara.mDatewise
optItemWise.Value = OldSmryPara.mItemwise
chkCombinedIsRc.Value = OldSmryPara.mCombinedIsRc
optShowBothTran.Value = OldSmryPara.mShowBothTran
optShowRcTranOnly.Value = OldSmryPara.mShowRcTranOnly
optShowIsTranOnly.Value = OldSmryPara.mShowIsTranOnly

End Sub

Private Sub RestoreBackSmryPara()
dtpFromDate.Text = Dtoc(BackSmryPara.mFromDate)
dtpToDate.Text = Dtoc(BackSmryPara.mToDate)
fcmbItem.BoundText = CStr(BackSmryPara.mItmCode): txtQryItmName.Text = fcmbItem.Text
optDetailed.Value = BackSmryPara.mDetailed
optCondensed.Value = BackSmryPara.mCondensed
optMonthwise.Value = BackSmryPara.mMonthwise
optDatewise.Value = BackSmryPara.mDatewise
optItemWise.Value = BackSmryPara.mItemwise
chkCombinedIsRc.Value = BackSmryPara.mCombinedIsRc
optShowBothTran.Value = BackSmryPara.mShowBothTran
optShowRcTranOnly.Value = BackSmryPara.mShowRcTranOnly
optShowIsTranOnly.Value = BackSmryPara.mShowIsTranOnly

End Sub

Private Sub SaveSmryPara()
OldSmryPara.mFromDate = Ctod(dtpFromDate.Text)
OldSmryPara.mToDate = Ctod(dtpToDate.Text)
OldSmryPara.mItmCode = Val(fcmbItem.BoundText)
OldSmryPara.mDetailed = optDetailed.Value
OldSmryPara.mCondensed = optCondensed.Value
OldSmryPara.mMonthwise = optMonthwise.Value
OldSmryPara.mDatewise = optDatewise.Value
OldSmryPara.mItemwise = optItemWise.Value
OldSmryPara.mCombinedIsRc = chkCombinedIsRc.Value
OldSmryPara.mShowBothTran = optShowBothTran.Value
OldSmryPara.mShowRcTranOnly = optShowRcTranOnly.Value
OldSmryPara.mShowIsTranOnly = optShowIsTranOnly.Value

End Sub

Private Sub SaveBackSmryPara()
BackSmryPara.mFromDate = OldSmryPara.mFromDate
BackSmryPara.mToDate = OldSmryPara.mToDate
BackSmryPara.mItmCode = OldSmryPara.mItmCode
BackSmryPara.mDetailed = OldSmryPara.mDetailed
BackSmryPara.mCondensed = OldSmryPara.mCondensed
BackSmryPara.mMonthwise = OldSmryPara.mMonthwise
BackSmryPara.mDatewise = OldSmryPara.mDatewise
BackSmryPara.mItemwise = OldSmryPara.mItemwise
BackSmryPara.mCombinedIsRc = OldSmryPara.mCombinedIsRc
BackSmryPara.mShowBothTran = OldSmryPara.mShowBothTran
BackSmryPara.mShowRcTranOnly = OldSmryPara.mShowRcTranOnly
BackSmryPara.mShowIsTranOnly = OldSmryPara.mShowIsTranOnly

End Sub

Public Property Let RemoteAccessCode(ByVal mAccessCode As Long)
mRemoteAccess = True
mStkCode = mAccessCode

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

Public Property Get EntryDate() As Date
EntryDate = Ctod(dtpStkDate.Text)
End Property

Public Property Get FirstItemName() As String
FirstItemName = Mfgrd2.TextMatrix(Mfgrd2.FixedRows, X2ITMNAME_COL)
End Property

Private Property Get FormAddEditMode() As Integer
FormAddEditMode = cmbFormEntryMode.ListIndex
End Property

Private Property Let FormAddEditMode(ByVal New_FormEntryMode As Integer)
cmbFormEntryMode.ListIndex = New_FormEntryMode
End Property

Public Property Get SecuMenuName() As String
SecuMenuName = Me.Name
End Property

Private Sub chkCombinedIsRc_GotFocus()
FlashActiveControl chkCombinedIsRc, True
End Sub

Private Sub chkCombinedIsRc_LostFocus()
FlashActiveControl chkCombinedIsRc, False
End Sub

Private Sub mskStkVchNo_GotFocus()
FlashActiveControl mskStkVchNo, True
End Sub

Private Sub mskStkVchNo_LostFocus()
FlashActiveControl mskStkVchNo, False
End Sub

Private Sub mskStkVchNo_Validate(Cancel As Boolean)
Dim mStkVchNo As Long

mStkVchNo = Val(UnMyNumFmt(mskStkVchNo.Text))
If mStkVchNo < 0 Then
    mStkVchNo = GetNextVTypeNo(dbStDatabase, dbAcDatabase, dbComDatabase, mTableName:="StockJrn", mFieldName:="ShrVchNo", mVtmFieldName:="ShrVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="ShrCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="ShrDate", mDateFieldValue:=Ctod(dtpStkDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
    mskStkVchNo.Text = ToMyNumFmt(mStkVchNo, mDecimals:=0)
ElseIf mStkVchNo > 0 Then
    If mStkVchNo <> mStkVchNo_old Or Val(fcmbVtmName.BoundText) <> mStkVtmCode_old Or Ctod(dtpStkDate.Text) <> mStkDate_old Then
        If ChkIsDuplVTypeNo(dbStDatabase, dbAcDatabase, mTableName:="StockJrn", mChkFieldName:="ShrVchNo", mChkFieldValue:=mStkVchNo, mKeyFieldName:="ShrCode", mKeyFieldValue:=mStkCode, mVtmFieldName:="ShrVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="ShrCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="ShrDate", mDateFieldValue:=Ctod(dtpStkDate.Text)) = True Then
            ErrorBox "Duplicate Input !!!"
            Cancel = True
            mskStkVchNo.SetFocus
            ' ----------
            If FormAddEditMode = cFORM_ADDMODE Then
                mStkVchNo = GetNextVTypeNo(dbStDatabase, dbAcDatabase, dbComDatabase, mTableName:="StockJrn", mFieldName:="ShrVchNo", mVtmFieldName:="ShrVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="ShrCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="ShrDate", mDateFieldValue:=Ctod(dtpStkDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
            Else
                mStkVchNo = mStkVchNo_old
            End If
            mskStkVchNo.Text = ToMyNumFmt(mStkVchNo, mDecimals:=0)
        End If
    End If
    If Cancel = False Then
        mskStkVchNo.Text = ToMyNumFmt(mStkVchNo, mDecimals:=0)
    End If
Else
    ErrorBox "Invalid Input !!!"
    mskStkVchNo.SetFocus
    Cancel = True
End If

End Sub

Private Sub optShowBothTran_GotFocus()
FlashActiveControl optShowBothTran, True
End Sub

Private Sub optShowBothTran_LostFocus()
FlashActiveControl optShowBothTran, False
End Sub

Private Sub optShowIsTranOnly_GotFocus()
FlashActiveControl optShowIsTranOnly, True
End Sub

Private Sub optShowIsTranOnly_LostFocus()
FlashActiveControl optShowIsTranOnly, False
End Sub

Private Sub optShowRcTranOnly_GotFocus()
FlashActiveControl optShowRcTranOnly, True
End Sub

Private Sub optShowRcTranOnly_LostFocus()
FlashActiveControl optShowRcTranOnly, False
End Sub

Private Sub cmdConfigure_Click()
If Between(Ctod(dtpFromDate.Text), sFinYrStartDate, sFinYrEndDate) = False Then
    ErrorBox "Invalid Date Range !!!"
    dtpFromDate.SetFocus
    Exit Sub
End If
If Between(Ctod(dtpToDate.Text), sFinYrStartDate, sFinYrEndDate) = False Then
    ErrorBox "Invalid Date Range !!!"
    dtpToDate.SetFocus
    Exit Sub
End If
Call SaveSmryPara

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
    If Screen.ActiveControl.Name = Mfgrd2.Name Then
        Call Mfgrd2_KeyPress(13)
    ElseIf Screen.ActiveControl.Name = Mfgrd1.Name Then
        With datRecset
        If .EOF = False And .BOF = False Then
            If optDetailed.Value = True Or optCondensed.Value = True Then
                Call Data_EditEvent
            Else
                txtVoid.SetFocus
                If optMonthwise.Value = True Then
                    dtpFromDate.Text = Dtoc(MonthStartDate(DateSerial(Val(Left(.fields("StkYrMonth"), 4)), Val(Right(.fields("StkYrMonth"), 2)), 1)))
                    dtpToDate.Text = Dtoc(MonthEndDate(DateSerial(Val(Left(.fields("StkYrMonth"), 4)), Val(Right(.fields("StkYrMonth"), 2)), 1)))
                ElseIf optDatewise.Value = True Then
                    dtpFromDate.Text = Dtoc(.fields("StkDate"))
                    dtpToDate.Text = Dtoc(.fields("StkDate"))
                ElseIf optItemWise.Value = True Then
                    fcmbItem.BoundText = CStr(.fields("StkItmCode"))
                    txtQryItmName.Text = fcmbItem.Text
                End If
                optDetailed.Value = True
                Call SaveBackSmryPara
                Call SaveSmryPara
                
                Call SmryList
                MoveRecToLast datRecset
                ShowRecActiveFlexRow datRecset, Mfgrd1
                Mfgrd1.SetFocus
                mSmryLayer = 2
            End If
        Else
            Call Data_AddEvent
        End If
        End With
    End If
ElseIf FormAddEditMode = cFORM_SMRYMODE And frConfigure.Visible = False Then

Else
    SendKeys "{tab}"
End If

End Sub

Private Sub cmdFormEscape_Click()
Dim mRecAbsPos As Long

mLastKeyPressed = 27
If frConfigure.Visible = True Then
    txtVoid.SetFocus
    Mfgrd1.Enabled = True
    frConfigure.Visible = False
    Mfgrd1.SetFocus
    Call RestoreOldSmryPara

ElseIf FormAddEditMode = cFORM_SMRYMODE Then
    If mSmryLayer = 2 Then
        txtVoid.SetFocus
        Call RestoreBackSmryPara
        Call SaveSmryPara
        Call SmryList
        
        MoveRecToLast datRecset
        ShowRecActiveFlexRow datRecset, Mfgrd1
        Mfgrd1.SetFocus
        mSmryLayer = 1
    Else
        If Len(txtSearch1Text.Text) > 0 Then
            txtSearch1Text.Text = ""
            Call txtSearch1Text_InterActiveChange
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
        dtpStkDate.SetFocus
    End If
End If

End Sub

Private Sub cmdOK_Click()
Dim STKRecset As New ADODB.Recordset, srow As Integer, mStkSno As Integer, mStkICode As Long, pStkQty As Double, pStkItmCode As Long

srow = Mfgrd2.Row
mStkSno = Val(Mfgrd2.TextMatrix(srow, X2STKSNO_COL))
mStkICode = Val(Mfgrd2.TextMatrix(srow, X2STKICODE_COL))
pStkQty = 0
pStkItmCode = 0

If cmdOK.Caption = "&OK" And dtlEditCanceled = False Then
    With clsSTK
    If dtlAddMode = True Then
        .ClearDtl
    Else
        .GetDtlData mStkCode, mStkICode
    End If
    .mStkSno_int = Val(UnMyNumFmt(mskStkSNo.Text))
    .mStkVtmCode_lng = Val(fcmbVtmName.BoundText)
    .mStkPrefix_str = txtStkPrefix.Text
    .mStkVchNo_lng = Val(UnMyNumFmt(mskStkVchNo.Text))
    .mStkPostfix_str = ""
    .mStkDate_dt = Ctod(dtpStkDate.Text)
    .mStkItmCode_lng = Val(fcmbItem.BoundText)
    .mStkItmRef1Name_str = ""
    .mStkItmRef2Name_str = ""
    If Val(UnMyNumFmt(mskRcptQty.Text)) <> 0 Then
        .mStkQty_dbl = ToRcptQty(Val(UnMyNumFmt(mskRcptQty.Text)))
    Else
        .mStkQty_dbl = ToIssueQty(Val(UnMyNumFmt(mskIssueQty.Text)))
    End If
    .mStkRate_dbl = Val(UnMyNumFmt(mskStkRate.Text))
    .mStkValue_dbl = Val(UnMyNumFmt(mskStkValue.Text))
    .mStkNarr_str = txtStkNarr.Text
    .mStkAutoGen_bln = False
    .mStkCmpCode_int = sFinYrCmpCode
    If dtlAddMode = True Then
        If .AddNewDtl(mStkCode) = True Then
            mStkICode = .mStkICode_lng
        End If
    Else
        .UpdateDtl mStkCode, mStkICode
    End If
    End With
    
    RefreshDatabase dbStDatabase
    
    With STKRecset
    .open "Select * from StockJrn where StkCode=" & CStr(mStkCode) & " and StkICode=" & CStr(mStkICode) & " order by StkCode,StkICode", dbStDatabase, adOpenKeyset, adLockOptimistic
    clsSTK.clsIT.GetData .fields("StkItmCode")
    
    Mfgrd2.TextMatrix(srow, X2STKICODE_COL) = .fields("StkICode")
    Mfgrd2.TextMatrix(srow, X2STKSNO_COL) = .fields("StkSno")
    Mfgrd2.TextMatrix(srow, X2ISRCFLAG_COL) = SenseIsRcFlag(.fields("StkQty"))
    Mfgrd2.TextMatrix(srow, X2ITMNAME_COL) = clsSTK.clsIT.mItmName_str
    Mfgrd2.TextMatrix(srow, X2RCPTQTY_COL) = ToMyNumFmt(SenseRcptQty(.fields("StkQty")))
    Mfgrd2.TextMatrix(srow, X2ISSUEQTY_COL) = ToMyNumFmt(SenseIssueQty(.fields("StkQty")))
    Mfgrd2.TextMatrix(srow, X2STKRATE_COL) = ToMyNumFmt(.fields("StkRate"))
    Mfgrd2.TextMatrix(srow, X2STKVALUE_COL) = ToMyNumFmt(.fields("StkValue"), , True)
    Mfgrd2.TextMatrix(srow, X2STKNARR_COL) = .fields("StkNarr")
    Mfgrd2.TextMatrix(srow, X2STKITMCODE_COL) = .fields("StkItmCode")
    Mfgrd2.TextMatrix(srow, X2STKRECSTATE_COL) = .fields("StkRecState")
    
    End With
    CloseTable STKRecset
    
    If dtlAddMode = True Then
        Mfgrd2.Rows = Mfgrd2.Rows + 1
    End If
    srow = srow + 1
    Mfgrd2.Row = srow
    
    Call CalcIsRcTot
End If
dtlAddEditMode = False
dtlAddMode = False
dtlEditCanceled = False
Call VisibleControls(False)
Mfgrd2.SetFocus
CloseTable STKRecset, mCheckOpen:=True

End Sub

Private Sub cmdSaveForm_Click()
txtVoid.SetFocus
Call Data_SaveEvent

mEntrySaved = True
Call SmryList
If optDetailed.Value = True Or optCondensed.Value = True Then
    Rem datRecset.Find "tStkSmryId='" & Format(Ctod(dtpStkDate.Text), "yyyymmdd") + Format(mStkCode, "0000000") & "'", Start:=1
    txtSearch1Text_InterActiveChange Format(Ctod(dtpStkDate.Text), "yyyymmdd") + Format(mStkCode, "0000000")
ElseIf optMonthwise.Value = True Then
    Rem datRecset.Find "StkYrMonth='" & CStr(Year(Ctod(dtpStkDate.Text))) & "-" & CStr(Month(Ctod(dtpStkDate.Text))) & "'", Start:=1
    txtSearch1Text_InterActiveChange Format(Ctod(dtpStkDate.Text), "yyyy") & "/" & Format(Ctod(dtpStkDate.Text), "mm")
ElseIf optDatewise.Value = True Then
    Rem datRecset.Find "StkDate=#" & CStr(ToSysDate(Ctod(dtpStkDate.Text))) & "#", Start:=1
    txtSearch1Text_InterActiveChange Format(Ctod(dtpStkDate.Text), "yyyymmdd")
ElseIf optItemWise.Value = True Then
    Rem datRecset.Find "StkItmName='" & Mfgrd2.TextMatrix(1, X2ITMNAME_COL) & "'", Start:=1
    txtSearch1Text_InterActiveChange Mfgrd2.TextMatrix(1, X2ITMNAME_COL)
End If

Call ShowEntryMode(False)
Mfgrd1.SetFocus

End Sub

Private Sub cmdSaveForm_GotFocus()
Dim mStkAcsPermNo As Integer, mRetryCount As Integer

txtVoid.SetFocus
cmdSaveForm.Enabled = False
If Data_Verify() = True Then
    If CanAccept() = True Then
        If GetAccessPerm(mStkAcsPermNo, mRetryCount, mFormAcsPermFileName) = True And mRetryCount = 0 Then
            If Data_NetwAuth() = True Then
                Call cmdSaveForm_Click
                If mRemoteAccess = True Then
                    ''Unload Me
                    Me.Hide
                    Exit Sub
                End If
            Else
                Close #mStkAcsPermNo
            End If
        Else
            Close #mStkAcsPermNo
            AlertBox "System Busy, Try Again !!!"
            
            dtpStkDate.SetFocus
        End If
    Else
        dtpStkDate.SetFocus
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
    dtpFromDate.SetFocus
    FlashActiveControl dtpFromDate, True
    Cancel = True
End If
End Sub

Private Sub dtpStkDate_GotFocus()
FlashActiveControl dtpStkDate, True
End Sub

Private Sub dtpStkDate_LostFocus()
FlashActiveControl dtpStkDate, False
End Sub

Private Sub dtpStkDate_Validate(Cancel As Boolean)
Dim cnt As Integer, mStkICode As Long, mStkDate As Date

dtpStkDate.Text = ToMyDate(dtpStkDate.Text)
mStkDate = Ctod(dtpStkDate.Text)
If Between(mStkDate, sFinYrStartDate, sFinYrEndDate) = False Then
    ErrorBox "Invalid Entry Date !!!"
    dtpStkDate.SetFocus
    Cancel = True
Else
    mStkDate_old = mStkDate
'    If mStkDate <> mStkDate_old Then
'        For cnt = Mfgrd2.FixedRows To Mfgrd2.Rows - 2
'            mStkICode = Val(Mfgrd2.TextMatrix(cnt, X2STKICODE_COL))
'            clsSTK.GetData mStkCode, mStkICode
'            clsSTK.mStkDate_dt = mStkDate
'
'            clsSTK.Update mStkCode, mStkICode
'        Next cnt
'        mStkDate_old = mStkDate
'    End If
End If

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
    dtpToDate.SetFocus
    FlashActiveControl dtpToDate, True
    Cancel = True
End If

End Sub

Private Sub Form_Activate()
If mFormLoaded = False Then
    If mRemoteAccess = True Then
        MoveRecToFirst datRecset
        ShowRecActiveFlexRow datRecset, Mfgrd1
        Mfgrd1.SetFocus
        If mStkCode = 0 Then
            Call Data_AddEvent
        Else
            Call Data_EditEvent
        End If
    Else
        MoveRecToLast datRecset
        ShowRecActiveFlexRow datRecset, Mfgrd1
        Mfgrd1.SetFocus
    End If
Else
    
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
    If FormAddEditMode <> cFORM_SMRYMODE And dtlAddEditMode = False Then
        Call cmdSaveForm_GotFocus
    End If
End Select

End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
mLastKeyPressed = KeyAscii

End Sub

Private Sub Form_Load()
Dim colcnt As Integer

mFormUIdFileName = "StockJrn.Uid"
mFormAcsPermFileName = "StockJrn.Acp"
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
frConfigure.Visible = False
txtSearch1Text.Enabled = False

mskStkValue.Enabled = False
mSmryLayer = 1

OpenStDataSource dbStDatabase
OpenAcDataSource dbAcDatabase
OpenGrpDataSource dbGrpDatabase
OpenComDataSource dbComDatabase

Set clsSTK = New clsStockJrn
Set clsSTK.dbStDatabase = dbStDatabase
Set clsSTK.dbGrpDatabase = dbGrpDatabase

Set clsListStru = New clsSelectQueryStructure

Set fcmbVtmName = New clsComFlexSearch
Set fcmbVtmName.dbAcDatabase = dbAcDatabase
fcmbVtmName.blnVTypeMastList = True
fcmbVtmName.mListSqlExpr = "Select * from VTypMast where VtmSysCode=" & CStr(cCOM_VTYPE_STOCKJRN) & " order by VtmName"
fcmbVtmName.Init

Set fcmbItem = New clsComFlexSearch
Set fcmbItem.dbStDatabase = dbStDatabase
fcmbItem.blnProdMastList = True
fcmbItem.Init

Call RestoreDefaultSmryPara
If mRemoteAccess = True Then
    optDetailed.Value = True
End If
Call SaveSmryPara

Mfgrd1.Rows = 2: Mfgrd1.FixedRows = 1: Mfgrd1.FixedCols = 0
datRecset.open "Select * from StockJrn order by StkICode", dbStDatabase, adOpenKeyset, adLockOptimistic
Call SmryList

Mfgrd2.Rows = 2: Mfgrd2.Cols = MFGRD2_COLS
colcnt = X2STKICODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2STKICODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2STKSNO_COL: Mfgrd2.ColWidth(colcnt) = mskStkSNo.Width: Mfgrd2.TextMatrix(0, colcnt) = "SNo": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2ISRCFLAG_COL: Mfgrd2.ColWidth(colcnt) = txtIsRcFlag.Width: Mfgrd2.TextMatrix(0, colcnt) = "Is/Rc": Mfgrd2.ColAlignment(colcnt) = 2
colcnt = X2ITMNAME_COL: Mfgrd2.ColWidth(colcnt) = txtItmName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Item Name": Mfgrd2.ColAlignment(colcnt) = 2
colcnt = X2RCPTQTY_COL: Mfgrd2.ColWidth(colcnt) = mskRcptQty.Width: Mfgrd2.TextMatrix(0, colcnt) = "Rcpt.Qty": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2ISSUEQTY_COL: Mfgrd2.ColWidth(colcnt) = mskIssueQty.Width: Mfgrd2.TextMatrix(0, colcnt) = "Issue Qty": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2STKRATE_COL: Mfgrd2.ColWidth(colcnt) = mskStkRate.Width: Mfgrd2.TextMatrix(0, colcnt) = "Rate": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2STKVALUE_COL: Mfgrd2.ColWidth(colcnt) = mskStkValue.Width: Mfgrd2.TextMatrix(0, colcnt) = "Amount": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2STKNARR_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2STKNARR_COL": Mfgrd2.ColAlignment(colcnt) = 2
colcnt = X2STKITMCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2STKITMCODE_COL": Mfgrd2.ColAlignment(colcnt) = 2
colcnt = X2STKRECSTATE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2STKRECSTATE_COL": Mfgrd2.ColAlignment(colcnt) = 2

colcnt = X2STKSNO_COL: mskStkSNo.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2ISRCFLAG_COL: txtIsRcFlag.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2ITMNAME_COL: txtItmName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2RCPTQTY_COL: mskRcptQty.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2ISSUEQTY_COL: mskIssueQty.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2STKRATE_COL: mskStkRate.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2STKVALUE_COL: mskStkValue.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)

txtStkNarr.Left = txtItmName.Left
cmdOK.Left = mskStkValue.Left + mskStkValue.Width - cmdOK.Width

Call ShowEntryMode(False)
Call VisibleControls(False)

End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
mLastKeyPressed = 0
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
Set fcmbVtmName = Nothing
Set fcmbItem = Nothing
Set clsListStru = Nothing

CloseTable datRecset
CloseDataSource dbStDatabase
CloseDataSource dbAcDatabase
CloseDataSource dbGrpDatabase
CloseDataSource dbComDatabase

End Sub

Private Sub ShowEntryMode(ByVal EntryMode As Boolean)
If Me.Visible = True Then
    txtVoid.SetFocus
End If
frFormSmry.Visible = Not EntryMode: frFormSmry.Enabled = Not EntryMode
frFormDtl.Visible = EntryMode: frFormDtl.Enabled = EntryMode
cmdSaveForm.Enabled = EntryMode
If EntryMode = False Then
    FormAddEditMode = cFORM_SMRYMODE
End If

End Sub

Private Function Data_Verify() As Boolean
Dim mStkVchNo As Long

Data_Verify = False
If FormAddEditMode = cFORM_EDITMODE And Val(mskFormBoundField.Text) < 1 Then
    ErrorBox "Invalid Key Value !!!"
    dtpStkDate.SetFocus
    Exit Function
End If
If Val(fcmbVtmName.BoundText) <= 0 Then
    ErrorBox "Invalid Selection !!!"
    txtVtmName.SetFocus
    Exit Function
End If
mStkVchNo = Val(UnMyNumFmt(mskStkVchNo.Text))
If mStkVchNo > 0 Then
    If mStkVchNo <> mStkVchNo_old Or Val(fcmbVtmName.BoundText) <> mStkVtmCode_old Or Ctod(dtpStkDate.Text) <> mStkDate_old Then
        If ChkIsDuplVTypeNo(dbStDatabase, dbAcDatabase, mTableName:="StockHdr", mChkFieldName:="ShrVchNo", mChkFieldValue:=mStkVchNo, mKeyFieldName:="ShrCode", mKeyFieldValue:=mStkCode, mVtmFieldName:="ShrVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="ShrCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="ShrDate", mDateFieldValue:=Ctod(dtpStkDate.Text)) = True Then
            ErrorBox "Duplicate Input !!!"
            mskStkVchNo.SetFocus
            ' ---------------
            If FormAddEditMode = cFORM_ADDMODE Then
                mStkVchNo = GetNextVTypeNo(dbStDatabase, dbAcDatabase, dbComDatabase, mTableName:="StockHdr", mFieldName:="ShrVchNo", mVtmFieldName:="ShrVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="ShrCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="ShrDate", mDateFieldValue:=Ctod(dtpStkDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
            Else
                mStkVchNo = mStkVchNo_old
            End If
            mskStkVchNo.Text = ToMyNumFmt(mStkVchNo, mDecimals:=0)
            Exit Function
        End If
    End If
Else
    ErrorBox "Invalid Input !!!"
    mskStkVchNo.SetFocus
    Exit Function
End If
If IsFinYrDate(dtpStkDate.Text) = False Then
    ErrorBox "Invalid Entry Date !!!"
    dtpStkDate.SetFocus
    Exit Function
End If
If mIsRcQtyDiff <> 0 Or mRcQtyTot = 0 Or mIsQtyTot = 0 Then
    ErrorBox "Receipt & Issue Qty. Misbalanced  !!!"
    Mfgrd2.Row = Mfgrd2.Rows - 1
    Mfgrd2.SetFocus
    Exit Function
End If

Data_Verify = True
End Function

Private Function Data_NetwAuth() As Boolean
Dim mStkVchNo As Long

Data_NetwAuth = False

mStkVchNo = Val(UnMyNumFmt(mskStkVchNo.Text))
If mStkVchNo <> mStkVchNo_old Or Val(fcmbVtmName.BoundText) <> mStkVtmCode_old Or Ctod(dtpStkDate.Text) <> mStkDate_old Or FormAddEditMode = cFORM_ADDMODE Then
    If ChkIsDuplVTypeNo(dbStDatabase, dbAcDatabase, mTableName:="StockHdr", mChkFieldName:="ShrVchNo", mChkFieldValue:=mStkVchNo, mKeyFieldName:="ShrCode", mKeyFieldValue:=mStkCode, mVtmFieldName:="ShrVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="ShrCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="ShrDate", mDateFieldValue:=Ctod(dtpStkDate.Text)) = True Then
        ErrorBox "Duplicate Voucher No. !!!"
        mskStkVchNo.SetFocus
        ' ---------------
        If FormAddEditMode = True Then
            mStkVchNo = GetNextVTypeNo(dbStDatabase, dbAcDatabase, dbComDatabase, mTableName:="StockHdr", mFieldName:="ShrVchNo", mVtmFieldName:="ShrVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="ShrCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="ShrDate", mDateFieldValue:=Ctod(dtpStkDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
        Else
            mStkVchNo = mStkVchNo_old
        End If
        mskStkVchNo.Text = ToMyNumFmt(mStkVchNo, mDecimals:=0)
        Exit Function
    End If
End If

Data_NetwAuth = True

End Function

Private Sub ShowDtlData()
Dim srow As Integer, mRcQtyTot As Double, mIsQtyTot As Double, mRcptValueTot As Double, tRecset As New ADODB.Recordset, mFormBoundCode As Long, mColCnt As Integer

mFormBoundCode = Val(mskFormBoundField.Text)
srow = 1
Mfgrd2.Rows = 2
mRcQtyTot = 0
mIsQtyTot = 0
mRcptValueTot = 0

With tRecset
.open "Select * from StockJrn where StkCode=" & CStr(mFormBoundCode) & " order by StkSno", dbStDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Do While .EOF = False
        If InList(.fields("StkRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
            clsSTK.clsIT.GetData .fields("StkItmCode")
            
            Mfgrd2.TextMatrix(srow, X2STKICODE_COL) = .fields("StkICode")
            Mfgrd2.TextMatrix(srow, X2STKSNO_COL) = .fields("StkSno")
            Mfgrd2.TextMatrix(srow, X2ISRCFLAG_COL) = SenseIsRcFlag(.fields("StkQty"))
            Mfgrd2.TextMatrix(srow, X2ITMNAME_COL) = clsSTK.clsIT.mItmName_str
            Mfgrd2.TextMatrix(srow, X2RCPTQTY_COL) = ToMyNumFmt(SenseRcptQty(.fields("StkQty")))
            Mfgrd2.TextMatrix(srow, X2ISSUEQTY_COL) = ToMyNumFmt(SenseIssueQty(.fields("StkQty")))
            Mfgrd2.TextMatrix(srow, X2STKRATE_COL) = ToMyNumFmt(.fields("StkRate"))
            Mfgrd2.TextMatrix(srow, X2STKVALUE_COL) = ToMyNumFmt(.fields("StkValue"), , True)
            Mfgrd2.TextMatrix(srow, X2STKNARR_COL) = .fields("StkNarr")
            Mfgrd2.TextMatrix(srow, X2STKITMCODE_COL) = .fields("StkItmCode")
            Mfgrd2.TextMatrix(srow, X2STKRECSTATE_COL) = .fields("StkRecState")
            
            mRcQtyTot = mRcQtyTot + SenseRcptQty(.fields("StkQty"))
            mIsQtyTot = mIsQtyTot + SenseIssueQty(.fields("StkQty"))
            mRcptValueTot = mRcptValueTot + Abs(.fields("StkValue"))
            
            Mfgrd2.Rows = Mfgrd2.Rows + 1
            srow = srow + 1
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

Call CalcIsRcTot

End Sub

Private Sub Mfgrd2_DblClick()
Call Mfgrd2_KeyPress(13)
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
Dim srow As Integer, mStkICode As Long, mDeleteit As Boolean
srow = Mfgrd2.Row
mStkICode = Val(Mfgrd2.TextMatrix(srow, X2STKICODE_COL))

If InList(KeyCode, Array(vbKeyDelete, vbKeySubtract)) And mStkICode > 0 Then
    mDeleteit = True
    If mDeleteit = True Then
        mDeleteit = CanDelete()
    End If
    If mDeleteit = True Then
        clsSTK.DeleteDtl mStkCode, mStkICode
        
        Call ShowDtlData
        Mfgrd2.Row = srow
        Mfgrd2.SetFocus
        Call Mfgrd2_RowColChange
    End If
End If

End Sub

Private Sub Mfgrd2_KeyPress(KeyAscii As Integer)
Dim srow As Integer, mStkSno As Integer

If KeyAscii = vbKeyReturn Then
    srow = Mfgrd2.Row
    mStkSno = Val(Mfgrd2.TextMatrix(srow, X2STKSNO_COL))
    
    dtlAddEditMode = True
    dtlAddMode = (mStkSno = 0)
    Call VisibleControls(True, Mfgrd2.Top + Mfgrd2.RowPos(Mfgrd2.Row))
    If dtlAddMode = True Then
        mskStkSNo.Text = FlexNextSeqno(Mfgrd2, X2STKSNO_COL)
        txtIsRcFlag.Text = IIf(mIsRcQtyDiff > 0, cISSUE_FLAG, cRCPT_FLAG)
        fcmbItem.BoundText = "": txtItmName.Text = ""
        mskRcptQty.Text = ToMyNumFmt(SenseRcptQty(mIsRcQtyDiff))
        mskIssueQty.Text = ToMyNumFmt(SenseIssueQty(mIsRcQtyDiff))
        txtStkNarr.Text = ""
    Else
        mskStkSNo.Text = Val(Mfgrd2.TextMatrix(srow, X2STKSNO_COL))
        txtIsRcFlag.Text = Mfgrd2.TextMatrix(srow, X2ISRCFLAG_COL)
        fcmbItem.BoundText = Mfgrd2.TextMatrix(srow, X2STKITMCODE_COL): txtItmName.Text = fcmbItem.Text
        mskRcptQty.Text = Mfgrd2.TextMatrix(srow, X2RCPTQTY_COL)
        mskIssueQty.Text = Mfgrd2.TextMatrix(srow, X2ISSUEQTY_COL)
        mskStkRate.Text = Mfgrd2.TextMatrix(srow, X2STKRATE_COL)
        mskStkValue.Text = Mfgrd2.TextMatrix(srow, X2STKVALUE_COL)
        txtStkNarr.Text = Mfgrd2.TextMatrix(srow, X2STKNARR_COL)
    End If
    txtIsRcFlag.SetFocus
    Call ValidDtl

End If


End Sub

Private Sub VisibleControls(ByVal mShowItem As Boolean, Optional ByVal mRowPos)
If Me.Visible = True Then
    txtVoid.SetFocus
End If
If IsMissing(mRowPos) = False Then
    mskStkSNo.Top = mRowPos
    txtIsRcFlag.Top = mRowPos
    txtItmName.Top = mRowPos
    mskRcptQty.Top = mRowPos
    mskIssueQty.Top = mRowPos
    mskStkRate.Top = mRowPos
    mskStkValue.Top = mRowPos
    txtStkNarr.Top = mRowPos + txtItmName.Height + 5
    cmdOK.Top = mskStkValue.Top + mskStkValue.Height
End If

mskStkSNo.Text = 0
txtIsRcFlag.Text = ""
fcmbItem.BoundText = "": txtItmName.Text = ""
mskRcptQty.Text = 0
mskIssueQty.Text = 0
mskStkRate.Text = 0
mskStkValue.Text = 0
txtStkNarr.Text = ""
Call ValidDtl

mskStkSNo.Visible = mShowItem
txtIsRcFlag.Visible = mShowItem
txtItmName.Visible = mShowItem
mskRcptQty.Visible = mShowItem
mskIssueQty.Visible = mShowItem
mskStkRate.Visible = mShowItem
mskStkValue.Visible = mShowItem
txtStkNarr.Visible = mShowItem
cmdOK.Visible = mShowItem

frHeader.Enabled = (mShowItem = False)
Mfgrd2.Enabled = (mShowItem = False)
frFooter.Enabled = (mShowItem = False)
cmdSaveForm.Enabled = (mShowItem = False)

End Sub

Private Sub ValidDtl()
Dim mDataOk As Boolean
mDataOk = (Val(mskStkSNo.Text) > 0 And (txtIsRcFlag.Text = cRCPT_FLAG Or txtIsRcFlag.Text = cISSUE_FLAG) And Val(fcmbItem.BoundText) <> 0)
cmdOK.Caption = IIf(mDataOk = True, "&OK", "&Cancel")
cmdOK.BackColor = IIf(mDataOk = True, &H80FF80, &H8080FF)
End Sub

Private Sub CalcIsRcTot()
Dim mRcptValueTot As Double, mIssueValueTot As Double, aRcptCond(0 To 0, 0 To 1) As Variant, aIssueCond(0 To 0, 0 To 1) As Variant

aRcptCond(0, 0) = X2ISRCFLAG_COL
aRcptCond(0, 1) = "Rc"
aIssueCond(0, 0) = X2ISRCFLAG_COL
aIssueCond(0, 1) = "Is"

mRcQtyTot = FlexColSum(Mfgrd2, X2RCPTQTY_COL)
mIsQtyTot = FlexColSum(Mfgrd2, X2ISSUEQTY_COL)
mRcptValueTot = FlexColSum(Mfgrd2, X2STKVALUE_COL, aRcptCond)
mIssueValueTot = FlexColSum(Mfgrd2, X2STKVALUE_COL, aIssueCond)

lblRcptQtyTot.Caption = ToMyNumFmt(mRcQtyTot)
lblIssueQtyTot.Caption = ToMyNumFmt(mIsQtyTot)
lblRcptValueTot.Caption = ToMyNumFmt(mRcptValueTot)
lblIssueValueTot.Caption = ToMyNumFmt(mIssueValueTot)

mIsRcQtyDiff = (mRcQtyTot - mIsQtyTot)

If mIsRcQtyDiff > 0 Then
    lblIssueQtyDiff.Caption = ToMyNumFmt(mIsRcQtyDiff, , True)
    lblRcptQtyDiff.Caption = ""
ElseIf mIsRcQtyDiff < 0 Then
    lblRcptQtyDiff.Caption = ToMyNumFmt(mIsRcQtyDiff, , True)
    lblIssueQtyDiff.Caption = ""
Else
    lblRcptQtyDiff.Caption = ""
    lblIssueQtyDiff.Caption = ""
End If

End Sub

Private Sub Mfgrd2_RowColChange()
ShowActiveFlexRow Mfgrd2

End Sub

Private Sub mskIssueQty_Change()
If Val(UnMyNumFmt(mskIssueQty.Text)) <> 0 And Val(UnMyNumFmt(mskRcptQty.Text)) <> 0 Then
    mskRcptQty.Text = ToMyNumFmt(0)
End If

End Sub

Private Sub mskIssueQty_GotFocus()
If InList(mLastKeyPressed, Array(vbKeyReturn, vbKeyTab)) = True _
 And txtIsRcFlag.Text = cRCPT_FLAG And Val(UnMyNumFmt(mskRcptQty.Text)) <> 0 Then
    SendKeys "{tab}"
Else
    FlashActiveControl mskIssueQty, True
End If

End Sub

Private Sub mskIssueQty_LostFocus()
FlashActiveControl mskIssueQty, False
End Sub

Private Sub mskIssueQty_Validate(Cancel As Boolean)
mskIssueQty.Text = ToMyNumFmt(mskIssueQty.Text, , True)

Call ValidDtl
Call Calc_Value
End Sub

Private Sub mskRcptQty_Change()
If Val(UnMyNumFmt(mskRcptQty.Text)) <> 0 And Val(UnMyNumFmt(mskIssueQty.Text)) <> 0 Then
    mskIssueQty.Text = ToMyNumFmt(0)
End If

End Sub

Private Sub mskRcptQty_GotFocus()
If InList(mLastKeyPressed, Array(vbKeyReturn, vbKeyTab)) = True _
 And txtIsRcFlag.Text = cISSUE_FLAG Then
    mskIssueQty.SetFocus
Else
    FlashActiveControl mskRcptQty, True
End If

End Sub

Private Sub mskRcptQty_LostFocus()
FlashActiveControl mskRcptQty, False
End Sub

Private Sub mskRcptQty_Validate(Cancel As Boolean)
mskRcptQty.Text = ToMyNumFmt(mskRcptQty.Text, , True)

Call ValidDtl
Call Calc_Value
End Sub

Private Sub mskStkRate_GotFocus()
FlashActiveControl mskStkRate, True
End Sub

Private Sub mskStkRate_LostFocus()
FlashActiveControl mskStkRate, False
End Sub

Private Sub mskStkRate_Validate(Cancel As Boolean)
mskStkRate.Text = ToMyNumFmt(mskStkRate.Text, , True)

Call ValidDtl
Call Calc_Value
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

Private Sub optCondensed_GotFocus()
FlashActiveControl optCondensed, True
End Sub

Private Sub optCondensed_LostFocus()
FlashActiveControl optCondensed, False
End Sub

Private Sub optItemwise_GotFocus()
FlashActiveControl optItemWise, True
End Sub

Private Sub optItemwise_LostFocus()
FlashActiveControl optItemWise, False
End Sub

Private Sub optMonthwise_GotFocus()
FlashActiveControl optMonthwise, True
End Sub

Private Sub optMonthwise_LostFocus()
FlashActiveControl optMonthwise, False
End Sub

Private Sub txtIsRcFlag_LostFocus()
FlashActiveControl txtIsRcFlag, False
End Sub

Private Sub txtItmName_Change()
If fcmbItem.CallFromText_Change = False Then
    fcmbItem.CallFromText_Change = True
    If InterActiveChange(txtItmName) = True And dtlAddEditMode = True Then
        fcmbItem.UserText = Array(txtItmName.Text, txtItmName.SelStart)
        fcmbItem.Show
        txtItmName.Text = fcmbItem.Text
        If fcmbItem.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbItem.CallFromText_Change = False
End If

End Sub

Private Sub txtItmName_GotFocus()
FlashActiveControl txtItmName, True

End Sub

Private Sub txtItmName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtItmName_Change
End If

End Sub

Private Sub txtItmName_LostFocus()
FlashActiveControl txtItmName, False

End Sub

Private Sub txtItmName_Validate(Cancel As Boolean)
If Val(fcmbItem.BoundText) = 0 Then
    Call AlertBox("Invalid Item Name !!!")
    txtItmName.SetFocus
    Cancel = True
End If
Call ValidDtl
End Sub

Private Sub txtIsRcFlag_Change()
If dtlAddEditMode = True Then
    txtIsRcFlag.Text = ToIsRcFlag(txtIsRcFlag.Text)
    Call SelectText(txtIsRcFlag)
End If
End Sub

Private Sub txtIsRcFlag_GotFocus()
FlashActiveControl txtIsRcFlag, True
End Sub

Private Sub txtIsRcFlag_Validate(Cancel As Boolean)
txtIsRcFlag.Text = ToIsRcFlag(txtIsRcFlag.Text)
If txtIsRcFlag.Text = cRCPT_FLAG And Val(UnMyNumFmt(mskIssueQty.Text)) <> 0 Then
    mskRcptQty.Text = mskIssueQty.Text
    mskIssueQty.Text = ToMyNumFmt(0)
ElseIf txtIsRcFlag.Text = cISSUE_FLAG And Val(UnMyNumFmt(mskRcptQty.Text)) <> 0 Then
    mskIssueQty.Text = mskRcptQty.Text
    mskRcptQty.Text = ToMyNumFmt(0)
End If

Call ValidDtl
End Sub

Private Sub txtQryItmName_Change()
If fcmbItem.CallFromText_Change = False Then
    fcmbItem.CallFromText_Change = True
    If InterActiveChange(txtQryItmName) = True Then
        fcmbItem.UserText = Array(txtQryItmName.Text, txtQryItmName.SelStart)
        fcmbItem.Show
        txtQryItmName.Text = fcmbItem.Text
        If fcmbItem.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbItem.CallFromText_Change = False
End If

End Sub

Private Sub txtQryItmName_GotFocus()
FlashActiveControl txtQryItmName, True

End Sub

Private Sub txtQryItmName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtQryItmName_Change
End If

End Sub

Private Sub txtQryItmName_LostFocus()
FlashActiveControl txtQryItmName, False

End Sub

Private Sub txtShrNarr_GotFocus()
FlashActiveControl txtShrNarr, True
End Sub

Private Sub txtShrNarr_LostFocus()
FlashActiveControl txtShrNarr, False
End Sub

Private Sub txtShrNarr_Validate(Cancel As Boolean)
txtShrNarr.Text = ToMyWord(txtShrNarr.Text)
End Sub

Private Sub txtStkNarr_GotFocus()
FlashActiveControl txtStkNarr, True
End Sub

Private Sub Data_AddEvent()

If CanUserAddOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If clsSTK.BeginStock(0) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_ADDMODE

mStkCode = clsSTK.ActiveStkCode
mskFormBoundField.Text = Val(mStkCode)

fcmbVtmName.BoundText = "": txtVtmName.Text = ""
txtStkPrefix.Text = ""
mskStkVchNo.Text = 0
dtpStkDate.Text = Dtoc(DefaultEntryDate)
txtShrNarr.Text = ""

mStkDate_old = Ctod(dtpStkDate.Text)
mStkVtmCode_old = Val(fcmbVtmName.BoundText)
mStkVchNo_old = Val(UnMyNumFmt(mskStkVchNo.Text))

Call ShowDtlData

Call ShowEntryMode(True)
dtpStkDate.SetFocus

End Sub

Private Sub Data_EditEvent()
Dim STKRecset As New ADODB.Recordset

If CanUserEditOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If clsSTK.BeginStock(datRecset.fields("StkCode")) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_EDITMODE

mStkCode = clsSTK.ActiveStkCode
mskFormBoundField.Text = mStkCode

With clsSTK
.GetHdrData mStkCode

fcmbVtmName.BoundText = CStr(.mShrVtmCode_lng): txtVtmName.Text = fcmbVtmName.Text
txtStkPrefix.Text = .mShrPrefix_str
mskStkVchNo.Text = ToMyNumFmt(.mShrVchNo_lng, mDecimals:=0)
dtpStkDate.Text = Dtoc(.mShrDate_dt)
txtShrNarr.Text = .mShrNarr_str
End With

mStkDate_old = Ctod(dtpStkDate.Text)
mStkVtmCode_old = Val(fcmbVtmName.BoundText)
mStkVchNo_old = Val(UnMyNumFmt(mskStkVchNo.Text))

Call ShowDtlData
Call ShowEntryMode(True)
'Call Data_CreateLog
dtpStkDate.SetFocus

End Sub

Private Sub Data_SaveEvent()
Dim mStkICode As Long

With clsSTK
If FormAddEditMode = cFORM_ADDMODE Then
    .ClearHdr
Else
    .GetHdrData mStkCode
End If
.mShrVtmCode_lng = Val(fcmbVtmName.BoundText)
.mShrPrefix_str = txtStkPrefix.Text
.mShrVchNo_lng = Val(UnMyNumFmt(mskStkVchNo.Text))
.mShrPostfix_str = ""
.mShrDate_dt = Ctod(dtpStkDate.Text)
.mShrQty_dbl = mIsRcQtyDiff
.mShrValue_dbl = 0
.mShrNarr_str = txtShrNarr.Text & ""
.mShrAutoGen_bln = False
.mShrCmpCode_int = sFinYrCmpCode
If FormAddEditMode = cFORM_ADDMODE Then
    If .AddNewHdr() Then
        mskFormBoundField.Text = .mShrCode_lng
        mStkCode = .mShrCode_lng
    End If
Else
    .UpdateHdr mStkCode
End If
If .mShrCode_lng > 0 Then
    .CommitStock mStkCode
    .EndStock mStkCode
Else
    Call Data_CancelEvent
    ErrorBox "Entry Canceled !!!"
End If
End With

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
mStkCode = datRecset.fields("StkCode")
mRecAbsPos = datRecset.AbsolutePosition

mDeleteit = True

If mDeleteit = True Then
    mDeleteit = CanDelete()
End If
If mDeleteit = True Then
    If clsSTK.BeginStock(mStkCode) = True Then
        clsSTK.DeleteStock mStkCode
        clsSTK.CommitStock mStkCode
        clsSTK.EndStock mStkCode
        
        Call SmryList
        If datRecset.RecordCount > mRecAbsPos And mRecAbsPos > 0 Then
            datRecset.Move mRecAbsPos - 1, 1
        Else
            MoveRecToLast datRecset
        End If
        'Call SmryDrCrAmtTot
    End If
    ShowRecActiveFlexRow datRecset, Mfgrd1
    Mfgrd1.SetFocus
Else
    Mfgrd1.SetFocus
End If

End Sub

Private Sub Data_CancelEvent()
clsSTK.CancelStock mStkCode
clsSTK.EndStock mStkCode

End Sub

Private Sub SmryList()
Dim gcolcount As Integer, acount As Integer, mLow As Integer, mHigh As Integer, mPos As Integer, srow As Long, mColCount As Integer

If datRecset.State = 1 Then
    CloseTable datRecset
End If
RefreshDatabase dbStDatabase
clsListStru.Clear

If optMonthwise.Value = True Or optDatewise.Value = True Or optItemWise.Value = True Then
    If optMonthwise.Value = True Then
        clsListStru.AddFields mExpr:="StkYrMonth", mAttrib:=cFAT_SYSTEM
        clsListStru.AddFields mExpr:="StkMnYear", mTitle:="Month", mShowItem:=True, mAlign:=1, mWidth:=2000
        clsListStru.AddFields mExpr:="StkQty_sum", mTitle:="Qty", mShowItem:=False, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="StkValue_sum", mTitle:="Value", mShowItem:=False, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="StkRcQty_sum", mTitle:="Rcpt.Qty", mShowItem:=False, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="StkRcValue_sum", mTitle:="Rcpt.Value", mShowItem:=False, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="StkIsQty_sum", mTitle:="Issue Qty", mShowItem:=False, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="StkIsValue_sum", mTitle:="Issue Value", mShowItem:=False, mAlign:=7, mWidth:=1500
        
        datRecset.open "Select format(StkDate,'yyyy/MM') as StkYrMonth" _
         & ",Sum(StkQty) as StkQty_sum" _
         & ",Sum(iif(StkQty>0,StkQty,0)) as StkRcQty_sum" _
         & ",Sum(iif(StkQty<0,StkQty,0)) as StkIsQty_sum" _
         & ",Sum(StkValue) as StkValue_sum" _
         & ",Sum(iif(StkQty>0,StkValue,0)) as StkRcValue_sum" _
         & ",Sum(iif(StkQty<0,StkValue,0)) as StkIsValue_sum" _
         & " from StockJrn" _
         & " where StkDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and StkCode<>" & CStr(cOPSTKCODE) & "" _
         & IIf(Val(fcmbItem.BoundText) > 0, " and StkItmCode=" & CStr(Val(fcmbItem.BoundText)), "") _
         & IIf(optShowRcTranOnly.Value = True, " and StkQty>0", "") _
         & IIf(optShowIsTranOnly.Value = True, " and StkQty<0", "") _
         & " group by format(StkDate,'yyyy/MM')" _
         & " order by format(StkDate,'yyyy/MM')" _
         , dbStDatabase, adOpenKeyset, adLockReadOnly
        
    ElseIf optDatewise.Value = True Then
        clsListStru.AddFields mExpr:="StkDateYMD", mAttrib:=cFAT_SYSTEM
        clsListStru.AddFields mExpr:="StkDate", mTitle:="Date", mShowItem:=True, mAlign:=1, mWidth:=2000
        clsListStru.AddFields mExpr:="StkQty_sum", mTitle:="Qty", mShowItem:=False, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="StkValue_sum", mTitle:="Value", mShowItem:=False, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="StkRcQty_sum", mTitle:="Rcpt.Qty", mShowItem:=False, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="StkRcValue_sum", mTitle:="Rcpt.Value", mShowItem:=False, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="StkIsQty_sum", mTitle:="Issue Qty", mShowItem:=False, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="StkIsValue_sum", mTitle:="Issue Value", mShowItem:=False, mAlign:=7, mWidth:=1500
    
        datRecset.open "Select StkDate" _
         & ",Sum(StkQty) as StkQty_sum" _
         & ",Sum(iif(StkQty>0,StkQty,0)) as StkRcQty_sum" _
         & ",Sum(iif(StkQty<0,StkQty,0)) as StkIsQty_sum" _
         & ",Sum(StkValue) as StkValue_sum" _
         & ",Sum(iif(StkQty>0,StkValue,0)) as StkRcValue_sum" _
         & ",Sum(iif(StkQty<0,StkValue,0)) as StkIsValue_sum" _
         & " from StockJrn" _
         & " where StkDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and StkCode<>" & CStr(cOPSTKCODE) & "" _
         & IIf(Val(fcmbItem.BoundText) > 0, " and StkItmCode=" & CStr(Val(fcmbItem.BoundText)), "") _
         & IIf(optShowRcTranOnly.Value = True, " and StkQty>0", "") _
         & IIf(optShowIsTranOnly.Value = True, " and StkQty<0", "") _
         & " group by StkDate" _
         & " order by StkDate" _
         , dbStDatabase, adOpenKeyset, adLockReadOnly
        
    ElseIf optItemWise.Value = True Then
        clsListStru.AddFields mExpr:="StkItmName", mTitle:="Product Name", mShowItem:=True, mAlign:=1, mWidth:=2000
        clsListStru.AddFields mExpr:="StkQty_sum", mTitle:="Qty", mShowItem:=False, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="StkValue_sum", mTitle:="Value", mShowItem:=False, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="StkRcQty_sum", mTitle:="Rcpt.Qty", mShowItem:=False, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="StkRcValue_sum", mTitle:="Rcpt.Value", mShowItem:=False, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="StkIsQty_sum", mTitle:="Issue Qty", mShowItem:=False, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="StkIsValue_sum", mTitle:="Issue Value", mShowItem:=False, mAlign:=7, mWidth:=1500
        
        datRecset.open "Select ProdMast.ItmName,StkItmCode" _
         & ",Sum(StkQty) as StkQty_sum" _
         & ",Sum(iif(StkQty>0,StkQty,0)) as StkRcQty_sum" _
         & ",Sum(iif(StkQty<0,StkQty,0)) as StkIsQty_sum" _
         & ",Sum(StkValue) as StkValue_sum" _
         & ",Sum(iif(StkQty>0,StkValue,0)) as StkRcValue_sum" _
         & ",Sum(iif(StkQty<0,StkValue,0)) as StkIsValue_sum" _
         & " from StockJrn left join ProdMast on StockJrn.StkItmCode=ProdMast.ItmCode" _
         & " where StkDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and StkCode<>" & CStr(cOPSTKCODE) & "" _
         & IIf(Val(fcmbItem.BoundText) > 0, " and StkItmCode=" & CStr(Val(fcmbItem.BoundText)), "") _
         & IIf(optShowRcTranOnly.Value = True, " and StkQty>0", "") _
         & IIf(optShowIsTranOnly.Value = True, " and StkQty<0", "") _
         & " and StkSno>0" _
         & " group by ProdMast.ItmName,StkItmCode" _
         & " order by ProdMast.ItmName,StkItmCode" _
         , dbStDatabase, adOpenKeyset, adLockReadOnly
        
    End If
    If chkCombinedIsRc.Value = 1 Then
        clsListStru.UpdateField mAlias:="StkQty_sum", mShowItem:=True
        clsListStru.UpdateField mAlias:="StkValue_sum", mShowItem:=True
    Else
        clsListStru.UpdateField mAlias:="StkRcQty_sum", mShowItem:=True
        clsListStru.UpdateField mAlias:="StkRcValue_sum", mShowItem:=True
        clsListStru.UpdateField mAlias:="StkIsQty_sum", mShowItem:=True
        clsListStru.UpdateField mAlias:="StkIsValue_sum", mShowItem:=True
    End If
    
ElseIf optDetailed.Value = True Or optCondensed.Value = True Then
    
    clsListStru.AddFields mExpr:="StkCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="StkICode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="StkSno", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="StkItmCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="StkRecState", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="tStkSmryId", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="StkDate", mTitle:="Date", mShowItem:=True, mWidth:=1250
    clsListStru.AddFields mExpr:="StkItmName", mTitle:="Product Name", mShowItem:=True, mAlign:=1, mWidth:=4000
    clsListStru.AddFields mExpr:="StkQty", mTitle:="Qty", mShowItem:=False, mAlign:=7, mWidth:=1500
    clsListStru.AddFields mExpr:="StkValue", mTitle:="Value", mShowItem:=False, mAlign:=7, mWidth:=1500
    clsListStru.AddFields mExpr:="StkRcQty", mTitle:="Rcpt.Qty", mShowItem:=False, mAlign:=7, mWidth:=1500
    clsListStru.AddFields mExpr:="StkRcValue", mTitle:="Rcpt.Value", mShowItem:=False, mAlign:=7, mWidth:=1500
    clsListStru.AddFields mExpr:="StkIsQty", mTitle:="Issue Qty", mShowItem:=False, mAlign:=7, mWidth:=1500
    clsListStru.AddFields mExpr:="StkIsValue", mTitle:="Issue Value", mShowItem:=False, mAlign:=7, mWidth:=1500
    clsListStru.AddFields mExpr:="StkNarr", mTitle:="Narration", mShowItem:=False, mAlign:=1, mWidth:=2000
    
    datRecset.open "Select StockJrn.*,ProdMast.ItmName" _
     & ",iif(StkQty>0,StkQty,0) as StkRcQty" _
     & ",iif(StkQty>0,StkValue,0) as StkRcValue" _
     & ",iif(StkQty<0,StkQty,0) as StkIsQty" _
     & ",iif(StkQty<0,StkValue,0) as StkIsValue" _
     & ",format(StkDate,'yyyymmdd')+format(StkCode,'0000000') as tStkSmryId" _
     & " from StockJrn left join ProdMast on StockJrn.StkItmCode=ProdMast.ItmCode" _
     & " where StkDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & IIf(mRemoteAccess = True, " and StkCode=" & CStr(mStkCode) & "", "") _
     & " and StkCode<>" & CStr(cOPSTKCODE) & "" _
     & IIf(Val(fcmbItem.BoundText) > 0, " and StkItmCode=" & CStr(Val(fcmbItem.BoundText)), "") _
     & IIf(optDetailed.Value = True, " and StkSno>0", "") _
     & IIf(optCondensed.Value = True, " and StkSno=1", "") _
     & IIf(optShowRcTranOnly.Value = True, " and StkQty>0", "") _
     & IIf(optShowIsTranOnly.Value = True, " and StkQty<0", "") _
     & " order by StkDate,StkCode,StkSno" _
     , dbStDatabase, adOpenKeyset, adLockReadOnly
    
    If chkCombinedIsRc.Value = 1 Then
        clsListStru.UpdateField mAlias:="StkQty", mShowItem:=True
        clsListStru.UpdateField mAlias:="StkValue", mShowItem:=True
    Else
        clsListStru.UpdateField mAlias:="StkRcQty", mShowItem:=True
        clsListStru.UpdateField mAlias:="StkRcValue", mShowItem:=True
        clsListStru.UpdateField mAlias:="StkIsQty", mShowItem:=True
        clsListStru.UpdateField mAlias:="StkIsValue", mShowItem:=True
    End If
    
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
        If optMonthwise.Value = True Or optDatewise.Value = True Or optItemWise.Value = True Then
            If optMonthwise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkYrMonth")) = .fields("StkYrMonth")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkMnYear")) = MonthName(Val(Right(.fields("StkYrMonth"), 2))) & "-" & Left(.fields("StkYrMonth"), 4)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkQty_sum")) = ToMyStqFmt(.fields("StkQty_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkValue_sum")) = ToMyStvFmt(.fields("StkValue_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkRcQty_sum")) = ToMyStqFmt(.fields("StkRcQty_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkRcValue_sum")) = ToMyStvFmt(.fields("StkRcValue_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkIsQty_sum")) = ToMyStqFmt(.fields("StkIsQty_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkIsValue_sum")) = ToMyStvFmt(.fields("StkIsValue_sum"))
                
            ElseIf optDatewise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkDateYMD")) = Format(.fields("StkDate"), "yyyymmdd")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkDate")) = Dtoc(.fields("StkDate"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkQty_sum")) = ToMyStqFmt(.fields("StkQty_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkValue_sum")) = ToMyStvFmt(.fields("StkValue_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkRcQty_sum")) = ToMyStqFmt(.fields("StkRcQty_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkRcValue_sum")) = ToMyStvFmt(.fields("StkRcValue_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkIsQty_sum")) = ToMyStqFmt(.fields("StkIsQty_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkIsValue_sum")) = ToMyStvFmt(.fields("StkIsValue_sum"))
                
            ElseIf optItemWise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkItmName")) = .fields("ItmName")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkQty_sum")) = ToMyStqFmt(.fields("StkQty_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkValue_sum")) = ToMyStvFmt(.fields("StkValue_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkRcQty_sum")) = ToMyStqFmt(.fields("StkRcQty_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkRcValue_sum")) = ToMyStvFmt(.fields("StkRcValue_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkIsQty_sum")) = ToMyStqFmt(.fields("StkIsQty_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkIsValue_sum")) = ToMyStvFmt(.fields("StkIsValue_sum"))
                
            End If
        
        ElseIf optDetailed.Value = True Or optCondensed.Value = True Then
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkCode")) = .fields("StkCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkICode")) = .fields("StkICode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkSno")) = .fields("StkSno")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkItmCode")) = .fields("StkItmCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkRecState")) = .fields("StkRecState")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("tStkSmryId")) = Format(.fields("StkDate"), "yyyymmdd") & Format(.fields("StkCode"), "0000000")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkDate")) = Dtoc(.fields("StkDate"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkItmName")) = .fields("ItmName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkQty")) = ToMyStqFmt(.fields("StkQty"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkValue")) = ToMyStvFmt(.fields("StkValue"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkRcQty")) = ToMyStqFmt(.fields("StkRcQty"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkRcValue")) = ToMyStvFmt(.fields("StkRcValue"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkIsQty")) = ToMyStqFmt(.fields("StkIsQty"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkIsValue")) = ToMyStvFmt(.fields("StkIsValue"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("StkNarr")) = .fields("StkNarr")
            
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

'Call SmryDrCrAmtTot
End Sub

Private Sub Calc_Value()
If Val(UnMyNumFmt(mskRcptQty.Text)) <> 0 Then
    clsSTK.mStkQty_dbl = Val(UnMyNumFmt(mskRcptQty.Text))
Else
    clsSTK.mStkQty_dbl = Val(UnMyNumFmt(mskIssueQty.Text)) * -1
End If
clsSTK.mStkRate_dbl = Val(UnMyNumFmt(mskStkRate.Text))
clsSTK.Calc_ActiveValue
mskStkValue.Text = ToMyNumFmt(clsSTK.mStkValue_dbl, , True)

End Sub

Private Sub txtStkNarr_LostFocus()
FlashActiveControl txtStkNarr, False
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

Private Sub txtStkNarr_Validate(Cancel As Boolean)
txtStkNarr.Text = ToMyWord(txtStkNarr.Text)
End Sub

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
    frConfigure.ZOrder
    frConfigure.Visible = True
    Mfgrd1.Enabled = False
    dtpFromDate.SetFocus
ElseIf MyAddNewKey(Shift, KeyCode) = True Then
    Call Data_AddEvent
ElseIf MyDeleteKey(Shift, KeyCode) = True Then
    If Mfgrd1.Row < Mfgrd1.Rows - 1 Then
        If optDetailed.Value = True Or optCondensed.Value = True Then
            Call Data_DeleteEvent
        End If
    End If
ElseIf Shift = vbCtrlMask And KeyCode = vbKeySpace Then
    Call cmdFormEnter_Click
End If

End Sub

Private Sub Mfgrd1_KeyPress(KeyAscii As Integer)
mLastKeyPressed = KeyAscii
If mMaskKeyPressed = 0 Or mMaskKeyPressed = vbShiftMask Then
    Select Case KeyAscii
    Case vbKeyBack
        If txtSearch1Text.Text <> "" Then
            txtSearch1Text.Text = Left(txtSearch1Text.Text, Len(txtSearch1Text.Text) - 1)
            Call txtSearch1Text_InterActiveChange
        End If
    Case Else
        txtSearch1Text.Text = txtSearch1Text.Text & Chr(KeyAscii)
        Call txtSearch1Text_InterActiveChange
    End Select
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
    If optDetailed.Value = True Or optCondensed.Value = True Then
        Rem datRecset.Find "tStkSmryId='" & Format(Ctod(dtpStkDate.Text), "yyyymmdd") + Format(mStkCode, "0000000") & "'", Start:=1
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("tStkSmryId"), mText
    ElseIf optMonthwise.Value = True Then
        Rem datRecset.Find "StkYrMonth='" & CStr(Year(Ctod(dtpStkDate.Text))) & "-" & CStr(Month(Ctod(dtpStkDate.Text))) & "'", Start:=1
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("StkYrMonth"), mText
    ElseIf optDatewise.Value = True Then
        Rem datRecset.Find "StkDate=#" & CStr(ToSysDate(Ctod(dtpStkDate.Text))) & "#", Start:=1
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("StkDateYMD"), mText
    ElseIf optItemWise.Value = True Then
        Rem datRecset.Find "StkItmName='" & Mfgrd2.TextMatrix(1, X2ITMNAME_COL) & "'", Start:=1
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("StkItmName"), mText
    End If
End If
ShowActiveFlexRow Mfgrd1

End Sub

Private Sub txtSearch1Text_GotFocus()
FlashActiveControl txtSearch1Text, True

End Sub

Private Sub txtSearch1Text_LostFocus()
FlashActiveControl txtSearch1Text, False
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
End If

End Sub

Private Sub txtVtmName_LostFocus()
FlashActiveControl txtVtmName, False
End Sub

Private Sub txtVtmName_Validate(Cancel As Boolean)
Dim mStkVchNo As Long

If Val(fcmbVtmName.BoundText) <= 0 Then
    ErrorBox "Invalid Selection !!!"
    txtVtmName.SetFocus
    Cancel = True
Else
    If Val(fcmbVtmName.BoundText) <> mStkVtmCode_old Or Ctod(dtpStkDate.Text) <> mStkDate_old Then
        mStkVchNo = GetNextVTypeNo(dbStDatabase, dbAcDatabase, dbComDatabase, mTableName:="StockHdr", mFieldName:="ShrVchNo", mVtmFieldName:="ShrVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="ShrCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="ShrDate", mDateFieldValue:=Ctod(dtpStkDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
        mskStkVchNo.Text = ToMyNumFmt(mStkVchNo, mDecimals:=0)
    End If
End If

End Sub
