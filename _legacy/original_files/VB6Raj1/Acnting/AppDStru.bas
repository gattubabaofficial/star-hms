Attribute VB_Name = "ApplicationDataStru"
Option Explicit

Public Type adTableStru
TableName As String
ColumnName() As Variant
ColumnType() As Variant
ColumnWidth() As Variant
ColumnRequired() As Variant
AllowZeroLength() As Variant
AutoIncrement() As Variant
ColumnStatus() As Variant
PrimaryKey As String
IndexName() As Variant
IndexUnique() As Variant
IndexColumn1() As Variant
IndexColumn2() As Variant
IndexColumn3() As Variant
IndexColumn4() As Variant
IndexColumn5() As Variant
IndexColumn6() As Variant
IndexColumn7() As Variant
IndexColumn8() As Variant
IndexColumn9() As Variant
IndexStatus() As Variant
CreateStatus As Integer

End Type

Public Type adLinkStru
TableName() As Variant
LinkName() As Variant
dbSource() As Variant
LinkStatus() As Variant

End Type

Public Sub CreateAcDatabase()
Dim mTableStru As adTableStru, dbAcDatabase As New ADODB.Connection, dbAcCatalog As New ADOX.Catalog, clsDB As clsDataStru

If Dir(dbAcDatabaseFullPath) = "" Then
    dbAcCatalog.Create "Provider=" & DbProvider & ";Data Source=" & dbAcDatabaseFullPath
    Set dbAcCatalog = Nothing
End If
OpenAcDataSource dbAcDatabase, mExclusiveMode:=True
If dbAcDatabase.State <> 1 Then
    ErrorBox Err.Description
    Exit Sub
End If
Set dbAcCatalog.ActiveConnection = dbAcDatabase
Set clsDB = New clsDataStru

With clsDB
.ClearTableStru
.TableName = "AchdMast"
Rem field definitions
.AddColumn: .ColumnName() = "AhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "AhName": .ColumnType() = adVarWChar: .ColumnWidth() = 51: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "AhRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "AhCode"
Rem index definition
.AddIndex: .IndexName() = "AhName": .IndexUnique() = True: .IndexColumn1() = "AhName"

.CreateTable dbAcCatalog
End With

With clsDB
.ClearTableStru
.TableName = "AchdMast_Log"
Rem field definitions
.AddColumn: .ColumnName() = "AhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "AhName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "AhRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition

Rem index definition
.AddIndex: .IndexName() = "AhCode": .IndexColumn1() = "AhCode"
.AddIndex: .IndexName() = "AhName": .IndexColumn1() = "AhName"

.CreateTable dbAcCatalog
End With

With clsDB
.ClearTableStru
.TableName = "Journal"
Rem field definitions
.AddColumn: .ColumnName() = "JrnCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrnICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "JrnSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrnDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrnAhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrnAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrnNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JrnRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrnLAhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
Rem primary key definition
.PrimaryKey = "JrnICode"
Rem index definition
.AddIndex: .IndexName() = "JrnCodeICode": .IndexColumn1() = "JrnCode": .IndexColumn2() = "JrnICode"
.AddIndex: .IndexName() = "JrnCodeSNo": .IndexColumn1() = "JrnCode": .IndexColumn2() = "JrnSno"

.CreateTable dbAcCatalog
End With

With clsDB
.ClearTableStru
.TableName = "Journal_Log"
Rem field definitions
.AddColumn: .ColumnName() = "JrnCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrnICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrnSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrnDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrnAhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrnAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrnNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JrnRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrnLAhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
Rem primary key definition

Rem index definition
.AddIndex: .IndexName() = "JrnICode": .IndexColumn1() = "JrnICode"
.AddIndex: .IndexName() = "JrnCodeICode": .IndexColumn1() = "JrnCode": .IndexColumn2() = "JrnICode"
.AddIndex: .IndexName() = "JrnCodeSNo": .IndexColumn1() = "JrnCode": .IndexColumn2() = "JrnSno"

.CreateTable dbAcCatalog
End With

InfoBox dbAcCatalog.ActiveConnection.Properties("Data Source Name") & ", Done !!!"

Set clsDB = Nothing
Set dbAcCatalog = Nothing
CloseDataSource dbAcDatabase

End Sub

Public Sub CreateStDatabase()
Dim mTableStru As adTableStru, dbStDatabase As New ADODB.Connection, dbStCatalog As New ADOX.Catalog, clsDB As clsDataStru

