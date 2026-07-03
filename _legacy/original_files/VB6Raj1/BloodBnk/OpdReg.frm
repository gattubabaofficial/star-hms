VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "Mscomctl.ocx"
Begin VB.Form frmOutdoorReg 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   ClientHeight    =   10515
   ClientLeft      =   60
   ClientTop       =   60
   ClientWidth     =   14520
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
   ScaleHeight     =   10515
   ScaleWidth      =   14520
   ShowInTaskbar   =   0   'False
   Begin VB.ComboBox cmbPatEntryMode 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   315
      ItemData        =   "OpdReg.frx":0000
      Left            =   1560
      List            =   "OpdReg.frx":000D
      Style           =   1  'Simple Combo
      TabIndex        =   50
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
      TabIndex        =   54
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
      TabIndex        =   53
      TabStop         =   0   'False
      Top             =   0
      Width           =   255
   End
   Begin VB.ComboBox cmbFormEntryMode 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   315
      ItemData        =   "OpdReg.frx":0034
      Left            =   0
      List            =   "OpdReg.frx":0041
      Style           =   1  'Simple Combo
      TabIndex        =   49
      TabStop         =   0   'False
      Text            =   "cmbFormEntryMode"
      Top             =   360
      Width           =   1455
   End
   Begin VB.Frame frFormDtl 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Detail"
      ForeColor       =   &H80000008&
      Height          =   9255
      Left            =   120
      TabIndex        =   48
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
         Left            =   2640
         Style           =   2  'Dropdown List
         TabIndex        =   5
         Top             =   1560
         Width           =   1455
      End
      Begin VB.TextBox txtOpgRemark 
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
         Left            =   2640
         MaxLength       =   50
         TabIndex        =   43
         Top             =   8160
         Width           =   7815
      End
      Begin VB.TextBox txtSrvName 
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
         Left            =   360
         MaxLength       =   50
         TabIndex        =   36
         Top             =   7680
         Width           =   3615
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
         Left            =   9240
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
         Left            =   5760
         TabIndex        =   22
         Top             =   4200
         Width           =   2415
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
         Left            =   3120
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
         Left            =   360
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
         Left            =   360
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
         Left            =   4200
         TabIndex        =   1
         Tag             =   "AhCode"
         Text            =   "-1"
         Top             =   360
         Width           =   1455
      End
      Begin VB.TextBox mskOpgAmtAftDisc 
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
         Left            =   11040
         TabIndex        =   42
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   7680
         Width           =   1575
      End
      Begin VB.TextBox mskOpgDiscAmt 
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
         TabIndex        =   41
         TabStop         =   0   'False
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   7680
         Width           =   1335
      End
      Begin VB.TextBox mskOpgDiscPer 
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
         Left            =   8160
         TabIndex        =   40
         Tag             =   "AhCode"
         Text            =   "0.00 %"
         Top             =   7680
         Width           =   1335
      End
      Begin VB.TextBox mskOpgAmtBefDisc 
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
         Left            =   6480
         TabIndex        =   39
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   7680
         Width           =   1575
      End
      Begin VB.TextBox mskOpgRate 
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
         Left            =   5160
         TabIndex        =   38
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   7680
         Width           =   1215
      End
      Begin VB.TextBox mskOpgUnit 
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
         Left            =   4080
         TabIndex        =   37
         Tag             =   "AhCode"
         Text            =   "0"
         Top             =   7680
         Width           =   975
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
         Left            =   2640
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
         Left            =   8040
         MaxLength       =   50
         TabIndex        =   34
         Top             =   6480
         Width           =   4575
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
         Left            =   2640
         MaxLength       =   50
         TabIndex        =   33
         Top             =   6480
         Width           =   3975
      End
      Begin VB.TextBox txtOpgTime_str 
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
         Left            =   11760
         MaxLength       =   50
         TabIndex        =   32
         TabStop         =   0   'False
         Text            =   "00:00"
         Top             =   6120
         Width           =   855
      End
      Begin VB.TextBox dtpOpgDate 
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
         Left            =   9120
         MaxLength       =   50
         TabIndex        =   31
         Text            =   "dd/mm/yyyy"
         Top             =   6120
         Width           =   1575
      End
      Begin VB.TextBox txtOpgPrefix 
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
         Width           =   1095
      End
      Begin VB.TextBox mskOpgVchNo 
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
         Left            =   6600
         TabIndex        =   30
         Tag             =   "AhCode"
         Text            =   "0"
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
         Left            =   2640
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
         Left            =   9120
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
         Left            =   11160
         MaxLength       =   50
         TabIndex        =   10
         TabStop         =   0   'False
         Text            =   "dd/mm/yyyy"
         Top             =   1560
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
         Left            =   7440
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
         Left            =   6840
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
         Left            =   6120
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
         Left            =   2640
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
         Left            =   2640
         MaxLength       =   50
         TabIndex        =   18
         Top             =   3360
         Width           =   4575
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
         Left            =   9120
         MaxLength       =   50
         TabIndex        =   17
         Top             =   3000
         Width           =   3615
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
         Left            =   2640
         MaxLength       =   50
         TabIndex        =   16
         Top             =   3000
         Width           =   4575
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
         Left            =   9120
         MaxLength       =   50
         TabIndex        =   15
         Top             =   2640
         Width           =   3615
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
         Left            =   9120
         MaxLength       =   50
         TabIndex        =   14
         Top             =   2280
         Width           =   3615
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
         Left            =   2640
         MaxLength       =   250
         MultiLine       =   -1  'True
         TabIndex        =   13
         Top             =   2280
         Width           =   5535
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
         Left            =   2640
         Style           =   2  'Dropdown List
         TabIndex        =   11
         Top             =   1920
         Width           =   1455
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
         Left            =   4200
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
         Left            =   2640
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
         Left            =   2640
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
         Left            =   5280
         MaxLength       =   50
         TabIndex        =   3
         TabStop         =   0   'False
         Text            =   "dd/mm/yyyy"
         Top             =   840
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
         Left            =   2640
         MaxLength       =   50
         TabIndex        =   19
         Top             =   3840
         Width           =   5535
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
         Left            =   12600
         Style           =   1  'Graphical
         TabIndex        =   44
         Top             =   8640
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
         Left            =   2640
         MaxLength       =   50
         TabIndex        =   4
         Top             =   1200
         Width           =   5535
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
         Left            =   2640
         TabIndex        =   0
         Tag             =   "AhCode"
         Text            =   "-1"
         Top             =   360
         Width           =   1455
      End
      Begin VB.Label lblOldOpgCodeDesc 
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
         Left            =   2640
         TabIndex        =   117
         Top             =   8520
         Width           =   7815
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
         Index           =   35
         Left            =   360
         TabIndex        =   116
         Top             =   8520
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
         Index           =   34
         Left            =   360
         TabIndex        =   115
         Top             =   1560
         Width           =   2295
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
         Index           =   33
         Left            =   360
         TabIndex        =   114
         Top             =   8160
         Width           =   2295
      End
      Begin VB.Line Line3 
         Index           =   3
         X1              =   360
         X2              =   12600
         Y1              =   8040
         Y2              =   8040
      End
      Begin VB.Label Label2 
         Caption         =   "Service Name"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   32
         Left            =   360
         TabIndex        =   107
         Top             =   7320
         Width           =   3615
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Disc.(%):"
         BeginProperty Font 
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
         Left            =   8280
         TabIndex        =   106
         Top             =   4200
         Width           =   975
      End
      Begin VB.Line Line3 
         Index           =   0
         X1              =   360
         X2              =   12600
         Y1              =   3720
         Y2              =   3720
      End
      Begin VB.Line Line3 
         Index           =   4
         X1              =   600
         X2              =   12840
         Y1              =   7200
         Y2              =   7200
      End
      Begin VB.Label Label2 
         Alignment       =   1  'Right Justify
         Caption         =   "Amount"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   31
         Left            =   11040
         TabIndex        =   105
         Top             =   7320
         Width           =   1575
      End
      Begin VB.Label Label2 
         Alignment       =   1  'Right Justify
         Caption         =   "Disc.Amt."
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   30
         Left            =   9600
         TabIndex        =   104
         Top             =   7320
         Width           =   1335
      End
      Begin VB.Label Label2 
         Alignment       =   1  'Right Justify
         Caption         =   "Disc%"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   29
         Left            =   8160
         TabIndex        =   103
         Top             =   7320
         Width           =   1335
      End
      Begin VB.Label Label2 
         Alignment       =   1  'Right Justify
         Caption         =   "Basic Amt."
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   28
         Left            =   6480
         TabIndex        =   102
         Top             =   7320
         Width           =   1575
      End
      Begin VB.Label Label2 
         Alignment       =   1  'Right Justify
         Caption         =   "Rate"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   27
         Left            =   5160
         TabIndex        =   101
         Top             =   7320
         Width           =   1215
      End
      Begin VB.Label Label2 
         Alignment       =   1  'Right Justify
         Caption         =   "Unit"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   26
         Left            =   4080
         TabIndex        =   100
         Top             =   7320
         Width           =   975
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
         Left            =   360
         TabIndex        =   99
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
         Left            =   7320
         TabIndex        =   98
         Top             =   6480
         Width           =   735
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
         Left            =   360
         TabIndex        =   97
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
         Left            =   11040
         TabIndex        =   96
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
         Left            =   8520
         TabIndex        =   95
         Top             =   6120
         Width           =   495
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Opd No.:"
         BeginProperty Font 
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
         TabIndex        =   94
         Top             =   6120
         Width           =   855
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "OPD Type:"
         BeginProperty Font 
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
         TabIndex        =   93
         Top             =   6120
         Width           =   2295
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
         Left            =   8400
         TabIndex        =   92
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
         TabIndex        =   91
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
         Left            =   4200
         TabIndex        =   90
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
         Left            =   360
         TabIndex        =   89
         Top             =   5040
         Width           =   2295
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
         TabIndex        =   88
         Top             =   3360
         Width           =   2295
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
         Left            =   7560
         TabIndex        =   87
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
         Left            =   360
         TabIndex        =   86
         Top             =   3000
         Width           =   2295
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
         Left            =   8280
         TabIndex        =   85
         Top             =   2640
         Width           =   855
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
         Left            =   8520
         TabIndex        =   84
         Top             =   2280
         Width           =   615
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
         TabIndex        =   83
         Top             =   2280
         Width           =   2295
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
         Left            =   4200
         TabIndex        =   82
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
         Left            =   360
         TabIndex        =   81
         Top             =   840
         Width           =   2295
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
         TabIndex        =   80
         Top             =   5400
         Width           =   2295
      End
      Begin VB.Line Line3 
         Index           =   2
         X1              =   360
         X2              =   12600
         Y1              =   4920
         Y2              =   4920
      End
      Begin VB.Line Line3 
         Index           =   1
         X1              =   360
         X2              =   12600
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
         Left            =   360
         TabIndex        =   78
         Top             =   1920
         Width           =   2295
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
         TabIndex        =   77
         Top             =   3840
         Width           =   2295
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
         Left            =   10680
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
         Left            =   8520
         TabIndex        =   55
         Top             =   5400
         Width           =   1935
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
         TabIndex        =   52
         Top             =   1200
         Width           =   2295
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
         TabIndex        =   51
         Top             =   360
         Width           =   2295
      End
      Begin VB.Shape Shape1 
         BackColor       =   &H00FFD7B7&
         BackStyle       =   1  'Opaque
         Height          =   5535
         Index           =   0
         Left            =   240
         Top             =   240
         Width           =   12735
      End
      Begin VB.Shape Shape1 
         BackColor       =   &H00FFFFC0&
         BackStyle       =   1  'Opaque
         Height          =   3135
         Index           =   1
         Left            =   240
         Top             =   5880
         Width           =   12735
      End
   End
   Begin VB.TextBox txtVoid 
      CausesValidation=   0   'False
      Height          =   375
      Left            =   0
      TabIndex        =   45
      TabStop         =   0   'False
      Text            =   "Void"
      Top             =   9600
      Width           =   375
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   127
      Top             =   10200
      Width           =   14520
      _ExtentX        =   25612
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
            TextSave        =   "08:13"
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
      TabIndex        =   47
      Top             =   720
      Width           =   14055
      Begin VB.Frame frPrintCRList 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   3615
         Left            =   3360
         TabIndex        =   118
         Top             =   1440
         Width           =   5895
         Begin VB.ComboBox cmbPrinterList 
            Height          =   315
            Left            =   2160
            Style           =   2  'Dropdown List
            TabIndex        =   73
            Top             =   1680
            Width           =   3495
         End
         Begin VB.ComboBox cmbPrintDest 
            Height          =   315
            Left            =   2160
            Style           =   2  'Dropdown List
            TabIndex        =   75
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
            TabIndex        =   74
            Text            =   "0"
            Top             =   2040
            Width           =   1455
         End
         Begin VB.ComboBox cmbCRList 
            Height          =   315
            Left            =   2160
            Style           =   2  'Dropdown List
            TabIndex        =   72
            Top             =   1320
            Width           =   3495
         End
         Begin VB.TextBox mskOpgVchNo 
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
            TabIndex        =   71
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
            TabIndex        =   69
            Top             =   600
            Width           =   3495
         End
         Begin VB.TextBox mskOpgVchNo 
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
            TabIndex        =   70
            Tag             =   "AhCode"
            Text            =   "0"
            Top             =   960
            Width           =   1455
         End
         Begin VB.CommandButton cmdPrintCRL 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
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
            Style           =   1  'Graphical
            TabIndex        =   76
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
            TabIndex        =   126
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
            TabIndex        =   125
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
            TabIndex        =   124
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
            TabIndex        =   123
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
            TabIndex        =   122
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
            TabIndex        =   121
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
            TabIndex        =   120
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
            Index           =   36
            Left            =   0
            TabIndex        =   119
            Top             =   0
            Width           =   5895
         End
      End
      Begin VB.Frame frConfigure 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   4935
         Left            =   3000
         TabIndex        =   108
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
            TabIndex        =   61
            Text            =   "0"
            Top             =   1080
            Width           =   1455
         End
         Begin VB.CommandButton cmdConfigure 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
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
            Style           =   1  'Graphical
            TabIndex        =   68
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
            TabIndex        =   63
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
               TabIndex        =   64
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
               TabIndex        =   65
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
               TabIndex        =   66
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
               TabIndex        =   67
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
            Left            =   4440
            TabIndex        =   60
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
            TabIndex        =   59
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
            TabIndex        =   62
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
            TabIndex        =   113
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
            Left            =   3480
            TabIndex        =   112
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
            TabIndex        =   111
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
            TabIndex        =   110
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
            TabIndex        =   109
            Top             =   1440
            Width           =   1575
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
         TabIndex        =   58
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
         TabIndex        =   56
         Top             =   360
         Width           =   4215
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd1 
         Height          =   6735
         Left            =   120
         TabIndex        =   57
         Top             =   720
         Width           =   13695
         _ExtentX        =   24156
         _ExtentY        =   11880
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
         TabIndex        =   79
         Top             =   360
         Width           =   735
      End
   End
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Outdoor Registration"
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
      TabIndex        =   46
      Top             =   0
      Width           =   9015
   End
