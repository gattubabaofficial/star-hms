VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmJournal 
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
   Begin VB.TextBox txtVoid 
      CausesValidation=   0   'False
      Height          =   375
      Left            =   120
      TabIndex        =   15
      TabStop         =   0   'False
      Text            =   "Void"
      Top             =   8640
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
      TabIndex        =   21
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
      TabIndex        =   20
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
      ItemData        =   "Journal.frx":0000
      Left            =   0
      List            =   "Journal.frx":000D
      Style           =   1  'Simple Combo
      TabIndex        =   19
      TabStop         =   0   'False
      Text            =   "cmbFormMode"
      Top             =   360
      Width           =   1455
   End
   Begin VB.Frame frFormDtl 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   7095
      Left            =   120
      TabIndex        =   18
      Top             =   1080
      Width           =   11535
      Begin VB.Frame frFooter 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   1335
         Left            =   0
         TabIndex        =   39
         Top             =   4440
         Width           =   11535
         Begin VB.TextBox txtJhrNarr 
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
            Top             =   240
            Width           =   4455
         End
         Begin VB.Label lblDrAmtTot 
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
            Left            =   5520
            TabIndex        =   43
            Top             =   240
            Width           =   1575
         End
         Begin VB.Label lblCrAmtTot 
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
            Left            =   7080
            TabIndex        =   42
            Top             =   240
            Width           =   1575
         End
         Begin VB.Label lblDrDiffAmt 
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
            Left            =   5520
            TabIndex        =   41
            Top             =   600
            Width           =   1575
         End
         Begin VB.Label lblCrDiffAmt 
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
            Left            =   7080
            TabIndex        =   40
            Top             =   600
            Width           =   1575
         End
      End
      Begin VB.TextBox txtAhname 
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
         Left            =   1200
         TabIndex        =   8
         Top             =   2760
         Width           =   4935
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
         Left            =   9960
         Style           =   1  'Graphical
         TabIndex        =   12
         Top             =   2760
         Width           =   735
      End
      Begin VB.TextBox txtJrnNarr 
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
         Left            =   1200
         TabIndex        =   11
         Top             =   3180
         Width           =   4935
      End
      Begin VB.TextBox mskCrAmt 
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
         TabIndex        =   10
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   2760
         Width           =   1935
      End
      Begin VB.TextBox mskDrAmt 
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
         Left            =   6120
         TabIndex        =   9
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   2760
         Width           =   1935
      End
      Begin VB.TextBox txtDrCrFlag 
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
         Width           =   495
      End
      Begin VB.TextBox mskJrnSNo 
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
         Left            =   10560
         Style           =   1  'Graphical
         TabIndex        =   14
         Top             =   6480
         Width           =   615
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd2 
         Height          =   2775
         Left            =   120
         TabIndex        =   5
         Top             =   1560
         Width           =   10935
         _ExtentX        =   19288
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
         TabIndex        =   36
         Top             =   0
         Width           =   11535
         Begin VB.TextBox txtJrnPrefix 
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
            Left            =   8280
            TabIndex        =   3
            Tag             =   "AhCode"
            Text            =   "[Prefix]"
            Top             =   840
            Width           =   1215
         End
         Begin VB.TextBox mskJrnVchNo 
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
            TabIndex        =   4
            Tag             =   "AhCode"
            Text            =   "-1"
            Top             =   840
            Width           =   1335
         End
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
            Left            =   4080
            TabIndex        =   2
            Tag             =   "AhCode"
            Top             =   840
            Width           =   2775
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
            Left            =   1080
            TabIndex        =   0
            Tag             =   "AhCode"
            Text            =   "-1"
            Top             =   360
            Width           =   1335
         End
         Begin VB.TextBox dtpJrnDate 
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
            Left            =   1080
            TabIndex        =   1
            Tag             =   "AhCode"
            Text            =   "dd/mm/yyyy"
            Top             =   840
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
            Left            =   6960
            TabIndex        =   76
            Top             =   840
            Width           =   1335
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
            Left            =   2640
            TabIndex        =   75
            Top             =   840
            Width           =   1455
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
            TabIndex        =   38
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
            TabIndex        =   37
            Top             =   840
            Width           =   495
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
      Height          =   7185
      Left            =   120
      TabIndex        =   17
      Top             =   840
      Width           =   13095
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
         TabIndex        =   72
         TabStop         =   0   'False
         Top             =   1560
         Width           =   1335
      End
      Begin VB.Frame frConfigure 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   4935
         Left            =   3960
         TabIndex        =   44
         Top             =   480
         Width           =   6735
         Begin VB.Frame frShowDrCrTran 
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
            Height          =   1575
            Left            =   2880
            TabIndex        =   73
            Top             =   2040
            Width           =   3615
            Begin VB.OptionButton optShowCrTranOnly 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Show Credit Transaction only"
               BeginProperty Font 
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
               TabIndex        =   33
               Top             =   1080
               Width           =   3255
            End
            Begin VB.OptionButton optShowDrTranOnly 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Show Debit Transaction only"
               BeginProperty Font 
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
               TabIndex        =   32
               Top             =   720
               Width           =   3255
            End
            Begin VB.OptionButton optShowBothTran 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Show Both Transaction"
               BeginProperty Font 
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
               TabIndex        =   31
               Top             =   360
               Value           =   -1  'True
               Width           =   3255
            End
         End
         Begin VB.TextBox txtQryAhname 
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
            TabIndex        =   24
            Top             =   1080
            Width           =   4455
         End
         Begin VB.CheckBox chkCombinedDrCr 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Combined Debit / Credit"
            BeginProperty Font 
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
            Left            =   2880
            TabIndex        =   30
            Top             =   1680
            Value           =   1  'Checked
            Width           =   3135
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
            TabIndex        =   22
            Tag             =   "AhCode"
            Text            =   "dd/mm/yyyy"
            Top             =   720
            Width           =   1455
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
            TabIndex        =   23
            Tag             =   "AhCode"
            Text            =   "dd/mm/yyyy"
            Top             =   720
            Width           =   1455
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
            Left            =   120
            TabIndex        =   35
            Top             =   1560
            Width           =   2655
            Begin VB.OptionButton optAccountwise 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Account-wise"
               BeginProperty Font 
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
               Top             =   1800
               Width           =   2175
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
               TabIndex        =   28
               Top             =   1440
               Width           =   2175
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
               TabIndex        =   27
               Top             =   1080
               Width           =   2175
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
               TabIndex        =   25
               Top             =   360
               Value           =   -1  'True
               Width           =   2295
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
               TabIndex        =   26
               Top             =   720
               Width           =   2175
            End
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
            TabIndex        =   34
            Top             =   4200
            Width           =   855
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Account Name:"
            BeginProperty Font 
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
            TabIndex        =   48
            Top             =   1080
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
            Left            =   0
            TabIndex        =   47
            Top             =   0
            Width           =   6735
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
            TabIndex        =   46
            Top             =   720
            Width           =   1095
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
            TabIndex        =   45
            Top             =   720
            Width           =   855
         End
      End
      Begin VB.Frame frTranTotal 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Transaction Total:"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   1500
         Left            =   4515
         TabIndex        =   63
         Top             =   5580
         Width           =   3735
         Begin VB.Line Line3 
            X1              =   1560
            X2              =   3600
            Y1              =   915
            Y2              =   915
         End
         Begin VB.Label lblTrNetBal 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
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
            Left            =   1560
            TabIndex        =   69
            Top             =   975
            Width           =   2055
         End
         Begin VB.Label lblTrCrAmtTot 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
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
            Left            =   1560
            TabIndex        =   68
            Top             =   585
            Width           =   2055
         End
         Begin VB.Label lblTrDrAmtTot 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
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
            Left            =   1560
            TabIndex        =   67
            Top             =   240
            Width           =   2055
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Net Balance:"
            BeginProperty Font 
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
            Left            =   120
            TabIndex        =   66
            Top             =   975
            Width           =   1455
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Credit Amount:"
            BeginProperty Font 
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
            TabIndex        =   65
            Top             =   585
            Width           =   1455
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Debit Amount:"
            BeginProperty Font 
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
            TabIndex        =   64
            Top             =   240
            Width           =   1455
         End
      End
      Begin VB.Frame frOpnTotal 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Opening Total:"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   1485
         Left            =   630
         TabIndex        =   56
         Top             =   5580
         Width           =   3735
         Begin VB.Line Line1 
            X1              =   1560
            X2              =   3600
            Y1              =   960
            Y2              =   960
         End
         Begin VB.Label lblOpnNetBal 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
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
            Left            =   1560
            TabIndex        =   62
            Top             =   1020
            Width           =   2055
         End
         Begin VB.Label lblOpnCrAmtTot 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
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
            Left            =   1560
            TabIndex        =   61
            Top             =   645
            Width           =   2055
         End
         Begin VB.Label lblOpnDrAmtTot 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
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
            Left            =   1560
            TabIndex        =   60
            Top             =   300
            Width           =   2055
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Net Balance:"
            BeginProperty Font 
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
            TabIndex        =   59
            Top             =   1020
            Width           =   1455
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Credit Amount:"
            BeginProperty Font 
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
            TabIndex        =   58
            Top             =   645
            Width           =   1455
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Debit Amount:"
            BeginProperty Font 
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
            TabIndex        =   57
            Top             =   300
            Width           =   1455
         End
      End
      Begin VB.Frame frCurTotal 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Current Balance:"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   1500
         Left            =   8400
         TabIndex        =   49
         Top             =   5580
         Width           =   3735
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Debit Amount:"
            BeginProperty Font 
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
            TabIndex        =   55
            Top             =   240
            Width           =   1455
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Credit Amount:"
            BeginProperty Font 
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
            TabIndex        =   54
            Top             =   585
            Width           =   1455
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Net Balance:"
            BeginProperty Font 
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
            TabIndex        =   53
            Top             =   975
            Width           =   1455
         End
         Begin VB.Label lblCurDrAmtTot 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
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
            Left            =   1560
            TabIndex        =   52
            Top             =   240
            Width           =   2055
         End
         Begin VB.Label lblCurCrAmtTot 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
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
            Left            =   1560
            TabIndex        =   51
            Top             =   585
            Width           =   2055
         End
         Begin VB.Label lblCurNetBal 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
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
            Left            =   1560
            TabIndex        =   50
            Top             =   975
            Width           =   2055
         End
         Begin VB.Line Line2 
            X1              =   1560
            X2              =   3600
            Y1              =   915
            Y2              =   915
         End
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd1 
         Height          =   4695
         Left            =   240
         TabIndex        =   71
         Top             =   720
         Width           =   12255
         _ExtentX        =   21616
         _ExtentY        =   8281
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
         TabIndex        =   70
         Top             =   360
         Width           =   4215
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
         Index           =   14
         Left            =   360
         TabIndex        =   74
         Top             =   360
         Width           =   735
      End
   End
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Journal Entry"
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
      TabIndex        =   16
      Top             =   0
      Width           =   9015
   End
