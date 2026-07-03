VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmEmployeeAccountMast 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   ClientHeight    =   8895
   ClientLeft      =   60
   ClientTop       =   60
   ClientWidth     =   13485
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
   ScaleHeight     =   8895
   ScaleWidth      =   13485
   ShowInTaskbar   =   0   'False
   Begin VB.Frame frFormSmry 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Summary"
      ForeColor       =   &H80000008&
      Height          =   5535
      Left            =   240
      TabIndex        =   32
      Top             =   840
      Width           =   12735
      Begin VB.TextBox txtList1Col 
         Appearance      =   0  'Flat
         Height          =   285
         Index           =   0
         Left            =   120
         MousePointer    =   1  'Arrow
         TabIndex        =   64
         TabStop         =   0   'False
         Top             =   1560
         Width           =   1335
      End
      Begin VB.TextBox txtSearch1Text 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   960
         TabIndex        =   62
         Top             =   360
         Width           =   4215
      End
      Begin VB.Frame frConfigure 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   4095
         Left            =   3120
         TabIndex        =   46
         Top             =   840
         Width           =   6015
         Begin VB.CheckBox chkCombinedCurBal 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Combined Current Balance"
            ForeColor       =   &H80000008&
            Height          =   285
            Left            =   1200
            TabIndex        =   40
            Top             =   1560
            Value           =   1  'Checked
            Width           =   2895
         End
         Begin VB.CheckBox chkCombinedOpBal 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Combined Opening Balance"
            ForeColor       =   &H80000008&
            Height          =   285
            Left            =   1200
            TabIndex        =   39
            Top             =   1080
            Value           =   1  'Checked
            Width           =   2895
         End
         Begin VB.CheckBox chkOpBal 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Opening Balance"
            ForeColor       =   &H80000008&
            Height          =   285
            Left            =   1200
            TabIndex        =   41
            Top             =   2040
            Value           =   1  'Checked
            Width           =   2175
         End
         Begin VB.CheckBox chkCurBal 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Current Balance"
            ForeColor       =   &H80000008&
            Height          =   285
            Left            =   1200
            TabIndex        =   42
            Top             =   2520
            Value           =   1  'Checked
            Width           =   2175
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
            Left            =   2400
            TabIndex        =   43
            Top             =   3240
            Width           =   855
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
            TabIndex        =   47
            Top             =   0
            Width           =   6015
         End
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd1 
         Height          =   4455
         Left            =   120
         TabIndex        =   63
         Top             =   720
         Width           =   11895
         _ExtentX        =   20981
         _ExtentY        =   7858
         _Version        =   393216
         RowHeightMin    =   315
         FocusRect       =   2
         HighLight       =   2
         SelectionMode   =   1
         Appearance      =   0
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Search:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   4
         Left            =   120
         TabIndex        =   82
         Top             =   360
         Width           =   735
      End
   End
   Begin VB.Frame frFormDtl 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Detail"
      ForeColor       =   &H80000008&
      Height          =   6015
      Left            =   240
      TabIndex        =   33
      Top             =   1080
      Width           =   12495
      Begin VB.CheckBox chkEmpCutUT 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Deduct UnderTime:"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   4080
         TabIndex        =   24
         Top             =   4800
         Width           =   2055
      End
      Begin VB.ComboBox cmbJobStateName 
         Appearance      =   0  'Flat
         Height          =   315
         Left            =   9720
         Style           =   2  'Dropdown List
         TabIndex        =   25
         Top             =   4800
         Width           =   1215
      End
      Begin VB.ComboBox cmbSftName 
         Appearance      =   0  'Flat
         Height          =   315
         Left            =   9720
         Style           =   2  'Dropdown List
         TabIndex        =   22
         Top             =   4440
         Width           =   975
      End
      Begin VB.TextBox txtMinWrkTimeStr 
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
         Height          =   285
         Left            =   9720
         TabIndex        =   19
         Tag             =   "AhCode"
         Text            =   "00:00"
         Top             =   4080
         Width           =   735
      End
      Begin VB.TextBox txtHalfDayTimeStr 
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
         Height          =   285
         Left            =   5880
         TabIndex        =   18
         Tag             =   "AhCode"
         Text            =   "00:00"
         Top             =   4080
         Width           =   735
      End
      Begin VB.ComboBox cmbWeeklyOff 
         Appearance      =   0  'Flat
         Height          =   315
         Left            =   5880
         Style           =   2  'Dropdown List
         TabIndex        =   21
         Top             =   4440
         Width           =   1575
      End
      Begin VB.TextBox mskEmpMnLeaves 
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
         Height          =   285
         Left            =   3120
         TabIndex        =   20
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   4440
         Width           =   855
      End
      Begin VB.CheckBox chkEmpAddOT 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Allow OverTime:"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   840
         TabIndex        =   23
         Top             =   4800
         Width           =   2535
      End
      Begin VB.TextBox txtWrkTimeStr 
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
         Height          =   285
         Left            =   3120
         TabIndex        =   17
         Tag             =   "AhCode"
         Text            =   "00:00"
         Top             =   4080
         Width           =   735
      End
      Begin VB.TextBox mskEmpCoPFAmt 
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
         Height          =   285
         Left            =   9240
         TabIndex        =   13
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   2880
         Width           =   1695
      End
      Begin VB.TextBox mskEmpCoPFPer 
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
         Height          =   285
         Left            =   8160
         TabIndex        =   12
         Tag             =   "AhCode"
         Text            =   "0.00 %"
         Top             =   2880
         Width           =   975
      End
      Begin VB.TextBox mskEmpNSalary 
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
         Height          =   285
         Left            =   3120
         TabIndex        =   16
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   3600
         Width           =   1695
      End
      Begin VB.TextBox mskEmpSelfESICAmt 
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
         Height          =   285
         Left            =   4320
         TabIndex        =   15
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   3240
         Width           =   1695
      End
      Begin VB.TextBox mskEmpSelfESICPer 
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
         Height          =   285
         Left            =   3120
         TabIndex        =   14
         Tag             =   "AhCode"
         Text            =   "0.00 %"
         Top             =   3240
         Width           =   1095
      End
      Begin VB.TextBox mskEmpSelfPFAmt 
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
         Height          =   285
         Left            =   4320
         TabIndex        =   11
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   2880
         Width           =   1695
      End
      Begin VB.TextBox mskEmpSelfPFPer 
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
         Height          =   285
         Left            =   3120
         TabIndex        =   10
         Tag             =   "AhCode"
         Text            =   "0.00 %"
         Top             =   2880
         Width           =   1095
      End
      Begin VB.TextBox mskEmpDAAmt 
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
         Height          =   285
         Left            =   4320
         TabIndex        =   9
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   2520
         Width           =   1695
      End
      Begin VB.TextBox mskEmpDAPer 
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
         Height          =   285
         Left            =   3120
         TabIndex        =   8
         Tag             =   "AhCode"
         Text            =   "0.00 %"
         Top             =   2520
         Width           =   1095
      End
      Begin VB.TextBox mskEmpHRAAmt 
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
         Height          =   285
         Left            =   4320
         TabIndex        =   7
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   2160
         Width           =   1695
      End
      Begin VB.TextBox mskEmpHRAPer 
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
         Height          =   285
         Left            =   3120
         TabIndex        =   6
         Tag             =   "AhCode"
         Text            =   "0.00 %"
         Top             =   2160
         Width           =   1095
      End
      Begin VB.TextBox mskEmpBSalary 
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
         Height          =   285
         Left            =   3120
         TabIndex        =   5
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   1800
         Width           =   1695
      End
      Begin VB.TextBox dtpEmpJoinDate 
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
         Height          =   285
         Left            =   3120
         MaxLength       =   50
         TabIndex        =   4
         Text            =   "dd/mm/yyyy"
         Top             =   1320
         Width           =   1335
      End
      Begin VB.TextBox txtDptName 
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
         Height          =   285
         Left            =   3120
         MaxLength       =   50
         TabIndex        =   2
         Top             =   960
         Width           =   3135
      End
      Begin VB.TextBox txtDsgName 
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
         Height          =   285
         Left            =   7920
         MaxLength       =   50
         TabIndex        =   3
         Top             =   960
         Width           =   3135
      End
      Begin VB.TextBox txtDrCrFlag 
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
         Height          =   285
         Left            =   4800
         TabIndex        =   27
         Tag             =   "AhCode"
         Text            =   "__"
         Top             =   5280
         Width           =   375
      End
      Begin VB.TextBox mskAhOpBal 
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
         Height          =   285
         Left            =   3120
         TabIndex        =   26
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   5280
         Width           =   1695
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
         Left            =   9960
         Style           =   1  'Graphical
         TabIndex        =   29
         Top             =   5520
         Width           =   375
      End
      Begin VB.TextBox txtAhName 
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
         Height          =   285
         Left            =   3120
         MaxLength       =   50
         TabIndex        =   1
         Top             =   600
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
         Height          =   285
         Left            =   3120
         TabIndex        =   0
         Tag             =   "AhCode"
         Text            =   "-1"
         Top             =   240
         Width           =   1335
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Status:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   20
         Left            =   8040
         TabIndex        =   81
         Top             =   4800
         Width           =   735
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Shift:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   19
         Left            =   8040
         TabIndex        =   80
         Top             =   4440
         Width           =   495
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Min.Working Hours:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   18
         Left            =   8040
         TabIndex        =   79
         Top             =   4080
         Width           =   1695
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Half Day Hours:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   17
         Left            =   4080
         TabIndex        =   78
         Top             =   4080
         Width           =   1455
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Weekly Off:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   16
         Left            =   4080
         TabIndex        =   77
         Top             =   4440
         Width           =   1455
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Allowed Monthly Leaves:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   15
         Left            =   840
         TabIndex        =   76
         Top             =   4440
         Width           =   2175
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Working Hours:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   14
         Left            =   840
         TabIndex        =   75
         Top             =   4080
         Width           =   2175
      End
      Begin VB.Line Line3 
         Index           =   2
         X1              =   840
         X2              =   11760
         Y1              =   5160
         Y2              =   5160
      End
      Begin VB.Line Line3 
         Index           =   1
         X1              =   840
         X2              =   11760
         Y1              =   1680
         Y2              =   1680
      End
      Begin VB.Line Line3 
         Index           =   0
         X1              =   840
         X2              =   11760
         Y1              =   3960
         Y2              =   3960
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "PF (Co. Contribution):"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   13
         Left            =   6240
         TabIndex        =   74
         Top             =   2880
         Width           =   1935
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Net Salary:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   12
         Left            =   840
         TabIndex        =   73
         Top             =   3600
         Width           =   2175
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "ESIC (Self Contribution):"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   11
         Left            =   840
         TabIndex        =   72
         Top             =   3240
         Width           =   2175
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "PF (Self Contribution):"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   10
         Left            =   840
         TabIndex        =   71
         Top             =   2880
         Width           =   2175
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "DA:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   9
         Left            =   840
         TabIndex        =   70
         Top             =   2520
         Width           =   2175
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "HRA:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   8
         Left            =   840
         TabIndex        =   69
         Top             =   2160
         Width           =   2175
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Basic Salary:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   7
         Left            =   840
         TabIndex        =   68
         Top             =   1800
         Width           =   2175
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Join Date:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   6
         Left            =   840
         TabIndex        =   67
         Top             =   1320
         Width           =   2175
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Department:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   5
         Left            =   840
         TabIndex        =   66
         Top             =   960
         Width           =   2175
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Designation:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   4
         Left            =   6360
         TabIndex        =   65
         Top             =   960
         Width           =   1575
      End
      Begin VB.Label lblAhCurBal 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "0.00 __"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   285
         Left            =   3120
         TabIndex        =   28
         Top             =   5640
         Width           =   1935
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Current Balance:"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   2
         Left            =   840
         TabIndex        =   45
         Top             =   5640
         Width           =   2175
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Opening Balance:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   1
         Left            =   840
         TabIndex        =   44
         Top             =   5280
         Width           =   2175
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Employee Name:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   0
         Left            =   840
         TabIndex        =   36
         Top             =   600
         Width           =   1575
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Code:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   0
         Left            =   840
         TabIndex        =   35
         Top             =   240
         Width           =   2175
      End
   End
   Begin VB.Frame frCurTotal 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Current Balance:"
      ForeColor       =   &H80000008&
      Height          =   1695
      Left            =   6000
      TabIndex        =   55
      Top             =   7200
      Width           =   3375
      Begin VB.Line Line2 
         X1              =   1440
         X2              =   3135
         Y1              =   1080
         Y2              =   1080
      End
      Begin VB.Label lblCurNetBal 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         Caption         =   "0.00"
         ForeColor       =   &H80000008&
         Height          =   285
         Left            =   1440
         TabIndex        =   61
         Top             =   1200
         Width           =   1695
      End
      Begin VB.Label lblCurCrAmtTot 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         Caption         =   "0.00"
         ForeColor       =   &H80000008&
         Height          =   285
         Left            =   1440
         TabIndex        =   60
         Top             =   720
         Width           =   1695
      End
      Begin VB.Label lblCurDrAmtTot 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         Caption         =   "0.00"
         ForeColor       =   &H80000008&
         Height          =   285
         Left            =   1440
         TabIndex        =   59
         Top             =   360
         Width           =   1695
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Net Balance:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   3
         Left            =   120
         TabIndex        =   58
         Top             =   1200
         Width           =   1455
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Credit Amount:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   2
         Left            =   120
         TabIndex        =   57
         Top             =   720
         Width           =   1335
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Debit Amount:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   1
         Left            =   120
         TabIndex        =   56
         Top             =   360
         Width           =   1335
      End
   End
   Begin VB.Frame frOpnTotal 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Opening Total:"
      ForeColor       =   &H80000008&
      Height          =   1695
      Left            =   2400
      TabIndex        =   48
      Top             =   7200
      Width           =   3375
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Debit Amount:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   6
         Left            =   120
         TabIndex        =   54
         Top             =   360
         Width           =   1335
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Credit Amount:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   7
         Left            =   120
         TabIndex        =   53
         Top             =   720
         Width           =   1335
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Net Balance:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   8
         Left            =   120
         TabIndex        =   52
         Top             =   1200
         Width           =   1455
      End
      Begin VB.Label lblOpnDrAmtTot 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         Caption         =   "0.00"
         ForeColor       =   &H80000008&
         Height          =   285
         Left            =   1440
         TabIndex        =   51
         Top             =   360
         Width           =   1695
      End
      Begin VB.Label lblOpnCrAmtTot 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         Caption         =   "0.00"
         ForeColor       =   &H80000008&
         Height          =   285
         Left            =   1440
         TabIndex        =   50
         Top             =   720
         Width           =   1695
      End
      Begin VB.Label lblOpnNetBal 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         Caption         =   "0.00"
         ForeColor       =   &H80000008&
         Height          =   285
         Left            =   1440
         TabIndex        =   49
         Top             =   1200
         Width           =   1695
      End
      Begin VB.Line Line1 
         X1              =   1440
         X2              =   3135
         Y1              =   1080
         Y2              =   1080
      End
   End
   Begin VB.TextBox txtVoid 
      CausesValidation=   0   'False
      Height          =   375
      Left            =   120
      TabIndex        =   30
      TabStop         =   0   'False
      Text            =   "Void"
      Top             =   8520
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
      TabIndex        =   38
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
      TabIndex        =   37
      TabStop         =   0   'False
      Top             =   0
      Width           =   255
   End
   Begin VB.ComboBox cmbFormEntryMode 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   315
      ItemData        =   "EmpAcMst.frx":0000
      Left            =   0
      List            =   "EmpAcMst.frx":000D
      Style           =   1  'Simple Combo
      TabIndex        =   34
      TabStop         =   0   'False
      Text            =   "cmbFormMode"
      Top             =   360
      Width           =   1455
   End
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Employee Master"
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
      TabIndex        =   31
      Top             =   0
      Width           =   9015
   End
