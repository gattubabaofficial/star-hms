Attribute VB_Name = "GlobalLibrary"
Rem Common Modules, Avoid Application specific changes
Option Explicit

Public Function CanAccept() As Boolean
Dim f1 As New frmAccept
f1.BackColor = &H80FF80
f1.lblFlag = "Accept ?"
f1.Show vbModal
CanAccept = f1.mBtnYes
Set f1 = Nothing
End Function

Public Function CanReject() As Boolean
Dim f1 As New frmAccept
f1.BackColor = &H80FFFF
f1.lblFlag = "Reject ?"
f1.mDefaultbyEscape = True
f1.Show vbModal
CanReject = f1.mBtnYes
Set f1 = Nothing
End Function

Public Function CanExit() As Boolean
Dim f1 As New frmAccept
f1.BackColor = &HE8FFFF
f1.lblFlag = "Exit ?"
f1.mDefaultbyEscape = True
f1.Show vbModal
CanExit = f1.mBtnYes
Set f1 = Nothing
End Function

Public Function CanDelete() As Boolean
Dim f1 As New frmAccept
f1.BackColor = &H8080FF
f1.lblFlag = "Delete ?"
f1.Show vbModal
CanDelete = f1.mBtnYes
Set f1 = Nothing
End Function

Public Function ExitThisApp() As Boolean
Dim f1 As New frmAccept
f1.BackColor = vbCyan
f1.lblFlag = "Quit ?"
f1.Show vbModal
ExitThisApp = f1.mBtnYes
Set f1 = Nothing
End Function

Public Sub ErrorBox(ByVal mMsg_str As String)
Dim f1 As New frmMsgBox
f1.BackColor = &HC0C0FF
f1.lblFlag = mMsg_str
f1.Show vbModal
Set f1 = Nothing
Rem Call MsgBox(mMsg_str, vbCritical, "Error")

End Sub

Public Sub AlertBox(ByVal mMsg_str As String)
Dim f1 As New frmMsgBox
f1.BackColor = &HC0E0FF
f1.lblFlag = mMsg_str
f1.Show vbModal
Set f1 = Nothing
Rem Call MsgBox(mMsg_str, vbExclamation, "Alert")

End Sub

Public Sub InfoBox(ByVal mMsg_str As String)
Dim f1 As New frmMsgBox
f1.BackColor = &HC0FFC0
f1.lblFlag = mMsg_str
f1.Show vbModal
Set f1 = Nothing
Rem Call MsgBox(mMsg_str, vbInformation, "Information")

End Sub

''Public Function ExitThisForm(ByRef tForm1 As Form) As Boolean
''ExitThisForm = (MsgBox("Do you want to Exit " & tForm1.lblFormHeading & " ?", vbYesNoCancel + vbDefaultButton1 + vbQuestion, "Confirm") = vbYes)
''End Function

Public Function GetNextSeqno(ByRef cnn As ADODB.Connection, ByVal mTableName As String, ByVal mFieldName As String, Optional ByVal mFilterStr As String = "", Optional ByVal mNewSeqno As Long = 1) As Long
Dim rs As ADODB.Recordset

Set rs = cnn.Execute("Select top 1 " & mFieldName & " from " & mTableName & IIf(mFilterStr <> "", " where " & mFilterStr & "", "") & " order by " & mFieldName & " desc")    ''' , , adOpenKeyset, adLockOptimistic
Rem If rs.RecordCount > 0 Then
Rem     rs.MoveLast
Rem End If
If rs.EOF = False Then
    If rs.fields(mFieldName) + 1 >= mNewSeqno Then
        GetNextSeqno = rs.fields(mFieldName) + 1
    Else
        GetNextSeqno = mNewSeqno
    End If
Else
    GetNextSeqno = mNewSeqno
End If
CloseTable rs

End Function

Public Sub CloseTable(ByRef rs As ADODB.Recordset, Optional ByVal mCheckOpen As Boolean)
If mCheckOpen = True Then
    If rs.State = 1 Then
        rs.Close
    End If
Else
    rs.Close
End If
Set rs = Nothing
End Sub

Public Sub CloseDataSource(ByRef db As ADODB.Connection, Optional ByVal mCheckOpen As Boolean)
If mCheckOpen = True Then
    If db.State = 1 Then
        db.BeginTrans
        db.CommitTrans
        db.Close
    End If
Else
    db.BeginTrans
    db.CommitTrans
    db.Close
End If
Set db = Nothing
End Sub

Public Function ExitThisEntry() As Boolean
Dim opt As Integer
opt = MsgBox("Stop Entry ?", vbYesNoCancel + vbDefaultButton1 + vbQuestion, "Confirm")
ExitThisEntry = (opt = vbYes Or opt = vbCancel)
End Function

Public Function SaveThisEntry() As Boolean
SaveThisEntry = (MsgBox("Save Entry ?", vbYesNoCancel + vbDefaultButton1 + vbQuestion, "Confirm") = vbYes)
End Function

Public Function SenseDrAmt(ByVal mAmt As Double) As Double
If mAmt < 0 Then
    SenseDrAmt = Abs(mAmt)
Else
    SenseDrAmt = 0
End If
End Function

Public Function SenseCrAmt(ByVal mAmt As Double) As Double
If mAmt > 0 Then
    SenseCrAmt = mAmt
Else
    SenseCrAmt = 0
End If
End Function

Public Function SenseDrCrFlag(ByVal mAmt As Double) As String
If mAmt < 0 Then
    SenseDrCrFlag = cDR_FLAG
ElseIf mAmt > 0 Then
    SenseDrCrFlag = cCR_FLAG
Else
    SenseDrCrFlag = cNODRCR_FLAG
End If
End Function

Public Function FlexNextSeqno(ByRef Mfgrd As MSFlexGrid, ByVal mColPos As Integer) As Long
Dim srow As Long, mStartRow As Integer, mMaxSeqno As Long
mStartRow = Mfgrd.FixedRows
mMaxSeqno = Val(Mfgrd.TextMatrix(mStartRow, mColPos))

For srow = mStartRow To Mfgrd.Rows - 1
    If Val(Mfgrd.TextMatrix(srow, mColPos)) > mMaxSeqno Then
        mMaxSeqno = Val(Mfgrd.TextMatrix(srow, mColPos))
    End If
Next
mMaxSeqno = mMaxSeqno + 1
FlexNextSeqno = mMaxSeqno
End Function

Public Function FlexColSum(ByRef Mfgrd As MSFlexGrid, ByVal mColPos As Integer, Optional ByRef aCondList, Optional ByVal mTotalOnChangeColNo) As Double
Dim srow As Long, mStartRow As Integer, mColSum As Double, mCondApply As Boolean, mCanSum As Boolean, acount As Integer
Dim mTotalOnChangeColValue As String

mStartRow = Mfgrd.FixedRows
mColSum = 0
mCondApply = (IsMissing(aCondList) = False)
If IsMissing(mTotalOnChangeColNo) = False Then
    mTotalOnChangeColValue = CStr(Mfgrd.TextMatrix(srow, mTotalOnChangeColNo))
End If

For srow = mStartRow To Mfgrd.Rows - 1
    If mCondApply = True Then
        mCanSum = True
        For acount = LBound(aCondList) To UBound(aCondList)
            If CStr(Mfgrd.TextMatrix(srow, aCondList(acount, LBound(aCondList, 2)))) <> CStr(aCondList(acount, UBound(aCondList, 2))) Then
                mCanSum = False
                Exit For
            End If
        Next acount
    ElseIf IsMissing(mTotalOnChangeColNo) = False Then
        mCanSum = True
        If srow = mStartRow Then
            mTotalOnChangeColValue = CStr(Mfgrd.TextMatrix(srow, mTotalOnChangeColNo))
        Else
            If mTotalOnChangeColValue <> CStr(Mfgrd.TextMatrix(srow, mTotalOnChangeColNo)) Then
                mTotalOnChangeColValue = CStr(Mfgrd.TextMatrix(srow, mTotalOnChangeColNo))
            Else
                mCanSum = False
            End If
        End If
    Else
        mCanSum = True
    End If
    If mCanSum = True Then
        mColSum = mColSum + Val(UnMyNumFmt(Mfgrd.TextMatrix(srow, mColPos)))
    End If
Next
FlexColSum = mColSum

End Function

Public Function RecsetColSum(ByRef srs As Recordset, ByVal mCol As Variant, Optional ByVal mDrCr_Flag As String) As Variant
Dim tRecset As ADODB.Recordset, mRtnval As Variant
On Error GoTo errhand:

Set tRecset = srs.ActiveConnection.Execute(srs.Source)
mRtnval = 0
RecsetColSum = mRtnval
With tRecset
If .EOF = False Then
    Do While .EOF = False
        Select Case mDrCr_Flag
        Case cDR_FLAG:
            mRtnval = mRtnval + IIf(.fields(mCol) < 0, Abs(.fields(mCol)), 0)
        Case cCR_FLAG:
            mRtnval = mRtnval + IIf(.fields(mCol) > 0, .fields(mCol), 0)
        Case Else
            mRtnval = mRtnval + .fields(mCol)
        End Select
        
        .MoveNext
    Loop
End If
End With
RecsetColSum = mRtnval
Exit Function

errhand:
ErrorBox Err.Description
If tRecset.State = 1 Then
    CloseTable tRecset
End If
Exit Function

End Function

Public Function Dtoc(ByVal mDate As Date) As String
Dtoc = Format(mDate, cMYDATEFMT)
End Function

Public Function Ctod(ByVal mDate As String) As Date
If mDate = "" Then
    Ctod = cUNKNOWNDATE
Else
    Ctod = DateSerial(Val(Mid(mDate, 7, 4)), Val(Mid(mDate, 4, 2)), Val(Mid(mDate, 1, 2)))
End If
End Function

Public Function ToSysDate(ByVal mDate As Date) As Date
ToSysDate = Format(mDate, cSYSDATEFMT)
End Function

Public Sub FillFlexList(ByRef Mfgrd As MSFlexGrid, ByRef dbDatabase As ADODB.Connection, ByVal mSqlStr As String, Optional ByVal mListType As Byte = 0)
Dim srow As Long, colcnt As Integer, tRecset As ADODB.Recordset

Rem mListType = 0 = Normal
Rem mListType = 1 = Selection List

Mfgrd.Rows = Mfgrd.FixedRows + 1
srow = Mfgrd.FixedRows

Set tRecset = dbDatabase.Execute(mSqlStr)        ''' , , adOpenKeyset, adLockOptimistic
With tRecset
If .EOF = False Then
    .MoveFirst
    Do While .EOF = False
        For colcnt = 0 To Mfgrd.Cols - 1
            Mfgrd.TextMatrix(srow, colcnt) = .fields(colcnt)
        Next
        
        Mfgrd.Rows = Mfgrd.Rows + 1
        srow = srow + 1
    
        .MoveNext
    Loop
