VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmFlexSearchList 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   BorderStyle     =   1  'Fixed Single
   ClientHeight    =   6630
   ClientLeft      =   15
   ClientTop       =   15
   ClientWidth     =   9570
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
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6630
   ScaleWidth      =   9570
   StartUpPosition =   1  'CenterOwner
   Begin VB.TextBox txtListCol 
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
      TabIndex        =   6
      TabStop         =   0   'False
      Top             =   2040
      Width           =   1335
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
      Left            =   9120
      MaskColor       =   &H000000FF&
      TabIndex        =   4
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
      Left            =   8640
      MaskColor       =   &H000000FF&
      Style           =   1  'Graphical
      TabIndex        =   3
      TabStop         =   0   'False
      Top             =   0
      Width           =   255
   End
   Begin VB.TextBox txtSearchText 
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
      Left            =   1680
      TabIndex        =   0
      Top             =   600
      Width           =   4215
   End
   Begin MSFlexGridLib.MSFlexGrid Mfgrd1 
      Height          =   4935
      Left            =   240
      TabIndex        =   1
      Top             =   1080
      Width           =   9015
      _ExtentX        =   15901
      _ExtentY        =   8705
      _Version        =   393216
      RowHeightMin    =   285
      AllowBigSelection=   0   'False
      FocusRect       =   0
      HighLight       =   0
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
   Begin VB.Label lblFormHeading 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Form Heading"
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
      TabIndex        =   5
      Top             =   0
      Width           =   9015
   End
   Begin VB.Label lblSearchCaption 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Label1"
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
      Height          =   285
      Left            =   240
      TabIndex        =   2
      Top             =   600
      Width           =   1455
   End
End
Attribute VB_Name = "frmFlexSearchList"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Rem Public dbAcDatabase As ADODB.Connection, dbStDatabase As ADODB.Connection, dbTlgDatabase As ADODB.Connection, dbPyrDatabase As ADODB.Connection, dbVgnDatabase As ADODB.Connection, dbComDatabase As ADODB.Connection, dbCmpDatabase As ADODB.Connection
Public frmAccessMaster As Form
Public BRecset As ADODB.Recordset, LRecset As ADODB.Recordset
Dim aryFColList As aryFlexColList
Dim m_BoundText As String, m_Text As String, m_CallFromText_Change As Boolean, m_CallFromBoundText_Change As Boolean
Dim m_TableName As String, m_BoundField As String, m_ListField As String, m_ListFieldUnq As String
Dim mFormLoaded As Boolean, mLastKeyPressed As Integer
Rem Dim mRowColChanged As Boolean

Private Type aryFlexColList
Field_Name() As Variant
Field_Title() As Variant
Field_Width() As Variant
Field_Align() As Variant
End Type

Public Property Get BoundText() As String
BoundText = m_BoundText
End Property

Public Property Let BoundText(ByVal mText As String)
SearchBoundText mText
End Property

Public Property Get Text() As String
Text = m_Text
End Property

Public Property Let Text(ByVal mText As String)
SearchText mText
End Property

Public Property Get TableName() As String
TableName = m_TableName
End Property

Public Property Let TableName(ByVal mTableName As String)
m_TableName = mTableName
End Property

Public Property Get BoundField() As String
BoundField = m_BoundField
End Property

Public Property Let BoundField(ByVal mBoundField As String)
m_BoundField = mBoundField
End Property

Public Property Get ListField() As String
ListField = m_ListField
End Property

Public Property Let ListField(ByVal mListField As String)
m_ListField = mListField
m_ListFieldUnq = mListField
End Property

Public Property Get ListFieldUnq() As String
ListFieldUnq = m_ListFieldUnq
End Property

Public Property Let ListFieldUnq(ByVal mListFieldUnq As String)
m_ListFieldUnq = mListFieldUnq
End Property

Rem mUserPara(0) = User Text
Rem mUserPara(1) = Cursor position
Public Property Let UserText(ByRef mUserPara As Variant)
If UCase(Left(m_Text, 1)) = UCase(mUserPara(0)) Then
    If txtSearchText.Text <> m_Text Then
        txtSearchText.Text = m_Text
    Else
        Call txtSearchText_Change
    End If
