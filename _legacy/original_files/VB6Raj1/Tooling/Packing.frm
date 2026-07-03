VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmMatPacking 
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
      TabIndex        =   21
      Top             =   840
      Width           =   13695
      Begin VB.TextBox dtpMpkDate2 
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
         Left            =   3960
         TabIndex        =   1
         Tag             =   "AhCode"
         Text            =   "dd/mm/yyyy"
         Top             =   240
         Width           =   1335
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
         Left            =   5520
         Style           =   1  'Graphical
         TabIndex        =   4
         Top             =   960
         Width           =   735
      End
      Begin VB.TextBox txtEmpName1 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   1320
         TabIndex        =   2
         Top             =   600
         Width           =   3975
      End
      Begin VB.TextBox txtItmName1 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   1320
         TabIndex        =   3
         Top             =   960
         Width           =   3975
      End
      Begin VB.TextBox dtpMpkDate1 
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
         Width           =   1335
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "To Date:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   3
         Left            =   3000
         TabIndex        =   25
         Top             =   240
         Width           =   855
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Person:"
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
      ItemData        =   "Packing.frx":0000
      Left            =   0
      List            =   "Packing.frx":000D
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
      Width           =   13695
      Begin VB.TextBox mskBalQtyForDisp 
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
         Left            =   11640
         TabIndex        =   13
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   1320
         Width           =   1455
      End
      Begin VB.TextBox mskBalQtyForPack 
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
         Left            =   10200
         TabIndex        =   12
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   1320
         Width           =   1455
      End
      Begin VB.TextBox mskMpkItmQty 
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
         Left            =   8760
         TabIndex        =   11
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   1320
         Width           =   1455
      End
      Begin VB.TextBox mskMpkPerBoxItmQty 
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
         TabIndex        =   10
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   1320
         Width           =   1215
      End
      Begin VB.TextBox mskMpkBoxQty 
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
         Left            =   6600
         TabIndex        =   9
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   1320
         Width           =   975
      End
      Begin VB.TextBox txtItmName 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   4080
         TabIndex        =   8
         Top             =   1320
         Width           =   2535
      End
      Begin VB.TextBox txtEmpName 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   1320
         TabIndex        =   7
         Top             =   1320
         Width           =   2775
      End
      Begin VB.TextBox dtpMpkDate 
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
         Left            =   9480
         Style           =   1  'Graphical
         TabIndex        =   14
         Top             =   1680
         Width           =   735
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd2 
         Height          =   4815
         Left            =   120
         TabIndex        =   5
         Top             =   240
         Width           =   13455
         _ExtentX        =   23733
         _ExtentY        =   8493
         _Version        =   393216
         FixedCols       =   0
         RowHeightMin    =   285
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
      Caption         =   "Assembling (Packing)"
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
Attribute VB_Name = "frmMatPacking"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim dbAcDatabase As New ADODB.Connection, dbStDatabase As New ADODB.Connection, dbTlgDatabase As New ADODB.Connection, dbPyrDatabase As New ADODB.Connection, dbGrpDatabase As New ADODB.Connection, dbComDatabase As New ADODB.Connection
Dim mFormLoaded As Boolean, mLastKeyPressed As Integer
Dim mRemoteAccess As Boolean, mEntrySaved As Boolean, mEntryAborted As Boolean
Dim dtlAddEditMode As Boolean, dtlAddMode As Boolean, dtlEditCanceled As Boolean
Dim clsSTK As clsStockJrn, clsITM As clsProduct, clsEMP As clsPayrollMasterEntry, mActiveControl As Object
Dim fcmbEmpName As frmFlexSearchList, fcmbItmName As frmFlexSearchList
Dim mMpkDate_old As Date, mMpkItmCode_old As Long, mMpkItmQty_old As Double, mMpkPerBoxItmQty_old As Double

' StockJrn transaction detail grid Mfgrd2 column definitions
Const X2MPKICODE_COL = 0
Const X2MPKDATE_COL = 1
Const X2EMPNAME_COL = 2
Const X2ITMNAME_COL = 3
Const X2MPKBOXQTY_COL = 4
Const X2MPKPERBOXITMQTY_COL = 5
Const X2MPKITMQTY_COL = 6
Const X2BALQTYFORPACK_COL = 7
Const X2BALQTYFORDISP_COL = 8
Const X2MPKCODE_COL = 9
Const X2MPKSNO_COL = 10
Const X2MPKEMPCODE_COL = 11
Const X2MPKITMCODE_COL = 12
Const X2MPKSTKCODE_COL = 13
Const X2MPKSTKICODEIS_COL = 14
Const X2MPKSTKICODERC_COL = 15
Const X2MPKRECSTATE_COL = 16
Const MFGRD2_COLS = 17

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
    dtpMpkDate1.SetFocus
Else
    Unload Me
End If

End Sub

Private Sub cmdOK_Click()
Dim MPKRecset As New ADODB.Recordset, MPK_LogRS As New ADODB.Recordset
Dim srow As Long, mMpkStkCode As Long, mMpkStkICodeIs As Long, mMpkStkICodeRc As Long, mMpkCode As Long, mMpkICode As Long, mMpkSno As Long, mStkItmRefCode As Long

srow = Mfgrd2.Row
If dtlAddMode = True Then
    mMpkCode = GetNextSeqno(dbTlgDatabase, "MatPacking", "MpkCode")
    mMpkStkCode = clsSTK.ActiveStkCode
Else
    mMpkCode = Val(Mfgrd2.TextMatrix(srow, X2MPKCODE_COL))
    mMpkStkCode = Val(Mfgrd2.TextMatrix(srow, X2MPKSTKCODE_COL))
    mMpkICode = Val(Mfgrd2.TextMatrix(srow, X2MPKICODE_COL))
    mMpkStkICodeIs = Val(Mfgrd2.TextMatrix(srow, X2MPKSTKICODEIS_COL))
    mMpkStkICodeRc = Val(Mfgrd2.TextMatrix(srow, X2MPKSTKICODERC_COL))
End If
If dtlEditCanceled = False Then
    Call ValidDtl