Else
    For colcnt = 0 To Mfgrd.Cols - 1
        Mfgrd.TextMatrix(srow, colcnt) = ""
    Next
    
End If
End With
CloseTable tRecset

End Sub

Public Function ToMyDate(ByVal mDate As String) As String
Dim mNewDate As Date, pos As Integer, mChr As String, mDay_str As String, mDay_int As Integer, mMonth_str As String, mMonth_int As Integer, mYear_str As String, mYear_int As Integer, mPosType As Integer
mDate = Trim(mDate)
If mDate = "" Then
    ToMyDate = Dtoc(sDefaultDate)
Else
    mPosType = 0
    For pos = 1 To Len(mDate)
        mChr = Mid(mDate, pos, 1)
        If IsNumeric(mChr) = True Then
            Select Case mPosType
            Case 0:
                mDay_str = mDay_str & mChr
                If Len(mDay_str) >= 2 And IsNumeric(Mid(mDate, pos + 1, 1)) Then
                    mPosType = mPosType + 1
                End If
            Case 1:
                mMonth_str = mMonth_str & mChr
                If Len(mMonth_str) >= 2 And IsNumeric(Mid(mDate, pos + 1, 1)) Then
                    mPosType = mPosType + 1
                End If
            Case 2:
                mYear_str = mYear_str & mChr
                If Len(mYear_str) >= 4 And IsNumeric(Mid(mDate, pos + 1, 1)) Then
                    mPosType = mPosType + 1
                End If
            Case Else
                Exit For
            End Select
        Else
            mPosType = mPosType + 1
        End If
    Next
    If mDay_str = "" Then mDay_str = CStr(Day(sDefaultDate))
    If mMonth_str = "" Then mMonth_str = CStr(Month(sDefaultDate))
    #If APP_HOSPITAL = True Then
        If mYear_str = "" Then
            If Between(DateSerial(Year(sFinYrStartDate), Val(mMonth_str), Val(mDay_str)), sFinYrStartDate, DateSerial(Year(sFinYrStartDate), 12, 31)) = True Then
                mYear_str = CStr(Year(sFinYrStartDate))
            ElseIf Between(DateSerial(Year(sFinYrEndDate), Val(mMonth_str), Val(mDay_str)), DateSerial(Year(sFinYrEndDate), 1, 1), sFinYrEndDate) = True Then
                mYear_str = CStr(Year(sFinYrEndDate))
            Else
                mYear_str = CStr(Year(sDefaultDate))
            End If
        End If
    #Else
        If mYear_str = "" Then mYear_str = CStr(Year(sDefaultDate))
    #End If
    
    mDay_int = CInt(mDay_str)
    mMonth_int = CInt(mMonth_str)
    mYear_int = CInt(mYear_str)
    
    If Between(mDay_int, 1, 31) = False Or Between(mMonth_int, 1, 12) = False Then
        Call AlertBox("Invalid Date")
    End If
    
    mNewDate = DateSerial(mYear_int, mMonth_int, mDay_int)
    
    ToMyDate = Dtoc(mNewDate)
End If

End Function

Public Function Between(ByVal mChkValue As Variant, ByVal mMinValue As Variant, ByVal mMaxValue As Variant) As Boolean
Between = (mChkValue >= mMinValue And mChkValue <= mMaxValue)
End Function

Public Sub SelectText(ByRef mObj As Object)
mObj.SelStart = 0
mObj.SelLength = Len(mObj.Text)
End Sub

Public Function ToDrCrFlag(ByVal mFlag As String) As String
mFlag = UCase(Trim(mFlag))
Select Case mFlag
Case "D", "DR":
    ToDrCrFlag = cDR_FLAG
Case "C", "CR":
    ToDrCrFlag = cCR_FLAG
Case Else
    ToDrCrFlag = cDR_FLAG
End Select
End Function

Public Sub PressTab()
SendKeys "{tab}"
End Sub

Rem receives input as string or number, removes any previous num formating, assigns new num formating
Public Function ToMyNumFmt(ByVal mNumVal As Variant, Optional ByVal mDecimals As Integer = 2, Optional ByVal mUseAbs As Boolean = False, Optional ByVal mGroupedDigit As Boolean = True, Optional mSuppressZero As Boolean = False) As String
Dim mNumStr As String, mFmtStr As String, mPos As Integer, mGrpDigit As Byte, mRStartPos As Integer
''mNumStr = Trim(CStr(mNumVal))
''mNumStr = Replace(mNumStr, ",", "")
''mNumStr = Replace(mNumStr, Chr(32), "")
mNumStr = UnMyNumFmt(CStr(mNumVal))
If mUseAbs = True Then
    If mDecimals >= 0 Then
        mNumStr = CStr(Round(Abs(Val(mNumStr)), mDecimals))
    Else
        mNumStr = CStr(Abs(Val(mNumStr)))
    End If
Else
    If mDecimals >= 0 Then
        mNumStr = CStr(Round(Val(mNumStr), mDecimals))
    Else
        mNumStr = CStr(Val(mNumStr))
    End If
End If
If mDecimals >= 0 Then
    mNumStr = Format(mNumStr, "##############0" & IIf(mDecimals > 0, "." & String(mDecimals, "0"), ""))
'Else
'    mNumStr = Format(mNumStr, "##############0")
End If

mFmtStr = mNumStr
If mGroupedDigit = True Then
    If InStrRev(mNumStr, ".") > 0 Then
        mRStartPos = InStrRev(mNumStr, ".") - 1 - 3
    Else
        mRStartPos = Len(mNumStr) - 3
    End If
    'mRStartPos = Len(mNumStr) - IIf(mDecimals > 0, mDecimals + 1, 0) - 3
    If mRStartPos > 0 Then
        mFmtStr = "," & Mid(mNumStr, mRStartPos + 1)
        For mPos = mRStartPos To 1 Step -1
            mGrpDigit = mGrpDigit + 1
            If mGrpDigit > 2 Then
                mFmtStr = "," & mFmtStr
                mGrpDigit = mGrpDigit - 2
            End If
            mFmtStr = Mid(mNumStr, mPos, 1) & mFmtStr
        Next
    End If
End If
If Left(mFmtStr, 2) = "-," Then
    mFmtStr = Replace(mFmtStr, "-,", "-")
End If
If mSuppressZero = True Then
    If Val(UnMyNumFmt(mFmtStr)) = 0 Then
        mFmtStr = ""
    End If
End If
ToMyNumFmt = mFmtStr
End Function

Rem receives input as string, removes commas,spaces and return it back to calling program as string
Rem num formating other than comma,space will be performed their respective functions
Public Function UnMyNumFmt(ByVal mNumStr As String) As String
Dim mNewStr As String   ', mNewVal As Variant

mNewStr = Trim(CStr(mNumStr))
mNewStr = Replace(mNewStr, ",", "")
mNewStr = Replace(mNewStr, Chr(32), "")

UnMyNumFmt = mNewStr
End Function

Rem receives input as string or number, removes any previous num and percentage formating, assigns new num formating and percentage
Public Function ToMyPerFmt(ByVal mNumVal As Variant, Optional ByVal mDecimals As Integer = 2, Optional ByVal mUseAbs As Boolean = False, Optional ByVal mGroupedDigit As Boolean = True) As String
Dim mFmtStr As String

mFmtStr = UnMyPerFmt(CStr(mNumVal))
mFmtStr = ToMyNumFmt(mNumVal:=mFmtStr, mDecimals:=mDecimals, mUseAbs:=mUseAbs, mGroupedDigit:=mGroupedDigit)
mFmtStr = mFmtStr & " %"

ToMyPerFmt = mFmtStr
End Function

Rem receives input as string, removes commas,spaces,percentage and return it back to calling program as string
Rem num formating other than comma,space,percentage will be performed their respective functions
Public Function UnMyPerFmt(ByVal mNumStr As String) As String
Dim mNewStr As String

mNewStr = UnMyNumFmt(mNumStr:=mNumStr)
mNewStr = Replace(mNewStr, "%", "")

