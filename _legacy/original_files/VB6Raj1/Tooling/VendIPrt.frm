VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmVendorIssuePart 
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
      TabIndex        =   22
      Top             =   840
      Width           =   13575
      Begin VB.TextBox dtpVipDate2 
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
      Begin VB.TextBox dtpVipDate1 
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
         Left            =   240
         TabIndex        =   24
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
         TabIndex        =   23
         Top             =   240
         Width           =   975
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
      ItemData        =   "VendIPrt.frx":0000
      Left            =   0
      List            =   "VendIPrt.frx":000D
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
      Height          =   6015
      Left            =   120
      TabIndex        =   18
      Top             =   2280
      Width           =   13575
      Begin VB.TextBox mskVipLength 
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
         TabIndex        =   10
         Tag             =   "AhCode"
         Text            =   "0.000"
         Top             =   1320
         Width           =   1335
      End
      Begin VB.TextBox mskVipNos 
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
         TabIndex        =   12
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
         TabIndex        =   27
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
            TabIndex        =   14
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
            TabIndex        =   13
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
            TabIndex        =   29
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
            TabIndex        =   28
            Top             =   120
            Width           =   855
         End
      End
      Begin VB.TextBox mskVipUnitWeight 
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
         TabIndex        =   11
         Tag             =   "AhCode"
         Text            =   "0.000"
         Top             =   1320
         Width           =   1095
      End
      Begin VB.TextBox mskVipWeight 
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
         Left            =   6960
         TabIndex        =   9
         Tag             =   "AhCode"
         Text            =   "0.000"
         Top             =   1320
         Width           =   1335
      End
      Begin VB.TextBox txtItmName 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   4440
         TabIndex        =   8
         Top             =   1320
         Width           =   2535
      End
      Begin VB.TextBox txtVndName 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   1320
         TabIndex        =   7
         Top             =   1320
         Width           =   3135
      End
      Begin VB.TextBox dtpVipDate 
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
         Left            =   12000
         Style           =   1  'Graphical
         TabIndex        =   15
         Top             =   1320
         Width           =   735
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd2 
         Height          =   4815
         Left            =   120
         TabIndex        =   5
         Top             =   240
         Width           =   12975
         _ExtentX        =   22886
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
      Caption         =   "Vendor Issue for Parting"
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
Attribute VB_Name = "frmVendorIssuePart"
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
Dim mVipDate_old As Date, mVipVndCode_old As Long, mVipItmCode_old As Long, mVipWeight_old As Double, mVipLength_old As Double, mVipNos_old As Double

' StockJrn transaction detail grid Mfgrd2 column definitions
Const X2VIPICODE_COL = 0
Const X2VIPDATE_COL = 1
Const X2VNDNAME_COL = 2
Const X2ITMNAME_COL = 3
Const X2VIPWEIGHT_COL = 4
Const X2VIPLENGTH_COL = 5
Const X2VIPUNITWEIGHT_COL = 6
Const X2VIPNOS_COL = 7
Const X2BALWEIGHT_COL = 8
Const X2BALNOS_COL = 9
Const X2VIPCODE_COL = 10
Const X2VIPSNO_COL = 11
Const X2VIPVNDCODE_COL = 12
Const X2VIPITMCODE_COL = 13
Const X2VIPSTKCODE_COL = 14
Const X2VIPSTKICODEIS_COL = 15
Const X2VIPSTKICODERC_COL = 16
Const X2VIPRECSTATE_COL = 17
Const MFGRD2_COLS = 18

Rem qty.unit id constant
Const WEIGHT_UNIT = 1
Const LENGTH_UNIT = 2
Const NOS_UNIT = 3

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
    dtpVipDate1.SetFocus
Else
    Unload Me
End If

End Sub

Private Sub cmdOK_Click()
Dim VIPRecset As New ADODB.Recordset, VIP_LogRS As New ADODB.Recordset
Dim srow As Long, mVipStkCode As Long, mVipStkICodeIs As Long, mVipStkICodeRc As Long, mVipCode As Long, mVipICode As Long, mVipSno As Long, mStkItmRefCode As Long

srow = Mfgrd2.Row
If dtlAddMode = True Then
    mVipCode = GetNextSeqno(dbTlgDatabase, "VendIsPrt", "VipCode")
    mVipStkCode = clsSTK.ActiveStkCode
Else
    mVipCode = Val(Mfgrd2.TextMatrix(srow, X2VIPCODE_COL))
    mVipStkCode = Val(Mfgrd2.TextMatrix(srow, X2VIPSTKCODE_COL))
    mVipICode = Val(Mfgrd2.TextMatrix(srow, X2VIPICODE_COL))
    mVipStkICodeIs = Val(Mfgrd2.TextMatrix(srow, X2VIPSTKICODEIS_COL))
    mVipStkICodeRc = Val(Mfgrd2.TextMatrix(srow, X2VIPSTKICODERC_COL))
End If
If dtlEditCanceled = False And dtlAddMode = False Then
    Call ValidDtl