If Dir(dbStDatabaseFullPath) = "" Then
    dbStCatalog.Create "Provider=" & DbProvider & ";Data Source=" & dbStDatabaseFullPath
    Set dbStCatalog = Nothing
End If
OpenStDataSource dbStDatabase, mExclusiveMode:=True
If dbStDatabase.State <> 1 Then
    ErrorBox Err.Description
    Exit Sub
End If
Set dbStCatalog.ActiveConnection = dbStDatabase
Set clsDB = New clsDataStru

With clsDB
.ClearTableStru
.TableName = "ProdMast"
Rem field definitions
.AddColumn: .ColumnName() = "ItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "ItmName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ItmRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "ItmCode"
Rem index definition
.AddIndex: .IndexName() = "ItmName": .IndexUnique() = True: .IndexColumn1() = "ItmName"

.CreateTable dbStCatalog
End With

With clsDB
.ClearTableStru
.TableName = "ProdMast_Log"
Rem field definitions
.AddColumn: .ColumnName() = "ItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ItmName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ItmRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition

Rem index definition
.AddIndex: .IndexName() = "ItmCode": .IndexColumn1() = "ItmCode"
.AddIndex: .IndexName() = "ItmName": .IndexColumn1() = "ItmName"

.CreateTable dbStCatalog
End With

With clsDB
.ClearTableStru
.TableName = "ProdRef"
Rem field definitions
.AddColumn: .ColumnName() = "ItrRefCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "ItrItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ItrStkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ItrRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ItrRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "ItrRefCode"
Rem index definition
.AddIndex: .IndexName() = "ItrItmCodeRefCode": .IndexColumn1() = "ItrItmCode": .IndexColumn2() = "ItrRefCode"
.AddIndex: .IndexName() = "ItrStkCode": .IndexColumn1() = "ItrStkCode"

.CreateTable dbStCatalog
End With

With clsDB
.ClearTableStru
.TableName = "ProdRef_Log"
Rem field definitions
.AddColumn: .ColumnName() = "ItrRefCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ItrItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ItrStkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ItrRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ItrRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition

Rem index definition
.AddIndex: .IndexName() = "ItrRefCode": .IndexColumn1() = "ItrRefCode"
.AddIndex: .IndexName() = "ItrItmCodeRefCode": .IndexColumn1() = "ItrItmCode": .IndexColumn2() = "ItrRefCode"
.AddIndex: .IndexName() = "ItrStkCode": .IndexColumn1() = "ItrStkCode"

.CreateTable dbStCatalog
End With

With clsDB
.ClearTableStru
.TableName = "StockJrn"
Rem field definitions
.AddColumn: .ColumnName() = "StkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "StkICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "StkSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "StkDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "StkItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "StkItmRefCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "StkQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "StkRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "StkValue": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "StkNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "StkRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "StkLItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "StkICode"
Rem index definition
.AddIndex: .IndexName() = "StkCodeICode": .IndexColumn1() = "StkCode": .IndexColumn2() = "StkICode"
.AddIndex: .IndexName() = "StkCodeSNo": .IndexColumn1() = "StkCode": .IndexColumn2() = "StkSno"
.AddIndex: .IndexName() = "StkCodeItmCodeItmRefCode": .IndexColumn1() = "StkCode": .IndexColumn2() = "StkItmCode": .IndexColumn3() = "StkItmRefCode"
.AddIndex: .IndexName() = "StkItmCodeItmRefCode": .IndexColumn1() = "StkItmCode": .IndexColumn2() = "StkItmRefCode"
.AddIndex: .IndexName() = "StkItmRefCodeItmCode": .IndexColumn1() = "StkItmRefCode": .IndexColumn2() = "StkItmCode"

.CreateTable dbStCatalog
End With

With clsDB
.ClearTableStru
.TableName = "StockJrn_Log"
Rem field definitions
.AddColumn: .ColumnName() = "StkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "StkICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "StkSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "StkDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "StkItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "StkItmRefCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "StkQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "StkRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "StkValue": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "StkNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "StkRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "StkLItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition

Rem index definition
.AddIndex: .IndexName() = "StkICode": .IndexColumn1() = "StkICode"
.AddIndex: .IndexName() = "StkCodeICode": .IndexColumn1() = "StkCode": .IndexColumn2() = "StkICode"
.AddIndex: .IndexName() = "StkCodeSNo": .IndexColumn1() = "StkCode": .IndexColumn2() = "StkSno"
.AddIndex: .IndexName() = "StkCodeItmCodeItmRefCode": .IndexColumn1() = "StkCode": .IndexColumn2() = "StkItmCode": .IndexColumn3() = "StkItmRefCode"
.AddIndex: .IndexName() = "StkItmCodeItmRefCode": .IndexColumn1() = "StkItmCode": .IndexColumn2() = "StkItmRefCode"
.AddIndex: .IndexName() = "StkItmRefCodeItmCode": .IndexColumn1() = "StkItmRefCode": .IndexColumn2() = "StkItmCode"

