VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsExcelApp"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Dim xlApp As Excel.Application, xlBook As Workbook, xlSheet As Excel.Worksheet, xlCurRow As Long, xlCurCol As Long, mExcelFileName As String

Public Property Let Visible(mVisible As Boolean)
xlApp.Visible = mVisible
End Property

Public Property Get ExcelFileName() As String
ExcelFileName = mExcelFileName
End Property

Public Property Let DefaultFontName(ByVal mFontName As String)
xlSheet.Cells.Font.Name = mFontName

End Property

Public Property Let DefaultFontSize(ByVal mFontsize As Integer)
xlSheet.Cells.Font.Size = mFontsize

End Property

Public Property Let DefaultFontBold(ByVal mFontBold As Boolean)
xlSheet.Cells.Font.Bold = mFontBold

End Property

Public Property Let SheetName(ByVal mSheetName As String)
xlSheet.Name = mSheetName

End Property

Public Property Get RowIndex() As Long
RowIndex = xlCurRow
End Property

Public Property Let RowIndex(ByVal mRowIndex As Long)
xlCurRow = mRowIndex
End Property

Public Property Get ColIndex() As Long
ColIndex = xlCurCol
End Property

Public Property Let ColIndex(ByVal mColIndex As Long)
xlCurCol = mColIndex
End Property

Public Property Get Range(ByVal mRowIndex As Long, ByVal mColIndex As Long) As Excel.Range
Set Range = xlSheet.Cells(mRowIndex, mColIndex)

End Property

Public Sub NextRowIndex(Optional ByVal mRowIndex, Optional ByVal mCount As Integer = 1)
If IsMissing(mRowIndex) = True Then
    mRowIndex = xlCurRow
End If
xlCurRow = mRowIndex + mCount
End Sub

Public Sub SelectNextRowIndex(Optional ByVal mRowIndex, Optional ByVal mCount As Integer = 1)
NextRowIndex mRowIndex, mCount
SelectCell
End Sub

Public Sub PreviousRowIndex(Optional ByVal mRowIndex, Optional ByVal mCount As Integer = 1)
If IsMissing(mRowIndex) = True Then
    mRowIndex = xlCurRow
End If
xlCurRow = mRowIndex - mCount
End Sub

Public Sub SelectPreviousRowIndex(Optional ByVal mRowIndex, Optional ByVal mCount As Integer = 1)
PreviousRowIndex mRowIndex, mCount
SelectCell
End Sub

Public Sub NextColIndex(Optional ByVal mColIndex, Optional ByVal mCount As Integer = 1)
If IsMissing(mColIndex) = True Then
    mColIndex = xlCurCol
End If
xlCurCol = mColIndex + mCount
End Sub

Public Sub SelectNextColIndex(Optional ByVal mColIndex, Optional ByVal mCount As Integer = 1)
NextColIndex mColIndex, mCount
SelectCell
End Sub

Public Sub PreviousColIndex(Optional ByVal mColIndex, Optional ByVal mCount As Integer = 1)
If IsMissing(mColIndex) = True Then
    mColIndex = xlCurCol
End If
xlCurCol = mColIndex - mCount
End Sub

Public Sub SelectPreviousColIndex(Optional ByVal mColIndex, Optional ByVal mCount As Integer = 1)
PreviousColIndex mColIndex, mCount
SelectCell
End Sub

Public Sub SkipRowIndex(Optional ByVal mRowIndex, Optional ByVal mCount As Integer = 1)
If IsMissing(mRowIndex) = True Then
    mRowIndex = xlCurRow
End If
xlCurRow = mRowIndex + mCount
End Sub

Public Sub SelectSkipRowIndex(Optional ByVal mRowIndex, Optional ByVal mCount As Integer = 1)
SkipRowIndex mRowIndex, mCount
SelectCell
End Sub

Public Sub NextRowColIndex(Optional ByVal mRowIndex, Optional ByVal mColIndex, Optional ByVal mRowCount As Integer = 1, Optional ByVal mColCount As Integer = 1)
If IsMissing(mRowIndex) = True Then
    mRowIndex = xlCurRow
