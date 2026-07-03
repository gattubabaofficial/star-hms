VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmVendorRcptPart 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   ClientHeight    =   9315
   ClientLeft      =   60
   ClientTop       =   60
   ClientWidth     =   14340
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
   ScaleWidth      =   14340
   ShowInTaskbar   =   0   'False
   WindowState     =   2  'Maximized
   Begin VB.Frame frHeader 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   1455
      Left            =   120
      TabIndex        =   26
      Top             =   840
      Width           =   13815
      Begin VB.TextBox txtMprName1 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   1320
         TabIndex        =   4
         Top             =   960
         Width           =   3495
      End
      Begin VB.TextBox dtpVrpDate2 
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
         Height          =   285
         Left            =   3600
         TabIndex        =   1
         Tag             =   "AhCode"
         Text            =   "dd/mm/yyyy"
         Top             =   240
         Width           =   1215
      End
      Begin VB.CommandButton cmdShowDtlData 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         Caption         =   "&Show"
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
         Left            =   6000
         Style           =   1  'Graphical
         TabIndex        =   5
         Top             =   960
         Width           =   735
      End
      Begin VB.TextBox txtVndName1 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   1320
         TabIndex        =   2
         Top             =   600
         Width           =   3495
      End
      Begin VB.TextBox txtItmName1 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   6000
         TabIndex        =   3
         Top             =   600
         Width           =   3495
      End
      Begin VB.TextBox dtpVrpDate1 
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
         Height          =   285
         Left            =   1320
         TabIndex        =   0
         Tag             =   "AhCode"
         Text            =   "dd/mm/yyyy"
         Top             =   240
         Width           =   1215
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Process:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   21
         Left            =   240
         TabIndex        =   40
         Top             =   960
         Width           =   855
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "To Date:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   19
         Left            =   2760
         TabIndex        =   38
         Top             =   240
         Width           =   855
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Vendor:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   2
         Left            =   240
         TabIndex        =   29
         Top             =   600
         Width           =   855
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Material:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   0
         Left            =   4920
         TabIndex        =   28
         Top             =   600
         Width           =   855
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "From Date:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   1
         Left            =   240
         TabIndex        =   27
         Top             =   240
         Width           =   1095
      End
   End
   Begin VB.TextBox txtVoid 
      CausesValidation=   0   'False
      Height          =   375
      Left            =   120
      TabIndex        =   20
      TabStop         =   0   'False
      Text            =   "Void"
      Top             =   8760
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
      TabIndex        =   24
      TabStop         =   0   'False
      Top             =   0
      UseMaskColor    =   -1  'True
      Width           =   255
   End
   Begin VB.ComboBox cmbFormEntryMode 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   315
      ItemData        =   "VendRPrt.frx":0000
      Left            =   0
      List            =   "VendRPrt.frx":000D
      Style           =   1  'Simple Combo
      TabIndex        =   23
      TabStop         =   0   'False
      Text            =   "cmbFormMode"
      Top             =   360
      Width           =   1455
   End
   Begin VB.Frame frFormDtl 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   6255
      Left            =   120
      TabIndex        =   22
      Top             =   2280
      Width           =   13815
      Begin VB.Frame frFlexControls 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   1455
         Left            =   120
         TabIndex        =   30
         Top             =   0
         Width           =   13455
         Begin VB.TextBox mskBalWeightForRcpt 
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
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   7200
            TabIndex        =   16
            Tag             =   "AhCode"
            Text            =   "0.000"
            Top             =   960
            Width           =   1455
         End
         Begin VB.TextBox mskVrpRejOutWeight 
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
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   4440
            TabIndex        =   14
            Tag             =   "AhCode"
            Text            =   "0.000"
            Top             =   960
            Width           =   1455
         End
         Begin VB.TextBox mskVrpFinOutWeight 
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
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   1560
            TabIndex        =   12
            Tag             =   "AhCode"
            Text            =   "0.000"
            Top             =   960
            Width           =   1455
         End
         Begin VB.TextBox mskVrpUnitWeight 
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
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   120
            TabIndex        =   11
            Tag             =   "AhCode"
            Text            =   "0.000"
            Top             =   960
            Width           =   1455
         End
         Begin VB.TextBox txtMprName 
            Appearance      =   0  'Flat
            Height          =   285
            Left            =   7080
            TabIndex        =   10
            Top             =   360
            Width           =   2415
         End
         Begin VB.TextBox mskBalNosForMach 
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
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   10080
            TabIndex        =   18
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   960
            Width           =   1455
         End
         Begin VB.TextBox mskBalNosForRcpt 
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
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   8640
            TabIndex        =   17
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   960
            Width           =   1455
         End
         Begin VB.TextBox mskVrpRejOutNos 
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
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   5880
            TabIndex        =   15
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   960
            Width           =   1335
         End
         Begin VB.TextBox mskVrpFinOutNos 
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
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   3000
            TabIndex        =   13
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   960
            Width           =   1455
         End
         Begin VB.TextBox txtVndName 
            Appearance      =   0  'Flat
            Height          =   285
            Left            =   1320
            TabIndex        =   8
            Top             =   360
            Width           =   3135
         End
         Begin VB.TextBox txtItmName 
            Appearance      =   0  'Flat
            Height          =   285
            Left            =   4440
            TabIndex        =   9
            Top             =   360
            Width           =   2655
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
            TabIndex        =   19
            Top             =   960
            Width           =   735
         End
         Begin VB.TextBox dtpVrpDate 
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
            Height          =   285
            Left            =   120
            TabIndex        =   7
            Tag             =   "AhCode"
            Text            =   "dd/mm/yyyy"
            Top             =   360
            Width           =   1215
         End
         Begin VB.Label Label1 
            Alignment       =   1  'Right Justify
            Caption         =   "Issued Bal.Wt:"
            Height          =   255
            Index           =   15
            Left            =   7200
            TabIndex        =   44
            Top             =   720
            Width           =   1455
         End
         Begin VB.Label Label1 
            Alignment       =   1  'Right Justify
            Caption         =   "Rej.Weight:"
            Height          =   255
            Index           =   28
            Left            =   4440
            TabIndex        =   43
            Top             =   720
            Width           =   1455
         End
         Begin VB.Label Label1 
            Alignment       =   1  'Right Justify
            Caption         =   "OK Weight:"
            Height          =   255
            Index           =   27
            Left            =   1560
            TabIndex        =   42
            Top             =   720
            Width           =   1455
         End
         Begin VB.Label Label1 
            Alignment       =   1  'Right Justify
            Caption         =   "Weight/Pcs"
            Height          =   255
            Index           =   26
            Left            =   120
            TabIndex        =   41
            Top             =   720
            Width           =   1455
         End
         Begin VB.Label Label1 
            Caption         =   "Process:"
            Height          =   255
            Index           =   20
            Left            =   7080
            TabIndex        =   39
            Top             =   120
            Width           =   2415
         End
         Begin VB.Label Label1 
            Alignment       =   1  'Right Justify
            Caption         =   "Parting.Bal.:"
            Height          =   255
            Index           =   18
            Left            =   10080
            TabIndex        =   37
            Top             =   720
            Width           =   1455
         End
         Begin VB.Label Label1 
            Alignment       =   1  'Right Justify
            Caption         =   "Issued Bal.Nos.:"
            Height          =   255
            Index           =   17
            Left            =   8640
            TabIndex        =   36
            Top             =   720
            Width           =   1455
         End
         Begin VB.Label Label1 
            Alignment       =   1  'Right Justify
            Caption         =   "Rej.Nos.:"
            Height          =   255
            Index           =   13
            Left            =   5880
            TabIndex        =   35
            Top             =   720
            Width           =   1335
         End
         Begin VB.Label Label1 
            Alignment       =   1  'Right Justify
            Caption         =   "OK Nos.:"
            Height          =   255
            Index           =   10
            Left            =   3000
            TabIndex        =   34
            Top             =   720
            Width           =   1455
         End
         Begin VB.Label Label1 
            Caption         =   "Item Name:"
            Height          =   255
            Index           =   6
            Left            =   4440
            TabIndex        =   33
            Top             =   120
            Width           =   2655
         End
         Begin VB.Label Label1 
            Caption         =   "Vendor Name:"
            Height          =   255
            Index           =   5
            Left            =   1320
            TabIndex        =   32
            Top             =   120
            Width           =   3135
         End
         Begin VB.Label Label1 
            Caption         =   "Date:"
            Height          =   255
            Index           =   4
            Left            =   120
            TabIndex        =   31
            Top             =   120
            Width           =   1215
         End
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd2 
         Height          =   4695
         Left            =   120
         TabIndex        =   6
         Top             =   1440
         Width           =   13455
         _ExtentX        =   23733
         _ExtentY        =   8281
         _Version        =   393216
         FixedCols       =   0
         RowHeightMin    =   285
         FocusRect       =   2
         HighLight       =   2
         AllowUserResizing=   3
         Appearance      =   0
      End
   End
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Vendor Receipt from Parting"
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
      TabIndex        =   21
      Top             =   0
      Width           =   9015
   End
End
Attribute VB_Name = "frmVendorRcptPart"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim dbAcDatabase As New ADODB.Connection, dbStDatabase As New ADODB.Connection, dbTlgDatabase As New ADODB.Connection, dbGrpDatabase As New ADODB.Connection, dbComDatabase As New ADODB.Connection
Dim mFormLoaded As Boolean, mLastKeyPressed As Integer
Dim mRemoteAccess As Boolean, mEntrySaved As Boolean, mEntryAborted As Boolean
Dim dtlAddEditMode As Boolean, dtlAddMode As Boolean, dtlEditCanceled As Boolean
Dim clsSTK As clsStockJrn, clsITM As clsProduct, clsVND As clsToolingMasterEntry, clsMPR As clsToolingMasterEntry, mActiveControl As Object
Dim fcmbVndName As frmFlexSearchList, fcmbItmName As frmFlexSearchList, fcmbMprName As frmFlexSearchList
Dim mVrpDate_old As Date, mVrpVndCode_old As Long, mVrpItmCode_old As Long, mVrpMprCode_old As Long, mVrpConsWeight_old As Double, mVrpConsNos_old As Double, mVrpFinOutWeight_old As Double, mVrpFinOutNos_old As Double

' StockJrn transaction detail grid Mfgrd2 column definitions
Const X2VRPICODE_COL = 0
Const X2VRPDATE_COL = 1
Const X2VNDNAME_COL = 2
Const X2ITMNAME_COL = 3
Const X2MPRNAME_COL = 4
Const X2VRPUNITWEIGHT_COL = 5
Const X2VRPFINOUTWEIGHT_COL = 6
Const X2VRPFINOUTNOS_COL = 7
Const X2VRPREJOUTWEIGHT_COL = 8
Const X2VRPREJOUTNOS_COL = 9
Const X2BALWEIGHTFORRCPT_COL = 10
Const X2BALNOSFORRCPT_COL = 11
Const X2BALNOSFORMACH_COL = 12
Const X2VRPCODE_COL = 13
Const X2VRPSNO_COL = 14
Const X2VRPVNDCODE_COL = 15
Const X2VRPITMCODE_COL = 16
Const X2VRPMPRCODE_COL = 17
Const X2VRPSTKCODE_COL = 18
Const X2VRPSTKICODEIS_COL = 19
Const X2VRPSTKICODERC_COL = 20
Const X2VRPRECSTATE_COL = 21
Const MFGRD2_COLS = 22

Rem General declarations
Const NOS_UNIT = 1
Const WEIGHT_UNIT = 2

Private Property Get FormAddEditMode() As Integer
FormAddEditMode = cmbFormEntryMode.ListIndex
End Property

Private Property Let FormAddEditMode(ByVal New_FormEntryMode As Integer)
cmbFormEntryMode.ListIndex = New_FormEntryMode
End Property

Private Sub cmdFormEnter_Click()
mLastKeyPressed = 13
If TypeOf Screen.ActiveControl Is MSFlexGrid Then
    If Screen.ActiveControl.Name = Mfgrd2.Name Then
        Call Mfgrd2_KeyPress(13)
    End If
Else
    SendKeys "{tab}"
End If

End Sub

Private Sub cmdFormEscape_Click()
Dim mRecAbsPos As Long
mLastKeyPressed = 27
If dtlAddEditMode = True Then
    dtlEditCanceled = True
    Call cmdOK_Click
ElseIf Screen.ActiveControl.Name = Mfgrd2.Name Then
    dtpVrpDate1.SetFocus