UnMyPerFmt = mNewStr
End Function

Rem matching sorted rows by advance (fast) searching
Public Sub SearchFlex(ByRef MfgrdX As MSFlexGrid, ByVal mColno As Integer, ByVal mTextstr As String)
Dim mStart As Long, mMid As Long, mEnd As Long, mFlexstr As String, mMatchRow As Long

mMatchRow = MfgrdX.Rows - 1
mTextstr = UCase(Trim(mTextstr))
mStart = MfgrdX.FixedRows
Rem handling last row if used for new record which is blank causing search problem
'If MfgrdX.Rows > MfgrdX.FixedRows + 1 Then
'    If MfgrdX.TextMatrix(MfgrdX.Rows - 1, mColno) = "" Then
'        mEnd = MfgrdX.Rows - 2
'    Else
'        mEnd = MfgrdX.Rows - 1
'    End If
'Else
    mEnd = MfgrdX.Rows - 1
'End If
Rem mTotRows = MfgrdX.Rows - MfgrdX.FixedRows - 1
Rem srow = UInt(mTotRows / 2)
mMid = mStart + Int((mEnd - mStart) / 2)    ' mStart + UInt((mEnd - mStart) / 2)
Rem mStartRow = 1
If mTextstr <> "" Then
    Rem Do While mTotRows > 0
    Do While mMid <> mStart Or mMid <> mEnd
        Rem mFlexstr = UCase(Trim(MfgrdX.TextMatrix(srow, mColno)))
        mFlexstr = UCase(Trim(MfgrdX.TextMatrix(mMid, mColno)))
        Rem mTotRows = UInt(mTotRows / 2)
        Rem If mTextstr > mFlexstr Then
        If StrComp(mTextstr, mFlexstr, vbTextCompare) = 1 Then
            Rem mStartRow = srow
            mStart = mMid
            mEnd = mEnd ' will remain same
            Rem If mTotRows > 0 Then
            Rem     srow = mStartRow + UInt(mTotRows / 2)
            Rem End If
        Else
            mStart = mStart ' will remain same
            mEnd = mMid ' will remain same
            Rem If mTotRows > 0 Then
            Rem     srow = UInt(mTotRows / 2)
            Rem End If
        End If
        mMid = mStart + Int((mEnd - mStart) / 2)    ' mMid = mStart + UInt((mEnd - mStart) / 2)
        If mMid = mStart Or mMid = mEnd Then
            mFlexstr = UCase(Trim(MfgrdX.TextMatrix(mStart, mColno)))
            Rem If mTextstr = mFlexstr Then
            If StrComp(mTextstr, mFlexstr, vbTextCompare) = 0 Then
                mMatchRow = mStart
            Else
                mFlexstr = UCase(Trim(MfgrdX.TextMatrix(mEnd, mColno)))
                Rem If mTextstr = mFlexstr Then
                If StrComp(mTextstr, mFlexstr, vbTextCompare) = 0 Then
                    mMatchRow = mEnd
                Else
                    mFlexstr = UCase(Trim(MfgrdX.TextMatrix(mStart, mColno)))
                    Rem If mTextstr = Left(mFlexstr, Len(mTextstr)) Then
                    If StrComp(mTextstr, Left(mFlexstr, Len(mTextstr)), vbTextCompare) = 0 Then
                        mMatchRow = mStart
                    Else
                        mFlexstr = UCase(Trim(MfgrdX.TextMatrix(mEnd, mColno)))
                        Rem If mTextstr = Left(mFlexstr, Len(mTextstr)) Then
                        If StrComp(mTextstr, Left(mFlexstr, Len(mTextstr)), vbTextCompare) = 0 Then
                            mMatchRow = mEnd
                        Else
                            mMatchRow = MfgrdX.Rows - 1
                        End If
                    End If
                End If
            End If
            Exit Do
        End If
        Rem If mTotRows <= 1 Then
        Rem     Exit Do
        Rem End If
    Loop
Else
    Rem mMatchRow = MfgrdX.FixedRows    02-11-2013
    mMatchRow = MfgrdX.Rows - 1
End If
MfgrdX.Row = mMatchRow

End Sub

Rem matching first row by row (time consuming search)
Public Sub SearchRawFlex(ByRef MfgrdX As MSFlexGrid, ByVal mColno As Integer, ByVal mTextstr As String, Optional ByVal mDefStartRow As Long = 1, Optional ByVal mDefSearchMatchOpt As Integer = cSEARCH_COMPLETESTR)
Dim srow As Long, mStart As Long, mEnd As Long, mFlexstr As String, mMatchRow As Long

mStart = mDefStartRow  '''    MfgrdX.FixedRows
mEnd = MfgrdX.Rows - 1
mMatchRow = MfgrdX.Rows - 1 ' in case programmer missed assignment, then end row of flex
mTextstr = UCase(Trim(mTextstr))

If mTextstr <> "" Then
    For srow = mStart To mEnd
        Rem If mTextstr = mFlexstr Then
        If mDefSearchMatchOpt = cSEARCH_COMPLETESTR Then
            mFlexstr = Left(UCase(Trim(MfgrdX.TextMatrix(srow, mColno))), Len(mTextstr))
            If StrComp(mTextstr, mFlexstr, vbTextCompare) = 0 Then
                mMatchRow = srow
                Exit For
            End If
        ElseIf mDefSearchMatchOpt = cSEARCH_MIDSTR Then
            mFlexstr = UCase(Trim(MfgrdX.TextMatrix(srow, mColno)))
            If InStr(1, mFlexstr, mTextstr, vbTextCompare) > 0 Then
                mMatchRow = srow
                Exit For
            End If
        Else
            ErrorBox "SearchRawFlex_#581_[Undefined Search Match Option]"
            Exit For
        End If
    Next srow
Else
    mMatchRow = mEnd
End If
MfgrdX.Row = mMatchRow

End Sub

Public Function UInt(ByVal mNum As Double) As Long
If mNum > Int(mNum) Then
    UInt = Int(mNum) + 1
Else
    UInt = Int(mNum)
End If
End Function

Public Function InterActiveChange(ByRef mActiveControl As Object) As Boolean
InterActiveChange = (mActiveControl.Parent.Visible = True And mActiveControl.Container.Visible = True And Screen.ActiveForm.Name = mActiveControl.Parent.Name And Screen.ActiveControl.Name = mActiveControl.Name)
End Function

Public Function ProgrammaticChange(ByRef mActiveControl As Object) As Boolean
ProgrammaticChange = Not (mActiveControl.Parent.Visible = True And mActiveControl.Container.Visible = True And Screen.ActiveForm.Name = mActiveControl.Parent.Name And Screen.ActiveControl.Name = mActiveControl.Name)
End Function

Public Function InterActiveMode(ByRef mActiveForm As Form) As Boolean
InterActiveMode = (mActiveForm.Visible = True And Screen.ActiveForm.Name = mActiveForm.Name)
End Function

Public Function ProgrammaticMode(ByRef mActiveForm As Form) As Boolean
ProgrammaticMode = Not (mActiveForm.Visible = True And Screen.ActiveForm.Name = mActiveForm.Name)
End Function

Public Function ChkIsDuplicate(ByRef mConn As ADODB.Connection, ByVal mTableName As String, ByVal mChkField As Variant, ByVal mChkValue As Variant, ByVal mKeyField As Variant, ByVal mKeyValue As Variant, Optional ByVal mFailDefault As Boolean = True) As Boolean
Dim tRecset As ADODB.Recordset, mChkType As Long, mKeyType As Long, mRtnval As Boolean
On Error GoTo errhand
mChkType = VarType(mChkValue)
mKeyType = VarType(mKeyValue)

If mChkType = vbDate Then
    Set tRecset = mConn.Execute("Select * from " & mTableName & " where " _
        & mChkField & "=" & IIf(mChkType = vbString, "'", IIf(mChkType = vbDate, "#", "")) & IIf(mChkType = vbDate, CStr(ToSysDate(CDate(mChkValue))), CStr(mChkValue)) & IIf(mChkType = vbString, "'", IIf(mChkType = vbDate, "#", "")) _
        & " AND " & mKeyField & "<>" & IIf(mKeyType = vbString, "'", IIf(mKeyType = vbDate, "#", "")) & IIf(mKeyType = vbDate, CStr(ToSysDate(CDate(mKeyValue))), CStr(mKeyValue)) & IIf(mKeyType = vbString, "'", IIf(mKeyType = vbDate, "#", "")) _
        & "")   ''' , mConn, adOpenKeyset, adLockOptimistic
Else
    Rem important date handling is to handled in above case not here is pending
    Set tRecset = mConn.Execute("Select * from " & mTableName & " where " _
        & mChkField & "=" & IIf(mChkType = vbString, "'", IIf(mChkType = vbDate, "#", "")) & IIf(mChkType = vbDate, CStr(mChkValue), CStr(mChkValue)) & IIf(mChkType = vbString, "'", IIf(mChkType = vbDate, "#", "")) _
        & " AND " & mKeyField & "<>" & IIf(mKeyType = vbString, "'", IIf(mKeyType = vbDate, "#", "")) & IIf(mKeyType = vbDate, CStr(mKeyValue), CStr(mKeyValue)) & IIf(mKeyType = vbString, "'", IIf(mKeyType = vbDate, "#", "")) _
        & "")   ''' , , adOpenKeyset, adLockOptimistic
End If
mRtnval = (tRecset.EOF = False) ''' .RecordCount > 0

