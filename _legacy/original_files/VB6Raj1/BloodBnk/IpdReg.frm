VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "Mscomctl.ocx"
Begin VB.Form frmIndoorReg 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   ClientHeight    =   10650
   ClientLeft      =   60
   ClientTop       =   60
   ClientWidth     =   14880
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
   ScaleHeight     =   10650
   ScaleWidth      =   14880
   ShowInTaskbar   =   0   'False
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
      TabIndex        =   45
      Top             =   720
      Width           =   13095
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
         Left            =   2520
         Style           =   2  'Dropdown List
         TabIndex        =   5
         Top             =   1560
         Width           =   1335
      End
      Begin VB.TextBox txtIpgDischTime_str 
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
         Left            =   4800
         MaxLength       =   50
         TabIndex        =   40
         TabStop         =   0   'False
         Text            =   "00:00"
         Top             =   9000
         Width           =   855
      End
      Begin VB.TextBox dtpIpgDischDate 
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
         Left            =   2520
         MaxLength       =   50
         TabIndex        =   39
         Text            =   "dd/mm/yyyy"
         Top             =   9000
         Width           =   1455
      End
      Begin VB.TextBox txtIpgRemark 
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
         Left            =   2520
         MaxLength       =   50
         TabIndex        =   38
         Top             =   7800
         Width           =   7935
      End
      Begin VB.TextBox txtBdmName 
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
         Left            =   7800
         MaxLength       =   50
         TabIndex        =   36
         Top             =   6840
         Width           =   2775
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
         Left            =   9600
         TabIndex        =   23
         Tag             =   "AhCode"
         Text            =   "0.00 %"
         Top             =   4200
         Width           =   1215
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
         Left            =   5640
         TabIndex        =   22
         Top             =   4200
         Width           =   2175
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
         Left            =   3000
         TabIndex        =   21
         Top             =   4200
         Width           =   2535
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
         Left            =   240
         TabIndex        =   20
         Top             =   4200
         Width           =   2535
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
         Left            =   240
         TabIndex        =   24
         Top             =   4560
         Width           =   2535
      End
      Begin VB.TextBox mskPttCode 
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
         Left            =   4080
         TabIndex        =   1
         Tag             =   "AhCode"
         Text            =   "-1"
         Top             =   360
         Width           =   1455
      End
      Begin VB.TextBox mskIpgAdvAmt 
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
         Left            =   2520
         TabIndex        =   37
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   7320
         Width           =   1575
      End
      Begin VB.TextBox txtFDigName 
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
         Left            =   2520
         MaxLength       =   50
         TabIndex        =   35
         Top             =   6840
         Width           =   3975
      End
      Begin VB.TextBox txtRByName 
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
         Left            =   7800
         MaxLength       =   50
         TabIndex        =   34
         Top             =   6480
         Width           =   4095
      End
      Begin VB.TextBox txtCDctName 
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
         Left            =   2520
         MaxLength       =   50
         TabIndex        =   33
         Top             =   6480
         Width           =   3975
      End
      Begin VB.TextBox txtIpgTime_str 
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
         TabIndex        =   32
         TabStop         =   0   'False
         Text            =   "00:00"
         Top             =   6120
         Width           =   855
      End
      Begin VB.TextBox dtpIpgDate 
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
         TabIndex        =   31
         Text            =   "dd/mm/yyyy"
         Top             =   6120
         Width           =   1455
      End
      Begin VB.TextBox txtIpgPrefix 
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
         TabIndex        =   29
         Tag             =   "AhCode"
         Text            =   "[Prefix]"
         Top             =   6120
         Width           =   1215
      End
      Begin VB.TextBox mskIpgVchNo 
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
         Left            =   6720
         TabIndex        =   30
         Tag             =   "AhCode"
         Top             =   6120
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
         Left            =   2520
         MaxLength       =   50
         TabIndex        =   28
         Top             =   6120
         Width           =   1815
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
         TabIndex        =   9
         TabStop         =   0   'False
         Text            =   "dd/mm/yyyy"
         Top             =   1560
         Width           =   1455
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
         Left            =   11280
         MaxLength       =   50
         TabIndex        =   10
         TabStop         =   0   'False
         Text            =   "dd/mm/yyyy"
         Top             =   1560
         Width           =   1455
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
         Left            =   7200
         TabIndex        =   8
         Tag             =   "AhCode"
         Text            =   "0"
         Top             =   1560
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
         Left            =   6600
         TabIndex        =   7
         Tag             =   "AhCode"
         Text            =   "0"
         Top             =   1560
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
         Left            =   5880
         TabIndex        =   6
         Tag             =   "AhCode"
         Text            =   "0"
         Top             =   1560
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
         Left            =   2520
         MaxLength       =   50
         TabIndex        =   25
         Top             =   5040
         Width           =   5295
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
         Left            =   2520
         MaxLength       =   50
         TabIndex        =   18
         Top             =   3360
         Width           =   4695
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
         Left            =   8880
         MaxLength       =   50
         TabIndex        =   17
         Top             =   3000
         Width           =   3855
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
         Left            =   2520
         MaxLength       =   50
         TabIndex        =   16
         Top             =   3000
         Width           =   4695
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
         Left            =   8880
         MaxLength       =   50
         TabIndex        =   15
         Top             =   2640
         Width           =   3855
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
         Left            =   8880
         MaxLength       =   50
         TabIndex        =   14
         Top             =   2280
         Width           =   3855
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
         Left            =   2520
         MaxLength       =   250
         MultiLine       =   -1  'True
         TabIndex        =   13
         Top             =   2280
         Width           =   5415
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
         Left            =   2520
         Style           =   2  'Dropdown List
         TabIndex        =   11
         Top             =   1920
         Width           =   1335
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
         Left            =   3960
         MaxLength       =   50
         TabIndex        =   12
         Top             =   1920
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
         Left            =   2520
         TabIndex        =   2
         Tag             =   "AhCode"
         Text            =   "0"
         Top             =   840
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
         Left            =   2520
         MaxLength       =   50
         TabIndex        =   26
         Top             =   5400
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
         Left            =   5160
         MaxLength       =   50
         TabIndex        =   3
         TabStop         =   0   'False
         Text            =   "dd/mm/yyyy"
         Top             =   840
         Width           =   1455
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
         Left            =   2520
         MaxLength       =   50
         TabIndex        =   19
         Top             =   3840
         Width           =   5295
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
         Left            =   12480
         Style           =   1  'Graphical
         TabIndex        =   41
         Top             =   9000
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
         Left            =   2520
         MaxLength       =   50
         TabIndex        =   4
         Top             =   1200
         Width           =   5415
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
         Left            =   2520
         TabIndex        =   0
         Tag             =   "AhCode"
         Text            =   "-1"
         Top             =   360
         Width           =   1455
      End
      Begin VB.Label lblOldIpdDesc 
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
         Left            =   2520
         TabIndex        =   123
         Top             =   8160
         Width           =   7935
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Last Visited:"
         BeginProperty Font 
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
         Index           =   33
         Left            =   240
         TabIndex        =   122
         Top             =   8160
         Width           =   2295
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
         Index           =   32
         Left            =   240
         TabIndex        =   121
         Top             =   1560
         Width           =   1935
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
         Height          =   255
         Index           =   31
         Left            =   4080
         TabIndex        =   120
         Top             =   9000
         Width           =   615
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Discharge Date:"
         BeginProperty Font 
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
         Index           =   30
         Left            =   240
         TabIndex        =   119
         Top             =   9000
         Width           =   2295
      End
      Begin VB.Label Label2 
         Alignment       =   2  'Center
         Caption         =   "Discharge Detail"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   29
         Left            =   240
         TabIndex        =   118
         Top             =   8640
         Width           =   12615
      End
      Begin VB.Line Line3 
         Index           =   5
         X1              =   600
         X2              =   12840
         Y1              =   8520
         Y2              =   8520
      End
      Begin VB.Line Line3 
         Index           =   3
         X1              =   120
         X2              =   12960
         Y1              =   7680
         Y2              =   7680
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
         Index           =   28
         Left            =   240
         TabIndex        =   117
         Top             =   7800
         Width           =   2295
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Advance Amount:"
         BeginProperty Font 
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
         Index           =   27
         Left            =   240
         TabIndex        =   116
         Top             =   7320
         Width           =   2295
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Bed Name:"
         BeginProperty Font 
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
         Index           =   26
         Left            =   6720
         TabIndex        =   115
         Top             =   6840
         Width           =   1095
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
         Left            =   8040
         TabIndex        =   108
         Top             =   4200
         Width           =   1455
      End
      Begin VB.Line Line3 
         Index           =   0
         X1              =   120
         X2              =   12960
         Y1              =   3720
         Y2              =   3720
      End
      Begin VB.Line Line3 
         Index           =   4
         X1              =   120
         X2              =   12960
         Y1              =   7200
         Y2              =   7200
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Final Diagnosis:"
         BeginProperty Font 
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
         Index           =   25
         Left            =   240
         TabIndex        =   107
         Top             =   6840
         Width           =   2295
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Ref.By:"
         BeginProperty Font 
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
         Index           =   24
         Left            =   6720
         TabIndex        =   106
         Top             =   6480
         Width           =   1095
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Consulting Doctor:"
         BeginProperty Font 
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
         Index           =   23
         Left            =   240
         TabIndex        =   105
         Top             =   6480
         Width           =   2295
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
         Height          =   255
         Index           =   22
         Left            =   10440
         TabIndex        =   104
         Top             =   6120
         Width           =   495
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
         Height          =   255
         Index           =   20
         Left            =   8280
         TabIndex        =   103
         Top             =   6120
         Width           =   495
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Ipd No.:"
         BeginProperty Font 
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
         Left            =   4560
         TabIndex        =   102
         Top             =   6120
         Width           =   855
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "IPD Type:"
         BeginProperty Font 
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
         TabIndex        =   101
         Top             =   6120
         Width           =   2295
      End
      Begin VB.Label Label2 
         Alignment       =   1  'Right Justify
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
         TabIndex        =   100
         Top             =   1560
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
         Left            =   10680
         TabIndex        =   99
         Top             =   1560
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
         Left            =   3960
         TabIndex        =   98
         Top             =   1560
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
         Left            =   240
         TabIndex        =   97
         Top             =   5040
         Width           =   1935
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
         Left            =   240
         TabIndex        =   96
         Top             =   3360
         Width           =   1935
      End
      Begin VB.Label Label2 
         Alignment       =   1  'Right Justify
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
         Left            =   7200
         TabIndex        =   95
         Top             =   3000
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
         Left            =   240
         TabIndex        =   94
         Top             =   3000
         Width           =   1935
      End
      Begin VB.Label Label2 
         Alignment       =   1  'Right Justify
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
         Left            =   7920
         TabIndex        =   93
         Top             =   2640
         Width           =   855
      End
      Begin VB.Label Label2 
         Alignment       =   1  'Right Justify
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
         Left            =   7920
         TabIndex        =   92
         Top             =   2280
         Width           =   855
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
         Left            =   240
         TabIndex        =   91
         Top             =   2280
         Width           =   1935
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
         Left            =   4080
         TabIndex        =   90
         Top             =   840
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
         Left            =   240
         TabIndex        =   89
         Top             =   840
         Width           =   1575
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
         Left            =   240
         TabIndex        =   88
         Top             =   5400
         Width           =   1935
      End
      Begin VB.Line Line3 
         Index           =   2
         X1              =   120
         X2              =   12960
         Y1              =   4920
         Y2              =   4920
      End
      Begin VB.Line Line3 
         Index           =   1
         X1              =   120
         X2              =   12960
         Y1              =   720
         Y2              =   720
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
         Left            =   240
         TabIndex        =   86
         Top             =   1920
         Width           =   1935
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
         Left            =   240
         TabIndex        =   85
         Top             =   3840
         Width           =   1815
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
         Left            =   9720
         TabIndex        =   27
         Top             =   5400
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
         Left            =   8040
         TabIndex        =   52
         Top             =   5400
         Width           =   1815
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
         Left            =   240
         TabIndex        =   49
         Top             =   1200
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
         Height          =   255
         Index           =   0
         Left            =   240
         TabIndex        =   48
         Top             =   360
         Width           =   1935
      End
      Begin VB.Shape Shape1 
         BackColor       =   &H00C0C0FF&
         BackStyle       =   1  'Opaque
         Height          =   3495
         Index           =   1
         Left            =   120
         Top             =   5880
         Width           =   12855
      End
      Begin VB.Shape Shape1 
         BackColor       =   &H00FFD7B7&
         BackStyle       =   1  'Opaque
         Height          =   5535
         Index           =   0
         Left            =   120
         Top             =   240
         Width           =   12855
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
      TabIndex        =   44
      Top             =   960
      Width           =   14655
      Begin VB.Frame frPrintCRList 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   3615
         Left            =   3480
         TabIndex        =   146
         Top             =   1320
         Width           =   5895
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
            TabIndex        =   84
            Top             =   3000
            Width           =   855
         End
         Begin VB.TextBox mskIpgVchNo 
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
            TabIndex        =   78
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
            TabIndex        =   77
            Top             =   600
            Width           =   3495
         End
         Begin VB.TextBox mskIpgVchNo 
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
            TabIndex        =   79
            Tag             =   "AhCode"
            Text            =   "0"
            Top             =   960
            Width           =   1455
         End
         Begin VB.ComboBox cmbCRList 
            Height          =   315
            Left            =   2160
            Style           =   2  'Dropdown List
            TabIndex        =   80
            Top             =   1320
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
            TabIndex        =   82
            Text            =   "0"
            Top             =   2040
            Width           =   1455
         End
         Begin VB.ComboBox cmbPrintDest 
            Height          =   315
            Left            =   2160
            Style           =   2  'Dropdown List
            TabIndex        =   83
            Top             =   2400
            Width           =   3495
         End
         Begin VB.ComboBox cmbPrinterList 
            Height          =   315
            Left            =   2160
            Style           =   2  'Dropdown List
            TabIndex        =   81
            Top             =   1680
            Width           =   3495
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
            Index           =   42
            Left            =   0
            TabIndex        =   154
            Top             =   0
            Width           =   5895
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
            Index           =   13
            Left            =   120
            TabIndex        =   153
            Top             =   600
            Width           =   1935
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
            TabIndex        =   152
            Top             =   960
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
            TabIndex        =   151
            Top             =   960
            Width           =   375
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
            TabIndex        =   150
            Top             =   1320
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
            TabIndex        =   149
            Top             =   2040
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
            TabIndex        =   148
            Top             =   2400
            Width           =   1935
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
            TabIndex        =   147
            Top             =   1680
            Width           =   1935
         End
      End
      Begin VB.Frame frConfigure 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   4935
         Left            =   3000
         TabIndex        =   109
         Top             =   720
         Width           =   6735
         Begin VB.TextBox mskQryPttRegNo 
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
            Left            =   1680
            TabIndex        =   69
            Text            =   "0"
            Top             =   1080
            Width           =   1455
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
            TabIndex        =   76
            Top             =   4320
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
            Height          =   2295
            Left            =   2160
            TabIndex        =   71
            Top             =   1800
            Width           =   2655
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
               TabIndex        =   72
               Top             =   360
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
               TabIndex        =   73
               Top             =   840
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
               TabIndex        =   74
               Top             =   1320
               Width           =   2055
            End
            Begin VB.OptionButton optPatientwise 
               Appearance      =   0  'Flat
               BackColor       =   &H80000005&
               Caption         =   "Patient-wise"
               BeginProperty Font 
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
               TabIndex        =   75
               Top             =   1800
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
            Left            =   4680
            TabIndex        =   68
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
            Left            =   1680
            TabIndex        =   67
            Tag             =   "AhCode"
            Text            =   "dd/mm/yyyy"
            Top             =   720
            Width           =   1455
         End
         Begin VB.TextBox txtQryPttName 
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
            TabIndex        =   70
            Top             =   1440
            Width           =   4455
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Patient Reg.No:"
            BeginProperty Font 
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
            TabIndex        =   114
            Top             =   1080
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
            Left            =   3720
            TabIndex        =   113
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
            TabIndex        =   112
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
            TabIndex        =   111
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
            Height          =   255
            Index           =   1
            Left            =   120
            TabIndex        =   110
            Top             =   1440
            Width           =   1455
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
         TabIndex        =   66
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
         TabIndex        =   53
         Top             =   360
         Width           =   4215
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd1 
         Height          =   6615
         Left            =   120
         TabIndex        =   65
         Top             =   720
         Width           =   14415
         _ExtentX        =   25426
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
      Begin VB.Frame frIpgTranDtl 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   5055
         Left            =   120
         TabIndex        =   155
         Top             =   720
         Width           =   14415
         Begin VB.TextBox txtList2Col 
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
            TabIndex        =   156
            TabStop         =   0   'False
            Top             =   2280
            Width           =   1335
         End
         Begin MSFlexGridLib.MSFlexGrid Mfgrd2 
            Height          =   4215
            Left            =   120
            TabIndex        =   157
            Top             =   600
            Width           =   8415
            _ExtentX        =   14843
            _ExtentY        =   7435
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
         Begin VB.Label lblIbsDischTime 
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
            Left            =   10080
            TabIndex        =   182
            Top             =   4320
            Width           =   1575
         End
         Begin VB.Label lblIbsDischDate 
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
            Left            =   10080
            TabIndex        =   181
            Top             =   3960
            Width           =   1575
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "D.Time:"
            BeginProperty Font 
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
            Left            =   8640
            TabIndex        =   180
            Top             =   4320
            Width           =   1455
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "D.Date:"
            BeginProperty Font 
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
            Index           =   15
            Left            =   8640
            TabIndex        =   179
            Top             =   3960
            Width           =   1455
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
            Index           =   14
            Left            =   8640
            TabIndex        =   178
            Top             =   360
            Width           =   1455
         End
         Begin VB.Label lblPttName 
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
            Left            =   10080
            TabIndex        =   177
            Top             =   360
            Width           =   4215
         End
         Begin VB.Label Label1 
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
            Index           =   24
            Left            =   8640
            TabIndex        =   176
            Top             =   720
            Width           =   1455
         End
         Begin VB.Label lblPttRegNo 
            Caption         =   "0"
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
            Left            =   10080
            TabIndex        =   175
            Top             =   720
            Width           =   1575
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Ipd No.:"
            BeginProperty Font 
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
            Index           =   26
            Left            =   8640
            TabIndex        =   174
            Top             =   2160
            Width           =   1455
         End
         Begin VB.Label lblIpgVchNo 
            Caption         =   "0"
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
            Left            =   10080
            TabIndex        =   173
            Top             =   2160
            Width           =   1575
         End
         Begin VB.Label lblIpgDate 
            Caption         =   "dd/mm/yyyy"
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
            Left            =   10080
            TabIndex        =   172
            Top             =   2520
            Width           =   1575
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
            Height          =   285
            Index           =   29
            Left            =   8640
            TabIndex        =   171
            Top             =   2520
            Width           =   1455
         End
         Begin VB.Label Label1 
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
            Height          =   285
            Index           =   23
            Left            =   8640
            TabIndex        =   170
            Top             =   1080
            Width           =   1455
         End
         Begin VB.Label Label1 
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
            Index           =   25
            Left            =   8640
            TabIndex        =   169
            Top             =   1800
            Width           =   1455
         End
         Begin VB.Label Label1 
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
            Index           =   27
            Left            =   8640
            TabIndex        =   168
            Top             =   1440
            Width           =   1455
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Ward:"
            BeginProperty Font 
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
            Index           =   28
            Left            =   8640
            TabIndex        =   167
            Top             =   3600
            Width           =   1455
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Floor:"
            BeginProperty Font 
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
            Index           =   30
            Left            =   8640
            TabIndex        =   166
            Top             =   3240
            Width           =   1455
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Bed No.:"
            BeginProperty Font 
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
            Index           =   31
            Left            =   8640
            TabIndex        =   165
            Top             =   2880
            Width           =   1455
         End
         Begin VB.Label lblPttRefName 
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
            Left            =   10080
            TabIndex        =   164
            Top             =   1080
            Width           =   4215
         End
         Begin VB.Label lblAraName 
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
            Left            =   10080
            TabIndex        =   163
            Top             =   1440
            Width           =   4215
         End
         Begin VB.Label lblStnName 
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
            Left            =   10080
            TabIndex        =   162
            Top             =   1800
            Width           =   4215
         End
         Begin VB.Label lblBdmName 
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
            Left            =   10080
            TabIndex        =   161
            Top             =   2880
            Width           =   1575
         End
         Begin VB.Label lblFlrName 
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
            Left            =   10080
            TabIndex        =   160
            Top             =   3240
            Width           =   1575
         End
         Begin VB.Label lblWrdName 
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
            Left            =   10080
            TabIndex        =   159
            Top             =   3600
            Width           =   1575
         End
         Begin VB.Label Label1 
            Alignment       =   2  'Center
            Caption         =   "Transaction Detail"
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
            Index           =   32
            Left            =   120
            TabIndex        =   158
            Top             =   240
            Width           =   8415
         End
      End
      Begin VB.Frame frIBedStat 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0E0FF&
         ForeColor       =   &H80000008&
         Height          =   5535
         Left            =   120
         TabIndex        =   124
         Top             =   600
         Width           =   14415
         Begin VB.TextBox txtBdmName 
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
            Index           =   2
            Left            =   9480
            MaxLength       =   50
            TabIndex        =   62
            Top             =   3480
            Width           =   2055
         End
         Begin VB.ComboBox cmbIbsDischState 
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
            Left            =   7560
            Style           =   2  'Dropdown List
            TabIndex        =   61
            Top             =   3480
            Width           =   1935
         End
         Begin VB.TextBox txtIbsRemark 
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
            Left            =   11520
            TabIndex        =   63
            Top             =   3480
            Width           =   2175
         End
         Begin VB.TextBox txtIbsDischTime 
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
            Left            =   6600
            TabIndex        =   60
            Text            =   "00:00"
            Top             =   3480
            Width           =   975
         End
         Begin VB.TextBox dtpIbsDischDate 
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
            TabIndex        =   59
            Text            =   "dd/mm/yyyy"
            Top             =   3480
            Width           =   1575
         End
         Begin VB.TextBox dtpIbsDate 
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
            Left            =   2520
            TabIndex        =   57
            Text            =   "dd/mm/yyyy"
            Top             =   3480
            Width           =   1575
         End
         Begin VB.TextBox txtIbsTime 
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
            Left            =   4080
            TabIndex        =   58
            Text            =   "00:00"
            Top             =   3480
            Width           =   975
         End
         Begin VB.TextBox txtBdmName 
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
            Left            =   480
            MaxLength       =   50
            TabIndex        =   56
            Top             =   3480
            Width           =   2055
         End
         Begin VB.TextBox mskIbsSno 
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
            TabIndex        =   55
            Tag             =   "AhCode"
            Text            =   "0"
            Top             =   3480
            Width           =   375
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
            Left            =   11520
            Style           =   1  'Graphical
            TabIndex        =   64
            Top             =   3840
            Width           =   735
         End
         Begin MSFlexGridLib.MSFlexGrid Mfgrd3 
            Height          =   2895
            Left            =   120
            TabIndex        =   54
            Top             =   1920
            Width           =   13935
            _ExtentX        =   24580
            _ExtentY        =   5106
            _Version        =   393216
            RowHeightMin    =   285
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
         Begin VB.Label lblIbsPttCode 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            BorderStyle     =   1  'Fixed Single
            Caption         =   "-1"
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
            Left            =   3360
            TabIndex        =   145
            Top             =   600
            Width           =   1695
         End
         Begin VB.Label lblIbsIpgCode 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            BorderStyle     =   1  'Fixed Single
            Caption         =   "-1"
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
            Left            =   1560
            TabIndex        =   144
            Top             =   600
            Width           =   1695
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
            Index           =   6
            Left            =   120
            TabIndex        =   143
            Top             =   600
            Width           =   1455
         End
         Begin VB.Label Label3 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Indoor Bed Shift Details"
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
            TabIndex        =   142
            Top             =   120
            Width           =   14175
         End
         Begin VB.Label lblIbsPttSex 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            BorderStyle     =   1  'Fixed Single
            BeginProperty Font 
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
            Left            =   12000
            TabIndex        =   141
            Top             =   960
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
            Height          =   285
            Index           =   41
            Left            =   11400
            TabIndex        =   140
            Top             =   960
            Width           =   495
         End
         Begin VB.Label lblIbsPttAge_str 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            BorderStyle     =   1  'Fixed Single
            BeginProperty Font 
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
            Left            =   9120
            TabIndex        =   139
            Top             =   960
            Width           =   2175
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Age:"
            BeginProperty Font 
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
            Index           =   40
            Left            =   8640
            TabIndex        =   138
            Top             =   960
            Width           =   495
         End
         Begin VB.Label lblIbsIpgTime 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            BorderStyle     =   1  'Fixed Single
            Caption         =   "00:00"
            BeginProperty Font 
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
            Left            =   12000
            TabIndex        =   137
            Top             =   1440
            Width           =   975
         End
         Begin VB.Label lblIbsIpgDate 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            BorderStyle     =   1  'Fixed Single
            Caption         =   "dd/mm/yyyy"
            BeginProperty Font 
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
            Left            =   9120
            TabIndex        =   136
            Top             =   1440
            Width           =   1575
         End
         Begin VB.Label lblIbsIpgPrefix 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            BorderStyle     =   1  'Fixed Single
            Caption         =   "[Prefix]"
            BeginProperty Font 
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
            Left            =   5880
            TabIndex        =   135
            Top             =   1440
            Width           =   1095
         End
         Begin VB.Label lblIbsIpgVchNo 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            BorderStyle     =   1  'Fixed Single
            Caption         =   "0"
            BeginProperty Font 
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
            Left            =   6960
            TabIndex        =   134
            Top             =   1440
            Width           =   1575
         End
         Begin VB.Label lblIbsIpgVtmName 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            BorderStyle     =   1  'Fixed Single
            BeginProperty Font 
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
            TabIndex        =   133
            Top             =   1440
            Width           =   2775
         End
         Begin VB.Label lblIbsPttRegNo 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            BorderStyle     =   1  'Fixed Single
            Caption         =   "0"
            BeginProperty Font 
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
            Left            =   6960
            TabIndex        =   132
            Top             =   960
            Width           =   1575
         End
         Begin VB.Label lblIbsPttName 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            BorderStyle     =   1  'Fixed Single
            BeginProperty Font 
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
            TabIndex        =   131
            Top             =   960
            Width           =   4335
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "IPD Type:"
            BeginProperty Font 
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
            Left            =   120
            TabIndex        =   130
            Top             =   1440
            Width           =   1455
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Ipd No.:"
            BeginProperty Font 
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
            Left            =   5040
            TabIndex        =   129
            Top             =   1440
            Width           =   855
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
            Index           =   37
            Left            =   8640
            TabIndex        =   128
            Top             =   1440
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
            Index           =   36
            Left            =   11400
            TabIndex        =   127
            Top             =   1440
            Width           =   615
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
            Index           =   35
            Left            =   6000
            TabIndex        =   126
            Top             =   960
            Width           =   855
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
            Height          =   285
            Index           =   34
            Left            =   120
            TabIndex        =   125
            Top             =   960
            Width           =   1455
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
         TabIndex        =   87
         Top             =   360
         Width           =   735
      End
   End
   Begin VB.ComboBox cmbPatEntryMode 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   315
      ItemData        =   "IpdReg.frx":0000
      Left            =   1560
      List            =   "IpdReg.frx":000D
      Style           =   1  'Simple Combo
      TabIndex        =   47
      TabStop         =   0   'False
      Text            =   "cmbPatEntryMode"
      Top             =   360
      Width           =   1455
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
      TabIndex        =   51
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
      TabIndex        =   50
      TabStop         =   0   'False
      Top             =   0
      Width           =   255
   End
   Begin VB.ComboBox cmbFormEntryMode 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   315
      ItemData        =   "IpdReg.frx":0034
      Left            =   0
      List            =   "IpdReg.frx":0041
      Style           =   1  'Simple Combo
      TabIndex        =   46
      TabStop         =   0   'False
      Text            =   "cmbFormEntryMode"
      Top             =   360
      Width           =   1455
   End
   Begin VB.TextBox txtVoid 
      CausesValidation=   0   'False
      Height          =   375
      Left            =   0
      TabIndex        =   42
      TabStop         =   0   'False
      Text            =   "Void"
      Top             =   9840
      Width           =   375
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   183
      Top             =   10335
      Width           =   14880
      _ExtentX        =   26247
      _ExtentY        =   556
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   9
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   6174
            MinWidth        =   6174
            Text            =   "CompanyName"
            TextSave        =   "CompanyName"
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   2646
            MinWidth        =   2646
            Text            =   "Fin-Year"
            TextSave        =   "Fin-Year"
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   3087
            MinWidth        =   3087
            Text            =   "UserName"
            TextSave        =   "UserName"
         EndProperty
         BeginProperty Panel4 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Text            =   "UserRole"
            TextSave        =   "UserRole"
         EndProperty
         BeginProperty Panel5 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   2381
            MinWidth        =   2381
            Text            =   "CurrentDate"
            TextSave        =   "CurrentDate"
         EndProperty
         BeginProperty Panel6 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   2381
            MinWidth        =   2381
            Text            =   "SystemDate"
            TextSave        =   "SystemDate"
         EndProperty
         BeginProperty Panel7 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   5
            Object.Width           =   1764
            MinWidth        =   1764
            Text            =   "SystemTime"
            TextSave        =   "08:22"
         EndProperty
         BeginProperty Panel8 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   1
            Enabled         =   0   'False
            Object.Width           =   1764
            MinWidth        =   1764
            Text            =   "CapsLock"
            TextSave        =   "CAPS"
         EndProperty
         BeginProperty Panel9 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   2
            Object.Width           =   1764
            MinWidth        =   1764
            Text            =   "NumLock"
            TextSave        =   "NUM"
         EndProperty
      EndProperty
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
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Indoor Registration/Admission"
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
      TabIndex        =   43
      Top             =   0
      Width           =   9015
   End
