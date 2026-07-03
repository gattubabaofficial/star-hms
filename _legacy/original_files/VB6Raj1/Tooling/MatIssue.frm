VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmMaterialIssue 
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
      TabIndex        =   20
      Top             =   840
      Width           =   12735
      Begin VB.TextBox dtpMisDate2 
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
      Begin VB.TextBox dtpMisDate1 
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
         Caption         =   "Machine:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   3
         Left            =   240
         TabIndex        =   24
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
         TabIndex        =   23
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
         TabIndex        =   22
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
         TabIndex        =   21
         Top             =   240
         Width           =   975
      End
   End
   Begin VB.TextBox txtVoid 
      CausesValidation=   0   'False
      Height          =   375
      Left            =   120
      TabIndex        =   14
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
      TabIndex        =   19
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
      TabIndex        =   18
      TabStop         =   0   'False
      Top             =   0
      UseMaskColor    =   -1  'True
      Width           =   255
   End
   Begin VB.ComboBox cmbFormEntryMode 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   315
      ItemData        =   "MatIssue.frx":0000
      Left            =   0
      List            =   "MatIssue.frx":000D
      Style           =   1  'Simple Combo
      TabIndex        =   17
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
      TabIndex        =   16
      Top             =   2280
      Width           =   12735
      Begin VB.TextBox mskBalQty 
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
         TabIndex        =   12
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   1320
         Width           =   1335
      End
      Begin VB.TextBox mskMisQty 
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
         Left            =   8520
         TabIndex        =   11
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   1320
         Width           =   1455
      End
      Begin VB.TextBox txtMacName 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   6720
         TabIndex        =   10
         Top             =   1320
         Width           =   1815
      End
      Begin VB.TextBox txtItmName 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   4200
         TabIndex        =   9
         Top             =   1320
         Width           =   2535
      End
      Begin VB.TextBox txtEmpName 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   1320
         TabIndex        =   8
         Top             =   1320
         Width           =   2895
      End
      Begin VB.TextBox dtpMisDate 
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
         Left            =   11280
         Style           =   1  'Graphical
         TabIndex        =   13
         Top             =   1320
         Width           =   735
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd2 
         Height          =   4815
         Left            =   120
         TabIndex        =   6
         Top             =   240
         Width           =   12495
         _ExtentX        =   22040
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
      Caption         =   "Material Issue to Operator"
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
      TabIndex        =   15
      Top             =   0
      Width           =   9015
   End
End
Attribute VB_Name = "frmMaterialIssue"
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
Dim mMisDate_old As Date, mMisEmpCode_old As Long, mMisItmCode_old As Long, mMisMacCode_old As Long, mMisQty_old As Double

' StockJrn transaction detail grid Mfgrd2 column definitions
Const X2MISICODE_COL = 0
Const X2MISDATE_COL = 1
Const X2EMPNAME_COL = 2
Const X2ITMNAME_COL = 3
Const X2MACNAME_COL = 4
Const X2MISQTY_COL = 5
Const X2BALQTY_COL = 6
Const X2MISCODE_COL = 7
Const X2MISSNO_COL = 8
Const X2MISEMPCODE_COL = 9
Const X2MISITMCODE_COL = 10
Const X2MISMACCODE_COL = 11
Const X2MISSTKCODE_COL = 12
Const X2MISSTKICODEIS_COL = 13
Const X2MISSTKICODERC_COL = 14
Const X2MISRECSTATE_COL = 15
Const MFGRD2_COLS = 16

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
    dtpMisDate1.SetFocus
Else
    Unload Me
End If

End Sub

Private Sub cmdOK_Click()
Dim MISRecset As New ADODB.Recordset, MIS_LogRS As New ADODB.Recordset
Dim srow As Long, mMisStkCode As Long, mMisStkICodeIs As Long, mMisStkICodeRc As Long, mMisCode As Long, mMisICode As Long, mMisSno As Long, mStkItmRefCode As Long

srow = Mfgrd2.Row
If dtlAddMode = True Then
    mMisCode = GetNextSeqno(dbTlgDatabase, "MatIssue", "MisCode")
    mMisStkCode = clsSTK.ActiveStkCode
Else
    mMisCode = Val(Mfgrd2.TextMatrix(srow, X2MISCODE_COL))
    mMisStkCode = Val(Mfgrd2.TextMatrix(srow, X2MISSTKCODE_COL))
    mMisICode = Val(Mfgrd2.TextMatrix(srow, X2MISICODE_COL))
    mMisStkICodeIs = Val(Mfgrd2.TextMatrix(srow, X2MISSTKICODEIS_COL))
    mMisStkICodeRc = Val(Mfgrd2.TextMatrix(srow, X2MISSTKICODERC_COL))
End If
If dtlEditCanceled = False And dtlAddMode = False Then
    Call ValidDtl
