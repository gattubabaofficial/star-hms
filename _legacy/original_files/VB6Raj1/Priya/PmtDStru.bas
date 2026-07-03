Attribute VB_Name = "PmtDataStru"

Option Explicit

Public Sub CreatePmtCmpDatabase(ByVal mAddMode As Boolean)
Dim mTableStru As adTableStru, dbCmpDatabase As New ADODB.Connection, dbCmpCatalog As New ADOX.Catalog, clsDB As clsDataStru

If mAddMode = True Then
    If Dir(dbCmpDatabaseFullPath) = "" Then
        dbCmpCatalog.Create "Provider=" & DbProvider & ";Data Source=" & dbCmpDatabaseFullPath
        Set dbCmpCatalog = Nothing
    Else
        ErrorBox "Database " & dbCmpDatabaseFullPath & " already exist !!!"
        GoTo EndSub
    End If
End If
OpenCmpDataSource dbCmpDatabase, mExclusiveMode:=True
If dbCmpDatabase.State <> 1 Then
    ErrorBox Err.Description
    GoTo EndSub
End If
Set dbCmpCatalog.ActiveConnection = dbCmpDatabase
Set clsDB = New clsDataStru

With clsDB
.ClearTableStru
.TableName = "Company"
Rem field definitions
.AddColumn: .ColumnName() = "CmpCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "CmpName": .ColumnType() = adVarWChar: .ColumnWidth() = 60: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "CmpBooksDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "CmpFYStartDt": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "CmpFYEndDt": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "CmpAddress": .ColumnType() = adVarWChar: .ColumnWidth() = 200: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "CmpCity": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "CmpDistrict": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "CmpState": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "CmpReg1": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "CmpReg2": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "CmpReg3": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "CmpContPer": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "CmpOPhone": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "CmpRPhone": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "CmpFax": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "CmpEmail": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "CmpWebsite": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "CmpJurisdiction": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "CmpSecPwd": .ColumnType() = adVarWChar: .ColumnWidth() = 20: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "CmpRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "CmpCode"
Rem index definition
.AddIndex: .IndexName() = "CmpName": .IndexColumn1() = "CmpName"

.CreateTable dbCmpCatalog
End With

With clsDB
.ClearTableStru
.TableName = "SecuMast"
Rem field definitions
.AddColumn: .ColumnName() = "SecCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "SecName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SecRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "SecCode"
Rem index definition
.AddIndex: .IndexName() = "SecName": .IndexUnique() = True: .IndexColumn1() = "SecName"

.CreateTable dbCmpCatalog
End With

With clsDB
.ClearTableStru
.TableName = "SecuMast_Log"
Rem field definitions
.AddColumn: .ColumnName() = "SecCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SecName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SecRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "SecCode"
Rem index definition
.AddIndex: .IndexName() = "SecCode": .IndexUnique() = True: .IndexColumn1() = "SecCode"
.AddIndex: .IndexName() = "SecName": .IndexUnique() = True: .IndexColumn1() = "SecName"

.CreateTable dbCmpCatalog
End With

With clsDB
.ClearTableStru
.TableName = "UserMast"
Rem field definitions
.AddColumn: .ColumnName() = "UsrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "UsrName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "UsrSecCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "UsrRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "UsrCode"
Rem index definition
.AddIndex: .IndexName() = "UsrName": .IndexUnique() = True: .IndexColumn1() = "UsrName"

.CreateTable dbCmpCatalog
End With

With clsDB
.ClearTableStru
.TableName = "UserMast_Log"
Rem field definitions
.AddColumn: .ColumnName() = "UsrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "UsrName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "UsrSecCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "UsrRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "UsrCode"
Rem index definition
.AddIndex: .IndexName() = "UsrName": .IndexUnique() = True: .IndexColumn1() = "UsrName"

.CreateTable dbCmpCatalog
End With


InfoBox dbCmpCatalog.ActiveConnection.Properties("Data Source Name") & ", Done !!!"

CloseDataSource dbCmpDatabase

EndSub:
Set dbCmpCatalog = Nothing
Set dbCmpDatabase = Nothing
Set clsDB = Nothing
Exit Sub

End Sub

Public Sub CreatePmtMastDatabase(ByVal mAddMode As Boolean)
Dim mTableStru As adTableStru, dbPmtDatabase As New ADODB.Connection, dbPmtCatalog As New ADOX.Catalog, clsDB As clsDataStru

If mAddMode = True Then
    If Dir(dbPmtDatabaseFullPath) = "" Then
        dbPmtCatalog.Create "Provider=" & DbProvider & ";Data Source=" & dbPmtDatabaseFullPath
        Set dbPmtCatalog = Nothing
    Else
        ErrorBox "Database " & dbPmtDatabaseFullPath & " already exist !!!"
        GoTo EndSub
    End If
End If

OpenPmtDataSource dbPmtDatabase, mExclusiveMode:=True
If dbPmtDatabase.State <> 1 Then
    ErrorBox Err.Description
    GoTo EndSub
End If
Set dbPmtCatalog.ActiveConnection = dbPmtDatabase
Set clsDB = New clsDataStru

