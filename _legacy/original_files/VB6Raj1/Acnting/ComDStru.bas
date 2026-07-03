Attribute VB_Name = "CommonDataStru"
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

Public Type adViewStru
ViewName As String
CommandStr As String
CreateStatus As Integer

End Type

Public Type adLinkStru
TableName() As Variant
LinkName() As Variant
dbSource() As Variant
LinkStatus() As Variant

End Type

Public Sub CreateAcDatabase(ByVal mAddMode As Boolean, Optional ByRef FormProgStatus As frmProgressStatus)
Dim mTableStru As adTableStru, dbAcDatabase As New ADODB.Connection, dbAcCatalog As New ADOX.Catalog, clsDB As clsDataStru

If mAddMode = True Then
    If Dir(dbAcDatabaseFullPath) = "" Then
        dbAcCatalog.Create "Provider=" & DbProvider & ";Data Source=" & dbAcDatabaseFullPath
        Set dbAcCatalog = Nothing
    Else
        ErrorBox "Database " & dbAcDatabaseFullPath & " already exist !!!"
        GoTo EndSub
    End If
End If
OpenAcDataSource dbAcDatabase, mExclusiveMode:=True
If dbAcDatabase.State <> 1 Then
    ErrorBox Err.Description
    GoTo EndSub
End If
Set dbAcCatalog.ActiveConnection = dbAcDatabase
Set clsDB = New clsDataStru
If Not FormProgStatus Is Nothing Then
    If FormProgStatus.Visible = True Then
        Set clsDB.FormProgStatus = FormProgStatus
        FormProgStatus.pbar1.Min = 0: FormProgStatus.pbar1.Max = 12
    End If
End If

With clsDB
.ClearTableStru
.TableName = "AchdMast"
Rem field definitions
.AddColumn: .ColumnName() = "AhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "AhName": .ColumnType() = adVarWChar: .ColumnWidth() = 60: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "AhDepends": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
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
.AddColumn: .ColumnName() = "AhName": .ColumnType() = adVarWChar: .ColumnWidth() = 60: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "AhDepends": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "AhRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition

Rem index definition
.AddIndex: .IndexName() = "AhCode": .IndexColumn1() = "AhCode"
.AddIndex: .IndexName() = "AhName": .IndexColumn1() = "AhName"

.CreateTable dbAcCatalog
End With

With clsDB
.ClearTableStru
.TableName = "JrnHdr"
Rem field definitions
.AddColumn: .ColumnName() = "JhrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "JhrVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JhrPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JhrVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JhrPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JhrDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JhrAhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JhrAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JhrNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 250: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JhrCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JhrAutoGen": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JhrRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "JhrCode"
Rem index definition
.AddIndex: .IndexName() = "JhrDate": .IndexColumn1() = "JhrDate"

.CreateTable dbAcCatalog
End With

With clsDB
.ClearTableStru
.TableName = "JrnHdr_Log"
Rem field definitions
.AddColumn: .ColumnName() = "JhrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JhrVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JhrPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JhrVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JhrPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JhrDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JhrAhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JhrAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JhrNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 250: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JhrCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JhrAutoGen": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JhrRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "JhrCode"
Rem index definition
.AddIndex: .IndexName() = "JhrCode": .IndexUnique() = True: .IndexColumn1() = "JhrCode"
.AddIndex: .IndexName() = "JhrDate": .IndexColumn1() = "JhrDate"

.CreateTable dbAcCatalog
End With

With clsDB
.ClearTableStru
.TableName = "Journal"
Rem field definitions
.AddColumn: .ColumnName() = "JrnCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrnICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "JrnSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrnVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrnPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JrnVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrnPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JrnDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrnAhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrnAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JrnNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 250: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JrnLAhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JrnCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrnAutoGen": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrnRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
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
.AddColumn: .ColumnName() = "JrnVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrnPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JrnVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrnPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JrnDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrnAhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrnAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JrnNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 250: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JrnLAhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JrnCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrnAutoGen": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrnRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition

Rem index definition
.AddIndex: .IndexName() = "JrnICode": .IndexUnique() = True: .IndexColumn1() = "JrnICode"
.AddIndex: .IndexName() = "JrnCodeICode": .IndexColumn1() = "JrnCode": .IndexColumn2() = "JrnICode"
.AddIndex: .IndexName() = "JrnCodeSNo": .IndexColumn1() = "JrnCode": .IndexColumn2() = "JrnSno"