End If
If cmdOK.Caption = "&OK" And dtlEditCanceled = False Then
    Rem addnew/update -------------------------
    Rem MatPacking section
    dbTlgDatabase.BeginTrans
    With MPKRecset
    If dtlAddMode = True Then
        mMpkSno = GetNextSeqno(dbTlgDatabase, "MatPacking", "MpkSno", "MpkCode" = CStr(mMpkCode))
        
        MPKRecset.Open "Select * from MatPacking where MpkCode=" & CStr(mMpkCode) & "", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        .AddNew
        Rem .Fields("MpkICode") = AutoNumber
        .Fields("MpkCode") = mMpkCode
        .Fields("MpkSno") = mMpkSno
    Else
        MPKRecset.Open "Select * from MatPacking where MpkCode=" & CStr(mMpkCode) & " and MpkICode=" & CStr(mMpkICode) & "", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    End If
    .Fields("MpkDate") = Ctod(dtpMpkDate.Text)
    .Fields("MpkEmpCode") = Val(fcmbEmpName.BoundText)
    .Fields("MpkItmCode") = Val(fcmbItmName.BoundText)
    .Fields("MpkItmRefCode") = 0
    .Fields("MpkBoxQty") = Val(UnMyNumFmt(mskMpkBoxQty.Text))
    .Fields("MpkPerBoxItmQty") = Val(UnMyNumFmt(mskMpkPerBoxItmQty.Text))
    .Fields("MpkItmQty") = Val(UnMyNumFmt(mskMpkItmQty.Text))
    .Fields("MpkNarr") = ""
    .Fields("MpkRecState") = ChkEditRecStatus(.Fields("MpkRecState"))
    .Update
    mMpkICode = .Fields("MpkICode")
    End With
    dbTlgDatabase.CommitTrans
    CloseTable MPKRecset
    
    Rem StockJrn section
    clsSTK.Clear
    If dtlAddMode = True Then
        Rem issue stock
        clsSTK.mStkDate_dt = Ctod(dtpMpkDate.Text)
        clsSTK.mStkItmCode_lng = Val(fcmbItmName.BoundText)
        clsSTK.mStkItmRefCode_lng = 0
        clsSTK.mStkQty_dbl = ToIssueQty(Val(UnMyNumFmt(mskMpkItmQty.Text)))
        clsSTK.mStkRate_dbl = 0
        clsSTK.mStkValue_dbl = 0
        clsSTK.mStkNarr_str = ""
        clsSTK.mStkRecState_int = cREC_NEW
        clsSTK.mStkLItmCode_lng = 0
        
        clsSTK.AddNew mMpkStkCode
        mMpkStkICodeIs = clsSTK.mStkICode_lng
        
        Rem receipt stock
        clsSTK.mStkSno_int = 0
        clsSTK.mStkQty_dbl = ToRcptQty(Val(UnMyNumFmt(mskMpkItmQty.Text)))
        
        clsSTK.AddNew mMpkStkCode, mNewItemRef:=True
        mMpkStkICodeRc = clsSTK.mStkICode_lng
        mStkItmRefCode = clsSTK.mStkItmRefCode_lng
        
        Rem StockJrn Common entry
        clsSTK.mStkSno_int = -1
        clsSTK.mStkItmCode_lng = 0
        clsSTK.mStkItmRefCode_lng = 0
        clsSTK.mStkQty_dbl = 0
        clsSTK.mStkNarr_str = "Material Assembling (Packing)"
        clsSTK.AddNew mMpkStkCode
    Else
        Rem issue stock
        clsSTK.GetData mMpkStkCode, mMpkStkICodeIs
        clsSTK.mStkDate_dt = Ctod(dtpMpkDate.Text)
        clsSTK.mStkItmCode_lng = Val(fcmbItmName.BoundText)
        clsSTK.mStkItmRefCode_lng = 0
        clsSTK.mStkQty_dbl = ToIssueQty(Val(UnMyNumFmt(mskMpkItmQty.Text)))
        clsSTK.mStkRate_dbl = 0
        clsSTK.mStkValue_dbl = 0
        clsSTK.mStkNarr_str = ""
        clsSTK.Update mMpkStkCode, mMpkStkICodeIs
        
        Rem receipt stock
        clsSTK.GetData mMpkStkCode, mMpkStkICodeRc
        clsSTK.mStkDate_dt = Ctod(dtpMpkDate.Text)
        clsSTK.mStkItmCode_lng = Val(fcmbItmName.BoundText)
        Rem clsSTK.mStkItmRefCode_lng = 0
        clsSTK.mStkQty_dbl = ToRcptQty(Val(UnMyNumFmt(mskMpkItmQty.Text)))
        clsSTK.mStkRate_dbl = 0
        clsSTK.mStkValue_dbl = 0
        clsSTK.mStkNarr_str = ""
        If mMpkItmCode_old <> clsSTK.mStkItmCode_lng Or clsSTK.mStkItmRefCode_lng = 0 Then
            clsSTK.Update mMpkStkCode, mMpkStkICodeRc, mNewItemRef:=True
        Else
            clsSTK.Update mMpkStkCode, mMpkStkICodeRc
        End If
        mStkItmRefCode = clsSTK.mStkItmRefCode_lng
        
        Rem StockJrn common entry
        clsSTK.GetData mMpkStkCode, 0, -1
        clsSTK.mStkDate_dt = Ctod(dtpMpkDate.Text)
        clsSTK.mStkItmCode_lng = 0
        clsSTK.mStkItmRefCode_lng = 0
        clsSTK.mStkQty_dbl = 0
        clsSTK.mStkRate_dbl = 0
        clsSTK.mStkValue_dbl = 0
        clsSTK.mStkNarr_str = "Material Assembling (Packing)"
        
        clsSTK.Update mMpkStkCode, clsSTK.mStkICode_lng
    End If
    
    Rem update stock ----------------------------------------
    Rem MatPacking updation
    dbTlgDatabase.BeginTrans
    MPKRecset.Open "Select * from MatPacking where MpkCode=" & CStr(mMpkCode) & " order by MpkICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    With MPKRecset
    If .RecordCount > 0 Then
        .MoveFirst
        Do While .EOF = False
            If InList(.Fields("MpkRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
                If dtlAddMode = True Then
                    .Fields("MpkStkCode") = mMpkStkCode
                    .Fields("MpkStkICodeIs") = mMpkStkICodeIs
                    .Fields("MpkStkICodeRc") = mMpkStkICodeRc
                    .Fields("MpkItmRefCode") = mStkItmRefCode
                Else
                    .Fields("MpkItmRefCode") = mStkItmRefCode
                End If
                .Fields("MpkRecState") = cREC_UNCHANGED
                .Update
            Else
                .Fields("MpkRecState") = ChkDeleteRecStatus(.Fields("MpkRecState"))
                .Update
                .Delete
            End If
            
            .MoveNext
        Loop
    End If
    End With
    dbTlgDatabase.CommitTrans
    CloseTable MPKRecset
    
    Rem StockJrn updation
    clsSTK.CommitStock mMpkStkCode
    
    Rem EndStock routine ----------------------------------
    Rem MatPacking
    Data_RemoveLog mMpkCode
    
    Rem StockJrn
    clsSTK.EndStock mMpkStkCode
    
    Rem show record in flexgrid
    MPKRecset.Open "Select * from MatPacking where MpkCode=" & CStr(mMpkCode) & " and MpkICode=" & CStr(mMpkICode) & "", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    With MPKRecset
    clsEMP.GetData .Fields("MpkEmpCode")
    clsITM.GetData .Fields("MpkItmCode")
    
    Mfgrd2.TextMatrix(srow, X2MPKICODE_COL) = .Fields("MpkICode")
    Mfgrd2.TextMatrix(srow, X2MPKDATE_COL) = Dtoc(.Fields("MpkDate"))
    Mfgrd2.TextMatrix(srow, X2EMPNAME_COL) = clsEMP.mAhName_str
    Mfgrd2.TextMatrix(srow, X2ITMNAME_COL) = clsITM.mItmName_str
    Mfgrd2.TextMatrix(srow, X2MPKBOXQTY_COL) = ToMyNumFmt(.Fields("MpkBoxQty"), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2MPKPERBOXITMQTY_COL) = ToMyNumFmt(.Fields("MpkPerBoxItmQty"), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2MPKITMQTY_COL) = ToMyNumFmt(.Fields("MpkItmQty"), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2MPKCODE_COL) = .Fields("MpkCode")
    Mfgrd2.TextMatrix(srow, X2MPKSNO_COL) = .Fields("MpkSno")
    Mfgrd2.TextMatrix(srow, X2MPKEMPCODE_COL) = .Fields("MpkEmpCode")
    Mfgrd2.TextMatrix(srow, X2MPKITMCODE_COL) = .Fields("MpkItmCode")
    Mfgrd2.TextMatrix(srow, X2MPKSTKCODE_COL) = .Fields("MpkStkCode")
    Mfgrd2.TextMatrix(srow, X2MPKSTKICODEIS_COL) = .Fields("MpkStkICodeIs")
    Mfgrd2.TextMatrix(srow, X2MPKSTKICODERC_COL) = .Fields("MpkStkICodeRc")
    Mfgrd2.TextMatrix(srow, X2MPKRECSTATE_COL) = .Fields("MpkRecState")
    
    End With
    CloseTable MPKRecset
    
    If dtlAddMode = True Then
        Mfgrd2.Rows = Mfgrd2.Rows + 1
    End If
    srow = srow + 1
    Mfgrd2.Row = srow
Else
    Rem cance event -----------------------------------
    Rem MatPacking
    MPKRecset.Open "Select * from MatPacking where MpkCode=" & CStr(mMpkCode) & " order by MpkICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    MPK_LogRS.Open "Select * from MatPacking_Log where MpkCode=" & CStr(mMpkCode) & " order by MpkICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    
    dbTlgDatabase.BeginTrans
    With MPKRecset
    If .RecordCount > 0 Then
        .MoveFirst
        Do While .EOF = False
            Rem stock updation is not required because balance is updated on CommitStock and not on individual item save, hence no need to revert is back
            MPK_LogRS.Find "MpkICode=" & CStr(.Fields("MpkICode")), Start:=1
            If MPK_LogRS.EOF = False Then
                ' any prior updations can be made here
                .Fields("MpkSno") = MPK_LogRS.Fields("MpkSno")
                .Fields("MpkDate") = MPK_LogRS.Fields("MpkDate")
                .Fields("MpkEmpCode") = MPK_LogRS.Fields("MpkEmpCode")
                .Fields("MpkItmCode") = MPK_LogRS.Fields("MpkItmCode")
                .Fields("MpkItmRefCode") = MPK_LogRS.Fields("MpkItmRefCode")
                .Fields("MpkBoxQty") = MPK_LogRS.Fields("MpkBoxQty")
                .Fields("MpkPerBoxItmQty") = MPK_LogRS.Fields("MpkPerBoxItmQty")
                .Fields("MpkItmQty") = MPK_LogRS.Fields("MpkItmQty")
                .Fields("MpkNarr") = MPK_LogRS.Fields("MpkNarr")
                .Fields("MpkRecState") = MPK_LogRS.Fields("MpkRecState")
                .Update
            Else
                ' any prior updations can be made here
                .Fields("MpkRecState") = ChkDeleteRecStatus(.Fields("MpkRecState"))
                .Update
                .Delete
            End If
            
            .MoveNext
        Loop
    End If
    End With
    dbTlgDatabase.CommitTrans
    CloseTable MPKRecset
    CloseTable MPK_LogRS
    
    Rem StockJrn
    clsSTK.CancelStock mMpkStkCode
    
    Rem EndStock --------------------------------------------------
    Rem MatPacking
    Data_RemoveLog mMpkCode
    
    Rem StockJrn
    clsSTK.EndStock mMpkStkCode
    
End If
dtlAddEditMode = False
dtlAddMode = False
dtlEditCanceled = False
Call VisibleControls(False)
Call RefreshBalQty
Mfgrd2.SetFocus
GoTo EndSub
Exit Sub

EndSub:
Set MPKRecset = Nothing
Set MPK_LogRS = Nothing

End Sub

Private Sub cmdShowDtlData_Click()
Dim tRecset As New ADODB.Recordset, srow As Long, cnt As Integer
srow = 1

tRecset.Open "Select * from MatPacking" _
    & " where MpkDate between #" & CStr(ToSysDate(Ctod(dtpMpkDate1.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpMpkDate2.Text))) & "#" _
    & IIf(Val(fcmbEmpName.BoundText) > 0, " and MpkEmpCode=" & CStr(Val(fcmbEmpName.BoundText)), "") _
    & IIf(Val(fcmbItmName.BoundText) > 0, " and MpkItmCode=" & CStr(Val(fcmbItmName.BoundText)), "") _
    & " order by MpkDate,MpkICode" _
    , dbTlgDatabase, adOpenKeyset, adLockOptimistic
With tRecset
If .RecordCount > 0 Then
    Do While .EOF = False
        clsEMP.GetData .Fields("MpkEmpCode")
        clsITM.GetData .Fields("MpkItmCode")
        
        Mfgrd2.TextMatrix(srow, X2MPKICODE_COL) = .Fields("MpkICode")
        Mfgrd2.TextMatrix(srow, X2MPKDATE_COL) = Dtoc(.Fields("MpkDate"))
        Mfgrd2.TextMatrix(srow, X2EMPNAME_COL) = clsEMP.mAhName_str
        Mfgrd2.TextMatrix(srow, X2ITMNAME_COL) = clsITM.mItmName_str
        Mfgrd2.TextMatrix(srow, X2MPKBOXQTY_COL) = ToMyNumFmt(.Fields("MpkBoxQty"), mDecimals:=0)
        Mfgrd2.TextMatrix(srow, X2MPKPERBOXITMQTY_COL) = ToMyNumFmt(.Fields("MpkPerBoxItmQty"), mDecimals:=0)
        Mfgrd2.TextMatrix(srow, X2MPKITMQTY_COL) = ToMyNumFmt(.Fields("MpkItmQty"), mDecimals:=0)
        Mfgrd2.TextMatrix(srow, X2MPKCODE_COL) = .Fields("MpkCode")
        Mfgrd2.TextMatrix(srow, X2MPKSNO_COL) = .Fields("MpkSno")
        Mfgrd2.TextMatrix(srow, X2MPKEMPCODE_COL) = .Fields("MpkEmpCode")
        Mfgrd2.TextMatrix(srow, X2MPKITMCODE_COL) = .Fields("MpkItmCode")
        Mfgrd2.TextMatrix(srow, X2MPKSTKCODE_COL) = .Fields("MpkStkCode")
        Mfgrd2.TextMatrix(srow, X2MPKSTKICODEIS_COL) = .Fields("MpkStkICodeIs")
        Mfgrd2.TextMatrix(srow, X2MPKSTKICODERC_COL) = .Fields("MpkStkICodeRc")
        Mfgrd2.TextMatrix(srow, X2MPKRECSTATE_COL) = .Fields("MpkRecState")
        Rem calculate balance quantity
        Mfgrd2.TextMatrix(srow, X2BALQTYFORPACK_COL) = ToMyNumFmt(GetBalQtyForPack(mAddEditMode:=False, srow:=srow), mDecimals:=0)
        Mfgrd2.TextMatrix(srow, X2BALQTYFORDISP_COL) = ToMyNumFmt(GetBalQtyForDisp(mAddEditMode:=False, srow:=srow), mDecimals:=0)
        
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

Private Sub dtpMpkDate_GotFocus()
FlashActiveControl dtpMpkDate, True
End Sub

Private Sub dtpMpkDate_LostFocus()
FlashActiveControl dtpMpkDate, False
End Sub

Private Sub dtpMpkDate_Validate(Cancel As Boolean)
dtpMpkDate.Text = ToMyDate(dtpMpkDate.Text)
If IsFinYrDate(Ctod(dtpMpkDate.Text)) = False Then
    ErrorBox "Invalid Date !!!"
    dtpMpkDate.SetFocus
    FlashActiveControl dtpMpkDate, True
    Cancel = True
End If
Call ValidDtl

End Sub

Private Sub dtpMpkDate1_GotFocus()
FlashActiveControl dtpMpkDate1, True
End Sub

Private Sub dtpMpkDate1_LostFocus()
FlashActiveControl dtpMpkDate1, False

End Sub

Private Sub dtpMpkDate1_Validate(Cancel As Boolean)
dtpMpkDate1.Text = ToMyDate(dtpMpkDate1.Text)
If IsFinYrDate(Ctod(dtpMpkDate1.Text)) = False Then
    ErrorBox "Invalid Date !!!"
    dtpMpkDate1.SetFocus
    FlashActiveControl dtpMpkDate1, True
    Cancel = True
Else
    dtpMpkDate2.Text = dtpMpkDate1.Text
End If

End Sub

Private Sub dtpMpkDate2_GotFocus()
FlashActiveControl dtpMpkDate2, True
End Sub

Private Sub dtpMpkDate2_LostFocus()
FlashActiveControl dtpMpkDate2, False
End Sub

Private Sub dtpMpkDate2_Validate(Cancel As Boolean)
dtpMpkDate2.Text = ToMyDate(dtpMpkDate2.Text)
If IsFinYrDate(Ctod(dtpMpkDate2.Text)) = False Then
    ErrorBox "Invalid Date !!!"
    dtpMpkDate2.SetFocus
    FlashActiveControl dtpMpkDate2, True
    Cancel = True
Else
    If Ctod(dtpMpkDate1.Text) > Ctod(dtpMpkDate2.Text) Then
        dtpMpkDate1.Text = dtpMpkDate2.Text
    End If
End If

End Sub

Private Sub Form_Activate()
If mFormLoaded = False Then
    dtpMpkDate1.Text = Dtoc(DefaultEntryDate)
    dtpMpkDate2.Text = Dtoc(DefaultEntryDate)
    dtpMpkDate1.SetFocus
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
mskMpkItmQty.Enabled = False
mskBalQtyForPack.Enabled = False
mskBalQtyForDisp.Enabled = False

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

Set fcmbEmpName = New frmFlexSearchList
Set fcmbEmpName.dbAcDatabase = dbAcDatabase
Set fcmbEmpName.dbComDatabase = dbComDatabase
Set fcmbEmpName.frmAccessMaster = New frmEmployeeMast
fcmbEmpName.mPackPerList = True
Load fcmbEmpName

Set fcmbItmName = New frmFlexSearchList
Set fcmbItmName.dbStDatabase = dbStDatabase
Set fcmbItmName.frmAccessMaster = New frmItemMast
fcmbItmName.mProdMastList = True
Load fcmbItmName

Mfgrd2.Rows = 2: Mfgrd2.FixedRows = 1: Mfgrd2.Cols = MFGRD2_COLS: Mfgrd2.FixedCols = 0
colcnt = X2MPKICODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2MPKICODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2MPKDATE_COL: Mfgrd2.ColWidth(colcnt) = dtpMpkDate.Width: Mfgrd2.TextMatrix(0, colcnt) = "Date": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2EMPNAME_COL: Mfgrd2.ColWidth(colcnt) = txtEmpName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Person Name": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2ITMNAME_COL: Mfgrd2.ColWidth(colcnt) = txtItmName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Material": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2MPKBOXQTY_COL: Mfgrd2.ColWidth(colcnt) = mskMpkBoxQty.Width: Mfgrd2.TextMatrix(0, colcnt) = "Box Qty.": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2MPKPERBOXITMQTY_COL: Mfgrd2.ColWidth(colcnt) = mskMpkPerBoxItmQty.Width: Mfgrd2.TextMatrix(0, colcnt) = "Per Box Qty.": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2MPKITMQTY_COL: Mfgrd2.ColWidth(colcnt) = mskMpkItmQty.Width: Mfgrd2.TextMatrix(0, colcnt) = "Total Qty.": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BALQTYFORPACK_COL: Mfgrd2.ColWidth(colcnt) = mskBalQtyForPack.Width: Mfgrd2.TextMatrix(0, colcnt) = "Prodn.Bal.": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BALQTYFORDISP_COL: Mfgrd2.ColWidth(colcnt) = mskBalQtyForDisp.Width: Mfgrd2.TextMatrix(0, colcnt) = "Packed Bal.": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2MPKCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2MPKCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2MPKSNO_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2MPKSNO_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2MPKEMPCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2MPKEMPCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2MPKITMCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2MPKITMCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2MPKSTKCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2MPKSTKCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2MPKSTKICODEIS_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2MPKSTKICODEIS_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2MPKSTKICODERC_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2MPKSTKICODERC_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2MPKRECSTATE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2MPKRECSTATE_COL": Mfgrd2.ColAlignment(colcnt) = 1

colcnt = X2MPKDATE_COL: dtpMpkDate.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2EMPNAME_COL: txtEmpName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2ITMNAME_COL: txtItmName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2MPKBOXQTY_COL: mskMpkBoxQty.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2MPKPERBOXITMQTY_COL: mskMpkPerBoxItmQty.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2MPKITMQTY_COL: mskMpkItmQty.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2BALQTYFORPACK_COL: mskBalQtyForPack.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2BALQTYFORDISP_COL: mskBalQtyForDisp.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)

cmdOK.Left = mskMpkItmQty.Left + mskMpkItmQty.Width - cmdOK.Width

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
Unload fcmbEmpName
Unload fcmbItmName
Set fcmbEmpName = Nothing
Set fcmbItmName = Nothing

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
Dim MPKRecset As New ADODB.Recordset
Dim srow As Long, mDeleteit As Boolean, mMpkStkCode As Long, mMpkCode As Long
If Mfgrd2.Row = FlexNewRow(Mfgrd2) Then
    GoTo EndSub
End If
srow = Mfgrd2.Row
mMpkStkCode = Val(Mfgrd2.TextMatrix(srow, X2MPKSTKCODE_COL))
mMpkCode = Val(Mfgrd2.TextMatrix(srow, X2MPKCODE_COL))

mDeleteit = True

If mDeleteit = True Then
    Rem while deleting inheritence check is not important
    Rem mDeleteit = ChkMpkItmQty_In(mAddEditMode:=False)
End If
If mDeleteit = True Then
    mDeleteit = ChkMpkItmQty_Out(mAddEditMode:=False)
End If
If mDeleteit = True Then
    mDeleteit = CanDelete()
End If
If mDeleteit = True Then
    Rem begin transaction --------------------------
    Data_CreateLog mMpkCode
    clsSTK.BeginStock mMpkStkCode
    
    Rem delete transaction ------------------------------
    Rem MatPacking
    dbTlgDatabase.BeginTrans
    With MPKRecset
    .Open "Select * from MatPacking where MpkCode=" & CStr(mMpkCode) & " order by MpkICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount > 0 Then
        .MoveFirst
        Do While .EOF = False
            .Fields("MpkRecState") = ChkDeleteRecStatus(.Fields("MpkRecState"))
            .Update
            Rem marked for deletion only, physically deleted in CommitStock
            .MoveNext
        Loop
    End If
    End With
    dbTlgDatabase.CommitTrans
    CloseTable MPKRecset
    
    Rem StockJrn
    clsSTK.DeleteStock mMpkStkCode
    
    Rem update transaction --------------------------------------
    Rem MatPacking
    dbTlgDatabase.BeginTrans
    MPKRecset.Open "Select * from MatPacking where MpkCode=" & CStr(mMpkCode) & " order by MpkICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    With MPKRecset
    If .RecordCount > 0 Then
        .MoveFirst
        Do While .EOF = False
            If InList(.Fields("MpkRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
                .Fields("MpkRecState") = cREC_UNCHANGED
                .Update
            Else
                .Fields("MpkRecState") = ChkDeleteRecStatus(.Fields("MpkRecState"))
                .Update
                .Delete
            End If
            
            .MoveNext
        Loop
    End If
    End With
    dbTlgDatabase.CommitTrans
    CloseTable MPKRecset
    
    Rem StockJrn
    clsSTK.CommitStock mMpkStkCode
    
    Rem end transaction -----------------------------------------
    Data_RemoveLog mMpkCode
    clsSTK.EndStock mMpkStkCode
    
    RemoveFlexRow Mfgrd2, srow
    Call RefreshBalQty
    Mfgrd2.Row = srow
    Mfgrd2.SetFocus
Else
    Mfgrd2.SetFocus
End If

EndSub:
Set MPKRecset = Nothing
Exit Sub

End Sub

Private Sub Mfgrd2_KeyPress(KeyAscii As Integer)
Dim srow As Integer, mMpkStkCode As Long, mMpkCode As Long

If KeyAscii = vbKeyReturn Then
    srow = Mfgrd2.Row
    mMpkStkCode = Val(Mfgrd2.TextMatrix(srow, X2MPKSTKCODE_COL))
    mMpkCode = Val(Mfgrd2.TextMatrix(srow, X2MPKCODE_COL))
    
    dtlAddEditMode = True
    dtlAddMode = (srow = FlexNewRow(Mfgrd2))
    VisibleControls True, Mfgrd2.Top + Mfgrd2.RowPos(Mfgrd2.Row)
    If dtlAddMode = True Then
        If clsSTK.BeginStock(0) = False Then
            GoTo EndSub
        End If
        mMpkCode = GetNextSeqno(dbTlgDatabase, "MatPacking", "MpkCode")
        Data_CreateLog mMpkCode
        
        Call ChkDefaultValues
        FormAddEditMode = cFORM_ADDMODE
    Else
        If clsSTK.BeginStock(mMpkStkCode) = False Then
            GoTo EndSub
        End If
        Data_CreateLog mMpkCode
        
        dtpMpkDate.Text = Mfgrd2.TextMatrix(srow, X2MPKDATE_COL)
        fcmbEmpName.BoundText = Mfgrd2.TextMatrix(srow, X2MPKEMPCODE_COL): txtEmpName.Text = fcmbEmpName.Text
        fcmbItmName.BoundText = Mfgrd2.TextMatrix(srow, X2MPKITMCODE_COL): txtItmName.Text = fcmbItmName.Text
        mskMpkBoxQty.Text = Mfgrd2.TextMatrix(srow, X2MPKBOXQTY_COL)
        mskMpkPerBoxItmQty.Text = Mfgrd2.TextMatrix(srow, X2MPKPERBOXITMQTY_COL)
        mskMpkItmQty.Text = Mfgrd2.TextMatrix(srow, X2MPKITMQTY_COL)
        mskBalQtyForPack.Text = Mfgrd2.TextMatrix(srow, X2BALQTYFORPACK_COL)
        mskBalQtyForDisp.Text = Mfgrd2.TextMatrix(srow, X2BALQTYFORDISP_COL)
        
        FormAddEditMode = cFORM_EDITMODE
    End If
    mMpkDate_old = Ctod(dtpMpkDate.Text)
    mMpkItmCode_old = Val(fcmbItmName.BoundText)
    mMpkItmQty_old = Val(UnMyNumFmt(mskMpkItmQty.Text))
    mMpkPerBoxItmQty_old = Val(UnMyNumFmt(mskMpkPerBoxItmQty.Text))
    
    dtpMpkDate.SetFocus
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
    dtpMpkDate.Top = mRowPos
    txtEmpName.Top = mRowPos
    txtItmName.Top = mRowPos
    mskMpkBoxQty.Top = mRowPos
    mskMpkPerBoxItmQty.Top = mRowPos
    mskMpkItmQty.Top = mRowPos
    mskBalQtyForPack.Top = mRowPos
    mskBalQtyForDisp.Top = mRowPos
    cmdOK.Top = mRowPos + mskMpkItmQty.Height
End If

dtpMpkDate.Text = Dtoc(DefaultEntryDate)
fcmbEmpName.BoundText = "": txtEmpName.Text = fcmbEmpName.Text
fcmbItmName.BoundText = "": txtItmName.Text = fcmbItmName.Text
mskMpkBoxQty.Text = ToMyNumFmt(0, mDecimals:=0)
mskMpkPerBoxItmQty.Text = ToMyNumFmt(0, mDecimals:=0)
mskMpkItmQty.Text = ToMyNumFmt(0, mDecimals:=0)
mskBalQtyForPack.Text = ToMyNumFmt(0, mDecimals:=0)
mskBalQtyForDisp.Text = ToMyNumFmt(0, mDecimals:=0)

Call ValidDtl

dtpMpkDate.Visible = mShowItem
txtEmpName.Visible = mShowItem
txtItmName.Visible = mShowItem
mskMpkBoxQty.Visible = mShowItem
mskMpkPerBoxItmQty.Visible = mShowItem
mskMpkItmQty.Visible = mShowItem
mskBalQtyForPack.Visible = mShowItem
mskBalQtyForDisp.Visible = mShowItem
cmdOK.Visible = mShowItem

Rem list of header and grid controls are common so resetting it to header values after addition/editing ends
If mShowItem = False Then
    fcmbEmpName.Text = txtEmpName1.Text: txtEmpName1.Text = fcmbEmpName.Text
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
mDataOk = (IsFinYrDate(Ctod(dtpMpkDate.Text)) = True And Val(fcmbEmpName.BoundText) > 0 And Val(fcmbItmName.BoundText) > 0 And Val(UnMyNumFmt(mskMpkBoxQty.Text)) > 0 And Val(UnMyNumFmt(mskMpkPerBoxItmQty.Text)) > 0 And Val(UnMyNumFmt(mskMpkItmQty.Text)) > 0)
If mDataOk = True And InterActiveChange(cmdOK) = True Then
    mDataOk = (ChkMpkItmQty_In(mAddEditMode:=True) = True)
End If
If mDataOk = True And InterActiveChange(cmdOK) = True Then
    mDataOk = (ChkMpkItmQty_Out(mAddEditMode:=True) = True)
End If
If mDataOk = True Then
    mskBalQtyForPack.Text = ToMyNumFmt(GetBalQtyForPack(mAddEditMode:=True, srow:=Mfgrd2.Row), mDecimals:=0)
    mskBalQtyForDisp.Text = ToMyNumFmt(GetBalQtyForDisp(mAddEditMode:=True, srow:=Mfgrd2.Row), mDecimals:=0)
End If

cmdOK.Caption = IIf(mDataOk = True, "&OK", "&Cancel")
cmdOK.BackColor = IIf(mDataOk = True, &H80FF80, &H8080FF)

End Sub

Private Sub mskMpkBoxQty_GotFocus()
FlashActiveControl mskMpkBoxQty, True
End Sub

Private Sub mskMpkBoxQty_LostFocus()
FlashActiveControl mskMpkBoxQty, False
End Sub

Private Sub mskMpkBoxQty_Validate(Cancel As Boolean)
mskMpkBoxQty.Text = ToMyNumFmt(mskMpkBoxQty.Text, mDecimals:=0)
If Val(mskMpkBoxQty.Text) <= 0 Then
    ErrorBox "Invalid Box Qty. !!!"
    Cancel = True
    mskMpkBoxQty.SetFocus
End If
Call CalcItmQty
If Cancel = False Then
    If ChkMpkItmQty_In(mAddEditMode:=True) = False Then
        Rem no action but just message
    Else
        If ChkMpkItmQty_Out(mAddEditMode:=True) = False Then
            Rem only message
        End If
    End If
End If
Call ValidDtl
End Sub

Private Sub mskMpkItmQty_GotFocus()
FlashActiveControl mskMpkItmQty, True
End Sub

Private Sub mskMpkItmQty_LostFocus()
FlashActiveControl mskMpkItmQty, False
End Sub

Private Sub mskMpkItmQty_Validate(Cancel As Boolean)
mskMpkItmQty.Text = ToMyNumFmt(mskMpkItmQty.Text, mDecimals:=0)
If Val(UnMyNumFmt(mskMpkItmQty.Text)) <= 0 Then
    ErrorBox "Invalid Total Qty. !!!"
    mskMpkItmQty.SetFocus
    Cancel = True
End If
Call CalcItmQty
If Cancel = False Then
    If ChkMpkItmQty_In(mAddEditMode:=True) = False Then
        Rem no action but message only
    Else
        If ChkMpkItmQty_Out(mAddEditMode:=True) = False Then
            Rem only message
        End If
    End If
End If
Call ValidDtl

End Sub

Rem packing cannot be greater than production qty
Private Function ChkMpkItmQty_In(ByVal mAddEditMode As Boolean) As Boolean
Dim tRecset As New ADODB.Recordset, mPdnFinOutQty_sum As Double, mMpkItmQty_sum As Double, mBalQty As Double
Dim mMaxChkDate As Date, mLoopMpkDate As Date
Dim mMpkDate As Date, mMpkItmCode As Long, mMpkItmQty As Double, mMpkPerBoxItmQty As Double
Dim mMpkICode As Long, srow As Long

Rem control values will be assigned just below and not anywhere in procedural section
srow = Mfgrd2.Row
If mAddEditMode = True Then
    mMpkDate = Ctod(dtpMpkDate.Text)
    mMpkItmCode = Val(fcmbItmName.BoundText)
    mMpkItmQty = Val(UnMyNumFmt(mskMpkItmQty.Text))
    mMpkPerBoxItmQty = Val(UnMyNumFmt(mskMpkPerBoxItmQty.Text))
Else
    Rem value assignment as done for add edit mode (keypress)
    mMpkDate = Ctod(Mfgrd2.TextMatrix(srow, X2MPKDATE_COL))
    mMpkItmCode = Val(Mfgrd2.TextMatrix(srow, X2MPKITMCODE_COL))
    mMpkItmQty = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2MPKITMQTY_COL)))
    mMpkPerBoxItmQty = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2MPKPERBOXITMQTY_COL)))
    
    Rem old value assignment as done for add edit mode (keypress)
    mMpkDate_old = mMpkDate
    mMpkItmCode_old = mMpkItmCode
    mMpkItmQty_old = mMpkItmQty
    mMpkPerBoxItmQty_old = mMpkPerBoxItmQty
