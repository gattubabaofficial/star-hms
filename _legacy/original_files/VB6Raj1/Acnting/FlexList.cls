VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsFlexList"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Rem StartRow       - Starting data row, derived variable based on record counts, introduced due to lack of keypress/keydown event in flexgrid
Rem EndRow         - Ending data row, derived variable based on record counts, introduced due to lack of keypress/keydown event in flexgrid
Rem mFirstRow      - Starting data row if records are completely filled in list, else margin row either begin of list row or end of list row
Rem mLastRow       - Last data row if records are completely filled in list, else margin row i.e. end of list row
Rem mActiveRow     - ActiveRow of flex grid
Rem mFirstRow & mLastRow and the strong interpreters
Rem mListRows      - Detail rows including data and/or margins and blanks area
Rem ScrollRows     - Detail rows containing data and/or blank area, derived variable at run time based on record counts, introduced due to lack of keypress/keydown event in flexgrid
Rem BeginOfListRow - Detail Header i.e. First row of detail area when record counting exceeds Total List Rows
Rem EndOfListRow   - Detail Footer i.e. Either First row of detail area when record counting is zero, otherwise Last Row of detail area if record counting exceeds total List Rows
Rem mListRows      - Detail area rows including data rows and/or margin rows
Rem as far as possible always check record count, as lan may affect list generation other than our add/edit/delete/movement action

Option Explicit
Dim Mfgrd1 As MSFlexGrid, Recset As ADODB.RecordSet
Dim mFlexPos As Integer, mActiveRow As Integer, mFirstRow As Integer, mLastRow As Integer, mListRows As Integer, mFillList As Boolean, mFillInProcess As Boolean
Dim adtlFlexCol As FlexColDef, RowState As FlexRowState
Dim mUseMargin As Boolean, mRowLeaved As Boolean, mCtrlKeyHolded As Boolean

Private Type FlexColDef
Heading() As Variant
ColWidth() As Variant
ColAlign() As Variant
ColExpr() As Variant

End Type

Private Type FlexRowState
Normal As String
BeginOfList As String
EndOfList As String
Disable As String
Red_Alert As String
Void As String
End Type

Private Sub Class_Initialize()
RowState.Normal = "<NORMAL>"
RowState.EndOfList = "<BEGIN_OF_LIST>"
RowState.EndOfList = "<END_OF_LIST>"
RowState.Disable = "<DISABLE>"
RowState.Red_Alert = "<RED_ALERT>"
RowState.Void = "<VOID>"
mUseMargin = False
End Sub

Public Property Get FlexPos() As Integer
FlexPos = mFlexPos
End Property

Public Property Let FlexPos(ByVal mPos As Integer)
If Between(mPos, mFirstRow, mLastRow) = True Then
    mFlexPos = mPos
Else
    ErrorBox "Invalid FlexList Position !!!"
End If
End Property

Public Property Get ActiveRow() As Integer
ActiveRow = mActiveRow
End Property

Public Property Let ActiveRow(ByVal mRow As Integer)
mActiveRow = mRow
End Property