Else
    Unload Me
End If

End Sub

Private Sub cmdOK_Click()
Dim VRPRecset As New ADODB.Recordset, Vrp_LogRS As New ADODB.Recordset
Dim srow As Long, mVrpStkCode As Long, mVrpStkICodeIs As Long, mVrpStkICodeRc As Long, mVrpCode As Long, mVrpICode As Long, mVrpSno As Long, mStkItmRefCode As Long
Dim mVrpFinOutWeight As Double, mVrpFinOutNos As Double, mConsWeight As Double, mConsNos As Double

srow = Mfgrd2.Row
If dtlAddMode = True Then
    mVrpCode = GetNextSeqno(dbTlgDatabase, "VendRcPrt", "VrpCode")
    mVrpStkCode = clsSTK.ActiveStkCode
Else
    mVrpCode = Val(Mfgrd2.TextMatrix(srow, X2VRPCODE_COL))
    mVrpStkCode = Val(Mfgrd2.TextMatrix(srow, X2VRPSTKCODE_COL))
    mVrpICode = Val(Mfgrd2.TextMatrix(srow, X2VRPICODE_COL))
    mVrpStkICodeIs = Val(Mfgrd2.TextMatrix(srow, X2VRPSTKICODEIS_COL))
    mVrpStkICodeRc = Val(Mfgrd2.TextMatrix(srow, X2VRPSTKICODERC_COL))
End If
If dtlEditCanceled = False Then
    Call ValidDtl
