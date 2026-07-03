VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmVendorMast 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   ClientHeight    =   9090
   ClientLeft      =   60
   ClientTop       =   60
   ClientWidth     =   13485
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
   ScaleHeight     =   9090
   ScaleWidth      =   13485
   ShowInTaskbar   =   0   'False
   WindowState     =   2  'Maximized
   Begin VB.Frame frFormSmry 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Summary"
      ForeColor       =   &H80000008&
      Height          =   5535
      Left            =   240
      TabIndex        =   7
      Top             =   840
      Width           =   12735
      Begin VB.Frame frConfigure 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   4095
         Left            =   2760
         TabIndex        =   22
         Top             =   840
         Width           =   6015
         Begin VB.CheckBox chkCombinedCurBal 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Combined Current Balance"
            ForeColor       =   &H80000008&
            Height          =   285
            Left            =   1200
            TabIndex        =   15
            Top             =   1560
            Value           =   1  'Checked
            Width           =   2895
         End
         Begin VB.CheckBox chkCombinedOpBal 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Combined Opening Balance"
            ForeColor       =   &H80000008&
            Height          =   285
            Left            =   1200
            TabIndex        =   14
            Top             =   1080
            Value           =   1  'Checked
            Width           =   2895
         End
         Begin VB.CheckBox chkOpBal 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Opening Balance"
            ForeColor       =   &H80000008&
            Height          =   285
            Left            =   1200
            TabIndex        =   16
            Top             =   2040
            Value           =   1  'Checked
            Width           =   2175
         End
         Begin VB.CheckBox chkCurBal 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Current Balance"
            ForeColor       =   &H80000008&
            Height          =   285
            Left            =   1200
            TabIndex        =   17
            Top             =   2520
            Value           =   1  'Checked
            Width           =   2175
         End
         Begin VB.CommandButton cmdConfigure 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFF80&
            Caption         =   "&OK"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   2400
            TabIndex        =   18
            Top             =   3240
            Width           =   855
         End
         Begin VB.Label Label2 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Configure"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   375
            Index           =   3
            Left            =   0
            TabIndex        =   23
            Top             =   0
            Width           =   6015
         End
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd1 
         Height          =   4695
         Left            =   120
         TabIndex        =   38
         Top             =   360
         Width           =   11895
         _ExtentX        =   20981
         _ExtentY        =   8281
         _Version        =   393216
         RowHeightMin    =   315
         FocusRect       =   2
         HighLight       =   2
         SelectionMode   =   1
         Appearance      =   0
      End
   End
   Begin VB.Frame frFormDtl 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Detail"
      ForeColor       =   &H80000008&
      Height          =   5775
      Left            =   240
      TabIndex        =   8
      Top             =   1080
      Width           =   8655
      Begin VB.TextBox txtDrCrFlag 
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
         Height          =   285
         Left            =   4080
         TabIndex        =   3
         Tag             =   "AhCode"
         Text            =   "__"
         Top             =   1680
         Width           =   375
      End
      Begin VB.TextBox mskAhOpBal 
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
         Height          =   285
         Left            =   2400
         TabIndex        =   2
         Tag             =   "AhCode"
         Text            =   "0.00"
         Top             =   1680
         Width           =   1695
      End
      Begin VB.CommandButton cmdSaveForm 
         Appearance      =   0  'Flat
         BackColor       =   &H80000009&
         Caption         =   "      &Save"
         Height          =   255
         Left            =   7920
         Style           =   1  'Graphical
         TabIndex        =   4
         Top             =   4680
         Width           =   375
      End
      Begin VB.TextBox txtAhName 
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
         Left            =   2400
         MaxLength       =   50
         TabIndex        =   1
         Top             =   1080
         Width           =   5295
      End
      Begin VB.TextBox mskFormBoundField 
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
         Left            =   2400
         TabIndex        =   0
         Tag             =   "AhCode"
         Text            =   "-1"
         Top             =   480
         Width           =   1335
      End
      Begin VB.Label lblAhCurBal 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "0.00 __"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   285
         Left            =   2400
         TabIndex        =   21
         Top             =   2160
         Width           =   1935
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Current Balance:"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   2
         Left            =   840
         TabIndex        =   20
         Top             =   2160
         Width           =   1455
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Opening Balance:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   1
         Left            =   840
         TabIndex        =   19
         Top             =   1680
         Width           =   1575
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Account Head:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   0
         Left            =   840
         TabIndex        =   11
         Top             =   1080
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
         Left            =   840
         TabIndex        =   10
         Top             =   480
         Width           =   855
      End
   End
   Begin VB.Frame frCurTotal 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Current Balance:"
      ForeColor       =   &H80000008&
      Height          =   1695
      Left            =   6000
      TabIndex        =   31
      Top             =   6960
      Width           =   3375
      Begin VB.Line Line2 
         X1              =   1440
         X2              =   3135
         Y1              =   1080
         Y2              =   1080
      End
      Begin VB.Label lblCurNetBal 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         Caption         =   "0.00"
         ForeColor       =   &H80000008&
         Height          =   285
         Left            =   1440
         TabIndex        =   37
         Top             =   1200
         Width           =   1695
      End
      Begin VB.Label lblCurCrAmtTot 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         Caption         =   "0.00"
         ForeColor       =   &H80000008&
         Height          =   285
         Left            =   1440
         TabIndex        =   36
         Top             =   720
         Width           =   1695
      End
      Begin VB.Label lblCurDrAmtTot 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         Caption         =   "0.00"
         ForeColor       =   &H80000008&
         Height          =   285
         Left            =   1440
         TabIndex        =   35
         Top             =   360
         Width           =   1695
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Net Balance:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   3
         Left            =   120
         TabIndex        =   34
         Top             =   1200
         Width           =   1455
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Credit Amount:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   2
         Left            =   120
         TabIndex        =   33
         Top             =   720
         Width           =   1335
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Debit Amount:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   1
         Left            =   120
         TabIndex        =   32
         Top             =   360
         Width           =   1335
      End
   End
   Begin VB.Frame frOpnTotal 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Opening Total:"
      ForeColor       =   &H80000008&
      Height          =   1695
      Left            =   2400
      TabIndex        =   24
      Top             =   6960
      Width           =   3375
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Debit Amount:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   6
         Left            =   120
         TabIndex        =   30
         Top             =   360
         Width           =   1335
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Credit Amount:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   7
         Left            =   120
         TabIndex        =   29
         Top             =   720
         Width           =   1335
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Net Balance:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   8
         Left            =   120
         TabIndex        =   28
         Top             =   1200
         Width           =   1455
      End
      Begin VB.Label lblOpnDrAmtTot 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         Caption         =   "0.00"
         ForeColor       =   &H80000008&
         Height          =   285
         Left            =   1440
         TabIndex        =   27
         Top             =   360
         Width           =   1695
      End
      Begin VB.Label lblOpnCrAmtTot 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         Caption         =   "0.00"
         ForeColor       =   &H80000008&
         Height          =   285
         Left            =   1440
         TabIndex        =   26
         Top             =   720
         Width           =   1695
      End
      Begin VB.Label lblOpnNetBal 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         Caption         =   "0.00"
         ForeColor       =   &H80000008&
         Height          =   285
         Left            =   1440
         TabIndex        =   25
         Top             =   1200
         Width           =   1695
      End
      Begin VB.Line Line1 
         X1              =   1440
         X2              =   3135
         Y1              =   1080
         Y2              =   1080
      End
   End
   Begin VB.TextBox txtVoid 
      CausesValidation=   0   'False
      Height          =   375
      Left            =   120
      TabIndex        =   5
      TabStop         =   0   'False
      Text            =   "Void"
      Top             =   8520
      Width           =   375
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
      TabIndex        =   13
      TabStop         =   0   'False
      Top             =   0
      UseMaskColor    =   -1  'True
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
      TabIndex        =   12
      TabStop         =   0   'False
      Top             =   0
      Width           =   255
   End
   Begin VB.ComboBox cmbFormEntryMode 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   315
      ItemData        =   "VendMast.frx":0000
      Left            =   0
      List            =   "VendMast.frx":000D
      Style           =   1  'Simple Combo
      TabIndex        =   9
      TabStop         =   0   'False
      Text            =   "cmbFormMode"
      Top             =   360
      Width           =   1455
   End
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Vendor Master"
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
      TabIndex        =   6
      Top             =   0
      Width           =   9015
   End
