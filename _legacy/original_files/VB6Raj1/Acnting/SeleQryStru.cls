VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsSelectQueryStructure"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Rem Select Query Structure Class
Rem Type , Constant and Sub/Functions Declaration for the same
Option Explicit

Private QStru As SelectQueryStru

Public Sub Clear()
With QStru
.Field_Expr = Array()
.Field_Alias = Array()
.Field_Title = Array()
.Field_Show = Array()
.Field_Attrib = Array()
.Field_Link = Array()
.Field_Align = Array()
.Field_Width = Array()
.Field_NumFmt = Array()
.Field_Invert = Array()
.From_Table = Array()
.From_Alias = Array()
.Join_Type = Array()
.Join_Table = Array()
.Join_Alias = Array()
.Join_Match = Array()
.Filter_Conj = Array()
.Filter_Expr = Array()
.Filter_Attrib = Array()
.Groupby_Expr = Array()
.Orderby_Expr = Array()
.Orderby_Attrib = Array()

.Sqlstr = ""
End With
End Sub

Public Property Get SqlQueryStr() As String
SqlQueryStr = QStru.Sqlstr
End Property

Public Property Get LFields() As Integer
LFields = LBound(QStru.Field_Expr)
End Property

Public Property Get UFields() As Integer
UFields = UBound(QStru.Field_Expr)
End Property

Public Property Get Field_Expr(ByVal mDim1 As Integer) As Variant
Field_Expr = QStru.Field_Expr(mDim1)
End Property

Public Property Get Field_Alias(ByVal mDim1 As Integer, Optional ByVal mWithoutPrefix As Boolean = False) As Variant
Dim mAlias As String
mAlias = QStru.Field_Alias(mDim1)
If mWithoutPrefix = True And UCase(mAlias) = UCase(QStru.Field_Expr(mDim1)) And InStr(mAlias, ".") > 0 Then
    Field_Alias = Mid(mAlias, InStr(mAlias, ".") + 1)
Else
    Field_Alias = QStru.Field_Alias(mDim1)
End If
End Property

Public Property Get Field_Title(ByVal mDim1 As Integer) As Variant
Field_Title = QStru.Field_Title(mDim1)
End Property

Public Property Get Field_Show(ByVal mDim1 As Integer) As Variant
Field_Show = QStru.Field_Show(mDim1)
End Property

Public Property Get Field_Attrib(ByVal mDim1 As Integer) As Variant
Field_Attrib = QStru.Field_Attrib(mDim1)
End Property

Public Property Get Field_Link(ByVal mDim1 As Integer) As Variant
Field_Link = QStru.Field_Link(mDim1)
End Property

Public Property Get Field_Align(ByVal mDim1 As Integer) As Variant
Field_Align = QStru.Field_Align(mDim1)
End Property

Public Property Get Field_Width(ByVal mDim1 As Integer) As Variant
Field_Width = QStru.Field_Width(mDim1)
End Property

Public Property Get Field_NumFmt(ByVal mDim1 As Integer) As Variant
Field_NumFmt = QStru.Field_NumFmt(mDim1)
End Property

Public Property Get Field_Invert(ByVal mDim1 As Integer) As Variant
Field_Invert = QStru.Field_Invert(mDim1)
End Property

Public Property Get LJoins() As Integer
LJoins = LBound(QStru.Join_Type)
End Property

Public Property Get UJoins() As Integer
UJoins = UBound(QStru.Join_Type)
End Property

Public Property Get LFilter() As Integer
LFilter = LBound(QStru.Filter_Conj)
End Property

Public Property Get UFilter() As Integer
UFilter = UBound(QStru.Filter_Conj)
End Property

Public Sub AddFields(ByVal mExpr As String, Optional ByVal mAlias As String = "", Optional ByVal mTitle As String = "", Optional ByVal mShowItem As Boolean = False, Optional ByVal mAttrib As Integer = cFAT_ARCHIVE, Optional ByVal mLink As String = "", Optional ByVal mAlign As Integer = 0, Optional ByVal mWidth As Long = 1000, Optional ByVal mNumFmt As String = "", Optional ByVal mInvert As Boolean = False)
Dim acount As Integer
With QStru
acount = UBound(.Field_Expr) + 1

