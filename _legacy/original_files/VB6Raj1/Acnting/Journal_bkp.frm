VERSION 5.00
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Object = "{CDE57A40-8B86-11D0-B3C6-00A0C90AEA82}#1.0#0"; "MSDATGRD.OCX"
Begin VB.Form frmJournal 
   ClientHeight    =   9315
   ClientLeft      =   60
   ClientTop       =   60
   ClientWidth     =   13650
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
   MDIChild        =   -1  'True
   ScaleHeight     =   9315
   ScaleWidth      =   13650
   WindowState     =   2  'Maximized
   Begin VB.Frame frFormDtl 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   7095
      Left            =   120
      TabIndex        =   14
      Top             =   1080
      Width           =   10335
      Begin VB.Frame frHeader 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   1335
         Left            =   0
         TabIndex        =   20
         Top             =   0
         Width           =   10335
         Begin VB.TextBox mskFormBoundField 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BeginProperty DataFormat 
               Type            =   1
               Format          =   "0"
               HaveTrueFalseNull=   0
               FirstDayOfWeek  =   0
               FirstWeekOfYear =   0
               LCID            =   1033
               SubFormatType   =   1
            EndProperty
            Enabled         =   0   'False
            Height          =   285
            Left            =   1560
            TabIndex        =   0
            Tag             =   "AhCode"
            Text            =   "-1"
            Top             =   360
            Width           =   1335
         End
         Begin VB.TextBox dtpJrnDate 
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
            Left            =   1560
            TabIndex        =   1
            Tag             =   "AhCode"
            Text            =   "dd/mm/yyyy"
            Top             =   720
            Width           =   1335
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Code:"
            ForeColor       =   &H80000008&
            Height          =   255
            Index           =   0
            Left            =   240
            TabIndex        =   22
            Top             =   360
            Width           =   855
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Date:"
            ForeColor       =   &H80000008&
            Height          =   255
            Index           =   1
            Left            =   240
            TabIndex        =   21
            Top             =   720
            Width           =   855
         End
      End
      Begin VB.Frame frFooter 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   1335
         Left            =   0
         TabIndex        =   23
         Top             =   4440
         Width           =   10335
         Begin VB.TextBox txtJrnNarr_1 
            Appearance      =   0  'Flat
            BeginProperty DataFormat 
               Type            =   0
               Format          =   "0"
               HaveTrueFalseNull=   0
               FirstDayOfWeek  =   0
               FirstWeekOfYear =   0
               LCID            =   1033
               SubFormatType   =   0
            EndProperty
            Height          =   645
            Left            =   1080
            TabIndex        =   10
            Top             =   240
            Width           =   4455
         End
         Begin VB.Label lblDrAmtTot 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "0.00"
            ForeColor       =   &H80000008&
            Height          =   285
            Left            =   5520
            TabIndex        =   27
            Top             =   240
            Width           =   1575
         End
         Begin VB.Label lblCrAmtTot 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "0.00"
            ForeColor       =   &H80000008&
            Height          =   285
            Left            =   7080
            TabIndex        =   26
            Top             =   240
            Width           =   1575
         End
         Begin VB.Label lblDrDiffAmt 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "0.00"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   -1  'True
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H000000FF&
            Height          =   285
            Left            =   5520
            TabIndex        =   25
            Top             =   600
            Width           =   1575
         End
         Begin VB.Label lblCrDiffAmt 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "0.00"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   -1  'True
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H000000FF&
            Height          =   285
            Left            =   7080
            TabIndex        =   24
            Top             =   600
            Width           =   1575
         End
      End
      Begin VB.TextBox txtAhname 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   1080
         TabIndex        =   5
         Top             =   2760
         Width           =   4455
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
         Left            =   8640
         Style           =   1  'Graphical
         TabIndex        =   9
         Top             =   2760
         Width           =   735
      End
      Begin VB.TextBox txtJrnNarr 
         Appearance      =   0  'Flat
         BeginProperty DataFormat 
            Type            =   0
            Format          =   "0"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   0
         EndProperty
         Height          =   645
         Left            =   1080
         TabIndex        =   8
         Top             =   3180
         Width           =   4455
      End
      Begin VB.TextBox mskCrAmt 
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
         Left            =   7080
         TabIndex        =   7
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   2760
         Width           =   1575
      End
      Begin VB.TextBox mskDrAmt 
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
         Left            =   5520
         TabIndex        =   6
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   2760
         Width           =   1575
      End
      Begin VB.TextBox txtDrCrFlag 
         Appearance      =   0  'Flat
         BeginProperty DataFormat 
            Type            =   0
            Format          =   "0"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   0
         EndProperty
         Height          =   285
         Left            =   720
         MaxLength       =   2
         TabIndex        =   4
         Top             =   2760
         Width           =   375
      End
      Begin VB.TextBox mskJrnSNo 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BeginProperty DataFormat 
            Type            =   1
            Format          =   "0"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   1
         EndProperty
         Enabled         =   0   'False
         Height          =   285
         Left            =   120
         TabIndex        =   3
         Tag             =   "AhCode"
         Text            =   "-1"
         Top             =   2760
         Width           =   615
      End
      Begin VB.CommandButton cmdSaveForm 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFF80&
         Caption         =   "&Save"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   8640
         Style           =   1  'Graphical
         TabIndex        =   11
         Top             =   6240
         Width           =   855
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd2 
         Height          =   2775
         Left            =   120
         TabIndex        =   2
         Top             =   1560
         Width           =   9135
         _ExtentX        =   16113
         _ExtentY        =   4895
         _Version        =   393216
         FixedCols       =   0
         RowHeightMin    =   285
         HighLight       =   2
         SelectionMode   =   1
         AllowUserResizing=   3
         Appearance      =   0
      End
   End
   Begin VB.TextBox txtVoid 
      CausesValidation=   0   'False
      Height          =   375
      Left            =   2520
      TabIndex        =   19
      Text            =   "Void"
      Top             =   8520
      Width           =   735
   End
   Begin MSAdodcLib.Adodc datList 
      Height          =   375
      Left            =   240
      Top             =   8520
      Visible         =   0   'False
      Width           =   2175
      _ExtentX        =   3836
      _ExtentY        =   661
      ConnectMode     =   0
      CursorLocation  =   3
      IsolationLevel  =   -1
      ConnectionTimeout=   15
      CommandTimeout  =   30
      CursorType      =   3
      LockType        =   3
      CommandType     =   8
      CursorOptions   =   0
      CacheSize       =   50
      MaxRecords      =   0
      BOFAction       =   0
      EOFAction       =   0
      ConnectStringType=   1
      Appearance      =   1
      BackColor       =   -2147483643
      ForeColor       =   -2147483640
      Orientation     =   0
      Enabled         =   -1
      Connect         =   ""
      OLEDBString     =   ""
      OLEDBFile       =   ""
      DataSourceName  =   ""
      OtherAttributes =   ""
      UserName        =   ""
      Password        =   ""
      RecordSource    =   ""
      Caption         =   "datList"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      _Version        =   393216
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
      Top             =   360
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
      Top             =   360
      UseMaskColor    =   -1  'True
      Width           =   255
   End
   Begin VB.ComboBox cmbFormEntryMode 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   315
      ItemData        =   "Journal_bkp.frx":0000
      Left            =   0
      List            =   "Journal_bkp.frx":000D
      Style           =   1  'Simple Combo
      TabIndex        =   15
      TabStop         =   0   'False
      Text            =   "cmbFormMode"
      Top             =   360
      Width           =   1455
   End
   Begin VB.Frame frFormSmry 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Summary"
      ForeColor       =   &H80000008&
      Height          =   5175
      Left            =   120
      TabIndex        =   13
      Top             =   840
      Width           =   9495
      Begin MSDataGridLib.DataGrid dgList 
         Bindings        =   "Journal_bkp.frx":002D
         Height          =   4335
         Left            =   360
         TabIndex        =   18
         Top             =   480
         Width           =   7815
         _ExtentX        =   13785
         _ExtentY        =   7646
         _Version        =   393216
         AllowUpdate     =   0   'False
         Appearance      =   0
         HeadLines       =   1
         RowHeight       =   15
         FormatLocked    =   -1  'True
         BeginProperty HeadFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ColumnCount     =   3
         BeginProperty Column00 
            DataField       =   "JrnDate"
            Caption         =   "Date"
            BeginProperty DataFormat {6D835690-900B-11D0-9484-00A0C91110ED} 
               Type            =   1
               Format          =   "dd/MM/yyyy"
               HaveTrueFalseNull=   0
               FirstDayOfWeek  =   0
               FirstWeekOfYear =   0
               LCID            =   1033
               SubFormatType   =   3
            EndProperty
         EndProperty
         BeginProperty Column01 
            DataField       =   "Ahname"
            Caption         =   "Particular"
            BeginProperty DataFormat {6D835690-900B-11D0-9484-00A0C91110ED} 
               Type            =   0
               Format          =   ""
               HaveTrueFalseNull=   0
               FirstDayOfWeek  =   0
               FirstWeekOfYear =   0
               LCID            =   1033
               SubFormatType   =   0
            EndProperty
         EndProperty
         BeginProperty Column02 
            DataField       =   "JrnAmt_iaf"
            Caption         =   "Amount"
            BeginProperty DataFormat {6D835690-900B-11D0-9484-00A0C91110ED} 
               Type            =   1
               Format          =   "0.00"
               HaveTrueFalseNull=   0
               FirstDayOfWeek  =   0
               FirstWeekOfYear =   0
               LCID            =   1033
               SubFormatType   =   1
            EndProperty
         EndProperty
         SplitCount      =   1
         BeginProperty Split0 
            MarqueeStyle    =   3
            RecordSelectors =   0   'False
            BeginProperty Column00 
               ColumnWidth     =   1260.284
            EndProperty
            BeginProperty Column01 
               ColumnWidth     =   4110.236
            EndProperty
            BeginProperty Column02 
               Alignment       =   1
               ColumnWidth     =   1530.142
            EndProperty
         EndProperty
      End
   End
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Journal Entry"
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
      TabIndex        =   12
      Top             =   0
      Width           =   9015
   End