End
Attribute VB_Name = "frmVendorMast"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim mFormLoaded As Boolean, LastKeyPressed As Integer
Dim mAhCode As Long
Dim mRemoteAccess As Boolean, mEntrySaved As Boolean, mEntryAborted As Boolean
Dim dbAcDatabase As New ADODB.Connection, dbTlgDatabase As New ADODB.Connection, dbGrpDatabase As New ADODB.Connection, dbComDatabase As New ADODB.Connection
Dim datRecset As New ADODB.Recordset
Dim mAhName_old As String
Dim clsAH As clsAccountHead, clsVND As clsToolingMasterEntry, mActiveControl As Object, clsListStru As clsSelectQueryStructure

Private Type SmryPara
mCombinedOpBal As Integer
mCombinedCurBal As Integer
mOpBal As Integer
mCurBal As Integer
End Type

Dim OldSmryPara As SmryPara

Private Sub RestoreOldSmryPara()
chkCombinedOpBal.Value = OldSmryPara.mCombinedOpBal
chkCombinedCurBal.Value = OldSmryPara.mCombinedCurBal
chkOpBal.Value = OldSmryPara.mOpBal
chkCurBal.Value = OldSmryPara.mCurBal

End Sub

Private Sub RestoreDefaultSmryPara()
chkCombinedOpBal.Value = 1
chkCombinedCurBal.Value = 1
chkOpBal.Value = 1
chkCurBal.Value = 1