End
Attribute VB_Name = "frmEmployeeAccountMast"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim mFormLoaded As Boolean, mLastKeyPressed As Integer, mMaskKeyPressed As Integer
Dim mAhCode As Long
Dim mRemoteAccess As Boolean, mEntrySaved As Boolean, mEntryAborted As Boolean
Dim dbAcDatabase As New ADODB.Connection, dbPyrDatabase As New ADODB.Connection, dbGrpDatabase As New ADODB.Connection, dbComDatabase As New ADODB.Connection
Dim datRecset As New ADODB.Recordset
Dim mAhName_old As String
Dim clsAH As clsAccountHead, clsEMP As clsPayrollMasterEntry, clsDPT As clsPayrollMasterEntry, clsDSG As clsPayrollMasterEntry, mActiveControl As Object, clsListStru As clsSelectQueryStructure
Dim fcmbDptName As clsPyrFlexSearch, fcmbDsgName As clsPyrFlexSearch

Private Type SmryPara
mCombinedOpBal As Integer
mCombinedCurBal As Integer
mOpBal As Integer
mCurBal As Integer
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
mAhCode = mAccessCode
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

Public Property Get AhName() As String
AhName = txtAhName.Text
End Property

Public Property Get FormAddEditMode() As Integer
FormAddEditMode = cmbFormEntryMode.ListIndex
End Property

Public Property Let FormAddEditMode(ByVal New_FormEntryMode As Integer)
cmbFormEntryMode.ListIndex = New_FormEntryMode
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

Private Sub chkEmpAddOT_GotFocus()
FlashActiveControl chkEmpAddOT, True
End Sub

Private Sub chkEmpAddOT_LostFocus()
FlashActiveControl chkEmpAddOT, False
End Sub

