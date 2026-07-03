VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmVendorRcptForg 
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
      Begin VB.TextBox dtpVrfDate2 
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
      Begin VB.TextBox dtpVrfDate1 
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
      ItemData        =   "VendRFrg.frx":0000
      Left            =   0
      List            =   "VendRFrg.frx":000D
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
         Begin VB.TextBox mskVrfRejOutWeight 
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
         Begin VB.TextBox mskVrfFinOutWeight 
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
         Begin VB.TextBox mskVrfUnitWeight 
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
         Begin VB.TextBox mskVrfRejOutNos 
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
         Begin VB.TextBox mskVrfFinOutNos 
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
         Begin VB.TextBox dtpVrfDate 
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
            Caption         =   "Forged.Bal.:"
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
      Caption         =   "Vendor Receipt from Forging"
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
Attribute VB_Name = "frmVendorRcptForg"
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
Dim mVrfDate_old As Date, mVrfVndCode_old As Long, mVrfItmCode_old As Long, mVrfMprCode_old As Long, mVrfConsWeight_old As Double, mVrfConsNos_old As Double, mVrfFinOutWeight_old As Double, mVrfFinOutNos_old As Double

' StockJrn transaction detail grid Mfgrd2 column definitions
Const X2VRFICODE_COL = 0
Const X2VRFDATE_COL = 1
Const X2VNDNAME_COL = 2
Const X2ITMNAME_COL = 3
Const X2MPRNAME_COL = 4
Const X2VRFUNITWEIGHT_COL = 5
Const X2VRFFINOUTWEIGHT_COL = 6
Const X2VRFFINOUTNOS_COL = 7
Const X2VRFREJOUTWEIGHT_COL = 8
Const X2VRFREJOUTNOS_COL = 9
Const X2BALWEIGHTFORRCPT_COL = 10
Const X2BALNOSFORRCPT_COL = 11
Const X2BALNOSFORMACH_COL = 12
Const X2VRFCODE_COL = 13
Const X2VRFSNO_COL = 14
Const X2VRFVNDCODE_COL = 15
Const X2VRFITMCODE_COL = 16
Const X2VRFMPRCODE_COL = 17
Const X2VRFSTKCODE_COL = 18
Const X2VRFSTKICODEIS_COL = 19
Const X2VRFSTKICODERC_COL = 20
Const X2VRFRECSTATE_COL = 21
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
    dtpVrfDate1.SetFocus
Else
    Unload Me
End If

End Sub

Private Sub cmdOK_Click()
Dim VRFRecset As New ADODB.Recordset, VRF_LogRS As New ADODB.Recordset
Dim srow As Long, mVrfStkCode As Long, mVrfStkICodeIs As Long, mVrfStkICodeRc As Long, mVrfCode As Long, mVrfICode As Long, mVrfSno As Long, mStkItmRefCode As Long
Dim mVrfFinOutWeight As Double, mVrfFinOutNos As Double, mConsWeight As Double, mConsNos As Double

srow = Mfgrd2.Row
If dtlAddMode = True Then
    mVrfCode = GetNextSeqno(dbTlgDatabase, "VendRcFrg", "VrfCode")
    mVrfStkCode = clsSTK.ActiveStkCode
Else
    mVrfCode = Val(Mfgrd2.TextMatrix(srow, X2VRFCODE_COL))
    mVrfStkCode = Val(Mfgrd2.TextMatrix(srow, X2VRFSTKCODE_COL))
    mVrfICode = Val(Mfgrd2.TextMatrix(srow, X2VRFICODE_COL))
    mVrfStkICodeIs = Val(Mfgrd2.TextMatrix(srow, X2VRFSTKICODEIS_COL))
    mVrfStkICodeRc = Val(Mfgrd2.TextMatrix(srow, X2VRFSTKICODERC_COL))
End If
If dtlEditCanceled = False Then
    Call ValidDtl