Else
    If txtSearchText.Text <> mUserPara(0) Then
        Rem txtSearchText.Text = mUserPara(0)
        If Len(mUserPara(0)) = 1 And mUserPara(0) = Chr(32) Then
            txtSearchText.Text = ""
            mUserPara(1) = 0
        Else
            txtSearchText.Text = mUserPara(0)
        End If
    Else
        Call txtSearchText_Change
    End If
End If
txtSearchText.SelStart = mUserPara(1)
txtSearchText.SelLength = Len(txtSearchText.Text) - mUserPara(1)

End Property

Public Property Get CallFromText_Change() As Boolean
CallFromText_Change = m_CallFromText_Change
End Property

Public Property Let CallFromText_Change(ByVal mTrueFalse As Boolean)
m_CallFromText_Change = mTrueFalse
End Property

Public Property Get CallFromBoundText_Change() As Boolean
CallFromBoundText_Change = m_CallFromBoundText_Change
End Property

Public Property Let CallFromBoundText_Change(ByVal mTrueFalse As Boolean)
m_CallFromBoundText_Change = mTrueFalse
End Property

Public Property Get ListSelected() As Boolean
ListSelected = (mLastKeyPressed = 13)

End Property

Public Property Let FormWidth(ByVal mFormWidth As Long)
Me.Width = mFormWidth
Mfgrd1.Width = Me.Width - Mfgrd1.Left - 200
End Property

Private Sub cmdFormEnter_Click()
mLastKeyPressed = 13
Me.Hide

End Sub

Private Sub cmdFormEscape_Click()
mLastKeyPressed = 27
If Screen.ActiveControl.Name = Mfgrd1.Name Then
    txtSearchText.SetFocus
ElseIf txtSearchText.Text <> "" Then
    txtSearchText.Text = ""
    txtSearchText.SetFocus
ElseIf m_Text <> "" Or m_BoundText <> "" Then
    If m_Text <> "" Then
        m_Text = ""
    ElseIf m_BoundText <> "" Then
        m_BoundText = ""
    End If
    Me.Hide
Else
    Me.Hide
End If

End Sub

Private Sub Form_Activate()
If mFormLoaded = False Then
    Rem Call FillList
    
    mFormLoaded = True
Else
    
End If
txtSearchText.SetFocus
Call ShowActiveFlexRow

End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
mLastKeyPressed = KeyCode
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
mLastKeyPressed = KeyAscii
End Sub

Public Sub Init()
Call InitStru
Call FillList

End Sub

Public Sub ReInit(Optional ByVal mWithStru As Boolean = False)
If mWithStru = True Then
    Call InitStru
End If
Call Requery

End Sub

Private Sub InitStru()
Dim mFlexColPos As Integer, mVisibleCols As Integer, mObjColPos As Integer

Mfgrd1.Rows = 2: Mfgrd1.FixedRows = 1: Mfgrd1.FixedCols = 1: SetGridAutoHeight Mfgrd1

Mfgrd1.Cols = ALen(aryFColList.Field_Name)
For mFlexColPos = 0 To Mfgrd1.Cols - 1
    Mfgrd1.TextMatrix(0, mFlexColPos) = aryFColList.Field_Title(mFlexColPos)
    Mfgrd1.ColWidth(mFlexColPos) = aryFColList.Field_Width(mFlexColPos)
    Mfgrd1.ColAlignment(mFlexColPos) = aryFColList.Field_Align(mFlexColPos)
Next mFlexColPos
SetFlexColCursor txtListCol, Mfgrd1

End Sub

Private Sub FillList()
Dim tRecset As New ADODB.Recordset
Dim srow As Long, mColCount As Integer

srow = 1

Set tRecset = LRecset.ActiveConnection.Execute(LRecset.Source)