End If
If cmdOK.Caption = "&OK" And dtlEditCanceled = False Then
    Rem addnew/update -------------------------
    Rem Parting section
    dbTlgDatabase.BeginTrans
    With VRPRecset
    If dtlAddMode = True Then
        mVrpSno = GetNextSeqno(dbTlgDatabase, "VendRcPrt", "VrpSno", "VrpCode" = CStr(mVrpCode))
        
        VRPRecset.Open "Select * from VendRcPrt where VrpCode=" & CStr(mVrpCode) & "", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        .AddNew
        Rem .Fields("VrpICode") = AutoNumber
        .Fields("VrpCode") = mVrpCode
        .Fields("VrpSno") = mVrpSno
    Else
        VRPRecset.Open "Select * from VendRcPrt where VrpCode=" & CStr(mVrpCode) & " and VrpICode=" & CStr(mVrpICode) & "", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    End If
    .Fields("VrpDate") = Ctod(dtpVrpDate.Text)
    .Fields("VrpVndCode") = Val(fcmbVndName.BoundText)
    .Fields("VrpItmCode") = Val(fcmbItmName.BoundText)
    .Fields("VrpItmRefCode") = 0
    .Fields("VrpMprCode") = Val(fcmbMprName.BoundText)
    .Fields("VrpUnitWeight") = Val(UnMyNumFmt(mskVrpUnitWeight.Text))
    .Fields("VrpUnitNos") = 1  ''' provisional
    .Fields("VrpFinOutWeight") = Val(UnMyNumFmt(mskVrpFinOutWeight.Text))
    .Fields("VrpFinOutNos") = Val(UnMyNumFmt(mskVrpFinOutNos.Text))
    .Fields("VrpRejOutWeight") = Val(UnMyNumFmt(mskVrpRejOutWeight.Text))
    .Fields("VrpRejOutNos") = Val(UnMyNumFmt(mskVrpRejOutNos.Text))
    .Fields("VrpNarr") = ""
    .Fields("VrpRecState") = ChkEditRecStatus(.Fields("VrpRecState"))
    .Update
    .Fields("VrpConsWeight") = .Fields("VrpFinOutWeight") + .Fields("VrpRejOutWeight")
    .Fields("VrpConsNos") = .Fields("VrpFinOutNos") + .Fields("VrpRejOutNos")
    .Update
    
    mVrpICode = .Fields("VrpICode")
    mConsWeight = .Fields("VrpConsWeight")
    mConsNos = .Fields("VrpConsNos")
    mVrpFinOutWeight = .Fields("VrpFinOutWeight")
    mVrpFinOutNos = .Fields("VrpFinOutNos")
    
    End With
    dbTlgDatabase.CommitTrans
    CloseTable VRPRecset
    
    Rem StockJrn section
    clsSTK.Clear
    If dtlAddMode = True Then
        Rem issue stock
        clsSTK.mStkDate_dt = Ctod(dtpVrpDate.Text)
        clsSTK.mStkItmCode_lng = Val(fcmbItmName.BoundText)
        clsSTK.mStkItmRefCode_lng = 0
        clsSTK.mStkQty_dbl = ToIssueQty(mConsWeight)
        clsSTK.mStkRate_dbl = 0
        clsSTK.mStkValue_dbl = 0
        clsSTK.mStkNarr_str = ""
        clsSTK.mStkRecState_int = cREC_NEW
        clsSTK.mStkLItmCode_lng = 0
        
        clsSTK.AddNew mVrpStkCode
        mVrpStkICodeIs = clsSTK.mStkICode_lng
        
        Rem receipt stock
        clsSTK.mStkSno_int = 0
        clsSTK.mStkQty_dbl = ToRcptQty(mVrpFinOutNos)
        
        clsSTK.AddNew mVrpStkCode, mNewItemRef:=True
        mVrpStkICodeRc = clsSTK.mStkICode_lng
        mStkItmRefCode = clsSTK.mStkItmRefCode_lng
        
        Rem StockJrn Common entry
        clsSTK.mStkSno_int = -1
        clsSTK.mStkItmCode_lng = 0
        clsSTK.mStkItmRefCode_lng = 0
        clsSTK.mStkQty_dbl = 0
        clsSTK.mStkNarr_str = "Vendor Receipt from Parting Entry"
        clsSTK.AddNew mVrpStkCode
    Else
        Rem issue stock
        clsSTK.GetData mVrpStkCode, mVrpStkICodeIs
        clsSTK.mStkDate_dt = Ctod(dtpVrpDate.Text)
        clsSTK.mStkItmCode_lng = Val(fcmbItmName.BoundText)
        clsSTK.mStkItmRefCode_lng = 0
        clsSTK.mStkQty_dbl = ToIssueQty(mConsWeight)
        clsSTK.mStkRate_dbl = 0
        clsSTK.mStkValue_dbl = 0
        clsSTK.mStkNarr_str = ""
        clsSTK.Update mVrpStkCode, mVrpStkICodeIs
        
        Rem receipt stock
        clsSTK.GetData mVrpStkCode, mVrpStkICodeRc
        clsSTK.mStkDate_dt = Ctod(dtpVrpDate.Text)
        clsSTK.mStkItmCode_lng = Val(fcmbItmName.BoundText)
        Rem clsSTK.mStkItmRefCode_lng = 0
        clsSTK.mStkQty_dbl = ToRcptQty(mVrpFinOutNos)    ' rejoutqty is to be considered ???
        clsSTK.mStkRate_dbl = 0
        clsSTK.mStkValue_dbl = 0
        clsSTK.mStkNarr_str = ""
        If mVrpItmCode_old <> clsSTK.mStkItmCode_lng Or clsSTK.mStkItmRefCode_lng = 0 Then
            clsSTK.Update mVrpStkCode, mVrpStkICodeRc, mNewItemRef:=True
        Else
            clsSTK.Update mVrpStkCode, mVrpStkICodeRc
        End If
        mStkItmRefCode = clsSTK.mStkItmRefCode_lng
        
        Rem StockJrn common entry
        clsSTK.GetData mVrpStkCode, 0, -1
        clsSTK.mStkDate_dt = Ctod(dtpVrpDate.Text)
        clsSTK.mStkItmCode_lng = 0
        clsSTK.mStkItmRefCode_lng = 0
        clsSTK.mStkQty_dbl = 0
        clsSTK.mStkRate_dbl = 0
        clsSTK.mStkValue_dbl = 0
        clsSTK.mStkNarr_str = "Vendor Receipt from Parting Entry"
        
        clsSTK.Update mVrpStkCode, clsSTK.mStkICode_lng
    End If
    
    Rem update stock ----------------------------------------
    Rem Receipt updation
    dbTlgDatabase.BeginTrans
    VRPRecset.Open "Select * from VendRcPrt where VrpCode=" & CStr(mVrpCode) & " order by VrpICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    With VRPRecset
    If .RecordCount > 0 Then
        .MoveFirst
        Do While .EOF = False
            If InList(.Fields("VrpRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
                If dtlAddMode = True Then
                    .Fields("VrpStkCode") = mVrpStkCode
                    .Fields("VrpStkICodeIs") = mVrpStkICodeIs
                    .Fields("VrpStkICodeRc") = mVrpStkICodeRc
                    .Fields("VrpItmRefCode") = mStkItmRefCode
                Else
                    .Fields("VrpItmRefCode") = mStkItmRefCode
                End If
                .Fields("VrpRecState") = cREC_UNCHANGED
                .Update
            Else
                .Fields("VrpRecState") = ChkDeleteRecStatus(.Fields("VrpRecState"))
                .Update
                .Delete
            End If
            
            .MoveNext
        Loop
    End If
    End With
    dbTlgDatabase.CommitTrans
    CloseTable VRPRecset
    
    Rem StockJrn updation
    clsSTK.CommitStock mVrpStkCode
    
    Rem EndStock routine ----------------------------------
    Rem Receipt
    Data_RemoveLog mVrpCode
    
    Rem StockJrn
    clsSTK.EndStock mVrpStkCode
    
    Rem show record in flexgrid
    VRPRecset.Open "Select * from VendRcPrt where VrpCode=" & CStr(mVrpCode) & " and VrpICode=" & CStr(mVrpICode) & "", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    With VRPRecset
    clsVND.GetData .Fields("VrpVndCode")
    clsITM.GetData .Fields("VrpItmCode")
    clsMPR.GetData .Fields("VrpMprCode")
    
    Mfgrd2.TextMatrix(srow, X2VRPICODE_COL) = .Fields("VrpICode")
    Mfgrd2.TextMatrix(srow, X2VRPDATE_COL) = Dtoc(.Fields("VrpDate"))
    Mfgrd2.TextMatrix(srow, X2VNDNAME_COL) = clsVND.mAhName_str
    Mfgrd2.TextMatrix(srow, X2ITMNAME_COL) = clsITM.mItmName_str
    Mfgrd2.TextMatrix(srow, X2MPRNAME_COL) = clsMPR.mName_str
    Mfgrd2.TextMatrix(srow, X2VRPUNITWEIGHT_COL) = ToMyNumFmt(.Fields("VrpUnitWeight"), mDecimals:=3)
    Mfgrd2.TextMatrix(srow, X2VRPFINOUTWEIGHT_COL) = ToMyNumFmt(.Fields("VrpFinOutWeight"), mDecimals:=3)
    Mfgrd2.TextMatrix(srow, X2VRPFINOUTNOS_COL) = ToMyNumFmt(.Fields("VrpFinOutNos"), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2VRPREJOUTWEIGHT_COL) = ToMyNumFmt(.Fields("VrpRejOutWeight"), mDecimals:=3)
    Mfgrd2.TextMatrix(srow, X2VRPREJOUTNOS_COL) = ToMyNumFmt(.Fields("VrpRejOutNos"), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2VRPCODE_COL) = .Fields("VrpCode")
    Mfgrd2.TextMatrix(srow, X2VRPSNO_COL) = .Fields("VrpSno")
    Mfgrd2.TextMatrix(srow, X2VRPVNDCODE_COL) = .Fields("VrpVndCode")
    Mfgrd2.TextMatrix(srow, X2VRPITMCODE_COL) = .Fields("VrpItmCode")
    Mfgrd2.TextMatrix(srow, X2VRPMPRCODE_COL) = .Fields("VrpMprCode")
    Mfgrd2.TextMatrix(srow, X2VRPSTKCODE_COL) = .Fields("VrpStkCode")
    Mfgrd2.TextMatrix(srow, X2VRPSTKICODEIS_COL) = .Fields("VrpStkICodeIs")
    Mfgrd2.TextMatrix(srow, X2VRPSTKICODERC_COL) = .Fields("VrpStkICodeRc")
    Mfgrd2.TextMatrix(srow, X2VRPRECSTATE_COL) = .Fields("VrpRecState")
    
    End With
    CloseTable VRPRecset
    
    If dtlAddMode = True Then
        Mfgrd2.Rows = Mfgrd2.Rows + 1
    End If
    srow = srow + 1
    Mfgrd2.Row = srow
Else
    Rem cance event -----------------------------------
    Rem Receipt
    VRPRecset.Open "Select * from VendRcPrt where VrpCode=" & CStr(mVrpCode) & " order by VrpICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    Vrp_LogRS.Open "Select * from VendRcPrt_Log where VrpCode=" & CStr(mVrpCode) & " order by VrpICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    
    dbTlgDatabase.BeginTrans
    With VRPRecset
    If .RecordCount > 0 Then
        .MoveFirst
        Do While .EOF = False
            Rem stock updation is not required because balance is updated on CommitStock and not on individual item save, hence no need to revert is back
            Vrp_LogRS.Find "VrpICode=" & CStr(.Fields("VrpICode")), Start:=1
            If Vrp_LogRS.EOF = False Then
                ' any prior updations can be made here
                .Fields("VrpSno") = Vrp_LogRS.Fields("VrpSno")
                .Fields("VrpDate") = Vrp_LogRS.Fields("VrpDate")
                .Fields("VrpVndCode") = Vrp_LogRS.Fields("VrpVndCode")
                .Fields("VrpItmCode") = Vrp_LogRS.Fields("VrpItmCode")
                .Fields("VrpItmRefCode") = Vrp_LogRS.Fields("VrpItmRefCode")
                .Fields("VrpMprCode") = Vrp_LogRS.Fields("VrpMprCode")
                .Fields("VrpUnitWeight") = Vrp_LogRS.Fields("VrpUnitWeight")
                .Fields("VrpUnitNos") = Vrp_LogRS.Fields("VrpUnitNos")
                .Fields("VrpFinOutWeight") = Vrp_LogRS.Fields("VrpFinOutWeight")
                .Fields("VrpFinOutNos") = Vrp_LogRS.Fields("VrpFinOutNos")
                .Fields("VrpRejOutWeight") = Vrp_LogRS.Fields("VrpRejOutWeight")
                .Fields("VrpRejOutNos") = Vrp_LogRS.Fields("VrpRejOutNos")
                .Fields("VrpConsWeight") = Vrp_LogRS.Fields("VrpConsWeight")
                .Fields("VrpConsNos") = Vrp_LogRS.Fields("VrpConsNos")
                .Fields("VrpNarr") = Vrp_LogRS.Fields("VrpNarr")
                .Fields("VrpRecState") = Vrp_LogRS.Fields("VrpRecState")
                .Update
            Else
                ' any prior updations can be made here
                .Fields("VrpRecState") = ChkDeleteRecStatus(.Fields("VrpRecState"))
                .Update
                .Delete
            End If
            
            .MoveNext
        Loop
    End If
    End With
    dbTlgDatabase.CommitTrans
    CloseTable VRPRecset
    CloseTable Vrp_LogRS
    
    Rem StockJrn
    clsSTK.CancelStock mVrpStkCode
    
    Rem EndStock --------------------------------------------------
    Rem Receipt
    Data_RemoveLog mVrpCode
    
    Rem StockJrn
    clsSTK.EndStock mVrpStkCode
    
End If
dtlAddEditMode = False
dtlAddMode = False
dtlEditCanceled = False
Call EnableControls(False)
Call RefreshBalQty
Mfgrd2.SetFocus
GoTo EndSub
Exit Sub

EndSub:
Set VRPRecset = Nothing
Set Vrp_LogRS = Nothing

End Sub

Private Sub cmdShowDtlData_Click()
Dim tRecset As New ADODB.Recordset, srow As Long, cnt As Integer
srow = 1

fcmbVndName.Text = txtVndName1.Text: txtVndName1.Text = fcmbVndName.Text
fcmbItmName.Text = txtItmName1.Text: txtItmName1.Text = fcmbItmName.Text
fcmbMprName.Text = txtMprName1.Text: txtMprName1.Text = fcmbMprName.Text

tRecset.Open "Select * from VendRcPrt" _
    & " where VrpDate between #" & CStr(ToSysDate(Ctod(dtpVrpDate1.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpVrpDate2.Text))) & "#" _
    & IIf(Val(fcmbVndName.BoundText) > 0, " and VrpVndCode=" & CStr(Val(fcmbVndName.BoundText)), "") _
    & IIf(Val(fcmbItmName.BoundText) > 0, " and VrpItmCode=" & CStr(Val(fcmbItmName.BoundText)), "") _
    & IIf(Val(fcmbMprName.BoundText) > 0, " and VrpMprCode=" & CStr(Val(fcmbMprName.BoundText)), "") _
    & " order by VrpDate,VrpICode" _
    , dbTlgDatabase, adOpenKeyset, adLockOptimistic
With tRecset
If .RecordCount > 0 Then
    Do While .EOF = False
        clsVND.GetData .Fields("VrpVndCode")
        clsITM.GetData .Fields("VrpItmCode")
        clsMPR.GetData .Fields("VrpMprCode")
        
        Mfgrd2.TextMatrix(srow, X2VRPICODE_COL) = .Fields("VrpICode")
        Mfgrd2.TextMatrix(srow, X2VRPDATE_COL) = Dtoc(.Fields("VrpDate"))
        Mfgrd2.TextMatrix(srow, X2VNDNAME_COL) = clsVND.mAhName_str
        Mfgrd2.TextMatrix(srow, X2ITMNAME_COL) = clsITM.mItmName_str
        Mfgrd2.TextMatrix(srow, X2MPRNAME_COL) = clsMPR.mName_str
        Mfgrd2.TextMatrix(srow, X2VRPUNITWEIGHT_COL) = ToMyNumFmt(.Fields("VrpUnitWeight"), mDecimals:=3)
        Mfgrd2.TextMatrix(srow, X2VRPFINOUTWEIGHT_COL) = ToMyNumFmt(.Fields("VrpFinOutWeight"), mDecimals:=3)
        Mfgrd2.TextMatrix(srow, X2VRPFINOUTNOS_COL) = ToMyNumFmt(.Fields("VrpFinOutNos"), mDecimals:=0)
        Mfgrd2.TextMatrix(srow, X2VRPREJOUTWEIGHT_COL) = ToMyNumFmt(.Fields("VrpRejOutWeight"), mDecimals:=3)
        Mfgrd2.TextMatrix(srow, X2VRPREJOUTNOS_COL) = ToMyNumFmt(.Fields("VrpRejOutNos"), mDecimals:=0)
        Mfgrd2.TextMatrix(srow, X2VRPCODE_COL) = .Fields("VrpCode")
        Mfgrd2.TextMatrix(srow, X2VRPSNO_COL) = .Fields("VrpSno")
        Mfgrd2.TextMatrix(srow, X2VRPVNDCODE_COL) = .Fields("VrpVndCode")
        Mfgrd2.TextMatrix(srow, X2VRPITMCODE_COL) = .Fields("VrpItmCode")
        Mfgrd2.TextMatrix(srow, X2VRPMPRCODE_COL) = .Fields("VrpMprCode")
        Mfgrd2.TextMatrix(srow, X2VRPSTKCODE_COL) = .Fields("VrpStkCode")
        Mfgrd2.TextMatrix(srow, X2VRPSTKICODEIS_COL) = .Fields("VrpStkICodeIs")
        Mfgrd2.TextMatrix(srow, X2VRPSTKICODERC_COL) = .Fields("VrpStkICodeRc")
        Mfgrd2.TextMatrix(srow, X2VRPRECSTATE_COL) = .Fields("VrpRecState")
        Rem calculate balance quantity for Receipt
        Mfgrd2.TextMatrix(srow, X2BALWEIGHTFORRCPT_COL) = GetBalUnitForRcpt(mAddEditMode:=False, mMeasUnit:=WEIGHT_UNIT, srow:=srow)
        Mfgrd2.TextMatrix(srow, X2BALNOSFORRCPT_COL) = GetBalUnitForRcpt(mAddEditMode:=False, mMeasUnit:=NOS_UNIT, srow:=srow)
        Mfgrd2.TextMatrix(srow, X2BALNOSFORMACH_COL) = GetBalNosForMach(mAddEditMode:=False, srow:=srow)
        
        srow = srow + 1
        If Mfgrd2.Rows < srow + 1 Then
            Mfgrd2.Rows = Mfgrd2.Rows + 1
        End If
        
        .MoveNext
    Loop
End If
End With
CloseTable tRecset

ClearFlexRow Mfgrd2, srow
Mfgrd2.Rows = srow + 1
Mfgrd2.SetFocus

End Sub

Private Sub dtpVrpDate_GotFocus()
FlashActiveControl dtpVrpDate, True
End Sub

Private Sub dtpVrpDate_LostFocus()
FlashActiveControl dtpVrpDate, False
End Sub

Private Sub dtpVrpDate_Validate(Cancel As Boolean)
dtpVrpDate.Text = ToMyDate(dtpVrpDate.Text)
If IsFinYrDate(Ctod(dtpVrpDate.Text)) = False Then
    ErrorBox "Invalid Date !!!"
    dtpVrpDate.SetFocus
    FlashActiveControl dtpVrpDate, True
    Cancel = True
End If
Call ValidDtl

End Sub

Private Sub dtpVrpDate1_GotFocus()
FlashActiveControl dtpVrpDate1, True
End Sub

Private Sub dtpVrpDate1_LostFocus()
FlashActiveControl dtpVrpDate1, False

End Sub

Private Sub dtpVrpDate1_Validate(Cancel As Boolean)
dtpVrpDate1.Text = ToMyDate(dtpVrpDate1.Text)
If IsFinYrDate(Ctod(dtpVrpDate1.Text)) = False Then
    ErrorBox "Invalid Date !!!"
    dtpVrpDate1.SetFocus
    FlashActiveControl dtpVrpDate1, True
    Cancel = True
Else
    dtpVrpDate2.Text = dtpVrpDate1.Text
End If

End Sub

Private Sub dtpVrpDate2_GotFocus()
FlashActiveControl dtpVrpDate2, True
End Sub

Private Sub dtpVrpDate2_LostFocus()
FlashActiveControl dtpVrpDate2, False
End Sub

Private Sub dtpVrpDate2_Validate(Cancel As Boolean)
dtpVrpDate2.Text = ToMyDate(dtpVrpDate2.Text)
If IsFinYrDate(Ctod(dtpVrpDate2.Text)) = False Then
    ErrorBox "Invalid Date !!!"
    dtpVrpDate2.SetFocus
    FlashActiveControl dtpVrpDate2, True
    Cancel = True
Else
    If Ctod(dtpVrpDate1.Text) > Ctod(dtpVrpDate2.Text) Then
        dtpVrpDate1.Text = dtpVrpDate2.Text
    End If
End If

End Sub

Private Sub Form_Activate()
If mFormLoaded = False Then
    dtpVrpDate1.Text = Dtoc(DefaultEntryDate)
    dtpVrpDate2.Text = Dtoc(DefaultEntryDate)
    dtpVrpDate1.SetFocus
Else

End If

mFormLoaded = True
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
mLastKeyPressed = KeyCode
Select Case KeyCode
Case 13:
Case 27:
End Select

End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
mLastKeyPressed = KeyAscii

End Sub

Private Sub Form_Load()
Dim colcnt As Integer
mFormLoaded = False
mEntrySaved = False: mEntryAborted = False
Call Form_Resize

Call SetVoidControl(txtVoid)
mskVrpFinOutNos.Enabled = False ''' will create rounding difference in reverse calculation
mskVrpRejOutNos.Enabled = False ''' will create rounding difference in reverse calculation
mskBalWeightForRcpt.Enabled = False
mskBalNosForRcpt.Enabled = False
mskBalNosForMach.Enabled = False

OpenAcDataSource dbAcDatabase
OpenStDataSource dbStDatabase
OpenTlgDataSource dbTlgDatabase
OpenGrpDataSource dbGrpDatabase
OpenComDataSource dbComDatabase

Set clsSTK = New clsStockJrn
Set clsSTK.dbStDatabase = dbStDatabase
Set clsSTK.dbGrpDatabase = dbGrpDatabase

Set clsITM = New clsProduct
Set clsITM.dbStDatabase = dbStDatabase
Set clsITM.dbGrpDatabase = dbGrpDatabase

Set clsVND = New clsToolingMasterEntry
Set clsVND.dbAcDatabase = dbAcDatabase
Set clsVND.dbTlgDatabase = dbTlgDatabase
clsVND.MastName = "VendMast"

Set clsMPR = New clsToolingMasterEntry
Set clsMPR.dbTlgDatabase = dbTlgDatabase
clsMPR.MastName = "MatProcMast"

Set fcmbVndName = New frmFlexSearchList
Set fcmbVndName.dbAcDatabase = dbAcDatabase
Set fcmbVndName.dbComDatabase = dbComDatabase
Set fcmbVndName.frmAccessMaster = New frmVendorMast
fcmbVndName.mVendMastList = True
Load fcmbVndName

Set fcmbItmName = New frmFlexSearchList
Set fcmbItmName.dbStDatabase = dbStDatabase
Set fcmbItmName.frmAccessMaster = New frmItemMast
fcmbItmName.mProdMastList = True
Load fcmbItmName

Set fcmbMprName = New frmFlexSearchList
Set fcmbMprName.dbTlgDatabase = dbTlgDatabase
Set fcmbMprName.frmAccessMaster = New frmMaterialProcessMast
fcmbMprName.mMatProcMastList = True
Load fcmbMprName

Mfgrd2.Rows = 2: Mfgrd2.FixedRows = 1: Mfgrd2.Cols = MFGRD2_COLS: Mfgrd2.FixedCols = 0
colcnt = X2VRPICODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VRPICODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2VRPDATE_COL: Mfgrd2.ColWidth(colcnt) = dtpVrpDate.Width: Mfgrd2.TextMatrix(0, colcnt) = "Date": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VNDNAME_COL: Mfgrd2.ColWidth(colcnt) = txtVndName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Vendor Name": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2ITMNAME_COL: Mfgrd2.ColWidth(colcnt) = txtItmName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Material": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2MPRNAME_COL: Mfgrd2.ColWidth(colcnt) = txtMprName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Process": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VRPUNITWEIGHT_COL: Mfgrd2.ColWidth(colcnt) = mskVrpUnitWeight.Width: Mfgrd2.TextMatrix(0, colcnt) = "Weight/Pcs": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2VRPFINOUTWEIGHT_COL: Mfgrd2.ColWidth(colcnt) = mskVrpFinOutWeight.Width: Mfgrd2.TextMatrix(0, colcnt) = "OK Weight": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2VRPFINOUTNOS_COL: Mfgrd2.ColWidth(colcnt) = mskVrpFinOutNos.Width: Mfgrd2.TextMatrix(0, colcnt) = "OK Nos.": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2VRPREJOUTWEIGHT_COL: Mfgrd2.ColWidth(colcnt) = mskVrpRejOutWeight.Width: Mfgrd2.TextMatrix(0, colcnt) = "Rej.Weight": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2VRPREJOUTNOS_COL: Mfgrd2.ColWidth(colcnt) = mskVrpRejOutNos.Width: Mfgrd2.TextMatrix(0, colcnt) = "Rej.Nos.": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BALWEIGHTFORRCPT_COL: Mfgrd2.ColWidth(colcnt) = mskBalWeightForRcpt.Width: Mfgrd2.TextMatrix(0, colcnt) = "Issued Bal.Wt.": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BALNOSFORRCPT_COL: Mfgrd2.ColWidth(colcnt) = mskBalNosForRcpt.Width: Mfgrd2.TextMatrix(0, colcnt) = "Issued Bal.Nos.": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BALNOSFORMACH_COL: Mfgrd2.ColWidth(colcnt) = mskBalNosForMach.Width: Mfgrd2.TextMatrix(0, colcnt) = "Parting.Bal.": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2VRPCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VRPCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VRPSNO_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VRPSNO_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VRPVNDCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VRPVNDCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VRPITMCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VRPITMCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VRPMPRCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VRPMPRCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VRPSTKCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VRPSTKCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VRPSTKICODEIS_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VRPSTKICODEIS_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VRPSTKICODERC_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VRPSTKICODERC_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VRPRECSTATE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VRPRECSTATE_COL": Mfgrd2.ColAlignment(colcnt) = 1

EnableControls False

End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
mLastKeyPressed = 0
End Sub

Private Sub Form_Resize()
lblFormHeading.Width = Me.Width
cmdFormEscape.Left = Me.Width - (cmdFormEscape.Width * 2)
cmdFormEnter.Left = Me.Width + cmdFormEscape.Width

End Sub

Private Sub Form_Unload(Cancel As Integer)
Set clsSTK = Nothing
Set clsITM = Nothing
Set clsVND = Nothing
Set clsMPR = Nothing
Unload fcmbVndName
Unload fcmbItmName
Unload fcmbMprName
Set fcmbVndName = Nothing
Set fcmbItmName = Nothing
Set fcmbMprName = Nothing

CloseDataSource dbAcDatabase
CloseDataSource dbStDatabase
CloseDataSource dbTlgDatabase
CloseDataSource dbGrpDatabase
CloseDataSource dbComDatabase

End Sub

Private Sub Mfgrd2_DblClick()
Call Mfgrd2_KeyPress(13)
End Sub

Private Sub Mfgrd2_GotFocus()
Mfgrd2.Col = FlexLeftVisibleCol(Mfgrd2)
Mfgrd2.LeftCol = Mfgrd2.Col
If Mfgrd2.SelectionMode = flexSelectionByRow Then
    Mfgrd2.ColSel = 0: Mfgrd2.ColSel = Mfgrd2.Cols - 1
End If
Call Mfgrd2_RowColChange

End Sub

Private Sub Mfgrd2_KeyDown(KeyCode As Integer, Shift As Integer)
If Shift = 0 Then
    If InList(KeyCode, Array(vbKeyDelete, vbKeySubtract)) Then
        Call Data_DeleteEvent
    End If
End If

End Sub

Private Sub Data_DeleteEvent()
Dim VRPRecset As New ADODB.Recordset
Dim srow As Long, mDeleteit As Boolean, mVrpStkCode As Long, mVrpCode As Long
If Mfgrd2.Row = FlexNewRow(Mfgrd2) Then
    GoTo EndSub
End If
srow = Mfgrd2.Row
mVrpStkCode = Val(Mfgrd2.TextMatrix(srow, X2VRPSTKCODE_COL))
mVrpCode = Val(Mfgrd2.TextMatrix(srow, X2VRPCODE_COL))

mDeleteit = True

If mDeleteit = True Then
    Rem entry deletion does not affect inheritant but only successors
    Rem mDeleteit = ChkVrpInUnit(mAddEditMode:=False, mMeasUnit:=0)
End If

If mDeleteit = True Then
    mDeleteit = ChkVrpFinOutUnit(mAddEditMode:=False)
End If

If mDeleteit = True Then
    mDeleteit = CanDelete()
End If
If mDeleteit = True Then
    Rem begin transaction --------------------------
    Data_CreateLog mVrpCode
    clsSTK.BeginStock mVrpStkCode
    
    Rem delete transaction ------------------------------
    Rem Production
    dbTlgDatabase.BeginTrans
    With VRPRecset
    .Open "Select * from VendRcPrt where VrpCode=" & CStr(mVrpCode) & " order by VrpICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount > 0 Then
        .MoveFirst
        Do While .EOF = False
            .Fields("VrpRecState") = ChkDeleteRecStatus(.Fields("VrpRecState"))
            .Update
            Rem marked for deletion only, physically deleted in CommitStock
            .MoveNext
        Loop
    End If
    End With
    dbTlgDatabase.CommitTrans
    CloseTable VRPRecset
    
    Rem StockJrn
    clsSTK.DeleteStock mVrpStkCode
    
    Rem update transaction --------------------------------------
    Rem Production
    dbTlgDatabase.BeginTrans
    VRPRecset.Open "Select * from VendRcPrt where VrpCode=" & CStr(mVrpCode) & " order by VrpICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    With VRPRecset
    If .RecordCount > 0 Then
        .MoveFirst
        Do While .EOF = False
            If InList(.Fields("VrpRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
                .Fields("VrpRecState") = cREC_UNCHANGED
                .Update
            Else
                .Fields("VrpRecState") = ChkDeleteRecStatus(.Fields("VrpRecState"))
                .Update
                .Delete
            End If
            
            .MoveNext
        Loop
    End If
    End With
    dbTlgDatabase.CommitTrans
    CloseTable VRPRecset
    
    Rem StockJrn
    clsSTK.CommitStock mVrpStkCode
    
    Rem end transaction -----------------------------------------
    Data_RemoveLog mVrpCode
    clsSTK.EndStock mVrpStkCode
    
    RemoveFlexRow Mfgrd2, srow
    Call RefreshBalQty
    Mfgrd2.Row = srow
    Mfgrd2.SetFocus
Else
    Mfgrd2.SetFocus
End If

EndSub:
Set VRPRecset = Nothing
Exit Sub

End Sub

Private Sub Mfgrd2_KeyPress(KeyAscii As Integer)
Dim srow As Integer, mVrpStkCode As Long, mVrpCode As Long

If KeyAscii = vbKeyReturn Then
    srow = Mfgrd2.Row
    mVrpStkCode = Val(Mfgrd2.TextMatrix(srow, X2VRPSTKCODE_COL))
    mVrpCode = Val(Mfgrd2.TextMatrix(srow, X2VRPCODE_COL))
    
    dtlAddEditMode = True
    dtlAddMode = (srow = FlexNewRow(Mfgrd2))
    EnableControls True
    If dtlAddMode = True Then
        If clsSTK.BeginStock(0) = False Then
            GoTo EndSub
        End If
        mVrpCode = GetNextSeqno(dbTlgDatabase, "VendRcPrt", "VrpCode")
        Data_CreateLog mVrpCode
        
        Call ChkDefaultValues
        FormAddEditMode = cFORM_ADDMODE
    Else
        If clsSTK.BeginStock(mVrpStkCode) = False Then
            GoTo EndSub
        End If
        Data_CreateLog mVrpCode
        
        ShowControlValues srow
        
        FormAddEditMode = cFORM_EDITMODE
    End If
    Mfgrd2.Col = FlexLeftVisibleCol(Mfgrd2)
    Mfgrd2.LeftCol = Mfgrd2.Col
    
    Calc_ConvQty mskVrpFinOutWeight
    Calc_ConvQty mskVrpRejOutWeight
    mVrpDate_old = Ctod(dtpVrpDate.Text)
    mVrpItmCode_old = Val(fcmbItmName.BoundText)
    mVrpVndCode_old = Val(fcmbVndName.BoundText)
    mVrpMprCode_old = Val(fcmbMprName.BoundText)
    mVrpConsWeight_old = CurVrpConsUnit(mskVrpFinOutWeight, mMeasUnit:=WEIGHT_UNIT)
    mVrpConsNos_old = CurVrpConsUnit(mskVrpFinOutNos, mMeasUnit:=NOS_UNIT)
    mVrpFinOutWeight_old = Val(UnMyNumFmt(mskVrpFinOutWeight.Text))
    mVrpFinOutNos_old = Val(UnMyNumFmt(mskVrpFinOutNos.Text))
    
    dtpVrpDate.SetFocus
    Call ValidDtl
End If
Exit Sub

EndSub:
EnableControls False
dtlAddMode = False
dtlAddEditMode = False
FormAddEditMode = cFORM_SMRYMODE
Exit Sub

End Sub

Private Sub EnableControls(ByVal mEditItem As Boolean, Optional ByVal mRowPos)
If Me.Visible = True Then
    txtVoid.SetFocus
End If

dtpVrpDate.Text = Dtoc(DefaultEntryDate)
txtVndName.Text = "": fcmbVndName.BoundText = ""
txtItmName.Text = "": fcmbItmName.BoundText = ""
txtMprName.Text = "": fcmbMprName.BoundText = ""

mskVrpUnitWeight.Text = ToMyNumFmt(0, mDecimals:=3)
mskVrpFinOutWeight.Text = ToMyNumFmt(0, mDecimals:=3)
mskVrpFinOutNos.Text = ToMyNumFmt(0, mDecimals:=0)
mskVrpRejOutWeight.Text = ToMyNumFmt(0, mDecimals:=3)
mskVrpRejOutNos.Text = ToMyNumFmt(0, mDecimals:=0)
mskBalWeightForRcpt.Text = ToMyNumFmt(0, mDecimals:=3)
mskBalNosForRcpt.Text = ToMyNumFmt(0, mDecimals:=0)
mskBalNosForMach.Text = ToMyNumFmt(0, mDecimals:=0)

Call ValidDtl

frFlexControls.Enabled = mEditItem

Rem list of header and grid controls are common so resetting it to header values after addition/editing ends
If mEditItem = False Then
    fcmbVndName.Text = txtVndName1.Text: txtVndName1.Text = fcmbVndName.Text
    fcmbItmName.Text = txtItmName1.Text: txtItmName1.Text = fcmbItmName.Text
    fcmbMprName.Text = txtMprName1.Text: txtMprName1.Text = fcmbMprName.Text
End If

frHeader.Enabled = (mEditItem = False)
Mfgrd2.Enabled = (mEditItem = False)
If mEditItem = False Then
    FormAddEditMode = cFORM_SMRYMODE
End If

End Sub

Private Sub ValidDtl()
Dim mDataOk As Boolean
mDataOk = (IsFinYrDate(Ctod(dtpVrpDate.Text)) = True And Val(fcmbVndName.BoundText) > 0 And Val(fcmbItmName.BoundText) > 0 And Val(fcmbMprName.BoundText) > 0 And Val(UnMyNumFmt(mskVrpFinOutNos.Text)) > 0)
If mDataOk = True And InterActiveChange(cmdOK) = True Then
    mDataOk = (ChkVrpInUnit(mAddEditMode:=True, mMeasUnit:=0) = True)
End If
If mDataOk = True And InterActiveChange(cmdOK) = True And dtlAddMode = False Then
    mDataOk = (ChkVrpFinOutUnit(mAddEditMode:=True) = True)
End If
If mDataOk = True Then
    mskBalWeightForRcpt.Text = ToMyNumFmt(GetBalUnitForRcpt(mAddEditMode:=True, mMeasUnit:=WEIGHT_UNIT, srow:=Mfgrd2.Row), mDecimals:=3)
    mskBalNosForRcpt.Text = ToMyNumFmt(GetBalUnitForRcpt(mAddEditMode:=True, mMeasUnit:=NOS_UNIT, srow:=Mfgrd2.Row), mDecimals:=0)
    mskBalNosForMach.Text = ToMyNumFmt(GetBalNosForMach(mAddEditMode:=True, srow:=Mfgrd2.Row), mDecimals:=0)
Else
    mskBalWeightForRcpt.Text = ToMyNumFmt(0, mDecimals:=3)
    mskBalNosForRcpt.Text = ToMyNumFmt(0, mDecimals:=0)
    mskBalNosForMach.Text = ToMyNumFmt(0, mDecimals:=0)
End If

cmdOK.Caption = IIf(mDataOk = True, "&OK", "&Cancel")
cmdOK.BackColor = IIf(mDataOk = True, &H80FF80, &H8080FF)
End Sub

Private Sub Calc_ConvQty(ByRef mObj As Object)
If mObj.Name = mskVrpFinOutWeight.Name Then
    mskVrpFinOutNos.Text = ToMyNumFmt(MyDivide(Val(UnMyNumFmt(mskVrpFinOutWeight.Text)), Val(UnMyNumFmt(mskVrpUnitWeight.Text))), mDecimals:=0)
ElseIf mObj.Name = mskVrpRejOutWeight.Name Then
    mskVrpRejOutNos.Text = ToMyNumFmt(MyDivide(Val(UnMyNumFmt(mskVrpRejOutWeight.Text)), Val(UnMyNumFmt(mskVrpUnitWeight.Text))), mDecimals:=0)
End If

End Sub

Private Sub Mfgrd2_RowColChange()
Dim srow As Long
srow = Mfgrd2.Row
If dtlAddEditMode = False Then
    ShowControlValues srow
End If

End Sub

Private Sub mskVrpRejOutWeight_GotFocus()
FlashActiveControl mskVrpRejOutWeight, True
End Sub

Private Sub mskVrpRejOutWeight_LostFocus()
FlashActiveControl mskVrpRejOutWeight, False
End Sub

Private Sub mskVrpRejOutWeight_Validate(Cancel As Boolean)
mskVrpRejOutWeight.Text = ToMyNumFmt(mskVrpRejOutWeight.Text, mDecimals:=3)

Calc_ConvQty mskVrpRejOutWeight
If ChkVrpInUnit(mAddEditMode:=True, mMeasUnit:=WEIGHT_UNIT) = False Then
    Rem only message because other input qty change might be required
End If

Call ValidDtl
End Sub

Private Sub mskVrpUnitWeight_GotFocus()
FlashActiveControl mskVrpUnitWeight, True
End Sub

Private Sub mskVrpUnitWeight_LostFocus()
FlashActiveControl mskVrpUnitWeight, False
End Sub

Private Sub mskVrpUnitWeight_Validate(Cancel As Boolean)
mskVrpUnitWeight.Text = ToMyNumFmt(mskVrpUnitWeight.Text, mDecimals:=3)
If Val(UnMyNumFmt(mskVrpUnitWeight.Text)) <= 0 Then
    ErrorBox "Invalid Unit Weight !!!"
    Cancel = True
    mskVrpUnitWeight.SetFocus
Else
    Calc_ConvQty mskVrpFinOutWeight
    Calc_ConvQty mskVrpRejOutWeight
    Rem checking balance available qty
    If ChkVrpInUnit(mAddEditMode:=True, mMeasUnit:=0) = False Then
        Rem only message because other wip input qty change might be required
    End If
End If


Call ValidDtl

End Sub

Private Sub mskVrpFinOutWeight_GotFocus()
FlashActiveControl mskVrpFinOutWeight, True
End Sub

Private Sub mskVrpFinOutWeight_LostFocus()
FlashActiveControl mskVrpFinOutWeight, False
End Sub

Private Sub mskVrpFinOutWeight_Validate(Cancel As Boolean)
mskVrpFinOutWeight.Text = ToMyNumFmt(mskVrpFinOutWeight.Text, mDecimals:=3)
If Val(UnMyNumFmt(mskVrpFinOutWeight.Text)) <= 0 Then
    ErrorBox "Invalid Ok Weight !!!"
    mskVrpFinOutWeight.SetFocus
    Cancel = True
Else
    Calc_ConvQty mskVrpFinOutWeight
    
    If ChkVrpInUnit(mAddEditMode:=True, mMeasUnit:=WEIGHT_UNIT) = False Then
        Rem only message because other input qty change might be required
    Else
        If dtlAddMode = False Then
            If ChkVrpFinOutUnit(mAddEditMode:=True) = False Then
                mskVrpFinOutWeight.SetFocus
                Cancel = True
            End If
        End If
    End If
End If
Call ValidDtl

End Sub

Private Sub mskVrpFinOutNos_GotFocus()
FlashActiveControl mskVrpFinOutNos, True
End Sub

Private Sub mskVrpFinOutNos_LostFocus()
FlashActiveControl mskVrpFinOutNos, False
End Sub

Private Sub mskVrpFinOutNos_Validate(Cancel As Boolean)
mskVrpFinOutNos.Text = ToMyNumFmt(mskVrpFinOutNos.Text, mDecimals:=0)
If Val(UnMyNumFmt(mskVrpFinOutNos.Text)) <= 0 Then
    ErrorBox "Invalid Nos. !!!"
    mskVrpFinOutNos.SetFocus
    Cancel = True
Else
    If ChkVrpInUnit(mAddEditMode:=True, mMeasUnit:=NOS_UNIT) = False Then
        Rem only message because other input qty change might be required
    Else
        If dtlAddMode = False Then
            If ChkVrpFinOutUnit(mAddEditMode:=True) = False Then
                mskVrpFinOutNos.SetFocus
                Cancel = True
            End If
        End If
    End If
End If
Call ValidDtl

End Sub

Rem finish output production should not fall short for already packed material, and that too for upto current date as well for consequetive dates also
Private Function ChkVrpFinOutUnit(ByVal mAddEditMode As Boolean) As Boolean
'''Dim tRecset As New ADODB.Recordset, mVrpFinOutWeight_sum As Double, mVrpFinOutNos_sum As Double, mMpkItmQty_sum As Double, mBalNos As Double, mShortVrpFinOutNos As Double
'''Dim mMaxChkDate As Date, mLoopVrpDate As Date
'''Dim mVrpDate As Date, mVrpVndCode As Long, mVrpItmCode As Long, mVrpConsWeight As Double, mVrpConsNos As Double, mVrpFinOutWeight As Double, mVrpFinOutNos As Double
'''Dim mVrpICode As Long, srow As Long
'''
'''Rem control values will be assigned just below and not anywhere in procedural section
'''srow = Mfgrd2.Row
'''If mAddEditMode = True Then
'''    mVrpDate = Ctod(dtpVrpDate.Text)
'''    mVrpVndCode = Val(fcmbVndName.BoundText)
'''    mVrpItmCode = Val(fcmbItmName.BoundText)
'''    mVrpConsWeight = CurVrpConsUnit(mskVrpFinOutWeight, mMeasUnit:=WEIGHT_UNIT)
'''    mVrpConsNos = CurVrpConsUnit(mskVrpFinOutNos, mMeasUnit:=NOS_UNIT)
'''    mVrpFinOutWeight = Val(UnMyNumFmt(mskVrpFinOutWeight.Text))
'''    mVrpFinOutNos = Val(UnMyNumFmt(mskVrpFinOutNos.Text))
'''Else
'''    Rem value assignment as done for add edit mode (keypress)
'''    mVrpDate = Ctod(Mfgrd2.TextMatrix(srow, X2VrpDATE_COL))
'''    mVrpVndCode = Val(Mfgrd2.TextMatrix(srow, X2VrpVNDCODE_COL))
'''    mVrpItmCode = Val(Mfgrd2.TextMatrix(srow, X2VrpITMCODE_COL))
'''    mVrpConsWeight = CurVrpConsUnit(Mfgrd2, mMeasUnit:=WEIGHT_UNIT, srow:=srow)
'''    mVrpConsNos = CurVrpConsUnit(Mfgrd2, mMeasUnit:=NOS_UNIT, srow:=srow)
'''    mVrpFinOutWeight = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2VrpFINOUTWEIGHT_COL)))
'''    mVrpFinOutNos = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2VrpFINOUTNOS_COL)))
'''
'''    Rem old value assignment as done for add edit mode (keypress)
'''    mVrpDate_old = mVrpDate
'''    mVrpVndCode_old = mVrpVndCode
'''    mVrpItmCode_old = mVrpItmCode
'''    mVrpConsWeight_old = mVrpConsWeight
'''    mVrpConsNos_old = mVrpConsNos
'''    mVrpFinOutWeight_old = mVrpFinOutWeight
'''    mVrpFinOutNos_old = mVrpFinOutNos
'''End If
'''mVrpICode = Val(Mfgrd2.TextMatrix(srow, X2VrpICODE_COL))
'''
'''If mVrpItmCode_old <> mVrpItmCode Then
'''    Rem check stock availability for packing of old item stock by making quantity zero
'''    Rem checking of stock availability for packing of new item is not required because it is an addition to stock for packing
'''
'''    ChkVrpFinOutUnit = True
'''    With tRecset
'''    .Open "Select top 1 * from MatPacking order by MpkDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''    If .RecordCount > 0 Then
'''        mMaxChkDate = .Fields("MpkDate")
'''    Else
'''        mMaxChkDate = mVrpDate_old
'''    End If
'''    End With
'''    CloseTable tRecset
'''
'''    mMaxChkDate = IIf(mVrpDate_old > mMaxChkDate, mVrpDate_old, mMaxChkDate)
'''    For mLoopVrpDate = mVrpDate_old To mMaxChkDate
'''        mVrpFinOutNos_sum = 0: mMpkItmQty_sum = 0
'''
'''        tRecset.Open "Select sum(VrpFinOutNos) as VrpFinOutNos_sum from VendRcPrt where VrpItmCode=" & CStr(mVrpItmCode_old) & " and VrpDate<=#" & CStr(ToSysDate(mLoopVrpDate)) & "#" & IIf(dtlAddMode = False, " and VrpICode<>" & CStr(mVrpICode), "") & " group by VrpItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''        If tRecset.RecordCount > 0 Then
'''            mVrpFinOutNos_sum = tRecset.Fields("VrpFinOutNos_sum")
'''        End If
'''        CloseTable tRecset
'''
'''        tRecset.Open "Select sum(MpkItmQty) as MpkItmQty_sum from MatPacking where MpkItmCode=" & CStr(mVrpItmCode_old) & " and MpkDate<=#" & CStr(ToSysDate(mLoopVrpDate)) & "#" & " group by MpkItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''        If tRecset.RecordCount > 0 Then
'''            mMpkItmQty_sum = tRecset.Fields("MpkItmQty_sum")
'''        End If
'''        CloseTable tRecset
'''
'''        mBalNos = mVrpFinOutNos_sum - mMpkItmQty_sum    ''' - mVrpFinOutNos_old        ''' + mVrpFinOutNos do not add it here
'''
'''        If mBalNos < 0 Then
'''            ErrorBox "Excess Packing Qty over Production Qty is " & ToMyNumFmt(mBalNos, mDecimals:=0, mUseAbs:=True) & " on dated " & Dtoc(mLoopVrpDate) & " !!!"
'''            ChkVrpFinOutUnit = False
'''            Exit For
'''        End If
'''    Next mLoopVrpDate
'''ElseIf mVrpDate < mVrpDate_old Then
'''    Rem check stock availability for packing from new date to till end packing date
'''
'''    ChkVrpFinOutUnit = True
'''    With tRecset
'''    .Open "Select top 1 * from MatPacking order by MpkDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''    If .RecordCount > 0 Then
'''        mMaxChkDate = .Fields("MpkDate")
'''    Else
'''        mMaxChkDate = mVrpDate
'''    End If
'''    End With
'''    CloseTable tRecset
'''
'''    mMaxChkDate = IIf(mVrpDate > mMaxChkDate, mVrpDate, mMaxChkDate)
'''    For mLoopVrpDate = mVrpDate To mMaxChkDate
'''        mVrpFinOutNos_sum = 0: mMpkItmQty_sum = 0
'''
'''        tRecset.Open "Select sum(VrpFinOutNos) as VrpFinOutNos_sum from VendRcPrt where VrpItmCode=" & CStr(mVrpItmCode) & " and VrpDate<=#" & CStr(ToSysDate(mLoopVrpDate)) & "#" & IIf(dtlAddMode = False, " and VrpICode<>" & CStr(mVrpICode), "") & " group by VrpItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''        If tRecset.RecordCount > 0 Then
'''            mVrpFinOutNos_sum = tRecset.Fields("VrpFinOutNos_sum")
'''        End If
'''        CloseTable tRecset
'''
'''        tRecset.Open "Select sum(MpkItmQty) as MpkItmQty_sum from MatPacking where MpkItmCode=" & CStr(mVrpItmCode) & " and MpkDate<=#" & CStr(ToSysDate(mLoopVrpDate)) & "#" & " group by MpkItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''        If tRecset.RecordCount > 0 Then
'''            mMpkItmQty_sum = tRecset.Fields("MpkItmQty_sum")
'''        End If
'''        CloseTable tRecset
'''
'''        mBalNos = mVrpFinOutNos_sum - mMpkItmQty_sum + mVrpFinOutNos '''- mVrpFinOutNos_old + mVrpFinOutNos
'''
'''        If mBalNos < 0 Then
'''            ErrorBox "Excess Packing Qty over Production Qty is " & ToMyNumFmt(mBalNos, mDecimals:=0, mUseAbs:=True) & " on dated " & Dtoc(mLoopVrpDate) & " !!!"
'''            ChkVrpFinOutUnit = False
'''            Exit For
'''        End If
'''    Next mLoopVrpDate
'''ElseIf mVrpDate > mVrpDate_old Then
'''    Rem check stock availability for packing from old date (back date) to previous date of current date by making production as zero
'''    Rem and then check stock availability for packing from new date to till end packing date by using production qty
'''
'''    ChkVrpFinOutUnit = True
'''    With tRecset
'''    .Open "Select top 1 * from MatPacking order by MpkDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''    If .RecordCount > 0 Then
'''        mMaxChkDate = .Fields("MpkDate")
'''        If mMaxChkDate >= mVrpDate Then
'''            mMaxChkDate = mVrpDate - 1
'''        End If
'''    Else
'''        mMaxChkDate = mVrpDate_old
'''    End If
'''    End With
'''    CloseTable tRecset
'''
'''    mMaxChkDate = IIf(mVrpDate_old > mMaxChkDate, mVrpDate_old, mMaxChkDate)
'''    For mLoopVrpDate = mVrpDate_old To mMaxChkDate
'''        mVrpFinOutNos_sum = 0: mMpkItmQty_sum = 0
'''
'''        tRecset.Open "Select sum(VrpFinOutNos) as VrpFinOutNos_sum from VendRcPrt where VrpItmCode=" & CStr(mVrpItmCode) & " and VrpDate<=#" & CStr(ToSysDate(mLoopVrpDate)) & "#" & IIf(dtlAddMode = False, " and VrpICode<>" & CStr(mVrpICode), "") & " group by VrpItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''        If tRecset.RecordCount > 0 Then
'''            mVrpFinOutNos_sum = tRecset.Fields("VrpFinOutNos_sum")
'''        End If
'''        CloseTable tRecset
'''
'''        tRecset.Open "Select sum(MpkItmQty) as MpkItmQty_sum from MatPacking where MpkItmCode=" & CStr(mVrpItmCode) & " and MpkDate<=#" & CStr(ToSysDate(mLoopVrpDate)) & "#" & " group by MpkItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''        If tRecset.RecordCount > 0 Then
'''            mMpkItmQty_sum = tRecset.Fields("MpkItmQty_sum")
'''        End If
'''        CloseTable tRecset
'''
'''        mBalNos = mVrpFinOutNos_sum - mMpkItmQty_sum '''- mVrpFinOutNos_old    ''' + mVrpFinOutNos qty entry deleted
'''
'''        If mBalNos < 0 Then
'''            ErrorBox "Excess Packing Qty over Production Qty is " & ToMyNumFmt(mBalNos, mDecimals:=0, mUseAbs:=True) & " on dated " & Dtoc(mLoopVrpDate) & " !!!"
'''            ChkVrpFinOutUnit = False
'''            Exit For
'''        End If
'''    Next mLoopVrpDate
'''
'''    If ChkVrpFinOutUnit = True Then
'''        With tRecset
'''        .Open "Select top 1 * from MatPacking order by MpkDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''        If .RecordCount > 0 Then
'''            mMaxChkDate = .Fields("MpkDate")
'''        Else
'''            mMaxChkDate = mVrpDate
'''        End If
'''        End With
'''        CloseTable tRecset
'''
'''        mMaxChkDate = IIf(mVrpDate > mMaxChkDate, mVrpDate, mMaxChkDate)
'''        For mLoopVrpDate = mVrpDate To mMaxChkDate
'''            mVrpFinOutNos_sum = 0: mMpkItmQty_sum = 0
'''
'''            tRecset.Open "Select sum(VrpFinOutNos) as VrpFinOutNos_sum from VendRcPrt where VrpItmCode=" & CStr(mVrpItmCode) & " and VrpDate<=#" & CStr(ToSysDate(mLoopVrpDate)) & "#" & IIf(dtlAddMode = False, " and VrpICode<>" & CStr(mVrpICode), "") & " group by VrpItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''            If tRecset.RecordCount > 0 Then
'''                mVrpFinOutNos_sum = tRecset.Fields("VrpFinOutNos_sum")
'''            End If
'''            CloseTable tRecset
'''
'''            tRecset.Open "Select sum(MpkItmQty) as MpkItmQty_sum from MatPacking where MpkItmCode=" & CStr(mVrpItmCode) & " and MpkDate<=#" & CStr(ToSysDate(mLoopVrpDate)) & "#" & " group by MpkItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''            If tRecset.RecordCount > 0 Then
'''                mMpkItmQty_sum = tRecset.Fields("MpkItmQty_sum")
'''            End If
'''            CloseTable tRecset
'''
'''            mBalNos = mVrpFinOutNos_sum - mMpkItmQty_sum + mVrpFinOutNos    ''' - mVrpFinOutNos_old
'''
'''            If mBalNos < 0 Then
'''                ErrorBox "Excess Packing Qty over Production Qty is " & ToMyNumFmt(mBalNos, mDecimals:=0, mUseAbs:=True) & " on dated " & Dtoc(mLoopVrpDate) & " !!!"
'''                ChkVrpFinOutUnit = False
'''                Exit For
'''            End If
'''        Next mLoopVrpDate
'''    End If
'''Else
'''    Rem check stock availability for packing for current date to end packing date
'''    ChkVrpFinOutUnit = True
'''    With tRecset
'''    .Open "Select top 1 * from MatPacking order by MpkDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''    If .RecordCount > 0 Then
'''        mMaxChkDate = .Fields("MpkDate")
'''    Else
'''        mMaxChkDate = mVrpDate
'''    End If
'''    End With
'''    CloseTable tRecset
'''
'''    mMaxChkDate = IIf(mVrpDate > mMaxChkDate, mVrpDate, mMaxChkDate)
'''    For mLoopVrpDate = mVrpDate To mMaxChkDate
'''        mVrpFinOutNos_sum = 0: mMpkItmQty_sum = 0
'''
'''        tRecset.Open "Select sum(VrpFinOutNos) as VrpFinOutNos_sum from VendRcPrt where VrpItmCode=" & CStr(mVrpItmCode) & " and VrpDate<=#" & CStr(ToSysDate(mLoopVrpDate)) & "#" & IIf(dtlAddMode = False, " and VrpICode<>" & CStr(mVrpICode), "") & " group by VrpItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''        If tRecset.RecordCount > 0 Then
'''            mVrpFinOutNos_sum = tRecset.Fields("VrpFinOutNos_sum")
'''        End If
'''        CloseTable tRecset
'''
'''        tRecset.Open "Select sum(MpkItmQty) as MpkItmQty_sum from MatPacking where MpkItmCode=" & CStr(mVrpItmCode) & " and MpkDate<=#" & CStr(ToSysDate(mLoopVrpDate)) & "#" & " group by MpkItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''        If tRecset.RecordCount > 0 Then
'''            mMpkItmQty_sum = tRecset.Fields("MpkItmQty_sum")
'''        End If
'''        CloseTable tRecset
'''
'''        mBalNos = mVrpFinOutNos_sum - mMpkItmQty_sum + IIf(mAddEditMode = True, mVrpFinOutNos, 0) ''' - mVrpFinOutNos_old
'''
'''        If mBalNos < 0 Then
'''            ErrorBox "Excess Packing Qty over Production Qty is " & ToMyNumFmt(mBalNos, mDecimals:=0, mUseAbs:=True) & " on dated " & Dtoc(mLoopVrpDate) & " !!!"
'''            ChkVrpFinOutUnit = False
'''            Exit For
'''        End If
'''    Next mLoopVrpDate
'''
'''End If