End Sub

Private Sub SaveSmryPara()
OldSmryPara.mCombinedOpBal = chkCombinedOpBal.Value
OldSmryPara.mCombinedCurBal = chkCombinedCurBal.Value
OldSmryPara.mOpBal = chkOpBal.Value
OldSmryPara.mCurBal = chkCurBal.Value

End Sub

Public Property Let RemoteAccessCode(ByVal mAccessCode As Long)
mRemoteAccess = True
mAhCode = mAccessCode
End Property

Public Property Get EntryBoundCode() As Long
EntryBoundCode = Val(mskFormBoundField.Text)
End Property

Public Property Get EntrySaved() As Boolean
EntrySaved = mEntrySaved
End Property

Public Property Get EntryAborted() As Boolean
EntryAborted = mEntryAborted
End Property

Public Property Get AhName() As String
AhName = txtAhName.Text
End Property

Public Property Get FormAddEditMode() As Integer
FormAddEditMode = cmbFormEntryMode.ListIndex
End Property

Public Property Let FormAddEditMode(ByVal New_FormEntryMode As Integer)
cmbFormEntryMode.ListIndex = New_FormEntryMode
End Property

Private Sub chkCombinedCurBal_GotFocus()
FlashActiveControl chkCombinedCurBal, True
End Sub

Private Sub chkCombinedCurBal_LostFocus()
FlashActiveControl chkCombinedCurBal, False
End Sub

Private Sub chkCombinedOpBal_GotFocus()
FlashActiveControl chkCombinedOpBal, True
End Sub

Private Sub chkCombinedOpBal_LostFocus()
FlashActiveControl chkCombinedOpBal, False
End Sub

Private Sub chkCurBal_GotFocus()
FlashActiveControl chkCurBal, True
End Sub

Private Sub chkCurBal_LostFocus()
FlashActiveControl chkCurBal, False
End Sub

Private Sub chkOpBal_GotFocus()
FlashActiveControl chkOpBal, True
End Sub

Private Sub chkOpBal_LostFocus()
FlashActiveControl chkOpBal, False
End Sub

Private Sub cmdConfigure_Click()
Call SaveSmryPara

Call SmryList
MoveRecToLast datRecset
Call ShowActiveFlexRow
txtVoid.SetFocus
Mfgrd1.Enabled = True
frConfigure.Visible = False
Mfgrd1.SetFocus

End Sub

Private Sub cmdFormEnter_Click()
LastKeyPressed = 13
If FormAddEditMode = cFORM_SMRYMODE And frConfigure.Visible = False Then
    With datRecset
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
Dim srow As Long, mRecAbsPos As Long
LastKeyPressed = 27
If frConfigure.Visible = True Then
    txtVoid.SetFocus
    Mfgrd1.Enabled = True
    frConfigure.Visible = False
    Mfgrd1.SetFocus
    Call RestoreOldSmryPara
ElseIf FormAddEditMode = cFORM_SMRYMODE Then
    Unload Me
Else
    txtVoid.SetFocus
    If CanReject() = True Then
        mEntryAborted = True
        mRecAbsPos = datRecset.AbsolutePosition
        Call Data_CancelEvent
        datRecset.Requery
        Call SmryList
        If datRecset.RecordCount > mRecAbsPos And mRecAbsPos > 0 Then
            datRecset.Move mRecAbsPos - 1, 1
        Else
            MoveRecToLast datRecset
        End If
        Call ShowActiveFlexRow
        
        Call ShowEntryMode(False)
        If mRemoteAccess = True Then
            Me.Hide
            ''Unload Me
            Exit Sub
        Else
            Mfgrd1.SetFocus
        End If
    Else
        txtAhName.SetFocus
    End If