End
Attribute VB_Name = "frmJournal"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim dbAcDatabase As New ADODB.Connection, JRNRecset As New ADODB.Recordset, Jrn_LogRS As New ADODB.Recordset, lstAHRecset As New ADODB.Recordset
Dim FormLoaded As Boolean, LastKeyPressed As Integer
Dim mJrnCode As Long, dtlAddEditMode As Boolean, dtlAddMode As Boolean, dtlEditCanceled As Boolean
Dim clsAH As clsAccountHead, clsAhCombo As New clsComboBox1
Dim lovAhName As frmSelectionList1
Dim mDrCrAmtDiff As Double

' Journal transaction detail grid Mfgrd2 column definitions
Const X2JRNICODE_COL = 0
Const X2JRNSNO_COL = 1
Const X2DRCRFLAG_COL = 2
Const X2AHNAME_COL = 3
Const X2DRAMT_COL = 4
Const X2CRAMT_COL = 5
Const X2JRNNARR_COL = 6
Const X2JRNAHCODE_COL = 7
Const X2JRNRECSTATE_COL = 8
Const MFGRD2_COLS = 9

Private Property Get FormAddEditMode() As Integer
FormAddEditMode = cmbFormEntryMode.ListIndex
End Property

Private Property Let FormAddEditMode(ByVal New_FormEntryMode As Integer)
cmbFormEntryMode.ListIndex = New_FormEntryMode
End Property