ChkVrpFinOutUnit = True

End Function

Private Function GetBalNosForMach(ByVal mAddEditMode As Boolean, ByVal srow As Long) As Double
Dim tRecset As New ADODB.Recordset, mVrpFinOutNos_sum As Double, mMpkItmQty_sum As Double, mBalNos As Double
Dim mVrpDate As Date, mVrpVndCode As Long, mVrpItmCode As Long, mVrpConsNos As Double, mVrpFinOutNos As Double
Dim mVrpICode As Long

Rem control values will be assigned just below and not anywhere in procedural section
If mAddEditMode = True Then
    mVrpDate = Ctod(dtpVrpDate.Text)
    mVrpVndCode = Val(fcmbVndName.BoundText)
    mVrpItmCode = Val(fcmbItmName.BoundText)
    mVrpConsNos = CurVrpConsUnit(mskVrpFinOutNos, mMeasUnit:=NOS_UNIT)
    mVrpFinOutNos = Val(UnMyNumFmt(mskVrpFinOutNos.Text))
Else
    mVrpDate = Ctod(Mfgrd2.TextMatrix(srow, X2VRPDATE_COL))
    mVrpVndCode = Val(Mfgrd2.TextMatrix(srow, X2VRPVNDCODE_COL))
    mVrpItmCode = Val(Mfgrd2.TextMatrix(srow, X2VRPITMCODE_COL))
    mVrpConsNos = CurVrpConsUnit(Mfgrd2, srow)
    mVrpFinOutNos = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2VRPFINOUTNOS_COL)))
