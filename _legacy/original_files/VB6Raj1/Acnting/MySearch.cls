VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CustomSearch"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'Option Explicit
'
'Dim frmSearch As frmSelectionList1
'Dim BoundRS As ADODB.Recordset, ListRS As ADODB.Recordset
'Dim mBoundText As String, mListText As String, mListMouseClick As Boolean
'Dim mCallFromBoundText As Boolean, mCallFromListText As Boolean, mLoadStatus As Integer
'Public dbDatabase As ADODB.Connection, mBoundSource As String, mListSource As String, mBoundField As String, mListField As String, mBoundControl As TextBox, mRequired As Boolean
'Const MFORM_NOT_LOADED = -1
'Const MFORM_LOAD_IN_PROCESS = 0
'Const MFORM_LOADED = 1
'
'Public Property Get mTop() As Variant
'mTop = mBoundControl.Top
'End Property
'
'Public Property Let mTop(ByVal New_Value As Variant)
'mBoundControl.Top = New_Value
'If Not TypeOf mBoundControl.Container Is Form Then
'    frmSearch.Top = mBoundControl.Parent.ScaleTop + mBoundControl.Container.Top + New_Value
'Else
'    frmSearch.Top = mBoundControl.Parent.ScaleTop + New_Value
'End If
'End Property
'
'Public Property Get mLeft() As Variant
'mLeft = mBoundControl.Left
'End Property
'
'Public Property Let mLeft(ByVal New_Value As Variant)
'mBoundControl.Left = New_Value
'If Not TypeOf mBoundControl.Container Is Form Then
'    frmSearch.Left = mBoundControl.Parent.ScaleLeft + mBoundControl.Container.Left + New_Value
'Else
'    frmSearch.Left = mBoundControl.Parent.ScaleLeft + New_Value
'End If
'
'End Property
'
'Public Property Get mWidth() As Variant
'mWidth = mBoundControl.Width
'End Property
'
'Public Property Let mWidth(ByVal New_Value As Variant)
'mBoundControl.Width = New_Value
'frmSearch.Width = New_Value
'End Property
'
'Public Property Get mHeight() As Variant
'mHeight = mBoundControl.Height
'End Property
'
'Public Property Let mHeight(ByVal New_Value As Variant)
'mBoundControl.Height = New_Value
'End Property
'
'Public Property Get mVisible() As Boolean
'mVisible = mBoundControl.Visible
'End Property
'
'Public Property Let mVisible(ByVal New_Value As Boolean)
'mBoundControl.Visible = New_Value
'End Property
'
'Public Property Get ListVisible() As Boolean
'ListVisible = (frmSearch.Visible = True And Screen.ActiveForm.Name = frmSearch.Name)
'End Property
'
'Public Property Let ListVisible(ByVal New_Value As Boolean)
'If New_Value = True Then
'    mLoadStatus = MFORM_LOAD_IN_PROCESS
'    frmSearch.Show 1
'Else
'    frmSearch.Hide
'End If
'End Property
'
'Public Sub ShowList(ByVal mNewListText As Variant)
'mLoadStatus = MFORM_LOAD_IN_PROCESS
'frmSearch.Text1.Text = mNewListText
'ListText = mNewListText
'frmSearch.Show 1
'End Sub
'
'Public Property Get BoundText() As Variant
'BoundText = mBoundText
'End Property
'
'Public Property Let BoundText(ByVal New_Value As Variant)
'Dim mSelectedIndex As Integer
'If mCallFromListText = False And mCallFromBoundText = False Then
'    mCallFromBoundText = True
'    mBoundText = CStr(New_Value)
'    Call SearchBoundText
'
'    With BoundRS
'    If .EOF = True Or .BOF = True Then
'        mBoundText = ""
'        mListText = ""
'    Else
'        mBoundText = CStr(.Fields(mBoundField))
'        mListText = CStr(.Fields(mListField))
'    End If
'    Call SearchListText
'    End With
'
'    Call RebindList
'    If InterActiveMode(mBoundControl.Parent) = True And mLoadStatus = MFORM_NOT_LOADED Then
'        mSelectedIndex = ListSelectedIndex()
'        Call ListSelected(mSelectedIndex)
'    End If
'
'    mCallFromBoundText = False
'End If
'
'End Property
'
'Public Property Get ListText() As Variant
'ListText = mListText
'End Property
'
'Public Property Let ListText(ByVal New_Value As Variant)
'Dim mSelectedIndex As Integer
'If mCallFromBoundText = False And mCallFromListText = False Then
'    mCallFromListText = True
'    mListText = CStr(New_Value)
'    Call SearchListText
'
'    With ListRS
'    If .EOF = True Or .BOF = True Then
'        mBoundText = ""
'        mListText = ""
'    Else
'        mBoundText = CStr(.Fields(mBoundField))
'        mListText = CStr(.Fields(mListField))
'    End If
'    Rem Call SearchBoundText
'    End With
'
'    Call RebindList
'    If InterActiveMode(mBoundControl.Parent) = True And mLoadStatus = MFORM_NOT_LOADED Then
'        mSelectedIndex = ListSelectedIndex()
'        Call ListSelected(mSelectedIndex)
'    End If
'
'    mCallFromListText = False
'End If
'
'End Property
'
'Private Sub cmdFormEnter_Click()
'Dim mSelectedIndex As Integer
'
'mSelectedIndex = ListSelectedIndex()
'If mSelectedIndex > -1 Then
'    Call ListSelected(mSelectedIndex)
'    frmSearch.Hide
'End If
'
'End Sub
'
'Private Sub cmdFormEscape_Click()
'If Screen.ActiveControl.Name <> frmSearch.Text1.Name Then
'    frmSearch.Text1.SetFocus
'ElseIf Screen.ActiveControl.Name = frmSearch.Text1.Name And Text1.Text <> "" Then
'    Text1.Text = ""
'Else
'    frmSearch.Hide
'End If
'End Sub
'
'Private Sub Form_Activate()
'mLoadStatus = MFORM_LOADED
'Text1.SetFocus
'Text1.SelStart = mBoundControl.SelStart
'Text1.SelLength = mBoundControl.SelLength
'End Sub
'
'Private Sub Form_Deactivate()
'mLoadStatus = MFORM_NOT_LOADED
'End Sub
'
'Private Sub Form_GotFocus()
'Text1.SetFocus
'End Sub
'
'Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
'If Shift = 0 Then
'    If KeyCode = vbKeyDown Then
'        If ListRS.RecordCount > 0 Then
'            If ListRS.EOF = False And ListRS.BOF = False Then
'                ListRS.MoveNext
'                If ListRS.EOF = True Then
'                    ListRS.MoveLast
'                End If
'            Else
'                'ListRS.MoveLast
'                ListRS.MoveFirst
'            End If
'            If ListRS.EOF = False And ListRS.BOF = False Then
'                mBoundText = ListRS.Fields(mBoundField)
'                mListText = ListRS.Fields(mListField)
'            End If
'            Call RebindList
'        End If
'        KeyCode = 0
'    ElseIf KeyCode = vbKeyUp Then
'        If ListRS.RecordCount > 0 Then
'            If ListRS.BOF = False And ListRS.EOF = False Then
'                ListRS.MovePrevious
'                If ListRS.BOF = True Then
'                    ListRS.MoveFirst
'                End If
'            Else
'                ListRS.MoveFirst
'            End If
'            If ListRS.BOF = False And ListRS.EOF = False Then
'                mBoundText = ListRS.Fields(mBoundField)
'                mListText = ListRS.Fields(mListField)
'            End If
'            Call RebindList
'        End If
'        KeyCode = 0
'    End If
'
'End If
'End Sub
'
'Private Sub Form_Load()
'mLoadStatus = MFORM_NOT_LOADED
'Label1.Left = 0: Label1.Top = 0
'Text1.Left = 0: Text1.Top = Label1.Top + Label1.Height
'List1.Left = 0: List1.Top = Text1.Top + Text1.Height
'Call Form_Resize
'
'End Sub
'
'Private Sub Form_Resize()
'Label1.Width = frmSearch.Width - 1
'Text1.Width = frmSearch.Width - 1
'List1.Width = frmSearch.Width - 1
'List1.Height = frmSearch.Height - Label1.Height - Text1.Height
'cmdFormEnter.Left = frmSearch.Width + cmdFormEnter.Width
'cmdFormEscape.Left = frmSearch.Width + cmdFormEscape.Width
'
'End Sub
'
'Private Sub RebindList()
'Dim mRowCnt As Integer, mTotRows As Integer, mLastRow As Integer, mBookmark As Variant, mAddNewList As Boolean
'mTotRows = Int(List1.Height / TextHeight("A"))
'
'If ListRS.EOF = False And ListRS.BOF = False Then
'    mBookmark = ListRS.Bookmark
'Else
'    If ListRS.RecordCount > 0 Then
'        ListRS.MoveFirst
'    End If
'End If
'For mRowCnt = 0 To List1.ListCount - 1
'    If List1.Selected(mRowCnt) = True Then
'        List1.Selected(mRowCnt) = False
'    End If
'Next mRowCnt
'
'mLastRow = -1
'With ListRS
'For mRowCnt = 0 To mTotRows - 1
'    If .EOF = False And .BOF = False Then
'        mAddNewList = False
'        If List1.ListCount < mRowCnt + 1 Then
'            mAddNewList = True
'        End If
'        If mAddNewList = True Then
'            List1.AddItem CStr(.Fields(mListField))
'            List1.ItemData(mRowCnt) = CStr(.Fields(mBoundField))
'        Else
'            List1.List(mRowCnt) = CStr(.Fields(mListField))
'            List1.ItemData(mRowCnt) = CStr(.Fields(mBoundField))
'        End If
'        'If mRowCnt = 0 Then
'            If CStr(.Fields(mListField)) = mListText And CStr(.Fields(mBoundField)) = mBoundText Then
'            'If Left(CStr(.Fields(mListField)), Len(mListText)) = mListText And mListText <> "" Then
'                List1.Selected(mRowCnt) = True
'            Else
'                List1.Selected(mRowCnt) = False
'            End If
'        'End If
'
'        mLastRow = mRowCnt
'
'        .MoveNext
'    Else
'        If List1.ListCount - 1 > mLastRow Then
'            List1.RemoveItem (List1.ListCount - 1)
'        End If
'    End If
'Next mRowCnt
'If IsEmpty(mBookmark) = False Then
'    ListRS.Bookmark = mBookmark
'End If
'
'End With
'
'End Sub
'
'Private Sub Form_Unload(Cancel As Integer)
'CloseTable BoundRS
'CloseTable ListRS
'mLoadStatus = MFORM_NOT_LOADED
'End Sub
'
'Private Sub List1_Click()
'Dim mSelectedIndex As Integer
'
'If mListMouseClick = True Then
'    mSelectedIndex = ListSelectedIndex()
'    If mSelectedIndex > -1 Then
'        Call ListSelected(mSelectedIndex)
'        frmSearch.Hide
'    End If
'    mListMouseClick = False
'End If
'
'End Sub
'
'Private Function ListSelectedIndex() As Integer
'Dim mRowCnt As Integer, mSelectedIndex As Integer
'mSelectedIndex = -1
'For mRowCnt = 0 To List1.ListCount - 1
'    If List1.Selected(mRowCnt) = True Then
'        mSelectedIndex = mRowCnt
'        Exit For
'    End If
'Next mRowCnt
'ListSelectedIndex = mSelectedIndex
'End Function
'
'Private Sub List1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
'mListMouseClick = True
'End Sub
'
'Private Sub Text1_Change()
'If InterActiveChange(Text1) = True And mCallFromListText = False And mCallFromBoundText = False Then
'    ListText = Text1.Text
'End If
'End Sub
'
'Public Sub InitRecset()
'Set BoundRS = New ADODB.Recordset
'Set ListRS = New ADODB.Recordset
'BoundRS.Open mBoundSource, dbDatabase, adOpenKeyset, adLockReadOnly
'ListRS.Open mListSource, dbDatabase, adOpenKeyset, adLockReadOnly
'List1.Clear
'mBoundText = ""
'mListText = ""
'
'End Sub
'
'Private Sub ListSelected(ByVal mSelectedIndex As Integer)
'If mSelectedIndex = -1 Then
'    mBoundControl.Text = ""
'    mBoundControl.Tag = ""
'    'Text1.Text = ""
'Else
'    'Text1.Text = List1.List(mSelectedIndex)
'    mBoundControl.Text = List1.List(mSelectedIndex)
'    mBoundControl.Tag = List1.ItemData(mSelectedIndex)
'End If
'
'End Sub
'
'Public Sub Requery()
'BoundRS.Requery
'ListRS.Requery
'List1.Clear
'mBoundText = ""
'mListText = ""
'
''BoundText = mBoundText
'End Sub
'
'Private Sub SearchBoundText()
'Dim mSearch As Boolean
'
'With BoundRS
'mSearch = False
'If .EOF = False And .BOF = False Then
'    If .Fields(mBoundField) <> mBoundText & "" Then
'        mSearch = True
'    End If
'Else
'    If .RecordCount > 0 Then
'        mSearch = True
'    End If
'End If
'If .Index <> "" Then
'    If mSearch = True Then
'        .Seek Array(mBoundText & "")
'    End If
'Else
'    If mSearch = True Then
'        .MoveFirst
'        Select Case .Fields(mBoundField).Type
'        Case adVarWChar, adWChar, adChar:
'            .Find mBoundField & "='" & mBoundText & "'"
'        Case adInteger:
'            .Find mBoundField & "=" & Val(mBoundText) & ""
'        Case adDate:
'            .Find mBoundField & "=#" & mBoundText & "#"
'        Case Else
'            MsgBox "undefined data type"
'        End Select
'    End If
'End If
'End With
'
'End Sub
'
'Private Sub SearchListText()
'Dim mSearch As Boolean
'With ListRS
'mSearch = False
'If .EOF = False And .BOF = False Then
'    If .Fields(mListField) <> Trim(mListText) & "" Then
'        mSearch = True
'    End If
'Else
'    If .RecordCount > 0 Then
'        mSearch = True
'    End If
'End If
'If mSearch = True Then
'    .MoveFirst
'    Select Case .Fields(mListField).Type
'    Case adVarWChar, adWChar, adChar:
'        .Find mListField & " LIKE '" & IIf(Trim(mListText) = "", Space(32), Trim(mListText)) & "*'"
'    Case adInteger:
'        .Find mListField & "=" & Val(mListText) & ""
'    Case adDate:
'        .Find mListField & "=#" & mListText & "#"
'    Case Else
'        MsgBox "undefined data type"
'    End Select
'End If
'End With
'
'End Sub
'
'