With clsDB
.ClearTableStru
.TableName = "SubItmMast"
Rem field definitions
.AddColumn: .ColumnName() = "SimCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "SimName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SimItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SimDepends": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SimRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "SimCode"
Rem index definition
.AddIndex: .IndexName() = "SimName": .IndexUnique() = True: .IndexColumn1() = "SimName"

.CreateTable dbPmtCatalog
End With

With clsDB
.ClearTableStru
.TableName = "SubItmMast_Log"
Rem field definitions
.AddColumn: .ColumnName() = "SimCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SimName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SimItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SimDepends": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SimRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "SimCode"
Rem index definition
.AddIndex: .IndexName() = "SimCode": .IndexUnique() = True: .IndexColumn1() = "SimCode"
.AddIndex: .IndexName() = "SimName": .IndexUnique() = True: .IndexColumn1() = "SimName"

.CreateTable dbPmtCatalog
End With

With clsDB
.ClearTableStru
.TableName = "PartyMast"
Rem field definitions
.AddColumn: .ColumnName() = "PrtCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "PrtName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PrtAhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PrtAddr": .ColumnType() = adVarWChar: .ColumnWidth() = 250: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PrtAraCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PrtStnCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PrtTelNo": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PrtSMSNo": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PrtEmail": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PrtShowInList": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PrtRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PrtRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "PrtCode"
Rem index definition
.AddIndex: .IndexName() = "PrtName": .IndexUnique() = True: .IndexColumn1() = "PrtName"

.CreateTable dbPmtCatalog
End With

With clsDB
.ClearTableStru
.TableName = "PartyMast_Log"
Rem field definitions
.AddColumn: .ColumnName() = "PrtCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PrtName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PrtAhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PrtAddr": .ColumnType() = adVarWChar: .ColumnWidth() = 250: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PrtAraCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PrtStnCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PrtTelNo": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PrtSMSNo": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PrtEmail": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PrtShowInList": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PrtRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PrtRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "PrtCode"
Rem index definition
.AddIndex: .IndexName() = "PrtCode": .IndexUnique() = True: .IndexColumn1() = "PrtCode"
.AddIndex: .IndexName() = "PrtName": .IndexUnique() = True: .IndexColumn1() = "PrtName"

.CreateTable dbPmtCatalog
End With







