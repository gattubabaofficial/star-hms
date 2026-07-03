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
   LockControls    =   -1  'True
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
      Begin VB.TextBox mskMdiMRPRate 
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
      Begin VB.TextBox mskMdiSaleRate 
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
      Begin VB.TextBox mskMdiPurchRate 
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
      Begin VB.TextBox txtMigName 
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
      Begin VB.TextBox txtMdiDesc 
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
      Begin VB.TextBox mskMdiItmCode 
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
      Begin VB.TextBox mskMdiOpValue 
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
      Begin VB.TextBox mskMdiOpRate 
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
      Begin VB.TextBox mskMdiOpQty 
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
      Begin VB.TextBox txtMdiName 
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
      Begin VB.Label lblMdiCurValue 
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
      Begin VB.Label lblMdiCurRate 
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
      Begin VB.Label lblMdiCurQty 
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
Dim mMdiCode As Long, mMdiItmCode As Long
Dim mRemoteAccess As Boolean, mEntrySaved As Boolean, mEntryAborted As Boolean
Dim dbMdsDatabase As New ADODB.Connection, dbMdsDatabase As New ADODB.Connection, dbStDatabase As New ADODB.Connection, dbGrpDatabase As New ADODB.Connection, datRecset As New ADODB.Recordset
Dim mMdiName_old As String, mMdiMRPRate_old As Double
Dim clsMDI As clsMdsMasterEntry, clsMIG As clsMdsMasterEntry, clsIT As clsProduct, mActiveControl As Object, clsListStru As clsSelectQueryStructure
Dim fcmbMigName As clsMdsFlexSearch

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
mMdiCode = mAccessCode
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

Public Property Get MdiName() As String
MdiName = txtMdiName.Text
End Property

Public Property Get FormAddEditMode() As Integer
FormAddEditMode = cmbFormEntryMode.ListIndex
End Property

Public Property Let FormAddEditMode(ByVal New_FormEntryMode As Integer)
cmbFormEntryMode.ListIndex = New_FormEntryMode
ChkEntryModeSign cmbFormEntryMode

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
        txtMdiName.SetFocus
    End If
End If

End Sub

Private Sub cmdSaveForm_Click()
Call Data_SaveEvent

Call SmryList
txtSearch1Text_InterActiveChange txtMdiName.Text

''If txtSearch1Text.Text <> txtMdiName.Text Then
''    txtSearch1Text.Text = txtMdiName.Text
''Else
''    Call txtSearch1Text_Change
''End If
''datRecset.Find "MdiName='" & txtMdiName.Text & "'", Start:=1
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
        txtMdiName.SetFocus
    End If
End If
cmdSaveForm.Enabled = True

End Sub

Private Sub Form_Activate()
If FormLoaded = False Then
    If mRemoteAccess = True Then
        If mMdiCode = 0 Then
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
mskMdiOpValue.Enabled = False
frConfigure.Visible = False
txtSearch1Text.Enabled = False

Call RestoreDefaultSmryPara
Call SaveSmryPara

OpenMdsDataSource dbMdsDatabase
OpenStDataSource dbStDatabase
OpenGrpDataSource dbGrpDatabase

Set clsIT = New clsProduct
Set clsIT.dbStDatabase = dbStDatabase
Set clsIT.dbGrpDatabase = dbGrpDatabase

Set clsMDI = New clsMdsMasterEntry
Set clsMDI.dbMdsDatabase = dbMdsDatabase
clsMDI.blnMedItmMastList = True
clsMDI.Init

Set clsMIG = New clsMdsMasterEntry
Set clsMIG.dbMdsDatabase = dbMdsDatabase
clsMIG.blnMedItmGrpMast = True
clsMIG.Init

Set fcmbMigName = New clsMdsFlexSearch
Set fcmbMigName.dbMdsDatabase = dbMdsDatabase
fcmbMigName.blnMedItmGrpMastList = True
fcmbMigName.Init

Set clsListStru = New clsSelectQueryStructure

datRecset.open "Select * from MedItmMast" _
    & " inner join MedItmGrpMst on MedItmMast.MdiMigCode = MedItmGrpMst.MigCode" _
    & " order by MdiName" _
    , dbMdsDatabase, adOpenKeyset, adLockOptimistic
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
Set clsMDI = Nothing
Set clsMIG = Nothing
Set fcmbMigName = Nothing
Set clsListStru = Nothing

