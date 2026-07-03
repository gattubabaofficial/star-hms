VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmEFamilyMast 
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
      TabIndex        =   18
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
      TabIndex        =   26
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
      TabIndex        =   25
      TabStop         =   0   'False
      Top             =   0
      Width           =   255
   End
   Begin VB.ComboBox cmbFormEntryMode 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   315
      ItemData        =   "EFmlyMst.frx":0000
      Left            =   0
      List            =   "EFmlyMst.frx":000D
      Style           =   1  'Simple Combo
      TabIndex        =   22
      TabStop         =   0   'False
      Text            =   "cmbFormMode"
      Top             =   360
      Width           =   1455
   End
   Begin VB.Frame frFormDtl 
      Appearance      =   0  'Flat
      BackColor       =   &H00A8C8B6&
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
      Height          =   6375
      Left            =   240
      TabIndex        =   21
      Top             =   840
      Width           =   12735
      Begin VB.TextBox txtEfmContPer 
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
         TabIndex        =   7
         Top             =   2520
         Width           =   3975
      End
      Begin VB.TextBox txtEfmRemark 
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
         TabIndex        =   12
         Top             =   4320
         Width           =   5295
      End
      Begin VB.TextBox txtEfmEmail 
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
         TabIndex        =   10
         Top             =   3240
         Width           =   3975
      End
      Begin VB.TextBox txtEfmSMSNo 
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
         TabIndex        =   9
         Top             =   2880
         Width           =   3975
      End
      Begin VB.TextBox txtEfmTelNo 
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
         TabIndex        =   8
         Top             =   2880
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
         TabIndex        =   6
         Top             =   2160
         Width           =   3975
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
         TabIndex        =   5
         Top             =   2160
         Width           =   3975
      End
      Begin VB.TextBox txtEfmAddr 
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
         TabIndex        =   4
         Top             =   1440
         Width           =   5295
      End
      Begin VB.TextBox mskEfmRegNo 
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
         TabIndex        =   13
         Top             =   5160
         Width           =   5295
      End
      Begin VB.TextBox dtpEfmRegDate 
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
      Begin VB.TextBox txtEfgName 
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
         TabIndex        =   11
         Top             =   3960
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
         TabIndex        =   15
         Tag             =   "AhCode"
         Text            =   "__"
         Top             =   5520
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
         TabIndex        =   14
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   5520
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
         TabIndex        =   17
         Top             =   6000
         Width           =   375
      End
      Begin VB.TextBox txtEfmName 
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
         MaxLength       =   60
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
         Caption         =   "Contact Person:"
         BeginProperty Font 
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
         TabIndex        =   63
         Top             =   2520
         Width           =   2415
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
         TabIndex        =   62
         Top             =   4320
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
         TabIndex        =   61
         Top             =   3240
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
         TabIndex        =   60
         Top             =   2880
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
         TabIndex        =   59
         Top             =   2880
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
         TabIndex        =   58
         Top             =   2160
         Width           =   1575
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
         TabIndex        =   57
         Top             =   2160
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
         TabIndex        =   56
         Top             =   1440
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
         TabIndex        =   55
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
         TabIndex        =   54
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
         TabIndex        =   41
         Top             =   5160
         Width           =   2415
      End
      Begin VB.Line Line3 
         Index           =   2
         X1              =   0
         X2              =   12720
         Y1              =   4800
         Y2              =   4800
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
         Y1              =   3720
         Y2              =   3720
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
         TabIndex        =   39
         Top             =   3960
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
         TabIndex        =   16
         Top             =   5880
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
         TabIndex        =   33
         Top             =   5880
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
         TabIndex        =   32
         Top             =   5520
         Width           =   2415
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Family Name:"
         BeginProperty Font 
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
         TabIndex        =   24
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
         TabIndex        =   23
         Top             =   240
         Width           =   2415
      End
   End
   Begin VB.Frame frFormSmry 
      Appearance      =   0  'Flat
      BackColor       =   &H00A8C8B6&
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
      TabIndex        =   20
      Top             =   840
      Width           =   14295
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
         TabIndex        =   38
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
         TabIndex        =   36
         Top             =   360
         Width           =   4215
      End
      Begin VB.Frame frConfigure 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   4095
         Left            =   3120
         TabIndex        =   34
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
            TabIndex        =   28
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
            TabIndex        =   27
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
            TabIndex        =   29
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
            TabIndex        =   30
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
            TabIndex        =   31
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
            TabIndex        =   35
            Top             =   0
            Width           =   6015
         End
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd1 
         Height          =   6615
         Left            =   120
         TabIndex        =   37
         Top             =   720
         Width           =   13935
         _ExtentX        =   24580
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
         TabIndex        =   42
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
            TabIndex        =   53
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
            TabIndex        =   52
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
            TabIndex        =   51
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
            TabIndex        =   50
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
            TabIndex        =   49
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
            TabIndex        =   48
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
            TabIndex        =   47
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
            TabIndex        =   46
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
            TabIndex        =   45
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
            TabIndex        =   44
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
            TabIndex        =   43
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
      Caption         =   "Donor/Patient Family Master"
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
      TabIndex        =   19
      Top             =   0
      Width           =   9015
   End