.CreateTable dbAcCatalog
End With

With clsDB
.ClearTableStru
.TableName = "StsnMast"
Rem field definitions
.AddColumn: .ColumnName() = "StnCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "StnName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "StnRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "StnCode"
Rem index definition
.AddIndex: .IndexName() = "StnName": .IndexUnique() = True: .IndexColumn1() = "StnName"

.CreateTable dbAcCatalog
End With

With clsDB
.ClearTableStru
.TableName = "StsnMast_Log"
Rem field definitions
.AddColumn: .ColumnName() = "StnCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "StnName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "StnRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "StnCode"
Rem index definition
.AddIndex: .IndexName() = "StnCode": .IndexUnique() = True: .IndexColumn1() = "StnCode"
.AddIndex: .IndexName() = "StnName": .IndexUnique() = True: .IndexColumn1() = "StnName"

.CreateTable dbAcCatalog
End With

With clsDB
.ClearTableStru
.TableName = "AreaMast"
Rem field definitions
.AddColumn: .ColumnName() = "AraCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "AraName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "AraStnCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "AraRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "AraCode"
Rem index definition
.AddIndex: .IndexName() = "AraName": .IndexUnique() = True: .IndexColumn1() = "AraName"

.CreateTable dbAcCatalog
End With

With clsDB
.ClearTableStru
.TableName = "AreaMast_Log"
Rem field definitions
.AddColumn: .ColumnName() = "AraCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "AraName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "AraStnCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "AraRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "AraCode"
Rem index definition
.AddIndex: .IndexName() = "AraCode": .IndexUnique() = True: .IndexColumn1() = "AraCode"
.AddIndex: .IndexName() = "AraName": .IndexUnique() = True: .IndexColumn1() = "AraName"

.CreateTable dbAcCatalog
End With

With clsDB
.ClearTableStru
.TableName = "VTypMast"
Rem field definitions
.AddColumn: .ColumnName() = "VtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "VtmName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VtmAbvr": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VtmSysCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VtmEditable": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VtmPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VtmPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VtmItmNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 250: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VtmComNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 250: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VtmStartNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VtmResetNoBasis": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VtmIndex": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VtmShowInList": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VtmRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "VtmCode"
Rem index definition
.AddIndex: .IndexName() = "VtmName": .IndexUnique() = True: .IndexColumn1() = "VtmName"

.CreateTable dbAcCatalog
End With

With clsDB
.ClearTableStru
.TableName = "VTypMast_Log"
Rem field definitions
.AddColumn: .ColumnName() = "VtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VtmName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VtmAbvr": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VtmSysCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "VtmEditable": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VtmPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VtmPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VtmItmNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 250: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VtmComNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 250: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VtmStartNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VtmResetNoBasis": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VtmIndex": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VtmShowInList": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "VtmRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "VtmCode"
Rem index definition
.AddIndex: .IndexName() = "VtmCode": .IndexUnique() = True: .IndexColumn1() = "VtmCode"
.AddIndex: .IndexName() = "VtmName": .IndexUnique() = True: .IndexColumn1() = "VtmName"

.CreateTable dbAcCatalog
End With


Rem InfoBox dbAcCatalog.ActiveConnection.Properties("Data Source Name") & ", Done !!!"

CloseDataSource dbAcDatabase

EndSub:
Set dbAcCatalog = Nothing
Set dbAcDatabase = Nothing
Set clsDB = Nothing
Exit Sub

End Sub

Public Sub CreateStDatabase(ByVal mAddMode As Boolean, Optional ByRef FormProgStatus As frmProgressStatus)
Dim mTableStru As adTableStru, dbStDatabase As New ADODB.Connection, dbStCatalog As New ADOX.Catalog, clsDB As clsDataStru

If mAddMode = True Then
    If Dir(dbStDatabaseFullPath) = "" Then
        dbStCatalog.Create "Provider=" & DbProvider & ";Data Source=" & dbStDatabaseFullPath
        Set dbStCatalog = Nothing
    Else
        ErrorBox "Database " & dbStDatabaseFullPath & " already exist !!!"
        GoTo EndSub
    End If