.CreateTable dbStCatalog
End With

InfoBox dbStCatalog.ActiveConnection.Properties("Data Source Name") & ", Done !!!"

Set clsDB = Nothing
Set dbStCatalog = Nothing
CloseDataSource dbStDatabase

End Sub

Public Sub CreateGrpDatabase()
Dim mTableStru As adTableStru, dbGrpDatabase As New ADODB.Connection, dbGrpCatalog As New ADOX.Catalog, clsDB As clsDataStru

If Dir(dbGrpDatabaseFullPath) = "" Then
    dbGrpCatalog.Create "Provider=" & DbProvider & ";Data Source=" & dbGrpDatabaseFullPath
    Set dbGrpCatalog = Nothing
End If
OpenGrpDataSource dbGrpDatabase, mExclusiveMode:=True
If dbGrpDatabase.State <> 1 Then
    ErrorBox Err.Description
    Exit Sub
End If
Set dbGrpCatalog.ActiveConnection = dbGrpDatabase
Set clsDB = New clsDataStru

With clsDB
.ClearTableStru
.TableName = "gAchdSum"
Rem field definitions
.AddColumn: .ColumnName() = "GasICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "GasDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "GasAhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "GasAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "GasRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "GasICode"
Rem index definition
.AddIndex: .IndexName() = "GasAhCodeDate": .IndexColumn1() = "GasAhCode": .IndexColumn1() = "GasDate"
.AddIndex: .IndexName() = "GasDateAhCode": .IndexColumn1() = "GasDate": .IndexColumn1() = "GasAhCode"

.CreateTable dbGrpCatalog
End With

With clsDB
.ClearTableStru
.TableName = "gProdSum"
Rem field definitions
.AddColumn: .ColumnName() = "GpsICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "GpsDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "GpsItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "GpsItmRefCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "GpsQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "GpsRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "GpsValue": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "GpsRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "GpsICode"
Rem index definition
.AddIndex: .IndexName() = "GpsItmCodeDate": .IndexColumn1() = "GpsItmCode": .IndexColumn1() = "GpsDate"
.AddIndex: .IndexName() = "GpsDateItmCode": .IndexColumn1() = "GpsDate": .IndexColumn1() = "GpsItmCode"

.CreateTable dbGrpCatalog
End With

InfoBox dbGrpCatalog.ActiveConnection.Properties("Data Source Name") & ", Done !!!"

Set clsDB = Nothing
Set dbGrpCatalog = Nothing
CloseDataSource dbGrpDatabase

End Sub

Public Sub CreateComDatabase()
Dim mTableStru As adTableStru, dbComDatabase As New ADODB.Connection, dbComCatalog As New ADOX.Catalog, clsDB As clsDataStru

If Dir(dbComDatabaseFullPath) = "" Then
    dbComCatalog.Create "Provider=" & DbProvider & ";Data Source=" & dbComDatabaseFullPath
    Set dbComCatalog = Nothing
End If
OpenComDataSource dbComDatabase, mExclusiveMode:=True
If dbComDatabase.State <> 1 Then
    ErrorBox Err.Description
    Exit Sub
End If
Set dbComCatalog.ActiveConnection = dbComDatabase
Set clsDB = New clsDataStru

With clsDB
.ClearTableStru
.TableName = "TmpSession"
Rem field definitions
.AddColumn: .ColumnName() = "TssICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "TssCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "TssUsrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "TssICode"
Rem index definition
.AddIndex: .IndexName() = "TssCode": .IndexColumn1() = "TssCode"
.AddIndex: .IndexName() = "TssUsrCode": .IndexColumn1() = "TssUsrCode"

.CreateTable dbComCatalog
End With
clsDB.ClearTableStru    ' by programmer mistake it is not getting used anywhere in link table procedure