Private Sub chkEmpCutUT_GotFocus()
FlashActiveControl chkEmpCutUT, True
End Sub

Private Sub chkEmpCutUT_LostFocus()
FlashActiveControl chkEmpCutUT, False
End Sub

Private Sub chkOpBal_GotFocus()
FlashActiveControl chkOpBal, True
End Sub

Private Sub chkOpBal_LostFocus()
FlashActiveControl chkOpBal, False
End Sub

Private Sub cmbJobStateName_GotFocus()
FlashActiveControl cmbJobStateName, True
End Sub

Private Sub cmbJobStateName_LostFocus()
FlashActiveControl cmbJobStateName, False
End Sub

Private Sub cmbSftName_GotFocus()
FlashActiveControl cmbSftName, True
End Sub

Private Sub cmbSftName_LostFocus()
FlashActiveControl cmbSftName, False
End Sub

Private Sub cmbWeeklyOff_GotFocus()
FlashActiveControl cmbWeeklyOff, True
End Sub

Private Sub cmbWeeklyOff_LostFocus()
FlashActiveControl cmbWeeklyOff, False
End Sub

Private Sub cmbWeeklyOff_Validate(Cancel As Boolean)
If cmbWeeklyOff.ListIndex < 0 Then
    ErrorBox "Invalid Weekly Off !!!"
    cmbWeeklyOff.SetFocus
    Cancel = True
End If

End Sub

Private Sub cmbJobStateName_Validate(Cancel As Boolean)
If cmbJobStateName.ListIndex < 0 Then
    ErrorBox "Invalid Employee Job Status !!!"
    cmbJobStateName.SetFocus
    Cancel = True
End If

End Sub

Private Sub cmbSftName_Validate(Cancel As Boolean)
If cmbSftName.ListIndex < 0 Then
    ErrorBox "Invalid Shift !!!"
    cmbSftName.SetFocus
    Cancel = True
End If

End Sub

Private Sub cmdConfigure_Click()
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
        txtAhName.SetFocus
    End If
End If

End Sub

Private Sub cmdSaveForm_Click()
Call Data_SaveEvent

Call SmryList
txtSearch1Text_InterActiveChange txtAhName.Text

''datRecset.Find "AhName='" & txtAhName.Text & "'", Start:=1
''ShowRecActiveFlexRow datRecset, Mfgrd1

Call ShowEntryMode(False)
Mfgrd1.SetFocus
Call CalcDrCrAmtTot

End Sub

Private Sub cmdSaveForm_GotFocus()
txtVoid.SetFocus
cmdSaveForm.Enabled = False
If Data_Verify() = True Then
    If CanAccept() = True Then
        Call cmdSaveForm_Click
        If mRemoteAccess = True Then
            ''Unload Me
            Me.Hide
            Exit Sub
        End If
    Else
        txtAhName.SetFocus
    End If
End If
cmdSaveForm.Enabled = True
End Sub

Private Sub dtpEmpJoinDate_GotFocus()
FlashActiveControl dtpEmpJoinDate, True
End Sub

Private Sub dtpEmpJoinDate_LostFocus()
FlashActiveControl dtpEmpJoinDate, False
End Sub

Private Sub dtpEmpJoinDate_Validate(Cancel As Boolean)
Dim tRecset As New ADODB.Recordset
dtpEmpJoinDate.Text = ToMyDate(dtpEmpJoinDate.Text)

With tRecset
.Open "Select top 1 * from Attendance where AtdEmpCode=" & CStr(mAhCode) & " and AtdDate<#" & CStr(ToSysDate(Ctod(dtpEmpJoinDate.Text))) & "#", dbPyrDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    ErrorBox "Attendance Entries Exist on Date " & CStr(Dtoc(.Fields("AtdDate"))) & " !!!"
    dtpEmpJoinDate.SetFocus
    Cancel = True
End If
End With
CloseTable tRecset

End Sub

Private Sub Form_Activate()
If mFormLoaded = False Then
    If mRemoteAccess = True Then
        If mAhCode = 0 Then
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
mFormLoaded = False
mEntrySaved = False: mEntryAborted = False
SetFormSize Me, frmMain
Call Form_Resize

Call SetVoidControl(txtVoid)
txtSearch1Text.Enabled = False
frConfigure.Visible = False
mskEmpNSalary.Enabled = False

Call RestoreDefaultSmryPara
Call SaveSmryPara

OpenAcDataSource dbAcDatabase
OpenPyrDataSource dbPyrDatabase
OpenGrpDataSource dbGrpDatabase
OpenComDataSource dbComDatabase

cmbWeeklyOff.Clear
cmbWeeklyOff.AddItem "Sunday" & Space(50) & "_" & cATNDWOFF_SUNDAY
cmbWeeklyOff.AddItem "Monday" & Space(50) & "_" & cATNDWOFF_MONDAY
cmbWeeklyOff.AddItem "Tuesday" & Space(50) & "_" & cATNDWOFF_TUESDAY
cmbWeeklyOff.AddItem "Wednusday" & Space(50) & "_" & cATNDWOFF_WEDNUSDAY
cmbWeeklyOff.AddItem "Thursday" & Space(50) & "_" & cATNDWOFF_THURSDAY
cmbWeeklyOff.AddItem "Friday" & Space(50) & "_" & cATNDWOFF_FRIDAY
cmbWeeklyOff.AddItem "Saturday" & Space(50) & "_" & cATNDWOFF_SATURDAY
cmbWeeklyOff.AddItem "None" & Space(50) & "_" & cATNDWOFF_NONE

cmbSftName.Clear
cmbSftName.AddItem "Day" & Space(50) & "_" & CStr(cATNDSFT_DAY)
cmbSftName.AddItem "Night" & Space(50) & "_" & CStr(cATNDSFT_NIGHT)

cmbJobStateName.Clear
cmbJobStateName.AddItem "Continued" & Space(50) & "_" & CStr(cATNDJSTAT_CONTINUED)
cmbJobStateName.AddItem "Discontinued" & Space(50) & "_" & CStr(cATNDJSTAT_DISCONTINUED)

Set clsAH = New clsAccountHead
Set clsAH.dbAcDatabase = dbAcDatabase
Set clsAH.dbGrpDatabase = dbGrpDatabase
Set clsListStru = New clsSelectQueryStructure

Set clsEMP = New clsPayrollMasterEntry
Set clsEMP.dbAcDatabase = dbAcDatabase
Set clsEMP.dbPyrDatabase = dbPyrDatabase
clsEMP.MastName = "EmpMast"

Set clsDPT = New clsPayrollMasterEntry
Set clsDPT.dbPyrDatabase = dbPyrDatabase
clsDPT.MastName = "DeptMast"

Set clsDSG = New clsPayrollMasterEntry
Set clsDSG.dbPyrDatabase = dbPyrDatabase
clsDSG.MastName = "DesgMast"

Set fcmbDptName = New clsPyrFlexSearch
Set fcmbDptName.dbPyrDatabase = dbPyrDatabase
fcmbDptName.mDeptMastList = True
fcmbDptName.Init

Set fcmbDsgName = New clsPyrFlexSearch
Set fcmbDsgName.dbPyrDatabase = dbPyrDatabase
fcmbDsgName.mDesgMastList = True
fcmbDsgName.Init

If mRemoteAccess = True Then
    datRecset.Open "Select * from AchdMast inner join EmpMast on AchdMast.AhCode=EmpMast.EmpCode where AhCode=" & CStr(mAhCode) & " order by AhName", dbComDatabase, adOpenKeyset, adLockOptimistic
Else
    datRecset.Open "Select * from AchdMast inner join EmpMast on AchdMast.AhCode=EmpMast.EmpCode order by AhName", dbComDatabase, adOpenKeyset, adLockOptimistic
End If
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
Set clsAH = Nothing
Set clsEMP = Nothing
Set clsDPT = Nothing
Set clsDSG = Nothing
Set fcmbDptName = Nothing
Set fcmbDsgName = Nothing
Set clsListStru = Nothing

CloseTable datRecset
CloseDataSource dbAcDatabase
CloseDataSource dbPyrDatabase
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
frOpnTotal.Visible = Not EntryMode
frCurTotal.Visible = Not EntryMode
If EntryMode = False Then
    FormAddEditMode = cFORM_SMRYMODE
End If

End Sub

Private Function Data_Verify() As Boolean
Dim tRecset As New ADODB.Recordset

Data_Verify = False
If Val(mskFormBoundField.Text) < 1 Then
    ErrorBox "Invalid Key Value !!!"
    txtAhName.SetFocus
    GoTo EndSub
End If
If Trim(txtAhName.Text) = "" Then
    ErrorBox "Invalid Account Head Name !!!"
    txtAhName.SetFocus
    GoTo EndSub
End If
If txtAhName.Text <> mAhName_old Then
    If ChkDuplicate(dbAcDatabase, "Achdmast", "Ahname", txtAhName.Text, "Ahcode", Val(mskFormBoundField.Text)) = True Then
        ErrorBox "Duplicate Input !!!"
        txtAhName.SetFocus
        GoTo EndSub
    End If