'''MoveRecToFirst tRecset
With tRecset
Rem If .RecordCount > 0 Then
If .EOF = False Or .BOF = False Then
    Rem Mfgrd1.Rows = .RecordCount + 2
    .MoveFirst
    Mfgrd1.Rows = RSRecordCount(tRecset) + 2
Else
    Mfgrd1.Rows = 2
End If
Do While .EOF = False
    For mColCount = 0 To Mfgrd1.Cols - 1
        Select Case .fields(aryFColList.Field_Name(mColCount)).Type
        Case adDate
            Mfgrd1.TextMatrix(srow, mColCount) = Dtoc(.fields(aryFColList.Field_Name(mColCount)))
        Case Else
            Mfgrd1.TextMatrix(srow, mColCount) = CStr(.fields(aryFColList.Field_Name(mColCount)))
        End Select
    Next mColCount
    
    Rem Mfgrd1.Rows = Mfgrd1.Rows + 1
    srow = srow + 1
    
    .MoveNext
Loop
End With
CloseTable tRecset
For mColCount = 0 To Mfgrd1.Cols - 1
    Mfgrd1.TextMatrix(srow, mColCount) = ""
Next mColCount
Mfgrd1.Rows = srow + 1

SearchBoundText m_BoundText  ' record position is reset after refill or requery

'''MoveRecToFirst LRecset
'''With LRecset
'''If .RecordCount > 0 Then
'''    .MoveFirst
'''End If
'''Do While .EOF = False
'''    For mColCount = 0 To Mfgrd1.Cols - 1
'''        Select Case .fields(aryFColList.Field_Name(mColCount)).Type
'''        Case adDate
'''            Mfgrd1.TextMatrix(srow, mColCount) = Dtoc(.fields(aryFColList.Field_Name(mColCount)))
'''        Case Else
'''            Mfgrd1.TextMatrix(srow, mColCount) = CStr(.fields(aryFColList.Field_Name(mColCount)))
'''        End Select
'''    Next mColCount
'''
'''    Mfgrd1.Rows = Mfgrd1.Rows + 1
'''    srow = srow + 1
'''
'''    .MoveNext
'''Loop
'''End With
'''For mColCount = 0 To Mfgrd1.Cols - 1
'''    Mfgrd1.TextMatrix(srow, mColCount) = ""
'''Next mColCount
'''Mfgrd1.Rows = srow + 1
'''
'''SearchBoundText m_BoundText  ' record position is reset after refill or requery

End Sub

Public Sub Requery()
RefreshDatabase BRecset.ActiveConnection
RefreshDatabase LRecset.ActiveConnection
BRecset.Requery: LRecset.Requery

Call FillList

End Sub

Private Sub Form_Load()
mFormLoaded = False
Call Form_Resize

End Sub

Private Sub Form_Resize()
lblFormHeading.Width = Me.Width
cmdFormEscape.Left = Me.Width - (cmdFormEscape.Width * 2)
cmdFormEnter.Left = Me.Width + cmdFormEscape.Width

End Sub

Private Sub Form_Unload(Cancel As Integer)
Set frmAccessMaster = Nothing
CloseTable BRecset
CloseTable LRecset

End Sub

Public Sub SearchBoundText(ByVal mText As String)
Dim mSearchText As Boolean, mLText As String, mBText As String

mSearchText = True
Rem mText = ToMyString(mText) surely not expected but keep it
If BRecset.EOF = False And LRecset.EOF = False Then
    If BRecset.fields(m_BoundField) = LRecset.fields(m_BoundField) And BRecset.fields(m_ListField) = LRecset.fields(m_ListField) And BRecset.fields(m_BoundField) = Val(mText) Then
        mSearchText = False
    End If
End If
If mSearchText = True Then
    If BRecset.Index <> "" Then
        BRecset.Seek Array(Val(mText))
    Else
        Rem BRecset.Find m_BoundField & "=" & CStr(Val(mText)), Start:=1
        Select Case BRecset.fields(m_BoundField).Type
        Case adVarWChar
            mBText = ToMyString(mText)
            BRecset.Find m_BoundField & " = '" & mBText & "'", Start:=1
        Case adInteger, adDouble, adSmallInt, adSingle
            mBText = CStr(Val(mText))
            BRecset.Find m_BoundField & " = " & mBText & "", Start:=1
        Case Else
            ErrorBox "Undefined Search Type !!!"
        End Select
    End If
    If BRecset.EOF = False Then
        If m_ListField = m_ListFieldUnq Then
            mLText = ToMyString(BRecset.fields(m_ListField))
        Else
            mLText = ToMyString(BRecset.fields(m_ListField) & "_" & Format(BRecset.fields(m_BoundField), cLONGCODESTRFMT))
        End If
        
        Select Case LRecset.fields(m_ListFieldUnq).Type
        Case adVarWChar
            LRecset.Find m_ListFieldUnq & " like '" & mLText & "'", Start:=1
        Case adInteger, adDouble, adSmallInt, adSingle
            LRecset.Find m_ListFieldUnq & " like " & CStr(Val(Trim(mLText))) & "", Start:=1
        Case Else
            ErrorBox "Undefined Search Type !!!"
        End Select
    Else
        MoveRecToEOF LRecset
    End If
