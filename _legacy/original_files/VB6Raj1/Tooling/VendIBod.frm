VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmVendorIssueBod 
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
      TabIndex        =   18
      Top             =   840
      Width           =   12855
      Begin VB.TextBox dtpVibDate2 
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
      Begin VB.TextBox dtpVibDate1 
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
         TabIndex        =   22
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
         TabIndex        =   21
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
         TabIndex        =   20
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
         TabIndex        =   19
         Top             =   240
         Width           =   975
      End
   End
   Begin VB.TextBox txtVoid 
      CausesValidation=   0   'False
      Height          =   375
      Left            =   120
      TabIndex        =   12
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
      TabIndex        =   17
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
      TabIndex        =   16
      TabStop         =   0   'False
      Top             =   0
      UseMaskColor    =   -1  'True
      Width           =   255
   End
   Begin VB.ComboBox cmbFormEntryMode 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   315
      ItemData        =   "VendIBod.frx":0000
      Left            =   0
      List            =   "VendIBod.frx":000D
      Style           =   1  'Simple Combo
      TabIndex        =   15
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
      TabIndex        =   14
      Top             =   2280
      Width           =   12855
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
         Left            =   9600
         TabIndex        =   10
         Tag             =   "AhCode"
         Text            =   "0"
         Top             =   1320
         Width           =   1335
      End
      Begin VB.TextBox mskVibQty 
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
         TabIndex        =   9
         Tag             =   "AhCode"
         Text            =   "0"
         Top             =   1320
         Width           =   1575
      End
      Begin VB.TextBox txtItmName 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   5040
         TabIndex        =   8
         Top             =   1320
         Width           =   3015
      End
      Begin VB.TextBox txtVndName 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   1320
         TabIndex        =   7
         Top             =   1320
         Width           =   3735
      End
      Begin VB.TextBox dtpVibDate 
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
         Left            =   10920
         Style           =   1  'Graphical
         TabIndex        =   11
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
      Caption         =   "Vendor Issue for BOD"
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
      TabIndex        =   13
      Top             =   0
      Width           =   9015
   End
End
Attribute VB_Name = "frmVendorIssueBod"
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
Dim mVibDate_old As Date, mVibVndCode_old As Long, mVibItmCode_old As Long, mVibQty_old As Double

' StockJrn transaction detail grid Mfgrd2 column definitions
Const X2VIBICODE_COL = 0
Const X2VIBDATE_COL = 1
Const X2VNDNAME_COL = 2
Const X2ITMNAME_COL = 3
Const X2VIBQTY_COL = 4
Const X2BALQTY_COL = 5
Const X2VIBCODE_COL = 6
Const X2VIBSNO_COL = 7
Const X2VIBVNDCODE_COL = 8
Const X2VIBITMCODE_COL = 9
Const X2VIBSTKCODE_COL = 10
Const X2VIBSTKICODEIS_COL = 11
Const X2VIBSTKICODERC_COL = 12
Const X2VIBRECSTATE_COL = 13
Const MFGRD2_COLS = 14

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
    dtpVibDate1.SetFocus
Else
    Unload Me
End If

End Sub

Private Sub cmdOK_Click()
Dim VIBRecset As New ADODB.Recordset, VIB_LogRS As New ADODB.Recordset
Dim srow As Long, mVibStkCode As Long, mVibStkICodeIs As Long, mVibStkICodeRc As Long, mVibCode As Long, mVibICode As Long, mVibSno As Long, mStkItmRefCode As Long

srow = Mfgrd2.Row
If dtlAddMode = True Then
    mVibCode = GetNextSeqno(dbTlgDatabase, "VendIsBod", "VibCode")
    mVibStkCode = clsSTK.ActiveStkCode
Else
    mVibCode = Val(Mfgrd2.TextMatrix(srow, X2VIBCODE_COL))
    mVibStkCode = Val(Mfgrd2.TextMatrix(srow, X2VIBSTKCODE_COL))
    mVibICode = Val(Mfgrd2.TextMatrix(srow, X2VIBICODE_COL))
    mVibStkICodeIs = Val(Mfgrd2.TextMatrix(srow, X2VIBSTKICODEIS_COL))
    mVibStkICodeRc = Val(Mfgrd2.TextMatrix(srow, X2VIBSTKICODERC_COL))
End If
If dtlEditCanceled = False And dtlAddMode = False Then
    Call ValidDtl