End
Attribute VB_Name = "frmJournal"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim dbAcDatabase As New ADODB.Connection, dbGrpDatabase As New ADODB.Connection, dbComDatabase As New ADODB.Connection
Dim datRecset As New ADODB.Recordset
Dim mFormLoaded As Boolean, mLastKeyPressed As Integer, mMaskKeyPressed As Integer, mFormUIdCode As Long, mFormUIdFileName As String, mFormAcsPermFileName As String
Dim mRemoteAccess As Boolean, mEntrySaved As Boolean, mEntryAborted As Boolean
Dim mJrnCode As Long, dtlAddEditMode As Boolean, dtlAddMode As Boolean, dtlEditCanceled As Boolean
Dim clsJRN As clsJournal, mActiveControl As Object, clsListStru As clsSelectQueryStructure
Dim fcmbAhName As clsComFlexSearch, fcmbVtmName As clsComFlexSearch
Dim mDrCrAmtDiff As Double, mDrAmtTot As Double, mCrAmtTot As Double
Dim mJrnDate_old As Date, mJrnVtmCode_old As Long, mJrnVchNo_old As Long

Private Type SmryPara
mIndex() As Variant
mFromDate() As Variant
mToDate() As Variant
mAhCode() As Variant
mDetailed() As Variant
mCondensed() As Variant
mMonthwise() As Variant
mDatewise() As Variant
mAcntwise() As Variant
mCombinedDrCr() As Variant
mShowBothTran() As Variant
mShowDrTranOnly() As Variant
mShowCrTranOnly() As Variant
mRowIndex() As Variant

End Type

Dim SmryParaLayer As SmryPara

' Journal transaction detail grid Mfgrd2 column definitions
Const X2JRNICODE_COL = 0
Const X2JRNSNO_COL = 1
Const X2DRCRFLAG_COL = 2
Const X2AHNAME_COL = 3
Const X2DRAMT_COL = 4
Const X2CRAMT_COL = 5
Const X2JRNNARR_COL = 6
Const X2JRNAHCODE_COL = 7
Const X2JRNRECSTATE_COL = 8
Const MFGRD2_COLS = 9

Private Sub ClearSmryParaLayer()

With SmryParaLayer
.mIndex = Array()
.mFromDate = Array()
.mToDate = Array()
.mAhCode = Array()
.mDetailed = Array()
.mCondensed = Array()
.mMonthwise = Array()
.mDatewise = Array()
.mAcntwise = Array()
.mCombinedDrCr = Array()
.mShowBothTran = Array()
.mShowDrTranOnly = Array()
.mShowCrTranOnly = Array()
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
    ReDim Preserve .mAhCode(mIndex)
    ReDim Preserve .mDetailed(mIndex)
    ReDim Preserve .mCondensed(mIndex)
    ReDim Preserve .mMonthwise(mIndex)
    ReDim Preserve .mDatewise(mIndex)
    ReDim Preserve .mAcntwise(mIndex)
    ReDim Preserve .mCombinedDrCr(mIndex)
    ReDim Preserve .mShowBothTran(mIndex)
    ReDim Preserve .mShowDrTranOnly(mIndex)
    ReDim Preserve .mShowCrTranOnly(mIndex)
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
ReDim Preserve .mAhCode(mIndex)
ReDim Preserve .mDetailed(mIndex)
ReDim Preserve .mCondensed(mIndex)
ReDim Preserve .mMonthwise(mIndex)
ReDim Preserve .mDatewise(mIndex)
ReDim Preserve .mAcntwise(mIndex)
ReDim Preserve .mCombinedDrCr(mIndex)
ReDim Preserve .mShowBothTran(mIndex)
ReDim Preserve .mShowDrTranOnly(mIndex)
ReDim Preserve .mShowCrTranOnly(mIndex)
ReDim Preserve .mRowIndex(mIndex)
' -----------------------
.mIndex(mIndex) = mIndex
.mFromDate(mIndex) = Ctod(dtpFromDate.Text)
.mToDate(mIndex) = Ctod(dtpToDate.Text)
.mAhCode(mIndex) = Val(fcmbAhName.BoundText)
.mDetailed(mIndex) = optDetailed.Value
.mCondensed(mIndex) = optCondensed.Value
.mMonthwise(mIndex) = optMonthwise.Value
.mDatewise(mIndex) = optDatewise.Value
.mAcntwise(mIndex) = optAccountwise.Value
.mCombinedDrCr(mIndex) = chkCombinedDrCr.Value
.mShowBothTran(mIndex) = optShowBothTran.Value
.mShowDrTranOnly(mIndex) = optShowDrTranOnly.Value
.mShowCrTranOnly(mIndex) = optShowCrTranOnly.Value
.mRowIndex(mIndex) = -1

End With

End Sub

Private Sub RestoreDefaultSmryPara()

dtpFromDate.Text = Dtoc(DefaultEntryDate)
dtpToDate.Text = Dtoc(DefaultEntryDate)
txtQryAhname.Text = "": fcmbAhName.BoundText = ""
optDetailed.Value = True
optCondensed.Value = False
optMonthwise.Value = False
optDatewise.Value = False
optAccountwise.Value = False
chkCombinedDrCr.Value = 0
optShowBothTran.Value = True
' ----------
AddSmryParaLayer mClear:=True

End Sub

Private Sub RestoreRecentSmryPara()
Dim mIndex As Integer

With SmryParaLayer
mIndex = UBound(.mIndex)
dtpFromDate.Text = Dtoc(.mFromDate(mIndex))
dtpToDate.Text = Dtoc(.mToDate(mIndex))
fcmbAhName.BoundText = CStr(.mAhCode(mIndex)): txtQryAhname.Text = fcmbAhName.Text
optDetailed.Value = .mDetailed(mIndex)
optCondensed.Value = .mCondensed(mIndex)
optMonthwise.Value = .mMonthwise(mIndex)
optDatewise.Value = .mDatewise(mIndex)
optAccountwise.Value = .mAcntwise(mIndex)
chkCombinedDrCr.Value = .mCombinedDrCr(mIndex)
optShowBothTran.Value = .mShowBothTran(mIndex)
optShowDrTranOnly.Value = .mShowDrTranOnly(mIndex)
optShowCrTranOnly.Value = .mShowCrTranOnly(mIndex)
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
mJrnCode = mAccessCode
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
EntryDate = Ctod(dtpJrnDate.Text)
End Property

Public Property Get FirstAccountName() As String
FirstAccountName = Mfgrd2.TextMatrix(Mfgrd2.FixedRows, X2AHNAME_COL)
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

Private Sub chkCombinedDrCr_GotFocus()
FlashActiveControl chkCombinedDrCr, True
End Sub

Private Sub chkCombinedDrCr_LostFocus()
FlashActiveControl chkCombinedDrCr, False
End Sub

Private Sub mskJrnVchNo_GotFocus()
FlashActiveControl mskJrnVchNo, True
End Sub

Private Sub mskJrnVchNo_LostFocus()
FlashActiveControl mskJrnVchNo, False
End Sub