End If
If cmdOK.Caption = "&OK" And dtlEditCanceled = False Then
    Rem addnew/update -------------------------
    Rem MatIssue section
    dbTlgDatabase.BeginTrans
    With MISRecset
    If dtlAddMode = True Then
        mMisSno = GetNextSeqno(dbTlgDatabase, "MatIssue", "MisSno", "MisCode" = CStr(mMisCode))
        
        MISRecset.Open "Select * from MatIssue where MisCode=" & CStr(mMisCode) & "", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        .AddNew
        Rem .Fields("MisICode") = AutoNumber
        .Fields("MisCode") = mMisCode
        .Fields("MisSno") = mMisSno
    Else
        MISRecset.Open "Select * from MatIssue where MisCode=" & CStr(mMisCode) & " and MisICode=" & CStr(mMisICode) & "", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    End If
    .Fields("MisDate") = Ctod(dtpMisDate.Text)
    .Fields("MisEmpCode") = Val(fcmbEmpName.BoundText)
    .Fields("MisItmCode") = Val(fcmbItmName.BoundText)
    .Fields("MisItmRefCode") = 0
    .Fields("MisMacCode") = Val(fcmbMacName.BoundText)
    .Fields("MisQty") = Val(UnMyNumFmt(mskMisQty.Text))
    .Fields("MisNarr") = ""
    .Fields("MisRecState") = ChkEditRecStatus(.Fields("MisRecState"))
    .Update
    mMisICode = .Fields("MisICode")
    End With
    dbTlgDatabase.CommitTrans
    CloseTable MISRecset
    
    Rem StockJrn section
    clsSTK.Clear
    If dtlAddMode = True Then
        Rem issue stock
        clsSTK.mStkSno_int = 0
        clsSTK.mStkDate_dt = Ctod(dtpMisDate.Text)
        clsSTK.mStkItmCode_lng = Val(fcmbItmName.BoundText)
        clsSTK.mStkItmRefCode_lng = 0
        clsSTK.mStkQty_dbl = ToIssueQty(Val(UnMyNumFmt(mskMisQty.Text)))
        clsSTK.mStkRate_dbl = 0
        clsSTK.mStkValue_dbl = 0
        clsSTK.mStkNarr_str = ""
        clsSTK.mStkRecState_int = cREC_NEW
        clsSTK.mStkLItmCode_lng = 0
        
        clsSTK.AddNew mMisStkCode
        mMisStkICodeIs = clsSTK.mStkICode_lng
        
        Rem receipt stock
        clsSTK.mStkSno_int = 0
        clsSTK.mStkQty_dbl = ToRcptQty(Val(UnMyNumFmt(mskMisQty.Text)))
        
        clsSTK.AddNew mMisStkCode, mNewItemRef:=True
        mMisStkICodeRc = clsSTK.mStkICode_lng
        mStkItmRefCode = clsSTK.mStkItmRefCode_lng
        
        Rem StockJrn Common entry
        clsSTK.mStkSno_int = -1
        clsSTK.mStkItmCode_lng = 0
        clsSTK.mStkItmRefCode_lng = 0
        clsSTK.mStkQty_dbl = 0
        clsSTK.mStkNarr_str = "Material Issue to Operator"
        clsSTK.AddNew mMisStkCode
    Else
        Rem issue stock
        clsSTK.GetData mMisStkCode, mMisStkICodeIs
        clsSTK.mStkDate_dt = Ctod(dtpMisDate.Text)
        clsSTK.mStkItmCode_lng = Val(fcmbItmName.BoundText)
        clsSTK.mStkItmRefCode_lng = 0
        clsSTK.mStkQty_dbl = ToIssueQty(Val(UnMyNumFmt(mskMisQty.Text)))
        clsSTK.mStkRate_dbl = 0
        clsSTK.mStkValue_dbl = 0
        clsSTK.mStkNarr_str = ""
        clsSTK.Update mMisStkCode, mMisStkICodeIs
        
        Rem receipt stock
        clsSTK.GetData mMisStkCode, mMisStkICodeRc
        clsSTK.mStkDate_dt = Ctod(dtpMisDate.Text)
        clsSTK.mStkItmCode_lng = Val(fcmbItmName.BoundText)
        Rem clsSTK.mStkItmRefCode_lng = 0 if item changed then new else existing
        clsSTK.mStkQty_dbl = ToRcptQty(Val(UnMyNumFmt(mskMisQty.Text)))
        clsSTK.mStkRate_dbl = 0
        clsSTK.mStkValue_dbl = 0
        clsSTK.mStkNarr_str = ""
        If mMisItmCode_old <> clsSTK.mStkItmCode_lng Or clsSTK.mStkItmRefCode_lng = 0 Then
            clsSTK.Update mMisStkCode, mMisStkICodeRc, mNewItemRef:=True
        Else
            clsSTK.Update mMisStkCode, mMisStkICodeRc
        End If
        mStkItmRefCode = clsSTK.mStkItmRefCode_lng
        
        Rem StockJrn common entry
        clsSTK.GetData mMisStkCode, 0, -1
        clsSTK.mStkDate_dt = Ctod(dtpMisDate.Text)
        clsSTK.mStkItmCode_lng = 0
        clsSTK.mStkItmRefCode_lng = 0
        clsSTK.mStkQty_dbl = 0
        clsSTK.mStkRate_dbl = 0
        clsSTK.mStkValue_dbl = 0
        clsSTK.mStkNarr_str = "Material Issue to Operator"
        
        clsSTK.Update mMisStkCode, clsSTK.mStkICode_lng
    End If
    
    Rem update stock ----------------------------------------
    Rem MatIssue updation
    dbTlgDatabase.BeginTrans
    MISRecset.Open "Select * from MatIssue where MisCode=" & CStr(mMisCode) & " order by MisICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    With MISRecset
    If .RecordCount > 0 Then
        .MoveFirst
        Do While .EOF = False
            If InList(.Fields("MisRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
                If dtlAddMode = True Then
                    .Fields("MisStkCode") = mMisStkCode
                    .Fields("MisStkICodeIs") = mMisStkICodeIs
                    .Fields("MisStkICodeRc") = mMisStkICodeRc
                    .Fields("MisItmRefCode") = mStkItmRefCode
                Else
                    .Fields("MisItmRefCode") = mStkItmRefCode
                End If
                .Fields("MisRecState") = cREC_UNCHANGED
                .Update
            Else
                .Fields("MisRecState") = ChkDeleteRecStatus(.Fields("MisRecState"))
                .Update
                .Delete
            End If
            
            .MoveNext
        Loop
    End If
    End With
    dbTlgDatabase.CommitTrans
    CloseTable MISRecset
    
    Rem StockJrn updation
    clsSTK.CommitStock mMisStkCode
    
    Rem EndStock routine ----------------------------------
    Rem MatIssue
    Data_RemoveLog mMisCode
    
    Rem StockJrn
    clsSTK.EndStock mMisStkCode
    
    Rem show record in flexgrid
    MISRecset.Open "Select * from MatIssue where MisCode=" & CStr(mMisCode) & " and MisICode=" & CStr(mMisICode) & "", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    With MISRecset
    clsEMP.GetData .Fields("MisEmpCode")
    clsITM.GetData .Fields("MisItmCode")
    clsMAC.GetData .Fields("MisMacCode")
    
    Mfgrd2.TextMatrix(srow, X2MISICODE_COL) = .Fields("MisICode")
    Mfgrd2.TextMatrix(srow, X2MISDATE_COL) = Dtoc(.Fields("MisDate"))
    Mfgrd2.TextMatrix(srow, X2EMPNAME_COL) = clsEMP.mAhName_str
    Mfgrd2.TextMatrix(srow, X2ITMNAME_COL) = clsITM.mItmName_str
    Mfgrd2.TextMatrix(srow, X2MACNAME_COL) = clsMAC.mName_str
    Mfgrd2.TextMatrix(srow, X2MISQTY_COL) = ToMyNumFmt(.Fields("MisQty"), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2MISCODE_COL) = .Fields("MisCode")
    Mfgrd2.TextMatrix(srow, X2MISSNO_COL) = .Fields("MisSno")
    Mfgrd2.TextMatrix(srow, X2MISEMPCODE_COL) = .Fields("MisEmpCode")
    Mfgrd2.TextMatrix(srow, X2MISITMCODE_COL) = .Fields("MisItmCode")
    Mfgrd2.TextMatrix(srow, X2MISMACCODE_COL) = .Fields("MisMacCode")
    Mfgrd2.TextMatrix(srow, X2MISSTKCODE_COL) = .Fields("MisStkCode")
    Mfgrd2.TextMatrix(srow, X2MISSTKICODEIS_COL) = .Fields("MisStkICodeIs")
    Mfgrd2.TextMatrix(srow, X2MISSTKICODERC_COL) = .Fields("MisStkICodeRc")
    Mfgrd2.TextMatrix(srow, X2MISRECSTATE_COL) = .Fields("MisRecState")
    
    End With
    CloseTable MISRecset
    
    If dtlAddMode = True Then
        Mfgrd2.Rows = Mfgrd2.Rows + 1
    End If
    
    srow = srow + 1
    Mfgrd2.Row = srow
Else
    Rem cancel event -----------------------------------
    Rem MatIssue
    MISRecset.Open "Select * from MatIssue where MisCode=" & CStr(mMisCode) & " order by MisICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    MIS_LogRS.Open "Select * from MatIssue_Log where MisCode=" & CStr(mMisCode) & " order by MisICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    
    dbTlgDatabase.BeginTrans
    With MISRecset
    If .RecordCount > 0 Then
        .MoveFirst
        Do While .EOF = False
            Rem stock updation is not required because balance is updated on CommitStock and not on individual item save, hence no need to revert is back
            MIS_LogRS.Find "MisICode=" & CStr(.Fields("MisICode")), Start:=1
            If MIS_LogRS.EOF = False Then
                ' any prior updations can be made here
                .Fields("MisSno") = MIS_LogRS.Fields("MisSno")
                .Fields("MisDate") = MIS_LogRS.Fields("MisDate")
                .Fields("MisEmpCode") = MIS_LogRS.Fields("MisEmpCode")
                .Fields("MisItmCode") = MIS_LogRS.Fields("MisItmCode")
                .Fields("MisItmRefCode") = MIS_LogRS.Fields("MisItmRefCode")
                .Fields("MisMacCode") = MIS_LogRS.Fields("MisMacCode")
                .Fields("MisQty") = MIS_LogRS.Fields("MisQty")
                .Fields("MisNarr") = MIS_LogRS.Fields("MisNarr")
                .Fields("MisRecState") = MIS_LogRS.Fields("MisRecState")
                .Update
            Else
                ' any prior updations can be made here
                .Fields("MisRecState") = ChkDeleteRecStatus(.Fields("MisRecState"))
                .Update
                .Delete
            End If
            
            .MoveNext
        Loop
    End If
    End With
    dbTlgDatabase.CommitTrans
    CloseTable MISRecset
    CloseTable MIS_LogRS
    
    Rem StockJrn
    clsSTK.CancelStock mMisStkCode
    
    Rem EndStock --------------------------------------------------
    Rem MatIssue
    Data_RemoveLog mMisCode
    
    Rem StockJrn
    clsSTK.EndStock mMisStkCode
    
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
Set MISRecset = Nothing
Set MIS_LogRS = Nothing

End Sub

Private Sub cmdShowDtlData_Click()
Dim tRecset As New ADODB.Recordset, srow As Long, cnt As Integer
srow = 1

tRecset.Open "Select * from MatIssue" _
    & " where MisDate between #" & CStr(ToSysDate(Ctod(dtpMisDate1.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpMisDate2.Text))) & "#" _
    & IIf(Val(fcmbEmpName.BoundText) > 0, " and MisEmpCode=" & CStr(Val(fcmbEmpName.BoundText)), "") _
    & IIf(Val(fcmbItmName.BoundText) > 0, " and MisItmCode=" & CStr(Val(fcmbItmName.BoundText)), "") _
    & IIf(Val(fcmbMacName.BoundText) > 0, " and MisMacCode=" & CStr(Val(fcmbMacName.BoundText)), "") _
    & " order by MisDate,MisICode" _
    , dbTlgDatabase, adOpenKeyset, adLockOptimistic
With tRecset
If .RecordCount > 0 Then
    Do While .EOF = False
        clsEMP.GetData .Fields("MisEmpCode")
        clsITM.GetData .Fields("MisItmCode")
        clsMAC.GetData .Fields("MisMacCode")
        
        Mfgrd2.TextMatrix(srow, X2MISICODE_COL) = .Fields("MisICode")
        Mfgrd2.TextMatrix(srow, X2MISDATE_COL) = Dtoc(.Fields("MisDate"))
        Mfgrd2.TextMatrix(srow, X2EMPNAME_COL) = clsEMP.mAhName_str
        Mfgrd2.TextMatrix(srow, X2ITMNAME_COL) = clsITM.mItmName_str
        Mfgrd2.TextMatrix(srow, X2MACNAME_COL) = clsMAC.mName_str
        Mfgrd2.TextMatrix(srow, X2MISQTY_COL) = ToMyNumFmt(.Fields("MisQty"), mDecimals:=0)
        Mfgrd2.TextMatrix(srow, X2MISCODE_COL) = .Fields("MisCode")
        Mfgrd2.TextMatrix(srow, X2MISSNO_COL) = .Fields("MisSno")
        Mfgrd2.TextMatrix(srow, X2MISEMPCODE_COL) = .Fields("MisEmpCode")
        Mfgrd2.TextMatrix(srow, X2MISITMCODE_COL) = .Fields("MisItmCode")
        Mfgrd2.TextMatrix(srow, X2MISMACCODE_COL) = .Fields("MisMacCode")
        Mfgrd2.TextMatrix(srow, X2MISSTKCODE_COL) = .Fields("MisStkCode")
        Mfgrd2.TextMatrix(srow, X2MISSTKICODEIS_COL) = .Fields("MisStkICodeIs")
        Mfgrd2.TextMatrix(srow, X2MISSTKICODERC_COL) = .Fields("MisStkICodeRc")
        Mfgrd2.TextMatrix(srow, X2MISRECSTATE_COL) = .Fields("MisRecState")
        Rem balance calculation
        Mfgrd2.TextMatrix(srow, X2BALQTY_COL) = ToMyNumFmt(GetBalQty(mAddEditMode:=False, srow:=srow), mDecimals:=0)
        
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

Private Sub RefreshBalQty()
Dim srow As Long
Rem refresh balance quantity after add/edit/delete for whole flex grid
For srow = 1 To Mfgrd2.Rows - 2
    Mfgrd2.TextMatrix(srow, X2BALQTY_COL) = ToMyNumFmt(GetBalQty(mAddEditMode:=False, srow:=srow), mDecimals:=0)
Next srow

End Sub

Private Function GetBalQty(ByVal mAddEditMode As Boolean, ByVal srow As Long) As Double
Dim tRecset As New ADODB.Recordset, mMisQty_sum As Double, mPdnConsQty_sum As Double, mPdnWipOutQty_sum As Double, mBalQty As Double
Dim mMisDate As Date, mMisEmpCode As Long, mMisItmCode As Long, mMisMacCode As Long, mMisQty As Double
Dim mMisICode As Long

If mAddEditMode = True Then
    mMisDate = Ctod(dtpMisDate.Text)
    mMisEmpCode = Val(fcmbEmpName.BoundText)
    mMisItmCode = Val(fcmbItmName.BoundText)
    mMisMacCode = Val(fcmbMacName.BoundText)
    mMisQty = Val(UnMyNumFmt(mskMisQty.Text))
Else
    Rem value assignment as done for add edit mode (keypress)
    mMisDate = Ctod(Mfgrd2.TextMatrix(srow, X2MISDATE_COL))
    mMisEmpCode = Val(Mfgrd2.TextMatrix(srow, X2MISEMPCODE_COL))
    mMisItmCode = Val(Mfgrd2.TextMatrix(srow, X2MISITMCODE_COL))
    mMisMacCode = Val(Mfgrd2.TextMatrix(srow, X2MISMACCODE_COL))
    mMisQty = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2MISQTY_COL)))