'With clsDB
'.ClearTableStru
'.TableName = "PatCatgMst"
'Rem field definitions
'.AddColumn: .ColumnName() = "PcgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
'.AddColumn: .ColumnName() = "PcgName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "PcgInfAllowed": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PcgDefAllowed": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PcgDiscAllowed": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PcgDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PcgShowInList": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PcgRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'.PrimaryKey = "PcgCode"
'Rem index definition
'.AddIndex: .IndexName() = "PcgName": .IndexUnique() = True: .IndexColumn1() = "PcgName"
'
'.CreateTable dbPmtCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "PatCatgMst_Log"
'Rem field definitions
'.AddColumn: .ColumnName() = "PcgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "PcgName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "PcgInfAllowed": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PcgDefAllowed": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PcgDiscAllowed": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PcgDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PcgShowInList": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PcgRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'Rem .PrimaryKey = "PcgCode"
'Rem index definition
'.AddIndex: .IndexName() = "PcgCode": .IndexUnique() = True: .IndexColumn1() = "PcgCode"
'.AddIndex: .IndexName() = "PcgName": .IndexUnique() = True: .IndexColumn1() = "PcgName"
'
'.CreateTable dbPmtCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "DoctCatgMst"
'Rem field definitions
'.AddColumn: .ColumnName() = "DcgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
'.AddColumn: .ColumnName() = "DcgName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "DcgRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'.PrimaryKey = "DcgCode"
'Rem index definition
'.AddIndex: .IndexName() = "DcgName": .IndexUnique() = True: .IndexColumn1() = "DcgName"
'
'.CreateTable dbPmtCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "DoctCatgMst_Log"
'Rem field definitions
'.AddColumn: .ColumnName() = "DcgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "DcgName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "DcgRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'.PrimaryKey = "DcgCode"
'Rem index definition
'.AddIndex: .IndexName() = "DcgName": .IndexUnique() = True: .IndexColumn1() = "DcgName"
'
'.CreateTable dbPmtCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "RefCatgMst"
'Rem field definitions
'.AddColumn: .ColumnName() = "RfgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
'.AddColumn: .ColumnName() = "RfgName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "RfgRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'.PrimaryKey = "RfgCode"
'Rem index definition
'.AddIndex: .IndexName() = "RfgName": .IndexUnique() = True: .IndexColumn1() = "RfgName"
'
'.CreateTable dbPmtCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "RefCatgMst_Log"
'Rem field definitions
'.AddColumn: .ColumnName() = "RfgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "RfgName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "RfgRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'Rem .PrimaryKey = "RfgCode"
'Rem index definition
'.AddIndex: .IndexName() = "RfgCode": .IndexUnique() = True: .IndexColumn1() = "RfgCode"
'.AddIndex: .IndexName() = "RfgName": .IndexUnique() = True: .IndexColumn1() = "RfgName"
'
'.CreateTable dbPmtCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "DoctMast"
'Rem field definitions
'.AddColumn: .ColumnName() = "DctCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
'.AddColumn: .ColumnName() = "DctName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "DctSpeci": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "DctDcgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "DctAddr": .ColumnType() = adVarWChar: .ColumnWidth() = 250: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "DctTelNo": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "DctEmail": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "DctAhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "DctShare": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "DctRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'.PrimaryKey = "DctCode"
'Rem index definition
'.AddIndex: .IndexName() = "DctName": .IndexUnique() = True: .IndexColumn1() = "DctName"
'
'.CreateTable dbPmtCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "DoctMast_Log"
'Rem field definitions
'.AddColumn: .ColumnName() = "DctCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "DctName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "DctSpeci": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "DctDcgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "DctAddr": .ColumnType() = adVarWChar: .ColumnWidth() = 250: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "DctTelNo": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "DctEmail": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "DctAhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "DctShare": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "DctRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'Rem .PrimaryKey = "DctCode"
'Rem index definition
'.AddIndex: .IndexName() = "DctCode": .IndexUnique() = True: .IndexColumn1() = "DctCode"
'.AddIndex: .IndexName() = "DctName": .IndexUnique() = True: .IndexColumn1() = "DctName"
'
'.CreateTable dbPmtCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "DoctRoleMst"
'Rem field definitions
'.AddColumn: .ColumnName() = "DrlCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
'.AddColumn: .ColumnName() = "DrlName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "DrlRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'.PrimaryKey = "DrlCode"
'Rem index definition
'.AddIndex: .IndexName() = "DrlName": .IndexUnique() = True: .IndexColumn1() = "DrlName"
'
'.CreateTable dbPmtCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "DoctRoleMst_Log"
'Rem field definitions
'.AddColumn: .ColumnName() = "DrlCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "DrlName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "DrlRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'Rem .PrimaryKey = "DrlCode"
'Rem index definition
'.AddIndex: .IndexName() = "DrlCode": .IndexUnique() = True: .IndexColumn1() = "DrlCode"
'.AddIndex: .IndexName() = "DrlName": .IndexUnique() = True: .IndexColumn1() = "DrlName"
'
'.CreateTable dbPmtCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "RefByMast"
'Rem field definitions
'.AddColumn: .ColumnName() = "RByCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
'.AddColumn: .ColumnName() = "RByName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "RBySpeci": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "RByRfgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "RByAddr": .ColumnType() = adVarWChar: .ColumnWidth() = 250: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "RByTelNo": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "RByEmail": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "RByAhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "RByShare": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "RByRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'.PrimaryKey = "RByCode"
'Rem index definition
'.AddIndex: .IndexName() = "RByName": .IndexUnique() = True: .IndexColumn1() = "RByName"
'
'.CreateTable dbPmtCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "RefByMast_Log"
'Rem field definitions
'.AddColumn: .ColumnName() = "RByCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "RByName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "RBySpeci": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "RByRfgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "RByAddr": .ColumnType() = adVarWChar: .ColumnWidth() = 250: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "RByTelNo": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "RByEmail": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "RByAhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "RByShare": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "RByRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'Rem .PrimaryKey = "RByCode"
'Rem index definition
'.AddIndex: .IndexName() = "RByCode": .IndexUnique() = True: .IndexColumn1() = "RByCode"
'.AddIndex: .IndexName() = "RByName": .IndexUnique() = True: .IndexColumn1() = "RByName"
'
'.CreateTable dbPmtCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "RefToMast"
'Rem field definitions
'.AddColumn: .ColumnName() = "RToCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
'.AddColumn: .ColumnName() = "RToName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "RToSpeci": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "RToRfgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "RToAddr": .ColumnType() = adVarWChar: .ColumnWidth() = 250: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "RToTelNo": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "RToEmail": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "RToAhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "RToShare": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "RToRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'.PrimaryKey = "RToCode"
'Rem index definition
'.AddIndex: .IndexName() = "RToName": .IndexUnique() = True: .IndexColumn1() = "RToName"
'
'.CreateTable dbPmtCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "RefToMast_Log"
'Rem field definitions
'.AddColumn: .ColumnName() = "RToCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "RToName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "RToSpeci": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "RToRfgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "RToAddr": .ColumnType() = adVarWChar: .ColumnWidth() = 250: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "RToTelNo": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "RToEmail": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "RToAhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "RToShare": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "RToRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'Rem .PrimaryKey = "RToCode"
'Rem index definition
'.AddIndex: .IndexName() = "RToCode": .IndexUnique() = True: .IndexColumn1() = "RToCode"
'.AddIndex: .IndexName() = "RToName": .IndexUnique() = True: .IndexColumn1() = "RToName"
'
'.CreateTable dbPmtCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "ServGrpMst"
'Rem field definitions
'.AddColumn: .ColumnName() = "SgpCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
'.AddColumn: .ColumnName() = "SgpName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "SgpIndex": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SgpExpanded": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SgpEditable": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SgpExtRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SgpDctwseRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SgpPcgwseRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SgpRBywseRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SgpRTowseRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SgpTimewseRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SgpExtDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SgpDctwseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SgpPcgwseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SgpRBywseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SgpRTowseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SgpTimewseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SgpExtBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SgpDctwseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SgpPcgwseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SgpRBywseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SgpRTowseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SgpTimewseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SgpExtShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SgpDctwseShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SgpPcgwseShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SgpRBywseShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SgpRTowseShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SgpTimewseShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SgpShowInList": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SgpRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'.PrimaryKey = "SgpCode"
'Rem index definition
'.AddIndex: .IndexName() = "SgpName": .IndexUnique() = True: .IndexColumn1() = "SgpName"
'
'.CreateTable dbPmtCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "ServGrpMst_Log"
'Rem field definitions
'.AddColumn: .ColumnName() = "SgpCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "SgpName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "SgpIndex": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SgpExpanded": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SgpEditable": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SgpExtRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SgpDctwseRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SgpPcgwseRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SgpRBywseRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SgpRTowseRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SgpTimewseRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SgpExtDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SgpDctwseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SgpPcgwseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SgpRBywseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SgpRTowseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SgpTimewseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SgpExtBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SgpDctwseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SgpPcgwseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SgpRBywseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SgpRTowseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SgpTimewseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SgpExtShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SgpDctwseShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SgpPcgwseShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SgpRBywseShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SgpRTowseShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SgpTimewseShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SgpShowInList": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SgpRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'Rem .PrimaryKey = "SgpCode"
'Rem index definition
'.AddIndex: .IndexName() = "SgpCode": .IndexUnique() = True: .IndexColumn1() = "SgpCode"
'.AddIndex: .IndexName() = "SgpName": .IndexUnique() = True: .IndexColumn1() = "SgpName"
'
'.CreateTable dbPmtCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "ServMast"
'Rem field definitions
'.AddColumn: .ColumnName() = "SrvCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
'.AddColumn: .ColumnName() = "SrvName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "SrvSgpCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvAhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvIndex": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvOpdGenChg": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvOpdEmgChg": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvIpdGenChg": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvIpdEmgChg": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvLabGenChg": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvLabEmgChg": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvMultiDctIncl": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvAutoInsIpdBill": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvAutoCalcIpdBill": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvUnitEditable": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvRateEditable": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvAmtEditable": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvInfAllowed": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvDefAllowed": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvDiscAllowed": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvDctwseRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvPcgwseRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvRBywseRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvRTowseRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvTimewseRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvDctwseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvPcgwseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvRBywseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvRTowseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvTimewseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvDctwseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvPcgwseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvRBywseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvRTowseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvTimewseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvDctwseShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvPcgwseShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvRBywseShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvRTowseShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvTimewseShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvShowInList": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'.PrimaryKey = "SrvCode"
'Rem index definition
'.AddIndex: .IndexName() = "SrvName": .IndexUnique() = True: .IndexColumn1() = "SrvName"
'
'.CreateTable dbPmtCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "ServMast_Log"
'Rem field definitions
'.AddColumn: .ColumnName() = "SrvCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "SrvName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "SrvSgpCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvAhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvIndex": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvOpdGenChg": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvOpdEmgChg": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvIpdGenChg": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvIpdEmgChg": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvLabGenChg": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvLabEmgChg": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvMultiDctIncl": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvAutoInsIpdBill": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvAutoCalcIpdBill": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvUnitEditable": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvRateEditable": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvAmtEditable": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvInfAllowed": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvDefAllowed": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvDiscAllowed": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvDctwseRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvPcgwseRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvRBywseRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvRTowseRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvTimewseRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvDctwseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvPcgwseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvRBywseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvRTowseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvTimewseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvDctwseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvPcgwseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvRBywseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvRTowseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvTimewseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvDctwseShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvPcgwseShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvRBywseShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvRTowseShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvTimewseShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvShowInList": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrvRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'Rem .PrimaryKey = "SrvCode"
'Rem index definition
'.AddIndex: .IndexName() = "SrvCode": .IndexUnique() = True: .IndexColumn1() = "SrvCode"
'.AddIndex: .IndexName() = "SrvName": .IndexUnique() = True: .IndexColumn1() = "SrvName"
'
'.CreateTable dbPmtCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "ServRateMst"
'Rem field definitions
'.AddColumn: .ColumnName() = "SrmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "SrmICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
'.AddColumn: .ColumnName() = "SrmSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "SrmWefDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "SrmPcgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "SrmDctCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrmRByCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrmRToCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrmStartTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrmEndTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrmRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrmDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrmInfByPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrmDefByPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrmSharePer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrmShareAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrmRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrmRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "SrmCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'.PrimaryKey = "SrmICode"
'Rem index definition
'.AddIndex: .IndexName() = "SrmCodeICode": .IndexColumn1() = "SrmCode": .IndexColumn2() = "SrmICode"
'.AddIndex: .IndexName() = "SrmCodeSNo": .IndexColumn1() = "SrmCode": .IndexColumn2() = "SrmSno"
'.AddIndex: .IndexName() = "SrmWefDate": .IndexColumn1() = "SrmWefDate"
'
'.CreateTable dbPmtCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "ServRateMst_Log"
'Rem field definitions
'.AddColumn: .ColumnName() = "SrmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "SrmICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "SrmSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "SrmWefDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "SrmPcgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "SrmDctCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrmRByCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrmRToCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrmStartTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrmEndTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrmRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrmDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrmInfByPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrmDefByPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrmSharePer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrmShareAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrmRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SrmRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "SrmCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'Rem .PrimaryKey = "SrmICode"
'Rem index definition
'.AddIndex: .IndexName() = "SrmICode": .IndexUnique() = True: .IndexColumn1() = "SrmICode"
'.AddIndex: .IndexName() = "SrmCodeICode": .IndexColumn1() = "SrmCode": .IndexColumn2() = "SrmICode"
'.AddIndex: .IndexName() = "SrmCodeSNo": .IndexColumn1() = "SrmCode": .IndexColumn2() = "SrmSno"
'.AddIndex: .IndexName() = "SrmWefDate": .IndexColumn1() = "SrmWefDate"
'
'.CreateTable dbPmtCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "PatMast"
'Rem field definitions
'.AddColumn: .ColumnName() = "PttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
'.AddColumn: .ColumnName() = "PttName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "PttRegNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PttRegDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PttAhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PttPcgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PttSex": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PttAgeAsOnDt": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PttDob": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PttRefRela": .ColumnType() = adVarWChar: .ColumnWidth() = 5: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PttRefName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PttAddr": .ColumnType() = adVarWChar: .ColumnWidth() = 250: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PttAraCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PttStnCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PttTelNo": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PttSMSNo": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PttEmail": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PttInfAllowed": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PttDefAllowed": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PttDiscAllowed": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PttDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PttShowInList": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PttRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PttRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'.PrimaryKey = "PttCode"
'Rem index definition
'.AddIndex: .IndexName() = "PttName": .IndexColumn1() = "PttName"
'.AddIndex: .IndexName() = "PttRegNo": .IndexColumn1() = "PttRegNo"
'
'.CreateTable dbPmtCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "PatMast_Log"
'Rem field definitions
'.AddColumn: .ColumnName() = "PttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "PttName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "PttRegNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PttRegDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PttAhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PttPcgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PttSex": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PttAgeAsOnDt": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PttDob": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PttRefRela": .ColumnType() = adVarWChar: .ColumnWidth() = 5: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PttRefName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PttAddr": .ColumnType() = adVarWChar: .ColumnWidth() = 250: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PttAraCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PttStnCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PttTelNo": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PttSMSNo": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PttEmail": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PttInfAllowed": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PttDefAllowed": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PttDiscAllowed": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PttDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PttShowInList": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PttRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PttRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'Rem .PrimaryKey = "PttCode"
'Rem index definition
'.AddIndex: .IndexName() = "PttCode": .IndexUnique() = True: .IndexColumn1() = "PttCode"
'.AddIndex: .IndexName() = "PttName": .IndexColumn1() = "PttName"
'.AddIndex: .IndexName() = "PttRegNo": .IndexColumn1() = "PttRegNo"
'
'.CreateTable dbPmtCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "DiagMast"
'Rem field definitions
'.AddColumn: .ColumnName() = "DigCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
'.AddColumn: .ColumnName() = "DigName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "DigRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'.PrimaryKey = "DigCode"
'Rem index definition
'.AddIndex: .IndexName() = "DigName": .IndexUnique() = True: .IndexColumn1() = "DigName"
'
'.CreateTable dbPmtCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "DiagMast_Log"
'Rem field definitions
'.AddColumn: .ColumnName() = "DigCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "DigName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "DigRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'Rem .PrimaryKey = "DigCode"
'Rem index definition
'.AddIndex: .IndexName() = "DigCode": .IndexUnique() = True: .IndexColumn1() = "DigCode"
'.AddIndex: .IndexName() = "DigName": .IndexUnique() = True: .IndexColumn1() = "DigName"
'
'.CreateTable dbPmtCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "FloorMast"
'Rem field definitions
'.AddColumn: .ColumnName() = "FlrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
'.AddColumn: .ColumnName() = "FlrName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "FlrShowInList": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "FlrRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'Rem primary key definition
'.PrimaryKey = "FlrCode"
'Rem index definition
'.AddIndex: .IndexName() = "FlrName": .IndexUnique() = True: .IndexColumn1() = "FlrName"
'
'.CreateTable dbPmtCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "FloorMast_Log"
'Rem field definitions
'.AddColumn: .ColumnName() = "FlrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "FlrName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "FlrShowInList": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "FlrRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'Rem primary key definition
'Rem .PrimaryKey = "FlrCode"
'Rem index definition
'.AddIndex: .IndexName() = "FlrCode": .IndexUnique() = True: .IndexColumn1() = "FlrCode"
'.AddIndex: .IndexName() = "FlrName": .IndexUnique() = True: .IndexColumn1() = "FlrName"
'
'.CreateTable dbPmtCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "WardMast"
'Rem field definitions
'.AddColumn: .ColumnName() = "WrdCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
'.AddColumn: .ColumnName() = "WrdName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "WrdShowInList": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "WrdRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'Rem primary key definition
'.PrimaryKey = "WrdCode"
'Rem index definition
'.AddIndex: .IndexName() = "WrdName": .IndexUnique() = True: .IndexColumn1() = "WrdName"
'
'.CreateTable dbPmtCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "WardMast_Log"
'Rem field definitions
'.AddColumn: .ColumnName() = "WrdCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "WrdName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "WrdShowInList": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "WrdRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'Rem primary key definition
'Rem .PrimaryKey = "WrdCode"
'Rem index definition
'.AddIndex: .IndexName() = "WrdCode": .IndexUnique() = True: .IndexColumn1() = "WrdCode"
'.AddIndex: .IndexName() = "WrdName": .IndexUnique() = True: .IndexColumn1() = "WrdName"
'
'.CreateTable dbPmtCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "BedMast"
'Rem field definitions
'.AddColumn: .ColumnName() = "BdmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
'.AddColumn: .ColumnName() = "BdmName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "BdmFlrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "BdmWrdCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "BdmSrvCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "BdmIndex": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "BdmCharges": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "BdmDiscAllowed": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "BdmDiscPer": .ColumnType() = adSingle: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "BdmChkOutTimeBasis": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "BdmChkTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "BdmFreeAllot": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "BdmRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "BdmShowInList": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "BdmRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'.PrimaryKey = "BdmCode"
'Rem index definition
'.AddIndex: .IndexName() = "BdmName": .IndexUnique() = True: .IndexColumn1() = "BdmName"
'
'.CreateTable dbPmtCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "BedMast_Log"
'Rem field definitions
'.AddColumn: .ColumnName() = "BdmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "BdmName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "BdmFlrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "BdmWrdCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "BdmSrvCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "BdmIndex": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "BdmCharges": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "BdmDiscAllowed": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "BdmDiscPer": .ColumnType() = adSingle: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "BdmChkOutTimeBasis": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "BdmChkTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "BdmFreeAllot": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "BdmRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "BdmShowInList": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "BdmRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'Rem .PrimaryKey = "BdmCode"
'Rem index definition
'.AddIndex: .IndexName() = "BdmCode": .IndexUnique() = True: .IndexColumn1() = "BdmCode"
'.AddIndex: .IndexName() = "BdmName": .IndexUnique() = True: .IndexColumn1() = "BdmName"
'
'.CreateTable dbPmtCatalog
'End With