End If
If cmdOK.Caption = "&OK" And dtlEditCanceled = False Then
    Rem addnew/update -------------------------
    Rem VendIsPrt section
    dbTlgDatabase.BeginTrans
    With VIPRecset
    If dtlAddMode = True Then
        mVipSno = GetNextSeqno(dbTlgDatabase, "VendIsPrt", "VipSno", "VipCode" = CStr(mVipCode))
        
        VIPRecset.Open "Select * from VendIsPrt where VipCode=" & CStr(mVipCode) & "", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        .AddNew
        Rem .Fields("VipICode") = AutoNumber
        .Fields("VipCode") = mVipCode
        .Fields("VipSno") = mVipSno
    Else
        VIPRecset.Open "Select * from VendIsPrt where VipCode=" & CStr(mVipCode) & " and VipICode=" & CStr(mVipICode) & "", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    End If
    .Fields("VipDate") = Ctod(dtpVipDate.Text)
    .Fields("VipVndCode") = Val(fcmbVndName.BoundText)
    .Fields("VipItmCode") = Val(fcmbItmName.BoundText)
    .Fields("VipItmRefCode") = 0
    .Fields("VipWeight") = Val(UnMyNumFmt(mskVipWeight.Text))
    .Fields("VipLength") = Val(UnMyNumFmt(mskVipLength.Text))
    .Fields("VipUnitWeight") = Val(UnMyNumFmt(mskVipUnitWeight.Text))
    .Fields("VipUnitNos") = 1       ''' future provision
    .Fields("VipNos") = Val(UnMyNumFmt(mskVipNos.Text))
    .Fields("VipNarr") = ""
    .Fields("VipRecState") = ChkEditRecStatus(.Fields("VipRecState"))
    .Update
    mVipICode = .Fields("VipICode")
    End With
    dbTlgDatabase.CommitTrans
    CloseTable VIPRecset
    
    Rem StockJrn section
    clsSTK.Clear
    If dtlAddMode = True Then
        Rem issue stock
        clsSTK.mStkSno_int = 0
        clsSTK.mStkDate_dt = Ctod(dtpVipDate.Text)
        clsSTK.mStkItmCode_lng = Val(fcmbItmName.BoundText)
        clsSTK.mStkItmRefCode_lng = 0
        clsSTK.mStkQty_dbl = ToIssueQty(Val(UnMyNumFmt(mskVipWeight.Text)))
        clsSTK.mStkRate_dbl = 0
        clsSTK.mStkValue_dbl = 0
        clsSTK.mStkNarr_str = ""
        clsSTK.mStkRecState_int = cREC_NEW
        clsSTK.mStkLItmCode_lng = 0
        
        clsSTK.AddNew mVipStkCode
        mVipStkICodeIs = clsSTK.mStkICode_lng
        
        Rem receipt stock
        clsSTK.mStkSno_int = 0
        clsSTK.mStkQty_dbl = ToRcptQty(Val(UnMyNumFmt(mskVipNos.Text)))
        
        clsSTK.AddNew mVipStkCode, mNewItemRef:=True
        mVipStkICodeRc = clsSTK.mStkICode_lng
        mStkItmRefCode = clsSTK.mStkItmRefCode_lng
        
        Rem StockJrn Common entry
        clsSTK.mStkSno_int = -1
        clsSTK.mStkItmCode_lng = 0
        clsSTK.mStkItmRefCode_lng = 0
        clsSTK.mStkQty_dbl = 0
        clsSTK.mStkNarr_str = "Vendor Issue Parting"
        clsSTK.AddNew mVipStkCode
    Else
        Rem issue stock
        clsSTK.GetData mVipStkCode, mVipStkICodeIs
        clsSTK.mStkDate_dt = Ctod(dtpVipDate.Text)
        clsSTK.mStkItmCode_lng = Val(fcmbItmName.BoundText)
        clsSTK.mStkItmRefCode_lng = 0
        clsSTK.mStkQty_dbl = ToIssueQty(Val(UnMyNumFmt(mskVipWeight.Text)))
        clsSTK.mStkRate_dbl = 0
        clsSTK.mStkValue_dbl = 0
        clsSTK.mStkNarr_str = ""
        clsSTK.Update mVipStkCode, mVipStkICodeIs
        
        Rem receipt stock
        clsSTK.GetData mVipStkCode, mVipStkICodeRc
        clsSTK.mStkDate_dt = Ctod(dtpVipDate.Text)
        clsSTK.mStkItmCode_lng = Val(fcmbItmName.BoundText)
        Rem clsSTK.mStkItmRefCode_lng = 0 if item changed then new else existing
        clsSTK.mStkQty_dbl = ToRcptQty(Val(UnMyNumFmt(mskVipNos.Text)))
        clsSTK.mStkRate_dbl = 0
        clsSTK.mStkValue_dbl = 0
        clsSTK.mStkNarr_str = ""
        If mVipItmCode_old <> clsSTK.mStkItmCode_lng Or clsSTK.mStkItmRefCode_lng = 0 Then
            clsSTK.Update mVipStkCode, mVipStkICodeRc, mNewItemRef:=True
        Else
            clsSTK.Update mVipStkCode, mVipStkICodeRc
        End If
        mStkItmRefCode = clsSTK.mStkItmRefCode_lng
        
        Rem StockJrn common entry
        clsSTK.GetData mVipStkCode, 0, -1
        clsSTK.mStkDate_dt = Ctod(dtpVipDate.Text)
        clsSTK.mStkItmCode_lng = 0
        clsSTK.mStkItmRefCode_lng = 0
        clsSTK.mStkQty_dbl = 0
        clsSTK.mStkRate_dbl = 0
        clsSTK.mStkValue_dbl = 0
        clsSTK.mStkNarr_str = "Vendor Issue Parting"
        
        clsSTK.Update mVipStkCode, clsSTK.mStkICode_lng
    End If
    
    Rem update stock ----------------------------------------
    Rem VendIsPrt updation
    dbTlgDatabase.BeginTrans
    VIPRecset.Open "Select * from VendIsPrt where VipCode=" & CStr(mVipCode) & " order by VipICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    With VIPRecset
    If .RecordCount > 0 Then
        .MoveFirst
        Do While .EOF = False
            If InList(.Fields("VipRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
                If dtlAddMode = True Then
                    .Fields("VipStkCode") = mVipStkCode
                    .Fields("VipStkICodeIs") = mVipStkICodeIs
                    .Fields("VipStkICodeRc") = mVipStkICodeRc
                    .Fields("VipItmRefCode") = mStkItmRefCode
                Else
                    .Fields("VipItmRefCode") = mStkItmRefCode
                End If
                .Fields("VipRecState") = cREC_UNCHANGED
                .Update
            Else
                .Fields("VipRecState") = ChkDeleteRecStatus(.Fields("VipRecState"))
                .Update
                .Delete
            End If
            
            .MoveNext
        Loop
    End If
    End With
    dbTlgDatabase.CommitTrans
    CloseTable VIPRecset
    
    Rem StockJrn updation
    clsSTK.CommitStock mVipStkCode
    
    Rem EndStock routine ----------------------------------
    Rem VendIsPrt
    Data_RemoveLog mVipCode
    
    Rem StockJrn
    clsSTK.EndStock mVipStkCode
    
    Rem show record in flexgrid
    VIPRecset.Open "Select * from VendIsPrt where VipCode=" & CStr(mVipCode) & " and VipICode=" & CStr(mVipICode) & "", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    With VIPRecset
    clsVND.GetData .Fields("VipVndCode")
    clsITM.GetData .Fields("VipItmCode")
    
    Mfgrd2.TextMatrix(srow, X2VIPICODE_COL) = .Fields("VipICode")
    Mfgrd2.TextMatrix(srow, X2VIPDATE_COL) = Dtoc(.Fields("VipDate"))
    Mfgrd2.TextMatrix(srow, X2VNDNAME_COL) = clsVND.mAhName_str
    Mfgrd2.TextMatrix(srow, X2ITMNAME_COL) = clsITM.mItmName_str
    Mfgrd2.TextMatrix(srow, X2VIPWEIGHT_COL) = ToMyNumFmt(.Fields("VipWeight"), mDecimals:=3)
    Mfgrd2.TextMatrix(srow, X2VIPLENGTH_COL) = ToMyNumFmt(.Fields("VipLength"), mDecimals:=3)
    Mfgrd2.TextMatrix(srow, X2VIPUNITWEIGHT_COL) = ToMyNumFmt(.Fields("VipUnitWeight"), mDecimals:=3)
    Mfgrd2.TextMatrix(srow, X2VIPNOS_COL) = ToMyNumFmt(.Fields("VipNos"), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2VIPCODE_COL) = .Fields("VipCode")
    Mfgrd2.TextMatrix(srow, X2VIPSNO_COL) = .Fields("VipSno")
    Mfgrd2.TextMatrix(srow, X2VIPVNDCODE_COL) = .Fields("VipVndCode")
    Mfgrd2.TextMatrix(srow, X2VIPITMCODE_COL) = .Fields("VipItmCode")
    Mfgrd2.TextMatrix(srow, X2VIPSTKCODE_COL) = .Fields("VipStkCode")
    Mfgrd2.TextMatrix(srow, X2VIPSTKICODEIS_COL) = .Fields("VipStkICodeIs")
    Mfgrd2.TextMatrix(srow, X2VIPSTKICODERC_COL) = .Fields("VipStkICodeRc")
    Mfgrd2.TextMatrix(srow, X2VIPRECSTATE_COL) = .Fields("VipRecState")
    
    End With
    CloseTable VIPRecset
    
    If dtlAddMode = True Then
        Mfgrd2.Rows = Mfgrd2.Rows + 1
    End If
    
    srow = srow + 1
    Mfgrd2.Row = srow
Else
    Rem cancel event -----------------------------------
    Rem VendIsPrt
    VIPRecset.Open "Select * from VendIsPrt where VipCode=" & CStr(mVipCode) & " order by VipICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    VIP_LogRS.Open "Select * from VendIsPrt_Log where VipCode=" & CStr(mVipCode) & " order by VipICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    
    dbTlgDatabase.BeginTrans
    With VIPRecset
    If .RecordCount > 0 Then
        .MoveFirst
        Do While .EOF = False
            Rem stock updation is not required because balance is updated on CommitStock and not on individual item save, hence no need to revert is back
            VIP_LogRS.Find "VipICode=" & CStr(.Fields("VipICode")), Start:=1
            If VIP_LogRS.EOF = False Then
                ' any prior updations can be made here
                .Fields("VipSno") = VIP_LogRS.Fields("VipSno")
                .Fields("VipDate") = VIP_LogRS.Fields("VipDate")
                .Fields("VipVndCode") = VIP_LogRS.Fields("VipVndCode")
                .Fields("VipItmCode") = VIP_LogRS.Fields("VipItmCode")
                .Fields("VipItmRefCode") = VIP_LogRS.Fields("VipItmRefCode")
                .Fields("VipWeight") = VIP_LogRS.Fields("VipWeight")
                .Fields("VipLength") = VIP_LogRS.Fields("VipLength")
                .Fields("VipUnitWeight") = VIP_LogRS.Fields("VipUnitWeight")
                .Fields("VipUnitNos") = VIP_LogRS.Fields("VipUnitNos")
                .Fields("VipNos") = VIP_LogRS.Fields("VipNos")
                .Fields("VipNarr") = VIP_LogRS.Fields("VipNarr")
                .Fields("VipRecState") = VIP_LogRS.Fields("VipRecState")
                .Update
            Else
                ' any prior updations can be made here
                .Fields("VipRecState") = ChkDeleteRecStatus(.Fields("VipRecState"))
                .Update
                .Delete
            End If
            
            .MoveNext
        Loop
    End If
    End With
    dbTlgDatabase.CommitTrans
    CloseTable VIPRecset
    CloseTable VIP_LogRS
    
    Rem StockJrn
    clsSTK.CancelStock mVipStkCode
    
    Rem EndStock --------------------------------------------------
    Rem VendIsPrt
    Data_RemoveLog mVipCode
    
    Rem StockJrn
    clsSTK.EndStock mVipStkCode
    
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
Set VIPRecset = Nothing
Set VIP_LogRS = Nothing

End Sub

Private Sub cmdShowDtlData_Click()
Dim tRecset As New ADODB.Recordset, srow As Long, cnt As Integer
srow = 1

tRecset.Open "Select * from VendIsPrt" _
    & " where VipDate between #" & CStr(ToSysDate(Ctod(dtpVipDate1.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpVipDate2.Text))) & "#" _
    & IIf(Val(fcmbVndName.BoundText) > 0, " and VipVndCode=" & CStr(Val(fcmbVndName.BoundText)), "") _
    & IIf(Val(fcmbItmName.BoundText) > 0, " and VipItmCode=" & CStr(Val(fcmbItmName.BoundText)), "") _
    & " order by VipDate,VipICode" _
    , dbTlgDatabase, adOpenKeyset, adLockOptimistic
With tRecset
If .RecordCount > 0 Then
    Do While .EOF = False
        clsVND.GetData .Fields("VipVndCode")
        clsITM.GetData .Fields("VipItmCode")
        
        Mfgrd2.TextMatrix(srow, X2VIPICODE_COL) = .Fields("VipICode")
        Mfgrd2.TextMatrix(srow, X2VIPDATE_COL) = Dtoc(.Fields("VipDate"))
        Mfgrd2.TextMatrix(srow, X2VNDNAME_COL) = clsVND.mAhName_str
        Mfgrd2.TextMatrix(srow, X2ITMNAME_COL) = clsITM.mItmName_str
        Mfgrd2.TextMatrix(srow, X2VIPWEIGHT_COL) = ToMyNumFmt(.Fields("VipWeight"), mDecimals:=3)
        Mfgrd2.TextMatrix(srow, X2VIPLENGTH_COL) = ToMyNumFmt(.Fields("VipLength"), mDecimals:=3)
        Mfgrd2.TextMatrix(srow, X2VIPUNITWEIGHT_COL) = ToMyNumFmt(.Fields("VipUnitWeight"), mDecimals:=3)
        Mfgrd2.TextMatrix(srow, X2VIPNOS_COL) = ToMyNumFmt(.Fields("VipNos"), mDecimals:=0)
        Mfgrd2.TextMatrix(srow, X2VIPCODE_COL) = .Fields("VipCode")
        Mfgrd2.TextMatrix(srow, X2VIPSNO_COL) = .Fields("VipSno")
        Mfgrd2.TextMatrix(srow, X2VIPVNDCODE_COL) = .Fields("VipVndCode")
        Mfgrd2.TextMatrix(srow, X2VIPITMCODE_COL) = .Fields("VipItmCode")
        Mfgrd2.TextMatrix(srow, X2VIPSTKCODE_COL) = .Fields("VipStkCode")
        Mfgrd2.TextMatrix(srow, X2VIPSTKICODEIS_COL) = .Fields("VipStkICodeIs")
        Mfgrd2.TextMatrix(srow, X2VIPSTKICODERC_COL) = .Fields("VipStkICodeRc")
        Mfgrd2.TextMatrix(srow, X2VIPRECSTATE_COL) = .Fields("VipRecState")
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
Dim tRecset As New ADODB.Recordset, mVipWeight_sum As Double, mVipLength_sum As Double, mVipNos_sum As Double, mVrpConsNos_sum As Double, mVrpConsWeight_sum As Double, mBalWeight As Double, mBalNos As Double
Dim mVipDate As Date, mVipVndCode As Long, mVipItmCode As Long, mVipWeight As Double, mVipLength As Double, mVipNos As Double
Dim mVipICode As Long

If mAddEditMode = True Then
    mVipDate = Ctod(dtpVipDate.Text)
    mVipVndCode = Val(fcmbVndName.BoundText)
    mVipItmCode = Val(fcmbItmName.BoundText)
    mVipWeight = Val(UnMyNumFmt(mskVipWeight.Text))
    mVipLength = Val(UnMyNumFmt(mskVipLength.Text))
    mVipNos = Val(UnMyNumFmt(mskVipNos.Text))
Else
    Rem value assignment as done for add edit mode (keypress)
    mVipDate = Ctod(Mfgrd2.TextMatrix(srow, X2VIPDATE_COL))
    mVipVndCode = Val(Mfgrd2.TextMatrix(srow, X2VIPVNDCODE_COL))
    mVipItmCode = Val(Mfgrd2.TextMatrix(srow, X2VIPITMCODE_COL))
    mVipWeight = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2VIPWEIGHT_COL)))
    mVipLength = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2VIPLENGTH_COL)))
    mVipNos = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2VIPNOS_COL)))
End If
mVipICode = Val(Mfgrd2.TextMatrix(srow, X2VIPICODE_COL))

mVipWeight_sum = 0: mVipLength_sum = 0: mVipNos_sum = 0: mVrpConsWeight_sum = 0: mVrpConsNos_sum = 0: mBalWeight = 0: mBalNos = 0

tRecset.Open "Select sum(VipWeight) as VipWeight_sum, sum(VipLength) as VipLength_sum, sum(VipNos) as VipNos_sum from VendIsPrt where VipVndCode=" & CStr(mVipVndCode) & " and VipItmCode=" & CStr(mVipItmCode) & " and VipDate<=#" & CStr(ToSysDate(mVipDate)) & "#" & IIf(dtlAddMode = False, " and VipICode<>" & CStr(mVipICode), "") & " group by VipVndCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
If tRecset.RecordCount > 0 Then
    mVipWeight_sum = tRecset.Fields("VipWeight_sum")
    mVipLength_sum = tRecset.Fields("VipLength_sum")
    mVipNos_sum = tRecset.Fields("VipNos_sum")
End If
CloseTable tRecset

tRecset.Open "Select sum(VrpConsWeight) as VrpConsWeight_sum, sum(VrpConsNos) as VrpConsNos_sum from VendRcPrt where VrpVndCode=" & CStr(mVipVndCode) & " and VrpItmCode=" & CStr(mVipItmCode) & " and VrpDate<=#" & CStr(ToSysDate(mVipDate)) & "#" & " group by VrpVndCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
If tRecset.RecordCount > 0 Then
    mVrpConsWeight_sum = tRecset.Fields("VrpConsWeight_sum")
    mVrpConsNos_sum = tRecset.Fields("VrpConsNos_sum")
End If
CloseTable tRecset

If mMeasUnit = WEIGHT_UNIT Then
    GetBalUnit = mVipWeight_sum - mVrpConsWeight_sum + mVipWeight
ElseIf mMeasUnit = LENGTH_UNIT Then
    Rem GetBalUnit = mVipLength_sum - mVrpConsLength_sum + mVipLength
ElseIf mMeasUnit = NOS_UNIT Then
    GetBalUnit = mVipNos_sum - mVrpConsNos_sum + mVipNos
End If

End Function

Private Sub dtpVipDate_GotFocus()
FlashActiveControl dtpVipDate, True
End Sub

Private Sub dtpVipDate_LostFocus()
FlashActiveControl dtpVipDate, False
End Sub

Private Sub dtpVipDate_Validate(Cancel As Boolean)
dtpVipDate.Text = ToMyDate(dtpVipDate.Text)
If IsFinYrDate(Ctod(dtpVipDate.Text)) = False Then
    ErrorBox "Invalid Date !!!"
    dtpVipDate.SetFocus
    FlashActiveControl dtpVipDate, True
    Cancel = True
End If
Call ValidDtl

End Sub

Private Sub dtpVipDate1_GotFocus()
FlashActiveControl dtpVipDate1, True
End Sub

Private Sub dtpVipDate1_LostFocus()
FlashActiveControl dtpVipDate1, False

End Sub

Private Sub dtpVipDate1_Validate(Cancel As Boolean)
dtpVipDate1.Text = ToMyDate(dtpVipDate1.Text)
If IsFinYrDate(Ctod(dtpVipDate1.Text)) = False Then
    ErrorBox "Invalid Date !!!"
    dtpVipDate1.SetFocus
    FlashActiveControl dtpVipDate1, True
    Cancel = True
Else
    dtpVipDate2.Text = dtpVipDate1.Text
End If

End Sub

Private Sub dtpVipDate2_GotFocus()
FlashActiveControl dtpVipDate2, True
End Sub

Private Sub dtpVipDate2_LostFocus()
FlashActiveControl dtpVipDate2, False
End Sub

Private Sub dtpVipDate2_Validate(Cancel As Boolean)
dtpVipDate2.Text = ToMyDate(dtpVipDate2.Text)
If IsFinYrDate(Ctod(dtpVipDate2.Text)) = False Then
    ErrorBox "Invalid Date !!!"
    dtpVipDate2.SetFocus
    FlashActiveControl dtpVipDate2, True
    Cancel = True
Else
    If Ctod(dtpVipDate1.Text) > Ctod(dtpVipDate2.Text) Then
        dtpVipDate1.Text = dtpVipDate2.Text
    End If
End If

End Sub

Private Sub Form_Activate()
If mFormLoaded = False Then
    dtpVipDate1.Text = Dtoc(DefaultEntryDate)
    dtpVipDate2.Text = Dtoc(DefaultEntryDate)
    dtpVipDate1.SetFocus
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
mskVipNos.Enabled = False
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
colcnt = X2VIPICODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VIPICODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2VIPDATE_COL: Mfgrd2.ColWidth(colcnt) = dtpVipDate.Width: Mfgrd2.TextMatrix(0, colcnt) = "Date": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VNDNAME_COL: Mfgrd2.ColWidth(colcnt) = txtVndName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Vendor Name": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2ITMNAME_COL: Mfgrd2.ColWidth(colcnt) = txtItmName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Material": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VIPWEIGHT_COL: Mfgrd2.ColWidth(colcnt) = mskVipWeight.Width: Mfgrd2.TextMatrix(0, colcnt) = "Issue Weight": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2VIPLENGTH_COL: Mfgrd2.ColWidth(colcnt) = mskVipLength.Width: Mfgrd2.TextMatrix(0, colcnt) = "Issue Length": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2VIPUNITWEIGHT_COL: Mfgrd2.ColWidth(colcnt) = mskVipUnitWeight.Width: Mfgrd2.TextMatrix(0, colcnt) = "Weight/Pcs": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2VIPNOS_COL: Mfgrd2.ColWidth(colcnt) = mskVipNos.Width: Mfgrd2.TextMatrix(0, colcnt) = "No.of Pcs": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BALWEIGHT_COL: Mfgrd2.ColWidth(colcnt) = mskBalWeight.Width: Mfgrd2.TextMatrix(0, colcnt) = "Bal.Weight": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BALNOS_COL: Mfgrd2.ColWidth(colcnt) = mskBalNos.Width: Mfgrd2.TextMatrix(0, colcnt) = "Bal.Pcs": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2VIPCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VIPCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VIPSNO_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VIPSNO_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VIPVNDCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VIPVNDCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VIPITMCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VIPITMCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VIPSTKCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VIPSTKCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VIPSTKICODEIS_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VIPSTKICODEIS_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VIPSTKICODERC_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VIPSTKICODERC_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VIPRECSTATE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VIPRECSTATE_COL": Mfgrd2.ColAlignment(colcnt) = 1

colcnt = X2VIPDATE_COL: dtpVipDate.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2VNDNAME_COL: txtVndName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2ITMNAME_COL: txtItmName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2VIPWEIGHT_COL: mskVipWeight.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2VIPLENGTH_COL: mskVipLength.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2VIPUNITWEIGHT_COL: mskVipUnitWeight.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2VIPNOS_COL: mskVipNos.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
cmdOK.Left = mskVipNos.Left + mskVipNos.Width
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
Dim VIPRecset As New ADODB.Recordset
Dim srow As Long, mDeleteit As Boolean, mVipStkCode As Long, mVipCode As Long

If Mfgrd2.Row = FlexNewRow(Mfgrd2) Then
    GoTo EndSub
End If
srow = Mfgrd2.Row
mVipStkCode = Val(Mfgrd2.TextMatrix(srow, X2VIPSTKCODE_COL))
mVipCode = Val(Mfgrd2.TextMatrix(srow, X2VIPCODE_COL))

mDeleteit = True

If mDeleteit = True Then
    mDeleteit = ChkVipUnit(mAddEditMode:=False, mMeasUnit:=0)
End If
If mDeleteit = True Then
    mDeleteit = CanDelete()
End If
If mDeleteit = True Then
    Rem begin transaction --------------------------
    Data_CreateLog mVipCode
    clsSTK.BeginStock mVipStkCode
    
    Rem delete transaction ------------------------------
    Rem VendIsPrt
    dbTlgDatabase.BeginTrans
    With VIPRecset
    .Open "Select * from VendIsPrt where VipCode=" & CStr(mVipCode) & " order by VipICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount > 0 Then
        .MoveFirst
        Do While .EOF = False
            .Fields("VipRecState") = ChkDeleteRecStatus(.Fields("VipRecState"))
            .Update
            Rem marked for deletion only, physically deleted in CommitStock
            .MoveNext
        Loop
    End If
    End With
    dbTlgDatabase.CommitTrans
    CloseTable VIPRecset
    
    Rem StockJrn
    clsSTK.DeleteStock mVipStkCode
    
    Rem update transaction --------------------------------------
    Rem VendIsPrt
    dbTlgDatabase.BeginTrans
    VIPRecset.Open "Select * from VendIsPrt where VipCode=" & CStr(mVipCode) & " order by VipICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    With VIPRecset
    If .RecordCount > 0 Then
        .MoveFirst
        Do While .EOF = False
            If InList(.Fields("VipRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
                .Fields("VipRecState") = cREC_UNCHANGED
                .Update
            Else
                .Fields("VipRecState") = ChkDeleteRecStatus(.Fields("VipRecState"))
                .Update
                .Delete
            End If
            
            .MoveNext
        Loop
    End If
    End With
    dbTlgDatabase.CommitTrans
    CloseTable VIPRecset
    
    Rem StockJrn
    clsSTK.CommitStock mVipStkCode
    
    Rem end transaction -----------------------------------------
    Data_RemoveLog mVipCode
    clsSTK.EndStock mVipStkCode
    
    RemoveFlexRow Mfgrd2, srow
    Call RefreshBalUnit
    
    Mfgrd2.Row = srow
    Mfgrd2.SetFocus
Else
    Mfgrd2.SetFocus
End If

EndSub:
Set VIPRecset = Nothing
Exit Sub

End Sub

Private Sub Mfgrd2_KeyPress(KeyAscii As Integer)
Dim srow As Integer, mVipStkCode As Long, mVipCode As Long

If KeyAscii = vbKeyReturn Then
    Mfgrd2.Col = FlexLeftVisibleCol(Mfgrd2)
    Mfgrd2.LeftCol = Mfgrd2.Col
    
    srow = Mfgrd2.Row
    mVipStkCode = Val(Mfgrd2.TextMatrix(srow, X2VIPSTKCODE_COL))
    mVipCode = Val(Mfgrd2.TextMatrix(srow, X2VIPCODE_COL))
    
    dtlAddEditMode = True
    dtlAddMode = (srow = FlexNewRow(Mfgrd2))
    VisibleControls True, Mfgrd2.Top + Mfgrd2.RowPos(Mfgrd2.Row)
    If dtlAddMode = True Then
        If clsSTK.BeginStock(0) = False Then
            GoTo EndSub
        End If
        mVipCode = GetNextSeqno(dbTlgDatabase, "VendIsPrt", "VipCode")
        Data_CreateLog mVipCode
        
        Call ChkDefaultValues
        FormAddEditMode = cFORM_ADDMODE
    Else
        If clsSTK.BeginStock(mVipStkCode) = False Then
            GoTo EndSub
        End If
        Data_CreateLog mVipCode
        
        dtpVipDate.Text = Mfgrd2.TextMatrix(srow, X2VIPDATE_COL)
        fcmbVndName.BoundText = Mfgrd2.TextMatrix(srow, X2VIPVNDCODE_COL): txtVndName.Text = fcmbVndName.Text
        fcmbItmName.BoundText = Mfgrd2.TextMatrix(srow, X2VIPITMCODE_COL): txtItmName.Text = fcmbItmName.Text
        mskVipWeight.Text = Mfgrd2.TextMatrix(srow, X2VIPWEIGHT_COL)
        mskVipLength.Text = Mfgrd2.TextMatrix(srow, X2VIPLENGTH_COL)
        mskVipUnitWeight.Text = Mfgrd2.TextMatrix(srow, X2VIPUNITWEIGHT_COL)
        mskVipNos.Text = Mfgrd2.TextMatrix(srow, X2VIPNOS_COL)
        FormAddEditMode = cFORM_EDITMODE
        Rem same reading values is also perfomed in ChkVipUnit() function
    End If
    Call Calc_ConvQty
    mVipDate_old = Ctod(dtpVipDate.Text)
    mVipVndCode_old = Val(fcmbVndName.BoundText)
    mVipItmCode_old = Val(fcmbItmName.BoundText)
    mVipWeight_old = Val(UnMyNumFmt(mskVipWeight.Text))
    mVipLength_old = Val(UnMyNumFmt(mskVipLength.Text))
    mVipNos_old = Val(UnMyNumFmt(mskVipNos.Text))
    Rem same value assignment has been done in ChkVipUnit() function
    
    dtpVipDate.SetFocus
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
    dtpVipDate.Top = mRowPos
    txtVndName.Top = mRowPos
    txtItmName.Top = mRowPos
    mskVipWeight.Top = mRowPos
    mskVipLength.Top = mRowPos
    mskVipUnitWeight.Top = mRowPos
    mskVipNos.Top = mRowPos
    cmdOK.Top = mRowPos
    frBalQty.Top = mRowPos + Mfgrd2.RowHeight(Mfgrd2.Row)
End If

dtpVipDate.Text = Dtoc(DefaultEntryDate)
txtVndName.Text = "": fcmbVndName.BoundText = ""
txtItmName.Text = "": fcmbItmName.BoundText = ""
mskVipWeight.Text = ToMyNumFmt(0, mDecimals:=3)
mskVipLength.Text = ToMyNumFmt(0, mDecimals:=3)
mskVipUnitWeight.Text = ToMyNumFmt(0, mDecimals:=3)
mskVipNos.Text = ToMyNumFmt(0, mDecimals:=0)
mskBalWeight.Text = ToMyNumFmt(0, mDecimals:=3)
mskBalNos.Text = ToMyNumFmt(0, mDecimals:=0)

Call ValidDtl

dtpVipDate.Visible = mShowItem
txtVndName.Visible = mShowItem
txtItmName.Visible = mShowItem
mskVipWeight.Visible = mShowItem
mskVipLength.Visible = mShowItem
mskVipUnitWeight.Visible = mShowItem
mskVipNos.Visible = mShowItem
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
mDataOk = (IsFinYrDate(Ctod(dtpVipDate.Text)) = True And Val(fcmbVndName.BoundText) > 0 And Val(fcmbItmName.BoundText) > 0 And Val(UnMyNumFmt(mskVipWeight.Text)) > 0 And Val(UnMyNumFmt(mskVipLength.Text)) > 0 And Val(UnMyNumFmt(mskVipUnitWeight.Text)) > 0 And Val(UnMyNumFmt(mskVipNos.Text)) > 0)
If mDataOk = True And InterActiveChange(cmdOK) = True Then
    mDataOk = (ChkVipUnit(mAddEditMode:=True, mMeasUnit:=0) = True)
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
mskVipNos.Text = ToMyNumFmt(MyDivide(Val(UnMyNumFmt(mskVipWeight.Text)), Val(UnMyNumFmt(mskVipUnitWeight.Text))), mDecimals:=0)

End Sub

Private Sub mskVipNos_GotFocus()
FlashActiveControl mskVipNos, True

End Sub

Private Sub mskVipNos_LostFocus()
FlashActiveControl mskVipNos, False

End Sub

Private Sub mskVipNos_Validate(Cancel As Boolean)
mskVipNos.Text = ToMyNumFmt(mskVipNos.Text, mDecimals:=0)
If Val(UnMyNumFmt(mskVipNos.Text)) <= 0 Then
    ErrorBox "Invalid Nos. !!!"
    mskVipNos.SetFocus
    Cancel = True
Else
    Call Calc_ConvQty
    If dtlAddMode = False Then
        If ChkVipUnit(mAddEditMode:=True, mMeasUnit:=NOS_UNIT) = False Then
            Cancel = True
            mskVipNos.SetFocus
        End If
    End If
End If
Call ValidDtl

End Sub

Private Sub mskVipWeight_GotFocus()
FlashActiveControl mskVipWeight, True

End Sub

Private Sub mskVipWeight_LostFocus()
FlashActiveControl mskVipWeight, False
End Sub

Private Sub mskVipWeight_Validate(Cancel As Boolean)
mskVipWeight.Text = ToMyNumFmt(mskVipWeight.Text, mDecimals:=3)
If Val(UnMyNumFmt(mskVipWeight.Text)) <= 0 Then
    ErrorBox "Invalid Weight !!!"
    mskVipWeight.SetFocus
    Cancel = True
Else
    Call Calc_ConvQty
    If dtlAddMode = False Then
        If ChkVipUnit(mAddEditMode:=True, mMeasUnit:=WEIGHT_UNIT) = False Then
            Cancel = True
            mskVipWeight.SetFocus
        End If
    End If
End If
Call ValidDtl

End Sub

Private Sub mskVipLength_GotFocus()
FlashActiveControl mskVipLength, True

End Sub

Private Sub mskVipLength_LostFocus()
FlashActiveControl mskVipLength, False
End Sub

Private Sub mskVipLength_Validate(Cancel As Boolean)
mskVipLength.Text = ToMyNumFmt(mskVipLength.Text, mDecimals:=3)
If Val(UnMyNumFmt(mskVipLength.Text)) <= 0 Then
    ErrorBox "Invalid Length !!!"
    mskVipLength.SetFocus
    Cancel = True
Else
    Call Calc_ConvQty
    If dtlAddMode = False Then
        If ChkVipUnit(mAddEditMode:=True, mMeasUnit:=WEIGHT_UNIT) = False Then
            Cancel = True
            mskVipLength.SetFocus
        End If
    End If
End If
Call ValidDtl

End Sub

Rem Issued qty should not fall short for already produced/consumed material
Private Function ChkVipUnit(ByVal mAddEditMode As Boolean, ByVal mMeasUnit As Integer) As Boolean
Dim tRecset As New ADODB.Recordset, mVipWeight_sum As Double, mVipLength_sum As Double, mVipNos_sum As Double, mVrpConsWeight_sum As Double, mVrpConsNos_sum As Double, mBalWeight As Double, mBalNos As Double
Dim mMaxChkDate As Date, mLoopVipDate As Date
Dim mVipDate As Date, mVipVndCode As Long, mVipItmCode As Long, mVipWeight As Double, mVipLength As Double, mVipNos As Double
Dim mVipICode As Long, srow As Long

Rem control values will be assigned just below and not anywhere in procedural section
srow = Mfgrd2.Row
If mAddEditMode = True Then
    mVipDate = Ctod(dtpVipDate.Text)
    mVipVndCode = Val(fcmbVndName.BoundText)
    mVipItmCode = Val(fcmbItmName.BoundText)
    mVipWeight = Val(UnMyNumFmt(mskVipWeight.Text))
    mVipLength = Val(UnMyNumFmt(mskVipLength.Text))
    mVipNos = Val(UnMyNumFmt(mskVipNos.Text))
Else
    Rem value assignment as done for add edit mode (keypress)
    mVipDate = Ctod(Mfgrd2.TextMatrix(srow, X2VIPDATE_COL))
    mVipVndCode = Val(Mfgrd2.TextMatrix(srow, X2VIPVNDCODE_COL))
    mVipItmCode = Val(Mfgrd2.TextMatrix(srow, X2VIPITMCODE_COL))
    mVipWeight = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2VIPWEIGHT_COL)))
    mVipLength = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2VIPLENGTH_COL)))
    mVipNos = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2VIPNOS_COL)))
    
    Rem old value assignment as done for add edit mode (keypress)
    mVipDate_old = mVipDate
    mVipVndCode_old = mVipVndCode
    mVipItmCode_old = mVipItmCode
    mVipWeight_old = mVipWeight
    mVipLength_old = mVipLength
    mVipNos_old = mVipNos
End If
mVipICode = Val(Mfgrd2.TextMatrix(srow, X2VIPICODE_COL))

If mVipVndCode_old <> mVipVndCode Or mVipItmCode_old <> mVipItmCode Then
    Rem check minus stock by making issue qty as zero of old item entry combination
    ChkVipUnit = True
    
    With tRecset
    .Open "Select top 1 * from VendRcPrt order by VrpDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount > 0 Then
        mMaxChkDate = .Fields("VrpDate")
    Else
        mMaxChkDate = mVipDate_old
    End If
    End With
    CloseTable tRecset
    
    mMaxChkDate = IIf(mVipDate_old > mMaxChkDate, mVipDate_old, mMaxChkDate)
    For mLoopVipDate = mVipDate_old To mMaxChkDate
        mVipWeight_sum = 0: mVipLength_sum = 0: mVipNos_sum = 0: mVrpConsWeight_sum = 0: mVrpConsNos_sum = 0
        
        tRecset.Open "Select sum(VipWeight) as VipWeight_sum, sum(VipLength) as VipLength_sum, sum(VipNos) as VipNos_sum from VendIsPrt where VipVndCode=" & CStr(mVipVndCode_old) & " and VipItmCode=" & CStr(mVipItmCode_old) & " and VipDate<=#" & CStr(ToSysDate(mLoopVipDate)) & "#" & IIf(dtlAddMode = False, " and VipICode<>" & CStr(mVipICode), "") & " group by VipVndCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mVipWeight_sum = tRecset.Fields("VipWeight_sum")
            mVipLength_sum = tRecset.Fields("VipLength_sum")
            mVipNos_sum = tRecset.Fields("VipNos_sum")
        End If
        CloseTable tRecset
        
        tRecset.Open "Select sum(VrpConsWeight) as VrpConsWeight_sum, sum(VrpConsNos) as VrpConsNos_sum from VendRcPrt where VrpVndCode=" & CStr(mVipVndCode_old) & " and VrpItmCode=" & CStr(mVipItmCode_old) & " and VrpDate<=#" & CStr(ToSysDate(mLoopVipDate)) & "#" & " group by VrpVndCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mVrpConsWeight_sum = tRecset.Fields("VrpConsWeight_sum")
            mVrpConsNos_sum = tRecset.Fields("VrpConsNos_sum")
        End If
        CloseTable tRecset
        
        mBalWeight = mVipWeight_sum - mVrpConsWeight_sum
        mBalNos = mVipNos_sum - mVrpConsNos_sum
        
        If (mMeasUnit = WEIGHT_UNIT Or mMeasUnit = 0) And mBalWeight < 0 Then
            ErrorBox "Excess Consumed Weight over Material Issue is " & ToMyNumFmt(mBalWeight, mDecimals:=3, mUseAbs:=True) & " on Dated " & CStr(Dtoc(mLoopVipDate)) & " !!!"
            ChkVipUnit = False
            Exit For
        ElseIf (mMeasUnit = NOS_UNIT Or mMeasUnit = 0) And mBalNos < 0 Then
            ErrorBox "Excess Consumed Nos. over Material Issue is " & ToMyNumFmt(mBalNos, mDecimals:=0, mUseAbs:=True) & " on Dated " & CStr(Dtoc(mLoopVipDate)) & " !!!"
            ChkVipUnit = False
            Exit For
        End If
    Next mLoopVipDate

ElseIf mVipDate < mVipDate_old Then
    Rem check stock availability for production from current date to end production date
    ChkVipUnit = True
    
    With tRecset
    .Open "Select top 1 * from VendRcPrt order by VrpDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount > 0 Then
        mMaxChkDate = .Fields("VrpDate")
    Else
        mMaxChkDate = mVipDate
    End If
    End With
    CloseTable tRecset
    
    mMaxChkDate = IIf(mVipDate > mMaxChkDate, mVipDate, mMaxChkDate)
    For mLoopVipDate = mVipDate To mMaxChkDate
        mVipWeight_sum = 0: mVipLength_sum = 0: mVipNos_sum = 0: mVrpConsWeight_sum = 0: mVrpConsNos_sum = 0
        
        tRecset.Open "Select sum(VipWeight) as VipWeight_sum, sum(VipLength) as VipLength_sum, sum(VipNos) as VipNos_sum from VendIsPrt where VipVndCode=" & CStr(mVipVndCode) & " and VipItmCode=" & CStr(mVipItmCode) & " and VipDate<=#" & CStr(ToSysDate(mLoopVipDate)) & "#" & IIf(dtlAddMode = False, " and VipICode<>" & CStr(mVipICode), "") & " group by VipVndCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mVipWeight_sum = tRecset.Fields("VipWeight_sum")
            mVipLength_sum = tRecset.Fields("VipLength_sum")
            mVipNos_sum = tRecset.Fields("VipNos_sum")
        End If
        CloseTable tRecset
        
        tRecset.Open "Select sum(VrpConsWeight) as VrpConsWeight_sum, sum(VrpConsNos) as VrpConsNos_sum from VendRcPrt where VrpVndCode=" & CStr(mVipVndCode) & " and VrpItmCode=" & CStr(mVipItmCode) & " and VrpDate<=#" & CStr(ToSysDate(mLoopVipDate)) & "#" & " group by VrpVndCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mVrpConsWeight_sum = tRecset.Fields("VrpConsWeight_sum")
            mVrpConsNos_sum = tRecset.Fields("VrpConsNos_sum")
        End If
        CloseTable tRecset
        
        mBalWeight = mVipWeight_sum - mVrpConsWeight_sum + mVipWeight
        mBalNos = mVipNos_sum - mVrpConsNos_sum + mVipNos
        
        If (mMeasUnit = WEIGHT_UNIT Or mMeasUnit = 0) And mBalWeight < 0 Then
            ErrorBox "Excess Consumed Weight over Material Issue is " & ToMyNumFmt(mBalWeight, mDecimals:=3, mUseAbs:=True) & " on Dated " & CStr(Dtoc(mLoopVipDate)) & " !!!"
            ChkVipUnit = False
            Exit For
        ElseIf (mMeasUnit = NOS_UNIT Or mMeasUnit = 0) And mBalNos < 0 Then
            ErrorBox "Excess Consumed Nos. over Material Issue is " & ToMyNumFmt(mBalNos, mDecimals:=0, mUseAbs:=True) & " on Dated " & CStr(Dtoc(mLoopVipDate)) & " !!!"
            ChkVipUnit = False
            Exit For
        End If
    Next mLoopVipDate
    
ElseIf mVipDate > mVipDate_old Then
    Rem check minus stock for old date to previous date of current date by making issued to zero
    Rem and then check minus stock from current date onward for changed/unchanged issued qty
    ChkVipUnit = True
    
    With tRecset
    .Open "Select top 1 * from VendRcPrt order by VrpDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount > 0 Then
        mMaxChkDate = .Fields("VrpDate")
        If mMaxChkDate >= mVipDate Then
            mMaxChkDate = mVipDate - 1
        End If
    Else
        mMaxChkDate = mVipDate_old
    End If
    End With
    CloseTable tRecset
    
    mMaxChkDate = IIf(mVipDate_old > mMaxChkDate, mVipDate_old, mMaxChkDate)
    For mLoopVipDate = mVipDate_old To mMaxChkDate
        mVipWeight_sum = 0: mVipLength_sum = 0: mVipNos_sum = 0: mVrpConsWeight_sum = 0: mVrpConsNos_sum = 0
        
        tRecset.Open "Select sum(VipWeight) as VipWeight_sum, sum(VipLength) as VipLength_sum, sum(VipNos) as VipNos_sum from VendIsPrt where VipVndCode=" & CStr(mVipVndCode) & " and VipItmCode=" & CStr(mVipItmCode) & " and VipDate<=#" & CStr(ToSysDate(mLoopVipDate)) & "#" & IIf(dtlAddMode = False, " and VipICode<>" & CStr(mVipICode), "") & " group by VipVndCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mVipWeight_sum = tRecset.Fields("VipWeight_sum")
            mVipLength_sum = tRecset.Fields("VipLength_sum")
            mVipNos_sum = tRecset.Fields("VipNos_sum")
        End If
        CloseTable tRecset
        
        tRecset.Open "Select sum(VrpConsWeight) as VrpConsWeight_sum, sum(VrpConsNos) as VrpConsNos_sum from VendRcPrt where VrpVndCode=" & CStr(mVipVndCode) & " and VrpItmCode=" & CStr(mVipItmCode) & " and VrpDate<=#" & CStr(ToSysDate(mLoopVipDate)) & "#" & " group by VrpVndCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mVrpConsWeight_sum = tRecset.Fields("VrpConsWeight_sum")
            mVrpConsNos_sum = tRecset.Fields("VrpConsNos_sum")
        End If
        CloseTable tRecset
        
        mBalWeight = mVipWeight_sum - mVrpConsWeight_sum
        mBalNos = mVipNos_sum - mVrpConsNos_sum
        
        If (mMeasUnit = WEIGHT_UNIT Or mMeasUnit = 0) And mBalWeight < 0 Then
            ErrorBox "Excess Consumed Weight over Material Issue is " & ToMyNumFmt(mBalWeight, mDecimals:=3, mUseAbs:=True) & " on Dated " & CStr(Dtoc(mLoopVipDate)) & " !!!"
            ChkVipUnit = False
            Exit For
        ElseIf (mMeasUnit = NOS_UNIT Or mMeasUnit = 0) And mBalNos < 0 Then
            ErrorBox "Excess Consumed Nos. over Material Issue is " & ToMyNumFmt(mBalNos, mDecimals:=0, mUseAbs:=True) & " on Dated " & CStr(Dtoc(mLoopVipDate)) & " !!!"
            ChkVipUnit = False
            Exit For
        End If
    Next mLoopVipDate
    
    If ChkVipUnit = True Then
        With tRecset
        .Open "Select top 1 * from VendRcPrt order by VrpDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If .RecordCount > 0 Then
            mMaxChkDate = .Fields("VrpDate")
        Else
            mMaxChkDate = mVipDate
        End If
        End With
        CloseTable tRecset
        
        mMaxChkDate = IIf(mVipDate > mMaxChkDate, mVipDate, mMaxChkDate)
        For mLoopVipDate = mVipDate To mMaxChkDate
            mVipWeight_sum = 0: mVipLength_sum = 0: mVipNos_sum = 0: mVrpConsWeight_sum = 0: mVrpConsNos_sum = 0
            
            tRecset.Open "Select sum(VipWeight) as VipWeight_sum, sum(VipLength) as VipLength_sum, sum(VipNos) as VipNos_sum from VendIsPrt where VipVndCode=" & CStr(mVipVndCode) & " and VipItmCode=" & CStr(mVipItmCode) & " and VipDate<=#" & CStr(ToSysDate(mLoopVipDate)) & "#" & IIf(dtlAddMode = False, " and VipICode<>" & CStr(mVipICode), "") & " group by VipVndCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
            If tRecset.RecordCount > 0 Then
                mVipWeight_sum = tRecset.Fields("VipWeight_sum")
                mVipLength_sum = tRecset.Fields("VipLength_sum")
                mVipNos_sum = tRecset.Fields("VipNos_sum")
            End If
            CloseTable tRecset
            
            tRecset.Open "Select sum(VrpConsWeight) as VrpConsWeight_sum, sum(VrpConsNos) as VrpConsNos_sum from VendRcPrt where VrpVndCode=" & CStr(mVipVndCode) & " and VrpItmCode=" & CStr(mVipItmCode) & " and VrpDate<=#" & CStr(ToSysDate(mLoopVipDate)) & "#" & " group by VrpVndCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
            If tRecset.RecordCount > 0 Then
                mVrpConsWeight_sum = tRecset.Fields("VrpConsWeight_sum")
                mVrpConsNos_sum = tRecset.Fields("VrpConsNos_sum")
            End If
            CloseTable tRecset
            
            mBalWeight = mVipWeight_sum - mVrpConsWeight_sum + mVipWeight
            mBalNos = mVipNos_sum - mVrpConsNos_sum + mVipNos
            
            If (mMeasUnit = WEIGHT_UNIT Or mMeasUnit = 0) And mBalWeight < 0 Then
                ErrorBox "Excess Consumed Weight over Material Issue is " & ToMyNumFmt(mBalWeight, mDecimals:=3, mUseAbs:=True) & " on Dated " & CStr(Dtoc(mLoopVipDate)) & " !!!"
                ChkVipUnit = False
                Exit For
            ElseIf (mMeasUnit = NOS_UNIT Or mMeasUnit = 0) And mBalNos < 0 Then
                ErrorBox "Excess Consumed Nos. over Material Issue is " & ToMyNumFmt(mBalNos, mDecimals:=0, mUseAbs:=True) & " on Dated " & CStr(Dtoc(mLoopVipDate)) & " !!!"
                ChkVipUnit = False
                Exit For
            End If
        Next mLoopVipDate
    End If
Else
    Rem first check minus stock from current date to end production date
    
    ChkVipUnit = True
    With tRecset
    .Open "Select top 1 * from VendRcPrt order by VrpDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount > 0 Then
        mMaxChkDate = .Fields("VrpDate")
    Else
        mMaxChkDate = mVipDate
    End If
    End With
    CloseTable tRecset
    
    mMaxChkDate = IIf(mVipDate > mMaxChkDate, mVipDate, mMaxChkDate)
    For mLoopVipDate = mVipDate To mMaxChkDate
        mVipWeight_sum = 0: mVipLength_sum = 0: mVipNos_sum = 0: mVrpConsWeight_sum = 0: mVrpConsNos_sum = 0
        
        tRecset.Open "Select sum(VipWeight) as VipWeight_sum, sum(VipLength) as VipLength_sum, sum(VipNos) as VipNos_sum from VendIsPrt where VipVndCode=" & CStr(mVipVndCode) & " and VipItmCode=" & CStr(mVipItmCode) & " and VipDate<=#" & CStr(ToSysDate(mLoopVipDate)) & "#" & IIf(dtlAddMode = False, " and VipICode<>" & CStr(mVipICode), "") & " group by VipVndCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mVipWeight_sum = tRecset.Fields("VipWeight_sum")
            mVipLength_sum = tRecset.Fields("VipLength_sum")
            mVipNos_sum = tRecset.Fields("VipNos_sum")
        End If
        CloseTable tRecset
        
        tRecset.Open "Select sum(VrpConsWeight) as VrpConsWeight_sum, sum(VrpConsNos) as VrpConsNos_sum from VendRcPrt where VrpVndCode=" & CStr(mVipVndCode) & " and VrpItmCode=" & CStr(mVipItmCode) & " and VrpDate<=#" & CStr(ToSysDate(mLoopVipDate)) & "#" & " group by VrpVndCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mVrpConsWeight_sum = tRecset.Fields("VrpConsWeight_sum")
            mVrpConsNos_sum = tRecset.Fields("VrpConsNos_sum")
        End If
        CloseTable tRecset
        
        mBalWeight = mVipWeight_sum - mVrpConsWeight_sum + IIf(mAddEditMode = True, mVipWeight, 0)
        mBalNos = mVipNos_sum - mVrpConsNos_sum + IIf(mAddEditMode = True, mVipNos, 0)
        
        If (mMeasUnit = WEIGHT_UNIT Or mMeasUnit = 0) And mBalWeight < 0 Then
            ErrorBox "Excess Consumed Weight over Material Issue is " & ToMyNumFmt(mBalWeight, mDecimals:=3, mUseAbs:=True) & " on Dated " & CStr(Dtoc(mLoopVipDate)) & " !!!"
            ChkVipUnit = False
            Exit For
        ElseIf (mMeasUnit = NOS_UNIT Or mMeasUnit = 0) And mBalNos < 0 Then
            ErrorBox "Excess Consumed Nos. over Material Issue is " & ToMyNumFmt(mBalNos, mDecimals:=0, mUseAbs:=True) & " on Dated " & CStr(Dtoc(mLoopVipDate)) & " !!!"
            ChkVipUnit = False
            Exit For
        End If
    Next mLoopVipDate
    
End If

End Function

Private Sub mskVipUnitWeight_GotFocus()
FlashActiveControl mskVipUnitWeight, True

End Sub

Private Sub mskVipUnitWeight_LostFocus()
FlashActiveControl mskVipUnitWeight, False

End Sub

Private Sub mskVipUnitWeight_Validate(Cancel As Boolean)
mskVipUnitWeight.Text = ToMyNumFmt(mskVipUnitWeight.Text, mDecimals:=3)
If Val(UnMyNumFmt(mskVipUnitWeight.Text)) <= 0 Then
    ErrorBox "Invalid Unit Weight !!!"
    mskVipUnitWeight.SetFocus
    Cancel = True
Else
    Call Calc_ConvQty
    If dtlAddMode = False Then
        If ChkVipUnit(mAddEditMode:=True, mMeasUnit:=0) = False Then
            Cancel = True
            mskVipUnitWeight.SetFocus
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
    dtpVipDate.Text = Mfgrd2.TextMatrix(srow, X2VIPDATE_COL)
    fcmbVndName.BoundText = Mfgrd2.TextMatrix(srow, X2VIPVNDCODE_COL): txtVndName.Text = fcmbVndName.Text
    fcmbItmName.BoundText = Mfgrd2.TextMatrix(srow, X2VIPITMCODE_COL): txtItmName.Text = fcmbItmName.Text
Else
    dtpVipDate.Text = dtpVipDate1.Text
    fcmbVndName.Text = txtVndName1.Text: txtVndName.Text = fcmbVndName.Text
    fcmbItmName.Text = txtItmName1.Text: txtItmName.Text = fcmbItmName.Text
End If
mskVipWeight.Text = ToMyNumFmt(0, mDecimals:=3)
mskVipLength.Text = ToMyNumFmt(0, mDecimals:=3)
mskVipUnitWeight.Text = ToMyNumFmt(0, mDecimals:=3)
mskVipNos.Text = ToMyNumFmt(0, mDecimals:=0)
mskBalWeight.Text = ToMyNumFmt(0, mDecimals:=3)
mskBalNos.Text = ToMyNumFmt(0, mDecimals:=0)

End Sub

Private Function Data_CreateLog(ByVal mVipCode As Long) As Boolean
Dim VIP_LogRS As New ADODB.Recordset
Data_CreateLog = False

VIP_LogRS.Open "Select * from VendIsPrt_Log where VipCode=" & CStr(mVipCode) & "", dbTlgDatabase, adOpenKeyset, adLockOptimistic
With VIP_LogRS
If .RecordCount = 0 Then
    .Close
    Rem only ok records will be taken in log, because not ok records are created out of crashed entries which must be cleared when entry rejected
    dbTlgDatabase.BeginTrans
    dbTlgDatabase.Execute "Insert into VendIsPrt_Log Select * from VendIsPrt where VipCode=" & CStr(mVipCode) & " and VipRecState=" & CStr(cREC_UNCHANGED) & ""
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
Set VIP_LogRS = Nothing
Exit Function

End Function

Private Function Data_RemoveLog(ByVal mVipCode As Long) As Boolean
Data_RemoveLog = False

dbTlgDatabase.BeginTrans
dbTlgDatabase.Execute "Delete from VendIsPrt_Log where VipCode=" & CStr(mVipCode)
dbTlgDatabase.CommitTrans

Data_RemoveLog = True
End Function