End If
Call ChkMatchValues
'''If BRecset.EOF = False And LRecset.EOF = False Then
'''    If BRecset.Fields(m_BoundField) = LRecset.Fields(m_BoundField) And BRecset.Fields(m_ListField) = LRecset.Fields(m_ListField) Then
'''        mMatchFound = True
'''    End If
'''End If
'''If mMatchFound = True Then
'''    m_BoundText = CStr(BRecset.Fields(m_BoundField))
'''    m_Text = LRecset.Fields(m_ListField)
'''Else
'''    m_BoundText = ""
'''    m_Text = ""
'''    MoveRecToEOF BRecset
'''    MoveRecToEOF LRecset
'''End If

End Sub

Public Sub SearchText(ByVal mText As String)
Dim mSearchText As Boolean, mBText As String
mSearchText = True

If LRecset.EOF = False And BRecset.EOF = False Then
    If LRecset.fields(m_ListField) = BRecset.fields(m_ListField) And LRecset.fields(m_BoundField) = BRecset.fields(m_BoundField) And LRecset.fields(m_ListField) = mText Then
        mSearchText = False
    End If
End If
If mSearchText = True Then
    mText = ToMyString(mText)
    If Trim(mText) = "" And Len(mText) > 0 Then
        Select Case LRecset.fields(m_ListField).Type
        Case adVarWChar
            LRecset.Find m_ListField & " like '" & mText & IIf(mText <> "", "*", "") & "'", Start:=1
        Case adInteger, adDouble, adSmallInt, adSingle
            LRecset.Find m_ListField & " like " & CStr(Val(Trim(mText))) & "", Start:=1
        Case Else
            ErrorBox "Undefined Search Type !!!"
        End Select
    Else
        Select Case LRecset.fields(m_ListField).Type
        Case adVarWChar
            LRecset.Find m_ListField & " like '" & RTrim(mText) & IIf(mText <> "", "*", "") & "'", Start:=1
        Case adInteger, adDouble, adSmallInt, adSingle
            LRecset.Find m_ListField & " like " & CStr(Val(RTrim(mText))) & "", Start:=1
        Case Else
            ErrorBox "Undefined Search Type !!!"
        End Select
    End If
    If LRecset.EOF = False Then
        If BRecset.Index <> "" Then
            BRecset.Seek Array(LRecset.fields(m_BoundField))
        Else
            Rem BRecset.Find m_BoundField & " = " & CStr(LRecset.fields(m_BoundField)), Start:=1
            Select Case BRecset.fields(m_BoundField).Type
            Case adVarWChar
                mBText = ToMyString(CStr(LRecset.fields(m_BoundField)))
                BRecset.Find m_BoundField & " = '" & mBText & "'", Start:=1
            Case adInteger, adDouble, adSmallInt, adSingle
                mBText = CStr(Val(LRecset.fields(m_BoundField)))
                BRecset.Find m_BoundField & " = " & mBText & "", Start:=1
            Case Else
                ErrorBox "Undefined Search Type !!!"
            End Select
        End If
    Else
        MoveRecToEOF BRecset
    End If
End If
Call ChkMatchValues

End Sub

Private Sub ChkMatchValues()
Dim mMatchFound As Boolean

mMatchFound = False
If LRecset.EOF = False And BRecset.EOF = False Then
    If LRecset.fields(m_ListField) = BRecset.fields(m_ListField) And LRecset.fields(m_BoundField) = BRecset.fields(m_BoundField) Then
        mMatchFound = True
    End If
End If
If mMatchFound = True Then
    m_Text = LRecset.fields(m_ListField)
    m_BoundText = CStr(BRecset.fields(m_BoundField))
Else
    m_Text = ""
    m_BoundText = ""
    MoveRecToEOF LRecset
    MoveRecToEOF BRecset
End If

End Sub

Private Sub Mfgrd1_Click()
Call cmdFormEnter_Click
End Sub

Private Sub Mfgrd1_DblClick()
Call cmdFormEnter_Click
End Sub