InfoBox dbPmtCatalog.ActiveConnection.Properties("Data Source Name") & ", Done !!!"

CloseDataSource dbPmtDatabase

EndSub:
Set dbPmtCatalog = Nothing
Set dbPmtDatabase = Nothing
Set clsDB = Nothing
Exit Sub

End Sub

Public Sub CreatePmtTranDatabase(ByVal mAddMode As Boolean)
Dim mTableStru As adTableStru, dbPmtDatabase As New ADODB.Connection, dbPmtCatalog As New ADOX.Catalog, clsDB As clsDataStru

If mAddMode = True Then
    If Dir(dbPmtDatabaseFullPath) = "" Then
        dbPmtCatalog.Create "Provider=" & DbProvider & ";Data Source=" & dbPmtDatabaseFullPath
        Set dbPmtCatalog = Nothing
    Else
        ErrorBox "Database " & dbPmtDatabaseFullPath & " already exist !!!"
        GoTo EndSub
    End If
End If

OpenPmtDataSource dbPmtDatabase, mExclusiveMode:=True
If dbPmtDatabase.State <> 1 Then
    ErrorBox Err.Description
    GoTo EndSub
End If
Set dbPmtCatalog.ActiveConnection = dbPmtDatabase
Set clsDB = New clsDataStru