Rem called when flex grid gets focus or flex cursor is moved or when flex initialized
Rem record count will checked at first
Rem when active curosr is valid one, record cursor is moved accordingly
Rem when bof or eof is reached, moveforward or movebackward will be called accordingly
Rem if no previous or next record is found, flex cursor will be reposined on appropriate top or bottom
Rem if record count mismatch with flex rows i.e. match flex rows when record count <= listrows and greater than listrows  then refresh list
Rem if no record exist, but flex shows records or not endoflist, list will be refrehsed
Rem if record exist, but flex does not show records , list will be refreshed
Rem if required flex active row will be changed accordingly
Public Property Let ActiveRowChange(ByVal mTargetRow As Integer)
If Recset.RecordCount > 0 Then
    If (mUseMargin = True And Mfgrd1.TextMatrix(mTargetRow, 0) = RowState.BeginOfList) _
     Or (mUseMargin = False And mRowLeaved = False And mTargetRow = StartRow) Then
        If StartRow - mActiveRow = 0 And mCtrlKeyHolded = False Then     ' moving back one step
            If MoveBackward() = True Then
                mFillList = True
            End If
        Else    ' moving back multiple step
            If SetActiveRec() = True Then
                If mCtrlKeyHolded = True And StartRow - mActiveRow = 0 Then
                    Recset.Move (mListRows - 1) * -1
                Else
                    Recset.Move (StartRow - mActiveRow)
                End If
                If Recset.BOF = True Then
                    Recset.MoveFirst
                    If Recset.AbsolutePosition <> Val(Mfgrd1.TextMatrix(mActiveRow, 1)) Then
                        mFillList = True
                    End If
                Else
                    mFillList = True
                End If
            End If
        End If
        mActiveRow = StartRow
    ElseIf (mUseMargin = True And Mfgrd1.TextMatrix(mTargetRow, 0) = RowState.EndOfList) _
     Or (mUseMargin = False And mRowLeaved = False And mTargetRow = EndRow) Then
        If EndRow - mActiveRow = 0 And mCtrlKeyHolded = False Then   ' moving forward one step
            If MoveForward() = True Then
                mFillList = True
            End If
        Else        ' moving forward multiple step
            If SetActiveRec() = True Then
                If mCtrlKeyHolded = True And EndRow - mActiveRow = 0 Then
                    Recset.Move mListRows - 1
                Else
                    Recset.Move (EndRow - mActiveRow)
                End If
                If Recset.EOF = True Then
                    Recset.MoveLast
                    If Recset.AbsolutePosition <> Val(Mfgrd1.TextMatrix(mActiveRow, 1)) Then
                        mFillList = True
                    End If
                Else
                    mFillList = True
                End If
            End If
        End If
        mActiveRow = EndRow
    ElseIf Mfgrd1.TextMatrix(mTargetRow, 0) = RowState.Normal Then
        mActiveRow = mTargetRow
        Call SetActiveRec
        Rem check here any changes made in lan environment, i.e. any change in record will be informed to all users and all users will sense change from that
        Rem if changed is made then refreshlist is required
        Rem mFillList = True    ' expected lan multi user handling
    Else    ' undefined cursor movement
        ErrorBox "Undefined/Unexpected Cursor Movement !!!"
        mFillList = True
        mActiveRow = StartRow
    End If
    If mFillList = False Then   ' checking mismatch record count with flex rows count in case when list refresh is not instructed from above
        If Recset.RecordCount <= mListRows Then
            If Recset.RecordCount <> (Mfgrd1.Rows - mFirstRow) Then
                mFillList = True
                mActiveRow = StartRow
            End If
        ElseIf Recset.RecordCount > mListRows Then
            If (Mfgrd1.Rows - mFirstRow) < mListRows Then
                mFillList = True
                mActiveRow = StartRow
            End If
        End If
    End If
Else
    If mActiveRow <> mFirstRow Then
        mFillList = True
        mActiveRow = mFirstRow
    ElseIf Mfgrd1.Rows > mFirstRow + 1 Then
        mFillList = True
    ElseIf Mfgrd1.TextMatrix(mActiveRow, 0) <> RowState.EndOfList Then
        mFillList = True
    End If
End If

End Property

Public Property Get FirstRow() As Integer
FirstRow = mFirstRow
End Property

Public Property Get LastRow() As Integer
LastRow = mLastRow
End Property

Public Property Get RowLeaved() As Boolean
RowLeaved = mRowLeaved
End Property

Public Property Let RowLeaved(ByVal mOpt As Boolean)
mRowLeaved = mOpt
End Property

Rem StartRow is readonly at runtime, because it is a derived variable
Public Property Get StartRow() As Integer
If Recset.RecordCount > mListRows And mUseMargin = True Then
    StartRow = mFirstRow + 1
Else
    StartRow = mFirstRow
End If
End Property

Rem EndRow is readonly at runtime, because it is a derived variable
Public Property Get EndRow() As Integer
If Recset.RecordCount > mListRows And mUseMargin = True Then
    EndRow = mLastRow - 1
Else
    EndRow = mLastRow