End If

End Sub

Private Sub cmdSaveForm_Click()
Call Data_SaveEvent

datRecset.Requery
Call SmryList
datRecset.Find "AhName='" & txtAhName.Text & "'", Start:=1
Call ShowActiveFlexRow

Call ShowEntryMode(False)
Mfgrd1.SetFocus
Call CalcDrCrAmtTot

End Sub

Private Sub cmdSaveForm_GotFocus()
txtVoid.SetFocus
cmdSaveForm.Enabled = False
If Data_Verify() = True Then
    If CanAccept() = True Then
        Call cmdSaveForm_Click
        If mRemoteAccess = True Then
            ''Unload Me
            Me.Hide
            Exit Sub
        End If
    Else
        txtAhName.SetFocus
    End If
End If
cmdSaveForm.Enabled = True
End Sub

Private Sub Mfgrd1_DblClick()
Call cmdFormEnter_Click
End Sub

Private Sub Mfgrd1_GotFocus()
Mfgrd1.Col = FlexLeftVisibleCol(Mfgrd1)
If Mfgrd1.SelectionMode = flexSelectionByRow Then
    Mfgrd1.ColSel = 0: Mfgrd1.ColSel = Mfgrd1.Cols - 1
End If
Call Mfgrd1_RowColChange
End Sub

Private Sub Mfgrd1_KeyDown(KeyCode As Integer, Shift As Integer)
If Shift = 0 Then
    Select Case KeyCode
    Case vbKeyF12
        frConfigure.Visible = True
        Mfgrd1.Enabled = False
        chkCombinedOpBal.SetFocus
    Case vbKeyAdd    ' plus (+)
        Call Data_AddEvent
    Case vbKeySubtract, vbKeyDelete    ' minus (-)
        Call Data_DeleteEvent
    End Select
End If

End Sub

Private Sub Mfgrd1_RowColChange()
If datRecset.RecordCount > 0 Then
    If datRecset.AbsolutePosition <> Mfgrd1.Row - Mfgrd1.FixedRows + 1 Then
        datRecset.MoveFirst
        datRecset.Move Mfgrd1.Row - Mfgrd1.FixedRows, 1     ' Mfgrd1.Row is already less by one
    End If
End If

End Sub

Private Sub Form_Activate()
If mFormLoaded = False Then
    If mRemoteAccess = True Then
        If mAhCode = 0 Then
            Call Data_AddEvent
        Else
            Call Data_EditEvent
        End If
    Else
        MoveRecToLast datRecset
        Mfgrd1.SetFocus
    End If
Else
    
End If

mFormLoaded = True
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
mFormLoaded = False
mEntrySaved = False: mEntryAborted = False
Call Form_Resize

Call SetVoidControl(txtVoid)
frConfigure.Visible = False

Call RestoreDefaultSmryPara
Call SaveSmryPara

OpenAcDataSource dbAcDatabase
OpenTlgDataSource dbTlgDatabase
OpenGrpDataSource dbGrpDatabase
OpenComDataSource dbComDatabase

Set clsAH = New clsAccountHead
Set clsAH.dbAcDatabase = dbAcDatabase
Set clsAH.dbGrpDatabase = dbGrpDatabase
Set clsListStru = New clsSelectQueryStructure

Set clsVND = New clsToolingMasterEntry
Set clsVND.dbAcDatabase = dbAcDatabase
Set clsVND.dbTlgDatabase = dbTlgDatabase
clsVND.MastName = "VendMast"

If mRemoteAccess = True Then
    datRecset.Open "Select * from AchdMast inner join VendMast on AchdMast.AhCode=VendMast.VndCode where AhCode=" & CStr(mAhCode) & " order by AhName", dbComDatabase, adOpenKeyset, adLockOptimistic
Else
    datRecset.Open "Select * from AchdMast inner join VendMast on AchdMast.AhCode=VendMast.VndCode order by AhName", dbComDatabase, adOpenKeyset, adLockOptimistic
End If
Call SmryList
MoveRecToFirst datRecset
Call ShowActiveFlexRow

Call ShowEntryMode(False)

End Sub

Private Sub Form_Resize()
lblFormHeading.Width = Me.Width
cmdFormEscape.Left = Me.Width - (cmdFormEscape.Width * 2)
cmdFormEnter.Left = Me.Width + cmdFormEscape.Width

End Sub