End
Attribute VB_Name = "frmEFamilyMast"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Dim mFormLoaded As Boolean, mLastKeyPressed As Integer, mMaskKeyPressed As Integer
Dim mFormUIdCode As Long, mFormUIdFileName As String, mFormAcsPermFileName As String
Dim mEfmCode As Long
Dim mRemoteAccess As Boolean, mEntrySaved As Boolean, mEntryAborted As Boolean
Dim dbAcDatabase As New ADODB.Connection, dbBdkDatabase As New ADODB.Connection, dbGrpDatabase As New ADODB.Connection, dbComDatabase As New ADODB.Connection
Dim datRecset As New ADODB.Recordset
Dim mEfmCode_old As Long, mEfmName_old As String, mEfmRegNo_old As Long, mEfmEfgCode_old As Long, mEfmAhCode_old As Long, mEfmAraCode_old As Long
Dim clsAH As clsAccountHead, clsEFM As clsBdkMasterEntry, clsEFG As clsBdkMasterEntry, clsARA As clsComMastEntry, clsSTN As clsComMastEntry, mActiveControl As Object, clsListStru As clsSelectQueryStructure
'Dim clsBOPT As clsBdkOpdOptionsEntry
Dim fcmbAhName As clsComFlexSearch, fcmbAraName As clsComFlexSearch, fcmbStnName As clsComFlexSearch
Dim fcmbEfmName As clsBdkFlexSearch, fcmbEfmRegNo As clsBdkFlexSearch, fcmbEfgName As clsBdkFlexSearch

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
mEfmCode = mAccessCode
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

Public Property Get EfmName() As String
EfmName = txtEfmName.Text
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
        txtEfmName.SetFocus
    End If
End If

End Sub

Private Sub cmdSaveForm_Click()
Call Data_SaveEvent

txtVoid.SetFocus
Call SmryList
txtSearch1Text_InterActiveChange txtEfmName.Text

''datRecset.Find "EfmName='" & txtEfmName.Text & "'", Start:=1
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
            
            txtEfmName.SetFocus
        End If
    Else
        txtEfmName.SetFocus
    End If
End If
cmdSaveForm.Enabled = True

End Sub

Private Sub dtpEfmRegDate_GotFocus()
FlashActiveControl dtpEfmRegDate, True
End Sub

Private Sub dtpEfmRegDate_LostFocus()
FlashActiveControl dtpEfmRegDate, False
End Sub