End If
If Val(fcmbDptName.BoundText) <= 0 Then
    ErrorBox "Invalid Department Name !!!"
    txtDptName.SetFocus
    GoTo EndSub
End If
If Val(fcmbDsgName.BoundText) <= 0 Then
    ErrorBox "Invalid Designation Name !!!"
    txtDsgName.SetFocus
    GoTo EndSub
End If

Rem checking join date validity
With tRecset
.Open "Select top 1 * from Attendance where AtdEmpCode=" & CStr(mAhCode) & " and AtdDate<#" & CStr(ToSysDate(Ctod(dtpEmpJoinDate.Text))) & "#", dbPyrDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    ErrorBox "Attendance Entries Exist on Date " & CStr(Dtoc(.Fields("AtdDate"))) & " !!!"
    dtpEmpJoinDate.SetFocus
    CloseTable tRecset
    GoTo EndSub
Else
    CloseTable tRecset
End If
End With

Call Calc_PerAmt
Call Calc_NetSalary
If Val(UnMyNumFmt(mskEmpBSalary.Text)) < 0 Then
    ErrorBox "Invalid Basic Salary !!!"
    mskEmpBSalary.SetFocus
    GoTo EndSub
End If

If Val(UnMyPerFmt(mskEmpHRAPer.Text)) < 0 Then
    ErrorBox "Invalid HRA Percentage !!!"
    mskEmpHRAPer.SetFocus
    GoTo EndSub
End If

If Val(UnMyNumFmt(mskEmpHRAAmt.Text)) < 0 Then
    ErrorBox "Invalid HRA Amount !!!"
    mskEmpHRAAmt.SetFocus
    GoTo EndSub
End If

If Val(UnMyPerFmt(mskEmpDAPer.Text)) < 0 Then
    ErrorBox "Invalid DA Percentage !!!"
    mskEmpDAPer.SetFocus
    GoTo EndSub
End If

If Val(UnMyPerFmt(mskEmpSelfPFPer.Text)) < 0 Then
    ErrorBox "Invalid Self PF Contribution Percentage !!!"
    mskEmpSelfPFPer.SetFocus
    GoTo EndSub
End If

If Val(UnMyNumFmt(mskEmpSelfPFAmt.Text)) < 0 Then
    ErrorBox "Invalid Self PF Contribution Amount !!!"
    mskEmpSelfPFAmt.SetFocus
    GoTo EndSub
End If

If Val(UnMyPerFmt(mskEmpCoPFPer.Text)) < 0 Then
    ErrorBox "Invalid Company PF Contribution Percentage !!!"
    mskEmpCoPFPer.SetFocus
    GoTo EndSub
End If

If Val(UnMyNumFmt(mskEmpCoPFAmt.Text)) < 0 Then
    ErrorBox "Invalid Company PF Contribution Amount !!!"
    mskEmpCoPFAmt.SetFocus
    GoTo EndSub
End If

If Val(UnMyPerFmt(mskEmpSelfESICPer.Text)) < 0 Then
    ErrorBox "Invalid Self ESIC Contribution Percentage !!!"
    mskEmpSelfESICPer.SetFocus
    GoTo EndSub
End If

If Val(UnMyNumFmt(mskEmpSelfESICAmt.Text)) < 0 Then
    ErrorBox "Invalid Self ESIC Contribution Amount !!!"
    mskEmpSelfESICAmt.SetFocus
    GoTo EndSub
End If

If TimeToMin(txtWrkTimeStr.Text) > 24 * 60 Then
    ErrorBox "Working Hours be Less than or Equal to 24 Hours !!!"
    txtWrkTimeStr.SetFocus
    GoTo EndSub
ElseIf TimeToMin(txtWrkTimeStr.Text) <= 0 Then
    ErrorBox "Invalid Working Hours !!!"
    txtWrkTimeStr.SetFocus
    GoTo EndSub
End If

If TimeToMin(txtHalfDayTimeStr.Text) >= TimeToMin(txtWrkTimeStr.Text) Then
    ErrorBox "Half Day Hours be Less than Working Hours !!!"
    txtHalfDayTimeStr.SetFocus
    GoTo EndSub
ElseIf TimeToMin(txtHalfDayTimeStr.Text) > 24 * 60 Then
    ErrorBox "Half Day Hours be Less than or Equal to 24 Hours !!!"
    txtHalfDayTimeStr.SetFocus
    GoTo EndSub
ElseIf TimeToMin(txtHalfDayTimeStr.Text) <= 0 Then
    ErrorBox "Invalid Half Day Hours !!!"
    txtHalfDayTimeStr.SetFocus
    GoTo EndSub
End If

If TimeToMin(txtMinWrkTimeStr.Text) > TimeToMin(txtWrkTimeStr.Text) Then
    ErrorBox "Minimum Working Hours be Less than or Equal to Working Hours !!!"
    txtMinWrkTimeStr.SetFocus
    GoTo EndSub
'ElseIf TimeToMin(txtMinWrkTimeStr.Text) > TimeToMin(txtHalfDayTimeStr.Text) Then
'    ErrorBox "Minimum Working Hours be Less than or Equal to Half Day Hours !!!"
'    txtMinWrkTimeStr.SetFocus
'    GoTo EndSub
ElseIf TimeToMin(txtMinWrkTimeStr.Text) > 24 * 60 Then
    ErrorBox "Minimum Working Hours be Less than or Equal to 24 Hours !!!"
    txtMinWrkTimeStr.SetFocus
    GoTo EndSub
ElseIf TimeToMin(txtMinWrkTimeStr.Text) <= 0 Then
    ErrorBox "Invalid Minimum Working Hours !!!"
    txtMinWrkTimeStr.SetFocus
    GoTo EndSub
End If

If Val(UnMyNumFmt(mskEmpMnLeaves.Text)) < 0 Then
    ErrorBox "Invalid Allowed Leaves Count !!!"
    mskEmpMnLeaves.SetFocus
    GoTo EndSub
End If

If cmbWeeklyOff.ListIndex < 0 Then
    ErrorBox "Invalid Weekly Off !!!"
    cmbWeeklyOff.SetFocus
    GoTo EndSub
End If

If cmbSftName.ListIndex < 0 Then
    ErrorBox "Invalid Shift !!!"
    cmbSftName.SetFocus
    GoTo EndSub
End If

If cmbJobStateName.ListIndex < 0 Then
    ErrorBox "Invalid Employee Job Status !!!"
    cmbJobStateName.SetFocus
    GoTo EndSub
End If

Data_Verify = True

EndSub:
Set tRecset = Nothing
Exit Function

End Function

Private Sub mskAhOpBal_GotFocus()
FlashActiveControl mskAhOpBal, True
End Sub

Private Sub mskAhOpBal_LostFocus()
FlashActiveControl mskAhOpBal, False
End Sub

Private Sub mskAhOpBal_Validate(Cancel As Boolean)
mskAhOpBal.Text = ToMyNumFmt(mskAhOpBal.Text)
End Sub

Private Sub mskEmpBSalary_GotFocus()
FlashActiveControl mskEmpBSalary, True
End Sub

Private Sub mskEmpBSalary_LostFocus()
FlashActiveControl mskEmpBSalary, False
End Sub

Private Sub mskEmpBSalary_Validate(Cancel As Boolean)
mskEmpBSalary.Text = ToMyNumFmt(mskEmpBSalary.Text)
If Val(UnMyNumFmt(mskEmpBSalary.Text)) < 0 Then
    ErrorBox "Invalid Basic Salary !!!"
    mskEmpBSalary.SetFocus
    Cancel = True
Else
    Call Calc_PerAmt
    Call Calc_NetSalary
End If

End Sub

Private Sub mskEmpCoPFAmt_GotFocus()
FlashActiveControl mskEmpCoPFAmt, True
End Sub

Private Sub mskEmpCoPFAmt_LostFocus()
FlashActiveControl mskEmpCoPFAmt, False
End Sub

Private Sub mskEmpCoPFAmt_Validate(Cancel As Boolean)
mskEmpCoPFAmt.Text = ToMyNumFmt(mskEmpCoPFAmt.Text)
If Val(UnMyNumFmt(mskEmpCoPFAmt.Text)) < 0 Then
    ErrorBox "Invalid Company PF Contribution Amount !!!"
    mskEmpCoPFAmt.SetFocus
    Cancel = True
Else
    Call Calc_PerAmt
    Call Calc_NetSalary
End If

End Sub

Private Sub mskEmpCoPFPer_GotFocus()
FlashActiveControl mskEmpCoPFPer, True
End Sub

Private Sub mskEmpCoPFPer_LostFocus()
FlashActiveControl mskEmpCoPFPer, False
End Sub