End
Attribute VB_Name = "frmIndoorReg"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Dim mFormLoaded As Boolean, mLastKeyPressed As Integer, mMaskKeyPressed As Integer
Dim mFormUIdCode As Long, mFormIpgUIdFileName As String, mFormIpgAcsPermFileName As String, mFormPatUIdFileName As String, mFormPatAcsPermFileName As String
Dim mIpgCode As Long, mPttCode As Long, mQryPttCode As Long, mIpgOldIpgCode As Long
Dim mRemoteAccess As Boolean, mEntryAccessed As Boolean, mLastRowAccessed As Long, mEntrySaved As Boolean, mEntryAborted As Boolean, dtlAddEditMode As Boolean, dtlAddMode As Boolean, dtlEditCanceled As Boolean
Dim dbAcDatabase As New ADODB.Connection, dbHmsDatabase As New ADODB.Connection, dbGrpDatabase As New ADODB.Connection, dbComDatabase As New ADODB.Connection
Dim datRecset As New ADODB.Recordset, datRecset2 As New ADODB.Recordset
Dim mIpgCode_old As Long, mPttCode_old As Long, mIpgDate_old As Date, mIpgVtmCode_old As Long, mIpgVchNo_old As Long, mPttName_old As String, mPttRegNo_old As Long, mPttPcgCode_old As Long, mPttAhCode_old As Long, mPttAgeChanged As Boolean, mPttAraCode_old As Long
Dim mIpgBdmCode_old As Long, mIbsBdmCode_old As Long, mIbsNextBdmCode_old As Long, mIbsDischState_old As Integer
Dim clsJRN As clsJournal, clsAH As clsAccountHead, clsIPG As clsHmsSnglTranEntry, clsIBS As clsHmsSnglTranEntry, clsPAT As clsHmsMasterEntry, clsPCG As clsHmsMasterEntry, clsARA As clsComMastEntry, clsSTN As clsComMastEntry, clsVTM As clsComMastEntry, clsBDM As clsHmsMasterEntry, clsHOPT As clsHmsIpdOptionsEntry
Dim mActiveControl As Object, clsListStru As clsSelectQueryStructure
Dim fcmbAhName As clsComFlexSearch, fcmbAraName As clsComFlexSearch, fcmbStnName As clsComFlexSearch, fcmbVtmName As clsComFlexSearch
Dim fcmbOldIpdByIpdNo As clsHmsFlexSearch, fcmbOldIpdByPttRegNo As clsHmsFlexSearch, fcmbOldIpdByPttName As clsHmsFlexSearch, fcmbPttName As clsHmsFlexSearch, fcmbPttRegNo As clsHmsFlexSearch, fcmbPcgName As clsHmsFlexSearch, fcmbCDctName As clsHmsFlexSearch, fcmbRByName As clsHmsFlexSearch, fcmbFDigName As clsHmsFlexSearch, fcmbBdmName As clsHmsFlexSearch, fcmbNextBdmName As clsHmsFlexSearch
Dim frmTrn As Form

Private Type SmryPara
mIndex() As Variant
mFromDate() As Variant
mToDate() As Variant
mPttRegNo() As Variant
mPttCode() As Variant
mDetailed() As Variant
mMonthwise() As Variant
mDatewise() As Variant
mPatwise() As Variant
mRowIndex() As Variant

End Type

Dim SmryParaLayer As SmryPara

Rem service charges column definitions
Const X3IBSCODE_COL = 0
Const X3IBSSNO_COL = 1
Const X3BDMNAME_COL = 2
Const X3IBSDATE_COL = 3
Const X3IBSTIME_COL = 4
Const X3IBSDISCHDATE_COL = 5
Const X3IBSDISCHTIME_COL = 6
Const X3IBSDISCHSTATUS_COL = 7
Const X3NEXTBDMNAME_COL = 8
Const X3IBSREMARK_COL = 9
Const X3IBSBDMCODE_COL = 10
Const X3IBSLIBSCODE_COL = 11
Const X3IBSDISCHSTATE_COL = 12
Const X3IBSRECSTATE_COL = 13
Const MFGRD3_COLS = 14

Rem Indoor Tran detail column definition
Const X2TRNCODE_COL = 0
Const X2TRNSYSTYPE_COL = 1
Const X2TRNSMRYID_COL = 2
Const X2TRNVCHNAME_COL = 3
Const X2TRNVCHNO_COL = 4
Const X2TRNDATE_COL = 5
Const X2TRNAMTAFTDISC_COL = 6
Const MFGRD2_COLS = 7

Private Sub ClearSmryParaLayer()

With SmryParaLayer
.mIndex = Array()
.mFromDate = Array()
.mToDate = Array()
.mPttRegNo = Array()
.mPttCode = Array()
.mDetailed = Array()
.mMonthwise = Array()
.mDatewise = Array()
.mPatwise = Array()
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
    ReDim Preserve .mPttRegNo(mIndex)
    ReDim Preserve .mPttCode(mIndex)
    ReDim Preserve .mDetailed(mIndex)
    ReDim Preserve .mMonthwise(mIndex)
    ReDim Preserve .mDatewise(mIndex)
    ReDim Preserve .mPatwise(mIndex)
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
ReDim Preserve .mPttRegNo(mIndex)
ReDim Preserve .mPttCode(mIndex)
ReDim Preserve .mDetailed(mIndex)
ReDim Preserve .mMonthwise(mIndex)
ReDim Preserve .mDatewise(mIndex)
ReDim Preserve .mPatwise(mIndex)
ReDim Preserve .mRowIndex(mIndex)
' -----------------------
.mIndex(mIndex) = mIndex
.mFromDate(mIndex) = Ctod(dtpFromDate.Text)
.mToDate(mIndex) = Ctod(dtpToDate.Text)
    fcmbPttRegNo.BoundText = CStr(mQryPttCode)
    fcmbPttName.BoundText = CStr(mQryPttCode)
.mPttRegNo(mIndex) = Val(fcmbPttRegNo.Text)
.mPttCode(mIndex) = Val(fcmbPttName.BoundText)
.mDetailed(mIndex) = optDetailed.Value
.mMonthwise(mIndex) = optMonthwise.Value
.mDatewise(mIndex) = optDatewise.Value
.mPatwise(mIndex) = optPatientwise.Value
.mRowIndex(mIndex) = -1

End With

End Sub

Private Sub RestoreDefaultSmryPara()

dtpFromDate.Text = Dtoc(sFinYrStartDate)
dtpToDate.Text = Dtoc(sFinYrEndDate)
mQryPttCode = 0
mskQryPttRegNo.Text = "": fcmbPttRegNo.BoundText = ""
txtQryPttName.Text = "": fcmbPttName.BoundText = ""
optDetailed.Value = False
optMonthwise.Value = True
optDatewise.Value = False
optPatientwise.Value = False
' ----------
AddSmryParaLayer mClear:=True

End Sub

Private Sub RestoreRecentSmryPara()
Dim mIndex As Integer

With SmryParaLayer
mIndex = UBound(.mIndex)
dtpFromDate.Text = Dtoc(.mFromDate(mIndex))
dtpToDate.Text = Dtoc(.mToDate(mIndex))
    mQryPttCode = .mPttCode(mIndex)
fcmbPttRegNo.BoundText = CStr(mQryPttCode): mskQryPttRegNo.Text = fcmbPttRegNo.Text
fcmbPttName.BoundText = CStr(mQryPttCode): txtQryPttName.Text = fcmbPttName.Text
optDetailed.Value = .mDetailed(mIndex)
optMonthwise.Value = .mMonthwise(mIndex)
optDatewise.Value = .mDatewise(mIndex)
optPatientwise.Value = .mPatwise(mIndex)
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
mIpgCode = mAccessCode
End Property

Public Property Get EntryBoundCode() As Long
EntryBoundCode = Val(mskFormBoundField.Text)
End Property

Public Property Get EntryDate() As Date
EntryDate = Ctod(dtpIpgDate.Text)
End Property

Public Property Get EntryType() As String
EntryType = "Ipg"
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

Public Property Get PttName() As String
PttName = txtPttName.Text
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

Public Property Get PatAddEditMode() As Integer
PatAddEditMode = cmbPatEntryMode.ListIndex
End Property

Public Property Let PatAddEditMode(ByVal New_PatEntryMode As Integer)
cmbPatEntryMode.ListIndex = New_PatEntryMode
End Property

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

Private Sub cmbIbsDischState_GotFocus()
FlashActiveControl cmbIbsDischState, True
End Sub

Private Sub cmbIbsDischState_LostFocus()
FlashActiveControl cmbIbsDischState, False
End Sub

Private Sub cmbIbsDischState_Validate(Cancel As Boolean)
Dim mIbsDischDate As Date, mIbsDischTime As Long, mIbsDischState As Integer

mIbsDischState = cmbIbsDischState.ItemData(cmbIbsDischState.ListIndex)

If mIbsDischState = cIBS_STATE_UNKNOWN Then
    ErrorBox "Invalid Status !!!"
    cmbIbsDischState.SetFocus
    Cancel = True
ElseIf mIbsDischState = cIBS_STATE_OCCUPIED Then
    dtpIbsDischDate.Text = ""
    txtIbsDischTime.Text = ""
ElseIf mIbsDischState = cIBS_STATE_SHIFTED And dtlAddMode = True Then
    ErrorBox "Invalid Status !!!"
    Rem cmbIbsDischState.SetFocus
    Rem Cancel = True
Else
    mIbsDischDate = Ctod(dtpIbsDischDate.Text)
    mIbsDischTime = TimeToMin(txtIbsDischTime.Text)
    If Not (mIbsDischDate > Ctod(dtpIbsDate.Text) Or (mIbsDischDate = Ctod(dtpIbsDate.Text) And mIbsDischTime >= TimeToMin(txtIbsTime.Text))) Then
        ErrorBox "Invalid Discharge/Shift Date/Time !!!"
    End If
End If
Call ValidDtl

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

Private Sub cmdConfigure_GotFocus()
FlashActiveControl cmdConfigure, True
End Sub

Private Sub cmdConfigure_LostFocus()
FlashActiveControl cmdConfigure, False
End Sub

Private Sub cmdFormEnter_Click()
mLastKeyPressed = 13
If TypeOf Screen.ActiveControl Is MSFlexGrid Then
    If Screen.ActiveControl.Name = Mfgrd1.Name Then
        With datRecset
        If .EOF = False And .BOF = False Then
            If optDetailed.Value = True Then
                Call Data_EditEvent
            Else
                fcmbPttRegNo.BoundText = CStr(mQryPttCode)
                fcmbPttName.BoundText = CStr(mQryPttCode)
                
                txtVoid.SetFocus
                If optMonthwise.Value = True Then
                    dtpFromDate.Text = Dtoc(MonthStartDate(DateSerial(Val(Left(.fields("IpgYrMonth"), 4)), Val(Right(.fields("IpgYrMonth"), 2)), 1)))
                    dtpToDate.Text = Dtoc(MonthEndDate(DateSerial(Val(Left(.fields("IpgYrMonth"), 4)), Val(Right(.fields("IpgYrMonth"), 2)), 1)))
                    optMonthwise.Value = False
                    optDatewise.Value = True
                ElseIf optDatewise.Value = True Then
                    dtpFromDate.Text = Dtoc(.fields("IpgDate"))
                    dtpToDate.Text = Dtoc(.fields("IpgDate"))
                    optDatewise.Value = False
                    optDetailed.Value = True
                ElseIf optPatientwise.Value = True Then
                    mQryPttCode = .fields("IpgPttCode")
                    fcmbPttRegNo.BoundText = CStr(mQryPttCode)
                    fcmbPttName.BoundText = CStr(mQryPttCode)
                    mskQryPttRegNo.Text = fcmbPttRegNo.Text
                    txtQryPttName.Text = fcmbPttName.Text
                    optPatientwise.Value = False
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
        With datRecset2
        If .EOF = False And .BOF = False Then
            Mfgrd2_KeyDown vbKeySpace, 0
        End If
        End With
        
    ElseIf Screen.ActiveControl.Name = Mfgrd3.Name Then
        Mfgrd3_KeyPress vbKeyReturn
        
    End If
ElseIf FormAddEditMode = cFORM_SMRYMODE And frConfigure.Visible = False And frIBedStat.Visible = False And frPrintCRList.Visible = False Then

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

ElseIf frIBedStat.Visible = True Then
    If dtlAddEditMode = True Then
        dtlEditCanceled = True
        Call cmdOK_Click
    Else
        ShowBedStatus mShowItem:=False
        Mfgrd1.SetFocus
    End If
    
ElseIf frIpgTranDtl.Visible = True Then
    ShowSmryList2 mIpgCode:=0, mShowItem:=False
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
        End If
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
        txtPttName.SetFocus
    End If
End If

End Sub

Private Sub cmdOK_Click()
Dim tRecset As New ADODB.Recordset, srow As Integer, mIbsSno As Integer, mIbsCode As Long
Dim mIbsIpgCode As Long, mIbsPttCode As Long, mIbsLIbsCode As Long, mIbsDischState As Integer
Dim mNextIbsDate As Date, mNextIbsTime As Long, mNextIbsBdmCode As Long

srow = Mfgrd3.Row
mIbsSno = Val(UnMyNumFmt(Mfgrd3.TextMatrix(srow, X3IBSSNO_COL)))
mIbsCode = Val(UnMyNumFmt(Mfgrd3.TextMatrix(srow, X3IBSCODE_COL)))
mIbsIpgCode = Val(UnMyNumFmt(lblIbsIpgCode.Caption))
mIbsPttCode = Val(UnMyNumFmt(lblIbsPttCode.Caption))
If cmdOK.Caption = "&OK" And dtlEditCanceled = False Then
    If dtlAddMode = True Then
        mIbsLIbsCode = Val(Mfgrd3.TextMatrix(srow - 1, X3IBSCODE_COL))  ' compulsorily previous IbsCode
        If Not mIbsLIbsCode > 0 Then
            ErrorBox Me.Name & "_cmdOK_Click_#463_[Unexpected Bed Link]"
            dtlEditCanceled = True
        End If
    Else
        mIbsLIbsCode = Val(Mfgrd3.TextMatrix(srow, X3IBSLIBSCODE_COL))      ' compulsorily existing IbsLIbsCode
        If srow <> FlexDetailTopRow(Mfgrd3) Then
            If Not mIbsLIbsCode > 0 Or mIbsLIbsCode <> Val(Mfgrd3.TextMatrix(srow - 1, X3IBSCODE_COL)) Then
                ErrorBox Me.Name & "_cmdOK_Click_#469_[Unexpected Bed Link]"
                dtlEditCanceled = True
            End If
        End If
    End If
    mIbsDischState = cmbIbsDischState.ItemData(cmbIbsDischState.ListIndex)
End If
If cmdOK.Caption = "&OK" And dtlEditCanceled = False Then
    If dtlAddMode = False And mIbsDischState = cIBS_STATE_SHIFTED And mIbsDischState_old = cIBS_STATE_OCCUPIED Then
        Rem store new values
        mNextIbsDate = Ctod(dtpIbsDischDate.Text)
        mNextIbsTime = TimeToMin(txtIbsDischTime.Text)
        mNextIbsBdmCode = Val(fcmbNextBdmName.BoundText)
        Rem cancel current entry
        dtlEditCanceled = True
        Call cmdOK_Click
        Rem call new add entry
        Mfgrd3.Row = Mfgrd3.Row + 1
        Mfgrd3_KeyPress vbKeyReturn
        If dtlAddEditMode = True And dtlAddMode = True Then
            txtVoid.SetFocus
            fcmbBdmName.BoundText = CStr(mNextIbsBdmCode): txtBdmName(1).Text = fcmbBdmName.Text
            dtpIbsDate.Text = Dtoc(mNextIbsDate)
            txtIbsTime.Text = MinToTime(mNextIbsTime)
            dtpIbsDischDate.Text = ""
            txtIbsDischTime.Text = ""
            cmbIbsDischState.ListIndex = GetListIndexFromItemData(mCmbObj:=cmbIbsDischState, mTargetItemData:=cIBS_STATE_OCCUPIED)
            Call ValidDtl
            Call cmdOK_Click
        Else
            ErrorBox Me.Name & "_cmdOK_Click_#501_[Unexpected Bed Shifting Generation]"
        End If
        Rem exit from here
        Mfgrd3.SetFocus
        Exit Sub
    End If
End If
If cmdOK.Caption = "&OK" And dtlEditCanceled = False Then
    If dtlAddMode = True Then
        If clsIBS.BeginTran(0) = False Then
            ErrorBox "Entry Cancelled !!!"
            dtlEditCanceled = True
        End If
    Else
        If clsIBS.BeginTran(mIbsCode) = False Then
            ErrorBox "Entry Cancelled !!!"
            dtlEditCanceled = True
        End If
    End If