End If
End Property

Public Property Get ListRows() As Integer
ListRows = mListRows
End Property

Public Property Get DataRows() As Integer
Dim mRtnval As Integer
mRtnval = mListRows
If Recset.RecordCount > mListRows And mUseMargin = True Then
    mRtnval = mRtnval - 2
End If
DataRows = mRtnval
End Property

Public Property Get FinishRow() As Integer
If Recset.RecordCount > mListRows Then
    FinishRow = EndRow
Else
    FinishRow = StartRow + (Recset.RecordCount - 1)
End If

End Property

Rem ScrollRows is derived variable at run time based on record counts
Public Property Get ScrollRows() As Integer
If Recset.RecordCount > mListRows Then
    ScrollRows = mListRows - 2
Else
    ScrollRows = mListRows
End If
End Property

Public Property Get FlexCols() As Integer
FlexCols = Mfgrd1.Cols
End Property

Public Property Get LColCount() As Integer
LColCount = LBound(adtlFlexCol.Heading)
End Property

Public Property Get UColCount() As Integer
UColCount = UBound(adtlFlexCol.Heading)
End Property

Public Sub AddNewCol(ByVal mHeading As String, mColWidth As Double, mColAlign As Integer, mColExpr As String)
Dim acount As Integer, srow As Integer

With adtlFlexCol
acount = UBound(.Heading) + 1

ReDim Preserve .Heading(acount)
ReDim Preserve .ColWidth(acount)
ReDim Preserve .ColAlign(acount)
ReDim Preserve .ColExpr(acount)

.Heading(acount) = IIf(mHeading = "", "Column_" & CStr(acount), mHeading)
.ColWidth(acount) = mColWidth
.ColAlign(acount) = mColAlign
.ColExpr(acount) = mColExpr

Mfgrd1.Cols = FlexCols
srow = 0
Mfgrd1.TextMatrix(srow, acount) = mHeading
Mfgrd1.ColWidth(acount) = mColWidth
Mfgrd1.ColAlignment(acount) = mColAlign

End With

End Sub

Public Sub ClearFlexCols()
Rem first col = row state
Rem second col = recset absolute position
Rem third col = user column required
With Mfgrd1
.Cols = 3
.FixedCols = 0
.ColWidth(0) = 0
.ColWidth(1) = 0
End With
End Sub

Public Sub ClearFlexRows()
Dim cnt As Integer
With Mfgrd1
.Rows = 2
.FixedRows = 1
For cnt = 0 To .Cols - 1
    .TextMatrix(.FixedRows, cnt) = ""
Next cnt
End With

End Sub

Public Property Set FlexGrid(ByRef mFlexGrid As MSFlexGrid)
Set Mfgrd1 = mFlexGrid
End Property

Public Property Set RecordSet(ByRef mRecset As ADODB.RecordSet)
Set Recset = mRecset
End Property

Public Sub Mark_Normal(Optional ByVal mPos)
Dim mTargetPos As Integer
mTargetPos = IIf(IsMissing(mPos) = True, mFlexPos, mPos)
If Between(mTargetPos, mFirstRow, mLastRow) = True Then
    Mfgrd1.TextMatrix(mTargetPos, 0) = RowState.Normal
Else
    ErrorBox "Invalid Flex Pos !!!"
End If

End Sub

Public Sub Mark_BeginOfList(Optional ByVal mPos)
Dim mTargetPos As Integer
mTargetPos = IIf(IsMissing(mPos) = True, mFlexPos, mPos)
If Between(mTargetPos, mFirstRow, mLastRow) = True Then
    Mfgrd1.TextMatrix(mTargetPos, 0) = RowState.BeginOfList
Else
    ErrorBox "Invalid Flex Pos !!!"
End If

End Sub

Public Sub Mark_EndOfList(Optional ByVal mPos)
Dim mTargetPos As Integer
mTargetPos = IIf(IsMissing(mPos) = True, mFlexPos, mPos)
If Between(mTargetPos, mFirstRow, mLastRow) = True Then
    Mfgrd1.TextMatrix(mTargetPos, 0) = RowState.EndOfList
