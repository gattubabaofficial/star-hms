Attribute VB_Name = "ToolingDataStru"
Option Explicit

Public Sub CreateTlgDatabase(ByVal mAddMode As Boolean)
Dim mTableStru As adTableStru, dbTlgDatabase As New ADODB.Connection, dbTlgCatalog As New ADOX.Catalog, clsDB As clsDataStru

If mAddMode = True Then
    If Dir(dbTlgDatabaseFullPath) = "" Then
        dbTlgCatalog.Create "Provider=" & DbProvider & ";Data Source=" & dbTlgDatabaseFullPath
        Set dbTlgCatalog = Nothing
    Else
        ErrorBox "Database " & dbTlgDatabaseFullPath & " already exist !!!"
        GoTo EndSub
    End If
End If
OpenTlgDataSource dbTlgDatabase, mExclusiveMode:=True
If dbTlgDatabase.State <> 1 Then
    ErrorBox Err.Description
    GoTo EndSub
End If
Set dbTlgCatalog.ActiveConnection = dbTlgDatabase
Set clsDB = New clsDataStru

With clsDB
.ClearTableStru
.TableName = "VendMast" ''' originated from AchdMast in Acnting
Rem field definitions
.AddColumn: .ColumnName() = "VndCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VndRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "VndCode"
Rem index definition
Rem .AddIndex: .IndexName() = "VndCode": .IndexColumn1() = "VndCode"

.CreateTable dbTlgCatalog
End With

With clsDB
.ClearTableStru
.TableName = "VendMast_Log" ''' originated from AchdMast in Acnting
Rem field definitions
.AddColumn: .ColumnName() = "VndCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VndRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "VndCode"
Rem index definition
.AddIndex: .IndexName() = "VndCode": .IndexColumn1() = "VndCode"

.CreateTable dbTlgCatalog
End With

With clsDB
.ClearTableStru
.TableName = "MachMast"
Rem field definitions
.AddColumn: .ColumnName() = "MacCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "MacName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MacRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "MacCode"
Rem index definition
.AddIndex: .IndexName() = "MacName": .IndexUnique() = True: .IndexColumn1() = "MacName"

.CreateTable dbTlgCatalog
End With

With clsDB
.ClearTableStru
.TableName = "MachMast_Log"
Rem field definitions
.AddColumn: .ColumnName() = "MacCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MacName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MacRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition

Rem index definition
.AddIndex: .IndexName() = "MacCode": .IndexColumn1() = "MacCode"
.AddIndex: .IndexName() = "MacName": .IndexColumn1() = "MacName"

.CreateTable dbTlgCatalog
End With

With clsDB
.ClearTableStru
.TableName = "MatProcMast"
Rem field definitions
.AddColumn: .ColumnName() = "MprCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "MprName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MprRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "MprCode"
Rem index definition
.AddIndex: .IndexName() = "MprName": .IndexUnique() = True: .IndexColumn1() = "MprName"

.CreateTable dbTlgCatalog
End With

With clsDB
.ClearTableStru
.TableName = "MatProcMast_Log"
Rem field definitions
.AddColumn: .ColumnName() = "MprCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MprName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MprRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "MprCode"
Rem index definition
.AddIndex: .IndexName() = "MprCode": .IndexColumn1() = "MprCode"
.AddIndex: .IndexName() = "MprName": .IndexColumn1() = "MprName"

.CreateTable dbTlgCatalog
End With