End If
mVrpICode = Val(Mfgrd2.TextMatrix(srow, X2VRPICODE_COL))

Rem check stock availability for packing for current date to end packing date
    
mVrpFinOutNos_sum = 0: mMpkItmQty_sum = 0

tRecset.Open "Select sum(VrpFinOutNos) as VrpFinOutNos_sum from VendRcPrt where VrpItmCode=" & CStr(mVrpItmCode) & " and VrpDate<=#" & CStr(ToSysDate(mVrpDate)) & "#" & IIf(dtlAddMode = False, " and VrpICode<>" & CStr(mVrpICode), "") & " group by VrpItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
If tRecset.RecordCount > 0 Then
    mVrpFinOutNos_sum = tRecset.Fields("VrpFinOutNos_sum")
End If
CloseTable tRecset

tRecset.Open "Select sum(MpkItmQty) as MpkItmQty_sum from MatPacking where MpkItmCode=" & CStr(mVrpItmCode) & " and MpkDate<=#" & CStr(ToSysDate(mVrpDate)) & "#" & " group by MpkItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
If tRecset.RecordCount > 0 Then
    mMpkItmQty_sum = tRecset.Fields("MpkItmQty_sum")
End If
CloseTable tRecset

mBalNos = mVrpFinOutNos_sum - mMpkItmQty_sum + mVrpFinOutNos
      