End If
If cmdOK.Caption = "&OK" And dtlEditCanceled = False Then
    Rem addnew/update -------------------------
    Rem Forging section
    dbTlgDatabase.BeginTrans
    With VRFRecset
    If dtlAddMode = True Then
        mVrfSno = GetNextSeqno(dbTlgDatabase, "VendRcFrg", "VrfSno", "VrfCode" = CStr(mVrfCode))
        
        VRFRecset.Open "Select * from VendRcFrg where VrfCode=" & CStr(mVrfCode) & "", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        .AddNew
        Rem .Fields("VrfICode") = AutoNumber
        .Fields("VrfCode") = mVrfCode
        .Fields("VrfSno") = mVrfSno
    Else
        VRFRecset.Open "Select * from VendRcFrg where VrfCode=" & CStr(mVrfCode) & " and VrfICode=" & CStr(mVrfICode) & "", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    End If
    .Fields("VrfDate") = Ctod(dtpVrfDate.Text)
    .Fields("VrfVndCode") = Val(fcmbVndName.BoundText)
    .Fields("VrfItmCode") = Val(fcmbItmName.BoundText)
    .Fields("VrfItmRefCode") = 0
    .Fields("VrfMprCode") = Val(fcmbMprName.BoundText)
    .Fields("VrfUnitWeight") = Val(UnMyNumFmt(mskVrfUnitWeight.Text))
    .Fields("VrfUnitNos") = 1  ''' provisional
    .Fields("VrfFinOutWeight") = Val(UnMyNumFmt(mskVrfFinOutWeight.Text))
    .Fields("VrfFinOutNos") = Val(UnMyNumFmt(mskVrfFinOutNos.Text))
    .Fields("VrfRejOutWeight") = Val(UnMyNumFmt(mskVrfRejOutWeight.Text))
    .Fields("VrfRejOutNos") = Val(UnMyNumFmt(mskVrfRejOutNos.Text))
    .Fields("VrfNarr") = ""
    .Fields("VrfRecState") = ChkEditRecStatus(.Fields("VrfRecState"))
    .Update
    .Fields("VrfConsWeight") = .Fields("VrfFinOutWeight") + .Fields("VrfRejOutWeight")
    .Fields("VrfConsNos") = .Fields("VrfFinOutNos") + .Fields("VrfRejOutNos")
    .Update
    
    mVrfICode = .Fields("VrfICode")
    mConsWeight = .Fields("VrfConsWeight")
    mConsNos = .Fields("VrfConsNos")
    mVrfFinOutWeight = .Fields("VrfFinOutWeight")
    mVrfFinOutNos = .Fields("VrfFinOutNos")
    
    End With
    dbTlgDatabase.CommitTrans
    CloseTable VRFRecset
    
    Rem StockJrn section
    clsSTK.Clear
    If dtlAddMode = True Then
        Rem issue stock
        clsSTK.mStkDate_dt = Ctod(dtpVrfDate.Text)
        clsSTK.mStkItmCode_lng = Val(fcmbItmName.BoundText)
        clsSTK.mStkItmRefCode_lng = 0
        clsSTK.mStkQty_dbl = ToIssueQty(mConsWeight)
        clsSTK.mStkRate_dbl = 0
        clsSTK.mStkValue_dbl = 0
        clsSTK.mStkNarr_str = ""
        clsSTK.mStkRecState_int = cREC_NEW
        clsSTK.mStkLItmCode_lng = 0
        
        clsSTK.AddNew mVrfStkCode
        mVrfStkICodeIs = clsSTK.mStkICode_lng
        
        Rem receipt stock
        clsSTK.mStkSno_int = 0
        clsSTK.mStkQty_dbl = ToRcptQty(mVrfFinOutNos)
        
        clsSTK.AddNew mVrfStkCode, mNewItemRef:=True
        mVrfStkICodeRc = clsSTK.mStkICode_lng
        mStkItmRefCode = clsSTK.mStkItmRefCode_lng
        
        Rem StockJrn Common entry
        clsSTK.mStkSno_int = -1
        clsSTK.mStkItmCode_lng = 0
        clsSTK.mStkItmRefCode_lng = 0
        clsSTK.mStkQty_dbl = 0
        clsSTK.mStkNarr_str = "Vendor Receipt from Forging Entry"
        clsSTK.AddNew mVrfStkCode
    Else
        Rem issue stock
        clsSTK.GetData mVrfStkCode, mVrfStkICodeIs
        clsSTK.mStkDate_dt = Ctod(dtpVrfDate.Text)
        clsSTK.mStkItmCode_lng = Val(fcmbItmName.BoundText)
        clsSTK.mStkItmRefCode_lng = 0
        clsSTK.mStkQty_dbl = ToIssueQty(mConsWeight)
        clsSTK.mStkRate_dbl = 0
        clsSTK.mStkValue_dbl = 0
        clsSTK.mStkNarr_str = ""
        clsSTK.Update mVrfStkCode, mVrfStkICodeIs
        
        Rem receipt stock
        clsSTK.GetData mVrfStkCode, mVrfStkICodeRc
        clsSTK.mStkDate_dt = Ctod(dtpVrfDate.Text)
        clsSTK.mStkItmCode_lng = Val(fcmbItmName.BoundText)
        Rem clsSTK.mStkItmRefCode_lng = 0
        clsSTK.mStkQty_dbl = ToRcptQty(mVrfFinOutNos)    ' rejoutqty is to be considered ???
        clsSTK.mStkRate_dbl = 0
        clsSTK.mStkValue_dbl = 0
        clsSTK.mStkNarr_str = ""
        If mVrfItmCode_old <> clsSTK.mStkItmCode_lng Or clsSTK.mStkItmRefCode_lng = 0 Then
            clsSTK.Update mVrfStkCode, mVrfStkICodeRc, mNewItemRef:=True
        Else
            clsSTK.Update mVrfStkCode, mVrfStkICodeRc
        End If
        mStkItmRefCode = clsSTK.mStkItmRefCode_lng
        
        Rem StockJrn common entry
        clsSTK.GetData mVrfStkCode, 0, -1
        clsSTK.mStkDate_dt = Ctod(dtpVrfDate.Text)
        clsSTK.mStkItmCode_lng = 0
        clsSTK.mStkItmRefCode_lng = 0
        clsSTK.mStkQty_dbl = 0
        clsSTK.mStkRate_dbl = 0
        clsSTK.mStkValue_dbl = 0
        clsSTK.mStkNarr_str = "Vendor Receipt from Forging Entry"
        
        clsSTK.Update mVrfStkCode, clsSTK.mStkICode_lng
    End If
    
    Rem update stock ----------------------------------------
    Rem Receipt updation
    dbTlgDatabase.BeginTrans
    VRFRecset.Open "Select * from VendRcFrg where VrfCode=" & CStr(mVrfCode) & " order by VrfICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    With VRFRecset
    If .RecordCount > 0 Then
        .MoveFirst
        Do While .EOF = False
            If InList(.Fields("VrfRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
                If dtlAddMode = True Then
                    .Fields("VrfStkCode") = mVrfStkCode
                    .Fields("VrfStkICodeIs") = mVrfStkICodeIs
                    .Fields("VrfStkICodeRc") = mVrfStkICodeRc
                    .Fields("VrfItmRefCode") = mStkItmRefCode
                Else
                    .Fields("VrfItmRefCode") = mStkItmRefCode
                End If
                .Fields("VrfRecState") = cREC_UNCHANGED
                .Update
            Else
                .Fields("VrfRecState") = ChkDeleteRecStatus(.Fields("VrfRecState"))
                .Update
                .Delete
            End If
            
            .MoveNext
        Loop
    End If
    End With
    dbTlgDatabase.CommitTrans
    CloseTable VRFRecset
    
    Rem StockJrn updation
    clsSTK.CommitStock mVrfStkCode
    
    Rem EndStock routine ----------------------------------
    Rem Receipt
    Data_RemoveLog mVrfCode
    
    Rem StockJrn
    clsSTK.EndStock mVrfStkCode
    
    Rem show record in flexgrid
    VRFRecset.Open "Select * from VendRcFrg where VrfCode=" & CStr(mVrfCode) & " and VrfICode=" & CStr(mVrfICode) & "", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    With VRFRecset
    clsVND.GetData .Fields("VrfVndCode")
    clsITM.GetData .Fields("VrfItmCode")
    clsMPR.GetData .Fields("VrfMprCode")
    
    Mfgrd2.TextMatrix(srow, X2VRFICODE_COL) = .Fields("VrfICode")
    Mfgrd2.TextMatrix(srow, X2VRFDATE_COL) = Dtoc(.Fields("VrfDate"))
    Mfgrd2.TextMatrix(srow, X2VNDNAME_COL) = clsVND.mAhName_str
    Mfgrd2.TextMatrix(srow, X2ITMNAME_COL) = clsITM.mItmName_str
    Mfgrd2.TextMatrix(srow, X2MPRNAME_COL) = clsMPR.mName_str
    Mfgrd2.TextMatrix(srow, X2VRFUNITWEIGHT_COL) = ToMyNumFmt(.Fields("VrfUnitWeight"), mDecimals:=3)
    Mfgrd2.TextMatrix(srow, X2VRFFINOUTWEIGHT_COL) = ToMyNumFmt(.Fields("VrfFinOutWeight"), mDecimals:=3)
    Mfgrd2.TextMatrix(srow, X2VRFFINOUTNOS_COL) = ToMyNumFmt(.Fields("VrfFinOutNos"), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2VRFREJOUTWEIGHT_COL) = ToMyNumFmt(.Fields("VrfRejOutWeight"), mDecimals:=3)
    Mfgrd2.TextMatrix(srow, X2VRFREJOUTNOS_COL) = ToMyNumFmt(.Fields("VrfRejOutNos"), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2VRFCODE_COL) = .Fields("VrfCode")
    Mfgrd2.TextMatrix(srow, X2VRFSNO_COL) = .Fields("VrfSno")
    Mfgrd2.TextMatrix(srow, X2VRFVNDCODE_COL) = .Fields("VrfVndCode")
    Mfgrd2.TextMatrix(srow, X2VRFITMCODE_COL) = .Fields("VrfItmCode")
    Mfgrd2.TextMatrix(srow, X2VRFMPRCODE_COL) = .Fields("VrfMprCode")
    Mfgrd2.TextMatrix(srow, X2VRFSTKCODE_COL) = .Fields("VrfStkCode")
    Mfgrd2.TextMatrix(srow, X2VRFSTKICODEIS_COL) = .Fields("VrfStkICodeIs")
    Mfgrd2.TextMatrix(srow, X2VRFSTKICODERC_COL) = .Fields("VrfStkICodeRc")
    Mfgrd2.TextMatrix(srow, X2VRFRECSTATE_COL) = .Fields("VrfRecState")
    
    End With
    CloseTable VRFRecset
    
    If dtlAddMode = True Then
        Mfgrd2.Rows = Mfgrd2.Rows + 1
    End If
    srow = srow + 1
    Mfgrd2.Row = srow
Else
    Rem cance event -----------------------------------
    Rem Receipt
    VRFRecset.Open "Select * from VendRcFrg where VrfCode=" & CStr(mVrfCode) & " order by VrfICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    VRF_LogRS.Open "Select * from VendRcFrg_Log where VrfCode=" & CStr(mVrfCode) & " order by VrfICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    
    dbTlgDatabase.BeginTrans
    With VRFRecset
    If .RecordCount > 0 Then
        .MoveFirst
        Do While .EOF = False
            Rem stock updation is not required because balance is updated on CommitStock and not on individual item save, hence no need to revert is back
            VRF_LogRS.Find "VrfICode=" & CStr(.Fields("VrfICode")), Start:=1
            If VRF_LogRS.EOF = False Then
                ' any prior updations can be made here
                .Fields("VrfSno") = VRF_LogRS.Fields("VrfSno")
                .Fields("VrfDate") = VRF_LogRS.Fields("VrfDate")
                .Fields("VrfVndCode") = VRF_LogRS.Fields("VrfVndCode")
                .Fields("VrfItmCode") = VRF_LogRS.Fields("VrfItmCode")
                .Fields("VrfItmRefCode") = VRF_LogRS.Fields("VrfItmRefCode")
                .Fields("VrfMprCode") = VRF_LogRS.Fields("VrfMprCode")
                .Fields("VrfUnitWeight") = VRF_LogRS.Fields("VrfUnitWeight")
                .Fields("VrfUnitNos") = VRF_LogRS.Fields("VrfUnitNos")
                .Fields("VrfFinOutWeight") = VRF_LogRS.Fields("VrfFinOutWeight")
                .Fields("VrfFinOutNos") = VRF_LogRS.Fields("VrfFinOutNos")
                .Fields("VrfRejOutWeight") = VRF_LogRS.Fields("VrfRejOutWeight")
                .Fields("VrfRejOutNos") = VRF_LogRS.Fields("VrfRejOutNos")
                .Fields("VrfConsWeight") = VRF_LogRS.Fields("VrfConsWeight")
                .Fields("VrfConsNos") = VRF_LogRS.Fields("VrfConsNos")
                .Fields("VrfNarr") = VRF_LogRS.Fields("VrfNarr")
                .Fields("VrfRecState") = VRF_LogRS.Fields("VrfRecState")
                .Update
            Else
                ' any prior updations can be made here
                .Fields("VrfRecState") = ChkDeleteRecStatus(.Fields("VrfRecState"))
                .Update
                .Delete
            End If
            
            .MoveNext
        Loop
    End If
    End With
    dbTlgDatabase.CommitTrans
    CloseTable VRFRecset
    CloseTable VRF_LogRS
    
    Rem StockJrn
    clsSTK.CancelStock mVrfStkCode
    
    Rem EndStock --------------------------------------------------
    Rem Receipt
    Data_RemoveLog mVrfCode
    
    Rem StockJrn
    clsSTK.EndStock mVrfStkCode
    
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
Set VRFRecset = Nothing
Set VRF_LogRS = Nothing

End Sub

Private Sub cmdShowDtlData_Click()
Dim tRecset As New ADODB.Recordset, srow As Long, cnt As Integer
srow = 1

fcmbVndName.Text = txtVndName1.Text: txtVndName1.Text = fcmbVndName.Text
fcmbItmName.Text = txtItmName1.Text: txtItmName1.Text = fcmbItmName.Text
fcmbMprName.Text = txtMprName1.Text: txtMprName1.Text = fcmbMprName.Text

tRecset.Open "Select * from VendRcFrg" _
    & " where VrfDate between #" & CStr(ToSysDate(Ctod(dtpVrfDate1.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpVrfDate2.Text))) & "#" _
    & IIf(Val(fcmbVndName.BoundText) > 0, " and VrfVndCode=" & CStr(Val(fcmbVndName.BoundText)), "") _
    & IIf(Val(fcmbItmName.BoundText) > 0, " and VrfItmCode=" & CStr(Val(fcmbItmName.BoundText)), "") _
    & IIf(Val(fcmbMprName.BoundText) > 0, " and VrfMprCode=" & CStr(Val(fcmbMprName.BoundText)), "") _
    & " order by VrfDate,VrfICode" _
    , dbTlgDatabase, adOpenKeyset, adLockOptimistic
With tRecset
If .RecordCount > 0 Then
    Do While .EOF = False
        clsVND.GetData .Fields("VrfVndCode")
        clsITM.GetData .Fields("VrfItmCode")
        clsMPR.GetData .Fields("VrfMprCode")
        
        Mfgrd2.TextMatrix(srow, X2VRFICODE_COL) = .Fields("VrfICode")
        Mfgrd2.TextMatrix(srow, X2VRFDATE_COL) = Dtoc(.Fields("VrfDate"))
        Mfgrd2.TextMatrix(srow, X2VNDNAME_COL) = clsVND.mAhName_str
        Mfgrd2.TextMatrix(srow, X2ITMNAME_COL) = clsITM.mItmName_str
        Mfgrd2.TextMatrix(srow, X2MPRNAME_COL) = clsMPR.mName_str
        Mfgrd2.TextMatrix(srow, X2VRFUNITWEIGHT_COL) = ToMyNumFmt(.Fields("VrfUnitWeight"), mDecimals:=3)
        Mfgrd2.TextMatrix(srow, X2VRFFINOUTWEIGHT_COL) = ToMyNumFmt(.Fields("VrfFinOutWeight"), mDecimals:=3)
        Mfgrd2.TextMatrix(srow, X2VRFFINOUTNOS_COL) = ToMyNumFmt(.Fields("VrfFinOutNos"), mDecimals:=0)
        Mfgrd2.TextMatrix(srow, X2VRFREJOUTWEIGHT_COL) = ToMyNumFmt(.Fields("VrfRejOutWeight"), mDecimals:=3)
        Mfgrd2.TextMatrix(srow, X2VRFREJOUTNOS_COL) = ToMyNumFmt(.Fields("VrfRejOutNos"), mDecimals:=0)
        Mfgrd2.TextMatrix(srow, X2VRFCODE_COL) = .Fields("VrfCode")
        Mfgrd2.TextMatrix(srow, X2VRFSNO_COL) = .Fields("VrfSno")
        Mfgrd2.TextMatrix(srow, X2VRFVNDCODE_COL) = .Fields("VrfVndCode")
        Mfgrd2.TextMatrix(srow, X2VRFITMCODE_COL) = .Fields("VrfItmCode")
        Mfgrd2.TextMatrix(srow, X2VRFMPRCODE_COL) = .Fields("VrfMprCode")
        Mfgrd2.TextMatrix(srow, X2VRFSTKCODE_COL) = .Fields("VrfStkCode")
        Mfgrd2.TextMatrix(srow, X2VRFSTKICODEIS_COL) = .Fields("VrfStkICodeIs")
        Mfgrd2.TextMatrix(srow, X2VRFSTKICODERC_COL) = .Fields("VrfStkICodeRc")
        Mfgrd2.TextMatrix(srow, X2VRFRECSTATE_COL) = .Fields("VrfRecState")
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

Private Sub dtpVrfDate_GotFocus()
FlashActiveControl dtpVrfDate, True
End Sub

Private Sub dtpVrfDate_LostFocus()
FlashActiveControl dtpVrfDate, False
End Sub

Private Sub dtpVrfDate_Validate(Cancel As Boolean)
dtpVrfDate.Text = ToMyDate(dtpVrfDate.Text)
If IsFinYrDate(Ctod(dtpVrfDate.Text)) = False Then
    ErrorBox "Invalid Date !!!"
    dtpVrfDate.SetFocus
    FlashActiveControl dtpVrfDate, True
    Cancel = True
End If
Call ValidDtl

End Sub

Private Sub dtpVrfDate1_GotFocus()
FlashActiveControl dtpVrfDate1, True
End Sub

Private Sub dtpVrfDate1_LostFocus()
FlashActiveControl dtpVrfDate1, False

End Sub

Private Sub dtpVrfDate1_Validate(Cancel As Boolean)
dtpVrfDate1.Text = ToMyDate(dtpVrfDate1.Text)
If IsFinYrDate(Ctod(dtpVrfDate1.Text)) = False Then
    ErrorBox "Invalid Date !!!"
    dtpVrfDate1.SetFocus
    FlashActiveControl dtpVrfDate1, True
    Cancel = True
Else
    dtpVrfDate2.Text = dtpVrfDate1.Text
End If

End Sub

Private Sub dtpVrfDate2_GotFocus()
FlashActiveControl dtpVrfDate2, True
End Sub

Private Sub dtpVrfDate2_LostFocus()
FlashActiveControl dtpVrfDate2, False
End Sub

Private Sub dtpVrfDate2_Validate(Cancel As Boolean)
dtpVrfDate2.Text = ToMyDate(dtpVrfDate2.Text)
If IsFinYrDate(Ctod(dtpVrfDate2.Text)) = False Then
    ErrorBox "Invalid Date !!!"
    dtpVrfDate2.SetFocus
    FlashActiveControl dtpVrfDate2, True
    Cancel = True
Else
    If Ctod(dtpVrfDate1.Text) > Ctod(dtpVrfDate2.Text) Then
        dtpVrfDate1.Text = dtpVrfDate2.Text
    End If
End If

End Sub

Private Sub Form_Activate()
If mFormLoaded = False Then
    dtpVrfDate1.Text = Dtoc(DefaultEntryDate)
    dtpVrfDate2.Text = Dtoc(DefaultEntryDate)
    dtpVrfDate1.SetFocus
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
mskVrfFinOutNos.Enabled = False ''' will create rounding difference in reverse calculation
mskVrfRejOutNos.Enabled = False ''' will create rounding difference in reverse calculation
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
colcnt = X2VRFICODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VRFICODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2VRFDATE_COL: Mfgrd2.ColWidth(colcnt) = dtpVrfDate.Width: Mfgrd2.TextMatrix(0, colcnt) = "Date": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VNDNAME_COL: Mfgrd2.ColWidth(colcnt) = txtVndName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Vendor Name": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2ITMNAME_COL: Mfgrd2.ColWidth(colcnt) = txtItmName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Material": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2MPRNAME_COL: Mfgrd2.ColWidth(colcnt) = txtMprName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Process": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VRFUNITWEIGHT_COL: Mfgrd2.ColWidth(colcnt) = mskVrfUnitWeight.Width: Mfgrd2.TextMatrix(0, colcnt) = "Weight/Pcs": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2VRFFINOUTWEIGHT_COL: Mfgrd2.ColWidth(colcnt) = mskVrfFinOutWeight.Width: Mfgrd2.TextMatrix(0, colcnt) = "OK Weight": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2VRFFINOUTNOS_COL: Mfgrd2.ColWidth(colcnt) = mskVrfFinOutNos.Width: Mfgrd2.TextMatrix(0, colcnt) = "OK Nos.": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2VRFREJOUTWEIGHT_COL: Mfgrd2.ColWidth(colcnt) = mskVrfRejOutWeight.Width: Mfgrd2.TextMatrix(0, colcnt) = "Rej.Weight": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2VRFREJOUTNOS_COL: Mfgrd2.ColWidth(colcnt) = mskVrfRejOutNos.Width: Mfgrd2.TextMatrix(0, colcnt) = "Rej.Nos.": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BALWEIGHTFORRCPT_COL: Mfgrd2.ColWidth(colcnt) = mskBalWeightForRcpt.Width: Mfgrd2.TextMatrix(0, colcnt) = "Issued Bal.Wt.": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BALNOSFORRCPT_COL: Mfgrd2.ColWidth(colcnt) = mskBalNosForRcpt.Width: Mfgrd2.TextMatrix(0, colcnt) = "Issued Bal.Nos.": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BALNOSFORMACH_COL: Mfgrd2.ColWidth(colcnt) = mskBalNosForMach.Width: Mfgrd2.TextMatrix(0, colcnt) = "Forged.Bal.": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2VRFCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VRFCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VRFSNO_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VRFSNO_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VRFVNDCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VRFVNDCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VRFITMCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VRFITMCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VRFMPRCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VRFMPRCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VRFSTKCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VRFSTKCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VRFSTKICODEIS_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VRFSTKICODEIS_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VRFSTKICODERC_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VRFSTKICODERC_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VRFRECSTATE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VRFRECSTATE_COL": Mfgrd2.ColAlignment(colcnt) = 1

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
Dim VRFRecset As New ADODB.Recordset
Dim srow As Long, mDeleteit As Boolean, mVrfStkCode As Long, mVrfCode As Long
If Mfgrd2.Row = FlexNewRow(Mfgrd2) Then
    GoTo EndSub
End If
srow = Mfgrd2.Row
mVrfStkCode = Val(Mfgrd2.TextMatrix(srow, X2VRFSTKCODE_COL))
mVrfCode = Val(Mfgrd2.TextMatrix(srow, X2VRFCODE_COL))

mDeleteit = True

If mDeleteit = True Then
    Rem entry deletion does not affect inheritant but only successors
    Rem mDeleteit = ChkVrfInUnit(mAddEditMode:=False, mMeasUnit:=0)
End If

If mDeleteit = True Then
    mDeleteit = ChkVrfFinOutUnit(mAddEditMode:=False)
End If

If mDeleteit = True Then
    mDeleteit = CanDelete()
End If
If mDeleteit = True Then
    Rem begin transaction --------------------------
    Data_CreateLog mVrfCode
    clsSTK.BeginStock mVrfStkCode
    
    Rem delete transaction ------------------------------
    Rem Receipt
    dbTlgDatabase.BeginTrans
    With VRFRecset
    .Open "Select * from VendRcFrg where VrfCode=" & CStr(mVrfCode) & " order by VrfICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount > 0 Then
        .MoveFirst
        Do While .EOF = False
            .Fields("VrfRecState") = ChkDeleteRecStatus(.Fields("VrfRecState"))
            .Update
            Rem marked for deletion only, physically deleted in CommitStock
            .MoveNext
        Loop
    End If
    End With
    dbTlgDatabase.CommitTrans
    CloseTable VRFRecset
    
    Rem StockJrn
    clsSTK.DeleteStock mVrfStkCode
    
    Rem update transaction --------------------------------------
    Rem Receipt
    dbTlgDatabase.BeginTrans
    VRFRecset.Open "Select * from VendRcFrg where VrfCode=" & CStr(mVrfCode) & " order by VrfICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    With VRFRecset
    If .RecordCount > 0 Then
        .MoveFirst
        Do While .EOF = False
            If InList(.Fields("VrfRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
                .Fields("VrfRecState") = cREC_UNCHANGED
                .Update
            Else
                .Fields("VrfRecState") = ChkDeleteRecStatus(.Fields("VrfRecState"))
                .Update
                .Delete
            End If
            
            .MoveNext
        Loop
    End If
    End With
    dbTlgDatabase.CommitTrans
    CloseTable VRFRecset
    
    Rem StockJrn
    clsSTK.CommitStock mVrfStkCode
    
    Rem end transaction -----------------------------------------
    Data_RemoveLog mVrfCode
    clsSTK.EndStock mVrfStkCode
    
    RemoveFlexRow Mfgrd2, srow
    Call RefreshBalQty
    Mfgrd2.Row = srow
    Mfgrd2.SetFocus
Else
    Mfgrd2.SetFocus
End If

EndSub:
Set VRFRecset = Nothing
Exit Sub

End Sub

Private Sub Mfgrd2_KeyPress(KeyAscii As Integer)
Dim srow As Integer, mVrfStkCode As Long, mVrfCode As Long

If KeyAscii = vbKeyReturn Then
    srow = Mfgrd2.Row
    mVrfStkCode = Val(Mfgrd2.TextMatrix(srow, X2VRFSTKCODE_COL))
    mVrfCode = Val(Mfgrd2.TextMatrix(srow, X2VRFCODE_COL))
    
    dtlAddEditMode = True
    dtlAddMode = (srow = FlexNewRow(Mfgrd2))
    EnableControls True
    If dtlAddMode = True Then
        If clsSTK.BeginStock(0) = False Then
            GoTo EndSub
        End If
        mVrfCode = GetNextSeqno(dbTlgDatabase, "VendRcFrg", "VrfCode")
        Data_CreateLog mVrfCode
        
        Call ChkDefaultValues
        FormAddEditMode = cFORM_ADDMODE
    Else
        If clsSTK.BeginStock(mVrfStkCode) = False Then
            GoTo EndSub
        End If
        Data_CreateLog mVrfCode
        
        ShowControlValues srow
        
        FormAddEditMode = cFORM_EDITMODE
    End If
    Mfgrd2.Col = FlexLeftVisibleCol(Mfgrd2)
    Mfgrd2.LeftCol = Mfgrd2.Col
    
    Calc_ConvQty mskVrfFinOutWeight
    Calc_ConvQty mskVrfRejOutWeight
    mVrfDate_old = Ctod(dtpVrfDate.Text)
    mVrfItmCode_old = Val(fcmbItmName.BoundText)
    mVrfVndCode_old = Val(fcmbVndName.BoundText)
    mVrfMprCode_old = Val(fcmbMprName.BoundText)
    mVrfConsWeight_old = CurVrfConsUnit(mskVrfFinOutWeight, mMeasUnit:=WEIGHT_UNIT)
    mVrfConsNos_old = CurVrfConsUnit(mskVrfFinOutNos, mMeasUnit:=NOS_UNIT)
    mVrfFinOutWeight_old = Val(UnMyNumFmt(mskVrfFinOutWeight.Text))
    mVrfFinOutNos_old = Val(UnMyNumFmt(mskVrfFinOutNos.Text))
    
    dtpVrfDate.SetFocus
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

dtpVrfDate.Text = Dtoc(DefaultEntryDate)
txtVndName.Text = "": fcmbVndName.BoundText = ""
txtItmName.Text = "": fcmbItmName.BoundText = ""
txtMprName.Text = "": fcmbMprName.BoundText = ""

mskVrfUnitWeight.Text = ToMyNumFmt(0, mDecimals:=3)
mskVrfFinOutWeight.Text = ToMyNumFmt(0, mDecimals:=3)
mskVrfFinOutNos.Text = ToMyNumFmt(0, mDecimals:=0)
mskVrfRejOutWeight.Text = ToMyNumFmt(0, mDecimals:=3)
mskVrfRejOutNos.Text = ToMyNumFmt(0, mDecimals:=0)
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
mDataOk = (IsFinYrDate(Ctod(dtpVrfDate.Text)) = True And Val(fcmbVndName.BoundText) > 0 And Val(fcmbItmName.BoundText) > 0 And Val(fcmbMprName.BoundText) > 0 And Val(UnMyNumFmt(mskVrfFinOutNos.Text)) > 0)
If mDataOk = True And InterActiveChange(cmdOK) = True Then
    mDataOk = (ChkVrfInUnit(mAddEditMode:=True, mMeasUnit:=0) = True)
End If
If mDataOk = True And InterActiveChange(cmdOK) = True And dtlAddMode = False Then
    mDataOk = (ChkVrfFinOutUnit(mAddEditMode:=True) = True)
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
If mObj.Name = mskVrfFinOutWeight.Name Then
    mskVrfFinOutNos.Text = ToMyNumFmt(MyDivide(Val(UnMyNumFmt(mskVrfFinOutWeight.Text)), Val(UnMyNumFmt(mskVrfUnitWeight.Text))), mDecimals:=0)
ElseIf mObj.Name = mskVrfRejOutWeight.Name Then
    mskVrfRejOutNos.Text = ToMyNumFmt(MyDivide(Val(UnMyNumFmt(mskVrfRejOutWeight.Text)), Val(UnMyNumFmt(mskVrfUnitWeight.Text))), mDecimals:=0)
End If

End Sub

Private Sub Mfgrd2_RowColChange()
Dim srow As Long
srow = Mfgrd2.Row
If dtlAddEditMode = False Then
    ShowControlValues srow
End If

End Sub

Private Sub mskVrfRejOutWeight_GotFocus()
FlashActiveControl mskVrfRejOutWeight, True
End Sub

Private Sub mskVrfRejOutWeight_LostFocus()
FlashActiveControl mskVrfRejOutWeight, False
End Sub

Private Sub mskVrfRejOutWeight_Validate(Cancel As Boolean)
mskVrfRejOutWeight.Text = ToMyNumFmt(mskVrfRejOutWeight.Text, mDecimals:=3)

Calc_ConvQty mskVrfRejOutWeight
If ChkVrfInUnit(mAddEditMode:=True, mMeasUnit:=WEIGHT_UNIT) = False Then
    Rem only message because other input qty change might be required
End If

Call ValidDtl
End Sub

Private Sub mskVrfUnitWeight_GotFocus()
FlashActiveControl mskVrfUnitWeight, True
End Sub

Private Sub mskVrfUnitWeight_LostFocus()
FlashActiveControl mskVrfUnitWeight, False
End Sub

Private Sub mskVrfUnitWeight_Validate(Cancel As Boolean)
mskVrfUnitWeight.Text = ToMyNumFmt(mskVrfUnitWeight.Text, mDecimals:=3)
If Val(UnMyNumFmt(mskVrfUnitWeight.Text)) <= 0 Then
    ErrorBox "Invalid Unit Weight !!!"
    Cancel = True
    mskVrfUnitWeight.SetFocus
Else
    Calc_ConvQty mskVrfFinOutWeight
    Calc_ConvQty mskVrfRejOutWeight
    Rem checking balance available qty
    If ChkVrfInUnit(mAddEditMode:=True, mMeasUnit:=0) = False Then
        Rem only message because other wip input qty change might be required
    End If
End If


Call ValidDtl

End Sub

Private Sub mskVrfFinOutWeight_GotFocus()
FlashActiveControl mskVrfFinOutWeight, True
End Sub

Private Sub mskVrfFinOutWeight_LostFocus()
FlashActiveControl mskVrfFinOutWeight, False
End Sub

Private Sub mskVrfFinOutWeight_Validate(Cancel As Boolean)
mskVrfFinOutWeight.Text = ToMyNumFmt(mskVrfFinOutWeight.Text, mDecimals:=3)
If Val(UnMyNumFmt(mskVrfFinOutWeight.Text)) <= 0 Then
    ErrorBox "Invalid Ok Weight !!!"
    mskVrfFinOutWeight.SetFocus
    Cancel = True
Else
    Calc_ConvQty mskVrfFinOutWeight
    
    If ChkVrfInUnit(mAddEditMode:=True, mMeasUnit:=WEIGHT_UNIT) = False Then
        Rem only message because other input qty change might be required
    Else
        If dtlAddMode = False Then
            If ChkVrfFinOutUnit(mAddEditMode:=True) = False Then
                mskVrfFinOutWeight.SetFocus
                Cancel = True
            End If
        End If
    End If
End If
Call ValidDtl

End Sub

Private Sub mskVrfFinOutNos_GotFocus()
FlashActiveControl mskVrfFinOutNos, True
End Sub

Private Sub mskVrfFinOutNos_LostFocus()
FlashActiveControl mskVrfFinOutNos, False
End Sub

Private Sub mskVrfFinOutNos_Validate(Cancel As Boolean)
mskVrfFinOutNos.Text = ToMyNumFmt(mskVrfFinOutNos.Text, mDecimals:=0)
If Val(UnMyNumFmt(mskVrfFinOutNos.Text)) <= 0 Then
    ErrorBox "Invalid Nos. !!!"
    mskVrfFinOutNos.SetFocus
    Cancel = True
Else
    If ChkVrfInUnit(mAddEditMode:=True, mMeasUnit:=NOS_UNIT) = False Then
        Rem only message because other input qty change might be required
    Else
        If dtlAddMode = False Then
            If ChkVrfFinOutUnit(mAddEditMode:=True) = False Then
                mskVrfFinOutNos.SetFocus
                Cancel = True
            End If
        End If
    End If
End If
Call ValidDtl

End Sub

Rem finish output receipt should not fall short for already packed material, and that too for upto current date as well for consequetive dates also
Private Function ChkVrfFinOutUnit(ByVal mAddEditMode As Boolean) As Boolean
'''Dim tRecset As New ADODB.Recordset, mVrfFinOutWeight_sum As Double, mVrfFinOutNos_sum As Double, mMpkItmQty_sum As Double, mBalNos As Double, mShortVrfFinOutNos As Double
'''Dim mMaxChkDate As Date, mLoopVrfDate As Date
'''Dim mVrfDate As Date, mVrfVndCode As Long, mVrfItmCode As Long, mVrfConsWeight As Double, mVrfConsNos As Double, mVrfFinOutWeight As Double, mVrfFinOutNos As Double
'''Dim mVrfICode As Long, srow As Long
'''
'''Rem control values will be assigned just below and not anywhere in procedural section
'''srow = Mfgrd2.Row
'''If mAddEditMode = True Then
'''    mVrfDate = Ctod(dtpVrfDate.Text)
'''    mVrfVndCode = Val(fcmbVndName.BoundText)
'''    mVrfItmCode = Val(fcmbItmName.BoundText)
'''    mVrfConsWeight = CurVrfConsUnit(mskVrfFinOutWeight, mMeasUnit:=WEIGHT_UNIT)
'''    mVrfConsNos = CurVrfConsUnit(mskVrfFinOutNos, mMeasUnit:=NOS_UNIT)
'''    mVrfFinOutWeight = Val(UnMyNumFmt(mskVrfFinOutWeight.Text))
'''    mVrfFinOutNos = Val(UnMyNumFmt(mskVrfFinOutNos.Text))
'''Else
'''    Rem value assignment as done for add edit mode (keypress)
'''    mVrfDate = Ctod(Mfgrd2.TextMatrix(srow, X2VRFDATE_COL))
'''    mVrfVndCode = Val(Mfgrd2.TextMatrix(srow, X2VRFVNDCODE_COL))
'''    mVrfItmCode = Val(Mfgrd2.TextMatrix(srow, X2VRFITMCODE_COL))
'''    mVrfConsWeight = CurVrfConsUnit(Mfgrd2, mMeasUnit:=WEIGHT_UNIT, srow:=srow)
'''    mVrfConsNos = CurVrfConsUnit(Mfgrd2, mMeasUnit:=NOS_UNIT, srow:=srow)
'''    mVrfFinOutWeight = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2VRFFINOUTWEIGHT_COL)))
'''    mVrfFinOutNos = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2VRFFINOUTNOS_COL)))
'''
'''    Rem old value assignment as done for add edit mode (keypress)
'''    mVrfDate_old = mVrfDate
'''    mVrfVndCode_old = mVrfVndCode
'''    mVrfItmCode_old = mVrfItmCode
'''    mVrfConsWeight_old = mVrfConsWeight
'''    mVrfConsNos_old = mVrfConsNos
'''    mVrfFinOutWeight_old = mVrfFinOutWeight
'''    mVrfFinOutNos_old = mVrfFinOutNos
'''End If
'''mVrfICode = Val(Mfgrd2.TextMatrix(srow, X2VRFICODE_COL))
'''
'''If mVrfItmCode_old <> mVrfItmCode Then
'''    Rem check stock availability for packing of old item stock by making quantity zero
'''    Rem checking of stock availability for packing of new item is not required because it is an addition to stock for packing
'''
'''    ChkVrfFinOutUnit = True
'''    With tRecset
'''    .Open "Select top 1 * from MatPacking order by MpkDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''    If .RecordCount > 0 Then
'''        mMaxChkDate = .Fields("MpkDate")
'''    Else
'''        mMaxChkDate = mVrfDate_old
'''    End If
'''    End With
'''    CloseTable tRecset
'''
'''    mMaxChkDate = IIf(mVrfDate_old > mMaxChkDate, mVrfDate_old, mMaxChkDate)
'''    For mLoopVrfDate = mVrfDate_old To mMaxChkDate
'''        mVrfFinOutNos_sum = 0: mMpkItmQty_sum = 0
'''
'''        tRecset.Open "Select sum(VrfFinOutNos) as VrfFinOutNos_sum from VendRcFrg where VrfItmCode=" & CStr(mVrfItmCode_old) & " and VrfDate<=#" & CStr(ToSysDate(mLoopVrfDate)) & "#" & IIf(dtlAddMode = False, " and VrfICode<>" & CStr(mVrfICode), "") & " group by VrfItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''        If tRecset.RecordCount > 0 Then
'''            mVrfFinOutNos_sum = tRecset.Fields("VrfFinOutNos_sum")
'''        End If
'''        CloseTable tRecset
'''
'''        tRecset.Open "Select sum(MpkItmQty) as MpkItmQty_sum from MatPacking where MpkItmCode=" & CStr(mVrfItmCode_old) & " and MpkDate<=#" & CStr(ToSysDate(mLoopVrfDate)) & "#" & " group by MpkItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''        If tRecset.RecordCount > 0 Then
'''            mMpkItmQty_sum = tRecset.Fields("MpkItmQty_sum")
'''        End If
'''        CloseTable tRecset
'''
'''        mBalNos = mVrfFinOutNos_sum - mMpkItmQty_sum    ''' - mVrfFinOutNos_old        ''' + mVrfFinOutNos do not add it here
'''
'''        If mBalNos < 0 Then
'''            ErrorBox "Excess Packing Qty over Receipt Qty is " & ToMyNumFmt(mBalNos, mDecimals:=0, mUseAbs:=True) & " on dated " & Dtoc(mLoopVrfDate) & " !!!"
'''            ChkVrfFinOutUnit = False
'''            Exit For
'''        End If
'''    Next mLoopVrfDate
'''ElseIf mVrfDate < mVrfDate_old Then
'''    Rem check stock availability for packing from new date to till end packing date
'''
'''    ChkVrfFinOutUnit = True
'''    With tRecset
'''    .Open "Select top 1 * from MatPacking order by MpkDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''    If .RecordCount > 0 Then
'''        mMaxChkDate = .Fields("MpkDate")
'''    Else
'''        mMaxChkDate = mVrfDate
'''    End If
'''    End With
'''    CloseTable tRecset
'''
'''    mMaxChkDate = IIf(mVrfDate > mMaxChkDate, mVrfDate, mMaxChkDate)
'''    For mLoopVrfDate = mVrfDate To mMaxChkDate
'''        mVrfFinOutNos_sum = 0: mMpkItmQty_sum = 0
'''
'''        tRecset.Open "Select sum(VrfFinOutNos) as VrfFinOutNos_sum from VendRcFrg where VrfItmCode=" & CStr(mVrfItmCode) & " and VrfDate<=#" & CStr(ToSysDate(mLoopVrfDate)) & "#" & IIf(dtlAddMode = False, " and VrfICode<>" & CStr(mVrfICode), "") & " group by VrfItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''        If tRecset.RecordCount > 0 Then
'''            mVrfFinOutNos_sum = tRecset.Fields("VrfFinOutNos_sum")
'''        End If
'''        CloseTable tRecset
'''
'''        tRecset.Open "Select sum(MpkItmQty) as MpkItmQty_sum from MatPacking where MpkItmCode=" & CStr(mVrfItmCode) & " and MpkDate<=#" & CStr(ToSysDate(mLoopVrfDate)) & "#" & " group by MpkItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''        If tRecset.RecordCount > 0 Then
'''            mMpkItmQty_sum = tRecset.Fields("MpkItmQty_sum")
'''        End If
'''        CloseTable tRecset
'''
'''        mBalNos = mVrfFinOutNos_sum - mMpkItmQty_sum + mVrfFinOutNos '''- mVrfFinOutNos_old + mVrfFinOutNos
'''
'''        If mBalNos < 0 Then
'''            ErrorBox "Excess Packing Qty over Receipt Qty is " & ToMyNumFmt(mBalNos, mDecimals:=0, mUseAbs:=True) & " on dated " & Dtoc(mLoopVrfDate) & " !!!"
'''            ChkVrfFinOutUnit = False
'''            Exit For
'''        End If
'''    Next mLoopVrfDate
'''ElseIf mVrfDate > mVrfDate_old Then
'''    Rem check stock availability for packing from old date (back date) to previous date of current date by making receipt as zero
'''    Rem and then check stock availability for packing from new date to till end packing date by using receipt qty
'''
'''    ChkVrfFinOutUnit = True
'''    With tRecset
'''    .Open "Select top 1 * from MatPacking order by MpkDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''    If .RecordCount > 0 Then
'''        mMaxChkDate = .Fields("MpkDate")
'''        If mMaxChkDate >= mVrfDate Then
'''            mMaxChkDate = mVrfDate - 1
'''        End If
'''    Else
'''        mMaxChkDate = mVrfDate_old
'''    End If
'''    End With
'''    CloseTable tRecset
'''
'''    mMaxChkDate = IIf(mVrfDate_old > mMaxChkDate, mVrfDate_old, mMaxChkDate)
'''    For mLoopVrfDate = mVrfDate_old To mMaxChkDate
'''        mVrfFinOutNos_sum = 0: mMpkItmQty_sum = 0
'''
'''        tRecset.Open "Select sum(VrfFinOutNos) as VrfFinOutNos_sum from VendRcFrg where VrfItmCode=" & CStr(mVrfItmCode) & " and VrfDate<=#" & CStr(ToSysDate(mLoopVrfDate)) & "#" & IIf(dtlAddMode = False, " and VrfICode<>" & CStr(mVrfICode), "") & " group by VrfItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''        If tRecset.RecordCount > 0 Then
'''            mVrfFinOutNos_sum = tRecset.Fields("VrfFinOutNos_sum")
'''        End If
'''        CloseTable tRecset
'''
'''        tRecset.Open "Select sum(MpkItmQty) as MpkItmQty_sum from MatPacking where MpkItmCode=" & CStr(mVrfItmCode) & " and MpkDate<=#" & CStr(ToSysDate(mLoopVrfDate)) & "#" & " group by MpkItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''        If tRecset.RecordCount > 0 Then
'''            mMpkItmQty_sum = tRecset.Fields("MpkItmQty_sum")
'''        End If
'''        CloseTable tRecset
'''
'''        mBalNos = mVrfFinOutNos_sum - mMpkItmQty_sum '''- mVrfFinOutNos_old    ''' + mVrfFinOutNos qty entry deleted
'''
'''        If mBalNos < 0 Then
'''            ErrorBox "Excess Packing Qty over Receipt Qty is " & ToMyNumFmt(mBalNos, mDecimals:=0, mUseAbs:=True) & " on dated " & Dtoc(mLoopVrfDate) & " !!!"
'''            ChkVrfFinOutUnit = False
'''            Exit For
'''        End If
'''    Next mLoopVrfDate
'''
'''    If ChkVrfFinOutUnit = True Then
'''        With tRecset
'''        .Open "Select top 1 * from MatPacking order by MpkDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''        If .RecordCount > 0 Then
'''            mMaxChkDate = .Fields("MpkDate")
'''        Else
'''            mMaxChkDate = mVrfDate
'''        End If
'''        End With
'''        CloseTable tRecset
'''
'''        mMaxChkDate = IIf(mVrfDate > mMaxChkDate, mVrfDate, mMaxChkDate)
'''        For mLoopVrfDate = mVrfDate To mMaxChkDate
'''            mVrfFinOutNos_sum = 0: mMpkItmQty_sum = 0
'''
'''            tRecset.Open "Select sum(VrfFinOutNos) as VrfFinOutNos_sum from VendRcFrg where VrfItmCode=" & CStr(mVrfItmCode) & " and VrfDate<=#" & CStr(ToSysDate(mLoopVrfDate)) & "#" & IIf(dtlAddMode = False, " and VrfICode<>" & CStr(mVrfICode), "") & " group by VrfItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''            If tRecset.RecordCount > 0 Then
'''                mVrfFinOutNos_sum = tRecset.Fields("VrfFinOutNos_sum")
'''            End If
'''            CloseTable tRecset
'''
'''            tRecset.Open "Select sum(MpkItmQty) as MpkItmQty_sum from MatPacking where MpkItmCode=" & CStr(mVrfItmCode) & " and MpkDate<=#" & CStr(ToSysDate(mLoopVrfDate)) & "#" & " group by MpkItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''            If tRecset.RecordCount > 0 Then
'''                mMpkItmQty_sum = tRecset.Fields("MpkItmQty_sum")
'''            End If
'''            CloseTable tRecset
'''
'''            mBalNos = mVrfFinOutNos_sum - mMpkItmQty_sum + mVrfFinOutNos    ''' - mVrfFinOutNos_old
'''
'''            If mBalNos < 0 Then
'''                ErrorBox "Excess Packing Qty over Receipt Qty is " & ToMyNumFmt(mBalNos, mDecimals:=0, mUseAbs:=True) & " on dated " & Dtoc(mLoopVrfDate) & " !!!"
'''                ChkVrfFinOutUnit = False
'''                Exit For
'''            End If
'''        Next mLoopVrfDate
'''    End If
'''Else
'''    Rem check stock availability for packing for current date to end packing date
'''    ChkVrfFinOutUnit = True
'''    With tRecset
'''    .Open "Select top 1 * from MatPacking order by MpkDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''    If .RecordCount > 0 Then
'''        mMaxChkDate = .Fields("MpkDate")
'''    Else
'''        mMaxChkDate = mVrfDate
'''    End If
'''    End With
'''    CloseTable tRecset
'''
'''    mMaxChkDate = IIf(mVrfDate > mMaxChkDate, mVrfDate, mMaxChkDate)
'''    For mLoopVrfDate = mVrfDate To mMaxChkDate
'''        mVrfFinOutNos_sum = 0: mMpkItmQty_sum = 0
'''
'''        tRecset.Open "Select sum(VrfFinOutNos) as VrfFinOutNos_sum from VendRcFrg where VrfItmCode=" & CStr(mVrfItmCode) & " and VrfDate<=#" & CStr(ToSysDate(mLoopVrfDate)) & "#" & IIf(dtlAddMode = False, " and VrfICode<>" & CStr(mVrfICode), "") & " group by VrfItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''        If tRecset.RecordCount > 0 Then
'''            mVrfFinOutNos_sum = tRecset.Fields("VrfFinOutNos_sum")
'''        End If
'''        CloseTable tRecset
'''
'''        tRecset.Open "Select sum(MpkItmQty) as MpkItmQty_sum from MatPacking where MpkItmCode=" & CStr(mVrfItmCode) & " and MpkDate<=#" & CStr(ToSysDate(mLoopVrfDate)) & "#" & " group by MpkItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''        If tRecset.RecordCount > 0 Then
'''            mMpkItmQty_sum = tRecset.Fields("MpkItmQty_sum")
'''        End If
'''        CloseTable tRecset
'''
'''        mBalNos = mVrfFinOutNos_sum - mMpkItmQty_sum + IIf(mAddEditMode = True, mVrfFinOutNos, 0) ''' - mVrfFinOutNos_old
'''
'''        If mBalNos < 0 Then
'''            ErrorBox "Excess Packing Qty over Receipt Qty is " & ToMyNumFmt(mBalNos, mDecimals:=0, mUseAbs:=True) & " on dated " & Dtoc(mLoopVrfDate) & " !!!"
'''            ChkVrfFinOutUnit = False
'''            Exit For
'''        End If
'''    Next mLoopVrfDate
'''
'''End If

