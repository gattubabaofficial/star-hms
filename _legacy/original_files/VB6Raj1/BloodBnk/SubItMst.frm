VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmSubItemMast 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   ClientHeight    =   8220
   ClientLeft      =   60
   ClientTop       =   60
   ClientWidth     =   13890
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
   ScaleHeight     =   8220
   ScaleWidth      =   13890
   ShowInTaskbar   =   0   'False
   Begin VB.Frame frFormDtl 
      Appearance      =   0  'Flat
      BackColor       =   &H00D9D177&
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
      Height          =   5415
      Left            =   240
      TabIndex        =   15
      Top             =   1080
      Width           =   10935
      Begin VB.TextBox mskSimMRPRate 
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
         Left            =   5040
         TabIndex        =   6
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   2640
         Width           =   1695
      End
      Begin VB.TextBox mskSimSaleRate 
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
         Left            =   8040
         TabIndex        =   7
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   2640
         Width           =   1695
      End
      Begin VB.TextBox mskSimPurchRate 
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
         Left            =   2400
         TabIndex        =   5
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   2640
         Width           =   1695
      End
      Begin VB.TextBox txtSigName 
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
         Left            =   2400
         MaxLength       =   50
         TabIndex        =   4
         Top             =   1920
         Width           =   4575
      End
      Begin VB.TextBox txtSimDesc 
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
         Left            =   2400
         MaxLength       =   50
         TabIndex        =   3
         Top             =   1440
         Width           =   5295
      End
      Begin VB.TextBox mskSimItmCode 
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
         Left            =   3840
         TabIndex        =   1
         Tag             =   "AhCode"
         Text            =   "-1"
         Top             =   480
         Width           =   1335
      End
      Begin VB.TextBox mskSimOpValue 
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
         Left            =   8040
         TabIndex        =   10
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   3240
         Visible         =   0   'False
         Width           =   1695
      End
      Begin VB.TextBox mskSimOpRate 
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
         Left            =   5040
         TabIndex        =   9
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   3240
         Visible         =   0   'False
         Width           =   1695
      End
      Begin VB.TextBox mskSimOpQty 
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
         Left            =   2400
         TabIndex        =   8
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   3240
         Visible         =   0   'False
         Width           =   1695
      End
      Begin VB.CommandButton cmdSaveForm 
         Appearance      =   0  'Flat
         BackColor       =   &H80000009&
         Caption         =   "      &Save"
         Height          =   375
         Left            =   10560
         Style           =   1  'Graphical
         TabIndex        =   11
         Top             =   5040
         Width           =   375
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
         Left            =   2400
         MaxLength       =   50
         TabIndex        =   2
         Top             =   960
         Width           =   5295
      End
      Begin VB.TextBox mskFormBoundField 
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
         Left            =   2400
         TabIndex        =   0
         Tag             =   "AhCode"
         Text            =   "-1"
         Top             =   480
         Width           =   1335
      End
      Begin VB.Line Line3 
         Index           =   2
         X1              =   0
         X2              =   10920
         Y1              =   3120
         Y2              =   3120
      End
      Begin VB.Line Line3 
         Index           =   0
         X1              =   0
         X2              =   10920
         Y1              =   2400
         Y2              =   2400
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "MRP:"
         BeginProperty Font 
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
         Left            =   4440
         TabIndex        =   45
         Top             =   2640
         Width           =   495
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Sale Rate:"
         BeginProperty Font 
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
         Left            =   6960
         TabIndex        =   44
         Top             =   2640
         Width           =   975
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Purch.Rate:"
         BeginProperty Font 
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
         Left            =   840
         TabIndex        =   43
         Top             =   2640
         Width           =   1575
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Group Name:"
         BeginProperty Font 
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
         Left            =   840
         TabIndex        =   42
         Top             =   1920
         Width           =   1335
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Description:"
         BeginProperty Font 
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
         Left            =   840
         TabIndex        =   41
         Top             =   1440
         Width           =   1335
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Amount:"
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
         Height          =   255
         Index           =   6
         Left            =   6960
         TabIndex        =   34
         Top             =   3720
         Width           =   735
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Rate:"
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
         Height          =   255
         Index           =   5
         Left            =   4440
         TabIndex        =   33
         Top             =   3720
         Width           =   495
      End
      Begin VB.Label lblSimCurValue 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
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
         Left            =   8040
         TabIndex        =   32
         Top             =   3720
         Width           =   1695
      End
      Begin VB.Label lblSimCurRate 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
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
         Left            =   5040
         TabIndex        =   31
         Top             =   3720
         Width           =   1695
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Amount:"
         BeginProperty Font 
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
         Left            =   6960
         TabIndex        =   30
         Top             =   3240
         Visible         =   0   'False
         Width           =   855
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Rate:"
         BeginProperty Font 
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
         Left            =   4440
         TabIndex        =   29
         Top             =   3240
         Visible         =   0   'False
         Width           =   495
      End
      Begin VB.Label lblSimCurQty 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
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
         Left            =   2400
         TabIndex        =   28
         Top             =   3720
         Width           =   1695
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Current Qty:"
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
         Height          =   255
         Index           =   2
         Left            =   840
         TabIndex        =   27
         Top             =   3720
         Width           =   1455
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Opening Qty:"
         BeginProperty Font 
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
         Left            =   840
         TabIndex        =   26
         Top             =   3240
         Visible         =   0   'False
         Width           =   1455
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Item Name:"
         BeginProperty Font 
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
         Left            =   840
         TabIndex        =   18
         Top             =   960
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
         Left            =   840
         TabIndex        =   17
         Top             =   480
         Width           =   855
      End
   End
   Begin VB.TextBox txtVoid 
      CausesValidation=   0   'False
      Height          =   375
      Left            =   120
      TabIndex        =   12
      TabStop         =   0   'False
      Text            =   "Text1"
      Top             =   7920
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
      MaskColor       =   &H00E0E0E0&
      TabIndex        =   20
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
      TabIndex        =   19
      TabStop         =   0   'False
      Top             =   0
      Width           =   255
   End
   Begin VB.ComboBox cmbFormEntryMode 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   315
      ItemData        =   "SubItMst.frx":0000
      Left            =   0
      List            =   "SubItMst.frx":000D
      Style           =   1  'Simple Combo
      TabIndex        =   16
      TabStop         =   0   'False
      Text            =   "cmbFormMode"
      Top             =   360
      Width           =   1455
   End
   Begin VB.Frame frFormSmry 
      Appearance      =   0  'Flat
      BackColor       =   &H00D9D177&
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
      Height          =   6975
      Left            =   240
      TabIndex        =   14
      Top             =   840
      Width           =   13215
      Begin VB.Frame frConfigure 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   4095
         Left            =   3720
         TabIndex        =   35
         Top             =   720
         Width           =   6015
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
            Left            =   2400
            TabIndex        =   25
            Top             =   3240
            Width           =   855
         End
         Begin VB.CheckBox chkCurBal 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Current Balance"
            BeginProperty Font 
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
            Left            =   1200
            TabIndex        =   24
            Top             =   2520
            Value           =   1  'Checked
            Width           =   3375
         End
         Begin VB.CheckBox chkOpBal 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Opening Balance"
            BeginProperty Font 
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
            Left            =   1200
            TabIndex        =   23
            Top             =   2040
            Value           =   1  'Checked
            Width           =   3375
         End
         Begin VB.CheckBox chkCombinedOpBal 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Combined Opening Balance"
            BeginProperty Font 
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
            Left            =   1200
            TabIndex        =   21
            Top             =   1080
            Value           =   1  'Checked
            Width           =   3375
         End
         Begin VB.CheckBox chkCombinedCurBal 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Combined Current Balance"
            BeginProperty Font 
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
            Left            =   1200
            TabIndex        =   22
            Top             =   1560
            Value           =   1  'Checked
            Width           =   3375
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
            Index           =   7
            Left            =   0
            TabIndex        =   36
            Top             =   0
            Width           =   6015
         End
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
         TabIndex        =   37
         Top             =   360
         Width           =   4695
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
         TabIndex        =   39
         TabStop         =   0   'False
         Top             =   1680
         Width           =   1335
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd1 
         Height          =   5970
         Left            =   225
         TabIndex        =   38
         Top             =   780
         Width           =   12465
         _ExtentX        =   21987
         _ExtentY        =   10530
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
         Index           =   1
         Left            =   240
         TabIndex        =   40
         Top             =   360
         Width           =   735
      End
   End
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Item Master"
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
      TabIndex        =   13
      Top             =   0
      Width           =   9015
   End