CloseTable datRecset
CloseDataSource dbMdsDatabase
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
    txtMdiName.SetFocus
    Exit Function
End If
If Trim(txtMdiName.Text) = "" Then
    ErrorBox "Invalid Item Name !!!"
    txtMdiName.SetFocus
    Exit Function
End If
If Val(fcmbMigName.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    txtMigName.SetFocus
    Exit Function
End If
If Val(UnMyNumFmt(mskMdiPurchRate.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskMdiPurchRate.SetFocus
    Exit Function
End If
If Val(UnMyNumFmt(mskMdiMRPRate.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskMdiMRPRate.SetFocus
    Exit Function
End If
If Val(UnMyNumFmt(mskMdiSaleRate.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskMdiSaleRate.SetFocus
    Exit Function
End If

If txtMdiName.Text <> mMdiName_old Then
    If ChkIsDuplicate(dbMdsDatabase, "MedItmMast", "MdiName", txtMdiName.Text, "MdiCode", Val(mskFormBoundField.Text)) = True Then
        ErrorBox "Duplicate Input !!!"
        txtMdiName.SetFocus
        Exit Function
    ElseIf ChkIsDuplicate(dbStDatabase, "ProdMast", "ItmName", txtMdiName.Text, "ItmCode", Val(mskMdiItmCode.Text)) = True Then
        ErrorBox "Duplicate Input !!!"
        txtMdiName.SetFocus
        Exit Function
    End If
End If

Data_Verify = True
End Function

Private Sub mskMdiMRPRate_GotFocus()
FlashActiveControl mskMdiMRPRate, True
End Sub

Private Sub mskMdiMRPRate_LostFocus()
FlashActiveControl mskMdiMRPRate, False
End Sub

Private Sub mskMdiMRPRate_Validate(Cancel As Boolean)
mskMdiMRPRate.Text = ToMyNumFmt(mskMdiMRPRate.Text, mUseAbs:=True)
If Val(UnMyNumFmt(mskMdiMRPRate.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskMdiMRPRate.SetFocus
    Cancel = True
Else
    If FormAddEditMode = cFORM_ADDMODE Or Val(UnMyNumFmt(mskMdiMRPRate.Text)) <> mMdiMRPRate_old Then
        mskMdiSaleRate.Text = mskMdiMRPRate.Text
    End If
End If

End Sub

Private Sub mskMdiOpQty_GotFocus()
FlashActiveControl mskMdiOpQty, True
End Sub

Private Sub mskMdiOpQty_LostFocus()
FlashActiveControl mskMdiOpQty, False
End Sub

Private Sub mskMdiOpQty_Validate(Cancel As Boolean)
mskMdiOpQty.Text = ToMyStqFmt(UnMyStqFmt(mskMdiOpQty.Text))
Call Calc_Value
End Sub

Private Sub mskMdiOpRate_GotFocus()
FlashActiveControl mskMdiOpRate, True
End Sub

Private Sub mskMdiOpRate_LostFocus()
FlashActiveControl mskMdiOpRate, False
End Sub

Private Sub mskMdiOpRate_Validate(Cancel As Boolean)
mskMdiOpRate.Text = ToMyNumFmt(mskMdiOpRate.Text, , True)
Call Calc_Value
End Sub

Private Sub mskMdiOpValue_GotFocus()
FlashActiveControl mskMdiOpValue, True
End Sub

Private Sub mskMdiOpValue_LostFocus()
FlashActiveControl mskMdiOpValue, False
End Sub

Private Sub mskMdiOpValue_Validate(Cancel As Boolean)
mskMdiOpValue.Text = ToMyNumFmt(mskMdiOpValue.Text)
End Sub

Private Sub mskMdiPurchRate_GotFocus()
FlashActiveControl mskMdiPurchRate, True
End Sub

Private Sub mskMdiPurchRate_LostFocus()
FlashActiveControl mskMdiPurchRate, False
End Sub

Private Sub mskMdiPurchRate_Validate(Cancel As Boolean)
mskMdiPurchRate.Text = ToMyNumFmt(mskMdiPurchRate.Text, mUseAbs:=True)
If Val(UnMyNumFmt(mskMdiPurchRate.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskMdiPurchRate.SetFocus
    Cancel = True
End If

End Sub

Private Sub mskMdiSaleRate_GotFocus()
FlashActiveControl mskMdiSaleRate, True
End Sub

Private Sub mskMdiSaleRate_LostFocus()
FlashActiveControl mskMdiSaleRate, False
End Sub

Private Sub mskMdiSaleRate_Validate(Cancel As Boolean)
mskMdiSaleRate.Text = ToMyNumFmt(mskMdiSaleRate.Text, mUseAbs:=True)
If Val(UnMyNumFmt(mskMdiSaleRate.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskMdiSaleRate.SetFocus
    Cancel = True
End If

End Sub

Private Sub txtMigName_Change()
If fcmbMigName.CallFromText_Change = False Then
    fcmbMigName.CallFromText_Change = True
    If InterActiveChange(txtMigName) = True Then
        fcmbMigName.UserText = Array(txtMigName.Text, txtMigName.SelStart)
        fcmbMigName.Show
        txtMigName.Text = fcmbMigName.Text
        If fcmbMigName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbMigName.CallFromText_Change = False
End If

End Sub

Private Sub txtMigName_GotFocus()
FlashActiveControl txtMigName, True
End Sub

Private Sub txtMigName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtMigName_Change
End If
End Sub

Private Sub txtMigName_LostFocus()
FlashActiveControl txtMigName, False
End Sub

Private Sub txtMigName_Validate(Cancel As Boolean)
If Val(fcmbMigName.BoundText) < 1 Then
    ErrorBox "Invalid Selection !!!"
    txtMigName.SetFocus
    Cancel = True
End If

End Sub

Private Sub txtMdiDesc_GotFocus()
FlashActiveControl txtMdiDesc, True
End Sub

Private Sub txtMdiDesc_LostFocus()
FlashActiveControl txtMdiDesc, False
End Sub

Private Sub txtMdiDesc_Validate(Cancel As Boolean)
txtMdiDesc.Text = ToMyWord(txtMdiDesc.Text)
If txtMdiDesc.Text = "" Then
    txtMdiDesc.Text = txtMdiName.Text
End If

End Sub

Private Sub txtMdiName_GotFocus()
FlashActiveControl txtMdiName, True
End Sub

Private Sub txtMdiName_LostFocus()
FlashActiveControl txtMdiName, False
End Sub

Private Sub txtMdiName_Validate(Cancel As Boolean)
txtMdiName.Text = ToMyWord(txtMdiName.Text)
If Trim(txtMdiName.Text) = "" Then
    ErrorBox "Invalid Input !!!"
    Cancel = True
    txtMdiName.SetFocus
Else
    If txtMdiName.Text <> mMdiName_old Then
        If ChkIsDuplicate(dbMdsDatabase, "MedItmMast", "MdiName", txtMdiName.Text, "MdiCode", Val(mskFormBoundField.Text)) = True Then
            ErrorBox "Duplicate Input !!!"
            Cancel = True
            txtMdiName.SetFocus
        ElseIf ChkIsDuplicate(dbStDatabase, "ProdMast", "ItmName", txtMdiName.Text, "ItmCode", Val(mskMdiItmCode.Text)) = True Then
            ErrorBox "Duplicate Input !!!"
            Cancel = True
            txtMdiName.SetFocus
        End If
    End If
End If
If Cancel = False Then
    If txtMdiDesc.Text = "" Then
        txtMdiDesc.Text = txtMdiName.Text
    End If
End If

End Sub

Private Sub Data_AddEvent()

If CanUserAddOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If clsMDI.BeginMast(0) = False Then
    Exit Sub
ElseIf clsIT.BeginItem(0) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_ADDMODE

clsIT.Clear
clsMDI.Clear
mMdiCode = clsMDI.ActiveCode
mMdiItmCode = clsIT.ActiveItmCode

mskFormBoundField.Text = mMdiCode
mskMdiItmCode.Text = mMdiItmCode
txtMdiName.Text = ""
txtMdiDesc.Text = ""
txtMigName.Text = "": fcmbMigName.BoundText = ""
mskMdiPurchRate.Text = ToMyNumFmt(0)
mskMdiMRPRate.Text = ToMyNumFmt(0)
mskMdiSaleRate.Text = ToMyNumFmt(0)
mskMdiOpQty.Text = ToMyStqFmt(0)
mskMdiOpRate.Text = ToMyNumFmt(0)
mskMdiOpValue.Text = ToMyStvFmt(0)
lblMdiCurQty.Caption = ToMyStqFmt(0)
lblMdiCurRate.Caption = ToMyNumFmt(0)
lblMdiCurValue.Caption = ToMyStvFmt(0)

mMdiName_old = txtMdiName.Text
mMdiMRPRate_old = Val(UnMyNumFmt(mskMdiMRPRate.Text))

Call ShowEntryMode(True)
txtMdiName.SetFocus

End Sub

Private Sub Data_EditEvent()
Dim mLCount As Integer, mUCount As Integer, mCount As Integer, mOpnQty As Double, mOpnAvgRate As Double, mOpnValue As Double, mCurQty As Double, mCurAvgRate As Double, mCurValue As Double

If CanUserEditOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If clsMDI.BeginMast(datRecset.fields("MdiCode")) = False Then
    Exit Sub
ElseIf clsIT.BeginItem(datRecset.fields("MdiItmCode")) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_EDITMODE
With datRecset
mMdiCode = .fields("MdiCode")
mMdiItmCode = .fields("MdiItmCode")

clsMDI.GetData mMdiCode
clsIT.GetData mMdiItmCode

mskFormBoundField.Text = CStr(mMdiCode)
mskMdiItmCode.Text = CStr(mMdiItmCode)

txtMdiName.Text = .fields("MdiName")
txtMdiDesc.Text = .fields("MdiDesc")
fcmbMigName.BoundText = CStr(.fields("MdiMigCode")): txtMigName.Text = fcmbMigName.Text
mskMdiPurchRate.Text = ToMyNumFmt(.fields("MdiPurchRate"))
mskMdiMRPRate.Text = ToMyNumFmt(.fields("MdiMRPRate"))
mskMdiSaleRate.Text = ToMyNumFmt(.fields("MdiSaleRate"))
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

mskMdiOpQty.Text = ToMyStqFmt(mOpnQty)
mskMdiOpRate.Text = ToMyNumFmt(mOpnAvgRate)
mskMdiOpValue.Text = ToMyStvFmt(mOpnValue)

lblMdiCurQty.Caption = ToMyStqFmt(mCurQty)
lblMdiCurRate.Caption = ToMyNumFmt(mCurAvgRate)
lblMdiCurValue.Caption = ToMyStvFmt(mCurValue)

mMdiName_old = txtMdiName.Text
mMdiMRPRate_old = Val(UnMyNumFmt(mskMdiMRPRate.Text))

Call ShowEntryMode(True)
txtMdiName.SetFocus

End Sub

Private Sub Data_SaveEvent()
Dim mContinueUpdate As Boolean

mContinueUpdate = True
With clsIT
If FormAddEditMode = cFORM_ADDMODE Then
    .Clear
Else
    .GetData mMdiItmCode
End If

.mItmName_str = txtMdiName.Text
If FormAddEditMode = cFORM_ADDMODE Then
    .AddOpnStock mStkQty:=Val(UnMyStqFmt(mskMdiOpQty.Text)), mStkRate:=Val(UnMyNumFmt(mskMdiOpRate.Text)), mStkValue:=Val(UnMyStvFmt(mskMdiOpValue.Text))
    .AddProdRef mItrRef1Name:="Opn", mItrRef2Name:="", mItrPRate:=Val(UnMyNumFmt(mskMdiOpRate.Text)), mItrMRP:=0, mItrSRate:=0
    
    If .AddNewDtl(mMdiItmCode) = True Then
        If .AddNewHdr() = True Then
            mskMdiItmCode.Text = .mItmCode_lng
            mMdiItmCode = .mItmCode_lng
        Else
            mContinueUpdate = False
        End If
    Else
        mContinueUpdate = False
    End If
Else
    .EditOpnStock mStkICode:=.OpnICode(.LOpnStock), mStkQty:=Val(UnMyStqFmt(mskMdiOpQty.Text)), mStkRate:=Val(UnMyNumFmt(mskMdiOpRate.Text)), mStkValue:=Val(UnMyStvFmt(mskMdiOpValue.Text))
    .EditProdRef mItrRefCode:=.ItrRefCode(.LProdRef), mItrRef1Name:=.ItrRef1Name(.LProdRef), mItrRef2Name:=.ItrRef2Name(.LProdRef), mItrPRate:=Val(UnMyNumFmt(mskMdiOpRate.Text)), mItrMRP:=.ItrMRP(.LProdRef), mItrSRate:=.ItrSRate(.LProdRef)
    
    If .UpdateDtl(mMdiItmCode) = True Then
        If .UpdateHdr(mMdiItmCode) = True Then
            Rem none
        Else
            mContinueUpdate = False
        End If
    Else
        mContinueUpdate = False
    End If
End If

If mContinueUpdate = True Then   '''   .mItmCode_lng > 0   updated successfully
    With clsMDI
    If FormAddEditMode = cFORM_ADDMODE Then
        .Clear
        .mMdiItmCode_lng = mMdiItmCode
    Else
        .GetData mMdiCode
    End If
    
    .mName_str = txtMdiName.Text
    .mMdiDesc_str = txtMdiDesc.Text
    .mMdiMigCode_lng = Val(fcmbMigName.BoundText)
    .mMdiPurchRate_dbl = Val(UnMyNumFmt(mskMdiPurchRate.Text))
    .mMdiMRPRate_dbl = Val(UnMyNumFmt(mskMdiMRPRate.Text))
    .mMdiSaleRate_dbl = Val(UnMyNumFmt(mskMdiSaleRate.Text))
    If FormAddEditMode = cFORM_ADDMODE Then
        If .AddNew() = True Then
            mskFormBoundField.Text = .mCode_lng
            mMdiCode = .mCode_lng
        Else
            mContinueUpdate = False
        End If
    Else
        If .Update(mMdiCode) = True Then
            Rem none
        Else
            mContinueUpdate = False
        End If
    End If
    If mContinueUpdate = True Then   ''' .mCode_lng > 0   updated successfully
        .UpdateMast mMdiCode
        .EndMast mMdiCode
        
        clsIT.CommitItem mMdiItmCode
        clsIT.EndItem mMdiItmCode
        
        If FormAddEditMode = cFORM_ADDMODE Then
            clsIT.UpdateDependency mMdiItmCode, True
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

mMdiCode = datRecset.fields("MdiCode")
mMdiItmCode = datRecset.fields("MdiItmCode")
mRecAbsPos = datRecset.AbsolutePosition

If clsMDI.CanDeleteMast(mMdiCode, mSkipConfirm:=True) = True Or clsIT.CanDeleteItem(mMdiItmCode, mSkipConfirm:=True, mSkipDependency:=True) = True Then
    If CanDelete() = True Then
        If clsIT.BeginItem(mMdiItmCode) = True And clsMDI.BeginMast(mMdiCode) = True Then
            clsIT.DeleteItem mMdiItmCode
            clsIT.CommitItem mMdiItmCode
            clsIT.EndItem mMdiItmCode
            
            clsMDI.DeleteMast mMdiCode
            clsMDI.UpdateMast mMdiCode
            clsMDI.EndMast mMdiCode
            
            Rem clsIT.UpdateDependency mMdiItmCode, False not required here
            
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
clsIT.CancelItem mMdiItmCode
clsIT.EndItem mMdiItmCode

clsMDI.CancelMast mMdiCode
clsMDI.EndMast mMdiCode

mEntryAborted = True

End Sub

Private Sub Calc_Value()
With clsIT
.mItmOpQty_dbl = UnMyStqFmt(mskMdiOpQty.Text)
.mItmOpRate_dbl = Val(UnMyNumFmt(mskMdiOpRate.Text))
.Calc_Value
mskMdiOpValue.Text = ToMyStvFmt(.mItmOpValue_dbl)
End With

End Sub

Private Sub SmryList()
Dim aStock As Variant, mQty As Double, mAvgRate As Double, mValue As Double
Dim gcolcount As Integer, acount As Integer, mLow As Integer, mHigh As Integer, mPos As Integer, srow As Long, mColCount As Integer

clsListStru.Clear

Rem column definitions
clsListStru.AddFields mExpr:="MdiCode", mAttrib:=cFAT_SYSTEM
clsListStru.AddFields mExpr:="MdiItmCode", mAttrib:=cFAT_SYSTEM
clsListStru.AddFields mExpr:="MdiName", mTitle:="Product Name", mAlign:=flexAlignLeftCenter, mWidth:=3500, mShowItem:=True
clsListStru.AddFields mExpr:="MigName", mTitle:="Group Name", mAlign:=flexAlignLeftCenter, mWidth:=3000, mShowItem:=True
clsListStru.AddFields mExpr:="MdiPurchRate", mTitle:="Purch.Rate", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=True
clsListStru.AddFields mExpr:="MdiMRPRate", mTitle:="MRP", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=True
clsListStru.AddFields mExpr:="MdiSaleRate", mTitle:="Sale Rate", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=True

'clsListStru.AddFields mExpr:="0.00", mAlias:="MdiOpQty", mTitle:="Op.Qty", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=False
'clsListStru.AddFields mExpr:="0.00", mAlias:="MdiOpRate", mTitle:="Op.Rate", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=False
'clsListStru.AddFields mExpr:="0.00", mAlias:="MdiOpValue", mTitle:="Op.Value", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=False
'
'clsListStru.AddFields mExpr:="0.00", mAlias:="MdiOpRcQty", mTitle:="Op.Rc.Qty", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=False
'clsListStru.AddFields mExpr:="0.00", mAlias:="MdiOpRcRate", mTitle:="Op.Rc.Rate", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=False
'clsListStru.AddFields mExpr:="0.00", mAlias:="MdiOpRcValue", mTitle:="Op.Rc.Value", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=False
'
'clsListStru.AddFields mExpr:="0.00", mAlias:="MdiOpIsQty", mTitle:="Op.Is.Qty", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=False
'clsListStru.AddFields mExpr:="0.00", mAlias:="MdiOpIsRate", mTitle:="Op.Is.Rate", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=False
'clsListStru.AddFields mExpr:="0.00", mAlias:="MdiOpIsValue", mTitle:="Op.Is.Value", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=False
'
'clsListStru.AddFields mExpr:="0.00", mAlias:="MdiCurQty", mTitle:="Cur.Qty", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=False
'clsListStru.AddFields mExpr:="0.00", mAlias:="MdiCurRate", mTitle:="Cur.Rate", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=False
'clsListStru.AddFields mExpr:="0.00", mAlias:="MdiCurValue", mTitle:="Cur.Value", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=False
'
'clsListStru.AddFields mExpr:="0.00", mAlias:="MdiCurRcQty", mTitle:="Cur.Rc.Qty", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=False
'clsListStru.AddFields mExpr:="0.00", mAlias:="MdiCurRcRate", mTitle:="Cur.Rc.Rate", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=False
'clsListStru.AddFields mExpr:="0.00", mAlias:="MdiCurRcValue", mTitle:="Cur.Rc.Value", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=False
'
'clsListStru.AddFields mExpr:="0.00", mAlias:="MdiCurIsQty", mTitle:="Cur.Is.Qty", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=False
'clsListStru.AddFields mExpr:="0.00", mAlias:="MdiCurIsRate", mTitle:="Cur.Is.Rate", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=False
'clsListStru.AddFields mExpr:="0.00", mAlias:="MdiCurIsValue", mTitle:="Cur.Is.Value", mWidth:="1500", mAlign:=flexAlignRightCenter, mShowItem:=False

'If chkOpBal.Value = 1 Then
'    If chkCombinedOpBal.Value = 1 Then
'        clsListStru.UpdateField mAlias:="MdiOpQty", mShowItem:=True
'        clsListStru.UpdateField mAlias:="MdiOpRate", mShowItem:=True
'        clsListStru.UpdateField mAlias:="MdiOpValue", mShowItem:=True
'    Else
'        clsListStru.UpdateField mAlias:="MdiOpRcQty", mShowItem:=True
'        clsListStru.UpdateField mAlias:="MdiOpRcRate", mShowItem:=True
'        clsListStru.UpdateField mAlias:="MdiOpRcValue", mShowItem:=True
'
'        clsListStru.UpdateField mAlias:="MdiOpIsQty", mShowItem:=True
'        clsListStru.UpdateField mAlias:="MdiOpIsRate", mShowItem:=True
'        clsListStru.UpdateField mAlias:="MdiOpIsValue", mShowItem:=True
'    End If
'
'End If
'If chkCurBal.Value = 1 Then
'    If chkCombinedCurBal.Value = 1 Then
'        clsListStru.UpdateField mAlias:="MdiCurQty", mShowItem:=True
'        clsListStru.UpdateField mAlias:="MdiCurRate", mShowItem:=True
'        clsListStru.UpdateField mAlias:="MdiCurValue", mShowItem:=True
'    Else
'        clsListStru.UpdateField mAlias:="MdiCurRcQty", mShowItem:=True
'        clsListStru.UpdateField mAlias:="MdiCurRcRate", mShowItem:=True
'        clsListStru.UpdateField mAlias:="MdiCurRcValue", mShowItem:=True
'
'        clsListStru.UpdateField mAlias:="MdiCurIsQty", mShowItem:=True
'        clsListStru.UpdateField mAlias:="MdiCurIsRate", mShowItem:=True
'        clsListStru.UpdateField mAlias:="MdiCurIsValue", mShowItem:=True
'    End If
'
'End If

RefreshDatabase dbMdsDatabase
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
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("MdiCode")) = .fields("MdiCode")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("MdiItmCode")) = .fields("MdiItmCode")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("MdiName")) = .fields("MdiName")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("MigName")) = .fields("MigName")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("MdiPurchRate")) = ToMyNumFmt(.fields("MdiPurchRate"))
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("MdiMRPRate")) = ToMyNumFmt(.fields("MdiMRPRate"))
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("MdiSaleRate")) = ToMyNumFmt(.fields("MdiSaleRate"))
        
'        If chkOpBal.Value = 1 Then
'            If chkCombinedOpBal.Value = 1 Then
'                aStock = clsIT.GetItmOpnQtyRateValue(.fields("MdiItmCode"), mIsRcSeperated:=False)
'
'                mQty = aStock(0, 0)
'                mAvgRate = aStock(0, 1)
'                mValue = aStock(0, 2)
'
'                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("MdiOpQty")) = ToMyStqFmt(mQty)
'                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("MdiOpRate")) = ToMyNumFmt(mAvgRate)
'                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("MdiOpValue")) = ToMyStvFmt(mValue)
'
'            Else
'                aStock = clsIT.GetItmOpnQtyRateValue(.fields("MdiItmCode"), mIsRcSeperated:=True)
'                Rem plus stock
'                mQty = aStock(0, 0)
'                mAvgRate = aStock(0, 1)
'                mValue = aStock(0, 2)
'
'                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("MdiOpRcQty")) = ToMyStqFmt(mQty)
'                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("MdiOpRcRate")) = ToMyNumFmt(mAvgRate)
'                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("MdiOpRcValue")) = ToMyStvFmt(mValue)
'
'                Rem minus part
'                mQty = aStock(1, 0)
'                mAvgRate = aStock(1, 1)
'                mValue = aStock(1, 2)
'
'                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("MdiOpIsQty")) = ToMyStqFmt(mQty)
'                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("MdiOpIsRate")) = ToMyNumFmt(mAvgRate)
'                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("MdiOpIsValue")) = ToMyStvFmt(mValue)
'
'            End If
'        End If
'        If chkCurBal.Value = 1 Then
'            If chkCombinedCurBal.Value = 1 Then
'                aStock = clsIT.GetItmCurQtyRateValue(.fields("MdiItmCode"), sCmpBookEndDate, mIsRcSeperated:=False)
'
'                mQty = aStock(0, 0)
'                mAvgRate = aStock(0, 1)
'                mValue = aStock(0, 2)
'
'                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("MdiCurQty")) = ToMyStqFmt(mQty)
'                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("MdiCurRate")) = ToMyNumFmt(mAvgRate)
'                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("MdiCurValue")) = ToMyStvFmt(mValue)
'
'            Else
'                aStock = clsIT.GetItmCurQtyRateValue(.fields("MdiItmCode"), sCmpBookEndDate, mIsRcSeperated:=True)
'                Rem plus stock
'                mQty = aStock(0, 0)
'                mAvgRate = aStock(0, 1)
'                mValue = aStock(0, 2)
'
'                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("MdiCurRcQty")) = ToMyStqFmt(mQty)
'                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("MdiCurRcRate")) = ToMyNumFmt(mAvgRate)
'                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("MdiCurRcValue")) = ToMyStvFmt(mValue)
'
'                Rem minus part
'                mQty = aStock(1, 0)
'                mAvgRate = aStock(1, 1)
'                mValue = aStock(1, 2)
'
'                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("MdiCurIsQty")) = ToMyStqFmt(mQty)
'                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("MdiCurIsRate")) = ToMyNumFmt(mAvgRate)
'                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("MdiCurIsValue")) = ToMyStvFmt(mValue)
'
'            End If
'        End If
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
'    frConfigure.ZOrder
'    frConfigure.Visible = True
'    Mfgrd1.Enabled = False
'    chkCombinedOpBal.SetFocus
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
SearchFlex Mfgrd1, clsListStru.GetItemIndex("MdiName"), mText
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
'''        txtSearch1Text.Text = .Fields("MdiName")
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