End If
If cmdOK.Caption = "&OK" And dtlEditCanceled = False Then
    Rem addnew/update -------------------------
    Rem VendIsBod section
    dbTlgDatabase.BeginTrans
    With VIBRecset
    If dtlAddMode = True Then
        mVibSno = GetNextSeqno(dbTlgDatabase, "VendIsBod", "VibSno", "VibCode" = CStr(mVibCode))
        
        VIBRecset.Open "Select * from VendIsBod where VibCode=" & CStr(mVibCode) & "", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        .AddNew
        Rem .Fields("VibICode") = AutoNumber
        .Fields("VibCode") = mVibCode
        .Fields("VibSno") = mVibSno
    Else
        VIBRecset.Open "Select * from VendIsBod where VibCode=" & CStr(mVibCode) & " and VibICode=" & CStr(mVibICode) & "", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    End If
    .Fields("VibDate") = Ctod(dtpVibDate.Text)
    .Fields("VibVndCode") = Val(fcmbVndName.BoundText)
    .Fields("VibItmCode") = Val(fcmbItmName.BoundText)
    .Fields("VibItmRefCode") = 0
    .Fields("VibQty") = Val(UnMyNumFmt(mskVibQty.Text))
    .Fields("VibNarr") = ""
    .Fields("VibRecState") = ChkEditRecStatus(.Fields("VibRecState"))
    .Update
    mVibICode = .Fields("VibICode")
    End With
    dbTlgDatabase.CommitTrans
    CloseTable VIBRecset
    
    Rem StockJrn section
    clsSTK.Clear
    If dtlAddMode = True Then
        Rem issue stock
        clsSTK.mStkSno_int = 0
        clsSTK.mStkDate_dt = Ctod(dtpVibDate.Text)
        clsSTK.mStkItmCode_lng = Val(fcmbItmName.BoundText)
        clsSTK.mStkItmRefCode_lng = 0
        clsSTK.mStkQty_dbl = ToIssueQty(Val(UnMyNumFmt(mskVibQty.Text)))
        clsSTK.mStkRate_dbl = 0
        clsSTK.mStkValue_dbl = 0
        clsSTK.mStkNarr_str = ""
        clsSTK.mStkRecState_int = cREC_NEW
        clsSTK.mStkLItmCode_lng = 0
        
        clsSTK.AddNew mVibStkCode
        mVibStkICodeIs = clsSTK.mStkICode_lng
        
        Rem receipt stock
        clsSTK.mStkSno_int = 0
        clsSTK.mStkQty_dbl = ToRcptQty(Val(UnMyNumFmt(mskVibQty.Text)))
        
        clsSTK.AddNew mVibStkCode, mNewItemRef:=True
        mVibStkICodeRc = clsSTK.mStkICode_lng
        mStkItmRefCode = clsSTK.mStkItmRefCode_lng
        
        Rem StockJrn Common entry
        clsSTK.mStkSno_int = -1
        clsSTK.mStkItmCode_lng = 0
        clsSTK.mStkItmRefCode_lng = 0
        clsSTK.mStkQty_dbl = 0
        clsSTK.mStkNarr_str = "Vendor Issue BOD"
        clsSTK.AddNew mVibStkCode
    Else
        Rem issue stock
        clsSTK.GetData mVibStkCode, mVibStkICodeIs
        clsSTK.mStkDate_dt = Ctod(dtpVibDate.Text)
        clsSTK.mStkItmCode_lng = Val(fcmbItmName.BoundText)
        clsSTK.mStkItmRefCode_lng = 0
        clsSTK.mStkQty_dbl = ToIssueQty(Val(UnMyNumFmt(mskVibQty.Text)))
        clsSTK.mStkRate_dbl = 0
        clsSTK.mStkValue_dbl = 0
        clsSTK.mStkNarr_str = ""
        clsSTK.Update mVibStkCode, mVibStkICodeIs
        
        Rem receipt stock
        clsSTK.GetData mVibStkCode, mVibStkICodeRc
        clsSTK.mStkDate_dt = Ctod(dtpVibDate.Text)
        clsSTK.mStkItmCode_lng = Val(fcmbItmName.BoundText)
        Rem clsSTK.mStkItmRefCode_lng = 0 if item changed then new else existing
        clsSTK.mStkQty_dbl = ToRcptQty(Val(UnMyNumFmt(mskVibQty.Text)))
        clsSTK.mStkRate_dbl = 0
        clsSTK.mStkValue_dbl = 0
        clsSTK.mStkNarr_str = ""
        If mVibItmCode_old <> clsSTK.mStkItmCode_lng Or clsSTK.mStkItmRefCode_lng = 0 Then
            clsSTK.Update mVibStkCode, mVibStkICodeRc, mNewItemRef:=True
        Else
            clsSTK.Update mVibStkCode, mVibStkICodeRc
        End If
        mStkItmRefCode = clsSTK.mStkItmRefCode_lng
        
        Rem StockJrn common entry
        clsSTK.GetData mVibStkCode, 0, -1
        clsSTK.mStkDate_dt = Ctod(dtpVibDate.Text)
        clsSTK.mStkItmCode_lng = 0
        clsSTK.mStkItmRefCode_lng = 0
        clsSTK.mStkQty_dbl = 0
        clsSTK.mStkRate_dbl = 0
        clsSTK.mStkValue_dbl = 0
        clsSTK.mStkNarr_str = "Vendor Issue BOD"
        
        clsSTK.Update mVibStkCode, clsSTK.mStkICode_lng
    End If
    
    Rem update stock ----------------------------------------
    Rem VendIsBod updation
    dbTlgDatabase.BeginTrans
    VIBRecset.Open "Select * from VendIsBod where VibCode=" & CStr(mVibCode) & " order by VibICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    With VIBRecset
    If .RecordCount > 0 Then
        .MoveFirst
        Do While .EOF = False
            If InList(.Fields("VibRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
                If dtlAddMode = True Then
                    .Fields("VibStkCode") = mVibStkCode
                    .Fields("VibStkICodeIs") = mVibStkICodeIs
                    .Fields("VibStkICodeRc") = mVibStkICodeRc
                    .Fields("VibItmRefCode") = mStkItmRefCode
                Else
                    .Fields("VibItmRefCode") = mStkItmRefCode
                End If
                .Fields("VibRecState") = cREC_UNCHANGED
                .Update
            Else
                .Fields("VibRecState") = ChkDeleteRecStatus(.Fields("VibRecState"))
                .Update
                .Delete
            End If
            
            .MoveNext
        Loop
    End If
    End With
    dbTlgDatabase.CommitTrans
    CloseTable VIBRecset
    
    Rem StockJrn updation
    clsSTK.CommitStock mVibStkCode
    
    Rem EndStock routine ----------------------------------
    Rem VendIsBod
    Data_RemoveLog mVibCode
    
    Rem StockJrn
    clsSTK.EndStock mVibStkCode
    
    Rem show record in flexgrid
    VIBRecset.Open "Select * from VendIsBod where VibCode=" & CStr(mVibCode) & " and VibICode=" & CStr(mVibICode) & "", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    With VIBRecset
    clsVND.GetData .Fields("VibVndCode")
    clsITM.GetData .Fields("VibItmCode")
    
    Mfgrd2.TextMatrix(srow, X2VIBICODE_COL) = .Fields("VibICode")
    Mfgrd2.TextMatrix(srow, X2VIBDATE_COL) = Dtoc(.Fields("VibDate"))
    Mfgrd2.TextMatrix(srow, X2VNDNAME_COL) = clsVND.mAhName_str
    Mfgrd2.TextMatrix(srow, X2ITMNAME_COL) = clsITM.mItmName_str
    Mfgrd2.TextMatrix(srow, X2VIBQTY_COL) = ToMyNumFmt(.Fields("VibQty"), mDecimals:=0)
    Mfgrd2.TextMatrix(srow, X2VIBCODE_COL) = .Fields("VibCode")
    Mfgrd2.TextMatrix(srow, X2VIBSNO_COL) = .Fields("VibSno")
    Mfgrd2.TextMatrix(srow, X2VIBVNDCODE_COL) = .Fields("VibVndCode")
    Mfgrd2.TextMatrix(srow, X2VIBITMCODE_COL) = .Fields("VibItmCode")
    Mfgrd2.TextMatrix(srow, X2VIBSTKCODE_COL) = .Fields("VibStkCode")
    Mfgrd2.TextMatrix(srow, X2VIBSTKICODEIS_COL) = .Fields("VibStkICodeIs")
    Mfgrd2.TextMatrix(srow, X2VIBSTKICODERC_COL) = .Fields("VibStkICodeRc")
    Mfgrd2.TextMatrix(srow, X2VIBRECSTATE_COL) = .Fields("VibRecState")
    
    End With
    CloseTable VIBRecset
    
    If dtlAddMode = True Then
        Mfgrd2.Rows = Mfgrd2.Rows + 1
    End If
    
    srow = srow + 1
    Mfgrd2.Row = srow
Else
    Rem cancel event -----------------------------------
    Rem VendIsBod
    VIBRecset.Open "Select * from VendIsBod where VibCode=" & CStr(mVibCode) & " order by VibICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    VIB_LogRS.Open "Select * from VendIsBod_Log where VibCode=" & CStr(mVibCode) & " order by VibICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    
    dbTlgDatabase.BeginTrans
    With VIBRecset
    If .RecordCount > 0 Then
        .MoveFirst
        Do While .EOF = False
            Rem stock updation is not required because balance is updated on CommitStock and not on individual item save, hence no need to revert is back
            VIB_LogRS.Find "VibICode=" & CStr(.Fields("VibICode")), Start:=1
            If VIB_LogRS.EOF = False Then
                ' any prior updations can be made here
                .Fields("VibSno") = VIB_LogRS.Fields("VibSno")
                .Fields("VibDate") = VIB_LogRS.Fields("VibDate")
                .Fields("VibVndCode") = VIB_LogRS.Fields("VibVndCode")
                .Fields("VibItmCode") = VIB_LogRS.Fields("VibItmCode")
                .Fields("VibItmRefCode") = VIB_LogRS.Fields("VibItmRefCode")
                .Fields("VibQty") = VIB_LogRS.Fields("VibQty")
                .Fields("VibNarr") = VIB_LogRS.Fields("VibNarr")
                .Fields("VibRecState") = VIB_LogRS.Fields("VibRecState")
                .Update
            Else
                ' any prior updations can be made here
                .Fields("VibRecState") = ChkDeleteRecStatus(.Fields("VibRecState"))
                .Update
                .Delete
            End If
            
            .MoveNext
        Loop
    End If
    End With
    dbTlgDatabase.CommitTrans
    CloseTable VIBRecset
    CloseTable VIB_LogRS
    
    Rem StockJrn
    clsSTK.CancelStock mVibStkCode
    
    Rem EndStock --------------------------------------------------
    Rem VendIsBod
    Data_RemoveLog mVibCode
    
    Rem StockJrn
    clsSTK.EndStock mVibStkCode
    
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
Set VIBRecset = Nothing
Set VIB_LogRS = Nothing

End Sub

Private Sub cmdShowDtlData_Click()
Dim tRecset As New ADODB.Recordset, srow As Long, cnt As Integer
srow = 1

tRecset.Open "Select * from VendIsBod" _
    & " where VibDate between #" & CStr(ToSysDate(Ctod(dtpVibDate1.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpVibDate2.Text))) & "#" _
    & IIf(Val(fcmbVndName.BoundText) > 0, " and VibVndCode=" & CStr(Val(fcmbVndName.BoundText)), "") _
    & IIf(Val(fcmbItmName.BoundText) > 0, " and VibItmCode=" & CStr(Val(fcmbItmName.BoundText)), "") _
    & " order by VibDate,VibICode" _
    , dbTlgDatabase, adOpenKeyset, adLockOptimistic
With tRecset
If .RecordCount > 0 Then
    Do While .EOF = False
        clsVND.GetData .Fields("VibVndCode")
        clsITM.GetData .Fields("VibItmCode")
        
        Mfgrd2.TextMatrix(srow, X2VIBICODE_COL) = .Fields("VibICode")
        Mfgrd2.TextMatrix(srow, X2VIBDATE_COL) = Dtoc(.Fields("VibDate"))
        Mfgrd2.TextMatrix(srow, X2VNDNAME_COL) = clsVND.mAhName_str
        Mfgrd2.TextMatrix(srow, X2ITMNAME_COL) = clsITM.mItmName_str
        Mfgrd2.TextMatrix(srow, X2VIBQTY_COL) = ToMyNumFmt(.Fields("VibQty"), mDecimals:=0)
        Mfgrd2.TextMatrix(srow, X2VIBCODE_COL) = .Fields("VibCode")
        Mfgrd2.TextMatrix(srow, X2VIBSNO_COL) = .Fields("VibSno")
        Mfgrd2.TextMatrix(srow, X2VIBVNDCODE_COL) = .Fields("VibVndCode")
        Mfgrd2.TextMatrix(srow, X2VIBITMCODE_COL) = .Fields("VibItmCode")
        Mfgrd2.TextMatrix(srow, X2VIBSTKCODE_COL) = .Fields("VibStkCode")
        Mfgrd2.TextMatrix(srow, X2VIBSTKICODEIS_COL) = .Fields("VibStkICodeIs")
        Mfgrd2.TextMatrix(srow, X2VIBSTKICODERC_COL) = .Fields("VibStkICodeRc")
        Mfgrd2.TextMatrix(srow, X2VIBRECSTATE_COL) = .Fields("VibRecState")
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
Dim tRecset As New ADODB.Recordset, mVibQty_sum As Double, mVrbConsQty_sum As Double, mBalQty As Double
Dim mVibDate As Date, mVibVndCode As Long, mVibItmCode As Long, mVibQty As Double
Dim mVibICode As Long

If mAddEditMode = True Then
    mVibDate = Ctod(dtpVibDate.Text)
    mVibVndCode = Val(fcmbVndName.BoundText)
    mVibItmCode = Val(fcmbItmName.BoundText)
    mVibQty = Val(UnMyNumFmt(mskVibQty.Text))
Else
    Rem value assignment as done for add edit mode (keypress)
    mVibDate = Ctod(Mfgrd2.TextMatrix(srow, X2VIBDATE_COL))
    mVibVndCode = Val(Mfgrd2.TextMatrix(srow, X2VIBVNDCODE_COL))
    mVibItmCode = Val(Mfgrd2.TextMatrix(srow, X2VIBITMCODE_COL))
    mVibQty = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2VIBQTY_COL)))
