VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmPatientMast 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   ClientHeight    =   8850
   ClientLeft      =   60
   ClientTop       =   60
   ClientWidth     =   14490
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
   ScaleHeight     =   8850
   ScaleWidth      =   14490
   ShowInTaskbar   =   0   'False
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
      ItemData        =   "PatMast.frx":0000
      Left            =   0
      List            =   "PatMast.frx":000D
      Style           =   1  'Simple Combo
      TabIndex        =   34
      TabStop         =   0   'False
      Text            =   "cmbFormMode"
      Top             =   360
      Width           =   1455
   End
   Begin VB.Frame frFormDtl 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFD7B7&
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
      TabIndex        =   33
      Top             =   840
      Width           =   12735
      Begin VB.ComboBox cmbPttSex 
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
      Begin VB.TextBox dtpPttAgeAsOnDt 
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
      Begin VB.TextBox dtpPttDob 
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
      Begin VB.TextBox mskPttAgeDy 
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
      Begin VB.TextBox mskPttAgeMn 
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
      Begin VB.TextBox mskPttAgeYr 
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
      Begin VB.TextBox txtPttRemark 
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
         TabIndex        =   24
         Top             =   5640
         Width           =   5295
      End
      Begin VB.CheckBox chkPttShowInList 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Show in List:"
         BeginProperty Font 
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
         Left            =   360
         TabIndex        =   23
         Top             =   5160
         Width           =   2655
      End
      Begin VB.CheckBox chkPttInfAllowed 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Increament Allowed:"
         BeginProperty Font 
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
         Left            =   360
         TabIndex        =   19
         Top             =   4440
         Width           =   2655
      End
      Begin VB.CheckBox chkPttDefAllowed 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Decreament Allowed:"
         BeginProperty Font 
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
         Left            =   3480
         TabIndex        =   20
         Top             =   4440
         Width           =   2655
      End
      Begin VB.CheckBox chkPttDiscAllowed 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Discount Allowed:"
         BeginProperty Font 
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
         Left            =   360
         TabIndex        =   21
         Top             =   4800
         Width           =   2655
      End
      Begin VB.TextBox mskPttDiscPer 
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
         Left            =   4920
         TabIndex        =   22
         Tag             =   "AhCode"
         Text            =   "0.00 %"
         Top             =   4800
         Width           =   1215
      End
      Begin VB.TextBox txtPttEmail 
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
      Begin VB.TextBox txtPttSMSNo 
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
         Left            =   8370
         MaxLength       =   50
         TabIndex        =   16
         Top             =   3240
         Width           =   3450
      End
      Begin VB.TextBox txtPttTelNo 
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
         Left            =   8370
         MaxLength       =   50
         TabIndex        =   14
         Top             =   2880
         Width           =   3450
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
      Begin VB.TextBox txtPttAddr 
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
      Begin VB.ComboBox cmbPttRefRela 
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
      Begin VB.TextBox txtPttRefName 
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
      Begin VB.TextBox mskPttRegNo 
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
         TabIndex        =   25
         Top             =   6120
         Width           =   5295
      End
      Begin VB.TextBox dtpPttRegDate 
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
      Begin VB.TextBox txtPcgName 
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
         TabIndex        =   27
         Tag             =   "AhCode"
         Text            =   "__"
         Top             =   6480
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
         TabIndex        =   26
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   6480
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
         Top             =   6000
         Width           =   375
      End
      Begin VB.TextBox txtPttName 
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
         TabIndex        =   80
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
         TabIndex        =   79
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
         TabIndex        =   78
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
         TabIndex        =   77
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
         TabIndex        =   76
         Top             =   5640
         Width           =   2415
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Discount (%):"
         BeginProperty Font 
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
         Left            =   3480
         TabIndex        =   75
         Top             =   4800
         Width           =   1455
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
         TabIndex        =   74
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
         TabIndex        =   73
         Top             =   3240
         Width           =   1545
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
         TabIndex        =   72
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
         TabIndex        =   71
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
         TabIndex        =   70
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
         TabIndex        =   69
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
         TabIndex        =   68
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
         TabIndex        =   67
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
         TabIndex        =   54
         Top             =   6120
         Width           =   2415
      End
      Begin VB.Line Line3 
         Index           =   2
         X1              =   0
         X2              =   12720
         Y1              =   5520
         Y2              =   5520
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
         TabIndex        =   52
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
         TabIndex        =   51
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
         TabIndex        =   28
         Top             =   6840
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
         TabIndex        =   45
         Top             =   6840
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
         TabIndex        =   44
         Top             =   6480
         Width           =   2415
      End
      Begin VB.Label Label2 
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
         Height          =   255
         Index           =   0
         Left            =   360
         TabIndex        =   36
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
         TabIndex        =   35
         Top             =   240
         Width           =   2415
      End
   End
   Begin VB.Frame frFormSmry 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFD7B7&
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
      TabIndex        =   32
      Top             =   840
      Width           =   13815
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
         TabIndex        =   50
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
         TabIndex        =   48
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
            BeginProperty Font 
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
            TabIndex        =   40
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
            TabIndex        =   39
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
            TabIndex        =   41
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
            TabIndex        =   42
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
         Height          =   6615
         Left            =   120
         TabIndex        =   49
         Top             =   720
         Width           =   13335
         _ExtentX        =   23521
         _ExtentY        =   11668
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
         TabIndex        =   55
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
            TabIndex        =   66
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
            TabIndex        =   65
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
            TabIndex        =   64
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
            TabIndex        =   63
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
            TabIndex        =   62
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
            TabIndex        =   61
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
            TabIndex        =   60
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
            TabIndex        =   59
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
            TabIndex        =   58
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
            TabIndex        =   57
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
            TabIndex        =   56
            Top             =   1080
            Width           =   1695
         End
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
         TabIndex        =   53
         Top             =   360
         Width           =   735
      End
   End
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Patient Master"
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
Attribute VB_Name = "frmPatientMast"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim mFormLoaded As Boolean, mLastKeyPressed As Integer, mMaskKeyPressed As Integer
Dim mFormUIdCode As Long, mFormPatUIdFileName As String, mFormPatAcsPermFileName As String
Dim mPttCode As Long
Dim mRemoteAccess As Boolean, mEntrySaved As Boolean, mEntryAborted As Boolean
Dim dbAcDatabase As New ADODB.Connection, dbVgnDatabase As New ADODB.Connection, dbGrpDatabase As New ADODB.Connection, dbComDatabase As New ADODB.Connection
Dim datRecset As New ADODB.Recordset
Dim mPttCode_old As Long, mPttName_old As String, mPttRegNo_old As Long, mPttPcgCode_old As Long, mPttAhCode_old As Long, mPttAgeChanged As Boolean, mPttAraCode_old As Long
Dim clsAH As clsAccountHead, clsPAT As clsVgnMasterEntry, clsPCG As clsVgnMasterEntry, clsARA As clsComMastEntry, clsSTN As clsComMastEntry, mActiveControl As Object, clsListStru As clsSelectQueryStructure
Rem Dim clsVGNOPT As clsVgnOpdOptionsEntry
Dim fcmbAhName As clsComFlexSearch, fcmbAraName As clsComFlexSearch, fcmbStnName As clsComFlexSearch
Dim fcmbPttName As clsVgnFlexSearch, fcmbPttRegNo As clsVgnFlexSearch, fcmbPcgName As clsVgnFlexSearch

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
mPttCode = mAccessCode
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