End If

OpenStDataSource dbStDatabase, mExclusiveMode:=True
If dbStDatabase.State <> 1 Then
    ErrorBox Err.Description
    GoTo EndSub
End If
Set dbStCatalog.ActiveConnection = dbStDatabase
Set clsDB = New clsDataStru
If Not FormProgStatus Is Nothing Then
    If FormProgStatus.Visible = True Then
        Set clsDB.FormProgStatus = FormProgStatus
        FormProgStatus.pbar1.Min = 0: FormProgStatus.pbar1.Max = 8
    End If
End If

With clsDB
.ClearTableStru
.TableName = "ProdMast"
Rem field definitions
.AddColumn: .ColumnName() = "ItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "ItmName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ItmDesc": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ItmDepends": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
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
.AddColumn: .ColumnName() = "ItmDesc": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ItmDepends": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
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
.AddColumn: .ColumnName() = "ItrRef1Name": .ColumnType() = adVarWChar: .ColumnWidth() = 25: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ItrRef2Name": .ColumnType() = adVarWChar: .ColumnWidth() = 25: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ItrStkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ItrStkICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ItrRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ItrPRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ItrMRP": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ItrSRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ItrCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ItrRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "ItrRefCode"
Rem index definition
.AddIndex: .IndexName() = "ItrItmCodeRefCode": .IndexColumn1() = "ItrItmCode": .IndexColumn2() = "ItrRefCode"
.AddIndex: .IndexName() = "ItrStkCodeICode": .IndexColumn1() = "ItrStkCode": .IndexColumn2() = "ItrStkICode"

.CreateTable dbStCatalog
End With

With clsDB
.ClearTableStru
.TableName = "ProdRef_Log"
Rem field definitions
.AddColumn: .ColumnName() = "ItrRefCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ItrItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ItrRef1Name": .ColumnType() = adVarWChar: .ColumnWidth() = 25: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ItrRef2Name": .ColumnType() = adVarWChar: .ColumnWidth() = 25: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ItrStkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ItrStkICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ItrRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ItrPRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ItrMRP": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ItrSRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ItrCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ItrRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "ItrRefCode"
Rem index definition
.AddIndex: .IndexName() = "ItrRefCode": .IndexColumn1() = "ItrRefCode"
.AddIndex: .IndexName() = "ItrItmCodeRefCode": .IndexColumn1() = "ItrItmCode": .IndexColumn2() = "ItrRefCode"
.AddIndex: .IndexName() = "ItrStkCodeICode": .IndexColumn1() = "ItrStkCode": .IndexColumn2() = "ItrStkICode"

.CreateTable dbStCatalog
End With

With clsDB
.ClearTableStru
.TableName = "StockHdr"
Rem field definitions
.AddColumn: .ColumnName() = "ShrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "ShrVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ShrPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ShrVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ShrPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ShrDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ShrQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ShrValue": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ShrNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ShrAutoGen": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ShrCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ShrRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "ShrCode"
Rem index definition
.AddIndex: .IndexName() = "ShrDate": .IndexColumn1() = "ShrDate"

.CreateTable dbStCatalog
End With

With clsDB
.ClearTableStru
.TableName = "StockHdr_Log"
Rem field definitions
.AddColumn: .ColumnName() = "ShrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ShrVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ShrPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ShrVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ShrPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ShrDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ShrQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ShrValue": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ShrNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ShrAutoGen": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ShrCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ShrRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "ShrCode"
Rem index definition
.AddIndex: .IndexName() = "ShrCode": .IndexUnique() = True: .IndexColumn1() = "ShrCode"
.AddIndex: .IndexName() = "ShrDate": .IndexColumn1() = "ShrDate"

.CreateTable dbStCatalog
End With