CloseTable tRecset
ChkIsDuplicate = mRtnval
Exit Function

errhand:
MsgBox Err.Description
If Not tRecset Is Nothing Then
    CloseTable tRecset
End If
ChkIsDuplicate = mFailDefault
Exit Function

End Function

Public Function InList(ByVal mChkValue As Variant, ByVal mChkList As Variant, Optional ByVal mFailDefault As Boolean = False) As Boolean
Dim mCount As Integer, mTot As Integer, mRtnval As Boolean

On Error GoTo errhand
mRtnval = False
mTot = UBound(mChkList)
For mCount = LBound(mChkList) To UBound(mChkList)
    If mChkValue = mChkList(mCount) Then
        mRtnval = True
        Exit For
    End If
Next mCount
InList = mRtnval
Exit Function

errhand:
MsgBox Err.Description
InList = mFailDefault
Exit Function

End Function

Public Sub SetVoidControl(ByRef mCntl As Object)
mCntl.BackColor = mCntl.Container.BackColor
mCntl.ForeColor = mCntl.Container.ForeColor
mCntl.TabStop = False
mCntl.Text = ""
mCntl.Appearance = 0
mCntl.BorderStyle = 0
End Sub

Public Function ChkEditRecStatus(ByVal mOldRecState As Integer) As Integer
Dim mRtnval As Integer

mRtnval = mOldRecState
Select Case mOldRecState
Case cREC_NEW:
    mRtnval = cREC_ADDED
Case cREC_UNCHANGED:
    mRtnval = cREC_EDITED
Case Else
    mRtnval = mOldRecState
End Select
ChkEditRecStatus = mRtnval
End Function

Public Function ChkDeleteRecStatus(ByVal mOldRecState As Integer) As Integer
Dim mRtnval As Integer

mRtnval = mOldRecState
Select Case mOldRecState
Case cREC_ADDED:
    mRtnval = cREC_CANCELED
Case cREC_EDITED, cREC_UNCHANGED:
    mRtnval = cREC_DELETED
Case Else
    mRtnval = mOldRecState
End Select
ChkDeleteRecStatus = mRtnval
End Function

Rem receives value as string or numeric, removes any pre-accounting formating, applies new formating
Public Function ToMyAcFmt(ByVal mNumVar As Variant, Optional ByVal mDecimals As Integer = 2, Optional ByVal mDefaultFlag = cNODRCR_FLAG) As String
Dim mNumVal As Double, mRtnval As String
mNumVal = Val(UnMyAcFmt(CStr(mNumVar)))
mRtnval = ToMyNumFmt(mNumVar, mDecimals, True)
If mNumVal > 0 Then
    mRtnval = mRtnval & Space(1) & cCR_FLAG
ElseIf mNumVal < 0 Then
    mRtnval = mRtnval & Space(1) & cDR_FLAG
Else
    mRtnval = mRtnval & Space(1) & cNODRCR_FLAG
End If
ToMyAcFmt = mRtnval
End Function

Rem removes any numeric formating such as comma,space and removes accounting formating i.e. eight two character dr or cr
Rem mDrCrFlag is used in case flag is seperate from string amount
Public Function UnMyAcFmt(ByVal mNumStr As String, Optional ByVal mDrCrFlag As String) As String
Dim mRtnval As Variant, mNewStr As String

mNumStr = mNumStr & mDrCrFlag
mNewStr = UnMyNumFmt(mNumStr)

If UCase(Right(mNewStr, Len(cDR_FLAG))) = UCase(cDR_FLAG) Then
    mRtnval = Val(Replace(mNewStr, cDR_FLAG, "")) * -1
ElseIf UCase(Right(mNewStr, Len(cCR_FLAG))) = UCase(cCR_FLAG) Then
    mRtnval = Val(Replace(mNewStr, cCR_FLAG, ""))
Else
    mRtnval = Val(mNewStr)
End If

UnMyAcFmt = CStr(mRtnval)
End Function

Public Function SenseRcptQty(ByVal mQty As Double) As Double
If mQty > 0 Then
    SenseRcptQty = mQty
Else
    SenseRcptQty = 0
End If
End Function

Public Function SenseIssueQty(ByVal mQty As Double) As Double
If mQty < 0 Then
    SenseIssueQty = Abs(mQty)
Else
    SenseIssueQty = 0
End If
End Function

Public Function SenseIsRcFlag(ByVal mQty As Double) As String
If mQty > 0 Then
    SenseIsRcFlag = cRCPT_FLAG
ElseIf mQty < 0 Then
    SenseIsRcFlag = cISSUE_FLAG
Else
    SenseIsRcFlag = cNOISRC_FLAG
End If
End Function

Public Function ToIsRcFlag(ByVal mFlag As String) As String
mFlag = UCase(Trim(mFlag))
Select Case mFlag
Case "R", "RC":
    ToIsRcFlag = cRCPT_FLAG
Case "I", "IS":
    ToIsRcFlag = cISSUE_FLAG
Case Else
    ToIsRcFlag = cRCPT_FLAG
End Select
End Function

Public Sub MoveRecToBOF(ByRef rs As ADODB.Recordset)
If rs.EOF = False Or rs.BOF = False Then
    rs.MoveFirst
    rs.MovePrevious
End If
End Sub

Public Sub MoveRecToFirst(ByRef rs As ADODB.Recordset)
If rs.EOF = False Or rs.BOF = False Then
    rs.MoveFirst
End If
End Sub

Public Sub MoveRecToLast(ByRef rs As ADODB.Recordset)
If rs.EOF = False Or rs.BOF = False Then
    rs.MoveLast
End If
End Sub

Public Sub MoveRecToEOF(ByRef rs As ADODB.Recordset)
If rs.EOF = False Or rs.BOF = False Then
    rs.MoveLast
    rs.MoveNext
End If
End Sub

Public Sub MoveRecToNext(ByRef rs As ADODB.Recordset)
If rs.EOF = False Or rs.BOF = False Then
    rs.MoveNext
End If
End Sub

Public Sub MoveRecToPrevious(ByRef rs As ADODB.Recordset)
If rs.EOF = False Or rs.BOF = False Then
    rs.MovePrevious
End If
End Sub

Public Function IsValidRec(ByRef rs As ADODB.Recordset) As Boolean
IsValidRec = (rs.EOF = False And rs.BOF = False)
End Function

Public Function ToRcptQty(ByVal mQty As Double) As Double
ToRcptQty = Abs(mQty)
End Function

Public Function ToIssueQty(ByVal mQty As Double) As Double
ToIssueQty = Abs(mQty) * -1
End Function

Public Sub FlashActiveControl(ByRef ActiveCtl As Object, ByVal mActivated As Boolean, Optional ByVal mSkipSelection As Boolean = False)
If mActivated = True Then
    ActiveCtl.BackColor = cYELLOWLIGHT '  RGB(250, 250, 150)
    If TypeOf ActiveCtl Is TextBox Then
        If mSkipSelection = False Then
            SelectText ActiveCtl
        End If
    End If
Else
    ActiveCtl.BackColor = vbWindowBackground
End If
End Sub

Public Function ALen(ByRef ary As Variant, Optional ByVal opt As Integer = 1) As Long
ALen = (UBound(ary, opt) + 1) - LBound(ary, opt)
End Function

Public Function NextEmptyArray(ByRef ary As Variant, Optional ByVal opt As Integer = 1) As Long
Dim acount As Long, mAryLen As Long
mAryLen = ALen(ary, opt)
acount = LBound(ary, opt)
For acount = LBound(ary, opt) To UBound(ary, opt)
    If VarType(ary(acount, opt)) = vbEmpty Then
        Exit For
    End If
Next acount
NextEmptyArray = acount

End Function

Rem Single dimension array search
Public Function AScan(ByRef ary As Variant, ByVal mSearchValue As Variant, Optional mMatchCase As Boolean = False) As Long
Dim acount As Long, mRtnval As Variant, mLow As Long, mHigh As Long
mLow = LBound(ary)
mHigh = UBound(ary)
mMatchCase = (mMatchCase = True And VarType(mSearchValue) = vbString)
If mMatchCase = False Then
    mSearchValue = UCase(mSearchValue)
End If
For acount = mLow To mHigh
    If mMatchCase = False Then
        If UCase(ary(acount)) = mSearchValue Then
            mRtnval = acount
            Exit For
        End If
    Else
        If ary(acount) = mSearchValue Then
            mRtnval = acount
            Exit For
        End If
    End If
Next acount
If VarType(mRtnval) = vbEmpty Then
    AScan = LBound(ary) - 1
Else
    AScan = mRtnval
End If
End Function

Rem receives value as string or numeric, removes any pre-num formating, applies new num formating
Public Function ToMyStqFmt(ByVal mNumVar As Variant, Optional ByVal mDecimals As Integer = 2) As String
Dim mNumVal As Double, mRtnval As String

mNumVal = Val(UnMyStqFmt(CStr(mNumVar)))
mRtnval = ToMyNumFmt(mNumVar, mDecimals, True)
If mNumVal > 0 Then
    mRtnval = mRtnval & Space(1) & cRCPT_FLAG
ElseIf mNumVal < 0 Then
    mRtnval = mRtnval & Space(1) & cISSUE_FLAG
Else
    mRtnval = mRtnval & Space(1) & cNOISRC_FLAG
End If
ToMyStqFmt = mRtnval
End Function