ReDim Preserve .Field_Expr(acount)
ReDim Preserve .Field_Alias(acount)
ReDim Preserve .Field_Title(acount)
ReDim Preserve .Field_Show(acount)
ReDim Preserve .Field_Attrib(acount)
ReDim Preserve .Field_Link(acount)
ReDim Preserve .Field_Align(acount)
ReDim Preserve .Field_Width(acount)
ReDim Preserve .Field_NumFmt(acount)
ReDim Preserve .Field_Invert(acount)

mAlias = IIf(mAlias = "", mExpr, mAlias)
mTitle = IIf(mTitle = "", mAlias, mTitle)

.Field_Expr(acount) = mExpr
.Field_Alias(acount) = mAlias
.Field_Title(acount) = mTitle
.Field_Show(acount) = (mShowItem = True And mAttrib = cFAT_ARCHIVE)  ' only archive field will be shown
.Field_Attrib(acount) = mAttrib
.Field_Link(acount) = mLink
.Field_Align(acount) = mAlign
.Field_Width(acount) = mWidth
.Field_NumFmt(acount) = mNumFmt
.Field_Invert(acount) = mInvert
End With

End Sub

Public Sub UpdateField(ByVal mAlias As String, Optional ByVal mTitle, Optional ByVal mShowItem, Optional ByVal mAttrib, Optional ByVal mLink, Optional ByVal mAlign, Optional ByVal mWidth, Optional ByVal mNumFmt, Optional ByVal mInvert)
Dim acount As Integer
With QStru
acount = AScan(.Field_Alias, mAlias)
If acount >= LBound(.Field_Expr) Then
    If IsMissing(mTitle) = False Then
        .Field_Title(acount) = mTitle
    End If
    If IsMissing(mShowItem) = False Then
        .Field_Show(acount) = mShowItem
    End If
    If IsMissing(mAttrib) = False Then
        .Field_Attrib(acount) = mAttrib
    End If
    If IsMissing(mLink) = False Then
        .Field_Link(acount) = mLink
    End If
    If IsMissing(mAlign) = False Then
        .Field_Align(acount) = mAlign
    End If
    If IsMissing(mWidth) = False Then
        .Field_Width(acount) = mWidth
    End If
    If IsMissing(mNumFmt) = False Then
        .Field_NumFmt(acount) = mNumFmt
    End If
    If IsMissing(mInvert) = False Then
        .Field_Invert(acount) = mInvert
    End If
Else
    ErrorBox "Field not found in Query Structure !!!"
End If
End With

End Sub

Public Sub AddFrom(ByVal mTableName As String, Optional ByVal mTableAlias As String = "")
Dim acount As Integer
With QStru
acount = UBound(.From_Table) + 1

ReDim Preserve .From_Table(acount)
ReDim Preserve .From_Alias(acount)

.From_Table(acount) = mTableName
.From_Alias(acount) = mTableAlias
End With

End Sub

Public Sub AddJoins(ByVal mType As String, ByVal mTableName As String, ByVal mTableAlias As String, ByVal mMatchExpr As String)
Dim acount As Integer
With QStru
acount = UBound(.Join_Type) + 1

ReDim Preserve .Join_Type(acount)
ReDim Preserve .Join_Table(acount)
ReDim Preserve .Join_Alias(acount)
ReDim Preserve .Join_Match(acount)

.Join_Type(acount) = mType
.Join_Table(acount) = mTableName
.Join_Alias(acount) = mTableAlias
.Join_Match(acount) = mMatchExpr
End With

End Sub

Public Sub AddFilter(ByVal mFilterConj As String, ByVal mFilterExpr As String, Optional ByVal mAttrib As Integer = cFAT_SYSTEM)
Dim acount As Integer
With QStru
acount = UBound(.Filter_Conj) + 1

ReDim Preserve .Filter_Conj(acount)
ReDim Preserve .Filter_Expr(acount)
ReDim Preserve .Filter_Attrib(acount)

.Filter_Conj(acount) = mFilterConj
.Filter_Expr(acount) = mFilterExpr
.Filter_Attrib(acount) = mAttrib
End With

End Sub