Private Sub mskEmpCoPFPer_Validate(Cancel As Boolean)
mskEmpCoPFPer.Text = ToMyPerFmt(mskEmpCoPFPer.Text)
If Val(UnMyPerFmt(mskEmpCoPFPer.Text)) < 0 Then
    ErrorBox "Invalid Company PF Contribution Percentage !!!"
    mskEmpCoPFPer.SetFocus
    Cancel = True
Else
    Call Calc_PerAmt
    Call Calc_NetSalary
End If

End Sub

Private Sub mskEmpDAAmt_GotFocus()
FlashActiveControl mskEmpDAAmt, True
End Sub

Private Sub mskEmpDAAmt_LostFocus()
FlashActiveControl mskEmpDAAmt, False
End Sub

Private Sub mskEmpDAAmt_Validate(Cancel As Boolean)
mskEmpDAAmt.Text = ToMyNumFmt(mskEmpDAAmt.Text)
If Val(UnMyNumFmt(mskEmpDAAmt.Text)) < 0 Then
    ErrorBox "Invalid DA Amount !!!"
    mskEmpDAAmt.SetFocus
    Cancel = True
Else
    Call Calc_PerAmt
    Call Calc_NetSalary
End If

End Sub

Private Sub mskEmpDAPer_GotFocus()
FlashActiveControl mskEmpDAPer, True
End Sub

Private Sub mskEmpDAPer_LostFocus()
FlashActiveControl mskEmpDAPer, False
End Sub

Private Sub mskEmpDAPer_Validate(Cancel As Boolean)
mskEmpDAPer.Text = ToMyPerFmt(mskEmpDAPer.Text)
If Val(UnMyPerFmt(mskEmpDAPer.Text)) < 0 Then
    ErrorBox "Invalid DA Percentage !!!"
    mskEmpDAPer.SetFocus
    Cancel = True
Else
    Call Calc_PerAmt
    Call Calc_NetSalary
End If

End Sub

Private Sub mskEmpHRAAmt_GotFocus()
FlashActiveControl mskEmpHRAAmt, True
End Sub

Private Sub mskEmpHRAAmt_LostFocus()
FlashActiveControl mskEmpHRAAmt, False
End Sub

Private Sub mskEmpHRAAmt_Validate(Cancel As Boolean)
mskEmpHRAAmt.Text = ToMyNumFmt(mskEmpHRAAmt.Text)
If Val(UnMyNumFmt(mskEmpHRAAmt.Text)) < 0 Then
    ErrorBox "Invalid HRA Amount !!!"
    mskEmpHRAAmt.SetFocus
    Cancel = True
Else
    Call Calc_PerAmt
    Call Calc_NetSalary
End If

End Sub

Private Sub mskEmpHRAPer_GotFocus()
FlashActiveControl mskEmpHRAPer, True
End Sub

Private Sub mskEmpHRAPer_LostFocus()
FlashActiveControl mskEmpHRAPer, False
End Sub

Private Sub mskEmpHRAPer_Validate(Cancel As Boolean)
mskEmpHRAPer.Text = ToMyPerFmt(mskEmpHRAPer.Text)
If Val(UnMyPerFmt(mskEmpHRAPer.Text)) < 0 Then
    ErrorBox "Invalid HRA Percentage !!!"
    mskEmpHRAPer.SetFocus
    Cancel = True
Else
    Call Calc_PerAmt
    Call Calc_NetSalary
End If

End Sub

Private Sub mskEmpMnLeaves_GotFocus()
FlashActiveControl mskEmpMnLeaves, True
End Sub

Private Sub mskEmpMnLeaves_LostFocus()
FlashActiveControl mskEmpMnLeaves, False
End Sub

Private Sub mskEmpMnLeaves_Validate(Cancel As Boolean)
mskEmpMnLeaves.Text = ToMyNumFmt(mskEmpMnLeaves.Text)
If Val(UnMyNumFmt(mskEmpMnLeaves.Text)) < 0 Then
    ErrorBox "Invalid Allowed Leaves Count !!!"
    mskEmpMnLeaves.SetFocus
    Cancel = True
End If

End Sub

Private Sub mskEmpNSalary_GotFocus()
FlashActiveControl mskEmpNSalary, True
End Sub

Private Sub mskEmpNSalary_LostFocus()
FlashActiveControl mskEmpNSalary, False
End Sub

Private Sub mskEmpSelfESICAmt_GotFocus()
FlashActiveControl mskEmpSelfESICAmt, True
End Sub

Private Sub mskEmpSelfESICAmt_LostFocus()
FlashActiveControl mskEmpSelfESICAmt, False
End Sub

Private Sub mskEmpSelfESICAmt_Validate(Cancel As Boolean)
mskEmpSelfESICAmt.Text = ToMyNumFmt(mskEmpSelfESICAmt.Text)
If Val(UnMyNumFmt(mskEmpSelfESICAmt.Text)) < 0 Then
    ErrorBox "Invalid Self ESIC Contribution Amount !!!"
    mskEmpSelfESICAmt.SetFocus
    Cancel = True
Else
    Call Calc_PerAmt
    Call Calc_NetSalary
End If

End Sub

Private Sub mskEmpSelfESICPer_GotFocus()
FlashActiveControl mskEmpSelfESICPer, True
End Sub

Private Sub mskEmpSelfESICPer_LostFocus()
FlashActiveControl mskEmpSelfESICPer, False
End Sub

Private Sub mskEmpSelfESICPer_Validate(Cancel As Boolean)
mskEmpSelfESICPer.Text = ToMyPerFmt(mskEmpSelfESICPer.Text)
If Val(UnMyPerFmt(mskEmpSelfESICPer.Text)) < 0 Then
    ErrorBox "Invalid Self ESIC Contribution Percentage !!!"
    mskEmpSelfESICPer.SetFocus
    Cancel = True
Else
    Call Calc_PerAmt
    Call Calc_NetSalary
End If

End Sub

Private Sub mskEmpSelfPFAmt_GotFocus()
FlashActiveControl mskEmpSelfPFAmt, True
End Sub

Private Sub mskEmpSelfPFAmt_LostFocus()
FlashActiveControl mskEmpSelfPFAmt, False
End Sub

Private Sub mskEmpSelfPFAmt_Validate(Cancel As Boolean)
mskEmpSelfPFAmt.Text = ToMyNumFmt(mskEmpSelfPFAmt.Text)
If Val(UnMyNumFmt(mskEmpSelfPFAmt.Text)) < 0 Then
    ErrorBox "Invalid Self PF Contribution Amount !!!"
    mskEmpSelfPFAmt.SetFocus
    Cancel = True
Else
    Call Calc_PerAmt
    Call Calc_NetSalary
End If

End Sub

Private Sub mskEmpSelfPFPer_GotFocus()
FlashActiveControl mskEmpSelfPFPer, True
End Sub

Private Sub mskEmpSelfPFPer_LostFocus()
FlashActiveControl mskEmpSelfPFPer, False
End Sub

Private Sub mskEmpSelfPFPer_Validate(Cancel As Boolean)
mskEmpSelfPFPer.Text = ToMyPerFmt(mskEmpSelfPFPer.Text)
If Val(UnMyPerFmt(mskEmpSelfPFPer.Text)) < 0 Then
    ErrorBox "Invalid Self PF Contribution Percentage !!!"
    mskEmpSelfPFPer.SetFocus
    Cancel = True
Else
    Call Calc_PerAmt
    Call Calc_NetSalary
End If

End Sub

Private Sub txtAhname_GotFocus()
FlashActiveControl txtAhName, True
End Sub

Private Sub txtAhName_LostFocus()
FlashActiveControl txtAhName, False
End Sub

Private Sub txtAhname_Validate(Cancel As Boolean)
txtAhName.Text = ToMyString(txtAhName.Text)
If Trim(txtAhName.Text) = "" Then
    ErrorBox "Invalid Input !!!"
    Cancel = True
    txtAhName.SetFocus
Else
    If txtAhName.Text <> mAhName_old Then
        If ChkDuplicate(dbAcDatabase, "Achdmast", "Ahname", txtAhName.Text, "Ahcode", Val(mskFormBoundField.Text)) = True Then
            ErrorBox "Duplicate Input !!!"
            Cancel = True
            txtAhName.SetFocus
        End If
    End If
End If

End Sub

Private Sub Data_AddEvent()
If clsAH.BeginAchd(0) = False Then
    Exit Sub
Else
    If clsEMP.BeginMast(0, clsAH.ActiveAhCode) = False Then
        Exit Sub
    End If
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_ADDMODE
    