End If
mMpkICode = Val(Mfgrd2.TextMatrix(srow, X2MPKICODE_COL))

Rem assume that old entry has been deleted by ignoring existing entry and then check normally stock availability for packing from current date to end packing date
ChkMpkItmQty_In = True
With tRecset
.Open "Select top 1 * from MatPacking order by MpkDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    mMaxChkDate = .Fields("MpkDate")
Else
    mMaxChkDate = mMpkDate
End If
End With
CloseTable tRecset

mMaxChkDate = IIf(mMpkDate > mMaxChkDate, mMpkDate, mMaxChkDate)
For mLoopMpkDate = mMpkDate To mMaxChkDate
    mPdnFinOutQty_sum = 0: mMpkItmQty_sum = 0
    
    tRecset.Open "Select sum(PdnFinOutQty) as PdnFinOutQty_sum from MacProdn where PdnItmCode=" & CStr(mMpkItmCode) & " and PdnDate<=#" & CStr(ToSysDate(mLoopMpkDate)) & "#" & " group by PdnItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.RecordCount > 0 Then
        mPdnFinOutQty_sum = tRecset.Fields("PdnFinOutQty_sum")
    End If
    CloseTable tRecset
    
    tRecset.Open "Select sum(MpkItmQty) as MpkItmQty_sum from MatPacking where MpkItmCode=" & CStr(mMpkItmCode) & " and MpkDate<=#" & CStr(ToSysDate(mLoopMpkDate)) & "#" & IIf(dtlAddMode = False, " and MpkICode<>" & CStr(mMpkICode), "") & " group by MpkItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.RecordCount > 0 Then
        mMpkItmQty_sum = tRecset.Fields("MpkItmQty_sum")
    End If
    CloseTable tRecset
    
    mBalQty = mPdnFinOutQty_sum - mMpkItmQty_sum - mMpkItmQty
    
    If mBalQty < 0 Then
        ErrorBox "Excess Packing Qty over Production Qty is " & ToMyNumFmt(mBalQty, mDecimals:=0, mUseAbs:=True) & " on dated " & Dtoc(mLoopMpkDate) & " !!!"
        ChkMpkItmQty_In = False
        Exit For
    End If
