VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmMonthlyRepFmt2nd 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   ClientHeight    =   8220
   ClientLeft      =   60
   ClientTop       =   60
   ClientWidth     =   13890
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
   LockControls    =   -1  'True
   ScaleHeight     =   8220
   ScaleWidth      =   13890
   ShowInTaskbar   =   0   'False
   Begin VB.Frame frFormDtl 
      Appearance      =   0  'Flat
      BackColor       =   &H008AB4A6&
      Caption         =   "Detail"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   3900
      Left            =   195
      TabIndex        =   8
      Top             =   810
      Width           =   10485
      Begin VB.TextBox dtpMrf2Date 
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
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   2400
         MaxLength       =   50
         TabIndex        =   1
         Text            =   "dd/mm/yyyy"
         Top             =   960
         Width           =   1515
      End
      Begin VB.TextBox txtMrf2FilePath 
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
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   645
         Left            =   2400
         MaxLength       =   100
         MultiLine       =   -1  'True
         TabIndex        =   3
         Top             =   1920
         Width           =   7335
      End
      Begin VB.CommandButton cmdSaveForm 
         Appearance      =   0  'Flat
         BackColor       =   &H80000009&
         Height          =   390
         Left            =   10005
         Style           =   1  'Graphical
         TabIndex        =   4
         Top             =   3480
         Width           =   465
      End
      Begin VB.TextBox txtMrf2Name 
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
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   2400
         MaxLength       =   50
         TabIndex        =   2
         Top             =   1440
         Width           =   7335
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
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   2400
         TabIndex        =   0
         Tag             =   "AhCode"
         Text            =   "-1"
         Top             =   480
         Width           =   1335
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Month Date:"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   1
         Left            =   840
         TabIndex        =   19
         Top             =   960
         Width           =   1575
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "File Path:"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   8
         Left            =   840
         TabIndex        =   18
         Top             =   1920
         Width           =   1335
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Format Name:"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   0
         Left            =   840
         TabIndex        =   11
         Top             =   1440
         Width           =   1575
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Code:"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   0
         Left            =   840
         TabIndex        =   10
         Top             =   480
         Width           =   855
      End
   End
   Begin VB.TextBox txtVoid 
      CausesValidation=   0   'False
      Height          =   375
      Left            =   120
      TabIndex        =   5
      TabStop         =   0   'False
      Text            =   "Text1"
      Top             =   7680
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
      ItemData        =   "MnRepFm2.frx":0000
      Left            =   0
      List            =   "MnRepFm2.frx":000D
      Style           =   1  'Simple Combo
      TabIndex        =   9
      TabStop         =   0   'False
      Text            =   "cmbFormMode"
      Top             =   360
      Width           =   1455
   End
   Begin VB.Frame frFormSmry 
      Appearance      =   0  'Flat
      BackColor       =   &H008AB4A6&
      Caption         =   "Summary"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   5175
      Left            =   195
      TabIndex        =   7
      Top             =   795
      Width           =   11895
      Begin VB.TextBox txtSearch1Text 
         Appearance      =   0  'Flat
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   1080
         TabIndex        =   14
         Top             =   360
         Width           =   4695
      End
      Begin VB.TextBox txtList1Col 
         Appearance      =   0  'Flat
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Index           =   0
         Left            =   240
         MousePointer    =   1  'Arrow
         TabIndex        =   16
         TabStop         =   0   'False
         Top             =   1680
         Width           =   1335
      End
      Begin MSFlexGridLib.MSFlexGrid Mfgrd1 
         Height          =   4050
         Left            =   225
         TabIndex        =   15
         Top             =   780
         Width           =   11025
         _ExtentX        =   19447
         _ExtentY        =   7144
         _Version        =   393216
         RowHeightMin    =   315
         FocusRect       =   2
         HighLight       =   2
         SelectionMode   =   1
         Appearance      =   0
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Search:"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   1
         Left            =   240
         TabIndex        =   17
         Top             =   360
         Width           =   735
      End
   End
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Monthly Report Format 2nd"
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
Attribute VB_Name = "frmMonthlyRepFmt2nd"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Dim FormLoaded As Boolean, mLastKeyPressed As Integer, mMaskKeyPressed As Integer
Dim mMrf2Code As Long
Dim mRemoteAccess As Boolean, mEntrySaved As Boolean, mEntryAborted As Boolean
Dim dbVgnDatabase As New ADODB.Connection, datRecset As New ADODB.Recordset
Dim mMrf2Name_old As String, mMrf2Date_old As Date, mMrf2DateChanged As Boolean
Dim clsMRF1 As clsVgnMasterEntry, mActiveControl As Object, clsListStru As clsSelectQueryStructure
Dim fso As Scripting.FileSystemObject
Dim clsExcel As New clsExcelApp, mXlsRepPath As String