With clsDB
.ClearTableStru
.TableName = "JobRcHdr"
Rem field definitions
.AddColumn: .ColumnName() = "JrhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "JrhVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrhPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JrhVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrhPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JrhStkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrhDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrhTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JrhTrnRefNo": .ColumnType() = adVarWChar: .ColumnWidth() = 15: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrhTrnRefDt": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrhPrtCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrhQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JrhAmount": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JrhRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JrhRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrhCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "JrhCode"
Rem index definition
.AddIndex: .IndexName() = "JrhVtmCodeVchNo": .IndexColumn1() = "JrhVtmCode": .IndexColumn2() = "JrhVchNo"
.AddIndex: .IndexName() = "JrhDate": .IndexColumn1() = "JrhDate"
.AddIndex: .IndexName() = "JrhPrtCode": .IndexColumn1() = "JrhPrtCode"

.CreateTable dbPmtCatalog
End With

With clsDB
.ClearTableStru
.TableName = "JobRcHdr_Log"
Rem field definitions
.AddColumn: .ColumnName() = "JrhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrhVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrhPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JrhVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrhPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JrhStkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrhDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrhTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JrhTrnRefNo": .ColumnType() = adVarWChar: .ColumnWidth() = 15: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrhTrnRefDt": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrhPrtCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrhQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JrhAmount": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JrhRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JrhRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrhCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "JrhCode"
Rem index definition
.AddIndex: .IndexName() = "JrhCode": .IndexUnique() = True: .IndexColumn1() = "JrhCode"
.AddIndex: .IndexName() = "JrhVtmCodeVchNo": .IndexColumn1() = "JrhVtmCode": .IndexColumn2() = "JrhVchNo"
.AddIndex: .IndexName() = "JrhDate": .IndexColumn1() = "JrhDate"
.AddIndex: .IndexName() = "JrhPrtCode": .IndexColumn1() = "JrhPrtCode"