Private Sub cmdFormEnter_Click()
LastKeyPressed = 13
If TypeOf Screen.ActiveControl Is MSFlexGrid Then
    If Screen.ActiveControl.Name = Mfgrd2.Name Then
        Call Mfgrd2_KeyPress(13)
    End If
ElseIf FormAddEditMode = cFORM_SMRYMODE Then
    With datList.Recordset
    If .EOF = False And .BOF = False Then
        Call Data_EditEvent
    Else
        Call Data_AddEvent
    End If
    End With
Else
    SendKeys "{tab}"
End If

End Sub

Private Sub cmdFormEscape_Click()
LastKeyPressed = 27
If FormAddEditMode = cFORM_SMRYMODE Then
    Unload Me
ElseIf dtlAddEditMode = True Then
    dtlEditCanceled = True
    Call cmdOK_Click
Else
    If CanReject() = True Then
        Call Data_CancelEvent
        datList.Recordset.Requery
        datList.Refresh
        'datList.Recordset.Find "Ahname='" & txtAhname.Text & "'"
        
        Call ShowEntryMode(False)
        dgList.SetFocus
    End If
End If

End Sub

Private Sub cmdOK_Click()
Dim srow As Integer, mJrnSno As Integer, mJrnICode As Long, pJrnAmt As Double, pJrnAhCode As Long

srow = Mfgrd2.Row
mJrnSno = Val(Mfgrd2.TextMatrix(srow, X2JRNSNO_COL))
mJrnICode = Val(Mfgrd2.TextMatrix(srow, X2JRNICODE_COL))
pJrnAmt = 0
pJrnAhCode = 0

If cmdOK.Caption = "&OK" And dtlEditCanceled = False Then
    dbAcDatabase.BeginTrans
    With JRNRecset
    If dtlAddMode = True Then
        .AddNew
        Rem .Fields("JrnICode") = AutoNumber
        .Fields("JrnCode") = mJrnCode
        mJrnICode = .Fields("JrnICode")
    Else
        .Seek Array(mJrnCode, mJrnICode)
        pJrnAmt = .Fields("JrnAmt")
        pJrnAhCode = .Fields("JrnAhCode")
    End If
    .Fields("JrnSno") = srow
    .Fields("JrnDate") = Ctod(dtpJrnDate.Text)
    .Fields("JrnAhcode") = Val(lovAhName.BoundText)
    If UnMyNumFmt(mskDrAmt.Text) <> 0 Then
        .Fields("JrnAmt") = UnMyNumFmt(mskDrAmt.Text) * -1
    Else
        .Fields("JrnAmt") = UnMyNumFmt(mskCrAmt.Text)
    End If
    .Fields("JrnAmt_iaf") = ToMyAcFmt(.Fields("JrnAmt"))
    .Fields("JrnNarr") = txtJrnNarr.Text
    .Fields("JrnRecState") = ChkEditRecStatus(.Fields("JrnRecState"))
    .Update
    End With
    dbAcDatabase.CommitTrans
    
    If dtlAddMode = False Then
        Call clsAH.UpdateBalance(pJrnAhCode, pJrnAmt, 0, False)
    End If
    
    With JRNRecset
    .Seek Array(mJrnCode, mJrnICode)
    
    Call clsAH.UpdateBalance(.Fields("JrnAhCode"), .Fields("JrnAmt"), 0, True)
    
    Mfgrd2.TextMatrix(srow, X2JRNICODE_COL) = .Fields("JrnICode")
    Mfgrd2.TextMatrix(srow, X2JRNSNO_COL) = .Fields("JrnSno")
    Mfgrd2.TextMatrix(srow, X2DRCRFLAG_COL) = SenseDrCrFlag(.Fields("JrnAmt"))
    Mfgrd2.TextMatrix(srow, X2AHNAME_COL) = clsAH.mAhName_str
    Mfgrd2.TextMatrix(srow, X2DRAMT_COL) = ToMyNumFmt(SenseDrAmt(.Fields("JrnAmt")))
    Mfgrd2.TextMatrix(srow, X2CRAMT_COL) = ToMyNumFmt(SenseCrAmt(.Fields("JrnAmt")))
    Mfgrd2.TextMatrix(srow, X2JRNNARR_COL) = .Fields("JrnNarr")
    Mfgrd2.TextMatrix(srow, X2JRNAHCODE_COL) = .Fields("JrnAhCode")
    Mfgrd2.TextMatrix(srow, X2JRNRECSTATE_COL) = .Fields("JrnRecState")
    
    End With
    
    If dtlAddMode = True Then
        Mfgrd2.Rows = Mfgrd2.Rows + 1
    End If
    srow = srow + 1
    Mfgrd2.Row = srow
    
    Call CalcDrCrAmtTot
End If
dtlAddEditMode = False
dtlAddMode = False
dtlEditCanceled = False
Call VisibleControls(False)
Mfgrd2.SetFocus