Public Property Let RemoteAccessCode(ByVal mAccessCode As Long)
mRemoteAccess = True
mMrf2Code = mAccessCode
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

Public Property Get Mrf2Name() As String
Mrf2Name = txtMrf2Name.Text
End Property

Public Property Get FormAddEditMode() As Integer
FormAddEditMode = cmbFormEntryMode.ListIndex
End Property

Public Property Let FormAddEditMode(ByVal New_FormEntryMode As Integer)
cmbFormEntryMode.ListIndex = New_FormEntryMode
ChkEntryModeSign cmbFormEntryMode

End Property

Public Property Get SecuMenuName() As String
SecuMenuName = Me.Name
End Property

Private Sub cmdFormEnter_Click()

mLastKeyPressed = 13
If FormAddEditMode = cFORM_SMRYMODE Then
    With datRecset
    If .EOF = False And .BOF = False Then
        Set fso = New Scripting.FileSystemObject
        If fso.FileExists(Trim(datRecset.fields("Mrf2FilePath"))) = True Then
            Me.MousePointer = vbHourglass
            mXlsRepPath = Trim(datRecset.fields("Mrf2FilePath"))
            clsExcel.InitExcelApp
            
            clsExcel.OpenExcelWorkBook mXlsRepPath
            clsExcel.Visible = True
            
            clsExcel.CloseExcelApp
            Set clsExcel = Nothing
            Me.MousePointer = vbNormal
        Else
            Call Data_EditEvent
        End If
        Set fso = Nothing
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

mLastKeyPressed = 27
If FormAddEditMode = cFORM_SMRYMODE Then
    If Len(txtSearch1Text.Text) > 0 Then
        txtSearch1Text.Text = ""
        Call txtSearch1Text_InterActiveChange
    Else
        Unload Me
    End If
Else
    txtVoid.SetFocus
    If CanReject() = True Then
        mEntryAborted = True
        mRecAbsPos = datRecset.AbsolutePosition
        Call Data_CancelEvent
        Call SmryList
        If datRecset.RecordCount > mRecAbsPos And mRecAbsPos > 0 Then
            datRecset.Move mRecAbsPos - 1, 1
        Else
            MoveRecToLast datRecset
        End If
        ShowRecActiveFlexRow datRecset, Mfgrd1
        
        Call ShowEntryMode(False)
        If mRemoteAccess = True Then
            Me.Hide
            ''Unload Me
            Exit Sub
        Else
            Mfgrd1.SetFocus
        End If
    Else
        dtpMrf2Date.SetFocus
    End If
End If

End Sub

Private Sub cmdSaveForm_Click()
Call Data_SaveEvent

Call SmryList
txtSearch1Text_InterActiveChange txtMrf2Name.Text

''If txtSearch1Text.Text <> txtMrf2Name.Text Then
''    txtSearch1Text.Text = txtMrf2Name.Text
''Else
''    Call txtSearch1Text_Change
''End If
''datRecset.Find "Mrf2Name='" & txtMrf2Name.Text & "'", Start:=1
''ShowRecActiveFlexRow datRecset, Mfgrd1

ShowEntryMode False
Mfgrd1.SetFocus

End Sub

Private Sub cmdSaveForm_GotFocus()
txtVoid.SetFocus
cmdSaveForm.Enabled = False
If Data_Verify() = True Then
    If CanAccept() = True Then
        Call cmdSaveForm_Click
        If mRemoteAccess = True Then
            Me.Hide
            Exit Sub
        End If
    Else
        dtpMrf2Date.SetFocus
    End If
End If
cmdSaveForm.Enabled = True

End Sub

Private Sub dtpMrf2Date_Change()
mMrf2DateChanged = True
End Sub

Private Sub dtpMrf2Date_GotFocus()
FlashActiveControl dtpMrf2Date, True
mMrf2DateChanged = False
End Sub

Private Sub dtpMrf2Date_LostFocus()
FlashActiveControl dtpMrf2Date, False
End Sub