End If
mVibICode = Val(Mfgrd2.TextMatrix(srow, X2VIBICODE_COL))

mVibQty_sum = 0: mVrbConsQty_sum = 0: mBalQty = 0

tRecset.Open "Select sum(VibQty) as VibQty_sum from VendIsBod where VibVndCode=" & CStr(mVibVndCode) & " and VibItmCode=" & CStr(mVibItmCode) & " and VibDate<=#" & CStr(ToSysDate(mVibDate)) & "#" & IIf(dtlAddMode = False, " and VibICode<>" & CStr(mVibICode), "") & " group by VibVndCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
If tRecset.RecordCount > 0 Then
    mVibQty_sum = tRecset.Fields("VibQty_sum")
End If
CloseTable tRecset

tRecset.Open "Select sum(VrbConsQty) as VrbConsQty_sum from VendRcBod where VrbVndCode=" & CStr(mVibVndCode) & " and VrbItmCode=" & CStr(mVibItmCode) & " and VrbDate<=#" & CStr(ToSysDate(mVibDate)) & "#" & " group by VrbVndCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
If tRecset.RecordCount > 0 Then
    mVrbConsQty_sum = tRecset.Fields("VrbConsQty_sum")
End If
CloseTable tRecset

GetBalQty = mVibQty_sum - mVrbConsQty_sum + mVibQty

