VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmForgingIssue 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   ClientHeight    =   9315
   ClientLeft      =   60
   ClientTop       =   60
   ClientWidth     =   14535
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
   ScaleWidth      =   14535
   ShowInTaskbar   =   0   'False
   WindowState     =   2  'Maximized
   Begin VB.Frame frHeader 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   1455
      Left            =   120
      TabIndex        =   23
      Top             =   840
      Width           =   12855
      Begin VB.TextBox dtpFisDate2 
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
         Left            =   6960
         Style           =   1  'Graphical
         TabIndex        =   5
         Top             =   960
         Width           =   735
      End
      Begin VB.TextBox txtEmpName1 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   1320
         TabIndex        =   2
         Top             =   600
         Width           =   3495
      End
      Begin VB.TextBox txtMacName1 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   1320
         TabIndex        =   4
         Top             =   960
         Width           =   3495
      End
      Begin VB.TextBox txtItmName1 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   5760
         TabIndex        =   3
         Top             =   600
         Width           =   3375
      End
      Begin VB.TextBox dtpFisDate1 
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
         Caption         =   "To Date:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   4
         Left            =   2760
         TabIndex        =   28
         Top             =   240
         Width           =   855
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Machine:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   3
         Left            =   240
         TabIndex        =   27
         Top             =   960
         Width           =   855
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Operator:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   2
         Left            =   240
         TabIndex        =   26
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
         TabIndex        =   25
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
         TabIndex        =   24
         Top             =   240
         Width           =   975
      End
   End
   Begin VB.TextBox txtVoid 
      CausesValidation=   0   'False
      Height          =   375
      Left            =   120
      TabIndex        =   17
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
      TabIndex        =   22
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
      TabIndex        =   21
      TabStop         =   0   'False
      Top             =   0
      UseMaskColor    =   -1  'True
      Width           =   255
   End
   Begin VB.ComboBox cmbFormEntryMode 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   315
      ItemData        =   "FrgIssue.frx":0000
      Left            =   0
      List            =   "FrgIssue.frx":000D
      Style           =   1  'Simple Combo
      TabIndex        =   20
      TabStop         =   0   'False
      Text            =   "cmbFormMode"
      Top             =   360
      Width           =   1455
   End
   Begin VB.Frame frFormDtl 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   6015
      Left            =   120
      TabIndex        =   19
      Top             =   2280
      Width           =   12855
      Begin VB.TextBox mskFisNos 
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
         Left            =   10680
         TabIndex        =   13
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   1320
         Width           =   1335
      End
      Begin VB.Frame frBalQty 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   0  'None
         ForeColor       =   &H80000008&
         Height          =   735
         Left            =   8880
         TabIndex        =   29
         Top             =   1680
         Width           =   3135
         Begin VB.TextBox mskBalNos 
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
            Left            =   1680
            TabIndex        =   15
            Tag             =   "AhCode"
            Text            =   "0.00"
            Top             =   360
            Width           =   1335
         End
         Begin VB.TextBox mskBalWeight 
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
            TabIndex        =   14
            Tag             =   "AhCode"
            Text            =   "0.000"
            Top             =   360
            Width           =   1335
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Bal.Weight:"
            ForeColor       =   &H80000008&
            Height          =   255
            Index           =   5
            Left            =   480
            TabIndex        =   31
            Top             =   120
            Width           =   975
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Bal.Nos.:"
            ForeColor       =   &H80000008&
            Height          =   255
            Index           =   6
            Left            =   2160
            TabIndex        =   30
            Top             =   120
            Width           =   855
         End
      End
      Begin VB.TextBox mskFisUnitWeight 
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
         Left            =   9600
         TabIndex        =   12
         Tag             =   "AhCode"
         Text            =   "0.000"
         Top             =   1320
         Width           =   1095
      End
      Begin VB.TextBox mskFisWeight 
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
         Left            =   8280
         TabIndex        =   11
         Tag             =   "AhCode"
         Text            =   "0.000"
         Top             =   1320
         Width           =   1335
      End
      Begin VB.TextBox txtMacName 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   6480
         TabIndex        =   10
         Top             =   1320
         Width           =   1815
      End
      Begin VB.TextBox txtItmName 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   4080
         TabIndex        =   9
         Top             =   1320
         Width           =   2415
      End
      Begin VB.TextBox txtEmpName 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   1320
         TabIndex        =   8
         Top             =   1320
         Width           =   2775
      End
      Begin VB.TextBox dtpFisDate 
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
         Top             =   1320
         Width           =   1215
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
         Left            =   12000
         Style           =   1  'Graphical
         TabIndex        =   16
         Top             =   1320
         Width           =   735
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd2 
         Height          =   4815
         Left            =   120
         TabIndex        =   6
         Top             =   240
         Width           =   12375
         _ExtentX        =   21828
         _ExtentY        =   8493
         _Version        =   393216
         FixedCols       =   0
         RowHeightMin    =   285
         FocusRect       =   2
         HighLight       =   2
         SelectionMode   =   1
         AllowUserResizing=   3
         Appearance      =   0
      End
   End
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Material Issue to Forging"
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
      TabIndex        =   18
      Top             =   0
      Width           =   9015
   End
End
Attribute VB_Name = "frmForgingIssue"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim dbAcDatabase As New ADODB.Connection, dbStDatabase As New ADODB.Connection, dbTlgDatabase As New ADODB.Connection, dbPyrDatabase As New ADODB.Connection, dbGrpDatabase As New ADODB.Connection, dbComDatabase As New ADODB.Connection
Dim mFormLoaded As Boolean, mLastKeyPressed As Integer
Dim mRemoteAccess As Boolean, mEntrySaved As Boolean, mEntryAborted As Boolean
Dim dtlAddEditMode As Boolean, dtlAddMode As Boolean, dtlEditCanceled As Boolean
Dim clsSTK As clsStockJrn, clsITM As clsProduct, clsEMP As clsPayrollMasterEntry, clsMAC As clsToolingMasterEntry, mActiveControl As Object
Dim fcmbEmpName As frmFlexSearchList, fcmbItmName As frmFlexSearchList, fcmbMacName As frmFlexSearchList
Dim mFisDate_old As Date, mFisEmpCode_old As Long, mFisItmCode_old As Long, mFisMacCode_old As Long, mFisWeight_old As Double, mFisNos_old As Double

' StockJrn transaction detail grid Mfgrd2 column definitions
Const X2FISICODE_COL = 0
Const X2FISDATE_COL = 1
Const X2EMPNAME_COL = 2
Const X2ITMNAME_COL = 3
Const X2MACNAME_COL = 4
Const X2FISWEIGHT_COL = 5
Const X2FISUNITWEIGHT_COL = 6
Const X2FISNOS_COL = 7
Const X2BALWEIGHT_COL = 8
Const X2BALNOS_COL = 9
Const X2FISCODE_COL = 10
Const X2FISSNO_COL = 11
Const X2FISEMPCODE_COL = 12
Const X2FISITMCODE_COL = 13
Const X2FISMACCODE_COL = 14
Const X2FISSTKCODE_COL = 15
Const X2FISSTKICODEIS_COL = 16
Const X2FISSTKICODERC_COL = 17
Const X2FISRECSTATE_COL = 18
Const MFGRD2_COLS = 19

Rem qty.unit id constant
Const WEIGHT_UNIT = 1
Const NOS_UNIT = 2

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
    dtpFisDate1.SetFocus
Else
    Unload Me
End If

End Sub

Private Sub cmdOK_Click()
Dim FISRecset As New ADODB.Recordset, FIS_LogRS As New ADODB.Recordset
Dim srow As Long, mFisStkCode As Long, mFisStkICodeIs As Long, mFisStkICodeRc As Long, mFisCode As Long, mFisICode As Long, mFisSno As Long, mStkItmRefCode As Long

srow = Mfgrd2.Row
If dtlAddMode = True Then
    mFisCode = GetNextSeqno(dbTlgDatabase, "ForgIssue", "FisCode")
    mFisStkCode = clsSTK.ActiveStkCode
Else
    mFisCode = Val(Mfgrd2.TextMatrix(srow, X2FISCODE_COL))
    mFisStkCode = Val(Mfgrd2.TextMatrix(srow, X2FISSTKCODE_COL))
    mFisICode = Val(Mfgrd2.TextMatrix(srow, X2FISICODE_COL))
    mFisStkICodeIs = Val(Mfgrd2.TextMatrix(srow, X2FISSTKICODEIS_COL))
    mFisStkICodeRc = Val(Mfgrd2.TextMatrix(srow, X2FISSTKICODERC_COL))
End If
If dtlEditCanceled = False And dtlAddMode = False Then
    Call ValidDtl