End If
If cmdOK.Caption = "&OK" And dtlEditCanceled = False Then
    clsIPG.GetData mIbsIpgCode
    
    With clsIBS
    If dtlAddMode = True Then
        .Clear
        .mIbsLIbsCode_lng = mIbsLIbsCode
    Else
        .GetData mIbsCode
    End If
    .mVtmCode_lng = clsIPG.mVtmCode_lng     ''   Val(fcmbVtmName.BoundText)
    .mIbsSno_int = Val(UnMyNumFmt(mskIbsSno.Text))
    .mVchNo_lng = clsIPG.mVchNo_lng         ''   Val(UnMyNumFmt(mskIpgVchNo.Text))
    .mVchDate_dt = Ctod(dtpIbsDate.Text)    ''  Ctod(dtpIpgDate.Text)
    .mCmpCode_int = sFinYrCmpCode
    
    .mIbsPrefix_str = ""
    .mIbsPostfix_str = ""
    .mIbsTime_lng = TimeToMin(txtIbsTime.Text)
    .mIbsIpgCode_lng = mIbsIpgCode
    .mIbsBdmCode_lng = Val(fcmbBdmName.BoundText)
    .mIbsPttCode_lng = mIbsPttCode
    .mIbsDischDate_dt = IIf(dtpIbsDischDate.Text = "", cUNKNOWNDATE, Ctod(dtpIbsDischDate.Text))
    .mIbsDischTime_lng = IIf(txtIbsDischTime.Text = "", 0, TimeToMin(txtIbsDischTime.Text))
    .mIbsDischState_int = mIbsDischState
    .mIbsRemark_str = txtIbsRemark.Text
    
    If dtlAddMode = True Then
        .AddNew
    Else
        .Update mIbsCode
    End If
    If .mCode_lng > 0 Then   ' updated successfully
        mIbsCode = .mCode_lng
        
        .UpdateTran .mCode_lng
        .EndTran .mCode_lng
        
        Rem refresh grid row
        RefreshDatabase dbHmsDatabase
        Rem show data for current row
        With tRecset
        .open "Select * from IBedState where IbsCode=" & CStr(mIbsCode) & "", dbHmsDatabase, adOpenKeyset, adLockOptimistic
        
        clsBDM.GetData .fields("IbsBdmCode")
        
        Mfgrd3.TextMatrix(srow, X3IBSCODE_COL) = .fields("IbsCode")
        Mfgrd3.TextMatrix(srow, X3IBSSNO_COL) = ToMyNumFmt(.fields("IbsSno"), mDecimals:=0)
        Mfgrd3.TextMatrix(srow, X3BDMNAME_COL) = clsBDM.mName_str
        Mfgrd3.TextMatrix(srow, X3IBSDATE_COL) = Dtoc(.fields("IbsDate"))
        Mfgrd3.TextMatrix(srow, X3IBSTIME_COL) = MinToTime(.fields("IbsTime"))
        Mfgrd3.TextMatrix(srow, X3IBSDISCHDATE_COL) = IIf(.fields("IbsDischDate") <> cUNKNOWNDATE, Dtoc(.fields("IbsDischDate")), "")
        Mfgrd3.TextMatrix(srow, X3IBSDISCHTIME_COL) = IIf(.fields("IbsDischTime") <> 0, MinToTime(.fields("IbsDischTime")), "")
        Mfgrd3.TextMatrix(srow, X3IBSDISCHSTATUS_COL) = GetListTextFromItemData(mCmbObj:=cmbIbsDischState, mTargetItemData:=.fields("IbsDischState"))
        If dtlAddMode = True Then
            Mfgrd3.TextMatrix(srow, X3NEXTBDMNAME_COL) = ""
        Else
            Mfgrd3.TextMatrix(srow, X3NEXTBDMNAME_COL) = Mfgrd3.TextMatrix(srow, X3NEXTBDMNAME_COL)
        End If
        Mfgrd3.TextMatrix(srow, X3IBSREMARK_COL) = .fields("IbsRemark")
        Mfgrd3.TextMatrix(srow, X3IBSBDMCODE_COL) = .fields("IbsBdmCode")
        Mfgrd3.TextMatrix(srow, X3IBSLIBSCODE_COL) = .fields("IbsLIbsCode")
        Mfgrd3.TextMatrix(srow, X3IBSDISCHSTATE_COL) = .fields("IbsDischState")
        Mfgrd3.TextMatrix(srow, X3IBSRECSTATE_COL) = .fields("IbsRecState")
        If .fields("IbsLIbsCode") > 0 Then
            If Val(Mfgrd3.TextMatrix(srow - 1, X3IBSCODE_COL)) = .fields("IbsLIbsCode") Then
                Mfgrd3.TextMatrix(srow - 1, X3NEXTBDMNAME_COL) = clsBDM.mName_str
            Else
                ErrorBox Me.Name & "_cmdOK_Click_#1596_[Bed Unexpected]"
            End If
        End If
        End With
        CloseTable tRecset
        
        Rem show data for previous/linked row
        If mIbsLIbsCode <> 0 Then
            With tRecset
            .open "Select * from IBedState where IbsCode=" & CStr(mIbsLIbsCode) & "", dbHmsDatabase, adOpenKeyset, adLockOptimistic
            
            clsBDM.GetData .fields("IbsBdmCode")
            
            Mfgrd3.TextMatrix(srow - 1, X3IBSCODE_COL) = .fields("IbsCode")
            Mfgrd3.TextMatrix(srow - 1, X3IBSSNO_COL) = ToMyNumFmt(.fields("IbsSno"), mDecimals:=0)
            Mfgrd3.TextMatrix(srow - 1, X3BDMNAME_COL) = clsBDM.mName_str
            Mfgrd3.TextMatrix(srow - 1, X3IBSDATE_COL) = Dtoc(.fields("IbsDate"))
            Mfgrd3.TextMatrix(srow - 1, X3IBSTIME_COL) = MinToTime(.fields("IbsTime"))
            Mfgrd3.TextMatrix(srow - 1, X3IBSDISCHDATE_COL) = IIf(.fields("IbsDischDate") <> cUNKNOWNDATE, Dtoc(.fields("IbsDischDate")), "")
            Mfgrd3.TextMatrix(srow - 1, X3IBSDISCHTIME_COL) = IIf(.fields("IbsDischTime") <> 0, MinToTime(.fields("IbsDischTime")), "")
            Mfgrd3.TextMatrix(srow - 1, X3IBSDISCHSTATUS_COL) = GetListTextFromItemData(mCmbObj:=cmbIbsDischState, mTargetItemData:=.fields("IbsDischState"))
            Rem Mfgrd3.TextMatrix(srow - 1, X3NEXTBDMNAME_COL) = clsBDM.mName_str   already stored above
            Mfgrd3.TextMatrix(srow - 1, X3IBSREMARK_COL) = .fields("IbsRemark")
            Mfgrd3.TextMatrix(srow - 1, X3IBSBDMCODE_COL) = .fields("IbsBdmCode")
            Mfgrd3.TextMatrix(srow - 1, X3IBSLIBSCODE_COL) = .fields("IbsLIbsCode")
            Mfgrd3.TextMatrix(srow - 1, X3IBSDISCHSTATE_COL) = .fields("IbsDischState")
            Mfgrd3.TextMatrix(srow - 1, X3IBSRECSTATE_COL) = .fields("IbsRecState")
            
            End With
            CloseTable tRecset
        End If
        
        If dtlAddMode = True Then
            Mfgrd3.Rows = Mfgrd3.Rows + 1
        End If
        srow = srow + 1
        Mfgrd3.Row = srow
    Else
        .CancelTran mIbsCode
        .EndTran mIbsCode
        ErrorBox "Entry Cancelled !!!"
    End If
    End With
End If
dtlAddEditMode = False
dtlAddMode = False
dtlEditCanceled = False
VisibleControls False
txtVoid.SetFocus
Mfgrd3.SetFocus
CloseTable tRecset, mCheckOpen:=True

End Sub

Private Sub cmdSaveForm_Click()
txtVoid.SetFocus
Call Data_SaveEvent
Call SmryList

If optDetailed.Value = True Then
    txtSearch1Text_InterActiveChange Format(Ctod(dtpIpgDate.Text), "yyyymmdd") + Format(mIpgCode, "0000000")
ElseIf optMonthwise.Value = True Then
    txtSearch1Text_InterActiveChange Format(Ctod(dtpIpgDate.Text), "yyyy") & "/" & Format(Ctod(dtpIpgDate.Text), "mm")
ElseIf optDatewise.Value = True Then
    txtSearch1Text_InterActiveChange Format(Ctod(dtpIpgDate.Text), "yyyymmdd")
ElseIf optPatientwise.Value = True Then
    txtSearch1Text_InterActiveChange txtPttName.Text
End If

Call ShowEntryMode(False)
Mfgrd1.SetFocus

End Sub

Private Sub cmdSaveForm_GotFocus()
Dim mIpgAcsPermNo As Integer, mPatAcsPermNo As Integer, mRetryCount As Integer

txtVoid.SetFocus
cmdSaveForm.Enabled = False
If Data_Verify() = True Then
    If CanAccept() = True Then
        If (GetAccessPerm(mIpgAcsPermNo, mRetryCount, mFormIpgAcsPermFileName) = True And mRetryCount = 0) _
         And (GetAccessPerm(mPatAcsPermNo, mRetryCount, mFormPatAcsPermFileName) = True And mRetryCount = 0) Then
            If Data_NetwAuth() = True Then
                Call cmdSaveForm_Click
                Close #mIpgAcsPermNo
                Close #mPatAcsPermNo
                If mRemoteAccess = True Then
                    ''Unload Me
                    Me.Hide
                    Exit Sub
                Else
                    Call Mfgrd1_RowColChange
                    Data_PrintDialog "SaveEvent"
                End If
            Else
                Close #mIpgAcsPermNo
                Close #mPatAcsPermNo
            End If
        Else
            Close #mIpgAcsPermNo
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

Private Sub dtpIbsDate_GotFocus()
FlashActiveControl dtpIbsDate, True
End Sub

Private Sub dtpIbsDate_LostFocus()
FlashActiveControl dtpIbsDate, False
End Sub

Private Sub dtpIbsDate_Validate(Cancel As Boolean)
Dim tRecset As New ADODB.Recordset, srow As Integer, mIbsCode As Long, mIbsDate As Date, mIbsDate_old As Date

srow = Mfgrd3.Row
dtpIbsDate.Text = ToMyDate(dtpIbsDate.Text)
If IsDate(Ctod(dtpIbsDate.Text)) = False Then
    ErrorBox "Invalid Input !!!"
    dtpIbsDate.SetFocus
    Cancel = True
Else
    mIbsDate = Ctod(dtpIbsDate.Text)
    mIbsDate_old = Ctod(Mfgrd3.TextMatrix(srow, X3IBSDATE_COL))
    mIbsCode = Val(Mfgrd3.TextMatrix(srow, X3IBSCODE_COL))
    If srow > FlexDetailTopRow(Mfgrd3) Then
        If mIbsDate < Ctod(Mfgrd3.TextMatrix(srow - 1, X3IBSDATE_COL)) Then
            ErrorBox "Invalid Shifting Date !!!"
            dtpIbsDate.SetFocus
            Cancel = True
        End If
    End If
    If dtlAddMode = False And Cancel = False Then
        If mIbsDate <> mIbsDate_old Then
            With tRecset
            .open "Select * from ((IndrBlIbsDtl" _
                & " inner join IBedState on IndrBlIbsDtl.IbbsIbsCode = IBedState.IbsCode)" _
                & " inner join IndrBill on IndrBlIbsDtl.IbbsCode = IndrBill.IblCode and IndrBlIbsDtl.IbbsIblICode = IndrBill.IblICode)" _
                & " left join IndrBlHdr on IndrBill.IblCode = IndrBlHdr.IbhCode" _
                & " where IbbsIpgCode=" & CStr(Val(lblIbsIpgCode.Caption)) & " and IbbsIbsCode=" & CStr(mIbsCode) _
                & " order by IblDate Desc" & "", dbHmsDatabase, adOpenKeyset, adLockReadOnly
            If .RecordCount > 0 Then
                If IsNull(.fields("IbhCode")) = False Then
                    ErrorBox "Bed Charges Already Charged in Indoor Bill No." & CStr(.fields("IbhVchNo")) & " Dated " & Dtoc(.fields("IbhDate")) & " !!!"
                Else
                    ErrorBox "Bed Charges Already Charged in Indoor Bill Dated " & Dtoc(.fields("IblDate")) & " Under Process !!!"
                End If
                dtpIbsDate.Text = Dtoc(mIbsDate_old)
                dtpIbsDate.SetFocus
                Cancel = True
            End If
            End With
            CloseTable tRecset
        End If
    End If
End If
Call ValidDtl

End Sub

Private Sub dtpIbsDischDate_GotFocus()
FlashActiveControl dtpIbsDischDate, True
End Sub

Private Sub dtpIbsDischDate_LostFocus()
FlashActiveControl dtpIbsDischDate, False
End Sub

Private Sub dtpIbsDischDate_Validate(Cancel As Boolean)
Dim tRecset As New ADODB.Recordset, srow As Integer, mIbsCode As Long, mIbsDischDate As Date, mIbsDischDate_old As Date

srow = Mfgrd3.Row
If dtpIbsDischDate.Text <> "" Then
    dtpIbsDischDate.Text = ToMyDate(dtpIbsDischDate.Text)
    If Ctod(dtpIbsDischDate.Text) < Ctod(dtpIbsDate.Text) Then
        ErrorBox "Invalid Discharge/Shift Date !!!"
        dtpIbsDischDate.SetFocus
        Cancel = True
    End If
    
    mIbsDischDate = Ctod(dtpIbsDischDate.Text)
    mIbsDischDate_old = Ctod(Mfgrd3.TextMatrix(srow, X3IBSDISCHDATE_COL))
    mIbsCode = Val(Mfgrd3.TextMatrix(srow, X3IBSCODE_COL))
    If dtlAddMode = False And Cancel = False Then
        If mIbsDischDate <> mIbsDischDate_old Then
            With tRecset
            .open "Select * from ((IndrBlIbsDtl" _
                & " inner join IBedState on IndrBlIbsDtl.IbbsIbsCode = IBedState.IbsCode)" _
                & " inner join IndrBill on IndrBlIbsDtl.IbbsCode = IndrBill.IblCode and IndrBlIbsDtl.IbbsIblICode = IndrBill.IblICode)" _
                & " left join IndrBlHdr on IndrBill.IblCode = IndrBlHdr.IbhCode" _
                & " where IbbsIpgCode=" & CStr(Val(lblIbsIpgCode.Caption)) & " and IbbsIbsCode=" & CStr(mIbsCode) _
                & " order by IblDate Desc" & "", dbHmsDatabase, adOpenKeyset, adLockReadOnly
            If .RecordCount > 0 Then
                If .fields("IbbsToDate") > mIbsDischDate Then
                    If IsNull(.fields("IbhCode")) = False Then
                        ErrorBox "Bed Charges Already Charged in Indoor Bill No." & CStr(.fields("IbhVchNo")) & " Dated " & Dtoc(.fields("IbhDate")) & " !!!"
                    Else
                        ErrorBox "Bed Charges Already Charged in Indoor Bill Dated " & Dtoc(.fields("IblDate")) & " Under Process !!!"
                    End If
                    If Mfgrd3.TextMatrix(srow, X3IBSDISCHDATE_COL) = "" Then
                        dtpIbsDischDate.Text = ""
                    Else
                        dtpIbsDischDate.Text = Dtoc(mIbsDischDate_old)
                    End If
                    dtpIbsDischDate.SetFocus
                    Cancel = True
                End If
            End If
            End With
            CloseTable tRecset
        End If
    End If
End If
Call ValidDtl

End Sub

Private Sub dtpIpgDate_GotFocus()
FlashActiveControl dtpIpgDate, True
End Sub

Private Sub dtpIpgDate_LostFocus()
FlashActiveControl dtpIpgDate, False
End Sub

Private Sub dtpIpgDate_Validate(Cancel As Boolean)
dtpIpgDate.Text = ToMyDate(dtpIpgDate.Text)
If IsFinYrDate(Ctod(dtpIpgDate.Text)) = False Then
    ErrorBox "Invalid Input !!!"
    dtpIpgDate.SetFocus
    Cancel = True
End If

End Sub

Private Sub dtpIpgDischDate_GotFocus()
FlashActiveControl dtpIpgDischDate, True
End Sub

Private Sub dtpIpgDischDate_LostFocus()
FlashActiveControl dtpIpgDischDate, False
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
Dim srow As Integer

If mFormLoaded = False Then
    If mRemoteAccess = True Then
        MoveRecToFirst datRecset
        ShowRecActiveFlexRow datRecset, Mfgrd1
        Mfgrd1.SetFocus
        If mIpgCode = 0 Then
            Call Data_AddEvent
        Else
            Call Data_EditEvent
        End If
    Else
        MoveRecToFirst datRecset
        ShowRecActiveFlexRow datRecset, Mfgrd1
        Mfgrd1.SetFocus
    End If
    