End Function

Private Sub dtpVibDate_GotFocus()
FlashActiveControl dtpVibDate, True
End Sub

Private Sub dtpVibDate_LostFocus()
FlashActiveControl dtpVibDate, False
End Sub

Private Sub dtpVibDate_Validate(Cancel As Boolean)
dtpVibDate.Text = ToMyDate(dtpVibDate.Text)
If IsFinYrDate(Ctod(dtpVibDate.Text)) = False Then
    ErrorBox "Invalid Date !!!"
    dtpVibDate.SetFocus
    FlashActiveControl dtpVibDate, True
    Cancel = True
End If
Call ValidDtl

End Sub

Private Sub dtpVibDate1_GotFocus()
FlashActiveControl dtpVibDate1, True
End Sub

Private Sub dtpVibDate1_LostFocus()
FlashActiveControl dtpVibDate1, False

End Sub

Private Sub dtpVibDate1_Validate(Cancel As Boolean)
dtpVibDate1.Text = ToMyDate(dtpVibDate1.Text)
If IsFinYrDate(Ctod(dtpVibDate1.Text)) = False Then
    ErrorBox "Invalid Date !!!"
    dtpVibDate1.SetFocus
    FlashActiveControl dtpVibDate1, True
    Cancel = True
Else
    dtpVibDate2.Text = dtpVibDate1.Text
End If

End Sub

Private Sub dtpVibDate2_GotFocus()
FlashActiveControl dtpVibDate2, True
End Sub

Private Sub dtpVibDate2_LostFocus()
FlashActiveControl dtpVibDate2, False
End Sub

Private Sub dtpVibDate2_Validate(Cancel As Boolean)
dtpVibDate2.Text = ToMyDate(dtpVibDate2.Text)
If IsFinYrDate(Ctod(dtpVibDate2.Text)) = False Then
    ErrorBox "Invalid Date !!!"
    dtpVibDate2.SetFocus
    FlashActiveControl dtpVibDate2, True
    Cancel = True
Else
    If Ctod(dtpVibDate1.Text) > Ctod(dtpVibDate2.Text) Then
        dtpVibDate1.Text = dtpVibDate2.Text
    End If
End If

End Sub

Private Sub Form_Activate()
If mFormLoaded = False Then
    dtpVibDate1.Text = Dtoc(DefaultEntryDate)
    dtpVibDate2.Text = Dtoc(DefaultEntryDate)
    dtpVibDate1.SetFocus
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
colcnt = X2VIBICODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VIBICODE_COL": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2VIBDATE_COL: Mfgrd2.ColWidth(colcnt) = dtpVibDate.Width: Mfgrd2.TextMatrix(0, colcnt) = "Date": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VNDNAME_COL: Mfgrd2.ColWidth(colcnt) = txtVndName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Vendor Name": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2ITMNAME_COL: Mfgrd2.ColWidth(colcnt) = txtItmName.Width: Mfgrd2.TextMatrix(0, colcnt) = "Material": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VIBQTY_COL: Mfgrd2.ColWidth(colcnt) = mskVibQty.Width: Mfgrd2.TextMatrix(0, colcnt) = "Issue Qty": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2BALQTY_COL: Mfgrd2.ColWidth(colcnt) = mskBalQty.Width: Mfgrd2.TextMatrix(0, colcnt) = "Bal.Qty": Mfgrd2.ColAlignment(colcnt) = 7
colcnt = X2VIBCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VIBCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VIBSNO_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VIBSNO_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VIBVNDCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VIBVNDCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VIBITMCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VIBITMCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VIBSTKCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VIBSTKCODE_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VIBSTKICODEIS_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VIBSTKICODEIS_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VIBSTKICODERC_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VIBSTKICODERC_COL": Mfgrd2.ColAlignment(colcnt) = 1
colcnt = X2VIBRECSTATE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2VIBRECSTATE_COL": Mfgrd2.ColAlignment(colcnt) = 1