ChkVrfFinOutUnit = True

End Function

Private Function GetBalNosForMach(ByVal mAddEditMode As Boolean, ByVal srow As Long) As Double
Dim tRecset As New ADODB.Recordset, mVrfFinOutNos_sum As Double, mMpkItmQty_sum As Double, mBalNos As Double
Dim mVrfDate As Date, mVrfVndCode As Long, mVrfItmCode As Long, mVrfConsNos As Double, mVrfFinOutNos As Double
Dim mVrfICode As Long

Rem control values will be assigned just below and not anywhere in procedural section
If mAddEditMode = True Then
    mVrfDate = Ctod(dtpVrfDate.Text)
    mVrfVndCode = Val(fcmbVndName.BoundText)
    mVrfItmCode = Val(fcmbItmName.BoundText)
    mVrfConsNos = CurVrfConsUnit(mskVrfFinOutNos, mMeasUnit:=NOS_UNIT)
    mVrfFinOutNos = Val(UnMyNumFmt(mskVrfFinOutNos.Text))
Else
    mVrfDate = Ctod(Mfgrd2.TextMatrix(srow, X2VRFDATE_COL))
    mVrfVndCode = Val(Mfgrd2.TextMatrix(srow, X2VRFVNDCODE_COL))
    mVrfItmCode = Val(Mfgrd2.TextMatrix(srow, X2VRFITMCODE_COL))
    mVrfConsNos = CurVrfConsUnit(Mfgrd2, srow)
    mVrfFinOutNos = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2VRFFINOUTNOS_COL)))