.CreateTable dbPmtCatalog
End With

With clsDB
.ClearTableStru
.TableName = "JobRcpt"
Rem field definitions
.AddColumn: .ColumnName() = "JrcCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrcICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "JrcSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrcStkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrcStkICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrcDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrcPrtCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrcSimCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JrcItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JrcItrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JrcSimRefNo": .ColumnType() = adVarWChar: .ColumnWidth() = 25: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrcNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 150: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JrcQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JrcRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JrcAmount": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JrcRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JrcRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrcCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "JrcICode"
Rem index definition
.AddIndex: .IndexName() = "JrcCodeICode": .IndexColumn1() = "JrcCode": .IndexColumn2() = "JrcICode"
.AddIndex: .IndexName() = "JrcCodeSNo": .IndexColumn1() = "JrcCode": .IndexColumn2() = "JrcSno"
.AddIndex: .IndexName() = "JrcDate": .IndexColumn1() = "JrcDate"

.CreateTable dbPmtCatalog
End With

With clsDB
.ClearTableStru
.TableName = "JobRcpt_Log"
Rem field definitions
.AddColumn: .ColumnName() = "JrcCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrcICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrcSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrcStkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrcStkICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrcDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrcPrtCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrcSimCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JrcItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JrcItrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JrcSimRefNo": .ColumnType() = adVarWChar: .ColumnWidth() = 25: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrcNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 150: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JrcQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JrcRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JrcAmount": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JrcRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JrcRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JrcCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "JrcICode"
Rem index definition
.AddIndex: .IndexName() = "JrcICode": .IndexUnique() = True: .IndexColumn1() = "JrcICode"
.AddIndex: .IndexName() = "JrcCodeICode": .IndexColumn1() = "JrcCode": .IndexColumn2() = "JrcICode"
.AddIndex: .IndexName() = "JrcCodeSNo": .IndexColumn1() = "JrcCode": .IndexColumn2() = "JrcSno"
.AddIndex: .IndexName() = "JrcDate": .IndexColumn1() = "JrcDate"