GetBalNosForMach = mBalNos

End Function

Rem production can not be greater than material issued quantity
Private Function ChkVrpInUnit(ByVal mAddEditMode As Boolean, ByVal mMeasUnit As Integer) As Boolean
Dim tRecset As New ADODB.Recordset, mVipWeight_sum As Double, mVipNos_sum As Double, mVrpConsWeight_sum As Double, mVrpConsNos_sum As Double, mBalNos As Double, mBalWeight As Double
Dim mMaxChkDate As Date, mLoopVrpDate As Date
Dim mVrpDate As Date, mVrpVndCode As Long, mVrpItmCode As Long, mVrpConsWeight As Double, mVrpConsNos As Double, mVrpFinOutWeight As Double, mVrpFinOutNos As Double
Dim mVrpICode As Long, srow As Long

Rem control values will be assigned just below and not anywhere in procedural section
srow = Mfgrd2.Row
If mAddEditMode = True Then
    mVrpDate = Ctod(dtpVrpDate.Text)
    mVrpVndCode = Val(fcmbVndName.BoundText)
    mVrpItmCode = Val(fcmbItmName.BoundText)
    mVrpConsWeight = CurVrpConsUnit(mskVrpFinOutWeight, mMeasUnit:=WEIGHT_UNIT)
    mVrpConsNos = CurVrpConsUnit(mskVrpFinOutNos, mMeasUnit:=NOS_UNIT)
    mVrpFinOutWeight = Val(UnMyNumFmt(mskVrpFinOutWeight.Text))
    mVrpFinOutNos = Val(UnMyNumFmt(mskVrpFinOutNos.Text))