Next mLoopMpkDate

End Function

Private Function GetBalQtyForPack(ByVal mAddEditMode As Boolean, ByVal srow As Long) As Double
Dim tRecset As New ADODB.Recordset, mPdnFinOutQty_sum As Double, mMpkItmQty_sum As Double, mBalQty As Double
Dim mMpkDate As Date, mMpkItmCode As Long, mMpkItmQty As Double, mMpkPerBoxItmQty As Double
Dim mMpkICode As Long

Rem control values will be assigned just below and not anywhere in procedural section
If mAddEditMode = True Then
    mMpkDate = Ctod(dtpMpkDate.Text)
    mMpkItmCode = Val(fcmbItmName.BoundText)
    mMpkItmQty = Val(UnMyNumFmt(mskMpkItmQty.Text))
    mMpkPerBoxItmQty = Val(UnMyNumFmt(mskMpkPerBoxItmQty.Text))
Else
    Rem value assignment as done for add edit mode (keypress)
    mMpkDate = Ctod(Mfgrd2.TextMatrix(srow, X2MPKDATE_COL))
    mMpkItmCode = Val(Mfgrd2.TextMatrix(srow, X2MPKITMCODE_COL))
    mMpkItmQty = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2MPKITMQTY_COL)))
    mMpkPerBoxItmQty = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2MPKPERBOXITMQTY_COL)))
