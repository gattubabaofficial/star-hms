Attribute VB_Name = "tmpstuff"
Option Explicit

Private Sub tmp1()
'Public Function SearchRecsetFlex(ByRef rs As ADODB.Recordset, ByVal mField As Variant, ByRef Mfgrd As MSFlexGrid, ByVal mSearchStr As String)
'Dim mFieldNo As Integer, srow As Integer, colcnt As Integer, rowcnt As Integer, mSearchBegin As Boolean, mMatchWithStr As String, mMatchRecPos As Long, mTopRecPos As Long, mBottomRecPos As Long, mMidRecPos As Long, mPrevRecPos As Long, mLastRecPos As Long, mNewRecPos As Long
'Dim mFlexHdrRow As Integer, mFlexFirstRow As Integer, mFlexEolRow As Integer, mFlexLastRow As Integer, mFlexFtrRow As Integer
'Dim mLastMousePointer
'mLastMousePointer = Screen.MousePointer
'Screen.MousePointer = vbHourglass
'mFlexHdrRow = 0
'mFlexFirstRow = Mfgrd.FixedRows
'mFlexEolRow = mFlexFirstRow - 1
'mFlexLastRow = Mfgrd.Rows - 2
'mFlexFtrRow = Mfgrd.Rows - 1
'
'If IsNumeric(mField) = False Then
'    mField = UCase(mField)
'    For colcnt = 0 To (rs.Fields.Count - 1)
'        If UCase(rs.Fields(colcnt).Name) = mField Then
'            mFieldNo = colcnt
'            Exit For
'        End If
'    Next
'Else
'    mFieldNo = CInt(mField)
'End If
'
'mSearchStr = UCase(Trim(mSearchStr))
'Rem in case any character is inserted in between searchtext and difference between characters existing and new become vast then it takes time
'Rem in case it take time to search more than one characters, whole search can be shifted to search from begin which is quit fast than vast distance between existing and new search characters
'If mSearchStr <> "" And (Len(mSearchStr) < 2 Or rs.EOF = True Or rs.BOF = True) Then
'    mSearchBegin = True
'End If
'
'If mSearchBegin = True Then
'    mTopRecPos = IIf(rs.RecordCount > 0, 1, 0)
'    mBottomRecPos = rs.RecordCount
'    mMidRecPos = mTopRecPos + Int((mBottomRecPos - mTopRecPos) / 2)
'    If rs.RecordCount > 0 Then
'        rs.MoveFirst
'        rs.Move mMidRecPos - 1, adBookmarkFirst
'    End If
'    Do While (mMidRecPos <> mTopRecPos Or mMidRecPos <> mBottomRecPos) And rs.EOF = False And rs.BOF = False
'        mMatchWithStr = UCase(Trim(rs.Fields(mFieldNo)))
'        If mSearchStr > mMatchWithStr Then
'            mTopRecPos = mMidRecPos
'            Rem mBottomRecPos = mBottomRecPos   '   will remain same
'        ElseIf mSearchStr < mMatchWithStr Then
'            Rem mTopRecPos = mTopRecPos     ' will remain same
'            mBottomRecPos = mMidRecPos
'        Else    ' matches completely
'            mMatchRecPos = mMidRecPos
'            Exit Do
'        End If
'        mMidRecPos = mTopRecPos + Int((mBottomRecPos - mTopRecPos) / 2)
'        rs.MoveFirst
'        rs.Move mMidRecPos - 1, adBookmarkFirst
'
'        If mMidRecPos = mTopRecPos Or mMidRecPos = mBottomRecPos Then
'            rs.MoveFirst
'            rs.Move mTopRecPos - 1, adBookmarkFirst
'            mMatchWithStr = UCase(Trim(rs.Fields(mFieldNo)))
'            If mSearchStr = mMatchWithStr Then
'                mMatchRecPos = mTopRecPos
'            Else
'                rs.MoveFirst
'                rs.Move mBottomRecPos - 1, adBookmarkFirst
'                mMatchWithStr = UCase(Trim(rs.Fields(mFieldNo)))
'                If mSearchStr = mMatchWithStr Then
'                    mMatchRecPos = mBottomRecPos
'                Else
'                    rs.MoveFirst
'                    rs.Move mTopRecPos - 1, adBookmarkFirst
'                    mMatchWithStr = UCase(Trim(rs.Fields(mFieldNo)))
'                    If mSearchStr = Left(mMatchWithStr, Len(mSearchStr)) Then
'                        mMatchRecPos = mTopRecPos
'                    Else
'                        rs.MoveFirst
'                        rs.Move mBottomRecPos - 1, adBookmarkFirst
'                        mMatchWithStr = UCase(Trim(rs.Fields(mFieldNo)))
'                        If mSearchStr = Left(mMatchWithStr, Len(mSearchStr)) Then
'                            mMatchRecPos = mBottomRecPos
'                        Else
'                            rs.MoveFirst
'                            rs.Move rs.RecordCount, adBookmarkFirst
'                            mMatchRecPos = -1
'                        End If
'                    End If
'                End If
'            End If
'            Exit Do
'        End If
'    Loop
'ElseIf mSearchStr = "" Then
'    Mfgrd.Row = mFlexEolRow
'    If rs.RecordCount > 0 Then
'        rs.MoveFirst
'        rs.Move -1, adBookmarkFirst
'    End If
'Else
'    mLastRecPos = rs.AbsolutePosition
'    mPrevRecPos = mLastRecPos
'    mNewRecPos = mLastRecPos
'    Do While rs.EOF = False And rs.BOF = False
'        mMatchWithStr = UCase(Trim(rs.Fields(mFieldNo)))
'        If mSearchStr > mMatchWithStr Then
'            rs.MoveNext
'        ElseIf mSearchStr < mMatchWithStr Then
'            rs.MovePrevious
'        Else
'            mMatchRecPos = mNewRecPos
'            Exit Do
'        End If
'        mNewRecPos = rs.AbsolutePosition
'        If rs.BOF = True Or rs.EOF = True Then
'            If mSearchStr = Left(mMatchWithStr, Len(mSearchStr)) Then
'                If mLastRecPos > 0 Then
'                    mMatchRecPos = mLastRecPos
'                    'rs.MoveFirst
'                    'rs.Move mLastRecPos - 1, adBookmarkFirst
'                Else
'                    mMatchRecPos = -1
'                    'rs.MoveFirst
'                    'rs.Move rs.RecordCount, adBookmarkFirst
'                End If
'            Else
'                mMatchRecPos = -1
'                'rs.MoveFirst
'                'rs.Move rs.RecordCount, adBookmarkFirst
'            End If
'            If mMatchRecPos > 0 Then
'                rs.MoveFirst
'                rs.Move mMatchRecPos - 1, adBookmarkFirst
'            Else
'                rs.MoveFirst
'                rs.Move rs.RecordCount, adBookmarkFirst
'            End If
'            Exit Do
'        ElseIf mNewRecPos = mPrevRecPos Then
'            mMatchWithStr = UCase(Trim(rs.Fields(mFieldNo)))
'            If mSearchStr = Left(mMatchWithStr, Len(mSearchStr)) Then
'                mMatchRecPos = mNewRecPos
'            Else
'                rs.MoveFirst
'                rs.Move mLastRecPos - 1, adBookmarkFirst
'                mMatchWithStr = UCase(Trim(rs.Fields(mFieldNo)))
'                If mSearchStr = Left(mMatchWithStr, Len(mSearchStr)) Then
'                    mMatchRecPos = mLastRecPos
'                Else
'                    mMatchRecPos = -1
'                    'rs.MoveFirst
'                    'rs.Move rs.RecordCount, adBookmarkFirst
'                End If
'            End If
'            If mMatchRecPos > 0 Then
'                rs.MoveFirst
'                rs.Move mMatchRecPos - 1, adBookmarkFirst
'            Else
'                rs.MoveFirst
'                rs.Move rs.RecordCount, adBookmarkFirst
'            End If
'            Exit Do
'        End If
'        mPrevRecPos = mLastRecPos
'        mLastRecPos = rs.AbsolutePosition
'    Loop
'End If
'If rs.RecordCount > 0 Then
'    If rs.EOF = True Or rs.BOF = True Then
'        rs.MoveFirst
'        srow = mFlexFirstRow
'        Do While rs.EOF = False And srow <= mFlexLastRow
'            For colcnt = 0 To Mfgrd.Cols - 1
'                Mfgrd.TextMatrix(srow, colcnt) = rs.Fields(colcnt)
'            Next
'            srow = srow + 1
'
'            rs.MoveNext
'        Loop
'        Do While srow <= mFlexLastRow
'            For colcnt = 0 To Mfgrd.Cols - 1
'                Mfgrd.TextMatrix(srow, colcnt) = ""
'            Next
'            srow = srow + 1
'        Loop
'        rs.MoveFirst
'        rs.Move rs.RecordCount, adBookmarkFirst
'        Mfgrd.Row = mFlexEolRow
'    Else
'        mLastRecPos = rs.AbsolutePosition
'        mMatchWithStr = UCase(Trim(rs.Fields(mFieldNo)))
'        If mMatchWithStr < UCase(Trim(Mfgrd.TextMatrix(mFlexFirstRow, mFieldNo))) Then
'            srow = mFlexFirstRow
'            Do While rs.EOF = False And srow <= mFlexLastRow
'                For colcnt = 0 To Mfgrd.Cols - 1
'                    Mfgrd.TextMatrix(srow, colcnt) = rs.Fields(colcnt)
'                Next
'                srow = srow + 1
'
'                rs.MoveNext
'            Loop
'            Do While srow <= mFlexLastRow
'                For colcnt = 0 To Mfgrd.Cols - 1
'                    Mfgrd.TextMatrix(srow, colcnt) = ""
'                Next
'                srow = srow + 1
'            Loop
'            rs.MoveFirst
'            rs.Move mLastRecPos - 1, adBookmarkFirst
'            Mfgrd.Row = mFlexFirstRow
'        ElseIf mMatchWithStr > UCase(Trim(Mfgrd.TextMatrix(mFlexLastRow, mFieldNo))) Then
'            srow = mFlexLastRow
'            Do While rs.BOF = False And srow >= mFlexFirstRow
'                For colcnt = 0 To Mfgrd.Cols - 1
'                    Mfgrd.TextMatrix(srow, colcnt) = rs.Fields(colcnt)
'                Next
'                srow = srow - 1
'
'                rs.MovePrevious
'            Loop
'            Do While srow >= mFlexFirstRow
'                For colcnt = 0 To Mfgrd.Cols - 1
'                    Mfgrd.TextMatrix(srow, colcnt) = ""
'                Next
'                srow = srow - 1
'            Loop
'            rs.MoveFirst
'            rs.Move mLastRecPos - 1, adBookmarkFirst
'            Mfgrd.Row = mFlexLastRow
'        Else
'            Mfgrd.Row = mFlexFtrRow
'            For srow = mFlexFirstRow To mFlexLastRow
'                If mMatchWithStr = UCase(Trim(Mfgrd.TextMatrix(srow, mFieldNo))) Then
'                    Mfgrd.Row = srow
'                    Exit For
'                End If
'            Next
'        End If
'    End If
'Else
'    Mfgrd.Row = mFlexEolRow
'    For srow = mFlexFirstRow To mFlexLastRow
'        For colcnt = 0 To Mfgrd.Cols - 1
'            Mfgrd.TextMatrix(srow, colcnt) = ""
'        Next
'    Next
'End If
'Screen.MousePointer = mLastMousePointer
'End Function
End Sub

