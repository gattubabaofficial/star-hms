VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmMatDispatch 
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
      Begin VB.TextBox dtpMdpDate2 
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
      Begin VB.TextBox dtpMdpDate1 
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
         Left            =   3120
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
      ItemData        =   "Dispatch.frx":0000
      Left            =   0
      List            =   "Dispatch.frx":000D
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
      Begin VB.TextBox mskBalBoxForDisp 
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
         TabIndex        =   12
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   1320
         Width           =   1335
      End
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
         Left            =   11400
         TabIndex        =   13
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   1320
         Width           =   1335
      End
      Begin VB.TextBox mskMdpItmQty 
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
         Width           =   1335
      End
      Begin VB.TextBox mskMdpPerBoxItmQty 
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
      Begin VB.TextBox mskMdpBoxQty 
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
         Left            =   6480
         TabIndex        =   9
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   1320
         Width           =   1095
      End
      Begin VB.TextBox txtItmName 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   3960
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
         Width           =   2655
      End
      Begin VB.TextBox dtpMdpDate 
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
         Left            =   12720
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
      Caption         =   "Material Dispatch"
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
Attribute VB_Name = "frmMatDispatch"
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
Dim mMdpDate_old As Date, mMdpItmCode_old As Long, mMdpItmQty_old As Double, mMdpPerBoxItmQty_old As Double

' StockJrn transaction detail grid Mfgrd2 column definitions
Const X2MDPICODE_COL = 0
Const X2MDPDATE_COL = 1
Const X2EMPNAME_COL = 2
Const X2ITMNAME_COL = 3
Const X2MDPBOXQTY_COL = 4
Const X2MDPPERBOXITMQTY_COL = 5
Const X2MDPITMQTY_COL = 6
Const X2BALBOXFORDISP_COL = 7
Const X2BALQTYFORDISP_COL = 8
Const X2MDPCODE_COL = 9
Const X2MDPSNO_COL = 10
Const X2MDPEMPCODE_COL = 11
Const X2MDPITMCODE_COL = 12
Const X2MDPSTKCODE_COL = 13
Const X2MDPSTKICODEIS_COL = 14
Const X2MDPSTKICODERC_COL = 15
Const X2MDPRECSTATE_COL = 16
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
    dtpMdpDate1.SetFocus
Else
    Unload Me
End If

End Sub

Private Sub cmdOK_Click()
Dim MDPRecset As New ADODB.Recordset, MDP_LogRS As New ADODB.Recordset
Dim srow As Long, mMdpStkCode As Long, mMdpStkICodeIs As Long, mMdpStkICodeRc As Long, mMdpCode As Long, mMdpICode As Long, mMdpSno As Long, mStkItmRefCode As Long

srow = Mfgrd2.Row
If dtlAddMode = True Then
    mMdpCode = GetNextSeqno(dbTlgDatabase, "MatDispatch", "MdpCode")
    mMdpStkCode = clsSTK.ActiveStkCode
Else
    mMdpCode = Val(Mfgrd2.TextMatrix(srow, X2MDPCODE_COL))
    mMdpStkCode = Val(Mfgrd2.TextMatrix(srow, X2MDPSTKCODE_COL))
    mMdpICode = Val(Mfgrd2.TextMatrix(srow, X2MDPICODE_COL))
    mMdpStkICodeIs = Val(Mfgrd2.TextMatrix(srow, X2MDPSTKICODEIS_COL))
    mMdpStkICodeRc = Val(Mfgrd2.TextMatrix(srow, X2MDPSTKICODERC_COL))
End If
If dtlEditCanceled = False Then
    Call ValidDtl
End If
If cmdOK.Caption = "&OK" And dtlEditCanceled = False Then
    Rem addnew/update -------------------------
    Rem MatDispatch section
    dbTlgDatabase.BeginTrans
    With MDPRecset
    If dtlAddMode = True Then
        mMdpSno = GetNextSeqno(dbTlgDatabase, "MatDispatch", "MdpSno", "MdpCode" = CStr(mMdpCode))
        
        MDPRecset.Open "Select * from MatDispatch where MdpCode=" & CStr(mMdpCode) & "", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        .AddNew
        Rem .Fields("MdpICode") = AutoNumber
        .Fields("MdpCode") = mMdpCode
        .Fields("MdpSno") = mMdpSno
    Else
        MDPRecset.Open "Select * from MatDispatch where MdpCode=" & CStr(mMdpCode) & " and MdpICode=" & CStr(mMdpICode) & "", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    End If
    .Fields("MdpDate") = Ctod(dtpMdpDate.Text)
    .Fields("MdpEmpCode") = Val(fcmbEmpName.BoundText)
    .Fields("MdpItmCode") = Val(fcmbItmName.BoundText)
    .Fields("MdpItmRefCode") = 0
    .Fields("MdpBoxQty") = Val(UnMyNumFmt(mskMdpBoxQty.Text))
    .Fields("MdpPerBoxItmQty") = Val(UnMyNumFmt(mskMdpPerBoxItmQty.Text))
    .Fields("MdpItmQty") = Val(UnMyNumFmt(mskMdpItmQty.Text))
    .Fields("MdpNarr") = ""
    .Fields("MdpRecState") = ChkEditRecStatus(.Fields("MdpRecState"))
    .Update
    mMdpICode = .Fields("MdpICode")
    End With
    dbTlgDatabase.CommitTrans
    CloseTable MDPRecset
    
    Rem StockJrn section
    clsSTK.Clear
    If dtlAddMode = True Then
        Rem issue stock
        clsSTK.mStkDate_dt = Ctod(dtpMdpDate.Text)
        clsSTK.mStkItmCode_lng = Val(fcmbItmName.BoundText)
        clsSTK.mStkItmRefCode_lng = 0
        clsSTK.mStkQty_dbl = ToIssueQty(Val(UnMyNumFmt(mskMdpItmQty.Text)))
        clsSTK.mStkRate_dbl = 0
        clsSTK.mStkValue_dbl = 0
        clsSTK.mStkNarr_str = ""
        clsSTK.mStkRecState_int = cREC_NEW
        clsSTK.mStkLItmCode_lng = 0
        
        clsSTK.AddNew mMdpStkCode
        mMdpStkICodeIs = clsSTK.mStkICode_lng
        
