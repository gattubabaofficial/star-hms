VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmBedMast 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   ClientHeight    =   9090
   ClientLeft      =   60
   ClientTop       =   60
   ClientWidth     =   15240
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
   ScaleHeight     =   9090
   ScaleWidth      =   15240
   ShowInTaskbar   =   0   'False
   Begin VB.TextBox txtVoid 
      CausesValidation=   0   'False
      Height          =   375
      Left            =   120
      TabIndex        =   15
      TabStop         =   0   'False
      Text            =   "Void"
      Top             =   8760
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
      TabIndex        =   23
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
      TabIndex        =   22
      TabStop         =   0   'False
      Top             =   0
      Width           =   255
   End
   Begin VB.ComboBox cmbFormEntryMode 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   315
      ItemData        =   "BedMast.frx":0000
      Left            =   0
      List            =   "BedMast.frx":000D
      Style           =   1  'Simple Combo
      TabIndex        =   19
      TabStop         =   0   'False
      Text            =   "cmbFormMode"
      Top             =   360
      Width           =   1455
   End
   Begin VB.Frame frFormDtl 
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
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
      Height          =   6855
      Left            =   240
      TabIndex        =   18
      Top             =   960
      Width           =   10095
      Begin VB.TextBox mskBdmDiscPer 
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
         Left            =   4560
         TabIndex        =   8
         Tag             =   "AhCode"
         Text            =   "0.00 %"
         Top             =   3840
         Width           =   1335
      End
      Begin VB.CheckBox chkBdmDiscAllowed 
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
         Left            =   840
         TabIndex        =   7
         Top             =   3840
         Width           =   2415
      End
      Begin VB.CheckBox chkBdmFreeAllot 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Free Allotement:"
         BeginProperty Font 
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
         Left            =   840
         TabIndex        =   11
         Top             =   5280
         Width           =   2415
      End
      Begin VB.ComboBox cmbBdmChkOutTimeBasis 
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
         Left            =   3000
         Style           =   2  'Dropdown List
         TabIndex        =   9
         Top             =   4320
         Width           =   3015
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
         Left            =   3000
         MaxLength       =   50
         TabIndex        =   4
         Top             =   2400
         Width           =   5295
      End
      Begin VB.TextBox txtBdmChkTime_str 
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
         Left            =   3000
         TabIndex        =   10
         Tag             =   "AhCode"
         Text            =   "00:00"
         Top             =   4800
         Width           =   1095
      End
      Begin VB.TextBox txtBdmRemark 
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
         Left            =   3000
         MaxLength       =   50
         TabIndex        =   13
         Top             =   6240
         Width           =   5295
      End
      Begin VB.TextBox mskBdmCharges 
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
         Left            =   3000
         TabIndex        =   6
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   3360
         Width           =   1455
      End
      Begin VB.TextBox txtWrdName 
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
         Left            =   3000
         MaxLength       =   50
         TabIndex        =   3
         Top             =   1920
         Width           =   5295
      End
      Begin VB.TextBox txtFlrName 
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
         Left            =   3000
         MaxLength       =   50
         TabIndex        =   2
         Top             =   1440
         Width           =   5295
      End
      Begin VB.CheckBox chkBdmShowInList 
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
         Left            =   840
         TabIndex        =   12
         Top             =   5760
         Width           =   2415
      End
      Begin VB.TextBox mskBdmIndex 
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
         Left            =   3000
         TabIndex        =   5
         Tag             =   "AhCode"
         Text            =   "0"
         Top             =   2880
         Width           =   855
      End
      Begin VB.CommandButton cmdSaveForm 
         Appearance      =   0  'Flat
         BackColor       =   &H80000009&
         Caption         =   "      &Save"
         Height          =   255
         Left            =   9600
         Style           =   1  'Graphical
         TabIndex        =   14
         Top             =   6480
         Width           =   375
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
         Left            =   3000
         MaxLength       =   50
         TabIndex        =   1
         Top             =   960
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
         Left            =   3000
         TabIndex        =   0
         Tag             =   "AhCode"
         Text            =   "-1"
         Top             =   480
         Width           =   1335
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Discount %:"
         BeginProperty Font 
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
         Left            =   3360
         TabIndex        =   36
         Top             =   3840
         Width           =   1215
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Check Out Time Basis:"
         BeginProperty Font 
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
         Left            =   840
         TabIndex        =   35
         Top             =   4320
         Width           =   2175
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Linked Service:"
         BeginProperty Font 
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
         Left            =   840
         TabIndex        =   34
         Top             =   2400
         Width           =   1695
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Check Out Time:"
         BeginProperty Font 
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
         Left            =   840
         TabIndex        =   33
         Top             =   4800
         Width           =   1695
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
         Index           =   9
         Left            =   840
         TabIndex        =   32
         Top             =   6240
         Width           =   1815
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Charges:"
         BeginProperty Font 
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
         Left            =   840
         TabIndex        =   31
         Top             =   3360
         Width           =   1695
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Ward Name:"
         BeginProperty Font 
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
         Left            =   840
         TabIndex        =   30
         Top             =   1920
         Width           =   1695
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Floor Name:"
         BeginProperty Font 
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
         Left            =   840
         TabIndex        =   29
         Top             =   1440
         Width           =   1695
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Index Order:"
         BeginProperty Font 
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
         TabIndex        =   28
         Top             =   2880
         Width           =   1695
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
         Index           =   0
         Left            =   840
         TabIndex        =   21
         Top             =   960
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
         Index           =   0
         Left            =   840
         TabIndex        =   20
         Top             =   480
         Width           =   855
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
      Height          =   5535
      Left            =   240
      TabIndex        =   17
      Top             =   960
      Width           =   14775
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
         TabIndex        =   26
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
         TabIndex        =   24
         Top             =   360
         Width           =   4215
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd1 
         Height          =   4335
         Left            =   120
         TabIndex        =   25
         Top             =   720
         Width           =   14295
         _ExtentX        =   25215
         _ExtentY        =   7646
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
         Left            =   120
         TabIndex        =   27
         Top             =   360
         Width           =   735
      End
   End
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Indoor Bed Master"
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
Attribute VB_Name = "frmBedMast"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim mFormLoaded As Boolean, mLastKeyPressed As Integer, mMaskKeyPressed As Integer
Dim mBdmCode As Long
Dim mRemoteAccess As Boolean, mEntrySaved As Boolean, mEntryAborted As Boolean
Dim dbHmsDatabase As New ADODB.Connection
Dim datRecset As New ADODB.Recordset
Dim mBdmName_old As String, mBdmIndex_old As Integer
Dim clsBDM As clsHmsMasterEntry, clsWRD As clsHmsMasterEntry, clsFLR As clsHmsMasterEntry, mActiveControl As Object, clsListStru As clsSelectQueryStructure
Dim clsHOPT As clsHmsIpdOptionsEntry
Dim fcmbWrdName As clsHmsFlexSearch, fcmbFlrName As clsHmsFlexSearch, fcmbSrvName As clsHmsFlexSearch