End If
mVrfICode = Val(Mfgrd2.TextMatrix(srow, X2VRFICODE_COL))

Rem check stock availability for packing for current date to end packing date
    
mVrfFinOutNos_sum = 0: mMpkItmQty_sum = 0

tRecset.Open "Select sum(VrfFinOutNos) as VrfFinOutNos_sum from VendRcFrg where VrfItmCode=" & CStr(mVrfItmCode) & " and VrfDate<=#" & CStr(ToSysDate(mVrfDate)) & "#" & IIf(dtlAddMode = False, " and VrfICode<>" & CStr(mVrfICode), "") & " group by VrfItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
If tRecset.RecordCount > 0 Then
    mVrfFinOutNos_sum = tRecset.Fields("VrfFinOutNos_sum")
End If
CloseTable tRecset

tRecset.Open "Select sum(MpkItmQty) as MpkItmQty_sum from MatPacking where MpkItmCode=" & CStr(mVrfItmCode) & " and MpkDate<=#" & CStr(ToSysDate(mVrfDate)) & "#" & " group by MpkItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
If tRecset.RecordCount > 0 Then
    mMpkItmQty_sum = tRecset.Fields("MpkItmQty_sum")
End If
CloseTable tRecset

mBalNos = mVrfFinOutNos_sum - mMpkItmQty_sum + mVrfFinOutNos
      