'''        Rem receipt stock
'''        clsSTK.mStkSno_int = 0
'''        clsSTK.mStkQty_dbl = ToRcptQty(Val(UnMyNumFmt(mskMdpItmQty.Text)))
'''
'''        clsSTK.AddNew mMdpStkCode, mNewItemRef:=True
'''        mMdpStkICodeRc = clsSTK.mStkICode_lng
'''        mStkItmRefCode = clsSTK.mStkItmRefCode_lng
        
        Rem StockJrn Common entry
        clsSTK.mStkSno_int = -1
        clsSTK.mStkItmCode_lng = 0
        clsSTK.mStkItmRefCode_lng = 0
        clsSTK.mStkQty_dbl = 0
        clsSTK.mStkNarr_str = "Material Dispatch"
        clsSTK.AddNew mMdpStkCode
    Else
        Rem issue stock
        clsSTK.GetData mMdpStkCode, mMdpStkICodeIs
        clsSTK.mStkDate_dt = Ctod(dtpMdpDate.Text)
        clsSTK.mStkItmCode_lng = Val(fcmbItmName.BoundText)
        clsSTK.mStkItmRefCode_lng = 0
        clsSTK.mStkQty_dbl = ToIssueQty(Val(UnMyNumFmt(mskMdpItmQty.Text)))
        clsSTK.mStkRate_dbl = 0
        clsSTK.mStkValue_dbl = 0
        clsSTK.mStkNarr_str = ""
        clsSTK.Update mMdpStkCode, mMdpStkICodeIs
        
'''        Rem receipt stock
'''        clsSTK.GetData mMdpStkCode, mMdpStkICodeRc
'''        clsSTK.mStkDate_dt = Ctod(dtpMdpDate.Text)
'''        clsSTK.mStkItmCode_lng = Val(fcmbItmName.BoundText)
'''        Rem clsSTK.mStkItmRefCode_lng = 0
'''        clsSTK.mStkQty_dbl = ToRcptQty(Val(UnMyNumFmt(mskMdpItmQty.Text)))
'''        clsSTK.mStkRate_dbl = 0
'''        clsSTK.mStkValue_dbl = 0
'''        clsSTK.mStkNarr_str = ""
'''        If mMdpItmCode_old <> clsSTK.mStkItmCode_lng Or clsSTK.mStkItmRefCode_lng = 0 Then
'''            clsSTK.Update mMdpStkCode, mMdpStkICodeRc, mNewItemRef:=True
'''        Else
'''            clsSTK.Update mMdpStkCode, mMdpStkICodeRc
'''        End If
'''        mStkItmRefCode = clsSTK.mStkItmRefCode_lng
        
        Rem StockJrn common entry
        clsSTK.GetData mMdpStkCode, 0, -1
        clsSTK.mStkDate_dt = Ctod(dtpMdpDate.Text)
        clsSTK.mStkItmCode_lng = 0
        clsSTK.mStkItmRefCode_lng = 0
        clsSTK.mStkQty_dbl = 0
        clsSTK.mStkRate_dbl = 0
        clsSTK.mStkValue_dbl = 0
        clsSTK.mStkNarr_str = "Material Dispatch"
        
        clsSTK.Update mMdpStkCode, clsSTK.mStkICode_lng
    End If
    
    Rem update stock ----------------------------------------
    Rem MatDispatch updation
    dbTlgDatabase.BeginTrans
    MDPRecset.Open "Select * from MatDispatch where MdpCode=" & CStr(mMdpCode) & " order by MdpICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    With MDPRecset
    If .RecordCount > 0 Then
        .MoveFirst
        Do While .EOF = False
            If InList(.Fields("MdpRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
                If dtlAddMode = True Then
                    .Fields("MdpStkCode") = mMdpStkCode
                    .Fields("MdpStkICodeIs") = mMdpStkICodeIs
                    .Fields("MdpStkICodeRc") = mMdpStkICodeRc
                    .Fields("MdpItmRefCode") = mStkItmRefCode
                Else
                    .Fields("MdpItmRefCode") = mStkItmRefCode
                End If
                .Fields("MdpRecState") = cREC_UNCHANGED
                .Update
            Else
                .Fields("MdpRecState") = ChkDeleteRecStatus(.Fields("MdpRecState"))
                .Update
                .Delete
            End If
            
            .MoveNext
        Loop
    End If
    End With
    dbTlgDatabase.CommitTrans
    CloseTable MDPRecset
    
    Rem StockJrn updation
    clsSTK.CommitStock mMdpStkCode
    
    Rem EndStock routine ----------------------------------
    Rem MatDispatch
    Data_RemoveLog mMdpCode
    
    Rem StockJrn
    clsSTK.EndStock mMdpStkCode
    
    Rem show record in flexgrid
    MDPRecset.Open "Select * from MatDispatch where MdpCode=" & CStr(mMdpCode) & " and MdpICode=" & CStr(mMdpICode) & "", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    With MDPRecset
    clsEMP.GetData .Fields("MdpEmpCode")
    clsITM.GetData .Fields("MdpItmCode")
    
    Mfgrd2.TextMatrix(srow, X2MDPICODE_COL) = .Fields("MdpICode")
    Mfgrd2.TextMatrix(srow, X2MDPDATE_COL) = Dtoc(.Fields("MdpDate"))
    Mfgrd2.TextMatrix(srow, X2EMPNAME_COL) = clsEMP.mAhName_str
    Mfgrd2.TextMatrix(srow, X2ITMNAME_COL) = clsITM.mItmName_str
    Mfgrd2.TextMatrix(srow, X2MDPBOXQTY_COL) = ToMyNumFmt(.Fields("MdpBoxQty"), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2MDPPERBOXITMQTY_COL) = ToMyNumFmt(.Fields("MdpPerBoxItmQty"), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2MDPITMQTY_COL) = ToMyNumFmt(.Fields("MdpItmQty"), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2MDPCODE_COL) = .Fields("MdpCode")
    Mfgrd2.TextMatrix(srow, X2MDPSNO_COL) = .Fields("MdpSno")
    Mfgrd2.TextMatrix(srow, X2MDPEMPCODE_COL) = .Fields("MdpEmpCode")
    Mfgrd2.TextMatrix(srow, X2MDPITMCODE_COL) = .Fields("MdpItmCode")
    Mfgrd2.TextMatrix(srow, X2MDPSTKCODE_COL) = .Fields("MdpStkCode")
    Mfgrd2.TextMatrix(srow, X2MDPSTKICODEIS_COL) = .Fields("MdpStkICodeIs")
    Mfgrd2.TextMatrix(srow, X2MDPSTKICODERC_COL) = .Fields("MdpStkICodeRc")
    Mfgrd2.TextMatrix(srow, X2MDPRECSTATE_COL) = .Fields("MdpRecState")
    
    End With
    CloseTable MDPRecset
    
    If dtlAddMode = True Then
        Mfgrd2.Rows = Mfgrd2.Rows + 1
    End If
    srow = srow + 1
    Mfgrd2.Row = srow
Else
    Rem cance event -----------------------------------
    Rem MatDispatch
    MDPRecset.Open "Select * from MatDispatch where MdpCode=" & CStr(mMdpCode) & " order by MdpICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    MDP_LogRS.Open "Select * from MatDispatch_Log where MdpCode=" & CStr(mMdpCode) & " order by MdpICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    
    dbTlgDatabase.BeginTrans
    With MDPRecset
    If .RecordCount > 0 Then
        .MoveFirst
        Do While .EOF = False
            Rem stock updation is not required because balance is updated on CommitStock and not on individual item save, hence no need to revert is back
            MDP_LogRS.Find "MdpICode=" & CStr(.Fields("MdpICode")), Start:=1
            If MDP_LogRS.EOF = False Then
                ' any prior updations can be made here
                .Fields("MdpSno") = MDP_LogRS.Fields("MdpSno")
                .Fields("MdpDate") = MDP_LogRS.Fields("MdpDate")
                .Fields("MdpEmpCode") = MDP_LogRS.Fields("MdpEmpCode")
                .Fields("MdpItmCode") = MDP_LogRS.Fields("MdpItmCode")
                .Fields("MdpItmRefCode") = MDP_LogRS.Fields("MdpItmRefCode")
                .Fields("MdpBoxQty") = MDP_LogRS.Fields("MdpBoxQty")
                .Fields("MdpPerBoxItmQty") = MDP_LogRS.Fields("MdpPerBoxItmQty")
                .Fields("MdpItmQty") = MDP_LogRS.Fields("MdpItmQty")
                .Fields("MdpNarr") = MDP_LogRS.Fields("MdpNarr")
                .Fields("MdpRecState") = MDP_LogRS.Fields("MdpRecState")
                .Update
            Else
                ' any prior updations can be made here
                .Fields("MdpRecState") = ChkDeleteRecStatus(.Fields("MdpRecState"))
                .Update
                .Delete
            End If
            
            .MoveNext
        Loop
    End If
    End With
    dbTlgDatabase.CommitTrans
    CloseTable MDPRecset
    CloseTable MDP_LogRS
    
    Rem StockJrn
    clsSTK.CancelStock mMdpStkCode
    
    Rem EndStock --------------------------------------------------
    Rem MatDispatch
    Data_RemoveLog mMdpCode
    
    Rem StockJrn
    clsSTK.EndStock mMdpStkCode
    
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
Set MDPRecset = Nothing
Set MDP_LogRS = Nothing

End Sub

Private Sub cmdShowDtlData_Click()
Dim tRecset As New ADODB.Recordset, srow As Long, cnt As Integer
srow = 1

tRecset.Open "Select * from MatDispatch" _
    & " where MdpDate between #" & CStr(ToSysDate(Ctod(dtpMdpDate1.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpMdpDate2.Text))) & "#" _
    & IIf(Val(fcmbEmpName.BoundText) > 0, " and MdpEmpCode=" & CStr(Val(fcmbEmpName.BoundText)), "") _
    & IIf(Val(fcmbItmName.BoundText) > 0, " and MdpItmCode=" & CStr(Val(fcmbItmName.BoundText)), "") _
    & " order by MdpDate,MdpICode" _
    , dbTlgDatabase, adOpenKeyset, adLockOptimistic
With tRecset
If .RecordCount > 0 Then
    Do While .EOF = False
        clsEMP.GetData .Fields("MdpEmpCode")
        clsITM.GetData .Fields("MdpItmCode")
        
        Mfgrd2.TextMatrix(srow, X2MDPICODE_COL) = .Fields("MdpICode")
        Mfgrd2.TextMatrix(srow, X2MDPDATE_COL) = Dtoc(.Fields("MdpDate"))
        Mfgrd2.TextMatrix(srow, X2EMPNAME_COL) = clsEMP.mAhName_str
        Mfgrd2.TextMatrix(srow, X2ITMNAME_COL) = clsITM.mItmName_str
        Mfgrd2.TextMatrix(srow, X2MDPBOXQTY_COL) = ToMyNumFmt(.Fields("MdpBoxQty"), mDecimals:=0)
        Mfgrd2.TextMatrix(srow, X2MDPPERBOXITMQTY_COL) = ToMyNumFmt(.Fields("MdpPerBoxItmQty"), mDecimals:=0)
        Mfgrd2.TextMatrix(srow, X2MDPITMQTY_COL) = ToMyNumFmt(.Fields("MdpItmQty"), mDecimals:=0)
        Mfgrd2.TextMatrix(srow, X2MDPCODE_COL) = .Fields("MdpCode")
        Mfgrd2.TextMatrix(srow, X2MDPSNO_COL) = .Fields("MdpSno")
        Mfgrd2.TextMatrix(srow, X2MDPEMPCODE_COL) = .Fields("MdpEmpCode")
        Mfgrd2.TextMatrix(srow, X2MDPITMCODE_COL) = .Fields("MdpItmCode")
        Mfgrd2.TextMatrix(srow, X2MDPSTKCODE_COL) = .Fields("MdpStkCode")
        Mfgrd2.TextMatrix(srow, X2MDPSTKICODEIS_COL) = .Fields("MdpStkICodeIs")
        Mfgrd2.TextMatrix(srow, X2MDPSTKICODERC_COL) = .Fields("MdpStkICodeRc")
        Mfgrd2.TextMatrix(srow, X2MDPRECSTATE_COL) = .Fields("MdpRecState")
        Rem calculate balance quantity
        Mfgrd2.TextMatrix(srow, X2BALBOXFORDISP_COL) = ToMyNumFmt(GetBalUnitForDisp(mAddEditMode:=False, srow:=srow, mQtyUnit:=2), mDecimals:=0)
        Mfgrd2.TextMatrix(srow, X2BALQTYFORDISP_COL) = ToMyNumFmt(GetBalUnitForDisp(mAddEditMode:=False, srow:=srow, mQtyUnit:=1), mDecimals:=0)
        
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

Private Sub dtpMdpDate_GotFocus()
FlashActiveControl dtpMdpDate, True
End Sub

Private Sub dtpMdpDate_LostFocus()
FlashActiveControl dtpMdpDate, False
End Sub

Private Sub dtpMdpDate_Validate(Cancel As Boolean)
dtpMdpDate.Text = ToMyDate(dtpMdpDate.Text)
If IsFinYrDate(Ctod(dtpMdpDate.Text)) = False Then
    ErrorBox "Invalid Date !!!"
    dtpMdpDate.SetFocus
    FlashActiveControl dtpMdpDate, True
    Cancel = True
End If
Call ValidDtl

End Sub

Private Sub dtpMdpDate1_GotFocus()
FlashActiveControl dtpMdpDate1, True
End Sub

Private Sub dtpMdpDate1_LostFocus()
FlashActiveControl dtpMdpDate1, False

End Sub

Private Sub dtpMdpDate1_Validate(Cancel As Boolean)
dtpMdpDate1.Text = ToMyDate(dtpMdpDate1.Text)
If IsFinYrDate(Ctod(dtpMdpDate1.Text)) = False Then
    ErrorBox "Invalid Date !!!"
    dtpMdpDate1.SetFocus
    FlashActiveControl dtpMdpDate1, True
    Cancel = True
Else
    dtpMdpDate2.Text = dtpMdpDate1.Text
End If

End Sub

Private Sub dtpMdpDate2_GotFocus()
FlashActiveControl dtpMdpDate2, True
End Sub

Private Sub dtpMdpDate2_LostFocus()
FlashActiveControl dtpMdpDate2, False
End Sub

Private Sub dtpMdpDate2_Validate(Cancel As Boolean)
dtpMdpDate2.Text = ToMyDate(dtpMdpDate2.Text)
If IsFinYrDate(Ctod(dtpMdpDate2.Text)) = False Then
    ErrorBox "Invalid Date !!!"
    dtpMdpDate2.SetFocus
    FlashActiveControl dtpMdpDate2, True
    Cancel = True
Else
    If Ctod(dtpMdpDate1.Text) > Ctod(dtpMdpDate2.Text) Then
        dtpMdpDate1.Text = dtpMdpDate2.Text
    End If
End If

End Sub

Private Sub Form_Activate()
If mFormLoaded = False Then
    dtpMdpDate1.Text = Dtoc(DefaultEntryDate)
    dtpMdpDate2.Text = Dtoc(DefaultEntryDate)
    dtpMdpDate1.SetFocus
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
mskMdpItmQty.Enabled = False
mskBalBoxForDisp.Enabled = False
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
colcnt = X2MDPICODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2MDPICODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2MDPDATE_COL: Mfgrd2.ColWidth(colcnt) = dtpMdpDate.Width: Mfgrd2.TextMatrix(0, colcnt) = "Date": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2EMPNAME_COL: Mfgrd2.ColWidth(colcnt) = txtEmpName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Person Name": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2ITMNAME_COL: Mfgrd2.ColWidth(colcnt) = txtItmName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Material": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2MDPBOXQTY_COL: Mfgrd2.ColWidth(colcnt) = mskMdpBoxQty.Width: Mfgrd2.TextMatrix(0, colcnt) = "Box Qty.": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2MDPPERBOXITMQTY_COL: Mfgrd2.ColWidth(colcnt) = mskMdpPerBoxItmQty.Width: Mfgrd2.TextMatrix(0, colcnt) = "Per Box Qty.": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2MDPITMQTY_COL: Mfgrd2.ColWidth(colcnt) = mskMdpItmQty.Width: Mfgrd2.TextMatrix(0, colcnt) = "Total Qty.": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BALBOXFORDISP_COL: Mfgrd2.ColWidth(colcnt) = mskBalBoxForDisp.Width: Mfgrd2.TextMatrix(0, colcnt) = "Bal.Box": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BALQTYFORDISP_COL: Mfgrd2.ColWidth(colcnt) = mskBalQtyForDisp.Width: Mfgrd2.TextMatrix(0, colcnt) = "Bal.Qty": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2MDPCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2MDPCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2MDPSNO_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2MDPSNO_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2MDPEMPCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2MDPEMPCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2MDPITMCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2MDPITMCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2MDPSTKCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2MDPSTKCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2MDPSTKICODEIS_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2MDPSTKICODEIS_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2MDPSTKICODERC_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2MDPSTKICODERC_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2MDPRECSTATE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2MDPRECSTATE_COL": Mfgrd2.ColAlignment(colcnt) = 1

colcnt = X2MDPDATE_COL: dtpMdpDate.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2EMPNAME_COL: txtEmpName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2ITMNAME_COL: txtItmName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2MDPBOXQTY_COL: mskMdpBoxQty.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2MDPPERBOXITMQTY_COL: mskMdpPerBoxItmQty.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2MDPITMQTY_COL: mskMdpItmQty.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2BALBOXFORDISP_COL: mskBalBoxForDisp.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2BALQTYFORDISP_COL: mskBalQtyForDisp.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
cmdOK.Left = mskBalQtyForDisp.Left + mskBalQtyForDisp.Width

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
Dim MDPRecset As New ADODB.Recordset
Dim srow As Long, mDeleteit As Boolean, mMdpStkCode As Long, mMdpCode As Long
If Mfgrd2.Row = FlexNewRow(Mfgrd2) Then
    GoTo EndSub
End If
srow = Mfgrd2.Row
mMdpStkCode = Val(Mfgrd2.TextMatrix(srow, X2MDPSTKCODE_COL))
mMdpCode = Val(Mfgrd2.TextMatrix(srow, X2MDPCODE_COL))

mDeleteit = True

If mDeleteit = True Then
    mDeleteit = CanDelete()
End If
If mDeleteit = True Then
    Rem begin transaction --------------------------
    Data_CreateLog mMdpCode
    clsSTK.BeginStock mMdpStkCode
    
    Rem delete transaction ------------------------------
    Rem MatDispatch
    dbTlgDatabase.BeginTrans
    With MDPRecset
    .Open "Select * from MatDispatch where MdpCode=" & CStr(mMdpCode) & " order by MdpICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount > 0 Then
        .MoveFirst
        Do While .EOF = False
            .Fields("MdpRecState") = ChkDeleteRecStatus(.Fields("MdpRecState"))
            .Update
            Rem marked for deletion only, physically deleted in CommitStock
            .MoveNext
        Loop
    End If
    End With
    dbTlgDatabase.CommitTrans
    CloseTable MDPRecset
    
    Rem StockJrn
    clsSTK.DeleteStock mMdpStkCode
    
    Rem update transaction --------------------------------------
    Rem MatDispatch
    dbTlgDatabase.BeginTrans
    MDPRecset.Open "Select * from MatDispatch where MdpCode=" & CStr(mMdpCode) & " order by MdpICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    With MDPRecset
    If .RecordCount > 0 Then
        .MoveFirst
        Do While .EOF = False
            If InList(.Fields("MdpRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
                .Fields("MdpRecState") = cREC_UNCHANGED
                .Update
            Else
                .Fields("MdpRecState") = ChkDeleteRecStatus(.Fields("MdpRecState"))
                .Update
                .Delete
            End If
            
            .MoveNext
        Loop
    End If
    End With
    dbTlgDatabase.CommitTrans
    CloseTable MDPRecset
    
    Rem StockJrn
    clsSTK.CommitStock mMdpStkCode
    
    Rem end transaction -----------------------------------------
    Data_RemoveLog mMdpCode
    clsSTK.EndStock mMdpStkCode
    
    RemoveFlexRow Mfgrd2, srow
    Call RefreshBalQty
    Mfgrd2.Row = srow
    Mfgrd2.SetFocus
Else
    Mfgrd2.SetFocus
End If

EndSub:
Set MDPRecset = Nothing
Exit Sub

End Sub

Private Sub Mfgrd2_KeyPress(KeyAscii As Integer)
Dim srow As Integer, mMdpStkCode As Long, mMdpCode As Long

If KeyAscii = vbKeyReturn Then
    srow = Mfgrd2.Row
    mMdpStkCode = Val(Mfgrd2.TextMatrix(srow, X2MDPSTKCODE_COL))
    mMdpCode = Val(Mfgrd2.TextMatrix(srow, X2MDPCODE_COL))
    
    dtlAddEditMode = True
    dtlAddMode = (srow = FlexNewRow(Mfgrd2))
    VisibleControls True, Mfgrd2.Top + Mfgrd2.RowPos(Mfgrd2.Row)
    If dtlAddMode = True Then
        If clsSTK.BeginStock(0) = False Then
            GoTo EndSub
        End If
        mMdpCode = GetNextSeqno(dbTlgDatabase, "MatDispatch", "MdpCode")
        Data_CreateLog mMdpCode
        
        Call ChkDefaultValues
        FormAddEditMode = cFORM_ADDMODE
    Else
        If clsSTK.BeginStock(mMdpStkCode) = False Then
            GoTo EndSub
        End If
        Data_CreateLog mMdpCode
        
        dtpMdpDate.Text = Mfgrd2.TextMatrix(srow, X2MDPDATE_COL)
        fcmbEmpName.BoundText = Mfgrd2.TextMatrix(srow, X2MDPEMPCODE_COL): txtEmpName.Text = fcmbEmpName.Text
        fcmbItmName.BoundText = Mfgrd2.TextMatrix(srow, X2MDPITMCODE_COL): txtItmName.Text = fcmbItmName.Text
        mskMdpBoxQty.Text = Mfgrd2.TextMatrix(srow, X2MDPBOXQTY_COL)
        mskMdpPerBoxItmQty.Text = Mfgrd2.TextMatrix(srow, X2MDPPERBOXITMQTY_COL)
        mskMdpItmQty.Text = Mfgrd2.TextMatrix(srow, X2MDPITMQTY_COL)
        mskBalBoxForDisp.Text = Mfgrd2.TextMatrix(srow, X2BALBOXFORDISP_COL)
        mskBalQtyForDisp.Text = Mfgrd2.TextMatrix(srow, X2BALQTYFORDISP_COL)
        FormAddEditMode = cFORM_EDITMODE
    End If
    mMdpDate_old = Ctod(dtpMdpDate.Text)
    mMdpItmCode_old = Val(fcmbItmName.BoundText)
    mMdpItmQty_old = Val(UnMyNumFmt(mskMdpItmQty.Text))
    mMdpPerBoxItmQty_old = Val(UnMyNumFmt(mskMdpPerBoxItmQty.Text))
    
    dtpMdpDate.SetFocus
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
    dtpMdpDate.Top = mRowPos
    txtEmpName.Top = mRowPos
    txtItmName.Top = mRowPos
    mskMdpBoxQty.Top = mRowPos
    mskMdpPerBoxItmQty.Top = mRowPos
    mskMdpItmQty.Top = mRowPos
    mskBalBoxForDisp.Top = mRowPos
    mskBalQtyForDisp.Top = mRowPos
    cmdOK.Top = mRowPos
End If

dtpMdpDate.Text = Dtoc(DefaultEntryDate)
fcmbEmpName.BoundText = "": txtEmpName.Text = fcmbEmpName.Text
fcmbItmName.BoundText = "": txtItmName.Text = fcmbItmName.Text
mskMdpBoxQty.Text = ToMyNumFmt(0, mDecimals:=0)
mskMdpPerBoxItmQty.Text = ToMyNumFmt(0, mDecimals:=0)
mskMdpItmQty.Text = ToMyNumFmt(0, mDecimals:=0)
mskBalBoxForDisp.Text = ToMyNumFmt(0, mDecimals:=0)
mskBalQtyForDisp.Text = ToMyNumFmt(0, mDecimals:=0)

Call ValidDtl

dtpMdpDate.Visible = mShowItem
txtEmpName.Visible = mShowItem
txtItmName.Visible = mShowItem
mskMdpBoxQty.Visible = mShowItem
mskMdpPerBoxItmQty.Visible = mShowItem
mskMdpItmQty.Visible = mShowItem
mskBalBoxForDisp.Visible = mShowItem
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
mDataOk = (IsFinYrDate(Ctod(dtpMdpDate.Text)) = True And Val(fcmbEmpName.BoundText) > 0 And Val(fcmbItmName.BoundText) > 0 And Val(UnMyNumFmt(mskMdpBoxQty.Text)) > 0 And Val(UnMyNumFmt(mskMdpPerBoxItmQty.Text)) > 0 And Val(UnMyNumFmt(mskMdpItmQty.Text)) > 0)
If mDataOk = True And InterActiveChange(cmdOK) = True Then
    mDataOk = (ChkMdpItmQty_In(mAddEditMode:=True) = True)
End If
If mDataOk = True Then
    mskBalBoxForDisp.Text = ToMyNumFmt(GetBalUnitForDisp(mAddEditMode:=True, srow:=Mfgrd2.Row, mQtyUnit:=2), mDecimals:=0)
    mskBalQtyForDisp.Text = ToMyNumFmt(GetBalUnitForDisp(mAddEditMode:=True, srow:=Mfgrd2.Row, mQtyUnit:=1), mDecimals:=0)
End If
cmdOK.Caption = IIf(mDataOk = True, "&OK", "&Cancel")
cmdOK.BackColor = IIf(mDataOk = True, &H80FF80, &H8080FF)

End Sub

Private Sub mskMdpBoxQty_GotFocus()
FlashActiveControl mskMdpBoxQty, True
End Sub

Private Sub mskMdpBoxQty_LostFocus()
FlashActiveControl mskMdpBoxQty, False
End Sub

Private Sub mskMdpBoxQty_Validate(Cancel As Boolean)
mskMdpBoxQty.Text = ToMyNumFmt(mskMdpBoxQty.Text, mDecimals:=0)
If Val(mskMdpBoxQty.Text) <= 0 Then
    ErrorBox "Invalid Box Qty. !!!"
    Cancel = True
    mskMdpBoxQty.SetFocus
End If
Call CalcItmQty
If Cancel = False Then
    If ChkMdpItmQty_In(mAddEditMode:=True) = False Then
        Rem no action but just message
    End If
End If
Call ValidDtl
End Sub

Private Sub mskMdpItmQty_GotFocus()
FlashActiveControl mskMdpItmQty, True
End Sub

Private Sub mskMdpItmQty_LostFocus()
FlashActiveControl mskMdpItmQty, False
End Sub

Private Sub mskMdpItmQty_Validate(Cancel As Boolean)
mskMdpItmQty.Text = ToMyNumFmt(mskMdpItmQty.Text, mDecimals:=0)
If Val(UnMyNumFmt(mskMdpItmQty.Text)) <= 0 Then
    ErrorBox "Invalid Total Qty. !!!"
    mskMdpItmQty.SetFocus
    Cancel = True
End If
Call CalcItmQty
If Cancel = False Then
    If ChkMdpItmQty_In(mAddEditMode:=True) = False Then
        Rem no action but message only
    End If
End If
Call ValidDtl

End Sub

Rem dispatch cannot be greater than packing qty
Private Function ChkMdpItmQty_In(ByVal mAddEditMode As Boolean) As Boolean
Dim tRecset As New ADODB.Recordset, mMpkItmQty_sum As Double, mMdpItmQty_sum As Double, mBalQty As Double
Dim mMaxChkDate As Date, mLoopMdpDate As Date
Dim mMdpDate As Date, mMdpItmCode As Long, mMdpItmQty As Double, mMdpPerBoxItmQty As Double
Dim mMdpICode As Long, srow As Long

Rem control values will be assigned just below and not anywhere in procedural section
srow = Mfgrd2.Row
If mAddEditMode = True Then
    mMdpDate = Ctod(dtpMdpDate.Text)
    mMdpItmCode = Val(fcmbItmName.BoundText)
    mMdpItmQty = Val(UnMyNumFmt(mskMdpItmQty.Text))
    mMdpPerBoxItmQty = Val(UnMyNumFmt(mskMdpPerBoxItmQty.Text))
Else
    Rem value assignment as done for add edit mode (keypress)
    mMdpDate = Ctod(Mfgrd2.TextMatrix(srow, X2MDPDATE_COL))
    mMdpItmCode = Val(Mfgrd2.TextMatrix(srow, X2MDPITMCODE_COL))
    mMdpItmQty = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2MDPITMQTY_COL)))
    mMdpPerBoxItmQty = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2MDPPERBOXITMQTY_COL)))
    
    Rem old value assignment as done for add edit mode (keypress)
    mMdpDate_old = mMdpDate
    mMdpItmCode_old = mMdpItmCode
    mMdpItmQty_old = mMdpItmQty
    mMdpPerBoxItmQty_old = mMdpPerBoxItmQty