Public Property Let RemoteAccessCode(ByVal mAccessCode As Long)
mRemoteAccess = True
mBdmCode = mAccessCode
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

Public Property Get BdmName() As String
BdmName = txtBdmName.Text
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

Private Sub chkBdmDiscAllowed_GotFocus()
FlashActiveControl chkBdmDiscAllowed, True
End Sub

Private Sub chkBdmDiscAllowed_LostFocus()
FlashActiveControl chkBdmDiscAllowed, False
End Sub

Private Sub chkBdmFreeAllot_GotFocus()
FlashActiveControl chkBdmFreeAllot, True
End Sub

Private Sub chkBdmFreeAllot_LostFocus()
FlashActiveControl chkBdmFreeAllot, False
End Sub

Private Sub chkBdmShowInList_GotFocus()
FlashActiveControl chkBdmShowInList, True
End Sub

Private Sub chkBdmShowInList_LostFocus()
FlashActiveControl chkBdmShowInList, False
End Sub

Private Sub cmbBdmChkOutTimeBasis_GotFocus()
FlashActiveControl cmbBdmChkOutTimeBasis, True
End Sub

Private Sub cmbBdmChkOutTimeBasis_LostFocus()
FlashActiveControl cmbBdmChkOutTimeBasis, False
End Sub