Rem link table *****************************************************************************
With clsDB
.ClearLinkStru
.AddLink: .LinkTableName() = "AchdMast": .LinkDbSource() = dbAcDatabaseFullPath
.AddLink: .LinkTableName() = "Journal": .LinkDbSource() = dbAcDatabaseFullPath
.AddLink: .LinkTableName() = "Journal_Log": .LinkDbSource() = dbAcDatabaseFullPath
.AddLink: .LinkTableName() = "ProdMast": .LinkDbSource() = dbStDatabaseFullPath
.AddLink: .LinkTableName() = "ProdMast_Log": .LinkDbSource() = dbStDatabaseFullPath
.AddLink: .LinkTableName() = "ProdRef": .LinkDbSource() = dbStDatabaseFullPath
.AddLink: .LinkTableName() = "ProdRef_Log": .LinkDbSource() = dbStDatabaseFullPath
.AddLink: .LinkTableName() = "StockJrn": .LinkDbSource() = dbStDatabaseFullPath
.AddLink: .LinkTableName() = "StockJrn_Log": .LinkDbSource() = dbStDatabaseFullPath
.AddLink: .LinkTableName() = "gAchdSum": .LinkDbSource() = dbGrpDatabaseFullPath
.AddLink: .LinkTableName() = "gProdSum": .LinkDbSource() = dbGrpDatabaseFullPath

.CreateLink dbComCatalog
End With

InfoBox dbComCatalog.ActiveConnection.Properties("Data Source Name") & ", Done !!!"

Set clsDB = Nothing
Set dbComCatalog = Nothing
CloseDataSource dbComDatabase

End Sub




Public Sub xxxCreateAcDatabase()

''Dim mTableStru As TableStru, dbAcDatabase As New ADODB.Connection, dbAcCatalog As New ADOX.Catalog, clsDB As clsDataStru
''
''If Dir(sAppPath & "\Data\Accounts.Mdb") = "" Then
''    dbAcCatalog.Create "Provider=Microsoft.Jet.Oledb.4.0;Data Source=" & sAppPath & "\Data\Accounts.Mdb"
''    Set dbAcCatalog = Nothing
''End If
''OpenAcDataSource dbAcDatabase, mExclusiveMode:=True
''If dbAcDatabase.State <> 1 Then
''    ErrorBox Err.Description
''    Exit Sub
''End If
''Set dbAcCatalog.ActiveConnection = dbAcDatabase
''Set clsDB = New clsDataStru
''
''ClearTableStru mTableStru
''
''mTableStru.TableName = "Test"
''AddToArray mTableStru.ColumnName, "Field1": AddToArray mTableStru.ColumnType, adVarWChar: AddToArray mTableStru.ColumnWidth, 10: AddToArray mTableStru.ColumnRequired, True: AddToArray mTableStru.AllowZeroLength, False: AddToArray mTableStru.ColumnStatus, cREC_NEW
''AddToArray mTableStru.ColumnName, "Field2": AddToArray mTableStru.ColumnType, adInteger: AddToArray mTableStru.ColumnWidth, Empty: AddToArray mTableStru.ColumnRequired, False: AddToArray mTableStru.AllowZeroLength, True: AddToArray mTableStru.ColumnStatus, cREC_NEW
''
''CreateTable dbAcCatalog, mTableStru
''
''Set dbAcCatalog = Nothing
''CloseDataSource dbAcDatabase
''
''End Sub