End If
mMdpICode = Val(Mfgrd2.TextMatrix(srow, X2MDPICODE_COL))

Rem assume that old entry has been deleted by ignoring existing entry and then check normally stock availability for dispatch from current date to end dispatch date
ChkMdpItmQty_In = True
With tRecset
.Open "Select top 1 * from MatDispatch order by MdpDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    mMaxChkDate = .Fields("MdpDate")
Else
    mMaxChkDate = mMdpDate
End If
End With
CloseTable tRecset

mMaxChkDate = IIf(mMdpDate > mMaxChkDate, mMdpDate, mMaxChkDate)
For mLoopMdpDate = mMdpDate To mMaxChkDate
    mMpkItmQty_sum = 0: mMdpItmQty_sum = 0
    
    tRecset.Open "Select sum(MpkItmQty) as MpkItmQty_sum from MatPacking where MpkItmCode=" & CStr(mMdpItmCode) & " and MpkDate<=#" & CStr(ToSysDate(mLoopMdpDate)) & "# and MpkPerBoxItmQty=" & CStr(mMdpPerBoxItmQty) & " group by MpkItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.RecordCount > 0 Then
        mMpkItmQty_sum = tRecset.Fields("MpkItmQty_sum")
    End If
    CloseTable tRecset
    
    tRecset.Open "Select sum(MdpItmQty) as MdpItmQty_sum from MatDispatch where MdpItmCode=" & CStr(mMdpItmCode) & " and MdpDate<=#" & CStr(ToSysDate(mLoopMdpDate)) & "# and MdpPerBoxItmQty=" & CStr(mMdpPerBoxItmQty) & "" & IIf(dtlAddMode = False, " and MdpICode<>" & CStr(mMdpICode), "") & " group by MdpItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    If tRecset.RecordCount > 0 Then
        mMdpItmQty_sum = tRecset.Fields("MdpItmQty_sum")
    End If
    CloseTable tRecset
    
    mBalQty = mMpkItmQty_sum - mMdpItmQty_sum - mMdpItmQty
    
    If mBalQty < 0 Then
        ErrorBox "Excess Dispatch Qty than Packing Qty is " & ToMyNumFmt(mBalQty, mDecimals:=0, mUseAbs:=True) & " on dated " & Dtoc(mLoopMdpDate) & " !!!"
        ChkMdpItmQty_In = False
        Exit For
    End If