Private Sub Mfgrd1_GotFocus()
Mfgrd1.Col = FlexLeftVisibleCol(Mfgrd1)
If Mfgrd1.SelectionMode = flexSelectionByRow Then
    Rem Mfgrd1.ColSel = 0: Mfgrd1.ColSel = Mfgrd1.Cols - 1
End If
Call Mfgrd1_RowColChange

End Sub

Private Sub Mfgrd1_RowColChange()

With LRecset
If .RecordCount > 0 Then
    If .AbsolutePosition <> Mfgrd1.Row - Mfgrd1.FixedRows + 1 Then
        .MoveFirst
        .Move Mfgrd1.Row - Mfgrd1.FixedRows, 1     ' Mfgrd1.Row is already less by one
    End If
End If
If InterActiveChange(Mfgrd1) = True Then
    If .EOF = False And .BOF = False Then
        txtSearchText.Text = .fields(m_ListField)
    Else
        txtSearchText.Text = ""
    End If
End If
End With
Rem Call ShowCursor
Rem mRowColChanged = True

End Sub

Private Sub ShowActiveFlexRow()
Dim mReqdRow As Long

'''With LRecset
'''mReqdRow = .AbsolutePosition + Mfgrd1.FixedRows - 1
'''If .RecordCount > 0 And .EOF = False And .BOF = False Then
'''    If Mfgrd1.RowIsVisible(mReqdRow) = False Then
'''        If mReqdRow > Mfgrd1.TopRow Then
'''            Mfgrd1.TopRow = mReqdRow - Int(Mfgrd1.Height / Mfgrd1.RowHeightMin) + Mfgrd1.FixedRows + 1
'''        Else
'''            Mfgrd1.TopRow = mReqdRow
'''        End If
'''    End If
'''    Mfgrd1.Row = mReqdRow
'''Else
'''    Mfgrd1.Row = Mfgrd1.Rows - 1   '  Mfgrd1.FixedRows
'''End If
'''End With

Rem mRowColChanged = False
With LRecset
mReqdRow = .AbsolutePosition + Mfgrd1.FixedRows - 1
If .RecordCount > 0 And .EOF = False And .BOF = False Then
    Mfgrd1.Row = mReqdRow
Else
    Mfgrd1.Row = Mfgrd1.Rows - 1   '  Mfgrd1.FixedRows
End If
If Mfgrd1.RowIsVisible(Mfgrd1.Row) = False Then
    If Mfgrd1.Row > Mfgrd1.TopRow Then
        Mfgrd1.TopRow = Mfgrd1.Row - Int(Mfgrd1.Height / Mfgrd1.RowHeightMin) + Mfgrd1.FixedRows + 1
    Else
        Mfgrd1.TopRow = Mfgrd1.Row
    End If
End If
End With
Rem If mRowColChanged = False Then
    ShowFlexColCursor txtListCol, Mfgrd1, LRecset
Rem End If

'If Screen.ActiveControl.Name <> Mfgrd1.Name Then
'    Mfgrd1_RowColChange
'End If

End Sub

'''Private Sub ShowCursor()
'''Dim mVisibleCols As Integer, mFlexColPos As Integer, mObjColPos As Integer, srow As Long
'''
'''srow = Mfgrd1.Row
'''mVisibleCols = 1
'''mObjColPos = 0
'''For mFlexColPos = 0 To Mfgrd1.Cols - 1
'''    If Mfgrd1.ColWidth(mFlexColPos) > 0 Then
'''        txtListCol(mObjColPos).Text = Mfgrd1.TextMatrix(srow, mFlexColPos)
'''        txtListCol(mObjColPos).Top = Mfgrd1.Top + Mfgrd1.RowPos(srow)
'''        If LRecset.EOF = True Then
'''            txtListCol(mObjColPos).BackColor = vbRed
'''        Else
'''            txtListCol(mObjColPos).BackColor = Mfgrd1.BackColorSel
'''        End If
'''        txtListCol(mObjColPos).Visible = Mfgrd1.RowIsVisible(srow)
'''
'''        mVisibleCols = mVisibleCols + 1
'''        mObjColPos = mObjColPos + 1
'''    End If
'''Next mFlexColPos
'''
'''End Sub