Private Sub dtpMrf2Date_Validate(Cancel As Boolean)
dtpMrf2Date.Text = ToMyDate(dtpMrf2Date.Text)
If IsFinYrDate(Ctod(dtpMrf2Date.Text)) = False Then
    ErrorBox "Invalid Date !!!"
    dtpMrf2Date.SetFocus
    Cancel = True
Else
    If Ctod(dtpMrf2Date.Text) <> mMrf2Name_old Or FormAddEditMode = cFORM_ADDMODE Then
        If ChkIsDuplicate(dbVgnDatabase, "MonthRepFmt2nd", "Mrf2Name", Ctod(dtpMrf2Date.Text), "Mrf2Code", Val(mskFormBoundField.Text)) = True Then
            ErrorBox "Duplicate Input !!!"
            Cancel = True
            dtpMrf2Date.SetFocus
        End If
    End If
End If
If Cancel = False Then
    If mMrf2DateChanged = True Then
        Call MakeDateFileStr
    End If
End If

End Sub

Private Sub MakeDateFileStr()
txtMrf2Name.Text = Format(Ctod(dtpMrf2Date.Text), "MMMM-YYYY")
txtMrf2FilePath.Text = AddBS(sCmpDataPath) & "Mrf2" & Format(Ctod(dtpMrf2Date.Text), "YYYY") & Format(Ctod(dtpMrf2Date.Text), "MM") & ".Xls"

End Sub

Private Sub Form_Activate()
If FormLoaded = False Then
    If mRemoteAccess = True Then
        If mMrf2Code = 0 Then
            Call Data_AddEvent
        Else
            Call Data_EditEvent
        End If
    Else
        MoveRecToFirst datRecset
        ShowRecActiveFlexRow datRecset, Mfgrd1
        Mfgrd1.SetFocus
    End If
Else

End If

FormLoaded = True
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
mLastKeyPressed = KeyCode
mMaskKeyPressed = Shift
''If ActiveControl.Name = Mfgrd1.Name Then
''    If InList(KeyCode, Array(vbKeyDown, vbKeyUp, vbKeyPageDown, vbKeyPageUp)) = True And Shift = 0 Then
''        Mfgrd1_KeyDown KeyCode, Shift
''        KeyCode = 0
''    End If
''End If

Select Case KeyCode
Case vbKeyPageDown
    If FormAddEditMode <> cFORM_SMRYMODE Then
        Call cmdSaveForm_GotFocus
    End If
End Select

End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
mLastKeyPressed = KeyAscii

End Sub

Private Sub Form_Load()
Dim colcnt As Integer
FormLoaded = False
mEntrySaved = False: mEntryAborted = False
SetFormSize Me, frmMain
Call Form_Resize

Call SetVoidControl(txtVoid)
txtSearch1Text.Enabled = False

OpenVgnDataSource dbVgnDatabase

Set clsMRF1 = New clsVgnMasterEntry
Set clsMRF1.dbVgnDatabase = dbVgnDatabase
clsMRF1.blnMonthRepFmt2ndMast = True
clsMRF1.Init

Set clsListStru = New clsSelectQueryStructure

datRecset.open "Select * from MonthRepFmt2nd" _
    & " order by Mrf2Date,Mrf2Code" _
    , dbVgnDatabase, adOpenKeyset, adLockOptimistic
Call SmryList

Call ShowEntryMode(False)

End Sub

Private Sub Form_Resize()
lblFormHeading.Width = Me.Width
cmdFormEscape.Left = Me.Width - (cmdFormEscape.Width * 2)
cmdFormEnter.Left = Me.Width + cmdFormEscape.Width
frFormSmry.Left = (Me.Width - frFormSmry.Width) / 2: frFormSmry.Top = cmbFormEntryMode.Top + (cmbFormEntryMode.Height * 2)
frFormDtl.Left = (Me.Width - frFormDtl.Width) / 2: frFormDtl.Top = frFormSmry.Top

End Sub

Private Sub Form_Unload(Cancel As Integer)
Set clsMRF1 = Nothing
Set clsListStru = Nothing
Set fso = Nothing
Set clsExcel = Nothing

CloseTable datRecset
CloseDataSource dbVgnDatabase
End Sub

Private Sub ShowEntryMode(ByVal EntryMode As Boolean)
If Me.Visible = True Then
    txtVoid.SetFocus
End If
frFormSmry.Visible = Not EntryMode: frFormSmry.Enabled = Not EntryMode
frFormDtl.Visible = EntryMode: frFormDtl.Enabled = EntryMode
cmdSaveForm.Enabled = EntryMode
If EntryMode = False Then
    FormAddEditMode = cFORM_SMRYMODE