.CreateTable dbPmtCatalog
End With

With clsDB
.ClearTableStru
.TableName = "JobIsHdr"
Rem field definitions
.AddColumn: .ColumnName() = "JihCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "JihVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JihPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JihVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JihPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JihStkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JihDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JihTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JihTrnRefNo": .ColumnType() = adVarWChar: .ColumnWidth() = 15: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JihTrnRefDt": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JihPrtCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JihQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JihAmount": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JihRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JihRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JihCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "JihCode"
Rem index definition
.AddIndex: .IndexName() = "JihVtmCodeVchNo": .IndexColumn1() = "JihVtmCode": .IndexColumn2() = "JihVchNo"
.AddIndex: .IndexName() = "JihDate": .IndexColumn1() = "JihDate"
.AddIndex: .IndexName() = "JihPrtCode": .IndexColumn1() = "JihPrtCode"

.CreateTable dbPmtCatalog
End With

With clsDB
.ClearTableStru
.TableName = "JobIsHdr_Log"
Rem field definitions
.AddColumn: .ColumnName() = "JihCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JihVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JihPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JihVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JihPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JihStkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JihDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JihTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JihTrnRefNo": .ColumnType() = adVarWChar: .ColumnWidth() = 15: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JihTrnRefDt": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JihPrtCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JihQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JihAmount": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JihRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JihRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JihCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "JihCode"
Rem index definition
.AddIndex: .IndexName() = "JihCode": .IndexUnique() = True: .IndexColumn1() = "JihCode"
.AddIndex: .IndexName() = "JihVtmCodeVchNo": .IndexColumn1() = "JihVtmCode": .IndexColumn2() = "JihVchNo"
.AddIndex: .IndexName() = "JihDate": .IndexColumn1() = "JihDate"
.AddIndex: .IndexName() = "JihPrtCode": .IndexColumn1() = "JihPrtCode"

.CreateTable dbPmtCatalog
End With