'// ***************************************************************** //'
'Rem Select Query Structure Fields array columns definitions
'Public Const cFIELD_EXPR = 0
'Public Const cFIELD_ALIAS = 1
'Public Const cFIELD_TITLE = 2
'Public Const cFIELD_SHOW = 3
'Public Const cFIELD_ATTRIB = 4
'Public Const cFIELD_LINK = 5
'Public Const cFIELD_ALIGN = 6
'Public Const cFIELD_WIDTH = 7
'Public Const cFIELD_NUMFMT = 8
'Public Const cFIELD_INVCOMP = 9 ' INVERT COMPARE
'Public Const cFIELD_COLS = 10
'Rem Select Query Structure from array column definitions
'Public Const cFROM_TABLE = 0
'Public Const cFROM_ALIAS = 1
'Public Const cFROM_COLS = 2
'Rem Select Query Structure Joins array columns definitions
'Public Const cJOIN_TYPE = 0
'Public Const cJOIN_TABLE = 1
'Public Const cJOIN_ALIAS = 2
'Public Const cJOIN_MATCH = 3
'Public Const cJOIN_COLS = 4
'Rem Select Query Structure Filter array columns definitions
'Public Const cFILTER_ANDOR = 0
'Public Const cFILTER_EXPR = 1
'Public Const cFILTER_ATTRIB = 2
'Public Const cFILTER_COLS = 3
'Rem Select Query Structure Groupby array columns definitions
'Public Const cGROUPBY_EXPR = 0
'Public Const cGROUPBY_COLS = 1
'Rem Select Query Structure cORDERBY_EXPR array columns definitions
'Public Const cORDERBY_EXPR = 0
'Public Const cORDERBY_ATTRIB = 1
'Public Const cORDERBY_COLS = 2
'// ***************************************************************** //'