Public Property Get PttName() As String
PttName = txtPttName.Text
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

Private Sub chkPttDefAllowed_GotFocus()
FlashActiveControl chkPttDefAllowed, True
End Sub

Private Sub chkPttDefAllowed_LostFocus()
FlashActiveControl chkPttDefAllowed, False
End Sub

Private Sub chkPttDiscAllowed_GotFocus()
FlashActiveControl chkPttDiscAllowed, True
End Sub

Private Sub chkPttDiscAllowed_LostFocus()
FlashActiveControl chkPttDiscAllowed, False
End Sub

Private Sub chkPttInfAllowed_GotFocus()
FlashActiveControl chkPttInfAllowed, True
End Sub

Private Sub chkPttInfAllowed_LostFocus()
FlashActiveControl chkPttInfAllowed, False
End Sub

Private Sub chkPttShowInList_GotFocus()
FlashActiveControl chkPttShowInList, True
End Sub

Private Sub chkPttShowInList_LostFocus()
FlashActiveControl chkPttShowInList, False
End Sub

Private Sub cmbPttRefRela_GotFocus()
FlashActiveControl cmbPttRefRela, True
End Sub

Private Sub cmbPttRefRela_LostFocus()
FlashActiveControl cmbPttRefRela, False
End Sub

Private Sub cmbPttRefRela_Validate(Cancel As Boolean)
If cmbPttRefRela.ListIndex = -1 Then
    ErrorBox "Invalid Selection !!!"
    cmbPttRefRela.SetFocus
    Cancel = True
End If

End Sub

Private Sub cmbPttSex_GotFocus()
FlashActiveControl cmbPttSex, True
End Sub

Private Sub cmbPttSex_LostFocus()
FlashActiveControl cmbPttSex, False
End Sub

Private Sub cmbPttSex_Validate(Cancel As Boolean)
If cmbPttSex.ListIndex = -1 Then
    ErrorBox "Invalid Selection !!!"
    cmbPttSex.SetFocus
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
        txtPttName.SetFocus
    End If
End If

End Sub

Private Sub cmdSaveForm_Click()
Call Data_SaveEvent

txtVoid.SetFocus
Call SmryList
txtSearch1Text_InterActiveChange txtPttName.Text

''datRecset.Find "PttName='" & txtPttName.Text & "'", Start:=1
''ShowRecActiveFlexRow datRecset, Mfgrd1

Call ShowEntryMode(False)
Mfgrd1.SetFocus
Call CalcDrCrAmtTot

End Sub

Private Sub cmdSaveForm_GotFocus()
Dim mPatAcsPermNo As Integer, mRetryCount As Integer

txtVoid.SetFocus
cmdSaveForm.Enabled = False
If Data_Verify() = True Then
    If CanAccept() = True Then
        If GetAccessPerm(mPatAcsPermNo, mRetryCount, mFormPatAcsPermFileName) = True And mRetryCount = 0 Then
            If Data_NetwAuth() = True Then
                Call cmdSaveForm_Click
                Close #mPatAcsPermNo
                If mRemoteAccess = True Then
                    ''Unload Me
                    Me.Hide
                    Exit Sub
                End If
            Else
                Close #mPatAcsPermNo
            End If
        Else
            Close #mPatAcsPermNo
            AlertBox "System Busy, Try Again !!!"
            
            txtPttName.SetFocus
        End If
    Else
        txtPttName.SetFocus
    End If
End If
cmdSaveForm.Enabled = True

End Sub

Private Sub dtpPttAgeAsOnDt_Change()
mPttAgeChanged = True
End Sub

Private Sub dtpPttAgeAsOnDt_GotFocus()
FlashActiveControl dtpPttAgeAsOnDt, True
mPttAgeChanged = False
End Sub

Private Sub dtpPttAgeAsOnDt_LostFocus()
FlashActiveControl dtpPttAgeAsOnDt, False
End Sub