Private Sub cmbBdmChkOutTimeBasis_Validate(Cancel As Boolean)
If cmbBdmChkOutTimeBasis.ListIndex < 1 Then
    ErrorBox "Invalid Selection !!!"
    cmbBdmChkOutTimeBasis.SetFocus
    Cancel = True
End If

End Sub

Private Sub cmdFormEnter_Click()
mLastKeyPressed = 13
If FormAddEditMode = cFORM_SMRYMODE Then
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
If FormAddEditMode = cFORM_SMRYMODE Then
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
            datRecset.Move mRecAbsPos - 1, Start:=1
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
        txtBdmName.SetFocus
    End If

End If

End Sub

Private Sub cmdSaveForm_Click()
Call Data_SaveEvent

Call SmryList
txtSearch1Text_InterActiveChange txtBdmName.Text

Call ShowEntryMode(False)
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
        txtBdmName.SetFocus
    End If
End If
cmdSaveForm.Enabled = True

End Sub

Private Sub Form_Activate()
If mFormLoaded = False Then
    If mRemoteAccess = True Then
        MoveRecToFirst datRecset
        ShowRecActiveFlexRow datRecset, Mfgrd1
        Mfgrd1.SetFocus
        If mBdmCode = 0 Then
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

OpenHmsDataSource dbHmsDatabase

Set clsHOPT = New clsHmsIpdOptionsEntry
clsHOPT.blnBedMastOptMast = True
clsHOPT.Init
clsHOPT.GetBedMastOptData

Set clsBDM = New clsHmsMasterEntry
Set clsBDM.dbHmsDatabase = dbHmsDatabase
clsBDM.blnBedMast = True
clsBDM.Init

Set clsFLR = New clsHmsMasterEntry
Set clsFLR.dbHmsDatabase = dbHmsDatabase
clsFLR.blnFloorMast = True
clsFLR.Init

Set clsWRD = New clsHmsMasterEntry
Set clsWRD.dbHmsDatabase = dbHmsDatabase
clsWRD.blnWardMast = True
clsWRD.Init

Set clsListStru = New clsSelectQueryStructure

Set fcmbFlrName = New clsHmsFlexSearch
Set fcmbFlrName.dbHmsDatabase = dbHmsDatabase
fcmbFlrName.blnFloorMastList = True
fcmbFlrName.Init

Set fcmbWrdName = New clsHmsFlexSearch
Set fcmbWrdName.dbHmsDatabase = dbHmsDatabase
fcmbWrdName.blnWardMastList = True
fcmbWrdName.Init

Set fcmbSrvName = New clsHmsFlexSearch
Set fcmbSrvName.dbHmsDatabase = dbHmsDatabase
fcmbSrvName.blnServMastList = True
fcmbSrvName.Init

AddItemToComboFromList cmbBdmChkOutTimeBasis, cBDM_CHKOUTTIMEBASIS_LIST

If mRemoteAccess = True Then
    datRecset.Open "Select BedMast.*,FloorMast.FlrName,WardMast.WrdName,ServMast.SrvName from ((BedMast inner join FloorMast on BedMast.BdmFlrCode=FloorMast.FlrCode) inner join WardMast on BedMast.BdmWrdCode=WardMast.WrdCode) inner join ServMast on BedMast.BdmSrvCode=ServMast.SrvCode where BdmCode=" & CStr(mBdmCode) & " order by BdmName", dbHmsDatabase, adOpenKeyset, adLockOptimistic
Else
    datRecset.Open "Select BedMast.*,FloorMast.FlrName,WardMast.WrdName,ServMast.SrvName from ((BedMast inner join FloorMast on BedMast.BdmFlrCode=FloorMast.FlrCode) inner join WardMast on BedMast.BdmWrdCode=WardMast.WrdCode) inner join ServMast on BedMast.BdmSrvCode=ServMast.SrvCode order by BdmName", dbHmsDatabase, adOpenKeyset, adLockOptimistic
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
Set clsHOPT = Nothing
Set clsBDM = Nothing
Set clsWRD = Nothing
Set clsFLR = Nothing
Set fcmbFlrName = Nothing
Set fcmbWrdName = Nothing
Set fcmbSrvName = Nothing

Set clsListStru = Nothing