End If
mMpkICode = Val(Mfgrd2.TextMatrix(srow, X2MPKICODE_COL))

mPdnFinOutQty_sum = 0: mMpkItmQty_sum = 0

tRecset.Open "Select sum(PdnFinOutQty) as PdnFinOutQty_sum from MacProdn where PdnItmCode=" & CStr(mMpkItmCode) & " and PdnDate<=#" & CStr(ToSysDate(mMpkDate)) & "#" & " group by PdnItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
If tRecset.RecordCount > 0 Then
    mPdnFinOutQty_sum = tRecset.Fields("PdnFinOutQty_sum")
End If
CloseTable tRecset

tRecset.Open "Select sum(MpkItmQty) as MpkItmQty_sum from MatPacking where MpkItmCode=" & CStr(mMpkItmCode) & " and MpkDate<=#" & CStr(ToSysDate(mMpkDate)) & "#" & IIf(dtlAddMode = False, " and MpkICode<>" & CStr(mMpkICode), "") & " group by MpkItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
If tRecset.RecordCount > 0 Then
    mMpkItmQty_sum = tRecset.Fields("MpkItmQty_sum")
End If
CloseTable tRecset

mBalQty = mPdnFinOutQty_sum - mMpkItmQty_sum - mMpkItmQty