Private Sub Mfgrd1_Scroll()
ShowFlexColCursor txtListCol, Mfgrd1, LRecset
End Sub

Private Sub txtListCol_Click(Index As Integer)
Call cmdFormEnter_Click
End Sub

Private Sub txtSearchText_Change()
SearchText txtSearchText.Text
If Me.Visible = True Then
    Call ShowActiveFlexRow
End If
End Sub

Private Sub txtSearchText_GotFocus()
FlashActiveControl txtSearchText, True, mSkipSelection:=True
End Sub

Private Sub txtSearchText_KeyDown(KeyCode As Integer, Shift As Integer)
Dim mBText As String

If MyAddNewKey(Shift, KeyCode) = True Then
    Call Data_AddEvent
ElseIf MyDeleteKey(Shift, KeyCode) = True Then
    If Mfgrd1.Row < Mfgrd1.Rows - 1 Then
        Call Data_DeleteEvent
    End If
ElseIf KeyCode = vbKeyReturn Then
    
ElseIf MyScrollKey(Shift, KeyCode) = True Then
    With LRecset
    If .RecordCount > 0 Then
        If KeyCode = vbKeyDown Then
            If .EOF = False Then
                .MoveNext
            End If
            If .EOF = True Then
                .MoveLast
            End If
        ElseIf KeyCode = vbKeyUp Then
            If .BOF = False Then
                .MovePrevious
            End If
            If .BOF = True Then
                .MoveFirst
            End If
        End If
    End If
    If .EOF = False And .BOF = False Then
        If BRecset.Index <> "" Then
            BRecset.Seek Array(LRecset.fields(m_BoundField))
        Else
            Rem BRecset.Find m_BoundField & "=" & CStr(LRecset.fields(m_BoundField)), Start:=1
            Select Case BRecset.fields(m_BoundField).Type
            Case adVarWChar
                mBText = ToMyString(CStr(LRecset.fields(m_BoundField)))
                BRecset.Find m_BoundField & " = '" & mBText & "'", Start:=1
            Case adInteger, adDouble, adSmallInt, adSingle
                mBText = CStr(Val(LRecset.fields(m_BoundField)))
                BRecset.Find m_BoundField & " = " & mBText & "", Start:=1
            Case Else
                ErrorBox "Undefined Search Type !!!"
            End Select
        End If
    Else
        MoveRecToEOF BRecset
    End If
    Call ChkMatchValues
    If Me.Visible = True Then
        Call ShowActiveFlexRow
    End If
    
    txtSearchText.SelStart = Len(txtSearchText.Text)
    KeyCode = 0
    
    End With
ElseIf MyListRefreshKey(Shift, KeyCode) = True Then
    Call Requery
End If

End Sub

Private Sub txtSearchText_LostFocus()
FlashActiveControl txtSearchText, False

End Sub

Private Sub Data_AddEvent()
If Not frmAccessMaster Is Nothing Then
    frmAccessMaster.RemoteAccessCode = 0
    frmAccessMaster.Show 1
    If frmAccessMaster.EntrySaved = True Then
        Call Requery
        SearchBoundText CStr(frmAccessMaster.EntryBoundCode)
        UserText = Array(m_Text, Len(m_Text))
    End If
    Unload frmAccessMaster
End If


End Sub

Private Sub Data_EditEvent()
Rem none
End Sub

Private Sub Data_DeleteEvent()
Rem none
End Sub

Public Sub ClearFlexColList()
aryFColList.Field_Name = Array()
aryFColList.Field_Title = Array()
aryFColList.Field_Width = Array()
aryFColList.Field_Align = Array()

End Sub

Public Sub AddFlexColList(ByVal mFldName As String, ByVal mFldTitle As String, ByVal mFldWidth As Integer, ByVal mFldAlign As Integer)
AddToArray aryFColList.Field_Name, mFldName
AddToArray aryFColList.Field_Title, mFldTitle
AddToArray aryFColList.Field_Width, mFldWidth
AddToArray aryFColList.Field_Align, mFldAlign

End Sub

Public Function BFieldValue(ByVal mFieldName As String) As Variant
BFieldValue = BRecset.fields(mFieldName)
End Function

Public Function LFieldValue(ByVal mFieldName As String) As Variant
LFieldValue = LRecset.fields(mFieldName)
End Function

Rem *********************************** end of form ******************************************