Private Sub Form_Unload(Cancel As Integer)
Set clsAH = Nothing
Set clsVND = Nothing
Set clsListStru = Nothing

CloseTable datRecset
CloseDataSource dbAcDatabase
CloseDataSource dbTlgDatabase
CloseDataSource dbGrpDatabase
CloseDataSource dbComDatabase
End Sub

Private Sub ShowEntryMode(ByVal EntryMode As Boolean)
If Me.Visible = True Then
    txtVoid.SetFocus
End If
frFormSmry.Visible = Not EntryMode
frFormDtl.Visible = EntryMode: frFormDtl.Enabled = EntryMode
cmdSaveForm.Enabled = EntryMode
If EntryMode = False Then
    FormAddEditMode = cFORM_SMRYMODE
End If

End Sub

Private Function Data_Verify() As Boolean
Data_Verify = False
If Val(mskFormBoundField.Text) < 1 Then
    ErrorBox "Invalid Key Value !!!"
    txtAhName.SetFocus
    Exit Function
End If
If Trim(txtAhName.Text) = "" Then
    ErrorBox "Invalid Account Head Name !!!"
    txtAhName.SetFocus
    Exit Function
End If
If txtAhName.Text <> mAhName_old Then
    If ChkDuplicate(dbAcDatabase, "Achdmast", "Ahname", txtAhName.Text, "Ahcode", Val(mskFormBoundField.Text)) = True Then
        ErrorBox "Duplicate Input !!!"
        txtAhName.SetFocus
        Exit Function
    End If
End If




Data_Verify = True
End Function

Private Sub mskAhOpBal_GotFocus()
FlashActiveControl mskAhOpBal, True
End Sub

Private Sub mskAhOpBal_LostFocus()
FlashActiveControl mskAhOpBal, False
End Sub

Private Sub mskAhOpBal_Validate(Cancel As Boolean)
mskAhOpBal.Text = ToMyNumFmt(mskAhOpBal.Text)
End Sub

Private Sub txtAhname_GotFocus()
FlashActiveControl txtAhName, True
End Sub

Private Sub txtAhName_LostFocus()
FlashActiveControl txtAhName, False
End Sub

Private Sub txtAhname_Validate(Cancel As Boolean)
txtAhName.Text = ToMyString(txtAhName.Text)
If Trim(txtAhName.Text) = "" Then
    ErrorBox "Invalid Input !!!"
    Cancel = True
    txtAhName.SetFocus
Else
    If txtAhName.Text <> mAhName_old Then
        If ChkDuplicate(dbAcDatabase, "Achdmast", "Ahname", txtAhName.Text, "Ahcode", Val(mskFormBoundField.Text)) = True Then
            ErrorBox "Duplicate Input !!!"
            Cancel = True
            txtAhName.SetFocus
        End If
    End If
End If

End Sub

Private Sub Data_AddEvent()

If clsAH.BeginAchd(0) = False Then
    Exit Sub
Else
    If clsVND.BeginMast(0, clsAH.ActiveAhCode) = False Then
        Exit Sub
    End If
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_ADDMODE
    
clsAH.Clear: clsVND.Clear
mAhCode = clsAH.ActiveAhCode
mskFormBoundField.Text = mAhCode
txtAhName.Text = ""
mskAhOpBal.Text = ToMyNumFmt(0)
lblAhCurBal.Caption = ToMyAcFmt(0)
txtDrCrFlag.Text = SenseDrCrFlag(0)

mAhName_old = txtAhName.Text

Call ShowEntryMode(True)
txtAhName.SetFocus

End Sub

Private Sub Data_EditEvent()
Dim mOpnBal As Double, mCurBal As Double, mLCount As Integer, mUCount As Integer, mCount As Integer

If clsAH.BeginAchd(datRecset.Fields("AhCode")) = False Then
    Exit Sub
Else
    If clsVND.BeginMast(datRecset.Fields("AhCode")) = False Then
        Exit Sub
    End If
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_EDITMODE
With datRecset
mAhCode = .Fields("AhCode")
clsAH.GetData mAhCode: clsVND.GetData mAhCode
mskFormBoundField.Text = CStr(.Fields("AhCode"))
txtAhName.Text = .Fields("AhName")

End With
    
mOpnBal = 0
With clsAH
Rem opn balance
mLCount = .LOpnBal
mUCount = .UOpnBal
For mCount = mLCount To mUCount
    mOpnBal = mOpnBal + .OpnAmt(mCount)
Next mCount

