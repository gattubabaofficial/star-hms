VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmVendorIssueForg 
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
      TabIndex        =   21
      Top             =   840
      Width           =   12855
      Begin VB.TextBox dtpVifDate2 
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
         Left            =   5040
         Style           =   1  'Graphical
         TabIndex        =   4
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
         Left            =   1320
         TabIndex        =   3
         Top             =   960
         Width           =   3495
      End
      Begin VB.TextBox dtpVifDate1 
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
         TabIndex        =   25
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
         TabIndex        =   24
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
         Left            =   240
         TabIndex        =   23
         Top             =   960
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
         TabIndex        =   22
         Top             =   240
         Width           =   975
      End
   End
   Begin VB.TextBox txtVoid 
      CausesValidation=   0   'False
      Height          =   375
      Left            =   120
      TabIndex        =   15
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
      TabIndex        =   20
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
      TabIndex        =   19
      TabStop         =   0   'False
      Top             =   0
      UseMaskColor    =   -1  'True
      Width           =   255
   End
   Begin VB.ComboBox cmbFormEntryMode 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   315
      ItemData        =   "VendIFrg.frx":0000
      Left            =   0
      List            =   "VendIFrg.frx":000D
      Style           =   1  'Simple Combo
      TabIndex        =   18
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
      TabIndex        =   17
      Top             =   2280
      Width           =   12855
      Begin VB.TextBox mskVifNos 
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
         Left            =   9960
         TabIndex        =   11
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
         Left            =   8160
         TabIndex        =   26
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
            TabIndex        =   13
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
            TabIndex        =   12
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
            TabIndex        =   28
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
            TabIndex        =   27
            Top             =   120
            Width           =   855
         End
      End
      Begin VB.TextBox mskVifUnitWeight 
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
         Left            =   8880
         TabIndex        =   10
         Tag             =   "AhCode"
         Text            =   "0.000"
         Top             =   1320
         Width           =   1095
      End
      Begin VB.TextBox mskVifWeight 
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
         Left            =   7560
         TabIndex        =   9
         Tag             =   "AhCode"
         Text            =   "0.000"
         Top             =   1320
         Width           =   1335
      End
      Begin VB.TextBox txtItmName 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   4680
         TabIndex        =   8
         Top             =   1320
         Width           =   2895
      End
      Begin VB.TextBox txtVndName 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   1320
         TabIndex        =   7
         Top             =   1320
         Width           =   3375
      End
      Begin VB.TextBox dtpVifDate 
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
         TabIndex        =   6
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
         Left            =   11280
         Style           =   1  'Graphical
         TabIndex        =   14
         Top             =   1320
         Width           =   735
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd2 
         Height          =   4815
         Left            =   120
         TabIndex        =   5
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
      Caption         =   "Vendor Issue for Forging"
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
Attribute VB_Name = "frmVendorIssueForg"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim dbAcDatabase As New ADODB.Connection, dbStDatabase As New ADODB.Connection, dbTlgDatabase As New ADODB.Connection, dbGrpDatabase As New ADODB.Connection, dbComDatabase As New ADODB.Connection
Dim mFormLoaded As Boolean, mLastKeyPressed As Integer
Dim mRemoteAccess As Boolean, mEntrySaved As Boolean, mEntryAborted As Boolean
Dim dtlAddEditMode As Boolean, dtlAddMode As Boolean, dtlEditCanceled As Boolean
Dim clsSTK As clsStockJrn, clsITM As clsProduct, clsVND As clsToolingMasterEntry, mActiveControl As Object
Dim fcmbVndName As frmFlexSearchList, fcmbItmName As frmFlexSearchList
Dim mVifDate_old As Date, mVifVndCode_old As Long, mVifItmCode_old As Long, mVifWeight_old As Double, mVifNos_old As Double

' StockJrn transaction detail grid Mfgrd2 column definitions
Const X2VIFICODE_COL = 0
Const X2VIFDATE_COL = 1
Const X2VNDNAME_COL = 2
Const X2ITMNAME_COL = 3
Const X2VIFWEIGHT_COL = 4
Const X2VIFUNITWEIGHT_COL = 5
Const X2VIFNOS_COL = 6
Const X2BALWEIGHT_COL = 7
Const X2BALNOS_COL = 8
Const X2VIFCODE_COL = 9
Const X2VIFSNO_COL = 10
Const X2VIFVNDCODE_COL = 11
Const X2VIFITMCODE_COL = 12
Const X2VIFSTKCODE_COL = 13
Const X2VIFSTKICODEIS_COL = 14
Const X2VIFSTKICODERC_COL = 15
Const X2VIFRECSTATE_COL = 16
Const MFGRD2_COLS = 17

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
    dtpVifDate1.SetFocus
Else
    Unload Me
End If

End Sub

Private Sub cmdOK_Click()
Dim VIFRecset As New ADODB.Recordset, VIF_LogRS As New ADODB.Recordset
Dim srow As Long, mVifStkCode As Long, mVifStkICodeIs As Long, mVifStkICodeRc As Long, mVifCode As Long, mVifICode As Long, mVifSno As Long, mStkItmRefCode As Long

srow = Mfgrd2.Row
If dtlAddMode = True Then
    mVifCode = GetNextSeqno(dbTlgDatabase, "VendIsFrg", "VifCode")
    mVifStkCode = clsSTK.ActiveStkCode
Else
    mVifCode = Val(Mfgrd2.TextMatrix(srow, X2VIFCODE_COL))
    mVifStkCode = Val(Mfgrd2.TextMatrix(srow, X2VIFSTKCODE_COL))
    mVifICode = Val(Mfgrd2.TextMatrix(srow, X2VIFICODE_COL))
    mVifStkICodeIs = Val(Mfgrd2.TextMatrix(srow, X2VIFSTKICODEIS_COL))
    mVifStkICodeRc = Val(Mfgrd2.TextMatrix(srow, X2VIFSTKICODERC_COL))
End If
If dtlEditCanceled = False And dtlAddMode = False Then
    Call ValidDtl