CloseTable datRecset
CloseDataSource dbHmsDatabase
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
Dim tRecset As New ADODB.Recordset

Data_Verify = False
If Val(mskFormBoundField.Text) < 1 And FormAddEditMode = cFORM_EDITMODE Then
    ErrorBox "Invalid Key Value !!!"
    txtBdmName.SetFocus
    Exit Function
End If
If Trim(txtBdmName.Text) = "" Then
    ErrorBox "Invalid Input !!!"
    txtBdmName.SetFocus
    Exit Function
End If
If txtBdmName.Text <> mBdmName_old Then
    If ChkIsDuplicate(dbHmsDatabase, "BedMast", "BdmName", txtBdmName.Text, "BdmCode", Val(mskFormBoundField.Text)) = True Then
        ErrorBox "Duplicate Input !!!"
        txtBdmName.SetFocus
        Exit Function
    End If
End If
If txtFlrName.Text = "" Or Val(fcmbFlrName.BoundText) = 0 Then
    ErrorBox "Invalid Selection !!!"
    txtFlrName.SetFocus
    Exit Function
End If
If txtWrdName.Text = "" Or Val(fcmbWrdName.BoundText) = 0 Then
    ErrorBox "Invalid Selection !!!"
    txtWrdName.SetFocus
    Exit Function
End If
If Val(mskBdmIndex.Text) < 0 Then
    ErrorBox "Invalid Index !!!"
    mskBdmIndex.SetFocus
    Exit Function
Else
    With tRecset
    .Open "Select BdmCode from BedMast order by BdmCode", dbHmsDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount < Val(mskBdmIndex.Text) Or Val(mskBdmIndex.Text) = 0 Then
        mskBdmIndex.Text = CStr(.RecordCount + IIf(FormAddEditMode = cFORM_ADDMODE, 1, 0))
    End If
    End With
    CloseTable tRecset