End
Attribute VB_Name = "frmSubItemMast"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim FormLoaded As Boolean, mLastKeyPressed As Integer, mMaskKeyPressed As Integer
Dim mSimCode As Long, mSimItmCode As Long
Dim mRemoteAccess As Boolean, mEntrySaved As Boolean, mEntryAborted As Boolean
Dim dbMdsDatabase As New ADODB.Connection, dbHmsDatabase As New ADODB.Connection, dbStDatabase As New ADODB.Connection, dbGrpDatabase As New ADODB.Connection, datRecset As New ADODB.Recordset
Dim mSimName_old As String, mSimMRPRate_old As Double
Dim clsSIM As clsHmsMasterEntry, clsSIG As clsHmsMasterEntry, clsIT As clsProduct, mActiveControl As Object, clsListStru As clsSelectQueryStructure
Dim fcmbSigName As clsHmsFlexSearch

Private Type SmryPara
mCombinedOpBal As Integer
mCombinedCurBal As Integer
mOpBal As Integer
mCurBal As Integer
mRowIndex() As Variant

End Type

Dim OldSmryPara As SmryPara

Private Sub RestoreOldSmryPara()
chkCombinedOpBal.Value = OldSmryPara.mCombinedOpBal
chkCombinedCurBal.Value = OldSmryPara.mCombinedCurBal
chkOpBal.Value = OldSmryPara.mOpBal
chkCurBal.Value = OldSmryPara.mCurBal

End Sub

Private Sub RestoreDefaultSmryPara()
chkCombinedOpBal.Value = 1
chkCombinedCurBal.Value = 1
chkOpBal.Value = 1
chkCurBal.Value = 1

End Sub

Private Sub SaveSmryPara()
OldSmryPara.mCombinedOpBal = chkCombinedOpBal.Value
OldSmryPara.mCombinedCurBal = chkCombinedCurBal.Value
OldSmryPara.mOpBal = chkOpBal.Value
OldSmryPara.mCurBal = chkCurBal.Value

End Sub

Public Property Let RemoteAccessCode(ByVal mAccessCode As Long)
mRemoteAccess = True
mSimCode = mAccessCode
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

Public Property Get SimName() As String
SimName = txtSimName.Text
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

Private Sub chkCombinedCurBal_GotFocus()
FlashActiveControl chkCombinedCurBal, True
End Sub

Private Sub chkCombinedCurBal_LostFocus()
FlashActiveControl chkCombinedCurBal, False
End Sub

Private Sub chkCombinedOpBal_GotFocus()
FlashActiveControl chkCombinedOpBal, True
End Sub

Private Sub chkCombinedOpBal_LostFocus()
FlashActiveControl chkCombinedOpBal, False
End Sub

Private Sub chkCurBal_GotFocus()
FlashActiveControl chkCurBal, True
End Sub

Private Sub chkCurBal_LostFocus()
FlashActiveControl chkCurBal, False
End Sub

Private Sub chkOpBal_GotFocus()
FlashActiveControl chkOpBal, True
End Sub