Rem receives value as strnig, removes any num formating, removes any issue/receipt (stock qty format), and returns the string
Public Function UnMyStqFmt(ByVal mNumStr As String) As String
Dim mRtnval As Variant, mNewStr As String

mNewStr = UnMyNumFmt(mNumStr)

If UCase(Right(mNewStr, Len(cISSUE_FLAG))) = UCase(cISSUE_FLAG) Then
    mRtnval = Val(Replace(mNewStr, cISSUE_FLAG, "")) * -1
ElseIf UCase(Right(mNewStr, Len(cRCPT_FLAG))) = UCase(cRCPT_FLAG) Then
    mRtnval = Abs(Val(Replace(mNewStr, cRCPT_FLAG, "")))
Else
    mRtnval = Val(mNewStr)
End If

UnMyStqFmt = CStr(mRtnval)
End Function

Rem receives value as string or numeric, removes previous formating, applies new formating
Public Function ToMyStvFmt(ByVal mNumVar As Variant, Optional ByVal mDecimals As Integer = 2) As String
Dim mNumVal As Double, mRtnval As String

mNumVal = Val(UnMyStvFmt(CStr(mNumVar)))
mRtnval = ToMyNumFmt(mNumVar, mDecimals, True)
If mNumVal > 0 Then
    mRtnval = mRtnval & Space(1) & cDR_FLAG
ElseIf mNumVal < 0 Then
    mRtnval = mRtnval & Space(1) & cCR_FLAG
Else
    mRtnval = mRtnval & Space(1) & cNODRCR_FLAG
End If
ToMyStvFmt = mRtnval
End Function

Public Function UnMyStvFmt(ByVal mNumStr As String) As String
Dim mRtnval As Variant, mNewStr As String

mNewStr = UnMyNumFmt(mNumStr)

If UCase(Right(mNewStr, Len(cCR_FLAG))) = UCase(cCR_FLAG) Then
    mRtnval = Val(Replace(mNewStr, cCR_FLAG, "")) * -1
ElseIf UCase(Right(mNewStr, Len(cDR_FLAG))) = UCase(cDR_FLAG) Then
    mRtnval = Val(Replace(mNewStr, cDR_FLAG, ""))
Else
    mRtnval = Val(mNewStr)
End If

UnMyStvFmt = CStr(mRtnval)
End Function

Public Function MonthStartDate(ByVal mDate As Date) As Date
MonthStartDate = DateSerial(Year(mDate), Month(mDate), 1)
End Function

Public Function MonthEndDate(ByVal mDate As Date) As Date
Dim mRtnval As Date
mRtnval = DateAdd("M", 1, mDate)
mRtnval = DateSerial(Year(mRtnval), Month(mRtnval), 1)
mRtnval = mRtnval - 1
MonthEndDate = mRtnval
End Function

Public Function RecsetMColSum(ByRef srs As Recordset, ByRef aColRef As Variant) As Variant
Dim tRecset As ADODB.Recordset
Dim mRowCnt As Integer, mCol As String, mSprtr_Flag As String
On Error GoTo errhand:

Rem aColRef Array col definition
Rem first - col name
Rem second - drcrflag
Rem third - col sum

Set tRecset = srs.ActiveConnection.Execute(srs.Source)
With tRecset
If .EOF = False Then
    Do While .EOF = False
        For mRowCnt = LBound(aColRef, 1) To UBound(aColRef, 1)
            mCol = aColRef(mRowCnt, 0)
            mSprtr_Flag = aColRef(mRowCnt, 1)
            
            Select Case mSprtr_Flag
            Case cDR_FLAG:
                aColRef(mRowCnt, 2) = aColRef(mRowCnt, 2) + IIf(.fields(mCol) < 0, .fields(mCol), 0)
            Case cCR_FLAG:
                aColRef(mRowCnt, 2) = aColRef(mRowCnt, 2) + IIf(.fields(mCol) > 0, .fields(mCol), 0)
            Case cRCPT_FLAG:
                aColRef(mRowCnt, 2) = aColRef(mRowCnt, 2) + IIf(.fields(mCol) > 0, .fields(mCol), 0)
            Case cISSUE_FLAG:
                aColRef(mRowCnt, 2) = aColRef(mRowCnt, 2) + IIf(.fields(mCol) < 0, .fields(mCol), 0)
            Case Else
                aColRef(mRowCnt, 2) = aColRef(mRowCnt, 2) + .fields(mCol)
            End Select
        Next mRowCnt
        .MoveNext
    Loop
End If
End With
CloseTable tRecset
Exit Function

errhand:
ErrorBox Err.Description
If Not tRecset Is Nothing Then
    CloseTable tRecset
End If
Exit Function

End Function

Public Sub AddToArray(ByRef ary As Variant, ByVal mValue As Variant)
ReDim Preserve ary(UBound(ary) + 1)
ary(UBound(ary)) = mValue

End Sub

Public Sub RemoveNullValue(ByRef rs As ADODB.Recordset)
Dim fld As ADODB.Field

With rs
If .RecordCount > 0 Then
    .MoveFirst
    Do While .EOF = False
        For Each fld In .fields
            If IsNull(fld.Value) = True Then
                Select Case fld.Type
                Case adInteger, adSmallInt, adDouble, adSingle
                    fld.Value = 0
                Case adVarWChar
                    fld.Value = "" & ""
                Case adDate
                    fld.Value = cUNKNOWNDATE
                Case Else
                    ErrorBox "Undefined Data Type " & adTypeName(fld.Type) & " !!!"
                End Select
            End If
        Next fld
        .Update
        
        .MoveNext
    Loop
End If
End With

End Sub

Public Function NoneZero1(ByVal mValue As Variant, ByVal mValueIfNull As Variant) As Variant
NoneZero1 = IIf(IsNull(mValue) = True, mValueIfNull, mValue)
End Function

Public Function FlexColsWidth(ByRef Mfgrd1 As MSFlexGrid) As Double
Dim mColCount As Integer, mRtnval As Double
With Mfgrd1
For mColCount = 0 To .Cols - 1
    mRtnval = mRtnval + .ColWidth(mColCount)
Next mColCount
End With
FlexColsWidth = mRtnval

End Function

Public Function FlexLeftVisibleCol(ByRef Mfgrd1 As MSFlexGrid) As Integer
Dim mColCount As Integer, mRtnval As Integer
mRtnval = 0
With Mfgrd1
For mColCount = 0 To .Cols - 1
    If .ColWidth(mColCount) > 0 Then
        mRtnval = mColCount
        Exit For
    End If
Next mColCount
End With
FlexLeftVisibleCol = mRtnval

End Function