clsAH.Clear: clsEMP.Clear
mAhCode = clsAH.ActiveAhCode
mskFormBoundField.Text = mAhCode
txtAhName.Text = ""
fcmbDptName.BoundText = "": txtDptName.Text = ""
fcmbDsgName.BoundText = "": txtDsgName.Text = ""
dtpEmpJoinDate.Text = Dtoc(sDefaultDate)
mskEmpBSalary.Text = ToMyNumFmt(0)
mskEmpHRAPer.Text = ToMyPerFmt(0)
mskEmpHRAAmt.Text = ToMyNumFmt(0)
mskEmpDAPer.Text = ToMyPerFmt(0)
mskEmpDAAmt.Text = ToMyNumFmt(0)
mskEmpSelfPFPer.Text = ToMyPerFmt(0)
mskEmpSelfPFAmt.Text = ToMyNumFmt(0)
mskEmpCoPFPer.Text = ToMyPerFmt(0)
mskEmpCoPFAmt.Text = ToMyNumFmt(0)
mskEmpSelfESICPer.Text = ToMyPerFmt(0)
mskEmpSelfESICAmt.Text = ToMyNumFmt(0)
mskEmpNSalary.Text = ToMyNumFmt(0)
txtWrkTimeStr.Text = MinToTime(480)
txtHalfDayTimeStr.Text = MinToTime(240)
txtMinWrkTimeStr.Text = MinToTime(240)
chkEmpAddOT.Value = vbUnchecked
chkEmpCutUT.Value = vbUnchecked
mskEmpMnLeaves.Text = ToMyNumFmt(0)
cmbWeeklyOff.ListIndex = 0
cmbSftName.ListIndex = 0
cmbJobStateName.ListIndex = 0

mskAhOpBal.Text = ToMyNumFmt(0)
lblAhCurBal.Caption = ToMyAcFmt(0)
txtDrCrFlag.Text = SenseDrCrFlag(0)

mAhName_old = txtAhName.Text

Call ShowEntryMode(True)
txtAhName.SetFocus

End Sub

Private Sub Data_EditEvent()
Dim mOpnBal As Double, mCurBal As Double, mLCount As Integer, mUCount As Integer, mCount As Integer

If clsAH.BeginAchd(datRecset.Fields("AhCode")) = False Or clsEMP.BeginMast(datRecset.Fields("AhCode")) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_EDITMODE
With datRecset
mAhCode = .Fields("AhCode")
clsAH.GetData mAhCode: clsEMP.GetData mAhCode
mskFormBoundField.Text = CStr(.Fields("AhCode"))
txtAhName.Text = .Fields("AhName")
fcmbDptName.BoundText = CStr(.Fields("EmpDptCode")): txtDptName.Text = fcmbDptName.Text
fcmbDsgName.BoundText = CStr(.Fields("EmpDsgCode")): txtDsgName.Text = fcmbDsgName.Text
dtpEmpJoinDate.Text = Dtoc(.Fields("EmpJoinDate"))
mskEmpBSalary.Text = ToMyNumFmt(.Fields("EmpBSalary"))
mskEmpHRAPer.Text = ToMyPerFmt(.Fields("EmpHRAPer"))
mskEmpHRAAmt.Text = ToMyNumFmt(.Fields("EmpHRAAmt"))
mskEmpDAPer.Text = ToMyPerFmt(.Fields("EmpDAPer"))
mskEmpDAAmt.Text = ToMyNumFmt(.Fields("EmpDAAmt"))
mskEmpSelfPFPer.Text = ToMyPerFmt(.Fields("EmpSelfPFPer"))
mskEmpSelfPFAmt.Text = ToMyNumFmt(.Fields("EmpSelfPFAmt"))
mskEmpCoPFPer.Text = ToMyPerFmt(.Fields("EmpCoPFPer"))
mskEmpCoPFAmt.Text = ToMyNumFmt(.Fields("EmpCoPFAmt"))
mskEmpSelfESICPer.Text = ToMyPerFmt(.Fields("EmpSelfESICPer"))
mskEmpSelfESICAmt.Text = ToMyNumFmt(.Fields("EmpSelfESICAmt"))
mskEmpNSalary.Text = ToMyNumFmt(.Fields("EmpNSalary"))
txtWrkTimeStr.Text = MinToTime(.Fields("EmpWrkTime"))
txtHalfDayTimeStr.Text = MinToTime(.Fields("EmpHalfDayTime"))
txtMinWrkTimeStr.Text = MinToTime(.Fields("EmpMinWrkTime"))
chkEmpAddOT.Value = IIf(.Fields("EmpAddOT") = -1, vbChecked, vbUnchecked)
chkEmpCutUT.Value = IIf(.Fields("EmpCutUT") = -1, vbChecked, vbUnchecked)
mskEmpMnLeaves.Text = ToMyNumFmt(.Fields("EmpMnLeaves"))
cmbWeeklyOff.ListIndex = .Fields("EmpWeeklyOff") - 1
cmbSftName.ListIndex = .Fields("EmpSftCode") - 1
cmbJobStateName.ListIndex = .Fields("EmpJobState") - 1

End With

mOpnBal = 0
With clsAH
Rem opn balance
mLCount = .LOpnBal
mUCount = .UOpnBal
For mCount = mLCount To mUCount
    mOpnBal = mOpnBal + .OpnAmt(mCount)
Next mCount

Rem current balance
mLCount = .LCurBal
mUCount = .UCurBal
For mCount = mLCount To mUCount
    mCurBal = mCurBal + .CurAmt(mCount)
Next mCount
End With

mskAhOpBal.Text = ToMyNumFmt(mOpnBal, mUseAbs:=True)
lblAhCurBal.Caption = ToMyAcFmt(mCurBal)
txtDrCrFlag.Text = SenseDrCrFlag(mOpnBal)

mAhName_old = txtAhName.Text

Call ShowEntryMode(True)
txtAhName.SetFocus

End Sub

Private Sub Data_SaveEvent()
With clsAH
If FormAddEditMode = cFORM_ADDMODE Then
    .Clear: clsEMP.Clear
Else
    .GetData mAhCode: clsEMP.GetData mAhCode
End If

.mAhName_str = txtAhName.Text
clsEMP.mEmpDptCode_lng = Val(fcmbDptName.BoundText)
clsEMP.mEmpDsgCode_lng = Val(fcmbDsgName.BoundText)
clsEMP.mEmpJoinDate_dt = Ctod(dtpEmpJoinDate.Text)
clsEMP.mEmpBSalary_dbl = Val(UnMyNumFmt(mskEmpBSalary.Text))
clsEMP.mEmpHRAPer_dbl = Val(UnMyPerFmt(mskEmpHRAPer.Text))
clsEMP.mEmpHRAAmt_dbl = Val(UnMyNumFmt(mskEmpHRAAmt.Text))
clsEMP.mEmpDAPer_dbl = Val(UnMyPerFmt(mskEmpDAPer.Text))
clsEMP.mEmpDAAmt_dbl = Val(UnMyNumFmt(mskEmpDAAmt.Text))
clsEMP.mEmpSelfPFPer_dbl = Val(UnMyPerFmt(mskEmpSelfPFPer.Text))
clsEMP.mEmpSelfPFAmt_dbl = Val(UnMyNumFmt(mskEmpSelfPFAmt.Text))
clsEMP.mEmpCoPFPer_dbl = Val(UnMyPerFmt(mskEmpCoPFPer.Text))
clsEMP.mEmpCoPFAmt_dbl = Val(UnMyNumFmt(mskEmpCoPFAmt.Text))
clsEMP.mEmpSelfESICPer_dbl = Val(UnMyPerFmt(mskEmpSelfESICPer.Text))
clsEMP.mEmpSelfESICAmt_dbl = Val(UnMyNumFmt(mskEmpSelfESICAmt.Text))
clsEMP.mEmpNSalary_dbl = Val(UnMyNumFmt(mskEmpNSalary.Text))
clsEMP.mEmpWrkTime_lng = TimeToMin(txtWrkTimeStr.Text)
clsEMP.mEmpHalfDayTime_lng = TimeToMin(txtHalfDayTimeStr.Text)
clsEMP.mEmpMinWrkTime_lng = TimeToMin(txtMinWrkTimeStr.Text)
clsEMP.mEmpAddOT_bln = (chkEmpAddOT.Value = vbChecked)
clsEMP.mEmpCutUT_bln = (chkEmpCutUT.Value = vbChecked)
clsEMP.mEmpMnLeaves_dbl = Val(UnMyNumFmt(mskEmpMnLeaves.Text))
clsEMP.mEmpWeeklyOff_int = Val(Right(cmbWeeklyOff.List(cmbWeeklyOff.ListIndex), 1))
clsEMP.mEmpJobState_int = Val(Right(cmbJobStateName.List(cmbJobStateName.ListIndex), 1))
clsEMP.mEmpSftCode_int = Val(Right(cmbSftName.List(cmbSftName.ListIndex), 1))

If FormAddEditMode = cFORM_ADDMODE Then
    .AddOpnBal mJrnAmt:=Val(UnMyAcFmt(mskAhOpBal.Text, txtDrCrFlag.Text))
    
    .AddNew: clsEMP.AddNew .mAhCode_lng
    mskFormBoundField.Text = .mAhCode_lng
Else
    .EditOpnBal mJrnICode:=.OpnICode(.LOpnBal), mJrnAmt:=Val(UnMyAcFmt(mskAhOpBal.Text, txtDrCrFlag.Text))
    
    .Update mAhCode: clsEMP.Update mAhCode