End If
If IsMissing(mColIndex) = True Then
    mColIndex = xlCurCol
End If
xlCurRow = mRowIndex + mRowCount
xlCurCol = mColIndex + mColCount
End Sub

Public Sub SelectNextRowColIndex(Optional ByVal mRowIndex, Optional ByVal mColIndex, Optional ByVal mRowCount As Integer = 1, Optional ByVal mColCount As Integer = 1)
NextRowColIndex mRowIndex, mColIndex, mRowCount, mColCount
SelectCell
End Sub

Public Sub NextRecordIndex(Optional ByVal mRowIndex, Optional ByVal mRowCount As Integer = 1)
If IsMissing(mRowIndex) = True Then
    mRowIndex = xlCurRow
End If
xlCurRow = mRowIndex + mRowCount
xlCurCol = 1
End Sub

Public Sub SelectNextRecordIndex(Optional ByVal mRowIndex, Optional ByVal mRowCount As Integer = 1)
NextRecordIndex mRowIndex, mRowCount
SelectCell
End Sub

Public Sub PreviousRowColIndex(Optional ByVal mRowIndex, Optional ByVal mColIndex, Optional ByVal mRowCount As Integer = 1, Optional ByVal mColCount As Integer = 1)
If IsMissing(mRowIndex) = True Then
    mRowIndex = xlCurRow
End If
If IsMissing(mColIndex) = True Then
    mColIndex = xlCurCol
End If
xlCurRow = mRowIndex - mRowCount
xlCurCol = mColIndex - mColCount
End Sub

Public Sub SelectPreviousRowColIndex(Optional ByVal mRowIndex, Optional ByVal mColIndex, Optional ByVal mRowCount As Integer = 1, Optional ByVal mColCount As Integer = 1)
PreviousRowColIndex mRowIndex, mColIndex, mRowCount, mColCount
SelectCell
End Sub

Public Sub SkipRowColIndex(Optional ByVal mRowIndex, Optional ByVal mColIndex, Optional ByVal mRowCount As Integer = 1, Optional ByVal mColCount As Integer = 1)
If IsMissing(mRowIndex) = True Then
    mRowIndex = xlCurRow
End If
If IsMissing(mColIndex) = True Then
    mColIndex = xlCurCol
End If
xlCurRow = mRowIndex + mRowCount
xlCurCol = mColIndex + mColCount
End Sub

Public Sub SelectSkipRowColIndex(Optional ByVal mRowIndex, Optional ByVal mColIndex, Optional ByVal mRowCount As Integer = 1, Optional ByVal mColCount As Integer = 1)
SkipRowColIndex mRowIndex, mColIndex, mRowCount, mColCount
SelectCell
End Sub

Public Sub InitExcelApp()
Set xlApp = New Excel.Application
xlApp.Application.DisplayAlerts = False
xlApp.Application.ErrorCheckingOptions.NumberAsText = False

End Sub

Public Sub NewExcelWorkBook(ByVal mFileName As String)
mExcelFileName = mFileName
If mExcelFileName = "" Then
    'ErrorBox "Invalid File Name !!!"
    Exit Sub
Else
    If UCase(Right(mExcelFileName, 4)) <> ".XLS" And UCase(Right(mExcelFileName, 5)) <> ".XLSX" Then
        mExcelFileName = mExcelFileName & ".XLS"
    End If
End If
Set xlBook = xlApp.Workbooks.Add
CloseExcelWorkBook

End Sub

Public Sub OpenExcelWorkBook(ByVal mFileName As String)
mExcelFileName = mFileName
If mExcelFileName = "" Then
    'ErrorBox "Invalid File Name !!!"
    Exit Sub
Else
    If UCase(Right(mExcelFileName, 4)) <> ".XLS" And UCase(Right(mExcelFileName, 5)) <> ".XLSX" And UCase(Right(mExcelFileName, 4)) <> ".EXL" Then
        mExcelFileName = mExcelFileName & ".XLS"
    End If
End If

Set xlBook = xlApp.Workbooks.Open(mExcelFileName)
xlApp.Sheets(1).Select
Set xlSheet = xlBook.ActiveSheet