End If
If cmdOK.Caption = "&OK" And dtlEditCanceled = False Then
    Rem addnew/update -------------------------
    Rem VendIsFrg section
    dbTlgDatabase.BeginTrans
    With VIFRecset
    If dtlAddMode = True Then
        mVifSno = GetNextSeqno(dbTlgDatabase, "VendIsFrg", "VifSno", "VifCode" = CStr(mVifCode))
        
        VIFRecset.Open "Select * from VendIsFrg where VifCode=" & CStr(mVifCode) & "", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        .AddNew
        Rem .Fields("VifICode") = AutoNumber
        .Fields("VifCode") = mVifCode
        .Fields("VifSno") = mVifSno
    Else
        VIFRecset.Open "Select * from VendIsFrg where VifCode=" & CStr(mVifCode) & " and VifICode=" & CStr(mVifICode) & "", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    End If
    .Fields("VifDate") = Ctod(dtpVifDate.Text)
    .Fields("VifVndCode") = Val(fcmbVndName.BoundText)
    .Fields("VifItmCode") = Val(fcmbItmName.BoundText)
    .Fields("VifItmRefCode") = 0
    .Fields("VifWeight") = Val(UnMyNumFmt(mskVifWeight.Text))
    .Fields("VifUnitWeight") = Val(UnMyNumFmt(mskVifUnitWeight.Text))
    .Fields("VifUnitNos") = 1   ''' future provision
    .Fields("VifNos") = Val(UnMyNumFmt(mskVifNos.Text))
    .Fields("VifNarr") = ""
    .Fields("VifRecState") = ChkEditRecStatus(.Fields("VifRecState"))
    .Update
    mVifICode = .Fields("VifICode")
    End With
    dbTlgDatabase.CommitTrans
    CloseTable VIFRecset
    
    Rem StockJrn section
    clsSTK.Clear
    If dtlAddMode = True Then
        Rem issue stock
        clsSTK.mStkSno_int = 0
        clsSTK.mStkDate_dt = Ctod(dtpVifDate.Text)
        clsSTK.mStkItmCode_lng = Val(fcmbItmName.BoundText)
        clsSTK.mStkItmRefCode_lng = 0
        clsSTK.mStkQty_dbl = ToIssueQty(Val(UnMyNumFmt(mskVifWeight.Text)))
        clsSTK.mStkRate_dbl = 0
        clsSTK.mStkValue_dbl = 0
        clsSTK.mStkNarr_str = ""
        clsSTK.mStkRecState_int = cREC_NEW
        clsSTK.mStkLItmCode_lng = 0
        
        clsSTK.AddNew mVifStkCode
        mVifStkICodeIs = clsSTK.mStkICode_lng
        
        Rem receipt stock
        clsSTK.mStkSno_int = 0
        clsSTK.mStkQty_dbl = ToRcptQty(Val(UnMyNumFmt(mskVifNos.Text)))
        
        clsSTK.AddNew mVifStkCode, mNewItemRef:=True
        mVifStkICodeRc = clsSTK.mStkICode_lng
        mStkItmRefCode = clsSTK.mStkItmRefCode_lng
        
        Rem StockJrn Common entry
        clsSTK.mStkSno_int = -1
        clsSTK.mStkItmCode_lng = 0
        clsSTK.mStkItmRefCode_lng = 0
        clsSTK.mStkQty_dbl = 0
        clsSTK.mStkNarr_str = "Vendor Issue Forging"
        clsSTK.AddNew mVifStkCode
    Else
        Rem issue stock
        clsSTK.GetData mVifStkCode, mVifStkICodeIs
        clsSTK.mStkDate_dt = Ctod(dtpVifDate.Text)
        clsSTK.mStkItmCode_lng = Val(fcmbItmName.BoundText)
        clsSTK.mStkItmRefCode_lng = 0
        clsSTK.mStkQty_dbl = ToIssueQty(Val(UnMyNumFmt(mskVifWeight.Text)))
        clsSTK.mStkRate_dbl = 0
        clsSTK.mStkValue_dbl = 0
        clsSTK.mStkNarr_str = ""
        clsSTK.Update mVifStkCode, mVifStkICodeIs
        
        Rem receipt stock
        clsSTK.GetData mVifStkCode, mVifStkICodeRc
        clsSTK.mStkDate_dt = Ctod(dtpVifDate.Text)
        clsSTK.mStkItmCode_lng = Val(fcmbItmName.BoundText)
        Rem clsSTK.mStkItmRefCode_lng = 0 if item changed then new else existing
        clsSTK.mStkQty_dbl = ToRcptQty(Val(UnMyNumFmt(mskVifNos.Text)))
        clsSTK.mStkRate_dbl = 0
        clsSTK.mStkValue_dbl = 0
        clsSTK.mStkNarr_str = ""
        If mVifItmCode_old <> clsSTK.mStkItmCode_lng Or clsSTK.mStkItmRefCode_lng = 0 Then
            clsSTK.Update mVifStkCode, mVifStkICodeRc, mNewItemRef:=True
        Else
            clsSTK.Update mVifStkCode, mVifStkICodeRc
        End If
        mStkItmRefCode = clsSTK.mStkItmRefCode_lng
        
        Rem StockJrn common entry
        clsSTK.GetData mVifStkCode, 0, -1
        clsSTK.mStkDate_dt = Ctod(dtpVifDate.Text)
        clsSTK.mStkItmCode_lng = 0
        clsSTK.mStkItmRefCode_lng = 0
        clsSTK.mStkQty_dbl = 0
        clsSTK.mStkRate_dbl = 0
        clsSTK.mStkValue_dbl = 0
        clsSTK.mStkNarr_str = "Vendor Issue Forging"
        
        clsSTK.Update mVifStkCode, clsSTK.mStkICode_lng
    End If
    
    Rem update stock ----------------------------------------
    Rem VendIsFrg updation
    dbTlgDatabase.BeginTrans
    VIFRecset.Open "Select * from VendIsFrg where VifCode=" & CStr(mVifCode) & " order by VifICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    With VIFRecset
    If .RecordCount > 0 Then
        .MoveFirst
        Do While .EOF = False
            If InList(.Fields("VifRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
                If dtlAddMode = True Then
                    .Fields("VifStkCode") = mVifStkCode
                    .Fields("VifStkICodeIs") = mVifStkICodeIs
                    .Fields("VifStkICodeRc") = mVifStkICodeRc
                    .Fields("VifItmRefCode") = mStkItmRefCode
                Else
                    .Fields("VifItmRefCode") = mStkItmRefCode
                End If
                .Fields("VifRecState") = cREC_UNCHANGED
                .Update
            Else
                .Fields("VifRecState") = ChkDeleteRecStatus(.Fields("VifRecState"))
                .Update
                .Delete
            End If
            
            .MoveNext
        Loop
    End If
    End With
    dbTlgDatabase.CommitTrans
    CloseTable VIFRecset
    
    Rem StockJrn updation
    clsSTK.CommitStock mVifStkCode
    
    Rem EndStock routine ----------------------------------
    Rem VendIsFrg
    Data_RemoveLog mVifCode
    
    Rem StockJrn
    clsSTK.EndStock mVifStkCode
    
    Rem show record in flexgrid
    VIFRecset.Open "Select * from VendIsFrg where VifCode=" & CStr(mVifCode) & " and VifICode=" & CStr(mVifICode) & "", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    With VIFRecset
    clsVND.GetData .Fields("VifVndCode")
    clsITM.GetData .Fields("VifItmCode")
    
    Mfgrd2.TextMatrix(srow, X2VIFICODE_COL) = .Fields("VifICode")
    Mfgrd2.TextMatrix(srow, X2VIFDATE_COL) = Dtoc(.Fields("VifDate"))
    Mfgrd2.TextMatrix(srow, X2VNDNAME_COL) = clsVND.mAhName_str
    Mfgrd2.TextMatrix(srow, X2ITMNAME_COL) = clsITM.mItmName_str
    Mfgrd2.TextMatrix(srow, X2VIFWEIGHT_COL) = ToMyNumFmt(.Fields("VifWeight"), mDecimals:=3)
    Mfgrd2.TextMatrix(srow, X2VIFUNITWEIGHT_COL) = ToMyNumFmt(.Fields("VifUnitWeight"), mDecimals:=3)
    Mfgrd2.TextMatrix(srow, X2VIFNOS_COL) = ToMyNumFmt(.Fields("VifNos"), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2VIFCODE_COL) = .Fields("VifCode")
    Mfgrd2.TextMatrix(srow, X2VIFSNO_COL) = .Fields("VifSno")
    Mfgrd2.TextMatrix(srow, X2VIFVNDCODE_COL) = .Fields("VifVndCode")
    Mfgrd2.TextMatrix(srow, X2VIFITMCODE_COL) = .Fields("VifItmCode")
    Mfgrd2.TextMatrix(srow, X2VIFSTKCODE_COL) = .Fields("VifStkCode")
    Mfgrd2.TextMatrix(srow, X2VIFSTKICODEIS_COL) = .Fields("VifStkICodeIs")
    Mfgrd2.TextMatrix(srow, X2VIFSTKICODERC_COL) = .Fields("VifStkICodeRc")
    Mfgrd2.TextMatrix(srow, X2VIFRECSTATE_COL) = .Fields("VifRecState")
    
    End With
    CloseTable VIFRecset
    
    If dtlAddMode = True Then
        Mfgrd2.Rows = Mfgrd2.Rows + 1
    End If
    
    srow = srow + 1
    Mfgrd2.Row = srow
Else
    Rem cancel event -----------------------------------
    Rem VendIsFrg
    VIFRecset.Open "Select * from VendIsFrg where VifCode=" & CStr(mVifCode) & " order by VifICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    VIF_LogRS.Open "Select * from VendIsFrg_Log where VifCode=" & CStr(mVifCode) & " order by VifICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    
    dbTlgDatabase.BeginTrans
    With VIFRecset
    If .RecordCount > 0 Then
        .MoveFirst
        Do While .EOF = False
            Rem stock updation is not required because balance is updated on CommitStock and not on individual item save, hence no need to revert is back
            VIF_LogRS.Find "VifICode=" & CStr(.Fields("VifICode")), Start:=1
            If VIF_LogRS.EOF = False Then
                ' any prior updations can be made here
                .Fields("VifSno") = VIF_LogRS.Fields("VifSno")
                .Fields("VifDate") = VIF_LogRS.Fields("VifDate")
                .Fields("VifVndCode") = VIF_LogRS.Fields("VifVndCode")
                .Fields("VifItmCode") = VIF_LogRS.Fields("VifItmCode")
                .Fields("VifItmRefCode") = VIF_LogRS.Fields("VifItmRefCode")
                .Fields("VifWeight") = VIF_LogRS.Fields("VifWeight")
                .Fields("VifUnitWeight") = VIF_LogRS.Fields("VifUnitWeight")
                .Fields("VifUnitNos") = VIF_LogRS.Fields("VifUnitNos")
                .Fields("VifNos") = VIF_LogRS.Fields("VifNos")
                .Fields("VifNarr") = VIF_LogRS.Fields("VifNarr")
                .Fields("VifRecState") = VIF_LogRS.Fields("VifRecState")
                .Update
            Else
                ' any prior updations can be made here
                .Fields("VifRecState") = ChkDeleteRecStatus(.Fields("VifRecState"))
                .Update
                .Delete
            End If
            
            .MoveNext
        Loop
    End If
    End With
    dbTlgDatabase.CommitTrans
    CloseTable VIFRecset
    CloseTable VIF_LogRS
    
    Rem StockJrn
    clsSTK.CancelStock mVifStkCode
    
    Rem EndStock --------------------------------------------------
    Rem VendIsFrg
    Data_RemoveLog mVifCode
    
    Rem StockJrn
    clsSTK.EndStock mVifStkCode
    
End If
dtlAddEditMode = False
dtlAddMode = False
dtlEditCanceled = False
Call VisibleControls(False)
Call RefreshBalUnit
Mfgrd2.SetFocus
GoTo EndSub
Exit Sub

EndSub:
Set VIFRecset = Nothing
Set VIF_LogRS = Nothing

End Sub

Private Sub cmdShowDtlData_Click()
Dim tRecset As New ADODB.Recordset, srow As Long, cnt As Integer
srow = 1

tRecset.Open "Select * from VendIsFrg" _
    & " where VifDate between #" & CStr(ToSysDate(Ctod(dtpVifDate1.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpVifDate2.Text))) & "#" _
    & IIf(Val(fcmbVndName.BoundText) > 0, " and VifVndCode=" & CStr(Val(fcmbVndName.BoundText)), "") _
    & IIf(Val(fcmbItmName.BoundText) > 0, " and VifItmCode=" & CStr(Val(fcmbItmName.BoundText)), "") _
    & " order by VifDate,VifICode" _
    , dbTlgDatabase, adOpenKeyset, adLockOptimistic
With tRecset
If .RecordCount > 0 Then
    Do While .EOF = False
        clsVND.GetData .Fields("VifVndCode")
        clsITM.GetData .Fields("VifItmCode")
        
        Mfgrd2.TextMatrix(srow, X2VIFICODE_COL) = .Fields("VifICode")
        Mfgrd2.TextMatrix(srow, X2VIFDATE_COL) = Dtoc(.Fields("VifDate"))
        Mfgrd2.TextMatrix(srow, X2VNDNAME_COL) = clsVND.mAhName_str
        Mfgrd2.TextMatrix(srow, X2ITMNAME_COL) = clsITM.mItmName_str
        Mfgrd2.TextMatrix(srow, X2VIFWEIGHT_COL) = ToMyNumFmt(.Fields("VifWeight"), mDecimals:=3)
        Mfgrd2.TextMatrix(srow, X2VIFUNITWEIGHT_COL) = ToMyNumFmt(.Fields("VifUnitWeight"), mDecimals:=3)
        Mfgrd2.TextMatrix(srow, X2VIFNOS_COL) = ToMyNumFmt(.Fields("VifNos"), mDecimals:=0)
        Mfgrd2.TextMatrix(srow, X2VIFCODE_COL) = .Fields("VifCode")
        Mfgrd2.TextMatrix(srow, X2VIFSNO_COL) = .Fields("VifSno")
        Mfgrd2.TextMatrix(srow, X2VIFVNDCODE_COL) = .Fields("VifVndCode")
        Mfgrd2.TextMatrix(srow, X2VIFITMCODE_COL) = .Fields("VifItmCode")
        Mfgrd2.TextMatrix(srow, X2VIFSTKCODE_COL) = .Fields("VifStkCode")
        Mfgrd2.TextMatrix(srow, X2VIFSTKICODEIS_COL) = .Fields("VifStkICodeIs")
        Mfgrd2.TextMatrix(srow, X2VIFSTKICODERC_COL) = .Fields("VifStkICodeRc")
        Mfgrd2.TextMatrix(srow, X2VIFRECSTATE_COL) = .Fields("VifRecState")
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

Private Sub RefreshBalUnit()
Dim srow As Long
Rem refresh balance quantity after add/edit/delete for whole flex grid
For srow = 1 To Mfgrd2.Rows - 2
    Mfgrd2.TextMatrix(srow, X2BALWEIGHT_COL) = ToMyNumFmt(GetBalUnit(mAddEditMode:=False, srow:=srow, mMeasUnit:=WEIGHT_UNIT), mDecimals:=3)
    Mfgrd2.TextMatrix(srow, X2BALNOS_COL) = ToMyNumFmt(GetBalUnit(mAddEditMode:=False, srow:=srow, mMeasUnit:=NOS_UNIT), mDecimals:=0)
Next srow

End Sub

Private Function GetBalUnit(ByVal mAddEditMode As Boolean, ByVal srow As Long, ByVal mMeasUnit As Integer) As Double
Dim tRecset As New ADODB.Recordset, mVifWeight_sum As Double, mVifNos_sum As Double, mVrfConsNos_sum As Double, mVrfConsWeight_sum As Double, mBalWeight As Double, mBalNos As Double
Dim mVifDate As Date, mVifVndCode As Long, mVifItmCode As Long, mVifWeight As Double, mVifNos As Double
Dim mVifICode As Long

If mAddEditMode = True Then
    mVifDate = Ctod(dtpVifDate.Text)
    mVifVndCode = Val(fcmbVndName.BoundText)
    mVifItmCode = Val(fcmbItmName.BoundText)
    mVifWeight = Val(UnMyNumFmt(mskVifWeight.Text))
    mVifNos = Val(UnMyNumFmt(mskVifNos.Text))
Else
    Rem value assignment as done for add edit mode (keypress)
    mVifDate = Ctod(Mfgrd2.TextMatrix(srow, X2VIFDATE_COL))
    mVifVndCode = Val(Mfgrd2.TextMatrix(srow, X2VIFVNDCODE_COL))
    mVifItmCode = Val(Mfgrd2.TextMatrix(srow, X2VIFITMCODE_COL))
    mVifWeight = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2VIFWEIGHT_COL)))
    mVifNos = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2VIFNOS_COL)))
End If
mVifICode = Val(Mfgrd2.TextMatrix(srow, X2VIFICODE_COL))

mVifWeight_sum = 0: mVifNos_sum = 0: mVrfConsWeight_sum = 0: mVrfConsNos_sum = 0: mBalWeight = 0: mBalNos = 0

tRecset.Open "Select sum(VifWeight) as VifWeight_sum, sum(VifNos) as VifNos_sum from VendIsFrg where VifVndCode=" & CStr(mVifVndCode) & " and VifItmCode=" & CStr(mVifItmCode) & " and VifDate<=#" & CStr(ToSysDate(mVifDate)) & "#" & IIf(dtlAddMode = False, " and VifICode<>" & CStr(mVifICode), "") & " group by VifVndCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
If tRecset.RecordCount > 0 Then
    mVifWeight_sum = tRecset.Fields("VifWeight_sum")
    mVifNos_sum = tRecset.Fields("VifNos_sum")
End If
CloseTable tRecset

tRecset.Open "Select sum(VrfConsWeight) as VrfConsWeight_sum, sum(VrfConsNos) as VrfConsNos_sum from VendRcFrg where VrfVndCode=" & CStr(mVifVndCode) & " and VrfItmCode=" & CStr(mVifItmCode) & " and VrfDate<=#" & CStr(ToSysDate(mVifDate)) & "#" & " group by VrfVndCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
If tRecset.RecordCount > 0 Then
    mVrfConsWeight_sum = tRecset.Fields("VrfConsWeight_sum")
    mVrfConsNos_sum = tRecset.Fields("VrfConsNos_sum")
End If
CloseTable tRecset

If mMeasUnit = WEIGHT_UNIT Then
    GetBalUnit = mVifWeight_sum - mVrfConsWeight_sum + mVifWeight
ElseIf mMeasUnit = NOS_UNIT Then
    GetBalUnit = mVifNos_sum - mVrfConsNos_sum + mVifNos
End If

End Function

Private Sub dtpVifDate_GotFocus()
FlashActiveControl dtpVifDate, True
End Sub

Private Sub dtpVifDate_LostFocus()
FlashActiveControl dtpVifDate, False
End Sub

Private Sub dtpVifDate_Validate(Cancel As Boolean)
dtpVifDate.Text = ToMyDate(dtpVifDate.Text)
If IsFinYrDate(Ctod(dtpVifDate.Text)) = False Then
    ErrorBox "Invalid Date !!!"
    dtpVifDate.SetFocus
    FlashActiveControl dtpVifDate, True
    Cancel = True
End If
Call ValidDtl

End Sub

Private Sub dtpVifDate1_GotFocus()
FlashActiveControl dtpVifDate1, True
End Sub

Private Sub dtpVifDate1_LostFocus()
FlashActiveControl dtpVifDate1, False

End Sub

Private Sub dtpVifDate1_Validate(Cancel As Boolean)
dtpVifDate1.Text = ToMyDate(dtpVifDate1.Text)
If IsFinYrDate(Ctod(dtpVifDate1.Text)) = False Then
    ErrorBox "Invalid Date !!!"
    dtpVifDate1.SetFocus
    FlashActiveControl dtpVifDate1, True
    Cancel = True
Else
    dtpVifDate2.Text = dtpVifDate1.Text
End If

End Sub

Private Sub dtpVifDate2_GotFocus()
FlashActiveControl dtpVifDate2, True
End Sub

Private Sub dtpVifDate2_LostFocus()
FlashActiveControl dtpVifDate2, False
End Sub

Private Sub dtpVifDate2_Validate(Cancel As Boolean)
dtpVifDate2.Text = ToMyDate(dtpVifDate2.Text)
If IsFinYrDate(Ctod(dtpVifDate2.Text)) = False Then
    ErrorBox "Invalid Date !!!"
    dtpVifDate2.SetFocus
    FlashActiveControl dtpVifDate2, True
    Cancel = True
Else
    If Ctod(dtpVifDate1.Text) > Ctod(dtpVifDate2.Text) Then
        dtpVifDate1.Text = dtpVifDate2.Text
    End If
End If

End Sub

Private Sub Form_Activate()
If mFormLoaded = False Then
    dtpVifDate1.Text = Dtoc(DefaultEntryDate)
    dtpVifDate2.Text = Dtoc(DefaultEntryDate)
    dtpVifDate1.SetFocus
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
mskVifNos.Enabled = False
mskBalWeight.Enabled = False
mskBalNos.Enabled = False

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

Mfgrd2.Rows = 2: Mfgrd2.FixedRows = 1: Mfgrd2.Cols = MFGRD2_COLS: Mfgrd2.FixedCols = 0
colcnt = X2VIFICODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VIFICODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2VIFDATE_COL: Mfgrd2.ColWidth(colcnt) = dtpVifDate.Width: Mfgrd2.TextMatrix(0, colcnt) = "Date": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VNDNAME_COL: Mfgrd2.ColWidth(colcnt) = txtVndName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Vendor Name": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2ITMNAME_COL: Mfgrd2.ColWidth(colcnt) = txtItmName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Material": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VIFWEIGHT_COL: Mfgrd2.ColWidth(colcnt) = mskVifWeight.Width: Mfgrd2.TextMatrix(0, colcnt) = "Issue Weight": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2VIFUNITWEIGHT_COL: Mfgrd2.ColWidth(colcnt) = mskVifUnitWeight.Width: Mfgrd2.TextMatrix(0, colcnt) = "Weight/Pcs": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2VIFNOS_COL: Mfgrd2.ColWidth(colcnt) = mskVifNos.Width: Mfgrd2.TextMatrix(0, colcnt) = "No.of Pcs": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BALWEIGHT_COL: Mfgrd2.ColWidth(colcnt) = mskBalWeight.Width: Mfgrd2.TextMatrix(0, colcnt) = "Bal.Weight": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BALNOS_COL: Mfgrd2.ColWidth(colcnt) = mskBalNos.Width: Mfgrd2.TextMatrix(0, colcnt) = "Bal.Pcs": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2VIFCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VIFCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VIFSNO_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VIFSNO_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VIFVNDCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VIFVNDCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VIFITMCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VIFITMCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VIFSTKCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VIFSTKCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VIFSTKICODEIS_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VIFSTKICODEIS_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VIFSTKICODERC_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VIFSTKICODERC_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VIFRECSTATE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VIFRECSTATE_COL": Mfgrd2.ColAlignment(colcnt) = 1

colcnt = X2VIFDATE_COL: dtpVifDate.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2VNDNAME_COL: txtVndName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2ITMNAME_COL: txtItmName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2VIFWEIGHT_COL: mskVifWeight.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2VIFUNITWEIGHT_COL: mskVifUnitWeight.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2VIFNOS_COL: mskVifNos.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
cmdOK.Left = mskVifNos.Left + mskVifNos.Width
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
Set clsVND = Nothing
Unload fcmbVndName
Unload fcmbItmName
Set fcmbVndName = Nothing
Set fcmbItmName = Nothing

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

End Sub

Private Sub Mfgrd2_KeyDown(KeyCode As Integer, Shift As Integer)
If KeyCode = vbKeyDelete And Shift = 0 Then
    Call Data_DeleteEvent
End If

End Sub

Private Sub Data_DeleteEvent()
Dim VIFRecset As New ADODB.Recordset
Dim srow As Long, mDeleteit As Boolean, mVifStkCode As Long, mVifCode As Long

If Mfgrd2.Row = FlexNewRow(Mfgrd2) Then
    GoTo EndSub
End If
srow = Mfgrd2.Row
mVifStkCode = Val(Mfgrd2.TextMatrix(srow, X2VIFSTKCODE_COL))
mVifCode = Val(Mfgrd2.TextMatrix(srow, X2VIFCODE_COL))

mDeleteit = True

If mDeleteit = True Then
    mDeleteit = ChkVifUnit(mAddEditMode:=False, mMeasUnit:=0)
End If
If mDeleteit = True Then
    mDeleteit = CanDelete()
End If
If mDeleteit = True Then
    Rem begin transaction --------------------------
    Data_CreateLog mVifCode
    clsSTK.BeginStock mVifStkCode
    
    Rem delete transaction ------------------------------
    Rem VendIsFrg
    dbTlgDatabase.BeginTrans
    With VIFRecset
    .Open "Select * from VendIsFrg where VifCode=" & CStr(mVifCode) & " order by VifICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount > 0 Then
        .MoveFirst
        Do While .EOF = False
            .Fields("VifRecState") = ChkDeleteRecStatus(.Fields("VifRecState"))
            .Update
            Rem marked for deletion only, physically deleted in CommitStock
            .MoveNext
        Loop
    End If
    End With
    dbTlgDatabase.CommitTrans
    CloseTable VIFRecset
    
    Rem StockJrn
    clsSTK.DeleteStock mVifStkCode
    
    Rem update transaction --------------------------------------
    Rem VendIsFrg
    dbTlgDatabase.BeginTrans
    VIFRecset.Open "Select * from VendIsFrg where VifCode=" & CStr(mVifCode) & " order by VifICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    With VIFRecset
    If .RecordCount > 0 Then
        .MoveFirst
        Do While .EOF = False
            If InList(.Fields("VifRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
                .Fields("VifRecState") = cREC_UNCHANGED
                .Update
            Else
                .Fields("VifRecState") = ChkDeleteRecStatus(.Fields("VifRecState"))
                .Update
                .Delete
            End If
            
            .MoveNext
        Loop
    End If
    End With
    dbTlgDatabase.CommitTrans
    CloseTable VIFRecset
    
    Rem StockJrn
    clsSTK.CommitStock mVifStkCode
    
    Rem end transaction -----------------------------------------
    Data_RemoveLog mVifCode
    clsSTK.EndStock mVifStkCode
    
    RemoveFlexRow Mfgrd2, srow
    Call RefreshBalUnit
    
    Mfgrd2.Row = srow
    Mfgrd2.SetFocus
Else
    Mfgrd2.SetFocus
End If

EndSub:
Set VIFRecset = Nothing
Exit Sub

End Sub

Private Sub Mfgrd2_KeyPress(KeyAscii As Integer)
Dim srow As Integer, mVifStkCode As Long, mVifCode As Long

If KeyAscii = vbKeyReturn Then
    Mfgrd2.Col = FlexLeftVisibleCol(Mfgrd2)
    Mfgrd2.LeftCol = Mfgrd2.Col
    
    srow = Mfgrd2.Row
    mVifStkCode = Val(Mfgrd2.TextMatrix(srow, X2VIFSTKCODE_COL))
    mVifCode = Val(Mfgrd2.TextMatrix(srow, X2VIFCODE_COL))
    
    dtlAddEditMode = True
    dtlAddMode = (srow = FlexNewRow(Mfgrd2))
    VisibleControls True, Mfgrd2.Top + Mfgrd2.RowPos(Mfgrd2.Row)
    If dtlAddMode = True Then
        If clsSTK.BeginStock(0) = False Then
            GoTo EndSub
        End If
        mVifCode = GetNextSeqno(dbTlgDatabase, "VendIsFrg", "VifCode")
        Data_CreateLog mVifCode
        
        Call ChkDefaultValues
        FormAddEditMode = cFORM_ADDMODE
    Else
        If clsSTK.BeginStock(mVifStkCode) = False Then
            GoTo EndSub
        End If
        Data_CreateLog mVifCode
        
        dtpVifDate.Text = Mfgrd2.TextMatrix(srow, X2VIFDATE_COL)
        fcmbVndName.BoundText = Mfgrd2.TextMatrix(srow, X2VIFVNDCODE_COL): txtVndName.Text = fcmbVndName.Text
        fcmbItmName.BoundText = Mfgrd2.TextMatrix(srow, X2VIFITMCODE_COL): txtItmName.Text = fcmbItmName.Text
        mskVifWeight.Text = Mfgrd2.TextMatrix(srow, X2VIFWEIGHT_COL)
        mskVifUnitWeight.Text = Mfgrd2.TextMatrix(srow, X2VIFUNITWEIGHT_COL)
        mskVifNos.Text = Mfgrd2.TextMatrix(srow, X2VIFNOS_COL)
        FormAddEditMode = cFORM_EDITMODE
        Rem same reading values is also perfomed in ChkVifUnit() function
    End If
    Call Calc_ConvQty
    mVifDate_old = Ctod(dtpVifDate.Text)
    mVifVndCode_old = Val(fcmbVndName.BoundText)
    mVifItmCode_old = Val(fcmbItmName.BoundText)
    mVifWeight_old = Val(UnMyNumFmt(mskVifWeight.Text))
    mVifNos_old = Val(UnMyNumFmt(mskVifNos.Text))
    Rem same value assignment has been done in ChkVifUnit() function
    
    dtpVifDate.SetFocus
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
    dtpVifDate.Top = mRowPos
    txtVndName.Top = mRowPos
    txtItmName.Top = mRowPos
    mskVifWeight.Top = mRowPos
    mskVifUnitWeight.Top = mRowPos
    mskVifNos.Top = mRowPos
    cmdOK.Top = mRowPos
    frBalQty.Top = mRowPos + Mfgrd2.RowHeight(Mfgrd2.Row)
End If

dtpVifDate.Text = Dtoc(DefaultEntryDate)
txtVndName.Text = "": fcmbVndName.BoundText = ""
txtItmName.Text = "": fcmbItmName.BoundText = ""
mskVifWeight.Text = ToMyNumFmt(0, mDecimals:=3)
mskVifUnitWeight.Text = ToMyNumFmt(0, mDecimals:=3)
mskVifNos.Text = ToMyNumFmt(0, mDecimals:=0)
mskBalWeight.Text = ToMyNumFmt(0, mDecimals:=3)
mskBalNos.Text = ToMyNumFmt(0, mDecimals:=0)

Call ValidDtl

dtpVifDate.Visible = mShowItem
txtVndName.Visible = mShowItem
txtItmName.Visible = mShowItem
mskVifWeight.Visible = mShowItem
mskVifUnitWeight.Visible = mShowItem
mskVifNos.Visible = mShowItem
cmdOK.Visible = mShowItem
frBalQty.Visible = mShowItem

Rem list of header and grid controls are common so resetting it to header values after addition/editing ends
If mShowItem = False Then
    fcmbVndName.Text = txtVndName1.Text: txtVndName1.Text = fcmbVndName.Text
    fcmbItmName.Text = txtItmName1.Text: txtItmName1.Text = fcmbItmName.Text
End If

frHeader.Enabled = (mShowItem = False)
Mfgrd2.Enabled = (mShowItem = False)
If mShowItem = False Then
    FormAddEditMode = cFORM_SMRYMODE
End If

End Sub

Private Sub ValidDtl()
Dim mDataOk As Boolean
mDataOk = (IsFinYrDate(Ctod(dtpVifDate.Text)) = True And Val(fcmbVndName.BoundText) > 0 And Val(fcmbItmName.BoundText) > 0 And Val(UnMyNumFmt(mskVifWeight.Text)) > 0 And Val(UnMyNumFmt(mskVifUnitWeight.Text)) > 0 And Val(UnMyNumFmt(mskVifNos.Text)) > 0)
If mDataOk = True And InterActiveChange(cmdOK) = True Then
    mDataOk = (ChkVifUnit(mAddEditMode:=True, mMeasUnit:=0) = True)
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
mskVifNos.Text = ToMyNumFmt(MyDivide(Val(UnMyNumFmt(mskVifWeight.Text)), Val(UnMyNumFmt(mskVifUnitWeight.Text))), mDecimals:=0)

End Sub

Private Sub mskVifNos_GotFocus()
FlashActiveControl mskVifNos, True

End Sub

Private Sub mskVifNos_LostFocus()
FlashActiveControl mskVifNos, False

End Sub

Private Sub mskVifNos_Validate(Cancel As Boolean)
mskVifNos.Text = ToMyNumFmt(mskVifNos.Text, mDecimals:=0)
If Val(UnMyNumFmt(mskVifNos.Text)) <= 0 Then
    ErrorBox "Invalid Nos. !!!"
    mskVifNos.SetFocus
    Cancel = True
Else
    Call Calc_ConvQty
    If dtlAddMode = False Then
        If ChkVifUnit(mAddEditMode:=True, mMeasUnit:=NOS_UNIT) = False Then
            Cancel = True
            mskVifNos.SetFocus
        End If
    End If
End If
Call ValidDtl

End Sub

Private Sub mskVifWeight_GotFocus()
FlashActiveControl mskVifWeight, True

End Sub

Private Sub mskVifWeight_LostFocus()
FlashActiveControl mskVifWeight, False
End Sub

Private Sub mskVifWeight_Validate(Cancel As Boolean)
mskVifWeight.Text = ToMyNumFmt(mskVifWeight.Text, mDecimals:=3)
If Val(UnMyNumFmt(mskVifWeight.Text)) <= 0 Then
    ErrorBox "Invalid Weight !!!"
    mskVifWeight.SetFocus
    Cancel = True
Else
    Call Calc_ConvQty
    If dtlAddMode = False Then
        If ChkVifUnit(mAddEditMode:=True, mMeasUnit:=WEIGHT_UNIT) = False Then
            Cancel = True
            mskVifWeight.SetFocus
        End If
    End If
End If
Call ValidDtl

End Sub

Rem Issued qty should not fall short for already produced/consumed material
Private Function ChkVifUnit(ByVal mAddEditMode As Boolean, ByVal mMeasUnit As Integer) As Boolean
Dim tRecset As New ADODB.Recordset, mVifWeight_sum As Double, mVifNos_sum As Double, mVrfConsWeight_sum As Double, mVrfConsNos_sum As Double, mShortVifWeight As Double, mShortVifNos As Double, mBalWeight As Double, mBalNos As Double
Dim mMaxChkDate As Date, mLoopVifDate As Date
Dim mVifDate As Date, mVifVndCode As Long, mVifItmCode As Long, mVifWeight As Double, mVifNos As Double
Dim mVifICode As Long, srow As Long

Rem control values will be assigned just below and not anywhere in procedural section
srow = Mfgrd2.Row
If mAddEditMode = True Then
    mVifDate = Ctod(dtpVifDate.Text)
    mVifVndCode = Val(fcmbVndName.BoundText)
    mVifItmCode = Val(fcmbItmName.BoundText)
    mVifWeight = Val(UnMyNumFmt(mskVifWeight.Text))
    mVifNos = Val(UnMyNumFmt(mskVifNos.Text))
Else
    Rem value assignment as done for add edit mode (keypress)
    mVifDate = Ctod(Mfgrd2.TextMatrix(srow, X2VIFDATE_COL))
    mVifVndCode = Val(Mfgrd2.TextMatrix(srow, X2VIFVNDCODE_COL))
    mVifItmCode = Val(Mfgrd2.TextMatrix(srow, X2VIFITMCODE_COL))
    mVifWeight = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2VIFWEIGHT_COL)))
    mVifNos = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2VIFNOS_COL)))
    
    Rem old value assignment as done for add edit mode (keypress)
    mVifDate_old = mVifDate
    mVifVndCode_old = mVifVndCode
    mVifItmCode_old = mVifItmCode
    mVifWeight_old = mVifWeight
    mVifNos_old = mVifNos
End If
mVifICode = Val(Mfgrd2.TextMatrix(srow, X2VIFICODE_COL))

If mVifVndCode_old <> mVifVndCode Or mVifItmCode_old <> mVifItmCode Then
    Rem check minus stock by making issue qty as zero of old item entry combination
    ChkVifUnit = True
    
    With tRecset
    .Open "Select top 1 * from VendRcFrg order by VrfDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount > 0 Then
        mMaxChkDate = .Fields("VrfDate")
    Else
        mMaxChkDate = mVifDate_old
    End If
    End With
    CloseTable tRecset
    
    mMaxChkDate = IIf(mVifDate_old > mMaxChkDate, mVifDate_old, mMaxChkDate)
    For mLoopVifDate = mVifDate_old To mMaxChkDate
        mVifWeight_sum = 0: mVifNos_sum = 0: mVrfConsWeight_sum = 0: mVrfConsNos_sum = 0
        
        tRecset.Open "Select sum(VifWeight) as VifWeight_sum, sum(VifNos) as VifNos_sum from VendIsFrg where VifVndCode=" & CStr(mVifVndCode_old) & " and VifItmCode=" & CStr(mVifItmCode_old) & " and VifDate<=#" & CStr(ToSysDate(mLoopVifDate)) & "#" & IIf(dtlAddMode = False, " and VifICode<>" & CStr(mVifICode), "") & " group by VifVndCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mVifWeight_sum = tRecset.Fields("VifWeight_sum")
            mVifNos_sum = tRecset.Fields("VifNos_sum")
        End If
        CloseTable tRecset
        
        tRecset.Open "Select sum(VrfConsWeight) as VrfConsWeight_sum, sum(VrfConsNos) as VrfConsNos_sum from VendRcFrg where VrfVndCode=" & CStr(mVifVndCode_old) & " and VrfItmCode=" & CStr(mVifItmCode_old) & " and VrfDate<=#" & CStr(ToSysDate(mLoopVifDate)) & "#" & " group by VrfVndCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mVrfConsWeight_sum = tRecset.Fields("VrfConsWeight_sum")
            mVrfConsNos_sum = tRecset.Fields("VrfConsNos_sum")
        End If
        CloseTable tRecset
        
        mBalWeight = mVifWeight_sum - mVrfConsWeight_sum
        mBalNos = mVifNos_sum - mVrfConsNos_sum
        
        If (mMeasUnit = WEIGHT_UNIT Or mMeasUnit = 0) And mBalWeight < 0 Then
            ErrorBox "Excess Consumed Weight over Material Issue is " & ToMyNumFmt(mBalWeight, mDecimals:=3, mUseAbs:=True) & " on Dated " & CStr(Dtoc(mLoopVifDate)) & " !!!"
            ChkVifUnit = False
            Exit For
        ElseIf (mMeasUnit = NOS_UNIT Or mMeasUnit = 0) And mBalNos < 0 Then
            ErrorBox "Excess Consumed Nos. over Material Issue is " & ToMyNumFmt(mBalNos, mDecimals:=0, mUseAbs:=True) & " on Dated " & CStr(Dtoc(mLoopVifDate)) & " !!!"
            ChkVifUnit = False
            Exit For
        End If
    Next mLoopVifDate

ElseIf mVifDate < mVifDate_old Then
    Rem check stock availability for production from current date to end production date
    ChkVifUnit = True
    
    With tRecset
    .Open "Select top 1 * from VendRcFrg order by VrfDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount > 0 Then
        mMaxChkDate = .Fields("VrfDate")
    Else
        mMaxChkDate = mVifDate
    End If
    End With
    CloseTable tRecset
    
    mMaxChkDate = IIf(mVifDate > mMaxChkDate, mVifDate, mMaxChkDate)
    For mLoopVifDate = mVifDate To mMaxChkDate
        mVifWeight_sum = 0: mVifNos_sum = 0: mVrfConsWeight_sum = 0: mVrfConsNos_sum = 0
        
        tRecset.Open "Select sum(VifWeight) as VifWeight_sum, sum(VifNos) as VifNos_sum from VendIsFrg where VifVndCode=" & CStr(mVifVndCode) & " and VifItmCode=" & CStr(mVifItmCode) & " and VifDate<=#" & CStr(ToSysDate(mLoopVifDate)) & "#" & IIf(dtlAddMode = False, " and VifICode<>" & CStr(mVifICode), "") & " group by VifVndCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mVifWeight_sum = tRecset.Fields("VifWeight_sum")
            mVifNos_sum = tRecset.Fields("VifNos_sum")
        End If
        CloseTable tRecset
        
        tRecset.Open "Select sum(VrfConsWeight) as VrfConsWeight_sum, sum(VrfConsNos) as VrfConsNos_sum from VendRcFrg where VrfVndCode=" & CStr(mVifVndCode) & " and VrfItmCode=" & CStr(mVifItmCode) & " and VrfDate<=#" & CStr(ToSysDate(mLoopVifDate)) & "#" & " group by VrfVndCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mVrfConsWeight_sum = tRecset.Fields("VrfConsWeight_sum")
            mVrfConsNos_sum = tRecset.Fields("VrfConsNos_sum")
        End If
        CloseTable tRecset
        
        mBalWeight = mVifWeight_sum - mVrfConsWeight_sum + mVifWeight
        mBalNos = mVifNos_sum - mVrfConsNos_sum + mVifNos
        
        If (mMeasUnit = WEIGHT_UNIT Or mMeasUnit = 0) And mBalWeight < 0 Then
            ErrorBox "Excess Consumed Weight over Material Issue is " & ToMyNumFmt(mBalWeight, mDecimals:=3, mUseAbs:=True) & " on Dated " & CStr(Dtoc(mLoopVifDate)) & " !!!"
            ChkVifUnit = False
            Exit For
        ElseIf (mMeasUnit = NOS_UNIT Or mMeasUnit = 0) And mBalNos < 0 Then
            ErrorBox "Excess Consumed Nos. over Material Issue is " & ToMyNumFmt(mBalNos, mDecimals:=0, mUseAbs:=True) & " on Dated " & CStr(Dtoc(mLoopVifDate)) & " !!!"
            ChkVifUnit = False
            Exit For
        End If
    Next mLoopVifDate
    
ElseIf mVifDate > mVifDate_old Then
    Rem check minus stock for old date to previous date of current date by making issued to zero
    Rem and then check minus stock from current date onward for changed/unchanged issued qty
    ChkVifUnit = True
    
    With tRecset
    .Open "Select top 1 * from VendRcFrg order by VrfDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount > 0 Then
        mMaxChkDate = .Fields("VrfDate")
        If mMaxChkDate >= mVifDate Then
            mMaxChkDate = mVifDate - 1
        End If
    Else
        mMaxChkDate = mVifDate_old
    End If
    End With
    CloseTable tRecset
    
    mMaxChkDate = IIf(mVifDate_old > mMaxChkDate, mVifDate_old, mMaxChkDate)
    For mLoopVifDate = mVifDate_old To mMaxChkDate
        mVifWeight_sum = 0: mVifNos_sum = 0: mVrfConsWeight_sum = 0: mVrfConsNos_sum = 0
        
        tRecset.Open "Select sum(VifWeight) as VifWeight_sum, sum(VifNos) as VifNos_sum from VendIsFrg where VifVndCode=" & CStr(mVifVndCode) & " and VifItmCode=" & CStr(mVifItmCode) & " and VifDate<=#" & CStr(ToSysDate(mLoopVifDate)) & "#" & IIf(dtlAddMode = False, " and VifICode<>" & CStr(mVifICode), "") & " group by VifVndCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mVifWeight_sum = tRecset.Fields("VifWeight_sum")
            mVifNos_sum = tRecset.Fields("VifNos_sum")
        End If
        CloseTable tRecset
        
        tRecset.Open "Select sum(VrfConsWeight) as VrfConsWeight_sum, sum(VrfConsNos) as VrfConsNos_sum from VendRcFrg where VrfVndCode=" & CStr(mVifVndCode) & " and VrfItmCode=" & CStr(mVifItmCode) & " and VrfDate<=#" & CStr(ToSysDate(mLoopVifDate)) & "#" & " group by VrfVndCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mVrfConsWeight_sum = tRecset.Fields("VrfConsWeight_sum")
            mVrfConsNos_sum = tRecset.Fields("VrfConsNos_sum")
        End If
        CloseTable tRecset
        
        mBalWeight = mVifWeight_sum - mVrfConsWeight_sum
        mBalNos = mVifNos_sum - mVrfConsNos_sum
        
        If (mMeasUnit = WEIGHT_UNIT Or mMeasUnit = 0) And mBalWeight < 0 Then
            ErrorBox "Excess Consumed Weight over Material Issue is " & ToMyNumFmt(mBalWeight, mDecimals:=3, mUseAbs:=True) & " on Dated " & CStr(Dtoc(mLoopVifDate)) & " !!!"
            ChkVifUnit = False
            Exit For
        ElseIf (mMeasUnit = NOS_UNIT Or mMeasUnit = 0) And mBalNos < 0 Then
            ErrorBox "Excess Consumed Nos. over Material Issue is " & ToMyNumFmt(mBalNos, mDecimals:=0, mUseAbs:=True) & " on Dated " & CStr(Dtoc(mLoopVifDate)) & " !!!"
            ChkVifUnit = False
            Exit For
        End If
    Next mLoopVifDate
    
    If ChkVifUnit = True Then
        With tRecset
        .Open "Select top 1 * from VendRcFrg order by VrfDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If .RecordCount > 0 Then
            mMaxChkDate = .Fields("VrfDate")
        Else
            mMaxChkDate = mVifDate
        End If
        End With
        CloseTable tRecset
        
        mMaxChkDate = IIf(mVifDate > mMaxChkDate, mVifDate, mMaxChkDate)
        For mLoopVifDate = mVifDate To mMaxChkDate
            mVifWeight_sum = 0: mVifNos_sum = 0: mVrfConsWeight_sum = 0: mVrfConsNos_sum = 0
            
            tRecset.Open "Select sum(VifWeight) as VifWeight_sum, sum(VifNos) as VifNos_sum from VendIsFrg where VifVndCode=" & CStr(mVifVndCode) & " and VifItmCode=" & CStr(mVifItmCode) & " and VifDate<=#" & CStr(ToSysDate(mLoopVifDate)) & "#" & IIf(dtlAddMode = False, " and VifICode<>" & CStr(mVifICode), "") & " group by VrfVndCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
            If tRecset.RecordCount > 0 Then
                mVifWeight_sum = tRecset.Fields("VifWeight_sum")
                mVifNos_sum = tRecset.Fields("VifNos_sum")
            End If
            CloseTable tRecset
            
            tRecset.Open "Select sum(VrfConsWeight) as VrfConsWeight_sum, sum(VrfConsNos) as VrfConsNos_sum from VendRcFrg where VrfVndCode=" & CStr(mVifVndCode) & " and VrfItmCode=" & CStr(mVifItmCode) & " and VrfDate<=#" & CStr(ToSysDate(mLoopVifDate)) & "#" & " group by VrfVndCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
            If tRecset.RecordCount > 0 Then
                mVrfConsWeight_sum = tRecset.Fields("VrfConsWeight_sum")
                mVrfConsNos_sum = tRecset.Fields("VrfConsNos_sum")
            End If
            CloseTable tRecset
            
            mBalWeight = mVifWeight_sum - mVrfConsWeight_sum + mVifWeight
            mBalNos = mVifNos_sum - mVrfConsNos_sum + mVifNos
            
            If (mMeasUnit = WEIGHT_UNIT Or mMeasUnit = 0) And mBalWeight < 0 Then
                ErrorBox "Excess Consumed Weight over Material Issue is " & ToMyNumFmt(mBalWeight, mDecimals:=3, mUseAbs:=True) & " on Dated " & CStr(Dtoc(mLoopVifDate)) & " !!!"
                ChkVifUnit = False
                Exit For
            ElseIf (mMeasUnit = NOS_UNIT Or mMeasUnit = 0) And mBalNos < 0 Then
                ErrorBox "Excess Consumed Nos. over Material Issue is " & ToMyNumFmt(mBalNos, mDecimals:=0, mUseAbs:=True) & " on Dated " & CStr(Dtoc(mLoopVifDate)) & " !!!"
                ChkVifUnit = False
                Exit For
            End If
        Next mLoopVifDate
    End If
Else
    Rem first check minus stock from current date to end production date
    
    ChkVifUnit = True
    With tRecset
    .Open "Select top 1 * from VendRcFrg order by VrfDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount > 0 Then
        mMaxChkDate = .Fields("VrfDate")
    Else
        mMaxChkDate = mVifDate
    End If
    End With
    CloseTable tRecset
    
    mMaxChkDate = IIf(mVifDate > mMaxChkDate, mVifDate, mMaxChkDate)
    For mLoopVifDate = mVifDate To mMaxChkDate
        mVifWeight_sum = 0: mVifNos_sum = 0: mVrfConsWeight_sum = 0: mVrfConsNos_sum = 0
        
        tRecset.Open "Select sum(VifWeight) as VifWeight_sum, sum(VifNos) as VifNos_sum from VendIsFrg where VifVndCode=" & CStr(mVifVndCode) & " and VifItmCode=" & CStr(mVifItmCode) & " and VifDate<=#" & CStr(ToSysDate(mLoopVifDate)) & "#" & IIf(dtlAddMode = False, " and VifICode<>" & CStr(mVifICode), "") & " group by VifVndCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mVifWeight_sum = tRecset.Fields("VifWeight_sum")
            mVifNos_sum = tRecset.Fields("VifNos_sum")
        End If
        CloseTable tRecset
        
        tRecset.Open "Select sum(VrfConsWeight) as VrfConsWeight_sum, sum(VrfConsNos) as VrfConsNos_sum from VendRcFrg where VrfVndCode=" & CStr(mVifVndCode) & " and VrfItmCode=" & CStr(mVifItmCode) & " and VrfDate<=#" & CStr(ToSysDate(mLoopVifDate)) & "#" & " group by VrfVndCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mVrfConsWeight_sum = tRecset.Fields("VrfConsWeight_sum")
            mVrfConsNos_sum = tRecset.Fields("VrfConsNos_sum")
        End If
        CloseTable tRecset
        
        mBalWeight = mVifWeight_sum - mVrfConsWeight_sum + IIf(mAddEditMode = True, mVifWeight, 0)
        mBalNos = mVifNos_sum - mVrfConsNos_sum + IIf(mAddEditMode = True, mVifNos, 0)
        
        If (mMeasUnit = WEIGHT_UNIT Or mMeasUnit = 0) And mBalWeight < 0 Then
            ErrorBox "Excess Consumed Weight over Material Issue is " & ToMyNumFmt(mBalWeight, mDecimals:=3, mUseAbs:=True) & " on Dated " & CStr(Dtoc(mLoopVifDate)) & " !!!"
            ChkVifUnit = False
            Exit For
        ElseIf (mMeasUnit = NOS_UNIT Or mMeasUnit = 0) And mBalNos < 0 Then
            ErrorBox "Excess Consumed Nos. over Material Issue is " & ToMyNumFmt(mBalNos, mDecimals:=0, mUseAbs:=True) & " on Dated " & CStr(Dtoc(mLoopVifDate)) & " !!!"
            ChkVifUnit = False
            Exit For
        End If
    Next mLoopVifDate
    
End If

End Function

Private Sub mskVifUnitWeight_GotFocus()
FlashActiveControl mskVifUnitWeight, True

End Sub

Private Sub mskVifUnitWeight_LostFocus()
FlashActiveControl mskVifUnitWeight, False

End Sub

Private Sub mskVifUnitWeight_Validate(Cancel As Boolean)
mskVifUnitWeight.Text = ToMyNumFmt(mskVifUnitWeight.Text, mDecimals:=3)
If Val(UnMyNumFmt(mskVifUnitWeight.Text)) <= 0 Then
    ErrorBox "Invalid Unit Weight !!!"
    mskVifUnitWeight.SetFocus
    Cancel = True
Else
    Call Calc_ConvQty
    If dtlAddMode = False Then
        If ChkVifUnit(mAddEditMode:=True, mMeasUnit:=0) = False Then
            Cancel = True
            mskVifUnitWeight.SetFocus
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
    dtpVifDate.Text = Mfgrd2.TextMatrix(srow, X2VIFDATE_COL)
    fcmbVndName.BoundText = Mfgrd2.TextMatrix(srow, X2VIFVNDCODE_COL): txtVndName.Text = fcmbVndName.Text
    fcmbItmName.BoundText = Mfgrd2.TextMatrix(srow, X2VIFITMCODE_COL): txtItmName.Text = fcmbItmName.Text
Else
    dtpVifDate.Text = dtpVifDate1.Text
    fcmbVndName.Text = txtVndName1.Text: txtVndName.Text = fcmbVndName.Text
    fcmbItmName.Text = txtItmName1.Text: txtItmName.Text = fcmbItmName.Text
End If
mskVifWeight.Text = ToMyNumFmt(0, mDecimals:=3)
mskVifUnitWeight.Text = ToMyNumFmt(0, mDecimals:=3)
mskVifNos.Text = ToMyNumFmt(0, mDecimals:=0)
mskBalWeight.Text = ToMyNumFmt(0, mDecimals:=3)
mskBalNos.Text = ToMyNumFmt(0, mDecimals:=0)

End Sub

Private Function Data_CreateLog(ByVal mVifCode As Long) As Boolean
Dim VIF_LogRS As New ADODB.Recordset
Data_CreateLog = False

VIF_LogRS.Open "Select * from VendIsFrg_Log where VifCode=" & CStr(mVifCode) & "", dbTlgDatabase, adOpenKeyset, adLockOptimistic
With VIF_LogRS
If .RecordCount = 0 Then
    .Close
    Rem only ok records will be taken in log, because not ok records are created out of crashed entries which must be cleared when entry rejected
    dbTlgDatabase.BeginTrans
    dbTlgDatabase.Execute "Insert into VendIsFrg_Log Select * from VendIsFrg where VifCode=" & CStr(mVifCode) & " and VifRecState=" & CStr(cREC_UNCHANGED) & ""
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
Set VIF_LogRS = Nothing
Exit Function

End Function

Private Function Data_RemoveLog(ByVal mVifCode As Long) As Boolean
Data_RemoveLog = False

dbTlgDatabase.BeginTrans
dbTlgDatabase.Execute "Delete from VendIsFrg_Log where VifCode=" & CStr(mVifCode)
dbTlgDatabase.CommitTrans

Data_RemoveLog = True
End Function