End
Attribute VB_Name = "frmOutdoorReg"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Dim mFormLoaded As Boolean, mLastKeyPressed As Integer, mMaskKeyPressed As Integer
Dim mFormUIdCode As Long, mFormOpgUIdFileName As String, mFormOpgAcsPermFileName As String, mFormPatUIdFileName As String, mFormPatAcsPermFileName As String
Dim mOpgCode As Long, mPttCode As Long, mQryPttCode As Long, mOpgOldOpgCode As Long
Dim mRemoteAccess As Boolean, mEntrySaved As Boolean, mEntryAborted As Boolean
Dim dbAcDatabase As New ADODB.Connection, dbHmsDatabase As New ADODB.Connection, dbGrpDatabase As New ADODB.Connection, dbComDatabase As New ADODB.Connection
Dim datRecset As New ADODB.Recordset
Dim mOpgCode_old As Long, mPttCode_old As Long, mOpgDate_old As Date, mOpgTime_old As Long, mOpgVtmCode_old As Long, mOpgVchNo_old As Long, mPttName_old As String, mPttRegNo_old As Long, mPttPcgCode_old As Long, mPttAhCode_old As Long, mPttAgeChanged As Boolean, mPttAraCode_old As Long, mOpgCDctCode_old As Long, mOpgRByCode_old As Long, mOpgRToCode_old As Long
Dim mOpgSrvCode_old As Long
Dim clsJRN As clsJournal, clsAH As clsAccountHead, clsOPG As clsHmsSnglTranEntry, clsPAT As clsHmsMasterEntry, clsPCG As clsHmsMasterEntry, clsARA As clsComMastEntry, clsSTN As clsComMastEntry, clsVTM As clsComMastEntry, clsSRV As clsHmsMasterEntry, clsHOPT As clsHmsOpdOptionsEntry
Dim mActiveControl As Object, clsListStru As clsSelectQueryStructure
Dim fcmbAhName As clsComFlexSearch, fcmbAraName As clsComFlexSearch, fcmbStnName As clsComFlexSearch, fcmbVtmName As clsComFlexSearch
Dim fcmbOldOpgByOpgNo As clsHmsFlexSearch, fcmbOldOpgByPttRegNo As clsHmsFlexSearch, fcmbOldOpgByPttName As clsHmsFlexSearch, fcmbPttName As clsHmsFlexSearch, fcmbPttRegNo As clsHmsFlexSearch, fcmbPcgName As clsHmsFlexSearch, fcmbCDctName As clsHmsFlexSearch, fcmbRByName As clsHmsFlexSearch, fcmbFDigName As clsHmsFlexSearch, fcmbSrvName As clsHmsFlexSearch

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
mOpgCode = mAccessCode
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
                    dtpFromDate.Text = Dtoc(MonthStartDate(DateSerial(Val(Left(.fields("OpgYrMonth"), 4)), Val(Right(.fields("OpgYrMonth"), 2)), 1)))
                    dtpToDate.Text = Dtoc(MonthEndDate(DateSerial(Val(Left(.fields("OpgYrMonth"), 4)), Val(Right(.fields("OpgYrMonth"), 2)), 1)))
                    optMonthwise.Value = False
                    optDatewise.Value = True
                ElseIf optDatewise.Value = True Then
                    dtpFromDate.Text = Dtoc(.fields("OpgDate"))
                    dtpToDate.Text = Dtoc(.fields("OpgDate"))
                    optDatewise.Value = False
                    optDetailed.Value = True
                ElseIf optPatientwise.Value = True Then
                    mQryPttCode = .fields("OpgPttCode")
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

Private Sub cmdSaveForm_Click()
txtVoid.SetFocus
Call Data_SaveEvent
Call SmryList

If optDetailed.Value = True Then
    txtSearch1Text_InterActiveChange Format(Ctod(dtpOpgDate.Text), "yyyymmdd") + Format(mOpgCode, cLONGCODESTRFMT)
ElseIf optMonthwise.Value = True Then
    txtSearch1Text_InterActiveChange Format(Ctod(dtpOpgDate.Text), "yyyy") & "/" & Format(Ctod(dtpOpgDate.Text), "mm")
ElseIf optDatewise.Value = True Then
    txtSearch1Text_InterActiveChange Format(Ctod(dtpOpgDate.Text), "yyyymmdd")
ElseIf optPatientwise.Value = True Then
    txtSearch1Text_InterActiveChange txtPttName.Text
End If

Call ShowEntryMode(False)
Mfgrd1.SetFocus

End Sub

Private Sub cmdSaveForm_GotFocus()
Dim mOpgAcsPermNo As Integer, mPatAcsPermNo As Integer, mRetryCount As Integer

txtVoid.SetFocus
cmdSaveForm.Enabled = False
If Data_Verify() = True Then
    If CanAccept() = True Then
        If (GetAccessPerm(mOpgAcsPermNo, mRetryCount, mFormOpgAcsPermFileName) = True And mRetryCount = 0) _
         And (GetAccessPerm(mPatAcsPermNo, mRetryCount, mFormPatAcsPermFileName) = True And mRetryCount = 0) Then
            If Data_NetwAuth() = True Then
                Call cmdSaveForm_Click
                Close #mOpgAcsPermNo
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
                Close #mOpgAcsPermNo
                Close #mPatAcsPermNo
            End If
        Else
            Close #mOpgAcsPermNo
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

Private Sub dtpOpgDate_GotFocus()
FlashActiveControl dtpOpgDate, True
End Sub

Private Sub dtpOpgDate_LostFocus()
FlashActiveControl dtpOpgDate, False
End Sub

Private Sub dtpOpgDate_Validate(Cancel As Boolean)
dtpOpgDate.Text = ToMyDate(dtpOpgDate.Text)
If IsFinYrDate(Ctod(dtpOpgDate.Text)) = False Then
    ErrorBox "Invalid Input !!!"
    dtpOpgDate.SetFocus
    Cancel = True
Else
    Call ChkServRate
    Call CalcOpgChg
End If

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
If mFormLoaded = False Then
    If mRemoteAccess = True Then
        MoveRecToFirst datRecset
        ShowRecActiveFlexRow datRecset, Mfgrd1
        Mfgrd1.SetFocus
        If mOpgCode = 0 Then
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

mFormOpgUIdFileName = "OutdReg.Uid"
mFormOpgAcsPermFileName = "OutdReg.Acp"
mFormUIdCode = GetUIdCode(mProcess:=Me.Name, mUIdFileName:=mFormOpgUIdFileName, mAcsPermFileName:=mFormOpgAcsPermFileName)
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
txtOpgPrefix.Enabled = False
mskOpgDiscPer.Tag = False
mskOpgDiscAmt.Tag = False

ChkCustomForm Me, CfsFileFullPath("OutdReg.Cfs")

OpenAcDataSource dbAcDatabase
OpenHmsDataSource dbHmsDatabase
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

Set clsListStru = New clsSelectQueryStructure

Set clsHOPT = New clsHmsOpdOptionsEntry
clsHOPT.blnOutdRegOptMast = True
clsHOPT.Init
clsHOPT.GetOutdRegOptData

Set clsAH = New clsAccountHead
Set clsAH.dbAcDatabase = dbAcDatabase
Set clsAH.dbGrpDatabase = dbGrpDatabase

Set clsOPG = New clsHmsSnglTranEntry
Set clsOPG.dbAcDatabase = dbAcDatabase
Set clsOPG.dbHmsDatabase = dbHmsDatabase
clsOPG.blnOutdRegTran = True
clsOPG.Init

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

Set clsSRV = New clsHmsMasterEntry
Set clsSRV.dbHmsDatabase = dbHmsDatabase
clsSRV.blnServMast = True
clsSRV.Init

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
fcmbVtmName.mListSqlExpr = "Select * from VTypMast where VtmSysCode=" & CStr(cHMS_VTYPE_OUTDOOR_REG) & " order by VtmName"
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

Set fcmbSrvName = New clsHmsFlexSearch
Set fcmbSrvName.dbHmsDatabase = dbHmsDatabase
fcmbSrvName.blnServMastList = True
fcmbSrvName.mListSqlExpr = "Select * from ServMast where SrvMultiDctIncl = True and SrvShowInList = True order by SrvName"
fcmbSrvName.Init

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