End Sub

Public Sub SaveAsExcelWorkBook(ByVal mNewFileName As String)
xlBook.SaveAs mNewFileName, xlNormal
xlBook.Close: Set xlBook = Nothing
mExcelFileName = mNewFileName

End Sub

Public Sub CloseExcelWorkBook()
xlBook.SaveAs mExcelFileName, xlNormal
xlBook.Close: Set xlBook = Nothing

End Sub

Public Sub CloseExcelApp()
Set xlApp = Nothing
End Sub

Public Sub WriteValue(ByVal mValue As Variant)  ' Write absolute value to Cell
xlSheet.Cells(xlCurRow, xlCurCol).FormulaR1C1 = mValue

End Sub

Public Sub WriteFormula(ByVal mValue As Variant)  ' Write formula to cell
xlSheet.Cells(xlCurRow, xlCurCol).Value = mValue
End Sub

Public Sub InsertEntireRow()
xlApp.Selection.EntireRow.Insert
End Sub

Public Sub SelectCell(Optional ByVal mRowIndex, Optional ByVal mColIndex)    ' Select specified cell(row,col)
If IsMissing(mRowIndex) = False Then
    xlCurRow = mRowIndex
End If
If IsMissing(mColIndex) = False Then
    xlCurCol = mColIndex
End If

xlSheet.Cells(xlCurRow, xlCurCol).Select
End Sub

Public Sub SelectRange(Range1 As Excel.Range, Range2 As Excel.Range)    ' select specified range(range1,range2)
xlApp.Range(Range1, Range2).Select
End Sub

Public Sub SelectRangeBy(Optional ByVal mByRowCount As Long = 0, Optional ByVal mByColCount As Long = 0) ' select specified range by count (row,col)
xlApp.Range(xlSheet.Cells(xlCurRow, xlCurCol), xlSheet.Cells(xlCurRow + mByRowCount, xlCurCol + mByColCount)).Select
End Sub

Public Sub ActiveCellFormat(Optional HorizontalAlignment, Optional VerticalAlignment, Optional CenterText, Optional FontBold, Optional FontItalic, Optional FontName, Optional FontSize, Optional NumberFormat, Optional WrapText, Optional AddIndent, Optional ShrinkToFit, Optional MergeCells, Optional Orientation, Optional TopLineStyle, Optional BottomLineStyle, Optional LeftLineStyle, Optional RightLineStyle, Optional ColWidth, Optional FillColor, Optional FontColor, Optional DrawBox, Optional DrawInsideHorizontal, Optional DrawInsideVertical, Optional LineStyle, Optional LineWeight, Optional RowHeight, Optional DrawSolidBox, Optional DrawThinBox, Optional DrawMediumBox)
Dim mDrawBox As Boolean

With xlApp.Selection
If IsMissing(ColWidth) = False Then .ColumnWidth = ColWidth
If IsMissing(RowHeight) = False Then .RowHeight = RowHeight
If IsMissing(CenterText) = False Then
    If CenterText = True Then
        .HorizontalAlignment = xlCenter
        .VerticalAlignment = xlCenter
    Else
        .HorizontalAlignment = xlLeft
        .VerticalAlignment = xlBottom
    End If
End If
If IsMissing(HorizontalAlignment) = False Then .HorizontalAlignment = HorizontalAlignment
If IsMissing(VerticalAlignment) = False Then .VerticalAlignment = VerticalAlignment
If IsMissing(LeftLineStyle) = False Then .Borders(xlEdgeLeft).LineStyle = LeftLineStyle
If IsMissing(RightLineStyle) = False Then .Borders(xlEdgeRight).LineStyle = RightLineStyle
If IsMissing(BottomLineStyle) = False Then .Borders(xlEdgeBottom).LineStyle = BottomLineStyle
If IsMissing(TopLineStyle) = False Then .Borders(xlEdgeTop).LineStyle = TopLineStyle
If IsMissing(FontBold) = False Then
    .Font.Bold = FontBold
End If
If IsMissing(FontItalic) = False Then
    .Font.Italic = FontItalic