End If
If .mAhCode_lng > 0 Then   ' updated successfully
    .UpdateAchd .mAhCode_lng: clsEMP.UpdateMast .mAhCode_lng
    .EndAchd .mAhCode_lng: clsEMP.EndMast .mAhCode_lng
    
    mEntrySaved = True
Else
    Call Data_CancelEvent
    ErrorBox "Entry Cancelled !!!"
End If

End With

End Sub

Private Sub Data_DeleteEvent()
Dim mDeleteit As Boolean, mRecAbsPos As Long
If (datRecset.EOF Or datRecset.BOF) = True Then
    Exit Sub
End If

mAhCode = datRecset.Fields("Ahcode")
mRecAbsPos = datRecset.AbsolutePosition

If clsAH.CanDeleteAchd(mAhCode) = True And clsEMP.CanDeleteMast(mAhCode, mSkipConfirm:=True) = True Then
    txtVoid.SetFocus
    If clsAH.BeginAchd(mAhCode) = True And clsEMP.BeginMast(mAhCode) = True Then
        clsAH.DeleteAchd mAhCode: clsEMP.DeleteMast mAhCode
        clsAH.UpdateAchd mAhCode: clsEMP.UpdateMast mAhCode
        clsAH.EndAchd mAhCode: clsEMP.EndMast mAhCode
        
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

End Sub

Private Sub Data_CancelEvent()
clsAH.CancelAchd mAhCode: clsEMP.CancelMast mAhCode
clsAH.EndAchd mAhCode: clsEMP.EndMast mAhCode
mEntryAborted = True

End Sub

Private Sub txtDptName_Change()
If fcmbDptName.CallFromText_Change = False Then
    fcmbDptName.CallFromText_Change = True
    If InterActiveChange(txtDptName) = True Then
        fcmbDptName.UserText = Array(txtDptName.Text, txtDptName.SelStart)
        fcmbDptName.Show
        txtDptName.Text = fcmbDptName.Text
        If fcmbDptName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbDptName.CallFromText_Change = False
End If

End Sub

Private Sub txtDptName_GotFocus()
FlashActiveControl txtDptName, True
End Sub

Private Sub txtDptName_LostFocus()
FlashActiveControl txtDptName, False
End Sub

Private Sub txtDptName_Validate(Cancel As Boolean)
If Val(fcmbDptName.BoundText) <= 0 Then
    ErrorBox "Invalid Department Name !!!"
    txtDptName.SetFocus
    Cancel = True
End If

End Sub

Private Sub txtDrCrFlag_Change()
If InterActiveChange(txtDrCrFlag) = True Then
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
End Sub

Private Sub SmryList()
Dim gcolcount As Integer, acount As Integer, mLow As Integer, mHigh As Integer, mPos As Integer, srow As Long, mColCount As Integer
Dim aAcntBal As Variant, mBal As Double

clsListStru.Clear

Rem column definitions
clsListStru.AddFields mExpr:="AhCode", mAttrib:=cFAT_SYSTEM
clsListStru.AddFields mExpr:="AhName", mTitle:="Account Name", mAlign:=flexAlignLeftCenter, mWidth:=4000, mShowItem:=True

clsListStru.AddFields mExpr:="AhOpBal", mTitle:="Op.Balance", mAlign:=flexAlignRightCenter, mWidth:=1750, mShowItem:=False
clsListStru.AddFields mExpr:="AhOpDrBal", mTitle:="Op.Dr.Bal", mAlign:=flexAlignRightCenter, mWidth:=1750, mShowItem:=False
clsListStru.AddFields mExpr:="AhOpCrBal", mTitle:="Op.Cr.Bal", mAlign:=flexAlignRightCenter, mWidth:=1750, mShowItem:=False

clsListStru.AddFields mExpr:="AhCurBal", mTitle:="Cur.Balance", mAlign:=flexAlignRightCenter, mWidth:=1750, mShowItem:=False
clsListStru.AddFields mExpr:="AhCurDrBal", mTitle:="Cur.Dr.Bal", mAlign:=flexAlignRightCenter, mWidth:=1750, mShowItem:=False
clsListStru.AddFields mExpr:="AhCurCrBal", mTitle:="Cur.Cr.Bal", mAlign:=flexAlignRightCenter, mWidth:=1750, mShowItem:=False

clsListStru.AddFields mExpr:="DptName", mTitle:="Department", mAlign:=flexAlignLeftCenter, mWidth:=2000, mShowItem:=True
clsListStru.AddFields mExpr:="DsgName", mTitle:="Designation", mAlign:=flexAlignLeftCenter, mWidth:=2000, mShowItem:=True
clsListStru.AddFields mExpr:="BSalary", mTitle:="Basic Salary", mAlign:=flexAlignRightCenter, mWidth:=2000, mShowItem:=True

If chkOpBal.Value = 1 Then
    If chkCombinedOpBal.Value = 1 Then
        clsListStru.UpdateField mAlias:="AhOpBal", mShowItem:=True
    Else
        clsListStru.UpdateField mAlias:="AhOpDrBal", mShowItem:=True
        clsListStru.UpdateField mAlias:="AhOpCrBal", mShowItem:=True
    End If
End If
If chkCurBal.Value = 1 Then
    If chkCombinedCurBal.Value = 1 Then
        clsListStru.UpdateField mAlias:="AhCurBal", mShowItem:=True
    Else
        clsListStru.UpdateField mAlias:="AhCurDrBal", mShowItem:=True
        clsListStru.UpdateField mAlias:="AhCurCrBal", mShowItem:=True
    End If
End If

RefreshDatabase dbComDatabase
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
        clsDPT.GetData .Fields("EmpDptCode")
        clsDSG.GetData .Fields("EmpDsgCode")
        
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("AhCode")) = .Fields("AhCode")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("AhName")) = .Fields("AhName")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("DptName")) = clsDPT.mName_str
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("DsgName")) = clsDSG.mName_str
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BSalary")) = ToMyNumFmt(.Fields("EmpBSalary"))
        If chkOpBal.Value = 1 Then
            If chkCombinedOpBal.Value = 1 Then
                aAcntBal = clsAH.GetAhOpnBal(.Fields("AhCode"), mDrCrSeperated:=False)
                
                mBal = aAcntBal(0)
                
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("AhOpBal")) = ToMyAcFmt(mBal)
            Else
                aAcntBal = clsAH.GetAhOpnBal(.Fields("AhCode"), mDrCrSeperated:=True)
                Rem debit balance
                mBal = aAcntBal(0)
                
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("AhOpDrBal")) = ToMyAcFmt(mBal)
                
                Rem credit balance
                mBal = aAcntBal(1)
                
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("AhOpCrBal")) = ToMyAcFmt(mBal)
            End If
        End If
        If chkCurBal.Value = 1 Then
            If chkCombinedCurBal.Value = 1 Then
                aAcntBal = clsAH.GetAhCurBal(.Fields("AhCode"), sFinYrEndDate, mDrCrSeperated:=False)
                
                mBal = aAcntBal(0)
                
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("AhCurBal")) = ToMyAcFmt(mBal)
            Else
                aAcntBal = clsAH.GetAhCurBal(.Fields("AhCode"), sFinYrEndDate, mDrCrSeperated:=True)
                Rem debit balance
                mBal = aAcntBal(0)
                
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("AhCurDrBal")) = ToMyAcFmt(mBal)
                
                Rem credit balance
                mBal = aAcntBal(1)
                
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("AhCurCrBal")) = ToMyAcFmt(mBal)
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

Call CalcDrCrAmtTot

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

Private Sub CalcDrCrAmtTot()
Dim mOpnDrAmtTot As Double, mOpnCrAmtTot As Double, mOpnNetBal As Double, mCurDrAmtTot As Double, mCurCrAmtTot As Double, mCurNetBal As Double
Dim aBal As Variant, mRowPos As Integer

lblOpnDrAmtTot.Caption = ToMyAcFmt(0)
lblOpnCrAmtTot.Caption = ToMyAcFmt(0)
lblOpnNetBal.Caption = ToMyAcFmt(0)
lblCurDrAmtTot.Caption = ToMyAcFmt(0)
lblCurCrAmtTot.Caption = ToMyAcFmt(0)
lblCurNetBal.Caption = ToMyAcFmt(0)

aBal = clsAH.GetAllAhOpnBal(mDrCrSeperated:=True)

mOpnDrAmtTot = aBal(0)
mOpnCrAmtTot = aBal(1)
mOpnNetBal = mOpnDrAmtTot + mOpnCrAmtTot

aBal = clsAH.GetAllAhCurBal(sFinYrEndDate, mDrCrSeperated:=True)

mCurDrAmtTot = aBal(0)
mCurCrAmtTot = aBal(1)
mCurNetBal = mCurDrAmtTot + mCurCrAmtTot