ElseIf mEntryAccessed = True Then
    srow = Mfgrd1.Row
    mIpgCode = Val(Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IpgCode")))
    If mIpgCode > 0 Then
        ShowSmryList2 mIpgCode:=mIpgCode, mShowItem:=True
        If datRecset2.RecordCount > 0 Then
            Call Chk_EntryAccessed
        End If
        Mfgrd2.SetFocus
    End If
    
Else
    RefreshDatabase dbHmsDatabase
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

mFormIpgUIdFileName = "IndrReg.Uid"
mFormIpgAcsPermFileName = "IndrReg.Acp"
mFormUIdCode = GetUIdCode(mProcess:=Me.Name, mUIdFileName:=mFormIpgUIdFileName, mAcsPermFileName:=mFormIpgAcsPermFileName)
mFormPatUIdFileName = "PatMast.Uid"
mFormPatAcsPermFileName = "PatMast.Acp"

mFormLoaded = False
mEntrySaved = False: mEntryAborted = False
SetFormSize Me, frmMain
Call Form_Resize

Call SetVoidControl(txtVoid)
txtSearch1Text.Enabled = False
frConfigure.Visible = False
frPrintCRList.Visible = False
frIBedStat.Visible = False
txtIpgPrefix.Enabled = False

ChkCustomForm Me, CfsFileFullPath("IndrReg.Cfs")

OpenAcDataSource dbAcDatabase
OpenHmsDataSource dbHmsDatabase
OpenGrpDataSource dbGrpDatabase
OpenComDataSource dbComDatabase

AddItemToComboFromList mCmbObj:=cmbIbsDischState, mList:=cIPD_DISCHARGE_STATE, mSprtr:=","

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

Set clsListStru = New clsSelectQueryStructure

Set clsHOPT = New clsHmsIpdOptionsEntry
clsHOPT.blnIndrRegOptMast = True
clsHOPT.Init
clsHOPT.GetIndrRegOptData

Set clsAH = New clsAccountHead
Set clsAH.dbAcDatabase = dbAcDatabase
Set clsAH.dbGrpDatabase = dbGrpDatabase

Set clsIPG = New clsHmsSnglTranEntry
Set clsIPG.dbAcDatabase = dbAcDatabase
Set clsIPG.dbHmsDatabase = dbHmsDatabase
clsIPG.blnIndrRegTran = True
clsIPG.Init

Set clsIBS = New clsHmsSnglTranEntry
Set clsIBS.dbAcDatabase = dbAcDatabase
Set clsIBS.dbHmsDatabase = dbHmsDatabase
clsIBS.blnIndrBedStatus = True
clsIBS.Init

Set clsPAT = New clsHmsMasterEntry
Set clsPAT.dbAcDatabase = dbAcDatabase
Set clsPAT.dbHmsDatabase = dbHmsDatabase
clsPAT.blnPatMast = True
clsPAT.Init

Set clsPCG = New clsHmsMasterEntry
Set clsPCG.dbHmsDatabase = dbHmsDatabase
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

Set clsVTM = New clsComMastEntry
Set clsVTM.dbAcDatabase = dbAcDatabase
clsVTM.blnVTypeMast = True
clsVTM.Init

Set clsBDM = New clsHmsMasterEntry
Set clsBDM.dbHmsDatabase = dbHmsDatabase
clsBDM.blnBedMast = True
clsBDM.Init

Set fcmbAhName = New clsComFlexSearch
Set fcmbAhName.dbAcDatabase = dbAcDatabase
fcmbAhName.blnAchdMastList = True
fcmbAhName.Init

Set fcmbPcgName = New clsHmsFlexSearch
Set fcmbPcgName.dbHmsDatabase = dbHmsDatabase
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

Set fcmbVtmName = New clsComFlexSearch
Set fcmbVtmName.dbAcDatabase = dbAcDatabase
fcmbVtmName.blnVTypeMastList = True
fcmbVtmName.mListSqlExpr = "Select * from VTypMast where VtmSysCode=" & CStr(cHMS_VTYPE_INDOOR_REG) & " order by VtmName"
fcmbVtmName.Init

Set fcmbCDctName = New clsHmsFlexSearch
Set fcmbCDctName.dbHmsDatabase = dbHmsDatabase
fcmbCDctName.blnDoctMastList = True
fcmbCDctName.Init

Set fcmbRByName = New clsHmsFlexSearch
Set fcmbRByName.dbHmsDatabase = dbHmsDatabase
fcmbRByName.blnRefByMastList = True
fcmbRByName.Init

Set fcmbFDigName = New clsHmsFlexSearch
Set fcmbFDigName.dbHmsDatabase = dbHmsDatabase
fcmbFDigName.blnDiagMastList = True
fcmbFDigName.Init

Set fcmbBdmName = New clsHmsFlexSearch
Set fcmbBdmName.dbHmsDatabase = dbHmsDatabase
fcmbBdmName.blnBedMastList = True
fcmbBdmName.Init

Set fcmbNextBdmName = New clsHmsFlexSearch
Set fcmbNextBdmName.dbHmsDatabase = dbHmsDatabase
fcmbNextBdmName.blnBedMastList = True
fcmbNextBdmName.Init

Set fcmbPttRegNo = New clsHmsFlexSearch
Set fcmbPttRegNo.dbHmsDatabase = dbHmsDatabase
Set fcmbPttRegNo.dbComDatabase = dbComDatabase
fcmbPttRegNo.blnPatMastListByRegNo = True
fcmbPttRegNo.Init

Set fcmbPttName = New clsHmsFlexSearch
Set fcmbPttName.dbHmsDatabase = dbHmsDatabase
Set fcmbPttName.dbComDatabase = dbComDatabase
fcmbPttName.blnPatMastListByName = True
fcmbPttName.Init

Set fcmbOldIpdByIpdNo = New clsHmsFlexSearch
Set fcmbOldIpdByIpdNo.dbHmsDatabase = dbHmsDatabase
Set fcmbOldIpdByIpdNo.dbComDatabase = dbComDatabase
fcmbOldIpdByIpdNo.blnOldIpgListByIpgNo = True
fcmbOldIpdByIpdNo.Init

Set fcmbOldIpdByPttRegNo = New clsHmsFlexSearch
Set fcmbOldIpdByPttRegNo.dbHmsDatabase = dbHmsDatabase
Set fcmbOldIpdByPttRegNo.dbComDatabase = dbComDatabase
fcmbOldIpdByPttRegNo.blnOldIpgListByPttRegNo = True
fcmbOldIpdByPttRegNo.Init

Set fcmbOldIpdByPttName = New clsHmsFlexSearch
Set fcmbOldIpdByPttName.dbHmsDatabase = dbHmsDatabase
Set fcmbOldIpdByPttName.dbComDatabase = dbComDatabase
fcmbOldIpdByPttName.blnOldIpgListByPttName = True
fcmbOldIpdByPttName.Init

Call RestoreDefaultSmryPara
If mRemoteAccess = True Then
    optDetailed.Value = True
    AddSmryParaLayer mClear:=True
End If

If mRemoteAccess = True Then
    datRecset.open "Select * from IndrReg inner join PatMast on IndrReg.IpgPttCode=PatMast.PttCode where IpgCode=" & CStr(mIpgCode) & " order by IpgDate,IpgTime", dbHmsDatabase, adOpenKeyset, adLockOptimistic
Else
    datRecset.open "Select * from IndrReg inner join PatMast on IndrReg.IpgPttCode=PatMast.PttCode order by IpgDate,IpgTime", dbHmsDatabase, adOpenKeyset, adLockOptimistic
End If
Mfgrd1.FixedCols = 0
Call SmryList

Mfgrd3.FixedRows = 1: Mfgrd3.FixedCols = 0: Mfgrd3.Rows = 2: Mfgrd3.Cols = MFGRD3_COLS
colcnt = X3IBSCODE_COL: Mfgrd3.ColWidth(colcnt) = 0: Mfgrd3.TextMatrix(0, colcnt) = "X3IBSCODE_COL": Mfgrd3.ColAlignment(colcnt) = 7
colcnt = X3IBSSNO_COL: Mfgrd3.ColWidth(colcnt) = mskIbsSno.Width: Mfgrd3.TextMatrix(0, colcnt) = "Sno": Mfgrd3.ColAlignment(colcnt) = 7
colcnt = X3BDMNAME_COL: Mfgrd3.ColWidth(colcnt) = txtBdmName(1).Width: Mfgrd3.TextMatrix(0, colcnt) = "Bed Name": Mfgrd3.ColAlignment(colcnt) = 1
colcnt = X3IBSDATE_COL: Mfgrd3.ColWidth(colcnt) = dtpIbsDate.Width: Mfgrd3.TextMatrix(0, colcnt) = "From Date": Mfgrd3.ColAlignment(colcnt) = 1
colcnt = X3IBSTIME_COL: Mfgrd3.ColWidth(colcnt) = txtIbsTime.Width: Mfgrd3.TextMatrix(0, colcnt) = "Time": Mfgrd3.ColAlignment(colcnt) = 1
colcnt = X3IBSDISCHDATE_COL: Mfgrd3.ColWidth(colcnt) = dtpIbsDischDate.Width: Mfgrd3.TextMatrix(0, colcnt) = "To Date": Mfgrd3.ColAlignment(colcnt) = 1
colcnt = X3IBSDISCHTIME_COL: Mfgrd3.ColWidth(colcnt) = txtIbsDischTime.Width: Mfgrd3.TextMatrix(0, colcnt) = "Time": Mfgrd3.ColAlignment(colcnt) = 1
colcnt = X3IBSDISCHSTATUS_COL: Mfgrd3.ColWidth(colcnt) = cmbIbsDischState.Width: Mfgrd3.TextMatrix(0, colcnt) = "Disch.Status": Mfgrd3.ColAlignment(colcnt) = 1
colcnt = X3NEXTBDMNAME_COL: Mfgrd3.ColWidth(colcnt) = txtBdmName(2).Width: Mfgrd3.TextMatrix(0, colcnt) = "Next Bed": Mfgrd3.ColAlignment(colcnt) = 1
colcnt = X3IBSREMARK_COL: Mfgrd3.ColWidth(colcnt) = txtIbsRemark.Width: Mfgrd3.TextMatrix(0, colcnt) = "Remark": Mfgrd3.ColAlignment(colcnt) = 1
colcnt = X3IBSBDMCODE_COL: Mfgrd3.ColWidth(colcnt) = 0: Mfgrd3.TextMatrix(0, colcnt) = "X3IBSBDMCODE_COL": Mfgrd3.ColAlignment(colcnt) = 7
colcnt = X3IBSLIBSCODE_COL: Mfgrd3.ColWidth(colcnt) = 0: Mfgrd3.TextMatrix(0, colcnt) = "X3IBSLIBSCODE_COL": Mfgrd3.ColAlignment(colcnt) = 7
colcnt = X3IBSDISCHSTATE_COL: Mfgrd3.ColWidth(colcnt) = 0: Mfgrd3.TextMatrix(0, colcnt) = "X3IBSDISCHSTATE_COL": Mfgrd3.ColAlignment(colcnt) = 7
colcnt = X3IBSRECSTATE_COL: Mfgrd3.ColWidth(colcnt) = 0: Mfgrd3.TextMatrix(0, colcnt) = "X3IBSRECSTATE_COL": Mfgrd3.ColAlignment(colcnt) = 7

colcnt = X3IBSSNO_COL: mskIbsSno.Left = Mfgrd3.Left + Mfgrd3.ColPos(colcnt)
colcnt = X3BDMNAME_COL: txtBdmName(1).Left = Mfgrd3.Left + Mfgrd3.ColPos(colcnt)
colcnt = X3IBSDATE_COL: dtpIbsDate.Left = Mfgrd3.Left + Mfgrd3.ColPos(colcnt)
colcnt = X3IBSTIME_COL: txtIbsTime.Left = Mfgrd3.Left + Mfgrd3.ColPos(colcnt)
colcnt = X3IBSDISCHDATE_COL: dtpIbsDischDate.Left = Mfgrd3.Left + Mfgrd3.ColPos(colcnt)
colcnt = X3IBSDISCHTIME_COL: txtIbsDischTime.Left = Mfgrd3.Left + Mfgrd3.ColPos(colcnt)
colcnt = X3IBSDISCHSTATUS_COL: cmbIbsDischState.Left = Mfgrd3.Left + Mfgrd3.ColPos(colcnt)
colcnt = X3NEXTBDMNAME_COL: txtBdmName(2).Left = Mfgrd3.Left + Mfgrd3.ColPos(colcnt)
colcnt = X3IBSREMARK_COL: txtIbsRemark.Left = Mfgrd3.Left + Mfgrd3.ColPos(colcnt)
cmdOK.Left = txtIbsRemark.Left

Mfgrd2.FixedRows = 1: Mfgrd2.FixedCols = 0: Mfgrd2.Rows = 2: Mfgrd2.Cols = MFGRD2_COLS: SetGridAutoHeight Mfgrd2

colcnt = X2TRNCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2TRNCODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2TRNSYSTYPE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2TRNSYSTYPE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2TRNSMRYID_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2TRNSMRYID_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2TRNVCHNAME_COL: Mfgrd2.ColWidth(colcnt) = 3000: Mfgrd2.TextMatrix(0, colcnt) = "Voucher": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2TRNVCHNO_COL: Mfgrd2.ColWidth(colcnt) = 1500: Mfgrd2.TextMatrix(0, colcnt) = "Vch.No": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2TRNDATE_COL: Mfgrd2.ColWidth(colcnt) = 1500: Mfgrd2.TextMatrix(0, colcnt) = "Date": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2TRNAMTAFTDISC_COL: Mfgrd2.ColWidth(colcnt) = 1500: Mfgrd2.TextMatrix(0, colcnt) = "Amount": Mfgrd2.ColAlignment(colcnt) = 7

ShowEntryMode False
ShowStatusBarText StatusBar1

End Sub

Private Sub StatusBar1_PanelClick(ByVal Panel As MSComctlLib.Panel)
ShowStatusBarText StatusBar1
End Sub

Private Sub Form_Resize()
lblFormHeading.Width = Me.Width
cmdFormEscape.Left = Me.Width - (cmdFormEscape.Width * 2)
cmdFormEnter.Left = Me.Width + cmdFormEscape.Width
frFormSmry.Left = (Me.Width - frFormSmry.Width) / 2: frFormSmry.Top = cmbFormEntryMode.Top + (cmbFormEntryMode.Height * 2)
frFormDtl.Left = (Me.Width - frFormDtl.Width) / 2: frFormDtl.Top = frFormSmry.Top

End Sub

Private Sub Form_Unload(Cancel As Integer)
Set clsHOPT = Nothing
Set clsJRN = Nothing
Set clsAH = Nothing
Set clsIPG = Nothing
Set clsIBS = Nothing
Set clsPAT = Nothing
Set clsPCG = Nothing
Set clsARA = Nothing
Set clsSTN = Nothing
Set clsVTM = Nothing
Set clsBDM = Nothing
Set fcmbOldIpdByIpdNo = Nothing
Set fcmbOldIpdByPttRegNo = Nothing
Set fcmbOldIpdByPttName = Nothing
Set fcmbPttRegNo = Nothing
Set fcmbPttName = Nothing
Set fcmbAhName = Nothing
Set fcmbPcgName = Nothing
Set fcmbAraName = Nothing
Set fcmbStnName = Nothing
Set fcmbVtmName = Nothing
Set fcmbCDctName = Nothing
Set fcmbRByName = Nothing
Set fcmbFDigName = Nothing
Set fcmbBdmName = Nothing
Set fcmbNextBdmName = Nothing
Set clsListStru = Nothing
Set frmTrn = Nothing

CloseTable datRecset
CloseTable datRecset2, mCheckOpen:=True
CloseDataSource dbAcDatabase
CloseDataSource dbHmsDatabase
CloseDataSource dbGrpDatabase
CloseDataSource dbComDatabase
End Sub

Private Sub ShowEntryMode(ByVal EntryMode As Boolean)
If Me.Visible = True Then
    txtVoid.SetFocus
End If
frFormSmry.Visible = Not EntryMode: frFormSmry.Enabled = Not EntryMode
frFormDtl.Visible = EntryMode: frFormDtl.Enabled = EntryMode
frIpgTranDtl.Visible = EntryMode: frIpgTranDtl.Enabled = EntryMode
cmdSaveForm.Enabled = EntryMode
If EntryMode = False Then
    FormAddEditMode = cFORM_SMRYMODE
    PatAddEditMode = cFORM_SMRYMODE
End If

End Sub

Private Sub ShowBedStatus(ByVal mShowItem As Boolean)
Dim mIbsIpgCode As Long, mIbsPttCode As Long
Dim mPttAgeYr As Long, mPttAgeMn As Long, mPttAgeDy As Long

If Me.Visible = True Then
    txtVoid.SetFocus
End If

If mShowItem = True Then
    With datRecset
    mIbsIpgCode = .fields("IpgCode")
    mIbsPttCode = .fields("IpgPttCode")
    
    clsIPG.GetData mIbsIpgCode
    clsPAT.GetData mIbsPttCode
    clsVTM.GetData clsIPG.mVtmCode_lng
    End With
    
    lblIbsIpgCode.Caption = ToMyNumFmt(mIbsIpgCode, mDecimals:=0)
    lblIbsPttCode.Caption = ToMyNumFmt(mIbsPttCode, mDecimals:=0)
    lblIbsPttName.Caption = clsPAT.mName_str
    lblIbsPttRegNo.Caption = ToMyNumFmt(clsPAT.mPttRegNo_lng, mDecimals:=0)
    lblIbsPttAge_str.Caption = GetAgeStr(mDob:=clsPAT.mPttDob_dt, mCdt:=clsIPG.mVchDate_dt, mYr:=mPttAgeYr, mMn:=mPttAgeMn, mDy:=mPttAgeDy)
    lblIbsPttSex.Caption = clsPAT.mPttSex_str
    lblIbsIpgVtmName.Caption = clsVTM.mName_str
    lblIbsIpgPrefix.Caption = clsIPG.mIpgPrefix_str
    lblIbsIpgVchNo.Caption = ToMyNumFmt(clsIPG.mVchNo_lng, mDecimals:=0)
    lblIbsIpgDate.Caption = Dtoc(clsIPG.mVchDate_dt)
    lblIbsIpgTime.Caption = MinToTime(clsIPG.mIpgTime_lng)
    ' ----------------
    frIBedStat.ZOrder
    frIBedStat.Visible = True
    Mfgrd1.Enabled = False
    VisibleControls False
    ShowDtlData mIbsIpgCode
    Mfgrd3.SetFocus
Else
    Mfgrd1.Enabled = True
    frIBedStat.Visible = False
End If

End Sub

Private Function Data_Verify() As Boolean
Dim mPttRegNo As Long, mIpgVchNo As Long, mIpgPttCode As Long

Data_Verify = False
If FormAddEditMode = cFORM_EDITMODE And Val(mskFormBoundField.Text) < 1 Then
    ErrorBox "Invalid Key Value !!!"
    txtPttName.SetFocus
    GoTo EndSub
End If

Rem patient validation
mIpgPttCode = Val(mskPttCode.Text)
If mIpgPttCode < 1 And FormAddEditMode = cFORM_EDITMODE Then
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
        If FormAddEditMode = cFORM_ADDMODE And mPttRegNo <> mPttRegNo_old And clsHOPT.mIpgPttRegNoAddModeChange_bln = False Then
            AlertBox "Change Prohibited in Add Mode !!!"
            mskPttRegNo.Text = ToMyNumFmt(mPttRegNo_old, mDecimals:=0)
            mskPttRegNo.SetFocus
            GoTo EndSub
            
        ElseIf FormAddEditMode = cFORM_EDITMODE And mPttRegNo <> mPttRegNo_old And clsHOPT.mIpgPttRegNoEditModeChange_bln = False Then
            AlertBox "Change Prohibited in Edit Mode !!!"
            mskPttRegNo.Text = ToMyNumFmt(mPttRegNo_old, mDecimals:=0)
            mskPttRegNo.SetFocus
            GoTo EndSub
            
        ElseIf mPttRegNo = 0 And clsHOPT.mIpgPttRegNoNotZero_bln = True Then
            AlertBox "Prohibited Zero Patient Reg.No. !!!"
            If FormAddEditMode = cFORM_ADDMODE Then
                If clsHOPT.mIpgPttRegNoAutoNumber_bln = True Then
                    mPttRegNo = GetNextSeqno(dbHmsDatabase, "PatMast", "PttRegNo")
                    mskPttRegNo.Text = ToMyNumFmt(mPttRegNo, mDecimals:=0)
                End If
            Else
                mskPttRegNo.Text = ToMyNumFmt(mPttRegNo_old, mDecimals:=0)
            End If
            mskPttRegNo.SetFocus
            GoTo EndSub
            
        ElseIf mPttRegNo <> 0 Then
            If ChkIsDuplicate(dbHmsDatabase, "PatMast", "PttRegNo", mPttRegNo, "PttCode", mIpgPttCode) = True Then
                ErrorBox "Duplicate Patient Reg.No. !!!"
                mskPttRegNo.SetFocus
                ' -----------
                If FormAddEditMode = cFORM_ADDMODE Then
                    If clsHOPT.mIpgPttRegNoAutoNumber_bln = True Then
                        mPttRegNo = GetNextSeqno(dbHmsDatabase, "PatMast", "PttRegNo")
                    End If
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
Rem indoor registration validation
If Val(fcmbVtmName.BoundText) <= 0 Then
    ErrorBox "Invalid Selection !!!"
    txtVtmName(0).SetFocus
    GoTo EndSub
End If
mIpgVchNo = Val(UnMyNumFmt(mskIpgVchNo(0).Text))
If mIpgVchNo > 0 Then
    If mIpgVchNo <> mIpgVchNo_old Or Val(fcmbVtmName.BoundText) <> mIpgVtmCode_old Or Ctod(dtpIpgDate.Text) <> mIpgDate_old Or FormAddEditMode = cFORM_ADDMODE Then
        If ChkIsDuplVTypeNo(dbHmsDatabase, dbAcDatabase, mTableName:="IndrReg", mChkFieldName:="IpgVchNo", mChkFieldValue:=mIpgVchNo, mKeyFieldName:="IpgCode", mKeyFieldValue:=mIpgCode, mVtmFieldName:="IpgVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="IpgCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="IpgDate", mDateFieldValue:=Ctod(dtpIpgDate.Text)) = True Then
            ErrorBox "Duplicate Voucher No. !!!"
            mskIpgVchNo(0).SetFocus
            ' ---------------
            If FormAddEditMode = True Then
                mIpgVchNo = GetNextVTypeNo(dbHmsDatabase, dbAcDatabase, dbComDatabase, mTableName:="IndrReg", mFieldName:="IpgVchNo", mVtmFieldName:="IpgVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="IpgCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="IpgDate", mDateFieldValue:=Ctod(dtpIpgDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormIpgAcsPermFileName)
            Else
                mIpgVchNo = mIpgVchNo_old
            End If
            mskIpgVchNo(0).Text = ToMyNumFmt(mIpgVchNo, mDecimals:=0)
            GoTo EndSub
        End If
    End If
Else
    ErrorBox "Invalid Input !!!"
    mskIpgVchNo(0).SetFocus
    GoTo EndSub
End If
If IsDate(dtpIpgDate.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpIpgDate.SetFocus
    GoTo EndSub
Else
    If IsFinYrDate(Ctod(dtpIpgDate.Text)) = False Then
        ErrorBox "Invalid Input !!!"
        dtpIpgDate.SetFocus
        GoTo EndSub
    End If
End If
If TimeToMin(txtIpgTime_str.Text) > cDAYMINUTES Then
    ErrorBox "Invalid Input !!!"
    txtIpgTime_str.SetFocus
    GoTo EndSub
End If
If Val(fcmbCDctName.BoundText) <= 0 Then
    ErrorBox "Invalid Selection !!!"
    txtCDctName.SetFocus
    GoTo EndSub
End If
'If Val(fcmbRByName.BoundText) <= 0 Then
'    ErrorBox "Invalid Selection !!!"
'    txtRByName.SetFocus
'    GoTo EndSub
'End If
If Val(fcmbFDigName.BoundText) <= 0 Then
    ErrorBox "Invalid Selection !!!"
    txtFDigName.SetFocus
    GoTo EndSub
End If
If Val(fcmbBdmName.BoundText) <= 0 Then
    ErrorBox "Invalid Selection !!!"
    txtBdmName(0).SetFocus
    GoTo EndSub
End If
If Val(UnMyNumFmt(mskIpgAdvAmt.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskIpgAdvAmt.SetFocus
    GoTo EndSub
End If

Data_Verify = True

EndSub:
Exit Function

End Function

Private Function Data_NetwAuth() As Boolean
Dim mIpgVchNo As Long, mPttRegNo As Long, mIpgPttCode As Long
Data_NetwAuth = False

mIpgPttCode = Val(mskPttCode.Text)
mPttRegNo = Val(UnMyNumFmt(mskPttRegNo.Text))
If mPttRegNo <> mPttRegNo_old Or FormAddEditMode = cFORM_ADDMODE Then
    If mPttRegNo <> 0 Then
        If ChkIsDuplicate(dbHmsDatabase, "PatMast", "PttRegNo", mPttRegNo, "PttCode", mIpgPttCode) = True Then
            ErrorBox "Duplicate Patient Reg.No. !!!"
            mskPttRegNo.SetFocus
            ' -------
            If FormAddEditMode = cFORM_ADDMODE Then
                If clsHOPT.mIpgPttRegNoAutoNumber_bln = True Then
                    mPttRegNo = GetNextSeqno(dbHmsDatabase, "PatMast", "PttRegNo")
                End If
            Else
                mPttRegNo = mPttRegNo_old
            End If
            mskPttRegNo.Text = ToMyNumFmt(mPttRegNo, mDecimals:=0)
            Exit Function
        End If
    End If
End If

mIpgVchNo = Val(UnMyNumFmt(mskIpgVchNo(0).Text))
If mIpgVchNo <> mIpgVchNo_old Or Val(fcmbVtmName.BoundText) <> mIpgVtmCode_old Or Ctod(dtpIpgDate.Text) <> mIpgDate_old Or FormAddEditMode = cFORM_ADDMODE Then
    If ChkIsDuplVTypeNo(dbHmsDatabase, dbAcDatabase, mTableName:="IndrReg", mChkFieldName:="IpgVchNo", mChkFieldValue:=mIpgVchNo, mKeyFieldName:="IpgCode", mKeyFieldValue:=mIpgCode, mVtmFieldName:="IpgVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="IpgCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="IpgDate", mDateFieldValue:=Ctod(dtpIpgDate.Text)) = True Then
        ErrorBox "Duplicate Voucher No. !!!"
        mskIpgVchNo(0).SetFocus
        ' ---------------
        If FormAddEditMode = True Then
            mIpgVchNo = GetNextVTypeNo(dbHmsDatabase, dbAcDatabase, dbComDatabase, mTableName:="IndrReg", mFieldName:="IpgVchNo", mVtmFieldName:="IpgVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="IpgCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="IpgDate", mDateFieldValue:=Ctod(dtpIpgDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormIpgAcsPermFileName)
        Else
            mIpgVchNo = mIpgVchNo_old
        End If
        mskIpgVchNo(0).Text = ToMyNumFmt(mIpgVchNo, mDecimals:=0)
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
Dim srow As Integer, mIbsCode As Long, mDeleteit As Boolean, mIbsIpgCode As Long
srow = Mfgrd3.Row
mIbsCode = Val(Mfgrd3.TextMatrix(srow, X3IBSCODE_COL))
mIbsIpgCode = Val(UnMyNumFmt(lblIbsIpgCode.Caption))

If MyDeleteKey(Shift, KeyCode, mCheckCtrlMask:=False) = True And mIbsCode > 0 Then
    If clsIBS.CanDeleteTran(mIbsCode) = True Then
        txtVoid.SetFocus
        If clsIBS.BeginTran(mIbsCode) = True Then
            clsIBS.DeleteTran mIbsCode
            clsIBS.UpdateTran mIbsCode
            clsIBS.EndTran mIbsCode
            
            ShowDtlData mIbsIpgCode
            Mfgrd3.Row = srow
            Mfgrd3.SetFocus
            Call Mfgrd3_RowColChange
        Else
            Mfgrd3.SetFocus
        End If
    Else
        Mfgrd3.SetFocus
    End If
End If

End Sub

Private Sub Mfgrd3_KeyPress(KeyAscii As Integer)
Dim srow As Integer, mLastIbsDischState As Integer

srow = Mfgrd3.Row
mLastIbsDischState = Val(Mfgrd3.TextMatrix(srow - 1, X3IBSDISCHSTATE_COL))
If KeyAscii = vbKeyReturn Then
    dtlAddEditMode = True
    dtlAddMode = IsFlexNewRow(Mfgrd3, srow)
    If (dtlAddMode = True And mLastIbsDischState = cIBS_STATE_OCCUPIED) Or dtlAddMode = False Then
        VisibleControls True, Mfgrd3.Top + Mfgrd3.RowPos(Mfgrd3.Row)
        If dtlAddMode = True Then
            mskIbsSno.Text = ToMyNumFmt(FlexNextSeqno(Mfgrd3, X3IBSSNO_COL), mDecimals:=0)
            txtBdmName(1).Text = "": fcmbBdmName.BoundText = ""
            dtpIbsDate.Text = Mfgrd3.TextMatrix(srow - 1, X3IBSDATE_COL)
            txtIbsTime.Text = Mfgrd3.TextMatrix(srow - 1, X3IBSTIME_COL)
            dtpIbsDischDate.Text = ""
            txtIbsDischTime.Text = ""
            cmbIbsDischState.ListIndex = GetListIndexFromItemData(mCmbObj:=cmbIbsDischState, mTargetItemData:=cIBS_STATE_OCCUPIED)
            txtBdmName(2).Text = "": fcmbNextBdmName.BoundText = ""
            
        Else
            mskIbsSno.Text = Mfgrd3.TextMatrix(srow, X3IBSSNO_COL)
            fcmbBdmName.BoundText = Mfgrd3.TextMatrix(srow, X3IBSBDMCODE_COL): txtBdmName(1).Text = fcmbBdmName.Text
            dtpIbsDate.Text = Mfgrd3.TextMatrix(srow, X3IBSDATE_COL)
            txtIbsTime.Text = Mfgrd3.TextMatrix(srow, X3IBSTIME_COL)
            dtpIbsDischDate.Text = Mfgrd3.TextMatrix(srow, X3IBSDISCHDATE_COL)
            txtIbsDischTime.Text = Mfgrd3.TextMatrix(srow, X3IBSDISCHTIME_COL)
            cmbIbsDischState.ListIndex = GetListIndexFromItemData(mCmbObj:=cmbIbsDischState, mTargetItemData:=Val(Mfgrd3.TextMatrix(srow, X3IBSDISCHSTATE_COL)))
            fcmbNextBdmName.Text = Mfgrd3.TextMatrix(srow, X3NEXTBDMNAME_COL): txtBdmName(2).Text = fcmbNextBdmName.Text
            txtIbsRemark.Text = Mfgrd3.TextMatrix(srow, X3IBSREMARK_COL)
            
        End If
        Call ChkBedEditState
        txtBdmName(1).SetFocus
        Call ValidDtl
        
        mIbsBdmCode_old = Val(fcmbBdmName.BoundText)
        mIbsNextBdmCode_old = Val(fcmbNextBdmName.BoundText)
        mIbsDischState_old = cmbIbsDischState.ItemData(cmbIbsDischState.ListIndex)
    Else
        dtlAddMode = False
        dtlAddEditMode = False
    End If
End If

End Sub

Private Sub ChkBedEditState()
Dim srow As Integer

srow = Mfgrd3.Row
cmbIbsDischState.Locked = Not (dtlAddMode = True Or (srow = Mfgrd3.Rows - 2))      ''' And srow > FlexDetailTopRow(Mfgrd3))

txtBdmName(1).Locked = cmbIbsDischState.Locked Or srow = FlexDetailTopRow(Mfgrd3)
dtpIbsDate.Locked = cmbIbsDischState.Locked Or srow = FlexDetailTopRow(Mfgrd3)
txtIbsTime.Locked = cmbIbsDischState.Locked Or srow = FlexDetailTopRow(Mfgrd3)
dtpIbsDischDate.Locked = cmbIbsDischState.Locked
txtIbsDischTime.Locked = cmbIbsDischState.Locked
txtBdmName(2).Locked = cmbIbsDischState.Locked Or dtlAddMode = True

End Sub

Private Sub Mfgrd3_RowColChange()
Rem nothing
End Sub

Private Sub ShowDtlData(ByVal mIbsIpgCode As Long)
Dim srow As Integer, tRecset As New ADODB.Recordset, mColCnt As Integer

srow = 1
Mfgrd3.Rows = 2

With tRecset
.open "Select * from IBedState where IbsIpgCode=" & CStr(mIbsIpgCode) & " order by IbsCode", dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Do While .EOF = False
        If InList(.fields("IbsRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
            clsBDM.GetData .fields("IbsBdmCode")
            
            Mfgrd3.TextMatrix(srow, X3IBSCODE_COL) = .fields("IbsCode")
            Mfgrd3.TextMatrix(srow, X3IBSSNO_COL) = ToMyNumFmt(.fields("IbsSno"), mDecimals:=0)
            Mfgrd3.TextMatrix(srow, X3BDMNAME_COL) = clsBDM.mName_str
            Mfgrd3.TextMatrix(srow, X3IBSDATE_COL) = Dtoc(.fields("IbsDate"))
            Mfgrd3.TextMatrix(srow, X3IBSTIME_COL) = MinToTime(.fields("IbsTime"))
            Mfgrd3.TextMatrix(srow, X3IBSDISCHDATE_COL) = IIf(.fields("IbsDischDate") <> cUNKNOWNDATE, Dtoc(.fields("IbsDischDate")), "")
            Mfgrd3.TextMatrix(srow, X3IBSDISCHTIME_COL) = IIf(.fields("IbsDischTime") <> 0, MinToTime(.fields("IbsDischTime")), "")
            Mfgrd3.TextMatrix(srow, X3IBSDISCHSTATUS_COL) = GetListTextFromItemData(mCmbObj:=cmbIbsDischState, mTargetItemData:=.fields("IbsDischState"))
            Mfgrd3.TextMatrix(srow, X3NEXTBDMNAME_COL) = ""
            Mfgrd3.TextMatrix(srow, X3IBSREMARK_COL) = .fields("IbsRemark")
            Mfgrd3.TextMatrix(srow, X3IBSBDMCODE_COL) = .fields("IbsBdmCode")
            Mfgrd3.TextMatrix(srow, X3IBSLIBSCODE_COL) = .fields("IbsLIbsCode")
            Mfgrd3.TextMatrix(srow, X3IBSDISCHSTATE_COL) = .fields("IbsDischState")
            Mfgrd3.TextMatrix(srow, X3IBSRECSTATE_COL) = .fields("IbsRecState")
            If .fields("IbsLIbsCode") > 0 Then
                If Val(Mfgrd3.TextMatrix(srow - 1, X3IBSCODE_COL)) = .fields("IbsLIbsCode") Then
                    Mfgrd3.TextMatrix(srow - 1, X3NEXTBDMNAME_COL) = clsBDM.mName_str
                Else
                    ErrorBox Me.Name & "_ShowDtlData_#1596_[Bed Unexpected]"
                End If
            End If
            
            Mfgrd3.Rows = Mfgrd3.Rows + 1
            srow = srow + 1
        Else
            If InList(.fields("IbsRecState"), Array(cREC_CANCELED, cREC_DELETED)) = False Then
                ErrorBox Me.Name & "_ShowDtlData_#1265_[Invalid Record Status]"
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

End Sub

Private Sub VisibleControls(ByVal mShowItem As Boolean, Optional ByVal mRowPos)
Rem Important - dtlAddEditMode & dtlAddMode must be initialised prior to this
If Me.Visible = True Then
    txtVoid.SetFocus
End If
If IsMissing(mRowPos) = False Then
    mskIbsSno.Top = mRowPos
    txtBdmName(1).Top = mRowPos
    dtpIbsDate.Top = mRowPos
    txtIbsTime.Top = mRowPos
    dtpIbsDischDate.Top = mRowPos
    txtIbsDischTime.Top = mRowPos
    cmbIbsDischState.Top = mRowPos
    txtBdmName(2).Top = mRowPos
    txtIbsRemark.Top = mRowPos
    cmdOK.Top = mRowPos + txtIbsRemark.Height
End If

mskIbsSno.Text = 0
txtBdmName(1).Text = "": fcmbBdmName.BoundText = ""
dtpIbsDate.Text = ""
txtIbsTime.Text = ""
dtpIbsDischDate.Text = ""
txtIbsDischTime.Text = ""
cmbIbsDischState.ListIndex = 0
txtBdmName(2).Text = "": fcmbNextBdmName.BoundText = ""
txtIbsRemark.Text = ""

Call ValidDtl

mskIbsSno.Visible = mShowItem
txtBdmName(1).Visible = mShowItem
dtpIbsDate.Visible = mShowItem
txtIbsTime.Visible = mShowItem
dtpIbsDischDate.Visible = mShowItem
txtIbsDischTime.Visible = mShowItem
cmbIbsDischState.Visible = mShowItem
txtBdmName(2).Visible = mShowItem
txtIbsRemark.Visible = mShowItem
cmdOK.Visible = mShowItem

Mfgrd3.Enabled = (mShowItem = False)

End Sub

Private Sub ValidDtl()
Dim mDataOk As Boolean, srow As Integer
Dim mIbsDate As Date, mIbsTime As Long, mIbsDischDate As Date, mIbsDischTime As Long, mIbsDischState As Integer

srow = Mfgrd3.Row
mIbsDate = Ctod(dtpIbsDate.Text)
mIbsTime = TimeToMin(txtIbsTime.Text)
mIbsDischDate = Ctod(dtpIbsDischDate.Text)
mIbsDischTime = TimeToMin(txtIbsDischTime.Text)
mIbsDischState = cmbIbsDischState.ItemData(cmbIbsDischState.ListIndex)

mDataOk = (Val(UnMyNumFmt(mskIbsSno.Text)) > 0 And Val(fcmbBdmName.BoundText) > 0 And IsDate(dtpIbsDate.Text) = True And Between(mIbsTime, 0, cDAYMINUTES) = True And IIf(dtpIbsDischDate.Text = "", True, IsDate(dtpIbsDischDate.Text) = True) And Between(mIbsDischTime, 0, cDAYMINUTES) = True And cmbIbsDischState.ListIndex > -1)
If dtlAddEditMode = True And mDataOk = True Then
    mDataOk = (mIbsDischState <> cIBS_STATE_UNKNOWN)
End If
If dtlAddEditMode = True And mDataOk = True Then
    If srow > FlexDetailTopRow(Mfgrd3) Then
        mDataOk = (mIbsDate >= Ctod(Mfgrd3.TextMatrix(srow - 1, X3IBSDATE_COL)))
    End If
End If
If dtlAddEditMode = True And mDataOk = True Then
    If srow > FlexDetailTopRow(Mfgrd3) Then
        mDataOk = (IIf(mIbsDate = Ctod(Mfgrd3.TextMatrix(srow - 1, X3IBSDATE_COL)), mIbsTime >= TimeToMin(Mfgrd3.TextMatrix(srow - 1, X3IBSTIME_COL)), True))
    End If
End If
If dtlAddEditMode = True And mDataOk = True Then
    If mIbsDischState = cIBS_STATE_SHIFTED Then
        mDataOk = (dtlAddMode = False)        ''' (dtlAddMode = False And srow < Mfgrd3.Rows - 2) earlier situation when shifting was done on new row
    End If
End If
If dtlAddEditMode = True And mDataOk = True Then
    mDataOk = IIf(mIbsDischState = cIBS_STATE_SHIFTED, Val(fcmbNextBdmName.BoundText) > 0, Val(fcmbNextBdmName.BoundText) = 0)
End If
If dtlAddEditMode = True And mDataOk = True Then
    mDataOk = IIf(mIbsDischState = cIBS_STATE_OCCUPIED, dtpIbsDischDate.Text = "" And txtIbsDischTime.Text = "", dtpIbsDischDate.Text <> "" And txtIbsDischTime.Text <> "")
End If
If dtlAddEditMode = True And mDataOk = True Then
    If mIbsDischState <> cIBS_STATE_OCCUPIED Then
        mDataOk = (mIbsDischDate > mIbsDate Or (mIbsDischDate = mIbsDate And mIbsDischTime >= mIbsTime))
    End If
End If

cmdOK.Caption = IIf(mDataOk = True, "&OK", "&Cancel")
cmdOK.BackColor = IIf(mDataOk = True, &H80FF80, &H8080FF)
End Sub

Private Sub mskIpgAdvAmt_GotFocus()
FlashActiveControl mskIpgAdvAmt, True
End Sub

Private Sub mskIpgAdvAmt_LostFocus()
FlashActiveControl mskIpgAdvAmt, False
End Sub

Private Sub mskIpgAdvAmt_Validate(Cancel As Boolean)
mskIpgAdvAmt.Text = ToMyNumFmt(mskIpgAdvAmt.Text)
If Val(UnMyNumFmt(mskIpgAdvAmt.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskIpgAdvAmt.SetFocus
    Cancel = True
End If

End Sub

Private Sub mskIpgVchNo_GotFocus(Index As Integer)
FlashActiveControl mskIpgVchNo(Index), True
End Sub

Private Sub mskIpgVchNo_LostFocus(Index As Integer)
FlashActiveControl mskIpgVchNo(Index), False
End Sub

Private Sub mskIpgVchNo_Validate(Index As Integer, Cancel As Boolean)
Dim mIpgVchNo As Long

mIpgVchNo = Val(UnMyNumFmt(mskIpgVchNo(Index).Text))
If mIpgVchNo < 0 Then
    If Index = 0 Then
        mIpgVchNo = GetNextVTypeNo(dbHmsDatabase, dbAcDatabase, dbComDatabase, mTableName:="IndrReg", mFieldName:="IpgVchNo", mVtmFieldName:="IpgVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="IpgCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="IpgDate", mDateFieldValue:=Ctod(dtpIpgDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormIpgAcsPermFileName)
        mskIpgVchNo(Index).Text = ToMyNumFmt(mIpgVchNo, mDecimals:=0)
    Else
        ErrorBox "Invalid Input !!!"
        mskIpgVchNo(Index).SetFocus
        Cancel = True
    End If
ElseIf mIpgVchNo > 0 Then
    If Index = 0 Then
        If mIpgVchNo <> mIpgVchNo_old Or Val(fcmbVtmName.BoundText) <> mIpgVtmCode_old Or Ctod(dtpIpgDate.Text) <> mIpgDate_old Or FormAddEditMode = cFORM_ADDMODE Then
            If ChkIsDuplVTypeNo(dbHmsDatabase, dbAcDatabase, mTableName:="IndrReg", mChkFieldName:="IpgVchNo", mChkFieldValue:=mIpgVchNo, mKeyFieldName:="IpgCode", mKeyFieldValue:=mIpgCode, mVtmFieldName:="IpgVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="IpgCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="IpgDate", mDateFieldValue:=Ctod(dtpIpgDate.Text)) = True Then
                ErrorBox "Duplicate Voucher No. !!!"
                Cancel = True
                mskIpgVchNo(Index).SetFocus
                ' ----------
                Rem RemoveNetwVchNo dbComDatabase, mVtmCode:=Val(fcmbVtmName.BoundText), mVchNo:=mIpgVchNo, mVchDate:=Ctod(dtpIpgDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mShowFailedMsg:=False
                If FormAddEditMode = cFORM_ADDMODE Then
                    mIpgVchNo = GetNextVTypeNo(dbHmsDatabase, dbAcDatabase, dbComDatabase, mTableName:="IndrReg", mFieldName:="IpgVchNo", mVtmFieldName:="IpgVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="IpgCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="IpgDate", mDateFieldValue:=Ctod(dtpIpgDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormIpgAcsPermFileName)
                Else
                    mIpgVchNo = mIpgVchNo_old
                End If
                mskIpgVchNo(Index).Text = ToMyNumFmt(mIpgVchNo, mDecimals:=0)
            Rem Else
            Rem     GetNextVTypeNo dbHmsDatabase, dbAcDatabase, dbComDatabase, mTableName:="IndrReg", mFieldName:="IpgVchNo", mVtmFieldName:="IpgVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="IpgCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="IpgDate", mDateFieldValue:=Ctod(dtpIpgDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormIpgAcsPermFileName, mDeletedVchNo:=mIpgVchNo
            End If
        End If
        If Cancel = False Then
            mskIpgVchNo(Index).Text = ToMyNumFmt(mIpgVchNo, mDecimals:=0)
        End If
    Else
        If ChkIsExistVTypeNo(dbHmsDatabase, mTableName:="IndrReg", mChkFieldName:="IpgVchNo", mChkFieldValue:=CStr(mIpgVchNo), mVtmFieldName:="IpgVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="IpgCmpCode", mFinYrFieldValue:=sFinYrCmpCode) = False Then
            ErrorBox "Voucher No. does not Exist !!!"
            mskIpgVchNo(Index).SetFocus
            Rem Cancel = True
        End If
    End If
Else
    ErrorBox "Invalid Input !!!"
    mskIpgVchNo(Index).SetFocus
    Cancel = True
End If

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
                    
                    PatAddEditMode = cFORM_EDITMODE
                    mPttCode = Val(fcmbPttRegNo.BoundText)
                    If clsPAT.BeginMast(mPttCode) = True Then
                        mPttCode = clsPAT.ActiveCode
                    Else
                        mPttCode = 0
                    End If
                    mIpgOldIpgCode = GetOldIpgCodeFromPttCode(mPttCode)
                    ShowOldIpgCodeDesc mIpgOldIpgCode
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
        
        PatAddEditMode = cFORM_ADDMODE
        If clsPAT.BeginMast(0) = True Then
            mPttCode = clsPAT.ActiveCode
        Else
            mPttCode = 0
        End If
        mIpgOldIpgCode = 0
        ShowOldIpgCodeDesc mIpgOldIpgCode
        ShowPatData mPttCode
        Call ShowPatDefData
        Call StorePatOldData
    Else
        AlertBox "Prohibited in Edit Mode !!!"
    End If
ElseIf Shift = 0 And KeyCode = vbKeyF6 Then
    Call ShowOldIpdListByPttRegNo
End If

End Sub

Private Sub mskPttRegNo_LostFocus()
FlashActiveControl mskPttRegNo, False
End Sub

Private Sub mskPttRegNo_Validate(Cancel As Boolean)
Dim mPttRegNo As Long, mIpgPttCode As Long

mIpgPttCode = Val(mskPttCode.Text)
mPttRegNo = Val(UnMyNumFmt(mskPttRegNo.Text))
If mPttRegNo < 0 Then
    ErrorBox "Invalid Input !!!"
    Cancel = True
    mskPttRegNo.SetFocus
Else
    If mPttRegNo <> mPttRegNo_old Or FormAddEditMode = cFORM_ADDMODE Then
        If FormAddEditMode = cFORM_ADDMODE And mPttRegNo <> mPttRegNo_old And clsHOPT.mIpgPttRegNoAddModeChange_bln = False Then
            AlertBox "Change Prohibited in Add Mode !!!"
            mskPttRegNo.Text = ToMyNumFmt(mPttRegNo_old, mDecimals:=0)
            Cancel = True
            mskPttRegNo.SetFocus
            
        ElseIf FormAddEditMode = cFORM_EDITMODE And mPttRegNo <> mPttRegNo_old And clsHOPT.mIpgPttRegNoEditModeChange_bln = False Then
            AlertBox "Change Prohibited in Edit Mode !!!"
            mskPttRegNo.Text = ToMyNumFmt(mPttRegNo_old, mDecimals:=0)
            Cancel = True
            mskPttRegNo.SetFocus
            
        ElseIf mPttRegNo = 0 And clsHOPT.mIpgPttRegNoNotZero_bln = True Then
            AlertBox "Prohibited Zero Patient Reg.No. !!!"
            If FormAddEditMode = cFORM_ADDMODE Then
                If clsHOPT.mIpgPttRegNoAutoNumber_bln = True Then
                    mPttRegNo = GetNextSeqno(dbHmsDatabase, "PatMast", "PttRegNo")
                    mskPttRegNo.Text = ToMyNumFmt(mPttRegNo, mDecimals:=0)
                End If
            Else
                mskPttRegNo.Text = ToMyNumFmt(mPttRegNo_old, mDecimals:=0)
            End If
            Cancel = True
            mskPttRegNo.SetFocus
        ElseIf mPttRegNo <> 0 Then
            If ChkIsDuplicate(dbHmsDatabase, "PatMast", "PttRegNo", mPttRegNo, "PttCode", mIpgPttCode) = True Then
                ErrorBox "Duplicate Patient Reg.No. !!!"
                Cancel = True
                mskPttRegNo.SetFocus
                ' -----------
                If FormAddEditMode = cFORM_ADDMODE Then
                    If clsHOPT.mIpgPttRegNoAutoNumber_bln = True Then
                        mPttRegNo = GetNextSeqno(dbHmsDatabase, "PatMast", "PttRegNo")
                    End If
                Else
                    mPttRegNo = mPttRegNo_old
                End If
                mskPttRegNo.Text = ToMyNumFmt(mPttRegNo, mDecimals:=0)
            End If
        End If
    End If
End If

End Sub

Private Sub mskQryPttRegNo_Change()
If fcmbPttRegNo.CallFromText_Change = False Then
    fcmbPttRegNo.CallFromText_Change = True
    If InterActiveChange(mskQryPttRegNo) = True Then
        fcmbPttRegNo.UserText = Array(mskQryPttRegNo.Text, mskQryPttRegNo.SelStart)
        fcmbPttRegNo.Show
        mskQryPttRegNo.Text = fcmbPttRegNo.Text
        mQryPttCode = Val(fcmbPttRegNo.BoundText)
        fcmbPttName.BoundText = CStr(mQryPttCode)
        txtQryPttName.Text = fcmbPttName.Text
        If fcmbPttRegNo.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbPttRegNo.CallFromText_Change = False
End If

End Sub

Private Sub mskQryPttRegNo_GotFocus()
FlashActiveControl mskQryPttRegNo, True
End Sub

Private Sub mskQryPttRegNo_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call mskQryPttRegNo_Change
ElseIf MyAddNewKey(Shift, KeyCode) = True Then
    Rem not required here
End If

End Sub

Private Sub mskQryPttRegNo_LostFocus()
FlashActiveControl mskQryPttRegNo, False
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

Private Sub optMonthwise_GotFocus()
FlashActiveControl optMonthwise, True
End Sub

Private Sub optMonthwise_LostFocus()
FlashActiveControl optMonthwise, False
End Sub

Private Sub optPatientwise_GotFocus()
FlashActiveControl optPatientwise, True
End Sub

Private Sub optPatientwise_LostFocus()
FlashActiveControl optPatientwise, False
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
'
'        clsARA.GetData Val(fcmbAraName.BoundText)
'        fcmbStnName.BoundText = CStr(clsARA.mAraStnCode_lng): txtStnName.Text = fcmbStnName.Text
    End If
End If

End Sub

Private Sub txtBdmName_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    txtBdmName_Change Index
End If

End Sub

Private Sub txtCDctName_Change()
If fcmbCDctName.CallFromText_Change = False Then
    fcmbCDctName.CallFromText_Change = True
    If InterActiveChange(txtCDctName) = True Then
        fcmbCDctName.UserText = Array(txtCDctName.Text, txtCDctName.SelStart)
        fcmbCDctName.Show
        txtCDctName.Text = fcmbCDctName.Text
        If fcmbCDctName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbCDctName.CallFromText_Change = False
End If

End Sub

Private Sub txtCDctName_GotFocus()
FlashActiveControl txtCDctName, True
End Sub

Private Sub txtCDctName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtCDctName_Change
End If

End Sub

Private Sub txtCDctName_LostFocus()
FlashActiveControl txtCDctName, False
End Sub

Private Sub txtCDctName_Validate(Cancel As Boolean)
If Val(fcmbCDctName.BoundText) <= 0 Then
    ErrorBox "Invalid Selection !!!"
    txtCDctName.SetFocus
    Cancel = True
End If

End Sub

Private Sub txtFDigName_Change()
If fcmbFDigName.CallFromText_Change = False Then
    fcmbFDigName.CallFromText_Change = True
    If InterActiveChange(txtFDigName) = True Then
        fcmbFDigName.UserText = Array(txtFDigName.Text, txtFDigName.SelStart)
        fcmbFDigName.Show
        txtFDigName.Text = fcmbFDigName.Text
        If fcmbFDigName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbFDigName.CallFromText_Change = False
End If

End Sub

Private Sub txtFDigName_GotFocus()
FlashActiveControl txtFDigName, True
End Sub

Private Sub txtFDigName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtFDigName_Change
End If

End Sub

Private Sub txtFDigName_LostFocus()
FlashActiveControl txtFDigName, False
End Sub

Private Sub txtFDigName_Validate(Cancel As Boolean)
If Val(fcmbFDigName.BoundText) <= 0 Then
    ErrorBox "Invalid Selection !!!"
    txtFDigName.SetFocus
    Cancel = True
End If

End Sub

Private Sub txtIbsDischTime_GotFocus()
FlashActiveControl txtIbsDischTime, True
End Sub

Private Sub txtIbsDischTime_LostFocus()
FlashActiveControl txtIbsDischTime, False
End Sub

Private Sub txtIbsDischTime_Validate(Cancel As Boolean)
Dim tRecset As New ADODB.Recordset, srow As Integer, mIbsCode As Long, mIbsDischDate As Date, mIbsDischDate_old As Date, mIbsDischTime As Long, mIbsDischTime_old As Long

srow = Mfgrd3.Row
If txtIbsDischTime.Text <> "" Then
    txtIbsDischTime.Text = MinToTime(TimeToMin(txtIbsDischTime.Text))
    If Between(TimeToMin(txtIbsDischTime.Text), 0, cDAYMINUTES) = False Then
        ErrorBox "Invalid Input !!!"
        txtIbsDischTime.SetFocus
        Cancel = True
    ElseIf Ctod(dtpIbsDischDate.Text) = Ctod(dtpIbsDate.Text) And TimeToMin(txtIbsDischTime.Text) < TimeToMin(txtIbsTime.Text) Then
        ErrorBox "Invalid Discharge/Shift Time !!!"
        txtIbsDischTime.SetFocus
        Cancel = True
    End If
    mIbsDischDate = Ctod(dtpIbsDischDate.Text)
    mIbsDischDate_old = Ctod(Mfgrd3.TextMatrix(srow, X3IBSDISCHDATE_COL))
    mIbsDischTime = TimeToMin(txtIbsDischTime.Text)
    mIbsDischTime_old = TimeToMin(Mfgrd3.TextMatrix(srow, X3IBSDISCHTIME_COL))
    mIbsCode = Val(Mfgrd3.TextMatrix(srow, X3IBSCODE_COL))
    If dtlAddMode = False And Cancel = False Then
        If mIbsDischDate <> mIbsDischDate_old Or mIbsDischTime <> mIbsDischTime_old Then
            With tRecset
            .open "Select * from ((IndrBlIbsDtl" _
                & " inner join IBedState on IndrBlIbsDtl.IbbsIbsCode = IBedState.IbsCode)" _
                & " inner join IndrBill on IndrBlIbsDtl.IbbsCode = IndrBill.IblCode and IndrBlIbsDtl.IbbsIblICode = IndrBill.IblICode)" _
                & " left join IndrBlHdr on IndrBill.IblCode = IndrBlHdr.IbhCode" _
                & " where IbbsIpgCode=" & CStr(Val(lblIbsIpgCode.Caption)) & " and IbbsIbsCode=" & CStr(mIbsCode) _
                & " order by IblDate Desc" & "", dbHmsDatabase, adOpenKeyset, adLockReadOnly
            If .RecordCount > 0 Then
                If .fields("IbbsToDate") = mIbsDischDate And .fields("IbbsToTime") > mIbsDischTime Then
                    If IsNull(.fields("IbhCode")) = False Then
                        ErrorBox "Bed Charges Already Charged in Indoor Bill No." & CStr(.fields("IbhVchNo")) & " Dated " & Dtoc(.fields("IbhDate")) & "/" & MinToTime(.fields("IbbsToTime")) & " !!!"
                    Else
                        ErrorBox "Bed Charges Already Charged in Indoor Bill Dated " & Dtoc(.fields("IblDate")) & "/" & MinToTime(.fields("IbbsToTime")) & " Under Process !!!"
                    End If
                    If Mfgrd3.TextMatrix(srow, X3IBSDISCHTIME_COL) = "" Then
                        txtIbsDischTime.Text = ""
                    Else
                        txtIbsDischTime.Text = MinToTime(mIbsDischTime_old)
                    End If
                    txtIbsDischTime.SetFocus
                    Cancel = True
                End If
            End If
            End With
            CloseTable tRecset
        End If
    End If
End If
Call ValidDtl

End Sub

Private Sub txtIbsRemark_GotFocus()
FlashActiveControl txtIbsRemark, True
End Sub

Private Sub txtIbsRemark_LostFocus()
FlashActiveControl txtIbsRemark, False
End Sub

Private Sub txtIbsRemark_Validate(Cancel As Boolean)
Call ValidDtl
End Sub

Private Sub txtIbsTime_GotFocus()
FlashActiveControl txtIbsTime, True
End Sub

Private Sub txtIbsTime_LostFocus()
FlashActiveControl txtIbsTime, False
End Sub

Private Sub txtIbsTime_Validate(Cancel As Boolean)
Dim tRecset As New ADODB.Recordset, srow As Integer, mIbsCode As Long, mIbsTime As Date, mIbsTime_old As Date

srow = Mfgrd3.Row
txtIbsTime.Text = MinToTime(TimeToMin(txtIbsTime.Text))
If TimeToMin(txtIbsTime.Text) > cDAYMINUTES Or TimeToMin(txtIbsTime.Text) < 0 Then
    ErrorBox "Invalid Input !!!"
    txtIbsTime.SetFocus
    Cancel = True
Else
    mIbsTime = TimeToMin(txtIbsTime.Text)
    mIbsTime_old = TimeToMin(Mfgrd3.TextMatrix(srow, X3IBSTIME_COL))
    mIbsCode = Val(Mfgrd3.TextMatrix(srow, X3IBSCODE_COL))
    If srow > FlexDetailTopRow(Mfgrd3) Then
        If Ctod(dtpIbsDate.Text) = Ctod(Mfgrd3.TextMatrix(srow - 1, X3IBSDATE_COL)) And mIbsTime < TimeToMin(Mfgrd3.TextMatrix(srow - 1, X3IBSTIME_COL)) Then
            ErrorBox "Invalid Shifting Time !!!"
            txtIbsTime.SetFocus
            Cancel = True
        End If
    End If
    If dtlAddMode = False And Cancel = False Then
        If mIbsTime <> mIbsTime_old Then
            With tRecset
            .open "Select * from ((IndrBlIbsDtl" _
                & " inner join IBedState on IndrBlIbsDtl.IbbsIbsCode = IBedState.IbsCode)" _
                & " inner join IndrBill on IndrBlIbsDtl.IbbsCode = IndrBill.IblCode and IndrBlIbsDtl.IbbsIblICode = IndrBill.IblICode)" _
                & " left join IndrBlHdr on IndrBill.IblCode = IndrBlHdr.IbhCode" _
                & " where IbbsIpgCode=" & CStr(Val(lblIbsIpgCode.Caption)) & " and IbbsIbsCode=" & CStr(mIbsCode) _
                & " order by IblDate Desc" & "", dbHmsDatabase, adOpenKeyset, adLockReadOnly
            If .RecordCount > 0 Then
                If IsNull(.fields("IbhCode")) = False Then
                    ErrorBox "Bed Charges Already Charged in Indoor Bill No." & CStr(.fields("IbhVchNo")) & " Dated " & Dtoc(.fields("IbhDate")) & " !!!"
                Else
                    ErrorBox "Bed Charges Already Charged in Indoor Bill Dated " & Dtoc(.fields("IblDate")) & " Under Process !!!"
                End If
                txtIbsTime.Text = MinToTime(mIbsTime_old)
                txtIbsTime.SetFocus
                Cancel = True
            End If
            End With
            CloseTable tRecset
        End If
    End If
End If
Call ValidDtl

End Sub

Private Sub txtIpgDischTime_str_GotFocus()
FlashActiveControl txtIpgDischTime_str, True
End Sub

Private Sub txtIpgDischTime_str_LostFocus()
FlashActiveControl txtIpgDischTime_str, False
End Sub

Private Sub txtIpgRemark_GotFocus()
FlashActiveControl txtIpgRemark, True
End Sub

Private Sub txtIpgRemark_LostFocus()
FlashActiveControl txtIpgRemark, False
End Sub

Private Sub txtIpgRemark_Validate(Cancel As Boolean)
txtIpgRemark.Text = ToMyWord(txtIpgRemark.Text)
End Sub

Private Sub txtIpgTime_str_GotFocus()
FlashActiveControl txtIpgTime_str, True
End Sub

Private Sub txtIpgTime_str_LostFocus()
FlashActiveControl txtIpgTime_str, False
End Sub

Private Sub txtIpgTime_str_Validate(Cancel As Boolean)
txtIpgTime_str.Text = MinToTime(TimeToMin(txtIpgTime_str.Text))
If TimeToMin(txtIpgTime_str.Text) > cDAYMINUTES Then
    ErrorBox "Invalid Input !!!"
    txtIpgTime_str.SetFocus
    Cancel = True
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
                    
                    PatAddEditMode = cFORM_EDITMODE
                    mPttCode = Val(fcmbPttName.BoundText)
                    If clsPAT.BeginMast(mPttCode) = True Then
                        mPttCode = clsPAT.ActiveCode
                    Else
                        mPttCode = 0
                    End If
                    mIpgOldIpgCode = GetOldIpgCodeFromPttCode(mPttCode)
                    ShowOldIpgCodeDesc mIpgOldIpgCode
                    ShowPatData mPttCode
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
        
        PatAddEditMode = cFORM_ADDMODE
        If clsPAT.BeginMast(0) = True Then
            mPttCode = clsPAT.ActiveCode
        Else
            mPttCode = 0
        End If
        mIpgOldIpgCode = 0
        ShowOldIpgCodeDesc mIpgOldIpgCode
        ShowPatData mPttCode
        Call ShowPatDefData
    Else
        AlertBox "Prohibited in Edit Mode !!!"
    End If
ElseIf Shift = 0 And KeyCode = vbKeyF6 Then
    Call ShowOldIpdListByPttName
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
Dim mPttRegNo As Long

If CanUserAddOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If clsIPG.BeginTran(0) = False Then
    Exit Sub
ElseIf clsPAT.BeginMast(0) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_ADDMODE
PatAddEditMode = cFORM_ADDMODE

clsIPG.Clear
clsPAT.Clear
mIpgCode = clsIPG.ActiveCode
mPttCode = clsPAT.ActiveCode

ShowPatData mPttCode
ShowIpdData mIpgCode

Rem restoring user editing features
Call ShowPatDefData
Call ShowIpgDefData

Rem old values
Call StorePatOldData
Call StoreIpdOldData

Call ShowEntryMode(True)
txtPttName.SetFocus

End Sub

Private Sub Data_EditEvent()

If CanUserEditOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If clsIPG.BeginTran(datRecset.fields("IpgCode")) = False Then
    Exit Sub
ElseIf clsPAT.BeginMast(datRecset.fields("IpgPttCode")) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_EDITMODE
PatAddEditMode = cFORM_EDITMODE

With datRecset
mIpgCode = .fields("IpgCode")
mPttCode = .fields("IpgPttCode")
clsIPG.GetData mIpgCode
clsPAT.GetData mPttCode
End With

ShowPatData mPttCode
ShowIpdData mIpgCode

Rem old values
Call StorePatOldData
Call StoreIpdOldData

Call ShowEntryMode(True)
txtPttName.SetFocus

End Sub

Private Sub ShowPatData(ByVal mPttCode As Long)

With clsPAT
.GetData mPttCode

mskPttCode.Text = mPttCode
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

Call ShowPatAge
Call ShowPatBal

Rem disallow editing for exising patients, strictly from patient master only
txtPttName.Locked = (mPttCode > 0)
mskPttRegNo.Locked = (mPttCode > 0)
dtpPttRegDate.Locked = (mPttCode > 0)
cmbPttSex.Locked = (mPttCode > 0)
mskPttAgeYr.Locked = (mPttCode > 0)
mskPttAgeMn.Locked = (mPttCode > 0)
mskPttAgeDy.Locked = (mPttCode > 0)
dtpPttAgeAsOnDt.Locked = (mPttCode > 0)
dtpPttDob.Locked = (mPttCode > 0)
txtPcgName.Locked = (mPttCode > 0)
cmbPttRefRela.Locked = (mPttCode > 0)
txtPttRefName.Locked = (mPttCode > 0)
txtPttAddr.Locked = (mPttCode > 0)
txtAraName.Locked = (mPttCode > 0)
txtStnName.Locked = (mPttCode > 0)
txtPttTelNo.Locked = (mPttCode > 0)
txtPttSMSNo.Locked = (mPttCode > 0)
txtPttEmail.Locked = (mPttCode > 0)
chkPttInfAllowed.Enabled = Not (mPttCode > 0)
chkPttDefAllowed.Enabled = Not (mPttCode > 0)
chkPttDiscAllowed.Enabled = Not (mPttCode > 0)
mskPttDiscPer.Locked = (mPttCode > 0)
chkPttShowInList.Enabled = Not (mPttCode > 0)
txtPttRemark.Locked = (mPttCode > 0)
txtAhName.Locked = (mPttCode > 0)

End Sub

Private Sub ShowPatDefData()
Dim mPttRegNo As Long, tRecset As New ADODB.Recordset

If clsHOPT.mIpgPttRegNoAutoNumber_bln = True Then
    mPttRegNo = GetNextSeqno(dbHmsDatabase, "PatMast", "PttRegNo")
    mskPttRegNo.Text = ToMyNumFmt(mPttRegNo, mDecimals:=0)
End If
dtpPttRegDate.Text = Dtoc(DefaultEntryDate)
cmbPttSex.ListIndex = 0
dtpPttAgeAsOnDt.Text = dtpPttRegDate.Text
dtpPttDob.Text = dtpPttRegDate.Text
cmbPttRefRela.ListIndex = 0
chkPttInfAllowed.Value = vbChecked
chkPttDefAllowed.Value = vbChecked
chkPttDiscAllowed.Value = vbChecked
chkPttShowInList.Value = vbChecked

fcmbAraName.BoundText = CStr(clsHOPT.GetIndrRegOptBoundCode("IpgAraCode"))
fcmbStnName.BoundText = CStr(clsHOPT.GetIndrRegOptBoundCode("IpgStnCode"))
fcmbPcgName.BoundText = CStr(clsHOPT.GetIndrRegOptBoundCode("IpgPcgCode"))
fcmbAhName.BoundText = CStr(clsHOPT.GetIndrRegOptBoundCode("IpgPttAhCode"))

If Val(fcmbAraName.BoundText) = 0 Or Val(fcmbStnName.BoundText) = 0 Or Val(fcmbPcgName.BoundText) = 0 Or Val(fcmbAhName.BoundText) = 0 Then
    With tRecset
    .open "Select * from PatMast where PttCode = (Select top 1 IpgPttCode from IndrReg order by IpgCode desc)", dbHmsDatabase, adOpenKeyset, adLockOptimistic
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
Set tRecset = Nothing

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

'mskAhOpBal.Text = ToMyNumFmt(mOpnBal, mUseAbs:=True)
lblAhCurBal.Caption = ToMyAcFmt(mCurBal)
'txtDrCrFlag.Text = SenseDrCrFlag(mOpnBal)

End Sub

Private Sub ShowIpdData(ByVal mIpgCode As Long)

With clsIPG
.GetData mIpgCode

mskFormBoundField.Text = mIpgCode
fcmbVtmName.BoundText = CStr(.mVtmCode_lng): txtVtmName(0).Text = fcmbVtmName.Text
txtIpgPrefix.Text = .mIpgPrefix_str
mskIpgVchNo(0).Text = ToMyNumFmt(.mVchNo_lng, mDecimals:=0)
dtpIpgDate.Text = Dtoc(.mVchDate_dt)
txtIpgTime_str.Text = MinToTime(.mIpgTime_lng)
fcmbCDctName.BoundText = CStr(.mIpgCDctCode_lng): txtCDctName.Text = fcmbCDctName.Text
fcmbRByName.BoundText = CStr(.mIpgRByCode_lng): txtRByName.Text = fcmbRByName.Text
fcmbFDigName.BoundText = CStr(.mIpgFDigCode_lng): txtFDigName.Text = fcmbFDigName.Text
fcmbBdmName.BoundText = CStr(.mIpgBdmCode_lng): txtBdmName(0).Text = fcmbBdmName.Text
mskIpgAdvAmt.Text = ToMyNumFmt(.mIpgAdvAmt_dbl)
txtIpgRemark.Text = .mIpgRemark_str
dtpIpgDischDate.Text = IIf(.mIpgDischDate_dt = cUNKNOWNDATE, "", Dtoc(.mIpgDischDate_dt))
txtIpgDischTime_str.Text = IIf(.mIpgDischTime_lng = 0, "", MinToTime(.mIpgDischTime_lng))
Rem old indoor data
lblOldIpdDesc.Caption = ""
mIpgOldIpgCode = .mIpgOldIpgCode_lng
ShowOldIpgCodeDesc mIpgOldIpgCode
End With

End Sub

Private Sub ShowIpgDefData()
Dim mIpgVchNo As Long, tRecset As New ADODB.Recordset

dtpIpgDate.Text = Dtoc(DefaultEntryDate)
txtIpgTime_str.Text = MinToTime(TimeToMin(DateTime.Time$))

fcmbVtmName.BoundText = CStr(clsHOPT.GetIndrRegOptBoundCode("IpgVtmCode"))
fcmbCDctName.BoundText = CStr(clsHOPT.GetIndrRegOptBoundCode("IpgCDctCode"))
fcmbRByName.BoundText = CStr(clsHOPT.GetIndrRegOptBoundCode("IpgRByCode"))
fcmbFDigName.BoundText = CStr(clsHOPT.GetIndrRegOptBoundCode("IpgFDigCode"))
fcmbBdmName.BoundText = CStr(clsHOPT.GetIndrRegOptBoundCode("IpgBdmCode"))

If Val(fcmbVtmName.BoundText) = 0 Or Val(fcmbCDctName.BoundText) = 0 Or Val(fcmbRByName.BoundText) = 0 Or Val(fcmbFDigName.BoundText) = 0 Or Val(fcmbBdmName.BoundText) = 0 Then
    With tRecset
    .open "Select top 1 * from IndrReg order by IpgCode desc", dbHmsDatabase, adOpenKeyset, adLockOptimistic
    If .EOF = False Then
        If Val(fcmbVtmName.BoundText) = 0 Then
            fcmbVtmName.BoundText = CStr(.fields("IpgVtmCode"))
        End If
        If Val(fcmbCDctName.BoundText) = 0 Then
            fcmbCDctName.BoundText = CStr(.fields("IpgCDctCode"))
        End If
        If Val(fcmbRByName.BoundText) = 0 Then
            fcmbRByName.BoundText = CStr(.fields("IpgRByCode"))
        End If
        If Val(fcmbFDigName.BoundText) = 0 Then
            fcmbFDigName.BoundText = CStr(.fields("IpgFDigCode"))
        End If
        If Val(fcmbBdmName.BoundText) = 0 Then
            fcmbBdmName.BoundText = CStr(.fields("IpgBdmCode"))
        End If
    End If
    End With
    CloseTable tRecset
End If

txtVtmName(0).Text = fcmbVtmName.Text
txtCDctName.Text = fcmbCDctName.Text
txtRByName.Text = fcmbRByName.Text
txtFDigName.Text = fcmbFDigName.Text
txtBdmName(0).Text = fcmbBdmName.Text

mIpgVchNo = GetNextVTypeNo(dbHmsDatabase, dbAcDatabase, dbComDatabase, mTableName:="IndrReg", mFieldName:="IpgVchNo", mVtmFieldName:="IpgVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="IpgCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="IpgDate", mDateFieldValue:=Ctod(dtpIpgDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormIpgAcsPermFileName)
mskIpgVchNo(0).Text = ToMyNumFmt(mIpgVchNo, mDecimals:=0)

clsBDM.GetData Val(fcmbBdmName.BoundText)
Set tRecset = Nothing

End Sub

Private Sub StoreIpdOldData()
mIpgCode_old = mIpgCode
mIpgDate_old = Ctod(dtpIpgDate.Text)
mIpgVtmCode_old = Val(fcmbVtmName.BoundText)
mIpgVchNo_old = Val(UnMyNumFmt(mskIpgVchNo(0).Text))
mIpgBdmCode_old = Val(fcmbBdmName.BoundText)

End Sub

Private Sub Data_SaveEvent()
Dim mIpgIbsCode As Long, mMissingIBedState As Boolean

With clsPAT
If PatAddEditMode = cFORM_ADDMODE Then
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
If PatAddEditMode = cFORM_ADDMODE Then
    .AddNew
    mskPttCode.Text = .mCode_lng
Else
    .Update mPttCode
End If
If .mCode_lng > 0 Then   ' updated successfully
    mPttCode = .mCode_lng
    
    .UpdateMast .mCode_lng
    .EndMast .mCode_lng
    
    With clsIPG
    If FormAddEditMode = cFORM_ADDMODE Then
        .Clear
    Else
        .GetData mIpgCode
    End If
    .mVtmCode_lng = Val(fcmbVtmName.BoundText)
    .mVchNo_lng = Val(UnMyNumFmt(mskIpgVchNo(0).Text))
    .mVchDate_dt = Ctod(dtpIpgDate.Text)
    .mCmpCode_int = sFinYrCmpCode
    .mIpgPrefix_str = txtIpgPrefix.Text
    .mIpgPostfix_str = ""
    .mIpgTime_lng = TimeToMin(txtIpgTime_str.Text)
    .mIpgOldIpgCode_lng = 0
    .mIpgPttCode_lng = mPttCode
    .mIpgCDctCode_lng = Val(fcmbCDctName.BoundText)
    .mIpgRByCode_lng = Val(fcmbRByName.BoundText)
    .mIpgFDigCode_lng = Val(fcmbFDigName.BoundText)
    .mIpgBdmCode_lng = Val(fcmbBdmName.BoundText)
    .mIpgIbsCode_lng = .mIpgIbsCode_lng         ' no change till
    .mIpgAdvAmt_dbl = Val(UnMyNumFmt(mskIpgAdvAmt.Text))
    .mIpgRemark_str = txtIpgRemark.Text
    
    If FormAddEditMode = cFORM_ADDMODE Then
        .AddNew
        mskFormBoundField.Text = .mCode_lng
    Else
        .Update mIpgCode
    End If
    If .mCode_lng > 0 Then   ' updated successfully
        mIpgIbsCode = .mIpgIbsCode_lng
        mIpgCode = .mCode_lng
        
        .UpdateTran .mCode_lng
        .EndTran .mCode_lng
        
        Rem refreshing patient list
        fcmbPttName.Requery
        
        Rem updating user editing carry forward features
        clsHOPT.mIpgAraCodeOld_lng = clsPAT.mPttAraCode_lng
        clsHOPT.mIpgStnCodeOld_lng = clsPAT.mPttStnCode_lng
        clsHOPT.mIpgPcgCodeOld_lng = clsPAT.mPttPcgCode_lng
        clsHOPT.mIpgPttAhCodeOld_lng = clsPAT.mPttAhCode_lng
        clsHOPT.mIpgVtmCodeOld_lng = .mVtmCode_lng
        clsHOPT.mIpgCDctCodeOld_lng = .mIpgCDctCode_lng
        clsHOPT.mIpgRByCodeOld_lng = .mIpgRByCode_lng
        clsHOPT.mIpgFDigCodeOld_lng = .mIpgFDigCode_lng
        clsHOPT.mIpgBdmCodeOld_lng = .mIpgBdmCode_lng
        clsHOPT.UpdateIndrRegOld
        
        Rem updating bed status for indoor patient
        mMissingIBedState = False
        If FormAddEditMode = cFORM_ADDMODE Or mIpgIbsCode = 0 Then
            If FormAddEditMode = cFORM_EDITMODE Then
                mMissingIBedState = True
                ErrorBox Me.Name & "_Data_SaveEvent_#2430_[Missing Indoor Bed Status Entry]"
            End If
        End If
        If FormAddEditMode = cFORM_ADDMODE Or mMissingIBedState = True Then      ' remove or condition after some time
            If clsIBS.BeginTran(0) = False Then
                Call Data_CancelEvent
                ErrorBox "Entry Cancelled !!!"
                Exit Sub
            End If
        Else
            If clsIBS.BeginTran(mIpgIbsCode) = False Then
                Call Data_CancelEvent
                ErrorBox "Entry Cancelled !!!"
                Exit Sub
            End If
        End If
        With clsIBS
        If FormAddEditMode = cFORM_ADDMODE Or mMissingIBedState = True Then
            .Clear
            .mIbsDischState_int = cIBS_STATE_OCCUPIED
        Else
            .GetData mIpgIbsCode
            .mIbsDischState_int = .mIbsDischState_int
        End If
        .mVtmCode_lng = Val(fcmbVtmName.BoundText)
        .mVchNo_lng = Val(UnMyNumFmt(mskIpgVchNo(0).Text))
        .mVchDate_dt = Ctod(dtpIpgDate.Text)
        .mCmpCode_int = sFinYrCmpCode
        
        .mIbsSno_int = 1
        .mIbsPrefix_str = ""
        .mIbsPostfix_str = ""
        .mIbsTime_lng = TimeToMin(txtIpgTime_str.Text)
        .mIbsIpgCode_lng = mIpgCode
        .mIbsBdmCode_lng = Val(fcmbBdmName.BoundText)
        .mIbsDischDate_dt = .mIbsDischDate_dt
        .mIbsDischTime_lng = .mIbsDischTime_lng
        .mIbsPttCode_lng = mPttCode
        .mIbsLIbsCode_lng = .mIbsLIbsCode_lng
        .mIbsRemark_str = .mIbsRemark_str
        
        If FormAddEditMode = cFORM_ADDMODE Or mMissingIBedState = True Then
            .AddNew
        Else
            .Update mIpgIbsCode
        End If
        If .mCode_lng > 0 Then   ' updated successfully
            mIpgIbsCode = .mCode_lng
            
            .UpdateTran .mCode_lng
            .EndTran .mCode_lng
            
            Rem updating IbsCode in Indoor Reg in case of add only
            If FormAddEditMode = cFORM_ADDMODE Or mMissingIBedState = True Then
                dbHmsDatabase.Execute "Update IndrReg set IpgIbsCode=" & CStr(mIpgIbsCode) & " where IpgCode=" & CStr(mIpgCode)
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
Else
    Call Data_CancelEvent
    ErrorBox "Entry Cancelled !!!"
End If
End With


If clsIPG.mCode_lng > 0 Then   ' updated successfully
    
    
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
Dim mDeleteit As Boolean, mRecAbsPos As Long, mPttAhCode As Long, mIpgVchNo As Long, mIpgVtmCode As Long, mIpgDate As Date

If CanUserDeleteOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If (datRecset.EOF Or datRecset.BOF) = True Then
    Exit Sub
End If

mIpgCode = datRecset.fields("IpgCode")
mIpgVtmCode = datRecset.fields("IpgVtmCode")
mIpgVchNo = datRecset.fields("IpgVchNo")
mIpgDate = datRecset.fields("IpgDate")
mPttCode = datRecset.fields("IpgPttCode")
mPttAhCode = datRecset.fields("PttAhCode")
mRecAbsPos = datRecset.AbsolutePosition

If clsIPG.CanDeleteTran(mIpgCode) = True Then
    txtVoid.SetFocus
    If clsIPG.BeginTran(mIpgCode) = True Then
        clsIPG.DeleteTran mIpgCode
        clsIPG.UpdateTran mIpgCode
        clsIPG.EndTran mIpgCode
    
        Rem clsPAT.DeleteMast mPttCode
        Rem clsPAT.UpdateMast mPttCode
        Rem clsPAT.EndMast mPttCode
        
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
clsIPG.CancelTran mIpgCode
clsIPG.EndTran mIpgCode

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

Private Sub SmryList()
Dim gcolcount As Integer, acount As Integer, mLow As Integer, mHigh As Integer, mPos As Integer, srow As Long, mColCount As Integer
Dim aAcntBal As Variant, mBal As Double

If datRecset.State = 1 Then
    CloseTable datRecset
End If
RefreshDatabase dbHmsDatabase
RefreshDatabase dbAcDatabase
RefreshDatabase dbGrpDatabase
RefreshDatabase dbComDatabase
clsListStru.Clear

If optMonthwise.Value = True Or optDatewise.Value = True Or optPatientwise.Value = True Then
    If optMonthwise.Value = True Then
        clsListStru.AddFields mExpr:="IpgYrMonth", mAttrib:=cFAT_SYSTEM
        clsListStru.AddFields mExpr:="IpgMnYear", mTitle:="Month", mShowItem:=True, mAlign:=1, mWidth:=2000
        clsListStru.AddFields mExpr:="IpgCount", mTitle:="Count", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IpgAdvAmt_sum", mTitle:="Charges", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IpgDiscAmt_sum", mTitle:="Discount", mShowItem:=True, mAlign:=7, mWidth:=1500
        
        datRecset.open "Select format(IpgDate,'yyyy/MM') as IpgYrMonth" _
         & ",Count(IpgCode) as IpgCount" _
         & ",Sum(IpgAdvAmt) as IpgAdvAmt_sum" _
         & " from IndrReg" _
         & " where IpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and IpgCode>0" _
         & IIf(mQryPttCode > 0, " and IpgPttCode=" & CStr(mQryPttCode), "") _
         & " group by format(IpgDate,'yyyy/MM')" _
         & " order by format(IpgDate,'yyyy/MM')" _
         , dbHmsDatabase, adOpenKeyset, adLockReadOnly

    ElseIf optDatewise.Value = True Then
        clsListStru.AddFields mExpr:="IpgDateYMD", mAttrib:=cFAT_SYSTEM
        clsListStru.AddFields mExpr:="IpgDate", mTitle:="Date", mShowItem:=True, mAlign:=1, mWidth:=2000
        clsListStru.AddFields mExpr:="IpgCount", mTitle:="Count", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IpgAdvAmt_sum", mTitle:="Charges", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IpgDiscAmt_sum", mTitle:="Discount", mShowItem:=True, mAlign:=7, mWidth:=1500
        
        datRecset.open "Select IpgDate" _
         & ",Count(IpgCode) as IpgCount" _
         & ",Sum(IpgAdvAmt) as IpgAdvAmt_sum" _
         & " from IndrReg" _
         & " where IpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and IpgCode>0" _
         & IIf(mQryPttCode > 0, " and IpgPttCode=" & CStr(mQryPttCode), "") _
         & " group by IpgDate" _
         & " order by IpgDate" _
         , dbHmsDatabase, adOpenKeyset, adLockReadOnly
        
    ElseIf optPatientwise.Value = True Then
        clsListStru.AddFields mExpr:="PttName", mTitle:="Patient Name", mShowItem:=True, mAlign:=1, mWidth:=3000
        clsListStru.AddFields mExpr:="PttRegNo", mTitle:="Reg.No", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="PttRefName", mTitle:="Care of", mShowItem:=True, mAlign:=1, mWidth:=2000
        clsListStru.AddFields mExpr:="IpgCount", mTitle:="Count", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IpgAdvAmt_sum", mTitle:="Charges", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="IpgDiscAmt_sum", mTitle:="Discount", mShowItem:=True, mAlign:=7, mWidth:=1500
        
        datRecset.open "Select PatMast.PttName,IpgPttCode,PatMast.PttRegNo,PatMast.PttRefName" _
         & ",Count(IpgCode) as IpgCount" _
         & ",Sum(IpgAdvAmt) as IpgAdvAmt_sum" _
         & " from IndrReg inner join PatMast on IndrReg.IpgPttCode=PatMast.PttCode" _
         & " where IpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and IpgCode>0" _
         & IIf(mQryPttCode > 0, " and IpgPttCode=" & CStr(mQryPttCode), "") _
         & " group by PatMast.PttName,IpgPttCode,PatMast.PttRegNo,PatMast.PttRefName" _
         & " order by PatMast.PttName,IpgPttCode,PatMast.PttRegNo,PatMast.PttRefName" _
         , dbHmsDatabase, adOpenKeyset, adLockReadOnly
    End If
    
ElseIf optDetailed.Value = True Then
    clsListStru.AddFields mExpr:="tIpgSmryId", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="IpgCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="VtmName", mTitle:="Voucher", mAlign:=1, mWidth:=1500, mShowItem:=True
    clsListStru.AddFields mExpr:="IpgVchNo", mTitle:="Vchr.No", mAlign:=7, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="IpgDate", mTitle:="Date", mAlign:=1, mWidth:=1300, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="PttCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="PttName", mTitle:="Patient Name", mAlign:=1, mWidth:=2500, mShowItem:=True
    clsListStru.AddFields mExpr:="PttRegNo", mTitle:="Reg.No", mAlign:=7, mWidth:=1250, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="IpgAdvAmt", mTitle:="Charges", mAlign:=7, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="IpgDiscAmt", mTitle:="Discount", mAlign:=7, mWidth:=1250, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="PttRefName", mTitle:="Care of", mAlign:=1, mWidth:=2000, mShowItem:=True
    clsListStru.AddFields mExpr:="PttAddr", mTitle:="Address", mAlign:=1, mWidth:=2000, mShowItem:=True
    clsListStru.AddFields mExpr:="PatAraName", mTitle:="Area", mAlign:=1, mWidth:=1500, mShowItem:=True
    clsListStru.AddFields mExpr:="PatStnName", mTitle:="Station", mAlign:=1, mWidth:=1500, mShowItem:=True
    clsListStru.AddFields mExpr:="PatPcgName", mTitle:="Category", mAlign:=1, mWidth:=2000, mShowItem:=True
    
    datRecset.open "Select IndrReg.*,PatMast.*" _
     & ",format(IpgDate,'yyyymmdd')+format(IpgCode,'0000000') as tIpgSmryId" _
     & " from IndrReg inner join PatMast on IndrReg.IpgPttCode=PatMast.PttCode" _
     & " where IpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & IIf(mRemoteAccess = True, " and IpgCode=" & CStr(mIpgCode) & "", "") _
     & " and IpgCode>0" _
     & IIf(mQryPttCode > 0, " and IpgPttCode=" & CStr(mQryPttCode), "") _
     & " order by IpgDate,IpgCode" _
     , dbHmsDatabase, adOpenKeyset, adLockReadOnly
    
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
        If optMonthwise.Value = True Or optDatewise.Value = True Or optPatientwise.Value = True Then
            If optMonthwise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IpgYrMonth")) = .fields("IpgYrMonth")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IpgMnYear")) = MonthName(Val(Right(.fields("IpgYrMonth"), 2))) & "-" & Left(.fields("IpgYrMonth"), 4)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IpgCount")) = ToMyNumFmt(.fields("IpgCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IpgAdvAmt_sum")) = ToMyNumFmt(.fields("IpgAdvAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IpgDiscAmt_sum")) = ToMyNumFmt(0)  ' ToMyNumFmt(.Fields("IpgDiscAmt_sum"))
                
            ElseIf optDatewise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IpgDateYMD")) = Format(.fields("IpgDate"), "yyyymmdd")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IpgDate")) = Dtoc(.fields("IpgDate"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IpgCount")) = ToMyNumFmt(.fields("IpgCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IpgAdvAmt_sum")) = ToMyNumFmt(.fields("IpgAdvAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IpgDiscAmt_sum")) = ToMyNumFmt(0)  ' ToMyNumFmt(.Fields("IpgDiscAmt_sum"))
                
            ElseIf optPatientwise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttName")) = .fields("PttName")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttRegNo")) = ToMyNumFmt(.fields("PttRegNo"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttRefName")) = .fields("PttRefName")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IpgCount")) = ToMyNumFmt(.fields("IpgCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IpgAdvAmt_sum")) = ToMyNumFmt(.fields("IpgAdvAmt_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IpgDiscAmt_sum")) = ToMyNumFmt(0)  ' ToMyNumFmt(.Fields("IpgDiscAmt_sum"))
                
            End If
        
        ElseIf optDetailed.Value = True Then
            clsPCG.GetData .fields("PttPcgCode")
            clsARA.GetData .fields("PttAraCode")
            clsSTN.GetData .fields("PttStnCode")
            clsVTM.GetData .fields("IpgVtmCode")
        
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("tIpgSmryId")) = Format(.fields("IpgDate"), "yyyymmdd") & Format(.fields("IpgCode"), "0000000")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IpgCode")) = .fields("IpgCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("VtmName")) = clsVTM.mName_str
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IpgVchNo")) = .fields("IpgVchNo")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IpgDate")) = Dtoc(.fields("IpgDate"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IpgAdvAmt")) = ToMyNumFmt(.fields("IpgAdvAmt"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IpgDiscAmt")) = ToMyNumFmt(0)  ' ToMyNumFmt(.Fields("IpgDiscAmt"))
            ' ------------------------------------
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttCode")) = .fields("PttCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttName")) = .fields("PttName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttRegNo")) = .fields("PttRegNo")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttRefName")) = .fields("PttRefName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttAddr")) = .fields("PttAddr")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PatAraName")) = clsARA.mName_str
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PatStnName")) = clsSTN.mName_str
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PatPcgName")) = clsPCG.mName_str
        
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
'''    aAhOpBal = clsAH.GetAhOpnBal(datRecset.Fields("PttAhCode"), mDrCrSeperated:=True)
'''    mOpnDrAmtTot = mOpnDrAmtTot + aAhOpBal(0)
'''    mOpnCrAmtTot = mOpnCrAmtTot + aAhOpBal(1)
'''
'''    Rem current balance
'''    aAhCurBal = clsAH.GetAhCurBal(datRecset.Fields("PttAhCode"), sFinYrEndDate, mDrCrSeperated:=True)
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
Dim srow As Integer, mIpgCode As Long

srow = Mfgrd1.Row
If Shift = 0 And KeyCode = vbKeyF12 Then
    fcmbPttRegNo.BoundText = CStr(mQryPttCode)
    fcmbPttName.BoundText = CStr(mQryPttCode)
    mskQryPttRegNo.Text = fcmbPttRegNo.Text
    txtQryPttName.Text = fcmbPttName.Text
    ' ----------------
    frConfigure.ZOrder
    frConfigure.Visible = True
    Mfgrd1.Enabled = False
    dtpFromDate.SetFocus
    
ElseIf Shift = vbCtrlMask And KeyCode = vbKeyB Then
    If Mfgrd1.Row < Mfgrd1.Rows - 1 And optDetailed.Value = True Then
        ShowBedStatus True
    End If
ElseIf Shift = vbCtrlMask And KeyCode = vbKeyT Then
    If Mfgrd1.Row < Mfgrd1.Rows - 1 And optDetailed.Value = True Then
        mIpgCode = Val(Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("IpgCode")))
        If mIpgCode > 0 Then
            ShowSmryList2 mIpgCode:=mIpgCode, mShowItem:=True
            Mfgrd2.SetFocus
        End If
    End If
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
    If optDetailed.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("tIpgSmryId"), mText
    ElseIf optMonthwise.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("IpgYrMonth"), mText
    ElseIf optDatewise.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("IpgDateYMD"), mText
    ElseIf optPatientwise.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("PttName"), mText
    End If
End If
ShowActiveFlexRow Mfgrd1

End Sub

Private Sub txtQryPttName_Change()
If fcmbPttName.CallFromText_Change = False Then
    fcmbPttName.CallFromText_Change = True
    If InterActiveChange(txtQryPttName) = True Then
        fcmbPttName.UserText = Array(txtQryPttName.Text, txtQryPttName.SelStart)
        fcmbPttName.Show
        txtQryPttName.Text = fcmbPttName.Text
        mQryPttCode = Val(fcmbPttName.BoundText)
        fcmbPttRegNo.BoundText = CStr(mQryPttCode)
        mskQryPttRegNo.Text = fcmbPttRegNo.Text
        If fcmbPttName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbPttName.CallFromText_Change = False
End If

End Sub

Private Sub txtQryPttName_GotFocus()
FlashActiveControl txtQryPttName, True
End Sub

Private Sub txtQryPttName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtQryPttName_Change
ElseIf MyAddNewKey(Shift, KeyCode) = True Then
    Rem not required
End If

End Sub

Private Sub txtQryPttName_LostFocus()
FlashActiveControl txtQryPttName, False
End Sub

Private Sub txtRByName_Change()
If fcmbRByName.CallFromText_Change = False Then
    fcmbRByName.CallFromText_Change = True
    If InterActiveChange(txtRByName) = True Then
        fcmbRByName.UserText = Array(txtRByName.Text, txtRByName.SelStart)
        fcmbRByName.Show
        txtRByName.Text = fcmbRByName.Text
        If fcmbRByName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbRByName.CallFromText_Change = False
End If

End Sub

Private Sub txtRByName_GotFocus()
FlashActiveControl txtRByName, True
End Sub

Private Sub txtRByName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtRByName_Change
End If

End Sub

Private Sub txtRByName_LostFocus()
FlashActiveControl txtRByName, False
End Sub

Private Sub txtRByName_Validate(Cancel As Boolean)
'If Val(fcmbRByName.BoundText) <= 0 Then
'    ErrorBox "Invalid Selection !!!"
'    txtRByName.SetFocus
'    Cancel = True
'End If

End Sub

Private Sub txtSearch1Text_GotFocus()
FlashActiveControl txtSearch1Text, True
End Sub

Private Sub txtSearch1Text_LostFocus()
FlashActiveControl txtSearch1Text, False
End Sub

Private Sub txtBdmName_Change(Index As Integer)
If Index = 0 Or Index = 1 Then
    If fcmbBdmName.CallFromText_Change = False Then
        fcmbBdmName.CallFromText_Change = True
        If InterActiveChange(txtBdmName(Index)) = True Then
            fcmbBdmName.UserText = Array(txtBdmName(Index).Text, txtBdmName(Index).SelStart)
            fcmbBdmName.Show
            txtBdmName(Index).Text = fcmbBdmName.Text
            If fcmbBdmName.ListSelected = True Then
                SendKeys "{tab}"
            End If
        End If
        fcmbBdmName.CallFromText_Change = False
    End If
    
ElseIf Index = 2 Then
    If fcmbNextBdmName.CallFromText_Change = False Then
        fcmbNextBdmName.CallFromText_Change = True
        If InterActiveChange(txtBdmName(Index)) = True Then
            fcmbNextBdmName.UserText = Array(txtBdmName(Index).Text, txtBdmName(Index).SelStart)
            fcmbNextBdmName.Show
            txtBdmName(Index).Text = fcmbNextBdmName.Text
            If fcmbNextBdmName.ListSelected = True Then
                SendKeys "{tab}"
            End If
        End If
        fcmbNextBdmName.CallFromText_Change = False
    End If

End If

End Sub

Private Sub txtBdmName_GotFocus(Index As Integer)
FlashActiveControl txtBdmName(Index), True
End Sub

Private Sub txtBdmName_LostFocus(Index As Integer)
FlashActiveControl txtBdmName(Index), False
End Sub

Private Sub txtBdmName_Validate(Index As Integer, Cancel As Boolean)
Dim tRecset As New ADODB.Recordset

If Val(fcmbBdmName.BoundText) <= 0 Then
    If Index = 0 Or Index = 1 Then
        ErrorBox "Invalid Selection !!!"
        txtBdmName(Index).SetFocus
        Cancel = True
    End If
End If
If Index = 0 And Cancel = False Then
    If Val(fcmbBdmName.BoundText) <> mIpgBdmCode_old Then
        clsIPG.GetData mIpgCode
        
        With tRecset
        .open "Select count(*) as MyCount from IBedState where IbsIpgCode=" & CStr(mIpgCode) & " and IbsCode>" & CStr(clsIPG.mIpgIbsCode_lng), dbHmsDatabase, adOpenKeyset, adLockOptimistic
        If .fields("MyCount") > 0 Then
            ErrorBox "Patient Discharged/Shifted !!!"
            fcmbBdmName.BoundText = CStr(mIpgBdmCode_old)
            txtBdmName(Index).Text = fcmbBdmName.Text
        End If
        End With
        CloseTable tRecset
    End If
End If

If Index > 0 Then
    Call ValidDtl
End If

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
    Call ShowOldIpdListByIpdNo
End If

End Sub

Private Sub txtVtmName_LostFocus(Index As Integer)
FlashActiveControl txtVtmName(Index), False
End Sub

Private Sub txtVtmName_Validate(Index As Integer, Cancel As Boolean)
Dim mIpgVchNo As Long

If Val(fcmbVtmName.BoundText) <= 0 Then
    ErrorBox "Invalid Selection !!!"
    txtVtmName(Index).SetFocus
    Cancel = True
Else
    If Index = 0 Then
        If Val(fcmbVtmName.BoundText) <> mIpgVtmCode_old Or Ctod(dtpIpgDate.Text) <> mIpgDate_old Or FormAddEditMode = cFORM_ADDMODE Then
            mIpgVchNo = GetNextVTypeNo(dbHmsDatabase, dbAcDatabase, dbComDatabase, mTableName:="IndrReg", mFieldName:="IpgVchNo", mVtmFieldName:="IpgVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="IpgCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="IpgDate", mDateFieldValue:=Ctod(dtpIpgDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormIpgAcsPermFileName)
            mskIpgVchNo(Index).Text = ToMyNumFmt(mIpgVchNo, mDecimals:=0)
        End If
    End If
End If

End Sub

Private Sub ShowOldIpgCodeDesc(ByVal mOldIpgCode As Long)
Dim tRecset As New ADODB.Recordset

With tRecset
.open "Select * from IndrReg where IpgCode=" & CStr(mOldIpgCode) & " order by IpgDate,IpgVchNo,IpgCode", dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    clsVTM.GetData .fields("IpgVtmCode")
    lblOldIpdDesc.Caption = RTrim(clsVTM.mName_str) & " No.:" & CStr(.fields("IpgVchNo")) & " Dated:" & Dtoc(.fields("IpgDate"))
Else
    lblOldIpdDesc.Caption = "#" & CStr(mOldIpgCode) & "#"
End If
End With
CloseTable tRecset

End Sub

Private Function GetOldIpgCodeFromPttCode(ByVal mPttCode As Long) As Long
Dim tRecset As New ADODB.Recordset

With tRecset
.open "Select top 1 * from IndrReg where IpgPttCode=" & CStr(mPttCode) & " order by IpgDate desc,IpgVchNo desc,IpgCode desc", dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    GetOldIpgCodeFromPttCode = .fields("IpgCode")
Else
    GetOldIpgCodeFromPttCode = 0
End If
End With
CloseTable tRecset

End Function

Private Sub ShowOldIpdListByIpdNo()
Dim tRecset As New ADODB.Recordset, mOldIpgCode As Long, mOldPttCode As Long

If fcmbOldIpdByIpdNo.CallFromText_Change = False Then
    fcmbOldIpdByIpdNo.CallFromText_Change = True
    If InterActiveChange(txtVtmName(0)) = True Then
        fcmbOldIpdByIpdNo.UserText = Array("", 0)
        fcmbOldIpdByIpdNo.Show
        If fcmbOldIpdByIpdNo.ListSelected = True And Val(fcmbOldIpdByIpdNo.BoundText) > 0 Then
            mOldIpgCode = Val(fcmbOldIpdByIpdNo.BoundText)
            tRecset.open "Select * from IndrReg where IpgCode=" & CStr(mOldIpgCode) & " order by IpgDate,IpgVchNo,IpgCode", dbHmsDatabase, adOpenKeyset, adLockOptimistic
            If tRecset.RecordCount > 0 Then
                mOldPttCode = tRecset.fields("IpgPttCode")
            End If
            CloseTable tRecset
            If FormAddEditMode = cFORM_ADDMODE And mOldIpgCode > 0 And mOldPttCode > 0 Then
                clsPAT.EndMast mPttCode
                PatAddEditMode = cFORM_EDITMODE
                mPttCode = mOldPttCode
                If clsPAT.BeginMast(mPttCode) = True Then
                    mPttCode = clsPAT.ActiveCode
                Else
                    mPttCode = 0
                End If
                Rem mIpgOldIpgCode = GetOldIpgCodeFromPttCode(mPttCode)
                mIpgOldIpgCode = mOldIpgCode
                ShowOldIpgCodeDesc mIpgOldIpgCode
                ShowPatData mPttCode
            Else
                If mOldIpgCode > 0 And mOldPttCode > 0 Then
                    AlertBox "Prohibited in Edit Mode !!!"
                End If
            End If
        End If
    End If
    fcmbOldIpdByIpdNo.CallFromText_Change = False
End If
CloseTable tRecset, mCheckOpen:=True

End Sub

Private Sub ShowOldIpdListByPttRegNo()
Dim tRecset As New ADODB.Recordset, mOldIpgCode As Long, mOldPttCode As Long

If fcmbOldIpdByPttRegNo.CallFromText_Change = False Then
    fcmbOldIpdByPttRegNo.CallFromText_Change = True
    If InterActiveChange(mskPttRegNo) = True Then
        fcmbOldIpdByPttRegNo.UserText = Array("", 0)
        fcmbOldIpdByPttRegNo.Show
        If fcmbOldIpdByPttRegNo.ListSelected = True And Val(fcmbOldIpdByPttRegNo.BoundText) > 0 Then
            mOldIpgCode = fcmbOldIpdByPttRegNo.LFieldValue("IpgCode")
            tRecset.open "Select * from IndrReg where IpgCode=" & CStr(mOldIpgCode) & " order by IpgDate,IpgVchNo,IpgCode", dbHmsDatabase, adOpenKeyset, adLockOptimistic
            If tRecset.RecordCount > 0 Then
                mOldPttCode = tRecset.fields("IpgPttCode")
            End If
            CloseTable tRecset
            If FormAddEditMode = cFORM_ADDMODE And mOldIpgCode > 0 And mOldPttCode > 0 Then
                clsPAT.EndMast mPttCode
                PatAddEditMode = cFORM_EDITMODE
                mPttCode = mOldPttCode
                If clsPAT.BeginMast(mPttCode) = True Then
                    mPttCode = clsPAT.ActiveCode
                Else
                    mPttCode = 0
                End If
                Rem mIpgOldIpgCode = GetOldIpgCodeFromPttCode(mPttCode)
                mIpgOldIpgCode = mOldIpgCode
                ShowOldIpgCodeDesc mIpgOldIpgCode
                ShowPatData mPttCode
            Else
                If mOldIpgCode > 0 And mOldPttCode > 0 Then
                    AlertBox "Prohibited in Edit Mode !!!"
                End If
            End If
        End If
    End If
    fcmbOldIpdByPttRegNo.CallFromText_Change = False
End If
CloseTable tRecset, mCheckOpen:=True

End Sub

Private Sub ShowOldIpdListByPttName()
Dim tRecset As New ADODB.Recordset, mOldIpgCode As Long, mOldPttCode As Long

If fcmbOldIpdByPttName.CallFromText_Change = False Then
    fcmbOldIpdByPttName.CallFromText_Change = True
    If InterActiveChange(txtPttName) = True Then
        fcmbOldIpdByPttName.UserText = Array("", 0)
        fcmbOldIpdByPttName.Show
        If fcmbOldIpdByPttName.ListSelected = True And Val(fcmbOldIpdByPttName.BoundText) > 0 Then
            mOldIpgCode = fcmbOldIpdByPttName.LFieldValue("IpgCode")
            tRecset.open "Select * from IndrReg where IpgCode=" & CStr(mOldIpgCode) & " order by IpgDate,IpgVchNo,IpgCode", dbHmsDatabase, adOpenKeyset, adLockOptimistic
            If tRecset.RecordCount > 0 Then
                mOldPttCode = tRecset.fields("IpgPttCode")
            End If
            CloseTable tRecset
            If FormAddEditMode = cFORM_ADDMODE And mOldIpgCode > 0 And mOldPttCode > 0 Then
                clsPAT.EndMast mPttCode
                PatAddEditMode = cFORM_EDITMODE
                mPttCode = mOldPttCode
                If clsPAT.BeginMast(mPttCode) = True Then
                    mPttCode = clsPAT.ActiveCode
                Else
                    mPttCode = 0
                End If
                Rem mIpgOldIpgCode = GetOldIpgCodeFromPttCode(mPttCode)
                mIpgOldIpgCode = mOldIpgCode
                ShowOldIpgCodeDesc mIpgOldIpgCode
                ShowPatData mPttCode
            Else
                If mOldIpgCode > 0 And mOldPttCode > 0 Then
                    AlertBox "Prohibited in Edit Mode !!!"
                End If
            End If
        End If
    End If
    fcmbOldIpdByPttName.CallFromText_Change = False
End If
CloseTable tRecset, mCheckOpen:=True

End Sub

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
Dim mIpgVchNo As Long

If Val(fcmbVtmName.BoundText) < 1 Then
    ErrorBox "Invalid Voucher Type !!!"
    txtVtmName(1).SetFocus
    Exit Sub
End If
If Val(UnMyNumFmt(mskIpgVchNo(1).Text)) < 1 Then
    ErrorBox "Invalid Voucher No. !!!"
    mskIpgVchNo(1).SetFocus
    Exit Sub
Else
    mIpgVchNo = Val(UnMyNumFmt(mskIpgVchNo(1).Text))
    If ChkIsExistVTypeNo(dbHmsDatabase, mTableName:="IndrReg", mChkFieldName:="IpgVchNo", mChkFieldValue:=CStr(mIpgVchNo), mVtmFieldName:="IpgVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="IpgCmpCode", mFinYrFieldValue:=sFinYrCmpCode) = False Then
        ErrorBox "Voucher No. does not Exist !!!"
        mskIpgVchNo(1).SetFocus
        Exit Sub
    End If
End If
If Val(UnMyNumFmt(mskIpgVchNo(2).Text)) < 1 Then
    ErrorBox "Invalid Voucher No. !!!"
    mskIpgVchNo(2).SetFocus
    Exit Sub
Else
    mIpgVchNo = Val(UnMyNumFmt(mskIpgVchNo(2).Text))
    If ChkIsExistVTypeNo(dbHmsDatabase, mTableName:="IndrReg", mChkFieldName:="IpgVchNo", mChkFieldValue:=CStr(mIpgVchNo), mVtmFieldName:="IpgVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="IpgCmpCode", mFinYrFieldValue:=sFinYrCmpCode) = False Then
        ErrorBox "Voucher No. does not Exist !!!"
        mskIpgVchNo(2).SetFocus
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

Private Sub AssignPrintPara()
Dim fhand As Integer, mCRLTitle As String, mCRLFileName As String, mCRLDefault As Boolean, mDefaultCRLIndex As Integer

mDefaultCRLIndex = -1
mskPrintCopies.Text = 1

AddPrinterToCombo cmbPrinterList

AddPrintDestToCombo cmbPrintDest

If Dir(IndrRegCRLFileFullPath) = "" Then
    fhand = FreeFile
    Open IndrRegCRLFileFullPath For Output As #fhand
    Write #fhand, "Indoor Registration", "IndrReg.Rpt", True
    Close #fhand
End If

cmbCRList.Clear
fhand = FreeFile
Open IndrRegCRLFileFullPath For Input As #fhand
Do While EOF(fhand) = False
    Input #fhand, mCRLTitle, mCRLFileName, mCRLDefault
    If Dir(IndrRegCRLFileFullPath(mFileName:=mCRLFileName)) <> "" Then
        cmbCRList.AddItem mCRLTitle & Space(100) & IndrRegCRLFileFullPath(mFileName:=mCRLFileName)
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

Private Sub Data_PrintEvent()
Dim mFromIpgVchNo As Long, mToIpgVchNo As Long, mIpgVtmCode As Long
Dim fCRView As Form

mFromIpgVchNo = Val(UnMyNumFmt(mskIpgVchNo(1).Text))
mToIpgVchNo = Val(UnMyNumFmt(mskIpgVchNo(2).Text))
mIpgVtmCode = Val(fcmbVtmName.BoundText)

frmMain.Cryst.Reset
frmMain.Cryst.ReportFileName = Trim(Right(cmbCRList.List(cmbCRList.ListIndex), 100))
frmMain.Cryst.DiscardSavedData = True
frmMain.Cryst.DataFiles(0) = dbComDatabaseFullPath

frmMain.Cryst.SelectionFormula = "{vewIndrReg.IpgVchNo}>=" & CStr(mFromIpgVchNo) & " and {vewIndrReg.IpgVchNo}<=" & CStr(mToIpgVchNo) & " and {vewIndrReg.IpgVtmCode}=" & CStr(mIpgVtmCode) & " and {vewIndrReg.IpgCmpCode}=" & CStr(sFinYrCmpCode)
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
        fcmbVtmName.BoundText = CStr(datRecset.fields("IpgVtmCode"))
        txtVtmName(1).Text = fcmbVtmName.Text
        mskIpgVchNo(1).Text = datRecset.fields("IpgVchNo")
        mskIpgVchNo(2).Text = datRecset.fields("IpgVchNo")
        ' ----------------
        Call AssignPrintPara
        frPrintCRList.ZOrder
        frPrintCRList.Visible = True
        Mfgrd1.Enabled = False
        cmbPrintDest.SetFocus
    End If
    
ElseIf mCallSource = "SaveEvent" Then
    txtVtmName(1).Text = fcmbVtmName.Text
    mskIpgVchNo(1).Text = CStr(Val(UnMyNumFmt(mskIpgVchNo(0).Text)))
    mskIpgVchNo(2).Text = CStr(Val(UnMyNumFmt(mskIpgVchNo(0).Text)))
    ' ----------------
    Call AssignPrintPara
    frPrintCRList.ZOrder
    frPrintCRList.Visible = True
    Mfgrd1.Enabled = False
    cmbPrintDest.SetFocus

End If


End Sub



Private Sub Mfgrd2_DblClick()
Call cmdFormEnter_Click
End Sub

Private Sub Mfgrd2_GotFocus()
Mfgrd2.Col = FlexLeftVisibleCol(Mfgrd2)
Mfgrd2.LeftCol = FlexLeftVisibleCol(Mfgrd2)
If Mfgrd2.SelectionMode = flexSelectionByRow Then
    Mfgrd2.ColSel = 0: Mfgrd2.ColSel = Mfgrd2.Cols - 1
End If
Call Mfgrd2_RowColChange
'txtSearch1Text.Text = ""

End Sub

Private Sub Mfgrd2_KeyDown(KeyCode As Integer, Shift As Integer)
Dim srow As Integer, mTrnCode As Long, mTrnSysType As Integer

srow = Mfgrd2.Row
mTrnCode = Val(Mfgrd2.TextMatrix(srow, X2TRNCODE_COL))
mTrnSysType = Val(Mfgrd2.TextMatrix(srow, X2TRNSYSTYPE_COL))

If KeyCode = vbKeySpace Then
    If mTrnCode > 0 Then
        mEntryAccessed = True
        mLastRowAccessed = Mfgrd2.Row
        Select Case mTrnSysType
        Case cHMS_VTYPE_INDOOR_REG
            Set frmTrn = New frmIndoorReg
            frmTrn.RemoteAccessCode = mTrnCode
            Load frmTrn
            frmTrn.Show 1
            Me.ZOrder
            
        Case cHMS_VTYPE_INDOOR_RCPT
            Set frmTrn = New frmIndoorReceipt
            frmTrn.RemoteAccessCode = mTrnCode
            Load frmTrn
            frmTrn.Show 1
            Me.ZOrder
            
        Case cHMS_VTYPE_INDOOR_PYMT
            Set frmTrn = New frmIndoorPymtRcpt
            frmTrn.RemoteAccessCode = mTrnCode
            Load frmTrn
            frmTrn.Show 1
            Me.ZOrder
            
        Case cHMS_VTYPE_INDOOR_REFD
            Set frmTrn = New frmIndoorRefdRcpt
            frmTrn.RemoteAccessCode = mTrnCode
            Load frmTrn
            frmTrn.Show 1
            Me.ZOrder
        
        Case cHMS_VTYPE_INDOOR_BILL
            Set frmTrn = New frmIndoorBill
            frmTrn.RemoteAccessCode = mTrnCode
            Load frmTrn
            frmTrn.Show 1
            Me.ZOrder
        
        Case cHMS_VTYPE_INDOOR_BLPYMT
            Set frmTrn = New frmIndoorBlPayment
            frmTrn.RemoteAccessCode = mTrnCode
            Load frmTrn
            frmTrn.Show 1
            Me.ZOrder
        
        Case cHMS_VTYPE_INDOOR_BLREFD
            Set frmTrn = New frmIndoorBlRefund
            frmTrn.RemoteAccessCode = mTrnCode
            Load frmTrn
            frmTrn.Show 1
            Me.ZOrder
        
        Case cHMS_VTYPE_INDOOR_RGPYMT
            Set frmTrn = New frmIndoorRgPayment
            frmTrn.RemoteAccessCode = mTrnCode
            Load frmTrn
            frmTrn.Show 1
            Me.ZOrder
        
        Case cHMS_VTYPE_INDOOR_RGREFD
            Set frmTrn = New frmIndoorRgRefund
            frmTrn.RemoteAccessCode = mTrnCode
            Load frmTrn
            frmTrn.Show 1
            Me.ZOrder
        
        Case Else
            ErrorBox Me.Name & "_Mfgrd2_KeyDown_#4466_[Undefined]"
            mEntryAccessed = False
        End Select
    End If
End If

End Sub

Private Sub Mfgrd2_KeyPress(KeyAscii As Integer)
mLastKeyPressed = KeyAscii

End Sub

Private Sub Mfgrd2_RowColChange()
If datRecset2.RecordCount > 0 Then
    If datRecset2.AbsolutePosition <> Mfgrd2.Row - Mfgrd2.FixedRows + 1 Then
        datRecset2.MoveFirst
        datRecset2.Move Mfgrd2.Row - Mfgrd2.FixedRows, 1     ' Mfgrd2.Row is already less by one
    End If
End If
ShowFlexColCursor txtList2Col, Mfgrd2, datRecset2

End Sub

Private Sub Mfgrd2_Scroll()
ShowFlexColCursor txtList2Col, Mfgrd2, datRecset2
End Sub

Private Sub txtList2Col_DblClick(Index As Integer)
Call Mfgrd2_DblClick
End Sub

Private Sub txtList2Col_GotFocus(Index As Integer)
Mfgrd2.SetFocus
End Sub

Private Sub Chk_EntryAccessed()
Dim mTrnDate As Date, mTrnCode As Long, mTrnVtmCode As Long, mSearchIdStr As String

mTrnDate = frmTrn.EntryDate
mTrnCode = frmTrn.EntryBoundCode
mTrnVtmCode = frmTrn.EntryVtmCode       ''' GetValueFromTableCol(cnn:=dbComDatabase, mTableName:="VTypMast", mColumnName:="VtmSysCode", mFilterCond:="VtmCode = " & CStr(frmTrn.EntryVtmCode), mRtnDefValue:=-1)

If frmTrn.EntrySaved = True Then
    mSearchIdStr = Format(mTrnDate, "yyyymmdd") & Format(mTrnVtmCode, cLONGCODESTRFMT) & Format(mTrnCode, cLONGCODESTRFMT)
    SearchFlex Mfgrd2, X2TRNSMRYID_COL, mSearchIdStr
    
Else
    If mLastRowAccessed < Mfgrd2.Rows - 1 Then
        Mfgrd2.Row = mLastRowAccessed
    Else
        Mfgrd2.Row = Mfgrd2.Rows - 1
    End If
End If

mEntryAccessed = False
mLastRowAccessed = -1
Unload frmTrn
Set frmTrn = Nothing

End Sub

Private Sub ShowSmryList2(ByVal mIpgCode As Long, ByVal mShowItem As Boolean)
If Me.Visible = True Then
    txtVoid.SetFocus
End If
frIpgTranDtl.ZOrder
frIpgTranDtl.Visible = mShowItem: frIpgTranDtl.Enabled = mShowItem
If mShowItem = True Then
    FillSmryList2 mIpgCode
End If

End Sub

Private Sub FillSmryList2(ByVal mIpgCode As Long)
Dim tRecset As New ADODB.Recordset, srow As Integer, mColCnt As Integer, mQryStr As String

With tRecset
.open "Select * from (IndrReg" _
    & " inner join ((PatMast" _
    & " inner join AreaMast on PatMast.PttAraCode = AreaMast.AraCode)" _
    & " inner join StsnMast on PatMast.PttStnCode = StsnMast.StnCode)" _
    & " on IndrReg.IpgPttCode = PatMast.PttCode)" _
    & " inner join ((Select top 1 * from IBedState where IbsIpgCode = " & CStr(mIpgCode) & " order by IbsCode desc) as IBedState" _
    & " inner join ((BedMast" _
    & " inner join FloorMast on BedMast.BdmFlrCode = FloorMast.FlrCode)" _
    & " inner join WardMast on BedMast.BdmWrdCode = WardMast.WrdCode)" _
    & " on IBedState.IbsBdmCode = BedMast.BdmCode)" _
    & " on IndrReg.IpgCode = IBedState.IbsIpgCode" _
    & " Where IpgCode = " & CStr(mIpgCode) _
    , dbComDatabase, adOpenKeyset, adLockOptimistic

lblPttName.Caption = .fields("PttName")
lblPttRegNo.Caption = ToMyNumFmt(.fields("PttRegNo"), mDecimals:=0)
lblPttRefName.Caption = .fields("PttRefName")
lblAraName.Caption = .fields("AraName")
lblStnName.Caption = .fields("StnName")
lblIpgVchNo.Caption = ToMyNumFmt(.fields("IpgVchNo"), mDecimals:=0)
lblIpgDate.Caption = Dtoc(.fields("IpgDate"))
lblBdmName.Caption = .fields("BdmName")
lblFlrName.Caption = .fields("FlrName")
lblWrdName.Caption = .fields("WrdName")
If .fields("IbsDischState") <> cIBS_STATE_OCCUPIED Then
    lblIbsDischDate.Caption = Dtoc(.fields("IbsDischDate"))
    lblIbsDischTime.Caption = MinToTime(.fields("IbsDischTime"))
Else
    lblIbsDischDate.Caption = ""
    lblIbsDischTime.Caption = ""
End If
End With
CloseTable tRecset

srow = 1
Mfgrd2.Rows = 2

If datRecset2.State = 1 Then
    CloseTable datRecset2
End If
RefreshDatabase dbHmsDatabase
RefreshDatabase dbAcDatabase
RefreshDatabase dbGrpDatabase
RefreshDatabase dbComDatabase

mQryStr = "Select *" _
 & ",format(TrnDate,'yyyymmdd')+format(TrnVtmCode,'" & cLONGCODESTRFMT & "')+format(TrnCode,'" & CStr(cLONGCODESTRFMT) & "') as tTrnSmryId"
mQryStr = mQryStr & " from (("
Rem reserved query string producing no records
mQryStr = mQryStr & "Select " _
 & "IpgCode as TrnCode" _
 & ",IpgDate as TrnDate" _
 & ",IpgPttCode as TrnPttCode" _
 & ",IpgVtmCode as TrnVtmCode" _
 & ",IpgVchNo as TrnVchNo" _
 & ",IpgAdvAmt as TrnAmtAftDisc" _
 & ",0 as TrnDiscAmt" _
 & " from IndrReg" _
 & " where IpgCode = -1 and True = False "
Rem indoor advance ---------------------
mQryStr = mQryStr & " UNION ALL "
mQryStr = mQryStr & " Select " _
 & "IpgCode as TrnCode" _
 & ",IpgDate as TrnDate" _
 & ",IpgPttCode as TrnPttCode" _
 & ",IpgVtmCode as TrnVtmCode" _
 & ",IpgVchNo as TrnVchNo" _
 & ",IpgAdvAmt as TrnAmtAftDisc" _
 & ",0 as TrnDiscAmt" _
 & " from IndrReg" _
 & " where IpgCode = " & CStr(mIpgCode)
Rem indoor receipt received amount
mQryStr = mQryStr & " UNION ALL "
mQryStr = mQryStr & " Select " _
 & "IhrCode as TrnCode" _
 & ",IhrDate as TrnDate" _
 & ",IhrPttCode as TrnPttCode" _
 & ",IhrVtmCode as TrnVtmCode" _
 & ",IhrVchNo as TrnVchNo" _
 & ",IhrAmtAftDisc as TrnAmtAftDisc" _
 & ",IhrDiscAmt as TrnDiscAmt" _
 & " from IndrHdr" _
 & " where IhrIpgCode = " & CStr(mIpgCode)
Rem indoor payment
mQryStr = mQryStr & " UNION ALL "
mQryStr = mQryStr & " Select " _
 & "IphCode as TrnCode" _
 & ",IphDate as TrnDate" _
 & ",IphPttCode as TrnPttCode" _
 & ",IphVtmCode as TrnVtmCode" _
 & ",IphVchNo as TrnVchNo" _
 & ",IphDepoAmt as TrnAmtAftDisc" _
 & ",0 as TrnDiscAmt" _
 & " from IndrPymtHdr" _
 & " where IphIpgCode = " & CStr(mIpgCode)
Rem indoor refund
mQryStr = mQryStr & " UNION ALL "
mQryStr = mQryStr & " Select " _
 & "IfhCode as TrnCode" _
 & ",IfhDate as TrnDate" _
 & ",IfhPttCode as TrnPttCode" _
 & ",IfhVtmCode as TrnVtmCode" _
 & ",IfhVchNo as TrnVchNo" _
 & ",IfhRefuAmt * -1 as TrnAmtAftDisc" _
 & ",0 as TrnDiscAmt" _
 & " from IndrRefdHdr" _
 & " where IfhIpgCode = " & CStr(mIpgCode)
Rem indoor bill
mQryStr = mQryStr & " UNION ALL "
mQryStr = mQryStr & " Select " _
 & "IbhCode as TrnCode" _
 & ",IbhDate as TrnDate" _
 & ",IbhPttCode as TrnPttCode" _
 & ",IbhVtmCode as TrnVtmCode" _
 & ",IbhVchNo as TrnVchNo" _
 & ",IbhAmtAftDisc as TrnAmtAftDisc" _
 & ",IbhDiscAmt as TrnDiscAmt" _
 & " from IndrBlHdr" _
 & " where IbhIpgCode = " & CStr(mIpgCode)
Rem indoor bill payment
mQryStr = mQryStr & " UNION ALL "
mQryStr = mQryStr & " Select " _
 & "IbphCode as TrnCode" _
 & ",IbphDate as TrnDate" _
 & ",IbphPttCode as TrnPttCode" _
 & ",IbphVtmCode as TrnVtmCode" _
 & ",IbphVchNo as TrnVchNo" _
 & ",IbphDepoAmt as TrnAmtAftDisc" _
 & ",0 as TrnDiscAmt" _
 & " from IndrBlPymtHdr" _
 & " where IbphIpgCode = " & CStr(mIpgCode)
Rem indoor bill refund
mQryStr = mQryStr & " UNION ALL "
mQryStr = mQryStr & " Select " _
 & "IbfhCode as TrnCode" _
 & ",IbfhDate as TrnDate" _
 & ",IbfhPttCode as TrnPttCode" _
 & ",IbfhVtmCode as TrnVtmCode" _
 & ",IbfhVchNo as TrnVchNo" _
 & ",IbfhRefuAmt * -1 as TrnAmtAftDisc" _
 & ",0 as TrnDiscAmt" _
 & " from IndrBlRefdHdr" _
 & " where IbfhIpgCode = " & CStr(mIpgCode)
Rem indoor on a/c payment
mQryStr = mQryStr & " UNION ALL "
mQryStr = mQryStr & " Select " _
 & "IgtCode as TrnCode" _
 & ",IgtDate as TrnDate" _
 & ",IgtPttCode as TrnPttCode" _
 & ",IgtVtmCode as TrnVtmCode" _
 & ",IgtVchNo as TrnVchNo" _
 & ",IgtDpogAmt as TrnAmtAftDisc" _
 & ",0 as TrnDiscAmt" _
 & " from IndrRgPymt" _
 & " where IgtIpgCode = " & CStr(mIpgCode)
Rem indoor on a/c refund
mQryStr = mQryStr & " UNION ALL "
mQryStr = mQryStr & " Select " _
 & "IgfCode as TrnCode" _
 & ",IgfDate as TrnDate" _
 & ",IgfPttCode as TrnPttCode" _
 & ",IgfVtmCode as TrnVtmCode" _
 & ",IgfVchNo as TrnVchNo" _
 & ",IgfRfugAmt * -1 as TrnAmtAftDisc" _
 & ",0 as TrnDiscAmt" _
 & " from IndrRgRefd" _
 & " where IgfIpgCode = " & CStr(mIpgCode)
Rem ----------------------------------
mQryStr = mQryStr & ") as t1"
mQryStr = mQryStr & " inner join PatMast on t1.TrnPttCode = PatMast.PttCode)" _
    & " inner join VTypMast on t1.TrnVtmCode = VTypMast.VtmCode" _
    & " order by t1.TrnDate,VTypMast.VtmSysCode,t1.TrnVtmCode,t1.TrnCode"
    
With datRecset2
.open mQryStr, dbComDatabase, adOpenKeyset, adLockOptimistic
If .EOF = False Then
    Do While .EOF = False
        Mfgrd2.TextMatrix(srow, X2TRNCODE_COL) = .fields("TrnCode")
        Mfgrd2.TextMatrix(srow, X2TRNSYSTYPE_COL) = .fields("VtmSysCode")
        Mfgrd2.TextMatrix(srow, X2TRNSMRYID_COL) = .fields("tTrnSmryId")
        Mfgrd2.TextMatrix(srow, X2TRNVCHNAME_COL) = .fields("VtmName")
        Mfgrd2.TextMatrix(srow, X2TRNVCHNO_COL) = ToMyNumFmt(.fields("TrnVchNo"), mDecimals:=0)
        Mfgrd2.TextMatrix(srow, X2TRNDATE_COL) = Dtoc(.fields("TrnDate"))
        Mfgrd2.TextMatrix(srow, X2TRNAMTAFTDISC_COL) = ToMyNumFmt(.fields("TrnAmtAftDisc") * IIf(InList(.fields("VtmSysCode"), Array(cHMS_VTYPE_INDOOR_REFD, cHMS_VTYPE_INDOOR_BLREFD, cHMS_VTYPE_INDOOR_RGREFD)) = True, -1, 1))
        
        Mfgrd2.Rows = Mfgrd2.Rows + 1
        srow = srow + 1

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
SetFlexColCursor txtList2Col, Mfgrd2

End Sub