Next mLoopMdpDate

End Function

Private Function GetBalUnitForDisp(ByVal mAddEditMode As Boolean, ByVal srow As Long, ByVal mQtyUnit As Integer) As Double
Dim tRecset As New ADODB.Recordset, mMpkBoxQty_sum As Double, mMpkItmQty_sum As Double, mMdpBoxQty_sum As Double, mMdpItmQty_sum As Double, mBalItmQty As Double, mBalBoxQty As Double
Dim mMdpDate As Date, mMdpItmCode As Long, mMdpBoxQty As Double, mMdpItmQty As Double, mMdpPerBoxItmQty As Double
Dim mMdpICode As Long

Rem control values will be assigned just below and not anywhere in procedural section
If mAddEditMode = True Then
    mMdpDate = Ctod(dtpMdpDate.Text)
    mMdpItmCode = Val(fcmbItmName.BoundText)
    mMdpBoxQty = Val(UnMyNumFmt(mskMdpBoxQty.Text))
    mMdpItmQty = Val(UnMyNumFmt(mskMdpItmQty.Text))
    mMdpPerBoxItmQty = Val(UnMyNumFmt(mskMdpPerBoxItmQty.Text))
Else
    Rem value assignment as done for add edit mode (keypress)
    mMdpDate = Ctod(Mfgrd2.TextMatrix(srow, X2MDPDATE_COL))
    mMdpItmCode = Val(Mfgrd2.TextMatrix(srow, X2MDPITMCODE_COL))
    mMdpBoxQty = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2MDPBOXQTY_COL)))
    mMdpItmQty = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2MDPITMQTY_COL)))
    mMdpPerBoxItmQty = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2MDPPERBOXITMQTY_COL)))