Rem current balance
mLCount = .LCurBal
mUCount = .UCurBal
For mCount = mLCount To mUCount
    mCurBal = mCurBal + .CurAmt(mCount)
Next mCount
End With

mskAhOpBal.Text = ToMyNumFmt(mOpnBal, mUseAbs:=True)
lblAhCurBal.Caption = ToMyAcFmt(mCurBal)
txtDrCrFlag.Text = SenseDrCrFlag(mOpnBal)

mAhName_old = txtAhName.Text

Call ShowEntryMode(True)
txtAhName.SetFocus

End Sub

Private Sub Data_SaveEvent()
With clsAH
If FormAddEditMode = cFORM_ADDMODE Then
    .Clear: clsVND.Clear
Else
    .GetData mAhCode: clsVND.GetData mAhCode
End If

.mAhName_str = txtAhName.Text
If FormAddEditMode = cFORM_ADDMODE Then
    .AddOpnBal mJrnAmt:=Val(UnMyAcFmt(mskAhOpBal.Text, txtDrCrFlag.Text))
    
    .AddNew: clsVND.AddNew .mAhCode_lng
    mskFormBoundField.Text = .mAhCode_lng
Else
    .EditOpnBal mJrnICode:=.OpnICode(.LOpnBal), mJrnAmt:=Val(UnMyAcFmt(mskAhOpBal.Text, txtDrCrFlag.Text))
    
    .Update mAhCode: clsVND.Update mAhCode
End If
If .mAhCode_lng > 0 Then   ' updated successfully
    .UpdateAchd .mAhCode_lng: clsVND.UpdateMast .mAhCode_lng
    .EndAchd .mAhCode_lng: clsVND.EndMast .mAhCode_lng
    
    mEntrySaved = True
Else
    Call Data_CancelEvent
    ErrorBox "Entry Cancelled !!!"
End If

End With

End Sub

Private Sub Data_DeleteEvent()
Dim mDeleteit As Boolean, mRecAbsPos As Long
If (datRecset.EOF Or datRecset.BOF) = True Then
    Exit Sub
End If

mAhCode = datRecset.Fields("Ahcode")
mRecAbsPos = datRecset.AbsolutePosition

If clsAH.CanDeleteAchd(mAhCode) = True And clsVND.CanDeleteMast(mAhCode, mSkipConfirm:=True) = True Then
    txtVoid.SetFocus
    With clsAH
    .BeginAchd mAhCode: clsVND.BeginMast mAhCode
    .DeleteAchd mAhCode: clsVND.DeleteMast mAhCode
    .UpdateAchd mAhCode: clsVND.UpdateMast mAhCode
    .EndAchd mAhCode: clsVND.EndMast mAhCode
    End With
    
    datRecset.Requery
    Call SmryList
    If datRecset.RecordCount > mRecAbsPos And mRecAbsPos > 0 Then
        datRecset.Move mRecAbsPos - 1, 1
    Else
        MoveRecToLast datRecset
    End If
    Call ShowActiveFlexRow
    Mfgrd1.SetFocus
Else
    Mfgrd1.SetFocus
End If

End Sub

Private Sub Data_CancelEvent()
clsAH.CancelAchd mAhCode: clsVND.CancelMast mAhCode
clsAH.EndAchd mAhCode: clsVND.EndMast mAhCode
mEntryAborted = True

End Sub

Private Sub txtDrCrFlag_Change()
If InterActiveChange(txtDrCrFlag) = True Then
    txtDrCrFlag.Text = ToDrCrFlag(txtDrCrFlag.Text)
    Call SelectText(txtDrCrFlag)
End If

End Sub

Private Sub txtDrCrFlag_GotFocus()
FlashActiveControl txtDrCrFlag, True
End Sub

Private Sub txtDrCrFlag_LostFocus()
FlashActiveControl txtDrCrFlag, False
End Sub

Private Sub txtDrCrFlag_Validate(Cancel As Boolean)
txtDrCrFlag.Text = ToDrCrFlag(txtDrCrFlag.Text)
End Sub

Private Sub SmryList()
Dim gcolcount As Integer, acount As Integer, mLow As Integer, mHigh As Integer, mPos As Integer, srow As Long, mColCount As Integer
Dim aAcntBal As Variant, mBal As Double

clsListStru.Clear

Rem column definitions
clsListStru.AddFields mExpr:="AhCode", mAttrib:=cFAT_SYSTEM
clsListStru.AddFields mExpr:="AhName", mTitle:="Account Name", mAlign:=flexAlignLeftCenter, mWidth:=4000, mShowItem:=True