With clsDB
.ClearTableStru
.TableName = "MatIssue" ''' for In House Machining
Rem field definitions
.AddColumn: .ColumnName() = "MisCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MisICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "MisSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MisDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MisItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MisItmRefCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MisMacCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MisEmpCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MisStkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MisStkICodeIs": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MisStkICodeRc": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MisQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MisNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "MisRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "MisICode"
Rem index definition
.AddIndex: .IndexName() = "MisCodeICode": .IndexColumn1() = "MisCode": .IndexColumn2() = "MisICode"
.AddIndex: .IndexName() = "MisCodeSNo": .IndexColumn1() = "MisCode": .IndexColumn2() = "MisSno"

.CreateTable dbTlgCatalog
End With

With clsDB
.ClearTableStru
.TableName = "MatIssue_Log" ''' for In House Machining
Rem field definitions
.AddColumn: .ColumnName() = "MisCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MisICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MisSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MisDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MisItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MisItmRefCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MisMacCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MisEmpCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MisStkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MisStkICodeIs": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MisStkICodeRc": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MisQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MisNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "MisRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "MisICode"
Rem index definition
.AddIndex: .IndexName() = "MisICode": .IndexColumn1() = "MisICode"
.AddIndex: .IndexName() = "MisCodeICode": .IndexColumn1() = "MisCode": .IndexColumn2() = "MisICode"
.AddIndex: .IndexName() = "MisCodeSNo": .IndexColumn1() = "MisCode": .IndexColumn2() = "MisSno"

.CreateTable dbTlgCatalog
End With

With clsDB
.ClearTableStru
.TableName = "ForgIssue" ''' for In House Forging
Rem field definitions
.AddColumn: .ColumnName() = "FisCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "FisICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "FisSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "FisDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "FisItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "FisItmRefCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "FisMacCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "FisEmpCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "FisStkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "FisStkICodeIs": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "FisStkICodeRc": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "FisWeight": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "FisUnitWeight": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "FisUnitNos": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "FisNos": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "FisNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "FisRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "FisICode"
Rem index definition
.AddIndex: .IndexName() = "FisCodeICode": .IndexColumn1() = "FisCode": .IndexColumn2() = "FisICode"
.AddIndex: .IndexName() = "FisCodeSNo": .IndexColumn1() = "FisCode": .IndexColumn2() = "FisSno"

.CreateTable dbTlgCatalog
End With

With clsDB
.ClearTableStru
.TableName = "ForgIssue_Log" ''' for In House Forging
Rem field definitions
.AddColumn: .ColumnName() = "FisCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "FisICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "FisSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "FisDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "FisItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "FisItmRefCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "FisMacCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "FisEmpCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "FisStkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "FisStkICodeIs": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "FisStkICodeRc": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "FisWeight": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "FisUnitWeight": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "FisUnitNos": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "FisNos": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "FisNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "FisRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "FisICode"
Rem index definition
.AddIndex: .IndexName() = "FisICode": .IndexColumn1() = "FisICode"
.AddIndex: .IndexName() = "FisCodeICode": .IndexColumn1() = "FisCode": .IndexColumn2() = "FisICode"
.AddIndex: .IndexName() = "FisCodeSNo": .IndexColumn1() = "FisCode": .IndexColumn2() = "FisSno"

.CreateTable dbTlgCatalog
End With

With clsDB
.ClearTableStru
.TableName = "VendIsFrg" ''' Vendor Issue for Forging
Rem field definitions
.AddColumn: .ColumnName() = "VifCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VifICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "VifSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VifDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VifItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VifItmRefCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VifVndCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VifStkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VifStkICodeIs": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VifStkICodeRc": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VifWeight": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VifUnitWeight": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VifUnitNos": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VifNos": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VifNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VifRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "VifICode"
Rem index definition
.AddIndex: .IndexName() = "VifCodeICode": .IndexColumn1() = "VifCode": .IndexColumn2() = "VifICode"
.AddIndex: .IndexName() = "VifCodeSNo": .IndexColumn1() = "VifCode": .IndexColumn2() = "VifSno"

.CreateTable dbTlgCatalog
End With

With clsDB
.ClearTableStru
.TableName = "VendIsFrg_Log" ''' Vendor Issue for Forging
Rem field definitions
.AddColumn: .ColumnName() = "VifCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VifICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VifSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VifDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VifItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VifItmRefCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VifVndCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VifStkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VifStkICodeIs": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VifStkICodeRc": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VifWeight": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VifUnitWeight": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VifUnitNos": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VifNos": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VifNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VifRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "VifICode"
Rem index definition
.AddIndex: .IndexName() = "VifICode": .IndexColumn1() = "VifICode"
.AddIndex: .IndexName() = "VifCodeICode": .IndexColumn1() = "VifCode": .IndexColumn2() = "VifICode"
.AddIndex: .IndexName() = "VifCodeSNo": .IndexColumn1() = "VifCode": .IndexColumn2() = "VifSno"