End If
mMisICode = Val(Mfgrd2.TextMatrix(srow, X2MISICODE_COL))
    
mMisQty_sum = 0: mPdnConsQty_sum = 0: mPdnWipOutQty_sum = 0: mBalQty = 0

tRecset.Open "Select sum(MisQty) as MisQty_sum from MatIssue where MisEmpCode=" & CStr(mMisEmpCode) & " and MisItmCode=" & CStr(mMisItmCode) & " and MisMacCode=" & CStr(mMisMacCode) & " and MisDate<=#" & CStr(ToSysDate(mMisDate)) & "#" & IIf(dtlAddMode = False, " and MisICode<>" & CStr(mMisICode), "") & " group by MisEmpCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
If tRecset.RecordCount > 0 Then
    mMisQty_sum = tRecset.Fields("MisQty_sum")
End If
CloseTable tRecset

tRecset.Open "Select sum(PdnConsQty) as PdnConsQty_sum from MacProdn where PdnEmpCode=" & CStr(mMisEmpCode) & " and PdnItmCode=" & CStr(mMisItmCode) & " and PdnMacCode=" & CStr(mMisMacCode) & " and PdnDate<=#" & CStr(ToSysDate(mMisDate)) & "#" & " group by PdnEmpCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
If tRecset.RecordCount > 0 Then
    mPdnConsQty_sum = tRecset.Fields("PdnConsQty_sum")