End Sub

Private Sub cmdSaveForm_Click()
Call Data_SaveEvent
datList.Recordset.Requery
datList.Refresh
datList.Recordset.Find "tJrnSmryId='" & Format(Ctod(dtpJrnDate.Text), "yyyymmdd") + Format(mJrnCode, "0000000") & "'"

Call ShowEntryMode(False)
dgList.SetFocus

End Sub

Private Sub cmdSaveForm_GotFocus()
cmdSaveForm.Enabled = False
If Data_Verify() = True Then
    If CanAccept() = True Then
        Call cmdSaveForm_Click
    End If
End If
cmdSaveForm.Enabled = True
End Sub

Private Sub dgList_Error(ByVal DataError As Integer, Response As Integer)
If DataError = 6148 Then    ' invalid row number
    If datList.Recordset.RecordCount = 0 Then
        Call Data_AddEvent
        Response = 0
    End If
End If
End Sub

Private Sub dgList_KeyPress(KeyAscii As Integer)
Select Case KeyAscii
Case 43:    ' plus (+)
    Call Data_AddEvent
Case 45:    ' minus (-)
    Call Data_DeleteEvent
End Select

End Sub

Private Sub dtpJrnDate_GotFocus()
Call SelectText(dtpJrnDate)
End Sub

Private Sub dtpJrnDate_Validate(Cancel As Boolean)
dtpJrnDate.Text = ToDate(dtpJrnDate.Text)

End Sub

Private Sub Form_Activate()
If FormLoaded = False Then
    datList.Refresh
    'dgList.Refresh
    Call ShowEntryMode(False)
    dgList.SetFocus
Else
    JRNRecset.Requery
    
End If

FormLoaded = True
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
LastKeyPressed = KeyCode
Select Case KeyCode
Case 13:
Case 27:
End Select

End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
LastKeyPressed = KeyAscii

End Sub

Private Sub Form_Load()
Dim colcnt As Integer
FormLoaded = False
Call SetVoidControl(txtVoid)

OpenDataSource dbAcDatabase

Set clsAH = New clsAccountHead
Set clsAH.dbAcDatabase = dbAcDatabase

JRNRecset.Open "Journal", dbAcDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
JRNRecset.Index = "JrnCodeICode"

Jrn_LogRS.Open "Journal_Log", dbAcDatabase, adOpenKeyset, adLockOptimistic, adCmdTableDirect
Jrn_LogRS.Index = "JrnCodeICode"

Set lovAhName = New frmSelectionList1
Set lovAhName.dbDatabase = dbAcDatabase
lovAhName.mBoundSource = "Select AhCode,AhName from AchdMast order by Ahcode"
lovAhName.mListSource = "Select AhCode,AhName from AchdMast order by Ahname"
lovAhName.mBoundField = "Ahcode"
lovAhName.mListField = "Ahname"
lovAhName.InitRecset
Set lovAhName.mBoundControl = txtAhname

datList.ConnectionString = dbAcDatabase
datList.RecordSource = "Select Journal.*,AchdMast.Ahname,format(JrnDate,'yyyymmdd')+format(JrnCode,'0000000') as tJrnSmryId from Journal left join AchdMast on Journal.JrnAhcode=AchdMast.Ahcode where JrnSno=1 order by JrnDate,JrnCode,JrnSno"
datList.Refresh
dgList.Refresh

Mfgrd2.Rows = 2: Mfgrd2.Cols = MFGRD2_COLS
colcnt = X2JRNICODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2JRNICODE_COL": Mfgrd2.ColAlignment(colcnt) = 8
colcnt = X2JRNSNO_COL: Mfgrd2.ColWidth(colcnt) = mskJrnSNo.Width: Mfgrd2.TextMatrix(0, colcnt) = "SNo": Mfgrd2.ColAlignment(colcnt) = 8
colcnt = X2DRCRFLAG_COL: Mfgrd2.ColWidth(colcnt) = txtDrCrFlag.Width: Mfgrd2.TextMatrix(0, colcnt) = "Dr/Cr": Mfgrd2.ColAlignment(colcnt) = 2
colcnt = X2AHNAME_COL: Mfgrd2.ColWidth(colcnt) = lovAhName.mWidth: Mfgrd2.TextMatrix(0, colcnt) = "Account Head": Mfgrd2.ColAlignment(colcnt) = 2
colcnt = X2DRAMT_COL: Mfgrd2.ColWidth(colcnt) = mskDrAmt.Width: Mfgrd2.TextMatrix(0, colcnt) = "Dr.Amt": Mfgrd2.ColAlignment(colcnt) = 8
colcnt = X2CRAMT_COL: Mfgrd2.ColWidth(colcnt) = mskCrAmt.Width: Mfgrd2.TextMatrix(0, colcnt) = "Cr.Amt": Mfgrd2.ColAlignment(colcnt) = 8
colcnt = X2JRNNARR_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2JRNNARR_COL": Mfgrd2.ColAlignment(colcnt) = 2
colcnt = X2JRNAHCODE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2JRNAHCODE_COL": Mfgrd2.ColAlignment(colcnt) = 2
colcnt = X2JRNRECSTATE_COL: Mfgrd2.ColWidth(colcnt) = 0: Mfgrd2.TextMatrix(0, colcnt) = "X2JRNRECSTATE_COL": Mfgrd2.ColAlignment(colcnt) = 2

