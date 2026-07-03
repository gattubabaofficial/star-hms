Attribute VB_Name = "ExtendMenu"
Option Explicit

Public Sub RepostAllAchdCurBal()
Dim dbAcDatabase As New ADODB.Connection, dbGrpDatabase As New ADODB.Connection, dbComDatabase As New ADODB.Connection
Dim clsAH As clsAccountHead

OpenAcDataSource dbAcDatabase
OpenGrpDataSource dbGrpDatabase
OpenComDataSource dbComDatabase

Set clsAH = New clsAccountHead
Set clsAH.dbAcDatabase = dbAcDatabase
Set clsAH.dbGrpDatabase = dbGrpDatabase

clsAH.ResetAllAhGrpAmtSum
clsAH.RepostAllAhGrpAmtSum
clsAH.RemoveUnusedAllAhGrpAmtSum

Set clsAH = Nothing

CloseDataSource dbAcDatabase
CloseDataSource dbGrpDatabase
CloseDataSource dbComDatabase

InfoBox "Done !!!"

End Sub