End If
If IsMissing(FontName) = False Then .Font.Name = FontName
If IsMissing(FontSize) = False Then .Font.Size = FontSize
If IsMissing(WrapText) = False Then
    .WrapText = WrapText
End If
If IsMissing(Orientation) = False Then .Orientation = Orientation
If IsMissing(AddIndent) = False Then
    .AddIndent = AddIndent
End If
If IsMissing(ShrinkToFit) = False Then
    .ShrinkToFit = ShrinkToFit
End If
If IsMissing(MergeCells) = False Then
    .MergeCells = MergeCells
End If
'.Merge
If IsMissing(NumberFormat) = False Then .NumberFormat = NumberFormat
'xlSheet.Cells(Row, Cell) = mValue
If IsMissing(FillColor) = False Then .Interior.Color = FillColor
If IsMissing(FontColor) = False Then .Font.Color = FontColor
If IsMissing(DrawBox) = False Or IsMissing(DrawSolidBox) = False Or IsMissing(DrawThinBox) = False Or IsMissing(DrawMediumBox) = False Then
    If IsMissing(LineStyle) = True Then
        LineStyle = xlContinuous
    End If
    If IsMissing(LineWeight) = True Then
        LineWeight = xlThin
    End If
    If IsMissing(DrawBox) = False Then
        mDrawBox = DrawBox
    End If
    If IsMissing(DrawThinBox) = False Then
        mDrawBox = DrawThinBox
        LineWeight = xlThin
    End If
    If IsMissing(DrawMediumBox) = False Then
        mDrawBox = DrawMediumBox
        LineWeight = xlMedium
    End If
    If IsMissing(DrawSolidBox) = False Then
        mDrawBox = DrawSolidBox
        LineWeight = xlSolid
    End If
    If mDrawBox = True Then
        With .Borders(xlEdgeLeft)
        .LineStyle = LineStyle
        .Weight = LineWeight
        End With
        With .Borders(xlEdgeRight)
        .LineStyle = LineStyle
        .Weight = LineWeight
        End With
        With .Borders(xlEdgeTop)
        .LineStyle = LineStyle
        .Weight = LineWeight
        End With
        With .Borders(xlEdgeBottom)
        .LineStyle = LineStyle
        .Weight = LineWeight
        End With
        If IsMissing(DrawInsideHorizontal) = False Then
            If DrawInsideHorizontal = True Then
                With .Borders(xlInsideHorizontal)
                .LineStyle = LineStyle
                .Weight = LineWeight
                End With
            End If
        End If
        If IsMissing(DrawInsideVertical) = False Then
            If DrawInsideVertical = True Then
                With .Borders(xlInsideVertical)
                .LineStyle = LineStyle
                .Weight = LineWeight
                End With
            End If
        End If
    End If
End If
End With

End Sub

Public Sub ActiveColFormat(Optional HorizontalAlignment, Optional VerticalAlignment, Optional CenterText, Optional FontBold, Optional FontItalic, Optional FontName, Optional FontSize, Optional NumberFormat, Optional WrapText, Optional AddIndent, Optional ShrinkToFit, Optional MergeCells, Optional Orientation, Optional TopLineStyle, Optional BottomLineStyle, Optional LeftLineStyle, Optional RightLineStyle, Optional ColWidth, Optional FillColor, Optional FontColor, Optional DrawBox, Optional DrawInsideHorizontal, Optional DrawInsideVertical, Optional LineStyle, Optional LineWeight, Optional RowHeight, Optional DrawSolidBox, Optional DrawThinBox, Optional DrawMediumBox)
Dim mDrawBox As Boolean, mActiveSelectionRng As Excel.Range

'mActiveSelectionRng = xlApp.Selection.Range
xlApp.ActiveCell.EntireColumn.Select
With xlApp.Selection
If IsMissing(ColWidth) = False Then .ColumnWidth = ColWidth
If IsMissing(RowHeight) = False Then .RowHeight = RowHeight
If IsMissing(CenterText) = False Then
    If CenterText = True Then
        .HorizontalAlignment = xlCenter
        .VerticalAlignment = xlCenter
    Else
        .HorizontalAlignment = xlLeft
        .VerticalAlignment = xlBottom
    End If