Private Sub dtpPttAgeAsOnDt_Validate(Cancel As Boolean)
dtpPttAgeAsOnDt.Text = ToMyDate(dtpPttAgeAsOnDt.Text)
If IsDate(dtpPttAgeAsOnDt.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpPttAgeAsOnDt.SetFocus
    Cancel = True
Else
    If mPttAgeChanged = True Then
        Call ShowPttDob
    End If
End If

End Sub

Private Sub dtpPttDob_Change()
mPttAgeChanged = True
End Sub

Private Sub dtpPttDob_GotFocus()
FlashActiveControl dtpPttDob, True
mPttAgeChanged = False
End Sub

Private Sub dtpPttDob_LostFocus()
FlashActiveControl dtpPttDob, False
End Sub

Private Sub dtpPttDob_Validate(Cancel As Boolean)
Dim mYears As Long, mMonths As Long, mDays As Long

dtpPttDob.Text = ToMyDate(dtpPttDob.Text)
If IsDate(dtpPttDob.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpPttDob.SetFocus
    Cancel = True
Else
    If mPttAgeChanged = True Then
        Call ShowPatAge
    End If
End If

End Sub

Private Sub dtpPttRegDate_Change()
mPttAgeChanged = True
End Sub

Private Sub dtpPttRegDate_GotFocus()
mPttAgeChanged = False
FlashActiveControl dtpPttRegDate, True
End Sub

Private Sub dtpPttRegDate_LostFocus()
FlashActiveControl dtpPttRegDate, False
End Sub

Private Sub dtpPttRegDate_Validate(Cancel As Boolean)
dtpPttRegDate.Text = ToMyDate(dtpPttRegDate.Text)
If IsDate(dtpPttRegDate.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpPttRegDate.SetFocus
    Cancel = True
Else
    If mPttAgeChanged = True Then
        dtpPttAgeAsOnDt.Text = dtpPttRegDate.Text
        Call ShowPttDob
    End If
End If

End Sub

Private Sub Form_Activate()
If mFormLoaded = False Then
    If mRemoteAccess = True Then
        MoveRecToFirst datRecset
        ShowRecActiveFlexRow datRecset, Mfgrd1
        Mfgrd1.SetFocus
        If mPttCode = 0 Then
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
    RefreshDatabase dbVgnDatabase
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

mFormPatUIdFileName = "PatMast.Uid"
mFormPatAcsPermFileName = "PatMast.Acp"
mFormUIdCode = GetUIdCode(mProcess:=Me.Name, mUIdFileName:=mFormPatUIdFileName, mAcsPermFileName:=mFormPatAcsPermFileName)

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
OpenVgnDataSource dbVgnDatabase
OpenGrpDataSource dbGrpDatabase
OpenComDataSource dbComDatabase

cmbPttSex.Clear
cmbPttSex.AddItem "Male"
cmbPttSex.AddItem "Female"
cmbPttSex.AddItem "None"

cmbPttRefRela.Clear
cmbPttRefRela.AddItem "C/o"
cmbPttRefRela.AddItem "S/o"
cmbPttRefRela.AddItem "D/o"
cmbPttRefRela.AddItem "W/o"
cmbPttRefRela.AddItem "F/o"
cmbPttRefRela.AddItem "M/o"

Set clsAH = New clsAccountHead
Set clsAH.dbAcDatabase = dbAcDatabase
Set clsAH.dbGrpDatabase = dbGrpDatabase

Set clsListStru = New clsSelectQueryStructure

'Set clsVGNOPT = New clsVgnOpdOptionsEntry
'clsVGNOPT.blnPatMastOptMast = True
'clsVGNOPT.Init
'clsVGNOPT.GetPatMastOptData

Set clsPAT = New clsVgnMasterEntry
Set clsPAT.dbAcDatabase = dbAcDatabase
Set clsPAT.dbVgnDatabase = dbVgnDatabase
Set clsPAT.dbComDatabase = dbComDatabase
clsPAT.blnPatMast = True
clsPAT.Init

Set clsPCG = New clsVgnMasterEntry
Set clsPCG.dbVgnDatabase = dbVgnDatabase
clsPCG.blnPatCatgMast = True
clsPCG.Init

Set clsARA = New clsComMastEntry
Set clsARA.dbAcDatabase = dbAcDatabase
clsARA.blnAreaMast = True
clsARA.Init

Set clsSTN = New clsComMastEntry
Set clsSTN.dbAcDatabase = dbAcDatabase
clsSTN.blnStationMast = True
clsSTN.Init

Set fcmbAhName = New clsComFlexSearch
Set fcmbAhName.dbAcDatabase = dbAcDatabase
fcmbAhName.blnAchdMastList = True
fcmbAhName.Init

Set fcmbPcgName = New clsVgnFlexSearch
Set fcmbPcgName.dbVgnDatabase = dbVgnDatabase
fcmbPcgName.blnPatCatgMstList = True
fcmbPcgName.Init

Set fcmbAraName = New clsComFlexSearch
Set fcmbAraName.dbAcDatabase = dbAcDatabase
fcmbAraName.blnAreaMastList = True
fcmbAraName.Init

Set fcmbStnName = New clsComFlexSearch
Set fcmbStnName.dbAcDatabase = dbAcDatabase
fcmbStnName.blnStationMastList = True
fcmbStnName.Init

Set fcmbPttRegNo = New clsVgnFlexSearch
Set fcmbPttRegNo.dbVgnDatabase = dbVgnDatabase
Set fcmbPttRegNo.dbComDatabase = dbComDatabase
fcmbPttRegNo.blnPatMastListByRegNo = True
fcmbPttRegNo.Init

Set fcmbPttName = New clsVgnFlexSearch
Set fcmbPttName.dbVgnDatabase = dbVgnDatabase
Set fcmbPttName.dbComDatabase = dbComDatabase
fcmbPttName.blnPatMastListByName = True
fcmbPttName.Init

If mRemoteAccess = True Then
    datRecset.open "Select * from PatMast left join AchdMast on PatMast.PttAhCode=AchdMast.AhCode where PttCode=" & CStr(mPttCode) & " order by PttName", dbComDatabase, adOpenKeyset, adLockOptimistic
Else
    datRecset.open "Select * from PatMast left join AchdMast on PatMast.PttAhCode=AchdMast.AhCode order by PttName", dbComDatabase, adOpenKeyset, adLockOptimistic
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
Rem Set clsVGNOPT = Nothing
Set clsAH = Nothing
Set clsPAT = Nothing
Set clsPCG = Nothing
Set clsARA = Nothing
Set clsSTN = Nothing
Set fcmbPttRegNo = Nothing
Set fcmbPttName = Nothing
Set fcmbAhName = Nothing
Set fcmbPcgName = Nothing
Set fcmbAraName = Nothing
Set fcmbStnName = Nothing
Set clsListStru = Nothing

CloseTable datRecset
CloseDataSource dbAcDatabase
CloseDataSource dbVgnDatabase
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
Dim mPttRegNo As Long

Data_Verify = False
If Val(mskFormBoundField.Text) < 1 And FormAddEditMode = cFORM_EDITMODE Then
    ErrorBox "Invalid Key Value !!!"
    txtPttName.SetFocus
    GoTo EndSub
End If
If Trim(txtPttName.Text) = "" Then
    ErrorBox "Invalid Input !!!"
    txtPttName.SetFocus
    GoTo EndSub
End If
mPttRegNo = Val(UnMyNumFmt(mskPttRegNo.Text))
If mPttRegNo < 0 Then
    ErrorBox "Invalid Input !!!"
    mskPttRegNo.SetFocus
    GoTo EndSub
Else
    If mPttRegNo <> mPttRegNo_old Or FormAddEditMode = cFORM_ADDMODE Then
'        If FormAddEditMode = cFORM_ADDMODE And mPttRegNo <> mPttRegNo_old And clsVGNOPT.mPttRegNoAddModeChange_bln = False Then
'            AlertBox "Change Prohibited in Add Mode !!!"
'            mskPttRegNo.Text = ToMyNumFmt(mPttRegNo_old, mDecimals:=0)
'            mskPttRegNo.SetFocus
'            GoTo EndSub
'
'        ElseIf FormAddEditMode = cFORM_EDITMODE And mPttRegNo <> mPttRegNo_old And clsVGNOPT.mPttRegNoEditModeChange_bln = False Then
'            AlertBox "Change Prohibited in Edit Mode !!!"
'            mskPttRegNo.Text = ToMyNumFmt(mPttRegNo_old, mDecimals:=0)
'            mskPttRegNo.SetFocus
'            GoTo EndSub
'
'        ElseIf mPttRegNo = 0 And clsVGNOPT.mPttRegNoNotZero_bln = True Then
'            AlertBox "Prohibited Zero Patient Reg.No. !!!"
'            If FormAddEditMode = cFORM_ADDMODE Then
'                If clsVGNOPT.mPttRegNoAutoNumber_bln = True Then
'                    mPttRegNo = GetNextSeqno(dbVgnDatabase, "PatMast", "PttRegNo")
'                    mskPttRegNo.Text = ToMyNumFmt(mPttRegNo, mDecimals:=0)
'                End If
'            Else
'                mskPttRegNo.Text = ToMyNumFmt(mPttRegNo_old, mDecimals:=0)
'            End If
'            mskPttRegNo.SetFocus
'            GoTo EndSub
'
'        ElseIf mPttRegNo <> 0 Then
        If mPttRegNo <> 0 Then
            If ChkIsDuplicate(dbVgnDatabase, "PatMast", "PttRegNo", mPttRegNo, "PttCode", mPttCode) = True Then
                ErrorBox "Duplicate Input !!!"
                mskPttRegNo.SetFocus
                ' -----------
                If FormAddEditMode = cFORM_ADDMODE Then
                    'If clsVGNOPT.mPttRegNoAutoNumber_bln = True Then
                        mPttRegNo = GetNextSeqno(dbVgnDatabase, "PatMast", "PttRegNo")
                    'End If
                Else
                    mPttRegNo = mPttRegNo_old
                End If
                mskPttRegNo.Text = ToMyNumFmt(mPttRegNo, mDecimals:=0)
                GoTo EndSub
            End If
            
        End If
    End If
End If
If IsDate(dtpPttRegDate.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpPttRegDate.SetFocus
    GoTo EndSub
End If
If cmbPttSex.ListIndex = -1 Then
    ErrorBox "Invalid Selection !!!"
    cmbPttSex.SetFocus
    GoTo EndSub
End If
If Val(mskPttAgeYr.Text) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskPttAgeYr.SetFocus
    GoTo EndSub
End If
If Val(mskPttAgeMn.Text) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskPttAgeMn.SetFocus
    GoTo EndSub
End If
If Val(mskPttAgeDy.Text) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskPttAgeDy.SetFocus
    GoTo EndSub
End If
If Val(mskPttAgeYr.Text) < 1 And Val(mskPttAgeMn.Text) < 1 And Val(mskPttAgeDy.Text) < 1 Then
    ErrorBox "Invalid Input !!!"
    mskPttAgeYr.SetFocus
    GoTo EndSub
End If
If IsDate(dtpPttAgeAsOnDt.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpPttAgeAsOnDt.SetFocus
    GoTo EndSub
End If
If IsDate(dtpPttDob.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpPttDob.SetFocus
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
If Val(fcmbPcgName.BoundText) <= 0 Then
    ErrorBox "Invalid Selection !!!"
    txtPcgName.SetFocus
    GoTo EndSub
End If
If Val(UnMyPerFmt(mskPttDiscPer.Text)) < 0 Then
    ErrorBox "Invalid Discount Percentage !!!"
    mskPttDiscPer.SetFocus
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
Dim mPttRegNo As Long
Data_NetwAuth = False

mPttRegNo = Val(UnMyNumFmt(mskPttRegNo.Text))
If mPttRegNo <> mPttRegNo_old Or FormAddEditMode = cFORM_ADDMODE Then
    If mPttRegNo <> 0 Then
        If ChkIsDuplicate(dbVgnDatabase, "PatMast", "PttRegNo", mPttRegNo, "PttCode", mPttCode) = True Then
            ErrorBox "Duplicate Input !!!"
            mskPttRegNo.SetFocus
            ' -------
            If FormAddEditMode = cFORM_ADDMODE Then
                'If clsVGNOPT.mPttRegNoAutoNumber_bln = True Then
                    mPttRegNo = GetNextSeqno(dbVgnDatabase, "PatMast", "PttRegNo")
                'End If
            Else
                mPttRegNo = mPttRegNo_old
            End If
            mskPttRegNo.Text = ToMyNumFmt(mPttRegNo, mDecimals:=0)
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

Private Sub mskPttAgeDy_Change()
mPttAgeChanged = True
End Sub

Private Sub mskPttAgeDy_GotFocus()
FlashActiveControl mskPttAgeDy, True
mPttAgeChanged = False
End Sub

Private Sub mskPttAgeDy_LostFocus()
FlashActiveControl mskPttAgeDy, False
End Sub

Private Sub mskPttAgeDy_Validate(Cancel As Boolean)
mskPttAgeDy.Text = ToMyNumFmt(mskPttAgeDy.Text, mDecimals:=0, mUseAbs:=True, mGroupedDigit:=False)
If mPttAgeChanged = True Then
    Call ShowPttDob
End If

End Sub

Private Sub mskPttAgeMn_Change()
mPttAgeChanged = True
End Sub

Private Sub mskPttAgeMn_GotFocus()
FlashActiveControl mskPttAgeMn, True
mPttAgeChanged = False
End Sub

Private Sub mskPttAgeMn_LostFocus()
FlashActiveControl mskPttAgeMn, False
End Sub

Private Sub mskPttAgeMn_Validate(Cancel As Boolean)
mskPttAgeMn.Text = ToMyNumFmt(mskPttAgeMn.Text, mDecimals:=0, mUseAbs:=True, mGroupedDigit:=False)
If mPttAgeChanged = True Then
    Call ShowPttDob
End If

End Sub

Private Sub mskPttAgeYr_Change()
mPttAgeChanged = True
End Sub

Private Sub mskPttAgeYr_GotFocus()
FlashActiveControl mskPttAgeYr, True
mPttAgeChanged = False
End Sub

Private Sub mskPttAgeYr_LostFocus()
FlashActiveControl mskPttAgeYr, False
End Sub

Private Sub mskPttAgeYr_Validate(Cancel As Boolean)
mskPttAgeYr.Text = ToMyNumFmt(mskPttAgeYr.Text, mDecimals:=0, mUseAbs:=True, mGroupedDigit:=False)
If mPttAgeChanged = True Then
    Call ShowPttDob
End If

End Sub

Private Sub mskPttDiscPer_GotFocus()
FlashActiveControl mskPttDiscPer, True
End Sub

Private Sub mskPttDiscPer_LostFocus()
FlashActiveControl mskPttDiscPer, False
End Sub

Private Sub mskPttDiscPer_Validate(Cancel As Boolean)
mskPttDiscPer.Text = ToMyPerFmt(mskPttDiscPer.Text)
If Val(UnMyPerFmt(mskPttDiscPer.Text)) < 0 Then
    ErrorBox "Invalid Discount Percentage !!!"
    mskPttDiscPer.SetFocus
    Cancel = True
End If

End Sub

Private Sub mskPttRegNo_GotFocus()
FlashActiveControl mskPttRegNo, True
End Sub

Private Sub mskPttRegNo_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    If fcmbPttRegNo.CallFromText_Change = False Then
        fcmbPttRegNo.CallFromText_Change = True
        If InterActiveChange(mskPttRegNo) = True Then
            fcmbPttRegNo.UserText = Array(mskPttRegNo.Text, mskPttRegNo.SelStart)
            fcmbPttRegNo.Show
            If fcmbPttRegNo.ListSelected = True And Val(fcmbPttRegNo.BoundText) > 0 Then
                If FormAddEditMode = cFORM_ADDMODE Then
                    clsPAT.EndMast mPttCode
                    
                    FormAddEditMode = cFORM_EDITMODE
                    mPttCode = Val(fcmbPttRegNo.BoundText)
                    If clsPAT.BeginMast(mPttCode) = True Then
                        mPttCode = clsPAT.ActiveCode
                    Else
                        mPttCode = 0
                    End If
                    ShowPatData mPttCode
                    Call StorePatOldData
                    Rem SendKeys "{tab}"
                Else
                    AlertBox "Prohibited in Edit Mode !!!"
                End If
            End If
        End If
        fcmbPttRegNo.CallFromText_Change = False
    End If
ElseIf MyAddNewKey(Shift, KeyCode) = True Then
    If FormAddEditMode = cFORM_ADDMODE Then
        clsPAT.EndMast mPttCode
        
        If clsPAT.BeginMast(0) = True Then
            mPttCode = clsPAT.ActiveCode
        Else
            mPttCode = 0
        End If
        ShowPatData mPttCode
        Call ShowPatDefData
        Call StorePatOldData
    Else
        AlertBox "Prohibited in Edit Mode !!!"
    End If
End If

End Sub

Private Sub mskPttRegNo_LostFocus()
FlashActiveControl mskPttRegNo, False
End Sub

Private Sub mskPttRegNo_Validate(Cancel As Boolean)
Dim mPttRegNo As Long

mPttRegNo = Val(UnMyNumFmt(mskPttRegNo.Text))
If mPttRegNo < 0 Then
    ErrorBox "Invalid Input !!!"
    Cancel = True
    mskPttRegNo.SetFocus
Else
    If mPttRegNo <> mPttRegNo_old Or FormAddEditMode = cFORM_ADDMODE Then
'        If FormAddEditMode = cFORM_ADDMODE And mPttRegNo <> mPttRegNo_old And clsVGNOPT.mPttRegNoAddModeChange_bln = False Then
'            AlertBox "Change Prohibited in Add Mode !!!"
'            mskPttRegNo.Text = ToMyNumFmt(mPttRegNo_old, mDecimals:=0)
'            Cancel = True
'            mskPttRegNo.SetFocus
'
'        ElseIf FormAddEditMode = cFORM_EDITMODE And mPttRegNo <> mPttRegNo_old And clsVGNOPT.mPttRegNoEditModeChange_bln = False Then
'            AlertBox "Change Prohibited in Edit Mode !!!"
'            mskPttRegNo.Text = ToMyNumFmt(mPttRegNo_old, mDecimals:=0)
'            Cancel = True
'            mskPttRegNo.SetFocus
'
'        ElseIf mPttRegNo = 0 And clsVGNOPT.mPttRegNoNotZero_bln = True Then
'            AlertBox "Prohibited Zero Patient Reg.No. !!!"
'            If FormAddEditMode = cFORM_ADDMODE Then
'                If clsVGNOPT.mPttRegNoAutoNumber_bln = True Then
'                    mPttRegNo = GetNextSeqno(dbVgnDatabase, "PatMast", "PttRegNo")
'                    mskPttRegNo.Text = ToMyNumFmt(mPttRegNo, mDecimals:=0)
'                End If
'            Else
'                mskPttRegNo.Text = ToMyNumFmt(mPttRegNo_old, mDecimals:=0)
'            End If
'            Cancel = True
'            mskPttRegNo.SetFocus
        If mPttRegNo <> 0 Then
            If ChkIsDuplicate(dbVgnDatabase, "PatMast", "PttRegNo", mPttRegNo, "PttCode", mPttCode) = True Then
                ErrorBox "Duplicate Input !!!"
                Cancel = True
                mskPttRegNo.SetFocus
                ' -----------
                If FormAddEditMode = cFORM_ADDMODE Then
                    'If clsVGNOPT.mPttRegNoAutoNumber_bln = True Then
                        mPttRegNo = GetNextSeqno(dbVgnDatabase, "PatMast", "PttRegNo")
                    'End If
                Else
                    mPttRegNo = mPttRegNo_old
                End If
                mskPttRegNo.Text = ToMyNumFmt(mPttRegNo, mDecimals:=0)
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
    Call ShowPatBal
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
    If mPttAraCode_old <> Val(fcmbAraName.BoundText) Or Val(fcmbStnName.BoundText) = 0 Then
        AutoInitStationFromArea cnn:=dbAcDatabase, txtStnName:=txtStnName, fcmbStnName:=fcmbStnName, mAraCode:=Val(fcmbAraName.BoundText)
'        clsARA.GetData Val(fcmbAraName.BoundText)
'        fcmbStnName.Requery
'        fcmbStnName.BoundText = CStr(clsARA.mAraStnCode_lng): txtStnName.Text = fcmbStnName.Text
    End If
End If

End Sub

Private Sub txtPcgName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtPcgName_Change
End If

End Sub

Private Sub txtPttAddr_GotFocus()
FlashActiveControl txtPttAddr, True
End Sub

Private Sub txtPttAddr_LostFocus()
FlashActiveControl txtPttAddr, False
End Sub

Private Sub txtPttAddr_Validate(Cancel As Boolean)
txtPttAddr.Text = ToMyWord(txtPttAddr.Text)
End Sub

Private Sub txtPttEmail_GotFocus()
FlashActiveControl txtPttEmail, True
End Sub

Private Sub txtPttEmail_LostFocus()
FlashActiveControl txtPttEmail, False
End Sub

Private Sub txtPttName_GotFocus()
FlashActiveControl txtPttName, True
End Sub

Private Sub txtPttName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    If fcmbPttName.CallFromText_Change = False Then
        fcmbPttName.CallFromText_Change = True
        If InterActiveChange(txtPttName) = True Then
            fcmbPttName.UserText = Array(txtPttName.Text, txtPttName.SelStart)
            fcmbPttName.Show
            If fcmbPttName.ListSelected = True And Val(fcmbPttName.BoundText) > 0 Then
                If FormAddEditMode = cFORM_ADDMODE Then
                    clsPAT.EndMast mPttCode
                    
                    FormAddEditMode = cFORM_EDITMODE
                    mPttCode = Val(fcmbPttName.BoundText)
                    If clsPAT.BeginMast(mPttCode) = True Then
                        mPttCode = clsPAT.ActiveCode
                    Else
                        mPttCode = 0
                    End If
                    ShowPatData mPttCode
                    Call StorePatOldData
                    Rem SendKeys "{tab}"
                Else
                     AlertBox "Prohibited in Edit Mode !!!"
                End If
            End If
        End If
        fcmbPttName.CallFromText_Change = False
    End If
ElseIf MyAddNewKey(Shift, KeyCode) = True Then
    If FormAddEditMode = cFORM_ADDMODE Then
        clsPAT.EndMast mPttCode
        
        If clsPAT.BeginMast(0) = True Then
            mPttCode = clsPAT.ActiveCode
        Else
            mPttCode = 0
        End If
        ShowPatData mPttCode
        Call ShowPatDefData
        Call StorePatOldData
    Else
        AlertBox "Prohibited in Edit Mode !!!"
    End If
End If

End Sub

Private Sub txtPttName_LostFocus()
FlashActiveControl txtPttName, False
End Sub

Private Sub txtPttName_Validate(Cancel As Boolean)
txtPttName.Text = ToMyWord(txtPttName.Text)
If Trim(txtPttName.Text) = "" Then
    ErrorBox "Invalid Input !!!"
    Cancel = True
    txtPttName.SetFocus
End If

End Sub

Private Sub Data_AddEvent()

If CanUserAddOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If clsPAT.BeginMast(0) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_ADDMODE

clsPAT.Clear
mPttCode = clsPAT.ActiveCode

ShowPatData mPttCode
Call ShowPatDefData
Call StorePatOldData

Call ShowEntryMode(True)
txtPttName.SetFocus

End Sub

Private Sub Data_EditEvent()

If CanUserEditOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If clsPAT.BeginMast(datRecset.fields("PttCode")) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_EDITMODE

With datRecset
mPttCode = .fields("PttCode")
clsPAT.GetData mPttCode
End With

ShowPatData mPttCode
Call StorePatOldData

Call ShowEntryMode(True)
txtPttName.SetFocus

End Sub

Private Sub ShowPatData(ByVal mPttCode As Long)

With clsPAT
.GetData mPttCode

mskFormBoundField.Text = mPttCode
txtPttName.Text = .mName_str
mskPttRegNo.Text = ToMyNumFmt(.mPttRegNo_lng, mDecimals:=0)
dtpPttRegDate.Text = Dtoc(.mPttRegDate_dt)
cmbPttSex.ListIndex = GetMidStrPos(cPTTSEX_LIST, .mPttSex_str, ",") - 1
mskPttAgeYr.Text = 0
mskPttAgeMn.Text = 0
mskPttAgeDy.Text = 0
dtpPttAgeAsOnDt.Text = Dtoc(.mPttAgeAsOnDt_dt)
dtpPttDob.Text = Dtoc(.mPttDob_dt)
fcmbPcgName.BoundText = CStr(.mPttPcgCode_lng): txtPcgName.Text = fcmbPcgName.Text
cmbPttRefRela.ListIndex = GetMidStrPos(cPTTREFRELA_LIST, .mPttRefRela_str, ",") - 1
txtPttRefName.Text = .mPttRefName_str
txtPttAddr.Text = .mPttAddr_str
fcmbAraName.BoundText = CStr(.mPttAraCode_lng): txtAraName.Text = fcmbAraName.Text
fcmbStnName.BoundText = CStr(.mPttStnCode_lng): txtStnName.Text = fcmbStnName.Text
txtPttTelNo.Text = .mPttTelNo_str
txtPttSMSNo.Text = .mPttSMSNo_str
txtPttEmail.Text = .mPttEmail_str
chkPttInfAllowed.Value = IIf(.mPttInfAllowed_bln = True, vbChecked, vbUnchecked)
chkPttDefAllowed.Value = IIf(.mPttDefAllowed_bln = True, vbChecked, vbUnchecked)
chkPttDiscAllowed.Value = IIf(.mPttDiscAllowed_bln = True, vbChecked, vbUnchecked)
mskPttDiscPer.Text = ToMyPerFmt(.mPttDiscPer_dbl)
chkPttShowInList.Value = IIf(.mPttShowInList_bln = True, vbChecked, vbUnchecked)
txtPttRemark.Text = .mPttRemark_str
fcmbAhName.BoundText = CStr(.mPttAhCode_lng): txtAhName.Text = fcmbAhName.Text
End With

mskAhOpBal.Text = ToMyNumFmt(0)
lblAhCurBal.Caption = ToMyAcFmt(0)
txtDrCrFlag.Text = SenseDrCrFlag(0)

Call ShowPatAge
Call ShowPatBal

End Sub

Private Sub ShowPatDefData()
Dim mPttRegNo As Long, tRecset As New ADODB.Recordset

'If clsVGNOPT.mPttRegNoAutoNumber_bln = True Then
    mPttRegNo = GetNextSeqno(dbVgnDatabase, "PatMast", "PttRegNo")
    mskPttRegNo.Text = ToMyNumFmt(mPttRegNo, mDecimals:=0)
'End If
dtpPttRegDate.Text = Dtoc(DefaultEntryDate)
cmbPttSex.ListIndex = 0
dtpPttAgeAsOnDt.Text = dtpPttRegDate.Text
dtpPttDob.Text = dtpPttRegDate.Text
cmbPttRefRela.ListIndex = 0
chkPttInfAllowed.Value = vbChecked
chkPttDefAllowed.Value = vbChecked
chkPttDiscAllowed.Value = vbChecked
chkPttShowInList.Value = vbChecked
'fcmbAraName.BoundText = CStr(clsVGNOPT.GetPatMastOptBoundCode("PttAraCode")): txtAraName.Text = fcmbAraName.Text
'fcmbStnName.BoundText = CStr(clsVGNOPT.GetPatMastOptBoundCode("PttStnCode")): txtStnName.Text = fcmbStnName.Text
'fcmbPcgName.BoundText = CStr(clsVGNOPT.GetPatMastOptBoundCode("PttPcgCode")): txtPcgName.Text = fcmbPcgName.Text
'fcmbAhName.BoundText = CStr(clsVGNOPT.GetPatMastOptBoundCode("PttAhCode")): txtAhName.Text = fcmbAhName.Text

If Val(fcmbAraName.BoundText) = 0 Or Val(fcmbStnName.BoundText) = 0 Or Val(fcmbPcgName.BoundText) = 0 Or Val(fcmbAhName.BoundText) = 0 Then
    With tRecset
    .open "Select * from PatMast where PttCode = (Select top 1 OpgPttCode from OutdReg order by OpgCode desc)", dbVgnDatabase, adOpenKeyset, adLockOptimistic
    If .EOF = False Then
        If Val(fcmbAraName.BoundText) = 0 Then
            fcmbAraName.BoundText = CStr(.fields("PttAraCode"))
        End If
        If Val(fcmbStnName.BoundText) = 0 Then
            fcmbStnName.BoundText = CStr(.fields("PttStnCode"))
        End If
        If Val(fcmbPcgName.BoundText) = 0 Then
            fcmbPcgName.BoundText = CStr(.fields("PttPcgCode"))
        End If
        If Val(fcmbAhName.BoundText) = 0 Then
            fcmbAhName.BoundText = CStr(.fields("PttAhCode"))
        End If
    End If
    End With
    CloseTable tRecset
End If

txtAraName.Text = fcmbAraName.Text
txtStnName.Text = fcmbStnName.Text
txtPcgName.Text = fcmbPcgName.Text
txtAhName.Text = fcmbAhName.Text

Call ShowPatAge
Call ShowPatBal

End Sub

Private Sub StorePatOldData()

mPttCode_old = mPttCode
mPttName_old = txtPttName.Text
mPttRegNo_old = Val(UnMyNumFmt(mskPttRegNo.Text))
mPttPcgCode_old = Val(fcmbPcgName.BoundText)
mPttAhCode_old = Val(fcmbAhName.BoundText)
mPttAraCode_old = Val(fcmbAraName.BoundText)

End Sub

Private Sub ShowPatBal()
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
With clsPAT
If FormAddEditMode = cFORM_ADDMODE Then
    .Clear
Else
    .GetData mPttCode
End If
.mName_str = txtPttName.Text
.mPttRegNo_lng = Val(UnMyNumFmt(mskPttRegNo.Text))
.mPttRegDate_dt = Ctod(dtpPttRegDate.Text)
.mPttSex_str = cmbPttSex.Text
.mPttAgeAsOnDt_dt = Ctod(dtpPttAgeAsOnDt.Text)
.mPttDob_dt = Ctod(dtpPttDob.Text)
.mPttPcgCode_lng = Val(fcmbPcgName.BoundText)
.mPttRefRela_str = cmbPttRefRela.Text
.mPttRefName_str = txtPttRefName.Text
.mPttAddr_str = txtPttAddr.Text
.mPttAraCode_lng = Val(fcmbAraName.BoundText)
.mPttStnCode_lng = Val(fcmbStnName.BoundText)
.mPttTelNo_str = txtPttTelNo.Text
.mPttSMSNo_str = txtPttSMSNo.Text
.mPttEmail_str = txtPttEmail.Text
.mPttInfAllowed_bln = (chkPttInfAllowed.Value = vbChecked)
.mPttDefAllowed_bln = (chkPttDefAllowed.Value = vbChecked)
.mPttDiscAllowed_bln = (chkPttDiscAllowed.Value = vbChecked)
.mPttDiscPer_dbl = Val(UnMyPerFmt(mskPttDiscPer.Text))
.mPttShowInList_bln = (chkPttShowInList.Value = vbChecked)
.mPttRemark_str = txtPttRemark.Text
.mPttAhCode_lng = Val(fcmbAhName.BoundText)

If FormAddEditMode = cFORM_ADDMODE Then
    .AddNew
    mskFormBoundField.Text = .mCode_lng
Else
    .Update mPttCode
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
        If mPttAhCode_old <> Val(fcmbAhName.BoundText) Or FormAddEditMode = cFORM_ADDMODE Then
            clsAH.UpdateDependency mPttAhCode_old, False
            clsAH.UpdateDependency Val(fcmbAhName.BoundText), True
        End If
    End If
    
    
    Rem updating user editing carry forward features
'    clsVGNOPT.mPttAraCodeOld_lng = clsPAT.mPttAraCode_lng
'    clsVGNOPT.mPttStnCodeOld_lng = clsPAT.mPttStnCode_lng
'    clsVGNOPT.mPttPcgCodeOld_lng = clsPAT.mPttPcgCode_lng
'    clsVGNOPT.mPttAhCodeOld_lng = clsPAT.mPttAhCode_lng
'    clsVGNOPT.UpdatePatMastOld
    
    mEntrySaved = True
Else
    Call Data_CancelEvent
    ErrorBox "Entry Cancelled !!!"
End If

End With

End Sub

Private Sub Data_DeleteEvent()
Dim mDeleteit As Boolean, mRecAbsPos As Long, mPttAhCode As Long

If CanUserDeleteOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If (datRecset.EOF Or datRecset.BOF) = True Then
    Exit Sub
End If

mPttCode = datRecset.fields("PttCode")
mPttAhCode = datRecset.fields("PttAhCode")
mRecAbsPos = datRecset.AbsolutePosition

If clsPAT.CanDeleteMast(mPttCode) = True Then
    txtVoid.SetFocus
    If clsPAT.BeginMast(mPttCode) = True Then
        clsPAT.DeleteMast mPttCode
        clsPAT.UpdateMast mPttCode
        clsPAT.EndMast mPttCode
        
        Call SmryList
        If datRecset.RecordCount > mRecAbsPos And mRecAbsPos > 0 Then
            datRecset.Move mRecAbsPos - 1, 1
        Else
            MoveRecToLast datRecset
        End If
        
        clsAH.UpdateDependency mPttAhCode, False
    End If
    ShowRecActiveFlexRow datRecset, Mfgrd1
    Mfgrd1.SetFocus
Else
    Mfgrd1.SetFocus
End If

End Sub

Private Sub Data_CancelEvent()
clsPAT.CancelMast mPttCode
clsPAT.EndMast mPttCode
mEntryAborted = True

End Sub

Private Sub txtPttRefName_GotFocus()
FlashActiveControl txtPttRefName, True
End Sub

Private Sub txtPttRefName_LostFocus()
FlashActiveControl txtPttRefName, False
End Sub

Private Sub txtPttRefName_Validate(Cancel As Boolean)
txtPttRefName.Text = ToMyWord(txtPttRefName.Text)
End Sub

Private Sub txtPttRemark_GotFocus()
FlashActiveControl txtPttRemark, True
End Sub

Private Sub txtPttRemark_LostFocus()
FlashActiveControl txtPttRemark, False
End Sub

Private Sub txtPttSMSNo_GotFocus()
FlashActiveControl txtPttSMSNo, True
End Sub

Private Sub txtPttSMSNo_LostFocus()
FlashActiveControl txtPttSMSNo, False
End Sub

Private Sub txtPttTelNo_GotFocus()
FlashActiveControl txtPttTelNo, True
End Sub

Private Sub txtPttTelNo_LostFocus()
FlashActiveControl txtPttTelNo, False
End Sub

Private Sub txtPcgName_Change()
If fcmbPcgName.CallFromText_Change = False Then
    fcmbPcgName.CallFromText_Change = True
    If InterActiveChange(txtPcgName) = True Then
        fcmbPcgName.UserText = Array(txtPcgName.Text, txtPcgName.SelStart)
        fcmbPcgName.Show
        txtPcgName.Text = fcmbPcgName.Text
        If fcmbPcgName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbPcgName.CallFromText_Change = False
End If

End Sub

Private Sub txtPcgName_GotFocus()
FlashActiveControl txtPcgName, True
End Sub

Private Sub txtPcgName_LostFocus()
FlashActiveControl txtPcgName, False
End Sub

Private Sub txtPcgName_Validate(Cancel As Boolean)
If Val(fcmbPcgName.BoundText) <= 0 Then
    ErrorBox "Invalid Selection !!!"
    txtPcgName.SetFocus
    Cancel = True
Else
    If mPttPcgCode_old <> Val(fcmbPcgName.BoundText) Or FormAddEditMode = cFORM_ADDMODE Then
        clsPCG.GetData Val(fcmbPcgName.BoundText)
        
        chkPttInfAllowed.Value = IIf(clsPCG.mPcgInfAllowed_bln = True, vbChecked, vbUnchecked)
        chkPttDefAllowed.Value = IIf(clsPCG.mPcgDefAllowed_bln = True, vbChecked, vbUnchecked)
        chkPttDiscAllowed.Value = IIf(clsPCG.mPcgDiscAllowed_bln = True, vbChecked, vbUnchecked)
        mskPttDiscPer.Text = ToMyPerFmt(clsPCG.mPcgDiscPer_dbl)
    End If
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
clsListStru.AddFields mExpr:="PttCode", mAttrib:=cFAT_SYSTEM
clsListStru.AddFields mExpr:="PttName", mTitle:="Patient Name", mAlign:=1, mWidth:=3500, mShowItem:=True
clsListStru.AddFields mExpr:="PttRegNo", mTitle:="Reg.No", mAlign:=7, mWidth:=1500, mShowItem:=True
clsListStru.AddFields mExpr:="PttRefName", mTitle:="Care of", mAlign:=1, mWidth:=2500, mShowItem:=True
clsListStru.AddFields mExpr:="PttAddr", mTitle:="Address", mAlign:=1, mWidth:=2500, mShowItem:=True
clsListStru.AddFields mExpr:="PatAraName", mTitle:="Area", mAlign:=1, mWidth:=1750, mShowItem:=True
clsListStru.AddFields mExpr:="PatStnName", mTitle:="Station", mAlign:=1, mWidth:=1750, mShowItem:=True
'clsListStru.AddFields mExpr:="AhOpBal", mTitle:="Op.Balance", mAlign:=7, mWidth:=1750, mShowItem:=False
'clsListStru.AddFields mExpr:="AhOpDrBal", mTitle:="Op.Dr.Bal", mAlign:=7, mWidth:=1750, mShowItem:=False
'clsListStru.AddFields mExpr:="AhOpCrBal", mTitle:="Op.Cr.Bal", mAlign:=7, mWidth:=1750, mShowItem:=False
'clsListStru.AddFields mExpr:="AhCurBal", mTitle:="Cur.Balance", mAlign:=7, mWidth:=1750, mShowItem:=False
'clsListStru.AddFields mExpr:="AhCurDrBal", mTitle:="Cur.Dr.Bal", mAlign:=7, mWidth:=1750, mShowItem:=False
'clsListStru.AddFields mExpr:="AhCurCrBal", mTitle:="Cur.Cr.Bal", mAlign:=7, mWidth:=1750, mShowItem:=False
clsListStru.AddFields mExpr:="PatPcgName", mTitle:="Category", mAlign:=1, mWidth:=2000, mShowItem:=True
'clsListStru.AddFields mExpr:="PatAhName", mTitle:="Account Name", mAlign:=1, mWidth:=2000, mShowItem:=True

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

RefreshDatabase dbVgnDatabase
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
MoveRecToFirst datRecset
With datRecset
If .RecordCount > 0 Then
    Do While .EOF = False
        clsPCG.GetData .fields("PttPcgCode")
        clsARA.GetData .fields("PttAraCode")
        clsSTN.GetData .fields("PttStnCode")
        
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttCode")) = .fields("PttCode")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttName")) = .fields("PttName")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttRegNo")) = .fields("PttRegNo")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttRefName")) = .fields("PttRefName")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttAddr")) = .fields("PttAddr")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PatAraName")) = clsARA.mName_str
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PatStnName")) = clsSTN.mName_str
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PatPcgName")) = clsPCG.mName_str
        'Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PatAhName")) = .fields("AhName")
