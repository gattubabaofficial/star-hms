VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsFlexRecsetSearch"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Public rs As ADODB.Recordset, Mfgrd As MSFlexGrid, mBoundValue As Variant, txtText1 As TextBox, frFrame1 As Frame
Dim mSearchField As Variant, mBoundField As Variant, mSearchFieldNo As Integer, mBoundFieldNo As Integer

Public Sub Store_SearchField(ByVal tSearchField As Variant)
Dim colcnt As Integer
mSearchField = tSearchField
If IsNumeric(mSearchField) = False Then
    mSearchField = UCase(mSearchField)
    For colcnt = 0 To (rs.Fields.Count - 1)
        If UCase(rs.Fields(colcnt).Name) = mSearchField Then
            mSearchFieldNo = colcnt
            Exit For
        End If
    Next
Else
    mSearchFieldNo = CInt(mSearchField)
End If
End Sub

Public Sub Store_BoundField(ByVal tBoundField As Variant)
Dim colcnt As Integer
mBoundField = tBoundField
If IsNumeric(mBoundField) = False Then
    mBoundField = UCase(mBoundField)
    For colcnt = 0 To (rs.Fields.Count - 1)
        If UCase(rs.Fields(colcnt).Name) = mBoundField Then
            mBoundFieldNo = colcnt
            Exit For
        End If
    Next
Else
    mBoundFieldNo = CInt(mBoundField)
End If
End Sub

Public Sub txtText1_Change()
Mfgrd.Redraw = False
'Call SearchFlex(Mfgrd, mSearchFieldNo, txtText1.Text)
Call SearchRecsetFlex
Call Mfgrd_RowColChange
Mfgrd.Refresh
Mfgrd.Redraw = True
End Sub

Public Sub txtText1_KeyDown(KeyCode As Integer, Shift As Integer)
If KeyCode = vbKeyUp Or KeyCode = vbKeyDown Or KeyCode = vbKeyHome Or KeyCode = vbKeyEnd Then
    Call txtText1_KeyPress(KeyCode)
End If
End Sub

Public Sub txtText1_KeyPress(KeyAscii As Integer)
Mfgrd.Redraw = False
If KeyAscii = vbKeyUp Then
    If Mfgrd.Row > Mfgrd.FixedRows Then
        'Mfgrd.Row = Mfgrd.Row - 1
        txtText1.Text = Mfgrd.TextMatrix(Mfgrd.Row - 1, mSearchFieldNo) & ""
    Else
        If rs.BOF = False And rs.RecordCount > 0 Then
            rs.MovePrevious
            If rs.BOF = True Then rs.MoveFirst
            If rs.BOF = False Then
                txtText1.Text = rs.Fields(mSearchFieldNo) & ""
            End If
        End If
    End If
    KeyAscii = 0
ElseIf KeyAscii = vbKeyDown Then
    If Mfgrd.Row < Mfgrd.Rows - 2 Then
        'Mfgrd.Row = Mfgrd.Row + 1
        txtText1.Text = Mfgrd.TextMatrix(Mfgrd.Row + 1, mSearchFieldNo) & ""
    Else
        If rs.EOF = False And rs.RecordCount > 0 Then
            rs.MoveNext
            If rs.EOF = True Then rs.MoveLast
            If rs.EOF = False Then
                txtText1.Text = rs.Fields(mSearchFieldNo) & ""
            End If
        End If
    End If
    KeyAscii = 0
ElseIf KeyAscii = vbKeyHome Then
    If rs.RecordCount > 0 Then
        rs.MoveFirst
        txtText1.Text = rs.Fields(mSearchFieldNo) & ""
    End If
    'Mfgrd.Row = Mfgrd.FixedRows
    KeyAscii = 0
    Call Mfgrd_RowColChange
ElseIf KeyAscii = vbKeyEnd Then
    If rs.RecordCount > 0 Then
        rs.MoveLast
        txtText1.Text = rs.Fields(mSearchFieldNo) & ""
    End If
    'Mfgrd.Row = Mfgrd.Rows - 1
    KeyAscii = 0
    Call Mfgrd_RowColChange
End If

Mfgrd.Refresh
Mfgrd.Redraw = True