End If
mMdpICode = Val(Mfgrd2.TextMatrix(srow, X2MDPICODE_COL))

mMpkItmQty_sum = 0: mMdpItmQty_sum = 0

tRecset.Open "Select sum(MpkBoxQty) as MpkBoxQty_sum, sum(MpkItmQty) as MpkItmQty_sum from MatPacking where MpkItmCode=" & CStr(mMdpItmCode) & " and MpkDate<=#" & CStr(ToSysDate(mMdpDate)) & "# and MpkPerBoxItmQty=" & CStr(mMdpPerBoxItmQty) & " group by MpkItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
If tRecset.RecordCount > 0 Then
    mMpkBoxQty_sum = tRecset.Fields("MpkBoxQty_sum")
    mMpkItmQty_sum = tRecset.Fields("MpkItmQty_sum")
End If
CloseTable tRecset

tRecset.Open "Select sum(MdpBoxQty) as MdpBoxQty_sum, sum(MdpItmQty) as MdpItmQty_sum from MatDispatch where MdpItmCode=" & CStr(mMdpItmCode) & " and MdpDate<=#" & CStr(ToSysDate(mMdpDate)) & "# and MdpPerBoxItmQty=" & CStr(mMdpPerBoxItmQty) & "" & IIf(dtlAddMode = False, " and MdpICode<>" & CStr(mMdpICode), "") & " group by MdpItmCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
If tRecset.RecordCount > 0 Then
    mMdpBoxQty_sum = tRecset.Fields("MdpBoxQty_sum")
    mMdpItmQty_sum = tRecset.Fields("MdpItmQty_sum")
