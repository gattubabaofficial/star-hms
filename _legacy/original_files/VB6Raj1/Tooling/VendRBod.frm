VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmVendorRcptBod 
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
      TabIndex        =   22
      Top             =   840
      Width           =   13935
      Begin VB.TextBox txtMprName1 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   1320
         TabIndex        =   4
         Top             =   960
         Width           =   3495
      End
      Begin VB.TextBox dtpVrbDate2 
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
      Begin VB.TextBox dtpVrbDate1 
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
         TabIndex        =   27
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
         TabIndex        =   26
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
         TabIndex        =   25
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
         TabIndex        =   24
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
         TabIndex        =   23
         Top             =   240
         Width           =   1095
      End
   End
   Begin VB.TextBox txtVoid 
      CausesValidation=   0   'False
      Height          =   375
      Left            =   120
      TabIndex        =   16
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
      TabIndex        =   21
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
      TabIndex        =   20
      TabStop         =   0   'False
      Top             =   0
      UseMaskColor    =   -1  'True
      Width           =   255
   End
   Begin VB.ComboBox cmbFormEntryMode 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   315
      ItemData        =   "VendRBod.frx":0000
      Left            =   0
      List            =   "VendRBod.frx":000D
      Style           =   1  'Simple Combo
      TabIndex        =   19
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
      TabIndex        =   18
      Top             =   2280
      Width           =   13935
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
         Left            =   9840
         Style           =   1  'Graphical
         TabIndex        =   15
         Top             =   1320
         Width           =   735
      End
      Begin VB.TextBox dtpVrbDate 
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
         Top             =   960
         Width           =   1215
      End
      Begin VB.TextBox txtItmName 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   3960
         TabIndex        =   9
         Top             =   960
         Width           =   2295
      End
      Begin VB.TextBox txtVndName 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   1320
         TabIndex        =   8
         Top             =   960
         Width           =   2655
      End
      Begin VB.TextBox mskBalQtyForMach 
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
         Left            =   12000
         TabIndex        =   14
         Tag             =   "AhCode"
         Text            =   "0"
         Top             =   960
         Width           =   1335
      End
      Begin VB.TextBox txtMprName 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   6240
         TabIndex        =   10
         Top             =   960
         Width           =   1815
      End
      Begin VB.TextBox mskVrbFinOutQty 
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
         Left            =   8040
         TabIndex        =   11
         Tag             =   "AhCode"
         Text            =   "0"
         Top             =   960
         Width           =   1335
      End
      Begin VB.TextBox mskVrbRejOutQty 
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
         Left            =   9360
         TabIndex        =   12
         Tag             =   "AhCode"
         Text            =   "0"
         Top             =   960
         Width           =   1215
      End
      Begin VB.TextBox mskBalQtyForRcpt 
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
         Left            =   10560
         TabIndex        =   13
         Tag             =   "AhCode"
         Text            =   "0"
         Top             =   960
         Width           =   1455
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd2 
         Height          =   5775
         Left            =   120
         TabIndex        =   6
         Top             =   240
         Width           =   13695
         _ExtentX        =   24156
         _ExtentY        =   10186
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
      Caption         =   "Vendor Receipt from BOD"
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
      TabIndex        =   17
      Top             =   0
      Width           =   9015
   End
End
Attribute VB_Name = "frmVendorRcptBod"
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
Dim mVrbDate_old As Date, mVrbVndCode_old As Long, mVrbItmCode_old As Long, mVrbMprCode_old As Long, mVrbConsQty_old As Double, mVrbFinOutQty_old As Double

' StockJrn transaction detail grid Mfgrd2 column definitions
Const X2VRBICODE_COL = 0
Const X2VRBDATE_COL = 1
Const X2VNDNAME_COL = 2
Const X2ITMNAME_COL = 3
Const X2MPRNAME_COL = 4
Const X2VRBFINOUTQTY_COL = 5
Const X2VRBREJOUTQTY_COL = 6
Const X2BALQTYFORRCPT_COL = 7
Const X2BALQTYFORMACH_COL = 8
Const X2VRBCODE_COL = 9
Const X2VRBSNO_COL = 10
Const X2VRBVNDCODE_COL = 11
Const X2VRBITMCODE_COL = 12
Const X2VRBMPRCODE_COL = 13
Const X2VRBSTKCODE_COL = 14
Const X2VRBSTKICODEIS_COL = 15
Const X2VRBSTKICODERC_COL = 16
Const X2VRBRECSTATE_COL = 17
Const MFGRD2_COLS = 18

Rem General declarations
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
    dtpVrbDate1.SetFocus
Else
    Unload Me
End If

End Sub

Private Sub cmdOK_Click()
Dim VRBRecset As New ADODB.Recordset, VRB_LogRS As New ADODB.Recordset
Dim srow As Long, mVrbStkCode As Long, mVrbStkICodeIs As Long, mVrbStkICodeRc As Long, mVrbCode As Long, mVrbICode As Long, mVrbSno As Long, mStkItmRefCode As Long
Dim mVrbFinOutQty As Double, mConsQty As Double

srow = Mfgrd2.Row
If dtlAddMode = True Then
    mVrbCode = GetNextSeqno(dbTlgDatabase, "VendRcBod", "VrbCode")
    mVrbStkCode = clsSTK.ActiveStkCode
Else
    mVrbCode = Val(Mfgrd2.TextMatrix(srow, X2VRBCODE_COL))
    mVrbStkCode = Val(Mfgrd2.TextMatrix(srow, X2VRBSTKCODE_COL))
    mVrbICode = Val(Mfgrd2.TextMatrix(srow, X2VRBICODE_COL))
    mVrbStkICodeIs = Val(Mfgrd2.TextMatrix(srow, X2VRBSTKICODEIS_COL))
    mVrbStkICodeRc = Val(Mfgrd2.TextMatrix(srow, X2VRBSTKICODERC_COL))
End If
If dtlEditCanceled = False Then
    Call ValidDtl