End Sub

Public Sub Mfgrd_RowColChange()

If Mfgrd.Row < Mfgrd.FixedRows Then
    If Mfgrd.BackColorSel <> vbRed Then Mfgrd.BackColorSel = vbRed
Else
    If Mfgrd.BackColorSel <> vbHighlight Then Mfgrd.BackColorSel = vbHighlight
End If
Mfgrd.ColSel = 0: Mfgrd.ColSel = Mfgrd.Cols - 1
If Mfgrd.RowIsVisible(Mfgrd.Row) = False Then
    If Mfgrd.Row > Mfgrd.TopRow Then
        Mfgrd.TopRow = Mfgrd.TopRow + (Mfgrd.Row - (Mfgrd.TopRow + (Mfgrd.Height / Mfgrd.RowHeight(0)) - Mfgrd.FixedRows - 1))
    Else
        Mfgrd.TopRow = Mfgrd.TopRow - (Mfgrd.TopRow - Mfgrd.Row)
    End If
Else
    If Mfgrd.Row < Mfgrd.FixedRows Then
        Mfgrd.TopRow = Mfgrd.FixedRows
    End If
End If
End Sub

Public Sub Init_FlexRecset()
Rem rajendra singh shekhawat
Rem fill the list
Rem make it visible
Rem arrange to specify boundvalue from parent form

End Sub

Public Function SearchRecsetFlex()
Dim mSearchStr As String, srow As Integer, colcnt As Integer, rowcnt As Integer, mSearchBegin As Boolean, mMatchWithStr As String, mMatchRecPos As Long, mTopRecPos As Long, mBottomRecPos As Long, mMidRecPos As Long, mPrevRecPos As Long, mLastRecPos As Long, mNewRecPos As Long
Dim mFlexHdrRow As Integer, mFlexFirstRow As Integer, mFlexEolRow As Integer, mFlexLastRow As Integer, mFlexFtrRow As Integer
Dim mLastMousePointer

mLastMousePointer = Screen.MousePointer
Screen.MousePointer = vbHourglass

mFlexHdrRow = 0
mFlexFirstRow = Mfgrd.FixedRows
mFlexEolRow = mFlexFirstRow - 1
mFlexLastRow = Mfgrd.Rows - 2
mFlexFtrRow = Mfgrd.Rows - 1

'If IsNumeric(mSearchField) = False Then
'    mSearchField = UCase(mSearchField)
'    For colcnt = 0 To (rs.Fields.Count - 1)
'        If UCase(rs.Fields(colcnt).Name) = mSearchField Then
'            mSearchFieldNo = colcnt
'            Exit For
'        End If
'    Next
'Else
'    mSearchFieldNo = CInt(mSearchField)
'End If

If frFrame1.Visible = False Then
    Call Init_FlexRecset
End If

mSearchStr = txtText1.Text
mSearchStr = UCase(Trim(mSearchStr))
Rem in case any character is inserted in between searchtext and difference between characters existing and new become vast then it takes time
Rem in case it take time to search more than one characters, whole search can be shifted to search from begin which is quit fast than vast distance between existing and new search characters
If mSearchStr <> "" And (Len(mSearchStr) < 2 Or rs.EOF = True Or rs.BOF = True) Then
    mSearchBegin = True
End If