With clsDB
.ClearTableStru
.TableName = "JobIssu"
Rem field definitions
.AddColumn: .ColumnName() = "JisCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JisICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "JisSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JisStkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JisStkICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JisDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JisPrtCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JisSimCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JisItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JisItrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JisSimRefNo": .ColumnType() = adVarWChar: .ColumnWidth() = 25: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JisJrcCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JisJrcICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JisNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 150: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JisQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JisRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JisAmount": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JisRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JisRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JisCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "JisICode"
Rem index definition
.AddIndex: .IndexName() = "JisCodeICode": .IndexColumn1() = "JisCode": .IndexColumn2() = "JisICode"
.AddIndex: .IndexName() = "JisCodeSNo": .IndexColumn1() = "JisCode": .IndexColumn2() = "JisSno"
.AddIndex: .IndexName() = "JisDate": .IndexColumn1() = "JisDate"
.AddIndex: .IndexName() = "JisJrcCodeICode": .IndexColumn1() = "JisJrcCode": .IndexColumn2() = "JisJrcICode"

.CreateTable dbPmtCatalog
End With

With clsDB
.ClearTableStru
.TableName = "JobIssu_Log"
Rem field definitions
.AddColumn: .ColumnName() = "JisCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JisICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JisSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JisStkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JisStkICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JisDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JisPrtCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JisSimCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JisItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JisItrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JisSimRefNo": .ColumnType() = adVarWChar: .ColumnWidth() = 25: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JisJrcCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JisJrcICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JisNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 150: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JisQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JisRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JisAmount": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JisRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "JisRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "JisCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "JisICode"
Rem index definition
.AddIndex: .IndexName() = "JisICode": .IndexUnique() = True: .IndexColumn1() = "JisICode"
.AddIndex: .IndexName() = "JisCodeICode": .IndexColumn1() = "JisCode": .IndexColumn2() = "JisICode"
.AddIndex: .IndexName() = "JisCodeSNo": .IndexColumn1() = "JisCode": .IndexColumn2() = "JisSno"
.AddIndex: .IndexName() = "JisDate": .IndexColumn1() = "JisDate"
.AddIndex: .IndexName() = "JisJrcCodeICode": .IndexColumn1() = "JisJrcCode": .IndexColumn2() = "JisJrcICode"

.CreateTable dbPmtCatalog
End With
















InfoBox dbPmtCatalog.ActiveConnection.Properties("Data Source Name") & ", Done !!!"

CloseDataSource dbPmtDatabase

EndSub:
Set dbPmtCatalog = Nothing
Set dbPmtDatabase = Nothing
Set clsDB = Nothing
Exit Sub

End Sub

Public Sub CreatePmtComDatabase()
Dim mTableStru As adTableStru, dbComDatabase As New ADODB.Connection, dbComCatalog As New ADOX.Catalog, clsDB As clsDataStru

Rem must be created from common data structure i.e. Acnting
'''If Dir(dbComDatabaseFullPath) = "" Then
'''    dbComCatalog.Create "Provider=" & DbProvider & ";Data Source=" & dbComDatabaseFullPath
'''    Set dbComCatalog = Nothing
'''End If
OpenComDataSource dbComDatabase, mExclusiveMode:=True
If dbComDatabase.State <> 1 Then
    ErrorBox Err.Description
    GoTo EndSub
End If
Set dbComCatalog.ActiveConnection = dbComDatabase
Set clsDB = New clsDataStru

clsDB.ClearTableStru    ' by programmer mistake it is not getting used anywhere in link table procedure

Rem link table *****************************************************************************
With clsDB
.ClearLinkStru
.AddLink: .LinkTableName() = "SubItmMast": .LinkDbSource() = dbPmtDatabaseFullPath
.AddLink: .LinkTableName() = "PartyMast": .LinkDbSource() = dbPmtDatabaseFullPath
.AddLink: .LinkTableName() = "JobRcHdr": .LinkDbSource() = dbPmtDatabaseFullPath
.AddLink: .LinkTableName() = "JobRcpt": .LinkDbSource() = dbPmtDatabaseFullPath
.AddLink: .LinkTableName() = "JobIsHdr": .LinkDbSource() = dbPmtDatabaseFullPath
.AddLink: .LinkTableName() = "JobIssu": .LinkDbSource() = dbPmtDatabaseFullPath

.CreateLink dbComCatalog
End With

'With clsDB
'.ClearViewStru
'.ViewName = "vewOutdReg"
'.CommandStr = "SELECT OutdReg.*, PatMast.*, ServMast.*, DoctMast.*, RefByMast.*, StsnMast.*, AreaMast.*" _
'    & " FROM (((((OutdReg INNER JOIN DoctMast ON OutdReg.OpgCDctCode = DoctMast.DctCode) LEFT JOIN RefByMast ON OutdReg.OpgRByCode = RefByMast.RByCode) INNER JOIN PatMast ON OutdReg.OpgPttCode = PatMast.PttCode) INNER JOIN AreaMast ON PatMast.PttAraCode = AreaMast.AraCode) INNER JOIN StsnMast ON PatMast.PttStnCode = StsnMast.StnCode) INNER JOIN ServMast ON OutdReg.OpgSrvCode = ServMast.SrvCode"
'
'.CreateView dbComCatalog
'End With

InfoBox dbComCatalog.ActiveConnection.Properties("Data Source Name") & ", Done !!!"

CloseDataSource dbComDatabase

EndSub:
Set dbComCatalog = Nothing
Set dbComDatabase = Nothing
Set clsDB = Nothing
Exit Sub

End Sub