GetBalNosForMach = mBalNos

End Function

Rem receipt can not be greater than material issued quantity
Private Function ChkVrfInUnit(ByVal mAddEditMode As Boolean, ByVal mMeasUnit As Integer) As Boolean
Dim tRecset As New ADODB.Recordset, mVifWeight_sum As Double, mVifNos_sum As Double, mVrfConsWeight_sum As Double, mVrfConsNos_sum As Double, mBalNos As Double, mBalWeight As Double
Dim mMaxChkDate As Date, mLoopVrfDate As Date
Dim mVrfDate As Date, mVrfVndCode As Long, mVrfItmCode As Long, mVrfConsWeight As Double, mVrfConsNos As Double, mVrfFinOutWeight As Double, mVrfFinOutNos As Double
Dim mVrfICode As Long, srow As Long

Rem control values will be assigned just below and not anywhere in procedural section
srow = Mfgrd2.Row
If mAddEditMode = True Then
    mVrfDate = Ctod(dtpVrfDate.Text)
    mVrfVndCode = Val(fcmbVndName.BoundText)
    mVrfItmCode = Val(fcmbItmName.BoundText)
    mVrfConsWeight = CurVrfConsUnit(mskVrfFinOutWeight, mMeasUnit:=WEIGHT_UNIT)
    mVrfConsNos = CurVrfConsUnit(mskVrfFinOutNos, mMeasUnit:=NOS_UNIT)
    mVrfFinOutWeight = Val(UnMyNumFmt(mskVrfFinOutWeight.Text))
    mVrfFinOutNos = Val(UnMyNumFmt(mskVrfFinOutNos.Text))