If mSearchBegin = True Then
    mTopRecPos = IIf(rs.RecordCount > 0, 1, 0)
    mBottomRecPos = rs.RecordCount
    mMidRecPos = mTopRecPos + Int((mBottomRecPos - mTopRecPos) / 2)
    If rs.RecordCount > 0 Then
        rs.MoveFirst
        rs.Move mMidRecPos - 1, adBookmarkFirst
    End If
    Do While (mMidRecPos <> mTopRecPos Or mMidRecPos <> mBottomRecPos) And rs.EOF = False And rs.BOF = False
        mMatchWithStr = UCase(Trim(rs.Fields(mSearchFieldNo)))
        If mSearchStr > mMatchWithStr Then
            mTopRecPos = mMidRecPos
            Rem mBottomRecPos = mBottomRecPos   '   will remain same
        ElseIf mSearchStr < mMatchWithStr Then
            Rem mTopRecPos = mTopRecPos     ' will remain same
            mBottomRecPos = mMidRecPos
        Else    ' matches completely
            mMatchRecPos = mMidRecPos
            Exit Do
        End If
        mMidRecPos = mTopRecPos + Int((mBottomRecPos - mTopRecPos) / 2)
        rs.MoveFirst
        rs.Move mMidRecPos - 1, adBookmarkFirst
        
        If mMidRecPos = mTopRecPos Or mMidRecPos = mBottomRecPos Then
            rs.MoveFirst
            rs.Move mTopRecPos - 1, adBookmarkFirst
            mMatchWithStr = UCase(Trim(rs.Fields(mSearchFieldNo)))
            If mSearchStr = mMatchWithStr Then
                mMatchRecPos = mTopRecPos
            Else
                rs.MoveFirst
                rs.Move mBottomRecPos - 1, adBookmarkFirst
                mMatchWithStr = UCase(Trim(rs.Fields(mSearchFieldNo)))
                If mSearchStr = mMatchWithStr Then
                    mMatchRecPos = mBottomRecPos
                Else
                    rs.MoveFirst
                    rs.Move mTopRecPos - 1, adBookmarkFirst
                    mMatchWithStr = UCase(Trim(rs.Fields(mSearchFieldNo)))
                    If mSearchStr = Left(mMatchWithStr, Len(mSearchStr)) Then
                        mMatchRecPos = mTopRecPos
                    Else
                        rs.MoveFirst
                        rs.Move mBottomRecPos - 1, adBookmarkFirst
                        mMatchWithStr = UCase(Trim(rs.Fields(mSearchFieldNo)))
                        If mSearchStr = Left(mMatchWithStr, Len(mSearchStr)) Then
                            mMatchRecPos = mBottomRecPos
                        Else
                            rs.MoveFirst
                            rs.Move rs.RecordCount, adBookmarkFirst
                            mMatchRecPos = -1
                        End If
                    End If
                End If
            End If
            Exit Do
        End If
    Loop
ElseIf mSearchStr = "" Then
    Mfgrd.Row = mFlexEolRow
    If rs.RecordCount > 0 Then
        rs.MoveFirst
        rs.Move -1, adBookmarkFirst
    End If
Else
    mLastRecPos = rs.AbsolutePosition
    mPrevRecPos = mLastRecPos
    mNewRecPos = mLastRecPos
    Do While rs.EOF = False And rs.BOF = False
        mMatchWithStr = UCase(Trim(rs.Fields(mSearchFieldNo)))
        If mSearchStr > mMatchWithStr Then
            rs.MoveNext
        ElseIf mSearchStr < mMatchWithStr Then
            rs.MovePrevious
        Else
            mMatchRecPos = mNewRecPos
            Exit Do
        End If
        mNewRecPos = rs.AbsolutePosition
        If rs.BOF = True Or rs.EOF = True Then
            If mSearchStr = Left(mMatchWithStr, Len(mSearchStr)) Then
                If mLastRecPos > 0 Then
                    mMatchRecPos = mLastRecPos
                    'rs.MoveFirst
                    'rs.Move mLastRecPos - 1, adBookmarkFirst
                Else
                    mMatchRecPos = -1
                    'rs.MoveFirst
                    'rs.Move rs.RecordCount, adBookmarkFirst
                End If
            Else
                mMatchRecPos = -1
                'rs.MoveFirst
                'rs.Move rs.RecordCount, adBookmarkFirst
            End If
            If mMatchRecPos > 0 Then
                rs.MoveFirst
                rs.Move mMatchRecPos - 1, adBookmarkFirst
            Else
                rs.MoveFirst
                rs.Move rs.RecordCount, adBookmarkFirst
            End If
            Exit Do
        ElseIf mNewRecPos = mPrevRecPos Then
            mMatchWithStr = UCase(Trim(rs.Fields(mSearchFieldNo)))
            If mSearchStr = Left(mMatchWithStr, Len(mSearchStr)) Then
                mMatchRecPos = mNewRecPos
            Else
                rs.MoveFirst
                rs.Move mLastRecPos - 1, adBookmarkFirst
                mMatchWithStr = UCase(Trim(rs.Fields(mSearchFieldNo)))
                If mSearchStr = Left(mMatchWithStr, Len(mSearchStr)) Then
                    mMatchRecPos = mLastRecPos
                Else
                    mMatchRecPos = -1
                    'rs.MoveFirst
                    'rs.Move rs.RecordCount, adBookmarkFirst
                End If
            End If
            If mMatchRecPos > 0 Then
                rs.MoveFirst
                rs.Move mMatchRecPos - 1, adBookmarkFirst
            Else
                rs.MoveFirst
                rs.Move rs.RecordCount, adBookmarkFirst
            End If
            Exit Do
        End If
        mPrevRecPos = mLastRecPos
        mLastRecPos = rs.AbsolutePosition
    Loop