colcnt = X2VIBDATE_COL: dtpVibDate.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2VNDNAME_COL: txtVndName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2ITMNAME_COL: txtItmName.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2VIBQTY_COL: mskVibQty.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2BALQTY_COL: mskBalQty.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
cmdOK.Left = mskBalQty.Left + mskBalQty.Width

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
Dim VIBRecset As New ADODB.Recordset
Dim srow As Long, mDeleteit As Boolean, mVibStkCode As Long, mVibCode As Long

If Mfgrd2.Row = FlexNewRow(Mfgrd2) Then
    GoTo EndSub
End If
srow = Mfgrd2.Row
mVibStkCode = Val(Mfgrd2.TextMatrix(srow, X2VIBSTKCODE_COL))
mVibCode = Val(Mfgrd2.TextMatrix(srow, X2VIBCODE_COL))

mDeleteit = True

If mDeleteit = True Then
    mDeleteit = ChkVibQty(mAddEditMode:=False)
End If
If mDeleteit = True Then
    mDeleteit = CanDelete()
End If
If mDeleteit = True Then
    Rem begin transaction --------------------------
    Data_CreateLog mVibCode
    clsSTK.BeginStock mVibStkCode
    
    Rem delete transaction ------------------------------
    Rem VendIsBod
    dbTlgDatabase.BeginTrans
    With VIBRecset
    .Open "Select * from VendIsBod where VibCode=" & CStr(mVibCode) & " order by VibICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount > 0 Then
        .MoveFirst
        Do While .EOF = False
            .Fields("VibRecState") = ChkDeleteRecStatus(.Fields("VibRecState"))
            .Update
            Rem marked for deletion only, physically deleted in CommitStock
            .MoveNext
        Loop
    End If
    End With
    dbTlgDatabase.CommitTrans
    CloseTable VIBRecset
    
    Rem StockJrn
    clsSTK.DeleteStock mVibStkCode
    
    Rem update transaction --------------------------------------
    Rem VendIsBod
    dbTlgDatabase.BeginTrans
    VIBRecset.Open "Select * from VendIsBod where VibCode=" & CStr(mVibCode) & " order by VibICode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    With VIBRecset
    If .RecordCount > 0 Then
        .MoveFirst
        Do While .EOF = False
            If InList(.Fields("VibRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
                .Fields("VibRecState") = cREC_UNCHANGED
                .Update
            Else
                .Fields("VibRecState") = ChkDeleteRecStatus(.Fields("VibRecState"))
                .Update
                .Delete
            End If
            
            .MoveNext
        Loop
    End If
    End With
    dbTlgDatabase.CommitTrans
    CloseTable VIBRecset
    
    Rem StockJrn
    clsSTK.CommitStock mVibStkCode
    
    Rem end transaction -----------------------------------------
    Data_RemoveLog mVibCode
    clsSTK.EndStock mVibStkCode
    
    RemoveFlexRow Mfgrd2, srow
    Call RefreshBalQty
    
    Mfgrd2.Row = srow
    Mfgrd2.SetFocus
Else
    Mfgrd2.SetFocus
End If

EndSub:
Set VIBRecset = Nothing
Exit Sub

End Sub

Private Sub Mfgrd2_KeyPress(KeyAscii As Integer)
Dim srow As Integer, mVibStkCode As Long, mVibCode As Long

If KeyAscii = vbKeyReturn Then
    Mfgrd2.Col = FlexLeftVisibleCol(Mfgrd2)
    Mfgrd2.LeftCol = Mfgrd2.Col
    
    srow = Mfgrd2.Row
    mVibStkCode = Val(Mfgrd2.TextMatrix(srow, X2VIBSTKCODE_COL))
    mVibCode = Val(Mfgrd2.TextMatrix(srow, X2VIBCODE_COL))
    
    dtlAddEditMode = True
    dtlAddMode = (srow = FlexNewRow(Mfgrd2))
    VisibleControls True, Mfgrd2.Top + Mfgrd2.RowPos(Mfgrd2.Row)
    If dtlAddMode = True Then
        If clsSTK.BeginStock(0) = False Then
            GoTo EndSub
        End If
        mVibCode = GetNextSeqno(dbTlgDatabase, "VendIsBod", "VibCode")
        Data_CreateLog mVibCode
        
        Call ChkDefaultValues
        FormAddEditMode = cFORM_ADDMODE
    Else
        If clsSTK.BeginStock(mVibStkCode) = False Then
            GoTo EndSub
        End If
        Data_CreateLog mVibCode
        
        dtpVibDate.Text = Mfgrd2.TextMatrix(srow, X2VIBDATE_COL)
        fcmbVndName.BoundText = Mfgrd2.TextMatrix(srow, X2VIBVNDCODE_COL): txtVndName.Text = fcmbVndName.Text
        fcmbItmName.BoundText = Mfgrd2.TextMatrix(srow, X2VIBITMCODE_COL): txtItmName.Text = fcmbItmName.Text
        mskVibQty.Text = Mfgrd2.TextMatrix(srow, X2VIBQTY_COL)
        FormAddEditMode = cFORM_EDITMODE
        Rem same reading values is also perfomed in ChkVibQty() function
    End If
    mVibDate_old = Ctod(dtpVibDate.Text)
    mVibVndCode_old = Val(fcmbVndName.BoundText)
    mVibItmCode_old = Val(fcmbItmName.BoundText)
    mVibQty_old = Val(UnMyNumFmt(mskVibQty.Text))
    Rem same value assignment has been done in ChkVibQty() function
    
    dtpVibDate.SetFocus
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
    dtpVibDate.Top = mRowPos
    txtVndName.Top = mRowPos
    txtItmName.Top = mRowPos
    mskVibQty.Top = mRowPos
    mskBalQty.Top = mRowPos
    cmdOK.Top = mRowPos
End If

dtpVibDate.Text = Dtoc(DefaultEntryDate)
txtVndName.Text = "": fcmbVndName.BoundText = ""
txtItmName.Text = "": fcmbItmName.BoundText = ""
mskVibQty.Text = ToMyNumFmt(0, mDecimals:=0)
mskBalQty.Text = ToMyNumFmt(0, mDecimals:=0)

Call ValidDtl

dtpVibDate.Visible = mShowItem
txtVndName.Visible = mShowItem
txtItmName.Visible = mShowItem
mskVibQty.Visible = mShowItem
mskBalQty.Visible = mShowItem
cmdOK.Visible = mShowItem

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
mDataOk = (IsFinYrDate(Ctod(dtpVibDate.Text)) = True And Val(fcmbVndName.BoundText) > 0 And Val(fcmbItmName.BoundText) > 0 And Val(UnMyNumFmt(mskVibQty.Text)) > 0)
If mDataOk = True And InterActiveChange(cmdOK) = True Then
    mDataOk = (ChkVibQty(mAddEditMode:=True) = True)
End If
If mDataOk = True Then
    mskBalQty.Text = ToMyNumFmt(GetBalQty(mAddEditMode:=True, srow:=Mfgrd2.Row), mDecimals:=0)
Else
    mskBalQty.Text = ToMyNumFmt(0, mDecimals:=0)
End If
cmdOK.Caption = IIf(mDataOk = True, "&OK", "&Cancel")
cmdOK.BackColor = IIf(mDataOk = True, &H80FF80, &H8080FF)
End Sub

Private Sub mskVibQty_GotFocus()
FlashActiveControl mskVibQty, True

End Sub

Private Sub mskVibQty_LostFocus()
FlashActiveControl mskVibQty, False
End Sub

Private Sub mskVibQty_Validate(Cancel As Boolean)
mskVibQty.Text = ToMyNumFmt(mskVibQty.Text, mDecimals:=0)
If Val(UnMyNumFmt(mskVibQty.Text)) <= 0 Then
    ErrorBox "Invalid Qty !!!"
    mskVibQty.SetFocus
    Cancel = True
Else
    If dtlAddMode = False Then
        If ChkVibQty(mAddEditMode:=True) = False Then
            Cancel = True
            mskVibQty.SetFocus
        End If
    End If
End If
Call ValidDtl

End Sub

Rem Issued qty should not fall short for already produced/consumed material
Private Function ChkVibQty(ByVal mAddEditMode As Boolean) As Boolean
Dim tRecset As New ADODB.Recordset, mVibQty_sum As Double, mVrbConsQty_sum As Double, mBalQty As Double
Dim mMaxChkDate As Date, mLoopVibDate As Date
Dim mVibDate As Date, mVibVndCode As Long, mVibItmCode As Long, mVibQty As Double
Dim mVibICode As Long, srow As Long

Rem control values will be assigned just below and not anywhere in procedural section
srow = Mfgrd2.Row
If mAddEditMode = True Then
    mVibDate = Ctod(dtpVibDate.Text)
    mVibVndCode = Val(fcmbVndName.BoundText)
    mVibItmCode = Val(fcmbItmName.BoundText)
    mVibQty = Val(UnMyNumFmt(mskVibQty.Text))
Else
    Rem value assignment as done for add edit mode (keypress)
    mVibDate = Ctod(Mfgrd2.TextMatrix(srow, X2VIBDATE_COL))
    mVibVndCode = Val(Mfgrd2.TextMatrix(srow, X2VIBVNDCODE_COL))
    mVibItmCode = Val(Mfgrd2.TextMatrix(srow, X2VIBITMCODE_COL))
    mVibQty = Val(UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2VIBQTY_COL)))
    
    Rem old value assignment as done for add edit mode (keypress)
    mVibDate_old = mVibDate
    mVibVndCode_old = mVibVndCode
    mVibItmCode_old = mVibItmCode
    mVibQty_old = mVibQty
