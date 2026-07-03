VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmEntityMast 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   ClientHeight    =   8850
   ClientLeft      =   60
   ClientTop       =   60
   ClientWidth     =   14865
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
   ScaleHeight     =   8850
   ScaleWidth      =   14865
   ShowInTaskbar   =   0   'False
   Begin VB.TextBox txtVoid 
      CausesValidation=   0   'False
      Height          =   375
      Left            =   120
      TabIndex        =   25
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
      TabIndex        =   33
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
      TabIndex        =   32
      TabStop         =   0   'False
      Top             =   0
      Width           =   255
   End
   Begin VB.ComboBox cmbFormEntryMode 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   315
      ItemData        =   "EntyMast.frx":0000
      Left            =   0
      List            =   "EntyMast.frx":000D
      Style           =   1  'Simple Combo
      TabIndex        =   29
      TabStop         =   0   'False
      Text            =   "cmbFormMode"
      Top             =   360
      Width           =   1455
   End
   Begin VB.Frame frFormDtl 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFED9&
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
      Height          =   7215
      Left            =   240
      TabIndex        =   28
      Top             =   840
      Width           =   12735
      Begin VB.ComboBox cmbEttSex 
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
         Height          =   315
         Left            =   2760
         Style           =   2  'Dropdown List
         TabIndex        =   4
         Top             =   1440
         Width           =   1215
      End
      Begin VB.TextBox dtpEttAgeAsOnDt 
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
         Left            =   8880
         MaxLength       =   50
         TabIndex        =   8
         TabStop         =   0   'False
         Text            =   "dd/mm/yyyy"
         Top             =   1440
         Width           =   1575
      End
      Begin VB.TextBox dtpEttDob 
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
         Left            =   11040
         MaxLength       =   50
         TabIndex        =   9
         TabStop         =   0   'False
         Text            =   "dd/mm/yyyy"
         Top             =   1440
         Width           =   1575
      End
      Begin VB.TextBox mskEttAgeDy 
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
         Left            =   7320
         TabIndex        =   7
         Tag             =   "AhCode"
         Text            =   "0"
         Top             =   1440
         Width           =   735
      End
      Begin VB.TextBox mskEttAgeMn 
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
         Left            =   6720
         TabIndex        =   6
         Tag             =   "AhCode"
         Text            =   "0"
         Top             =   1440
         Width           =   615
      End
      Begin VB.TextBox mskEttAgeYr 
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
         Left            =   6000
         TabIndex        =   5
         Tag             =   "AhCode"
         Text            =   "0"
         Top             =   1440
         Width           =   735
      End
      Begin VB.TextBox txtEttRemark 
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
         Left            =   2760
         MaxLength       =   50
         TabIndex        =   19
         Top             =   4800
         Width           =   5295
      End
      Begin VB.TextBox txtEttEmail 
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
         Left            =   2760
         MaxLength       =   50
         TabIndex        =   17
         Top             =   3600
         Width           =   3975
      End
      Begin VB.TextBox txtEttSMSNo 
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
         TabIndex        =   16
         Top             =   3240
         Width           =   3495
      End
      Begin VB.TextBox txtEttTelNo 
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
         Left            =   2760
         MaxLength       =   50
         TabIndex        =   15
         Top             =   3240
         Width           =   3975
      End
      Begin VB.TextBox txtStnName 
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
         Left            =   8400
         MaxLength       =   50
         TabIndex        =   14
         Top             =   2880
         Width           =   3495
      End
      Begin VB.TextBox txtAraName 
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
         Left            =   2760
         MaxLength       =   50
         TabIndex        =   13
         Top             =   2880
         Width           =   3975
      End
      Begin VB.TextBox txtEttAddr 
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
         Height          =   620
         Left            =   2760
         MaxLength       =   250
         MultiLine       =   -1  'True
         TabIndex        =   12
         Top             =   2160
         Width           =   5295
      End
      Begin VB.ComboBox cmbEttRefRela 
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
         Height          =   315
         Left            =   2760
         Style           =   2  'Dropdown List
         TabIndex        =   10
         Top             =   1800
         Width           =   1215
      End
      Begin VB.TextBox txtEttRefName 
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
         Left            =   4080
         MaxLength       =   50
         TabIndex        =   11
         Top             =   1800
         Width           =   3975
      End
      Begin VB.TextBox mskEttRegNo 
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
         Left            =   2760
         TabIndex        =   1
         Tag             =   "AhCode"
         Text            =   "0"
         Top             =   600
         Width           =   1455
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
         Left            =   2760
         MaxLength       =   50
         TabIndex        =   20
         Top             =   5280
         Width           =   5295
      End
      Begin VB.TextBox dtpEttRegDate 
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
         Left            =   5400
         MaxLength       =   50
         TabIndex        =   2
         Text            =   "dd/mm/yyyy"
         Top             =   600
         Width           =   1575
      End
      Begin VB.TextBox txtEtgName 
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
         Left            =   2760
         MaxLength       =   50
         TabIndex        =   18
         Top             =   4080
         Width           =   5295
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
         Left            =   4440
         TabIndex        =   22
         Tag             =   "AhCode"
         Text            =   "__"
         Top             =   5640
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
         Left            =   2760
         TabIndex        =   21
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   5640
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
         Left            =   12360
         Style           =   1  'Graphical
         TabIndex        =   24
         Top             =   6840
         Width           =   375
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
         Left            =   2760
         MaxLength       =   50
         TabIndex        =   3
         Top             =   1080
         Width           =   5295
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
         Left            =   2760
         TabIndex        =   0
         Tag             =   "AhCode"
         Text            =   "-1"
         Top             =   240
         Width           =   1455
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Sex:"
         BeginProperty Font 
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
         Index           =   19
         Left            =   360
         TabIndex        =   74
         Top             =   1440
         Width           =   2415
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "As On:"
         BeginProperty Font 
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
         Index           =   18
         Left            =   8160
         TabIndex        =   73
         Top             =   1440
         Width           =   615
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "DOB:"
         BeginProperty Font 
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
         Index           =   17
         Left            =   10560
         TabIndex        =   72
         Top             =   1440
         Width           =   495
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Age (Yrs/Mn/Dys):"
         BeginProperty Font 
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
         Left            =   4080
         TabIndex        =   71
         Top             =   1440
         Width           =   1935
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
         Index           =   15
         Left            =   360
         TabIndex        =   70
         Top             =   4800
         Width           =   2415
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Email:"
         BeginProperty Font 
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
         Left            =   360
         TabIndex        =   69
         Top             =   3600
         Width           =   2415
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "SMS Mobile No.:"
         BeginProperty Font 
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
         Left            =   6840
         TabIndex        =   68
         Top             =   3240
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
         Height          =   255
         Index           =   11
         Left            =   360
         TabIndex        =   67
         Top             =   3240
         Width           =   2415
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
         Left            =   6840
         TabIndex        =   66
         Top             =   2880
         Width           =   1455
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
         Left            =   360
         TabIndex        =   65
         Top             =   2880
         Width           =   2415
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
         Left            =   360
         TabIndex        =   64
         Top             =   2160
         Width           =   2415
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Reg.Date:"
         BeginProperty Font 
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
         Left            =   4320
         TabIndex        =   63
         Top             =   600
         Width           =   1095
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
         Height          =   255
         Index           =   4
         Left            =   360
         TabIndex        =   62
         Top             =   600
         Width           =   2415
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Account Head:"
         BeginProperty Font 
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
         Index           =   21
         Left            =   360
         TabIndex        =   49
         Top             =   5280
         Width           =   2415
      End
      Begin VB.Line Line3 
         Index           =   2
         X1              =   0
         X2              =   12720
         Y1              =   4560
         Y2              =   4560
      End
      Begin VB.Line Line3 
         Index           =   1
         X1              =   0
         X2              =   12720
         Y1              =   960
         Y2              =   960
      End
      Begin VB.Line Line3 
         Index           =   0
         X1              =   0
         X2              =   12720
         Y1              =   3960
         Y2              =   3960
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Care of:"
         BeginProperty Font 
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
         Left            =   360
         TabIndex        =   47
         Top             =   1800
         Width           =   2415
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Category:"
         BeginProperty Font 
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
         TabIndex        =   46
         Top             =   4080
         Width           =   2415
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
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   285
         Left            =   2760
         TabIndex        =   23
         Top             =   6000
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
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   2
         Left            =   360
         TabIndex        =   40
         Top             =   6000
         Width           =   2415
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Opening Balance:"
         BeginProperty Font 
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
         Left            =   360
         TabIndex        =   39
         Top             =   5640
         Width           =   2415
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Donor/Patient Name:"
         BeginProperty Font 
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
         Left            =   360
         TabIndex        =   31
         Top             =   1080
         Width           =   2415
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
         Left            =   360
         TabIndex        =   30
         Top             =   240
         Width           =   2415
      End
   End
   Begin VB.Frame frFormSmry 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFED9&
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
      Left            =   240
      TabIndex        =   27
      Top             =   840
      Width           =   14415
      Begin VB.TextBox txtSearchEttContNo 
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
         Left            =   6660
         TabIndex        =   76
         TabStop         =   0   'False
         Top             =   360
         Width           =   5295
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
         TabIndex        =   45
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
         TabIndex        =   43
         Top             =   360
         Width           =   4215
      End
      Begin VB.Frame frConfigure 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   4095
         Left            =   3120
         TabIndex        =   41
         Top             =   840
         Width           =   6015
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
            TabIndex        =   35
            Top             =   1560
            Value           =   1  'Checked
            Width           =   3735
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
            TabIndex        =   34
            Top             =   1080
            Value           =   1  'Checked
            Width           =   3735
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
            TabIndex        =   36
            Top             =   2040
            Value           =   1  'Checked
            Width           =   3735
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
            TabIndex        =   37
            Top             =   2520
            Value           =   1  'Checked
            Width           =   3735
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
            TabIndex        =   38
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
            TabIndex        =   42
            Top             =   0
            Width           =   6015
         End
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd1 
         Height          =   6555
         Left            =   120
         TabIndex        =   44
         Top             =   720
         Width           =   13935
         _ExtentX        =   24580
         _ExtentY        =   11562
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
      Begin VB.Frame frSmryTotal 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Summary Total"
         ForeColor       =   &H80000008&
         Height          =   1575
         Left            =   1440
         TabIndex        =   50
         Top             =   5760
         Visible         =   0   'False
         Width           =   7815
         Begin VB.Label lblOpnNetBal 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            Caption         =   "0.00"
            ForeColor       =   &H80000008&
            Height          =   285
            Left            =   5280
            TabIndex        =   61
            Top             =   600
            Width           =   1695
         End
         Begin VB.Label lblOpnCrAmtTot 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            Caption         =   "0.00"
            ForeColor       =   &H80000008&
            Height          =   285
            Left            =   3480
            TabIndex        =   60
            Top             =   600
            Width           =   1695
         End
         Begin VB.Label lblOpnDrAmtTot 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            Caption         =   "0.00"
            ForeColor       =   &H80000008&
            Height          =   285
            Left            =   1680
            TabIndex        =   59
            Top             =   600
            Width           =   1695
         End
         Begin VB.Label Label1 
            Alignment       =   1  'Right Justify
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
            Index           =   8
            Left            =   5280
            TabIndex        =   58
            Top             =   240
            Width           =   1695
         End
         Begin VB.Label Label1 
            Alignment       =   1  'Right Justify
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
            Index           =   7
            Left            =   3480
            TabIndex        =   57
            Top             =   240
            Width           =   1695
         End
         Begin VB.Label Label1 
            Alignment       =   1  'Right Justify
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
            Index           =   6
            Left            =   1680
            TabIndex        =   56
            Top             =   240
            Width           =   1695
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Opening:"
            BeginProperty Font 
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
            TabIndex        =   55
            Top             =   600
            Width           =   1335
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Current:"
            BeginProperty Font 
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
            TabIndex        =   54
            Top             =   1080
            Width           =   1335
         End
         Begin VB.Label lblCurNetBal 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            Caption         =   "0.00"
            ForeColor       =   &H80000008&
            Height          =   285
            Left            =   5280
            TabIndex        =   53
            Top             =   1080
            Width           =   1695
         End
         Begin VB.Label lblCurCrAmtTot 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            Caption         =   "0.00"
            ForeColor       =   &H80000008&
            Height          =   285
            Left            =   3480
            TabIndex        =   52
            Top             =   1080
            Width           =   1695
         End
         Begin VB.Label lblCurDrAmtTot 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            Caption         =   "0.00"
            ForeColor       =   &H80000008&
            Height          =   285
            Left            =   1680
            TabIndex        =   51
            Top             =   1080
            Width           =   1695
         End
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Cont.No.:"
         BeginProperty Font 
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
         Left            =   5760
         TabIndex        =   75
         Top             =   360
         Width           =   915
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
         Height          =   285
         Index           =   4
         Left            =   120
         TabIndex        =   48
         Top             =   360
         Width           =   735
      End
   End
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Donor/Patient Master"
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
      TabIndex        =   26
      Top             =   0
      Width           =   9015
   End