End If
CloseTable tRecset

mBalBoxQty = mMpkBoxQty_sum - mMdpBoxQty_sum - mMdpBoxQty
mBalItmQty = mMpkItmQty_sum - mMdpItmQty_sum - mMdpItmQty

If mQtyUnit = 1 Then
    GetBalUnitForDisp = mBalItmQty
ElseIf mQtyUnit = 2 Then
    GetBalUnitForDisp = mBalBoxQty
Else
    GetBalUnitForDisp = 0    ''' undefined case
End If

End Function

Private Sub RefreshBalQty()
Dim srow As Long
For srow = 1 To Mfgrd2.Rows - 2
    Mfgrd2.TextMatrix(srow, X2BALBOXFORDISP_COL) = ToMyNumFmt(GetBalUnitForDisp(mAddEditMode:=False, srow:=srow, mQtyUnit:=2), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2BALQTYFORDISP_COL) = ToMyNumFmt(GetBalUnitForDisp(mAddEditMode:=False, srow:=srow, mQtyUnit:=1), mDecimals:=0)
Next srow

End Sub

Private Sub mskMdpPerBoxItmQty_GotFocus()
FlashActiveControl mskMdpPerBoxItmQty, True
End Sub

Private Sub mskMdpPerBoxItmQty_LostFocus()
FlashActiveControl mskMdpPerBoxItmQty, False
End Sub

Private Sub mskMdpPerBoxItmQty_Validate(Cancel As Boolean)
mskMdpPerBoxItmQty.Text = ToMyNumFmt(mskMdpPerBoxItmQty.Text, mDecimals:=0)
If Val(mskMdpPerBoxItmQty.Text) <= 0 Then
    ErrorBox "Invalid Per Box Qty. !!!"
    Cancel = True
    mskMdpPerBoxItmQty.SetFocus
End If
Call CalcItmQty
If Cancel = False Then
    If ChkMdpItmQty_In(mAddEditMode:=True) = False Then
        Rem no action but message only
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
    dtpMdpDate.Text = Mfgrd2.TextMatrix(srow, X2MDPDATE_COL)
    fcmbEmpName.BoundText = Mfgrd2.TextMatrix(srow, X2MDPEMPCODE_COL): txtEmpName.Text = fcmbEmpName.Text
    fcmbItmName.BoundText = Mfgrd2.TextMatrix(srow, X2MDPITMCODE_COL): txtItmName.Text = fcmbItmName.Text
Else
    dtpMdpDate.Text = dtpMdpDate1.Text
    fcmbEmpName.Text = txtEmpName1.Text: txtEmpName.Text = fcmbEmpName.Text
    fcmbItmName.Text = txtItmName1.Text: txtItmName.Text = fcmbItmName.Text
End If
mskMdpBoxQty.Text = ToMyNumFmt(0, mDecimals:=0)
mskMdpPerBoxItmQty.Text = ToMyNumFmt(0, mDecimals:=0)
mskMdpItmQty.Text = ToMyNumFmt(0, mDecimals:=0)

End Sub

Private Function Data_CreateLog(ByVal mMdpCode As Long) As Boolean
Dim MDP_LogRS As New ADODB.Recordset
Data_CreateLog = False

MDP_LogRS.Open "Select * from MatDispatch_Log where MdpCode=" & CStr(mMdpCode) & "", dbTlgDatabase, adOpenKeyset, adLockOptimistic
With MDP_LogRS
If .RecordCount = 0 Then
    .Close
    Rem only ok records will be taken in log, because not ok records are created out of crashed entries which must be cleared when entry rejected
    dbTlgDatabase.BeginTrans
    dbTlgDatabase.Execute "Insert into MatDispatch_Log Select * from MatDispatch where MdpCode=" & CStr(mMdpCode) & " and MdpRecState=" & CStr(cREC_UNCHANGED) & ""
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
Set MDP_LogRS = Nothing
Exit Function

End Function

Private Function Data_RemoveLog(ByVal mMdpCode As Long) As Boolean
Data_RemoveLog = False

dbTlgDatabase.BeginTrans
dbTlgDatabase.Execute "Delete from MatDispatch_Log where MdpCode=" & CStr(mMdpCode)
dbTlgDatabase.CommitTrans

Data_RemoveLog = True
End Function

Private Sub CalcItmQty()
mskMdpItmQty.Text = ToMyNumFmt(Val(UnMyNumFmt(mskMdpBoxQty.Text)) * Val(UnMyNumFmt(mskMdpPerBoxItmQty.Text)), mDecimals:=0)
End Sub