GetBalQtyForPack = mBalQty

End Function

Private Sub mskMpkPerBoxItmQty_GotFocus()
FlashActiveControl mskMpkPerBoxItmQty, True
End Sub

Private Sub mskMpkPerBoxItmQty_LostFocus()
FlashActiveControl mskMpkPerBoxItmQty, False
End Sub

Private Sub mskMpkPerBoxItmQty_Validate(Cancel As Boolean)
mskMpkPerBoxItmQty.Text = ToMyNumFmt(mskMpkPerBoxItmQty.Text, mDecimals:=0)
If Val(mskMpkPerBoxItmQty.Text) <= 0 Then
    ErrorBox "Invalid Per Box Qty. !!!"
    Cancel = True
    mskMpkPerBoxItmQty.SetFocus
End If
Call CalcItmQty
If Cancel = False Then
    If ChkMpkItmQty_In(mAddEditMode:=True) = False Then
        Rem no action but message only
    Else
        If ChkMpkItmQty_Out(mAddEditMode:=True) = False Then
            Rem only message
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
If Val(fcmbEmpName.BoundText) <= 0 Then
    ErrorBox "Invalid Person Name !!!"
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
    dtpMpkDate.Text = Mfgrd2.TextMatrix(srow, X2MPKDATE_COL)
    fcmbEmpName.BoundText = Mfgrd2.TextMatrix(srow, X2MPKEMPCODE_COL): txtEmpName.Text = fcmbEmpName.Text
    fcmbItmName.BoundText = Mfgrd2.TextMatrix(srow, X2MPKITMCODE_COL): txtItmName.Text = fcmbItmName.Text
Else
    dtpMpkDate.Text = dtpMpkDate1.Text
    fcmbEmpName.Text = txtEmpName1.Text: txtEmpName.Text = fcmbEmpName.Text
    fcmbItmName.Text = txtItmName1.Text: txtItmName.Text = fcmbItmName.Text
End If
mskMpkBoxQty.Text = ToMyNumFmt(0, mDecimals:=0)
mskMpkPerBoxItmQty.Text = ToMyNumFmt(0, mDecimals:=0)
mskMpkItmQty.Text = ToMyNumFmt(0, mDecimals:=0)

End Sub

Private Function Data_CreateLog(ByVal mMpkCode As Long) As Boolean
Dim MPK_LogRS As New ADODB.Recordset
Data_CreateLog = False

MPK_LogRS.Open "Select * from MatPacking_Log where MpkCode=" & CStr(mMpkCode) & "", dbTlgDatabase, adOpenKeyset, adLockOptimistic
With MPK_LogRS
If .RecordCount = 0 Then
    .Close
    Rem only ok records will be taken in log, because not ok records are created out of crashed entries which must be cleared when entry rejected
    dbTlgDatabase.BeginTrans
    dbTlgDatabase.Execute "Insert into MatPacking_Log Select * from MatPacking where MpkCode=" & CStr(mMpkCode) & " and MpkRecState=" & CStr(cREC_UNCHANGED) & ""
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
Set MPK_LogRS = Nothing
Exit Function

End Function

Private Function Data_RemoveLog(ByVal mMpkCode As Long) As Boolean
Data_RemoveLog = False

dbTlgDatabase.BeginTrans
dbTlgDatabase.Execute "Delete from MatPacking_Log where MpkCode=" & CStr(mMpkCode)
dbTlgDatabase.CommitTrans

Data_RemoveLog = True
End Function

Private Sub CalcItmQty()
mskMpkItmQty.Text = ToMyNumFmt(Val(UnMyNumFmt(mskMpkBoxQty.Text)) * Val(UnMyNumFmt(mskMpkPerBoxItmQty.Text)), mDecimals:=0)
End Sub

Rem material packing should not fall short for already dispatched material, and that too for upto current date as well for consequetive dates also
Private Function ChkMpkItmQty_Out(ByVal mAddEditMode As Boolean) As Boolean
Dim tRecset As New ADODB.Recordset, mMpkItmQty_sum As Double, mMdpItmQty_sum As Double, mBalQty As Double
Dim mMaxChkDate As Date, mLoopMpkDate As Date
Dim mMpkDate As Date, mMpkItmCode As Long, mMpkItmQty As Double, mMpkPerBoxItmQty As Double
Dim mMpkICode As Long, srow As Long