.CreateTable dbTlgCatalog
End With

With clsDB
.ClearTableStru
.TableName = "VendRcFrg"
Rem field definitions
.AddColumn: .ColumnName() = "VrfCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrfICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "VrfSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrfDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrfItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrfItmRefCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrfVndCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrfMprCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VrfStkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrfStkICodeIs": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrfStkICodeRc": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrfUnitWeight": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VrfUnitNos": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VrfFinOutWeight": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VrfFinOutNos": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VrfRejOutWeight": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VrfRejOutNos": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VrfConsWeight": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VrfConsNos": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VrfNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VrfRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "VrfICode"
Rem index definition
.AddIndex: .IndexName() = "VrfCodeICode": .IndexColumn1() = "VrfCode": .IndexColumn2() = "VrfICode"
.AddIndex: .IndexName() = "VrfCodeSNo": .IndexColumn1() = "VrfCode": .IndexColumn2() = "VrfSno"

.CreateTable dbTlgCatalog
End With

With clsDB
.ClearTableStru
.TableName = "VendRcFrg_Log"
Rem field definitions
.AddColumn: .ColumnName() = "VrfCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrfICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrfSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrfDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrfItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrfItmRefCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrfVndCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrfMprCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VrfStkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrfStkICodeIs": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrfStkICodeRc": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrfUnitWeight": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VrfUnitNos": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VrfFinOutWeight": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VrfFinOutNos": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VrfRejOutWeight": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VrfRejOutNos": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VrfConsWeight": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VrfConsNos": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VrfNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VrfRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "VrfICode"
Rem index definition
.AddIndex: .IndexName() = "VrfICode": .IndexColumn1() = "VrfICode"
.AddIndex: .IndexName() = "VrfCodeICode": .IndexColumn1() = "VrfCode": .IndexColumn2() = "VrfICode"
.AddIndex: .IndexName() = "VrfCodeSNo": .IndexColumn1() = "VrfCode": .IndexColumn2() = "VrfSno"

.CreateTable dbTlgCatalog
End With

With clsDB
.ClearTableStru
.TableName = "VendIsPrt" ''' Vendor Issue for Parting
Rem field definitions
.AddColumn: .ColumnName() = "VipCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VipICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "VipSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VipDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VipItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VipItmRefCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VipVndCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VipStkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VipStkICodeIs": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VipStkICodeRc": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VipWeight": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VipLength": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VipUnitWeight": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VipUnitNos": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VipNos": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VipNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VipRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "VipICode"
Rem index definition
.AddIndex: .IndexName() = "VipCodeICode": .IndexColumn1() = "VipCode": .IndexColumn2() = "VipICode"
.AddIndex: .IndexName() = "VipCodeSNo": .IndexColumn1() = "VipCode": .IndexColumn2() = "VipSno"

.CreateTable dbTlgCatalog
End With

With clsDB
.ClearTableStru
.TableName = "VendIsPrt_Log" ''' Vendor Issue for Parting
Rem field definitions
.AddColumn: .ColumnName() = "VipCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VipICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VipSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VipDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VipItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VipItmRefCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VipVndCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VipStkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VipStkICodeIs": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VipStkICodeRc": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VipWeight": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VipLength": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VipUnitWeight": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VipUnitNos": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VipNos": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VipNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VipRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "VipICode"
Rem index definition
.AddIndex: .IndexName() = "VipICode": .IndexColumn1() = "VipICode"
.AddIndex: .IndexName() = "VipCodeICode": .IndexColumn1() = "VipCode": .IndexColumn2() = "VipICode"
.AddIndex: .IndexName() = "VipCodeSNo": .IndexColumn1() = "VipCode": .IndexColumn2() = "VipSno"

.CreateTable dbTlgCatalog
End With