End If

End Sub

Private Function Data_Verify() As Boolean
Data_Verify = False
If Val(mskFormBoundField.Text) < 1 And FormAddEditMode = cFORM_EDITMODE Then
    ErrorBox "Invalid Key Value !!!"
    dtpMrf2Date.SetFocus
    Exit Function
End If
If IsFinYrDate(Ctod(dtpMrf2Date.Text)) = False Then
    ErrorBox "Invalid Date !!!"
    dtpMrf2Date.SetFocus
    Exit Function
End If
If Trim(txtMrf2Name.Text) = "" Then
    ErrorBox "Invalid Input !!!"
    txtMrf2Name.SetFocus
    Exit Function
End If
If Ctod(dtpMrf2Date.Text) <> mMrf2Date_old Or FormAddEditMode = cFORM_ADDMODE Then
    If ChkIsDuplicate(dbVgnDatabase, "MonthRepFmt2nd", "Mrf2Date", Ctod(dtpMrf2Date.Text), "Mrf2Code", Val(mskFormBoundField.Text)) = True Then
        ErrorBox "Duplicate Input !!!"
        dtpMrf2Date.SetFocus
        Exit Function
    End If
End If
If txtMrf2Name.Text <> mMrf2Name_old Or FormAddEditMode = cFORM_ADDMODE Then
    If ChkIsDuplicate(dbVgnDatabase, "MonthRepFmt2nd", "Mrf2Name", txtMrf2Name.Text, "Mrf2Code", Val(mskFormBoundField.Text)) = True Then
        ErrorBox "Duplicate Input !!!"
        txtMrf2Name.SetFocus
        Exit Function
    End If
End If
If Trim(txtMrf2FilePath.Text) = "" Then
    ErrorBox "Invalid Report File Path !!!"
    txtMrf2FilePath.SetFocus
    Exit Function
End If

Data_Verify = True
End Function

Private Sub txtMrf2FilePath_GotFocus()
FlashActiveControl txtMrf2FilePath, True
End Sub

Private Sub txtMrf2FilePath_LostFocus()
FlashActiveControl txtMrf2FilePath, False
End Sub

Private Sub txtMrf2FilePath_Validate(Cancel As Boolean)
txtMrf2FilePath.Text = ToMyWord(txtMrf2FilePath.Text)
If Trim(txtMrf2FilePath.Text) = "" Then
    ErrorBox "Invalid Report File Path !!!"
    txtMrf2FilePath.SetFocus
    Cancel = True
End If

End Sub

Private Sub txtMrf2Name_GotFocus()
FlashActiveControl txtMrf2Name, True
End Sub

Private Sub txtMrf2Name_LostFocus()
FlashActiveControl txtMrf2Name, False
End Sub

Private Sub txtMrf2Name_Validate(Cancel As Boolean)
txtMrf2Name.Text = ToMyWord(txtMrf2Name.Text)
If Trim(txtMrf2Name.Text) = "" Then
    ErrorBox "Invalid Input !!!"
    Cancel = True
    txtMrf2Name.SetFocus
Else
    If txtMrf2Name.Text <> mMrf2Name_old Or FormAddEditMode = cFORM_ADDMODE Then
        If ChkIsDuplicate(dbVgnDatabase, "MonthRepFmt2nd", "Mrf2Name", txtMrf2Name.Text, "Mrf2Code", Val(mskFormBoundField.Text)) = True Then
            ErrorBox "Duplicate Input !!!"
            Cancel = True
            txtMrf2Name.SetFocus
        End If
    End If
End If

End Sub

Private Sub Data_AddEvent()

If CanUserAddOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If clsMRF1.BeginMast(0) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_ADDMODE

clsMRF1.Clear
mMrf2Code = clsMRF1.ActiveCode

mskFormBoundField.Text = mMrf2Code
dtpMrf2Date.Text = Dtoc(DefaultEntryDate)
Call MakeDateFileStr

mMrf2Name_old = txtMrf2Name.Text
mMrf2Date_old = Ctod(dtpMrf2Date.Text)

Call ShowEntryMode(True)
dtpMrf2Date.SetFocus

End Sub

Private Sub Data_EditEvent()
Dim mLCount As Integer, mUCount As Integer, mCount As Integer, mOpnQty As Double, mOpnAvgRate As Double, mOpnValue As Double, mCurQty As Double, mCurAvgRate As Double, mCurValue As Double

If CanUserEditOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If clsMRF1.BeginMast(datRecset.fields("Mrf2Code")) = False Then
    Exit Sub
End If
mEntrySaved = False: mEntryAborted = False
FormAddEditMode = cFORM_EDITMODE
With datRecset
mMrf2Code = .fields("Mrf2Code")

clsMRF1.GetData mMrf2Code

mskFormBoundField.Text = CStr(mMrf2Code)

dtpMrf2Date.Text = Dtoc(.fields("Mrf2Date"))
txtMrf2Name.Text = .fields("Mrf2Name")
txtMrf2FilePath.Text = .fields("Mrf2FilePath")
End With

mMrf2Name_old = txtMrf2Name.Text
mMrf2Date_old = Ctod(dtpMrf2Date.Text)

Call ShowEntryMode(True)
dtpMrf2Date.SetFocus

End Sub

Private Sub Data_SaveEvent()
Dim mContinueUpdate As Boolean

With clsMRF1
If FormAddEditMode = cFORM_ADDMODE Then
    .Clear
Else
    .GetData mMrf2Code
End If

.mName_str = txtMrf2Name.Text
.mMrf2Date_dt = Ctod(dtpMrf2Date.Text)
.mMrf2FilePath_str = txtMrf2FilePath.Text
If FormAddEditMode = cFORM_ADDMODE Then
    If .AddNew() = True Then
        mskFormBoundField.Text = .mCode_lng
        mMrf2Code = .mCode_lng
    End If
Else
    If .Update(mMrf2Code) = True Then
        Rem none
    End If