Private Sub chkOpBal_LostFocus()
FlashActiveControl chkOpBal, False
End Sub

Private Sub cmdConfigure_Click()
Call SaveSmryPara

Call SmryList
MoveRecToLast datRecset
txtVoid.SetFocus
Mfgrd1.Enabled = True
frConfigure.Visible = False
Mfgrd1.SetFocus
End Sub

Private Sub cmdFormEnter_Click()

mLastKeyPressed = 13
If FormAddEditMode = cFORM_SMRYMODE And frConfigure.Visible = False Then
    With datRecset
    If .EOF = False And .BOF = False Then
        Call Data_EditEvent
    Else
        Call Data_AddEvent
    End If
    End With
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
    Call RestoreOldSmryPara

ElseIf FormAddEditMode = cFORM_SMRYMODE Then
    If Len(txtSearch1Text.Text) > 0 Then
        txtSearch1Text.Text = ""
        Call txtSearch1Text_InterActiveChange
    Else
        Unload Me
    End If
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
        txtSimName.SetFocus
    End If
End If

End Sub

Private Sub cmdSaveForm_Click()
Call Data_SaveEvent

Call SmryList
txtSearch1Text_InterActiveChange txtSimName.Text

''If txtSearch1Text.Text <> txtSimName.Text Then
''    txtSearch1Text.Text = txtSimName.Text
''Else
''    Call txtSearch1Text_Change
''End If
''datRecset.Find "SimName='" & txtSimName.Text & "'", Start:=1
''ShowRecActiveFlexRow datRecset, Mfgrd1

ShowEntryMode False
Mfgrd1.SetFocus

End Sub

Private Sub cmdSaveForm_GotFocus()
txtVoid.SetFocus
cmdSaveForm.Enabled = False
If Data_Verify() = True Then
    If CanAccept() = True Then
        Call cmdSaveForm_Click
        If mRemoteAccess = True Then
            Me.Hide
            Exit Sub
        End If
    Else
        txtSimName.SetFocus
    End If
End If
cmdSaveForm.Enabled = True

End Sub

Private Sub Form_Activate()
If FormLoaded = False Then
    If mRemoteAccess = True Then
        If mSimCode = 0 Then
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

End If

FormLoaded = True
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
mLastKeyPressed = KeyCode
mMaskKeyPressed = Shift
''If ActiveControl.Name = Mfgrd1.Name Then
''    If InList(KeyCode, Array(vbKeyDown, vbKeyUp, vbKeyPageDown, vbKeyPageUp)) = True And Shift = 0 Then
''        Mfgrd1_KeyDown KeyCode, Shift
''        KeyCode = 0
''    End If
''End If

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
FormLoaded = False
mEntrySaved = False: mEntryAborted = False
SetFormSize Me, frmMain
Call Form_Resize

Call SetVoidControl(txtVoid)
mskSimOpValue.Enabled = False
frConfigure.Visible = False
txtSearch1Text.Enabled = False

Call RestoreDefaultSmryPara
Call SaveSmryPara

OpenHmsDataSource dbHmsDatabase
OpenMdsDataSource dbMdsDatabase
OpenStDataSource dbStDatabase
OpenGrpDataSource dbGrpDatabase

Set clsIT = New clsProduct
Set clsIT.dbStDatabase = dbStDatabase
Set clsIT.dbGrpDatabase = dbGrpDatabase

Set clsSIM = New clsHmsMasterEntry
Set clsSIM.dbHmsDatabase = dbHmsDatabase
clsSIM.blnSubItmMast = True
clsSIM.Init

Set clsSIG = New clsHmsMasterEntry
Set clsSIG.dbHmsDatabase = dbHmsDatabase
clsSIG.blnSubItmGrpMast = True
clsSIG.Init

Set fcmbSigName = New clsHmsFlexSearch
Set fcmbSigName.dbHmsDatabase = dbHmsDatabase
fcmbSigName.blnSubItmGrpMastList = True
fcmbSigName.Init

Set clsListStru = New clsSelectQueryStructure

datRecset.open "Select * from SubItmMast" _
    & " inner join SubItmGrpMst on SubItmMast.SimSigCode = SubItmGrpMst.SigCode" _
    & " order by SimName" _
    , dbHmsDatabase, adOpenKeyset, adLockOptimistic
Call SmryList

Call ShowEntryMode(False)

End Sub

Private Sub Form_Resize()
lblFormHeading.Width = Me.Width
cmdFormEscape.Left = Me.Width - (cmdFormEscape.Width * 2)
cmdFormEnter.Left = Me.Width + cmdFormEscape.Width
frFormSmry.Left = (Me.Width - frFormSmry.Width) / 2: frFormSmry.Top = cmbFormEntryMode.Top + (cmbFormEntryMode.Height * 2)
frFormDtl.Left = (Me.Width - frFormDtl.Width) / 2: frFormDtl.Top = frFormSmry.Top

End Sub

Private Sub Form_Unload(Cancel As Integer)
Set clsIT = Nothing
Set clsSIM = Nothing
Set clsSIG = Nothing
Set fcmbSigName = Nothing
Set clsListStru = Nothing

CloseTable datRecset
CloseDataSource dbHmsDatabase
CloseDataSource dbMdsDatabase
CloseDataSource dbStDatabase
CloseDataSource dbGrpDatabase
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
Data_Verify = False
If Val(mskFormBoundField.Text) < 1 And FormAddEditMode = cFORM_EDITMODE Then
    ErrorBox "Invalid Key Value !!!"
    txtSimName.SetFocus
    Exit Function
End If
If Trim(txtSimName.Text) = "" Then
    ErrorBox "Invalid Item Name !!!"
    txtSimName.SetFocus
    Exit Function