With clsDB
.ClearTableStru
.TableName = "VendRcPrt"
Rem field definitions
.AddColumn: .ColumnName() = "VrpCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrpICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "VrpSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrpDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrpItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrpItmRefCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrpVndCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrpMprCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VrpStkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrpStkICodeIs": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrpStkICodeRc": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrpUnitWeight": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VrpUnitNos": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VrpFinOutWeight": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VrpFinOutNos": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VrpRejOutWeight": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VrpRejOutNos": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VrpConsWeight": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VrpConsNos": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VrpNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VrpRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "VrpICode"
Rem index definition
.AddIndex: .IndexName() = "VrpCodeICode": .IndexColumn1() = "VrpCode": .IndexColumn2() = "VrpICode"
.AddIndex: .IndexName() = "VrpCodeSNo": .IndexColumn1() = "VrpCode": .IndexColumn2() = "VrpSno"

.CreateTable dbTlgCatalog
End With

With clsDB
.ClearTableStru
.TableName = "VendRcPrt_Log"
Rem field definitions
.AddColumn: .ColumnName() = "VrpCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrpICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrpSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrpDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrpItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrpItmRefCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrpVndCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrpMprCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VrpStkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrpStkICodeIs": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrpStkICodeRc": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrpUnitWeight": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VrpUnitNos": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VrpFinOutWeight": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VrpFinOutNos": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VrpRejOutWeight": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VrpRejOutNos": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VrpConsWeight": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VrpConsNos": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VrpNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VrpRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "VrpICode"
Rem index definition
.AddIndex: .IndexName() = "VrpICode": .IndexColumn1() = "VrpICode"
.AddIndex: .IndexName() = "VrpCodeICode": .IndexColumn1() = "VrpCode": .IndexColumn2() = "VrpICode"
.AddIndex: .IndexName() = "VrpCodeSNo": .IndexColumn1() = "VrpCode": .IndexColumn2() = "VrpSno"

.CreateTable dbTlgCatalog
End With

With clsDB
.ClearTableStru
.TableName = "VendIsBod" ''' Vendor Issue for Bore OD
Rem field definitions
.AddColumn: .ColumnName() = "VibCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VibICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "VibSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VibDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VibItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VibItmRefCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VibVndCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VibStkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VibStkICodeIs": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VibStkICodeRc": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VibQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VibNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VibRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "VibICode"
Rem index definition
.AddIndex: .IndexName() = "VibCodeICode": .IndexColumn1() = "VibCode": .IndexColumn2() = "VibICode"
.AddIndex: .IndexName() = "VibCodeSNo": .IndexColumn1() = "VibCode": .IndexColumn2() = "VibSno"

.CreateTable dbTlgCatalog
End With

With clsDB
.ClearTableStru
.TableName = "VendIsBod_Log" ''' Vendor Issue for Bore OD
Rem field definitions
.AddColumn: .ColumnName() = "VibCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VibICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VibSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VibDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VibItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VibItmRefCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VibVndCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VibStkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VibStkICodeIs": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VibStkICodeRc": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VibQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VibNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VibRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "VibICode"
Rem index definition
.AddIndex: .IndexName() = "VibICode": .IndexColumn1() = "VibICode"
.AddIndex: .IndexName() = "VibCodeICode": .IndexColumn1() = "VibCode": .IndexColumn2() = "VibICode"
.AddIndex: .IndexName() = "VibCodeSNo": .IndexColumn1() = "VibCode": .IndexColumn2() = "VibSno"

.CreateTable dbTlgCatalog
End With