End If
CloseTable tRecset

tRecset.Open "Select sum(PdnWipOutQty) as PdnWipOutQty_sum from MacProdn where PdnEmpCode=" & CStr(mMisEmpCode) & " and PdnItmCode=" & CStr(mMisItmCode) & " and PdnMacCode=" & CStr(mMisMacCode) & " and PdnDate<=#" & CStr(ToSysDate(mMisDate)) & "#" & " group by PdnEmpCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
If tRecset.RecordCount > 0 Then
    mPdnWipOutQty_sum = tRecset.Fields("PdnWipOutQty_sum")
End If
CloseTable tRecset

mBalQty = mMisQty_sum + mPdnWipOutQty_sum - mPdnConsQty_sum + mMisQty

GetBalQty = mBalQty

End Function

Private Sub dtpMisDate_GotFocus()
FlashActiveControl dtpMisDate, True
End Sub

Private Sub dtpMisDate_LostFocus()
FlashActiveControl dtpMisDate, False
End Sub

Private Sub dtpMisDate_Validate(Cancel As Boolean)
dtpMisDate.Text = ToMyDate(dtpMisDate.Text)
If IsFinYrDate(Ctod(dtpMisDate.Text)) = False Then
    ErrorBox "Invalid Date !!!"
    dtpMisDate.SetFocus
    FlashActiveControl dtpMisDate, True
    Cancel = True
End If
Call ValidDtl

End Sub

Private Sub dtpMisDate1_GotFocus()
FlashActiveControl dtpMisDate1, True
End Sub

Private Sub dtpMisDate1_LostFocus()
FlashActiveControl dtpMisDate1, False

End Sub

Private Sub dtpMisDate1_Validate(Cancel As Boolean)
dtpMisDate1.Text = ToMyDate(dtpMisDate1.Text)
If IsFinYrDate(Ctod(dtpMisDate1.Text)) = False Then
    ErrorBox "Invalid Date !!!"
    dtpMisDate1.SetFocus
    FlashActiveControl dtpMisDate1, True
    Cancel = True
Else
    dtpMisDate2.Text = dtpMisDate1.Text
End If

End Sub

Private Sub dtpMisDate2_GotFocus()
FlashActiveControl dtpMisDate2, True
End Sub

Private Sub dtpMisDate2_LostFocus()
FlashActiveControl dtpMisDate2, False
End Sub

Private Sub dtpMisDate2_Validate(Cancel As Boolean)
dtpMisDate2.Text = ToMyDate(dtpMisDate2.Text)
If IsFinYrDate(Ctod(dtpMisDate2.Text)) = False Then
    ErrorBox "Invalid Date !!!"
    dtpMisDate2.SetFocus
    FlashActiveControl dtpMisDate2, True
    Cancel = True
Else
    If Ctod(dtpMisDate1.Text) > Ctod(dtpMisDate2.Text) Then
        dtpMisDate1.Text = dtpMisDate2.Text
    End If
End If

End Sub

Private Sub Form_Activate()
If mFormLoaded = False Then
    dtpMisDate1.Text = Dtoc(DefaultEntryDate)
    dtpMisDate2.Text = Dtoc(DefaultEntryDate)
    dtpMisDate1.SetFocus
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
mskBalQty.Enabled = False

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
colcnt = X2MISICODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2MISICODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2MISDATE_COL: Mfgrd2.ColWidth(colcnt) = dtpMisDate.Width: Mfgrd2.TextMatrix(0, colcnt) = "Date": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2EMPNAME_COL: Mfgrd2.ColWidth(colcnt) = txtEmpName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Operator Name": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2ITMNAME_COL: Mfgrd2.ColWidth(colcnt) = txtItmName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Material": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2MACNAME_COL: Mfgrd2.ColWidth(colcnt) = txtMacName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Machine Name": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2MISQTY_COL: Mfgrd2.ColWidth(colcnt) = mskMisQty.Width: Mfgrd2.TextMatrix(0, colcnt) = "Issue Qty": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BALQTY_COL: Mfgrd2.ColWidth(colcnt) = mskBalQty.Width: Mfgrd2.TextMatrix(0, colcnt) = "Bal.Qty": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2MISCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2MISCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2MISSNO_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2MISSNO_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2MISEMPCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2MisEmpCode_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2MISITMCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2MISITMCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2MISMACCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2MISMACCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2MISSTKCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2MISSTKCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2MISSTKICODEIS_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2MISSTKICODEIS_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2MISSTKICODERC_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2MISSTKICODERC_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2MISRECSTATE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2MISRECSTATE_COL": Mfgrd2.ColAlignment(colcnt) = 1

colcnt = X2MISDATE_COL: dtpMisDate.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2EMPNAME_COL: txtEmpName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2ITMNAME_COL: txtItmName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2MACNAME_COL: txtMacName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2MISQTY_COL: mskMisQty.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2BALQTY_COL: mskBalQty.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)

