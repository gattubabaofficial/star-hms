Attribute VB_Name = "SelectQueryStruLib"
''Rem Select Query Structure Class
''Rem Type , Constant and Sub/Functions Declaration for the same
''Option Explicit
''
''Private Type SelectQueryStru
''Fields() As Variant
''From() As String
''Joins() As Variant
''Filter() As Variant
''Groupby() As Variant
''Orderby() As Variant
''Sqlstr As String
''End Type
''
''Rem Select Query Structure Fields array columns definitions
''Const cFIELD_EXPR = 0
''Const cFIELD_ALIAS = 1
''Const cFIELD_TITLE = 2
''Const cFIELD_SHOW = 3
''Rem Select Query Structure from array column definitions
''Const cFROM_TABLE = 0
''Const cFROM_ALIAS = 1
''Rem Select Query Structure Joins array columns definitions
''Const cJOIN_TYPE = 0
''Const cJOIN_TABLE = 1
''Const cJOIN_ALIAS = 2
''Const cJOIN_MATCH = 3
''Rem Select Query Structure Filter array columns definitions
''Const cFILTER_ANDOR = 0
''Const cFILTER_EXPR = 1
''Rem Select Query Structure Groupby array columns definitions
''Const cGROUPBY_EXPR = 0
''Rem Select Query Structure cORDERBY_EXPR array columns definitions
''Const cORDERBY_EXPR = 0
''
''Public Sub ClearSelectStru(ByRef tsqs As SelectQueryStru)
''tsqs.Fields = Array()
''tsqs.From = Array()
''tsqs.Joins = Array()
''tsqs.Filter = Array()
''tsqs.Groupby = Array()
''tsqs.Orderby = Array()
''tsqs.Sqlstr = ""
''
''End Sub
''
''Public Sub AddFields(ByRef tsqs As SelectQueryStru, ByVal mExpr As String, Optional ByVal mAlias As String = "", Optional ByVal mTitle As String = "", Optional ByVal mShowItem As Boolean = False)
''Dim acount As Integer
''acount = UBound(tsqs.Fields, 1)
''If acount = -1 Then
''    ReDim tsqs.Fields(0 To acount, 0 To 3)
''Else
''    ReDim Preserve tsqs.Fields(0 To acount, 0 To 3)
''End If
''mAlias = IIf(mAlias = "", mExpr, mAlias)
''mTitle = IIf(mTitle = "", mAlias, mTitle)
''
''tsqs.Fields(acount, cFIELD_EXPR) = mExpr
''tsqs.Fields(acount, cFIELD_ALIAS) = mAlias
''tsqs.Fields(acount, cFIELD_TITLE) = mTitle
''tsqs.Fields(acount, cFIELD_SHOW) = mShowItem
''
''End Sub
''
''Public Sub AddFrom(ByRef tsqs As SelectQueryStru, ByVal mTableName As String, Optional ByVal mTableAlias As String = "")
''Dim acount As Integer
''ReDim tsqs.From(1, 2)
''acount = UBound(tsqs.From, 1)
''If acount = -1 Then
''
''Else
''    ReDim Preserve tsqs.From(0 To acount, 0 To 3)
''End If
''tsqs.From(acount, cFROM_TABLE) = mTableName
''tsqs.From(acount, cFROM_ALIAS) = mTableAlias
''
''End Sub
''
''Public Sub AddJoins(ByRef tsqs As SelectQueryStru, ByVal mType As String, ByVal mTableName As String, ByVal mTableAlias As String, ByVal mMatchExpr As String)
''Dim acount As Integer
''acount = UBound(tsqs.Joins, 1)
''If acount = -1 Then
''    ReDim tsqs.Joins(0 To acount, 0 To 3)
''Else
''    ReDim Preserve tsqs.Joins(0 To acount, 0 To 3)
''End If
''tsqs.Joins(acount, cJOIN_TYPE) = mType
''tsqs.Joins(acount, cJOIN_TABLE) = mTableName
''tsqs.Joins(acount, cJOIN_ALIAS) = mTableAlias
''tsqs.Joins(acount, cJOIN_MATCH) = mMatchExpr
''
''End Sub
''
''Public Sub AddFilter(ByRef tsqs As SelectQueryStru, ByVal mAndOr As String, ByVal mFilterExpr As String)
''Dim acount As Integer
''acount = UBound(tsqs.Filter, 1)
''If acount = -1 Then
''    ReDim tsqs.Filter(0 To acount, 0 To 1)
''Else
''    ReDim Preserve tsqs.Filter(0 To acount, 0 To 1)
''End If
''tsqs.Filter(acount, cFILTER_ANDOR) = mAndOr
''tsqs.Filter(acount, cFILTER_EXPR) = mFilterExpr
''
''End Sub
''
''Public Sub AddGroupby(ByRef tsqs As SelectQueryStru, ByVal mExpr As String)
''Dim acount As Integer
''acount = UBound(tsqs.Groupby, 1)
''If acount = -1 Then
''    ReDim tsqs.Groupby(0 To acount, 0 To 0)
''Else
''    ReDim Preserve tsqs.Groupby(0 To acount, 0 To 0)
''End If
''tsqs.Groupby(acount, cGROUPBY_EXPR) = mExpr
''
''End Sub
''
''Public Sub AddOrderby(ByRef tsqs As SelectQueryStru, ByVal mExpr As String)
''Dim acount As Integer
''acount = UBound(tsqs.Orderby, 1)
''If acount = -1 Then
''    ReDim tsqs.Orderby(0 To acount, 0 To 0)
''Else
''    ReDim Preserve tsqs.Orderby(0 To acount, 0 To 0)
''End If
''tsqs.Orderby(acount, cORDERBY_EXPR) = mExpr
''
''End Sub
''
''Public Sub GenSelectQuery(ByRef tsqs As SelectQueryStru)
''Dim mSqlstr As String, acount As Integer, mLow As Integer, mHigh As Integer
''
''mSqlstr = "select"
''Rem columns
''mLow = LBound(tsqs.Fields, 1)
''mHigh = UBound(tsqs.Fields, 1)
''For acount = mLow To mHigh
''    mSqlstr = mSqlstr & IIf(acount = mLow, cSPC, ",") & tsqs.Fields(acount, cFIELD_EXPR)
''    If tsqs.Fields(acount, cFIELD_ALIAS) <> tsqs.Fields(acount, cFIELD_EXPR) Then
''        mSqlstr = mSqlstr & " as " & tsqs.Fields(acount, cFIELD_ALIAS)
''    End If
''Next acount
''Rem from
''mLow = LBound(tsqs.From, 1)
''mHigh = UBound(tsqs.From, 1)
''acount = mLow
''mSqlstr = mSqlstr & "from" & IIf(ALen(tsqs.Joins, 1) > 0, cSPC & String(ALen(tsqs.Joins, 1), "("), "")
''mSqlstr = mSqlstr & cSPC & tsqs.From(acount, cFROM_TABLE)
''If tsqs.From(acount, cFROM_ALIAS) <> "" Then
''    mSqlstr = mSqlstr & cSPC & tsqs.From(acount, cFROM_ALIAS)
''End If
''Rem joins
''mLow = LBound(tsqs.Joins, 1)
''mHigh = UBound(tsqs.Joins, 1)
''For acount = mLow To mHigh
''    mSqlstr = mSqlstr & cSPC & tsqs.Joins(acount, cJOIN_TYPE)
''    mSqlstr = mSqlstr & cSPC & tsqs.Joins(acount, cJOIN_TABLE)
''    If tsqs.Joins(acount, cJOIN_ALIAS) <> "" Then
''        mSqlstr = mSqlstr & " as " & tsqs.Joins(acount, cJOIN_ALIAS)
''    End If
''    mSqlstr = mSqlstr & " on " & tsqs.Joins(acount, cJOIN_MATCH) & ")"
''Next acount
''Rem where(filter)
''If ALen(tsqs.Filter, 1) > 0 Then
''    mLow = LBound(tsqs.Filter, 1)
''    mHigh = UBound(tsqs.Filter, 1)
''    For acount = mLow To mHigh
''        If acount = mLow Then
''            mSqlstr = mSqlstr & cSPC & "where"
''        Else
''            mSqlstr = mSqlstr & cSPC & tsqs.Filter(acount, cFILTER_ANDOR)
''        End If
''        mSqlstr = mSqlstr & cSPC & tsqs.Filter(acount, cFILTER_EXPR)
''    Next acount
''End If
''Rem Groupby
''If ALen(tsqs.Groupby, 1) > 0 Then
''    mSqlstr = mSqlstr & cSPC & "group by"
''    mLow = LBound(tsqs.Groupby, 1)
''    mHigh = UBound(tsqs.Groupby, 1)
''    For acount = mLow To mHigh
''        mSqlstr = mSqlstr & IIf(acount = mLow, cSPC, ",") & tsqs.Groupby(acount, cGROUPBY_EXPR)
''    Next acount
''End If
''Rem Orderby
''If ALen(tsqs.Orderby, 1) > 0 Then
''    mSqlstr = mSqlstr & cSPC & "order by"
''    mLow = LBound(tsqs.Orderby, 1)
''    mHigh = UBound(tsqs.Orderby, 1)
''    For acount = mLow To mHigh
''        mSqlstr = mSqlstr & IIf(acount = mLow, cSPC, ",") & tsqs.Orderby(acount, cORDERBY_EXPR)
''    Next acount
''End If
''tsqs.Sqlstr = mSqlstr
''End Sub
''
''
''
''