With clsDB
.ClearTableStru
.TableName = "VendRcBod"    ''' Vendor Receipt Bore OD
Rem field definitions
.AddColumn: .ColumnName() = "VrbCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrbICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "VrbSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrbDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrbItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrbItmRefCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrbVndCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrbMprCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VrbStkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrbStkICodeIs": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrbStkICodeRc": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrbFinOutQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VrbRejOutQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VrbConsQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VrbNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VrbRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "VrbICode"
Rem index definition
.AddIndex: .IndexName() = "VrbCodeICode": .IndexColumn1() = "VrbCode": .IndexColumn2() = "VrbICode"
.AddIndex: .IndexName() = "VrbCodeSNo": .IndexColumn1() = "VrbCode": .IndexColumn2() = "VrbSno"

.CreateTable dbTlgCatalog
End With

With clsDB
.ClearTableStru
.TableName = "VendRcBod_Log"    ''' Vendor Receipt Bore OD
Rem field definitions
.AddColumn: .ColumnName() = "VrbCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrbICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrbSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrbDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrbItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrbItmRefCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrbVndCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrbMprCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VrbStkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrbStkICodeIs": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrbStkICodeRc": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VrbFinOutQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VrbRejOutQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VrbConsQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VrbNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VrbRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "VrbICode"
Rem index definition
.AddIndex: .IndexName() = "VrbICode": .IndexColumn1() = "VrbICode"
.AddIndex: .IndexName() = "VrbCodeICode": .IndexColumn1() = "VrbCode": .IndexColumn2() = "VrbICode"
.AddIndex: .IndexName() = "VrbCodeSNo": .IndexColumn1() = "VrbCode": .IndexColumn2() = "VrbSno"

.CreateTable dbTlgCatalog
End With

With clsDB
.ClearTableStru
.TableName = "MacProdn"
Rem field definitions
.AddColumn: .ColumnName() = "PdnCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PdnICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "PdnSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PdnDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PdnItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PdnItmRefCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PdnMacCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PdnEmpCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PdnMprCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PdnStkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PdnStkICodeIs": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PdnStkICodeRc": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PdnSftCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PdnRawInQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PdnWipInQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PdnRghInQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PdnRwkInQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PdnRejInQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PdnTdfInQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PdnRawOutQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PdnWipOutQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PdnFinOutQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PdnRghOutQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PdnRwkOutQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PdnRejOutQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PdnTdfOutQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PdnConsQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PdnCycleTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PdnCTQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True  ''' future provision
.AddColumn: .ColumnName() = "PdnTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PdnReqdQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PdnCompQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PdnCompTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PdnNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PdnRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "PdnICode"
Rem index definition
.AddIndex: .IndexName() = "PdnCodeICode": .IndexColumn1() = "PdnCode": .IndexColumn2() = "PdnICode"
.AddIndex: .IndexName() = "PdnCodeSNo": .IndexColumn1() = "PdnCode": .IndexColumn2() = "PdnSno"

.CreateTable dbTlgCatalog
End With

With clsDB
.ClearTableStru
.TableName = "MacProdn_Log"
Rem field definitions
.AddColumn: .ColumnName() = "PdnCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PdnICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PdnSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PdnDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PdnItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PdnItmRefCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PdnMacCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PdnEmpCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PdnMprCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PdnStkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PdnStkICodeIs": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PdnStkICodeRc": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PdnSftCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PdnRawInQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PdnWipInQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PdnRghInQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PdnRwkInQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PdnRejInQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PdnTdfInQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PdnRawOutQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PdnWipOutQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PdnFinOutQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PdnRghOutQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PdnRwkOutQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PdnRejOutQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PdnTdfOutQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PdnConsQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PdnCycleTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PdnCTQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True  ''' future provision
.AddColumn: .ColumnName() = "PdnTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PdnReqdQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PdnCompQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PdnCompTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PdnNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PdnRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "PdnICode"
Rem index definition
.AddIndex: .IndexName() = "PdnICode": .IndexColumn1() = "PdnICode"
.AddIndex: .IndexName() = "PdnCodeICode": .IndexColumn1() = "PdnCode": .IndexColumn2() = "PdnICode"
.AddIndex: .IndexName() = "PdnCodeSNo": .IndexColumn1() = "PdnCode": .IndexColumn2() = "PdnSno"

.CreateTable dbTlgCatalog
End With