Else
    Rem value assignment as done for add edit mode (keypress)
    mVrfDate = Ctod(Mfgrd2.TextMatrix(srow, X2VRFDATE_COL))
    mVrfVndCode = Val(Mfgrd2.TextMatrix(srow, X2VRFVNDCODE_COL))
    mVrfItmCode = Val(Mfgrd2.TextMatrix(srow, X2VRFITMCODE_COL))
    mVrfConsWeight = CurVrfConsUnit(Mfgrd2, mMeasUnit:=WEIGHT_UNIT, srow:=srow)
    mVrfConsNos = CurVrfConsUnit(Mfgrd2, mMeasUnit:=NOS_UNIT, srow:=srow)
    mVrfFinOutWeight = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2VRFFINOUTWEIGHT_COL)))
    mVrfFinOutNos = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2VRFFINOUTNOS_COL)))
    
    Rem old value assignment as done for add edit mode (keypress)
    mVrfDate_old = mVrfDate
    mVrfVndCode_old = mVrfVndCode
    mVrfItmCode_old = mVrfItmCode
    mVrfConsWeight_old = mVrfConsWeight
    mVrfConsNos_old = mVrfConsNos
    mVrfFinOutWeight_old = mVrfFinOutWeight
    mVrfFinOutNos_old = mVrfFinOutNos