Public Function AddBS(ByVal mPath As String) As String
AddBS = mPath & IIf(Right(mPath, 1) = "\" Or mPath = "", "", "\")
End Function

Public Function adTypeName(ByVal mType As Long) As String
Dim mRtnval As String
mRtnval = ""
Select Case mType
Case adVarWChar
    mRtnval = "adVarWChar"
Case adSmallInt
    mRtnval = "adSmallInt"
Case adInteger
    mRtnval = "adInteger"
Case adDouble
    mRtnval = "adDouble"
Case adSingle
    mRtnval = "adSingle"
Case adDate
    mRtnval = "adDate"
Case Else
    mRtnval = "Unknown(" & CStr(mType) & ")"
End Select
adTypeName = mRtnval

End Function

Public Function TextAlignFromFlex(ByVal mFlexAlign As Integer)
Dim mRtnval As Integer
mRtnval = 0
Select Case mFlexAlign
Case flexAlignRightTop, 7, flexAlignRightBottom
    mRtnval = 1
Case flexAlignCenterTop, flexAlignCenterCenter, flexAlignCenterBottom
    mRtnval = 2
Case Else
    mRtnval = 0
End Select
TextAlignFromFlex = mRtnval

End Function

Public Function ToMyString(ByVal mStr As String) As String
Dim mRtnval As String

mRtnval = mStr
mRtnval = Replace(mRtnval, "'", "_")
Rem mRtnval = Replace(mRtnval, "*", "_")    ''' dated 06-07-2013
ToMyString = mRtnval

End Function

Public Function ToMyWord(ByVal mStr As String, Optional mFilterStr As Boolean = True) As String
Dim mRtnval As String

If mFilterStr = True Then
    mRtnval = ToMyString(mStr)
Else
    mRtnval = mStr
End If
If UCase(mRtnval) <> mRtnval Then
    mRtnval = Replace(mRtnval, ".", vbCr & "." & vbCr)
    mRtnval = Replace(mRtnval, ",", vbCr & "," & vbCr)
    mRtnval = Replace(mRtnval, "/", vbCr & "/" & vbCr)
    mRtnval = Replace(mRtnval, "\", vbCr & "\" & vbCr)
    mRtnval = Replace(mRtnval, "(", vbCr & "(" & vbCr)
    mRtnval = Replace(mRtnval, ")", vbCr & ")" & vbCr)
    mRtnval = Replace(mRtnval, "-", vbCr & "-" & vbCr)
    mRtnval = StrConv(mRtnval, vbProperCase)
    mRtnval = Replace(mRtnval, vbCr & "." & vbCr, ".")
    mRtnval = Replace(mRtnval, vbCr & "," & vbCr, ",")
    mRtnval = Replace(mRtnval, vbCr & "/" & vbCr, "/")
    mRtnval = Replace(mRtnval, vbCr & "\" & vbCr, "\")
    mRtnval = Replace(mRtnval, vbCr & "(" & vbCr, "(")
    mRtnval = Replace(mRtnval, vbCr & ")" & vbCr, ")")
    mRtnval = Replace(mRtnval, vbCr & "-" & vbCr, "-")
End If
ToMyWord = mRtnval

End Function

Public Function RefreshDatabase(ByVal db As ADODB.Connection)
Dim mJro As New JRO.JetEngine
mJro.RefreshCache db
Set mJro = Nothing

End Function

Public Function ClearFlexRow(ByRef MfgrdX As MSFlexGrid, ByVal srow As Long)
Dim cnt As Integer
For cnt = 0 To MfgrdX.Cols - 1
    MfgrdX.TextMatrix(srow, cnt) = ""
Next cnt

End Function

Public Function FlexHeadingRow(ByRef MfgrdX As MSFlexGrid) As Long
FlexHeadingRow = (MfgrdX.FixedRows - 1)

End Function

Public Function FlexDetailTopRow(ByRef MfgrdX As MSFlexGrid) As Long
FlexDetailTopRow = (MfgrdX.FixedRows)

End Function

Public Function FlexNewRow(ByRef MfgrdX As MSFlexGrid) As Long
FlexNewRow = (MfgrdX.Rows - 1)

End Function

Public Function IsFlexNewRow(ByRef MfgrdX As MSFlexGrid, ByVal srow As Long) As Boolean
IsFlexNewRow = (srow = MfgrdX.Rows - 1)

End Function


Public Sub RemoveFlexRow(ByRef MfgrdX As MSFlexGrid, ByVal srow As Long)
Dim mRowCnt As Long, mColCnt As Integer
For mRowCnt = srow To MfgrdX.Rows - 2   ' upto second last row
    For mColCnt = 0 To MfgrdX.Cols - 1
        MfgrdX.TextMatrix(mRowCnt, mColCnt) = MfgrdX.TextMatrix(mRowCnt + 1, mColCnt)
    Next mColCnt
Next mRowCnt
MfgrdX.Rows = MfgrdX.Rows - 1

End Sub

Public Function MinToTime(ByVal mMinInt As Long) As String
Dim mRtnval As String, mHourInt As Long, mHourStr As String, mMinuteStr As String
Rem hour
mHourInt = Int(Abs(mMinInt) / 60)
mHourStr = CStr(mHourInt)
mHourStr = IIf(Len(mHourStr) = 1, "0" & mHourStr, mHourStr)
Rem minute
mMinuteStr = CStr(Abs(mMinInt) - (mHourInt * 60))
mMinuteStr = IIf(Len(mMinuteStr) = 1, "0" & mMinuteStr, mMinuteStr)

mRtnval = IIf(mMinInt < 0, "-", "") & mHourStr & ":" & mMinuteStr
MinToTime = mRtnval

End Function

Public Function SecToTime(ByVal mSecInt As Long) As String
Dim mRtnval As String, mHourInt As Long, mMinuteInt As Long, mHourStr As String, mMinuteStr As String, mSecondStr As String

Rem hour
mHourInt = Int(Int(Abs(mSecInt) / 60) / 60)
mHourStr = CStr(mHourInt)
mHourStr = IIf(Len(mHourStr) = 1, "0" & mHourStr, mHourStr)
Rem minute
mMinuteInt = Int(Abs(mSecInt) / 60) - (mHourInt * 60)
mMinuteStr = CStr(mMinuteInt)
mMinuteStr = IIf(Len(mMinuteStr) = 1, "0" & mMinuteStr, mMinuteStr)
Rem second
mSecondStr = CStr(Abs(mSecInt) - (mMinuteInt * 60) - (mHourInt * 60 * 60))
mSecondStr = IIf(Len(mSecondStr) = 1, "0" & mSecondStr, mSecondStr)

mRtnval = IIf(mSecInt < 0, "-", "") & mHourStr & ":" & mMinuteStr & ":" & mSecondStr
SecToTime = mRtnval

End Function

Public Function TimeToMin(ByVal mTimeStr As String) As Long
Dim mRtnval As Long, mHourInt As Long, mMinuteInt As Long, mHourStr As String, mMinuteStr As String, mSprtr As String
mTimeStr = Trim(mTimeStr)
If InStr(mTimeStr, ":") > 0 Then
    mSprtr = ":"
ElseIf InStr(mTimeStr, ".") > 0 Then
    mSprtr = "."
Else
    mSprtr = ""
End If
If mSprtr <> "" Then
    mHourStr = GetMidPosStr(mTimeStr, 1, mSprtr)
    mHourInt = Val(mHourStr)
    
    mMinuteStr = GetMidPosStr(mTimeStr, 2, mSprtr)
    mMinuteInt = Val(mMinuteStr)
Else
    mHourStr = Mid(mTimeStr, 1, 2)
    mHourInt = Val(mHourStr)
    mMinuteStr = Mid(mTimeStr, 3)
    mMinuteInt = Val(mMinuteStr)
End If
mRtnval = ((mHourInt * 60) + mMinuteInt) * IIf(Left(mTimeStr, 1) = "-" And mHourInt = 0, -1, 1)
TimeToMin = mRtnval

End Function

Public Function TimeToSec(ByVal mTimeStr As String) As Long
Dim mRtnval As Long, mHourInt As Long, mMinuteInt As Long, mSecondInt As Long, mHourStr As String, mMinuteStr As String, mSecondStr As String, mSprtr As String
mTimeStr = Trim(mTimeStr)
If InStr(mTimeStr, ":") > 0 Then
    mSprtr = ":"
ElseIf InStr(mTimeStr, ".") > 0 Then
    mSprtr = "."
Else
    mSprtr = ""
End If
If mSprtr <> "" Then
    mHourStr = GetMidPosStr(mTimeStr, 1, mSprtr)
    mHourInt = Val(mHourStr)
    
    mMinuteStr = GetMidPosStr(mTimeStr, 2, mSprtr)
    mMinuteInt = Val(mMinuteStr)
    
    mSecondStr = GetMidPosStr(mTimeStr, 3, mSprtr)
    mSecondInt = Val(mSecondStr)
Else
    mHourStr = Mid(mTimeStr, 1, 2)
    mHourInt = Val(mHourStr)
    
    mMinuteStr = Mid(mTimeStr, 3, 2)
    mMinuteInt = Val(mMinuteStr)
    
    mSecondStr = Mid(mTimeStr, 5)
    mSecondInt = Val(mSecondStr)
End If
mRtnval = ((mHourInt * 60 * 60) + (mMinuteInt * 60) + mSecondInt) * IIf(Left(mTimeStr, 1) = "-" And mHourInt = 0, -1, 1)
TimeToSec = mRtnval

End Function

Public Function GetMidPosStr(ByVal mStrList As String, ByVal mPos As Integer, mSprtr As String) As String
Dim mRtnval As String, mLen As Integer, mCount As Integer, mCurPos As Integer, mCurChr As String

mLen = Len(mStrList)
mCurPos = 1
mRtnval = ""
For mCount = 1 To mLen
    mCurChr = Mid(mStrList, mCount, 1)
    If mCurChr = mSprtr Then
        mCurPos = mCurPos + 1
        If mCurPos > mPos Then
            Exit For
        Else
            mRtnval = ""
        End If
    Else
        If mCurPos = mPos Then
            mRtnval = mRtnval + mCurChr
        End If
    End If
    If mCurPos > mPos Then
        Exit For
    End If
Next mCount
GetMidPosStr = mRtnval

End Function

Public Function GetMidStrPos(ByVal mStrList As String, ByVal mSearchStr As String, mSprtr As String) As String
Dim mRtnval As Integer, mCurPosStr As String, mLen As Integer, mCount As Integer, mCurStrPos As Integer, mCurChr As String

mLen = Len(mStrList)
mCurStrPos = 1
mCurPosStr = ""
mRtnval = 0
For mCount = 1 To mLen
    mCurChr = Mid(mStrList, mCount, 1)
    If mCurChr = mSprtr Then
        If mCurPosStr = mSearchStr Then
            mRtnval = mCurStrPos
            Exit For
        Else
            mCurStrPos = mCurStrPos + 1
            mCurPosStr = ""
        End If
    Else
        mCurPosStr = mCurPosStr + mCurChr
    End If
    If mCount >= mLen Then
        If mCurPosStr = mSearchStr Then
            mRtnval = mCurStrPos
            Exit For
        End If
    End If
Next mCount
GetMidStrPos = mRtnval

End Function

Public Function MyDivide(ByVal mVal1 As Variant, ByVal mVal2 As Variant) As Variant
If mVal2 <> 0 Then
    MyDivide = mVal1 / mVal2
Else
    MyDivide = 0
End If
End Function

Public Sub SetFormSize(ByRef mTargetForm As Form, mMainForm As Form)
mTargetForm.Height = mMainForm.Height - (mMainForm.Height * 0.005)
mTargetForm.Width = mMainForm.Width - (mMainForm.Width * 0.005)

End Sub

Rem in case current row is not visible in flex grid
Public Sub ShowActiveFlexRow(ByRef Mfgrd0 As MSFlexGrid)
Dim srow As Long

srow = Mfgrd0.Row
If Mfgrd0.Rows > Mfgrd0.FixedRows + 1 Then
    If Mfgrd0.RowIsVisible(srow) = False Then
        If srow > Mfgrd0.TopRow Then
            Mfgrd0.TopRow = srow - Int(Mfgrd0.Height / Mfgrd0.RowHeightMin) + Mfgrd0.FixedRows + 1
        Else
            Mfgrd0.TopRow = srow
        End If
    End If
Else
    Mfgrd0.Row = Mfgrd0.FixedRows
End If

End Sub

Public Sub ShowRecActiveFlexRow(ByRef rs As ADODB.Recordset, ByRef MfgrdX As MSFlexGrid)
Dim mReqdRow As Long

With rs
mReqdRow = .AbsolutePosition + MfgrdX.FixedRows - 1
If .RecordCount > 0 And .EOF = False And .BOF = False Then
    If MfgrdX.RowIsVisible(mReqdRow) = False Then
        If mReqdRow > MfgrdX.TopRow Then
            MfgrdX.TopRow = mReqdRow - Int(MfgrdX.Height / MfgrdX.RowHeightMin) + MfgrdX.FixedRows + 1
        Else
            MfgrdX.TopRow = mReqdRow
        End If
    End If
    MfgrdX.Row = mReqdRow
Else
    MfgrdX.Row = MfgrdX.FixedRows
End If
End With

End Sub

Public Sub FillFlexRowColor(ByRef Mfgrd1 As MSFlexGrid, ByVal srow As Long, ByVal mColor As ColorConstants)
Dim scol As Integer
Mfgrd1.Row = srow

For scol = 0 To Mfgrd1.Cols - 1
    Mfgrd1.Col = scol
    Mfgrd1.CellBackColor = mColor
Next scol

End Sub

Public Function IsValidDosDir(ByVal mDirName As String) As Boolean
Dim cnt As Integer, mRtnval As Boolean, mChr As String, mAsc As Integer
mRtnval = True
For cnt = 1 To Len(mDirName)
    mChr = Mid(mDirName, cnt, 1)
    mAsc = Asc(mChr)
    If Not (Between(mAsc, 48, 57) = True Or Between(mAsc, 65, 90) = True Or Between(mAsc, 95, 95) = True Or Between(mAsc, 97, 122) = True) Then
        mRtnval = False
        Exit For
    End If
Next cnt
If mRtnval = True Then
    If Len(mDirName) = 0 Or Len(mDirName) > 8 Or Trim(mDirName) = "" Then
        mRtnval = False
    End If
End If
IsValidDosDir = mRtnval

End Function

Public Function JustFName(ByVal mFullPath As String) As String
Dim mRtnval As String, mBSPos As Integer, mColnPos As Integer
If Len(mFullPath) > 0 Then
    mBSPos = InStrRev(mFullPath, "\")
    If mBSPos > 0 Then
        If mBSPos < Len(mFullPath) Then
            mRtnval = Mid(mFullPath, mBSPos + 1)
        Else
            mRtnval = ""
        End If
    Else
        mColnPos = InStrRev(mFullPath, ":")
        If mColnPos > 0 Then
            If mColnPos < Len(mFullPath) Then
                mRtnval = Mid(mFullPath, mColnPos + 1)
            Else
                mRtnval = ""
            End If
        Else
            mRtnval = mFullPath
        End If
    End If
Else
    mRtnval = ""
End If
JustFName = mRtnval

End Function

Public Function JustStem(ByVal mFullPath As String) As String
Dim mRtnval As String, mDotPos As Integer

mRtnval = JustFName(mFullPath)
If Len(mRtnval) > 0 Then
    mDotPos = InStrRev(mRtnval, ".")
    If mDotPos > 0 Then
        If mDotPos > 1 Then
            mRtnval = Mid(mRtnval, 1, mDotPos - 1)
        Else
            mRtnval = ""
        End If
    Else
        mRtnval = mRtnval
    End If
End If
JustStem = mRtnval

End Function

Public Function JustPath(ByVal mFullPath As String) As String
Dim mRtnval As String, mBSPos As Integer, mColnPos As Integer
If Len(mFullPath) > 0 Then
    mBSPos = InStrRev(mFullPath, "\")
    If mBSPos > 0 Then
        If mBSPos > 1 Then
            mRtnval = Mid(mFullPath, 1, mBSPos - 1)
        Else
            mRtnval = ""
        End If
    Else
        mColnPos = InStrRev(mFullPath, ":")
        If mColnPos > 0 Then
            If mColnPos > 1 Then
                mRtnval = Mid(mFullPath, 1, mColnPos - 1)
            Else
                mRtnval = ""
            End If
        Else
            mRtnval = ""
        End If
    End If
Else
    mRtnval = ""
End If
JustPath = mRtnval

End Function

Public Sub SetFlexColCursor(ByRef mTextObj As Variant, ByRef MfgrdX As MSFlexGrid)
Dim mVisibleCols As Integer, mObjColPos As Integer, mFlexColPos As Integer

mVisibleCols = 1
mObjColPos = 0
For mFlexColPos = 0 To MfgrdX.Cols - 1
    If MfgrdX.ColWidth(mFlexColPos) > 0 Then
        If mTextObj.count < mVisibleCols Then
            Load mTextObj(mObjColPos)
        End If
        mTextObj(mObjColPos).Visible = True
        mTextObj(mObjColPos).ZOrder 0
        mTextObj(mObjColPos).Left = MfgrdX.Left + MfgrdX.ColPos(mFlexColPos)
        mTextObj(mObjColPos).Width = MfgrdX.ColWidth(mFlexColPos)
        mTextObj(mObjColPos).Height = MfgrdX.RowHeightMin
        ''mTextObj(mObjColPos).Enabled = True
        mTextObj(mObjColPos).BackColor = MfgrdX.BackColorSel
        mTextObj(mObjColPos).ForeColor = MfgrdX.ForeColorSel
        mTextObj(mObjColPos).Alignment = TextAlignFromFlex(MfgrdX.ColAlignment(mFlexColPos))
        
        mVisibleCols = mVisibleCols + 1
        mObjColPos = mObjColPos + 1
    End If
Next mFlexColPos
mVisibleCols = mVisibleCols - 1
For mObjColPos = mTextObj.count - 1 To 0 Step -1
    If mObjColPos + 1 > mVisibleCols Then
        Unload mTextObj(mObjColPos)
    End If
Next mObjColPos

End Sub

Public Sub ShowFlexColCursor(ByRef mTextObj As Variant, ByRef MfgrdX As MSFlexGrid, ByRef mRecType As Variant)
Dim mVisibleCols As Integer, mFlexColPos As Integer, mObjColPos As Integer, srow As Long, mEndofRec As Boolean

srow = MfgrdX.Row
mVisibleCols = 0
mObjColPos = 0
For mFlexColPos = 0 To MfgrdX.Cols - 1
    If MfgrdX.ColWidth(mFlexColPos) > 0 Then
        mTextObj(mObjColPos).Visible = (MfgrdX.RowIsVisible(srow) = True And MfgrdX.ColIsVisible(mFlexColPos) = True)
        If MfgrdX.RowIsVisible(srow) = True And MfgrdX.ColIsVisible(mFlexColPos) = True Then
            mTextObj(mObjColPos).Text = MfgrdX.TextMatrix(srow, mFlexColPos)
            mTextObj(mObjColPos).Top = MfgrdX.Top + MfgrdX.RowPos(srow)
            mTextObj(mObjColPos).Left = MfgrdX.Left + MfgrdX.ColPos(mFlexColPos)
            If (MfgrdX.Left + MfgrdX.Width) >= (mTextObj(mObjColPos).Left + MfgrdX.ColWidth(mFlexColPos)) Then
                mTextObj(mObjColPos).Width = MfgrdX.ColWidth(mFlexColPos)
                mVisibleCols = mVisibleCols + 1
            Else
                If mVisibleCols > 0 Then
                    mTextObj(mObjColPos).Visible = False
                Else
                    mTextObj(mObjColPos).Width = (MfgrdX.Left + MfgrdX.Width) - mTextObj(mObjColPos).Left
                    mVisibleCols = mVisibleCols + 1
                End If
            End If
            mEndofRec = True
            If TypeOf mRecType Is ADODB.Recordset Then
                mEndofRec = (mRecType.EOF = True)
            Else    ' assumed flex grid
                mEndofRec = (mRecType.Row = mRecType.Rows - 1)
            End If
            If mEndofRec = True Then
                mTextObj(mObjColPos).BackColor = vbRed
                mTextObj(mObjColPos).ForeColor = vbWindowText
            Else
                Rem If MfgrdX.Col = mFlexColPos Then
                Rem     mTextObj(mObjColPos).BackColor = cYELLOWLIGHT    '  MfgrdX.BackColorSel
                Rem     mTextObj(mObjColPos).ForeColor = vbWindowText
                Rem Else
                    mTextObj(mObjColPos).BackColor = vbHighlight    '  MfgrdX.BackColorSel
                    mTextObj(mObjColPos).ForeColor = vbHighlightText
                Rem End If
            End If
        End If
        
        mObjColPos = mObjColPos + 1
    End If
Next mFlexColPos

End Sub

Public Function JoinKeyAscii(ByVal mText As String, ByVal mKeyAscii As Integer) As String
Select Case mKeyAscii
Case vbKeyBack
    If mText <> "" Then
        mText = Left(mText, Len(mText) - 1)
    End If
Case Else
    mText = mText & Chr(mKeyAscii)
End Select
JoinKeyAscii = mText

End Function

Public Sub CalcAge(ByVal xDob As Date, ByVal xCdt As Date, ByRef xYr As Long, ByRef xMn As Long, ByRef xDy As Long)
Dim mTotDays As Long, mJStr As String, mTempDt As Date
mTotDays = xCdt - xDob
xMn = Int(mTotDays / 28)
If xMn > 0 Then
    mTempDt = DateAdd("M", xMn, xDob) - 1
    Do While mTempDt > xCdt And xMn > 0
        xMn = xMn - 1
        mTempDt = DateAdd("M", xMn, xDob)
        If Day(mTempDt) = Day(xDob) Then
            mTempDt = mTempDt - 1
        End If
    Loop
    If xMn >= 12 Then
        xYr = Int(xMn / 12)
        xMn = xMn - (xYr * 12)
    Else
        xYr = 0
    End If
Else
    xYr = 0
    mTempDt = xDob
End If
xDy = xCdt - mTempDt

End Sub

Public Function GetAgeStr(ByVal mDob As Date, ByVal mCdt As Date, ByRef mYr As Long, ByRef mMn As Long, ByRef mDy As Long) As String
Dim mRtnval As String
CalcAge xDob:=mDob, xCdt:=mCdt, xYr:=mYr, xMn:=mMn, xDy:=mDy

mRtnval = ""
If mYr <> 0 Then
    mRtnval = mRtnval & CStr(mYr) & " Yr "
End If
If mMn <> 0 Then
    mRtnval = mRtnval & CStr(mMn) & " Mn "
End If
If mDy <> 0 Then
    mRtnval = mRtnval & CStr(mDy) & " Days "
End If
GetAgeStr = mRtnval

End Function

Public Function CalcDob(ByVal xCdt As Date, ByVal xYr As Long, ByVal xMn As Long, ByVal xDy As Long) As Date
Dim mDob
mDob = DateAdd("M", ((xYr * 12) + xMn) * -1, xCdt) + 1
mDob = mDob - xDy
CalcDob = mDob

End Function

Public Function FileExist(ByVal mFileFullPathName As String) As Boolean
If Trim(mFileFullPathName) <> "" Then
    FileExist = (Dir(mFileFullPathName) <> "")
Else
    FileExist = False
End If

End Function

Public Function MyDropDownKey(ByVal mShift As Integer, mKeyCode As Integer) As Boolean
MyDropDownKey = (mShift = 0 And (mKeyCode = vbKeyF4 Or mKeyCode = vbKeyDown))

End Function

Public Function MyAddNewKey(ByVal mShift As Integer, mKeyCode As Integer) As Boolean
MyAddNewKey = (mShift = vbCtrlMask And (mKeyCode = vbKeyAdd Or mKeyCode = vbKeyA))

End Function

Public Function MyDeleteKey(ByVal mShift As Integer, mKeyCode As Integer, Optional ByVal mCheckCtrlMask As Boolean = True) As Boolean
If mCheckCtrlMask = True Then
    MyDeleteKey = (mShift = vbCtrlMask And (mKeyCode = vbKeySubtract Or mKeyCode = vbKeyD))
Else
    MyDeleteKey = (mShift = 0 And (mKeyCode = vbKeySubtract Or mKeyCode = vbKeyDelete))
End If

End Function

Public Function MyScrollKey(ByVal mShift As Integer, mKeyCode As Integer) As Boolean
MyScrollKey = (mShift = 0 And (mKeyCode = vbKeyDown Or mKeyCode = vbKeyUp))

End Function

Public Function MyListRefreshKey(ByVal mShift As Integer, mKeyCode As Integer) As Boolean
MyListRefreshKey = (mShift = 0 And mKeyCode = vbKeyF5)

End Function

Public Function MyPrintKey(ByVal mShift As Integer, mKeyCode As Integer) As Boolean
MyPrintKey = (mShift = vbCtrlMask And mKeyCode = vbKeyP)

End Function

Public Sub AddItemToComboFromList(ByRef mCmbObj As ComboBox, ByVal mList As String, Optional ByVal mSprtr As String = ",")
Dim mPos As Integer, mCountPos As Integer

mCmbObj.Clear
mCountPos = Occurs(mSourceStr:=mList, mTargetStr:=mSprtr, mMatchCase:=False) + 1
For mPos = 1 To mCountPos
    mCmbObj.AddItem GetMidPosStr(mList, mPos, mSprtr)
    mCmbObj.ItemData(mCmbObj.NewIndex) = mPos - 1
Next mPos

End Sub

Public Sub AddItemToComboFromArray(ByRef mCmbObj As ComboBox, ByVal mAryList As Variant)
Dim aPos As Integer

mCmbObj.Clear
For aPos = LBound(mAryList) To UBound(mAryList)
    mCmbObj.AddItem mAryList(aPos)
    mCmbObj.ItemData(mCmbObj.NewIndex) = aPos
Next aPos

End Sub

Public Function GetListIndexFromItemData(ByRef mCmbObj As ComboBox, ByVal mTargetItemData As Variant) As Integer
Dim mRtnval As Integer, mCount As Integer, mPos As Integer

mRtnval = -1
mCount = mCmbObj.ListCount
For mPos = 0 To mCount - 1
    If mCmbObj.ItemData(mPos) = mTargetItemData Then
        mRtnval = mPos
        Exit For
    End If
Next mPos
GetListIndexFromItemData = mRtnval

End Function

Public Function GetListTextFromItemData(ByRef mCmbObj As ComboBox, ByVal mTargetItemData As Variant) As Variant
Dim mRtnval As Variant, mCount As Integer, mPos As Integer

mCount = mCmbObj.ListCount
For mPos = 0 To mCount - 1
    If mCmbObj.ItemData(mPos) = mTargetItemData Then
        mRtnval = mCmbObj.List(mPos)
        Exit For
    End If
Next mPos
GetListTextFromItemData = mRtnval

End Function

Public Function Occurs(ByVal mSourceStr As String, ByVal mTargetStr As String, Optional ByVal mMatchCase As Boolean = False) As Integer
Dim mRtnval As Integer, mPos As Integer

mRtnval = 0
If Len(mSourceStr) > 0 And Len(mTargetStr) > 0 Then
    If mMatchCase = False Then
        mSourceStr = UCase(mSourceStr)
        mTargetStr = UCase(mTargetStr)
    End If
    
    mPos = 0
    If mPos < Len(mSourceStr) Then
        mPos = InStr(mPos + 1, mSourceStr, mTargetStr)
    End If
    Do While mPos > 0
        mRtnval = mRtnval + 1
        If mPos < Len(mSourceStr) Then
            mPos = InStr(mPos + 1, mSourceStr, mTargetStr)
        Else
            mPos = 0
        End If
    Loop
    Occurs = mRtnval
End If

End Function

Public Sub SetGridAutoHeight(ByRef MfgrdX As MSFlexGrid)
MfgrdX.Height = (MfgrdX.RowHeight(0) * Int(MfgrdX.Height / MfgrdX.RowHeight(0))) * 0.99
 
End Sub

Public Sub WriteTextToFile(ByVal mFileFullPath As String, ByVal mText As String, Optional ByVal mUnformatted As Boolean = False, Optional ByVal mFileMode As Integer = cFILEMODE_OUTPUT)
Dim fhand As Integer

fhand = FreeFile
Select Case mFileMode
Case cFILEMODE_APPEND
    Open mFileFullPath For Append Lock Read Write As #fhand
'Case cFILEMODE_BINARY
'    Open mFileFullPath For Binary Lock Read Write As #fhand
'Case cFILEMODE_INPUT
'    Open mFileFullPath For Input Lock Read Write As #fhand
'Case cFILEMODE_RANDOM
'    Open mFileFullPath For Random Lock Read Write As #fhand
Case Else  ''' cFILEMODE_OUTPUT
    Open mFileFullPath For Output Lock Read Write As #fhand
End Select
If mUnformatted = True Then
    Print #fhand, mText
Else
    Write #fhand, mText
End If
Close #fhand

End Sub

Public Function ReadTextFromFile(ByVal mFileFullPath As String, Optional ByVal mUnformatted As Boolean = False, Optional ByVal mFileMode As Integer = cFILEMODE_INPUT) As String
Dim fhand As Integer, mLineStr As String, mRtnval As String
    
fhand = FreeFile
'Select Case mFileMode
'Case cFILEMODE_APPEND
'    Open mFileFullPath For Append Lock Read Write As #fhand
'Case cFILEMODE_BINARY
'    Open mFileFullPath For Binary Lock Read Write As #fhand
'Case cFILEMODE_INPUT
    Open mFileFullPath For Input Lock Read Write As #fhand
'Case cFILEMODE_OUTPUT
'    Open mFileFullPath For Output Lock Read Write As #fhand
'Case cFILEMODE_RANDOM
'    Open mFileFullPath For Random Lock Read Write As #fhand
'End If
Do While Not EOF(fhand)
    If mUnformatted = True Then
        Line Input #fhand, mLineStr
    Else
        Input #fhand, mLineStr
    End If
    mRtnval = mRtnval & mLineStr & vbCrLf
Loop
Close #fhand

If Right(mRtnval, 2) = vbCrLf Then
    mRtnval = Left(mRtnval, Len(mRtnval) - 2)
End If

ReadTextFromFile = mRtnval

End Function

Public Function RSRecordCount(ByRef rs As ADODB.Recordset) As Long
Dim tRecset As ADODB.Recordset

Set tRecset = rs.ActiveConnection.Execute("Select count(*) from (" & rs.Source & ")")
RSRecordCount = tRecset.fields(0)
CloseTable tRecset

End Function


Rem ************************************* end of module ***********************************