Set fcmbOldOpgByOpgNo = New clsHmsFlexSearch
Set fcmbOldOpgByOpgNo.dbHmsDatabase = dbHmsDatabase
Set fcmbOldOpgByOpgNo.dbComDatabase = dbComDatabase
fcmbOldOpgByOpgNo.blnOldOpgListByOpgNo = True
fcmbOldOpgByOpgNo.Init

Set fcmbOldOpgByPttRegNo = New clsHmsFlexSearch
Set fcmbOldOpgByPttRegNo.dbHmsDatabase = dbHmsDatabase
Set fcmbOldOpgByPttRegNo.dbComDatabase = dbComDatabase
fcmbOldOpgByPttRegNo.blnOldOpgListByPttRegNo = True
fcmbOldOpgByPttRegNo.Init

Set fcmbOldOpgByPttName = New clsHmsFlexSearch
Set fcmbOldOpgByPttName.dbHmsDatabase = dbHmsDatabase
Set fcmbOldOpgByPttName.dbComDatabase = dbComDatabase
fcmbOldOpgByPttName.blnOldOpgListByPttName = True
fcmbOldOpgByPttName.Init

Call RestoreDefaultSmryPara
If mRemoteAccess = True Then
    optDetailed.Value = True
    AddSmryParaLayer mClear:=True
End If

If mRemoteAccess = True Then
    datRecset.open "Select * from OutdReg left join PatMast on OutdReg.OpgPttCode=PatMast.PttCode where OpgCode=" & CStr(mOpgCode) & " order by OpgDate,OpgTime", dbHmsDatabase, adOpenKeyset, adLockOptimistic
Else
    datRecset.open "Select * from OutdReg left join PatMast on OutdReg.OpgPttCode=PatMast.PttCode order by OpgDate,OpgTime", dbHmsDatabase, adOpenKeyset, adLockOptimistic
End If
Mfgrd1.FixedCols = 0
Call SmryList

Call ShowEntryMode(False)

ShowStatusBarText StatusBar1

End Sub

Private Sub mskOpgDiscAmt_Change()
If InterActiveChange(mskOpgDiscAmt) = True Then
    mskOpgDiscAmt.Tag = True
    mskOpgDiscPer.Tag = False
End If

End Sub

Private Sub mskOpgDiscPer_Change()
If InterActiveChange(mskOpgDiscPer) = True Then
    mskOpgDiscPer.Tag = True
    mskOpgDiscAmt.Tag = False
End If

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
Set clsOPG = Nothing
Set clsPAT = Nothing
Set clsPCG = Nothing
Set clsARA = Nothing
Set clsSTN = Nothing
Set clsVTM = Nothing
Set clsSRV = Nothing
Set fcmbOldOpgByOpgNo = Nothing
Set fcmbOldOpgByPttRegNo = Nothing
Set fcmbOldOpgByPttName = Nothing
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
Set fcmbSrvName = Nothing
Set clsListStru = Nothing

CloseTable datRecset
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
cmdSaveForm.Enabled = EntryMode
If EntryMode = False Then
    FormAddEditMode = cFORM_SMRYMODE
    PatAddEditMode = cFORM_SMRYMODE
End If

End Sub

Private Function Data_Verify() As Boolean
Dim mPttRegNo As Long, mOpgVchNo As Long, mOpgPttCode As Long

Data_Verify = False
If FormAddEditMode = cFORM_EDITMODE And Val(mskFormBoundField.Text) < 1 Then
    ErrorBox "Invalid Key Value !!!"
    txtPttName.SetFocus
    GoTo EndSub
End If

Rem patient validation
mOpgPttCode = Val(mskPttCode.Text)
If mOpgPttCode < 1 And FormAddEditMode = cFORM_EDITMODE Then
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
        If FormAddEditMode = cFORM_ADDMODE And mPttRegNo <> mPttRegNo_old And clsHOPT.mOpgPttRegNoAddModeChange_bln = False Then
            AlertBox "Change Prohibited in Add Mode !!!"
            mskPttRegNo.Text = ToMyNumFmt(mPttRegNo_old, mDecimals:=0)
            mskPttRegNo.SetFocus
            GoTo EndSub
            
        ElseIf FormAddEditMode = cFORM_EDITMODE And mPttRegNo <> mPttRegNo_old And clsHOPT.mOpgPttRegNoEditModeChange_bln = False Then
            AlertBox "Change Prohibited in Edit Mode !!!"
            mskPttRegNo.Text = ToMyNumFmt(mPttRegNo_old, mDecimals:=0)
            mskPttRegNo.SetFocus
            GoTo EndSub
            
        ElseIf mPttRegNo = 0 And clsHOPT.mOpgPttRegNoNotZero_bln = True Then
            AlertBox "Prohibited Zero Patient Reg.No. !!!"
            If FormAddEditMode = cFORM_ADDMODE Then
                If clsHOPT.mOpgPttRegNoAutoNumber_bln = True Then
                    mPttRegNo = GetNextSeqno(dbHmsDatabase, "PatMast", "PttRegNo")
                    mskPttRegNo.Text = ToMyNumFmt(mPttRegNo, mDecimals:=0)
                End If
            Else
                mskPttRegNo.Text = ToMyNumFmt(mPttRegNo_old, mDecimals:=0)
            End If
            mskPttRegNo.SetFocus
            GoTo EndSub
            
        ElseIf mPttRegNo <> 0 Then
            If ChkIsDuplicate(dbHmsDatabase, "PatMast", "PttRegNo", mPttRegNo, "PttCode", mOpgPttCode) = True Then
                ErrorBox "Duplicate Patient Reg.No. !!!"
                mskPttRegNo.SetFocus
                ' -----------
                If FormAddEditMode = cFORM_ADDMODE Then
                    If clsHOPT.mOpgPttRegNoAutoNumber_bln = True Then
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
Rem outdoor registration validation
If Val(fcmbVtmName.BoundText) <= 0 Then
    ErrorBox "Invalid Selection !!!"
    txtVtmName(0).SetFocus
    GoTo EndSub