With clsDB
.ClearTableStru
.TableName = "StockJrn"
Rem field definitions
.AddColumn: .ColumnName() = "StkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "StkICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "StkSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "StkVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "StkPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "StkVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "StkPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "StkDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "StkItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "StkItmRefCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "StkQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "StkRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "StkValue": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "StkNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "StkLItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "StkAutoGen": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "StkCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "StkRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "StkICode"
Rem index definition
.AddIndex: .IndexName() = "StkCodeICode": .IndexColumn1() = "StkCode": .IndexColumn2() = "StkICode"
.AddIndex: .IndexName() = "StkCodeSNo": .IndexColumn1() = "StkCode": .IndexColumn2() = "StkSno"
.AddIndex: .IndexName() = "StkCodeItmCodeItmRefCode": .IndexColumn1() = "StkCode": .IndexColumn2() = "StkItmCode": .IndexColumn3() = "StkItmRefCode"
.AddIndex: .IndexName() = "StkItmCodeItmRefCode": .IndexColumn1() = "StkItmCode": .IndexColumn2() = "StkItmRefCode"
.AddIndex: .IndexName() = "StkItmRefCodeItmCode": .IndexColumn1() = "StkItmRefCode": .IndexColumn2() = "StkItmCode"
.AddIndex: .IndexName() = "StkDate": .IndexColumn1() = "StkDate"

.CreateTable dbStCatalog
End With

With clsDB
.ClearTableStru
.TableName = "StockJrn_Log"
Rem field definitions
.AddColumn: .ColumnName() = "StkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "StkICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "StkSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "StkVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "StkPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "StkVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "StkPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "StkDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "StkItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "StkItmRefCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "StkQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "StkRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "StkValue": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "StkNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "StkLItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "StkAutoGen": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "StkCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "StkRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "StkICode"
Rem index definition
.AddIndex: .IndexName() = "StkICode": .IndexColumn1() = "StkICode"
.AddIndex: .IndexName() = "StkCodeICode": .IndexColumn1() = "StkCode": .IndexColumn2() = "StkICode"
.AddIndex: .IndexName() = "StkCodeSNo": .IndexColumn1() = "StkCode": .IndexColumn2() = "StkSno"
.AddIndex: .IndexName() = "StkCodeItmCodeItmRefCode": .IndexColumn1() = "StkCode": .IndexColumn2() = "StkItmCode": .IndexColumn3() = "StkItmRefCode"
.AddIndex: .IndexName() = "StkItmCodeItmRefCode": .IndexColumn1() = "StkItmCode": .IndexColumn2() = "StkItmRefCode"
.AddIndex: .IndexName() = "StkItmRefCodeItmCode": .IndexColumn1() = "StkItmRefCode": .IndexColumn2() = "StkItmCode"
.AddIndex: .IndexName() = "StkDate": .IndexColumn1() = "StkDate"

.CreateTable dbStCatalog
End With

Rem InfoBox dbStCatalog.ActiveConnection.Properties("Data Source Name") & ", Done !!!"

CloseDataSource dbStDatabase

EndSub:
Set dbStCatalog = Nothing
Set dbStDatabase = Nothing
Set clsDB = Nothing
Exit Sub

End Sub

Public Sub CreateGrpDatabase(ByVal mAddMode As Boolean, Optional ByRef FormProgStatus As frmProgressStatus)
Dim mTableStru As adTableStru, dbGrpDatabase As New ADODB.Connection, dbGrpCatalog As New ADOX.Catalog, clsDB As clsDataStru

If mAddMode = True Then
    If Dir(dbGrpDatabaseFullPath) = "" Then
        dbGrpCatalog.Create "Provider=" & DbProvider & ";Data Source=" & dbGrpDatabaseFullPath
        Set dbGrpCatalog = Nothing
    Else
        ErrorBox "Database " & dbGrpDatabaseFullPath & " already exist !!!"
        GoTo EndSub
    End If
End If
OpenGrpDataSource dbGrpDatabase, mExclusiveMode:=True
If dbGrpDatabase.State <> 1 Then
    ErrorBox Err.Description
    GoTo EndSub
End If
Set dbGrpCatalog.ActiveConnection = dbGrpDatabase
Set clsDB = New clsDataStru
If Not FormProgStatus Is Nothing Then
    If FormProgStatus.Visible = True Then
        Set clsDB.FormProgStatus = FormProgStatus
        FormProgStatus.pbar1.Min = 0: FormProgStatus.pbar1.Max = 2
    End If