End If
mVrfICode = Val(Mfgrd2.TextMatrix(srow, X2VRFICODE_COL))
    
Rem assume that old entry has been deleted by ignoring existing entry and then check normally stock availability for receipt from current date to end receipt date
ChkVrfInUnit = True
With tRecset
.Open "Select top 1 * from VendRcFrg order by VrfDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    mMaxChkDate = .Fields("VrfDate")
Else
    mMaxChkDate = mVrfDate
End If
End With
CloseTable tRecset

mMaxChkDate = IIf(mVrfDate > mMaxChkDate, mVrfDate, mMaxChkDate)
For mLoopVrfDate = mVrfDate To mMaxChkDate
    mVifWeight_sum = 0: mVifNos_sum = 0: mVrfConsWeight_sum = 0: mVrfConsNos_sum = 0
    
    tRecset.Open "Select sum(VifWeight) as VifWeight_sum, sum(VifNos) as VifNos_sum from VendIsFrg where VifVndCode=" & CStr(mVrfVndCode) & " and VifItmCode=" & CStr(mVrfItmCode) & " and VifDate<=#" & CStr(ToSysDate(mLoopVrfDate)) & "#" & " group by VifVndCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.RecordCount > 0 Then
        mVifWeight_sum = tRecset.Fields("VifWeight_sum")
        mVifNos_sum = tRecset.Fields("VifNos_sum")
    End If
    CloseTable tRecset
    
    tRecset.Open "Select sum(VrfConsWeight) as VrfConsWeight_sum, sum(VrfConsNos) as VrfConsNos_sum from VendRcFrg where VrfVndCode=" & CStr(mVrfVndCode) & " and VrfItmCode=" & CStr(mVrfItmCode) & " and VrfDate<=#" & CStr(ToSysDate(mLoopVrfDate)) & "#" & IIf(dtlAddMode = False, " and VrfICode<>" & CStr(mVrfICode), "") & " group by VrfVndCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.RecordCount > 0 Then
        mVrfConsWeight_sum = tRecset.Fields("VrfConsWeight_sum")
        mVrfConsNos_sum = tRecset.Fields("VrfConsNos_sum")
    End If
    CloseTable tRecset
    
    mBalWeight = mVifWeight_sum - mVrfConsWeight_sum - mVrfConsWeight
    mBalNos = mVifNos_sum - mVrfConsNos_sum - mVrfConsNos
    
    If (mMeasUnit = WEIGHT_UNIT Or mMeasUnit = 0) And mBalWeight < 0 Then
        ErrorBox "Excess Receipt Weight over Material Issued to Vendor is " & ToMyNumFmt(mBalWeight, mDecimals:=3, mUseAbs:=True) & " on dated " & Dtoc(mLoopVrfDate) & " !!!"
        ChkVrfInUnit = False
        Exit For
    ElseIf (mMeasUnit = NOS_UNIT Or mMeasUnit = 0) And mBalNos < 0 Then
        ErrorBox "Excess Receipt Nos. over Material Issued to Vendor is " & ToMyNumFmt(mBalNos, mDecimals:=0, mUseAbs:=True) & " on dated " & Dtoc(mLoopVrfDate) & " !!!"
        ChkVrfInUnit = False
        Exit For
    End If
Next mLoopVrfDate

End Function

Private Function GetBalUnitForRcpt(ByVal mAddEditMode As Boolean, ByVal mMeasUnit As Integer, ByVal srow As Long) As Double
Dim tRecset As New ADODB.Recordset, mVifWeight_sum As Double, mVifNos_sum As Double, mVrfConsWeight_sum As Double, mVrfConsNos_sum As Double, mBalWeight As Double, mBalNos As Double
Dim mVrfDate As Date, mVrfVndCode As Long, mVrfItmCode As Long, mVrfConsWeight As Double, mVrfConsNos As Double, mVrfFinOutWeight As Double, mVrfFinOutNos As Double
Dim mVrfICode As Long

Rem control values will be assigned just below and not anywhere in procedural section
If mAddEditMode = True Then
    mVrfDate = Ctod(dtpVrfDate.Text)
    mVrfVndCode = Val(fcmbVndName.BoundText)
    mVrfItmCode = Val(fcmbItmName.BoundText)
    mVrfConsWeight = CurVrfConsUnit(mskVrfFinOutNos, mMeasUnit:=WEIGHT_UNIT)
    mVrfConsNos = CurVrfConsUnit(mskVrfFinOutNos, mMeasUnit:=NOS_UNIT)
    mVrfFinOutWeight = Val(UnMyNumFmt(mskVrfFinOutWeight.Text))
    mVrfFinOutNos = Val(UnMyNumFmt(mskVrfFinOutNos.Text))