Private Sub dtpEfmRegDate_Validate(Cancel As Boolean)
dtpEfmRegDate.Text = ToMyDate(dtpEfmRegDate.Text)
If IsDate(dtpEfmRegDate.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpEfmRegDate.SetFocus
    Cancel = True
End If

End Sub

Private Sub Form_Activate()
If mFormLoaded = False Then
    If mRemoteAccess = True Then
        MoveRecToFirst datRecset
        ShowRecActiveFlexRow datRecset, Mfgrd1
        Mfgrd1.SetFocus
        If mEfmCode = 0 Then
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

mFormUIdFileName = "EFamilyMast.Uid"
mFormAcsPermFileName = "EFamilyMast.Acp"
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

Set clsAH = New clsAccountHead
Set clsAH.dbAcDatabase = dbAcDatabase
Set clsAH.dbGrpDatabase = dbGrpDatabase

Set clsListStru = New clsSelectQueryStructure

'Set clsBOPT = New clsBdkOpdOptionsEntry
'clsBOPT.blnEFamilyMastOptMast = True
'clsBOPT.Init
'clsBOPT.GetEFamilyMastOptData

Set clsEFM = New clsBdkMasterEntry
Set clsEFM.dbAcDatabase = dbAcDatabase
Set clsEFM.dbBdkDatabase = dbBdkDatabase
clsEFM.blnEFamilyMast = True
clsEFM.Init

Set clsEFG = New clsBdkMasterEntry
Set clsEFG.dbBdkDatabase = dbBdkDatabase
clsEFG.blnEFmlyCatgMast = True
clsEFG.Init

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

Set fcmbEfgName = New clsBdkFlexSearch
Set fcmbEfgName.dbBdkDatabase = dbBdkDatabase
fcmbEfgName.blnEFmlyCatgMastList = True
fcmbEfgName.Init

Set fcmbAraName = New clsComFlexSearch
Set fcmbAraName.dbAcDatabase = dbAcDatabase
fcmbAraName.blnAreaMastList = True
fcmbAraName.Init

Set fcmbStnName = New clsComFlexSearch
Set fcmbStnName.dbAcDatabase = dbAcDatabase
fcmbStnName.blnStationMastList = True
fcmbStnName.Init

Set fcmbEfmRegNo = New clsBdkFlexSearch
Set fcmbEfmRegNo.dbBdkDatabase = dbBdkDatabase
Set fcmbEfmRegNo.dbComDatabase = dbComDatabase
fcmbEfmRegNo.blnEFamilyMastListByRegNo = True
fcmbEfmRegNo.Init

Set fcmbEfmName = New clsBdkFlexSearch
Set fcmbEfmName.dbBdkDatabase = dbBdkDatabase
Set fcmbEfmName.dbComDatabase = dbComDatabase
fcmbEfmName.blnEFamilyMastListByName = True
fcmbEfmName.Init

If mRemoteAccess = True Then
    datRecset.open "Select * from EFamilyMast left join AchdMast on EFamilyMast.EfmAhCode = AchdMast.AhCode where EfmCode = " & CStr(mEfmCode) & " order by EfmName", dbComDatabase, adOpenKeyset, adLockOptimistic
Else
    datRecset.open "Select * from EFamilyMast left join AchdMast on EFamilyMast.EfmAhCode = AchdMast.AhCode order by EfmName", dbComDatabase, adOpenKeyset, adLockOptimistic
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
'Set clsBOPT = Nothing
Set clsAH = Nothing
Set clsEFM = Nothing
Set clsEFG = Nothing
Set clsARA = Nothing
Set clsSTN = Nothing
Set fcmbEfmRegNo = Nothing
Set fcmbEfmName = Nothing
Set fcmbAhName = Nothing
Set fcmbEfgName = Nothing
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
Dim mEfmRegNo As Long

Data_Verify = False
If Val(mskFormBoundField.Text) < 1 And FormAddEditMode = cFORM_EDITMODE Then
    ErrorBox "Invalid Key Value !!!"
    txtEfmName.SetFocus
    GoTo EndSub
End If
If Trim(txtEfmName.Text) = "" Then
    ErrorBox "Invalid Input !!!"
    txtEfmName.SetFocus
    GoTo EndSub
End If
mEfmRegNo = Val(UnMyNumFmt(mskEfmRegNo.Text))
If mEfmRegNo < 0 Then
    ErrorBox "Invalid Input !!!"
    mskEfmRegNo.SetFocus
    GoTo EndSub
Else
    If mEfmRegNo <> mEfmRegNo_old Or FormAddEditMode = cFORM_ADDMODE Then
'        If FormAddEditMode = cFORM_ADDMODE And mEfmRegNo <> mEfmRegNo_old And clsBOPT.mEfmRegNoAddModeChange_bln = False Then
'            AlertBox "Change Prohibited in Add Mode !!!"
'            mskEfmRegNo.Text = ToMyNumFmt(mEfmRegNo_old, mDecimals:=0)
'            mskEfmRegNo.SetFocus
'            GoTo EndSub
'
'        ElseIf FormAddEditMode = cFORM_EDITMODE And mEfmRegNo <> mEfmRegNo_old And clsBOPT.mEfmRegNoEditModeChange_bln = False Then
'            AlertBox "Change Prohibited in Edit Mode !!!"
'            mskEfmRegNo.Text = ToMyNumFmt(mEfmRegNo_old, mDecimals:=0)
'            mskEfmRegNo.SetFocus
'            GoTo EndSub
'
'        ElseIf mEfmRegNo = 0 And clsBOPT.mEfmRegNoNotZero_bln = True Then
'            AlertBox "Prohibited Zero Donor/Patient Family Reg.No. !!!"
'            If FormAddEditMode = cFORM_ADDMODE Then
'                If clsBOPT.mEfmRegNoAutoNumber_bln = True Then
'                    mEfmRegNo = GetNextSeqno(dbBdkDatabase, "EFamilyMast", "EfmRegNo")
'                    mskEfmRegNo.Text = ToMyNumFmt(mEfmRegNo, mDecimals:=0)
'                End If
'            Else
'                mskEfmRegNo.Text = ToMyNumFmt(mEfmRegNo_old, mDecimals:=0)
'            End If
'            mskEfmRegNo.SetFocus
'            GoTo EndSub
'
'        ElseIf mEfmRegNo <> 0 Then
        If mEfmRegNo <> 0 Then
            If ChkIsDuplicate(dbBdkDatabase, "EFamilyMast", "EfmRegNo", mEfmRegNo, "EfmCode", mEfmCode) = True Then
                ErrorBox "Duplicate Input !!!"
                mskEfmRegNo.SetFocus
                ' -----------
                If FormAddEditMode = cFORM_ADDMODE Then
                    'If clsBOPT.mEfmRegNoAutoNumber_bln = True Then
                        mEfmRegNo = GetNextSeqno(dbBdkDatabase, "EFamilyMast", "EfmRegNo")
                    'End If
                Else
                    mEfmRegNo = mEfmRegNo_old
                End If
                mskEfmRegNo.Text = ToMyNumFmt(mEfmRegNo, mDecimals:=0)
                GoTo EndSub
            End If
            
        End If
    End If
End If
If IsDate(dtpEfmRegDate.Text) = False Then
    ErrorBox "Invalid Input !!!"
    dtpEfmRegDate.SetFocus
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
If Val(fcmbEfgName.BoundText) <= 0 Then
    ErrorBox "Invalid Selection !!!"
    txtEfgName.SetFocus
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
Dim mEfmRegNo As Long
Data_NetwAuth = False

mEfmRegNo = Val(UnMyNumFmt(mskEfmRegNo.Text))
If mEfmRegNo <> mEfmRegNo_old Or FormAddEditMode = cFORM_ADDMODE Then
    If mEfmRegNo <> 0 Then
        If ChkIsDuplicate(dbBdkDatabase, "EFamilyMast", "EfmRegNo", mEfmRegNo, "EfmCode", mEfmCode) = True Then
            ErrorBox "Duplicate Input !!!"
            mskEfmRegNo.SetFocus
            ' -------
            If FormAddEditMode = cFORM_ADDMODE Then
                'If clsBOPT.mEfmRegNoAutoNumber_bln = True Then
                    mEfmRegNo = GetNextSeqno(dbBdkDatabase, "EFamilyMast", "EfmRegNo")
                'End If
            Else
                mEfmRegNo = mEfmRegNo_old
            End If
            mskEfmRegNo.Text = ToMyNumFmt(mEfmRegNo, mDecimals:=0)
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

Private Sub mskEfmRegNo_GotFocus()
FlashActiveControl mskEfmRegNo, True
End Sub

Private Sub mskEfmRegNo_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    If fcmbEfmRegNo.CallFromText_Change = False Then
        fcmbEfmRegNo.CallFromText_Change = True
        If InterActiveChange(mskEfmRegNo) = True Then
            fcmbEfmRegNo.UserText = Array(mskEfmRegNo.Text, mskEfmRegNo.SelStart)
            fcmbEfmRegNo.Show
            If fcmbEfmRegNo.ListSelected = True And Val(fcmbEfmRegNo.BoundText) > 0 Then
                If FormAddEditMode = cFORM_ADDMODE Then
                    clsEFM.EndMast mEfmCode
                    
                    FormAddEditMode = cFORM_EDITMODE
                    mEfmCode = Val(fcmbEfmRegNo.BoundText)
                    If clsEFM.BeginMast(mEfmCode) = True Then
                        mEfmCode = clsEFM.ActiveCode
                    Else
                        mEfmCode = 0
                    End If
                    ShowEFmlyData mEfmCode
                    Call StoreEFmlyOldData
                    Rem SendKeys "{tab}"
                Else
                    AlertBox "Prohibited in Edit Mode !!!"
                End If
            End If
        End If
        fcmbEfmRegNo.CallFromText_Change = False
    End If
ElseIf MyAddNewKey(Shift, KeyCode) = True Then
    If FormAddEditMode = cFORM_ADDMODE Then
        clsEFM.EndMast mEfmCode
        
        If clsEFM.BeginMast(0) = True Then
            mEfmCode = clsEFM.ActiveCode
        Else
            mEfmCode = 0
        End If
        ShowEFmlyData mEfmCode
        Call ShowEFmlyDefData
        Call StoreEFmlyOldData
    Else
        AlertBox "Prohibited in Edit Mode !!!"
    End If
End If

End Sub

Private Sub mskEfmRegNo_LostFocus()
FlashActiveControl mskEfmRegNo, False
End Sub

Private Sub mskEfmRegNo_Validate(Cancel As Boolean)
Dim mEfmRegNo As Long

mEfmRegNo = Val(UnMyNumFmt(mskEfmRegNo.Text))
If mEfmRegNo < 0 Then
    ErrorBox "Invalid Input !!!"
    Cancel = True
    mskEfmRegNo.SetFocus
Else
    If mEfmRegNo <> mEfmRegNo_old Or FormAddEditMode = cFORM_ADDMODE Then
'        If FormAddEditMode = cFORM_ADDMODE And mEfmRegNo <> mEfmRegNo_old And clsBOPT.mEfmRegNoAddModeChange_bln = False Then
'            AlertBox "Change Prohibited in Add Mode !!!"
'            mskEfmRegNo.Text = ToMyNumFmt(mEfmRegNo_old, mDecimals:=0)
'            Cancel = True
'            mskEfmRegNo.SetFocus
'
'        ElseIf FormAddEditMode = cFORM_EDITMODE And mEfmRegNo <> mEfmRegNo_old And clsBOPT.mEfmRegNoEditModeChange_bln = False Then
'            AlertBox "Change Prohibited in Edit Mode !!!"
'            mskEfmRegNo.Text = ToMyNumFmt(mEfmRegNo_old, mDecimals:=0)
'            Cancel = True
'            mskEfmRegNo.SetFocus
'
'        ElseIf mEfmRegNo = 0 And clsBOPT.mEfmRegNoNotZero_bln = True Then
'            AlertBox "Prohibited Zero Donor/Patient Family Reg.No. !!!"
'            If FormAddEditMode = cFORM_ADDMODE Then
'                If clsBOPT.mEfmRegNoAutoNumber_bln = True Then
'                    mEfmRegNo = GetNextSeqno(dbBdkDatabase, "EFamilyMast", "EfmRegNo")
'                    mskEfmRegNo.Text = ToMyNumFmt(mEfmRegNo, mDecimals:=0)
'                End If
'            Else
'                mskEfmRegNo.Text = ToMyNumFmt(mEfmRegNo_old, mDecimals:=0)
'            End If
'            Cancel = True
'            mskEfmRegNo.SetFocus
'        ElseIf mEfmRegNo <> 0 Then
        If mEfmRegNo <> 0 Then
            If ChkIsDuplicate(dbBdkDatabase, "EFamilyMast", "EfmRegNo", mEfmRegNo, "EfmCode", mEfmCode) = True Then
                ErrorBox "Duplicate Input !!!"
                Cancel = True
                mskEfmRegNo.SetFocus
                ' -----------
                If FormAddEditMode = cFORM_ADDMODE Then
                    'If clsBOPT.mEfmRegNoAutoNumber_bln = True Then
                        mEfmRegNo = GetNextSeqno(dbBdkDatabase, "EFamilyMast", "EfmRegNo")
                    'End If
                Else
                    mEfmRegNo = mEfmRegNo_old
                End If
                mskEfmRegNo.Text = ToMyNumFmt(mEfmRegNo, mDecimals:=0)
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
    Call ShowEFmlyBal
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
    If mEfmAraCode_old <> Val(fcmbAraName.BoundText) Or Val(fcmbStnName.BoundText) = 0 Then
        AutoInitStationFromArea cnn:=dbAcDatabase, txtStnName:=txtStnName, fcmbStnName:=fcmbStnName, mAraCode:=Val(fcmbAraName.BoundText)
'        clsARA.GetData Val(fcmbAraName.BoundText)
'        fcmbStnName.Requery
'        fcmbStnName.BoundText = CStr(clsARA.mAraStnCode_lng): txtStnName.Text = fcmbStnName.Text
    End If
End If

End Sub

Private Sub txtEfgName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    Call txtEfgName_Change
End If

End Sub

Private Sub txtEfmAddr_GotFocus()
FlashActiveControl txtEfmAddr, True
End Sub

Private Sub txtEfmAddr_LostFocus()
FlashActiveControl txtEfmAddr, False
End Sub

Private Sub txtEfmAddr_Validate(Cancel As Boolean)
txtEfmAddr.Text = ToMyWord(txtEfmAddr.Text)
End Sub

Private Sub txtEfmEmail_GotFocus()
FlashActiveControl txtEfmEmail, True
End Sub

Private Sub txtEfmEmail_LostFocus()
FlashActiveControl txtEfmEmail, False
End Sub

Private Sub txtEfmName_GotFocus()
FlashActiveControl txtEfmName, True
End Sub

Private Sub txtEfmName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    If fcmbEfmName.CallFromText_Change = False Then
        fcmbEfmName.CallFromText_Change = True
        If InterActiveChange(txtEfmName) = True Then
            fcmbEfmName.UserText = Array(txtEfmName.Text, txtEfmName.SelStart)
            fcmbEfmName.Show
            If fcmbEfmName.ListSelected = True And Val(fcmbEfmName.BoundText) > 0 Then
                If FormAddEditMode = cFORM_ADDMODE Then
                    clsEFM.EndMast mEfmCode
                    
                    FormAddEditMode = cFORM_EDITMODE
                    mEfmCode = Val(fcmbEfmName.BoundText)
                    If clsEFM.BeginMast(mEfmCode) = True Then
                        mEfmCode = clsEFM.ActiveCode
                    Else
                        mEfmCode = 0
                    End If
                    ShowEFmlyData mEfmCode
                    Call StoreEFmlyOldData
                    Rem SendKeys "{tab}"
                Else
                     AlertBox "Prohibited in Edit Mode !!!"
                End If
            End If
        End If
        fcmbEfmName.CallFromText_Change = False
    End If
ElseIf MyAddNewKey(Shift, KeyCode) = True Then
    If FormAddEditMode = cFORM_ADDMODE Then
        clsEFM.EndMast mEfmCode
        
        If clsEFM.BeginMast(0) = True Then
            mEfmCode = clsEFM.ActiveCode
        Else
            mEfmCode = 0
        End If
        ShowEFmlyData mEfmCode
        Call ShowEFmlyDefData
        Call StoreEFmlyOldData
    Else
        AlertBox "Prohibited in Edit Mode !!!"
    End If
End If

End Sub

Private Sub txtEfmName_LostFocus()
FlashActiveControl txtEfmName, False
End Sub

Private Sub txtEfmName_Validate(Cancel As Boolean)
txtEfmName.Text = ToMyWord(txtEfmName.Text)
If Trim(txtEfmName.Text) = "" Then
    ErrorBox "Invalid Input !!!"
    Cancel = True
    txtEfmName.SetFocus
End If

End Sub

Private Sub Data_AddEvent()

If CanUserAddOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If clsEFM.BeginMast(0) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_ADDMODE

clsEFM.Clear
mEfmCode = clsEFM.ActiveCode

ShowEFmlyData mEfmCode
Call ShowEFmlyDefData
Call StoreEFmlyOldData

Call ShowEntryMode(True)
txtEfmName.SetFocus

End Sub

Private Sub Data_EditEvent()

If CanUserEditOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If clsEFM.BeginMast(datRecset.fields("EfmCode")) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_EDITMODE

With datRecset
mEfmCode = .fields("EfmCode")
clsEFM.GetData mEfmCode
End With

ShowEFmlyData mEfmCode
Call StoreEFmlyOldData

Call ShowEntryMode(True)
txtEfmName.SetFocus

End Sub

Private Sub ShowEFmlyData(ByVal mEfmCode As Long)

With clsEFM
.GetData mEfmCode

mskFormBoundField.Text = mEfmCode
txtEfmName.Text = .mName_str
mskEfmRegNo.Text = ToMyNumFmt(.mEfmRegNo_lng, mDecimals:=0)
dtpEfmRegDate.Text = Dtoc(.mEfmRegDate_dt)
fcmbEfgName.BoundText = CStr(.mEfmEfgCode_lng): txtEfgName.Text = fcmbEfgName.Text
txtEfmAddr.Text = .mEfmAddr_str
fcmbAraName.BoundText = CStr(.mEfmAraCode_lng): txtAraName.Text = fcmbAraName.Text
fcmbStnName.BoundText = CStr(.mEfmStnCode_lng): txtStnName.Text = fcmbStnName.Text
txtEfmContPer.Text = .mEfmContPer_str
txtEfmTelNo.Text = .mEfmTelNo_str
txtEfmSMSNo.Text = .mEfmSMSNo_str
txtEfmEmail.Text = .mEfmEmail_str
txtEfmRemark.Text = .mEfmRemark_str
fcmbAhName.BoundText = CStr(.mEfmAhCode_lng): txtAhName.Text = fcmbAhName.Text
End With

mskAhOpBal.Text = ToMyNumFmt(0)
lblAhCurBal.Caption = ToMyAcFmt(0)
txtDrCrFlag.Text = SenseDrCrFlag(0)

Call ShowEFmlyBal

End Sub

Private Sub ShowEFmlyDefData()
Dim mEfmRegNo As Long

'If clsBOPT.mEfmRegNoAutoNumber_bln = True Then
    mEfmRegNo = GetNextSeqno(dbBdkDatabase, "EFamilyMast", "EfmRegNo")
    mskEfmRegNo.Text = ToMyNumFmt(mEfmRegNo, mDecimals:=0)
'End If
dtpEfmRegDate.Text = Dtoc(DefaultEntryDate)
fcmbAraName.BoundText = GetLastValueFromTableCol(cnn:=dbBdkDatabase, mTableName:="EFamilyMast", mColumnName:="EfmAraCode", mOrderByColName:="EfmCode", mRtnDefValue:=0)
fcmbStnName.BoundText = GetLastValueFromTableCol(cnn:=dbBdkDatabase, mTableName:="EFamilyMast", mColumnName:="EfmStnCode", mOrderByColName:="EfmCode", mRtnDefValue:=0)
fcmbEfgName.BoundText = GetLastValueFromTableCol(cnn:=dbBdkDatabase, mTableName:="EFamilyMast", mColumnName:="EfmEfgCode", mOrderByColName:="EfmCode", mRtnDefValue:=0)
fcmbAhName.BoundText = GetLastValueFromTableCol(cnn:=dbBdkDatabase, mTableName:="EFamilyMast", mColumnName:="EfmAhCode", mOrderByColName:="EfmCode", mRtnDefValue:=0)

txtAraName.Text = fcmbAraName.Text
txtStnName.Text = fcmbStnName.Text
txtEfgName.Text = fcmbEfgName.Text
txtAhName.Text = fcmbAhName.Text

'fcmbAraName.BoundText = CStr(clsBOPT.GetEFamilyMastOptBoundCode("EfmAraCode")): txtAraName.Text = fcmbAraName.Text
'fcmbStnName.BoundText = CStr(clsBOPT.GetEFamilyMastOptBoundCode("EfmStnCode")): txtStnName.Text = fcmbStnName.Text
'fcmbEfgName.BoundText = CStr(clsBOPT.GetEFamilyMastOptBoundCode("EfmEfgCode")): txtEfgName.Text = fcmbEfgName.Text
'fcmbAhName.BoundText = CStr(clsBOPT.GetEFamilyMastOptBoundCode("EfmAhCode")): txtAhName.Text = fcmbAhName.Text

Call ShowEFmlyBal

End Sub

Private Sub StoreEFmlyOldData()

mEfmCode_old = mEfmCode
mEfmName_old = txtEfmName.Text
mEfmRegNo_old = Val(UnMyNumFmt(mskEfmRegNo.Text))
mEfmEfgCode_old = Val(fcmbEfgName.BoundText)
mEfmAhCode_old = Val(fcmbAhName.BoundText)
mEfmAraCode_old = Val(fcmbAraName.BoundText)

End Sub

Private Sub ShowEFmlyBal()
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
With clsEFM
If FormAddEditMode = cFORM_ADDMODE Then
    .Clear
Else
    .GetData mEfmCode
End If
.mName_str = txtEfmName.Text
.mEfmRegNo_lng = Val(UnMyNumFmt(mskEfmRegNo.Text))
.mEfmRegDate_dt = Ctod(dtpEfmRegDate.Text)
.mEfmEfgCode_lng = Val(fcmbEfgName.BoundText)
.mEfmAddr_str = txtEfmAddr.Text
.mEfmAraCode_lng = Val(fcmbAraName.BoundText)
.mEfmStnCode_lng = Val(fcmbStnName.BoundText)
.mEfmContPer_str = txtEfmContPer.Text
.mEfmTelNo_str = txtEfmTelNo.Text
.mEfmSMSNo_str = txtEfmSMSNo.Text
.mEfmEmail_str = txtEfmEmail.Text
.mEfmRemark_str = txtEfmRemark.Text
.mEfmAhCode_lng = Val(fcmbAhName.BoundText)

If FormAddEditMode = cFORM_ADDMODE Then
    .AddNew
    mskFormBoundField.Text = .mCode_lng
Else
    .Update mEfmCode
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
        If mEfmAhCode_old <> Val(fcmbAhName.BoundText) Or FormAddEditMode = cFORM_ADDMODE Then
            clsAH.UpdateDependency mEfmAhCode_old, False
            clsAH.UpdateDependency Val(fcmbAhName.BoundText), True
        End If
    End If
    
    
    Rem updating user editing carry forward features
'    clsBOPT.mEfmAraCodeOld_lng = clsEFM.mEfmAraCode_lng
'    clsBOPT.mEfmStnCodeOld_lng = clsEFM.mEfmStnCode_lng
'    clsBOPT.mEfmEfgCodeOld_lng = clsEFM.mEfmEfgCode_lng
'    clsBOPT.mEfmAhCodeOld_lng = clsEFM.mEfmAhCode_lng
'    clsBOPT.UpdateEFamilyMastOld
    
    mEntrySaved = True
Else
    Call Data_CancelEvent
    ErrorBox "Entry Cancelled !!!"
End If

End With

End Sub

Private Sub Data_DeleteEvent()
Dim mDeleteit As Boolean, mRecAbsPos As Long, mEfmAhCode As Long

If CanUserDeleteOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If (datRecset.EOF Or datRecset.BOF) = True Then
    Exit Sub
End If

mEfmCode = datRecset.fields("EfmCode")
mEfmAhCode = datRecset.fields("EfmAhCode")
mRecAbsPos = datRecset.AbsolutePosition

If clsEFM.CanDeleteMast(mEfmCode) = True Then
    txtVoid.SetFocus
    If clsEFM.BeginMast(mEfmCode) = True Then
        clsEFM.DeleteMast mEfmCode
        clsEFM.UpdateMast mEfmCode
        clsEFM.EndMast mEfmCode
        
        Call SmryList
        If datRecset.RecordCount > mRecAbsPos And mRecAbsPos > 0 Then
            datRecset.Move mRecAbsPos - 1, 1
        Else
            MoveRecToLast datRecset
        End If
        
        clsAH.UpdateDependency mEfmAhCode, False
    End If
    ShowRecActiveFlexRow datRecset, Mfgrd1
    Mfgrd1.SetFocus
Else
    Mfgrd1.SetFocus
End If

End Sub

Private Sub Data_CancelEvent()
clsEFM.CancelMast mEfmCode
clsEFM.EndMast mEfmCode
mEntryAborted = True

End Sub

Private Sub txtEfmRemark_GotFocus()
FlashActiveControl txtEfmRemark, True
End Sub

Private Sub txtEfmRemark_LostFocus()
FlashActiveControl txtEfmRemark, False
End Sub

Private Sub txtEfmSMSNo_GotFocus()
FlashActiveControl txtEfmSMSNo, True
End Sub

Private Sub txtEfmSMSNo_LostFocus()
FlashActiveControl txtEfmSMSNo, False
End Sub

Private Sub txtEfmTelNo_GotFocus()
FlashActiveControl txtEfmTelNo, True
End Sub

Private Sub txtEfmTelNo_LostFocus()
FlashActiveControl txtEfmTelNo, False
End Sub

Private Sub txtEfgName_Change()
If fcmbEfgName.CallFromText_Change = False Then
    fcmbEfgName.CallFromText_Change = True
    If InterActiveChange(txtEfgName) = True Then
        fcmbEfgName.UserText = Array(txtEfgName.Text, txtEfgName.SelStart)
        fcmbEfgName.Show
        txtEfgName.Text = fcmbEfgName.Text
        If fcmbEfgName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbEfgName.CallFromText_Change = False
End If

End Sub

Private Sub txtEfgName_GotFocus()
FlashActiveControl txtEfgName, True
End Sub

Private Sub txtEfgName_LostFocus()
FlashActiveControl txtEfgName, False
End Sub

Private Sub txtEfgName_Validate(Cancel As Boolean)
If Val(fcmbEfgName.BoundText) <= 0 Then
    ErrorBox "Invalid Selection !!!"
    txtEfgName.SetFocus
    Cancel = True
Else
    If mEfmEfgCode_old <> Val(fcmbEfgName.BoundText) Or FormAddEditMode = cFORM_ADDMODE Then
        clsEFG.GetData Val(fcmbEfgName.BoundText)
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
clsListStru.AddFields mExpr:="EfmCode", mAttrib:=cFAT_SYSTEM
clsListStru.AddFields mExpr:="EfmName", mTitle:="Family Name", mAlign:=1, mWidth:=3500, mShowItem:=True
clsListStru.AddFields mExpr:="EfmRegNo", mTitle:="Reg.No", mAlign:=7, mWidth:=1500, mShowItem:=True
clsListStru.AddFields mExpr:="EfmAddr", mTitle:="Address", mAlign:=1, mWidth:=2500, mShowItem:=True
clsListStru.AddFields mExpr:="EfmAraName", mTitle:="Area", mAlign:=1, mWidth:=1750, mShowItem:=True
clsListStru.AddFields mExpr:="EfmStnName", mTitle:="Station", mAlign:=1, mWidth:=1750, mShowItem:=True
'clsListStru.AddFields mExpr:="AhOpBal", mTitle:="Op.Balance", mAlign:=7, mWidth:=1750, mShowItem:=False
'clsListStru.AddFields mExpr:="AhOpDrBal", mTitle:="Op.Dr.Bal", mAlign:=7, mWidth:=1750, mShowItem:=False
'clsListStru.AddFields mExpr:="AhOpCrBal", mTitle:="Op.Cr.Bal", mAlign:=7, mWidth:=1750, mShowItem:=False
'clsListStru.AddFields mExpr:="AhCurBal", mTitle:="Cur.Balance", mAlign:=7, mWidth:=1750, mShowItem:=False
'clsListStru.AddFields mExpr:="AhCurDrBal", mTitle:="Cur.Dr.Bal", mAlign:=7, mWidth:=1750, mShowItem:=False
'clsListStru.AddFields mExpr:="AhCurCrBal", mTitle:="Cur.Cr.Bal", mAlign:=7, mWidth:=1750, mShowItem:=False
clsListStru.AddFields mExpr:="EfmEfgName", mTitle:="Category", mAlign:=1, mWidth:=2000, mShowItem:=True
'clsListStru.AddFields mExpr:="EfmAhName", mTitle:="Account Name", mAlign:=1, mWidth:=2000, mShowItem:=True

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
MoveRecToFirst datRecset
With datRecset
If .RecordCount > 0 Then
    Do While .EOF = False
        clsEFG.GetData .fields("EfmEfgCode")
        clsARA.GetData .fields("EfmAraCode")
        clsSTN.GetData .fields("EfmStnCode")
        
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EfmCode")) = .fields("EfmCode")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EfmName")) = .fields("EfmName")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EfmRegNo")) = .fields("EfmRegNo")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EfmAddr")) = .fields("EfmAddr")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EfmAraName")) = clsARA.mName_str
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EfmStnName")) = clsSTN.mName_str
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EfmEfgName")) = clsEFG.mName_str
        'Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("EfmAhName")) = .fields("AhName")