End If

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
.AddIndex: .IndexName() = "GasAhCodeDate": .IndexColumn1() = "GasAhCode": .IndexColumn2() = "GasDate"
.AddIndex: .IndexName() = "GasDateAhCode": .IndexColumn1() = "GasDate": .IndexColumn2() = "GasAhCode"

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
.AddIndex: .IndexName() = "GpsItmCodeDate": .IndexColumn1() = "GpsItmCode": .IndexColumn2() = "GpsDate"
.AddIndex: .IndexName() = "GpsDateItmCode": .IndexColumn1() = "GpsDate": .IndexColumn2() = "GpsItmCode"

.CreateTable dbGrpCatalog
End With

Rem InfoBox dbGrpCatalog.ActiveConnection.Properties("Data Source Name") & ", Done !!!"

CloseDataSource dbGrpDatabase

EndSub:
Set dbGrpCatalog = Nothing
Set dbGrpDatabase = Nothing
Set clsDB = Nothing
Exit Sub

End Sub

Public Sub CreateComDatabase(ByVal mAddMode As Boolean, Optional ByRef FormProgStatus As frmProgressStatus)
Dim mTableStru As adTableStru, dbComDatabase As New ADODB.Connection, dbComCatalog As New ADOX.Catalog, clsDB As clsDataStru

If mAddMode = True Then
    If Dir(dbComDatabaseFullPath) = "" Then
        dbComCatalog.Create "Provider=" & DbProvider & ";Data Source=" & dbComDatabaseFullPath
        Set dbComCatalog = Nothing
    Else
        ErrorBox "Database " & dbComDatabaseFullPath & " already exist !!!"
        GoTo EndSub
    End If
End If

OpenComDataSource dbComDatabase, mExclusiveMode:=True
If dbComDatabase.State <> 1 Then
    ErrorBox Err.Description
    GoTo EndSub
End If
Set dbComCatalog.ActiveConnection = dbComDatabase
Set clsDB = New clsDataStru
If Not FormProgStatus Is Nothing Then
    If FormProgStatus.Visible = True Then
        Set clsDB.FormProgStatus = FormProgStatus
        FormProgStatus.pbar1.Min = 0: FormProgStatus.pbar1.Max = 16
    End If
End If

With clsDB
.ClearTableStru
.TableName = "TmpSession"
Rem field definitions
.AddColumn: .ColumnName() = "TssICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "TssCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "TssUsrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "TssModule": .ColumnType() = adVarWChar: .ColumnWidth() = 30: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "TssDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "TssTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "TssRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
Rem primary key definition
.PrimaryKey = "TssICode"
Rem index definition
.AddIndex: .IndexName() = "TssCode": .IndexColumn1() = "TssCode"
.AddIndex: .IndexName() = "TssUsrCode": .IndexColumn1() = "TssUsrCode"

.CreateTable dbComCatalog
End With

With clsDB
.ClearTableStru
.TableName = "NetwVchNoLog"
Rem field definitions
.AddColumn: .ColumnName() = "NvlCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "NvlLoginCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "NvlUsrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "NvlModuleCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "NvlModuleName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "NvlVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "NvlVchDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "NvlVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "NvlLogDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "NvlLogTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "NvlSysComputer": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "NvlSysUser": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "NvlRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "NvlCmpCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "NvlRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "NvlCode"
Rem index definition
.AddIndex: .IndexName() = "NvlVtmCode": .IndexColumn1() = "NvlVtmCode"

.CreateTable dbComCatalog
End With

clsDB.ClearTableStru    ' by programmer mistake it is not getting used anywhere in link table procedure

Rem link table *****************************************************************************
With clsDB
.ClearLinkStru
.AddLink: .LinkTableName() = "VTypMast": .LinkDbSource() = dbAcDatabaseFullPath
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
.AddLink: .LinkTableName() = "AreaMast": .LinkDbSource() = dbAcDatabaseFullPath
.AddLink: .LinkTableName() = "StsnMast": .LinkDbSource() = dbAcDatabaseFullPath

.CreateLink dbComCatalog
End With

Rem InfoBox dbComCatalog.ActiveConnection.Properties("Data Source Name") & ", Done !!!"

CloseDataSource dbComDatabase

EndSub:
Set dbComCatalog = Nothing
Set dbComDatabase = Nothing
Set clsDB = Nothing
Exit Sub

End Sub