cmdOK.Left = mskBalQty.Left + mskBalQty.Width

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
Dim MISRecset As New ADODB.Recordset
Dim srow As Long, mDeleteit As Boolean, mMisStkCode As Long, mMisCode As Long

If Mfgrd2.Row = FlexNewRow(Mfgrd2) Then
    GoTo EndSub
End If
srow = Mfgrd2.Row
mMisStkCode = Val(Mfgrd2.TextMatrix(srow, X2MISSTKCODE_COL))
mMisCode = Val(Mfgrd2.TextMatrix(srow, X2MISCODE_COL))

mDeleteit = True

If mDeleteit = True Then
    mDeleteit = ChkMisQty(mAddEditMode:=False)
End If
If mDeleteit = True Then
    mDeleteit = CanDelete()
End If
If mDeleteit = True Then
    Rem begin transaction --------------------------
    Data_CreateLog mMisCode
    clsSTK.BeginStock mMisStkCode
    
    Rem delete transaction ------------------------------
    Rem MatIssue
    dbTlgDatabase.BeginTrans
    With MISRecset
    .Open "Select * from MatIssue where MisCode=" & CStr(mMisCode) & " order by MisICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount > 0 Then
        .MoveFirst
        Do While .EOF = False
            .Fields("MisRecState") = ChkDeleteRecStatus(.Fields("MisRecState"))
            .Update
            Rem marked for deletion only, physically deleted in CommitStock
            .MoveNext
        Loop
    End If
    End With
    dbTlgDatabase.CommitTrans
    CloseTable MISRecset
    
    Rem StockJrn
    clsSTK.DeleteStock mMisStkCode
    
    Rem update transaction --------------------------------------
    Rem MatIssue
    dbTlgDatabase.BeginTrans
    MISRecset.Open "Select * from MatIssue where MisCode=" & CStr(mMisCode) & " order by MisICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    With MISRecset
    If .RecordCount > 0 Then
        .MoveFirst
        Do While .EOF = False
            If InList(.Fields("MisRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
                .Fields("MisRecState") = cREC_UNCHANGED
                .Update
            Else
                .Fields("MisRecState") = ChkDeleteRecStatus(.Fields("MisRecState"))
                .Update
                .Delete
            End If
            
            .MoveNext
        Loop
    End If
    End With
    dbTlgDatabase.CommitTrans
    CloseTable MISRecset
    
    Rem StockJrn
    clsSTK.CommitStock mMisStkCode
    
    Rem end transaction -----------------------------------------
    Data_RemoveLog mMisCode
    clsSTK.EndStock mMisStkCode
    
    RemoveFlexRow Mfgrd2, srow
    Call RefreshBalQty
    
    Mfgrd2.Row = srow
    Mfgrd2.SetFocus
Else
    Mfgrd2.SetFocus
End If

EndSub:
Set MISRecset = Nothing
Exit Sub

End Sub

Private Sub Mfgrd2_KeyPress(KeyAscii As Integer)
Dim srow As Integer, mMisStkCode As Long, mMisCode As Long

If KeyAscii = vbKeyReturn Then
    srow = Mfgrd2.Row
    mMisStkCode = Val(Mfgrd2.TextMatrix(srow, X2MISSTKCODE_COL))
    mMisCode = Val(Mfgrd2.TextMatrix(srow, X2MISCODE_COL))
    
    dtlAddEditMode = True
    dtlAddMode = (srow = FlexNewRow(Mfgrd2))
    VisibleControls True, Mfgrd2.Top + Mfgrd2.RowPos(Mfgrd2.Row)
    If dtlAddMode = True Then
        If clsSTK.BeginStock(0) = False Then
            GoTo EndSub
        End If
        mMisCode = GetNextSeqno(dbTlgDatabase, "MatIssue", "MisCode")
        Data_CreateLog mMisCode
        
        Call ChkDefaultValues
        FormAddEditMode = cFORM_ADDMODE
    Else
        If clsSTK.BeginStock(mMisStkCode) = False Then
            GoTo EndSub
        End If
        Data_CreateLog mMisCode
        
        dtpMisDate.Text = Mfgrd2.TextMatrix(srow, X2MISDATE_COL)
        fcmbEmpName.BoundText = Mfgrd2.TextMatrix(srow, X2MISEMPCODE_COL): txtEmpName.Text = fcmbEmpName.Text
        fcmbItmName.BoundText = Mfgrd2.TextMatrix(srow, X2MISITMCODE_COL): txtItmName.Text = fcmbItmName.Text
        fcmbMacName.BoundText = Mfgrd2.TextMatrix(srow, X2MISMACCODE_COL): txtMacName.Text = fcmbMacName.Text
        mskMisQty.Text = Mfgrd2.TextMatrix(srow, X2MISQTY_COL)
        FormAddEditMode = cFORM_EDITMODE
        Rem same reading values is also perfomed in ChkMisQty() function
    End If
    mMisDate_old = Ctod(dtpMisDate.Text)
    mMisEmpCode_old = Val(fcmbEmpName.BoundText)
    mMisItmCode_old = Val(fcmbItmName.BoundText)
    mMisMacCode_old = Val(fcmbMacName.BoundText)
    mMisQty_old = Val(UnMyNumFmt(mskMisQty.Text))
    Rem same value assignment has been done in ChkMisQty() function
    
    dtpMisDate.SetFocus
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
    dtpMisDate.Top = mRowPos
    txtEmpName.Top = mRowPos
    txtItmName.Top = mRowPos
    txtMacName.Top = mRowPos
    mskMisQty.Top = mRowPos
    mskBalQty.Top = mRowPos
    cmdOK.Top = mRowPos
End If

dtpMisDate.Text = Dtoc(DefaultEntryDate)
txtEmpName.Text = "": fcmbEmpName.BoundText = ""
txtItmName.Text = "": fcmbItmName.BoundText = ""
txtMacName.Text = "": fcmbMacName.BoundText = ""
mskMisQty.Text = ToMyNumFmt(0, mDecimals:=0)
mskBalQty.Text = ToMyNumFmt(0, mDecimals:=0)

Call ValidDtl

dtpMisDate.Visible = mShowItem
txtEmpName.Visible = mShowItem
txtItmName.Visible = mShowItem
txtMacName.Visible = mShowItem
mskMisQty.Visible = mShowItem
mskBalQty.Visible = mShowItem
cmdOK.Visible = mShowItem

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
mDataOk = (IsFinYrDate(Ctod(dtpMisDate.Text)) = True And Val(fcmbEmpName.BoundText) > 0 And Val(fcmbItmName.BoundText) > 0 And Val(fcmbMacName.BoundText) > 0 And Val(UnMyNumFmt(mskMisQty.Text)) > 0)
If mDataOk = True And InterActiveChange(cmdOK) = True Then
    mDataOk = (ChkMisQty(mAddEditMode:=True) = True)
End If
If mDataOk = True Then
    mskBalQty.Text = ToMyNumFmt(GetBalQty(mAddEditMode:=True, srow:=Mfgrd2.Row), mDecimals:=0)
Else
    mskBalQty.Text = ToMyNumFmt(0, mDecimals:=0)
End If
cmdOK.Caption = IIf(mDataOk = True, "&OK", "&Cancel")
cmdOK.BackColor = IIf(mDataOk = True, &H80FF80, &H8080FF)
End Sub

Private Sub mskMisQty_GotFocus()
FlashActiveControl mskMisQty, True
End Sub

Private Sub mskMisQty_LostFocus()
FlashActiveControl mskMisQty, False
End Sub

Private Sub mskMisQty_Validate(Cancel As Boolean)
mskMisQty.Text = ToMyNumFmt(mskMisQty.Text, mDecimals:=0)
If Val(UnMyNumFmt(mskMisQty.Text)) <= 0 Then
    ErrorBox "Invalid Qty. !!!"
    mskMisQty.SetFocus
    Cancel = True
Else
    If dtlAddMode = False Then
        If ChkMisQty(mAddEditMode:=True) = False Then
            Cancel = True
            mskMisQty.SetFocus
        End If
    End If
End If
Call ValidDtl

End Sub

Rem Issued qty should not fall short for already produced/consumed material
Private Function ChkMisQty(ByVal mAddEditMode As Boolean) As Boolean
Dim tRecset As New ADODB.Recordset, mMisQty_sum As Double, mPdnConsQty_sum As Double, mShortMisQty As Double, mPdnWipOutQty_sum As Double, mBalQty As Double
Dim mMaxChkDate As Date, mLoopMisDate As Date
Dim mMisDate As Date, mMisEmpCode As Long, mMisItmCode As Long, mMisMacCode As Long, mMisQty As Double
Dim mMisICode As Long, srow As Long

Rem control values will be assigned just below and not anywhere in procedural section
srow = Mfgrd2.Row
If mAddEditMode = True Then
    mMisDate = Ctod(dtpMisDate.Text)
    mMisEmpCode = Val(fcmbEmpName.BoundText)
    mMisItmCode = Val(fcmbItmName.BoundText)
    mMisMacCode = Val(fcmbMacName.BoundText)
    mMisQty = Val(UnMyNumFmt(mskMisQty.Text))
Else
    Rem value assignment as done for add edit mode (keypress)
    mMisDate = Ctod(Mfgrd2.TextMatrix(srow, X2MISDATE_COL))
    mMisEmpCode = Val(Mfgrd2.TextMatrix(srow, X2MISEMPCODE_COL))
    mMisItmCode = Val(Mfgrd2.TextMatrix(srow, X2MISITMCODE_COL))
    mMisMacCode = Val(Mfgrd2.TextMatrix(srow, X2MISMACCODE_COL))
    mMisQty = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2MISQTY_COL)))
    
    Rem old value assignment as done for add edit mode (keypress)
    mMisDate_old = mMisDate
    mMisEmpCode_old = mMisEmpCode
    mMisItmCode_old = mMisItmCode
    mMisMacCode_old = mMisMacCode
    mMisQty_old = mMisQty