End If
If Val(fcmbSigName.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    txtSigName.SetFocus
    Exit Function
End If
If Val(UnMyNumFmt(mskSimPurchRate.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskSimPurchRate.SetFocus
    Exit Function
End If
If Val(UnMyNumFmt(mskSimMRPRate.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskSimMRPRate.SetFocus
    Exit Function
End If
If Val(UnMyNumFmt(mskSimSaleRate.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskSimSaleRate.SetFocus
    Exit Function
End If

If txtSimName.Text <> mSimName_old Then
    If ChkIsDuplicate(dbHmsDatabase, "SubItmMast", "SimName", txtSimName.Text, "SimCode", Val(mskFormBoundField.Text)) = True Then
        ErrorBox "Duplicate Input !!!"
        txtSimName.SetFocus
        Exit Function
    ElseIf ChkIsDuplicate(dbStDatabase, "ProdMast", "ItmName", txtSimName.Text, "ItmCode", Val(mskSimItmCode.Text)) = True Then
        ErrorBox "Duplicate Input !!!"
        txtSimName.SetFocus
        Exit Function
    End If
End If

Data_Verify = True
End Function

Private Sub mskSimMRPRate_GotFocus()
FlashActiveControl mskSimMRPRate, True
End Sub

Private Sub mskSimMRPRate_LostFocus()
FlashActiveControl mskSimMRPRate, False
End Sub

Private Sub mskSimMRPRate_Validate(Cancel As Boolean)
mskSimMRPRate.Text = ToMyNumFmt(mskSimMRPRate.Text, mUseAbs:=True)
If Val(UnMyNumFmt(mskSimMRPRate.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskSimMRPRate.SetFocus
    Cancel = True
Else
    If FormAddEditMode = cFORM_ADDMODE Or Val(UnMyNumFmt(mskSimMRPRate.Text)) <> mSimMRPRate_old Then
        mskSimSaleRate.Text = mskSimMRPRate.Text
    End If
End If

End Sub

Private Sub mskSimOpQty_GotFocus()
FlashActiveControl mskSimOpQty, True
End Sub

Private Sub mskSimOpQty_LostFocus()
FlashActiveControl mskSimOpQty, False
End Sub

Private Sub mskSimOpQty_Validate(Cancel As Boolean)
mskSimOpQty.Text = ToMyStqFmt(UnMyStqFmt(mskSimOpQty.Text))
Call Calc_Value
End Sub

Private Sub mskSimOpRate_GotFocus()
FlashActiveControl mskSimOpRate, True
End Sub

Private Sub mskSimOpRate_LostFocus()
FlashActiveControl mskSimOpRate, False
End Sub

Private Sub mskSimOpRate_Validate(Cancel As Boolean)
mskSimOpRate.Text = ToMyNumFmt(mskSimOpRate.Text, , True)
Call Calc_Value
End Sub

Private Sub mskSimOpValue_GotFocus()
FlashActiveControl mskSimOpValue, True
End Sub

Private Sub mskSimOpValue_LostFocus()
FlashActiveControl mskSimOpValue, False
End Sub

Private Sub mskSimOpValue_Validate(Cancel As Boolean)
mskSimOpValue.Text = ToMyNumFmt(mskSimOpValue.Text)
End Sub

Private Sub mskSimPurchRate_GotFocus()
FlashActiveControl mskSimPurchRate, True
End Sub

Private Sub mskSimPurchRate_LostFocus()
FlashActiveControl mskSimPurchRate, False
End Sub

Private Sub mskSimPurchRate_Validate(Cancel As Boolean)
mskSimPurchRate.Text = ToMyNumFmt(mskSimPurchRate.Text, mUseAbs:=True)
If Val(UnMyNumFmt(mskSimPurchRate.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskSimPurchRate.SetFocus
    Cancel = True
End If

End Sub

Private Sub mskSimSaleRate_GotFocus()
FlashActiveControl mskSimSaleRate, True
End Sub

Private Sub mskSimSaleRate_LostFocus()
FlashActiveControl mskSimSaleRate, False
End Sub

Private Sub mskSimSaleRate_Validate(Cancel As Boolean)
mskSimSaleRate.Text = ToMyNumFmt(mskSimSaleRate.Text, mUseAbs:=True)
If Val(UnMyNumFmt(mskSimSaleRate.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskSimSaleRate.SetFocus
    Cancel = True
End If

End Sub

Private Sub txtSigName_Change()
If fcmbSigName.CallFromText_Change = False Then
    fcmbSigName.CallFromText_Change = True
    If InterActiveChange(txtSigName) = True Then
        fcmbSigName.UserText = Array(txtSigName.Text, txtSigName.SelStart)
        fcmbSigName.Show
        txtSigName.Text = fcmbSigName.Text
        If fcmbSigName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbSigName.CallFromText_Change = False
End If

End Sub

Private Sub txtSigName_GotFocus()
FlashActiveControl txtSigName, True
End Sub

Private Sub txtSigName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtSigName_Change
End If
End Sub

Private Sub txtSigName_LostFocus()
FlashActiveControl txtSigName, False
End Sub

Private Sub txtSigName_Validate(Cancel As Boolean)
If Val(fcmbSigName.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    txtSigName.SetFocus
    Cancel = True
End If

End Sub

Private Sub txtSimDesc_GotFocus()
FlashActiveControl txtSimDesc, True
End Sub

Private Sub txtSimDesc_LostFocus()
FlashActiveControl txtSimDesc, False
End Sub

Private Sub txtSimDesc_Validate(Cancel As Boolean)
txtSimDesc.Text = ToMyWord(txtSimDesc.Text)
If txtSimDesc.Text = "" Then
    txtSimDesc.Text = txtSimName.Text
End If

End Sub

Private Sub txtSimName_GotFocus()
FlashActiveControl txtSimName, True
End Sub

Private Sub txtSimName_LostFocus()
FlashActiveControl txtSimName, False
End Sub

Private Sub txtSimName_Validate(Cancel As Boolean)
txtSimName.Text = ToMyWord(txtSimName.Text)
If Trim(txtSimName.Text) = "" Then
    ErrorBox "Invalid Input !!!"
    Cancel = True
    txtSimName.SetFocus
Else
    If txtSimName.Text <> mSimName_old Then
        If ChkIsDuplicate(dbHmsDatabase, "SubItmMast", "SimName", txtSimName.Text, "SimCode", Val(mskFormBoundField.Text)) = True Then
            ErrorBox "Duplicate Input !!!"
            Cancel = True
            txtSimName.SetFocus
        ElseIf ChkIsDuplicate(dbStDatabase, "ProdMast", "ItmName", txtSimName.Text, "ItmCode", Val(mskSimItmCode.Text)) = True Then
            ErrorBox "Duplicate Input !!!"
            Cancel = True
            txtSimName.SetFocus
        End If
    End If
End If
If Cancel = False Then
    If txtSimDesc.Text = "" Then
        txtSimDesc.Text = txtSimName.Text
    End If
End If

End Sub

Private Sub Data_AddEvent()

If CanUserAddOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If clsSIM.BeginMast(0) = False Then
    Exit Sub
ElseIf clsIT.BeginItem(0) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_ADDMODE

clsIT.Clear
clsSIM.Clear
mSimCode = clsSIM.ActiveCode
mSimItmCode = clsIT.ActiveItmCode

mskFormBoundField.Text = mSimCode
mskSimItmCode.Text = mSimItmCode
txtSimName.Text = ""
txtSimDesc.Text = ""
txtSigName.Text = "": fcmbSigName.BoundText = ""
mskSimPurchRate.Text = ToMyNumFmt(0)
mskSimMRPRate.Text = ToMyNumFmt(0)
mskSimSaleRate.Text = ToMyNumFmt(0)
mskSimOpQty.Text = ToMyStqFmt(0)
mskSimOpRate.Text = ToMyNumFmt(0)
mskSimOpValue.Text = ToMyStvFmt(0)
lblSimCurQty.Caption = ToMyStqFmt(0)
lblSimCurRate.Caption = ToMyNumFmt(0)
lblSimCurValue.Caption = ToMyStvFmt(0)

mSimName_old = txtSimName.Text
mSimMRPRate_old = Val(UnMyNumFmt(mskSimMRPRate.Text))

Call ShowEntryMode(True)
txtSimName.SetFocus

End Sub

Private Sub Data_EditEvent()
Dim mLCount As Integer, mUCount As Integer, mCount As Integer, mOpnQty As Double, mOpnAvgRate As Double, mOpnValue As Double, mCurQty As Double, mCurAvgRate As Double, mCurValue As Double

If CanUserEditOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If clsSIM.BeginMast(datRecset.fields("SimCode")) = False Then
    Exit Sub
ElseIf clsIT.BeginItem(datRecset.fields("SimItmCode")) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_EDITMODE
With datRecset
mSimCode = .fields("SimCode")
mSimItmCode = .fields("SimItmCode")

clsSIM.GetData mSimCode
clsIT.GetData mSimItmCode

mskFormBoundField.Text = CStr(mSimCode)
mskSimItmCode.Text = CStr(mSimItmCode)

txtSimName.Text = .fields("SimName")
txtSimDesc.Text = .fields("SimDesc")
fcmbSigName.BoundText = CStr(.fields("SimSigCode")): txtSigName.Text = fcmbSigName.Text
mskSimPurchRate.Text = ToMyNumFmt(.fields("SimPurchRate"))
mskSimMRPRate.Text = ToMyNumFmt(.fields("SimMRPRate"))
mskSimSaleRate.Text = ToMyNumFmt(.fields("SimSaleRate"))
End With

mOpnQty = 0: mOpnAvgRate = 0: mOpnValue = 0
With clsIT
Rem opn stock
mLCount = .LOpnStock
mUCount = .UOpnStock
For mCount = mLCount To mUCount
    mOpnQty = mOpnQty + .OpnQty(mCount)
    mOpnValue = mOpnValue + .OpnValue(mCount)
Next mCount

Rem current stock
mLCount = .LCurStock
mUCount = .UCurStock
For mCount = mLCount To mUCount
    mCurQty = mCurQty + .CurQty(mCount)
    mCurValue = mCurValue + .CurValue(mCount)
Next mCount

End With

If mOpnQty <> 0 And mOpnValue <> 0 Then
    mOpnAvgRate = mOpnValue / mOpnQty
End If
If mCurQty <> 0 And mCurValue <> 0 Then
    mCurAvgRate = mCurValue / mCurQty
End If

mskSimOpQty.Text = ToMyStqFmt(mOpnQty)
mskSimOpRate.Text = ToMyNumFmt(mOpnAvgRate)
mskSimOpValue.Text = ToMyStvFmt(mOpnValue)

lblSimCurQty.Caption = ToMyStqFmt(mCurQty)
lblSimCurRate.Caption = ToMyNumFmt(mCurAvgRate)
lblSimCurValue.Caption = ToMyStvFmt(mCurValue)

mSimName_old = txtSimName.Text
mSimMRPRate_old = Val(UnMyNumFmt(mskSimMRPRate.Text))

Call ShowEntryMode(True)
txtSimName.SetFocus

End Sub

Private Sub Data_SaveEvent()
Dim mContinueUpdate As Boolean

mContinueUpdate = True
With clsIT
If FormAddEditMode = cFORM_ADDMODE Then
    .Clear
Else
    .GetData mSimItmCode
End If

.mItmName_str = txtSimName.Text
If FormAddEditMode = cFORM_ADDMODE Then
    .AddOpnStock mStkQty:=Val(UnMyStqFmt(mskSimOpQty.Text)), mStkRate:=Val(UnMyNumFmt(mskSimOpRate.Text)), mStkValue:=Val(UnMyStvFmt(mskSimOpValue.Text))
    .AddProdRef mItrRef1Name:="Opn", mItrRef2Name:="", mItrPRate:=Val(UnMyNumFmt(mskSimOpRate.Text)), mItrMRP:=0, mItrSRate:=0
    
    If .AddNewDtl(mSimItmCode) = True Then
        If .AddNewHdr() = True Then
            mskSimItmCode.Text = .mItmCode_lng
            mSimItmCode = .mItmCode_lng
        Else
            mContinueUpdate = False
        End If
    Else
        mContinueUpdate = False
    End If
Else
    .EditOpnStock mStkICode:=.OpnICode(.LOpnStock), mStkQty:=Val(UnMyStqFmt(mskSimOpQty.Text)), mStkRate:=Val(UnMyNumFmt(mskSimOpRate.Text)), mStkValue:=Val(UnMyStvFmt(mskSimOpValue.Text))
    .EditProdRef mItrRefCode:=.ItrRefCode(.LProdRef), mItrRef1Name:=.ItrRef1Name(.LProdRef), mItrRef2Name:=.ItrRef2Name(.LProdRef), mItrPRate:=Val(UnMyNumFmt(mskSimOpRate.Text)), mItrMRP:=.ItrMRP(.LProdRef), mItrSRate:=.ItrSRate(.LProdRef)
    
    If .UpdateDtl(mSimItmCode) = True Then
        If .UpdateHdr(mSimItmCode) = True Then
            Rem none
        Else
            mContinueUpdate = False
        End If
    Else
        mContinueUpdate = False
    End If
End If

If mContinueUpdate = True Then   '''   .mItmCode_lng > 0   updated successfully
    With clsSIM
    If FormAddEditMode = cFORM_ADDMODE Then
        .Clear
        .mSimItmCode_lng = mSimItmCode
    Else
        .GetData mSimCode
    End If
    
    .mName_str = txtSimName.Text
    .mSimDesc_str = txtSimDesc.Text
    .mSimSigCode_lng = Val(fcmbSigName.BoundText)
    .mSimPurchRate_dbl = Val(UnMyNumFmt(mskSimPurchRate.Text))
    .mSimMRPRate_dbl = Val(UnMyNumFmt(mskSimMRPRate.Text))
    .mSimSaleRate_dbl = Val(UnMyNumFmt(mskSimSaleRate.Text))
    If FormAddEditMode = cFORM_ADDMODE Then
        If .AddNew() = True Then
            mskFormBoundField.Text = .mCode_lng
            mSimCode = .mCode_lng
        Else
            mContinueUpdate = False
        End If
    Else
        If .Update(mSimCode) = True Then
            Rem none
        Else
            mContinueUpdate = False
        End If
    End If
    If mContinueUpdate = True Then   ''' .mCode_lng > 0   updated successfully
        .UpdateMast mSimCode
        .EndMast mSimCode
        
        clsIT.CommitItem mSimItmCode
        clsIT.EndItem mSimItmCode
        
        If FormAddEditMode = cFORM_ADDMODE Then
            clsIT.UpdateDependency mSimItmCode, True
        End If
        
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

mSimCode = datRecset.fields("SimCode")
mSimItmCode = datRecset.fields("SimItmCode")
mRecAbsPos = datRecset.AbsolutePosition

If clsSIM.CanDeleteMast(mSimCode, mSkipConfirm:=True) = True Or clsIT.CanDeleteItem(mSimItmCode, mSkipConfirm:=True, mSkipDependency:=True) = True Then
    If CanDelete() = True Then
        If clsIT.BeginItem(mSimItmCode) = True And clsSIM.BeginMast(mSimCode) = True Then
            clsIT.DeleteItem mSimItmCode
            clsIT.CommitItem mSimItmCode
            clsIT.EndItem mSimItmCode
            
            clsSIM.DeleteMast mSimCode
            clsSIM.UpdateMast mSimCode
            clsSIM.EndMast mSimCode
            
            Rem clsIT.UpdateDependency mSimItmCode, False not required here
            
            Call SmryList
            If datRecset.RecordCount > mRecAbsPos And mRecAbsPos > 0 Then
                datRecset.Move mRecAbsPos - 1, 1
            Else
                MoveRecToLast datRecset
            End If
        End If
        ShowRecActiveFlexRow datRecset, Mfgrd1
        Mfgrd1.SetFocus
    Else
        Mfgrd1.SetFocus
    End If
Else
    Mfgrd1.SetFocus
End If

End Sub

Private Sub Data_CancelEvent()
clsIT.CancelItem mSimItmCode
clsIT.EndItem mSimItmCode

clsSIM.CancelMast mSimCode
clsSIM.EndMast mSimCode

mEntryAborted = True

End Sub

Private Sub Calc_Value()
With clsIT
.mItmOpQty_dbl = UnMyStqFmt(mskSimOpQty.Text)
.mItmOpRate_dbl = Val(UnMyNumFmt(mskSimOpRate.Text))
.Calc_Value
mskSimOpValue.Text = ToMyStvFmt(.mItmOpValue_dbl)
End With

End Sub

Private Sub SmryList()
Dim aStock As Variant, mQty As Double, mAvgRate As Double, mValue As Double
Dim gcolcount As Integer, acount As Integer, mLow As Integer, mHigh As Integer, mPos As Integer, srow As Long, mColCount As Integer

clsListStru.Clear

Rem column definitions
clsListStru.AddFields mExpr:="SimCode", mAttrib:=cFAT_SYSTEM
clsListStru.AddFields mExpr:="SimItmCode", mAttrib:=cFAT_SYSTEM
clsListStru.AddFields mExpr:="SimName", mTitle:="Product Name", mAlign:=flexAlignLeftCenter, mWidth:=3500, mShowItem:=True
clsListStru.AddFields mExpr:="SigName", mTitle:="Group Name", mAlign:=flexAlignLeftCenter, mWidth:=3000, mShowItem:=True
clsListStru.AddFields mExpr:="SimPurchRate", mTitle:="Purch.Rate", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=True
clsListStru.AddFields mExpr:="SimMRPRate", mTitle:="MRP", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=True
clsListStru.AddFields mExpr:="SimSaleRate", mTitle:="Sale Rate", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=True

clsListStru.AddFields mExpr:="0.00", mAlias:="SimOpQty", mTitle:="Op.Qty", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=False
clsListStru.AddFields mExpr:="0.00", mAlias:="SimOpRate", mTitle:="Op.Rate", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=False
clsListStru.AddFields mExpr:="0.00", mAlias:="SimOpValue", mTitle:="Op.Value", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=False

clsListStru.AddFields mExpr:="0.00", mAlias:="SimOpRcQty", mTitle:="Op.Rc.Qty", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=False
clsListStru.AddFields mExpr:="0.00", mAlias:="SimOpRcRate", mTitle:="Op.Rc.Rate", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=False
clsListStru.AddFields mExpr:="0.00", mAlias:="SimOpRcValue", mTitle:="Op.Rc.Value", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=False

clsListStru.AddFields mExpr:="0.00", mAlias:="SimOpIsQty", mTitle:="Op.Is.Qty", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=False
clsListStru.AddFields mExpr:="0.00", mAlias:="SimOpIsRate", mTitle:="Op.Is.Rate", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=False
clsListStru.AddFields mExpr:="0.00", mAlias:="SimOpIsValue", mTitle:="Op.Is.Value", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=False

clsListStru.AddFields mExpr:="0.00", mAlias:="SimCurQty", mTitle:="Cur.Qty", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=False
clsListStru.AddFields mExpr:="0.00", mAlias:="SimCurRate", mTitle:="Cur.Rate", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=False
clsListStru.AddFields mExpr:="0.00", mAlias:="SimCurValue", mTitle:="Cur.Value", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=False

clsListStru.AddFields mExpr:="0.00", mAlias:="SimCurRcQty", mTitle:="Cur.Rc.Qty", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=False
clsListStru.AddFields mExpr:="0.00", mAlias:="SimCurRcRate", mTitle:="Cur.Rc.Rate", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=False
clsListStru.AddFields mExpr:="0.00", mAlias:="SimCurRcValue", mTitle:="Cur.Rc.Value", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=False

clsListStru.AddFields mExpr:="0.00", mAlias:="SimCurIsQty", mTitle:="Cur.Is.Qty", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=False
clsListStru.AddFields mExpr:="0.00", mAlias:="SimCurIsRate", mTitle:="Cur.Is.Rate", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=False
clsListStru.AddFields mExpr:="0.00", mAlias:="SimCurIsValue", mTitle:="Cur.Is.Value", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=False

If chkOpBal.Value = 1 Then
    If chkCombinedOpBal.Value = 1 Then
        clsListStru.UpdateField mAlias:="SimOpQty", mShowItem:=True
        clsListStru.UpdateField mAlias:="SimOpRate", mShowItem:=True
        clsListStru.UpdateField mAlias:="SimOpValue", mShowItem:=True
    Else
        clsListStru.UpdateField mAlias:="SimOpRcQty", mShowItem:=True
        clsListStru.UpdateField mAlias:="SimOpRcRate", mShowItem:=True
        clsListStru.UpdateField mAlias:="SimOpRcValue", mShowItem:=True
        
        clsListStru.UpdateField mAlias:="SimOpIsQty", mShowItem:=True
        clsListStru.UpdateField mAlias:="SimOpIsRate", mShowItem:=True
        clsListStru.UpdateField mAlias:="SimOpIsValue", mShowItem:=True
    End If
    
End If
If chkCurBal.Value = 1 Then
    If chkCombinedCurBal.Value = 1 Then
        clsListStru.UpdateField mAlias:="SimCurQty", mShowItem:=True
        clsListStru.UpdateField mAlias:="SimCurRate", mShowItem:=True
        clsListStru.UpdateField mAlias:="SimCurValue", mShowItem:=True
    Else
        clsListStru.UpdateField mAlias:="SimCurRcQty", mShowItem:=True
        clsListStru.UpdateField mAlias:="SimCurRcRate", mShowItem:=True
        clsListStru.UpdateField mAlias:="SimCurRcValue", mShowItem:=True
        
        clsListStru.UpdateField mAlias:="SimCurIsQty", mShowItem:=True
        clsListStru.UpdateField mAlias:="SimCurIsRate", mShowItem:=True
        clsListStru.UpdateField mAlias:="SimCurIsValue", mShowItem:=True
    End If
    
End If

RefreshDatabase dbHmsDatabase
datRecset.Requery

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
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SimCode")) = .fields("SimCode")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SimItmCode")) = .fields("SimItmCode")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SimName")) = .fields("SimName")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SigName")) = .fields("SigName")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SimPurchRate")) = ToMyNumFmt(.fields("SimPurchRate"))
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SimMRPRate")) = ToMyNumFmt(.fields("SimMRPRate"))
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SimSaleRate")) = ToMyNumFmt(.fields("SimSaleRate"))
        
        If chkOpBal.Value = 1 Then
            If chkCombinedOpBal.Value = 1 Then
                aStock = clsIT.GetItmOpnQtyRateValue(.fields("SimItmCode"), mIsRcSeperated:=False)
                
                mQty = aStock(0, 0)
                mAvgRate = aStock(0, 1)
                mValue = aStock(0, 2)
                
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SimOpQty")) = ToMyStqFmt(mQty)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SimOpRate")) = ToMyNumFmt(mAvgRate)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SimOpValue")) = ToMyStvFmt(mValue)
                
            Else
                aStock = clsIT.GetItmOpnQtyRateValue(.fields("SimItmCode"), mIsRcSeperated:=True)
                Rem plus stock
                mQty = aStock(0, 0)
                mAvgRate = aStock(0, 1)
                mValue = aStock(0, 2)
                
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SimOpRcQty")) = ToMyStqFmt(mQty)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SimOpRcRate")) = ToMyNumFmt(mAvgRate)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SimOpRcValue")) = ToMyStvFmt(mValue)
                
                Rem minus part
                mQty = aStock(1, 0)
                mAvgRate = aStock(1, 1)
                mValue = aStock(1, 2)
                
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SimOpIsQty")) = ToMyStqFmt(mQty)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SimOpIsRate")) = ToMyNumFmt(mAvgRate)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SimOpIsValue")) = ToMyStvFmt(mValue)
                
            End If
        End If
        If chkCurBal.Value = 1 Then
            If chkCombinedCurBal.Value = 1 Then
                aStock = clsIT.GetItmCurQtyRateValue(.fields("SimItmCode"), sCmpBookEndDate, mIsRcSeperated:=False)
                
                mQty = aStock(0, 0)
                mAvgRate = aStock(0, 1)
                mValue = aStock(0, 2)
                
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SimCurQty")) = ToMyStqFmt(mQty)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SimCurRate")) = ToMyNumFmt(mAvgRate)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SimCurValue")) = ToMyStvFmt(mValue)
                
            Else
                aStock = clsIT.GetItmCurQtyRateValue(.fields("SimItmCode"), sCmpBookEndDate, mIsRcSeperated:=True)
                Rem plus stock
                mQty = aStock(0, 0)
                mAvgRate = aStock(0, 1)
                mValue = aStock(0, 2)
                
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SimCurRcQty")) = ToMyStqFmt(mQty)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SimCurRcRate")) = ToMyNumFmt(mAvgRate)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SimCurRcValue")) = ToMyStvFmt(mValue)
                
                Rem minus part
                mQty = aStock(1, 0)
                mAvgRate = aStock(1, 1)
                mValue = aStock(1, 2)
                
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SimCurIsQty")) = ToMyStqFmt(mQty)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SimCurIsRate")) = ToMyNumFmt(mAvgRate)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("SimCurIsValue")) = ToMyStvFmt(mValue)
                
            End If
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
    frConfigure.ZOrder
    frConfigure.Visible = True
    Mfgrd1.Enabled = False
    chkCombinedOpBal.SetFocus