End If
If cmdOK.Caption = "&OK" And dtlEditCanceled = False Then
    Rem addnew/update -------------------------
    Rem ForgIssue section
    dbTlgDatabase.BeginTrans
    With FISRecset
    If dtlAddMode = True Then
        mFisSno = GetNextSeqno(dbTlgDatabase, "ForgIssue", "FisSno", "FisCode" = CStr(mFisCode))
        
        FISRecset.Open "Select * from ForgIssue where FisCode=" & CStr(mFisCode) & "", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        .AddNew
        Rem .Fields("FisICode") = AutoNumber
        .Fields("FisCode") = mFisCode
        .Fields("FisSno") = mFisSno
    Else
        FISRecset.Open "Select * from ForgIssue where FisCode=" & CStr(mFisCode) & " and FisICode=" & CStr(mFisICode) & "", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    End If
    .Fields("FisDate") = Ctod(dtpFisDate.Text)
    .Fields("FisEmpCode") = Val(fcmbEmpName.BoundText)
    .Fields("FisItmCode") = Val(fcmbItmName.BoundText)
    .Fields("FisItmRefCode") = 0
    .Fields("FisMacCode") = Val(fcmbMacName.BoundText)
    .Fields("FisWeight") = Val(UnMyNumFmt(mskFisWeight.Text))
    .Fields("FisUnitWeight") = Val(UnMyNumFmt(mskFisUnitWeight.Text))
    .Fields("FisUnitNos") = 1       ''' future provision
    .Fields("FisNos") = Val(UnMyNumFmt(mskFisNos.Text))
    .Fields("FisNarr") = ""
    .Fields("FisRecState") = ChkEditRecStatus(.Fields("FisRecState"))
    .Update
    mFisICode = .Fields("FisICode")
    End With
    dbTlgDatabase.CommitTrans
    CloseTable FISRecset
    
    Rem StockJrn section
    clsSTK.Clear
    If dtlAddMode = True Then
        Rem issue stock
        clsSTK.mStkSno_int = 0
        clsSTK.mStkDate_dt = Ctod(dtpFisDate.Text)
        clsSTK.mStkItmCode_lng = Val(fcmbItmName.BoundText)
        clsSTK.mStkItmRefCode_lng = 0
        clsSTK.mStkQty_dbl = ToIssueQty(Val(UnMyNumFmt(mskFisWeight.Text)))
        clsSTK.mStkRate_dbl = 0
        clsSTK.mStkValue_dbl = 0
        clsSTK.mStkNarr_str = ""
        clsSTK.mStkRecState_int = cREC_NEW
        clsSTK.mStkLItmCode_lng = 0
        
        clsSTK.AddNew mFisStkCode
        mFisStkICodeIs = clsSTK.mStkICode_lng
        
        Rem receipt stock
        clsSTK.mStkSno_int = 0
        clsSTK.mStkQty_dbl = ToRcptQty(Val(UnMyNumFmt(mskFisNos.Text)))
        
        clsSTK.AddNew mFisStkCode, mNewItemRef:=True
        mFisStkICodeRc = clsSTK.mStkICode_lng
        mStkItmRefCode = clsSTK.mStkItmRefCode_lng
        
        Rem StockJrn Common entry
        clsSTK.mStkSno_int = -1
        clsSTK.mStkItmCode_lng = 0
        clsSTK.mStkItmRefCode_lng = 0
        clsSTK.mStkQty_dbl = 0
        clsSTK.mStkNarr_str = "Material Issue to Forging"
        clsSTK.AddNew mFisStkCode
    Else
        Rem issue stock
        clsSTK.GetData mFisStkCode, mFisStkICodeIs
        clsSTK.mStkDate_dt = Ctod(dtpFisDate.Text)
        clsSTK.mStkItmCode_lng = Val(fcmbItmName.BoundText)
        clsSTK.mStkItmRefCode_lng = 0
        clsSTK.mStkQty_dbl = ToIssueQty(Val(UnMyNumFmt(mskFisWeight.Text)))
        clsSTK.mStkRate_dbl = 0
        clsSTK.mStkValue_dbl = 0
        clsSTK.mStkNarr_str = ""
        clsSTK.Update mFisStkCode, mFisStkICodeIs
        
        Rem receipt stock
        clsSTK.GetData mFisStkCode, mFisStkICodeRc
        clsSTK.mStkDate_dt = Ctod(dtpFisDate.Text)
        clsSTK.mStkItmCode_lng = Val(fcmbItmName.BoundText)
        Rem clsSTK.mStkItmRefCode_lng = 0 if item changed then new else existing
        clsSTK.mStkQty_dbl = ToRcptQty(Val(UnMyNumFmt(mskFisNos.Text)))
        clsSTK.mStkRate_dbl = 0
        clsSTK.mStkValue_dbl = 0
        clsSTK.mStkNarr_str = ""
        If mFisItmCode_old <> clsSTK.mStkItmCode_lng Or clsSTK.mStkItmRefCode_lng = 0 Then
            clsSTK.Update mFisStkCode, mFisStkICodeRc, mNewItemRef:=True
        Else
            clsSTK.Update mFisStkCode, mFisStkICodeRc
        End If
        mStkItmRefCode = clsSTK.mStkItmRefCode_lng
        
        Rem StockJrn common entry
        clsSTK.GetData mFisStkCode, 0, -1
        clsSTK.mStkDate_dt = Ctod(dtpFisDate.Text)
        clsSTK.mStkItmCode_lng = 0
        clsSTK.mStkItmRefCode_lng = 0
        clsSTK.mStkQty_dbl = 0
        clsSTK.mStkRate_dbl = 0
        clsSTK.mStkValue_dbl = 0
        clsSTK.mStkNarr_str = "Material Issue to Forging"
        
        clsSTK.Update mFisStkCode, clsSTK.mStkICode_lng
    End If
    
    Rem update stock ----------------------------------------
    Rem ForgIssue updation
    dbTlgDatabase.BeginTrans
    FISRecset.Open "Select * from ForgIssue where FisCode=" & CStr(mFisCode) & " order by FisICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    With FISRecset
    If .RecordCount > 0 Then
        .MoveFirst
        Do While .EOF = False
            If InList(.Fields("FisRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
                If dtlAddMode = True Then
                    .Fields("FisStkCode") = mFisStkCode
                    .Fields("FisStkICodeIs") = mFisStkICodeIs
                    .Fields("FisStkICodeRc") = mFisStkICodeRc
                    .Fields("FisItmRefCode") = mStkItmRefCode
                Else
                    .Fields("FisItmRefCode") = mStkItmRefCode
                End If
                .Fields("FisRecState") = cREC_UNCHANGED
                .Update
            Else
                .Fields("FisRecState") = ChkDeleteRecStatus(.Fields("FisRecState"))
                .Update
                .Delete
            End If
            
            .MoveNext
        Loop
    End If
    End With
    dbTlgDatabase.CommitTrans
    CloseTable FISRecset
    
    Rem StockJrn updation
    clsSTK.CommitStock mFisStkCode
    
    Rem EndStock routine ----------------------------------
    Rem ForgIssue
    Data_RemoveLog mFisCode
    
    Rem StockJrn
    clsSTK.EndStock mFisStkCode
    
    Rem show record in flexgrid
    FISRecset.Open "Select * from ForgIssue where FisCode=" & CStr(mFisCode) & " and FisICode=" & CStr(mFisICode) & "", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    With FISRecset
    clsEMP.GetData .Fields("FisEmpCode")
    clsITM.GetData .Fields("FisItmCode")
    clsMAC.GetData .Fields("FisMacCode")
    
    Mfgrd2.TextMatrix(srow, X2FISICODE_COL) = .Fields("FisICode")
    Mfgrd2.TextMatrix(srow, X2FISDATE_COL) = Dtoc(.Fields("FisDate"))
    Mfgrd2.TextMatrix(srow, X2EMPNAME_COL) = clsEMP.mAhName_str
    Mfgrd2.TextMatrix(srow, X2ITMNAME_COL) = clsITM.mItmName_str
    Mfgrd2.TextMatrix(srow, X2MACNAME_COL) = clsMAC.mName_str
    Mfgrd2.TextMatrix(srow, X2FISWEIGHT_COL) = ToMyNumFmt(.Fields("FisWeight"), mDecimals:=3)
    Mfgrd2.TextMatrix(srow, X2FISUNITWEIGHT_COL) = ToMyNumFmt(.Fields("FisUnitWeight"), mDecimals:=3)
    Mfgrd2.TextMatrix(srow, X2FISNOS_COL) = ToMyNumFmt(.Fields("FisNos"), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2FISCODE_COL) = .Fields("FisCode")
    Mfgrd2.TextMatrix(srow, X2FISSNO_COL) = .Fields("FisSno")
    Mfgrd2.TextMatrix(srow, X2FISEMPCODE_COL) = .Fields("FisEmpCode")
    Mfgrd2.TextMatrix(srow, X2FISITMCODE_COL) = .Fields("FisItmCode")
    Mfgrd2.TextMatrix(srow, X2FISMACCODE_COL) = .Fields("FisMacCode")
    Mfgrd2.TextMatrix(srow, X2FISSTKCODE_COL) = .Fields("FisStkCode")
    Mfgrd2.TextMatrix(srow, X2FISSTKICODEIS_COL) = .Fields("FisStkICodeIs")
    Mfgrd2.TextMatrix(srow, X2FISSTKICODERC_COL) = .Fields("FisStkICodeRc")
    Mfgrd2.TextMatrix(srow, X2FISRECSTATE_COL) = .Fields("FisRecState")
    
    End With
    CloseTable FISRecset
    
    If dtlAddMode = True Then
        Mfgrd2.Rows = Mfgrd2.Rows + 1
    End If
    
    srow = srow + 1
    Mfgrd2.Row = srow
Else
    Rem cancel event -----------------------------------
    Rem ForgIssue
    FISRecset.Open "Select * from ForgIssue where FisCode=" & CStr(mFisCode) & " order by FisICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    FIS_LogRS.Open "Select * from ForgIssue_Log where FisCode=" & CStr(mFisCode) & " order by FisICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    
    dbTlgDatabase.BeginTrans
    With FISRecset
    If .RecordCount > 0 Then
        .MoveFirst
        Do While .EOF = False
            Rem stock updation is not required because balance is updated on CommitStock and not on individual item save, hence no need to revert is back
            FIS_LogRS.Find "FisICode=" & CStr(.Fields("FisICode")), Start:=1
            If FIS_LogRS.EOF = False Then
                ' any prior updations can be made here
                .Fields("FisSno") = FIS_LogRS.Fields("FisSno")
                .Fields("FisDate") = FIS_LogRS.Fields("FisDate")
                .Fields("FisEmpCode") = FIS_LogRS.Fields("FisEmpCode")
                .Fields("FisItmCode") = FIS_LogRS.Fields("FisItmCode")
                .Fields("FisItmRefCode") = FIS_LogRS.Fields("FisItmRefCode")
                .Fields("FisMacCode") = FIS_LogRS.Fields("FisMacCode")
                .Fields("FisWeight") = FIS_LogRS.Fields("FisWeight")
                .Fields("FisUnitWeight") = FIS_LogRS.Fields("FisUnitWeight")
                .Fields("FisUnitNos") = FIS_LogRS.Fields("FisUnitNos")
                .Fields("FisNos") = FIS_LogRS.Fields("FisNos")
                .Fields("FisNarr") = FIS_LogRS.Fields("FisNarr")
                .Fields("FisRecState") = FIS_LogRS.Fields("FisRecState")
                .Update
            Else
                ' any prior updations can be made here
                .Fields("FisRecState") = ChkDeleteRecStatus(.Fields("FisRecState"))
                .Update
                .Delete
            End If
            
            .MoveNext
        Loop
    End If
    End With
    dbTlgDatabase.CommitTrans
    CloseTable FISRecset
    CloseTable FIS_LogRS
    
    Rem StockJrn
    clsSTK.CancelStock mFisStkCode
    
    Rem EndStock --------------------------------------------------
    Rem ForgIssue
    Data_RemoveLog mFisCode
    
    Rem StockJrn
    clsSTK.EndStock mFisStkCode
    
End If
dtlAddEditMode = False
dtlAddMode = False
dtlEditCanceled = False
Call VisibleControls(False)
Call RefreshBalWeight
Mfgrd2.SetFocus
GoTo EndSub
Exit Sub

EndSub:
Set FISRecset = Nothing
Set FIS_LogRS = Nothing

End Sub

Private Sub cmdShowDtlData_Click()
Dim tRecset As New ADODB.Recordset, srow As Long, cnt As Integer
srow = 1

tRecset.Open "Select * from ForgIssue" _
    & " where FisDate between #" & CStr(ToSysDate(Ctod(dtpFisDate1.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpFisDate2.Text))) & "#" _
    & IIf(Val(fcmbEmpName.BoundText) > 0, " and FisEmpCode=" & CStr(Val(fcmbEmpName.BoundText)), "") _
    & IIf(Val(fcmbItmName.BoundText) > 0, " and FisItmCode=" & CStr(Val(fcmbItmName.BoundText)), "") _
    & IIf(Val(fcmbMacName.BoundText) > 0, " and FisMacCode=" & CStr(Val(fcmbMacName.BoundText)), "") _
    & " order by FisDate,FisICode" _
    , dbTlgDatabase, adOpenKeyset, adLockOptimistic
With tRecset
If .RecordCount > 0 Then
    Do While .EOF = False
        clsEMP.GetData .Fields("FisEmpCode")
        clsITM.GetData .Fields("FisItmCode")
        clsMAC.GetData .Fields("FisMacCode")
        
        Mfgrd2.TextMatrix(srow, X2FISICODE_COL) = .Fields("FisICode")
        Mfgrd2.TextMatrix(srow, X2FISDATE_COL) = Dtoc(.Fields("FisDate"))
        Mfgrd2.TextMatrix(srow, X2EMPNAME_COL) = clsEMP.mAhName_str
        Mfgrd2.TextMatrix(srow, X2ITMNAME_COL) = clsITM.mItmName_str
        Mfgrd2.TextMatrix(srow, X2MACNAME_COL) = clsMAC.mName_str
        Mfgrd2.TextMatrix(srow, X2FISWEIGHT_COL) = ToMyNumFmt(.Fields("FisWeight"), mDecimals:=3)
        Mfgrd2.TextMatrix(srow, X2FISUNITWEIGHT_COL) = ToMyNumFmt(.Fields("FisUnitWeight"), mDecimals:=3)
        Mfgrd2.TextMatrix(srow, X2FISNOS_COL) = ToMyNumFmt(.Fields("FisNos"), mDecimals:=0)
        Mfgrd2.TextMatrix(srow, X2FISCODE_COL) = .Fields("FisCode")
        Mfgrd2.TextMatrix(srow, X2FISSNO_COL) = .Fields("FisSno")
        Mfgrd2.TextMatrix(srow, X2FISEMPCODE_COL) = .Fields("FisEmpCode")
        Mfgrd2.TextMatrix(srow, X2FISITMCODE_COL) = .Fields("FisItmCode")
        Mfgrd2.TextMatrix(srow, X2FISMACCODE_COL) = .Fields("FisMacCode")
        Mfgrd2.TextMatrix(srow, X2FISSTKCODE_COL) = .Fields("FisStkCode")
        Mfgrd2.TextMatrix(srow, X2FISSTKICODEIS_COL) = .Fields("FisStkICodeIs")
        Mfgrd2.TextMatrix(srow, X2FISSTKICODERC_COL) = .Fields("FisStkICodeRc")
        Mfgrd2.TextMatrix(srow, X2FISRECSTATE_COL) = .Fields("FisRecState")
        Rem balance calculation
        Mfgrd2.TextMatrix(srow, X2BALWEIGHT_COL) = ToMyNumFmt(GetBalUnit(mAddEditMode:=False, srow:=srow, mMeasUnit:=WEIGHT_UNIT), mDecimals:=3)
        Mfgrd2.TextMatrix(srow, X2BALNOS_COL) = ToMyNumFmt(GetBalUnit(mAddEditMode:=False, srow:=srow, mMeasUnit:=NOS_UNIT), mDecimals:=0)
        
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

Private Sub RefreshBalWeight()
Dim srow As Long
Rem refresh balance quantity after add/edit/delete for whole flex grid
For srow = 1 To Mfgrd2.Rows - 2
    Mfgrd2.TextMatrix(srow, X2BALWEIGHT_COL) = ToMyNumFmt(GetBalUnit(mAddEditMode:=False, srow:=srow, mMeasUnit:=WEIGHT_UNIT), mDecimals:=3)
    Mfgrd2.TextMatrix(srow, X2BALNOS_COL) = ToMyNumFmt(GetBalUnit(mAddEditMode:=False, srow:=srow, mMeasUnit:=NOS_UNIT), mDecimals:=0)
Next srow

End Sub

Private Function GetBalUnit(ByVal mAddEditMode As Boolean, ByVal srow As Long, ByVal mMeasUnit As Integer) As Double
Dim tRecset As New ADODB.Recordset, mFisWeight_sum As Double, mFisNos_sum As Double, mFpnConsNos_sum As Double, mFpnConsWeight_sum As Double, mBalWeight As Double, mBalNos As Double
Dim mFisDate As Date, mFisEmpCode As Long, mFisItmCode As Long, mFisMacCode As Long, mFisWeight As Double, mFisNos As Double
Dim mFisICode As Long

If mAddEditMode = True Then
    mFisDate = Ctod(dtpFisDate.Text)
    mFisEmpCode = Val(fcmbEmpName.BoundText)
    mFisItmCode = Val(fcmbItmName.BoundText)
    mFisMacCode = Val(fcmbMacName.BoundText)
    mFisWeight = Val(UnMyNumFmt(mskFisWeight.Text))
    mFisNos = Val(UnMyNumFmt(mskFisNos.Text))
Else
    Rem value assignment as done for add edit mode (keypress)
    mFisDate = Ctod(Mfgrd2.TextMatrix(srow, X2FISDATE_COL))
    mFisEmpCode = Val(Mfgrd2.TextMatrix(srow, X2FISEMPCODE_COL))
    mFisItmCode = Val(Mfgrd2.TextMatrix(srow, X2FISITMCODE_COL))
    mFisMacCode = Val(Mfgrd2.TextMatrix(srow, X2FISMACCODE_COL))
    mFisWeight = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2FISWEIGHT_COL)))
    mFisNos = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2FISNOS_COL)))
End If
mFisICode = Val(Mfgrd2.TextMatrix(srow, X2FISICODE_COL))
    
mFisWeight_sum = 0: mFisNos_sum = 0: mFpnConsWeight_sum = 0: mFpnConsNos_sum = 0: mBalWeight = 0: mBalNos = 0

tRecset.Open "Select sum(FisWeight) as FisWeight_sum, sum(FisNos) as FisNos_sum from ForgIssue where FisEmpCode=" & CStr(mFisEmpCode) & " and FisItmCode=" & CStr(mFisItmCode) & " and FisMacCode=" & CStr(mFisMacCode) & " and FisDate<=#" & CStr(ToSysDate(mFisDate)) & "#" & IIf(dtlAddMode = False, " and FisICode<>" & CStr(mFisICode), "") & " group by FisEmpCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
If tRecset.RecordCount > 0 Then
    mFisWeight_sum = tRecset.Fields("FisWeight_sum")
    mFisNos_sum = tRecset.Fields("FisNos_sum")
End If
CloseTable tRecset

tRecset.Open "Select sum(FpnConsWeight) as FpnConsWeight_sum, sum(FpnConsNos) as FpnConsNos_sum from ForgProdn where FpnEmpCode=" & CStr(mFisEmpCode) & " and FpnItmCode=" & CStr(mFisItmCode) & " and FpnMacCode=" & CStr(mFisMacCode) & " and FpnDate<=#" & CStr(ToSysDate(mFisDate)) & "#" & " group by FpnEmpCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
If tRecset.RecordCount > 0 Then
    mFpnConsWeight_sum = tRecset.Fields("FpnConsWeight_sum")
    mFpnConsNos_sum = tRecset.Fields("FpnConsNos_sum")
End If
CloseTable tRecset

If mMeasUnit = WEIGHT_UNIT Then
    GetBalUnit = mFisWeight_sum - mFpnConsWeight_sum + mFisWeight
ElseIf mMeasUnit = NOS_UNIT Then
    GetBalUnit = mFisNos_sum - mFpnConsNos_sum + mFisNos
End If

End Function

Private Sub dtpFisDate_GotFocus()
FlashActiveControl dtpFisDate, True
End Sub

Private Sub dtpFisDate_LostFocus()
FlashActiveControl dtpFisDate, False
End Sub

Private Sub dtpFisDate_Validate(Cancel As Boolean)
dtpFisDate.Text = ToMyDate(dtpFisDate.Text)
If IsFinYrDate(Ctod(dtpFisDate.Text)) = False Then
    ErrorBox "Invalid Date !!!"
    dtpFisDate.SetFocus
    FlashActiveControl dtpFisDate, True
    Cancel = True
End If
Call ValidDtl

End Sub

Private Sub dtpFisDate1_GotFocus()
FlashActiveControl dtpFisDate1, True
End Sub

Private Sub dtpFisDate1_LostFocus()
FlashActiveControl dtpFisDate1, False

End Sub

Private Sub dtpFisDate1_Validate(Cancel As Boolean)
dtpFisDate1.Text = ToMyDate(dtpFisDate1.Text)
If IsFinYrDate(Ctod(dtpFisDate1.Text)) = False Then
    ErrorBox "Invalid Date !!!"
    dtpFisDate1.SetFocus
    FlashActiveControl dtpFisDate1, True
    Cancel = True
Else
    dtpFisDate2.Text = dtpFisDate1.Text
End If

End Sub

Private Sub dtpFisDate2_GotFocus()
FlashActiveControl dtpFisDate2, True
End Sub

Private Sub dtpFisDate2_LostFocus()
FlashActiveControl dtpFisDate2, False
End Sub

Private Sub dtpFisDate2_Validate(Cancel As Boolean)
dtpFisDate2.Text = ToMyDate(dtpFisDate2.Text)
If IsFinYrDate(Ctod(dtpFisDate2.Text)) = False Then
    ErrorBox "Invalid Date !!!"
    dtpFisDate2.SetFocus
    FlashActiveControl dtpFisDate2, True
    Cancel = True
Else
    If Ctod(dtpFisDate1.Text) > Ctod(dtpFisDate2.Text) Then
        dtpFisDate1.Text = dtpFisDate2.Text
    End If
End If

End Sub

Private Sub Form_Activate()
If mFormLoaded = False Then
    dtpFisDate1.Text = Dtoc(DefaultEntryDate)
    dtpFisDate2.Text = Dtoc(DefaultEntryDate)
    dtpFisDate1.SetFocus
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
mskFisNos.Enabled = False
mskBalWeight.Enabled = False
mskBalNos.Enabled = False

OpenAcDataSource dbAcDatabase
OpenStDataSource dbStDatabase
OpenTlgDataSource dbTlgDatabase
OpenPyrDataSource dbPyrDatabase
OpenGrpDataSource dbGrpDatabase
OpenComDataSource dbComDatabase

Set clsSTK = New clsStockJrn
Set clsSTK.dbStDatabase = dbStDatabase
Set clsSTK.dbGrpDatabase = dbGrpDatabase

Set clsITM = New clsProduct
Set clsITM.dbStDatabase = dbStDatabase
Set clsITM.dbGrpDatabase = dbGrpDatabase

Set clsEMP = New clsPayrollMasterEntry
Set clsEMP.dbAcDatabase = dbAcDatabase
Set clsEMP.dbPyrDatabase = dbPyrDatabase
clsEMP.MastName = "EmpMast"

Set clsMAC = New clsToolingMasterEntry
Set clsMAC.dbTlgDatabase = dbTlgDatabase
clsMAC.MastName = "MachMast"

Set fcmbEmpName = New frmFlexSearchList
Set fcmbEmpName.dbAcDatabase = dbAcDatabase
Set fcmbEmpName.dbComDatabase = dbComDatabase
Set fcmbEmpName.frmAccessMaster = New frmEmployeeMast
fcmbEmpName.mMachOptrList = True
Load fcmbEmpName

Set fcmbItmName = New frmFlexSearchList
Set fcmbItmName.dbStDatabase = dbStDatabase
Set fcmbItmName.frmAccessMaster = New frmItemMast
fcmbItmName.mProdMastList = True
Load fcmbItmName

Set fcmbMacName = New frmFlexSearchList
Set fcmbMacName.dbTlgDatabase = dbTlgDatabase
Set fcmbMacName.frmAccessMaster = New frmMachineMaster
fcmbMacName.mMachMastList = True
Load fcmbMacName

Mfgrd2.Rows = 2: Mfgrd2.FixedRows = 1: Mfgrd2.Cols = MFGRD2_COLS: Mfgrd2.FixedCols = 0
colcnt = X2FISICODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2FISICODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2FISDATE_COL: Mfgrd2.ColWidth(colcnt) = dtpFisDate.Width: Mfgrd2.TextMatrix(0, colcnt) = "Date": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2EMPNAME_COL: Mfgrd2.ColWidth(colcnt) = txtEmpName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Operator Name": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2ITMNAME_COL: Mfgrd2.ColWidth(colcnt) = txtItmName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Material": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2MACNAME_COL: Mfgrd2.ColWidth(colcnt) = txtMacName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Machine Name": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2FISWEIGHT_COL: Mfgrd2.ColWidth(colcnt) = mskFisWeight.Width: Mfgrd2.TextMatrix(0, colcnt) = "Issue Weight": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2FISUNITWEIGHT_COL: Mfgrd2.ColWidth(colcnt) = mskFisUnitWeight.Width: Mfgrd2.TextMatrix(0, colcnt) = "Weight/Pcs": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2FISNOS_COL: Mfgrd2.ColWidth(colcnt) = mskFisNos.Width: Mfgrd2.TextMatrix(0, colcnt) = "No.of Pcs": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BALWEIGHT_COL: Mfgrd2.ColWidth(colcnt) = mskBalWeight.Width: Mfgrd2.TextMatrix(0, colcnt) = "Bal.Weight": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BALNOS_COL: Mfgrd2.ColWidth(colcnt) = mskBalNos.Width: Mfgrd2.TextMatrix(0, colcnt) = "Bal.Pcs": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2FISCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2FISCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2FISSNO_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2FISSNO_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2FISEMPCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2FISEMPCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2FISITMCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2FISITMCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2FISMACCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2FISMACCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2FISSTKCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2FISSTKCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2FISSTKICODEIS_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2FISSTKICODEIS_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2FISSTKICODERC_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2FISSTKICODERC_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2FISRECSTATE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2FISRECSTATE_COL": Mfgrd2.ColAlignment(colcnt) = 1

colcnt = X2FISDATE_COL: dtpFisDate.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2EMPNAME_COL: txtEmpName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2ITMNAME_COL: txtItmName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2MACNAME_COL: txtMacName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2FISWEIGHT_COL: mskFisWeight.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2FISUNITWEIGHT_COL: mskFisUnitWeight.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2FISNOS_COL: mskFisNos.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
cmdOK.Left = mskFisNos.Left + mskFisNos.Width
frBalQty.Left = cmdOK.Left - frBalQty.Width

If FlexColsWidth(Mfgrd2) > Mfgrd2.Width Then
    Mfgrd2.SelectionMode = flexSelectionFree
Else
    Mfgrd2.SelectionMode = flexSelectionByRow
End If

VisibleControls False

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
Set clsEMP = Nothing
Set clsMAC = Nothing
Unload fcmbEmpName
Unload fcmbItmName
Unload fcmbMacName
Set fcmbEmpName = Nothing
Set fcmbItmName = Nothing
Set fcmbMacName = Nothing

CloseDataSource dbAcDatabase
CloseDataSource dbStDatabase
CloseDataSource dbTlgDatabase
CloseDataSource dbPyrDatabase
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

End Sub

Private Sub Mfgrd2_KeyDown(KeyCode As Integer, Shift As Integer)
If KeyCode = vbKeyDelete And Shift = 0 Then
    Call Data_DeleteEvent
End If

End Sub

Private Sub Data_DeleteEvent()
Dim FISRecset As New ADODB.Recordset
Dim srow As Long, mDeleteit As Boolean, mFisStkCode As Long, mFisCode As Long

If Mfgrd2.Row = FlexNewRow(Mfgrd2) Then
    GoTo EndSub
End If
srow = Mfgrd2.Row
mFisStkCode = Val(Mfgrd2.TextMatrix(srow, X2FISSTKCODE_COL))
mFisCode = Val(Mfgrd2.TextMatrix(srow, X2FISCODE_COL))

mDeleteit = True

If mDeleteit = True Then
    mDeleteit = ChkFisUnit(mAddEditMode:=False, mMeasUnit:=0)
End If
If mDeleteit = True Then
    mDeleteit = CanDelete()
End If
If mDeleteit = True Then
    Rem begin transaction --------------------------
    Data_CreateLog mFisCode
    clsSTK.BeginStock mFisStkCode
    
    Rem delete transaction ------------------------------
    Rem ForgIssue
    dbTlgDatabase.BeginTrans
    With FISRecset
    .Open "Select * from ForgIssue where FisCode=" & CStr(mFisCode) & " order by FisICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount > 0 Then
        .MoveFirst
        Do While .EOF = False
            .Fields("FisRecState") = ChkDeleteRecStatus(.Fields("FisRecState"))
            .Update
            Rem marked for deletion only, physically deleted in CommitStock
            .MoveNext
        Loop
    End If
    End With
    dbTlgDatabase.CommitTrans
    CloseTable FISRecset
    
    Rem StockJrn
    clsSTK.DeleteStock mFisStkCode
    
    Rem update transaction --------------------------------------
    Rem ForgIssue
    dbTlgDatabase.BeginTrans
    FISRecset.Open "Select * from ForgIssue where FisCode=" & CStr(mFisCode) & " order by FisICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    With FISRecset
    If .RecordCount > 0 Then
        .MoveFirst
        Do While .EOF = False
            If InList(.Fields("FisRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
                .Fields("FisRecState") = cREC_UNCHANGED
                .Update
            Else
                .Fields("FisRecState") = ChkDeleteRecStatus(.Fields("FisRecState"))
                .Update
                .Delete
            End If
            
            .MoveNext
        Loop
    End If
    End With
    dbTlgDatabase.CommitTrans
    CloseTable FISRecset
    
    Rem StockJrn
    clsSTK.CommitStock mFisStkCode
    
    Rem end transaction -----------------------------------------
    Data_RemoveLog mFisCode
    clsSTK.EndStock mFisStkCode
    
    RemoveFlexRow Mfgrd2, srow
    Call RefreshBalWeight
    
    Mfgrd2.Row = srow
    Mfgrd2.SetFocus
Else
    Mfgrd2.SetFocus
End If

EndSub:
Set FISRecset = Nothing
Exit Sub

End Sub

Private Sub Mfgrd2_KeyPress(KeyAscii As Integer)
Dim srow As Integer, mFisStkCode As Long, mFisCode As Long

If KeyAscii = vbKeyReturn Then
    Mfgrd2.Col = FlexLeftVisibleCol(Mfgrd2)
    Mfgrd2.LeftCol = Mfgrd2.Col
    
    srow = Mfgrd2.Row
    mFisStkCode = Val(Mfgrd2.TextMatrix(srow, X2FISSTKCODE_COL))
    mFisCode = Val(Mfgrd2.TextMatrix(srow, X2FISCODE_COL))
    
    dtlAddEditMode = True
    dtlAddMode = (srow = FlexNewRow(Mfgrd2))
    VisibleControls True, Mfgrd2.Top + Mfgrd2.RowPos(Mfgrd2.Row)
    If dtlAddMode = True Then
        If clsSTK.BeginStock(0) = False Then
            GoTo EndSub
        End If
        mFisCode = GetNextSeqno(dbTlgDatabase, "ForgIssue", "FisCode")
        Data_CreateLog mFisCode
        
        Call ChkDefaultValues
        FormAddEditMode = cFORM_ADDMODE
    Else
        If clsSTK.BeginStock(mFisStkCode) = False Then
            GoTo EndSub
        End If
        Data_CreateLog mFisCode
        
        dtpFisDate.Text = Mfgrd2.TextMatrix(srow, X2FISDATE_COL)
        fcmbEmpName.BoundText = Mfgrd2.TextMatrix(srow, X2FISEMPCODE_COL): txtEmpName.Text = fcmbEmpName.Text
        fcmbItmName.BoundText = Mfgrd2.TextMatrix(srow, X2FISITMCODE_COL): txtItmName.Text = fcmbItmName.Text
        fcmbMacName.BoundText = Mfgrd2.TextMatrix(srow, X2FISMACCODE_COL): txtMacName.Text = fcmbMacName.Text
        mskFisWeight.Text = Mfgrd2.TextMatrix(srow, X2FISWEIGHT_COL)
        mskFisUnitWeight.Text = Mfgrd2.TextMatrix(srow, X2FISUNITWEIGHT_COL)
        mskFisNos.Text = Mfgrd2.TextMatrix(srow, X2FISNOS_COL)
        FormAddEditMode = cFORM_EDITMODE
        Rem same reading values is also perfomed in ChkFisUnit() function
    End If
    Call Calc_ConvQty
    mFisDate_old = Ctod(dtpFisDate.Text)
    mFisEmpCode_old = Val(fcmbEmpName.BoundText)
    mFisItmCode_old = Val(fcmbItmName.BoundText)
    mFisMacCode_old = Val(fcmbMacName.BoundText)
    mFisWeight_old = Val(UnMyNumFmt(mskFisWeight.Text))
    mFisNos_old = Val(UnMyNumFmt(mskFisNos.Text))
    Rem same value assignment has been done in ChkFisUnit() function
    
    dtpFisDate.SetFocus
    Call ValidDtl
End If
Exit Sub

EndSub:
VisibleControls False
dtlAddMode = False
dtlAddEditMode = False
FormAddEditMode = cFORM_SMRYMODE
Exit Sub

End Sub

Private Sub VisibleControls(ByVal mShowItem As Boolean, Optional ByVal mRowPos)
If Me.Visible = True Then
    txtVoid.SetFocus
End If
If IsMissing(mRowPos) = False Then
    dtpFisDate.Top = mRowPos
    txtEmpName.Top = mRowPos
    txtItmName.Top = mRowPos
    txtMacName.Top = mRowPos
    mskFisWeight.Top = mRowPos
    mskFisUnitWeight.Top = mRowPos
    mskFisNos.Top = mRowPos
    cmdOK.Top = mRowPos
    frBalQty.Top = mRowPos + Mfgrd2.RowHeight(Mfgrd2.Row)
End If

dtpFisDate.Text = Dtoc(DefaultEntryDate)
txtEmpName.Text = "": fcmbEmpName.BoundText = ""
txtItmName.Text = "": fcmbItmName.BoundText = ""
txtMacName.Text = "": fcmbMacName.BoundText = ""
mskFisWeight.Text = ToMyNumFmt(0, mDecimals:=3)
mskFisUnitWeight.Text = ToMyNumFmt(0, mDecimals:=3)
mskFisNos.Text = ToMyNumFmt(0, mDecimals:=0)
mskBalWeight.Text = ToMyNumFmt(0, mDecimals:=3)
mskBalNos.Text = ToMyNumFmt(0, mDecimals:=0)

Call ValidDtl

dtpFisDate.Visible = mShowItem
txtEmpName.Visible = mShowItem
txtItmName.Visible = mShowItem
txtMacName.Visible = mShowItem
mskFisWeight.Visible = mShowItem
mskFisUnitWeight.Visible = mShowItem
mskFisNos.Visible = mShowItem
cmdOK.Visible = mShowItem
frBalQty.Visible = mShowItem

Rem list of header and grid controls are common so resetting it to header values after addition/editing ends
If mShowItem = False Then
    fcmbEmpName.Text = txtEmpName1.Text: txtEmpName1.Text = fcmbEmpName.Text
    fcmbItmName.Text = txtItmName1.Text: txtItmName1.Text = fcmbItmName.Text
    fcmbMacName.Text = txtMacName1.Text: txtMacName1.Text = fcmbMacName.Text
End If

frHeader.Enabled = (mShowItem = False)
Mfgrd2.Enabled = (mShowItem = False)
If mShowItem = False Then
    FormAddEditMode = cFORM_SMRYMODE
End If

End Sub

Private Sub ValidDtl()
Dim mDataOk As Boolean
mDataOk = (IsFinYrDate(Ctod(dtpFisDate.Text)) = True And Val(fcmbEmpName.BoundText) > 0 And Val(fcmbItmName.BoundText) > 0 And Val(fcmbMacName.BoundText) > 0 And Val(UnMyNumFmt(mskFisWeight.Text)) > 0 And Val(UnMyNumFmt(mskFisUnitWeight.Text)) > 0 And Val(UnMyNumFmt(mskFisNos.Text)) > 0)
If mDataOk = True And InterActiveChange(cmdOK) = True Then
    mDataOk = (ChkFisUnit(mAddEditMode:=True, mMeasUnit:=0) = True)
End If
If mDataOk = True Then
    mskBalWeight.Text = ToMyNumFmt(GetBalUnit(mAddEditMode:=True, srow:=Mfgrd2.Row, mMeasUnit:=WEIGHT_UNIT), mDecimals:=3)
    mskBalNos.Text = ToMyNumFmt(GetBalUnit(mAddEditMode:=True, srow:=Mfgrd2.Row, mMeasUnit:=NOS_UNIT), mDecimals:=0)
Else
    mskBalWeight.Text = ToMyNumFmt(0, mDecimals:=3)
    mskBalNos.Text = ToMyNumFmt(0, mDecimals:=0)
End If
cmdOK.Caption = IIf(mDataOk = True, "&OK", "&Cancel")
cmdOK.BackColor = IIf(mDataOk = True, &H80FF80, &H8080FF)
End Sub

Private Sub Calc_ConvQty()
mskFisNos.Text = ToMyNumFmt(MyDivide(Val(UnMyNumFmt(mskFisWeight.Text)), Val(UnMyNumFmt(mskFisUnitWeight.Text))), mDecimals:=0)

End Sub

Private Sub mskFisNos_GotFocus()
FlashActiveControl mskFisNos, True

End Sub

Private Sub mskFisNos_LostFocus()
FlashActiveControl mskFisNos, False

End Sub

Private Sub mskFisNos_Validate(Cancel As Boolean)
mskFisNos.Text = ToMyNumFmt(mskFisNos.Text, mDecimals:=0)
If Val(UnMyNumFmt(mskFisNos.Text)) <= 0 Then
    ErrorBox "Invalid Nos. !!!"
    mskFisNos.SetFocus
    Cancel = True
Else
    Call Calc_ConvQty
    If dtlAddMode = False Then
        If ChkFisUnit(mAddEditMode:=True, mMeasUnit:=NOS_UNIT) = False Then
            Cancel = True
            mskFisNos.SetFocus
        End If
    End If
End If
Call ValidDtl

End Sub

Private Sub mskFisWeight_GotFocus()
FlashActiveControl mskFisWeight, True

End Sub

Private Sub mskFisWeight_LostFocus()
FlashActiveControl mskFisWeight, False
End Sub

Private Sub mskFisWeight_Validate(Cancel As Boolean)
mskFisWeight.Text = ToMyNumFmt(mskFisWeight.Text, mDecimals:=3)
If Val(UnMyNumFmt(mskFisWeight.Text)) <= 0 Then
    ErrorBox "Invalid Weight !!!"
    mskFisWeight.SetFocus
    Cancel = True
Else
    Call Calc_ConvQty
    If dtlAddMode = False Then
        If ChkFisUnit(mAddEditMode:=True, mMeasUnit:=WEIGHT_UNIT) = False Then
            Cancel = True
            mskFisWeight.SetFocus
        End If
    End If
End If
Call ValidDtl

End Sub

Rem Issued qty should not fall short for already produced/consumed material
Private Function ChkFisUnit(ByVal mAddEditMode As Boolean, ByVal mMeasUnit As Integer) As Boolean
Dim tRecset As New ADODB.Recordset, mFisWeight_sum As Double, mFisNos_sum As Double, mFpnConsWeight_sum As Double, mFpnConsNos_sum As Double, mShortFisWeight As Double, mShortFisNos As Double, mBalWeight As Double, mBalNos As Double
Dim mMaxChkDate As Date, mLoopFisDate As Date
Dim mFisDate As Date, mFisEmpCode As Long, mFisItmCode As Long, mFisMacCode As Long, mFisWeight As Double, mFisNos As Double
Dim mFisICode As Long, srow As Long

Rem control values will be assigned just below and not anywhere in procedural section
srow = Mfgrd2.Row
If mAddEditMode = True Then
    mFisDate = Ctod(dtpFisDate.Text)
    mFisEmpCode = Val(fcmbEmpName.BoundText)
    mFisItmCode = Val(fcmbItmName.BoundText)
    mFisMacCode = Val(fcmbMacName.BoundText)
    mFisWeight = Val(UnMyNumFmt(mskFisWeight.Text))
    mFisNos = Val(UnMyNumFmt(mskFisNos.Text))
Else
    Rem value assignment as done for add edit mode (keypress)
    mFisDate = Ctod(Mfgrd2.TextMatrix(srow, X2FISDATE_COL))
    mFisEmpCode = Val(Mfgrd2.TextMatrix(srow, X2FISEMPCODE_COL))
    mFisItmCode = Val(Mfgrd2.TextMatrix(srow, X2FISITMCODE_COL))
    mFisMacCode = Val(Mfgrd2.TextMatrix(srow, X2FISMACCODE_COL))
    mFisWeight = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2FISWEIGHT_COL)))
    mFisNos = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2FISNOS_COL)))
    
    Rem old value assignment as done for add edit mode (keypress)
    mFisDate_old = mFisDate
    mFisEmpCode_old = mFisEmpCode
    mFisItmCode_old = mFisItmCode
    mFisMacCode_old = mFisMacCode
    mFisWeight_old = mFisWeight
    mFisNos_old = mFisNos
End If
mFisICode = Val(Mfgrd2.TextMatrix(srow, X2FISICODE_COL))

If mFisEmpCode_old <> mFisEmpCode Or mFisItmCode_old <> mFisItmCode Or mFisMacCode_old <> mFisMacCode Then
    Rem check minus stock by making issue qty as zero of old item entry combination
    ChkFisUnit = True
    
    With tRecset
    .Open "Select top 1 * from ForgProdn order by FpnDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount > 0 Then
        mMaxChkDate = .Fields("FpnDate")
    Else
        mMaxChkDate = mFisDate_old
    End If
    End With
    CloseTable tRecset
    
    mMaxChkDate = IIf(mFisDate_old > mMaxChkDate, mFisDate_old, mMaxChkDate)
    For mLoopFisDate = mFisDate_old To mMaxChkDate
        mFisWeight_sum = 0: mFisNos_sum = 0: mFpnConsWeight_sum = 0: mFpnConsNos_sum = 0
        
        tRecset.Open "Select sum(FisWeight) as FisWeight_sum, sum(FisNos) as FisNos_sum from ForgIssue where FisEmpCode=" & CStr(mFisEmpCode_old) & " and FisItmCode=" & CStr(mFisItmCode_old) & " and FisMacCode=" & CStr(mFisMacCode_old) & " and FisDate<=#" & CStr(ToSysDate(mLoopFisDate)) & "#" & IIf(dtlAddMode = False, " and FisICode<>" & CStr(mFisICode), "") & " group by FisEmpCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mFisWeight_sum = tRecset.Fields("FisWeight_sum")
            mFisNos_sum = tRecset.Fields("FisNos_sum")
        End If
        CloseTable tRecset
        
        tRecset.Open "Select sum(FpnConsWeight) as FpnConsWeight_sum, sum(FpnConsNos) as FpnConsNos_sum from ForgProdn where FpnEmpCode=" & CStr(mFisEmpCode_old) & " and FpnItmCode=" & CStr(mFisItmCode_old) & " and FpnMacCode=" & CStr(mFisMacCode_old) & " and FpnDate<=#" & CStr(ToSysDate(mLoopFisDate)) & "#" & " group by FpnEmpCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mFpnConsWeight_sum = tRecset.Fields("FpnConsWeight_sum")
            mFpnConsNos_sum = tRecset.Fields("FpnConsNos_sum")
        End If
        CloseTable tRecset
        
        mBalWeight = mFisWeight_sum - mFpnConsWeight_sum
        mBalNos = mFisNos_sum - mFpnConsNos_sum
        
        If (mMeasUnit = WEIGHT_UNIT Or mMeasUnit = 0) And mBalWeight < 0 Then
            ErrorBox "Excess Consumed Weight over Material Issue is " & ToMyNumFmt(mBalWeight, mDecimals:=3, mUseAbs:=True) & " on Dated " & CStr(Dtoc(mLoopFisDate)) & " !!!"
            ChkFisUnit = False
            Exit For
        ElseIf (mMeasUnit = NOS_UNIT Or mMeasUnit = 0) And mBalNos < 0 Then
            ErrorBox "Excess Consumed Nos. over Material Issue is " & ToMyNumFmt(mBalNos, mDecimals:=0, mUseAbs:=True) & " on Dated " & CStr(Dtoc(mLoopFisDate)) & " !!!"
            ChkFisUnit = False
            Exit For
        End If
    Next mLoopFisDate

ElseIf mFisDate < mFisDate_old Then
    Rem check stock availability for production from current date to end production date
    ChkFisUnit = True
    
    With tRecset
    .Open "Select top 1 * from ForgProdn order by FpnDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount > 0 Then
        mMaxChkDate = .Fields("FpnDate")
    Else
        mMaxChkDate = mFisDate
    End If
    End With
    CloseTable tRecset
    
    mMaxChkDate = IIf(mFisDate > mMaxChkDate, mFisDate, mMaxChkDate)
    For mLoopFisDate = mFisDate To mMaxChkDate
        mFisWeight_sum = 0: mFisNos_sum = 0: mFpnConsWeight_sum = 0: mFpnConsNos_sum = 0
        
        tRecset.Open "Select sum(FisWeight) as FisWeight_sum, sum(FisNos) as FisNos_sum from ForgIssue where FisEmpCode=" & CStr(mFisEmpCode) & " and FisItmCode=" & CStr(mFisItmCode) & " and FisMacCode=" & CStr(mFisMacCode) & " and FisDate<=#" & CStr(ToSysDate(mLoopFisDate)) & "#" & IIf(dtlAddMode = False, " and FisICode<>" & CStr(mFisICode), "") & " group by FisEmpCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mFisWeight_sum = tRecset.Fields("FisWeight_sum")
            mFisNos_sum = tRecset.Fields("FisNos_sum")
        End If
        CloseTable tRecset
        
        tRecset.Open "Select sum(FpnConsWeight) as FpnConsWeight_sum, sum(FpnConsNos) as FpnConsNos_sum from ForgProdn where FpnEmpCode=" & CStr(mFisEmpCode) & " and FpnItmCode=" & CStr(mFisItmCode) & " and FpnMacCode=" & CStr(mFisMacCode) & " and FpnDate<=#" & CStr(ToSysDate(mLoopFisDate)) & "#" & " group by FpnEmpCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mFpnConsWeight_sum = tRecset.Fields("FpnConsWeight_sum")
            mFpnConsNos_sum = tRecset.Fields("FpnConsNos_sum")
        End If
        CloseTable tRecset
        
        mBalWeight = mFisWeight_sum - mFpnConsWeight_sum + mFisWeight
        mBalNos = mFisNos_sum - mFpnConsNos_sum + mFisNos
        
        If (mMeasUnit = WEIGHT_UNIT Or mMeasUnit = 0) And mBalWeight < 0 Then
            ErrorBox "Excess Consumed Weight over Material Issue is " & ToMyNumFmt(mBalWeight, mDecimals:=3, mUseAbs:=True) & " on Dated " & CStr(Dtoc(mLoopFisDate)) & " !!!"
            ChkFisUnit = False
            Exit For
        ElseIf (mMeasUnit = NOS_UNIT Or mMeasUnit = 0) And mBalNos < 0 Then
            ErrorBox "Excess Consumed Nos. over Material Issue is " & ToMyNumFmt(mBalNos, mDecimals:=0, mUseAbs:=True) & " on Dated " & CStr(Dtoc(mLoopFisDate)) & " !!!"
            ChkFisUnit = False
            Exit For
        End If
    Next mLoopFisDate
    
ElseIf mFisDate > mFisDate_old Then
    Rem check minus stock for old date to previous date of current date by making issued to zero
    Rem and then check minus stock from current date onward for changed/unchanged issued qty
    ChkFisUnit = True
    
    With tRecset
    .Open "Select top 1 * from ForgProdn order by FpnDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount > 0 Then
        mMaxChkDate = .Fields("FpnDate")
        If mMaxChkDate >= mFisDate Then
            mMaxChkDate = mFisDate - 1
        End If
    Else
        mMaxChkDate = mFisDate_old
    End If
    End With
    CloseTable tRecset
    
    mMaxChkDate = IIf(mFisDate_old > mMaxChkDate, mFisDate_old, mMaxChkDate)
    For mLoopFisDate = mFisDate_old To mMaxChkDate
        mFisWeight_sum = 0: mFisNos_sum = 0: mFpnConsWeight_sum = 0: mFpnConsNos_sum = 0
        
        tRecset.Open "Select sum(FisWeight) as FisWeight_sum, sum(FisNos) as FisNos_sum from ForgIssue where FisEmpCode=" & CStr(mFisEmpCode) & " and FisItmCode=" & CStr(mFisItmCode) & " and FisMacCode=" & CStr(mFisMacCode) & " and FisDate<=#" & CStr(ToSysDate(mLoopFisDate)) & "#" & IIf(dtlAddMode = False, " and FisICode<>" & CStr(mFisICode), "") & " group by FisEmpCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mFisWeight_sum = tRecset.Fields("FisWeight_sum")
            mFisNos_sum = tRecset.Fields("FisNos_sum")
        End If
        CloseTable tRecset
        
        tRecset.Open "Select sum(FpnConsWeight) as FpnConsWeight_sum, sum(FpnConsNos) as FpnConsNos_sum from ForgProdn where FpnEmpCode=" & CStr(mFisEmpCode) & " and FpnItmCode=" & CStr(mFisItmCode) & " and FpnMacCode=" & CStr(mFisMacCode) & " and FpnDate<=#" & CStr(ToSysDate(mLoopFisDate)) & "#" & " group by FpnEmpCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mFpnConsWeight_sum = tRecset.Fields("FpnConsWeight_sum")
            mFpnConsNos_sum = tRecset.Fields("FpnConsNos_sum")
        End If
        CloseTable tRecset
        
        mBalWeight = mFisWeight_sum - mFpnConsWeight_sum
        mBalNos = mFisNos_sum - mFpnConsNos_sum
        
        If (mMeasUnit = WEIGHT_UNIT Or mMeasUnit = 0) And mBalWeight < 0 Then
            ErrorBox "Excess Consumed Weight over Material Issue is " & ToMyNumFmt(mBalWeight, mDecimals:=3, mUseAbs:=True) & " on Dated " & CStr(Dtoc(mLoopFisDate)) & " !!!"
            ChkFisUnit = False
            Exit For
        ElseIf (mMeasUnit = NOS_UNIT Or mMeasUnit = 0) And mBalNos < 0 Then
            ErrorBox "Excess Consumed Nos. over Material Issue is " & ToMyNumFmt(mBalNos, mDecimals:=0, mUseAbs:=True) & " on Dated " & CStr(Dtoc(mLoopFisDate)) & " !!!"
            ChkFisUnit = False
            Exit For
        End If
    Next mLoopFisDate
    
    If ChkFisUnit = True Then
        With tRecset
        .Open "Select top 1 * from ForgProdn order by FpnDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If .RecordCount > 0 Then
            mMaxChkDate = .Fields("FpnDate")
        Else
            mMaxChkDate = mFisDate
        End If
        End With
        CloseTable tRecset
        
        mMaxChkDate = IIf(mFisDate > mMaxChkDate, mFisDate, mMaxChkDate)
        For mLoopFisDate = mFisDate To mMaxChkDate
            mFisWeight_sum = 0: mFisNos_sum = 0: mFpnConsWeight_sum = 0: mFpnConsNos_sum = 0
            
            tRecset.Open "Select sum(FisWeight) as FisWeight_sum, sum(FisNos) as FisNos_sum from ForgIssue where FisEmpCode=" & CStr(mFisEmpCode) & " and FisItmCode=" & CStr(mFisItmCode) & " and FisMacCode=" & CStr(mFisMacCode) & " and FisDate<=#" & CStr(ToSysDate(mLoopFisDate)) & "#" & IIf(dtlAddMode = False, " and FisICode<>" & CStr(mFisICode), "") & " group by FisEmpCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
            If tRecset.RecordCount > 0 Then
                mFisWeight_sum = tRecset.Fields("FisWeight_sum")
                mFisNos_sum = tRecset.Fields("FisNos_sum")
            End If
            CloseTable tRecset
            
            tRecset.Open "Select sum(FpnConsWeight) as FpnConsWeight_sum, sum(FpnConsNos) as FpnConsNos_sum from ForgProdn where FpnEmpCode=" & CStr(mFisEmpCode) & " and FpnItmCode=" & CStr(mFisItmCode) & " and FpnMacCode=" & CStr(mFisMacCode) & " and FpnDate<=#" & CStr(ToSysDate(mLoopFisDate)) & "#" & " group by FpnEmpCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
            If tRecset.RecordCount > 0 Then
                mFpnConsWeight_sum = tRecset.Fields("FpnConsWeight_sum")
                mFpnConsNos_sum = tRecset.Fields("FpnConsNos_sum")
            End If
            CloseTable tRecset
            
            mBalWeight = mFisWeight_sum - mFpnConsWeight_sum + mFisWeight
            mBalNos = mFisNos_sum - mFpnConsNos_sum + mFisNos
            
            If (mMeasUnit = WEIGHT_UNIT Or mMeasUnit = 0) And mBalWeight < 0 Then
                ErrorBox "Excess Consumed Weight over Material Issue is " & ToMyNumFmt(mBalWeight, mDecimals:=3, mUseAbs:=True) & " on Dated " & CStr(Dtoc(mLoopFisDate)) & " !!!"
                ChkFisUnit = False
                Exit For
            ElseIf (mMeasUnit = NOS_UNIT Or mMeasUnit = 0) And mBalNos < 0 Then
                ErrorBox "Excess Consumed Nos. over Material Issue is " & ToMyNumFmt(mBalNos, mDecimals:=0, mUseAbs:=True) & " on Dated " & CStr(Dtoc(mLoopFisDate)) & " !!!"
                ChkFisUnit = False
                Exit For
            End If
        Next mLoopFisDate
    End If
Else
    Rem first check minus stock from current date to end production date
    
    ChkFisUnit = True
    With tRecset
    .Open "Select top 1 * from ForgProdn order by FpnDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount > 0 Then
        mMaxChkDate = .Fields("FpnDate")
    Else
        mMaxChkDate = mFisDate
    End If
    End With
    CloseTable tRecset
    
    mMaxChkDate = IIf(mFisDate > mMaxChkDate, mFisDate, mMaxChkDate)
    For mLoopFisDate = mFisDate To mMaxChkDate
        mFisWeight_sum = 0: mFisNos_sum = 0: mFpnConsWeight_sum = 0: mFpnConsNos_sum = 0
        
        tRecset.Open "Select sum(FisWeight) as FisWeight_sum, sum(FisNos) as FisNos_sum from ForgIssue where FisEmpCode=" & CStr(mFisEmpCode) & " and FisItmCode=" & CStr(mFisItmCode) & " and FisMacCode=" & CStr(mFisMacCode) & " and FisDate<=#" & CStr(ToSysDate(mLoopFisDate)) & "#" & IIf(dtlAddMode = False, " and FisICode<>" & CStr(mFisICode), "") & " group by FisEmpCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mFisWeight_sum = tRecset.Fields("FisWeight_sum")
            mFisNos_sum = tRecset.Fields("FisNos_sum")
        End If
        CloseTable tRecset
        
        tRecset.Open "Select sum(FpnConsWeight) as FpnConsWeight_sum, sum(FpnConsNos) as FpnConsNos_sum from ForgProdn where FpnEmpCode=" & CStr(mFisEmpCode) & " and FpnItmCode=" & CStr(mFisItmCode) & " and FpnMacCode=" & CStr(mFisMacCode) & " and FpnDate<=#" & CStr(ToSysDate(mLoopFisDate)) & "#" & " group by FpnEmpCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mFpnConsWeight_sum = tRecset.Fields("FpnConsWeight_sum")
            mFpnConsNos_sum = tRecset.Fields("FpnConsNos_sum")
        End If
        CloseTable tRecset
        
        mBalWeight = mFisWeight_sum - mFpnConsWeight_sum + IIf(mAddEditMode = True, mFisWeight, 0)
        mBalNos = mFisNos_sum - mFpnConsNos_sum + IIf(mAddEditMode = True, mFisNos, 0)
        
        If (mMeasUnit = WEIGHT_UNIT Or mMeasUnit = 0) And mBalWeight < 0 Then
            ErrorBox "Excess Consumed Weight over Material Issue is " & ToMyNumFmt(mBalWeight, mDecimals:=3, mUseAbs:=True) & " on Dated " & CStr(Dtoc(mLoopFisDate)) & " !!!"
            ChkFisUnit = False
            Exit For
        ElseIf (mMeasUnit = NOS_UNIT Or mMeasUnit = 0) And mBalNos < 0 Then
            ErrorBox "Excess Consumed Nos. over Material Issue is " & ToMyNumFmt(mBalNos, mDecimals:=0, mUseAbs:=True) & " on Dated " & CStr(Dtoc(mLoopFisDate)) & " !!!"
            ChkFisUnit = False
            Exit For
        End If
    Next mLoopFisDate
    
End If

End Function

Private Sub mskFisUnitWeight_GotFocus()
FlashActiveControl mskFisUnitWeight, True

End Sub

Private Sub mskFisUnitWeight_LostFocus()
FlashActiveControl mskFisUnitWeight, False

End Sub

Private Sub mskFisUnitWeight_Validate(Cancel As Boolean)
mskFisUnitWeight.Text = ToMyNumFmt(mskFisUnitWeight.Text, mDecimals:=3)
If Val(UnMyNumFmt(mskFisUnitWeight.Text)) <= 0 Then
    ErrorBox "Invalid Unit Weight !!!"
    mskFisUnitWeight.SetFocus
    Cancel = True
Else
    Call Calc_ConvQty
    If dtlAddMode = False Then
        If ChkFisUnit(mAddEditMode:=True, mMeasUnit:=0) = False Then
            Cancel = True
            mskFisUnitWeight.SetFocus
        End If
    End If
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

Private Sub txtMacName_Change()
If fcmbMacName.CallFromText_Change = False Then
    fcmbMacName.CallFromText_Change = True
    If InterActiveChange(txtMacName) = True Then
        fcmbMacName.UserText = Array(txtMacName.Text, txtMacName.SelStart)
        fcmbMacName.Show 1
        txtMacName.Text = fcmbMacName.Text
    End If
    fcmbMacName.CallFromText_Change = False
End If

End Sub

Private Sub txtMacName_GotFocus()
FlashActiveControl txtMacName, True
End Sub

Private Sub txtMacName_LostFocus()
FlashActiveControl txtMacName, False
End Sub

Private Sub txtMacName_Validate(Cancel As Boolean)
If fcmbMacName.BoundText = "" Then
    ErrorBox "Invalid Machine Selection !!!"
    txtMacName.SetFocus
    Cancel = True
End If
Call ValidDtl

End Sub

Private Sub txtMacName1_Change()
If fcmbMacName.CallFromText_Change = False Then
    fcmbMacName.CallFromText_Change = True
    If InterActiveChange(txtMacName1) = True Then
        fcmbMacName.UserText = Array(txtMacName1.Text, txtMacName1.SelStart)
        fcmbMacName.Show 1
        txtMacName1.Text = fcmbMacName.Text
    End If
    fcmbMacName.CallFromText_Change = False
End If

End Sub

Private Sub txtMacName1_GotFocus()
FlashActiveControl txtMacName1, True
End Sub

Private Sub txtMacName1_LostFocus()
FlashActiveControl txtMacName1, False
End Sub

Private Sub txtEmpName_Change()
If fcmbEmpName.CallFromText_Change = False Then
    fcmbEmpName.CallFromText_Change = True
    If InterActiveChange(txtEmpName) = True Then
        fcmbEmpName.UserText = Array(txtEmpName.Text, txtEmpName.SelStart)
        fcmbEmpName.Show 1
        txtEmpName.Text = fcmbEmpName.Text
    End If
    fcmbEmpName.CallFromText_Change = False
End If

End Sub

Private Sub txtEmpName_GotFocus()
FlashActiveControl txtEmpName, True
End Sub

Private Sub txtEmpName_LostFocus()
FlashActiveControl txtEmpName, False
End Sub

Private Sub txtEmpName_Validate(Cancel As Boolean)
If fcmbEmpName.BoundText = "" Then
    ErrorBox "Invalid Operator Selection !!!"
    txtEmpName.SetFocus
    Cancel = True
End If
Call ValidDtl

End Sub

Private Sub txtEmpName1_Change()
If fcmbEmpName.CallFromText_Change = False Then
    fcmbEmpName.CallFromText_Change = True
    If InterActiveChange(txtEmpName1) = True Then
        fcmbEmpName.UserText = Array(txtEmpName1.Text, txtEmpName1.SelStart)
        fcmbEmpName.Show 1
        txtEmpName1.Text = fcmbEmpName.Text
    End If
    fcmbEmpName.CallFromText_Change = False
End If

End Sub

Private Sub txtEmpName1_GotFocus()
FlashActiveControl txtEmpName1, True
End Sub

Private Sub txtEmpName1_LostFocus()
FlashActiveControl txtEmpName1, False
End Sub

Private Sub ChkDefaultValues()
Dim srow As Long
srow = Mfgrd2.Row - 1
If srow > FlexHeadingRow(Mfgrd2) Then
    dtpFisDate.Text = Mfgrd2.TextMatrix(srow, X2FISDATE_COL)
    fcmbEmpName.BoundText = Mfgrd2.TextMatrix(srow, X2FISEMPCODE_COL): txtEmpName.Text = fcmbEmpName.Text
    fcmbItmName.BoundText = Mfgrd2.TextMatrix(srow, X2FISITMCODE_COL): txtItmName.Text = fcmbItmName.Text
    fcmbMacName.BoundText = Mfgrd2.TextMatrix(srow, X2FISMACCODE_COL): txtMacName.Text = fcmbMacName.Text
Else
    dtpFisDate.Text = dtpFisDate1.Text
    fcmbEmpName.Text = txtEmpName1.Text: txtEmpName.Text = fcmbEmpName.Text
    fcmbItmName.Text = txtItmName1.Text: txtItmName.Text = fcmbItmName.Text
    fcmbMacName.Text = txtMacName1.Text: txtMacName.Text = fcmbMacName.Text
End If
mskFisWeight.Text = ToMyNumFmt(0, mDecimals:=3)
mskFisUnitWeight.Text = ToMyNumFmt(0, mDecimals:=3)
mskFisNos.Text = ToMyNumFmt(0, mDecimals:=0)
mskBalWeight.Text = ToMyNumFmt(0, mDecimals:=3)
mskBalNos.Text = ToMyNumFmt(0, mDecimals:=0)

End Sub

Private Function Data_CreateLog(ByVal mFisCode As Long) As Boolean
Dim FIS_LogRS As New ADODB.Recordset
Data_CreateLog = False

FIS_LogRS.Open "Select * from ForgIssue_Log where FisCode=" & CStr(mFisCode) & "", dbTlgDatabase, adOpenKeyset, adLockOptimistic
With FIS_LogRS
If .RecordCount = 0 Then
    .Close
    Rem only ok records will be taken in log, because not ok records are created out of crashed entries which must be cleared when entry rejected
    dbTlgDatabase.BeginTrans
    dbTlgDatabase.Execute "Insert into ForgIssue_Log Select * from ForgIssue where FisCode=" & CStr(mFisCode) & " and FisRecState=" & CStr(cREC_UNCHANGED) & ""
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
Set FIS_LogRS = Nothing
Exit Function

End Function

Private Function Data_RemoveLog(ByVal mFisCode As Long) As Boolean
Data_RemoveLog = False

dbTlgDatabase.BeginTrans
dbTlgDatabase.Execute "Delete from ForgIssue_Log where FisCode=" & CStr(mFisCode)
dbTlgDatabase.CommitTrans

Data_RemoveLog = True
End Function