End If
mMisICode = Val(Mfgrd2.TextMatrix(srow, X2MISICODE_COL))

If mMisEmpCode_old <> mMisEmpCode Or mMisItmCode_old <> mMisItmCode Or mMisMacCode_old <> mMisMacCode Then
    Rem check minus stock by making issue qty as zero of old item entry combination
    ChkMisQty = True
    
    With tRecset
    .Open "Select top 1 * from MacProdn order by PdnDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount > 0 Then
        mMaxChkDate = .Fields("PdnDate")
    Else
        mMaxChkDate = mMisDate_old
    End If
    End With
    CloseTable tRecset
    
    mMaxChkDate = IIf(mMisDate_old > mMaxChkDate, mMisDate_old, mMaxChkDate)
    For mLoopMisDate = mMisDate_old To mMaxChkDate
        mMisQty_sum = 0: mPdnConsQty_sum = 0: mPdnWipOutQty_sum = 0
        
        tRecset.Open "Select sum(MisQty) as MisQty_sum from MatIssue where MisEmpCode=" & CStr(mMisEmpCode_old) & " and MisItmCode=" & CStr(mMisItmCode_old) & " and MisMacCode=" & CStr(mMisMacCode_old) & " and MisDate<=#" & CStr(ToSysDate(mLoopMisDate)) & "#" & IIf(dtlAddMode = False, " and MisICode<>" & CStr(mMisICode), "") & " group by MisEmpCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mMisQty_sum = tRecset.Fields("MisQty_sum")
        End If
        CloseTable tRecset
        
        tRecset.Open "Select sum(PdnConsQty) as PdnConsQty_sum from MacProdn where PdnEmpCode=" & CStr(mMisEmpCode_old) & " and PdnItmCode=" & CStr(mMisItmCode_old) & " and PdnMacCode=" & CStr(mMisMacCode_old) & " and PdnDate<=#" & CStr(ToSysDate(mLoopMisDate)) & "#" & " group by PdnEmpCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mPdnConsQty_sum = tRecset.Fields("PdnConsQty_sum")
        End If
        CloseTable tRecset
        
        tRecset.Open "Select sum(PdnWipOutQty) as PdnWipOutQty_sum from MacProdn where PdnEmpCode=" & CStr(mMisEmpCode_old) & " and PdnItmCode=" & CStr(mMisItmCode_old) & " and PdnMacCode=" & CStr(mMisMacCode_old) & " and PdnDate<=#" & CStr(ToSysDate(mLoopMisDate)) & "#" & " group by PdnEmpCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mPdnWipOutQty_sum = tRecset.Fields("PdnWipOutQty_sum")
        End If
        CloseTable tRecset
        
        mBalQty = mMisQty_sum + mPdnWipOutQty_sum - mPdnConsQty_sum ''' - mMisQty_old  ''' do not add here + mMisQty
        
        If mBalQty < 0 Then
            ErrorBox "Excess Consumed Qty over Material Issue to Operator is " & ToMyNumFmt(mBalQty, mDecimals:=0, mUseAbs:=True) & " on Dated " & CStr(Dtoc(mLoopMisDate)) & " !!!"
            ChkMisQty = False
            Exit For
        End If
    Next mLoopMisDate