clsListStru.AddFields mExpr:="AhOpBal", mTitle:="Op.Balance", mAlign:=flexAlignRightCenter, mWidth:=1750, mShowItem:=False
clsListStru.AddFields mExpr:="AhOpDrBal", mTitle:="Op.Dr.Bal", mAlign:=flexAlignRightCenter, mWidth:=1750, mShowItem:=False
clsListStru.AddFields mExpr:="AhOpCrBal", mTitle:="Op.Cr.Bal", mAlign:=flexAlignRightCenter, mWidth:=1750, mShowItem:=False

clsListStru.AddFields mExpr:="AhCurBal", mTitle:="Cur.Balance", mAlign:=flexAlignRightCenter, mWidth:=1750, mShowItem:=False
clsListStru.AddFields mExpr:="AhCurDrBal", mTitle:="Cur.Dr.Bal", mAlign:=flexAlignRightCenter, mWidth:=1750, mShowItem:=False
clsListStru.AddFields mExpr:="AhCurCrBal", mTitle:="Cur.Cr.Bal", mAlign:=flexAlignRightCenter, mWidth:=1750, mShowItem:=False

If chkOpBal.Value = 1 Then
    If chkCombinedOpBal.Value = 1 Then
        clsListStru.UpdateField mAlias:="AhOpBal", mShowItem:=True
    Else
        clsListStru.UpdateField mAlias:="AhOpDrBal", mShowItem:=True
        clsListStru.UpdateField mAlias:="AhOpCrBal", mShowItem:=True
    End If
End If
If chkCurBal.Value = 1 Then
    If chkCombinedCurBal.Value = 1 Then
        clsListStru.UpdateField mAlias:="AhCurBal", mShowItem:=True
    Else
        clsListStru.UpdateField mAlias:="AhCurDrBal", mShowItem:=True
        clsListStru.UpdateField mAlias:="AhCurCrBal", mShowItem:=True
    End If
End If

datRecset.Requery

Mfgrd1.Cols = clsListStru.UFields + 1
gcolcount = 0
mLow = clsListStru.LFields
mHigh = clsListStru.UFields
For acount = mLow To mHigh
    With Mfgrd1
    'If .Cols <= gcolcount Then
    '    .Cols = gcolcount + 1
    'End If
    .ColAlignment(gcolcount) = clsListStru.Field_Align(acount)
    If clsListStru.Field_Show(acount) = True Then
        .ColWidth(gcolcount) = clsListStru.Field_Width(acount)
    Else
        .ColWidth(gcolcount) = 0
    End If
    .TextMatrix(0, gcolcount) = clsListStru.Field_Title(acount)
    End With
    
    gcolcount = gcolcount + 1
Next acount
If FlexColsWidth(Mfgrd1) > Mfgrd1.Width Then
    Mfgrd1.SelectionMode = flexSelectionFree
Else
    Mfgrd1.SelectionMode = flexSelectionByRow
End If

srow = 1
MoveRecToFirst datRecset
With datRecset
If .RecordCount > 0 Then
    Do While .EOF = False
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("AhCode")) = .Fields("AhCode")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("AhName")) = .Fields("AhName")
        If chkOpBal.Value = 1 Then
            If chkCombinedOpBal.Value = 1 Then
                aAcntBal = clsAH.GetAhOpnBal(.Fields("AhCode"), mDrCrSeperated:=False)
                
                mBal = aAcntBal(0)
                
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("AhOpBal")) = ToMyAcFmt(mBal)
            Else
                aAcntBal = clsAH.GetAhOpnBal(.Fields("AhCode"), mDrCrSeperated:=True)
                Rem debit balance
                mBal = aAcntBal(0)
                
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("AhOpDrBal")) = ToMyAcFmt(mBal)
                
                Rem credit balance
                mBal = aAcntBal(1)
                
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("AhOpCrBal")) = ToMyAcFmt(mBal)
            End If
        End If
        If chkCurBal.Value = 1 Then
            If chkCombinedCurBal.Value = 1 Then
                aAcntBal = clsAH.GetAhCurBal(.Fields("AhCode"), sFinYrEndDate, mDrCrSeperated:=False)
                
                mBal = aAcntBal(0)
                
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("AhCurBal")) = ToMyAcFmt(mBal)
            Else
                aAcntBal = clsAH.GetAhCurBal(.Fields("AhCode"), sFinYrEndDate, mDrCrSeperated:=True)
                Rem debit balance
                mBal = aAcntBal(0)
                
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("AhCurDrBal")) = ToMyAcFmt(mBal)
                
                Rem credit balance
                mBal = aAcntBal(1)
                
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("AhCurCrBal")) = ToMyAcFmt(mBal)
            End If
        End If
        srow = srow + 1
        If Mfgrd1.Rows < srow + 1 Then
            Mfgrd1.Rows = Mfgrd1.Rows + 1
        End If
        
        .MoveNext
    Loop