End If
mVibICode = Val(Mfgrd2.TextMatrix(srow, X2VIBICODE_COL))

If mVibVndCode_old <> mVibVndCode Or mVibItmCode_old <> mVibItmCode Then
    Rem check minus stock by making issue qty as zero of old item entry combination
    ChkVibQty = True
    
    With tRecset
    .Open "Select top 1 * from VendRcBod order by VrbDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount > 0 Then
        mMaxChkDate = .Fields("VrbDate")
    Else
        mMaxChkDate = mVibDate_old
    End If
    End With
    CloseTable tRecset
    
    mMaxChkDate = IIf(mVibDate_old > mMaxChkDate, mVibDate_old, mMaxChkDate)
    For mLoopVibDate = mVibDate_old To mMaxChkDate
        mVibQty_sum = 0: mVrbConsQty_sum = 0
        
        tRecset.Open "Select sum(VibQty) as VibQty_sum from VendIsBod where VibVndCode=" & CStr(mVibVndCode_old) & " and VibItmCode=" & CStr(mVibItmCode_old) & " and VibDate<=#" & CStr(ToSysDate(mLoopVibDate)) & "#" & IIf(dtlAddMode = False, " and VibICode<>" & CStr(mVibICode), "") & " group by VibVndCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mVibQty_sum = tRecset.Fields("VibQty_sum")
        End If
        CloseTable tRecset
        
        tRecset.Open "Select sum(VrbConsQty) as VrbConsQty_sum from VendRcBod where VrbVndCode=" & CStr(mVibVndCode_old) & " and VrbItmCode=" & CStr(mVibItmCode_old) & " and VrbDate<=#" & CStr(ToSysDate(mLoopVibDate)) & "#" & " group by VrbVndCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mVrbConsQty_sum = tRecset.Fields("VrbConsQty_sum")
        End If
        CloseTable tRecset
        
        mBalQty = mVibQty_sum - mVrbConsQty_sum
        
        If mBalQty < 0 Then
            ErrorBox "Excess Consumed Qty over Material Issue is " & ToMyNumFmt(mBalQty, mDecimals:=0, mUseAbs:=True) & " on Dated " & CStr(Dtoc(mLoopVibDate)) & " !!!"
            ChkVibQty = False
            Exit For
        End If
    Next mLoopVibDate