End If
If .mCode_lng > 0 Then     ''''  updated successfully
    .UpdateMast mMrf2Code
    .EndMast mMrf2Code
    
    mEntrySaved = True
    
    Rem ------------------ copy default format file to respective name
    Set fso = New Scripting.FileSystemObject
    If fso.FileExists(Trim(txtMrf2FilePath.Text)) = False Then
        If fso.FileExists(AddBS(sCmpDataPath) & "MonthRepFmt2nd.Xls") = True Then
            fso.CopyFile AddBS(sCmpDataPath) & "MonthRepFmt2nd.Xls", Trim(txtMrf2FilePath.Text), False
            If fso.FileExists(Trim(txtMrf2FilePath.Text)) = False Then
                ErrorBox "Unable to Create Report File " & Trim(txtMrf2FilePath.Text)
            End If
        Else
            ErrorBox "Default Report Format File " & AddBS(sCmpDataPath) & "MonthRepFmt2nd.Xls" & " does not Exist !!!"
        End If
    End If
    Set fso = Nothing
Else
    Call Data_CancelEvent
    ErrorBox "Entry Cancelled !!!"
End If
End With

End Sub

Private Sub Data_DeleteEvent()
Dim mDeleteit As Boolean, mRecAbsPos As Long

If CanUserDeleteOpt(mUsrCode:=MyCompany.mUserCode, mMenuOptName:=Me.SecuMenuName) = False Then
    AlertBox "Not Permitted !!!"
    Exit Sub
End If
If (datRecset.EOF Or datRecset.BOF) = True Then
    Exit Sub
End If

mMrf2Code = datRecset.fields("Mrf2Code")
mRecAbsPos = datRecset.AbsolutePosition

If clsMRF1.CanDeleteMast(mMrf2Code) = True Then
    If clsMRF1.BeginMast(mMrf2Code) = True Then
        clsMRF1.DeleteMast mMrf2Code
        clsMRF1.UpdateMast mMrf2Code
        clsMRF1.EndMast mMrf2Code
        
        Call SmryList
        If datRecset.RecordCount > mRecAbsPos And mRecAbsPos > 0 Then
            datRecset.Move mRecAbsPos - 1, 1
        Else
            MoveRecToLast datRecset
        End If
    End If
    ShowRecActiveFlexRow datRecset, Mfgrd1
    Mfgrd1.SetFocus
Else
    Mfgrd1.SetFocus
End If

End Sub

Private Sub Data_CancelEvent()
clsMRF1.CancelMast mMrf2Code
clsMRF1.EndMast mMrf2Code

mEntryAborted = True

End Sub

Private Sub SmryList()
Dim aStock As Variant, mQty As Double, mAvgRate As Double, mValue As Double
Dim gcolcount As Integer, acount As Integer, mLow As Integer, mHigh As Integer, mPos As Integer, srow As Long, mColCount As Integer

clsListStru.Clear

Rem column definitions
clsListStru.AddFields mExpr:="Mrf2Code", mAttrib:=cFAT_SYSTEM
clsListStru.AddFields mExpr:="Mrf2Name", mTitle:="Report Name", mAlign:=flexAlignLeftCenter, mWidth:=4000, mShowItem:=True
clsListStru.AddFields mExpr:="Mrf2FilePath", mTitle:="File Path", mAlign:=flexAlignLeftCenter, mWidth:=4000, mShowItem:=True

RefreshDatabase dbVgnDatabase
datRecset.Requery

Mfgrd1.Height = Int(Mfgrd1.Height / Mfgrd1.RowHeightMin) * Mfgrd1.RowHeightMin
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
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("Mrf2Code")) = .fields("Mrf2Code")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("Mrf2Name")) = .fields("Mrf2Name")
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("Mrf2FilePath")) = JustFName(.fields("Mrf2FilePath"))
        
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

SetFlexColCursor txtList1Col, Mfgrd1

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

Private Sub Mfgrd1_DblClick()
Call cmdFormEnter_Click

End Sub

Private Sub Mfgrd1_GotFocus()
Mfgrd1.Col = FlexLeftVisibleCol(Mfgrd1)
Mfgrd1.LeftCol = FlexLeftVisibleCol(Mfgrd1)
If Mfgrd1.SelectionMode = flexSelectionByRow Then
    Mfgrd1.ColSel = 0: Mfgrd1.ColSel = Mfgrd1.Cols - 1
End If
Call Mfgrd1_RowColChange
txtSearch1Text.Text = ""

End Sub

Private Sub Mfgrd1_KeyDown(KeyCode As Integer, Shift As Integer)
If MyAddNewKey(Shift, KeyCode) = True Then
    Call Data_AddEvent
ElseIf MyDeleteKey(Shift, KeyCode) = True Then
    If Mfgrd1.Row < Mfgrd1.Rows - 1 Then
        Call Data_DeleteEvent
    End If
ElseIf Shift = vbCtrlMask And KeyCode = vbKeySpace Then
    Call cmdFormEnter_Click
End If

End Sub

Private Sub Mfgrd1_KeyPress(KeyAscii As Integer)
mLastKeyPressed = KeyAscii
If mMaskKeyPressed = 0 Or mMaskKeyPressed = vbShiftMask Then
    Select Case KeyAscii
    Case vbKeyBack
        If txtSearch1Text.Text <> "" Then
            txtSearch1Text.Text = Left(txtSearch1Text.Text, Len(txtSearch1Text.Text) - 1)
            Call txtSearch1Text_InterActiveChange
        End If
    Case Else
        txtSearch1Text.Text = txtSearch1Text.Text & Chr(KeyAscii)
        Call txtSearch1Text_InterActiveChange
    End Select
End If

End Sub

Private Sub Mfgrd1_RowColChange()
With datRecset
If .RecordCount > 0 Then
    If .AbsolutePosition <> Mfgrd1.Row - Mfgrd1.FixedRows + 1 Then
        .MoveFirst
        .Move Mfgrd1.Row - Mfgrd1.FixedRows, 1     ' Mfgrd1.Row is already less by one
    End If
End If
End With
ShowFlexColCursor txtList1Col, Mfgrd1, datRecset

End Sub

Private Sub Mfgrd1_Scroll()
ShowFlexColCursor txtList1Col, Mfgrd1, datRecset

End Sub

Private Sub txtList1Col_DblClick(Index As Integer)
Call Mfgrd1_DblClick
End Sub

Private Sub txtList1Col_GotFocus(Index As Integer)
Mfgrd1.SetFocus
End Sub

Private Sub txtSearch1Text_InterActiveChange(Optional ByVal mText)
mText = IIf(IsMissing(mText) = True, txtSearch1Text.Text, mText)
Rem SearchFlex Mfgrd1, clsListStru.GetItemIndex("Mrf2Name"), mText
SearchRawFlex Mfgrd1, clsListStru.GetItemIndex("Mrf2Name"), mText
ShowActiveFlexRow Mfgrd1

End Sub

Private Sub txtSearch1Text_GotFocus()
FlashActiveControl txtSearch1Text, True

End Sub

Private Sub txtSearch1Text_LostFocus()
FlashActiveControl txtSearch1Text, False
End Sub