'        If chkOpBal.Value = 1 Then
'            If chkCombinedOpBal.Value = 1 Then
'                aAcntBal = clsAH.GetAhOpnBal(.fields("EfmAhCode"), mDrCrSeperated:=False)
'
'                mBal = aAcntBal(0)
'
'                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("AhOpBal")) = ToMyAcFmt(mBal)
'            Else
'                aAcntBal = clsAH.GetAhOpnBal(.fields("EfmAhCode"), mDrCrSeperated:=True)
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
'                aAcntBal = clsAH.GetAhCurBal(.fields("EfmAhCode"), sFinYrEndDate, mDrCrSeperated:=False)
'
'                mBal = aAcntBal(0)
'
'                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("AhCurBal")) = ToMyAcFmt(mBal)
'            Else
'                aAcntBal = clsAH.GetAhCurBal(.fields("EfmAhCode"), sFinYrEndDate, mDrCrSeperated:=True)
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
    aAhOpBal = clsAH.GetAhOpnBal(datRecset.fields("EfmAhCode"), mDrCrSeperated:=True)
    mOpnDrAmtTot = mOpnDrAmtTot + aAhOpBal(0)
    mOpnCrAmtTot = mOpnCrAmtTot + aAhOpBal(1)
    
    Rem current balance
    aAhCurBal = clsAH.GetAhCurBal(datRecset.fields("EfmAhCode"), sFinYrEndDate, mDrCrSeperated:=True)
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

Private Sub txtEfmContPer_GotFocus()
FlashActiveControl txtEfmContPer, True
End Sub

Private Sub txtEfmContPer_LostFocus()
FlashActiveControl txtEfmContPer, False
End Sub

Private Sub txtEfmContPer_Validate(Cancel As Boolean)
txtEfmContPer.Text = ToMyWord(txtEfmContPer.Text)
End Sub

Private Sub txtList1Col_DblClick(Index As Integer)
Call Mfgrd1_DblClick
End Sub

Private Sub txtList1Col_GotFocus(Index As Integer)
Mfgrd1.SetFocus
End Sub

Private Sub txtSearch1Text_InterActiveChange(Optional ByVal mText)
mText = IIf(IsMissing(mText) = True, txtSearch1Text.Text, mText)
SearchFlex Mfgrd1, clsListStru.GetItemIndex("EfmName"), mText
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