End If
If rs.RecordCount > 0 Then
    If rs.EOF = True Or rs.BOF = True Then
        rs.MoveFirst
        srow = mFlexFirstRow
        Do While rs.EOF = False And srow <= mFlexLastRow
            For colcnt = 0 To Mfgrd.Cols - 1
                Mfgrd.TextMatrix(srow, colcnt) = rs.Fields(colcnt)
            Next
            srow = srow + 1
            
            rs.MoveNext
        Loop
        Do While srow <= mFlexLastRow
            For colcnt = 0 To Mfgrd.Cols - 1
                Mfgrd.TextMatrix(srow, colcnt) = ""
            Next
            srow = srow + 1
        Loop
        rs.MoveFirst
        rs.Move rs.RecordCount, adBookmarkFirst
        Mfgrd.Row = mFlexEolRow
    Else
        mLastRecPos = rs.AbsolutePosition
        mMatchWithStr = UCase(Trim(rs.Fields(mSearchFieldNo)))
        If mMatchWithStr < UCase(Trim(Mfgrd.TextMatrix(mFlexFirstRow, mSearchFieldNo))) Then
            srow = mFlexFirstRow
            Do While rs.EOF = False And srow <= mFlexLastRow
                For colcnt = 0 To Mfgrd.Cols - 1
                    Mfgrd.TextMatrix(srow, colcnt) = rs.Fields(colcnt)
                Next
                srow = srow + 1
                
                rs.MoveNext
            Loop
            Do While srow <= mFlexLastRow
                For colcnt = 0 To Mfgrd.Cols - 1
                    Mfgrd.TextMatrix(srow, colcnt) = ""
                Next
                srow = srow + 1
            Loop
            rs.MoveFirst
            rs.Move mLastRecPos - 1, adBookmarkFirst
            Mfgrd.Row = mFlexFirstRow
        ElseIf mMatchWithStr > UCase(Trim(Mfgrd.TextMatrix(mFlexLastRow, mSearchFieldNo))) Then
            srow = mFlexLastRow
            Do While rs.BOF = False And srow >= mFlexFirstRow
                For colcnt = 0 To Mfgrd.Cols - 1
                    Mfgrd.TextMatrix(srow, colcnt) = rs.Fields(colcnt)
                Next
                srow = srow - 1
                
                rs.MovePrevious
            Loop
            Do While srow >= mFlexFirstRow
                For colcnt = 0 To Mfgrd.Cols - 1
                    Mfgrd.TextMatrix(srow, colcnt) = ""
                Next
                srow = srow - 1
            Loop
            rs.MoveFirst
            rs.Move mLastRecPos - 1, adBookmarkFirst
            Mfgrd.Row = mFlexLastRow
        Else
            Mfgrd.Row = mFlexFtrRow
            For srow = mFlexFirstRow To mFlexLastRow
                If mMatchWithStr = UCase(Trim(Mfgrd.TextMatrix(srow, mSearchFieldNo))) Then
                    Mfgrd.Row = srow
                    Exit For
                End If
            Next
        End If
    End If
Else
    Mfgrd.Row = mFlexEolRow
    For srow = mFlexFirstRow To mFlexLastRow
        For colcnt = 0 To Mfgrd.Cols - 1
            Mfgrd.TextMatrix(srow, colcnt) = ""
        Next
    Next
End If
Screen.MousePointer = mLastMousePointer
End Function