End If
If IsMissing(HorizontalAlignment) = False Then .HorizontalAlignment = HorizontalAlignment
If IsMissing(VerticalAlignment) = False Then .VerticalAlignment = VerticalAlignment
If IsMissing(LeftLineStyle) = False Then .Borders(xlEdgeLeft).LineStyle = LeftLineStyle
If IsMissing(RightLineStyle) = False Then .Borders(xlEdgeRight).LineStyle = RightLineStyle
If IsMissing(BottomLineStyle) = False Then .Borders(xlEdgeBottom).LineStyle = BottomLineStyle
If IsMissing(TopLineStyle) = False Then .Borders(xlEdgeTop).LineStyle = TopLineStyle
If IsMissing(FontBold) = False Then
    .Font.Bold = FontBold
End If
If IsMissing(FontItalic) = False Then
    .Font.Italic = FontItalic
End If
If IsMissing(FontName) = False Then .Font.Name = FontName
If IsMissing(FontSize) = False Then .Font.Size = FontSize
If IsMissing(WrapText) = False Then
    .WrapText = WrapText
End If
If IsMissing(Orientation) = False Then .Orientation = Orientation
If IsMissing(AddIndent) = False Then
    .AddIndent = AddIndent
End If
If IsMissing(ShrinkToFit) = False Then
    .ShrinkToFit = ShrinkToFit
End If
If IsMissing(MergeCells) = False Then
    .MergeCells = MergeCells
End If
'.Merge
If IsMissing(NumberFormat) = False Then .NumberFormat = NumberFormat
'xlSheet.Cells(Row, Cell) = mValue
If IsMissing(FillColor) = False Then .Interior.Color = FillColor
If IsMissing(FontColor) = False Then .Font.Color = FontColor
If IsMissing(DrawBox) = False Or IsMissing(DrawSolidBox) = False Or IsMissing(DrawThinBox) = False Or IsMissing(DrawMediumBox) = False Then
    If IsMissing(LineStyle) = True Then
        LineStyle = xlContinuous
    End If
    If IsMissing(LineWeight) = True Then
        LineWeight = xlThin
    End If
    If IsMissing(DrawBox) = False Then
        mDrawBox = DrawBox
    End If
    If IsMissing(DrawThinBox) = False Then
        mDrawBox = DrawThinBox
        LineWeight = xlThin
    End If
    If IsMissing(DrawMediumBox) = False Then
        mDrawBox = DrawMediumBox
        LineWeight = xlMedium
    End If
    If IsMissing(DrawSolidBox) = False Then
        mDrawBox = DrawSolidBox
        LineWeight = xlSolid
    End If
    If mDrawBox = True Then
        With .Borders(xlEdgeLeft)
        .LineStyle = LineStyle
        .Weight = LineWeight
        End With
        With .Borders(xlEdgeRight)
        .LineStyle = LineStyle
        .Weight = LineWeight
        End With
        With .Borders(xlEdgeTop)
        .LineStyle = LineStyle
        .Weight = LineWeight
        End With
        With .Borders(xlEdgeBottom)
        .LineStyle = LineStyle
        .Weight = LineWeight
        End With
        If IsMissing(DrawInsideHorizontal) = False Then
            If DrawInsideHorizontal = True Then
                With .Borders(xlInsideHorizontal)
                .LineStyle = LineStyle
                .Weight = LineWeight
                End With
            End If
        End If
        If IsMissing(DrawInsideVertical) = False Then
            If DrawInsideVertical = True Then
                With .Borders(xlInsideVertical)
                .LineStyle = LineStyle
                .Weight = LineWeight
                End With
            End If
        End If
    End If
End If
End With
SelectCell
'xlApp.Selection.Range = mActiveSelectionRng

End Sub

Private Sub Class_Initialize()
xlCurRow = 1
xlCurCol = 1
End Sub

Private Sub Class_Terminate()
Set xlSheet = Nothing
Set xlBook = Nothing
Set xlApp = Nothing
End Sub