End If
mOpgVchNo = Val(UnMyNumFmt(mskOpgVchNo(0).Text))
If mOpgVchNo > 0 Then
    If mOpgVchNo <> mOpgVchNo_old Or Val(fcmbVtmName.BoundText) <> mOpgVtmCode_old Or Ctod(dtpOpgDate.Text) <> mOpgDate_old Or FormAddEditMode = cFORM_ADDMODE Then
        If ChkIsDuplVTypeNo(dbHmsDatabase, dbAcDatabase, mTableName:="OutdReg", mChkFieldName:="OpgVchNo", mChkFieldValue:=mOpgVchNo, mKeyFieldName:="OpgCode", mKeyFieldValue:=mOpgCode, mVtmFieldName:="OpgVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="OpgCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="OpgDate", mDateFieldValue:=Ctod(dtpOpgDate.Text)) = True Then
            ErrorBox "Duplicate Voucher No. !!!"
            mskOpgVchNo(0).SetFocus
            ' ---------------
            If FormAddEditMode = True Then
                mOpgVchNo = GetNextVTypeNo(dbHmsDatabase, dbAcDatabase, dbComDatabase, mTableName:="OutdReg", mFieldName:="OpgVchNo", mVtmFieldName:="OpgVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="OpgCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="OpgDate", mDateFieldValue:=Ctod(dtpOpgDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormOpgAcsPermFileName)
            Else
                mOpgVchNo = mOpgVchNo_old
            End If
            mskOpgVchNo(0).Text = ToMyNumFmt(mOpgVchNo, mDecimals:=0)
            GoTo EndSub
        End If
    End If
Else
    ErrorBox "Invalid Input !!!"
    mskOpgVchNo(0).SetFocus
    GoTo EndSub
End If
If IsDate(dtpOpgDate.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpOpgDate.SetFocus
    GoTo EndSub
Else
    If IsFinYrDate(Ctod(dtpOpgDate.Text)) = False Then
        ErrorBox "Invalid Input !!!"
        dtpOpgDate.SetFocus
        GoTo EndSub
    End If
End If
If TimeToMin(txtOpgTime_str.Text) > cDAYMINUTES Then
    ErrorBox "Invalid Input !!!"
    txtOpgTime_str.SetFocus
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
If Val(fcmbSrvName.BoundText) <= 0 Then
    ErrorBox "Invalid Selection !!!"
    txtSrvName.SetFocus
    GoTo EndSub
End If
If Val(UnMyNumFmt(mskOpgUnit.Text)) <= 0 Then
    ErrorBox "Invalid Input !!!"
    mskOpgUnit.SetFocus
    GoTo EndSub
End If
If Val(UnMyNumFmt(mskOpgRate.Text)) <= 0 Then
    ErrorBox "Invalid Input !!!"
    mskOpgRate.SetFocus
    GoTo EndSub
End If
If Val(UnMyNumFmt(mskOpgAmtBefDisc.Text)) <= 0 Then
    ErrorBox "Invalid Input !!!"
    mskOpgAmtBefDisc.SetFocus
    GoTo EndSub
End If
If Val(UnMyPerFmt(mskOpgDiscPer.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskOpgDiscPer.SetFocus
    GoTo EndSub
End If
If Val(UnMyNumFmt(mskOpgDiscAmt.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskOpgDiscAmt.SetFocus
    GoTo EndSub
End If
If Val(UnMyNumFmt(mskOpgAmtAftDisc.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskOpgAmtAftDisc.SetFocus
    GoTo EndSub
End If

Data_Verify = True

EndSub:
Exit Function

End Function

Private Function Data_NetwAuth() As Boolean
Dim mOpgVchNo As Long, mPttRegNo As Long, mOpgPttCode As Long
Data_NetwAuth = False

mOpgPttCode = Val(mskPttCode.Text)
mPttRegNo = Val(UnMyNumFmt(mskPttRegNo.Text))
If mPttRegNo <> mPttRegNo_old Or FormAddEditMode = cFORM_ADDMODE Then
    If mPttRegNo <> 0 Then
        If ChkIsDuplicate(dbHmsDatabase, "PatMast", "PttRegNo", mPttRegNo, "PttCode", mOpgPttCode) = True Then
            ErrorBox "Duplicate Patient Reg.No. !!!"
            mskPttRegNo.SetFocus
            ' -------
            If FormAddEditMode = cFORM_ADDMODE Then
                If clsHOPT.mOpgPttRegNoAutoNumber_bln = True Then
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

mOpgVchNo = Val(UnMyNumFmt(mskOpgVchNo(0).Text))
If mOpgVchNo <> mOpgVchNo_old Or Val(fcmbVtmName.BoundText) <> mOpgVtmCode_old Or Ctod(dtpOpgDate.Text) <> mOpgDate_old Or FormAddEditMode = cFORM_ADDMODE Then
    If ChkIsDuplVTypeNo(dbHmsDatabase, dbAcDatabase, mTableName:="OutdReg", mChkFieldName:="OpgVchNo", mChkFieldValue:=mOpgVchNo, mKeyFieldName:="OpgCode", mKeyFieldValue:=mOpgCode, mVtmFieldName:="OpgVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="OpgCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="OpgDate", mDateFieldValue:=Ctod(dtpOpgDate.Text)) = True Then
        ErrorBox "Duplicate Voucher No. !!!"
        mskOpgVchNo(0).SetFocus
        ' ---------------
        If FormAddEditMode = True Then
            mOpgVchNo = GetNextVTypeNo(dbHmsDatabase, dbAcDatabase, dbComDatabase, mTableName:="OutdReg", mFieldName:="OpgVchNo", mVtmFieldName:="OpgVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="OpgCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="OpgDate", mDateFieldValue:=Ctod(dtpOpgDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormOpgAcsPermFileName)
        Else
            mOpgVchNo = mOpgVchNo_old
        End If
        mskOpgVchNo(0).Text = ToMyNumFmt(mOpgVchNo, mDecimals:=0)
        Exit Function
    End If
End If

Data_NetwAuth = True

End Function

Private Sub mskOpgAmtAftDisc_GotFocus()
FlashActiveControl mskOpgAmtAftDisc, True
End Sub

Private Sub mskOpgAmtAftDisc_LostFocus()
FlashActiveControl mskOpgAmtAftDisc, False
End Sub

Private Sub mskOpgAmtAftDisc_Validate(Cancel As Boolean)
mskOpgAmtAftDisc.Text = ToMyNumFmt(mskOpgAmtAftDisc.Text)
If Val(UnMyNumFmt(mskOpgAmtAftDisc.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskOpgAmtAftDisc.SetFocus
    Cancel = True
Else
    Call CalcOpgChg
End If

End Sub

Private Sub mskOpgAmtBefDisc_GotFocus()
FlashActiveControl mskOpgAmtBefDisc, True
End Sub

Private Sub mskOpgAmtBefDisc_LostFocus()
FlashActiveControl mskOpgAmtBefDisc, False
End Sub

Private Sub mskOpgAmtBefDisc_Validate(Cancel As Boolean)
mskOpgAmtBefDisc.Text = ToMyNumFmt(mskOpgAmtBefDisc.Text)
If Val(UnMyNumFmt(mskOpgAmtBefDisc.Text)) <= 0 Then
    ErrorBox "Invalid Input !!!"
    mskOpgAmtBefDisc.SetFocus
    Cancel = True
Else
    Call CalcOpgChg
End If

End Sub

Private Sub mskOpgDiscAmt_GotFocus()
FlashActiveControl mskOpgDiscAmt, True
End Sub

Private Sub mskOpgDiscAmt_LostFocus()
FlashActiveControl mskOpgDiscAmt, False
End Sub

Private Sub mskOpgDiscAmt_Validate(Cancel As Boolean)
mskOpgDiscAmt.Text = ToMyNumFmt(mskOpgDiscAmt.Text, mUseAbs:=True)
If Val(UnMyNumFmt(mskOpgDiscAmt.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskOpgDiscAmt.SetFocus
    Cancel = True
Else
    Call CalcOpgChg
End If

End Sub

Private Sub mskOpgDiscPer_GotFocus()
FlashActiveControl mskOpgDiscPer, True
End Sub

Private Sub mskOpgDiscPer_LostFocus()
FlashActiveControl mskOpgDiscPer, False
End Sub

Private Sub mskOpgDiscPer_Validate(Cancel As Boolean)
mskOpgDiscPer.Text = ToMyPerFmt(mskOpgDiscPer.Text, mUseAbs:=True)
If Val(UnMyPerFmt(mskOpgDiscPer.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskOpgDiscPer.SetFocus
    Cancel = True
Else
    Call CalcOpgChg
End If

End Sub

Private Sub mskOpgVchNo_GotFocus(Index As Integer)
FlashActiveControl mskOpgVchNo(Index), True
End Sub

Private Sub mskOpgVchNo_LostFocus(Index As Integer)
FlashActiveControl mskOpgVchNo(Index), False
End Sub

Private Sub mskOpgVchNo_Validate(Index As Integer, Cancel As Boolean)
Dim mOpgVchNo As Long

mOpgVchNo = Val(UnMyNumFmt(mskOpgVchNo(Index).Text))
If mOpgVchNo < 0 Then
    If Index = 0 Then
        mOpgVchNo = GetNextVTypeNo(dbHmsDatabase, dbAcDatabase, dbComDatabase, mTableName:="OutdReg", mFieldName:="OpgVchNo", mVtmFieldName:="OpgVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="OpgCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="OpgDate", mDateFieldValue:=Ctod(dtpOpgDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormOpgAcsPermFileName)
        mskOpgVchNo(Index).Text = ToMyNumFmt(mOpgVchNo, mDecimals:=0)
    Else
        ErrorBox "Invalid Input !!!"
        mskOpgVchNo(Index).SetFocus
        Cancel = True
    End If
ElseIf mOpgVchNo > 0 Then
    If Index = 0 Then
        If mOpgVchNo <> mOpgVchNo_old Or Val(fcmbVtmName.BoundText) <> mOpgVtmCode_old Or Ctod(dtpOpgDate.Text) <> mOpgDate_old Or FormAddEditMode = cFORM_ADDMODE Then
            If ChkIsDuplVTypeNo(dbHmsDatabase, dbAcDatabase, mTableName:="OutdReg", mChkFieldName:="OpgVchNo", mChkFieldValue:=CStr(mOpgVchNo), mKeyFieldName:="OpgCode", mKeyFieldValue:=mOpgCode, mVtmFieldName:="OpgVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="OpgCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="OpgDate", mDateFieldValue:=Ctod(dtpOpgDate.Text)) = True Then
                ErrorBox "Duplicate Voucher No. !!!"
                Cancel = True
                mskOpgVchNo(Index).SetFocus
                ' ----------
                Rem RemoveNetwVchNo dbComDatabase, mVtmCode:=Val(fcmbVtmName.BoundText), mVchNo:=mOpgVchNo, mVchDate:=Ctod(dtpOpgDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mShowFailedMsg:=False
                If FormAddEditMode = cFORM_ADDMODE Then
                    mOpgVchNo = GetNextVTypeNo(dbHmsDatabase, dbAcDatabase, dbComDatabase, mTableName:="OutdReg", mFieldName:="OpgVchNo", mVtmFieldName:="OpgVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="OpgCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="OpgDate", mDateFieldValue:=Ctod(dtpOpgDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormOpgAcsPermFileName)
                Else
                    mOpgVchNo = mOpgVchNo_old
                End If
                mskOpgVchNo(Index).Text = ToMyNumFmt(mOpgVchNo, mDecimals:=0)
            Rem Else
            Rem     GetNextVTypeNo dbHmsDatabase, dbAcDatabase, dbComDatabase, mTableName:="OutdReg", mFieldName:="OpgVchNo", mVtmFieldName:="OpgVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="OpgCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="OpgDate", mDateFieldValue:=Ctod(dtpOpgDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormOpgAcsPermFileName, mDeletedVchNo:=mOpgVchNo
            End If
        End If
        If Cancel = False Then
            mskOpgVchNo(Index).Text = ToMyNumFmt(mOpgVchNo, mDecimals:=0)
        End If
    Else
        If ChkIsExistVTypeNo(dbHmsDatabase, mTableName:="OutdReg", mChkFieldName:="OpgVchNo", mChkFieldValue:=CStr(mOpgVchNo), mVtmFieldName:="OpgVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="OpgCmpCode", mFinYrFieldValue:=sFinYrCmpCode) = False Then
            ErrorBox "Voucher No. does not Exist !!!"
            mskOpgVchNo(Index).SetFocus
            Rem Cancel = True
        End If
    End If
Else
    ErrorBox "Invalid Input !!!"
    mskOpgVchNo(Index).SetFocus
    Cancel = True
End If

End Sub

Private Sub mskOpgRate_GotFocus()
FlashActiveControl mskOpgRate, True
End Sub

Private Sub mskOpgRate_LostFocus()
FlashActiveControl mskOpgRate, False
End Sub

Private Sub mskOpgRate_Validate(Cancel As Boolean)
mskOpgRate.Text = ToMyNumFmt(mskOpgRate.Text)
If Val(UnMyNumFmt(mskOpgRate.Text)) <= 0 Then
    ErrorBox "Invalid Input !!!"
    mskOpgRate.SetFocus
    Cancel = True
Else
    Call CalcOpgChg
End If

End Sub

Private Sub mskOpgUnit_GotFocus()
FlashActiveControl mskOpgUnit, True
End Sub

Private Sub mskOpgUnit_LostFocus()
FlashActiveControl mskOpgUnit, False
End Sub

Private Sub mskOpgUnit_Validate(Cancel As Boolean)
mskOpgUnit.Text = ToMyNumFmt(mskOpgUnit.Text, mDecimals:=0)
If Val(UnMyNumFmt(mskOpgUnit.Text)) <= 0 Then
    ErrorBox "Invalid Input !!!"
    mskOpgUnit.SetFocus
    Cancel = True
Else
    Call CalcOpgChg
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
Dim mPttDiscPer As Double

mPttDiscPer = Val(UnMyPerFmt(mskPttDiscPer.Text))
mskPttDiscPer.Text = ToMyPerFmt(mPttDiscPer)
If mPttDiscPer < 0 Then
    ErrorBox "Invalid Discount Percentage !!!"
    mskPttDiscPer.SetFocus
    Cancel = True
Else
    If FormAddEditMode = cFORM_ADDMODE And mPttDiscPer > 0 Then
        mskOpgDiscPer.Text = mskPttDiscPer.Text
        Call CalcOpgChg
    End If
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
                    ShowPttDiscPer mPttCode
                    mOpgOldOpgCode = GetOldOpgCodeFromPttCode(mPttCode)
                    ShowOldOpgCodeDesc mOpgOldOpgCode
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
        ShowPttDiscPer mPttCode
        mOpgOldOpgCode = 0
        ShowOldOpgCodeDesc mOpgOldOpgCode
        ShowPatData mPttCode
        Call ShowPatDefData
        Call StorePatOldData
    Else
        AlertBox "Prohibited in Edit Mode !!!"
    End If
ElseIf Shift = 0 And KeyCode = vbKeyF6 Then
    Call ShowOldOpgListByPttRegNo
End If

End Sub

Private Sub mskPttRegNo_LostFocus()
FlashActiveControl mskPttRegNo, False
End Sub

Private Sub mskPttRegNo_Validate(Cancel As Boolean)
Dim mPttRegNo As Long, mOpgPttCode As Long

mOpgPttCode = Val(mskPttCode.Text)
mPttRegNo = Val(UnMyNumFmt(mskPttRegNo.Text))
If mPttRegNo < 0 Then
    ErrorBox "Invalid Input !!!"
    Cancel = True
    mskPttRegNo.SetFocus
Else
    If mPttRegNo <> mPttRegNo_old Or FormAddEditMode = cFORM_ADDMODE Then
        If FormAddEditMode = cFORM_ADDMODE And mPttRegNo <> mPttRegNo_old And clsHOPT.mOpgPttRegNoAddModeChange_bln = False Then
            AlertBox "Change Prohibited in Add Mode !!!"
            mskPttRegNo.Text = ToMyNumFmt(mPttRegNo_old, mDecimals:=0)
            Cancel = True
            mskPttRegNo.SetFocus
            
        ElseIf FormAddEditMode = cFORM_EDITMODE And mPttRegNo <> mPttRegNo_old And clsHOPT.mOpgPttRegNoEditModeChange_bln = False Then
            AlertBox "Change Prohibited in Edit Mode !!!"
            mskPttRegNo.Text = ToMyNumFmt(mPttRegNo_old, mDecimals:=0)
            Cancel = True
            mskPttRegNo.SetFocus
            
        ElseIf mPttRegNo = 0 And clsHOPT.mOpgPttRegNoNotZero_bln = True Then
            AlertBox "Prohibited Zero Patient Reg.No. !!!"
            If FormAddEditMode = cFORM_ADDMODE Then
                If clsHOPT.mOpgPttRegNoAutoNumber_bln = True Then
                    mPttRegNo = GetNextSeqno(dbHmsDatabase, "PatMast", "PttRegNo")
                    mskPttRegNo.Text = ToMyNumFmt(mPttRegNo, mDecimals:=0)
                End If
            Else
                mskPttRegNo.Text = ToMyNumFmt(mPttRegNo_old, mDecimals:=0)
            End If
            Cancel = True
            mskPttRegNo.SetFocus
        ElseIf mPttRegNo <> 0 Then
            If ChkIsDuplicate(dbHmsDatabase, "PatMast", "PttRegNo", mPttRegNo, "PttCode", mOpgPttCode) = True Then
                ErrorBox "Duplicate Patient Reg.No. !!!"
                Cancel = True
                mskPttRegNo.SetFocus
                ' -----------
                If FormAddEditMode = cFORM_ADDMODE Then
                    If clsHOPT.mOpgPttRegNoAutoNumber_bln = True Then
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
        
'        clsARA.GetData Val(fcmbAraName.BoundText)
'        fcmbStnName.BoundText = CStr(clsARA.mAraStnCode_lng): txtStnName.Text = fcmbStnName.Text
'        If Val(fcmbStnName.BoundText) = 0 Then
'            fcmbStnName.Requery
'            fcmbStnName.BoundText = CStr(clsARA.mAraStnCode_lng): txtStnName.Text = fcmbStnName.Text
'        End If
    End If
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
Else
    Call ChkServRate
    Call CalcOpgChg
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

Private Sub txtOpgRemark_GotFocus()
FlashActiveControl txtOpgRemark, True
End Sub

Private Sub txtOpgRemark_LostFocus()
FlashActiveControl txtOpgRemark, False
End Sub

Private Sub txtOpgRemark_Validate(Cancel As Boolean)
txtOpgRemark.Text = ToMyWord(txtOpgRemark.Text)
End Sub

Private Sub txtOpgTime_str_GotFocus()
FlashActiveControl txtOpgTime_str, True
End Sub

Private Sub txtOpgTime_str_LostFocus()
FlashActiveControl txtOpgTime_str, False
End Sub

Private Sub txtOpgTime_str_Validate(Cancel As Boolean)
txtOpgTime_str.Text = MinToTime(TimeToMin(txtOpgTime_str.Text))
If TimeToMin(txtOpgTime_str.Text) > cDAYMINUTES Then
    ErrorBox "Invalid Input !!!"
    txtOpgTime_str.SetFocus
    Cancel = True
Else
    Call ChkServRate
    Call CalcOpgChg
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
                    ShowPttDiscPer mPttCode
                    mOpgOldOpgCode = GetOldOpgCodeFromPttCode(mPttCode)
                    ShowOldOpgCodeDesc mOpgOldOpgCode
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
        ShowPttDiscPer mPttCode
        mOpgOldOpgCode = 0
        ShowOldOpgCodeDesc mOpgOldOpgCode
        ShowPatData mPttCode
        Call ShowPatDefData
    Else
        AlertBox "Prohibited in Edit Mode !!!"
    End If
ElseIf Shift = 0 And KeyCode = vbKeyF6 Then
    Call ShowOldOpgListByPttName
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
If clsOPG.BeginTran(0) = False Then
    Exit Sub
ElseIf clsPAT.BeginMast(0) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_ADDMODE
PatAddEditMode = cFORM_ADDMODE

clsOPG.Clear
clsPAT.Clear
mOpgCode = clsOPG.ActiveCode
mPttCode = clsPAT.ActiveCode

ShowPatData mPttCode
ShowOpgData mOpgCode

Rem restoring user editing features
Call ShowPatDefData
Call ShowOpgDefData

Rem old values
Call StorePatOldData
Call StoreOpgOldData

Call ShowEntryMode(True)
txtPttName.SetFocus

End Sub

Private Sub Data_EditEvent()

If CanUserEditOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If clsOPG.BeginTran(datRecset.fields("OpgCode")) = False Then
    Exit Sub
ElseIf clsPAT.BeginMast(datRecset.fields("OpgPttCode")) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_EDITMODE
PatAddEditMode = cFORM_EDITMODE

With datRecset
mOpgCode = .fields("OpgCode")
mPttCode = .fields("OpgPttCode")
clsOPG.GetData mOpgCode
clsPAT.GetData mPttCode
End With

ShowPatData mPttCode
ShowOpgData mOpgCode

Rem old values
Call StorePatOldData
Call StoreOpgOldData

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

If clsHOPT.mOpgPttRegNoAutoNumber_bln = True Then
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
fcmbAraName.BoundText = CStr(clsHOPT.GetOutdRegOptBoundCode("OpgAraCode"))
fcmbStnName.BoundText = CStr(clsHOPT.GetOutdRegOptBoundCode("OpgStnCode"))
fcmbPcgName.BoundText = CStr(clsHOPT.GetOutdRegOptBoundCode("OpgPcgCode"))
fcmbAhName.BoundText = CStr(clsHOPT.GetOutdRegOptBoundCode("OpgPttAhCode"))

If Val(fcmbAraName.BoundText) = 0 Or Val(fcmbStnName.BoundText) = 0 Or Val(fcmbPcgName.BoundText) = 0 Or Val(fcmbAhName.BoundText) = 0 Then
    With tRecset
    .open "Select * from PatMast where PttCode = (Select top 1 OpgPttCode from OutdReg order by OpgCode desc)", dbHmsDatabase, adOpenKeyset, adLockOptimistic
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

Private Sub ShowOpgData(ByVal mOpgCode As Long)

With clsOPG
.GetData mOpgCode

mskFormBoundField.Text = mOpgCode
fcmbVtmName.BoundText = CStr(.mVtmCode_lng): txtVtmName(0).Text = fcmbVtmName.Text
txtOpgPrefix.Text = .mOpgPrefix_str
mskOpgVchNo(0).Text = ToMyNumFmt(.mVchNo_lng, mDecimals:=0)
dtpOpgDate.Text = Dtoc(.mVchDate_dt)
txtOpgTime_str.Text = MinToTime(.mOpgTime_lng)
fcmbCDctName.BoundText = CStr(.mOpgCDctCode_lng): txtCDctName.Text = fcmbCDctName.Text
fcmbRByName.BoundText = CStr(.mOpgRByCode_lng): txtRByName.Text = fcmbRByName.Text
fcmbFDigName.BoundText = CStr(.mOpgFDigCode_lng): txtFDigName.Text = fcmbFDigName.Text
fcmbSrvName.BoundText = CStr(.mOpgSrvCode_lng): txtSrvName.Text = fcmbSrvName.Text
mskOpgUnit.Text = .mOpgUnit_lng
mskOpgRate.Text = ToMyNumFmt(.mOpgRate_dbl)
mskOpgAmtBefDisc.Text = ToMyNumFmt(.mOpgAmtBefDisc_dbl)
mskOpgDiscPer.Text = ToMyPerFmt(.mOpgDiscPer_dbl)
mskOpgDiscAmt.Text = ToMyNumFmt(.mOpgDiscAmt_dbl)
mskOpgAmtAftDisc.Text = ToMyNumFmt(.mOpgAmtAftDisc_dbl)
txtOpgRemark.Text = .mOpgRemark_str
Rem old outdoor data
lblOldOpgCodeDesc.Caption = ""
mOpgOldOpgCode = .mOpgOldOpgCode_lng
ShowOldOpgCodeDesc mOpgOldOpgCode
End With

Call CalcOpgChg

End Sub

Private Sub ShowOpgDefData()
Dim mOpgVchNo As Long, tRecset As New ADODB.Recordset

dtpOpgDate.Text = Dtoc(DefaultEntryDate)
txtOpgTime_str.Text = MinToTime(TimeToMin(DateTime.Time$))
mskOpgUnit.Text = 1

fcmbVtmName.BoundText = CStr(clsHOPT.GetOutdRegOptBoundCode("OpgVtmCode"))
fcmbCDctName.BoundText = CStr(clsHOPT.GetOutdRegOptBoundCode("OpgCDctCode"))
fcmbRByName.BoundText = CStr(clsHOPT.GetOutdRegOptBoundCode("OpgRByCode"))
fcmbFDigName.BoundText = CStr(clsHOPT.GetOutdRegOptBoundCode("OpgFDigCode"))
fcmbSrvName.BoundText = CStr(clsHOPT.GetOutdRegOptBoundCode("OpgSrvCode"))

If Val(fcmbVtmName.BoundText) = 0 Or Val(fcmbCDctName.BoundText) = 0 Or Val(fcmbRByName.BoundText) = 0 Or Val(fcmbFDigName.BoundText) = 0 Or Val(fcmbSrvName.BoundText) = 0 Then
    With tRecset
    .open "Select top 1 * from OutdReg order by OpgCode desc", dbHmsDatabase, adOpenKeyset, adLockOptimistic
    If .EOF = False Then
        If Val(fcmbVtmName.BoundText) = 0 Then
            fcmbVtmName.BoundText = CStr(.fields("OpgVtmCode"))
        End If
        If Val(fcmbCDctName.BoundText) = 0 Then
            fcmbCDctName.BoundText = CStr(.fields("OpgCDctCode"))
        End If
        If Val(fcmbRByName.BoundText) = 0 Then
            fcmbRByName.BoundText = CStr(.fields("OpgRByCode"))
        End If
        If Val(fcmbFDigName.BoundText) = 0 Then
            fcmbFDigName.BoundText = CStr(.fields("OpgFDigCode"))
        End If
        If Val(fcmbSrvName.BoundText) = 0 Then
            fcmbSrvName.BoundText = CStr(.fields("OpgSrvCode"))
        End If
    End If
    End With
    CloseTable tRecset
End If

txtVtmName(0).Text = fcmbVtmName.Text
txtCDctName.Text = fcmbCDctName.Text
txtRByName.Text = fcmbRByName.Text
txtFDigName.Text = fcmbFDigName.Text
txtSrvName.Text = fcmbSrvName.Text

mOpgVchNo = GetNextVTypeNo(dbHmsDatabase, dbAcDatabase, dbComDatabase, mTableName:="OutdReg", mFieldName:="OpgVchNo", mVtmFieldName:="OpgVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="OpgCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="OpgDate", mDateFieldValue:=Ctod(dtpOpgDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormOpgAcsPermFileName)
mskOpgVchNo(0).Text = ToMyNumFmt(mOpgVchNo, mDecimals:=0)

' clsSRV.GetData Val(fcmbSrvName.BoundText)
' mskOpgRate.Text = ToMyNumFmt(clsSRV.mSrvRate_dbl)
Call ChkServRate
Call CalcOpgChg
Set tRecset = Nothing

End Sub

Private Sub StoreOpgOldData()
mOpgCode_old = mOpgCode
mOpgDate_old = Ctod(dtpOpgDate.Text)
mOpgTime_old = TimeToMin(txtOpgTime_str)
mOpgVtmCode_old = Val(fcmbVtmName.BoundText)
mOpgVchNo_old = Val(UnMyNumFmt(mskOpgVchNo(0).Text))
mOpgCDctCode_old = Val(fcmbCDctName.BoundText)
mOpgRByCode_old = Val(fcmbRByName.BoundText)
mOpgRToCode_old = 0 ' Val(fcmbRToName.BoundText)
mOpgSrvCode_old = Val(fcmbSrvName.BoundText)

mskOpgDiscPer.Tag = False
mskOpgDiscAmt.Tag = False

End Sub

Private Sub Data_SaveEvent()
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
    
    With clsOPG
    If FormAddEditMode = cFORM_ADDMODE Then
        .Clear
    Else
        .GetData mOpgCode
    End If
    .mVtmCode_lng = Val(fcmbVtmName.BoundText)
    .mVchNo_lng = Val(UnMyNumFmt(mskOpgVchNo(0).Text))
    .mVchDate_dt = Ctod(dtpOpgDate.Text)
    .mCmpCode_int = sFinYrCmpCode
    .mOpgPrefix_str = txtOpgPrefix.Text
    .mOpgPostfix_str = ""
    .mOpgTime_lng = TimeToMin(txtOpgTime_str.Text)
    .mOpgOldOpgCode_lng = mOpgOldOpgCode
    .mOpgPttCode_lng = mPttCode
    .mOpgCDctCode_lng = Val(fcmbCDctName.BoundText)
    .mOpgRByCode_lng = Val(fcmbRByName.BoundText)
    .mOpgFDigCode_lng = Val(fcmbFDigName.BoundText)
    .mOpgSrvCode_lng = Val(fcmbSrvName.BoundText)
    .mOpgUnit_lng = Val(UnMyNumFmt(mskOpgUnit.Text))
    .mOpgRate_dbl = Val(UnMyNumFmt(mskOpgRate.Text))
    .mOpgAmtBefDisc_dbl = Val(UnMyNumFmt(mskOpgAmtBefDisc.Text))
    .mOpgDiscPer_dbl = Val(UnMyPerFmt(mskOpgDiscPer.Text))
    .mOpgDiscAmt_dbl = Val(UnMyNumFmt(mskOpgDiscAmt.Text))
    .mOpgAmtAftDisc_dbl = Val(UnMyNumFmt(mskOpgAmtAftDisc.Text))
    .mOpgRemark_str = txtOpgRemark.Text
    
    If FormAddEditMode = cFORM_ADDMODE Then
        .AddNew
        mskFormBoundField.Text = .mCode_lng
    Else
        .Update mOpgCode
    End If
    If .mCode_lng > 0 Then   ' updated successfully
        mOpgCode = .mCode_lng
        
        .UpdateTran .mCode_lng
        .EndTran .mCode_lng
        
        
        
        
        Rem updating user editing carry forward features
        clsHOPT.mOpgAraCodeOld_lng = clsPAT.mPttAraCode_lng
        clsHOPT.mOpgStnCodeOld_lng = clsPAT.mPttStnCode_lng
        clsHOPT.mOpgPcgCodeOld_lng = clsPAT.mPttPcgCode_lng
        clsHOPT.mOpgPttAhCodeOld_lng = clsPAT.mPttAhCode_lng
        clsHOPT.mOpgVtmCodeOld_lng = .mVtmCode_lng
        clsHOPT.mOpgCDctCodeOld_lng = .mOpgCDctCode_lng
        clsHOPT.mOpgRByCodeOld_lng = .mOpgRByCode_lng
        clsHOPT.mOpgFDigCodeOld_lng = .mOpgFDigCode_lng
        clsHOPT.mOpgSrvCodeOld_lng = .mOpgSrvCode_lng
        clsHOPT.UpdateOutdRegOld
        
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


If clsOPG.mCode_lng > 0 Then   ' updated successfully
    
    
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
Dim mDeleteit As Boolean, mRecAbsPos As Long, mPttAhCode As Long, mOpgVchNo As Long, mOpgVtmCode As Long, mOpgDate As Date

If CanUserDeleteOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If (datRecset.EOF Or datRecset.BOF) = True Then
    Exit Sub
End If

mOpgCode = datRecset.fields("OpgCode")
mOpgVtmCode = datRecset.fields("OpgVtmCode")
mOpgVchNo = datRecset.fields("OpgVchNo")
mOpgDate = datRecset.fields("OpgDate")
mPttCode = datRecset.fields("OpgPttCode")
mPttAhCode = datRecset.fields("PttAhCode")
mRecAbsPos = datRecset.AbsolutePosition

If clsOPG.CanDeleteTran(mOpgCode) = True Then
    txtVoid.SetFocus
    If clsOPG.BeginTran(mOpgCode) = True Then
        clsOPG.DeleteTran mOpgCode
        clsOPG.UpdateTran mOpgCode
        clsOPG.EndTran mOpgCode
    
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
clsOPG.CancelTran mOpgCode
clsOPG.EndTran mOpgCode

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
        
        Call ChkServRate
        Call CalcOpgChg
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
        clsListStru.AddFields mExpr:="OpgYrMonth", mAttrib:=cFAT_SYSTEM
        clsListStru.AddFields mExpr:="OpgMnYear", mTitle:="Month", mShowItem:=True, mAlign:=1, mWidth:=2000
        clsListStru.AddFields mExpr:="OpgCount", mTitle:="Count", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="OpgAmtAftDisc_sum", mTitle:="Charges", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="OpgDiscAmt_sum", mTitle:="Discount", mShowItem:=True, mAlign:=7, mWidth:=1500
        
        datRecset.open "Select format(OpgDate,'yyyy/MM') as OpgYrMonth" _
         & ",Count(OpgCode) as OpgCount" _
         & ",Sum(OpgAmtAftDisc) as OpgAmtAftDisc_sum" _
         & ",Sum(OpgDiscAmt) as OpgDiscAmt_sum" _
         & " from OutdReg" _
         & " where OpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and OpgCode>0" _
         & IIf(mQryPttCode > 0, " and OpgPttCode=" & CStr(mQryPttCode), "") _
         & " group by format(OpgDate,'yyyy/MM')" _
         & " order by format(OpgDate,'yyyy/MM')" _
         , dbHmsDatabase, adOpenKeyset, adLockReadOnly

    ElseIf optDatewise.Value = True Then
        clsListStru.AddFields mExpr:="OpgDateYMD", mAttrib:=cFAT_SYSTEM
        clsListStru.AddFields mExpr:="OpgDate", mTitle:="Date", mShowItem:=True, mAlign:=1, mWidth:=2000
        clsListStru.AddFields mExpr:="OpgCount", mTitle:="Count", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="OpgAmtAftDisc_sum", mTitle:="Charges", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="OpgDiscAmt_sum", mTitle:="Discount", mShowItem:=True, mAlign:=7, mWidth:=1500
        
        datRecset.open "Select OpgDate" _
         & ",Count(OpgCode) as OpgCount" _
         & ",Sum(OpgAmtAftDisc) as OpgAmtAftDisc_sum" _
         & ",Sum(OpgDiscAmt) as OpgDiscAmt_sum" _
         & " from OutdReg" _
         & " where OpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and OpgCode>0" _
         & IIf(mQryPttCode > 0, " and OpgPttCode=" & CStr(mQryPttCode), "") _
         & " group by OpgDate" _
         & " order by OpgDate" _
         , dbHmsDatabase, adOpenKeyset, adLockReadOnly
        
    ElseIf optPatientwise.Value = True Then
        clsListStru.AddFields mExpr:="PttName", mTitle:="Patient Name", mShowItem:=True, mAlign:=1, mWidth:=3000
        clsListStru.AddFields mExpr:="PttRegNo", mTitle:="Reg.No", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="PttRefName", mTitle:="Care of", mShowItem:=True, mAlign:=1, mWidth:=2000
        clsListStru.AddFields mExpr:="OpgCount", mTitle:="Count", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="OpgAmtAftDisc_sum", mTitle:="Charges", mShowItem:=True, mAlign:=7, mWidth:=1500
        clsListStru.AddFields mExpr:="OpgDiscAmt_sum", mTitle:="Discount", mShowItem:=True, mAlign:=7, mWidth:=1500
        
        datRecset.open "Select PatMast.PttName,OpgPttCode,PatMast.PttRegNo,PatMast.PttRefName" _
         & ",Count(OpgCode) as OpgCount" _
         & ",Sum(OpgAmtAftDisc) as OpgAmtAftDisc_sum" _
         & ",Sum(OpgDiscAmt) as OpgDiscAmt_sum" _
         & " from OutdReg inner join PatMast on OutdReg.OpgPttCode=PatMast.PttCode" _
         & " where OpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
         & " and OpgCode>0" _
         & IIf(mQryPttCode > 0, " and OpgPttCode=" & CStr(mQryPttCode), "") _
         & " group by PatMast.PttName,OpgPttCode,PatMast.PttRegNo,PatMast.PttRefName" _
         & " order by PatMast.PttName,OpgPttCode,PatMast.PttRegNo,PatMast.PttRefName" _
         , dbHmsDatabase, adOpenKeyset, adLockReadOnly
    End If
    
ElseIf optDetailed.Value = True Then
    clsListStru.AddFields mExpr:="tOpgSmryId", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="OpgCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="VtmName", mTitle:="Voucher", mAlign:=1, mWidth:=1500, mShowItem:=True
    clsListStru.AddFields mExpr:="OpgVchNo", mTitle:="Vchr.No", mAlign:=7, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="OpgDate", mTitle:="Date", mAlign:=1, mWidth:=1300, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="PttCode", mAttrib:=cFAT_SYSTEM
    clsListStru.AddFields mExpr:="PttName", mTitle:="Patient Name", mAlign:=1, mWidth:=2500, mShowItem:=True
    clsListStru.AddFields mExpr:="PttRegNo", mTitle:="Reg.No", mAlign:=7, mWidth:=1250, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="OpgAmtAftDisc", mTitle:="Charges", mAlign:=7, mWidth:=1250, mShowItem:=True
    clsListStru.AddFields mExpr:="OpgDiscAmt", mTitle:="Discount", mAlign:=7, mWidth:=1250, mShowItem:=True
    ' --------------------------------------
    clsListStru.AddFields mExpr:="PttRefName", mTitle:="Care of", mAlign:=1, mWidth:=2000, mShowItem:=True
    clsListStru.AddFields mExpr:="PttAddr", mTitle:="Address", mAlign:=1, mWidth:=2000, mShowItem:=True
    clsListStru.AddFields mExpr:="PatAraName", mTitle:="Area", mAlign:=1, mWidth:=1500, mShowItem:=True
    clsListStru.AddFields mExpr:="PatStnName", mTitle:="Station", mAlign:=1, mWidth:=1500, mShowItem:=True
    clsListStru.AddFields mExpr:="PatPcgName", mTitle:="Category", mAlign:=1, mWidth:=2000, mShowItem:=True
    
    datRecset.open "Select OutdReg.*,PatMast.*" _
     & ",format(OpgDate,'yyyymmdd')+format(OpgCode,'" & cLONGCODESTRFMT & "') as tOpgSmryId" _
     & " from OutdReg inner join PatMast on OutdReg.OpgPttCode=PatMast.PttCode" _
     & " where OpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & IIf(mRemoteAccess = True, " and OpgCode=" & CStr(mOpgCode) & "", "") _
     & " and OpgCode>0" _
     & IIf(mQryPttCode > 0, " and OpgPttCode=" & CStr(mQryPttCode), "") _
     & " order by OpgDate,OpgCode" _
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
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OpgYrMonth")) = .fields("OpgYrMonth")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OpgMnYear")) = MonthName(Val(Right(.fields("OpgYrMonth"), 2))) & "-" & Left(.fields("OpgYrMonth"), 4)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OpgCount")) = ToMyNumFmt(.fields("OpgCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OpgAmtAftDisc_sum")) = ToMyNumFmt(.fields("OpgAmtAftDisc_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OpgDiscAmt_sum")) = ToMyNumFmt(.fields("OpgDiscAmt_sum"))
                
            ElseIf optDatewise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OpgDateYMD")) = Format(.fields("OpgDate"), "yyyymmdd")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OpgDate")) = Dtoc(.fields("OpgDate"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OpgCount")) = ToMyNumFmt(.fields("OpgCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OpgAmtAftDisc_sum")) = ToMyNumFmt(.fields("OpgAmtAftDisc_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OpgDiscAmt_sum")) = ToMyNumFmt(.fields("OpgDiscAmt_sum"))
                
            ElseIf optPatientwise.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttName")) = .fields("PttName")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttRegNo")) = ToMyNumFmt(.fields("PttRegNo"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttRefName")) = .fields("PttRefName")
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OpgCount")) = ToMyNumFmt(.fields("OpgCount"), mDecimals:=0)
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OpgAmtAftDisc_sum")) = ToMyNumFmt(.fields("OpgAmtAftDisc_sum"))
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OpgDiscAmt_sum")) = ToMyNumFmt(.fields("OpgDiscAmt_sum"))
                
            End If
        
        ElseIf optDetailed.Value = True Then
            clsPCG.GetData .fields("PttPcgCode")
            clsARA.GetData .fields("PttAraCode")
            clsSTN.GetData .fields("PttStnCode")
            clsVTM.GetData .fields("OpgVtmCode")
        
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("tOpgSmryId")) = Format(.fields("OpgDate"), "yyyymmdd") & Format(.fields("OpgCode"), cLONGCODESTRFMT)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OpgCode")) = .fields("OpgCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("VtmName")) = clsVTM.mName_str
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OpgVchNo")) = .fields("OpgVchNo")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OpgDate")) = Dtoc(.fields("OpgDate"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OpgAmtAftDisc")) = ToMyNumFmt(.fields("OpgAmtAftDisc"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("OpgDiscAmt")) = ToMyNumFmt(.fields("OpgDiscAmt"))
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
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("tOpgSmryId"), mText
    ElseIf optMonthwise.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("OpgYrMonth"), mText
    ElseIf optDatewise.Value = True Then
        SearchFlex Mfgrd1, clsListStru.GetItemIndex("OpgDateYMD"), mText
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
If Val(fcmbRByName.BoundText) <= 0 Then
    'ErrorBox "Invalid Selection !!!"
    'txtRByName.SetFocus
    'Cancel = True
Else
    Call ChkServRate
    Call CalcOpgChg
End If

End Sub

Private Sub txtSearch1Text_GotFocus()
FlashActiveControl txtSearch1Text, True
End Sub

Private Sub txtSearch1Text_LostFocus()
FlashActiveControl txtSearch1Text, False
End Sub

Private Sub txtSrvName_Change()
If fcmbSrvName.CallFromText_Change = False Then
    fcmbSrvName.CallFromText_Change = True
    If InterActiveChange(txtSrvName) = True Then
        fcmbSrvName.UserText = Array(txtSrvName.Text, txtSrvName.SelStart)
        fcmbSrvName.Show
        txtSrvName.Text = fcmbSrvName.Text
        If fcmbSrvName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbSrvName.CallFromText_Change = False
End If

End Sub

Private Sub txtSrvName_GotFocus()
FlashActiveControl txtSrvName, True
End Sub

Private Sub txtSrvName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtSrvName_Change
End If

End Sub

Private Sub txtSrvName_LostFocus()
FlashActiveControl txtSrvName, False
End Sub

Private Sub txtSrvName_Validate(Cancel As Boolean)
Dim mOpgRate As Double, mOpgDiscPer As Double, mOpgInfByPer As Double, mOpgDefByPer As Double

If Val(fcmbSrvName.BoundText) <= 0 Then
    ErrorBox "Invalid Selection !!!"
    txtSrvName.SetFocus
    Cancel = True
Else
    If Val(fcmbSrvName.BoundText) <> mOpgSrvCode_old Or FormAddEditMode = cFORM_ADDMODE Then
        Call ChkServRate
        Call CalcOpgChg
    End If
End If

End Sub

Private Sub ChkServRate()
Dim mOpgRate As Double, mOpgDiscPer As Double, mOpgInfByPer As Double, mOpgDefByPer As Double

If FormAddEditMode = cFORM_ADDMODE Or Val(fcmbSrvName.BoundText) <> mOpgSrvCode_old Or mOpgCDctCode_old <> Val(fcmbCDctName.BoundText) Or mPttPcgCode_old <> Val(fcmbPcgName.BoundText) Or mOpgRByCode_old <> Val(fcmbRByName.BoundText) Or mOpgDate_old <> Ctod(dtpOpgDate.Text) Or mOpgTime_old <> TimeToMin(txtOpgTime_str) Then     ' Or mOpgRToCode_old <> Val(fcmbRToName.BoundText)
    GetServRateValues cnn:=dbHmsDatabase, mSrvCode:=Val(fcmbSrvName.BoundText), mTranDate:=Ctod(dtpOpgDate.Text), mTranTime:=TimeToMin(txtOpgTime_str.Text), mSrmDctCode:=Val(fcmbCDctName.BoundText), mSrmPcgCode:=Val(fcmbPcgName.BoundText), mSrmRByCode:=Val(fcmbRByName.BoundText), mSrmRToCode:=0, mSrmRate:=mOpgRate, mSrmDiscPer:=mOpgDiscPer, mSrmInfByPer:=mOpgInfByPer, mSrmDefByPer:=mOpgDefByPer
    If mOpgDiscPer = 0 And chkPttDiscAllowed.Value = vbChecked Then
        mOpgDiscPer = Val(UnMyPerFmt(mskPttDiscPer.Text))
    End If
    If mOpgDiscPer = 0 And Val(UnMyPerFmt(mskPttDiscPer.Text)) <> 0 Then
        mOpgDiscPer = Val(UnMyPerFmt(mskPttDiscPer.Text))
    End If
    If mOpgInfByPer <> 0 Then
         mOpgRate = mOpgRate + (mOpgRate * mOpgInfByPer / 100)
    ElseIf mOpgDefByPer <> 0 Then
        mOpgRate = mOpgRate - (mOpgRate * mOpgDefByPer / 100)
    End If
    mskOpgRate.Text = ToMyNumFmt(mOpgRate)
    mskOpgDiscPer.Text = ToMyPerFmt(mOpgDiscPer)
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
    Call txtVtmName_Change(Index)
ElseIf MyAddNewKey(Shift, KeyCode) = True Then

ElseIf Shift = 0 And KeyCode = vbKeyF6 Then
    ShowOldOpgListByOpgNo Index
End If

End Sub

Private Sub txtVtmName_LostFocus(Index As Integer)
FlashActiveControl txtVtmName(Index), False
End Sub

Private Sub txtVtmName_Validate(Index As Integer, Cancel As Boolean)
Dim mOpgVchNo As Long

If Val(fcmbVtmName.BoundText) <= 0 Then
    ErrorBox "Invalid Selection !!!"
    txtVtmName(Index).SetFocus
    Cancel = True
Else
    If Index = 0 Then
        If Val(fcmbVtmName.BoundText) <> mOpgVtmCode_old Or Ctod(dtpOpgDate.Text) <> mOpgDate_old Or FormAddEditMode = cFORM_ADDMODE Then
            mOpgVchNo = GetNextVTypeNo(dbHmsDatabase, dbAcDatabase, dbComDatabase, mTableName:="OutdReg", mFieldName:="OpgVchNo", mVtmFieldName:="OpgVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="OpgCmpCode", mFinYrFieldValue:=sFinYrCmpCode, mDateFieldName:="OpgDate", mDateFieldValue:=Ctod(dtpOpgDate.Text), mModuleCode:=mFormUIdCode, mModuleName:=Me.Name, mAcsPermFileName:=mFormOpgAcsPermFileName)
            mskOpgVchNo(Index).Text = ToMyNumFmt(mOpgVchNo, mDecimals:=0)
        End If
    End If
End If

End Sub

Private Sub CalcOpgChg()
Dim mOpgUnit As Long, mOpgRate As Double, mOpgAmtBefDisc As Double, mOpgDiscPer As Double, mOpgDiscAmt As Double, mOpgAmtAftDisc As Double
mOpgUnit = Val(UnMyNumFmt(mskOpgUnit.Text))
mOpgRate = Val(UnMyNumFmt(mskOpgRate.Text))
mOpgAmtBefDisc = mOpgUnit * mOpgRate
mOpgDiscPer = Val(UnMyPerFmt(mskOpgDiscPer.Text))
mOpgDiscAmt = Val(UnMyNumFmt(mskOpgDiscAmt.Text))
If mskOpgDiscPer.Tag = True Then
    mOpgDiscAmt = Round(mOpgAmtBefDisc * mOpgDiscPer / 100, 2)
ElseIf mskOpgDiscAmt.Tag = True Then
    If mOpgDiscAmt <> 0 And mOpgAmtBefDisc <> 0 Then
        mOpgDiscPer = Round(mOpgDiscAmt * 100 / mOpgAmtBefDisc, 2)
    Else
        mOpgDiscPer = 0
    End If
ElseIf FormAddEditMode = cFORM_ADDMODE Then
    mOpgDiscAmt = Round(mOpgAmtBefDisc * mOpgDiscPer / 100, 2)
End If
mOpgAmtAftDisc = mOpgAmtBefDisc - mOpgDiscAmt
' --------
mskOpgAmtBefDisc.Text = ToMyNumFmt(mOpgAmtBefDisc)
mskOpgDiscPer.Text = ToMyPerFmt(mOpgDiscPer)
mskOpgDiscAmt.Text = ToMyNumFmt(mOpgDiscAmt)
mskOpgAmtAftDisc.Text = ToMyNumFmt(mOpgAmtAftDisc)

End Sub

Private Sub ShowOldOpgCodeDesc(ByVal mOldOpgCode As Long)
Dim tRecset As New ADODB.Recordset

With tRecset
.open "Select * from OutdReg where OpgCode=" & CStr(mOldOpgCode) & "", dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    clsVTM.GetData .fields("OpgVtmCode")
    lblOldOpgCodeDesc.Caption = RTrim(clsVTM.mName_str) & " No.:" & CStr(.fields("OpgVchNo")) & " Dated:" & Dtoc(.fields("OpgDate"))
Else
    lblOldOpgCodeDesc.Caption = "#" & CStr(mOldOpgCode) & "#"
End If
End With
CloseTable tRecset

End Sub

Private Function GetOldOpgCodeFromPttCode(ByVal mPttCode As Long) As Long
Dim tRecset As New ADODB.Recordset

With tRecset
.open "Select top 1 * from OutdReg where OpgPttCode=" & CStr(mPttCode) & " order by OpgDate desc,OpgVchNo desc,OpgCode desc", dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    GetOldOpgCodeFromPttCode = .fields("OpgCode")
Else
    GetOldOpgCodeFromPttCode = 0
End If
End With
CloseTable tRecset

End Function

Private Sub ShowPttDiscPer(ByVal mPttCode As Long)
Dim tRecset As New ADODB.Recordset

With tRecset
.open "Select * from PatMast where PttCode=" & CStr(mPttCode) & "", dbHmsDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    If .fields("PttDiscAllowed") = True And .fields("PttDiscPer") > 0 Then
        mskOpgDiscPer.Text = ToMyPerFmt(.fields("PttDiscPer"))
        Call CalcOpgChg
    End If
End If
End With
CloseTable tRecset

End Sub

Private Sub ShowOldOpgListByOpgNo(Index As Integer)
Dim tRecset As New ADODB.Recordset, mOldOpgCode As Long, mOldPttCode As Long

If fcmbOldOpgByOpgNo.CallFromText_Change = False Then
    fcmbOldOpgByOpgNo.CallFromText_Change = True
    If InterActiveChange(txtVtmName(Index)) = True Then
        fcmbOldOpgByOpgNo.UserText = Array("", 0)
        fcmbOldOpgByOpgNo.Show
        If fcmbOldOpgByOpgNo.ListSelected = True And Val(fcmbOldOpgByOpgNo.BoundText) > 0 Then
            mOldOpgCode = Val(fcmbOldOpgByOpgNo.BoundText)
            tRecset.open "Select * from OutdReg where OpgCode=" & CStr(mOldOpgCode) & " order by OpgDate,OpgVchNo,OpgCode", dbHmsDatabase, adOpenKeyset, adLockOptimistic
            If tRecset.RecordCount > 0 Then
                mOldPttCode = tRecset.fields("OpgPttCode")
            End If
            CloseTable tRecset
            If FormAddEditMode = cFORM_ADDMODE And mOldOpgCode > 0 And mOldPttCode > 0 Then
                clsPAT.EndMast mPttCode
                PatAddEditMode = cFORM_EDITMODE
                mPttCode = mOldPttCode
                If clsPAT.BeginMast(mPttCode) = True Then
                    mPttCode = clsPAT.ActiveCode
                Else
                    mPttCode = 0
                End If
                ShowPttDiscPer mPttCode
                Rem mOpgOldOpgCode = GetOldOpgCodeFromPttCode(mPttCode) will create chaos when last entry entered first and earlier entry entered in last
                mOpgOldOpgCode = mOldOpgCode
                ShowPatData mPttCode
                ShowOldOpgCodeDesc mOpgOldOpgCode
            Else
                If mOldOpgCode > 0 And mOldPttCode > 0 Then
                    AlertBox "Prohibited in Edit Mode !!!"
                End If
            End If
        End If
    End If
    fcmbOldOpgByOpgNo.CallFromText_Change = False
End If
CloseTable tRecset, mCheckOpen:=True

End Sub

Private Sub ShowOldOpgListByPttRegNo()
Dim tRecset As New ADODB.Recordset, mOldOpgCode As Long, mOldPttCode As Long

If fcmbOldOpgByPttRegNo.CallFromText_Change = False Then
    fcmbOldOpgByPttRegNo.CallFromText_Change = True
    If InterActiveChange(mskPttRegNo) = True Then
        fcmbOldOpgByPttRegNo.UserText = Array("", 0)
        fcmbOldOpgByPttRegNo.Show
        If fcmbOldOpgByPttRegNo.ListSelected = True And Val(fcmbOldOpgByPttRegNo.BoundText) > 0 Then
            mOldOpgCode = Val(fcmbOldOpgByPttRegNo.LFieldValue("OpgCode"))
            tRecset.open "Select * from OutdReg where OpgCode=" & CStr(mOldOpgCode) & "", dbHmsDatabase, adOpenKeyset, adLockOptimistic
            If tRecset.RecordCount > 0 Then
                mOldPttCode = tRecset.fields("OpgPttCode")
            End If
            CloseTable tRecset
            If FormAddEditMode = cFORM_ADDMODE And mOldOpgCode > 0 And mOldPttCode > 0 Then
                clsPAT.EndMast mPttCode
                PatAddEditMode = cFORM_EDITMODE
                mPttCode = mOldPttCode
                If clsPAT.BeginMast(mPttCode) = True Then
                    mPttCode = clsPAT.ActiveCode
                Else
                    mPttCode = 0
                End If
                ShowPttDiscPer mPttCode
                Rem mOpgOldOpgCode = GetOldOpgCodeFromPttCode(mPttCode) will create chaos when last entry entered first and earlier entry entered in last
                mOpgOldOpgCode = mOldOpgCode
                ShowPatData mPttCode
                ShowOldOpgCodeDesc mOpgOldOpgCode
            Else
                If mOldOpgCode > 0 And mOldPttCode > 0 Then
                    AlertBox "Prohibited in Edit Mode !!!"
                End If
            End If
        End If
    End If
    fcmbOldOpgByPttRegNo.CallFromText_Change = False
End If
CloseTable tRecset, mCheckOpen:=True

End Sub

Private Sub ShowOldOpgListByPttName()
Dim tRecset As New ADODB.Recordset, mOldOpgCode As Long, mOldPttCode As Long

If fcmbOldOpgByPttName.CallFromText_Change = False Then
    fcmbOldOpgByPttName.CallFromText_Change = True
    If InterActiveChange(mskPttRegNo) = True Then
        fcmbOldOpgByPttName.UserText = Array("", 0)
        fcmbOldOpgByPttName.Show
        If fcmbOldOpgByPttName.ListSelected = True And Val(fcmbOldOpgByPttName.BoundText) > 0 Then
            mOldOpgCode = Val(fcmbOldOpgByPttName.LFieldValue("OpgCode"))
            tRecset.open "Select * from OutdReg where OpgCode=" & CStr(mOldOpgCode) & "", dbHmsDatabase, adOpenKeyset, adLockOptimistic
            If tRecset.RecordCount > 0 Then
                mOldPttCode = tRecset.fields("OpgPttCode")
            End If
            CloseTable tRecset
            If FormAddEditMode = cFORM_ADDMODE And mOldOpgCode > 0 And mOldPttCode > 0 Then
                clsPAT.EndMast mPttCode
                PatAddEditMode = cFORM_EDITMODE
                mPttCode = mOldPttCode
                If clsPAT.BeginMast(mPttCode) = True Then
                    mPttCode = clsPAT.ActiveCode
                Else
                    mPttCode = 0
                End If
                ShowPttDiscPer mPttCode
                Rem mOpgOldOpgCode = GetOldOpgCodeFromPttCode(mPttCode) will create chaos when last entry entered first and earlier entry entered in last
                mOpgOldOpgCode = mOldOpgCode
                ShowPatData mPttCode
                ShowOldOpgCodeDesc mOpgOldOpgCode
            Else
                If mOldOpgCode > 0 And mOldPttCode > 0 Then
                    AlertBox "Prohibited in Edit Mode !!!"
                End If
            End If
        End If
    End If
    fcmbOldOpgByPttName.CallFromText_Change = False
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
Dim mOpgVchNo As Long

If Val(fcmbVtmName.BoundText) < 1 Then
    ErrorBox "Invalid Voucher Type !!!"
    txtVtmName(1).SetFocus
    Exit Sub
End If
If Val(UnMyNumFmt(mskOpgVchNo(1).Text)) < 1 Then
    ErrorBox "Invalid Voucher No. !!!"
    mskOpgVchNo(1).SetFocus
    Exit Sub
Else
    mOpgVchNo = Val(UnMyNumFmt(mskOpgVchNo(1).Text))
    If ChkIsExistVTypeNo(dbHmsDatabase, mTableName:="OutdReg", mChkFieldName:="OpgVchNo", mChkFieldValue:=CStr(mOpgVchNo), mVtmFieldName:="OpgVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="OpgCmpCode", mFinYrFieldValue:=sFinYrCmpCode) = False Then
        ErrorBox "Voucher No. does not Exist !!!"
        mskOpgVchNo(1).SetFocus
        Exit Sub
    End If
End If
If Val(UnMyNumFmt(mskOpgVchNo(2).Text)) < 1 Then
    ErrorBox "Invalid Voucher No. !!!"
    mskOpgVchNo(2).SetFocus
    Exit Sub
Else
    mOpgVchNo = Val(UnMyNumFmt(mskOpgVchNo(2).Text))
    If ChkIsExistVTypeNo(dbHmsDatabase, mTableName:="OutdReg", mChkFieldName:="OpgVchNo", mChkFieldValue:=CStr(mOpgVchNo), mVtmFieldName:="OpgVtmCode", mVtmFieldValue:=Val(fcmbVtmName.BoundText), mFinYrFieldName:="OpgCmpCode", mFinYrFieldValue:=sFinYrCmpCode) = False Then
        ErrorBox "Voucher No. does not Exist !!!"
        mskOpgVchNo(2).SetFocus
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
Dim mPrinter As Printer, mDefaultPrinterIndex As Integer, fhand As Integer, mCRLTitle As String, mCRLFileName As String, mCRLDefault As Boolean, mDefaultCRLIndex As Integer

mDefaultCRLIndex = -1
mDefaultPrinterIndex = -1
mskPrintCopies.Text = 1

cmbPrinterList.Clear
For Each mPrinter In Printers
    cmbPrinterList.AddItem mPrinter.DeviceName & Space(100) & mPrinter.Port
    If mPrinter.DeviceName = Printer.DeviceName Then
        mDefaultPrinterIndex = cmbPrinterList.NewIndex
    End If
Next mPrinter
If cmbPrinterList.ListCount > 0 Then
    If mDefaultPrinterIndex > -1 Then
        cmbPrinterList.ListIndex = mDefaultPrinterIndex
    Else
        cmbPrinterList.ListIndex = 0
    End If
End If

cmbPrintDest.Clear
cmbPrintDest.AddItem "Print to Printer"
cmbPrintDest.AddItem "Screen Preview"
cmbPrintDest.ListIndex = 0

If Dir(OutdRegCRLFileFullPath) = "" Then
    fhand = FreeFile
    Open OutdRegCRLFileFullPath For Output As #fhand
    Write #fhand, "Outdoor Registration", "OutdReg.Rpt", True
    Close #fhand
End If

cmbCRList.Clear
fhand = FreeFile
Open OutdRegCRLFileFullPath For Input As #fhand
Do While EOF(fhand) = False
    Input #fhand, mCRLTitle, mCRLFileName, mCRLDefault
    If Dir(OutdRegCRLFileFullPath(mFileName:=mCRLFileName)) <> "" Then
        cmbCRList.AddItem mCRLTitle & Space(100) & OutdRegCRLFileFullPath(mFileName:=mCRLFileName)
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
Dim mFromOpgVchNo As Long, mToOpgVchNo As Long, mOpgVtmCode As Long
Dim fCRView As Form

mFromOpgVchNo = Val(UnMyNumFmt(mskOpgVchNo(1).Text))
mToOpgVchNo = Val(UnMyNumFmt(mskOpgVchNo(2).Text))
mOpgVtmCode = Val(fcmbVtmName.BoundText)

frmMain.Cryst.Reset
frmMain.Cryst.ReportFileName = Trim(Right(cmbCRList.List(cmbCRList.ListIndex), 100))
frmMain.Cryst.DiscardSavedData = True
frmMain.Cryst.DataFiles(0) = dbComDatabaseFullPath

frmMain.Cryst.SelectionFormula = "{vewOutdReg.OpgVchNo}>=" & CStr(mFromOpgVchNo) & " and {vewOutdReg.OpgVchNo}<=" & CStr(mToOpgVchNo) & " and {vewOutdReg.OpgVtmCode}=" & CStr(mOpgVtmCode) & " and {vewOutdReg.OpgCmpCode}=" & CStr(sFinYrCmpCode)
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
        fcmbVtmName.BoundText = CStr(datRecset.fields("OpgVtmCode"))
        txtVtmName(1).Text = fcmbVtmName.Text
        mskOpgVchNo(1).Text = datRecset.fields("OpgVchNo")
        mskOpgVchNo(2).Text = datRecset.fields("OpgVchNo")
        ' ----------------
        Call AssignPrintPara
        frPrintCRList.ZOrder
        frPrintCRList.Visible = True
        Mfgrd1.Enabled = False
        cmbPrintDest.SetFocus
    End If
    
ElseIf mCallSource = "SaveEvent" Then
    txtVtmName(1).Text = fcmbVtmName.Text
    mskOpgVchNo(1).Text = CStr(Val(UnMyNumFmt(mskOpgVchNo(0).Text)))
    mskOpgVchNo(2).Text = CStr(Val(UnMyNumFmt(mskOpgVchNo(0).Text)))
    ' ----------------
    Call AssignPrintPara
    frPrintCRList.ZOrder
    frPrintCRList.Visible = True
    Mfgrd1.Enabled = False
    cmbPrintDest.SetFocus

End If


End Sub


Rem ------------------------------------------ end of form ---------------------------------------------------