lblOpnDrAmtTot.Caption = ToMyAcFmt(mOpnDrAmtTot)
lblOpnCrAmtTot.Caption = ToMyAcFmt(mOpnCrAmtTot)
lblOpnNetBal.Caption = ToMyAcFmt(mOpnNetBal)
lblCurDrAmtTot.Caption = ToMyAcFmt(mCurDrAmtTot)
lblCurCrAmtTot.Caption = ToMyAcFmt(mCurCrAmtTot)
lblCurNetBal.Caption = ToMyAcFmt(mCurNetBal)

'frBottomTotal.Left = (dgList.Columns(dgList.Columns.Count - 1).Left + dgList.Columns(dgList.Columns.Count - 1).Width - frBottomTotal.Width)

End Sub

Private Sub txtDsgName_Change()
If fcmbDsgName.CallFromText_Change = False Then
    fcmbDsgName.CallFromText_Change = True
    If InterActiveChange(txtDsgName) = True Then
        fcmbDsgName.UserText = Array(txtDsgName.Text, txtDsgName.SelStart)
        fcmbDsgName.Show
        txtDsgName.Text = fcmbDsgName.Text
        If fcmbDsgName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbDsgName.CallFromText_Change = False
End If

End Sub

Private Sub txtDsgName_GotFocus()
FlashActiveControl txtDsgName, True
End Sub

Private Sub txtDsgName_LostFocus()
FlashActiveControl txtDsgName, False
End Sub

Private Sub txtDsgName_Validate(Cancel As Boolean)
If Val(fcmbDsgName.BoundText) <= 0 Then
    ErrorBox "Invalid Designation Name !!!"
    txtDsgName.SetFocus
    Cancel = True
End If

End Sub

Private Function Calc_NetSalary()
Dim mEmpNSalary As Double
mEmpNSalary = Val(UnMyNumFmt(mskEmpBSalary.Text)) + Val(UnMyNumFmt(mskEmpHRAAmt.Text)) + Val(UnMyNumFmt(mskEmpDAAmt.Text)) - Val(UnMyNumFmt(mskEmpSelfPFAmt.Text)) - Val(UnMyNumFmt(mskEmpSelfESICAmt.Text))
mskEmpNSalary.Text = ToMyNumFmt(mEmpNSalary)

End Function

Private Sub Calc_PerAmt()
Dim mEmpHRAPer As Double, mEmpDAPer As Double, mEmpSelfPFPer As Double, mEmpSelfESICPer As Double, mEmpCoPFPer As Double
Dim mEmpBSalary As Double, mEmpHRAAmt As Double, mEmpDAAmt As Double, mEmpSelfPFAmt As Double, mEmpSelfESICAmt As Double, mEmpCoPFAmt As Double

mEmpBSalary = Val(UnMyNumFmt(mskEmpBSalary.Text))
mEmpHRAPer = Val(UnMyPerFmt(mskEmpHRAPer.Text))
mEmpDAPer = Val(UnMyPerFmt(mskEmpDAPer.Text))
mEmpSelfPFPer = Val(UnMyPerFmt(mskEmpSelfPFPer.Text))
mEmpSelfESICPer = Val(UnMyPerFmt(mskEmpSelfESICPer.Text))
mEmpCoPFPer = Val(UnMyPerFmt(mskEmpCoPFPer.Text))

If mEmpHRAPer <> 0 Then
    mEmpHRAAmt = Round(mEmpBSalary * mEmpHRAPer / 100, 2)
    mskEmpHRAAmt.Text = ToMyNumFmt(mEmpHRAAmt)
End If
If mEmpDAPer <> 0 Then
    mEmpDAAmt = Round(mEmpBSalary * mEmpDAPer / 100, 2)
    mskEmpDAAmt.Text = ToMyNumFmt(mEmpDAAmt)
End If
If mEmpSelfPFPer <> 0 Then
    mEmpSelfPFAmt = Round(mEmpBSalary * mEmpSelfPFPer / 100, 2)
    mskEmpSelfPFAmt.Text = ToMyNumFmt(mEmpSelfPFAmt)
End If
If mEmpSelfESICPer <> 0 Then
    mEmpSelfESICAmt = Round(mEmpBSalary * mEmpSelfESICPer / 100, 2)
    mskEmpSelfESICAmt.Text = ToMyNumFmt(mEmpSelfESICAmt)
End If
If mEmpCoPFPer <> 0 Then
    mEmpCoPFAmt = Round(mEmpBSalary * mEmpCoPFPer / 100, 2)
    mskEmpCoPFAmt.Text = ToMyNumFmt(mEmpCoPFAmt)
End If

End Sub

Private Sub txtMinWrkTimeStr_GotFocus()
FlashActiveControl txtMinWrkTimeStr, True
End Sub

Private Sub txtMinWrkTimeStr_LostFocus()
FlashActiveControl txtMinWrkTimeStr, False
End Sub

Private Sub txtMinWrkTimeStr_Validate(Cancel As Boolean)
txtMinWrkTimeStr.Text = MinToTime(TimeToMin(txtMinWrkTimeStr.Text))

If TimeToMin(txtMinWrkTimeStr.Text) > TimeToMin(txtWrkTimeStr.Text) Then
    ErrorBox "Minimum Working Hours be Less than or Equal to Working Hours !!!"
    txtMinWrkTimeStr.SetFocus
    Cancel = True
'ElseIf TimeToMin(txtMinWrkTimeStr.Text) > TimeToMin(txtHalfDayTimeStr.Text) Then
'    ErrorBox "Minimum Working Hours be Less than or Equal to Half Day Hours !!!"
'    txtMinWrkTimeStr.SetFocus
'    Cancel = True
ElseIf TimeToMin(txtMinWrkTimeStr.Text) > 24 * 60 Then
    ErrorBox "Minimum Working Hours be Less than or Equal to 24 Hours !!!"
    txtMinWrkTimeStr.SetFocus
    Cancel = True
ElseIf TimeToMin(txtMinWrkTimeStr.Text) <= 0 Then
    ErrorBox "Invalid Minimum Working Hours !!!"
    txtMinWrkTimeStr.SetFocus
    Cancel = True
End If

End Sub

Private Sub txtWrkTimeStr_GotFocus()
FlashActiveControl txtWrkTimeStr, True
End Sub

Private Sub txtWrkTimeStr_LostFocus()
FlashActiveControl txtWrkTimeStr, False
End Sub

Private Sub txtWrkTimeStr_Validate(Cancel As Boolean)
txtWrkTimeStr.Text = MinToTime(TimeToMin(txtWrkTimeStr.Text))
If TimeToMin(txtWrkTimeStr.Text) > 24 * 60 Then
    ErrorBox "Working Hours be Less than or Equal to 24 Hours !!!"
    txtWrkTimeStr.SetFocus
    Cancel = True
ElseIf TimeToMin(txtWrkTimeStr.Text) <= 0 Then
    ErrorBox "Invalid Working Hours !!!"
    txtWrkTimeStr.SetFocus
    Cancel = True
End If

End Sub

Private Sub txtHalfDayTimeStr_GotFocus()
FlashActiveControl txtHalfDayTimeStr, True
End Sub

Private Sub txtHalfDayTimeStr_LostFocus()
FlashActiveControl txtHalfDayTimeStr, False
End Sub

Private Sub txtHalfDayTimeStr_Validate(Cancel As Boolean)
txtHalfDayTimeStr.Text = MinToTime(TimeToMin(txtHalfDayTimeStr.Text))
If TimeToMin(txtHalfDayTimeStr.Text) >= TimeToMin(txtWrkTimeStr.Text) Then
    ErrorBox "Half Day Hours be Less than Working Hours !!!"
    txtHalfDayTimeStr.SetFocus
    Cancel = True
ElseIf TimeToMin(txtHalfDayTimeStr.Text) > 24 * 60 Then
    ErrorBox "Half Day Hours be Less than or Equal to 24 Hours !!!"
    txtHalfDayTimeStr.SetFocus
    Cancel = True
ElseIf TimeToMin(txtHalfDayTimeStr.Text) <= 0 Then
    ErrorBox "Invalid Half Day Hours !!!"
    txtHalfDayTimeStr.SetFocus
    Cancel = True
End If

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
    chkCombinedOpBal.SetFocus
ElseIf Shift = vbCtrlMask And KeyCode = vbKeyAdd Then
    Call Data_AddEvent
ElseIf Shift = vbCtrlMask And KeyCode = vbKeySubtract Then
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
mText = IIf(IsMissing(mText) = True, txtSearch1Text.Text, mText)
SearchFlex Mfgrd1, clsListStru.GetItemIndex("AhName"), mText
ShowActiveFlexRow Mfgrd1

End Sub

Private Sub txtSearch1Text_GotFocus()
FlashActiveControl txtSearch1Text, True
End Sub

Private Sub txtSearch1Text_LostFocus()
FlashActiveControl txtSearch1Text, False
End Sub