''Public Sub CreateTable(ByRef dbCatalog As ADOX.Catalog, ByRef mTableStru As TableStru)
''Dim mTable As ADOX.Table, mColumn As ADOX.Column, mTblCount As Integer, mColCount As Integer, aPos As Integer, mCreateStatus As Integer
''mCreateStatus = 1
''For Each mTable In dbCatalog.Tables
''    If mTable.Type = "LINK" Or mTable.Type = "VIEW" Or mTable.Type = "SYSTEM TABLE" Or mTable.Type = "ACCESS TABLE" Then
''        If UCase(mTable.Name) = UCase(mTableStru.TableName) Then
''            If mTable.Type = "LINK" Then
''                ErrorBox "Cannot Create Table over Link Table !!!" & vbCrLf & mTable.Name
''            ElseIf mTable.Type = "VIEW" Then
''                ErrorBox "Cannot Create Table over Views !!!" & vbCrLf & mTable.Name
''            Else
''                ErrorBox "Cannot Create Table over System Table !!!" & vbCrLf & mTable.Name
''            End If
''            mCreateStatus = 0
''            Exit For
''        End If
''    Else
''        If UCase(mTable.Name) = UCase(mTableStru.TableName) Then
''            mCreateStatus = 2
''            Exit For
''        End If
''    End If
''Next mTable
''If mCreateStatus > 0 Then
''    If mCreateStatus = 1 Then   ' adding new table
''        Set mTable = New ADOX.Table
''        mTable.ParentCatalog = dbCatalog
''
''        With mTable
''        .Name = mTableStru.TableName
''        For mColCount = LBound(mTableStru.ColumnName) To UBound(mTableStru.ColumnName)
''            mTable.Columns.Append mTableStru.ColumnName(mColCount), mTableStru.ColumnType(mColCount), mTableStru.ColumnWidth(mColCount)
''
''            Set mColumn = mTable.Columns(mTableStru.ColumnName(mColCount))
''            With mColumn
''            If IsEmpty(mTableStru.ColumnRequired(mColCount)) = False Then
''                .Properties("Nullable") = Not mTableStru.ColumnRequired(mColCount)
''            End If
''            If IsEmpty(mTableStru.AllowZeroLength(mColCount)) = False Then
''                .Properties("Jet Oledb:Allow Zero Length") = mTableStru.AllowZeroLength(mColCount)
''            End If
''            End With
''
''            mTableStru.ColumnStatus(mColCount) = cREC_ADDED
''        Next mColCount
''        End With
''        dbCatalog.Tables.Append mTable
''
''    ElseIf mCreateStatus = 2 Then   ' editing existing tables for creating new columns, editing existing columns, removing mismatch name columns
''        Set mTable = dbCatalog.Tables(mTableStru.TableName)
''        For Each mColumn In mTable.Columns
''            aPos = AScan(mTableStru.ColumnName, mColumn.Name)
''            If aPos >= LBound(mTableStru.ColumnName) Then
''                With mColumn
''                If .Type <> mTableStru.ColumnType(aPos) Then
''                    ErrorBox "Programmatic Table Alteration Strictly Prohibited !!!" & vbCrLf & .Name & "->" & TypeName(.Type) & "->" & TypeName(mTableStru.ColumnType(aPos))
''                    Rem .Type = mTableStru.ColumnType(aPos)
''                End If
''                If IsEmpty(mTableStru.ColumnWidth(aPos)) = False Then
''                    If .DefinedSize <> mTableStru.ColumnWidth(aPos) Then
''                        ErrorBox "Programmatic Table Alteration Strictly Prohibited !!!" & vbCrLf & .Name & "->DefinedSize:" & CStr(.DefinedSize) & "->DefinedSize:" & CStr(mTableStru.ColumnWidth(aPos))
''                        Rem .DefinedSize = mTableStru.ColumnWidth(aPos)
''                    End If
''                End If
''                If IsEmpty(mTableStru.ColumnRequired(aPos)) = False Then
''                    If .Properties("Nullable") <> Not mTableStru.ColumnRequired(aPos) Then
''                        .Properties("Nullable") = Not mTableStru.ColumnRequired(aPos)
''                    End If
''                End If
''                If IsEmpty(mTableStru.AllowZeroLength(aPos)) = False Then
''                    If .Properties("Jet Oledb:Allow Zero Length") <> mTableStru.AllowZeroLength(aPos) Then
''                        .Properties("Jet Oledb:Allow Zero Length") = mTableStru.AllowZeroLength(aPos)
''                    End If
''                End If
''                End With
''                mTableStru.ColumnStatus(aPos) = cREC_EDITED
''            Else
''                mTableStru.ColumnStatus(aPos) = cREC_DELETED
''            End If
''        Next mColumn
''        For mColCount = LBound(mTableStru.ColumnName) To UBound(mTableStru.ColumnName)
''            If mTableStru.ColumnStatus(mColCount) = cREC_NEW Then
''                mTable.Columns.Append mTableStru.ColumnName(mColCount), mTableStru.ColumnType(mColCount), mTableStru.ColumnWidth(mColCount)
''
''                Set mColumn = mTable.Columns(mTableStru.ColumnName(mColCount))
''                With mColumn
''                If IsEmpty(mTableStru.ColumnRequired(mColCount)) = False Then
''                    .Properties("Nullable") = Not mTableStru.ColumnRequired(mColCount)
''                End If
''                If IsEmpty(mTableStru.AllowZeroLength(mColCount)) = False Then
''                    .Properties("Jet Oledb:Allow Zero Length") = mTableStru.AllowZeroLength(mColCount)
''                End If
''                End With
''
''                mTableStru.ColumnStatus(mColCount) = cREC_ADDED
''            ElseIf mTableStru.ColumnStatus(mColCount) = cREC_DELETED Then
''                mTable.Columns.Delete mTableStru.ColumnName
''            End If
''        Next mColCount
''    End If
''    mTableStru.CreateStatus = mCreateStatus
''End If
''Set mTable = Nothing
''Set mColumn = Nothing
''
End Sub