Else
    Rem value assignment as done for add edit mode (keypress)
    mVrpDate = Ctod(Mfgrd2.TextMatrix(srow, X2VRPDATE_COL))
    mVrpVndCode = Val(Mfgrd2.TextMatrix(srow, X2VRPVNDCODE_COL))
    mVrpItmCode = Val(Mfgrd2.TextMatrix(srow, X2VRPITMCODE_COL))
    mVrpConsWeight = CurVrpConsUnit(Mfgrd2, mMeasUnit:=WEIGHT_UNIT, srow:=srow)
    mVrpConsNos = CurVrpConsUnit(Mfgrd2, mMeasUnit:=NOS_UNIT, srow:=srow)
    mVrpFinOutWeight = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2VRPFINOUTWEIGHT_COL)))
    mVrpFinOutNos = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2VRPFINOUTNOS_COL)))
    
    Rem old value assignment as done for add edit mode (keypress)
    mVrpDate_old = mVrpDate
    mVrpVndCode_old = mVrpVndCode
    mVrpItmCode_old = mVrpItmCode
    mVrpConsWeight_old = mVrpConsWeight
    mVrpConsNos_old = mVrpConsNos
    mVrpFinOutWeight_old = mVrpFinOutWeight
    mVrpFinOutNos_old = mVrpFinOutNos
End If
mVrpICode = Val(Mfgrd2.TextMatrix(srow, X2VRPICODE_COL))
    
Rem assume that old entry has been deleted by ignoring existing entry and then check normally stock availability for production from current date to end production date
ChkVrpInUnit = True
With tRecset
.Open "Select top 1 * from VendRcPrt order by VrpDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    mMaxChkDate = .Fields("VrpDate")
Else
    mMaxChkDate = mVrpDate
End If
End With
CloseTable tRecset

mMaxChkDate = IIf(mVrpDate > mMaxChkDate, mVrpDate, mMaxChkDate)
For mLoopVrpDate = mVrpDate To mMaxChkDate
    mVipWeight_sum = 0: mVipNos_sum = 0: mVrpConsWeight_sum = 0: mVrpConsNos_sum = 0
    
    tRecset.Open "Select sum(VipWeight) as VipWeight_sum, sum(VipNos) as VipNos_sum from VendIsPrt where VipVndCode=" & CStr(mVrpVndCode) & " and VipItmCode=" & CStr(mVrpItmCode) & " and VipDate<=#" & CStr(ToSysDate(mLoopVrpDate)) & "#" & " group by VipVndCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.RecordCount > 0 Then
        mVipWeight_sum = tRecset.Fields("VipWeight_sum")
        mVipNos_sum = tRecset.Fields("VipNos_sum")
    End If
    CloseTable tRecset
    
    tRecset.Open "Select sum(VrpConsWeight) as VrpConsWeight_sum, sum(VrpConsNos) as VrpConsNos_sum from VendRcPrt where VrpVndCode=" & CStr(mVrpVndCode) & " and VrpItmCode=" & CStr(mVrpItmCode) & " and VrpDate<=#" & CStr(ToSysDate(mLoopVrpDate)) & "#" & IIf(dtlAddMode = False, " and VrpICode<>" & CStr(mVrpICode), "") & " group by VrpVndCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.RecordCount > 0 Then
        mVrpConsWeight_sum = tRecset.Fields("VrpConsWeight_sum")
        mVrpConsNos_sum = tRecset.Fields("VrpConsNos_sum")
    End If
    CloseTable tRecset
    
    mBalWeight = mVipWeight_sum - mVrpConsWeight_sum - mVrpConsWeight
    mBalNos = mVipNos_sum - mVrpConsNos_sum - mVrpConsNos
    
    If (mMeasUnit = WEIGHT_UNIT Or mMeasUnit = 0) And mBalWeight < 0 Then
        ErrorBox "Excess Receipt Weight over Material Issued to Vendor is " & ToMyNumFmt(mBalWeight, mDecimals:=3, mUseAbs:=True) & " on dated " & Dtoc(mLoopVrpDate) & " !!!"
        ChkVrpInUnit = False
        Exit For
    ElseIf (mMeasUnit = NOS_UNIT Or mMeasUnit = 0) And mBalNos < 0 Then
        ErrorBox "Excess Receipt Nos. over Material Issued to Vendor is " & ToMyNumFmt(mBalNos, mDecimals:=0, mUseAbs:=True) & " on dated " & Dtoc(mLoopVrpDate) & " !!!"
        ChkVrpInUnit = False
        Exit For
    End If
Next mLoopVrpDate

End Function

Private Function GetBalUnitForRcpt(ByVal mAddEditMode As Boolean, ByVal mMeasUnit As Integer, ByVal srow As Long) As Double
Dim tRecset As New ADODB.Recordset, mVipWeight_sum As Double, mVipNos_sum As Double, mVrpConsWeight_sum As Double, mVrpConsNos_sum As Double, mBalWeight As Double, mBalNos As Double
Dim mVrpDate As Date, mVrpVndCode As Long, mVrpItmCode As Long, mVrpConsWeight As Double, mVrpConsNos As Double, mVrpFinOutWeight As Double, mVrpFinOutNos As Double
Dim mVrpICode As Long

Rem control values will be assigned just below and not anywhere in procedural section
If mAddEditMode = True Then
    mVrpDate = Ctod(dtpVrpDate.Text)
    mVrpVndCode = Val(fcmbVndName.BoundText)
    mVrpItmCode = Val(fcmbItmName.BoundText)
    mVrpConsWeight = CurVrpConsUnit(mskVrpFinOutNos, mMeasUnit:=WEIGHT_UNIT)
    mVrpConsNos = CurVrpConsUnit(mskVrpFinOutNos, mMeasUnit:=NOS_UNIT)
    mVrpFinOutWeight = Val(UnMyNumFmt(mskVrpFinOutWeight.Text))
    mVrpFinOutNos = Val(UnMyNumFmt(mskVrpFinOutNos.Text))
Else
    Rem value assignment as done for add edit mode (keypress)
    mVrpDate = Ctod(Mfgrd2.TextMatrix(srow, X2VRPDATE_COL))
    mVrpVndCode = Val(Mfgrd2.TextMatrix(srow, X2VRPVNDCODE_COL))
    mVrpItmCode = Val(Mfgrd2.TextMatrix(srow, X2VRPITMCODE_COL))
    mVrpConsWeight = CurVrpConsUnit(Mfgrd2, mMeasUnit:=WEIGHT_UNIT, srow:=srow)
    mVrpConsNos = CurVrpConsUnit(Mfgrd2, mMeasUnit:=NOS_UNIT, srow:=srow)
    mVrpFinOutWeight = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2VRPFINOUTWEIGHT_COL)))
    mVrpFinOutNos = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2VRPFINOUTNOS_COL)))
End If
mVrpICode = Val(Mfgrd2.TextMatrix(srow, X2VRPICODE_COL))
    
mVipNos_sum = 0: mVrpConsNos_sum = 0

tRecset.Open "Select sum(VipWeight) as VipWeight_sum, sum(VipNos) as VipNos_sum from VendIsPrt where VipVndCode=" & CStr(mVrpVndCode) & " and VipItmCode=" & CStr(mVrpItmCode) & " and VipDate<=#" & CStr(ToSysDate(mVrpDate)) & "#" & " group by VipVndCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
If tRecset.RecordCount > 0 Then
    mVipWeight_sum = tRecset.Fields("VipWeight_sum")
    mVipNos_sum = tRecset.Fields("VipNos_sum")
End If
CloseTable tRecset

tRecset.Open "Select sum(VrpConsWeight) as VrpConsWeight_sum, sum(VrpConsNos) as VrpConsNos_sum from VendRcPrt where VrpVndCode=" & CStr(mVrpVndCode) & " and VrpItmCode=" & CStr(mVrpItmCode) & " and VrpDate<=#" & CStr(ToSysDate(mVrpDate)) & "#" & IIf(dtlAddMode = False, " and VrpICode<>" & CStr(mVrpICode), "") & " group by VrpVndCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
If tRecset.RecordCount > 0 Then
    mVrpConsWeight_sum = tRecset.Fields("VrpConsWeight_sum")
    mVrpConsNos_sum = tRecset.Fields("VrpConsNos_sum")
End If
CloseTable tRecset

mBalWeight = mVipWeight_sum - mVrpConsWeight_sum - mVrpConsWeight
mBalNos = mVipNos_sum - mVrpConsNos_sum - mVrpConsNos

If mMeasUnit = WEIGHT_UNIT Then
    GetBalUnitForRcpt = mBalWeight
ElseIf mMeasUnit = NOS_UNIT Then
    GetBalUnitForRcpt = mBalNos
Else
    GetBalUnitForRcpt = 0
End If

End Function

Private Sub RefreshBalQty()
Dim srow As Integer
For srow = 1 To Mfgrd2.Rows - 2
    Mfgrd2.TextMatrix(srow, X2BALWEIGHTFORRCPT_COL) = ToMyNumFmt(GetBalUnitForRcpt(mAddEditMode:=False, mMeasUnit:=WEIGHT_UNIT, srow:=srow), mDecimals:=3)
    Mfgrd2.TextMatrix(srow, X2BALNOSFORRCPT_COL) = ToMyNumFmt(GetBalUnitForRcpt(mAddEditMode:=False, mMeasUnit:=NOS_UNIT, srow:=srow), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2BALNOSFORMACH_COL) = ToMyNumFmt(GetBalNosForMach(mAddEditMode:=False, srow:=srow), mDecimals:=0)
Next srow

End Sub

Rem function to calculate ConsQty when Work in Process is in existence otherwise this will be input qty only
Private Function CurVrpConsUnit(ByRef mObj As Object, ByVal mMeasUnit As Integer, Optional ByVal srow As Long) As Double
If TypeOf mObj Is ADODB.Recordset Then
    With mObj
    If mMeasUnit = WEIGHT_UNIT Then
        CurVrpConsUnit = .Fields("VrpFinOutWeight") + .Fields("VrpRejOutWeight")
    ElseIf mMeasUnit = NOS_UNIT Then
        CurVrpConsUnit = .Fields("VrpFinOutNos") + .Fields("VrpRejOutNos")
    End If
    End With