Else
    ErrorBox "Invalid Flex Pos !!!"
End If

End Sub

Public Sub Mark_Disable(Optional ByVal mPos)
Dim mTargetPos As Integer
mTargetPos = IIf(IsMissing(mPos) = True, mFlexPos, mPos)
If Between(mTargetPos, mFirstRow, mLastRow) = True Then
    Mfgrd1.TextMatrix(mTargetPos, 0) = RowState.Disable
Else
    ErrorBox "Invalid Flex Pos !!!"
End If

End Sub

Public Sub Mark_RedAlert(Optional ByVal mPos)
Dim mTargetPos As Integer
mTargetPos = IIf(IsMissing(mPos) = True, mFlexPos, mPos)
If Between(mTargetPos, mFirstRow, mLastRow) = True Then
    Mfgrd1.TextMatrix(mTargetPos, 0) = RowState.Red_Alert
Else
    ErrorBox "Invalid Flex Pos !!!"
End If

End Sub

Public Sub Mark_Void(Optional ByVal mPos)
Dim mTargetPos As Integer
mTargetPos = IIf(IsMissing(mPos) = True, mFlexPos, mPos)
If Between(mTargetPos, mFirstRow, mLastRow) = True Then
    Mfgrd1.TextMatrix(mTargetPos, 0) = RowState.Void
Else
    ErrorBox "Invalid Flex Pos !!!"
End If

End Sub

Rem deemed function
Rem returns true when the specified row is deemed to be beginoflist position else false
Rem check with record count
Public Function IsBeginOfList(ByVal mRow As Integer) As Boolean
Dim mRtnval As Boolean
mRtnval = (Recset.RecordCount > 0 And Recset.RecordCount > mListRows And mRow = mFirstRow And mUseMargin = True)
IsBeginOfList = mRtnval
End Function

Rem deemed function
Rem returns true when the specified row is deemed to be endoflist position else false
Rem check with record count
Rem if record count is greater than listrows then last row else if record count is zero then first row is end of list row
Public Function IsEndOfList(ByVal mRow As Integer) As Boolean
Dim mRtnval As Boolean
mRtnval = (Recset.RecordCount > 0 And Recset.RecordCount > mListRows And mRow = mLastRow And mUseMargin = True) Or (Recset.RecordCount = 0 And mRow = mFirstRow)
IsEndOfList = mRtnval
End Function

Rem checks weather specified row exist in flex grid or not
Public Function IsFlexRowExist(ByVal mRow As Integer) As Boolean
If Mfgrd1.Rows < mRow + 1 Then
    IsFlexRowExist = False
Else
    IsFlexRowExist = True
End If
End Function

Rem simply appends row at the end to flex grid
Public Sub AppendFlexRow()
Mfgrd1.Rows = Mfgrd1.Rows + 1
End Sub

Rem simply removes last row from flex list
Public Sub RemoveFlexRow()
Mfgrd1.Rows = Mfgrd1.Rows - 1
End Sub

Rem checks existence of specified row number, if not appends new row to flex until specified row number is available
Public Sub AvailFlexRow(ByVal mRow As Integer)
Do While IsFlexRowExist(mRow) = False
    Call AppendFlexRow
Loop
End Sub

Rem checks existence of specified row number, removes row until specified row is present
Public Sub IsolateFlexRow(ByVal mRow As Integer)
Do While IsFlexRowExist(mRow) = True
    Call RemoveFlexRow
Loop
End Sub

Public Sub MoveFirstPos()
mFlexPos = mFirstRow
End Sub

Public Sub MoveLastPos()
mFlexPos = mLastRow
End Sub

Public Sub MoveNextPos()
mFlexPos = mFlexPos + 1
End Sub

Public Sub MoveStartPos()
mFlexPos = StartRow
End Sub

Public Sub MoveEndPos()
mFlexPos = EndRow
End Sub

Public Sub MovePreviousPos()
mFlexPos = mFlexPos - 1
End Sub

Public Property Get FillList() As Boolean
FillList = mFillList
End Property