Rem control values will be assigned just below and not anywhere in procedural section
srow = Mfgrd2.Row
If mAddEditMode = True Then
    mMpkDate = Ctod(dtpMpkDate.Text)
    mMpkItmCode = Val(fcmbItmName.BoundText)
    mMpkItmQty = Val(UnMyNumFmt(mskMpkItmQty.Text))
    mMpkPerBoxItmQty = Val(UnMyNumFmt(mskMpkPerBoxItmQty.Text))
Else
    Rem value assignment as done for add edit mode (keypress)
    mMpkDate = Ctod(Mfgrd2.TextMatrix(srow, X2MPKDATE_COL))
    mMpkItmCode = Val(Mfgrd2.TextMatrix(srow, X2MPKITMCODE_COL))
    mMpkItmQty = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2MPKITMQTY_COL)))
    mMpkPerBoxItmQty = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2MPKPERBOXITMQTY_COL)))
    
    Rem old value assignment as done for add edit mode (keypress)
    mMpkDate_old = mMpkDate
    mMpkItmCode_old = mMpkItmCode
    mMpkItmQty_old = mMpkItmQty
    mMpkPerBoxItmQty_old = mMpkPerBoxItmQty
End If
mMpkICode = Val(Mfgrd2.TextMatrix(srow, X2MPKICODE_COL))

If mMpkItmCode_old <> mMpkItmCode Or mMpkPerBoxItmQty_old <> mMpkPerBoxItmQty Then
    Rem check stock availability for dispatch of old item stock by making quantity zero
    Rem checking of stock availability for dispatch of new item is not required because it is an addition to stock for dispatch
    
    ChkMpkItmQty_Out = True
    With tRecset
    .Open "Select top 1 * from MatDispatch order by MdpDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount > 0 Then
        mMaxChkDate = .Fields("MdpDate")
    Else
        mMaxChkDate = mMpkDate_old
    End If
    End With
    CloseTable tRecset
    
    mMaxChkDate = IIf(mMpkDate_old > mMaxChkDate, mMpkDate_old, mMaxChkDate)
    For mLoopMpkDate = mMpkDate_old To mMaxChkDate
        mMpkItmQty_sum = 0: mMdpItmQty_sum = 0
        
        tRecset.Open "Select sum(MpkItmQty) as MpkItmQty_sum from MatPacking where MpkItmCode=" & CStr(mMpkItmCode_old) & " and MpkDate<=#" & CStr(ToSysDate(mLoopMpkDate)) & "#" & " and MpkPerBoxItmQty=" & CStr(mMpkPerBoxItmQty_old) & "" & IIf(dtlAddMode = False, " and MpkICode<>" & CStr(mMpkICode), "") & " group by MpkItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mMpkItmQty_sum = tRecset.Fields("MpkItmQty_sum")
        End If
        CloseTable tRecset
        
        tRecset.Open "Select sum(MdpItmQty) as MdpItmQty_sum from MatDispatch where MdpItmCode=" & CStr(mMpkItmCode_old) & " and MdpDate<=#" & CStr(ToSysDate(mLoopMpkDate)) & "#" & " and MdpPerBoxItmQty=" & CStr(mMpkPerBoxItmQty_old) & " group by MdpItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mMdpItmQty_sum = tRecset.Fields("MdpItmQty_sum")
        End If
        CloseTable tRecset
        
        mBalQty = mMpkItmQty_sum - mMdpItmQty_sum    ''' - mMpkItmQty_old        ''' + mMpkItmQty do not add it here
        
        If mBalQty < 0 Then
            ErrorBox "Excess Dispatch Qty than Packing Qty is " & ToMyNumFmt(mBalQty, mDecimals:=0, mUseAbs:=True) & " on dated " & Dtoc(mLoopMpkDate) & " !!!"
            ChkMpkItmQty_Out = False
            Exit For
        End If
    Next mLoopMpkDate
ElseIf mMpkDate < mMpkDate_old Then
    Rem check stock availability for dispatch from new date to till end dispatch date
    
    ChkMpkItmQty_Out = True
    With tRecset
    .Open "Select top 1 * from MatDispatch order by MdpDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount > 0 Then
        mMaxChkDate = .Fields("MdpDate")
    Else
        mMaxChkDate = mMpkDate
    End If
    End With
    CloseTable tRecset
    
    mMaxChkDate = IIf(mMpkDate > mMaxChkDate, mMpkDate, mMaxChkDate)
    For mLoopMpkDate = mMpkDate To mMaxChkDate
        mMpkItmQty_sum = 0: mMdpItmQty_sum = 0
        
        tRecset.Open "Select sum(MpkItmQty) as MpkItmQty_sum from MatPacking where MpkItmCode=" & CStr(mMpkItmCode) & " and MpkDate<=#" & CStr(ToSysDate(mLoopMpkDate)) & "#" & " and MpkPerBoxItmQty=" & CStr(mMpkPerBoxItmQty) & "" & IIf(dtlAddMode = False, " and MpkICode<>" & CStr(mMpkICode), "") & " group by MpkItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mMpkItmQty_sum = tRecset.Fields("MpkItmQty_sum")
        End If
        CloseTable tRecset
        
        tRecset.Open "Select sum(MdpItmQty) as MdpItmQty_sum from MatDispatch where MdpItmCode=" & CStr(mMpkItmCode) & " and MdpDate<=#" & CStr(ToSysDate(mLoopMpkDate)) & "#" & " and MdpPerBoxItmQty=" & CStr(mMpkPerBoxItmQty) & " group by MdpItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mMdpItmQty_sum = tRecset.Fields("MdpItmQty_sum")
        End If
        CloseTable tRecset
        
        mBalQty = mMpkItmQty_sum - mMdpItmQty_sum + mMpkItmQty '''- mMpkItmQty_old + mMpkItmQty
        
        If mBalQty < 0 Then
            ErrorBox "Excess Dispatch Qty than Packing Qty is " & ToMyNumFmt(mBalQty, mDecimals:=0, mUseAbs:=True) & " on dated " & Dtoc(mLoopMpkDate) & " !!!"
            ChkMpkItmQty_Out = False
            Exit For
        End If
    Next mLoopMpkDate
ElseIf mMpkDate > mMpkDate_old Then
    Rem check stock availability for dispatch from old date (back date) to previous date of current date by making packing as zero
    Rem and then check stock availability for dispatch from new date to till end dispatch date by using packing qty
    
    ChkMpkItmQty_Out = True
    With tRecset
    .Open "Select top 1 * from MatDispatch order by MdpDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount > 0 Then
        mMaxChkDate = .Fields("MdpDate")
        If mMaxChkDate >= mMpkDate Then
            mMaxChkDate = mMpkDate - 1
        End If
    Else
        mMaxChkDate = mMpkDate_old
    End If
    End With
    CloseTable tRecset
    
    mMaxChkDate = IIf(mMpkDate_old > mMaxChkDate, mMpkDate_old, mMaxChkDate)
    For mLoopMpkDate = mMpkDate_old To mMaxChkDate
        mMpkItmQty_sum = 0: mMdpItmQty_sum = 0
        
        tRecset.Open "Select sum(MpkItmQty) as MpkItmQty_sum from MatPacking where MpkItmCode=" & CStr(mMpkItmCode) & " and MpkDate<=#" & CStr(ToSysDate(mLoopMpkDate)) & "#" & " and MpkPerBoxItmQty=" & CStr(mMpkPerBoxItmQty) & "" & IIf(dtlAddMode = False, " and MpkICode<>" & CStr(mMpkICode), "") & " group by MpkItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mMpkItmQty_sum = tRecset.Fields("MpkItmQty_sum")
        End If
        CloseTable tRecset
        
        tRecset.Open "Select sum(MdpItmQty) as MdpItmQty_sum from MatDispatch where MdpItmCode=" & CStr(mMpkItmCode) & " and MdpDate<=#" & CStr(ToSysDate(mLoopMpkDate)) & "#" & " and MdpPerBoxItmQty=" & CStr(mMpkPerBoxItmQty) & " group by MdpItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mMdpItmQty_sum = tRecset.Fields("MdpItmQty_sum")
        End If
        CloseTable tRecset
        
        mBalQty = mMpkItmQty_sum - mMdpItmQty_sum '''- mMpkItmQty_old    ''' + mMpkItmQty qty entry deleted
        
        If mBalQty < 0 Then
            ErrorBox "Excess Dispatch Qty than Packing Qty is " & ToMyNumFmt(mBalQty, mDecimals:=0, mUseAbs:=True) & " on dated " & Dtoc(mLoopMpkDate) & " !!!"
            ChkMpkItmQty_Out = False
            Exit For
        End If
    Next mLoopMpkDate
    
    If ChkMpkItmQty_Out = True Then
        With tRecset
        .Open "Select top 1 * from MatDispatch order by MdpDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If .RecordCount > 0 Then
            mMaxChkDate = .Fields("MdpDate")
        Else
            mMaxChkDate = mMpkDate
        End If
        End With
        CloseTable tRecset
        
        mMaxChkDate = IIf(mMpkDate > mMaxChkDate, mMpkDate, mMaxChkDate)
        For mLoopMpkDate = mMpkDate To mMaxChkDate
            mMpkItmQty_sum = 0: mMdpItmQty_sum = 0
            
            tRecset.Open "Select sum(MpkItmQty) as MpkItmQty_sum from MatPacking where MpkItmCode=" & CStr(mMpkItmCode) & " and MpkDate<=#" & CStr(ToSysDate(mLoopMpkDate)) & "#" & " and MpkPerBoxItmQty=" & CStr(mMpkPerBoxItmQty) & "" & IIf(dtlAddMode = False, " and MpkICode<>" & CStr(mMpkICode), "") & " group by MpkItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
            If tRecset.RecordCount > 0 Then
                mMpkItmQty_sum = tRecset.Fields("MpkItmQty_sum")
            End If
            CloseTable tRecset
            
            tRecset.Open "Select sum(MdpItmQty) as MdpItmQty_sum from MatDispatch where MdpItmCode=" & CStr(mMpkItmCode) & " and MdpDate<=#" & CStr(ToSysDate(mLoopMpkDate)) & "#" & " and MdpPerBoxItmQty=" & CStr(mMpkPerBoxItmQty) & " group by MdpItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
            If tRecset.RecordCount > 0 Then
                mMdpItmQty_sum = tRecset.Fields("MdpItmQty_sum")
            End If
            CloseTable tRecset
            
            mBalQty = mMpkItmQty_sum - mMdpItmQty_sum + mMpkItmQty    ''' - mMpkItmQty_old
            
            If mBalQty < 0 Then
                ErrorBox "Excess Dispatch Qty than Packing Qty is " & ToMyNumFmt(mBalQty, mDecimals:=0, mUseAbs:=True) & " on dated " & Dtoc(mLoopMpkDate) & " !!!"
                ChkMpkItmQty_Out = False
                Exit For
            End If
        Next mLoopMpkDate
    End If