'        If chkOpBal.Value = 1 Then
'            If chkCombinedOpBal.Value = 1 Then
'                aAcntBal = clsAH.GetAhOpnBal(.fields("PttAhCode"), mDrCrSeperated:=False)
'
'                mBal = aAcntBal(0)
'
'                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("AhOpBal")) = ToMyAcFmt(mBal)
'            Else
'                aAcntBal = clsAH.GetAhOpnBal(.fields("PttAhCode"), mDrCrSeperated:=True)
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
'                aAcntBal = clsAH.GetAhCurBal(.fields("PttAhCode"), sFinYrEndDate, mDrCrSeperated:=False)
'
'                mBal = aAcntBal(0)
'
'                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("AhCurBal")) = ToMyAcFmt(mBal)
'            Else
'                aAcntBal = clsAH.GetAhCurBal(.fields("PttAhCode"), sFinYrEndDate, mDrCrSeperated:=True)
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
    aAhOpBal = clsAH.GetAhOpnBal(datRecset.fields("PttAhCode"), mDrCrSeperated:=True)
    mOpnDrAmtTot = mOpnDrAmtTot + aAhOpBal(0)
    mOpnCrAmtTot = mOpnCrAmtTot + aAhOpBal(1)
    
    Rem current balance
    aAhCurBal = clsAH.GetAhCurBal(datRecset.fields("PttAhCode"), sFinYrEndDate, mDrCrSeperated:=True)
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
SearchFlex Mfgrd1, clsListStru.GetItemIndex("PttName"), mText
ShowActiveFlexRow Mfgrd1

End Sub

Private Sub txtSearch1Text_GotFocus()
FlashActiveControl txtSearch1Text, True
End Sub

Private Sub txtSearch1Text_LostFocus()
FlashActiveControl txtSearch1Text, False
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

Private Sub ShowPttDob()
Dim mPttDob As Date

mPttDob = CalcDob(Ctod(dtpPttAgeAsOnDt.Text), Val(mskPttAgeYr.Text), Val(mskPttAgeMn.Text), Val(mskPttAgeDy.Text))
dtpPttDob.Text = Dtoc(mPttDob)

End Sub

Private Sub ShowPatAge()
Dim mYears As Long, mMonths As Long, mDays As Long

CalcAge Ctod(dtpPttDob.Text), Ctod(dtpPttAgeAsOnDt.Text), mYears, mMonths, mDays
mskPttAgeYr.Text = CStr(mYears)
mskPttAgeMn.Text = CStr(mMonths)
mskPttAgeDy.Text = CStr(mDays)

End Sub