ElseIf TypeOf mObj Is MSFlexGrid Then
    With mObj
    If mMeasUnit = WEIGHT_UNIT Then
        CurVrpConsUnit = Val(UnMyNumFmt(.TextMatrix(srow, X2VRPFINOUTWEIGHT_COL))) + Val(UnMyNumFmt(.TextMatrix(srow, X2VRPREJOUTWEIGHT_COL)))
    ElseIf mMeasUnit = NOS_UNIT Then
        CurVrpConsUnit = Val(UnMyNumFmt(.TextMatrix(srow, X2VRPFINOUTNOS_COL))) + Val(UnMyNumFmt(.TextMatrix(srow, X2VRPREJOUTNOS_COL)))
    End If
    End With
ElseIf TypeOf mObj Is TextBox Then
    If mMeasUnit = WEIGHT_UNIT Then
        CurVrpConsUnit = Val(UnMyNumFmt(mskVrpFinOutWeight.Text)) + Val(UnMyNumFmt(mskVrpRejOutWeight.Text))
    ElseIf mMeasUnit = NOS_UNIT Then
        CurVrpConsUnit = Val(UnMyNumFmt(mskVrpFinOutNos.Text)) + Val(UnMyNumFmt(mskVrpRejOutNos.Text))
    End If
Else
    ErrorBox Me.Name & "_CurVrpConsUnit_1011"
End If

End Function

Private Sub mskVrpRejOutNos_GotFocus()
FlashActiveControl mskVrpRejOutNos, True
End Sub

Private Sub mskVrpRejOutNos_LostFocus()
FlashActiveControl mskVrpRejOutNos, False
End Sub

Private Sub mskVrpRejOutNos_Validate(Cancel As Boolean)
mskVrpRejOutNos.Text = ToMyNumFmt(mskVrpRejOutNos.Text, mDecimals:=0)
If ChkVrpInUnit(mAddEditMode:=True, mMeasUnit:=NOS_UNIT) = False Then
    Rem only message because other input qty change might be required
End If

Call ValidDtl
End Sub

Private Sub txtItmName_Change()
If fcmbItmName.CallFromText_Change = False Then
    fcmbItmName.CallFromText_Change = True
    If InterActiveChange(txtItmName) = True And dtlAddEditMode = True Then
        fcmbItmName.UserText = Array(txtItmName.Text, txtItmName.SelStart)
        fcmbItmName.Show 1
        txtItmName.Text = fcmbItmName.Text
    End If
    fcmbItmName.CallFromText_Change = False
End If

End Sub

Private Sub txtItmName_GotFocus()
FlashActiveControl txtItmName, True
End Sub

Private Sub txtItmName_LostFocus()
FlashActiveControl txtItmName, False
End Sub

Private Sub txtItmName_Validate(Cancel As Boolean)
If fcmbItmName.BoundText = "" Then
    ErrorBox "Invalid Item Name !!!"
    txtItmName.SetFocus
    Cancel = True
End If
Call ValidDtl

End Sub

''Private Sub ShowActiveFlexRow()
''Dim mReqdRow As Long
''
''With datRecset
''mReqdRow = .AbsolutePosition + Mfgrd1.FixedRows - 1
''If .RecordCount > 0 And .EOF = False And .BOF = False Then
''    If Mfgrd1.RowIsVisible(mReqdRow) = False Then
''        If mReqdRow > Mfgrd1.TopRow Then
''            Mfgrd1.TopRow = mReqdRow - Int(Mfgrd1.Height / Mfgrd1.RowHeightMin) + Mfgrd1.FixedRows + 1
''        Else
''            Mfgrd1.TopRow = mReqdRow
''        End If
''    End If
''    Mfgrd1.Row = mReqdRow
''Else
''    Mfgrd1.Row = Mfgrd1.FixedRows
''End If
''End With
''
''End Sub

Private Sub txtItmName1_Change()
If fcmbItmName.CallFromText_Change = False Then
    fcmbItmName.CallFromText_Change = True
    If InterActiveChange(txtItmName1) = True Then
        fcmbItmName.UserText = Array(txtItmName1.Text, txtItmName1.SelStart)
        fcmbItmName.Show 1
        txtItmName1.Text = fcmbItmName.Text
    End If
    fcmbItmName.CallFromText_Change = False
End If

End Sub

Private Sub txtItmName1_GotFocus()
FlashActiveControl txtItmName1, True

End Sub

Private Sub txtItmName1_LostFocus()
FlashActiveControl txtItmName1, False

End Sub

Private Sub txtVndName_Change()
If fcmbVndName.CallFromText_Change = False Then
    fcmbVndName.CallFromText_Change = True
    If InterActiveChange(txtVndName) = True Then
        fcmbVndName.UserText = Array(txtVndName.Text, txtVndName.SelStart)
        fcmbVndName.Show 1
        txtVndName.Text = fcmbVndName.Text
    End If
    fcmbVndName.CallFromText_Change = False
End If

End Sub

Private Sub txtVndName_GotFocus()
FlashActiveControl txtVndName, True
End Sub

Private Sub txtVndName_LostFocus()
FlashActiveControl txtVndName, False
End Sub

Private Sub txtVndName_Validate(Cancel As Boolean)
If fcmbVndName.BoundText = "" Then
    ErrorBox "Invalid Vendor Selection !!!"
    txtVndName.SetFocus
    Cancel = True
End If
Call ValidDtl

End Sub

Private Sub txtVndName1_Change()
If fcmbVndName.CallFromText_Change = False Then
    fcmbVndName.CallFromText_Change = True
    If InterActiveChange(txtVndName1) = True Then
        fcmbVndName.UserText = Array(txtVndName1.Text, txtVndName1.SelStart)
        fcmbVndName.Show 1
        txtVndName1.Text = fcmbVndName.Text
    End If
    fcmbVndName.CallFromText_Change = False
End If

End Sub

Private Sub txtVndName1_GotFocus()
FlashActiveControl txtVndName1, True
End Sub

Private Sub txtVndName1_LostFocus()
FlashActiveControl txtVndName1, False
End Sub

Private Sub ChkDefaultValues()
Dim srow As Long
srow = Mfgrd2.Row - 1
If srow > FlexHeadingRow(Mfgrd2) Then
    dtpVrpDate.Text = Mfgrd2.TextMatrix(srow, X2VRPDATE_COL)
    fcmbVndName.BoundText = Mfgrd2.TextMatrix(srow, X2VRPVNDCODE_COL): txtVndName.Text = fcmbVndName.Text
    fcmbItmName.BoundText = Mfgrd2.TextMatrix(srow, X2VRPITMCODE_COL): txtItmName.Text = fcmbItmName.Text
    fcmbMprName.BoundText = Mfgrd2.TextMatrix(srow, X2VRPMPRCODE_COL): txtMprName.Text = fcmbMprName.Text
Else
    dtpVrpDate.Text = dtpVrpDate1.Text
    fcmbVndName.Text = txtVndName1.Text: txtVndName.Text = fcmbVndName.Text
    fcmbItmName.Text = txtItmName1.Text: txtItmName.Text = fcmbItmName.Text
    fcmbMprName.Text = txtMprName1.Text: txtMprName.Text = fcmbMprName.Text
End If
mskVrpFinOutNos.Text = ToMyNumFmt(0, mDecimals:=0)
mskVrpRejOutNos.Text = ToMyNumFmt(0, mDecimals:=0)

End Sub

Private Function Data_CreateLog(ByVal mVrpCode As Long) As Boolean
Dim Vrp_LogRS As New ADODB.Recordset
Data_CreateLog = False

Vrp_LogRS.Open "Select * from VendRcPrt_Log where VrpCode=" & CStr(mVrpCode) & "", dbTlgDatabase, adOpenKeyset, adLockOptimistic
With Vrp_LogRS
If .RecordCount = 0 Then
    .Close
    Rem only ok records will be taken in log, because not ok records are created out of crashed entries which must be cleared when entry rejected
    dbTlgDatabase.BeginTrans
    dbTlgDatabase.Execute "Insert into VendRcPrt_Log Select * from VendRcPrt where VrpCode=" & CStr(mVrpCode) & " and VrpRecState=" & CStr(cREC_UNCHANGED) & ""
    dbTlgDatabase.CommitTrans
Else
    .Close
    AlertBox Me.Name & "_Data_CreateLog_920"
End If
End With

Data_CreateLog = True
GoTo EndSub
Exit Function

EndSub:
Set Vrp_LogRS = Nothing
Exit Function

End Function

Private Function Data_RemoveLog(ByVal mVrpCode As Long) As Boolean
Data_RemoveLog = False

dbTlgDatabase.BeginTrans
dbTlgDatabase.Execute "Delete from VendRcPrt_Log where VrpCode=" & CStr(mVrpCode)
dbTlgDatabase.CommitTrans

Data_RemoveLog = True
End Function

Private Sub txtMprName_Change()
If fcmbMprName.CallFromText_Change = False Then
    fcmbMprName.CallFromText_Change = True
    If InterActiveChange(txtMprName) = True Then
        fcmbMprName.UserText = Array(txtMprName.Text, txtMprName.SelStart)
        fcmbMprName.Show 1
        txtMprName.Text = fcmbMprName.Text
    End If
    fcmbMprName.CallFromText_Change = False
End If

End Sub

Private Sub txtMprName_GotFocus()
FlashActiveControl txtMprName, True
End Sub

Private Sub txtMprName_LostFocus()
FlashActiveControl txtMprName, False
End Sub

Private Sub txtMprName_Validate(Cancel As Boolean)
If fcmbMprName.BoundText = "" Then
    ErrorBox "Invalid Process Selection !!!"
    txtMprName.SetFocus
    Cancel = True
End If
Call ValidDtl

End Sub

Private Sub txtMprName1_Change()
If fcmbMprName.CallFromText_Change = False Then
    fcmbMprName.CallFromText_Change = True
    If InterActiveChange(txtMprName1) = True Then
        fcmbMprName.UserText = Array(txtMprName1.Text, txtMprName1.SelStart)
        fcmbMprName.Show 1
        txtMprName1.Text = fcmbMprName.Text
    End If
    fcmbMprName.CallFromText_Change = False
End If

End Sub

Private Sub txtMprName1_GotFocus()
FlashActiveControl txtMprName1, True
End Sub

Private Sub txtMprName1_LostFocus()
FlashActiveControl txtMprName1, False
End Sub

Private Sub ShowControlValues(ByVal srow As Long)

dtpVrpDate.Text = Mfgrd2.TextMatrix(srow, X2VRPDATE_COL)
fcmbVndName.BoundText = Mfgrd2.TextMatrix(srow, X2VRPVNDCODE_COL): txtVndName.Text = fcmbVndName.Text
fcmbItmName.BoundText = Mfgrd2.TextMatrix(srow, X2VRPITMCODE_COL): txtItmName.Text = fcmbItmName.Text
fcmbMprName.BoundText = Mfgrd2.TextMatrix(srow, X2VRPMPRCODE_COL): txtMprName.Text = fcmbMprName.Text
mskVrpUnitWeight.Text = Trim(Mfgrd2.TextMatrix(srow, X2VRPUNITWEIGHT_COL))
mskVrpFinOutWeight.Text = Trim(Mfgrd2.TextMatrix(srow, X2VRPFINOUTWEIGHT_COL))
mskVrpFinOutNos.Text = Trim(Mfgrd2.TextMatrix(srow, X2VRPFINOUTNOS_COL))
mskVrpRejOutWeight.Text = Trim(Mfgrd2.TextMatrix(srow, X2VRPREJOUTWEIGHT_COL))
mskVrpRejOutNos.Text = Trim(Mfgrd2.TextMatrix(srow, X2VRPREJOUTNOS_COL))
mskBalWeightForRcpt.Text = Trim(Mfgrd2.TextMatrix(srow, X2BALWEIGHTFORRCPT_COL))
mskBalNosForRcpt.Text = Trim(Mfgrd2.TextMatrix(srow, X2BALNOSFORRCPT_COL))
mskBalNosForMach.Text = Trim(Mfgrd2.TextMatrix(srow, X2BALNOSFORMACH_COL))

End Sub