ElseIf mVibDate < mVibDate_old Then
    Rem check stock availability for receipt from current date to end receipt date
    ChkVibQty = True
    
    With tRecset
    .Open "Select top 1 * from VendRcBod order by VrbDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount > 0 Then
        mMaxChkDate = .Fields("VrbDate")
    Else
        mMaxChkDate = mVibDate
    End If
    End With
    CloseTable tRecset
    
    mMaxChkDate = IIf(mVibDate > mMaxChkDate, mVibDate, mMaxChkDate)
    For mLoopVibDate = mVibDate To mMaxChkDate
        mVibQty_sum = 0: mVrbConsQty_sum = 0
        
        tRecset.Open "Select sum(VibQty) as VibQty_sum from VendIsBod where VibVndCode=" & CStr(mVibVndCode) & " and VibItmCode=" & CStr(mVibItmCode) & " and VibDate<=#" & CStr(ToSysDate(mLoopVibDate)) & "#" & IIf(dtlAddMode = False, " and VibICode<>" & CStr(mVibICode), "") & " group by VibVndCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mVibQty_sum = tRecset.Fields("VibQty_sum")
        End If
        CloseTable tRecset
        
        tRecset.Open "Select sum(VrbConsQty) as VrbConsQty_sum from VendRcBod where VrbVndCode=" & CStr(mVibVndCode) & " and VrbItmCode=" & CStr(mVibItmCode) & " and VrbDate<=#" & CStr(ToSysDate(mLoopVibDate)) & "#" & " group by VrbVndCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mVrbConsQty_sum = tRecset.Fields("VrbConsQty_sum")
        End If
        CloseTable tRecset
        
        mBalQty = mVibQty_sum - mVrbConsQty_sum + mVibQty
        
        If mBalQty < 0 Then
            ErrorBox "Excess Consumed Qty over Material Issue is " & ToMyNumFmt(mBalQty, mDecimals:=0, mUseAbs:=True) & " on Dated " & CStr(Dtoc(mLoopVibDate)) & " !!!"
            ChkVibQty = False
            Exit For
        End If
    Next mLoopVibDate
    
ElseIf mVibDate > mVibDate_old Then
    Rem check minus stock for old date to previous date of current date by making issued to zero
    Rem and then check minus stock from current date onward for changed/unchanged issued qty
    ChkVibQty = True
    
    With tRecset
    .Open "Select top 1 * from VendRcBod order by VrbDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount > 0 Then
        mMaxChkDate = .Fields("VrbDate")
        If mMaxChkDate >= mVibDate Then
            mMaxChkDate = mVibDate - 1
        End If
    Else
        mMaxChkDate = mVibDate_old
    End If
    End With
    CloseTable tRecset
    
    mMaxChkDate = IIf(mVibDate_old > mMaxChkDate, mVibDate_old, mMaxChkDate)
    For mLoopVibDate = mVibDate_old To mMaxChkDate
        mVibQty_sum = 0: mVrbConsQty_sum = 0
        
        tRecset.Open "Select sum(VibQty) as VibQty_sum from VendIsBod where VibVndCode=" & CStr(mVibVndCode) & " and VibItmCode=" & CStr(mVibItmCode) & " and VibDate<=#" & CStr(ToSysDate(mLoopVibDate)) & "#" & IIf(dtlAddMode = False, " and VibICode<>" & CStr(mVibICode), "") & " group by VibVndCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mVibQty_sum = tRecset.Fields("VibQty_sum")
        End If
        CloseTable tRecset
        
        tRecset.Open "Select sum(VrbConsQty) as VrbConsQty_sum from VendRcBod where VrbVndCode=" & CStr(mVibVndCode) & " and VrbItmCode=" & CStr(mVibItmCode) & " and VrbDate<=#" & CStr(ToSysDate(mLoopVibDate)) & "#" & " group by VrbVndCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mVrbConsQty_sum = tRecset.Fields("VrbConsQty_sum")
        End If
        CloseTable tRecset
        
        mBalQty = mVibQty_sum - mVrbConsQty_sum
        
        If mBalQty < 0 Then
            ErrorBox "Excess Consumed Qty over Material Issue is " & ToMyNumFmt(mBalQty, mDecimals:=0, mUseAbs:=True) & " on Dated " & CStr(Dtoc(mLoopVibDate)) & " !!!"
            ChkVibQty = False
            Exit For
        End If
    Next mLoopVibDate
    
    If ChkVibQty = True Then
        With tRecset
        .Open "Select top 1 * from VendRcBod order by VrbDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If .RecordCount > 0 Then
            mMaxChkDate = .Fields("VrbDate")
        Else
            mMaxChkDate = mVibDate
        End If
        End With
        CloseTable tRecset
        
        mMaxChkDate = IIf(mVibDate > mMaxChkDate, mVibDate, mMaxChkDate)
        For mLoopVibDate = mVibDate To mMaxChkDate
            mVibQty_sum = 0: mVrbConsQty_sum = 0
            
            tRecset.Open "Select sum(VibQty) as VibQty_sum from VendIsBod where VibVndCode=" & CStr(mVibVndCode) & " and VibItmCode=" & CStr(mVibItmCode) & " and VibDate<=#" & CStr(ToSysDate(mLoopVibDate)) & "#" & IIf(dtlAddMode = False, " and VibICode<>" & CStr(mVibICode), "") & " group by VibVndCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
            If tRecset.RecordCount > 0 Then
                mVibQty_sum = tRecset.Fields("VibQty_sum")
            End If
            CloseTable tRecset
            
            tRecset.Open "Select sum(VrbConsQty) as VrbConsQty_sum from VendRcBod where VrbVndCode=" & CStr(mVibVndCode) & " and VrbItmCode=" & CStr(mVibItmCode) & " and VrbDate<=#" & CStr(ToSysDate(mLoopVibDate)) & "#" & " group by VrbVndCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
            If tRecset.RecordCount > 0 Then
                mVrbConsQty_sum = tRecset.Fields("VrbConsQty_sum")
            End If
            CloseTable tRecset
            
            mBalQty = mVibQty_sum - mVrbConsQty_sum + mVibQty
            
            If mBalQty < 0 Then
                ErrorBox "Excess Consumed Qty over Material Issue is " & ToMyNumFmt(mBalQty, mDecimals:=0, mUseAbs:=True) & " on Dated " & CStr(Dtoc(mLoopVibDate)) & " !!!"
                ChkVibQty = False
                Exit For
            End If
        Next mLoopVibDate
    End If