End If
If cmdOK.Caption = "&OK" And dtlEditCanceled = False Then
    Rem addnew/update -------------------------
    Rem Forging section
    dbTlgDatabase.BeginTrans
    With VRBRecset
    If dtlAddMode = True Then
        mVrbSno = GetNextSeqno(dbTlgDatabase, "VendRcBod", "VrbSno", "VrbCode" = CStr(mVrbCode))
        
        VRBRecset.Open "Select * from VendRcBod where VrbCode=" & CStr(mVrbCode) & "", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        .AddNew
        Rem .Fields("VrbICode") = AutoNumber
        .Fields("VrbCode") = mVrbCode
        .Fields("VrbSno") = mVrbSno
    Else
        VRBRecset.Open "Select * from VendRcBod where VrbCode=" & CStr(mVrbCode) & " and VrbICode=" & CStr(mVrbICode) & "", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    End If
    .Fields("VrbDate") = Ctod(dtpVrbDate.Text)
    .Fields("VrbVndCode") = Val(fcmbVndName.BoundText)
    .Fields("VrbItmCode") = Val(fcmbItmName.BoundText)
    .Fields("VrbItmRefCode") = 0
    .Fields("VrbMprCode") = Val(fcmbMprName.BoundText)
    .Fields("VrbFinOutQty") = Val(UnMyNumFmt(mskVrbFinOutQty.Text))
    .Fields("VrbRejOutQty") = Val(UnMyNumFmt(mskVrbRejOutQty.Text))
    .Fields("VrbNarr") = ""
    .Fields("VrbRecState") = ChkEditRecStatus(.Fields("VrbRecState"))
    .Update
    .Fields("VrbConsQty") = .Fields("VrbFinOutQty") + .Fields("VrbRejOutQty")
    .Update
    
    mVrbICode = .Fields("VrbICode")
    mConsQty = .Fields("VrbConsQty")
    mVrbFinOutQty = .Fields("VrbFinOutQty")
    
    End With
    dbTlgDatabase.CommitTrans
    CloseTable VRBRecset
    
    Rem StockJrn section
    clsSTK.Clear
    If dtlAddMode = True Then
        Rem issue stock
        clsSTK.mStkDate_dt = Ctod(dtpVrbDate.Text)
        clsSTK.mStkItmCode_lng = Val(fcmbItmName.BoundText)
        clsSTK.mStkItmRefCode_lng = 0
        clsSTK.mStkQty_dbl = ToIssueQty(mConsQty)
        clsSTK.mStkRate_dbl = 0
        clsSTK.mStkValue_dbl = 0
        clsSTK.mStkNarr_str = ""
        clsSTK.mStkRecState_int = cREC_NEW
        clsSTK.mStkLItmCode_lng = 0
        
        clsSTK.AddNew mVrbStkCode
        mVrbStkICodeIs = clsSTK.mStkICode_lng
        
        Rem receipt stock
        clsSTK.mStkSno_int = 0
        clsSTK.mStkQty_dbl = ToRcptQty(mVrbFinOutQty)
        
        clsSTK.AddNew mVrbStkCode, mNewItemRef:=True
        mVrbStkICodeRc = clsSTK.mStkICode_lng
        mStkItmRefCode = clsSTK.mStkItmRefCode_lng
        
        Rem StockJrn Common entry
        clsSTK.mStkSno_int = -1
        clsSTK.mStkItmCode_lng = 0
        clsSTK.mStkItmRefCode_lng = 0
        clsSTK.mStkQty_dbl = 0
        clsSTK.mStkNarr_str = "Vendor Receipt from Forging Entry"
        clsSTK.AddNew mVrbStkCode
    Else
        Rem issue stock
        clsSTK.GetData mVrbStkCode, mVrbStkICodeIs
        clsSTK.mStkDate_dt = Ctod(dtpVrbDate.Text)
        clsSTK.mStkItmCode_lng = Val(fcmbItmName.BoundText)
        clsSTK.mStkItmRefCode_lng = 0
        clsSTK.mStkQty_dbl = ToIssueQty(mConsQty)
        clsSTK.mStkRate_dbl = 0
        clsSTK.mStkValue_dbl = 0
        clsSTK.mStkNarr_str = ""
        clsSTK.Update mVrbStkCode, mVrbStkICodeIs
        
        Rem receipt stock
        clsSTK.GetData mVrbStkCode, mVrbStkICodeRc
        clsSTK.mStkDate_dt = Ctod(dtpVrbDate.Text)
        clsSTK.mStkItmCode_lng = Val(fcmbItmName.BoundText)
        Rem clsSTK.mStkItmRefCode_lng = 0
        clsSTK.mStkQty_dbl = ToRcptQty(mVrbFinOutQty)    ' rejoutqty is to be considered ???
        clsSTK.mStkRate_dbl = 0
        clsSTK.mStkValue_dbl = 0
        clsSTK.mStkNarr_str = ""
        If mVrbItmCode_old <> clsSTK.mStkItmCode_lng Or clsSTK.mStkItmRefCode_lng = 0 Then
            clsSTK.Update mVrbStkCode, mVrbStkICodeRc, mNewItemRef:=True
        Else
            clsSTK.Update mVrbStkCode, mVrbStkICodeRc
        End If
        mStkItmRefCode = clsSTK.mStkItmRefCode_lng
        
        Rem StockJrn common entry
        clsSTK.GetData mVrbStkCode, 0, -1
        clsSTK.mStkDate_dt = Ctod(dtpVrbDate.Text)
        clsSTK.mStkItmCode_lng = 0
        clsSTK.mStkItmRefCode_lng = 0
        clsSTK.mStkQty_dbl = 0
        clsSTK.mStkRate_dbl = 0
        clsSTK.mStkValue_dbl = 0
        clsSTK.mStkNarr_str = "Vendor Receipt from Forging Entry"
        
        clsSTK.Update mVrbStkCode, clsSTK.mStkICode_lng
    End If
    
    Rem update stock ----------------------------------------
    Rem Receipt updation
    dbTlgDatabase.BeginTrans
    VRBRecset.Open "Select * from VendRcBod where VrbCode=" & CStr(mVrbCode) & " order by VrbICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    With VRBRecset
    If .RecordCount > 0 Then
        .MoveFirst
        Do While .EOF = False
            If InList(.Fields("VrbRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
                If dtlAddMode = True Then
                    .Fields("VrbStkCode") = mVrbStkCode
                    .Fields("VrbStkICodeIs") = mVrbStkICodeIs
                    .Fields("VrbStkICodeRc") = mVrbStkICodeRc
                    .Fields("VrbItmRefCode") = mStkItmRefCode
                Else
                    .Fields("VrbItmRefCode") = mStkItmRefCode
                End If
                .Fields("VrbRecState") = cREC_UNCHANGED
                .Update
            Else
                .Fields("VrbRecState") = ChkDeleteRecStatus(.Fields("VrbRecState"))
                .Update
                .Delete
            End If
            
            .MoveNext
        Loop
    End If
    End With
    dbTlgDatabase.CommitTrans
    CloseTable VRBRecset
    
    Rem StockJrn updation
    clsSTK.CommitStock mVrbStkCode
    
    Rem EndStock routine ----------------------------------
    Rem Receipt
    Data_RemoveLog mVrbCode
    
    Rem StockJrn
    clsSTK.EndStock mVrbStkCode
    
    Rem show record in flexgrid
    VRBRecset.Open "Select * from VendRcBod where VrbCode=" & CStr(mVrbCode) & " and VrbICode=" & CStr(mVrbICode) & "", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    With VRBRecset
    clsVND.GetData .Fields("VrbVndCode")
    clsITM.GetData .Fields("VrbItmCode")
    clsMPR.GetData .Fields("VrbMprCode")
    
    Mfgrd2.TextMatrix(srow, X2VRBICODE_COL) = .Fields("VrbICode")
    Mfgrd2.TextMatrix(srow, X2VRBDATE_COL) = Dtoc(.Fields("VrbDate"))
    Mfgrd2.TextMatrix(srow, X2VNDNAME_COL) = clsVND.mAhName_str
    Mfgrd2.TextMatrix(srow, X2ITMNAME_COL) = clsITM.mItmName_str
    Mfgrd2.TextMatrix(srow, X2MPRNAME_COL) = clsMPR.mName_str
    Mfgrd2.TextMatrix(srow, X2VRBFINOUTQTY_COL) = ToMyNumFmt(.Fields("VrbFinOutQty"), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2VRBREJOUTQTY_COL) = ToMyNumFmt(.Fields("VrbRejOutQty"), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2VRBCODE_COL) = .Fields("VrbCode")
    Mfgrd2.TextMatrix(srow, X2VRBSNO_COL) = .Fields("VrbSno")
    Mfgrd2.TextMatrix(srow, X2VRBVNDCODE_COL) = .Fields("VrbVndCode")
    Mfgrd2.TextMatrix(srow, X2VRBITMCODE_COL) = .Fields("VrbItmCode")
    Mfgrd2.TextMatrix(srow, X2VRBMPRCODE_COL) = .Fields("VrbMprCode")
    Mfgrd2.TextMatrix(srow, X2VRBSTKCODE_COL) = .Fields("VrbStkCode")
    Mfgrd2.TextMatrix(srow, X2VRBSTKICODEIS_COL) = .Fields("VrbStkICodeIs")
    Mfgrd2.TextMatrix(srow, X2VRBSTKICODERC_COL) = .Fields("VrbStkICodeRc")
    Mfgrd2.TextMatrix(srow, X2VRBRECSTATE_COL) = .Fields("VrbRecState")
    
    End With
    CloseTable VRBRecset
    
    If dtlAddMode = True Then
        Mfgrd2.Rows = Mfgrd2.Rows + 1
    End If
    srow = srow + 1
    Mfgrd2.Row = srow
Else
    Rem cance event -----------------------------------
    Rem Receipt
    VRBRecset.Open "Select * from VendRcBod where VrbCode=" & CStr(mVrbCode) & " order by VrbICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    VRB_LogRS.Open "Select * from VendRcBod_Log where VrbCode=" & CStr(mVrbCode) & " order by VrbICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    
    dbTlgDatabase.BeginTrans
    With VRBRecset
    If .RecordCount > 0 Then
        .MoveFirst
        Do While .EOF = False
            Rem stock updation is not required because balance is updated on CommitStock and not on individual item save, hence no need to revert is back
            VRB_LogRS.Find "VrbICode=" & CStr(.Fields("VrbICode")), Start:=1
            If VRB_LogRS.EOF = False Then
                ' any prior updations can be made here
                .Fields("VrbSno") = VRB_LogRS.Fields("VrbSno")
                .Fields("VrbDate") = VRB_LogRS.Fields("VrbDate")
                .Fields("VrbVndCode") = VRB_LogRS.Fields("VrbVndCode")
                .Fields("VrbItmCode") = VRB_LogRS.Fields("VrbItmCode")
                .Fields("VrbItmRefCode") = VRB_LogRS.Fields("VrbItmRefCode")
                .Fields("VrbMprCode") = VRB_LogRS.Fields("VrbMprCode")
                .Fields("VrbFinOutQty") = VRB_LogRS.Fields("VrbFinOutQty")
                .Fields("VrbRejOutQty") = VRB_LogRS.Fields("VrbRejOutQty")
                .Fields("VrbConsQty") = VRB_LogRS.Fields("VrbConsQty")
                .Fields("VrbNarr") = VRB_LogRS.Fields("VrbNarr")
                .Fields("VrbRecState") = VRB_LogRS.Fields("VrbRecState")
                .Update
            Else
                ' any prior updations can be made here
                .Fields("VrbRecState") = ChkDeleteRecStatus(.Fields("VrbRecState"))
                .Update
                .Delete
            End If
            
            .MoveNext
        Loop
    End If
    End With
    dbTlgDatabase.CommitTrans
    CloseTable VRBRecset
    CloseTable VRB_LogRS
    
    Rem StockJrn
    clsSTK.CancelStock mVrbStkCode
    
    Rem EndStock --------------------------------------------------
    Rem Receipt
    Data_RemoveLog mVrbCode
    
    Rem StockJrn
    clsSTK.EndStock mVrbStkCode
    
End If
dtlAddEditMode = False
dtlAddMode = False
dtlEditCanceled = False
VisibleControls False
Call RefreshBalQty
Mfgrd2.SetFocus
GoTo EndSub
Exit Sub

EndSub:
Set VRBRecset = Nothing
Set VRB_LogRS = Nothing

End Sub

Private Sub cmdShowDtlData_Click()
Dim tRecset As New ADODB.Recordset, srow As Long, cnt As Integer
srow = 1

fcmbVndName.Text = txtVndName1.Text: txtVndName1.Text = fcmbVndName.Text
fcmbItmName.Text = txtItmName1.Text: txtItmName1.Text = fcmbItmName.Text
fcmbMprName.Text = txtMprName1.Text: txtMprName1.Text = fcmbMprName.Text

tRecset.Open "Select * from VendRcBod" _
    & " where VrbDate between #" & CStr(ToSysDate(Ctod(dtpVrbDate1.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpVrbDate2.Text))) & "#" _
    & IIf(Val(fcmbVndName.BoundText) > 0, " and VrbVndCode=" & CStr(Val(fcmbVndName.BoundText)), "") _
    & IIf(Val(fcmbItmName.BoundText) > 0, " and VrbItmCode=" & CStr(Val(fcmbItmName.BoundText)), "") _
    & IIf(Val(fcmbMprName.BoundText) > 0, " and VrbMprCode=" & CStr(Val(fcmbMprName.BoundText)), "") _
    & " order by VrbDate,VrbICode" _
    , dbTlgDatabase, adOpenKeyset, adLockOptimistic
With tRecset
If .RecordCount > 0 Then
    Do While .EOF = False
        clsVND.GetData .Fields("VrbVndCode")
        clsITM.GetData .Fields("VrbItmCode")
        clsMPR.GetData .Fields("VrbMprCode")
        
        Mfgrd2.TextMatrix(srow, X2VRBICODE_COL) = .Fields("VrbICode")
        Mfgrd2.TextMatrix(srow, X2VRBDATE_COL) = Dtoc(.Fields("VrbDate"))
        Mfgrd2.TextMatrix(srow, X2VNDNAME_COL) = clsVND.mAhName_str
        Mfgrd2.TextMatrix(srow, X2ITMNAME_COL) = clsITM.mItmName_str
        Mfgrd2.TextMatrix(srow, X2MPRNAME_COL) = clsMPR.mName_str
        Mfgrd2.TextMatrix(srow, X2VRBFINOUTQTY_COL) = ToMyNumFmt(.Fields("VrbFinOutQty"), mDecimals:=0)
        Mfgrd2.TextMatrix(srow, X2VRBREJOUTQTY_COL) = ToMyNumFmt(.Fields("VrbRejOutQty"), mDecimals:=0)
        Mfgrd2.TextMatrix(srow, X2VRBCODE_COL) = .Fields("VrbCode")
        Mfgrd2.TextMatrix(srow, X2VRBSNO_COL) = .Fields("VrbSno")
        Mfgrd2.TextMatrix(srow, X2VRBVNDCODE_COL) = .Fields("VrbVndCode")
        Mfgrd2.TextMatrix(srow, X2VRBITMCODE_COL) = .Fields("VrbItmCode")
        Mfgrd2.TextMatrix(srow, X2VRBMPRCODE_COL) = .Fields("VrbMprCode")
        Mfgrd2.TextMatrix(srow, X2VRBSTKCODE_COL) = .Fields("VrbStkCode")
        Mfgrd2.TextMatrix(srow, X2VRBSTKICODEIS_COL) = .Fields("VrbStkICodeIs")
        Mfgrd2.TextMatrix(srow, X2VRBSTKICODERC_COL) = .Fields("VrbStkICodeRc")
        Mfgrd2.TextMatrix(srow, X2VRBRECSTATE_COL) = .Fields("VrbRecState")
        Rem calculate balance quantity for Receipt
        Mfgrd2.TextMatrix(srow, X2BALQTYFORRCPT_COL) = GetBalQtyForRcpt(mAddEditMode:=False, srow:=srow)
        Mfgrd2.TextMatrix(srow, X2BALQTYFORMACH_COL) = GetBalQtyForMach(mAddEditMode:=False, srow:=srow)
        
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

Private Sub dtpVrbDate_GotFocus()
FlashActiveControl dtpVrbDate, True
End Sub

Private Sub dtpVrbDate_LostFocus()
FlashActiveControl dtpVrbDate, False
End Sub

Private Sub dtpVrbDate_Validate(Cancel As Boolean)
dtpVrbDate.Text = ToMyDate(dtpVrbDate.Text)
If IsFinYrDate(Ctod(dtpVrbDate.Text)) = False Then
    ErrorBox "Invalid Date !!!"
    dtpVrbDate.SetFocus
    FlashActiveControl dtpVrbDate, True
    Cancel = True
End If
Call ValidDtl

End Sub

Private Sub dtpVrbDate1_GotFocus()
FlashActiveControl dtpVrbDate1, True
End Sub

Private Sub dtpVrbDate1_LostFocus()
FlashActiveControl dtpVrbDate1, False

End Sub

Private Sub dtpVrbDate1_Validate(Cancel As Boolean)
dtpVrbDate1.Text = ToMyDate(dtpVrbDate1.Text)
If IsFinYrDate(Ctod(dtpVrbDate1.Text)) = False Then
    ErrorBox "Invalid Date !!!"
    dtpVrbDate1.SetFocus
    FlashActiveControl dtpVrbDate1, True
    Cancel = True
Else
    dtpVrbDate2.Text = dtpVrbDate1.Text
End If

End Sub

Private Sub dtpVrbDate2_GotFocus()
FlashActiveControl dtpVrbDate2, True
End Sub

Private Sub dtpVrbDate2_LostFocus()
FlashActiveControl dtpVrbDate2, False
End Sub

Private Sub dtpVrbDate2_Validate(Cancel As Boolean)
dtpVrbDate2.Text = ToMyDate(dtpVrbDate2.Text)
If IsFinYrDate(Ctod(dtpVrbDate2.Text)) = False Then
    ErrorBox "Invalid Date !!!"
    dtpVrbDate2.SetFocus
    FlashActiveControl dtpVrbDate2, True
    Cancel = True
Else
    If Ctod(dtpVrbDate1.Text) > Ctod(dtpVrbDate2.Text) Then
        dtpVrbDate1.Text = dtpVrbDate2.Text
    End If
End If

End Sub

Private Sub Form_Activate()
If mFormLoaded = False Then
    dtpVrbDate1.Text = Dtoc(DefaultEntryDate)
    dtpVrbDate2.Text = Dtoc(DefaultEntryDate)
    dtpVrbDate1.SetFocus
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
mskBalQtyForRcpt.Enabled = False
mskBalQtyForMach.Enabled = False

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
colcnt = X2VRBICODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VRBICODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2VRBDATE_COL: Mfgrd2.ColWidth(colcnt) = dtpVrbDate.Width: Mfgrd2.TextMatrix(0, colcnt) = "Date": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VNDNAME_COL: Mfgrd2.ColWidth(colcnt) = txtVndName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Vendor Name": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2ITMNAME_COL: Mfgrd2.ColWidth(colcnt) = txtItmName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Material": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2MPRNAME_COL: Mfgrd2.ColWidth(colcnt) = txtMprName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Process": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VRBFINOUTQTY_COL: Mfgrd2.ColWidth(colcnt) = mskVrbFinOutQty.Width: Mfgrd2.TextMatrix(0, colcnt) = "OK Qty": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2VRBREJOUTQTY_COL: Mfgrd2.ColWidth(colcnt) = mskVrbRejOutQty.Width: Mfgrd2.TextMatrix(0, colcnt) = "Rej.Qty": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BALQTYFORRCPT_COL: Mfgrd2.ColWidth(colcnt) = mskBalQtyForRcpt.Width: Mfgrd2.TextMatrix(0, colcnt) = "Issued Bal.Wt.": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BALQTYFORMACH_COL: Mfgrd2.ColWidth(colcnt) = mskBalQtyForMach.Width: Mfgrd2.TextMatrix(0, colcnt) = "BOD.Bal.": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2VRBCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VRBCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VRBSNO_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VRBSNO_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VRBVNDCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VRBVNDCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VRBITMCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VRBITMCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VRBMPRCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VRBMPRCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VRBSTKCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VRBSTKCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VRBSTKICODEIS_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VRBSTKICODEIS_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VRBSTKICODERC_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VRBSTKICODERC_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VRBRECSTATE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VRBRECSTATE_COL": Mfgrd2.ColAlignment(colcnt) = 1

Rem control positions
colcnt = X2VRBDATE_COL: dtpVrbDate.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2VNDNAME_COL: txtVndName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2ITMNAME_COL: txtItmName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2MPRNAME_COL: txtMprName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2VRBFINOUTQTY_COL: mskVrbFinOutQty.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2VRBREJOUTQTY_COL: mskVrbRejOutQty.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2BALQTYFORRCPT_COL: mskBalQtyForRcpt.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2BALQTYFORMACH_COL: mskBalQtyForMach.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
cmdOK.Left = mskBalQtyForRcpt.Left - cmdOK.Width

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
Dim VRBRecset As New ADODB.Recordset
Dim srow As Long, mDeleteit As Boolean, mVrbStkCode As Long, mVrbCode As Long
If Mfgrd2.Row = FlexNewRow(Mfgrd2) Then
    GoTo EndSub
End If
srow = Mfgrd2.Row
mVrbStkCode = Val(Mfgrd2.TextMatrix(srow, X2VRBSTKCODE_COL))
mVrbCode = Val(Mfgrd2.TextMatrix(srow, X2VRBCODE_COL))

mDeleteit = True

If mDeleteit = True Then
    Rem entry deletion does not affect inheritant but only successors
    Rem mDeleteit = ChkVrbInQty(mAddEditMode:=False)
End If

If mDeleteit = True Then
    mDeleteit = ChkVrbFinOutQty(mAddEditMode:=False)
End If

If mDeleteit = True Then
    mDeleteit = CanDelete()
End If
If mDeleteit = True Then
    Rem begin transaction --------------------------
    Data_CreateLog mVrbCode
    clsSTK.BeginStock mVrbStkCode
    
    Rem delete transaction ------------------------------
    Rem Receipt
    dbTlgDatabase.BeginTrans
    With VRBRecset
    .Open "Select * from VendRcBod where VrbCode=" & CStr(mVrbCode) & " order by VrbICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount > 0 Then
        .MoveFirst
        Do While .EOF = False
            .Fields("VrbRecState") = ChkDeleteRecStatus(.Fields("VrbRecState"))
            .Update
            Rem marked for deletion only, physically deleted in CommitStock
            .MoveNext
        Loop
    End If
    End With
    dbTlgDatabase.CommitTrans
    CloseTable VRBRecset
    
    Rem StockJrn
    clsSTK.DeleteStock mVrbStkCode
    
    Rem update transaction --------------------------------------
    Rem Receipt
    dbTlgDatabase.BeginTrans
    VRBRecset.Open "Select * from VendRcBod where VrbCode=" & CStr(mVrbCode) & " order by VrbICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    With VRBRecset
    If .RecordCount > 0 Then
        .MoveFirst
        Do While .EOF = False
            If InList(.Fields("VrbRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
                .Fields("VrbRecState") = cREC_UNCHANGED
                .Update
            Else
                .Fields("VrbRecState") = ChkDeleteRecStatus(.Fields("VrbRecState"))
                .Update
                .Delete
            End If
            
            .MoveNext
        Loop
    End If
    End With
    dbTlgDatabase.CommitTrans
    CloseTable VRBRecset
    
    Rem StockJrn
    clsSTK.CommitStock mVrbStkCode
    
    Rem end transaction -----------------------------------------
    Data_RemoveLog mVrbCode
    clsSTK.EndStock mVrbStkCode
    
    RemoveFlexRow Mfgrd2, srow
    Call RefreshBalQty
    Mfgrd2.Row = srow
    Mfgrd2.SetFocus
Else
    Mfgrd2.SetFocus
End If

EndSub:
Set VRBRecset = Nothing
Exit Sub

End Sub

Private Sub Mfgrd2_KeyPress(KeyAscii As Integer)
Dim srow As Integer, mVrbStkCode As Long, mVrbCode As Long

If KeyAscii = vbKeyReturn Then
    srow = Mfgrd2.Row
    mVrbStkCode = Val(Mfgrd2.TextMatrix(srow, X2VRBSTKCODE_COL))
    mVrbCode = Val(Mfgrd2.TextMatrix(srow, X2VRBCODE_COL))
    
    dtlAddEditMode = True
    dtlAddMode = (srow = FlexNewRow(Mfgrd2))
    VisibleControls True, Mfgrd2.Top + Mfgrd2.RowPos(srow)
    If dtlAddMode = True Then
        If clsSTK.BeginStock(0) = False Then
            GoTo EndSub
        End If
        mVrbCode = GetNextSeqno(dbTlgDatabase, "VendRcBod", "VrbCode")
        Data_CreateLog mVrbCode
        
        Call ChkDefaultValues
        FormAddEditMode = cFORM_ADDMODE
    Else
        If clsSTK.BeginStock(mVrbStkCode) = False Then
            GoTo EndSub
        End If
        Data_CreateLog mVrbCode
        
        dtpVrbDate.Text = Mfgrd2.TextMatrix(srow, X2VRBDATE_COL)
        fcmbVndName.BoundText = Mfgrd2.TextMatrix(srow, X2VRBVNDCODE_COL): txtVndName.Text = fcmbVndName.Text
        fcmbItmName.BoundText = Mfgrd2.TextMatrix(srow, X2VRBITMCODE_COL): txtItmName.Text = fcmbItmName.Text
        fcmbMprName.BoundText = Mfgrd2.TextMatrix(srow, X2VRBMPRCODE_COL): txtMprName.Text = fcmbMprName.Text
        mskVrbFinOutQty.Text = Trim(Mfgrd2.TextMatrix(srow, X2VRBFINOUTQTY_COL))
        mskVrbRejOutQty.Text = Trim(Mfgrd2.TextMatrix(srow, X2VRBREJOUTQTY_COL))
        mskBalQtyForRcpt.Text = Trim(Mfgrd2.TextMatrix(srow, X2BALQTYFORRCPT_COL))
        mskBalQtyForMach.Text = Trim(Mfgrd2.TextMatrix(srow, X2BALQTYFORMACH_COL))
        
        FormAddEditMode = cFORM_EDITMODE
    End If
    Mfgrd2.Col = FlexLeftVisibleCol(Mfgrd2)
    Mfgrd2.LeftCol = Mfgrd2.Col
    
    mVrbDate_old = Ctod(dtpVrbDate.Text)
    mVrbItmCode_old = Val(fcmbItmName.BoundText)
    mVrbVndCode_old = Val(fcmbVndName.BoundText)
    mVrbMprCode_old = Val(fcmbMprName.BoundText)
    mVrbConsQty_old = CurVrbConsQty(mskVrbFinOutQty)
    mVrbFinOutQty_old = Val(UnMyNumFmt(mskVrbFinOutQty.Text))
    
    dtpVrbDate.SetFocus
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
    dtpVrbDate.Top = mRowPos
    txtVndName.Top = mRowPos
    txtItmName.Top = mRowPos
    txtMprName.Top = mRowPos
    mskVrbFinOutQty.Top = mRowPos
    mskVrbRejOutQty.Top = mRowPos
    mskBalQtyForRcpt.Top = mRowPos
    mskBalQtyForMach.Top = mRowPos
    cmdOK.Top = mRowPos + Mfgrd2.RowHeight(Mfgrd2.Row)
End If

dtpVrbDate.Text = Dtoc(DefaultEntryDate)
txtVndName.Text = "": fcmbVndName.BoundText = ""
txtItmName.Text = "": fcmbItmName.BoundText = ""
txtMprName.Text = "": fcmbMprName.BoundText = ""
mskVrbFinOutQty.Text = ToMyNumFmt(0, mDecimals:=0)
mskVrbRejOutQty.Text = ToMyNumFmt(0, mDecimals:=0)
mskBalQtyForRcpt.Text = ToMyNumFmt(0, mDecimals:=0)
mskBalQtyForMach.Text = ToMyNumFmt(0, mDecimals:=0)

Call ValidDtl

dtpVrbDate.Visible = mShowItem
txtVndName.Visible = mShowItem
txtItmName.Visible = mShowItem
txtMprName.Visible = mShowItem
mskVrbFinOutQty.Visible = mShowItem
mskVrbRejOutQty.Visible = mShowItem
mskBalQtyForRcpt.Visible = mShowItem
mskBalQtyForMach.Visible = mShowItem
cmdOK.Visible = mShowItem

Rem list of header and grid controls are common so resetting it to header values after addition/editing ends
If mShowItem = False Then
    fcmbVndName.Text = txtVndName1.Text: txtVndName1.Text = fcmbVndName.Text
    fcmbItmName.Text = txtItmName1.Text: txtItmName1.Text = fcmbItmName.Text
    fcmbMprName.Text = txtMprName1.Text: txtMprName1.Text = fcmbMprName.Text
End If

frHeader.Enabled = (mShowItem = False)
Mfgrd2.Enabled = (mShowItem = False)
If mShowItem = False Then
    FormAddEditMode = cFORM_SMRYMODE
End If

End Sub

Private Sub ValidDtl()
Dim mDataOk As Boolean
mDataOk = (IsFinYrDate(Ctod(dtpVrbDate.Text)) = True And Val(fcmbVndName.BoundText) > 0 And Val(fcmbItmName.BoundText) > 0 And Val(fcmbMprName.BoundText) > 0)
If mDataOk = True And InterActiveChange(cmdOK) = True Then
    mDataOk = (ChkVrbInQty(mAddEditMode:=True) = True)
End If
If mDataOk = True And InterActiveChange(cmdOK) = True And dtlAddMode = False Then
    mDataOk = (ChkVrbFinOutQty(mAddEditMode:=True) = True)
End If
If mDataOk = True Then
    mskBalQtyForRcpt.Text = ToMyNumFmt(GetBalQtyForRcpt(mAddEditMode:=True, srow:=Mfgrd2.Row), mDecimals:=0)
    mskBalQtyForMach.Text = ToMyNumFmt(GetBalQtyForMach(mAddEditMode:=True, srow:=Mfgrd2.Row), mDecimals:=0)
Else
    mskBalQtyForRcpt.Text = ToMyNumFmt(0, mDecimals:=0)
    mskBalQtyForMach.Text = ToMyNumFmt(0, mDecimals:=0)
End If

cmdOK.Caption = IIf(mDataOk = True, "&OK", "&Cancel")
cmdOK.BackColor = IIf(mDataOk = True, &H80FF80, &H8080FF)
End Sub

Private Sub Mfgrd2_RowColChange()
Dim srow As Long
srow = Mfgrd2.Row

End Sub

Private Sub mskVrbRejOutQty_GotFocus()
FlashActiveControl mskVrbRejOutQty, True
End Sub

Private Sub mskVrbRejOutQty_LostFocus()
FlashActiveControl mskVrbRejOutQty, False
End Sub

Private Sub mskVrbRejOutQty_Validate(Cancel As Boolean)
mskVrbRejOutQty.Text = ToMyNumFmt(mskVrbRejOutQty.Text, mDecimals:=0)

If ChkVrbInQty(mAddEditMode:=True) = False Then
    Rem only message because other input qty change might be required
End If

Call ValidDtl
End Sub

Private Sub mskVrbFinOutQty_GotFocus()
FlashActiveControl mskVrbFinOutQty, True
End Sub

Private Sub mskVrbFinOutQty_LostFocus()
FlashActiveControl mskVrbFinOutQty, False
End Sub

Private Sub mskVrbFinOutQty_Validate(Cancel As Boolean)
mskVrbFinOutQty.Text = ToMyNumFmt(mskVrbFinOutQty.Text, mDecimals:=0)
If Val(UnMyNumFmt(mskVrbFinOutQty.Text)) <= 0 Then
    ErrorBox "Invalid Ok Qty !!!"
    mskVrbFinOutQty.SetFocus
    Cancel = True
Else
    
    If ChkVrbInQty(mAddEditMode:=True) = False Then
        Rem only message because other input qty change might be required
    Else
        If dtlAddMode = False Then
            If ChkVrbFinOutQty(mAddEditMode:=True) = False Then
                mskVrbFinOutQty.SetFocus
                Cancel = True
            End If
        End If
    End If
End If
Call ValidDtl

End Sub

Rem finish output receipt should not fall short for already packed material, and that too for upto current date as well for consequetive dates also
Private Function ChkVrbFinOutQty(ByVal mAddEditMode As Boolean) As Boolean
'''Dim tRecset As New ADODB.Recordset, mVrbFinOutQty_sum As Double, mMpkItmQty_sum As Double, mBalQty As Double
'''Dim mMaxChkDate As Date, mLoopVrbDate As Date
'''Dim mVrbDate As Date, mVrbVndCode As Long, mVrbItmCode As Long, mVrbConsQty As Double, mVrbFinOutQty As Double
'''Dim mVrbICode As Long, srow As Long
'''
'''Rem control values will be assigned just below and not anywhere in procedural section
'''srow = Mfgrd2.Row
'''If mAddEditMode = True Then
'''    mVrbDate = Ctod(dtpVrbDate.Text)
'''    mVrbVndCode = Val(fcmbVndName.BoundText)
'''    mVrbItmCode = Val(fcmbItmName.BoundText)
'''    mVrbConsQty = CurVrbConsQty(mskVrbFinOutQty)
'''    mVrbFinOutQty = Val(UnMyNumFmt(mskVrbFinOutQty.Text))
'''Else
'''    Rem value assignment as done for add edit mode (keypress)
'''    mVrbDate = Ctod(Mfgrd2.TextMatrix(srow, X2VRBDATE_COL))
'''    mVrbVndCode = Val(Mfgrd2.TextMatrix(srow, X2VRBVNDCODE_COL))
'''    mVrbItmCode = Val(Mfgrd2.TextMatrix(srow, X2VRBITMCODE_COL))
'''    mVrbConsQty = CurVrbConsQty(Mfgrd2, srow:=srow)
'''    mVrbFinOutQty = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2VRBFINOUTQTY_COL)))
'''
'''    Rem old value assignment as done for add edit mode (keypress)
'''    mVrbDate_old = mVrbDate
'''    mVrbVndCode_old = mVrbVndCode
'''    mVrbItmCode_old = mVrbItmCode
'''    mVrbConsQty_old = mVrbConsQty
'''    mVrbFinOutQty_old = mVrbFinOutQty
'''End If
'''mVrbICode = Val(Mfgrd2.TextMatrix(srow, X2VRBICODE_COL))
'''
'''If mVrbItmCode_old <> mVrbItmCode Then
'''    Rem check stock availability for packing of old item stock by making quantity zero
'''    Rem checking of stock availability for packing of new item is not required because it is an addition to stock for packing
'''
'''    ChkVrbFinOutQty = True
'''    With tRecset
'''    .Open "Select top 1 * from MatPacking order by MpkDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''    If .RecordCount > 0 Then
'''        mMaxChkDate = .Fields("MpkDate")
'''    Else
'''        mMaxChkDate = mVrbDate_old
'''    End If
'''    End With
'''    CloseTable tRecset
'''
'''    mMaxChkDate = IIf(mVrbDate_old > mMaxChkDate, mVrbDate_old, mMaxChkDate)
'''    For mLoopVrbDate = mVrbDate_old To mMaxChkDate
'''        mVrbFinOutQty_sum = 0: mMpkItmQty_sum = 0
'''
'''        tRecset.Open "Select sum(VrbFinOutQty) as VrbFinOutQty_sum from VendRcBod where VrbItmCode=" & CStr(mVrbItmCode_old) & " and VrbDate<=#" & CStr(ToSysDate(mLoopVrbDate)) & "#" & IIf(dtlAddMode = False, " and VrbICode<>" & CStr(mVrbICode), "") & " group by VrbItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''        If tRecset.RecordCount > 0 Then
'''            mVrbFinOutQty_sum = tRecset.Fields("VrbFinOutQty_sum")
'''        End If
'''        CloseTable tRecset
'''
'''        tRecset.Open "Select sum(MpkItmQty) as MpkItmQty_sum from MatPacking where MpkItmCode=" & CStr(mVrbItmCode_old) & " and MpkDate<=#" & CStr(ToSysDate(mLoopVrbDate)) & "#" & " group by MpkItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''        If tRecset.RecordCount > 0 Then
'''            mMpkItmQty_sum = tRecset.Fields("MpkItmQty_sum")
'''        End If
'''        CloseTable tRecset
'''
'''        mBalQty = mVrbFinOutQty_sum - mMpkItmQty_sum
'''
'''        If mBalQty < 0 Then
'''            ErrorBox "Excess Packing Qty over Receipt Qty is " & ToMyNumFmt(mBalQty, mDecimals:=0, mUseAbs:=True) & " on dated " & Dtoc(mLoopVrbDate) & " !!!"
'''            ChkVrbFinOutQty = False
'''            Exit For
'''        End If
'''    Next mLoopVrbDate
'''ElseIf mVrbDate < mVrbDate_old Then
'''    Rem check stock availability for packing from new date to till end packing date
'''
'''    ChkVrbFinOutQty = True
'''    With tRecset
'''    .Open "Select top 1 * from MatPacking order by MpkDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''    If .RecordCount > 0 Then
'''        mMaxChkDate = .Fields("MpkDate")
'''    Else
'''        mMaxChkDate = mVrbDate
'''    End If
'''    End With
'''    CloseTable tRecset
'''
'''    mMaxChkDate = IIf(mVrbDate > mMaxChkDate, mVrbDate, mMaxChkDate)
'''    For mLoopVrbDate = mVrbDate To mMaxChkDate
'''        mVrbFinOutQty_sum = 0: mMpkItmQty_sum = 0
'''
'''        tRecset.Open "Select sum(VrbFinOutQty) as VrbFinOutQty_sum from VendRcBod where VrbItmCode=" & CStr(mVrbItmCode) & " and VrbDate<=#" & CStr(ToSysDate(mLoopVrbDate)) & "#" & IIf(dtlAddMode = False, " and VrbICode<>" & CStr(mVrbICode), "") & " group by VrbItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''        If tRecset.RecordCount > 0 Then
'''            mVrbFinOutQty_sum = tRecset.Fields("VrbFinOutQty_sum")
'''        End If
'''        CloseTable tRecset
'''
'''        tRecset.Open "Select sum(MpkItmQty) as MpkItmQty_sum from MatPacking where MpkItmCode=" & CStr(mVrbItmCode) & " and MpkDate<=#" & CStr(ToSysDate(mLoopVrbDate)) & "#" & " group by MpkItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''        If tRecset.RecordCount > 0 Then
'''            mMpkItmQty_sum = tRecset.Fields("MpkItmQty_sum")
'''        End If
'''        CloseTable tRecset
'''
'''        mBalQty = mVrbFinOutQty_sum - mMpkItmQty_sum + mVrbFinOutQty
'''
'''        If mBalQty < 0 Then
'''            ErrorBox "Excess Packing Qty over Receipt Qty is " & ToMyNumFmt(mBalQty, mDecimals:=0, mUseAbs:=True) & " on dated " & Dtoc(mLoopVrbDate) & " !!!"
'''            ChkVrbFinOutQty = False
'''            Exit For
'''        End If
'''    Next mLoopVrbDate
'''ElseIf mVrbDate > mVrbDate_old Then
'''    Rem check stock availability for packing from old date (back date) to previous date of current date by making receipt as zero
'''    Rem and then check stock availability for packing from new date to till end packing date by using receipt qty
'''
'''    ChkVrbFinOutQty = True
'''    With tRecset
'''    .Open "Select top 1 * from MatPacking order by MpkDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''    If .RecordCount > 0 Then
'''        mMaxChkDate = .Fields("MpkDate")
'''        If mMaxChkDate >= mVrbDate Then
'''            mMaxChkDate = mVrbDate - 1
'''        End If
'''    Else
'''        mMaxChkDate = mVrbDate_old
'''    End If
'''    End With
'''    CloseTable tRecset
'''
'''    mMaxChkDate = IIf(mVrbDate_old > mMaxChkDate, mVrbDate_old, mMaxChkDate)
'''    For mLoopVrbDate = mVrbDate_old To mMaxChkDate
'''        mVrbFinOutQty_sum = 0: mMpkItmQty_sum = 0
'''
'''        tRecset.Open "Select sum(VrbFinOutQty) as VrbFinOutQty_sum from VendRcBod where VrbItmCode=" & CStr(mVrbItmCode) & " and VrbDate<=#" & CStr(ToSysDate(mLoopVrbDate)) & "#" & IIf(dtlAddMode = False, " and VrbICode<>" & CStr(mVrbICode), "") & " group by VrbItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''        If tRecset.RecordCount > 0 Then
'''            mVrbFinOutQty_sum = tRecset.Fields("VrbFinOutQty_sum")
'''        End If
'''        CloseTable tRecset
'''
'''        tRecset.Open "Select sum(MpkItmQty) as MpkItmQty_sum from MatPacking where MpkItmCode=" & CStr(mVrbItmCode) & " and MpkDate<=#" & CStr(ToSysDate(mLoopVrbDate)) & "#" & " group by MpkItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''        If tRecset.RecordCount > 0 Then
'''            mMpkItmQty_sum = tRecset.Fields("MpkItmQty_sum")
'''        End If
'''        CloseTable tRecset
'''
'''        mBalQty = mVrbFinOutQty_sum - mMpkItmQty_sum
'''
'''        If mBalQty < 0 Then
'''            ErrorBox "Excess Packing Qty over Receipt Qty is " & ToMyNumFmt(mBalQty, mDecimals:=0, mUseAbs:=True) & " on dated " & Dtoc(mLoopVrbDate) & " !!!"
'''            ChkVrbFinOutQty = False
'''            Exit For
'''        End If
'''    Next mLoopVrbDate
'''
'''    If ChkVrbFinOutQty = True Then
'''        With tRecset
'''        .Open "Select top 1 * from MatPacking order by MpkDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''        If .RecordCount > 0 Then
'''            mMaxChkDate = .Fields("MpkDate")
'''        Else
'''            mMaxChkDate = mVrbDate
'''        End If
'''        End With
'''        CloseTable tRecset
'''
'''        mMaxChkDate = IIf(mVrbDate > mMaxChkDate, mVrbDate, mMaxChkDate)
'''        For mLoopVrbDate = mVrbDate To mMaxChkDate
'''            mVrbFinOutQty_sum = 0: mMpkItmQty_sum = 0
'''
'''            tRecset.Open "Select sum(VrbFinOutQty) as VrbFinOutQty_sum from VendRcBod where VrbItmCode=" & CStr(mVrbItmCode) & " and VrbDate<=#" & CStr(ToSysDate(mLoopVrbDate)) & "#" & IIf(dtlAddMode = False, " and VrbICode<>" & CStr(mVrbICode), "") & " group by VrbItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''            If tRecset.RecordCount > 0 Then
'''                mVrbFinOutQty_sum = tRecset.Fields("VrbFinOutQty_sum")
'''            End If
'''            CloseTable tRecset
'''
'''            tRecset.Open "Select sum(MpkItmQty) as MpkItmQty_sum from MatPacking where MpkItmCode=" & CStr(mVrbItmCode) & " and MpkDate<=#" & CStr(ToSysDate(mLoopVrbDate)) & "#" & " group by MpkItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''            If tRecset.RecordCount > 0 Then
'''                mMpkItmQty_sum = tRecset.Fields("MpkItmQty_sum")
'''            End If
'''            CloseTable tRecset
'''
'''            mBalQty = mVrbFinOutQty_sum - mMpkItmQty_sum + mVrbFinOutQty
'''
'''            If mBalQty < 0 Then
'''                ErrorBox "Excess Packing Qty over Receipt Qty is " & ToMyNumFmt(mBalQty, mDecimals:=0, mUseAbs:=True) & " on dated " & Dtoc(mLoopVrbDate) & " !!!"
'''                ChkVrbFinOutQty = False
'''                Exit For
'''            End If
'''        Next mLoopVrbDate
'''    End If
'''Else
'''    Rem check stock availability for packing for current date to end packing date
'''    ChkVrbFinOutQty = True
'''    With tRecset
'''    .Open "Select top 1 * from MatPacking order by MpkDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''    If .RecordCount > 0 Then
'''        mMaxChkDate = .Fields("MpkDate")
'''    Else
'''        mMaxChkDate = mVrbDate
'''    End If
'''    End With
'''    CloseTable tRecset
'''
'''    mMaxChkDate = IIf(mVrbDate > mMaxChkDate, mVrbDate, mMaxChkDate)
'''    For mLoopVrbDate = mVrbDate To mMaxChkDate
'''        mVrbFinOutQty_sum = 0: mMpkItmQty_sum = 0
'''
'''        tRecset.Open "Select sum(VrbFinOutQty) as VrbFinOutQty_sum from VendRcBod where VrbItmCode=" & CStr(mVrbItmCode) & " and VrbDate<=#" & CStr(ToSysDate(mLoopVrbDate)) & "#" & IIf(dtlAddMode = False, " and VrbICode<>" & CStr(mVrbICode), "") & " group by VrbItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''        If tRecset.RecordCount > 0 Then
'''            mVrbFinOutQty_sum = tRecset.Fields("VrbFinOutQty_sum")
'''        End If
'''        CloseTable tRecset
'''
'''        tRecset.Open "Select sum(MpkItmQty) as MpkItmQty_sum from MatPacking where MpkItmCode=" & CStr(mVrbItmCode) & " and MpkDate<=#" & CStr(ToSysDate(mLoopVrbDate)) & "#" & " group by MpkItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
'''        If tRecset.RecordCount > 0 Then
'''            mMpkItmQty_sum = tRecset.Fields("MpkItmQty_sum")
'''        End If
'''        CloseTable tRecset
'''
'''        mBalQty = mVrbFinOutQty_sum - mMpkItmQty_sum + IIf(mAddEditMode = True, mVrbFinOutQty, 0)
'''
'''        If mBalQty < 0 Then
'''            ErrorBox "Excess Packing Qty over Receipt Qty is " & ToMyNumFmt(mBalQty, mDecimals:=0, mUseAbs:=True) & " on dated " & Dtoc(mLoopVrbDate) & " !!!"
'''            ChkVrbFinOutQty = False
'''            Exit For
'''        End If
'''    Next mLoopVrbDate
'''
'''End If

ChkVrbFinOutQty = True

End Function

Private Function GetBalQtyForMach(ByVal mAddEditMode As Boolean, ByVal srow As Long) As Double
Dim tRecset As New ADODB.Recordset, mVrbFinOutQty_sum As Double, mMpkItmQty_sum As Double, mBalQty As Double
Dim mVrbDate As Date, mVrbVndCode As Long, mVrbItmCode As Long, mVrbConsQty As Double, mVrbFinOutQty As Double
Dim mVrbICode As Long

Rem control values will be assigned just below and not anywhere in procedural section
If mAddEditMode = True Then
    mVrbDate = Ctod(dtpVrbDate.Text)
    mVrbVndCode = Val(fcmbVndName.BoundText)
    mVrbItmCode = Val(fcmbItmName.BoundText)
    mVrbConsQty = CurVrbConsQty(mskVrbFinOutQty)
    mVrbFinOutQty = Val(UnMyNumFmt(mskVrbFinOutQty.Text))
Else
    mVrbDate = Ctod(Mfgrd2.TextMatrix(srow, X2VRBDATE_COL))
    mVrbVndCode = Val(Mfgrd2.TextMatrix(srow, X2VRBVNDCODE_COL))
    mVrbItmCode = Val(Mfgrd2.TextMatrix(srow, X2VRBITMCODE_COL))
    mVrbConsQty = CurVrbConsQty(Mfgrd2, srow)
    mVrbFinOutQty = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2VRBFINOUTQTY_COL)))
End If
mVrbICode = Val(Mfgrd2.TextMatrix(srow, X2VRBICODE_COL))

Rem check stock availability for packing for current date to end packing date
    
mVrbFinOutQty_sum = 0: mMpkItmQty_sum = 0

tRecset.Open "Select sum(VrbFinOutQty) as VrbFinOutQty_sum from VendRcBod where VrbItmCode=" & CStr(mVrbItmCode) & " and VrbDate<=#" & CStr(ToSysDate(mVrbDate)) & "#" & IIf(dtlAddMode = False, " and VrbICode<>" & CStr(mVrbICode), "") & " group by VrbItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
If tRecset.RecordCount > 0 Then
    mVrbFinOutQty_sum = tRecset.Fields("VrbFinOutQty_sum")
End If
CloseTable tRecset

tRecset.Open "Select sum(MpkItmQty) as MpkItmQty_sum from MatPacking where MpkItmCode=" & CStr(mVrbItmCode) & " and MpkDate<=#" & CStr(ToSysDate(mVrbDate)) & "#" & " group by MpkItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
If tRecset.RecordCount > 0 Then
    mMpkItmQty_sum = tRecset.Fields("MpkItmQty_sum")
End If
CloseTable tRecset

mBalQty = mVrbFinOutQty_sum - mMpkItmQty_sum + mVrbFinOutQty
      
GetBalQtyForMach = mBalQty

End Function

Rem receipt can not be greater than material issued quantity
Private Function ChkVrbInQty(ByVal mAddEditMode As Boolean) As Boolean
Dim tRecset As New ADODB.Recordset, mVibQty_sum As Double, mVrbConsQty_sum As Double, mBalQty As Double
Dim mMaxChkDate As Date, mLoopVrbDate As Date
Dim mVrbDate As Date, mVrbVndCode As Long, mVrbItmCode As Long, mVrbConsQty As Double, mVrbFinOutQty As Double
Dim mVrbICode As Long, srow As Long

Rem control values will be assigned just below and not anywhere in procedural section
srow = Mfgrd2.Row
If mAddEditMode = True Then
    mVrbDate = Ctod(dtpVrbDate.Text)
    mVrbVndCode = Val(fcmbVndName.BoundText)
    mVrbItmCode = Val(fcmbItmName.BoundText)
    mVrbConsQty = CurVrbConsQty(mskVrbFinOutQty)
    mVrbFinOutQty = Val(UnMyNumFmt(mskVrbFinOutQty.Text))
Else
    Rem value assignment as done for add edit mode (keypress)
    mVrbDate = Ctod(Mfgrd2.TextMatrix(srow, X2VRBDATE_COL))
    mVrbVndCode = Val(Mfgrd2.TextMatrix(srow, X2VRBVNDCODE_COL))
    mVrbItmCode = Val(Mfgrd2.TextMatrix(srow, X2VRBITMCODE_COL))
    mVrbConsQty = CurVrbConsQty(Mfgrd2, srow:=srow)
    mVrbFinOutQty = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2VRBFINOUTQTY_COL)))
    
    Rem old value assignment as done for add edit mode (keypress)
    mVrbDate_old = mVrbDate
    mVrbVndCode_old = mVrbVndCode
    mVrbItmCode_old = mVrbItmCode
    mVrbConsQty_old = mVrbConsQty
    mVrbFinOutQty_old = mVrbFinOutQty
End If
mVrbICode = Val(Mfgrd2.TextMatrix(srow, X2VRBICODE_COL))
    
Rem assume that old entry has been deleted by ignoring existing entry and then check normally stock availability for receipt from current date to end receipt date
ChkVrbInQty = True
With tRecset
.Open "Select top 1 * from VendRcBod order by VrbDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    mMaxChkDate = .Fields("VrbDate")
Else
    mMaxChkDate = mVrbDate
End If
End With
CloseTable tRecset

mMaxChkDate = IIf(mVrbDate > mMaxChkDate, mVrbDate, mMaxChkDate)
For mLoopVrbDate = mVrbDate To mMaxChkDate
    mVibQty_sum = 0: mVrbConsQty_sum = 0
    
    tRecset.Open "Select sum(VibQty) as VibQty_sum from VendIsBod where VibVndCode=" & CStr(mVrbVndCode) & " and VibItmCode=" & CStr(mVrbItmCode) & " and VibDate<=#" & CStr(ToSysDate(mLoopVrbDate)) & "#" & " group by VibVndCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.RecordCount > 0 Then
        mVibQty_sum = tRecset.Fields("VibQty_sum")
    End If
    CloseTable tRecset
    
    tRecset.Open "Select sum(VrbConsQty) as VrbConsQty_sum from VendRcBod where VrbVndCode=" & CStr(mVrbVndCode) & " and VrbItmCode=" & CStr(mVrbItmCode) & " and VrbDate<=#" & CStr(ToSysDate(mLoopVrbDate)) & "#" & IIf(dtlAddMode = False, " and VrbICode<>" & CStr(mVrbICode), "") & " group by VrbVndCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.RecordCount > 0 Then
        mVrbConsQty_sum = tRecset.Fields("VrbConsQty_sum")
    End If
    CloseTable tRecset
    
    mBalQty = mVibQty_sum - mVrbConsQty_sum - mVrbConsQty
    
    If mBalQty < 0 Then
        ErrorBox "Excess Receipt Qty over Material Issued to Vendor is " & ToMyNumFmt(mBalQty, mDecimals:=0, mUseAbs:=True) & " on dated " & Dtoc(mLoopVrbDate) & " !!!"
        ChkVrbInQty = False
        Exit For
    End If
Next mLoopVrbDate

End Function

Private Function GetBalQtyForRcpt(ByVal mAddEditMode As Boolean, ByVal srow As Long) As Double
Dim tRecset As New ADODB.Recordset, mVibQty_sum As Double, mVrbConsQty_sum As Double, mBalQty As Double
Dim mVrbDate As Date, mVrbVndCode As Long, mVrbItmCode As Long, mVrbConsQty As Double, mVrbFinOutQty As Double
Dim mVrbICode As Long

Rem control values will be assigned just below and not anywhere in procedural section
If mAddEditMode = True Then
    mVrbDate = Ctod(dtpVrbDate.Text)
    mVrbVndCode = Val(fcmbVndName.BoundText)
    mVrbItmCode = Val(fcmbItmName.BoundText)
    mVrbConsQty = CurVrbConsQty(mskVrbFinOutQty)
    mVrbFinOutQty = Val(UnMyNumFmt(mskVrbFinOutQty.Text))
Else
    Rem value assignment as done for add edit mode (keypress)
    mVrbDate = Ctod(Mfgrd2.TextMatrix(srow, X2VRBDATE_COL))
    mVrbVndCode = Val(Mfgrd2.TextMatrix(srow, X2VRBVNDCODE_COL))
    mVrbItmCode = Val(Mfgrd2.TextMatrix(srow, X2VRBITMCODE_COL))
    mVrbConsQty = CurVrbConsQty(Mfgrd2, srow:=srow)
    mVrbFinOutQty = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2VRBFINOUTQTY_COL)))
End If
mVrbICode = Val(Mfgrd2.TextMatrix(srow, X2VRBICODE_COL))
    
mVibQty_sum = 0: mVrbConsQty_sum = 0

tRecset.Open "Select sum(VibQty) as VibQty_sum from VendIsBod where VibVndCode=" & CStr(mVrbVndCode) & " and VibItmCode=" & CStr(mVrbItmCode) & " and VibDate<=#" & CStr(ToSysDate(mVrbDate)) & "#" & " group by VibVndCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
If tRecset.RecordCount > 0 Then
    mVibQty_sum = tRecset.Fields("VibQty_sum")
End If
CloseTable tRecset

tRecset.Open "Select sum(VrbConsQty) as VrbConsQty_sum from VendRcBod where VrbVndCode=" & CStr(mVrbVndCode) & " and VrbItmCode=" & CStr(mVrbItmCode) & " and VrbDate<=#" & CStr(ToSysDate(mVrbDate)) & "#" & IIf(dtlAddMode = False, " and VrbICode<>" & CStr(mVrbICode), "") & " group by VrbVndCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
If tRecset.RecordCount > 0 Then
    mVrbConsQty_sum = tRecset.Fields("VrbConsQty_sum")
End If
CloseTable tRecset

mBalQty = mVibQty_sum - mVrbConsQty_sum - mVrbConsQty

GetBalQtyForRcpt = mBalQty

End Function

Private Sub RefreshBalQty()
Dim srow As Integer
For srow = 1 To Mfgrd2.Rows - 2
    Mfgrd2.TextMatrix(srow, X2BALQTYFORRCPT_COL) = ToMyNumFmt(GetBalQtyForRcpt(mAddEditMode:=False, srow:=srow), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2BALQTYFORMACH_COL) = ToMyNumFmt(GetBalQtyForMach(mAddEditMode:=False, srow:=srow), mDecimals:=0)
Next srow

End Sub

Rem function to calculate ConsQty when Work in Process is in existence otherwise this will be input qty only
Private Function CurVrbConsQty(ByRef mObj As Object, Optional ByVal srow As Long) As Double
If TypeOf mObj Is ADODB.Recordset Then
    With mObj
    CurVrbConsQty = .Fields("VrbFinOutQty") + .Fields("VrbRejOutQty")
    End With
ElseIf TypeOf mObj Is MSFlexGrid Then
    With mObj
    CurVrbConsQty = Val(UnMyNumFmt(.TextMatrix(srow, X2VRBFINOUTQTY_COL))) + Val(UnMyNumFmt(.TextMatrix(srow, X2VRBREJOUTQTY_COL)))
    End With
ElseIf TypeOf mObj Is TextBox Then
    CurVrbConsQty = Val(UnMyNumFmt(mskVrbFinOutQty.Text)) + Val(UnMyNumFmt(mskVrbRejOutQty.Text))
Else
    ErrorBox Me.Name & "_CurVrbConsQty_1011"
End If

End Function

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
    dtpVrbDate.Text = Mfgrd2.TextMatrix(srow, X2VRBDATE_COL)
    fcmbVndName.BoundText = Mfgrd2.TextMatrix(srow, X2VRBVNDCODE_COL): txtVndName.Text = fcmbVndName.Text
    fcmbItmName.BoundText = Mfgrd2.TextMatrix(srow, X2VRBITMCODE_COL): txtItmName.Text = fcmbItmName.Text
    fcmbMprName.BoundText = Mfgrd2.TextMatrix(srow, X2VRBMPRCODE_COL): txtMprName.Text = fcmbMprName.Text
Else
    dtpVrbDate.Text = dtpVrbDate1.Text
    fcmbVndName.Text = txtVndName1.Text: txtVndName.Text = fcmbVndName.Text
    fcmbItmName.Text = txtItmName1.Text: txtItmName.Text = fcmbItmName.Text
    fcmbMprName.Text = txtMprName1.Text: txtMprName.Text = fcmbMprName.Text
End If
mskVrbFinOutQty.Text = ToMyNumFmt(0, mDecimals:=0)
mskVrbRejOutQty.Text = ToMyNumFmt(0, mDecimals:=0)

End Sub

Private Function Data_CreateLog(ByVal mVrbCode As Long) As Boolean
Dim VRB_LogRS As New ADODB.Recordset
Data_CreateLog = False

VRB_LogRS.Open "Select * from VendRcBod_Log where VrbCode=" & CStr(mVrbCode) & "", dbTlgDatabase, adOpenKeyset, adLockOptimistic
With VRB_LogRS
If .RecordCount = 0 Then
    .Close
    Rem only ok records will be taken in log, because not ok records are created out of crashed entries which must be cleared when entry rejected
    dbTlgDatabase.BeginTrans
    dbTlgDatabase.Execute "Insert into VendRcBod_Log Select * from VendRcBod where VrbCode=" & CStr(mVrbCode) & " and VrbRecState=" & CStr(cREC_UNCHANGED) & ""
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
Set VRB_LogRS = Nothing
Exit Function

End Function

Private Function Data_RemoveLog(ByVal mVrbCode As Long) As Boolean
Data_RemoveLog = False

dbTlgDatabase.BeginTrans
dbTlgDatabase.Execute "Delete from VendRcBod_Log where VrbCode=" & CStr(mVrbCode)
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