Public Sub AddGroupby(ByVal mExpr As String)
Dim acount As Integer
With QStru
acount = UBound(.Groupby_Expr) + 1

ReDim Preserve .Groupby_Expr(acount)

.Groupby_Expr(acount) = mExpr
End With

End Sub

Public Sub AddOrderby(ByVal mExpr As String, Optional ByVal mAttrib As Integer = cFAT_SYSTEM)
Dim acount As Integer
With QStru
acount = UBound(.Orderby_Expr) + 1

ReDim Preserve .Orderby_Expr(acount)
ReDim Preserve .Orderby_Attrib(acount)

.Orderby_Expr(acount) = mExpr
.Orderby_Attrib(acount) = mAttrib
End With

End Sub

Public Function GetItemIndex(ByVal mItemAlias As String) As Integer
Dim acount As Integer
With QStru
acount = AScan(.Field_Alias, mItemAlias)
GetItemIndex = acount

End With

End Function

Public Sub GenQuery()
Dim mSqlstr As String, acount As Integer, mLow As Integer, mHigh As Integer

mSqlstr = "select"
Rem columns
mLow = LBound(QStru.Field_Expr, 1)
mHigh = UBound(QStru.Field_Expr, 1)
For acount = mLow To mHigh
    mSqlstr = mSqlstr & IIf(acount = mLow, cSPC, ",") & QStru.Field_Expr(acount)
    If UCase(QStru.Field_Alias(acount)) <> UCase(QStru.Field_Expr(acount)) Then
        mSqlstr = mSqlstr & " as " & QStru.Field_Alias(acount)
    End If
Next acount
Rem from
mLow = LBound(QStru.From_Table)
mHigh = UBound(QStru.From_Table)
acount = mLow
mSqlstr = mSqlstr & cSPC & "from" & IIf(ALen(QStru.Join_Type, 1) > 0, cSPC & String(ALen(QStru.Join_Type), "("), "")
mSqlstr = mSqlstr & cSPC & QStru.From_Table(acount)
If QStru.From_Alias(acount) <> "" Then
    mSqlstr = mSqlstr & cSPC & QStru.From_Alias(acount)
End If
Rem joins
mLow = LBound(QStru.Join_Type)
mHigh = UBound(QStru.Join_Type)
For acount = mLow To mHigh
    mSqlstr = mSqlstr & cSPC & QStru.Join_Type(acount)
    mSqlstr = mSqlstr & cSPC & QStru.Join_Table(acount)
    If QStru.Join_Alias(acount) <> "" Then
        mSqlstr = mSqlstr & " as " & QStru.Join_Alias(acount)
    End If
    mSqlstr = mSqlstr & " on " & QStru.Join_Match(acount) & ")"
Next acount
Rem where(filter)
If ALen(QStru.Filter_Conj) > 0 Then
    mLow = LBound(QStru.Filter_Conj)
    mHigh = UBound(QStru.Filter_Conj)
    For acount = mLow To mHigh
        If acount = mLow Then
            mSqlstr = mSqlstr & cSPC & "where"
        Else
            mSqlstr = mSqlstr & cSPC & QStru.Filter_Conj(acount)
        End If
        mSqlstr = mSqlstr & cSPC & QStru.Filter_Expr(acount)
    Next acount
End If
Rem Groupby
If ALen(QStru.Groupby_Expr) > 0 Then
    mSqlstr = mSqlstr & cSPC & "group by"
    mLow = LBound(QStru.Groupby_Expr)
    mHigh = UBound(QStru.Groupby_Expr)
    For acount = mLow To mHigh
        mSqlstr = mSqlstr & IIf(acount = mLow, cSPC, ",") & QStru.Groupby_Expr(acount)
    Next acount
End If
Rem Orderby
If ALen(QStru.Orderby_Expr) > 0 Then
    mSqlstr = mSqlstr & cSPC & "order by"
    mLow = LBound(QStru.Orderby_Expr)
    mHigh = UBound(QStru.Orderby_Expr)
    For acount = mLow To mHigh
        mSqlstr = mSqlstr & IIf(acount = mLow, cSPC, ",") & QStru.Orderby_Expr(acount)
    Next acount
End If
QStru.Sqlstr = mSqlstr
End Sub