Public Property Let FillList(ByVal mFillOpt As Boolean)
mFillList = mFillOpt
End Property

Public Property Get FillInProcess() As Boolean
FillInProcess = mFillInProcess
End Property

Public Property Let FillInProcess(ByVal mFillOpt As Boolean)
mFillInProcess = mFillOpt
End Property

Rem called when cursor movement on next record is requested: implimented on record counting greater than zero
Rem simply positon the cursor on current position: skip record to next record:
Rem if eof is reached: move pointer on last record: if valid record then return true to calling program else false
Rem this function only advances cursor to next record, if successful, return true else false to the calling program
Public Function MoveForward() As Boolean
Dim mRtnval As Integer
mRtnval = False
If Recset.RecordCount > 0 Then
    If SetActiveRec() = True Then
        Recset.MoveNext
        If Recset.EOF = True Then
            Recset.MoveLast
        Else
            mRtnval = True
        End If
    End If
End If
MoveForward = mRtnval
End Function

Rem called when cursor movement on previous record is requested: first check record counting greater than zero
Rem simply positon the cursor on current position: skip record to previous record:
Rem if bof is reached: move pointer on first record: if valid record then return true to calling program else false
Rem this function only advances cursor to previous record, if successful, return true else false to the calling program
Public Function MoveBackward() As Boolean
Dim mRtnval As Integer
mRtnval = False
If Recset.RecordCount > 0 Then
    If SetActiveRec() = True Then
        Recset.MovePrevious
        If Recset.BOF = True Then
            Recset.MoveFirst
        Else
            mRtnval = True
        End If
    End If
End If
MoveBackward = mRtnval
End Function

Rem places the record pointer on active record pointer as on flex list
Rem check record count first: returns true if successfull else false
Public Function SetActiveRec() As Boolean
Dim mRtnval As Boolean
mRtnval = False
If Recset.RecordCount > 0 Then
    If Mfgrd1.TextMatrix(mActiveRow, 0) = RowState.Normal Then
        If Recset.EOF = True Or Recset.BOF = True Then
            Recset.MoveFirst
            Recset.Move Val(Mfgrd1.TextMatrix(mActiveRow, 1)) - 1
        ElseIf Recset.AbsolutePosition <> Val(Mfgrd1.TextMatrix(mActiveRow, 1)) Then
            Recset.MoveFirst
            Recset.Move Val(Mfgrd1.TextMatrix(mActiveRow, 1)) - 1
        End If
        mRtnval = (Recset.AbsolutePosition = Val(Mfgrd1.TextMatrix(mActiveRow, 1)))
    End If
End If
SetActiveRec = mRtnval
End Function

Rem called when record added or edited: desired record pointer will be set in advance by calling subroutine
Rem either added or edited, list will be refreshed in both cases: check record count first as can be affected by lan environment
Rem active flex cursor will remain unchanged as old record will be edited on same and new record will be inserted at active flex cursor positon
Rem just check to it that newely added record does not fall under bof or eof flex locations if record counting exceeds listrows
Public Function ListRecEdited()
mFillList = True
If Recset.RecordCount > 0 Then
    If Recset.RecordCount > mListRows Then
        If Recset.BOF = True Then
            Recset.Requery
            Recset.MoveFirst
        ElseIf Recset.EOF = True Then
            Recset.Requery
            Recset.MoveLast
        End If
        If Recset.AbsolutePosition > Val(Mfgrd1.TextMatrix(EndRow, 1)) Then
            mActiveRow = EndRow
        ElseIf Recset.AbsolutePosition < Val(Mfgrd1.TextMatrix(StartRow, 1)) Then
            mActiveRow = StartRow
        Else
            mActiveRow = StartRow + (Recset.AbsolutePosition - Val(Mfgrd1.TextMatrix(StartRow, 1)))
        End If
    Else
        mActiveRow = StartRow + (Recset.AbsolutePosition - 1)
    End If
Else
    mActiveRow = mFirstRow
End If

End Function