End
Attribute VB_Name = "frmEntityMast"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Dim mFormLoaded As Boolean, mLastKeyPressed As Integer, mMaskKeyPressed As Integer
Dim mFormUIdCode As Long, mFormUIdFileName As String, mFormAcsPermFileName As String
Dim mEttCode As Long
Dim mSearchEttContNoStartRow As Integer
Dim mRemoteAccess As Boolean, mEntrySaved As Boolean, mEntryAborted As Boolean
Dim dbAcDatabase As New ADODB.Connection, dbBdkDatabase As New ADODB.Connection, dbGrpDatabase As New ADODB.Connection, dbComDatabase As New ADODB.Connection
Dim datRecset As New ADODB.Recordset
Dim mEttCode_old As Long, mEttName_old As String, mEttRegNo_old As Long, mEttEtgCode_old As Long, mEttAhCode_old As Long, mEttAgeChanged As Boolean, mEttAraCode_old As Long
Dim clsAH As clsAccountHead, clsETT As clsBdkMasterEntry, mActiveControl As Object, clsListStru As clsSelectQueryStructure      ''' clsETG As clsBdkMasterEntry, clsARA As clsComMastEntry, clsSTN As clsComMastEntry,
Rem Dim clsHOPT As clsBdkOpdOptionsEntry
Dim fcmbAhName As clsComFlexSearch, fcmbAraName As clsComFlexSearch, fcmbStnName As clsComFlexSearch
Dim fcmbEttName As clsBdkFlexSearch, fcmbEttRegNo As clsBdkFlexSearch, fcmbEtgName As clsBdkFlexSearch

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
mEttCode = mAccessCode
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

Public Property Get EttName() As String
EttName = txtEttName.Text
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

Private Sub cmbEttRefRela_GotFocus()
FlashActiveControl cmbEttRefRela, True
End Sub

Private Sub cmbEttRefRela_LostFocus()
FlashActiveControl cmbEttRefRela, False
End Sub

Private Sub cmbEttRefRela_Validate(Cancel As Boolean)
If cmbEttRefRela.ListIndex = -1 Then
    ErrorBox "Invalid Selection !!!"
    cmbEttRefRela.SetFocus
    Cancel = True
End If

End Sub

Private Sub cmbEttSex_GotFocus()
FlashActiveControl cmbEttSex, True
End Sub

Private Sub cmbEttSex_LostFocus()
FlashActiveControl cmbEttSex, False
End Sub

Private Sub cmbEttSex_Validate(Cancel As Boolean)
If cmbEttSex.ListIndex = -1 Then
    ErrorBox "Invalid Selection !!!"
    cmbEttSex.SetFocus
    Cancel = True
End If

End Sub

Private Sub cmdConfigure_Click()
Call SaveSmryPara

txtVoid.SetFocus
Call SmryList
MoveRecToLast datRecset
ShowRecActiveFlexRow datRecset, Mfgrd1
Mfgrd1.Enabled = True
frConfigure.Visible = False
Mfgrd1.SetFocus

End Sub

Private Sub cmdFormEnter_Click()
mLastKeyPressed = 13

If Screen.ActiveControl.Name = txtSearchEttContNo.Name Then
    txtSearchEttContNo_KeyDown vbKeyReturn, 0
    
ElseIf FormAddEditMode = cFORM_SMRYMODE And frConfigure.Visible = False Then
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

ElseIf Screen.ActiveControl.Name = txtSearchEttContNo.Name Then
    txtVoid.SetFocus
    txtSearchEttContNo.Text = ""
    Mfgrd1.SetFocus
    
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
        txtVoid.SetFocus
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
        txtEttName.SetFocus
    End If
End If

End Sub

Private Sub cmdSaveForm_Click()
Call Data_SaveEvent

txtVoid.SetFocus
Call SmryList
txtSearch1Text_InterActiveChange txtEttName.Text

''datRecset.Find "EttName='" & txtEttName.Text & "'", Start:=1
''ShowRecActiveFlexRow datRecset, Mfgrd1

Call ShowEntryMode(False)
Mfgrd1.SetFocus
Call CalcDrCrAmtTot

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
            
            txtEttName.SetFocus
        End If
    Else
        txtEttName.SetFocus
    End If
End If
cmdSaveForm.Enabled = True

End Sub

Private Sub dtpEttAgeAsOnDt_Change()
mEttAgeChanged = True
End Sub

Private Sub dtpEttAgeAsOnDt_GotFocus()
FlashActiveControl dtpEttAgeAsOnDt, True
mEttAgeChanged = False
End Sub

Private Sub dtpEttAgeAsOnDt_LostFocus()
FlashActiveControl dtpEttAgeAsOnDt, False
End Sub

Private Sub dtpEttAgeAsOnDt_Validate(Cancel As Boolean)
dtpEttAgeAsOnDt.Text = ToMyDate(dtpEttAgeAsOnDt.Text)
If IsDate(dtpEttAgeAsOnDt.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpEttAgeAsOnDt.SetFocus
    Cancel = True
Else
    If mEttAgeChanged = True Then
        Call ShowEttDob
    End If
End If

End Sub

Private Sub dtpEttDob_Change()
mEttAgeChanged = True
End Sub

Private Sub dtpEttDob_GotFocus()
FlashActiveControl dtpEttDob, True
mEttAgeChanged = False
End Sub

Private Sub dtpEttDob_LostFocus()
FlashActiveControl dtpEttDob, False
End Sub

Private Sub dtpEttDob_Validate(Cancel As Boolean)
Dim mYears As Long, mMonths As Long, mDays As Long

dtpEttDob.Text = ToMyDate(dtpEttDob.Text)
If IsDate(dtpEttDob.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpEttDob.SetFocus
    Cancel = True
Else
    If mEttAgeChanged = True Then
        Call ShowEntityAge
    End If
End If

End Sub

Private Sub dtpEttRegDate_Change()
mEttAgeChanged = True
End Sub

Private Sub dtpEttRegDate_GotFocus()
mEttAgeChanged = False
FlashActiveControl dtpEttRegDate, True
End Sub

Private Sub dtpEttRegDate_LostFocus()
FlashActiveControl dtpEttRegDate, False
End Sub

Private Sub dtpEttRegDate_Validate(Cancel As Boolean)
dtpEttRegDate.Text = ToMyDate(dtpEttRegDate.Text)
If IsDate(dtpEttRegDate.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpEttRegDate.SetFocus
    Cancel = True
Else
    If mEttAgeChanged = True Then
        dtpEttAgeAsOnDt.Text = dtpEttRegDate.Text
        Call ShowEttDob
    End If
End If

End Sub

Private Sub Form_Activate()
If mFormLoaded = False Then
    If mRemoteAccess = True Then
        MoveRecToFirst datRecset
        ShowRecActiveFlexRow datRecset, Mfgrd1
        Mfgrd1.SetFocus
        If mEttCode = 0 Then
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

Private Sub Form_Load()
Dim colcnt As Integer

mFormUIdFileName = "EntityMast.Uid"
mFormAcsPermFileName = "EntityMast.Acp"
mFormUIdCode = GetUIdCode(mProcess:=Me.Name, mUIdFileName:=mFormUIdFileName, mAcsPermFileName:=mFormAcsPermFileName)

mFormLoaded = False
mEntrySaved = False: mEntryAborted = False
SetFormSize Me, frmMain
Call Form_Resize

Call SetVoidControl(txtVoid)
txtSearch1Text.Enabled = False
frConfigure.Visible = False

Call RestoreDefaultSmryPara
Call SaveSmryPara

OpenAcDataSource dbAcDatabase
OpenBdkDataSource dbBdkDatabase
OpenGrpDataSource dbGrpDatabase
OpenComDataSource dbComDatabase

cmbEttSex.Clear
cmbEttSex.AddItem "Male"
cmbEttSex.AddItem "Female"
cmbEttSex.AddItem "None"

cmbEttRefRela.Clear
cmbEttRefRela.AddItem "C/o"
cmbEttRefRela.AddItem "S/o"
cmbEttRefRela.AddItem "D/o"
cmbEttRefRela.AddItem "W/o"
cmbEttRefRela.AddItem "F/o"
cmbEttRefRela.AddItem "M/o"

Set clsAH = New clsAccountHead
Set clsAH.dbAcDatabase = dbAcDatabase
Set clsAH.dbGrpDatabase = dbGrpDatabase

Set clsListStru = New clsSelectQueryStructure

'Set clsHOPT = New clsBdkOpdOptionsEntry
'clsHOPT.blnEntityMastOptMast = True
'clsHOPT.Init
'clsHOPT.GetEntityMastOptData

Set clsETT = New clsBdkMasterEntry
Set clsETT.dbAcDatabase = dbAcDatabase
Set clsETT.dbBdkDatabase = dbBdkDatabase
clsETT.blnEntityMast = True
clsETT.Init

'Set clsETG = New clsBdkMasterEntry
'Set clsETG.dbBdkDatabase = dbBdkDatabase
'clsETG.blnEntityCatgMast = True
'clsETG.Init
'
'Set clsARA = New clsComMastEntry
'Set clsARA.dbAcDatabase = dbAcDatabase
'clsARA.blnAreaMast = True
'clsARA.Init
'
'Set clsSTN = New clsComMastEntry
'Set clsSTN.dbAcDatabase = dbAcDatabase
'clsSTN.blnStationMast = True
'clsSTN.Init

Set fcmbAhName = New clsComFlexSearch
Set fcmbAhName.dbAcDatabase = dbAcDatabase
fcmbAhName.blnAchdMastList = True
fcmbAhName.Init

Set fcmbEtgName = New clsBdkFlexSearch
Set fcmbEtgName.dbBdkDatabase = dbBdkDatabase
fcmbEtgName.blnEntityCatgMastList = True
fcmbEtgName.Init

Set fcmbAraName = New clsComFlexSearch
Set fcmbAraName.dbAcDatabase = dbAcDatabase
fcmbAraName.blnAreaMastList = True
fcmbAraName.Init

Set fcmbStnName = New clsComFlexSearch
Set fcmbStnName.dbAcDatabase = dbAcDatabase
fcmbStnName.blnStationMastList = True
fcmbStnName.Init

Set fcmbEttRegNo = New clsBdkFlexSearch
Set fcmbEttRegNo.dbBdkDatabase = dbBdkDatabase
Set fcmbEttRegNo.dbComDatabase = dbComDatabase
fcmbEttRegNo.blnEntityMastListByRegNo = True
fcmbEttRegNo.Init

Set fcmbEttName = New clsBdkFlexSearch
Set fcmbEttName.dbBdkDatabase = dbBdkDatabase
Set fcmbEttName.dbComDatabase = dbComDatabase
fcmbEttName.blnEntityMastListByName = True
fcmbEttName.Init

If mRemoteAccess = True Then
    datRecset.open "Select *,EttTelNo+'; '+EttSmsNo as EttContNo from (((EntityMast" _
        & " left join AchdMast on EntityMast.EttAhCode = AchdMast.AhCode)" _
        & " left join EntityCatgMst on EntityMast.EttEtgCode = EntityCatgMst.EtgCode)" _
        & " left join AreaMast on EntityMast.EttAraCode = AreaMast.AraCode)" _
        & " left join StsnMast on EntityMast.EttStnCode = StsnMast.StnCode" _
        & " where EttCode = " & CStr(mEttCode) _
        & " order by EttName" _
        , dbComDatabase, adOpenKeyset, adLockOptimistic
Else
    datRecset.open "Select *,EttTelNo+'; '+EttSmsNo as EttContNo from (((EntityMast" _
        & " left join AchdMast on EntityMast.EttAhCode = AchdMast.AhCode)" _
        & " left join EntityCatgMst on EntityMast.EttEtgCode = EntityCatgMst.EtgCode)" _
        & " left join AreaMast on EntityMast.EttAraCode = AreaMast.AraCode)" _
        & " left join StsnMast on EntityMast.EttStnCode = StsnMast.StnCode" _
        & " order by EttName" _
        , dbComDatabase, adOpenKeyset, adLockOptimistic
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
'Set clsHOPT = Nothing
Set clsAH = Nothing
Set clsETT = Nothing
'Set clsETG = Nothing
'Set clsARA = Nothing
'Set clsSTN = Nothing
Set fcmbEttRegNo = Nothing
Set fcmbEttName = Nothing
Set fcmbAhName = Nothing
Set fcmbEtgName = Nothing
Set fcmbAraName = Nothing
Set fcmbStnName = Nothing
Set clsListStru = Nothing

CloseTable datRecset
CloseDataSource dbAcDatabase
CloseDataSource dbBdkDatabase
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
Rem frSmryTotal.Visible = Not EntryMode
If EntryMode = False Then
    FormAddEditMode = cFORM_SMRYMODE
End If

End Sub

Private Function Data_Verify() As Boolean
Dim mEttRegNo As Long

Data_Verify = False
If Val(mskFormBoundField.Text) < 1 And FormAddEditMode = cFORM_EDITMODE Then
    ErrorBox "Invalid Key Value !!!"
    txtEttName.SetFocus
    GoTo EndSub
End If
If Trim(txtEttName.Text) = "" Then
    ErrorBox "Invalid Input !!!"
    txtEttName.SetFocus
    GoTo EndSub
End If
mEttRegNo = Val(UnMyNumFmt(mskEttRegNo.Text))
If mEttRegNo < 0 Then
    ErrorBox "Invalid Input !!!"
    mskEttRegNo.SetFocus
    GoTo EndSub
Else
    If mEttRegNo <> mEttRegNo_old Or FormAddEditMode = cFORM_ADDMODE Then
'        If FormAddEditMode = cFORM_ADDMODE And mEttRegNo <> mEttRegNo_old And clsHOPT.mEttRegNoAddModeChange_bln = False Then
'            AlertBox "Change Prohibited in Add Mode !!!"
'            mskEttRegNo.Text = ToMyNumFmt(mEttRegNo_old, mDecimals:=0)
'            mskEttRegNo.SetFocus
'            GoTo EndSub
'
'        ElseIf FormAddEditMode = cFORM_EDITMODE And mEttRegNo <> mEttRegNo_old And clsHOPT.mEttRegNoEditModeChange_bln = False Then
'            AlertBox "Change Prohibited in Edit Mode !!!"
'            mskEttRegNo.Text = ToMyNumFmt(mEttRegNo_old, mDecimals:=0)
'            mskEttRegNo.SetFocus
'            GoTo EndSub
'
'        ElseIf mEttRegNo = 0 And clsHOPT.mEttRegNoNotZero_bln = True Then
'            AlertBox "Prohibited Zero Donor/Patient Reg.No. !!!"
'            If FormAddEditMode = cFORM_ADDMODE Then
'                If clsHOPT.mEttRegNoAutoNumber_bln = True Then
'                    mEttRegNo = GetNextSeqno(dbBdkDatabase, "EntityMast", "EttRegNo")
'                    mskEttRegNo.Text = ToMyNumFmt(mEttRegNo, mDecimals:=0)
'                End If
'            Else
'                mskEttRegNo.Text = ToMyNumFmt(mEttRegNo_old, mDecimals:=0)
'            End If
'            mskEttRegNo.SetFocus
'            GoTo EndSub
'
'        ElseIf mEttRegNo <> 0 Then
        If mEttRegNo <> 0 Then
            If ChkIsDuplicate(dbBdkDatabase, "EntityMast", "EttRegNo", mEttRegNo, "EttCode", mEttCode) = True Then
                ErrorBox "Duplicate Input !!!"
                mskEttRegNo.SetFocus
                ' -----------
                If FormAddEditMode = cFORM_ADDMODE Then
                    'If clsHOPT.mEttRegNoAutoNumber_bln = True Then
                        mEttRegNo = GetNextSeqno(dbBdkDatabase, "EntityMast", "EttRegNo")
                    'End If
                Else
                    mEttRegNo = mEttRegNo_old
                End If
                mskEttRegNo.Text = ToMyNumFmt(mEttRegNo, mDecimals:=0)
                GoTo EndSub
            End If
            
        End If
    End If
End If
If IsDate(dtpEttRegDate.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpEttRegDate.SetFocus
    GoTo EndSub
End If
If cmbEttSex.ListIndex = -1 Then
    ErrorBox "Invalid Selection !!!"
    cmbEttSex.SetFocus
    GoTo EndSub
End If
If Val(mskEttAgeYr.Text) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskEttAgeYr.SetFocus
    GoTo EndSub
End If
If Val(mskEttAgeMn.Text) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskEttAgeMn.SetFocus
    GoTo EndSub
End If
If Val(mskEttAgeDy.Text) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskEttAgeDy.SetFocus
    GoTo EndSub
End If
If Val(mskEttAgeYr.Text) < 1 And Val(mskEttAgeMn.Text) < 1 And Val(mskEttAgeDy.Text) < 1 Then
    ErrorBox "Invalid Input !!!"
    mskEttAgeYr.SetFocus
    GoTo EndSub
End If
If IsDate(dtpEttAgeAsOnDt.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpEttAgeAsOnDt.SetFocus
    GoTo EndSub
End If
If IsDate(dtpEttDob.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpEttDob.SetFocus
    GoTo EndSub
End If
If Val(fcmbAraName.BoundText) <= 0 Then
    ErrorBox "Invalid Selection !!!"
    txtAraName.SetFocus
    GoTo EndSub
End If
If Val(fcmbStnName.BoundText) <= 0 Then
    ErrorBox "Invalid Selection !!!"
    txtAraName.SetFocus
    GoTo EndSub
End If
If Val(fcmbEtgName.BoundText) <= 0 Then
    ErrorBox "Invalid Selection !!!"
    txtEtgName.SetFocus
    GoTo EndSub
End If
If Val(fcmbAhName.BoundText) <= 0 Then
    ErrorBox "Invalid Account Name !!!"
    txtAhName.SetFocus
    GoTo EndSub
End If

Data_Verify = True

EndSub:
Exit Function

End Function

Private Function Data_NetwAuth() As Boolean
Dim mEttRegNo As Long
Data_NetwAuth = False

mEttRegNo = Val(UnMyNumFmt(mskEttRegNo.Text))
If mEttRegNo <> mEttRegNo_old Or FormAddEditMode = cFORM_ADDMODE Then
    If mEttRegNo <> 0 Then
        If ChkIsDuplicate(dbBdkDatabase, "EntityMast", "EttRegNo", mEttRegNo, "EttCode", mEttCode) = True Then
            ErrorBox "Duplicate Input !!!"
            mskEttRegNo.SetFocus
            ' -------
            If FormAddEditMode = cFORM_ADDMODE Then
                'If clsHOPT.mEttRegNoAutoNumber_bln = True Then
                    mEttRegNo = GetNextSeqno(dbBdkDatabase, "EntityMast", "EttRegNo")
                'End If
            Else
                mEttRegNo = mEttRegNo_old
            End If
            mskEttRegNo.Text = ToMyNumFmt(mEttRegNo, mDecimals:=0)
            Exit Function
        End If
    End If
End If

Data_NetwAuth = True

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

Private Sub mskEttAgeDy_Change()
mEttAgeChanged = True
End Sub

Private Sub mskEttAgeDy_GotFocus()
FlashActiveControl mskEttAgeDy, True
mEttAgeChanged = False
End Sub

Private Sub mskEttAgeDy_LostFocus()
FlashActiveControl mskEttAgeDy, False
End Sub

Private Sub mskEttAgeDy_Validate(Cancel As Boolean)
mskEttAgeDy.Text = ToMyNumFmt(mskEttAgeDy.Text, mDecimals:=0, mUseAbs:=True, mGroupedDigit:=False)
If mEttAgeChanged = True Then
    Call ShowEttDob
End If

End Sub

Private Sub mskEttAgeMn_Change()
mEttAgeChanged = True
End Sub

Private Sub mskEttAgeMn_GotFocus()
FlashActiveControl mskEttAgeMn, True
mEttAgeChanged = False
End Sub

Private Sub mskEttAgeMn_LostFocus()
FlashActiveControl mskEttAgeMn, False
End Sub

Private Sub mskEttAgeMn_Validate(Cancel As Boolean)
mskEttAgeMn.Text = ToMyNumFmt(mskEttAgeMn.Text, mDecimals:=0, mUseAbs:=True, mGroupedDigit:=False)
If mEttAgeChanged = True Then
    Call ShowEttDob
End If

End Sub

Private Sub mskEttAgeYr_Change()
mEttAgeChanged = True
End Sub

Private Sub mskEttAgeYr_GotFocus()
FlashActiveControl mskEttAgeYr, True
mEttAgeChanged = False
End Sub

Private Sub mskEttAgeYr_LostFocus()
FlashActiveControl mskEttAgeYr, False
End Sub

Private Sub mskEttAgeYr_Validate(Cancel As Boolean)
mskEttAgeYr.Text = ToMyNumFmt(mskEttAgeYr.Text, mDecimals:=0, mUseAbs:=True, mGroupedDigit:=False)
If mEttAgeChanged = True Then
    Call ShowEttDob
End If

End Sub

Private Sub mskEttRegNo_GotFocus()
FlashActiveControl mskEttRegNo, True
End Sub

Private Sub mskEttRegNo_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    If fcmbEttRegNo.CallFromText_Change = False Then
        fcmbEttRegNo.CallFromText_Change = True
        If InterActiveChange(mskEttRegNo) = True Then
            fcmbEttRegNo.UserText = Array(mskEttRegNo.Text, mskEttRegNo.SelStart)
            fcmbEttRegNo.Show
            If fcmbEttRegNo.ListSelected = True And Val(fcmbEttRegNo.BoundText) > 0 Then
                If FormAddEditMode = cFORM_ADDMODE Then
                    clsETT.EndMast mEttCode
                    
                    FormAddEditMode = cFORM_EDITMODE
                    mEttCode = Val(fcmbEttRegNo.BoundText)
                    If clsETT.BeginMast(mEttCode) = True Then
                        mEttCode = clsETT.ActiveCode
                    Else
                        mEttCode = 0
                    End If
                    ShowEntityData mEttCode
                    Call StoreEntityOldData
                    Rem SendKeys "{tab}"
                Else
                    AlertBox "Prohibited in Edit Mode !!!"
                End If
            End If
        End If
        fcmbEttRegNo.CallFromText_Change = False
    End If
ElseIf MyAddNewKey(Shift, KeyCode) = True Then
    If FormAddEditMode = cFORM_ADDMODE Then
        clsETT.EndMast mEttCode
        
        If clsETT.BeginMast(0) = True Then
            mEttCode = clsETT.ActiveCode
        Else
            mEttCode = 0
        End If
        ShowEntityData mEttCode
        Call ShowEntityDefData
        Call StoreEntityOldData
    Else
        AlertBox "Prohibited in Edit Mode !!!"
    End If
End If

End Sub

Private Sub mskEttRegNo_LostFocus()
FlashActiveControl mskEttRegNo, False
End Sub

Private Sub mskEttRegNo_Validate(Cancel As Boolean)
Dim mEttRegNo As Long

mEttRegNo = Val(UnMyNumFmt(mskEttRegNo.Text))
If mEttRegNo < 0 Then
    ErrorBox "Invalid Input !!!"
    Cancel = True
    mskEttRegNo.SetFocus
Else
    If mEttRegNo <> mEttRegNo_old Or FormAddEditMode = cFORM_ADDMODE Then
'        If FormAddEditMode = cFORM_ADDMODE And mEttRegNo <> mEttRegNo_old And clsHOPT.mEttRegNoAddModeChange_bln = False Then
'            AlertBox "Change Prohibited in Add Mode !!!"
'            mskEttRegNo.Text = ToMyNumFmt(mEttRegNo_old, mDecimals:=0)
'            Cancel = True
'            mskEttRegNo.SetFocus
'
'        ElseIf FormAddEditMode = cFORM_EDITMODE And mEttRegNo <> mEttRegNo_old And clsHOPT.mEttRegNoEditModeChange_bln = False Then
'            AlertBox "Change Prohibited in Edit Mode !!!"
'            mskEttRegNo.Text = ToMyNumFmt(mEttRegNo_old, mDecimals:=0)
'            Cancel = True
'            mskEttRegNo.SetFocus
'
'        ElseIf mEttRegNo = 0 And clsHOPT.mEttRegNoNotZero_bln = True Then
'            AlertBox "Prohibited Zero Donor/Patient Reg.No. !!!"
'            If FormAddEditMode = cFORM_ADDMODE Then
'                If clsHOPT.mEttRegNoAutoNumber_bln = True Then
'                    mEttRegNo = GetNextSeqno(dbBdkDatabase, "EntityMast", "EttRegNo")
'                    mskEttRegNo.Text = ToMyNumFmt(mEttRegNo, mDecimals:=0)
'                End If
'            Else
'                mskEttRegNo.Text = ToMyNumFmt(mEttRegNo_old, mDecimals:=0)
'            End If
'            Cancel = True
'            mskEttRegNo.SetFocus
'        ElseIf mEttRegNo <> 0 Then
        If mEttRegNo <> 0 Then
            If ChkIsDuplicate(dbBdkDatabase, "EntityMast", "EttRegNo", mEttRegNo, "EttCode", mEttCode) = True Then
                ErrorBox "Duplicate Input !!!"
                Cancel = True
                mskEttRegNo.SetFocus
                ' -----------
                If FormAddEditMode = cFORM_ADDMODE Then
                    'If clsHOPT.mEttRegNoAutoNumber_bln = True Then
                        mEttRegNo = GetNextSeqno(dbBdkDatabase, "EntityMast", "EttRegNo")
                    'End If
                Else
                    mEttRegNo = mEttRegNo_old
                End If
                mskEttRegNo.Text = ToMyNumFmt(mEttRegNo, mDecimals:=0)
            End If
        End If
    End If
End If

End Sub

Private Sub txtAhName_Change()
If fcmbAhName.CallFromText_Change = False Then
    fcmbAhName.CallFromText_Change = True
    If InterActiveChange(txtAhName) = True Then
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
Else
    Call ShowEntityBal
End If

End Sub

Private Sub txtAraName_Change()
If fcmbAraName.CallFromText_Change = False Then
    fcmbAraName.CallFromText_Change = True
    If InterActiveChange(txtAraName) = True Then
        fcmbAraName.UserText = Array(txtAraName.Text, txtAraName.SelStart)
        fcmbAraName.Show
        txtAraName.Text = fcmbAraName.Text
        If fcmbAraName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbAraName.CallFromText_Change = False
End If

End Sub

Private Sub txtAraName_GotFocus()
FlashActiveControl txtAraName, True
End Sub

Private Sub txtAraName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtAraName_Change
End If

End Sub

Private Sub txtAraName_LostFocus()
FlashActiveControl txtAraName, False
End Sub

Private Sub txtAraName_Validate(Cancel As Boolean)
If Val(fcmbAraName.BoundText) <= 0 Then
    ErrorBox "Invalid Selection !!!"
    txtAraName.SetFocus
    Cancel = True
Else
    If mEttAraCode_old <> Val(fcmbAraName.BoundText) Or Val(fcmbStnName.BoundText) = 0 Then
        AutoInitStationFromArea cnn:=dbAcDatabase, txtStnName:=txtStnName, fcmbStnName:=fcmbStnName, mAraCode:=Val(fcmbAraName.BoundText)
'        clsARA.GetData Val(fcmbAraName.BoundText)
'        fcmbStnName.Requery
'        fcmbStnName.BoundText = CStr(clsARA.mAraStnCode_lng): txtStnName.Text = fcmbStnName.Text
    End If
End If

End Sub

Private Sub txtEtgName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtEtgName_Change
End If

End Sub

Private Sub txtEttAddr_GotFocus()
FlashActiveControl txtEttAddr, True
End Sub

Private Sub txtEttAddr_LostFocus()
FlashActiveControl txtEttAddr, False
End Sub

Private Sub txtEttAddr_Validate(Cancel As Boolean)
txtEttAddr.Text = ToMyWord(txtEttAddr.Text)
End Sub

Private Sub txtEttEmail_GotFocus()
FlashActiveControl txtEttEmail, True
End Sub

Private Sub txtEttEmail_LostFocus()
FlashActiveControl txtEttEmail, False
End Sub

Private Sub txtEttName_GotFocus()
FlashActiveControl txtEttName, True
End Sub

Private Sub txtEttName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    If fcmbEttName.CallFromText_Change = False Then
        fcmbEttName.CallFromText_Change = True
        If InterActiveChange(txtEttName) = True Then
            fcmbEttName.UserText = Array(txtEttName.Text, txtEttName.SelStart)
            fcmbEttName.Show
            If fcmbEttName.ListSelected = True And Val(fcmbEttName.BoundText) > 0 Then
                If FormAddEditMode = cFORM_ADDMODE Then
                    clsETT.EndMast mEttCode
                    
                    FormAddEditMode = cFORM_EDITMODE
                    mEttCode = Val(fcmbEttName.BoundText)
                    If clsETT.BeginMast(mEttCode) = True Then
                        mEttCode = clsETT.ActiveCode
                    Else
                        mEttCode = 0
                    End If
                    ShowEntityData mEttCode
                    Call StoreEntityOldData
                    Rem SendKeys "{tab}"
                Else
                     AlertBox "Prohibited in Edit Mode !!!"
                End If
            End If
        End If
        fcmbEttName.CallFromText_Change = False
    End If
ElseIf MyAddNewKey(Shift, KeyCode) = True Then
    If FormAddEditMode = cFORM_ADDMODE Then
        clsETT.EndMast mEttCode
        
        If clsETT.BeginMast(0) = True Then
            mEttCode = clsETT.ActiveCode
        Else
            mEttCode = 0
        End If
        ShowEntityData mEttCode
        Call ShowEntityDefData
        Call StoreEntityOldData
    Else
        AlertBox "Prohibited in Edit Mode !!!"
    End If
End If

End Sub

Private Sub txtEttName_LostFocus()
FlashActiveControl txtEttName, False
End Sub

Private Sub txtEttName_Validate(Cancel As Boolean)
txtEttName.Text = ToMyWord(txtEttName.Text)
If Trim(txtEttName.Text) = "" Then
    ErrorBox "Invalid Input !!!"
    Cancel = True
    txtEttName.SetFocus
End If

End Sub

Private Sub Data_AddEvent()

If CanUserAddOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If clsETT.BeginMast(0) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_ADDMODE

clsETT.Clear
mEttCode = clsETT.ActiveCode

ShowEntityData mEttCode
Call ShowEntityDefData
Call StoreEntityOldData

Call ShowEntryMode(True)
txtEttName.SetFocus

End Sub

Private Sub Data_EditEvent()

If CanUserEditOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If clsETT.BeginMast(datRecset.fields("EttCode")) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_EDITMODE

With datRecset
mEttCode = .fields("EttCode")
clsETT.GetData mEttCode
End With

ShowEntityData mEttCode
Call StoreEntityOldData

Call ShowEntryMode(True)
txtEttName.SetFocus

End Sub

Private Sub ShowEntityData(ByVal mEttCode As Long)

With clsETT
.GetData mEttCode

mskFormBoundField.Text = mEttCode
txtEttName.Text = .mName_str
mskEttRegNo.Text = ToMyNumFmt(.mEttRegNo_lng, mDecimals:=0)
dtpEttRegDate.Text = Dtoc(.mEttRegDate_dt)
cmbEttSex.ListIndex = GetMidStrPos(cPTTSEX_LIST, .mEttSex_str, ",") - 1
mskEttAgeYr.Text = 0
mskEttAgeMn.Text = 0
mskEttAgeDy.Text = 0
dtpEttAgeAsOnDt.Text = Dtoc(.mEttAgeAsOnDt_dt)
dtpEttDob.Text = Dtoc(.mEttDob_dt)
fcmbEtgName.BoundText = CStr(.mEttEtgCode_lng): txtEtgName.Text = fcmbEtgName.Text
cmbEttRefRela.ListIndex = GetMidStrPos(cPTTREFRELA_LIST, .mEttRefRela_str, ",") - 1
txtEttRefName.Text = .mEttRefName_str
txtEttAddr.Text = .mEttAddr_str
fcmbAraName.BoundText = CStr(.mEttAraCode_lng): txtAraName.Text = fcmbAraName.Text
fcmbStnName.BoundText = CStr(.mEttStnCode_lng): txtStnName.Text = fcmbStnName.Text
txtEttTelNo.Text = .mEttTelNo_str
txtEttSMSNo.Text = .mEttSMSNo_str
txtEttEmail.Text = .mEttEmail_str
txtEttRemark.Text = .mEttRemark_str
fcmbAhName.BoundText = CStr(.mEttAhCode_lng): txtAhName.Text = fcmbAhName.Text
End With

mskAhOpBal.Text = ToMyNumFmt(0)
lblAhCurBal.Caption = ToMyAcFmt(0)
txtDrCrFlag.Text = SenseDrCrFlag(0)

Call ShowEntityAge
Call ShowEntityBal

End Sub

Private Sub ShowEntityDefData()
Dim mEttRegNo As Long

'If clsHOPT.mEttRegNoAutoNumber_bln = True Then
    mEttRegNo = GetNextSeqno(dbBdkDatabase, "EntityMast", "EttRegNo")
    mskEttRegNo.Text = ToMyNumFmt(mEttRegNo, mDecimals:=0)
'End If
dtpEttRegDate.Text = Dtoc(DefaultEntryDate)
cmbEttSex.ListIndex = 0
dtpEttAgeAsOnDt.Text = dtpEttRegDate.Text
dtpEttDob.Text = dtpEttRegDate.Text
cmbEttRefRela.ListIndex = 0

fcmbAraName.BoundText = GetLastValueFromTableCol(cnn:=dbBdkDatabase, mTableName:="EntityMast", mColumnName:="EttAraCode", mOrderByColName:="EttCode", mRtnDefValue:=0)
fcmbStnName.BoundText = GetLastValueFromTableCol(cnn:=dbBdkDatabase, mTableName:="EntityMast", mColumnName:="EttStnCode", mOrderByColName:="EttCode", mRtnDefValue:=0)
fcmbEtgName.BoundText = GetLastValueFromTableCol(cnn:=dbBdkDatabase, mTableName:="EntityMast", mColumnName:="EttEtgCode", mOrderByColName:="EttCode", mRtnDefValue:=0)
fcmbAhName.BoundText = GetLastValueFromTableCol(cnn:=dbBdkDatabase, mTableName:="EntityMast", mColumnName:="EttAhCode", mOrderByColName:="EttCode", mRtnDefValue:=0)

txtAraName.Text = fcmbAraName.Text
txtStnName.Text = fcmbStnName.Text
txtEtgName.Text = fcmbEtgName.Text
txtAhName.Text = fcmbAhName.Text

'fcmbAraName.BoundText = CStr(clsHOPT.GetEntityMastOptBoundCode("EttAraCode")): txtAraName.Text = fcmbAraName.Text
'fcmbStnName.BoundText = CStr(clsHOPT.GetEntityMastOptBoundCode("EttStnCode")): txtStnName.Text = fcmbStnName.Text
'fcmbEtgName.BoundText = CStr(clsHOPT.GetEntityMastOptBoundCode("EttEtgCode")): txtEtgName.Text = fcmbEtgName.Text
'fcmbAhName.BoundText = CStr(clsHOPT.GetEntityMastOptBoundCode("EttAhCode")): txtAhName.Text = fcmbAhName.Text

Call ShowEntityAge
Call ShowEntityBal

End Sub

Private Sub StoreEntityOldData()

mEttCode_old = mEttCode
mEttName_old = txtEttName.Text
mEttRegNo_old = Val(UnMyNumFmt(mskEttRegNo.Text))
mEttEtgCode_old = Val(fcmbEtgName.BoundText)
mEttAhCode_old = Val(fcmbAhName.BoundText)
mEttAraCode_old = Val(fcmbAraName.BoundText)

End Sub

Private Sub ShowEntityBal()
Dim mOpnBal As Double, mCurBal As Double, mLCount As Integer, mUCount As Integer, mCount As Integer

mOpnBal = 0
With clsAH
.GetData Val(fcmbAhName.BoundText)
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

End Sub

Private Sub Data_SaveEvent()
With clsETT
If FormAddEditMode = cFORM_ADDMODE Then
    .Clear
Else
    .GetData mEttCode
End If
.mName_str = txtEttName.Text
.mEttRegNo_lng = Val(UnMyNumFmt(mskEttRegNo.Text))
.mEttRegDate_dt = Ctod(dtpEttRegDate.Text)
.mEttSex_str = cmbEttSex.Text
.mEttAgeAsOnDt_dt = Ctod(dtpEttAgeAsOnDt.Text)
.mEttDob_dt = Ctod(dtpEttDob.Text)
.mEttEtgCode_lng = Val(fcmbEtgName.BoundText)
.mEttRefRela_str = cmbEttRefRela.Text
.mEttRefName_str = txtEttRefName.Text
.mEttAddr_str = txtEttAddr.Text
.mEttAraCode_lng = Val(fcmbAraName.BoundText)
.mEttStnCode_lng = Val(fcmbStnName.BoundText)
.mEttTelNo_str = txtEttTelNo.Text
.mEttSMSNo_str = txtEttSMSNo.Text
.mEttEmail_str = txtEttEmail.Text
.mEttRemark_str = txtEttRemark.Text
.mEttAhCode_lng = Val(fcmbAhName.BoundText)

If FormAddEditMode = cFORM_ADDMODE Then
    .AddNew
    mskFormBoundField.Text = .mCode_lng
Else
    .Update mEttCode
End If
If .mCode_lng > 0 Then   ' updated successfully
    .UpdateMast .mCode_lng
    .EndMast .mCode_lng
    
    Rem refreshing required here if new account created done at form_activate
    If clsAH.BeginAchd(Val(fcmbAhName.BoundText)) = True Then
        clsAH.GetData Val(fcmbAhName.BoundText)
        
        clsAH.EditOpnBal mJrnICode:=clsAH.OpnICode(clsAH.LOpnBal), mJrnAmt:=Val(UnMyAcFmt(mskAhOpBal.Text, txtDrCrFlag.Text))
        clsAH.Update Val(fcmbAhName.BoundText), mUpdOpnBalOnly:=True
        clsAH.UpdateAchd Val(fcmbAhName.BoundText)
        clsAH.EndAchd Val(fcmbAhName.BoundText)
    End If
    If FormAddEditMode = cFORM_ADDMODE Then
        clsAH.UpdateDependency Val(fcmbAhName.BoundText), True
    Else
        If mEttAhCode_old <> Val(fcmbAhName.BoundText) Or FormAddEditMode = cFORM_ADDMODE Then
            clsAH.UpdateDependency mEttAhCode_old, False
            clsAH.UpdateDependency Val(fcmbAhName.BoundText), True
        End If
    End If
    
    
    Rem updating user editing carry forward features
'    clsHOPT.mEttAraCodeOld_lng = clsETT.mEttAraCode_lng
'    clsHOPT.mEttStnCodeOld_lng = clsETT.mEttStnCode_lng
'    clsHOPT.mEttEtgCodeOld_lng = clsETT.mEttEtgCode_lng
'    clsHOPT.mEttAhCodeOld_lng = clsETT.mEttAhCode_lng
'    clsHOPT.UpdateEntityMastOld
    
    mEntrySaved = True
Else
    Call Data_CancelEvent
    ErrorBox "Entry Cancelled !!!"
End If

End With

End Sub

Private Sub Data_DeleteEvent()
Dim mDeleteit As Boolean, mRecAbsPos As Long, mEttAhCode As Long

If CanUserDeleteOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If (datRecset.EOF Or datRecset.BOF) = True Then
    Exit Sub
End If

mEttCode = datRecset.fields("EttCode")
mEttAhCode = datRecset.fields("EttAhCode")
mRecAbsPos = datRecset.AbsolutePosition

If clsETT.CanDeleteMast(mEttCode) = True Then
    txtVoid.SetFocus
    If clsETT.BeginMast(mEttCode) = True Then
        clsETT.DeleteMast mEttCode
        clsETT.UpdateMast mEttCode
        clsETT.EndMast mEttCode
        
        Call SmryList
        If datRecset.RecordCount > mRecAbsPos And mRecAbsPos > 0 Then
            datRecset.Move mRecAbsPos - 1, 1
        Else
            MoveRecToLast datRecset
        End If
        
        clsAH.UpdateDependency mEttAhCode, False
    End If
    ShowRecActiveFlexRow datRecset, Mfgrd1
    Mfgrd1.SetFocus
Else
    Mfgrd1.SetFocus
End If

End Sub

Private Sub Data_CancelEvent()
clsETT.CancelMast mEttCode
clsETT.EndMast mEttCode
mEntryAborted = True

End Sub

Private Sub txtEttRefName_GotFocus()
FlashActiveControl txtEttRefName, True
End Sub

Private Sub txtEttRefName_LostFocus()
FlashActiveControl txtEttRefName, False
End Sub

Private Sub txtEttRefName_Validate(Cancel As Boolean)
txtEttRefName.Text = ToMyWord(txtEttRefName.Text)
End Sub

Private Sub txtEttRemark_GotFocus()
FlashActiveControl txtEttRemark, True
End Sub

Private Sub txtEttRemark_LostFocus()
FlashActiveControl txtEttRemark, False
End Sub

Private Sub txtEttSMSNo_GotFocus()
FlashActiveControl txtEttSMSNo, True
End Sub

Private Sub txtEttSMSNo_LostFocus()
FlashActiveControl txtEttSMSNo, False
End Sub

Private Sub txtEttSmsNo_Validate(Cancel As Boolean)
Dim tRecset As ADODB.Recordset

If Trim(txtEttSMSNo.Text) <> "" Then
    Set tRecset = New ADODB.Recordset
    With tRecset
    .open "Select * from EntityMast" _
     & " where (EttTelNo = '" & Trim(txtEttSMSNo.Text) & "' or EttSmsNo = '" & Trim(txtEttSMSNo.Text) & "')" _
     & " and EttCode <> " & CStr(mEttCode) & "" _
     , dbBdkDatabase, adOpenKeyset, adLockOptimistic
    If .EOF = False Then
        AlertBox "Tel.No. or SMS No. already Exist for " _
        & vbCrLf & .fields("EttName") & " (" & CStr(.fields("EttRegNo")) & ")" _
        & vbCrLf & .fields("EttRefRela") & " " & .fields("EttRefName") _
        & vbCrLf & .fields("EttAddr") _
        & vbCrLf & .fields("EttTelNo") & "; " & .fields("EttSmsNo")
    End If
    End With
    CloseTable tRecset
End If
Set tRecset = Nothing

End Sub

Private Sub txtEttTelNo_GotFocus()
FlashActiveControl txtEttTelNo, True
End Sub

Private Sub txtEttTelNo_LostFocus()
FlashActiveControl txtEttTelNo, False
End Sub

Private Sub txtEtgName_Change()
If fcmbEtgName.CallFromText_Change = False Then
    fcmbEtgName.CallFromText_Change = True
    If InterActiveChange(txtEtgName) = True Then
        fcmbEtgName.UserText = Array(txtEtgName.Text, txtEtgName.SelStart)
        fcmbEtgName.Show
        txtEtgName.Text = fcmbEtgName.Text
        If fcmbEtgName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbEtgName.CallFromText_Change = False
End If

End Sub

Private Sub txtEtgName_GotFocus()
FlashActiveControl txtEtgName, True
End Sub

Private Sub txtEtgName_LostFocus()
FlashActiveControl txtEtgName, False
End Sub

Private Sub txtEtgName_Validate(Cancel As Boolean)
If Val(fcmbEtgName.BoundText) <= 0 Then
    ErrorBox "Invalid Selection !!!"
    txtEtgName.SetFocus
    Cancel = True
Else
    'If mEttEtgCode_old <> Val(fcmbEtgName.BoundText) Or FormAddEditMode = cFORM_ADDMODE Then
        'clsETG.GetData Val(fcmbEtgName.BoundText)
    'End If
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
Dim tRecset As ADODB.Recordset

clsListStru.Clear

Rem column definitions
clsListStru.AddFields mExpr:="EttCode", mAttrib:=cFAT_SYSTEM
clsListStru.AddFields mExpr:="EttName", mTitle:="Donor/Patient Name", mAlign:=1, mWidth:=4000, mShowItem:=True
clsListStru.AddFields mExpr:="EttRegNo", mTitle:="Reg.No", mAlign:=7, mWidth:=1000, mShowItem:=True
clsListStru.AddFields mExpr:="EttContNo", mTitle:="Contact No.", mAlign:=1, mWidth:=3000, mShowItem:=True
clsListStru.AddFields mExpr:="EttRefName", mTitle:="Care of", mAlign:=1, mWidth:=2500, mShowItem:=True
clsListStru.AddFields mExpr:="EttAddr", mTitle:="Address", mAlign:=1, mWidth:=2500, mShowItem:=True
clsListStru.AddFields mExpr:="EttAraName", mTitle:="Area", mAlign:=1, mWidth:=1500, mShowItem:=True
clsListStru.AddFields mExpr:="EttStnName", mTitle:="Station", mAlign:=1, mWidth:=1500, mShowItem:=True
'clsListStru.AddFields mExpr:="AhOpBal", mTitle:="Op.Balance", mAlign:=7, mWidth:=1750, mShowItem:=False
'clsListStru.AddFields mExpr:="AhOpDrBal", mTitle:="Op.Dr.Bal", mAlign:=7, mWidth:=1750, mShowItem:=False
'clsListStru.AddFields mExpr:="AhOpCrBal", mTitle:="Op.Cr.Bal", mAlign:=7, mWidth:=1750, mShowItem:=False
'clsListStru.AddFields mExpr:="AhCurBal", mTitle:="Cur.Balance", mAlign:=7, mWidth:=1750, mShowItem:=False
'clsListStru.AddFields mExpr:="AhCurDrBal", mTitle:="Cur.Dr.Bal", mAlign:=7, mWidth:=1750, mShowItem:=False
'clsListStru.AddFields mExpr:="AhCurCrBal", mTitle:="Cur.Cr.Bal", mAlign:=7, mWidth:=1750, mShowItem:=False
clsListStru.AddFields mExpr:="EttEtgName", mTitle:="Category", mAlign:=1, mWidth:=2000, mShowItem:=True
'clsListStru.AddFields mExpr:="EttAhName", mTitle:="Account Name", mAlign:=1, mWidth:=2000, mShowItem:=True

'If chkOpBal.Value = 1 Then
'    If chkCombinedOpBal.Value = 1 Then
'        clsListStru.UpdateField mAlias:="AhOpBal", mShowItem:=True
'    Else
'        clsListStru.UpdateField mAlias:="AhOpDrBal", mShowItem:=True
'        clsListStru.UpdateField mAlias:="AhOpCrBal", mShowItem:=True
'    End If
'End If
'If chkCurBal.Value = 1 Then
'    If chkCombinedCurBal.Value = 1 Then
'        clsListStru.UpdateField mAlias:="AhCurBal", mShowItem:=True
'    Else
'        clsListStru.UpdateField mAlias:="AhCurDrBal", mShowItem:=True
'        clsListStru.UpdateField mAlias:="AhCurCrBal", mShowItem:=True
'    End If
'End If

RefreshDatabase dbBdkDatabase
RefreshDatabase dbAcDatabase
RefreshDatabase dbGrpDatabase
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
Rem MoveRecToFirst datRecset
Set tRecset = datRecset.ActiveConnection.Execute(datRecset.Source)
With tRecset
Rem If .RecordCount > 0 Then
If IsValidRec(tRecset) = True Then
    Do While .EOF = False
        'clsETG.GetData .fields("EttEtgCode")
        'clsARA.GetData .fields("EttAraCode")
        'clsSTN.GetData .fields("EttStnCode")
        
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttCode")) = .fields("EttCode")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttName")) = .fields("EttName")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttRegNo")) = .fields("EttRegNo")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttContNo")) = .fields("EttContNo")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttRefName")) = .fields("EttRefName")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttAddr")) = .fields("EttAddr")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttAraName")) = .fields("AraName")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttStnName")) = .fields("StnName")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttEtgName")) = .fields("EtgName")
        'Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EttAhName")) = .fields("AhName")
'        If chkOpBal.Value = 1 Then
'            If chkCombinedOpBal.Value = 1 Then
'                aAcntBal = clsAH.GetAhOpnBal(.fields("EttAhCode"), mDrCrSeperated:=False)
'
'                mBal = aAcntBal(0)
'
'                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("AhOpBal")) = ToMyAcFmt(mBal)
'            Else
'                aAcntBal = clsAH.GetAhOpnBal(.fields("EttAhCode"), mDrCrSeperated:=True)
'                Rem debit balance
'                mBal = aAcntBal(0)
'
'                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("AhOpDrBal")) = ToMyAcFmt(mBal)
'
'                Rem credit balance
'                mBal = aAcntBal(1)
'
'                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("AhOpCrBal")) = ToMyAcFmt(mBal)
'            End If
'        End If
'        If chkCurBal.Value = 1 Then
'            If chkCombinedCurBal.Value = 1 Then
'                aAcntBal = clsAH.GetAhCurBal(.fields("EttAhCode"), sFinYrEndDate, mDrCrSeperated:=False)
'
'                mBal = aAcntBal(0)
'
'                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("AhCurBal")) = ToMyAcFmt(mBal)
'            Else
'                aAcntBal = clsAH.GetAhCurBal(.fields("EttAhCode"), sFinYrEndDate, mDrCrSeperated:=True)
'                Rem debit balance
'                mBal = aAcntBal(0)
'
'                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("AhCurDrBal")) = ToMyAcFmt(mBal)
'
'                Rem credit balance
'                mBal = aAcntBal(1)
'
'                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("AhCurCrBal")) = ToMyAcFmt(mBal)
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
CloseTable tRecset
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
Dim aAhOpBal As Variant, aAhCurBal As Variant, mRowPos As Integer

Exit Sub

lblOpnDrAmtTot.Caption = ToMyAcFmt(0)
lblOpnCrAmtTot.Caption = ToMyAcFmt(0)
lblOpnNetBal.Caption = ToMyAcFmt(0)
lblCurDrAmtTot.Caption = ToMyAcFmt(0)
lblCurCrAmtTot.Caption = ToMyAcFmt(0)
lblCurNetBal.Caption = ToMyAcFmt(0)

mOpnDrAmtTot = 0: mOpnCrAmtTot = 0: mOpnNetBal = 0
mCurDrAmtTot = 0: mCurCrAmtTot = 0: mCurNetBal = 0

MoveRecToFirst datRecset
Do While datRecset.EOF = False
    Rem opening balance
    aAhOpBal = clsAH.GetAhOpnBal(datRecset.fields("EttAhCode"), mDrCrSeperated:=True)
    mOpnDrAmtTot = mOpnDrAmtTot + aAhOpBal(0)
    mOpnCrAmtTot = mOpnCrAmtTot + aAhOpBal(1)
    
    Rem current balance
    aAhCurBal = clsAH.GetAhCurBal(datRecset.fields("EttAhCode"), sFinYrEndDate, mDrCrSeperated:=True)
    mCurDrAmtTot = mCurDrAmtTot + aAhCurBal(0)
    mCurCrAmtTot = mCurCrAmtTot + aAhCurBal(1)
    
    datRecset.MoveNext
Loop
mOpnNetBal = mOpnDrAmtTot + mOpnCrAmtTot
mCurNetBal = mCurDrAmtTot + mCurCrAmtTot

lblOpnDrAmtTot.Caption = ToMyAcFmt(mOpnDrAmtTot)
lblOpnCrAmtTot.Caption = ToMyAcFmt(mOpnCrAmtTot)
lblOpnNetBal.Caption = ToMyAcFmt(mOpnNetBal)
lblCurDrAmtTot.Caption = ToMyAcFmt(mCurDrAmtTot)
lblCurCrAmtTot.Caption = ToMyAcFmt(mCurCrAmtTot)
lblCurNetBal.Caption = ToMyAcFmt(mCurNetBal)

'frBottomTotal.Left = (dgList.Columns(dgList.Columns.Count - 1).Left + dgList.Columns(dgList.Columns.Count - 1).Width - frBottomTotal.Width)

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
    txtSearch1Text.Text = JoinKeyAscii(txtSearch1Text.Text, KeyAscii)
    Call txtSearch1Text_InterActiveChange
End If

End Sub

Private Sub Mfgrd1_RowColChange()
ShowActiveFlexRow Mfgrd1
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

Private Sub txtEttTelNo_Validate(Cancel As Boolean)
Dim tRecset As ADODB.Recordset

If Trim(txtEttTelNo.Text) <> "" Then
    Set tRecset = New ADODB.Recordset
    With tRecset
    .open "Select * from EntityMast" _
     & " where (EttTelNo = '" & Trim(txtEttTelNo.Text) & "' or EttSmsNo = '" & Trim(txtEttTelNo.Text) & "')" _
     & " and EttCode <> " & CStr(mEttCode) & "" _
     , dbBdkDatabase, adOpenKeyset, adLockOptimistic
    If .EOF = False Then
        AlertBox "Tel.No. or SMS No. already Exist for " _
        & vbCrLf & .fields("EttName") & " (" & CStr(.fields("EttRegNo")) & ")" _
        & vbCrLf & .fields("EttRefName") _
        & vbCrLf & .fields("EttAddr") _
        & vbCrLf & .fields("EttTelNo") & "; " & .fields("EttSmsNo")
    End If
    End With
    CloseTable tRecset
End If
Set tRecset = Nothing

End Sub

Private Sub txtList1Col_DblClick(Index As Integer)
Call Mfgrd1_DblClick
End Sub

Private Sub txtList1Col_GotFocus(Index As Integer)
Mfgrd1.SetFocus
End Sub

Private Sub txtSearch1Text_InterActiveChange(Optional ByVal mText)
mText = IIf(IsMissing(mText) = True, txtSearch1Text.Text, mText)
SearchFlex Mfgrd1, clsListStru.GetItemIndex("EttName"), mText
ShowActiveFlexRow Mfgrd1

End Sub

Private Sub txtSearch1Text_GotFocus()
FlashActiveControl txtSearch1Text, True
End Sub

Private Sub txtSearch1Text_LostFocus()
FlashActiveControl txtSearch1Text, False
End Sub

Private Sub txtSearchEttContNo_GotFocus()
FlashActiveControl txtSearchEttContNo, True
mSearchEttContNoStartRow = Mfgrd1.FixedRows
End Sub

Private Sub txtSearchEttContNo_KeyDown(KeyCode As Integer, Shift As Integer)
If KeyCode = vbKeyReturn And Shift = 0 And Trim(txtSearchEttContNo.Text) <> "" Then
    SearchRawFlex MfgrdX:=Mfgrd1, mColno:=clsListStru.GetItemIndex("EttContNo"), mTextstr:=Trim(txtSearchEttContNo.Text), mDefStartRow:=mSearchEttContNoStartRow, mDefSearchMatchOpt:=cSEARCH_MIDSTR
    mSearchEttContNoStartRow = Mfgrd1.Row + 1
    If mSearchEttContNoStartRow >= Mfgrd1.Rows - 1 Then
        mSearchEttContNoStartRow = Mfgrd1.FixedRows
    End If
End If

End Sub

Private Sub txtSearchEttContNo_LostFocus()
FlashActiveControl txtSearchEttContNo, False
End Sub

Private Sub txtStnName_Change()
If fcmbStnName.CallFromText_Change = False Then
    fcmbStnName.CallFromText_Change = True
    If InterActiveChange(txtStnName) = True Then
        fcmbStnName.UserText = Array(txtStnName.Text, txtStnName.SelStart)
        fcmbStnName.Show
        txtStnName.Text = fcmbStnName.Text
        If fcmbStnName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbStnName.CallFromText_Change = False
End If

End Sub

Private Sub txtStnName_GotFocus()
FlashActiveControl txtStnName, True
End Sub

Private Sub txtStnName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtStnName_Change
End If

End Sub

Private Sub txtStnName_LostFocus()
FlashActiveControl txtStnName, False
End Sub

Private Sub txtStnName_Validate(Cancel As Boolean)
If Val(fcmbStnName.BoundText) <= 0 Then
    ErrorBox "Invalid Selection !!!"
    txtStnName.SetFocus
    Cancel = True
End If

End Sub

Private Sub ShowEttDob()
Dim mEttDob As Date

mEttDob = CalcDob(Ctod(dtpEttAgeAsOnDt.Text), Val(mskEttAgeYr.Text), Val(mskEttAgeMn.Text), Val(mskEttAgeDy.Text))
dtpEttDob.Text = Dtoc(mEttDob)

End Sub

Private Sub ShowEntityAge()
Dim mYears As Long, mMonths As Long, mDays As Long

CalcAge Ctod(dtpEttDob.Text), Ctod(dtpEttAgeAsOnDt.Text), mYears, mMonths, mDays
mskEttAgeYr.Text = CStr(mYears)
mskEttAgeMn.Text = CStr(mMonths)
mskEttAgeDy.Text = CStr(mDays)

End Sub