colcnt = X2JRNSNO_COL: mskJrnSNo.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2DRCRFLAG_COL: txtDrCrFlag.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2AHNAME_COL: lovAhName.mLeft = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2DRAMT_COL: mskDrAmt.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
colcnt = X2CRAMT_COL: mskCrAmt.Left = Mfgrd2.Left + Mfgrd2.ColPos(colcnt)
txtJrnNarr.Left = lovAhName.mLeft
cmdOK.Left = mskCrAmt.Left + mskCrAmt.Width + 5

Call ShowEntryMode(False)
Call VisibleControls(False)

End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
LastKeyPressed = 0
End Sub

Private Sub Form_Resize()
lblFormHeading.Width = Me.Width

End Sub

Private Sub Form_Unload(Cancel As Integer)
CloseTable JRNRecset
CloseTable Jrn_LogRS
Set clsAH = Nothing
Set clsAhCombo = Nothing
Set lovAhName = Nothing

Set dgList.DataSource = Nothing
CloseTable datList.Recordset
CloseDataSource dbAcDatabase
End Sub

Private Sub ShowEntryMode(ByVal EntryMode As Boolean)
If Me.Visible = True Then
    txtVoid.SetFocus
End If
frFormSmry.Visible = Not EntryMode
frFormDtl.Visible = EntryMode
If EntryMode = False Then
    FormAddEditMode = cFORM_SMRYMODE
End If
End Sub

Private Function Data_Verify() As Boolean
Data_Verify = False
If Val(mskFormBoundField.Text) < 1 Then
    MsgBox "Invalid Key Value !!!"
    dtpJrnDate.SetFocus
    Exit Function
End If
If dtpJrnDate.Text = "" Then
    MsgBox "Invalid Entry Date !!!"
    dtpJrnDate.SetFocus
    Exit Function
End If
If mDrCrAmtDiff <> 0 Then
    MsgBox "Debit & Credit Amount Misbalanced  !!!"
    Mfgrd2.Row = Mfgrd2.Rows - 1
    Mfgrd2.SetFocus
    Exit Function
End If

Data_Verify = True
End Function

Private Sub ShowDtlData()
Dim srow As Integer, mDrAmtTot As Double, mCrAmtTot As Double, tRecset As New ADODB.Recordset, mFormBoundCode As Long, mColCnt As Integer

mFormBoundCode = Val(mskFormBoundField.Text)
srow = 1
Mfgrd2.Rows = 2
mDrAmtTot = 0
mCrAmtTot = 0

txtJrnNarr_1.Text = ""
txtJrnNarr_1.Tag = 0

With tRecset
.Open "Select * from Journal where JrnCode=" & CStr(mFormBoundCode) & " order by JrnSno", dbAcDatabase, adOpenKeyset, adLockOptimistic
If .RecordCount > 0 Then
    Do While .EOF = False
        If InList(.Fields("JrnRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
            If .Fields("JrnSno") = -1 Then
                txtJrnNarr_1.Text = .Fields("JrnNarr")
                txtJrnNarr_1.Tag = .Fields("JrnICode")
            Else
                clsAH.GetData .Fields("JrnAhCode")
                
                Mfgrd2.TextMatrix(srow, X2JRNICODE_COL) = .Fields("JrnICode")
                Mfgrd2.TextMatrix(srow, X2JRNSNO_COL) = .Fields("JrnSno")
                Mfgrd2.TextMatrix(srow, X2DRCRFLAG_COL) = SenseDrCrFlag(.Fields("JrnAmt"))
                Mfgrd2.TextMatrix(srow, X2AHNAME_COL) = clsAH.mAhName_str
                Mfgrd2.TextMatrix(srow, X2DRAMT_COL) = ToMyNumFmt(SenseDrAmt(.Fields("JrnAmt")))
                Mfgrd2.TextMatrix(srow, X2CRAMT_COL) = ToMyNumFmt(SenseCrAmt(.Fields("JrnAmt")))
                Mfgrd2.TextMatrix(srow, X2JRNNARR_COL) = .Fields("JrnNarr")
                Mfgrd2.TextMatrix(srow, X2JRNAHCODE_COL) = .Fields("JrnAhCode")
                Mfgrd2.TextMatrix(srow, X2JRNRECSTATE_COL) = .Fields("JrnRecState")
                
                mDrAmtTot = mDrAmtTot + UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2DRAMT_COL))
                mCrAmtTot = mCrAmtTot + UnMyNumFmt(Mfgrd2.TextMatrix(srow, X2CRAMT_COL))
                
                Mfgrd2.Rows = Mfgrd2.Rows + 1
                srow = srow + 1
            End If
        End If
    
        .MoveNext
    Loop
    If srow = 1 Then
        For mColCnt = 0 To Mfgrd2.Cols - 1
            Mfgrd2.TextMatrix(srow, mColCnt) = ""
        Next
    End If
Else
    For mColCnt = 0 To Mfgrd2.Cols - 1
        Mfgrd2.TextMatrix(srow, mColCnt) = ""
    Next
End If
End With
CloseTable tRecset

Call CalcDrCrAmtTot

End Sub

Private Sub Mfgrd2_DblClick()
Call Mfgrd2_KeyPress(13)
End Sub

Private Sub Mfgrd2_GotFocus()
Call Mfgrd2_RowColChange
End Sub

Private Sub Mfgrd2_KeyDown(KeyCode As Integer, Shift As Integer)
Dim srow As Integer, mJrnICode As Long, mDeleteit As Boolean
srow = Mfgrd2.Row
mJrnICode = Val(Mfgrd2.TextMatrix(srow, X2JRNICODE_COL))