ElseIf mMisDate < mMisDate_old Then
    Rem check stock availability for production from current date to end production date
    ChkMisQty = True
    
    With tRecset
    .Open "Select top 1 * from MacProdn order by PdnDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount > 0 Then
        mMaxChkDate = .Fields("PdnDate")
    Else
        mMaxChkDate = mMisDate
    End If
    End With
    CloseTable tRecset
    
    mMaxChkDate = IIf(mMisDate > mMaxChkDate, mMisDate, mMaxChkDate)
    For mLoopMisDate = mMisDate To mMaxChkDate
        mMisQty_sum = 0: mPdnConsQty_sum = 0: mPdnWipOutQty_sum = 0
        
        tRecset.Open "Select sum(MisQty) as MisQty_sum from MatIssue where MisEmpCode=" & CStr(mMisEmpCode) & " and MisItmCode=" & CStr(mMisItmCode) & " and MisMacCode=" & CStr(mMisMacCode) & " and MisDate<=#" & CStr(ToSysDate(mLoopMisDate)) & "#" & IIf(dtlAddMode = False, " and MisICode<>" & CStr(mMisICode), "") & " group by MisEmpCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mMisQty_sum = tRecset.Fields("MisQty_sum")
        End If
        CloseTable tRecset
        
        tRecset.Open "Select sum(PdnConsQty) as PdnConsQty_sum from MacProdn where PdnEmpCode=" & CStr(mMisEmpCode) & " and PdnItmCode=" & CStr(mMisItmCode) & " and PdnMacCode=" & CStr(mMisMacCode) & " and PdnDate<=#" & CStr(ToSysDate(mLoopMisDate)) & "#" & " group by PdnEmpCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mPdnConsQty_sum = tRecset.Fields("PdnConsQty_sum")
        End If
        CloseTable tRecset
        
        tRecset.Open "Select sum(PdnWipOutQty) as PdnWipOutQty_sum from MacProdn where PdnEmpCode=" & CStr(mMisEmpCode) & " and PdnItmCode=" & CStr(mMisItmCode) & " and PdnMacCode=" & CStr(mMisMacCode) & " and PdnDate<=#" & CStr(ToSysDate(mLoopMisDate)) & "#" & " group by PdnEmpCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mPdnWipOutQty_sum = tRecset.Fields("PdnWipOutQty_sum")
        End If
        CloseTable tRecset
        
        mBalQty = mMisQty_sum + mPdnWipOutQty_sum - mPdnConsQty_sum + mMisQty   ''' do not add here + mMisQty - mMisQty_old
        
        If mBalQty < 0 Then
            ErrorBox "Excess Consumed Qty over Material Issue to Operator is " & ToMyNumFmt(mBalQty, mDecimals:=0, mUseAbs:=True) & " on Dated " & CStr(Dtoc(mLoopMisDate)) & " !!!"
            ChkMisQty = False
            Exit For
        End If
    Next mLoopMisDate
    
ElseIf mMisDate > mMisDate_old Then
    Rem check minus stock for old date to previous date of current date by making issued to zero
    Rem and then check minus stock from current date onward for changed/unchanged issued qty
    ChkMisQty = True
    
    With tRecset
    .Open "Select top 1 * from MacProdn order by PdnDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount > 0 Then
        mMaxChkDate = .Fields("PdnDate")
        If mMaxChkDate >= mMisDate Then
            mMaxChkDate = mMisDate - 1
        End If
    Else
        mMaxChkDate = mMisDate_old
    End If
    End With
    CloseTable tRecset
    
    mMaxChkDate = IIf(mMisDate_old > mMaxChkDate, mMisDate_old, mMaxChkDate)
    For mLoopMisDate = mMisDate_old To mMaxChkDate
        mMisQty_sum = 0: mPdnConsQty_sum = 0: mPdnWipOutQty_sum = 0
        
        tRecset.Open "Select sum(MisQty) as MisQty_sum from MatIssue where MisEmpCode=" & CStr(mMisEmpCode) & " and MisItmCode=" & CStr(mMisItmCode) & " and MisMacCode=" & CStr(mMisMacCode) & " and MisDate<=#" & CStr(ToSysDate(mLoopMisDate)) & "#" & IIf(dtlAddMode = False, " and MisICode<>" & CStr(mMisICode), "") & " group by MisEmpCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mMisQty_sum = tRecset.Fields("MisQty_sum")
        End If
        CloseTable tRecset
        
        tRecset.Open "Select sum(PdnConsQty) as PdnConsQty_sum from MacProdn where PdnEmpCode=" & CStr(mMisEmpCode) & " and PdnItmCode=" & CStr(mMisItmCode) & " and PdnMacCode=" & CStr(mMisMacCode) & " and PdnDate<=#" & CStr(ToSysDate(mLoopMisDate)) & "#" & " group by PdnEmpCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mPdnConsQty_sum = tRecset.Fields("PdnConsQty_sum")
        End If
        CloseTable tRecset
        
        tRecset.Open "Select sum(PdnWipOutQty) as PdnWipOutQty_sum from MacProdn where PdnEmpCode=" & CStr(mMisEmpCode) & " and PdnItmCode=" & CStr(mMisItmCode) & " and PdnMacCode=" & CStr(mMisMacCode) & " and PdnDate<=#" & CStr(ToSysDate(mLoopMisDate)) & "#" & " group by PdnEmpCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mPdnWipOutQty_sum = tRecset.Fields("PdnWipOutQty_sum")
        End If
        CloseTable tRecset
        
        mBalQty = mMisQty_sum + mPdnWipOutQty_sum - mPdnConsQty_sum ''' - mMisQty_old ''' do not add here + mMisQty
        
        If mBalQty < 0 Then
            ErrorBox "Excess Consumed Qty over Material Issue to Operator is " & ToMyNumFmt(mBalQty, mDecimals:=0, mUseAbs:=True) & " on Dated " & CStr(Dtoc(mLoopMisDate)) & " !!!"
            ChkMisQty = False
            Exit For
        End If
    Next mLoopMisDate
    
    If ChkMisQty = True Then
        With tRecset
        .Open "Select top 1 * from MacProdn order by PdnDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If .RecordCount > 0 Then
            mMaxChkDate = .Fields("PdnDate")
        Else
            mMaxChkDate = mMisDate
        End If
        End With
        CloseTable tRecset
        
        mMaxChkDate = IIf(mMisDate > mMaxChkDate, mMisDate, mMaxChkDate)
        For mLoopMisDate = mMisDate To mMaxChkDate
            mMisQty_sum = 0: mPdnConsQty_sum = 0: mPdnWipOutQty_sum = 0
            
            tRecset.Open "Select sum(MisQty) as MisQty_sum from MatIssue where MisEmpCode=" & CStr(mMisEmpCode) & " and MisItmCode=" & CStr(mMisItmCode) & " and MisMacCode=" & CStr(mMisMacCode) & " and MisDate<=#" & CStr(ToSysDate(mLoopMisDate)) & "#" & IIf(dtlAddMode = False, " and MisICode<>" & CStr(mMisICode), "") & " group by MisEmpCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
            If tRecset.RecordCount > 0 Then
                mMisQty_sum = tRecset.Fields("MisQty_sum")
            End If
            CloseTable tRecset
            
            tRecset.Open "Select sum(PdnConsQty) as PdnConsQty_sum from MacProdn where PdnEmpCode=" & CStr(mMisEmpCode) & " and PdnItmCode=" & CStr(mMisItmCode) & " and PdnMacCode=" & CStr(mMisMacCode) & " and PdnDate<=#" & CStr(ToSysDate(mLoopMisDate)) & "#" & " group by PdnEmpCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
            If tRecset.RecordCount > 0 Then
                mPdnConsQty_sum = tRecset.Fields("PdnConsQty_sum")
            End If
            CloseTable tRecset
            
            tRecset.Open "Select sum(PdnWipOutQty) as PdnWipOutQty_sum from MacProdn where PdnEmpCode=" & CStr(mMisEmpCode) & " and PdnItmCode=" & CStr(mMisItmCode) & " and PdnMacCode=" & CStr(mMisMacCode) & " and PdnDate<=#" & CStr(ToSysDate(mLoopMisDate)) & "#" & " group by PdnEmpCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
            If tRecset.RecordCount > 0 Then
                mPdnWipOutQty_sum = tRecset.Fields("PdnWipOutQty_sum")
            End If
            CloseTable tRecset
            
            mBalQty = mMisQty_sum + mPdnWipOutQty_sum - mPdnConsQty_sum + mMisQty   ''' - mMisQty_old
            
            If mBalQty < 0 Then
                ErrorBox "Excess Consumed Qty over Material Issue to Operator is " & ToMyNumFmt(mBalQty, mDecimals:=0, mUseAbs:=True) & " on Dated " & CStr(Dtoc(mLoopMisDate)) & " !!!"
                ChkMisQty = False
                Exit For
            End If
        Next mLoopMisDate
    End If