End If
If Val(UnMyNumFmt(mskBdmCharges.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskBdmCharges.SetFocus
    Exit Function
End If
If Between(Val(UnMyPerFmt(mskBdmDiscPer.Text)), 0, 100) = False Then
    ErrorBox "Invalid Input !!!"
    mskBdmDiscPer.SetFocus
    Exit Function
End If
If cmbBdmChkOutTimeBasis.ListIndex < 1 Then
    ErrorBox "Invalid Selection !!!"
    cmbBdmChkOutTimeBasis.SetFocus
    Exit Function
End If
If TimeToMin(txtBdmChkTime_str.Text) > cDAYMINUTES Then
    ErrorBox "Invalid Input !!!"
    txtBdmChkTime_str.SetFocus
    Exit Function
End If

CloseTable tRecset, mCheckOpen:=True

Data_Verify = True

End Function

Private Sub mskBdmDiscPer_GotFocus()
FlashActiveControl mskBdmDiscPer, True
End Sub

Private Sub mskBdmDiscPer_LostFocus()
FlashActiveControl mskBdmDiscPer, False
End Sub

Private Sub mskBdmDiscPer_Validate(Cancel As Boolean)
mskBdmDiscPer.Text = ToMyPerFmt(mskBdmDiscPer.Text)
If Between(Val(UnMyPerFmt(mskBdmDiscPer.Text)), 0, 100) = False Then
    ErrorBox "Invalid Input !!!"
    mskBdmDiscPer.SetFocus
    Cancel = True
End If

End Sub

Private Sub mskBdmIndex_GotFocus()
FlashActiveControl mskBdmIndex, True
End Sub

Private Sub mskBdmIndex_LostFocus()
FlashActiveControl mskBdmIndex, False
End Sub

Private Sub mskBdmIndex_Validate(Cancel As Boolean)
Dim tRecset As New ADODB.Recordset

mskBdmIndex.Text = ToMyNumFmt(mskBdmIndex.Text, mDecimals:=0, mUseAbs:=True, mGroupedDigit:=False)
If Val(mskBdmIndex.Text) < 0 Then
    ErrorBox "Invalid Index !!!"
    mskBdmIndex.SetFocus
    Cancel = True
Else
    With tRecset
    .Open "Select BdmCode from BedMast order by BdmCode", dbHmsDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount < Val(mskBdmIndex.Text) Or Val(mskBdmIndex.Text) = 0 Then
        mskBdmIndex.Text = CStr(.RecordCount + IIf(FormAddEditMode = cFORM_ADDMODE, 1, 0))
    End If
    End With
    CloseTable tRecset
End If

CloseTable tRecset, mCheckOpen:=True

End Sub

Private Sub mskBdmCharges_GotFocus()
FlashActiveControl mskBdmCharges, True
End Sub

Private Sub mskBdmCharges_LostFocus()
FlashActiveControl mskBdmCharges, False
End Sub

Private Sub mskBdmCharges_Validate(Cancel As Boolean)
mskBdmCharges.Text = ToMyNumFmt(mskBdmCharges.Text)
If Val(UnMyNumFmt(mskBdmCharges.Text)) < 0 Then
    ErrorBox "Invalid Input !!!"
    mskBdmCharges.SetFocus
    Cancel = True
End If

End Sub

Private Sub txtBdmChkTime_str_GotFocus()
FlashActiveControl txtBdmChkTime_str, True
End Sub

Private Sub txtBdmChkTime_str_LostFocus()
FlashActiveControl txtBdmChkTime_str, False
End Sub

Private Sub txtBdmChkTime_str_Validate(Cancel As Boolean)
txtBdmChkTime_str.Text = MinToTime(TimeToMin(txtBdmChkTime_str.Text))
If TimeToMin(txtBdmChkTime_str.Text) > cDAYMINUTES Then
    ErrorBox "Invalid Input !!!"
    txtBdmChkTime_str.SetFocus
    Cancel = True
End If

End Sub

Private Sub txtBdmRemark_GotFocus()
FlashActiveControl txtBdmRemark, True
End Sub

Private Sub txtBdmRemark_LostFocus()
FlashActiveControl txtBdmRemark, False
End Sub

Private Sub txtBdmRemark_Validate(Cancel As Boolean)
txtBdmRemark.Text = ToMyWord(txtBdmRemark.Text)
End Sub

Private Sub txtFlrName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    txtFlrName_Change
End If

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
    txtSrvName_Change
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
End If

End Sub

Private Sub txtWrdName_Change()
If fcmbWrdName.CallFromText_Change = False Then
    fcmbWrdName.CallFromText_Change = True
    If InterActiveChange(txtWrdName) = True Then
        fcmbWrdName.UserText = Array(txtWrdName.Text, txtWrdName.SelStart)
        fcmbWrdName.Show
        txtWrdName.Text = fcmbWrdName.Text
        If fcmbWrdName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbWrdName.CallFromText_Change = False
End If

End Sub

Private Sub txtWrdName_GotFocus()
FlashActiveControl txtWrdName, True
End Sub

Private Sub txtWrdName_KeyDown(KeyCode As Integer, Shift As Integer)
If MyDropDownKey(Shift, KeyCode) = True Then
    txtWrdName_Change
End If

End Sub

Private Sub txtWrdName_LostFocus()
FlashActiveControl txtWrdName, False
End Sub

Private Sub txtWrdName_Validate(Cancel As Boolean)
If txtWrdName.Text = "" Or Val(fcmbWrdName.BoundText) = 0 Then
    ErrorBox "Invalid Selection !!!"
    txtWrdName.SetFocus
    Cancel = True
End If

End Sub

Private Sub txtFlrName_Change()
If fcmbFlrName.CallFromText_Change = False Then
    fcmbFlrName.CallFromText_Change = True
    If InterActiveChange(txtFlrName) = True Then
        fcmbFlrName.UserText = Array(txtFlrName.Text, txtFlrName.SelStart)
        fcmbFlrName.Show
        txtFlrName.Text = fcmbFlrName.Text
        If fcmbFlrName.ListSelected = True Then
            SendKeys "{tab}"
        End If
    End If
    fcmbFlrName.CallFromText_Change = False
End If

End Sub

Private Sub txtFlrName_GotFocus()
FlashActiveControl txtFlrName, True
End Sub

Private Sub txtFlrName_LostFocus()
FlashActiveControl txtFlrName, False
End Sub

Private Sub txtFlrName_Validate(Cancel As Boolean)
If txtFlrName.Text = "" Or Val(fcmbFlrName.BoundText) = 0 Then
    ErrorBox "Invalid Selection !!!"
    txtFlrName.SetFocus
    Cancel = True
End If

End Sub

Private Sub txtBdmName_GotFocus()
FlashActiveControl txtBdmName, True
End Sub

Private Sub txtBdmName_LostFocus()
FlashActiveControl txtBdmName, False
End Sub

Private Sub txtBdmName_Validate(Cancel As Boolean)
txtBdmName.Text = ToMyWord(txtBdmName.Text)
If Trim(txtBdmName.Text) = "" Then
    ErrorBox "Invalid Input !!!"
    Cancel = True
    txtBdmName.SetFocus
Else
    If txtBdmName.Text <> mBdmName_old Then
        If ChkIsDuplicate(dbHmsDatabase, "BedMast", "BdmName", txtBdmName.Text, "BdmCode", Val(mskFormBoundField.Text)) = True Then
            ErrorBox "Duplicate Input !!!"
            Cancel = True
            txtBdmName.SetFocus
        End If
    End If
End If

End Sub

Private Sub Data_AddEvent()

If CanUserAddOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If clsBDM.BeginMast(0) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_ADDMODE
    
clsBDM.Clear
mBdmCode = clsBDM.ActiveCode
mskFormBoundField.Text = mBdmCode

txtBdmName.Text = ""
fcmbFlrName.BoundText = "": txtFlrName.Text = ""
fcmbWrdName.BoundText = "": txtWrdName.Text = ""
mskBdmIndex.Text = 0
mskBdmCharges.Text = ToMyNumFmt(0)
chkBdmDiscAllowed.Value = vbUnchecked
mskBdmDiscPer.Text = ToMyPerFmt(0)
cmbBdmChkOutTimeBasis.ListIndex = 0
txtBdmChkTime_str.Text = MinToTime(0)
chkBdmFreeAllot.Value = vbUnchecked
chkBdmShowInList.Value = vbChecked
txtBdmRemark.Text = ""

Rem restore default values
cmbBdmChkOutTimeBasis.ListIndex = GetListIndexFromItemData(cmbBdmChkOutTimeBasis, clsHOPT.GetBedMastOptBoundCode("BdmChkOutTimeBasis"))
txtBdmChkTime_str.Text = MinToTime(clsHOPT.GetBedMastOptBoundCode("BdmChkTime"))
fcmbFlrName.BoundText = CStr(clsHOPT.GetBedMastOptBoundCode("BdmFlrCode")): txtFlrName.Text = fcmbFlrName.Text
fcmbWrdName.BoundText = CStr(clsHOPT.GetBedMastOptBoundCode("BdmWrdCode")): txtWrdName.Text = fcmbWrdName.Text
fcmbSrvName.BoundText = CStr(clsHOPT.GetBedMastOptBoundCode("BdmSrvCode")): txtSrvName.Text = fcmbSrvName.Text

mBdmName_old = txtBdmName.Text
mBdmIndex_old = Val(mskBdmIndex.Text)

Call ShowEntryMode(True)
txtBdmName.SetFocus

End Sub

Private Sub Data_EditEvent()
Dim mLCount As Integer, mUCount As Integer, mCount As Integer

If CanUserEditOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If clsBDM.BeginMast(datRecset.fields("BdmCode")) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_EDITMODE

With datRecset
mBdmCode = .fields("BdmCode")
clsBDM.GetData mBdmCode
mskFormBoundField.Text = CStr(.fields("BdmCode"))

txtBdmName.Text = .fields("BdmName")
fcmbFlrName.BoundText = CStr(.fields("BdmFlrCode")): txtFlrName.Text = fcmbFlrName.Text
fcmbWrdName.BoundText = CStr(.fields("BdmWrdCode")): txtWrdName.Text = fcmbWrdName.Text
fcmbSrvName.BoundText = CStr(.fields("BdmSrvCode")): txtSrvName.Text = fcmbSrvName.Text
mskBdmIndex.Text = .fields("BdmIndex")
mskBdmCharges.Text = ToMyNumFmt(.fields("BdmCharges"))
chkBdmDiscAllowed.Value = IIf(.fields("BdmDiscAllowed") = True, vbChecked, vbUnchecked)
mskBdmDiscPer.Text = ToMyPerFmt(.fields("BdmDiscPer"))
cmbBdmChkOutTimeBasis.ListIndex = GetListIndexFromItemData(cmbBdmChkOutTimeBasis, .fields("BdmChkOutTimeBasis"))
txtBdmChkTime_str.Text = MinToTime(.fields("BdmChkTime"))
chkBdmFreeAllot.Value = IIf(.fields("BdmFreeAllot") = True, vbChecked, vbUnchecked)
chkBdmShowInList.Value = IIf(.fields("BdmShowInList") = True, vbChecked, vbUnchecked)
txtBdmRemark.Text = .fields("BdmRemark")
End With

mBdmName_old = txtBdmName.Text
mBdmIndex_old = Val(mskBdmIndex.Text)

Call ShowEntryMode(True)
txtBdmName.SetFocus

End Sub

Private Sub Data_SaveEvent()
Dim tRecset As New ADODB.Recordset

With clsBDM
If FormAddEditMode = cFORM_ADDMODE Then
    .Clear
Else
    .GetData mBdmCode
End If
.mName_str = txtBdmName.Text
.mBdmFlrCode_lng = Val(fcmbFlrName.BoundText)
.mBdmWrdCode_lng = Val(fcmbWrdName.BoundText)
.mBdmSrvCode_lng = Val(fcmbSrvName.BoundText)
.mBdmIndex_int = Val(mskBdmIndex.Text)
.mBdmCharges_dbl = Val(UnMyNumFmt(mskBdmCharges.Text))
.mBdmDiscAllowed_bln = (chkBdmDiscAllowed.Value = vbChecked)
.mBdmDiscPer_sng = Val(UnMyPerFmt(mskBdmDiscPer.Text))
.mBdmChkOutTimeBasis_int = cmbBdmChkOutTimeBasis.ItemData(cmbBdmChkOutTimeBasis.ListIndex)
.mBdmChkTime_lng = TimeToMin(txtBdmChkTime_str.Text)
.mBdmFreeAllot_bln = (chkBdmFreeAllot.Value = vbChecked)
.mBdmShowInList_bln = (chkBdmShowInList.Value = vbChecked)
.mBdmRemark_str = txtBdmRemark.Text

If FormAddEditMode = cFORM_ADDMODE Then
    .AddNew
    mskFormBoundField.Text = .mCode_lng
Else
    .Update mBdmCode
End If
If .mCode_lng > 0 Then   ' updated successfully
    .UpdateMast .mCode_lng
    .EndMast .mCode_lng
    
    Rem re-ordering index order
    RefreshDatabase dbHmsDatabase
    dbHmsDatabase.BeginTrans
    tRecset.Open "Select * from BedMast where BdmCode<>" & CStr(.mCode_lng) & " and BdmIndex=" & .mBdmIndex_int & "", dbHmsDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.RecordCount > 0 Then
        If FormAddEditMode = cFORM_ADDMODE Then
            tRecset.fields("BdmIndex") = tRecset.RecordCount
        Else
            tRecset.fields("BdmIndex") = mBdmIndex_old
        End If
        tRecset.Update
    End If
    dbHmsDatabase.CommitTrans
    CloseTable tRecset
    
    Rem updating user editing carry forward features
    clsHOPT.mBdmChkOutTimeBasisOld_int = clsBDM.mBdmChkOutTimeBasis_int
    clsHOPT.mBdmChkTimeOld_lng = clsBDM.mBdmChkTime_lng
    clsHOPT.mBdmFlrCodeOld_lng = clsBDM.mBdmFlrCode_lng
    clsHOPT.mBdmWrdCodeOld_lng = clsBDM.mBdmWrdCode_lng
    clsHOPT.mBdmSrvCodeOld_lng = clsBDM.mBdmSrvCode_lng
    clsHOPT.UpdateBedMastOld
    
    mEntrySaved = True
Else
    Call Data_CancelEvent
    ErrorBox "Entry Cancelled !!!"
End If

End With

CloseTable tRecset, mCheckOpen:=True
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

mBdmCode = datRecset.fields("BdmCode")
mRecAbsPos = datRecset.AbsolutePosition

If clsBDM.CanDeleteMast(mBdmCode) = True Then
    txtVoid.SetFocus
    If clsBDM.BeginMast(mBdmCode) = True Then
        clsBDM.GetData mBdmCode
        
        clsBDM.DeleteMast mBdmCode
        clsBDM.UpdateMast mBdmCode
        clsBDM.EndMast mBdmCode
        
        dbHmsDatabase.BeginTrans
        dbHmsDatabase.Execute "Update BedMast set BdmIndex=BdmIndex-1 where BdmIndex>=" & CStr(clsBDM.mBdmIndex_int) & " and BdmCode<>" & CStr(mBdmCode) & ""
        dbHmsDatabase.CommitTrans
        
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
clsBDM.CancelMast mBdmCode
clsBDM.EndMast mBdmCode
mEntryAborted = True

End Sub

Private Sub SmryList()
Dim gcolcount As Integer, acount As Integer, mLow As Integer, mHigh As Integer, mPos As Integer, srow As Long, mColCount As Integer

clsListStru.Clear

Rem column definitions
clsListStru.AddFields mExpr:="BdmCode", mAttrib:=cFAT_SYSTEM
clsListStru.AddFields mExpr:="BdmName", mTitle:="Bed Name", mAlign:=1, mWidth:=4000, mShowItem:=True
clsListStru.AddFields mExpr:="BdmFlrName", mTitle:="Floor Name", mAlign:=1, mWidth:=2500, mShowItem:=True
clsListStru.AddFields mExpr:="BdmWrdName", mTitle:="Ward Name", mAlign:=1, mWidth:=2500, mShowItem:=True
clsListStru.AddFields mExpr:="BdmSrvName", mTitle:="Service Name", mAlign:=1, mWidth:=2500, mShowItem:=True
clsListStru.AddFields mExpr:="BdmCharges", mTitle:="Charges", mAlign:=7, mWidth:=1000, mShowItem:=True
clsListStru.AddFields mExpr:="BdmChkOutTimeBasis", mTitle:="Chk.Out.Time Basis", mAlign:=1, mWidth:=1000, mShowItem:=True
clsListStru.AddFields mExpr:="BdmChkTime", mTitle:="Chk.Time", mAlign:=1, mWidth:=1000, mShowItem:=True
clsListStru.AddFields mExpr:="BdmIndex", mTitle:="Index", mAlign:=7, mWidth:=1000, mShowItem:=True
clsListStru.AddFields mExpr:="BdmShowInList", mTitle:="Show List", mAlign:=1, mWidth:=1000, mShowItem:=True

RefreshDatabase dbHmsDatabase
datRecset.Requery

Mfgrd1.Height = Int(Mfgrd1.Height / Mfgrd1.RowHeightMin) * Mfgrd1.RowHeightMin
Mfgrd1.Cols = clsListStru.UFields + 1
gcolcount = 0
mLow = clsListStru.LFields
mHigh = clsListStru.UFields
For acount = mLow To mHigh
    With Mfgrd1
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
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BdmCode")) = .fields("BdmCode")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BdmName")) = .fields("BdmName")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BdmFlrName")) = .fields("FlrName")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BdmWrdName")) = .fields("WrdName")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BdmSrvName")) = .fields("SrvName")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BdmCharges")) = ToMyNumFmt(.fields("BdmCharges"))
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BdmChkOutTimeBasis")) = GetListTextFromItemData(cmbBdmChkOutTimeBasis, .fields("BdmChkOutTimeBasis"))
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BdmChkTime")) = MinToTime(.fields("BdmChkTime"))
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BdmIndex")) = .fields("BdmIndex")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("BdmShowInList")) = IIf(.fields("BdmShowInList") = True, "Yes", "No")
        
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
If MyAddNewKey(Shift, KeyCode) = True Then
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
SearchFlex Mfgrd1, clsListStru.GetItemIndex("BdmName"), mText
ShowActiveFlexRow Mfgrd1

End Sub

Private Sub txtSearch1Text_GotFocus()
FlashActiveControl txtSearch1Text, True
End Sub

Private Sub txtSearch1Text_LostFocus()
FlashActiveControl txtSearch1Text, False
End Sub