Else
    Rem first check minus stock from current date to end receipt date
    
    ChkVibQty = True
    With tRecset
    .Open "Select top 1 * from VendRcBod order by VrbDate desc", dbTlgDatabase, adOpenKeyset, adLockOptimistic
    If .RecordCount > 0 Then
        mMaxChkDate = .Fields("VrbDate")
    Else
        mMaxChkDate = mVibDate
    End If
    End With
    CloseTable tRecset
    
    mMaxChkDate = IIf(mVibDate > mMaxChkDate, mVibDate, mMaxChkDate)
    For mLoopVibDate = mVibDate To mMaxChkDate
        mVibQty_sum = 0: mVrbConsQty_sum = 0
        
        tRecset.Open "Select sum(VibQty) as VibQty_sum from VendIsBod where VibVndCode=" & CStr(mVibVndCode) & " and VibItmCode=" & CStr(mVibItmCode) & " and VibDate<=#" & CStr(ToSysDate(mLoopVibDate)) & "#" & IIf(dtlAddMode = False, " and VibICode<>" & CStr(mVibICode), "") & " group by VibVndCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mVibQty_sum = tRecset.Fields("VibQty_sum")
        End If
        CloseTable tRecset
        
        tRecset.Open "Select sum(VrbConsQty) as VrbConsQty_sum from VendRcBod where VrbVndCode=" & CStr(mVibVndCode) & " and VrbItmCode=" & CStr(mVibItmCode) & " and VrbDate<=#" & CStr(ToSysDate(mLoopVibDate)) & "#" & " group by VrbVndCode", dbTlgDatabase, adOpenKeyset, adLockOptimistic
        If tRecset.RecordCount > 0 Then
            mVrbConsQty_sum = tRecset.Fields("VrbConsQty_sum")
        End If
        CloseTable tRecset
        
        mBalQty = mVibQty_sum - mVrbConsQty_sum + IIf(mAddEditMode = True, mVibQty, 0)
        
        If mBalQty < 0 Then
            ErrorBox "Excess Consumed Qty over Material Issue is " & ToMyNumFmt(mBalQty, mDecimals:=0, mUseAbs:=True) & " on Dated " & CStr(Dtoc(mLoopVibDate)) & " !!!"
            ChkVibQty = False
            Exit For
        End If
    Next mLoopVibDate
    
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
    dtpVibDate.Text = Mfgrd2.TextMatrix(srow, X2VIBDATE_COL)
    fcmbVndName.BoundText = Mfgrd2.TextMatrix(srow, X2VIBVNDCODE_COL): txtVndName.Text = fcmbVndName.Text
    fcmbItmName.BoundText = Mfgrd2.TextMatrix(srow, X2VIBITMCODE_COL): txtItmName.Text = fcmbItmName.Text
Else
    dtpVibDate.Text = dtpVibDate1.Text
    fcmbVndName.Text = txtVndName1.Text: txtVndName.Text = fcmbVndName.Text
    fcmbItmName.Text = txtItmName1.Text: txtItmName.Text = fcmbItmName.Text
End If
mskVibQty.Text = ToMyNumFmt(0, mDecimals:=0)
mskBalQty.Text = ToMyNumFmt(0, mDecimals:=0)

End Sub

Private Function Data_CreateLog(ByVal mVibCode As Long) As Boolean
Dim VIB_LogRS As New ADODB.Recordset
Data_CreateLog = False

VIB_LogRS.Open "Select * from VendIsBod_Log where VibCode=" & CStr(mVibCode) & "", dbTlgDatabase, adOpenKeyset, adLockOptimistic
With VIB_LogRS
If .RecordCount = 0 Then
    .Close
    Rem only ok records will be taken in log, because not ok records are created out of crashed entries which must be cleared when entry rejected
    dbTlgDatabase.BeginTrans
    dbTlgDatabase.Execute "Insert into VendIsBod_Log Select * from VendIsBod where VibCode=" & CStr(mVibCode) & " and VibRecState=" & CStr(cREC_UNCHANGED) & ""
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
Set VIB_LogRS = Nothing
Exit Function

End Function

Private Function Data_RemoveLog(ByVal mVibCode As Long) As Boolean
Data_RemoveLog = False

dbTlgDatabase.BeginTrans
dbTlgDatabase.Execute "Delete from VendIsBod_Log where VibCode=" & CStr(mVibCode)
dbTlgDatabase.CommitTrans

Data_RemoveLog = True
End Function