Else
    Rem first check minus stock from current date to end production date
    
    ChkMisQty = True
    With tRecset
    .Open "Select top 1 * from MacProdn order by PdnDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount > 0 Then
        mMaxChkDate = .Fields("PdnDate")
    Else
        mMaxChkDate = mMisDate
    End If
    End With
    CloseTable tRecset
    
    mMaxChkDate = IIf(mMisDate > mMaxChkDate, mMisDate, mMaxChkDate)
    For mLoopMisDate = mMisDate To mMaxChkDate
        mMisQty_sum = 0: mPdnConsQty_sum = 0: mPdnWipOutQty_sum = 0
        
        tRecset.Open "Select sum(MisQty) as MisQty_sum from MatIssue where MisEmpCode=" & CStr(mMisEmpCode) & " and MisItmCode=" & CStr(mMisItmCode) & " and MisMacCode=" & CStr(mMisMacCode) & " and MisDate<=#" & CStr(ToSysDate(mLoopMisDate)) & "#" & IIf(dtlAddMode = False, " and MisICode<>" & CStr(mMisICode), "") & " group by MisEmpCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mMisQty_sum = tRecset.Fields("MisQty_sum")
        End If
        CloseTable tRecset
        
        tRecset.Open "Select sum(PdnConsQty) as PdnConsQty_sum from MacProdn where PdnEmpCode=" & CStr(mMisEmpCode) & " and PdnItmCode=" & CStr(mMisItmCode) & " and PdnMacCode=" & CStr(mMisMacCode) & " and PdnDate<=#" & CStr(ToSysDate(mLoopMisDate)) & "#" & " group by PdnEmpCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mPdnConsQty_sum = tRecset.Fields("PdnConsQty_sum")
        End If
        CloseTable tRecset
        
        tRecset.Open "Select sum(PdnWipOutQty) as PdnWipOutQty_sum from MacProdn where PdnEmpCode=" & CStr(mMisEmpCode) & " and PdnItmCode=" & CStr(mMisItmCode) & " and PdnMacCode=" & CStr(mMisMacCode) & " and PdnDate<=#" & CStr(ToSysDate(mLoopMisDate)) & "#" & " group by PdnEmpCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mPdnWipOutQty_sum = tRecset.Fields("PdnWipOutQty_sum")
        End If
        CloseTable tRecset
        
        mBalQty = mMisQty_sum + mPdnWipOutQty_sum - mPdnConsQty_sum + IIf(mAddEditMode = True, mMisQty, 0) ''' - mMisQty_old
        
        If mBalQty < 0 Then
            ErrorBox "Excess Consumed Qty over Material Issue to Operator is " & ToMyNumFmt(mBalQty, mDecimals:=0, mUseAbs:=True) & " on Dated " & CStr(Dtoc(mLoopMisDate)) & " !!!"
            ChkMisQty = False
            Exit For
        End If
    Next mLoopMisDate
    
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
    dtpMisDate.Text = Mfgrd2.TextMatrix(srow, X2MISDATE_COL)
    fcmbEmpName.BoundText = Mfgrd2.TextMatrix(srow, X2MISEMPCODE_COL): txtEmpName.Text = fcmbEmpName.Text
    fcmbItmName.BoundText = Mfgrd2.TextMatrix(srow, X2MISITMCODE_COL): txtItmName.Text = fcmbItmName.Text
    fcmbMacName.BoundText = Mfgrd2.TextMatrix(srow, X2MISMACCODE_COL): txtMacName.Text = fcmbMacName.Text
Else
    dtpMisDate.Text = dtpMisDate1.Text
    fcmbEmpName.Text = txtEmpName1.Text: txtEmpName.Text = fcmbEmpName.Text
    fcmbItmName.Text = txtItmName1.Text: txtItmName.Text = fcmbItmName.Text
    fcmbMacName.Text = txtMacName1.Text: txtMacName.Text = fcmbMacName.Text
End If
mskMisQty.Text = ToMyNumFmt(0, mDecimals:=0)

End Sub

Private Function Data_CreateLog(ByVal mMisCode As Long) As Boolean
Dim MIS_LogRS As New ADODB.Recordset
Data_CreateLog = False

MIS_LogRS.Open "Select * from MatIssue_Log where MisCode=" & CStr(mMisCode) & "", dbTlgDatabase, adOpenKeyset, adLockOptimistic
With MIS_LogRS
If .RecordCount = 0 Then
    .Close
    Rem only ok records will be taken in log, because not ok records are created out of crashed entries which must be cleared when entry rejected
    dbTlgDatabase.BeginTrans
    dbTlgDatabase.Execute "Insert into MatIssue_Log Select * from MatIssue where MisCode=" & CStr(mMisCode) & " and MisRecState=" & CStr(cREC_UNCHANGED) & ""
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
Set MIS_LogRS = Nothing
Exit Function

End Function

Private Function Data_RemoveLog(ByVal mMisCode As Long) As Boolean
Data_RemoveLog = False

dbTlgDatabase.BeginTrans
dbTlgDatabase.Execute "Delete from MatIssue_Log where MisCode=" & CStr(mMisCode)
dbTlgDatabase.CommitTrans

Data_RemoveLog = True
End Function