If KeyCode = vbKeyDelete And mJrnICode > 0 Then
    mDeleteit = True
    If mDeleteit = True Then
        mDeleteit = CanDelete()
    End If
    If mDeleteit = True Then
    
        dbAcDatabase.BeginTrans
        With JRNRecset
        .Seek Array(mJrnCode, mJrnICode)
        
        Call clsAH.UpdateBalance(.Fields("JrnAhCode"), .Fields("JrnAmt"), 0, False)
        
        .Fields("JrnRecState") = ChkDeleteRecStatus(.Fields("JrnRecState"))
        .Update
        End With
        dbAcDatabase.CommitTrans
        
        Call ShowDtlData
        Mfgrd2.Row = srow
        Mfgrd2.SetFocus
        Call Mfgrd2_RowColChange
    End If
End If

End Sub

Private Sub Mfgrd2_KeyPress(KeyAscii As Integer)
Dim srow As Integer, mJrnSno As Integer

If KeyAscii = 13 Then
    srow = Mfgrd2.Row
    mJrnSno = Val(Mfgrd2.TextMatrix(srow, X2JRNSNO_COL))
    
    dtlAddEditMode = True
    dtlAddMode = (mJrnSno = 0)
    Call VisibleControls(True, Mfgrd2.Top + Mfgrd2.RowPos(Mfgrd2.Row))
    If dtlAddMode = True Then
        mskJrnSNo.Text = FlexNextSeqno(Mfgrd2, X2JRNSNO_COL)
        txtDrCrFlag.Text = IIf(mDrCrAmtDiff > 0, "Cr", "Dr")
        lovAhName.BoundText = ""
        mskDrAmt.Text = ToMyNumFmt(SenseDrAmt(mDrCrAmtDiff))
        mskCrAmt.Text = ToMyNumFmt(SenseCrAmt(mDrCrAmtDiff))
        txtJrnNarr.Text = ""
    Else
        mskJrnSNo.Text = Val(Mfgrd2.TextMatrix(srow, X2JRNSNO_COL))
        txtDrCrFlag.Text = Mfgrd2.TextMatrix(srow, X2DRCRFLAG_COL)
        lovAhName.BoundText = Mfgrd2.TextMatrix(srow, X2JRNAHCODE_COL)
        mskDrAmt.Text = Mfgrd2.TextMatrix(srow, X2DRAMT_COL)
        mskCrAmt.Text = Mfgrd2.TextMatrix(srow, X2CRAMT_COL)
        txtJrnNarr.Text = Mfgrd2.TextMatrix(srow, X2JRNNARR_COL)
    End If
    txtDrCrFlag.SetFocus
    Call ValidDtl

End If


End Sub

Private Sub VisibleControls(ByVal mShowItem As Boolean, Optional ByVal mRowPos)
Rem Important - dtlAddEditMode & dtlAddMode must be initialised prior to this
If Me.Visible = True Then
    txtVoid.SetFocus
End If
If IsMissing(mRowPos) = False Then
    mskJrnSNo.Top = mRowPos
    txtDrCrFlag.Top = mRowPos
    lovAhName.mTop = mRowPos
    mskDrAmt.Top = mRowPos
    mskCrAmt.Top = mRowPos
    txtJrnNarr.Top = mRowPos + lovAhName.mHeight + 5
    cmdOK.Top = mRowPos
End If

mskJrnSNo.Text = 0
txtDrCrFlag.Text = ""
lovAhName.BoundText = ""
mskDrAmt.Text = 0
mskCrAmt.Text = 0
txtJrnNarr.Text = ""
Call ValidDtl

mskJrnSNo.Visible = mShowItem
txtDrCrFlag.Visible = mShowItem
lovAhName.mVisible = mShowItem
mskDrAmt.Visible = mShowItem
mskCrAmt.Visible = mShowItem
txtJrnNarr.Visible = mShowItem
cmdOK.Visible = mShowItem

frHeader.Enabled = (mShowItem = False)
Mfgrd2.Enabled = (mShowItem = False)
frFooter.Enabled = (mShowItem = False)
cmdSaveForm.Enabled = (mShowItem = False)

End Sub

Private Sub ValidDtl()
Dim mDataOk As Boolean
mDataOk = (Val(mskJrnSNo.Text) > 0 And (txtDrCrFlag.Text = "Dr" Or txtDrCrFlag.Text = "Cr") And lovAhName.BoundText <> "")
cmdOK.Caption = IIf(mDataOk = True, "&OK", "&Cancel")
cmdOK.BackColor = IIf(mDataOk = True, &H80FF80, &H8080FF)
End Sub

Private Sub CalcDrCrAmtTot()
Dim mDrAmtTot As Double, mCrAmtTot As Double
mDrAmtTot = FlexColSum(Mfgrd2, X2DRAMT_COL)
mCrAmtTot = FlexColSum(Mfgrd2, X2CRAMT_COL)

lblDrAmtTot.Caption = ToMyNumFmt(mDrAmtTot)
lblCrAmtTot.Caption = ToMyNumFmt(mCrAmtTot)
mDrCrAmtDiff = (mDrAmtTot - mCrAmtTot)

If mDrCrAmtDiff > 0 Then
    lblCrDiffAmt.Caption = ToMyNumFmt(mDrCrAmtDiff, , True)
    lblDrDiffAmt.Caption = ""
ElseIf mDrCrAmtDiff < 0 Then
    lblDrDiffAmt.Caption = ToMyNumFmt(mDrCrAmtDiff, , True)
    lblCrDiffAmt.Caption = ""