Rem called when record is deleted: list will be refreshed always: record pointer will be positioned on active flex record pointer (absoluteposition)
Rem if eof is reached, move to last record: while setting active flex cursor check record counting and flex startrow and endrow boundries
Rem the active flex cursor will be changed if no record under active flex postion or record counting equals listrows
Public Function ListRecDeleted()
mFillList = True
If Recset.RecordCount > 0 Then
    If Recset.EOF = True Or Recset.BOF = True Then
        Recset.MoveFirst
        Recset.Move Val(Mfgrd1.TextMatrix(mActiveRow, 1)) - 1
    ElseIf Recset.AbsolutePosition <> Val(Mfgrd1.TextMatrix(mActiveRow, 1)) Then
        Recset.MoveFirst
        Recset.Move Val(Mfgrd1.TextMatrix(mActiveRow, 1)) - 1
    End If
    If Recset.EOF = True Or Recset.BOF = True Then
        MoveRecToLast Recset
    End If
    If Recset.RecordCount > mListRows Then
        If mActiveRow < StartRow Then       ' may be caused due to lan environment
            mActiveRow = StartRow
        ElseIf mActiveRow > EndRow Then     ' may be caused due to lan environment
            mActiveRow = EndRow
        Else
            If Recset.RecordCount < Val(Mfgrd1.TextMatrix(EndRow, 1)) Then
                mActiveRow = mActiveRow + 1
                If mActiveRow > EndRow Then
                    mActiveRow = EndRow
                End If
            End If
            Rem mActiveRow will remain unchanged
        End If
    ElseIf Recset.RecordCount <= mListRows Then
        mActiveRow = StartRow + (Recset.AbsolutePosition - 1)
    End If
Else
    mActiveRow = mFirstRow
End If

End Function

Rem called just after ListRowEdited/ListRowDeleted/MoveForward and and just before RefreshList
Rem flex active row and record pointer will be set in advance accurately
Rem record pointer will be positioned on top list row in conjunction with flex active cursor, so that whole list can be refreshed/regenerated
Rem check it with record counting: if record counting greater than zero, move record backward towards startrow
Public Function MoveTopPosRec()
With Recset
If .RecordCount > 0 Then
    .Move (mActiveRow - StartRow) * -1
    If .EOF = True Or .BOF = True Then
        .MoveFirst
    End If
End If
End With
End Function

Rem called after refreshing/regenerating list
Rem if physical flex cursor is different from active flex cursor, it is reset to active flex cursor
Rem if active flex cursor is valid one, then record pointer is also checked to be on desired position
Public Function ShowActiveRow()
If Mfgrd1.Row <> mActiveRow Then
    Mfgrd1.Row = mActiveRow
End If
If Mfgrd1.TextMatrix(mActiveRow, 0) = RowState.Normal Then
    If Recset.EOF = True Or Recset.BOF = True Then
        Recset.MoveFirst
        Recset.Move Val(Mfgrd1.TextMatrix(mActiveRow, 1)) - 1
    ElseIf Recset.AbsolutePosition <> Val(Mfgrd1.TextMatrix(mActiveRow, 1)) Then
        Recset.MoveFirst
        Recset.Move Val(Mfgrd1.TextMatrix(mActiveRow, 1)) - 1
    End If
    If Recset.RecordCount = 0 Or Recset.AbsolutePosition <> Val(Mfgrd1.TextMatrix(mActiveRow, 1)) Then
        ErrorBox "Invalid Record Pointer !!!"
    End If
End If

End Function

Public Property Let CtrlKeyHolded(ByVal mState As Boolean)
mCtrlKeyHolded = mState
End Property

Public Sub Init_Flex()
Dim mRowCnt As Integer
ClearFlexCols
ClearFlexRows
With Mfgrd1
mFirstRow = .FixedRows
mLastRow = Int(.Height / .RowHeightMin) - Mfgrd1.FixedRows - 1   ' total flex height devide by row min height minus fixed rows minus 1 i.e. row begin from zero
mFlexPos = mFirstRow
mActiveRow = mFirstRow
mListRows = mLastRow - mFirstRow + 1

Mark_EndOfList mFirstRow
End With

End Sub