Else
    Rem value assignment as done for add edit mode (keypress)
    mVrfDate = Ctod(Mfgrd2.TextMatrix(srow, X2VRFDATE_COL))
    mVrfVndCode = Val(Mfgrd2.TextMatrix(srow, X2VRFVNDCODE_COL))
    mVrfItmCode = Val(Mfgrd2.TextMatrix(srow, X2VRFITMCODE_COL))
    mVrfConsWeight = CurVrfConsUnit(Mfgrd2, mMeasUnit:=WEIGHT_UNIT, srow:=srow)
    mVrfConsNos = CurVrfConsUnit(Mfgrd2, mMeasUnit:=NOS_UNIT, srow:=srow)
    mVrfFinOutWeight = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2VRFFINOUTWEIGHT_COL)))
    mVrfFinOutNos = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2VRFFINOUTNOS_COL)))
End If
mVrfICode = Val(Mfgrd2.TextMatrix(srow, X2VRFICODE_COL))
    
mVifNos_sum = 0: mVrfConsNos_sum = 0

tRecset.Open "Select sum(VifWeight) as VifWeight_sum, sum(VifNos) as VifNos_sum from VendIsFrg where VifVndCode=" & CStr(mVrfVndCode) & " and VifItmCode=" & CStr(mVrfItmCode) & " and VifDate<=#" & CStr(ToSysDate(mVrfDate)) & "#" & " group by VifVndCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
If tRecset.RecordCount > 0 Then
    mVifWeight_sum = tRecset.Fields("VifWeight_sum")
    mVifNos_sum = tRecset.Fields("VifNos_sum")
End If
CloseTable tRecset

tRecset.Open "Select sum(VrfConsWeight) as VrfConsWeight_sum, sum(VrfConsNos) as VrfConsNos_sum from VendRcFrg where VrfVndCode=" & CStr(mVrfVndCode) & " and VrfItmCode=" & CStr(mVrfItmCode) & " and VrfDate<=#" & CStr(ToSysDate(mVrfDate)) & "#" & IIf(dtlAddMode = False, " and VrfICode<>" & CStr(mVrfICode), "") & " group by VrfVndCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
If tRecset.RecordCount > 0 Then
    mVrfConsWeight_sum = tRecset.Fields("VrfConsWeight_sum")
    mVrfConsNos_sum = tRecset.Fields("VrfConsNos_sum")
End If
CloseTable tRecset

mBalWeight = mVifWeight_sum - mVrfConsWeight_sum - mVrfConsWeight
mBalNos = mVifNos_sum - mVrfConsNos_sum - mVrfConsNos

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
Private Function CurVrfConsUnit(ByRef mObj As Object, ByVal mMeasUnit As Integer, Optional ByVal srow As Long) As Double
If TypeOf mObj Is ADODB.Recordset Then
    With mObj
    If mMeasUnit = WEIGHT_UNIT Then
        CurVrfConsUnit = .Fields("VrfFinOutWeight") + .Fields("VrfRejOutWeight")
    ElseIf mMeasUnit = NOS_UNIT Then
        CurVrfConsUnit = .Fields("VrfFinOutNos") + .Fields("VrfRejOutNos")
    End If
    End With
ElseIf TypeOf mObj Is MSFlexGrid Then
    With mObj
    If mMeasUnit = WEIGHT_UNIT Then
        CurVrfConsUnit = Val(UnMyNumFmt(.TextMatrix(srow, X2VRFFINOUTWEIGHT_COL))) + Val(UnMyNumFmt(.TextMatrix(srow, X2VRFREJOUTWEIGHT_COL)))
    ElseIf mMeasUnit = NOS_UNIT Then
        CurVrfConsUnit = Val(UnMyNumFmt(.TextMatrix(srow, X2VRFFINOUTNOS_COL))) + Val(UnMyNumFmt(.TextMatrix(srow, X2VRFREJOUTNOS_COL)))
    End If
    End With
ElseIf TypeOf mObj Is TextBox Then
    If mMeasUnit = WEIGHT_UNIT Then
        CurVrfConsUnit = Val(UnMyNumFmt(mskVrfFinOutWeight.Text)) + Val(UnMyNumFmt(mskVrfRejOutWeight.Text))
    ElseIf mMeasUnit = NOS_UNIT Then
        CurVrfConsUnit = Val(UnMyNumFmt(mskVrfFinOutNos.Text)) + Val(UnMyNumFmt(mskVrfRejOutNos.Text))
    End If
Else
    ErrorBox Me.Name & "_CurVrfConsUnit_1011"
End If

End Function

Private Sub mskVrfRejOutNos_GotFocus()
FlashActiveControl mskVrfRejOutNos, True
End Sub

Private Sub mskVrfRejOutNos_LostFocus()
FlashActiveControl mskVrfRejOutNos, False
End Sub

Private Sub mskVrfRejOutNos_Validate(Cancel As Boolean)
mskVrfRejOutNos.Text = ToMyNumFmt(mskVrfRejOutNos.Text, mDecimals:=0)
If ChkVrfInUnit(mAddEditMode:=True, mMeasUnit:=NOS_UNIT) = False Then
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
    dtpVrfDate.Text = Mfgrd2.TextMatrix(srow, X2VRFDATE_COL)
    fcmbVndName.BoundText = Mfgrd2.TextMatrix(srow, X2VRFVNDCODE_COL): txtVndName.Text = fcmbVndName.Text
    fcmbItmName.BoundText = Mfgrd2.TextMatrix(srow, X2VRFITMCODE_COL): txtItmName.Text = fcmbItmName.Text
    fcmbMprName.BoundText = Mfgrd2.TextMatrix(srow, X2VRFMPRCODE_COL): txtMprName.Text = fcmbMprName.Text
Else
    dtpVrfDate.Text = dtpVrfDate1.Text
    fcmbVndName.Text = txtVndName1.Text: txtVndName.Text = fcmbVndName.Text
    fcmbItmName.Text = txtItmName1.Text: txtItmName.Text = fcmbItmName.Text
    fcmbMprName.Text = txtMprName1.Text: txtMprName.Text = fcmbMprName.Text
End If
mskVrfFinOutNos.Text = ToMyNumFmt(0, mDecimals:=0)
mskVrfRejOutNos.Text = ToMyNumFmt(0, mDecimals:=0)

End Sub

Private Function Data_CreateLog(ByVal mVrfCode As Long) As Boolean
Dim VRF_LogRS As New ADODB.Recordset
Data_CreateLog = False

VRF_LogRS.Open "Select * from VendRcFrg_Log where VrfCode=" & CStr(mVrfCode) & "", dbTlgDatabase, adOpenKeyset, adLockOptimistic
With VRF_LogRS
If .RecordCount = 0 Then
    .Close
    Rem only ok records will be taken in log, because not ok records are created out of crashed entries which must be cleared when entry rejected
    dbTlgDatabase.BeginTrans
    dbTlgDatabase.Execute "Insert into VendRcFrg_Log Select * from VendRcFrg where VrfCode=" & CStr(mVrfCode) & " and VrfRecState=" & CStr(cREC_UNCHANGED) & ""
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
Set VRF_LogRS = Nothing
Exit Function

End Function

Private Function Data_RemoveLog(ByVal mVrfCode As Long) As Boolean
Data_RemoveLog = False

dbTlgDatabase.BeginTrans
dbTlgDatabase.Execute "Delete from VendRcFrg_Log where VrfCode=" & CStr(mVrfCode)
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

dtpVrfDate.Text = Mfgrd2.TextMatrix(srow, X2VRFDATE_COL)
fcmbVndName.BoundText = Mfgrd2.TextMatrix(srow, X2VRFVNDCODE_COL): txtVndName.Text = fcmbVndName.Text
fcmbItmName.BoundText = Mfgrd2.TextMatrix(srow, X2VRFITMCODE_COL): txtItmName.Text = fcmbItmName.Text
fcmbMprName.BoundText = Mfgrd2.TextMatrix(srow, X2VRFMPRCODE_COL): txtMprName.Text = fcmbMprName.Text
mskVrfUnitWeight.Text = Trim(Mfgrd2.TextMatrix(srow, X2VRFUNITWEIGHT_COL))
mskVrfFinOutWeight.Text = Trim(Mfgrd2.TextMatrix(srow, X2VRFFINOUTWEIGHT_COL))
mskVrfFinOutNos.Text = Trim(Mfgrd2.TextMatrix(srow, X2VRFFINOUTNOS_COL))
mskVrfRejOutWeight.Text = Trim(Mfgrd2.TextMatrix(srow, X2VRFREJOUTWEIGHT_COL))
mskVrfRejOutNos.Text = Trim(Mfgrd2.TextMatrix(srow, X2VRFREJOUTNOS_COL))
mskBalWeightForRcpt.Text = Trim(Mfgrd2.TextMatrix(srow, X2BALWEIGHTFORRCPT_COL))
mskBalNosForRcpt.Text = Trim(Mfgrd2.TextMatrix(srow, X2BALNOSFORRCPT_COL))
mskBalNosForMach.Text = Trim(Mfgrd2.TextMatrix(srow, X2BALNOSFORMACH_COL))

End Sub