Else
    lblDrDiffAmt.Caption = ""
    lblCrDiffAmt.Caption = ""
End If

End Sub

Private Sub Mfgrd2_RowColChange()
Mfgrd2.ColSel = 0: Mfgrd2.ColSel = Mfgrd2.Cols - 1

End Sub

Private Sub mskCrAmt_Change()
If InList(mskCrAmt.Text, Array("0", "0.00", "")) = False And InList(mskDrAmt.Text, Array("0", "0.00", "")) = False Then
    mskDrAmt.Text = "0.00"
End If

End Sub

Private Sub mskCrAmt_GotFocus()
If InList(LastKeyPressed, Array(vbKeyReturn, vbKeyTab)) = True _
    And txtDrCrFlag.Text = "Dr" And UnMyNumFmt(mskDrAmt.Text) <> 0 Then
    SendKeys "{tab}"
Else
    Call SelectText(mskCrAmt)
End If

End Sub

Private Sub mskCrAmt_Validate(Cancel As Boolean)
mskCrAmt.Text = ToMyNumFmt(mskCrAmt.Text, , True)

Call ValidDtl
End Sub

Private Sub mskDrAmt_Change()
If InList(mskDrAmt.Text, Array("0", "0.00", "")) = False And InList(mskCrAmt.Text, Array("0", "0.00", "")) = False Then
    mskCrAmt.Text = "0.00"
End If

End Sub

Private Sub mskDrAmt_GotFocus()
If InList(LastKeyPressed, Array(vbKeyReturn, vbKeyTab)) = True _
    And txtDrCrFlag.Text = "Cr" Then
    mskCrAmt.SetFocus
Else
    Call SelectText(mskDrAmt)
End If

End Sub

Private Sub mskDrAmt_Validate(Cancel As Boolean)
mskDrAmt.Text = ToMyNumFmt(mskDrAmt.Text, , True)

Call ValidDtl
End Sub

Private Sub txtAhname_Change()
If InterActiveChange(txtAhname) = True And dtlAddEditMode = True Then
    lovAhName.ShowList (txtAhname.Text)
End If

End Sub

Private Sub txtAhname_GotFocus()
SelectText txtAhname
End Sub

Private Sub txtAhname_Validate(Cancel As Boolean)
If lovAhName.BoundText = "" Then
    Call AlertBox("Invalid Account Head Name !!!")
    txtAhname.SetFocus
    Cancel = True
End If
Call ValidDtl
End Sub

Private Sub txtDrCrFlag_Change()
If dtlAddEditMode = True Then
    txtDrCrFlag.Text = ToDrCrFlag(txtDrCrFlag.Text)
    Call SelectText(txtDrCrFlag)
End If
End Sub

Private Sub txtDrCrFlag_GotFocus()
Call SelectText(txtDrCrFlag)
End Sub

Private Sub txtDrCrFlag_Validate(Cancel As Boolean)
txtDrCrFlag.Text = ToDrCrFlag(txtDrCrFlag.Text)
If txtDrCrFlag.Text = "Dr" And UnMyNumFmt(mskCrAmt.Text) <> 0 Then
    mskDrAmt.Text = mskCrAmt.Text
    mskCrAmt.Text = "0.00"
ElseIf txtDrCrFlag.Text = "Cr" And UnMyNumFmt(mskDrAmt.Text) <> 0 Then
    mskCrAmt.Text = mskDrAmt.Text
    mskDrAmt.Text = "0.00"
End If

Call ValidDtl
End Sub

Private Sub txtJrnNarr_1_GotFocus()
Call SelectText(txtJrnNarr_1)
End Sub

Private Sub txtJrnNarr_GotFocus()
Call SelectText(txtJrnNarr)
End Sub

Private Sub Data_AddEvent()

FormAddEditMode = cFORM_ADDMODE

mskFormBoundField.Text = GetNextSeqno(dbAcDatabase, "Journal", "JrnCode")
mJrnCode = Val(mskFormBoundField.Text)
dtpJrnDate.Text = Dtoc(DefaultDate)
txtJrnNarr_1.Text = ""
txtJrnNarr_1.Tag = 0

Call ShowDtlData

Call ShowEntryMode(True)
dtpJrnDate.SetFocus
Call Data_CreateLog

End Sub

Private Sub Data_EditEvent()

FormAddEditMode = cFORM_EDITMODE

mJrnCode = datList.Recordset.Fields("JrnCode")

With JRNRecset
.Seek Array(mJrnCode)

mskFormBoundField.Text = CStr(.Fields("JrnCode"))
dtpJrnDate.Text = Dtoc(.Fields("JrnDate"))
txtJrnNarr_1.Text = ""
txtJrnNarr_1.Tag = 0
End With

Call ShowDtlData
Call ShowEntryMode(True)
Call Data_CreateLog
dtpJrnDate.SetFocus

End Sub

Private Sub Data_SaveEvent()
Dim srow As Integer, mJrnICode As Long

dbAcDatabase.BeginTrans
With JRNRecset
If FormAddEditMode = cFORM_ADDMODE Then
    .AddNew
    Rem .Fields("JrnICode") = AutoNumber
    .Fields("JrnCode") = mJrnCode
Else
    mJrnICode = Val(txtJrnNarr_1.Tag)
    
    .Seek Array(mJrnCode, mJrnICode)