Private Sub mskJrnVchNo_Validate(Cancel As Boolean)
Dim mJrnVchNo As Long
mJrnVchNo = Val(UnMyNumFmt(mskJrnVchNo.Text))
If mJrnVchNo < 0 Then
    mJrnVchNo = GetNextVTypeNo(dbAcDatabase, dbAcDatabase, dbComDatabase, mTableName:="JrnHdr", mFieldName:="JhrVchNo", mVtmFieldName:="JhrVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="JhrCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="JhrDate", mDateFieldValue:=Ctod(dtpJrnDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
    mskJrnVchNo.Text = ToMyNumFmt(mJrnVchNo, mDecimals:=0)
ElseIf mJrnVchNo > 0 Then
    If mJrnVchNo <> mJrnVchNo_old Or Val(fcmbVtmName.BoundText) <> mJrnVtmCode_old Or Ctod(dtpJrnDate.Text) <> mJrnDate_old Then
        If ChkIsDuplVTypeNo(dbAcDatabase, dbAcDatabase, mTableName:="JrnHdr", mChkFieldName:="JhrVchNo", mChkFieldValue:=mJrnVchNo, mKeyFieldName:="JhrCode", mKeyFieldValue:=mJrnCode, mVtmFieldName:="JhrVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="JhrCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="JhrDate", mDateFieldValue:=Ctod(dtpJrnDate.Text)) = True Then
            ErrorBox "Duplicate Input !!!"
            Cancel = True
            mskJrnVchNo.SetFocus
            ' ----------
            If FormAddEditMode = cFORM_ADDMODE Then
                mJrnVchNo = GetNextVTypeNo(dbAcDatabase, dbAcDatabase, dbComDatabase, mTableName:="JrnHdr", mFieldName:="JhrVchNo", mVtmFieldName:="JhrVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="JhrCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="JhrDate", mDateFieldValue:=Ctod(dtpJrnDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
            Else
                mJrnVchNo = mJrnVchNo_old
            End If
            mskJrnVchNo.Text = ToMyNumFmt(mJrnVchNo, mDecimals:=0)
        End If
    End If
    If Cancel = False Then
        mskJrnVchNo.Text = ToMyNumFmt(mJrnVchNo, mDecimals:=0)
    End If
Else
    ErrorBox "Invalid Input !!!"
    mskJrnVchNo.SetFocus
    Cancel = True
End If

End Sub

Private Sub optShowCrTranOnly_GotFocus()
FlashActiveControl optShowCrTranOnly, True
End Sub

Private Sub optShowCrTranOnly_LostFocus()
FlashActiveControl optShowCrTranOnly, False
End Sub

Private Sub optShowDrTranOnly_GotFocus()
FlashActiveControl optShowDrTranOnly, True
End Sub

Private Sub optShowDrTranOnly_LostFocus()
FlashActiveControl optShowDrTranOnly, False
End Sub

Private Sub optShowBothTran_GotFocus()
FlashActiveControl optShowBothTran, True
End Sub

Private Sub optShowBothTran_LostFocus()
FlashActiveControl optShowBothTran, False
End Sub

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
                    dtpFromDate.Text = Dtoc(MonthStartDate(DateSerial(Val(Left(.fields("JrnYrMonth"), 4)), Val(Right(.fields("JrnYrMonth"), 2)), 1)))
                    dtpToDate.Text = Dtoc(MonthEndDate(DateSerial(Val(Left(.fields("JrnYrMonth"), 4)), Val(Right(.fields("JrnYrMonth"), 2)), 1)))
                    optMonthwise.Value = False
                    optDatewise.Value = True
                ElseIf optDatewise.Value = True Then
                    dtpFromDate.Text = Dtoc(.fields("JrnDate"))
                    dtpToDate.Text = Dtoc(.fields("JrnDate"))
                    optDatewise.Value = False
                    optDetailed.Value = True
                ElseIf optAccountwise.Value = True Then
                    fcmbAhName.BoundText = CStr(.fields("JrnAhCode"))
                    txtQryAhname.Text = fcmbAhName.Text
                    optAccountwise.Value = False
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
    End If
ElseIf FormAddEditMode = cFORM_SMRYMODE And frConfigure.Visible = False Then
Else
    SendKeys "{tab}"
End If

End Sub

Private Sub cmdFormEscape_Click()
Dim mRecAbsPos As Long, srow As Integer

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
        txtVtmName.SetFocus
    End If
End If

End Sub

Private Sub cmdOK_Click()
Dim tRecset As New ADODB.Recordset, srow As Integer, mJrnSno As Integer, mJrnICode As Long, pJrnAmt As Double, pJrnAhCode As Long

srow = Mfgrd2.Row
mJrnSno = Val(Mfgrd2.TextMatrix(srow, X2JRNSNO_COL))
mJrnICode = Val(Mfgrd2.TextMatrix(srow, X2JRNICODE_COL))
pJrnAmt = 0
pJrnAhCode = 0

If cmdOK.Caption = "&OK" And dtlEditCanceled = False Then
    If dtlAddMode = True Then
        clsJRN.ClearDtl
    Else
        clsJRN.GetDtlData mJrnCode, mJrnICode
    End If
    clsJRN.mJrnSno_int = Val(mskJrnSNo.Text)
    clsJRN.mJrnVtmCode_lng = Val(fcmbVtmName.BoundText)
    clsJRN.mJrnPrefix_str = txtJrnPrefix.Text
    clsJRN.mJrnVchNo_lng = Val(UnMyNumFmt(mskJrnVchNo.Text))
    clsJRN.mJrnPostfix_str = ""
    clsJRN.mJrnDate_dt = Ctod(dtpJrnDate.Text)
    clsJRN.mJrnAhCode_lng = Val(fcmbAhName.BoundText)
    clsJRN.mJrnAutoGen_bln = False
    clsJRN.mJrnCmpCode_int = sFinYrCmpCode
    If Val(UnMyNumFmt(mskDrAmt.Text)) <> 0 Then
        clsJRN.mJrnAmt_dbl = Val(UnMyNumFmt(mskDrAmt.Text)) * -1
    Else
        clsJRN.mJrnAmt_dbl = Val(UnMyNumFmt(mskCrAmt.Text))
    End If
    clsJRN.mJrnNarr_str = txtJrnNarr.Text
    If dtlAddMode = True Then
        If clsJRN.AddNewDtl(mJrnCode) = True Then
            mJrnICode = clsJRN.mJrnICode_lng
        End If
    Else
        clsJRN.UpdateDtl mJrnCode, mJrnICode
    End If
    
    With tRecset
    .open "Select * from Journal where JrnCode=" & CStr(mJrnCode) & " and JrnICode=" & CStr(mJrnICode) & "", dbAcDatabase, adOpenKeyset, adLockOptimistic
    clsJRN.clsAH.GetData .fields("JrnAhCode")
    
    Mfgrd2.TextMatrix(srow, X2JRNICODE_COL) = .fields("JrnICode")
    Mfgrd2.TextMatrix(srow, X2JRNSNO_COL) = .fields("JrnSno")
    Mfgrd2.TextMatrix(srow, X2DRCRFLAG_COL) = SenseDrCrFlag(.fields("JrnAmt"))
    Mfgrd2.TextMatrix(srow, X2AHNAME_COL) = clsJRN.clsAH.mAhName_str
    Mfgrd2.TextMatrix(srow, X2DRAMT_COL) = ToMyNumFmt(SenseDrAmt(.fields("JrnAmt")))
    Mfgrd2.TextMatrix(srow, X2CRAMT_COL) = ToMyNumFmt(SenseCrAmt(.fields("JrnAmt")))
    Mfgrd2.TextMatrix(srow, X2JRNNARR_COL) = .fields("JrnNarr")
    Mfgrd2.TextMatrix(srow, X2JRNAHCODE_COL) = .fields("JrnAhCode")
    Mfgrd2.TextMatrix(srow, X2JRNRECSTATE_COL) = .fields("JrnRecState")
    
    End With
    CloseTable tRecset
    
    If dtlAddMode = True Then
        Mfgrd2.Rows = Mfgrd2.Rows + 1
    End If
    srow = srow + 1
    Mfgrd2.Row = srow
    
    Call CalcDrCrAmtTot
End If
dtlAddEditMode = False
dtlAddMode = False
dtlEditCanceled = False
Call VisibleControls(False)
txtVoid.SetFocus
Mfgrd2.SetFocus
CloseTable tRecset, mCheckOpen:=True

End Sub

Private Sub cmdSaveForm_Click()
txtVoid.SetFocus
Call Data_SaveEvent
Call SmryList

If optDetailed.Value = True Or optCondensed.Value = True Then
    Rem datRecset.Find "tJrnSmryId='" & Format(Ctod(dtpJrnDate.Text), "yyyymmdd") + Format(mJrnCode, "0000000") & "'", Start:=1
    txtSearch1Text_InterActiveChange Format(Ctod(dtpJrnDate.Text), "yyyymmdd") + Format(mJrnCode, "0000000")
ElseIf optMonthwise.Value = True Then
    Rem datRecset.Find "JrnYrMonth='" & CStr(Year(Ctod(dtpJrnDate.Text))) & "-" & CStr(Month(Ctod(dtpJrnDate.Text))) & "'", Start:=1
    txtSearch1Text_InterActiveChange Format(Ctod(dtpJrnDate.Text), "yyyy") & "/" & Format(Ctod(dtpJrnDate.Text), "mm")
ElseIf optDatewise.Value = True Then
    Rem datRecset.Find "JrnDate=#" & CStr(ToSysDate(Ctod(dtpJrnDate.Text))) & "#", Start:=1
    txtSearch1Text_InterActiveChange Format(Ctod(dtpJrnDate.Text), "yyyymmdd")
ElseIf optAccountwise.Value = True Then
    Rem datRecset.Find "JrnAhName='" & Mfgrd2.TextMatrix(1, X2AHNAME_COL) & "'", Start:=1
    txtSearch1Text_InterActiveChange Mfgrd2.TextMatrix(1, X2AHNAME_COL)
End If

Call ShowEntryMode(False)
Mfgrd1.SetFocus

End Sub

Private Sub cmdSaveForm_GotFocus()
Dim mAcsPermNo As Integer, mRetryCount As Integer
txtVoid.SetFocus
cmdSaveForm.Enabled = False
If Data_Verify() = True Then
    If CanAccept() = True Then
        If GetAccessPerm(mAcsPermNo, mRetryCount, mFormAcsPermFileName) = True And mRetryCount = 0 Then
            If Data_NetwAuth() = True Then
                Call cmdSaveForm_Click
                Close #mAcsPermNo
                If mRemoteAccess = True Then
                    ''Unload Me
                    Me.Hide
                    Exit Sub
                End If
            Else
                Close #mAcsPermNo
            End If
        Else
            Close #mAcsPermNo
            AlertBox "System Busy, Try Again !!!"
            
            txtVtmName.SetFocus
        End If
    Else
        txtVtmName.SetFocus
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

Private Sub dtpJrnDate_GotFocus()
FlashActiveControl dtpJrnDate, True
End Sub

Private Sub dtpJrnDate_LostFocus()
FlashActiveControl dtpJrnDate, False
End Sub

Private Sub dtpJrnDate_Validate(Cancel As Boolean)
dtpJrnDate.Text = ToMyDate(dtpJrnDate.Text)
If IsFinYrDate(Ctod(dtpJrnDate.Text)) = False Then
    ErrorBox "Invalid Entry Date !!!"
    dtpJrnDate.SetFocus
    Cancel = True
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
        If mJrnCode = 0 Then
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

mFormUIdFileName = "Journal.Uid"
mFormAcsPermFileName = "Journal.Acp"
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

OpenAcDataSource dbAcDatabase
OpenGrpDataSource dbGrpDatabase
OpenComDataSource dbComDatabase

Set clsJRN = New clsJournal
Set clsJRN.dbAcDatabase = dbAcDatabase
Set clsJRN.dbGrpDatabase = dbGrpDatabase
Set clsListStru = New clsSelectQueryStructure

Set fcmbVtmName = New clsComFlexSearch
Set fcmbVtmName.dbAcDatabase = dbAcDatabase
fcmbVtmName.blnVTypeMastList = True
fcmbVtmName.mListSqlExpr = "Select * from VTypMast where VtmSysCode=" & CStr(cCOM_VTYPE_JOURNAL) & " order by VtmName"
fcmbVtmName.Init

Set fcmbAhName = New clsComFlexSearch
Set fcmbAhName.dbAcDatabase = dbAcDatabase
fcmbAhName.blnAchdMastList = True
fcmbAhName.Init

Call RestoreDefaultSmryPara
If mRemoteAccess = True Then
    optDetailed.Value = True
    AddSmryParaLayer mClear:=True
End If

Mfgrd1.Rows = 2: Mfgrd1.FixedRows = 1: Mfgrd1.FixedCols = 0
datRecset.open "Select * from Journal order by JrnICode", dbAcDatabase, adOpenKeyset, adLockOptimistic
Call SmryList

Mfgrd2.Rows = 2: Mfgrd2.Cols = MFGRD2_COLS
colcnt = X2JRNICODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2JRNICODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2JRNSNO_COL: Mfgrd2.ColWidth(colcnt) = mskJrnSNo.Width: Mfgrd2.TextMatrix(0, colcnt) = "SNo": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2DRCRFLAG_COL: Mfgrd2.ColWidth(colcnt) = txtDrCrFlag.Width: Mfgrd2.TextMatrix(0, colcnt) = "Dr/Cr": Mfgrd2.ColAlignment(colcnt) = 2
colcnt = X2AHNAME_COL: Mfgrd2.ColWidth(colcnt) = txtAhName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Account Head": Mfgrd2.ColAlignment(colcnt) = 2
colcnt = X2DRAMT_COL: Mfgrd2.ColWidth(colcnt) = mskDrAmt.Width: Mfgrd2.TextMatrix(0, colcnt) = "Dr.Amt": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2CRAMT_COL: Mfgrd2.ColWidth(colcnt) = mskCrAmt.Width: Mfgrd2.TextMatrix(0, colcnt) = "Cr.Amt": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2JRNNARR_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2JRNNARR_COL": Mfgrd2.ColAlignment(colcnt) = 2
colcnt = X2JRNAHCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2JRNAHCODE_COL": Mfgrd2.ColAlignment(colcnt) = 2
colcnt = X2JRNRECSTATE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2JRNRECSTATE_COL": Mfgrd2.ColAlignment(colcnt) = 2

colcnt = X2JRNSNO_COL: mskJrnSNo.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2DRCRFLAG_COL: txtDrCrFlag.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2AHNAME_COL: txtAhName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2DRAMT_COL: mskDrAmt.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2CRAMT_COL: mskCrAmt.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
txtJrnNarr.Left = txtAhName.Left
cmdOK.Left = mskCrAmt.Left + mskCrAmt.Width + 5

ShowEntryMode False
VisibleControls False

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
CloseTable datRecset
Set clsJRN = Nothing
Set fcmbVtmName = Nothing
Set fcmbAhName = Nothing
Set clsListStru = Nothing

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
Dim mJrnVchNo As Long
Data_Verify = False
If FormAddEditMode = cFORM_EDITMODE And Val(mskFormBoundField.Text) < 1 Then
    ErrorBox "Invalid Key Value !!!"
    txtVtmName.SetFocus
    Exit Function
End If
If Val(fcmbVtmName.BoundText) <= 0 Then
    ErrorBox "Invalid Selection !!!"
    txtVtmName.SetFocus
    Exit Function
End If
mJrnVchNo = Val(UnMyNumFmt(mskJrnVchNo.Text))
If mJrnVchNo > 0 Then
    If mJrnVchNo <> mJrnVchNo_old Or Val(fcmbVtmName.BoundText) <> mJrnVtmCode_old Or Ctod(dtpJrnDate.Text) <> mJrnDate_old Then
        If ChkIsDuplVTypeNo(dbAcDatabase, dbAcDatabase, mTableName:="JrnHdr", mChkFieldName:="JhrVchNo", mChkFieldValue:=mJrnVchNo, mKeyFieldName:="JhrCode", mKeyFieldValue:=mJrnCode, mVtmFieldName:="JhrVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="JhrCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="JhrDate", mDateFieldValue:=Ctod(dtpJrnDate.Text)) = True Then
            ErrorBox "Duplicate Input !!!"
            mskJrnVchNo.SetFocus
            ' ---------------
            If FormAddEditMode = cFORM_ADDMODE Then
                mJrnVchNo = GetNextVTypeNo(dbAcDatabase, dbAcDatabase, dbComDatabase, mTableName:="JrnHdr", mFieldName:="JhrVchNo", mVtmFieldName:="JhrVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="JhrCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="JhrDate", mDateFieldValue:=Ctod(dtpJrnDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
            Else
                mJrnVchNo = mJrnVchNo_old
            End If
            mskJrnVchNo.Text = ToMyNumFmt(mJrnVchNo, mDecimals:=0)
            Exit Function
        End If
    End If
Else
    ErrorBox "Invalid Input !!!"
    mskJrnVchNo.SetFocus
    Exit Function
End If
dtpJrnDate.Text = ToMyDate(dtpJrnDate.Text)
If Between(Ctod(dtpJrnDate.Text), sFinYrStartDate, sFinYrEndDate) = False Then
    ErrorBox "Invalid Entry Date !!!"
    dtpJrnDate.SetFocus
    Exit Function
End If
If mDrCrAmtDiff <> 0 Or mDrAmtTot = 0 Or mCrAmtTot = 0 Then
    ErrorBox "Debit & Credit Amount Misbalanced  !!!"
    Mfgrd2.Row = Mfgrd2.Rows - 1
    Mfgrd2.SetFocus
    Exit Function
End If

Data_Verify = True
End Function

Private Function Data_NetwAuth() As Boolean
Dim mJrnVchNo As Long
Data_NetwAuth = False

mJrnVchNo = Val(UnMyNumFmt(mskJrnVchNo.Text))
If mJrnVchNo <> mJrnVchNo_old Or Val(fcmbVtmName.BoundText) <> mJrnVtmCode_old Or Ctod(dtpJrnDate.Text) <> mJrnDate_old Then
    If ChkIsDuplVTypeNo(dbAcDatabase, dbAcDatabase, mTableName:="JrnHdr", mChkFieldName:="JhrVchNo", mChkFieldValue:=mJrnVchNo, mKeyFieldName:="JhrCode", mKeyFieldValue:=mJrnCode, mVtmFieldName:="JhrVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="JhrCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="JhrDate", mDateFieldValue:=Ctod(dtpJrnDate.Text)) = True Then
        ErrorBox "Duplicate Input !!!"
        mskJrnVchNo.SetFocus
        ' ---------------
        If FormAddEditMode = cFORM_ADDMODE Then
            mJrnVchNo = GetNextVTypeNo(dbAcDatabase, dbAcDatabase, dbComDatabase, mTableName:="JrnHdr", mFieldName:="JhrVchNo", mVtmFieldName:="JhrVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="JhrCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="JhrDate", mDateFieldValue:=Ctod(dtpJrnDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
        Else
            mJrnVchNo = mJrnVchNo_old
        End If
        mskJrnVchNo.Text = ToMyNumFmt(mJrnVchNo, mDecimals:=0)
        Exit Function
    End If
End If

Data_NetwAuth = True

End Function

Private Sub ShowDtlData()
Dim srow As Integer, mDrAmtTot As Double, mCrAmtTot As Double, tRecset As New ADODB.Recordset, mFormBoundCode As Long, mColCnt As Integer

mFormBoundCode = Val(mskFormBoundField.Text)
srow = 1
Mfgrd2.Rows = 2
mDrAmtTot = 0
mCrAmtTot = 0

With tRecset
.open "Select * from Journal where JrnCode=" & CStr(mFormBoundCode) & " order by JrnSno", dbAcDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Do While .EOF = False
        If InList(.fields("JrnRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
            clsJRN.clsAH.GetData .fields("JrnAhCode")
            
            Mfgrd2.TextMatrix(srow, X2JRNICODE_COL) = .fields("JrnICode")
            Mfgrd2.TextMatrix(srow, X2JRNSNO_COL) = .fields("JrnSno")
            Mfgrd2.TextMatrix(srow, X2DRCRFLAG_COL) = SenseDrCrFlag(.fields("JrnAmt"))
            Mfgrd2.TextMatrix(srow, X2AHNAME_COL) = clsJRN.clsAH.mAhName_str
            Mfgrd2.TextMatrix(srow, X2DRAMT_COL) = ToMyNumFmt(SenseDrAmt(.fields("JrnAmt")))
            Mfgrd2.TextMatrix(srow, X2CRAMT_COL) = ToMyNumFmt(SenseCrAmt(.fields("JrnAmt")))
            Mfgrd2.TextMatrix(srow, X2JRNNARR_COL) = .fields("JrnNarr")
            Mfgrd2.TextMatrix(srow, X2JRNAHCODE_COL) = .fields("JrnAhCode")
            Mfgrd2.TextMatrix(srow, X2JRNRECSTATE_COL) = .fields("JrnRecState")
            
            mDrAmtTot = mDrAmtTot + Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2DRAMT_COL)))
            mCrAmtTot = mCrAmtTot + Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2CRAMT_COL)))
            
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

Call CalcDrCrAmtTot

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
Dim srow As Integer, mJrnICode As Long, mDeleteit As Boolean
srow = Mfgrd2.Row
mJrnICode = Val(Mfgrd2.TextMatrix(srow, X2JRNICODE_COL))

If InList(KeyCode, Array(vbKeyDelete, vbKeySubtract)) And mJrnICode > 0 Then
    mDeleteit = True
    If mDeleteit = True Then
        mDeleteit = CanDelete()
    End If
    If mDeleteit = True Then
        clsJRN.DeleteDtl mJrnCode, mJrnICode
        
        Call ShowDtlData
        Mfgrd2.Row = srow
        Mfgrd2.SetFocus
        Call Mfgrd2_RowColChange
    End If
End If

End Sub

Private Sub Mfgrd2_KeyPress(KeyAscii As Integer)
Dim srow As Integer, mJrnSno As Integer

If KeyAscii = 13 Then
    srow = Mfgrd2.Row
    mJrnSno = Val(Mfgrd2.TextMatrix(srow, X2JRNSNO_COL))
    
    dtlAddEditMode = True
    dtlAddMode = IsFlexNewRow(Mfgrd2, srow)
    Call VisibleControls(True, Mfgrd2.Top + Mfgrd2.RowPos(Mfgrd2.Row))
    If dtlAddMode = True Then
        mskJrnSNo.Text = FlexNextSeqno(Mfgrd2, X2JRNSNO_COL)
        txtDrCrFlag.Text = IIf(mDrCrAmtDiff > 0, "Cr", "Dr")
        txtAhName.Text = "": fcmbAhName.BoundText = ""
        mskDrAmt.Text = ToMyNumFmt(SenseDrAmt(mDrCrAmtDiff))
        mskCrAmt.Text = ToMyNumFmt(SenseCrAmt(mDrCrAmtDiff))
        txtJrnNarr.Text = ""
    Else
        mskJrnSNo.Text = Val(Mfgrd2.TextMatrix(srow, X2JRNSNO_COL))
        txtDrCrFlag.Text = Mfgrd2.TextMatrix(srow, X2DRCRFLAG_COL)
        fcmbAhName.BoundText = Mfgrd2.TextMatrix(srow, X2JRNAHCODE_COL)
        txtAhName.Text = fcmbAhName.Text
        mskDrAmt.Text = Mfgrd2.TextMatrix(srow, X2DRAMT_COL)
        mskCrAmt.Text = Mfgrd2.TextMatrix(srow, X2CRAMT_COL)
        txtJrnNarr.Text = Mfgrd2.TextMatrix(srow, X2JRNNARR_COL)
    End If
    txtDrCrFlag.SetFocus
    Call ValidDtl

End If

End Sub

Private Sub VisibleControls(ByVal mShowItem As Boolean, Optional ByVal mRowPos)
Rem Important - dtlAddEditMode & dtlAddMode must be initialised prior to this
If Me.Visible = True Then
    txtVoid.SetFocus
End If
If IsMissing(mRowPos) = False Then
    mskJrnSNo.Top = mRowPos
    txtDrCrFlag.Top = mRowPos
    txtAhName.Top = mRowPos
    mskDrAmt.Top = mRowPos
    mskCrAmt.Top = mRowPos
    txtJrnNarr.Top = mRowPos + txtAhName.Height + 5
    cmdOK.Top = mRowPos
End If

mskJrnSNo.Text = 0
txtDrCrFlag.Text = ""
txtAhName.Text = "": fcmbAhName.BoundText = ""
mskDrAmt.Text = 0
mskCrAmt.Text = 0
txtJrnNarr.Text = ""
Call ValidDtl

mskJrnSNo.Visible = mShowItem
txtDrCrFlag.Visible = mShowItem
'lovAhName.mVisible = mShowItem
txtAhName.Visible = mShowItem
mskDrAmt.Visible = mShowItem
mskCrAmt.Visible = mShowItem
txtJrnNarr.Visible = mShowItem
cmdOK.Visible = mShowItem

frHeader.Enabled = (mShowItem = False)
Mfgrd2.Enabled = (mShowItem = False)
frFooter.Enabled = (mShowItem = False)
cmdSaveForm.Enabled = (mShowItem = False)

End Sub

Private Sub ValidDtl()
Dim mDataOk As Boolean
mDataOk = (Val(mskJrnSNo.Text) > 0 And (txtDrCrFlag.Text = "Dr" Or txtDrCrFlag.Text = "Cr") And Val(fcmbAhName.BoundText) <> 0)
cmdOK.Caption = IIf(mDataOk = True, "&OK", "&Cancel")
cmdOK.BackColor = IIf(mDataOk = True, &H80FF80, &H8080FF)
End Sub

Private Sub CalcDrCrAmtTot()
'''Dim mDrAmtTot As Double, mCrAmtTot As Double
mDrAmtTot = FlexColSum(Mfgrd2, X2DRAMT_COL)
mCrAmtTot = FlexColSum(Mfgrd2, X2CRAMT_COL)

lblDrAmtTot.Caption = ToMyNumFmt(mDrAmtTot)
lblCrAmtTot.Caption = ToMyNumFmt(mCrAmtTot)
mDrCrAmtDiff = (mDrAmtTot - mCrAmtTot)

If mDrCrAmtDiff > 0 Then
    lblCrDiffAmt.Caption = ToMyNumFmt(mDrCrAmtDiff, , True)
    lblDrDiffAmt.Caption = ""
ElseIf mDrCrAmtDiff < 0 Then
    lblDrDiffAmt.Caption = ToMyNumFmt(mDrCrAmtDiff, , True)
    lblCrDiffAmt.Caption = ""
Else
    lblDrDiffAmt.Caption = ""
    lblCrDiffAmt.Caption = ""
End If

End Sub

Private Sub Mfgrd2_RowColChange()
ShowActiveFlexRow Mfgrd2

End Sub

Private Sub mskCrAmt_Change()
If InList(mskCrAmt.Text, Array("0", "0.00", "")) = False And InList(mskDrAmt.Text, Array("0", "0.00", "")) = False Then
    mskDrAmt.Text = "0.00"
End If

End Sub

Private Sub mskCrAmt_GotFocus()
If InList(mLastKeyPressed, Array(vbKeyReturn, vbKeyTab)) = True _
    And txtDrCrFlag.Text = "Dr" And Val(UnMyNumFmt(mskDrAmt.Text)) <> 0 Then
    SendKeys "{tab}"
Else
    FlashActiveControl mskCrAmt, True
End If

End Sub

Private Sub mskCrAmt_LostFocus()
FlashActiveControl mskCrAmt, False
End Sub

Private Sub mskCrAmt_Validate(Cancel As Boolean)
mskCrAmt.Text = ToMyNumFmt(mskCrAmt.Text, , True)

Call ValidDtl
End Sub

Private Sub mskDrAmt_Change()
If InList(mskDrAmt.Text, Array("0", "0.00", "")) = False And InList(mskCrAmt.Text, Array("0", "0.00", "")) = False Then
    mskCrAmt.Text = "0.00"
End If

End Sub

Private Sub mskDrAmt_GotFocus()
If InList(mLastKeyPressed, Array(vbKeyReturn, vbKeyTab)) = True _
    And txtDrCrFlag.Text = "Cr" Then
    mskCrAmt.SetFocus
Else
    FlashActiveControl mskDrAmt, True
End If

End Sub

Private Sub mskDrAmt_LostFocus()
FlashActiveControl mskDrAmt, False
End Sub

Private Sub mskDrAmt_Validate(Cancel As Boolean)
mskDrAmt.Text = ToMyNumFmt(mskDrAmt.Text, , True)

Call ValidDtl
End Sub

Private Sub optAccountwise_GotFocus()
FlashActiveControl optAccountwise, True
End Sub

Private Sub optAccountwise_LostFocus()
FlashActiveControl optAccountwise, False
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

Private Sub optMonthwise_GotFocus()
FlashActiveControl optMonthwise, True
End Sub

Private Sub optMonthwise_LostFocus()
FlashActiveControl optMonthwise, False
End Sub

Private Sub txtAhName_Change()
If fcmbAhName.CallFromText_Change = False Then
    fcmbAhName.CallFromText_Change = True
    If InterActiveChange(txtAhName) = True And dtlAddEditMode = True Then
        fcmbAhName.UserText = Array(txtAhName.Text, txtAhName.SelStart)
        fcmbAhName.Show
        txtAhName.Text = fcmbAhName.Text
        If fcmbAhName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbAhName.CallFromText_Change = False
End If

End Sub

Private Sub txtAhName_GotFocus()
FlashActiveControl txtAhName, True
End Sub

Private Sub txtAhName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtAhName_Change
End If

End Sub

Private Sub txtAhName_LostFocus()
FlashActiveControl txtAhName, False
End Sub

Private Sub txtAhname_Validate(Cancel As Boolean)
If Val(fcmbAhName.BoundText) <= 0 Then
    AlertBox "Invalid Account Head Name !!!"
    txtAhName.SetFocus
    Cancel = True
End If
Call ValidDtl

End Sub

Private Sub txtDrCrFlag_Change()
If dtlAddEditMode = True Then
    txtDrCrFlag.Text = ToDrCrFlag(txtDrCrFlag.Text)
    Call SelectText(txtDrCrFlag)
End If
End Sub

Private Sub txtDrCrFlag_GotFocus()
FlashActiveControl txtDrCrFlag, True
End Sub

Private Sub txtDrCrFlag_LostFocus()
FlashActiveControl txtDrCrFlag, False
End Sub

Private Sub txtDrCrFlag_Validate(Cancel As Boolean)
txtDrCrFlag.Text = ToDrCrFlag(txtDrCrFlag.Text)
If txtDrCrFlag.Text = "Dr" And Val(UnMyNumFmt(mskCrAmt.Text)) <> 0 Then
    mskDrAmt.Text = mskCrAmt.Text
    mskCrAmt.Text = "0.00"
ElseIf txtDrCrFlag.Text = "Cr" And Val(UnMyNumFmt(mskDrAmt.Text)) <> 0 Then
    mskCrAmt.Text = mskDrAmt.Text
    mskDrAmt.Text = "0.00"
End If

Call ValidDtl
End Sub

Private Sub txtJhrNarr_GotFocus()
FlashActiveControl txtJhrNarr, True
End Sub

Private Sub txtJhrNarr_LostFocus()
FlashActiveControl txtJhrNarr, False
End Sub

Private Sub txtJhrNarr_Validate(Cancel As Boolean)
txtJhrNarr.Text = ToMyWord(txtJhrNarr.Text)
End Sub

Private Sub txtJrnNarr_GotFocus()
FlashActiveControl txtJrnNarr, True
End Sub

Private Sub Data_AddEvent()

If CanUserAddOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If clsJRN.BeginJournal(0) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_ADDMODE

mJrnCode = clsJRN.ActiveJrnCode

mskFormBoundField.Text = mJrnCode
fcmbVtmName.BoundText = "": txtVtmName.Text = ""
txtJrnPrefix.Text = ""
mskJrnVchNo.Text = 0
dtpJrnDate.Text = Dtoc(DefaultEntryDate)
txtJhrNarr.Text = ""

Call ShowDtlData

mJrnDate_old = Ctod(dtpJrnDate.Text)
mJrnVtmCode_old = Val(fcmbVtmName.BoundText)
mJrnVchNo_old = Val(UnMyNumFmt(mskJrnVchNo.Text))

Call ShowEntryMode(True)
txtVtmName.SetFocus
'Call Data_CreateLog

End Sub

Private Sub Data_EditEvent()
Dim tRecset As New ADODB.Recordset

If CanUserEditOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If clsJRN.BeginJournal(datRecset.fields("JrnCode")) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_EDITMODE

mJrnCode = clsJRN.ActiveJrnCode

With tRecset
.open "Select * from JrnHdr where JhrCode=" & CStr(mJrnCode) & "", dbAcDatabase, adOpenKeyset, adLockOptimistic

mskFormBoundField.Text = CStr(.fields("JhrCode"))
fcmbVtmName.BoundText = CStr(.fields("JhrVtmCode")): txtVtmName.Text = fcmbVtmName.Text
txtJrnPrefix.Text = .fields("JhrPrefix")
mskJrnVchNo.Text = ToMyNumFmt(.fields("JhrVchNo"), mDecimals:=0)
dtpJrnDate.Text = Dtoc(.fields("JhrDate"))
txtJhrNarr.Text = .fields("JhrNarr")
End With
Call ShowDtlData

mJrnDate_old = Ctod(dtpJrnDate.Text)
mJrnVtmCode_old = Val(fcmbVtmName.BoundText)
mJrnVchNo_old = Val(UnMyNumFmt(mskJrnVchNo.Text))

Call ShowEntryMode(True)
'Call Data_CreateLog
txtVtmName.SetFocus
CloseTable tRecset

End Sub

Private Sub Data_SaveEvent()

With clsJRN
If FormAddEditMode = cFORM_ADDMODE Then
    .ClearHdr
Else
    .GetHdrData mJrnCode
End If
.mJrnVtmCode_lng = Val(fcmbVtmName.BoundText)
.mJrnPrefix_str = txtJrnPrefix.Text
.mJrnVchNo_lng = Val(UnMyNumFmt(mskJrnVchNo.Text))
.mJrnPostfix_str = ""
.mJrnDate_dt = Ctod(dtpJrnDate.Text)
.mHdrAhCode_lng = 0
.mHdrAmt_dbl = mDrCrAmtDiff
.mHdrNarr_str = txtJhrNarr.Text
.mJrnAutoGen_bln = False
.mJrnCmpCode_int = sFinYrCmpCode
If FormAddEditMode = cFORM_ADDMODE Then
    If .AddNewHdr() = True Then
        mskFormBoundField.Text = .mJrnCode_lng
        mJrnCode = .mJrnCode_lng
    End If
Else
    .UpdateHdr mJrnCode
End If
If .mJrnCode_lng > 0 Then   ' updated successfully
    .UpdateJournal mJrnCode
    .EndJournal mJrnCode
    
    mEntrySaved = True
    
Else
    Call Data_CancelEvent
    ErrorBox "Entry Cancelled !!!"
End If

End With

End Sub

Private Sub Data_DeleteEvent()
Dim mDeleteit As Boolean, mRecAbsPos As Long, mJrnVchNo As Long, mJrnDate As Date

If CanUserDeleteOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If (datRecset.EOF Or datRecset.BOF) = True Then
    Exit Sub
End If
mJrnCode = datRecset.fields("JrnCode")
mJrnDate = datRecset.fields("JrnDate")
mRecAbsPos = datRecset.AbsolutePosition

mDeleteit = True

If mDeleteit = True Then
    mDeleteit = CanDelete()
End If
txtVoid.SetFocus
If mDeleteit = True Then
    If clsJRN.BeginJournal(mJrnCode) = True Then
        clsJRN.DeleteJournal mJrnCode
        clsJRN.UpdateJournal mJrnCode
        clsJRN.EndJournal mJrnCode
        
        Call SmryList
        If datRecset.RecordCount > mRecAbsPos And mRecAbsPos > 0 Then
            datRecset.Move mRecAbsPos - 1, 1
        Else
            MoveRecToLast datRecset
        End If
        Call SmryDrCrAmtTot
    End If
    ShowRecActiveFlexRow datRecset, Mfgrd1
    Mfgrd1.SetFocus
Else
    Mfgrd1.SetFocus
End If

End Sub

Private Sub Data_CancelEvent()
clsJRN.CancelJournal mJrnCode
clsJRN.EndJournal mJrnCode

End Sub

Private Sub txtJrnNarr_LostFocus()
FlashActiveControl txtJrnNarr, False
End Sub

Private Sub SmryList()
Dim gcolcount As Integer, acount As Integer, mLow As Integer, mHigh As Integer, mPos As Integer, srow As Long, mColCount As Integer

If datRecset.State = 1 Then
    CloseTable datRecset
End If
RefreshDatabase dbAcDatabase
clsListStru.Clear

If optMonthwise.Value = True Or optDatewise.Value = True Or optAccountwise.Value = True Then
    If optMonthwise.Value = True Then
        clsListStru.AddFields mExpr:="JrnYrMonth", mAttrib:=cFAT_SYSTEM
        clsListStru.AddFields mExpr:="JrnMnYear", mTitle:="Month", mShowItem:=True, mAlign:=1, mWidth:=2000
        clsListStru.AddFields mExpr:="JrnAmt_sum", mTitle:="Amount", mShowItem:=False, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="JrnDrAmt_sum", mTitle:="Dr.Amount", mShowItem:=False, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="JrnCrAmt_sum", mTitle:="Cr.Amount", mShowItem:=False, mAlign:=7, mWidth:=1500
        
        datRecset.open "Select format(JrnDate,'yyyy/MM') as JrnYrMonth" _
         & ",Sum(JrnAmt) as JrnAmt_sum" _
         & ",Sum(iif(JrnAmt<0,JrnAmt,0)) as JrnDrAmt_sum" _
         & ",Sum(iif(JrnAmt>0,JrnAmt,0)) as JrnCrAmt_sum" _
         & " from Journal" _
         & " where JrnDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and JrnCode<>" & CStr(cOPJRNCODE) & "" _
         & IIf(Val(fcmbAhName.BoundText) > 0, " and JrnAhCode=" & CStr(Val(fcmbAhName.BoundText)), "") _
         & IIf(optShowDrTranOnly.Value = True, " and JrnAmt<0", "") _
         & IIf(optShowCrTranOnly.Value = True, " and JrnAmt>0", "") _
         & " group by format(JrnDate,'yyyy/MM')" _
         & " order by format(JrnDate,'yyyy/MM')" _
         , dbAcDatabase, adOpenKeyset, adLockReadOnly
        
    ElseIf optDatewise.Value = True Then
        clsListStru.AddFields mExpr:="JrnDateYMD", mAttrib:=cFAT_SYSTEM
        clsListStru.AddFields mExpr:="JrnDate", mTitle:="Date", mShowItem:=True, mAlign:=1, mWidth:=2000
        clsListStru.AddFields mExpr:="JrnAmt_sum", mTitle:="Amount", mShowItem:=False, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="JrnDrAmt_sum", mTitle:="Dr.Amount", mShowItem:=False, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="JrnCrAmt_sum", mTitle:="Cr.Amount", mShowItem:=False, mAlign:=7, mWidth:=1500
        
        datRecset.open "Select JrnDate" _
         & ",Sum(JrnAmt) as JrnAmt_sum" _
         & ",Sum(iif(JrnAmt<0,JrnAmt,0)) as JrnDrAmt_sum" _
         & ",Sum(iif(JrnAmt>0,JrnAmt,0)) as JrnCrAmt_sum" _
         & " from Journal" _
         & " where JrnDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and JrnCode<>" & CStr(cOPJRNCODE) & "" _
         & IIf(Val(fcmbAhName.BoundText) > 0, " and JrnAhCode=" & CStr(Val(fcmbAhName.BoundText)), "") _
         & IIf(optShowDrTranOnly.Value = True, " and JrnAmt<0", "") _
         & IIf(optShowCrTranOnly.Value = True, " and JrnAmt>0", "") _
         & " group by JrnDate" _
         & " order by JrnDate" _
         , dbAcDatabase, adOpenKeyset, adLockReadOnly
        
    ElseIf optAccountwise.Value = True Then
        clsListStru.AddFields mExpr:="JrnAhName", mTitle:="Account Name", mShowItem:=True, mAlign:=1, mWidth:=2000
        clsListStru.AddFields mExpr:="JrnAmt_sum", mTitle:="Amount", mShowItem:=False, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="JrnDrAmt_sum", mTitle:="Dr.Amount", mShowItem:=False, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="JrnCrAmt_sum", mTitle:="Cr.Amount", mShowItem:=False, mAlign:=7, mWidth:=1500
        
        datRecset.open "Select AchdMast.AhName,JrnAhCode" _
         & ",Sum(JrnAmt) as JrnAmt_sum" _
         & ",Sum(iif(JrnAmt<0,JrnAmt,0)) as JrnDrAmt_sum" _
         & ",Sum(iif(JrnAmt>0,JrnAmt,0)) as JrnCrAmt_sum" _
         & " from Journal left join AchdMast on Journal.JrnAhCode=AchdMast.AhCode" _
         & " where JrnDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and JrnCode<>" & CStr(cOPJRNCODE) & "" _
         & IIf(Val(fcmbAhName.BoundText) > 0, " and JrnAhCode=" & CStr(Val(fcmbAhName.BoundText)), "") _
         & IIf(optShowDrTranOnly.Value = True, " and JrnAmt<0", "") _
         & IIf(optShowCrTranOnly.Value = True, " and JrnAmt>0", "") _
         & " and JrnSno>0" _
         & " group by AchdMast.AhName,JrnAhCode" _
         & " order by AchdMast.AhName,JrnAhCode" _
         , dbAcDatabase, adOpenKeyset, adLockReadOnly

    End If
    If chkCombinedDrCr.Value = 1 Then
        clsListStru.UpdateField mAlias:="JrnAmt_sum", mShowItem:=True
    Else
        clsListStru.UpdateField mAlias:="JrnDrAmt_sum", mShowItem:=True
        clsListStru.UpdateField mAlias:="JrnCrAmt_sum", mShowItem:=True
    End If

ElseIf optDetailed.Value = True Or optCondensed.Value = True Then
    Rem column definitions
    clsListStru.AddFields mExpr:="JrnCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="JrnICode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="JrnSno", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="JrnAhCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="JrnRecState", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="tJrnSmryId", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="JrnDate", mTitle:="Date", mShowItem:=True, mWidth:=1250
    clsListStru.AddFields mExpr:="JrnAhName", mTitle:="Account Name", mShowItem:=True, mAlign:=1, mWidth:=4000
    clsListStru.AddFields mExpr:="JrnAmt", mTitle:="Amount", mShowItem:=False, mAlign:=7, mWidth:=1750
    clsListStru.AddFields mExpr:="JrnDrAmt", mTitle:="Dr.Amount", mShowItem:=False, mAlign:=7, mWidth:=1750
    clsListStru.AddFields mExpr:="JrnCrAmt", mTitle:="Cr.Amount", mShowItem:=False, mAlign:=7, mWidth:=1750
    clsListStru.AddFields mExpr:="JrnNarr", mTitle:="Narration", mShowItem:=False, mAlign:=1, mWidth:=2000
    
    datRecset.open "Select Journal.*,AchdMast.AhName" _
     & ",iif(JrnAmt<0,JrnAmt,0) as JrnDrAmt" _
     & ",iif(JrnAmt>0,JrnAmt,0) as JrnCrAmt" _
     & ",format(JrnDate,'yyyymmdd')+format(JrnCode,'0000000') as tJrnSmryId" _
     & " from Journal left join AchdMast on Journal.JrnAhCode=AchdMast.AhCode" _
     & " where JrnDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & IIf(mRemoteAccess = True, " and JrnCode=" & CStr(mJrnCode) & "", "") _
     & " and JrnCode<>" & CStr(cOPJRNCODE) & "" _
     & IIf(Val(fcmbAhName.BoundText) > 0, " and JrnAhCode=" & CStr(Val(fcmbAhName.BoundText)), "") _
     & IIf(optDetailed.Value = True, " and JrnSno>0", "") _
     & IIf(optCondensed.Value = True, " and JrnSno=1", "") _
     & IIf(optShowDrTranOnly.Value = True, " and JrnAmt<0", "") _
     & IIf(optShowCrTranOnly.Value = True, " and JrnAmt>0", "") _
     & " order by JrnDate,JrnCode,JrnSno" _
     , dbAcDatabase, adOpenKeyset, adLockReadOnly
    
    If chkCombinedDrCr.Value = 1 Then
        clsListStru.UpdateField mAlias:="JrnAmt", mShowItem:=True
    Else
        clsListStru.UpdateField mAlias:="JrnDrAmt", mShowItem:=True
        clsListStru.UpdateField mAlias:="JrnCrAmt", mShowItem:=True
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
        If optMonthwise.Value = True Or optDatewise.Value = True Or optAccountwise.Value = True Then
            If optMonthwise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrnYrMonth")) = .fields("JrnYrMonth")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrnMnYear")) = MonthName(Val(Right(.fields("JrnYrMonth"), 2))) & "-" & Left(.fields("JrnYrMonth"), 4)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrnAmt_sum")) = ToMyAcFmt(.fields("JrnAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrnDrAmt_sum")) = ToMyAcFmt(.fields("JrnDrAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrnCrAmt_sum")) = ToMyAcFmt(.fields("JrnCrAmt_sum"))
                
            ElseIf optDatewise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrnDateYMD")) = Format(.fields("JrnDate"), "yyyymmdd")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrnDate")) = Dtoc(.fields("JrnDate"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrnAmt_sum")) = ToMyAcFmt(.fields("JrnAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrnDrAmt_sum")) = ToMyAcFmt(.fields("JrnDrAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrnCrAmt_sum")) = ToMyAcFmt(.fields("JrnCrAmt_sum"))
                
            ElseIf optAccountwise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrnAhName")) = .fields("AhName")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrnAmt_sum")) = ToMyAcFmt(.fields("JrnAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrnDrAmt_sum")) = ToMyAcFmt(.fields("JrnDrAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrnCrAmt_sum")) = ToMyAcFmt(.fields("JrnCrAmt_sum"))
                
            End If
        
        ElseIf optDetailed.Value = True Or optCondensed.Value = True Then
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrnCode")) = .fields("JrnCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrnICode")) = .fields("JrnICode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrnSno")) = .fields("JrnSno")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrnAhCode")) = .fields("JrnAhCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrnRecState")) = .fields("JrnRecState")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("tJrnSmryId")) = Format(.fields("JrnDate"), "yyyymmdd") & Format(.fields("JrnCode"), "0000000")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrnDate")) = Dtoc(.fields("JrnDate"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrnAhName")) = .fields("AhName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrnAmt")) = ToMyAcFmt(.fields("JrnAmt"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrnDrAmt")) = ToMyAcFmt(.fields("JrnDrAmt"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrnCrAmt")) = ToMyAcFmt(.fields("JrnCrAmt"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("JrnNarr")) = .fields("JrnNarr")
            
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

Call SmryDrCrAmtTot

SetFlexColCursor txtList1Col, Mfgrd1

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

Private Sub txtJrnNarr_Validate(Cancel As Boolean)
txtJrnNarr.Text = ToMyWord(txtJrnNarr.Text)
End Sub

Private Sub txtQryAhname_Change()
If fcmbAhName.CallFromText_Change = False Then
    fcmbAhName.CallFromText_Change = True
    If InterActiveChange(txtQryAhname) = True Then
        fcmbAhName.UserText = Array(txtQryAhname.Text, txtQryAhname.SelStart)
        fcmbAhName.Show
        txtQryAhname.Text = fcmbAhName.Text
        If fcmbAhName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbAhName.CallFromText_Change = False
End If

End Sub

Private Sub txtQryAhname_GotFocus()
FlashActiveControl txtQryAhname, True
End Sub

Private Sub txtQryAhname_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtQryAhname_Change
End If

End Sub

Private Sub txtQryAhname_LostFocus()
FlashActiveControl txtQryAhname, False
End Sub

Private Sub SmryDrCrAmtTot()
Dim aBal As Variant
Dim mOpnDrAmtTot As Double, mOpnCrAmtTot As Double, mOpnNetBal As Double, mCurDrAmtTot As Double, mCurCrAmtTot As Double, mCurNetBal As Double, mTrDrAmtTot As Double, mTrCrAmtTot As Double, mTrNetBal As Double
Dim aColRef(0 To 2, 0 To 2) As Variant, mRowPos As Integer

lblOpnDrAmtTot.Caption = ToMyAcFmt(0)
lblOpnCrAmtTot.Caption = ToMyAcFmt(0)
lblOpnNetBal.Caption = ToMyAcFmt(0)

lblTrDrAmtTot.Caption = ToMyAcFmt(0)
lblTrCrAmtTot.Caption = ToMyAcFmt(0)
lblTrNetBal.Caption = ToMyAcFmt(0)

lblCurDrAmtTot.Caption = ToMyAcFmt(0)
lblCurCrAmtTot.Caption = ToMyAcFmt(0)
lblCurNetBal.Caption = ToMyAcFmt(0)

Rem opening balance
If Val(fcmbAhName.BoundText) > 0 Then
    aBal = clsJRN.clsAH.GetAhOpnBal(Val(fcmbAhName.BoundText), mDrCrSeperated:=False)
    mOpnNetBal = aBal(0)
    If mOpnNetBal < 0 Then
        mOpnDrAmtTot = mOpnNetBal
    Else
        mOpnCrAmtTot = mOpnNetBal
    End If
Else
    aBal = clsJRN.clsAH.GetAllAhOpnBal(mDrCrSeperated:=True)
    mOpnDrAmtTot = aBal(0)
    mOpnCrAmtTot = aBal(1)
    mOpnNetBal = mOpnDrAmtTot + mOpnCrAmtTot
End If

Rem transaction balance
mRowPos = 0: aColRef(mRowPos, 0) = IIf(optDetailed.Value = True Or optCondensed.Value = True, "JrnAmt", "JrnDrAmt_sum"): aColRef(mRowPos, 1) = cDR_FLAG: aColRef(mRowPos, 2) = 0
mRowPos = 1: aColRef(mRowPos, 0) = IIf(optDetailed.Value = True Or optCondensed.Value = True, "JrnAmt", "JrnCrAmt_sum"): aColRef(mRowPos, 1) = cCR_FLAG: aColRef(mRowPos, 2) = 0
mRowPos = 2: aColRef(mRowPos, 0) = IIf(optDetailed.Value = True Or optCondensed.Value = True, "JrnAmt", "JrnAmt_sum"): aColRef(mRowPos, 1) = "": aColRef(mRowPos, 2) = 0

RecsetMColSum datRecset, aColRef

mTrDrAmtTot = aColRef(0, 2)
mTrCrAmtTot = aColRef(1, 2)
mTrNetBal = aColRef(2, 2)

Rem current balance
mCurDrAmtTot = mOpnDrAmtTot + mTrDrAmtTot
mCurCrAmtTot = mOpnCrAmtTot + mTrCrAmtTot
mCurNetBal = mOpnNetBal + mTrNetBal

Rem showing balances
lblOpnDrAmtTot.Caption = ToMyAcFmt(mOpnDrAmtTot)
lblOpnCrAmtTot.Caption = ToMyAcFmt(mOpnCrAmtTot)
lblOpnNetBal.Caption = ToMyAcFmt(mOpnNetBal)

lblTrDrAmtTot.Caption = ToMyAcFmt(mTrDrAmtTot)
lblTrCrAmtTot.Caption = ToMyAcFmt(mTrCrAmtTot)
lblTrNetBal.Caption = ToMyAcFmt(mTrNetBal)

lblCurDrAmtTot.Caption = ToMyAcFmt(mCurDrAmtTot)
lblCurCrAmtTot.Caption = ToMyAcFmt(mCurCrAmtTot)
lblCurNetBal.Caption = ToMyAcFmt(mCurNetBal)

'frBottomTotal.Left = (dgList.Columns(dgList.Columns.Count - 1).Left + dgList.Columns(dgList.Columns.Count - 1).Width - frBottomTotal.Width)
Erase aColRef

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
        Rem datRecset.Find "tJrnSmryId='" & Format(Ctod(dtpJrnDate.Text), "yyyymmdd") + Format(mJrnCode, "0000000") & "'", Start:=1
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("tJrnSmryId"), mText
    ElseIf optMonthwise.Value = True Then
        Rem datRecset.Find "JrnYrMonth='" & CStr(Year(Ctod(dtpJrnDate.Text))) & "-" & CStr(Month(Ctod(dtpJrnDate.Text))) & "'", Start:=1
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("JrnYrMonth"), mText
    ElseIf optDatewise.Value = True Then
        Rem datRecset.Find "JrnDate=#" & CStr(ToSysDate(Ctod(dtpJrnDate.Text))) & "#", Start:=1
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("JrnDateYMD"), mText
    ElseIf optAccountwise.Value = True Then
        Rem datRecset.Find "JrnAhName='" & Mfgrd2.TextMatrix(1, X2AHNAME_COL) & "'", Start:=1
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("JrnAhName"), mText
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
Dim mJrnVchNo As Long

If Val(fcmbVtmName.BoundText) <= 0 Then
    ErrorBox "Invalid Selection !!!"
    txtVtmName.SetFocus
    Cancel = True
Else
    If Val(fcmbVtmName.BoundText) <> mJrnVtmCode_old Or Ctod(dtpJrnDate.Text) <> mJrnDate_old Then
        mJrnVchNo = GetNextVTypeNo(dbAcDatabase, dbAcDatabase, dbComDatabase, mTableName:="JrnHdr", mFieldName:="JhrVchNo", mVtmFieldName:="JhrVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="JhrCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="JhrDate", mDateFieldValue:=Ctod(dtpJrnDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormAcsPermFileName)
        mskJrnVchNo.Text = ToMyNumFmt(mJrnVchNo, mDecimals:=0)
    End If
End If

End Sub