Else
    Rem check stock availability for dispatch for current date to end dispatch date
    ChkMpkItmQty_Out = True
    With tRecset
    .Open "Select top 1 * from MatDispatch order by MdpDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount > 0 Then
        mMaxChkDate = .Fields("MdpDate")
    Else
        mMaxChkDate = mMpkDate
    End If
    End With
    CloseTable tRecset
    
    mMaxChkDate = IIf(mMpkDate > mMaxChkDate, mMpkDate, mMaxChkDate)
    For mLoopMpkDate = mMpkDate To mMaxChkDate
        mMpkItmQty_sum = 0: mMdpItmQty_sum = 0
        
        tRecset.Open "Select sum(MpkItmQty) as MpkItmQty_sum from MatPacking where MpkItmCode=" & CStr(mMpkItmCode) & " and MpkDate<=#" & CStr(ToSysDate(mLoopMpkDate)) & "#" & " and MpkPerBoxItmQty=" & CStr(mMpkPerBoxItmQty) & "" & IIf(dtlAddMode = False, " and MpkICode<>" & CStr(mMpkICode), "") & " group by MpkItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mMpkItmQty_sum = tRecset.Fields("MpkItmQty_sum")
        End If
        CloseTable tRecset
        
        tRecset.Open "Select sum(MdpItmQty) as MdpItmQty_sum from MatDispatch where MdpItmCode=" & CStr(mMpkItmCode) & " and MdpDate<=#" & CStr(ToSysDate(mLoopMpkDate)) & "#" & " and MdpPerBoxItmQty=" & CStr(mMpkPerBoxItmQty) & " group by MdpItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mMdpItmQty_sum = tRecset.Fields("MdpItmQty_sum")
        End If
        CloseTable tRecset
        
        mBalQty = mMpkItmQty_sum - mMdpItmQty_sum + IIf(mAddEditMode = True, mMpkItmQty, 0) ''' - mMpkItmQty_old
        
        If mBalQty < 0 Then
            ErrorBox "Excess Dispatch Qty than Packing Qty is " & ToMyNumFmt(mBalQty, mDecimals:=0, mUseAbs:=True) & " on dated " & Dtoc(mLoopMpkDate) & " !!!"
            ChkMpkItmQty_Out = False
            Exit For
        End If
    Next mLoopMpkDate
    
End If

End Function

Private Function GetBalQtyForDisp(ByVal mAddEditMode As Boolean, ByVal srow As Long) As Double
Dim tRecset As New ADODB.Recordset, mMpkItmQty_sum As Double, mMdpItmQty_sum As Double, mBalQty As Double
Dim mMpkDate As Date, mMpkItmCode As Long, mMpkItmQty As Double, mMpkPerBoxItmQty As Double
Dim mMpkICode As Long

Rem control values will be assigned just below and not anywhere in procedural section
If mAddEditMode = True Then
    mMpkDate = Ctod(dtpMpkDate.Text)
    mMpkItmCode = Val(fcmbItmName.BoundText)
    mMpkItmQty = Val(UnMyNumFmt(mskMpkItmQty.Text))
    mMpkPerBoxItmQty = Val(UnMyNumFmt(mskMpkPerBoxItmQty.Text))
Else
    Rem value assignment as done for add edit mode (keypress)
    mMpkDate = Ctod(Mfgrd2.TextMatrix(srow, X2MPKDATE_COL))
    mMpkItmCode = Val(Mfgrd2.TextMatrix(srow, X2MPKITMCODE_COL))
    mMpkItmQty = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2MPKITMQTY_COL)))
    mMpkPerBoxItmQty = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2MPKPERBOXITMQTY_COL)))
End If
mMpkICode = Val(Mfgrd2.TextMatrix(srow, X2MPKICODE_COL))

mMpkItmQty_sum = 0: mMdpItmQty_sum = 0

tRecset.Open "Select sum(MpkItmQty) as MpkItmQty_sum from MatPacking where MpkItmCode=" & CStr(mMpkItmCode) & " and MpkDate<=#" & CStr(ToSysDate(mMpkDate)) & "#" & " and MpkPerBoxItmQty=" & CStr(mMpkPerBoxItmQty) & "" & IIf(dtlAddMode = False, " and MpkICode<>" & CStr(mMpkICode), "") & " group by MpkItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
If tRecset.RecordCount > 0 Then
    mMpkItmQty_sum = tRecset.Fields("MpkItmQty_sum")
End If
CloseTable tRecset

tRecset.Open "Select sum(MdpItmQty) as MdpItmQty_sum from MatDispatch where MdpItmCode=" & CStr(mMpkItmCode) & " and MdpDate<=#" & CStr(ToSysDate(mMpkDate)) & "#" & " and MdpPerBoxItmQty=" & CStr(mMpkPerBoxItmQty) & " group by MdpItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
If tRecset.RecordCount > 0 Then
    mMdpItmQty_sum = tRecset.Fields("MdpItmQty_sum")
End If
CloseTable tRecset

mBalQty = mMpkItmQty_sum - mMdpItmQty_sum + mMpkItmQty

GetBalQtyForDisp = mBalQty

End Function

Private Sub RefreshBalQty()
Dim srow As Long
For srow = 1 To Mfgrd2.Rows - 2
    Mfgrd2.TextMatrix(srow, X2BALQTYFORPACK_COL) = ToMyNumFmt(GetBalQtyForPack(mAddEditMode:=False, srow:=srow), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2BALQTYFORDISP_COL) = ToMyNumFmt(GetBalQtyForDisp(mAddEditMode:=False, srow:=srow), mDecimals:=0)
Next srow

End Sub