With clsDB
.ClearTableStru
.TableName = "ForgProdn"
Rem field definitions
.AddColumn: .ColumnName() = "FpnCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "FpnICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "FpnSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "FpnDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "FpnItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "FpnItmRefCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "FpnMacCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "FpnEmpCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "FpnMprCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "FpnStkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "FpnStkICodeIs": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "FpnStkICodeRc": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "FpnSftCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "FpnRawInWeight": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "FpnUnitWeight": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "FpnUnitNos": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "FpnRawInNos": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "FpnFinOutWeight": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "FpnFinOutNos": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "FpnRejOutWeight": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "FpnRejOutNos": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "FpnConsWeight": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "FpnConsNos": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "FpnWtCycleTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "FpnNosCycleTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "FpnCTWeight": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True  ''' future provision
.AddColumn: .ColumnName() = "FpnCTNos": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True  ''' future provision
.AddColumn: .ColumnName() = "FpnTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "FpnReqdWeight": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "FpnReqdNos": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "FpnCompWeight": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "FpnCompNos": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "FpnCompTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "FpnNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "FpnRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "FpnICode"
Rem index definition
.AddIndex: .IndexName() = "FpnCodeICode": .IndexColumn1() = "FpnCode": .IndexColumn2() = "FpnICode"
.AddIndex: .IndexName() = "FpnCodeSNo": .IndexColumn1() = "FpnCode": .IndexColumn2() = "FpnSno"

.CreateTable dbTlgCatalog
End With

With clsDB
.ClearTableStru
.TableName = "ForgProdn_Log"
Rem field definitions
.AddColumn: .ColumnName() = "FpnCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "FpnICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "FpnSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "FpnDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "FpnItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "FpnItmRefCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "FpnMacCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "FpnEmpCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "FpnMprCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "FpnStkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "FpnStkICodeIs": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "FpnStkICodeRc": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "FpnSftCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "FpnRawInWeight": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "FpnUnitWeight": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "FpnUnitNos": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "FpnRawInNos": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "FpnFinOutWeight": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "FpnFinOutNos": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "FpnRejOutWeight": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "FpnRejOutNos": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "FpnConsWeight": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "FpnConsNos": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "FpnWtCycleTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "FpnNosCycleTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "FpnCTWeight": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True  ''' future provision
.AddColumn: .ColumnName() = "FpnCTNos": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True  ''' future provision
.AddColumn: .ColumnName() = "FpnTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "FpnReqdWeight": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "FpnReqdNos": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "FpnCompWeight": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "FpnCompNos": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "FpnCompTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "FpnNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "FpnRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "FpnICode"
Rem index definition
.AddIndex: .IndexName() = "FpnICode": .IndexColumn1() = "FpnICode"
.AddIndex: .IndexName() = "FpnCodeICode": .IndexColumn1() = "FpnCode": .IndexColumn2() = "FpnICode"
.AddIndex: .IndexName() = "FpnCodeSNo": .IndexColumn1() = "FpnCode": .IndexColumn2() = "FpnSno"

.CreateTable dbTlgCatalog
End With

With clsDB
.ClearTableStru
.TableName = "MatPacking"
Rem field definitions
.AddColumn: .ColumnName() = "MpkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MpkICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "MpkSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MpkDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MpkItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MpkItmRefCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MpkEmpCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MpkStkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MpkStkICodeIs": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MpkStkICodeRc": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MpkBoxQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MpkPerBoxItmQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MpkItmQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MpkNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "MpkRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "MpkICode"
Rem index definition
.AddIndex: .IndexName() = "MpkCodeICode": .IndexColumn1() = "MpkCode": .IndexColumn2() = "MpkICode"
.AddIndex: .IndexName() = "MpkCodeSNo": .IndexColumn1() = "MpkCode": .IndexColumn2() = "MpkSno"

.CreateTable dbTlgCatalog
End With

With clsDB
.ClearTableStru
.TableName = "MatPacking_Log"
Rem field definitions
.AddColumn: .ColumnName() = "MpkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MpkICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MpkSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MpkDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MpkItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MpkItmRefCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MpkEmpCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MpkStkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MpkStkICodeIs": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MpkStkICodeRc": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MpkBoxQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MpkPerBoxItmQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MpkItmQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MpkNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "MpkRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "MpkICode"
Rem index definition
.AddIndex: .IndexName() = "MpkICode": .IndexColumn1() = "MpkICode"
.AddIndex: .IndexName() = "MpkCodeICode": .IndexColumn1() = "MpkCode": .IndexColumn2() = "MpkICode"
.AddIndex: .IndexName() = "MpkCodeSNo": .IndexColumn1() = "MpkCode": .IndexColumn2() = "MpkSno"

.CreateTable dbTlgCatalog
End With

With clsDB
.ClearTableStru
.TableName = "MatDispatch"
Rem field definitions
.AddColumn: .ColumnName() = "MdpCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MdpICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "MdpSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MdpDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MdpItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MdpItmRefCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MdpEmpCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MdpStkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MdpStkICodeIs": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MdpStkICodeRc": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MdpBoxQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MdpPerBoxItmQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MdpItmQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MdpNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "MdpRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "MdpICode"
Rem index definition
.AddIndex: .IndexName() = "MdpCodeICode": .IndexColumn1() = "MdpCode": .IndexColumn2() = "MdpICode"
.AddIndex: .IndexName() = "MdpCodeSNo": .IndexColumn1() = "MdpCode": .IndexColumn2() = "MdpSno"

.CreateTable dbTlgCatalog
End With

With clsDB
.ClearTableStru
.TableName = "MatDispatch_Log"
Rem field definitions
.AddColumn: .ColumnName() = "MdpCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MdpICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MdpSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MdpDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MdpItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MdpItmRefCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MdpEmpCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MdpStkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MdpStkICodeIs": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MdpStkICodeRc": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MdpBoxQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MdpPerBoxItmQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MdpItmQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MdpNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = False: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "MdpRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "MdpICode"
Rem index definition
.AddIndex: .IndexName() = "MdpICode": .IndexColumn1() = "MdpICode"
.AddIndex: .IndexName() = "MdpCodeICode": .IndexColumn1() = "MdpCode": .IndexColumn2() = "MdpICode"
.AddIndex: .IndexName() = "MdpCodeSNo": .IndexColumn1() = "MdpCode": .IndexColumn2() = "MdpSno"

.CreateTable dbTlgCatalog
End With

InfoBox dbTlgCatalog.ActiveConnection.Properties("Data Source Name") & ", Done !!!"

CloseDataSource dbTlgDatabase

EndSub:
Set dbTlgCatalog = Nothing
Set dbTlgDatabase = Nothing
Set clsDB = Nothing
Exit Sub

End Sub

Public Sub CreateTlgComDatabase()
Dim mTableStru As adTableStru, dbComDatabase As New ADODB.Connection, dbComCatalog As New ADOX.Catalog, clsDB As clsDataStru

Rem must be created from common data structure i.e. Acnting
'''If Dir(dbComDatabaseFullPath) = "" Then
'''    dbComCatalog.Create "Provider=" & DbProvider & ";Data Source=" & dbComDatabaseFullPath
'''    Set dbComCatalog = Nothing
'''End If
OpenComDataSource dbComDatabase, mExclusiveMode:=True
If dbComDatabase.State <> 1 Then
    ErrorBox Err.Description
    Exit Sub
End If
Set dbComCatalog.ActiveConnection = dbComDatabase
Set clsDB = New clsDataStru

clsDB.ClearTableStru    ' by programmer mistake it is not getting used anywhere in link table procedure

Rem link table *****************************************************************************
With clsDB
.ClearLinkStru
.AddLink: .LinkTableName() = "VendMast": .LinkDbSource() = dbTlgDatabaseFullPath

.CreateLink dbComCatalog
End With

InfoBox dbComCatalog.ActiveConnection.Properties("Data Source Name") & ", Done !!!"

Set clsDB = Nothing
Set dbComCatalog = Nothing
CloseDataSource dbComDatabase

End Sub