ElseIf MyAddNewKey(Shift, KeyCode) = True Then
    Call Data_AddEvent
ElseIf MyDeleteKey(Shift, KeyCode) = True Then
    If Mfgrd1.Row < Mfgrd1.Rows - 1 Then
        Call Data_DeleteEvent
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
With datRecset
If .RecordCount > 0 Then
    If .AbsolutePosition <> Mfgrd1.Row - Mfgrd1.FixedRows + 1 Then
        .MoveFirst
        .Move Mfgrd1.Row - Mfgrd1.FixedRows, 1     ' Mfgrd1.Row is already less by one
    End If
End If
End With
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
mText = IIf(IsMissing(mText) = True, txtSearch1Text.Text, mText)
SearchFlex Mfgrd1, clsListStru.GetItemIndex("SimName"), mText
ShowActiveFlexRow Mfgrd1

End Sub

Private Sub txtSearch1Text_GotFocus()
FlashActiveControl txtSearch1Text, True

End Sub

Private Sub txtSearch1Text_KeyDown(KeyCode As Integer, Shift As Integer)
'''If Shift = 0 Then
'''    Select Case KeyCode
'''    Case vbKeyF12
'''        frConfigure.ZOrder
'''        frConfigure.Visible = True
'''        Mfgrd1.Enabled = False
'''        chkCombinedOpBal.SetFocus
'''    End Select
'''ElseIf Shift = vbCtrlMask Then
'''    If KeyCode = vbKeyAdd Then
'''        Call Data_AddEvent
'''    ElseIf KeyCode = vbKeySubtract Then
'''        If Mfgrd1.Row < Mfgrd1.Rows - 1 Then
'''            Call Data_DeleteEvent
'''        End If
'''    ElseIf KeyCode = vbKeySpace Then
'''        Call cmdFormEnter_Click
'''    End If
'''ElseIf KeyCode = vbKeyDown Or KeyCode = vbKeyUp Then
'''    With datRecset
'''    If .RecordCount > 0 Then
'''        If KeyCode = vbKeyDown Then
'''            If .EOF = False Then
'''                .MoveNext
'''            End If
'''            If .EOF = True Then
'''                Rem .MoveLast
'''            End If
'''        ElseIf KeyCode = vbKeyUp Then
'''            If .BOF = False Then
'''                .MovePrevious
'''            End If
'''            If .BOF = True Then
'''                .MoveFirst
'''            End If
'''        End If
'''    End If
'''    If .EOF = False And .BOF = False Then
'''        txtSearch1Text.Text = .Fields("SimName")
'''    Else
'''        If txtSearch1Text.Text <> "" Then
'''            txtSearch1Text.Text = ""
'''        Else
'''            Mfgrd1.Row = Mfgrd1.Rows - 1
'''            ShowActiveFlexRow Mfgrd1
'''        End If
'''    End If
'''    txtSearch1Text.SelStart = Len(txtSearch1Text.Text)
'''    KeyCode = 0
'''
'''    End With
'''End If

End Sub

Private Sub txtSearch1Text_LostFocus()
FlashActiveControl txtSearch1Text, False
End Sub