End If
.Fields("JrnSno") = -1
.Fields("JrnDate") = Ctod(dtpJrnDate.Text)
.Fields("JrnAhcode") = 0
.Fields("JrnAmt") = mDrCrAmtDiff
.Fields("JrnAmt_iaf") = ToMyAcFmt(.Fields("JrnAmt"))
.Fields("JrnNarr") = txtJrnNarr_1.Text & ""
.Fields("JrnRecState") = ChkEditRecStatus(.Fields("JrnRecState"))
.Update

End With
dbAcDatabase.CommitTrans

dbAcDatabase.BeginTrans
With JRNRecset
.Seek Array(mJrnCode)
If .EOF = False Then
    Do While .Fields("JrnCode") = mJrnCode
        If InList(.Fields("JrnRecState"), Array(cREC_ADDED, cREC_EDITED, cREC_UNCHANGED)) = True Then
            .Fields("JrnDate") = Ctod(dtpJrnDate.Text)
            .Fields("JrnRecState") = cREC_UNCHANGED
        Else
            .Fields("JrnRecState") = ChkDeleteRecStatus(.Fields("JrnRecState"))
            .Update
            .Delete
        End If
    
        .MoveNext
        If .EOF = True Then
            Exit Do
        End If
    Loop
End If

End With
dbAcDatabase.CommitTrans
Call Data_RemoveLog


End Sub

Private Sub Data_DeleteEvent()
Dim mDeleteit As Boolean, srow As Long
If (datList.Recordset.EOF Or datList.Recordset.BOF) = True Then
    Exit Sub
Else
    mJrnCode = datList.Recordset.Fields("JrnCode")
    srow = dgList.Row
End If
mDeleteit = True

If mDeleteit = True Then
    mDeleteit = CanDelete()
End If
If mDeleteit = True Then
    dbAcDatabase.BeginTrans
    With JRNRecset
    .Seek Array(mJrnCode)
    Do While .Fields("JrnCode") = mJrnCode
        If .Fields("JrnSno") > 0 Then
            Call clsAH.UpdateBalance(.Fields("JrnAhCode"), .Fields("JrnAmt"), 0, False)
        End If
        
        .Fields("JrnRecState") = ChkDeleteRecStatus(.Fields("JrnRecState"))
        .Update
        .Delete
    
        .MoveNext
        If .EOF = True Then
            Exit Do
        End If
    Loop
    End With
    dbAcDatabase.CommitTrans
End If
datList.Recordset.Requery
datList.Refresh
'dgList.Rebind
'dgList.Refresh

If srow < datList.Recordset.RecordCount Then
    dgList.Row = srow
Else
    If datList.Recordset.RecordCount > 0 Then
        datList.Recordset.MoveLast
    End If
End If
End Sub

Private Sub Data_CancelEvent()
Dim pJrnAmt As Double, mRecEdited As Boolean, mRecDeleted As Boolean

dbAcDatabase.BeginTrans
With JRNRecset
.Seek Array(mJrnCode)
If .EOF = False Then
    Do While .Fields("JrnCode") = mJrnCode
        pJrnAmt = 0
        Jrn_LogRS.Seek Array(mJrnCode, .Fields("JrnICode"))
        If Jrn_LogRS.EOF = False Then
            mRecEdited = False
            mRecDeleted = False
            If .Fields("JrnSno") > 0 Then
                If .Fields("JrnRecState") = cREC_EDITED = True Then
                    Call clsAH.UpdateBalance(.Fields("JrnAhcode"), .Fields("JrnAmt"), 0, False)
                    mRecEdited = True
                ElseIf .Fields("JrnRecState") = cREC_DELETED = True Then
                    mRecDeleted = True
                End If
            End If
            ' any prior updations can be made here
            .Fields("JrnSno") = Jrn_LogRS.Fields("JrnSno")
            .Fields("JrnDate") = Jrn_LogRS.Fields("JrnDate")
            .Fields("JrnAhcode") = Jrn_LogRS.Fields("JrnAhcode")
            .Fields("JrnAmt") = Jrn_LogRS.Fields("JrnAmt")
            .Fields("JrnAmt_iaf") = ToMyAcFmt(.Fields("JrnAmt"))
            .Fields("JrnNarr") = Jrn_LogRS.Fields("JrnNarr")
            .Fields("JrnRecState") = Jrn_LogRS.Fields("JrnRecState")
            .Update
            If .Fields("JrnSno") > 0 Then
                If mRecEdited = True Or mRecDeleted = True Then
                    Call clsAH.UpdateBalance(.Fields("JrnAhcode"), .Fields("JrnAmt"), 0, True)
                End If
            End If
        Else
            Call clsAH.UpdateBalance(.Fields("JrnAhcode"), .Fields("JrnAmt"), 0, False)
            ' any prior updations can be made here
            .Fields("JrnRecState") = ChkDeleteRecStatus(.Fields("JrnRecState"))
            .Update
            .Delete
        End If
    
        .MoveNext
        If .EOF = True Then
            Exit Do
        End If
    Loop
End If
End With
dbAcDatabase.CommitTrans
Call Data_RemoveLog


End Sub

Private Sub Data_CreateLog()
With Jrn_LogRS
.Seek Array(mJrnCode)
If .EOF = True Then
    dbAcDatabase.Execute "Insert into Journal_Log Select * from Journal where JrnCode=" & CStr(mJrnCode) & " and JrnRecState=" & CStr(cREC_UNCHANGED) & ""
    Jrn_LogRS.Requery
End If

End With

End Sub

Private Sub Data_RemoveLog()

dbAcDatabase.Execute "Delete from Journal_Log where JrnCode=" & CStr(mJrnCode)
Jrn_LogRS.Requery

End Sub