End If
End With
For mColCount = 0 To Mfgrd1.Cols - 1
    Mfgrd1.TextMatrix(srow, mColCount) = ""
Next mColCount
Mfgrd1.Rows = srow + 1

Call CalcDrCrAmtTot

End Sub

Private Function GetActiveControl() As Boolean
Dim mCnt As Integer

On Error GoTo errhand
GetActiveControl = False
If Screen.ActiveForm.Name = Me.Name Then
    If Screen.ActiveControl.Visible = True And Screen.ActiveControl.Enabled = True Then
        Set mActiveControl = Screen.ActiveControl
        GetActiveControl = True
    End If
End If

errhand:
mCnt = mCnt + 1
If mCnt > 2 Then
    Exit Function
End If

End Function

Private Function SetActiveControl() As Boolean
Dim mCnt As Integer

On Error GoTo errhand
SetActiveControl = False
If Screen.ActiveForm.Name = Me.Name And IsEmpty(mActiveControl) = False Then
    If mActiveControl.Visible = True And mActiveControl.Enabled = True Then
        mActiveControl.SetFocus
        SetActiveControl = True
    End If
End If

errhand:
mCnt = mCnt + 1
If mCnt > 2 Then
    Exit Function
End If

End Function

Private Sub CalcDrCrAmtTot()
Dim mOpnDrAmtTot As Double, mOpnCrAmtTot As Double, mOpnNetBal As Double, mCurDrAmtTot As Double, mCurCrAmtTot As Double, mCurNetBal As Double
Dim aBal As Variant, mRowPos As Integer

lblOpnDrAmtTot.Caption = ToMyAcFmt(0)
lblOpnCrAmtTot.Caption = ToMyAcFmt(0)
lblOpnNetBal.Caption = ToMyAcFmt(0)
lblCurDrAmtTot.Caption = ToMyAcFmt(0)
lblCurCrAmtTot.Caption = ToMyAcFmt(0)
lblCurNetBal.Caption = ToMyAcFmt(0)

aBal = clsAH.GetAllAhOpnBal(mDrCrSeperated:=True)

mOpnDrAmtTot = aBal(0)
mOpnCrAmtTot = aBal(1)
mOpnNetBal = mOpnDrAmtTot + mOpnCrAmtTot

aBal = clsAH.GetAllAhCurBal(sFinYrEndDate, mDrCrSeperated:=True)

mCurDrAmtTot = aBal(0)
mCurCrAmtTot = aBal(1)
mCurNetBal = mCurDrAmtTot + mCurCrAmtTot

lblOpnDrAmtTot.Caption = ToMyAcFmt(mOpnDrAmtTot)
lblOpnCrAmtTot.Caption = ToMyAcFmt(mOpnCrAmtTot)
lblOpnNetBal.Caption = ToMyAcFmt(mOpnNetBal)
lblCurDrAmtTot.Caption = ToMyAcFmt(mCurDrAmtTot)
lblCurCrAmtTot.Caption = ToMyAcFmt(mCurCrAmtTot)
lblCurNetBal.Caption = ToMyAcFmt(mCurNetBal)

'frBottomTotal.Left = (dgList.Columns(dgList.Columns.Count - 1).Left + dgList.Columns(dgList.Columns.Count - 1).Width - frBottomTotal.Width)

End Sub

Private Sub ShowActiveFlexRow()
Dim mReqdRow As Long

With datRecset
mReqdRow = .AbsolutePosition + Mfgrd1.FixedRows - 1
If .RecordCount > 0 And .EOF = False And .BOF = False Then
    If Mfgrd1.RowIsVisible(mReqdRow) = False Then
        If mReqdRow > Mfgrd1.TopRow Then
            Mfgrd1.TopRow = mReqdRow - Int(Mfgrd1.Height / Mfgrd1.RowHeightMin) + Mfgrd1.FixedRows + 1
        Else
            Mfgrd1.TopRow = mReqdRow
        End If
    End If
    Mfgrd1.Row = mReqdRow
Else
    Mfgrd1.Row = Mfgrd1.FixedRows
End If
End With

End Sub

